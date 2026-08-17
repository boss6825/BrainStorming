# Roadmap — Phase 2 API-key mode

**Not implemented.** Phase 1 is the ad-hoc, coding-agent-driven Council in this repo (`/council`, Cursor CLI wrappers, Codex plugin). This document is the productization sketch so Phase 2 is a **swap of transport**, not a rewrite of the thinking.

## Why a later phase

Phase 1 depends on the operator's desktop: `cursor-agent` and `codex` logged in, Claude Code skills driving files on disk. That is the right way to *refine prompts*. It is the wrong way to run Council as a product (no CLI logins, no `--force` on a user's repo, no Opus-in-the-loop unless they bring it).

## What must stay portable (already true in Phase 1)

Keep these stable so an API orchestrator can reuse them:

- The five modes (diverge → deep-dive → cross-pollinate → adversarial → converge)
- Session artifacts and names (`00-brief` … `LEDGER.md`, immutable `panel/`)
- Toolkit `07` prompts (read-only researcher contract; conclusions / evidence / assumptions / uncertainty / counterarguments / concise rationale — **no hidden chain-of-thought requests**)
- Ledger governance (curator-only, quality-weighted, contradictions cross-linked, compact, `review-by`/`stale`, append-only log, no automatic cross-session reuse)
- Diverge-then-converge; no majority vote

Phase 2 should **call the same prompt files**, not invent a second methodology.

## What changes

| Phase 1 | Phase 2 |
|---|---|
| Operator invokes skills | A service owns the state machine |
| `scripts/cursor-panel.sh` + Codex plugin | Provider APIs (Anthropic, OpenAI, Google, xAI, …) with **explicit model ids the user configured** |
| `--force` + git hygiene | No repo mutation; sandboxed or tool-less completions |
| Files in `council/<slug>/` | Same logical documents in object storage / a DB, exportable as this folder layout |
| Opus as curator in Claude Code | A designated curator model + optional human approval gate on ledger writes |
| Parallelism via bash background jobs | Fan-out in the worker (still wait-all, preserve successes, name failures) |

## Suggested shape (when someone builds it)

1. **Auth** — user-supplied API keys (or a gateway). Never commit keys. Never invent model ids; list from the provider.
2. **Job runner** — one session = one pipeline run. Persist artifacts after each mode. Resume = skip completed seats whose existing output has exact matching provenance (same semantics as `--resume`; non-empty alone is not enough).
3. **Panel workers** — N completions of the toolkit `07` §4 prompt, different system personas, same user body. Record exact `provider/model` provenance on every panel document.
4. **Curator workers** — modes 1, 3, 5 (and ledger writes) on the orchestrator model. Ledger writes go through a single curator role; panel workers cannot PATCH the ledger.
5. **Adversarial** — a second-pass completion with the §6 prompt; optional separate provider so it is not the same weights as the front-runner's author.
6. **Evaporation** — a scheduled pass that marks `review-by` overdues `stale` without deleting IDs.
7. **Export** — dump a run back into `council/YYYY-MM-DD-slug/` so this repo remains the source of truth for method.

## Non-goals until Phase 1 prompts have been used live

- Auto-merging contradictions
- Shared memory across users or across sessions without an explicit cite
- "Show your chain of thought" product features
- Treating vote counts as quality
- Replacing `/ideate` Recipes 1–4 (those stay single-model)

## When to reopen this file

After several **local** Council sessions have been run and the prompts in toolkit `07` have been revised against real panel output. Until then, change the markdown, not a service.
