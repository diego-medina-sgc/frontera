// ============================================================
// Frontera - triage, primera etapa
// ============================================================
// Puntúa cada señal contra el mapa del campo. No usa IA, no cuesta nada
// y corre en milisegundos. Su único trabajo es bajar de 105 señales a
// 15, para que la segunda etapa —la que sí usa criterio— no desperdicie
// atención en lo que ya se sabe que no sirve.
//
// Lo que premia:
//   · primicia de fuente (un paper vale más que un comentario)
//   · términos del mapa (de qué nodo es)
//   · palabras de lanzamiento (salió algo, no alguien opinando)
//   · palabras de contradicción (lo más valioso: esto que creías cambió)
//   · señal social objetiva (puntos, estrellas)
//
// Lo que castiga:
//   · dominios que no son el campo de nadie acá (medicina, drones, 6G)
//   · contenido de nivel inicial
// ============================================================

import { NODOS, PRIMICIA, CONTRADICE, RUIDO, BASICO } from './lexico.mjs';

const cuenta = (texto, terminos) => terminos.filter(t => texto.includes(t)).length;

export function puntuar(senal) {
  const texto = `${senal.titulo} ${senal.resumen || ''}`.toLowerCase();
  const motivos = [];
  let puntos = 0;

  // Primicia de la fuente: 1 vale 3, 2 vale 2, 3 vale 1
  puntos += 4 - senal.primacy;

  // ¿De qué nodo del mapa es?
  let nodo = null, mejor = 0;
  for (const [slug, def] of Object.entries(NODOS)) {
    const n = cuenta(texto, def.terminos);
    if (!n) continue;
    const suma = n * def.peso;
    puntos += suma;
    if (suma > mejor) { mejor = suma; nodo = slug; }
  }

  const lanzamiento = cuenta(texto, PRIMICIA.terminos);
  if (lanzamiento) { puntos += PRIMICIA.peso; motivos.push('salió algo'); }

  const contra = cuenta(texto, CONTRADICE.terminos);
  if (contra) { puntos += CONTRADICE.peso; motivos.push('contradice'); }

  const ruido = cuenta(texto, RUIDO.terminos);
  if (ruido) { puntos += ruido * RUIDO.peso; motivos.push('fuera de campo'); }

  const basico = cuenta(texto, BASICO.terminos);
  if (basico) { puntos += BASICO.peso; motivos.push('nivel inicial'); }

  // Señal social: no define, confirma.
  const social = senal.resumen?.match(/(\d[\d.,]*)\s*(puntos|estrellas)/);
  if (social) {
    const n = parseInt(social[1].replace(/[.,]/g, ''), 10);
    if (n > 500) puntos += 2;
    else if (n > 150) puntos += 1;
  }

  return { puntos, nodo, motivos };
}

export function filtrar(senales, { corte = 6, tope = 15 } = {}) {
  const puntuadas = senales
    .map(s => ({ ...s, ...puntuar(s) }))
    .sort((a, b) => b.puntos - a.puntos);

  return {
    candidatas: puntuadas.filter(s => s.puntos >= corte).slice(0, tope),
    descartadas: puntuadas.filter(s => s.puntos < corte).length,
    todas: puntuadas
  };
}

export function informe(resultado) {
  const { candidatas, descartadas, todas } = resultado;
  const lineas = [];

  lineas.push(`# Radar · ${new Date().toISOString().slice(0, 10)}`);
  lineas.push('');
  lineas.push(`${todas.length} señales recolectadas · ${descartadas} descartadas por el filtro · ${candidatas.length} para mirar`);
  lineas.push('');
  lineas.push('Lo que sigue es una lista de candidatas, no de lecciones. Decidir');
  lineas.push('cuáles son nuevas de verdad y escribirlas es la segunda etapa.');
  lineas.push('');

  for (const [i, s] of candidatas.entries()) {
    lineas.push(`## ${i + 1}. ${s.titulo}`);
    lineas.push('');
    lineas.push(`- Puntaje: ${s.puntos}${s.motivos.length ? ` (${s.motivos.join(', ')})` : ''}`);
    lineas.push(`- Nodo sugerido: ${s.nodo || 'sin asignar'}`);
    lineas.push(`- Fuente: ${s.fuente}`);
    lineas.push(`- ${s.url}`);
    if (s.resumen) {
      lineas.push('');
      lineas.push(s.resumen.length > 320 ? s.resumen.slice(0, 319) + '…' : s.resumen);
    }
    lineas.push('');
  }

  return lineas.join('\n');
}
