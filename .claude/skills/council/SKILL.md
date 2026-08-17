---
name: council
description: >-
  Run or resume a local, ad-hoc multi-model Council session that preserves
  divergence, fans independent deep dives across Cursor and Codex, cross-pollinates
  their findings, adversarially reviews candidates, and converges to an honest
  KILL, PIVOT, or VALIDATE verdict. Use when heterogeneous model disagreement and
  governed session artifacts are wanted; requires local Claude Code with
  cursor-agent and the Codex plugin installed and authenticated.
---

# Council — multi-model session orchestrator

Operator skill for a diverge → independent panel → cross-pollinate → adversarial →
converge session. Full prompt templates live in
[`creative-thinking-toolkit/07-multi-model-panel.md`](../../../creative-thinking-toolkit/07-multi-model-panel.md)
(Recipe 5 in [`05`](../../../creative-thinking-toolkit/05-prompt-library.md)). Blending
methods: [`03`](../../../creative-thinking-toolkit/03-combinatorial-creativity.md). Panel /
persona precedent: [`04`](../../../creative-thinking-toolkit/04-llm-divergence-techniques.md).
Ledger governance: [`stigmergy_memory_llm_swarms_review.md`](../../../old%20research%20on%20startup%20ideas/stigmergy_memory_llm_swarms_review.md).

This file is *how to run*. Do not inline those prompts here.

## Execution boundary

- **Local Claude Code only.** Codex plugin and `cursor-agent` are not available in
  Claude Code cloud/web. If you are in cloud/web: report that Council is local-only,
  stop, and do **not** create a fake panel or simulate missing members with Opus.
- **Never simulate a missing panel member** (Cursor or Codex) with Opus. A missing
  member is a disclosed gap or a blocked session — not a role-play.
- **Never expose one panel member's answer to another during Mode 2.** Independent
  deep dives stay independent until Mode 3.
- Run `/council-setup` before any external Cursor/Codex work.
- Use actual model IDs from `cursor-agent --list-models`. Do not invent CLI IDs.
- Point `/ask-cursor` at this session's `panel/` directory.
- Do not invent Codex CLI flags. Drive Codex via plugin skills only:
  `/codex:review`, `/codex:adversarial-review`, `/codex:rescue`.

## Before starting

1. Confirm environment is local (not cloud/web). If cloud/web → stop (see boundary).
2. Run `/council-setup`. Fix anything it reports before continuing.
3. Decide: **new session** or **resume** an existing `council/YYYY-MM-DD-slug/` folder.

## New session

1. **Slug.** Lowercase topic words; replace each run of non-`[a-z0-9]` with `-`;
   collapse repeated hyphens; trim leading/trailing hyphens. Empty fallback: `session`.
2. **Folder.** `council/YYYY-MM-DD-slug` using the local date. On collision, append
   `-2`, `-3`, … — **never overwrite**.
3. **Scaffold.**

   ```bash
   cp -R council/_template "council/YYYY-MM-DD-slug"
   ```

4. **Brief.** Fill `00-brief.md` (goal, hard constraints, angles already tried /
   ruled out). Ask the user only if something material is missing; don't over-interview.
5. **Model discovery.** Run `cursor-agent --list-models`. Map actual IDs to default
   roles from toolkit `07`. If a family is unavailable, record a **deliberate
   reassignment** in the brief. If fewer than **two distinct Cursor lenses** are
   available, or Codex is unavailable → mark the session **blocked** and stop.
6. Set `Current stage` in `00-brief.md` and proceed through the modes.

## Resume a session

1. Open the existing session folder. Read `00-brief.md` (including Current stage)
   and which artifacts already exist.
2. **Never overwrite** substantive completed stages.
3. Continue at the **first incomplete gate**. Retry failed panel members
   individually (see Recovery); do not re-run successful ones.
4. Update `Current stage` after each durable stage lands.

## Mode 1 — Research and diverge

1. Write `01-deep-research.md` (Opus seed research). Consult only **relevant active**
   prior ledger entries — do not dump the whole history into context.
2. Write `02-divergent-seeds.md` with **≥25 mechanism-distinct** seeds. Use toolkit
   diversity levers (`07`, `02`, `04`); judgement off; no scoring yet.
3. Update `Current stage` in `00-brief.md`.

## Mode 2 — Independent deep-dive panel

1. Fill the independent deep-dive prompt from toolkit `07` with the **exact
   runtime model-ID → persona/role** assignments.
2. Fan Cursor models via `/ask-cursor` → `scripts/cursor-panel.sh`, writing into
   this session's `panel/` (sanitized model-id filenames). Preserve failure files.
3. Independently invoke `/codex:review` for Codex's deep dive; save output to
   `panel/codex.md`. Do **not** share Cursor answers with Codex or vice versa.
4. **Panel gate.** Continue after **one** Cursor failure only if **≥2 distinct
   Cursor lenses** succeeded **and** Codex succeeded. Otherwise mark **blocked**;
   retry only the failed members. Do not proceed to Mode 3 while blocked.

## Mode 3 — Cross-pollinate

1. Read **successful** panel files only.
2. Using Conceptual Blending & Bisociation ([`03`](../../../creative-thinking-toolkit/03-combinatorial-creativity.md);
   prompts in `07`), write `03-cross-pollination.md` with **≥6 candidates**:
   **≥3 blends** + **≥3 bisociations**.
3. Every candidate must cite **≥2 source panel files**. No scoring in this mode.
4. Update `Current stage`.

## Mode 4 — Adversarial review

1. Run `/codex:adversarial-review` on the front-runners; save to
   `panel/codex-adversarial.md`.
2. Run one Cursor red-team via `/ask-cursor` →
   `panel/<sanitized-model-id>-red-team.md` (toolkit `07` red-team prompt).
3. If Codex adversarial fails, attempt `/codex:rescue` **once** (recovery, not
   another vote). If still unusable, stop before final convergence and mark blocked.
4. Add a challenge map into `03-cross-pollination.md` (or as specified in `07`).
5. Update `Current stage`.

## Mode 5 — Converge and update the ledger

Only if **Completion gates** are met. Do not fake a synthesis.

1. Write `04-synthesis.md`: score novelty × feasibility × fit; red-team #1;
   honest **KILL / PIVOT / VALIDATE**; single cheapest decisive test.
2. **Disclose** any missing default panel members.
3. Curate `LEDGER.md` per stigmergy governance (quality-weighted; contradictions
   flagged, not silently merged). Archive working/ephemeral entries as appropriate.
4. Update `Current stage` to complete.

## Completion gates

Do not complete synthesis unless all of the following hold:

- Brief, deep research, and divergent seeds are substantive
- ≥2 successful Cursor outputs from **distinct assigned** lenses
- Successful Codex deep-dive (`panel/codex.md`)
- Cross-pollinated candidates each combine ≥2 source files
- Both Codex and Cursor adversarial findings exist
- Synthesis includes scorecard, red-team, verdict, decisive test, and ledger update
- Missing default members are disclosed

## Recovery

| Situation | Action |
|---|---|
| Single Cursor model fails | Do not block other workers; retry only that model with `scripts/cursor-agent.sh` |
| Codex deep-dive / adversarial fails | `/codex:rescue` once; if still unavailable, stop before final convergence, mark blocked |
| <2 distinct Cursor lenses succeed | Stop before cross-pollination; mark blocked |
| Cloud/web environment | Stop before any false panel; do not simulate members |
| Resume | Never overwrite completed stages; continue at first incomplete gate |
