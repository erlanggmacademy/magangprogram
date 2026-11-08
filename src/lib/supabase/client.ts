import { createClient } from '@supabase/supabase-js';

const supabaseUrl =
  import.meta.env.PUBLIC_SUPABASE_URL ||
  (typeof process !== 'undefined' ? process.env?.PUBLIC_SUPABASE_URL : '') ||
  '';

const supabaseAnonKey =
  import.meta.env.PUBLIC_SUPABASE_ANON_KEY ||
  (typeof process !== 'undefined' ? process.env?.PUBLIC_SUPABASE_ANON_KEY : '') ||
  '';

/**
 * Public Supabase Client untuk query data publik di frontend/client (terikat aturan RLS)
 */
export const supabase = createClient(supabaseUrl, supabaseAnonKey);
