# Council

A **thinking system**, not a notes folder. One researcher goes deep, another goes deep from a different angle, and the useful move is **cross-pollinating** their findings. A single LLM will not do this on its own — it collapses to the average answer (the Wharton *diversity trap*; see [`../creative-thinking-toolkit/`](../creative-thinking-toolkit/)).

Council mechanizes divergence with **real heterogeneous models**: Claude Opus seeds and orchestrates; Codex and Cursor CLI models (Grok, GPT, Gemini, Composer, …) each contribute a different prior in parallel; Opus then blends, red-teams, and converges.

Phase 1 is **ad-hoc and coding-agent driven**. You invoke `/council` (or `/ideate` Recipe 5) from **local** Claude Code. Codex plugin and Cursor CLI do not run in Claude Code cloud/web mode.

Phase 2 (API-key product) is **not built**. See [`../docs/ROADMAP-api-mode.md`](../docs/ROADMAP-api-mode.md).

## Pipeline (5 modes)

You drive these ad-hoc; `/council` writes each into a session folder.

1. **Diverge** — Opus generates a deliberately wide, diverse seed set → `02-divergent-seeds.md`
2. **Deep-dive (the panel)** — each seed/question fans out to multiple models **in parallel** via Cursor + Codex → `panel/<label>.md`
3. **Cross-pollinate** — Opus combines ideas *across* models using Conceptual Blending & Bisociation (toolkit [`03`](../creative-thinking-toolkit/03-combinatorial-creativity.md)) → `03-cross-pollination.md`
4. **Adversarial** — `/codex:adversarial-review` plus a Cursor red-team pass pressure-tests the front-runners
5. **Converge** — Opus scores (novelty × feasibility × fit), red-teams #1, writes an honest verdict (including KILL) → `04-synthesis.md`, updates the ledger

Never collapse diverge and converge into one pass. Never majority-vote the ledger.

## Sessions

Sessions live at `council/YYYY-MM-DD-slug/`.

```bash
cp -R council/_template council/$(date +%Y-%m-%d)-your-slug
```

Copy the whole `_template/` tree; do not start from a blank folder.

| File | Who writes it | What it is |
|---|---|---|
| `00-brief.md` | You + orchestrator | Goal, constraints, already-tried, success test |
| `01-deep-research.md` | Opus | Seed research (facts, map, uncertainties) |
| `02-divergent-seeds.md` | Opus | Wide seed set / questions for the panel |
| `panel/<label>.md` | Cursor/Codex models | **Immutable** raw member output + exact model provenance. Listed in `panel/outputs.manifest`. Not `README.md`. Codex plugin files need the documented header before listing. |
| `panel/adversarial/` | Cursor red-team via `cursor-panel.sh --seat` | Own `outputs.manifest`. Not raw `cursor-agent.sh` output. |
| `prompts/` | Orchestrator | Shared + per-seat prompt files (not panel evidence) |
| `03-cross-pollination.md` | Opus | Blends across models; contradictions kept visible |
| `04-synthesis.md` | Opus | Scores, red-team, verdict |
| `LEDGER.md` | **Curator only** (Opus / operator) | Governed compact trace — not a dump of panel files |

Method prompts live in [`../creative-thinking-toolkit/07-multi-model-panel.md`](../creative-thinking-toolkit/07-multi-model-panel.md). Operator skill: [`.claude/skills/council/SKILL.md`](../.claude/skills/council/SKILL.md).

## Parallelism (the time saver)

`scripts/cursor-panel.sh` fans Cursor seats out concurrently (`--seat` for distinct persona prompts, or `--model` plus one shared `prompts/shared.md`). **Launch the Codex seat in the same operator turn** as that fan-out when the runtime supports concurrent tool calls (`/codex:review` or `/codex:adversarial-review` alongside the panel script). If tools are serialized, say so and run them back-to-back — do not claim overlap that did not happen. Codex files need the documented provenance header: initial review goes in `panel/outputs.manifest`, while adversarial review goes in `panel/adversarial/outputs.manifest`. Later `cursor-panel.sh` runs merge retainable prior manifest entries (so those Codex artifacts survive) instead of rebuilding the list from the current seats alone.

`--resume` skips a Cursor seat only when the existing file has an exact matching `| Model (exact) | \`id\` |` header for the requested model — not merely because it is non-empty. Cursor red-team (Mode 4) uses `--out-dir council/<slug>/panel/adversarial` with `--seat`. Cross-pollination reads `panel/outputs.manifest` only; synthesis also reads `panel/adversarial/outputs.manifest`.

Discover Cursor model ids with:

```bash
cursor-agent --list-models
```

Exact Cursor invocation (do not “improve” the flags):

```bash
cursor-agent -p "$prompt" --model "$model" --output-format text --force
```

## `--force` is powerful — read-only prompts + git hygiene

`--force` can edit the working tree. Council requires:

1. **`git status` (and `git diff --stat`) before** the panel runs. Know the baseline.
2. Panel prompts are **read-only**: the model is a researcher, not a coder. Do not ask it to patch, commit, or “improve the repo.”
3. **`git status` after.** If anything unexpected changed, stop, report it, and restore. Do not proceed to cross-pollination on a dirty surprise.

The wrappers pass `--force` because that is the Cursor CLI contract this repo standardized on. The safety net is the prompt + git checks, not a weaker flag.

## Ledger (non-negotiable)

`LEDGER.md` is a *governed* shared trace. The rules in [`_template/LEDGER.md`](_template/LEDGER.md) are **Council design choices motivated by** the stigmergy / Memory Curse review (`old research on startup ideas/stigmergy_memory_llm_swarms_review.md`). That review did not prove this exact schema.

- Quality-weighted, **not** majority-voted
- Contradictions stay **separate and cross-linked**, never silently merged
- Raw panel outputs are **immutable**; the ledger cites them by path
- Stable IDs (`L-001`, …); full entry schema at every status (`stale` / `rejected` / `superseded` included)
- **Curator-only** writes
- Compact entries — never paste a panel dump
- `review-by` dates; expired entries become `stale` (row stays)
- Append-only change log records status transitions
- **No automatic cross-session reuse**

## What not to ask models

Do **not** ask for hidden chain-of-thought, internal scratchpads, or “show every step you thought.” Ask for **conclusions, evidence, assumptions, uncertainty, counterarguments, and a concise rationale.**

## Local-only tools

Codex plugin and `cursor-agent` must be installed and logged in on your desktop. Run `/council-setup` to check. Cloud Claude Code can write scaffolding and notes; it cannot run the panel.
