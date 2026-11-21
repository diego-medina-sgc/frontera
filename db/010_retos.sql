-- ============================================================
-- Frontera - retos prácticos
-- ============================================================
-- La segunda promesa visible: no ejercicios genéricos, ejercicios sobre
-- los problemas reales de quien lee.
--
-- Un reto nace del cruce de dos cosas:
--   el HUECO  -> qué nodo del mapa tiene poca evidencia para su nivel
--   el MATERIAL -> en qué anda trabajando de verdad
--
-- El hueco elige el tema; el material lo hace propio. Por separado, uno
-- da ejercicios de manual y el otro no saca a nadie de su zona cómoda.
--
-- A diferencia de lecciones y libros, los retos NO son compartidos: cada
-- uno es de una persona, porque está hecho sobre su situación.
-- ============================================================

create table if not exists challenges (
  id          bigserial primary key,
  profile_id  uuid not null references profiles(id) on delete cascade,
  topic_id    bigint references topics(id) on delete set null,
  title       text not null,
  body_md     text not null,
  -- De dónde salió, para poder explicarlo y para afinar el criterio.
  porque      text,
  minutes     smallint not null default 20,
  status      text not null default 'propuesto'
              check (status in ('propuesto','haciendo','hecho','descartado')),
  -- Los dos clics, también acá: qué tan difícil resultó y si sirvió.
  dificultad  smallint check (dificultad between 1 and 10),
  sirvio      smallint check (sirvio in (-1, 1)),
  notas       text,
  created_at  timestamptz not null default now(),
  answered_at timestamptz
);

create index if not exists challenges_abiertos
  on challenges (profile_id, created_at desc) where status in ('propuesto','haciendo');

alter table challenges enable row level security;

drop policy if exists mio_challenges on challenges;
create policy mio_challenges on challenges for all to authenticated
  using (profile_id = auth.uid()) with check (profile_id = auth.uid());

grant select, insert, update, delete on challenges to authenticated;
grant usage, select on sequence challenges_id_seq to authenticated;
