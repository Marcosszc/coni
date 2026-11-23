-- Ejecutar en Supabase: SQL Editor > New query > Run

create table if not exists public.puntos (
  id            uuid primary key default gen_random_uuid(),
  nombre        text not null check (length(trim(nombre)) > 0),
  latitud       double precision not null check (latitud  between -90  and 90),
  longitud      double precision not null check (longitud between -180 and 180),
  edificio      text not null,
  calle_acceso  text not null,
  tipo_entrada  text not null check (tipo_entrada in ('con rampa', 'con escalones')),
  creado_en     timestamptz not null default now()
);

alter table public.puntos enable row level security;

-- Política abierta para práctica/demo (cualquiera con la anon key puede leer y escribir).
-- Para producción, restringila a usuarios autenticados.
create policy "puntos_select" on public.puntos for select using (true);
create policy "puntos_insert" on public.puntos for insert with check (true);
create policy "puntos_update" on public.puntos for update using (true) with check (true);
create policy "puntos_delete" on public.puntos for delete using (true);

-- Tres ejemplos en ubicaciones distintas de Asunción (coordenadas aproximadas)
insert into public.puntos (nombre, latitud, longitud, edificio, calle_acceso, tipo_entrada) values
  ('Palacio de López',         -25.279800, -57.636300, 'Palacio de Gobierno',    'Calle Presidente Franco', 'con escalones'),
  ('Shopping del Sol',         -25.295600, -57.575700, 'Shopping del Sol',       'Av. Aviadores del Chaco', 'con rampa'),
  ('Terminal de Ómnibus',      -25.286900, -57.601700, 'Terminal de Asunción',   'Av. Fernando de la Mora', 'con rampa');
