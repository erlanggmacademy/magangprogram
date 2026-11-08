# PRODUCT REQUIREMENTS DOCUMENT (PRD)

## Website Program Magang SMK & Mahasiswa dan Digital Agency

**Versi:** 1.0\
**Tanggal dokumen:** 8 November 2026\
**Status:** Draft spesifikasi untuk dasar pengembangan\
**Teknologi utama:** Astro, Supabase, Bootstrap 5, HTML, CSS, JavaScript

------------------------------------------------------------------------

# 1. Ringkasan Proyek

Website ini dirancang sebagai platform terpadu yang menggabungkan
company profile, informasi program magang, promosi layanan digital,
portofolio, blog, dan sistem pendaftaran peserta magang.

Platform ditujukan terutama untuk siswa SMK dan mahasiswa dari bidang
teknologi, bisnis, pemasaran, dan industri kreatif. Website juga menjadi
kanal pemasaran layanan digital kepada UMKM, perusahaan, dan calon
klien.

## 1.1 Konsep Produk

Website memiliki lima fungsi utama:

1.  **Company Profile:** memperkenalkan organisasi, identitas, visi,
    misi, dan tim.
2.  **Internship Platform:** menyediakan informasi program magang untuk
    siswa SMK dan mahasiswa.
3.  **Digital Agency Website:** mempromosikan jasa digital marketing,
    SEO, social media marketing, web development, desain, dan layanan
    terkait.
4.  **Content Marketing:** menerbitkan artikel untuk meningkatkan
    visibilitas organik di mesin pencari.
5.  **Lead Generation:** mengumpulkan pendaftaran peserta dan
    mengarahkan calon klien maupun calon peserta ke WhatsApp.

## 1.2 Identitas Proyek

  Aspek                           Keterangan
  ------------------------------- ----------------------------------------------------------
  Nama proyek                     Website Program Magang & Digital Agency
  Target utama                    Siswa SMK dan mahasiswa
  Target tambahan                 UMKM, perusahaan, dan calon klien digital
  Framework frontend              Astro
  Database dan backend services   Supabase
  Database engine                 PostgreSQL
  UI framework                    Bootstrap 5
  Bahasa antarmuka                Bahasa Indonesia
  SEO                             Technical SEO, On-page SEO, Content SEO, Structured Data
  CMS                             Custom semi-CMS berbasis Supabase
  Komunikasi                      WhatsApp
  Nomor WhatsApp                  +62895639068080
  Tema visual                     Elegant Maroon & White

## 1.3 Tujuan Produk

-   Menyediakan informasi program magang untuk siswa SMK dan mahasiswa.
-   Menjangkau calon peserta dari bidang teknologi, kreatif, bisnis, dan
    pemasaran.
-   Menyediakan pendaftaran magang online yang tercatat di database.
-   Mempromosikan layanan digital kepada calon klien.
-   Menampilkan portofolio dan hasil pekerjaan.
-   Mengembangkan traffic organik melalui strategi SEO dan blog.
-   Mempermudah komunikasi melalui WhatsApp.
-   Memungkinkan admin mengelola konten tanpa mengubah source code.

## 1.4 Target Pengguna

  -----------------------------------------------------------------------
  Pengguna                            Kebutuhan
  ----------------------------------- -----------------------------------
  Siswa SMK RPL                       Magang pemrograman web dan software

  Siswa SMK TKJ                       Magang jaringan komputer dan IT
                                      support

  Siswa SMK Multimedia                Magang desain dan produksi
                                      multimedia

  Siswa SMK DKV                       Magang desain grafis dan komunikasi
                                      visual

  Mahasiswa Informatika               Magang software development dan IT

  Mahasiswa Sistem Informasi          Magang sistem informasi dan
                                      pengelolaan data

  Mahasiswa Bisnis Digital            Magang digital business dan
                                      e-commerce

  Mahasiswa Digital Marketing         Magang SEO dan pemasaran digital

  Mahasiswa Pemasaran                 Magang marketing, riset pasar, dan
                                      promosi

  UMKM/perusahaan                     Menggunakan jasa digital agency

  Admin/editor                        Mengelola pendaftaran dan konten
                                      website
  -----------------------------------------------------------------------

------------------------------------------------------------------------

# 2. Ruang Lingkup Produk

## 2.1 Fitur yang Termasuk dalam Ruang Lingkup

-   Halaman beranda.
-   Halaman tentang kami.
-   Halaman jasa dan detail jasa.
-   Halaman program magang dan detail program.
-   Halaman portofolio dan detail portofolio.
-   Halaman blog dan detail artikel.
-   Formulir pendaftaran peserta.
-   Integrasi WhatsApp untuk seluruh CTA komunikasi.
-   Admin dashboard.
-   Pengelolaan program, jasa, portofolio, blog, media, dan pengaturan
    website.
-   Pengelolaan status pendaftaran.
-   Pengelolaan metadata SEO dan JSON-LD.
-   Upload dokumen pendaftar ke Supabase Storage.
-   Pengamanan database menggunakan Row Level Security (RLS).

## 2.2 Di Luar Ruang Lingkup MVP

Fitur berikut dapat dipertimbangkan untuk pengembangan lanjutan:

-   Portal akun peserta untuk melihat status pendaftaran.
-   Sistem absensi peserta magang.
-   Learning Management System (LMS).
-   Penilaian dan evaluasi peserta.
-   Sertifikat digital otomatis.
-   Chat internal.
-   Pembayaran online.
-   Notifikasi email otomatis.
-   Integrasi WhatsApp Business API.
-   Multi-tenant untuk banyak perusahaan atau cabang.

------------------------------------------------------------------------

# 3. Sitemap dan Struktur URL

Struktur URL dibuat singkat, deskriptif, konsisten, dan mudah
dikembangkan.

``` text
/
├── tentang-kami
├── jasa
│   ├── digital-marketing
│   ├── seo
│   ├── social-media-marketing
│   ├── web-development
│   ├── graphic-design
│   ├── content-creation
│   └── branding
├── program
│   ├── magang-smk
│   ├── magang-mahasiswa
│   ├── magang-informatika
│   ├── magang-digital-marketing
│   ├── magang-bisnis-digital
│   ├── magang-pemasaran
│   ├── magang-rpl
│   ├── magang-tkj
│   ├── magang-multimedia
│   └── magang-dkv
├── portofolio
│   └── [slug]
├── blog
│   ├── kategori
│   └── [slug]
├── pendaftaran
├── kebijakan-privasi
├── syarat-ketentuan
└── admin
    ├── login
    ├── dashboard
    ├── pendaftaran
    ├── program
    ├── jasa
    ├── blog
    ├── portofolio
    ├── kategori
    ├── media
    ├── seo
    └── pengaturan
```

## 3.1 Daftar URL Utama

  Halaman                    URL
  -------------------------- -------------------------------------
  Beranda                    `/`
  Tentang Kami               `/tentang-kami`
  Digital Marketing          `/jasa/digital-marketing`
  SEO                        `/jasa/seo`
  Social Media Marketing     `/jasa/social-media-marketing`
  Web Development            `/jasa/web-development`
  Graphic Design             `/jasa/graphic-design`
  Content Creation           `/jasa/content-creation`
  Branding                   `/jasa/branding`
  Program Magang             `/program`
  Magang SMK                 `/program/magang-smk`
  Magang Mahasiswa           `/program/magang-mahasiswa`
  Magang Informatika         `/program/magang-informatika`
  Magang Digital Marketing   `/program/magang-digital-marketing`
  Magang Bisnis Digital      `/program/magang-bisnis-digital`
  Magang Pemasaran           `/program/magang-pemasaran`
  Magang RPL                 `/program/magang-rpl`
  Magang TKJ                 `/program/magang-tkj`
  Magang Multimedia          `/program/magang-multimedia`
  Magang DKV                 `/program/magang-dkv`
  Portofolio                 `/portofolio`
  Detail Portofolio          `/portofolio/[slug]`
  Blog                       `/blog`
  Detail Artikel             `/blog/[slug]`
  Pendaftaran                `/pendaftaran`
  Kebijakan Privasi          `/kebijakan-privasi`
  Syarat dan Ketentuan       `/syarat-ketentuan`

**Catatan implementasi:** halaman berdasarkan jurusan atau bidang dapat
menggunakan satu template dinamis. Admin mengelola kontennya melalui
Supabase sehingga tidak perlu membuat komponen halaman yang berbeda
untuk setiap jurusan.

------------------------------------------------------------------------

# 4. Detail Kebutuhan Setiap Halaman

## 4.1 Beranda

Beranda menjadi pusat navigasi dan konversi pengunjung.

### Komponen

1.  Navbar dengan logo dan menu dropdown.
2.  Hero section dengan headline dan subheadline.
3.  CTA Daftar Magang dan Konsultasi WhatsApp.
4.  Ringkasan profil organisasi.
5.  Keunggulan program magang.
6.  Pilihan program magang.
7.  Daftar bidang/jurusan.
8.  Layanan digital agency.
9.  Portofolio unggulan.
10. Artikel blog terbaru.
11. Testimoni peserta atau klien yang benar-benar tersedia.
12. FAQ.
13. CTA pendaftaran.
14. Footer lengkap.

### Contoh copywriting hero

**Headline:**\
Bangun Skill Digital, Kembangkan Potensi, dan Siapkan Karier Masa Depan
Bersama Kami.

**Subheadline:**\
Program magang untuk siswa SMK dan mahasiswa yang ingin mendapatkan
pengalaman praktis di bidang teknologi, digital marketing, bisnis
digital, dan industri kreatif.

**CTA:** - Daftar Program Magang. - Konsultasi via WhatsApp.

## 4.2 Tentang Kami

URL: `/tentang-kami`

Konten yang ditampilkan:

-   Sejarah dan profil organisasi.
-   Visi dan misi.
-   Tujuan organisasi.
-   Bidang keahlian.
-   Nilai organisasi.
-   Tim dan mentor.
-   Metode pembelajaran magang.
-   CTA WhatsApp.

Tujuan SEO: membangun kepercayaan, kredibilitas, dan identitas
organisasi. Informasi organisasi harus faktual dan tidak boleh membuat
klaim pengalaman, jumlah peserta, atau pencapaian yang belum dapat
dibuktikan.

## 4.3 Halaman Jasa

URL utama: `/jasa`

Setiap layanan memiliki halaman detail tersendiri.

  --------------------------------------------------------------------------------
  Layanan                 URL                              Target pasar
  ----------------------- -------------------------------- -----------------------
  Digital Marketing       `/jasa/digital-marketing`        UMKM dan perusahaan

  SEO                     `/jasa/seo`                      Bisnis dan pemilik
                                                           website

  Social Media Marketing  `/jasa/social-media-marketing`   Brand dan UMKM

  Web Development         `/jasa/web-development`          Perusahaan dan individu

  Graphic Design          `/jasa/graphic-design`           Brand dan bisnis

  Content Creation        `/jasa/content-creation`         Bisnis dan kreator

  Branding                `/jasa/branding`                 Bisnis baru dan UMKM
  --------------------------------------------------------------------------------

### Struktur halaman detail jasa

-   Hero section.
-   Penjelasan layanan.
-   Permasalahan yang diselesaikan.
-   Fitur atau ruang lingkup layanan.
-   Proses pengerjaan.
-   Portofolio terkait.
-   FAQ layanan.
-   CTA konsultasi WhatsApp.

## 4.4 Halaman Program Magang

URL utama: `/program`

Halaman ini menjadi pusat informasi semua program magang.

### A. Program Magang SMK

Target jurusan:

-   Rekayasa Perangkat Lunak (RPL).
-   Teknik Komputer dan Jaringan (TKJ).
-   Multimedia.
-   Desain Komunikasi Visual (DKV).

### B. Program Magang Mahasiswa

Target program studi:

-   Informatika.
-   Teknik Informatika.
-   Sistem Informasi.
-   Digital Marketing.
-   Bisnis Digital.
-   Manajemen Pemasaran.
-   Ilmu Komunikasi atau bidang relevan lainnya.

### Kurikulum bidang magang

  -----------------------------------------------------------------------
  Bidang                  Materi praktik          Contoh output
  ----------------------- ----------------------- -----------------------
  Informatika             Pemrograman, database,  Aplikasi sederhana
                          API                     

  RPL                     HTML, CSS, JavaScript,  Website/aplikasi
                          Git                     

  TKJ                     Jaringan, konfigurasi,  Dokumentasi jaringan
                          troubleshooting         

  Multimedia              Editing video dan       Konten multimedia
                          konten visual           

  DKV                     Desain grafis,          Portofolio desain
                          branding, UI            

  Digital Marketing       SEO, iklan, analisis    Strategi pemasaran
                          digital                 

  Bisnis Digital          E-commerce dan bisnis   Rencana bisnis
                          online                  

  Pemasaran               Riset pasar, promosi,   Marketing plan
                          sales                   
  -----------------------------------------------------------------------

### Informasi program yang harus ditampilkan

-   Deskripsi program.
-   Persyaratan peserta.
-   Jurusan yang diterima.
-   Durasi magang.
-   Metode pelaksanaan (online, offline, atau hybrid).
-   Lokasi.
-   Fasilitas.
-   Mentor.
-   Aktivitas dan kurikulum.
-   Output pembelajaran.
-   Sertifikat, jika memang disediakan.
-   Alur pendaftaran.
-   FAQ.
-   CTA daftar.

Durasi, lokasi, fasilitas, metode, dan status program harus dapat diubah
melalui dashboard admin.

## 4.5 Portofolio

URL: `/portofolio`

### Kategori

-   Website Development.
-   SEO.
-   Social Media Marketing.
-   Digital Marketing.
-   Graphic Design.
-   Branding.
-   Multimedia.

### Fitur

-   Filter kategori.
-   Gambar thumbnail.
-   Judul proyek.
-   Deskripsi singkat.
-   Detail proyek.
-   Teknologi yang digunakan.
-   Tanggal proyek.
-   Link hasil proyek jika tersedia.

Setiap proyek memiliki URL unik: `/portofolio/nama-proyek`.

Portofolio hanya boleh menampilkan pekerjaan yang memang pernah
dilakukan dan memiliki izin untuk dipublikasikan.

## 4.6 Blog

URL: `/blog`

### Fitur

-   Daftar artikel.
-   Kategori artikel.
-   Pencarian.
-   Artikel terbaru.
-   Artikel populer jika datanya tersedia.
-   Detail artikel.
-   Related articles.
-   Breadcrumb.
-   Profil penulis.
-   Tanggal publikasi dan pembaruan.
-   Share ke media sosial.

### Kategori artikel

  Kategori            Contoh topik
  ------------------- ----------------------------------------
  Magang SMK          Panduan magang SMK RPL
  Magang Mahasiswa    Persiapan magang mahasiswa Informatika
  Informatika         Belajar web development
  Digital Marketing   Strategi digital marketing
  SEO                 Panduan SEO untuk pemula
  Bisnis Digital      Peluang bisnis digital
  Desain Grafis       Dasar desain komunikasi visual
  Karier              Tips membuat CV dan portofolio

## 4.7 Halaman Pendaftaran

URL: `/pendaftaran`

Formulir pendaftaran harus mudah digunakan, responsif, dan tidak terlalu
panjang dalam satu tampilan.

### Data pendaftaran

  Field                 Tipe       Wajib
  --------------------- ---------- -------
  Nama lengkap          Text       Ya
  Email                 Email      Ya
  Nomor WhatsApp        Tel        Ya
  Jenis peserta         Select     Ya
  Asal sekolah/kampus   Text       Ya
  Jurusan               Select     Ya
  Semester/kelas        Text       Ya
  Program magang        Select     Ya
  Bidang pilihan        Select     Ya
  Durasi magang         Select     Ya
  Tanggal mulai         Date       Ya
  Metode magang         Select     Ya
  Link CV/portofolio    URL        Tidak
  Upload CV             File       Tidak
  Surat pengantar       File       Tidak
  Catatan tambahan      Textarea   Tidak
  Persetujuan privasi   Checkbox   Ya

Jenis peserta: - Siswa SMK. - Mahasiswa.

Pilihan jurusan dapat menyesuaikan jenis peserta. Contohnya, siswa SMK
memilih RPL, TKJ, Multimedia, atau DKV.

### Alur pendaftaran

1.  Pengunjung membuka formulir.
2.  Pengunjung memilih jenis peserta dan program magang.
3.  Pengunjung mengisi data diri.
4.  Pengunjung mengunggah berkas jika diperlukan.
5.  Sistem memvalidasi data.
6.  Sistem menyimpan pendaftaran ke Supabase.
7.  Sistem menghasilkan kode pendaftaran unik.
8.  Website menampilkan konfirmasi pendaftaran.
9.  Pengunjung dapat melanjutkan konfirmasi melalui WhatsApp.
10. Admin memeriksa dan memproses pendaftaran melalui dashboard.

### Status pendaftaran

-   `pending`: pendaftaran baru.
-   `reviewing`: sedang diperiksa.
-   `accepted`: diterima.
-   `rejected`: ditolak.
-   `withdrawn`: dibatalkan oleh peserta.

### Integrasi WhatsApp

Nomor tujuan: `+62895639068080`

Link dasar:

``` text
https://wa.me/62895639068080
```

Contoh pesan otomatis:

``` text
https://wa.me/62895639068080?text=Halo%2C%20saya%20ingin%20bertanya%20tentang%20program%20magang.
```

Untuk tombol pendaftaran, proses yang direkomendasikan:

1.  Formulir dikirim dan disimpan ke Supabase terlebih dahulu.
2.  Sistem menampilkan kode pendaftaran.
3.  Tombol WhatsApp muncul setelah pendaftaran berhasil.
4.  Pesan WhatsApp otomatis berisi kode pendaftaran dan informasi
    singkat peserta.

Dengan demikian, data pendaftaran tetap tercatat di database dan tidak
hanya berada di percakapan WhatsApp.

------------------------------------------------------------------------

# 5. Functional Requirements

  ID      Fitur                  Kebutuhan
  ------- ---------------------- ----------------------------------------
  FR-01   Homepage               Menampilkan informasi utama website
  FR-02   Navbar                 Menampilkan menu dan dropdown
  FR-03   Tentang Kami           Menampilkan profil organisasi
  FR-04   Manajemen Jasa         Mengelola layanan digital
  FR-05   Manajemen Program      Menampilkan program magang
  FR-06   Detail Program         Menampilkan detail setiap program
  FR-07   Portofolio             Menampilkan hasil pekerjaan
  FR-08   Filter Portofolio      Memfilter berdasarkan kategori
  FR-09   Blog                   Menampilkan artikel
  FR-10   Detail Blog            Menampilkan artikel berdasarkan slug
  FR-11   Pencarian Blog         Mencari artikel berdasarkan kata kunci
  FR-12   Form Pendaftaran       Mengumpulkan data peserta
  FR-13   Upload Dokumen         Menyimpan berkas ke Supabase Storage
  FR-14   Kode Pendaftaran       Menghasilkan nomor pendaftaran unik
  FR-15   WhatsApp               Mengarahkan CTA komunikasi ke WhatsApp
  FR-16   Admin Login            Autentikasi admin
  FR-17   Dashboard              Menampilkan ringkasan data
  FR-18   Manajemen Pendaftar    Melihat dan mengubah status
  FR-19   Manajemen Blog         CRUD artikel
  FR-20   Manajemen Portofolio   CRUD portofolio
  FR-21   Manajemen Jasa         CRUD layanan
  FR-22   Manajemen Program      CRUD program magang
  FR-23   SEO Management         Mengelola metadata halaman
  FR-24   Pengaturan Website     Mengelola identitas dan kontak

------------------------------------------------------------------------

# 6. Admin Dashboard dan Semi-CMS

Dashboard admin dibuat sederhana, bukan CMS kompleks seperti WordPress.

## 6.1 Menu Dashboard

  Menu             Fungsionalitas
  ---------------- --------------------------------------
  Dashboard        Statistik dan ringkasan
  Pendaftaran      Daftar calon peserta
  Program Magang   CRUD program
  Layanan Jasa     CRUD layanan
  Portofolio       CRUD proyek
  Blog             CRUD artikel
  Kategori         Kategori blog dan portofolio
  Media            Pengelolaan gambar
  SEO              Meta title, description, canonical
  Pengaturan       Logo, kontak, WhatsApp, sosial media
  Admin            Pengaturan akun dan role admin

## 6.2 Dashboard Pendaftaran

Statistik yang ditampilkan:

-   Total pendaftar.
-   Pendaftar hari ini.
-   Pendaftar SMK.
-   Pendaftar mahasiswa.
-   Pendaftar dalam proses.
-   Pendaftar diterima.
-   Pendaftar ditolak.

Fitur tabel pendaftaran:

-   Pencarian nama.
-   Filter jurusan.
-   Filter jenis peserta.
-   Filter program.
-   Filter status.
-   Filter tanggal.
-   Detail pendaftar.
-   Ubah status.
-   Catatan admin.
-   Export CSV.

## 6.3 Editor Artikel

Setiap artikel memiliki:

-   Judul.
-   Slug otomatis.
-   Ringkasan.
-   Konten artikel.
-   Thumbnail.
-   Alt text gambar.
-   Kategori.
-   Penulis.
-   Meta title.
-   Meta description.
-   Focus keyword sebagai panduan editorial.
-   Canonical URL.
-   Open Graph image.
-   Schema type.
-   Status draft/published.
-   Jadwal publikasi.
-   Tanggal publikasi.
-   Tanggal pembaruan.

Gunakan editor rich text seperti TipTap atau editor Markdown. Konten
HTML harus disanitasi sebelum ditampilkan.

------------------------------------------------------------------------

# 7. Technology Stack dan Arsitektur Sistem

## 7.1 Teknologi Utama

  Teknologi                 Fungsi
  ------------------------- -----------------------------------------------------
  Astro                     Framework frontend, routing, SSR, static generation
  Supabase                  Backend services
  PostgreSQL                Relational database
  Supabase Auth             Autentikasi admin
  Supabase Storage          Penyimpanan dokumen dan media
  Bootstrap 5               Grid system dan komponen UI
  HTML                      Struktur halaman
  CSS                       Styling
  JavaScript                Interaksi form, dropdown, filter, dan AJAX
  `@supabase/supabase-js`   SDK Supabase
  `@supabase/ssr`           Integrasi autentikasi SSR
  Zod                       Validasi data
  Bootstrap Icons           Ikon
  TipTap                    Rich text editor
  DOMPurify                 Sanitasi HTML
  Cloudflare Turnstile      Perlindungan bot pada formulir

## 7.2 Arsitektur Sistem

Pendekatan yang direkomendasikan adalah **Hybrid Static + Server
Rendering**.

Alasan: - Halaman company profile dan halaman SEO perlu cepat. - Blog
dan program membutuhkan data dinamis. - Pendaftaran memerlukan validasi
server. - Dashboard memerlukan autentikasi dan kontrol akses.

``` text
PENGUNJUNG WEBSITE
        |
        v
ASTRO APPLICATION
  - Static Pages
  - SSR Pages
  - API Endpoints
        |
        v
SUPABASE
  +----------------------+
  | PostgreSQL Database  |
  | Supabase Auth        |
  | Supabase Storage     |
  | Row Level Security   |
  +----------------------+
        |
        v
ADMIN DASHBOARD
  - Pendaftaran
  - Program
  - Jasa
  - Blog
  - Portofolio
  - Pengaturan
```

## 7.3 Pembagian Rendering

  Bagian            Rendering              Alasan
  ----------------- ---------------------- -------------------------------
  Beranda           Static                 Cepat dan SEO
  Tentang Kami      Static                 Konten relatif tetap
  Jasa              Static atau SSR        Konten pemasaran
  Program           SSR atau prerender     Data program dinamis
  Blog              SSR atau build ulang   Konten CMS dinamis
  Portofolio        SSR atau build ulang   Konten CMS dinamis
  Pendaftaran       SSR                    Validasi dan penyimpanan
  Admin             SSR                    Autentikasi
  API pendaftaran   Server endpoint        Melindungi proses penyimpanan

**Catatan:** Astro tidak otomatis menyediakan ISR pada semua adapter.
Untuk konten yang diubah admin, pilih salah satu: 1. SSR untuk membaca
data terbaru dari Supabase. 2. Static generation dengan webhook untuk
menjalankan build ulang ketika konten diterbitkan atau diperbarui.

Pastikan adapter Astro sesuai dengan platform deployment yang dipilih.

------------------------------------------------------------------------

# 8. Database Design -- Supabase

Supabase menjadi sumber data utama untuk website, CMS, dan pendaftaran.

## 8.1 Daftar Tabel

  No.   Nama tabel                Fungsi
  ----- ------------------------- ---------------------------
  1     `admin_profiles`          Profil dan role admin
  2     `site_settings`           Pengaturan website
  3     `programs`                Program magang
  4     `services`                Jasa digital
  5     `portfolios`              Data portofolio
  6     `portfolio_categories`    Kategori portofolio
  7     `blog_categories`         Kategori artikel
  8     `blog_posts`              Artikel blog
  9     `applications`            Pendaftaran peserta
  10    `application_documents`   Dokumen peserta
  11    `application_logs`        Riwayat perubahan status
  12    `media_assets`            Metadata gambar dan media

## 8.2 Rancangan Kolom Tabel

### A. `admin_profiles`

  Kolom        Tipe          Keterangan
  ------------ ------------- ----------------------------------
  id           UUID          FK ke `auth.users.id`
  full_name    TEXT          Nama admin
  role         TEXT          `super_admin`, `admin`, `editor`
  created_at   TIMESTAMPTZ   Waktu dibuat
  updated_at   TIMESTAMPTZ   Waktu diperbarui

### B. `programs`

  Kolom              Tipe          Keterangan
  ------------------ ------------- -----------------------
  id                 UUID          Primary key
  title              TEXT          Nama program
  slug               TEXT UNIQUE   URL
  category           TEXT          Kategori program
  description        TEXT          Deskripsi
  requirements       JSONB         Persyaratan
  curriculum         JSONB         Kurikulum
  duration           TEXT          Durasi
  mode               TEXT          Online/offline/hybrid
  location           TEXT          Lokasi
  benefits           JSONB         Manfaat/fasilitas
  thumbnail          TEXT          Gambar utama
  meta_title         TEXT          SEO title
  meta_description   TEXT          SEO description
  is_published       BOOLEAN       Status publikasi
  created_at         TIMESTAMPTZ   Waktu dibuat
  updated_at         TIMESTAMPTZ   Waktu diperbarui

### C. `services`

  Kolom               Tipe          Keterangan
  ------------------- ------------- ------------------
  id                  UUID          Primary key
  title               TEXT          Nama layanan
  slug                TEXT UNIQUE   URL
  short_description   TEXT          Ringkasan
  content             TEXT          Konten layanan
  features            JSONB         Fitur layanan
  thumbnail           TEXT          Gambar
  meta_title          TEXT          SEO title
  meta_description    TEXT          SEO description
  is_published        BOOLEAN       Status publikasi
  created_at          TIMESTAMPTZ   Waktu dibuat
  updated_at          TIMESTAMPTZ   Waktu diperbarui

### D. `blog_posts`

  Kolom              Tipe          Keterangan
  ------------------ ------------- -------------------
  id                 UUID          Primary key
  category_id        UUID          FK kategori
  author_id          UUID          FK admin/penulis
  title              TEXT          Judul
  slug               TEXT UNIQUE   URL
  excerpt            TEXT          Ringkasan
  content            TEXT          Isi artikel
  thumbnail          TEXT          Gambar utama
  image_alt          TEXT          Alt text
  meta_title         TEXT          SEO title
  meta_description   TEXT          SEO description
  canonical_url      TEXT          Canonical
  focus_keyword      TEXT          Panduan editorial
  og_image           TEXT          Open Graph image
  status             TEXT          Draft/published
  published_at       TIMESTAMPTZ   Waktu publikasi
  created_at         TIMESTAMPTZ   Waktu dibuat
  updated_at         TIMESTAMPTZ   Waktu diperbarui

### E. `applications`

Tabel ini berisi data pribadi peserta dan harus dilindungi.

  Kolom                Tipe          Keterangan
  -------------------- ------------- ---------------------
  id                   UUID          Primary key
  application_number   TEXT UNIQUE   Kode pendaftaran
  full_name            TEXT          Nama lengkap
  email                TEXT          Email
  whatsapp             TEXT          Nomor WhatsApp
  participant_type     TEXT          SMK/mahasiswa
  institution          TEXT          Asal sekolah/kampus
  major                TEXT          Jurusan
  class_or_semester    TEXT          Kelas/semester
  program_id           UUID          FK program
  preferred_field      TEXT          Bidang pilihan
  duration             TEXT          Durasi
  start_date           DATE          Rencana mulai
  internship_mode      TEXT          Metode magang
  portfolio_url        TEXT          Link portofolio
  notes                TEXT          Catatan peserta
  privacy_consent_at   TIMESTAMPTZ   Waktu persetujuan
  status               TEXT          Status pendaftaran
  admin_notes          TEXT          Catatan admin
  created_at           TIMESTAMPTZ   Waktu dibuat
  updated_at           TIMESTAMPTZ   Waktu diperbarui

Jangan menyimpan CV dan surat pengantar sebagai Base64 di tabel ini.
Simpan file di Supabase Storage dan simpan metadata/path di
`application_documents`.

### F. `application_documents`

  Kolom               Tipe          Keterangan
  ------------------- ------------- ----------------
  id                  UUID          Primary key
  application_id      UUID          FK pendaftaran
  document_type       TEXT          Jenis dokumen
  storage_path        TEXT          Path Storage
  original_filename   TEXT          Nama file asli
  mime_type           TEXT          MIME type
  file_size           BIGINT        Ukuran file
  created_at          TIMESTAMPTZ   Waktu dibuat

### G. `application_logs`

  Kolom            Tipe          Keterangan
  ---------------- ------------- ---------------------
  id               UUID          Primary key
  application_id   UUID          FK pendaftaran
  old_status       TEXT          Status sebelumnya
  new_status       TEXT          Status baru
  changed_by       UUID          Admin yang mengubah
  admin_note       TEXT          Catatan
  created_at       TIMESTAMPTZ   Waktu perubahan

### H. `site_settings`

Digunakan untuk mengubah informasi website tanpa mengubah source code.

Data yang dapat dikelola: - Nama organisasi. - Logo. - Tagline. -
Deskripsi website. - WhatsApp. - Email. - Alamat. - Instagram. -
LinkedIn. - TikTok. - Footer. - Default SEO title. - Default SEO
description. - Default OG image.

## 8.3 Relasi Database

Relasi yang direkomendasikan:

-   `blog_posts.category_id` → `blog_categories.id`.
-   `blog_posts.author_id` → `admin_profiles.id`.
-   `portfolios.category_id` → `portfolio_categories.id`.
-   `applications.program_id` → `programs.id`.
-   `application_documents.application_id` → `applications.id`.
-   `application_logs.application_id` → `applications.id`.
-   `application_logs.changed_by` → `admin_profiles.id`.
-   `admin_profiles.id` → `auth.users.id`.

Gunakan UUID sebagai primary key, foreign key yang sesuai, constraint,
dan index untuk kolom yang sering digunakan pada pencarian, filter, dan
relasi.

## 8.4 Database Security dan RLS

**Wajib sebelum production.**

Aturan keamanan:

1.  Aktifkan Row Level Security pada semua tabel yang dapat diakses
    melalui Data API.
2.  Pengunjung hanya dapat membaca konten yang sudah dipublikasikan.
3.  Pengunjung tidak dapat membaca data pendaftaran.
4.  Pengunjung tidak dapat mengubah status pendaftaran.
5.  Admin harus login untuk mengelola konten.
6.  Editor hanya mendapatkan izin sesuai kewenangannya.
7.  Dokumen pendaftar disimpan di private bucket.
8.  Gunakan signed URL dengan masa berlaku pendek ketika admin mengakses
    dokumen.
9.  Jangan pernah mengekspos `service_role` atau secret key di browser.
10. Batasi ukuran, MIME type, dan jenis file upload.

### Matriks akses

  Tabel                   Pengunjung anonim          Admin terautentikasi
  ----------------------- -------------------------- ----------------------
  programs                SELECT published           CRUD sesuai role
  services                SELECT published           CRUD sesuai role
  blog_posts              SELECT published           CRUD sesuai role
  portfolios              SELECT published           CRUD sesuai role
  applications            Tidak boleh SELECT         Akses sesuai role
  application_documents   Tidak boleh                Akses sesuai role
  application_logs        Tidak boleh                Akses sesuai role
  site_settings           SELECT pengaturan publik   CRUD sesuai role

Untuk pendaftaran, gunakan endpoint server Astro yang memvalidasi input,
memeriksa CAPTCHA, membatasi request, dan menjalankan penyimpanan secara
terkontrol. Jangan memberikan hak SELECT kepada publik hanya karena
publik boleh mengirim pendaftaran.

Pastikan operasi admin menggunakan autentikasi dan otorisasi yang benar.
Secret key hanya boleh digunakan pada server yang terlindungi.

------------------------------------------------------------------------

# 9. SEO Strategy -- November 2026

Strategi SEO mencakup:

1.  Technical SEO.
2.  On-Page SEO.
3.  Content SEO.
4.  Local SEO jika lokasi operasional dan target lokal sudah ditentukan.
5.  Image SEO.
6.  Structured Data / Schema.org.
7.  Internal Linking.
8.  Conversion SEO.

Tujuan utama bukan hanya mendapatkan pengunjung, tetapi mendapatkan
pengunjung yang relevan dengan program magang dan layanan digital.

## 9.1 Keyword Strategy

Keyword berikut merupakan target berdasarkan search intent. Volume
pencarian, tingkat kesulitan, dan potensi traffic belum diverifikasi.
Prioritas final harus ditentukan melalui Google Keyword Planner, Search
Console, dan riset kompetitor.

### Cluster 1 -- Magang SMK

  Keyword              Search intent   Landing page
  -------------------- --------------- ------------------------------
  tempat magang SMK    Transactional   `/program/magang-smk`
  tempat PKL SMK RPL   Transactional   `/program/magang-rpl`
  magang SMK TKJ       Transactional   `/program/magang-tkj`
  magang multimedia    Transactional   `/program/magang-multimedia`
  magang DKV           Transactional   `/program/magang-dkv`
  tempat PKL SMK       Transactional   `/program/magang-smk`

### Cluster 2 -- Magang Mahasiswa

  -------------------------------------------------------------------------------------
  Keyword                 Search intent           Landing page
  ----------------------- ----------------------- -------------------------------------
  tempat magang mahasiswa Transactional           `/program/magang-mahasiswa`

  magang mahasiswa        Transactional           `/program/magang-informatika`
  informatika                                     

  magang digital          Transactional           `/program/magang-digital-marketing`
  marketing mahasiswa                             

  magang bisnis digital   Transactional           `/program/magang-bisnis-digital`

  magang teknik           Transactional           `/program/magang-informatika`
  informatika                                     
  -------------------------------------------------------------------------------------

### Cluster 3 -- Jasa Digital

  Keyword                       Landing page
  ----------------------------- --------------------------------
  jasa digital marketing        `/jasa/digital-marketing`
  jasa SEO website              `/jasa/seo`
  jasa social media marketing   `/jasa/social-media-marketing`
  jasa pembuatan website        `/jasa/web-development`
  jasa desain grafis            `/jasa/graphic-design`
  jasa branding bisnis          `/jasa/branding`

### Cluster 4 -- Informational SEO

Contoh topik artikel:

-   Apa Itu Magang SMK?
-   Cara Memilih Tempat Magang untuk Siswa RPL.
-   Apa Saja Tugas Anak Magang TKJ?
-   Persiapan Magang Mahasiswa Informatika.
-   Skill yang Harus Dimiliki Digital Marketer.
-   Apa Perbedaan Bisnis Digital dan Digital Marketing?
-   Cara Membuat Portofolio untuk Magang.
-   Tips Membuat CV Magang yang Menarik.

## 9.2 SEO Title dan Meta Description

Setiap halaman wajib mempunyai title dan description yang unik, relevan,
dan sesuai isi halaman.

  Halaman             Contoh SEO Title
  ------------------- ---------------------------------------------------
  Beranda             Program Magang SMK & Mahasiswa dan Jasa Digital
  Tentang Kami        Tentang Kami -- Program Magang dan Digital Agency
  Magang SMK          Tempat Magang SMK RPL, TKJ, Multimedia & DKV
  Magang Mahasiswa    Program Magang Mahasiswa Informatika & Digital
  Magang RPL          Magang SMK RPL -- Belajar Web Development
  Magang TKJ          Magang SMK TKJ -- Praktik Jaringan Komputer
  Digital Marketing   Jasa Digital Marketing untuk Bisnis
  SEO                 Jasa SEO Website untuk Meningkatkan Visibilitas
  Web Development     Jasa Pembuatan Website Profesional
  Blog                Artikel Magang, Informatika dan Digital Marketing

Contoh meta description beranda:

> Temukan program magang SMK dan mahasiswa bidang Informatika, RPL, TKJ,
> DKV, Multimedia, Bisnis Digital dan Digital Marketing. Daftar
> sekarang!

Prinsip: - Satu halaman memiliki satu H1 utama. - Gunakan H2 dan H3
secara hierarkis. - Hindari duplikasi title dan description. - Slug
singkat, deskriptif, dan konsisten. - Tambahkan internal link yang
relevan. - Hindari keyword stuffing. - Tampilkan konten utama dalam HTML
yang dapat dibaca crawler. - Buat konten bermanfaat dan berdasarkan
pengalaman/keahlian yang dapat dipertanggungjawabkan.

## 9.3 Technical SEO

  Elemen           Requirement
  ---------------- --------------------------------------
  HTTPS            Wajib
  Canonical        Self-referencing untuk halaman utama
  Sitemap          XML sitemap
  Robots.txt       Mengatur crawling
  Meta robots      Index/noindex sesuai kebutuhan
  Open Graph       Metadata sharing
  Twitter/X Card   Metadata sharing
  Breadcrumb       Navigasi hierarki
  Responsive       Mobile-first
  Semantic HTML    Header, main, article, nav, footer
  Image alt        Deskriptif
  Pagination       URL yang dapat dirayapi
  Redirect         301 untuk URL lama
  404              Custom not found page
  Search Console   Monitoring indexing
  Analytics        GA4 atau alternatif sesuai kebutuhan

### Rekomendasi indeks halaman

  Halaman                      Index
  ---------------------------- ---------------------------
  Beranda                      Yes
  Tentang Kami                 Yes
  Jasa                         Yes
  Program                      Yes
  Detail program               Yes
  Portofolio                   Yes
  Detail portofolio            Yes
  Blog                         Yes
  Detail blog                  Yes
  Pendaftaran                  Opsional, sesuai strategi
  Admin                        No
  Login                        No
  Preview draft                No
  Halaman pencarian internal   Umumnya No

### Performance SEO

Target Core Web Vitals:

  Indikator          Target
  ----------- -------------
  LCP           ≤ 2,5 detik
  INP              ≤ 200 ms
  CLS                 ≤ 0,1

Target tambahan: - Mobile responsive. - Tidak ada broken links. - Tidak
ada duplicate title yang tidak disengaja. - Gambar menggunakan format
efisien seperti WebP/AVIF. - Ukuran gambar ditentukan agar mengurangi
layout shift. - Lazy loading digunakan untuk gambar di bawah fold. -
Font dan JavaScript dioptimalkan. - Hindari library yang tidak
diperlukan.

## 9.4 Strategi URL SEO

Gunakan pola:

``` text
/program/magang-smk
/program/magang-mahasiswa
/program/magang-informatika
/jasa/seo
/jasa/web-development
/blog/panduan-magang-smk-rpl
/blog/persiapan-magang-mahasiswa
/portofolio/project-website-company-profile
```

Hindari URL seperti:

``` text
/blog?id=123
/page.php?category=internship
/program/detail?id=5
```

## 9.5 Strategi Content Cluster

Pillar page utama: `/program`

Cluster SMK: - Magang RPL. - Magang TKJ. - Magang Multimedia. - Magang
DKV.

Cluster mahasiswa: - Magang Informatika. - Magang Digital Marketing. -
Magang Bisnis Digital. - Magang Pemasaran.

Artikel pendukung: - Panduan. - Tips. - Tutorial. - Persiapan. -
Pengalaman magang yang benar-benar terjadi.

Setiap artikel harus memiliki internal link menuju halaman program yang
sesuai. Setiap halaman program juga perlu mengarahkan pengguna ke
artikel pendukung yang relevan.

------------------------------------------------------------------------

# 10. Structured Data / Schema.org JSON-LD

Bagian ini merupakan rancangan schema untuk implementasi per November
2026. Schema.org adalah vocabulary untuk mendeskripsikan entitas dan
konten. Google hanya mendukung jenis dan fitur structured data tertentu
untuk rich results. Penggunaan schema tidak menjamin tampilan rich
result.

JSON-LD direkomendasikan untuk implementasi. Markup harus sesuai dengan
konten yang benar-benar terlihat oleh pengguna.

## 10.1 Schema Berdasarkan Halaman

  Halaman              Schema type                      Tujuan
  -------------------- -------------------------------- ----------------------
  Beranda              Organization                     Identitas organisasi
  Beranda              WebSite                          Identitas website
  Beranda              WebPage                          Informasi halaman
  Tentang Kami         AboutPage                        Profil organisasi
  Halaman bertingkat   BreadcrumbList                   Navigasi
  Detail jasa          Service                          Informasi jasa
  Program magang       EducationalOccupationalProgram   Informasi program
  Detail blog          Article / BlogPosting            Informasi artikel
  Profil penulis       Person                           Identitas penulis
  Portofolio           CreativeWork                     Informasi karya
  FAQ                  FAQPage                          Semantik FAQ

### Catatan penggunaan schema

-   `JobPosting` hanya digunakan untuk lowongan pekerjaan yang
    benar-benar memenuhi ketentuan Google, bukan sekadar halaman
    informasi program magang.
-   `FAQPage` dapat digunakan untuk mendeskripsikan FAQ yang benar-benar
    tampil, tetapi jangan menjanjikan FAQ rich result.
-   `Service` dan `EducationalOccupationalProgram` merupakan vocabulary
    Schema.org, bukan jaminan fitur khusus di Google.
-   `Organization` ditempatkan pada beranda atau halaman tentang kami
    dan dihubungkan melalui `@id`.
-   Jangan membuat rating, review, alamat, harga, atau klaim organisasi
    yang tidak nyata.
-   Schema harus konsisten dengan konten halaman.

## 10.2 Schema Beranda -- Organization, WebSite, dan WebPage

Template berikut harus dilengkapi dengan data organisasi yang benar
sebelum production.

``` html
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@graph": [
    {
      "@type": "Organization",
      "@id": "https://DOMAIN-ANDA.id/#organization",
      "name": "NAMA ORGANISASI",
      "url": "https://DOMAIN-ANDA.id/",
      "logo": {
        "@type": "ImageObject",
        "url": "https://DOMAIN-ANDA.id/images/logo.png"
      },
      "description": "Program magang SMK dan mahasiswa serta layanan digital marketing, SEO, social media marketing dan web development.",
      "telephone": "+62895639068080",
      "sameAs": [
        "URL-INSTAGRAM",
        "URL-LINKEDIN",
        "URL-TIKTOK"
      ]
    },
    {
      "@type": "WebSite",
      "@id": "https://DOMAIN-ANDA.id/#website",
      "url": "https://DOMAIN-ANDA.id/",
      "name": "NAMA ORGANISASI",
      "publisher": {
        "@id": "https://DOMAIN-ANDA.id/#organization"
      },
      "inLanguage": "id-ID"
    },
    {
      "@type": "WebPage",
      "@id": "https://DOMAIN-ANDA.id/#webpage",
      "url": "https://DOMAIN-ANDA.id/",
      "name": "Program Magang SMK & Mahasiswa",
      "description": "Informasi program magang dan layanan digital.",
      "isPartOf": {
        "@id": "https://DOMAIN-ANDA.id/#website"
      },
      "about": {
        "@id": "https://DOMAIN-ANDA.id/#organization"
      },
      "inLanguage": "id-ID"
    }
  ]
}
</script>
```

`sameAs` hanya diisi dengan profil resmi yang benar-benar dimiliki
organisasi. Email, alamat kantor, logo, dan akun media sosial tidak
boleh diisi dengan data contoh yang belum ada.

## 10.3 Schema AboutPage

``` json
{
  "@context": "https://schema.org",
  "@type": "AboutPage",
  "@id": "https://DOMAIN-ANDA.id/tentang-kami#webpage",
  "url": "https://DOMAIN-ANDA.id/tentang-kami",
  "name": "Tentang Kami",
  "isPartOf": {
    "@id": "https://DOMAIN-ANDA.id/#website"
  },
  "about": {
    "@id": "https://DOMAIN-ANDA.id/#organization"
  },
  "inLanguage": "id-ID"
}
```

## 10.4 Schema BreadcrumbList

Digunakan pada halaman jasa, program, blog, dan portofolio.

``` json
{
  "@context": "https://schema.org",
  "@type": "BreadcrumbList",
  "itemListElement": [
    {
      "@type": "ListItem",
      "position": 1,
      "name": "Beranda",
      "item": "https://DOMAIN-ANDA.id/"
    },
    {
      "@type": "ListItem",
      "position": 2,
      "name": "Program",
      "item": "https://DOMAIN-ANDA.id/program"
    },
    {
      "@type": "ListItem",
      "position": 3,
      "name": "Magang SMK",
      "item": "https://DOMAIN-ANDA.id/program/magang-smk"
    }
  ]
}
```

Untuk halaman detail, breadcrumb mengikuti hierarki URL aktual.

## 10.5 Schema Service

Digunakan pada setiap halaman detail jasa.

``` json
{
  "@context": "https://schema.org",
  "@type": "Service",
  "@id": "https://DOMAIN-ANDA.id/jasa/seo#service",
  "name": "Jasa SEO Website",
  "serviceType": "Search Engine Optimization",
  "description": "Layanan optimasi mesin pencari untuk membantu meningkatkan visibilitas website.",
  "url": "https://DOMAIN-ANDA.id/jasa/seo",
  "provider": {
    "@id": "https://DOMAIN-ANDA.id/#organization"
  },
  "areaServed": {
    "@type": "Country",
    "name": "Indonesia"
  }
}
```

Sesuaikan `areaServed` dengan wilayah layanan yang benar-benar dilayani.

## 10.6 Schema EducationalOccupationalProgram

Contoh untuk halaman program magang mahasiswa Informatika.

``` json
{
  "@context": "https://schema.org",
  "@type": "EducationalOccupationalProgram",
  "@id": "https://DOMAIN-ANDA.id/program/magang-informatika#program",
  "name": "Program Magang Mahasiswa Informatika",
  "description": "Program magang praktik di bidang informatika, pengembangan website, database dan teknologi digital.",
  "url": "https://DOMAIN-ANDA.id/program/magang-informatika",
  "provider": {
    "@id": "https://DOMAIN-ANDA.id/#organization"
  },
  "educationalProgramMode": "Blended",
  "programType": "Internship",
  "occupationalCategory": "Information Technology",
  "timeToComplete": "P4M",
  "inLanguage": "id-ID"
}
```

`P4M` adalah contoh durasi empat bulan dalam format ISO 8601. Ganti
dengan durasi sebenarnya. `educationalProgramMode` juga harus sesuai
dengan metode program yang benar-benar tersedia.

## 10.7 Schema BlogPosting

Contoh untuk halaman artikel.

``` json
{
  "@context": "https://schema.org",
  "@type": "BlogPosting",
  "@id": "https://DOMAIN-ANDA.id/blog/panduan-magang-smk-rpl#article",
  "mainEntityOfPage": {
    "@type": "WebPage",
    "@id": "https://DOMAIN-ANDA.id/blog/panduan-magang-smk-rpl"
  },
  "headline": "Panduan Magang SMK RPL untuk Pemula",
  "description": "Panduan persiapan magang siswa SMK jurusan Rekayasa Perangkat Lunak.",
  "image": [
    "https://DOMAIN-ANDA.id/images/blog/magang-rpl-16x9.webp",
    "https://DOMAIN-ANDA.id/images/blog/magang-rpl-4x3.webp",
    "https://DOMAIN-ANDA.id/images/blog/magang-rpl-1x1.webp"
  ],
  "datePublished": "2026-11-08T09:00:00+07:00",
  "dateModified": "2026-11-08T09:00:00+07:00",
  "author": {
    "@type": "Organization",
    "@id": "https://DOMAIN-ANDA.id/#organization",
    "name": "NAMA ORGANISASI"
  },
  "publisher": {
    "@id": "https://DOMAIN-ANDA.id/#organization"
  },
  "inLanguage": "id-ID"
}
```

Tanggal di atas hanya contoh. Sistem harus mengambil tanggal publikasi
dan update sebenarnya dari database. Jika penulis adalah individu,
gunakan `Person` dengan nama dan profil penulis yang benar.

## 10.8 Schema FAQPage

Gunakan jika pertanyaan dan jawaban benar-benar ditampilkan pada
halaman.

``` json
{
  "@context": "https://schema.org",
  "@type": "FAQPage",
  "mainEntity": [
    {
      "@type": "Question",
      "name": "Siapa saja yang dapat mengikuti program magang?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "Program magang ditujukan untuk siswa SMK dan mahasiswa dari jurusan yang sesuai dengan bidang program."
      }
    },
    {
      "@type": "Question",
      "name": "Bagaimana cara mendaftar program magang?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "Calon peserta dapat mengisi formulir pendaftaran melalui halaman pendaftaran website."
      }
    }
  ]
}
```

Jawaban harus sesuai dengan kebijakan program yang sebenarnya.

## 10.9 Schema CreativeWork untuk Portofolio

``` json
{
  "@context": "https://schema.org",
  "@type": "CreativeWork",
  "@id": "https://DOMAIN-ANDA.id/portofolio/project-website#project",
  "name": "Website Company Profile",
  "description": "Proyek pengembangan website company profile.",
  "url": "https://DOMAIN-ANDA.id/portofolio/project-website",
  "creator": {
    "@id": "https://DOMAIN-ANDA.id/#organization"
  },
  "dateCreated": "2026-01-01",
  "inLanguage": "id-ID"
}
```

Tanggal dan identitas proyek harus bersumber dari data portofolio.

## 10.10 Implementasi Schema Dinamis di Astro

Buat komponen reusable:

`src/components/SEO/JsonLd.astro`

``` astro
---
interface Props {
  data: Record<string, any>;
}

const { data } = Astro.props;
---

<script
  type="application/ld+json"
  set:html={JSON.stringify(data).replace(/</g, "\\u003c")}
/>
```

Contoh penggunaan pada halaman artikel:

``` astro
---
import JsonLd from "../../components/SEO/JsonLd.astro";

const articleSchema = {
  "@context": "https://schema.org",
  "@type": "BlogPosting",
  headline: post.title,
  description: post.meta_description,
  url: new URL(`/blog/${post.slug}`, Astro.site).href,
  datePublished: post.published_at,
  dateModified: post.updated_at,
  inLanguage: "id-ID"
};
---

<JsonLd data={articleSchema} />
```

Untuk production, tambahkan `author`, `publisher`, `image`, dan
`mainEntityOfPage`. Gunakan satu schema yang konsisten untuk setiap
halaman dan hindari markup duplikat atau bertentangan. Validasi data dan
pastikan nilai JSON-LD berasal dari sumber yang tepercaya.

### Validasi Schema

-   Google Rich Results Test.
-   Schema.org Validator.
-   Google Search Console URL Inspection.

------------------------------------------------------------------------

# 11. Struktur Folder Astro

Struktur folder yang direkomendasikan:

``` text
project-magang/
│
├── public/
│   ├── images/
│   ├── icons/
│   ├── favicon.svg
│   ├── robots.txt
│   └── manifest.webmanifest
│
├── src/
│   ├── components/
│   │   ├── Header.astro
│   │   ├── Footer.astro
│   │   ├── Navbar.astro
│   │   ├── WhatsAppButton.astro
│   │   ├── Breadcrumb.astro
│   │   ├── SEO/
│   │   │   ├── Meta.astro
│   │   │   ├── JsonLd.astro
│   │   │   └── OpenGraph.astro
│   │   ├── home/
│   │   ├── program/
│   │   ├── services/
│   │   ├── blog/
│   │   └── portfolio/
│   │
│   ├── layouts/
│   │   ├── MainLayout.astro
│   │   ├── BlogLayout.astro
│   │   └── AdminLayout.astro
│   │
│   ├── pages/
│   │   ├── index.astro
│   │   ├── tentang-kami.astro
│   │   ├── jasa/
│   │   ├── program/
│   │   ├── blog/
│   │   ├── portofolio/
│   │   ├── pendaftaran.astro
│   │   ├── kebijakan-privasi.astro
│   │   ├── syarat-ketentuan.astro
│   │   ├── admin/
│   │   │   ├── login.astro
│   │   │   ├── index.astro
│   │   │   ├── pendaftaran/
│   │   │   ├── program/
│   │   │   ├── jasa/
│   │   │   ├── blog/
│   │   │   ├── portofolio/
│   │   │   └── pengaturan/
│   │   └── api/
│   │       ├── applications.ts
│   │       └── upload.ts
│   │
│   ├── lib/
│   │   ├── supabase/
│   │   │   ├── client.ts
│   │   │   ├── server.ts
│   │   │   └── admin.ts
│   │   ├── validation/
│   │   ├── seo/
│   │   └── utils/
│   │
│   ├── styles/
│   │   ├── global.css
│   │   ├── theme.css
│   │   ├── custom.css
│   │   └── admin.css
│   │
│   └── middleware.ts
│
├── supabase/
│   ├── migrations/
│   └── seed.sql
│
├── .env
├── .env.example
├── astro.config.mjs
├── package.json
└── tsconfig.json
```

Catatan: - Struktur folder admin, API, dan library server harus
mengikuti konfigurasi SSR serta adapter deployment. - Jangan mengimpor
modul server atau secret ke komponen browser. - Gunakan migration SQL
untuk perubahan skema database. - Simpan seed data untuk data awal yang
aman dan tidak berisi data pribadi.

------------------------------------------------------------------------

# 12. UI/UX Design Specification

## 12.1 Konsep Visual

Tema desain: **Elegant Maroon & White**.

Karakter desain: - Profesional. - Elegan. - Modern. - Minimalis. -
Memiliki whitespace cukup. - Navigasi sederhana. - Card-based layout. -
Responsif.

Desain dapat mengambil inspirasi dari karakter website agency
profesional seperti BootstrapMade, tetapi tidak menyalin template, kode,
atau aset berhak cipta.

## 12.2 Color Palette

  Elemen       Warna        Hex
  ------------ ------------ -----------
  Primary      Maroon       `#651D32`
  Secondary    Burgundy     `#8A3049`
  Accent       Rose         `#C17B8C`
  Background   Off-white    `#F8F6F5`
  Surface      White        `#FFFFFF`
  Text         Charcoal     `#292529`
  Muted        Gray         `#777078`
  Border       Light gray   `#EAE5E5`

## 12.3 Typography

Rekomendasi: - Heading: Plus Jakarta Sans. - Body: Inter. - Heading
weight: 600--700. - Body weight: 400--500.

Font harus dioptimalkan, menggunakan subset yang diperlukan, dan sebisa
mungkin dilayani secara efisien.

## 12.4 Komponen Desain

  Komponen   Desain
  ---------- -------------------------------------------
  Navbar     Putih, sticky, shadow tipis
  Dropdown   Putih, rounded, subtle shadow
  Hero       Putih/off-white dengan aksen maroon
  CTA        Maroon dengan teks putih
  Card       Putih dengan border tipis
  Section    Bergantian putih dan off-white
  Footer     Maroon gelap
  Form       Input minimalis dengan focus state maroon
  WhatsApp   Floating button hijau WhatsApp

## 12.5 Layout Homepage

Urutan section:

1.  Navbar.
2.  Hero section.
3.  Trust indicators jika data tersedia.
4.  About us.
5.  Program magang.
6.  Bidang keahlian.
7.  Services.
8.  Portfolio.
9.  Why choose us.
10. Blog.
11. FAQ.
12. CTA.
13. Footer.

## 12.6 Responsive Design

-   Mobile: satu kolom.
-   Tablet: dua kolom untuk card.
-   Desktop: tiga atau empat kolom.
-   Navbar menjadi offcanvas pada layar kecil.
-   Dropdown dapat diakses dengan sentuhan dan keyboard.
-   Form menggunakan input full-width pada mobile.
-   Floating WhatsApp tidak menutupi tombol form.
-   Semua elemen interaktif memiliki focus state yang terlihat.

## 12.7 Aturan CTA

  Elemen                           Tujuan
  -------------------------------- ------------------------------------------------
  Konsultasi                       WhatsApp
  Tanya Program                    WhatsApp
  Hubungi Kami                     WhatsApp
  Jasa Kami                        WhatsApp
  Hero CTA                         WhatsApp atau halaman pendaftaran sesuai label
  Floating WhatsApp                WhatsApp
  Submit Form Pendaftaran          Mengirim data ke Supabase
  Konfirmasi setelah pendaftaran   WhatsApp

Semua CTA komunikasi menggunakan nomor WhatsApp `+62895639068080`.
Tombol submit formulir tetap menjalankan fungsi pendaftaran dan
menyimpan data terlebih dahulu.

------------------------------------------------------------------------

# 13. Non-Functional Requirements

  ID       Kategori          Requirement
  -------- ----------------- -------------------------------------------
  NFR-01   Performance       Halaman cepat dimuat
  NFR-02   SEO               HTML dapat dirayapi mesin pencari
  NFR-03   Security          Menggunakan HTTPS
  NFR-04   Security          RLS pada tabel terekspos
  NFR-05   Security          Admin menggunakan autentikasi
  NFR-06   Security          Validasi file upload
  NFR-07   Responsive        Mendukung mobile, tablet, desktop
  NFR-08   Usability         Navigasi mudah dipahami
  NFR-09   Maintainability   Komponen dapat digunakan ulang
  NFR-10   Scalability       Database dapat dikembangkan
  NFR-11   Availability      Memiliki monitoring dan backup
  NFR-12   Accessibility     Semantic HTML dan keyboard navigation
  NFR-13   Privacy           Data pribadi peserta dilindungi
  NFR-14   Reliability       Form menangani error dan pengiriman ganda
  NFR-15   Compatibility     Mendukung browser modern

## 13.1 Privacy dan Perlindungan Data

Karena sistem menyimpan data pribadi peserta, implementasi harus
memperhatikan UU Perlindungan Data Pribadi Indonesia (UU No. 27 Tahun
2022).

Ketentuan: - Persetujuan pemrosesan data sebelum pendaftaran. -
Penjelasan tujuan pengumpulan data. - Kebijakan retensi data. -
Pembatasan akses admin. - Pengamanan dokumen peserta. - Mekanisme
permintaan penghapusan atau koreksi data. - Tidak menampilkan identitas
peserta di halaman publik. - Tidak menggunakan data peserta untuk
pemasaran tanpa dasar pemrosesan dan persetujuan yang sesuai. - Hindari
mengumpulkan data yang tidak diperlukan. - Batasi akses dan masa
penyimpanan data sesuai kebijakan yang ditetapkan.

------------------------------------------------------------------------

# 14. SEO Management dalam CMS

CMS harus memiliki modul SEO khusus agar setiap halaman dapat
dioptimalkan tanpa mengubah source code.

## 14.1 SEO Fields

  Field              Fungsi
  ------------------ -----------------------
  Meta title         Judul hasil pencarian
  Meta description   Deskripsi pencarian
  Slug               URL halaman
  Canonical URL      URL utama
  OG title           Judul sharing
  OG description     Deskripsi sharing
  OG image           Gambar sharing
  Robots index       Index/noindex
  Robots follow      Follow/nofollow
  Schema type        Tipe structured data
  Focus keyword      Panduan editorial
  Image alt          Optimasi gambar
  Published date     Tanggal publikasi
  Modified date      Tanggal pembaruan

Schema JSON-LD sebaiknya dihasilkan otomatis dari data konten, bukan
meminta admin menulis JSON secara manual.

Admin cukup memilih jenis halaman: - Artikel. - Program. - Jasa. -
Portofolio. - Halaman umum.

Sistem membangun schema yang sesuai dengan tipe konten.

------------------------------------------------------------------------

# 15. Deployment dan Environment Configuration

## 15.1 Rekomendasi Deployment

  Komponen           Rekomendasi
  ------------------ --------------------------------------
  Frontend           Cloudflare Pages/Workers atau Vercel
  Backend services   Supabase
  Database           Supabase PostgreSQL
  Storage            Supabase Storage
  Domain             Domain custom `.com` atau `.id`
  Analytics          Google Analytics 4 atau alternatif
  SEO monitoring     Google Search Console
  CDN/DNS            Cloudflare jika sesuai kebutuhan

Untuk Astro yang menggunakan SSR, pastikan adapter cocok dengan platform
deployment. Jika memilih static hosting, gunakan fungsi server atau
backend terpisah untuk endpoint pendaftaran dan admin.

## 15.2 Environment Variables

Contoh `.env.example`:

``` env
PUBLIC_SITE_URL=https://DOMAIN-ANDA.id

PUBLIC_SUPABASE_URL=
PUBLIC_SUPABASE_PUBLISHABLE_KEY=

SUPABASE_SECRET_KEY=

WHATSAPP_NUMBER=62895639068080

TURNSTILE_SECRET_KEY=
PUBLIC_TURNSTILE_SITE_KEY=
```

Catatan keamanan: - Variabel berawalan `PUBLIC_` dapat tersedia di
browser. - Secret key hanya tersedia di server. - Jangan commit `.env`
ke Git. - Jangan menggunakan secret key pada operasi browser. - Jika
menggunakan key lama `service_role`, perlakukan sebagai secret dengan
hak akses tinggi. - Gunakan environment variables terpisah untuk
development, staging, dan production.

------------------------------------------------------------------------

# 16. Testing dan Acceptance Criteria

Sistem dianggap siap digunakan apabila kriteria berikut terpenuhi.

## 16.1 Frontend

-   [ ] Semua halaman dapat diakses.
-   [ ] Navbar berfungsi.
-   [ ] Dropdown berfungsi.
-   [ ] Tampilan mobile responsif.
-   [ ] Semua CTA WhatsApp menggunakan nomor yang benar.
-   [ ] Gambar memiliki alt text.
-   [ ] Tidak terdapat broken link.
-   [ ] Form memiliki validasi.
-   [ ] Tampilan 404 tersedia.
-   [ ] Navigasi dapat digunakan dengan keyboard.
-   [ ] Kontras teks dan tombol memadai.

## 16.2 Database

-   [ ] Database Supabase terhubung.
-   [ ] Semua tabel inti tersedia.
-   [ ] Relasi foreign key benar.
-   [ ] RLS aktif dan sudah diuji.
-   [ ] Konten draft tidak tampil ke publik.
-   [ ] Form pendaftaran menyimpan data.
-   [ ] Nomor pendaftaran unik.
-   [ ] Upload dokumen berfungsi.
-   [ ] Data peserta tidak dapat dibaca publik.
-   [ ] Validasi data dilakukan di server.
-   [ ] Pengiriman ganda ditangani.

## 16.3 Admin

-   [ ] Admin bisa login.
-   [ ] Admin bisa logout.
-   [ ] Admin dapat mengelola artikel.
-   [ ] Admin dapat mengelola program.
-   [ ] Admin dapat mengelola jasa.
-   [ ] Admin dapat mengelola portofolio.
-   [ ] Admin dapat memproses pendaftaran.
-   [ ] Admin dapat mengubah status.
-   [ ] Admin dapat mengakses dokumen sesuai hak akses.
-   [ ] Role admin dan editor diterapkan.
-   [ ] Perubahan status tercatat dalam log.

## 16.4 SEO

-   [ ] Meta title unik.
-   [ ] Meta description unik.
-   [ ] Canonical benar.
-   [ ] Sitemap tersedia.
-   [ ] Robots.txt tersedia.
-   [ ] JSON-LD valid.
-   [ ] Breadcrumb sesuai hierarki.
-   [ ] Open Graph tersedia.
-   [ ] Halaman admin noindex.
-   [ ] Search Console terhubung.
-   [ ] Tidak ada konten penting yang hanya muncul setelah interaksi
    JavaScript.
-   [ ] Redirect URL lama diterapkan jika ada perubahan slug.

## 16.5 Security

-   [ ] Tidak ada secret key di bundle frontend.
-   [ ] RLS diuji dengan role anonim dan admin.
-   [ ] Upload file dibatasi ukuran dan MIME type.
-   [ ] Bucket dokumen bersifat private.
-   [ ] Signed URL memiliki masa berlaku.
-   [ ] Endpoint pendaftaran memiliki rate limit atau perlindungan
    penyalahgunaan.
-   [ ] CAPTCHA atau perlindungan bot diuji.
-   [ ] Input dan output divalidasi/disanitasi.
-   [ ] Admin memiliki akses minimum sesuai tugasnya.

------------------------------------------------------------------------

# 17. Roadmap Pengembangan

  Tahap   Pekerjaan                          Prioritas
  ------- ---------------------------------- ---------------
  1       Setup Astro, Bootstrap, Supabase   Tinggi
  2       Design system dan layout utama     Tinggi
  3       Homepage dan Tentang Kami          Tinggi
  4       Halaman Program dan Jasa           Tinggi
  5       Form Pendaftaran dan database      Sangat tinggi
  6       Admin login dan dashboard          Sangat tinggi
  7       CRUD blog dan portofolio           Tinggi
  8       SEO dan JSON-LD                    Sangat tinggi
  9       Security testing                   Sangat tinggi
  10      Deployment dan monitoring          Sangat tinggi

## 17.1 Pembagian MVP

### MVP 1 -- Company Profile

-   Homepage.
-   Tentang Kami.
-   Jasa.
-   Program.
-   Portofolio.
-   Blog awal.
-   CTA WhatsApp.

### MVP 2 -- Sistem Pendaftaran

-   Form pendaftaran.
-   Database Supabase.
-   Nomor pendaftaran.
-   Upload dokumen.
-   Konfirmasi WhatsApp.

### MVP 3 -- Admin Semi-CMS

-   Login.
-   Dashboard.
-   CRUD program.
-   CRUD jasa.
-   CRUD artikel.
-   CRUD portofolio.
-   Manajemen pendaftar.
-   Pengaturan website.

### MVP 4 -- SEO dan Optimasi

-   Dynamic metadata.
-   Schema JSON-LD.
-   Sitemap.
-   Indexing.
-   Performance optimization.
-   Analytics.
-   Search Console.

------------------------------------------------------------------------

# 18. Referensi Dokumentasi Resmi

Gunakan dokumentasi resmi berikut sebagai acuan implementasi. Periksa
kembali perubahan dokumentasi dan versi library ketika development
dimulai.

  --------------------------------------------------------------------------------------------------------------------------------
  Dokumentasi                         URL
  ----------------------------------- --------------------------------------------------------------------------------------------
  Astro Rendering Modes               https://docs.astro.build/en/guides/on-demand-rendering/

  Astro Configuration                 https://docs.astro.build/en/reference/configuration-reference/

  Astro Environment Variables         https://docs.astro.build/en/guides/environment-variables/

  Astro Sitemap                       https://docs.astro.build/en/guides/integrations-guide/sitemap/

  Supabase Astro Quickstart           https://supabase.com/docs/guides/getting-started/quickstarts/astro

  Supabase Auth                       https://supabase.com/docs/guides/auth

  Supabase Row Level Security         https://supabase.com/docs/guides/database/postgres/row-level-security

  Supabase Storage                    https://supabase.com/docs/guides/storage

  Google Structured Data              https://developers.google.com/search/docs/appearance/structured-data/intro-structured-data

  Google Organization                 https://developers.google.com/search/docs/appearance/structured-data/organization

  Google Article                      https://developers.google.com/search/docs/appearance/structured-data/article

  Google JobPosting                   https://developers.google.com/search/docs/appearance/structured-data/job-posting

  Google SEO Starter Guide            https://developers.google.com/search/docs/fundamentals/seo-starter-guide

  Schema.org                          https://schema.org/
  --------------------------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------

# 19. Keputusan Teknis Akhir

  Bagian            Keputusan
  ----------------- -------------------------------
  Frontend          Astro + Bootstrap 5
  Database          Supabase PostgreSQL
  Authentication    Supabase Auth
  File storage      Supabase Storage
  Rendering         Hybrid Static + SSR
  CMS               Custom Admin Dashboard
  Editor artikel    TipTap
  SEO               Dynamic SEO Metadata
  Schema            JSON-LD berbasis tipe halaman
  Sitemap           Astro Sitemap
  Form              Astro API + Supabase
  Spam protection   Cloudflare Turnstile
  Komunikasi        WhatsApp
  Desain            Maroon & White Elegant

## 19.1 Prinsip Pengembangan

1.  Website tidak hanya menjadi situs magang. Gabungkan program magang
    dan layanan digital dalam satu identitas organisasi.
2.  Buat halaman khusus setiap jurusan agar dapat menargetkan pencarian
    seperti magang SMK RPL, magang TKJ, magang DKV, dan magang mahasiswa
    Informatika.
3.  Gunakan Supabase sebagai pusat data, termasuk CMS, pendaftaran, dan
    pengaturan website.
4.  Jangan mengorbankan SEO dengan membuat seluruh konten hanya muncul
    melalui JavaScript di browser. Prioritaskan HTML yang sudah dirender
    di server atau saat build.
5.  Bangun sistem pendaftaran dan keamanan data terlebih dahulu sebelum
    membuka pendaftaran untuk publik.
6.  Gunakan satu sumber data untuk konten website dan metadata SEO agar
    tidak terjadi inkonsistensi.
7.  Pastikan setiap konten yang dipublikasikan telah diperiksa secara
    editorial.
8.  Terapkan backup, logging, dan monitoring sebelum sistem digunakan
    secara luas.

------------------------------------------------------------------------

# 20. Informasi yang Masih Perlu Ditentukan

PRD ini dapat menjadi dasar pengembangan. Namun, data bisnis berikut
belum tersedia dan tidak boleh diasumsikan:

-   Nama brand atau organisasi.
-   Domain website.
-   Logo resmi.
-   Alamat organisasi.
-   Email resmi.
-   Instagram dan media sosial.
-   Durasi program magang.
-   Lokasi dan metode pelaksanaan.
-   Apakah magang berbayar, tidak berbayar, atau memiliki biaya
    administrasi.
-   Apakah tersedia mentor.
-   Apakah tersedia sertifikat.
-   Apakah tersedia surat keterangan magang.
-   Kapasitas penerimaan peserta.
-   Jadwal atau periode pendaftaran.

Data tersebut nantinya dimasukkan melalui modul pengaturan website dan
pengelolaan program.

------------------------------------------------------------------------

# 21. Rekomendasi Langkah Pengembangan Berikutnya

Urutan teknis yang disarankan:

1.  Finalisasi identitas organisasi dan kebijakan program magang.
2.  Buat database schema SQL Supabase lengkap dengan migration, foreign
    key, index, constraint, RLS policies, Storage policies, dan seed
    data.
3.  Setup proyek Astro, Bootstrap, adapter SSR, dan koneksi Supabase.
4.  Bangun design system maroon dan layout utama.
5.  Implementasikan halaman publik dan konten program.
6.  Implementasikan form pendaftaran dan upload dokumen.
7.  Implementasikan autentikasi serta admin semi-CMS.
8.  Implementasikan SEO metadata, sitemap, dan JSON-LD.
9.  Lakukan pengujian keamanan, fungsional, performa, dan SEO.
10. Deploy ke production dan pantau hasilnya.

**Kesimpulan:** Astro + Supabase menjadi fondasi utama, Bootstrap
digunakan untuk desain, dan website dibangun sebagai kombinasi digital
agency, platform informasi magang, serta sistem pendaftaran online yang
dapat dikelola secara mandiri.
