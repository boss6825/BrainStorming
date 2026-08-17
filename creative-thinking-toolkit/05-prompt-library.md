# 05 · The Prompt Library

The operational file. Two parts:

- **Part A — Greatest hits:** the highest-yield individual prompts, ready to paste.
- **Part B — Composed session recipes:** multi-step pipelines that chain techniques into a full working session, tuned for the kind of thinking this repo is for — startup ideas, research directions, and life decisions.

If you use the `/ideate` skill, it runs these recipes for you. Recipe 5 is the exception: `/ideate` should hand off to `/council` so the seats are real models. This file is here for when you want to drive manually or cherry-pick.

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

### Recipe 5 — Council Multi-Model Panel
*For: "Run this past several real models, let them disagree, then blend."*
*Operator: `/council`. Method: [`07-multi-model-panel.md`](07-multi-model-panel.md). Do not simulate the other vendors inside one model.*

**Phase 0 — Session.** Copy `council/_template/` → `council/YYYY-MM-DD-slug/`. Fill `00-brief.md`. `git status` baseline. Discover Cursor ids with `cursor-agent --list-models` (never invent ids). Codex inherits the local default.

**Phase 1 — Diverge (orchestrator, judgement OFF).** Write `01-deep-research.md` if needed, then `02-divergent-seeds.md` using the diversity rules in [`07`](07-multi-model-panel.md) (unique mechanisms, weirder tail).

**Phase 2 — Deep-dive (parallel panel, still judgement OFF).** Assign clashing seats ([`07` §3](07-multi-model-panel.md#3-assigning-seats)). Materialize **read-only** prompts under `prompts/` ([`07` §4](07-multi-model-panel.md#4-read-only-panel-prompt)) — one `seat-*.md` per distinct persona. Fan out:

```
./scripts/cursor-panel.sh --seat {id} council/{slug}/prompts/seat-a.md \
  --seat {id} council/{slug}/prompts/seat-b.md \
  --out-dir council/{slug}/panel
```

Launch Codex in the same operator turn when concurrent tools are available; otherwise serialize and say so. Save `panel/codex-<slug>.md` with the documented provenance header (`council/_template/panel/README.md`) and only then append it to `panel/outputs.manifest`. A raw plugin dump is not provenance-complete. `git status` after. Unexpected diffs → stop and restore.

**Phase 3 — Cross-pollinate (orchestrator).** [`07` §5](07-multi-model-panel.md#5-cross-pollination-merge) → `03-cross-pollination.md`. Read **only** files in `panel/outputs.manifest` (not `panel/README.md`, `prompts/`, or `panel/adversarial/`). If the manifest is missing, stop — do not glob. Blend across files; keep contradictions.

**Phase 4 — Adversarial.** `/codex:adversarial-review` (save under `panel/adversarial/` with the documented provenance header, then list its basename in `panel/adversarial/outputs.manifest`) + Cursor devil's advocate via `cursor-panel.sh --seat` into that same dedicated directory ([`07` §6](07-multi-model-panel.md#6-adversarial-pass)), launched together when tools can run concurrently. Keep the initial `panel/outputs.manifest` unchanged. Do not use `cursor-agent.sh` raw output as panel evidence. Read-only; git-status before/after.

**Phase 5 — Converge (judgement ON).** [`07` §7](07-multi-model-panel.md#7-convergence) → `04-synthesis.md` (KILL / PIVOT / VALIDATE + cheapest test). Consume `panel/outputs.manifest` **and** `panel/adversarial/outputs.manifest`. Curator updates `LEDGER.md` ([`07` §8](07-multi-model-panel.md#8-ledger-governance)): quality-weighted, compact, no panel dumps, no majority vote, no automatic cross-session reuse.

Ask every seat for **conclusions, evidence, assumptions, uncertainty, counterarguments, and a concise rationale** — never hidden chain-of-thought.

---

## Combining recipes

- **Whole arc:** Recipe 3 (find whitespace) → Recipe 1 (ideate into it) → Recipe 2 (kill/validate the winner). That's discovery → generation → judgement end to end.
- **When you're stuck mid-run:** drop in Recipe 4 (lens sweep) or the "Combine two unrelated things" greatest-hit to break the plateau.
- **When one model is the bottleneck:** Recipe 5 (Council) after Recipe 1 or 3, then Recipe 2 on the winner. Cross-pollination is not a substitute for a kill check.

**A note on honesty in convergence.** The model will drift toward encouragement — it's trained to be agreeable. In every converge phase, explicitly demand bluntness ("do not soften to be nice"), and treat a confident KILL as a successful session, not a failed one.
