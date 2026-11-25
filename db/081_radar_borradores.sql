-- ============================================================
-- 081 · Radar que escribe solo: borradores y su fuente
-- ============================================================
-- Hasta el 24/11 el radar juntaba señales solo cada mañana, pero
-- escribir la lección era manual, y desde el 21/11 se escribió una.
-- Ahora una tarea programada de la app de Claude corre el skill del
-- radar cada mañana y deja las lecciones como BORRADOR
-- (`published = false`). Diego las aprueba en Ajustes → Radar, con la
-- edge function `radar-cola`.
--
-- Esta migración:
--   1. suma `lessons.fuente_url`, para ver de dónde salió la lección
--      al aprobarla (el lector no dibuja links, así que no va en el
--      cuerpo);
--   2. cierra una puerta: el contenido de una lección sin publicar se
--      podía leer igual, porque la política de `lesson_contents` era
--      `using (true)`. Ahora sólo se lee si su lección está publicada.
-- ============================================================

alter table lessons add column if not exists fuente_url text;

drop policy if exists lee_lesson_contents on lesson_contents;
create policy lee_lesson_contents on lesson_contents for select to authenticated
  using (exists (
    select 1 from lessons l where l.id = lesson_contents.lesson_id and l.published
  ));
