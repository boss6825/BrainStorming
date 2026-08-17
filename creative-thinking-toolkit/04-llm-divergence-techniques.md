# 04 · LLM-Native Divergence Techniques

These techniques exploit *how the model itself works* — its ability to branch reasoning, adopt personas, run panels, and sample at different temperatures — to widen the distribution of ideas it produces. They stack on top of any framework in [01](01-creativity-frameworks.md)–[03](03-combinatorial-creativity.md).

> **The one caveat that governs this whole file — the diversity trap.** Wharton's research (2023–24) found AI brainstorms are *high-quality but low-diversity*: the ideas are individually good and collectively samey, all clustered near the center of what the model has seen. Volume alone doesn't fix it — 50 ideas can be 50 versions of the same idea. Every technique here is really an answer to one question: *how do I force the output distribution to spread?* The reliable levers are (a) explicit no-repeat / "make it weirder" constraints, (b) rotating personas/panels so different priors generate, and (c) higher sampling temperature for the divergent pass.

**Contents**
1. [Tree-of-Thoughts](#1-tree-of-thoughts--three-experts) · 2. [Persona / Expert Prompting](#2-persona--expert-prompting) · 3. [Devil's Advocate](#3-devils-advocate) · 4. [Quantity-Forcing](#4-quantity-forcing--divergent-volume) · 5. [PanelGPT](#5-panelgpt--multi-agent-panel) · 6. [Temperature Framing](#6-temperature--stochastic-framing) · 7. [Warm-Ups](#7-creative-warm-ups)

---

## 1. Tree-of-Thoughts / Three Experts

Makes the model explore multiple reasoning branches in parallel, self-evaluate, and prune — mimicking a brainstorm. Human raters preferred ToT over chain-of-thought for creative writing. Use for hard, open-ended, multi-path problems.

The famous single-prompt version (Hulbert):

```
Imagine three different experts are answering this question.
All experts will write down 1 step of their thinking,
then share it with the group.
Then all experts will go on to the next step, etc.
If any expert realises they're wrong at any point then they leave.
The question is... {question}
```

## 2. Persona / Expert Prompting

Assign a *specific, detailed* expert persona to shape the idea space. Documented to help open-ended/creative tasks; **specific beats generic** ("a veteran industrial designer who worked on both F1 aerodynamics and children's toys" >> "an expert"), and rotating several sharply-different personas is one of the best diversity levers there is.

```
You are {specific expert persona, e.g. "a veteran industrial designer who worked
on both Formula 1 aerodynamics and children's toys"}. Bring the biases, heuristics,
and vocabulary of that background.
Given {challenge}, generate 10 ideas the way THIS person would — ideas a generalist
would never propose. For each, note the domain instinct behind it.
```

*Rotation variant (recommended):* run the same challenge through 3 deliberately clashing personas, then contrast what each surfaced. This is the cheap fix for the diversity trap.

## 3. Devil's Advocate

Turns the compliant assistant into a critic. Essential for the *converge* phase — surfaces weak logic and blind spots before you commit.

```
Play devil's advocate on this idea: {idea}.
1. Give the 5 strongest arguments AGAINST it.
2. Identify the hidden assumptions it depends on and which are shakiest.
3. Describe the scenario in which it fails badly.
4. Then, for each objection, propose how to redesign the idea to survive it.
Be blunt; do not soften to be agreeable.
```

## 4. Quantity-Forcing / Divergent Volume

Demanding a large number pushes past the first few obvious answers into the long tail — but *only* if you also force diversity (see the trap above), otherwise you get 20 near-duplicates.

```
Generate 20 distinct ideas for {challenge}.
Rules: no two ideas may share the same core mechanism; ideas 11-20 must be
progressively weirder and more unconventional than 1-10; after the list, flag the
3 that are most different from anything you'd normally suggest.
```

## 5. PanelGPT / Multi-Agent Panel

Simulate a panel of diverse thinkers *debating* — an extension of ToT to a panel discussion. The disagreement itself generates and refines ideas.

```
Simulate a panel discussion among 4 experts with clashing worldviews about {topic}:
a pragmatic engineer, a boundary-pushing artist, a skeptical economist, and an
end-user. Have them debate in 3 rounds — propose, challenge, synthesize. Then
produce a combined shortlist of the 5 best ideas that emerged and note which expert
sparked each.
```

## 6. Temperature / Stochastic Framing

If you control the API, raise sampling temperature for the divergent pass (then lower it to converge). In a chat UI you can't set temperature, but you *can* instruct the equivalent framing — high variance, low self-censorship.

```
[API: set temperature ~0.9-1.1, top_p ~0.95 for this call]
DIVERGENT MODE: For {challenge}, prioritize novelty and surprise over safety or
feasibility. Do not filter or self-censor early. Give 15 ideas spanning
conventional -> adjacent -> radical. We'll evaluate feasibility in a later
(low-temperature) pass — right now, maximize variety.
```

## 7. Creative Warm-Ups

Short divergent drills to loosen up before the real task, or to prime an ideation chain.

```
Offer me five 3-minute warm-up prompts (e.g. random-word association, "30 uses
for a brick", worst-possible-idea) to boost creativity before tackling {task}.
```

---

## How these stack with the rest of the toolkit

The frameworks/modes/methods in [01]–[03] decide *what kind of thinking* to do. These decide *how to run the model* while doing it. A strong default stack for a divergent pass:

> **Persona rotation (#2) + Quantity-forcing with a no-repeat rule (#4) + high-temperature framing (#6)**, wrapped around whichever generator fits the problem (e.g. Idea Cascade, Conceptual Blending, SCAMPER).

Then hand off to the convergent stack — **Devil's Advocate (#3) + First-Principles ([01 §7](01-creativity-frameworks.md#7-first-principles-thinking)) + the convergence scorer ([03 §8](03-combinatorial-creativity.md#8-convergence-wrapper))** — to cut the pile down honestly. Full composed pipelines are in [`05-prompt-library.md`](05-prompt-library.md).

When you can call **other vendors** (Codex, Cursor CLI models), do not stop at simulated PanelGPT: run Council in [`07-multi-model-panel.md`](07-multi-model-panel.md). Same diverge→converge discipline; actually independent priors.
