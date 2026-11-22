-- English versions of the tool-specific execution layers

insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'en', 'claude', 'Where it goes in Claude', null, $md$
In Claude, personal instructions live in two different places, and it helps to know the difference:

**For all your conversations.** Click your name or initial at the bottom left and go into **Settings**. Find the personal preferences section (**Personal preferences**) and paste your text there. Save. Done: it applies to everything you do from now on.

**For one specific topic.** If you have a particular piece of work, a course of study or an area you cover, Claude has **Projects**. Each project has its own instructions and its own files. What goes there doesn't leak into the rest of your conversations.

The simple rule: what is **about you** goes in Settings. What is **about a topic** goes in a Project.
$md$, 3, 'curado' from lessons l where l.slug = 'f01-instrucciones-personales' on conflict do nothing;

insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'en', 'chatgpt', 'Where it goes in ChatGPT', null, $md$
In ChatGPT this is called **personalisation**, and it comes in two parts:

**Custom instructions.** Click your name or photo at the bottom left and go to **Settings** → **Personalization**. There you will find the fields for what you want ChatGPT to know about you and how you want it to respond. Paste your text and save.

**Memory.** In the same place there is a memory option, which saves loose details from your conversations on its own. It is different from instructions: ChatGPT writes the memory, you write the instructions. Instructions are more reliable because you control them.

One tip: review the memory every so often. Old things pile up that no longer represent you.
$md$, 3, 'curado' from lessons l where l.slug = 'f01-instrucciones-personales' on conflict do nothing;

insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'en', 'gemini', 'Where it goes in Gemini', null, $md$
In Gemini the place is **Saved info**:

Open the settings menu, go into **Saved info** and add there whatever you want Gemini to always take into account. You can add several separate entries instead of one long text: who you are in one, how you want it to respond in another.

Watch out for one important difference: in Gemini, instructions about **format and tone** (short, direct, no lists) sometimes have to be repeated in the conversation, because it doesn't hold on to them as firmly as the other tools do. If you notice it forgetting, it isn't your fault.
$md$, 3, 'curado' from lessons l where l.slug = 'f01-instrucciones-personales' on conflict do nothing;

insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'en', 'claude', 'How to upload them in Claude', null, $md$
In the box where you type, on the left, there is a **paperclip**. From there you upload files from your computer or phone.

You can also drag a file straight onto the conversation, or paste an image you have copied.

It reads PDFs, documents, spreadsheets, images and text. If the document is very long, it doesn't refuse it: it processes it anyway, although it is better to ask it specific questions than to ask for everything at once.

A useful detail: you can upload several files at once and ask it to compare them with each other.
$md$, 2, 'curado' from lessons l where l.slug = 'f06-tus-archivos' on conflict do nothing;

insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'en', 'chatgpt', 'How to upload them in ChatGPT', null, $md$
In the box where you type there is the **attach** button (a paperclip or a plus sign, depending on the version). From there you upload files, and you can also connect your Google Drive or OneDrive to bring them in from there.

Dragging the file onto the conversation works too.

It reads PDFs, documents, spreadsheets and images. With spreadsheets it has an advantage: it can actually do calculations on the data instead of just reading it, so for numbers it is one of the most reliable. Still, check the totals.
$md$, 2, 'curado' from lessons l where l.slug = 'f06-tus-archivos' on conflict do nothing;

insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'en', 'gemini', 'How to upload them in Gemini', null, $md$
In the box where you type there is an **attach** button (a plus sign or a paperclip). From there you upload files or take a photo directly with the camera.

Gemini's big advantage is Google Drive: you can bring in a document or spreadsheet you already have there, without downloading it and uploading it again. If you live in Drive, it is the one with the least friction.

It reads PDFs, documents, spreadsheets and images.
$md$, 2, 'curado' from lessons l where l.slug = 'f06-tus-archivos' on conflict do nothing;

insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'en', 'claude', 'In Claude they are called Projects', null, $md$
In the menu on the left you will see **Projects**. You create one, give it a name, and inside you have two things:

**The project instructions**, where you write what the topic is about and what to always keep in mind.

**The project files**, which stay available to every conversation you open inside it, without uploading them again.

Every conversation you start inside the project begins with all of that loaded. Conversations outside it don't see it, which is exactly what you want: one topic shouldn't leak into the others.
$md$, 3, 'curado' from lessons l where l.slug = 'f07-contexto-persistente' on conflict do nothing;

insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'en', 'chatgpt', 'In ChatGPT there are two routes', null, $md$
**Projects**, in the menu on the left. This is the closest to what the lesson describes: a space with its own instructions and files, and the conversations you open inside it inherit them. To get started, this is the one.

**Custom GPTs**, which are a step further: an assistant with its own name that you build once and can reuse or share. It works when the task is always the same and you repeat it a lot.

The rule: if it is a topic where you will have many different conversations, use a project. If it is a specific task that you repeat identically, use a GPT.
$md$, 3, 'curado' from lessons l where l.slug = 'f07-contexto-persistente' on conflict do nothing;

insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'en', 'gemini', 'In Gemini they are called Gems', null, $md$
In the menu there is a **Gems** section. A Gem is an assistant that you build yourself: you give it a name, write the instructions for what it should do and what to keep in mind, and depending on the version you can also leave it reference files.

Then you pick it from the list every time you want to work on that topic.

It works a little differently from the projects in the other tools: it is designed more as a "specialised assistant" than as a "folder with context". For the use the lesson describes, it is enough all the same.
$md$, 3, 'curado' from lessons l where l.slug = 'f07-contexto-persistente' on conflict do nothing;
