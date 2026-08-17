# BrainStorming

A personal thinking system for startup, life, research, AI/ML, and science ideas. Raw thinking, not polished products. The default AI failure mode is fluent, central, and samey (Wharton's diversity trap). This repo is built to fight that.

**[`AGENTS.md`](AGENTS.md)** is the index any coding agent should read first — what exists, what is only a later design, and how to think in this repo (disagree, don't flatter, flag what's wrong).

## How thinking flows

Two operator paths:

1. **`/ideate`** — one orchestrator (usually Claude) runs a diverge-then-converge session from the toolkit. Always available, including in cloud/web.
2. **`/council`** — a **heterogeneous** multi-model panel. Real Cursor models and Codex research in parallel, then the orchestrator cross-pollinates, red-teams, and converges. **Local Claude Code only.**

Council pipeline (five modes):

| Mode | What happens | Artifact |
|---|---|---|
| 1. Diverge | Wide, mechanism-diverse seeds; judgement off | `02-divergent-seeds.md` |
| 2. Deep-dive panel | Independent Cursor + Codex passes, in parallel | `panel/<model>.md` |
| 3. Cross-pollinate | Conceptual Blending & Bisociation across models | `03-cross-pollination.md` |
| 4. Adversarial | `/codex:adversarial-review` + Cursor red-team | `panel/*-red-team.md`, `panel/codex-adversarial.md` |
| 5. Converge | Score novelty × feasibility × fit; honest KILL / PIVOT / VALIDATE | `04-synthesis.md`, `LEDGER.md` |

Sessions live at `council/YYYY-MM-DD-slug/`. Copy from `council/_template/`. Do not skip diverge→converge boundaries. Do not simulate missing models.

## Tools

| Tool | Role |
|---|---|
| Claude Opus | Orchestrates research, divergence, cross-pollination, and convergence |
| `/ideate` | Single-orchestrator structured ideation and routing |
| `/council` | Heterogeneous local multi-model session |
| Creative Thinking Toolkit | Theory, prompts, techniques, and recipes (`01`–`07`) |
| Codex plugin | Independent review, adversarial review, and rescue (`/codex:review`, `/codex:adversarial-review`, `/codex:rescue`) |
| `/ask-cursor` + `scripts/` | One-model or parallel Cursor bridge (`cursor-agent`) |
| `/council-setup` | Local readiness check for `cursor-agent` + `codex` |

## One-time local setup

Council's panel **cannot** run in Claude Code cloud/web. On the local machine:

1. Install and authenticate **Cursor Agent** (`cursor-agent`). Use Cursor's current official sign-in flow — do not invent a login flag.
2. Install the **Codex CLI** and the `openai/codex-plugin-cc` plugin through its supported local plugin flow. Authenticate with `codex login` if needed.
3. Confirm:

```bash
command -v cursor-agent
cursor-agent --list-models

command -v codex
codex --version
codex login status
```

4. In local Claude Code, run **`/council-setup`**. Do not guess readiness from install alone. Model IDs come from `--list-models`, not from display names.

Optional project defaults: `.codex/config.toml` (Codex model/effort) and `.claude/settings.json` (allow-rules for the scripts / CLIs).

## Run a Council session

```text
/council Explore {question}.
Goal: {decision or output}.
Constraints: {hard constraints}.
Already tried or ruled out: {angles}.
```

Typical sequence:

1. `/council-setup`
2. `/council {question}` — creates `council/YYYY-MM-DD-slug/` from `_template/`
3. `/council resume council/{YYYY-MM-DD-slug}` — continue from `Current stage` without overwriting completed work

Details: [`council/README.md`](council/README.md), skill [`.claude/skills/council/SKILL.md`](.claude/skills/council/SKILL.md), method [`creative-thinking-toolkit/07-multi-model-panel.md`](creative-thinking-toolkit/07-multi-model-panel.md).

For a single-model session (including cloud): `/ideate`.

## Local versus cloud

| | Local Claude Code | Cloud / web |
|---|---|---|
| `/ideate` + toolkit | yes | yes |
| Inspect / edit Council scaffolding | yes | yes |
| `cursor-agent` / Codex plugin panel | yes, if `/council-setup` is green | **no** |

Cloud/web can edit files. It cannot execute the Codex plugin or local Cursor CLI. `/ideate` is **not** a completed Council run.

## Repository map

| Path | What it is |
|---|---|
| [`AGENTS.md`](AGENTS.md) | Critical-thinker stance + full index |
| [`PLAN.md`](PLAN.md) | Council design spec (Phase 1 built; Phase 2 is a later API product) |
| [`creative-thinking-toolkit/`](creative-thinking-toolkit/) | Prompt library and methods |
| [`council/`](council/) | Session workspace + `_template/` |
| [`path-forward/`](path-forward/) | Personal constraints, validation, idea bank |
| [`docs/ROADMAP-api-mode.md`](docs/ROADMAP-api-mode.md) | Phase 2 API-mode design only — not implemented |
