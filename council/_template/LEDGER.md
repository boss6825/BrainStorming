# Ledger — {YYYY-MM-DD-slug}

Governed shared trace for **this session only**. Raw panel files are immutable evidence and are **not** this ledger. Do not dump them here.

Curator: Opus (orchestrator) or the human operator. Panel models do **not** write this file.

## Governance (Council design choices)

These are **Council design choices**, motivated by failure modes described in `old research on startup ideas/stigmergy_memory_llm_swarms_review.md` (Memory Curse, collective false belief, bystander loafing) and spelled out in toolkit [`07`](../../creative-thinking-toolkit/07-multi-model-panel.md). The review did **not** prove this exact schema; it is an operator policy we chose so ungoverned dumps cannot silently become ground truth.

1. **Curator-only writes.** Panel members never append. If a model said it, it lives in `panel/` until the curator extracts a compact claim.
2. **Quality-weighted, not majority-voted.** Three models repeating a fluent average does not beat one model with better evidence. Record *why* an entry is strong (evidence, mechanism, falsifiability), not how many seats agreed.
3. **Contradictions stay separate and cross-linked.** Never silently merge A and B into a mushy consensus. Give each claim its own ID and add a row in [Contradictions](#contradictions).
4. **Raw outputs are immutable.** Do not edit `panel/*.md` to make the ledger tidier. Cite paths. Cross-pollination and synthesis consume **model outputs listed in `panel/outputs.manifest`**, never `panel/README.md` or files under `prompts/`.
5. **Stable IDs.** Claims `L-001`, `L-002`, …; contradictions `X-001`, … . Never reuse an ID. Retract, reject, supersede, or mark stale by **status**, not deletion.
6. **Full schema always.** Every entry keeps the columns below for its entire life, including `rejected`, `stale`, `retracted`, and `superseded`. Do not shrink, move, or rewrite a row into a shorter table when status changes.
7. **Compact entries.** One claim, one block. Enough for a later reader to act; not a transcript. This is evaporation-by-design: text does not decay on its own.
8. **`review-by` / stale.** Every `active` or `contested` entry has a `review-by` date. After that date it becomes `stale` until a curator re-affirms or retracts it. Stale entries must not drive new decisions. The row stays; only `Status` (and the change log) changes.
9. **Append-only change log.** Status transitions are allowed; history is not erased. Every mutation gets a [Change log](#change-log-append-only) line (UTC, actor, ID, from → to, why). Do not rewrite prior log lines.
10. **No automatic cross-session reuse.** Later sessions may *cite* this file by path after a human/curator chooses to. Do not preload this ledger into another session's context as if it were ground truth.

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

## Entries (full schema — all statuses)

Do not split stale/rejected/superseded rows into a reduced table. Filter by the Status column if you need a view; the source of truth is this table plus the change log.

| ID | Claim (compact) | Status | Quality | Sources (paths) | Review-by | Links |
|---|---|---|---|---|---|---|
| L-001 | {example — replace} | active | 3 — {why} | `01-deep-research.md`, `panel/{label}.md` | {YYYY-MM-DD} | |

## Contradictions

| ID | Entry A | Entry B | Nature of disagreement | Resolution |
|---|---|---|---|---|
| X-001 | L-00? | L-00? | {mechanism / fact / value} | open / {note} |

## Change log (append-only)

Status transitions preserve history here. Never delete a log line or an entry ID.

| UTC | Actor | Action |
|---|---|---|
| {YYYY-MM-DDThh:mmZ} | curator | session opened from `_template` |
