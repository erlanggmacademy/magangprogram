import type { APIRoute } from 'astro';

export const POST: APIRoute = async ({ cookies }) => {
  cookies.delete('sb-access-token', { path: '/' });
  cookies.delete('sb-refresh-token', { path: '/' });

  return new Response(
    JSON.stringify({ success: true, redirect: '/admin/login' }),
    { status: 200, headers: { 'Content-Type': 'application/json' } }
  );
};

