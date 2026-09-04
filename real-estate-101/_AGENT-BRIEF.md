# Operating instructions for chapter-writing agents

## Read first
1. `real-estate-101/_CHAPTER-TEMPLATE.md` — the binding structure contract.
2. `AGENTS.md` — the critical-thinker stance. No flattery. Distinguish verified fact
   from inference from speculation. Mark model-recall claims `[unverified]`.
   Never invent a citation, a statistic, a company, or a source URL.

## Reader
A software engineer, based in India, with ZERO real-estate background, hunting for
AI-agent automation opportunities. They will find the use cases themselves. Your job
is to hand them operational reality in enough detail that a use case becomes obvious.
Define every term inline on first use. Name real software. Quantify everything.

## Budget discipline (important — a previous run was killed by rate limits)
- Web search budget is shared and finite. Cap yourself at roughly **20-30 WebSearch
  calls**. Batch your questions — one good search beats three narrow ones.
- Prefer **WebFetch on a specific known URL** over search where you already know the
  source (regulator sites, trade associations, vendor docs, Wikipedia for orientation).
- Do not fetch the same URL twice. Do not fetch giant PDFs you only need one number from
  if an HTML summary exists.

## WRITE INCREMENTALLY — this is mandatory
Your process must be:
1. **First**, before any research, write the chapter file to its target path with the
   full H1, the orientation paragraph placeholder, and every required H2 heading from
   the template, each marked `<!-- TODO -->`. Use a bash heredoc.
2. **Then** research and fill sections in, rewriting the file (or appending) as each
   section completes. Save after every 2-3 sections.
3. Never hold the whole chapter in memory to write once at the end. If you are killed
   mid-run, whatever you have saved must still be useful to the reader.

## Quality bar
- Section 4 (day in the life) and every "repetitive-work inventory" table are the
  highest-value content in the guide. If you must trade depth somewhere, protect these.
- Tables over prose wherever content is enumerable.
- Where a number is not publicly available, write "no reliable public figure found"
  rather than inventing one or quietly omitting the claim.
- Minimum 12 real, fetched sources in the sources table, with working URLs.
- No emoji. No vendor marketing voice. No "AI will revolutionise..." framing.

## Return to the orchestrator
Only: file path, final line count, the 5 highest-drudgery tasks you found, and an
explicit list of anything you could not verify. Do not paste chapter content back.
