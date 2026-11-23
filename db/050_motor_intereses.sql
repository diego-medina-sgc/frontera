-- ============================================================
-- Frontera - el léxico de la persona entra al ruteo
-- ============================================================
-- `interview_answers` era la señal más caliente que la app recogía y
-- la que menos hacía: la persona escribe con sus palabras a qué se
-- dedica y para qué quiere usar la IA, y eso se guardaba para nadie.
--
-- Esto le da un consumidor. Dos piezas:
--
--   topics.terms          -> qué palabras, en el idioma de una persona
--                            que no es técnica, apuntan a cada nodo.
--                            Es data, no código: se edita a mano
--                            cuando el campo o la gente cambian, igual
--                            que jobs/lexico.mjs.
--
--   profiles.interest_topics -> los nodos que la persona nombró sin
--                            saber que los nombraba. Se calcula una
--                            vez al terminar el onboarding y cuando
--                            edita su contexto en Ajustes.
--
-- Con eso, entre dos lecciones de frontera que la persona puede leer
-- hoy, va primero la del tema que ella misma puso sobre la mesa. No
-- bloquea nada y no toca el radar —ahí manda la novedad— ni el track,
-- donde el orden es pedagógico.
--
-- Los términos son deliberadamente de la vida real ("planillas",
-- "mails", "repetitivo") y no del campo ("rag", "fine-tuning"): esto
-- lee lo que escribe alguien que recién llega, no un paper.
-- ============================================================

alter table topics    add column if not exists terms          text[] not null default '{}';
alter table profiles  add column if not exists interest_topics bigint[];

comment on column topics.terms is
  'Palabras de la vida real que apuntan a este nodo. Se cruzan con lo que la persona escribió en el onboarding.';
comment on column profiles.interest_topics is
  'Nodos que la persona nombró en sus respuestas. Null = todavía no se calculó. {} = no nombró ninguno.';

-- ------------------------------------------------------------
-- Los términos, nodo por nodo
-- ------------------------------------------------------------
-- Las variantes sin acento están a propósito: mucha gente escribe sin
-- acentos y el cruce es por subcadena. Van de a un update por nodo: es
-- más largo de leer y mucho más fácil de editar sin romper nada.
update topics set terms = array[
  'recién empiezo','recien empiezo','nunca la usé','nunca la use','empezando',
  'aprender a usar','beginner','just starting'
] where slug = 'fundamentos';

update topics set terms = array[
  'instrucciones','prompt','que me responda','cómo me habla','como me habla',
  'tono','personalizar','instructions'
] where slug = 'instrucciones';

update topics set terms = array[
  'escribir','redactar','mails','correos','textos','resumir','resúmenes','resumenes',
  'ordenar ideas','traducir','writing','emails','summar','drafting','copy'
] where slug = 'como-pedir';

update topics set terms = array[
  'verificar','chequear','se equivoca','inventa','confiar','corregir',
  'verify','checking','accuracy','fact'
] where slug = 'limites';

update topics set terms = array[
  'privacidad','datos sensibles','confidencial','alumnos','pacientes','familias',
  'historia clínica','legajo','privacy','sensitive','confidential'
] where slug = 'privacidad';

update topics set terms = array[
  'archivos','planillas','planilla','excel','sheets','pdf','documentos','informes',
  'files','spreadsheet','documents','reports'
] where slug = 'archivos';

update topics set terms = array[
  'proyectos','contexto','que se acuerde','que recuerde','proyecto largo',
  'projects','context','remember'
] where slug = 'contexto';

update topics set terms = array[
  'imagen','imágenes','imagenes','audio','voz','video','transcri','fotos','gráficos',
  'graficos','image','voice','photos','charts'
] where slug = 'modalidades';

update topics set terms = array[
  'automatizar','automatización','automatizacion','repetitiv','todos los meses',
  'todas las semanas','todos los días','todos los dias','recurrente','flujo',
  'zapier','n8n','automat','workflow','recurring'
] where slug = 'automatizacion';

update topics set terms = array[
  'agente','agentes','mcp','claude code','que trabaje solo','que haga solo',
  'herramientas conectadas','skill','agent','agentic','tool'
] where slug = 'agentes';

update topics set terms = array[
  'medir','evaluar','métricas','metricas','calidad','kpi','indicadores','tablero',
  'measure','eval','metrics','quality','dashboard'
] where slug = 'evals';

update topics set terms = array[
  'delegar','mientras no estoy','en segundo plano','que corra solo','de noche',
  'asincr','background','async','overnight','delegate'
] where slug = 'asincronico';

update topics set terms = array[
  'qué modelo','que modelo','modelos','gpt','claude','gemini','copilot','llm',
  'comparar herramientas','cuál conviene','cual conviene','which model','models'
] where slug = 'modelos';

update topics set terms = array[
  'equipo','negocio','empresa','ventas','marketing','admisiones','clientes',
  'adopción','adopcion','productividad','roi','capacitar','institución','institucion',
  'business','team','sales','adoption','productivity','enterprise'
] where slug = 'negocios';

update topics set terms = array[
  'aplicación','aplicacion','web app','programar','código','codigo','desarrollar',
  'desarrollo','base de datos','supabase','sitio web','software','product',
  'coding','code','build an app','database'
] where slug = 'producto';

update topics set terms = array[
  'diseño','diseno','diseñar','contenido','redes','redes sociales','instagram',
  'marca','gráfic','grafic','piezas','design','content','social media','brand'
] where slug = 'diseno';

update topics set terms = array[
  'documentos largos','mucho texto','mucha información','mucha informacion',
  'memoria','que se acuerde de todo','long context','memory','large documents'
] where slug = 'contexto-largo';

-- ------------------------------------------------------------
-- Los perfiles que ya hicieron el onboarding
-- ------------------------------------------------------------
-- La app lo calcula sola al terminar el Paso 1, pero quien ya pasó por
-- ahí no vuelve a pasar: se les calcula acá, con el mismo criterio.
-- Sólo las tres preguntas abiertas; las de estilo no dicen nada sobre
-- qué temas le sirven.
update profiles p
set interest_topics = coalesce((
  select array_agg(distinct t.id)
  from topics t
  where exists (
    select 1
    from interview_answers ia, unnest(t.terms) as term
    where ia.profile_id = p.id
      and ia.q_key in ('rol', 'contexto', 'usos')
      and position(term in lower(ia.answer)) > 0
  )
), '{}')
where p.onboarded_at is not null;

-- ------------------------------------------------------------
-- Control
-- ------------------------------------------------------------
-- 17 nodos con términos, y cada perfil con onboarding con su lista
-- (puede ser vacía: quien escribió tres palabras no nombró nada).
select
  (select count(*) from topics where cardinality(terms) > 0)            as nodos_con_terminos,
  (select count(*) from topics)                                         as nodos,
  (select count(*) from profiles where onboarded_at is not null
     and interest_topics is null)                                       as perfiles_sin_calcular;

select
  left(p.id::text, 8) as perfil,
  p.level,
  cardinality(p.interest_topics) as temas_nombrados,
  (select string_agg(t.slug, ', ' order by t.sort)
     from topics t where t.id = any(p.interest_topics)) as cuales
from profiles p
where p.onboarded_at is not null
order by p.level desc;
