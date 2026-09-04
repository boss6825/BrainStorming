# 00 · Orientation — the whole industry in one chapter

> You know nothing about real estate. This chapter gets you to the point where the rest
> of the guide is readable. It is the mental model, the cast of characters, the money,
> and the vocabulary. Read it once, then use it as a lookup table while you read the
> vertical chapters.

## Contents

- [1. The one-sentence model](#1-the-one-sentence-model)
- [2. Four things a human can do with a property](#2-four-things-a-human-can-do-with-a-property)
- [3. The asset classes](#3-the-asset-classes)
- [4. Follow the money: how every role gets paid](#4-follow-the-money-how-every-role-gets-paid)
- [5. The cast: everyone who touches one house sale](#5-the-cast-everyone-who-touches-one-house-sale)
- [6. The four clocks](#6-the-four-clocks)
- [7. Vocabulary you cannot read the guide without](#7-vocabulary-you-cannot-read-the-guide-without)
- [8. The arithmetic: three formulas that run the industry](#8-the-arithmetic-three-formulas-that-run-the-industry)
- [9. Seven structural facts that determine what software can exist](#9-seven-structural-facts-that-determine-what-software-can-exist)
- [10. Why real estate is still so manual](#10-why-real-estate-is-still-so-manual)
- [11. A taxonomy of the repetitive work](#11-a-taxonomy-of-the-repetitive-work)
- [12. India vs US: the differences that matter most](#12-india-vs-us-the-differences-that-matter-most)
- [13. How to read the rest of this guide](#13-how-to-read-the-rest-of-this-guide)

---

## 1. The one-sentence model

Real estate is **land, plus whatever is attached to it, plus the bundle of legal rights
to use it** — and essentially every job in the industry exists because one of those
three things is expensive, illiquid, locally regulated, or hard to verify.

Unpack that, because each clause spawns an industry:

| Clause | Consequence | Industry it creates |
|---|---|---|
| **Land** | Fixed in place, cannot be manufactured, value set by location and permission-to-build | Land brokerage, zoning/entitlement, planning, appraisal |
| **Plus improvements** | Buildings must be designed, built, maintained, and eventually replaced | Development, construction, facilities management, trades |
| **Bundle of rights** | Ownership is a legal abstraction, not a physical fact — it must be proven | Title, conveyancing, land records, registration, litigation |
| **Expensive** | Almost nobody pays cash — the transaction is really a *financing* transaction | Mortgage, banking, secondary markets, insurance |
| **Illiquid** | No exchange, no continuous price, every unit unique | Brokerage, valuation, marketplaces, comps data |
| **Locally regulated** | Rules differ per country, state, city, and sometimes per block | Compliance, licensing, permits, legal, govtech |
| **Hard to verify** | Condition, ownership, and income are all opaque to a buyer | Inspection, appraisal, title insurance, screening, due diligence |

Nearly every role you will meet in this guide is a person **manually resolving one of
those seven frictions**, usually by moving information between parties who do not share
a system. That sentence is the whole thesis of the guide. Hold onto it.

## 2. Four things a human can do with a property

Every job in real estate sits under one of four verbs. This is the cleanest way to
navigate the industry, and it maps directly onto the chapters.

| Verb | What it means | Who does it | Chapters |
|---|---|---|---|
| **BUILD** | Turn land or an old building into a new one | Developers, architects, engineers, contractors, municipalities | 07 |
| **TRANSACT** | Move ownership from one party to another | Brokers/agents, lenders, appraisers, title/escrow, lawyers | 01, 03, 04, 05 |
| **OPERATE** | Run the building day to day and collect income from it | Property managers, leasing, maintenance, facilities, accounting | 02, 09 |
| **OWN / INVEST** | Hold it as a financial asset and manage the capital | REITs, funds, asset managers, fund accountants, investors | 06, 08 |

A single property passes through all four verbs repeatedly over its ~50-100 year life:
built once, transacted every 7-12 years, operated continuously, and owned by a chain of
different capital structures.

**The important structural point for you:** each verb has its own workforce, its own
software, its own regulators, and its own vocabulary — and they barely talk to each
other. The handoffs between verbs are where the worst manual work lives. A developer
finishes a building and hands a pile of PDFs to a property manager, who re-keys them.
A seller's agent hands a contract to a lender and a title company, who each re-key it.
**Look for use cases at the seams, not in the middle of a verb.**

## 3. The asset classes

"Real estate" is not one market. These behave so differently that expertise in one is
nearly useless in another.

| Class | What it is | Income model | Who owns it | Chapter |
|---|---|---|---|---|
| **Single-family residential** | Houses people own to live in | None (owner-occupied) or rent | Households; increasingly institutions | 01, 02 |
| **Multifamily** | Apartment buildings | Monthly rent, ~12-month leases | REITs, PE funds, private landlords | 02 |
| **Office** | Workplaces | 5-10 year leases | Institutions; badly distressed post-2020 | 06, 09 |
| **Retail** | Shops, malls, strip centres | Base rent + percentage of sales | REITs, private | 06 |
| **Industrial / logistics** | Warehouses, distribution, cold storage | 3-10 year leases | REITs, funds — the strongest sector of the 2020s | 06, 10 |
| **Data centres** | Powered buildings full of servers | Power-based long leases | Hyperscalers, specialist REITs, infra funds | 10 |
| **Hospitality** | Hotels | Nightly — closest thing to an operating business | Owner/brand/manager split three ways | 10 |
| **Senior housing & care** | Assisted living, memory care, skilled nursing | Monthly fee + care revenue; heavy regulation | Operator/owner split | 10 |
| **Student housing** | Purpose-built beds near universities | By-the-bed annual leases, 100% annual turnover | REITs, specialists | 10 |
| **Self-storage** | Storage units | Monthly, near-zero staffing | REITs, private | 10 |
| **Manufactured housing** | Mobile home parks — own the land, rent the lot | Lot rent | Increasingly institutional | 10 |
| **Land & agricultural** | Undeveloped, farm, timber | Crop share, cash rent, or none | Families, funds | 10 |
| **Short-term rental** | Airbnb-style | Nightly, operationally intense | Individuals and operators | 10 |

**Rule of thumb:** the more *operationally* intense the asset (hotel > senior housing >
STR > multifamily > office > storage > land), the more staff per rupee of asset value,
and therefore the more repetitive labour there is to automate.

## 4. Follow the money: how every role gets paid

If you learn nothing else from this chapter, learn this table. It explains behaviour.
When you cannot understand why someone in real estate acts a certain way, look up how
they are compensated.

| Role | Paid by | Paid how | Rough rate | Behavioural consequence |
|---|---|---|---|---|
| Residential agent | Seller (traditionally); increasingly buyer pays their own | % of sale price, at closing only | 2-3% per side (US), 1-2% (India resale) | Paid nothing until it closes → relentless focus on closing, not on advice |
| Channel partner (India, new sales) | Developer | % of booking value | 2-6% | Loyal to the developer, not the buyer |
| Mortgage loan officer | Lender | Commission on funded loans | 50-150 bps of loan amount | Volume-driven; abandons files unlikely to close |
| Appraiser | Lender (via AMC) | Flat fee per report | $400-800 US | Paid per report → speed pressure; independence is legally enforced |
| Title agent | Buyer or seller (varies by region) | % of price + fixed fees | ~0.5-1% | Keeps 70-80% of the premium; the underwriter takes the rest |
| Property manager | Owner | % of collected rent | 8-10% residential, 3-5% commercial | Paid on collection → strong incentive to keep units occupied and rent flowing |
| Leasing agent | Owner | Flat fee or % of first month | 50-100% of one month | Paid on lease signing → volume of applications matters |
| Commercial broker | Landlord or tenant | % of aggregate lease value | 3-6% of total lease value | Big lump sums, long droughts; "eat what you kill" |
| Developer | The project itself | Development fee + profit on exit | 3-5% fee + the residual | Bears all the timing risk; entitlement delay is existential |
| General contractor | Owner | Cost + fee, or fixed price | 3-8% fee | Change orders are where the margin is |
| Fund manager (GP) | Investors (LPs) | Management fee + carried interest | 1-2% + 20% over a hurdle | Fee on assets → incentive to raise and deploy capital |
| Facilities provider | Occupier | Fixed fee, cost-plus, or gain-share | Varies | KPI/SLA penalties drive documentation obsession |

Two patterns worth internalising:

1. **Almost everyone is paid at an event, not for time.** Closing, funding, signing,
   move-in. Work that does not lead to an event feels like pure cost to them. That is
   precisely the work that is repetitive and un-automated — and precisely why they
   will pay to make it disappear.
2. **The person doing the drudgery is usually not the person being paid the fee.**
   The agent earns the commission; the transaction coordinator does the 140 tasks. The
   loan officer earns the commission; the processor chases the documents. **Your buyer
   is often the fee-earner, and your user is the salaried person underneath them.**
   That gap is a recurring go-to-market problem in this industry — note it now.

## 5. The cast: everyone who touches one house sale

One ordinary US home sale. Count the parties. Every arrow is a handoff, and almost
every handoff is a human re-keying data or chasing someone by phone and email.

```
                          SELLER                              BUYER
                            |                                   |
                    Listing agent  <-------------------->  Buyer's agent
                            |                                   |
              +-------------+                     +-------------+-------------+
              |             |                     |             |             |
        Photographer   Transaction            Lender:      Home          Insurance
        Stager         coordinator            - loan officer inspector    agent
        Sign installer      |                 - processor       |
              |             |                 - underwriter     |
           MLS entry        |                 - closer      Pest / roof /
              |             |                 - funder      sewer specialists
        Syndication to      |                     |
        Zillow etc.        Managing broker    Appraiser (via AMC)
              |            (compliance)           |
        Showing service        |              Flood cert vendor
              |                |                  |
              +----------------+------------------+
                               |
                     TITLE / ESCROW COMPANY
                     - title searcher / abstractor
                     - examiner
                     - curative specialist
                     - escrow officer
                     - post-closer / policy typist
                               |
              +----------------+----------------+
              |                |                |
        County recorder   Notary/signing   Payoff lenders,
        (recording)       agent            HOA (estoppel),
                                           tax authority
                               |
                    Servicer (boards the loan)
                               |
                    Investor (Fannie/Freddie/private)
```

That is **roughly 20-30 distinct parties** for a single ordinary transaction, most of
them at different companies, on different software, none of which integrates. In India
the cast is smaller but the verification burden is larger (chapter 13).

Read that diagram as a systems engineer: it is a distributed workflow with no
orchestrator, no shared state, no schema, and human beings acting as the message bus.

## 6. The four clocks

Real estate runs on four different time scales at once. Confusing them is the most
common beginner error.

| Clock | Period | What moves on it | Why you care |
|---|---|---|---|
| **The transaction clock** | 30-60 days (US close), 3-9 months (India) | Contract to close. Hard contractual deadlines. | Deadline-driven work = calendar + chasing = the most obviously agent-shaped work in the industry |
| **The operating clock** | Daily / monthly | Rent, work orders, tours, month-end close | High-frequency repetitive tasks; volume makes small savings large |
| **The capital clock** | 3-10 years | Buy, hold, refinance, sell. Fund life. | Low frequency, high value per event, heavy document production |
| **The cycle clock** | 10-20 years | Boom, overbuilding, credit tightening, bust | Determines whether anyone has budget. Real estate tech dies in downturns |

An automation opportunity is attractive when the task recurs on the operating clock
(volume) *or* sits on a hard deadline on the transaction clock (pain), and survives
when the cycle clock turns.

## 7. Vocabulary you cannot read the guide without

Learn these twenty-five now; the rest are defined in each chapter's glossary.

**Space and measurement**
- **Square foot (sf) / square metre** — the universal unit. US uses sf; India uses sq ft too.
- **PSF** — per square foot. Rents, prices, and costs are all quoted PSF.
- **Carpet area / built-up / super built-up** — India-specific. Carpet = the floor you can walk on; built-up adds walls; super built-up adds a share of common areas. Developers historically priced on super built-up (a bigger number); RERA now requires carpet area. See ch. 13.
- **FSI / FAR** — Floor Space Index / Floor Area Ratio. How much building you may put on a plot. The single most valuable number in development.

**Money and returns**
- **NOI (Net Operating Income)** — rent collected minus operating expenses, *before* debt and tax. The industry's core profit measure.
- **Cap rate (capitalisation rate)** — NOI ÷ price. The yield. Roughly the inverse of a P/E ratio.
- **Basis points (bps)** — one hundredth of a percent. 50 bps = 0.5%.
- **LTV (loan-to-value)** — loan ÷ property value.
- **DSCR (debt service coverage ratio)** — NOI ÷ annual debt payments. Below 1.0 means the building cannot pay its own mortgage.
- **IRR (internal rate of return)** — the annualised return accounting for timing. The number every investor is judged on.
- **Equity multiple** — total cash out ÷ total cash in. 2.0x means you doubled your money.
- **Escrow** — money or documents held by a neutral third party until conditions are met. Also (US) the account a servicer uses to pay your taxes and insurance.

**Legal and process**
- **Title** — the legal right of ownership. Distinct from the *deed*, which is the document that transfers it.
- **Encumbrance / lien** — a claim against a property (mortgage, tax debt, unpaid contractor) that must be cleared before clean transfer.
- **Contingency** — a condition in a contract that lets a party walk away (inspection, financing, appraisal).
- **Closing / completion / registration** — the moment ownership legally moves. Called "closing" in the US, "registration" in India.
- **Under contract / in escrow** — agreed but not yet closed.
- **Due diligence** — the investigation period before commitment.
- **Zoning** — the municipal rule for what may be built and used where.
- **Entitlement** — the process of getting permission to build. In the US this can take years and is the biggest risk in development.
- **Encumbrance Certificate (EC)** — India: a record of registered transactions on a property. Central to Indian due diligence.

**Market**
- **Comp (comparable)** — a similar recently-sold or leased property, used to justify a price. The atomic unit of valuation.
- **MLS (Multiple Listing Service)** — US-only: a broker-owned cooperative database of for-sale listings. There are roughly 500 of them, regionally fragmented. **India has no MLS.** This single fact reshapes both markets — see ch. 12 and 13.
- **Absorption** — how fast available space gets leased or sold.
- **Vacancy** — the share of space sitting empty.

## 8. The arithmetic: three formulas that run the industry

You are an engineer; you will trust the domain faster if you can compute it.

**(a) Valuing an income property**

```
NOI  = Gross rent - vacancy loss + other income - operating expenses
       (operating expenses EXCLUDE mortgage payments, depreciation, capex)

Value = NOI / cap rate
```

Worked example — a 20-unit apartment building:

```
20 units x Rs 25,000/month x 12          = Rs 60,00,000  gross potential rent
less 5% vacancy                          = -Rs 3,00,000
plus parking and other income            = +Rs 2,00,000
                                           ------------
Effective gross income                   = Rs 59,00,000
less operating expenses (~35%)           = -Rs 20,65,000
                                           ------------
NOI                                      = Rs 38,35,000

At a 7% cap rate:  Value = 38,35,000 / 0.07 = Rs 5.48 crore
```

Note what this means: **raising NOI by Rs 1 lakh raises the value by Rs 14 lakh** at a
7% cap. This is why operators obsess over small recurring savings and small rent
increases — and why software that adds a little NOI can be sold on a very large number.
It is also why fraud and error in NOI reporting matters so much.

**(b) Mortgage payment**

```
M = P * [ i(1+i)^n ] / [ (1+i)^n - 1 ]

P = principal, i = monthly rate (annual/12), n = number of months
```

Everything in chapter 03 is ultimately about establishing, with documents, that a
borrower can pay `M` every month for `n` months.

**(c) Development profit**

```
Total cost      = land + hard costs + soft costs + financing + contingency
Stabilised NOI  = the building's NOI once leased up
Yield on cost   = Stabilised NOI / Total cost
Development spread = Yield on cost - market cap rate
```

If you build to a 7% yield on cost and the market values it at a 5.5% cap rate, you
created value. If costs rise or rates move and the spread goes to zero, the project
dies — often *after* years of entitlement spend. This is why development is the highest
variance job in real estate and why time-to-approval is worth so much money.

## 9. Seven structural facts that determine what software can exist

These are the constraints. Every idea you have will hit at least three of them.

1. **Jurisdictional fragmentation.** In the US: 50 states, ~3,100 counties, ~19,000
   municipalities, each with its own forms, filing systems, deadlines, and rules.
   In India: 28 states and 8 UTs, each with a different land-records system, stamp
   duty rate, and RERA authority. **Anything that works in one place needs re-work to
   work in the next.** This is why real estate software companies grow slowly and why
   national coverage is a moat.

2. **Licensing gates.** Specific acts are legally reserved to licensed humans:
   representing a party in a transaction, originating a loan, signing an appraisal,
   notarising, practising law, sealing engineering drawings. An agent can prepare,
   draft, chase, summarise, and check — but a licensed human must decide and sign.
   Design for that boundary rather than against it. (Chapter 11 maps it in detail.)

3. **Liability concentration.** When a real estate error occurs it is expensive and
   traceable: a missed deadline forfeits a deposit, a missed lien clouds a title, a
   mispriced loan triggers a regulator. The industry's caution is rational, not stupid.
   Any agent you build must fail visibly and safely, not silently.

4. **No shared schema.** There are standards — RESO for listings, MISMO for mortgage —
   but adoption is partial and the last mile is always bespoke. Most inter-company data
   movement is still PDF and email.

5. **The incumbent data moat.** MLSs, CoStar, county records aggregators, and the big
   systems of record control the data and gate access commercially. Feasibility is
   frequently a licensing question, not an engineering one. Check access before you
   design. (Chapter 12 is the map.)

6. **Cheap labour is the incumbent solution.** Most of the drudgery in this guide is
   already being done by an offshore analyst in Pune, Noida, Manila, or Bogotá for
   $6-15 an hour. **That is your real competitor, not the status quo of "nothing".**
   You are not competing against a blank page; you are competing against a trained human
   who costs less than most SaaS seats. This cuts both ways for an India-based founder:
   you understand the incumbent intimately, and you can staff a hybrid better than
   anyone in San Francisco can.

7. **Cyclicality.** Transaction volumes swing 40-50% peak to trough with interest rates.
   Products priced per transaction die in a downturn; products that cut headcount sell
   *better* in one. Pick your pricing model with the cycle in mind.

## 10. Why real estate is still so manual

Worth being precise about this, because "the industry is behind" is a lazy answer that
will lead you to build the wrong thing. The real reasons, in rough order of importance:

| Reason | Explanation |
|---|---|
| **Fragmentation of counterparties** | Any given transaction involves 20-30 firms who will never share a system. There is no dominant party who can force integration. |
| **The document IS the legal artifact** | A recorded deed, a signed disclosure, a stamped drawing — these are not representations of the truth, they *are* the truth, and their form is prescribed by law. You cannot simply replace them with a database row. |
| **Locality of rules** | Software that must encode 3,100 counties' rules has a very high fixed cost before the first sale. |
| **Low technology budget per head** | A brokerage's tech spend per agent is small; agents are contractors who buy their own tools. Budget authority is diffuse. |
| **The fee-earner is not the sufferer** | The person who feels the pain (coordinator, processor, examiner) rarely controls the budget. |
| **Genuine judgment content** | A meaningful share of the work is judgment, negotiation, or physical presence — and gets misclassified as automatable by outsiders. |
| **It already got outsourced** | The most repetitive work was offshored 15 years ago, which relieved just enough pressure to prevent automation. |

Note the third-to-last row. It is the most common reason outsiders fail in this
industry: they automate the visible 60% of a workflow and discover the remaining 40%
is exactly the part that needed a human, so nobody's headcount actually falls.
**When you evaluate a use case, ask what percentage of instances go end-to-end without
a human, not what percentage of the steps you can do.**

## 11. A taxonomy of the repetitive work

Across every chapter in this guide, the repetitive work falls into eight shapes. This
is your pattern library. Chapter 15 populates it with every concrete instance found.

| # | Shape | What it looks like | Where it shows up | Agent difficulty |
|---|---|---|---|---|
| 1 | **Document → structured data** | Read a PDF, extract N fields, type them into a system | Lease abstraction, loan document review, title search, appraisal input, RA bills | Low-medium — mature tech, crowded market |
| 2 | **Data → document** | Assemble a template from known facts | OMs, IC memos, appraisal reports, disclosures, notices, demand letters | Low — but liability-sensitive |
| 3 | **Chase and follow-up** | Repeatedly contact humans until they send a thing | Condition clearing, lien releases, estoppels, COIs, rent collection, missing docs | Medium — the highest-volume pain in the industry |
| 4 | **Deadline and calendar management** | Track dates across jurisdictions, act before each | Contingencies, lien notices, option notices, licence renewals, compliance filings | Low-medium — very high value, low glamour |
| 5 | **Cross-system reconciliation** | Same data in two systems; find and fix disagreement | CD balancing, trust accounting, CAM recs, rent roll audits, month-end close | Medium |
| 6 | **Rule-checking against a checklist** | Does this file satisfy N rules? | Compliance file review, QC audits, underwriting conditions, LIHTC recerts | Medium — rules are local and change |
| 7 | **Conversation at volume** | Answer the same questions for many people | Leasing inquiries, pre-sales calls, resident requests, borrower status queries | Medium-high — regulated (TCPA, disclosure) |
| 8 | **Physical presence and inspection** | Someone must be in the building | Showings, inspections, maintenance, notarisation, sub-registrar attendance | Not automatable — but *dispatching* and *documenting* it is |

**Where the money concentrates:** shapes 3 and 4. Chasing and deadline-tracking are
where the most human hours go, and they are the least served by existing software,
because they are not really data problems — they are *persistence* problems. That is a
genuinely new capability that agents have and prior software did not.

## 12. India vs US: the differences that matter most

Full treatment in chapters 13 and 14. The five differences that will most change your
thinking:

| Dimension | United States | India |
|---|---|---|
| **Title** | Guaranteed by title insurance, backed by a 4-firm underwriter oligopoly | **Presumptive only.** Registration proves a transaction happened, not that the seller owned it. Buyers rely on a lawyer's search of 30 years of records. Title insurance barely exists despite being contemplated by RERA. |
| **Listings data** | ~500 MLSs — fragmented but structured, licensable, and standardised via RESO | **No MLS at all.** Portals (99acres, MagicBricks, Housing) hold duplicated, unverified listings. Deals move through WhatsApp groups. |
| **Dominant transaction** | Resale of existing homes | **New/under-construction sales from developers.** A different sales motion entirely: developer call centres, channel partners, site visits, construction-linked payments. |
| **Who does the drudgery** | Salaried processors, coordinators, examiners — plus offshore teams in India | Pre-sales tele-callers, CRM executives, billing engineers, and society managers — at Rs 15,000-60,000/month |
| **The automation argument** | Labour cost (a US processor costs $50-70k/yr) | **Not labour cost — labour is cheap.** In India the argument is speed, consistency, coverage hours, multilingual reach, and compliance reliability. Get this wrong and you will price a product nobody buys. |

One more, which is the most commercially interesting fact in this guide: **India is
where a large share of the world's real estate drudgery already gets done.** US title
search, mortgage processing, lease abstraction, CAD drafting, valuation support, fund
accounting, and CRE research are performed overnight by Indian analysts in Pune,
Bengaluru, Noida, Chennai, and Hyderabad. That workforce is simultaneously your
competitive baseline and your most accessible customer. Chapters 03, 04, 06, 08 and 14
each cover their slice of it.

## 13. How to read the rest of this guide

| If you want... | Read |
|---|---|
| The consumer-facing transaction | 01 (brokerage), 03 (mortgage), 04 (title), 05 (appraisal) |
| High-volume operational work | 02 (property management), 09 (facilities) |
| Big-money, low-frequency work | 06 (commercial), 08 (institutional investment) |
| Physical creation of buildings | 07 (development and construction) |
| The odd corners with the least competition | 10 (niche asset classes) |
| What is legally off-limits, and where compliance itself is the drudgery | 11 |
| Whether you can actually get the data, and what already exists | 12 |
| Your home market | 13 (India structure), 14 (India roles and days) |
| The consolidated list of every repetitive task found | 15 |

Each vertical chapter has the same 11 sections. The two you should read first in any
chapter are **section 4 (day in the life)** and every **repetitive-work inventory**
table inside it. Sections 7 (rules) and 8 (what has been tried) are the ones that will
save you from building something illegal or already dead.

**A discipline worth adopting as you read:** for every task that looks automatable,
write down (a) how many times per year it happens across the market, (b) who pays for
it today, (c) what the licensed-human boundary is, and (d) what an offshore analyst
would charge to do it. If you cannot answer all four, you do not yet have a use case —
you have an observation.
