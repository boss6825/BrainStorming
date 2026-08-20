# BrainStorming

A personal thinking system for startup, life, research, AI/ML, and science ideas. Raw thinking, not polished products. The default AI failure mode is fluent, central, and samey (Wharton's diversity trap). This repo is built to fight that.

**[`AGENTS.md`](AGENTS.md)** is the index any coding agent should read first — what exists, what is only a later design, and how to think in this repo (disagree, don't flatter, flag what's wrong).

## Status

**Phase 1 is in the tree and is what you can run today.** Session layout, operator skills, Cursor wrappers, Codex effort config, toolkit method doc, Recipe 5, and this manual are built. Live panel seats still need **local** `cursor-agent` + `codex` (see `/council-setup`).

**Phase 2 is not built.** API-key productization is a design doc only: [`docs/ROADMAP-api-mode.md`](docs/ROADMAP-api-mode.md). Do not treat that file as implemented code.

There are **no live Council sessions** in this repo yet — only `council/_template/`. Copy the template; do not write work into it.

| Built now | Not built / not here |
|---|---|
| Creative-thinking toolkit (`01`–`07`) and `/ideate` | Phase 2 API orchestrator / provider adapters |
| `/council` scaffolding, templates, ledger schema | Cloud/web execution of Cursor or Codex seats |
| `scripts/cursor-agent.sh` + `cursor-panel.sh` (mock-tested) | Simulated “Grok/Gemini/Codex” answers from one model |
| `/council-setup`, `/ask-cursor`, Codex plugin skill names | Automatic reuse of one session’s `LEDGER.md` in another |
| `path-forward/` constraints and `old research on startup ideas/` | |

## How thinking flows

Two operator paths. Do not collapse them.

1. **`/ideate`** — one orchestrator (usually Claude) runs a diverge-then-converge session from the toolkit. Works in local Claude Code **and** cloud/web. Recipes 1–4 live here. Recipe 5 is a hand-off to `/council`, not a fake panel inside one model.
2. **`/council`** — a **heterogeneous** multi-model panel. Real Cursor models and Codex research in parallel; the orchestrator then cross-pollinates, red-teams, and converges. **Panel seats are local Claude Code only.** Cloud/web may copy the template and write prompt files. It must not invent panel outputs.

Diverge and converge stay separate. Judgement is off while generating; scoring happens later. A confident KILL or PIVOT is a successful session.

### `/ideate` recipes

| If you want to… | Run |
|---|---|
| Generate fresh, non-obvious ideas | Recipe 1 — Full Ideation Run |
| Decide whether to kill an idea | Recipe 2 — Kill-the-Idea Red Team |
| Understand a space and find whitespace | Recipe 3 — Research-a-Space |
| Break a plateau / go unusually deep | Recipe 4 — Deep-Tunnel Lens Sweep |
| Combine two specific things | Conceptual Blending / Bisociation (toolkit `03`) |
| Get **independent** models to disagree in parallel | Recipe 5 → `/council` (toolkit `07`) |

Hard constraints often already live in [`path-forward/`](path-forward/). Reuse them; do not re-invent them.

## Council pipeline

Sessions live at `council/YYYY-MM-DD-slug/`, copied from `council/_template/`. Stage order in `00-brief.md`:

`brief` → `research` → `diverge` → `panel` → `cross-pollinate` → `adversarial` → `converge` → `complete` (or `blocked`)

| Mode | What happens | Artifact |
|---|---|---|
| Brief | Goal, constraints, kill criteria, panel plan | `00-brief.md` |
| Research | Orchestrator seed research | `01-deep-research.md` |
| 1. Diverge | Wide, mechanism-diverse seeds; judgement off | `02-divergent-seeds.md` |
| 2. Deep-dive panel | Independent Cursor + Codex passes, in parallel | `panel/<label>.md`, `panel/codex-<slug>.md`, `panel/outputs.manifest` |
| 3. Cross-pollinate | Conceptual Blending & Bisociation across **those** outputs | `03-cross-pollination.md` |
| 4. Adversarial | `/codex:adversarial-review` + Cursor red-team | `panel/adversarial/` + `panel/adversarial/outputs.manifest` |
| 5. Converge | Score novelty × feasibility × fit; honest KILL / PIVOT / VALIDATE | `04-synthesis.md`, `LEDGER.md` |

Do not skip diverge→converge boundaries. Do not simulate missing models. Do not score during divergence or cross-pollination.

### Session layout

```text
council/YYYY-MM-DD-slug/
├── 00-brief.md
├── 01-deep-research.md
├── 02-divergent-seeds.md
├── prompts/                  # shared + per-seat prompts (not panel evidence)
├── panel/
│   ├── outputs.manifest      # initial deep-dive seats only (authoritative)
│   ├── <label>.md
│   ├── codex-<slug>.md
│   └── adversarial/
│       ├── outputs.manifest  # red-team seats only
│       └── …
├── 03-cross-pollination.md
├── 04-synthesis.md
└── LEDGER.md
```

`panel/README.md` is documentation, not a seat. Cross-pollination reads **`panel/outputs.manifest` only** — not a glob, not `prompts/`, not `panel/adversarial/`. Synthesis reads that manifest **and** `panel/adversarial/outputs.manifest`.

## Tools

| Tool | Role |
|---|---|
| Claude Opus | Orchestrates research, divergence, cross-pollination, convergence, **curator-only ledger writes** |
| `/ideate` | Single-orchestrator structured ideation (Recipes 1–4) |
| `/council` | Heterogeneous local multi-model session (Recipe 5) |
| Creative Thinking Toolkit | Theory, paste-ready prompts, techniques, recipes (`01`–`07`) |
| Codex plugin | Independent review, adversarial review, and rescue (`/codex:review`, `/codex:adversarial-review`, `/codex:rescue`) |
| `/ask-cursor` + `scripts/` | One-model or parallel Cursor bridge (`cursor-agent.sh` / `cursor-panel.sh`) |
| `/council-setup` | Local readiness check for `cursor-agent` + `codex` + plugin skills + wrappers |

## One-time local setup

Council's panel **cannot** run in Claude Code cloud/web. On the local machine:

1. Install and authenticate **Cursor Agent** (`cursor-agent`). Use Cursor's current official sign-in flow — do not invent a login flag.
2. Install the **Codex CLI** and the `openai/codex-plugin-cc` plugin through its supported local plugin flow. Authenticate with `codex login` if needed.
3. Confirm:

```bash
command -v cursor-agent
cursor-agent --version
cursor-agent --list-models

command -v codex
codex --version
codex login status
```

`--version` only proves the binary runs. Cursor is usable when `--list-models` returns a **non-empty** id list. Model IDs come from that list, not from display names. Do not invent a Codex model id; inherit the local default. [`.codex/config.toml`](.codex/config.toml) sets reasoning effort only.

4. In local Claude Code, run **`/council-setup`**. Ready means: Cursor discovery works, Codex is authenticated (or verified via the plugin), `/codex:review`, `/codex:adversarial-review`, and `/codex:rescue` are present, and the repo wrappers are executable. Do not guess readiness from install alone.

[`.claude/settings.json`](.claude/settings.json) allow-lists the wrappers plus exact discovery/version commands. It does not grant unrestricted `cursor-agent *` or `codex *`.

## Run a Council session

```text
/council Explore {question}.
Goal: {decision or output}.
Constraints: {hard constraints}.
Already tried or ruled out: {angles}.
```

Typical sequence:

1. `/council-setup`
2. `/council {question}` — creates `council/YYYY-MM-DD-slug/` from `_template/`, fills the brief, then advances stages
3. `/council resume council/{YYYY-MM-DD-slug}` — continue from `Current stage` without overwriting completed work

Cursor fan-out after **read-only** prompt files exist under `prompts/` (use `--seat` when personas differ):

```bash
./scripts/cursor-panel.sh \
  --seat <id-from-list-models> council/<slug>/prompts/seat-a.md \
  --seat <id> council/<slug>/prompts/seat-b.md \
  --out-dir council/<slug>/panel
```

Same prompt on every Cursor seat: `--model <id> --model <id> --prompt-file council/<slug>/prompts/shared.md`. `--model` and `--seat` may be combined. `cursor-agent.sh` raw `--out` is fine for a one-off `/ask-cursor` query; it is **not** provenance-complete panel evidence.

Launch the Codex seat in the **same operator turn** when tools can run concurrently; otherwise serialize and say so. Save Codex as `panel/codex-<slug>.md` with the documented provenance header, then append that basename to `panel/outputs.manifest`. A raw plugin dump is not provenance-complete.

Exact CLI contract (do not "improve" the flags):

```bash
cursor-agent -p "$prompt" --model "$model" --output-format text --force
```

**`--force` can edit the working tree.** Panel prompts must tell models to stay read-only. `git status` (and `git diff --stat`) **before and after**. Unexpected diffs → stop, restore, do not cross-pollinate yet.

`--resume` skips a seat only when the existing file is a non-empty regular file whose `| Model (exact) | \`id\` |` header matches the requested model exactly. Empty files are rerun. Missing or mismatched provenance is refused, not overwritten. `--overwrite` replaces a regular seat file after a successful child; it cannot combine with `--resume`. Failed children are **not** published as evidence. Later Cursor runs merge retainable prior manifest entries (including Codex artifacts that still exist as safe relative files).

Cursor red-team uses `--out-dir council/<slug>/panel/adversarial` (own manifest). Keep the main `panel/outputs.manifest` limited to the initial deep-dive. Codex adversarial lands under `panel/adversarial/` the same way.

Ask models for **conclusions, evidence, assumptions, uncertainty, counterarguments, and a concise rationale** — never hidden chain-of-thought.

One failed Cursor seat does not discard successful siblings. Cross-pollination still needs **≥2 distinct Cursor lenses** plus a provenance-complete Codex deep-dive. Completing a session also requires both Codex and Cursor adversarial findings. Partial panels are usable; silent omissions are not.

`LEDGER.md` is curator-only, quality-weighted, session-local. Contradictions stay separate and cross-linked. Stale entries do not drive new decisions. Panel models never write it.

Mock tests for the wrappers (no live Cursor): `scripts/tests/test-cursor-scripts.sh`.

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
| [`AGENTS.md`](AGENTS.md) | Critical-thinker stance + full index (read this first if you are an agent) |
| [`PLAN.md`](PLAN.md) | Council design spec (Phase 1 built; Phase 2 is a later API product) |
| [`creative-thinking-toolkit/`](creative-thinking-toolkit/) | Prompt library and methods (`01` frameworks → `07` Council) |
| [`.claude/skills/ideate/`](.claude/skills/ideate/) | Operator for Recipes 1–4; dispatches Recipe 5 to `/council` |
| [`.claude/skills/council/`](.claude/skills/council/) | Session lifecycle, five modes, completion gates |
| [`.claude/skills/ask-cursor/`](.claude/skills/ask-cursor/) | Cursor CLI bridge (one model or parallel fan-out) |
| [`.claude/skills/council-setup/`](.claude/skills/council-setup/) | Local readiness check |
| [`council/`](council/) | `_template/` + session workspace; [`council/README.md`](council/README.md) is the operator guide |
| [`scripts/`](scripts/) | `cursor-agent.sh`, `cursor-panel.sh`, `cursor-common.sh`; mock tests under `scripts/tests/` |
| [`path-forward/`](path-forward/) | Personal constraints, 90-day plan, validation, idea bank, job/cofounder/ADHD notes |
| [`old research on startup ideas/`](old%20research%20on%20startup%20ideas/) | Prior idea dump, grants/fellowships, stigmergy/memory review that **motivates** ledger rules |
| [`docs/ROADMAP-api-mode.md`](docs/ROADMAP-api-mode.md) | Phase 2 API-mode design only — not implemented |
| [`.github/PULL_REQUEST_TEMPLATE.md`](.github/PULL_REQUEST_TEMPLATE.md) | PR form GitHub pre-fills with this repo's review gates |
| [`docs/how-to-write-a-pr-template.md`](docs/how-to-write-a-pr-template.md) | How to derive a project-specific PR template |
| [`.claude/settings.json`](.claude/settings.json) | Wrapper + exact CLI allow-rules |
| [`.codex/config.toml`](.codex/config.toml) | Codex reasoning effort only |
