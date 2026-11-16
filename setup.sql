-- Il mio guardaroba: incolla tutto nel SQL Editor di Supabase e premi Run.

-- 1) Tabella unica per capi, outfit, profilo e lista
create table if not exists public.docs (
  user_id uuid not null default auth.uid() references auth.users on delete cascade,
  id text not null,
  kind text,
  data jsonb not null,
  updated_at timestamptz not null default now(),
  primary key (user_id, id)
);
alter table public.docs enable row level security;
drop policy if exists "solo i miei dati" on public.docs;
create policy "solo i miei dati" on public.docs
  for all to authenticated
  using (auth.uid() = user_id) with check (auth.uid() = user_id);

-- 2) Cartella privata per le foto
insert into storage.buckets (id, name, public) values ('foto', 'foto', false)
  on conflict (id) do nothing;
drop policy if exists "solo le mie foto" on storage.objects;
create policy "solo le mie foto" on storage.objects
  for all to authenticated
  using (bucket_id = 'foto' and (storage.foldername(name))[1] = auth.uid()::text)
  with check (bucket_id = 'foto' and (storage.foldername(name))[1] = auth.uid()::text);
