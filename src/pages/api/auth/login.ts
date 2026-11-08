import type { APIRoute } from 'astro';
import { supabase } from '../../../lib/supabase/client';
import { supabaseAdmin } from '../../../lib/supabase/admin';

export const POST: APIRoute = async ({ request, cookies }) => {
  try {
    const { email, password } = await request.json();

    if (!email || !password) {
      return new Response(
        JSON.stringify({ success: false, message: 'Email dan password wajib diisi.' }),
        { status: 400, headers: { 'Content-Type': 'application/json' } }
      );
    }

    // 1. Otentikasi kredensial ke Supabase Auth
    const { data, error } = await supabase.auth.signInWithPassword({
      email,
      password,
    });

    if (error || !data.user || !data.session) {
      return new Response(
        JSON.stringify({ success: false, message: 'Email atau password salah.' }),
        { status: 401, headers: { 'Content-Type': 'application/json' } }
      );
    }

    // 2. Verifikasi apakah user terdaftar di tabel admin_profiles
    const { data: profile, error: profError } = await supabaseAdmin
      .from('admin_profiles')
      .select('id, full_name, role')
      .eq('id', data.user.id)
      .single();

    if (profError || !profile) {
      // Sign out user jika bukan admin
      await supabase.auth.signOut();
      return new Response(
        JSON.stringify({ success: false, message: 'Akses ditolak. Akun Anda bukan akun administrator.' }),
        { status: 403, headers: { 'Content-Type': 'application/json' } }
      );
    }

    // 3. Simpan token ke HTTP-Only Cookies
    cookies.set('sb-access-token', data.session.access_token, {
      path: '/',
      httpOnly: true,
      sameSite: 'lax',
      maxAge: 60 * 60 * 24 * 7, // 7 hari
    });

    cookies.set('sb-refresh-token', data.session.refresh_token, {
      path: '/',
      httpOnly: true,
      sameSite: 'lax',
      maxAge: 60 * 60 * 24 * 7,
    });

    return new Response(
      JSON.stringify({
        success: true,
        message: 'Login berhasil!',
        redirect: '/admin',
      }),
      { status: 200, headers: { 'Content-Type': 'application/json' } }
    );
  } catch (err: any) {
    console.error('Login error:', err);
    return new Response(
      JSON.stringify({ success: false, message: 'Terjadi kesalahan sistem saat proses login.' }),
      { status: 500, headers: { 'Content-Type': 'application/json' } }
    );
  }
};

