-- ============================================================
-- 066 · Frontera: cuatro lecciones más para el nivel 3
-- ============================================================
-- Tercera tanda para quien ya construye. Las cuatro van en temas que
-- Diego marcó en el Paso 1, así que el ruteo por intereses las trae
-- antes que el resto:
--
--   evals:          fr-casos-que-crecen
--   automatizacion: fr-lo-que-no-mandas
--   negocios:       fr-cuanto-cuesta
--   producto:       fr-revisar-sin-leer
--
-- created_at fechado el 18/11: dentro de los temas de cada persona,
-- frontera sirve primero lo más nuevo, y estas van después de las
-- anteriores del mismo tema. Cada una se sostiene sola.
-- Español e inglés británico en el mismo archivo.
-- ============================================================

insert into lessons (slug, topic_id, kind, level_floor, level_ceiling, published, created_at)
select v.slug, t.id, 'frontera', 3, 4, true, v.creada::timestamptz
from (values
  ('fr-casos-que-crecen', 'evals',          '2026-11-18 12:00:00+00'),
  ('fr-lo-que-no-mandas', 'automatizacion', '2026-11-18 11:00:00+00'),
  ('fr-cuanto-cuesta',    'negocios',       '2026-11-18 10:00:00+00'),
  ('fr-revisar-sin-leer', 'producto',       '2026-11-18 09:00:00+00')
) as v(slug, topico, creada)
join topics t on t.slug = v.topico
on conflict (slug) do nothing;

-- ------------------------------------------------------------
-- fr-casos-que-crecen · es
-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'es', null,
  'Cada error que encontrás es un caso nuevo',
  'La prueba no se escribe una vez. Crece con cada error real, y eso es lo que impide que el mismo error vuelva.',
$md$
Cuando armás tu primera prueba de casos, la tentación es pensarla como algo que se hace una vez. Pero el valor no está en los veinte casos del primer día: está en lo que le sumás después.

La idea de esta lección: **cada error real que aparece se agrega a la prueba, con la respuesta correcta, antes de arreglarlo.** Primero el caso, después el arreglo. Así sabés que arreglaste eso, que no rompiste otra cosa, y que si el mismo error intenta volver, la prueba lo ataja.

## El caso, con números

Dos equipos tienen el mismo sistema que clasifica consultas. Los dos arrancan con una prueba de **20 casos** y aciertan 17. En tres meses aparecen **12 errores reales** que alguien reporta.

**El equipo A** arregla cada error tocando la instrucción, lo prueba con esa consulta y sigue. La prueba sigue teniendo 20 casos. Al cuarto mes revisan: de esos 12 errores, **5 volvieron**. Cada arreglo nuevo deshizo alguno anterior, y nadie se enteró hasta que llegó otra queja.

**El equipo B** hace lo mismo, pero antes de tocar nada suma cada error a la prueba, con lo que tendría que haber salido. La prueba crece de 20 a **32 casos**, y cada cambio se corre contra los 32. Dos veces, un arreglo nuevo hizo fallar un caso viejo: **la prueba lo mostró en el momento**, antes de que llegara a una familia. De los 12 errores, no volvió ninguno sin que lo vieran.

La diferencia de trabajo: unos minutos por error para escribir el caso. La diferencia de resultado: cinco errores repetidos contra ninguno.

## Por qué primero el caso

Si escribís el caso antes de arreglar, tenés una prueba de que el arreglo funciona: el caso falla antes y pasa después. Si además los otros 31 siguen pasando, no rompiste nada. Si lo escribís después, ya no sabés si el caso pasa porque lo arreglaste o porque lo escribiste para que pase.

## Dónde no aplica

**El mismo error cinco veces no son cinco casos.** Si la confusión entre beca y visita aparece en cinco consultas parecidas, con uno o dos casos alcanza. Sumar duplicados hace la prueba más lenta sin hacerla mejor.

**Los errores de dato no son casos de la instrucción.** Si el sistema contestó con el arancel viejo porque el documento estaba desactualizado, el arreglo es el documento, no la instrucción. Ese caso, si lo sumás, va a fallar cada vez que el dato envejezca, y te va a confundir sobre dónde está el problema.

**Una prueba que sólo crece, se pone lenta.** Con doscientos casos y un corrector automático, correrla cuesta. Los que pasan siempre durante meses pueden ir a una prueba larga que se corre una vez por mes; la corta queda para cada cambio.

## Probá que lo entendiste

Tres errores reportados esta semana. ¿Cuál sumás a la prueba antes de arreglar?

1. Una consulta de beca quedó clasificada como visita.
2. Una respuesta dio el arancel del año pasado, porque el documento cargado no estaba actualizado.
3. Otra consulta de beca quedó como visita, escrita casi igual que la del punto 1.

:::Ver la respuesta
**La 1, sí.** Es un error de la instrucción: sumalo con la respuesta correcta y recién después tocá la instrucción.

**La 2, no como caso de la instrucción.** El problema es el dato. Se arregla actualizando el documento; si sumás un caso, va a fallar cada vez que el dato envejezca.

**La 3, probablemente no.** Es el mismo error que la 1, con la misma forma. Si la 1 ya está en la prueba, alcanza. Si estuviera escrita de una forma muy distinta (en otro idioma, con el pedido escondido al final), entonces sí vale como caso aparte.
:::

## Qué hacer esta semana

La próxima vez que alguien te avise de un error en algo tuyo, antes de tocar nada, sumalo a tu planilla de casos con lo que tendría que haber salido. Después arreglá, y corré la planilla entera.
$md$,
  9, 'curado'
from lessons l where l.slug = 'fr-casos-que-crecen'
on conflict do nothing;

-- ------------------------------------------------------------
-- fr-lo-que-no-mandas · es
-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'es', null,
  'Mandale sólo lo que necesita',
  'Cuando armás algo que trabaja con datos de personas, la pregunta no es qué puede hacer la IA con ellos. Es qué datos necesita de verdad.',
$md$
Cuando un sistema tuyo trabaja con datos de personas (familias, alumnos, empleados), lo más fácil es pasarle la planilla entera. Así no falta nada.

La idea de esta lección es la contraria: **mandale sólo las columnas que necesita para esa tarea, y si puede trabajar sin nombres, sin nombres.** Lo que no mandás no se puede filtrar, guardar donde no sabés, ni usar para algo que no pediste. Se llama minimizar, y es la medida de protección de datos más barata que existe.

## El caso, con números

Un colegio tiene la planilla de inscripciones con **38 columnas**: nombre del alumno, documento, fecha de nacimiento, dirección, teléfonos, mails de los adultos, información de salud, si tiene beca, curso, canal por el que llegó, fecha de la consulta, y más. Tiene **400 filas**.

La tarea: un resumen mensual de cuántas inscripciones hubo por curso y por qué canal llegaron.

Para eso hacen falta **3 columnas**: curso, canal y fecha.

- Mandando la planilla entera: 38 columnas por 400 filas, **15.200 datos**, entre ellos documentos y salud de cuatrocientos chicos.
- Mandando lo necesario: 3 por 400, **1.200 datos**, y ninguno identifica a nadie.

El resumen sale igual. La diferencia es que en el segundo caso, si algo sale mal con esa herramienta, no hay nada que se pueda filtrar.

## Tres formas de minimizar

**Sacar columnas antes.** Una copia de la planilla con sólo lo que la tarea usa. Es lo más simple y lo que más protege.

**Cambiar nombres por códigos.** Si la tarea necesita distinguir personas pero no saber quiénes son, reemplazá el nombre por un código (A-017) y guardá vos la tabla que los relaciona. La IA trabaja con códigos; vos sabés a quién corresponde cada uno.

**Contar antes.** Si la tarea es sumar o comparar, que la planilla haga la cuenta y la IA sólo comente los resultados. Le llegan diez números, no cuatrocientas filas.

## Dónde no aplica

**Hay tareas que necesitan el nombre.** Un mail de bienvenida personalizado necesita el nombre del alumno y del adulto. Entonces van esos dos, y nada más: ni el documento, ni la salud, ni la dirección.

**Un código no siempre alcanza.** En un curso de veinte alumnos, el curso más la fecha de nacimiento identifica a una persona aunque no esté el nombre. Si combinás pocas columnas muy específicas, el código no protege.

**Minimizar no reemplaza saber qué hace la herramienta.** Si es la versión gratuita y no sabés qué hace con lo que recibe, tratala como pública aunque le mandes poco.

## Probá que lo entendiste

¿Qué columnas le mandás en cada caso?

1. Un borrador de mail de bienvenida para cada una de las 30 familias nuevas.
2. Un análisis de por qué bajaron las consultas en los últimos tres meses.
3. Encontrar inscripciones cargadas dos veces.

:::Ver la respuesta
**1. Nombre del alumno, curso y nombre del adulto.** Es lo que el mail usa. El documento, la dirección y la salud no aparecen en un mail de bienvenida: no van.

**2. Fecha, canal y curso, sin nombres.** El análisis es sobre cantidades, no sobre personas.

**3. Esta probablemente no va a la IA.** Encontrar duplicados es una comparación exacta: una fórmula de la planilla lo hace mejor, sin mandar nada a ningún lado. No todo lo que se puede hacer con IA conviene hacerlo con IA.
:::

## Qué hacer esta semana

Tomá la última planilla con datos de personas que le pasaste a una IA. Contá cuántas columnas tenía y cuántas usó de verdad la tarea. Si la diferencia es grande, armá una copia recortada para la próxima vez.
$md$,
  9, 'curado'
from lessons l where l.slug = 'fr-lo-que-no-mandas'
on conflict do nothing;

-- ------------------------------------------------------------
-- fr-cuanto-cuesta · es
-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'es', null,
  'Lo que cuesta de verdad un resultado',
  'La IA tarda diez segundos. El resultado útil tarda mucho más, y casi nadie lo mide.',
$md$
Cuando alguien muestra lo que ahorra con IA, compara lo que tarda el modelo con lo que tardaba una persona: diez segundos contra seis minutos. La comparación está mal planteada.

La idea de esta lección: **lo que cuesta una tarea con IA no es el pedido. Es el tiempo humano total por cada resultado que se usa**: armar el pedido, revisar, corregir, y rehacer a mano los que se descartan. Ese es el número que hay que medir, y es el único que dice si conviene.

## El caso, con números

Borradores de respuesta a consultas. A mano, cada respuesta lleva **6 minutos**. El modelo escribe un borrador en diez segundos. Ahora, el tiempo humano por cada **10 respuestas**:

- Pegar cada consulta y pedir el borrador: 1 minuto cada una, **10 minutos**.
- Revisar cada borrador: 3 minutos cada uno, **30 minutos**.
- De cada 10, **2 se descartan** porque arrancaron mal y se escriben a mano: 2 por 6, **12 minutos**.

Total: **52 minutos por 10 respuestas, 5,2 minutos por respuesta útil.** Contra 6 a mano, el ahorro real es de menos de un minuto, un 13%. No es "diez segundos contra seis minutos".

Ahora, qué lo mueve de verdad:

- **Descartar menos.** Con mejores ejemplos en el pedido, de 2 descartes cada 10 se baja a uno cada 20, medio cada 10: 10 + 30 + 3 = 43 minutos, **4,3 por respuesta.**
- **Revisar más rápido.** Con tres preguntas de sí o no en vez de leer de corrido, la revisión baja a 2 minutos: 10 + 20 + 3 = 33 minutos, **3,3 por respuesta.** Ahora sí, un 45% menos.

Fijate lo que no aparece: un modelo más rápido. Pasar de diez segundos a tres no cambia nada, porque el tiempo no está ahí.

## Dónde no aplica

**El armado también cuesta.** Preparar los ejemplos, las preguntas de revisión y la planilla de casos lleva horas. Si la tarea son diez respuestas por año, no se recupera nunca. La cuenta vale para lo que se repite.

**El tiempo no es lo único.** A veces el resultado con IA sale mejor que a mano (más claro, más completo), y eso vale aunque ahorre poco. O sale peor, y entonces aunque ahorre no conviene. La cuenta de minutos va al lado de la de calidad, no en lugar de ella.

**El precio del modelo casi nunca manda.** En tareas de oficina, el costo en dinero de los pedidos es chico al lado de las horas de una persona. Cuando importa es con volumen muy alto, y ahí también conviene medirlo por resultado, no por pedido.

## Probá que lo entendiste

Tenés el sistema del caso, en 5,2 minutos por respuesta. ¿Qué cambio te conviene probar primero?

1. Cambiar a un modelo que responde en tres segundos en vez de diez.
2. Agregar al pedido tres ejemplos de respuestas buenas, para que se descarten menos.
3. Reemplazar la lectura de corrido por tres preguntas de sí o no al revisar.

:::Ver la respuesta
**La 2 y la 3, y no importa mucho el orden.** Las dos atacan donde está el tiempo: los descartes y la revisión. Juntas llevan de 5,2 a 3,3 minutos.

**La 1 no cambia nada.** Siete segundos menos por borrador, sobre 5,2 minutos, es ruido. Es lo que más se ofrece y lo que menos mueve.
:::

## Qué hacer esta semana

Elegí una tarea que hagas con IA y cronometrá **diez resultados completos**, desde que arrancás hasta que el resultado está listo para usar. Contá cuántos tuviste que rehacer a mano. Dividí: ese es tu costo por resultado, y el número contra el que vale la pena mejorar.
$md$,
  9, 'curado'
from lessons l where l.slug = 'fr-cuanto-cuesta'
on conflict do nothing;

-- ------------------------------------------------------------
-- fr-revisar-sin-leer · es
-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'es', null,
  'Revisar lo que no sabés leer',
  'Si construís con IA sin saber programar, no podés revisar el código. Podés revisar lo que hace, y eso alcanza si lo hacés con método.',
$md$
Cada vez más gente construye herramientas propias con IA sin saber programar: una app interna, un tablero, una automatización. Funciona. El problema aparece con el segundo cambio, y el décimo: algo que andaba deja de andar, y no hay forma de saber por qué mirando el código, porque no lo sabés leer.

La idea de esta lección: **si no podés revisar el código, revisá el comportamiento, con método.** Tres prácticas lo hacen posible:

- **Cambios chicos.** Uno por vez, con un pedido que diga qué cambiar y qué no tocar.
- **Una lista fija de comprobaciones.** Las cinco o seis cosas que tu herramienta tiene que hacer siempre, que se prueban después de cada cambio.
- **Que te diga qué tocó.** Al final de cada cambio, pedile qué partes modificó y qué podría haberse roto.

## El caso, con números

Una app interna para seguir inscripciones, hecha con IA por alguien que no programa.

**Un mes de cambios grandes:** se piden **10 cambios** del tipo "rehacé la pantalla de inscripciones y agregá filtros". **4 rompen algo** que andaba, el 40%. Se descubren días después, cuando alguien del equipo no puede exportar o ve datos que no tendría que ver.

**El mes siguiente, con método:** **20 cambios chicos**, cada uno seguido de una lista de seis comprobaciones que lleva 3 minutos: entrar, cargar una inscripción, buscarla, editarla, exportar, y entrar con un usuario que no es administrador. **1 cambio rompe algo**, el 5%, y se ve en el momento, porque falla la comprobación.

Lo que costó: 20 cambios por 3 minutos, **una hora en todo el mes.** Contra cuatro roturas descubiertas tarde.

## Dónde no aplica

**Lo que no se ve no se revisa así.** Un problema de seguridad (un dato que se puede leer sin permiso, una clave en un lugar público) no cambia el comportamiento: la app anda igual. Para eso, pedí una revisión explícita de permisos, o que la mire alguien que sepa.

**Antes de tocar datos, copia.** Si el cambio modifica cómo se guardan los datos, una copia antes. Las comprobaciones te dicen que algo se rompió; la copia es lo que te deja volver atrás.

**En algo chico y personal, no hace falta tanto.** Si la herramienta la usás sólo vos y no guarda nada importante, la lista puede ser de dos cosas. El método crece con la cantidad de gente que depende de lo que armaste.

## Probá que lo entendiste

¿Cuál de estos tres pedidos es el más seguro para algo que ya usa tu equipo?

1. "Mejorá la app."
2. "Agregá un filtro por curso en la lista de inscripciones. No toques nada más. Al final, decime qué partes cambiaste y qué podría haberse roto."
3. "Rehacé la app con un diseño más moderno y agregá exportar a Excel."

:::Ver la respuesta
**La 2.** Un cambio, un límite explícito y un informe de qué tocó. Después corrés tu lista y sabés en tres minutos si algo se rompió.

**La 1** no dice qué cambiar: la IA va a decidir sola, y puede tocar cualquier cosa.

**La 3** son dos cambios grandes juntos. Si algo se rompe, no vas a saber cuál de los dos fue.
:::

## Qué hacer esta semana

Escribí la lista de comprobaciones de la herramienta tuya que más se usa: **las cinco o seis cosas que tiene que hacer siempre**. Incluí una con un usuario que no sea el tuyo. La próxima vez que pidas un cambio, corré la lista antes de darlo por terminado.
$md$,
  9, 'curado'
from lessons l where l.slug = 'fr-revisar-sin-leer'
on conflict do nothing;

-- ============================================================
-- English (British)
-- ============================================================

-- ------------------------------------------------------------
-- fr-casos-que-crecen · en
-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'en', null,
  'Every mistake you find is a new case',
  'A test isn''t written once. It grows with every real mistake, and that''s what stops the same mistake coming back.',
$md$
When you build your first test set, the temptation is to think of it as something done once. But the value isn't in the twenty cases from day one: it's in what you add afterwards.

The idea of this lesson: **every real mistake that turns up is added to the test, with the right answer, before you fix it.** Case first, fix second. That way you know you fixed it, that you didn't break something else, and that if the same mistake tries to come back, the test catches it.

## The case, with numbers

Two teams have the same system for sorting enquiries. Both start with a test of **20 cases** and get 17 right. Over three months, **12 real mistakes** turn up and get reported.

**Team A** fixes each mistake by editing the instruction, tries it on that enquiry and moves on. The test still has 20 cases. In the fourth month they check: of those 12 mistakes, **5 have come back**. Each new fix undid an earlier one, and nobody noticed until another complaint arrived.

**Team B** does the same, but before touching anything adds each mistake to the test, with what should have come out. The test grows from 20 to **32 cases**, and every change is run against all 32. Twice, a new fix made an old case fail: **the test showed it straight away**, before it reached a family. Of the 12 mistakes, none came back unnoticed.

The difference in work: a few minutes per mistake to write the case. The difference in result: five repeated mistakes against none.

## Why the case comes first

If you write the case before fixing, you have proof the fix works: the case fails before and passes after. If the other 31 still pass too, you broke nothing. If you write it afterwards, you no longer know whether it passes because you fixed it or because you wrote it to pass.

## Where it doesn't apply

**The same mistake five times isn't five cases.** If the bursary-versus-visit confusion appears in five similar enquiries, one or two cases are enough. Adding duplicates makes the test slower without making it better.

**Data mistakes aren't instruction cases.** If the system quoted last year's fees because the document was out of date, the fix is the document, not the instruction. That case, if you add it, will fail every time the data goes stale, and mislead you about where the problem is.

**A test that only grows gets slow.** With two hundred cases and an automatic marker, running it costs something. Cases that have passed every time for months can move to a long test run once a month; the short one stays for every change.

## Check you've got it

Three mistakes reported this week. Which do you add to the test before fixing?

1. A bursary enquiry was sorted as a visit.
2. A reply gave last year's fees, because the loaded document wasn't up to date.
3. Another bursary enquiry was sorted as a visit, worded almost exactly like the one in point 1.

:::Show the answer
**Number 1, yes.** It's an instruction mistake: add it with the right answer and only then touch the instruction.

**Number 2, not as an instruction case.** The problem is the data. It's fixed by updating the document; if you add a case, it'll fail every time the data goes stale.

**Number 3, probably not.** It's the same mistake as 1, in the same shape. If 1 is already in the test, that's enough. If it were worded very differently (in another language, with the request hidden at the end), then it would be worth a case of its own.
:::

## What to do this week

Next time someone tells you about a mistake in something of yours, before touching anything, add it to your case sheet with what should have come out. Then fix it, and run the whole sheet.
$md$,
  9, 'curado'
from lessons l where l.slug = 'fr-casos-que-crecen'
on conflict do nothing;

-- ------------------------------------------------------------
-- fr-lo-que-no-mandas · en
-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'en', null,
  'Send it only what it needs',
  'When you build something that works with people''s data, the question isn''t what the AI can do with it. It''s what data it actually needs.',
$md$
When a system of yours works with people's data (families, pupils, staff), the easiest thing is to give it the whole spreadsheet. That way nothing's missing.

This lesson's idea is the opposite: **send only the columns that task needs, and if it can work without names, without names.** What you don't send can't leak, be stored somewhere you don't know about, or be used for something you didn't ask for. It's called minimisation, and it's the cheapest data protection measure there is.

## The case, with numbers

A school has an admissions spreadsheet with **38 columns**: the pupil's name, ID number, date of birth, address, phone numbers, the adults' emails, health information, whether they have a bursary, year group, the channel they came through, date of enquiry, and more. It has **400 rows**.

The task: a monthly summary of how many admissions there were by year group and which channel they came through.

That needs **3 columns**: year group, channel and date.

- Sending the whole spreadsheet: 38 columns by 400 rows, **15,200 data points**, including the ID numbers and health information of four hundred children.
- Sending what's needed: 3 by 400, **1,200 data points**, and none of them identifies anyone.

The summary comes out the same. The difference is that in the second case, if something goes wrong with that tool, there's nothing to leak.

## Three ways to minimise

**Remove columns first.** A copy of the spreadsheet with only what the task uses. It's the simplest and protects the most.

**Swap names for codes.** If the task needs to tell people apart but not know who they are, replace the name with a code (A-017) and keep the table linking them yourself. The AI works with codes; you know who each one is.

**Count first.** If the task is adding up or comparing, let the spreadsheet do the sums and have the AI only comment on the results. It gets ten numbers, not four hundred rows.

## Where it doesn't apply

**Some tasks need the name.** A personalised welcome email needs the pupil's and the adult's names. Then those two go, and nothing else: not the ID number, not health, not the address.

**A code isn't always enough.** In a class of twenty, year group plus date of birth identifies a person even without the name. If you combine a few very specific columns, the code doesn't protect anyone.

**Minimising doesn't replace knowing what the tool does.** If it's the free version and you don't know what it does with what it receives, treat it as public even if you send it little.

## Check you've got it

Which columns do you send in each case?

1. A draft welcome email for each of the 30 new families.
2. An analysis of why enquiries dropped over the last three months.
3. Finding admissions entered twice.

:::Show the answer
**1. Pupil's name, year group and adult's name.** That's what the email uses. ID number, address and health don't appear in a welcome email: they don't go.

**2. Date, channel and year group, without names.** The analysis is about quantities, not people.

**3. This one probably doesn't go to the AI.** Finding duplicates is an exact comparison: a spreadsheet formula does it better, without sending anything anywhere. Not everything that can be done with AI is worth doing with AI.
:::

## What to do this week

Take the last spreadsheet with people's data you gave an AI. Count how many columns it had and how many the task actually used. If the gap is large, make a trimmed copy for next time.
$md$,
  9, 'curado'
from lessons l where l.slug = 'fr-lo-que-no-mandas'
on conflict do nothing;

-- ------------------------------------------------------------
-- fr-cuanto-cuesta · en
-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'en', null,
  'What a result really costs',
  'The AI takes ten seconds. The usable result takes much longer, and hardly anyone measures it.',
$md$
When someone shows what they save with AI, they compare how long the model takes with how long a person used to take: ten seconds against six minutes. The comparison is set up wrong.

The idea of this lesson: **what a task with AI costs isn't the request. It's the total human time per result that gets used**: setting up the request, checking, correcting, and redoing by hand the ones that get thrown away. That's the figure to measure, and it's the only one that tells you whether it's worth it.

## The case, with numbers

Draft replies to enquiries. By hand, each reply takes **6 minutes**. The model writes a draft in ten seconds. Now, the human time for every **10 replies**:

- Pasting in each enquiry and asking for the draft: 1 minute each, **10 minutes**.
- Checking each draft: 3 minutes each, **30 minutes**.
- Of every 10, **2 are thrown away** because they started off wrong and are written by hand: 2 times 6, **12 minutes**.

Total: **52 minutes per 10 replies, 5.2 minutes per usable reply.** Against 6 by hand, the real saving is under a minute, 13%. It isn't "ten seconds against six minutes".

Now, what actually moves it:

- **Throwing fewer away.** With better examples in the request, 2 discards in 10 drops to one in 20, half in 10: 10 + 30 + 3 = 43 minutes, **4.3 per reply.**
- **Checking faster.** With three yes-or-no questions instead of reading straight through, checking drops to 2 minutes: 10 + 20 + 3 = 33 minutes, **3.3 per reply.** Now it's 45% less.

Notice what doesn't appear: a faster model. Going from ten seconds to three changes nothing, because that's not where the time is.

## Where it doesn't apply

**Setting it up costs too.** Preparing the examples, the checking questions and the case sheet takes hours. If the task is ten replies a year, you never get it back. The calculation is for what repeats.

**Time isn't everything.** Sometimes the AI result comes out better than by hand (clearer, more complete), and that's worth something even if it saves little. Or it comes out worse, and then it isn't worth it even if it saves time. The minutes sit next to quality, not in place of it.

**The model's price hardly ever decides it.** In office tasks, the money cost of the requests is small next to a person's hours. Where it matters is at very high volume, and there too it's worth measuring per result, not per request.

## Check you've got it

You have the system from the case, at 5.2 minutes per reply. Which change should you try first?

1. Switching to a model that answers in three seconds instead of ten.
2. Adding three examples of good replies to the request, so fewer are thrown away.
3. Replacing reading straight through with three yes-or-no questions when checking.

:::Show the answer
**2 and 3, and the order hardly matters.** Both go after where the time is: discards and checking. Together they take it from 5.2 to 3.3 minutes.

**1 changes nothing.** Seven seconds less per draft, against 5.2 minutes, is noise. It's what's offered most and moves least.
:::

## What to do this week

Pick a task you do with AI and time **ten complete results**, from when you start until the result is ready to use. Count how many you had to redo by hand. Divide: that's your cost per result, and the figure worth improving against.
$md$,
  9, 'curado'
from lessons l where l.slug = 'fr-cuanto-cuesta'
on conflict do nothing;

-- ------------------------------------------------------------
-- fr-revisar-sin-leer · en
-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'en', null,
  'Checking what you can''t read',
  'If you build with AI without knowing how to code, you can''t check the code. You can check what it does, and that''s enough if you do it methodically.',
$md$
More and more people build their own tools with AI without knowing how to code: an internal app, a dashboard, an automation. It works. The problem comes with the second change, and the tenth: something that worked stops working, and there's no way to tell why by looking at the code, because you can't read it.

The idea of this lesson: **if you can't check the code, check the behaviour, methodically.** Three practices make it possible:

- **Small changes.** One at a time, with a request that says what to change and what not to touch.
- **A fixed list of checks.** The five or six things your tool must always do, tried after every change.
- **Have it tell you what it touched.** At the end of each change, ask which parts it modified and what might have broken.

## The case, with numbers

An internal app for tracking admissions, built with AI by someone who doesn't code.

**A month of big changes:** **10 changes** are requested along the lines of "redo the admissions screen and add filters". **4 break something** that worked, 40%. They're discovered days later, when someone on the team can't export or sees data they shouldn't.

**The following month, methodically:** **20 small changes**, each followed by a list of six checks that takes 3 minutes: log in, enter an admission, search for it, edit it, export, and log in as a user who isn't an administrator. **1 change breaks something**, 5%, and it's seen straight away, because the check fails.

What it cost: 20 changes at 3 minutes, **an hour in the whole month.** Against four breakages discovered late.

## Where it doesn't apply

**What can't be seen isn't checked this way.** A security problem (data readable without permission, a key somewhere public) doesn't change the behaviour: the app works the same. For that, ask explicitly for a permissions review, or have someone who knows look at it.

**Before touching data, make a copy.** If the change alters how data is stored, copy it first. The checks tell you something broke; the copy is what lets you go back.

**For something small and personal, it needn't be this much.** If only you use the tool and it stores nothing important, the list can be two things. The method grows with the number of people who depend on what you built.

## Check you've got it

Which of these three requests is safest for something your team already uses?

1. "Improve the app."
2. "Add a filter by year group to the admissions list. Don't touch anything else. At the end, tell me which parts you changed and what might have broken."
3. "Redo the app with a more modern design and add export to Excel."

:::Show the answer
**Number 2.** One change, an explicit limit and a report of what it touched. Then you run your list and know in three minutes whether anything broke.

**Number 1** doesn't say what to change: the AI will decide for itself, and may touch anything.

**Number 3** is two big changes together. If something breaks, you won't know which of the two caused it.
:::

## What to do this week

Write the list of checks for your most-used tool: **the five or six things it must always do**. Include one with a user who isn't you. Next time you ask for a change, run the list before calling it done.
$md$,
  9, 'curado'
from lessons l where l.slug = 'fr-revisar-sin-leer'
on conflict do nothing;
