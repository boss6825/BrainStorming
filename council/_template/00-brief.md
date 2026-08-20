# Council brief — {title}

- Session: `{YYYY-MM-DD-slug}`
- Created: `{YYYY-MM-DD}`
- Current stage: `brief`
- Orchestrator: `Claude Opus`
- Execution environment: `local Claude Code`

<!-- Current stage values: brief | research | diverge | panel | cross-pollinate | adversarial | converge | complete | blocked -->

Copy `council/_template/` to `council/{YYYY-MM-DD-slug}/` and fill this in **before** diverging. Tight beats exhaustive. Constraints already in `path-forward/` should be reused, not re-invented.

## Question

- {question}

## Goal or decision

- {what decision or outcome this session must produce}

## Hard constraints

- {constraint}
- {constraint}

## Context and evidence already available

- {fact or artifact already in hand}
- {prior research / doc path}

## Angles already tried or ruled out

- {angle} — ruled out because {reason}
- {angle} — already tried; result {result}

## Success criteria

- {observable success criterion}
- {observable success criterion}

## Kill criteria

- {condition that ends the idea without further polish}
- {condition that ends the idea without further polish}

## Unknowns requiring research

- {unknown}
- {unknown}

## Scope boundaries

### In scope

- {in-scope item}
- {in-scope item}

### Out of scope

- {out-of-scope item}
- {out-of-scope item}

## Panel plan (filled by `/council` before deep-dive)

Discover Cursor ids with `cursor-agent --list-models`. Do not invent a Codex model id.

| Seat | Model id (exact) | Persona / mode | Prompt file | Seeds / questions |
|---|---|---|---|---|
| Cursor 1 | {from `--list-models`} | | | |
| Cursor 2 | | | | |
| Codex | {local default} | | | |

## Git baseline (required before `--force` panel)

- Pre-panel `git status` captured: {yes/no}
- Post-panel `git status` checked: {yes/no}
- Unexpected working-tree changes: {none / describe + restored}
