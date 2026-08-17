# Independent panel outputs

This directory holds **one file per panel member** (and later adversarial/red-team passes). Files are created at runtime. Do **not** pre-create model files. Do **not** merge, summarize, or cross-reference other members' answers here.

## Independence rule

- All members receive the same inputs: brief, deep research, divergent seeds, and shared questions.
- Members must **not** see other panel answers before writing their own file.
- `"I agree with the others"` / consensus language is invalid and should be rejected on intake.
- Separate **facts**, **inference**, and **speculation**. Label unverified claims.
- Orchestrator may fan out in parallel; independence is about content, not wall-clock.

## Expected response structure

Each successful `panel/<sanitized-model-id>.md` or `panel/codex.md` should use:

```markdown
# {model id} — independent deep dive

## Assigned role and lens
## Reframing from this lens
## Seed-by-seed observations
## Deepened candidates
## One new candidate absent from the seeds
## Facts and evidence
## Assumptions and uncertainties
## Contradictions or framing errors
## Handoff building blocks
```

Fill every section. Empty sections must say what is missing, not be omitted silently.

## Failure files

If a model times out, errors, returns empty, or is unavailable:

- Keep the file (e.g. `panel/{sanitized-model-id}.md` or a clearly named failure sibling).
- Record: model id, timestamp, error/empty/timeout, command or skill invoked.
- Do not delete failure files to clean the folder.
- Do not invent substitute answers from the orchestrator to "fill the seat."

Adversarial / red-team outputs (written later) land here as examples like:

- `panel/codex-adversarial.md`
- `panel/{sanitized-cursor-model-id}-red-team.md`

Those are not independent deep dives; they pressure-test candidates after cross-pollination shortlisting.
