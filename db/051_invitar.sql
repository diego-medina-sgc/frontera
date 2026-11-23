-- ============================================================
-- Frontera - quién puede sumar a alguien al círculo
-- ============================================================
-- Hasta acá no existía ninguna noción de rol: todas las políticas son
-- `profile_id = auth.uid()` y cada uno ve lo suyo. Para sumar gente
-- había que entrar a Supabase a mano.
--
-- Esta columna es el único permiso del proyecto, y la lee **el
-- servidor**, no el navegador. La app la usa nada más que para decidir
-- si dibuja el grupo "Círculo" en Ajustes; quien la ponga en true
-- editando el JavaScript no consigue nada, porque la edge function
-- `invitar` vuelve a consultarla con la secret key antes de crear a
-- nadie. Esconder la pestaña no alcanza: el servidor saca del payload
-- lo que esa persona no puede hacer.
--
-- No se prende acá y a propósito: el id de un perfil es de una persona
-- real y este repositorio es público. Se prende a mano, una vez, con:
--
--   update profiles set puede_invitar = true where id = '<el uuid>';
--
-- Para ver a quién le quedó: node jobs/revisar.mjs lo informa.
-- ============================================================

alter table profiles add column if not exists puede_invitar boolean not null default false;

comment on column profiles.puede_invitar is
  'Único permiso del proyecto. Lo valida la edge function invitar con la secret key, no el navegador.';

-- Control: a quién le quedó prendido.
select left(id::text, 8) as perfil, puede_invitar
from profiles
where puede_invitar
order by created_at;
