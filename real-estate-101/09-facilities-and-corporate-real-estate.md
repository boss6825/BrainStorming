# 09 · Facilities Management, Building Operations, and Corporate Real Estate

> Once a building exists and is occupied, somebody has to run it: keep the air moving,
> the lifts working, the lights on, the fire systems certified, the cleaners scheduled,
> and the tickets closed. And on the other side of the lease, a company occupying
> hundreds of buildings has to decide where to sit, negotiate the leases, plan the
> space, and account for it all. This is the largest continuously-employed workforce in
> real estate, and it is the most under-covered vertical in most primers. It is also
> where the work is highest-frequency — daily and monthly rather than per-transaction —
> which is exactly the profile that makes automation compound.

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

### Two distinct customers

| Lens | Who pays | What they want | Their pain |
|---|---|---|---|
| **Owner / landlord side** | Building owner, recovered from tenants via CAM | Keep the asset performing and compliant at least cost | Every dollar of opex is ~15-20x that in lost asset value at a 5-7% cap rate |
| **Occupier / corporate side** | The company occupying space | Support the workforce, minimise portfolio cost and risk | Real estate is typically a company's second-largest cost after payroll |

Those two lenses are in tension across the same building: the landlord wants to recover
costs, the tenant wants to audit and reduce them. That tension is what produces CAM
reconciliations and CAM audits (chapter 06).

### How FM providers are paid

Most large organisations outsource facilities to a provider — JLL, CBRE Global Workplace
Solutions, Cushman & Wakefield, Sodexo, ISS, Aramark, ABM, EMCOR. Contract structures:

| Model | How it works | Behaviour it produces |
|---|---|---|
| **Fixed fee / fixed price** | A set annual fee for a defined scope | Provider bears cost risk; strong incentive to control labour and defer discretionary work |
| **Cost-plus management fee** | Client pays actual costs plus a fee | Transparent; weak cost-control incentive unless paired with targets |
| **Gain-share** | Savings split between client and provider | Encourages genuine efficiency projects |
| **KPI / SLA regime** | Payment adjusted by measured performance against service levels | **Produces enormous documentation demand** — the provider must evidence performance monthly |

That last row matters more than it looks. **A large FM contract is a measurement regime**,
and much of the account team's work is assembling evidence that service levels were met.
Response times, completion times, PM compliance percentages, first-time-fix rates — all
reported monthly, all assembled from ticket data by hand.

### Rough cost shape

Operating a commercial office building typically runs a few dollars per square foot per
year in the US, split roughly across utilities, cleaning, repairs and maintenance,
security, management, insurance and taxes — with taxes and utilities usually the two
largest lines. Proportions vary enormously by market and asset type; treat any single
figure with suspicion and use the building's own budget.

## 2. The lifecycle / process spine

Facilities has no single lifecycle. It has **six concurrent operational loops**, each
with its own rhythm. This structure is the useful mental model.

### Loop A — Reactive work orders (continuous)

Request (phone, email, portal, app, QR code) → triage and priority → assign or dispatch
→ parts and access → execute → close with notes and photos → invoice → SLA measurement.

The intake step is messier than it sounds: a large share of requests arrive as
free-text email or a phone call describing a symptom ("it's cold in 4West"), not a
categorised ticket. **Someone reads it, classifies it, prioritises it, and routes it.**

### Loop B — Preventive maintenance (scheduled)

Asset register → PM schedule per asset → auto-generated work orders → completion →
compliance evidence. The measure that matters is **PM compliance percentage** — what
share of scheduled maintenance was actually completed on time. It is reported to clients
and auditors constantly.

### Loop C — Vendor management (continuous)

Source → RFP → contract → **COI (certificate of insurance) collection and tracking** →
onboarding → work → invoice approval → performance review → renewal.

COI tracking deserves emphasis: every vendor must carry insurance meeting contract
requirements, certificates expire annually, and letting a vendor work uninsured is a
genuine liability event. Tracking hundreds of vendors' expiring certificates across
multiple coverage types is pure calendar-and-document work, and it is done badly almost
everywhere.

### Loop D — Space and occupancy (monthly to annual)

Headcount forecast → stack plan → move/add/change requests → floor plan updates →
CAD/space data reconciliation → utilisation measurement (badge, sensor, WiFi) →
restack. **The floor plans are the system of record for space, and they drift out of
date constantly** because physical changes happen faster than CAD updates.

### Loop E — Lease administration (occupier side; continuous with hard dates)

Abstract the lease → load critical dates → pay rent → audit CAM charges → **exercise or
waive options before their notice deadlines** → account under ASC 842 / IFRS 16 →
renew or exit.

**The option notice deadline is the highest-consequence pure-clerical failure in this
chapter.** A renewal or termination option typically must be exercised in a specific
window — often 9-12 months before expiry. Miss it and the company either loses a
below-market renewal right or is locked into space it wanted to leave. The loss can be
in the millions, and the cause is invariably that nobody read the date out of a
90-page lease and put it in a calendar.

### Loop F — Energy, sustainability and compliance (periodic, deadline-driven)

Utility bill capture → validation against consumption → meter data → benchmarking →
GHG accounting → **statutory filings**. Plus the safety compliance calendar: fire alarm
and sprinkler testing, elevator inspections, backflow prevention testing, generator load
bank testing, emergency lighting, air quality — each with its own cadence, its own
certificate, and its own inspecting authority.

## 3. Role inventory

### Building operations

| Role | Seniority | Licence | Typical comp (US) | Owns |
|---|---|---|---|---|
| **Chief engineer** | Senior | Often a stationary engineer's licence | $95-150k | All building systems |
| **Building engineer (I/II/III)** | Entry-senior | Trade licences vary | $60-105k | HVAC, plumbing, electrical, controls |
| Stationary engineer | Mid-senior | Licensed in many cities | $75-120k | Boilers and pressure systems |
| HVAC / electrical / plumbing technician | Trade | Licensed | $55-100k | Their trade |
| **BAS / controls technician** | Mid-senior | Vendor certification | $75-120k | The building automation system |
| **Facilities coordinator** | Entry-mid | None | $45-70k | **The work order queue.** The drudgery centre |
| Facilities manager | Mid | Often IFMA credential | $75-120k | A building or campus |
| Senior / regional facilities manager | Senior | — | $110-170k | A portfolio |
| Janitorial supervisor and staff | Trade | — | Varies; often union | Cleaning |
| Security officer / console operator | Entry | Licensed in many states | $35-60k | Access, patrol, incidents |
| Mailroom, reception, workplace host | Entry | None | $35-60k | Front of house |
| Dispatcher / help desk agent | Entry | None | $38-58k | Ticket intake and routing |
| **EHS manager** | Mid-senior | Certifications | $90-140k | Safety compliance |
| **Energy manager / sustainability analyst** | Mid | CEM, LEED | $75-130k | Consumption, benchmarking, reporting |
| ESG reporting analyst | Mid | — | $85-140k | GHG accounting and disclosure |

### Corporate real estate (occupier side)

| Role | Seniority | Typical comp (US) | Owns |
|---|---|---|---|
| Corporate real estate director / head of workplace | Senior | $180-350k | Portfolio strategy |
| Portfolio manager | Mid-senior | $120-180k | A region's properties |
| **Transaction manager** | Mid | $100-160k | Leases: new, renewal, disposal |
| **Lease administrator** | Entry-mid | $55-85k | **Abstracts, critical dates, rent, CAM audits** |
| Lease accountant | Mid | $80-125k | ASC 842 / IFRS 16 accounting |
| **Space planner / occupancy planner** | Mid | $75-120k | Stack plans, allocation, utilisation |
| **CAD / BIM technician** | Entry-mid | $55-85k | Keeping floor plans current |
| Move coordinator | Entry-mid | $55-85k | Move/add/change execution |
| Workplace experience manager | Mid | $80-130k | Amenities, employee experience |
| Project manager (fit-out) | Mid-senior | $100-160k | Build-outs |
| Procurement specialist | Mid | $75-115k | Vendor sourcing |
| FM account manager (provider side) | Mid-senior | $110-170k | The client relationship and the SLA report |

**The offshore layer.** Occupier lease administration, lease abstraction, CAD drafting,
FM help-desk, and reporting are extensively delivered from India by the large IPCs
(JLL, CBRE, Cushman, Colliers all run substantial India operations) and by specialist
providers. A lease administrator supporting a US portfolio is often sitting in
Gurugram, Bengaluru, or Pune on a night shift. See chapter 14.

## 4. Day in the life

### Facilities coordinator — day in the life

The clearest single drudgery concentration in this chapter.

- **Who they are:** early-career, in an office or a remote help desk, managing a queue
  for one large building, a campus, or a portfolio. Measured on tickets closed, response
  time, and whether anything blew up.
- **Their stack:** a CMMS or IWMS (Corrigo, Building Engines, Nuvolo, Maximo, FM:Systems,
  Archibus), Outlook, Teams or Slack, phone, and Excel for anything the system cannot do.

**A typical day**

| Time | What happens |
|---|---|
| 7:30 | Overnight queue: 30-60 new requests. Most arrived as free-text email. Read, classify, prioritise, and assign each. **Classification is the bottleneck** — "the third floor smells funny" could be HVAC, plumbing, or a dead mouse |
| 9:00 | Dispatch: match each ticket to an in-house tech or a vendor, considering trade, availability, and access restrictions |
| 9:45 | Vendor chasing: call yesterday's vendors who have not updated their tickets. **A large fraction of the day** |
| 10:30 | An escalation: a VP's office is too hot and they have emailed the head of facilities directly. Drop everything |
| 11:15 | Access coordination — a contractor needs badge access and an escort for a Saturday shutdown |
| 12:30 | COI check: two vendors' insurance certificates expired. Email their brokers for renewals; block their work until received |
| 13:30 | Invoice review: match vendor invoices to work orders and purchase orders. Query the ones that do not match |
| 14:30 | Close out completed tickets: chase technicians for missing notes and photos, because **an unclosed ticket with no notes is an SLA failure regardless of whether the work was done** |
| 15:30 | Build the weekly report: open tickets by age and trade, SLA performance, PM compliance. Exported from the system and reformatted in Excel |
| 16:30 | Schedule next week's PM work orders around building events |
| 17:15 | Tomorrow's triage |

**Repetitive-work inventory — facilities coordinator**

| Task | Frequency | Minutes each | Why it's still manual | Data in → data out |
|---|---|---|---|---|
| **Triaging and classifying free-text requests** | 30-100/day | 1-4 | Requests describe symptoms, not categories | Email/call → categorised, prioritised ticket |
| Dispatching to the right resource | 30-100/day | 1-3 | Requires knowing trade, availability, access rules | Ticket → assignment |
| **Chasing vendors and technicians for status** | 20-60/day | 2-5 | The performer is often a third party with no system access | Open ticket → status update |
| Chasing closure notes and photos | 20-50/day | 2-5 | Techs deprioritise documentation | Completed work → documented closure |
| Answering "what's the status of my request" | 15-40/day | 2-5 | Requesters do not check the portal | Question → status |
| **COI expiry tracking and chasing** | Weekly, dozens | 5-15 each | Certificates live as PDFs; expiry is a date buried in them | COI PDF → compliance status |
| Invoice-to-work-order matching | Daily, dozens | 3-10 | Vendor invoices rarely reference the work order cleanly | Invoice + WO → approved or queried |
| SLA / PM compliance reporting | Weekly and monthly | 60-180 | System exports need reformatting and narrative | Ticket data → report |

### Building engineer — day in the life

- **Who they are:** trade background, often 10-30 years. Measured on uptime, comfort
  complaints, and PM completion.
- **Their stack:** the **BAS/BMS** (Metasys, Honeywell, Desigo, EcoStruxure, Niagara)
  on a workstation, a CMMS on a phone or tablet, hand tools, a radio.

**A typical day:** morning rounds before occupancy — check boilers or chillers, air
handlers, pump pressures, water treatment, alarm log from overnight. Then a mix of PM
work orders (filter changes, belt checks, coil cleaning, calibration) and reactive
tickets (hot/cold calls, leaks, a stuck lift, a tripped breaker). Escort contractors.
Meet the elevator inspector. Respond to a BAS alarm. Between all of it, close out work
orders on the phone — **which is the part that gets deferred, and the part the report
measures.**

**Repetitive-work inventory — building engineer**

| Task | Frequency | Time | Why it's still manual | Data in → data out |
|---|---|---|---|---|
| Morning rounds and readings | Daily | 45-90 min | Physical inspection; some readings still logged on paper or a clipboard app | Observation → log |
| **Work order documentation** | 5-20/day | 3-10 min each | Typing notes on a phone after physical work | Work performed → ticket notes |
| Responding to BAS alarms | Several daily | Varies | Many alarms are nuisance; triage is experience-based | Alarm → action or dismissal |
| Hot/cold call diagnosis | Several daily | 15-45 min | Often a control or balance issue, sometimes just perception | Complaint → adjustment |
| PM checklist completion | Continuous | 15-60 min each | Checklists completed by hand per asset | Checklist → compliance record |
| Escorting and supervising contractors | Daily | Hours | Physical presence and access control | — |

### Lease administrator — day in the life

- **Who they are:** often part of an outsourced team, frequently in India for US and
  European portfolios. Manages anywhere from 50 to several hundred leases.
- **Their stack:** a lease administration platform (CoStar Real Estate Manager, Visual
  Lease, FinQuery/LeaseQuery, MRI, Nakisa, Tririga), Excel, and a document repository
  full of scanned lease PDFs.

**A typical day:** abstract new leases — read the document and its amendments and
extract 80-150 fields into the system; validate the monthly rent run before payments go
out; **review the critical date report** and notify stakeholders of options approaching
their notice windows; review a landlord's CAM reconciliation against the lease's own
recovery terms and raise a dispute where the landlord has included something the lease
excludes; answer accounting's queries for the ASC 842 close; update records when an
amendment is signed.

**Repetitive-work inventory — lease administration**

| Task | Frequency | Time | Why it's still manual | Data in → data out |
|---|---|---|---|---|
| **Lease abstraction** | Per new lease/amendment | 2-8 hours | Every lease is bespoke; the fields are consistent but their expression is not | Lease PDF → 80-150 structured fields |
| **Critical date monitoring and notification** | Continuous | — | Dates must first be extracted correctly; consequences of error are severe | Abstract → calendar → notices |
| Rent roll validation before payment run | Monthly | Hours | Cross-checking escalations, abatements, and adjustments | Lease terms → payment schedule |
| **CAM reconciliation review / audit** | Annual, per lease | 2-10 hours each | Requires comparing the landlord's statement to the lease's own recovery clause | Landlord statement + lease → accept or dispute |
| ASC 842 / IFRS 16 data support | Quarterly | Days | Accounting needs specific fields, often not in the abstract | Lease data → accounting inputs |
| Portfolio reporting | Monthly | Hours | Assembled from the system plus Excel | Lease database → report |

### Energy / sustainability analyst — day in the life

- **Their stack:** EnergyCAP or a utility data provider (Arcadia, Urjanet), ENERGY STAR
  Portfolio Manager, Measurabl or Watershed for carbon, Excel, and the utility portals.

**A typical month:** collect and validate utility bills across the portfolio — hundreds
of accounts across multiple utilities, arriving as PDFs, portal downloads, and EDI
feeds; **find the anomalies** (a bill double the prior month usually means a meter read
estimate, a leak, or a billing error, and catching it is real money); normalise
consumption for weather and floor area; update ENERGY STAR benchmarking; compile
Scope 1, 2 and increasingly 3 emissions; and prepare **statutory filings** for building
performance standards where they apply.

Building performance standards are the sharpest deadline in this chapter: several US
cities and states now impose emissions or energy limits on large buildings, with
**annual reporting requirements and financial penalties for non-compliance**. New York
City's Local Law 97 is the most cited, with Boston, Washington State, Denver, and others
having their own regimes. Each has its own reporting format and deadline.

**Repetitive-work inventory — energy and sustainability**

| Task | Frequency | Time | Why it's still manual | Data in → data out |
|---|---|---|---|---|
| **Utility bill capture and data entry** | Monthly, hundreds of accounts | Bulk | Bills arrive as PDFs in inconsistent formats from many utilities | Bill PDF → consumption and cost record |
| Bill validation and anomaly detection | Monthly | Hours | Requires comparison to history and knowledge of the site | Bill → flagged exception |
| Benchmarking submission | Annual, per building | 1-3 hours each | Portfolio Manager requires specific inputs | Consumption + property data → score |
| **Building performance standard filings** | Annual, per jurisdiction | Days | Each jurisdiction has its own format and rules | Emissions data → statutory filing |
| GHG inventory compilation | Annual/quarterly | Weeks | Data spread across utilities, travel, procurement | Many sources → inventory |
| Compliance calendar tracking | Continuous | — | Many jurisdictions, many deadlines | Regulations → calendar |

### Space planner — day in the life

Maintaining the stack plan (who sits where, by floor and business unit); processing
move/add/change requests; reconciling the CAD floor plans against reality after moves;
producing utilisation reports from badge and sensor data; and modelling restacks —
"if we consolidate three floors into two, who moves where, and what does it cost".
**The persistent problem is data drift:** the floor plan says one thing, the HR system
says another, and the badge data says a third.

## 5. The document & data layer

| Document | Producer | Standardised? | Notes |
|---|---|---|---|
| Work order | CMMS | System-specific | The atomic operational record |
| PM checklist | CMMS / manufacturer | Per asset type | Compliance evidence |
| **Asset register** | FM team | No | What equipment exists, where, how old. Frequently incomplete — the foundational data problem in FM |
| O&M manual | Contractor at handover | No | Often a box of PDFs nobody indexes |
| **COI (certificate of insurance)** | Vendor's broker | **ACORD forms — standardised** | Expiry tracking; a good extraction target because the form is standard |
| MSA and SOW | Procurement | Firm-specific | Vendor contracts |
| Invoice and PO | Vendor / procurement | Semi-standard | Matching problem |
| **Lease abstract** | Lease administrator | Firm template | 80-150 fields |
| **Critical date report** | Lease system | Firm template | The highest-consequence output in the chapter |
| CAM reconciliation statement | Landlord | No | Reviewed and often disputed |
| Option / renewal notice letter | Occupier | No | Must be served correctly and on time |
| **Utility bill** | Utility | **No — every utility differs** | Hundreds per month per portfolio |
| ENERGY STAR benchmarking report | Portfolio Manager | Yes | Annual |
| Building performance standard filing | Occupier/owner | Per jurisdiction | Statutory, penalised |
| Fire, elevator, backflow inspection certificates | Inspectors | Per jurisdiction | Periodic, mandatory |
| EHS incident report | EHS | Firm/OSHA | Recordkeeping obligation |
| Floor plan / CAD polyline | CAD technician | BOMA measurement standards exist | The space system of record |

## 6. Systems of record

| System | Category | Position | API reality |
|---|---|---|---|
| **IBM Maximo** | Enterprise asset management | Heavy industry and large portfolios | Yes, enterprise |
| **Corrigo (JLL)** | CMMS | Very widely deployed in retail and outsourced FM | Partner-gated |
| Building Engines (JLL), Angus, Prism | Commercial property operations | Common in US office | Gated |
| **Nuvolo** | FM built on ServiceNow | Growing where ServiceNow already exists | ServiceNow platform APIs |
| ServiceNow Workplace | Workplace service delivery | Where IT already owns ServiceNow | Good |
| Accruent (FAMIS, Lucernex, Siterra), Planon, Archibus, FM:Systems, IBM Tririga | IWMS | The established IWMS field | Varies, generally gated |
| UpKeep, Limble, Fiix, eMaint | SMB CMMS | Mid-market | Good, modern |
| **Johnson Controls Metasys, Honeywell, Siemens Desigo, Schneider EcoStruxure, Distech** | BAS/BMS | The building's control system | Proprietary, with **BACnet** and **Modbus** as the open protocols |
| **Tridium Niagara** | BAS integration framework | The de facto integration layer across BAS vendors | Yes — this is the technical entry point for building data |
| EnergyCAP, Arcadia, Urjanet | Utility data | Established | Yes |
| ENERGY STAR Portfolio Manager | Benchmarking | US standard, free | Yes — a public API |
| Measurabl, Watershed, Persefoni | ESG and carbon | Growing | Yes |
| **CoStar Real Estate Manager, Visual Lease, FinQuery, Nakisa, MRI, Tririga** | Lease administration and accounting | Created largely by ASC 842 / IFRS 16 | Yes |
| SpaceIQ, OfficeSpace, Robin, Envoy | Space and desk booking | Post-2020 growth then consolidation | Yes |
| Density, VergeSense, XY Sense | Occupancy sensing | Niche | Yes |

**The engineer's entry point.** If you want live building data, the practical path is
**BACnet via Tridium Niagara**, not a vendor API. The BAS world has genuine open
protocols — unusual in this guide — but the data is poorly labelled (point names like
`AHU3_SAT_SP` with no schema), which is why projects like Project Haystack and Brick
Schema exist to add semantic tagging. **Naming and tagging building points is itself a
manual, repetitive, expert task** performed on every commissioning project.

## 7. Rules, regulators, and hard constraints

- **Licensed trades.** Electrical, plumbing, elevator, boiler and refrigerant work
  requires licensed technicians, and inspections require licensed inspectors. **An AI
  cannot sign off a system.** Dispatching, documenting, and scheduling around them can
  be automated; the sign-off cannot.
- **Life safety procedures.** Lockout/tagout, confined space entry, hot work permits,
  fall protection — these are physical procedures with mandatory human steps and
  documentation. Automating the *paperwork* is welcome; automating the *procedure* is
  not a thing.
- **OSHA.** Recordkeeping, incident reporting, and inspection exposure.
- **Fire and life safety inspection cadences.** Alarms, sprinklers, extinguishers,
  emergency lighting, generators — each on its own schedule set by code and local
  authority, each producing a certificate that must be retained and produced on demand.
- **Elevator, boiler, and backflow inspections.** Jurisdictional, periodic, certificated.
- **Building performance standards.** Emissions and energy caps with **statutory annual
  filings and financial penalties**. Jurisdiction-specific formats and deadlines. This
  is a genuine growth area of compliance obligation.
- **ADA and accessibility.** Physical compliance obligations.
- **ASHRAE standards.** Ventilation, thermal comfort, and indoor air quality baselines.
- **Refrigerant management.** EPA rules on leak repair and recordkeeping for larger
  systems, with a live transition to lower-GWP refrigerants.
- **Data privacy in workplace analytics.** This kills product ideas, so be specific:
  badge data, WiFi location, and camera-based occupancy sensing are **personal data**
  under GDPR. In much of Europe, deploying employee monitoring requires works council
  consultation and a lawful basis, and "we want a nicer utilisation dashboard" is a weak
  one. Individual-level tracking is generally out; aggregated, anonymised occupancy is
  the workable pattern. Several US states add biometric and privacy statutes — Illinois'
  BIPA in particular has produced substantial litigation over biometric access systems.
- **Union work rules.** In many commercial buildings, cleaning, engineering, and
  security staff are unionised (SEIU 32BJ in the US north-east, for example). Collective
  agreements constrain which tasks may be reassigned or eliminated **regardless of what
  technology makes possible.** A product whose value proposition is cutting union
  headcount will not be bought by the people you are selling to.

## 8. What has already been tried

| Attempt | What it tried | Outcome | The lesson |
|---|---|---|---|
| **Smart building / IoT platforms** (numerous) | Instrument buildings, surface analytics dashboards | Persistent pilot purgatory | Dashboards do not close tickets. **Insight without an action loop does not get renewed** |
| **BrainBox AI, 75F, PassiveLogic** | Autonomous HVAC optimisation | Real deployments; savings claims are vendor-reported and hard to verify independently | Energy optimisation is technically real. Treat vendor savings percentages sceptically and demand measurement and verification |
| **Comfy (acquired by Siemens), Robin, Envoy** | Employee-facing workplace apps | Consolidated into larger platforms | Standalone employee apps struggle; they get absorbed |
| **Density, VergeSense, XY Sense** | Occupancy sensing hardware | Survived the return-to-office shakeout in reduced form | Demand collapsed when offices emptied, then partially returned. Privacy constrained the product |
| **Digital twins** | Full virtual model of a building's systems | Much marketing, limited operational deployment | The data quality required does not exist in most buildings. **Start from the asset register problem, not the 3D model** |
| **WeWork** | Reinvent the occupier relationship | Collapse | Discussed in chapter 06 |
| **Corrigo, Building Engines, Nuvolo, ServiceNow** | Digitise the work order and service loop | The real commercial successes of the category | **Owning the operational workflow of record won.** The analytics were downstream of that |
| **Lease accounting software** (Visual Lease, FinQuery, Nakisa) | Comply with ASC 842 / IFRS 16 | A whole category created by an accounting standard | Regulation manufactures software markets. Watch for the next mandate |

**The synthesis:** in FM, the products that worked owned an operational loop that
someone was already obliged to run — work orders, lease compliance, energy filings. The
products that struggled sold insight without owning an obligation. Given that most
buildings still lack a complete, accurate asset register, **there is a real case that
the unglamorous data-foundation work is the actual opportunity**, and it is exactly the
kind of tedious extraction-and-reconciliation task agents are suited to.

## 9. Where the human genuinely adds value

- **Physical work.** Someone must be in the plant room.
- **Emergency response.** A flood, a fire alarm, a power failure, a stuck lift with
  someone in it. Judgment and presence under pressure.
- **Diagnostic intuition on old equipment.** A chief engineer who knows that this
  particular chiller has always behaved this way in humid weather is carrying knowledge
  no system holds.
- **Occupant relationships.** Facilities staff are the face of the building. Much of the
  perceived quality of a workplace is how quickly a person responds to you kindly.
- **Vendor relationships.** Getting a contractor to come out at 2am is a relationship.
- **Negotiating with landlords.** Lease renewals, CAM disputes, and capital contributions
  are commercial negotiations.
- **Judgment on capital deferral.** Deciding whether the chiller lasts another year is a
  risk decision with real consequences.

## 10. Glossary

- **ASC 842 / IFRS 16** — Accounting standards requiring leases on the balance sheet.
- **BACnet** — The open communication protocol for building automation.
- **BAS / BMS** — Building Automation System / Building Management System.
- **BOMA** — Building Owners and Managers Association; publishes floor measurement standards.
- **Brick Schema / Project Haystack** — Efforts to standardise semantic tagging of building data points.
- **CAFM / CMMS / IWMS** — Computer-Aided Facility Management / Computerised Maintenance Management System / Integrated Workplace Management System. Overlapping categories: CMMS is maintenance-centric, CAFM space-centric, IWMS the combined enterprise suite.
- **CAM** — Common Area Maintenance charges.
- **Chief engineer** — The senior technical person responsible for a building's systems.
- **COI** — Certificate of Insurance.
- **Critical date** — A lease deadline (option, notice, expiry) with financial consequence.
- **Hard services / soft services** — Building systems (HVAC, electrical, lifts) vs cleaning, security, catering, landscaping.
- **IFM** — Integrated Facilities Management; bundling all services with one provider.
- **MAC** — Move, Add, Change.
- **Niagara** — Tridium's framework for integrating disparate building systems.
- **PM compliance** — Percentage of scheduled preventive maintenance completed on time.
- **Restack** — Reorganising which groups occupy which floors.
- **RUBS** — Ratio Utility Billing System.
- **Scope 1 / 2 / 3** — Direct emissions / purchased energy emissions / value chain emissions.
- **SLA / KPI** — Service Level Agreement / Key Performance Indicator; the measurement regime in an FM contract.
- **Stack plan** — A diagram of which business unit occupies which floor.
- **Work order** — A record of requested or scheduled maintenance work.

## 11. Verify before you rely on this

| Claim | Why it moves | Check against |
|---|---|---|
| Building performance standards (LL97, BERDO, others) — thresholds, deadlines, penalties | Actively phasing in and being amended | The specific city or state programme page |
| GDPR / works council requirements for workplace sensing | Jurisdictional and evolving | Counsel; local data protection authority guidance |
| BIPA and US state biometric law exposure | Active litigation | Counsel |
| Vendor savings claims for autonomous HVAC | Vendor-reported | Demand independent M&V; IPMVP protocol |
| FM contract structures and pricing | Commercially negotiated, not published | Actual contracts; IFMA benchmarking |
| Opex per square foot figures | Vary enormously by market and asset | BOMA Experience Exchange Report; the building's own budget |
| Refrigerant transition rules | Phasing under EPA rulemaking | EPA SNAP / AIM Act pages |
| IWMS/CMMS vendor positions and ownership | Consolidating (JLL owns Corrigo and Building Engines) | Vendor sites |

**Method note.** This chapter was written from domain knowledge after a rate limit ended
the research fan-out. Process, role, and system descriptions reflect standard industry
practice; comp bands and cost figures are indicative ranges. Compliance obligations
named here are illustrative of *shape* — the specific requirements are jurisdictional
and must be checked per site.
