-- ============================================================
-- Frontera - Atomic Habits (James Clear, 2018)
-- ============================================================
-- Quinto libro. Entra con una incomodidad declarada: el diseño de
-- rachas de esta misma app sale de acá, y el usuario merece saberlo
-- para poder desconfiar.
-- Síntesis propia, sin texto del libro.
-- ============================================================

insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'es', 'no_lei', 1, 'Sistemas en vez de objetivos',
$md$
La idea que ordena todo el libro es un cambio de foco: **los objetivos definen a dónde querés llegar, los sistemas definen qué hacés todos los días.** Y lo que determina el resultado es lo segundo.

El argumento de Clear: ganadores y perdedores suelen tener los mismos objetivos. Todos los que corren una maratón quieren terminarla. La diferencia no está en el objetivo, está en el sistema que cada uno sostuvo durante meses.

De ahí sale una consecuencia práctica que vale por sí sola: **si tenés un problema recurrente, no te falta motivación, te falta sistema.** Volver a proponerte lo mismo con más ganas es repetir lo que ya falló.

## El cambio de identidad

La parte más fuerte del libro, y la que menos se cita, es que el hábito que dura no es el que se sostiene con disciplina sino el que se vuelve parte de quién sos.

Clear lo plantea como una diferencia de enunciado. "Estoy tratando de leer más" es un objetivo. "Soy alguien que lee" es una identidad. Y cada vez que hacés la cosa, no estás avanzando hacia una meta: estás juntando evidencia sobre vos mismo.

Eso explica algo que la gente vive y no sabe nombrar: por qué cuesta tanto sostener un hábito que no encaja con la idea que uno tiene de sí mismo, y por qué los que encajan no cuestan nada.

## La aplicación directa acá

Vale la pena decirlo porque es incómodo: **el diseño de esta app toma cosas de este libro.** La racha, el tamaño chico de las lecciones, que siempre haya algo listo para hacer. Saberlo te permite usarlo a favor y también desconfiar cuando sentís que te están empujando en vez de enseñándote.
$md$, 7
from books b where b.slug = 'atomic-habits'
on conflict do nothing;

insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'es', 'no_lei', 2, 'Las cuatro palancas',
$md$
Clear ordena todo en cuatro reglas. Para que un hábito se sostenga, hay que hacerlo **obvio, atractivo, fácil y satisfactorio**. Y para sacarse uno de encima, al revés: invisible, poco atractivo, difícil y no satisfactorio.

**Obvio.** La mayoría de los hábitos se pierden por falta de disparador, no de voluntad. De ahí dos técnicas suyas que funcionan: decir *cuándo y dónde* exactamente, en vez de "más seguido"; y **encadenar** el hábito nuevo a uno que ya existe sin falta —después de tal cosa que ya hago, hago esta—.

**Atractivo.** Pegarlo a algo que ya te gusta, y rodearte de gente para quien eso es lo normal. Clear insiste bastante en el entorno social y tiene razón: es más fuerte que cualquier técnica individual.

**Fácil.** Acá está su mejor regla práctica, la de los dos minutos: **cuando arrancás, achicá el hábito hasta que dure dos minutos.** No "estudiar una hora", "abrir el material". El objetivo al principio no es progresar, es establecer la aparición.

**Satisfactorio.** Lo que se repite es lo que se siente bien enseguida. Y como los resultados de casi todo lo que importa tardan, hay que fabricar una recompensa inmediata: marcar que lo hiciste, ver una cuenta subir.

## El diseño del entorno le gana a la fuerza de voluntad

Si te llevás una sola: **la gente con más disciplina aparente es, casi siempre, la que armó un entorno donde no hace falta.** No resisten la tentación, la sacaron de la vista. Eso es mucho más replicable que tener más carácter.
$md$, 7
from books b where b.slug = 'atomic-habits'
on conflict do nothing;

insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'es', 'no_lei', 3, 'Qué envejeció mal, y cómo no usarlo',
$md$
El libro es útil y conviene leerlo con tres reservas, porque es de los que la gente cita como si fuera ciencia establecida.

**La matemática del 1%.** La idea de mejorar 1% por día y terminar 37 veces mejor en un año es una metáfora, no un hallazgo. El aprendizaje y el rendimiento no se componen así: hay mesetas, retrocesos y techos. Como imagen motivacional sirve; como modelo de nada, no.

**La evidencia es despareja.** Buena parte del libro se apoya en anécdotas bien contadas y en estudios que, mirados de cerca, dicen menos de lo que el relato sugiere. Las cuatro reglas son un marco práctico razonable, no un resultado de laboratorio.

**Subestima lo estructural.** Es un libro profundamente individual: todo problema se resuelve con mejor diseño personal. No tiene casi nada que decir sobre lo que pasa cuando la causa no es tuya, sino del trabajo que tenés, del tiempo que no controlás o de la gente que depende de vos. Para alguien que coordina un equipo, eso es una limitación grande.

## Cómo usarlo igual

Tomalo como **una caja de herramientas, no como una teoría**. Las dos que de verdad valen son la regla de los dos minutos y el diseño del entorno, porque las dos reducen la cantidad de voluntad necesaria, que es el recurso que falla.

Y la advertencia que el libro no se hace a sí mismo: **un sistema de hábitos puede sostener perfectamente una actividad inútil.** Hacer algo todos los días durante un año no lo vuelve valioso. Antes de optimizar la constancia, conviene revisar que la cosa valga la pena, que es una pregunta que este libro no hace nunca.
$md$, 6
from books b where b.slug = 'atomic-habits'
on conflict do nothing;

-- ---------- Para quien lo leyó hace tiempo ----------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'es', 'hace_tiempo', 1, 'Lo que se te borró',
$md$
De este libro casi todos retienen las cuatro reglas y la regla de los dos minutos. Lo que se pierde es lo que lo hace distinto de cualquier manual de productividad.

**La identidad va antes que el hábito, no después.** La secuencia que propone Clear es al revés de la intuitiva: no es "hago esto hasta lograr el resultado y entonces me convierto en alguien así", es **decidir primero qué tipo de persona querés ser y preguntarte qué haría esa persona hoy**. El hábito es la consecuencia, no el camino.

**La meseta del potencial latente.** Su explicación de por qué la gente abandona: los resultados aparecen mucho después del esfuerzo, así que hay un período largo donde hacés todo bien y no pasa nada. Quien no sabe que esa meseta existe la interpreta como fracaso y se va justo antes.

**Nunca dos veces seguidas.** Su regla para los tropiezos: fallar un día no rompe nada, fallar dos seguidos empieza un hábito nuevo. Es mucho más humano que la racha perfecta, y es lo que casi nadie recuerda de este libro.

**El entorno pesa más que la persona.** La parte que más se olvida porque es la menos heroica: casi todo lo que atribuimos a carácter es, en realidad, arreglo del ambiente.

**Para ahora:** pensá en un hábito que se te cayó. ¿Se cayó por falta de ganas, o lo dejaste dos veces seguidas en una semana complicada y ya no volvió? Si fue lo segundo, no te falta disciplina: te falta la regla de no fallar dos veces.
$md$, 6
from books b where b.slug = 'atomic-habits'
on conflict do nothing;

-- ---------- Para quien lo tiene fresco ----------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'es', 'fresco', 1, 'Contra qué leerlo, y un ejercicio incómodo',
$md$
Si lo tenés fresco, lo que falta no es repasarlo sino ponerlo contra sus límites.

**Contra Grove.** Clear es individual; *High Output Management* es organizacional. Donde Clear dice "diseñá tu entorno", Grove diría que si tu equipo depende de la fuerza de voluntad individual de cada uno, el problema es del sistema de trabajo, no de las personas. Para alguien que coordina gente, la versión útil de Clear no es aplicarlo a uno mismo: es **diseñar el entorno de trabajo del equipo** para que lo correcto sea lo fácil. Eso Clear no lo escribe.

**Contra la evidencia.** Buena parte de la literatura de hábitos se apoya en estudios con muestras chicas y efectos que no siempre se replican. El marco sirve como heurística; conviene no citarlo como ciencia frente a gente que sabe.

**Y contra el propio libro:** optimiza la constancia y nunca pregunta si la cosa vale la pena. Un sistema impecable sosteniendo algo inútil es peor que no tener sistema, porque además te deja la sensación de estar progresando.

## El ejercicio

Elegí **un hábito que sostenés hoy con éxito** y respondé dos preguntas.

**Una:** ¿cuál de las cuatro reglas lo sostiene de verdad? Casi siempre es una sola, y casi nunca es la que creías.

**Dos**, la incómoda: **¿sigue valiendo la pena?** No preguntes si lo hacés bien. Preguntá qué pasaría si lo dejaras tres meses. Si la respuesta honesta es "nada", encontraste un sistema perfecto sosteniendo algo que ya no te sirve, que es el punto ciego exacto de este libro.
$md$, 7
from books b where b.slug = 'atomic-habits'
on conflict do nothing;
