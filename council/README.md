# Council

Ad-hoc, coding-agent-driven Phase 1 workflow for heterogeneous multi-model thinking. Claude Opus orchestrates the session and writes artifacts; it does **not** substitute for panel members. Real disagreement requires Codex and Cursor CLI models running separately.

This is a thinking system, not a product. Phase 2 API automation is out of scope and not implemented here. See [`../docs/ROADMAP-api-mode.md`](../docs/ROADMAP-api-mode.md).

## What Council does

Forces a diverge → deepen → recombine → pressure-test → converge loop so outputs cannot collapse to the generic center.

Pipeline:

1. **Diverge** — wide, mechanism-diverse seed set → `02-divergent-seeds.md`
2. **Deep-dive panel** — independent model passes in parallel → `panel/<label>.md` + `panel/outputs.manifest`
3. **Cross-pollinate** — Conceptual Blending & Bisociation across panel outputs → `03-cross-pollination.md`
4. **Adversarial** — Codex adversarial review + Cursor red-team → `panel/adversarial/`
5. **Converge** — scored synthesis, honest verdict, ledger deposits → `04-synthesis.md`, `LEDGER.md`

Opus may seed research and synthesize. Panel members must remain heterogeneous. If only Opus runs, you do not have a Council session — you have a monologue with extra files.

## The five modes

| Mode | Who | Artifact |
|---|---|---|
| Diverge | Orchestrator (Opus) | `02-divergent-seeds.md` |
| Deep-dive panel | Cursor models + Codex, in parallel | `panel/<label>.md`, `panel/codex-<slug>.md`, `panel/outputs.manifest` |
| Cross-pollinate | Orchestrator | `03-cross-pollination.md` |
| Adversarial | Codex adversarial + Cursor red-team | `panel/adversarial/` + `panel/adversarial/outputs.manifest` |
| Converge | Orchestrator | `04-synthesis.md` + `LEDGER.md` updates |

Do not skip modes to save time. Do not score during divergence or cross-pollination. Do not treat panel popularity as evidence.

## Local prerequisites

Heterogeneous panel execution requires **local Claude Code** with both tools installed and authenticated:

- `codex` CLI (Codex plugin / local auth)
- `cursor-agent` CLI (logged in; models discoverable via `cursor-agent --list-models`)

Setup check: `/council-setup`

In Claude Code **cloud/web**, you may inspect or scaffold Council files. You **cannot** invoke local Codex or Cursor CLI from cloud/web. Do not claim a cloud session ran a real panel. Do not simulate missing members.

## Session layout

Copy `_template/` into a dated session folder.

```text
council/YYYY-MM-DD-slug/
├── 00-brief.md
├── 01-deep-research.md
├── 02-divergent-seeds.md
├── prompts/
│   ├── README.md
│   ├── shared.md
│   └── seat-*.md
├── panel/
│   ├── README.md
│   ├── outputs.manifest
│   ├── <label>.md
│   ├── codex-<slug>.md
│   └── adversarial/
│       ├── README.md
│       ├── outputs.manifest
│       └── …
├── 03-cross-pollination.md
├── 04-synthesis.md
└── LEDGER.md
```

Template lives at `council/_template/`. Sessions live at `council/YYYY-MM-DD-slug/`. Do not write session work into `_template/`.

## Run or resume a session

```text
/council {question}
/council resume council/{YYYY-MM-DD-slug}
/council-setup
/ask-cursor
```

Typical flow:

1. `/council-setup` — confirm local tools before any panel fan-out.
2. `/council {question}` — creates `council/YYYY-MM-DD-slug/` from `_template/`, fills `00-brief.md`, then advances stages.
3. `/council resume council/{YYYY-MM-DD-slug}` — continues from `Current stage` in the brief; does not rewrite completed artifacts without cause.
4. `/ask-cursor` — single-model or ad-hoc Cursor query outside full orchestration.

Stage order: `brief` → `research` → `diverge` → `panel` → `cross-pollinate` → `adversarial` → `converge` → `complete` (or `blocked`).

## Parallelism and `--force`

`scripts/cursor-panel.sh` fans Cursor seats out concurrently (`--seat` for distinct persona prompts, or `--model` plus one shared `prompts/shared.md`). Launch Codex in the same operator turn when tools can run concurrently. Initial Codex review goes in `panel/outputs.manifest`; adversarial Codex review goes in `panel/adversarial/outputs.manifest`. `--resume` skips a Cursor seat only on an exact matching `| Model (exact) | \`id\` |` header.

Exact Cursor invocation:

```bash
cursor-agent -p "$prompt" --model "$model" --output-format text --force
```

`--force` can edit the working tree. Council requires `git status` before and after, and **read-only** panel prompts.

## Failure and partial-run policy

- One model failing does **not** kill successful siblings. Keep their published files.
- Cursor wrappers **do not publish** empty or nonzero children as seat evidence. Record those failures in the brief/synthesis evidence state.
- Do not advance to cross-pollination, adversarial, or converge gates if required inputs for that gate are missing.
- Do not complete a session that skipped adversarial pressure on front-runners.
- Record which models failed in synthesis. Partial panels are usable; silent omissions are not.
- Retry failed Cursor seats with `cursor-panel.sh --resume` or `--seat`; do not use raw `cursor-agent.sh --out` as panel evidence.

## Ledger governance

`LEDGER.md` is curated **session-local** shared memory, not a transcript dump.

- Source- and quality-weighted deposits only.
- Contradictions become linked contested entries — never silent merge into consensus.
- Stale traces cannot drive scoring.
- Multiple models repeating one source ≠ independent reinforcement.
- Panel popularity alone never increases weight.
- Full schema at every status; append-only change log; no automatic cross-session reuse.

See the session `LEDGER.md` header for the quality scale, types, and entry template.
