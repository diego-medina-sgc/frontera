-- ============================================================
-- Frontera - High Output Management (Andrew Grove): English pieces
-- ============================================================
-- Adaptation of the Spanish pieces. Same structure, same numbers.
-- ============================================================

insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'en', 'fresco', 1, 'Grove versus Sinek',
$md$
If Grove and Sinek are both fresh in your mind, the argument between them is more useful than either book on its own. They don't disagree on the facts. They disagree on where to put the weight.

**Sinek** (*Leaders Eat Last*) says a leader's job is to make people stop looking over their shoulders: protection, trust, absorbing the risk.

**Grove** says a leader's job is to raise the output of their people: leverage, measurement, high standards.

Before going on, a connection test. Without rereading, write down **what each one is missing** according to the other. Then open the answer.

:::Show the answer
**What Grove does to Sinek:** Sinek's book dodges the question of what you do about the person inside the circle of safety who isn't performing. Grove has an answer: you measure it, you pick a supervision style based on their maturity in that task, and if they still don't perform, that is information too. Without that piece, safety turns into a zone where nobody is accountable.

**What Sinek does to Grove:** Grove's model assumes people say what they think in the open discussion that comes before a decision. That **only happens if it is safe to say it**. Where contradicting the boss has a price, that discussion is theatre: everyone nods, and the disagreement shows up later, underground.
:::

## A situation to decide

Hypothetical. In a team meeting you propose changing the format of the open day. Nobody objects. A week later, three people tell you separately that they didn't agree. Which of the two books explains the problem, and what do you fix first?

:::Show the answer
**Sinek** explains it first: Grove's open discussion didn't work because it wasn't safe to speak in the meeting. Fixing it with more pressure ("you have to say what you think") makes it worse, because it punishes exactly what failed.

What you fix first is the condition: ask before you propose, explicitly ask someone to object, and thank the first real objection that comes in. Only once people are talking does **Grove** become useful again: a clear decision and everyone's support afterwards.

If you did it the other way round, starting with Grove's rule, you have the symptom of a team with high standards and no safety.
:::

## The synthesis

Safety so the discussion is real; high standards so that discussion is worth something. It's what Amy Edmondson describes with both axes high at the same time. Neither book is enough on its own.

## For this week

Think about your last team decision and ask yourself which of the two conditions failed, safety or high standards. Only one. And what you would do differently next time.
$md$, 8
from books b where b.slug = 'high-output-management' on conflict do nothing;

insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'en', 'fresco', 2, 'Applied to this week',
$md$
Three short exercises. They take half an hour and you repeat them once a quarter. Before you do them, a solved case so you can see what you're looking for.

## A solved hypothetical example

A team of four people. For each one, a task in progress, their maturity in that task, and how the person coordinating supervises it today:

- **Ana**, writing the communication to families: high maturity. Today it is always reviewed before it goes out.
- **Bruno**, putting together the first data report: low maturity. Today he was left alone "because he's senior".
- **Carla**, coordinating visits: medium maturity. Today the goal is agreed and it is reviewed at the end.
- **Dani**, following up on applicants: medium maturity. Today every case is reviewed.

Where are the mismatches? Think about it, then open the answer.

:::Show the answer
There are three. **Ana**: high maturity and high supervision, you're smothering her; move down to goal and result. **Bruno**: low maturity and almost no supervision, this is the costly mismatch, because he won't ask for help; sit down with him before he starts. **Dani**: medium maturity and case-by-case review is too much; move to reviewing at two or three agreed points. **Carla** is the only one who matches.

The rule: the worst mismatch isn't the one that over-supervises, it's the one that leaves alone someone who doesn't know yet. It gets hidden behind the word "senior".
:::

## Now yours

**One. The maturity table.** Write your team as a list. Next to each person, a concrete task in progress, their maturity in that task (high, medium or low) and how you supervise it today. Look for the mismatches, as in the example.

**Two. The missing pair.** Pick the most important indicator in your area. Does it have its quality pair next to it? If not, write it. If you can't think of one, that is the finding: you're measuring something that can be inflated without anyone noticing.

**Three. Next week's leverage.** Look at your next seven days and mark each block with **M** if it multiplies what others do, or **A** if it only produces something of your own. Not everything has to be M. But if there isn't a single M, it's the week of someone who does their team's work instead of leading it.

## The decision

Out of the three exercises, pick **one single thing** to change this week. Write down who with and when: Grove would say a decision without a date and without an owner isn't a decision.

And for a month from now, a retrieval question for yourself: without looking at anything, what changed, and what effect did it have on that person or that indicator?
$md$, 8
from books b where b.slug = 'high-output-management' on conflict do nothing;

insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'en', 'hace_tiempo', 1, 'What has faded',
$md$
Before you read anything: reconstruct. It's uncomfortable, and it's what makes things stick. Four questions about the book. Answer them from memory, even if only partly, and only then open each answer.

**1. Who builds the agenda of a one-on-one, and what do you do in that meeting?**

:::Show the answer
The agenda is built by **the person reporting to you**, not you. You listen and ask questions. If you drive it with your own topics, it's a status report in disguise, and a message would do for that. Grove wanted them long, around an hour, because the real problems don't show up in the first few minutes.
:::

**2. There's a heated discussion in the team and a decision is made. What is expected of the people who were against it?**

:::Show the answer
That they support it, fully. Grove's rule is open discussion beforehand, a clear decision, and support afterwards, even from those who lost. What breaks teams isn't arguing: it's continuing to argue after the decision, or staying quiet beforehand and complaining afterwards.
:::

**3. Your area produces something in four stages and one of them takes twice as long as the others. Where should the improvement effort go, and why?**

:::Show the answer
On that stage. Grove calls the slowest, least flexible one the **limiting step**: it sets the pace of the whole process. Improving any other stage doesn't speed up the result; it only piles up work waiting in front of the bottleneck. It is usually a person or an approval, and almost always it's yours.
:::

**4. Which two kinds of meeting did Grove defend, and what about the rest?**

:::Show the answer
**Process** meetings, regular and predictable, so that information and work keep flowing, and **mission** meetings, which exist to produce a decision. A meeting that is neither has no defined function, and for him it should go.
:::

## If any of them failed you

It isn't a reading problem: it's a sign that the idea never became yours. That's normal; remembering what you read years ago is hard for almost everyone. Pick the one that failed you most and look today for where it shows up in your week.

## For right now

Look at your last one-on-one and answer two things: who built the agenda? How many minutes did you talk? If the answers are "me" and "more than half", you have your first change ready.
$md$, 7
from books b where b.slug = 'high-output-management' on conflict do nothing;

insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'en', 'hace_tiempo', 2, 'What has aged and what hasn''t',
$md$
Reconstruct first. Without looking: the three strongest ideas in the book, each in one sentence. Then open the answer.

**What are they and what does each one say?**

:::Show the answer
**Leverage:** your output is your team's output, so each hour is worth what it multiplies in others, not what you produce yourself.

**Task-relevant maturity:** how involved you get depends on how mature that person is in that specific task, and it changes over time.

**Paired indicators:** measure output, and put one quantity indicator together with one quality indicator, because a single indicator gets inflated at the expense of what it doesn't measure.

If you got the first two and not the third, that's the most common result: it's the most technical one and the one that's repeated least in management talks.
:::

**Now another memory question: which part of the book would you say has aged worst?**

:::Show the answer
The part that assumes you supervise people you see all day. Grove writes in 1983, in a factory, and his follow-up model rests on physical presence and the corridor as an information channel. The performance review part also sounds like another era: harsh, and designed for organisations that imagine themselves as machines to be tuned.
:::

## What did hold up

Leverage, maturity by task and paired indicators don't depend on there being a factory or an office. They depend on how other people's work gets multiplied, and that hasn't changed. A good share of today's management repeats these ideas without citing them.

## What the book couldn't know

Two things that matter today and that he didn't write about: how you coordinate a team that doesn't share a schedule or an office, and what happens when part of the work is done by a tool and not by a person. There is no written answer from Grove; there is a framework that is enough to build one.

Try it: if your output is your team's output and your team now works with AI tools, **helping them use those tools well** is one of the highest-leverage activities you have. And maturity by task applies just the same: someone with high maturity in writing may have low maturity in reviewing what an AI writes. That's a different task.

## For right now

Pick one person on your team and one task where they use AI. What maturity do they have in *that* task, and how are you supporting them? If you don't know, that's this week's work.
$md$, 7
from books b where b.slug = 'high-output-management' on conflict do nothing;

insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'en', 'no_lei', 1, 'Your output isn''t what you do',
$md$
Grove was running Intel when he wrote this, and he opens with a definition that makes anyone who coordinates people uncomfortable:

**A manager's output is the output of their team, plus the output of the teams they influence.**

Read it literally, because the trap is in what it leaves out: nothing you do with your own hands counts as your output. It counts only if it changes what others produce. The document you wrote, the emails you answered, the meeting you sat through: in this scheme that isn't output, it's activity.

## The calculation that makes it useful

The idea sounds like an agenda slogan until you put numbers on it. Grove calls it **leverage**, and it's a division:

**Leverage = (how many people it affects × how many times they'll do it × how much better each time) ÷ your hours**

On a Tuesday you have two free hours. Two options.

**Option A: you answer the twelve queries that came in yourself.** Output: twelve queries answered, well. Tomorrow, when you're not there: zero. Leverage is one. One hour of yours, one hour of result.

**Option B: you sit down with the person who answers them and you build the criteria together.** What gets answered the same day, what gets escalated, what you ask before replying. Output today: zero queries. But that person answers twelve a day, five days a week. If the criteria save two back-and-forths per query, in a month that's two hundred and forty queries that go out better and four hundred and eighty back-and-forths that never happened.

Two hours against two hundred and forty queries. That's the division, and it's the whole idea.

The same calculation explains something less obvious: **leverage can be negative.** A decision that sits on your desk for three days isn't worth zero: it's worth less than zero. That's seven people working for three days with a certainty they don't have. The same number, with the sign flipped.

## Where the idea doesn't apply

This is where it gets misused most, so it's worth marking the edge.

**It doesn't mean delegating everything.** If you hand a task to someone who doesn't know how to do it yet, you haven't leveraged: you've abandoned them. The "how much better each time" multiplier goes negative. Grove has a whole answer for this, and it's exactly the next piece.

**Some things only you can do.** The conversation with the family that is about to leave, the decision that is yours by role. There, leverage is irrelevant: doing them yourself isn't a lack of judgement, it's the task.

**And some tasks don't repeat.** Teaching someone something that will happen only once costs more than it returns. The "how many times" multiplier is one and the calculation doesn't close.

## Test your understanding

Three things you could do on Monday. Rank them from highest to lowest leverage **before** opening the answer.

1. Answer the forty emails that piled up over the weekend.
2. Write down, once, in which cases a complaint gets escalated and in which it doesn't, and have the four people on the team use it.
3. Review, one by one, the emails the team wrote before they go out.

:::Show the answer
**2, 1, 3**, and the third is probably negative.

**2 is the highest by far.** One hour of yours × four people × every complaint that comes in × forever. It's the textbook case: turning a decision that today goes through you into a criterion that doesn't need to.

**1 is real output, but it dies with the hour.** Forty emails answered are forty emails. Next Monday there are forty more and the count starts again from zero.

**3 looks responsible and almost always subtracts.** If you review without handing back the criteria, the team learns to wait for you instead of learning to decide, and every email takes as long as it takes you to get to it. It only turns positive if, when reviewing, you explain what you would change and why, which is 2 disguised as 3.
:::

## What to do this week

Open last week's calendar and mark each block with one of two letters: **M** if what you did there multiplies what others will do, **A** if it was your own activity that ended when it ended.

The result doesn't have to be good. You just have to see it. For almost anyone who coordinates, the first count is uncomfortable, and it's the only data you need to start moving next week.
$md$, 9
from books b where b.slug = 'high-output-management' on conflict do nothing;

insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'en', 'no_lei', 2, 'The most used and least known idea',
$md$
The previous piece left a door open: delegating with no more than that can be abandoning. Grove has the answer, and he calls it **task-relevant maturity**.

The idea, said once: **how involved you need to be in a job doesn't depend on you or on the person in general. It depends on how mature that person is in that specific task.** And that maturity isn't only knowing how to do it: it also counts wanting to take charge and being able to set demanding but realistic goals. The higher the maturity, the less your involvement; the lower, the more.

This defuses the question we all ask badly, *am I a delegator or a controller?* It isn't a trait of yours. It's a decision you make again for each person, each task and each moment.

## A worked case

Hypothetical, but typical. Lucía has been on an admissions team for eight years and answers family queries better than anyone. This month, for the first time, she has to put together and run an open day.

- In **answering queries**, her maturity is high. With you it's enough to agree the goal ("no family waits more than a day") and look at the result.
- In **running an open day**, her maturity is low: she has never done it. It's a new task for a veteran.

The mistake almost everyone makes is reading Lucía as "the expert" and handing her the open day with an *I trust you*. She won't ask for help, because she isn't someone who asks. She'll improvise, something will go sideways on the day of the event, and you'll find out that same day.

What's right with low maturity is what Grove describes as the most directive: define the schedule together, tell her what you want to see built and by when, and review on fixed dates before the event. It isn't distrust. It's scaffolding, and it comes off gradually. By the second open day she's at medium maturity: you agree the what and the how, and review at two points. By the third, maybe high: only the goal.

Notice what happened: **the same person had three supervision styles in three months.** That isn't inconsistency on your part. It's the idea at work.

## Where the idea doesn't apply

- **It doesn't solve a problem of willingness.** If someone knows perfectly well how to do the task and doesn't do it, their maturity isn't low: you have another conversation pending, and supervising more closely doesn't replace it.
- **High isn't "disappearing completely".** It means not supervising the how. What you keep looking at is the result, with the indicators you'll see in the next piece. Letting go of the task without watching the output is abandonment again.
- **It isn't a judgement about the person.** Low maturity in a new task says nothing about their ability. If you communicate it as a label, you break what the idea was meant to protect.

## Test your understanding

Three hypothetical situations. For each one, decide the maturity level (low, medium, high) and how you would supervise, **before** opening the answer.

1. Martín has ten years of experience writing announcements. Today you ask him for one more.
2. Martín, the same one, moves on to writing a data report for the board for the first time.
3. Camila joined six months ago, has done applicant follow-up three times, and all three went well with a review from you at the end. Today she does the fourth.

:::Show the answer
**1. High, and goal only.** It's his territory. You agree on when and for whom, and you see it when it goes out. Reviewing it line by line is smothering.

**2. Low, even though it's the same Martín.** Experience with announcements doesn't transfer by itself to a data report for a different audience. Sit down with him beforehand, define what it must contain, agree a review of the draft halfway through. Treating him as an expert here is the most common trap, because "he's senior".

**3. Medium, heading to high.** She has the habit and three repetitions with results. She no longer needs you to tell her the how; it does help to look at an intermediate point or the result, and if it goes well again, next time you drop the review. People are promoted on evidence, not on time in the job.

What ties the three together: you looked at the task, not at the title or the seniority.
:::

## What to do this week

Write down each member of the team with **one concrete task in progress** (not their role). Next to it, their maturity in that task: high, medium or low. And next to that, how you are supervising it today.

Find one row where they don't match. With that one person, change the style this week and tell them why ("this is new for you, we'll look at it together twice" or "you already have this down, I'll see it in the result"). One row is enough.
$md$, 9
from books b where b.slug = 'high-output-management' on conflict do nothing;

insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'en', 'no_lei', 3, 'Measure what comes out, not what moves',
$md$
Grove comes from making chips, and he brings from there an obsession the rest of us lack: measuring. But not measuring just anything.

The idea, said once: **measure output, not activity, and always set indicators in pairs: one of quantity with one of quality next to it.** A single indicator can be inflated at the expense of what it doesn't measure. The pair prevents that, because if one goes up by lying, the other gives it away.

## A worked case

All the numbers are hypothetical, but the mechanics are real. An admissions team receives a hundred queries a week and decides to measure one thing only: **how many get answered the same day.** They start at sixty. They push hard and reach ninety-five. It looks like a success.

Now add the indicator that was missing: **how many queries are resolved with the first reply**, without the family having to ask again.

- **Before:** sixty answered the same day, eighty resolved on the first reply. Twenty queries generate an extra round. Total messages: a hundred plus twenty, one hundred and twenty.
- **After:** ninety-five answered the same day, but only fifty-five resolved on the first. Forty-five extra rounds. Total: a hundred plus forty-five, one hundred and forty-five.

To go fast, the team answered halfway. The speed indicator improved by thirty-five points and the real work **grew by twenty-five messages a week**, plus more annoyed families. Nobody cheated: they did exactly what they were measured on. The pair would have shown it in the first week.

## Leading indicators

Grove adds a useful distinction. A **lagging** indicator tells you what happened (this year's enrolments). A **leading** one warns you beforehand (the visits booked for next month). With only lagging ones, you find out when you can no longer move anything. For deciding, leading indicators are the useful ones; lagging ones are for confirming.

## Where the idea doesn't apply

- **More indicators isn't better.** One pair for each important thing, not a dashboard of twenty. If nobody remembers by heart what's being measured, it isn't being measured: it's being filed.
- **With small samples, numbers lie.** With three cases, a percentage is noise. A team of seven people isn't assessed with a percentage for each one. The indicator is for seeing the system, not for judging someone.
- **Not everything can be measured precisely, and that's fine.** Grove doesn't ask for exactness: he asks for some signal of output. Measuring an important thing badly is worth more than measuring an irrelevant thing well.

## Test your understanding

Three hypothetical cases. Answer before you open.

1. A communications area measures "posts per week". What quality indicator would you put next to it?
2. Classify as leading or lagging: (a) confirmed enrolments; (b) families who opened the invitation email; (c) withdrawals during the year.
3. A team measures "tickets closed per person" and wants to compare its seven members. What two problems do you see?

:::Show the answer
**1.** Something that measures whether what was published does its job, for example how many posts generate a concrete action (an enquiry, a booked visit) or how many had to be corrected or taken down. The reason: without that, the easiest way to raise the number is to publish more and worse.

**2.** (a) Lagging: it already happened, it confirms. (b) Leading: it anticipates visits and applications. (c) Lagging: you find out when the family has already gone. Rule of thumb: if the number can only change after the important thing has been decided, it's lagging.

**3.** First, the quality pair is missing: closing tickets fast is easy if they get closed badly or reopened. Second, comparing them as people with a small sample mixes performance with the difficulty of what each one was handed. The indicator is for seeing the team, not for ranking people.
:::

## What to do this week

Pick **one** thing in your area that you measure today by activity (emails sent, posts, meetings held). Write the pair in one line: which output quantity indicator and which quality indicator go with it. If you only come up with one, that is your finding. Try it with data from the last two weeks before you say it out loud.
$md$, 9
from books b where b.slug = 'high-output-management' on conflict do nothing;
