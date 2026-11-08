import type { APIRoute } from 'astro';
import { getAdminSession } from '../../../../lib/auth';
import { supabaseAdmin } from '../../../../lib/supabase/admin';

export const POST: APIRoute = async ({ request, cookies }) => {
  try {
    // 1. Auth check
    const adminUser = await getAdminSession(cookies);
    if (!adminUser) {
      return new Response(
        JSON.stringify({ success: false, message: 'Tidak terotentikasi sebagai admin.' }),
        { status: 401, headers: { 'Content-Type': 'application/json' } }
      );
    }

    const { application_id, new_status, admin_notes } = await request.json();

    if (!application_id || !new_status) {
      return new Response(
        JSON.stringify({ success: false, message: 'ID pendaftaran dan status baru wajib diisi.' }),
        { status: 400, headers: { 'Content-Type': 'application/json' } }
      );
    }

    // 2. Ambil data pendaftaran lama
    const { data: currentApp, error: fetchErr } = await supabaseAdmin
      .from('applications')
      .select('id, status, full_name, email, whatsapp, application_number')
      .eq('id', application_id)
      .single();

    if (fetchErr || !currentApp) {
      return new Response(
        JSON.stringify({ success: false, message: 'Data pendaftaran tidak ditemukan.' }),
        { status: 404, headers: { 'Content-Type': 'application/json' } }
      );
    }

    const oldStatus = currentApp.status;

    // 3. Update status pendaftaran di tabel applications
    const { error: updateErr } = await supabaseAdmin
      .from('applications')
      .update({
        status: new_status,
        admin_notes: admin_notes || null,
        updated_at: new Date().toISOString(),
      })
      .eq('id', application_id);

    if (updateErr) {
      console.error('Update status error:', updateErr);
      return new Response(
        JSON.stringify({ success: false, message: 'Gagal memperbarui status di database.' }),
        { status: 500, headers: { 'Content-Type': 'application/json' } }
      );
    }

    // 4. Catat riwayat perubahan ke application_logs (Audit Trail)
    await supabaseAdmin.from('application_logs').insert({
      application_id,
      old_status: oldStatus,
      new_status: new_status,
      changed_by: adminUser.id,
      admin_note: admin_notes || `Status diubah oleh ${adminUser.full_name} dari ${oldStatus} menjadi ${new_status}.`,
    });

    return new Response(
      JSON.stringify({
        success: true,
        message: `Status pendaftaran ${currentApp.application_number} berhasil diubah menjadi ${new_status}.`,
      }),
      { status: 200, headers: { 'Content-Type': 'application/json' } }
    );
  } catch (err: any) {
    console.error('Error updating application status:', err);
    return new Response(
      JSON.stringify({ success: false, message: 'Terjadi kegagalan server.', detail: err.message }),
      { status: 500, headers: { 'Content-Type': 'application/json' } }
    );
  }
};
