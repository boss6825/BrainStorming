---
name: council-setup
description: >-
  Verify local Council prerequisites: Codex CLI/plugin and Cursor CLI
  (cursor-agent) installed, on PATH, and authenticated. Use WHENEVER the user
  asks if Council/Cursor/Codex will work, before the first panel run, or when
  a fan-out fails with missing-binary errors. Mirrors a local /codex:setup
  check. Cannot install or log in from Claude Code cloud/web mode.
---

# Council setup — local checker

Phase 1 Council **runs on the operator's desktop** (local Claude Code / terminal). Codex plugin and `cursor-agent` cannot run in Claude Code cloud or web mode. This skill only **verifies**. It does not `/plugin install`, `cursor login`, or pretend those succeeded from cloud.

## What "ready" means

| Tool | Ready when |
|---|---|
| Cursor CLI | `cursor-agent` on PATH, authenticated, `cursor-agent --list-models` prints ids |
| Codex CLI / plugin | `codex` on PATH (and/or Codex plugin commands like `/codex:review` available in local Claude Code), authenticated |

This repo does **not** pin a Codex model id. `.codex/config.toml` sets `model_reasoning_effort` only and inherits the local default model.

## Checks to run (report each pass/fail)

Run these in the repo root. Quote paths. Do not `eval`.

1. **Cursor binary**

   ```bash
   command -v cursor-agent
   ```

   If missing: tell the user to install Cursor CLI / `cursor-agent` on the machine that will run the panel, then authenticate (`cursor login` or the current Cursor CLI login flow). Do not invent install flags.

2. **Cursor auth + model list**

   ```bash
   cursor-agent --list-models
   ```

   Success: a list of ids. Failure: report stderr and stop calling the wrappers. **Never invent a model id** to skip this step.

3. **Codex binary**

   ```bash
   command -v codex
   ```

   If missing: local Codex CLI install + login. Plugin-only users may still have `/codex:review` inside local Claude Code without a global `codex` — say so if `command -v` fails but the user confirms the plugin works.

4. **Codex auth / version** (whichever works on this install; do not invent subcommands)

   ```bash
   codex --version
   ```

   If a login-status command exists on their CLI, run that too. If it errors, report the error rather than guessing.

5. **Repo wrappers**

   ```bash
   test -x scripts/cursor-agent.sh && test -x scripts/cursor-panel.sh
   bash -n scripts/cursor-common.sh && bash -n scripts/cursor-agent.sh && bash -n scripts/cursor-panel.sh
   ```

6. **Config files present**

   - `.codex/config.toml` — effort only, no invented model id
   - `.claude/settings.json` — wrapper allow-rules plus exact `cursor-agent --list-models` / `--version` and `codex --version` (no unrestricted `cursor-agent:*` / `codex:*` wildcards)

## What you cannot do from cloud

- Install CLIs, complete logins, or run a live panel
- `/plugin install openai/codex-plugin-cc`
- Claim a model is available without `--list-models`

If you are in cloud mode, print this checklist as **homework** for local Claude Code and still prepare `council/YYYY-MM-DD-slug/` from `_template/` if the user wants.

## After a pass

Tell the user they can `/council` or:

```bash
./scripts/cursor-panel.sh --seat <id> <prompts/seat-a.md> --seat <id> <prompts/seat-b.md> --out-dir council/<session>/panel
```

Remind them: read-only prompts, `git status` before and after `--force`.
