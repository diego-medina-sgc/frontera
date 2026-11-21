-- ============================================================
-- Frontera - Thinking, Fast and Slow (Daniel Kahneman, 2011)
-- ============================================================
-- Sexto libro. Entra con una particularidad: es el caso más claro de
-- "esto que creías ya no es así" de toda la biblioteca, porque una
-- parte del libro no sobrevivió a la crisis de replicación y el propio
-- Kahneman lo reconoció. Eso lo vuelve más útil, no menos.
-- Síntesis propia, sin texto del libro.
-- ============================================================

insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'es', 'no_lei', 1, 'Dos formas de pensar',
$md$
Kahneman ganó un Nobel de Economía siendo psicólogo, por mostrar que la gente no decide como la economía suponía. Este libro es el resumen de cuarenta años de ese trabajo.

La imagen que organiza todo son dos sistemas, que no son lugares del cerebro sino una forma de hablar de dos modos de operar.

**El Sistema 1** es rápido, automático y no se apaga. Reconoce una cara, completa "capital de Francia", siente que algo no cierra antes de que puedas explicar por qué. No te cuesta nada y funciona todo el tiempo.

**El Sistema 2** es lento, deliberado y perezoso. Es el que usás para multiplicar 17 por 24 o para comparar dos propuestas con cuidado. Consume energía, y por eso **se activa lo menos posible**.

## La consecuencia incómoda

La mayor parte de lo que creemos decidir pensando, en realidad lo resuelve el Sistema 1 y el Sistema 2 lo justifica después. No es que seamos tontos: es que el modo barato alcanza casi siempre, y cuando no alcanza, no hay ninguna alarma que avise.

De ahí sale la idea más citada del libro, que Kahneman abrevia como **lo que ves es todo lo que hay**: la mente construye la historia más coherente posible con la información disponible, sin registrar lo que falta. Por eso la confianza que sentís en una conclusión depende de **cuán bien encaja la historia**, no de cuánta evidencia tenés.

## Por qué te importa

Casi todas tus decisiones profesionales son juicios bajo incertidumbre con información incompleta: a qué familia llamar, qué campaña funcionó, si una herramienta nueva sirve. Ese es exactamente el terreno donde el Sistema 1 se equivoca con total seguridad.
$md$, 7
from books b where b.slug = 'thinking-fast-slow'
on conflict do nothing;

insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'es', 'no_lei', 2, 'Los cuatro que más te van a costar plata',
$md$
El libro cataloga decenas de sesgos. Estos cuatro son los que resistieron todas las revisiones posteriores y los que más aparecen en un trabajo como el tuyo.

**Anclaje.** El primer número que aparece contamina todos los juicios siguientes, aunque sea arbitrario y aunque sepas que lo es. Si en una reunión alguien dice "esto debería costar cien mil", todas las estimaciones posteriores van a girar alrededor de ahí. **El antídoto es procedimental, no mental:** que cada uno escriba su número antes de que nadie diga el suyo.

**Encuadre.** La misma información presentada distinto produce decisiones distintas. "Noventa por ciento de retención" y "diez por ciento de deserción" son el mismo dato y no se sienten igual. Esto es tu oficio: lo usás todos los días, y conviene saber cuándo te lo están usando a vos.

**Aversión a la pérdida.** Perder pesa aproximadamente el doble que ganar lo mismo. Explica por qué es tan difícil discontinuar algo que no funciona, y por qué la gente se aferra a lo que ya invirtió aunque sepa que no va a rendir.

**Falacia de la planificación.** Sistemáticamente subestimamos cuánto va a tardar algo, incluso sabiendo que siempre tardó más. Su solución es la mejor del libro: **la vista externa**. En vez de estimar desde adentro —"esto son dos semanas"—, preguntá cuánto tardaron las últimas cinco cosas parecidas. Ese número, que parece pesimista, es el correcto.

## La técnica que vale por el libro entero

El **premortem**, que Kahneman toma de Gary Klein. Antes de arrancar algo, reunís al equipo y decís: *es un año después y esto fracasó. Escriban por qué.*

Funciona porque da permiso para dudar sin quedar como el pesimista del grupo. Toma veinte minutos y saca a la luz lo que todos sospechaban y nadie iba a decir.
$md$, 7
from books b where b.slug = 'thinking-fast-slow'
on conflict do nothing;

insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'es', 'no_lei', 3, 'La parte del libro que se cayó',
$md$
Esto es lo más importante de esta síntesis, y es lo que no vas a encontrar en los resúmenes que circulan.

Una parte del libro **no sobrevivió**. Durante la década siguiente a su publicación, la psicología atravesó una crisis de replicación: muchos experimentos célebres, repetidos con más gente y mejores métodos, dejaron de dar lo que daban.

El capítulo sobre **priming** —la idea de que exponerte a ciertas palabras cambia tu conducta inmediata, como caminar más lento después de leer palabras asociadas a la vejez— es el caso más conocido. Esos resultados no se replicaron. La **depleción del ego** —que la fuerza de voluntad se gasta como un músculo— corrió una suerte parecida.

**Y lo decisivo: Kahneman lo reconoció públicamente.** En 2017 escribió que había confiado demasiado en estudios con muestras chicas y que, sobre esa parte, los lectores no deberían haberle creído. Un Nobel diciendo que un capítulo de su libro más vendido no se sostiene.

## Qué hacer con eso

**No tirar el libro.** Lo que se cayó es una parte acotada. Anclaje, encuadre, aversión a la pérdida, falacia de la planificación y vista externa resistieron y están entre los resultados más sólidos de la psicología.

**Y quedarse con la lección de segundo orden, que es mejor que el libro:** si un texto brillante, de un Nobel, revisado por todo el mundo, tenía un capítulo que no se sostenía, **la pregunta "¿esto todavía es cierto?" hay que hacérsela a todo**, incluidas las cosas que aprendiste bien y hace tiempo.

Es exactamente lo que hace esta app con lo nuevo. Kahneman da el ejemplo perfecto de por qué hace falta.
$md$, 7
from books b where b.slug = 'thinking-fast-slow'
on conflict do nothing;

-- ---------- Para quien lo leyó hace tiempo ----------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'es', 'hace_tiempo', 1, 'Lo que se te borró, y lo que cambió desde entonces',
$md$
**Lo primero que hay que actualizar**, si lo leíste cuando salió: el capítulo de priming y el de depleción del ego no replicaron, y Kahneman lo reconoció públicamente en 2017. Si todavía citás el experimento de caminar lento, convendría dejar de hacerlo.

**Lo que se borra y era central: la vista externa.** No es "sé pesimista". Es reemplazar la estimación desde adentro del proyecto por el dato de proyectos parecidos. Casi nadie la usa porque se siente como no estar pensando, y es justamente el punto.

**La regresión a la media.** Su ejemplo de los instructores de vuelo sigue siendo el mejor: retar al que voló mal parece funcionar y felicitar al que voló bien parece arruinarlo, cuando lo único que pasa es que los extremos tienden a volver al promedio. Si no lo tenés presente, vas a atribuir a tus acciones mejoras y empeoramientos que habrían pasado igual.

**Las fórmulas simples le ganan a los expertos.** En muchas predicciones repetitivas, una regla sencilla con dos o tres variables supera al juicio experto, porque el experto es inconsistente consigo mismo. Es incómodo y está bien documentado.

**El yo que experimenta y el yo que recuerda.** La parte final, la más filosófica y la más olvidada: lo que recordás de una experiencia depende sobre todo del pico y del final, no de su duración. Define cómo evaluás un proyecto, unas vacaciones o un año entero.

**Para ahora:** pensá en la última estimación de plazo que hiciste. ¿La hiciste desde adentro o mirando cuánto tardaron las anteriores?
$md$, 6
from books b where b.slug = 'thinking-fast-slow'
on conflict do nothing;

-- ---------- Para quien lo tiene fresco ----------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'es', 'fresco', 1, 'Aplicado a decidir sobre IA',
$md$
Si lo tenés fresco, el ejercicio más útil no es repasar sesgos: es aplicarlos al terreno donde hoy decidís peor, que es evaluar herramientas de IA. Todos los sesgos del libro aparecen ahí, y de forma especialmente traicionera.

**Lo que ves es todo lo que hay, en estado puro.** Una respuesta de IA se presenta completa, fluida y sin señales de lo que no sabe. No hay huecos visibles, así que tu Sistema 1 la evalúa por coherencia. Y la coherencia es exactamente lo que estos sistemas producen mejor, sepan o no la respuesta.

**Sesgo de confirmación al probar.** Cuando probás una herramienta nueva que te entusiasma, le hacés las preguntas que sabés que va a contestar bien. Después concluís que es excelente. Es el mismo mecanismo por el que todos los modelos nuevos parecen mejores los primeros tres días.

**Anclaje en el primer resultado.** La primera respuesta fija tu criterio de lo que es posible, y las siguientes las juzgás contra eso en vez de contra lo que necesitabas.

**Regresión a la media disfrazada de mejora.** Tocás un prompt porque salió mal, la siguiente sale mejor, concluís que lo arreglaste. Puede que solo haya vuelto a su promedio.

## El ejercicio

Este es el cruce exacto con la lección de evals, y por eso vale: **los veinte casos de prueba son el antídoto contra los cuatro sesgos de arriba al mismo tiempo.** Casos elegidos antes de probar, con respuesta esperada escrita antes de ver el resultado, contados en vez de sentidos.

Kahneman dedica el libro a mostrar que la intuición es inconsistente y que los procedimientos simples la superan. Un eval es ese procedimiento simple. **Si leíste este libro y no medís lo que hacés con IA, no lo aplicaste.**
$md$, 7
from books b where b.slug = 'thinking-fast-slow'
on conflict do nothing;
