-- ============================================================
-- Frontera - precisión sobre lo que Kahneman reconoció y lo que no
-- ============================================================
-- Las piezas de Thinking, Fast and Slow atribuían a Kahneman el
-- reconocimiento público de 2017 sobre DOS capítulos: el priming de
-- conducta y la depleción del ego. Verificado: el comentario de 2017
-- (en el blog de Ulrich Schimmack, sobre "Reconstruction of a Train
-- Wreck") es sobre el capítulo 4, el del priming. Ahí dijo que la
-- evidencia era mucho más débil de lo que creía al escribirlo, que su
-- razonamiento había sido flojo y que debería haberlo sabido.
--
-- De la depleción del ego no hay una declaración suya equivalente. Lo
-- que hay es la medición del campo: una replicación preregistrada
-- multisitio (36 laboratorios, 3.531 personas, publicada en 2021) que
-- no encontró el efecto.
--
-- Mezclarlas le pone en la boca algo que no dijo, y además borra la
-- distinción que vale la pena enseñar: una cosa es que el autor se
-- haga cargo y otra es que el campo lo mida.
--
-- Se corrige con replace() sobre el párrafo exacto, en las dos piezas
-- afectadas y en los dos idiomas. Al final hay un control.
-- ============================================================

-- ---------- es · no_lei 3 ----------
update book_pieces
set body_md = replace(
  body_md,
  'Kahneman reconoció públicamente en 2017 que había dado demasiado crédito a estudios chicos y que los lectores no deberían haberle creído sobre esa parte. Un Nobel, diciéndolo de su libro más vendido.',
  '**Los dos casos no corrieron igual, y la diferencia importa.** Del priming se hizo cargo él: en 2017 escribió públicamente que la evidencia del capítulo era mucho más débil de lo que creía cuando lo escribió, que su razonamiento había sido flojo y que debería haberlo sabido. Un Nobel, diciéndolo del capítulo 4 de su libro más vendido.

De la depleción del ego no hizo esa declaración. Ahí el que contestó fue el campo: una replicación con 36 laboratorios y más de 3.500 personas no encontró el efecto. Las dos ideas se cayeron, pero una la bajó el autor y la otra la bajó la medición de otros.'
)
where idx = 3
  and lang = 'es'
  and for_read_state = 'no_lei'
  and book_id = (select id from books where slug = 'thinking-fast-slow');

-- ---------- es · hace_tiempo 1 ----------
update book_pieces
set body_md = replace(
  body_md,
  '**Dos capítulos no replicaron.** El priming de conducta y la depleción del ego, que fueron de lo más citado del libro, no se sostuvieron cuando se repitieron con más gente. Kahneman lo reconoció públicamente en 2017. Si todavía contás el experimento de caminar más lento, convendría dejarlo de lado.',
  '**Dos capítulos no replicaron.** El priming de conducta y la depleción del ego, que fueron de lo más citado del libro, no se sostuvieron cuando se repitieron con más gente. El priming lo reconoció Kahneman él mismo, públicamente, en 2017: dijo que la evidencia era mucho más débil de lo que creía al escribir ese capítulo. La depleción del ego la bajó el campo, con una replicación de 36 laboratorios que no encontró el efecto, y de eso él no se pronunció. Si todavía contás el experimento de caminar más lento, convendría dejarlo de lado.'
)
where idx = 1
  and lang = 'es'
  and for_read_state = 'hace_tiempo'
  and book_id = (select id from books where slug = 'thinking-fast-slow');

-- ---------- en · no_lei 3 ----------
update book_pieces
set body_md = replace(
  body_md,
  'Kahneman acknowledged publicly in 2017 that he had given too much credit to small studies and that readers shouldn''t have believed him on that part. A Nobel laureate, saying that about his best-selling book.',
  '**The two cases didn''t run the same way, and the difference matters.** Kahneman owned the priming one himself: in 2017 he wrote publicly that the evidence for that chapter was much weaker than he had believed when he wrote it, that his reasoning had been flawed and that he should have known better. A Nobel laureate, saying that about chapter 4 of his best-selling book.

He made no such statement about ego depletion. There it was the field that answered: a replication across 36 laboratories and more than 3,500 people found no effect. Both ideas fell, but one was brought down by the author and the other by other people''s measurements.'
)
where idx = 3
  and lang = 'en'
  and for_read_state = 'no_lei'
  and book_id = (select id from books where slug = 'thinking-fast-slow');

-- ---------- en · hace_tiempo 1 ----------
update book_pieces
set body_md = replace(
  body_md,
  '**Two chapters didn''t replicate.** Behavioural priming and ego depletion, which were among the most quoted parts of the book, didn''t hold up when repeated with more people. Kahneman acknowledged this publicly in 2017. If you still tell the story of the experiment about walking more slowly, it''s best to leave it out.',
  '**Two chapters didn''t replicate.** Behavioural priming and ego depletion, which were among the most quoted parts of the book, didn''t hold up when repeated with more people. Kahneman acknowledged the priming one himself, publicly, in 2017: he said the evidence was much weaker than he had believed when he wrote that chapter. Ego depletion was brought down by the field instead, with a replication across 36 laboratories that found no effect, and on that he said nothing. If you still tell the story of the experiment about walking more slowly, it''s best to leave it out.'
)
where idx = 1
  and lang = 'en'
  and for_read_state = 'hace_tiempo'
  and book_id = (select id from books where slug = 'thinking-fast-slow');

-- ---------- control ----------
-- Tiene que devolver 4 filas con cambio = true y 0 con atribucion vieja.
select
  lang,
  for_read_state,
  idx,
  (body_md like '%36 laborator%') as cambio,
  (body_md like '%la depleción del ego, que fueron de lo más citado del libro, no se sostuvieron cuando se repitieron con más gente. Kahneman lo reconoció%'
   or body_md like '%readers shouldn''t have believed him on that part%'
   or body_md like '%los lectores no deberían haberle creído sobre esa parte%'
   or body_md like '%with more people. Kahneman acknowledged this publicly in 2017%') as atribucion_vieja,
  length(body_md) as largo
from book_pieces
where book_id = (select id from books where slug = 'thinking-fast-slow')
  and ((for_read_state = 'no_lei' and idx = 3) or (for_read_state = 'hace_tiempo' and idx = 1))
order by lang, for_read_state;
