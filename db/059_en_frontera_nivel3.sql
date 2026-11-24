-- ============================================================
-- 059 · The four level-3 frontier lessons, in English
-- ============================================================
-- British English, like the rest of the content. Same structure and
-- same figures as the Spanish version (058).
-- ============================================================

insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'en', null,
  'Before you measure, read',
  'The cases you imagine are not the ones that fail. The ones that fail are found by reading.',
$md$
When someone builds their first set of test cases, they build it from what they **imagine** might go wrong. It is reasonable and almost always wrong: what you think might fail and what actually fails have little in common.

This lesson has one idea: **before you measure, you read.** Read a lot of real outputs, write down what is wrong with each one in your own words, group them and count. That count tells you what to fix first and which cases belong in your test. Without it, you fix whatever annoys you most, which is not the same as whatever happens most.

## The case, with numbers

A school has a system that reads the enquiries coming in through its website, sorts them into four types and leaves a draft reply. It works. Nobody has complained. One afternoon, the person who built it sits down with **the 60 outputs from last week**.

Rule for the reading: one line for every output that has something wrong, in your own words, **with no categories decided in advance**. The categories come afterwards, out of the lines.

Result: **14 out of 60 have some problem**, nearly one in four. Grouping the lines gives four clusters:

- **7** confuse "I'd like to visit" with "I'd like to enrol" when the enquiry mentions a date.
- **4** quote last year's fees.
- **2** are too formal in tone.
- **1** is signed with the name of a person who doesn't exist.

Now the arithmetic. What bothered her when reading the drafts was the tone, and that is what she was planning to fix. Tone is **2 of the 14**: 14% of the problems. The first two clusters together are **11 of 14**, 79%.

And the count says something else: the old fees **are not an instructions problem**. No prompt fixes out-of-date data; you have to change the data the system reads. Without reading, she would have spent a week tweaking the instruction.

Only now does it make sense to build the test: the cases must include enquiries with dates, enquiries about fees and at least one that needs a signature. Those are the ones that fail.

## Where it doesn't apply

**With few outputs there is no pattern.** With ten, any cluster is chance. Below about thirty, wait until you have more before drawing conclusions.

**Frequency isn't everything.** The invented name is **1 of 14** and the most serious item on the list: an email to a family signed by someone who doesn't exist. The count orders by how often things happen; severity is added afterwards, by hand. A rare, expensive error can go first.

**Don't hand the first reading to another AI.** Later on you can automate the checking, but the first reading is where you discover what "good" means for this system. Hand it over and you hand over that definition too.

## Check you've got it

You read **50 summaries** that a system writes after each meeting. **12** have problems:

- 6 miss the decisions taken at the end.
- 3 assign a task to the wrong person.
- 3 are too long.

What do you fix first? Think it through before you open the answer.

:::Show the answer
**It depends on where the summaries go, and that is the answer.**

By frequency, the missed decisions win: they are half the problems (6 of 12), and they usually have a single cause, because the end of the meeting is what the system reads least carefully.

But if the summaries **are sent to everyone who attended**, the wrongly assigned task may come first even though it happens half as often: someone stops doing something because the summary said it was someone else's job, and nobody finds out until the next meeting.

Length comes last either way. It is annoying, but it doesn't make anyone do anything wrong.
:::

## What to do this week

Pick the system of yours that gets used most. Gather **the last 30 to 50 real outputs**. One line for each one that has something wrong, in your own words. Then group and count.

It takes about 45 minutes. At the end you have two things you didn't have before: what to fix first, and the list of cases your test simply has to include.
$md$,
  9, 'curado'
from lessons l where l.slug = 'fr-errores'
on conflict do nothing;

-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'en', null,
  'When there is more than one right answer',
  'A sheet of test cases works when the answer can be compared. For text, you need a marker, and the marker needs testing too.',
$md$
A test with the right answer next to each case works perfectly when there is only one answer: the category was "visit" or it wasn't. But much of what an AI does is write, and a draft email has no single right answer. It has many acceptable ones and many bad ones.

For that you use **another AI as a marker**. The idea has two parts, and the second is the one almost everyone skips:

1. You don't ask the marker for a score: you ask it **yes-or-no questions**, one per criterion.
2. Before trusting it with anything, **you compare its marking with yours**, case by case, and count how often you agree.

## Why yes or no, and not 1 to 10

A 7 doesn't tell you what to fix. And if you run the same text twice, the same marker may give you a 6 and an 8. A yes-or-no question, on the other hand, can be counted: "31 of 200 drafts are missing a next step" is a figure you can work with. "The average is 7.2" isn't.

## The case, with numbers

Draft replies to enquiries from families. Three questions:

- Does it answer what the family asked?
- Does it include any fact that isn't in the school's information?
- Does it propose a concrete next step?

**Calibration.** You mark **30 drafts** against the three questions. The marker marks the same 30. You compare question by question:

- "Does it answer what they asked?": you agree on **28 of 30**, 93%. Usable.
- "Does it include a fact that isn't there?": you agree on **22 of 30**, 73%. Not usable.

Looking at the 8 disagreements shows the cause: **the marker didn't have the school's information.** It can't tell whether a fact is invented if it doesn't know the real one. You pass it along with the draft, run it again, and agreement goes to **27 of 30**, 90%.

Now it's ready. Marking by hand took you about 2 minutes a draft: the 30 took an hour. Marking 200 by hand would take more than six and a half hours. With the calibrated marker it takes minutes, and you can repeat it every time you change something.

## Where it doesn't apply

**If the same model writes and marks with the same instructions, it passes itself.** They share the same blind spots. The marker needs its own instructions, written to find faults, not to produce.

**It can't check what it can't see.** As in the case: if a question depends on a fact, the fact has to be in what it receives. Otherwise it guesses, very confidently.

**It gets recalibrated.** When the model changes or you change the questions, the earlier 90% no longer holds. It's 30 cases again, and you already have them marked.

**It doesn't replace reading.** It is for marking at volume what **you already know how to mark**. If you don't yet know what a good draft is, the marker will apply, very neatly, a standard that doesn't exist.

## Check you've got it

Which of these three questions would you give a marker as it stands? What would you do with the other two?

1. "Is the email good?"
2. "Does it mention the visit date the family asked for in their enquiry?"
3. "Score from 1 to 10 how warm the tone is."

:::Show the answer
**Number 2, as it stands.** It's yes or no, it can be checked against what the marker receives (the enquiry and the draft), and two different people would answer it the same way.

**Number 1 needs splitting.** "Good" is five different things mixed together. Write down what you look at when you decide an email is good and turn each one into its own question.

**Number 3 needs turning into yes or no**, describing "warm" as something observable: "Does it greet the family by name?", "Does it thank them for the enquiry before answering?". If you can't describe it as something visible, the marker won't manage either.
:::

## What to do this week

Take **one criterion you currently check by hand** and write it as a yes-or-no question. Mark 20 cases yourself. Have the marker mark the same 20. Count how many you agree on.

If it's fewer than 18, don't switch tools: the problem is almost always the question, or something the marker needed to see and didn't get.
$md$,
  9, 'curado'
from lessons l where l.slug = 'fr-juez'
on conflict do nothing;

-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'en', null,
  'Two weeks in parallel before you let go',
  'The jump from "I run it" to "it runs itself" doesn''t happen in one go. It happens in shadow, with the threshold decided in advance.',
$md$
Moving something from "I do it with AI" to "it runs every day on its own" is the jump that most changes what a person produces. It is also the one that most often goes wrong, nearly always for the same reason: it's let go all at once, without knowing how often it gets things wrong.

The safe way has a name: **running in shadow.** The scheduled task runs every day and leaves its result **next to yours**, without anyone using it. You keep doing the work as usual. At the end you compare. Only with that figure do you decide whether to let it go.

And one rule makes it work: **the figure that's good enough is written down before you start.** If you decide it after seeing the result, it will always look good enough.

## The case, with numbers

Every morning someone sorts the enquiries that came in the day before: general information, visit, admission, bursary. About 15 a day.

**Before starting**, one line: *"I'll let it go if it agrees with me 90% of the time or more and there's no more than one expensive error a week."*

Two weeks in shadow: 10 working days, **150 enquiries**. The system agrees on **138**, 92%. It passes the first figure.

But the 12 disagreements aren't worth the same:

- **9** are "general information" versus "visit". A cheap error: whoever handles it notices and re-sorts it in a second.
- **3** are bursary requests sorted as general information. An expensive error: they get answered days later, and they are exactly the families for whom it matters most.

Three expensive errors in two weeks is more than one a week: it fails the second figure. But the count also says how to fix it: **anything that mentions bursaries, fees or discounts goes to a person**, always. With that rule, those 150 cases would have left no expensive error at all, and the system keeps the rest of the work.

Without the two weeks, it would have been let go with a 92% that looked excellent.

## What anything that runs on its own needs

**It always leaves its result in the same place.** A spreadsheet, a folder, a document. Not wherever it happens to land.

**It records every run.** When it ran and how many things it processed. One line is enough.

**You find out if it didn't run.** This is the most treacherous failure: if there's nothing tomorrow, were there no enquiries or did it fall over? Anything that runs on its own must leave a trace even when it found nothing, so that silence means something.

## Where it doesn't apply

**Anything that goes outside is never fully let go.** An email to a family, a post, a payment: the system prepares, a person presses send. The parallel run tells you how far to trust the draft, not how to remove the person.

**With low volume, two weeks say nothing.** If three cases come in a week, two weeks give you six, and six out of six proves nothing. What you need is a number of cases, not of days: around a hundred.

**Urgent work isn't run in shadow.** While the parallel run lasts, you keep doing the work yourself. If you can't keep that up for two weeks, it isn't the moment.

## Check you've got it

Three situations after two weeks in parallel. Let it go, keep it in parallel, or change something first?

1. It agrees 96% of the time, and every error is a minor label nobody uses to decide anything.
2. It agrees 97% of the time, but the remaining 3% are emails to families with the wrong interview date.
3. It agrees 85% of the time, over 6 cases in total.

:::Show the answer
**1. Let it go.** It passes the figure and the errors are cheap. Staying in parallel is double work with no new information.

**2. Not like this.** The percentage is higher than in 1 and the situation is worse, because the error is expensive and goes outside. A person checks every email before it leaves, or at least every one that carries a date.

**3. Keep it in parallel.** With six cases, 85% means nothing: it's one error. You need more cases before deciding, either way.
:::

## What to do this week

Pick a task you do every day or every week. Before touching anything, write down **in one line** what figure is good enough to let it go and what counts as an expensive error.

Then set up the shadow run. That line, written beforehand, is what will protect you from your own enthusiasm in two weeks' time.
$md$,
  9, 'curado'
from lessons l where l.slug = 'fr-paralelo'
on conflict do nothing;

-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'en', null,
  'An alert you ignore is worse than none',
  'What decides whether something that watches for you is useful isn''t how much it finds. It''s how many of its alerts are worth it.',
$md$
The top step of work that runs on its own is the one that decides **whether it's worth disturbing you**. And there is a trap almost everyone falls into: measuring what it finds instead of what it tells you.

The idea is a single one: **if two out of every ten alerts are useful, within three weeks you stop looking at them.** And on the day the one that matters arrives, you don't see it. A system that alerts too much isn't a thorough system: it's a system that has trained you to ignore it.

So anything that alerts you is judged on **two figures**, and raising one lowers the other:

- **Of what it told you about, how much was worth it.**
- **Of what was worth it, how much it told you about.**

## The case, with numbers

Someone sets up a watcher that checks twelve sources every day: other schools' websites and the education ministry's announcements. It alerts on any change.

**First week: 25 alerts.** Three were worth it: one school changed its admission dates, another published new fees, and the ministry changed a requirement. The other 22 were a new banner, a swapped photo, a news item about an assembly. **3 out of 25 is 12%.** At that rate, nobody opens it after a month.

Three changes to the rule:

- Alert only on changes to **dates, fees and requirements**, not anywhere on the page.
- **One digest a day**, not one alert per change.
- Each alert says **why it's being sent** and what it would change for you.

**Third week: 4 alerts, 3 useful.** 75%.

The other figure is still missing. That week, the twelve sources are checked by hand once, to compare. There were **4 important changes** and the watcher flagged **3**: it missed one, a requirement that changed in an attached document it doesn't read. In other words: it alerts rarely and almost everything is useful, but one in four gets past it.

Is that all right? It depends on what missing that one costs, and that's the decision nobody makes for you. What is clear is that in the first week it found more and was worth less.

## Where it doesn't apply

**For rare and serious things, the other way round.** If what you're watching is an error in payment data or a duplicated enrolment before invoicing, you want too many alerts: a false one costs you a minute; a missed one, much more. "Few and good" is for the frequent and cheap.

**Don't mix the two in the same channel.** If the urgent arrives in the same place as the merely interesting, it ends up ignored along with it. Two channels: one that almost never goes off and is always looked at, and one you're free not to read.

**What doesn't make it to an alert isn't saved for later.** If you build a "digest of everything else", have it overwrite itself every week. If it piles up, you've built another inbox.

## Check you've got it

For each case, what do you care about more: that what it tells you is worth it, or that nothing gets past it?

1. A watcher for AI news, used to put together an internal round-up every fortnight.
2. A check that looks for duplicated rows in the admissions spreadsheet before it goes to invoicing.
3. A watcher for mentions of the school on social media.

:::Show the answer
**1. That it's worth it.** If a piece of news is missed, it turns up the next fortnight or it wasn't that important. If it alerts too much, the round-up stops getting done.

**2. That nothing gets past it.** A duplicated row that reaches invoicing is a family that pays twice. Ten false alerts are ten minutes.

**3. Both, kept apart.** Mentions in general: few and good. Complaints: none missed. Two rules and two channels, not one compromise rule that does both badly.
:::

## What to do this week

If you already have something that alerts you (email alerts, notifications from a tool, a watcher of your own), count for one week **how many alerts arrived and how many made you do something**.

If it's fewer than half, don't add another alert: change the rule on the one you have.
$md$,
  9, 'curado'
from lessons l where l.slug = 'fr-avisos'
on conflict do nothing;
