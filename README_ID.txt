SETIA STORE V2 — PAKET AWAL
===========================

ISI PAKET
- index.html: tampilan customer, katalog, keranjang, checkout, catatan pesanan.
- config.js: tempat Project URL dan publishable/anon key Supabase.
- SETUP_DATABASE.sql: tabel pesanan, produk, ulasan, admin_users, dan kebijakan keamanan dasar.
- ADMIN_SETUP.sql: langkah mendaftarkan UUID akun admin ke tabel admin_users.

PENTING
Paket ini adalah tahap awal/prototipe. Jangan publikasikan sebagai toko produksi sebelum
koneksi, RLS, validasi harga, autentikasi admin, unggah foto, dan pembayaran diuji.
Pembayaran gateway BELUM aktif. Memilih "pembayaran online" pada prototipe ini hanya
mencatat preferensi pembayaran; belum membuat tagihan dan belum menerima uang.

LANGKAH 1 — KONFIGURASI
1. Buka config.js dengan Notepad.
2. Isi SUPABASE_URL dan SUPABASE_ANON_KEY dari Settings > API di proyek Supabase.
3. Gunakan publishable/anon key saja. Jangan pernah memasukkan service_role key atau
   Midtrans Server Key ke file publik.
4. Simpan file.

LANGKAH 2 — DATABASE
1. Masuk ke proyek Supabase setia-store-online.
2. Buka SQL Editor > New query.
3. Periksa apakah customer_orders/products/product_reviews sudah ada. Jika proyek lama
   memiliki tabel dengan nama sama, jangan jalankan SQL tanpa memeriksa struktur dan data.
4. Untuk proyek kosong, tempel isi SETUP_DATABASE.sql lalu Run.
5. Jangan bagikan password, secret key, atau kode OTP di chat.

LANGKAH 3 — UJI TAMPILAN
Buka index.html di browser. Katalog dan keranjang demo akan tampil.
Untuk uji koneksi online yang lebih stabil, unggah folder ini ke Netlify setelah konfigurasi.
Pesanan akan gagal dikirim bila SQL/RLS belum sesuai.

LANGKAH 4 — AKUN ADMIN
1. Supabase > Authentication > Users > Add user, buat akun admin.
2. Salin UUID user admin.
3. Ganti GANTI_DENGAN_UUID_USER_ADMIN di ADMIN_SETUP.sql dengan UUID itu.
4. Jalankan SQL tersebut.
5. Dashboard admin penuh adalah tahap berikutnya; jangan menganggap URL halaman customer
   sebagai dashboard admin.

PEMBAYARAN
Untuk QRIS, e-wallet (misalnya DANA/OVO/GoPay/ShopeePay sesuai ketersediaan), dan
virtual account/e-banking, perlu akun merchant payment gateway yang disetujui, backend
server/Edge Function untuk membuat transaksi, serta webhook yang memverifikasi status.
Jangan pernah percaya status pembayaran yang dikirim browser saja. Jangan menyimpan PIN,
password e-banking, atau data rahasia kartu customer.

ULASAN CUSTOMER
Skema product_reviews sudah disiapkan, tetapi formulir review dan validasi "pesanan selesai"
belum aktif di paket awal ini. Tahap berikutnya harus membatasi review pada order yang valid,
mencegah review ganda, dan menampilkan hanya ulasan yang dipublikasikan admin.
