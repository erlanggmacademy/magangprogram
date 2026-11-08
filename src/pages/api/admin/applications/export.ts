import type { APIRoute } from 'astro';
import { getAdminSession } from '../../../../lib/auth';
import { supabaseAdmin } from '../../../../lib/supabase/admin';

export const GET: APIRoute = async ({ cookies }) => {
  const adminUser = await getAdminSession(cookies);
  if (!adminUser) {
    return new Response('Unauthorized', { status: 401 });
  }

  // Ambil seluruh data pendaftaran
  const { data: apps, error } = await supabaseAdmin
    .from('applications')
    .select('*, programs(title)')
    .order('created_at', { ascending: false });

  if (error || !apps) {
    return new Response('Gagal mengekspor data', { status: 500 });
  }

  // Buat CSV string
  const headers = [
    'Nomor Registrasi',
    'Nama Lengkap',
    'Email',
    'WhatsApp',
    'Jenis Peserta',
    'Asal Institusi',
    'Jurusan',
    'Kelas/Semester',
    'Program Magang',
    'Bidang Pilihan',
    'Durasi',
    'Rencana Mulai',
    'Metode Magang',
    'Status',
    'Portofolio URL',
    'Catatan Peserta',
    'Catatan Admin',
    'Tanggal Daftar',
  ];

  const escapeCsv = (val: any) => {
    if (val === null || val === undefined) return '""';
    const str = String(val).replace(/"/g, '""');
    return `"${str}"`;
  };

  const rows = apps.map(a => [
    escapeCsv(a.application_number),
    escapeCsv(a.full_name),
    escapeCsv(a.email),
    escapeCsv(a.whatsapp),
    escapeCsv(a.participant_type),
    escapeCsv(a.institution),
    escapeCsv(a.major),
    escapeCsv(a.class_or_semester),
    escapeCsv(a.programs?.title || '-'),
    escapeCsv(a.preferred_field),
    escapeCsv(a.duration),
    escapeCsv(a.start_date),
    escapeCsv(a.internship_mode),
    escapeCsv(a.status),
    escapeCsv(a.portfolio_url || '-'),
    escapeCsv(a.notes || '-'),
    escapeCsv(a.admin_notes || '-'),
    escapeCsv(a.created_at),
  ].join(','));

  const csvContent = [headers.join(','), ...rows].join('\r\n');

  const filename = `data-pendaftar-magang-${new Date().toISOString().slice(0, 10)}.csv`;

  return new Response(csvContent, {
    status: 200,
    headers: {
      'Content-Type': 'text/csv; charset=utf-8',
      'Content-Disposition': `attachment; filename="${filename}"`,
    },
  });
};
