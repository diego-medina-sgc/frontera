-- ============================================================
-- 073 · Libro: Measure What Matters (John Doerr)
-- ============================================================
-- Precarga del 24/11. Los OKR: cómo se fija y se sigue lo que importa
-- en un trimestre. Completa a Grove (de quien Doerr aprendió el método
-- en Intel) y a Lencioni (el resultado común del equipo a la vista).
--
-- Verificado en Open Library el 24/11:
--   · obra OL19746884W, John Doerr, edición Portfolio/Penguin 2018;
--   · edición en castellano "Mide lo que importa" (Conecta / Penguin
--     Random House Grupo Editorial), obra OL26384600W, languages spa;
--   · tapa 9254540, la blanca en inglés con prólogo de Larry Page (mirada).
--
-- Los casos con números son hipotéticos y lo dicen. Ninguna cifra de
-- empresas reales. La forma de puntuar desde la línea de base es una
-- simplificación propia, no la regla del libro, y se dice así.
-- Cinco piezas por idioma: no_lei 1-3, hace_tiempo 1, fresco 1.
-- ============================================================

insert into books (slug, title, author, year, themes, title_es, cover_id, terms)
values (
  'measure-what-matters',
  'Measure What Matters',
  'John Doerr',
  2018,
  array['operaciones', 'liderazgo'],
  'Mide lo que importa',
  9254540,
  array[
    'objetivos','metas','okr','okrs','planificación','planificar','trimestre',
    'prioridades','foco','indicadores','métricas','kpi','seguimiento','resultados',
    'plan anual','alinear','goals','targets','objectives'
  ]
)
on conflict (slug) do nothing;

-- ------------------------------------------------------------
-- no_lei 1 · es
-- ------------------------------------------------------------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'es', 'no_lei', 1,
  'Un objetivo no es una lista de tareas',
$md$
John Doerr aprendió el método trabajando en Intel con Andy Grove, en los años setenta, y lo llevó después a Google y a muchas otras organizaciones. El libro es su manual. La idea cabe en una línea:

**Un OKR es un objetivo cualitativo (adónde querés llegar) y unos pocos resultados clave medibles que, si se cumplen, prueban que llegaste.**

Las dos partes hacen trabajos distintos:

- **El objetivo** es una frase, no un número. Dice qué importa y por qué alguien se levantaría a trabajar por eso. "Que las familias que visitan el colegio salgan queriendo inscribirse."
- **Los resultados clave** son números con fecha. No dicen qué vas a hacer: dicen qué tiene que haber cambiado. Al final del trimestre se miran y no hay discusión posible sobre si se cumplieron.

Doerr resume la estructura con una fórmula: *voy a lograr tal objetivo, medido por estos resultados.* Si falta el "medido por", no es un OKR: es una intención.

## El caso: nueve tareas hechas y nada cambió

Un equipo de admisiones (hipotético) arma su plan del trimestre como siempre, con una lista:

1. Rediseñar el folleto.
2. Hacer cuatro jornadas de puertas abiertas.
3. Actualizar la web.
4. Mandar el boletín mensual.
5. Y cinco cosas más del mismo estilo.

El trimestre anterior hubo **200 visitas** y **60 solicitudes**: un 30%. Este trimestre hacen las nueve tareas, todas, en fecha. Resultado: **210 visitas** y **61 solicitudes**. Son 61 sobre 210, un **29%**. La lista está tachada entera y la conversión bajó un punto.

Ahora el mismo trimestre escrito como OKR:

- **Objetivo:** que las familias que visitan salgan queriendo inscribirse.
- **RC 1:** la conversión de visita a solicitud pasa del 30% al 40% (con 200 visitas, de 60 a 80 solicitudes).
- **RC 2:** el primer contacto después de la visita pasa de 9 días a 2.
- **RC 3:** 8 de cada 10 familias califican la visita con 4 o 5 sobre 5.

Las tareas no desaparecen: se eligen después, según cuánto mueven esos tres números. Rediseñar el folleto puede quedar afuera; llamar a cada familia dentro de las 48 horas probablemente entra. La lista pasa a ser una consecuencia del OKR, no el plan.

## Dónde no aplica

**El trabajo de todos los días no necesita OKR.** Contestar consultas, cargar legajos, mantener la web: eso se sigue con indicadores de funcionamiento. El OKR es para lo que tiene que cambiar este trimestre, no para todo lo que hace el equipo.

**Si no se puede medir nada de lo que importa,** inventar un número es peor que no tenerlo. Un proyecto de tres semanas que recién empieza puede necesitar primero un hito ("tenemos el diagnóstico listo el 15") y recién después un resultado.

**Un equipo de una persona con una sola prioridad** no gana mucho escribiéndolo así. El método rinde cuando hay que elegir entre muchas cosas y coordinar con otros.

## Probá que lo entendiste

¿Cuál de estas tres es un objetivo, cuál un resultado clave y cuál una tarea?

1. "Hacer una encuesta a las familias que no se inscribieron."
2. "Que el colegio sea la primera opción de las familias del barrio."
3. "Las solicitudes de familias del barrio pasan de 25 a 40 en el trimestre."

:::Ver la respuesta
**1. Tarea.** Se puede hacer perfecta y no cambiar nada. Puede servir para mover un resultado clave, pero no lo es.

**2. Objetivo.** Cualitativo, dice adónde ir. Sin números todavía.

**3. Resultado clave.** Número, punto de partida, meta y plazo. Al final del trimestre se mira y no hay discusión.
:::

## Qué hacer esta semana

Agarrá el plan de tu equipo para este trimestre. Si es una lista de tareas, escribí arriba una sola frase: qué tiene que haber cambiado cuando todas estén hechas. Después, debajo, dos números que probarían que cambió. Fijate cuántas tareas de la lista mueven esos números.
$md$,
  9
from books b where b.slug = 'measure-what-matters'
on conflict do nothing;

-- ------------------------------------------------------------
-- no_lei 2 · es
-- ------------------------------------------------------------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'es', 'no_lei', 2,
  'Resultados que se puedan medir sin discutir',
$md$
Escribir el objetivo es fácil. Lo difícil, y donde fallan casi todos los primeros OKR, son los resultados clave. La regla de fondo:

**Un buen resultado clave dice qué número tiene que cambiar, desde dónde, hasta dónde y para cuándo. Si al final del trimestre hay que discutir si se cumplió, está mal escrito.**

De ahí salen tres pruebas rápidas:

- **¿Tiene número y fecha?** "Mejorar el seguimiento" no se puede verificar.
- **¿Mide un resultado o una actividad?** "Mandar 300 mails" es actividad: se cumple aunque nadie los lea.
- **¿Son pocos?** Doerr insiste en pocos objetivos y pocos resultados por objetivo. Si un equipo tiene doce prioridades, no tiene ninguna.

## El caso: reescribir un borrador

Un equipo de admisiones (hipotético) trae este primer borrador para el trimestre de mayor demanda:

- Mejorar la comunicación con las familias.
- Hacer más seguimiento.
- Lanzar la campaña de redes.
- Aumentar las solicitudes.

Reescrito con las tres pruebas:

- **RC 1 (comprometido):** el 100% de las consultas recibe respuesta en 24 horas hábiles. Hoy es el 70%.
- **RC 2 (aspiracional):** las solicitudes del trimestre pasan de 60 a 90.
- **RC 3 (comprometido):** ninguna familia que visitó pasa más de 3 días sin un contacto.

"Lanzar la campaña" desaparece como resultado: es una tarea que tal vez sirva para el RC 2.

## Comprometidos y aspiracionales

El libro distingue dos clases, y mezclarlas es el error más caro:

- **Comprometidos:** se espera el 100%. Si no se llega, hay que explicar por qué y qué se cambia. El RC 1 es así: responder a tiempo no es una apuesta.
- **Aspiracionales:** se ponen a propósito más arriba de lo que parece posible. Quedar en el 70% del camino es un buen trimestre. Doerr cuenta que en Google se puntúan de 0 a 1, y que en los aspiracionales se considera bueno andar por 0,7.

Una forma simple de puntuar el RC 2 (simplificación nuestra, no la regla del libro): contar desde la línea de base. Si llegan a **81 solicitudes**, avanzaron 21 de los 30 que se propusieron: **0,7**. Y 81 es un 35% más que 60. Un equipo que se hubiera puesto 66 como meta "segura" y la cumpliera tendría 1,0 y seis solicitudes más que antes, no veintiuna.

El error opuesto también existe: si el RC 1 cierra en 95%, no es "un 0,95, bastante bien". Era comprometido. Algo falló y hay que mirarlo.

## Dónde no aplica

**Lo aspiracional no sirve para todo.** Con la seguridad de los chicos, la plata o un plazo legal, no hay 0,7 aceptable. Eso va siempre como comprometido, o directamente fuera del OKR, como regla de funcionamiento.

**Un número que el equipo no puede mover** no es un buen resultado clave. Si las solicitudes dependen sobre todo de un cambio de aranceles que decide otro, el equipo va a quedar en rojo sin haber hecho nada mal.

**Con muestras chicas el número miente.** Si el resultado clave es "la conversión pasa del 30% al 40%" y en el trimestre hay 15 visitas, un punto de diferencia es una familia.

## Probá que lo entendiste

¿Comprometido, aspiracional, o reescribir?

1. "Todos los legajos completos antes del cierre de inscripción."
2. "Duplicar las solicitudes de familias de otras ciudades, de 10 a 20."
3. "Trabajar mejor con el área de marketing."

:::Ver la respuesta
**1. Comprometido.** Es una condición, no una apuesta: si un legajo queda incompleto, hay un problema.

**2. Aspiracional.** Está puesto alto a propósito. Llegar a 17 sería un buen trimestre (0,7 contado desde 10).

**3. Reescribir.** No tiene número ni fecha, y "mejor" admite cualquier lectura. Preguntá qué cambiaría si se trabajara mejor, y medí eso.
:::

## Qué hacer esta semana

Tomá los resultados clave (o las metas) de tu equipo y pasá cada uno por las tres pruebas. Después marcá al lado de cada uno una C o una A: comprometido o aspiracional. Si nadie sabe cuál es cuál, ese es el primer arreglo.
$md$,
  9
from books b where b.slug = 'measure-what-matters'
on conflict do nothing;

-- ------------------------------------------------------------
-- no_lei 3 · es
-- ------------------------------------------------------------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'es', 'no_lei', 3,
  'A la vista, seguidos y lejos del bono',
$md$
Un OKR escrito en enero y mirado en abril no sirve de nada. La tercera parte del libro es sobre lo que pasa en el medio, y tiene tres reglas:

- **Se revisan seguido.** No al cierre: cada semana o cada quince días, con una pregunta corta por resultado clave: ¿vamos bien, en riesgo o mal? Si un resultado ya no tiene sentido, se cambia o se abandona a mitad de camino, y se dice.
- **Son visibles para todos.** Los de la dirección también. Así cada equipo ve de qué depende el suyo y quién depende de él.
- **No se atan al bono ni a la evaluación de desempeño.** Esta es la que más cuesta.

La razón de la última es la idea central de la pieza: **si el OKR decide cuánto cobrás, vas a escribir uno que estés seguro de cumplir.** Y un OKR que sabés que vas a cumplir no te empuja a nada. Doerr propone separar las dos cosas: el OKR para decidir en qué poner el esfuerzo; la evaluación de las personas, por otro carril, con conversaciones frecuentes, devoluciones y reconocimiento a lo largo del año.

## El caso: dos equipos, mismo punto de partida

Dos equipos de admisiones (hipotéticos), en dos sedes, arrancan el trimestre con **60 solicitudes** de base.

**Sede A: el bono depende de cumplir el OKR.** El equipo se pone como resultado clave llegar a **62**. Llega a **64**. Cumplimiento: más del 100%. Bono cobrado.

**Sede B: el OKR no toca el bono.** El equipo se pone **90**, aspiracional. Llega a **78**. Contado desde la base, avanzó 18 de 30: **0,6**. En la planilla, la sede B "no cumplió".

Para el colegio, la sede B trajo **14 solicitudes más** que la A (78 contra 64). El sistema de bonos premió al equipo que apuntó bajo.

Y la visibilidad, en el mismo caso: en la revisión de la semana 6, la sede B ve que el resultado está en riesgo porque las visitas vienen flojas. Como el OKR de marketing también está a la vista, ven que marketing se propuso más seguidores en redes, no más visitas. Una conversación de diez minutos reacomoda las dos cosas. Sin OKR visibles, eso se descubre en el cierre.

## Dónde no aplica

**Separar del bono no es que no importe.** Si un equipo queda en 0,2 trimestre tras trimestre, hay una conversación que tener. Lo que no se hace es convertir el número en una fórmula de pago.

**Los comprometidos sí pueden pesar en la evaluación.** Si se prometía responder todas las consultas en 24 horas y se respondió la mitad, eso es desempeño, no ambición. Lo que conviene proteger es lo aspiracional.

**Visible no es para señalar a nadie.** Si mostrar el OKR sirve para exponer al equipo que va en rojo, la próxima vez todos van a escribir metas cómodas, que es el mismo problema que con el bono.

## Probá que lo entendiste

Ordená estas tres prácticas de la que más ayuda a la que más daña:

1. Revisión quincenal de quince minutos: cada resultado en verde, amarillo o rojo, y qué se necesita.
2. Los OKR se miran sólo en la evaluación anual de cada persona, y de ahí sale el aumento.
3. Los OKR de todas las áreas en una sola hoja que cualquiera puede abrir.

:::Ver la respuesta
**Primero la 1**, que es la que hace que el OKR viva durante el trimestre y permite corregir a tiempo.

**Después la 3:** visibilidad, para que los equipos vean de quién dependen. Ayuda, pero sin revisión es una hoja que nadie abre.

**Última la 2**, que daña: llega tarde para corregir nada y, al atarse al aumento, enseña a escribir metas que se cumplan seguro.
:::

## Qué hacer esta semana

Fijá quince minutos cada quince días con tu equipo para mirar los resultados clave del trimestre, en verde, amarillo o rojo. Y averiguá si tus metas están atadas a algún premio o evaluación: si es así, fijate si las que escribiste son las que te animarías a poner sin eso.
$md$,
  9
from books b where b.slug = 'measure-what-matters'
on conflict do nothing;

-- ------------------------------------------------------------
-- hace_tiempo 1 · es
-- ------------------------------------------------------------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'es', 'hace_tiempo', 1,
  'Lo que se te borró',
$md$
Antes de leer nada: reconstruí. Cinco preguntas. Contestalas de memoria y recién después abrí cada una.

**1. ¿Qué es cada parte de un OKR, y cuál de las dos lleva números?**

:::Ver la respuesta
**El objetivo** es cualitativo: adónde querés llegar, en una frase. **Los resultados clave** son los que llevan números con fecha: si se cumplen, prueban que llegaste. Si te acordaste del objetivo con número, mezclaste las dos.
:::

**2. ¿De quién aprendió Doerr el método, y dónde?**

:::Ver la respuesta
**De Andy Grove, en Intel**, en los años setenta. Grove lo había armado como su versión de la dirección por objetivos. Doerr lo llevó después a Google y a otras organizaciones.
:::

**3. ¿Cuál es la diferencia entre un resultado clave comprometido y uno aspiracional?**

:::Ver la respuesta
**El comprometido se espera al 100%;** si no se llega, se explica y se corrige. **El aspiracional se pone a propósito más alto** de lo que parece posible, y llegar a alrededor del 70% del camino es un buen resultado.
:::

**4. ¿Por qué el libro recomienda no atar los OKR al bono?**

:::Ver la respuesta
**Porque la gente escribe metas que está segura de cumplir.** El OKR deja de empujar. La evaluación de las personas va por otro carril: conversaciones frecuentes, devoluciones y reconocimiento.
:::

**5. ¿Cada cuánto se miran los OKR, y quién los ve?**

:::Ver la respuesta
**Seguido**, cada semana o cada quince días, no sólo al cierre. Y **los ve todo el mundo**, dirección incluida, para que cada equipo sepa de quién depende y quién depende de él.
:::

## Lo que suele borrarse

Lo que más se borra es la distinción entre comprometido y aspiracional. Queda "los OKR se ponen altos y con 0,7 alcanza", y eso aplicado a todo es un desastre: hay cosas que no admiten 0,7. Y lo segundo que se borra es que el resultado clave mide un cambio, no una actividad. Con el tiempo, muchos OKR vuelven a ser listas de tareas con un número al lado. La prueba rápida para detectarlo: si el resultado se puede cumplir sin que nadie de afuera del equipo note ninguna diferencia, es una tarea.

## Un caso para aplicarlo

Tu equipo tiene este OKR: objetivo "mejorar la experiencia de las familias nuevas"; resultados clave "hacer 3 reuniones de bienvenida", "mandar 2 encuestas" y "actualizar el manual de ingreso". Al cierre se cumplió todo. ¿Qué le falta?

:::Ver la respuesta
**Los tres resultados clave son tareas.** Se pueden cumplir y que la experiencia de las familias sea igual o peor. Reescritos, medirían el cambio: por ejemplo, "8 de cada 10 familias nuevas dicen en la encuesta de marzo que sabían a quién preguntar" o "las consultas repetidas de familias nuevas bajan de 40 a 20". Y conviene decidir cuál es comprometido y cuál aspiracional.
:::

## Qué hacer esta semana

Mirá el último OKR, plan o lista de metas de tu equipo y contá cuántos resultados son actividades disfrazadas de resultado. Reescribí uno solo para que mida un cambio.
$md$,
  7
from books b where b.slug = 'measure-what-matters'
on conflict do nothing;

-- ------------------------------------------------------------
-- fresco 1 · es
-- ------------------------------------------------------------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'es', 'fresco', 1,
  'Doerr con Grove y Lencioni',
$md$
Si lo tenés fresco, lo más útil es cruzarlo con dos libros de la biblioteca: el de donde viene el método y uno que llega a lo mismo por otro camino.

**Grove** (*High Output Management*): la producción de quien coordina es la de su equipo, se mide la salida y no la actividad, y los indicadores van de a pares.

**Lencioni** (*The Five Dysfunctions of a Team*): el escalón más alto del equipo es mirar el resultado común antes que el de cada área, y que los pares se pidan cuentas.

Antes de seguir, una prueba. Sin releer: **¿qué le agrega Doerr a Grove, si el método es de Grove?**

:::Ver la respuesta
**La escala y el uso fuera de la fábrica.** Grove lo usaba para dirigir Intel y le dedica pocas páginas. Doerr lo convierte en un sistema para toda una organización: OKR visibles de arriba abajo, la distinción entre comprometidos y aspiracionales, y la separación de los bonos. Las bases (salida y no actividad, pocos objetivos, resultados verificables) ya estaban en Grove.
:::

## Dónde se tocan, y dónde no

**Con Grove coinciden en medir la salida.** Un resultado clave bien escrito es un indicador de salida con meta y plazo. Lo que Doerr no subraya tanto es el par de calidad: un resultado clave de cantidad solo ("90 solicitudes") se puede inflar con solicitudes que nunca se van a concretar. Grove pediría el par al lado.

**Con Lencioni coinciden en el resultado común a la vista.** Un OKR de equipo publicado es casi exactamente lo que Lencioni propone contra la desatención a los resultados. La diferencia es de dónde ponen el peso: Doerr confía en el sistema (escribir, publicar, revisar); Lencioni dice que sin confianza y sin conflicto de ideas, el sistema se llena de metas que nadie discute y nadie defiende.

## Lo que el libro no prueba

Conviene decirlo: es un libro de casos, no de investigación. Las historias son de organizaciones a las que les fue bien, y no sabemos cuántas usaron OKR y les fue mal. Además, Doerr es inversor: su firma invirtió en varias de las empresas que aparecen, Google entre ellas. No invalida lo que dice, pero es un testigo interesado.

Y la crítica más repetida no viene del libro sino de afuera: cuando un número se vuelve meta, la gente aprende a moverlo aunque no mueva lo que importa (en economía se conoce como ley de Goodhart). El libro tiene defensas parciales (separar del bono, el objetivo cualitativo arriba), pero no trata a fondo el riesgo.

## Una situación para decidir

Dirección te pide que el equipo de admisiones tenga OKR este trimestre. Tu equipo nunca discute las metas en las reuniones: dice que sí a todo y después cada uno hace lo suyo. ¿Empezás por escribir los OKR o por otra cosa?

:::Ver la respuesta
**Doerr:** escribilos, pocos y en conjunto, con parte de los resultados propuestos por el propio equipo, y revisalos cada quince días. El sistema obliga a la conversación.

**Lencioni:** cuidado. Si el equipo no discute, va a aceptar los OKR igual que acepta todo, y no se va a comprometer. Primero, que se pueda decir "esta meta no tiene sentido" sin costo.

**Grove:** fijate que cada resultado clave tenga su par de calidad y que sea salida, no actividad.

Una salida razonable: escribirlos en una reunión donde la única regla sea que cada persona tiene que objetar por lo menos un resultado. Así el método sirve de excusa para la discusión que faltaba.
:::

## Qué hacer esta semana

Elegí un resultado clave o una meta de tu equipo y hacele las dos preguntas de los otros libros: ¿qué par de calidad le falta (Grove)? ¿Alguien la discutió antes de aceptarla (Lencioni)?
$md$,
  8
from books b where b.slug = 'measure-what-matters'
on conflict do nothing;

-- ============================================================
-- English (British)
-- ============================================================

-- ------------------------------------------------------------
-- no_lei 1 · en
-- ------------------------------------------------------------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'en', 'no_lei', 1,
  'An objective is not a to-do list',
$md$
John Doerr learnt the method working at Intel under Andy Grove in the 1970s, and later took it to Google and many other organisations. The book is his manual. The idea fits on one line:

**An OKR is a qualitative objective (where you want to get to) and a few measurable key results that, if met, prove you got there.**

The two parts do different jobs:

- **The objective** is a sentence, not a number. It says what matters and why someone would get up in the morning to work on it. "Families who visit the school leave wanting to enrol."
- **The key results** are numbers with a date. They don't say what you will do: they say what must have changed. At the end of the quarter you look at them and there is nothing to argue about.

Doerr sums up the structure with a formula: *I will achieve this objective, as measured by these results.* Without the "as measured by", it isn't an OKR: it's an intention.

## The case: nine tasks done and nothing changed

An admissions team (hypothetical) draws up its quarterly plan as usual, as a list:

1. Redesign the brochure.
2. Run four open days.
3. Update the website.
4. Send the monthly newsletter.
5. And five more things in the same vein.

Last quarter there were **200 visits** and **60 applications**: 30%. This quarter they do all nine tasks, on time. Result: **210 visits** and **61 applications**. That is 61 out of 210, **29%**. Every item is ticked off and conversion has fallen by a point.

Now the same quarter written as an OKR:

- **Objective:** families who visit leave wanting to enrol.
- **KR 1:** conversion from visit to application rises from 30% to 40% (with 200 visits, from 60 to 80 applications).
- **KR 2:** first contact after a visit falls from 9 days to 2.
- **KR 3:** 8 in 10 families rate the visit 4 or 5 out of 5.

The tasks don't disappear: they are chosen afterwards, according to how much they move those three numbers. Redesigning the brochure may be dropped; ringing every family within 48 hours probably makes the cut. The list becomes a consequence of the OKR, not the plan.

## Where it doesn't apply

**Day-to-day work doesn't need OKRs.** Answering enquiries, filing records, keeping the website running: that is tracked with operating indicators. An OKR is for what has to change this quarter, not for everything the team does.

**If nothing that matters can be measured,** inventing a number is worse than having none. A three-week project that is just starting may first need a milestone ("the diagnosis is ready on the 15th") and only then a result.

**A one-person team with a single priority** gains little from writing it this way. The method pays off when you have to choose between many things and coordinate with others.

## Check you've got it

Which of these is an objective, which a key result and which a task?

1. "Run a survey of families who didn't enrol."
2. "The school is the first choice for families in the neighbourhood."
3. "Applications from local families rise from 25 to 40 this quarter."

:::Show the answer
**1. Task.** It can be done perfectly and change nothing. It may help move a key result, but it isn't one.

**2. Objective.** Qualitative, says where to go. No numbers yet.

**3. Key result.** A number, a starting point, a target and a deadline. At the end of the quarter you look and there is no argument.
:::

## What to do this week

Take your team's plan for this quarter. If it's a list of tasks, write a single sentence above it: what must have changed once they are all done. Then, underneath, two numbers that would prove it changed. See how many tasks on the list actually move those numbers.
$md$,
  9
from books b where b.slug = 'measure-what-matters'
on conflict do nothing;

-- ------------------------------------------------------------
-- no_lei 2 · en
-- ------------------------------------------------------------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'en', 'no_lei', 2,
  'Results you can measure without arguing',
$md$
Writing the objective is easy. The hard part, and where almost every first OKR goes wrong, is the key results. The underlying rule:

**A good key result says which number has to change, from where, to where and by when. If you have to argue at the end of the quarter about whether it was met, it was badly written.**

That gives three quick tests:

- **Does it have a number and a date?** "Improve follow-up" can't be checked.
- **Does it measure a result or an activity?** "Send 300 emails" is activity: it is met even if nobody reads them.
- **Are there few of them?** Doerr insists on few objectives and few results per objective. A team with twelve priorities has none.

## The case: rewriting a draft

An admissions team (hypothetical) brings this first draft for its busiest quarter:

- Improve communication with families.
- Do more follow-up.
- Launch the social media campaign.
- Increase applications.

Rewritten with the three tests:

- **KR 1 (committed):** 100% of enquiries answered within 24 working hours. Today it's 70%.
- **KR 2 (aspirational):** applications for the quarter rise from 60 to 90.
- **KR 3 (committed):** no family that visited goes more than 3 days without contact.

"Launch the campaign" disappears as a result: it's a task that may help with KR 2.

## Committed and aspirational

The book distinguishes two kinds, and mixing them up is the costliest mistake:

- **Committed:** 100% is expected. If it isn't reached, you explain why and what changes. KR 1 is like this: answering on time is not a gamble.
- **Aspirational:** deliberately set above what seems possible. Getting 70% of the way is a good quarter. Doerr describes how Google scores them from 0 to 1, and how around 0.7 is considered good for aspirational ones.

A simple way to score KR 2 (our simplification, not the book's rule): count from the baseline. If they reach **81 applications**, they have covered 21 of the 30 they set out to add: **0.7**. And 81 is 35% more than 60. A team that set itself a "safe" target of 66 and hit it would score 1.0 and have six more applications than before, not twenty-one.

The opposite mistake exists too: if KR 1 closes at 95%, it isn't "0.95, pretty good". It was committed. Something went wrong and needs looking at.

## Where it doesn't apply

**Aspirational doesn't suit everything.** With pupils' safety, money or a legal deadline, there is no acceptable 0.7. That always goes in as committed, or outside the OKR altogether, as an operating rule.

**A number the team can't move** is not a good key result. If applications depend mainly on a change in fees decided by someone else, the team will end up in the red without having done anything wrong.

**With small samples the number lies.** If the key result is "conversion rises from 30% to 40%" and there are 15 visits in the quarter, one point of difference is a single family.

## Check you've got it

Committed, aspirational, or rewrite?

1. "Every file complete before admissions close."
2. "Double applications from families in other cities, from 10 to 20."
3. "Work better with the marketing team."

:::Show the answer
**1. Committed.** It's a condition, not a bet: if a file is left incomplete, there is a problem.

**2. Aspirational.** Set high on purpose. Reaching 17 would be a good quarter (0.7 counting from 10).

**3. Rewrite.** No number, no date, and "better" can mean anything. Ask what would change if you worked better, and measure that.
:::

## What to do this week

Take your team's key results (or targets) and run each one through the three tests. Then mark each with a C or an A: committed or aspirational. If nobody knows which is which, that's the first fix.
$md$,
  9
from books b where b.slug = 'measure-what-matters'
on conflict do nothing;

-- ------------------------------------------------------------
-- no_lei 3 · en
-- ------------------------------------------------------------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'en', 'no_lei', 3,
  'Visible, tracked and kept away from the bonus',
$md$
An OKR written in January and looked at in April is useless. The third part of the book is about what happens in between, and it has three rules:

- **They are reviewed often.** Not at the close: every week or fortnight, with one short question per key result: on track, at risk or off track? If a result no longer makes sense, it is changed or dropped halfway through, and that is said openly.
- **They are visible to everyone.** Senior leadership's too. That way each team sees what its own depends on and who depends on it.
- **They are not tied to bonuses or performance reviews.** This is the hardest one.

The reason for the last is the central idea here: **if the OKR decides your pay, you will write one you are sure to meet.** And an OKR you know you'll meet doesn't push you anywhere. Doerr proposes separating the two: the OKR to decide where effort goes; people's appraisal on a separate track, with frequent conversations, feedback and recognition throughout the year.

## The case: two teams, same starting point

Two admissions teams (hypothetical), on two campuses, start the quarter with a baseline of **60 applications**.

**Campus A: the bonus depends on meeting the OKR.** The team sets a key result of **62**. It reaches **64**. Over 100% achieved. Bonus paid.

**Campus B: the OKR doesn't touch the bonus.** The team sets **90**, aspirational. It reaches **78**. Counted from the baseline, it covered 18 of 30: **0.6**. On the spreadsheet, campus B "missed".

For the school, campus B brought in **14 more applications** than A (78 against 64). The bonus system rewarded the team that aimed low.

And visibility, in the same case: at the week-6 review, campus B sees its result is at risk because visits are weak. Since marketing's OKR is visible too, they see that marketing set itself more social media followers, not more visits. A ten-minute conversation realigns the two. Without visible OKRs, that comes to light at the close.

## Where it doesn't apply

**Separating it from the bonus doesn't mean it doesn't matter.** If a team scores 0.2 quarter after quarter, there's a conversation to be had. What you don't do is turn the number into a pay formula.

**Committed results can count in appraisals.** If the promise was to answer every enquiry within 24 hours and half were answered, that's performance, not ambition. What's worth protecting is the aspirational part.

**Visible isn't for pointing fingers.** If showing OKRs is used to expose the team in the red, next time everyone will write comfortable targets, which is the same problem as with the bonus.

## Check you've got it

Rank these three practices from most helpful to most harmful:

1. A fortnightly fifteen-minute review: each result green, amber or red, and what's needed.
2. OKRs are looked at only in each person's annual review, and that sets the pay rise.
3. Every team's OKRs on a single sheet anyone can open.

:::Show the answer
**First, 1**: it's what keeps the OKR alive during the quarter and allows correction in time.

**Then 3:** visibility, so teams see who they depend on. It helps, but without reviews it's a sheet nobody opens.

**Last, 2**, which does harm: it comes too late to correct anything and, tied to the pay rise, it teaches people to write targets they're sure to meet.
:::

## What to do this week

Set aside fifteen minutes every fortnight with your team to look at the quarter's key results, in green, amber or red. And find out whether your targets are tied to any reward or appraisal: if so, ask yourself whether the ones you wrote are the ones you'd dare to set without it.
$md$,
  9
from books b where b.slug = 'measure-what-matters'
on conflict do nothing;

-- ------------------------------------------------------------
-- hace_tiempo 1 · en
-- ------------------------------------------------------------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'en', 'hace_tiempo', 1,
  'What you''ve forgotten',
$md$
Before reading anything: reconstruct. Five questions. Answer them from memory and only then open each one.

**1. What is each part of an OKR, and which of the two carries numbers?**

:::Show the answer
**The objective** is qualitative: where you want to get to, in one sentence. **The key results** carry numbers with a date: if they're met, they prove you got there. If you remembered the objective as having a number, you've merged the two.
:::

**2. Who did Doerr learn the method from, and where?**

:::Show the answer
**From Andy Grove, at Intel**, in the 1970s. Grove had built it as his version of management by objectives. Doerr later took it to Google and other organisations.
:::

**3. What's the difference between a committed and an aspirational key result?**

:::Show the answer
**A committed one is expected at 100%;** if it's missed, you explain and correct. **An aspirational one is deliberately set higher** than seems possible, and getting around 70% of the way is a good result.
:::

**4. Why does the book advise against tying OKRs to bonuses?**

:::Show the answer
**Because people write targets they're sure to meet.** The OKR stops pushing. People's appraisal runs on a separate track: frequent conversations, feedback and recognition.
:::

**5. How often are OKRs looked at, and who sees them?**

:::Show the answer
**Often**, every week or fortnight, not just at the close. And **everyone sees them**, senior leadership included, so each team knows who it depends on and who depends on it.
:::

## What usually fades

What fades most is the distinction between committed and aspirational. What's left is "OKRs are set high and 0.7 is enough", and applied to everything that's a disaster: some things don't allow 0.7. The second thing to fade is that a key result measures a change, not an activity. Over time, many OKRs turn back into to-do lists with a number beside them. The quick test to spot it: if the result can be met without anyone outside the team noticing any difference, it's a task.

## A case to apply it

Your team has this OKR: objective "improve the experience of new families"; key results "hold 3 welcome meetings", "send 2 surveys" and "update the joining handbook". At the close, everything was done. What's missing?

:::Show the answer
**All three key results are tasks.** They can be met while families' experience stays the same or gets worse. Rewritten, they would measure the change: for example, "8 in 10 new families say in the March survey that they knew whom to ask" or "repeat enquiries from new families fall from 40 to 20". And it's worth deciding which is committed and which aspirational.
:::

## What to do this week

Look at your team's latest OKR, plan or list of targets and count how many results are activities dressed up as results. Rewrite just one so that it measures a change.
$md$,
  7
from books b where b.slug = 'measure-what-matters'
on conflict do nothing;

-- ------------------------------------------------------------
-- fresco 1 · en
-- ------------------------------------------------------------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'en', 'fresco', 1,
  'Doerr with Grove and Lencioni',
$md$
If it's fresh, the most useful thing is to cross it with two books in the library: the one the method comes from, and one that reaches the same place by another route.

**Grove** (*High Output Management*): a manager's output is the output of their team, you measure output rather than activity, and indicators come in pairs.

**Lencioni** (*The Five Dysfunctions of a Team*): the top level of a team is attending to the shared result before each area's, and peers holding one another to account.

Before going on, a test. Without rereading: **what does Doerr add to Grove, if the method is Grove's?**

:::Show the answer
**Scale and use beyond the factory.** Grove used it to run Intel and gives it few pages. Doerr turns it into a system for a whole organisation: OKRs visible from top to bottom, the distinction between committed and aspirational, and separation from bonuses. The foundations (output not activity, few objectives, verifiable results) were already in Grove.
:::

## Where they meet, and where they don't

**With Grove they agree on measuring output.** A well-written key result is an output indicator with a target and a deadline. What Doerr doesn't stress as much is the quality pair: a quantity key result on its own ("90 applications") can be inflated with applications that will never turn into enrolments. Grove would ask for the pair alongside.

**With Lencioni they agree on a visible shared result.** A published team OKR is almost exactly what Lencioni proposes against inattention to results. The difference is where they put the weight: Doerr trusts the system (write, publish, review); Lencioni says that without trust and without conflict over ideas, the system fills up with targets nobody argues about and nobody defends.

## What the book doesn't prove

It's worth saying: this is a book of cases, not research. The stories are about organisations that did well, and we don't know how many used OKRs and did badly. Doerr is also an investor: his firm invested in several of the companies featured, Google among them. That doesn't invalidate what he says, but he is an interested witness.

And the most common criticism comes from outside the book: when a number becomes a target, people learn to move it even when it doesn't move what matters (economists know this as Goodhart's law). The book has partial defences (separation from bonuses, the qualitative objective on top), but it doesn't deal with the risk in depth.

## A situation to decide

Senior leadership asks the admissions team to have OKRs this quarter. Your team never argues about targets in meetings: it agrees to everything and then everyone does their own thing. Do you start by writing the OKRs, or with something else?

:::Show the answer
**Doerr:** write them, few and together, with some of the results proposed by the team itself, and review them every fortnight. The system forces the conversation.

**Lencioni:** careful. If the team doesn't argue, it will accept the OKRs the way it accepts everything, and won't commit. First, make it possible to say "this target makes no sense" at no cost.

**Grove:** check that each key result has its quality pair and that it's output, not activity.

A reasonable way through: write them in a meeting whose only rule is that each person must object to at least one result. That way the method becomes the excuse for the argument that was missing.
:::

## What to do this week

Pick one key result or target of your team's and ask it the two questions from the other books: what quality pair is it missing (Grove)? Did anyone argue about it before accepting it (Lencioni)?
$md$,
  8
from books b where b.slug = 'measure-what-matters'
on conflict do nothing;
