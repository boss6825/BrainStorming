# 08 · Institutional Investment — REITs, Funds, Syndications, and the Back Office

> Most large buildings are not owned by a person. They are owned by a legal entity that
> is owned by a fund that is owned by pension funds, sovereign wealth funds, insurance
> companies, endowments, and wealthy individuals. This chapter covers that capital
> layer: how the money is raised, deployed, tracked, and returned, and — more usefully
> for you — the substantial back office of analysts, accountants, and investor-relations
> staff who spend their lives assembling documents and reconciling spreadsheets so that
> capital can move. **This is the most spreadsheet-bound vertical in the guide, and a
> very large share of its work is already performed by teams in India.**

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

### Who owns commercial real estate

| Owner type | What it is | Notes |
|---|---|---|
| **Public REITs** | Listed companies owning income property; must distribute most taxable income | Equity REITs own buildings; mortgage REITs own debt |
| **Non-traded REITs** | Same tax structure, not listed; sold to individual investors | Periodic redemption limits — several large vehicles hit redemption caps in 2022-23, which taught investors what "semi-liquid" means |
| **Open-end core funds** | Perpetual funds holding stabilised assets; investors enter and exit at NAV | The institutional default for low-risk exposure |
| **Closed-end value-add / opportunistic funds** | Fixed life (typically 7-10 years), higher risk and return | The classic private equity real estate structure |
| **Separate accounts** | A single large investor's dedicated mandate | Pension funds and sovereign wealth funds |
| **Insurance company balance sheets** | Direct ownership and mortgage lending | Very large, very quiet |
| **Family offices and private investors** | Direct ownership | Enormous in aggregate, invisible in data |
| **Syndications** | A sponsor raises equity deal by deal from many small investors | Where most new entrants operate |
| **DSTs and 1031 investors** | Fractional interests used to defer capital gains tax | A specific tax-driven market |
| **Crowdfunding platforms** | Online retail access to private real estate | See section 8 for how this went |

### The GP/LP structure and the waterfall

This is the core financial mechanic of the industry. **Learn the waterfall** — it
explains sponsor behaviour better than anything else.

The **General Partner (GP)** — the sponsor — finds and runs the deal, putting in a small
share of the equity. The **Limited Partners (LPs)** put in most of the money and are
passive. Profits are split through a **distribution waterfall**:

```
Cash available for distribution flows through tiers, in order:

Tier 1  Return OF capital        100% to LPs until they get their money back
Tier 2  Preferred return         100% to LPs until they earn, say, 8% per annum
Tier 3  GP catch-up              often 50-100% to GP until the GP has its share of profit
Tier 4  Residual split           e.g. 80% LP / 20% GP   <- the "promote" or "carried interest"
```

Worked example. $10m LP equity, sold after five years, $16m of distributions.

```
Tier 1  Return of capital                        $10,000,000 to LP
Tier 2  8% preferred, ~5 years, simple           $ 4,000,000 to LP
        (running total to LP: $14,000,000)
Tier 3+ Remaining $2,000,000 split 80/20         $ 1,600,000 to LP
                                                 $   400,000 to GP  <- the promote
LP total $15.6m on $10m over 5 years.  GP earned $400k on little or no capital,
plus its management and acquisition fees along the way.
```

Note the incentive structure this creates: the GP earns fees regardless and the promote
only above a hurdle. **Fee income rewards raising and deploying capital; promote rewards
performing.** Understanding which one a given sponsor is optimising for explains most of
what they do.

### The fee stack

| Fee | Typical rate | Charged on |
|---|---|---|
| Asset management fee | 1-2% per annum | Committed or invested capital, or gross asset value |
| Acquisition fee | 0.5-2% | Purchase price |
| Disposition fee | 0.5-1% | Sale price |
| Financing fee | 0.5-1% | Loan amount |
| Construction management fee | 3-5% | Construction cost |
| Property management fee | 2-4% | Collected revenue |
| Promote / carried interest | 15-30% above a hurdle | Profits |

## 2. The lifecycle / process spine

### Fundraising

Strategy and track record → PPM and LPA drafted → LP outreach → **due diligence
questionnaires (DDQs)** → operational due diligence → negotiation of side letters →
subscription documents → KYC/AML on each investor → closing → subsequent closings.

DDQs deserve attention: an institutional LP sends a questionnaire of **hundreds of
questions** covering strategy, team, track record, valuation policy, compliance,
insurance, cybersecurity, ESG, and operations. Every LP's questionnaire is different,
most questions repeat across LPs with different wording, and the answers must be
consistent and current. **This is a large, purely repetitive document task** performed
by IR teams, and there is a standard template (the ILPA DDQ) that is only partly used.

### Acquisitions

Sourcing → initial screen → underwriting model → **IC (Investment Committee) memo** →
LOI → PSA → due diligence (see chapter 06) → financing → closing → onboarding to the
asset management and accounting platforms.

### Asset management

Annual business plan and budget → monthly variance reporting → quarterly valuation →
leasing and capex approvals → refinancing decisions → hold/sell analysis → disposition.

### Fund operations — where most of the headcount is

**Capital call** (notify LPs, collect funds, track receipts) → deploy → **quarterly
close** (property financials consolidated, adjustments, eliminations) → **valuation**
(external appraisals or internal marks) → **NAV calculation** → **LP reporting**
(capital account statements, fund financials, narrative) → **distributions** →
**annual audit** → **K-1 tax reporting** → performance calculation (IRR, TWR).

**The rhythm to internalise:** this cycle repeats every quarter, forever, for every
fund, and each iteration involves assembling the same documents from the same sources
in the same format with different numbers. That is as clean a description of automatable
work as exists in this guide.

## 3. Role inventory

| Role | Seniority | Typical comp (US, base + bonus) | India equivalent (offshore/GCC) | What they own |
|---|---|---|---|---|
| **Acquisitions analyst** | Entry | $85-130k | Rs 8-20 lakh | Underwriting models, screening, IC memo drafting |
| Acquisitions associate | Mid | $130-200k | — | Runs deals under a VP |
| VP / Director acquisitions | Senior | $200-400k | — | Sources and closes deals |
| Head of acquisitions / CIO | Executive | $400k-$1m+ | — | Strategy and capital allocation |
| **Asset management analyst/associate** | Entry-mid | $85-160k | Rs 8-18 lakh | Budgets, variance reports, business plan tracking |
| Asset manager / VP | Senior | $180-300k | — | Property performance against plan |
| Portfolio manager | Senior | $250-500k | — | Fund-level strategy and construction |
| Research analyst | Mid | $90-150k | Rs 8-16 lakh | Market research supporting investment theses |
| **Investor relations associate** | Entry-mid | $90-150k | Rs 8-16 lakh | LP queries, DDQs, reporting packages |
| Head of IR / capital formation | Senior | $250-600k | — | Raising the fund |
| **Fund accountant** | Entry-mid | $70-110k | **Rs 6-15 lakh — heavily offshored** | Books, capital accounts, NAV |
| Senior fund accountant / assistant controller | Mid | $110-160k | Rs 15-25 lakh | Quarterly close |
| Fund controller | Senior | $160-250k | — | Financial statements, audit |
| CFO | Executive | $300k-$1m+ | — | Everything financial |
| **Valuations analyst** | Mid | $95-150k | Rs 10-20 lakh | Quarterly marks, appraisal coordination |
| **Performance analyst** | Mid | $90-140k | Rs 8-18 lakh | IRR/TWR calculation, GIPS, benchmark reporting |
| Treasury analyst | Mid | $85-130k | Rs 8-16 lakh | Cash management, capital calls, distributions |
| **Tax manager / REIT compliance analyst** | Mid-senior | $120-200k | Rs 12-25 lakh | REIT testing, K-1s, entity-level tax |
| Compliance officer / CCO | Senior | $150-300k | — | Regulatory compliance |
| ESG analyst | Mid | $90-150k | Rs 8-18 lakh | Sustainability data collection and reporting |
| Fund administrator staff (SS&C, Citco, Alter Domus, Standish) | Varies | Varies | **Large India operations** | Outsourced fund accounting |

**The offshore fact.** Fund accounting, valuations support, performance calculation,
research, and analyst support for global real estate investors are performed at scale in
India — both by third-party administrators with Indian delivery centres and by
**captive Global Capability Centres (GCCs)** that firms like Blackstone, Brookfield,
JLL, CBRE and the large fund administrators operate in Bengaluru, Gurugram, Hyderabad,
Pune and Mumbai. If you are building for this vertical from India, your users may
literally be down the road. See chapter 14.

## 4. Day in the life

### Acquisitions analyst — day in the life

- **Who they are:** 22-27, often ex-investment banking or straight from university.
  Measured on model accuracy, turnaround speed, and not embarrassing the VP in IC.
- **Their stack:** **Excel** (the real system of record — a deal model is a 15-tab
  workbook), Argus for institutional assets, PowerPoint, Dealpath or a shared drive for
  pipeline, CoStar and broker emails for market data, Outlook.

**A typical day**

| Time | What happens |
|---|---|
| 8:30 | Overnight broker emails: six new OMs. Skim each for size, market, price, and whether it fits the mandate. Log them in the pipeline |
| 9:30 | Build a quick screen model on one — a one-page back-of-envelope on price per unit, going-in cap rate, and rough IRR — to decide whether it deserves real work |
| 10:30 | On a live deal: **normalise the rent roll.** The broker's Excel has merged cells, inconsistent unit-type labels, and lease dates in three formats. Clean it into the model's schema |
| 12:00 | **Normalise the T-12.** The seller's chart of accounts does not match the firm's standard categories. Map every line by hand; decide which expenses are non-recurring |
| 13:30 | Update the full underwriting model: rent growth, renewal probability, capex programme, financing assumptions, exit cap. Run sensitivities |
| 15:00 | Start the **IC memo**: market overview, submarket comps, the business plan, risks, sensitivities, sources and uses, returns. Much of the structure is identical to every previous memo; the firm has a template |
| 17:00 | The VP asks for three additional scenarios by morning. Rebuild and re-run |
| 19:30 | Comps research: chase a broker for details on a recent sale that the databases have incomplete |
| 21:00 | Format the memo exhibits |

- **What they complain about:** hours; rebuilding the same model for every deal; being
  a human data-cleaner; version chaos (`Model_v7_FINAL_JB_revised_v2.xlsx`); doing
  detailed work on deals that die.

**Repetitive-work inventory — acquisitions analyst**

| Task | Frequency | Hours each | Why it's still manual | Data in → data out |
|---|---|---|---|---|
| **Rent roll normalisation** | Every deal | 1-4 | Every owner's export format differs | Broker Excel → model schema |
| **T-12 normalisation and expense mapping** | Every deal | 1-4 | Charts of accounts are bespoke; judgment on non-recurring items | Operating statements → standardised categories |
| Screening model build | 5-15/week | 0.5-2 | Repetitive but requires reading the OM | OM → summary metrics |
| Full model build | 1-4/month | 8-40 | Template exists but every deal has quirks | Assumptions → returns |
| **IC memo drafting** | 1-4/month | 8-20 | Largely templated narrative plus deal-specific analysis | Model + research → memo |
| Comp research and verification | Continuous | Hours | Data incomplete; requires broker calls | Databases + calls → comp set |
| Pipeline logging and reporting | Weekly | 1-3 | Manual entry from email | Emails → pipeline tracker |

### Fund accountant at quarter-end — day in the life

Arguably the single most automatable job family in this guide.

- **Who they are:** an accountant, often ACCA/CA/CPA-track, either in-house or at a fund
  administrator. Measured on close accuracy and hitting the reporting deadline.
- **Their stack:** Yardi Investment Suite, Investran, or eFront for fund accounting;
  Yardi or MRI for property accounting; **Excel for everything in between**; Box or
  SharePoint for documents.

**A quarter-end fortnight**

| Day | What happens |
|---|---|
| 1-3 | Collect property-level financials from every property manager. Chase the ones who are late. Some arrive as Excel, some as PDF exports |
| 3-5 | Load and reconcile property trial balances into the fund ledger. Investigate variances |
| 5-6 | Consolidation: eliminate intercompany balances, apply ownership percentages for joint ventures, handle non-controlling interests |
| 6-7 | **Valuation entries:** post the quarter's marks from appraisals or internal models |
| 7-8 | **NAV calculation.** Then **allocate** the quarter's income, expenses, gains and losses **to each LP's capital account** according to the LPA's terms — which differ between investors because of side letters and different entry dates |
| 8-9 | Build the capital account statements: one per investor, each showing contributions, distributions, allocated income, and ending balance |
| 9-11 | Assemble the quarterly reporting package: financial statements, schedules, portfolio summary, narrative commentary |
| 11-12 | Review cycles with the controller. Corrections cascade through the workbooks |
| 12-14 | Distribute to LPs; answer the queries that come back |

Then the annual layer: audit preparation (a "prepared by client" list of dozens of
schedules and supporting documents), and **K-1 production** — each investor's tax form,
generated from the same allocations, with state-by-state apportionment for
multi-state funds. K-1 season is a notorious annual crunch, and LPs complain every year
about receiving them late.

**Repetitive-work inventory — fund accounting**

| Task | Frequency | Hours | Why it's still manual | Data in → data out |
|---|---|---|---|---|
| **Chasing property financials** | Quarterly, per property | 0.25-1 each | Property managers are late; formats vary | Reminder → received file |
| Loading and reconciling trial balances | Quarterly, per entity | 1-3 each | Format mismatches between property and fund systems | Property TB → fund ledger |
| Intercompany elimination and consolidation | Quarterly | 4-16 | Structure-specific logic often held in Excel | Entity ledgers → consolidated |
| **Capital account allocation** | Quarterly, per investor | Bulk, hours | LPA waterfall terms plus per-investor side letters | Fund results → per-LP allocation |
| Capital call and distribution notices | Several per year, per investor | Bulk | Templated documents with per-investor numbers | Allocation → notice |
| **Quarterly reporting package assembly** | Quarterly | 20-60 | Compiling many sources into a formatted document | Statements + commentary → package |
| Audit PBC schedule preparation | Annual | Weeks | Auditors request the same schedules every year, slightly differently | Ledger → schedules |
| **K-1 preparation and distribution** | Annual, per investor | Bulk | Allocation plus state apportionment | Allocations → tax forms |
| **Side letter compliance tracking** | Continuous | — | Each investor negotiated different rights (fee breaks, reporting, MFN, exclusions); compliance is manual against a folder of PDFs | Side letters → obligations checklist |

**Note that last row.** Side letter management is a genuinely under-served problem: a
large fund may have dozens of side letters, each granting different rights, and staying
compliant means somebody remembering what is in a stack of negotiated documents. It is
document extraction plus obligation tracking — squarely shape 1 and shape 4 work.

### Investor relations associate — day in the life

- **Their stack:** Juniper Square or Altvia as the investor portal and CRM, Excel,
  PowerPoint, a folder of previous DDQ answers, email.

**A typical day:** answer LP queries (an LP asks for a breakdown that does not exist in
any report and must be built); work on an in-flight **DDQ** — 200-400 questions, most of
which have been answered in a previous DDQ but in different wording, so the associate
searches old response files and adapts; update the quarterly investor letter; prepare
materials for an LP's annual meeting; onboard a new investor (subscription documents,
KYC/AML, entity documents, tax forms); reconcile which investors have received which
documents.

**Repetitive-work inventory — IR**

| Task | Frequency | Effort | Why it's still manual | Data in → data out |
|---|---|---|---|---|
| **DDQ completion** | Several per fundraise | 20-80 hours each | Every LP asks the same things differently; answers live in past documents | Question set → consistent answers |
| Ad hoc LP data requests | Weekly | 1-8 hours each | Requested cuts do not exist in standard reports | Request → bespoke analysis |
| Investor onboarding and KYC | Per investor | 1-4 hours | Document collection and verification | Sub docs → onboarded investor |
| Quarterly letter drafting | Quarterly | Days | Templated structure with new content | Performance → narrative |
| Consent and notice distribution tracking | Periodic | Hours | Who received, opened, signed | Distribution list → status |

### Valuations analyst — day in the life

Quarterly: commission or update external appraisals, review the appraiser's assumptions
against the firm's view, update internal DCF models, prepare a valuation memo per asset
justifying the mark, present to a valuation committee, and document everything for the
auditors. **The documentation burden is the work** — the analysis itself is often
straightforward, but each mark must be evidenced and defensible.

## 5. The document & data layer

| Document | Producer | Standardised? | Notes |
|---|---|---|---|
| Teaser / OM | Broker | No | Deal marketing |
| **IC memo** | Analyst | Firm template | The decision document |
| **PPM (Private Placement Memorandum)** | Counsel | No | The offering document; heavy disclosure |
| **LPA (Limited Partnership Agreement)** | Counsel | No | Governs everything: fees, waterfall, governance |
| **Side letters** | Counsel, per investor | No | Bespoke investor rights. A compliance tracking problem |
| Subscription agreement | Counsel | No | Investor commitment and representations |
| **DDQ** | LP | ILPA template exists but is unevenly used | Hundreds of questions |
| Capital call notice | Fund accounting | Templated | Per investor |
| Distribution notice | Fund accounting | Templated | Per investor |
| **Capital account statement** | Fund accounting | Semi-standard | Per investor, per quarter |
| Quarterly report / financial statements | Fund accounting | GAAP/IFRS | Audited annually |
| **ILPA reporting template** | Industry | **Yes** | A genuine standardisation effort for fee and expense reporting |
| **K-1** | Tax | **Yes — IRS form** | Per investor, annual |
| Appraisal / valuation memo | Appraiser / analyst | No | Supports the mark |
| Loan agreement and covenant certificates | Lender's counsel | No | Recurring compliance reporting |
| REIT test workpapers | Tax | No | Quarterly asset and income tests |

## 6. Systems of record

| System | Category | Position | API |
|---|---|---|---|
| **Excel** | Modelling, allocation, reporting, everything | **The actual system of record.** Say it plainly | N/A |
| Yardi Investment Manager / Elevate | Fund and investment accounting | Major | Gated |
| MRI | Property and investment accounting | Major | Gated |
| Investran (SS&C), eFront (BlackRock) | Private capital fund accounting | Institutional standards | Gated |
| **Juniper Square** | Investor portal, CRM and fund administration | The leading modern platform for the middle market | Yes |
| Agora, Altvia, Covercy | Investor portals | Growing | Yes |
| Dealpath | Acquisition pipeline | Established | Yes |
| **Argus Enterprise** | Asset-level valuation modelling | Near-monopoly for institutional CRE | Proprietary |
| Chatham Financial | Hedging and debt analytics | Specialist | Some |
| Intralinks, Datasite, Box, SharePoint | Data rooms and document storage | Universal | Yes |
| Preqin, PitchBook | Market and fundraising data | Standard | Yes |
| Cherre, Northspyre | Data unification, project cost | Growing | Yes |
| SS&C, Citco, Alter Domus, Standish | Outsourced fund administration | The outsourcing answer | N/A |

**The engineer's read:** this vertical's defining technical fact is that **the
authoritative record of how much each investor is owed frequently lives in a
spreadsheet**, maintained by hand, reconciled quarterly. Fund administration software
exists and is used, but the waterfall calculations and per-investor allocations very
often sit in Excel because the LPA's terms are bespoke and no product models them all.
That is simultaneously a large opportunity and the reason it has resisted productisation.

## 7. Rules, regulators, and hard constraints

- **Securities law governs the raise.** Interests in a real estate fund are securities.
  Most private raises use **Regulation D**: 506(b) allows up to 35 non-accredited
  investors but **prohibits general solicitation** (no public advertising), while 506(c)
  permits general solicitation but requires the sponsor to **verify** accredited status
  rather than accept self-certification. **Any product that helps a sponsor market a
  deal publicly puts them in 506(c) territory with verification obligations.** Get this
  wrong for a customer and their offering is defective.
- **Investment Advisers Act.** Sponsors above certain thresholds must register as
  investment advisers, bringing compliance programmes, custody rules, and examinations.
  Real estate sponsors have historically relied on exemptions; the boundaries matter.
- **SEC private fund adviser rules.** A package of rules on quarterly statements, audits,
  adviser-led secondaries, and preferential treatment was **vacated by the Fifth Circuit
  in 2024**. Check the current position before assuming any of it applies — but note
  that many LPs now demand ILPA-style reporting contractually regardless of regulation.
- **REIT qualification.** To keep REIT tax treatment an entity must satisfy, every
  quarter and year: asset tests (broadly, at least 75% of assets in real estate, cash
  and government securities), income tests (75% and 95% thresholds from qualifying
  sources), a distribution requirement (distribute the large majority of taxable income),
  and ownership tests (including the "5/50" rule — no five individuals owning more than
  50%). **These tests are performed quarterly by hand in spreadsheets** at most REITs.
  A rules engine over structured holdings data is an obvious fit; the constraint is that
  the consequences of getting it wrong are catastrophic (loss of REIT status), so nobody
  will let software decide unsupervised.
- **UBTI and blockers.** Tax-exempt investors (pensions, endowments) incur Unrelated
  Business Taxable Income on leveraged real estate, so structures use blocker
  corporations. This drives entity complexity — and entity complexity is why fund
  accounting is hard.
- **FIRPTA.** Foreign investors face withholding on dispositions of US real property
  interests, driving further structuring.
- **1031 exchanges.** Deferring gain requires a **qualified intermediary** to hold
  proceeds, identification of replacement property within **45 days**, and closing
  within **180 days**. Hard statutory deadlines with no extensions — a pure calendar
  problem with large money attached.
- **AML/KYC on investors.** Verifying identity and source of funds for every subscriber.
- **GIPS.** Voluntary but widely expected performance presentation standards.
- **ERISA plan asset rules.** When pension money exceeds thresholds, fiduciary
  obligations attach to the fund itself.
- **Audit and valuation independence.** Auditors will test the marks; valuation
  governance must be documented.

## 8. What has already been tried

| Attempt | What it tried | Outcome | The lesson |
|---|---|---|---|
| **Real estate crowdfunding** (Fundrise, RealtyMogul, CrowdStreet, Yieldstreet) | Open private real estate to retail investors online | Mixed. Fundrise persisted at scale; CrowdStreet suffered a serious investor-fraud episode on a sponsor it had listed, with substantial losses | Distribution was the easy part. **Diligence on sponsors was the hard part, and platforms were not structured to bear that responsibility** |
| **Non-traded REIT semi-liquid vehicles** | Offer periodic liquidity on illiquid assets | Redemption limits were hit in 2022-23 and gates applied as designed | Liquidity mismatch is a structural feature, not a bug. Investors learned it the hard way |
| **Tokenisation / blockchain real estate** | Fractional, tradable ownership on-chain | Recurrent hype; almost nothing durable at institutional scale | The binding constraints are legal (securities law, title, transfer taxes) not technical. **Tokenising an asset does not make it liquid** |
| **Juniper Square** | Modernise investor administration for the middle market | Genuine success | Attacking the *administrative* layer worked where attacking the *capital formation* layer did not |
| **Dealpath, Northspyre, Cherre** | Pipeline, cost, and data unification | Established, moderate scale | Workflow tools sell steadily into institutions with budget |
| **Outsourced fund administration** (SS&C, Citco, Alter Domus) | Move the whole back office to a specialist, often delivered from India | **A very large, mature, profitable industry** | This is the incumbent answer to everything in section 4. Your competition is a trained accountant in Bengaluru, not a blank page |

**The synthesis:** in this vertical, capital-formation innovation has mostly disappointed
(crowdfunding, tokenisation), while **back-office administration has been a real and
repeatable business** — either as software (Juniper Square) or as labour arbitrage
(offshore fund administration). If you are looking for AI opportunities here, the
history points at the back office, and it points at competing with or augmenting an
offshore team rather than a US in-house one.

## 9. Where the human genuinely adds value

- **Judgment about the future.** Underwriting is a set of assumptions about rent growth,
  exit pricing, and capital markets five years out. The model is arithmetic; the
  assumptions are opinion, and the opinion is what LPs pay for.
- **Sourcing through relationships.** The best deals are seen before they are marketed,
  because someone knows someone.
- **Investment committee debate.** The value of IC is adversarial scrutiny by
  experienced people who have seen deals fail.
- **LP trust.** Institutional investors commit large sums for a decade to people they
  believe. That is a relationship business.
- **Negotiating the LPA and side letters.** Genuinely adversarial legal negotiation.
- **Crisis handling.** When a deal goes wrong, restructuring with lenders and investors
  is judgment, relationship, and nerve.
- **Signing the financials.** A controller and an auditor take responsibility.

## 10. Glossary

- **AUM** — Assets Under Management.
- **Capital call** — A demand on LPs to fund part of their commitment.
- **Capital account** — An investor's running balance in the fund.
- **Carried interest / promote** — The GP's share of profits above a hurdle.
- **Catch-up** — The waterfall tier restoring the GP to its target profit share.
- **Clawback** — Obligation on the GP to return excess promote at the end of a fund's life.
- **Closed-end fund** — Fixed life, fixed commitments, then wind-down.
- **Commitment** — The total an LP agrees to fund over time.
- **Core / core-plus / value-add / opportunistic** — The risk-return spectrum, lowest to highest.
- **DDQ** — Due Diligence Questionnaire.
- **DST** — Delaware Statutory Trust; a structure used for 1031 exchange investments.
- **Dry powder** — Committed but undeployed capital.
- **GP / LP** — General Partner (sponsor) / Limited Partner (investor).
- **Hurdle / preferred return** — The return LPs must receive before the GP shares profits.
- **ILPA** — Institutional Limited Partners Association; publishes reporting and DDQ templates.
- **IRR** — Internal Rate of Return; time-weighted for the sponsor's cash flows.
- **J-curve** — Early negative returns from fees before assets perform.
- **K-1** — The US tax form reporting a partner's share of income.
- **LPA** — Limited Partnership Agreement.
- **NAV** — Net Asset Value.
- **NCREIF / ODCE** — US real estate performance benchmarks; ODCE is the open-end core fund index.
- **PPM** — Private Placement Memorandum.
- **REIT** — Real Estate Investment Trust; a tax structure requiring distribution of most income.
- **Side letter** — A bespoke agreement giving one investor different terms.
- **Subscription** — An investor's commitment documentation.
- **TWR** — Time-Weighted Return; used for comparing managers.
- **UBTI** — Unrelated Business Taxable Income; a problem for tax-exempt investors.
- **Waterfall** — The ordered rules for splitting distributions.

## 11. Verify before you rely on this

| Claim | Why it moves | Check against |
|---|---|---|
| SEC private fund adviser rules status | Vacated by the Fifth Circuit in 2024; the landscape is unsettled | SEC; law firm alerts |
| Accredited investor definition | Periodically revisited | SEC Regulation D |
| REIT test thresholds and details | Stable in outline, detailed in application | IRC sections 856-859; tax counsel |
| 1031 timelines and legislative proposals | The 45/180-day rules are stable; the exchange's survival is periodically debated politically | IRS; current legislation |
| Fee levels, promote structures, hurdles | Market-negotiated; ranges vary by strategy and vintage | Preqin; ILPA; actual LPAs |
| Non-traded REIT redemption episodes | Specific to vehicle and period | Company filings |
| CrowdStreet / Nightingale details | Litigated; facts developed over time | SEC filings; contemporaneous reporting |
| Offshore fund administration headcount and pricing | Commercially sensitive | Provider disclosures; direct quotes |

**Method note.** This chapter was written from domain knowledge after a rate limit ended
the research fan-out. Waterfall mechanics, fee structures, and process descriptions are
standard industry practice; the specific percentages are illustrative ranges, not
measured market data. Nothing here is legal, tax, or investment advice.
