---
name: council
description: >-
  Orchestrator for Council, the multi-model panel of experts in this repo.
  Use WHENEVER the user wants a heterogeneous LLM panel, a Council session,
  parallel deep-dives via Cursor CLI and Codex, cross-pollination across
  models, or a governed ledgered research/ideation run — even if they say
  "panel", "fan out", "ask grok/gemini/codex too", or "Recipe 5". Prefer this
  over simulating a panel inside a single model. Local Claude Code only for
  the Cursor/Codex seats; cloud mode can still prepare the session folder.
---

# Council — orchestrator

Your job is to run a **real** multi-model panel, not a costume change inside one model. Simulated PanelGPT (toolkit [`04`](../../../creative-thinking-toolkit/04-llm-divergence-techniques.md)) is a fallback only when Cursor/Codex are unavailable; say so if you fall back.

Theory and paste-ready prompts: [`creative-thinking-toolkit/07-multi-model-panel.md`](../../../creative-thinking-toolkit/07-multi-model-panel.md). Session files: [`council/_template/`](../../../council/_template/). How-to: [`council/README.md`](../../../council/README.md). Cursor mechanics: [`ask-cursor`](../ask-cursor/SKILL.md). Local binaries: [`council-setup`](../council-setup/SKILL.md).

Do **not** inline those templates here. Read them when you need the full prompt.

## Two rules that still apply

1. **Diverge, then converge — never both at once.** Label the mode you are in.
2. **Fight the diversity trap.** Different model vendors are the diversity lever. Still apply no-repeat / make-it-weirder / distinct personas. Do not let five models answer the same generic prompt and call it a panel.

Also: **quality-weighted ledger, never majority vote.** See `council/_template/LEDGER.md`.

## Hidden chain-of-thought is forbidden

Never ask a model to dump hidden chain-of-thought, internal scratchpads, or "every token you thought." Ask for **conclusions, evidence, assumptions, uncertainty, counterarguments, and a concise rationale.**

## `--force` + git (non-negotiable)

Cursor is invoked as:

```bash
cursor-agent -p "$prompt" --model "$model" --output-format text --force
```

`--force` can edit the repo. Before any `cursor-agent.sh` / `cursor-panel.sh` call:

1. Run `git status` and `git diff --stat`. Record the baseline in `00-brief.md`.
2. Use the **read-only panel prompt** from toolkit `07`. The model is a researcher. It must not patch, create files, commit, or "tidy the repo."
3. After the fan-out, `git status` / `git diff --stat` again. If the tree changed unexpectedly, **stop**, report, restore, and do not cross-pollinate until the tree is understood.

## Session lifecycle

1. If `codex` / `cursor-agent` might be missing, run [`council-setup`](../council-setup/SKILL.md) first (or tell the user to).
2. Copy the template (do not invent a parallel layout):

   ```bash
   cp -R council/_template council/YYYY-MM-DD-slug
   ```

3. Fill `00-brief.md` (goal, constraints, already-tried, success test). Reuse `path-forward/` constraints when this is a real decision.
4. Run the five modes below, writing the matching files. Skip a mode only if the user explicitly wants a partial run.
5. Curate `LEDGER.md` yourself (Opus/operator). Panel models never write it.
6. Land: top 2–3 concepts + cheapest next test, or a KILL, plus ledger IDs.

Session path: `council/YYYY-MM-DD-slug/`.

## Mode 1 — Diverge (Opus)

Write `02-divergent-seeds.md` (and `01-deep-research.md` if the space is not already mapped). Use toolkit `07` § diverge + generators from `01`–`04`. Judgement off. Unique mechanisms. Seeds later in the list weirder than the first.

If the user asked `/ideate` to research a space, you may run Recipe 3 first as `01-deep-research.md`, then diverge.

## Mode 2 — Deep-dive (the panel)

This is the parallel deepening and the wall-clock saver.

1. Discover Cursor ids with `cursor-agent --list-models` (never invent an id).
2. Assign **distinct** personas/modes (toolkit `02` / `04` / `07`) to seats. Specific beats generic. Cognitive-style-inspired, not clinical, not a stereotype, not a real person.
3. Materialize prompts under `prompts/`, **not** under `panel/`. Use `prompts/shared.md` for the shared contract and one `prompts/seat-<label>.md` per Cursor seat that needs a distinct persona (toolkit `07` §4). `--seat` is required whenever personas are deliberately different.
4. Fan out Cursor seats (all `--seat` / `--model` children launch concurrently):

   ```bash
   ./scripts/cursor-panel.sh \
     --seat <id> council/YYYY-MM-DD-slug/prompts/seat-<label>.md \
     --seat <id> council/YYYY-MM-DD-slug/prompts/seat-<label>.md \
     --out-dir council/YYYY-MM-DD-slug/panel
   ```

   Shared prompt only (no persona split): `--model <id> --model <id> --prompt-file council/YYYY-MM-DD-slug/prompts/shared.md`. Combining `--model` and `--seat` is allowed; only `--model` seats need the shared prompt. Use `--resume` to fill missing seats: skip only when the existing file is a **non-empty regular** file whose header has an **exact** matching `| Model (exact) | \`id\` |` line for the requested model. Empty regular files are rerun. A non-empty regular file that lacks or mismatches that provenance is refused (not skipped, not overwritten). Directories/symlinks are refused. `--overwrite` only when the operator means to replace a regular seat file. `outputs.manifest` is authoritative: each `cursor-panel.sh` publication merges retainable prior entries (including manually recorded Codex artifacts that are safe relative basenames naming existing non-empty regular non-symlink files) with this run's published or resume-skipped seats, drops stale/unsafe/traversal/absolute paths, and removes duplicates.
5. **Launch Codex in the same operator turn as the Cursor fan-out** when the runtime can execute tools concurrently (parallel tool calls in one message: `cursor-panel.sh` + `/codex:review` or a fresh Codex turn). If this environment serializes tool calls, say so and run them back-to-back — do not claim wall-clock overlap that did not happen. Save Codex as `panel/codex-<slug>.md` **with the documented provenance header** from `council/_template/panel/README.md` (exact local model id + exact plugin invocation). Only then append that basename to `panel/outputs.manifest`. A raw plugin dump is **not** provenance-complete. Do not invent a Codex model id; inherit the local default from `.codex/config.toml` (effort only) / the plugin.
6. Confirm every published Cursor seat file records **exact model provenance** (`| Model (exact) | \`id\` |`). Treat `panel/outputs.manifest` as the list of initial model outputs. `panel/README.md` is not a seat. Do not use `cursor-agent.sh` raw `--out` as panel evidence.

If Cursor/Codex cannot run (cloud mode), write the prompt files under `prompts/`, stop, and tell the user to finish Mode 2 locally.

## Mode 3 — Cross-pollinate (Opus)

Read **only** the files listed in `panel/outputs.manifest` (initial deep-dive model outputs). Do not read `panel/README.md`, `prompts/`, or `panel/adversarial/` (that pass has not run yet). If the manifest is missing, stop and say so — do not glob `panel/*.md`. Write `03-cross-pollination.md` using Conceptual Blending / Bisociation (toolkit `03` + `07` merge prompt). Keep contradictions visible and cross-linked. Do not average.

## Mode 4 — Adversarial

Launch `/codex:adversarial-review` and the Cursor devil's-advocate pass **in the same operator turn** when concurrent tool execution is available; otherwise run them back-to-back and say that they were serialized. Cursor red-team still uses toolkit `07` (read-only, git-status before/after). **Always** run it through `cursor-panel.sh --seat` into a dedicated directory so the files receive cursor-panel provenance — never `cursor-agent.sh` raw `--out`:

```bash
./scripts/cursor-panel.sh \
  --seat <id> council/YYYY-MM-DD-slug/prompts/seat-<label>-adversarial.md \
  --out-dir council/YYYY-MM-DD-slug/panel/adversarial
```

That writes `panel/adversarial/outputs.manifest`. Keep the main `panel/outputs.manifest` limited to the initial deep-dive. Save Codex `/codex:adversarial-review` as `panel/adversarial/codex-<slug>.md` (or similar) with the documented provenance header, then add that basename to `panel/adversarial/outputs.manifest`. Drop notes into `04-synthesis.md`.

## Mode 5 — Converge (Opus)

Write `04-synthesis.md`: score novelty × feasibility × fit, red-team #1, verdict **KILL / PIVOT / VALIDATE**. Consume blends plus **initial** model outputs in `panel/outputs.manifest` **and** Cursor/Codex red-team outputs in `panel/adversarial/outputs.manifest` (not `panel/README.md`, not prompts, not raw `cursor-agent.sh` files). If the adversarial manifest is missing, say so and do not glob. Then update `LEDGER.md` as curator: compact claims with the **full entry schema** at every status (`active` / `contested` / `stale` / `retracted` / `rejected` / `superseded`), quality notes, `review-by`, contradictions, append-only change log for every transition. Never copy panel bodies into the ledger. Never reuse this ledger automatically in a later session.

## Routing vs `/ideate`

`/ideate` still owns single-model diverge→converge. If the user wants **other vendors in parallel**, switch to this skill (Recipe 5). Do not build a second toolkit.

## Guardrails

- Honesty over enthusiasm. Flag uncertainty so the user can verify.
- Neurodivergent-mode language from toolkit `02`: cognitive-style-inspired, not clinical.
- Do not flatten disagreement to keep the session "clean."
- Do not ask models to modify the repo.
