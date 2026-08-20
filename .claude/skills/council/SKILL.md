---
name: council
description: >-
  Run or resume a local, ad-hoc multi-model Council session that preserves
  divergence, fans independent deep dives across Cursor and Codex, cross-pollinates
  their findings, adversarially reviews candidates, and converges to an honest
  KILL, PIVOT, or VALIDATE verdict. Use WHENEVER the user wants a heterogeneous
  LLM panel, "panel", "fan out", "ask grok/gemini/codex too", or Recipe 5.
  Local Claude Code for Cursor/Codex seats; cloud/web may scaffold files but
  must not simulate missing members.
---

# Council — multi-model session orchestrator

Operator skill for a diverge → independent panel → cross-pollinate → adversarial →
converge session. Full prompt templates live in
[`creative-thinking-toolkit/07-multi-model-panel.md`](../../../creative-thinking-toolkit/07-multi-model-panel.md)
(Recipe 5 in [`05`](../../../creative-thinking-toolkit/05-prompt-library.md)). Blending
methods: [`03`](../../../creative-thinking-toolkit/03-combinatorial-creativity.md). Panel /
persona precedent: [`04`](../../../creative-thinking-toolkit/04-llm-divergence-techniques.md).
Ledger policy: [`council/_template/LEDGER.md`](../../../council/_template/LEDGER.md).
Cursor mechanics: [`ask-cursor`](../ask-cursor/SKILL.md). Local binaries: [`council-setup`](../council-setup/SKILL.md).

This file is *how to run*. Do not inline those prompts here.

## Two rules that still apply

1. **Diverge, then converge — never both at once.** Label the mode you are in.
2. **Fight the diversity trap.** Different model vendors are the diversity lever. Still apply no-repeat / make-it-weirder / distinct personas. Do not let five models answer the same generic prompt and call it a panel.

Also: **quality-weighted ledger, never majority vote.**

## Hidden chain-of-thought is forbidden

Never ask a model to dump hidden chain-of-thought, internal scratchpads, or "every token you thought." Ask for **conclusions, evidence, assumptions, uncertainty, counterarguments, and a concise rationale.**

## Execution boundary

- **Local Claude Code for panel seats.** Codex plugin and `cursor-agent` are not available in Claude Code cloud/web. Cloud/web **may** copy `_template/`, fill the brief, and write prompt files. It must **not** invent panel outputs or role-play missing Cursor/Codex members.
- **Never simulate a missing panel member** with Opus. A missing member is a disclosed gap or a blocked session.
- **Never expose one panel member's answer to another during Mode 2.**
- Run `/council-setup` before any external Cursor/Codex work.
- Use actual model IDs from `cursor-agent --list-models`. Do not invent CLI IDs. Do not invent a Codex model id; inherit the local default (`.codex/config.toml` sets effort only).
- Drive Codex via plugin skills only: `/codex:review`, `/codex:adversarial-review`, `/codex:rescue`.

## `--force` + git (non-negotiable)

Cursor is invoked as:

```bash
cursor-agent -p "$prompt" --model "$model" --output-format text --force
```

`--force` can edit the repo. Before any `cursor-agent.sh` / `cursor-panel.sh` call:

1. Run `git status` and `git diff --stat`. Record the baseline in `00-brief.md`.
2. Use the **read-only** Mode 2/4 prompts from toolkit `07`. The model is a researcher. It must not patch, create files, commit, or "tidy the repo."
3. After the fan-out, `git status` / `git diff --stat` again. If the tree changed unexpectedly, **stop**, report, restore, and do not cross-pollinate until the tree is understood.

## Before starting

1. Confirm whether this environment can run `cursor-agent` / Codex. If cloud/web: scaffold only, then stop before Mode 2.
2. Run `/council-setup` when local tools might be missing.
3. Decide: **new session** or **resume** an existing `council/YYYY-MM-DD-slug/` folder.

## New session

1. **Slug.** Lowercase topic words; replace each run of non-`[a-z0-9]` with `-`; collapse repeated hyphens; trim leading/trailing hyphens. Empty fallback: `session`.
2. **Folder.** `council/YYYY-MM-DD-slug` using the local date. On collision, append `-2`, `-3`, … — **never overwrite**.
3. **Scaffold.**

   ```bash
   cp -R council/_template "council/YYYY-MM-DD-slug"
   ```

4. **Brief.** Fill `00-brief.md` (goal, hard constraints, angles already tried / ruled out, kill criteria). Ask the user only if something material is missing.
5. **Model discovery.** Run `cursor-agent --list-models`. Map actual IDs to default roles from toolkit `07`. If a family is unavailable, record a **deliberate reassignment** in the brief. If fewer than **two distinct Cursor lenses** are available, or Codex is unavailable → mark the session **blocked** (local run) or stop after prompts (cloud).
6. Set `Current stage` in `00-brief.md` and proceed through the modes.

## Resume a session

1. Open the existing session folder. Read `00-brief.md` (including Current stage) and which artifacts already exist.
2. **Never overwrite** substantive completed stages.
3. Continue at the **first incomplete gate**. Retry failed Cursor seats with `cursor-panel.sh --resume` (exact provenance match) or `--seat` into empty/missing files. Do not re-run successful seats.
4. Update `Current stage` after each durable stage lands.

## Mode 1 — Research and diverge

1. Write `01-deep-research.md` (Opus seed research). Consult only **relevant non-stale** prior ledger entries the operator explicitly cites — do not dump whole histories.
2. Write `02-divergent-seeds.md` with **≥25 mechanism-distinct** seeds. Use toolkit diversity levers (`07`, `02`, `04`); judgement off; no scoring yet. Later seeds weirder than the first.
3. Update `Current stage`.

## Mode 2 — Independent deep-dive panel

1. Assign **distinct** personas/lenses (toolkit `02` / `04` / `07`) to seats. Specific beats generic. Cognitive-style-inspired, not clinical.
2. Materialize prompts under `prompts/`, **not** under `panel/`. Use `prompts/shared.md` for the shared contract and one `prompts/seat-<label>.md` per Cursor seat that needs a distinct persona. `--seat` is required whenever personas are deliberately different.
3. Fan out Cursor seats (all `--seat` / `--model` children launch concurrently):

   ```bash
   ./scripts/cursor-panel.sh \
     --seat <id> council/YYYY-MM-DD-slug/prompts/seat-<label>.md \
     --seat <id> council/YYYY-MM-DD-slug/prompts/seat-<label>.md \
     --out-dir council/YYYY-MM-DD-slug/panel
   ```

   Shared prompt only: `--model <id> --model <id> --prompt-file council/YYYY-MM-DD-slug/prompts/shared.md`. Combining `--model` and `--seat` is allowed. `--resume` skips only on an exact matching `| Model (exact) | \`id\` |` header. Empty regular files are rerun. Missing/mismatched provenance is refused. Directories/symlinks are refused. `--overwrite` only when the operator means to replace a regular seat file. `outputs.manifest` is authoritative: later runs merge retainable prior entries (including Codex artifacts with documented headers) and drop stale/unsafe paths.
4. **Launch Codex in the same operator turn** when tools can run concurrently. If serialized, say so. Save Codex as `panel/codex-<slug>.md` **with the documented provenance header**, then append that basename to `panel/outputs.manifest`. A raw plugin dump is not provenance-complete.
5. Confirm every published Cursor seat records exact model provenance. `panel/README.md` is not a seat. Do not use `cursor-agent.sh` raw `--out` as panel evidence.

**Panel gate.** Continue after **one** Cursor failure only if **≥2 distinct Cursor lenses** succeeded **and** Codex succeeded (provenance-complete). Otherwise mark **blocked**; retry only the failed members. Do not proceed to Mode 3 while blocked. Successful artifacts stay; failed seats are not published as evidence.

If Cursor/Codex cannot run (cloud), write the prompt files under `prompts/`, stop, and tell the user to finish Mode 2 locally.

## Mode 3 — Cross-pollinate

Read **only** the files listed in `panel/outputs.manifest`. Do not read `panel/README.md`, `prompts/`, or `panel/adversarial/`. If the manifest is missing, stop — do not glob `panel/*.md`. Write `03-cross-pollination.md` using Conceptual Blending / Bisociation (toolkit `03` + `07`) with **≥6 candidates**: **≥3 blends** + **≥3 bisociations**. Every candidate must cite **≥2 source panel files**. Keep contradictions visible. No scoring.

## Mode 4 — Adversarial

Launch `/codex:adversarial-review` and the Cursor devil's-advocate pass **in the same operator turn** when concurrent tools are available; otherwise serialize and say so. **Always** run Cursor red-team through `cursor-panel.sh --seat` into a dedicated directory:

```bash
./scripts/cursor-panel.sh \
  --seat <id> council/YYYY-MM-DD-slug/prompts/seat-<label>-adversarial.md \
  --out-dir council/YYYY-MM-DD-slug/panel/adversarial
```

That writes `panel/adversarial/outputs.manifest`. Keep the main `panel/outputs.manifest` limited to the initial deep-dive. Save Codex adversarial as `panel/adversarial/codex-<slug>.md` with the documented provenance header, then add that basename to `panel/adversarial/outputs.manifest`. If Codex adversarial fails, attempt `/codex:rescue` **once**. If still unusable, stop before final convergence and mark blocked. Drop notes into `04-synthesis.md` — do not mutate `03-cross-pollination.md` after the fact.

## Mode 5 — Converge and update the ledger

Only if **Completion gates** are met. Do not fake a synthesis.

1. Write `04-synthesis.md`: score novelty × feasibility × fit; red-team #1; honest **KILL / PIVOT / VALIDATE**; single cheapest decisive test. Consume blends plus **initial** outputs in `panel/outputs.manifest` **and** red-team outputs in `panel/adversarial/outputs.manifest`.
2. **Disclose** any missing default panel members.
3. Curate `LEDGER.md` as curator: full schema at every status, quality notes, `review-by`, contradictions, append-only change log. Never copy panel bodies. Never reuse this ledger automatically in a later session.
4. Update `Current stage` to complete.

## Completion gates

Do not complete synthesis unless all of the following hold:

- Brief, deep research, and divergent seeds are substantive
- ≥2 successful Cursor outputs from **distinct assigned** lenses, listed in `panel/outputs.manifest`
- Successful Codex deep-dive with documented provenance, listed in that same manifest
- Cross-pollinated candidates each combine ≥2 source files
- Both Codex and Cursor adversarial findings exist in `panel/adversarial/outputs.manifest`
- Synthesis includes scorecard, red-team, verdict, decisive test, and ledger update
- Missing default members are disclosed

## Recovery

| Situation | Action |
|---|---|
| Single Cursor model fails | Do not block siblings; retry that seat with `cursor-panel.sh --resume` or `--seat` |
| Codex deep-dive / adversarial fails | `/codex:rescue` once; if still unavailable, stop before final convergence, mark blocked |
| <2 distinct Cursor lenses succeed | Stop before cross-pollination; mark blocked |
| Cloud/web environment | Scaffold prompts; do not simulate members |
| Resume | Never overwrite completed stages; continue at first incomplete gate |

## Routing vs `/ideate`

`/ideate` still owns single-model diverge→converge. If the user wants **other vendors in parallel**, switch to this skill (Recipe 5). Do not build a second toolkit.

## Guardrails

- Honesty over enthusiasm. Flag uncertainty so the user can verify.
- Neurodivergent-mode language from toolkit `02`: cognitive-style-inspired, not clinical.
- Do not flatten disagreement to keep the session "clean."
- Do not ask models to modify the repo.
