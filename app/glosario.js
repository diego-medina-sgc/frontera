// ============================================================
// Glosario: lo que una palabra quiere decir, si la tocás
// ============================================================
// Pocas palabras y a propósito. El 24/11 se contó qué términos
// aparecen sin explicar en las lecciones de nivel 0 a 2: el contenido
// ya está escrito casi sin jerga ("prompt", "token" o "agente" no
// aparecen ni una vez). Estas son las que sí aparecen y alguien que
// recién empieza puede no conocer. Marcar más sería marcar palabras
// que ya se entienden.
//
// Reglas, que viven en app.js (marcarGlosario):
//   · sólo para niveles 0 a 2: a quien construye no se le subraya
//     "modelo" (nunca te explica lo que ya sabés);
//   · sólo la primera vez que aparece cada término en una lectura;
//   · se toca si se quiere, y abre la definición debajo del párrafo.
//     No interrumpe la lectura y no deja nada pendiente.
//
// Las definiciones son de una o dos líneas, en lenguaje de todos los
// días. Si un término necesita más, no es para el glosario: es una
// lección.
// ============================================================

export const GLOSARIO = [
  {
    es: /\bmodelos?\b/i,
    en: /\bmodels?\b/i,
    def: {
      es: 'El "cerebro" que hay detrás de una herramienta de IA. ChatGPT, Claude y Gemini son herramientas; cada una usa uno o varios modelos, que se actualizan cada tanto.',
      en: 'The "brain" behind an AI tool. ChatGPT, Claude and Gemini are tools; each uses one or more models, which get updated every so often.'
    }
  },
  {
    es: /\bcontexto\b/i,
    en: /\bcontext\b/i,
    def: {
      es: 'Todo lo que la IA tiene a la vista cuando te responde: lo que escribiste, lo que subiste y lo que ya se dijo en la conversación. Lo que no está ahí, no lo sabe.',
      en: 'Everything the AI can see when it answers you: what you wrote, what you uploaded and what has been said in the conversation. Whatever isn\'t there, it doesn\'t know.'
    }
  },
  {
    es: /\binstrucciones personales\b/i,
    en: /\bpersonal instructions\b/i,
    def: {
      es: 'Un texto que dejás guardado una sola vez en tu herramienta para que sepa quién sos y cómo querés que te responda. Lo armaste en el Paso 1.',
      en: 'A text you save once in your tool so it knows who you are and how you want it to answer. You put it together in Step 1.'
    }
  },
  {
    es: /\bproyectos?\b/i,
    en: /\bprojects?\b/i,
    def: {
      es: 'En ChatGPT y en Claude, un espacio donde dejás archivos e instrucciones para un tema, así no los repetís en cada conversación.',
      en: 'In ChatGPT and Claude, a space where you keep files and instructions for one topic, so you don\'t repeat them in every conversation.'
    }
  },
  {
    es: /\bGPTs?\b/,
    en: /\bGPTs?\b/,
    def: {
      es: 'En ChatGPT, un asistente que armás vos con instrucciones y archivos propios, para una tarea que repetís.',
      en: 'In ChatGPT, an assistant you build yourself with your own instructions and files, for a task you repeat.'
    }
  },
  {
    es: /\bGems?\b/,
    en: /\bGems?\b/,
    def: {
      es: 'Lo mismo que un GPT, pero en Gemini: un asistente propio con instrucciones guardadas para una tarea.',
      en: 'The same as a GPT, but in Gemini: your own assistant with saved instructions for a task.'
    }
  },
  {
    es: /\bmemoria\b/i,
    en: /\bmemory\b/i,
    def: {
      es: 'Lo que algunas herramientas recuerdan de vos de una conversación a otra. No es lo mismo que el contexto: el contexto se pierde al cerrar la conversación.',
      en: 'What some tools remember about you from one conversation to the next. It isn\'t the same as context: context is lost when the conversation ends.'
    }
  },
  {
    es: /\balucin\p{L}*/iu,
    en: /\bhallucinat\w*/i,
    def: {
      es: 'Cuando la IA afirma algo falso con toda seguridad: un dato, una cita, un nombre. No miente a propósito: completa con lo que le parece más probable.',
      en: 'When the AI states something false with complete confidence: a fact, a quote, a name. It isn\'t lying on purpose: it fills in what seems most likely.'
    }
  },
  {
    es: /\bautomatiz\p{L}*/iu,
    en: /\bautomat(?:e|ed|es|ing|ion)\b/i,
    def: {
      es: 'Que una tarea se haga sola, sin que la dispares vos cada vez.',
      en: 'Getting a task to happen on its own, without you having to start it each time.'
    }
  },
  {
    es: /\breceta\b/i,
    en: /\brecipe\b/i,
    def: {
      es: 'En Frontera, una instrucción guardada para una tarea que se repite: para qué es, lo que va siempre, las reglas, los ejemplos y el hueco que completás cada vez.',
      en: 'In Frontera, a saved instruction for a task that repeats: what it\'s for, what always goes in, the rules, the examples and the gap you fill in each time.'
    }
  }
];

// Cuántas palabras se marcan como máximo en una misma lectura. Más que
// esto deja de ser ayuda y pasa a ser ruido.
export const MAX_POR_LECTURA = 5;
