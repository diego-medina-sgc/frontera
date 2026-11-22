-- ============================================================
-- Frontera - Inspired (Marty Cagan): English pieces
-- ============================================================

insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'en', 'fresco', 1, 'Applied to what you''re building',
$md$
If it's fresh in your mind, going over it again won't add much. What adds something is applying it to your own work, which is exactly what people avoid.

## One: the four risks, on a real project

Write down the name of something you're building or about to build. Below it, one line per risk (value, usability, technical feasibility, business viability) with one word next to each: **evidence** or **assumption**.

Evidence means someone else saw it, tested it or said it, not that it seems true to you. Technical feasibility almost always has plenty of evidence, because it's what you've been doing, while value says assumption. If that's what you see, your next step isn't a feature.

Test whether you're applying it well. Someone says: "I showed my app to my team and they loved it, so the value is confirmed." Is that right?

:::Show the answer
Not yet. Your team liking it proves very little: they know you, they want to help you, and they probably don't have the problem with the intensity your real user has. A test of value measures what people do when you're not around, not what they say when you show them something. The question that does measure it is: **"What do you do today to solve this?"** If the answer is "nothing" or "I put up with it", the problem isn't big enough. If they already do something, however clumsy, there's value there.
:::

## Two: split your week

Look at the next seven days and mark each block as **discovery** or **delivery**. If it's all delivery, you're building on assumptions, however well you're building.

A case to decide: you have a free afternoon and an idea involving AI. You can (a) build the full version, or (b) put together a fake version and show it to three people. Which one teaches you more per hour?

:::Show the answer
(b), by a wide margin. With (a) you have more product, but also more to defend if it turns out it wasn't useful. With (b) the investment is small and the information is direct. The exception: if you already have evidence that the problem exists and that it's the same one those three people have, (a) is reasonable. But that evidence has to be data, not a hunch.
:::

## Three: your own pattern

The uncomfortable question: name one thing you built in the last three months that nobody used. This isn't to punish you. It's to find out **which of the four risks you didn't check**.

It's almost always the same one, across all of a given person's projects. Finding yours is worth more than the whole book.

## What to do this week

Schedule two twenty-minute conversations with people who have the problem you want to solve. Don't show them the solution. Ask them what they do today and what bothers them most about it. If you can't find two people with the problem, you already know something important.
$md$, 8 from books b where b.slug = 'inspired' on conflict do nothing;

insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'en', 'hace_tiempo', 1, 'What you''ve forgotten, and what has aged',
$md$
You read it years ago. Before looking at anything, try to reconstruct what's left. The effort of remembering is what makes it stick, so take a minute per question.

**First.** Write down the four product risks and which of them kills the most projects.

:::Show the answer
**Value, usability, technical feasibility and business viability.** The one that kills the most projects is value, which is also the one checked least: effort doesn't solve it, because you can build something wonderful that nobody wants. If you got the list right but not the "which kills the most", that's the most common result: people remember the list and lose the judgement.
:::

**Second.** What distinguishes a product team from a feature factory?

:::Show the answer
The factory receives solutions to build. The product team receives a problem and an expected outcome, and decides how. The method doesn't change; who does the thinking does. And what almost everyone forgets: without real power to choose the solution, the book's techniques turn into theatre. You can run a tidy discovery and still build whatever came down from above.
:::

**Third.** What is done differently in discovery than in delivery, and why is mixing them a mistake?

:::Show the answer
Discovery is fast, cheap and disposable, because its aim is to learn. Delivery is slow and careful, because its aim is to hold up. Mixing them means building with delivery standards something you don't know is useful, which is the most expensive way to find out it wasn't.
:::

**Fourth.** Cagan is very hard on the role of the person who leads the product. What does he say it is not?

:::Show the answer
It isn't coordinating, or writing tickets, or translating between departments. He asks for knowing the users, the data, the business and the market better than anyone. If the job is coordinating, that's a project, not a product. For anyone who coordinates a team, this definition stings, which is why it's worth rereading.
:::

## What has aged

**Aged badly.** The book assumes organisations with dedicated design and engineering teams. For someone building alone or for a small department, a good part of that structure doesn't apply. It also dwells on the contrast between the big tech companies and "everyone else" more than it needs to.

**Aged well.** The four risks and the separation between discovering and delivering. They work the same for one person as for a large company.

**What the book didn't see coming.** When he wrote it, prototyping was expensive, so you had to choose carefully what to prototype. Today, with AI, building costs a fraction of that and the bottleneck has moved: it's no longer making, it's knowing what's worth making. Speed has become cheap, and judgement about what to build is the scarce resource. Without meaning to, the book has become more relevant.

## What to do this week

Pick one thing you've built, or asked to have built, in recent months that hasn't been used. Write down which of the four risks you hadn't checked. It's almost always the same one across a given person's projects, and knowing yours is worth more than rereading the book.
$md$, 8 from books b where b.slug = 'inspired' on conflict do nothing;

insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'en', 'no_lei', 1, 'Feature factories',
$md$
Cagan spent decades working on software products and wrote this book angry about one thing: **most teams don't do product, they execute requests.** Someone decides what to build, it comes down as a prioritised list, the team delivers it on time, and nothing happens: the metric doesn't move and the problem is still there.

He calls it a **feature factory**. His diagnosis: the problem isn't in the execution but in the brief. The team was given **a solution to build** instead of **a problem to solve**.

The practical difference is who does the thinking. In the factory the team is hands. In the model he proposes, the team receives a problem and an expected outcome, and decides how to get there. Cagan calls these empowered product teams.

## The worked case

An admissions team at a school (a hypothetical case, with invented numbers for the arithmetic). Management asks: "We need a family portal with chat." That's a solution.

**Factory version.** The portal gets built in a month. Before, out of every 200 families who started the online application, 120 finished. After the portal, 122 finish. Everything was delivered, the deadline was met, and the difference is noise.

**Product version.** The request arrives as a problem: "too many families start the application and don't finish it." Before building anything, the team talks to five families who dropped out. Four say the same thing: they reached the documents step, couldn't tell which document was which, and left it for later. Later never came.

The solution that comes out of that is a checklist with an example of each document and a reminder after three days. It's built in a week, not a month. If 150 out of 200 now finish, the result moved by 30 families, with less work and no chat.

The arithmetic isn't what matters, because it's invented. What matters is the sequence: **a measured problem, a conversation with the people living it, and only then a solution.** The factory skips the first two steps.

## Where the idea doesn't apply

**Sometimes the solution is given, and that's fine.** A legal obligation, a requirement from a regulator, a signed commitment. There's nothing to discover there: you execute, and doing it well is the job.

**Empowerment isn't handed out.** Cagan insists that a team can only decide the solution if it has capable people and knows the business. Giving an open problem to someone who still can't measure results isn't trust, it's abandonment.

**Not everything deserves a discovery.** Changing the text on a button or fixing a bug isn't a bet. Treating every small request as a research problem is just another way of not delivering.

## Test that you understood

First, classify each sentence as **solution** or **problem**:

1. "We need a metrics dashboard for the team."
2. "We don't know why attendance at open days is falling."
3. "We have to send a mass email to all the afternoon-shift families."

:::Show the answer
**1 and 3 are solutions. 2 is a problem.**

Number 1 says what to build (a dashboard) without saying which decision can't be made today. Behind it there could be ten different problems. Number 3 says what to do (an email), not what you want to achieve with it. Number 2 describes a situation and leaves open how to tackle it, which is exactly the sign of a good brief.
:::

Second: rewrite sentence 1 as a problem. It has to say what you can't do today because you don't have the dashboard.

:::Show the answer
Something like: "I find out too late that an enquiry went unanswered and the family is already angry." There, the dashboard is one of several ways out, and perhaps the worst: an alert or a routing rule could solve it with no dashboard at all. If your rewrite still names an object (dashboard, form, app), it's still a solution in different clothes.
:::

Third: you're asked for an AI app to organise school visits, and you already have the design in your head. What do you do first?

:::Show the answer
You ask what problem it solves and how you'll tell whether it worked. With AI you can build the app in an afternoon, and that is exactly why it's a trap: building is so cheap that it's tempting to skip the step of finding out whether people need it. Speed at building the wrong thing is not an advantage.
:::

## What to do this week

Pick a request you have in mind or on your list right now, one you made or received. Write it in one line as a problem, with the person who suffers it and how you'd notice it improving. If you can't, you still don't know what you're building.
$md$, 9 from books b where b.slug = 'inspired' on conflict do nothing;

insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'en', 'no_lei', 2, 'The four risks',
$md$
Before building anything, Cagan says there are **four different risks**, and that almost every project that fails addressed one and assumed the other three.

**Value.** Will anyone use it, enough to change what they do today?

**Usability.** Can it be understood without you standing next to it explaining? This isn't a question of looks.

**Technical feasibility.** Can it be built with what you have and in the time you have?

**Business viability.** Does it work for your organisation? Budget, rules, who maintains it, what happens to the data.

The key is that **each risk is checked with a different tool and at a different cost**, and value is the one checked least because effort doesn't solve it.

## The worked case

A person wants to build, with help from AI, an assistant that answers school families' enquiries on WhatsApp. Hypothetical case. The costs are reasonable estimates, not measurements.

**Value.** Do families want this, or would they rather talk to someone? You check it with three twenty-minute conversations with families who enquired this year. Cost: one hour. What you're looking for is what they do today when they have a question and whether waiting bothers them.

**Usability.** You simulate the assistant by hand: someone answers as if they were the bot while a test family watches. Cost: an afternoon. You see right away whether they ask things the assistant doesn't understand.

**Technical feasibility.** You try a prototype with three real questions. Cost: a weekend.

**Business viability.** You ask whoever is responsible whether the school allows an AI to answer families and what happens with data about minors. Cost: an email and a short meeting.

Now the order, which is what the arithmetic teaches: **the cheapest and most informative check is the value one**, one hour. The technical one, which is the most tempting, is the most expensive and kills the fewest projects. If families answered "I'd rather talk to a person", everything gets cancelled without a line having been written.

## Where the idea doesn't apply

**It isn't a list to fill in with the same intensity every time.** A small, reversible improvement doesn't need a formal check of all four. The effort of finding out has to be proportional to what you lose if you're wrong.

**Value first isn't a law.** If there's a hard business blocker, for example a rule that forbids what you want to do, that risk is also cheap to check and kills the project just the same. You check first whatever is cheapest and most likely to kill it.

**Two risks can end up mixed together.** If someone doesn't understand your tool, it can be a usability problem (it isn't clear) or a value problem (they don't need it). Cagan warns about exactly this: before fixing anything, you have to know which of the two it is.

## Test that you understood

Each case corresponds to one of the four risks. Decide which before opening the answer.

1. A team builds an app, three colleagues try it, and all of them get lost on the second screen.
2. You build a perfect form and nobody fills it in because they already handle that by phone.
3. Everything works, but internal policy doesn't allow storing that data outside the official system.

:::Show the answer
**1 is usability. 2 is value. 3 is business viability.**

In 1 the problem exists and the solution is reasonable, but it isn't clear on its own: you fix it with a prototype and people watching. In 2 there's nothing to fix in the product, because what fails is the assumption that anyone wants it. In 3 value, usability and technical feasibility were not enough: a rule stops it, and finding that out at the end is very expensive.
:::

Now put in order what you'd check first, with a single sentence of why: you want to build an app to help teachers, you've never talked to any of them, and you know your IT department is slow to approve things.

:::Show the answer
Value first, with two or three conversations. It's cheap and it's the one that rules out the most ideas. The IT risk is best started in parallel, because it's slow even if it isn't expensive: if you leave it for the end, the project stalls for months waiting. The technical side, which is the most tempting, goes last.
:::

## What to do this week

Pick something you're building or about to build and write one line per risk, with a single word next to it: **evidence** or **assumption**. If value says assumption, your next task isn't writing code: it's getting three conversations.
$md$, 9 from books b where b.slug = 'inspired' on conflict do nothing;

insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'en', 'no_lei', 3, 'Discovery and delivery are two crafts',
$md$
Cagan separates two jobs that tend to get confused: **discovering** and **delivering**. Discovering is finding out what's worth building. Delivering is building it well, so that it holds up.

The two call for opposite standards. Discovery is done fast, rough and cheap, with sketches and prototypes that get thrown away, because the aim is to learn, not to make it work. Delivery is slow, tidy and tested. The typical mistake is applying delivery standards to discovery: carefully building something you don't yet know is useful.

His practical rule: **prototypes before documents.** People can't give good opinions on descriptions, but they can on things they can touch.

## The worked case

An admissions department is thinking about a system that lets families book their own school visit. Hypothetical case, with estimated hours.

**The delivery path.** It's specified, developed and tested. Three weeks of work, something like 60 hours. Only at launch do they discover that families don't book on their own because they want to ask something before choosing a date. 60 hours were spent to find that out.

**The discovery path.** One afternoon (about 4 hours) to build a prototype people can touch, with an AI or simple tools, connected to nothing real. They show it to five families, one at a time, and watch them use it without explaining anything.

With five people the main pattern usually shows up. Suppose three hesitate at the step of choosing a date because they want to know how long the visit lasts. That gets fixed in the prototype in ten minutes and tested again the next day.

The arithmetic: 4 hours plus 2 for the sessions against 60 hours, and you get to launch knowing something that otherwise would have been discovered late. That's the job of discovery: **buying cheap certainty before paying for the expensive kind.**

## Where the idea doesn't apply

**A discovery prototype must not touch real data.** If the prototype connects to families' names or emails so that it "looks more real", it's no longer a disposable draft: it's a system with risk. You test with made-up data.

**Discovering isn't building fast.** Today's trap is that prototyping with AI costs an afternoon, so it's tempting to prototype directly the solution you already had in mind. If there's no question the prototype answers, and nobody tests it before deciding, it's delivery in disguise.

**If there's already evidence, there's no need to discover again.** When you know what the problem is, for whom, and that the solution is obvious, going on investigating is just another way of putting things off.

**What survives the prototype gets rebuilt.** Cagan is clear on this: what was learned moves on to delivery, the prototype doesn't. Turning a prototype into a product with a couple of touch-ups drags along every rushed decision.

## Test that you understood

Decide whether each situation is **discovery** or **delivery**, and why.

1. You build three fake screens of an app and show them to four colleagues to see where they get stuck.
2. You already know an automatic email reminder is needed, and you program it with tests, a review of edge cases and error handling.
3. You write a ten-page document describing how a tool will work that nobody has seen yet.

:::Show the answer
**1 is discovery, 2 is delivery, 3 is a dangerous hybrid.**

Number 1 is fast, disposable, and aims to learn where people get stuck. Number 2 is delivery done well: you already know what and why, and now what matters is that it doesn't fail. Number 3 applies the slowness of delivery (ten pages) to something that is still a hypothesis. Those ten pages can be replaced by a prototype and a conversation.
:::

A case to decide: you have an idea, you build a prototype in an afternoon with AI, and you love it. What comes next?

:::Show the answer
Show it to someone who has the problem, without explaining it, and watch. Your liking it doesn't count: you're the person least able to see its flaws. If five minutes pass and the other person doesn't understand what it's for or isn't interested, you've learned something more valuable than what the prototype cost.
:::

## What to do this week

Think of an idea you have. Before building anything, write down the exact question you want a prototype to answer and who you'll show it to. If you can't write the question, you're not discovering yet, you're building.
$md$, 9 from books b where b.slug = 'inspired' on conflict do nothing;
