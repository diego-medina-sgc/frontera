// Configuración de Frontera.
// La publishable key es pública por diseño: no da acceso a nada que la
// seguridad por fila (RLS) no permita. La service_role NUNCA va acá.
export const SUPABASE_URL = 'https://lboyidbtjxjkhwupysks.supabase.co';
export const SUPABASE_KEY = 'sb_publishable_iXble03uonWB2lnjra0UtA_vHoBcJQI';

// La clave pública de los avisos (VAPID). Es pública por diseño: el
// navegador la usa para suscribirse. La privada vive sólo en los
// secretos de la función `avisar` en Supabase.
export const VAPID_PUBLICA = 'BCcTvm95lSY8BYrcH-1ajSphzkY2x4_ncc3FUuL6APWVpF0OpobG9OFjgCE75Xzd1ix7H4BJ2Z6bzrOEfsnGMo4';
