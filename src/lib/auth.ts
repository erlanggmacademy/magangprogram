import type { AstroCookies } from 'astro';
import { supabaseAdmin } from './supabase/admin';

export interface AdminUser {
  id: string;
  email: string;
  full_name: string;
  role: 'super_admin' | 'admin' | 'editor';
}

/**
 * Memverifikasi session admin dari cookie HTTP
 */
export async function getAdminSession(cookies: AstroCookies): Promise<AdminUser | null> {
  const accessToken = cookies.get('sb-access-token')?.value;
  if (!accessToken) {
    return null;
  }

  try {
    // 1. Verifikasi token user dari Supabase Auth
    const { data: { user }, error: userError } = await supabaseAdmin.auth.getUser(accessToken);
    if (userError || !user) {
      return null;
    }

    // 2. Verifikasi hak akses admin di tabel admin_profiles
    const { data: profile, error: profileError } = await supabaseAdmin
      .from('admin_profiles')
      .select('full_name, role')
      .eq('id', user.id)
      .single();

    if (profileError || !profile) {
      return null;
    }

    return {
      id: user.id,
      email: user.email || '',
      full_name: profile.full_name || 'Admin',
      role: profile.role || 'admin',
    };
  } catch (err) {
    console.error('Error verifying admin session:', err);
    return null;
  }
}

