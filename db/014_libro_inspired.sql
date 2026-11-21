-- ============================================================
-- Frontera - Inspired (Marty Cagan, 2017)
-- ============================================================
-- Tercer libro. Elegido porque quien lee tiene un eje declarado de
-- producto propio y este es el libro que mejor explica por qué la
-- mayoría de los productos fracasan antes de escribirse.
-- Síntesis propia, sin texto del libro.
-- ============================================================

insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'es', 'no_lei', 1, 'Fábricas de funcionalidades',
$md$
Cagan trabajó en productos durante décadas y escribió este libro básicamente enojado con una cosa: **la mayoría de los equipos de producto no hacen producto, ejecutan pedidos.**

El patrón que describe es reconocible en cualquier organización. Alguien arriba, o un cliente grande, o el área comercial, decide qué hay que construir. Eso baja como una lista priorizada. El equipo la construye. Se entrega a tiempo. Y no pasa nada: la métrica no se mueve, la gente no lo usa, el problema sigue ahí.

Él lo llama **fábrica de funcionalidades**, y su diagnóstico es que el problema no está en la ejecución sino en el encargo: al equipo le dieron **soluciones para construir** en vez de **problemas para resolver**.

## La alternativa

Un equipo al que le dan un problema y un resultado esperado —bajar las consultas repetidas, subir las inscripciones de una etapa— y la libertad de decidir cómo. La diferencia no es de método, es de quién piensa. En el primer modelo el equipo son manos; en el segundo, cabeza.

Y es incómodo en los dos sentidos: exige confiar desde arriba y exige hacerse cargo desde abajo. Mucha gente prefiere la lista.

## Dónde te toca aunque no tengas un equipo de producto

Esto no es solo para empresas de software. Cada vez que pedís algo definido como solución —"necesito un formulario nuevo"— en vez de como problema —"las familias abandonan en este paso y no sé por qué"—, estás armando una fábrica de funcionalidades de una persona.

Y cuando el que construye sos vos con una IA, el riesgo es peor, no mejor: podés producir funcionalidades más rápido que nunca sin haber validado que alguien las necesita. **La velocidad para construir lo equivocado no es una ventaja.**
$md$, 7
from books b where b.slug = 'inspired'
on conflict do nothing;

insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'es', 'no_lei', 2, 'Los cuatro riesgos',
$md$
Esta es la parte más útil del libro y la que podés usar mañana sin cambiar nada de cómo trabajás.

Antes de construir cualquier cosa, Cagan dice que hay **cuatro riesgos** distintos, y que la mayoría de los proyectos fracasan porque atendieron uno y supusieron los otros tres.

**Valor.** ¿Alguien lo va a usar? ¿Lo suficiente como para cambiar lo que hace hoy? Este es el que mata más proyectos y el que menos se chequea, porque es el único que no se resuelve con esfuerzo.

**Usabilidad.** ¿La gente puede darse cuenta sola de cómo se usa? No si es lindo: si se entiende sin que vos estés al lado explicando.

**Viabilidad técnica.** ¿Se puede construir con lo que tenés, en el tiempo que tenés?

**Viabilidad del negocio.** ¿Funciona para tu organización? Legal, presupuesto, soporte, quién lo mantiene cuando vos no estés, si viola alguna norma interna.

## Por qué el orden importa

La mayoría de la gente técnica ataca primero la viabilidad técnica, porque es la más entretenida y la que sabe resolver. Y es la que menos proyectos mata.

El orden correcto es casi el inverso: **primero valor**, que es el más barato de chequear y el más caro de descubrir tarde. Una conversación de veinte minutos con tres personas que tendrían el problema vale más que dos semanas de construcción.

## Para probar hoy

Agarrá algo que tengas ganas de construir y escribí una línea por riesgo. En cuál de los cuatro tenés evidencia de verdad y en cuáles estás suponiendo. Si el de valor está en "supongo", ese es tu próximo paso, y no es escribir código.
$md$, 7
from books b where b.slug = 'inspired'
on conflict do nothing;

insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'es', 'no_lei', 3, 'Descubrir y entregar son dos oficios',
$md$
La otra distinción que vale la pena llevarse: Cagan separa **descubrimiento** de **entrega**, y dice que confundirlos es la causa de la mayoría del trabajo desperdiciado.

**Descubrir** es averiguar qué vale la pena construir. Se hace rápido, sucio y barato: bocetos, prototipos de mentira, conversaciones, cosas que se tiran. El objetivo no es que funcione, es aprender. Si no tirás a la basura la mayor parte de lo que hacés descubriendo, estás descubriendo mal.

**Entregar** es construir eso bien, para que aguante. Lento, prolijo, probado.

El error clásico es aplicar los estándares de la entrega al descubrimiento: construir bien algo que todavía no sabés si sirve. Se siente responsable y es lo contrario: es la forma más cara de averiguar que no servía.

## Prototipos antes que documentos

De ahí su regla práctica: **nada de especificaciones largas, prototipos**. Un prototipo que alguien puede tocar te dice en cinco minutos lo que un documento no te dice nunca, porque la gente no sabe opinar sobre descripciones pero sí sobre cosas.

Hoy eso es más cierto que cuando lo escribió: con una IA, un prototipo tocable de una idea cuesta una tarde. Lo que antes justificaba escribir el documento —que prototipar era caro— ya no se sostiene.

## La trampa en la que vas a caer

Cuando prototipar es tan barato, la tentación es saltearse el descubrimiento y prototipar directo la solución que ya tenías en la cabeza. Sigue siendo entrega disfrazada. **Descubrir no es construir rápido: es averiguar antes de construir.**
$md$, 7
from books b where b.slug = 'inspired'
on conflict do nothing;

-- ---------- Para quien lo leyó hace tiempo ----------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'es', 'hace_tiempo', 1, 'Lo que se te borró, y lo que envejeció',
$md$
**Lo que se olvida primero** es que Cagan no habla de un método sino de quién decide. Todo el libro gira alrededor de equipos con poder real para elegir la solución. Sin eso, las técnicas que describe son teatro: podés hacer descubrimiento prolijo y después construir igual lo que bajó de arriba.

**Lo segundo que se borra** es su definición del rol de producto, que es dura: conocer a los usuarios mejor que nadie, conocer los datos mejor que nadie, conocer el negocio y el mercado mejor que nadie. No es coordinar, no es escribir tickets, no es traducir entre áreas. Si el trabajo es coordinar, eso es un proyecto, no un producto.

**Lo que envejeció mal:** el libro asume una organización con equipos dedicados de diseño e ingeniería. Para alguien que construye solo, o para un área chica, gran parte de la estructura organizacional que propone no aplica. También tiene un tono de consultor que repite el contraste entre las grandes tecnológicas y "los demás" más veces de las necesarias.

**Lo que envejeció bien:** los cuatro riesgos y la separación entre descubrir y entregar. Esas dos ideas funcionan igual para una sola persona que para una empresa de mil.

**Y lo que no estaba:** qué pasa con el descubrimiento cuando construir cuesta diez veces menos. Cagan escribió cuando prototipar era caro y por eso había que elegir bien qué prototipar. Hoy el cuello de botella se corrió: ya no es construir, es saber qué vale la pena. El libro, sin querer, se volvió más relevante.
$md$, 6
from books b where b.slug = 'inspired'
on conflict do nothing;

-- ---------- Para quien lo tiene fresco ----------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'es', 'fresco', 1, 'Aplicado a lo que estás construyendo',
$md$
Si lo tenés fresco, el ejercicio no es repasarlo: es aplicarle los cuatro riesgos a tu propio proyecto, que es justo lo que uno evita hacer con lo propio.

**Uno. Los cuatro riesgos, con honestidad.** Escribí tu proyecto arriba y, debajo, una línea por riesgo —valor, usabilidad, viabilidad técnica, viabilidad del negocio— con una sola palabra al lado: **evidencia** o **supuesto**.

Casi siempre pasa lo mismo: la viabilidad técnica tiene evidencia de sobra, porque es lo que venís haciendo, y el valor dice "supuesto". Si ese es tu caso, tu próximo paso no es una funcionalidad.

**Dos. La pregunta del valor, bien hecha.** No es "¿te parece útil?", porque todo el mundo dice que sí. Es: **"¿qué hacés hoy para resolver esto?"**. Si la respuesta es "nada" o "lo aguanto", no hay problema suficiente. Si hay algo que ya hacen, por torpe que sea, ahí hay valor y además ya sabés contra qué competís.

**Tres. Separá tu semana.** Mirá los próximos siete días y marcá cada bloque como descubrimiento o entrega. Si todo es entrega, estás construyendo sobre supuestos, por bien que lo estés construyendo.

**Cuatro, la que incomoda:** nombrá una cosa que construiste en los últimos tres meses que nadie usó. No para castigarte: para encontrar cuál de los cuatro riesgos no habías chequeado. Casi siempre es el mismo, siempre, en todos los proyectos de una misma persona. Encontrar cuál es el tuyo vale más que el libro entero.
$md$, 7
from books b where b.slug = 'inspired'
on conflict do nothing;
