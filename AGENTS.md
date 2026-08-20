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
- Do not ask for or emit hidden chain-of-thought / internal scratchpads.
- Do not invent model ids, citations, or panel seats that did not run.
- Do not majority-vote. Quality of evidence beats number of models that rhymed.

## What this repo is
A personal ideation/research space for startup, life, research, AI/ML, and science ideas.
Raw thinking, not polished products. Multiple LLMs (Claude, Codex, Cursor's models) are
used together as a "panel of experts" that research, disagree, and cross-pollinate.

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
| `.claude/skills/council/SKILL.md` | ✅ | Orchestrator: session lifecycle, five modes, Cursor bridge + Codex, ledger curation | Run or resume a heterogeneous panel session |
| `.claude/skills/ask-cursor/SKILL.md` | ✅ | Cursor CLI bridge (`cursor-agent.sh` / `cursor-panel.sh`, `--list-models`, `--force` git hygiene) | Querying one Cursor model or fanning out |
| `.claude/skills/council-setup/SKILL.md` | ✅ | Verifies local `codex` + `cursor-agent` install/auth, plugin skills, and wrappers | Before any Council panel fan-out |
| `.claude/settings.json` | ✅ | Wrapper allow-rules plus exact list-models/version commands; no unrestricted CLI wildcards | Local Claude Code Council runs |
| `.codex/config.toml` | ✅ | Codex `model_reasoning_effort` only — **does not pin a model id** | Codex plugin defaults |
| `scripts/cursor-agent.sh`, `scripts/cursor-panel.sh`, `scripts/cursor-common.sh` | ✅ | Single-model and parallel-fanout wrappers (`--seat` for distinct personas) | Live panel seats (local); mock tests in `scripts/tests/` |
| `council/` | ✅ | Session workspace + `_template/` (brief, research, seeds, prompts, panel + adversarial, cross-pollination, synthesis, ledger) | Starting or resuming a Council session |
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
| `old research on startup ideas/stigmergy_memory_llm_swarms_review.md` | ✅ | Lit review on LLM swarm coordination & shared memory (stigmergy, CoALA, Memory Curse, governance) | **Motivating** Council `LEDGER.md` design choices — not a proof of that schema |

## Ledger restrictions (non-negotiable)

`council/**/LEDGER.md` is governed shared memory. These restrictions are **Council design choices motivated by** the stigmergy review (Memory Curse / collective false belief), not rules that review proved.

- **Curator-only writes** (orchestrator / human). Panel models never write the ledger.
- **Quality-weighted**, never majority-voted.
- **Contradictions stay separate and cross-linked**; never silently merge them.
- **Raw `panel/` outputs are immutable**; cite paths, do not paste transcripts into the ledger. Cross-pollination reads `panel/outputs.manifest`. Synthesis also reads `panel/adversarial/outputs.manifest`. Neither mode reads `panel/README.md` or `prompts/`, and neither globs as a substitute.
- **Stable IDs**; never reuse; retract/reject/supersede/stale by status, not deletion. **Full schema on every row** regardless of status.
- **Compact entries** with `review-by`; expired → `stale` and must not drive new decisions.
- **Append-only change log** for mutations (status transitions preserve history).
- **No automatic cross-session reuse.** A later session may cite a ledger by path only after a curator/human chooses to. Do not preload another session's ledger as ground truth.

## External tool integrations (local machine only — not available in Claude Code cloud/web mode)
- **Codex plugin** (`openai/codex-plugin-cc`) — `/codex:review`, `/codex:adversarial-review`, `/codex:rescue`. Requires local `codex` CLI, installed + logged in.
- **Cursor CLI** (`cursor-agent`) — headless multi-model access (Grok, GPT, Gemini, Composer, etc.) via `-p`/`--model`. Requires local `cursor-agent`, installed + logged in.
- Phase 1 scaffolding for both is **built** in this repo (`/council`, `/ask-cursor`, `/council-setup`, `scripts/`). Execution of the heterogeneous panel remains **local-only**. In cloud/web, inspect or edit scaffolding; do not fake a panel. `/ideate` still works as a single-model workflow.
- Wrappers: `scripts/cursor-agent.sh`, `scripts/cursor-panel.sh`. Exact Cursor invocation: `cursor-agent -p "$prompt" --model "$model" --output-format text --force`. `--force` requires read-only panel prompts and `git status` before/after. Distinct personas use `cursor-panel.sh --seat`. Launch Codex and Cursor seats concurrently when tool execution supports it.

## Conventions (match these when adding anything)
- Toolkit files: `NN-topic.md`, opening `# NN · Title`, a Contents block with anchor links, paste-ready fenced `{placeholder}` prompts.
- Skills: YAML frontmatter (`name`, `description`) + prose describing *how to run*, delegating full templates to the toolkit rather than inlining them.
- Never break the diverge-then-converge separation; never let output cluster to the generic center without deploying a diversity lever.
- Neurodivergent-mode language: cognitive-style-inspired, not clinical, not a stereotype, not simulating a real person.
- Adding a new ideation method → add it to the toolkit (new or existing `NN-` file), add a routing row in `ideate/SKILL.md`, add a recipe in `05-prompt-library.md`. Don't create a parallel/duplicate system.

## Before starting any task
1. Check the table above for something already built that covers it.
2. If the task touches multi-model orchestration, read `PLAN.md` in full first — it's the original spec; this file is the map; `docs/ROADMAP-api-mode.md` is Phase 2 only.
3. If you build a 📝 item, flip its status to ✅ in this table as part of the same change.
