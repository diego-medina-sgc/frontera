-- ============================================================
-- Frontera - título en español y tapa de cada libro
-- ============================================================
-- Dos cosas que se veían mal en la biblioteca.
--
-- 1. La app está en español y los títulos estaban todos en inglés.
--    Ahora cada libro puede tener su título de la edición en español,
--    y la app muestra ese cuando el idioma es 'es'.
--
--    Queda NULL en los tres que no tienen edición en español que haya
--    podido verificar (Grove, Horowitz y Dunford). Inventarles una
--    traducción sería peor que dejar el original: alguien que busca el
--    libro no lo va a encontrar.
--
-- 2. La tapa. El id sale del catálogo público de Open Library, que es
--    gratis y no pide clave; la app arma la URL con ese número. No se
--    guardan ISBNs adivinados: cada id se verificó consultando el
--    catálogo por título y autor.
--
--    Si la imagen no carga, la tarjeta se dibuja igual sin ella.
-- ============================================================

alter table books add column if not exists title_es text;
alter table books add column if not exists cover_id bigint;

comment on column books.title_es is 'Titulo de la edicion en espanol. Null si no tiene.';
comment on column books.cover_id is 'Id de tapa en Open Library: covers.openlibrary.org/b/id/<id>-M.jpg';

update books set title_es = 'Hábitos atómicos',             cover_id = 12539702 where slug = 'atomic-habits';
update books set title_es = 'Los líderes comen al final',   cover_id = 8246311  where slug = 'leaders-eat-last';
update books set title_es = 'Pensar rápido, pensar despacio', cover_id = 13290711 where slug = 'thinking-fast-slow';
update books set title_es = 'Ideas que pegan',              cover_id = 7004880  where slug = 'made-to-stick';
update books set title_es = 'Inspirado',                    cover_id = 9700654  where slug = 'inspired';

-- Sin edición en español verificable: se quedan con el título original.
update books set cover_id = 7279515  where slug = 'the-hard-thing';
update books set cover_id = 421244   where slug = 'high-output-management';
update books set cover_id = 10194369 where slug = 'obviously-awesome';
