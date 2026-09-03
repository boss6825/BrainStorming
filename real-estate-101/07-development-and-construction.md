# 07 · Development, Entitlement, and Construction

> Every building in the world was, at some point, a person deciding to put one there and
> then spending years getting permission and money to do it. This chapter covers how
> property gets *created*: buying the land, obtaining the legal right to build,
> designing it, financing it, physically constructing it, and handing it over. It has
> the largest workforce of any vertical in this guide — construction is one of the
> world's biggest employers — and, by a wide margin, the worst productivity record.
> Labour productivity in construction has been roughly flat for decades while
> manufacturing's has multiplied. That gap is the reason this chapter matters.

## Contents

- [1. How the money actually flows](#1-how-the-money-actually-flows)
- [2. The lifecycle / process spine](#2-the-lifecycle--process-spine)
- [3. Role inventory](#3-role-inventory)
- [4. Day in the life](#4-day-in-the-life)
- [5. The document & data layer](#5-the-document--data-layer)
- [6. Systems of record](#6-systems-of-record)
- [7. Rules, regulators, and hard constraints](#7-rules-regulators-and-hard-constraints)
- [8. What has already been tried](#8-what-has-already-been-tried)
- [9. Where the human genuinely adds value](#9-where-the-human-genuinely-adds-value)
- [10. Glossary](#10-glossary)
- [11. Verify before you rely on this](#11-verify-before-you-rely-on-this)

---

## 1. How the money actually flows

### The development pro forma

A worked example — a small US apartment project — so you can follow the logic. Numbers
are illustrative.

```
COSTS
  Land                                          $ 3,000,000
  Hard costs (100 units x $180,000)             $18,000,000    the physical building
  Soft costs (design, legal, fees, insurance)   $ 3,200,000    ~15-20% of hard costs
  Financing cost / interest reserve             $ 1,600,000    interest during construction
  Contingency (5%)                              $ 1,300,000
                                                -----------
  TOTAL PROJECT COST                            $27,100,000

INCOME AT STABILISATION
  100 units x $1,900/mo x 12                    $ 2,280,000    gross potential rent
  less vacancy 5%                               $  (114,000)
  plus other income                             $   100,000
  less operating expenses ~35%                  $  (793,100)
                                                -----------
  STABILISED NOI                                $ 1,472,900

THE TEST
  Yield on cost = 1,472,900 / 27,100,000        =  5.43%
  Market cap rate                               =  5.00%
  Development spread                            =  0.43%   <-- thin. This deal is marginal.

  Value at 5.00% cap = 1,472,900 / 0.05         = $29,458,000
  Profit                                        = $ 2,358,000  (8.7% of cost)
```

Now note what happens if hard costs rise 8% and the market cap rate moves out 50 basis
points — both entirely ordinary events over a three-year project:

```
  New total cost   $28,540,000    Value at 5.5% cap = $26,780,000   -> a $1.76m LOSS
```

**This is the single most important thing to understand about development.** The
developer commits money years before they find out whether it worked, and the margin is
thin enough that ordinary movements in cost and interest rates flip the outcome.
Everything else in this chapter — the obsession with schedule, the fight over change
orders, the desperation to shorten entitlement — follows from that arithmetic. **Time
is not a soft cost in development. Time is the risk.**

### The capital stack

From lowest risk and lowest return, up:

| Layer | Typical share | Return expectation | Who provides it |
|---|---|---|---|
| Senior construction loan | 55-65% of cost | Floating rate over a benchmark | Banks, debt funds |
| Mezzanine debt / preferred equity | 5-15% | 10-14% | Debt funds, specialist lenders |
| LP equity | 25-35% | 15-20% IRR target | Institutions, family offices, syndicated investors |
| GP / sponsor co-invest | 5-10% of equity | The promote | The developer |

The developer earns a **development fee** (typically 3-5% of cost, drawn over the
project) plus a **promote** — an outsized share of profits above a hurdle. The fee keeps
the lights on; the promote is the actual business.

**The construction loan draw is the mechanism that governs the whole build.** The lender
does not hand over the money at the start. The contractor bills monthly, an inspector
verifies the work, title is updated to confirm no new liens, and the lender funds that
month's draw. Every party in the chain is waiting on this monthly cycle, and the
paperwork governing it is the most repetitive work in the chapter.

## 2. The lifecycle / process spine

| # | Stage | Duration | Owner | Artifact | What stalls it |
|---|---|---|---|---|---|
| 1 | Site identification | Ongoing | Land acquisition manager | Site list | Finding a site that pencils |
| 2 | LOI and PSA with due diligence period | 1-3 months | Development manager | Signed PSA | Seller price expectations |
| 3 | Feasibility: market study, zoning analysis, Phase I ESA, geotech, survey, utility availability | 1-4 months | Development team + consultants | Feasibility package | Discovering wetlands, contamination, or no sewer capacity |
| 4 | **ENTITLEMENT** | **6 months to 5+ years** | Entitlement manager, land use counsel | Approvals, development agreement | **The single greatest time and risk sink in US development.** See below |
| 5 | Design: schematic → design development → construction documents | 6-18 months | Architect | Drawings and specs | Coordination between disciplines; owner changes |
| 6 | Permitting: building permit plan review | 1-12 months | Expediter, architect | Issued permit | Municipal review backlogs; comment-and-resubmit cycles |
| 7 | GC selection and buyout | 2-4 months | Preconstruction | Contract, subcontracts | Pricing above budget |
| 8 | Construction | 12-36 months | Superintendent, PM | The building | Weather, labour, materials, RFIs, change orders |
| 9 | Inspections and certificate of occupancy | Ongoing to end | Superintendent | CO | Failed inspections; punch list |
| 10 | Lease-up / sales | 6-18 months | Property management or sales | Stabilised occupancy | Market softening |
| 11 | Stabilisation → refinance or sale | — | Asset management | Permanent loan or sale | Rates |

### Entitlement, in more detail

This is the part that is unfamiliar to people outside the industry and the part that
consumes the most calendar. Depending on jurisdiction and project it can include:
rezoning, conditional use permits, variances, site plan approval, subdivision plats,
planning commission hearings, city council votes, design review boards, environmental
review (CEQA in California, NEPA where federal action is involved), traffic studies,
community meetings, negotiated development agreements, impact fees, and inclusionary
affordable-housing requirements.

Two properties of entitlement make it distinctive: it is **political** (elected bodies
vote, neighbours object, and outcomes are not purely technical), and it is
**per-jurisdiction** to a degree that defeats generalisation. This is why "permit
expediter" is a real profession — someone whose value is knowing how a specific city's
process and staff actually work.

## 3. Role inventory

### Development side

| Role | Seniority | Licence | Typical comp (US) | Owns |
|---|---|---|---|---|
| Land acquisition manager | Mid-senior | Sometimes brokerage | $110-180k + bonus | Finding and tying up sites |
| Development analyst / associate | Entry-mid | None | $70-120k | The pro forma, the schedule, coordination |
| Development manager | Senior | None | $130-200k+ | The project end to end |
| Entitlement manager | Mid-senior | None | $110-170k | Approvals and hearings |
| **Permit expediter** | Mid | None | $60-110k or fee-based | Navigating a specific municipality's permit process |
| Land use attorney | Senior | Bar | $300-800/hr | Hearings, agreements, appeals |
| Owner's representative | Senior | Often PE/AIA | $120-200k | Represents the owner against the GC |

### Design and consultants

Architect, structural engineer, MEP (mechanical/electrical/plumbing) engineer, civil
engineer, landscape architect, geotechnical engineer, environmental consultant,
surveyor, land planner, traffic engineer, code consultant, acoustic consultant.
**Architects and engineers must be licensed and must stamp their drawings** — a hard
constraint discussed in section 7.

### Construction side

| Role | Seniority | Typical comp (US) | Owns |
|---|---|---|---|
| Project executive | Senior | $160-250k | Multiple projects, client relationship |
| **Project manager** | Mid-senior | $110-170k | Budget, schedule, contracts, change orders |
| **Project engineer** | Entry-mid | $65-95k | **RFIs, submittals, document control.** The drudgery role |
| Assistant PM | Entry-mid | $75-105k | Supports the PM |
| **Superintendent** | Mid-senior | $110-180k | Everything physically happening on site |
| Assistant superintendent | Entry-mid | $70-105k | Field coordination |
| Field engineer | Entry | $60-85k | Layout, measurement, verification |
| **Estimator** | Mid-senior | $90-150k | Pricing the work during a bid |
| Chief estimator / preconstruction manager | Senior | $140-200k | Bid strategy |
| **Scheduler** | Mid | $90-140k | The critical path schedule (Primavera P6) |
| VDC / BIM manager | Mid | $90-140k | 3D coordination, clash detection |
| Procurement / buyout manager | Mid | $90-130k | Awarding subcontracts |
| Safety manager | Mid | $80-125k | OSHA compliance, incident prevention |
| Quality manager | Mid | $85-130k | Inspection and testing coordination |
| **Project accountant** | Mid | $65-95k | **Pay applications, lien waivers, cost reports** |
| Contract administrator | Mid | $70-100k | Subcontracts, insurance, compliance |
| Document controller | Entry-mid | $55-80k | Drawing revisions, submittal logs |
| Foreman / general foreman | Trade | Varies | Directing a crew |
| Tradespeople | Trade | Varies widely; often union scale | The actual work |

### Public sector

City planner, plan reviewer, permit technician, building inspector, zoning
administrator, public works reviewer, fire marshal. **These are the people on the other
side of the counter**, and their backlogs are a first-order constraint on housing
supply in many cities. They are also badly served by software.

### Production homebuilding — a distinct business

Volume homebuilders (building hundreds or thousands of similar houses) operate very
differently from commercial developers: repeatable plans, a purchasing department
negotiating national supplier contracts, on-site sales counsellors, construction
superintendents each running 10-25 houses simultaneously, and a warranty department.
**Because the product repeats, the processes are far more standardised** — which makes
it the most automation-tractable corner of construction. Roles: land developer,
purchasing agent, options coordinator, sales counsellor, construction superintendent,
closing coordinator, warranty coordinator.

## 4. Day in the life

### Project engineer — day in the life

The canonical entry-level construction role, and one of the clearest drudgery
concentrations in this entire guide.

- **Who they are:** a recent civil engineering or construction management graduate,
  1-4 years in. Measured on how fast RFIs and submittals turn around and whether the
  logs are current.
- **Their stack:** **Procore** (or Autodesk Construction Cloud) for RFIs, submittals and
  daily reports; **Bluebeam Revu** for marking up drawings; Outlook — an enormous
  amount of Outlook; Excel for logs the software does not handle well; Primavera P6 or
  MS Project read-only.

**A typical day**

| Time | What happens |
|---|---|
| 6:30 | On site before the trades. Walk the areas of active work |
| 7:00 | Foreman's huddle. Three questions come up that nobody on site can answer from the drawings — these become RFIs |
| 7:45 | Write the three RFIs: describe the condition, reference the drawing sheet and detail, attach a marked-up Bluebeam snapshot, propose a solution, submit to the architect. **15-30 minutes each if done properly** |
| 9:00 | Submittal review queue. The mechanical subcontractor has sent a 180-page product data submittal for air handling units. Check it against the specification section, flag deviations, log it, forward it to the engineer of record |
| 10:30 | Chase the architect on four RFIs that are past due. Two emails, one call. **This is a large fraction of the job** |
| 11:15 | A subcontractor claims a change is extra work. Pull the contract documents, the original drawings, and the relevant RFI response to determine whether it was in the base scope |
| 12:00 | Lunch at the desk while updating the submittal log |
| 13:00 | Distribute a revised drawing set. Compare the new set to the old (Bluebeam overlay), identify every change, notify the affected subcontractors, update the current-set record. **Missing a revision here causes rework worth far more than the salary** |
| 14:30 | Walk the site to verify installed work against a submittal |
| 15:30 | Write the daily report: manpower by trade, weather, deliveries, work performed, delays, photos |
| 16:30 | More RFI chasing. Prepare tomorrow's inspection request |
| 17:30 | Update the RFI log, the submittal log, and the change order log for the weekly owner meeting |

- **The numbers:** a mid-size commercial project generates **hundreds to low thousands
  of RFIs** and a comparable number of submittals over its life. Industry research has
  repeatedly found that a large share of RFIs are avoidable and that a meaningful
  portion are never given a substantive answer. Each one costs real time on both sides.
- **What they complain about:** architects who take weeks to answer an RFI; drawings
  that contradict each other; being the person blamed for a delay caused by someone
  else's slow response; the sheer volume of email.

**Repetitive-work inventory — project engineer**

| Task | Frequency | Minutes each | Why it's still manual | Data in → data out |
|---|---|---|---|---|
| Drafting an RFI | 5-25/week | 15-30 | Requires locating the relevant drawing detail and articulating the conflict | Field question → formal RFI |
| Chasing overdue RFIs | Daily | 30-60/day total | The responder is a different company with no contractual urgency | Log → follow-up emails |
| Submittal review against spec | 5-20/week | 20-120 | Comparing a product datasheet to a spec section clause by clause | Submittal PDF + spec → approve/reject with comments |
| Log maintenance (RFI, submittal, change order) | Daily | 30-60 | Data lives in several systems and email | Events → updated logs |
| Drawing revision comparison and distribution | 1-4/month | 60-180 | Visual diff of drawing sets, then targeted notification | Old + new set → change list + notices |
| Daily report | Daily | 20-40 | Manual observation and photo assembly | Site observation → report |
| Scope determination for claimed extras | 2-8/week | 30-90 | Requires reading contract, drawings, specs, and RFI history together | Claim → in-scope/out-of-scope determination |

### Superintendent — day in the life

- **Who they are:** often came up through the trades; 15-30 years of experience.
  Measured on schedule, safety, and quality. The single most operationally important
  person on a job site.
- **Their stack:** phone (constantly), Procore on a tablet, printed drawings in the
  trailer, the schedule on the wall, a truck.

**A typical day:** on site by 6:00, walks the whole job before the trades arrive; 6:45
coordination huddle with foremen to sequence the day and resolve conflicts between
trades wanting the same space; the rest of the day is **continuous interruption** —
inspections to meet, deliveries to direct, a trade that showed up short-handed, a
conflict between the electrician and the ductwork, a safety issue to shut down, the PM
wanting a schedule update, the owner walking through. Documentation happens in the
gaps and after hours: daily report, photos, tomorrow's plan, inspection requests.

**The honest read on automation here:** the superintendent's core work is real-time
physical coordination and judgment. What *is* automatable is the documentation burden
they carry — reports, photo logs, inspection scheduling, and the constant status
communication upward. Superintendents routinely describe paperwork as the part of the
job that keeps them from the actual job.

### Estimator during a bid — day in the life

- **Who they are:** deeply experienced in what things cost. Measured on win rate and,
  more importantly, on whether the jobs they win are profitable.
- **Their stack:** Bluebeam for takeoff, Excel for the estimate, an internal historical
  cost database, phone and email to subcontractors, sometimes a takeoff tool.

**A typical bid cycle:** receive the drawings and specifications; perform **quantity
takeoff** — measuring every element off the drawings, either manually in Bluebeam or
with a takeoff tool; send invitations to bid to dozens of subcontractors; **chase them
relentlessly**, because most will not respond and many respond hours before the
deadline; level the bids received (comparing scopes that do not match — one plumber
included the site utilities, another did not); assemble general conditions and overhead;
apply markup; submit. **Bid day is chaos**: numbers arrive by email and phone in the
final two hours and get entered under time pressure.

**Repetitive-work inventory — estimating**

| Task | Frequency | Effort | Why it's still manual | Data in → data out |
|---|---|---|---|---|
| Quantity takeoff | Every bid | Days | Reading quantities off drawings; AI takeoff tools exist but accuracy on complex work is contested | Drawings → quantities |
| Subcontractor invitation and chasing | Every bid | Hours daily | Subs are busy and bid selectively | Bid list → responses |
| **Bid levelling** | Every bid | Hours | Each sub's proposal includes and excludes different scope; normalising them is judgment-heavy | Varied proposals → apples-to-apples comparison |
| Scope gap analysis | Every bid | Hours | Finding what nobody bid — the source of losses | Proposals + specs → gaps |
| Historical cost lookup | Every bid | Hours | Data trapped in past projects and spreadsheets | Past jobs → unit costs |

### Project accountant — day in the life

The pay application cycle is one of the most mechanical, deadline-driven processes in
construction, and it repeats every single month on every single project.

- **Their stack:** Sage 300 CRE or Viewpoint Vista for accounting; Procore or Textura/
  GCPay for pay applications and lien waivers; Excel; email.

**The monthly cycle:** subcontractors submit pay applications (**AIA G702/G703** or
equivalent) claiming a percentage complete on each line of their schedule of values;
the accountant checks each against the contract value, previously billed amounts, and
retainage; the PM and superintendent verify the percentages are real; **conditional
lien waivers** must be collected from every subcontractor and every one of *their*
suppliers before payment, and **unconditional waivers** after; the GC assembles all of
this into its own pay application to the owner; the owner's lender sends an inspector;
title runs a date-down search to confirm no liens have been filed; the draw funds; then
everyone gets paid and the cycle restarts.

**On a project with 40 subcontractors, that is 40 pay applications, 40+ conditional
waivers, 40+ unconditional waivers, and a stack of lower-tier supplier waivers — every
month.** Missing a single waiver can hold up an entire draw.

**Repetitive-work inventory — project accounting**

| Task | Frequency | Minutes each | Why it's still manual | Data in → data out |
|---|---|---|---|---|
| Checking a sub's pay application | 40+/month | 10-25 | Verify percentages, retainage, prior billings, math | G702/G703 → approved or returned |
| Collecting and verifying lien waivers | 80-150/month | 5-10 each | Correct statutory form, correct amounts, correct signatures, correct tiers | Waiver PDF → verified record |
| Assembling the owner draw package | Monthly | 4-12 hours | Compiling dozens of documents into a lender-acceptable package | Sub billings → draw request |
| **Certified payroll review** (prevailing wage jobs) | Weekly | Hours | Per-worker, per-classification wage verification on WH-347 forms; a large compliance burden on public work | Payroll → certified reports |
| Cost report / job cost update | Monthly | Hours | Reconciling committed cost, actual cost, and forecast | Invoices + commitments → cost report |
| Insurance certificate (COI) tracking | Continuous | 5-15 each | Certificates expire; coverage must match contract requirements | COI → compliance status |

### Development associate — day in the life

Running the pro forma, the consultant team, and the entitlement calendar. A day mixes:
updating the financial model with new cost or rent assumptions; assembling the monthly
report for investors; coordinating a dozen consultants each producing a report on a
different schedule; preparing exhibits for a planning commission hearing; tracking a
municipal review that has been silent for six weeks; chasing invoices and processing
consultant payments. **The work is mostly coordination, calendar, and document
assembly**, punctuated by high-stakes analysis.

### Permit expediter / municipal plan reviewer

Two sides of the same counter, both worth understanding.

The **expediter** knows a specific city's process: which counter to visit, which
reviewer is assigned to what, what the unwritten preferences are, how to package a
resubmittal so it clears. Their day is checking portal statuses, physically visiting
offices, calling reviewers, and managing comment-response cycles.

The **plan reviewer** works through a queue of submitted drawing sets, checking each
against the building code and local amendments, producing written comments, then
re-reviewing resubmittals. They are typically understaffed with long backlogs.
**The comment-and-response cycle is highly structured, rule-based, document-driven work
that recurs identically thousands of times a year in every city** — one of the clearest
un-served automation targets in this chapter, though the buyer is a municipality with a
procurement process.

## 5. The document & data layer

| Document | Producer | Standardised? | Notes |
|---|---|---|---|
| **Construction drawings** | Architect and engineers | Sheet conventions yes; content no | Hundreds to thousands of sheets, revised repeatedly. **Revision control is a genuine safety issue** |
| **Specifications** | Architect | **Yes — CSI MasterFormat divisions** | Hundreds of pages defining materials and workmanship. Standardised structure makes them tractable |
| **AIA A101 / A201** | Industry | **Yes** | The standard owner-contractor agreement and general conditions |
| Subcontract | GC | Firm-specific | Flows down the prime contract terms |
| **RFI** | Contractor | Semi-standard | Request for Information. Hundreds to thousands per project |
| **Submittal / shop drawing** | Subcontractor | Semi-standard | Product data and fabrication drawings for approval |
| **Change order / change directive** | GC or owner | Semi-standard | Where margin and disputes live |
| **AIA G702 / G703** | Contractor | **Yes** | Application and certificate for payment; the monthly billing form |
| **Lien waiver** | Subs and suppliers | **Statutory in many states** | Conditional/unconditional, progress/final. Statutorily prescribed wording in several states |
| **Preliminary notice** | Subs and suppliers | Statutory | Required in many states within a strict window to preserve lien rights |
| **Certified payroll (WH-347)** | Contractor | **Yes — federal form** | Weekly, per worker, on prevailing-wage projects |
| Daily report | Superintendent | Firm-specific | Manpower, weather, work, delays, photos |
| Schedule (P6 / MS Project) | Scheduler | Software format | Critical path |
| Punch list | Owner's rep / architect | No | Defects to correct before final payment |
| As-builts and O&M manuals | Contractor | No | Handover documentation; notoriously poor |
| Draw request package | GC / developer | Lender-specific | The monthly financing submission |
| Entitlement application | Developer | **Per jurisdiction** | Every city's own forms and exhibits |

**The observation:** construction has *more* real standards than most of real estate —
CSI MasterFormat, AIA contract documents, G702/G703, WH-347 — but the drawings and the
project-specific content around those standards are entirely bespoke. That mix is
important: the **transaction documents are standardised enough to automate; the design
content is not.**

## 6. Systems of record

| System | Category | Position | API reality | Notes |
|---|---|---|---|---|
| **Procore** | Construction management platform | The dominant GC platform | **Genuinely good, well-documented API** — unusual in this guide | Priced on construction volume, which is a notable model. A real integration ecosystem exists |
| Autodesk Construction Cloud / BIM 360 | Construction management + design | Major competitor, strong on design side | Yes | Owns the design tools too |
| **Bluebeam Revu** | PDF markup for drawings | **The universal daily tool.** Nearly every construction professional uses it | Limited | If you build for construction, understand Bluebeam's role |
| Revit, AutoCAD, Navisworks | Design and coordination | Autodesk near-monopoly | Yes | Revit is the BIM standard |
| **Primavera P6** | Critical path scheduling | The institutional standard | Limited | Complex; MS Project is the lighter alternative |
| Sage 300 CRE, Viewpoint Vista, Foundation | Construction accounting | Entrenched | Gated | Job-cost accounting is genuinely specialised |
| **Textura (Oracle), GCPay, Siteline** | Pay application and lien waiver workflow | Established niche | Some | Exists precisely because the monthly waiver cycle is so painful |
| Built Technologies, Rabbet | Construction loan draw management | Growing | Yes | Attacks the lender side of the draw |
| Northspyre, Dealpath | Development cost and pipeline management | Growing | Yes | Owner/developer side |
| Buildertrend, CoConstruct | Residential/small builder management | SMB market | Some | Different buyer entirely |
| HCSS, Trimble | Heavy civil | Specialised | Some | Different world again |
| **Accela, Tyler EnerGov, OpenGov** | Municipal permitting and licensing | Govtech incumbents | Procurement-gated | The systems cities use for permits. Slow, entrenched, widely disliked |
| Togal.AI, Kreo, Beam | AI quantity takeoff | Emerging | Yes | Accuracy on complex scopes is the open question |
| OpenSpace, Buildots | Reality capture and progress tracking | Established | Yes | Walk the site with a 360 camera; compare progress to plan |

## 7. Rules, regulators, and hard constraints

- **Licensed professional seals.** An architect or professional engineer must stamp
  drawings. **This is an absolute limit** — no AI can seal drawings, and the seal carries
  personal legal liability. Design assistance is fine; design authorship without a seal
  is not a deliverable.
- **Building codes.** The International Building Code and International Residential
  Code are widely adopted, **but every jurisdiction amends them.** So a code-checking
  product must handle a base code plus thousands of local amendment sets. This is the
  same fragmentation problem as everywhere else in real estate, in a technically
  tractable but laborious form.
- **Zoning.** Entirely local. Use, density, height, setbacks, parking, design standards.
  No national dataset of zoning rules exists in usable form; several companies have
  tried to build one.
- **Contractor licensing.** Per state, often per trade, with bonding and insurance
  requirements.
- **OSHA.** Safety regulation with recordkeeping obligations, inspections, and
  penalties. Some procedures (lockout/tagout, confined space, fall protection) require
  specific human actions and documentation.
- **Prevailing wage / Davis-Bacon.** On public projects, workers must be paid
  prescribed wage rates by classification, evidenced by **weekly certified payroll**
  submissions. A very large, purely clerical compliance burden, with real penalties and
  debarment risk. Several states have their own equivalents.
- **Mechanics lien statutes.** Contractors and suppliers can place a lien on a property
  for unpaid work — but only if they follow **strict notice and filing deadlines that
  vary by state**. Miss a preliminary notice window by a day and lien rights are
  forfeited entirely. This is a pure deadline-and-document problem with catastrophic
  consequences for error: an excellent automation target, and a category where products
  already exist (Levelset, now part of Procore, being the notable one).
- **Environmental review.** NEPA for federal actions, CEQA in California, plus wetlands,
  endangered species, and historic preservation reviews. CEQA in particular is a
  well-known source of litigation-driven delay.
- **Inspections and certificate of occupancy.** A municipal inspector must physically
  sign off at defined stages. Cannot be automated away; scheduling and documenting it
  can be.
- **Insurance and bonding.** Payment and performance bonds, builder's risk, general
  liability, and the endless COI tracking that goes with them.

## 8. What has already been tried

| Attempt | What it tried | Outcome | The lesson |
|---|---|---|---|
| **Katerra** | Vertically integrate design, manufacture, and construction with technology and roughly $2bn of SoftBank capital | Bankrupt in 2021 | The most expensive lesson in construction tech. Capital and ambition did not overcome the fragmentation, local variation, and thin margins of the industry. **Read this one carefully before proposing to "fix construction"** |
| **Modular and prefab** | Factory-build components to cut on-site time | Persistent niche; repeated high-profile failures | Works for repeatable products in the right market; fails when transport, local code variation, and demand volatility bite |
| **Procore** | Cloud construction management as the system of record | The clear category success; large public company | Winning the workflow of record, then opening an API ecosystem, worked |
| **Levelset** | Automate mechanics lien notices and deadlines | Acquired by Procore | **Deadline-and-document compliance was a real, monetisable business.** Confirms the shape of opportunity, and that this particular one is taken |
| **Built, Rabbet** | Digitise construction loan draws | Operating | The lender side of the draw had a clear buyer with money |
| **Construction robotics (Built Robotics, Dusty, Canvas)** | Automate specific physical trades | Narrow deployments | Single-task robots in structured conditions work; general site robotics does not |
| **AI takeoff (Togal, Kreo)** | Automate quantity takeoff from drawings | Real products; accuracy debated on complex scopes | Estimators will not accept a number they cannot verify — the tool must show its work |
| **OpenSpace, Buildots** | 360-degree capture and automated progress tracking | Real adoption | Passive capture that produces a useful record without changing anyone's behaviour is a good pattern |
| **ICON and 3D-printed housing** | Print structures on site | Demonstrations and small projects | Structure is not the bottleneck; land, entitlement, MEP and finishes are |

**The synthesis, and the most useful framing in this chapter:** construction technology
has repeatedly failed when it tried to change **how buildings are physically made**, and
succeeded when it attacked **the information and money flowing around the work** —
Procore, Levelset, Built, Textura. The industry's fragmentation defeats vertical
integration but leaves the coordination layer wide open. Note also that the successes
cluster around **contractually mandated, deadline-driven paperwork** — pay applications,
lien notices, draws — rather than around design or physical work.

## 9. Where the human genuinely adds value

- **Physical construction.** Obviously. Trades work in unstructured, changing,
  weather-exposed environments with tools and materials. Robotics handles narrow,
  structured tasks; the general case is not close.
- **Real-time site coordination.** A superintendent resolving a conflict between three
  trades who all need the same ceiling space this week is doing spatial, social, and
  scheduling reasoning under time pressure with incomplete information.
- **Design judgment and professional liability.** Someone must stamp the drawings and
  be answerable for whether the building stands up.
- **Political navigation of entitlement.** Persuading a planning commission, negotiating
  with a neighbourhood group, structuring a development agreement.
- **Negotiating claims and changes.** Large sums turn on whether a change was in the
  original scope. This is adversarial commercial negotiation.
- **Judging a subcontractor's real capacity.** Whether a sub who is cheapest can actually
  staff the job is experience, not data.
- **Safety culture.** Getting people to work safely is leadership.

## 10. Glossary

- **As-built** — Drawings updated to show what was actually built.
- **BIM** — Building Information Modelling; a 3D model carrying data about components.
- **Buyout** — Awarding subcontracts after winning a project.
- **CD (Construction Documents)** — The final drawing and specification set used to build.
- **Change order** — A formal contract modification changing scope, price, or time.
- **CO (Certificate of Occupancy)** — Municipal certification that a building may be occupied.
- **CSI MasterFormat** — The standard numbering system organising specifications into divisions.
- **Development spread** — Yield on cost minus market cap rate; the developer's margin.
- **Draw** — A periodic disbursement from a construction loan.
- **Entitlement** — The legal right to develop, obtained through public approvals.
- **FAR / FSI** — Floor Area Ratio; buildable floor area relative to lot area.
- **G702 / G703** — The AIA application for payment and its continuation sheet.
- **GC** — General Contractor.
- **General conditions** — The contract's procedural terms; also the GC's project overhead costs.
- **Hard costs** — Physical construction costs.
- **Lien waiver** — A document releasing lien rights in exchange for payment.
- **MEP** — Mechanical, electrical, plumbing.
- **Mechanics lien** — A statutory claim against property for unpaid construction work.
- **Notice to proceed** — Authorisation to begin work.
- **Owner's rep** — Someone representing the owner's interests against the contractor.
- **Pay application** — The monthly billing for work completed.
- **Preliminary notice** — Early notice preserving future lien rights; deadline-critical.
- **Prevailing wage** — Mandated wage rates on public work; evidenced by certified payroll.
- **Punch list** — Remaining defects to correct before final acceptance.
- **Retainage** — A percentage withheld from each payment until completion.
- **RFI** — Request for Information; a formal question about the design documents.
- **Schedule of values** — The breakdown of a contract sum into billable line items.
- **Soft costs** — Non-construction costs: design, legal, fees, financing, insurance.
- **Submittal** — Product data or shop drawings sent for approval before fabrication.
- **Substantial completion** — The point at which the owner can occupy and use the work.
- **Takeoff** — Measuring quantities from drawings to price the work.
- **TI** — Tenant improvement; fitting out leased space.
- **Value engineering** — Reducing cost by changing scope or materials, usually under duress.
- **Yield on cost** — Stabilised NOI divided by total project cost.

## 11. Verify before you rely on this

| Claim | Why it moves | Check against |
|---|---|---|
| Construction cost figures and the illustrative pro forma | Costs move constantly and vary hugely by market | RSMeans; local GC pricing; Turner and Mortenson cost indices |
| Construction labour productivity being flat for decades | Widely cited, and the measurement is genuinely contested by economists | McKinsey Global Institute construction productivity work; BLS; academic critiques |
| RFI volumes and the share that are avoidable | Frequently cited from a small number of studies | Navigant/other construction industry studies; verify the underlying sample |
| Mechanics lien notice deadlines | **Per state, strict, and consequential** | That state's lien statute; counsel. Never rely on a summary |
| Prevailing wage and certified payroll requirements | Federal plus state variants, updated regularly | US DOL Davis-Bacon; state labour departments |
| Permit review timelines | Vary enormously by city and cycle | The specific municipality |
| Katerra's total capital and failure details | Widely reported, figures vary | Contemporary reporting; bankruptcy filings |
| Vendor market positions and acquisitions | Consolidating (Procore acquired Levelset) | Vendor sites |

**Method note.** This chapter was written from domain knowledge after a rate limit ended
the research fan-out. Structural content — process, roles, documents, contract mechanics
— is stable. Cost figures, comp bands, and volume statistics are indicative ranges and
should be treated as orientation rather than data. Nothing here is legal advice;
mechanics lien and prevailing wage rules in particular are unforgiving and
jurisdiction-specific.
