-- Setelah membuat akun admin melalui Supabase Authentication > Users,
-- salin UUID akun tersebut lalu jalankan baris ini dengan UUID yang benar.
-- Jangan gunakan email customer biasa sebagai admin.
insert into public.admin_users(user_id)
values ('GANTI_DENGAN_UUID_USER_ADMIN')
on conflict (user_id) do nothing;
