-- ============================================================
-- 067 · Frontera: cuatro lecciones para niveles 2 a 4
-- ============================================================
-- Precarga pedida por Diego el 24/11 ("la app tiene que tener una
-- precarga sustancial"). Hasta acá el nivel 2 tenía sólo las cuatro
-- de 2-4 de la 023. Estas cuatro son para quien ya usa la IA en su
-- trabajo real y empieza a integrarla:
--
--   automatizacion: fr-planillas        · que calcule la planilla
--   diseno:         fr-guia-de-estilo    · una voz que la IA pueda usar
--   negocios:       fr-investigar        · investigar sin creerle todo
--   modelos:        fr-segunda-opinion   · pedirle que te contradiga
--
-- created_at del 17/11: van después de las de la 058 a 066 dentro de
-- cada tema. Cada una se sostiene sola. Español e inglés británico.
-- ============================================================

insert into lessons (slug, topic_id, kind, level_floor, level_ceiling, published, created_at)
select v.slug, t.id, 'frontera', 2, 4, true, v.creada::timestamptz
from (values
  ('fr-planillas',       'automatizacion', '2026-11-17 12:00:00+00'),
  ('fr-guia-de-estilo',  'diseno',         '2026-11-17 11:00:00+00'),
  ('fr-investigar',      'negocios',       '2026-11-17 10:00:00+00'),
  ('fr-segunda-opinion', 'modelos',        '2026-11-17 09:00:00+00')
) as v(slug, topico, creada)
join topics t on t.slug = v.topico
on conflict (slug) do nothing;

-- ------------------------------------------------------------
-- fr-planillas · es
-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'es', null,
  'Que calcule la planilla, que explique la IA',
  'Una IA que escribe muy bien puede sumar muy mal, con la misma seguridad. El reparto de trabajo que lo evita es simple.',
$md$
Le pasás una planilla a la IA y le pedís el total de inscripciones por curso. Te devuelve una tabla prolija. Uno de los totales está mal, y no hay nada en la respuesta que lo delate.

Pasa porque un modelo de lenguaje no suma: **predice el texto que suele venir después**, y un número que se parece al correcto es un texto muy probable. Algunas herramientas tienen un modo que ejecuta cálculos de verdad (escribe un pequeño programa y lo corre), y ahí la cuenta es confiable. Pero si no sabés cuál de los dos modos usó, no sabés si podés creerle.

La idea de esta lección: **las cuentas las hace la planilla; la IA lee los resultados y los explica.** Cada uno hace lo que hace bien.

## El caso, con números

Un colegio tiene una planilla con **312 consultas** del trimestre y quiere saber cuántas hubo por mes y por canal: web, redes, referidos y presencial.

**Pedido directo a la IA, pegando las 312 filas:** devuelve una tabla de 3 meses por 4 canales. Se compara con la planilla: **2 de los 12 números están mal**, uno por 6 y otro por 11. La suma total da 309 en vez de 312.

**Reparto de trabajo:** en la planilla, una tabla dinámica que cuenta por mes y canal, en cinco minutos. A la IA se le pasan **sólo esos 12 números** y se le pide que diga qué cambió, qué es raro y qué conviene mirar. Los 12 números son exactos porque los contó la planilla, y la lectura de la IA es buena porque esa es su parte.

Lo que cuesta: cinco minutos de tabla dinámica. Lo que evita: dos números equivocados en un informe que se lee en la reunión de dirección.

## Cómo pedirle que te ayude con la planilla

Hay algo que la IA hace muy bien con planillas, y es justamente lo que mucha gente no sabe hacer: **escribir la fórmula.** "Tengo las fechas en la columna B y el canal en la D. Quiero contar cuántas consultas de redes hubo en marzo. Escribime la fórmula." Esa fórmula la pegás en la planilla, y desde ahí la cuenta es exacta y se actualiza sola.

## Dónde no aplica

**Si la herramienta ejecuta código y lo muestra, la cuenta es confiable.** Algunas herramientas te dejan ver el programa que corrieron para calcular. Ahí la IA no está adivinando el número: lo calculó. Aun así, una comparación rápida con un total conocido no está de más.

**Para una estimación de cabeza, no hace falta tanto.** "Más o menos cuánto es el 15% de 2.400" está bien preguntarlo. El problema es cuando el número va a un informe o a una decisión.

**Para pocos datos que vos podés chequear de un vistazo**, el riesgo es bajo. El problema crece con la cantidad de filas, porque ahí nadie mira.

## Probá que lo entendiste

¿Cómo repartís el trabajo en cada caso?

1. Querés el porcentaje de inscriptos sobre consultas, por canal, para un informe.
2. Querés entender por qué en marzo bajaron las consultas de redes.
3. No sabés cómo hacer en la planilla una cuenta que separe por mes.

:::Ver la respuesta
**1. La planilla calcula, la IA no.** Es un número que va a un informe: tabla dinámica o fórmula, y si querés, que la IA redacte el párrafo con esos números ya calculados.

**2. La IA, con los números ya contados.** Pasale la tabla de la planilla y lo que sabés del contexto (hubo un feriado, cambió la campaña). Explicar es su parte.

**3. La IA te escribe la fórmula.** Describile en qué columnas está cada cosa y qué querés contar. La fórmula la pegás vos, y la cuenta la hace la planilla.
:::

## Qué hacer esta semana

Buscá el último número que una IA te calculó y que usaste en algo (un informe, un mail, una presentación). Rehacé esa cuenta en la planilla. Si coincide, bien. Si no coincide, ya sabés por qué conviene repartir el trabajo.
$md$,
  9, 'curado'
from lessons l where l.slug = 'fr-planillas'
on conflict do nothing;

-- ------------------------------------------------------------
-- fr-guia-de-estilo · es
-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'es', null,
  'Una guía de estilo que la IA pueda usar',
  'Cuando cinco personas escriben con IA en nombre de la misma institución, salen cinco voces. Una guía corta, con ejemplos, las vuelve una.',
$md$
Cuando una sola persona usa la IA para escribir, sus instrucciones personales alcanzan. Cuando un equipo de cinco escribe con IA en nombre de la misma institución (mails a familias, posteos, comunicados), salen cinco voces distintas, y ninguna es la de la institución.

La idea de esta lección: **una guía de estilo corta, escrita para que la use la IA, con ejemplos de lo que sí y lo que no.** No el manual de marca de cuarenta páginas: una página que entre en las instrucciones de un proyecto compartido.

## Qué tiene una guía que la IA puede usar

- **Tres o cuatro rasgos de la voz, cada uno con un ejemplo.** No "cálido y profesional", que no le dice nada a nadie, sino "tuteamos a las familias; ejemplo: *Te esperamos el sábado*".
- **Palabras que sí y palabras que no.** "Decimos *familias*, no *clientes*. Decimos *propuesta educativa*, no *producto*."
- **Dos textos buenos completos**, de los que ya salieron y funcionaron.
- **Lo que nunca se hace.** "Nunca prometemos vacantes. Nunca mencionamos a otros colegios."

## El caso, con números

Un equipo de comunicación de cinco personas escribe con IA. Un mes, alguien junta **40 textos** que salieron y los revisa contra una pregunta: **¿suena a nosotros?**

- **Sin guía:** 17 de 40 suenan a la institución, el 43%. El resto tiene de todo: unos tratan de usted y otros de vos, uno habla de "clientes", dos prometen cosas que no se pueden prometer.
- **Con una guía de una página** cargada en un proyecto compartido: el mes siguiente, **33 de 40**, el 83%. Los 7 que no, casi todos por la misma regla, que estaba escrita de forma ambigua. Se reescribe esa línea.

La guía llevó una tarde. Lo que cambió no es la herramienta ni el modelo: es que las cinco personas le dan a la IA la misma referencia.

## Dónde no aplica

**Si escribe una sola persona**, sus instrucciones personales ya hacen este trabajo.

**Una guía sin ejemplos no funciona.** "Usá un tono cercano" se interpreta de cinco maneras. El ejemplo es lo que fija el sentido. Si tenés que elegir entre escribir reglas y pegar ejemplos, pegá ejemplos.

**No reemplaza la revisión de lo delicado.** Un comunicado sobre un problema serio no sale de una guía de estilo: sale de una persona que decide qué se dice. La guía es para lo frecuente.

## Probá que lo entendiste

¿Cuál de estas tres líneas sirve en una guía para la IA?

1. "Nuestro tono es cálido, cercano y profesional."
2. "Tuteamos a las familias. Bien: *Te esperamos el sábado a las 10.* Mal: *Lo esperamos el sábado a las 10 hs.*"
3. "Escribí como lo haría un buen comunicador."

:::Ver la respuesta
**La 2.** Tiene una regla concreta y un ejemplo de cada lado. La IA puede aplicarla y vos podés verificar si la aplicó.

**La 1** son tres adjetivos que cada uno lee distinto, la IA incluida. Si querés conservarla, ponele un ejemplo a cada adjetivo.

**La 3** no le da nada para trabajar. Es pedirle que adivine.
:::

## Qué hacer esta semana

Juntá cinco textos que salieron de tu equipo este mes y marcá cuáles suenan a la institución. De los que sí, elegí dos: son los ejemplos de tu guía. De los que no, anotá qué los delató: son las reglas.
$md$,
  9, 'curado'
from lessons l where l.slug = 'fr-guia-de-estilo'
on conflict do nothing;

-- ------------------------------------------------------------
-- fr-investigar · es
-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'es', null,
  'Investigar con IA sin creerle todo',
  'Las herramientas que buscan en internet y arman un informe ahorran horas. También mezclan lo cierto con lo viejo y lo inventado, con el mismo tono.',
$md$
Varias herramientas de IA hoy pueden buscar en internet durante unos minutos y devolverte un informe con fuentes: qué ofrecen otros colegios, qué dice una normativa, cómo vienen las tendencias de inscripción. Ahorran horas.

El problema es que el informe mezcla tres cosas con el mismo tono: **lo que dice la fuente, lo que la fuente dice pero es viejo, y lo que la herramienta completó sin fuente.**

La idea de esta lección: **un informe de IA es un borrador de investigación, no una investigación.** Antes de usarlo, se verifica una muestra, y la muestra dice cuánto confiar en el resto.

## El caso, con números

Un colegio le pide a una herramienta de investigación qué ofrecen en idiomas los ocho colegios de la zona. Vuelve un informe de dos páginas con **24 afirmaciones** concretas (cuántas horas de inglés, si hay segundo idioma, qué certificaciones) y fuentes al pie.

Alguien toma **8 de las 24** al azar y las chequea abriendo la fuente:

- **5** están bien: la fuente dice eso.
- **2** están desactualizadas: la fuente es una página de hace tres años y el colegio cambió su programa.
- **1** no está en la fuente citada: la herramienta la completó.

Tres de ocho con problemas, más o menos un tercio. Si la muestra es representativa, de las 24 afirmaciones unas **9 no se pueden usar tal cual.** No se sabe cuáles sin chequear: el informe no sirve como dato, sí como punto de partida.

Para una comparación que va a una reunión de dirección, se chequean todas las que van a usarse. Lleva una hora, contra las seis que habría llevado hacer la investigación desde cero.

## Tres cosas que se miran siempre

- **¿La fuente dice eso?** Abrirla y buscar la afirmación. Es lo que atrapa lo inventado.
- **¿De cuándo es?** Una página de hace tres años sobre un programa escolar ya puede no valer.
- **¿Es la fuente de verdad?** El sitio del colegio vale más que un directorio que lo resume.

## Dónde no aplica

**Para orientarte, no hace falta chequear todo.** Si querés saber de qué se habla en un tema antes de leer en serio, el informe sirve tal cual. El chequeo es para lo que se va a usar como dato.

**Los números siempre se chequean.** Una cantidad o un porcentaje equivocado viaja más lejos que una frase equivocada, porque nadie lo discute.

**Si la herramienta no muestra fuentes**, no es una herramienta de investigación: es una opinión bien escrita. Usala para pensar, no para afirmar.

## Probá que lo entendiste

Un informe sobre los colegios de la zona dice tres cosas. ¿Cuál chequeás primero?

1. "El colegio A tiene 5 horas semanales de inglés en primaria", con link al sitio del colegio.
2. "La tendencia en la zona es a ofrecer más horas de idiomas", sin fuente.
3. "El colegio B ofrece certificación internacional desde 2019", con link a un directorio de colegios.

:::Ver la respuesta
**La 3 primero.** Es un dato concreto, la fuente es un intermediario (no el sitio del colegio) y tiene una fecha que puede haber cambiado. Es la que más chances tiene de estar mal.

**La 1 después.** La fuente es la buena, pero hay que verificar que diga eso y que esté vigente.

**La 2** no se chequea porque no se puede: no tiene fuente. Si te interesa, es una hipótesis para investigar, no un dato para presentar.
:::

## Qué hacer esta semana

La próxima vez que una IA te arme un informe con fuentes, elegí cinco afirmaciones al azar y abrí cada fuente. Contá cuántas están bien. Ese número te dice cuánto confiar en el resto de ese informe, y en los próximos de esa herramienta.
$md$,
  9, 'curado'
from lessons l where l.slug = 'fr-investigar'
on conflict do nothing;

-- ------------------------------------------------------------
-- fr-segunda-opinion · es
-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'es', null,
  'Pedile que te contradiga',
  'La IA tiende a darte la razón. Si le pedís que busque los agujeros de tu idea, los encuentra, y suelen ser los que importan.',
$md$
Le contás tu idea a la IA y te dice que es muy buena, con tres razones. Le contás la idea contraria y también le parece muy buena, con otras tres. No miente: está entrenada para ser útil y agradable, y eso empuja a darte la razón.

La idea de esta lección: **la IA es mucho más útil como crítica que como público.** Si le pedís explícitamente que busque lo que está mal en tu propuesta, lo hace bien. Y lo que encuentra suele ser lo que te iba a señalar alguien en la reunión, pero antes.

## El pedido

Tres formas, de menos a más exigente:

- **"Decime los tres puntos más débiles de esta propuesta."** El más simple. Obliga a buscar problemas en vez de virtudes.
- **"Sos el director financiero y tenés que decidir si aprobás esto. ¿Qué preguntas me hacés?"** Le da un punto de vista concreto, con intereses propios.
- **"Escribí el mejor argumento posible en contra."** No para que cambies de idea, sino para saber qué vas a tener que contestar.

## El caso, con números

Alguien prepara una propuesta para cambiar el formato de la jornada de puertas abiertas: de una visita guiada a clases abiertas. Antes de presentarla, le pide a la IA "los cinco puntos más débiles".

Vuelven **5 objeciones**. Revisándolas:

- **2** ya estaban contestadas en la propuesta. No sirven.
- **1** no aplica: supone que el colegio tiene un problema de espacio que no tiene.
- **2** son buenas y no estaban contempladas: qué pasa con las familias que vienen de lejos y quieren ver todo en una visita, y quién cubre las clases de los docentes que participan.

Dos objeciones útiles de cinco. En la reunión de dirección, la primera pregunta que hacen es exactamente la de los docentes. La respuesta ya estaba preparada.

## Dónde no aplica

**No toda objeción vale.** La IA no conoce tu contexto: va a proponer problemas genéricos o que no te pasan. Filtrar es parte del trabajo, como en el caso: dos de cinco es un buen rendimiento.

**No es una decisión.** Que la IA encuentre problemas no quiere decir que la idea sea mala. Todas las ideas tienen problemas; la pregunta es si tienen respuesta.

**Para cosas chicas, es demasiado.** Pedir la crítica de un mail de dos líneas es perder tiempo. Vale para lo que vas a defender delante de otros o lo que cuesta revertir.

## Probá que lo entendiste

¿Qué pedido te da la crítica más útil antes de presentar un presupuesto?

1. "¿Qué te parece este presupuesto?"
2. "Sos quien aprueba el presupuesto del colegio y te preocupa gastar de más. ¿Qué tres preguntas me hacés?"
3. "Mejorá este presupuesto."

:::Ver la respuesta
**La 2.** Le da un rol con un interés concreto, y la obliga a buscar problemas desde ese lugar. Las preguntas que salen son las que te van a hacer.

**La 1** invita al elogio. Lo más probable es que diga que está muy bien y sugiera algún detalle de forma.

**La 3** le pide que cambie el presupuesto, no que lo critique. Vas a recibir otra versión, sin saber qué problema resolvía cada cambio.
:::

## Qué hacer esta semana

Antes de mandar o presentar la próxima propuesta importante, pedile a la IA los tres puntos más débiles. Quedate con los que tengan sentido y contestalos en la propuesta. Contá cuántos de los tres eran nuevos para vos.
$md$,
  9, 'curado'
from lessons l where l.slug = 'fr-segunda-opinion'
on conflict do nothing;

-- ============================================================
-- English (British)
-- ============================================================

-- ------------------------------------------------------------
-- fr-planillas · en
-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'en', null,
  'Let the spreadsheet calculate, let the AI explain',
  'An AI that writes very well can add up very badly, just as confidently. The division of labour that prevents it is simple.',
$md$
You give the AI a spreadsheet and ask for total admissions by year group. It returns a tidy table. One of the totals is wrong, and nothing in the answer gives it away.

It happens because a language model doesn't add up: **it predicts the text that usually comes next**, and a number that looks like the right one is very likely text. Some tools have a mode that genuinely runs calculations (it writes a small program and runs it), and there the arithmetic is reliable. But if you don't know which of the two modes it used, you don't know whether to believe it.

The idea of this lesson: **the spreadsheet does the sums; the AI reads the results and explains them.** Each does what it does well.

## The case, with numbers

A school has a spreadsheet of **312 enquiries** for the term and wants to know how many there were by month and by channel: website, social media, referrals and walk-ins.

**Asking the AI directly, pasting in all 312 rows:** it returns a table of 3 months by 4 channels. Compared with the spreadsheet: **2 of the 12 figures are wrong**, one by 6 and another by 11. The grand total comes to 309 instead of 312.

**Dividing the work:** in the spreadsheet, a pivot table counting by month and channel, in five minutes. The AI is given **only those 12 figures** and asked what changed, what's odd and what's worth looking at. The 12 figures are exact because the spreadsheet counted them, and the AI's reading is good because that's its part.

What it costs: five minutes of pivot table. What it prevents: two wrong figures in a report read out at the senior leadership meeting.

## How to have it help with the spreadsheet

There's something the AI does very well with spreadsheets, and it's exactly what many people don't know how to do: **write the formula.** "I have dates in column B and the channel in column D. I want to count how many social media enquiries there were in March. Write me the formula." You paste that formula into the spreadsheet, and from then on the count is exact and updates itself.

## Where it doesn't apply

**If the tool runs code and shows it, the arithmetic is reliable.** Some tools let you see the program they ran to calculate. There the AI isn't guessing the number: it computed it. Even so, a quick comparison with a known total doesn't hurt.

**For a rough mental estimate, it needn't be this careful.** "Roughly what's 15% of 2,400" is fine to ask. The problem is when the number goes into a report or a decision.

**For a few figures you can check at a glance**, the risk is low. The problem grows with the number of rows, because that's when nobody looks.

## Check you've got it

How do you divide the work in each case?

1. You want the percentage of enquiries that enrolled, by channel, for a report.
2. You want to understand why social media enquiries dropped in March.
3. You don't know how to do a calculation in the spreadsheet that splits by month.

:::Show the answer
**1. The spreadsheet calculates, not the AI.** It's a figure going into a report: pivot table or formula, and if you like, have the AI draft the paragraph using those already-calculated figures.

**2. The AI, with the figures already counted.** Give it the spreadsheet's table and what you know of the context (there was a bank holiday, the campaign changed). Explaining is its part.

**3. The AI writes you the formula.** Tell it which columns hold what and what you want to count. You paste the formula in, and the spreadsheet does the sum.
:::

## What to do this week

Find the last figure an AI calculated for you that you used in something (a report, an email, a presentation). Redo that calculation in the spreadsheet. If it matches, good. If it doesn't, you know why it's worth dividing the work.
$md$,
  9, 'curado'
from lessons l where l.slug = 'fr-planillas'
on conflict do nothing;

-- ------------------------------------------------------------
-- fr-guia-de-estilo · en
-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'en', null,
  'A style guide the AI can use',
  'When five people write with AI on behalf of the same institution, five voices come out. A short guide, with examples, makes them one.',
$md$
When one person uses AI to write, their personal instructions are enough. When a team of five writes with AI on behalf of the same institution (emails to families, posts, announcements), five different voices come out, and none of them is the institution's.

The idea of this lesson: **a short style guide, written for the AI to use, with examples of what to do and what not to.** Not the forty-page brand manual: one page that fits in the instructions of a shared project.

## What a guide the AI can use contains

- **Three or four traits of the voice, each with an example.** Not "warm and professional", which tells nobody anything, but "we address families directly and informally; example: *See you on Saturday*".
- **Words we use and words we don't.** "We say *families*, not *customers*. We say *educational offer*, not *product*."
- **Two complete good texts**, ones that have already gone out and worked.
- **What we never do.** "We never promise places. We never mention other schools."

## The case, with numbers

A communications team of five writes with AI. One month, someone gathers **40 texts** that went out and checks them against one question: **does it sound like us?**

- **Without a guide:** 17 of 40 sound like the institution, 43%. The rest have everything: some formal and some informal, one talks about "customers", two promise things that can't be promised.
- **With a one-page guide** loaded into a shared project: the following month, **33 of 40**, 83%. The 7 that don't, nearly all because of the same rule, which was written ambiguously. That line gets rewritten.

The guide took an afternoon. What changed isn't the tool or the model: it's that all five people give the AI the same reference.

## Where it doesn't apply

**If only one person writes**, their personal instructions already do this job.

**A guide without examples doesn't work.** "Use a friendly tone" gets read five ways. The example is what fixes the meaning. If you have to choose between writing rules and pasting examples, paste examples.

**It doesn't replace checking what's sensitive.** An announcement about a serious problem doesn't come out of a style guide: it comes out of a person deciding what to say. The guide is for the frequent stuff.

## Check you've got it

Which of these three lines works in a guide for the AI?

1. "Our tone is warm, approachable and professional."
2. "We address families informally. Good: *See you on Saturday at 10.* Bad: *We look forward to welcoming you on Saturday at 10:00.*"
3. "Write as a good communicator would."

:::Show the answer
**Number 2.** It has a concrete rule and an example on each side. The AI can apply it and you can check whether it did.

**Number 1** is three adjectives everyone reads differently, the AI included. If you want to keep it, give each adjective an example.

**Number 3** gives it nothing to work with. It's asking it to guess.
:::

## What to do this week

Gather five texts your team sent out this month and mark which sound like the institution. Of those that do, pick two: they're your guide's examples. Of those that don't, note what gave them away: those are the rules.
$md$,
  9, 'curado'
from lessons l where l.slug = 'fr-guia-de-estilo'
on conflict do nothing;

-- ------------------------------------------------------------
-- fr-investigar · en
-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'en', null,
  'Researching with AI without believing all of it',
  'Tools that search the web and put together a report save hours. They also mix the true with the stale and the invented, in the same tone.',
$md$
Several AI tools can now search the web for a few minutes and come back with a report with sources: what other schools offer, what a regulation says, how admissions trends are going. They save hours.

The problem is that the report mixes three things in the same tone: **what the source says, what the source says but is out of date, and what the tool filled in without a source.**

The idea of this lesson: **an AI report is a research draft, not research.** Before using it, you check a sample, and the sample tells you how far to trust the rest.

## The case, with numbers

A school asks a research tool what the eight local schools offer in languages. Back comes a two-page report with **24 specific claims** (how many hours of English, whether there's a second language, which certificates) and footnoted sources.

Someone takes **8 of the 24** at random and checks them by opening the source:

- **5** are fine: the source says that.
- **2** are out of date: the source is a page from three years ago and the school has changed its programme.
- **1** isn't in the cited source: the tool filled it in.

Three of eight with problems, roughly a third. If the sample is representative, about **9 of the 24 claims can't be used as they stand.** You can't tell which without checking: the report doesn't work as data, it works as a starting point.

For a comparison going to a senior leadership meeting, you check every claim you'll use. It takes an hour, against the six it would have taken to do the research from scratch.

## Three things you always check

- **Does the source say that?** Open it and find the claim. That catches what was invented.
- **How old is it?** A three-year-old page about a school programme may no longer hold.
- **Is it the real source?** The school's own website counts for more than a directory summarising it.

## Where it doesn't apply

**To get your bearings, you needn't check everything.** If you want to know what a topic is about before reading properly, the report works as it is. Checking is for what will be used as data.

**Numbers always get checked.** A wrong quantity or percentage travels further than a wrong sentence, because nobody argues with it.

**If the tool doesn't show sources**, it isn't a research tool: it's a well-written opinion. Use it to think, not to assert.

## Check you've got it

A report on local schools says three things. Which do you check first?

1. "School A has 5 hours of English a week in primary", linking to the school's website.
2. "The local trend is to offer more hours of languages", with no source.
3. "School B has offered international certification since 2019", linking to a schools directory.

:::Show the answer
**Number 3 first.** It's a concrete fact, the source is an intermediary (not the school's site), and it has a date that may have changed. It's the most likely to be wrong.

**Number 1 next.** The source is the right one, but you need to check it says that and is current.

**Number 2** doesn't get checked because it can't be: it has no source. If it interests you, it's a hypothesis to investigate, not a fact to present.
:::

## What to do this week

Next time an AI puts together a report with sources for you, pick five claims at random and open each source. Count how many are right. That number tells you how far to trust the rest of that report, and the next ones from that tool.
$md$,
  9, 'curado'
from lessons l where l.slug = 'fr-investigar'
on conflict do nothing;

-- ------------------------------------------------------------
-- fr-segunda-opinion · en
-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'en', null,
  'Ask it to disagree with you',
  'AI tends to agree with you. If you ask it to look for the holes in your idea, it finds them, and they''re usually the ones that matter.',
$md$
You tell the AI your idea and it says it's very good, with three reasons. You tell it the opposite idea and that's very good too, with three other reasons. It isn't lying: it's trained to be helpful and agreeable, and that pushes it towards agreeing with you.

The idea of this lesson: **AI is much more useful as a critic than as an audience.** If you explicitly ask it to look for what's wrong with your proposal, it does that well. And what it finds is usually what someone was going to point out in the meeting, but earlier.

## The request

Three ways, from least to most demanding:

- **"Tell me the three weakest points of this proposal."** The simplest. It forces it to look for problems instead of virtues.
- **"You're the finance director and have to decide whether to approve this. What questions do you ask me?"** It gives it a concrete point of view, with interests of its own.
- **"Write the best possible argument against."** Not so you change your mind, but so you know what you'll have to answer.

## The case, with numbers

Someone is preparing a proposal to change the open day format: from a guided tour to open lessons. Before presenting it, they ask the AI for "the five weakest points".

**5 objections** come back. Going through them:

- **2** were already answered in the proposal. No use.
- **1** doesn't apply: it assumes the school has a space problem it doesn't have.
- **2** are good and hadn't been considered: what about families coming from far away who want to see everything in one visit, and who covers the lessons of the teachers taking part.

Two useful objections out of five. At the senior leadership meeting, the first question asked is exactly the one about the teachers. The answer was already prepared.

## Where it doesn't apply

**Not every objection counts.** The AI doesn't know your context: it'll come up with generic problems or ones you don't have. Filtering is part of the work, as in the case: two out of five is a good return.

**It isn't a decision.** The AI finding problems doesn't mean the idea is bad. Every idea has problems; the question is whether they have answers.

**For small things, it's too much.** Asking for a critique of a two-line email wastes time. It's worth it for what you'll defend in front of others or what's costly to reverse.

## Check you've got it

Which request gets you the most useful critique before presenting a budget?

1. "What do you think of this budget?"
2. "You approve the school's budget and you're worried about overspending. What three questions do you ask me?"
3. "Improve this budget."

:::Show the answer
**Number 2.** It gives it a role with a concrete interest, and forces it to look for problems from that position. The questions that come out are the ones you'll be asked.

**Number 1** invites praise. Most likely it'll say it's very good and suggest some detail of presentation.

**Number 3** asks it to change the budget, not critique it. You'll get another version, without knowing what problem each change was solving.
:::

## What to do this week

Before sending or presenting your next important proposal, ask the AI for the three weakest points. Keep the ones that make sense and answer them in the proposal. Count how many of the three were new to you.
$md$,
  9, 'curado'
from lessons l where l.slug = 'fr-segunda-opinion'
on conflict do nothing;
