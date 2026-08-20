# Session prompts

Prompt artifacts live **here**, not under `panel/`. `panel/` is for model outputs (plus `README.md` and `outputs.manifest`). Cursor red-team prompt files (`seat-*-adversarial.md`) also live here; their outputs go to `panel/adversarial/` via `cursor-panel.sh --seat`, not to raw `cursor-agent.sh --out`. Cross-pollination and synthesis must not treat anything in this directory as a seat result.

## Layout

| File | What it is |
|---|---|
| `shared.md` | Shared read-only body (toolkit `07` §4 contract) used by `--model` seats |
| `seat-<label>.md` | Per-seat persona prompt (header + shared contract). Use with `--seat` |

Create one `seat-*.md` per Cursor seat that needs a distinct persona. Do not put these files in `panel/`.

## Fan-out

Distinct personas (the usual Council case):

```bash
./scripts/cursor-panel.sh \
  --seat <id> council/<slug>/prompts/seat-<label>.md \
  --seat <id> council/<slug>/prompts/seat-<label>.md \
  --out-dir council/<slug>/panel
```

Same prompt on every Cursor seat (no persona split):

```bash
./scripts/cursor-panel.sh \
  --model <id> --model <id> \
  --out-dir council/<slug>/panel \
  --prompt-file council/<slug>/prompts/shared.md
```

The forms may be combined. `--model` seats require `--prompt-file` or stdin; `--seat` files are validated on their own.

Ask for **conclusions, evidence, assumptions, uncertainty, counterarguments, and a concise rationale.** Never hidden chain-of-thought.
