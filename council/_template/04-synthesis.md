# Synthesis — `{YYYY-MM-DD-slug}`

Do not soften. Do not hide panel failures. Do not treat the composite score as evidence — it is a ranking aid only.

## Evidence state

- Panel members attempted: `{list model ids}`
- Panel members succeeded: `{list}`
- Panel members failed: `{list + failure file paths}`
- Adversarial artifacts present: `{yes/no + paths}`
- Material gaps that bound confidence: `{gaps}`

## Scoring method

- Dimensions: **novelty × feasibility × fit**, each scored **1–5**.
- Composite = novelty × feasibility × fit (max **125**).
- **Confidence** is scored separately (1–5) and must not inflate composite.
- Composite is not evidence. Evidence lives in claims, sources, and adversarial survival.

## Scorecard

| ID | Candidate | Novelty (1–5) | Feasibility (1–5) | Fit (1–5) | Composite | Confidence (1–5) | Notes |
|---|---|---|---|---|---|---|---|
| C1' | {candidate} | {n} | {n} | {n} | {n} | {n} | {note} |
| C2' | {candidate} | {n} | {n} | {n} | {n} | {n} | {note} |
| C3' | {candidate} | {n} | {n} | {n} | {n} | {n} | {note} |

## Top candidates

1. **{candidate}** — composite `{n}`; confidence `{n}`. Why it leads: {reason}. Killer risk: {risk}.
2. **{candidate}** — composite `{n}`; confidence `{n}`. Why second: {reason}.
3. **{candidate}** — composite `{n}`; confidence `{n}`. Why third: {reason}.

## Final red team of number one

- Strongest attack: {attack}
- What would falsify it cheaply: {falsifier}
- What the panel already knew and ignored: {ignored signal}
- Residual belief after attack: {still standing / wounded / dead}

## Verdict

`{KILL|PIVOT|VALIDATE}`

- Rationale: {direct rationale; no flattery}
- If PIVOT: pivot to `{what}` because `{why}`
- If VALIDATE: what is being validated is `{precise claim}`, not the whole pitch
- If KILL: do not resurrect without new primary evidence

## Cheapest decisive next test

- Test: {smallest experiment or check that could kill or upgrade confidence}
- Cost/effort bound: {bound}
- Success / fail signals: {signals}
- Owner / when: `{owner}` / `{when}`

## Unresolved contradictions

| Contradiction | Linked ledger / panel refs | Why unresolved | Blocks scoring? |
|---|---|---|---|
| {contradiction} | {refs} | {why} | {yes/no} |

## Ledger deposits

Curated deposits only — not raw panel prose. List intended `L-{YYYYMMDD}-{NN}` entries and whether they are active or contested.

| Proposed ID | Type | Weight | Claim (short) | Contested? |
|---|---|---|---|---|
| `L-{YYYYMMDD}-{NN}` | `{working\|episodic\|semantic\|procedural}` | `{1–5}` | {claim} | `{yes/no}` |
