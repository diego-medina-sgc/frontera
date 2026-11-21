// Service worker mínimo.
// Está por dos razones: sin un worker con handler de fetch, Chrome no
// ofrece instalar la app en el teléfono; y cachear el armazón hace que
// abra al instante aunque la conexión esté mala (subte, ascensor).
// El contenido NO se cachea: siempre va a la red, para que nunca te
// muestre una lección vieja.

const CACHE = 'frontera-v1';
const ARMAZON = [
  './',
  './index.html',
  './styles.css',
  './app.js',
  './config.js',
  './icono.svg',
  './manifest.webmanifest'
];

self.addEventListener('install', (e) => {
  e.waitUntil(caches.open(CACHE).then((c) => c.addAll(ARMAZON)).then(() => self.skipWaiting()));
});

self.addEventListener('activate', (e) => {
  e.waitUntil(
    caches.keys()
      .then((ks) => Promise.all(ks.filter((k) => k !== CACHE).map((k) => caches.delete(k))))
      .then(() => self.clients.claim())
  );
});

self.addEventListener('fetch', (e) => {
  const url = new URL(e.request.url);

  // Todo lo que no sea el armazón propio (Supabase, el CDN) va directo a
  // la red, sin tocar el cache.
  if (e.request.method !== 'GET' || url.origin !== self.location.origin) return;

  // Red primero, cache como red de emergencia.
  e.respondWith(
    fetch(e.request)
      .then((r) => {
        const copia = r.clone();
        caches.open(CACHE).then((c) => c.put(e.request, copia));
        return r;
      })
      .catch(() => caches.match(e.request).then((r) => r || caches.match('./index.html')))
  );
});
