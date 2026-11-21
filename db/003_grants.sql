-- ============================================================
-- Frontera - permisos de tabla
-- ============================================================
-- La seguridad por fila (RLS) decide QUE FILAS ve cada uno, pero antes
-- Postgres exige permiso sobre la tabla. Sin estos grants, el rol
-- authenticated recibe "permission denied" y las policies ni se evaluan.
-- Los grants son amplios a proposito: quien filtra de verdad es la RLS.
-- ============================================================

grant usage on schema public to authenticated;

-- Lectura de todo lo que la RLS permita (contenido compartido + lo propio)
grant select on all tables in schema public to authenticated;

-- Escritura solo en las tablas de datos propios
grant insert, update, delete on
  profiles,
  profile_tools,
  topic_mastery,
  lesson_state,
  reviews,
  activity,
  book_state,
  interview_answers,
  before_after
to authenticated;

-- Las tablas con id autoincremental necesitan su secuencia
grant usage, select on all sequences in schema public to authenticated;

grant execute on function public.racha_semanal(uuid) to authenticated;
