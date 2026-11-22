-- ============================================================
-- Frontera - English adaptation of lessons (batch 2 of 3)
-- Natural international English, not a literal translation.
-- ============================================================

insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'en', null,
  'Learn something new with a tutor that quizzes you',
  'Ask it to explain and you understand while you read, then forget it when you close the tab. Ask it to quiz you and you actually learn.',
$md$
You need to understand something new for work: how to read a balance sheet, what a conversion rate is, how a scholarship system works. You ask the AI to explain it. The explanation is clear, you read it, you nod, and a week later you remember nothing.

It's a familiar thing: reading a clear explanation gives you the **feeling** of having understood. Real understanding shows when you have to use the idea, not when you recognise it.

## Flip the roles

The best way to use it for learning is not for it to talk while you read. It's for **it to ask and you to answer**. That discomfort of having to dig the answer out of your own head is exactly what makes knowledge stick.

## How to set up the session

Write something like this, adapted to your own situation:

"I want to learn [the topic]. Right now I understand [whatever little you know]. Act as a tutor: explain one short idea, then ask me a question to check I got it, and wait for my answer before moving on. If I get it wrong, don't give me the answer straight away: give me a hint. Use examples from [your work]."

Four pieces matter: **where you're starting from** (so it doesn't explain what you already know or what you can't follow yet), **one idea at a time**, **waiting for your answer**, and **a hint before the solution**.

## A worked example

You want to understand what a "conversion rate" is because your team mentions it in every meeting. You tell it you know little about marketing, that you work at a school, and that you want admissions examples.

It explains in three lines: out of every hundred families who enquire, how many end up enrolling. Then it asks: "If two hundred families enquired yesterday and ten enrolled, what's the rate?" You answer "ten percent", and it gently corrects you: it's five, because ten out of two hundred. You got something that simple wrong, so you won't forget it. It moves on to the next idea: "And what would you do if it dropped from five to three?"

## Three precautions

- **Don't believe everything it says.** If what you learn is going to inform a decision, check it against another source. A tutor that invents a definition with total confidence is worse than none.
- **Tell it to stop.** If it starts repeating itself or going in circles, say "let's move on".
- **Close the session with a review.** "Ask me five things about what we covered, with no hints." It's the part that pays off most and the one people skip most.

## Check that you understood

After a tutoring session on a new topic, what's the best way to check that you really learned it?

:::Show the answer
**Explain it in your own words to someone, or to the tool, without looking at anything.** Ask it: "Play a colleague who knows nothing about this. I'll explain it and you ask me questions." If you get stuck at some point, that's exactly what you haven't understood yet. Rereading your notes gives you the same false sense of understanding as reading the explanation did.
:::

## Try it now

Pick something you're expected to know but haven't mastered yet. Write the tutor request with the four pieces and do **ten minutes** of session. At the end, ask for the five-question review. Note how many you answered without help: that number is what you learned, and it's more honest than how you feel.

## The rule to take with you

**To learn, let it quiz you.** Reading a good explanation feels like learning; answering a hard question is learning.
$md$,
7, 'curado' from lessons l where l.slug = 'f16-aprende-con-tutor' on conflict do nothing;

insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'en', null,
  'What you never give it',
  'The most important lesson in the track, and the one no course teaches you until it''s already too late.',
$md$
When you type something into an AI, that text leaves your device and reaches a company's servers. That is all you need to understand to make good decisions. It's no reason to panic or to be naive: it's a fact that changes what's wise to type there.

## What never goes in

**Passwords and keys.** For anything, for any account. There is never a valid reason.

**Card details and bank account numbers.** Full numbers, security codes, PINs.

**Full identity documents**, yours and other people's, always.

**Data about other people who trusted you with something.** This is the most common mistake and the most serious, because it doesn't feel like a mistake: the student list, a patient's medical record, an employee's file, a client's report. You can decide about your own data. **About other people's, you can't.** And if that data reached you through your job, there is probably a law or a contract that says what you may do with it.

**Confidential work material** that you wouldn't put in an email to someone outside.

## What's fine, with care

If it's yours and the consequences of it leaking are tolerable, it's fine. Your CV, your notes, your draft, your personal problem told without naming third parties.

## The trick that solves 90%

You don't have to choose between not using the tool and handing over everything. **Remove the names.**

Instead of "María González, ID 30123456, owes three instalments", write "a family with three unpaid instalments". The help is exactly the same, because what it needs to understand is the situation, not who it is.

For a spreadsheet, delete the names column before uploading it. It takes ten seconds and changes the risk completely.

## The three questions

Before typing anything sensitive, take three seconds:

1. **Is this mine or someone else's?** If it's someone else's, it doesn't go in.
2. **What happens if this becomes public?** If the answer makes you uneasy, it doesn't go in.
3. **Does it need this to help me?** Almost always it doesn't. Remove it.

## What not to do

Don't reach the conclusion "so I won't use it for anything at work". That's throwing the tool out of the window over a problem you can solve by removing names. The people who decide well aren't the ones who don't use it: they're the ones who know what to remove before pressing enter.
$md$,
8, 'curado' from lessons l where l.slug = 'f09-que-nunca-le-das' on conflict do nothing;

insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'en', null,
  'Automate one small thing',
  'The last step of the track, and the way out: stop asking one request at a time and start building something that repeats.',
$md$
Up to now you've used the tool one request at a time: you ask, you get an answer, done. This is the last step of the track and the first of the next level: **something you do often, solved once and reused.**

I'm not talking about programming anything. I'm talking about something much smaller and much more useful.

## The idea

Think of something you do more or less the same way, more or less often. A weekly report. An email you repeat with variations. Turning messy notes into a tidy summary. Sorting something that always arrives in the same shape.

Now, instead of asking for it from scratch every time, write the complete instruction **just once**: what you receive, what you want it to do, by what criteria, in what format. Save that text. Next time, paste it and add the new data.

That is automation in its most basic form, and it's 80% of the benefit for 5% of the work.

## Why it matters more than it seems

Two reasons.

The first: **it improves with use.** Every time the result isn't right, you fix the instruction, not the result. By the fifth time you have something fine-tuned that works every time.

The second, deeper one: it changes your relationship with the tool. You go from asking for help to **designing how you want something done.** It's the difference between using and building, and it's exactly the step between the level you're at and the next one.

## Choose the first one well

It should meet three conditions:

- **You do it often.** At least once a week.
- **It's boring.** If you enjoy doing it, don't automate it.
- **If it goes wrong, it's no big deal.** The first one isn't for anything critical.

## Do it now, in ten minutes

1. Choose the task.
2. Write the complete instruction as if you were explaining it to someone who starts tomorrow and knows nothing: what they'll receive, what they have to do, what to keep in mind, how to hand it in.
3. Test it with a real case.
4. Fix the instruction, not the result.
5. Save it somewhere you'll find it.

## And with this you finish the track

You know what this thing is and why it makes things up, how to ask, how to correct, where to trust it and where not to, how to work with your own material, how not to start from zero, what you can do besides writing, what never to hand over, and how to leave something set up.

That's more than the vast majority of people who use AI every day can manage. From here on it's no longer about learning the tool: it's about keeping up with something that changes every week. That's what the rest of Frontera is for.
$md$,
8, 'curado' from lessons l where l.slug = 'f10-automatiza-algo-chico' on conflict do nothing;

insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'en', null,
  'When you have too many tools connected',
  'Google has just put a name to a problem you already have and probably didn''t know you had.',
$md$
On 19 November Google released something called Tool Retrieval in the Gemini API. If you stop at the headline, it's a feature of a tool you don't use. If you look at the problem it solves, it's yours.

## The problem

When you connect an AI to external tools (your email, your CRM, your database, your files), the model needs to know what each one can do. The full description of each tool, with all its parameters, **travels with every request you make**. Not once: every time.

With three tools you don't notice. With twenty, three things happen, and all three are bad:

- **Your context budget gets used up** describing tools you won't use in that conversation.
- **It gets slower**, because there's more text to process before it starts thinking.
- And the worst: **the model chooses worse**. The more similar options it has in front of it, the more confused it gets. It's the same effect you get with a twelve-page restaurant menu.

That third point explains things that have probably happened to you without you knowing why: the AI picks the wrong tool, or invents one that doesn't exist, or ignores one that was right there.

## What changed

The new idea: instead of always sending everything, send **only the names** of the tools and load the full description of one **only when the model decides to use it**. The model knows what's available, but it doesn't load the manual for each thing until it needs it.

Google implemented it on the server side, even for whole MCP servers: you mark an entire server as deferred and its tools are loaded on demand instead of being listed one by one.

## Why it matters to you even if you don't use Gemini

Two reasons.

**The first, immediate.** If you have lots of MCP servers connected at once, you're paying that cost right now, in slowness and in bad choices. You don't need to wait for your tool to implement this: the step you can take today is to **disconnect whatever you're not using in this session**. If you're working on an app, you don't need your CRM and your calendar connected. The problem isn't having many tools: it's having them all switched on at once.

**The second, deeper.** This points to where agent design is heading: from "give the model everything and let it sort it out" to **managing its attention**. The same thing that already happened with files, with memory and with long context. Every time something gets too big to fit whole, the solution isn't a bigger model, it's bringing in just the right amount at the right moment. It's the pattern you'll see repeat, and if you recognise it, you'll understand the next feature before it's announced.

## The small print

It's in preview, it's Gemini only, and only in one specific API. It's not something you can use tomorrow if you work with Claude. What you can use tomorrow is the diagnosis: **go and see how many tools you have connected right now and how many you actually used this week.**
$md$,
7, 'curado' from lessons l where l.slug = 'r-2026-11-21-tool-retrieval' on conflict do nothing;

insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'en', null,
  'How do you know it still works',
  'You have things in production that real people use. If one degrades tomorrow, how will you find out?',
$md$
This is probably the one thing that separates you from the next category. It's not a new tool or a better model: it's a discipline that almost nobody without a technical background has, and that you need because you already have things running that other people use.

## The problem

A system with AI inside doesn't fail the way an ordinary program does. A broken program throws an error and you find out. A system with AI **keeps answering**, with the same confidence as ever, and what changes is the quality. It classifies a little worse. It skips a case it used to catch. It makes up a fact once every twenty answers instead of once every two hundred.

Nobody warns you. You find out when someone complains, which is late and expensive, or you never find out.

And there are three reasons it degrades without you touching anything: **the model changed** underneath, **the data coming in changed**, or **someone tweaked the prompt** to fix one case and broke five others without noticing.

## What an eval is, plainly

A set of test cases with the correct answer next to each one, which you run whenever you like and which tells you what percentage came out right.

That's all. You don't need any tool. A spreadsheet with three columns (input, expected answer, result) is already an eval, and it's infinitely better than nothing.

## How to build the first one

**Gather twenty real cases.** Not made up: real ones, ones that have already gone through your system. Ten typical and ten odd. The odd ones are the ones that count: the ambiguous email, the one written in two languages, the one with the key detail inside an image.

**Write next to each one what should have happened.** This part hurts because it forces you to define what correct means, and often you discover you hadn't been clear about it. That discovery alone justifies the exercise.

**Run the twenty and count.** Seventeen out of twenty is your baseline. It doesn't matter whether it's high or low: what matters is that it exists, because from now on any change is compared against it.

**Run it again every time you touch something.** If it went down, you broke something. If it went up, you improved it. Without this you're guessing, and the feeling that it got better is notoriously unreliable.

## The trap

There's a warning from the people who train models that applies just as well here: **a checker that accepts incorrect answers is worse than having none.** If your twenty cases have weak expected answers, you'll optimise towards the weak with the comfort of feeling you're measuring.

That's why the twenty cases are written slowly and reviewed. It's the slow part and it's the part that does the work.

## What to do this week

Pick **the thing of yours that other people use most**. Open a spreadsheet. Paste in ten real cases with what should have come out. Run them. Write down the number.

With that you're already measuring, which is more than the vast majority of people with AI systems in production do.
$md$,
9, 'curado' from lessons l where l.slug = 'fr-evals' on conflict do nothing;

insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'en', null,
  'Work that happens without you',
  'The real indicator of level isn''t how many tools you know. It''s how much work gets done while you''re not there.',
$md$
There's one way of measuring someone's level with AI that never fails, and it has nothing to do with how many tools they know: **how much useful work happens while that person isn't looking.**

For the vast majority, including people who use AI very well, the answer is zero. Everything happens in real time: you ask, you look, you correct, you close. It's a conversation, and a conversation requires you to be there.

## Why it matters

It's not a question of productivity. It's that there's a whole class of things that **can only be done without you in front of them**, and as long as you work conversationally, you won't even try.

Checking every day something that changes little. Gathering material from many sources and keeping what's useful. Watching a queue of incoming things and sorting them. Letting you know only when something you care about turns up. All of that is boring, repetitive and perfectly delegable, and you won't do any of it sitting there watching.

## The three steps

**First: a saved instruction.** The lowest and most underrated. You write the complete instruction once for something you repeat, and you reuse it. You still trigger it yourself, but you no longer have to think it through every time.

**Second: something that runs by itself every so often.** A scheduled task that does that and leaves the result somewhere for you. This is where you cross the line: the work stops depending on you remembering.

**Third: something that decides whether it's worth bothering you.** The step almost nobody reaches. It doesn't send you everything it found: it filters and only alerts you when there's something that deserves your attention. The difference between an assistant and one more notification.

## The part nobody tells you

Asynchronous work has a cost that conversational work doesn't: **you're not there to correct it.** If it goes wrong, it goes wrong silently and for days.

That's why this topic and the one about measuring go together, and in that order. **Nothing you can't measure should run without you.** That's the whole rule, and it's the reason almost every attempt to automate with AI ends up abandoned: something got automated that nobody knew whether it was working well.

## What to do this week

Find **one thing you do every Monday** and that, if it ran by itself and badly, wouldn't matter much. That's your candidate. Don't automate it yet: first write down how you would realise it had gone wrong. If you can't think of how, pick another one.
$md$,
8, 'curado' from lessons l where l.slug = 'fr-asincronico' on conflict do nothing;

insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'en', null,
  'Managing its attention',
  'The pattern that explains half of what will come out this year, and why your long sessions get worse.',
$md$
There's a pattern that, once you see it, lets you understand most new announcements before they're made. And it also explains things that are already happening to you.

## The pattern

Everything that goes into a conversation with an AI competes for the same space: your instructions, the files you uploaded, the connected tools, and everything that was said before. That space is finite.

And here's what almost nobody understands: **the problem isn't that it doesn't fit. The problem is that, even when it fits, performance drops.** More things competing for attention means worse decisions about what to look at, just like a person with twelve tabs open.

That's why a long conversation gets worse even if it never reaches any technical limit. The three old versions of the file, the paths you tried and dropped, the error you already fixed: all of that still goes in with every request and still competes.

## The solution is never more space

This is the useful part. Every time something doesn't fit well, the industry's answer is **not** to enlarge the space. It's to **bring in just the right amount at the right moment**.

It happened with files: instead of stuffing in the whole document, you search for the relevant piece and bring in only that. It happened with memory: instead of dragging along the whole history, you save a summary and retrieve what's needed. And it's happening with tools: instead of describing all fifty in every request, you send the names and load the full description only of the one that's going to be used.

Three different problems, the same shape of solution, years apart. When the next announcement about this comes out, you already know what it will say.

## Three things you can do today

**Cut off in time.** The symptom that a conversation is saturated is unmistakable: **you start repeating instructions you've already given.** When that happens, don't insist. Open a new one and paste ten lines of status: what you're doing, what you decided, what's left, what not to do.

**Disconnect what you're not using.** If you have many tools connected, the ones not needed in this session are using up attention. Leaving them on just in case isn't free.

**Separate by topic.** One space per project, with its own context, instead of one huge place where everything is mixed together. The same thing you do with folders, for the same reason.

## Why this is level 4 and not level 2

Because it's not a technique: it's a mental model. Whoever has it understands why a tool behaves the way it does, can diagnose without trying things at random, and reads new announcements as variations on something they already understand. Whoever doesn't keeps switching tools, hoping the next one won't have the problem.
$md$,
8, 'curado' from lessons l where l.slug = 'fr-contexto' on conflict do nothing;

insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'en', null,
  'The best model is almost never the one you need',
  'You have five or six models within reach. The decision isn''t which one is best, and that''s exactly the question everyone asks.',
$md$
Every few weeks a new model comes out, someone publishes a comparison table and the ranking changes. If your way of deciding is to look at that table, you'll be switching tools forever and you won't work any better.

## The problem

Models don't line up in a single row. They move along four axes that don't go together: **how much they reason**, **how fast they answer**, **how much text they can take in** and **how much they put out**. The one that wins on reasoning is almost always the slowest and the most expensive.

Using that one for everything isn't tidiness, it's waste. And the reverse is also true: using the fast one for the only task of the day that really needed thinking is where hours get lost, because the answer comes back wrong and you don't notice until three steps later.

## The four questions

Before choosing, about the specific task:

**Does it have one correct answer or does it require judgement?** Extracting a date from an email has a correct answer. Deciding whether a complaint deserves escalating doesn't. The first doesn't need the expensive model; the second does.

**How much text goes in at once?** An email is two thousand words. A contract with its annexes is eighty thousand. That difference rules out models on its own, before any other consideration.

**How many times a day?** Once a week: use the best one and don't think about it again. Four hundred times a day: that's where the difference in cost and speed is the whole project.

**Does it matter if it takes thirty seconds?** If you're waiting, staring at the screen, it matters a great deal. If it runs overnight over a list, it doesn't matter at all and you can use the slowest one there is.

## What changed

There's a family of models that think before answering: instead of starting to write, they spend a while building the reasoning and then answer. On multi-step problems, like comparing three proposals against five criteria or finding the inconsistency in a budget, the difference is big and you can see it.

On rewording an email it does nothing. It's money and time spent on a task that has no steps.

The practical rule: **if you'd solve the task with pen and paper, jotting down intermediate notes, use one that reasons. If you'd solve it in one go, don't.**

## The trap

The model underneath your tool changes without anyone telling you. The same prompt, the same file, and November's output isn't March's.

If you've built something that depends on the answer coming back in a certain shape, such as a JSON, a list of five items, or a classification among three options, that breaks silently. It doesn't throw an error: it returns something else, with the same confidence.

That's the underlying reason evals exist, which is another lesson. Here it's enough to know that the floor moves.

## What to do this week

Write down the three things you repeat most with AI. Next to each one, note which of the four questions decides.

You'll very likely find that two of the three didn't need the expensive model, and that the third did and you weren't giving it one.
$md$,
7, 'curado' from lessons l where l.slug = 'fr-modelos' on conflict do nothing;
