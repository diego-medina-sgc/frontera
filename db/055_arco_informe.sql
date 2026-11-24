-- ============================================================
-- Frontera - segundo arco: el informe de todos los meses
-- ============================================================
-- Misma forma que 053: cinco dias, uno por dia, que terminan con algo
-- armado y guardado. El esquema de arcos ya existe (053).
--
-- Por que este: el informe mensual es la otra tarea que casi todos
-- repiten, y es donde la IA mas dano hace si se usa mal: inventa
-- numeros con la misma prolijidad con la que escribe los ciertos. El
-- arco ensena a que lea los datos en vez de adivinarlos, a comparar en
-- vez de describir, y a poner lo que solo sabe la persona.
-- ============================================================

insert into lessons (slug, topic_id, kind, level_floor, level_ceiling, track_order, published, arc, arc_day)
select v.slug, t.id, 'arco', 0, 2, null, true, 'informe-mensual', v.dia
from (values
  ('a2-informe-mensual-1', 'como-pedir',  1),
  ('a2-informe-mensual-2', 'archivos',    2),
  ('a2-informe-mensual-3', 'modalidades', 3),
  ('a2-informe-mensual-4', 'contexto',    4),
  ('a2-informe-mensual-5', 'contexto',    5)
) as v(slug, topico, dia)
join topics t on t.slug = v.topico
on conflict (slug) do nothing;

-- ------------------------------------------------------------
-- Dia 1
-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'es', null,
  'Desarmá el informe que hacés todos los meses',
  'Hay un informe que armás todos los meses y que te come una tarde. Esta semana lo dejás armado. Hoy no se usa la IA: hoy se mira qué partes tiene, porque no todas se pueden delegar.',
$md$
El informe de admisiones, el de ventas, el de entregas, el resumen para la reunión de dirección. Cambia el nombre, pero la escena es la misma: a fin de mes abrís la planilla, sacás los números, los comparás con el mes anterior, escribís qué pasó y lo mandás. Tres horas que se van sin que nadie las vea.

Esta semana lo vas a dejar armado, un día por vez, para que el mes que viene te lleve menos de una hora. Pero hay una trampa que conviene ver antes de empezar: **en un informe, la IA puede hacer mucho daño sin que se note.** Escribe un número inventado con la misma prolijidad que uno cierto.

Por eso hoy no se usa. Hoy se desarma el informe para saber qué parte le toca a quién.

## Un informe tiene tres partes

1. **Los números.** Cuántos, cuánto, qué porcentaje. Salen de una planilla o de un sistema. La IA no los tiene que calcular de memoria ni suponer: los tiene que **leer** de algo que vos le das.
2. **La lectura.** Qué cambió respecto del mes pasado, qué es raro, qué se repite. Esto la IA lo hace bien, siempre que tenga los números de los dos meses.
3. **El porqué y el qué hacemos.** Por qué bajaron las consultas, qué se decide. Esto casi nunca está en la planilla: está en tu cabeza. Hubo un feriado largo, cambió la campaña, se fue alguien del equipo. **Es la parte que sólo vos podés poner.**

La IA te puede ahorrar casi todo el trabajo de las dos primeras. La tercera es tuya, y es la que hace que el informe valga algo.

## Un caso trabajado

El informe mensual de admisiones de un colegio. Cuatro secciones: consultas recibidas, visitas, inscripciones y un párrafo de comentarios para la reunión de dirección.

Cuánto lleva hoy:

- Sacar los números de la planilla y armar la tabla: **sesenta minutos**.
- Comparar con el mes anterior y escribir qué pasó: **noventa minutos**.
- Releer, dar formato y mandar: **treinta minutos**.

Son **ciento ochenta minutos por mes**, tres horas. Lo que se puede delegar es casi todo lo del medio, que es lo más largo: escribir la comparación. Lo que no se delega es el párrafo de comentarios, porque ahí va lo que nadie más sabe.

Anotá ese número. El viernes lo vas a volver a medir.

## El borde: cuándo no hace falta

- **Si el informe es sólo una tabla.** Si lo que mandás es la planilla exportada, sin texto, la IA no agrega nada. Para eso alcanza con la planilla.
- **Si los números no están en ningún lado.** Si los sacás contando a mano, de mails sueltos o de memoria, el problema no es la redacción: es que no hay datos. Primero va una planilla.
- **Si lo lee una sola persona que prefiere hablarlo.** A veces el mejor informe es una conversación de diez minutos.

## Probá que lo entendiste

En el informe de un área de entregas aparecen estas tres frases. ¿Cuál puede escribir la IA, cuál puede escribir si le das algo, y cuál es tuya?

1. "En octubre se hicieron 412 entregas, un 8 % menos que en septiembre."
2. "La baja se explica por los dos días de paro de transporte."
3. "Las entregas con demora bajaron de 31 a 19."

:::Ver la respuesta
**La 1 y la 3 las puede escribir, pero sólo si le das la planilla de los dos meses.** Son números y comparaciones: si no tiene los datos, los inventa, y quedan igual de prolijos.

**La 2 es tuya.** La planilla no dice que hubo paro. Si la IA la escribe sola, es una suposición disfrazada de explicación. Lo que sí puede hacer es dejarte el lugar: "posible causa: completar".
:::

## Para hoy

1. Agarrá el último informe que mandaste y marcá con tres colores: lo que son números, lo que es lectura y lo que es porqué y decisiones.
2. Anotá cuánto tiempo te lleva cada parte. La cuenta en minutos, por mes.
3. Fijate de dónde salen los números. Si están en una planilla, guardá la del último mes y la del anterior: mañana las vas a usar. **Si tienen nombres de personas, mañana vemos cómo sacarlos.**

## La regla que te llevás

**La IA lee números y escribe comparaciones. El porqué lo ponés vos.** Un informe donde la IA puso el porqué es un informe que inventó algo.
$md$,
  7, 'curado'
from lessons l where l.slug = 'a2-informe-mensual-1'
on conflict do nothing;

-- ------------------------------------------------------------
-- Dia 2
-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'es', null,
  'Que lea la planilla, no que la adivine',
  'El error más caro con un informe es un número inventado que nadie chequea. Hoy aprendés a darle los datos de forma que los lea bien, y a comprobarlo antes de que escriba una línea.',
$md$
Le pegaste a la IA un pedazo de la planilla y le pediste "armá el informe del mes". Te devolvió tres párrafos prolijos con porcentajes. Uno de esos porcentajes no sale de ningún lado: no estaba en lo que pegaste, lo completó porque "quedaba bien".

No es mala intención. Si le falta un dato para que el texto cierre, lo rellena. Por eso el trabajo de hoy no es pedir el informe: es **darle los datos de forma que no tenga que rellenar nada**, y comprobar que los leyó bien.

## Cómo darle la planilla

1. **Una sola tabla.** Una pestaña, una fila de títulos arriba, un dato por celda. Las celdas combinadas, los títulos en dos filas y los subtotales mezclados en el medio son las causas más comunes de lecturas equivocadas.
2. **Los dos meses.** El actual y el anterior, en la misma tabla o en dos columnas. Sin el anterior no puede comparar, y si no puede comparar, inventa la comparación.
3. **Sin datos de personas.** Si la planilla tiene nombres, mails o documentos, sacá esas columnas antes. Para un informe mensual casi nunca hacen falta: hacen falta los totales. Y antes de subir datos de la institución a cualquier herramienta, fijate qué permite tu organización.
4. **Subila como archivo** si tu herramienta lo permite. Pegar desde la planilla a veces desarma las columnas.

## Antes de escribir, que te diga qué ve

Este es el paso que casi nadie hace y que más errores ataja. Antes de pedir el informe, pedí esto:

"Antes de escribir nada, decime qué columnas tiene la tabla, cuántas filas, y el total de cada columna numérica para cada mes."

Son treinta segundos. Comparás esos totales con los de tu planilla. Si coinciden, la leyó bien y podés seguir. Si no coinciden, encontraste el problema **antes** de que esté escondido adentro de un párrafo.

## Un caso trabajado

La planilla de admisiones tiene una fila por consulta: fecha, canal, curso de interés y si hizo visita. El pedido de verificación devolvió:

- Columnas: fecha, canal, curso, visita. Bien.
- Octubre: 96 consultas, 38 visitas. Bien, coincide con la planilla.
- Septiembre: 104 consultas.

En la planilla, septiembre tenía **120**. La diferencia: dieciséis filas de septiembre tenían la fecha escrita como texto ("15 de sept.") y no como fecha, y no las contó. Se arregló el formato, se volvió a pedir la verificación y dio 120.

Si se hubiera pedido el informe directamente, habría dicho "las consultas bajaron un 8 %" cuando en realidad bajaron un 20 %. Un informe prolijo, con un número que cambia la conversación en la reunión.

## El borde: lo que la verificación no ataja

- **Si el dato está mal en la planilla**, la IA lo va a leer perfecto y va a estar igual de mal. La verificación chequea la lectura, no la fuente.
- **Las planillas muy grandes** pueden leerse a medias sin aviso. Si tenés miles de filas, conviene darle la tabla ya resumida por mes, no las filas sueltas.
- **Los totales que calculó ella** también se chequean. Si un total no coincide por poco, no es redondeo: es una fila que no leyó.

## Probá que lo entendiste

Pediste la verificación y te devolvió: "La tabla tiene 3 columnas y 214 filas. Total de ventas: 1.284.500." En tu planilla hay 4 columnas y 220 filas, y el total es 1.301.200. ¿Qué hacés?

1. Seguís: la diferencia es chica, menos del 2 %.
2. Le pedís que corrija el total y seguís.
3. Buscás qué columna y qué filas no leyó antes de seguir.

:::Ver la respuesta
**La 3.** Le faltan una columna y seis filas: no es un error de cuenta, es una lectura incompleta. Si le pedís que "corrija el total", va a escribir el número que le diste sin haber leído las filas que faltan, y todo lo demás del informe va a seguir saliendo de una tabla incompleta.

Casi siempre es formato: una columna con un título raro, filas con celdas combinadas o con un dato escrito como texto. Se arregla en la planilla y se vuelve a verificar.
:::

## Para hoy

1. Prepará la planilla de los dos últimos meses: una tabla, una fila de títulos, sin datos de personas.
2. Dásela a tu herramienta y pedí la verificación: columnas, filas y totales por mes.
3. Compará los totales con los tuyos. Si no coinciden, buscá por qué y arreglalo en la planilla. **No le pidas el informe todavía.**

## La regla que te llevás

**Antes de que escriba, que te diga qué leyó.** Un total que no coincide es un informe equivocado que todavía no escribiste.
$md$,
  7, 'curado'
from lessons l where l.slug = 'a2-informe-mensual-2'
on conflict do nothing;

-- ------------------------------------------------------------
-- Dia 3
-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'es', null,
  'Comparar, no describir',
  'Ya lee bien los datos. Hoy le pedís lo que de verdad sirve de un informe: no qué pasó, sino qué cambió. Y aprendés cuándo un porcentaje miente.',
$md$
Si le pedís "escribí el informe de octubre", te va a describir octubre: hubo tantas consultas, tantas visitas, tantas inscripciones. Es correcto y no le sirve a nadie, porque quien lo lee ya podía mirar la tabla.

Lo que alguien quiere saber de un informe es **qué cambió y si importa**. Eso es comparar, y hay que pedirlo así.

## El pedido que compara

Con la tabla ya verificada, pedí cuatro cosas:

1. **Las tres variaciones más grandes** respecto del mes anterior, con el número de antes, el de ahora y la diferencia.
2. **Una relación entre dos números**, no sólo cada número suelto. En admisiones, por ejemplo: de cada cien consultas, cuántas terminaron en visita.
3. **Lo que no cambió y debería haber cambiado.** Si hubo una campaña nueva y las consultas quedaron iguales, eso también es una noticia.
4. **Las posibles causas marcadas como hipótesis**, con la palabra "hipótesis" adelante. No como hechos.

La cuarta es la que protege lo que viste ayer: la IA va a querer explicar. Que explique está bien, siempre que quede claro que está adivinando, y que la explicación final la pongas vos.

## Un caso trabajado

Los números de admisiones:

- Consultas: 120 en septiembre, 96 en octubre. **Bajaron 24, un 20 %.**
- Visitas: 40 y 38. Bajaron 2, un 5 %.
- Inscripciones: 12 y 15. **Subieron 3.**

Una descripción diría: "Las consultas bajaron un 20 %". Suena a problema.

La comparación entre números dice otra cosa. En septiembre, de cada cien consultas, 33 llegaron a visita (40 de 120). En octubre, casi 40 (38 de 96). **Llegaron menos consultas, pero mejores**: una proporción mayor terminó viniendo al colegio. Con esa lectura, la reunión discute otra cosa: no "qué pasó con las consultas", sino "qué hicimos distinto que atrajo menos consultas pero más interesadas".

Fijate en las inscripciones: se escribió "subieron 3" y no "subieron un 25 %". Eso es el borde de hoy.

## El borde: cuándo un porcentaje miente

Con números chicos, los porcentajes exageran. Pasar de 12 a 15 es un 25 % más, y suena a un salto. Son tres familias. Pasar de 2 a 4 bajas es un 100 % más, y suena a catástrofe. Son dos.

Una regla práctica: **si los números son menores que veinte, decí la diferencia en unidades, no en porcentaje.** Y pedíselo así a la IA, porque por defecto va a poner porcentajes en todo.

Lo mismo con los promedios de escalas. Si la satisfacción pasó de 4,1 a 4,3 sobre 5, decir "subió un 5 %" no significa nada. Se dice "subió dos décimas".

## Probá que lo entendiste

¿Cómo conviene decir cada variación en el informe?

1. Llamadas recibidas: de 300 a 240.
2. Bajas de alumnos: de 2 a 4.
3. Satisfacción promedio: de 4,1 a 4,3, sobre 5.

:::Ver la respuesta
**1. "Bajaron un 20 %, de 300 a 240."** Son números grandes: el porcentaje informa, y conviene poner también los dos números.

**2. "Hubo dos bajas más que el mes anterior: cuatro contra dos."** Decir "aumentaron un 100 %" sería técnicamente cierto y alarmaría por nada.

**3. "Subió dos décimas, de 4,1 a 4,3."** En una escala, el porcentaje no tiene sentido. Lo que importa es cuánto se movió y si eso es mucho para esa escala.
:::

## Para hoy

1. Con la tabla verificada de ayer, pedí las cuatro cosas: las tres variaciones más grandes, una relación entre dos números, lo que no cambió y las hipótesis marcadas.
2. Agregá al pedido: "Si un número es menor que veinte, la diferencia va en unidades, no en porcentaje."
3. Leé las hipótesis y tachá las que sabés que no son. Anotá al lado cuál es la causa real, si la sabés. Mañana eso entra en la receta.

## La regla que te llevás

**Un informe no cuenta qué pasó: cuenta qué cambió y si importa.** Y con números chicos, la diferencia se dice en unidades.
$md$,
  7, 'curado'
from lessons l where l.slug = 'a2-informe-mensual-3'
on conflict do nothing;

-- ------------------------------------------------------------
-- Dia 4
-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'es', null,
  'La receta del informe, y lo que sólo vos sabés',
  'Hoy juntás todo en una receta que sirve todos los meses. Tiene una parte que no tenía la del mail: un espacio para lo que pasó y no está en ningún dato.',
$md$
Si hiciste el arco del mail, la idea te va a sonar: un texto que se escribe una vez, con todo lo que no cambia, y un hueco para lo que cambia. Si no lo hiciste, no importa: acá está entero.

La receta del informe tiene una diferencia importante. En el mail, el hueco eran los datos del caso. En el informe, el hueco tiene **dos partes**: la planilla del mes y lo que pasó ese mes que la planilla no dice.

## Las partes de la receta

1. **Para qué es y quién lo lee.** "Informe mensual de admisiones para la reunión de dirección. Lo leen en cinco minutos antes de la reunión: tiene que dejar claro qué cambió y qué hay que discutir."
2. **La estructura fija.** Las secciones, en orden, con el largo de cada una. "Uno: tres variaciones principales, una línea cada una. Dos: la proporción de consultas que llegan a visita. Tres: hipótesis, marcadas. Cuatro: lo que hay que discutir, vacío para completar."
3. **Las reglas.** Las que aprendiste estos días. "Antes de escribir, verificar columnas, filas y totales por mes, y mostrármelos." "Números menores que veinte, en unidades." "Toda causa que no esté en el contexto va como hipótesis." "Ningún adjetivo sin número: nada de crecimiento importante."
4. **Un informe anterior como ejemplo.** El último que mandaste y que te gustó, para que copie el tono y el largo.
5. **El hueco.** Dos líneas: "Planilla del mes: adjunta." y "Lo que pasó este mes:".

## Lo que sólo vos sabés

La última línea del hueco es la que cambia todo. Ahí van tres o cuatro renglones con lo que pasó y no está en la planilla:

- "Hubo un feriado largo la segunda semana."
- "Desde el 10 cambió la campaña: menos alcance, más segmentada."
- "Una persona del equipo estuvo de licencia diez días."

Con eso, las hipótesis dejan de ser adivinanzas: la IA puede conectar "menos consultas, pero mejores" con "campaña más segmentada", y escribirlo como lo que es, una relación que vos le diste. Lo que no puede conectar con nada de lo que pusiste, lo deja marcado como hipótesis.

## Un caso trabajado

El informe de octubre con la receta completa, la planilla y estas tres líneas de contexto: feriado largo, campaña nueva desde el 10, una persona de licencia.

El resultado vino con la verificación primero: 96 y 120 consultas, 38 y 40 visitas. Coincidían. Después, las tres variaciones con sus números, la proporción de visitas, y esta línea: "La caída de consultas coincide con el cambio de campaña del 10, que buscaba menos alcance y más interesados; la proporción de visitas subió de 33 a casi 40 de cada cien." Y una sola hipótesis marcada: "Hipótesis: el feriado pudo concentrar consultas en la semana siguiente; no hay datos por semana para confirmarlo."

Dos correcciones: un número con decimales de más y una frase larga. Ninguna de datos.

## El borde: el contexto que se vuelve opinión

El espacio de "lo que pasó" es para hechos, no para conclusiones. Si escribís "la campaña nueva funcionó muy bien", la IA lo va a repetir con convicción, y el informe va a afirmar algo que los números quizás no muestran. Escribí lo que pasó, no lo que pensás que significa: "cambió la campaña el 10". La conclusión la saca el informe, a la vista, con los números al lado.

## Probá que lo entendiste

¿Cuáles de estas líneas van en "lo que pasó este mes" tal como están?

1. "El sistema de inscripción estuvo caído del 3 al 5."
2. "El equipo trabajó muy bien a pesar de todo."
3. "Se sumó un canal nuevo, el formulario de la web, desde el 15."
4. "La baja de consultas no es preocupante."

:::Ver la respuesta
**Van la 1 y la 3.** Son hechos con fecha, que la planilla no muestra y que pueden explicar un número.

**La 2 y la 4 no.** Son opiniones. La 2 no explica ningún dato. La 4 es justamente la conclusión que el informe tiene que mostrar con números, y si la ponés como contexto, la IA la va a afirmar sin mostrar nada. Si creés que la baja no es preocupante, el informe tiene que dejar que se vea por qué: por ejemplo, con la proporción de visitas.
:::

## Para hoy

1. Escribí tu receta con las cinco partes. Pasá a reglas todo lo que corregiste estos días.
2. Escribí tres o cuatro líneas de lo que pasó el último mes: sólo hechos, con fecha si la tienen.
3. Probala entera: receta, planilla y contexto, en una conversación nueva. Chequeá que empiece por la verificación y que los totales coincidan.

## La regla que te llevás

**La planilla dice qué pasó. Vos sabés por qué. El informe necesita las dos cosas, y la segunda no la puede poner nadie más.**
$md$,
  7, 'curado'
from lessons l where l.slug = 'a2-informe-mensual-4'
on conflict do nothing;

-- ------------------------------------------------------------
-- Dia 5
-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'es', null,
  'Dejalo listo para el mes que viene, y medí',
  'Último día. Hoy guardás la receta donde la vas a encontrar en un mes, armás la rutina de cuatro pasos y volvés a hacer la cuenta del lunes.',
$md$
El mail se usa todos los días, así que la receta queda a mano sola. El informe es distinto: lo vas a volver a hacer **en un mes**. Para entonces no te vas a acordar dónde quedó la receta, qué tenía la planilla ni qué paso venía primero. Por eso hoy no alcanza con guardarla: hay que dejar armada la rutina.

## Dónde se guarda

Igual que con cualquier receta: en un proyecto de ChatGPT o un GPT propio, en un proyecto de Claude, o en un Gem de Gemini. Ahí van las instrucciones de la receta y, si la herramienta lo permite, el informe anterior como archivo de ejemplo.

Ponele el nombre del informe tal cual lo decís: "Informe mensual de admisiones". Y anotá en tu calendario, el día que lo armás cada mes, un recordatorio con el nombre del proyecto. Es la forma más simple de que dentro de un mes no empieces de cero.

## La rutina de cuatro pasos

1. **Preparar la planilla.** El mes nuevo y el anterior, una tabla, sin datos de personas.
2. **Escribir lo que pasó.** Tres o cuatro líneas de hechos.
3. **Abrir el proyecto y darle las dos cosas.** La receta ya está adentro.
4. **Revisar.** Que los totales de la verificación coincidan con los tuyos, que las causas que no diste estén marcadas como hipótesis, y completar la sección de lo que hay que discutir.

El cuarto paso no se saltea nunca. Es lo que te deja firmar el informe tranquilo.

## Un caso trabajado: la cuenta del lunes

El lunes la cuenta era ciento ochenta minutos por mes: una hora de números, una hora y media de escritura y media hora de revisión.

Con la rutina armada, el informe del mes siguiente llevó:

- Preparar la planilla: **quince minutos**.
- Escribir lo que pasó: **cinco minutos**.
- Revisar totales e hipótesis: **veinte minutos**.
- Ajustar y completar lo que hay que discutir: **diez minutos**.

Son **cincuenta minutos**. Contra ciento ochenta, son **ciento treinta minutos por mes**. En doce meses, mil quinientos sesenta minutos: **veintiséis horas por año**, con un solo informe.

Y la parte que más tiempo ganó no es la que más importa. Lo que más cambió es que el informe ahora **compara**, separa hechos de hipótesis y no tiene números que nadie chequeó. Es más corto de hacer y mejor de leer.

## El borde: lo que no se delega nunca

Ahora que funciona, va a ser tentador saltear la revisión "porque siempre sale bien", o pedirle que complete también qué hay que discutir. No lo hagas.

- **La revisión de los totales** es lo único que te protege del error que no se ve. Un mes la planilla va a venir con un formato distinto y la lectura va a fallar en silencio.
- **Lo que hay que discutir** es una decisión sobre qué importa. Si lo escribe la IA, el informe deja de ser tuyo y la reunión discute lo que eligió una herramienta.

## Probá que lo entendiste

Alguien tardaba cuatro horas en su informe mensual. Con la rutina armada, tarda una. ¿Cuánto gana por mes y cuánto en un año?

:::Ver la respuesta
**Tres horas por mes y treinta y seis horas por año.**

Antes: doscientos cuarenta minutos. Ahora: sesenta. La diferencia son ciento ochenta minutos, tres horas. Por doce meses, treinta y seis horas: casi una semana laboral entera.

Si hiciste también el arco del mail, sumá las dos cuentas. Ese número, junto, es el que vale la pena llevar a una conversación con tu equipo.
:::

## Para hoy

1. Guardá la receta en tu herramienta, con el nombre del informe, y el último informe como ejemplo si se puede.
2. Poné en tu calendario el recordatorio del mes que viene, con el nombre del proyecto y los cuatro pasos.
3. Hacé la cuenta del lunes otra vez con tus números. Anotala.

Al cerrar esta lección, en lo que te proponés, escribí **el día exacto del mes que viene** en que vas a armar el informe con la rutina.

## La regla que te llevás

**Lo que se hace una vez por mes no se recuerda: se deja armado.** La receta guardada, la rutina escrita y un recordatorio en el calendario.
$md$,
  7, 'curado'
from lessons l where l.slug = 'a2-informe-mensual-5'
on conflict do nothing;

-- ------------------------------------------------------------
-- Control
-- ------------------------------------------------------------
select l.arc_day, l.slug, c.title, length(c.body_md) as caracteres
from lessons l join lesson_contents c on c.lesson_id = l.id and c.lang = 'es' and c.tool_id is null
where l.arc = 'informe-mensual'
order by l.arc_day;
