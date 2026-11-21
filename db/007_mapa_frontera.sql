-- ============================================================
-- Frontera - nodos de frontera del mapa
-- ============================================================
-- Los nodos que faltaban para cubrir las categorias elegidas: negocios,
-- producto, diseno y contenido, y los modelos en si. Todos con piso de
-- nivel 2: el radar no se enciende antes.
-- ============================================================

insert into topics (slug, name_es, name_en, kind, level_floor, sort) values
  ('modelos',   'Modelos y capacidades', 'Models and capabilities', 'frontera', 2, 130),
  ('negocios',  'IA para negocios',      'AI for business',         'frontera', 2, 140),
  ('producto',  'Construir productos',   'Building products',       'frontera', 2, 150),
  ('diseno',    'Diseño y contenido',    'Design and content',      'frontera', 2, 160),
  ('contexto-largo', 'Contexto y memoria', 'Context and memory',    'frontera', 3, 170)
on conflict (slug) do nothing;
