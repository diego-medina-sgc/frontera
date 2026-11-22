-- ============================================================
-- Frontera - Atomic Habits (James Clear): English adaptation
-- ============================================================
-- Same four pieces as the Spanish edition, lang = 'en'.
-- Own synthesis, no text from the book.
-- ============================================================

insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'en', 'fresco', 1, 'What to read it against, and an uncomfortable exercise',
$md$
If it's fresh in your mind, there's no need to go over it again. What's missing is testing it against its limits and applying it to your own work.

## Connecting it to Grove

Clear is individual; Andy Grove, in *High Output Management*, is organisational. Where Clear says "design your environment", Grove would say that if your team depends on each person's willpower, the problem is the work system, not the people.

For anyone who coordinates people, the useful version of Clear isn't applying it to yourself: it's **designing the team's environment** so that the right thing is the easy thing. The four rules stop being a personal technique and become a criterion for designing processes. Clear doesn't write that; you do.

A hypothetical case: the team forgets to record the source of each enquiry. You could ask for more care. Or you could (**easy**) ask for a single mandatory field with closed options on the form, and (**obvious**) make that field the first thing that appears. The people didn't change; the environment did.

## Retrieve: apply the rules to the team

Answer before opening the answer.

1. On your team, the weekly report goes out late because everyone gathers the data by hand from three places. Which of the four rules are you ignoring, and what would you change?
2. You want no enquiry to go unanswered for more than a day, and your team says they "remember when there's time". What changes: asking for more commitment, or changing the system? Why?
3. A colleague proposes measuring how many times a week each person opens the enquiries inbox, to "reward consistency". What could go wrong, according to the critique of the book?

:::Show the answer
**1. Easy.** Gathering data by hand from three places is pure friction. Reducing it to one place, or automating the consolidation, is worth more than reminding them of the deadline.

**2. Change the system.** If it depends on "when there's time", it depends on willpower, which is exactly what fails. You fix it with a fixed trigger (a daily time slot, a visible to-do list) and with tasks that take few steps.

**3. Rewarding consistency instead of results.** You'd be measuring how many times the inbox is opened, not whether families were helped. That's the book's blind spot: it optimises for consistency without asking whether what's consistent is worth doing. The team learns to open the inbox, not to resolve anything.
:::

## Against the book itself

The book optimises for consistency and almost never asks whether the thing is worth doing. A flawless system that sustains something useless is worse than having no system, because on top of that it gives you the feeling of progress. And much of what gets cited as habit science is heuristic: it's useful, but it's best not to present it as proven fact in front of someone who knows the field.

## The exercise

Pick **one habit you currently sustain successfully** and answer two questions:

**One:** which of the four rules really keeps it going? Almost always it's just one, and almost never the one you thought.

**Two**, the uncomfortable one: **is it still worth doing?** Don't ask whether you do it well; ask what would happen if you dropped it for three months. If the honest answer is "nothing", you've found a perfect system sustaining something that no longer serves you.

## What to do this week

Pick **one** team process that currently depends on someone remembering. Change just one thing so that the right thing is the easiest (a fixed trigger, one step fewer) and note whether the process was followed better or not. One week is enough to know whether that was the bottleneck.
$md$, 8
from books b where b.slug = 'atomic-habits' on conflict do nothing;

insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'en', 'hace_tiempo', 1, 'What you''ve forgotten',
$md$
You read it a while ago, so we start by rebuilding before looking. Answer each one **from memory**, even if you only get part of it. If you only get part of it, that's the data point.

## Rebuild before you look

1. What were the four rules for building a habit, and the four inverse ones for breaking one?
2. Clear proposes an order among identity, habit and outcome. What is it, and why does it go against intuition?
3. Some people give up after a few weeks because they don't see results. How does the book explain that?
4. What rule does it propose for when you miss a day?
5. What is "stacking" habits?

:::Show the answer
**1.** Obvious, attractive, easy and satisfying. The inverses: invisible, unattractive, difficult and unsatisfying. Almost everyone remembers this.

**2.** First you decide what kind of person you want to be, and then you ask what that person would do today. The habit is a consequence. Intuition says the opposite: "I do this until I achieve something, and then I'm someone like that".

**3.** With the idea of the plateau of latent potential: effort pays off much later, so there's a long stretch where you do everything right and nothing happens. Anyone who doesn't know that stretch exists reads it as failure and quits just before it ends.

**4.** Never miss twice in a row. One day breaks nothing; two in a row start a new habit.

**5.** Tying a new habit to one you already do without fail: after X, I do Y. The trigger stops being your memory.
:::

If you missed the ones on identity, the plateau and "twice", that's to be expected: they're the ones cited least and the ones that most set it apart from a productivity manual.

## What has aged

**The 1% maths.** Improving 1% a day until you're about 37 times better is a correct calculation (1.01 to the power of 365 gives about 37.8) applied to an assumption that almost never holds: constant improvement with no ceiling. In practice there are plateaus and floors. It works as an image, not as a prediction.

**The evidence.** A good part of the book rests on anecdotes and on studies that, looked at closely, say less than the story that goes with them. The four rules are a practical framework, not a laboratory result.

**The structural side.** Everything is solved through personal design. If you coordinate a team, you know that sometimes the problem isn't habits but workload or process.

**What still stands:** two minutes, environment design, not missing twice, and the idea of the plateau. All four work without needing the 1%.

## What to do this week

Pick a habit that fell away and decide: did it fall away from lack of motivation, or did you skip it **twice in a row** during a complicated week and it never came back? If it was the second, you don't need more discipline. Choose when you'll pick it up again (day and time) and set yourself one goal: don't miss twice.
$md$, 7
from books b where b.slug = 'atomic-habits' on conflict do nothing;

insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'en', 'no_lei', 1, 'Systems instead of goals',
$md$
The idea that organises James Clear's book, said once: **a goal defines where you want to get to; a system defines what you do every day. And what you repeat every day is what decides the result.**

His argument is that winners and losers often have the same goal. Everyone who signs up for a marathon wants to finish it. What separates them is what each person kept up during the months beforehand.

A practical consequence follows: **if a problem keeps repeating, you probably don't lack motivation, you lack a system.** Setting yourself the same goal with more enthusiasm is just redoing what has already failed.

## A worked case (hypothetical)

Two people on the admissions team set the same goal: reply to every family that enquires within 24 hours. About 25 enquiries come in per week, so in a 12-week term that's 300.

**Ana** writes it down on Monday and repeats it to herself every morning. In quiet weeks she meets it; in event weeks, it slips. Suppose she meets it in 6 of the 12 weeks: about 150 enquiries on time.

**Beto** doesn't change the goal, he changes what he does. He decides that after his first coffee he opens the enquiries inbox, before anything else, and he prepares three template replies for the most common cases. Suppose he meets it in 11 of 12 weeks: about 275 on time.

Same goal, same level of motivation. The difference is 125 families who waited less, and it came from **a fixed trigger and a ready-made reply**, not from more commitment. The numbers are made up for the calculation; the mechanism is the book's.

## The least-cited part: identity

Clear adds that the habit that lasts is the one that becomes part of who you are. "I want to reply faster" is a goal. "I'm someone who doesn't leave a family waiting" is an identity, and every time you do it you add evidence in its favour. It's a reasonable hypothesis, not a law: it's useful as a way of thinking about habits, not as proof of anything.

## Where the idea doesn't apply

**It doesn't mean throwing goals away.** Without a goal, a system sustains consistency toward nowhere. The goal gives the direction; the system, the day-to-day.

**It doesn't work for what you don't control.** A year's enrolments depend on demographics, competition and families' finances. You can design a system for your own behaviours (contacting, following up, replying). You can't design one for the outcome.

**And it doesn't fix structural problems.** If the inbox receives 80 enquiries a week and there's one person, no trigger is enough.

## Check you understood

Answer each one before opening the answer.

1. Classify as **goal**, **system** or **identity**: (a) "Reach 300 enrolments"; (b) "Every Friday at 11 I review the families without a reply"; (c) "I'm someone who closes the loop".
2. Your team fails every month to deliver the leads report on time. Someone proposes "asking them for more commitment". What would you say to that, according to Clear?
3. You want to lower the response time. You can (a) set a 12-hour target or (b) define what gets done when the inbox is opened. Which do you do first, and why?

:::Show the answer
**1. (a) goal, (b) system, (c) identity.** The key is in the verb: (a) describes a result to reach, (b) describes a repeatable action with a day and time, (c) describes who you are.

**2.** That the problem repeats every month, and a problem that repeats points to the system, not to motivation. The useful question is which step of the process currently depends on someone remembering, and how to make it automatic (who prepares what, which day, with what trigger).

**3. (b) first.** A 12-hour target without a system to sustain it gets you the same result as Ana: you meet it when the week is good. The target is useful afterwards, to measure whether the system works.
:::

## What to do this week

Pick **one** outcome that frustrates you because it keeps repeating (a report that arrives late, a follow-up that gets dropped). Write in one line the exact action that would prevent it, with **day, time and trigger**: "after X, I do Y". Do it once this week. Just one; the rest comes later.
$md$, 8
from books b where b.slug = 'atomic-habits' on conflict do nothing;

insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'en', 'no_lei', 2, 'The four levers',
$md$
The idea, said once: **a habit is a chain of four steps (something triggers it, you feel like doing it, you do it, it gives you something back), and Clear turns that into four rules: make it obvious, attractive, easy and satisfying.** If a habit doesn't stick, one or more of those four is failing. To get rid of one, you invert them: invisible, unattractive, difficult, unsatisfying.

The value isn't in memorising the list. It's in using it as a **diagnosis**: when a habit falls away, ask which of the four is failing, instead of concluding "I have no discipline".

## A worked case (hypothetical)

You want to check the status of family enquiries every morning before starting on anything else. You've been trying for three weeks and you do it two days out of five. Diagnosis, rule by rule:

**Obvious.** What triggers it today? "In the morning" is vague. Clear proposes fixing when and where: "at 9, at my desk, with my coffee" and, better, **attaching it to something you already do without fail**: after pouring my coffee, I open the dashboard.

**Attractive.** If the dashboard annoys you, pair it with something you do like: the coffee or the music at your desk, only at that moment.

**Easy.** This is usually where the problem is. "Check everything" takes 30 minutes, and that's why it gets put off. Clear suggests the **two-minute rule**: shrink the habit until it takes two minutes, "open the dashboard and look at the first column". What matters at the start isn't depth but that the habit shows up.

**Satisfying.** The result takes time, so you manufacture an immediate reward: ticking off the day on a spreadsheet.

Two of the four were the bottleneck (a vague trigger and a task that was too big). You didn't need more willpower: you needed to fix those two.

## Where the idea doesn't apply

**It's not for complex work.** The rules work with simple, repeatable behaviours (checking, sending, noting down). They don't tell you how to write a good proposal or how to resolve a team conflict.

**Two minutes isn't the final habit.** It's the doorway. If you stay at two minutes forever, you keep the habit but not the result. The book says so, though it's rarely cited.

**The four don't weigh the same in every case.** There's almost always a dominant one; fixing all four at once is over-engineering.

## Check you understood

Answer before opening the answer. Which rule is failing in each case?

1. You want your team to log every lead in the CRM the same day. They know it has to be done, but logging takes 6 steps and almost nobody finishes it.
2. You want to write for 15 minutes a day about what you've learned. You always "remember" at 11 at night.
3. Every week you write the team summary and nobody notices or comments on it. After three weeks you drop it.

:::Show the answer
**1. Easy.** The team already knows and wants to; what fails is the friction of 6 steps. The way out is to cut steps (a minimal form with three fields) rather than insisting on how important it is.

**2. Obvious.** It's not a lack of motivation, it's a lack of a trigger tied to a real moment. The way out is to attach it to something you already do every day ("after I shut down my work computer, I write").

**3. Satisfying.** The effort is immediate and the reward never appears. One way out is to create the signal: ask for a comment in a specific meeting, or add something that gives you an immediate return.
:::

## What to do this week

Pick a habit that keeps falling away. Write the four rules in one line each and mark which one is failing (it's almost never all four). Fix **only that one** with a concrete change: a trigger tied to something you already do, or a two-minute version. Try it for five days.
$md$, 8
from books b where b.slug = 'atomic-habits' on conflict do nothing;

insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'en', 'no_lei', 3, 'What has aged badly, and how not to use it',
$md$
The idea, said once: **Atomic Habits is a good toolbox and a poor theory.** The tools (two minutes, designing your environment, a clear trigger) work as heuristics. What's asked of it beyond that, that it be established science or that everything can be solved with better personal design, doesn't hold up.

Three reservations, each with an example.

## 1. The 1% maths: the calculation, and its limit

The book shows that improving 1% a day for a year leaves you about 37 times better. The calculation, done properly: 1.01 to the power of 365 gives approximately **37.8**. And the inverse: 0.99 to the power of 365 gives approximately **0.026**, that is, getting 1% worse each day leaves you at 2.6% of where you started.

The arithmetic is correct. **The problem is the assumption**: that the improvement is constant, that it compounds on itself and that there's no ceiling. Try it with a hypothetical case: your response time to an enquiry is 60 minutes and you improve 1% a day. At 90 days you'd be at about 24 minutes, but at 365 days at about 1.5. Nobody replies to a family's enquiry in under two minutes with quality; there's a floor. In almost everything that matters there are plateaus, setbacks and ceilings.

So: as an image of how small things add up, it works. As a model that predicts how much you'll improve, it doesn't.

## 2. The evidence is uneven

A good part of the book leans on well-told anecdotes and on research that, read closely, says less than the story that goes with it. This doesn't invalidate the four rules: they're a reasonable practical framework. But they aren't a laboratory result, and it's best not to cite them as one in front of people who know the subject.

## 3. It's an individual book

Every problem is solved with better personal design. There's almost no room for the case where the cause isn't yours: the workload, a deadline you don't control, a chain of people who depend on you. For someone who coordinates a team that's a big limitation: an individual habit doesn't fix a broken process.

## Where these critiques don't apply

**They don't rule out the tools.** Two minutes and environment design still work because they reduce the willpower needed, and willpower is what runs out. They don't need the 1% or a study to hold up.

**They don't say habits don't matter.** They say habits aren't magic or a proven theory.

## Check you understood

Answer before opening the answer.

1. A colleague says: "If you improve 1% a day, in a year you're 37 times better, it's proven". What part is true and what part isn't?
2. Your team of three can't keep up with everything and someone suggests "using habits better". When is that a good answer and when is it dodging the problem?
3. A habit system has had you review a report every day for a year. What question is the one the book doesn't ask you?

:::Show the answer
**1.** The calculation is true: 1.01 to the power of 365 gives about 37.8. What isn't true is that it describes how anything real improves: it assumes constant improvement with no ceiling, and "proven" confuses a calculation with a finding. An honest reply: "it's a nice metaphor for what accumulates, not a prediction".

**2.** It's a good answer if the problem is individual execution (things get forgotten, a trigger is missing). It's dodging if the problem is workload: three people doing the work of five isn't fixed with consistency. First you have to ask whose cause it is.

**3.** Whether it's **worth it**. Consistency isn't value. A perfect system can sustain something useless, and on top of that gives you the feeling of progress. Before improving how you sustain it, it's worth asking what would happen if you dropped it for three months.
:::

## What to do this week

Think of something you do every day or every week out of inertia. Ask yourself just one thing: **if I dropped it for three months, what would happen?** If the answer is "nothing", take it off your schedule and use that time for something that is worth it.
$md$, 8
from books b where b.slug = 'atomic-habits' on conflict do nothing;
