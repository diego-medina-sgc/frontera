// ============================================================
// i18n de la interfaz (es -> en)
// ============================================================
// El español es el idioma de origen: todo texto del código está escrito
// en español y tr() lo traduce al vuelo cuando el idioma activo es 'en'.
//
// Orden de búsqueda: 1) texto exacto en EN, 2) PATRONES con valores
// interpolados, 3) texto de varias líneas, traducido línea por línea,
// 4) si no hay nada, el original. Nunca rompe ni devuelve undefined.
//
// No incluye contenido de lecciones ni de libros (viene de la base).
// ============================================================

let lang = 'es';

export function setLang(l) {
  lang = l === 'en' ? 'en' : 'es';
}

// Plural simple: n === 1 usa singular, el resto plural.
const pl = (n, uno, varios) => (Number(n) === 1 ? uno : varios);

// ------------------------------------------------------------
// Textos exactos
// ------------------------------------------------------------
const EN = {
  // ---- index.html ----
  'Aprender IA al ritmo en que la IA cambia.': "Learn AI at the pace AI changes.",
  'Hay una versión nueva': "A new version is available",
  'Actualizar': "Update",
  'Cerrar el aviso': "Dismiss the notice",
  'Cargando…': "Loading…",
  'Secciones': "Sections",
  'Hoy': "Today",
  'Reto': "Challenge",
  'Mapa': "Map",
  'Libros': "Books",
  'Volver': "Back",
  'Tamaño y fondo': "Size and background",

  // ---- Markdown / lector ----
  'Ver la respuesta': "Show the answer",
  'Texto': "Text",
  'Fondo': "Background",
  'Auto': "Auto",
  'Claro': "Light",
  'Sepia': "Sepia",
  'Oscuro': "Dark",
  'Ir al principio': "Back to the start",
  'Listo': "Done",

  // ---- Acentos (nombres de color) ----
  'Lima': "Lime",
  'Bosque': "Forest",
  'Ámbar': "Amber",
  'Océano': "Ocean",
  'Violeta': "Violet",
  'Óxido': "Rust",

  // ---- Arranque ----
  'Falta un paso': "One step missing",
  'Hay que pegar la publishable key de Supabase en app/config.js.': "The Supabase publishable key needs to be pasted into app/config.js.",

  // ---- Cabecera y ajustes ----
  'Frontera': "Frontera",
  'Semanas seguidas aprendiendo': "Weeks in a row learning",
  'Ajustes': "Settings",
  'Tu Frontera': "Your Frontera",
  'Color': "Color",
  'Color de la app': "App color",
  'Lectura': "Reading",
  'El tamaño vale para los textos largos. El fondo, para toda la app.': "Size applies to long texts. Background applies to the whole app.",
  'Idioma': "Language",
  'Por ahora todo el contenido está en español. Cuando haya en otro idioma, va a aparecer acá.': "For now all the content is in Spanish. When there's content in another language, it will show up here.",
  'Cuenta': "Account",
  'Salir de la cuenta': "Sign out",
  'Español': "Español",
  'English': "English",

  // ---- Ajustes: Vos ----
  'Vos': "You",
  'Tu contexto': "Your context",
  'Es lo que usa la app para elegir de qué lado traerte las cosas y sobre qué armarte un reto. Si cambiaste de trabajo, cambialo acá.': "It's what the app uses to decide which side to bring things from, and what to build a challenge around. If you've changed jobs, change it here.",
  'A qué te dedicás, con quién trabajás y para qué usás la IA.': "What you do, who you work with and what you use AI for.",
  'Si tenés tus instrucciones en otro lado, pegalas acá para tenerlas a mano.': "If your instructions live somewhere else, paste them here to keep them to hand.",
  'El texto que armamos en el Paso 1. Es tuyo: copialo cuando lo necesites.': "The text we put together in Step 1. It's yours: copy it whenever you need it.",
  'Acá no hay nada porque ya tenías las tuyas armadas. Si querés tenerlas a mano, pegalas.': "There's nothing here because you already had your own. If you want them to hand, paste them in.",
  'Copiar las instrucciones': "Copy the instructions",
  'Copialo a mano del cuadro': "Copy it by hand from the box",
  'Guardar': "Save",
  'Guardando…': "Saving…",
  'Guardado ✓': "Saved ✓",
  'No se pudo guardar. Probá de nuevo.': "Couldn't save. Try again.",

  // ---- Ajustes: Círculo ----
  'Círculo': "Circle",
  'Sumar a alguien': "Add someone",
  'Le creás la cuenta y le pasás vos el mail y la contraseña. No se manda ningún correo. Después puede cambiarla desde Ajustes, en "Contraseña".': "You create the account and pass on the email and password yourself. No email is sent. They can change it afterwards in Settings, under \"Password\".",
  'mail@ejemplo.com': "name@example.com",
  'Al menos 8 caracteres': "At least 8 characters",
  'Dar de alta': "Create the account",
  'Creando la cuenta…': "Creating the account…",
  'Listo. Ya puede entrar con ese mail y esa contraseña.': "Done. They can sign in now with that email and password.",
  'La cuenta quedó creada pero sin perfil. Avisá antes de que entre.': "The account was created but has no profile. Flag it before they sign in.",
  // Los textos que devuelve la edge function, para que el error no
  // aparezca en castellano en una app en inglés.
  'No se pudo crear la cuenta.': "The account couldn't be created.",
  'Tu cuenta no puede sumar gente.': "Your account can't add people.",
  'Ya hay una cuenta con ese mail.': "There's already an account with that email.",
  'Ese mail no parece un mail.': "That doesn't look like an email address.",
  'La contraseña tiene que tener al menos 8 caracteres.': "The password needs at least 8 characters.",
  'Sesión inválida.': "Invalid session.",
  'Sin sesión.': "No session.",
  'No entendí el pedido.': "I didn't understand the request.",

  // ---- Semana ----
  'Esta semana': "This week",
  'L': "M",
  'J': "T",
  'V': "F",
  'S': "S",
  'D': "S",

  // ---- Entrar ----
  'tu@mail.com': "you@email.com",
  'Tu contraseña': "Your password",
  'Tu mail': "Your email",
  'Un segundo…': "One moment…",
  'El alta de cuentas está cerrada. Pedile a Diego que te habilite una y volvé a entrar acá.': "Sign-ups are closed. Ask Diego to set up an account for you, then come back here.",
  'El mail o la contraseña no coinciden.': "The email or password doesn't match.",
  'Entrar': "Sign in",
  'Es mi primera vez, crear cuenta': "First time here? Create an account",

  // ---- Paso 1 ----
  'Paso 1': "Step 1",
  'Tus instrucciones personales': "Your personal instructions",
  'Todas las herramientas de IA tienen un lugar donde dejás escrito, una sola vez, quién sos y cómo querés que te hablen. Antes de arrancar quiero saber en qué punto estás.': "Every AI tool has a place where you write down, once, who you are and how you want it to talk to you. Before we start, I want to know where you're at.",
  'No sé qué son': "I don't know what they are",
  'Te explico para qué sirven y las armamos juntos': "I'll explain what they're for and we'll build them together",
  'Sé lo que son, pero no las tengo': "I know what they are, but I don't have any",
  'Vamos directo a armarlas': "Let's go straight to building them",
  'Ya las tengo armadas': "I already have them set up",
  'Unas pocas preguntas para conocerte y listo': "A few questions to get to know you, and that's it",
  'Armemos tus instrucciones': "Let's build your instructions",
  'Cada vez que abrís una conversación con una IA, empieza de cero: no sabe quién sos ni cómo te gusta que te hablen. Eso se arregla una sola vez y queda para siempre.': "Every time you open a conversation with an AI, it starts from zero: it doesn't know who you are or how you like to be spoken to. You fix that once and it stays fixed.",
  'Empezar': "Start",
  'Antes de empezar': "Before we start",
  '¿Con qué herramientas andás?': "Which tools do you use?",
  '¿Cuáles usás hoy?': "Which ones do you use today?",
  'Todo lo que te enseñe va a estar explicado para estas. Si no usás ninguna todavía, no marques nada.': "Everything I teach you will be explained for these. If you don't use any yet, leave them all unchecked.",
  '¿Cuáles te gustaría aprender?': "Which ones would you like to learn?",
  'De estas te voy a traer contenido, aunque hoy no las uses.': "I'll bring you content for these, even if you don't use them today.",
  'Seguir': "Continue",
  'No se me ocurre nada, saltear': "Nothing comes to mind, skip",

  // ---- Preguntas del onboarding ----
  '¿A qué te dedicás?': "What do you do for a living?",
  'Como se lo contarías a alguien que recién conocés. No hace falta que sea formal.': "As you'd tell someone you've just met. It doesn't need to be formal.",
  'Coordino el área de marketing y admisiones de un colegio.': "I run the marketing and admissions team at a school.",
  '¿Con quién y dónde trabajás?': "Who do you work with, and where?",
  'Si trabajás sola o sola con un equipo, si es una empresa, por tu cuenta, o si es para tus cosas de casa.': "Whether you work alone or with a team, at a company, on your own, or this is for things at home.",
  'En una institución grande, con un equipo de siete personas a cargo.': "At a large institution, managing a team of seven.",
  '¿Para qué querés usar la IA?': "What do you want to use AI for?",
  'Puede ser más de una cosa. Escribí lo que se te ocurra, aunque suene chico.': "It can be more than one thing. Write whatever comes to mind, even if it sounds small.",
  'Escribir mails, ordenar ideas, entender planillas, preparar reuniones.': "Writing emails, organizing ideas, understanding spreadsheets, preparing meetings.",
  '¿Qué es lo más complicado que hiciste con IA hasta ahora?': "What's the most complex thing you've done with AI so far?",
  'No hay respuesta mala. Esto define por dónde arrancamos, nada más.': "There's no wrong answer. This just decides where we start.",
  'Nunca la usé en serio, o solo para probar y jugar': "I've never really used it, or only to try it out and play around",
  'Le hago preguntas sueltas y me resuelve cosas del día': "I ask it one-off questions and it helps with everyday things",
  'La uso para trabajo real, con mis archivos y mi contexto': "I use it for real work, with my files and my context",
  'Armé algo con ella: código, una app, una automatización': "I've built something with it: code, an app, an automation",
  'Construyo sistemas y decido qué herramientas adoptar': "I build systems and decide which tools to adopt",
  '¿Cómo preferís que te respondan?': "How do you prefer it to answer you?",
  'Esto es lo que más cambia el resultado de todo lo demás.': "This changes the result of everything else more than anything.",
  'Corto y al grano. Dame la conclusión': "Short and to the point. Give me the conclusion",
  'Con detalle y explicación del razonamiento': "Detailed, with an explanation of the reasoning",
  'Que me pregunte si le falta información, en vez de asumir': "Ask me if it's missing information, instead of assuming",
  '¿Con qué tono?': "In what tone?",
  'Directo, sin vueltas ni halagos': "Direct, no beating around the bush, no flattery",
  'Amable y paciente, que me explique con calma': "Kind and patient, explaining things calmly",
  'Técnico, que asuma que entiendo del tema': "Technical, assuming I understand the topic",
  '¿En qué idioma?': "In which language?",
  'Inglés': "English",
  'Español, pero los términos técnicos en inglés': "Spanish, but technical terms in English",
  '¿Qué te molesta de cómo te responde hoy?': "What bothers you about how it answers you today?",
  'Esta es la que casi nadie escribe y la que más se agradece después. Si no se te ocurre nada, dejala vacía.': "Almost nobody fills this one in, and it's the one you'll thank yourself for later. If nothing comes to mind, leave it empty.",
  'Que arranque con halagos, que me liste diez opciones cuando pedí una, que me diga que consulte a un profesional.': "That it opens with flattery, that it lists ten options when I asked for one, that it tells me to consult a professional.",

  // ---- Texto de instrucciones generado ----
  'Respondeme corto y al grano. Dame la conclusión primero; si hace falta el detalle, lo pido.': "Answer me short and to the point. Give me the conclusion first; if I need the detail, I'll ask.",
  'Respondeme con detalle y explicame el razonamiento, no solo la conclusión.': "Answer me in detail and explain your reasoning, not just the conclusion.",
  'Si te falta información para responder bien, preguntame antes de asumir.': "If you're missing information to answer well, ask me before assuming.",
  'Hablame directo, sin vueltas, sin halagos y sin introducciones.': "Talk to me directly: no beating around the bush, no flattery, no introductions.",
  'Explicame con calma y paciencia, asumiendo que el tema es nuevo para mí.': "Explain things calmly and patiently, assuming the topic is new to me.",
  'Hablame técnico, asumiendo que entiendo del tema. No simplifiques de más.': "Talk to me in technical terms, assuming I understand the topic. Don't oversimplify.",
  'Escribime siempre en español.': "Always write to me in Spanish.",
  'Always write to me in English.': "Always write to me in English.",
  'Escribime en español, pero dejá los términos técnicos en inglés.': "Write to me in Spanish, but keep technical terms in English.",
  'QUIÉN SOY': "WHO I AM",
  'PARA QUÉ TE USO': "WHAT I USE YOU FOR",
  'CÓMO QUIERO QUE ME RESPONDAS': "HOW I WANT YOU TO ANSWER ME",
  'QUÉ NO QUIERO': "WHAT I DON'T WANT",

  // ---- Camino corto ----
  'Pegá acá el texto de tus instrucciones…': "Paste the text of your instructions here…",
  '¿No te acordás dónde las tenés guardadas?': "Don't remember where you saved them?",
  'Están en el mismo lugar donde se ponen. Este es el camino en las herramientas que marcaste:': "They're in the same place where you set them. Here's the path in the tools you selected:",
  'Si tenés instrucciones distintas en cada herramienta, pegá las de la que más usás, o juntá todas en el mismo campo.': "If you have different instructions in each tool, paste the ones from the tool you use most, or combine them all in the same field.",
  'Lo último': "Last thing",
  'Pegá las tuyas': "Paste yours",
  'Si me las dejás, puedo traducirte lo que te enseñe a tu forma de trabajar en vez de darte lo genérico. Son tuyas y quedan solo en tu cuenta.': "If you leave them with me, I can adapt what I teach you to the way you work instead of giving you the generic version. They're yours and stay only in your account.",
  'Guardar y empezar': "Save and start",
  'Ahora no, las pego después': "Not now, I'll paste them later",

  // ---- Instrucciones generadas ----
  'Copiar el texto': "Copy the text",
  'Copiado ✓': "Copied ✓",
  'Copialo a mano del cuadro de arriba': "Copy it by hand from the box above",
  'Tus instrucciones': "Your instructions",
  'Listo. Esto es tuyo': "Done. This is yours",
  'Este texto resume quién sos y cómo querés que te hablen. Copialo y pegalo en tu herramienta.': "This text sums up who you are and how you want to be spoken to. Copy it and paste it into your tool.",
  '¿Dónde lo pego?': "Where do I paste it?",
  'Dónde va': "Where it goes",
  'Pegalo acá': "Paste it here",
  'No marcaste ninguna herramienta, así que no sé dónde mandarte. Guardá el texto: cuando elijas una, te muestro exactamente dónde va.': "You didn't select any tool, so I don't know where to send you. Save the text: when you pick one, I'll show you exactly where it goes.",
  'Ya lo pegué': "I've pasted it",

  // ---- La prueba ----
  '¿Cómo organizarías mi semana que viene?': "How would you organize my coming week?",
  'Pegá acá la respuesta…': "Paste the answer here…",
  'Pegá acá la nueva respuesta…': "Paste the new answer here…",
  'La prueba': "The test",
  'Mirá la diferencia': "See the difference",
  'Hacele esta pregunta a tu herramienta y pegá acá las dos respuestas: la que te dio antes de las instrucciones y la que te da ahora.': "Ask your tool this question and paste both answers here: the one it gave you before the instructions and the one it gives you now.",
  'Lo que te contestaba antes': "What it answered before",
  'Si no la guardaste, dejala vacía y seguí.': "If you didn't save it, leave it empty and move on.",
  'Lo que te contesta ahora': "What it answers now",
  'Terminar el Paso 1': "Finish Step 1",

  // ---- Repaso ----
  'Repaso': "Review",
  'Lo viste hace unos días': "You saw this a few days ago",
  'Lo viste hace poco': "You saw this recently",
  '¿Te acordabas?': "Did you remember it?",
  'Sí': "Yes",
  'Más o menos': "Sort of",
  'No': "No",
  '¿Lo usaste en algo real?': "Did you use it for something real?",
  'Todavía no': "Not yet",
  'Volver a leerlo': "Read it again",

  // ---- Falla ----
  'No pude traer lo de hoy': "Couldn't load today's content",
  'Algo falló de este lado': "Something went wrong on our side",
  'No es que no haya nada: no pude llegar a la base. Probá de nuevo en un momento.': "It's not that there's nothing: I couldn't reach the database. Try again in a moment.",
  'Reintentar': "Try again",

  // ---- Compromiso ----
  'Ayer dijiste': "Yesterday you said",
  '¿Lo hiciste?': "Did you do it?",
  'Ya no va': "Not anymore",

  // ---- Hoy ----
  'Por hoy está': "That's it for today",
  'No hay nada nuevo que valga tus minutos. No quedó nada pendiente: lo que no apareció hoy, no te lo debés.': "There's nothing new worth your minutes. Nothing is left pending: what didn't show up today isn't something you owe yourself.",
  'Mientras tanto, ir a la biblioteca': "Meanwhile, go to the library",
  'Se abrió material nuevo: lo que venías contestando dice que lo de antes te quedaba corto.': "New material has opened up: what you've been answering says the earlier stuff was too easy for you.",
  'Salió esto': "This just came out",
  'Leer': "Read",
  'Tenés un reto esperando': "You have a challenge waiting",

  // ---- Lección ----
  'Para cuando la uses': "For when you use it",
  'Lección': "Lesson",
  '¿Cuánto entendiste?': "How much did you understand?",
  'Nada': "Nothing",
  'Todo': "Everything",
  '¿Te interesó?': "Were you interested?",
  '👍 Sí': "👍 Yes",
  '👎 No': "👎 No",
  '¿Qué vas a hacer con esto?': "What are you going to do with this?",
  'Una cosa concreta, de esta semana…': "One concrete thing, from this week…",
  'Si escribís algo, mañana te lo pregunto. Si no, no pasa nada.': "If you write something, I'll ask you about it tomorrow. If not, no worries.",
  'Ya lo sabía': "I already knew this",
  'Dejarlo para después': "Save it for later",

  // ---- Biblioteca ----
  'Esto te pegó. Si querés seguir por acá:': "This one landed. If you want to keep going this way:",
  'No lo leí': "I haven't read it",
  'Las ideas centrales, y qué envejeció mal': "The core ideas, and what has aged badly",
  'Lo leí hace tiempo': "I read it a while ago",
  'Repaso de lo que probablemente se te borró': "A refresher on what you've probably forgotten",
  'Lo leí y lo tengo fresco': "I read it and it's fresh",
  'Nada de resumen: aplicación y discusión': "No summary: application and discussion",
  'Biblioteca': "Library",
  'Lo que no caduca. Elegí un libro y decime si lo leíste: según eso cambia por completo lo que te muestro.': "What doesn't expire. Pick a book and tell me if you've read it: what I show you changes completely depending on that.",
  '¿Cambió tu situación con este libro?': "Has your situation with this book changed?",
  'Antes de empezar: ¿lo leíste?': "Before we start: have you read it?",
  'Volver a la biblioteca': "Back to the library",
  'Este libro todavía no está procesado. Va a estar disponible pronto.': "This book hasn't been processed yet. It will be available soon.",
  'Leída': "Read",
  'Cambiar si lo leí o no': "Change whether I've read it",
  'Volver al libro': "Back to the book",

  // ---- Retos ----
  'Sin retos por ahora': "No challenges for now",
  'Los retos salen del cruce entre lo que te falta y lo que estás haciendo. Cuando aparezca uno que valga la pena, va a estar acá.': "Challenges come from the overlap between what you're missing and what you're working on. When one worth doing comes up, it'll be here.",
  'Qué te salió, qué no, qué aprendiste…': "What worked, what didn't, what you learned…",
  '¿Cómo te fue?': "How did it go?",
  '¿Cuánto te costó?': "How hard was it?",
  'Fácil': "Easy",
  'Durísimo': "Brutal",
  '¿Te sirvió?': "Was it useful?",
  'Lo hice': "I did it",
  'Seguir después': "Continue later",
  'No es para mí': "Not for me",

  // ---- Mapa ----
  'Tu posición': "Your position",
  'Dominio promedio': "Average mastery",
  'Tu frontera': "Your frontier",
  'Fundamentos': "Fundamentals",
  'Un nodo apagado no significa que no sepas: significa que la app todavía no tiene evidencia de que te muevas ahí. La barra sale de lo que hacés; el número verde, de lo que el campo movió este tiempo.': "A dimmed node doesn't mean you don't know it: it means the app doesn't yet have evidence that you're active there. The bar comes from what you do; the green number, from what the field has moved lately.",

  // ---- Lo que hiciste ----
  'Lo que hiciste': "What you've done",
  'cosa hecha en tu trabajo': "thing done at work",
  'cosas hechas en tu trabajo': "things done at work",
  'lección': "lesson",
  'lecciones': "lessons",
  'pieza de libro': "book piece",
  'piezas de libros': "book pieces",
  'Armaste tus instrucciones personales': "You set up your personal instructions",
  'Probaste tus instrucciones en tu herramienta': "You tested your instructions in your tool",
  'Cerraste un reto': "You finished a challenge",
  'Hiciste lo que te propusiste': "You did what you set out to do",
  'Lo usaste en tu trabajo': "You used it at work",
  'Acá aparece lo que hagas afuera de la app: lo que te proponés al cerrar una lección y cumplís, lo que usás en tu trabajo y los retos que cerrás.': "This is where what you do outside the app shows up: what you commit to when closing a lesson and then do, what you use at work, and the challenges you finish.",
  'Cargando': "Loading",

  // ---- Ajustes: contraseña e instalar ----
  'Contraseña': "Password",
  'Nueva contraseña': "New password",
  'Repetila': "Repeat it",
  'Cambiar contraseña': "Change password",
  'La contraseña tiene que tener al menos 8 caracteres.': "The password needs to be at least 8 characters.",
  'Las dos contraseñas no coinciden.': "The two passwords don't match.",
  'Esa es la misma contraseña que ya tenés. Elegí otra.': "That's the same password you already have. Pick another one.",
  'No se pudo cambiar la contraseña. Probá de nuevo en un momento.': "Couldn't change the password. Try again in a moment.",
  'Listo. La próxima vez que entres, usá la nueva.': "Done. Next time you sign in, use the new one.",
  'Instalar': "Install",
  'Instalar ahora': "Install now",
  'Instalada, Frontera abre sin la barra del navegador y queda a un toque, como cualquier otra app.': "Once installed, Frontera opens without the browser bar and sits one tap away, like any other app.",
  'Abrí esta página en Safari. En otros navegadores de iPhone no aparece la opción.': "Open this page in Safari. The option doesn't appear in other iPhone browsers.",
  'Tocá el botón de compartir, el cuadrado con la flecha hacia arriba.': "Tap the share button, the square with the arrow pointing up.",
  'Bajá en el menú y tocá "Agregar a inicio".': "Scroll down the menu and tap \"Add to Home Screen\".",
  'Tocá "Agregar". Frontera queda como una app más en tu pantalla de inicio.': "Tap \"Add\". Frontera appears as one more app on your home screen.",
  'Abrí esta página en Chrome.': "Open this page in Chrome.",
  'Tocá los tres puntos de arriba a la derecha.': "Tap the three dots at the top right.",
  'Tocá "Instalar app" o "Agregar a la pantalla principal".': "Tap \"Install app\" or \"Add to Home screen\".",
  'Confirmá. Frontera queda como una app más en tu pantalla principal.': "Confirm. Frontera appears as one more app on your home screen.",
  'En Chrome o Edge, buscá el ícono de instalar a la derecha de la barra de direcciones.': "In Chrome or Edge, look for the install icon on the right of the address bar.",
  'Tocalo y elegí "Instalar".': "Click it and choose \"Install\".",
  'Frontera se abre en su propia ventana, como una app más.': "Frontera opens in its own window, like any other app.",

  // ---- Arcos ----
  'El mail que escribís siempre': "The email you always write",
  'El informe de todos los meses': "The monthly report",
  'La reunión que nadie resume': "The meeting nobody writes up",
  'Lo dejaste armado': "You set it up for good",

  // ---- Bienvenida y nombre ----
  'Bienvenida': "Welcome",
  'Hola. Esto es Frontera.': "Hello. This is Frontera.",
  'Te ayuda a sacarle más a la IA que ya usás, a tu nivel y sobre tu trabajo real. Nunca te explica lo que ya sabés.': "It helps you get more out of the AI you already use, at your level and on your real work. It never explains what you already know.",
  'Lo que va a pasar': "What happens next",
  'Tus instrucciones · unos 5 minutos': "Your instructions · about 5 minutes",
  'Ahora mismo. Te vas con un texto que mejora todas tus respuestas desde hoy.': "Right now. You leave with a text that improves every answer you get, starting today.",
  'Una sola cosa por día': "One thing a day",
  'Cinco minutos a tu nivel. Si ya lo sabés, la salteás y la app aprende.': "Five minutes at your level. If you already know it, skip it and the app learns.",
  'Retos sobre tu trabajo': "Challenges on your own work",
  'Con tu propio material, no ejercicios de manual.': "With your own material, not textbook exercises.",
  'Nada se acumula: lo que no leíste no te queda pendiente.': "Nothing piles up: what you didn't read is never left owing.",
  '¿Cómo te llamo?': "What should I call you?",
  'Opcional. Es el nombre con el que te va a saludar la app. Lo cambiás cuando quieras en Ajustes.': "Optional. It's the name the app will greet you with. You can change it any time in Settings.",
  'Como te dicen': "What people call you",
  'No se pudo guardar tu nombre. Probá de nuevo.': "Your name couldn't be saved. Please try again.",
  'El nombre con el que te saluda la app. Si lo dejás vacío, no te saluda con nombre.': "The name the app greets you with. Leave it empty and it won't greet you by name.",

  // ---- Paso 1 sin herramienta ----
  'Primero, elegí una': "First, pick one",
  'Tus instrucciones tienen que estar adentro de una herramienta de IA para servir. Estas tres son gratis para empezar, en la web y en el teléfono, y alcanzan para todo lo que viene.': "Your instructions have to live inside an AI tool to be any use. These three are free to start with, on the web and on your phone, and they're enough for everything ahead.",
  'Si no sabés cuál, elegí la que usa alguien cerca tuyo: vas a tener a quién preguntarle.': "If you don't know which, pick the one someone near you uses: you'll have someone to ask.",
  'Te muestro dónde va el texto': "I'll show you where the text goes",
  'Prefiero hacerlo más adelante': "I'd rather do it later",
  'Para después': "For later",
  'Tu texto queda guardado': "Your text is saved",
  'Lo encontrás en Ajustes, en Vos, listo para copiar. Cuando empieces a usar una herramienta, marcala en Ajustes, en Tus herramientas, y te muestro dónde va.': "You'll find it in Settings, under You, ready to copy. When you start using a tool, tick it in Settings, under Your tools, and I'll show you where it goes.",
  'Mientras tanto, lo que te enseñe va a estar explicado sin depender de ninguna.': "Meanwhile, what I teach you will be explained without depending on any of them.",
  'Todavía no tengo la guía para la herramienta que marcaste. Buscá en su configuración algo como "instrucciones personalizadas" o "personalización" y pegalo ahí.': "I don't have the guide for the tool you ticked yet. Look in its settings for something like \"custom instructions\" or \"personalisation\" and paste it there.",
  'No puedo probarlo ahora': "I can't try it now",

  // ---- Ajustes: herramientas, ayuda, cuenta ----
  'Tus herramientas': "Your tools",
  'Las que usás hoy. Lo que te enseñe va a venir explicado para estas.': "The ones you use today. What I teach you will come explained for these.",
  'Ayuda': "Help",
  'Si algo no anda o tenés una duda, escribile a quien te sumó al círculo. Contale qué estabas haciendo y qué viste: con eso alcanza.': "If something isn't working or you have a question, write to whoever added you to the circle. Tell them what you were doing and what you saw: that's enough.",
  'Borrar la cuenta': "Delete the account",
  'Se borra todo: tus instrucciones, lo que leíste, tus retos y tus respuestas. No se puede deshacer, y para volver alguien del círculo te tiene que sumar de nuevo.': "Everything is deleted: your instructions, what you've read, your challenges and your answers. It can't be undone, and to come back someone in the circle has to add you again.",
  'BORRAR': "DELETE",
  'Borrar mi cuenta para siempre': "Delete my account for good",
  'Borrando…': "Deleting…",
  'No se pudo borrar. Probá de nuevo.': "It couldn't be deleted. Please try again.",
  'Esta cuenta administra el círculo y no se puede borrar desde la app.': "This account runs the circle and can't be deleted from the app.",
  'Falta la confirmación.': "Confirmation is missing.",

  // ---- Ajustes: radar ----
  'Radar': "Radar",
  'Lo que el radar escribió solo. No lo ve nadie hasta que lo publicás.': "What the radar wrote on its own. Nobody sees it until you publish it.",
  'Buscando borradores…': "Looking for drafts…",
  'No hay nada esperando.': "Nothing waiting.",
  'No se pudo hacer. Probá de nuevo.': "That didn't work. Please try again.",
  '¿Descartar este borrador? Se borra.': "Discard this draft? It will be deleted.",
  'Borrador del radar': "Radar draft",
  'Ver la fuente': "See the source",
  'Publicar': "Publish",
  'Descartar': "Discard",
  'Tu cuenta no aprueba contenido.': "Your account doesn't approve content.",
  'Ese borrador ya no está.': "That draft is no longer there.",

  // ---- Ajustes: avisos ----
  'Avisos': "Notifications",
  'Uno por día hábil, a eso de las 9, sólo si ese día todavía no entraste. Sin números ni rachas, y nada se acumula.': "One per weekday, around 9am, only if you haven't been in yet that day. No numbers or streaks, and nothing piles up.",
  'Prender los avisos': "Turn on notifications",
  'Avisos prendidos ✓': "Notifications on ✓",
  'En iPhone los avisos funcionan con la app instalada. Mirá Instalar, más arriba.': "On iPhone, notifications work once the app is installed. See Install, above.",
  'Este navegador no permite avisos.': "This browser doesn't allow notifications.",
  'Los avisos están bloqueados para esta página en la configuración del navegador.': "Notifications are blocked for this page in your browser settings.",
  'Listo, no te aviso más.': "Done, no more notifications.",
  'Sin permiso del navegador no te puedo avisar.': "Without the browser's permission I can't notify you.",
  'Listo. El próximo día hábil, a la mañana.': "Done. Next weekday, in the morning.",
  'No se pudieron prender los avisos en este navegador.': "Notifications couldn't be turned on in this browser."
};

// ------------------------------------------------------------
// Patrones con valores interpolados
// ------------------------------------------------------------
const PATRONES = [
  // lector
  [/^Volviste al (\d+)%$/, (m) => `You're back at ${m[1]}%`],
  [/^Faltan (\d+) min$/, (m) => `${m[1]} min left`],

  // aria-label de los botones de tamaño y fondo: `${etiqueta} ${valor}`
  [/^(Texto|Fondo) (chico|normal|grande|sistema|claro|sepia|oscuro)$/, (m) => {
    const v = { chico: 'small', normal: 'medium', grande: 'large', sistema: 'auto', claro: 'light', sepia: 'sepia', oscuro: 'dark' }[m[2]];
    return m[1] === 'Texto' ? `${v[0].toUpperCase()}${v.slice(1)} text` : `${v[0].toUpperCase()}${v.slice(1)} background`;
  }],

  // borrar la cuenta: la palabra de confirmación ya viene traducida
  [/^Escribí (\S+) para confirmar(\.?)$/, (m) => `Type ${m[1]} to confirm${m[2]}`],

  // saludo de Hoy, con el nombre que eligió la persona
  [/^Hola, (.+)$/s, (m) => `Hi, ${m[1]}`],

  // cabecera y semana
  [/^(\d+) (semana|semanas)$/, (m) => `${m[1]} ${pl(m[1], 'week', 'weeks')}`],
  [/^(\d+) (día|días) esta semana$/, (m) => `${m[1]} ${pl(m[1], 'day', 'days')} this week`],

  // onboarding
  [/^Son (\d+) preguntas cortas\. Al final te vas con un texto listo para pegar en tu herramienta, y vas a ver la diferencia con tus propios ojos\.$/,
    (m) => `That's ${m[1]} short questions. At the end you'll walk away with a text ready to paste into your tool, and you'll see the difference with your own eyes.`],
  [/^Pregunta (\d+) de (\d+)$/, (m) => `Question ${m[1]} of ${m[2]}`],

  // línea de instrucciones con viñeta: '- ' + frase traducible
  [/^- (.+)$/s, (m) => {
    const t = EN[m[1]];
    return t === undefined ? null : `- ${t}`;
  }],

  // compromiso
  [/^Hace (\d+) días dijiste$/, (m) => `${m[1]} days ago you said`],
  [/^Salió de "(.*)"\.$/s, (m) => `It came from "${m[1]}".`],

  // duración
  [/^(\d+) minutos$/, (m) => `${m[1]} ${pl(m[1], 'minute', 'minutes')}`],

  // reto
  [/^Por qué este: (.*)$/s, (m) => `Why this one: ${m[1]}`],

  // biblioteca
  [/^En español: (.*)$/s, (m) => `In Spanish: ${m[1]}`],
  [/^(.+) · (\d+) de (\d+) leídas$/, (m) => `${tr(m[1])} · ${m[2]} of ${m[3]} read`],
  [/^Las ideas son de (.+)\. El texto es una síntesis propia, no un extracto del libro\.$/s,
    (m) => `The ideas are ${m[1]}'s. The text is an original synthesis, not an excerpt from the book.`],

  // mapa
  [/^(\d+) de (\d+) nodos encendidos$/, (m) => `${m[1]} of ${m[2]} nodes lit`],
  [/^(.+) — donde más se mueve el campo y menos te movés vos\.$/s,
    (m) => `${m[1]} — where the field moves the most and you move the least.`],
  [/^(\d+) novedades$/, (m) => `${m[1]} ${pl(m[1], 'update', 'updates')}`],
  [/^Ver todo \((\d+)\)$/, (m) => `See all (${m[1]})`],

  // arcos (el nombre del arco ya llega traducido)
  [/^Día (\d+) de (\d+) · (.+)$/s, (m) => `Day ${m[1]} of ${m[2]} · ${m[3]}`],
  [/^Mañana sigue el día (\d+) de (\d+) de «(.+)»\.$/s, (m) => `Tomorrow: day ${m[1]} of ${m[2]} of "${m[3]}".`],

  // errores con mensaje técnico al final
  [/^No pude leer tu perfil: (.*)$/s, (m) => `Couldn't read your profile: ${m[1]}`],
  [/^Algo se rompió: (.*)$/s, (m) => `Something broke: ${m[1]}`]
];

// ------------------------------------------------------------
// tr()
// ------------------------------------------------------------
function buscar(texto) {
  if (Object.prototype.hasOwnProperty.call(EN, texto)) return EN[texto];

  for (const [re, fn] of PATRONES) {
    const m = texto.match(re);
    if (m) {
      const r = fn(m);
      if (typeof r === 'string') return r;
    }
  }
  return undefined;
}

export function tr(texto) {
  if (lang !== 'en' || typeof texto !== 'string' || !texto) return texto;

  try {
    const directo = buscar(texto);
    if (directo !== undefined) return directo;

    // Texto de varias líneas (como el de instrucciones armado con join):
    // línea por línea. Lo que no se reconoce, como lo que escribió la
    // persona, queda igual.
    if (texto.includes('\n')) {
      let cambio = false;
      const salida = texto.split('\n').map((linea) => {
        const t = buscar(linea);
        if (t === undefined) return linea;
        cambio = true;
        return t;
      });
      if (cambio) return salida.join('\n');
    }
  } catch {
    /* nunca romper la pantalla por una traducción */
  }
  return texto;
}
