# Council — thinking system

A personal ideation/research space for startup, life, research, AI/ML, and science ideas. Raw thinking, not polished products.

The method is a **panel of experts**: one researcher goes deep, another goes deep from a different angle, and the useful work is **cross-pollinating** their findings. A single LLM will not do this on its own — it collapses to the average answer (Wharton's *diversity trap*). This repo mechanizes that loop.

**[`AGENTS.md`](AGENTS.md)** is the condensed index (what's built vs planned, when to reuse what). Any coding agent here should read it first.

## Pipeline

You drive these ad-hoc with `/council`. Sessions live in `council/YYYY-MM-DD-slug/` (copy `council/_template/`).

1. **Diverge** — wide, diverse seeds (`02-divergent-seeds.md`)
2. **Deep-dive** — Cursor + Codex seats in **parallel** (`panel/<label>.md`)
3. **Cross-pollinate** — blend *across* models, don't average (`03-cross-pollination.md`)
4. **Adversarial** — `/codex:adversarial-review` + a Cursor red-team pass
5. **Converge** — score, red-team #1, honest verdict including KILL (`04-synthesis.md` + governed `LEDGER.md`)

Diverge and converge stay separate. The ledger is **quality-weighted**, never majority-voted. Details: [`council/README.md`](council/README.md), method: [`creative-thinking-toolkit/07-multi-model-panel.md`](creative-thinking-toolkit/07-multi-model-panel.md).

## Tools

| Tool | Where | What it's for |
|---|---|---|
| Opus (orchestrator) | Claude Code | Seed research, diverge, cross-pollinate, converge, **curator-only ledger writes** |
| `/ideate` | `.claude/skills/ideate/` | Single-model diverge→converge using the toolkit (Recipes 1–4) |
| `/council` | `.claude/skills/council/` | Full multi-model session (Recipe 5) |
| `/ask-cursor` | `.claude/skills/ask-cursor/` | One Cursor model or parallel fan-out via the scripts |
| `/council-setup` | `.claude/skills/council-setup/` | Check local `codex` + `cursor-agent` |
| Toolkit | `creative-thinking-toolkit/` | Frameworks, modes, blending, PanelGPT, recipes, **Council method (07)** |
| Codex plugin | local `openai/codex-plugin-cc` | `/codex:review`, `/codex:adversarial-review`, `/codex:rescue` |
| Cursor CLI | `scripts/cursor-agent.sh`, `scripts/cursor-panel.sh` | Headless Grok / GPT / Gemini / Composer / … |
| Decision notes | `path-forward/` | Constraints, validation, idea-bank format |
| Prior research | `old research on startup ideas/` | Including the stigmergy review that **motivated** (not proved) Council ledger design |

## One-time local setup

Codex plugin and Cursor CLI **do not run in Claude Code cloud/web mode**. Use local Claude Code / your desktop.

1. Install and log in to **Cursor CLI** so `cursor-agent` is on PATH.
2. Install and log in to **Codex CLI** (and/or the Codex plugin in local Claude Code).
3. In this repo, run `/council-setup` (or follow that skill's checklist).
4. Discover Cursor model ids with `cursor-agent --list-models`. **Do not invent ids.** Codex inherits the local default; `.codex/config.toml` sets reasoning effort only.

`.claude/settings.json` allow-lists the wrappers plus exact model-discovery / version commands (`cursor-agent --list-models`, `--version`, `codex --version`). It does not grant unrestricted `cursor-agent:*` or `codex:*`.

## How to run a session

```bash
cp -R council/_template council/$(date +%Y-%m-%d)-your-slug
```

Fill `00-brief.md`. Then `/council` (or ask to run Recipe 5).

Cursor fan-out after **read-only** prompt files exist under `prompts/` (use `--seat` when personas differ):

```bash
./scripts/cursor-panel.sh \
  --seat <id-from-list-models> council/<slug>/prompts/seat-a.md \
  --seat <id> council/<slug>/prompts/seat-b.md \
  --out-dir council/<slug>/panel
```

Same prompt on every Cursor seat: `--model <id> --model <id> --prompt-file council/<slug>/prompts/shared.md`.

Launch the Codex seat in the **same operator turn** as that fan-out when tools can run concurrently; if they cannot, say so and run them back-to-back. Save Codex with the documented provenance header, then append its basename to `panel/outputs.manifest` (a raw plugin dump is not provenance-complete). Cross-pollination reads that initial manifest only — not `panel/README.md`, not a glob, not `panel/adversarial/`. Cursor red-team later uses `./scripts/cursor-panel.sh --seat … --out-dir council/<slug>/panel/adversarial` (own manifest). `--resume` skips a seat only when the existing file's `| Model (exact) | \`id\` |` header matches the requested model exactly.

Exact CLI contract (do not "improve" the flags):

```bash
cursor-agent -p "$prompt" --model "$model" --output-format text --force
```

**`--force` can edit the working tree.** Panel prompts must tell models to stay read-only. `git status` (and `git diff --stat`) **before and after**. Unexpected diffs → stop, restore, do not cross-pollinate yet.

Ask models for **conclusions, evidence, assumptions, uncertainty, counterarguments, and a concise rationale** — never hidden chain-of-thought.

Mock tests for the wrappers (no live Cursor): `scripts/tests/test-cursor-scripts.sh`.

## Cloud-mode note

Cloud/web Claude Code can write session folders, prompts, and notes. It **cannot** run `cursor-agent` or Codex. Finish the panel seats on a machine where `/council-setup` passes.

Phase 2 (API-key product) is **not built**: [`docs/ROADMAP-api-mode.md`](docs/ROADMAP-api-mode.md).
