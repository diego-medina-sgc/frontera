-- ============================================================
-- Frontera - Obviously Awesome (April Dunford) - English adaptation
-- ============================================================
-- Same pieces as the Spanish version, adapted to English.
-- for_read_state values are keys and are not translated.
-- ============================================================

insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'en', 'fresco', 1, 'The method where it hurts most',
$md$
If it's still fresh in your mind, going over it again won't pay off much. It pays off more to take it to the place where almost nobody uses it: **the internal proposal.**

Positioning is usually thought of as something aimed at customers, but the same mechanics apply when you present something inside an organization: to the Board, to senior leadership, to a committee. There too, people compare you against something, and if you don't choose what, they will.

## Apply it to your next proposal

With a real proposal in mind, run through the pieces of the method.

- **Real alternative.** If they don't approve this, what happens? It's almost never "they approve something else". It's almost always that they carry on as they are, which is free, carries no risk, and doesn't force anyone to defend anything. That is your competitor, and it's a tough one.
- **Category.** What will they read it as: an expense, an investment, an experiment, a reputational risk? The category defines what it gets compared with. The same project presented as a "technology expense" competes against other expenses; presented as "less operational load for a small team", it competes against the status quo, which is where you want to fight.
- **Who needs it badly.** In an organization, it isn't enough for it to be good for the institution. There has to be a specific person whose own pain it solves, who will push for it when you're not in the room.

## Recall before you go on

A hypothetical example: you propose a system to organize follow-up with interested families. Before opening the answer, work out:

1. What is the real alternative?
2. Two ways of naming the proposal: "a management tool" or "no interested family goes without a reply for more than 48 hours". Which one improves your position, and why?
3. Who could be the person who needs it badly?

:::Show the answer
**1. Carrying on with the current follow-up:** loose emails, spreadsheets, whatever the person answering happens to remember. It's free and it half works, which is exactly what makes change hard: there's no crisis forcing anyone's hand.

**2. The second one.** "Management tool" falls into the technology expense category and gets compared with other expenses. The second names an outcome anyone on the Board understands, and compares it with the cost of losing a family because nobody replied in time.

**3. Whoever answers the enquiries today** and makes do with what's available, or whoever is responsible for the enrolment numbers. That's someone with a concrete daily pain. If nobody like that turns up, the proposal has no one to defend it, and it's better to know that before you present.
:::

## Where it doesn't apply

- **It isn't manipulation.** Changing the category only works if it's honest: if the project doesn't reduce the team's load, saying so won't help, and it will show.
- **Not every proposal needs it.** A small, obvious decision doesn't call for this much firepower.

## What to do this week

Write your next proposal in three lines: **real alternative** (what happens if it isn't approved), **category** (how you want it to be read) and **who pushes for it**. If the third line stays empty, find that person before you put the document together.
$md$, 7
from books b where b.slug = 'obviously-awesome' on conflict do nothing;

insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'en', 'hace_tiempo', 1, 'What you''ve forgotten',
$md$
It's been a while since you read it. Before looking at anything, reconstruct it: cover the screen if you need to and answer out loud or in writing.

## Reconstruct first

1. What is the specific sign that the problem is positioning and not the message?
2. What are the five components, in the order they're built?
3. Why is narrowing the audience to the people who need it most usually the opposite of losing market?
4. What does the category of an offer say, besides its name?

:::Show the answer
**1.** They understand you perfectly and don't move. If they didn't understand you, the problem would be clarity. Understanding without caring points to the frame: what you're being compared with.

**2.** Real alternatives, unique attributes, the value of those attributes, who needs it so badly that they move fast, and category. The order matters because each step builds on the one before: choosing a category before you know who the value is for is guesswork.

**3.** Because a message for everyone isn't obvious to anyone, and what you're after is for it to be obvious to someone. The people who need it most adopt it fast, talk about it and act as a reference for everyone else.

**4.** It sets what you're compared with, how much you're expected to cost, which features are taken for granted and which are an extra. It's a set of expectations, not a label, which is why it's the most expensive decision and the one most often made without thinking.
:::

If you got number 1 wrong, go back over that one: it pays off the most, because it tells you when to work on the frame and when to leave everything alone.

## One more, on applying it

5. An admissions campaign is getting good reach but few enquiries, and the team proposes rewriting the copy. Given what you remembered, what would you look at first?

:::Show the answer
**You'd look at what the families who saw it are comparing it with.** If they understand the offer and don't enquire, rewriting the copy is fixing the symptom. Talk to a few families who saw the campaign and didn't write in, and ask them what alternative they had in mind. If the answer isn't the one you assumed, the work is on the frame, and no copy will fix that.
:::

## What has aged

The book is from 2019 and it shows in two ways, though the underlying logic hasn't changed.

- **The examples are from software.** Many come from product companies and read as if everything were sold with a demo. The method works just as well for an educational service, an internal proposal or a campaign, but you have to translate the case.
- **The real alternative has moved.** Today, one of the strongest alternatives for almost any product or service is "asking an AI". If you answer Dunford's question ("what would they use if mine didn't exist?") without including that option, your list is probably out of date.

What has **not** aged: the fact that they choose the comparison if you don't, and the fact that positioning needs to be revisited. The one you set two years ago may be the one holding back what you're doing today.

## What to do this week

Take the positioning of something you launched more than a year ago and answer the real alternatives question again, in writing, this time with AI as an option. If the list changes, what you're compared with has probably changed too, and the rest needs a second look.
$md$, 7
from books b where b.slug = 'obviously-awesome' on conflict do nothing;

insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'en', 'no_lei', 1, 'What you''re compared against decides everything',
$md$
Dunford starts from an observation that changes where you look when something isn't catching on: **nobody evaluates what you offer in the abstract. They evaluate it against something.** And you almost never choose that something.

She calls this positioning, and it's worth saying what it isn't: it isn't the slogan, the tone or the logo. It's the answer that comes before all of that: **what kind of thing is this, and who is it obviously better for than the alternatives?** The same offer, placed in a different comparison, goes from expensive to cheap or from unnecessary to urgent, with nothing changing on the inside.

## A worked case (hypothetical)

A school competing for families has an extended school day with afternoon workshops. On visits, admissions describes it as a "full-day school".

Look at which comparison that phrase triggers. Families put it next to the full-day schools they already know, and the yardstick becomes what those schools do best: tradition, buildings, historic results. There the school loses on almost everything and wins on nothing, because what makes it different is buried.

Now imagine a family where both parents work and at four in the afternoon there's nobody to pick the kids up. For them, the real alternative isn't another school: it's a nanny, a grandmother, or an outside workshop with transport. Against that alternative, the same school is a solution to a logistical problem that costs them money and worry every day. Same school, different comparison, different verdict.

Notice the order of the reasoning: not a single word of the brochure was changed. First you ask what it's really being compared with, and only then do you decide what to say.

The sign that the problem is the frame and not the wording is very specific: **people understand perfectly what you do and still don't move.** If they don't understand you, clarity is failing. If they understand you and don't care, the comparison is failing.

## Where the idea doesn't apply

- **It doesn't fix an offer that really is worse.** Repositioning shows what was already worth something; it doesn't invent value. If no group of people needs what you have more than what the alternatives offer, no frame will save it.
- **It's not an exercise you do alone by sitting and thinking.** The real comparisons are made by the people who choose, not by you. If your hypothesis about what you're compared with hasn't been tested with the people who choose, it's an opinion.
- **It doesn't replace the concrete.** A good frame without evidence for what you're saying (cases, results, families who will tell the story) turns into a slogan.

## Test your understanding

Three cases. Think of your answer before opening it.

1. A head teacher presents a teacher training project. The Board replies "interesting" and doesn't vote. Is it clarity or the frame that's failing?
2. At the same hypothetical school, two ways of putting it: "we offer art and sports workshops" or "we take care of the afternoon for working families". Which one changes the comparison and which one only describes?
3. A school finds out that the families leaving for another school are doing so because of price. Is lowering the price enough to stop the loss?

:::Show the answer
**1. The frame is failing.** "Interesting" means they understood it and don't care enough. If they hadn't understood, they would be asking questions. What's missing is knowing what they're comparing it with (probably with doing nothing, which is free) and what concrete pain of someone's it solves.

**2. The second one changes the comparison.** The first is a list of attributes and gets compared with any other school that has workshops. The second names a problem and a person, and gets compared with the nanny or the transport. Describing and positioning are different things.

**3. Not necessarily.** Leaving "because of price" is what they say, but price is a yardstick that shows up when no other reason to stay is visible. It often signals that they're being compared with a similar, cheaper school, which means a frame problem. Lowering the price without examining that gives away margin and keeps the wrong comparison in place.
:::

## What to do this week

Pick one thing of yours that people understand and don't care about: a proposal, a campaign, a service. Write in one line **what it's compared with today** and ask two people who have seen it what they compared it with. If the three answers don't match, you've already found the problem.
$md$, 9
from books b where b.slug = 'obviously-awesome' on conflict do nothing;

insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'en', 'no_lei', 2, 'The pieces, and the question that orders them',
$md$
Dunford organizes positioning into five components, and the order is the part people overlook. It's built from the bottom up: each piece rests on the one before.

1. **Real alternatives:** what people would do if yours didn't exist.
2. **Unique attributes:** what you have that those alternatives don't.
3. **Value:** what someone achieves thanks to those attributes that they couldn't before.
4. **Who needs it so badly that they move fast:** not who *could* use it.
5. **Category:** the mental group you put it in, which sets what you're compared with and what's expected of you.

The question that orders everything is the first one, and almost nobody answers it well: **what would this person use if mine didn't exist?** The answer is almost never a named competitor. It's usually a spreadsheet, an email, a favour from a colleague, or putting up with it.

## A worked case (hypothetical)

A school wants to position its support service for families who arrive from another city in the middle of the year. Let's build it in order.

**Alternatives:** not other schools with the same service, because almost none of them have one. It's what those families do today: ask in a parents' WhatsApp group, consult acquaintances, sort out the school move on their own.

**Unique attributes:** a contact person assigned from enrolment, and a ready-made plan for the first weeks. It's verifiable: it either exists or it doesn't.

**Value:** the child arrives with a reference group and the family doesn't have to find anything out. Notice that "contact person" is an attribute; "we arrived without feeling lost" is value. A brochure that stops at the attribute reads like a spec sheet.

**Who needs it badly:** not every new family, but the one that arrives with no local network, with children who tend to find adapting difficult. It matters far more to them than to a family that lives four blocks away.

**Category:** if it's presented as an "extra service from the school", it's compared with an extra and not much is asked of it. If it's presented as part of how the school welcomes anyone who arrives, it enters a category where the school sets the standard.

Note that the order avoided a typical mistake: starting with the category and only then asking whether anyone needed it.

## Where the idea doesn't apply

- **Narrowing isn't hiding.** The fact that "who needs it badly" is a small group doesn't mean denying the service to everyone else; it means choosing who you talk to first.
- **The order isn't a rigid recipe.** Sometimes you find out who loves it (4) before you really know what the value is (3). Then you go back and forth. What isn't negotiable is that the five answers are consistent with one another.
- **It doesn't work without real people who already use it.** Attributes and value are discovered by looking at the people who already choose you with enthusiasm, not by imagining them.

## Test your understanding

1. For each line, decide whether it's an attribute or value: "we have our own science lab" / "children get to secondary school able to run an experiment from start to finish".
2. You ask families what they would do if the school didn't exist, and the most common answer is "find another one just as close to home". What does that tell you about the real alternative?
3. Your team proposes describing the new service to *all* families so as not to lose anyone. What would you say?

:::Show the answer
**1. The first is an attribute, the second is value.** The lab is something that exists; what changes in someone's life is what they achieve with it. You need both, but value is what holds up the comparison.

**2. The real alternative is proximity, not another educational project.** So the competition plays out in the neighbourhood and the commute, and a message about your pedagogical approach speaks to a question that family isn't asking yet.

**3. That a message for everyone isn't obvious to anyone.** Speaking to the people who need it badly doesn't cost you the other families; it makes the message sharp for those who are looking for it most. After that, the service is still available to everyone else.
:::

## What to do this week

Pick a service or programme of yours and answer only the first question, in writing: **what do people do today if this doesn't exist?** Don't think about what you'd like them to do; ask three people who use it or who turned it down. Leave the other four pieces until you have that answer.
$md$, 9
from books b where b.slug = 'obviously-awesome' on conflict do nothing;

insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'en', 'no_lei', 3, 'Tested on something of yours',
$md$
You've already seen the idea: positioning is deciding what you're compared with, and it's built from real alternatives, unique attributes, value, who needs it badly, and category. This piece is so the method sticks by trying it on a concrete object: **this very app, Frontera.**

## The worked case

**Real alternative.** What would you use if Frontera didn't exist? Not another learning app. You'd use what you already used: following accounts on social media, opening a newsletter when you have time, signing up for a course you don't finish, asking an AI when a question comes up. All of that is free and already installed.

**Unique attribute.** It knows what level you're at and what you've already seen, so it doesn't explain what you don't need, and it filters by real novelty and not by popularity.

**Value.** Stop wasting time on what doesn't add to what you know, and stop feeling that something important slipped past you. Attribute: "it knows your level". Value: "you don't miss what matters".

**Who needs it badly.** Not just anyone who uses AI. Someone who is past the curiosity stage, who builds things and feels the specific anxiety of falling behind. For someone at the most beginner level, something else is more useful first.

**Category.** If it's called a "course app", it gets compared with huge free platforms and loses. If it's called a "personalized newsletter", it gets compared with something that's free. The honest category is closer to **a radar with a tutor**, which doesn't exist as a category, and creating one is the most expensive option: you have to educate the market before you can sell.

It helps you see something Dunford points out: no category is free. Either you fit into one that already exists and inherit its comparisons, or you create one and take on the cost of explaining it.

## Where the idea doesn't apply

- **It's not a verdict.** The fact that "radar with a tutor" is the honest category doesn't prove it's the right choice; what it proves is that the other two do harm. Deciding which one to use depends on how much it costs to explain compared with how many people need it.
- **It's built with inside information.** For Frontera the real alternative is a reasonable assumption; for something of yours, it has to come from what the people who choose or reject you today actually do.
- **It doesn't solve execution.** Clear positioning for something that works badly only speeds up the moment people notice.

## Test your understanding

1. Classify as attribute or value: "it has a weekly summary" / "you don't have to read everything to stay up to date".
2. A colleague says: "let's position it as the best AI learning app". From the method's point of view, what's missing from that sentence?
3. To decide between "radar with a tutor" (a new category) and "personalized newsletter" (an existing one), what data would you need before choosing?

:::Show the answer
**1. Attribute and value, in that order.** The weekly summary is something it has; not having to read everything is what the person achieves. If the message says only the first, people have to guess what it's for.

**2. Almost everything.** "The best" doesn't say against what (which alternative), for whom (who needs it badly) or why (which attribute). It's an aspiration, not positioning, and anyone could say it.

**3. How many people already have the problem without knowing what it's called.** A new category only works if there are people who need it and haven't solved it. If many are already looking for it, naming it is cheap; if you have to explain the problem to them, it's expensive. You measure that by talking to them, not by thinking.
:::

## What to do this week

Run the same exercise on **something of yours** on a single sheet: real alternative, attribute, value, who needs it, category. Keep a separate column with a question: do I know this or am I assuming it? Everything that ends up as "assuming" is what you need to validate by talking to someone before touching a single piece of copy.
$md$, 8
from books b where b.slug = 'obviously-awesome' on conflict do nothing;
