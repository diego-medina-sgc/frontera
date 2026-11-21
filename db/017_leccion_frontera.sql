-- ============================================================
-- Frontera - un tercer tipo de lección
-- ============================================================
-- Hasta ahora había dos: 'fundamento', que es el track ordenado para
-- quien empieza, y 'radar', que nace de algo que pasó esta semana.
--
-- Falta un tercero: temas de frontera que no dependen de una noticia.
-- Evals, trabajo asincrónico, gestión de contexto. No caducan como el
-- radar ni van en orden como el track: están ahí para quien tiene nivel
-- y le falta ese nodo.
-- ============================================================

alter table lessons drop constraint if exists lessons_kind_check;

alter table lessons add constraint lessons_kind_check
  check (kind in ('fundamento', 'radar', 'libro', 'frontera'));
