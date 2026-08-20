---
name: ask-cursor
description: >-
  Bridge to the Cursor CLI (cursor-agent) for one model or a parallel fan-out.
  Use WHENEVER the user wants to query Grok, GPT, Gemini, Composer, or another
  Cursor-listed model from this repo, run scripts/cursor-agent.sh or
  scripts/cursor-panel.sh, or discover model ids via cursor-agent --list-models.
  Local machine only — not available in Claude Code cloud/web mode.
---

# Ask Cursor — CLI bridge

This skill is the **how to call Cursor**, not the Council methodology. For a full panel session use [`council`](../council/SKILL.md). Prompts: [`creative-thinking-toolkit/07-multi-model-panel.md`](../../../creative-thinking-toolkit/07-multi-model-panel.md).

Requires local `cursor-agent`, installed and logged in. If unsure, run [`council-setup`](../council-setup/SKILL.md).

## Discover models

```bash
cursor-agent --list-models
```

Use an id from that list. **Do not invent model ids.** If the list is unavailable, stop and say so.

## Exact invocation (do not change flags)

Wrappers must call:

```bash
cursor-agent -p "$prompt" --model "$model" --output-format text --force
```

That is what `scripts/cursor-agent.sh` does. Do not add "helpful" extra flags. Do not drop `--force`. Do not switch `--output-format`.

## `--force` is powerful

`--force` can change the working tree. Every call from this repo:

1. `git status` and `git diff --stat` **before**
2. Prompt is **read-only** (researcher, not coder; no patches, no commits, no "fix the repo")
3. `git status` / `git diff --stat` **after**. Unexpected diffs → stop, report, restore

Never tell the model to use write tools. Never pass a prompt that asks for file edits.

## One model

```bash
./scripts/cursor-agent.sh \
  --model <id-from-list-models> \
  --out path/to/out.md \
  --prompt-file path/to/prompt.md
```

- `--prompt-file` is preferred (repeatable, not a TTY).
- Stdin is allowed only when it is **not** a TTY and not empty.
- Existing `--out` is refused unless `--overwrite`.
- Directories, symlinks, and other non-regular destinations are refused even with `--overwrite`.
- `CURSOR_AGENT_BIN` overrides the binary (used by tests; rarely by humans).
- Writes are atomic. No-clobber uses a same-directory hard-link create-if-absent. Empty or failed model output does not land on the destination. INT/TERM kills the CLI process group.

## Many models in parallel

Distinct personas (Council default) use repeatable `--seat`:

```bash
./scripts/cursor-panel.sh \
  --seat <id> path/to/prompts/seat-a.md \
  --seat <id> path/to/prompts/seat-b.md \
  --out-dir council/YYYY-MM-DD-slug/panel
```

Shared prompt across seats:

```bash
./scripts/cursor-panel.sh \
  --model <id> --model <id> \
  --out-dir council/YYYY-MM-DD-slug/panel \
  --prompt-file path/to/prompts/shared.md
```

`--model` and `--seat` may be combined. Only `--model` seats require `--prompt-file` or non-TTY stdin. Each `--seat` prompt file is validated on its own (regular, readable, non-empty). All seats launch concurrently.

- Labels are filesystem-safe forms of the model id. Ids must match the documented grammar (alphanumeric start; then `[A-Za-z0-9._/:@+-]`; no `.` / `..` / empty slash segments; no control/whitespace/markdown metacharacters). Case-insensitive filename collisions are refused before launch.
- `--resume` skips a seat only when its output is an existing **non-empty regular** file whose header has an **exact** matching `| Model (exact) | \`id\` |` line for the requested model. Empty regular files are rerun and replaced. A non-empty regular file that lacks that header, or whose exact model id does not match the requested id (including normalization aliases such as `foo/bar` vs `foo-bar`), is refused — not skipped, not overwritten. Directories, symlinks, and other non-regular types are refused.
- `--overwrite` replaces existing **regular** files only, and only after a successful non-empty child. Cannot combine with `--resume`.
- With neither flag, existing paths are no-clobber (refused). A file created during the run is not overwritten (hard-link create-if-absent).
- Child exit status is tracked per model. A nonzero child is never published, even if it wrote a raw file. The process still exits non-zero and names the failures; the summary counts are those statuses.
- INT/TERM on the panel script TERMs the wrappers; each wrapper kills its CLI process group so descendants do not survive.
- Each published file records **exact** model provenance (`| Model (exact) | \`id\` |`). `outputs.manifest` is the authoritative seat list for `--out-dir` (not `README.md`, not a glob). On publication the script writes a canonical comment header, then merges prior retainable entries with this run's published or resume-skipped seats, removes duplicates, and drops traversal/absolute/stale/unsafe paths. Manually recorded Codex artifacts survive later invocations when they are safe relative basenames naming existing non-empty regular non-symlink files in that directory.

`cursor-agent.sh` writes **raw** model text with no panel provenance table. That is fine for a one-off query. Council panel evidence (initial seats and Cursor red-team) must go through `cursor-panel.sh` so the header and that directory's `outputs.manifest` exist. Do not treat a raw `--out` file as provenance-complete.

Do not background `cursor-agent` yourself. Do not use `wait -n`. The panel script is the parallelism mechanism.

Prompts for Council sessions live under `council/<slug>/prompts/`, not in `panel/`. Cursor red-team seats use `--out-dir council/<slug>/panel/adversarial` (its own manifest), not the main panel directory.

## What to put in the prompt file

Delegate to toolkit `07`. Minimum contract:

- Read-only researcher
- Conclusions, evidence, assumptions, uncertainty, counterarguments, concise rationale
- No hidden chain-of-thought request
- Named persona/mode that **differs** across seats when this is a Council panel. Use `--seat MODEL PROMPT_FILE` so each persona is a separate prompt file. Do not ask for hidden chain-of-thought.

## Cloud mode

If `cursor-agent` is missing, do not fake a Cursor result. Write the prompt file and tell the user to run the script locally. One Cursor model role-playing several experts is **not** heterogeneous fan-out. Omit any family whose ID was not returned by `--list-models`. Do not have Opus fill in for a missing Cursor model.
