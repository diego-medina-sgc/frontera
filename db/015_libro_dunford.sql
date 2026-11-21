-- ============================================================
-- Frontera - Obviously Awesome (April Dunford, 2019)
-- ============================================================
-- Cuarto libro. Posicionamiento: por qué algo bueno puede sonar
-- irrelevante, y cómo se arregla sin cambiar el producto. Directo al
-- oficio de quien lee, que es marketing.
-- Síntesis propia, sin texto del libro.
-- ============================================================

insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'es', 'no_lei', 1, 'Contra qué te comparan decide todo',
$md$
Dunford arranca con una observación simple y demoledora: **la gente no evalúa lo que ofrecés en abstracto, lo evalúa contra algo.** Y ese algo casi nunca lo elegís vos.

Su ejemplo mental es el mejor del libro: el mismo producto, descrito como una cosa o como otra, pasa de caro a barato, de complicado a potente, de innecesario a urgente. No cambió nada adentro. Cambió **con qué lo comparan**.

A eso le llama posicionamiento, y aclara enseguida lo que no es: no es el eslogan, no es la marca, no es el tono. Es la respuesta a una pregunta previa a todo eso: **¿qué tipo de cosa es esto, y para quién es obviamente mejor que las alternativas?**

## El posicionamiento por defecto

Lo que le pasa a casi todo el mundo: el producto nace posicionado por accidente, según cómo lo pensó quien lo hizo. Si lo empezaste como "una planilla mejor", la gente lo compara con planillas y lo juzga con la vara de las planillas, aunque haya crecido hasta ser otra cosa.

Ese posicionamiento heredado es el que hay que cuestionar, y su señal de alarma es específica: **cuando la gente entiende lo que hacés pero no entiende por qué les importa**, el problema no es el mensaje, es el marco.

## Por qué te sirve

Esto aplica igual a un producto, a un área y a una iniciativa interna. Cuando presentás algo al Board y no prende, muchas veces no es que la idea sea débil: es que la están comparando con la cosa equivocada. Y si no elegís vos la comparación, la eligen ellos.
$md$, 7
from books b where b.slug = 'obviously-awesome'
on conflict do nothing;

insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'es', 'no_lei', 2, 'Las piezas, y la pregunta que las ordena',
$md$
El método de Dunford tiene cinco piezas, y lo bueno es que se arma en orden, no todas juntas.

**Uno. Las alternativas reales.** No tus competidores según vos: **qué haría la gente si lo tuyo no existiera.** Casi siempre la respuesta no es un competidor, es una planilla, un mail, un becario, o no hacer nada. Si no sabés esto, no sabés nada.

**Dos. Los atributos únicos.** Qué tenés vos que las alternativas no tienen. Tiene que ser verificable, no una aspiración.

**Tres. El valor de esos atributos.** Qué le permite hacer a alguien ese atributo, que antes no podía. El atributo sin el valor es una ficha técnica.

**Cuatro. Quién se desvive por ese valor.** No "quién podría usarlo": quién lo necesita tanto que lo compra o lo adopta rápido. Dunford insiste en que acotar acá se siente como perder mercado y es lo contrario.

**Cinco. En qué categoría lo ponés.** La categoría es el atajo mental que le dice a la gente qué esperar, con qué compararlo y cuánto debería costar. Elegirla mal condena a lo demás.

## La pregunta que resuelve el 80%

Si solo te llevás una: **¿qué usaría esta persona si lo mío no existiera?**

Casi nadie se la hace, y contestarla con honestidad reordena todo lo demás. Porque la respuesta rara vez es "un producto parecido". Suele ser "nada, lo sufre", y ahí el enemigo no es un competidor: es la inercia, que es mucho más difícil de vencer y exige un mensaje completamente distinto.
$md$, 7
from books b where b.slug = 'obviously-awesome'
on conflict do nothing;

insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'es', 'no_lei', 3, 'Probado con algo tuyo',
$md$
Las ideas de posicionamiento se entienden en diez minutos y se aprenden solo aplicándolas. Así que acá va, con un caso concreto: **esta misma app**.

**¿Qué usarías si Frontera no existiera?** No otra app de aprendizaje. Usarías lo que ya usabas: seguir cuentas en redes, abrir una newsletter cuando tenés tiempo, anotarte en un curso que no terminás, y preguntarle a una IA cuando te aparece la duda. Esa es la alternativa real, y es gratis y ya está instalada.

**¿Qué tiene esto que eso no tenga?** Que sabe en qué nivel estás y qué ya sabés, así que no te explica lo que no necesitás. Y que filtra por novedad real en vez de por popularidad.

**¿Qué te permite eso?** Dejar de perder tiempo en contenido que no te suma y dejar de tener la sensación de que algo importante se te pasó.

**¿Quién se desvive por eso?** No cualquiera que use IA. Alguien que **ya pasó el punto de la curiosidad**, que construye cosas, y que siente la ansiedad concreta de quedarse atrás. Alguien de nivel 0 no se desvive por esto: a ese le sirve otra cosa.

**¿Y la categoría?** Acá está lo interesante. Si se posiciona como "app de cursos", pierde: la comparan con plataformas gratuitas enormes. Si se posiciona como "newsletter personalizada", también: eso es gratis. La categoría honesta está más cerca de **un radar con tutor**, que no es una categoría existente, y Dunford diría que crear categoría es el camino más caro de todos.

Ese es el ejercicio. Hacelo con algo tuyo y vas a ver por qué el método importa más que el libro.
$md$, 7
from books b where b.slug = 'obviously-awesome'
on conflict do nothing;

-- ---------- Para quien lo leyó hace tiempo ----------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'es', 'hace_tiempo', 1, 'Lo que se te borró',
$md$
**La señal de que el posicionamiento está mal.** Es específica y se olvida: no es que no te entiendan. Es que **te entienden perfectamente y no les importa**. Si tus interlocutores pueden repetir lo que hacés y aun así no se mueven, el problema no está en la claridad del mensaje: está en contra qué te comparan.

**La categoría no es una etiqueta, es un conjunto de expectativas.** Cuando decís en qué categoría estás, estás diciendo con qué te comparan, cuánto deberías costar, qué funciones se dan por sentadas y qué se considera un extra. Por eso es la decisión más cara de todas y la que más gente toma sin pensar.

**Acotar el público se siente como perder y es al revés.** Dunford vuelve sobre esto varias veces porque nadie le cree la primera vez. Un posicionamiento que le habla a todos no le resulta obvio a nadie, y lo que buscás es exactamente eso: que a alguien le resulte obvio.

**El posicionamiento es anterior al mensaje.** Si estás reescribiendo textos y no funciona, probablemente estés arreglando el síntoma. Ningún texto salva un marco equivocado.

**Y lo que casi nunca se recuerda:** el posicionamiento se revisa. No es una decisión fundacional que se toma una vez. A medida que el producto cambia y el mercado cambia, la comparación correcta cambia con ellos, y el posicionamiento de hace dos años puede estar frenando lo de hoy.

**Para ahora:** pensá en algo tuyo que la gente entiende y no le importa. Ahí hay un problema de marco, no de redacción.
$md$, 6
from books b where b.slug = 'obviously-awesome'
on conflict do nothing;

-- ---------- Para quien lo tiene fresco ----------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'es', 'fresco', 1, 'El método donde más incomoda',
$md$
Si lo tenés fresco, el valor no está en repasarlo sino en aplicarlo donde duele, que no es un producto: es una iniciativa interna.

El posicionamiento se piensa siempre hacia afuera, hacia clientes. Pero la misma mecánica gobierna qué pasa cuando presentás algo adentro de una organización, y ahí casi nadie lo usa.

**Hacé el ejercicio con tu próxima propuesta al Board o a dirección.**

**Alternativa real:** si no aprueban esto, ¿qué pasa? Casi nunca es "aprueban otra cosa". Casi siempre es **seguir como están**, que es gratis, no tiene riesgo y no requiere que nadie defienda nada. Ese es tu competidor, y es durísimo.

**Categoría:** ¿como qué lo van a leer? ¿Un gasto, una inversión, un experimento, un riesgo reputacional? La categoría en la que caiga define con qué lo comparan y qué vara le aplican. Un proyecto que cae en "gasto de tecnología" compite contra otros gastos; el mismo proyecto como "reducción de carga del equipo" compite contra el status quo.

**Quién se desvive:** en una organización no alcanza con que la idea sea buena para la institución. Tiene que haber **alguien concreto** a quien le resuelva un dolor propio. Si no existe esa persona, la propuesta no tiene quien la empuje cuando vos no estés en la sala.

**La pregunta final, la de Dunford aplicada adentro:** ¿con qué lo están comparando, y lo elegí yo o lo eligieron ellos?

Si lo eligieron ellos, ya perdiste la discusión antes de empezarla.
$md$, 6
from books b where b.slug = 'obviously-awesome'
on conflict do nothing;
