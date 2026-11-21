-- ============================================================
-- Frontera - las tres lecciones del salto al nivel 4
-- ============================================================
-- Los tres nodos que la evidencia marca flojos y que, juntos, son la
-- diferencia entre construir cosas con IA y sostenerlas:
--   medir y evaluar · trabajo asincrónico · contexto y memoria
-- Nivel 3 a 4. Abajo de eso no se muestran.
-- ============================================================

insert into lessons (slug, topic_id, kind, level_floor, level_ceiling, published)
select v.slug, t.id, 'frontera', 3, 4, true
from (values
  ('fr-evals',       'evals'),
  ('fr-asincronico', 'asincronico'),
  ('fr-contexto',    'contexto-largo')
) as v(slug, topico)
join topics t on t.slug = v.topico
on conflict (slug) do nothing;

-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'es', null,
  'Cómo sabés que todavía funciona',
  'Tenés cosas en producción que usan personas reales. Si una se degrada mañana, ¿cómo te enterás?',
$md$
Esta es, probablemente, la única cosa que te separa de la categoría siguiente. No es una herramienta nueva ni un modelo mejor: es una disciplina que casi nadie sin formación técnica tiene, y que a vos te hace falta porque ya tenés cosas andando que usan otras personas.

## El problema

Un sistema con IA adentro no falla como falla un programa normal. Un programa roto tira un error y te enterás. Un sistema con IA **sigue respondiendo**, con la misma seguridad de siempre, y lo que cambia es la calidad. Clasifica un poco peor. Se saltea un caso que antes agarraba. Inventa un dato cada veinte respuestas en vez de cada doscientas.

Nadie te avisa. Te enterás cuando alguien se queja, que es tarde y caro, o nunca.

Y hay tres razones por las que se degrada sin que vos toques nada: **cambió el modelo** por debajo, **cambiaron los datos** que entran, o **alguien tocó el prompt** para arreglar un caso y rompió otros cinco sin darse cuenta.

## Qué es un eval, sin vueltas

Un conjunto de casos de prueba con la respuesta correcta al lado, que corrés cuando querés y te dice qué porcentaje salió bien.

Eso es todo. No hace falta ninguna herramienta. Una planilla con tres columnas —entrada, respuesta esperada, resultado— ya es un eval, y es infinitamente mejor que nada.

## Cómo se arma el primero

**Juntá veinte casos reales.** No inventados: reales, de los que ya pasaron por tu sistema. Diez típicos y diez raros. Los raros son los que valen: el mail ambiguo, el que viene en dos idiomas, el que tiene el dato en una imagen.

**Escribí al lado qué tendría que haber pasado.** Esta parte duele porque te obliga a definir qué es correcto, y muchas veces descubrís que no lo tenías claro. Ese descubrimiento ya justifica el ejercicio.

**Corré los veinte y contá.** Diecisiete de veinte es tu línea de base. No importa si es alto o bajo: importa que exista, porque a partir de ahora cualquier cambio se compara contra eso.

**Volvé a correrlo cada vez que toques algo.** Si bajó, rompiste algo. Si subió, mejoraste. Sin esto estás adivinando, y la sensación de que mejoró es notoriamente poco confiable.

## La trampa

Hay una advertencia que viene de la gente que entrena modelos y vale igual acá: **un verificador que acepta respuestas incorrectas es peor que no tener ninguno.** Si tus veinte casos tienen respuestas esperadas flojas, vas a optimizar hacia lo flojo con la tranquilidad de estar midiendo.

Por eso los veinte casos se escriben despacio y se revisan. Es la parte lenta y es la que hace el trabajo.

## Qué hacer esta semana

Elegí **la cosa tuya que más usa otra gente**. Abrí una planilla. Pegá diez casos reales con lo que debería haber salido. Corrélos. Anotá el número.

Con eso ya estás midiendo, que es más de lo que hace la enorme mayoría de la gente que tiene sistemas con IA en producción.
$md$,
  9, 'curado'
from lessons l where l.slug = 'fr-evals'
on conflict do nothing;

-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'es', null,
  'Trabajo que pasa sin vos',
  'El indicador de nivel real no es cuántas herramientas conocés. Es cuánto trabajo ocurre mientras no estás.',
$md$
Hay una forma de medir el nivel de alguien con IA que no falla, y no tiene nada que ver con cuántas herramientas conoce: **cuánto trabajo útil ocurre mientras esa persona no está mirando.**

Para la enorme mayoría, incluida la que usa IA muy bien, la respuesta es cero. Todo pasa en tiempo real: pedís, mirás, corregís, cerrás. Es una conversación, y una conversación requiere que estés.

## Por qué importa

No es una cuestión de productividad. Es que hay una clase entera de cosas que **solo se pueden hacer sin vos delante**, y mientras trabajes de forma conversacional, ni las vas a intentar.

Revisar todos los días algo que cambia poco. Juntar material de muchas fuentes y quedarse con lo que sirve. Mirar una cola de cosas que llegan y clasificarlas. Avisarte solo cuando aparece algo que te importa. Todo eso es aburrido, repetitivo y perfectamente delegable, y nada de eso vas a hacer sentado mirando.

## Los tres escalones

**Primero: una instrucción guardada.** Lo más bajo y lo más subestimado. Escribís una vez la instrucción completa de algo que repetís, y la reusás. Todavía la disparás vos, pero ya no la pensás cada vez.

**Segundo: algo que corre solo cada tanto.** Una tarea programada que hace eso y te deja el resultado en algún lado. Acá cruzás la línea: el trabajo deja de depender de que te acuerdes.

**Tercero: algo que decide si vale la pena molestarte.** El escalón que casi nadie alcanza. No te manda todo lo que encontró: filtra y te avisa solo cuando hay algo que amerita tu atención. La diferencia entre un asistente y una notificación más.

## La parte que nadie te dice

El trabajo asincrónico tiene un costo que el conversacional no tiene: **no estás ahí para corregirlo.** Si sale mal, sale mal en silencio y durante días.

Por eso este tema y el de medir van juntos, y en ese orden. **Nada que no sepas medir debería correr sin vos.** Es la regla entera, y es la razón por la que casi todos los intentos de automatizar con IA terminan abandonados: se automatizó algo que nadie sabía si estaba funcionando bien.

## Qué hacer esta semana

Buscá **una cosa que hacés todos los lunes** y que, si se hiciera sola y mal, no pasaría nada grave. Esa es tu candidata. No la automatices todavía: escribí primero cómo te darías cuenta de que salió mal. Si no se te ocurre cómo, elegí otra.
$md$,
  8, 'curado'
from lessons l where l.slug = 'fr-asincronico'
on conflict do nothing;

-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'es', null,
  'Administrarle la atención',
  'El patrón que explica la mitad de lo que va a salir este año, y por qué tus sesiones largas empeoran.',
$md$
Hay un patrón que, una vez que lo ves, te deja entender la mayoría de las novedades antes de que las anuncien. Y además explica cosas que ya te pasan.

## El patrón

Todo lo que entra en una conversación con una IA compite por el mismo espacio: tus instrucciones, los archivos que subiste, las herramientas conectadas, y todo lo que se dijo antes. Ese espacio es finito.

Y acá está lo que casi nadie entiende: **el problema no es que no entre. El problema es que, aunque entre, el rendimiento baja.** Más cosas compitiendo por atención significa peores decisiones sobre qué mirar, igual que una persona con doce pestañas abiertas.

Por eso una conversación larga empeora aunque no llegue a ningún límite técnico. Las tres versiones viejas del archivo, los caminos que probaste y descartaste, el error que ya corregiste: todo eso sigue entrando en cada pedido y sigue compitiendo.

## La solución nunca es más espacio

Esta es la parte útil. Cada vez que algo no entra bien, la respuesta de la industria **no** es agrandar el espacio. Es **traer lo justo en el momento justo**.

Pasó con los archivos: en vez de meter el documento entero, se busca el pedazo relevante y se trae solo ese. Pasó con la memoria: en vez de arrastrar toda la historia, se guarda un resumen y se recupera lo que hace falta. Y está pasando con las herramientas: en vez de describir las cincuenta en cada pedido, se mandan los nombres y se carga la descripción completa solo de la que se va a usar.

Tres problemas distintos, la misma forma de solución, con años de diferencia. Cuando salga el próximo anuncio sobre esto, ya sabés qué va a decir.

## Las tres cosas que podés hacer hoy

**Cortar a tiempo.** El síntoma de que una conversación se saturó es inconfundible: **empezás a repetir instrucciones que ya diste.** Cuando pasa, no insistas. Abrí una nueva y pegá diez líneas de estado: qué estás haciendo, qué decidiste, qué falta, qué no hay que hacer.

**Desconectar lo que no estás usando.** Si tenés muchas herramientas conectadas, las que no hacen falta en esta sesión están gastando atención. No es gratis tenerlas prendidas por las dudas.

**Separar por tema.** Un espacio por proyecto, con su contexto propio, en vez de un lugar enorme donde está todo mezclado. Lo mismo que hacés con las carpetas, por la misma razón.

## Por qué esto es nivel 4 y no nivel 2

Porque no es una técnica: es un modelo mental. El que lo tiene entiende por qué una herramienta se comporta como se comporta, puede diagnosticar sin probar al azar, y lee los anuncios nuevos como variaciones de algo que ya entiende. El que no, vive cambiando de herramienta esperando que la próxima no tenga el problema.
$md$,
  8, 'curado'
from lessons l where l.slug = 'fr-contexto'
on conflict do nothing;
