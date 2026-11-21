-- ============================================================
-- Frontera - repaso espaciado: las dos señales del repaso
-- ============================================================
-- El repaso no vuelve a explicar: pregunta dos cosas y se va.
--
--   recordaba: 0 nada · 1 más o menos · 2 sí
--   uso:       si apareció en lo que hizo de verdad
--
-- La segunda es la señal objetiva que compensa el autodiagnóstico sin
-- ponerlo en duda en la cara: alguien puede decir que entendió 9 y no
-- haberlo usado nunca. Eso no se discute, se vuelve a traer.
-- ============================================================

alter table reviews add column if not exists recordaba smallint
  check (recordaba between 0 and 2);

alter table reviews add column if not exists uso boolean;

-- Buscar lo que vence es la consulta más frecuente de la app.
create index if not exists reviews_pendientes
  on reviews (profile_id, due_on) where done_at is null;
