-- ============================================================
-- Frontera - English adaptation of the first arc: the email you
-- write fifteen times (053). Natural English, same structure.
-- Run after 053.
-- ============================================================

-- ------------------------------------------------------------
-- Day 1
-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'en', null,
  'Find the email you always write',
  'There''s an email you write almost the same way every week. This week you set it up so you never write it from scratch again. Today, step one: find it and measure it.',
$md$
Everyone has one. The reply to someone asking for information, the reminder about a deadline, the interview confirmation, the note saying something is running late. You write it again every time, slightly differently, and every time it takes five or ten minutes that nobody notices because they're spread across the week.

This week you'll do one thing, one day at a time: set that email up so that next time it takes one or two minutes. By Friday you'll have something saved in your AI tool that works just by pasting in the details of the case.

Today you don't use AI at all. Today you choose well, because that decides whether the rest of the week is worth it.

## A repeated email has three parts

Take any email you send often and you'll find three things mixed together:

1. **The fixed part.** What always says the same thing: the greeting, the opening hours, the link to the form, the signature, the closing line.
2. **The case details.** What changes and can be copied from somewhere: the name, the date, the amount, the order number, the year group.
3. **The judgement.** What changes and needs thinking: whether you reply more warmly because this person has already complained twice, whether you offer an alternative, what you say when they ask for something that isn't possible.

An email is worth setting up when **the fixed part and the details are almost everything**, and the judgement is small and can be written down as a rule. If judgement is half the email, AI can help you with a draft, but it won't save you the thinking.

## A worked example

An admissions office receives about fifteen enquiries a week from families asking about places. The reply always has the same shape: thanks for getting in touch, how the process works, which dates there are for visits, the link to sign up and who will contact them.

What changes: the family's name, the year they're interested in and, sometimes, whether they already have a child at the school. That last one is the only judgement: if there's a sibling, the email mentions it and explains that they have priority.

The time sum:

- Each reply takes about **six minutes**, between finding the last similar email, copying it, changing the details and rereading.
- Fifteen a week is **ninety minutes**.
- Once it's set up, each one takes a minute and a half: paste the details, read, send. That's **twenty-two minutes**.

That's more than an hour a week, every week, from a single email. Write that number down, because on Friday you'll measure it again.

## The edge: when it isn't worth it

Not everything that repeats is worth setting up:

- **When it's almost all judgement.** A reply to a serious complaint, bad news, someone who's angry. Every case is different and what matters is what you think. AI helps you write better there, but there's no template.
- **When you send it twice a month.** The effort of setting it up never pays off.
- **When the rules change every time.** If the process changes monthly, sort out the process first.

## Check you've got it

Which of these three emails is worth setting up this week?

1. The interview confirmation, with day, time and what to bring. You send ten a week.
2. The reply to a family complaining that nobody called them back. Two or three a month, each one different.
3. The overdue payment reminder, with the amount and the deadline. You send thirty a month.

:::Show the answer
**Number 1 and number 3. If you have to pick one, number 3**, which has more volume. Both are almost all fixed text and details, with very little judgement: in the reminder, for example, whether it's the first notice or the second.

Not number 2: it's almost all judgement, it comes rarely and every case is different. That one calls for the lesson on difficult emails, not a template.
:::

## For today

1. Open your sent folder and find the email you repeat most. A tip: search for a phrase you always write, such as "thanks for your enquiry" or "just a reminder that".
2. Count how many you sent last month and estimate how many minutes each one takes. Write down the sum: number times minutes.
3. Pick **three** of those emails that you sent and liked how they turned out. Copy them into a note. **Remove other people's names, email addresses and details** before pasting them into any tool: write "Family X" or "the pupil" instead.

Tomorrow you'll use them. Those three examples are the raw material for everything that follows.

## The rule to take away

**Set up what repeats, not what looks similar.** An email that is almost all fixed text and details gets set up once. One that is almost all judgement gets thought through every time.
$md$,
  7, 'curado'
from lessons l where l.slug = 'a1-mail-repetido-1'
on conflict do nothing;

-- ------------------------------------------------------------
-- Day 2
-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'en', null,
  'Three examples beat an explanation',
  'Yesterday you chose the email and collected three that went well. Today you use them: instead of explaining to the AI how you write, you show it.',
$md$
If you ask an AI to "write a warm but professional email to a family asking about places", you'll get a warm, professional email. Anyone's. With "We hope this message finds you well!" and three paragraphs where you'd write one.

The problem isn't the tool. "Warm but professional" means different things to different people, and it has no way of knowing what it means to you.

## Show instead of explain

There's a way of asking that almost nobody uses and that changes the result more than any adjective: **paste in examples of what you've already written well** and ask for a new one just like them.

Examples tell it, all at once, everything that would be hard to explain: the length, the tone, how you greet people, what goes first, how you sign off, what you never say. It copies a pattern far better than it follows a description.

The request always has the same shape:

1. **What it is.** "These are three emails I send to families asking about places."
2. **The examples.** All three, one under the other, separated by a line saying "Example 1", "Example 2", "Example 3".
3. **The new case.** "Write one just like them for this case:" followed by the details.
4. **One restriction.** "Same length and same tone. Don't add anything that isn't in the examples."

That last line matters more than it seems. Without it, the tool tends to improve things you didn't ask for: it adds a paragraph, a longer greeting, an offer you don't make.

## A worked example

The new case: the Fernández family is asking about a place in Year 2 and has a daughter in Year 5.

With the adjectives request, the reply was 180 words long, opened with "Thank you so much for your interest in our school community!" and said nothing about the sister, because nobody had told it that mattered.

With the three examples pasted in, one of which happened to be for a family with a sibling at the school, the reply was 95 words long, used the usual greeting, put the sibling-priority sentence in the same place you put it, and had the right link. One word needed changing.

Notice what made the difference: **the sibling example taught it the sibling rule** without anyone writing it down.

## The edge: when examples fail

- **When the examples contradict each other.** If one is formal and another very casual, the result lands halfway and resembles neither. Pick examples you'd send exactly as they are today.
- **When all three are the same case.** It will copy that case even when the new one is different. Your examples should cover the variants you actually have: with and without a sibling, first notice and second notice.
- **When it copies details from the examples.** Sometimes a name or date from an example slips through. That's why you removed people's details yesterday: there's nothing real to leak, and you're not handing third-party data to any tool.

## Check you've got it

You need to set up the payment reminder. Which is the best set of three examples?

1. Three first-notice reminders, which are the ones you send most.
2. A first notice, a second notice and one to someone on a payment plan.
3. The best reminder you've written and two that went badly, so it can see the difference.

:::Show the answer
**Number 2.** It covers the real variants you'll face, and each example teaches it a different rule without you having to write it.

Number 1 teaches one case well: when you ask for a second notice, it will write it as if it were the first. Number 3 looks clever, but with bad examples mixed in it's quite likely to copy parts of the bad ones. Examples are what you want it to do, not what you want it to avoid.
:::

## For today

1. Open your AI tool and build the request with its four parts: what it is, the three examples, the new case and the restriction.
2. Use a real case, one of the next ones you have to send.
3. Count how many things you had to change in what it gave you, and **write down which ones**. Don't just fix them: note them. Tomorrow those corrections become rules.

## The rule to take away

**Don't describe how you write: show it.** Three good examples teach more than any adjective.
$md$,
  7, 'curado'
from lessons l where l.slug = 'a1-mail-repetido-2'
on conflict do nothing;

-- ------------------------------------------------------------
-- Day 3
-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'en', null,
  'Build the recipe: the fixed part, the rules and the gap',
  'You know it works with examples. Today you put it all into one text that you use the same way every time, so you never have to rebuild the request.',
$md$
Yesterday's request worked, but it has a cost: every time you use it you have to find the three examples, paste them in, write the restriction and remember what you corrected last time. That's exactly the work you wanted to get rid of.

Today you turn it into a **recipe**: a text you write once, which holds everything that doesn't change, with a gap at the end for the only thing that does.

## The five parts of a recipe

1. **What it's for.** One or two lines: which email it is, who receives it and what it needs to achieve. "Reply to families enquiring about places. It should leave them with a clear next step and wanting to come to the visit."
2. **What always goes in.** The fixed details, written once: the form link, the visit dates, the opening hours, the signature. That way it doesn't invent them or take outdated ones from an example.
3. **The rules.** What you learnt yesterday by correcting, written as rules. "If they have a sibling at the school, mention it and say they have priority." "Never confirm a place: Admissions confirms it in writing."
4. **The examples.** Yesterday's three, without people's details.
5. **The gap.** The last line: "Details for this case:" and nothing else. That's where you paste the name, the year and whatever applies each time.

The order hardly matters. What matters is that **everything you currently carry in your head gets written down**, because whatever isn't written down, the tool guesses.

## A worked example

Yesterday, with the examples request, there were three corrections: it used the old opening hours, taken from an example several months old; it wrote "Dear Sir or Madam", which you never use; and it offered a visit "at whatever day and time suits you", which doesn't exist because visits are on fixed dates.

Each correction becomes part of the recipe:

- The old hours go into **what always goes in**: "Opening hours: Monday to Friday, 8 am to 4 pm." Now it doesn't pull them from an example.
- "Dear Sir or Madam" becomes a **rule**: "Greeting: Hello, followed by the family surname. Never Dear Sir or Madam."
- The flexible visit becomes a **rule** and goes into **what always goes in**: "Visits are on the dates in this list. Don't offer others." Plus the list.

With the recipe in place, yesterday's case came out with no corrections at all. So did the next one.

## The edge: rules that don't work

Not every sentence written as a rule works. Some rules the tool can follow, and some tell it nothing:

- "Be empathetic" tells it nothing: there's no way to know whether it complied.
- "If the family describes a difficult situation, thank them for sharing it in the first line" does: it's concrete and can be checked.

The test is simple: **if you can't look at the email and say yes or no, the rule is a wish.** Replace it with what you would do in that case.

## Check you've got it

Which of these rules work as they are, and which need rewriting?

1. "Make it sound friendly."
2. "No more than four short paragraphs."
3. "If they ask about bursaries, don't give amounts: say the information is given at the families' meeting."
4. "Don't make it robotic."

:::Show the answer
**Numbers 2 and 3 work.** You can check them by looking at the email: count the paragraphs, see whether there's an amount.

**Numbers 1 and 4 need rewriting.** They're wishes. One way to make them concrete: "Greet with Hello and the surname, sign off with the sender's first name, and no stock phrases such as please do not hesitate to contact us." That's what "friendly and not robotic" actually meant.
:::

## For today

1. Open a note and write your recipe with its five parts.
2. Turn **all** the corrections you noted yesterday into rules.
3. Try it on a real case: paste the whole recipe into a new conversation, fill in the gap and see how much needs correcting.

If something needed correcting, don't fix the email: fix the recipe. That's tomorrow.

## The rule to take away

**Whatever is in your head and not in the recipe, the tool guesses.** Write it down once and the guessing stops.
$md$,
  7, 'curado'
from lessons l where l.slug = 'a1-mail-repetido-3'
on conflict do nothing;

-- ------------------------------------------------------------
-- Day 4
-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'en', null,
  'Check without rewriting',
  'The recipe already writes almost right. Today you learn to check in thirty seconds, and to make every error you find stop coming back.',
$md$
A recipe that works brings a new risk: because it's almost always right, you stop reading. And the day it goes wrong, it goes wrong in an email you've already sent.

You don't need to reread everything with a magnifying glass. You need to look at **the three things that would leave you looking bad if they were wrong** and, every time you find an error, fix it in the right place.

## What to check in thirty seconds

1. **The case details.** The name, the date, the amount, the year group. Are they the ones you pasted in? It's the most common error and the most expensive one: an email with another family's surname.
2. **What it promises.** Everything the email says will happen: a place, a call, a deadline, a discount. Can you deliver it? The tool tends to be kind, and being kind sometimes means promising too much.
3. **That it hasn't invented anything.** A detail that wasn't in the recipe or the case: a date, someone's name, a requirement. If you don't know where it came from, take it out.

Style, on the other hand, hardly needs checking: the examples fix it. If the style drifts, it's because the recipe has examples that contradict each other.

## Fix the recipe, not the email

When you find an error, the temptation is to correct it in the email and send. It works today and happens again next week.

The practical rule is this: **if you correct the same thing twice, it goes into the recipe.** Once could be chance. Twice is a pattern.

## A worked example

In one week with the places recipe, fourteen emails went out. The corrections were:

- Twice it wrote "we can confirm your place" when the family was only asking about dates. That's a promise that can't be made. **It goes into the recipe:** "Never write confirm, reserve or guarantee. Admissions confirms places in writing."
- Once it got a double-barrelled surname wrong, using only the first half. That's a case detail and it happened once. **It doesn't go into the recipe:** correct it and move on.
- Three times it added "please do not hesitate to contact us with any questions" at the end, which isn't in any example. **It goes into the recipe:** "End with the signature. No closing phrase."

Fourteen emails, six corrections. Two became rules. The following week, with the recipe fixed, it was fourteen emails and one correction.

## The edge: the recipe that keeps growing

If every correction becomes a rule, within a month the recipe has forty lines, and some of them contradict each other. A long, contradictory recipe writes worse than a short one.

Three signs it needs pruning:

- **More than fifteen rules.** Several probably say the same thing in different ways.
- **Two rules pulling in opposite directions**, such as "keep it brief" and "explain the process fully".
- **Rules for a case that happened once.** That case calls for judgement: write it yourself.

Every so often, read the whole recipe and ask of each rule whether it's still needed.

## Check you've got it

These are a week's corrections with the payment reminder recipe. Which ones go into the recipe?

1. Three times it wrote the amount without the currency symbol.
2. Once it wrote to someone who had already paid. The case details were wrong in the spreadsheet.
3. Twice it offered "a tailored payment plan", which doesn't exist.

:::Show the answer
**Numbers 1 and 3.** Number 1 is a formatting pattern: "Amounts always carry the currency symbol and no decimals." Number 3 is a promise that can't be kept, and twice is already a pattern: "Don't offer payment plans. If they ask, tell them to check with the Finance Office."

**Not number 2.** The tool didn't make that error: the case details were wrong. No rule in the recipe fixes it. It gets fixed in the spreadsheet.
:::

## For today

1. Use the recipe for every email of this kind you need to send today.
2. Before sending each one, check only the three things: details, promises, inventions.
3. Keep a tally in the recipe's note: how many emails, how many corrections, which ones repeated. Turn the repeated ones into rules.

## The rule to take away

**If you correct the same thing twice, it isn't an error in the email: it's a rule the recipe is missing.**
$md$,
  7, 'curado'
from lessons l where l.slug = 'a1-mail-repetido-4'
on conflict do nothing;

-- ------------------------------------------------------------
-- Day 5
-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'en', null,
  'Save it and measure what you gained',
  'Last day. The recipe works, but it still lives in a note you have to copy. Today you save it where you use it, and redo Monday''s sum.',
$md$
A recipe in a note is already a huge step forward. But each time you use it you have to open the note, copy it, open a new conversation, paste it in and fill in the gap. That's four extra steps, and extra steps are what make a good habit fade within three weeks.

Today you save it **inside your tool**, so that using it means opening something and pasting in the details of the case.

## Where it lives

The three most widely used tools each have a place for this, under different names:

- In **ChatGPT**, a project or a custom GPT.
- In **Claude**, a project.
- In **Gemini**, a Gem.

All three do the same thing: they store a text with instructions, and sometimes files, which is read automatically at the start of every conversation you open there. The whole recipe goes there: what it's for, what always goes in, the rules and the examples. You don't need to write the gap: every new conversation is the gap.

And if your tool has none of this, or you use it from your phone, a pinned note with the recipe ready to copy works too. What matters isn't where, but that it's **one tap away**.

Give it a name you'd say out loud: "Places reply", "Payment reminder". The day you have four of them, you'll want to find them.

## A worked example: Monday's sum

On Monday the sum was fifteen emails a week at six minutes each: ninety minutes.

With the recipe saved, it was measured properly on Friday, with a stopwatch, over the last ten emails:

- Open, paste the details and check the three things: **one minute** on average.
- Two of the ten needed a change: **two minutes** more each.
- Total for ten: fourteen minutes. For fifteen, about **twenty-one minutes**.

Ninety against twenty-one is **sixty-nine minutes a week**. Over a working year of forty weeks, that's about **forty-six hours**. More than a full working week, from a single email.

And there's a gain the sum doesn't capture: every email comes out equally well, including the one you write at six on a Friday evening.

## The edge: don't let it send itself, yet

The next step that will occur to you is to make it send itself: read the incoming email, write the reply and send it. It can be done, and it belongs to another level, automation.

But don't do it yet. Right now you're the one checking details, promises and inventions, and that check is what lets you trust it. Before taking yourself out of the loop you need weeks of emails that went out right without being touched. When your correction tally hits zero several weeks in a row, that's the day to talk about it.

## Check you've got it

Someone sends twelve reminders a week and each one used to take eight minutes. With the recipe saved, they take two. How much do they gain per week, and over a forty-week year?

:::Show the answer
**Seventy-two minutes a week and forty-eight hours a year.**

Before: twelve times eight, ninety-six minutes. Now: twelve times two, twenty-four minutes. The difference is seventy-two. Times forty weeks, two thousand eight hundred and eighty minutes, which is forty-eight hours.

If the sum for your own email came out similar, that's the number worth telling someone on your team.
:::

## For today

1. Save the recipe in your tool, in the right place, with a clear name.
2. Use it for the next real email of that kind and time how long it takes.
3. Redo Monday's sum with the new number. Write it somewhere you'll see it.

When you close this lesson, in what you commit to, write down **the next email you'll set up**. The second one takes half the time, because now you know how.

## The rule to take away

**A good habit that takes four steps gets dropped. One that takes a single step sticks.** Save it where you use it.
$md$,
  7, 'curado'
from lessons l where l.slug = 'a1-mail-repetido-5'
on conflict do nothing;

-- ------------------------------------------------------------
-- Check
-- ------------------------------------------------------------
select l.arc_day, c.lang, c.title, length(c.body_md) as characters
from lessons l join lesson_contents c on c.lesson_id = l.id and c.tool_id is null
where l.arc = 'mail-repetido'
order by l.arc_day, c.lang;
