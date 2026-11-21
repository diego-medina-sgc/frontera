-- ============================================================
-- Frontera - biblioteca: estado de lectura y primer libro
-- ============================================================

-- Los dos clics tambien valen para los libros.
create table if not exists book_piece_state (
  profile_id  uuid not null references profiles(id) on delete cascade,
  piece_id    bigint not null references book_pieces(id) on delete cascade,
  comprension smallint check (comprension between 1 and 10),
  interes     smallint check (interes in (-1, 1)),
  answered_at timestamptz not null default now(),
  primary key (profile_id, piece_id)
);

alter table book_piece_state enable row level security;

drop policy if exists mio_book_piece_state on book_piece_state;
create policy mio_book_piece_state on book_piece_state for all to authenticated
  using (profile_id = auth.uid()) with check (profile_id = auth.uid());

grant select, insert, update, delete on book_piece_state to authenticated;

-- ============================================================
-- Leaders Eat Last - Simon Sinek
-- ============================================================
-- Sintesis propia de las ideas, atribuidas al autor. No hay texto del
-- libro, ni citas, ni extractos: son las ideas explicadas con palabras
-- propias y puestas contra la situacion real de quien lee.
-- ============================================================

-- ---------- Para quien no lo leyo ----------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'es', 'no_lei', 1, 'La idea central: primero la seguridad, después la estrategia',
$md$
La tesis de Sinek es incómoda para cualquiera que dirija gente: el rendimiento de un equipo no depende tanto de los incentivos, los objetivos o el talento, sino de si cada persona puede dejar de cuidarse de las de al lado.

Su imagen es la del círculo de seguridad. Adentro del círculo, la gente gasta su energía en el problema. Afuera, la gasta en protegerse: de que le echen la culpa, de quedar expuesta, de que otro se lleve el crédito. Y esa energía no está disponible para el trabajo. No porque la gente sea mala, sino porque protegerse es lo primero que hace cualquiera que se siente en peligro.

Lo fuerte del argumento es dónde pone la responsabilidad. No en el equipo, en quien lo dirige. Según Sinek, el líder no es el que tiene la mejor idea: es el que decide quién está adentro del círculo y cuánto cuesta estar ahí. Y eso no se declara en una reunión, se demuestra en los momentos en que estar adentro le cuesta algo a él.

El título viene de ahí. En los comedores de los marines, los oficiales comen últimos; no hay regla escrita, es cómo se hace. Es un gesto chico que dice algo grande: el que manda recibe después, no antes.

**Lo que esto te plantea si dirigís un equipo:** la pregunta no es si tu gente está motivada. Es cuánta de su energía diaria se está yendo en cubrirse, y de qué se está cubriendo exactamente.
$md$, 7
from books b where b.slug = 'leaders-eat-last'
on conflict do nothing;

insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'es', 'no_lei', 2, 'Qué rompe el círculo, según él',
$md$
Sinek dedica buena parte del libro a cómo se destruye la confianza en una organización, y casi nada de eso tiene que ver con malas personas.

**La distancia.** Cuanto más lejos está quien decide de quien recibe la decisión, más fácil es tomar decisiones que lastiman. No por crueldad: porque a la distancia la gente se convierte en números. Un recorte en una planilla es una línea; a tres metros es una persona con nombre. Su conclusión es que la distancia hay que acortarla a propósito, porque la organización la agranda sola.

**La abundancia mal repartida.** Cuando el que está arriba recibe primero y más, el círculo se corta en la primera capa. No porque la gente envidie, sino porque la señal es inequívoca: acá no se comparte el riesgo.

**Los números por encima de las personas.** Cuando la métrica se vuelve el objetivo y no el indicador, la organización empieza a producir lo que la métrica mide y no lo que necesita. Y la gente aprende rápido a optimizar la métrica aunque sepa que está mal.

**La inestabilidad crónica.** Reorganizaciones permanentes, reglas que cambian, prioridades que se dan vuelta. Nada de eso se percibe como dinamismo desde abajo: se percibe como peligro, y la respuesta al peligro es cubrirse.

**Dónde te toca:** estas cuatro no requieren un jefe malo. Aparecen solas, por inercia de la estructura. Esa es la parte útil del argumento: si no hacés nada, pasan igual.
$md$, 7
from books b where b.slug = 'leaders-eat-last'
on conflict do nothing;

insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'es', 'no_lei', 3, 'Qué cambia el lunes',
$md$
El libro es más inspirador que operativo, así que esta es la parte que no está escrita así en ninguna página: qué se hace concretamente con esto.

**Quedarte con el golpe.** Cuando algo sale mal y hay que dar explicaciones hacia arriba, las das vos. La versión contraria —"el equipo no llegó"— es rápida, es cierta, y te cuesta el círculo entero. La gente mira eso con una atención que no le presta a ningún discurso.

**Repartir el crédito con nombre y apellido.** No "el equipo hizo un gran trabajo". Quién hizo qué, dicho delante de quien importa. Cuesta diez segundos y es la moneda más barata que tenés.

**Proteger a quien trae la mala noticia.** La primera vez que alguien te avisa temprano de un problema, tu reacción define si va a haber una segunda vez. Si reaccionás mal, la próxima te enterás tarde, y tarde es caro.

**Acortar la distancia a propósito.** Si solo te llega información filtrada por una capa intermedia, estás decidiendo a ciegas y además sin saberlo.

**Decir qué no va a pasar.** En épocas de incertidumbre, la gente no necesita que le mientas con que todo está bien. Necesita saber qué está definido y qué no. La ambigüedad es lo que dispara el modo supervivencia, no la mala noticia.

Nada de esto requiere presupuesto ni permiso. Esa es exactamente la razón por la que no tenés excusa, y también por la que casi nadie lo hace.
$md$, 7
from books b where b.slug = 'leaders-eat-last'
on conflict do nothing;

insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'es', 'no_lei', 4, 'Qué envejeció mal',
$md$
Si vas a usar este libro para decidir cómo dirigís, te conviene saber dónde es flojo. Son tres cosas.

**La biología.** Sinek explica casi todo con cuatro sustancias: endorfinas y dopamina como las químicas del logro individual, serotonina y oxitocina como las de los vínculos, y cortisol como la del miedo. Es ordenado, es memorable y es una simplificación que la neurociencia no sostiene. Ninguna de esas sustancias hace una sola cosa, ni funciona como una palanca que se sube o se baja. Si el argumento te convence, que sea por lo que observás en tu equipo, no por la explicación química.

**La idealización de lo militar.** El libro usa los marines como modelo de organización sana. Es un ejemplo elegido con pinzas: funciona para ilustrar la idea, pero una institución educativa, una empresa o un área de marketing no se parecen en nada a una unidad de combate, ni en los incentivos ni en lo que está en juego.

**Lo que falta: la exigencia.** El libro habla mucho de proteger y poco de exigir. Un equipo donde todos se sienten seguros y nadie rinde cuentas no es un círculo de seguridad, es una zona de confort. La investigación posterior sobre seguridad psicológica —la de Amy Edmondson, que es la versión con evidencia real de esta misma idea— es explícita en esto: seguridad **y** estándares altos. Una sola de las dos no sirve, y la combinación que falta es la que más se parece a lo que a vos te pasa.

Con eso en la mano, el libro sigue siendo útil. Sin eso, es un sermón.
$md$, 6
from books b where b.slug = 'leaders-eat-last'
on conflict do nothing;

-- ---------- Para quien lo leyo hace tiempo ----------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'es', 'hace_tiempo', 1, 'Lo que se te borró',
$md$
De este libro casi todos retienen el título y la imagen del círculo. Lo que se pierde con el tiempo es la parte difícil, que es justamente la que sirve.

**El círculo se define por quién queda afuera.** No es un valor abstracto: es un borde. Y Sinek insiste en que la organización, a medida que crece, multiplica los bordes. Cada capa jerárquica, cada área, cada "ellos" dibuja un círculo más chico. La gente termina protegiendo a su equipo del equipo de al lado, dentro de la misma institución. Eso se siente como lealtad y es el síntoma de que el círculo grande se rompió.

**La distancia es el mecanismo, no una metáfora.** Es la pieza más olvidada del libro. Lo que hace que una decisión lastime no es la maldad, es no tener delante a quien la recibe.

**La integridad se mide cuando cuesta.** Lo que define el círculo no son los gestos de los días buenos: es qué hacés cuando proteger a alguien te sale caro a vos. El resto es decoración.

**Lo que probablemente recordás mal:** que el libro propone ser blando. No lo propone. Propone absorber el riesgo, que es bastante más exigente que ser amable.

**Para ahora:** pensá en tu equipo y preguntate dónde está el borde hoy. Quién está adentro y quién, sin que nadie lo haya decidido, quedó afuera.
$md$, 6
from books b where b.slug = 'leaders-eat-last'
on conflict do nothing;

insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'es', 'hace_tiempo', 2, 'La prueba que el libro propone sin decirlo',
$md$
Hay un test que recorre todo el libro y que Sinek nunca formula como tal: **qué hace la organización cuando las cosas se ponen difíciles.**

Su ejemplo favorito son las empresas que, ante una caída, en vez de echar gente reparten el dolor —todos trabajan menos, todos cobran menos, incluido el que manda— y salen del otro lado con un equipo que después se rompe el alma. Contra las que ajustan por la vía rápida y después no entienden por qué nadie da un paso de más.

El punto no es que despedir esté mal. Es que **la forma en que una organización reparte el dolor es el dato más honesto que da sobre sí misma**, y todo el mundo lo lee correctamente, incluso los que se quedan. Sobre todo los que se quedan.

**Llevado a tu escala**, que no es la de una fábrica: la prueba aparece en cosas mucho más chicas. Cuando hay que trabajar un fin de semana, ¿quién lo hace? Cuando una decisión de arriba cae mal, ¿la defendés como propia o la entregás como ajena? Cuando se reparte lo bueno —un proyecto visible, un reconocimiento, un presupuesto— ¿cómo se reparte?

Nadie recuerda el discurso de la reunión anual. Todos recuerdan qué pasó la vez que se puso difícil.

**Para ahora:** acordate de la última vez que algo se complicó de verdad en tu área. ¿Qué aprendió tu equipo sobre vos ese día?
$md$, 6
from books b where b.slug = 'leaders-eat-last'
on conflict do nothing;

-- ---------- Para quien lo tiene fresco ----------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'es', 'fresco', 1, 'Contra qué conviene leerlo',
$md$
Si lo tenés fresco no necesitás el resumen. Necesitás los libros que lo discuten, que es donde el tema se vuelve realmente útil.

**Amy Edmondson, sobre seguridad psicológica.** Es la misma idea de Sinek pero con treinta años de investigación empírica atrás, y llega a una conclusión que él no formula: la seguridad sola no produce nada. El modelo de Edmondson cruza dos ejes, seguridad y exigencia. Seguridad alta con exigencia baja da una zona de confort agradable e improductiva. Exigencia alta con seguridad baja da ansiedad. Solo las dos altas dan aprendizaje. Sinek se queda casi entero en un eje.

**Andy Grove, en High Output Management.** El contrapunto duro. Grove pensaba la organización desde el rendimiento medible y la obligación del jefe de aumentar la producción de su gente. No es incompatible con Sinek, pero obliga a la pregunta que el otro esquiva: ¿qué hacés con la persona que está adentro del círculo y no rinde? Sinek no tiene buena respuesta. Grove sí, y es incómoda.

**Y la crítica más dura**, que no está en ningún libro: Sinek describe condiciones, no mecanismos. Te deja convencido y sin saber qué hacer el lunes. Por eso funciona tan bien en una charla y tan poco en una agenda.

**La síntesis que te sirve:** Sinek te da el porqué y la imagen que te acordás. Edmondson te da el modelo correcto. Grove te da el filo. Los tres juntos son un sistema; cada uno solo es una media verdad.
$md$, 7
from books b where b.slug = 'leaders-eat-last'
on conflict do nothing;

insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'es', 'fresco', 2, 'Aplicado a esta semana',
$md$
Un ejercicio, no un resumen. Lleva veinte minutos y se hace una sola vez por trimestre.

**Uno. Dibujá el borde real.** Escribí los nombres de tu equipo. Al lado de cada uno, respondé con honestidad: si esta persona se equivoca fuerte mañana, ¿me avisa primero a mí o trata de arreglarlo sola? Los que tratarían de arreglarlo solos están afuera del círculo, aunque figuren adentro del organigrama. Ese es tu borde real, y casi nunca coincide con el que creías.

**Dos. Buscá la última vez que absorbiste un golpe.** Un momento concreto en el que podías haber señalado a alguien de tu equipo y no lo hiciste, hacia arriba o hacia afuera. Si no encontrás ninguno en los últimos tres meses, hay dos opciones: no pasó nada malo en tres meses, o el círculo no es tan sólido como te parece.

**Tres. Elegí el eje que te falta.** Con el modelo de Edmondson: ¿tu equipo está más cerca de la zona de confort —cómodos, poco exigidos— o de la ansiedad —exigidos, cuidándose—? Casi nadie está en el medio. Según cuál sea, lo que tenés que subir es distinto, y subir el equivocado empeora las cosas.

**Cuatro, y es la única que tiene consecuencia:** elegí una sola conversación de esta semana donde vayas a hacer algo distinto por esto. Una. Anotá cuál y con quién.

Lo demás es filosofía de aeropuerto.
$md$, 7
from books b where b.slug = 'leaders-eat-last'
on conflict do nothing;
