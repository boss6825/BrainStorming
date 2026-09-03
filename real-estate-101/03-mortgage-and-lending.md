# 03 · Mortgage Origination, Underwriting, Closing, and Servicing

> **Orientation.** A mortgage is a loan secured by a house: the lender hands over cash,
> the house is collateral, and if the borrower stops paying, the lender can foreclose and
> sell the house to recover the money. Almost no US lender keeps the loans it makes.
> Origination is a manufacturing line that takes a borrower's raw financial life —
> income, assets, credit history, the property itself — and converts it into a
> standardized, legally compliant financial instrument that Fannie Mae, Freddie Mac, or
> Ginnie Mae will buy or guarantee within days of closing. The loan officer sells it, a
> processor and underwriter build the paper case for it, a closer/funder executes the
> money and legal transfer, and then — almost always at a *different company* — a
> servicer spends the next 15-30 years collecting the payment, holding the tax/insurance
> escrow, and, if the borrower falls behind, working the loan through loss mitigation or
> foreclosure. Origination revenue is a one-time fee paid at closing; servicing revenue is
> a tiny recurring fee paid monthly for the life of the loan, which is why the *right* to
> service a loan (see MSR below) is itself a security that gets bought and sold. The
> industry originated roughly $2.2 trillion in mortgages forecast for 2026 [MBA, source
> 12], yet — and this is the central fact that should motivate everything else in this
> chapter — it cost lenders a fully-loaded **$10,965 in operating expense to originate a
> single loan** in Q2 2025, per the Mortgage Bankers Association's own quarterly
> performance report [source 1], a number that has barely moved in real terms in over a
> decade of "digital mortgage" marketing claims.

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

**The headline number.** The Mortgage Bankers Association (MBA — the industry's trade
and lobbying association, and the closest thing this industry has to an authoritative
statistics bureau) runs a Quarterly Mortgage Bankers Performance Report that tracks
fully-loaded production expense per loan (commissions, base compensation, occupancy,
equipment, and corporate/overhead allocation, divided by loans closed). That figure was
**$12,579 in Q1 2025, $10,965 in Q2 2025, and $11,109 in Q3 2025** [source 1, source 2,
source 3]. Full-year 2025, independent mortgage banks (IMBs — non-depository lenders
that only do mortgages, as opposed to a bank or credit union) averaged **$12,209 per
loan**, down 5% from 2024 but still 15% above their 2023 average; depositories (banks
and credit unions) averaged **$16,320 per loan** in 2025 — only the fourth year in 25
that depositories have cost *more* per loan than IMBs, attributed to bank staffing
caution and rising corporate/tech-allocation overhead [source 4]. For scale on the
trend: MBA's own historical series shows $8,475/loan in Q4 2017, a trough of $7,452/loan
in Q3 2020 (the refi boom — origination cost per loan falls when volume is high because
fixed headcount gets spread over more loans, not because any step got cheaper), and a
study-high $13,171/loan in Q1 2023 as volume collapsed with rate hikes but staff took
time to shed [source 5, source 6]. **The pattern this history reveals: cost-per-loan is
almost entirely a function of volume divided by a headcount-heavy, largely fixed cost
base — not of any step in the process getting structurally cheaper.** That is the
single best argument for automation in this industry: nothing has bent the underlying
labor-per-loan curve in over a decade.

Separately, Freddie Mac's own 2025 Cost to Originate study (methodology differs slightly
— retail-only lenders, includes their own Loan Product Advisor automation tooling)
found retail costs of roughly $11,800/loan in Q2 2025 and claimed up to $1,700/loan in
savings and 5 days of cycle-time reduction for lenders using its automated income,
asset, and appraisal-waiver tools most heavily [source 7] — Freddie Mac sells this
tooling, so treat the savings claim as vendor-adjacent evidence, not independent audit.

### Where the borrower's money goes

| Fee / payment | Who pays | Who receives | Typical amount | Trigger |
|---|---|---|---|---|
| Origination fee / origination points | Borrower | Lender or broker | 0–1%+ of loan amount; 1 "point" = 1% of the loan | Charged at closing |
| Discount points | Borrower (optional, buys a lower rate) | Lender, as prepaid interest | Roughly 1% of loan amount per ~0.25 percentage-point rate reduction (varies with market) [unverified — varies too much by lender/date for one number] | Borrower's choice at application/lock |
| Lender credit | Lender (reduces borrower's cash to close, in exchange for a higher note rate) | Borrower | Offsets some/all closing costs | Negotiated at lock |
| Broker compensation | Either the borrower directly, or the wholesale lender (never both — dual compensation is banned) | Mortgage broker | Typically 1%–2.75% of loan amount; floors/ceilings and the "no dual comp" rule come from Reg Z §1026.36(d) | Closing |
| Appraisal fee | Borrower | Appraiser, via the AMC (appraisal management company) | National average about $357 (2025), roughly $314–$423 typical range, higher in expensive/complex metros [source 8] | Ordered during processing |
| AMC's cut of the appraisal fee | (Same fee as above, split) | AMC | AMCs commonly retain 30–50% of the total fee; appraiser-advocacy sources put the AMC's dollar take around $100–$125/order | Same |
| Title insurance premium (lender's policy) | Borrower | Title insurer / title agent | Varies by state (some states regulate the rate; a few are "file and use") | Closing |
| Credit report / verification pass-throughs | Borrower | Credit bureau / verification vendor, via lender | $30–$100 per pull typically [unverified — not sourced this session] | Application/processing |

### Where the lender's money comes from

This is the side the reader actually needs to understand to see the automation
opportunity, because it explains why lenders tolerate a $10–13k cost structure.

- **Gain on sale.** A lender that sells a closed loan into the secondary market (to
  Fannie Mae, Freddie Mac, Ginnie Mae via an approved issuer, or a private/jumbo
  investor) books the difference between what the loan is worth in that market (a
  function of the note rate versus current market rates) and its cost basis, plus
  origination fee income, as "gain on sale." For most independent mortgage banks this —
  not interest income — is the core P&L line; it is also the line MBA's cost-to-
  originate studies are ultimately measured against (net production income per loan).
- **Servicing-released premium (SRP).** If the originator sells both the loan *and* the
  right to service it in one transaction (common for smaller lenders and brokers'
  wholesale partners), the buyer (an aggregator or a large bank) pays an extra premium,
  quoted in basis points (bps; 1 bp = 0.01%) of loan amount, for the servicing rights.
  SRP pricing runs roughly 15–25 bps above the market's fair-value estimate for MSRs in
  a tight-supply environment, per MSR trading desk commentary — treat that spread, not
  an absolute SRP number, as the sourced fact; absolute SRP levels move with rates
  every week [source 9].
- **MSR (mortgage servicing rights) value.** If the originator instead *retains*
  servicing, it books an intangible asset: the present value of future servicing fee
  cash flows (roughly 25 basis points/year of unpaid principal balance for a typical
  conventional loan, paid out of the borrower's monthly payment) minus the cost of
  servicing and the risk of prepayment (a loan that refinances away stops paying a
  servicing fee, so MSR value falls as rates fall — the opposite of how a bond behaves,
  which is what makes MSRs a distinct, actively traded asset class). Bulk MSR trades in
  2025 priced around **135–144 bps of loan balance (a 5.40–5.76x multiple of the annual
  servicing fee)** [source 9]; the bulk/flow MSR trading market approached **$1 trillion
  in volume in 2024**, a pace that continued into 2025 [source 10].
- **Interest rate spread while the loan sits on the balance sheet.** Between funding and
  sale/securitization (typically days to a few weeks), the lender earns any spread on
  its warehouse line — a short-term credit facility used to fund closed loans before
  they're sold — but this is a financing detail, not a major profit center by itself.

### The three origination channels

| Channel | Who originates | Who underwrites/funds | Economics | Scale |
|---|---|---|---|---|
| **Retail** | The lender's own employee, the loan officer (MLO), works directly with the consumer | Same lender | Highest cost per loan (bears full sales + fulfillment cost) but highest margin/control; most bank and large-IMB volume | Majority of dollar volume industry-wide [unverified — no single clean citation this session] |
| **Wholesale / broker** | An independent mortgage broker (not employed by the lender) takes the application and shops it | A wholesale lender (e.g., United Wholesale Mortgage — UWM, Rocket Pro TPO) underwrites, prices, and funds; broker never funds | Broker earns a fee (borrower- or lender-paid, never both); wholesale lender gets volume without retail sales overhead | UWM originated 42.5% of all wholesale-channel volume through the first nine months of 2025, and 8.4% of *all* first-lien residential mortgages across every channel in that period [source 11]. Broker channel market share overall reached ~27.4% as of Q3 2024, growing (over 16,000 new loan officers joined the channel that year) [source 12] |
| **Correspondent** | A smaller lender (often a community bank or credit union without its own capital-markets desk) originates and funds in its own name | Same small lender funds temporarily (on its own warehouse line), then sells the *closed* loan — usually within days — to a larger correspondent investor who takes on secondary-market/capital-markets risk | Correspondent lender keeps a smaller sale premium than retail but avoids carrying MSR and rate-lock risk itself | Common structure for community banks/credit unions; no single clean market-share citation this session |

### The secondary market: who actually buys the loan

| Entity | What it is | What it does | Status (2026) |
|---|---|---|---|
| **Fannie Mae** (Federal National Mortgage Association) | Government-sponsored enterprise (GSE) — a private, shareholder-owned corporation with an implicit federal backstop | Buys conventional loans that meet its underwriting rules ("conforming" loans) from lenders, packages them into mortgage-backed securities (MBS) it guarantees, or holds them | In federal conservatorship (FHFA is conservator) continuously since September 2008. As of this writing (Sept 2026) still technically in conservatorship, but a March 2026 Trump executive order directed FHFA to revisit the capital framework that governs any exit, and industry commentary is watching for a possible exit signal within this presidential term — **no exit has occurred** [source 13, source 14] |
| **Freddie Mac** (Federal Home Loan Mortgage Corporation) | Same GSE structure as Fannie Mae, competing for the same conventional conforming business | Same function as Fannie Mae | Same conservatorship status as Fannie Mae [source 13] |
| **Ginnie Mae** (Government National Mortgage Association) | A wholly government-owned corporation inside HUD — *not* a GSE | Does not buy loans itself. It guarantees the timely payment of principal and interest to investors in MBS backed by pools of FHA, VA, and USDA loans that approved issuers assemble; this guarantee carries the full faith and credit of the US government (Fannie/Freddie's backing is implicit, Ginnie Mae's is explicit) | Continues normal operation |
| Fannie + Freddie combined | — | — | Own or guarantee roughly **46% of the ~$14.7 trillion US residential mortgage market** by outstanding balance at end of 2025; Ginnie Mae guarantees roughly another **20%**; banks hold ~22% on portfolio; the remainder is private-label/other [source 15] |
| **Conforming loan limit** | The maximum loan size Fannie/Freddie can buy in a given county | Set annually by FHFA off its House Price Index | **$832,750 baseline for 2026** (up from $806,500 in 2025), with a high-cost-area ceiling of **$1,249,125** (150% of baseline) [source 16] |

A loan above the conforming limit is a **jumbo loan** and cannot be sold to Fannie/
Freddie; it is held on a bank's balance sheet or securitized privately. A loan insured
by FHA (Federal Housing Administration, for lower-down-payment/lower-credit borrowers),
guaranteed by VA (Department of Veterans Affairs, for veterans), or guaranteed by USDA
(Department of Agriculture, for eligible rural properties) is a **government loan** and
is typically securitized through Ginnie Mae rather than sold to Fannie/Freddie.

## 2. The lifecycle / process spine

Nineteen stages, start to finish. "Business day" has a specific legal meaning here —
under Regulation Z, for the disclosure-timing rules below it means *every calendar day
except Sundays and the federal holidays listed in 5 U.S.C. 6103(a)* — so a Friday
application means the Loan Estimate is due Monday, not the following Friday, and a
Saturday counts as a business day for this purpose even though most lenders are closed.

| # | Stage | Trigger | Owner role | Typical duration | Artifact produced | What makes it stall |
|---|---|---|---|---|---|---|
| 1 | **Lead** | Consumer inquiry (referral, ad click, portal form, open house) | Loan officer (MLO) / LO assistant | Minutes to months of nurture | CRM record, initial contact | Lead never gets a live call-back; median lender response time to web leads is often hours, not the minutes competitive pressure demands [unverified — no clean citation this session] |
| 2 | **Pre-qualification vs pre-approval** | Borrower wants a number before house-hunting | Loan officer | Pre-qual: minutes (self-reported numbers, no verification). Pre-approval: hours to 1-2 days (credit pulled, some docs reviewed, often AUS-run) | Pre-qual letter (soft, unverified) or pre-approval letter (harder, used to compete on offers) | Borrower gives incomplete/optimistic numbers at pre-qual that don't survive verification later, blowing up the file after an offer is already accepted |
| 3 | **Application** (URLA / Form 1003 — Uniform Residential Loan Application) | Borrower submits full application, triggering federal application-received obligations | Loan officer takes it; processor picks it up | Same day to a few days | Completed URLA (Fannie/Freddie Form 1003), triggers "application" definition under Reg Z/RESPA (6 data points: name, income, SSN, property address, estimated value, loan amount) | Missing one of the 6 trigger fields technically isn't yet an "application," which lenders sometimes use (deliberately or not) to delay the disclosure clock |
| 4 | **Disclosures** | Application received (the 6 data points above) | System-generated, compliance-reviewed | **Loan Estimate (LE) must be delivered or placed in the mail within 3 business days of application** (TRID — TILA-RESPA Integrated Disclosure rule) | Loan Estimate (standardized 3-page form: rate, payment, closing costs, cash to close) | Any missed field forces a corrected LE and a compliance review; mailing (vs. e-delivery with e-consent) adds a 3-business-day mailbox-rule presumption on top |
| 5 | **Processing** | File handed from LO to processor | 1-3+ weeks, volume-dependent | Document collection: pay stubs, W-2s, bank statements, verification of employment (VOE) and verification of deposit (VOD), 4506-C-authorized tax transcript request to the IRS | A complete, underwriter-ready file | This is the single biggest source of drudgery in the entire chapter — see Section 4. Borrowers don't respond, third parties (HR departments, banks) are slow, self-employed income requires manual cash-flow analysis |
| 6 | **Appraisal ordering** | Processor or automated system orders via an AMC (appraisal management company — a middleman required by appraiser-independence rules, see Section 7) | AMC assigns to a licensed appraiser; typical turn time days to ~2 weeks depending on market and property type | Appraisal desk coordinator / AMC coordinator | Uniform Residential Appraisal Report (Form 1004, being replaced by the dynamic URAR under UAD 3.6 — see Section 5) | Appraiser can't get access, comps are thin in a rural/unusual market, or the value comes in below the contract price ("low appraisal"), which can kill or resize the whole loan |
| 7 | **Underwriting** | Complete file submitted (or auto-submitted from the LOS) | Underwriter, assisted by an AUS (automated underwriting system — Desktop Underwriter for Fannie Mae loans, Loan Product Advisor for Freddie Mac loans, GUS for USDA, TOTAL Scorecard-driven for FHA) | AUS run: seconds. Human underwriter review layered on top: hours to a few days per file, longer under volume | AUS findings (Approve/Eligible, Refer, etc.) plus the underwriter's own risk write-up; manual underwriting (no AUS approval — used for thin-file or program-ineligible borrowers) is far slower and entirely judgment-based | AUS returns "Refer" instead of "Approve" for any number of reasons (DTI, reserves, collateral), kicking the file to full manual underwriting |
| 8 | **Conditional approval** | Underwriter issues a decision | Underwriter | Same day as underwriting decision | List of "conditions" — specific additional documents or clarifications required before the loan can close | A vague or boilerplate condition ("explain large deposit") triggers a slow round-trip instead of a specific, satisfiable ask |
| 9 | **Condition clearing** | Conditional approval issued | Processor (chasing), underwriter (reviewing/clearing) | Days to weeks — this is the grind stage, covered in full depth in Section 4 | Cleared conditions, updated file | The core drudgery of the entire mortgage industry: re-requesting the same document because a bank statement's page 3 of 6 was missing, re-verifying a deposit source, chasing a divorce decree or LOX (letter of explanation) |
| 10 | **Clear to close (CTC)** | All conditions satisfied and re-reviewed | Underwriter (final sign-off), often a "final CTC" or "sign-off underwriter" role at larger shops | Should be immediate once truly clear; in practice hours to 1-2 days for final QC pass | CTC notice to LO/processor/closer | A condition thought cleared turns out incomplete on final review ("stipulation bounce-back"), or a last-second credit re-pull shows new debt |
| 11 | **Closing Disclosure (CD) 3-day rule** | CTC issued | Closer, compliance | **Borrower must receive the CD at least 3 business days before consummation (signing).** Certain changes (APR moves >1/8 percentage point for most loans, a prepayment penalty is added, or the loan product changes) legally **reset** this 3-day clock | Closing Disclosure (standardized form mirroring the LE, showing final numbers) | Any late-breaking fee change or rate change forces re-disclosure and can push the closing date, which is why closing dates "fall out" and rate locks expire |
| 12 | **Closing / funding** | 3-day CD period satisfied | Closer prepares the docs; funder authorizes and sends the wire; a doc drawer prepares the note/deed package; often a separate title/escrow closing agent or attorney conducts the actual signing (state-dependent — some states are attorney-closing states) | Signing itself: under an hour. Funding (wire release): same day to next business day | Signed note, deed of trust/mortgage, and the actual disbursed wire | Last-minute title issue, a wire sent to the wrong/fraudulent account (wire fraud is a live, serious risk in this stage), or a signing agent finds an unsigned/misdated page |
| 13 | **Post-close QC** | Loan funded | QC auditor / post-closer | Days to weeks after funding, often sampled rather than 100% | QC audit report; a discretionary full-file "pre-fund" QC also happens on a sample before some closings | Investor/GSE quality requirements demand a minimum QC sample (commonly cited as a 10% post-close sample industry-wide) [unverified — sourced convention, not confirmed this session]; a defect found here can force a loan buyback demand from the investor months later |
| 14 | **Sale on the secondary market** | Loan funded and QC'd | Secondary marketing / capital markets / lock desk analyst | Days to a few weeks after closing, often pooled into a scheduled securitization | Sale to Fannie Mae, Freddie Mac, Ginnie Mae (via MBS pooling), or a private investor; MISMO-formatted ULDD data file accompanies delivery | A data mismatch between the loan file and the ULDD delivery file bounces the loan out of the pool and back to the lender for correction |
| 15 | **Servicing transfer and boarding** | Loan sold with servicing released, or bulk MSR sale | MERS administrator (updates the Mortgage Electronic Registration System record of who owns/services the loan), servicing boarding team at the new servicer | Weeks of lead time; a hard "boarding date" cutover | Updated loan record in the new servicer's system (commonly Black Knight MSP, now owned by ICE — see Section 6); "goodbye letter" (old servicer) and "hello letter" (new servicer) to the borrower | Data doesn't map cleanly between the old and new servicing systems' field structures — a chronic, well-documented failure point that regulators specifically scrutinize (see Section 7, RESPA servicing-transfer rules) |
| 16 | **Payment servicing** | Boarding complete | Servicing CSR, payment processing team | Monthly, for the 15-30 year life of the loan | Payment posting, borrower statements, investor remittance | Misapplied partial payments, suspense-account handling errors |
| 17 | **Escrow analysis** | Annual (or triggered by a tax/insurance change) | Escrow analyst | Once/year per loan, industry-wide, all at once around a servicer's chosen cycle month | Escrow analysis statement showing the new monthly payment (principal+interest+escrow) | Tax and insurance bills arrive on different schedules from different counties/insurers with no standard feed, forcing manual reconciliation at scale |
| 18 | **Default servicing / loss mitigation** | Borrower misses a payment | Collections specialist (early-stage), then loss mitigation specialist | Servicer must attempt live contact by day 36 of delinquency and, if applicable, may not start foreclosure before day 121 (Regulation X, 12 CFR 1024.41 — see Section 7) | Forbearance agreement, repayment plan, or trial/permanent loan modification | Borrower doesn't return the loss-mitigation application packet, or returns it with missing pages, restarting the review clock |
| 19 | **Foreclosure** | Loss mitigation exhausted or borrower unresponsive, and delinquency has passed the legal floor above | Foreclosure specialist, outside foreclosure counsel | Months (judicial-foreclosure states) to about a year+ depending on state; judicial states (courts involved) are categorically slower than non-judicial (trustee-sale) states | Foreclosure sale, REO (real-estate owned) asset if unsold at auction | State law variance is total — every stage of this process is state-specific, which is why foreclosure is one of the least standardizable parts of the entire industry |

## 3. Role inventory

Twenty-nine roles, grouped by where they sit on the spine in Section 2. "Licence/cert
required" is a hard legal gate in the US (see Section 7 for what triggers SAFE Act/NMLS
licensing); where none is listed, the role can legally be staffed by anyone, including an
unlicensed offshore team — which is exactly why so much of this vertical has already
moved to BPO (business process outsourcing — an external company that performs the back-
office work under contract, without the client's brand).

### Sales / origination

| Role | Also called | Seniority | Licence/cert required | Typical comp (US / India where known) | Headcount ratio | What they own |
|---|---|---|---|---|---|---|
| Loan officer (MLO) | Mortgage loan originator, LO | Junior to senior/producing | NMLS license (state) or federal registration (SAFE Act) — mandatory for anyone who "takes an application" or "offers/negotiates" terms, see Section 7 | Median $76,690/yr across all loan-officer employment, 283,000 jobs in the US (BLS, 2025 estimate; heavily commission-weighted in mortgage specifically, so top producers earn far more and this median likely understates mortgage-specialist pay) [source 17] | 1 LO can run anywhere from a handful to 20+ active files depending on team support | The borrower relationship, the rate lock, the sale |
| LO assistant (LOA) | Loan officer assistant, junior LO | Junior | Licensing requirements vary — an LOA doing purely clerical/administrative work is exempt, but the moment they discuss rates/terms with a borrower they cross into needing an NMLS license themselves (Reg Z §1026.36(a) — see Section 7) | No reliable public figure found this session | Often 1 LOA per 1-2 LOs on a producing team | Pipeline admin, scheduling, document chasing on behalf of the LO |
| Mortgage broker | Broker, TPO (third-party originator) | Owner-operator to large multi-LO shop | State broker license + individual NMLS for every originating LO in the shop | No reliable public figure found this session (highly variable — broker profit is the spread between what the wholesale lender pays and what the broker charges, net of overhead) | — | Shopping the loan across wholesale lenders for the best execution; never funds the loan itself |

### Processing / underwriting

| Role | Also called | Seniority | Licence/cert required | Typical comp (US / India where known) | Headcount ratio | What they own |
|---|---|---|---|---|---|---|
| Loan processor | Mortgage processor | Junior | None federally required (processors are typically exempt from NMLS as long as they stay clerical and don't negotiate terms) | [unverified, industry-recall] roughly $45,000-$65,000/yr base in the US | Commonly cited as managing 15-30+ active loans at a time in a healthy pipeline, with reviews describing pipelines of 40-80+ at overworked shops (see Section 4) | Assembling the complete, underwriter-ready file |
| Senior processor | Lead processor | Mid | Same as above | [unverified, industry-recall] roughly $55,000-$75,000/yr | Same range, often the escalation point for the team's hardest files | Complex files (self-employed income, multiple properties), mentoring junior processors |
| Junior underwriter | Underwriter trainee, associate underwriter | Junior | Working toward DE certification if FHA-focused; otherwise no federal licence required, but nearly always requires lender-specific sign-off authority that scales with experience | No reliable public figure found this session | Lower per-day file count than a full underwriter while learning | Straightforward conventional files under a senior underwriter's authority |
| Underwriter | Mortgage underwriter, credit underwriter | Mid to senior | For FHA loans, must be **DE (Direct Endorsement)-certified** — an individual HUD/FHA authorization that lets the underwriter approve FHA loans on HUD's behalf without HUD re-reviewing every file; VA has an analogous **SAR (staff appraisal reviewer)/LAPP (Lender Appraisal Processing Program)** authority structure | [unverified, industry-recall] roughly $70,000-$100,000+/yr; DE-certified and jumbo/non-QM underwriters command a premium | Cited industry convention: roughly 2-3+ new full underwrites per day, with a running pipeline of active conditional files layered on top (see Section 4) | The credit decision and its documented rationale — the one artifact regulators (Section 7) actually inspect |
| Signing underwriter | Final sign-off underwriter, CTC underwriter | Senior | Same as underwriter, often additionally delegated final "clear to close" authority by the lender/investor | [unverified] senior-band pay, above staff underwriter | One final review pass per file at CTC | The last human check before a loan is legally clear to close |

### Closing / funding / post-close

| Role | Also called | Seniority | Licence/cert required | Typical comp (US / India where known) | Headcount ratio | What they own |
|---|---|---|---|---|---|---|
| Closer | Loan closer | Mid | None federally required | [unverified, industry-recall] roughly $50,000-$70,000/yr | Dozens of files/month depending on shop size | Preparing the Closing Disclosure and closing package accurately against the underwriting approval |
| Funder | Loan funder | Mid | None federally required | [unverified, industry-recall] roughly $55,000-$75,000/yr | — | Authorizing and releasing the wire — the single highest-stakes manual action in the whole process (wire fraud risk) |
| Doc drawer | Closing document specialist | Junior-mid | None federally required | No reliable public figure found this session | — | Generating the note, deed of trust/mortgage, and the rest of the state-specific closing document set |
| Post-closer | Post-closing specialist | Junior-mid | None federally required | No reliable public figure found this session | — | Confirming the closed file is complete and investor-deliverable before shipping |
| Shipper | Loan shipper | Junior-mid | None federally required | No reliable public figure found this session | — | Physically/electronically delivering the closed loan package to the investor/custodian |
| QC auditor | Quality control auditor, post-close QC analyst | Mid-senior | None federally required, but works directly against agency (Fannie/Freddie/Ginnie/investor) QC guidelines | No reliable public figure found this session | Samples a subset of closed loans (industry convention cites a 10% post-close sample; not independently confirmed this session) | Catching defects before an investor does — a defect found by the investor becomes a costly buyback demand |
| Compliance analyst | Regulatory compliance analyst | Mid-senior | Often holds or works toward a compliance certification (e.g., CRCM — Certified Regulatory Compliance Manager); no single federal license mandates the role itself | [unverified, industry-recall] roughly $70,000-$100,000/yr | — | TRID/RESPA/ECOA/HMDA rule adherence across the whole pipeline |

### Secondary marketing, appraisal, and title/HOA support

| Role | Also called | Seniority | Licence/cert required | Typical comp (US / India where known) | Headcount ratio | What they own |
|---|---|---|---|---|---|---|
| Secondary marketing analyst | Lock desk analyst, capital markets analyst | Mid-senior | None federally required; heavy quantitative/finance background typical | [unverified, industry-recall] roughly $80,000-$130,000+/yr | Usually a small, centralized team covering the whole lender's pipeline | Pricing, rate locks, and the eventual sale of closed loans into MBS or to investors |
| Appraisal desk coordinator | Appraisal coordinator | Junior-mid | None federally required (the appraiser they work with is separately state-licensed/certified) | No reliable public figure found this session | — | Ordering and tracking appraisals through the AMC, chasing turn times |
| AMC coordinator | Appraisal management company coordinator | Junior-mid | AMCs themselves are state-registered/licensed entities; individual coordinators typically are not | No reliable public figure found this session | — | Assigning appraisers, doing the compliance/completeness review of the report before it reaches the lender |
| Condo review specialist | Condo project reviewer | Mid | None federally required; works against Fannie/Freddie condo project eligibility guidelines | No reliable public figure found this session | — | Reviewing condo questionnaires and project documentation against owner-occupancy, litigation, and insurance requirements |
| HOA cert chaser | HOA questionnaire coordinator | Junior | None federally required | No reliable public figure found this session | — | The specific, narrow job of getting a homeowners' association to fill out and return its certification/questionnaire — frequently the single slowest artifact in a condo purchase |
| Verification specialist | VOE/VOD specialist | Junior | None federally required | No reliable public figure found this session | — | Placing and following up on employment/deposit verification requests to employers and banks |

### Servicing

| Role | Also called | Seniority | Licence/cert required | Typical comp (US / India where known) | Headcount ratio | What they own |
|---|---|---|---|---|---|---|
| Servicing CSR | Customer service representative, borrower services rep | Junior | None federally required (some states license "debt collectors," which can sweep in default-stage contact — see Section 7) | [unverified, industry-recall] roughly $35,000-$50,000/yr | Call-center scale — hundreds of loans per rep across a shift | Routine borrower questions, payment issues, payoff quotes |
| Escrow analyst | Escrow specialist | Mid | None federally required | No reliable public figure found this session | Often thousands of loans per analyst during the annual escrow-analysis cycle (highly automatable in principle; still manual exception-handling in practice) | Reconciling actual tax/insurance disbursements against projections and resetting the monthly payment |
| Collections / default specialist | Early-stage collector | Junior-mid | Some states require a collector-specific license/registration; FDCPA-adjacent rules apply in default-stage contact | [unverified, industry-recall] roughly $35,000-$55,000/yr | High call volume, similar to servicing CSR | First contact after a missed payment, before full loss mitigation engages |
| Loss mitigation specialist | Home retention specialist, workout specialist | Mid | None federally required; heavily bound by Reg X (12 CFR 1024.41) procedural deadlines (see Section 7) | [unverified, industry-recall] roughly $45,000-$65,000/yr | Caseloads commonly cited in the hundreds of active files per specialist [unverified] | Forbearance, repayment plans, loan modifications — the human relationship at the center of Section 9 |
| Foreclosure specialist | Default/foreclosure coordinator | Mid-senior | None federally required directly, but works in lockstep with licensed foreclosure counsel (a state-specific legal requirement) | No reliable public figure found this session | — | Tracking a foreclosure file through state-specific judicial or non-judicial process milestones |
| Investor reporting analyst | Investor accounting analyst | Mid | None federally required | No reliable public figure found this session | — | Monthly remittance and reporting to Fannie Mae/Freddie Mac/Ginnie Mae/private investors on the loans a servicer services on their behalf |
| MERS administrator | MERS certifying officer | Mid | Must be individually appointed/certified as a MERS certifying officer by the member institution — a MERS-specific credential, not a government licence | No reliable public figure found this session | — | Keeping the Mortgage Electronic Registration System (MERS — the industry's shared registry of who currently owns/services each loan) record accurate through every sale/transfer |

### Offshore mortgage BPO (business process outsourcing)

| Role | Also called | Seniority | Licence/cert required | Typical comp (US / India where known) | Headcount ratio | What they own |
|---|---|---|---|---|---|---|
| Offshore mortgage BPO analyst (India/Philippines) | Mortgage back-office analyst, KPO (knowledge process outsourcing) analyst | Junior-mid | None — this is precisely the point: none of the above US federal licensing regimes reach an offshore analyst who never "takes an application" or "negotiates terms" with a US consumer, so BPO firms staff processing-adjacent and QC-adjacent tasks (document indexing, data entry/re-key, income calculation support, QC review, title/HOA follow-up) rather than licensed origination or default-servicing decisioning | [unverified, industry-recall] roughly INR 3-8 lakh/yr (~$3,600-$9,600) for an entry/mid analyst, roughly INR 8-18 lakh/yr for a team lead/SME at a major BPO (Firstsource, Genpact, WNS, Infosys BPM, Cognizant, TCS, Wipro) — this is a rough band from general market knowledge, not a sourced figure this session | A single mid-size mortgage BPO engagement commonly runs into the hundreds to low thousands of FTEs (full-time equivalents) per client relationship at scale [unverified] | Document indexing/classification, data re-entry into the LOS, income-calc worksheets, QC checklists, HOA/title follow-up calls, servicing back-office support — see Section 4 for a full night-shift day-in-the-life |

The **global mortgage outsourcing market was valued at roughly $10.4 billion in 2025 and
is projected to reach $25.3 billion by 2032** (11.7% CAGR) per market-research coverage
[source 18] — this is third-party research aggregation, not a regulator or company
filing, so treat the specific dollar figures as directional rather than precise. Named
providers researched this session with a genuine, structural US mortgage BPO
specialization include **Firstsource** (built through its acquisition of ISGN's BPO
division), **Sutherland Global**, **WNS**, **Infosys BPM**, **Visionet Systems** (which
operates a mortgage BPO delivery center in Bangalore), **Altisource** (historically spun
out of, and long affiliated with, servicer Ocwen/Onity), **Cognizant, TCS, Wipro,
Genpact, SLK Global, Sourcepoint, Indecomm, Mphasis, and Conduent** also appear as
mortgage-BPO/outsourcing providers in industry coverage [source 19]. Several major US
mortgage servicers and originators also run **captive offshore centers** (a wholly-owned
subsidiary doing the same work in-house rather than through a third-party BPO contract)
rather than only third-party BPO contracts; this session did not verify specific captive-
center names or headcounts and that claim should be treated as an unconfirmed industry
pattern, not a sourced fact.

## 4. Day in the life

Six roles: loan processor, underwriter, closer/funder, loan officer, default-servicing/
loss-mitigation rep, and an offshore mortgage BPO analyst in India. The processor and
underwriter entries are the deepest in this chapter on purpose — per the operating
brief for this guide, they are the highest-value content here.

### Loan processor — day in the life

**Who they are.** Usually no specific degree requirement; common entry paths are prior
title-company, bank-teller, or customer-service work, or a for-profit "mortgage
processing certificate" course. No federal license is required as long as the processor
stays clerical (the moment a processor starts discussing rate/term options with a
borrower, they legally become a loan originator under Reg Z §1026.36 — see Section 7).
Measured on: number of files closed per month, average turn-time (file-received to
submitted-to-underwriting), how fast conditions get cleared, and QC/audit error rate on
their files.

**Their stack.** The LOS (loan origination system) — most commonly **ICE Mortgage
Technology's Encompass**, which owns roughly half the US LOS market [source 20] — is
the system of record: it holds the loan file, the document imaging, the condition/task
list, and the audit trail. Layered on top: verification tools (**The Work Number**
from Equifax for employment/income; **Truv**, **Plaid**, or **Finicity** for
consumer-permissioned bank/payroll data); a document-classification/data-extraction tool
such as **Ocrolus** where the lender has bought in; a 4506-C tax-transcript ordering
portal (through an IRS Income Verification Express Service — IVES — participant); an
e-signature tool (commonly **DocuSign**); a phone/dialer and email; and, very often, a
side spreadsheet the processor keeps personally because the LOS's own pipeline view
doesn't slice the data the way they need day-to-day.

**A typical day.**
- **7:30-8:00am** — Log in, review what underwriting decided or conditioned overnight
  on submitted files, and triage a pipeline that industry job postings and pipeline-
  management guidance describe as commonly **15-30+ active loans at a healthy shop, and
  40-80+ at an overworked one** [source 21, source 22] — each file sitting at a
  different stage (waiting on docs, ready to submit, conditions posted, ready to close).
- **8:30-10:00am** — Work the "stips" (stipulations/conditions) queue: call or email
  borrowers for missing or incomplete documents (a bank statement PDF missing page 3 of
  6 is a constant, specific failure mode), re-order a Verification of Employment (VOE)
  that came back stale, chase a self-employed borrower for a second year of business tax
  returns.
- **10:00am-12:00pm** — Assemble a file for submission to underwriting: re-key data from
  scanned pay stubs, W-2s, and bank statements into LOS fields that the system's
  automated import either doesn't support or failed to parse cleanly — a self-employed
  borrower's tax-return package alone routinely means **re-entering 30-40+ individual
  figures** (income lines, deduction add-backs, K-1 amounts) by hand into the file
  before it can even reach an underwriter's desk.
- **12:00-1:00pm** — Lunch, frequently eaten at the desk while still answering borrower
  calls, per the same volume pressure described in job postings and reviews.
- **1:00-3:00pm** — Outbound calls: to borrowers for documents, to employers' HR/payroll
  departments for VOE, to banks for Verification of Deposit (VOD). A processor working a
  full pipeline can easily place **40-60 calls in an afternoon and reach 10-15 live
  contacts**, with the rest going to voicemail or a phone tree — this specific figure is
  this chapter's own reasonable estimate based on the surrounding job-description and
  review evidence, not a directly sourced count, and should be read as illustrative
  rather than an audited statistic.
- **3:00-4:30pm** — Process the day's condition responses: cross-check a large deposit
  against the borrower's explanation letter (LOX — letter of explanation), confirm a
  gift-letter donor's ability to gift by pulling their bank statement too, re-verify that
  a paid-off collection actually shows as paid in an updated credit supplement.
- **4:30-5:30pm** — Update the pipeline report (in the LOS and, often, in a parallel
  spreadsheet for the team lead), flag any file at risk of missing its scheduled closing
  date, and escalate anything genuinely stuck.
- **5:30-6:00pm+** — Clear the email backlog that built up while on calls all day.

**Their week/month.** A Monday pipeline-review meeting with the team lead or branch
manager; a push in the final days of the month to get as many files to close as possible
(closings drive revenue recognition for the period); periodic mandatory re-training
whenever a GSE updates its Selling Guide (Fannie Mae) or seller/servicer guide (Freddie
Mac) in a way that changes documentation requirements.

**What they complain about.** Glassdoor reviews for mortgage-processor roles describe
pipelines of **"80+ loans," commissions "as low as $0-$30 for extensive work"** on
problem files, being handed **angry customers transferred from other processors'
queues**, being **"constantly micromanaged"** with management **"pinging employees
within 15-30 minutes if they're not logged in,"** and **"zero work-life balance"**
[source 23]. One PHH Mortgage review is titled, verbatim, *"The most stressful job I ever
had"* [source 23].

**Repetitive-work inventory.**

| Task | Frequency | Minutes each | Why it's still manual | Data in -> data out |
|---|---|---|---|---|
| Re-key pay stub / W-2 / bank statement figures into LOS fields | Every file, often multiple times per file as updated docs arrive | 10-30 min depending on document count | LOS automated import (OCR/data-extraction) either isn't licensed at that lender, doesn't cover that document type, or fails on real-world scan quality (skewed pages, phone-camera photos, redactions) | PDF/image -> structured LOS data fields |
| Order and follow up on VOE/VOD | Every file, sometimes 2-3x if the first request stalls | 5-15 min per touch, spread over days of waiting | Many employers still respond only by fax, mailed letter, or a third-party portal the processor must separately log into (e.g., The Work Number) rather than a single unified API | Phone/fax/portal response -> LOS condition cleared |
| Order 4506-C tax transcript and reconcile against submitted returns | Every file where tax returns are used for income | 15-30 min to reconcile once the transcript returns | Transcript format and the borrower's own return don't line up field-for-field without a human doing the mapping | IRS transcript PDF + borrower's return -> confirmed qualifying income |
| Chase incomplete bank-statement uploads | Very common — most files at least once | 10-20 min per round-trip | Borrowers routinely upload partial PDFs (missing a page, wrong month, wrong account) via a portal that doesn't validate completeness at upload time | Borrower portal upload -> completeness check -> re-request |
| Request and review Letters of Explanation (LOX) | Most files have at least one (credit inquiry, large deposit, address discrepancy, employment gap) | 10-20 min to request, more to review and judge sufficiency | The judgment of whether an explanation is "sufficient" is inherently a text-comprehension task written into guidelines qualitatively, not as a bright-line rule | Borrower narrative + supporting doc -> underwriter-ready explanation |
| Manually chase HOA/condo questionnaire | Every condo/HOA-governed property | 15-60+ min of follow-up spread over days-to-weeks | HOA management companies are frequently small, understaffed, and unresponsive to a form they receive from a stranger with no ongoing relationship | Emailed/faxed HOA form request -> completed questionnaire |
| Update pipeline status across LOS + personal/team tracking spreadsheet | Daily, per active file | 2-5 min per file, multiplied by pipeline size | The LOS's built-in pipeline views don't match how individual teams actually want to slice/prioritize their work, so a shadow spreadsheet persists at most shops | LOS status field -> spreadsheet row |

### Underwriter — day in the life

**Who they are.** Typically several years as a processor or credit analyst first; for
FHA-insured loans, must hold **DE (Direct Endorsement) certification** — a HUD
authorization (built on required experience plus HUD-specified training) that lets the
underwriter approve FHA loans on HUD's own behalf without HUD re-reviewing every file;
VA loans have an analogous staff appraisal reviewer (SAR)/Lender Appraisal Processing
Program (LAPP) structure. Measured on: loans underwritten per day, turn-time (submission
to decision — commonly contracted internally as a 24-48 hour SLA), the specificity and
defensibility of the conditions/adverse-action reasons they write (a direct regulatory
exposure point, see Section 7), and QC audit findings on closed files.

**Their stack.** The LOS (Encompass, again dominant); the relevant **AUS (automated
underwriting system)** — **Desktop Underwriter (DU)** for a loan going to Fannie Mae,
**Loan Product Advisor (LPA)** for one going to Freddie Mac, **GUS** for USDA, or a
**TOTAL Scorecard**-driven engine for FHA; **Collateral Underwriter**, Fannie Mae's own
automated appraisal risk-scoring tool, to flag comps/adjustments for manual review; an
income-calculation aid — either a vendor tool or an internal spreadsheet built around
**Fannie Mae Form 1084** for self-employed cash-flow analysis; document-extraction
tooling (Ocrolus or similar, where licensed); and fraud/red-flag screening tools.

**A typical day.**
- **7:00-8:00am** — Review the overnight AUS re-runs and whatever landed in the new-
  submission queue while the underwriter was out.
- **8:00-11:00am** — First-pass underwrite of new submissions. Industry job postings
  describe an expectation of **2-3+ new full underwrites per day** depending on file
  complexity, alongside a standing requirement to **maintain 24-hour turn times on all
  files and clear conditions within 24 hours** [source 24]. For each file: read the AUS
  findings (Approve/Eligible, Refer, etc.), then manually verify that the actual
  submitted documentation supports every number the AUS assumed — the AUS trusts the
  data it was given; the underwriter's job is confirming that data is real.
- **11:00am-12:30pm** — Condition-review queue: files a processor has marked as having
  cleared conditions come back to the underwriter for final sign-off or bounce-back if
  the "cleared" condition doesn't actually satisfy the original ask.
- **12:30-1:15pm** — Lunch, frequently worked through given the turn-time pressure
  described above.
- **1:15-3:00pm** — The hardest file of the day: a self-employed borrower requiring a
  full **Form 1084 cash-flow analysis** — walking two years of personal (Form 1040) and,
  where applicable, business (Schedule C, partnership, or S-corp) tax returns, K-1s, and
  supporting schedules line-by-line to back out one-time and non-cash items and arrive at
  a stable, qualifying monthly income figure. This is one of the most-cited genuinely
  manual analytical tasks in mortgage underwriting: the form itself is a worksheet, not a
  form the IRS or the business ever filled out consistently, and every business's tax
  return is organized slightly differently, so the mechanical act of "find the right
  number on the right line and carry it to the right cell" resists full automation even
  though the arithmetic once the numbers are in hand is simple [source 25].
- **3:00-4:30pm** — Continue new submissions and condition reviews; field escalations
  from processors or loan officers about files at risk of missing a scheduled closing
  date.
- **4:30-5:30pm** — Documentation: write up underwriting comments and rationale for the
  file's permanent audit trail — partly a compliance requirement (a regulator or QC
  auditor must later be able to reconstruct *why* the loan was approved and, on any
  denial, exactly *why* under ECOA/Regulation B, see Section 7) and partly institutional
  self-protection against a future investor buyback claim.
- **5:30pm+** — End-of-day pipeline count review; many underwriters describe being
  informally on-call for clear-to-close escalations even after logging off.

**Their week/month.** Mandatory training whenever Fannie Mae's Desktop Underwriter or
Freddie Mac's Loan Product Advisor releases a version update or guideline change;
periodic review of the underwriter's own QC audit scorecard; tracking lender-specific
"overlays" (additional restrictions a lender adds on top of the baseline GSE/FHA/VA
guidelines) as they change.

**What they complain about.** Glassdoor reviews for mortgage-underwriter roles describe
**"very stressful environments with multiple priorities and emergencies on a daily
basis,"** **"zero work/life balance,"** a **"gotcha' mentality from management,"**
being **"unsure if there will be another last-minute condition or document that could
prevent on-time file closure,"** teams that are **"way understaffed and over-promised,"**
and underwriters **"treated as disposable and expendable with constant staff changes due
to layoffs and terminations"** [source 26].

**Repetitive-work inventory.**

| Task | Frequency | Minutes each | Why it's still manual | Data in -> data out |
|---|---|---|---|---|
| Verify every income document line-by-line against the 1003/AUS data entry | Every file | 15-45 min depending on income complexity | The AUS only knows what was typed into it; someone has to confirm the typed numbers match the real documents | Paystub/W-2/bank statement -> confirmed AUS input |
| Form 1084 self-employed cash-flow analysis | Every file with self-employment or significant K-1/rental income | 30-90+ min per file | No standard machine-readable format for how a small business's tax return is organized; add-backs and one-time items require judgment calls the guidelines describe qualitatively | 2 years of tax returns + schedules -> one stable qualifying-income number |
| Review appraisal comps/adjustments for reasonableness | Every file | 10-30 min, more if Collateral Underwriter flags it | Judging whether a comp adjustment is defensible is a qualitative valuation judgment, not a bright-line check | Appraisal report + CU risk flags -> accept/challenge decision |
| Write specific, defensible conditions and (on denial) adverse-action reasons | Every file | 5-20 min per condition/reason | A regulator-facing requirement (ECOA/Reg B, CFPB Circulars 2022-03 and 2023-03 — Section 7) that a generic or boilerplate reason cannot satisfy | Underwriting judgment -> specific written condition/reason text |
| Re-underwrite after a "changed circumstance" | Common — new debt, new employer, a fresh credit re-pull showing a new inquiry, a rate/program change | 15-45 min | Any material change legally requires re-verification and can force TRID re-disclosure (Section 2, stage 11) | Updated data -> revised decision + revised disclosures |
| Reconcile AUS "verify" conditions against actual submitted docs | Every file | 10-20 min per AUS message | The AUS states *what* must be verified in templated language; matching that to the specific document actually provided is manual | AUS message text + document -> cleared/not-cleared judgment |

### Closer/funder — day in the life

**Who they are.** Often promoted internally from processor ranks after demonstrating
accuracy under pressure; no federal license required. Measured on: closings executed
without a post-close QC defect, wire accuracy (there is effectively zero tolerance for
error here), on-time funding rate, and how rarely a clear-to-close file slips its
scheduled closing date.

**Their stack.** The LOS (Encompass) for the loan file and closing document generation;
a dedicated wire-origination/verification workflow through the lender's treasury/banking
system; e-closing and remote-online-notarization tooling where used (e.g., **Snapdocs**,
**DocMagic**, or a notarization vendor); and constant phone/email coordination with the
title or escrow company (or, in attorney-closing states, closing counsel) that actually
conducts the signing.

**A typical day.**
- **7:30-9:00am** — Review every closing scheduled for today and tomorrow, confirm
  clear-to-close status on each, and check for any last-minute title or condition issue.
- **9:00-11:00am** — Finalize Closing Disclosures (CDs) for tomorrow's closings: balance
  every fee line against both the last underwriting approval and the title/escrow
  company's own closing statement, then send the CD to the borrower to start (or confirm
  satisfaction of) the mandatory 3-business-day receipt period (Section 2, stage 11).
- **11:00am-1:00pm** — Coordinate signing logistics with the title/escrow closer or
  attorney, and resolve any last discrepancy — a fee that moved, a misspelled name on the
  deed, a payoff figure that needs updating.
- **1:00-2:00pm** — Lunch.
- **2:00-3:30pm** — Review the closing document package (prepared by a doc drawer, or by
  the closer directly at smaller shops): the note, the deed of trust/mortgage, and every
  state-specific form, checking each is complete and correctly dated.
- **3:30-5:00pm** — Fund today's closings: confirm the executed documents came back
  correctly signed, then release the wire. This is the single highest-stakes manual
  action in the entire origination process — wire fraud via business-email-compromise
  (an attacker impersonating the title company or lender to redirect a closing wire) is a
  well-documented risk across the real-estate closing industry, which is why funders
  are trained to verify wire instructions by calling a previously-known, independently
  verified phone number rather than trusting a new instruction received by email, even
  one that appears to come from a known contact. This session did not source a specific,
  current loss-dollar figure for mortgage-closing wire fraud and none should be inferred.
- **5:00-6:00pm** — Reconcile the day's funded loans against the wire log and flag
  anything on tomorrow's schedule that looks at risk.

**Their week/month.** A month-end closing crunch as lenders and loan officers push to
get files closed before period-end; occasional evening or weekend work around
purchase closings timed to a borrower's moving day; periodic training whenever a title
partner or the lender's own e-closing platform changes its process.

**What they complain about.** This session's search budget did not surface a
Glassdoor/Reddit thread specifically naming the closer or funder title with direct
quotes (see Section 11 for what was and wasn't checked); the adjacent processor and
underwriter reviews above describe the same closing-date pressure and understaffing
culture this role sits inside, and should be read as suggestive, not role-specific,
evidence.

**Repetitive-work inventory.**

| Task | Frequency | Minutes each | Why it's still manual | Data in -> data out |
|---|---|---|---|---|
| Balance the Closing Disclosure against the title/escrow closing statement | Every closing | 20-45 min | Two independently-prepared documents (lender's CD, title company's settlement statement) must match to the penny before either can be finalized, and the title company is a separate business with its own system | Title company settlement figures + underwriting approval -> balanced CD |
| Verify wire instructions out-of-band before release | Every wire | 5-15 min | The fraud-prevention step is deliberately a manual, human phone call precisely because it must not be automatable by whatever channel an attacker could also compromise | Bank-on-file phone number + verbal confirmation -> authorization to release |
| Re-check every closing document for correct execution/dating | Every closing | 15-30 min | State-specific notarization and execution requirements vary loan-to-loan and cannot be fully templated across jurisdictions | Signed/notarized package -> completeness/compliance check |
| Re-issue a corrected CD after a late fee or rate change | Whenever a "changed circumstance" hits this late in the file | 20-40 min, plus a fresh 3-day wait if it's a re-disclosure trigger | Same TRID re-disclosure rule as Section 2, stage 11 | Updated fee/rate data -> corrected CD + reset borrower-receipt clock |
| Track the 3-business-day CD receipt clock per file | Every file | 5 min/day of checking, compounding across a pipeline | No single shared system reliably timestamps "receipt" across e-delivery and mail scenarios without manual confirmation | Delivery method + date sent -> earliest legal closing date |

### Loan officer — day in the life

**Who they are.** Backgrounds vary widely — real-estate or banking experience, a prior
sales career, or a direct hire into a call-center-style "sales LO" track at a direct-to-
consumer lender. Requires an NMLS-licensed MLO registration (Section 7). Measured on:
units and dollar volume closed per month, **pull-through rate** (the share of locked
loans that actually reach closing, rather than falling out to a competitor or a
cancelled purchase), referral-partner (real-estate agent) satisfaction, and strict
compliance with advertising and compensation rules.

**Their stack.** A CRM built for mortgage (e.g., **Jungo**, **Surefire/Top of Mind**, or
a mortgage-specific Salesforce build) for the referral-partner and borrower pipeline; a
consumer-facing **POS (point-of-sale system)** such as **Blend**, **Maxwell**, or
**Floify** that lets the borrower self-serve document upload and status checks; the LOS
itself (Encompass) for anything that needs full loan-file access; a pricing engine
(**Optimal Blue**, **Polly**, or **Lender Price**) to check live rate sheets across
investors/programs; a dialer; e-signature; and marketing/co-marketing tools shared with
referral partners.

**A typical day.**
- **6:30-8:00am** — Check overnight rate-sheet moves, respond to early borrower texts
  and emails — borrowers actively shopping for a home expect a near-immediate response,
  especially in a competitive-offer situation.
- **8:00-10:00am** — Prospecting block: calls to real-estate-agent referral partners,
  follow-ups on warm CRM leads, and — at shops that still run this model — cold
  outreach. An LO working a real prospecting block can easily place on the order of
  **dozens of dials for a handful of live pickups**; this specific ratio is this
  chapter's own illustrative estimate consistent with the sales-heavy, high-rejection
  pattern described in industry sources, not an audited count.
- **10:00am-12:00pm** — Borrower consultations: new pre-approval conversations,
  structuring the loan-program choice (rate/term tradeoffs, points vs. lender credit),
  answering the same category of question — "how much house can I afford," "should I
  buy points" — in a personalized way each time, because compliance requirements around
  advertising and loan-level pricing resist a fully templated answer.
- **12:00-1:00pm** — Frequently a working lunch with a referral partner.
- **1:00-3:00pm** — Pipeline management: check status on files in processing/
  underwriting, relay updates to borrowers and their agents, make rate-lock or
  lock-extension decisions as needed.
- **3:00-4:30pm** — More prospecting and inbound-lead follow-up.
- **4:30-6:00pm+** — CRM hygiene, compliance training modules, and preparation for
  tomorrow's appointments.

**Their week/month.** A month-end push to lock and close as many files as possible;
realtor co-marketing events (lunch-and-learns, open-house sponsorships); pipeline
reporting to a sales manager; mandatory continuing-education hours to keep the NMLS
license current (states require annual CE).

**What they complain about.** Industry coverage on loan-officer burnout describes it as
**"a constant reality"** that starts as long hours and stress and **"can evolve into
exhaustion, irritability, and detachment"** [source 27]. Glassdoor reviews describe
**"cold calling ... non-stop, resulting in voicemails and negative responses,"** **"long
hours with no pay and draw structures that are 'a joke,'"** and the job **"consum[ing]
your life for very little pay"** at some shops, alongside high-production-pressure
complaints about **"constant client demands and market uncertainty"** wearing down even
experienced originators [source 28].

**Repetitive-work inventory.**

| Task | Frequency | Minutes each | Why it's still manual | Data in -> data out |
|---|---|---|---|---|
| Re-enter the same borrower data across CRM, POS, and LOS | Every new borrower | 10-20 min | Three separate systems from three different vendors, often without a clean bidirectional integration at that particular lender | Borrower intake conversation -> 3 separate system records |
| Check live pricing across the pricing engine for best execution | Every quote, every re-quote as rates move intraday | 5-10 min | Investor/program eligibility and pricing adjustments are numerous and change throughout the day; a defensible "best execution" answer requires checking, not recalling | Borrower profile + program eligibility -> rate quote |
| Cold calling / dialing with low live-contact rates | Daily, for shops still running an outbound sales model | Hours of a day for single-digit-percent live contact rates (illustrative estimate, not sourced) | No technology has replaced live rapport-building in mortgage sales conversion, and predictive dialers only shrink the dead-time between attempts, not the fundamental contact rate | Call list -> live conversation (rare) or voicemail (common) |
| Re-explain loan-program tradeoffs to each borrower individually | Every borrower | 15-30 min | Personalized disclosure obligations and the reality that borrowers arrive with wildly different baseline financial literacy resist a one-size template | Borrower questions -> tailored explanation |
| Chase pre-approval-letter requests against a realtor's offer deadline | Whenever a borrower is making an offer | 10-20 min, urgent/interrupt-driven | The letter has to reflect an accurate, current, underwriting-consistent number, not just a form letter | Current file status -> signed pre-approval letter |
| Track and log NMLS continuing-education hours | Annually per state license held | Hours per year, in a handful of sittings | State-by-state CE requirements and course-provider systems aren't unified | Completed course -> state license renewal record |

### Default-servicing / loss-mitigation rep — day in the life

**Who they are.** Frequently sourced from banking or collections call-center
backgrounds; no federal license is required for the role itself, though default-stage
borrower contact operates inside FDCPA-adjacent rules and, in some states, a debt-
collector registration regime. Measured on: number of at-risk borrowers contacted,
resolution rate (successful workout versus foreclosure referral), strict compliance with
Regulation X's procedural deadlines (Section 7), and average handle time.

**Their stack.** The servicing system of record (commonly **Black Knight's MSP**, now
owned by ICE — Section 6) for the loan and payment history; a loss-mitigation case-
management workflow (sometimes a module inside MSP, sometimes a bolt-on); a dialer;
a document-upload portal for hardship packages; imaging/review tooling for hardship
documentation; and reference material for each investor's specific loss-mitigation
"waterfall" (Fannie Mae, Freddie Mac, FHA, VA, USDA, and private investors each publish
their own required sequence and eligibility math), plus an **NPV (net present value)**
calculation tool used to test whether a modification is worth more to the investor than
proceeding to foreclosure.

**A typical day.**
- **7:00-8:00am** — Review the overnight queue of newly-delinquent accounts requiring
  first contact under the day-36 regulatory deadline (Section 2, stage 18; Section 7),
  and pull the day's follow-up list.
- **8:00-10:00am** — Outbound calls to delinquent borrowers: explain available options,
  request a hardship/loss-mitigation application package, and manage what are often
  emotionally difficult conversations with borrowers under real financial stress.
- **10:00am-12:00pm** — Process incoming hardship packages: check completeness (hardship
  letter, income documentation, financial worksheet — the same "is this file complete"
  problem as origination-side processing, just later in the loan's life), request
  missing items, and run an initial eligibility screen against the applicable investor's
  waterfall.
- **12:00-1:00pm** — Lunch.
- **1:00-3:00pm** — Evaluate complete applications: run the required NPV/waterfall logic
  to determine which option applies — forbearance extension, repayment plan, trial
  modification, short sale, or deed-in-lieu of foreclosure — and prepare the offer
  paperwork.
- **3:00-4:30pm** — Follow up on borrowers currently in a trial-modification period,
  confirming on-time trial payments; escalate any failed trial to foreclosure referral.
- **4:30-5:30pm** — Compliance documentation: log every contact attempt and its outcome,
  since Regulation X specifically requires servicers to be able to show they attempted
  timely live contact (Section 7) — this creates the same audit-trail busywork pattern
  seen in underwriting.
- **5:30pm+** — Handle any case escalated for supervisor review.

**Their week/month.** Regulation X compliance reporting; investor-specific reporting
(for example, FHA loss-mitigation reporting obligations to HUD); recertification
whenever a temporary program is introduced or changed (disaster-related forbearance
programs are a recurring example, stood up and modified on short notice after
hurricanes, wildfires, or other declared disasters).

**What they complain about.** This session's search budget was exhausted before a
role-specific Glassdoor/Reddit search could be run for loss-mitigation/default-servicing
titles, so no direct quotes are presented here rather than inventing them — this is
flagged as a genuine gap, not a "nothing to report" finding (see the orchestrator return
notes).

**Repetitive-work inventory.**

| Task | Frequency | Minutes each | Why it's still manual | Data in -> data out |
|---|---|---|---|---|
| First-contact outreach by the Reg X day-36 deadline | Every new delinquency | 10-20 min per attempt, often several attempts logged | Live-contact requirement is specifically about reaching a person, not just sending a notice, and borrowers in distress often avoid calls | Delinquency trigger -> logged contact attempts |
| Hardship-package completeness review | Every submitted application | 15-30 min | Same missing-page/missing-document problem as origination processing, now with an added layer of borrower distress slowing response times | Uploaded package -> completeness determination |
| Run investor-specific NPV/waterfall eligibility logic | Every complete application | 20-40 min | Each investor (Fannie, Freddie, FHA, VA, USDA, private) publishes its own sequence and thresholds; a file's applicable investor determines which entire rulebook applies | Borrower financials + investor guide -> eligible option(s) |
| Track trial-modification payment compliance | Monthly, for every active trial (commonly 3 months) | 5-10 min per check per month | Payment posting and trial-tracking often live in slightly different systems that don't auto-reconcile | Payment record -> trial-compliance status |
| Log every contact attempt and outcome for the Reg X audit trail | Every contact, every file | 3-5 min per log entry | Same compliance-driven documentation burden seen in underwriting, required so a regulator can reconstruct the servicer's efforts later | Call/contact outcome -> permanent compliance log entry |

### Offshore mortgage BPO analyst (India, night shift) — day in the life

**Who they are.** Typically a bachelor's-degree graduate (commerce, business, or any
discipline) hired directly into a mortgage-focused team at a BPO/KPO (business/knowledge
process outsourcing) firm serving a US lender or servicer client under contract —
**Firstsource, WNS, Sutherland, Genpact, Infosys BPM, Cognizant, TCS, Wipro,** and
others of the roughly two dozen providers named in Section 3 all run this kind of
seat. No US licensing regime reaches this role (Section 3) precisely because the work is
scoped to stay clerical/back-office rather than borrower-facing origination or
default-servicing decisioning. Measured on: units processed per hour against a
client-set production target, a **quality score** from a separate second-level QC pass
on their own output, and SLA (service-level agreement) adherence to the contracted
turnaround time with the US client.

**Their stack.** Remote access — typically **Citrix or a VPN-based remote desktop** —
into the client's *own* systems, often the identical LOS (Encompass) or servicing
platform (MSP) that the client's US-based staff use, rather than a separate BPO-owned
copy, specifically so loan data never has to leave the client's environment; a
client-specific SOP (standard operating procedure) reference document for that exact
process; an internal ticketing/production-tracking tool; document-classification tooling
such as Ocrolus where the client has licensed it (increasingly meaning the analyst's job
is QC-checking the AI tool's classification rather than doing primary classification by
hand); and email/communication tooling scoped to internal use, since these roles are
usually not permitted direct contact with the US borrower.

**A typical day (shift timed to US business hours — commonly roughly 6:30pm-3:30am or
8:00pm-5:00am IST, depending on which US time zone the client account covers).**
- **6:30pm** — Shift start: log into the VPN, read handoff notes from the outgoing
  team, and check the night's production target.
- **7:00-9:00pm** — Process a batch of files: document indexing/classification (sorting
  scanned PDF pages into content types — paystub, bank statement, tax return, and so on)
  and re-keying extracted data into the client's LOS fields.
- **9:00-9:30pm** — Break.
- **9:30pm-12:30am** — Continue processing: preparing income-calculation worksheet
  inputs for the underwriter's Form 1084 analysis, or making title/HOA/condo-cert
  follow-up calls to US-based companies — timed for this shift precisely because India's
  late night lines up with US daytime business hours, which is the whole reason the
  shift exists in this time slot.
- **12:30-1:00am** — Meal break.
- **1:00-3:00am** — Second-level QC queue: reviewing a peer's processed files against
  the client's checklist, or having one's own output reviewed the same way.
- **3:00-3:30am** — Update the production log and write handoff notes for the next
  shift or the US day-side team.

**Their week/month.** Weekly production/quality scorecards reviewed with a team lead;
monthly SLA review calls with US client stakeholders — sometimes requiring even later
coverage to be live during the client's own morning; industry-wide, offshore BPO/ITES
(IT-enabled services) work is widely characterized by high attrition, though this
session did not source a mortgage-BPO-specific attrition figure and none should be
inferred from general sector reputation.

**What they complain about.** This session did not run a role-specific search for
Indian mortgage-BPO-analyst reviews/forum posts (budget was exhausted on the US-side
roles above), so no quotes are presented here. What follows is general-knowledge
characterization of the broader Indian BPO/ITES sector, explicitly marked
**[unverified]** rather than treated as mortgage-specific sourced fact: night-shift
circadian health impact, tight metrics-driven monitoring (average handle time,
keystroke/idle tracking), limited career progression beyond team-lead level without
moving into a different function, and schedules that must simultaneously respect the
US client's holiday calendar and Indian public holidays, effectively narrowing time off.

**Repetitive-work inventory.**

| Task | Frequency | Minutes each | Why it's still manual | Data in -> data out |
|---|---|---|---|---|
| Document indexing/classification | Continuous through the shift | 1-3 min per document, dozens to hundreds per shift | Real-world scan quality (skew, handwriting, redaction, phone-camera photos) still defeats fully automated classification often enough that human review remains standard, even where an AI tool does the first pass | Scanned page -> classified document type |
| Re-key extracted data into client LOS fields | Continuous through the shift | 1-2 min per field group | Same client-system limitation driving processor re-keying in Section 4's processor entry, just performed by an offshore team instead of an onshore one | Extracted/typed data -> LOS field |
| Title/HOA/condo-cert follow-up calls to US companies | Daily, volume-dependent | 5-15 min per call attempt | Same unresponsive-small-HOA problem described in the processor's repetitive-work table, now handled by a shift specifically timed to reach US business hours | Follow-up call -> updated status or still-pending |
| Second-level QC checklist review of a peer's file | Daily | 5-15 min per file | Client contracts commonly require an independent second check on manually-processed or AI-assisted output before it's considered client-ready | Processed file + checklist -> pass/fail with notes |
| Production and quality scorecard self-logging | Daily/weekly roll-up | 5-10 min/day | Client SLA reporting requires auditable, individual-level throughput and quality metrics | Shift output -> logged scorecard entry |

## 5. The document & data layer

This is where agent opportunity concentrates, per the template for this guide, so the
list below is deliberately exhaustive rather than representative.

| Document / data feed | Format in practice | Standardized or bespoke | Purpose | Who produces / handles it |
|---|---|---|---|---|
| **URLA / Form 1003** (Uniform Residential Loan Application; Freddie Mac calls the same redesigned form its Form 65) | Digital fields inside the LOS; exportable as MISMO XML | Standardized (GSE-mandated form and field set) | Captures the borrower's full application: identity, income, assets, liabilities, declarations, property/loan details | Loan officer/borrower at intake; processor completes/corrects |
| **Loan Estimate (LE)** | Standardized 3-page PDF; e-delivered (with e-consent) or mailed | Standardized (TRID-mandated form) | Discloses estimated rate, payment, and closing costs within 3 business days of application | System-generated, compliance-reviewed |
| **Closing Disclosure (CD)** | Standardized 5-page PDF; e-delivered or mailed | Standardized (TRID-mandated form) | Discloses final rate, payment, and closing costs at least 3 business days before signing | Closer, balanced against title/escrow figures |
| **Form 4506-C** (IVES Request for Transcript of Tax Return) | IRS-standardized form, submitted electronically or by fax through an IVES (Income Verification Express Service) participant — a third-party vendor layer between the lender and the IRS | Standardized form, but routed through a fragmented vendor network | Authorizes the lender to pull the borrower's actual tax-transcript data straight from the IRS, to cross-check what the borrower submitted | Processor initiates; IVES vendor and IRS fulfill |
| **W-2s** | IRS-standardized form; borrower-submitted as a scan/photo/PDF, not typically a live feed | Standardized form, bespoke delivery | Confirms wage income | Borrower/employer -> processor |
| **Pay stubs** | Bespoke per employer/payroll provider; PDF, paper, or phone-camera photo | Bespoke | Confirms current income and employment | Borrower -> processor |
| **Bank statements** | Bespoke per bank; PDF via borrower portal upload; increasingly replaced at some lenders by a direct account-data feed (Plaid, Finicity, Truv) instead of a document at all | Bespoke as a document; standardizing where lenders adopt consumer-permissioned data feeds instead | Confirms assets, reserves, and (for large deposits) source of funds | Borrower/bank -> processor, or vendor feed -> LOS directly |
| **Personal tax returns** (Form 1040 + schedules) and **business tax returns** (1065 partnership, 1120S S-corp, 1120 C-corp) plus **K-1s** | IRS-standardized forms; borrower-submitted as scanned PDFs | Standardized form, bespoke delivery and internal organization business-to-business | Income verification, and the sole input to Form 1084 self-employed cash-flow analysis | Borrower/accountant -> underwriter |
| **Form 1084** (Fannie Mae Cash Flow Analysis) | Fannie Mae-standardized worksheet, filled out manually (or via a vendor calculator) | Standardized worksheet; internal underwriting work product, not exchanged with the borrower | Converts a self-employed borrower's tax-return data into one stable, qualifying monthly income figure (Section 4) | Underwriter |
| **VOE (Verification of Employment)** | Legacy: faxed or mailed employer-completed form. Modern: a direct database query against a vendor like **The Work Number**, or a payroll-connection vendor (**Truv**, **Argyle**, **Pinwheel**) | Standardizing fast at large employers; still a bespoke fax/form process at small employers with no payroll-vendor relationship | Confirms the borrower is actually employed, at the stated income, as of the verification date | Processor requests; employer or database vendor fulfills |
| **VOD (Verification of Deposit)** | Legacy: bank-completed form. Modern: consumer-permissioned account-data pull (Plaid, Finicity) | Same standardizing-at-the-top, bespoke-at-the-tail pattern as VOE | Confirms account balances directly from the institution rather than trusting a borrower-submitted statement | Processor requests; bank or data vendor fulfills |
| **Gift letters** | Bespoke signed letter (lender supplies a template, donor/borrower fill in and sign) | Bespoke content on a standardized template | Documents that down-payment funds from a relative are a gift, not an undisclosed loan | Donor/borrower -> processor |
| **Appraisal report** — Form 1004 (single-family), 1073 (condo), 2055 (exterior-only/"drive-by"), and others, all delivered as **UAD (Uniform Appraisal Dataset)**-structured data through the **UCDP (Uniform Collateral Data Portal)** | Structured XML data plus a PDF narrative report | Standardized data fields since the original UAD rollout (~2011); **undergoing a full redesign right now** — see below | Confirms the property's value and marketability | Licensed appraiser, ordered through an AMC |
| **Title commitment** | Bespoke per title company/state, though ALTA (American Land Title Association) publishes common form templates; PDF | Partially standardized (ALTA templates), otherwise bespoke per state/company | Confirms who holds clear title and what liens/encumbrances exist | Title company/agent |
| **Flood certification** | Standardized data format from flood-cert vendors (e.g., ServiceLink National Flood, CoreLogic) | Standardized | Confirms whether the property sits in a FEMA-designated Special Flood Hazard Area, triggering mandatory flood insurance if so | Flood-cert vendor, ordered by lender/processor |
| **Insurance binder** (hazard/homeowners) | Bespoke per insurer; PDF | Bespoke | Confirms the property will be insured as of closing, protecting the lender's collateral | Borrower's insurance agent |
| **HOA questionnaire / condo certification** | Fannie Mae and Freddie Mac each publish a standard-form condo questionnaire (short/full form), but many individual HOA management companies substitute their own bespoke questionnaire and charge their own fee to complete it | Nominally standardized (GSE forms exist); bespoke in practice at the HOA's discretion | Confirms a condo project meets GSE eligibility rules — owner-occupancy ratio, litigation status, insurance, reserve funding | HOA management company, chased by an HOA cert chaser/condo review specialist |
| **Note** | Fannie Mae/Freddie Mac publish uniform, state-specific note templates; historically wet-ink paper, increasingly an **eNote** registered on the MERS eRegistry | Standardized template, but custody/negotiable-instrument handling is legally exacting | The borrower's enforceable promise to repay — the actual negotiable instrument whose custody determines who can enforce the debt | Doc drawer prepares; borrower signs at closing |
| **Deed of trust / mortgage** | Uniform, state-specific security-instrument templates (again Fannie/Freddie-published); paper or e-recorded with the county recorder where available | Standardized template, recording process is county-specific | Grants the lender a security interest in the property | Doc drawer prepares; recorded by title/closing agent |
| **Initial escrow account statement** | Standardized disclosure format (RESPA-mandated) | Standardized | Projects the borrower's escrow account activity (property tax and insurance impounds) for the first 12 months | Servicer/closer, delivered at or shortly after closing |
| **MISMO XML** | XML | Standardized reference data model (Mortgage Industry Standards Maintenance Organization) | The underlying plumbing standard that ULDD, appraisal delivery, and modern LOS-to-LOS data exchange are all built on | Every system that claims MISMO compliance |
| **ULDD** (Uniform Loan Delivery Dataset) | XML, a defined subset of the MISMO model | Standardized (GSE-mandated) | The specific data fields Fannie Mae and Freddie Mac require at loan delivery | Lender's LOS, delivered at loan sale |
| **Loan tape** | Spreadsheet (Excel/CSV) or fixed-width data file | Increasingly MISMO-influenced but still full of proprietary, per-counterparty conventions in practice, especially for MSR bulk-trade and private-investor use | Summarizes a pool of loans for trading (MSR sales, whole-loan sales) or investor reporting | Secondary marketing/investor reporting analyst |

### The UAD 3.6 / appraisal-form redesign, in progress right now

Fannie Mae and Freddie Mac have been redesigning the Uniform Appraisal Dataset since
2018, moving away from the current set of static, property-type-specific forms (1004,
1073, 2055, 465, 442, and their variants) toward **one dynamic Uniform Residential
Appraisal Report (URAR)** that adapts to any property type or valuation method, aligned
to the MISMO Reference Model version 3.x [source 29]. The rollout, confirmed this
session directly from Fannie Mae and Freddie Mac's own current announcements:

- **Limited Production Period**: began **September 8, 2025** — lenders could opt in.
- **Broad Production Period**: began **January 26, 2026** — any lender may now submit
  UAD 3.6 appraisals through the UCDP.
- **Mandatory cutover**: **November 2, 2026** — UAD 3.6 becomes the only accepted format
  for new UCDP submissions, and the legacy forms are discontinued outright [source 29].

For a reader assessing automation opportunity: this is a live, in-flight data-schema
migration across the entire US appraisal industry, with a hard deadline a few months
after this chapter was written. Every appraisal-adjacent tool, AMC workflow, and
lender's UCDP integration has to move to the new schema on that timeline.

## 6. Systems of record

<!-- TODO: ICE/Encompass, Blend, nCino Mortgage, Byte, Calyx, MeridianLink, Dark
     Matter Empower, Mortgage Cadence. AUS: DU, LPA, GUS, TOTAL Scorecard.
     Verification: The Work Number, Truv, Plaid, Finicity, Argyle, AccountChek. Doc
     automation: Ocrolus, Candor, Zest AI. Servicing: Black Knight MSP (now ICE),
     Sagent, LoanCare, ServiceMac, Cenlar. POS: Blend, Maxwell, Floify. -->

## 7. Rules, regulators, and hard constraints

<!-- TODO: TRID/RESPA timing, ECOA/Reg B adverse action (CFPB Circulars 2022-03,
     2023-03), fair lending/disparate impact, HMDA, SAFE Act/NMLS licensing, Reg Z
     1026.36 (who may take an application / offer or negotiate terms), UDAAP,
     appraiser independence, GLBA privacy, state licensing, CFPB enforcement posture
     2025-2026 -->

## 8. What has already been tried

<!-- TODO: Better.com, Rocket Logic, Zest AI, Candor autonomous underwriting claims,
     Ocrolus adoption, failed "one-click mortgage" promises, why cost-per-loan still
     high after 20 years of tech -->

## 9. Where the human genuinely adds value

<!-- TODO -->

## 10. Glossary

<!-- TODO -->

## 11. Sources

<!-- TODO -->
