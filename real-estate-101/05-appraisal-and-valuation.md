# 05 · Appraisal, Valuation, and Property Assessment

> Somebody has to put a number on a property, and different people need that number for
> different reasons. A lender needs to know the collateral is worth the loan. A tax
> authority needs a value to tax. An investor needs a value to buy or sell. A court needs
> one to divide an estate. Each of those needs produces a different product, a different
> profession, and a different regulatory regime. This chapter covers all of them —
> and it is the one vertical in this guide where **the automation has already largely
> happened**, driven not by a startup but by the two government-sponsored enterprises
> that buy most US mortgages. That makes it the most instructive chapter in the guide
> about how automation actually arrives in real estate.

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

### The valuation products, by price

The critical thing to understand is that "what is this property worth" is not one
question with one answer. It is a **ladder of products at wildly different price
points**, and the industry's whole recent history is customers walking down that ladder.

| Product | What it is | Who performs it | Typical US cost | Turn time |
|---|---|---|---|---|
| **AVM** | Automated Valuation Model — a statistical estimate from public and MLS data | Software | Cents to a few dollars per query | Instant |
| **Appraisal waiver / value acceptance** | The GSE accepts the contract price without any appraisal, based on its own data | Nobody — it is a decision | Free | Instant |
| **BPO** | Broker Price Opinion — a licensed agent's opinion, with photos | Real estate agent | $50-150 | 2-5 days |
| **Desktop appraisal** | Licensed appraiser, no site visit, using data supplied to them | Appraiser | $250-400 | 2-5 days |
| **Hybrid / bifurcated appraisal** | A non-appraiser collects the property data on site; the appraiser values it remotely | Data collector + appraiser | $300-450 | 3-7 days |
| **Drive-by / exterior-only (Form 2055)** | Appraiser views the exterior only | Appraiser | $300-450 | 3-7 days |
| **Full interior appraisal (Form 1004)** | The traditional product: interior and exterior inspection, full report | Appraiser | $500-800, more in rural/complex markets | 5-15 days |
| **Commercial narrative appraisal** | Full written analysis of an income property | Certified general appraiser | $3,000-25,000+ | 3-8 weeks |
| **Mass appraisal** | Valuing every parcel in a jurisdiction for tax | County assessor's office | Funded by the tax base | Annual or multi-year cycle |

**Read that ladder as the story of the industry.** Every product below "full interior
appraisal" exists to avoid paying for a full interior appraisal. The direction of travel
has been steadily downward, and the single biggest step was not a startup product at all
— it was Fannie Mae and Freddie Mac simply deciding that for a large share of loans,
**no appraisal is required.**

### Who pays whom

```
Borrower pays the appraisal fee (disclosed on the Loan Estimate)
        |
        v
   Lender collects it
        |
        v
   AMC (Appraisal Management Company) takes a cut for managing the order
        |          typically 25-40% of what the borrower paid
        v
   Appraiser receives the remainder
```

The AMC layer exists because of appraiser independence rules (section 7): the lender's
sales staff may not select or pressure the appraiser, so an intermediary assigns the
work. The consequence is that **the borrower pays $650 and the appraiser may receive
$400.** This split is the source of a long-running industry fight over whether AMC-set
fees satisfy the legal requirement to pay "customary and reasonable" fees. It is also
why appraiser supply contracts when volumes fall — the economics at the bottom of the
ladder do not support a career.

**Commercial** is different: no AMC layer, fees negotiated directly, engagement letters
per assignment, and the appraiser is usually a firm rather than an individual.

**Assessment** is different again: county assessors are government employees funded by
the jurisdiction, valuing every parcel whether anyone asks or not.

## 2. The lifecycle / process spine

### Residential mortgage appraisal

| # | Stage | Trigger | Owner | Duration | Artifact | What stalls it |
|---|---|---|---|---|---|---|
| 1 | Order placed | Loan application progresses | Lender's appraisal desk | Minutes | Order in ordering platform | — |
| 2 | Waiver check | Order submitted to GSE | DU / LPA | Instant | Waiver offered or not | If a waiver is offered, everything below is skipped |
| 3 | Assignment | Order routed to AMC panel | AMC coordinator | Hours-days | Accepted assignment | No appraiser will take it at the fee offered — very common in rural areas |
| 4 | Scheduling | Appraiser contacts occupant | Appraiser | 1-5 days | Appointment | **Occupant does not answer the phone.** The single most common delay |
| 5 | Inspection | Appointment | Appraiser or data collector | 20-60 min on site | Photos, sketch, measurements, notes | Access denied; property not ready; dog |
| 6 | Comp selection | Post-inspection | Appraiser | 1-3 hours | Selected comparables | Thin market with no good comps |
| 7 | Adjustment and analysis | — | Appraiser | 1-3 hours | Adjustment grid | Judgment-heavy |
| 8 | Report writing | — | Appraiser | 1-3 hours | 1004 form + addenda | Largely boilerplate assembly |
| 9 | Internal QC | Report complete | AMC reviewer | Hours-days | Revision requests | Nitpicks and formatting |
| 10 | UCDP submission | Delivery to lender | Lender | Instant | Collateral Underwriter / Loan Collateral Advisor messages | Automated risk flags trigger more revisions |
| 11 | Revision cycle | Flags or underwriter conditions | Appraiser | 1-5 days | Revised report | **Unpaid rework — a major appraiser grievance** |
| 12 | Reconsideration of value (ROV) | Borrower or agent disputes the value | Lender → appraiser | Days | Response with analysis | Now a formally required process |

Note stages 9-11. **An appraiser is typically paid once and revises repeatedly.** That
asymmetry shapes the profession's attitude to the entire lending industry.

### Commercial appraisal

Engagement letter → scope agreement → data collection (rent roll, operating statements,
leases, market research, site visit) → three approaches to value → reconciliation →
narrative report (often 80-200 pages) → internal review → client delivery → revisions.
Weeks, not days. Much of the report is templated firm language reused across assignments.

### Mass appraisal (property tax)

Discovery of new construction and changes → data collection and field listing →
model calibration (usually a regression or cost-based model) → value generation for
every parcel → notices mailed → **appeal season** → informal review → formal board
hearing → certified roll → tax bills. Annual or on a multi-year revaluation cycle.

## 3. Role inventory

| Role | Also called | Seniority | Licence required | Typical comp (US) | What they own |
|---|---|---|---|---|---|
| Trainee appraiser | Apprentice, registered appraiser | Entry | Trainee credential + supervisor | $30-45k | Assists; cannot sign independently |
| Licensed residential appraiser | — | Junior | State licence | $50-70k | Simpler residential assignments |
| **Certified residential appraiser** | Fee appraiser | Core | State certification | $60-110k (fee-based, volatile) | The bulk of residential mortgage appraisals |
| **Certified general appraiser** | Commercial appraiser | Senior | State certification (highest tier) | $90-180k+ | All property types including commercial |
| Review appraiser | Desk/field reviewer | Mid-senior | Certified | $70-110k | Reviews others' reports for quality and compliance |
| Chief appraiser | — | Senior | Certified | $120-200k | Sets a lender's or firm's valuation policy |
| Staff appraiser | In-house appraiser | Mid | Certified | $70-110k | Employed by a lender or institution |
| **Property data collector** | Inspector, data gatherer | Entry | **Usually none** | $25-60 per inspection | Photographs and measures the property for a hybrid appraisal. **A deliberate deskilling of the site-visit step** |
| **AMC order coordinator** | Vendor manager, order manager | Entry-mid | None | $38-55k | Assigns orders, chases appraisers, manages turn times |
| AMC QC reviewer | — | Mid | Often certified | $55-80k | Checks reports before delivery |
| Commercial appraisal analyst | Research analyst | Entry-mid | Trainee or none | $55-80k | Builds the models and gathers comps for a certified general appraiser |
| **BPO agent** | — | Varies | Real estate licence | $50-150 per BPO | Cheap valuations for servicers and REO |
| AVM data scientist | — | Mid-senior | None | $130-220k | Builds automated valuation models |
| **County assessor** | — | Elected or appointed | Varies by state | $70-150k | Statutorily responsible for the assessment roll |
| Deputy assessor / appraiser | — | Mid | Often state certification | $50-85k | Values assigned property classes |
| **Mass appraisal analyst** | CAMA analyst, modeller | Mid | Sometimes | $60-95k | Calibrates the valuation models across the jurisdiction |
| **Field lister / data collector** | — | Entry | None | $38-52k | Visits properties to verify characteristics for the assessment roll |
| **Property tax consultant** | Tax agent, appeal representative | Varies | Registration in some states | Often contingency: 25-50% of first-year tax savings | Files and argues assessment appeals for owners |
| Board of equalization staff | Appeals clerk | Entry-mid | None | $40-60k | Administers the appeal process |
| Litigation / expert witness appraiser | — | Senior | Certified | $250-600/hour | Eminent domain, divorce, estate, tax court |

**Note the shape of this table.** There is a shrinking, ageing, credentialed core
(certified appraisers), a growing uncredentialed periphery (data collectors, BPO agents),
and a large government workforce (assessors) that most private-sector people forget
exists. The appraiser pipeline is a genuine structural problem: the trainee-supervisor
requirement means a new appraiser must find an established one willing to train a
future competitor, which throttles entry.

## 4. Day in the life

### Residential fee appraiser — day in the life

- **Who they are:** self-employed, often 10-25 years in the business, working a
  geographic patch they know intimately. Paid per report. Measured on turn time and on
  revision rate.
- **Their stack:** an ordering platform (Mercury Network, ValueLink, Reggora) for
  incoming work; **ACI or Alamode TOTAL** for report forms; a laser measure and a
  sketching app (Apex, RapidSketch) on a tablet; the local MLS for comps; the county
  assessor's site for public records; Google Earth for aerials; a phone that rings
  constantly.

**A typical Tuesday**

| Time | What happens |
|---|---|
| 6:45 | Check overnight orders across three ordering platforms. Two new assignments; one at a fee low enough to decline. Accept one, counter-bid the other |
| 7:10 | Call three occupants to schedule inspections. Two voicemails, one answer. **This is the day's most frustrating half hour** and it repeats every day |
| 7:45 | Drive 40 minutes to the first inspection |
| 8:30 | Inspection one. Photograph every room, exterior elevations, street scene, mechanicals, address verification. Measure the exterior footprint. Sketch. Note condition, updates, quality of construction. 45 minutes |
| 9:30 | Drive to inspection two. Occupant not home despite confirming. Wasted trip. Reschedule |
| 11:00 | Inspection three. Owner follows them room to room explaining why the house is worth more than the neighbours' |
| 12:30 | Lunch in the car; return calls |
| 13:30 | Back at desk. Pull comps in the MLS for this morning's property: filter by distance, date, size, style. Review 30 candidates, inspect photos on each, choose 3-6 |
| 14:30 | Build the adjustment grid: adjust each comp for GLA, bath count, garage, condition, view, date of sale. Every adjustment must be supportable |
| 15:30 | Write the report. Much of the narrative is boilerplate from a library of stock language, edited for this property. Neighbourhood description, market conditions commentary (form 1004MC), reconciliation |
| 16:45 | Two revision requests arrive on last week's reports. One asks for an additional comp; one queries an adjustment. **Unpaid.** Handle both |
| 17:30 | A reconsideration of value on a file from ten days ago — the buyer's agent has submitted three comps arguing the value is too low. Must formally analyse and respond to each |
| 18:30 | Submit two completed reports. Check tomorrow's orders |

- **Their week:** 8-15 reports in a normal week; more when rates are low and volume is
  high, far fewer when rates rise. Income is directly proportional to volume, which is
  set by mortgage rates they cannot influence.
- **What they complain about:** AMC fee splits and "customary and reasonable" fees;
  unpaid revision requests; automated Collateral Underwriter flags that demand
  justification for defensible judgments; pressure from agents and borrowers to "hit
  the number"; appraisal waivers removing the work entirely; the trainee bottleneck.

**Repetitive-work inventory — residential fee appraiser**

| Task | Frequency | Minutes each | Why it's still manual | Data in → data out |
|---|---|---|---|---|
| Calling occupants to schedule | 3-6/day | 5-15 (plus callbacks) | Requires reaching a human who does not want to be reached | Order details → confirmed appointment |
| Re-keying property data from public records into the form | Every report | 15-25 | Assessor sites are unstructured and per-county | County record → form fields |
| Comp search and filtering | Every report | 30-60 | Judgment about which comps are truly comparable | MLS query → 3-6 selected comps |
| Building the adjustment grid | Every report | 30-60 | Adjustments must be market-supported and defensible | Comp data → adjusted values |
| Writing boilerplate narrative sections | Every report | 30-45 | Stock language edited per property; already partly templated | Property facts → prose |
| Photo labelling and organising | Every report | 10-20 | Manual sorting and captioning | Photos → labelled exhibits |
| Responding to revision requests | 3-8/week | 15-60 | Each is a bespoke justification | Reviewer comment → written response |
| Responding to reconsiderations of value | 1-3/week | 45-120 | Must analyse each submitted comp and respond formally | Agent's comps → written analysis |
| Invoicing and chasing payment from AMCs | Weekly | 30-60 | Many AMCs, many portals, slow payment | Completed orders → payment |

### AMC order coordinator — day in the life

- **Who they are:** typically early-career, in a call-centre-like environment, managing
  100-300 open orders. Measured on turn time, fee cost, and the number of orders that
  go past due.
- **Their stack:** the AMC's order platform, email, phone, spreadsheets tracking panel
  appraisers by coverage area and fee.

**A typical day:** work the past-due queue from oldest to newest; for each, call or
email the assigned appraiser for a status; escalate fees on orders nobody has accepted
(a rural order may go out at $500, then $650, then $800 before someone takes it); field
lender calls asking where reports are; reassign orders where the appraiser has gone
silent; chase borrowers whose properties the appraiser cannot get into; run the daily
turn-time report. **The great majority of the day is chasing two groups of people — one
of whom is self-employed and busy, the other of whom does not want to be contacted.**

**Repetitive-work inventory — AMC order coordinator**

| Task | Frequency | Minutes each | Why it's still manual | Data in → data out |
|---|---|---|---|---|
| Status-chasing appraisers | 40-80/day | 2-5 | Requires a response from an independent contractor | Order age → status update |
| Fee escalation on unaccepted orders | 10-30/day | 3-8 | Judgment about the market rate for a given area | Coverage gap → higher offer |
| Reassigning stalled orders | 5-15/day | 5-10 | Requires finding an available panel appraiser | Stalled order → new assignee |
| Answering lender status queries | 20-50/day | 2-5 | The lender's system does not show live appraiser status | Question → status |
| Scheduling assistance / occupant chasing | 10-25/day | 5-10 | Same phone-tag problem the appraiser has | Contact info → appointment |
| Turn-time and past-due reporting | Daily | 20-40 | Assembled by hand from platform exports | Order data → report |

### Commercial appraiser and analyst — day in the life

- **Who they are:** a certified general appraiser leading assignments, usually with one
  or two analysts. Paid per assignment, $3,000-25,000+ each.
- **Their stack:** **Argus Enterprise** for cash flow modelling, Excel for everything
  Argus does not do, CoStar for market data, Word for the narrative report, the county
  for public records, phone calls to brokers to verify comps.

**A typical day:** the analyst spends the morning abstracting leases from a rent roll
and lease PDFs into an Argus model — suite by suite, entering commencement, expiry,
base rent, escalations, recovery structure, and options. Afternoon on market research:
finding comparable sales and leases, then **calling brokers to verify the details**
because published comps are often incomplete or wrong. The appraiser reviews the model,
sets assumptions (market rent, vacancy, growth, discount rate, exit cap), and writes
the analysis. Roughly **60-70% of a commercial narrative report is templated firm
language** — regional and market description, methodology, assumptions, limiting
conditions — reused across assignments and updated for the current market.

**Repetitive-work inventory — commercial appraisal**

| Task | Frequency | Hours each | Why it's still manual | Data in → data out |
|---|---|---|---|---|
| Lease abstraction into Argus | Every income-property assignment | 2-20 depending on tenant count | Leases are non-standard PDFs | Lease PDFs → structured model inputs |
| Rent roll normalisation | Every assignment | 1-3 | Every owner's rent roll format differs | Excel → model schedule |
| Operating statement normalisation | Every assignment | 1-3 | Chart of accounts differs per owner | T-12 → standardised expense categories |
| Comp research and verification | Every assignment | 4-12 | Requires phone calls to brokers | Databases + calls → verified comps |
| Templated narrative assembly | Every assignment | 3-8 | Firm boilerplate updated per market | Library + market data → report sections |
| Report formatting and exhibits | Every assignment | 2-5 | Word and PDF wrangling | Content → deliverable |

### County mass appraisal analyst — day in the life

- **Who they are:** a government employee in an assessor's office, valuing every parcel
  in a class across the county. Measured on statistical performance standards (assessment
  ratio, coefficient of dispersion) and on surviving appeals.
- **Their stack:** a CAMA (Computer Assisted Mass Appraisal) system — commonly Tyler
  Technologies iasWorld, Patriot Properties, or Vision — plus GIS, sales files, and Excel.

**A typical day in a revaluation year:** review sales that occurred since the last cycle
and decide which are "arm's length" and usable (a sale between family members, a
foreclosure, or a distressed sale must be excluded — **this sales validation work is
enormous and largely manual**, often involving mailing questionnaires to buyers and
sellers). Re-run the valuation model for a neighbourhood, inspect the outliers, adjust
neighbourhood factors, check statistical performance against IAAO standards. Review
field-listing data from new construction and permits. Answer taxpayer phone calls.

**Repetitive-work inventory — assessment office**

| Task | Frequency | Effort | Why it's still manual | Data in → data out |
|---|---|---|---|---|
| Sales validation / qualification | Every recorded sale | 5-20 min each | Requires judgment about whether a sale is market-rate; often a mailed questionnaire | Deed record → qualified or disqualified sale |
| Permit and new-construction discovery | Continuous | Varies | Permit data arrives from a separate municipal system, often as PDFs | Permit → parcel characteristic update |
| Field listing / data verification | Cyclical | 15-30 min per parcel | Physical visit to confirm characteristics | Site visit → CAMA record |
| Model recalibration and outlier review | Annual/cyclical | Weeks | Statistical judgment | Sales + characteristics → values |
| Appeal response preparation | Appeal season, hundreds-thousands | 30-120 min each | Each requires assembling evidence for that parcel | Parcel + comps → defence packet |
| Taxpayer enquiry handling | Daily | 5-15 min | High volume of repetitive questions | Question → explanation |

### Property tax appeal consultant — day in the life

- **Who they are:** works on contingency, typically 25-50% of the first year's tax
  saving. Volume business: file many appeals, win some.
- **Their stack:** county assessment data (scraped or purchased), comps, a case
  management spreadsheet or a niche platform, and the county's own appeal portal.

**A typical day in appeal season:** bulk-review assessed values against their own
estimates to find over-assessed parcels; generate and file appeal petitions before the
**hard statutory deadline** — a missed deadline means waiting a year; assemble evidence
packets (comparable assessments, comparable sales, condition photographs, income data
for commercial); attend informal hearings, often several in a day, each lasting 10-20
minutes; negotiate settlements with assessment staff.

**Repetitive-work inventory — tax appeal consultant**

| Task | Frequency | Minutes each | Why it's still manual | Data in → data out |
|---|---|---|---|---|
| Screening assessment rolls for over-assessment | Annual, thousands of parcels | Bulk | Data acquisition differs per county | Assessment roll → candidate list |
| Filing appeal petitions | Hundreds per season | 10-25 | Every county has its own form and portal | Parcel data → filed petition |
| Deadline tracking across jurisdictions | Continuous | — | Each county has its own statutory date | Calendar → filings |
| Evidence packet assembly | Per appeal | 30-90 | Bespoke per parcel | Comps + photos → packet |
| Client reporting and billing | Per outcome | 15-30 | Contingency fee calculation per parcel | Outcome → invoice |

## 5. The document & data layer

| Document | Producer | Standardised? | Notes |
|---|---|---|---|
| **Form 1004 / URAR** | Appraiser | **Yes — Fannie Mae form** | The core residential appraisal report |
| **UAD** | Appraiser via software | **Yes** | Uniform Appraisal Dataset: standardised codes and formats for appraisal data. A genuine, adopted data standard |
| UAD 3.6 / Uniform Property Dataset | GSEs | In rollout | A major redesign moving from fixed forms to a dynamic, data-first model. Check current status |
| Form 1073 / 1025 / 2055 / 1004D | Appraiser | Yes | Condo / 2-4 unit / exterior-only / update-completion |
| Form 1007, Form 216 | Appraiser | Yes | Single-family rent schedule; operating income statement |
| Engagement letter and scope of work | Client / appraiser | No | Commercial |
| **Commercial narrative report** | Appraiser | No | 80-200 pages, heavily templated |
| **Property record card** | Assessor | Per jurisdiction | The county's record of a parcel's characteristics |
| Sales verification questionnaire | Assessor | Per jurisdiction | Mailed to parties to confirm sale terms |
| Appeal petition | Owner/agent | Per jurisdiction | Hard statutory deadlines |
| **UCDP submission** | Lender | Yes | Uniform Collateral Data Portal — where appraisals are submitted to the GSEs |
| Collateral Underwriter / Loan Collateral Advisor messages | Fannie / Freddie | Yes | **Automated risk scoring and flags on every submitted appraisal.** Worth studying: this is a live example of large-scale automated review of professional judgment |

**The important observation:** appraisal is, along with mortgage, one of the few real
estate verticals with a **real, adopted data standard** (UAD). That is precisely why the
GSEs were able to build Collateral Underwriter — they had a decade of structured
appraisal data to model against. Standardisation enabled automation. Nowhere else in
real estate has that ingredient in the same measure.

## 6. Systems of record

| System | Category | Who uses it | Position | API reality |
|---|---|---|---|---|
| ACI, Alamode TOTAL (CoreLogic), Bradford ClickFORMS, SFREP | Residential form-filling software | Appraisers | The desktop standard | Limited |
| Anow, Spark | Appraisal practice management | Appraisal firms | Niche | Some |
| Mercury Network, ValueLink, Reggora, Clear Capital | Appraisal ordering platforms | Lenders, AMCs | Fragmented | Partner-gated |
| **UCDP / EAD** | GSE and FHA submission portals | Lenders | Mandatory | Institutional |
| **Collateral Underwriter (Fannie), Loan Collateral Advisor (Freddie)** | Automated appraisal risk review | GSEs | Mandatory in practice | Institutional |
| **Argus Enterprise (Altus)** | Commercial cash-flow valuation | Commercial appraisers | Near-monopoly | Proprietary format |
| Excel | Everything else | Everyone | Universal | N/A |
| HouseCanary, Clear Capital ClearAVM, CoreLogic, Quantarium, Zillow Zestimate, Redfin Estimate | AVMs | Lenders, portals, investors | Competitive | Yes |
| Tyler Technologies iasWorld, Patriot Properties, Vision, Harris Govern | CAMA — mass appraisal systems | County assessors | Concentrated; Tyler is dominant in govtech | Gated; procurement-driven |
| Cape Analytics, Zesty.ai, Restb.ai, EagleView, Nearmap | Aerial imagery and computer vision on property condition | Insurers, lenders, AVM builders | Established | Yes |

**The govtech note.** County assessment systems are a distinct market: sold through
public procurement, dominated by a small number of vendors, with long cycles and
budget-constrained buyers. It is a genuinely under-served market, but selling to 3,000
counties one procurement at a time is a specific and difficult go-to-market. Weigh that
honestly before treating "assessors have bad software" as an opportunity.

## 7. Rules, regulators, and hard constraints

### 7.1 USPAP and the signature

**USPAP** (Uniform Standards of Professional Appraisal Practice) governs appraisal
practice in the US. It requires, among much else, that the appraiser be independent and
impartial, that they have or acquire competency for the assignment, that the scope of
work be adequate, and that a signed certification accompany the report. Critically:
**an appraisal is the signed opinion of a credentialed human who takes personal
responsibility for it.** Software may assist; it cannot sign.

An appraiser may use an AVM or automated tools as an input, but remains responsible for
the value conclusion. That is the boundary: **tools that help an appraiser are
unambiguously fine; systems that replace the appraiser's signed opinion are not an
appraisal at all** — they are a different product (an AVM or a waiver), sold under a
different regime.

### 7.2 The GSEs, not startups, did the automation

The most consequential fact in this chapter. Fannie Mae and Freddie Mac accumulated a
large structured dataset of appraisals (via UAD and UCDP) and property data, and then:

- built **automated review** (Collateral Underwriter, Loan Collateral Advisor) that
  scores every submitted appraisal for risk and flags outliers;
- began offering **appraisal waivers**, now branded **value acceptance**, where the
  GSE simply accepts the contract price for qualifying loans without any appraisal;
- introduced **value acceptance + property data**, where a non-appraiser data collector
  gathers standardised property information and no appraisal is performed;
- introduced **hybrid appraisals**, splitting inspection from valuation.

**This is the single clearest case study in the whole guide of how automation actually
arrives in real estate.** It did not come from a startup selling a better tool to
appraisers. It came from the party that (a) bore the risk, (b) owned the standardised
data, and (c) had the market power to change the requirement. Whenever you evaluate an
automation opportunity in this industry, ask: **who has the data, who bears the risk,
and who can change the rule?** If the answer is not you, your product is a tool, not a
disruption — which is fine, but price and position it accordingly.

### 7.3 Appraiser independence

Appraiser Independence Requirements prohibit anyone with an interest in the transaction
from influencing an appraiser's value, selecting the appraiser in certain configurations,
or providing certain information. This is why AMCs exist. **Design consequence:** any
product connecting loan production staff to appraisers must be built with this
separation in mind, and "help the LO get the value they need" is not a legal product.

### 7.4 Licensing and thresholds

Appraisers are licensed and certified per state, in tiers (trainee, licensed, certified
residential, certified general), with education, examination, and supervised experience
requirements. Federal financial institution rules set a **de minimis threshold** below
which no appraisal is required for a federally related transaction — the level has been
raised over time, which mechanically shrinks the appraisal market. Check the current
figure before relying on it.

### 7.5 Bias, and the constraint on anyone building valuation models

Appraisal bias has been a major policy focus: an interagency task force, HUD and DOJ
enforcement actions over discriminatory appraisals, and mandated reconsideration-of-value
processes so borrowers can formally challenge a value.

The parallel constraint for technologists: **the interagency AVM quality control rule**
requires institutions using AVMs in credit decisions to maintain quality control
standards — including a nondiscrimination factor. If you build a valuation model used in
lending, **fair-lending compliance is a design requirement, not an afterthought.** The
same disparate-impact logic from chapter 01 applies: proxies for protected
characteristics (neighbourhood, school data, historical prices that encode past
discrimination) can produce liability without intent.

This is a real and specific trap in valuation modelling: historical sale prices in the
US **encode the effects of past discrimination**. A model trained naively to predict
historical prices will reproduce them and call it accuracy.

## 8. What has already been tried

| Attempt | What it tried | Outcome | The lesson |
|---|---|---|---|
| **GSE appraisal waivers / value acceptance** | Skip the appraisal entirely for qualifying loans | **The most successful automation in real estate.** A large share of eligible refinances and purchases now proceed without an appraisal | The party with the data and the risk automated the step out of existence. No vendor could have done this |
| **Collateral Underwriter** | Automated risk review of every submitted appraisal | Deployed at scale; changed appraiser behaviour industry-wide | Automated review of professional judgment is feasible where the data is standardised |
| **Zillow Zestimate + Zillow Offers** | AVM accurate enough to trade against | The AVM is fine as a website feature; iBuying lost large sums | **The definitive real-money test of AVM accuracy.** An error band acceptable for a consumer estimate is not acceptable for a balance sheet |
| **HouseCanary v. Amrock/Quicken** | Litigation over alleged misappropriation of valuation technology and data | Large jury verdict, then reversal and retrial | Instructive about how much parties believe valuation data is worth |
| **Hybrid / bifurcated appraisal** | Split the inspection from the valuation, using cheap data collectors | Adopted by the GSEs; resisted by many appraisers | Unbundling a professional role into a credentialed part and an uncredentialed part is a repeatable pattern. **Look for it elsewhere** |
| **Cape Analytics, Zesty.ai, Restb.ai** | Computer vision on aerial and listing imagery for condition and risk | Real adoption, especially in insurance | Selling a *component* into an existing workflow worked where replacing the workflow did not |
| **Reggora, Clear Capital** | Modernise appraisal ordering and workflow | Established vendors | Workflow modernisation sells; it does not remove the appraiser |

**The synthesis:** valuation is the vertical where automation has advanced furthest, and
it advanced from the top down. What remains for a builder is the **workflow around**
the surviving human appraisal — scheduling, comp research support, report assembly,
revision handling, and the entirely separate and under-served world of **property tax
assessment and appeals**, where the software is old, the buyers are governments and
contingency-fee consultants, and almost nobody is paying attention.

## 9. Where the human genuinely adds value

- **Non-conforming property.** A 90-year-old house with three additions, a converted barn,
  a property with an unusual easement, a mixed-use building. Models fail exactly where
  the property is unusual — and unusual properties are precisely when someone needs an
  appraisal.
- **Thin markets.** Rural areas and unique properties where there are no true comps. The
  appraiser's local knowledge substitutes for data that does not exist.
- **Condition and quality judgment.** Distinguishing a cosmetic renovation from a
  structural one; recognising deferred maintenance behind fresh paint. Photographs
  systematically flatter.
- **Defensibility.** An appraisal must withstand challenge by a lender, a borrower's
  agent, an opposing party in litigation, or a court. The reasoning must be articulated
  by someone who can be cross-examined.
- **Complex commercial analysis.** Setting the exit cap rate and market rent
  assumptions on a value-add office building is a professional opinion about the future.
- **Independence as a service.** The appraiser's value is partly that they are
  structurally uninterested in the outcome. That independence is a legal construct that
  needs an accountable person.

## 10. Glossary

- **1004 / URAR** — Uniform Residential Appraisal Report; the standard single-family form.
- **AIR** — Appraiser Independence Requirements.
- **AMC** — Appraisal Management Company; intermediary between lender and appraiser.
- **Adjustment grid** — The table adjusting comparable sales for differences from the subject property.
- **Arm's length sale** — A sale between unrelated parties at market terms; the only kind usable as a comp.
- **AVM** — Automated Valuation Model.
- **BPO** — Broker Price Opinion; an agent's valuation, cheaper and less rigorous than an appraisal.
- **CAMA** — Computer Assisted Mass Appraisal; the software assessors use.
- **Certified general / certified residential** — The two top appraiser credential tiers; general covers commercial.
- **Coefficient of dispersion (COD)** — A statistical measure of assessment uniformity.
- **Collateral Underwriter (CU)** — Fannie Mae's automated appraisal risk review.
- **Comparable (comp)** — A similar property used to estimate value.
- **Cost approach** — Value = land value + replacement cost of improvements − depreciation.
- **De minimis threshold** — The transaction value below which no appraisal is federally required.
- **Direct capitalisation** — Value = NOI ÷ cap rate.
- **DCF** — Discounted Cash Flow; projecting and discounting future cash flows.
- **Drive-by / 2055** — Exterior-only appraisal.
- **GLA** — Gross Living Area; the standard measure of house size.
- **Highest and best use** — The legally permissible, physically possible, financially feasible use producing the highest value. A required analysis.
- **Hybrid / bifurcated appraisal** — Inspection by a data collector, valuation by a remote appraiser.
- **Income approach** — Valuing from the income the property produces.
- **Mass appraisal** — Valuing many properties at once using models, for taxation.
- **Property data collector** — A non-appraiser who gathers on-site property data.
- **Reconciliation** — Weighing the three approaches to reach a final value opinion.
- **ROV** — Reconsideration of Value; a formal request to reconsider an appraised value.
- **Sales comparison approach** — Valuing by comparison to similar sold properties.
- **UAD** — Uniform Appraisal Dataset; the standardised data format for appraisal reports.
- **UCDP** — Uniform Collateral Data Portal; where appraisals are delivered to the GSEs.
- **USPAP** — Uniform Standards of Professional Appraisal Practice.
- **Value acceptance** — The GSEs' current term for an appraisal waiver.

## 11. Verify before you rely on this

| Claim | Why it moves | Check against |
|---|---|---|
| Appraisal waiver / value acceptance eligibility and share of loans | GSE policy changes regularly | Fannie Mae and Freddie Mac selling guides and announcements |
| UAD 3.6 / Uniform Property Dataset rollout timing | Phased, with revised dates | GSE UAD pages |
| Appraisal fees and AMC splits | Market-driven, vary regionally; splits are not usually disclosed | Practitioner surveys; appraiser forums |
| De minimis appraisal threshold | Raised by rulemaking over time | Interagency appraisal regulations |
| Interagency AVM quality control rule — effective date and scope | Recently finalised | Federal Register; the agencies' guidance |
| Appraiser population and pipeline figures | Declining; figures are estimates | Appraisal Institute; state boards |
| Assessment cycles, appeal deadlines, and procedures | Per jurisdiction, statutory | Each county assessor and board of equalization |
| HouseCanary litigation final outcome | Long procedural history | Court records |

**Method note.** This chapter was written from domain knowledge after a rate limit ended
the research fan-out; its structural content is stable but it carries fewer freshly
fetched citations than chapters 01-04 and 06. Figures marked as ranges are indicative.
Anything above that would change a build decision should be verified against the primary
source named in this table.
