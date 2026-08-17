---
name: ask-cursor
description: >-
  Query one Cursor Agent model or fan a shared Council prompt out to multiple
  Cursor models in parallel, capturing each final text response in a separate
  markdown file. Use only in local environments with cursor-agent installed and
  authenticated; discover current model IDs with cursor-agent --list-models.
---

# Ask Cursor — local model bridge

Bridge from Claude Code to headless `cursor-agent` for single-model queries or
parallel Council fan-out. Full independent deep-dive / red-team prompt templates:
[`creative-thinking-toolkit/07-multi-model-panel.md`](../../../creative-thinking-toolkit/07-multi-model-panel.md).
This skill is *how to invoke*; do not inline those prompts here.

## Preconditions

- Local environment only (not Claude Code cloud/web).
- `cursor-agent` installed and authenticated.
- Prefer running `/council-setup` first when this is part of a Council session.
- For Council sessions, write into that session's `panel/` directory — never merge
  outputs into one file.

## Discover model IDs

Always discover before choosing `--model` values. Display names are not CLI IDs.

```bash
cursor-agent --list-models
```

Use the **actual IDs** returned. Do not hardcode speculative IDs.

## Ask one model

```bash
scripts/cursor-agent.sh \
  --model "<actual-model-id>" \
  --out "council/<session>/panel/<sanitized-model-id>.md" \
  --prompt-file "<prompt-file>"
```

Sanitize the model id for the filename (filesystem-safe). Preserve the script's
failure file behavior on non-zero exit — do not delete failed outputs.

## Fan out

Launch multiple models in parallel with a shared prompt. Include the **exact
runtime-ID → role** mapping inside the prompt body.

```bash
scripts/cursor-panel.sh \
  --out-dir "council/<session>/panel" \
  --model "<actual-grok-id>" \
  --model "<actual-gpt-id>" \
  --model "<actual-gemini-id>" \
  --model "<actual-composer-id>" <<'PROMPT'
{filled independent deep-dive prompt, including exact runtime-ID assignments}
PROMPT
```

Omit any family whose ID was not returned by `--list-models`. Record deliberate
reassignments upstream in the Council brief; do not silently substitute.

## Prompt discipline

- Fill templates from toolkit `07`; do not invent a parallel prompt system.
- Instruct the model to answer to **stdout** and **not edit the repo**.
- Put the full runtime-ID-to-role mapping in the prompt so each member knows its
  assigned lens — without seeing other members' answers.
- Do not assume display names equal CLI IDs.
- One Cursor model role-playing several experts is **not** heterogeneous fan-out.
  Fan-out means distinct `--model` IDs, each writing its own file.

## Failures

- A single model failure must not block siblings already running.
- Retry only the failed model with `scripts/cursor-agent.sh` and the same prompt.
- Preserve failure artifacts for the Council panel gate.
- Do not merge successful and failed outputs. Do not have Opus fill in for a
  missing Cursor model.
