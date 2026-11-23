-- ============================================================
-- Frontera - los libros también leen lo que la persona escribió
-- ============================================================
-- La biblioteca ya se ordena por el pulgar (050/051), pero eso recién
-- vale después de leer algo. El día uno el orden es alfabético, que no
-- dice nada: a alguien que coordina un equipo le aparece primero
-- Atomic Habits porque empieza con A.
--
-- Esto le da a cada libro las palabras con las que alguien describe su
-- trabajo, igual que `topics.terms` para los nodos del mapa. Se cruzan
-- con el contexto que la persona escribió (el del Paso 1, editable en
-- Ajustes → Vos) y los libros que hablan de lo que hace van primero.
--
-- Si no escribió contexto, o si no pega con ninguno, el orden es al
-- azar —pero el mismo azar durante todo el día, porque una biblioteca
-- que se reordena cada vez que entrás no se puede recorrer.
--
-- Son términos del trabajo real ("coordino", "reuniones", "admisiones"),
-- no del tema del libro: nadie escribe "liderazgo situacional" cuando
-- le preguntan a qué se dedica.
-- ============================================================

alter table books add column if not exists terms text[] not null default '{}';

comment on column books.terms is
  'Palabras del trabajo de una persona que hacen que este libro le sirva. Se cruzan con profiles.context_summary.';

update books set terms = array[
  'equipo','equipos','lidero','liderar','a cargo','personas a cargo','jefe','jefa',
  'confianza','clima','gente','conducir','team','lead','manage'
] where slug = 'leaders-eat-last';

update books set terms = array[
  'decidir','decisiones','decisión','sesgo','sesgos','juicio','criterio','evaluar',
  'elegir','riesgo','presupuesto','proyecciones','analizar','decide','bias'
] where slug = 'thinking-fast-slow';

update books set terms = array[
  'crisis','despedir','conflicto','socios','fundador','dirigir','empresa','negocio',
  'dueño','emprend','startup','difícil','dificil'
] where slug = 'the-hard-thing';

update books set terms = array[
  'hábito','habito','hábitos','habitos','rutina','constancia','procrastin','disciplina',
  'organizar','mi día','mi dia','todos los días','todos los dias','habit','routine'
] where slug = 'atomic-habits';

update books set terms = array[
  'producto','app','aplicación','aplicacion','usuarios','funcionalidad','lanzar',
  'desarrollo','roadmap','software','product','users'
] where slug = 'inspired';

update books set terms = array[
  'comunicar','comunicación','comunicacion','presentar','presentación','presentacion',
  'mensaje','contar','explicar','capacitar','charla','redes','contenido','campaña',
  'campana','newsletter','communicate','pitch'
] where slug = 'made-to-stick';

update books set terms = array[
  'coordino','coordinar','procesos','proceso','operaciones','reuniones','reunión',
  'reunion','delegar','medir','rendimiento','supervisar','planificar','agenda',
  'operations','meetings'
] where slug = 'high-output-management';

update books set terms = array[
  'posicionamiento','posicionar','diferenciar','competencia','mercado','marca',
  'vender','ventas','clientes','admisiones','matrícula','matricula','marketing',
  'campañas','campanas','positioning','sales'
] where slug = 'obviously-awesome';

-- ------------------------------------------------------------
-- Control
-- ------------------------------------------------------------
-- Los 8 con términos, y a quién le pegaría cada uno hoy.
select
  b.slug,
  cardinality(b.terms) as terminos,
  (select string_agg(left(p.id::text, 8), ', ')
     from profiles p
    where p.context_summary is not null
      and exists (
        select 1 from unnest(b.terms) as t
        where position(t in lower(p.context_summary)) > 0
      )) as le_pega_a
from books b
order by b.slug;
