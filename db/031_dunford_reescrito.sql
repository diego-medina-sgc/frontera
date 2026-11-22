-- ============================================================
-- Frontera - Obviously Awesome (April Dunford), piezas reescritas
-- ============================================================
-- Las cinco piezas del libro pasan de "te cuento" a "lo practicas":
-- idea, caso trabajado, borde y recuperacion con respuesta escondida.
-- Las de hace_tiempo arrancan por recuperacion activa; la de fresco
-- conecta y aplica. Sintesis propia, casos hipoteticos declarados.
-- Estados reales de la tabla: no_lei, hace_tiempo, fresco.
-- ============================================================

update book_pieces
set
  minutes = 9,
  body_md = $md$
Dunford parte de una observación que cambia dónde mirás cuando algo no prende: **nadie evalúa lo que ofrecés en abstracto. Lo evalúa contra algo.** Y ese algo casi nunca lo elegís vos.

A eso le llama posicionamiento, y conviene decir qué no es: no es el eslogan, ni el tono, ni el logo. Es la respuesta previa a todo eso: **¿qué clase de cosa es esto, y para quién es obviamente mejor que las alternativas?** La misma oferta, ubicada en otra comparación, pasa de cara a barata o de innecesaria a urgente, sin que cambie nada adentro.

## Un caso trabajado (hipotético)

Un colegio que compite por familias tiene jornada extendida con talleres a la tarde. En las visitas, la admisión lo cuenta como "colegio con jornada completa".

Mirá qué comparación dispara esa frase. Las familias lo ponen al lado de los colegios con jornada completa que ya conocen, y la vara pasa a ser lo que esos colegios hacen mejor: tradición, edificio, resultados históricos. Ahí el colegio pierde en casi todo y gana en nada, porque lo que tiene de distinto está enterrado.

Ahora imaginá una familia donde trabajan los dos padres y a las cuatro de la tarde no hay quién retire a los chicos. Para ella, la alternativa real no es otro colegio: es una niñera, la abuela, o un taller externo con traslado. Contra esa alternativa, el mismo colegio es una solución a un problema logístico que le cuesta plata y angustia todos los días. Mismo colegio, otra comparación, otro veredicto.

Fijate en el orden del razonamiento: no se cambió ninguna palabra del folleto. Primero se preguntó contra qué se está comparando de verdad, y recién después se decidió qué decir.

La señal de que el problema es de marco y no de redacción es muy específica: **la gente entiende perfecto qué hacés y aun así no se mueve.** Si no te entienden, falla la claridad. Si te entienden y no les importa, falla la comparación.

## Dónde la idea no aplica

- **No arregla una oferta que realmente es peor.** Reposicionar muestra lo que ya valía; no inventa valor. Si ningún grupo de gente necesita lo tuyo más que lo de las alternativas, no hay marco que lo salve.
- **No es un ejercicio de sentarse a pensar solo.** Las comparaciones reales las hace la gente que elige, no vos. Si tu hipótesis sobre "contra qué te comparan" no la contrastaste con quienes eligen, es una opinión.
- **No reemplaza lo concreto.** Un buen marco sin evidencia de lo que decís (casos, resultados, familias que lo cuenten) se vuelve slogan.

## Probá que lo entendiste

Tres casos. Pensá la respuesta antes de abrirla.

1. Una directora presenta un proyecto de capacitación docente. El Board responde "interesante" y no vota. ¿Falla la claridad o el marco?
2. En el mismo colegio hipotético, dos formas de decirlo: "ofrecemos talleres de arte y deporte" o "resolvemos la tarde de familias que trabajan". ¿Cuál cambia la comparación y cuál solo describe?
3. Un colegio descubre que las familias que se van a otro colegio lo hacen por el precio. ¿Alcanza con bajar el precio para cerrar la fuga?

:::Ver la respuesta
**1. Falla el marco.** "Interesante" quiere decir que entendieron y que no les importa lo suficiente. Si no entendieran, harían preguntas. Lo que falta es saber contra qué lo están comparando (probablemente contra no hacer nada, que es gratis) y qué dolor concreto de alguien resuelve.

**2. La segunda cambia la comparación.** La primera es una lista de atributos y se compara contra cualquier otro colegio con talleres. La segunda nombra un problema y una persona, y se compara contra la niñera o el traslado. Describir y posicionar son cosas distintas.

**3. No necesariamente.** Que se vayan "por el precio" es lo que dicen, pero el precio es una vara que aparece cuando no se ve otro motivo para quedarse. Muchas veces señala que se los compara con un colegio parecido y más barato, o sea, un problema de marco. Bajar el precio sin revisarlo regala margen y mantiene la comparación equivocada.
:::

## Qué hacer esta semana

Elegí una sola cosa tuya que la gente entiende y no le importa: una propuesta, una campaña, un servicio. Escribí en una línea **contra qué la comparan hoy** y preguntale a dos personas que la hayan visto contra qué la compararon ellas. Si las tres respuestas no coinciden, ya encontraste el problema.
$md$
where idx = 1
  and lang = 'es'
  and for_read_state = 'no_lei'
  and book_id = (select id from books where slug = 'obviously-awesome');

update book_pieces
set
  minutes = 9,
  body_md = $md$
Dunford ordena el posicionamiento en cinco componentes, y el orden es la parte que se pasa por alto. Se construye de abajo hacia arriba: cada pieza se apoya en la anterior.

1. **Alternativas reales:** qué haría la gente si lo tuyo no existiera.
2. **Atributos únicos:** qué tenés vos que esas alternativas no tienen.
3. **Valor:** qué logra alguien gracias a esos atributos que antes no podía.
4. **Quién lo necesita tanto que se mueve rápido:** no quién *podría* usarlo.
5. **Categoría:** en qué grupo mental lo ubicás, que fija con qué te comparan y qué se espera de vos.

La pregunta que ordena todo es la primera, y casi nadie la responde bien: **¿qué usaría esta persona si lo mío no existiera?** La respuesta casi nunca es un competidor de nombre y apellido. Suele ser una planilla, un mail, un favor a un colega, o aguantarse.

## Un caso trabajado (hipotético)

Un colegio quiere posicionar su servicio de acompañamiento para familias que llegan de otra ciudad a mitad de año. Armémoslo en orden.

**Alternativas:** no son otros colegios con el mismo servicio, porque casi ninguno lo tiene. Es lo que esas familias hacen hoy: preguntar en un grupo de WhatsApp de padres, consultar a conocidos, resolver solas la mudanza escolar.

**Atributos únicos:** una persona de contacto asignada desde la inscripción, y un recorrido de las primeras semanas ya armado. Verificable: o existe o no existe.

**Valor:** el chico llega con un grupo de referencia y la familia no tiene que averiguar nada. Fijate que "persona de contacto" es atributo; "llegamos sin sentirnos perdidos" es valor. Un folleto que se queda en el atributo parece una ficha técnica.

**Quién se desvive:** no toda familia nueva, sino la que llega sin red local, con hijos en edad de adaptarse con dificultad. Para ella pesa mucho más que para una familia que vive a cuatro cuadras.

**Categoría:** si lo presenta como "servicio extra del colegio", lo comparan con un extra y le piden poco. Si lo presenta como parte de cómo el colegio recibe a quien llega, entra en una categoría donde el estándar lo define el colegio.

Notá que el orden evitó un error típico: empezar por la categoría y recién después preguntarse si había alguien que la necesitara.

## Dónde la idea no aplica

- **Acotar no es esconderse.** Que "quien se desvive" sea un grupo chico no significa negarle el servicio a los demás; significa elegir a quién le hablás primero.
- **El orden no es una receta rígida.** A veces descubrís quién lo ama (4) antes de saber bien cuál es el valor (3). Ahí vas y volvés. Lo que no se negocia es que las cinco respuestas sean consistentes entre sí.
- **No sirve sin gente real que ya lo use.** Los atributos y el valor se descubren mirando a quienes ya te eligen con entusiasmo, no imaginándolos.

## Probá que lo entendiste

1. En cada línea, decidí si es atributo o valor: "tenemos laboratorio de ciencias propio" / "los chicos llegan a la secundaria sabiendo hacer un experimento de punta a punta".
2. Preguntás a familias qué harían si el colegio no existiera, y la respuesta más repetida es "buscar otro igual de cerca de casa". ¿Qué te dice sobre la alternativa real?
3. Tu equipo propone describir el servicio nuevo a *todas* las familias para no perder a nadie. ¿Qué responderías?

:::Ver la respuesta
**1. La primera es atributo, la segunda es valor.** El laboratorio es algo que existe; lo que cambia en la vida de alguien es lo que logra con él. Las dos hacen falta, pero el valor es lo que sostiene la comparación.

**2. La alternativa real es la cercanía, no otro proyecto educativo.** Entonces la competencia se juega en el barrio y en el traslado, y un mensaje sobre tu propuesta pedagógica le habla a una pregunta que esa familia no está haciendo todavía.

**3. Que un mensaje para todos no le resulta obvio a nadie.** Hablarle a quien lo necesita mucho no te quita las demás familias; hace que el mensaje sea nítido para quien más lo busca. Después, el servicio igualmente está disponible para el resto.
:::

## Qué hacer esta semana

Elegí un servicio o programa tuyo y respondé solo la primera pregunta, por escrito: **¿qué hace hoy la gente si esto no existe?** No pienses lo que te gustaría que hicieran; preguntale a tres personas que lo usan o que lo rechazaron. Dejá las otras cuatro piezas para después de tener esa respuesta.
$md$
where idx = 2
  and lang = 'es'
  and for_read_state = 'no_lei'
  and book_id = (select id from books where slug = 'obviously-awesome');

update book_pieces
set
  minutes = 8,
  body_md = $md$
La idea ya la viste: posicionar es decidir con qué te comparan, y se arma con alternativas reales, atributos únicos, valor, quién lo necesita mucho y categoría. Esta pieza es para que el método te quede probándolo sobre un objeto concreto: **esta misma app, Frontera.**

## El caso trabajado

**Alternativa real.** ¿Qué usarías si Frontera no existiera? No otra app de aprendizaje. Usarías lo que ya usabas: seguir cuentas en redes, abrir una newsletter cuando hay tiempo, anotarte en un curso que no terminás, preguntarle a una IA cuando aparece la duda. Todo eso es gratis y ya está instalado.

**Atributo único.** Sabe en qué nivel estás y qué ya viste, así que no te explica lo que no necesitás, y filtra por novedad real y no por popularidad.

**Valor.** Dejar de perder tiempo en lo que no te suma y dejar de tener la sensación de que algo importante se te pasó. Atributo: "sabe tu nivel". Valor: "no se te pasa lo importante".

**Quién lo necesita mucho.** No cualquiera que use IA. Alguien que ya pasó la curiosidad, que construye cosas y siente la ansiedad concreta de quedarse atrás. A alguien en el nivel más inicial le sirve otra cosa antes.

**Categoría.** Si se la llama "app de cursos", la comparan con plataformas gratuitas enormes y pierde. Si se la llama "newsletter personalizada", la comparan con algo que es gratis. La categoría honesta es más parecida a **un radar con tutor**, que no existe como categoría, y crearla es la opción más cara: hay que educar al mercado antes de vender.

Sirve para ver algo que Dunford marca: no hay categoría gratis. O encajás en una que ya existe y heredás sus comparaciones, o creás una y asumís el costo de explicarla.

## Dónde la idea no aplica

- **No es un veredicto.** Que la categoría "radar con tutor" sea la honesta no prueba que convenga; lo que prueba es que las otras dos perjudican. Decidir cuál usar depende de cuánto cuesta explicarla frente a cuánta gente la necesita.
- **Está hecho con información propia.** Para Frontera la alternativa real es una suposición razonable; para algo tuyo, tiene que salir de lo que hace la gente que hoy te elige o te rechaza.
- **No resuelve la ejecución.** Un posicionamiento claro de algo que funciona mal solo acelera que se note.

## Probá que lo entendiste

1. Clasificá en atributo o valor: "tiene un resumen semanal" / "no tenés que leer todo para estar al día".
2. Un colega dice: "lo posicionemos como la mejor app de aprendizaje de IA". Desde el método, ¿qué le falta a esa frase?
3. Para decidir entre "radar con tutor" (categoría nueva) y "newsletter personalizada" (existente), ¿qué dato necesitarías antes de elegir?

:::Ver la respuesta
**1. Atributo y valor, en ese orden.** El resumen semanal es algo que tiene; no tener que leer todo es lo que la persona logra. Si el mensaje solo dice lo primero, hay que adivinar para qué sirve.

**2. Le falta casi todo.** "La mejor" no dice contra qué (qué alternativa), para quién (quién lo necesita mucho) ni por qué (qué atributo). Es una aspiración, no un posicionamiento, y cualquiera podría decirla.

**3. Cuánta gente ya tiene el problema sin saber cómo se llama.** Una categoría nueva solo sirve si hay quienes la necesitan y no la tienen resuelta. Si ya existen muchos que la buscan, nombrarla es barato; si hay que explicarles el problema, es caro. Eso se mide hablando con ellos, no pensando.
:::

## Qué hacer esta semana

Hacé el mismo recorrido con **algo tuyo** en una hoja: alternativa real, atributo, valor, quién lo necesita, categoría. Dejá una columna aparte con una pregunta: ¿esto lo sé o lo supongo? Todo lo que quede en "supongo" es lo que tenés que validar hablando con alguien antes de tocar un solo texto.
$md$
where idx = 3
  and lang = 'es'
  and for_read_state = 'no_lei'
  and book_id = (select id from books where slug = 'obviously-awesome');

update book_pieces
set
  minutes = 7,
  body_md = $md$
Hace tiempo que lo leíste. Antes de mirar nada, reconstruí: tapá la pantalla si hace falta y respondé en voz alta o por escrito.

## Reconstruí primero

1. ¿Cuál es la señal específica de que el problema es el posicionamiento y no el mensaje?
2. ¿Cuáles son los cinco componentes, en el orden en que se construyen?
3. ¿Por qué acotar el público a quien más lo necesita suele ser lo contrario de perder mercado?
4. ¿Qué dice la categoría de una oferta, además de su nombre?

:::Ver la respuesta
**1.** Te entienden perfecto y no se mueven. Si no te entendieran, el problema sería de claridad. Entender sin que importe apunta al marco: con qué te comparan.

**2.** Alternativas reales, atributos únicos, valor de esos atributos, quién lo necesita tanto que se mueve rápido, y categoría. El orden importa porque cada paso se apoya en el anterior: elegir categoría antes de saber para quién es el valor es adivinar.

**3.** Porque un mensaje para todos no le resulta obvio a nadie, y lo que se busca es que a alguien le resulte obvio. Quienes más lo necesitan lo adoptan rápido, lo cuentan y hacen de referencia para el resto.

**4.** Fija con qué te comparan, cuánto se espera que cuestes, qué funciones se dan por sentadas y cuáles son un extra. Es un conjunto de expectativas, no una etiqueta, y por eso es la decisión más cara y la que más se toma sin pensar.
:::

Si fallaste en el 1, repasá ese: es el que más rinde, porque te dice cuándo ponerte a trabajar sobre el marco y cuándo no tocar nada.

## Una más, de aplicación

5. Una campaña de admisión viene con buen alcance y pocas consultas, y el equipo propone rehacer los textos. Con lo que recordaste, ¿qué mirarías antes?

:::Ver la respuesta
**Mirarías con qué la están comparando las familias que la vieron.** Si entienden la propuesta y no consultan, reescribir textos es arreglar el síntoma. Hablá con unas pocas familias que vieron la campaña y no escribieron, y preguntales qué alternativa tenían en la cabeza. Si la respuesta no es la que suponías, el trabajo es de marco, y ningún texto lo arregla.
:::

## Qué envejeció

El libro es de 2019 y se nota en dos cosas, sin que la lógica de fondo cambie.

- **Los ejemplos son de software.** Muchos vienen de empresas de producto y se leen como si todo se vendiera con una demostración. El método sirve igual para un servicio educativo, una propuesta interna o una campaña, pero el caso hay que traducirlo.
- **La alternativa real se movió.** Hoy una de las alternativas más fuertes de casi cualquier producto o servicio es "preguntarle a una IA". Si respondés la pregunta de Dunford ("¿qué usarían si lo mío no existiera?") sin incluir esa opción, tu lista probablemente esté desactualizada.

Lo que **no** envejeció: que la comparación la eligen ellos si no la elegís vos, y que el posicionamiento se revisa. El que hiciste hace dos años puede ser el que frena lo de hoy.

## Qué hacer esta semana

Tomá el posicionamiento de algo que lanzaste hace más de un año y respondé de nuevo, por escrito, la pregunta de las alternativas reales, esta vez con la IA como opción. Si la lista cambia, probablemente cambie con qué te comparan, y hay que revisar el resto.
$md$
where idx = 1
  and lang = 'es'
  and for_read_state = 'hace_tiempo'
  and book_id = (select id from books where slug = 'obviously-awesome');

update book_pieces
set
  minutes = 7,
  body_md = $md$
Si lo tenés fresco, repasarlo rinde poco. Rinde más llevarlo al lugar donde casi nadie lo usa: **la propuesta interna.**

El posicionamiento se suele pensar hacia clientes, pero la misma mecánica manda cuando presentás algo adentro de una organización: al Board, a dirección, a un comité. Ahí también te comparan contra algo, y si no lo elegís vos, lo eligen ellos.

## Aplicarlo a tu próxima propuesta

Con una propuesta real en la cabeza, pasá por las piezas del método.

- **Alternativa real.** Si no aprueban esto, ¿qué pasa? Casi nunca es "aprueban otra cosa". Casi siempre es seguir como están, que es gratis, no tiene riesgo y no obliga a nadie a defender nada. Ese es tu competidor, y es duro.
- **Categoría.** ¿Como qué lo van a leer: gasto, inversión, experimento, riesgo reputacional? La categoría define con qué lo comparan. El mismo proyecto presentado como "gasto de tecnología" compite contra otros gastos; presentado como "menos carga operativa para un equipo chico", compite contra el statu quo, que es donde querés pelear.
- **Quién lo necesita mucho.** En una organización no alcanza con que sea bueno para la institución. Tiene que haber alguien concreto a quien le resuelva un dolor propio, que lo empuje cuando vos no estés en la sala.

## Recuperá antes de seguir

Un ejemplo hipotético: proponés un sistema para ordenar el seguimiento de familias interesadas. Antes de abrir, respondé:

1. ¿Cuál es la alternativa real?
2. Dos formas de nombrar la propuesta: "una herramienta de gestión" o "que ninguna familia interesada quede sin respuesta en 48 horas". ¿Cuál mejora tu posición, y por qué?
3. ¿Quién puede ser la persona que lo necesita mucho?

:::Ver la respuesta
**1. Seguir con el seguimiento actual:** mails sueltos, planillas, memoria de quien atiende. Es gratis y funciona a medias, que es justo lo que hace difícil el cambio: no hay una crisis que obligue.

**2. La segunda.** "Herramienta de gestión" cae en la categoría de gasto de tecnología y se compara con otros gastos. La segunda nombra un resultado que cualquiera en el Board entiende, y lo compara con el costo de perder a una familia por no contestar a tiempo.

**3. Quien hoy contesta las consultas** y se la rebusca con lo que hay, o quien responde por el número de ingresos. Es alguien con un dolor diario concreto. Si no aparece nadie así, la propuesta no tiene quién la defienda, y eso conviene saberlo antes de presentar.
:::

## Dónde no aplica

- **No es manipulación.** Cambiar la categoría solo funciona si es honesta: si el proyecto no reduce la carga del equipo, decirlo no sirve y se nota.
- **No todas las propuestas lo necesitan.** Una decisión chica y evidente no requiere esta artillería.

## Qué hacer esta semana

Escribí en tres líneas tu próxima propuesta: **alternativa real** (qué pasa si no se aprueba), **categoría** (cómo querés que la lean) y **quién la empuja**. Si la tercera línea queda vacía, conseguí esa persona antes de armar el documento.
$md$
where idx = 1
  and lang = 'es'
  and for_read_state = 'fresco'
  and book_id = (select id from books where slug = 'obviously-awesome');
