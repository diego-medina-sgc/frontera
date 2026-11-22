-- ============================================================
-- Frontera - English adaptation of lessons, batch 3 (8 lessons)
-- fr-negocios, fr-producto, fr-diseno, f11 to f15
-- ============================================================

insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'en', null,
  'The pilot worked and nothing changed',
  'Almost every AI pilot works. Almost none of them become how people work the next day.',
$md$
The pattern shows up everywhere, and it is so consistent that you start to suspect the problem isn't anyone in particular. Someone tries something, it works, they demo it, everyone is impressed. Three months later, the work is done exactly the way it was before.

It isn't a lack of willingness or budget. A pilot and a process test different things.

## What a pilot proves

It proves that the model can do the task. That's all, and it almost always comes out yes, because you tested it yourself, with the cases you picked, watching the output.

It doesn't prove any of the three things that decide whether it survives:

**Who owns the result.** If it goes wrong, who takes responsibility? As long as the answer is "whoever tested it", it won't scale, because that person has another job.

**What happens when it goes wrong.** Not *if* it goes wrong: when. If there's no answer, what you have is a bet that it won't happen.

**Where the input data comes from every day.** In the pilot, you gathered it by hand. On Monday at nine, who gathers it? If the answer is a person, the savings are already gone.

## The bottleneck is never the model

This is the most counterintuitive point and the most consistent one: in the projects that fail, the model worked fine. What was missing was the glue. Who feeds it the input, who checks the output, what happens on a Sunday, where the record of what it did is kept.

The glue is boring work and it doesn't show well in a meeting. That's why nobody plans it, and that's why pilots die.

## The question that organises everything

**What task does a person stop doing, and how many minutes a week is that?**

If you can't answer that in one sentence, you don't have a project: you have a demo. And there's nothing wrong with a demo, but it's worth calling it by its name, because you don't give a demo three months on the calendar.

## The trap

Measuring the pilot by how enthusiastic the meeting was. The enthusiasm is real, and it predicts nothing.

What does predict something is a number you can count before and after: minutes per week that disappeared, cases that stopped reaching a person, days shaved off a deadline. If you can't count it before you start, you won't be able to after, and the argument over whether it was worth it will be settled by whoever talks loudest.

## What to do this week

Pick one of your own processes, one that repeats, and write three lines:

- who does it today and how long it takes
- where the input data comes from
- what happens when the result is wrong

The third one is the one almost nobody can fill in. If you struggle with it too, that's where the work is, not in the model.
$md$,
  8,
  'curado'
from lessons l where l.slug = 'fr-negocios'
on conflict do nothing;

insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'en', null,
  'Designing for when it gets it wrong',
  'A product with AI inside gets it right almost every time. The whole design game is played in the "almost".',
$md$
In normal software, an error is an event: something fails, the system says so, a red message appears. You design the happy path and then handle the errors, which come labelled.

With a model inside, that doesn't exist. The wrong output has exactly the same shape as the right one: just as fluent, just as confident, just as plausible. Nobody raises a hand.

## The error doesn't look like an error

This changes where the design work is. Catching exceptions isn't enough, because there is no exception: there's a normal answer that happens to be false.

And the cost isn't the error itself. It's that the person has no way of knowing which ones to check, so they end up checking all of them, which saves them nothing, or checking none, and then the error travels.

## The three ways out

What separates a product people use from one they tried once:

**You can see where it came from.** The quote, the document, the spreadsheet row, the original email. Not so people read it every time, but so they can check the one that bothered them in ten seconds instead of ten minutes.

**Correcting is cheaper than doing it by hand.** If fixing a bad output costs more than having written it yourself, the product is a net loss. This sounds obvious and it's where most products fall down: they design the path for generating and not the path for correcting.

**The system knows when it doesn't know.** This is the hardest one and the one that pays off most.

## The counterintuitive part

A product that sometimes says "I'm not sure about this one, take a look" builds more trust than one that answers everything with the same confidence.

It seems backwards: showing doubt looks like showing weakness. But the person using the second version learns quickly that they can't trust anything, because they have no way to tell the answers apart. The person using the first learns that when there's no warning, they can move ahead.

Put another way: **trust isn't built by being right more often, it's built by being predictable about when you might fail.**

## The trap

Hiding that there's a model inside so the experience feels more magical.

It works until the first time it gets something wrong. Then the person has no mental model of why it happened, and the conclusion isn't "this answer was wrong": it's "this isn't reliable". You lose trust in the whole product because of one case, and you don't win it back by explaining afterwards.

## What to do this week

Take the thing of yours that other people use the most and answer one question: **when the result is wrong, what does the person see?**

If the answer is "nothing, they don't find out", that's the next thing to build, and it matters more than any quality improvement on your list.
$md$,
  8,
  'curado'
from lessons l where l.slug = 'fr-producto'
on conflict do nothing;

insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'en', null,
  'Why it shows',
  'Everyone can spot a text written by AI and almost nobody can say why. Understanding the mechanism is what lets you use it without it showing.',
$md$
The problem isn't quality. It's well written: the grammar is correct, the structure holds together, there are no repetitions. And it still shows, and the reader's reaction isn't "this is bad" but something worse, which is that they stop reading.

It's worth understanding the mechanism, because the fix isn't the one everybody tries.

## What a model does when it writes

It returns the most probable thing. That's the operation, and it isn't a flaw: it's exactly what the model is for.

The most probable text is the average of everything already written on the subject. That's why the result is competent and anonymous at the same time. It has nowhere to get what only you know, because that wasn't anywhere when the model learned.

## The tells

Once you see them, you can't unsee them:

- **Everything comes in threes.** Three reasons, three benefits, three steps. The world rarely comes in threes.
- **The paragraph that sums up what you just read**, right before moving on.
- **Adjectives that choose nothing**: robust, powerful, innovative, key. Take them out and the sentence says the same thing.
- **The closing that takes off.** The last two lines start talking about the future of humanity.
- **No numbers of its own.** Round figures, or none.

## Where the value is

In what the model can't know. The data from your operation. The example that happened to you on Tuesday. The objection a specific person raised and how you handled it. The number you pulled from your own spreadsheet.

That isn't on the internet, so it isn't in the average. And it is, almost always, the only thing that makes the text worth reading.

## The way of working that works

The opposite of how almost everyone does it.

**Wrong:** ask it for the text and then improve it. You start from the average, and everything you do is makeup.

**Right:** give it the material (your raw, messy notes, the data, the anecdote, the conversation you had) and ask it for structure and wording on top of that. The model does what it does well, which is organising and drafting. You supply what isn't on the internet.

The difference in the result is huge and has nothing to do with the prompt.

## The trap

Asking it to "sound more human" or "less like AI".

It doesn't work, and it's worth understanding why: you're asking for more of the same average with a different label on it. It will change the register, throw in some colloquialism, shorten the sentences. It still has nothing to say that wasn't already said.

**What makes a text human is information, not tone.**

## What to do this week

Take the last text you published and mark the parts that only you could have written: a piece of data of yours, a case of yours, an opinion someone could argue with.

If there aren't any, the problem wasn't the AI. The text wasn't needed.
$md$,
  7,
  'curado'
from lessons l where l.slug = 'fr-diseno'
on conflict do nothing;

insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'en', null,
  'Check an answer in two minutes',
  'You know it can make things up. What almost nobody knows is how to check quickly without redoing the work from scratch.',
$md$
You asked the AI for a summary of what the regulations say about the enrolment period. It answered with three tidy paragraphs, with dates and a percentage. It sounds perfect. You're about to paste it into an email to families.

Now comes the uncomfortable part: you can't know whether it's true. And checking everything would take longer than writing it yourself. So either you trust it blindly, or you stop using it. There's a third option, and it's to look at **only what matters**.

## You don't check everything, you check what breaks

A long answer has two kinds of sentences. The ones where nothing happens if they're wrong ("education is a complex process") and the ones where, if they're wrong, you're in trouble: a date, a figure, a name, a quote, a requirement. Those are the only ones you need to look at.

The method has three steps and fits into two minutes:

1. **Mark the hard facts.** Reread the answer and underline anything that is a number, a date, a proper name, a quote or something that "the law says". There are almost always five or six.
2. **Ask it to give itself away.** Write: "From your answer, separate the facts you're sure about from the ones you might be making up, and tell me where each one comes from". It isn't foolproof, but it will often admit that a fact is a guess, something it won't do on its own.
3. **Confirm at the source, only those facts.** Open the original document, the official page, or ask someone who knows. Don't reread everything: go straight to the date and the percentage.

## A worked example

The answer said: "Enrolment closes on 30 November and requires three documents, including the vaccination certificate". The hard facts are: the date, the number of documents and the certificate.

You ask it to give itself away and it replies that it inferred the date and the number of documents from "what's usual", and that it doesn't have the school's own regulations. So now you know all three facts are guesses. You open the real regulations: the date was 15 December and there were four documents. Two minutes, two mistakes caught before sending the email.

Notice something: the answer wasn't "bad". It was well written and plausible. That's why you have to look at the facts and not at the style.

## A signal to be more suspicious

If the answer includes a word-for-word quote, an article number, a link or the title of a book, treat it as suspect until you've seen it with your own eyes. That's exactly what it makes up the most.

## Check that you got it

An answer says: "According to a 2019 study, 63 percent of families choose a school because of its proximity". What do you check first?

:::Show the answer
**The study, before the percentage.** If the study doesn't exist, the 63 percent is worth nothing, even if the number sounds reasonable. Look it up by title and author. If it doesn't turn up anywhere, throw out the whole claim, don't correct it: there's nothing to correct.
:::

## Try it now

Take an AI answer you've used this week, or ask for a new one about something from your work. Underline the hard facts and confirm **three** of them at the source. Time yourself. It almost certainly won't take more than five minutes, and the first time is the slowest.

## The rule to take with you

**Don't check everything: check what, if it's wrong, leaves you exposed.** Hard facts first, style never.
$md$,
  7,
  'curado'
from lessons l where l.slug = 'f11-verifica-en-dos-minutos'
on conflict do nothing;

insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'en', null,
  'Have it read a long document for you',
  'You have forty pages due Monday and time for ten. The AI reads all of it, but if you ask for "a summary" it gives you what it finds important, not what is useful to you.',
$md$
A forty-page report lands on your desk, or a contract, a set of regulations, the minutes of a three-hour meeting. You need to know what it says and what you have to do.

The reflex is to paste it in and type "summarise this". It gives you a neat page that says true, general things, and it skipped exactly the paragraph that affected you. That isn't a tool error: you asked it to decide what was important, and it doesn't know what's important **to you**.

## The question first, then the document

The difference between a useless summary and a good one is telling it first **why you're reading it**. Compare:

- "Summarise this document."
- "This is the school's behaviour policy. I'm the person who deals with families. I want to know what has changed for this year, what I need to tell them and what deadlines appear."

The second one doesn't ask for less: it asks for something that can be answered and checked.

## Four requests that almost always work

- **What affects me.** Tell it your role and ask only for what concerns you.
- **What has to be done.** "List the tasks, who has them and the date, if there is one."
- **What isn't clear or contradicts itself.** "Is there anything ambiguous, or anything that contradicts between sections?" That's where the real problems show up.
- **Where each thing says it.** "Next to each point, tell me which section or page it's on." This is what lets you check without rereading everything.

## A worked example

An admissions report of thirty-eight pages. Your request: "I'm in charge of communications. Tell me which figures in the report I can use in an email to families, which ones are estimates, and what page each one is on."

The answer brings six figures, each with its page. You go to the six pages, which takes three minutes, and discover that one was in a "projections" table and not in real data. You take it out. If you had asked for "a summary", that figure would have been mixed in with the others with no label at all.

## What to keep in mind

If the document is very long, the tool sometimes leaves things out along the way without telling you. Two simple defences. One: at the end, ask it "which parts of the document did you not use?". The other: split the document into chapters and work on one at a time. And remember the usual rule: hard facts get confirmed in the original.

## Check that you got it

You have the minutes of a two-hour meeting and you weren't there. Which of these requests is the best?

1. "Summarise these minutes."
2. "I wasn't at the meeting. Tell me what was decided, what I was assigned and what was left unresolved."
3. "Make the minutes shorter."

:::Show the answer
**Number 2.** It knows why you want them (to catch up), gives you a concrete question (decided, assigned, pending) and is useful for acting the same day. Number 1 gives you a generic summary and number 3 is still a set of minutes nobody reads.
:::

## Try it now

Pick a real document you have waiting to be read. Before pasting it in, write **one sentence** saying why you need it and what decision you'll make with it. Then ask for the three things: what affects you, what has to be done and where each thing says it. Check two of those points against the original.

## The rule to take with you

**Don't ask it for a summary: ask it to answer your question.** What the tool reads well is what you explained you were looking for.
$md$,
  7,
  'curado'
from lessons l where l.slug = 'f12-documento-largo'
on conflict do nothing;

insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'en', null,
  'A difficult email, with the right tone',
  'Saying no, replying to a complaint, delivering bad news. This is the work where the gap between a cold reply and one that looks after the relationship shows most.',
$md$
A family writes in, angry: they paid for an activity that was cancelled and want their money back. The school's policy says there are no refunds. You have to reply today, and you don't want to sound like a bureaucrat or promise what you can't deliver.

Writing an email like this takes half an hour and three drafts, because the problem isn't the grammar: it's the tone. And tone is something the AI does very well, if you tell it the whole situation.

## What not to do

Ask it to "reply to this complaint". With that, the tool has to guess whether you want to give in, refuse, apologise or explain. It guesses, and what almost always comes out is an email with a "we're sorry for any inconvenience" that says nothing.

## What to do instead: tell it four things

1. **What happened**, in a few lines, and paste the person's original email.
2. **What you can and can't offer.** "I can't refund the money. I can offer a place on the next activity."
3. **How you want to sound.** "Warm but firm. Acknowledge the anger, without apologising for something that wasn't our mistake."
4. **What you want to happen next.** "That the family feels heard and knows what the next step is."

The third one is the one almost nobody writes, and it's the one that changes everything.

## A worked example

Request: "I'm pasting the email from a mother who is asking for a refund for a cancelled trip. The policy is that there are no refunds, but I can offer a credit for the next trip. Write the reply: warm, firm, acknowledging that it was cancelled by our decision and not hers, without promising money. One hundred and fifty words at most."

The draft opens by acknowledging the concrete fact (the trip was cancelled), explains the policy in one sentence, offers the credit and closes with a clear next step. You read it and notice it says "we completely understand your frustration", a phrase you would never use. You ask: "Change that sentence for something simpler, the way I talk". Done.

## The draft is yours, not the tool's

Two checks before sending. First, that it **doesn't promise anything you can't deliver**: reread looking for words like "we guarantee", "definitely" or "without fail". Second, that it **sounds like you**. If you wouldn't say a sentence out loud, change it. And don't paste more of the family's personal data than you need: a first name is enough.

## Check that you got it

You have to say no to a family asking for a scholarship after the deadline. What piece of the situation can't be missing from your request?

:::Show the answer
**What you can offer.** A bare "no" is an email that cuts the relationship off. If there's an alternative (another deadline, another route, a person to talk to), put it in your request so the email doesn't end at a closed door. If there's nothing to offer, say so: "there's no alternative, I want the no to be clear and respectful".
:::

## Try it now

Think of a difficult email you have pending, or one from the last month. Write the four things (what happened, what you can and can't do, how you want to sound, what you want to happen next) and ask for **two versions**: a warmer one and a more direct one. Pick one and change whatever isn't yours. Compare the time with what it would have taken you alone.

## The rule to take with you

**Tone is something you ask for, not something you wait for.** If you don't tell it how you want to sound, the tool picks the most neutral tone, and in a difficult email, neutral sounds cold.
$md$,
  7,
  'curado'
from lessons l where l.slug = 'f13-mail-dificil'
on conflict do nothing;

insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'en', null,
  'Prepare for a meeting with AI',
  'The best help isn''t having it write your presentation: it''s having it ask the questions the other person is going to ask, before they ask them.',
$md$
Tomorrow you have a meeting that matters: with the leadership team about a budget, with a family who is about to leave, with a supplier you're going to ask for a discount. You think "I need to prepare" and end up rereading your notes, which you already know.

The problem with preparing alone is that **you already know what you know**. Blind spots are, by definition, the ones you can't see. That's where the AI helps in a way that's underused: not as the one who writes, but as the one who rehearses with you.

## Three uses, from least to most valuable

**Organising.** You pour out everything in your head, messy, and ask: "Organise this into what I want to achieve, what I have to say and what I still need to find out". This saves time, but it isn't the best use.

**Anticipating.** "I'm going to ask the leadership team to approve this. What objections might they raise, from most to least likely?" It gives you ten objections, and two or three you hadn't thought of.

**Rehearsing.** "Play the director. Be tough. Ask me one question at a time and wait for my answer." It's the closest thing to a real rehearsal, and it lets you practise the answer you find hard.

## A worked example

You have to ask for a budget to redo the school's website. You tell it: "I'm in charge of communications. Tomorrow I'm asking the leadership team for the budget to redo the site. The reasons are: the site is slow, it doesn't look good on a phone and families ask us things that should already be there. What worries me is that they'll ask for concrete results and I don't have them."

The tool anticipates: "How many enquiries were lost because of this?", "What happens if we wait a year?", "Can't it be fixed without redoing everything?". You hadn't thought of the second and the third. Now you have to build answers, and that's where the real preparation starts.

## What you can't delegate

The tool doesn't know the person you're going to talk to or the history of the place. The objections it gives you are the typical ones, and the specific ones you know yourself. Add your own: "Also, this person always asks about the cost before the benefit". And don't use it to write what you're going to say word for word: in a meeting, you don't read.

## Check that you got it

You're going to give a colleague bad news. Which is the best rehearsal request?

1. "Write what I have to tell them."
2. "Play my colleague, who is going to get angry and say it's unfair. Respond the way they would, one sentence at a time."
3. "Give me ten tips for delivering bad news."

:::Show the answer
**Number 2.** It's the only one that makes you practise: you react to a response, not to a list. Number 1 leaves you with a text you won't be able to read live, and number 3 is theory you already know. After the rehearsal, ask "what did I do well and what would you change?" and you'll get concrete feedback.
:::

## Try it now

Think of a meeting this week. In five minutes: tell it in three sentences what it's about, what you want to achieve and what worries you. Ask for the **five most likely objections** and write your answer next to each one, in one line. If you can't answer one of them, you've found what you were missing in your preparation.

## The rule to take with you

**Ask it to question you, not to write for you.** Preparation is worth what the questions you hadn't thought of are worth, and the tool is excellent at asking them.
$md$,
  7,
  'curado'
from lessons l where l.slug = 'f14-prepara-una-reunion'
on conflict do nothing;

insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'en', null,
  'Compare two options to decide',
  'When you''re torn between two paths, asking it "which is better" is the worst possible question. There''s a way of asking that clears your head without deciding for you.',
$md$
You have to choose between two suppliers, two dates for an event, two candidates or two ways of organising enrolment. Both have pros and cons, and you've been going back and forth for a week.

You ask the AI: "Which is better?". It answers confidently that it's A, with three arguments that sound good. If you ask again in a different way, sometimes it says B. It isn't changing its mind: **it has no judgement of its own about your situation**, and if you don't give it any, it picks whatever sounds most reasonable in general.

## What it does well

It doesn't decide for you. What it does very well is structure the decision, and that's already half the work. There are four steps.

1. **Tell it what you're deciding and what matters to you.** "I'm choosing between two enrolment systems. What matters to me, in this order: that families don't have a hard time, that it's cheap to maintain and that it can be changed if it doesn't work."
2. **Ask for the criteria you're missing.** "What other factors should I look at that I didn't mention?" Usually one you forgot turns up.
3. **Ask it to compare the two options criterion by criterion**, in a list. Not in a table or with scores: one sentence per option and per criterion.
4. **Ask what would have to be true for each one to win.** This is the most useful one.

## A worked example

You're torn between holding the open day on a Saturday morning or a Thursday afternoon. You give it the context and your priorities: attendance of working families, the cost of opening the school and staff convenience.

And you ask: "What would have to be true for Saturday to win, and what for Thursday?". It answers: Saturday wins if most families work office hours and if staff accept the extra day. Thursday wins if you can offer families flexible arrival. Now the decision is a different one: it's no longer "which is better?", it's "which of those two things is true?". And you can check that with a phone call, or with last year's list of registrations.

## The risk: it agrees with you

If you tell it "I think A, right?", it will agree with you and give you arguments. These tools tend to go along with whatever you put forward. To avoid that, ask it to defend the **opposite** option to the one you prefer: "Convince me to choose B, with the best arguments". If nothing moves you, you're now more confident in A.

## Check that you got it

You have two candidates for a post and you may already lean towards one. What's the first thing you ask the tool?

:::Show the answer
**That it defend the candidate you like less.** If you say which one you prefer, it tends to confirm you. Ask for the best arguments for the other one and see whether any of them makes you doubt. Then, yes, organise the criteria. And the final decision about a person is always yours and rests on interviews, not on what an AI wrote.
:::

## Try it now

Pick a small decision you have open. Write what matters to you, **in order of priority**, and do steps 2 and 4: the missing criteria and what would have to be true for each option to win. Keep whatever can be checked this week.

## The rule to take with you

**Don't ask which is better: ask what would have to be true.** The decision is still yours, but now you know what to look at to make it.
$md$,
  7,
  'curado'
from lessons l where l.slug = 'f15-compara-dos-opciones'
on conflict do nothing;
