import type { APIRoute } from 'astro';
import { getAdminSession } from '../../../../lib/auth';
import { supabaseAdmin } from '../../../../lib/supabase/admin';

export const POST: APIRoute = async ({ request, cookies }) => {
  try {
    const adminUser = await getAdminSession(cookies);
    if (!adminUser) {
      return new Response(JSON.stringify({ success: false, message: 'Unauthorized' }), { status: 401 });
    }

    const payload = await request.json();

    // Update first row of site_settings
    const { data: currentSettings } = await supabaseAdmin.from('site_settings').select('id').limit(1).single();
    
    if (currentSettings) {
      await supabaseAdmin.from('site_settings').update({
        org_name: payload.org_name,
        tagline: payload.tagline,
        description: payload.description,
        whatsapp_number: payload.whatsapp_number,
        email: payload.email,
        address: payload.address,
        instagram_url: payload.instagram_url,
        linkedin_url: payload.linkedin_url,
        tiktok_url: payload.tiktok_url,
        default_meta_title: payload.default_meta_title,
        default_meta_description: payload.default_meta_description,
        updated_at: new Date().toISOString(),
      }).eq('id', currentSettings.id);
    }

    return new Response(JSON.stringify({ success: true, message: 'Pengaturan website berhasil disimpan!' }), {
      status: 200,
      headers: { 'Content-Type': 'application/json' },
    });
  } catch (err: any) {
    console.error('Error updating settings:', err);
    return new Response(JSON.stringify({ success: false, message: 'Gagal menyimpan pengaturan.' }), { status: 500 });
  }
};
