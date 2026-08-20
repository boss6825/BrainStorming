<!--
GitHub pre-fills this file when you open a pull request.
Delete any section that does not apply. Check N/A rather than leaving a lie.
How this template was designed: docs/how-to-write-a-pr-template.md
-->

## Summary

<!-- What changed, in the repo's terms. Not a commit-title restatement. -->

-

## Change type

<!-- Pick all that apply. -->

- [ ] Toolkit method (`creative-thinking-toolkit/`)
- [ ] Operator skill (`/ideate`, `/council`, `/ask-cursor`, `/council-setup`)
- [ ] Council scaffolding (session `_template/`, ledger, manifests, wrappers)
- [ ] Docs / index (`README.md`, `AGENTS.md`, `PLAN.md`, `council/README.md`)
- [ ] Personal notes (`path-forward/`, `old research on startup ideas/`)
- [ ] Config (`.claude/settings.json`, `.codex/config.toml`)
- [ ] Tests only

## Why

<!-- Decision this unblocks, gap it closes, or failure it prevents. -->



## What this is not

- [ ] Does **not** implement Phase 2 API-key automation (`docs/ROADMAP-api-mode.md` stays design-only unless that is the explicit task)
- [ ] Does **not** treat a cloud/web run as a completed Council panel
- [ ] Does **not** invent Cursor/Codex model ids, citations, or panel seats that did not run
- [ ] Does **not** add a parallel ideation system beside the toolkit + `/ideate` + `/council`

## Repo conventions (check or N/A)

- [ ] Read `AGENTS.md` first; if this touches multi-model orchestration, also read `PLAN.md`
- [ ] New or newly-built paths are in the `AGENTS.md` index with the correct ✅ / 📝 status
- [ ] Diverge-then-converge is still a hard boundary; no scoring during generation
- [ ] Skills describe *how to run* and still delegate full prompts to the toolkit (no inlined Recipe 5 / `07` templates)
- [ ] New ideation method: toolkit file (or row in an existing `NN-` file) **and** an `/ideate` routing row **and** a recipe in `05-prompt-library.md`
- [ ] Toolkit files keep `NN-topic.md`, `# NN · Title`, a Contents block, and paste-ready `{placeholder}` prompts
- [ ] Neurodivergent-mode language is cognitive-style-inspired, not clinical, not a stereotype, not a real person
- [ ] Ledger rules untouched or still honored: curator-only writes, quality-weighted (never majority vote), contradictions cross-linked not merged, manifests not globs, no automatic cross-session reuse
- [ ] Cursor CLI contract unchanged unless that is the change: `cursor-agent -p "$prompt" --model "$model" --output-format text --force`
- [ ] `settings.json` still has no unrestricted `cursor-agent *` / `codex *` wildcards
- [ ] `.codex/config.toml` still does not pin a Codex model id

## Verification

<!-- Paste commands and results. Skip live Cursor/Codex unless you actually ran them locally. -->

- [ ] `git diff --check`
- [ ] N/A — docs-only
- [ ] Scripts: `bash -n scripts/*.sh scripts/tests/*.sh scripts/tests/mocks/*`
- [ ] Scripts: `scripts/tests/test-cursor-scripts.sh` (mock `cursor-agent`; no live CLI)
- [ ] Config: `python3 -c "import json; json.load(open('.claude/settings.json'))"` and TOML parse of `.codex/config.toml` if those files changed
- [ ] Skill YAML frontmatter still matches `/ideate` / `/council` / `/ask-cursor` / `/council-setup` names

Local follow-up (human, not CI):

- [ ] N/A
- [ ] `/council-setup` is green on a local machine
- [ ] Throwaway Council session fanned out and files landed

## Risks / leftovers

<!-- Honest gaps. A KILL of the approach is allowed. -->

-
