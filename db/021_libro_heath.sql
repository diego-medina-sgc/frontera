-- ============================================================
-- Frontera - Made to Stick (Chip y Dan Heath, 2007)
-- ============================================================
-- Octavo y último de la biblioteca inicial. Es el más directamente
-- aplicable al oficio de quien lee: por qué un mensaje institucional
-- impecable no deja ninguna huella.
-- Síntesis propia, sin texto del libro.
-- ============================================================

insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'es', 'no_lei', 1, 'La maldición del conocimiento',
$md$
Si este libro tuviera que reducirse a una sola idea, sería esta, y es la que más vas a usar.

**Cuando sabés algo, te resulta casi imposible imaginar cómo es no saberlo.** Los Heath lo llaman la maldición del conocimiento, y sostienen que es la causa número uno de la mala comunicación. No la falta de talento ni de tiempo: la imposibilidad de volver a no saber.

El experimento que lo ilustra es simple y demoledor: una persona golpea con el dedo el ritmo de una canción muy conocida y otra tiene que adivinarla. Quien golpea escucha la canción entera en su cabeza y está convencido de que es obvia; quien escucha oye golpecitos sin sentido. **La brecha entre lo que el que golpea cree transmitir y lo que el otro recibe es enorme, y el que golpea no la percibe.**

## Por qué te pega de lleno

Todos los días comunicás cosas que conocés al detalle a gente que las ve por primera vez: familias, equipo, Board. Y cada vez que escribís algo y pensás "esto se entiende solo", estás golpeando el ritmo.

Lo peor es que la maldición empeora con la experiencia. Cuanto mejor conocés el tema, menos podés estimar qué sabe el otro, y más abstracto se vuelve tu lenguaje sin que lo notes. Por eso los mensajes institucionales se parecen tanto entre sí: están escritos por gente que sabe demasiado.

## El antídoto no es simplificar

Los Heath son claros: la solución no es bajar el nivel ni usar palabras más fáciles. Es volver **concreto** lo que para vos ya es abstracto. Un ejemplo, una cifra que se pueda imaginar, una situación que el otro reconozca.

La prueba de si lo lograste no es si suena profesional. Es si alguien que lo leyó una vez puede repetírselo a otro al día siguiente.
$md$, 7
from books b where b.slug = 'made-to-stick'
on conflict do nothing;

insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'es', 'no_lei', 2, 'Las seis cosas que hacen que algo quede',
$md$
El libro analiza qué tienen en común las ideas que sobreviven —desde consignas de salud pública hasta leyendas urbanas— y encuentra seis rasgos. No hacen falta los seis: con dos o tres bien hechos alcanza.

**Simple.** No "corto": **nuclear**. Encontrar la única cosa que, si el otro se lleva solo eso, ya valió. Los Heath lo toman de una práctica militar: antes de cada operación se escribe en una línea qué tiene que lograrse, porque ningún plan sobrevive al contacto con la realidad pero la intención sí. Si no podés escribir esa línea, no es que te falte espacio: es que todavía no sabés cuál es el núcleo.

**Inesperado.** La atención se captura rompiendo una expectativa, y se sostiene abriendo una pregunta que el otro quiera cerrar. Un dato que contradice lo que suponía vale más que diez que lo confirman.

**Concreto.** Lo abstracto no se recuerda. "Mejorar la experiencia de las familias" no se recuerda; "que nadie tenga que mandar el mismo mail dos veces" sí.

**Creíble.** No siempre con autoridad: muchas veces con un detalle verificable, o dejando que el otro lo compruebe él mismo en vez de pedirle que te crea.

**Emocional.** La gente no se mueve por cifras agregadas, se mueve por casos. Está bien documentado que una persona identificable moviliza más que una estadística, aunque la estadística sea peor.

**Historias.** Son el formato que la memoria usa de verdad, y además funcionan como simulación: quien escucha una historia ensaya mentalmente la situación.

## Cómo usarlo

No como lista de control al final. **Como filtro al principio:** antes de escribir, definí el núcleo en una línea. Casi todo el valor está en esa decisión, y es la que casi nadie toma.
$md$, 7
from books b where b.slug = 'made-to-stick'
on conflict do nothing;

insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'es', 'no_lei', 3, 'Dónde falla, y una advertencia',
$md$
El libro es útil y conviene leerlo con dos reparos.

**El método.** Los Heath estudian ideas que quedaron y buscan qué tienen en común. El problema es que no miran las que no quedaron: puede haber miles de mensajes concretos, inesperados y emotivos que nadie recuerda. Eso no invalida los seis rasgos, pero los vuelve una buena heurística, no una fórmula con respaldo causal.

**La parte de las emociones y las estadísticas.** El hallazgo de que una persona identificable moviliza más que una cifra está bien establecido. Otros experimentos que cita son de la misma época y el mismo estilo que los que no sobrevivieron a la crisis de replicación. Usalo como orientación, no lo cites como ciencia dura.

## La advertencia que importa

Esta es la que vale más que el libro: **todas estas técnicas funcionan igual de bien para una idea verdadera que para una falsa.** Los Heath lo muestran sin querer, porque sus mejores ejemplos de ideas pegajosas incluyen leyendas urbanas: concretas, inesperadas, emotivas, con historia, y completamente falsas.

Para alguien cuyo trabajo es comunicar institucionalmente, eso no es un detalle. Hacer que algo quede es una habilidad técnica **sin contenido moral propio**, y la responsabilidad de que lo que estés haciendo pegajoso sea cierto es enteramente tuya.

El libro no te lo va a recordar. Esta síntesis sí.

## Para probar hoy

Agarrá el último comunicado que escribiste y buscá su núcleo. **Una línea: qué tiene que pasar en la cabeza de quien lo lee.** Si no la encontrás, el problema del comunicado nunca fue la redacción.
$md$, 6
from books b where b.slug = 'made-to-stick'
on conflict do nothing;

-- ---------- Para quien lo leyó hace tiempo ----------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'es', 'hace_tiempo', 1, 'Lo que se te borró',
$md$
De este libro se recuerdan los seis rasgos y se olvida lo que los hace funcionar.

**El núcleo va primero y es una decisión, no un resumen.** No es condensar todo lo que querés decir: es **elegir qué sacrificar**. Los Heath insisten en que encontrar el núcleo duele porque obliga a dejar afuera cosas verdaderas e importantes. Si no dolió, no lo encontraste.

**Concreto no es simple.** Son dos rasgos distintos y se confunden todo el tiempo. Un concepto puede ser simple y abstracto —y entonces no se recuerda— o complejo y concreto —y se recuerda perfectamente—. Lo que la memoria agarra es lo que se puede imaginar con los sentidos.

**La curiosidad se abre con un hueco, no con un dato.** La forma de sostener la atención es señalar algo que el otro no sabe y que ahora le importa no saber. Dar la conclusión primero cierra el hueco y apaga el interés.

**La credibilidad se puede delegar en el otro.** La forma más fuerte no es citar autoridad: es darle algo que pueda verificar él mismo en diez segundos.

**Y el que más se olvida: la maldición del conocimiento es la causa raíz de todo lo demás.** Los seis rasgos no son seis consejos sueltos, son seis formas de compensar el hecho de que no podés volver a no saber lo que sabés.

**Para ahora:** pensá en algo que explicás seguido y que la gente nunca termina de entender. No le falta claridad: te falta un ejemplo concreto que no necesitás vos.
$md$, 6
from books b where b.slug = 'made-to-stick'
on conflict do nothing;

-- ---------- Para quien lo tiene fresco ----------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'es', 'fresco', 1, 'Contra Dunford, y aplicado a tu peor mensaje',
$md$
Si lo tenés fresco, el cruce útil es con *Obviously Awesome*, que también está en esta biblioteca, porque los dos hablan de comunicación y no de lo mismo.

**Heath responde "cómo lo digo para que quede".** Dunford responde **"contra qué me están comparando"**. Y el orden importa: un mensaje impecablemente pegajoso dentro del marco equivocado te consigue que la gente recuerde perfectamente una cosa que no le interesa.

La secuencia correcta es Dunford primero, Heath después. Primero elegís la comparación; después hacés que quede. Casi todo el mundo hace lo contrario: pule el mensaje y nunca cuestiona el marco.

## El ejercicio

Elegí **el mensaje que más veces tuviste que repetir** este año. El que explicaste cinco veces y cinco veces volvieron a preguntar lo mismo. Ese es el que más te está costando y el que mejor diagnostica.

**Uno.** Escribí su núcleo en una línea: qué tiene que quedar en la cabeza del otro si no se lleva nada más. Si te salen dos líneas, todavía no elegiste.

**Dos.** Marcá en el mensaje original todo lo abstracto. Después reemplazá **una sola** de esas cosas por algo concreto: un caso, un número que se pueda imaginar, una situación reconocible. Una sola, para ver el efecto aislado.

**Tres.** Buscá la expectativa que podrías romper. Si tu mensaje confirma lo que el otro ya suponía, no tiene por dónde entrar.

**Cuatro, la prueba real:** contáselo a alguien que no sepa del tema y pedile que te lo repita **al día siguiente**. Lo que te devuelva es tu mensaje real. Todo lo demás era lo que vos escuchabas en tu cabeza mientras golpeabas el ritmo.
$md$, 7
from books b where b.slug = 'made-to-stick'
on conflict do nothing;
