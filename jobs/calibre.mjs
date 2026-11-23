// ============================================================
// Frontera - el calibre del próximo reto
// ============================================================
// `dificultad` y `sirvio` son los dos clics que se piden al cerrar un
// reto. Hasta la 050 no los leía nadie: se guardaban en `challenges` y
// ahí morían. Pedir una señal y no usarla es peor que no pedirla.
//
// Acá es donde pesan. El reto siguiente lo escribe una persona con
// criterio a partir de un brief, y estos dos números son todo lo que
// sabemos de cómo le fue con el anterior.
//
// La regla, que es una sola: un reto durísimo y un reto trivial fallan
// por el mismo motivo —la calibración— y se corrigen en direcciones
// opuestas. El medio (4 a 7) es la zona buena y no se toca.
// ============================================================

export function calibrar(ultimo) {
  if (!ultimo || ultimo.dificultad == null) {
    return 'sin referencia: es el primero que cierra, apuntá al medio (20 a 25 minutos)';
  }

  if (ultimo.dificultad >= 8) {
    return `el anterior le costó ${ultimo.dificultad} sobre 10: bajá el calibre, menos pasos y una sola cosa nueva`;
  }

  if (ultimo.dificultad <= 3) {
    return `el anterior le resultó fácil (${ultimo.dificultad} sobre 10): subí el calibre, que haya una decisión y no sólo ejecución`;
  }

  return `el anterior quedó en ${ultimo.dificultad} sobre 10, que es la zona buena: mismo calibre`;
}

// Dos retos seguidos que no le sirvieron en el mismo nodo no son un
// dato sobre la persona: son un dato sobre cómo lo planteamos. Ese nodo
// sale de la lista de huecos candidatos.
//
// `cerrados` viene ordenado del más reciente al más viejo.
export function nodosQuemados(cerrados, topicIds) {
  const fuera = new Set();
  for (const id of topicIds) {
    const suyos = cerrados.filter(r => r.topic_id === id);
    if (suyos.length >= 2 && suyos.slice(0, 2).every(r => r.sirvio === -1)) fuera.add(id);
  }
  return fuera;
}
