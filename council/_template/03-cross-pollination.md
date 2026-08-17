# Cross-pollination — {YYYY-MM-DD-slug}

Opus reads **only the model outputs listed in `panel/outputs.manifest`** (Cursor seats from `cursor-panel.sh`, plus any Codex/other filenames the operator appended **after** writing the documented provenance header). This is recombination, not averaging. Do not read `panel/adversarial/` here — that pass has its own later manifest.

Do **not** read `panel/README.md`, `panel/outputs.manifest` itself as a seat, or anything under `prompts/`. The manifest is authoritative: if it is missing, stop and say so — do not glob `panel/*.md`.

Use Conceptual Blending and Bisociation from toolkit [`03`](../../creative-thinking-toolkit/03-combinatorial-creativity.md). Paste-ready merge prompt: toolkit [`07`](../../creative-thinking-toolkit/07-multi-model-panel.md).

Ask for **conclusions, evidence, assumptions, uncertainty, counterarguments, and a concise rationale.** Do not request hidden chain-of-thought. Do not majority-vote. If two models disagree, keep both claims and cross-link them.

## Inputs read

| Path | Model (exact) | Used as |
|---|---|---|
| `panel/{label}.md` *(from `outputs.manifest` only)* | | input space / matrix |

## Blends

### B-01 — {name}

- **Input spaces / matrices:** {which panel files, which ideas}
- **Shared structure (generic space):**
- **Emergent property neither input had:**
- **One-line pitch:**
- **Assumptions:**
- **Uncertainty:**
- **Counterargument:**

### B-02 — {name}

- **Input spaces / matrices:**
- **Shared structure:**
- **Emergent property:**
- **One-line pitch:**
- **Assumptions:**
- **Uncertainty:**
- **Counterargument:**

## Contradictions kept (do not merge)

| ID | Claim A (source) | Claim B (source) | Why both still matter |
|---|---|---|---|
| X-01 | | | |

## Discarded collisions

{Pairs that were combined and produced nothing useful — one line each, so we don't retry them blindly.}

## Concise rationale

{Which 2–3 blends deserve the adversarial pass, and why — quality, not popularity.}
