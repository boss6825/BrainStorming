# Cross-pollination — `{YYYY-MM-DD-slug}`

Opus reads **only the model outputs listed in `panel/outputs.manifest`**. This is recombination, not averaging. Do not read `panel/adversarial/` here — that pass has its own later manifest.

Do **not** read `panel/README.md`, `panel/outputs.manifest` itself as a seat, or anything under `prompts/`. If the manifest is missing, stop — do not glob `panel/*.md`.

Use Conceptual Blending and Bisociation from toolkit [`03`](../../creative-thinking-toolkit/03-combinatorial-creativity.md). Paste-ready merge prompt: toolkit [`07`](../../creative-thinking-toolkit/07-multi-model-panel.md).

Ask for **conclusions, evidence, assumptions, uncertainty, counterarguments, and a concise rationale.** Do not request hidden chain-of-thought. Do not majority-vote. If two models disagree, keep both claims and cross-link them. Do **not** score until adversarial review is complete.

Produce at least **6** candidates: **≥3 Conceptual Blends** + **≥3 Bisociations**. Every candidate must cite **≥2** source files from the manifest.

## Source map

| Building block / claim | Source file(s) | Model / role | Independence note |
|---|---|---|---|
| {block} | `panel/{file}.md` *(from `outputs.manifest` only)* | `{exact model id}` | {independent / shared-source / contested} |

## Conceptual blends

### Blend {N}: `{name}`

- **Generic space:** {shared abstract structure}
- **Input spaces / matrices:** {source A} × {source B} (cite panel files)
- **Cross-map:** {what maps to what}
- **Selective projection:** {what is kept / dropped from each}
- **Emergent property:** {property neither input had alone}
- **Pitch:** {one tight sentence}
- **Assumptions / uncertainty / counterargument:**

## Bisociations

### Bisociation {N}: `{name}`

- **Frame A:** {frame}
- **Frame B:** {frame}
- **Collision:** {forced contact point}
- **Imported rule:** {rule taken from one frame into the other}
- **Sources:** `{panel file}` × `{panel file}`

## Candidate set for adversarial

At least **3** mechanism-distinct candidates. Not scored yet.

| ID | Candidate | Core mechanism | Sources blended | Why mechanism-distinct |
|---|---|---|---|---|
| C1 | {candidate} | `{mechanism}` | {files / blends} | {distinctness note} |
| C2 | {candidate} | `{mechanism}` | {files / blends} | {distinctness note} |
| C3 | {candidate} | `{mechanism}` | {files / blends} | {distinctness note} |

## Contradictions kept (do not merge)

| ID | Claim A (source) | Claim B (source) | Why both still matter |
|---|---|---|---|
| X-01 | | | |

## Discarded collisions

{Pairs that were combined and produced nothing useful — one line each.}

## Concise rationale

{Which 2–3 blends deserve the adversarial pass, and why — quality, not popularity.}

Do not add a post-adversarial "revised candidates" table here. Mode 4 writes `panel/adversarial/` and Mode 5 records pressure outcomes in `04-synthesis.md`.
