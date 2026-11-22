-- ============================================================
-- Frontera - Thinking, Fast and Slow (Daniel Kahneman) - English
-- ============================================================
-- English adaptation of the five pieces. Same structure, same numbers.
-- ============================================================

insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'en', 'fresco', 1, 'Applied to deciding about AI',
$md$
If the book is fresh in your mind, the most useful thing isn't to review the biases. It's to apply them where you currently have the fewest defences: judging AI tools.

**What you see is all there is.** An AI answer arrives complete, fluent and with no sign of what it doesn't know. There are no visible gaps, so your System 1 judges it by how coherent it is. And coherence is the thing these systems produce best, whether or not they know the answer.

**Confirmation when you test.** When you try something you're excited about, you ask it the questions you expect it to get right. Then you conclude it's excellent. Five tests you picked yourself aren't a sample, they're a demonstration.

**Anchoring on the first result.** The first answer sets your idea of what's possible, and you judge the following ones against it, not against what you needed.

**Regression to the mean.** If a prompt went badly and you tweak it, the next answer is usually better even if the change did nothing, because the bad result was an extreme.

## What ties it all together

Kahneman spends the book showing that intuition is inconsistent and that simple procedures improve it. For AI, that procedure is a set of test cases: chosen **before** testing, with the expected answer written down before you see the result, counted rather than felt. It's exactly where this lesson meets the evals lesson in this app.

## Try applying it

Answer before opening.

**Case 1.** You try a new tool with five requests that came to mind on the spot. All five answers come out very well. You conclude it's better than the previous one. What went wrong in the reasoning, and what do you do?

:::Show the answer
**Three things went wrong at once.** You chose the requests after you already knew what it does well (confirmation). You judged by how convincing it sounded (what you see is all there is). And five is far too few to conclude anything.

What changes: write the cases before testing, include at least two hard ones that you know are hard, and write the expected answer before you see the output.
:::

**Case 2.** You have twenty test cases. Version A of your prompt handles 14 well and version B handles 16 well. Can you say B is better?

:::Show the answer
**Not yet.** It's 70% against 80%, but that's two cases out of twenty. A model can answer the same request differently on different runs, so a two-case difference can move on its own.

What you do: look at which cases those are and whether B broke any that A got right. Repeat the run and add more cases. If the advantage holds across more cases and more runs, then yes.
:::

**Case 3.** A prompt returned something weak, you changed two sentences, and the next answer came out very good. Did you fix it?

:::Show the answer
**You don't know.** A bad answer is an extreme, and what you'd expect after an extreme is something closer to the average, with or without your change.

To find out whether the change helps, run the old version and the new one on the same ten requests and compare how many come out right with each.
:::

## What to do this week

Pick a real task that repeats in your work, for example answering enquiries from families. Put together **ten cases** you have actually seen, with the answer you'd consider good written down before using AI. Run them through the tool you use today and count how many come out right.

It takes half an hour. If you've read the book and you don't measure what you do with AI, you haven't applied it yet.
$md$, 8 from books b where b.slug = 'thinking-fast-slow' on conflict do nothing;

insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'en', 'hace_tiempo', 1, 'Rebuild what you read, and see what has aged',
$md$
If you read it years ago, what's left is probably a general impression. Before I tell you what has changed, try to rebuild three things. Write your answer, even in two lines, and only then open it.

## Rebuild

**1.** Without looking: what does "what you see is all there is" mean, and what changes in how you run a meeting?

:::Show the answer
The mind builds the most coherent story it can from what it has and doesn't register what's missing. So the confidence you feel measures how well the story fits, not how much evidence you have.

In a meeting it changes what you ask: instead of evaluating the proposal being presented, ask what information isn't on the table and get someone to argue for the opposite option.
:::

**2.** Your average is 40 enquiries a week. One week it dropped to 22 and you changed the subject line of the email. The next week there were 33. Did the change work?

:::Show the answer
**You can't tell from that.** It's regression to the mean: an extreme week is usually followed by one closer to the average without anything having changed. The gap was 18 (from 22 up to 40) and 11 of it was recovered. A good part of that was expected anyway.

To find out whether it worked, compare against weeks where you changed nothing, or test the new subject line on only half the list.

This is the same error that makes people believe scolding someone who did badly "works": a bad day is usually followed by a better one with no help.
:::

**3.** You estimate 3 weeks for something. The last four similar things took 5, 7, 4 and 8. What deadline do you promise?

:::Show the answer
They add up to 24, and 24 divided by 4 is **6 weeks**. That's the outside view. If your deadline is rigid, promise what covers the worst case seen, which was 8.

If you got 3 or 4, that's the inside estimate: the one that feels reasonable and is almost always too short.
:::

If you got stuck on any of them, that's the one that faded, and it's worth looking at again.

## What has aged

**Two chapters didn't replicate.** Behavioural priming and ego depletion, which were among the most quoted parts of the book, didn't hold up when repeated with more people. Kahneman acknowledged this publicly in 2017. If you still tell the story of the experiment about walking more slowly, it's best to leave it out.

**The question "did it replicate?"** was learned from that crisis, and it's worth asking of any book from that era, this one included.

**What holds up:** anchoring, framing, loss aversion, the planning fallacy, regression to the mean and the outside view. Also the idea that simple rules often beat expert judgement in repetitive decisions, because the expert is inconsistent with themselves. Today that idea has a concrete use: a written criterion, applied the same way every time.

**What the book couldn't know:** that a large part of your work with AI would be judging fluent, confident answers. That is the ground where "what you see is all there is" shows up the most.

## What to do this week

Pick one thing you say with confidence that you learned years ago. Check whether it holds up. Not to throw it out, but to know which of the two groups it belongs to.
$md$, 7 from books b where b.slug = 'thinking-fast-slow' on conflict do nothing;

insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'en', 'no_lei', 1, 'Two ways of thinking',
$md$
Kahneman is a psychologist who won the Nobel Prize in Economics for showing that people don't decide the way economics assumed. The whole book revolves around one distinction, and it's worth having it precise from the start.

**Your mind has two modes of operating.** System 1 is fast and automatic: it recognises a face, completes a sentence, senses that something doesn't add up. System 2 is slow and deliberate: it multiplies, compares, checks. They aren't two parts of the brain, just a way of talking about two modes.

And here's the key that almost every summary leaves out: **System 1 always proposes an answer, and System 2, which is lazy, almost always approves it without checking.** The error usually isn't that the fast mode fails. It's that the slow mode doesn't find out it was supposed to step in.

The most quoted idea comes from the same mechanism. Kahneman shortens it to **what you see is all there is**: the mind builds the most coherent story it can from what's in front of it and doesn't register what's missing. That's why your confidence in a conclusion measures how well the story fits, not how much evidence there is.

## A case, with the arithmetic

An adapted version of a classic puzzle Kahneman uses. Hypothetical.

A bundle of advertising plus design costs 1,100 in total. The advertising costs 1,000 more than the design. How much does the design cost?

Almost everyone feels **100** before calculating anything. Test it: if the design cost 100, the advertising would cost 1,100 and the total would be 1,200. It doesn't work.

The correct calculation: design = 50, advertising = 1,050. They add up to 1,100, and the difference is 1,000. The design costs 50.

What matters isn't the puzzle. It's that the wrong answer arrived with a feeling of certainty, and checking it took ten seconds. No alarm went off.

## Where the idea doesn't apply

**It isn't "distrust your intuition".** Kahneman debated this with Gary Klein, who studies experts who decide fast, and they agreed on one condition: intuition is reliable when the environment is fairly regular and you get quick, clear feedback on whether you were right. An experienced chess player or firefighter meets that condition.

**System 2 isn't the good one either.** It can spend its time justifying what System 1 has already decided. And you can't use it for everything: your patience runs out. The skill is choosing the moments when you slow down.

## Check that you understood

Answer before opening each answer.

**Case 1.** For each situation, do you trust your intuition or slow down?
- Reading a three-line text from your own field and sensing that the tone is off.
- Predicting what percentage of the families who visited this month will enrol.
- Deciding whether a new AI tool "feels" better than the one you used before.

:::Show the answer
**Trust it, slow down, slow down.**

The text from your field: you've read thousands, the environment is regular and you've had constant feedback on what works. There, your intuition is an asset.

The enrolment prediction: the environment is very noisy and the feedback arrives months later, when you can no longer connect it to what you felt. There, intuition sounds just as sure and is worth much less. Slow down and look at the rates from other years.

The new tool: feeling that it's better measures how fluent it sounds, not how well it solves your work. It has to be tested with cases.
:::

**Case 2.** A colleague tells you enthusiastically that her social media campaign "worked" because lots of messages came in. What three things do you still need to see before believing it?

:::Show the answer
**What it's being compared with, what happened afterwards, and what else changed.**

How many messages came in during a normal period: without that baseline, "lots" means nothing. How many of those messages ended in something: an enquiry isn't an enrolment. And what else happened in those weeks: an event, a schedule change, a piece in a newspaper.

Notice that your colleague's story was already coherent without any of that. That's why "what you see is all there is" works.
:::

**Case 3.** A book and its bookmark cost 2,200 in total. The book costs 2,000 more than the bookmark. How much does the bookmark cost?

:::Show the answer
**100.** The book costs 2,100, and 2,100 plus 100 is 2,200, with a difference of 2,000.

If you got 200, that was the reflex: you subtracted 2,000 from 2,200 without checking the second condition. If you got 100 straight away, System 2 was awake, which is the goal.
:::

## What to do this week

Pick a decision you're about to make in the next few days, one that matters. Before deciding, write down a single question: **what am I not seeing?** And look for the answer actively, even if it's with just one person or one piece of data.

You don't need to change the decision. You need System 2 to find out it was its turn to step in.
$md$, 9 from books b where b.slug = 'thinking-fast-slow' on conflict do nothing;

insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'en', 'no_lei', 2, 'Four biases, each with an antidote',
$md$
The book catalogues dozens of biases. These four held up under later reviews and are the ones that weigh most in work like yours. They share something, and that is the idea of this piece:

**They are errors with a direction. They always go wrong the same way.** That's why the defence isn't "pay attention", which doesn't work, but a procedure you carry out before deciding.

**Anchoring.** The first number that appears contaminates the judgements that follow, even if it's arbitrary. Antidote: have everyone write down their own number before anyone says theirs.

**Framing.** The same fact stated in two ways produces different decisions. Antidote: look at both versions, or at the absolute number.

**Loss aversion.** Losing hurts more than gaining the same amount pleases, around twice as much depending on the situation. It explains why it's so hard to discontinue something that isn't performing. Antidote: ask yourself whether you'd start it today, from scratch, with what you know.

**The planning fallacy.** We underestimate how long something will take, even knowing it has always taken longer. Antidote: the **outside view**, which we look at next.

## A worked case

Hypothetical. Your team is going to prepare next year's admissions campaign. From the inside everyone says **4 weeks**: the brief is clear and the calendar is free.

Now the outside view. The last five similar campaigns took 6, 8, 9, 7 and 10 weeks. They add up to 40, and 40 divided by 5 is **8**. The range runs from 6 to 10.

The honest estimate is 8, with a range of 6 to 10. Saying 4 is believing that this time is the exception.

Notice what those five campaigns had in common: each one had a different unexpected problem. Each problem, taken separately, was unlikely. That there would be some problem was almost certain. From the inside you only see the problems you already know about, and the outside view includes all of them, even the ones you can't name.

## Where the ideas don't apply

**The outside view needs a similar reference class.** If the project is truly new, you don't have five precedents. And if whatever caused the delays no longer exists, for example a slow supplier you've replaced, adjust, but with evidence and not with optimism.

**Framing can't be avoided.** There's no neutral version of a fact. What you can do is not settle for just one.

**Sticking with what you've already done is sometimes right.** The question is whether you'd choose it today. If the answer is yes, continuing isn't a bias.

## Check that you understood

For each case, name the bias and decide what you'd do, before opening the answer.

**Case 1.** You ask for quotes for an institutional video. The first supplier says 80,000. The other two come in at 75,000 and 85,000. You conclude that "the market is at 80".

:::Show the answer
**Anchoring.** The 80,000 came first and organised everything else, including your own idea of what's normal. You also don't know whether the other two quoted without knowing what the first one asked for.

What changes: before asking for anything, write down your range. Send the same brief to everyone, without a figure, and ask for each quote separately. Then you compare against your number, not the first one that showed up.
:::

**Case 2.** You've already spent 3,000 preparing an event. Finishing it costs 2,000 more and you expect it to bring in 1,500 in enrolments. Do you continue?

:::Show the answer
**No, with those numbers.** The 3,000 is already gone either way: whether you continue or stop. What decides it is what comes next: putting in 2,000 to get 1,500 loses 500.

Stopping hurts because it closes the loss and makes it real. That's loss aversion at work. The useful question is: if I were starting from zero today with these numbers, would I do it? If your estimate of 1,500 is conservative, the calculation changes, but the 3,000 still doesn't come into it.
:::

**Case 3.** One report says: "85% of the families who visited us say they would recommend us". Another says: "15% of the families who visited us would not recommend us".

:::Show the answer
**It's the same fact with different framing.** The second one usually moves people to act more, because it puts the focus on what's being lost, and the first one reassures. The same person can decide differently depending on which one they read.

When you have to report something like this, show both versions or the absolute number: 85 out of every 100, 15 out of every 100.
:::

## What to do this week

Run a **premortem**, a technique from Gary Klein that Kahneman recommends. Pick something that starts in the next month. Gather the team for twenty minutes and say: *a year has passed and this failed. Each of you write down, in silence, why.*

It works because it gives permission to doubt without coming across as the pessimist, and because writing in silence means nobody anchors on what the first person said.
$md$, 9 from books b where b.slug = 'thinking-fast-slow' on conflict do nothing;

insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'en', 'no_lei', 3, 'The part of the book that fell apart',
$md$
This is the most important part of the synthesis and the one you won't find in the summaries that circulate.

**The idea:** a surprising result from a study with few people is weak evidence. Almost everything that fell apart in the book fell apart for that reason, and the book itself has a chapter explaining why small samples mislead.

In the decade after its publication, psychology went through a replication crisis: many famous experiments, repeated with more people and better methods, stopped giving what they had given. Two cases from this book are the best known. **Behavioural priming**, the idea that seeing certain words changes your immediate behaviour without you noticing. And **ego depletion**, the idea that willpower gets used up like a muscle.

Kahneman acknowledged publicly in 2017 that he had given too much credit to small studies and that readers shouldn't have believed him on that part. A Nobel laureate, saying that about his best-selling book.

## A case to see the mechanism

Hypothetical. You send two versions of an email, to twelve people each. A gets 5 replies and B gets 8. Put as a ratio, 8 against 5 is 60% more. It sounds like a clear win.

But look at the difference without percentages: **three people**. Whether three people reply or not can depend on the kind of day they had. With groups this small, a difference like that shows up easily by pure luck.

A simpler example: you flip a coin four times. Getting four heads happens one time in sixteen, which is nothing unusual. With forty flips, getting almost all heads almost never happens. The fewer people, the more extremes appear on their own, and those extremes are exactly the ones that look like news.

The right move is to repeat the test with another twelve people per group, or more, and see whether it holds.

## Where the idea doesn't apply

**Not replicating doesn't mean it's false.** It means there's no solid evidence in its favour. That's different, and it's worth putting it that way.

**It doesn't mean the whole book is in doubt.** What fell apart is a limited part. Anchoring, framing, loss aversion, the planning fallacy and the outside view held up.

**And the fact that something replicated doesn't guarantee it holds for your case.** What comes from other contexts has to be tested in yours.

## Check that you understood

For each claim, decide between **believing it**, **suspending judgement** or **treating it as a hypothesis to test**, before opening the answer.

**Case 1.** An article cites "science proves" that warm lighting in the waiting room makes families say yes 20% more often. It came from a study of 25 families. (The case is made up.)

:::Show the answer
**Suspend judgement.** Few people, a striking effect and a single study: it's exactly the profile of what later failed to replicate.

Three questions to ask of any result like this: how many people it involved, who repeated it, and how big the effect was. Without answers to all three, stay with "interesting, remains to be seen".
:::

**Case 2.** You're told that to estimate deadlines it's better to look at how long similar projects took and not trust the calculation from the inside.

:::Show the answer
**Believe it, and check it against your own data.** The planning fallacy has been shown across many projects and contexts, not in a single experiment. It also has something very good going for it: you hold the evidence yourself, in your last campaigns.

The thing to be careful about is choosing the reference class well, and not comparing with projects that aren't similar.
:::

**Case 3.** An AI vendor publishes its own study with 40 users showing that its tool saves 50% of the time.

:::Show the answer
**Treat it as a hypothesis for you to test.** Few people, it's measured by the one selling it, and you don't know which tasks or how they measured the time. It's not that it's a lie: it's that it isn't enough to decide on.

Try it with your own cases, in your real work, with a criterion you write before you start.
:::

## What to do this week

Pick an idea you repeat with conviction, that you learned from a book, a course or a talk. Write on a sheet of paper how many people were behind the study and who repeated it.

If you can't answer both questions, downgrade it: it's no longer a fact, it's a hypothesis. It's a cheap way of applying to yourself what Kahneman left us with his own fallen chapter.
$md$, 8 from books b where b.slug = 'thinking-fast-slow' on conflict do nothing;
