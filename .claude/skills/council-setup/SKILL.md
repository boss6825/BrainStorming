---
name: council-setup
description: >-
  Check whether the local machine is ready to run Council by verifying the
  cursor-agent and codex executables, Cursor model discovery/authentication, and
  availability of the Codex plugin skills. Reports exact remediation without
  pretending Claude Code cloud can execute the panel.
---

# Council setup

Preflight checker for local Council sessions. Run this before `/council` does any
external Cursor or Codex work. Report facts and remediation — do not start
interactive login automatically, and do not claim readiness in cloud/web.

## Environment boundary

If this session is Claude Code **cloud/web**:

1. State that Council panel execution is **local-only**.
2. Do **not** claim the machine is ready to fan out.
3. Still list what would be checked locally, then stop.

Do not pretend Opus can stand in for Cursor or Codex.

## Cursor checks

Run in order:

```bash
command -v cursor-agent
cursor-agent --version
cursor-agent --list-models
```

Behavior:

1. `command -v cursor-agent` failure → **missing**. Action: install Cursor Agent /
   CLI per Cursor's official docs.
2. `--version` only proves the binary runs — **never** infer authentication from it.
3. `cursor-agent --list-models` success with a **non-empty** list → Cursor is
   installed **and** authenticated/usable for discovery.
4. If `--list-models` fails (or returns empty): report **installed but not
   authenticated/usable**. Point the operator to Cursor Agent's **official sign-in**
   flow. Do **not** invent a `cursor-agent login` command.

## Codex checks

```bash
command -v codex
codex --version
codex login status
```

Behavior:

1. `command -v codex` failure → **missing**. Action: install the Codex CLI.
2. `--version` ≠ authenticated.
3. Run `codex login status`.
4. If unauthenticated → instruct `codex login` (do not run it for them).
5. If `login status` is unsupported/unknown → report
   `installed; authentication unverified` (not missing). Instruct `codex login`
   or the plugin's `/codex:setup`.

## Plugin checks

Verify the host exposes these Codex plugin skills (invoke/list as the host allows;
do not invent flags):

- `/codex:review`
- `/codex:adversarial-review`
- `/codex:rescue`

If any are missing, say so and point to Codex plugin install / `/codex:setup`.
Do not invent CLI substitutes for those skills.

## Report

Print a compact table and stop:

| Component | Installed | Authenticated/usable | Action |
|---|---|---|---|
| cursor-agent | yes/no | yes/no (from `--list-models`) | … |
| Codex CLI | yes/no | yes / no / unverified | … |
| `/codex:review` | yes/no | n/a | … |
| `/codex:adversarial-review` | yes/no | n/a | … |
| `/codex:rescue` | yes/no | n/a | … |

Ready for `/council` only when Cursor discovery works, Codex is authenticated (or
explicitly verified via plugin setup), and all three plugin skills are present —
and only on a **local** host.
