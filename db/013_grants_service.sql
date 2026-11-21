-- ============================================================
-- Frontera - permisos para el rol de servidor
-- ============================================================
-- Los grants de 003 fueron solo para authenticated. Los jobs que corren
-- fuera del navegador usan service_role, que saltea la seguridad por
-- fila pero igual necesita permiso sobre las tablas: sin esto devuelve
-- "permission denied for table topics".
--
-- Por eso la secret key vive solo en la máquina y nunca en el front:
-- este rol puede todo.
-- ============================================================

grant usage on schema public to service_role;
grant all privileges on all tables in schema public to service_role;
grant all privileges on all sequences in schema public to service_role;

-- Y para las tablas que se creen de acá en adelante.
alter default privileges in schema public
  grant all privileges on tables to service_role;

alter default privileges in schema public
  grant all privileges on sequences to service_role;
