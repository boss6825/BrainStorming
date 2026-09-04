# Real Estate 101 — a breadth-first domain guide for finding AI-agent use cases

A working knowledge base on the real estate industry, written for a software engineer
with **zero** real-estate background who wants enough operational detail to spot
automation opportunities without being told what they are.

The organising question of the whole guide is not "what is real estate" but
**"who does what, all day, and which parts of it are mechanical?"**

## Start here

| If you have... | Read |
|---|---|
| **20 minutes** | `00-orientation.md` — the whole industry in one chapter |
| **An hour** | `00-orientation.md`, then `15-repetitive-work-atlas.md` |
| **A specific vertical in mind** | That chapter's sections 4 (day in the life) and 8 (what has been tried) |
| **A product idea already** | `11-regulation-tax-insurance.md` section 2, then `12-data-and-proptech-stack.md` section 5 |
| **India as your market** | `13`, then `14` |

## The chapters

| # | File | What it covers |
|---|---|---|
| 00 | `00-orientation.md` | The mental model, the four verbs, asset classes, the compensation table that explains everyone's behaviour, the 20-30 parties in one transaction, core vocabulary and arithmetic, why the industry is still manual, and the eight-shape taxonomy of its repetitive work |
| 01 | `01-residential-brokerage.md` | Buying and selling homes: agents, ISAs, transaction coordinators, compliance reviewers, offshore VAs; the MLS; RESPA, fair housing, and TCPA as hard bounds |
| 02 | `02-property-management-and-leasing.md` | Rental housing operations: leasing, maintenance, delinquency, accounting, LIHTC compliance; the most competitive AI vertical in real estate |
| 03 | `03-mortgage-and-lending.md` | Origination through servicing: processors, underwriters, closers, default servicing, Indian mortgage BPO. The highest-drudgery vertical, and where the licensed-act boundary is most favourable |
| 04 | `04-title-escrow-closing-legal.md` | Making a transfer legally real: search, examination, curative, escrow, recording. Deeply manual, deeply document-bound |
| 05 | `05-appraisal-and-valuation.md` | Putting a number on a property — and the guide's clearest case study in how automation actually arrives (the GSEs did it, not startups) |
| 06 | `06-commercial-real-estate.md` | Brokerage, leasing, capital markets; lease abstraction and CAM reconciliation as the canonical drudge tasks; no MLS, so data is the constraint |
| 07 | `07-development-and-construction.md` | Creating buildings: entitlement, permitting, RFIs, submittals, pay applications, lien waivers, certified payroll |
| 08 | `08-institutional-investment.md` | REITs, funds, syndications, and the quarterly back-office cycle that repeats forever |
| 09 | `09-facilities-and-corporate-real-estate.md` | Running buildings and corporate portfolios: work orders, lease administration, energy compliance. Highest-frequency work in the guide |
| 10 | `10-niche-asset-classes.md` | Twelve specialty sectors from STR and hotels to data centres, storage, distressed and wholesaling |
| 11 | `11-regulation-tax-insurance.md` | The rules layer, written as a constraint map and an opportunity map at once. **Read section 2 before scoping any agent** |
| 12 | `12-data-and-proptech-stack.md` | Engineer-to-engineer: what data you can actually get, what the scraping case law really says, what AI is genuinely in production, and the API reality table |
| 13 | `13-india-market-and-transactions.md` | Indian market structure: presumptive title, no MLS, primary sales, RERA, stamp duty, state land records |
| 14 | `14-india-roles-and-workflows.md` | Who works in Indian real estate, eleven days in the life, the WhatsApp layer, and what each role costs per month |
| 15 | `15-repetitive-work-atlas.md` | **The payoff.** Every repetitive task in the guide, by work shape, with a scoring frame, cross-cutting patterns, and the anti-patterns |

## How each chapter is structured

Every chapter follows the contract in `_CHAPTER-TEMPLATE.md`:

1. How the money actually flows
2. The lifecycle / process spine
3. Role inventory
4. **Day in the life** — with a repetitive-work inventory table per role
5. The document & data layer
6. Systems of record
7. Rules, regulators, and hard constraints
8. What has already been tried
9. Where the human genuinely adds value
10. Glossary
11. Sources / verify before you rely on this

Sections **4** and **8** are the two most useful in any chapter: section 4 shows you the
work, section 8 stops you rebuilding something already in the graveyard.

## Evidentiary status — read this

The guide was built in two passes, and they carry different weight.

| Chapters | How they were written | Weight |
|---|---|---|
| 01, 02, 03, 04, 06 — **sections 1-4/1-6** | Live web research with fetched sources | **Higher.** Includes the day-in-the-life detail |
| All other sections and chapters | Domain knowledge, after a rate limit ended the research fan-out | Structural content reliable; **specific figures are indicative** |

Rather than a fabricated citation list, every chapter written in the second pass ends
with a **"Verify before you rely on this"** table naming its time-sensitive claims and
the primary source to check. Each also carries a **method note** stating which sections
are research-backed.

**What this means in practice:** how a process works, who does what, what the documents
are, and where the licensed-human boundary sits are stable and reliable. **Rates,
thresholds, deadlines, salary bands, company outcomes, and current regulatory status are
not** — verify them before they inform a decision. Chapters 11, 13 and 14 are the ones
most likely to go out of date and most costly to be wrong about.

Nothing in this guide is legal, tax, or investment advice.

## What this guide deliberately does not do

It does not generate use cases. That was the point — the request was for the domain
knowledge, with the ideas left to the reader.

When you want to turn atlas rows into candidate ideas and pressure-test them, this repo
already has the machinery:

- `.claude/skills/ideate/SKILL.md` — structured diverge-then-converge over the
  `creative-thinking-toolkit/`
- `.claude/skills/council/SKILL.md` — a heterogeneous multi-model panel (local only)
  that argues rather than agrees
