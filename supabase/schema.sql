-- =====================================================================
-- SCHEMA WEBSITE PROGRAM MAGANG & DIGITAL AGENCY
-- Sesuai PRD November 2026 (Astro + Supabase)
-- =====================================================================

-- 1. EXTENSIONS
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- 2. ENUMS & TYPES (Opsional, gunakan text + check constraint untuk fleksibilitas)

-- ---------------------------------------------------------------------
-- TABEL 1: admin_profiles (Profil dan Hak Akses Admin)
-- ---------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS public.admin_profiles (
    id UUID PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
    full_name TEXT NOT NULL,
    role TEXT NOT NULL DEFAULT 'admin' CHECK (role IN ('super_admin', 'admin', 'editor')),
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

-- ---------------------------------------------------------------------
-- TABEL 2: site_settings (Pengaturan Global Website)
-- ---------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS public.site_settings (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    org_name TEXT NOT NULL DEFAULT 'Program Magang & Digital Agency',
    tagline TEXT DEFAULT 'Bangun Skill Digital, Kembangkan Potensi, dan Siapkan Karier Masa Depan',
    description TEXT DEFAULT 'Platform terpadu program magang SMK & mahasiswa serta layanan digital agency profesional.',
    logo_url TEXT,
    whatsapp_number TEXT NOT NULL DEFAULT '62895639068080',
    email TEXT DEFAULT 'info@programmagang.id',
    address TEXT DEFAULT 'Indonesia',
    instagram_url TEXT,
    linkedin_url TEXT,
    tiktok_url TEXT,
    footer_text TEXT DEFAULT '© 2026 Program Magang & Digital Agency. All rights reserved.',
    default_meta_title TEXT DEFAULT 'Program Magang SMK & Mahasiswa dan Jasa Digital',
    default_meta_description TEXT DEFAULT 'Temukan program magang SMK dan mahasiswa bidang Informatika, RPL, TKJ, DKV, Bisnis Digital dan layanan digital agency terpercaya.',
    default_og_image TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

-- ---------------------------------------------------------------------
-- TABEL 3: programs (Program Magang SMK & Mahasiswa)
-- ---------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS public.programs (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    title TEXT NOT NULL,
    slug TEXT NOT NULL UNIQUE,
    category TEXT NOT NULL CHECK (category IN ('smk', 'mahasiswa', 'umum')),
    target_major TEXT,
    short_description TEXT,
    description TEXT,
    requirements JSONB NOT NULL DEFAULT '[]'::jsonb,
    curriculum JSONB NOT NULL DEFAULT '[]'::jsonb,
    duration TEXT DEFAULT '3 - 6 Bulan',
    mode TEXT NOT NULL DEFAULT 'hybrid' CHECK (mode IN ('online', 'offline', 'hybrid')),
    location TEXT DEFAULT 'Head Office / Remote',
    benefits JSONB NOT NULL DEFAULT '[]'::jsonb,
    thumbnail TEXT,
    meta_title TEXT,
    meta_description TEXT,
    sort_order INTEGER NOT NULL DEFAULT 0,
    is_published BOOLEAN NOT NULL DEFAULT true,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_programs_slug ON public.programs(slug);
CREATE INDEX IF NOT EXISTS idx_programs_category ON public.programs(category);
CREATE INDEX IF NOT EXISTS idx_programs_is_published ON public.programs(is_published);

-- ---------------------------------------------------------------------
-- TABEL 4: services (Layanan Digital Agency)
-- ---------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS public.services (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    title TEXT NOT NULL,
    slug TEXT NOT NULL UNIQUE,
    short_description TEXT,
    content TEXT,
    features JSONB NOT NULL DEFAULT '[]'::jsonb,
    process_steps JSONB NOT NULL DEFAULT '[]'::jsonb,
    target_market TEXT,
    thumbnail TEXT,
    icon TEXT DEFAULT 'bi-briefcase',
    meta_title TEXT,
    meta_description TEXT,
    sort_order INTEGER NOT NULL DEFAULT 0,
    is_published BOOLEAN NOT NULL DEFAULT true,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_services_slug ON public.services(slug);
CREATE INDEX IF NOT EXISTS idx_services_is_published ON public.services(is_published);

-- ---------------------------------------------------------------------
-- TABEL 5: portfolio_categories
-- ---------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS public.portfolio_categories (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name TEXT NOT NULL,
    slug TEXT NOT NULL UNIQUE,
    description TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

-- ---------------------------------------------------------------------
-- TABEL 6: portfolios (Hasil Karya & Studi Kasus)
-- ---------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS public.portfolios (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    category_id UUID REFERENCES public.portfolio_categories(id) ON DELETE SET NULL,
    title TEXT NOT NULL,
    slug TEXT NOT NULL UNIQUE,
    short_description TEXT,
    client_name TEXT,
    project_date DATE,
    tech_stack JSONB NOT NULL DEFAULT '[]'::jsonb,
    project_url TEXT,
    content TEXT,
    thumbnail TEXT,
    gallery JSONB NOT NULL DEFAULT '[]'::jsonb,
    meta_title TEXT,
    meta_description TEXT,
    is_featured BOOLEAN NOT NULL DEFAULT false,
    is_published BOOLEAN NOT NULL DEFAULT true,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_portfolios_slug ON public.portfolios(slug);
CREATE INDEX IF NOT EXISTS idx_portfolios_category_id ON public.portfolios(category_id);
CREATE INDEX IF NOT EXISTS idx_portfolios_is_published ON public.portfolios(is_published);

-- ---------------------------------------------------------------------
-- TABEL 7: blog_categories
-- ---------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS public.blog_categories (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name TEXT NOT NULL,
    slug TEXT NOT NULL UNIQUE,
    description TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

-- ---------------------------------------------------------------------
-- TABEL 8: blog_posts (Artikel & Content Marketing)
-- ---------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS public.blog_posts (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    category_id UUID REFERENCES public.blog_categories(id) ON DELETE SET NULL,
    author_id UUID REFERENCES public.admin_profiles(id) ON DELETE SET NULL,
    title TEXT NOT NULL,
    slug TEXT NOT NULL UNIQUE,
    excerpt TEXT,
    content TEXT NOT NULL,
    thumbnail TEXT,
    image_alt TEXT,
    meta_title TEXT,
    meta_description TEXT,
    canonical_url TEXT,
    focus_keyword TEXT,
    og_image TEXT,
    status TEXT NOT NULL DEFAULT 'draft' CHECK (status IN ('draft', 'published')),
    published_at TIMESTAMPTZ,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_blog_posts_slug ON public.blog_posts(slug);
CREATE INDEX IF NOT EXISTS idx_blog_posts_category_id ON public.blog_posts(category_id);
CREATE INDEX IF NOT EXISTS idx_blog_posts_status ON public.blog_posts(status);

-- ---------------------------------------------------------------------
-- TABEL 9: applications (Pendaftaran Peserta Magang)
-- ---------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS public.applications (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    application_number TEXT NOT NULL UNIQUE,
    full_name TEXT NOT NULL,
    email TEXT NOT NULL,
    whatsapp TEXT NOT NULL,
    participant_type TEXT NOT NULL CHECK (participant_type IN ('smk', 'mahasiswa')),
    institution TEXT NOT NULL,
    major TEXT NOT NULL,
    class_or_semester TEXT NOT NULL,
    program_id UUID REFERENCES public.programs(id) ON DELETE RESTRICT,
    preferred_field TEXT NOT NULL,
    duration TEXT NOT NULL,
    start_date DATE NOT NULL,
    internship_mode TEXT NOT NULL CHECK (internship_mode IN ('online', 'offline', 'hybrid')),
    portfolio_url TEXT,
    notes TEXT,
    privacy_consent_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    status TEXT NOT NULL DEFAULT 'pending' CHECK (status IN ('pending', 'reviewing', 'accepted', 'rejected', 'withdrawn')),
    admin_notes TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_applications_number ON public.applications(application_number);
CREATE INDEX IF NOT EXISTS idx_applications_email ON public.applications(email);
CREATE INDEX IF NOT EXISTS idx_applications_status ON public.applications(status);
CREATE INDEX IF NOT EXISTS idx_applications_created_at ON public.applications(created_at DESC);

-- ---------------------------------------------------------------------
-- TABEL 10: application_documents (Metadata Dokumen CV / Surat)
-- ---------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS public.application_documents (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    application_id UUID NOT NULL REFERENCES public.applications(id) ON DELETE CASCADE,
    document_type TEXT NOT NULL CHECK (document_type IN ('cv', 'cover_letter', 'other')),
    storage_path TEXT NOT NULL,
    original_filename TEXT NOT NULL,
    mime_type TEXT NOT NULL,
    file_size BIGINT NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_app_docs_application_id ON public.application_documents(application_id);

-- ---------------------------------------------------------------------
-- TABEL 11: application_logs (Audit Perubahan Status Pendaftaran)
-- ---------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS public.application_logs (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    application_id UUID NOT NULL REFERENCES public.applications(id) ON DELETE CASCADE,
    old_status TEXT,
    new_status TEXT NOT NULL,
    changed_by UUID REFERENCES public.admin_profiles(id) ON DELETE SET NULL,
    admin_note TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_app_logs_application_id ON public.application_logs(application_id);

-- ---------------------------------------------------------------------
-- TABEL 12: media_assets (Media Library)
-- ---------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS public.media_assets (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    title TEXT,
    alt_text TEXT,
    file_name TEXT NOT NULL,
    storage_path TEXT NOT NULL,
    mime_type TEXT NOT NULL,
    file_size BIGINT NOT NULL,
    uploaded_by UUID REFERENCES public.admin_profiles(id) ON DELETE SET NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

-- =====================================================================
-- ROW LEVEL SECURITY (RLS) POLICIES
-- =====================================================================

ALTER TABLE public.admin_profiles ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.site_settings ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.programs ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.services ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.portfolio_categories ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.portfolios ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.blog_categories ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.blog_posts ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.applications ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.application_documents ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.application_logs ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.media_assets ENABLE ROW LEVEL SECURITY;

-- Helper function: cek apakah user login adalah admin
CREATE OR REPLACE FUNCTION public.is_admin()
RETURNS BOOLEAN AS $$
BEGIN
    RETURN EXISTS (
        SELECT 1 FROM public.admin_profiles
        WHERE id = auth.uid()
    );
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- 1. admin_profiles: Hanya admin yang bisa membaca dirinya sendiri / sesama admin
CREATE POLICY "Admins can view profiles" ON public.admin_profiles
    FOR SELECT TO authenticated
    USING (public.is_admin());

CREATE POLICY "Super admin can update profiles" ON public.admin_profiles
    FOR ALL TO authenticated
    USING (EXISTS (SELECT 1 FROM public.admin_profiles WHERE id = auth.uid() AND role = 'super_admin'));

-- 2. site_settings: Publik bisa SELECT, admin bisa CRUD
CREATE POLICY "Public can view site settings" ON public.site_settings
    FOR SELECT TO anon, authenticated
    USING (true);

CREATE POLICY "Admin can update site settings" ON public.site_settings
    FOR ALL TO authenticated
    USING (public.is_admin());

-- 3. programs: Publik hanya bisa lihat yang is_published = true, Admin full access
CREATE POLICY "Public can view published programs" ON public.programs
    FOR SELECT TO anon, authenticated
    USING (is_published = true);

CREATE POLICY "Admin full access programs" ON public.programs
    FOR ALL TO authenticated
    USING (public.is_admin());

-- 4. services: Publik hanya bisa lihat yang is_published = true, Admin full access
CREATE POLICY "Public can view published services" ON public.services
    FOR SELECT TO anon, authenticated
    USING (is_published = true);

CREATE POLICY "Admin full access services" ON public.services
    FOR ALL TO authenticated
    USING (public.is_admin());

-- 5. portfolio_categories & portfolios: Publik baca published, Admin full access
CREATE POLICY "Public can view portfolio categories" ON public.portfolio_categories
    FOR SELECT TO anon, authenticated
    USING (true);

CREATE POLICY "Admin full access portfolio categories" ON public.portfolio_categories
    FOR ALL TO authenticated
    USING (public.is_admin());

CREATE POLICY "Public can view published portfolios" ON public.portfolios
    FOR SELECT TO anon, authenticated
    USING (is_published = true);

CREATE POLICY "Admin full access portfolios" ON public.portfolios
    FOR ALL TO authenticated
    USING (public.is_admin());

-- 6. blog_categories & blog_posts: Publik baca published, Admin full access
CREATE POLICY "Public can view blog categories" ON public.blog_categories
    FOR SELECT TO anon, authenticated
    USING (true);

CREATE POLICY "Admin full access blog categories" ON public.blog_categories
    FOR ALL TO authenticated
    USING (public.is_admin());

CREATE POLICY "Public can view published blog posts" ON public.blog_posts
    FOR SELECT TO anon, authenticated
    USING (status = 'published');

CREATE POLICY "Admin full access blog posts" ON public.blog_posts
    FOR ALL TO authenticated
    USING (public.is_admin());

-- 7. applications, documents, logs: PUBLIK TIDAK BOLEH SELECT (Perlindungan PDP)
-- Pendaftaran disimpan melalui Astro Server Endpoint dengan SUPABASE_SERVICE_ROLE_KEY
CREATE POLICY "Admin view applications" ON public.applications
    FOR SELECT TO authenticated
    USING (public.is_admin());

CREATE POLICY "Admin update applications" ON public.applications
    FOR UPDATE TO authenticated
    USING (public.is_admin());

CREATE POLICY "Admin view documents" ON public.application_documents
    FOR SELECT TO authenticated
    USING (public.is_admin());

CREATE POLICY "Admin view logs" ON public.application_logs
    FOR SELECT TO authenticated
    USING (public.is_admin());

CREATE POLICY "Admin insert logs" ON public.application_logs
    FOR INSERT TO authenticated
    WITH CHECK (public.is_admin());

-- 8. media_assets
CREATE POLICY "Public can view media" ON public.media_assets
    FOR SELECT TO anon, authenticated
    USING (true);

CREATE POLICY "Admin can manage media" ON public.media_assets
    FOR ALL TO authenticated
    USING (public.is_admin());

-- =====================================================================
-- STORAGE BUCKETS (Jalankan konfigurasi bucket di Supabase Storage)
-- =====================================================================
-- Bucket: 'application-documents' (Private bucket)
-- Bucket: 'public-media' (Public bucket untuk gambar blog, portofolio, logo)

-- =====================================================================
-- INITIAL SEED DATA
-- =====================================================================

-- Default Site Settings
INSERT INTO public.site_settings (id, org_name, tagline, description, whatsapp_number, email, address)
VALUES (
    '00000000-0000-0000-0000-000000000001',
    'Program Magang & Digital Agency',
    'Bangun Skill Digital, Kembangkan Potensi, dan Siapkan Karier Masa Depan',
    'Platform terpadu program magang SMK & mahasiswa serta layanan digital agency profesional.',
    '62895639068080',
    'info@programmagang.id',
    'Indonesia'
) ON CONFLICT (id) DO NOTHING;

-- Initial Services
INSERT INTO public.services (title, slug, short_description, icon, sort_order, is_published)
VALUES 
('Digital Marketing', 'digital-marketing', 'Strategi pemasaran digital terintegrasi untuk menjangkau target pasar secara presisi dan meningkatkan konversi bisnis.', 'bi-megaphone', 1, true),
('SEO (Search Engine Optimization)', 'seo', 'Optimasi mesin pencari organik On-Page, Off-Page, dan Technical SEO untuk menaikkan peringkat Google.', 'bi-search', 2, true),
('Social Media Marketing', 'social-media-marketing', 'Pengelolaan media sosial profesional mulai dari perencanaan konten, copywriting visual, hingga engagement.', 'bi-share', 3, true),
('Web Development', 'web-development', 'Pembuatan website profesional, responsif, cepat, dan modern berbasis teknologi mutakhir (Astro & modern stack).', 'bi-code-slash', 4, true),
('Graphic Design', 'graphic-design', 'Desain grafis kreatif untuk materi promosi, banner, branding kit, dan komunikasi visual yang memukau.', 'bi-palette', 5, true),
('Content Creation', 'content-creation', 'Produksi konten artikel SEO, video pendek, dan visual storytelling yang memikat audiens.', 'bi-camera-video', 6, true),
('Branding Bisnis', 'branding', 'Membangun identitas merek yang kuat, mulai dari logo, brand guidelines, hingga positioning pasar.', 'bi-award', 7, true)
ON CONFLICT (slug) DO NOTHING;

-- Initial Programs (Sesuai Klaster Target SMK & Mahasiswa di PRD)
INSERT INTO public.programs (title, slug, category, target_major, short_description, mode, duration, sort_order, is_published)
VALUES
('Magang SMK - Rekayasa Perangkat Lunak (RPL)', 'magang-rpl', 'smk', 'RPL', 'Praktik langsung pengembangan website modern, fundamental Git, HTML, CSS, JavaScript, dan integrasi API.', 'hybrid', '3 - 6 Bulan', 1, true),
('Magang SMK - Teknik Komputer & Jaringan (TKJ)', 'magang-tkj', 'smk', 'TKJ', 'Praktik konfigurasi jaringan, troubleshooting perangkat, administrasi server Linux/Cloud, dan IT support.', 'hybrid', '3 - 6 Bulan', 2, true),
('Magang SMK - Multimedia', 'magang-multimedia', 'smk', 'Multimedia', 'Praktik editing video kreatif, motion graphic, produksi konten visual, dan pengelolaan aset multimedia.', 'hybrid', '3 - 6 Bulan', 3, true),
('Magang SMK - Desain Komunikasi Visual (DKV)', 'magang-dkv', 'smk', 'DKV', 'Praktik desain grafis profesional, perancangan identitas visual brand, UI/UX dasar, dan konten promosi.', 'hybrid', '3 - 6 Bulan', 4, true),
('Magang Mahasiswa - Teknik Informatika & Ilmu Komputer', 'magang-informatika', 'mahasiswa', 'Informatika', 'Pengembangan aplikasi web full-stack, arsitektur database PostgreSQL, RESTful API, dan best practice software engineering.', 'hybrid', '4 - 6 Bulan', 5, true),
('Magang Mahasiswa - Digital Marketing', 'magang-digital-marketing', 'mahasiswa', 'Digital Marketing', 'Penyusunan campaign strategi pemasaran digital, riset keyword SEO, analytics dashboard, dan content distribution.', 'hybrid', '4 - 6 Bulan', 6, true),
('Magang Mahasiswa - Bisnis Digital & E-Commerce', 'magang-bisnis-digital', 'mahasiswa', 'Bisnis Digital', 'Pengelolaan channel e-commerce, strategi growth hacking, analisis tren pasar, dan automasi proses bisnis.', 'hybrid', '4 - 6 Bulan', 7, true),
('Magang Mahasiswa - Manajemen Pemasaran', 'magang-pemasaran', 'mahasiswa', 'Pemasaran', 'Riset pasar, penyusunan marketing plan, manajemen relasi pelanggan (CRM), dan evaluasi efektivitas promosi.', 'hybrid', '4 - 6 Bulan', 8, true)
ON CONFLICT (slug) DO NOTHING;

-- Initial Categories
INSERT INTO public.portfolio_categories (name, slug, description)
VALUES 
('Website Development', 'website-development', 'Proyek pembuatan website dan aplikasi'),
('SEO & Search', 'seo-search', 'Optimasi kata kunci dan traffic organik'),
('Social Media Marketing', 'social-media', 'Pengelolaan kampanye media sosial'),
('Graphic Design & Branding', 'branding-design', 'Desain identitas brand dan visual')
ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.blog_categories (name, slug, description)
VALUES
('Magang SMK', 'magang-smk', 'Tips, panduan, dan informasi PKL untuk siswa SMK'),
('Magang Mahasiswa', 'magang-mahasiswa', 'Informasi dan panduan magang kuliah / MSIB'),
('Informatika & Web Dev', 'informatika-web-dev', 'Tutorial dan wawasan teknologi pemrograman'),
('Digital Marketing & SEO', 'digital-marketing-seo', 'Strategi pemasaran online dan optimasi mesin pencari'),
('Karier & Portofolio', 'karier-portofolio', 'Tips membuat CV, portofolio, dan persiapan karier')
ON CONFLICT (slug) DO NOTHING;

