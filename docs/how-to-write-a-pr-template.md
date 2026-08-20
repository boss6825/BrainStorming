# How to write a pull-request template for a particular project

A PR template is a review contract, not a polite form. The useful one is extracted from **how this repo actually fails**, not copied from a SaaS starter.

This file is the method. The template GitHub loads is [`.github/PULL_REQUEST_TEMPLATE.md`](../.github/PULL_REQUEST_TEMPLATE.md).

## 1. Ignore generic templates

Stock checklists (screenshots, “fixes #123”, mobile QA, changelog customer-facing copy) assume a shipped product. This repo is a personal thinking system. A generic template would ask the wrong questions and skip the ones that matter here: diverge/converge, fake panels, ledger majority-vote, Phase 2 creep.

Start from the project’s own rules, not GitHub’s example markdown.

## 2. Mine the real review criteria

Read, in order:

1. **The agent/index file** — here, `AGENTS.md`. Status legend, “do not rebuild what exists,” conventions, non-negotiables.
2. **The design spec** — here, `PLAN.md` (Phase 1) and `docs/ROADMAP-api-mode.md` (explicitly *not* to implement).
3. **Operator skills** — what they forbid (simulate missing models, inline toolkit prompts, invent model ids).
4. **Tests that already exist** — here, `scripts/tests/test-cursor-scripts.sh` and `bash -n` on wrappers. A template should name those commands, not invent CI that is not there.
5. **Past PRs** — this repo’s merged Council PRs already used Summary / Verification / Local follow-up. Keep that shape; fill it with this project’s gates.

Each checkbox should map to a **failure mode you have already seen or explicitly banned**, for example:

| Failure mode in this repo | Template check |
|---|---|
| Rebuild something listed in `AGENTS.md` | Index updated; reuse called out |
| Cloud session claimed as a Council run | “What this is not” |
| One model role-playing Grok/Gemini/Codex | Do not invent seats that did not run |
| Skills duplicating toolkit `07` | Delegate prompts; skills are *how to run* |
| New method as a parallel system | Toolkit + `/ideate` row + `05` recipe |
| Majority-vote ledger / silent merge | Ledger rules honored |
| Unrestricted `cursor-agent *` allow-rule | Least-privilege `settings.json` |
| “Helpful” extra Cursor flags | Exact CLI contract |
| Phase 2 implemented from a roadmap doc | Design-only unless that is the task |

If you cannot point to a file or a past incident, do not add the checkbox.

## 3. Split change types so people can honestly skip

A docs-only README fix should not be forced to pretend it ran `/council-setup`. List the change types this repo actually has (toolkit, skill, scaffolding, docs, personal notes, config, tests), then mark remaining checks **N/A** rather than leaving a false yes.

Always-on checks vs type-specific checks:

- **Always:** summary, why, “what this is not,” honesty about leftovers.
- **If toolkit:** `NN-topic.md` shape, Contents, `{placeholder}` prompts, neurodivergent framing, routing row + recipe.
- **If Council/scripts:** manifests not globs, `--force` git hygiene, mock tests, Bash 3.2 constraints.
- **If config:** no CLI wildcards, no Codex model pin.

## 4. Ask for evidence, not vibes

“Tested” is useless. Name the command and require the author to paste or skip with N/A:

```bash
git diff --check
bash -n scripts/*.sh scripts/tests/*.sh scripts/tests/mocks/*
scripts/tests/test-cursor-scripts.sh
```

Separate **in-tree** verification from **local human** follow-up (`/council-setup`, a throwaway session). This environment cannot run the panel; the template must not imply that it can.

## 5. Keep the author-facing file short

If the template is longer than one focused screen, it will be deleted and replaced with “updated readme.” Put the *design rationale* in this doc. Put *fill-in fields* in `.github/PULL_REQUEST_TEMPLATE.md`.

Use HTML comments (`<!-- … -->`) for fill hints. They show in the PR editor and drop out of the rendered body.

Do not put relative `../AGENTS.md` links in the template body. GitHub renders a PR description against the PR URL, not the `.github/` file, so those links break. Use backticks for repo paths.

## 6. Put it where GitHub will load it

GitHub looks for, in order of common use:

- `.github/PULL_REQUEST_TEMPLATE.md` (this repo)
- `docs/PULL_REQUEST_TEMPLATE.md`
- `PULL_REQUEST_TEMPLATE.md` at the repo root
- `.github/PULL_REQUEST_TEMPLATE/*.md` if you need **multiple** templates (then the author picks one)

One template is enough until change types diverge so far they fight each other. Multiple templates are for “release” vs “research note,” not for every folder.

Issue templates (`ISSUE_TEMPLATE`) are a different mechanism. Do not stuff bug-report fields into a PR template.

## 7. Keep it alive

When a new non-negotiable lands (for example a new completion gate or a new wrapper flag), add **one** checkbox that names that failure. When a check is never used, delete it. A stale template is worse than none: it trains authors to ignore the form.

## Worked example (this repo)

Sources used to write `.github/PULL_REQUEST_TEMPLATE.md`:

- `AGENTS.md` — index, ledger, conventions, “before starting any task”
- `PLAN.md` — Phase 1 vs Phase 2, verification commands
- `.claude/skills/council/SKILL.md` and `ask-cursor/SKILL.md` — CLI contract, manifests, no simulated seats
- `docs/ROADMAP-api-mode.md` — design only
- `creative-thinking-toolkit/` file conventions and `/ideate` routing rule
- Merged PR #5 shape: Summary, Verification, Local follow-up

That is the loop to reuse on any other project: **rules → failure modes → typed checklists → existing test commands → one short form.**
