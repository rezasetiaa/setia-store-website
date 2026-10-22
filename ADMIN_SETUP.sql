-- Setelah membuat akun admin melalui Supabase Authentication > Users,
-- salin UUID akun tersebut lalu jalankan baris ini dengan UUID yang benar.
-- Jangan gunakan email customer biasa sebagai admin.
insert into public.admin_users(user_id)
values ('164ecc57-1919-4b51-89af-353dfa8eebc1')
on conflict (user_id) do nothing;
