-- ============================================================
-- Frontera - track fundacional ampliado, lecciones 11 a 16
-- ============================================================
-- Seis lecciones de practica de trabajo real para nivel 0 y 1.
-- Todas arrancan de un problema concreto, traen un ejemplo trabajado,
-- un "probalo ahora" de cinco minutos y cierran con una regla.
-- No afirman nada de herramientas puntuales: hablan del comportamiento.
-- ============================================================

insert into lessons (slug, topic_id, kind, level_floor, level_ceiling, track_order, published)
select v.slug, t.id, 'fundamento', 0, 1, v.orden, true
from (values
  ('f11-verifica-en-dos-minutos',  'limites',     11),
  ('f12-documento-largo',          'archivos',    12),
  ('f13-mail-dificil',             'como-pedir',  13),
  ('f14-prepara-una-reunion',      'como-pedir',  14),
  ('f15-compara-dos-opciones',     'como-pedir',  15),
  ('f16-aprende-con-tutor',        'fundamentos', 16)
) as v(slug, topico, orden)
join topics t on t.slug = v.topico
on conflict (slug) do nothing;

-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'es', null,
  'Verificá una respuesta en dos minutos',
  'Sabés que puede inventar. Lo que casi nadie sabe es cómo chequear rápido sin rehacer el trabajo desde cero.',
$md$
Le pediste a la IA un resumen de lo que dice la normativa sobre el período de matriculación. Te contestó con tres párrafos prolijos, con fechas y un porcentaje. Suena perfecto. Lo vas a pegar en un mail para las familias.

Ahora viene la parte incómoda: no podés saber si es cierto. Y verificar todo te llevaría más que escribirlo vos. Entonces, o confiás a ciegas, o dejás de usarla. Hay una tercera opción, y es mirar **solo lo que importa**.

## No se verifica todo, se verifica lo que se rompe

Una respuesta larga tiene dos tipos de frases. Las que si están mal no pasa nada ("la educación es un proceso complejo") y las que si están mal te caés: una fecha, una cifra, un nombre, una cita, un requisito. Esas son las únicas que necesitás mirar.

El método tiene tres pasos y entra en dos minutos:

1. **Marcá los datos duros.** Releé la respuesta y subrayá todo lo que sea un número, una fecha, un nombre propio, una cita o algo que "dice la ley". Casi siempre son cinco o seis.
2. **Pedile que se delate.** Escribile: "De tu respuesta, separame los datos que sabés con seguridad de los que podrías estar inventando, y decime de dónde sale cada uno". No es infalible, pero muchas veces reconoce que un dato es una suposición, algo que no hace solo.
3. **Confirmá en la fuente, solo esos datos.** Abrí el documento original, la página oficial o preguntale a quien sabe. No releas todo: andá derecho a la fecha y al porcentaje.

## Un ejemplo trabajado

La respuesta decía: "La matriculación cierra el 30 de noviembre y exige tres documentos, entre ellos el certificado de vacunación". Los datos duros son: la fecha, la cantidad de documentos y el certificado.

Le pedís que se delate y contesta que la fecha y el número de documentos los dedujo de "lo habitual", y que no tiene el reglamento del colegio. Con eso ya sabés que los tres datos son suposiciones. Abrís el reglamento real: la fecha era el 15 de diciembre y los documentos eran cuatro. Dos minutos, dos errores atajados antes de mandar el mail.

Notá algo: la respuesta no era "mala". Estaba bien escrita y era plausible. Por eso hay que mirar los datos y no el estilo.

## Una señal para desconfiar más

Si la respuesta incluye una cita textual, un número de artículo, un link o el título de un libro, tratala como sospechosa hasta que la veas con tus ojos. Es exactamente lo que más inventa.

## Probá que lo entendiste

Una respuesta dice: "Según un estudio de 2019, el 63 por ciento de las familias elige el colegio por la cercanía". ¿Qué es lo primero que chequeás?

:::Ver la respuesta
**El estudio, antes que el porcentaje.** Si el estudio no existe, el 63 por ciento no vale nada, aunque el número suene razonable. Buscalo por el título y el autor. Si no aparece por ningún lado, descartá todo el dato, no lo corrijas: no hay nada que corregir.
:::

## Probalo ahora

Agarrá una respuesta de IA que hayas usado esta semana, o pedile una nueva sobre algo de tu trabajo. Subrayá los datos duros y confirmá **tres** en su fuente. Cronometrate. Casi seguro no pasa de cinco minutos, y la primera vez es la más lenta.

## La regla que te llevás

**No verifiques todo: verificá lo que, si está mal, te deja mal parado.** Los datos duros primero, el estilo nunca.
$md$,
  7, 'curado'
from lessons l where l.slug = 'f11-verifica-en-dos-minutos'
on conflict do nothing;

-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'es', null,
  'Que lea un documento largo por vos',
  'Tenés cuarenta páginas para el lunes y tiempo para diez. La IA lo lee entero, pero si le pedís "un resumen" te devuelve lo que a ella le parece importante, no lo que a vos te sirve.',
$md$
Te llega un informe de cuarenta páginas, un contrato, un reglamento o la minuta de una reunión de tres horas. Tenés que saber qué dice y qué tenés que hacer vos.

El reflejo es pegarlo y escribir "resumilo". Te devuelve una página prolija que dice cosas ciertas y generales, y se salteó justo el párrafo que te afectaba. No es un error de la herramienta: le pediste que decidiera ella qué era importante, y no sabe qué es importante **para vos**.

## Primero la pregunta, después el documento

La diferencia entre un resumen inútil y uno bueno es decirle antes **para qué lo estás leyendo**. Compará:

- "Resumí este documento."
- "Este es el reglamento de convivencia. Soy quien atiende a las familias. Quiero saber qué cosas cambiaron para este año, qué tengo que avisarles y qué plazos aparecen."

El segundo no pide menos: pide algo que se puede responder y chequear.

## Cuatro pedidos que funcionan casi siempre

- **Lo que me afecta a mí.** Decile tu rol y pedí solo lo que te toca.
- **Lo que hay que hacer.** "Listame las tareas, quién las tiene y la fecha, si la hay."
- **Lo que no se entiende o se contradice.** "¿Hay algo ambiguo o que se contradiga entre secciones?" Ahí aparecen los problemas de verdad.
- **Dónde dice cada cosa.** "Al lado de cada punto, decime en qué sección o página está." Esto es lo que te permite chequear sin releer todo.

## Un ejemplo trabajado

Un informe de admisiones de treinta y ocho páginas. Tu pedido: "Soy responsable de comunicación. Decime qué números del informe puedo usar en un mail a las familias, cuáles son estimaciones y en qué página está cada uno."

La respuesta trae seis números, cada uno con su página. Vas a las seis páginas, que te lleva tres minutos, y descubrís que uno estaba en un cuadro de "proyecciones" y no de datos reales. Lo sacás. Si hubieras pedido "un resumen", ese número habría quedado mezclado con los demás sin ninguna marca.

## Lo que hay que tener en cuenta

Si el documento es larguísimo, a veces la herramienta se deja cosas por el camino sin avisarte. Dos defensas simples. Una: pedile al final "¿qué partes del documento no usaste?". Otra: partí el documento en capítulos y trabajá de a uno. Y recordá la regla de siempre: los datos duros se confirman en el original.

## Probá que lo entendiste

Tenés una minuta de una reunión de dos horas y no estuviste. ¿Cuál de estos pedidos es el mejor?

1. "Resumime esta minuta."
2. "No estuve en la reunión. Decime qué se decidió, qué me asignaron a mí y qué quedó sin resolver."
3. "Hacé la minuta más corta."

:::Ver la respuesta
**El 2.** Sabe para qué la querés (ponerte al día), te da una pregunta concreta (decidido, asignado, pendiente) y sirve para actuar el mismo día. El 1 te da un resumen genérico y el 3 sigue siendo una minuta que nadie lee.
:::

## Probalo ahora

Elegí un documento real que tengas pendiente de leer. Antes de pegarlo, escribí **una oración** que diga para qué lo necesitás y qué decisión vas a tomar con eso. Después pedí las tres cosas: lo que te afecta, lo que hay que hacer y dónde dice cada cosa. Chequeá dos de esos puntos contra el original.

## La regla que te llevás

**No le pidas un resumen: pedile una respuesta a tu pregunta.** Lo que la herramienta lee bien es lo que vos le explicaste que buscabas.
$md$,
  7, 'curado'
from lessons l where l.slug = 'f12-documento-largo'
on conflict do nothing;

-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'es', null,
  'Un mail difícil, con el tono justo',
  'Decir que no, contestar un reclamo, avisar una mala noticia. Es el trabajo donde más se nota la diferencia entre una respuesta fría y una que cuida la relación.',
$md$
Una familia escribe enojada: pagó una actividad que se canceló y quiere el dinero de vuelta. La política del colegio dice que no se reintegra. Tenés que contestar hoy, y no querés ni sonar a burócrata ni prometer lo que no podés.

Escribir un mail así lleva media hora y tres borradores, porque el problema no es la gramática: es el tono. Y el tono es lo que la IA hace muy bien, si le contás la situación completa.

## Lo que no tenés que hacer

Pedir "contestá este reclamo". Con eso, la herramienta tiene que adivinar si querés ceder, negar, pedir disculpas o explicar. Adivina, y casi siempre sale un mail con un "lamentamos los inconvenientes" que no dice nada.

## Lo que sí: contale cuatro cosas

1. **Qué pasó**, en pocas líneas, y pegá el mail original de la persona.
2. **Qué podés y qué no podés ofrecer.** "No puedo devolver el dinero. Sí puedo ofrecer un cupo en la próxima actividad."
3. **Cómo querés sonar.** "Cálido pero firme. Que reconozca el enojo, sin pedir perdón por algo que no fue error nuestro."
4. **Qué querés que pase después.** "Que la familia sienta que la escuchamos y que sepa qué paso sigue."

La tercera es la que casi nadie escribe, y es la que cambia todo.

## Un ejemplo trabajado

Pedido: "Te pego el mail de una madre que reclama un reintegro por una excursión cancelada. La política es que no se devuelve, pero puedo ofrecer un crédito para la próxima excursión. Redactá la respuesta: cálida, firme, que reconozca que se canceló por una decisión nuestra y no de ella, sin prometer plata. Máximo ciento cincuenta palabras."

El borrador abre reconociendo el hecho concreto (se canceló la excursión), explica la política en una oración, ofrece el crédito y cierra con un paso claro. Leés y notás que dice "entendemos perfectamente su frustración", una frase que no usarías nunca. Le pedís: "Cambiá esa frase por algo más simple, como hablo yo". Listo.

## El borrador es tuyo, no de la herramienta

Dos controles antes de enviar. Primero, que **no prometa nada que no puedas cumplir**: releé buscando verbos como "garantizamos", "seguro" o "sin falta". Segundo, que **suene a vos**. Si una frase no la dirías en voz alta, cambiala. Y no pegues datos personales de la familia más de los que hacen falta: el nombre de pila alcanza.

## Probá que lo entendiste

Tenés que decirle que no a una familia que pide una beca fuera de plazo. ¿Qué dato de la situación no puede faltar en tu pedido?

:::Ver la respuesta
**Qué sí podés ofrecer.** Un "no" solo es un mail que corta la relación. Si hay una alternativa (otro plazo, otra vía, una persona con quien hablar), incluila en el pedido para que el mail no termine en una puerta cerrada. Si no hay nada que ofrecer, decíselo: "no hay alternativa, quiero que el no sea claro y respetuoso".
:::

## Probalo ahora

Pensá en un mail difícil que tengas pendiente, o uno del último mes. Escribí las cuatro cosas (qué pasó, qué podés y qué no, cómo querés sonar, qué querés que pase después) y pedí **dos versiones**: una más cálida y una más directa. Elegí una y cambiá lo que no sea tuyo. Compará el tiempo con lo que te hubiera llevado solo.

## La regla que te llevás

**El tono se pide, no se espera.** Si no le decís cómo querés sonar, la herramienta elige el tono más neutro, y en un mail difícil el neutro suena frío.
$md$,
  7, 'curado'
from lessons l where l.slug = 'f13-mail-dificil'
on conflict do nothing;

-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'es', null,
  'Preparate para una reunión con la IA',
  'La mejor ayuda no es que te escriba la presentación: es que te haga las preguntas que te va a hacer la otra persona, antes de que las haga.',
$md$
Mañana tenés una reunión que importa: con la dirección por un presupuesto, con una familia que está por irse, con un proveedor al que le vas a pedir un descuento. Pensás "tengo que prepararme" y terminás releyendo tus notas, que ya conocés.

El problema de prepararte solo es que **vos ya sabés lo que sabés**. Los puntos ciegos son, por definición, los que no ves. Ahí la IA sirve de una forma que se aprovecha poco: no como la que escribe, sino como la que ensaya con vos.

## Tres usos, de menos a más valioso

**Ordenar.** Le volcás todo lo que tenés en la cabeza, desordenado, y le pedís: "Ordename esto en lo que quiero lograr, lo que tengo que decir y lo que me falta saber". Esto ahorra tiempo, pero no es lo mejor.

**Anticipar.** "Voy a pedirle a la dirección que apruebe esto. ¿Qué objeciones me pueden hacer, de las más probables a las menos?" Te devuelve diez objeciones, y dos o tres no las habías pensado.

**Ensayar.** "Hacé de director. Ponete duro. Hacéme una pregunta por vez y esperá mi respuesta." Es lo más parecido a un ensayo real, y te deja practicar la respuesta que te cuesta.

## Un ejemplo trabajado

Tenés que pedir presupuesto para renovar el sitio web del colegio. Le contás: "Soy responsable de comunicación. Mañana le pido a la dirección el presupuesto para renovar el sitio. Los motivos son: el sitio es lento, no se ve bien en el teléfono y las familias nos preguntan cosas que deberían estar ahí. Lo que me preocupa es que me pidan resultados concretos y no los tengo."

La herramienta anticipa: "¿Cuántas consultas se perdieron por eso?", "¿Qué pasa si esperamos un año?", "¿No se puede arreglar sin renovar todo?". La segunda y la tercera no las habías pensado. Ahora tenés que armar respuestas, y ahí empieza la preparación de verdad.

## Lo que no podés delegar

La herramienta no conoce a la persona con la que vas a hablar ni la historia del lugar. Las objeciones que te da son las típicas, y las particulares las sabés vos. Sumá las tuyas: "Además, esta persona siempre pregunta por el costo antes que por el beneficio". Y no la uses para escribir lo que vas a decir palabra por palabra: en una reunión no se lee.

## Probá que lo entendiste

Vas a darle una mala noticia a un colega. ¿Cuál es el mejor pedido de ensayo?

1. "Escribí lo que tengo que decirle."
2. "Hacé de mi colega, que se va a enojar y va a decir que es injusto. Respondeme como lo haría, de a una frase por vez."
3. "Dame diez consejos para dar malas noticias."

:::Ver la respuesta
**El 2.** Es el único que te hace practicar: reaccionás a una respuesta, no a una lista. El 1 te deja con un texto que no vas a poder leer en vivo y el 3 es teoría que ya sabés. Después del ensayo, pedile "¿qué hice bien y qué cambiarías?" y vas a tener una devolución concreta.
:::

## Probalo ahora

Pensá en una reunión de esta semana. En cinco minutos: contale en tres frases de qué se trata, qué querés lograr y qué te preocupa. Pedile las **cinco objeciones más probables** y escribí al lado de cada una tu respuesta en una línea. Si alguna no la podés contestar, descubriste qué te faltaba preparar.

## La regla que te llevás

**Pedile que te pregunte, no que te escriba.** La preparación vale por las preguntas que no habías pensado, y la herramienta es excelente para hacerlas.
$md$,
  7, 'curado'
from lessons l where l.slug = 'f14-prepara-una-reunion'
on conflict do nothing;

-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'es', null,
  'Comparar dos opciones para decidir',
  'Cuando dudás entre dos caminos, pedirle "cuál es mejor" es la peor pregunta posible. Hay una forma de preguntar que te ordena la cabeza sin decidir por vos.',
$md$
Tenés que elegir entre dos proveedores, dos fechas para un evento, dos candidatos o dos formas de organizar la inscripción. Las dos tienen pros y contras, y llevás una semana dándole vueltas.

Le preguntás a la IA: "¿Cuál es mejor?". Te contesta con seguridad que la A, con tres argumentos que suenan bien. Si le volvés a preguntar de otra manera, a veces te dice la B. No es que cambie de opinión: **no tiene criterio propio sobre tu situación**, y si no se lo das, elige lo que suena más razonable en general.

## Qué sí hace bien

No decide por vos. Lo que hace muy bien es ordenar la decisión, y eso ya es la mitad del trabajo. Son cuatro pasos.

1. **Contale qué estás decidiendo y qué te importa.** "Elijo entre dos sistemas de inscripción. Me importa, en este orden: que las familias no se compliquen, que cueste poco mantenerlo y que se pueda cambiar si no funciona."
2. **Pedile los criterios que te falta considerar.** "¿Qué otros factores debería mirar que no te nombré?" Suele aparecer uno que olvidaste.
3. **Pedile que compare las dos opciones criterio por criterio**, en lista. No en una tabla ni con puntajes: con una oración por opción y por criterio.
4. **Pedile qué tendría que ser cierto para que gane cada una.** Esta es la más útil.

## Un ejemplo trabajado

Dudás entre hacer la jornada de puertas abiertas un sábado a la mañana o un jueves a la tarde. Le pasás el contexto y tus prioridades: asistencia de familias que trabajan, costo de abrir el colegio y comodidad del personal.

Y le preguntás: "¿Qué tendría que ser cierto para que gane el sábado, y qué para que gane el jueves?". Responde: el sábado gana si la mayoría de las familias trabaja en horario de oficina y si el personal acepta el día extra. El jueves gana si podés dar entrada flexible a las familias. Ahora la decisión es otra: ya no es "¿cuál es mejor?", es "¿cuál de esas dos cosas es cierta?". Y eso lo podés chequear con una llamada, o con la lista de inscriptos del año pasado.

## El riesgo: que te dé la razón

Si le decís "yo creo que la A, ¿no?", te va a dar la razón con argumentos. Las herramientas tienden a acompañar lo que vos planteás. Para evitarlo, pedí que defienda la opción **contraria** a la que preferís: "Convencime de elegir la B, con los mejores argumentos". Si no te mueve nada, ya tenés más seguridad en la A.

## Probá que lo entendiste

Tenés dos candidatos para un puesto y quizás ya te inclinás por uno. ¿Qué es lo primero que le pedís a la herramienta?

:::Ver la respuesta
**Que defienda al candidato que te gusta menos.** Si contás cuál preferís, tiende a confirmarte. Pedile los mejores argumentos para el otro y mirá si alguno te hace dudar. Después sí, ordená los criterios. Y la decisión final sobre una persona, siempre es tuya y se apoya en entrevistas, no en lo que escribió una IA.
:::

## Probalo ahora

Elegí una decisión chica que tengas abierta. Escribí qué te importa, **en orden de prioridad**, y hacé los pasos 2 y 4: los criterios que faltan y qué tendría que ser cierto para que gane cada opción. Quedate con lo que se pueda chequear esta semana.

## La regla que te llevás

**No le preguntes cuál es mejor: preguntale qué tendría que ser cierto.** La decisión sigue siendo tuya, pero ahora sabés qué mirar para tomarla.
$md$,
  7, 'curado'
from lessons l where l.slug = 'f15-compara-dos-opciones'
on conflict do nothing;

-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'es', null,
  'Aprender algo nuevo con un tutor que te pregunta',
  'Si le pedís que te explique, entendés mientras leés y olvidás al cerrar. Si le pedís que te pregunte, aprendés.',
$md$
Tenés que entender algo nuevo para el trabajo: cómo se lee un balance, qué es un indicador de conversión, cómo funciona un sistema de becas. Le pedís a la IA que te lo explique. La explicación es clara, la leés, asentís, y una semana después no te acordás de nada.

Pasa algo conocido: leer una explicación clara da la **sensación** de haber entendido. Entender de verdad se nota cuando tenés que usar la idea, no cuando la reconocés.

## Dale vuelta al rol

El mejor uso para aprender no es que ella hable y vos leas. Es que **ella te pregunte y vos respondas**. Esa incomodidad de tener que sacar la respuesta de tu cabeza es justamente lo que fija el conocimiento.

## Cómo armar la sesión

Escribile algo así, adaptado a lo tuyo:

"Quiero aprender [el tema]. Ahora entiendo [lo poco que sepas]. Actuá como tutor: explicame una idea cortita, después hacéme una pregunta para ver si la entendí, y esperá mi respuesta antes de seguir. Si me equivoco, no me des la respuesta enseguida: dame una pista. Usá ejemplos de [tu trabajo]."

Cuatro piezas que importan: **dónde estás parado** (para que no te explique lo que ya sabés ni lo que todavía no podés seguir), **una idea por vez**, **esperar tu respuesta**, y **pista antes que solución**.

## Un ejemplo trabajado

Querés entender qué es la "tasa de conversión" porque tu equipo la nombra en cada reunión. Le decís que de marketing sabés poco, que trabajás en un colegio y que querés ejemplos de admisiones.

Te explica en tres líneas: de cada cien familias que consultan, cuántas terminan inscribiendo. Y pregunta: "Si ayer consultaron doscientas familias y se inscribieron diez, ¿cuál es la tasa?". Contestás "diez por ciento", y te corrige con cariño: es cinco, porque diez sobre doscientos. Te equivocaste en algo tan simple que no lo vas a olvidar más. Pasa a la siguiente idea: "¿Y qué harías si baja de cinco a tres?".

## Tres cuidados

- **No le creas todo.** Si aprendés algo que vas a usar para decidir, confirmalo en otra fuente. Un tutor que inventa una definición con total seguridad es peor que ninguno.
- **Pedile que corte.** Si empieza a repetirse o a dar vueltas, decile "pasemos a otra cosa".
- **Cerrá la sesión con un repaso.** "Preguntame cinco cosas de lo que vimos, sin pistas." Es la parte que más rinde y la que más se saltea.

## Probá que lo entendiste

Después de una sesión de tutoría sobre un tema nuevo, ¿cuál es la mejor forma de comprobar que realmente lo aprendiste?

:::Ver la respuesta
**Explicárselo con tus palabras a alguien, o a la herramienta, sin mirar nada.** Pedile: "Hacé de compañero de trabajo que no sabe nada del tema. Voy a explicártelo y vos me hacés preguntas". Si te trabás en algún punto, ahí está lo que todavía no entendiste. Releer tus apuntes da la misma falsa sensación de entender que leer la explicación.
:::

## Probalo ahora

Elegí algo que te toca saber y que todavía no dominás. Escribí el pedido de tutor con las cuatro piezas y hacé **diez minutos** de sesión. Al final pedí el repaso de cinco preguntas. Anotá cuántas contestaste sin ayuda: ese número es lo que aprendiste, y es más honesto que lo que sentís.

## La regla que te llevás

**Para aprender, que te pregunte ella.** Leer una buena explicación se siente como aprender; contestar una pregunta difícil es aprender.
$md$,
  7, 'curado'
from lessons l where l.slug = 'f16-aprende-con-tutor'
on conflict do nothing;
