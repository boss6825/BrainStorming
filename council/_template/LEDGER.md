# LEDGER — `{YYYY-MM-DD-slug}`

Governed shared memory for this Council session. Not a transcript dump.

## Governance rules

- **Curated, not a dump** — deposit claims and evidence, not raw panel prose.
- **Source- and quality-weighted** — every entry carries an explicit weight (1–5).
- **Contradictions become linked entries** — never silent consensus. Contested claims stay contested until resolved.
- **Stale traces cannot drive scoring** — past `Review by`, the entry is stale.
- **No false independence** — multiple models repeating one source do not constitute independent reinforcement.
- **Panel popularity never increases weight** — agreement among members is not evidence.
- **Independent contribution required** — every panel member must contribute independently; orchestrator paraphrase of one member does not count as triangulation.
- **Bounded reinforcement** — a deposit can gain **at most one weight point per session**.

### Weight scale (1–5)

1. Hypothesis or single-model inference with no independent support.
2. Supported by one credible source or one concrete observation.
3. Triangulated by at least two genuinely independent sources.
4. Strong evidence that survived adversarial review.
5. Direct primary evidence or a decisive test; this is the hard maximum.

### Evaporation

| Type | Review interval | Notes |
|---|---|---|
| `working` | expires when session closes | Archive at completion |
| `episodic` | review within 30 days | |
| `semantic` | review within 90 days | |
| `procedural` | review within 180 days, or immediately after a failed run / tool change | |

- After **Review by**, the entry is **stale** and must not drive scoring.
- If unreviewed for **one further review interval**, move to **Archived**.
- Do not erase contradiction history when archiving or resolving.

### Contradiction handling

- Create a separate contested entry.
- Bidirectional links between conflicting deposits.
- Both remain contested until resolved with evidence; resolution updates status, does not delete history.

### Entry template

```markdown
### L-{YYYYMMDD}-{NN}

- Type: `{working|episodic|semantic|procedural}`
- Status: `{active|contested|stale|archived}`
- Weight: `{1-5}`
- Confidence: `{1-5}`
- First deposited: `{YYYY-MM-DD}`
- Last reviewed: `{YYYY-MM-DD}`
- Review by: `{YYYY-MM-DD}`
- Source files: `{paths}`
- External sources: `{citations or none}`
- Source independence: `{independent|shared-source|single-model|…}`
- Claim: {claim}
- Evidence: {evidence}
- Contradictions: `{L-… bidirectional links or none}`
- Reinforcement history: `{session → ±weight note; max +1 per session}`
- Implication: {what this changes for decisions}
- Decay/archive note: {why stale/archived, or n/a}
```

---

## Active deposits

<!-- Curated entries only. Copy the entry template. -->

### L-{YYYYMMDD}-{NN}

- Type: `{working|episodic|semantic|procedural}`
- Status: `active`
- Weight: `{1-5}`
- Confidence: `{1-5}`
- First deposited: `{YYYY-MM-DD}`
- Last reviewed: `{YYYY-MM-DD}`
- Review by: `{YYYY-MM-DD}`
- Source files: `{paths}`
- External sources: `{citations or none}`
- Source independence: `{…}`
- Claim: {claim}
- Evidence: {evidence}
- Contradictions: `none`
- Reinforcement history: `{none yet}`
- Implication: {implication}
- Decay/archive note: `n/a`

## Contested deposits

<!-- Linked contradiction pairs/groups. Both sides stay contested until resolved. -->

### L-{YYYYMMDD}-{NN}

- Type: `{…}`
- Status: `contested`
- Weight: `{1-5}`
- Confidence: `{1-5}`
- First deposited: `{YYYY-MM-DD}`
- Last reviewed: `{YYYY-MM-DD}`
- Review by: `{YYYY-MM-DD}`
- Source files: `{paths}`
- External sources: `{citations or none}`
- Source independence: `{…}`
- Claim: {claim}
- Evidence: {evidence}
- Contradictions: `↔ L-{YYYYMMDD}-{NN}`
- Reinforcement history: `{…}`
- Implication: {implication}
- Decay/archive note: `n/a`

## Archived deposits

<!-- Stale / evaporated / superseded. Keep contradiction history. Do not use for scoring. -->

### L-{YYYYMMDD}-{NN}

- Type: `{…}`
- Status: `archived`
- Weight: `{1-5}`
- Confidence: `{1-5}`
- First deposited: `{YYYY-MM-DD}`
- Last reviewed: `{YYYY-MM-DD}`
- Review by: `{YYYY-MM-DD}`
- Source files: `{paths}`
- External sources: `{citations or none}`
- Source independence: `{…}`
- Claim: {claim}
- Evidence: {evidence}
- Contradictions: `{links or none}`
- Reinforcement history: `{…}`
- Implication: {implication}
- Decay/archive note: `{why archived}`
