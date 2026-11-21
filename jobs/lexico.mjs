// ============================================================
// Frontera - léxico del triage
// ============================================================
// La primera etapa del filtro no usa IA y no cuesta nada: puntúa cada
// señal contra el mapa del campo usando términos. De 105 señales deja
// 15, y recién sobre esas 15 vale la pena gastar criterio.
//
// Esto es data, no código: se edita a mano a medida que el campo cambia.
// Cuando un término deja de distinguir (por ejemplo "AI", que hoy está
// en todo), se saca.
// ============================================================

// Términos por nodo del mapa. El peso dice cuánto suma encontrarlo.
export const NODOS = {
  agentes: {
    peso: 3,
    terminos: ['agent', 'agentic', 'mcp', 'model context protocol', 'tool use',
               'tool calling', 'function calling', 'multi-agent', 'orchestration',
               'claude code', 'computer use', 'skill']
  },
  evals: {
    peso: 3,
    terminos: ['eval', 'evals', 'benchmark', 'benchmarking', 'regression',
               'llm-as-judge', 'llm as a judge', 'reliability', 'guardrail',
               'hallucination detection', 'observability']
  },
  automatizacion: {
    peso: 3,
    terminos: ['workflow', 'automation', 'automate', 'pipeline', 'zapier',
               'n8n', 'cron', 'scheduled', 'integration']
  },
  producto: {
    peso: 3,
    terminos: ['rag', 'retrieval', 'vector', 'embedding', 'supabase', 'postgres',
               'fine-tune', 'fine-tuning', 'deploy', 'production', 'latency',
               'cost', 'pricing', 'api']
  },
  negocios: {
    peso: 3,
    terminos: ['adoption', 'enterprise', 'roi', 'productivity', 'workforce',
               'rollout', 'governance', 'policy', 'compliance', 'education',
               'school', 'marketing', 'crm', 'salesforce']
  },
  modelos: {
    peso: 2,
    terminos: ['claude', 'gpt', 'gemini', 'llama', 'mistral', 'opus', 'sonnet',
               'haiku', 'release', 'launch', 'model card', 'frontier model',
               'open weights', 'open-source model']
  },
  'contexto-largo': {
    peso: 2,
    terminos: ['context window', 'long context', 'memory', 'caching',
               'prompt caching', 'kv cache', 'compaction']
  },
  diseno: {
    peso: 2,
    terminos: ['image generation', 'video generation', 'diffusion', 'midjourney',
               'design', 'ui generation', 'figma', 'creative']
  },
  'como-pedir': {
    peso: 2,
    terminos: ['prompt', 'prompting', 'system prompt', 'context engineering',
               'few-shot', 'chain of thought']
  },
  privacidad: {
    peso: 2,
    terminos: ['privacy', 'data leak', 'pii', 'gdpr', 'prompt injection',
               'jailbreak', 'security', 'exfiltration']
  }
};

// Señales de que algo es una novedad de verdad y no un paper más.
export const PRIMICIA = {
  peso: 4,
  terminos: ['release', 'launch', 'announcing', 'introducing', 'now available',
             'general availability', 'changelog', 'deprecat', 'breaking change',
             'open sourc', 'ships', 'shipped']
};

// Señales de que algo contradice lo que se creía. Es lo más valioso que
// puede traer el radar: no lo nuevo, lo que invalida lo que sabías.
export const CONTRADICE = {
  peso: 5,
  terminos: ['turns out', 'was wrong', 'myth', 'contrary to', 'rethinking',
             'reconsidering', 'overrated', "doesn't work", 'does not work',
             'failed', 'retract', 'debunk', 'no longer']
};

// Ruido: investigación académica de dominios que no son el campo de
// aplicación de nadie en este círculo. Restan fuerte.
export const RUIDO = {
  peso: -6,
  terminos: ['esophagus', 'dysplasia', 'tumor', 'clinical', 'patient',
             'molecular', 'protein', 'genomic', 'radiology', 'histopathology',
             'eeg', 'fmri', 'crop', 'agricultur', 'seismic', 'astronom',
             'quantum circuit', 'federated learning', 'humanoid', 'locomotion',
             'autonomous driving', 'uav', 'drone', 'wireless', '6g', 'mimo',
             'speech enhancement', 'marathi', 'bengali', 'swahili']
};

// Ruido de nivel: cosas correctas pero que no le aportan a nadie que ya
// pasó el track fundacional.
export const BASICO = {
  peso: -4,
  terminos: ['what is ai', 'beginner', 'introduction to', 'getting started',
             'tutorial for beginners', 'explained simply', '101']
};
