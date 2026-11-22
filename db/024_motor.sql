-- ============================================================
-- Frontera - cablear el motor
-- ============================================================
-- Dos auditorías coincidieron en lo mismo: la app recoge doce señales
-- y usa cuatro, y ninguna de las cuatro cambia lo que te va a servir
-- el mes que viene. Esto agrega lo que falta en la base para que el
-- lazo cierre. El resto es código.
--
-- 1. El compromiso. Cada lección termina con un "qué hacer esta
--    semana" concreto, escrito a mano, y hasta ahora la app no sabía
--    que esa consigna existía. Ahora se recoge lo que la persona dice
--    que va a hacer, y al día siguiente se le pregunta. Es la única
--    forma barata de convertir lectura en producción.
--
--    Va en lesson_state y no en una tabla nueva: es un atributo de
--    "esta persona con esta lección", que es exactamente la clave que
--    lesson_state ya tiene.
--
-- 2. Repasos caducados. El README promete que nada se acumula y que no
--    hay deuda. La cola de repasos era exactamente una deuda: te ibas
--    diez días y volvías con veinte, obligatorios y de a uno por
--    pantalla. Ahora los que llevan mucho vencidos se cierran solos.
--
--    Hace falta distinguirlos de los contestados: los dos van a tener
--    done_at, pero un repaso caducado no trae ninguna respuesta y no
--    debe contaminar la medición de si la app enseña algo.
-- ============================================================

alter table lesson_state add column if not exists compromiso text;
alter table lesson_state add column if not exists compromiso_at timestamptz;
alter table lesson_state add column if not exists compromiso_hecho boolean;

comment on column lesson_state.compromiso is 'Lo que la persona dijo que iba a hacer con la leccion.';
comment on column lesson_state.compromiso_hecho is 'Null = todavia no se le pregunto.';

alter table reviews add column if not exists caducado boolean not null default false;

comment on column reviews.caducado is 'Se cerro solo por viejo o por ya_la_sabia, sin respuesta. No cuenta como repaso hecho.';
