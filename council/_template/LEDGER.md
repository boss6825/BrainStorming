# Ledger — {YYYY-MM-DD-slug}

Governed shared trace for **this session only**. Raw panel files are immutable evidence and are **not** this ledger. Do not dump them here.

Curator: Opus (orchestrator) or the human operator. Panel models do **not** write this file.

## Governance (Council design choices)

These are **Council design choices**, motivated by failure modes described in `old research on startup ideas/stigmergy_memory_llm_swarms_review.md` (Memory Curse, collective false belief, bystander loafing) and spelled out in toolkit [`07`](../../creative-thinking-toolkit/07-multi-model-panel.md). The review did **not** prove this exact schema.

1. **Curator-only writes.** Panel members never append. If a model said it, it lives in `panel/` until the curator extracts a compact claim.
2. **Quality-weighted, not majority-voted.** Three models repeating a fluent average does not beat one model with better evidence. Record *why* an entry is strong (evidence, mechanism, falsifiability), not how many seats agreed.
3. **Contradictions stay separate and cross-linked.** Never silently merge A and B. Give each claim its own ID and add a row in [Contradictions](#contradictions).
4. **Raw outputs are immutable.** Do not edit `panel/*.md` to make the ledger tidier. Cite paths. Cross-pollination consumes **model outputs listed in `panel/outputs.manifest`**. Synthesis consumes that manifest **and** `panel/adversarial/outputs.manifest`. Never `panel/README.md`, files under `prompts/`, or raw `cursor-agent.sh` output.
5. **Stable IDs.** Claims `L-001`, `L-002`, …; contradictions `X-001`, … . Never reuse an ID. Retract, reject, supersede, or mark stale by **status**, not deletion.
6. **Full schema always.** Every entry keeps the columns below for its entire life, including `rejected`, `stale`, `retracted`, and `superseded`. Do not shrink a row when status changes.
7. **Compact entries.** One claim, one block. Enough for a later reader to act; not a transcript.
8. **`review-by` / stale.** Every `active` or `contested` entry has a `review-by` date. After that date it becomes `stale` until a curator re-affirms or retracts it. Stale entries must not drive new decisions.
9. **Append-only change log.** Status transitions are allowed; history is not erased. Every mutation gets a [Change log](#change-log-append-only) line.
10. **No automatic cross-session reuse.** Later sessions may *cite* this file by path after a human/curator chooses to. Do not preload this ledger into another session's context as ground truth.
11. **Bounded reinforcement.** A claim may gain **at most +1 quality point per session**. Multiple models repeating one source are not independent evidence.
12. **Types** (optional CoALA-ish stores): `working` | `episodic` | `semantic` | `procedural`. Suggested review windows if no tighter date is known: working → session close; episodic 30 days; semantic 90 days; procedural 180 days or after a failed run / tool change.

## Status values

| Status | Meaning |
|---|---|
| `active` | Curator-endorsed, within `review-by` |
| `contested` | Has a live cross-link in Contradictions |
| `stale` | Past `review-by`, not yet re-affirmed |
| `retracted` | Curator withdrew it; ID remains |
| `rejected` | Curator declined to endorse; ID remains with full schema |
| `superseded` | Replaced by a newer ID (link it); old ID remains with full schema |

Quality is `1–5` plus a one-line why (evidence, not vibes). Product of novelty/feasibility/fit belongs in `04-synthesis.md`, not here.

### Quality scale (1–5)

1. Hypothesis or single-model inference with no independent support.
2. Supported by one credible source or one concrete observation.
3. Triangulated by at least two genuinely independent sources.
4. Strong evidence that survived adversarial review.
5. Direct primary evidence or a decisive test; hard maximum.

## Entries (full schema — all statuses)

Do not split stale/rejected/superseded rows into a reduced table. Filter by the Status column if you need a view.

| ID | Claim (compact) | Type | Status | Quality | Confidence | Sources (paths) | Independence | Review-by | Links |
|---|---|---|---|---|---|---|---|---|---|
| L-001 | {example — replace} | working | active | 3 — {why} | medium | `01-deep-research.md`, `panel/{label}.md` | independent / shared-source / single-model | {YYYY-MM-DD} | |

## Contradictions

| ID | Entry A | Entry B | Nature of disagreement | Resolution |
|---|---|---|---|---|
| X-001 | L-00? | L-00? | {mechanism / fact / value} | open / {note} |

## Change log (append-only)

Status transitions preserve history here. Never delete a log line or an entry ID.

| UTC | Actor | Action |
|---|---|---|
| {YYYY-MM-DDThh:mmZ} | curator | session opened from `_template` |
