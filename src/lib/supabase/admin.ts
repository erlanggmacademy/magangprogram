import { createClient } from '@supabase/supabase-js';

const supabaseUrl =
  import.meta.env.PUBLIC_SUPABASE_URL ||
  (typeof process !== 'undefined' ? process.env?.PUBLIC_SUPABASE_URL : '') ||
  '';

const supabaseServiceRoleKey =
  import.meta.env.SUPABASE_SERVICE_ROLE_KEY ||
  (typeof process !== 'undefined' ? process.env?.SUPABASE_SERVICE_ROLE_KEY : '') ||
  '';

/**
 * Admin Supabase Client (HANYA DIGUNAKAN DI SERVER / API ENDPOINTS)
 * Memiliki hak akses penuh (bypass RLS) untuk mencatat pendaftaran, mengelola dokumen, dll.
 * JANGAN PERNAH diekspos ke client-side browser!
 */
export const supabaseAdmin = createClient(supabaseUrl, supabaseServiceRoleKey, {
  auth: {
    autoRefreshToken: false,
    persistSession: false,
  },
});
