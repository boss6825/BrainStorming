# 07 · Multi-Model Council

Council uses genuinely heterogeneous model calls to widen the idea distribution,
then deliberately cross-pollinates their independent findings before judgement
begins. A panel is not a majority vote and not several models averaging toward
the same generic answer.

**Contents**
1. [Why a heterogeneous panel](#1-why-a-heterogeneous-panel) · 2. [Default roles](#2-default-roles) · 3. [Independent deep-dive prompt](#3-independent-deep-dive-prompt) · 4. [Cross-pollination prompt](#4-cross-pollination-prompt) · 5. [Adversarial prompts](#5-adversarial-prompts) · 6. [Convergence prompt](#6-convergence-prompt) · 7. [Governed ledger](#7-governed-ledger) · 8. [Operating sequence](#8-operating-sequence)

---

## 1. Why a heterogeneous panel

Wharton's 2023–24 research found LLM brainstorms are **high-quality but low-diversity**: fluent ideas that cluster near the center of what the model has seen. Simulated panels inside one model (persona rotation, PanelGPT-style role-play) help a little, but they still share one prior, one training mixture, and one collapse toward the generic answer.

Council fights that trap with **real heterogeneous models** — different providers, different training data, different failure modes — each deepening the same brief **independently**. Only after those independent outputs exist does the orchestrator recombine them (Conceptual Blending & Bisociation from [03](03-combinatorial-creativity.md)). Disagreement is evidence of coverage, not something to vote away. A panel is not a majority vote and not averaging toward consensus.

This file holds the paste-ready prompts. The operator skill is `/council` (local Claude Code). `/ideate` Recipe 5 routes here; it does not simulate missing models.

---

## 2. Default roles

| Family | Role | Lens |
|---|---|---|
| Claude Opus | Seed researcher and orchestrator | Idea Cascade during divergence; blending during recombination; cold critic during convergence |
| Grok | Contrarian field investigator tracing incentives and forbidden assumptions | Assumption Breaker + Literalist |
| GPT | Reliability/systems architect with product-economics discipline | Systemizer + Bottom-Up Builder |
| Gemini | Comparative researcher spanning ecology, anthropology, and HCI | Pattern Transfer + Synesthetic Translation |
| Composer | Prototype-obsessed product mechanic seeking the smallest real experiment | Deep-Tunnel + Random Provocation |
| Codex | Forensic research methodologist and evidence auditor | Bottom-Up Builder |

Roles are deliberate assignments for this pipeline, **not** claims about model personality, and **not** clinical or stereotyped simulations of a real person. Lenses are cognitive-style-inspired thinking modes from [02](02-neurodivergent-thinking-modes.md).

---

## 3. Independent deep-dive prompt

Fill placeholders, then send **one copy per model** with that model's runtime ID, role, and lens. Models must not see each other's answers before this stage finishes.

For Codex: set `runtime_model_id` to `codex`, apply the Codex role/lens, invoke through `/codex:review`, and save the returned text unchanged into `panel/codex.md`.

```
COUNCIL MODE 2 — INDEPENDENT DEEP DIVE

Runtime model ID: {runtime_model_id}
Assigned role: {specific_role}
Cognitive-style-inspired lens: {assigned_lens}

These are thinking lenses, not clinical claims or simulations of a real person.

QUESTION
{question}

GOAL
{goal}

HARD CONSTRAINTS
{constraints}

ORCHESTRATOR SEED RESEARCH
{contents_of_01_deep_research}

DIVERGENT SEEDS
{contents_of_02_divergent_seeds}

INDEPENDENCE RULES
- Work independently. You have not seen other panel answers.
- Do not write "I agree with the others" or infer a consensus.
- Do not average toward a safe, generic answer.
- Challenge the framing when it is wrong or incomplete.
- Preserve unusual mechanisms. This is still deepening, not final convergence.
- Do not score, rank, or kill the seed set yet.
- Separate verified facts, inference, and speculation.
- Cite source URLs when you actually have them. Never fabricate citations.
- Label time-sensitive or unverified claims.
- Return the answer to stdout only. Do not edit the repository.

TASK
1. Reframe the question from your assigned role and lens.
2. Inspect every seed for overlooked mechanisms, dependencies, or evidence.
3. Deepen 3–5 seeds that your lens can uniquely develop. Explain the mechanism,
   not just the pitch.
4. Add at least one candidate absent from the seed set.
5. Identify relevant facts, comparable systems, or research and state confidence.
6. Name the strongest contradiction or framing error you found.
7. Hand back modular building blocks another thinker could combine later.

OUTPUT HEADINGS
# {runtime_model_id} — independent deep dive
## Assigned role and lens
## Reframing from this lens
## Seed-by-seed observations
## Deepened candidates
## One new candidate absent from the seeds
## Facts and evidence
## Assumptions and uncertainties
## Contradictions or framing errors
## Handoff building blocks
```

---

## 4. Cross-pollination prompt

Run **after** all independent panel files exist. The orchestrator (Opus) reads every `panel/*.md` and recombines across models. No scoring yet.

```
COUNCIL MODE 3 — CROSS-POLLINATION

QUESTION
{question}

GOAL
{goal}

HARD CONSTRAINTS
{constraints}

ORCHESTRATOR SEED RESEARCH
{contents_of_01_deep_research}

DIVERGENT SEEDS
{contents_of_02_divergent_seeds}

INDEPENDENT PANEL OUTPUTS
{contents_of_all_panel_model_files}

RULES
- This is recombination, not judgement. Do not score, rank, or kill candidates yet.
- Do not collapse disagreement into a fake consensus or majority vote.
- Preserve contradictions explicitly — unresolved tension is useful signal.
- Every candidate must cite exactly two source files (panel/*.md paths or seed docs)
  whose building blocks you combine.
- Prefer Conceptual Blending and Bisociation (toolkit 03) over averaging pitches.
- Separate verified facts, inference, and speculation. Never fabricate citations.
- Return Markdown only. Do not edit the repository.

TASK
1. Inventory modular building blocks across the panel (mechanisms, evidence,
   constraints, contradictions).
2. Produce at least 6 candidates total:
   - at least 3 Conceptual Blends (shared structure + emergent property)
   - at least 3 Bisociations (collision across two frames that don't usually meet)
3. For each candidate: name, one-line pitch, mechanism, the two source files,
   what each source contributed, and what emerged that neither source had alone.
4. List preserved contradictions that later stages must not paper over.
5. Flag any framing errors the panel collectively exposed.

OUTPUT HEADINGS
# Cross-pollination
## Building-block inventory
## Conceptual blends (at least 3)
## Bisociations (at least 3)
## Preserved contradictions
## Framing errors exposed
## Handoff set for adversarial review
```

---

## 5. Adversarial prompts

### Codex adversarial review

Invoke through `/codex:adversarial-review` (or equivalent Codex adversarial path). Save returned text unchanged.

```
COUNCIL MODE 4 — CODEX ADVERSARIAL REVIEW

Runtime model ID: codex
Assigned role: Forensic research methodologist and evidence auditor
Cognitive-style-inspired lens: Bottom-Up Builder

These are thinking lenses, not clinical claims or simulations of a real person.

QUESTION
{question}

GOAL
{goal}

HARD CONSTRAINTS
{constraints}

CROSS-POLLINATION CANDIDATES
{contents_of_03_cross_pollination}

PRIOR EVIDENCE (optional context)
{contents_of_01_deep_research_and_key_panel_excerpts}

RULES
- Attack the evidence and method, not the tone.
- Separate verified facts, inference, and speculation.
- Cite source URLs only when you actually have them. Never fabricate citations.
- Label time-sensitive or unverified claims.
- Do not soft-pedal to be agreeable.
- Return the answer to stdout only. Do not edit the repository.

TASK
1. For each front-runner candidate, identify the weakest evidence link and the
   shakiest hidden assumption.
2. Name what would have to be fundamentally true for the candidate to work.
3. Flag fabricated-sounding or under-sourced claims from earlier stages.
4. Describe the failure mode that kills each candidate most cleanly.
5. State what evidence would be required before anyone should spend a week on it.

OUTPUT HEADINGS
# codex — adversarial review
## Method and evidence audit
## Weakest links by candidate
## Fundamental truths required
## Suspected under-sourced claims
## Cleanest kill-shots
## Evidence required before commitment
```

### Cursor red team

Send via Cursor Agent to a contrarian model (default: Grok). Lenses: Assumption Breaker + Literalist.

```
COUNCIL MODE 4 — CURSOR RED TEAM

Runtime model ID: {runtime_model_id}
Assigned roles (rotate through all three voices):
- skeptical purchaser
- exhausted end-user
- operator who would have to run this on a bad day
Cognitive-style-inspired lens: Assumption Breaker + Literalist

These are thinking lenses, not clinical claims or simulations of a real person.

QUESTION
{question}

GOAL
{goal}

HARD CONSTRAINTS
{constraints}

CROSS-POLLINATION CANDIDATES
{contents_of_03_cross_pollination}

CODEX ADVERSARIAL FINDINGS (if available)
{contents_of_codex_adversarial}

RULES
- Stay concrete and lived-in. No abstract cheerleading.
- Take constraints literally; refuse hand-wavy "users will figure it out."
- Break assumptions the pitch depends on.
- Do not average toward a safe recommendation.
- Return the answer to stdout only. Do not edit the repository.

TASK
1. Attack each front-runner from the skeptical purchaser's incentives.
2. Attack each from the exhausted end-user's daily friction.
3. Attack each from the operator's failure and maintenance burden.
4. Name the assumption that, if false, collapses the idea.
5. Say what would make you walk away immediately.

OUTPUT HEADINGS
# {runtime_model_id} — cursor red team
## Skeptical purchaser
## Exhausted end-user
## Operator on a bad day
## Assumptions that collapse the idea
## Immediate walk-away conditions
## Survivors worth a cheap test (no scores yet)
```

---

## 6. Convergence prompt

Orchestrator only. Judgement is now on.

```
COUNCIL MODE 5 — CONVERGE

QUESTION
{question}

GOAL
{goal}

HARD CONSTRAINTS
{constraints}

FULL SESSION CONTEXT
- Seed research: {contents_of_01_deep_research}
- Divergent seeds: {contents_of_02_divergent_seeds}
- Panel outputs: {contents_of_all_panel_files}
- Cross-pollination: {contents_of_03_cross_pollination}
- Adversarial: {contents_of_adversarial_reviews}

RULES
- Be blunt. Do not soften to be nice. A confident KILL is a successful session.
- Score honestly on novelty × feasibility × fit to the stated goal/constraints.
- Do not invent consensus that the panel did not earn.
- Preserve unresolved contradictions in the write-up.
- Separate verified facts, inference, and speculation.
- Propose ledger deposits; do not silently rewrite history.
- Return Markdown for 04-synthesis.md. Do not edit unrelated repo files.

TASK
1. Score every serious candidate 1–5 on novelty, feasibility, and fit. Show a table.
2. Recommend a shortlist and give each a verdict: KILL, PIVOT, or VALIDATE.
3. Red-team the #1 survivor one more time in one tight paragraph.
4. Name the single cheapest test that would move the best VALIDATE candidate from
   "maybe" to yes/no this week.
5. Propose ledger deposits (what to keep, weight 1–5, type, linked contradictions).

OUTPUT HEADINGS
# Synthesis
## Score table (novelty × feasibility × fit)
## Verdicts (KILL / PIVOT / VALIDATE)
## Red-team of #1
## Cheapest next test
## Preserved contradictions
## Proposed ledger deposits
```

---

## 7. Governed ledger

Shared memory across Council sessions is a **stigmergic trace**, not a dump of every chat. Governance comes from the lit review in [`old research on startup ideas/stigmergy_memory_llm_swarms_review.md`](../old%20research%20on%20startup%20ideas/stigmergy_memory_llm_swarms_review.md): ungoverned shared memory triggers the Memory Curse (more history hurts), collective false belief (bad traces self-reinforce), and bystander loafing (agents contribute less in a crowd).

Operational rules for `LEDGER.md`:

- **Curated** — only deposits that survive convergence, not raw panel transcripts.
- **Quality-weighted** — each entry has weight 1–5; low-weight noise does not drive the next session.
- **Contradictions flagged** — opposing claims stay linked, never silently merged.
- **Evaporation** — stale or superseded entries archive out of the working set so old traces stop cueing new work.
- **Bounded reinforcement** — the same claim may gain at most **+1 weight per session**, preventing runaway confirmation.
- **Types** — e.g. fact, assumption, candidate, contradiction, decision, open question.

After synthesis, curate with:

```
CURATE THE COUNCIL LEDGER

SESSION
{session_path_or_slug}

SYNTHESIS
{contents_of_04_synthesis}

CURRENT LEDGER (working set)
{contents_of_LEDGER_md}

RULES
- Deposit only what earned a place; do not paste raw panel output.
- Assign weight 1–5 and a type (fact | assumption | candidate | contradiction |
  decision | open_question).
- Any single claim may increase by at most +1 weight this session.
- Link contradictions explicitly; never merge them into a false consensus.
- Archive working-set entries that are stale, superseded, or evaporated.
- Separate verified facts from inference and speculation.
- Return the updated ledger Markdown only.

TASK
1. Propose new deposits from this session's synthesis.
2. Apply bounded reinforcement to existing entries that were re-confirmed.
3. Flag or link new contradictions.
4. Move evaporated entries to an archive section.
5. Leave a one-line session trace (date, slug, verdict summary).

OUTPUT HEADINGS
# LEDGER
## Working set
## Contradictions index
## Archive
## Session traces
```

---

## 8. Operating sequence

Matches the five `/council` modes. **Local-only:** Codex plugin and Cursor Agent cannot run in Claude Code cloud/web mode. If those tools are missing, stop — do **not** replace missing models with same-model role-play.

1. **Mode 1 — Diverge** — Orchestrator writes `00-brief.md`, seed research `01-deep-research.md`, and a wide seed set `02-divergent-seeds.md` (Idea Cascade / anti-clustering levers). Judgement off.
2. **Mode 2 — Independent deep dive** — Fan out the §3 prompt in parallel via Cursor + Codex into `panel/<model>.md`. No model sees other panel answers yet.
3. **Mode 3 — Cross-pollinate** — Orchestrator runs §4 → `03-cross-pollination.md`.
4. **Mode 4 — Adversarial** — Codex adversarial (§5) + Cursor red team (§5).
5. **Mode 5 — Converge** — Orchestrator runs §6 → `04-synthesis.md`, then ledger curation (§7) → `LEDGER.md`.

Manual drivers: paste prompts from this file. Skill drivers: `/council` owns the lifecycle; `/ideate` only routes Recipe 5 here. Theory siblings: [03](03-combinatorial-creativity.md) for blending, [04](04-llm-divergence-techniques.md) for why simulated panels are not enough, [05](05-prompt-library.md) Recipe 5 for the composed session wrapper.
