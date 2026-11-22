-- ============================================================
-- Frontera - Inspired (Marty Cagan) reescrito para que enseñe
-- ============================================================
-- Reemplaza el cuerpo de las cinco piezas de db/014 (todos los
-- estados de lectura). Misma estructura que db/027: idea, caso
-- trabajado, borde, recuperación con respuesta escondida, acción.
-- Los casos con números son hipotéticos y lo dicen. Síntesis
-- propia, sin texto del libro.
-- ============================================================

-- ---------- no_lei, pieza 1 ----------
update book_pieces
set
  minutes = 9,
  body_md = $md$
Cagan trabajó décadas en productos de software y escribió este libro enojado con una sola cosa: **la mayoría de los equipos no hacen producto, ejecutan pedidos.** Alguien decide qué construir, baja como lista priorizada, el equipo la entrega a tiempo, y no pasa nada: la métrica no se mueve y el problema sigue ahí.

Él lo llama **fábrica de funcionalidades**. Su diagnóstico: el problema no está en la ejecución sino en el encargo. Al equipo le dieron **una solución para construir** en lugar de **un problema para resolver**.

La diferencia práctica es quién piensa. En la fábrica el equipo son manos. En el modelo que propone, el equipo recibe un problema y un resultado esperado, y decide cómo llegar. Cagan los llama equipos de producto empoderados.

## El caso trabajado

Un equipo de admisiones de un colegio (caso hipotético, con números inventados para la cuenta). Dirección pide: "necesitamos un portal para familias con chat". Es una solución.

**Versión fábrica.** Se construye el portal en un mes. Antes, de cada 200 familias que empezaban la inscripción online, terminaban 120. Después del portal terminan 122. Se entregó todo, se cumplió el plazo, y la diferencia es ruido.

**Versión producto.** El pedido llega como problema: "demasiadas familias empiezan la inscripción y no la terminan". Antes de construir nada, el equipo habla con cinco familias que abandonaron. Cuatro dicen lo mismo: llegaron al paso de documentación, no sabían cuál era cuál, y lo dejaron para después. Después nunca llegó.

La solución que sale de ahí es una lista con ejemplos de cada documento y un recordatorio a los tres días. Se arma en una semana, no en un mes. Si de 200 pasan a terminar 150, el resultado se movió en 30 familias, con menos trabajo y sin chat.

La cuenta no es lo importante, porque es inventada. Lo importante es la secuencia: **problema medido, conversación con quien lo vive, recién después solución.** La fábrica se saltea los dos primeros pasos.

## Dónde la idea no aplica

**A veces la solución viene dada y está bien.** Una obligación legal, un requisito de un organismo, un compromiso firmado. Ahí no hay nada que descubrir: se ejecuta, y hacerlo bien ya es el trabajo.

**El empoderamiento no se regala.** Cagan insiste en que un equipo solo puede decidir la solución si tiene gente capaz y conoce el negocio. Darle un problema abierto a quien todavía no sabe medir resultados no es confianza, es abandono.

**No todo merece un descubrimiento.** Cambiar el texto de un botón o corregir un error no es una apuesta. Tratar todo pedido chico como un problema de investigación es otra forma de no entregar.

## Probá que lo entendiste

Primero, clasificá cada frase como **solución** o **problema**:

1. "Necesitamos un tablero de métricas para el equipo."
2. "No sabemos por qué baja la asistencia a las jornadas de puertas abiertas."
3. "Hay que mandar un mail masivo a todas las familias del turno tarde."

:::Ver la respuesta
**1 y 3 son soluciones. 2 es un problema.**

La 1 dice qué construir (un tablero) sin decir qué decisión no se puede tomar hoy. Detrás puede haber diez problemas distintos. La 3 dice qué hacer (un mail), no qué se quiere lograr con él. La 2 describe una situación y deja abierto cómo atacarla, que es justo la señal de un buen encargo.
:::

Segundo: reescribí la frase 1 como problema. Tiene que decir qué no podés hacer hoy por no tener el tablero.

:::Ver la respuesta
Algo del estilo: "Me entero tarde de que una consulta quedó sin responder y la familia ya se enojó". Ahí el tablero puede ser una de varias salidas, y quizás la peor: una alerta o una regla de derivación podrían resolverlo sin ningún tablero. Si tu reescritura sigue nombrando un objeto (tablero, formulario, app), todavía es una solución con otra ropa.
:::

Tercero: te piden una app con IA para organizar las visitas al colegio y ya tenés el diseño en la cabeza. ¿Qué es lo primero que hacés?

:::Ver la respuesta
Preguntás qué problema resuelve y cómo lo vas a notar si funcionó. Con IA podés armar la app en una tarde, y justamente por eso es la trampa: construir es tan barato que se vuelve tentador saltearse el paso de averiguar si la gente lo necesita. La velocidad para construir lo equivocado no es una ventaja.
:::

## Qué hacer esta semana

Elegí un pedido que tengas hoy en la cabeza o en tu lista, uno que vos hayas hecho o recibido. Escribilo en una línea como problema, con la persona que lo sufre y cómo notarías que mejoró. Si no podés, todavía no sabés qué estás construyendo.
$md$
where idx = 1
  and lang = 'es'
  and for_read_state = 'no_lei'
  and book_id = (select id from books where slug = 'inspired');

-- ---------- no_lei, pieza 2 ----------
update book_pieces
set
  minutes = 9,
  body_md = $md$
Antes de construir algo, Cagan dice que hay **cuatro riesgos** distintos, y que casi todos los proyectos que fracasan atendieron uno y supusieron los otros tres.

**Valor.** ¿Alguien lo va a usar, lo suficiente como para cambiar lo que hace hoy?

**Usabilidad.** ¿Se entiende sin que vos estés al lado explicando? No es una cuestión de estética.

**Viabilidad técnica.** ¿Se puede construir con lo que tenés y en el tiempo que tenés?

**Viabilidad del negocio.** ¿Funciona para tu organización? Presupuesto, normas, quién lo mantiene, qué pasa con los datos.

La clave es que **cada riesgo se chequea con una herramienta distinta y a un costo distinto**, y el valor es el que menos se chequea porque no se resuelve con esfuerzo.

## El caso trabajado

Una persona quiere armar, con ayuda de IA, un asistente que conteste por WhatsApp las consultas de familias de un colegio. Caso hipotético. Los costos son estimaciones razonables, no mediciones.

**Valor.** ¿Las familias quieren esto o prefieren hablar con alguien? Se chequea con tres conversaciones de veinte minutos con familias que hayan consultado este año. Costo: una hora. Lo que se busca es qué hacen hoy cuando tienen una duda y si les molesta esperar.

**Usabilidad.** Se simula el asistente a mano: alguien contesta como si fuera el bot, mientras una familia de prueba mira. Costo: una tarde. Se ve enseguida si preguntan cosas que el asistente no entiende.

**Viabilidad técnica.** Se prueba un prototipo con tres preguntas reales. Costo: un fin de semana.

**Viabilidad del negocio.** Se le pregunta a quien corresponda si el colegio permite que una IA conteste a familias y qué pasa con datos de menores. Costo: un mail y una reunión corta.

Ahora el orden, que es lo que enseña la cuenta: **el chequeo más barato y más informativo es el de valor**, una hora. El técnico, que es el que más tienta, es el más caro y el que menos proyectos mata. Si las familias respondieran "prefiero hablar con una persona", se cancela todo sin haber escrito una línea.

## Dónde la idea no aplica

**No es una lista para completar con la misma intensidad.** Una mejora chica y reversible no necesita un chequeo formal de los cuatro. El esfuerzo de averiguar tiene que ser proporcional a lo que se pierde si te equivocás.

**Valor primero no es una ley.** Si hay un bloqueo duro de negocio, por ejemplo una norma que prohíbe lo que querés hacer, ese riesgo también es barato de chequear y mata el proyecto igual. Se chequea primero lo que sea más barato y más probable que lo mate.

**Dos riesgos pueden quedar mezclados.** Si una persona no entiende tu herramienta, puede ser un problema de usabilidad (no se entiende) o de valor (no la necesita). Cagan advierte justo de esto: antes de arreglar, hay que saber cuál de los dos es.

## Probá que lo entendiste

Cada caso corresponde a uno de los cuatro riesgos. Decidí cuál antes de abrir la respuesta.

1. Un equipo arma una app, la prueban tres colegas y todos se pierden en la segunda pantalla.
2. Construís un formulario perfecto y nadie lo completa porque hoy ya resuelven eso por teléfono.
3. Todo funciona, pero la normativa interna no permite guardar esos datos fuera del sistema oficial.

:::Ver la respuesta
**1 es usabilidad. 2 es valor. 3 es viabilidad del negocio.**

En el 1 el problema existe y la solución es razonable, pero no se entiende sola: se arregla con un prototipo y gente mirando. En el 2 no hay nada que arreglar en el producto, porque el que falla es el supuesto de que alguien lo quiere. En el 3 ni el valor ni la usabilidad ni la técnica alcanzaron: lo frena una regla, y descubrirlo al final sale carísimo.
:::

Ahora ordená por qué chequearías primero, con una sola frase de por qué: querés armar una app de ayuda a docentes, nunca hablaste con ninguno, y sabés que tu área de sistemas es lenta para aprobar cosas.

:::Ver la respuesta
Valor primero, con dos o tres conversaciones. Es barato y es el que más gente descarta. El riesgo de sistemas lo conviene arrancar en paralelo, porque es lento aunque no sea caro: si lo dejás para el final, el proyecto se frena meses esperando. Lo técnico, que es lo que más tienta, va último.
:::

## Qué hacer esta semana

Elegí algo que estés construyendo o por construir y escribí una línea por riesgo, con una sola palabra al lado: **evidencia** o **supuesto**. Si valor dice supuesto, tu próxima tarea no es escribir código: es conseguir tres conversaciones.
$md$
where idx = 2
  and lang = 'es'
  and for_read_state = 'no_lei'
  and book_id = (select id from books where slug = 'inspired');

-- ---------- no_lei, pieza 3 ----------
update book_pieces
set
  minutes = 9,
  body_md = $md$
Cagan separa dos trabajos que suelen confundirse: **descubrir** y **entregar**. Descubrir es averiguar qué vale la pena construir. Entregar es construirlo bien, para que aguante.

Los dos piden estándares opuestos. Descubrir se hace rápido, sucio y barato, con bocetos y prototipos que se tiran, porque el objetivo es aprender y no que funcione. Entregar es lento, prolijo y probado. El error típico es aplicar los estándares de la entrega al descubrimiento: construir con cuidado algo que todavía no sabés si sirve.

Su regla práctica: **prototipos antes que documentos.** La gente no sabe opinar bien sobre descripciones, pero sí sobre cosas que puede tocar.

## El caso trabajado

Un área de admisiones piensa en un sistema para que las familias reserven solas su visita al colegio. Caso hipotético, con horas estimadas.

**El camino de entrega.** Se especifica, se desarrolla y se prueba. Tres semanas de trabajo, algo así como 60 horas. Recién al lanzarlo se descubre que las familias no reservan solas porque quieren preguntar algo antes de elegir fecha. Se perdieron 60 horas para averiguar eso.

**El camino de descubrimiento.** Una tarde (unas 4 horas) para armar un prototipo tocable, con una IA o con herramientas simples, sin conexión real a nada. Se lo muestran a cinco familias, de a una, y se las mira usarlo sin explicarles nada.

Con cinco personas ya suele aparecer el patrón principal. Supongamos que tres dudan en el paso de elegir fecha porque quieren saber cuánto dura la visita. Eso se arregla en el prototipo en diez minutos y se vuelve a probar al día siguiente.

La cuenta: 4 horas más 2 de las sesiones contra 60 horas, y se llega al lanzamiento sabiendo algo que de otro modo se habría descubierto tarde. Ese es el trabajo del descubrimiento: **comprar certeza barata antes de pagar la cara.**

## Dónde la idea no aplica

**Un prototipo de descubrimiento no debe tocar datos reales.** Si el prototipo se conecta a nombres o mails de familias para que "se vea más real", ya no es un borrador desechable: es un sistema con riesgo. Se prueba con datos inventados.

**Descubrir no es construir rápido.** La trampa de hoy es que prototipar con IA cuesta una tarde, y entonces es tentador prototipar directamente la solución que ya tenías en la cabeza. Si no hay una pregunta que el prototipo responda, y nadie lo prueba antes de decidir, es entrega disfrazada.

**Si ya hay evidencia, no hace falta descubrir de nuevo.** Cuando sabés qué problema es, para quién y que la solución es obvia, seguir averiguando es otra forma de postergar.

**Lo que sobrevive al prototipo se rehace.** Cagan es claro en esto: lo que se aprendió pasa a la entrega, el prototipo no. Convertir un prototipo en producto con un par de retoques arrastra todas las decisiones apuradas.

## Probá que lo entendiste

Decidí si cada situación es **descubrimiento** o **entrega**, y por qué.

1. Armás tres pantallas falsas de una app y se las mostrás a cuatro colegas para ver dónde se traban.
2. Ya sabés que hace falta un recordatorio automático por mail, y lo programás con pruebas, revisión de casos raros y manejo de errores.
3. Escribís un documento de diez páginas describiendo cómo va a funcionar una herramienta que todavía nadie vio.

:::Ver la respuesta
**1 es descubrimiento, 2 es entrega, 3 es un híbrido peligroso.**

El 1 es rápido, descartable y busca aprender dónde se traba la gente. El 2 es entrega bien hecha: ya sabés qué y para qué, ahora importa que no falle. El 3 aplica la lentitud de la entrega (diez páginas) sobre algo que todavía es una hipótesis. Esas diez páginas se pueden reemplazar por un prototipo y una conversación.
:::

Un caso para decidir: tenés una idea, armás un prototipo en una tarde con IA y te encanta. ¿Qué es lo siguiente?

:::Ver la respuesta
Mostrárselo a alguien que tenga el problema, sin explicarlo, y mirar. Que te guste a vos no cuenta: sos quien menos puede ver los defectos. Si pasan cinco minutos sin que la otra persona entienda para qué sirve o sin que se interese, aprendiste algo más valioso que lo que costó el prototipo.
:::

## Qué hacer esta semana

Pensá en una idea que tengas. Antes de construir nada, escribí la pregunta exacta que querés que un prototipo responda y a quién se lo vas a mostrar. Si no podés escribir la pregunta, todavía no estás descubriendo, estás construyendo.
$md$
where idx = 3
  and lang = 'es'
  and for_read_state = 'no_lei'
  and book_id = (select id from books where slug = 'inspired');

-- ---------- hace_tiempo, pieza 1 ----------
update book_pieces
set
  minutes = 8,
  body_md = $md$
Lo leíste hace años. Antes de ver nada, probá reconstruir lo que quedó. La idea es que el esfuerzo de acordarte es lo que lo fija, así que tomate un minuto por pregunta.

**Primero.** Escribí los cuatro riesgos de producto y cuál de ellos mata más proyectos.

:::Ver la respuesta
**Valor, usabilidad, viabilidad técnica y viabilidad del negocio.** El que más proyectos mata es el de valor, que es el que menos se chequea: no se resuelve con esfuerzo, porque se puede construir de maravilla algo que nadie quiere. Si te salió bien el listado pero no el "cuál mata más", es lo más común: se recuerda la lista y se pierde el criterio.
:::

**Segundo.** ¿Qué distingue a un equipo de producto de una fábrica de funcionalidades?

:::Ver la respuesta
La fábrica recibe soluciones para construir. El equipo de producto recibe un problema y un resultado esperado, y decide cómo. No cambia el método, cambia quién piensa. Y lo que casi todos olvidan: sin poder real para elegir la solución, las técnicas del libro quedan en teatro. Podés hacer un descubrimiento prolijo y construir igual lo que bajó de arriba.
:::

**Tercero.** ¿Qué se hace distinto en descubrimiento que en entrega, y por qué es un error mezclarlos?

:::Ver la respuesta
El descubrimiento es rápido, barato y descartable, porque busca aprender. La entrega es lenta y cuidada, porque busca que aguante. Mezclarlos es construir con estándar de entrega algo que no sabés si sirve, que es la forma más cara de averiguar que no servía.
:::

**Cuarto.** Cagan es durísimo con el rol de quien lidera el producto. ¿Qué dice que no es?

:::Ver la respuesta
No es coordinar, ni escribir tickets, ni traducir entre áreas. Pide conocer a los usuarios, los datos, el negocio y el mercado mejor que nadie. Si el trabajo es coordinar, eso es un proyecto, no un producto. Para quien coordina un equipo, esta definición pega incómodo y por eso conviene releerla.
:::

## Qué envejeció

**Envejeció mal.** El libro supone organizaciones con equipos dedicados de diseño e ingeniería. Para alguien que construye solo o para un área chica, buena parte de esa estructura no aplica. También insiste con el contraste entre las grandes tecnológicas y "los demás" más de lo necesario.

**Envejeció bien.** Los cuatro riesgos y la separación entre descubrir y entregar. Funcionan igual para una persona que para una empresa grande.

**Lo que el libro no vio venir.** Cuando escribió, prototipar era caro y por eso había que elegir bien qué prototipar. Hoy, con IA, construir cuesta una fracción y el cuello de botella se corrió: ya no es hacer, es saber qué vale la pena hacer. La velocidad se volvió barata, y el criterio sobre qué construir, el recurso escaso. El libro, sin quererlo, se volvió más relevante.

## Qué hacer esta semana

Elegí una cosa que hayas construido o pedido construir en los últimos meses y que no se haya usado. Escribí cuál de los cuatro riesgos no habías chequeado. Casi siempre es el mismo en los proyectos de una misma persona, y saber cuál es el tuyo vale más que releer el libro.
$md$
where idx = 1
  and lang = 'es'
  and for_read_state = 'hace_tiempo'
  and book_id = (select id from books where slug = 'inspired');

-- ---------- fresco, pieza 1 ----------
update book_pieces
set
  minutes = 8,
  body_md = $md$
Si lo tenés fresco, repasarlo no suma. Lo que suma es aplicárselo a lo tuyo, que es justo lo que uno evita.

## Uno: los cuatro riesgos, sobre un proyecto real

Escribí el nombre de algo que estés construyendo o por construir. Debajo, una línea por riesgo (valor, usabilidad, viabilidad técnica, viabilidad del negocio) con una palabra al lado: **evidencia** o **supuesto**.

Evidencia significa que alguien más lo vio, lo probó o lo dijo, no que a vos te parece. Casi siempre la viabilidad técnica tiene evidencia de sobra, porque es lo que venís haciendo, y el valor dice supuesto. Si te pasa eso, tu próximo paso no es una funcionalidad.

Probá si lo aplicás bien. Una persona dice: "Mostré mi app a mi equipo y les encantó, así que el valor está confirmado". ¿Está bien?

:::Ver la respuesta
Todavía no. Que le guste a tu equipo prueba poco: te conocen, quieren ayudarte y probablemente no tienen el problema con la intensidad de tu usuario real. Una prueba de valor mide qué hace la gente sin que vos estés cerca, no qué dice cuando le mostrás algo. La pregunta que sí mide es: **"¿qué hacés hoy para resolver esto?"**. Si la respuesta es "nada" o "lo aguanto", no hay problema suficiente. Si ya hacen algo, por torpe que sea, ahí hay valor.
:::

## Dos: separá tu semana

Mirá los próximos siete días y marcá cada bloque como **descubrimiento** o **entrega**. Si todo es entrega, estás construyendo sobre supuestos, por bien que lo estés construyendo.

Un caso para decidir: tenés una tarde libre y una idea con IA. Podés (a) construir la versión completa, o (b) armar una versión de mentira y mostrarla a tres personas. ¿Con cuál aprendés más por hora?

:::Ver la respuesta
La (b), por mucho. Con la (a) tenés más producto, pero también más cosas que defender si resulta que no servía. Con la (b) la inversión es poca y la información es directa. La excepción: si ya tenés evidencia de que el problema existe y es el mismo que el de esas tres personas, la (a) es razonable. Pero esa evidencia tiene que ser un dato y no una corazonada.
:::

## Tres: el patrón propio

La pregunta que incomoda: nombrá una cosa que construiste en los últimos tres meses y que nadie usó. No es para castigarte. Es para encontrar **cuál de los cuatro riesgos no chequeaste**.

Casi siempre es el mismo, en todos los proyectos de una misma persona. Encontrar el tuyo vale más que el libro entero.

## Qué hacer esta semana

Agendá dos conversaciones de veinte minutos con personas que tengan el problema que querés resolver. No les muestres la solución. Preguntales qué hacen hoy y qué es lo que más les molesta de eso. Si no encontrás dos personas con el problema, ya sabés algo importante.
$md$
where idx = 1
  and lang = 'es'
  and for_read_state = 'fresco'
  and book_id = (select id from books where slug = 'inspired');
