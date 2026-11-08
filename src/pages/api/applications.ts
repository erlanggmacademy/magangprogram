import type { APIRoute } from 'astro';
import { z } from 'zod';
import { supabaseAdmin } from '../../lib/supabase/admin';

// Skema validasi Zod sesuai PRD Bab 4.7 & 8.2
const applicationSchema = z.object({
  full_name: z.string().min(3, 'Nama lengkap minimal 3 karakter'),
  email: z.string().email('Format email tidak valid'),
  whatsapp: z.string().min(9, 'Nomor WhatsApp minimal 9 digit'),
  participant_type: z.enum(['smk', 'mahasiswa'], {
    errorMap: () => ({ message: 'Pilih jenis peserta (SMK atau Mahasiswa)' }),
  }),
  institution: z.string().min(2, 'Nama sekolah atau kampus wajib diisi'),
  major: z.string().min(2, 'Jurusan wajib diisi'),
  class_or_semester: z.string().min(1, 'Kelas atau semester wajib diisi'),
  program_id: z.string().uuid('Pilih program magang yang valid'),
  preferred_field: z.string().min(2, 'Bidang pilihan wajib diisi'),
  duration: z.string().min(1, 'Durasi magang wajib dipilih'),
  start_date: z.string().regex(/^\d{4}-\d{2}-\d{2}$/, 'Format tanggal tidak valid (YYYY-MM-DD)'),
  internship_mode: z.enum(['online', 'offline', 'hybrid'], {
    errorMap: () => ({ message: 'Pilih metode pelaksanaan magang' }),
  }),
  portfolio_url: z.string().url('Format URL portofolio tidak valid').optional().or(z.literal('')),
  notes: z.string().optional().default(''),
  privacy_consent: z.boolean().refine(val => val === true, {
    message: 'Anda harus menyetujui kebijakan privasi data',
  }),
});

export const POST: APIRoute = async ({ request }) => {
  try {
    const body = await request.json();

    // 1. Validasi Input Server-Side
    const parseResult = applicationSchema.safeParse(body);
    if (!parseResult.success) {
      const errors = parseResult.error.flatten().fieldErrors;
      return new Response(
        JSON.stringify({
          success: false,
          message: 'Validasi gagal, silakan periksa data yang Anda masukkan.',
          errors,
        }),
        { status: 400, headers: { 'Content-Type': 'application/json' } }
      );
    }

    const validData = parseResult.data;

    // 2. Generate Nomor Pendaftaran Unik (Contoh: MKI-202611-4821)
    const now = new Date();
    const yearMonth = `${now.getFullYear()}${String(now.getMonth() + 1).padStart(2, '0')}`;
    const randomSuffix = Math.floor(1000 + Math.random() * 9000);
    const applicationNumber = `MKI-${yearMonth}-${randomSuffix}`;

    // 3. Simpan ke Tabel applications di Supabase menggunakan supabaseAdmin (Server-Side)
    const { data: insertedApp, error: insertError } = await supabaseAdmin
      .from('applications')
      .insert({
        application_number: applicationNumber,
        full_name: validData.full_name,
        email: validData.email,
        whatsapp: validData.whatsapp,
        participant_type: validData.participant_type,
        institution: validData.institution,
        major: validData.major,
        class_or_semester: validData.class_or_semester,
        program_id: validData.program_id,
        preferred_field: validData.preferred_field,
        duration: validData.duration,
        start_date: validData.start_date,
        internship_mode: validData.internship_mode,
        portfolio_url: validData.portfolio_url || null,
        notes: validData.notes || null,
        status: 'pending',
        privacy_consent_at: now.toISOString(),
      })
      .select('id, application_number, full_name, institution, preferred_field')
      .single();

    if (insertError) {
      console.error('Error inserting application to Supabase:', insertError);
      return new Response(
        JSON.stringify({
          success: false,
          message: 'Terjadi kesalahan pada database saat menyimpan pendaftaran. Silakan coba kembali.',
          detail: insertError.message,
        }),
        { status: 500, headers: { 'Content-Type': 'application/json' } }
      );
    }

    // 4. Catat Log Awal di application_logs
    await supabaseAdmin.from('application_logs').insert({
      application_id: insertedApp.id,
      old_status: null,
      new_status: 'pending',
      admin_note: 'Pendaftaran mandiri melalui formulir online website.',
    });

    // 5. Siapkan Template Pesan WhatsApp Konfirmasi Otomatis
    const waNumber = '62895639068080';
    const waText = `Halo Admin, saya sudah mendaftar program magang dengan data:
*Nomor Registrasi:* ${insertedApp.application_number}
*Nama:* ${insertedApp.full_name}
*Asal Sekolah/Kampus:* ${insertedApp.institution}
*Bidang Pilihan:* ${insertedApp.preferred_field}

Mohon informasi terkait tahap seleksi dan jadwal konfirmasi selanjutnya. Terima kasih!`;

    const waUrl = `https://wa.me/${waNumber}?text=${encodeURIComponent(waText)}`;

    return new Response(
      JSON.stringify({
        success: true,
        message: 'Pendaftaran berhasil disimpan ke sistem!',
        application_number: insertedApp.application_number,
        full_name: insertedApp.full_name,
        whatsapp_url: waUrl,
      }),
      { status: 201, headers: { 'Content-Type': 'application/json' } }
    );
  } catch (err: any) {
    console.error('Unexpected error handling application:', err);
    return new Response(
      JSON.stringify({
        success: false,
        message: 'Terjadi kegagalan server saat memproses data.',
        detail: err.message,
      }),
      { status: 500, headers: { 'Content-Type': 'application/json' } }
    );
  }
};

