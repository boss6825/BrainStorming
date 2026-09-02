# Chapter contract — real-estate-101

Every chapter in `real-estate-101/` follows this contract. The reader is a software
engineer with **zero** real-estate background who is hunting for AI-agent automation
opportunities. They will find the use cases themselves. Your job is to hand them the
raw operational reality in enough detail that a use case is *obvious* to them.

## Non-negotiables

1. **Define every term on first use, inline.** No unexplained jargon. Ever. If you
   write "BPO", write "BPO (Broker Price Opinion — a cheap valuation done by an agent
   instead of a licensed appraiser)".
2. **Name real software by product name.** "They use a CRM" is worthless.
   "They use Follow Up Boss, kvCORE, or Sierra Interactive" is useful.
3. **Quantify.** Minutes per task, tasks per week, headcount ratios, fee/salary bands,
   error rates, transaction volumes. Give a number or say "no reliable public number".
4. **Cite.** Every non-obvious factual claim gets a source URL inline or in the sources
   table. Mark model-recall claims as `[unverified]` — do not launder recall as fact.
5. **No hype, no vendor marketing copy, no "AI will transform...".** Operational fact only.
6. **Distinguish** verified fact / inference / speculation, per repo AGENTS.md stance.

## Required sections, in this order

```
# NN · Title

> **One-paragraph orientation** — what this part of the industry actually is, who pays
> whom, and why it exists at all. Written for someone who knows nothing.

## Contents
(anchor links to every H2 below)

## 1. How the money actually flows
Who pays, who gets paid, how much, on what trigger. A fee/commission table.
Follow one rupee/dollar from the consumer to every party that touches it.

## 2. The lifecycle / process spine
The end-to-end process as a numbered sequence of stages. For each stage: trigger,
owner role, typical duration, the artifact produced, and what makes it stall.

## 3. Role inventory
A table of EVERY role in this vertical, junior to senior:
| Role | Also called | Seniority | Licence/cert required | Typical comp (US / India where known) | Headcount ratio | What they own |
Include the invisible back-office roles, not just the client-facing stars.
Aim for 10-25 roles. Offshore/BPO roles count. Include roles that exist only at scale.

## 4. Day in the life (the core of this chapter)
Pick the **4-6 highest-headcount or highest-drudgery roles** in this vertical.
For each, write an hour-by-hour day, in this shape:

### <Role name> — day in the life
- **Who they are:** background, how they got here, what they're measured on (their KPI).
- **Their stack:** every tool by name, and what each is used for.
- **A typical day:** timestamped blocks (7:00am … 6:30pm). Concrete. Real artifacts,
  real counts ("re-keys 40 fields from the PDF into the LOS", "makes 60 dials, gets 4
  pickups"). What they do with their hands and their attention.
- **Their week/month:** the periodic work a single day doesn't show (month-end close,
  Friday reporting, quarterly reviews).
- **What they complain about:** in their own words where you can source it — Reddit,
  industry forums, Glassdoor, trade press. Quote and link.
- **Repetitive-work inventory:** a table of every mechanical task:
  | Task | Frequency | Minutes each | Why it's still manual | Data in → data out |

## 5. The document & data layer
Every document, form, and data feed that moves through this vertical. Name the actual
forms. Note the format (PDF, fax, portal, EDI, XML, MISMO, email attachment, paper).
Note which are standardised and which are bespoke per-counterparty. This is where
agent opportunity concentrates — be exhaustive.

## 6. Systems of record
The software that this vertical runs on, as a table:
| System | Category | Who uses it | Market position | API reality | Why it's hard to displace |
Be honest about incumbents' lock-in, data moats, and integration hostility.

## 7. Rules, regulators, and hard constraints
Laws, licensing, liability, and the things that legally CANNOT be automated or
require a licensed human signature. This bounds the opportunity space — treat it as
first-class content, not a footnote.

## 8. What has already been tried
Existing automation, proptech vendors, AI products, and offshore-BPO substitution
already attacking this vertical. Name companies. Note what worked, what died, and why.
The reader must not rebuild a corpse.

## 9. Where the human genuinely adds value
Honest counterweight: the parts of this job that are judgment, relationship, liability
absorption, or physical presence — and that an agent will not take. Say it plainly.

## 10. Glossary
Every term used in this chapter, defined in one line. Alphabetical.

## 11. Sources
| # | Source | URL | What it supports | Confidence |
Minimum 12 real, fetched sources. Prefer primary: regulator sites, trade associations,
job postings, software docs, salary data, practitioner forums. Trade press is fine.
Vendor blogs are weak evidence — mark them low confidence.
```

## Style

- Dense. Assume the reader wants information, not encouragement.
- Tables over prose wherever the content is enumerable.
- Markdown only. No emoji. Line length is not policed.
- Where US and India differ materially, say so inline. India chapters do the reverse.
