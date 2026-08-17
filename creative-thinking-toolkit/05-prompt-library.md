# 05 · The Prompt Library

The operational file. Two parts:

- **Part A — Greatest hits:** the highest-yield individual prompts, ready to paste.
- **Part B — Composed session recipes:** multi-step pipelines that chain techniques into a full working session, tuned for the kind of thinking this repo is for — startup ideas, research directions, and life decisions — plus a **Council** multi-model run when you have local Claude Code with Cursor Agent and Codex.

If you use the `/ideate` skill, it runs these recipes for you. This file is here for when you want to drive manually or cherry-pick.

---

## Part A · Greatest hits (single prompts)

**Break out of generic (use first when the model sounds like a listicle):**
```
Everything you just gave me sounds like the average answer. Regenerate for
{challenge}: no two ideas may share a core mechanism, each must break at least one
convention people assume is fixed, and ideas should get progressively weirder.
Flag the 3 furthest from anything you'd normally suggest.
```

**Combine two unrelated things (fastest novelty engine):**
```
Force a collision between {thing_A} and {thing_B}. Find the abstract structure they
share, then project elements of both into one new concept with a property neither had
alone. Give 3 named blends, each with a one-line pitch.
```

**Steal a solution from a far field:**
```
Abstract {problem} to its functional essence (a domain-neutral question). Name 5
distant domains — nature, another industry, a game, an ancient craft — that already
solved that function well. Describe each underlying principle and transfer it back as
a concrete idea. Highlight the most distant analogy that still maps cleanly.
```

**Provoke past the obvious:**
```
Make 5 deliberately impossible "PO:" statements about {problem} (reverse it,
exaggerate it, remove its core element, wish for magic). Don't judge them — extract
the movement each one opens, then turn each into 1-2 real, actionable ideas.
```

**Volume dump with diversity built in:**
```
Generate 20 distinct ideas for {challenge}. No repeated core mechanisms; ideas 11-20
must be progressively more unconventional than 1-10; flag the 3 weirdest-yet-plausible.
```

**The convergence scorer (append after any generator):**
```
Now converge: score each idea 1-5 on novelty, feasibility, and fit to
{goal/constraints}. Show a table, then recommend the top 3 with a one-line rationale
and the single biggest risk for each.
```

**Red-team one idea before you commit:**
```
Play devil's advocate on {idea}. The 5 strongest arguments against it, its shakiest
hidden assumption, the scenario where it fails badly — then how to redesign it to
survive each objection. Be blunt.
```

---

## Part B · Composed session recipes

Each recipe is a sequence of prompts. Run them in order, feeding the previous output into the next. They deliberately separate **diverge** from **converge** (see [`README.md`](README.md)).

### Recipe 1 — The Full Ideation Run
*For: "I need fresh ideas for X and I don't want the obvious ones."*

**Phase 0 — Frame (set the mind).** Paste the [Combinatorial Creativity framing](03-combinatorial-creativity.md#framing-combinatorial-creativity-popova) with your problem, to get 15 diverse building blocks on the table.

**Phase 1 — Clear the ground.**
```
ASSUMPTION BREAKER for {challenge}: list every assumption/"best practice" baked into
how this is normally done, 5-Whys each until it's either a fundamental truth or just
convention, and discard the conventions. Tell me which "rules" turned out to be optional.
```

**Phase 2 — Diverge wide (judgement OFF).** Run two generators back to back:
```
IDEA CASCADE for {challenge}: 25 ideas fast, no self-censoring, jump to an unrelated
domain every 5 ideas. Then, RANDOM PROVOCATION: 3 random anchors + 1 impossible "Po"
statement, and the ideas each unlocks. Keep going even when ideas feel wrong.
```
(Optional diversity boost: re-run through 3 clashing [personas](04-llm-divergence-techniques.md#2-persona--expert-prompting).)

**Phase 3 — Deepen the odd survivors.**
```
Take the 5 most unusual ideas above. For each, run PATTERN TRANSFER (what distant
domain already makes this work, and how?) OR CONCEPTUAL BLENDING to turn the spark
into a concrete, named concept with a one-line pitch.
```

**Phase 4 — Converge honestly.**
```
Now score every developed concept 1-5 on novelty, feasibility, and fit to {my goal
and constraints}. Table it. Recommend the top 3 with the single biggest risk each.
Then play devil's advocate on the #1 and tell me how to redesign it to survive.
```

### Recipe 2 — Kill-the-Idea Red Team
*For: "I have an idea I'm excited about. Tell me if it's real before I sink weeks into it."*
*(This repo's ethos: killing a bad idea early is a win. See `../path-forward/04-how-to-validate-in-one-week.md`.)*

```
Idea: {describe it in 3-4 sentences}.
Step 1 — Steelman it: the strongest version and why it could win.
Step 2 — Devil's advocate: 5 strongest arguments against, the shakiest hidden
assumption, and the most likely way it dies.
Step 3 — First-principles gut check: what would have to be *fundamentally true* about
the world / the customer / the economics for this to work? Which of those is unproven?
Step 4 — Reverse brainstorm: 10 ways this fails, then which are within my control.
Step 5 — Verdict: KILL, PIVOT, or VALIDATE — and if VALIDATE, the single cheapest
test that would move me from "maybe" to "yes/no" this week.
Be brutally honest; do not be encouraging to be nice.
```

### Recipe 3 — Research-a-Space (find the whitespace)
*For: "I want to understand a domain/market and find where the un-obvious opportunity is."*

**Phase 1 — Map what exists.**
```
Map the space of {domain/market}: the main players and models, the standard way the
problem is solved today, and the components/capabilities that already exist ("what's
on the table"). Be concrete; flag what you're unsure about so I can go verify it.
```

**Phase 2 — Find the frontier.**
```
Now the ADJACENT POSSIBLE: 10 ideas reachable by ONE recombination of what already
exists, rated adjacent (buildable now) vs ahead-of-its-time. Then inject components
from these adjacent fields — {fields} — for 5 more at the new frontier.
```

**Phase 3 — Interrogate the whitespace.**
```
For the 5 most promising gaps: why is each one still empty? Distinguish "empty because
it's a bad idea" from "empty because it's genuinely hard / newly possible / overlooked."
An empty seat isn't the same as an open one — which of these is actually open, and why now?
```

**Phase 4 — Converge to research questions.**
```
Turn the 3 best gaps into sharp, falsifiable questions I could research or test this
week, each with what evidence would confirm or kill it.
```

### Recipe 4 — Deep-Tunnel Lens Sweep
*For: "I've exhausted the obvious angles and want genuinely different ones."*

```
Run {challenge} through 4 wildly different DEEP-TUNNEL lenses, one at a time — e.g.
{a competitive speedrunner, a field biologist, a street vendor, a systems-security
red-teamer}. In each lens, immerse fully in its vocabulary and fine details, re-describe
the challenge in its terms, and surface 3 ideas only someone hyperfocused on that domain
would have. Then tell me which lens produced the most surprising usable idea and why.
```

### Recipe 5 — Council Multi-Model Run
*For: "I want genuinely independent models to research, disagree, cross-pollinate,
and then reach an honest decision."*

Requires **local** Claude Code with Cursor Agent and the Codex plugin. Full method and paste-ready prompts live in [`07-multi-model-panel.md`](07-multi-model-panel.md). Prefer `/council`, which owns the session lifecycle and writes the `council/` artifacts. If the toolchain is unavailable (cloud/web mode, missing `cursor-agent` / `codex`), **stop** — do not replace missing models with same-model role-play.

**Invocation brief** (fill, then hand to `/council` or drive the phases manually):
```
COUNCIL INVOCATION BRIEF

Question: {question}
Goal: {goal}
Hard constraints: {constraints}
Angles already tried / ruled out: {tried}
Session slug hint: {slug_hint}

Run Recipe 5 /council Modes 1–5. Use toolkit 07 prompts. Keep panel members
independent until cross-pollination. Do not simulate missing models.
```

**Phase 1 — Diverge (Mode 1).** Orchestrator writes `00-brief.md`, seed research `01-deep-research.md`, and a wide `02-divergent-seeds.md` with judgement off (Idea Cascade / anti-clustering levers from the toolkit).

**Phase 2 — Independent deep dive (Mode 2).** Fan out the Mode 2 prompt from [07](07-multi-model-panel.md) in parallel to Grok, GPT, Gemini, Composer (Cursor) and Codex (`/codex:review`). Save each to `panel/<model>.md`. No model sees other panel answers yet.

**Phase 3 — Cross-pollinate (Mode 3).** Orchestrator runs the Mode 3 prompt from [07](07-multi-model-panel.md) → `03-cross-pollination.md` (≥6 candidates: blends + bisociations; no scoring).

**Phase 4 — Adversarial (Mode 4).** Codex adversarial review + Cursor red team from [07](07-multi-model-panel.md).

**Phase 5 — Converge + ledger (Mode 5).** Orchestrator runs Mode 5 → `04-synthesis.md` (novelty × feasibility × fit; KILL / PIVOT / VALIDATE; cheapest test), then curates `LEDGER.md`.

---

## Combining recipes

- **Whole arc:** Recipe 3 (find whitespace) → Recipe 1 (ideate into it) → Recipe 2 (kill/validate the winner). That's discovery → generation → judgement end to end.
- **When you're stuck mid-run:** drop in Recipe 4 (lens sweep) or the "Combine two unrelated things" greatest-hit to break the plateau.
- **Recipe 3 → Recipe 5:** Research-a-Space can frame seed research / domain map before a Council Multi-Model Run.
- **Recipe 5 → Recipe 2:** After Council synthesis, Kill-the-Idea can add an extra validation pass on the survivor.
- **Recipe 5** remains standalone and is normally run through `/council` (local only).

**A note on honesty in convergence.** The model will drift toward encouragement — it's trained to be agreeable. In every converge phase, explicitly demand bluntness ("do not soften to be nice"), and treat a confident KILL as a successful session, not a failed one.
