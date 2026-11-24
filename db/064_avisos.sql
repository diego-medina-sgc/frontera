-- ============================================================
-- 064 · Avisos: uno por día hábil, opcional, sin culpa
-- ============================================================
-- La persona los prende en Ajustes. El navegador le da una
-- "suscripción" (a dónde mandarle) y se guarda acá. Todos los días
-- hábiles a las 9 (hora argentina) un cron llama a la función
-- `avisar`, que decide a quién avisar:
--   · lunes a viernes, entre 8:30 y 10:30 de Argentina;
--   · uno por día como máximo;
--   · sólo si ese día la persona todavía no hizo nada en la app.
--
-- Esas reglas viven en la función, no en el cron. Por eso llamarla de
-- más (otra vez, a mano, o alguien que encuentre la dirección) no
-- puede mandar más avisos de los que corresponden, y no hace falta
-- ninguna clave secreta para llamarla.
-- ============================================================

create table if not exists push_subscriptions (
  id           bigserial primary key,
  profile_id   uuid not null references profiles(id) on delete cascade,
  endpoint     text not null unique,
  p256dh       text not null,
  auth         text not null,
  -- El último día (de Argentina) en que se le mandó un aviso.
  ultimo_aviso date,
  created_at   timestamptz not null default now()
);

create index if not exists push_subscriptions_perfil on push_subscriptions (profile_id);

alter table push_subscriptions enable row level security;

-- Cada persona ve, agrega y borra sólo las suyas. La función usa la
-- secret key y lee todas.
drop policy if exists mio_push_select on push_subscriptions;
create policy mio_push_select on push_subscriptions for select to authenticated
  using (profile_id = auth.uid());

drop policy if exists mio_push_insert on push_subscriptions;
create policy mio_push_insert on push_subscriptions for insert to authenticated
  with check (profile_id = auth.uid());

drop policy if exists mio_push_update on push_subscriptions;
create policy mio_push_update on push_subscriptions for update to authenticated
  using (profile_id = auth.uid()) with check (profile_id = auth.uid());

drop policy if exists mio_push_delete on push_subscriptions;
create policy mio_push_delete on push_subscriptions for delete to authenticated
  using (profile_id = auth.uid());

grant select, insert, update, delete on push_subscriptions to authenticated;
grant usage, select on sequence push_subscriptions_id_seq to authenticated;

-- ------------------------------------------------------------
-- El cron: lunes a viernes a las 12:00 UTC, que son las 9:00 en
-- Argentina (no hay horario de verano).
-- ------------------------------------------------------------
create extension if not exists pg_cron;
create extension if not exists pg_net with schema extensions;

select cron.unschedule('frontera-avisar')
where exists (select 1 from cron.job where jobname = 'frontera-avisar');

select cron.schedule(
  'frontera-avisar',
  '0 12 * * 1-5',
  $cron$
    select net.http_post(
      url     := 'https://lboyidbtjxjkhwupysks.supabase.co/functions/v1/avisar',
      headers := jsonb_build_object('Content-Type', 'application/json'),
      body    := '{}'::jsonb
    );
  $cron$
);
