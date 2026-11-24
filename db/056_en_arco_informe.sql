-- ============================================================
-- Frontera - English adaptation of the second arc: the monthly
-- report (055). Natural English, same structure. Run after 055.
-- ============================================================

-- ------------------------------------------------------------
-- Day 1
-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'en', null,
  'Take apart the report you write every month',
  'There''s a report you put together every month and it eats an afternoon. This week you set it up for good. Today you don''t use AI: you look at its parts, because not all of them can be handed over.',
$md$
The admissions report, the sales report, the deliveries report, the summary for the leadership meeting. The name changes, but the scene is the same: at the end of the month you open the spreadsheet, pull out the numbers, compare them with last month, write what happened and send it. Three hours that go by without anyone seeing them.

This week you'll set it up, one day at a time, so that next month it takes less than an hour. But there's a trap worth seeing before you start: **in a report, AI can do a lot of damage without anyone noticing.** It writes an invented number just as neatly as a real one.

That's why you don't use it today. Today you take the report apart to see which part belongs to whom.

## A report has three parts

1. **The numbers.** How many, how much, what percentage. They come from a spreadsheet or a system. AI shouldn't calculate them from memory or assume them: it has to **read** them from something you give it.
2. **The reading.** What changed since last month, what's unusual, what keeps happening. AI does this well, as long as it has the numbers for both months.
3. **The why and the what next.** Why enquiries fell, what gets decided. This is almost never in the spreadsheet: it's in your head. There was a bank holiday, the campaign changed, someone left the team. **It's the part only you can add.**

AI can save you almost all the work on the first two. The third is yours, and it's what makes the report worth reading.

## A worked example

A school's monthly admissions report. Four sections: enquiries received, visits, enrolments and a paragraph of comments for the leadership meeting.

How long it takes today:

- Pulling the numbers from the spreadsheet and building the table: **sixty minutes**.
- Comparing with last month and writing up what happened: **ninety minutes**.
- Rereading, formatting and sending: **thirty minutes**.

That's **a hundred and eighty minutes a month**, three hours. What can be handed over is almost all of the middle part, which is the longest: writing the comparison. What can't be handed over is the comments paragraph, because that's where the things nobody else knows go.

Write that number down. On Friday you'll measure it again.

## The edge: when you don't need it

- **When the report is just a table.** If what you send is the exported spreadsheet with no text, AI adds nothing. The spreadsheet is enough.
- **When the numbers aren't anywhere.** If you get them by counting by hand, from scattered emails or from memory, the problem isn't the writing: there's no data. A spreadsheet comes first.
- **When only one person reads it and they'd rather talk.** Sometimes the best report is a ten-minute conversation.

## Check you've got it

These three sentences appear in a deliveries team's report. Which one can AI write, which one can it write if you give it something, and which one is yours?

1. "In October there were 412 deliveries, 8% fewer than in September."
2. "The drop is explained by the two days of transport strikes."
3. "Late deliveries fell from 31 to 19."

:::Show the answer
**It can write 1 and 3, but only if you give it the spreadsheet for both months.** They're numbers and comparisons: without the data it invents them, and they look just as neat.

**Number 2 is yours.** The spreadsheet doesn't say there was a strike. If AI writes it on its own, it's an assumption dressed up as an explanation. What it can do is leave you a space: "possible cause: to be completed".
:::

## For today

1. Take the last report you sent and mark it in three colours: what's numbers, what's reading, and what's why and decisions.
2. Write down how long each part takes you. The sum in minutes, per month.
3. Check where the numbers come from. If they're in a spreadsheet, save last month's and the month before: you'll use them tomorrow. **If they contain people's names, tomorrow we'll see how to remove them.**

## The rule to take away

**AI reads numbers and writes comparisons. You supply the why.** A report where AI supplied the why is a report that invented something.
$md$,
  7, 'curado'
from lessons l where l.slug = 'a2-informe-mensual-1'
on conflict do nothing;

-- ------------------------------------------------------------
-- Day 2
-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'en', null,
  'Make it read the spreadsheet, not guess it',
  'The costliest mistake in a report is an invented number nobody checks. Today you learn to give it the data so it reads it properly, and to check that before it writes a single line.',
$md$
You pasted part of the spreadsheet into the AI and asked it to "put together this month's report". It gave you three neat paragraphs with percentages. One of those percentages comes from nowhere: it wasn't in what you pasted, it filled it in because it "fitted".

It isn't ill intent. If a figure is missing for the text to hang together, it fills the gap. So today's work isn't asking for the report: it's **giving it the data in a way that leaves nothing to fill in**, and checking it read it correctly.

## How to give it the spreadsheet

1. **One single table.** One tab, one row of headings at the top, one value per cell. Merged cells, headings split over two rows and subtotals mixed in the middle are the most common causes of misreadings.
2. **Both months.** This month and last month, in the same table or in two columns. Without last month it can't compare, and if it can't compare, it invents the comparison.
3. **No personal data.** If the spreadsheet has names, email addresses or ID numbers, remove those columns first. A monthly report almost never needs them: it needs the totals. And before uploading your organisation's data to any tool, check what your organisation allows.
4. **Upload it as a file** if your tool lets you. Pasting from a spreadsheet sometimes scrambles the columns.

## Before it writes, make it tell you what it sees

This is the step almost nobody takes and the one that catches the most errors. Before asking for the report, ask this:

"Before writing anything, tell me which columns the table has, how many rows, and the total of each numeric column for each month."

It takes thirty seconds. You compare those totals with your spreadsheet's. If they match, it read it correctly and you can carry on. If they don't, you've found the problem **before** it's hidden inside a paragraph.

## A worked example

The admissions spreadsheet has one row per enquiry: date, channel, year group of interest and whether they visited. The check came back with:

- Columns: date, channel, year group, visit. Correct.
- October: 96 enquiries, 38 visits. Correct, it matches the spreadsheet.
- September: 104 enquiries.

In the spreadsheet, September had **120**. The difference: sixteen September rows had the date typed as text ("15 Sept") rather than as a date, and it didn't count them. The format was fixed, the check was run again and it came back with 120.

Had the report been requested straight away, it would have said "enquiries fell by 8%" when they actually fell by 20%. A neat report, with a number that changes the conversation in the meeting.

## The edge: what the check doesn't catch

- **If the figure is wrong in the spreadsheet**, AI will read it perfectly and it'll be just as wrong. The check tests the reading, not the source.
- **Very large spreadsheets** can be half-read without warning. If you have thousands of rows, give it the table already summarised by month, not the individual rows.
- **Totals it calculated** get checked too. If a total is slightly off, it isn't rounding: it's a row it didn't read.

## Check you've got it

You asked for the check and it came back with: "The table has 3 columns and 214 rows. Total sales: 1,284,500." Your spreadsheet has 4 columns and 220 rows, and the total is 1,301,200. What do you do?

1. Carry on: the difference is small, under 2%.
2. Ask it to correct the total and carry on.
3. Find which column and which rows it didn't read before going any further.

:::Show the answer
**Number 3.** It's missing a column and six rows: that isn't a calculation error, it's an incomplete reading. If you ask it to "correct the total", it'll write the number you gave it without having read the missing rows, and everything else in the report will still come from an incomplete table.

It's almost always formatting: a column with an odd heading, rows with merged cells or a value typed as text. It gets fixed in the spreadsheet and checked again.
:::

## For today

1. Prepare the spreadsheet for the last two months: one table, one row of headings, no personal data.
2. Give it to your tool and ask for the check: columns, rows and totals by month.
3. Compare the totals with yours. If they don't match, find out why and fix it in the spreadsheet. **Don't ask for the report yet.**

## The rule to take away

**Before it writes, make it tell you what it read.** A total that doesn't match is a wrong report you haven't written yet.
$md$,
  7, 'curado'
from lessons l where l.slug = 'a2-informe-mensual-2'
on conflict do nothing;

-- ------------------------------------------------------------
-- Day 3
-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'en', null,
  'Compare, don''t describe',
  'It reads the data properly now. Today you ask for what a report is really for: not what happened, but what changed. And you learn when a percentage lies.',
$md$
If you ask it to "write the October report", it will describe October: so many enquiries, so many visits, so many enrolments. It's correct and it's no use to anyone, because the reader could already look at the table.

What someone wants from a report is **what changed and whether it matters**. That's comparing, and you have to ask for it that way.

## The request that compares

With the table already checked, ask for four things:

1. **The three biggest changes** compared with last month, with the before figure, the current figure and the difference.
2. **A relationship between two numbers**, not just each number on its own. In admissions, for example: out of every hundred enquiries, how many ended in a visit.
3. **What didn't change but should have.** If there was a new campaign and enquiries stayed the same, that's news too.
4. **Possible causes marked as hypotheses**, with the word "hypothesis" in front. Not as facts.

The fourth one protects what you saw yesterday: AI will want to explain. That's fine, as long as it's clear it's guessing, and the final explanation is yours.

## A worked example

The admissions numbers:

- Enquiries: 120 in September, 96 in October. **Down 24, or 20%.**
- Visits: 40 and 38. Down 2, or 5%.
- Enrolments: 12 and 15. **Up 3.**

A description would say: "Enquiries fell by 20%." It sounds like a problem.

Comparing the numbers says something else. In September, out of every hundred enquiries, 33 led to a visit (40 out of 120). In October, almost 40 (38 out of 96). **Fewer enquiries came in, but better ones**: a larger share ended up visiting the school. With that reading, the meeting discusses something different: not "what happened to enquiries" but "what did we do differently that attracted fewer but more interested families".

Look at enrolments: it says "up 3", not "up 25%". That's today's edge.

## The edge: when a percentage lies

With small numbers, percentages exaggerate. Going from 12 to 15 is 25% more, and it sounds like a leap. It's three families. Going from 2 to 4 withdrawals is 100% more, and it sounds like a disaster. It's two.

A practical rule: **if the numbers are below twenty, state the difference in units, not as a percentage.** And tell the AI so, because by default it will put percentages on everything.

The same goes for averages on a scale. If satisfaction went from 4.1 to 4.3 out of 5, saying "up 5%" means nothing. You say "up two tenths".

## Check you've got it

How should each change be stated in the report?

1. Calls received: from 300 to 240.
2. Pupil withdrawals: from 2 to 4.
3. Average satisfaction: from 4.1 to 4.3, out of 5.

:::Show the answer
**1. "Down 20%, from 300 to 240."** These are large numbers: the percentage informs, and it's worth including both figures.

**2. "Two more withdrawals than last month: four against two."** Saying "up 100%" would be technically true and alarming for no reason.

**3. "Up two tenths, from 4.1 to 4.3."** On a scale, a percentage makes no sense. What matters is how far it moved and whether that's a lot for that scale.
:::

## For today

1. With yesterday's checked table, ask for the four things: the three biggest changes, a relationship between two numbers, what didn't change and the hypotheses, marked.
2. Add to the request: "If a number is below twenty, give the difference in units, not as a percentage."
3. Read the hypotheses and cross out the ones you know are wrong. Next to them, write the real cause if you know it. Tomorrow that goes into the recipe.

## The rule to take away

**A report doesn't tell what happened: it tells what changed and whether it matters.** And with small numbers, the difference is stated in units.
$md$,
  7, 'curado'
from lessons l where l.slug = 'a2-informe-mensual-3'
on conflict do nothing;

-- ------------------------------------------------------------
-- Day 4
-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'en', null,
  'The report recipe, and what only you know',
  'Today you put it all into a recipe that works every month. It has a part the email recipe didn''t: a space for what happened that isn''t in any data.',
$md$
If you did the email arc, the idea will sound familiar: a text written once, holding everything that doesn't change, with a gap for what does. If you didn't, it doesn't matter: it's all here.

The report recipe has one important difference. In the email, the gap was the case details. In the report, the gap has **two parts**: the month's spreadsheet and what happened that month that the spreadsheet doesn't say.

## The parts of the recipe

1. **What it's for and who reads it.** "Monthly admissions report for the leadership meeting. They read it in five minutes before the meeting: it needs to make clear what changed and what needs discussing."
2. **The fixed structure.** The sections, in order, with the length of each. "One: three main changes, one line each. Two: the share of enquiries that lead to a visit. Three: hypotheses, marked. Four: what needs discussing, left empty for me to fill in."
3. **The rules.** The ones you learnt this week. "Before writing, check columns, rows and totals by month, and show them to me." "Numbers below twenty, in units." "Any cause not in the context goes in as a hypothesis." "No adjective without a number: no significant growth."
4. **A previous report as an example.** The last one you sent and liked, so it copies the tone and length.
5. **The gap.** Two lines: "This month's spreadsheet: attached." and "What happened this month:".

## What only you know

The last line of the gap is the one that changes everything. Three or four lines go there about what happened and isn't in the spreadsheet:

- "There was a bank holiday weekend in the second week."
- "From the 10th the campaign changed: less reach, more targeted."
- "One member of the team was on leave for ten days."

With that, the hypotheses stop being guesses: AI can connect "fewer but better enquiries" with "a more targeted campaign", and write it as what it is, a link you gave it. Whatever it can't connect to anything you provided, it leaves marked as a hypothesis.

## A worked example

The October report with the full recipe, the spreadsheet and these three lines of context: bank holiday weekend, new campaign from the 10th, one person on leave.

The result opened with the check: 96 and 120 enquiries, 38 and 40 visits. They matched. Then the three changes with their numbers, the share of visits, and this line: "The fall in enquiries coincides with the campaign change on the 10th, which aimed for less reach and more interested families; the share of visits rose from 33 to almost 40 in every hundred." And a single marked hypothesis: "Hypothesis: the bank holiday may have pushed enquiries into the following week; there's no weekly data to confirm this."

Two corrections: a number with too many decimals and one long sentence. None about the data.

## The edge: context that turns into opinion

The "what happened" space is for facts, not conclusions. If you write "the new campaign worked really well", AI will repeat it with conviction, and the report will claim something the numbers may not show. Write what happened, not what you think it means: "the campaign changed on the 10th". The report draws the conclusion, in plain sight, with the numbers beside it.

## Check you've got it

Which of these lines belong in "what happened this month" as they are?

1. "The enrolment system was down from the 3rd to the 5th."
2. "The team did a great job despite everything."
3. "A new channel, the website form, was added from the 15th."
4. "The fall in enquiries isn't worrying."

:::Show the answer
**Numbers 1 and 3.** They're dated facts that the spreadsheet doesn't show and that may explain a number.

**Not 2 or 4.** They're opinions. Number 2 doesn't explain any figure. Number 4 is exactly the conclusion the report has to show with numbers, and if you put it in as context, AI will assert it without showing anything. If you believe the fall isn't worrying, the report has to let people see why: for example, with the share of visits.
:::

## For today

1. Write your recipe with its five parts. Turn everything you corrected this week into rules.
2. Write three or four lines about what happened last month: facts only, with dates if they have them.
3. Try it all together: recipe, spreadsheet and context, in a new conversation. Check that it starts with the check and that the totals match.

## The rule to take away

**The spreadsheet says what happened. You know why. The report needs both, and nobody else can supply the second.**
$md$,
  7, 'curado'
from lessons l where l.slug = 'a2-informe-mensual-4'
on conflict do nothing;

-- ------------------------------------------------------------
-- Day 5
-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'en', null,
  'Leave it ready for next month, and measure',
  'Last day. Today you save the recipe where you''ll find it in a month, set up the four-step routine and redo Monday''s sum.',
$md$
An email gets used every day, so its recipe stays to hand on its own. A report is different: you'll do it again **in a month**. By then you won't remember where the recipe is, what the spreadsheet had or which step came first. That's why saving it isn't enough today: the routine has to be set up too.

## Where it lives

Like any recipe: in a ChatGPT project or custom GPT, in a Claude project, or in a Gemini Gem. The recipe's instructions go there and, if the tool allows it, the previous report as an example file.

Name it the way you say it: "Monthly admissions report". And put a reminder in your calendar, on the day you prepare it each month, with the project's name. It's the simplest way to avoid starting from scratch in a month's time.

## The four-step routine

1. **Prepare the spreadsheet.** The new month and the previous one, one table, no personal data.
2. **Write what happened.** Three or four lines of facts.
3. **Open the project and give it both.** The recipe is already inside.
4. **Check.** That the totals in the check match yours, that causes you didn't provide are marked as hypotheses, and fill in the section on what needs discussing.

Step four is never skipped. It's what lets you sign off the report with confidence.

## A worked example: Monday's sum

On Monday the sum was a hundred and eighty minutes a month: an hour of numbers, an hour and a half of writing and half an hour of checking.

With the routine in place, the following month's report took:

- Preparing the spreadsheet: **fifteen minutes**.
- Writing what happened: **five minutes**.
- Checking totals and hypotheses: **twenty minutes**.
- Adjusting and filling in what needs discussing: **ten minutes**.

That's **fifty minutes**. Against a hundred and eighty, that's **a hundred and thirty minutes a month**. Over twelve months, one thousand five hundred and sixty minutes: **twenty-six hours a year**, from a single report.

And the part that saved the most time isn't the part that matters most. What changed most is that the report now **compares**, separates facts from hypotheses and has no numbers nobody checked. It's quicker to make and better to read.

## The edge: what you never hand over

Now that it works, it'll be tempting to skip the check "because it always comes out right", or to ask it to fill in what needs discussing too. Don't.

- **Checking the totals** is the only thing that protects you from the error you can't see. One month the spreadsheet will arrive in a different format and the reading will fail silently.
- **What needs discussing** is a decision about what matters. If AI writes it, the report stops being yours and the meeting discusses what a tool chose.

## Check you've got it

Someone used to take four hours over their monthly report. With the routine in place, it takes one. How much do they gain per month, and over a year?

:::Show the answer
**Three hours a month and thirty-six hours a year.**

Before: two hundred and forty minutes. Now: sixty. The difference is a hundred and eighty minutes, three hours. Times twelve months, thirty-six hours: almost a full working week.

If you also did the email arc, add the two sums together. That combined number is the one worth taking into a conversation with your team.
:::

## For today

1. Save the recipe in your tool, under the report's name, with the last report as an example if possible.
2. Put next month's reminder in your calendar, with the project's name and the four steps.
3. Redo Monday's sum with your own numbers. Write it down.

When you close this lesson, in what you commit to, write down **the exact day next month** when you'll prepare the report with the routine.

## The rule to take away

**What you do once a month doesn't get remembered: it gets set up.** The recipe saved, the routine written down and a reminder in the calendar.
$md$,
  7, 'curado'
from lessons l where l.slug = 'a2-informe-mensual-5'
on conflict do nothing;

-- ------------------------------------------------------------
-- Check
-- ------------------------------------------------------------
select l.arc_day, c.lang, c.title, length(c.body_md) as characters
from lessons l join lesson_contents c on c.lesson_id = l.id and c.tool_id is null
where l.arc = 'informe-mensual'
order by l.arc_day, c.lang;
