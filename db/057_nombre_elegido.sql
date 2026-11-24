-- ============================================================
-- 057 · El nombre lo elige la persona
-- ============================================================
-- Hasta ahora el alta copiaba en display_name la parte del mail antes
-- de la arroba. Nadie lo leía, así que no molestaba. Desde que Hoy
-- saluda con el nombre, saludaría "Hola, prueba.frontera".
--
-- El nombre ahora se escribe en la bienvenida o en Ajustes → Vos. Si la
-- persona no escribe ninguno, queda en null y la app no saluda con
-- nombre. Esta migración:
--   1. hace que el alta sólo copie un nombre si vino declarado en los
--      metadatos (nunca el mail);
--   2. borra los display_name que son exactamente la parte del mail,
--      que nadie eligió.
-- Corre más de una vez sin romper nada.
-- ============================================================

create or replace function public.on_auth_user_created()
returns trigger
language plpgsql
security definer
set search_path = public
as $fn$
begin
  insert into public.profiles (id, display_name)
  values (new.id, nullif(trim(new.raw_user_meta_data->>'name'), ''))
  on conflict (id) do nothing;
  return new;
end
$fn$;

update public.profiles p
set display_name = null
from auth.users u
where u.id = p.id
  and p.display_name = split_part(u.email, '@', 1);
