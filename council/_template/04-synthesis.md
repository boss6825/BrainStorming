# Synthesis — `{YYYY-MM-DD-slug}`

**Converging — cold evaluation.** Judgement is on. A confident KILL is a successful session. Do not soften. Do not hide panel failures. Do not treat the composite score as evidence — it is a ranking aid only.

Inputs: the blends in `03-cross-pollination.md` plus **initial** model outputs listed in `panel/outputs.manifest` **and** Cursor/Codex red-team outputs listed in `panel/adversarial/outputs.manifest`. Do not treat `panel/README.md`, `prompts/`, or raw `cursor-agent.sh` output as seat evidence. If a manifest is missing, say so — do not glob.

Ask for **conclusions, evidence, assumptions, uncertainty, counterarguments, concise rationale.** Do not request hidden chain-of-thought.

## Evidence state

- Panel members attempted: `{list model ids}`
- Panel members succeeded (in `panel/outputs.manifest`): `{list}`
- Panel members failed / missing: `{list}`
- Adversarial artifacts present (`panel/adversarial/outputs.manifest`): `{yes/no + paths}`
- Material gaps that bound confidence: `{gaps}`

## Scoring method

- Dimensions: **novelty × feasibility × fit**, each scored **1–5**.
- Composite = novelty × feasibility × fit (max **125**).
- **Evidence confidence** is reported separately (`low` | `medium` | `high`) and must not inflate composite.
- Composite is not evidence. Evidence lives in claims, sources, and adversarial survival.

## Scorecard

| ID | Candidate | Novelty (1–5) | Feasibility (1–5) | Fit (1–5) | Composite | Evidence confidence | Biggest risk |
|---|---|---|---|---|---|---|---|
| C1 | {candidate} | {n} | {n} | {n} | {n} | `{low\|medium\|high}` | {risk} |

## Top candidates

1. **{candidate}** — composite `{n}`; evidence confidence `{low|medium|high}`. Why it leads: {reason}. Killer risk: {risk}.
2. **{candidate}**
3. **{candidate}**

## Front-runner red team

Idea: {#1}

- Strongest arguments against:
- Shakiest hidden assumption:
- What would falsify it cheaply:
- Scenario where it fails badly:
- Redesign that would survive each objection (or why it can't):
- Residual belief after attack: {still standing / wounded / dead}

## Codex / Cursor adversarial notes

- Codex: {path of `/codex:adversarial-review` **with** documented provenance, listed in `panel/adversarial/outputs.manifest`}
- Cursor red-team: {paths from `panel/adversarial/outputs.manifest`}

## Verdict

**KILL / PIVOT / VALIDATE**

- Rationale: {direct rationale; no flattery}
- If PIVOT: the pivot **and** the assumption that forced it
- If VALIDATE: the **single cheapest next test** that moves this from "maybe" to yes/no — ideally this week — plus success/fail signals
- If KILL: what evidence would have to change for this to be worth reopening. Do not reopen inside this session.

## Unresolved contradictions

| Contradiction | Linked ledger / panel refs | Why unresolved | Blocks scoring? |
|---|---|---|---|
| {contradiction} | {refs} | {why} | {yes/no} |

## Ledger updates made

Curated deposits only — not raw panel prose. Use this session's `L-001` schema.

- New IDs:
- Contradictions linked:
- `review-by` dates set:
- Quality / type / independence notes:
