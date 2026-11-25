-- ============================================================
-- 079 · Frontera: cuatro lecciones más para el nivel 3 (tanda e)
-- ============================================================
-- Para quien ya construye sistemas con IA, programe o no:
--
--   evals:          fr-comparar-versiones
--   contexto-largo: fr-documentos-largos
--   agentes:        fr-construir-sin-programar
--   asincronico:    fr-rutina-semanal
--
-- No repiten lo que ya está: fr-comparar-versiones va después de
-- fr-evals y fr-casos-que-crecen (no arma la prueba, la usa para
-- elegir); fr-construir-sin-programar es el pedido de antes, no la
-- revisión de después (fr-revisar-sin-leer); fr-rutina-semanal no
-- toca sombra (fr-paralelo), registro (fr-registro) ni avisos
-- (fr-avisos): es la ficha de diseño de la rutina.
-- Todos los números de los casos son hipotéticos.
-- created_at fechado el 14/11. Español e inglés británico.
-- ============================================================

insert into lessons (slug, topic_id, kind, level_floor, level_ceiling, published, created_at)
select v.slug, t.id, 'frontera', 3, 4, true, v.creada::timestamptz
from (values
  ('fr-comparar-versiones',      'evals',          '2026-11-14 12:00:00+00'),
  ('fr-documentos-largos',       'contexto-largo', '2026-11-14 11:00:00+00'),
  ('fr-construir-sin-programar', 'agentes',        '2026-11-14 10:00:00+00'),
  ('fr-rutina-semanal',          'asincronico',    '2026-11-14 09:00:00+00')
) as v(slug, topico, creada)
join topics t on t.slug = v.topico
on conflict (slug) do nothing;

-- ------------------------------------------------------------
-- fr-comparar-versiones · es
-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'es', null,
  'Dos versiones, los mismos casos',
  'Cambiaste la instrucción, la probaste y salió mejor. Esa sensación casi nunca alcanza para quedarte con la nueva.',
$md$
Tocás una instrucción, la probás con la consulta que te preocupaba y la respuesta sale mejor. Te quedás con la nueva. Es lo que hace casi todo el mundo, y es una decisión tomada sobre un solo caso: justo el caso para el que escribiste el cambio.

La idea de esta lección: **antes de quedarte con una versión nueva, corré las dos sobre los mismos casos y compará caso por caso, no el total.** El total te dice cuál ganó. Los casos que cambiaron te dicen qué ganaste y qué perdiste.

## El caso, con números

Un sistema clasifica las consultas que llegan a admisiones. La versión A es la que está andando. Quien lo mantiene escribe la versión B, con dos ejemplos más, y la prueba con la consulta que A clasificaba mal: ahora sale bien.

Corre las dos sobre sus **20 casos** de siempre (números hipotéticos):

- A acierta **15**. B acierta **16**.
- **13** los aciertan las dos. **2** los fallan las dos.
- **3** los acierta sólo B. **2** los acierta sólo A.

Mirando el total, B gana por uno. Mirando los casos que cambiaron, la historia es otra: los 3 que ganó B son consultas de información general; los 2 que perdió son **pedidos de beca**, que pasaron a quedar como visita. Ganó en lo barato y perdió en lo caro.

Y hay una cuenta más. Corre la versión A dos veces seguidas, sin tocar nada: la segunda vez da **14**. La misma instrucción, sobre los mismos casos, se movió un caso sola. Entonces una diferencia de uno entre A y B no dice nada: es del tamaño del ruido.

Decisión: no se queda con B. Arma una versión C que mantiene los ejemplos nuevos y agrega una línea sobre becas, y la compara de nuevo contra A.

## Por qué mirar uno solo engaña

El caso que probaste primero es el que la versión nueva fue escrita para arreglar. Que ande ahí es lo mínimo; lo que no sabés es qué pasó con los otros diecinueve. Y aunque mires dos o tres respuestas de cada versión, vas a ver lo que esperás ver: la nueva es tuya y querés que funcione.

## Dónde no aplica

**Un cambio que no toca la decisión.** Si la versión nueva sólo cambia la firma del mail o el formato de la salida, no hace falta comparar sobre veinte casos: mirá dos y listo.

**Si la prueba no tiene el caso nuevo, no lo va a premiar.** Si B arregla un tipo de consulta que tus 20 casos no incluyen, sumá ese caso a la prueba antes de comparar. Si no, B puede ganar en la vida real y empatar en la planilla.

**Muchas versiones contra los mismos casos terminan eligiendo a la afortunada.** Si probás seis variantes y te quedás con la que dio más, probablemente elegiste la que mejor le cayó a esos 20 casos, no la mejor. Dos o tres versiones con una idea clara cada una, no diez retoques.

## Probá que lo entendiste

Tres comparaciones. ¿Te quedás con la nueva, con la vieja, o necesitás algo más?

1. La nueva acierta 17 y la vieja 16. Los casos que cambiaron son todos de información general.
2. Probaste la nueva con la consulta que fallaba y ahora anda. No la corriste contra nada más.
3. La nueva acierta 18 y la vieja 14. Corriste la vieja dos veces y dio 14 y 15.

:::Ver la respuesta
**1. Necesitás algo más.** Uno de diferencia está dentro del ruido y lo que cambió es barato. Si la nueva no trae otra ventaja (es más corta, más clara), da lo mismo cuál uses.

**2. Todavía nada.** Sabés que anda en el caso para el que la escribiste, que es lo único que seguro iba a andar. Corréla contra los 20 antes de decidir.

**3. La nueva, después de mirar los casos que perdió.** Tres o cuatro de diferencia es más que el ruido de un caso. Pero si alguno de los que perdió es caro, eso se arregla antes de cambiar.
:::

## Qué hacer esta semana

La próxima vez que toques una instrucción, no borres la vieja. Corré las dos sobre tus casos, en dos columnas una al lado de la otra, y marcá sólo las filas donde dieron distinto. Leé esas filas antes de decidir.
$md$,
  9, 'curado'
from lessons l where l.slug = 'fr-comparar-versiones'
on conflict do nothing;

-- ------------------------------------------------------------
-- fr-documentos-largos · es
-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'es', null,
  'Un documento de ochenta páginas',
  'Con un reglamento o un contrato largo, la respuesta fluida es la peligrosa. Pedile la cita, con el lugar, y buscala vos.',
$md$
Subís un reglamento de ochenta páginas y preguntás qué pasa con la matrícula si una familia se va en marzo. La respuesta llega clara, bien escrita, con un plazo y una condición. Suena exactamente a lo que diría el reglamento. El problema es que suena igual cuando lo dice y cuando no.

La idea de esta lección: **con un documento largo, no le pidas sólo la respuesta: pedile la cita textual que la sostiene, con el lugar donde está, y verificá que esa cita exista.** La cita convierte una respuesta que tenés que creer en una que podés comprobar en un minuto.

## El caso, con números

Un colegio tiene que contestar **12 preguntas** de familias sobre su reglamento interno, que tiene ochenta páginas. Hipotético, pero muy parecido a lo que pasa.

**Primera vuelta, sólo respuestas.** Quien coordina compara las 12 contra el documento, una por una, y tarda casi dos horas: **9 están bien**, 2 mezclan una regla de nivel inicial con la de secundaria, y 1 da un plazo de treinta días que no aparece en ninguna parte.

**Segunda vuelta, con citas.** El pedido cambia: para cada respuesta, la frase textual del reglamento, la sección y la página; y si no hay frase que la sostenga, que diga "no lo encontré". Verificar es buscar cada cita en el documento: un minuto por pregunta, **12 minutos**.

- **11 citas aparecen** tal cual, donde dice.
- **1 cita no aparece** en ningún lado: es la del plazo inventado. Se descarta sin discutir.
- De las 11 que aparecen, **1 es real pero habla de otra cosa**: es de nivel inicial y la pregunta era de secundaria. La cita existe; no responde.

Las dos verificaciones son distintas y hacen falta las dos: **¿la cita existe?** y **¿la cita dice lo que la respuesta afirma?**

## Partir antes de preguntar

Con un documento de ochenta páginas, o con cinco documentos juntos, conviene hacerlo en dos pasos. Primero: "¿en qué secciones se habla de bajas, reintegros o matrícula?", con número de página. Después, la pregunta, sólo sobre esas secciones. Menos texto compitiendo, y sabés de antemano dónde tiene que estar la respuesta.

Y dejá escrito que "no está en el documento" es una respuesta válida. Si no lo permitís, completa con lo que suena razonable, y eso es lo que más cuesta detectar.

## Dónde no aplica

**Preguntas de conjunto.** "¿El tono del reglamento es muy punitivo?" no se responde con una cita. Ahí pedí tres o cuatro ejemplos citados y sacá vos la conclusión.

**Documentos escaneados.** Si el texto salió de una imagen, la cita puede venir con letras cambiadas y no aparecer en la búsqueda aunque exista. Buscá un pedazo de cinco o seis palabras, no la frase entera.

**Lo que tiene consecuencias legales.** La cita te dice qué dice el contrato. Qué significa para una familia en un caso concreto sigue siendo trabajo de quien sabe de eso.

## Probá que lo entendiste

Tres respuestas sobre el mismo contrato. ¿Cuál usás tal cual, cuál verificás de nuevo y cuál descartás?

1. Respuesta con cita y página. Buscás la cita: está en esa página, y habla justo de lo que preguntaste.
2. "Según el contrato, el aviso de rescisión es con sesenta días." Sin cita.
3. Respuesta con una cita de la página 34. Buscás la frase en todo el documento y no aparece.

:::Ver la respuesta
**1. La usás.** Existe, está donde dice y responde la pregunta. Es todo lo que se puede pedir.

**2. Pedís la cita antes de usarla.** Puede estar bien, pero así como está no la podés comprobar. Si al pedir la cita contesta que no la encuentra, ya sabés.

**3. La descartás.** Una cita que no está en el documento no es un error de página: es texto que no salió de ahí. Lo que afirma esa respuesta queda sin base.
:::

## Qué hacer esta semana

Tomá el documento largo que más consultás (un reglamento, un contrato, un informe). Hacele tres preguntas pidiendo cita textual y página, y permitiendo "no lo encontré". Buscá las tres citas. Anotá cuántas aparecen y cuántas dicen lo que la respuesta afirma.
$md$,
  9, 'curado'
from lessons l where l.slug = 'fr-documentos-largos'
on conflict do nothing;

-- ------------------------------------------------------------
-- fr-construir-sin-programar · es
-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'es', null,
  'Pedir antes de que escriba',
  'Si no programás, el código no lo podés corregir. Lo que sí podés hacer bien es el pedido y el plan, antes de que toque nada.',
$md$
Cuando trabajás con un agente que escribe código y vos no programás, hay un solo momento en que tenés ventaja: **antes** de que escriba. Después, el código es suyo y sólo podés mirar qué hace. Antes, el pedido y el plan están en tu idioma, y ahí sí podés detectar lo que está mal.

La idea de esta lección: **describí el comportamiento que esperás con casos concretos, pedile un plan en palabras y aprobalo antes de que cambie nada.** Un cambio por vez, y cada uno con su plan.

## El pedido: comportamiento y casos

"Agregá que las familias puedan anotar hermanos" deja casi todo librado al agente. Un pedido que se puede cumplir bien dice qué tiene que pasar, no cómo:

- **Qué ve la persona.** "En el formulario aparece un botón para sumar otro hijo, con los mismos campos."
- **Qué queda guardado.** "Cada hijo es una inscripción aparte, con el mismo adulto de contacto."
- **Casos.** Una familia con un hijo (tiene que andar igual que hoy). Con dos. Con un hermano que ya es alumno. Una que suma un hijo por error y lo saca antes de enviar.
- **Qué no cambia.** "La exportación que usa secretaría queda igual."

El primer caso, el que tiene que seguir igual, es el que más se olvida y el que más protege.

## El caso, con números

Hipotético, pero frecuente. **Primera forma:** el pedido de una línea. El agente arma algo, se prueba, no es lo que se quería; **tres rondas** de corrección, unas **dos horas**. Una semana después, secretaría avisa que la exportación sale con columnas nuevas y su planilla dejó de cuadrar.

**Segunda forma:** 15 minutos para escribir el pedido con casos, y la frase "antes de tocar nada, mostrame el plan en pasos y preguntame lo que no esté claro". El plan llega en seis pasos. El cuarto dice que va a reorganizar la tabla de inscripciones para que cada fila sea una familia. Eso rompe la exportación. Corregirlo en el plan lleva **5 minutos**: "no cambies la tabla; cada hijo sigue siendo una fila". Después, **una ronda** de prueba con los cuatro casos.

Total: 15 + 5 + unos 30 de construcción y prueba, **50 minutos**, contra dos horas y una rotura descubierta tarde.

## Qué mirar en un plan

- **Que cada paso tenga que ver con lo que pediste.** Si aparece "aprovecho para ordenar", "renombro para que quede más claro" o "actualizo de paso", preguntá por qué.
- **Qué pasa con los datos que ya están guardados.** Si un paso cambia cómo se guardan, querés saberlo antes.
- **Cómo lo va a probar.** Si no menciona tus casos, pedile que los use.

## Dónde no aplica

**Un cambio mínimo.** Cambiar un texto o un color no necesita plan: pedilo, miralo, listo.

**Cuando todavía no sabés qué querés.** Si estás explorando, dejá que arme algo rápido en una copia aparte y tirala después. El pedido con casos se escribe cuando ya viste qué te sirve.

**El plan no muestra todo.** Un plan prolijo no garantiza que el código lo cumpla. Lo de después (comprobar que anda) sigue haciendo falta.

## Probá que lo entendiste

Tres planes para el mismo pedido de sumar hermanos. ¿Cuál aprobás?

1. Cinco pasos, todos sobre el formulario y el guardado, y al final "pruebo con los cuatro casos que me diste".
2. Seis pasos, y uno dice "renombro la columna curso a nivel en toda la base para que sea más claro".
3. Un solo paso: "modifico lo necesario para que funcione".

:::Ver la respuesta
**1. Lo aprobás.** Se queda en lo pedido y dice cómo lo va a comprobar.

**2. No así.** Renombrar una columna en toda la base no lo pediste y puede romper cualquier cosa que la use. Pedile que saque ese paso.

**3. No es un plan.** No te deja ver nada. Pedile los pasos uno por uno, en palabras.
:::

## Qué hacer esta semana

El próximo cambio que le pidas a un agente, escribilo en cuatro partes: qué ve la persona, qué queda guardado, tres casos (uno que tiene que seguir igual) y qué no se toca. Terminá con "antes de tocar nada, mostrame el plan".
$md$,
  9, 'curado'
from lessons l where l.slug = 'fr-construir-sin-programar'
on conflict do nothing;

-- ------------------------------------------------------------
-- fr-rutina-semanal · es
-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'es', null,
  'El informe del lunes',
  'Armar algo que corre solo cada semana es fácil. Lo difícil es que dentro de seis meses alguien lo siga usando, o que alguien lo apague.',
$md$
Armar una rutina que corre sola todas las semanas ya no es difícil: un informe que se genera el lunes a la mañana, un resumen que se arma el viernes. Lo difícil es lo que pasa seis meses después, cuando hay cinco rutinas corriendo y nadie sabe bien cuáles se usan.

La idea de esta lección: **antes de armar una rutina, escribí su ficha en cinco líneas: qué entra, qué sale, dónde queda, quién la mira y cuándo se apaga.** Si alguna línea queda vacía, la rutina no está lista para correr sola.

## El caso, con números

Un equipo de admisiones armó **5 rutinas** durante el año. En noviembre las revisan (hipotético):

- **2** se usan: alguien las lee cada semana.
- **1** nadie la abre desde agosto, pero sigue corriendo.
- **1** sigue leyendo una planilla que dejó de actualizarse en julio, y cada semana produce un informe prolijo con datos viejos.
- **1** la armó alguien que ya no está en el equipo, y nadie sabe cómo cambiarla.

Dos de cinco, el 40%. Y las tres que fallan, fallan en una línea distinta de la ficha: no tenía quién la mirara, no tenía de dónde entrar bien, no tenía dueño.

## La ficha del informe del lunes

**Qué entra.** Las consultas, visitas e inscripciones de la planilla de admisiones, con fecha de lunes a domingo de la semana anterior. Corre el lunes a las 6, cuando la semana ya cerró. Y una línea con de qué depende: si la planilla cambia de lugar o de columnas, esta rutina se rompe.

**Qué sale.** Siempre lo mismo y en el mismo orden: cuatro números (consultas, visitas, inscripciones, bajas), la comparación con la semana anterior y con la misma semana del año pasado, y tres líneas de comentario. La forma fija es lo que permite comparar una semana con otra de un vistazo.

**Dónde queda.** Un documento por semana, en una carpeta fija, con la fecha en el nombre.

**Quién la mira.** Una persona, no "el equipo": quien coordina admisiones, el lunes antes de la reunión de las 9. Atar la rutina a un momento donde se usa es lo que la mantiene viva. Si no hay un momento, no hay lectura.

**Cuándo se apaga.** Al cierre del ciclo de inscripción, o si cuatro lunes seguidos nadie lo abrió. Y una fecha de revisión cada tres meses: ¿se sigue usando?, ¿sigue entrando bien?

Con esa ficha escrita, las tres rutinas que fallaban se hubieran visto antes: la de agosto se apagaba sola, la de julio tenía anotada su dependencia, y la huérfana tenía un nombre.

## Dónde no aplica

**Lo urgente no espera al lunes.** Si algo tiene que saberse el mismo día que pasa (una queja, un error en un cobro), un informe semanal llega tarde. Eso es otro tipo de cosa.

**Una rutina personal y chica.** Si la armaste para vos y lleva dos minutos leerla, la ficha puede ser una línea: dónde queda y cuándo la borrás.

**Si lo que entra se carga a mano y a destiempo**, la rutina hereda ese problema. Si la planilla se completa "cuando hay tiempo", el informe del lunes va a mentir algunos lunes. Primero se arregla la carga.

## Probá que lo entendiste

¿Qué línea de la ficha le falta a cada una?

1. Un resumen semanal que se manda a todo el equipo "para que esté al tanto". Nadie dice nada de él.
2. Un resumen de la encuesta a familias que sigue corriendo en enero, cuando no hay encuesta.
3. Un informe que cada semana sale con otra estructura, porque la IA lo redacta libre.

:::Ver la respuesta
**1. Quién la mira.** Mandarlo a todos es no mandárselo a nadie. Una persona, y un momento donde lo usa.

**2. Cuándo se apaga.** Tendría que haberse pausado al terminar la encuesta, con fecha para volver a prenderse.

**3. Qué sale.** Sin forma fija no se puede comparar una semana con otra. Los números, siempre en el mismo orden; el comentario libre, al final.
:::

## Qué hacer esta semana

Elegí una rutina que ya tengas corriendo, o la que estás por armar, y escribí su ficha de cinco líneas. Si alguna queda vacía, completala antes de que corra otra vez, aunque la respuesta sea "esta se apaga hoy".
$md$,
  9, 'curado'
from lessons l where l.slug = 'fr-rutina-semanal'
on conflict do nothing;

-- ============================================================
-- English (British)
-- ============================================================

-- ------------------------------------------------------------
-- fr-comparar-versiones · en
-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'en', null,
  'Two versions, the same cases',
  'You changed the instruction, tried it and it came out better. That feeling is hardly ever enough to keep the new one.',
$md$
You edit an instruction, try it on the enquiry that was worrying you and the answer comes out better. You keep the new one. It's what almost everyone does, and it's a decision made on a single case: precisely the case you wrote the change for.

The idea of this lesson: **before you keep a new version, run both on the same cases and compare case by case, not the total.** The total tells you which one won. The cases that changed tell you what you gained and what you lost.

## The case, with numbers

A system sorts the enquiries that reach admissions. Version A is the one in use. The person who maintains it writes version B, with two more examples, and tries it on the enquiry A used to get wrong: now it comes out right.

They run both on their usual **20 cases** (hypothetical figures):

- A gets **15** right. B gets **16** right.
- **13** both get right. **2** both get wrong.
- **3** only B gets right. **2** only A gets right.

On the total, B wins by one. On the cases that changed, it's a different story: the 3 B won are general information enquiries; the 2 it lost are **bursary requests**, now sorted as visits. It gained on the cheap ones and lost on the expensive ones.

And there's one more sum. They run version A twice in a row, without touching anything: the second time it gets **14**. The same instruction, on the same cases, moved one case on its own. So a difference of one between A and B says nothing: it's the size of the noise.

Decision: they don't keep B. They write a version C that keeps the new examples and adds a line about bursaries, and compare it against A again.

## Why looking at one misleads you

The case you tried first is the one the new version was written to fix. Working there is the bare minimum; what you don't know is what happened to the other nineteen. And even if you look at two or three answers from each version, you'll see what you expect to see: the new one is yours and you want it to work.

## Where it doesn't apply

**A change that doesn't touch the decision.** If the new version only changes the email sign-off or the output format, there's no need to compare on twenty cases: look at two and you're done.

**If the test doesn't have the new case, it won't reward it.** If B fixes a kind of enquiry your 20 cases don't include, add that case to the test before comparing. Otherwise B may win in real life and draw on the sheet.

**Many versions against the same cases end up picking the lucky one.** If you try six variants and keep the one that scored highest, you've probably chosen the one that happened to suit those 20 cases, not the best. Two or three versions with one clear idea each, not ten tweaks.

## Check you've got it

Three comparisons. Do you keep the new one, the old one, or do you need something more?

1. The new one gets 17 right and the old one 16. The cases that changed are all general information.
2. You tried the new one on the enquiry that was failing and now it works. You haven't run it against anything else.
3. The new one gets 18 right and the old one 14. You ran the old one twice and it got 14 and 15.

:::Show the answer
**1. You need something more.** A difference of one is within the noise, and what changed is cheap. If the new one brings no other advantage (shorter, clearer), it doesn't matter which you use.

**2. Nothing yet.** You know it works on the case you wrote it for, which is the only one it was sure to work on. Run it against the 20 before deciding.

**3. The new one, after looking at the cases it lost.** Three or four of a difference is more than one case of noise. But if any of the ones it lost is expensive, fix that before switching.
:::

## What to do this week

Next time you edit an instruction, don't delete the old one. Run both on your cases, in two columns side by side, and mark only the rows where they differ. Read those rows before deciding.
$md$,
  9, 'curado'
from lessons l where l.slug = 'fr-comparar-versiones'
on conflict do nothing;

-- ------------------------------------------------------------
-- fr-documentos-largos · en
-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'en', null,
  'An eighty-page document',
  'With a long policy or contract, the fluent answer is the dangerous one. Ask for the quotation, with where it is, and look for it yourself.',
$md$
You upload an eighty-page policy document and ask what happens to the enrolment fee if a family leaves in March. The answer arrives clear, well written, with a deadline and a condition. It sounds exactly like what the policy would say. The trouble is that it sounds the same whether the policy says it or not.

The idea of this lesson: **with a long document, don't just ask for the answer: ask for the verbatim quotation that supports it, with where it is, and check that the quotation exists.** The quotation turns an answer you have to believe into one you can check in a minute.

## The case, with numbers

A school has to answer **12 questions** from families about its internal policy document, which runs to eighty pages. Hypothetical, but very close to what happens.

**First round, answers only.** The coordinator checks all 12 against the document, one by one, and it takes nearly two hours: **9 are right**, 2 mix up an early years rule with the secondary one, and 1 gives a thirty-day deadline that appears nowhere.

**Second round, with quotations.** The request changes: for each answer, the verbatim sentence from the policy, the section and the page; and if no sentence supports it, say "I didn't find it". Checking means searching for each quotation in the document: a minute per question, **12 minutes**.

- **11 quotations appear** word for word, where it says.
- **1 quotation appears** nowhere: it's the one with the invented deadline. It's thrown out without argument.
- Of the 11 that appear, **1 is real but about something else**: it's from early years and the question was about secondary. The quotation exists; it doesn't answer.

The two checks are different and you need both: **does the quotation exist?** and **does the quotation say what the answer claims?**

## Split before you ask

With an eighty-page document, or five documents together, it's worth doing in two steps. First: "which sections deal with leaving, refunds or the enrolment fee?", with page numbers. Then the question, on those sections only. Less text competing, and you know in advance where the answer should be.

And state in writing that "it isn't in the document" is a valid answer. If you don't allow it, it fills in with what sounds reasonable, and that's the hardest thing to spot.

## Where it doesn't apply

**Questions about the whole.** "Is the tone of the policy very punitive?" isn't answered with one quotation. There, ask for three or four quoted examples and draw the conclusion yourself.

**Scanned documents.** If the text came from an image, the quotation may come back with letters changed and not turn up in a search even though it exists. Search for a five- or six-word fragment, not the whole sentence.

**Anything with legal consequences.** The quotation tells you what the contract says. What it means for one family in a specific case is still work for someone who knows the field.

## Check you've got it

Three answers about the same contract. Which do you use as it is, which do you check again, and which do you throw out?

1. An answer with a quotation and page. You search for the quotation: it's on that page, and it's about exactly what you asked.
2. "According to the contract, notice of termination is sixty days." No quotation.
3. An answer with a quotation from page 34. You search the whole document for the sentence and it doesn't appear.

:::Show the answer
**1. You use it.** It exists, it's where it says and it answers the question. That's all you can ask for.

**2. You ask for the quotation before using it.** It may be right, but as it stands you can't check it. If, when asked, it says it can't find it, now you know.

**3. You throw it out.** A quotation that isn't in the document isn't a page error: it's text that didn't come from there. What that answer claims is left without support.
:::

## What to do this week

Take the long document you consult most (a policy, a contract, a report). Ask it three questions, asking for a verbatim quotation and page, and allowing "I didn't find it". Search for the three quotations. Note how many appear and how many say what the answer claims.
$md$,
  9, 'curado'
from lessons l where l.slug = 'fr-documentos-largos'
on conflict do nothing;

-- ------------------------------------------------------------
-- fr-construir-sin-programar · en
-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'en', null,
  'Ask before it writes',
  'If you don''t code, you can''t correct the code. What you can do well is the request and the plan, before it touches anything.',
$md$
When you work with an agent that writes code and you don't code yourself, there's only one moment when you have the advantage: **before** it writes. Afterwards, the code is its own and you can only watch what it does. Before, the request and the plan are in your language, and that's where you can spot what's wrong.

The idea of this lesson: **describe the behaviour you expect with concrete cases, ask for a plan in words and approve it before anything changes.** One change at a time, each with its own plan.

## The request: behaviour and cases

"Let families add siblings" leaves almost everything to the agent. A request that can be met well says what should happen, not how:

- **What the person sees.** "The form has a button to add another child, with the same fields."
- **What gets stored.** "Each child is a separate application, with the same adult contact."
- **Cases.** A family with one child (must work just as it does today). With two. With a sibling who's already a pupil. One that adds a child by mistake and removes them before submitting.
- **What doesn't change.** "The export the office uses stays the same."

The first case, the one that must stay the same, is the one most often forgotten and the one that protects you most.

## The case, with numbers

Hypothetical, but common. **First way:** the one-line request. The agent builds something, it gets tried, it isn't what was wanted; **three rounds** of corrections, about **two hours**. A week later, the office reports that the export comes out with new columns and their spreadsheet no longer adds up.

**Second way:** 15 minutes to write the request with cases, plus the sentence "before touching anything, show me the plan in steps and ask me about anything unclear". The plan arrives in six steps. The fourth says it will reorganise the applications table so that each row is a family. That breaks the export. Correcting it in the plan takes **5 minutes**: "don't change the table; each child stays a row". Then **one round** of testing with the four cases.

Total: 15 + 5 + about 30 for building and testing, **50 minutes**, against two hours and a breakage discovered late.

## What to look for in a plan

- **That every step relates to what you asked for.** If you see "while I'm at it I'll tidy up", "I'll rename this to make it clearer" or "I'll update this along the way", ask why.
- **What happens to the data already stored.** If a step changes how it's stored, you want to know beforehand.
- **How it will test it.** If it doesn't mention your cases, ask it to use them.

## Where it doesn't apply

**A tiny change.** Changing a piece of text or a colour doesn't need a plan: ask, look, done.

**When you don't yet know what you want.** If you're exploring, let it build something quickly in a separate copy and throw it away afterwards. The request with cases gets written once you've seen what works for you.

**The plan doesn't show everything.** A tidy plan doesn't guarantee the code follows it. The afterwards part (checking that it works) is still needed.

## Check you've got it

Three plans for the same request to add siblings. Which do you approve?

1. Five steps, all about the form and storage, ending with "I'll test it with the four cases you gave me".
2. Six steps, one of which says "I'll rename the year group column to level across the whole database to make it clearer".
3. A single step: "I'll change whatever is needed to make it work".

:::Show the answer
**1. You approve it.** It stays within what was asked and says how it will check.

**2. Not like that.** Renaming a column across the whole database is something you didn't ask for, and it can break anything that uses it. Ask it to drop that step.

**3. It isn't a plan.** It lets you see nothing. Ask for the steps one by one, in words.
:::

## What to do this week

The next change you ask an agent for, write it in four parts: what the person sees, what gets stored, three cases (one that must stay the same) and what isn't touched. Finish with "before touching anything, show me the plan".
$md$,
  9, 'curado'
from lessons l where l.slug = 'fr-construir-sin-programar'
on conflict do nothing;

-- ------------------------------------------------------------
-- fr-rutina-semanal · en
-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'en', null,
  'The Monday report',
  'Building something that runs by itself every week is easy. The hard part is someone still using it in six months, or someone switching it off.',
$md$
Building a routine that runs by itself every week is no longer hard: a report generated on Monday morning, a summary put together on Friday. The hard part is what happens six months later, when five routines are running and nobody is quite sure which ones get used.

The idea of this lesson: **before building a routine, write its card in five lines: what goes in, what comes out, where it lands, who looks at it and when it gets switched off.** If any line is left blank, the routine isn't ready to run on its own.

## The case, with numbers

An admissions team built **5 routines** over the year. In November they review them (hypothetical):

- **2** get used: someone reads them every week.
- **1** nobody has opened since August, but it keeps running.
- **1** still reads a spreadsheet that stopped being updated in July, and every week produces a tidy report with old data.
- **1** was built by someone who has left the team, and nobody knows how to change it.

Two out of five, 40%. And the three that fail each fail on a different line of the card: it had nobody looking at it, it had no sound input, it had no owner.

## The card for the Monday report

**What goes in.** Enquiries, visits and applications from the admissions spreadsheet, dated Monday to Sunday of the previous week. It runs on Monday at 6, once the week has closed. Plus one line on what it depends on: if the spreadsheet moves or its columns change, this routine breaks.

**What comes out.** Always the same, in the same order: four figures (enquiries, visits, applications, withdrawals), the comparison with the previous week and with the same week last year, and three lines of comment. The fixed shape is what lets you compare one week with another at a glance.

**Where it lands.** One document per week, in a fixed folder, with the date in the name.

**Who looks at it.** One person, not "the team": the admissions coordinator, on Monday before the 9 o'clock meeting. Tying the routine to a moment where it gets used is what keeps it alive. If there's no moment, there's no reading.

**When it gets switched off.** At the close of the admissions cycle, or if nobody has opened it for four Mondays in a row. And a review date every three months: is it still used? Is the input still sound?

With that card written, the three failing routines would have shown up earlier: the August one would have switched itself off, the July one would have had its dependency noted, and the orphan would have had a name.

## Where it doesn't apply

**Urgent things don't wait for Monday.** If something needs to be known the same day it happens (a complaint, a billing error), a weekly report arrives too late. That's a different kind of thing.

**A small personal routine.** If you built it for yourself and it takes two minutes to read, the card can be one line: where it lands and when you delete it.

**If the input is entered by hand and late**, the routine inherits that problem. If the spreadsheet gets filled in "when there's time", the Monday report will be wrong on some Mondays. Fix the data entry first.

## Check you've got it

Which line of the card is each one missing?

1. A weekly summary sent to the whole team "to keep everyone informed". Nobody ever mentions it.
2. A summary of the parent survey that is still running in January, when there's no survey.
3. A report that comes out with a different structure every week, because the AI writes it freely.

:::Show the answer
**1. Who looks at it.** Sending it to everyone is sending it to no one. One person, and a moment where they use it.

**2. When it gets switched off.** It should have been paused when the survey ended, with a date to switch it back on.

**3. What comes out.** Without a fixed shape you can't compare one week with another. The figures always in the same order; the free comment at the end.
:::

## What to do this week

Pick a routine you already have running, or the one you're about to build, and write its five-line card. If any line is blank, fill it in before it runs again, even if the answer is "this one gets switched off today".
$md$,
  9, 'curado'
from lessons l where l.slug = 'fr-rutina-semanal'
on conflict do nothing;
