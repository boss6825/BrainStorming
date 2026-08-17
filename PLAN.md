# Plan: A multi-LLM "panel of experts" thinking system

> **Status (Aug 2026):** Phase 1 scaffolding is built in this repo (`council/`, `/council`, `/ask-cursor`, `/council-setup`, `scripts/`, toolkit `07`). This file remains the design spec. Phase 2 is **not** implemented — see [`docs/ROADMAP-api-mode.md`](docs/ROADMAP-api-mode.md).

## Context — what this is and why

You want this repo to be a **thinking system**, not just a notes folder. The method mirrors how humans actually discover things: one researcher goes deep, another goes deep from a different angle, and the breakthrough comes from **cross-pollinating** their findings. LLMs don't do this on their own — a single model collapses to the "average" answer (the Wharton *diversity trap* your `creative-thinking-toolkit` is already built around).

So the system mechanizes divergence with **real heterogeneous models**: Claude Opus does the deep seed research and orchestrates; Codex (OpenAI) and Cursor CLI (Grok, GPT, Gemini, Composer, etc.) each contribute a genuinely different POV in parallel; Opus then blends and converges. It's a panel of experts that debates, disagrees, and refines — and running them in parallel cuts research wall-clock time.

**Phase 1 (this build): ad-hoc, coding-agent driven** — you drive it by invoking skills, we refine the prompts. **Phase 2 (later, out of scope now): API-key automation** into a standalone product. We keep Phase-1 prompts portable so Phase 2 is a swap, not a rewrite.

## The one hard constraint

**Codex plugin and Cursor CLI cannot run in Claude Code *cloud* mode** (this session). They need your local terminal/desktop with `codex` and `cursor-agent` installed and logged in. So this session **builds and commits the repo-side scaffolding**; the actual multi-model runs happen when you open this repo in **local Claude Code**. I'll document the local setup precisely and add a `/council-setup` skill that checks it for you. I can't `/plugin install` or `cursor login` from here, and won't pretend to.

## Defaults chosen

| Decision | Default | Alternatives |
|---|---|---|
| **Name** | **Council** (`council/` folder, `/council` skill) | Hive · Panel · Forge |
| **Structure** | Standalone `/council` execution skill + a new toolkit theory doc, dispatched from `/ideate` (keeps the repo's theory/operator split) | Fold everything into `/ideate` |
| **Setup pre-wiring** | Full — add `settings.json`, `AGENTS.md`, `.codex/config.toml`, `/council-setup` | Scripts + docs only |

## The pipeline (5 modes of thinking)

You drive these ad-hoc; `/council` orchestrates each and writes to a session folder.

1. **Diverge** — Opus generates a deliberately *wide, diverse* seed set (using the toolkit's anti-clustering levers) → `02-divergent-seeds.md`.
2. **Deep-dive (the panel)** — each seed/question fans out to multiple models **in parallel** via Cursor + Codex; each model researches from its own priors/persona → `panel/<model>.md`. This is the brain-like parallel deepening + the time saver.
3. **Cross-pollinate** — Opus reads all panel outputs and combines ideas *across* models using Conceptual Blending & Bisociation (toolkit `03`) → `03-cross-pollination.md`. This is the human-style recombination you emphasized.
4. **Adversarial** — `/codex:adversarial-review` + a Cursor red-team pass pressure-tests the front-runners.
5. **Converge** — Opus scores (novelty × feasibility × fit), red-teams #1, writes an honest verdict (incl. KILL) → `04-synthesis.md`, updates the ledger.

## What gets created

**Workspace / designated folder**
- `council/` with `council/README.md` (how it works) and a `_template/` session skeleton: `00-brief.md`, `01-deep-research.md` (Opus seed doc), `02-divergent-seeds.md`, `panel/`, `03-cross-pollination.md`, `04-synthesis.md`, and **`LEDGER.md`** — a *governed* shared trace. (Sessions live at `council/YYYY-MM-DD-slug/`.)
- The `LEDGER.md` governance rules come straight from your own `stigmergy_memory_llm_swarms_review.md`: curated, quality-weighted, contradictions flagged not silently merged — to dodge the Memory Curse / collective-false-belief failure modes you documented.

**Skills** (`.claude/skills/`)
- `council/SKILL.md` — the orchestrator: session lifecycle, the 5 modes, calls the Cursor bridge + Codex.
- `ask-cursor/SKILL.md` — the Cursor bridge (how to query one model or fan out to many; model discovery via `cursor-agent --list-models`).
- `council-setup/SKILL.md` — verifies `codex` + `cursor-agent` are installed/authed locally (mirrors `/codex:setup`).

**Scripts** (`scripts/`)
- `cursor-agent.sh` — single-model wrapper: `cursor-agent -p "<prompt>" --model <m> --output-format text --force`, prompt from file/stdin, writes to `--out`.
- `cursor-panel.sh` — launches all requested models **in parallel** (background + `wait`), collects each into `panel/<model>.md`. This is the concrete parallelism/time-saving mechanism.

**Config**
- `.claude/settings.json` (checked in) — permission allow-rules so the scripts / `cursor-agent` / `codex` run without prompts locally.
- `AGENTS.md` (repo root) — the "critical thinker" system prompt Cursor/Codex models pick up: present your reasoning, disagree, flag what's wrong, don't flatter.
- `.codex/config.toml` — optional Codex default model/effort.

**Docs**
- Rewrite `README.md` into a small, scannable **user manual**: what the repo is, the pipeline, a tools table (Opus, `/ideate`, `/council`, toolkit, Codex plugin, Cursor bridge), one-time local setup, how to run a session, and the cloud-mode note.
- `creative-thinking-toolkit/07-multi-model-panel.md` — the method doc (per-model persona prompts, cross-pollination merge prompts, governance), matching the existing `NN-topic.md` convention; add a routing row in `/ideate` and a recipe in `05-prompt-library.md`.
- `docs/ROADMAP-api-mode.md` — the Phase-2 API-key productization design (not implemented now).

## Reuses (not duplicating)
Builds directly on `04-llm-divergence-techniques.md` (PanelGPT / Tree-of-Thoughts / persona rotation), `03-combinatorial-creativity.md` (blending/bisociation), `05` recipes + convergence scorer, the diverge→converge discipline, and the stigmergy review's governance safeguards.

## Verification
- In this session: `bash -n scripts/*.sh`, validate `settings.json`/`config.toml`, confirm skill frontmatter matches `/ideate`.
- Locally (you): run `/council-setup`; run one tiny session end-to-end on a throwaway idea to confirm the panel fans out and files land.

## Git
Work stays on `claude/startup-idea-validation-llms-lxslfc`, committed in logical chunks and pushed. No PR unless you ask.
