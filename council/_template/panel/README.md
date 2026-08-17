# Panel outputs

Each seat file in this directory is **one model's raw contribution** plus a provenance header written by `scripts/cursor-panel.sh`.

Prompts do **not** live here. Session prompt artifacts are under `../prompts/`.

## What to read later

`outputs.manifest` lists seat output files (published or resume-skipped by `cursor-panel.sh`). Cross-pollination (`03-cross-pollination.md`) and synthesis (`04-synthesis.md`) consume **only those model outputs**.

- **Do not** treat `README.md` as a model.
- **Do not** treat `outputs.manifest` as a model.
- **Do not** read `../prompts/` as panel evidence.
- After a Codex (or other non-Cursor) seat lands, **append its filename** to `outputs.manifest` so later modes see it.

## Rules

- **Immutable.** Do not edit a panel file in place after it lands. If a run is bad, keep it and run again into a new filename or a new session — or `--overwrite` only when the operator explicitly intends to replace that seat.
- **Provenance is exact.** The `Model (exact)` field is the id passed to `cursor-agent --model`. Labels in filenames are a filesystem-safe normalization of that id (`google/gemini-x` → `google-gemini-x.md`).
- **Not the ledger.** Do not copy these bodies into `LEDGER.md`. Cite the path (`panel/<label>.md`) and extract a compact, quality-weighted claim.
- **Codex seats** that are not run through Cursor still land here as `panel/codex-<slug>.md` with a hand-written provenance block naming the exact command/plugin invocation used. Add that basename to `outputs.manifest`.

## `--force` reminder

Cursor invocations use `--force`. Prompts for files in this folder must be **read-only**. Check `git status` before and after the fan-out. See [`../README.md`](../README.md).

## Expected files

After a panel pass you should see `outputs.manifest` plus one markdown file per seat, for example:

- `grok.md`
- `gpt-5.md` *(example label only — use ids from `cursor-agent --list-models`)*
- `google-gemini-….md`
- `codex-adversarial.md`

There is no `composer.md` until that model actually ran. `README.md` is documentation, never a seat.
