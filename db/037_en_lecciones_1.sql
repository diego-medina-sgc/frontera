-- ============================================================
-- Frontera - English adaptation of the lessons, part 1 (8 of 24)
-- ============================================================
-- Natural English, not word-for-word translation. Same structure.
-- ============================================================

insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'en', null,
  'Your personal instructions',
  'Ninety-nine out of a hundred people use AI without this. It''s the thing that improves the answers most, and nobody does it.',
$md$
Every time you open a new conversation with an AI, it starts from zero. It doesn't know who you are, what you do, what you're asking for or how you like to be answered. So it answers the way it would answer anyone: with an average answer, for an average person, which isn't you.

All the big tools have a place where you write down, once, who you are and how you want them to talk to you. And that text is applied automatically, in every conversation, from then on.

**That's what we're going to build now.** It isn't technical configuration: it's the difference between a generic tool and one that knows you.

## What changes in practice

Without instructions, if you ask "how do I organise my week?", the AI gives you an answer straight out of a productivity manual.

With instructions saying that you lead a team of seven, that you have meetings you can't get out of and that you hate long lists, the same question gets you something you can use on Monday.

It isn't magic. You just told it who it's talking to.

## What goes in

Four things, and none of them is technical:

**Who you are.** What you do, in what context, who you work with. Not a CV: just what someone needs to know in order to help you.

**What you use it for.** Work, study, writing, sorting out things at home. It can be more than one.

**How you want it to answer.** And this is what has the most impact. Short or detailed? Direct or roundabout? In which language? Does it explain its reasoning or just give you the conclusion? Does it ask you questions when something isn't clear, or does it assume and carry on?

**What you don't want.** This is the one almost nobody writes, and the one you'll be most grateful for. If you're annoyed by flattery at the start, if you don't want ten options listed when you asked for one, if you don't want it to recommend hiring a professional every time you ask something.

## The test

At the end of this step you'll do something concrete: you'll ask your tool a question **before** adding the instructions, we'll save the answer, you'll paste in the instructions, and you'll ask it the same question **after**.

The two answers, side by side. I don't need to explain that to you: you'll see it.

## A warning

Personal instructions apply to **all** your conversations. So don't put in anything you wouldn't want showing up in any context, or sensitive data about other people. We'll talk about that properly later on, in step 9.
$md$,
8, 'curado' from lessons l where l.slug = 'f01-instrucciones-personales' on conflict do nothing;

insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'en', null,
  'Why it makes things up',
  'It''s not a search engine and it doesn''t have a database inside. Understanding what it is changes how you use it for good.',
$md$
Almost every problem people have with AI comes from one misunderstanding: thinking it's a search engine. It isn't, and the difference matters.

A search engine has pages stored and gives you the one that matches best. If it doesn't have one, it tells you there are no results.

This is something else. It read an enormous amount of text and from that learned how words chain together: what tends to come after what. When you ask it something, it doesn't look up the answer: **it writes it, word by word, each time choosing the one that best continues what came before.**

That's why it can write an email nobody has ever written, summarise your document or explain something in your own words. It isn't copying: it's building.

## And that's also why it makes things up

If it has no idea of the answer, **it doesn't realise it doesn't have one.** It keeps doing the only thing it knows how to do: write the most plausible continuation. And a plausible continuation, with the words well put together, looks a lot like a true answer.

This is called "hallucinating", and it's the wrong word because it sounds like something strange and exceptional. It isn't. It's the tool working normally, applied to a case where it doesn't know.

The dangerous part isn't that it gets things wrong. It's that **it's wrong in the same confident tone it uses when it's right.** There's no signal. It doesn't say "I don't know this one". It gives you a name, a date, a phone number or a quote from a book, and it all sounds equally convincing.

## Where it happens most

There's a fairly clear pattern. It makes things up more when you ask for:

- Specific, checkable facts: dates, figures, proper names, prices.
- Word-for-word quotes from books, laws or articles.
- Very recent things, from after it finished learning.
- Information about people or small companies, where little has been written.
- Things that don't exist. If you ask for five studies on something and there are two, it invents three.

And it's much more reliable when you ask it to work on something you gave it: summarising your text, rewriting your email, organising your ideas, explaining one of your documents. There it doesn't have to remember anything, it has the material in front of it.

## The rule to take away

**If the answer is a fact you're going to use to decide something, check it.** Always, even if it sounds perfect. Especially if it sounds perfect.

And if at some point it tells you something with total confidence and later you find out it was false, it isn't broken and it didn't lie to you: it did exactly what it does. The job of knowing when to trust it is yours, and it's the most important skill of all.
$md$,
8, 'curado' from lessons l where l.slug = 'f02-por-que-inventa' on conflict do nothing;

insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'en', null,
  'It''s not just typing',
  'Talking to it, showing it a photo, giving it a spreadsheet. Three doors most people never open.',
$md$
Almost everyone uses these tools by typing, and misses three things that are better for many situations.

## Talking to it

All the big ones have a voice mode on the phone. For many people it's the difference between using it and not using it, because typing on a phone is a chore and talking isn't.

Where it helps most:

- **Thinking out loud.** Tell it a problem the way you'd tell someone, messy, and ask it to put it in order. It comes out better than when you type it, because when typing you censor yourself and summarise too much.
- **While you're doing something else.** Walking, cooking, driving if it's hands-free.
- **Practising a difficult conversation.** Ask it to play the other person. It's uncomfortable and it works.

## Showing it

Take a photo of something and ask about it. This is more useful than it sounds:

- The car dashboard with a warning light on.
- A paper form you don't understand.
- A screen with an error message.
- The open fridge, so it can tell you what you can cook.
- A plant with ugly leaves.
- A menu in another language.

It works especially well for things where you don't even know how to search for it, because you don't know what it's called.

## Giving it data

If you give it a spreadsheet or a table, it doesn't just read it: it can sort it, work out totals, cross-reference columns, find what repeats and build you a chart.

For someone who isn't good with spreadsheet formulas, this replaces an entire skill. "From this list of expenses, tell me where my money goes by category" is a question that used to require knowing how to build a pivot table.

Just one thing: **check the totals.**

## Try one

Not all three. Pick the one that best fits your life: if you don't type much on your phone, voice. If you've got papers piling up, the camera. If you live with spreadsheets, data.
$md$,
7, 'curado' from lessons l where l.slug = 'f08-voz-imagen-datos' on conflict do nothing;

insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'en', null,
  'How to ask well',
  'The difference between a useless answer and an excellent one is almost never the tool. It''s what you asked for.',
$md$
Most people write to AI the way they'd write to a search engine: three words and enter. And then they conclude it's no use at all.

Asking well isn't a trick and doesn't need magic words. It's giving it what any person would need in order to help you. There are four things, and with just two it already improves a lot.

## One: what it's for

What changes the answer most isn't the topic, it's the destination. "Write something about the summer holidays" is not the same as "write a message to tell school families the holiday dates, which they'll read on their phones and which needs to be clear in ten seconds".

The second one has an audience, a channel and a goal. With that alone, the answer changes completely.

## Two: the context you have and it doesn't

This is the most common mistake. You know why you're asking for this, what happened before, what you can't say, who you're talking to. It knows none of that.

A paragraph of context is worth more than ten attempts at rewording the question. "This is for a client who has already complained twice and is angry" changes the answer more than anything else you could write.

## Three: an example

If you have something similar to what you want, such as an earlier email you liked or a text with the tone you're after, paste it in and say "something like this". It's the fastest way there is to get across what you want and can't put into words.

## Four: the shape

Say what you want to receive. A paragraph, a list, a table, three options, a hundred words. If you don't say, it will give you whatever it feels like, and what it feels like is usually longer than you need.

## What you don't need

You don't need to be polite, though it doesn't hurt either. You don't need to say "act like a marketing expert with twenty years of experience": that used to work, and today it hardly changes anything. You don't need to write well or without typos: it understands anyway.

## Try it now

Take something you asked for this week that came out badly. Ask for it again, the same, but adding just one line: **what it's for and who is going to read it.**

That one line explains half the difference between the people who say AI is incredible and the ones who say it's useless.
$md$,
8, 'curado' from lessons l where l.slug = 'f03-como-pedir' on conflict do nothing;

insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'en', null,
  'The first answer isn''t the answer',
  'The most expensive mistake: asking once, looking at what came out and deciding right then whether the tool is any good.',
$md$
There's one habit that separates the people who get value out of this from the people who don't, and it has nothing to do with knowing about technology.

The people who don't get value ask once, look at the result and draw a conclusion: it works or it doesn't.

The ones who do treat the first answer as what it is: **a draft to discuss.**

## Why the first attempt almost never nails it

Not because the tool is bad. Because on the first attempt you didn't really know what you wanted either. You find out when you see something concrete and think "no, not like that". That's normal and it's how thinking works: it isn't a failure of the request.

The difference is what you do with that "not like that".

## Correcting beats starting over

Many people, when they don't like what came out, delete everything and write the request again from scratch. It's the slowest thing you can do.

It's much better to stay in the same conversation and say what's wrong. The tool remembers everything that came before: there's no need to repeat anything.

And say it the way you'd say it to a person:

- "Too long, half the length."
- "The tone is off, this is for families, not a company."
- "The second paragraph is good, the rest isn't. Redo it around that."
- "Too salesy. Take out the adjectives."
- "It's fine but it needs to mention that it's free."

You don't need to explain why or be diplomatic. The more direct you are, the better it turns out.

## Three moves that work almost every time

**Ask for options.** "Give me three versions with different tones." Choosing between three is much easier than explaining what you want, and along the way you find out what you wanted.

**Ask it to question you.** "Before you write, ask me whatever you need to know." This flips the exercise: instead of guessing, it interviews you. For important things it's the best move there is.

**Ask it to critique.** "Tell me what's weak about this." Looking at a text with a critical eye is something it does quite well, and sometimes better than writing it.

## When it does make sense to start over

There's one case: when the conversation has gone very far and you've already corrected five times, sometimes it gets tangled and starts carrying over old mistakes. Then it's best to open a new conversation and start clean, pasting in the best version you got as a starting point.

## What to take away

Two or three rounds of back-and-forth turn a mediocre answer into a good one. It takes two minutes. The people who say AI writes badly almost always asked only once.
$md$,
7, 'curado' from lessons l where l.slug = 'f04-iterar' on conflict do nothing;

insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'en', null,
  'What it can and can''t do',
  'An honest map of where it''s extraordinary, where it''s mediocre and where you simply shouldn''t use it.',
$md$
This is neither "it's good for everything" nor "it's a toy". It has a fairly well-defined shape, and knowing it saves you most of the disappointments.

## Where it's extraordinary

**Transforming something that already exists.** Summarising, rewriting, translating, changing the tone, going from messy to tidy, from long to short. Here it's better than almost any person and much faster. If you give it the material, the risk of it making things up drops enormously.

**Getting you past the blank page.** The first draft of anything. It won't be the final one, but starting to correct is infinitely easier than starting to write.

**Explaining something at your level.** You can ask it to explain it as if you knew nothing about the subject, and ask about everything you didn't understand without it getting impatient or making you feel stupid. For learning, that's priceless.

**Giving you options and perspectives.** Ten ideas for a name, five ways to approach a difficult conversation, the counterarguments to your own position.

**Keeping you company with something you don't know how to do.** A spreadsheet, an administrative procedure, a setup. You can ask step by step.

## Where it's mediocre

**Hard facts.** Dates, figures, names, prices, laws. You already know why: it builds them. Always check.

**Very recent things.** What happened this week it may not know, or may know wrong, unless the tool searches the internet and shows you where it got it from.

**Sums.** For long calculations, ask it to show you the working, and check the numbers with a calculator.

**Your specific context.** It doesn't know your company, your family, your neighbourhood, your internal jargon. What it knows about those is whatever you tell it.

**Opinions.** It tends to give you the most widely accepted, balanced answer. If you're after a sharp stance, it will soften it unless you explicitly ask for one.

## Where it isn't

**Decisions that call for professional responsibility.** Health, legal matters, serious money. It's useful for understanding, for preparing your questions, for knowing who to consult. Not for deciding.

**When you can't check and the consequences are serious.** If you have no way to check and being wrong would be costly, it's not the tool.

## How to check without going crazy

You don't need to check everything. Only what meets both conditions: **it's a specific fact** and **you're going to do something with it.**

Three quick ways:

- Ask for the source and look at it. If it made it up, that shows quickly.
- Search for the individual fact in a search engine. Thirty seconds.
- Ask it in a new conversation, without telling it what came before. If it gives something different, it doesn't know.

## What to take away

The useful question isn't "can it be trusted?". It's **"can I check this, and do I care if it's wrong?"**. If the answer is that you don't care, don't waste time. If you do care, check.
$md$,
8, 'curado' from lessons l where l.slug = 'f05-que-puede-y-que-no' on conflict do nothing;

insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'en', null,
  'Working with your own files',
  'This is where the tool stops being a curiosity and starts solving your day.',
$md$
So far you've asked it things from memory. The big leap is a different one: **giving it your material.**

A contract you don't understand, a bank statement, a fifty-page manual, the expenses spreadsheet, a photo of a form, the minutes of a meeting. You can give it all of that and ask about it.

And there's a basic reason this changes so much: when you give it the material, **it doesn't have to remember anything**. It has it in front of it. That's when it makes things up least and is most useful. The risk we talked about in lesson 2 drops enormously.

## What you can give it

Text documents and PDFs. Spreadsheets. Images and photos, even of papers or screens: it reads what's written there. Presentations. Depending on the tool, audio too.

## What to ask about it

The obvious one is "summarise this". It's the least interesting.

What really helps:

- **"What does this say about cancellation penalties?"** Finding one specific thing in a long document.
- **"Explain this clause as if I knew nothing about law."** Translating from the hard language into plain English.
- **"What should I ask before signing this?"** Preparing for a conversation.
- **"Is there anything odd or that doesn't add up?"** Review. It finds inconsistencies you miss when reading.
- **"Make me a table with this data, sorted by date."** Reordering without manual work.
- **"What am I missing?"** About a plan, a list or a draft of yours.

## Two warnings

**What you upload leaves your computer.** Before uploading something, ask yourself whether you'd mind it being on another company's server. We talk about this properly in lesson 9, which is the most important one in the track.

**Check the numbers.** If you give it a spreadsheet and it gives you totals, check them. It's good at reading tables and it isn't a calculator.

## Do it now

Take a document you've been meaning to read and dreading. Upload it and ask: **"What's the most important thing this says for someone in my situation?"** And tell it what your situation is.

For most people, that's the moment the penny drops.
$md$,
7, 'curado' from lessons l where l.slug = 'f06-tus-archivos' on conflict do nothing;

insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'en', null,
  'Don''t start from zero every time',
  'If every conversation starts with you explaining the same thing, you''re losing half the value.',
$md$
You've already set your personal instructions, so the tool knows who you are in general. But there's a second level that almost nobody uses: **one space per topic.**

The idea is simple. If there's something you work on often, such as a project, a subject, an area or a long administrative process, you can have a place where the context and files for that topic are already loaded. Every conversation you open there starts out knowing all of it.

The tools give this different names and change them often. The concept is the same in all of them, and in the section below you'll find where it lives in yours.

## Why it changes so much

Without this, every conversation starts from zero and you explain again who the people are, what happened before, what you're trying to achieve. It's five minutes every time, and since it's a chore, you end up explaining less than you should. And with little context, the answer is generic.

With a space per topic, the context is already there. You open it and ask straight away. **And since it costs nothing, you use it more.** That's the real effect: it's not that the answer improves a little, it's that you stop avoiding the tool because explaining is work.

## What to put inside

**The space's instructions.** What this topic is, who takes part, what you're trying to achieve, what to always keep in mind, what not to.

**Reference files.** The documents you find yourself explaining again and again: the regulations, the plan, the price list, the manual, the notes.

## What not to put in

Don't mix topics. If you put everything in a single space, the context gets diluted and goes back to being generic. Better three small, sharp spaces than one enormous one.

And don't put in anything you wouldn't put anywhere else: what lesson 9 says applies here too.

## Where to start

Don't set up five. Set up **just one**, for the topic where you most often ask for help. Use it for a week. You'll notice the difference the third time you open a conversation and don't have to explain anything.
$md$,
7, 'curado' from lessons l where l.slug = 'f07-contexto-persistente' on conflict do nothing;
