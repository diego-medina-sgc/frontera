-- ============================================================
-- Frontera - The Hard Thing About Hard Things (Ben Horowitz): English pieces
-- ============================================================
-- English adaptation of the pieces in the Spanish version.
-- Own synthesis, no text from the book.
-- ============================================================

insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'en', 'fresco', 1, 'All three together',
$md$
With this book, the library now has three leadership books that contradict each other in a useful way. If you read it recently, the question isn't what each one says but **which one to use, and when**.

First, rebuild from memory. In one line each, what is the leader's job according to Sinek, Grove and Horowitz?

:::Show the answer
**Sinek:** create the conditions of safety so people stop protecting themselves and perform. Protection, trust, absorbing the blow.

**Grove:** raise the output of the team. Leverage, measurement, high standards, supervision matched to each person's maturity.

**Horowitz:** when the framework breaks, tell the truth fast, decide even when it hurts, and carry the cost of doing it alone.
:::

## How they connect

They aren't incompatible: **they talk about different moments.** Grove describes operations when things are working. Sinek describes the condition that makes those operations possible, because without safety nobody says what they think and Grove's data arrives filtered. Horowitz describes what neither of the other two covers: what you do when the framework breaks.

And each one has a blind spot. Sinek doesn't know what to do with someone who isn't performing. Grove assumes people will speak frankly without explaining why they would. Horowitz generalises from his own survival and writes for a world that probably isn't yours.

## A case to apply (hypothetical)

Someone on your team has been underperforming for two months, and you have been putting off the conversation. Run it through all three, and decide before opening the answer which one tells you the most.

- **Grove:** what concrete data do I have? Is this a problem of ability or of motivation?
- **Sinek:** does this person feel they can tell me the truth about what's going on?
- **Horowitz:** is there something I already know and haven't said yet? What does it cost me to say it?

:::Show the answer
For this case, **Horowitz's is usually the one that unlocks things**, because the problem isn't information but postponement. But the order matters: Grove first, so you know what you're talking about with data and not an impression; then Sinek, to set up the conversation so the person can say what's going on; and last Horowitz, who forces you not to wait another week.

If all three point the same way, stop putting it off: you already know what to do. If they contradict each other (the data says performance is dropping but the person is going through a difficult personal moment), that's where the truly hard part shows up: there is no recipe, and the decision is yours.
:::

## Where the combination fails

Using all three as a checklist can become an elegant way to keep postponing: "I still need to run it through Sinek." **Frameworks organise your thinking; they don't replace the decision.** If you have run it through all three and still do nothing, the problem wasn't a lack of framework.

## What to do this week

Pick **one difficult situation you have open right now**, a real one, of the kind you keep putting off. Answer the three questions above in writing, in five lines, and set a day for the conversation. If the third question makes you uncomfortable, that's the sign you should start there.
$md$,
8 from books b where b.slug = 'the-hard-thing' on conflict do nothing;

insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'en', 'hace_tiempo', 1, 'What you''ve forgotten',
$md$
You read it years ago. Before I tell you anything, try to rebuild it. Without looking at the answer, write down or say out loud:

1. What does Horowitz say you should do with bad news, and what is the real damage of not doing it?
2. Why is the "no flaws" candidate a problem when hiring?
3. What is harder than firing, according to him?
4. Which part of leading does he say is the hardest and almost nobody quotes?

:::Show the answer
**1. Tell it fast and with the real reason.** The damage isn't done by the news but by the later discovery that you knew and didn't say. If you said you were "protecting them", remember that silence also breeds rumour.

**2. Because no flaws usually means no outstanding strengths.** The selection process naturally rewards the person with no visible faults, who is often the one who doesn't stand out. If you want someone sharp, you have to accept one weakness and decide beforehand which one you will tolerate.

**3. Demoting.** It is more common and harder: someone who grew with the organisation and ended up below the role. His approach is to say it to their face, explain the why without dressing it up, and protect the person's dignity in front of everyone else, who are watching how someone who gave years is treated.

**4. Loneliness.** The worst decisions are made alone, without being able to share the weight with the people who will receive them.
:::

If you missed two or more, that's not a problem: it's normal. What people retain from this book is peace and war, and the rest evaporates. It's worth doing a second round, from a different angle.

Think of a situation from the last six months in which you had to give bad news or make an uncomfortable decision about a person. Answer, before opening:

- How long did you take between knowing and saying it?
- What reason did you give, and was it the real one?
- Who were you able to talk to before deciding?

:::Show the answer
There is no right answer, but there is a pattern to look at. If you took more than a week, ask yourself whether you were waiting for more information or for more courage. If the reason you gave wasn't the real one, the other person has probably noticed. And if you had nobody to talk to, you're in the territory of loneliness the book describes: it's worth finding someone you trust outside your direct chain, not to decide for you, but to think out loud with.
:::

## What has aged

**Peace and war, as it is quoted.** Today it is used a lot to justify permanent urgency. The book frames it for existential threats, and common usage has stretched it to cover any busy week. It's worth rereading it with the one-thing test and the three-month test.

**The survival story.** This is a book written by someone who survived, telling what he did. We don't see the people who did the same and didn't survive. With the years that weighs more: take it as experience, not as evidence.

**His world.** Funding rounds, boards, acquisitions. If your organisation is an educational institution, those chapters were never for you.

**What hasn't aged.** The rule of telling things fast, the idea of hiring for strength, and the care taken when demoting. Those are the three things most worth remembering.

## What to do this week

Think about whether there is something your team doesn't know yet that you have known for more than two weeks. If there is, write down the reason you haven't said it, and decide whether it is "it's not confirmed" or "it makes me uncomfortable". If it's the second, tell them this week.
$md$,
8 from books b where b.slug = 'the-hard-thing' on conflict do nothing;

insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'en', 'no_lei', 1, 'There are no recipes for the hard things',
$md$
Horowitz ran a technology company that nearly went under, and wrote the book he wished he'd had at that moment. His starting point is a distinction:

**There are hard things, and there are truly hard things.** The first kind gets solved by knowing how to do them: setting goals, building a hiring process. The second kind can't be solved by knowing, because the problem isn't technical, it's emotional: laying off someone who did good work because the budget doesn't stretch, or telling your best person that the role has become too big for them.

His thesis is that for the second kind **there is no recipe**, and that the most common temptation is to wait until you have a tidy solution before speaking. He proposes the opposite: **tell the truth early, even if you don't have the way out yet.**

## A worked case (hypothetical)

Imagine your admissions team finds out, from you, that enrolments this year are below projection and a campaign expense has to be cut. You've known for three weeks. You have two paths.

**Path A: wait until you have the plan.** You say: "when I've worked it out, I'll tell you." What happens in those three weeks, without you seeing it: someone notices that two ad placements were cancelled, someone else connects it with a hallway comment, and by the time you speak a version is already going around that is worse than the real one. On top of that, they discover that **you knew earlier**. That is what Horowitz considers the real damage: not the news, but the discovery that you held it back.

**Path B: tell them the day you know.** You say: "enrolments are below projection, we're going to cut the campaign, I don't know which part yet, and I want you to help me decide." It's uncomfortable that day. But the people who best know which placement performs and which doesn't are in that room, and you need them for exactly that.

The three reasons he gives, stated precisely: people **have already noticed** that something is going on, so silence produces rumour, not calm; **the people who can help you** can't do it without knowing; and trust broken by concealment **takes a long time to come back**.

## Where the idea doesn't apply

**It isn't telling everything to everyone.** Some information isn't yours to share: a family's personal details, a leadership decision that hasn't been officially communicated, a negotiation in progress. Telling the truth doesn't require opening up what is confidential; it requires not pretending nothing is happening. "There's something I can't share yet, and I'll tell you when I can" is the truth.

**It isn't offloading your anxiety.** Sharing a problem with no direction, just to feel less alone with it, shifts the weight without helping to solve it. Early truth works when it comes with "this is what I know, this is what I don't know, this is what I need."

**And it isn't equally urgent every time.** A doubtful piece of information that may still change tomorrow isn't communicated the same way as a confirmed one. Waiting a day to confirm is different from waiting until you have the solution.

## Test your understanding

Three situations. For each one, decide **before** opening the answer whether to tell it now, wait, or not tell it.

1. You've known since yesterday that someone on your team will be moved to another area next month, and the decision is final.
2. A rumour, unconfirmed, has reached you that the system where contacts are logged is changing.
3. A family confided in you a serious financial problem, and the sales team is about to call them about an overdue fee.

:::Show the answer
**1: tell it now, to the person first.** The decision is final, so there is no uncertainty to protect, and every day that passes is another day on which others could find out before they do. It's exactly the late-discovery case: the worst thing that can happen to them is finding out that you knew.

**2: wait, but with a deadline.** It's still a rumour and it may disappear. Telling it as if it were fact creates an anxiety that may have been unnecessary. What you should do is confirm it quickly and not let the rumour ripen on its own: the criterion is "wait to confirm", not "wait until you have the solution".

**3: don't tell it, but do resolve it.** It's confidential and not yours to hand around. What you should do is stop the call with a general reason ("let's pause this account, I'll explain what I can later") and not expose the detail. Being honest with the team doesn't mean betraying a family's trust.
:::

## What to do this week

On a sheet of paper, write **one thing you know and your team doesn't**. Next to it, write since when you've known it and why you haven't said it. If the reason is "it's not confirmed", set a date to confirm. If the reason is "I don't want them to worry", try saying it anyway this week, with what you know, what you don't, and what you need from them.
$md$,
9 from books b where b.slug = 'the-hard-thing' on conflict do nothing;

insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'en', 'no_lei', 2, 'Peacetime and wartime',
$md$
The most quoted idea in the book, and the most misused. Horowitz says that leading in **peacetime** and in **wartime** are two different jobs, and that the mistake is applying one when the other is called for.

**In peacetime** you have an advantage to defend and room to make mistakes. The job is to expand opportunities, develop people, build processes, tolerate disagreement. Decisions are consulted on.

**In wartime** there is an existential threat, a single thing that, if it goes wrong, makes everything else irrelevant. The style changes: quick decisions, less consensus, little tolerance for anything that doesn't serve that one thing.

The idea matters because it describes two symmetrical failures. A wartime leader in peacetime **burns out their people with an invented urgency**. A peacetime leader in wartime **builds consensus while the ship sinks**.

## A worked case (hypothetical)

September, small school. Your boss tells you "we're at war over places." Build the test in three questions:

1. **Is there a single thing?** Closing the cycle with the minimum enrolment needed to open the groups. Yes, there is one figure that decides whether the year works.
2. **Is it true over the next three months?** Yes: enrolment closes in December.
3. **And does everything else lose importance if this goes wrong?** Partly. If the figure isn't reached, the website improvements, the stationery redesign and the new institutional event move to the back. That is what it means for the rest to "not matter": not that it's bad, but that it gets postponed.

Result: **yes, there is a war, and it's limited.** So the way of working changes for that period: a short weekly meeting with the figure in front of everyone, campaign decisions made the same day, anything that doesn't move the figure paused. And most important, something Horowitz doesn't say in these words but follows from the idea: **you announce when it starts and when it ends.** The team needs to know that on 15 December peace returns.

Now the opposite case. Someone declares "war" because a competitor launched a new campaign. Is there a single thing? No. An existential threat? Not that either: it's a market move that you answer calmly. That is peacetime, even if it feels uncomfortable, and treating it as war only wears the team down.

## Where the idea doesn't apply

**It isn't a licence to mistreat people.** Having a single priority doesn't allow shouting or humiliating; it allows deciding faster and arguing less.

**It doesn't translate directly from a startup.** In the book, war means dying as a company. In an institution with decades behind it and stable enrolment, there is almost never a risk of disappearing. What does exist are **limited periods with a critical goal**: the close of admissions, a reputation crisis, an audit. Use the idea for those periods, not to describe the whole year.

**And it isn't a permanent state.** A war that doesn't end stops being a war: it's an exhausting workplace under another name.

## Test your understanding

Three situations. Decide whether it's peace or war, and why, before opening the answer.

1. There is one week left before enrolment closes and you are ten families short of the minimum figure.
2. A neighbouring school has opened a bilingual programme and enquiries dropped a little this month.
3. A negative article about the school appeared in a local outlet and is being shared in family groups.

:::Show the answer
**1: war, limited.** There is one figure, one date and clear consequences. It makes sense to concentrate the team, decide quickly and postpone the rest, and to announce that the following Monday you go back to the normal pace.

**2: peace.** It's a signal to watch, not an existential threat. The response is to analyse calmly what the competitor offers and what you do differently. Treating it as war would make you react without understanding.

**3: short war, of a different kind.** It's a real threat to reputation and it moves in hours, not months. But note: it lasts days, not three months. The right move is to decide quickly who speaks, what is said and who approves it, and to return to normal as soon as it passes. It's the proof that war is measured by real urgency, not by the size of the fear.
:::

## What to do this week

Think about whether your team currently believes it is in peace or war, and whether that matches what you know. If there is a real war, write the **start date, end date and the single figure** in a three-line message. If there isn't one, look for the urgency you are sustaining that is really just habit, and lower it.
$md$,
9 from books b where b.slug = 'the-hard-thing' on conflict do nothing;

insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'en', 'no_lei', 3, 'What''s useful and what isn''t in this book',
$md$
This is the most uneven book in the library. Part of what it says holds anywhere and part doesn't leave Silicon Valley. The skill this piece teaches is **separating what travels from what doesn't**, with a criterion and not with intuition.

The criterion, which is mine and not the author's, is two questions for any piece of advice from a business book: **does it depend on a structure my organisation doesn't have?** (investors, a board, risk of bankruptcy, selling the company) and **does it depend on an extreme circumstance?** If the answer to either is yes, the advice needs translating or doesn't apply.

## A worked case: three pieces of advice, one filter

Let's take three ideas from the book and run them through the questions.

**1. Hire for strengths, not for the absence of weaknesses.** Horowitz argues that the candidate with no visible flaws is usually also the one who stands out at nothing, and that a team is built from people who are sharp at something. Does it depend on a structure I don't have? No. On an extreme circumstance? No. **It travels whole.** If you're about to bring someone into admissions, the question is what they do exceptionally well and which weakness you are willing to tolerate, defined in advance.

**2. People first, then product, then results.** This is his order of priorities, and his argument is that reversing it shows up quickly in the atmosphere and later in everything else. Someone else's structure: no. Extreme circumstance: no. **It travels whole**, with one clarification: it's an order of priority for when you have to choose, not a promise that you can always deliver all three.

**3. All the material about funding rounds, the board and selling the company.** A structure my school doesn't have: yes. **It doesn't travel.** It's entertaining, but there is nothing to apply.

There is a fourth category, the most interesting one: what **travels with translation**. That's the material about firing and demoting. It depends on a strong circumstance (a company in trouble), but the core works in an institution: do it quickly, give the real reason, don't dilute responsibility, and remember that the conversation is for the person leaving **and for everyone who stays and watches**. What doesn't travel is the scale: in a school there are no mass layoffs, there are individual decisions, and that makes them more personal, not less.

## Where this way of reading doesn't apply

**It isn't for dismissing what's uncomfortable.** "This doesn't apply to my institution" is the most comfortable excuse for not doing what scares you. Before discarding a piece of advice, ask yourself whether the reason is the structure or the discomfort.

**And there is a deeper criticism that no criterion filters out:** the book is the account of someone who survived, telling what he did. We don't see the people who did the same and didn't survive, so there is no way to know how much of what he describes worked because of the decision and how much because of luck. Read it as the experience of someone who was there, not as evidence that something works.

## Test your understanding

Classify each piece of advice as **travels whole**, **travels with translation** or **doesn't travel**, before opening the answer. These are typical ideas, summarised without text from the book.

1. Tell your team bad news quickly, with the real reason.
2. Have a plan for what to do if your main investor withdraws their capital.
3. When there is a single serious threat, concentrate the team and decide with less consensus.

:::Show the answer
**1: travels whole.** It depends on no structure or extreme circumstance. Silence breeds rumour and erodes trust in any organisation with people in it.

**2: doesn't travel.** It depends on an investor, which a school funded by enrolment and fees doesn't have in that sense. If your institution has a sponsoring body or a foundation, the translated version would be "what happens if the policy of whoever funds me changes", but that is another piece, not this one.

**3: travels with translation.** The core works, but the circumstance (an existential threat) almost never occurs in a stable institution. It has to be translated into limited periods with a critical goal, such as the close of admissions, and not applied to the whole year.
:::

## What to do this week

Take the next management book or article you are reading and note down **three pieces of advice**. Ask each one the two questions: does it depend on a structure I don't have? Does it depend on an extreme circumstance? Mark which one travels and which doesn't, and keep one to try this week.
$md$,
9 from books b where b.slug = 'the-hard-thing' on conflict do nothing;
