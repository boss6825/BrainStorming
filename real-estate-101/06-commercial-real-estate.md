# 06 · Commercial Real Estate — Brokerage, Leasing, and Capital Markets

> Commercial real estate (CRE) is property leased or owned for **business income**, not
> shelter — offices, shops, warehouses, hotels, apartment buildings once they cross into
> institutional ownership, and increasingly data centres and life-science labs. It is a
> distinct industry from residential real estate because both sides of nearly every deal
> are professional counterparties — a company renting space, an institution buying a
> building, a bank underwriting a loan — not a family. That single fact changes
> everything downstream: there is no MLS (Multiple Listing Service — the shared,
> regulator-mandated database that makes residential asking prices and sold prices
> visible to any licensed agent); deals are privately negotiated and comps (comparable
> transactions — what a nearby, similar space actually leased or sold for) are guarded
> like trade secrets. Brokers, lenders, appraisers, and asset managers sit between owner
> and occupant and take a fee at nearly every step, and because nothing is public by
> default, an entire information industry — CoStar, Crexi, CompStak — exists just to
> reconstruct, by phone call and by scraping, the market data that residential real
> estate gets handed for free.

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
- [11. Sources](#11-sources)

## 1. How the money actually flows

### 1.1 The asset classes, and why each behaves differently

"Commercial real estate" is not one market. A person fluent in office leasing can be
useless in a hotel deal — the income model, the lease length, and the risk are
different enough that they are effectively different industries sharing a vocabulary.

| Asset class | What it is | Typical lease term | Income model | 2026 state |
|---|---|---|---|---|
| **Office** | Space for white-collar work | 5-10 years | Base rent, usually with escalations | In real, historic distress. National vacancy was **19.9% at end of Q1 2025** (up 170 bps year-over-year) and **17.6% as of May 2026** [unverified — figure is a WebFetch-summarized secondary report, not the primary CommercialEdge/Colliers dataset]. Utilization is flat at **~54% of pre-pandemic levels**, and square footage per employee has fallen **23% since 2019**. Since 2024, distressed sales are **19.4% of the ~800M sq ft that changed hands**, versus 6.2% in 2021-2023 — concentrated in CBD (central business district) towers, where **34.6%** of square footage sold was distressed and **73%** of comparable CBD sales traded at a discount. (CommercialSearch/Commercial Property Executive, see §11) |
| **Retail** | Strip centres, power centres, malls, single-tenant net-lease boxes | 3-10 years (strip/power), 10-25 years (single-tenant NNN) | Base rent + **percentage rent** (see below) in mall/strip; pure NNN in single-tenant | Bifurcated: grocery-anchored strip centres and single-tenant NNN (a Walgreens, a Chick-fil-A, a Dollar General on its own parcel, sold like a bond) are the most stable CRE product going; enclosed malls keep de-malling or converting. |
| **Industrial / logistics** | Warehouses, distribution centres, cold storage, last-mile | 3-10 years | Base rent, often NNN | The strongest sector through the 2010s-early 2020s e-commerce boom; supply caught up with demand by 2024-25 and rent growth cooled, but it never saw an office-style vacancy blowout. |
| **Multifamily (institutional)** | Apartment complexes, 50-1,000+ units | ~12-month resident leases, but the *asset* trades on 5-10 year hold periods | Monthly rent from many small tenants | Behaves like a diversified bond, not one big lease — no single tenant's default sinks the NOI. Chapter 02 covers day-to-day property management; this chapter covers it as an institutional investment (acquisitions, dispositions, debt). |
| **Hospitality (hotels)** | Full-service, select-service, extended-stay | Nightly | Room revenue, F&B, often a three-way split between owner / brand (Marriott, Hilton) / operator | The closest CRE asset class to an operating business — RevPAR (revenue per available room) moves daily, not annually. |
| **Data centres** | Powered, cooled buildings housing servers | 10-15+ years, often built-to-suit | Rent tied to **power draw** (priced per kW/MW), not just square footage | Owned by specialist REITs (Digital Realty, Equinix) and increasingly hyperscalers (Google, Microsoft, Amazon) themselves; Nareit (the REIT trade association) classifies it as a distinct REIT sector because the underwriting is an infrastructure/power problem, not a space problem (Nareit, see §11). |
| **Life science** | Wet labs and vivariums, not office shells — special HVAC, floor loads, vibration control | 7-15 years | Base rent, high TI cost | Effectively a lab-building sub-market of office/R&D real estate, concentrated in a handful of clusters (Boston/Cambridge, San Francisco Bay Area). Nareit does not break it out as its own REIT sector — it is usually reported inside Health Care or Office/Diversified REIT categories (Nareit, see §11) [unverified where cluster specifics are stated without a fetched source this session]. |
| **Medical office** | Physician and outpatient clinical space | 5-10 years | Base rent | Classed by Nareit under **Health Care REITs** alongside senior living, hospitals, and skilled nursing (Nareit, see §11); stickier tenants than regular office because of build-out cost and patient-base geography. |

### 1.2 Lease structures — who pays for what

The lease structure is the single most consequential negotiating point in CRE, because
it decides who bears the risk of rising costs.

| Structure | Base rent covers | Tenant separately pays | Common in |
|---|---|---|---|
| **Full-service gross** | Everything — landlord pays taxes, insurance, and maintenance out of the rent it collects | Nothing extra (sometimes above a "base year" — see modified gross) | Office |
| **Modified gross** | A negotiated split — often operating costs are baked into a **base year** (the first year of the lease, used as the expense baseline) | The tenant's **pro-rata share** (its percentage of the building's rentable square footage) of any increase in operating costs *above* the base year | Office, especially multi-tenant |
| **Triple net (NNN)** | Only the landlord's own cost of capital and profit | Property taxes, insurance, **and** CAM (see below) — the "three nets" — in addition to base rent | Retail, industrial, single-tenant net-lease |
| **Percentage rent** | A lower base rent | A percentage of the tenant's **gross sales** above a negotiated breakpoint | Enclosed malls, some power centres |

(Visual Lease; Wikipedia *Net lease*; Wikipedia *Percentage rent* — see §11)

Worked percentage-rent example: a mall tenant pays $3,000/month base rent plus 5% of
monthly gross sales above a $60,000 **breakpoint** (the sales level at which percentage
rent kicks in). In a month the store rings up $80,000, percentage rent = 5% × ($80,000 −
$60,000) = **$1,000**, on top of the $3,000 base — $4,000 total for that month.

### 1.3 CAM reconciliation — the annual grind

**CAM (Common Area Maintenance)** is the landlord's cost of running the building's
shared spaces and systems: lobbies, parking lots, landscaping, snow removal, common-area
utilities and cleaning, elevator and HVAC (heating, ventilation, and air conditioning)
maintenance, property management fees, and often property taxes and insurance bundled
into the same pass-through. In an NNN or modified-gross lease, tenants **pre-pay
estimated CAM monthly** based on the landlord's budget for the year — a fixed number
baked into the monthly rent invoice.

**CAM reconciliation** is what happens once the actual year is over: the landlord (or,
in practice, a property accountant or CAM analyst) tallies every actual dollar spent on
CAM for the year, allocates it across tenants by their pro-rata share of the building,
compares that to what each tenant already paid in estimates, and bills or refunds the
difference. This is done **once a year, for every property in the portfolio, for every
tenant in every property**, usually in a tight window after year-end close (commonly
Q1) — hence "the annual grind." Sources describing the process consistently flag it as
one of the **most frequently botched, most time-consuming recurring tasks** in
commercial property accounting (LoopNet, Occupier — see §11), for reasons that compound:

- Every lease has **bespoke exclusions** (a tenant negotiated out capital expenditures,
  or capped its own CAM increase at 5%/year, or excluded roof/structure) that must be
  applied lease-by-lease, not portfolio-wide.
- Actual invoices arrive from dozens of vendors (landscaping, snow removal, security,
  utilities) on different schedules and must be coded to the right expense category and
  the right property before they can be allocated at all.
- **Gross-up clauses** (adjusting variable costs, like utilities, as if the building were
  fully occupied, so a partially vacant building's tenants aren't overcharged per-tenant)
  require a separate calculation most junior staff get wrong the first several times.
- The output — a **CAM reconciliation statement** per tenant — is a legal notice with a
  real deadline and real dispute rights; get it wrong and a sophisticated tenant (or its
  lease-audit firm) will contest it, sometimes years later, and landlords can lose the
  right to collect a shortfall entirely if they miss a lease's reconciliation deadline
  (Lavelle Law — see §11).

This is a manual, spreadsheet-driven process even at large landlords, and it is covered
in depth in §4 (day in the life) and §4's repetitive-work table below.

### 1.4 The core formulas, worked through one small deal

Every number below is defined the way a lender or acquisitions analyst actually uses it,
then run through **one illustrative deal** so the arithmetic connects. (This is a
constructed teaching example, not a real transaction.)

**The deal:** a 50,000 sq ft single-tenant industrial building, fully leased on a 10-year
NNN lease at $8.00/sq ft/year, purchased for $5,000,000.

| Term | Definition | Formula | This deal |
|---|---|---|---|
| **NOI** (Net Operating Income) | Rental and other property income, minus operating expenses, **before** debt service and taxes | Gross income − operating expenses | $400,000 (Year 1) |
| **Cap rate, going-in** | The unlevered yield an all-cash buyer earns on day one | NOI ÷ purchase price | 400,000 ÷ 5,000,000 = **8.0%** |
| **LTV** (Loan-to-Value) | How much of the purchase the lender is financing | Loan amount ÷ property value | 65% ($3,250,000 loan) |
| **LTC** (Loan-to-Cost) | Same idea, sized against total project cost instead of appraised value — the binding constraint on ground-up development and heavy value-add deals where cost and value diverge | Loan amount ÷ total cost | Not applicable to this stabilized acquisition; used instead of LTV whenever cost ≠ value |
| **DSCR** (Debt Service Coverage Ratio) | The cushion between income and the loan payment — lenders commonly require a **1.25x** floor | NOI ÷ annual debt service | Debt service ≈ $246,500/yr (6.5%, 30-yr amortization) → 400,000 ÷ 246,500 = **1.62x** |
| **Debt yield** | A financing-neutral sanity check lenders added after the 2008 crisis, because DSCR alone can look fine at a low interest rate even on a hopelessly over-levered loan | NOI ÷ loan amount | 400,000 ÷ 3,250,000 = **12.3%** |
| **Cash-on-cash return** | The cash yield an equity investor earns in a given year, after debt service | (NOI − debt service) ÷ equity invested | Equity invested ≈ $1,850,000 (price − loan + ~2% closing costs). (400,000 − 246,500) ÷ 1,850,000 = **8.3%** |
| **Escalations** | Contractual rent increases over the term, here a flat 2.5%/year bump — common in NNN leases | — | NOI grows from $400,000 (Yr1) to ≈$441,500 (Yr5) |
| **Cap rate, exit** | The cap rate the market is assumed to demand when the asset is *sold* — usually assumed **higher** than going-in as a conservatism convention, since cap rates can expand (values fall relative to NOI) over a hold period | Forward NOI ÷ sale price | Assume 8.5% exit cap rate on Year-6 forward NOI (~$452,500) → exit value ≈ **$5,324,000** |
| **Equity multiple** | Total cash returned, as a multiple of cash invested — the number most LPs (limited partners — passive investors in a syndication) actually feel | Total cash received ÷ total equity invested | ≈$3,046,000 total received ÷ $1,850,000 invested = **1.65x** |
| **IRR** (Internal Rate of Return) | The annualized, time-weighted return, accounting for *when* cash arrives, not just how much | The discount rate at which the sum of all cash flows (including the year-5 sale) nets to zero | ≈ **12%** over the 5-year hold |

Terms that describe *market* condition rather than one deal's arithmetic:

| Term | Definition |
|---|---|
| **Loss-to-lease** | The gap between a property's **in-place** (contract) rent and current **market** rent — e.g., if market is $12/sq ft and a tenant's actual lease is $11/sq ft, loss-to-lease is $1/sq ft of unrealized upside (Adventures in CRE, FNRP — see §11). Mostly discussed in multifamily and multi-tenant office/retail, where many leases roll at different times and market has moved since each was signed. |
| **TI allowance** (Tenant Improvement) | A per-square-foot dollar amount the landlord pays toward build-out of the tenant's space, usually reimbursed after the work is done and inspected |
| **LC** (Leasing Commission) | The fee paid to broker(s) for securing a lease — see §1.5 |
| **Free rent / abatement** | A period (often 1-2 months per year of lease term) where the tenant pays no rent, typically at lease start, used to win the deal without cutting the headline rent |
| **Effective rent vs. face rent** | **Face rent** is the quoted, headline rate. **Effective rent** nets out free rent, TI, and LC amortized over the term — the number that actually reflects landlord economics. Two leases with the same face rent can have very different effective rent once concessions are counted. |
| **Absorption** | The **net** change in occupied space in a market over a period (new leases signed minus space vacated) — e.g., the U.S. office market posted **5.6 million sq ft of positive net absorption** in a recent quarter, its fourth consecutive positive quarter, even while headline vacancy stayed high (NAIOP — see §11). |
| **Vacancy vs. availability** | **Vacancy rate** counts space that is physically empty *right now*. **Availability rate** also counts space that is occupied but already marketed for sublease or listed as coming available (a lease not yet expired but the tenant has announced it's leaving) — availability is always ≥ vacancy and is the better leading indicator (KLABIN, CBI Commercial — see §11). |

### 1.5 Commission structures and the "eat what you kill" comp model

| Transaction type | Typical fee | Basis | Split |
|---|---|---|---|
| **Leasing commission** | **3-6%** of total (aggregate) lease value on office/industrial; can run to 10% on small/short deals | Usually the **gross rent over the full lease term** (not effective rent), sometimes quoted as $/sq ft/year instead of a percentage | In the most common "full-service" structure, the **landlord pays the entire commission** to the listing (landlord/agency) broker, who splits it with the tenant's broker (tenant rep) — commonly close to 50/50, negotiated deal by deal since antitrust law bars any fixed standard rate (HAR.com, Core Commissions — see §11). |
| **Investment-sales commission** | Roughly 1-3% of sale price on institutional-quality assets, higher (3-6%+) on smaller deals | Gross sale price | Listing broker, sometimes split with a buyer's broker |
| **Mortgage brokerage fee** | Roughly 0.5-1.5% of loan amount [unverified — a general market range, not fetched this session] | Loan amount | Paid by the borrower, sometimes shared with the originating loan officer/broker's house |

**Broker/house split:** Whatever a broker collects, their own brokerage (the "house")
keeps a cut before the individual broker is paid — commonly 30-50% to the house for a
junior producer, shifting toward 80-90%+ to the broker as they build a book of business
and negotiate a better split.

**"Eat what you kill":** Commercial brokers are commission-only. Many shops offer a
**draw** — a advance, paid weekly or monthly, that the broker must pay back out of
future commissions before keeping anything extra ("a draw is nothing more than a loan"
— Voit Real Estate Services, see §11). A broker who closes nothing for months still owes
the draw; a broker who closes a large deal keeps everything above what they've drawn.
Leaving a brokerage before paying off a draw means paying the balance out of pocket. This
comp structure is the direct explanation for CRE broker behaviour discussed throughout
this chapter: relentless pipeline-building, reluctance to walk away from a marginal
deal, and extreme sensitivity to anything that delays a closing.

## 2. The lifecycle / process spine

CRE does not have one process — it has three, run by different people, producing
different documents, on different clocks. A single building can be moving through all
three at once (a tenant leasing space on one floor while the owner refinances the debt
and markets the building for sale).

### 2a. LEASING spine

| # | Stage | Trigger | Owner role | Typical duration | Artifact produced | What makes it stall |
|---|---|---|---|---|---|---|
| 1 | Space requirement | Tenant's lease is expiring, or the business is growing/shrinking | Tenant (occupier), often via a **tenant rep broker** | Weeks | A space program (sq ft, headcount, must-haves) | Internal indecision on headcount/hybrid policy |
| 2 | Tour | Rep broker shortlists buildings matching the program | Tenant rep broker + landlord rep broker | Days-weeks | Tour list, feedback notes | Landlord broker unresponsive; space not move-in ready |
| 3 | RFP (Request for Proposal) | Tenant narrows to a shortlist and wants competing terms in writing | Tenant rep broker | 1-2 weeks to draft, 2-4 weeks for landlords to respond | RFP document sent to 3-8 landlords (loio.com — see §11) | Landlords slow-walking to protect asking rent |
| 4 | Proposal rounds | Landlords respond, tenant rep negotiates 2-3 rounds to sharpen terms | Both reps | 2-6 weeks | Competing proposals (rent, TI, free rent, term) | Landlord unwilling to move off asking rent |
| 5 | LOI (Letter of Intent) | Tenant selects a finalist | Both reps, both principals sign | Days to negotiate | Signed, **non-binding** LOI covering business terms | Business terms agreed but LOI language ambiguous, causing lease-drafting fights later |
| 6 | Lease negotiation / redlining | LOI executed, attorneys draft the actual lease | Landlord counsel drafts; tenant counsel and tenant rep redline | 3-8 weeks | Fully negotiated, signed lease | Non-economic clauses (indemnity, assignment/sublease rights, default remedies, exclusivity) — often the slowest part, ironically, because the money terms were already fixed in the LOI |
| 7 | Abstraction | Lease is executed | Lease administrator / abstractor (see §3, §4) | Days-weeks per lease, backlog dependent | **Lease abstract** — a structured summary of 100+ fields (see §4, §5) | Backlog; poor-quality scans; amendments not yet incorporated |
| 8 | Commencement | Space is delivered / rent starts per lease terms | Property/lease admin team | — | Commencement letter confirming the actual start date | Landlord's delivery of space is late, shifting the whole date and requiring recalculation of every downstream milestone |
| 9 | Build-out | Tenant improvement construction | TI construction project manager | Weeks-months, scales with scope | Completed space, TI allowance draw requests | Change orders, permitting delays |
| 10 | Occupancy | Tenant moves in and pays full rent | Tenant | Ongoing | — | — |
| 11 | Renewal | Lease nears expiration (often flagged 12-18 months out) | Lease administrator flags it; tenant rep or landlord rep re-engages | Months | Renewal amendment, or the tenant leaves and stage 1 restarts elsewhere | Renewal option deadlines are **missed** because nobody was tracking them — one of the most common lease-administration failures cited in the CRE lease-admin literature (Occupier — see §11) |

### 2b. INVESTMENT SALES spine

| # | Stage | Trigger | Owner role | Typical duration | Artifact produced | What makes it stall |
|---|---|---|---|---|---|---|
| 1 | Pitch / BOV | Owner is considering a sale (or a broker is prospecting for a listing) | Investment sales broker, supported by an analyst | 1-2 weeks to prepare | **BOV** (Broker's Opinion of Value) — a broker-produced valuation using income, sales-comparison, and cost approaches, cheaper and faster than an appraisal (NAI Ohio Equities — see §11) | Owner unrealistic on price |
| 2 | Listing | Owner engages the broker | Investment sales broker | — | Listing agreement | — |
| 3 | OM production | Listing signed | Marketing/graphics specialist + analyst, directed by the broker | 1-3 weeks | The **Offering Memorandum** — see §5 | Financials incomplete; rent roll not yet audited |
| 4 | Marketing / call campaign | OM is ready | Broker + analyst, using the firm's buyer database and platforms (Crexi, CoStar) | Ongoing, 4-8+ weeks | Call list burned down, buyer NDAs signed | Off-market buyers slow to engage; broker's own pipeline capacity |
| 5 | Tours | Qualified, NDA'd buyers request access | Broker + analyst, coordinated with the tenant(s)/property manager | Days-weeks | Tour feedback | Occupied tenants restrict access windows |
| 6 | Call for offers | Marketing period closes | Broker | Set deadline date | Buyer offers/indications of interest, ranked | Buyers lowball to test seller's floor |
| 7 | LOI | Seller picks a leading bidder (or runs a "best and final") | Broker, both principals | Days | Signed, non-binding LOI | Seller keeps re-trading for a "better" bidder, burning goodwill |
| 8 | PSA (Purchase and Sale Agreement) | LOI signed, attorneys draft | Buyer/seller counsel | 1-3 weeks to negotiate | Signed, binding PSA with an **earnest money** deposit and a defined due-diligence period (Westwood Net Lease — see §11) | Representations & warranties, indemnity caps |
| 9 | Due diligence | PSA executed | Buyer's acquisitions analyst + third-party consultants (see §5) | **30-60 days** is typical (Ryan O'Connell Finance — see §11) | Due diligence deliverables — see §5 | A single environmental or title issue can blow the whole timeline |
| 10 | Closing | Due diligence clears, financing (if any) is in place | Transaction manager, both counsel, title/escrow | Days | Recorded deed, wired funds | Buyer's lender isn't ready; last-minute title objection |

Overall: **6-12 months** listing-to-close on an institutional-quality asset, with the
marketing period alone often running 3-6 months (multiple sourcing convergent on this
range — see §11).

### 2c. DEBT / CAPITAL MARKETS spine

| # | Stage | Trigger | Owner role | Typical duration | Artifact produced | What makes it stall |
|---|---|---|---|---|---|---|
| 1 | Sizing | Borrower needs acquisition, refinance, or construction debt | Capital markets broker or in-house analyst | Days | An internal underwriting model computing the loan **ceiling** off LTV, DSCR, and debt yield simultaneously — whichever binds first (Wall Street Prep — see §11) | Property cash flow doesn't support the debt the borrower wants |
| 2 | Lender outreach | Sizing is done | Debt/capital markets broker | 1-3 weeks | A lender list contacted in parallel | Market-wide spread widening mid-process |
| 3 | Term sheet | Lender(s) indicate interest | Lender's originator | Days-weeks | Non-binding **term sheet** — rate, term, amortization, key conditions | Borrower shops the term sheet, souring lender relationships |
| 4 | Underwriting | Term sheet accepted, lender commits internal resources | Underwriter / credit analyst | 3-6 weeks | Full credit memo assessing property, market, **and sponsor** (the borrower) | Sponsor financial statements incomplete; appraisal comes in low |
| 5 | Third-party reports | Underwriting begins in earnest | Ordered by lender, performed by external vendors | 2-4 weeks each, often run in parallel | Appraisal, Phase I ESA, Property Condition Assessment, title search, survey (Wall Street Prep, PropertyMetrics — see §11) | Phase I flags a recognized environmental condition, triggering a Phase II |
| 6 | Loan documents | Reports clear, credit committee approves | Lender's counsel drafts | 2-4 weeks | Loan agreement, note, mortgage/deed of trust, guaranty | Negotiating covenants, recourse carve-outs |
| 7 | Closing | Docs finalized | Closer/funder, title company | Days | Funded loan, recorded mortgage | Payoff of existing debt doesn't match estimate; last documents missing |

Every one of these three spines produces its own paper trail, and — critically for
anyone thinking about automation — **the same fact (a tenant's rent, a property's NOI,
a loan's maturity date) gets re-entered independently into each spine's own documents
and systems**, because the people running the leasing spine, the sales spine, and the
debt spine are usually different firms with no shared system.

## 3. Role inventory

Junior to senior, client-facing and back-office. Comp figures are averages/medians from
the sources in §11 and vary enormously by market (New York and Mumbai are not the same
number) and by firm tier (CBRE/JLL/Cushman & Wakefield vs. a regional shop) — treat every
number as directional, not a quote.

| Role | Also called | Seniority | Licence/cert required | Typical comp (US / India where known) | Headcount ratio | What they own |
|---|---|---|---|---|---|---|
| Brokerage analyst | Research/financial analyst | Entry (0-2 yrs) | None to start; many pursue a state salesperson licence | US: ~$115,600/yr average base (Glassdoor — see §11); India: no reliable public figure found | Several analysts per producing broker/team | Comps, financial models, OM drafts, market research |
| Senior analyst | — | 2-4 yrs | Often licensed | US median $86,200-$134,100 across analyst/associate band [unverified — range, adventuresincre.com] | — | Same as above, less-supervised |
| Associate | — | 3-6 yrs | Licensed broker/salesperson | US: ~$91,000/yr average (Glassdoor — see §11) | — | Runs deals semi-independently under a producer |
| VP / Producer | Senior broker, "Vice President" title is common but not managerial | 5-15 yrs | Licensed broker | US: commission-driven; brokers overall average ~$245,900/yr, top producers to $450,000+ (Glassdoor — see §11) | 1 team per book of business | Client relationships, deal execution, quota |
| Managing Director / Principal | Market leader, office head | 15+ yrs | Licensed broker | No reliable public figure found (heavily variable, largely carry/equity-based at the top) | 1 per office/market | P&L for a market or product line, recruiting producers |
| Tenant rep broker | Tenant representative | Any seniority | Licensed broker | Commission-only — see §1.5 | — | Represents the occupier's interest through the leasing spine (§2a) |
| Agency / landlord leasing broker | Landlord rep | Any seniority | Licensed broker | Commission-only | — | Represents the building owner in leasing (§2a) |
| Investment sales broker | — | Any seniority | Licensed broker | Commission-only — see §1.5 | — | Runs the investment-sales spine (§2b) |
| Debt & structured finance broker | Capital markets broker, mortgage broker | Any seniority | Licensed broker/agent, some states require a mortgage-broker licence | Commission (~0.5-1.5%) [unverified] | — | Runs the debt spine (§2c) |
| Research analyst (in-house or at a data vendor) | Market research analyst | Entry-mid | None | No reliable public figure found | 1 per office or market | Market reports, quarterly stats, supports pitches |
| Marketing / graphics specialist | OM designer, marketing coordinator | Entry-mid | None | No reliable public figure found | 1 per several producers | Produces the Offering Memorandum, pitch decks, listing flyers — a genuine, full-time production job (see §4, §5) |
| Financial modeller / underwriter | — | Mid | None formally; CFA/MBA common at the top end | Overlaps acquisitions analyst comp below | — | Builds the Excel/Argus cash flow model a deal is bought or financed on |
| Transaction manager | Deal manager, closing coordinator | Mid | None | No reliable public figure found | 1 per several concurrent deals | Tracks every open item to closing across all three spines |
| Lease administrator | — | Entry-mid | None | US ~$50,000-$70,000/yr band typical of the profession [unverified] | 1 per hundreds-to-thousands of leases, portfolio-dependent | Maintains the lease database: critical dates, renewal options, rent steps, CAM billing inputs |
| Lease abstractor | Abstractor, often offshore | Entry | None | US "Lease Abstractor and Auditor": ~$72,500/yr average (Glassdoor — see §11); India-based roles pay substantially less [unverified for exact figure] | Often a many-to-one offshore team per US portfolio (see §4, §8) | Reads each lease/amendment and extracts 100-200+ structured fields (see §4, §5) |
| Argus modeller | Valuation analyst | Entry-mid | Argus Enterprise proficiency (a paid, trained skill — see §6) | Overlaps financial modeller comp | — | Builds the discounted cash flow valuation in Argus Enterprise for acquisitions, dispositions, and appraisal review |
| Asset manager | — | Mid-senior | None formally | No reliable public figure found | 1 per several-to-dozens of assets depending on complexity | Owns a property's business plan post-acquisition: leasing strategy, capex, budget vs. actual |
| Portfolio manager | Fund-level asset manager | Senior | Often CFA/MBA | No reliable public figure found | 1 per fund or strategy | Aggregates asset-level performance into fund-level returns and investor reporting |
| Acquisitions analyst | — | Entry-mid | None formally | Junior acquisitions roles average bonuses around 22% of base; senior acquisitions bonuses run up to 119% of base (adventuresincre.com — see §11) | Several per acquisitions VP | Underwrites prospective purchases (§4) |
| Dispositions manager | — | Mid-senior | Often a licensed broker | No reliable public figure found | — | Runs the sale process for assets the fund decides to exit |
| Capital markets analyst | — | Entry-mid | None formally | No reliable public figure found | — | Supports debt sizing, lender outreach, and closing on the debt spine |
| Credit analyst | Underwriter (lender-side) | Entry-mid | None formally; often DE-adjacent training | No reliable public figure found | — | Assesses borrower and property credit risk before loan committee |
| CMBS servicer / asset manager | Master servicer analyst | Mid | None formally | No reliable public figure found | 1 per large pool of securitized loans | Monitors performing CMBS loans, processes borrower requests, produces CREFC investor reports (see §4, §5) |
| Special servicer | Workout officer | Senior | None formally; often legal/workout background | No reliable public figure found | 1 per book of distressed/watchlisted loans | Takes over loans in or near default; negotiates modifications, forbearances, foreclosures |
| Property accountant | — | Entry-mid | Often accounting degree; CPA valued not required | No reliable public figure found | 1 per several-to-dozens of properties | Books rent, runs AP/AR, feeds CAM reconciliation and owner reporting |
| CAM reconciliation analyst | CAM analyst | Entry-mid | None formally | No reliable public figure found | Seasonal spike role — often the same property accountants working overtime | Owns the annual CAM reconciliation grind (§1.3, §4) |
| TI construction project manager | Tenant coordinator | Mid | None formally; construction background common | No reliable public figure found | — | Manages tenant build-out from lease signing to occupancy |
| ESG analyst | Sustainability analyst | Entry-mid | None formally; GRESB/LEED familiarity valued | No reliable public figure found | Growing but still small headcount per firm | Energy/emissions reporting, green-lease compliance, investor ESG disclosures |
| Occupancy planner | Space planner | Mid | None formally | No reliable public figure found | Usually corporate-real-estate (occupier) side, not brokerage | Plans a corporate tenant's own space allocation and headcount fit |
| Broker's assistant | Marketing/listing coordinator | Entry | None | No reliable public figure found | 1 per producer or small team | Listing upkeep, CRM hygiene, scheduling, deal paperwork |
| Data/research operations (CoStar-type) | Research consultant, research analyst | Entry-mid | None | No reliable public figure found for base pay; role is call-volume-driven (see §6, §8) | Large — thousands of analysts across CoStar's operation [unverified — headcount not directly fetched this session] | Makes recurring phone calls to brokers/owners to verify and update listing and transaction data (see §6, §8) |

## 4. Day in the life

The six roles below are picked for headcount and drudgery density, not glamour. Hours
data throughout is drawn from Wall Street Oasis forum discussion of CRE analyst
schedules (see §11) — treat it as practitioner self-report, not a payroll audit.

### First-year brokerage analyst — day in the life

- **Who they are:** a recent finance/real estate/economics graduate hired into a
  brokerage's analyst program (CBRE, JLL, Cushman & Wakefield, Marcus & Millichap, or a
  regional shop). Not usually licensed yet in a way that lets them earn commission
  directly. Measured on model accuracy, OM (Offering Memorandum — see §5) turnaround
  speed, and, informally, whether producers keep asking for them by name.
- **Their stack:** Excel (the real workhorse), Argus Enterprise for income-property
  valuation, CoStar Suite for comps and market data, PowerPoint or Adobe InDesign for OM
  layout, a CRM (often Salesforce or a brokerage-proprietary system), Outlook.
- **A typical day:** In between 8:00 and 9:00am, then out between 6:00 and 7:00pm on a
  normal day, averaging **around 50 hours/week**, with light weeks at 40-45 and deal
  crunches reaching **60-70** (Wall Street Oasis — see §11). A representative day: pull
  and reformat rent and sale comps from CoStar for a BOV (Broker's Opinion of Value)
  due that week; re-key a client's rent roll out of a PDF or the property manager's own
  export into the Argus/Excel model, tenant by tenant — suite, square footage, rent,
  escalation schedule, expiration, renewal options; get pulled into a room mid-afternoon
  because a producer's call with the client changed an assumption, and rebuild the
  model on the spot, saving it under the team's actual naming convention (something like
  `Model_v14_FINAL_v2.xlsx` — there is no real version control, only filenames); spend
  the late afternoon feeding updated tables and photos to the marketing/graphics
  specialist for the OM; answer email until whatever's due tomorrow is done. Two to four
  conference calls a day is typical (Wall Street Oasis — see §11).
- **Their week/month:** Friday pipeline review with producers on active listings and
  tenant searches; month-end reconciliation of the team's comp notes against actually
  closed deals; quarterly, feeding data into the firm's own published market report.
- **What they complain about:** Wall Street Oasis threads on CRE analyst hours describe
  50-hour weeks as the norm with real spikes around deal deadlines, and repeatedly flag
  Argus and Excel modeling volume as the core skill and the core grind (Wall Street
  Oasis — see §11; characterized from forum discussion, not quoted verbatim — direct
  page fetch returned HTTP 403 this session).
- **Repetitive-work inventory:**

| Task | Frequency | Minutes each | Why it's still manual | Data in → data out |
|---|---|---|---|---|
| Re-keying a rent roll from a PDF/PM export into Argus/Excel | Per listing or pitch | 60-180 | No standard rent-roll export format across property-management systems | PDF/Excel rent roll → Argus model |
| Pulling and reformatting comps from CoStar/Crexi | Several times/week | 30-90 | Export formats are inconsistent; addresses and property names need manual de-duplication | CoStar/Crexi export → Excel comp set |
| Rebuilding the model after an assumption changes on a call | Multiple times per deal | 30-120 | No single source of truth — the new assumption exists only as something a broker said on a call | Verbal instruction → new spreadsheet version, new filename |
| Assembling OM content (property description, market overview, financial summary) | Per listing | Several hours across days | OM-production software (see §6) is not universal; much is still built by hand in PowerPoint/InDesign | Model outputs + boilerplate → OM draft |
| Updating the CRM after every call | Daily, many entries | 5-10 | CRM is rarely integrated with the modeling/comp tools | Call notes → CRM record |

### Tenant-rep broker — day in the life

- **Who they are:** a broker of any seniority representing occupiers (tenants), from a
  cold-calling first-year building a book to a veteran living off referrals and
  renewals. Paid entirely on commission (§1.5) — measured on deals closed, not hours
  worked.
- **Their stack:** CoStar/LoopNet/Crexi for space search and lease-expiration flags, a
  CRM, phone and email as the actual coordination layer, DocuSign for signatures.
- **A typical day:** morning prospecting calls to companies whose leases are
  approaching expiration (sourced from CoStar data, referrals, and public filings);
  midday touring buildings with an active client alongside a landlord's leasing broker;
  afternoon spent drafting or redlining RFPs and LOIs and chasing landlord reps for
  proposal responses; evenings are relationship maintenance — the referral pipeline that
  eventually replaces cold-calling. Long stretches with no closing, then a burst of
  paperwork and follow-up right before one, because that is the only point money moves.
- **Their week/month:** no single closing rhythm — a tenant-rep's month is whatever
  stage its 3-8 live deals happen to be in simultaneously, from first tour to final
  lease redline.
- **What they complain about:** unpaid or disputed commissions are common enough that a
  cottage legal practice exists specifically to help commercial brokers recover them
  (Business Trial Group — see §11); the draw-against-commission model (§1.5) is
  described in industry commentary as functionally "a loan" against future earnings
  that must be paid back before the broker sees new money (Voit Real Estate Services —
  see §11), which is the direct source of the relentless-prospecting behaviour typical
  of the role.
- **Repetitive-work inventory:**

| Task | Frequency | Minutes each | Why it's still manual | Data in → data out |
|---|---|---|---|---|
| Cold-call/prospect for tenants nearing lease expiration | Daily, dozens of calls | 3-10 | No universal "who's in market" database — pieced together from CoStar flags, referrals, filings | Lease-expiration data/referral → call log/CRM entry |
| Coordinating tours (calling landlord reps, confirming access) | Per prospective deal | 15-30 | No shared scheduling system between competing brokerages | Phone/email back-and-forth → confirmed tour |
| Drafting/redlining RFPs and LOIs | Per deal, several rounds | Hours per round | Every deal's terms are bespoke; no market-wide standard template | Client requirements + negotiation → Word redline |
| Chasing signed documents | Per deal | Repeated follow-ups over days | Multiple counterparties, each on its own timeline, no shared tracker | Draft document → fully executed document |
| Commission invoice follow-up | Per closed deal, sometimes disputed | Hours to days | No automatic trigger links lease signature to commission payment | Signed lease → paid invoice |

### Lease administrator / abstractor — day in the life

- **Who they are:** an early-career hire at a large occupier or landlord, staff at a
  dedicated lease-administration outsourcing firm, or — very commonly — part of an
  offshore team in India, where postings typically ask for around 2 years of experience,
  any bachelor's or master's degree, and strong written English (Glassdoor India
  listings — see §11).
- **Their stack:** MRI or Yardi if the firm has lease-administration modules; a
  dedicated abstraction platform (MRI Contract Intelligence/Leverton, Prophia, Occupier,
  LeaseAccelerator) at more sophisticated shops; otherwise Word/Excel templates, Adobe
  Acrobat, and a document-management system.
- **A typical day:** reading one commercial lease — often 50-150 pages once every
  amendment is stacked on top of the original — start to finish, and extracting it into
  a structured abstract of roughly **100 to 200+ discrete fields** depending on the
  template: commencement and expiration dates, every renewal option and its notice
  deadline, base rent and the full escalation schedule, TI allowance, permitted use,
  exclusivity and co-tenancy clauses, assignment/sublease rights, insurance
  requirements, and estoppel/SNDA obligations (GrowthFactor, Kolena — see §11). Manual
  abstraction of one lease runs **roughly 4-8 hours** (rea.co — see §11); firms that
  outsource it pay **$150-600 per lease** with a **2-4 week turnaround** (rea.co,
  DDee.ai — see §11). An abstractor's day is several of these, plus re-abstracting
  whenever a client sends a newly signed amendment.
- **Their week/month:** portfolios get re-touched on a cycle tied to renewal-option
  deadlines, which lease-admin teams try to flag 12-18 months out — the single most
  cited failure mode in this profession's own trade literature is **missing a renewal
  or termination notice deadline buried on some page of a long lease** (Occupier —
  see §11).
- **What they complain about:** no first-person forum quote could be retrieved this
  session (WallStreetOasis and Reddit fetches returned HTTP 403 / were blocked) — flagged
  as **unverified** rather than invented. Indirect evidence of how error-prone and
  tedious the job is: essentially every AI lease-abstraction vendor markets itself
  primarily on *accuracy* and *speed versus a human* (see §8), which is an implicit
  industry admission of the baseline experience.
- **Repetitive-work inventory:**

| Task | Frequency | Minutes each | Why it's still manual | Data in → data out |
|---|---|---|---|---|
| Reading and abstracting a new lease | Per new lease | 240-480 (4-8 hrs) | Every lease is bespoke prose from a different law firm; no shared clause structure | Signed lease PDF → structured abstract (100-200+ fields) |
| Re-abstracting after an amendment | Per amendment | 60-180 | Amendment must be reconciled against the original abstract field by field | Amendment PDF → updated abstract |
| Tracking critical dates across the portfolio | Ongoing, hundreds of leases | Minutes per date, constant vigilance | Dates live inside abstracts/lease software, not a portfolio-wide alerting system at every firm | Abstract data → tickler/calendar reminder |
| Quality-control review of an abstract | Per lease, often sampled | 30-60 | A second human re-reads to catch mis-keyed fields — abstraction is judged too error-prone to trust unreviewed | Abstract v1 → reviewed abstract v2 |

### CAM reconciliation analyst at year-end — day in the life

- **Who they are:** frequently a property accountant wearing this hat seasonally, or a
  dedicated CAM analyst at a larger landlord/management company. Measured on
  reconciliations completed accurately and on time against each lease's own deadline,
  and on disputes avoided.
- **Their stack:** Yardi or MRI as the property accounting system of record, Excel as
  the actual reconciliation workhorse, scanned vendor invoices (PDF or paper), and the
  lease abstract for each tenant's specific exclusions and caps.
- **A typical day (the Q1 crunch):** pull the full prior year's actual expense ledger
  out of Yardi/MRI; sort every vendor invoice for the year into CAM-eligible versus
  excluded buckets, per **each individual tenant's negotiated exclusions** (a tenant may
  have capped its own CAM increase at a fixed percentage, or carved out capital
  expenditures, or excluded roof and structure); run the **gross-up calculation**
  (adjusting variable costs as if the building were fully occupied, so tenants in a
  partly vacant building aren't overcharged); allocate the resulting pool pro-rata by
  each tenant's share of rentable square footage; compare to what that tenant already
  paid in monthly estimates; and produce a **CAM reconciliation statement** per tenant.
  Multiply this by every property in the portfolio and every tenant in every property,
  once a year, in a compressed post-year-end window. Multiple independent vendor
  sources (property-management software vendors and CAM-specific consultancies)
  describe this as one of the most frequently botched, most time-consuming recurring
  tasks in commercial property accounting (LoopNet, Occupier, Tango Analytics —
  see §11).
- **Their week/month:** the whole role is essentially built around this one annual
  deadline; the rest of the year is invoice coding and estimate-vs-actual tracking that
  feeds the eventual reconciliation.
- **What they complain about:** no first-person practitioner quote could be retrieved
  this session — flagged as **unverified**. What is documented: **landlords can lose
  the legal right to collect a CAM shortfall entirely if they miss a lease's own
  reconciliation deadline** (Lavelle Law — see §11), which converts a slow spreadsheet
  process directly into lost revenue, and the sheer number of vendors selling "CAM
  reconciliation made easy" guides and software (Stratafolio, Yardi Breeze, Tango,
  Occupier, all cited in §11) is itself indirect evidence of how widely this is felt as
  painful.
- **Repetitive-work inventory:**

| Task | Frequency | Minutes each | Why it's still manual | Data in → data out |
|---|---|---|---|---|
| Coding vendor invoices to CAM-eligible categories | All year, reviewed at reconciliation | 5-15/invoice, hundreds/property/year | Invoices arrive in varied formats from many vendors; no standard chart of accounts industry-wide | Vendor invoice (PDF/paper) → coded ledger entry |
| Checking each tenant's lease for CAM exclusions/caps | Per tenant, per reconciliation | 15-30/tenant | Exclusions are bespoke language, only reliable if the lease abstract is accurate and current | Lease abstract → allocation rule |
| Gross-up calculation for partial occupancy | Per property with vacancy | 30-60 | Formula must be applied per lease language and re-derived if occupancy changed mid-year | Occupancy data + variable expenses → adjusted expense pool |
| Producing the CAM reconciliation statement | Per tenant, annually | 20-40 | A legal notice tied to lease-specific deadlines; no universal e-delivery/e-dispute standard | Allocation calculations → tenant-facing statement |
| Responding to tenant/lease-auditor disputes | Per dispute | Hours to weeks | Disputing tenants (or their hired lease-audit firms) independently re-derive the numbers | Dispute letter → re-checked supporting documentation |

### Acquisitions analyst underwriting deals — day in the life

- **Who they are:** junior-to-mid analyst on a fund's, REIT's, or private buyer's
  acquisitions team. Bonus is heavily volume-tied: junior acquisitions roles average
  bonuses around **22% of base**, senior acquisitions roles up to **119% of base**
  (adventuresincre.com — see §11).
- **Their stack:** a proprietary Excel underwriting template, Argus Enterprise for
  anything beyond the simplest deal, CoStar for comps, a deal-specific data room the
  seller's broker sets up, DocuSign.
- **A typical day:** an OM lands in the inbox from a broker; first pass is a quick
  screen (rough cap rate, rough returns) to decide whether to pursue it at all. If yes:
  re-key the rent roll and T-12 (trailing-twelve-month operating statement — see §5) out
  of the broker's OM — frequently an image-quality PDF export, not clean data — into the
  firm's own model; independently rebuild the numbers from the T-12 rather than trust
  the broker's pro forma (its forward-looking, deliberately optimistic projection, which
  analysts are trained to distrust); run sensitivity tables (exit cap rate ±25 basis
  points, rent-growth scenarios); produce an investment-committee memo. Under a
  competitive bid deadline this whole cycle repeats within days — sometimes nights — as
  the price gets bid up and the model has to be re-run at each new basis. Hours mirror
  the debt/capital-markets side of the business: **consistent 8-10pm finishes several
  nights a week** in busy stretches, averaging **around 60 hours/week** (Wall Street
  Oasis — see §11).
- **Their week/month:** investment committee meets on a fixed cycle (often weekly) to
  review live pursuits; month-end is spent updating the pipeline and closed-deal
  tracker for the fund's own reporting.
- **What they complain about:** the recurring frustration documented in CRE
  underwriting guides themselves is reconciling a broker's numbers that don't tie to
  the actual trailing financials, and effectively rebuilding trust in someone else's
  model from scratch on every single deal (PropertyMetrics, Adventures in CRE —
  see §11).
- **Repetitive-work inventory:**

| Task | Frequency | Minutes each | Why it's still manual | Data in → data out |
|---|---|---|---|---|
| Re-keying rent roll/T-12 from broker OM into firm's model | Per deal pursued | 60-240 | Every seller/broker uses its own format; no machine-readable rent-roll/T-12 exchange standard | OM/broker file → firm's Excel/Argus model |
| Reconciling broker pro forma to actual trailing financials | Per deal | 60-120 | Broker projections are marketing documents, not audited | Pro forma + T-12 → variance analysis |
| Running sensitivity/scenario tables | Per deal, repeated each bid round | 20-60 per re-run | Bid terms change multiple times before an LOI; each change cascades through the whole model | Updated assumption → re-run model output |
| Building the investment-committee memo | Per deal that advances | 120-240 | Narrative and exhibits assembled by hand from the model and market research | Model output + market data → IC memo |
| Comp pulls for market rent/sale assumptions | Per deal | 30-60 | Same CoStar/Crexi export-cleanup problem as the brokerage analyst above | CoStar/Crexi export → comp set feeding the model |

### CMBS loan asset manager (covenant/borrower reporting) — day in the life

- **Who they are:** works at a **master servicer** (the entity administering
  performing CMBS — Commercial Mortgage-Backed Securities — loans on behalf of
  bondholders) or, once a loan is transferred over, at a **special servicer** (which
  takes over loans in or near default). Measured on timely, accurate CREFC (Commercial
  Real Estate Finance Council — the trade body that defines CMBS reporting standards)
  reporting and, for special servicers, resolution outcomes.
- **Their stack:** a servicing platform, Excel, the CREFC Investor Reporting Package
  (IRP) template set, borrower-submitted financials (routinely PDF, Excel, or paper),
  and a loan-file document-management system.
- **A typical day/month:** collect annual operating statements, rent rolls, and
  covenant certifications from every borrower across the servicing book; re-key those
  numbers into the CREFC-standard fields; test each loan against its covenant
  thresholds (DSCR floors, etc.) to decide whether it belongs on the **Servicer Watch
  List** (loans showing early trouble signs); assemble and submit the full monthly
  investor reporting package to the trustee/certificate administrator on a fixed cycle
  tied to bond payment dates. The CREFC IRP itself — the most rigorously standardized
  document set in this entire chapter, defined in CMBS pooling-and-servicing-agreement
  exhibits filed with the SEC (see §11) — comprises **8 electronic data files** (Loan
  Setup, Loan Periodic Update, Property, Bond Level, Collateral Summary, Financial,
  Special Servicer Loan, Schedule AL), **11 surveillance reports** (Servicer Watch
  List, Delinquent Loan Status, REO Status, Comparative Financial Status, Operating
  Statement Analysis, and others), and **9 further templates** (Appraisal Reduction,
  Servicer Realized Loss, Loan Modification, and others) — all of it produced **per
  loan, every reporting cycle**, across a book that can run into the hundreds of
  loans. A special servicer's day looks different once a loan actually transfers:
  direct borrower workout negotiations, ordering updated appraisals, and deciding
  between forbearance, modification, and foreclosure.
- **Their week/month:** the monthly remittance cycle is the heartbeat of the job —
  everything above has to tie out before the package goes to the trustee.
- **What they complain about:** no first-person forum quote could be retrieved this
  session — flagged as **unverified**. The evidence is structural: a reporting regime
  this standardized *on paper* (8 files + 11 reports + 9 templates, defined once by
  CREFC) and still this manually populated implies the standardization lives in the
  template, not in an automated pipeline from borrower financials to trustee filing.
- **Repetitive-work inventory:**

| Task | Frequency | Minutes each | Why it's still manual | Data in → data out |
|---|---|---|---|---|
| Re-keying borrower financials into the servicing system | Monthly/quarterly/annually per loan | 20-60/loan | Borrowers submit in whatever format their own accountant uses; no mandated machine-readable submission | Borrower financials (PDF/Excel/paper) → servicing system fields |
| Populating the CREFC Operating Statement Analysis Report | Per loan, per cycle | 15-30 | Requires mapping the borrower's chart of accounts to CREFC's standard categories | Borrower financials → CREFC OSAR |
| Covenant/DSCR testing and Watch List flagging | Per loan, per cycle | 10-20 | Requires judgment plus a fresh calculation every cycle | Updated financials → watch-list determination |
| Assembling the monthly investor reporting package | Monthly, portfolio-wide | Hours, aggregated across all loans | 8 files + 11 reports + 9 templates must all tie out to each other before submission | Per-loan data → full CREFC IRP submission |
| Borrower correspondence (covenant waivers, consents, payoffs) | Ongoing | 15-45/item | Each request is bespoke, requiring individual review against that loan's own documents | Borrower request letter → reviewed response/consent |

## 5. The document & data layer

<!-- TODO: LOI, lease + amendments, estoppel certificate, SNDA, rent roll, T-12
     operating statements, OM, BOV, PSA, ALTA survey, Phase I ESA, PCA, Argus
     file, loan term sheet, CMBS servicer reports, CREFC Investor Reporting
     Package, tenant financials, CAM reconciliation statement, annual budget
     package. Format + standardised vs bespoke per doc. -->

## 6. Systems of record

<!-- TODO: CoStar (+ CoStar v. CREXi litigation), Crexi, LoopNet, Reonomy,
     Moody's/REIS, Altus Argus Enterprise (lock-in), Yardi, MRI, VTS, Dealpath,
     Juniper Square, Agora, Cherre, Northspyre, Buildout, Apto, Placer.ai,
     CompStak crowdsourced comps, and Excel as the actual system of record. -->

## 7. Rules, regulators, and hard constraints

<!-- TODO: brokerage licensing per state, fiduciary duty/dual agency, securities
     law when syndicating (Reg D 506(b)/(c), accredited investor rules), NO MLS
     IN CRE (data proprietary — the defining structural fact), confidentiality/
     NDA norms around comps, ADA/building codes, zoning, lease accounting ASC 842
     / IFRS 16 and the software category it created. -->

## 8. What has already been tried

<!-- TODO: WeWork collapse and what it proved about flex space, VTS Data,
     lease-abstraction AI vendors (Leverton/MRI, Prophia, Occupier,
     LeaseAccelerator, Kira/Litera), CompStak's crowdsourced model, CoStar's
     moat vs CREXi's challenge, absence of iBuying in CRE and why, honest
     read on which AI tools CRE firms actually pay for today. -->

## 9. Where the human genuinely adds value

<!-- TODO -->

## 10. Glossary

<!-- TODO -->

## 11. Sources

<!-- TODO: minimum 12 real fetched sources -->
