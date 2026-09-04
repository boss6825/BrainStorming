# 15 · The Repetitive Work Atlas

> This is the payoff chapter. Every mechanical, recurring task identified across chapters
> 01-14, consolidated into one place, organised so you can hunt through it.
>
> **You said you would find the use cases yourself. This chapter does not find them for
> you.** It gives you the raw inventory, a scoring frame to sort it with, the
> cross-cutting patterns that suggest where the real openings are, and an honest list of
> things not to build. What you conclude from it is yours.

## Contents

- [1. How to use this atlas](#1-how-to-use-this-atlas)
- [2. The scoring frame](#2-the-scoring-frame)
- [3. The atlas, by work shape](#3-the-atlas-by-work-shape)
- [4. Cross-cutting patterns](#4-cross-cutting-patterns)
- [5. The anti-patterns: what not to build](#5-the-anti-patterns-what-not-to-build)
- [6. The clearest openings, and why](#6-the-clearest-openings-and-why)
- [7. Questions to answer before committing](#7-questions-to-answer-before-committing)

---

## 1. How to use this atlas

The tables below list tasks, not ideas. A task becomes a use case only when you have
answered four questions about it (chapter 00, section 13):

1. **How many times per year does this happen across the market?**
2. **Who pays for it today, and how much?**
3. **Where is the licensed-human boundary?**
4. **What would an offshore analyst charge to do it?**

The atlas gives you the first-order facts. The chapter references take you to the day-in-
the-life detail behind each row.

**A note on the "already served" column.** It records whether credible products already
attack this work. A crowded row is not automatically a dead row — incumbents are often
weak, expensive, or serving only the enterprise tier — but it changes the question from
"could this work" to "why you, now". An empty column is worth more of your attention.

## 2. The scoring frame

Score each candidate task on six dimensions. The frame is designed so that a high total
correlates with *deployability*, not just technical feasibility — which is where most
real estate AI ideas actually fail.

| Dimension | Score high when | Score low when |
|---|---|---|
| **Volume** | It happens thousands of times per year per customer | It happens a few times a year |
| **Definability** | The rule defines "correct" explicitly and in writing | Correctness is a matter of professional judgment |
| **Verifiability** | The output can be checked against a source of truth | You would have to trust it blind |
| **Consequence** | Failure has a specific, expensive, named consequence | Failure is mild inefficiency |
| **Access** | The data is the customer's own, or openly available | It requires a licence from a hostile incumbent |
| **Legal headroom** | No licensed act, no consumer contact, no protected decision | It touches a reserved act, a credit/housing decision, or outbound consumer contact |

**The two dimensions people systematically underweight are Verifiability and Legal
headroom.** In a liability-heavy industry, an agent whose work cannot be checked will not
be deployed no matter how good it is, and an agent that touches a reserved act or a
protected decision imports a compliance burden most small teams cannot carry.

**Definability deserves a specific note.** The single best predictor of a deployable
agent workflow in this industry is that **someone has already written the procedure
down** — as a statutory rule, a compliance checklist, an underwriting guideline, or an
offshore team's SOP. Where a written specification exists, the hardest part of automating
knowledge work is already done.

## 3. The atlas, by work shape

Organised by the eight shapes from chapter 00, section 11.

### Shape 1 — Document → structured data

*Read a document, extract fields, put them in a system.*

| Task | Role | Ch | Volume | Licensed boundary | Already served |
|---|---|---|---|---|---|
| **Commercial lease abstraction** (80-150 fields from a 90-page lease + amendments) | Analyst, lease administrator, offshore team | 06, 09 | Hours per lease; hundreds per portfolio deal | None | **Yes — heavily.** Prophia, MRI/Leverton, Occupier, plus offshore |
| **Rent roll normalisation** | Acquisitions analyst | 06, 08 | Every deal | None | Partially |
| **T-12 / operating statement normalisation and expense mapping** | Acquisitions analyst | 06, 08 | Every deal | None | Weakly |
| Loan document extraction (paystubs, bank statements, tax returns) | Processor | 03 | Every file | None | **Yes — commoditised.** Ocrolus and incumbents |
| **Self-employed income calculation from tax returns** | Underwriter | 03 | Every self-employed file | Underwriting *decision* is delegated authority; the *calculation* is not | Partially |
| **Title search abstraction from county records** | Abstractor, examiner, offshore analyst | 04 | Every transaction | Examination judgment is; data assembly is not | Weakly — mostly offshored |
| Appraisal data entry from public records | Appraiser | 05 | Every report | Signature is reserved; data entry is not | Weakly |
| **Certificate of insurance (COI) data extraction and expiry** | FM, PM, construction admin | 02, 07, 09 | Hundreds of vendors, annual renewal | None | Weakly — a real gap |
| **Utility bill data capture across many utilities** | Energy analyst | 09 | Hundreds monthly per portfolio | None | Partially — EnergyCAP, Arcadia |
| Inspection report → repair addendum | Buyer's agent, TC | 01 | Every transaction with an inspection | Negotiating the ask is reserved; drafting from the report is not | Weakly |
| **Side letter obligation extraction** | Fund compliance | 08 | Dozens per fund | None | **No — a clear gap** |
| **Indian title document set review** (mother deed, EC, khata, approvals) | Panel advocate, property lawyer | 13, 14 | Every transaction, **repeated by each party** | Legal opinion is reserved; document assembly and defect flagging are not | **No** |
| Construction submittal review against specification | Project engineer | 07 | Hundreds per project | Engineer-of-record approval is reserved | Weakly |
| MLS listing data entry from a seller information sheet | Listing coordinator, offshore VA | 01 | Every listing | None | Weakly — mostly offshored |

### Shape 2 — Data → document

*Assemble a document from known facts.*

| Task | Role | Ch | Volume | Licensed boundary | Already served |
|---|---|---|---|---|---|
| **IC memo drafting** | Acquisitions analyst | 08 | 1-4/month per analyst | None | Weakly |
| **Offering Memorandum production** | Brokerage analyst + marketing | 06 | Every listing | None | Partially — Buildout |
| Appraisal narrative assembly (boilerplate + property specifics) | Appraiser | 05 | Every report | **Signature reserved**; drafting is not | Partially |
| **Commercial narrative appraisal templating** (60-70% is reusable firm language) | Commercial appraiser | 05 | Every assignment | Signature reserved | Weakly |
| **Demand letter generation** | Indian CRM executive | 14 | Dozens-hundreds monthly | None | Partially — inside developer ERPs |
| **State-specific tenant notices** | Property manager | 02, 11 | Continuous | Legal advice is reserved; a compliant form notice is not | Weakly — a real gap given per-state variation |
| **DDQ response assembly** from a library of past answers | IR associate | 08 | 20-80 hours per DDQ | None | Weakly — a clear gap |
| Quarterly LP reporting package assembly | Fund accounting | 08 | Quarterly | Financial statement sign-off is | Partially |
| Capital call and distribution notices | Fund accounting | 08 | Several per year per investor | None | Yes — Juniper Square et al |
| **RA bill preparation** | Indian billing engineer | 14 | Monthly per subcontractor | None | Weakly |
| **Society maintenance invoicing** | Indian society manager | 14 | Monthly per flat | None | Partially — ADDA, MyGate |
| Listing descriptions and marketing copy | Agent | 01 | Every listing | None | **Yes — commoditised** |
| **Property tax appeal evidence packets** | Tax consultant | 05 | Hundreds per season | None | Weakly |
| **Indian RERA QPR compilation** | Developer compliance | 13 | Quarterly per project | None | **No — a clear gap** |

### Shape 3 — Chase and follow-up

*Repeatedly contact humans until they send a thing. **The highest-volume pain in the
industry, and the least served by prior software.***

| Task | Role | Ch | Volume | Licensed boundary | Already served |
|---|---|---|---|---|---|
| **Mortgage condition clearing** (chasing borrowers and third parties) | Processor | 03 | Continuous; the core of the job | Not a reserved act | **Weakly — the biggest gap in mortgage** |
| **Lien release / payoff chasing** | Title curative specialist | 04 | Continuous | None | **No** |
| **HOA estoppel and demand letter chasing** | Title, escrow | 04 | Every transaction with an HOA | None | Weakly |
| **Tenant estoppel certificate chasing** | CRE analyst | 06 | Every sale and financing | None | **No** |
| **Vendor / technician status chasing** | Facilities coordinator | 09 | 20-60/day | None | Weakly |
| **COI renewal chasing** | FM, PM, construction | 02, 07, 09 | Continuous | None | Weakly |
| **RFI chasing** with architects and engineers | Project engineer | 07 | Daily; a large share of the job | None | Weakly — Procore logs but does not chase |
| **Subcontractor lien waiver collection** | Project accountant | 07 | 80-150/month | None | Partially — Textura, GCPay |
| **Property financial collection from managers** | Fund accountant | 08 | Quarterly per property | None | **No** |
| Rent delinquency follow-up | Assistant PM, collections | 02 | Continuous | Consumer-contact rules apply | Partially — Colleen AI |
| **Indian collections follow-up on demand letters** | CRM executive | 14 | Daily, dozens | Consumer-contact rules apply | **No** |
| **Bank disbursement coordination** (three-way chase) | Indian CRM executive | 14 | Continuous | None | **No** |
| Appraisal occupant scheduling | Appraiser, AMC coordinator | 05 | Several daily | None | Weakly |
| **Missing document chasing in a brokerage compliance file** | Compliance reviewer | 01, 11 | Continuous | None | Weakly |
| Home loan file chasing across lenders | Indian DSA | 14 | Continuous | None | **No** |

### Shape 4 — Deadline and calendar management

*Track dates across jurisdictions and act before each. **Low glamour, high consequence.***

| Task | Role | Ch | Consequence of failure | Already served |
|---|---|---|---|---|
| **Mechanics lien preliminary notices and filing deadlines** | Subcontractor, supplier | 07, 11 | **Total forfeiture of lien rights** | **Yes — Levelset (Procore)** |
| **Lease option / notice date tracking** | Lease administrator | 09, 11 | Loss of a below-market renewal, or being locked into unwanted space | Partially — lease systems hold the date, few act on it |
| **1031 exchange 45/180-day deadlines** | QI, investor | 08, 10, 11 | Full taxation of the deferred gain | Weakly |
| **Contract contingency deadlines** | Transaction coordinator | 01 | Loss of deposit or of a right to withdraw | Partially — dotloop, SkySlope |
| **Property tax appeal deadlines** (per county) | Tax consultant, owner | 05, 11 | A year's overpayment locked in | **No** |
| **Self-storage lien sale statutory sequence** | Storage operator | 10, 11 | Void sale; liability to the tenant | **No** |
| **Foreclosure notice sequences** | Default servicer | 10, 11 | Invalid foreclosure | Partially — servicing platforms |
| **LIHTC recertification calendar** | Compliance specialist | 02, 11 | **Tax credit recapture** | Partially |
| **Building performance standard filing deadlines** | Sustainability analyst | 09, 11 | Financial penalties | Weakly |
| **Licence and CE renewal across states** | Any multi-state licensee | 11 | Unlicensed activity | Weakly |
| Fire, elevator, backflow inspection cadences | FM | 09 | Code violation; liability | Partially — CMMS |
| **REIT quarterly testing calendar** | Tax, fund compliance | 08, 11 | **Loss of REIT status** | **No** |
| **Indian approval expiry tracking** (CC, NOCs, sanctions) | Liaison officer | 14 | Re-application; project delay | **No** |
| **Indian society statutory filing calendar** | Society manager, treasurer | 14 | Penalties; audit findings | Weakly |

### Shape 5 — Cross-system reconciliation

*The same data in two places; find and fix the disagreement.*

| Task | Role | Ch | Frequency | Already served |
|---|---|---|---|---|
| **CAM reconciliation** (per-lease recovery rules) | Property accountant | 06 | Annual, per tenant | Weakly — **a notorious gap** |
| **CAM audit from the tenant's side** | Lease administrator | 09 | Annual, per lease | Weakly |
| **Closing Disclosure balancing** against the contract and lender file | Closer | 03, 04 | Every transaction | Weakly |
| **Escrow / trust three-way reconciliation** | Escrow, PM accounting | 02, 04, 11 | Monthly | Partially |
| **Fund quarterly close and consolidation** | Fund accountant | 08 | Quarterly | Partially |
| **Capital account allocation** per LPA and side letters | Fund accountant | 08 | Quarterly per investor | Weakly |
| Invoice-to-work-order-to-PO matching | FM coordinator | 09 | Daily | Partially |
| **Construction material reconciliation** (issued vs theoretical consumption) | Billing engineer | 07, 14 | Monthly | **No** |
| Rent roll audit against leases | CRE analyst, PM | 06 | Every deal, and periodically | Weakly |
| **Utility bill anomaly detection** | Energy analyst | 09 | Monthly | Partially |
| **Space data reconciliation** (CAD vs HR vs badge data) | Space planner | 09 | Continuous drift | Weakly |
| Cost sheet vs booking vs ledger | Indian CRM executive | 14 | Continuous | **No** |

### Shape 6 — Rule-checking against a checklist

*Does this file satisfy N written rules? **The best-specified work in the industry.***

| Task | Role | Ch | Volume | Already served |
|---|---|---|---|---|
| **Brokerage compliance file review** | Compliance reviewer | 01, 11 | 20-40 files/day | Weakly |
| **Mortgage post-close QC audit** | QC auditor | 03, 11 | A required sample of every month's fundings | Partially |
| **Underwriting condition review** | Underwriter | 03 | Every file | Delegated authority — assist only |
| **Title examination against a requirements checklist** | Examiner | 04 | Every order | Weakly |
| **MLS listing rule and photo compliance** | MLS compliance staff | 12 | Continuous, high volume | **Yes — Restb.ai and similar.** A proven use case |
| **LIHTC file compliance** | Compliance specialist | 02 | Annual per household | Partially |
| **Tenant screening evidence assembly** | Leasing, screening | 02 | Every application | **Decision is legally constrained** — assemble, do not decide |
| **Application fraud detection** (synthetic paystubs) | Leasing, screening | 02 | Every application | **Yes** — Snappt, Plaid Income |
| **Certified payroll wage classification review** | Construction compliance | 07, 11 | Weekly per worker | Weakly |
| **Municipal plan review against code** | City plan reviewer | 07 | Continuous, backlogged | **No — but the buyer is a municipality** |
| **AML/KYC false-positive clearing** | BSA analyst | 11 | High volume | Partially |
| **Indian bank panel title verification checklist** | Panel advocate | 14 | Per file | **No** |
| **Indian document set completeness for registration** | Documentation executive | 14 | Every transaction | **No** |

### Shape 7 — Conversation at volume

*Answer the same questions for many people. **Highest regulatory exposure — read chapter
11 section 4 before building anything here.***

| Task | Role | Ch | Volume | Legal exposure | Already served |
|---|---|---|---|---|---|
| **Multifamily leasing inquiry handling** | Leasing consultant | 02 | Continuous | Fair housing; consumer contact | **Yes — heavily.** EliseAI et al |
| Lead response for residential sales | ISA | 01 | Continuous | **TCPA, fair housing** | **Yes** — Structurely, Ylopo |
| **Indian pre-sales tele-calling** | Tele-caller | 14 | 80-150 dials/day/person | **TRAI rules; multilingual** | Weakly — a large, under-served market with real constraints |
| **Resident maintenance request intake** | PM, FM | 02, 09 | Continuous | Low | Partially |
| **Borrower status queries** | LO assistant, servicing | 03 | Continuous | UDAAP; consumer contact | Weakly |
| **Indian buyer construction-status queries** | CRM executive | 14 | Daily, repetitive | Low | **No** |
| STR guest messaging | Guest services | 10 | Continuous | Low | **Yes** — Guesty, Hospitable |
| Society resident complaint intake | Society manager | 14 | Daily | Low | Partially — MyGate, ADDA |
| Taxpayer assessment enquiries | Assessor's office | 05 | Seasonal spike | Low | **No** — government buyer |

### Shape 8 — Physical presence (not automatable; the work *around* it is)

| Physical act | What can be automated around it | Ch |
|---|---|---|
| Property showing | Scheduling, feedback capture, follow-up | 01 |
| Maintenance repair | Intake, triage, dispatch, documentation, invoicing | 02, 09 |
| Appraisal inspection | Scheduling, comp research, report drafting | 05 |
| Notarisation and signing | Document preparation, scheduling, post-signing processing | 04 |
| Construction work | RFIs, submittals, billing, scheduling, reporting | 07 |
| Municipal inspection | Booking, evidence assembly, certificate tracking | 07, 09 |
| **Sub-registrar attendance (India)** | Document preparation, appointment booking, checklist verification | 13, 14 |
| STR turnover cleaning | Scheduling, verification, damage claims | 10 |
| Site visit (India primary sales) | Booking, confirmation, follow-up, cost sheet generation | 14 |

## 4. Cross-cutting patterns

Six observations that emerge only when the whole industry is laid out at once.

**1. The industry's dominant unsolved problem is chasing, not extraction.**
Shape 1 (document extraction) is the most crowded category in real estate AI — Ocrolus,
Prophia, Leverton, and a dozen others. Shape 3 (chase and follow-up) is where the most
human hours actually go, and it is barely served. The reason is historical: chasing was
never a *software* problem, because software could not hold a multi-week, multi-party,
judgment-laden pursuit of an unresponsive counterparty. **That is a genuinely new
capability, and the industry has not adjusted to it yet.**

**2. The buyer and the sufferer are usually different people.**
The agent earns the commission; the coordinator does the tasks. The loan officer earns
the commission; the processor chases. The partner owns the client; the analyst rebuilds
the model. This recurs in nearly every chapter and it is a go-to-market problem, not a
product problem. **Products that make the fee-earner's revenue visible sell more easily
than products that make the salaried person's day easier**, even when the latter is what
you actually built.

**3. Regulation manufactures software markets as reliably as it constrains them.**
ASC 842 created the lease-accounting category outright. Mechanics lien statutes created
Levelset. Appraiser independence rules created the AMC industry. Building performance
standards are creating a compliance-reporting category now. **Watch for the next
mandate**, and note that compliance work is counter-cyclical — it does not stop when
transaction volume falls.

**4. Where a written specification exists, the hard part of automation is already done.**
Statutes, underwriting guidelines, compliance checklists, and offshore SOPs are all
specifications of correct behaviour written by someone else. This is the strongest single
signal in the atlas — and it is why the compliance rows (shapes 4 and 6) score so well
despite being unglamorous.

**5. The offshore layer is both the competitive baseline and the beachhead.**
Much of the drudgery here is already performed by trained analysts in India and the
Philippines at a low hourly cost. That weakens pure cost arguments and strengthens
arguments about turnaround, consistency, coverage and elasticity. **For an India-based
builder it is also an unusually accessible market**: the operations are run from Indian
cities by managers measured on cost per file, and the work already has SOPs and quality
scores you can benchmark an agent against.

**6. The seams between the four verbs are worse than the middles.**
Chapter 00 divided the industry into build / transact / operate / own. Each has its own
software and workforce, and the **handoffs between them are unmanaged**: a developer
hands a finished building to a property manager as a pile of PDFs; a purchase agreement's
dates are re-keyed by six parties; a fund's property managers send financials in whatever
format they use. Almost nobody owns the seam, which is exactly why work accumulates there.

## 5. The anti-patterns: what not to build

Each of these has been tried, repeatedly and expensively.

| Anti-pattern | Why it fails | Evidence |
|---|---|---|
| **Disintermediate the residential commission** | Consumers do not switch for a modest fee saving; bypassing the MLS costs you the buyer pool | Redfin, REX, and two decades of attempts (ch 01) |
| **Take principal risk on real estate with an algorithm** | Prediction good enough for a website is not good enough for a balance sheet | Zillow Offers, iBuying broadly (ch 01, 05, 12) |
| **Vertically integrate construction with capital and technology** | Fragmentation, local rule variation, and thin margins defeat integration | Katerra (ch 07) |
| **Cold outbound AI voice to consumers** | The FCC treats AI voices as artificial voices; statutory damages per call, active plaintiffs' bar | Ch 11 section 4 |
| **Any model that makes a housing or credit decision** | Disparate impact liability without intent; explainability obligations | Ch 11 section 3 |
| **A document parser as a standalone business** | Commoditised; the incumbents ship it natively | Ocrolus and incumbent AI features (ch 03, 12) |
| **A leasing chatbot for multifamily** | The most competitive AI category in real estate | EliseAI and peers (ch 02) |
| **Analytics dashboards without an action loop** | Insight without an obligation does not renew | Smart building platforms, digital twins (ch 09) |
| **A business whose core input is scraped from someone who will notice** | You are depending on a data owner's forbearance | CoStar litigation; MLS licence terms (ch 12) |
| **Roll up a labour-intensive operations business and call it tech** | The margins are operational, not software | Vacasa, NestAway, co-living (ch 10, 13) |
| **Tokenise real estate for liquidity** | The binding constraints are legal, not technical | Ch 08, 12 |
| **Assume "public records" means accessible records** | 3,100 US counties and 28 Indian states; viewable is not queryable | Ch 12, 13 |

## 6. The clearest openings, and why

Not recommendations — you asked to find those yourself. This is simply where the atlas's
own scoring frame points hardest, with the reasoning shown so you can disagree with it.

**Rows that score high on volume, definability, verifiability, consequence, access, and
legal headroom simultaneously:**

- **Compliance and deadline work generally** (shapes 4 and 6). The rule is written down,
  correctness is checkable, failure is expensive and named, the data is the customer's
  own, and almost none of it touches a reserved act. It is also counter-cyclical.
  Specific rows with no credible incumbent: property tax appeal calendars, self-storage
  lien sequences, REIT quarterly testing, Indian RERA QPR compilation, Indian approval
  expiry tracking.
- **Chasing work** (shape 3), which is where the industry's hours actually go and where
  prior software could not help. Mortgage condition clearing, lien release chasing,
  tenant estoppel chasing, and the Indian collections and bank-disbursement chase all
  score well and have no serious incumbent.
- **The offshore SOP workflows** (chapter 14, section 4.9), because the specification,
  the volume data, the quality metric, and the buyer are all already in place — and the
  buyer is reachable from India.
- **Reconciliation with per-instance rules** (shape 5), especially CAM reconciliation and
  fund capital-account allocation, where the logic is explicit but bespoke per lease or
  per LPA — precisely the case where a rules engine failed and a language model might not.
- **The Indian post-sales (CRM) function** (chapter 14, section 4.3), which stacks four
  work shapes into one role with a hard financial KPI, and has essentially no dedicated
  tooling.

**The two structural facts that should shape whatever you choose:**

1. **Legal headroom is worth more than it looks.** The back office — no consumer contact,
   no reserved act, no protected decision — carries none of chapter 11's exposure. Two
   ideas of equal merit are not of equal value if one of them is an FCC ruling away from
   being illegal.
2. **Your position as an India-based builder is asymmetric.** You can see the domestic
   market's WhatsApp-and-vernacular reality that foreign teams cannot build for, and you
   can reach the offshore services industry that performs Western real estate drudgery.
   Those are two different businesses with opposite economics — cheap domestic labour
   versus dollar-priced export work — and conflating them is the most likely way to
   misprice a product.

## 7. Questions to answer before committing

A checklist for any candidate that survives the atlas.

**Market**
- How many instances per year, across how many buyers?
- Who holds the budget, and is that the same person who feels the pain?
- What does the customer pay today — software, salary, offshore contract, or nothing?

**Feasibility**
- Where does the data live, and can I get it without a licence from a hostile party?
- Is there a written specification of correct behaviour I can build against?
- Can the output be verified against a source of truth, by the customer, in seconds?

**Legal**
- Does this touch a reserved act (chapter 11, section 2)?
- Does it make or influence a housing, credit, or pricing decision?
- Does it involve outbound contact with a consumer?
- What is the audit trail when a regulator or a court asks what happened?

**Competition**
- Who already does this — as software, as an offshore team, or as an incumbent's feature?
- What happens when the system of record ships this natively? (Yardi, AppFolio, Procore
  and ICE all ship AI features now.)
- Why me, and why now?

**Failure**
- What happens when the agent is wrong? Who notices, how fast, and who pays?
- Does it fail visibly, or silently? **Silent failure is disqualifying in this industry.**

---

**Where to go next in this repo.** This guide is a knowledge base, not an ideation
session. When you are ready to turn rows in this atlas into candidate ideas and pressure-
test them, the repo already has the machinery for it: `.claude/skills/ideate/SKILL.md`
runs a structured diverge-then-converge session over the
`creative-thinking-toolkit/`, and `.claude/skills/council/SKILL.md` runs a
heterogeneous multi-model panel (locally) if you want independent models arguing about a
candidate rather than one model agreeing with you.
