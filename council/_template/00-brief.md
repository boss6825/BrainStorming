# Brief — {YYYY-MM-DD-slug}

Copy `council/_template/` to `council/{YYYY-MM-DD-slug}/` and fill this in **before** diverging. Tight beats exhaustive. Constraints already in `path-forward/` should be reused, not re-invented.

## Question / goal

{One paragraph: what this session is for.}

## Hard constraints

- {budget, time, who it's for, what must remain true}

## Already tried / ruled out

- {so the panel does not repeat them}

## Success looks like

- {a falsifiable outcome: a shortlist, a kill, a research question, a cheapest next test}

## Out of scope

- {what this session will not decide}

## Panel plan (filled by `/council` before deep-dive)

| Seat | Model id (exact) | Persona / mode (from toolkit 02/04/07) | Prompt file | Seeds / questions it gets |
|---|---|---|---|---|
| Cursor 1 | {from `cursor-agent --list-models`} | | `prompts/seat-{label}.md` | |
| Cursor 2 | | | `prompts/seat-{label}.md` | |
| Codex | {local default; do not invent an id} | | (plugin turn; save `panel/codex-<slug>.md` and append to `panel/outputs.manifest`) | |

## Git baseline (required before `--force` panel)

- Pre-panel `git status` captured: {yes/no}
- Post-panel `git status` checked: {yes/no}
- Unexpected working-tree changes: {none / describe + restored}
