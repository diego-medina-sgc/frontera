-- ============================================================
-- Frontera - la primera pieza de Grove, reescrita para que enseñe
-- ============================================================
-- Muestra de lo que significa "que el usuario obtenga un aprendizaje"
-- y no "te cuento un poquito". La versión anterior estaba bien escrita
-- y contaba el concepto; esta lo instala. Lo que cambia no es el
-- largo: es que cada sección hace un trabajo distinto.
--
--   1. La idea, dicha una vez y con precisión.
--   2. El caso trabajado. Apalancamiento es una idea cuantitativa y
--      nunca se cuantificaba: quedaba en lista de ejemplos. Acá se
--      hace la cuenta sobre un caso concreto, con números.
--   3. El borde. Un concepto se entiende cuando se sabe dónde NO
--      aplica. Sin eso, "apalancamiento" se lee como "delegá todo".
--   4. La recuperación. Tres casos para ordenar, con la respuesta
--      escondida: hay un momento en el que la persona tiene que
--      producirla, que es donde se aprende. Leerla se siente igual
--      que haberla sabido, y no es lo mismo.
--   5. Qué hacer, que ya estaba.
--
-- De 1.522 a ~4.400 caracteres, pero el largo es consecuencia y no
-- objetivo: salió de lo que hacía falta para que el concepto quede.
-- ============================================================

update book_pieces
set
  minutes = 9,
  body_md = $md$
Grove dirigía Intel cuando escribió esto, y arranca con una definición que incomoda a cualquiera que coordine gente:

**La producción de un gerente es la producción de su equipo, más la de los equipos sobre los que influye.**

Leelo literal, porque la trampa está en lo que deja afuera: nada de lo que hacés con tus propias manos cuenta como producción tuya. Cuenta solo si cambia lo que producen otros. El documento que escribiste, los mails que contestaste, la reunión que aguantaste: en este esquema eso no es producción, es actividad.

## La cuenta que la vuelve útil

La idea suena a frase de agenda hasta que se le ponen números. Grove la llama **apalancamiento**, y es una división:

**Apalancamiento = (a cuánta gente afecta × cuántas veces lo van a hacer × cuánto mejora cada vez) ÷ tus horas**

Un martes tenés dos horas libres. Dos opciones.

**Opción A: contestás vos las doce consultas que entraron.** Producción: doce consultas contestadas, bien. Mañana, cuando no estés: cero. El apalancamiento es uno. Una hora tuya, una hora de resultado.

**Opción B: te sentás con la persona que las contesta y arman el criterio.** Qué se responde en el día, qué se escala, qué se pregunta antes de contestar. Producción hoy: cero consultas. Pero esa persona contesta doce por día, cinco días por semana. Si el criterio le evita dos idas y vueltas por consulta, en un mes son doscientas cuarenta consultas que salen mejor y cuatrocientas ochenta idas y vueltas que no pasaron.

Dos horas contra doscientas cuarenta consultas. Esa es la división, y es toda la idea.

La misma cuenta explica algo menos obvio: **el apalancamiento puede ser negativo.** Una decisión que te queda tres días en el escritorio no vale cero: vale menos que cero. Son siete personas trabajando tres días con una certeza que no tienen. El mismo número, con el signo cambiado.

## Dónde la idea no aplica

Acá es donde más se usa mal, así que vale marcar el borde.

**No significa delegar todo.** Si le pasás una tarea a alguien que todavía no la sabe hacer, no apalancaste: abandonaste. El multiplicador "cuánto mejora cada vez" te da negativo. Grove tiene una respuesta entera para esto, y es justo la pieza que sigue.

**Hay cosas que solo podés hacer vos.** La conversación con la familia que está por irse, la decisión que es tuya por cargo. Ahí el apalancamiento es irrelevante: hacerlas vos no es falta de criterio, es la tarea.

**Y hay tareas que no se repiten.** Enseñarle a alguien algo que va a pasar una sola vez cuesta más de lo que devuelve. El multiplicador "cuántas veces" es uno y la cuenta no cierra.

## Probá que lo entendiste

Tres cosas que podrías hacer el lunes. Ordenalas de mayor a menor apalancamiento **antes** de abrir la respuesta.

1. Contestar los cuarenta mails que se juntaron el fin de semana.
2. Escribir, una vez, en qué casos un reclamo se escala y en cuáles no, y que lo usen las cuatro personas del equipo.
3. Revisar uno por uno los mails que escribió el equipo antes de que salgan.

:::Ver la respuesta
**2, 1, 3** — y el tercero probablemente sea negativo.

**El 2 es el más alto por lejos.** Una hora tuya × cuatro personas × todos los reclamos que vengan × para siempre. Es el caso de manual: convertir una decisión que hoy pasa por vos en un criterio que no necesita pasar por vos.

**El 1 es producción real, pero muere con la hora.** Cuarenta mails contestados son cuarenta mails. El lunes que viene hay cuarenta más y la cuenta vuelve a empezar desde cero.

**El 3 parece lo responsable y casi siempre resta.** Si revisás sin devolver el criterio, el equipo aprende a esperarte en lugar de aprender a decidir, y cada mail pasa a tardar lo que tardás vos en llegar. Se vuelve positivo solo si al revisar explicás qué cambiarías y por qué, que es el 2 disfrazado de 3.
:::

## Qué hacer esta semana

Abrí tu calendario de la semana pasada y marcá cada bloque con una de dos letras: **M** si lo que hiciste ahí multiplica lo que otros van a hacer, **A** si fue actividad tuya que terminó cuando terminó.

No hace falta que el resultado sea bueno. Hace falta que lo veas. Para casi todo el que coordina, el primer conteo es incómodo, y es el único dato que se necesita para empezar a mover la semana siguiente.
$md$
where idx = 1
  and lang = 'es'
  and for_read_state = 'no_lei'
  and book_id = (select id from books where slug = 'high-output-management');
