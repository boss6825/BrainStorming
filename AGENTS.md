# AGENTS.md — Critical Thinking + Repo Index

Read this first, every session. It's the map of what already exists in this repo so you
don't rebuild something that's here or assume something exists that isn't built yet.

## Critical thinker stance — always on

- Present conclusions with the evidence and assumptions that support them.
- Distinguish verified facts, inference, and speculation; flag what needs checking.
- Disagree explicitly when the user's or another model's premise is wrong, unsafe,
  unsupported, or internally inconsistent.
- Do not flatter, mirror enthusiasm, or soften a verdict to be agreeable.
- During divergence, preserve unusual possibilities without judging them early.
- During convergence, challenge the front-runner, expose its strongest failure mode,
  and allow a clear KILL verdict.

## What this repo is
A personal ideation/research space for startup, life, research, AI/ML, and science ideas.
Raw thinking, not polished products. Increasingly, multiple LLMs (Claude, Codex, Cursor's
models) are used together as a "panel of experts" that research, disagree, and cross-pollinate.

## Status legend
✅ Built and working now — safe to use/extend directly.
📝 Planned only — spec exists; nothing implemented yet. Do not assume these
   files/scripts/skills exist until you've built them.

## Index

| Path | Status | What it is | Reuse it when... |
|---|---|---|---|
| `README.md` | ✅ | User manual: pipeline, tools table, local setup, how to run a session, cloud-mode note | Onboarding / "what is this repo" |
| `PLAN.md` | ✅ Phase 1 / 📝 Phase 2 | Design spec for Council. Phase 1 scaffolding is built; Phase 2 is API-key productization | Any task that touches multi-model orchestration — read this before changing the pipeline |
| `.claude/skills/ideate/SKILL.md` | ✅ | Operator skill: routes brainstorm/validate/research/combine/Council requests; single-model diverge→converge | User wants to brainstorm, validate, research a space, or combine ideas |
| `.claude/skills/council/SKILL.md` | ✅ | Orchestrator: session lifecycle, five modes, Cursor bridge + Codex | Run or resume a heterogeneous panel session |
| `.claude/skills/ask-cursor/SKILL.md` | ✅ | Cursor bridge: one model or parallel fan-out; IDs via `cursor-agent --list-models` | Query Cursor models without inventing CLI flags |
| `.claude/skills/council-setup/SKILL.md` | ✅ | Verifies local `codex` + `cursor-agent` install/auth and Codex plugin skills | Before any Council panel fan-out |
| `.claude/settings.json` | ✅ | Permission allow-rules so scripts / `cursor-agent` / `codex` can run locally without extra prompts | Local Claude Code Council runs |
| `.codex/config.toml` | ✅ | Project default Codex model (`gpt-5.4`) and reasoning effort (`high`) | Codex plugin sessions in this repo |
| `scripts/cursor-agent.sh` | ✅ | Single-model wrapper: `cursor-agent -p` → `--out` | One Cursor model, stdout captured to a file |
| `scripts/cursor-panel.sh` | ✅ | Parallel fan-out; writes `panel/<sanitized-model>.md` | Mode 2 independent deep dives |
| `council/` | ✅ | Session workspace + `_template/` (brief, research, seeds, panel, cross-pollination, synthesis, ledger) | Starting or resuming a Council session |
| `creative-thinking-toolkit/README.md` | ✅ | Front door to the technique library; explains the Wharton "diversity trap" this whole toolkit exists to fight | Understanding why any technique below exists |
| `creative-thinking-toolkit/01-creativity-frameworks.md` | ✅ | 11 classic frameworks as paste-ready prompts (SCAMPER, Six Hats, TRIZ, First-Principles, etc.) | Need a structured ideation framework |
| `creative-thinking-toolkit/02-neurodivergent-thinking-modes.md` | ✅ | 9 cognitive-style-inspired divergent modes (Idea Cascade, Pattern Transfer, Deep-Tunnel, etc.) | Need distinct generative "personas"/lenses, e.g. to assign across panel members |
| `creative-thinking-toolkit/03-combinatorial-creativity.md` | ✅ | Conceptual Blending, Bisociation, Adjacent Possible, 8 combinatorial methods | **Cross-pollinating outputs from different models/sources into a new idea** |
| `creative-thinking-toolkit/04-llm-divergence-techniques.md` | ✅ | Tree-of-Thoughts, persona rotation, **PanelGPT / multi-agent panel**, temperature framing | Direct precedent for any multi-model panel/debate design |
| `creative-thinking-toolkit/05-prompt-library.md` | ✅ | Paste-ready prompts + composed session recipes (including Recipe 5 — Council) | Running an actual session — this is the operational core |
| `creative-thinking-toolkit/06-sources.md` | ✅ | Citations/evidence base for the above | Checking evidence behind a technique |
| `creative-thinking-toolkit/07-multi-model-panel.md` | ✅ | Council method: roles, independent deep-dive / blend / adversarial / converge prompts, ledger rules | Filling Council prompts; do not duplicate this in skills |
| `docs/ROADMAP-api-mode.md` | ✅ design doc; Phase 2 code absent | Phase-2 API-key productization design | Designing automation later — do not implement from this file yet |
| `path-forward/00-START-HERE.md` + `01`–`08` | ✅ | Personal decision/validation framework (assumptions, 90-day plan, one-week validation, idea bank, job strategy, co-founders, ADHD mechanics) | Constraints, validation approach, or idea-bank formatting for a real decision |
| `old research on startup ideas/startup_ideas_braindump.md` | ✅ | Prior startup ideas with signal/verdict/status format | Idea-doc formatting convention; checking if an idea was already explored |
| `old research on startup ideas/grants_and_fellowships_guide.md` | ✅ | Grants/fellowships research | Funding-related research |
| `old research on startup ideas/stigmergy_memory_llm_swarms_review.md` | ✅ | Lit review on LLM swarm coordination & shared memory (stigmergy, CoALA, Memory Curse, governance) | **Designing any shared memory/ledger for multi-agent systems** — this is where the governance rules for Council's `LEDGER.md` come from |

## External tool integrations (local machine only — not available in Claude Code cloud/web mode)
- **Codex plugin** (`openai/codex-plugin-cc`) — `/codex:review`, `/codex:adversarial-review`, `/codex:rescue`. Requires local `codex` CLI, installed + logged in.
- **Cursor CLI** (`cursor-agent`) — headless multi-model access (Grok, GPT, Gemini, Composer, etc.) via `-p`/`--model`. Requires local `cursor-agent`, installed + logged in.
- Phase 1 scaffolding for both is **built** in this repo (`/council`, `/ask-cursor`, `/council-setup`, `scripts/`). Execution of the heterogeneous panel remains **local-only**. In cloud/web, inspect or edit scaffolding; do not fake a panel. `/ideate` still works as a single-model workflow.

## Conventions (match these when adding anything)
- Toolkit files: `NN-topic.md`, opening `# NN · Title`, a Contents block with anchor links, paste-ready fenced `{placeholder}` prompts.
- Skills: YAML frontmatter (`name`, `description`) + prose describing *how to run*, delegating full templates to the toolkit rather than inlining them.
- Never break the diverge-then-converge separation; never let output cluster to the generic center without deploying a diversity lever.
- Neurodivergent-mode language: cognitive-style-inspired, not clinical, not a stereotype, not simulating a real person.
- Adding a new ideation method → add it to the toolkit (new or existing `NN-` file), add a routing row in `ideate/SKILL.md`, add a recipe in `05-prompt-library.md`. Don't create a parallel/duplicate system.

## Before starting any task
1. Check the table above for something already built that covers it.
2. If the task touches multi-model orchestration, read `PLAN.md` in full first — it's the authoritative spec, this file is just the map. Phase 2 details live in `docs/ROADMAP-api-mode.md`.
3. If you build a 📝 item, flip its status to ✅ in this table as part of the same change.
