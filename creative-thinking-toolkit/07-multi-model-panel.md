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

For Codex: set `runtime_model_id` to the **exact local Codex model id** (do not invent one), apply the Codex role/lens, invoke through `/codex:review`, wrap the returned text with the documented provenance header from `council/_template/panel/README.md`, save as `panel/codex-<slug>.md`, then list that basename in `panel/outputs.manifest`. A raw plugin dump is not provenance-complete.

Cursor seats use `scripts/cursor-panel.sh --seat` (or `--model` plus one shared prompt) into `panel/`. Prompts live under `prompts/`, not `panel/`. Every Cursor prompt is **read-only**; `git status` before and after because `--force` can edit the tree.

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

Run **after** independent panel files exist. The orchestrator (Opus) reads **only** the files listed in `panel/outputs.manifest`. Do not glob `panel/*.md`. Do not read `panel/README.md`, `prompts/`, or `panel/adversarial/` (that pass has not run yet). If the manifest is missing, stop. No scoring yet.

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
- Every candidate must combine material from at least two different source files
  listed in `panel/outputs.manifest`. Seed docs may be cited in addition, not as a
  substitute for a second panel file.
- Prefer Conceptual Blending and Bisociation (toolkit 03) over averaging pitches.
- Separate verified facts, inference, and speculation. Never fabricate citations.
- Return Markdown only. Do not edit the repository.

TASK
1. Inventory modular building blocks across the panel (mechanisms, evidence,
   constraints, contradictions).
2. Produce at least 6 candidates total:
   - at least 3 Conceptual Blends (shared structure + emergent property)
   - at least 3 Bisociations (collision across two frames that don't usually meet)
3. For each candidate: name, one-line pitch, mechanism, at least two source files,
   what each source contributed, and what emerged that neither source had alone.
4. List preserved contradictions that later stages must not paper over.
5. Flag any framing errors the panel collectively exposed.

Write the result using the structure of `council/_template/03-cross-pollination.md`
(source map, conceptual blends, bisociations, candidate set for adversarial).
Do not score novelty, feasibility, or fit yet.
```

---

## 5. Adversarial prompts

### Codex adversarial review

Invoke through `/codex:adversarial-review`. Save under `panel/adversarial/` with the documented Codex provenance header, then list the basename in `panel/adversarial/outputs.manifest`. Keep the initial `panel/outputs.manifest` unchanged.

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

Send via `scripts/cursor-panel.sh --seat` into `panel/adversarial/` (own `outputs.manifest`). Do not use `cursor-agent.sh` raw `--out` as panel evidence. Default lens: Assumption Breaker + Literalist. Read-only prompt; `git status` before and after.

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
- Panel outputs: {files listed in panel/outputs.manifest}
- Cross-pollination: {contents_of_03_cross_pollination}
- Adversarial: {files listed in panel/adversarial/outputs.manifest}

RULES
- Be blunt. Do not soften to be nice. A confident KILL is a successful session.
- Score honestly on novelty × feasibility × fit to the stated goal/constraints.
- Do not invent consensus that the panel did not earn.
- Preserve unresolved contradictions in the write-up.
- Separate verified facts, inference, and speculation.
- Propose ledger deposits; do not silently rewrite history.
- Return Markdown for 04-synthesis.md. Do not edit unrelated repo files.

TASK
1. Score every serious candidate 1–5 on novelty, feasibility, and fit. Composite =
   novelty × feasibility × fit. Keep evidence confidence (`low|medium|high`) separate.
2. Recommend at most three candidates, with the largest risk for each.
3. Red-team number one again (strongest objections, what must be fundamentally true,
   shakiest unproven assumption, most likely failure, required redesign).
4. Give exactly one session verdict: KILL, PIVOT, or VALIDATE. Do not soften it.
5. Give the single cheapest decisive next test, with confirming evidence, killing
   evidence, and the decision after either result.
6. List unresolved contradictions and missing/failed panel members.
7. Propose only curated ledger deposits that could alter future action.

Write the result using `council/_template/04-synthesis.md`.
```

---

## 7. Governed ledger

`LEDGER.md` is a **session-local** stigmergic trace, not a dump of every chat and not automatic memory for later sessions. The operational rules are **Council design choices motivated by** the lit review in [`old research on startup ideas/stigmergy_memory_llm_swarms_review.md`](../old%20research%20on%20startup%20ideas/stigmergy_memory_llm_swarms_review.md) (Memory Curse, collective false belief, bystander loafing). That review did not prove this exact schema.

Operational rules for `LEDGER.md`:

- **Curator-only** — panel models never write the ledger.
- **Curated** — only deposits that survive convergence, not raw panel transcripts.
- **Quality-weighted** — each entry has quality/weight 1–5 plus a why; majority vote never increases quality.
- **Contradictions flagged** — opposing claims stay linked, never silently merged.
- **Full schema always** — status changes; rows and IDs are never deleted.
- **`review-by` / stale** — expired entries become `stale` and must not drive new decisions.
- **Bounded reinforcement** — the same claim may gain at most **+1 quality point per session**.
- **Types** — optional CoALA-ish stores: `working` | `episodic` | `semantic` | `procedural`.
- **Status** — `active` | `contested` | `stale` | `retracted` | `rejected` | `superseded`.
- **No automatic cross-session reuse** — a later session may cite this file by path only after a curator/human chooses to.
- **Intake** — cross-pollination reads `panel/outputs.manifest`; synthesis also reads `panel/adversarial/outputs.manifest`. Never glob, never README, never prompts.

After synthesis, curate with:

```
CURATE THE COUNCIL LEDGER

Inputs:
{synthesis_and_source_files}

Deposit only claims or procedures that could materially change a later decision.
Do not deposit raw panel prose, generic advice, rankings, or repeated opinion.

For each proposed entry:
- choose working, episodic, semantic, or procedural;
- assign weight 1–5 using the ledger scale;
- state confidence (low | medium | high) and genuinely independent sources;
- provide first-deposited, last-reviewed, and review-by dates;
- link contradictions as separate entries;
- permit at most +1 reinforcement per session;
- cap weight at 5;
- give the implication and decay/archive rule.

If evidence conflicts, create linked contested entries. Never manufacture consensus.
At session close, mark `working` entries stale or superseded rather than deleting them.
Do not preload this ledger into another session automatically.

Write the result using the session LEDGER.md schema (full-schema table + contradictions + append-only change log).
```

---

## 8. Operating sequence

Matches the five `/council` modes. **Local-only:** Codex plugin and Cursor Agent cannot run in Claude Code cloud/web mode. If those tools are missing, stop — do **not** replace missing models with same-model role-play.

1. **Mode 1 — Diverge** — Orchestrator writes `00-brief.md`, seed research `01-deep-research.md`, and a wide seed set `02-divergent-seeds.md` (≥25 mechanism-distinct seeds; Idea Cascade / anti-clustering levers). Judgement off.
2. **Mode 2 — Independent deep dive** — Materialize read-only prompts under `prompts/`. Fan Cursor seats with `cursor-panel.sh --seat` into `panel/` (`outputs.manifest`). Launch `/codex:review` in the same operator turn when tools can run concurrently. Provenance header required before listing Codex. `git status` before/after. No model sees other panel answers yet.
3. **Mode 3 — Cross-pollinate** — Orchestrator runs §4 → `03-cross-pollination.md` from `panel/outputs.manifest` only.
4. **Mode 4 — Adversarial** — Codex adversarial (§5) + Cursor red team via `cursor-panel.sh --seat` into `panel/adversarial/` (§5).
5. **Mode 5 — Converge** — Orchestrator runs §6 → `04-synthesis.md` from both manifests, then ledger curation (§7) → `LEDGER.md`.

Manual drivers: paste prompts from this file. Skill drivers: `/council` owns the lifecycle; `/ideate` only routes Recipe 5 here. Theory siblings: [03](03-combinatorial-creativity.md) for blending, [04](04-llm-divergence-techniques.md) for why simulated panels are not enough, [05](05-prompt-library.md) Recipe 5 for the composed session wrapper.
