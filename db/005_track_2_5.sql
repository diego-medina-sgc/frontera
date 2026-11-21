-- ============================================================
-- Frontera - track fundacional, lecciones 2 a 5
-- ============================================================
-- Escritas para nivel 0 y 1: alguien que nunca uso IA en serio.
-- Sin jerga, sin ingles sin traducir, sin dar nada por sabido.
-- ============================================================

insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'es', null,
  'Por qué inventa cosas',
  'No es un buscador y no tiene una base de datos adentro. Entender qué es cambia para siempre cómo la usás.',
$md$
Casi todos los problemas que la gente tiene con la IA vienen de un malentendido: creer que es un buscador. No lo es, y la diferencia importa.

Un buscador tiene guardadas las páginas y te devuelve la que mejor coincide. Si no la tiene, te dice que no hay resultados.

Esto es otra cosa. Leyó una cantidad enorme de texto y de ahí aprendió cómo se encadenan las palabras: qué suele venir después de qué. Cuando le preguntás algo, no busca la respuesta: **la escribe, palabra por palabra, eligiendo cada vez la que mejor continúa lo anterior.**

Por eso puede escribir un mail que nadie escribió nunca, resumir tu documento o explicarte algo con tus palabras. No está copiando: está construyendo.

## Y por eso también inventa

Si no tiene idea de la respuesta, **no se da cuenta de que no la tiene.** Sigue haciendo lo único que sabe hacer: escribir la continuación más plausible. Y una continuación plausible, con las palabras bien puestas, se parece muchísimo a una respuesta verdadera.

A eso se le dice "alucinar", y es la palabra equivocada porque suena a algo raro y excepcional. No lo es. Es el funcionamiento normal de la herramienta aplicado a un caso donde no sabe.

Lo peligroso no es que se equivoque. Es que **se equivoca con el mismo tono seguro con el que acierta.** No hay señal. No te dice "esto no me lo sé". Te da un nombre, una fecha, un número de teléfono o una cita de un libro, y todo suena igual de convincente.

## Dónde pasa más

Hay un patrón bastante claro. Inventa más cuando le pedís:

- Datos puntuales y verificables: fechas, cifras, nombres propios, precios.
- Citas textuales de libros, leyes o artículos.
- Cosas muy recientes, posteriores a cuando aprendió.
- Información sobre personas o empresas chicas, de las que hay poco escrito.
- Lo que no existe. Si le pedís cinco estudios sobre algo y hay dos, te inventa tres.

Y es mucho más confiable cuando le pedís trabajar sobre algo que vos le diste: resumir tu texto, reescribir tu mail, ordenar tus ideas, explicarte un documento tuyo. Ahí no tiene que recordar nada, tiene el material delante.

## La regla que te llevás

**Si la respuesta es un dato que vas a usar para decidir algo, verificalo.** Siempre, aunque suene perfecto. Sobre todo si suena perfecto.

Y si en algún momento te dice algo con total seguridad y después te enterás de que era falso, no está rota ni te mintió: hizo exactamente lo que hace. El trabajo de saber cuándo confiar es tuyo, y es la habilidad más importante de todas.
$md$,
  8, 'curado'
from lessons l where l.slug = 'f02-por-que-inventa'
on conflict do nothing;

insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'es', null,
  'Cómo pedir bien',
  'La diferencia entre una respuesta inútil y una excelente casi nunca está en la herramienta. Está en lo que pediste.',
$md$
La mayoría de la gente le escribe a la IA como le escribiría a un buscador: tres palabras y enter. Y después concluye que no sirve para nada.

Pedir bien no es un truco ni requiere palabras mágicas. Es darle lo que cualquier persona necesitaría para ayudarte. Son cuatro cosas, y con dos ya mejora muchísimo.

## Uno: para qué es

Lo que más cambia la respuesta no es el tema, es el destino. No es lo mismo "escribime sobre las vacaciones de verano" que "escribime un mensaje para avisarle a las familias del colegio las fechas de las vacaciones, que lo van a leer en el teléfono y tiene que quedar claro en diez segundos".

El segundo tiene destinatario, canal y objetivo. Con eso solo, la respuesta cambia por completo.

## Dos: el contexto que vos tenés y ella no

Acá está el error más común. Vos sabés por qué estás pidiendo esto, qué pasó antes, qué no podés decir, con quién estás hablando. Ella no sabe nada de eso.

Un párrafo de contexto vale más que diez intentos de reformular la pregunta. "Esto es para un cliente que ya se quejó dos veces y está enojado" cambia la respuesta más que cualquier otra cosa que puedas escribir.

## Tres: un ejemplo

Si tenés algo parecido a lo que querés —un mail anterior que te gustó cómo quedó, un texto con el tono que buscás— pegalo y decile "algo así". Es la forma más rápida que existe de transmitir lo que querés y no sabés explicar con palabras.

## Cuatro: la forma

Decí qué querés recibir. Un párrafo, una lista, una tabla, tres opciones, cien palabras. Si no lo decís, te va a dar lo que le parezca, y lo que le parece suele ser más largo de lo que necesitás.

## Lo que no hace falta

No hace falta ser amable, pero tampoco molesta. No hace falta decir "actuá como un experto en marketing con veinte años de experiencia": eso funcionaba hace tiempo y hoy casi no cambia nada. No hace falta escribir bien ni sin errores de tipeo: entiende igual.

## Probalo ahora

Agarrá algo que hayas pedido esta semana y que te haya salido mal. Pedilo otra vez, igual, pero agregando una sola línea: **para qué es y quién lo va a leer.**

Esa línea sola explica la mitad de la diferencia entre la gente que dice que la IA es increíble y la que dice que no sirve.
$md$,
  8, 'curado'
from lessons l where l.slug = 'f03-como-pedir'
on conflict do nothing;

insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'es', null,
  'La primera respuesta no es la respuesta',
  'El error más caro: pedir una vez, mirar lo que salió y decidir ahí si la herramienta sirve.',
$md$
Hay un hábito que separa a la gente que le saca provecho a esto de la que no, y no tiene nada que ver con saber de tecnología.

Los que no le sacan provecho piden una vez, miran el resultado y sacan una conclusión: sirve o no sirve.

Los que sí, tratan la primera respuesta como lo que es: **un borrador para discutir.**

## Por qué el primer intento casi nunca da

No porque la herramienta sea mala. Porque en el primer intento vos tampoco sabías bien lo que querías. Lo descubrís al ver algo concreto y pensar "no, así no". Eso es normal y es cómo funciona pensar: no es un fracaso del pedido.

La diferencia es qué hacés con ese "así no".

## Corregir sirve más que volver a empezar

Mucha gente, cuando no le gusta lo que salió, borra todo y escribe el pedido de nuevo desde cero. Es lo más lento que podés hacer.

Es mucho mejor seguir en la misma conversación y decir qué está mal. La herramienta se acuerda de todo lo anterior: no hace falta repetir nada.

Y decilo como se lo dirías a una persona:

- "Muy largo, la mitad."
- "El tono no va, esto es para familias, no para una empresa."
- "El segundo párrafo está bien, el resto no. Rehacelo alrededor de eso."
- "Demasiado vendedor. Sacale los adjetivos."
- "Está bien pero falta mencionar que es sin costo."

No hace falta explicar por qué ni ser diplomático. Cuanto más directo, mejor sale.

## Tres movidas que funcionan casi siempre

**Pedir opciones.** "Dame tres versiones con tonos distintos." Elegir entre tres es mucho más fácil que explicar lo que querés, y de paso descubrís qué querías.

**Pedir que te pregunte.** "Antes de escribir, preguntame lo que te falte saber." Se da vuelta el ejercicio: en vez de adivinar, te interroga. Para cosas importantes es la mejor jugada que hay.

**Pedir que lo critique.** "Decime qué está flojo de esto." Mirar un texto con ojos críticos es algo que hace bastante bien, y a veces mejor que escribirlo.

## Cuándo sí conviene empezar de nuevo

Hay un caso: cuando la conversación se fue muy lejos y ya corregiste cinco veces, a veces se enreda y empieza a arrastrar errores viejos. Ahí conviene abrir una conversación nueva y arrancar limpio, pegando la mejor versión que lograste como punto de partida.

## Lo que te llevás

Dos o tres idas y vueltas convierten una respuesta mediocre en una buena. Toma dos minutos. La gente que dice que la IA escribe mal, casi siempre, pidió una sola vez.
$md$,
  7, 'curado'
from lessons l where l.slug = 'f04-iterar'
on conflict do nothing;

insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'es', null,
  'Qué puede y qué no',
  'Un mapa honesto de dónde es extraordinaria, dónde es mediocre y dónde directamente no la uses.',
$md$
Esto no es ni "sirve para todo" ni "es un juguete". Tiene una forma bastante definida, y conocerla te ahorra la mayoría de las decepciones.

## Donde es extraordinaria

**Transformar algo que ya existe.** Resumir, reescribir, traducir, cambiar de tono, pasar de desordenado a ordenado, de largo a corto. Acá es mejor que casi cualquier persona y mucho más rápida. Si le das el material, el riesgo de que invente baja muchísimo.

**Sacarte de la hoja en blanco.** El primer borrador de cualquier cosa. No va a ser el final, pero empezar a corregir es infinitamente más fácil que empezar a escribir.

**Explicarte algo a tu nivel.** Podés pedirle que te lo explique como si no supieras nada del tema, y preguntarle todo lo que no entendiste sin que se impaciente ni te haga sentir tonta. Eso, para aprender, no tiene precio.

**Darte opciones y perspectivas.** Diez ideas para un nombre, cinco formas de encarar una conversación difícil, los contraargumentos de tu propia posición.

**Acompañarte en algo que no sabés hacer.** Una planilla, un trámite, una configuración. Podés preguntar paso por paso.

## Donde es mediocre

**Los datos duros.** Fechas, cifras, nombres, precios, leyes. Ya sabés por qué: los construye. Verificá siempre.

**Lo muy reciente.** Lo que pasó esta semana puede no saberlo, o saberlo mal, salvo que la herramienta busque en internet y te muestre de dónde lo sacó.

**Las cuentas.** Para operaciones largas conviene pedirle que te muestre el procedimiento, y verificar los números con una calculadora.

**Tu contexto específico.** No conoce tu empresa, tu familia, tu barrio, tus códigos internos. Lo que sepa de eso es lo que vos le cuentes.

**Las opiniones.** Tiende a darte la respuesta más aceptada y equilibrada. Si buscás una postura filosa, te la va a suavizar salvo que se la pidas explícitamente.

## Donde no

**Decisiones que requieren responsabilidad profesional.** Salud, cuestiones legales, dinero importante. Sirve para entender, para preparar las preguntas, para saber qué consultar. No para decidir.

**Cuando no podés verificar y las consecuencias son serias.** Si no tenés forma de chequear y equivocarte sale caro, no es la herramienta.

## Cómo verificar sin volverte loca

No hace falta verificar todo. Solo lo que cumpla las dos condiciones: **es un dato concreto** y **vas a hacer algo con él.**

Tres formas rápidas:

- Pedirle la fuente y revisarla. Si se la inventó, se nota rápido.
- Buscar el dato suelto en un buscador. Treinta segundos.
- Preguntarle en una conversación nueva, sin contarle lo anterior. Si da otra cosa, no lo sabe.

## Lo que te llevás

La pregunta útil no es "¿se puede confiar?". Es **"¿esto lo puedo verificar y me importa si está mal?"**. Si la respuesta es que no te importa, no pierdas tiempo. Si te importa, verificá.
$md$,
  8, 'curado'
from lessons l where l.slug = 'f05-que-puede-y-que-no'
on conflict do nothing;
