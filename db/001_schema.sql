-- ============================================================
-- Frontera - esquema base (Fase 0)
-- Postgres / Supabase
-- ============================================================
-- Principios de diseno:
--  * El CONTENIDO (lecciones, libros, mapa) es compartido: se genera una
--    vez y lo lee todo el circulo. Eso es lo que hace que 20 usuarios
--    cuesten lo mismo que uno.
--  * El ESTADO de cada persona (nivel, respuestas, racha) es privado:
--    RLS estricta, cada uno ve solo lo suyo.
--  * El nivel nunca se muestra como etiqueta. Es interno: lo usa el motor
--    de ruteo para decidir que servir y que no.
--  * Nunca se guarda texto crudo de conversaciones. Solo perfil derivado.
-- ============================================================

create extension if not exists vector;

-- ------------------------------------------------------------
-- 1. Herramientas de IA
-- ------------------------------------------------------------
create table if not exists tools (
  id      text primary key,
  name    text not null,
  vendor  text,
  kind    text not null default 'chat'
          check (kind in ('chat','imagen','codigo','automatizacion','otro')),
  active  boolean not null default true,
  sort    int not null default 100
);

insert into tools (id, name, vendor, kind, sort) values
  ('claude',     'Claude',      'Anthropic',  'chat',           10),
  ('chatgpt',    'ChatGPT',     'OpenAI',     'chat',           20),
  ('gemini',     'Gemini',      'Google',     'chat',           30),
  ('copilot',    'Copilot',     'Microsoft',  'chat',           40),
  ('perplexity', 'Perplexity',  'Perplexity', 'chat',           50),
  ('midjourney', 'Midjourney',  'Midjourney', 'imagen',         60),
  ('claudecode', 'Claude Code', 'Anthropic',  'codigo',         70),
  ('zapier',     'Zapier',      'Zapier',     'automatizacion', 80)
on conflict (id) do nothing;

-- ------------------------------------------------------------
-- 2. Perfil
-- ------------------------------------------------------------
create table if not exists profiles (
  id                    uuid primary key references auth.users(id) on delete cascade,
  display_name          text,
  lang                  text not null default 'es' check (lang in ('es','en')),
  -- Nivel interno 0..4:
  --   0 juega | 1 opera | 2 integra | 3 construye | 4 vanguardia
  level                 smallint not null default 0 check (level between 0 and 4),
  level_source          text not null default 'onboarding'
                        check (level_source in ('onboarding','evidencia','desempeno','manual')),
  level_updated_at      timestamptz,
  -- Texto de instrucciones personales que la app ayuda a construir (Paso 1)
  personal_instructions text,
  -- Perfil destilado de la entrevista: quien es, que hace, para que la usa.
  -- Es lo que permite traducir cada leccion a su contexto real.
  context_summary       text,
  timezone              text not null default 'America/Argentina/Buenos_Aires',
  onboarded_at          timestamptz,
  created_at            timestamptz not null default now()
);

-- Relacion persona <-> herramienta.
--   'usa'    -> define en que herramienta se le explica todo
--   'quiere' -> define que contenido se le trae
create table if not exists profile_tools (
  profile_id uuid not null references profiles(id) on delete cascade,
  tool_id    text not null references tools(id),
  relation   text not null check (relation in ('usa','quiere')),
  primary key (profile_id, tool_id, relation)
);

-- ------------------------------------------------------------
-- 3. Mapa del campo
-- ------------------------------------------------------------
create table if not exists topics (
  id          bigserial primary key,
  slug        text unique not null,
  name_es     text not null,
  name_en     text not null,
  parent_id   bigint references topics(id) on delete set null,
  kind        text not null default 'fundamento'
              check (kind in ('fundamento','frontera')),
  level_floor smallint not null default 0 check (level_floor between 0 and 4),
  sort        int not null default 100
);

-- Dominio de cada persona en cada nodo del mapa. Se enciende con evidencia.
create table if not exists topic_mastery (
  profile_id uuid not null references profiles(id) on delete cascade,
  topic_id   bigint not null references topics(id) on delete cascade,
  mastery    smallint not null default 0 check (mastery between 0 and 100),
  evidence   text,
  updated_at timestamptz not null default now(),
  primary key (profile_id, topic_id)
);

-- ------------------------------------------------------------
-- 4. Lecciones (contenido compartido)
-- ------------------------------------------------------------
create table if not exists lessons (
  id            bigserial primary key,
  slug          text unique not null,
  topic_id      bigint references topics(id) on delete set null,
  kind          text not null check (kind in ('fundamento','radar','libro')),
  level_floor   smallint not null default 0 check (level_floor between 0 and 4),
  level_ceiling smallint not null default 4 check (level_ceiling between 0 and 4),
  track_order   int,
  published     boolean not null default false,
  created_at    timestamptz not null default now(),
  check (level_floor <= level_ceiling)
);

-- Dos capas de contenido:
--   tool_id NULL     -> capa conceptual, agnostica. Se escribe una vez.
--   tool_id con valor -> capa de ejecucion para esa herramienta. Perezosa:
--                        se genera cuando el primer usuario la necesita.
create table if not exists lesson_contents (
  id           bigserial primary key,
  lesson_id    bigint not null references lessons(id) on delete cascade,
  lang         text not null check (lang in ('es','en')),
  tool_id      text references tools(id),
  title        text not null,
  hook         text,
  body_md      text not null,
  minutes      smallint not null default 7,
  generated_by text,
  created_at   timestamptz not null default now()
);

create unique index if not exists lesson_contents_unico
  on lesson_contents (lesson_id, lang, coalesce(tool_id, '-'));

-- ------------------------------------------------------------
-- 5. Los dos clics
-- ------------------------------------------------------------
-- comprension 1..10 y interes -1/+1.
-- No bloquean nada: rutean. 3 con pulgar arriba baja el nivel y reexplica;
-- 9 con pulgar abajo deja de traer el tema.
create table if not exists lesson_state (
  profile_id  uuid not null references profiles(id) on delete cascade,
  lesson_id   bigint not null references lessons(id) on delete cascade,
  status      text not null default 'servida'
              check (status in ('servida','hecha','ya_la_sabia','saltada')),
  comprension smallint check (comprension between 1 and 10),
  interes     smallint check (interes in (-1, 1)),
  served_at   timestamptz not null default now(),
  answered_at timestamptz,
  primary key (profile_id, lesson_id)
);

-- ------------------------------------------------------------
-- 6. Repaso espaciado
-- ------------------------------------------------------------
create table if not exists reviews (
  id         bigserial primary key,
  profile_id uuid not null references profiles(id) on delete cascade,
  lesson_id  bigint not null references lessons(id) on delete cascade,
  stage      smallint not null default 0,
  due_on     date not null,
  done_at    timestamptz,
  unique (profile_id, lesson_id, stage)
);

-- ------------------------------------------------------------
-- 7. Actividad (base de la racha semanal)
-- ------------------------------------------------------------
create table if not exists activity (
  profile_id uuid not null references profiles(id) on delete cascade,
  day        date not null,
  kind       text not null check (kind in ('leccion','reto','libro','repaso')),
  primary key (profile_id, day, kind)
);

-- ------------------------------------------------------------
-- 8. Biblioteca
-- ------------------------------------------------------------
create table if not exists books (
  id         bigserial primary key,
  slug       text unique not null,
  title      text not null,
  author     text not null,
  year       int,
  themes     text[] not null default '{}',
  created_at timestamptz not null default now()
);

create table if not exists book_state (
  profile_id uuid not null references profiles(id) on delete cascade,
  book_id    bigint not null references books(id) on delete cascade,
  read_state text not null check (read_state in ('no_lei','hace_tiempo','fresco')),
  chosen     boolean not null default true,
  updated_at timestamptz not null default now(),
  primary key (profile_id, book_id)
);

-- Piezas de sintesis propia.
-- NUNCA texto del libro: ideas explicadas con palabras propias y atribuidas
-- al autor. El for_read_state cambia el enfoque por completo:
--   no_lei      -> las ideas centrales, y que envejecio mal
--   hace_tiempo -> repaso de lo que probablemente se borro
--   fresco      -> aplicacion y discusion, cero resumen
create table if not exists book_pieces (
  id             bigserial primary key,
  book_id        bigint not null references books(id) on delete cascade,
  lang           text not null check (lang in ('es','en')),
  for_read_state text not null check (for_read_state in ('no_lei','hace_tiempo','fresco')),
  idx            smallint not null,
  title          text not null,
  body_md        text not null,
  minutes        smallint not null default 7,
  created_at     timestamptz not null default now(),
  unique (book_id, lang, for_read_state, idx)
);

-- ------------------------------------------------------------
-- 9. Entrevista del Paso 1
-- ------------------------------------------------------------
-- La conversacion que arma las instrucciones personales es, a la vez, la
-- entrevista que perfila a la persona cuando no hay uso previo que relevar.
create table if not exists interview_answers (
  profile_id uuid not null references profiles(id) on delete cascade,
  q_key      text not null,
  answer     text not null,
  updated_at timestamptz not null default now(),
  primary key (profile_id, q_key)
);

-- La prueba antes/despues: la misma pregunta, sin y con instrucciones.
-- Es el momento en que la persona ve que esto le sirve de verdad.
create table if not exists before_after (
  profile_id    uuid primary key references profiles(id) on delete cascade,
  prompt        text not null,
  answer_before text,
  answer_after  text,
  created_at    timestamptz not null default now()
);

-- ------------------------------------------------------------
-- 10. Radar (Fase 1: se deja la mesa puesta)
-- ------------------------------------------------------------
create table if not exists sources (
  id          bigserial primary key,
  kind        text not null check (kind in ('rss','arxiv','youtube','github','newsletter','docs')),
  url         text not null,
  name        text not null,
  -- Jerarquia de primicia: 1 = primario (changelog, paper, repo),
  -- 3 = eco (video, newsletter). El eco se autodescarta por parecido.
  primacy     smallint not null default 2 check (primacy between 1 and 3),
  active      boolean not null default true,
  last_run_at timestamptz
);

create table if not exists signals (
  id           bigserial primary key,
  source_id    bigint references sources(id) on delete set null,
  url          text not null,
  url_hash     text not null unique,
  title        text not null,
  summary      text,
  published_at timestamptz,
  topic_id     bigint references topics(id) on delete set null,
  embedding    vector(768),
  -- novelty: 0 = refrito de algo ya ingerido, 100 = genuinamente nuevo.
  -- Este filtro solo descarta la mayor parte del contenido que circula.
  novelty      smallint,
  relevance    smallint,
  status       text not null default 'nueva'
               check (status in ('nueva','descartada','refrito','promovida')),
  created_at   timestamptz not null default now()
);

create index if not exists signals_embedding_idx
  on signals using hnsw (embedding vector_cosine_ops);

-- ============================================================
-- Row Level Security
-- ============================================================
alter table tools             enable row level security;
alter table topics            enable row level security;
alter table lessons           enable row level security;
alter table lesson_contents   enable row level security;
alter table books             enable row level security;
alter table book_pieces       enable row level security;
alter table sources           enable row level security;
alter table signals           enable row level security;

alter table profiles          enable row level security;
alter table profile_tools     enable row level security;
alter table topic_mastery     enable row level security;
alter table lesson_state      enable row level security;
alter table reviews           enable row level security;
alter table activity          enable row level security;
alter table book_state        enable row level security;
alter table interview_answers enable row level security;
alter table before_after      enable row level security;

-- Contenido compartido: lectura para autenticados. La escritura queda solo
-- para service_role (el job que genera el contenido), que saltea RLS.
drop policy if exists lee_tools on tools;
create policy lee_tools on tools for select to authenticated using (true);

drop policy if exists lee_topics on topics;
create policy lee_topics on topics for select to authenticated using (true);

drop policy if exists lee_lessons on lessons;
create policy lee_lessons on lessons for select to authenticated using (published);

drop policy if exists lee_lesson_contents on lesson_contents;
create policy lee_lesson_contents on lesson_contents for select to authenticated using (true);

drop policy if exists lee_books on books;
create policy lee_books on books for select to authenticated using (true);

drop policy if exists lee_book_pieces on book_pieces;
create policy lee_book_pieces on book_pieces for select to authenticated using (true);

drop policy if exists lee_sources on sources;
create policy lee_sources on sources for select to authenticated using (true);

drop policy if exists lee_signals on signals;
create policy lee_signals on signals for select to authenticated using (status = 'promovida');

-- Datos propios: cada uno ve y escribe solo lo suyo.
drop policy if exists mio_profiles_select on profiles;
create policy mio_profiles_select on profiles for select to authenticated using (id = auth.uid());

drop policy if exists mio_profiles_insert on profiles;
create policy mio_profiles_insert on profiles for insert to authenticated with check (id = auth.uid());

drop policy if exists mio_profiles_update on profiles;
create policy mio_profiles_update on profiles for update to authenticated using (id = auth.uid()) with check (id = auth.uid());

drop policy if exists mio_profile_tools on profile_tools;
create policy mio_profile_tools on profile_tools for all to authenticated
  using (profile_id = auth.uid()) with check (profile_id = auth.uid());

drop policy if exists mio_topic_mastery on topic_mastery;
create policy mio_topic_mastery on topic_mastery for all to authenticated
  using (profile_id = auth.uid()) with check (profile_id = auth.uid());

drop policy if exists mio_lesson_state on lesson_state;
create policy mio_lesson_state on lesson_state for all to authenticated
  using (profile_id = auth.uid()) with check (profile_id = auth.uid());

drop policy if exists mio_reviews on reviews;
create policy mio_reviews on reviews for all to authenticated
  using (profile_id = auth.uid()) with check (profile_id = auth.uid());

drop policy if exists mio_activity on activity;
create policy mio_activity on activity for all to authenticated
  using (profile_id = auth.uid()) with check (profile_id = auth.uid());

drop policy if exists mio_book_state on book_state;
create policy mio_book_state on book_state for all to authenticated
  using (profile_id = auth.uid()) with check (profile_id = auth.uid());

drop policy if exists mio_interview on interview_answers;
create policy mio_interview on interview_answers for all to authenticated
  using (profile_id = auth.uid()) with check (profile_id = auth.uid());

drop policy if exists mio_before_after on before_after;
create policy mio_before_after on before_after for all to authenticated
  using (profile_id = auth.uid()) with check (profile_id = auth.uid());

-- ============================================================
-- Perfil automatico al registrarse
-- ============================================================
create or replace function public.on_auth_user_created()
returns trigger
language plpgsql
security definer
set search_path = public
as $fn$
begin
  insert into public.profiles (id, display_name)
  values (new.id, coalesce(new.raw_user_meta_data->>'name', split_part(new.email, '@', 1)))
  on conflict (id) do nothing;
  return new;
end
$fn$;

drop trigger if exists trg_auth_user_created on auth.users;
create trigger trg_auth_user_created
  after insert on auth.users
  for each row execute function public.on_auth_user_created();

-- ============================================================
-- Racha semanal con tolerancia
-- ============================================================
-- Cuenta semanas consecutivas con al menos 2 dias de actividad.
-- Deliberadamente NO es diaria: una racha diaria se rompe el primer martes
-- complicado y ahi se pierde al usuario. Esta mide lo mismo sin castigar.
create or replace function public.racha_semanal(p_profile uuid)
returns int
language sql
stable
security invoker
as $fn$
  with semanas as (
    select date_trunc('week', day)::date as semana,
           count(distinct day) as dias
    from activity
    where profile_id = p_profile
    group by 1
  ),
  validas as (
    select semana,
           row_number() over (order by semana desc) as n,
           (date_trunc('week', current_date)::date - semana) / 7 as atras
    from semanas
    where dias >= 2
  )
  select coalesce(count(*), 0)::int
  from validas
  where atras = n - 1;
$fn$;
