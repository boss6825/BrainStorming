# 07 · Multi-Model Panel (Council)

Real heterogeneous models, not a costume change inside one LLM. Toolkit [`04`](04-llm-divergence-techniques.md) shows how to *simulate* a panel (PanelGPT, persona rotation, Tree-of-Thoughts). This file is what you run when you actually have **Claude + Codex + Cursor CLI** (Grok, GPT, Gemini, Composer, …) and you want them to disagree long enough to be useful.

Operator: `/council` (`.claude/skills/council/`). Cursor mechanics: `/ask-cursor`. Session files: `council/_template/`. Phase 2 API product is **not** this file — see `docs/ROADMAP-api-mode.md`.

> **The diversity trap still applies.** Five vendors given the same generic prompt will still cluster. Different weights help; they do not replace no-repeat rules, specific personas, and cross-domain forcing. **Majority vote makes it worse** — the fluent center gets three votes.

**Contents**
1. [Why a real panel](#1-why-a-real-panel) · 2. [The five modes](#2-the-five-modes) · 3. [Assigning seats](#3-assigning-seats) · 4. [Read-only panel prompt](#4-read-only-panel-prompt) · 5. [Cross-pollination merge](#5-cross-pollination-merge) · 6. [Adversarial pass](#6-adversarial-pass) · 7. [Convergence](#7-convergence) · 8. [Ledger governance](#8-ledger-governance) · 9. [`--force` and git](#9---force-and-git) · 10. [What not to do](#10-what-not-to-do)

---

## 1. Why a real panel

A single model (even with PanelGPT) samples one prior. Cross-pollination as humans do it needs **independent deep-dives** that can be wrong in *different* ways, then a deliberate blend (toolkit [`03`](03-combinatorial-creativity.md) — Conceptual Blending, Bisociation). Council is that loop with files on disk so nothing has to be held in one context window.

Prompts here stay portable: the same text can be pasted into a chat, passed to `scripts/cursor-panel.sh`, or (later) sent to an API. Do not bake in vendor-only tool calls.

## 2. The five modes

Keep them separate. Label which one you are in.

1. **Diverge** — Opus (or the orchestrator) writes a wide seed set (`02-divergent-seeds.md`).
2. **Deep-dive** — each seat researches from its prior (`panel/<label>.md`), in parallel. Cursor seats via `cursor-panel.sh` (`--seat` when personas differ). Launch the Codex seat in the same operator turn when concurrent tools are available; otherwise serialize and say so.
3. **Cross-pollinate** — blend *across* seats (`03-cross-pollination.md`).
4. **Adversarial** — Codex adversarial review + a Cursor red-team pass.
5. **Converge** — score, red-team #1, verdict including KILL (`04-synthesis.md` + curator `LEDGER.md`).

## 3. Assigning seats

Specific personas beat "an expert." Rotate **clashing** modes from [`02`](02-neurodivergent-thinking-modes.md) and [`04`](04-llm-divergence-techniques.md). Framing: **cognitive-style-inspired thinking modes, not clinical claims, diagnoses, or stereotypes**, and no mode simulates a real person.

```
Assign Council seats for: {challenge}
Constraints: {constraints}
Available Cursor model ids (from `cursor-agent --list-models` only): {ids}
Codex: use the local default model; do not invent an id.

Pick 3–5 seats. For each:
- exact model id (or "codex-default")
- a specific persona (domain + bias, not a celebrity)
- one toolkit-02 or toolkit-04 mode that does not repeat across seats
- which seeds (S-xx) it owns or whether it sees the full set

Refuse generic seats ("the engineer", "the expert"). Name the disagreement you
expect between seats. Do not majority-weight later just because more seats
share a vendor.
```

## 4. Read-only panel prompt

Use this as the body for `cursor-panel.sh --prompt-file` (shared `--model` seats) or as the common contract inside each `prompts/seat-*.md` passed to `--seat`. For deliberately distinct personas, **use `--seat`** — one prompt file per seat. Keep the contract identical; vary the persona header.

Prompt files live in the session `prompts/` directory, not in `panel/`. Distinct personas:

```
./scripts/cursor-panel.sh \
  --seat {id} council/{slug}/prompts/seat-a.md \
  --seat {id} council/{slug}/prompts/seat-b.md \
  --out-dir council/{slug}/panel
```

**Read-only. Do not modify the repository or any files.** `--force` is an implementation detail of the CLI, not permission to edit.

Do **not** ask for hidden chain-of-thought, internal scratchpads, or a token-by-token trace. Ask for the sections below.

```
You are a read-only researcher on a multi-model Council panel.
Do not edit files, run mutating commands, commit, or "improve the repo."
If you have tools, use them only to read. If you cannot research further,
say so under Uncertainty.

Seat persona: {specific persona + toolkit mode}
Challenge / seeds: {brief + S-xx questions}
Hard constraints: {constraints}
Already tried / ruled out: {list}

Answer with these headings only:
1. Conclusions — numbered claims, each one or two sentences.
2. Evidence — for each claim: what supports it, and whether that is first-hand
   from a source you can name vs inference.
3. Assumptions — named, not buried.
4. Uncertainty — what you do not know; confidence low/medium/high per claim.
5. Counterarguments — the strongest case that you are wrong.
6. Concise rationale — one short paragraph of why this angle, not a diary of
   steps.

Rules: no two conclusions may share the same core mechanism; prefer the
non-obvious; do not converge or score yet; do not flatten disagreement with
other hypothetical models; do not request or emit hidden chain-of-thought.
```

## 5. Cross-pollination merge

Orchestrator-only (Opus). Inputs are the panel files, cited by path.

```
Cross-pollinate. Judgement is still mostly off: you are combining, not picking
a winner yet.

Read these panel outputs as separate input spaces (do not average them).
Use only files listed in panel/outputs.manifest (model outputs).
Do not read panel/README.md or prompts/:
{cite panel/<label>.md from the manifest}

Using Fauconnier & Turner conceptual blending AND Koestler bisociation:
1. List the distinct mechanisms / frames each model actually used.
2. Produce 5 named blends. Each blend must cite at least two seats, name the
   shared structure, and name an EMERGENT property neither seat had alone.
3. Keep contradictions: where two seats disagree, give both claims an ID and
   say why merging them would be a lie.
4. Flag the 2 blends that are least obvious yet still constrained by
   {constraints}.

For every blend output: conclusions, evidence (paths), assumptions,
uncertainty, counterarguments, concise rationale.
Do not majority-vote. Do not dump raw panel text. Do not ask for hidden
chain-of-thought.
```

## 6. Adversarial pass

Codex: `/codex:adversarial-review` on the front-runners (local plugin). Cursor: same contract as §4 (read-only, git-status before/after) with this body. Launch both in one operator turn when concurrent tool execution is available; otherwise run them sequentially and say that they were serialized.

```
Play devil's advocate on these front-runners: {ideas}.
You are read-only. Do not edit the repo.

1. The 5 strongest arguments AGAINST each.
2. Hidden assumptions, marked shakiest.
3. The scenario where each fails badly.
4. For each objection: a redesign that would survive it, or why it cannot.

Be blunt; do not soften to be agreeable. Conclusions, evidence, assumptions,
uncertainty, counterarguments, concise rationale. No hidden chain-of-thought.
```

## 7. Convergence

Append after blends + adversarial notes (same scorer spirit as [`03` §8](03-combinatorial-creativity.md#8-convergence-wrapper) and [`05`](05-prompt-library.md)):

```
Converge. Judgement ON. Do not be encouraging to be nice.

Score each developed concept 1-5 on novelty, feasibility, and fit to
{goal/constraints}. Table it. Recommend the top 3 with the single biggest
risk each. Red-team #1. Verdict: KILL, PIVOT, or VALIDATE.
If VALIDATE, the single cheapest test that moves this from maybe to yes/no
this week.

Quality-weight the evidence; do not count how many models agreed.
Conclusions, evidence, assumptions, uncertainty, counterarguments, concise
rationale. No hidden chain-of-thought.
```

## 8. Ledger governance

`LEDGER.md` is stigmergic shared memory **by design**. Ungoverned dumps are associated with Memory Curse (more history → worse coordination), collective false belief, and loafing in the stigmergy review — that review **motivates** these Council choices; it does not prove this exact schema.

Curator-only. Compact. Quality-weighted. Contradictions cross-linked, not merged. Raw `panel/` files immutable. Stable IDs. Full entry schema at every status (`stale` / `rejected` / `superseded` included). `review-by` then `stale`. Append-only change log for every transition. **No automatic cross-session reuse.**

Full table lives in `council/_template/LEDGER.md`. When you update a ledger, write a change-log line; never delete an ID.

## 9. `--force` and git

Cursor wrappers call:

```
cursor-agent -p "$prompt" --model "$model" --output-format text --force
```

`--force` can edit the working tree. Council's mitigation is **not** a different flag (do not drop `--force`). It is:

1. `git status` / `git diff --stat` before the panel
2. The read-only prompt in §4
3. `git status` / `git diff --stat` after; restore if the tree moved

## 10. What not to do

- Simulate all seats in one model and label them "Grok" / "Gemini"
- Invent Cursor or Codex model ids
- Ask for hidden chain-of-thought
- Majority-vote the ledger
- Paste panel transcripts into `LEDGER.md`
- Skip git checks because "the prompt said read-only"
- Reuse last session's ledger as silent ground truth
- Converge in the same breath as diverging
