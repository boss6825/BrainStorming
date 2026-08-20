# Panel outputs

Each seat file in this directory is **one model's raw contribution** plus a provenance header.

- **Cursor seats** are written by `scripts/cursor-panel.sh` (never by raw `cursor-agent.sh` output). That wrapper records the exact `| Model (exact) | \`id\` |` header.
- **Codex / plugin seats** land here only after you add the [documented provenance header](#codex-plugin-provenance) below. A raw plugin dump is **not** provenance-complete and must not be listed until the header is present.

Prompts do **not** live here. Session prompt artifacts are under `../prompts/`.

Cursor red-team (Mode 4) does **not** land here. It uses [`adversarial/`](adversarial/README.md) with its own `outputs.manifest` via `cursor-panel.sh --seat`.

## Independence rule

- Members must **not** see other panel answers before writing their own file.
- `"I agree with the others"` / consensus language is invalid and should be rejected on intake.
- Separate **facts**, **inference**, and **speculation**. Label unverified claims.
- Orchestrator may fan out in parallel; independence is about content, not wall-clock.
- Do not invent substitute answers from the orchestrator to "fill the seat."

## What to read later

`outputs.manifest` is the **authoritative** list of seat artifacts in *this* directory. Cross-pollination (`03-cross-pollination.md`) consumes **only** this initial manifest. Synthesis (`04-synthesis.md`) consumes this manifest **and** `adversarial/outputs.manifest`.

- **Do not** treat `README.md` as a model.
- **Do not** treat `outputs.manifest` as a model.
- **Do not** glob `*.md` as a substitute if the manifest is missing — stop and say so.
- **Do not** read `../prompts/` as panel evidence.
- **Do not** treat `cursor-agent.sh` raw `--out` files as panel evidence (no cursor-panel provenance).
- After a Codex (or other non-Cursor) seat lands **with the documented provenance header**, append its basename to `outputs.manifest`. A later `cursor-panel.sh` run merges retainable prior entries (including that Codex file) instead of wiping them.

`cursor-panel.sh` rebuilds the manifest with a canonical comment header, then merges prior retainable entries with that run's published or resume-skipped seats. Duplicates are removed. An existing entry is kept only when it is a safe relative basename naming an existing non-empty regular non-symlink artifact in this directory. Traversal, absolute paths, documentation files, and stale or unsafe paths are dropped.

## Rules

- **Immutable.** Do not edit a panel file in place after it lands. If a run is bad, keep notes in synthesis and retry into a missing seat (`--resume`) or `--overwrite` only when the operator explicitly intends to replace that seat.
- **Success-only publication.** A nonzero or empty Cursor child is **not** published as a seat file. Record the failure in `00-brief.md` / `04-synthesis.md` evidence state. Do not delete successful siblings.
- **Provenance is exact.** The `Model (exact)` field is the id passed to `cursor-agent --model`. Labels in filenames are a filesystem-safe normalization of that id (`google/gemini-x` → `google-gemini-x.md`). `--resume` skips a seat only when this file's header has an **exact** matching `| Model (exact) | \`id\` |` line for the requested model. A non-empty regular file that lacks or mismatches that line is refused (not skipped, not overwritten). Empty regular files are rerun. `foo/bar` and `foo-bar` are different ids even when they share a filename.
- **Not the ledger.** Do not copy these bodies into `LEDGER.md`. Cite the path (`panel/<label>.md`) and extract a compact, quality-weighted claim.

## Expected response structure

Successful independent deep dives should follow toolkit `07` headings (`Assigned role and lens`, `Reframing`, `Seed-by-seed observations`, `Deepened candidates`, `One new candidate`, `Facts and evidence`, `Assumptions and uncertainties`, `Contradictions`, `Handoff building blocks`). Empty sections must say what is missing.

## Codex / plugin provenance

Do **not** append a raw `/codex:review` or `/codex:adversarial-review` dump to `outputs.manifest`. Write this header (same table shape as `cursor-panel.sh`), then the raw body after `---`, then add the basename:

```
# Panel output — Codex (plugin)

| Field | Value |
| --- | --- |
| Model (exact) | `{exact local Codex model id; do not invent}` |
| Output label | `codex-{slug}` |
| Command | `{exact plugin invocation, e.g. /codex:review or /codex:adversarial-review}` |
| Written (UTC) | {YYYY-MM-DDThh:mm:ssZ} |

Raw model output follows. This file is immutable session evidence; do not edit in place.

---
```

Initial Codex review is listed in **this** directory's manifest. Codex `/codex:adversarial-review` is listed in `adversarial/outputs.manifest`.

## `--force` reminder

Cursor invocations use `--force`. Prompts for files in this folder must be **read-only**. Check `git status` before and after the fan-out. See the [Council README](../../README.md).

## Expected files

After a panel pass you should see `outputs.manifest` plus one markdown file per **successful** seat, for example:

- `grok.md`
- `gpt-5.md` *(example label only — use ids from `cursor-agent --list-models`)*
- `google-gemini-….md`
- `codex-<slug>.md` *(plugin output **with** the documented provenance header, then listed in this manifest)*
- `adversarial/` *(Cursor red-team via `cursor-panel.sh --seat`; its own `outputs.manifest`)*

There is no `composer.md` until that model actually ran. `README.md` is documentation, never a seat.
