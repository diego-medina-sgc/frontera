-- Made to Stick: English adaptation of the book pieces (lang 'en').
-- Same structure as db/014_libro_inspired.sql. Idempotent via on conflict do nothing.

insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'en', 'fresco', 1, 'Against Dunford, and applied to your worst message', $md$
If it's fresh in your mind, the value is in crossing it with another book in this library: *Obviously Awesome*, by April Dunford. Both are about communicating, but they answer different questions.

**Heath answers "how do I say it so it sticks". Dunford answers "what will people compare me against".** The order matters: a flawlessly sticky message inside the wrong frame makes people remember, with great precision, something they don't care about.

The useful sequence is **Dunford first, Heath second**. First you choose what you want to be compared against; then you make it stick. Almost all of us do it the other way round: we polish the wording and never question the frame.

## Test whether you've connected them

Three situations. Decide before opening each answer.

1. Your school has a beautifully written message about "a personalised education". Families remember it, but when they compare, they choose another school with "more hours of English". Did the wording fail, or the frame?

:::Show the answer
**The frame**, most likely. If the message stuck (Heath worked) but families compare you against a different criterion, the problem isn't that they don't remember it: it's that they remember it **inside a category that doesn't favour you**.

Before rewriting, ask Dunford's question: what alternative does the family have in mind when they look at us? If they're comparing on "more hours of English", you either change that axis with concrete evidence, or you stop competing on it. Tweaking the sentence won't solve that.
:::

2. You have the following text: *"A different school for kids who think differently."* From the book's point of view it has three flaws. Which ones?

:::Show the answer
The three most visible: **it isn't concrete** (what does it do differently?), **it isn't credible** (there's nothing to check) and **it has no identifiable core** (different in what way, for whom?). On top of that, any school could say it, and that's the telltale sign of the curse: it was written by someone who already knows what it refers to.

Mind the order: fixing these three without having defined what you're being compared against would be polishing a sentence that perhaps shouldn't be there at all.
:::

3. A colleague proposes adding emotion to a figure: "Every year, more than a hundred families choose us" becomes the story of a single family. When is that a good idea, and when isn't it?

:::Show the answer
**Good idea** when the case is representative, is presented as a single case, and the figure stays available for anyone who wants to see it. The Heaths argue that an identifiable person moves people more than a quantity does, and that's a solid finding.

**Bad idea** if the case replaces the figure or is presented as the typical one, because you're using emotion to cover up what the number says.
:::

## The exercise

Pick **the message you've had to repeat most often** this year: the one you explained five times and five times they came back asking the same thing.

**One.** Write its core in a single line. If you end up with two, you haven't chosen yet.

**Two.** Mark what's abstract and replace **just one** thing with something concrete: a case, a number someone can picture. Just one, so you can see the effect in isolation.

**Three.** Look for the expectation you could break. If your message confirms what the other person already assumed, it has no way in.

**Four.** Tell it to someone who knows nothing about the subject and ask them to repeat it back to you **the next day**. What they give you back is your real message.

And an optional step with AI: paste only the new version into an assistant and ask it to tell you what it understood, with no context. It's a quick way to simulate a reader who doesn't know what you know, though it doesn't replace testing with a real person.
$md$, 9 from books b where b.slug = 'made-to-stick' on conflict do nothing;

insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'en', 'hace_tiempo', 1, 'What you''ve forgotten', $md$
Before looking at anything, try to reconstruct what you remember. Take a minute per question and answer it **out loud or in writing, before opening the answer**. What you can't produce is what's worth rereading.

## First, reconstruct

**1. The six traits of ideas that stick.** Can you name them and say what job each one does?

:::Show the answer
The six, as the Heaths present them: **simple** (a single core), **unexpected** (it breaks an expectation and opens a curiosity gap), **concrete** (you can picture it), **credible** (the other person can check it), **emotional** (someone cares) and **stories** (they give people something to rehearse mentally).

If you only remembered the names, you kept the list without the engine. The engine is that each trait compensates for a different way in which the other person can't reconstruct what you already know.
:::

**2. Simple is not the same as short, and concrete is not the same as simple. What distinguishes each pair?**

:::Show the answer
**Simple, in the book, means having a core**: there's a centre, and everything else is subordinate to it. It may be short or not. **Concrete** is a different dimension: you can perceive it with the senses. A concept can be simple and abstract ("we improve quality") and not be remembered, or complex and concrete (a scene with several characters) and be remembered well.

Finding the core requires **sacrificing things that are true and important**. If discarding didn't hurt, you probably haven't found it.
:::

**3. According to the book, what is the cause underneath almost all bad communication?**

:::Show the answer
**The curse of knowledge**: once you know something, you can't reconstruct how it looks when you don't. The six traits are largely ways of compensating for it. The person tapping the rhythm hears the whole song, and the listener only gets taps.
:::

**4. One of the book's ideas is about how to get the other person interested. How do you open curiosity?**

:::Show the answer
By pointing to **a gap between what the other person knows and what they would now like to know**. Not with a new fact, but with a question they can't answer and that matters to them. Giving the conclusion first closes the gap and switches off the interest.
:::

## What has aged

Almost twenty years have passed since publication, and it's worth separating what has held up from what hasn't.

**What holds up:** the central idea. That concrete things are remembered better than abstract ones, and that people who know a lot underestimate the distance to people who don't, is consistent with almost everything we experience when communicating.

**The evidence base has aged.** The book studies ideas that survived, not the ones that were forgotten, and several experiments from that period were later revisited with more caution. The six traits work better as a practical tool than as a proven law.

**The context in which you apply it has changed.** Today a draft appears in seconds, and the text an AI tool proposes is likely to be the most average one possible: correct, orderly and abstract. That is, in automatic form, what the book describes as the problem. (That's my observation, not the book's: you can test it with your own drafts.) The antidote is still the one the book proposes and the machine can't give you on its own: **the core and the concrete scene come from what you know and what isn't in the draft.**

## What to do this week

Ask the AI to write any announcement for families. Mark the three most abstract sentences and replace them with something only you know about the school: a real scene, a number someone can picture. Note how much the text changed. That's the value you add.
$md$, 9 from books b where b.slug = 'made-to-stick' on conflict do nothing;

insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'en', 'no_lei', 1, 'The curse of knowledge', $md$
Chip and Dan Heath start from an idea that explains almost everything that follows in their book:

**When you know something, you can't reconstruct how it looks from the outside.** They call it the curse of knowledge. It isn't a lack of talent or of time to explain: it's that, once you've understood, you no longer have access to the version of you that didn't.

They illustrate it with a game: one person taps out the rhythm of a well-known song with their fingers and another has to guess it. The tapper hears the full melody in their head and expects it to be easy; the listener hears isolated taps. What matters isn't that the listener fails, but that **the tapper has no idea what the other person is missing**, because what's missing is exactly what the tapper has.

## The worked case

An invented example, but a recognisable one. An admissions piece says:

*"Our comprehensive educational approach develops people with critical thinking, strong values and academic excellence, in a bilingual and nurturing environment."*

For the person who wrote it, every word points to something they see every day. For a family visiting three schools a week, it's the same sentence they've already read at the other two. Nothing in it can be pictured, and what can't be pictured is neither remembered nor compared.

The move isn't to use simpler words. It's to **bring each abstraction down to a scene**. Ask yourself: *what does a kid do on any ordinary Tuesday that proves this is true?* And you write that:

*"In Year 10, the kids build a project, present it in English to people from outside the school and get questions nobody gave them in advance."*

(A hypothetical scene: replace it with the real one from your school.) The second version is longer, uses more concrete words and has no difficult word in it. A family can repeat it at dinner. The first, no.

## Where it doesn't apply

**When the other person shares your context.** Between two people on your team who live the subject, abstract language is a legitimate shorthand, and forcing an example is noise. The curse only bites where context isn't shared.

**When the concrete scene is an exception.** Choosing the most striking case and presenting it as the norm isn't making things concrete, it's deceiving with good aim. The scene has to be representative.

**When the message is operational.** "The meeting is on Thursday at 6 pm in the main hall" is already concrete. No story needed.

## Test that you've understood

Three cases. Work them out before opening the answer.

1. Classify which of these sentences suffer from the curse and which don't: (a) "We support each student throughout their journey"; (b) "If your child is absent three days in a row, we call you on the fourth"; (c) "We work with an innovative outlook".

:::Show the answer
**(a) and (c) suffer from the curse; (b) doesn't.**

(a) and (c) are sentences that the writer completes with everything they know, and that the reader can't complete with anything. Nobody could say what a school that "supports" does differently from one that doesn't. They're interchangeable between schools, and that's the telltale sign.

(b) can be pictured, can be verified and can be broken. Those three properties together are what make a sentence concrete: **a concrete sentence is one that could turn out to be false**.
:::

2. Rewrite this sentence for a family that has never set foot in the school: *"We foster our students' autonomy."* Write your version and then compare.

:::Show the answer
There's no single correct answer, but a good one follows this path: ask "what does an autonomous kid do that you can actually see?". For example: *"From Year 7, every kid keeps their own planner and is the one who tells the form tutor when something is still owed, before anyone asks."*

What to look for in your version: it has a subject who does something, it can be observed from the outside, and your school can actually deliver it in practice. If you ended up with "we promote", "we foster" or "we support" in there, you've gone back to abstract.
:::

3. You're going to write a message to a teacher who joins the team next week. Who finds it harder to write that message well: the person who's been at the school for ten years or the one who arrived three months ago? Why?

:::Show the answer
**The one with ten years.** Whoever arrived three months ago still remembers what they didn't understand, and that memory is exactly what helps them write. The ten-year veteran knows so much that the obvious feels like part of the air.

This gives a practical rule: when you have to explain something to a newcomer, the most junior person on the team is the best editor, not the most expert.
:::

## What to do this week

Take the next message to families you have to write. Before sending it, underline the two most abstract sentences and replace **one** with a scene that really happens at the school. Then show it to the newest person on the team and ask what the first thing was that they didn't understand.
$md$, 9 from books b where b.slug = 'made-to-stick' on conflict do nothing;

insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'en', 'no_lei', 2, 'The six things that make an idea stick', $md$
The Heaths studied what ideas that people remember and repeat have in common, and organised them into six traits. The useful reading isn't the list, but the function of each one:

**Simple** means it has a core: one thing that, if the other person takes away only that, was already worth it. **Unexpected** breaks an expectation to capture attention and leaves a curiosity gap to sustain it. **Concrete** can be pictured with the senses. **Credible** gives the other person something they can check, instead of asking them to trust you. **Emotional** makes it matter to a particular person, not to an average. **Stories** give the other person a situation to rehearse in their head.

The underlying idea: **they aren't six decorations, they're six ways of compensating for the fact that you can't go back to not knowing what you know.** And the most important one, the one almost nobody does, is the first: deciding the core before you write.

## The worked case

A hypothetical example. Families of the four-year-old class need to be invited to an information meeting. The original email:

*"Dear families: We invite you to take part in the information meeting, where we will address various aspects of the educational approach, institutional organisation, communication channels and news for the school year. We count on your presence."*

Diagnosis. There are four topics and none of them is the core. If you ask "what has to happen in the reader's head?", the honest answer is "that they come", and the email gives them no reason to. So you choose the core, and choosing means discarding: of the four topics, which one does a family of a four-year-old really care about? Let's say it's **what the first month of settling in looks like**.

New version:

*"Dear families: on Thursday at 6 pm we'll show you what your children's first month at school looks like, hour by hour, including what happens if they cry at the door. We'll do it with a teacher who lives it every year. The other topics we'll send in writing."*

Three traits were applied in a single move: **simple** (one single topic), **concrete** (hour by hour, crying at the door) and **unexpected** (nobody usually promises to talk about the uncomfortable part). The other three items were left out, and that isn't a loss: it's what made the invitation work.

## Where it doesn't apply

**You don't need all six.** The Heaths themselves say that two or three done well are enough. A message that tries all six at once comes out overloaded, and that's another way of losing the core.

**It isn't for strictly informational messages.** A payment date or a pick-up time call for clarity, not a hook. Making a due-date notice "sticky" is just noise.

**Memorable is not the same as convincing.** A message can stay lodged in people's minds and move no one, or move them in the wrong direction. Being remembered is a condition, not a result.

## Test that you've understood

1. Match each flaw with its missing trait. Pair each one with the trait that would fix it: (a) "We continuously improve our communication with families"; (b) "Our graduates perform excellently at university"; (c) an email with seven news items and none prioritised.

:::Show the answer
**(a) fails on concrete; (b) on credible; (c) on simple.**

(a) is an intention that can't be seen. It's fixed with something like "since March, any query to the administration office gets answered within one working day, or we let you know why not".

(b) is a claim that asks for faith. It's fixed by giving the reader something they can verify: what percentage, from which cohort, measured how, or a trail of graduates that anyone could check.

(c) has no core. It's fixed with a decision, not with wording: choose the news item that, if it were the only one the family took away, would already justify the email, and send the rest separately.
:::

2. Write the core, in a single line, of this notice: *"We hereby inform you that from the next school year the policy for making up classes missed through absence will be modified, with new criteria and deadlines."* Imagine that the only thing the family cares about is what will happen to their child if they're absent.

:::Show the answer
One possibility: ***"If your child is absent, you'll have three weeks to get them back up to speed, and the teacher will tell you how."***

(The concrete details, three weeks and who tells you, are an assumption of the example: use the real ones.) Notice that the line isn't a summary of the original notice, it's a **choice**: the original talked about "criteria and deadlines" and the line turned them into something that happens to one particular kid. That jump from policy to consequence is the central work.
:::

3. Two options for opening a presentation to a Board: (i) start with the conclusion ("we recommend expanding investment in recruitment"); (ii) start with a question the Board can't answer ("how many families who visited us in October enrolled at another school, and why?"). Which one opens more attention, and why?

:::Show the answer
**(ii), in general.** According to the Heaths, curiosity is born when you point to a gap between what someone knows and what they'd like to know. Putting the conclusion first closes the gap before opening it: the Board already knows where you're going and can tune out.

Condition: the gap has to be real and it has to matter to the people listening. A question the Board already knows the answer to, or doesn't care about, is just a trick.
:::

## What to do this week

Before writing the next important message, **write a single line with its core**, saying what has to stay in the reader's head if they take away nothing else. Then write the message. If you can't write the line, don't go on with the message: you don't yet know what you want to say.
$md$, 9 from books b where b.slug = 'made-to-stick' on conflict do nothing;

insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'en', 'no_lei', 3, 'Sticky is not the same as true', $md$
There's an idea that matters more than any of the book's others, and the Heaths show it without meaning to:

**The techniques for making something stick work just as well with a true idea as with a false one.** Among their best examples of sticky ideas are urban legends: concrete, unexpected, emotional, with a story, and false. Making something stick is a skill with no moral content of its own. Whether what sticks is true depends on whoever is communicating.

For someone who writes on behalf of an institution, that's a responsibility that comes with the job, not a footnote.

## The worked case

A hypothetical example. A school wants to show that its graduates do well at university. It has the story of a girl: the first in her family to study, she got into a very demanding degree, and today she works in what she dreamed of. The story is real, vivid and emotional, and it does exactly what the book recommends.

The version that fails:

*"This is what our graduates are like: Lucía arrived not knowing if she could, and today she is a [profession]. That's what we achieve every year."*

The last sentence is the problem. A true story, presented as the usual thing, claims without saying so something that doesn't hold up: that the typical case is Lucía. It works very well, because it's sticky, and that is exactly why it's the dangerous version.

The version that corrects it:

*"This is Lucía's story. It's one of the ones we're proudest of, not the most common. If you want to know how most of our graduates do, here is the data for the last five cohorts."*

It lost a bit of shine and gained what holds everything else up: **that the next time you tell people something, they'll believe you**. Credibility is spent only once, and it's spent fast.

## Where it doesn't apply

There are two exaggerated readings of this caveat.

**It doesn't mean doubting the whole book.** That the method has flaws doesn't make it false that concrete things are remembered better than abstract ones. On one hand, the book studies ideas that survived and looks for what they have in common, without looking at the many that had the same traits and were forgotten. That makes the six traits a good heuristic, not a proven law. On the other, some of the experiments it cites come from an era whose results psychology later revisited with more caution. Use them as guidance, not as a citation of hard science.

**It doesn't mean not telling individual cases.** An individual case, properly presented as individual, is honest and effective. The problem appears when the case is disguised as a trend.

## Test that you've understood

1. A school tells, with the family's permission, the real case of a student with many difficulties who turned their year around. The text ends: "This is what we do with every kid". What's wrong, and how do you fix it?

:::Show the answer
What's wrong isn't the case, it's the last sentence: it turns an exceptional result into a general promise, and families who read it will expect the same for their child.

The fix: replace the promise with a description of what the school really does, which is general: *"It doesn't always turn out like this. What we do for every kid is [concrete, verifiable action]"*. It can be delivered, and if it isn't, the family can see it.
:::

2. Decide: which of these two versions would pass an honest review? (a) "90% of families recommend the school", without saying how it was measured or how many responded. (b) "Of the 40 families who answered this year's survey, 36 said they would recommend us. Fewer than half responded."

:::Show the answer
**(b).** It's more specific, says how many people responded and admits the limit. (a) can be exactly the same data and still mislead, because it hides the denominator.

(The figures in the example are made up.) Practical rule: if a number would look different once people know where it came from, the number isn't ready to be published.
:::

3. A colleague says: "If what I tell is true but I tell it in the most emotional way possible, I've done my job". What would you answer?

:::Show the answer
That **true in every sentence is not the same as true as a whole**. You can build a misleading message out of nothing but true sentences, by choosing which ones to tell and which to leave out.

The useful test is to ask the reader, afterwards: "what do you think generally happens at the school?". If what they answer is more optimistic than what you know, the message worked and was dishonest.
:::

## What to do this week

Pick **one claim** from your current admissions material (a figure, a case, a strong adjective) and write next to it where it comes from and how it was measured. If you can't fill in that line, rewrite it or remove it. You don't need to audit everything: one is enough to see how much holds up.
$md$, 8 from books b where b.slug = 'made-to-stick' on conflict do nothing;
