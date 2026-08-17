# Roadmap: Council API mode

## Status

Design only. No Phase 2 code is implemented. Phase 1 remains the local Claude Code + Cursor Agent + Codex plugin pipeline. This document freezes the portable surfaces Phase 2 must preserve so automation is a swap of adapters, not a rewrite of method.

## Goal

Replace local CLI/plugin adapters with API-key provider calls while keeping the same Council lifecycle, toolkit prompts, session artifact names, persona/role assignments, and ledger governance. Operators should be able to re-run or resume a session from the same Markdown artifacts whether the panel was driven by `/council` locally or by an API orchestrator later.

## Phase 1 assets to preserve

- Toolkit prompts and recipes in `creative-thinking-toolkit/07-multi-model-panel.md` and Recipe 5 in `05-prompt-library.md`
- Session artifact names: `00-brief.md`, `01-deep-research.md`, `02-divergent-seeds.md`, `panel/<model>.md`, `03-cross-pollination.md`, `04-synthesis.md`, `LEDGER.md`
- Phase boundaries (diverge → independent panel → cross-pollinate → adversarial → converge → ledger curation)
- Default persona/role/lens assignments from toolkit 07
- Ledger schema and governance rules (curated, quality-weighted, contradictions flagged, evaporation, bounded +1 reinforcement)
- Independence rule: no panel member sees other panel outputs before Mode 2 completes

## Proposed architecture

```
Operator / scheduler
        │
        ▼
  Council orchestrator (state machine)
        │
        ├── Prompt renderer (toolkit 07 templates + session files)
        ├── Provider adapters (Claude / OpenAI / xAI / Google / …)
        ├── Artifact store (session directory, file-compatible)
        └── Ledger curator (same rules as Phase 1)
```

Phase 1 scripts (`cursor-agent.sh`, `cursor-panel.sh`, Codex slash-commands) become one adapter family. Phase 2 adds API adapters behind the same `PanelRequest` → `PanelResult` contract. The orchestrator never embeds provider SDKs directly into prompt logic.

## Provider adapter contract

Every model call — independent deep dive, adversarial, or future API equivalents of Opus stages — goes through:

```text
PanelRequest
  run_id            string     # stable id for the whole Council run
  session_path      string     # council/YYYY-MM-DD-slug/
  stage             enum       # research | diverge | panel | adversarial | …
  model_id          string     # runtime id, e.g. grok, gpt, gemini, composer, codex, opus
  role              string     # from toolkit 07 defaults (overridable)
  lens              string     # cognitive-style-inspired lens assignment
  prompt_template   string     # e.g. council.mode2.independent_deep_dive
  prompt_text       string     # fully rendered prompt (placeholders already filled)
  input_artifacts   string[]   # paths the renderer read
  independence      bool       # true ⇒ must not receive other panel outputs
  idempotency_key   string     # run_id + stage + model_id (+ attempt bucket)
  timeout_ms        number
  max_tokens        number?
  metadata          object     # non-secret tags only

PanelResult
  run_id            string
  stage             string
  model_id          string
  status            enum       # ok | degraded | failed | timeout | skipped
  output_markdown   string?    # body to write to artifact_path
  artifact_path     string?    # e.g. panel/grok.md
  error_message     string?
  started_at        string     # ISO-8601
  finished_at       string
  attempt           number
  usage             object?    # input_tokens, output_tokens, estimated_cost_usd
  provider_request_id string?
```

Adapters may differ in auth and transport; they must not differ in artifact naming or prompt semantics.

## Pipeline state machine

```text
brief
  → research
  → diverge
  → panel_pending
  → panel_complete_or_degraded
  → cross_pollinate
  → adversarial
  → converge
  → ledger_curated
  → complete
```

- `panel_pending` fans out independent `PanelRequest`s with `independence=true`.
- `panel_complete_or_degraded` advances when all requested models finish **or** when the degraded threshold is met (partial panel visible; missing models marked `failed`/`timeout`/`skipped`, never silently role-played by another model).
- Stages after the panel may read panel artifacts; stages before must not invent them.

## Persistence and idempotency

- Persist every stage transition and every `PanelResult` under the session path (and optional run journal).
- Idempotency key = `run_id` + `stage` + `model_id` (plus attempt policy). Replaying a stage must not duplicate artifacts; retries overwrite or write `panel/<model>.attempt-N.md` then promote on success.
- Session Markdown remains the source of truth for human inspection; any DB/object store is a cache, not a second semantic model.
- Keep artifact filenames file-compatible with Phase 1 so local and API runs can interoperate.

## Secrets and configuration

- API keys and provider credentials come only from environment variables or secret storage.
- Never write secrets into session Markdown, ledger entries, prompts checked into git, or `PanelRequest.metadata`.
- Model routing tables (which `model_id` maps to which provider/model name) live in config, not in toolkit prompt files.

## Failure, retry, and cost controls

- Bounded concurrency for panel fan-out.
- Per-request timeouts and per-run cost ceilings.
- Retry only transient failures; cap attempts; surface partial failure in the session (degraded panel is allowed; silent substitution is not).
- Cost and usage from `PanelResult.usage` roll up into the run journal for operator visibility.

## Ledger governance in API mode

Ledger rules are unchanged from Phase 1 / toolkit 07:

- curated deposits only
- quality weights 1–5
- contradictions flagged and linked, never silently merged
- evaporation / archive of stale working-set entries
- bounded reinforcement (+1 weight max per claim per session)

API mode may automate the curation prompt; it must not auto-merge contradictions or dump raw panel text into the working set.

## Migration sequence

1. Keep Phase 1 local adapters working.
2. Introduce the orchestrator state machine reading/writing the same session files.
3. Swap one provider adapter at a time (e.g. Codex API for `/codex:review`, then Cursor-routed models to direct providers).
4. Compare artifact diffs on a throwaway session until outputs stay file-compatible.
5. Only then mark local CLI adapters optional.

## Acceptance criteria

- A full run produces the same artifact tree and names as Phase 1.
- Independent panel stage never leaks sibling outputs into another model's prompt.
- Degraded runs record which models failed and still produce an honest synthesis.
- Ledger curation obeys weight, contradiction, evaporation, and +1 caps.
- No API keys appear in session files or git.
- Toolkit prompts remain the rendered source text (no forked prompt dialect).

## Open decisions

- Exact provider model IDs and fallback chains per role
- Degraded-panel threshold (minimum models before cross-pollination may proceed)
- Whether Opus-orchestrated stages stay on Anthropic API only or become swappable
- Run journal format (sidecar JSON vs. extended Markdown)
- Retention policy for raw provider logs

## Non-goals

- No Phase 2 code in the same change set as Phase 1 scaffolding
- No server, UI, deployment topology, SDK packaging, database, or queue product selection
- No public HTTP endpoint selection
- No automatic publishing of session artifacts or ledger entries
