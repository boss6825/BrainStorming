# 04 · Title, Escrow, Closing, and Real Estate Law

> Title, escrow, and closing is the machinery that turns a signed purchase contract
> into a transfer of ownership a court, a lender, and the next buyer's title company
> will all recognize as valid. It exists because the US land record system is not a
> government guarantee of ownership — it is a 150-to-400-year pile of self-recorded
> paper (deeds, mortgages, liens, judgments, divorce decrees, death certificates) held
> at a county level, and any document in that pile can be forged, mis-indexed,
> unreleased, or missing a signature from an heir nobody knew existed. Title insurance
> and the closing process are the private-sector patch for that public-sector gap: a
> title agent (or, in some states, an attorney) searches the record, decides what is
> wrong with it, fixes what can be fixed, insures against what can't, and an escrow /
> settlement function holds everyone's money and paperwork hostage until every
> condition of the sale — old loan paid off, old liens released, new deed and new
> mortgage recorded, in the right order — happens atomically or not at all. Buyers,
> sellers, agents, and lenders all touch this machinery. None of them run it. A
> separate industry of examiners, escrow officers, closers, and underwriters does,
> funded by a premium and a stack of fees embedded in every closing statement in the
> country. This chapter is about that industry: the money, the 15-stage process spine,
> the ~20 roles that staff it (a meaningful share of them in India already), and the
> single most document-heavy, least-automated back office in all of real estate.

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

### 1.1 What title insurance actually is, and why the US has it

Most of the world proves ownership through a **Torrens system** (named for Sir Robert
Torrens, South Australia, 1858): a government land registrar examines title once, then
issues a certificate of title that the *state itself guarantees* — if the register is
wrong, the government (not a private insurer) compensates the victim, and a buyer can
generally rely on the certificate without a fresh historical search. Most of Europe,
Australia, and large parts of Asia use some Torrens variant. The United States instead
uses a **recording system**: a deed or mortgage becomes effective against later
purchasers once it is filed at the county recorder, but recording is evidence of a
claim, not a government guarantee that the claim is valid. Nobody at the county
checks whether the grantor actually owned the property, was mentally competent, was
who they claimed to be, or was married to someone whose signature was needed. The US
tried Torrens too — roughly 20 states adopted it between 1896 and the 1930s — but
courts and counties round it: maintaining two parallel record systems (recorded and
registered land) proved costly and confusing, and most states repealed their statutes.
[unverified — exact repeal timeline by state] As of today only a handful of pockets
still register any land under Torrens, and even there it is marginal: Cook County,
Illinois; Suffolk County (Boston), Massachusetts; Hennepin and Ramsey Counties,
Minnesota; and parts of Hawaii. Massachusetts, Minnesota, and Hawaii still actively
register some parcels; Illinois' Torrens system exists in statute but new registration
in Cook County has effectively stopped (source 27, 28). India has its own version of
this problem in the opposite direction — no Torrens-equivalent guarantee and a
**presumptive title** system where even the government land record is evidence, not
proof, of ownership; chapter 13 of this guide covers that in depth.

Because the American record is only ever *probably* right, the US filled the gap with
a private-insurance product instead of a public guarantee: **title insurance**. A
title insurance policy indemnifies the policyholder against financial loss from title
defects that existed *before* the policy date but were not found or disclosed — a
forged deed three owners back, an heir who never signed off, a lien the search missed.
Unlike auto or health insurance, it does not price for future risk; it prices for
**past-risk that was supposed to be found and cleared before the policy was issued**.
That is the source of a widely cited industry fact: the title insurance **loss ratio**
(claims paid ÷ premiums collected) is extraordinarily low compared to any other line
of insurance — the US industry-wide loss ratio was **5.1% in Q4 2024** and has
averaged **4.6%** from March 2012 to December 2024 (source 2); 2025 came in even lower,
around **3.6%**, as premium volume rose and payouts didn't (source 1). A car insurer
with a 4-5% loss ratio would be a scandal; for title insurance it is normal, because
the product's real function is **curative labor**, not risk transfer — the industry
spends its revenue finding and fixing problems *before* they become claims, then
charges a premium for having done that work. This is also the core of the standard
academic critique of the product (source 6): consumers are required (by lenders) to
buy something priced like insurance whose cost structure is dominated by production
labor and distribution commission, not by claims risk — which is exactly why the
money flow in the table below sends the overwhelming majority of the premium to the
**title agent who does the search and curative work**, not to the underwriter who
merely backstops the risk.

### 1.2 Owner's policy vs lender's policy

| Policy | Who it protects | Who typically pays | Required? |
|---|---|---|---|
| **Owner's policy** | The buyer (and their heirs), for as long as they or their heirs own the property | Custom varies sharply by state/county — seller pays in much of the Northeast, mid-Atlantic, and South; buyer pays in much of the West; some states split it. [unverified — no single national rule; local custom controls] | Optional, but nearly universal — a buyer without one is uninsured against a covered title defect discovered after closing |
| **Lender's policy (loan policy)** | The mortgage lender's security interest, up to the loan balance (declining as the loan amortizes, but the policy is a lump-sum amount fixed at closing) | Buyer/borrower, as a condition of the loan | Mandatory on essentially every mortgage-financed purchase |

Both policies are usually bought from the same title agent on the same file, at a
**simultaneous-issue rate** that is far cheaper than pricing the lender's policy
alone (the second policy is largely re-using the same search and exam work).

### 1.3 Where the premium dollar actually goes

Title agents (the local company that does the search, examination, curative work, and
closing) keep the large majority of the premium; the underwriter (the national
insurance company whose paper the policy is written on) keeps the rest as compensation
for bearing the ultimate financial risk and for reinsurance/backstop capacity. Reported
splits cluster around an **80/20 agent/underwriter split**, with a documented range of
roughly 60/40 to 90/10 depending on the state and the agent's volume (source 4, 5):

| Split | Where seen |
|---|---|
| ~90/10 or 85/15 | High-volume agents who negotiate better terms with underwriters |
| ~80/20 | The most commonly cited "typical" split nationally |
| 70/30 | Florida statutory cap on agent retention |
| 60/40 | Connecticut statutory cap on agent retention |

The rationale industry sources give (source 4): the agent performs nearly all of the
underwriting work — search, exam, curative, closing, and the CPL exposure (§1.5 below)
— while the underwriter's job is mostly to hold capital against catastrophic claims
and to audit/license the agent. This is also why underwriter market concentration
(§6) matters more than it looks: a handful of underwriter *families* set the
wholesale terms that thousands of small, independent title agencies operate under.

### 1.4 Full fee table — one dollar, every hand it passes through

| Fee / line item | Who pays (typical) | Who receives it | Trigger | Typical amount |
|---|---|---|---|---|
| Owner's title insurance premium | Seller or buyer, by local custom | Title agent (~70-90%) + underwriter (remainder) | One-time, at closing | Varies by state; regulated ("promulgated") in TX/FL/NM, competitively filed elsewhere — see §7 |
| Lender's title insurance premium | Buyer/borrower | Title agent + underwriter, simultaneous-issue rate | One-time, at closing | A few hundred dollars when issued simultaneously with an owner's policy |
| Escrow / settlement fee | Split by local custom, or negotiated between parties | Escrow officer's company (may be the title agency or a separate escrow company) | At closing | Flat fee, commonly several hundred dollars, sometimes scaled to price [unverified — no single national figure] |
| Search & examination fee | Bundled into the premium in some states, itemized separately in others | Title agent / abstractor | Order opening through commitment | Reflects labor hours, not risk |
| Endorsement fees | Buyer/borrower (lender-required endorsements) | Title agent + underwriter | Commitment/policy issuance | Roughly $25-several hundred **per endorsement** (e.g., ALTA 9 restrictions endorsement, survey endorsement, environmental lien endorsement) |
| Closing Protection Letter (CPL) fee | Buyer/borrower | Underwriter | Issued alongside the commitment | Small, flat fee (commonly under $100) |
| Recording fees | Buyer (deed + mortgage), passed through at closing | County recorder (government fee) | At recording | Per-page or flat, set by the county/state |
| Transfer tax / documentary stamp tax | Seller in most states; buyer in some; occasionally split | State/county/city government | At recording | Often the **single largest closing-cost line item**; rate and who-pays is state/county law (e.g., NYC, PA, and many others each set their own) |
| HOA estoppel / demand fee | Seller (usually) | The HOA or its management company | Ordered during escrow | Commonly $150-$500; Florida caps at $299 (or $399 delinquent) + $119 rush (source 35) |
| Notary / signing agent fee | Built into settlement fee or paid directly by the title company/signing service | Notary signing agent | At signing | ~$75-200 per loan-document signing appointment (source 33) |
| Wire fee | Buyer/borrower and/or seller | Bank or wire-verification vendor | At funding | Roughly $15-30 per wire, plus any CertifID/Closinglock verification fee |
| E-recording submission fee | Passed through to the consumer or absorbed by the title company | Simplifile / CSC (e-recording vendors) | At recording | Small per-document fee |
| Real estate attorney fee (attorney-closing states) | Buyer and seller each typically retain and pay their own | The attorney | Throughout the transaction | Flat fee or hourly; varies enormously by state and firm |

**Illustrative example only** (not a quoted real transaction) — on a $400,000 sale
with an $1,100 owner's premium: roughly $880-990 stays with the title agent, $110-220
goes to the underwriter, and that is *before* the separate escrow fee, recording fees,
and the transfer tax (which on many jurisdictions' typical rates would itself run into
four figures) are added on top. The insurance premium is rarely the largest line on
the settlement statement — transfer tax and the lender's own fees usually are.

### 1.5 RESPA Section 8: the law that shapes who can pay whom

The **Real Estate Settlement Procedures Act (RESPA)**, enforced by the CFPB
(Consumer Financial Protection Bureau), **Section 8** is the reason the money flows
above cannot simply follow whoever refers the business. Section 8 bans **kickbacks
and unearned fees** for the referral of "settlement services" (title work, escrow,
appraisal, etc.) tied to a federally related mortgage (source 7). Two mechanisms
matter operationally:

- **Affiliated Business Arrangements (ABAs):** A real estate brokerage, homebuilder,
  or lender may legally own (or co-own) a title agency and refer its own clients to
  it — *not* a Section 8 violation — **if** the ownership is disclosed to the
  consumer on a prescribed form, the consumer is not required to use the affiliate,
  and the affiliate performs real services for a fee that does not exceed fair market
  value (source 9). This is why so many homebuilders and large brokerages (e.g.,
  national real estate franchises) own or co-own their own title agencies — it is a
  fully legal, disclosed vertical-integration structure, not a loophole.
- **Marketing Services Agreements (MSAs) — the grey zone:** An MSA is a contract
  where a title company (or lender) pays a real estate brokerage or loan officer for
  *marketing services* — desk space, co-branded flyers, "featured" placement — rather
  than for referrals outright. The compliance question the industry argues over
  constantly is whether the payment is priced at fair market value for real marketing
  work, or is really a disguised per-referral kickback dressed up as a marketing fee
  (source 8, 13). CFPB and state regulators have treated aggressive MSAs as Section 8
  violations in enforcement actions; the exact current enforcement posture is fluid
  enough that a firm's MSA program is a standing compliance-review item, not a
  one-time legal question. [unverified — specific recent enforcement actions/settlement
  amounts not independently confirmed in this research pass]

## 2. The lifecycle / process spine

A residential purchase file runs roughly **30-45 days** from signed contract to
closing on a financed deal, and as little as **7-10 days** on an all-cash deal
(source 45). Within that window, title/escrow work is its own 15-stage pipeline,
largely invisible to the buyer and seller:

| # | Stage | Trigger | Owner role | Typical duration | Artifact produced | What makes it stall |
|---|---|---|---|---|---|---|
| 1 | **Order opening** | Signed purchase contract sent to title company | Escrow assistant / order entry | Same day-1 day | Title order / file number, preliminary contact list | Missing contract pages, wrong legal description, unclear who's ordering (buyer's agent vs lender) |
| 2 | **Title search** | Order opened | Title searcher / abstractor (often offshore) | 1-5 days (up to 2-3 weeks on complex/rural files) (source 46) | Raw copies of every recorded document touching the property and the current owner | County system down/unindexed; common name (dozens of "John Smith" hits); rural county with no digitized index pre-1980s |
| 3 | **Examination** | Search returned | Title examiner | 1-3 days per file | Title examination summary / list of exceptions | Ambiguous legal description; conflicting deeds; examiner backlog |
| 4 | **Commitment issuance** | Examination complete | Title officer / examiner sign-off | Same day once exam is done | Title commitment (Schedule A, B-I, B-II — see §5) | Underwriting counsel escalation on a novel defect |
| 5 | **Curative work** | Exceptions identified in B-I/B-II that must be cleared before closing | Curative specialist | Hours (a simple lien release) to **months** (probate/heirship gap) | Recorded releases, satisfactions, affidavits, corrective deeds | This is the bottleneck of the entire industry — see §4.3 |
| 6 | **Payoff ordering / demand statements** | Seller has an existing mortgage/lien | Escrow assistant / closer | Payoff good for 10-30 days, must be re-ordered if closing slips past that window | Payoff demand statement (exact amount to satisfy the existing loan, itemized per diem interest) | Lender's payoff department is slow/faxes only; per diem miscalculated; closing date moves and the payoff expires |
| 7 | **HOA estoppel / demand letters** | Property is in an HOA/condo association | Escrow assistant, ordered from the HOA or its management company | 3-10 business days typically; up to ~12-13 days average nationally, some vendors quote ~4 days (source 35) | HOA estoppel certificate (unpaid dues, pending special assessments, violations) | Self-managed HOAs with no responsive contact; management-company backlog; states without a statutory turnaround deadline |
| 8 | **Survey** | Lender or title underwriter requires it (commercial almost always; residential varies by state/lender) | Licensed surveyor, ALTA/NSPS standard on lender-required commercial deals | Days to a few weeks | ALTA/NSPS Land Title Survey | Fence/boundary encroachment discovered late; surveyor scheduling backlog |
| 9 | **Escrow** (earnest money, wiring, prorations) | Contract execution through closing | Escrow officer | Runs the whole file life | Escrow ledger, wiring instructions, proration worksheet (taxes, HOA dues, interest, rent) | Wiring instruction verification friction (anti-fraud callback protocols); proration disputes; late-arriving mortgage payoff numbers |
| 10 | **CD balancing with the lender** | Lender issues Closing Disclosure (CD) | Closer / escrow officer, reconciling against the lender's numbers | 1-3 days before signing (TRID's 3-business-day pre-closing waiting period) | Reconciled Closing Disclosure + internal settlement statement | Lender's CD and title's own numbers don't match to the penny; late fee changes trigger a new 3-day wait |
| 11 | **Signing** | CD "clear to close" | Notary/closer (wet-ink), or RON platform + remote notary | Single appointment, 30-90 minutes | Signed closing package (note, mortgage/deed of trust, deed, affidavits) | Signer confusion on unfamiliar documents; RON not permitted in that state/for that document type; missing ID |
| 12 | **Funding** | All signatures collected and reviewed | Funder | Same day to next morning | Wire authorization / disbursement | Lender's funding conditions not yet cleared; wire cutoff time missed |
| 13 | **Recording** | Funds disbursed (in a "wet funding"/table-funded closing) or immediately pre-funding (in escrow states that record before disbursing) | Recording clerk (title company) + county recorder | Instant (e-recording) to several days (paper/courier, backlogged counties) | Recorded deed and mortgage, county stamps a book/page or instrument number | County recorder backlog; document rejected for formatting/margin/legibility errors; paper courier delay |
| 14 | **Policy issuance** | Recording confirmed | Post-closer / policy typist | Days to (commonly, in practice) weeks or months after closing | Final owner's and lender's title policies | Post-closing queue depth; underwriter policy-jacket system backlog |
| 15 | **Post-closing** | Policy issued | Post-closer, plus original document return | Ongoing | Original recorded documents returned to owner/lender; trailing document (e.g., subordination) tracking | Original recorded documents lost in mail from the county; trailing documents (e.g., a subordination the lender still owes) never chased down |

The two stages that consume the most unscheduled time — and therefore the most
headcount — are **curative work** (#5) and **HOA estoppel** (#7); both depend on a
third party (a prior lender, a court, a self-managed HOA board) that has no deadline
pressure of its own. Sections 3-4 go deep on the roles and daily work inside this
spine.

## 3. Role inventory

The US Bureau of Labor Statistics collapses several of these into one occupational
code — **SOC 23-2093, "Title Examiners, Abstractors, and Searchers"** — median annual
wage **$54,980**, 10th percentile **$36,710**, 90th percentile **$87,240**, roughly
**48,170 people** employed nationally (source 30). That single line item hides a real
seniority ladder and a dozen adjacent roles the BLS doesn't separately track.

| Role | Also called | Seniority | Licence/cert required | Typical comp (US / India where known) | Headcount ratio | What they own |
|---|---|---|---|---|---|---|
| Title searcher / abstractor | Searcher, abstractor | Entry | Usually none; a few states require an abstractor bond | Within the BLS 23-2093 band, toward the lower end (~$37-55k inferred from percentiles) | Highest — many searches feed one examiner | Pulling every recorded instrument touching the chain of title |
| Title examiner | Examiner | Mid | No universal license; some underwriters require an internal certification | BLS median $54,980, range $36,710-$87,240 (source 30) | One examiner reviews multiple searchers' output | Deciding what's an insurable defect vs. noise; writing the exception list |
| Senior / chief title examiner | Senior examiner | Senior | Underwriter-granted signing authority | Above BLS median; no separate public figure found | Small relative to junior examiners | Final sign-off on complex/commercial files; mentoring |
| Title officer | Production title officer | Senior | Many states require a title insurance producer license | No reliable public figure found; postings commonly cluster $55-80k [unverified] | Moderate | Owns the file's underwriting decision and the relationship with underwriting counsel |
| Underwriting counsel | Underwriting attorney | Senior/expert | Licensed attorney (state bar) | No reliable public figure found | Very small, centralized at the underwriter, serves many agents | Approves exceptions to "insure over" unresolved defects; sets agent underwriting guidelines |
| Curative specialist | Title clearance / curative analyst | Mid | None universal | No reliable public figure found | Concentrates headcount on any file with real problems — see §4.3 | Chasing payoffs, lien releases, and probate/heirship documentation until the exception list clears |
| Escrow officer | Settlement officer (title-state closer) | Senior | Many states require a separate escrow license (e.g., California, Arizona) | Avg base ~$60,099 (Indeed, source 31) | Each officer runs dozens of concurrent files | The trust account, the settlement statement, the closing appointment |
| Escrow assistant | Closing coordinator, escrow processor | Junior/mid | None | No reliable public figure found; below officer band [inference] | Multiple assistants per officer | Ordering payoffs/HOA docs, scheduling, document assembly |
| Closer | Title closer | Mid/senior | Attorney-states: must be an attorney or supervised by one; title-states: escrow/title license | Glassdoor avg $66,208; Indeed avg $59,793 (search results, this pass) | Comparable to escrow officer | Conducting the signing, walking parties through the settlement statement |
| Settlement processor | Closing processor | Junior/mid | None | No reliable public figure found | High | Keying the lender's closing instructions into the settlement/production software |
| Post-closer | Post-closing specialist | Junior/mid | None | ZipRecruiter avg $32,642, range $27.5k-$39.5k (search results, this pass) | High — batch/queue role | Confirming recording completed, chasing trailing documents |
| Policy typist | Policy production specialist | Junior | None | Comparable to post-closer band; no separate figure found | High-volume, frequently centralized or offshored | Producing the final policy jacket matching the recorded instruments |
| Recording clerk (title-company side) | E-recording specialist | Junior | None | No reliable public figure found | Moderate | Submitting e-recording packages or preparing paper packages for courier |
| Funder | Funding coordinator | Mid | State-dependent; sometimes escrow license required | No reliable public figure found | Small, centralized | Authorizing wire disbursement only once every funding condition is met |
| Notary signing agent (NSA) | Loan signing agent | Independent contractor, any seniority | State notary commission + typically an NNA-style signing-agent certification and background screen | $75-200 per signing appointment (source 33) — paid per job, not salaried | Very high; thousands of independent contractors nationally | Physically presenting the package, confirming ID, notarizing, returning documents |
| Mobile notary | Traveling notary | Independent contractor | State notary commission | Comparable per-appointment fee, sometimes lower if notarizing only (no "walk-through") | High | Same physical-presence function; may not walk borrowers through the loan itself |
| RON notary | Remote online notary | Contractor or in-house | State notary commission + separate state RON registration/platform credentialing | No reliable public figure found | Growing | Same notarial function via audio-video platform (see §6) |
| County recorder staff | Deputy recorder, records clerk | Government employee | None beyond public-sector hiring | Public-sector pay scale, varies by county; no reliable single figure found | Varies hugely — from a handful of staff in rural counties to large teams in metro counties | Indexing and archiving every recorded instrument for that county forever |
| Real estate attorney (attorney-closing states) | Closing attorney | Licensed professional | State bar admission | No reliable public figure found — highly market-dependent | Mandatory role only in attorney-closing states (§7) | Legal opinion on title, document preparation, closing supervision, fund disbursement |
| Real estate paralegal | Legal assistant | Junior/mid | Often a paralegal certificate; not a licensed role | No reliable public figure found | Moderate, concentrated in attorney-closing states and law-firm-run title shops | Drafting documents under attorney supervision, tracking curative correspondence |
| Foreclosure/REO title specialist | Default title specialist | Mid/senior | Standard title credentials | No reliable public figure found | Small, cyclical with foreclosure volume | Title work on distressed/bank-owned property — redemption periods, junior-lien wipeouts |
| Commercial title officer | Commercial underwriter | Senior | Title insurance producer license + residential experience first, typically | Above residential title-officer bands [unverified, no figure found] | Small, high-dollar-value files | Underwriting large/complex commercial deals; routine coordination with underwriting counsel |
| 1031 qualified intermediary (QI) | Exchange accommodator | Specialist | No federal license; must be an unrelated party per IRC rules; some states separately regulate/bond QIs | No reliable public figure found | Small, specialist firms | Holding exchange proceeds/documents to preserve like-kind tax deferral (source 36) |
| Offshore title-search/BPO analyst (India) | Title research analyst, mortgage support analyst | Entry/mid | None; employer-internal training | Title-specific figure not found; general Bengaluru BPO band reported ~₹30,000-42,000/month (Glassdoor, search results this pass) — postings typically want 2-4 years' "US mortgage/title" process experience | Very high — this is a volume-scaled offshore function, see §4.6 | Executing the same search/abstracting/data-entry work as a domestic searcher, against US county record websites, overnight relative to US time zones |
| Escrow/settlement compliance officer | ALTA Best Practices compliance manager | Senior | None universal; increasingly a distinct role since ALTA Best Practices adoption (§7) | No reliable public figure found | Small — typically 1 per agency or region | Owns the agency's ALTA Best Practices certification and lender audit responses |

## 4. Day in the life

### 4.1 Title examiner — day in the life

- **Who they are:** Usually promoted from a searcher/abstractor role after 2-4 years,
  or hired with a paralegal background. Measured (KPI) on files examined per day
  balanced against **zero missed exceptions** — the thing that turns into a future
  claim and a post-mortem with their name on it.
- **Their stack:** **TitlePoint** and **DataTrace** (title-plant search access across
  many counties — a "title plant" is a private, pre-indexed copy of county land
  records a title company builds so it doesn't have to query the raw county system
  every time); **SoftPro**, **Qualia**, **RamQuest**, or **ResWare** (whichever
  production/workflow system the file lives in); dozens of individual county recorder
  and assessor websites of wildly inconsistent quality; the underwriter's (Fidelity
  National Financial, First American, Old Republic, or Stewart) underwriting manual
  and bulletin updates; phone and fax for anything a county or prior lender won't put
  online.
- **A typical day:**
  - **8:00am** — log in, pull the overnight queue of completed searches from
    searchers (increasingly, from an offshore team — see 4.6).
  - **8:15-10:00am** — file 1: review a 30-60-year search, cross-referencing
    grantor/grantee index entries against the tax parcel ID, checking that the legal
    description is consistent across every instrument in the chain.
  - **10:00-10:30am** — flag: an old deed uses a metes-and-bounds legal description
    that doesn't cleanly match the current tax parcel; order an additional search or
    a survey to resolve it.
  - **10:30am-12:00pm** — file 2, a commercial refinance: an old judgment lien
    appears satisfied in correspondence but the release was never recorded —
    escalate to underwriting counsel.
  - **12:00-1:00pm** — lunch, frequently worked through during refinance-volume
    spikes.
  - **1:00-3:00pm** — files 3-5: routine residential purchases, standard chains,
    writing up commitment exceptions (Schedule B-I/B-II — see §5).
  - **3:00-4:00pm** — a "rush" file escalated by an escrow officer because closing
    is in 48 hours and title isn't cleared yet.
  - **4:00-5:00pm** — QC review of a junior examiner's file (a senior-examiner task),
    or training on an underwriter bulletin update.
  - **5:00-5:30pm** — update the production tracker; a typical day is roughly
    6-10 files depending on complexity. [unverified — no single public per-day
    production benchmark found; this range is a reasonable industry inference, not a
    cited figure]
- **Their week/month:** Friday production numbers roll up to the title officer;
  month-end ties into the underwriter's agency audit prep (ALTA Best Practices
  Pillars 4-5, §7). During refinance booms (2020-2021 being the most recent extreme
  example), industry-wide search-and-exam turnaround stretches from days to weeks
  because searcher/examiner headcount doesn't scale as fast as order volume.
  [general industry pattern, not independently re-verified this pass]
- **What they complain about:** No first-person forum quote was sourced in this
  research pass — that gap is disclosed rather than filled with an invented one. What
  *is* documented: the BLS wage band for this occupation (SOC 23-2093, median
  $54,980, source 30) sits well below many white-collar professional roles despite
  the liability exposure of "did the examiner miss something" being the industry's
  standard root-cause question after a claim.
- **Repetitive-work inventory:**

| Task | Frequency | Minutes each | Why it's still manual | Data in → data out |
|---|---|---|---|---|
| Cross-referencing grantor/grantee index entries against the tax parcel ID | Every file | 15-45 min | County indexes aren't standardized or linked to parcel IDs; many are still scanned images, not OCR'd/searchable text | Scanned county index images → examiner's chain-of-title write-up |
| Re-typing a legal description from an old deed into the commitment | Every file | 5-15 min | Legal descriptions are free-text and inconsistently formatted across centuries of deeds; OCR is unreliable on old handwritten/typed instruments | Scanned deed image → Schedule A text field in SoftPro/Qualia |
| Verifying name variations ("Wm. Smith" vs. "William Smith Jr.") aren't different people | Any file with multiple historical owners | 10-30 min | No unique person identifier ties to deeds; matching is judgment-based | Multiple index entries → examiner's identity determination |
| Checking every name in the chain against judgment/lien indexes | Every file | 15-30 min | Judgment indexes are usually a separate system from the real-property index, sometimes a different county office entirely | County judgment docket → exception list entry |
| Re-keying prior-policy data when reissuing on a refinance | Refinance files | 10-20 min | The prior policy is often a scanned PDF, not structured data, sometimes from a non-interoperable underwriter system | Old policy PDF → new commitment fields |

### 4.2 Escrow officer / closer — day in the life

- **Who they are:** Frequently promoted from escrow assistant after building a book
  of referring agents/lenders; some arrive from banking or mortgage backgrounds.
  Measured on: on-time closings, an error-free settlement statement/CD, referral-
  relationship health, and a clean trust-account audit.
- **Their stack:** SoftPro/Qualia/RamQuest/ResWare for production **and trust
  accounting**; **DocMagic** for lender closing-document generation; **Snapdocs** or
  **Pavaso** to coordinate hybrid/RON closings with the lender; **CertifID** or
  **Closinglock** for wire-instruction verification; the bank's trust-account portal;
  constant phone/email/text with agents on both sides of the deal.
- **A typical day:**
  - **7:30am** — confirm overnight wires cleared; review the day's 2-4 closings.
  - **8:00-9:00am** — final CD reconciliation for a 10am closing; chase the lender
    for a corrected number that arrived late the night before.
  - **9:00-9:30am** — **verbally verify** the buyer's wired funds actually landed —
    calling the bank, not trusting a screenshot, per anti-fraud protocol (see §8 on
    wire fraud).
  - **10:00-11:00am** — closing appointment 1: walk the parties (or their attorneys,
    in attorney-closing states) through 60-100 pages, notarize, collect signatures.
  - **11:00am-12:00pm** — process the file: scan/upload signed documents, submit for
    e-recording via Simplifile or CSC.
  - **12:00-1:00pm** — lunch at the desk, fielding calls.
  - **1:00-2:00pm** — closing appointment 2 (in person, or RON where permitted).
  - **2:00-3:30pm** — field an escrow assistant's questions on three other files;
    call an HOA management company about an overdue estoppel; call a payoff
    department that only accepts a faxed authorization.
  - **3:30-4:30pm** — "clear to close" review for tomorrow's files: verify every
    condition is actually satisfied.
  - **4:30-5:30pm** — daily trust-account reconciliation, matching every dollar in
    and out.
- **Their week/month:** Friday pipeline review; month-end (sometimes daily, by state
  rule — §7) trust-account audit; quarterly ALTA Best Practices internal audit prep.
- **What they complain about:** Wage-and-hour class actions against escrow
  officers/closers allege unpaid overtime, off-the-clock work, denied or interrupted
  breaks, commissions excluded from overtime pay, and unreimbursed personal-device
  use (source 32) — legal theories under active attorney solicitation rather than
  first-person quotes, but a genuine, sourced friction point given how closing-day
  hours are inherently unpredictable and back-loaded. Separately, wire-fraud anxiety
  is a documented daily operational stressor industry-wide: the FBI's IC3 unit
  recorded **$3.04 billion** in business-email-compromise losses in 2025 (up from
  $2.77 billion in 2024), with 86% of BEC funds moved via wire or ACH, and named
  real-estate-closing cases including a **$1.3M+** wire diverted via a spoofed title-
  company email and a **$449K** wire diverted via an impersonated closing attorney
  (source 21); HousingWire's coverage separately put total 2025 real-estate-specific
  fraud losses at **$275M** (source 20).
- **Repetitive-work inventory:**

| Task | Frequency | Minutes each | Why it's still manual | Data in → data out |
|---|---|---|---|---|
| Re-keying CD figures from the lender's PDF into the settlement software | Every financed file | 15-30 min | Lenders send a PDF Closing Disclosure, not a structured feed, despite MISMO (Mortgage Industry Standards Maintenance Organization) data standards existing | Lender CD PDF → escrow software settlement statement |
| Phoning to verbally verify wiring instructions before releasing buyer funds | Every wire | 10-20 min | Email instructions are exactly what BEC fraud spoofs; an independently-sourced phone number is the only reliable manual control | Phone call → verified wiring instruction |
| Re-chasing a payoff or HOA estoppel that lapsed or arrived late | Most files, at least once | 15-30 min per chase | Third parties (bank payoff departments, self-managed HOAs) have no closing-date pressure and often only accept fax | Follow-up call/fax → updated document |
| Reconciling the trust account to the penny | Daily | 30-60 min | State trust-accounting rules require it; the bank feed and the title production ledger aren't always integrated | Bank statement + software ledger → reconciliation report |
| Re-explaining settlement-statement line items to first-time buyers | Most closings | 10-20 min | No consumer-facing document simplifies the ALTA Settlement Statement/CD enough on its own | Verbal explanation only |

### 4.3 Curative specialist — day in the life

This is the deepest role in this chapter for a reason: **curative work is the
industry's actual bottleneck**, and almost nobody outside the title industry knows
this job exists.

- **Who they are:** Often promoted from examiner or escrow-assistant ranks; the job
  is part detective, part collections agent, part paralegal. Measured on exception-
  clearance rate, days-to-clear, and how many files miss their closing date because
  of an unresolved curative item.
- **Their stack:** SoftPro/Qualia/ResWare for file and task tracking; **phone and fax
  — still, heavily**, because many payoff departments and older law firms accept
  nothing else; county recorder websites and probate-court portals of wildly
  inconsistent quality; the underwriter's curative/underwriting manual; occasionally
  a skip-tracing tool to locate missing heirs.
- **A typical day:**
  - **8:30am** — review overnight faxes for lien releases that came in.
  - **9:00-10:00am** — file 1: a 20-year-old second mortgage was never released; the
    original lender has been acquired three times since. Spend 45 minutes on hold
    with the acquiring bank's "lost paperwork" department to get a payoff/release
    reissued.
  - **10:00-11:00am** — file 2: the seller inherited the house from a parent who
    died **intestate** (without a will) and no probate was ever opened. Work with the
    seller's attorney to determine whether the state's affidavit-of-heirship or
    small-estate procedure can substitute for full probate.
  - **11:00am-12:00pm** — file 3: an HOA lien plus an unpaid special assessment
    surfaces *after* the estoppel was already ordered — renegotiate who pays it on
    the CD, re-order an updated estoppel.
  - **12:00-1:00pm** — lunch, still working the fax queue.
  - **1:00-2:30pm** — file 4: a **mechanics lien** (a lien a contractor files for
    unpaid work) from a renovation two owners ago. Determine whether it's still
    enforceable or has expired under the state's statute of limitations for
    enforcement, or whether it needs a formal release or a bond-around.
  - **2:30-3:30pm** — file 5: a signature on a 1998 deed doesn't match the seller's
    current legal name after a divorce and remarriage. Order a certified divorce
    decree and marriage certificate; prepare an affidavit of identity.
  - **3:30-4:30pm** — file 6: a new survey shows a fence encroaching six inches onto
    the neighboring lot. Coordinate with underwriting counsel and possibly the
    neighbor on a boundary-line agreement or survey affidavit to make it insurable.
  - **4:30-5:00pm** — update the exception-tracking log; escalate two files to
    underwriting counsel that won't clear before the scheduled closing date.
- **Their week/month:** A weekly "aged exceptions" review with the title officer —
  anything unresolved past 30/60/90 days gets escalated. Month-end quality review of
  which curative issues recur by originating attorney or lender.
- **What they complain about:** No specific forum quote was sourced this pass. What
  can be stated as a structural inference (not a quote): this role's own performance
  metric — days-to-clear — depends almost entirely on the responsiveness of parties
  (banks, courts, HOAs, other title companies) who face **no deadline pressure of
  their own**, which structurally caps how much a curative specialist can improve
  their own numbers through effort alone.
- **Repetitive-work inventory:**

| Task | Frequency | Minutes each | Why it's still manual | Data in → data out |
|---|---|---|---|---|
| Requesting a payoff/release reissue after a bank merger orphaned the original loan | Common on older properties | 30-90 min, often multiple calls | No unified successor-lender database; each acquiring bank has its own fax/portal/mail process | Phone/fax request → reissued payoff letter or release |
| Drafting an affidavit of heirship or identity for a name/ownership gap | Several times a week per specialist | 30-60 min | Every state's small-estate/affidavit rules differ; facts must be gathered from disparate sources (obituaries, death certificates, family statements) | Death certificate, court record, family statement → notarized affidavit |
| Verifying a decades-old mechanics lien or judgment has actually expired | Every file with one on record | 15-30 min | Expiration rules vary by lien type and state (statute of limitations, renewal filings); no system auto-flags an expired lien | Statute lookup + recorded document date → exception cleared or not |
| Chasing a subordination agreement a current lender still owes | Refinance files with a second lien | 30-60 min over multiple days | The second lienholder has no closing-date pressure and is often an unrelated bank | Written request → signed, recorded subordination |
| Correcting and resubmitting a document a county rejected for formatting | Every rejected recording | 20-40 min | Each of 3,000+ counties sets its own formatting rules (margins, legibility, page order), enforced inconsistently | Rejected document + rejection reason → corrected, resubmitted document |

### 4.4 Post-closer / policy typist — day in the life

- **Who they are:** Frequently the first job in the industry for someone; entry-to-
  mid level. Measured on getting files to final policy within the underwriter's
  target window and a low audit-error rate.
- **Their stack:** SoftPro/Qualia/ResWare's post-closing module; e-recording
  confirmation dashboards (Simplifile/CSC) or direct county-portal checks in paper-
  recording counties; the underwriter's own policy-issuance portal — a separate
  system per underwriter (Fidelity National Financial, First American, Old Republic,
  Stewart), not integrated with every title production system.
- **A typical day:**
  - **8:30-9:30am** — pull the "recorded, not yet policy-issued" queue; confirm
    today's batch actually recorded.
  - **9:30-11:30am** — for each confirmed file: cross-check the recorded deed and
    mortgage exactly match the commitment (legal description, parties, loan amount),
    then generate the final owner's and lender's policy jackets in the underwriter's
    portal.
  - **11:30am-12:30pm** — handle files the county recorded with a typo or the wrong
    document version; file a correction or re-recording.
  - **12:30-1:30pm** — lunch.
  - **1:30-3:00pm** — chase trailing documents — e.g., a subordination promised by a
    second lienholder that still hasn't shown up weeks after closing.
  - **3:00-4:00pm** — mail/return original recorded documents to the new owner and
    the lender per instructions.
  - **4:00-5:00pm** — update the post-closing tracker; escalate files stuck past the
    underwriter's target window.
- **Their week/month:** A weekly aging report (files not yet policy-issued past
  30/60/90 days) is where backlog silently accumulates — once a deal has closed and
  the agents/buyers have moved on, nobody outside the title company is pushing on
  this queue.
- **What they complain about:** No forum quote sourced this pass. The structural
  fact that *is* sourced: post-closing is the lowest-paid rung on this ladder
  (ZipRecruiter average **$32,642**, range $27.5k-$39.5k, from this pass's search
  results) despite carrying real liability exposure — an error here is precisely what
  surfaces as a future claim.
- **Repetitive-work inventory:**

| Task | Frequency | Minutes each | Why it's still manual | Data in → data out |
|---|---|---|---|---|
| Confirming recording completed and capturing the book/page or instrument number | Every file | 5-15 min | Not every county's e-recording confirmation auto-feeds the title production software; some require manually checking a county portal | County recorder confirmation → production software field |
| Cross-checking the recorded document against the commitment for exact-match errors | Every file | 15-30 min | No common automated diff tool; recording clerks and county staff can introduce their own typos | Recorded PDF vs. commitment → match confirmed or correction filed |
| Re-keying policy data into the underwriter's separate policy-issuance portal | Every file | 10-20 min | Each underwriter runs its own portal, not integrated with every title production system | Title production software → underwriter policy portal |
| Chasing a trailing document (subordination, final payoff confirmation) | Common | 15-30 min per chase, often repeated | Same third-party-responsiveness problem as curative work, just after closing | Follow-up request → received trailing document |

### 4.5 Notary signing agent — day in the life

- **Who they are:** Overwhelmingly independent contractors, many doing this as a
  side business alongside another career. Measured on on-time arrival, zero signing
  errors (a single missed initial can blow up a closing), and signings booked per
  day.
- **Their stack:** Signing-service marketplaces — **Snapdocs** functions as both an
  eClosing platform for lenders/title companies *and* the dominant scheduling
  marketplace signing agents get booked through; a home printer (loan packages run
  100-150 pages); GPS/mileage tracking; personal **E&O (errors & omissions)
  insurance**; the state notary commission and a physical notary journal (a legal
  record-keeping requirement in most states).
- **A typical day:**
  - **6:30am** — download and print 3 assigned loan packages before driving.
  - **8:00am** — appointment 1, at a borrower's home: confirm ID, walk them through
    100-150 pages, collect every signature/initial, notarize the required documents,
    repackage everything.
  - **9:30am** — many lenders/title companies require a scanned copy of the signed
    package within an hour; find a print/scan shop or use a mobile scanning app.
  - **10:00-11:00am** — drive to appointment 2, often 30-60 minutes away.
  - **11:00am-12:30pm** — appointment 2, same process.
  - **12:30-1:30pm** — lunch, drive to appointment 3.
  - **1:30-3:00pm** — appointment 3, a rush signing added that morning because
    another title company was short a notary.
  - **3:00-4:30pm** — drive to a FedEx/UPS location to overnight the physical
    package (some instructions require shipping the originals; others, scan-and-
    shred).
  - **4:30-6:00pm** — admin: invoice each title company/signing service separately
    (every payer has different terms), update the notary journal, check tomorrow's
    assignments.
- **Their week/month:** Chasing unpaid invoices from signing services is a chronic,
  documented complaint in this line of work; the fee (**$75-200 per signing**,
  source 33) is negotiated per assignment, payment terms vary by platform, and there
  are no employer benefits — mileage, gas, and printing are the notary's own cost.
- **What they complain about:** Signing-agent training/pricing resources (source 33)
  document fee compression as platforms bid assignments down, printing/paper costs
  eating into thin margins, and cancelled or no-show appointments that still cost
  drive time and gas. [These are trade-resource-documented themes; no specific
  first-person forum quote was sourced this pass.]
- **Repetitive-work inventory:**

| Task | Frequency | Minutes each | Why it's still manual | Data in → data out |
|---|---|---|---|---|
| Printing a 100-150 page loan package at home | Every wet-signed closing | 15-30 min (print, collate, check page order) | Most closings are still not fully paperless; hybrid/RON adoption is partial (§7-8) | Digital package (PDF) → physical package |
| Confirming every signature/initial location against the lender's signing instructions | Every closing | 10-20 min | No universal machine-checkable signature-location standard across lenders' documents | Signing instructions + physical package → checked, completed package |
| Scanning and returning the signed package same-day | Nearly every closing | 15-30 min | Requires scanner/printer access many NSAs don't own at professional speed | Signed paper package → scanned PDF upload |
| Invoicing multiple signing services/title companies with different formats and terms | Weekly | 20-40 min total | No standard invoicing system across the fragmented signing-service marketplace | Completed jobs → individual invoices per payer |

### 4.6 Offshore India title-search analyst — day in the life

- **Who they are:** Entry-to-mid-level employees, often with a commerce or law
  degree background, working shifts aligned to US business hours — meaning a night
  shift in India for US East/Central time zones. Employed either by a **captive
  center** (First American operates one of the largest: **First American (India)
  Private Limited**, launched in 2003, with campuses in Bangalore, Hyderabad, and
  Salem, doing title-report production work as part of a broader shared-services
  operation — source: firstam.co.in, production-services page) or by independent BPO
  vendors serving US title companies and lenders (this pass surfaced PPR Services
  Private Limited, SKP Title Search Pvt. Ltd., CDMSoftech, and Shri Data Entry
  Services among firms explicitly marketing US title-search outsourcing). Measured
  on searches completed per shift, accuracy against US-side QC review, and SLA
  turnaround.
- **Their stack:** VPN/remote-desktop access into the US client's own systems —
  **TitlePoint**, **DataTrace**, or the client's proprietary portal — plus direct
  browser access to hundreds of individual county recorder and assessor websites,
  many still running decades-old, low-usability interfaces; the client's title
  production software (SoftPro/Qualia/ResWare) for data entry; internal QC
  checklists.
- **A typical day (night shift, IST, aligned to US business hours):**
  - **7:00pm** — shift start; log into VPN; pick up the overnight queue of new
    search/current-owner-search orders placed during the US business day.
  - **7:15-9:00pm** — current-owner search 1: search the grantor/grantee index and
    tax-assessor site for one county, compile a preliminary document list.
  - **9:00-9:30pm** — break.
  - **9:30pm-12:30am** — a full 30/60-year search: the deep, multi-hour version —
    trace every recorded instrument back to a specified date, cross-check name
    variations, flag anything that doesn't match.
  - **12:30-1:00am** — meal break.
  - **1:00-3:30am** — continue searches; work QC feedback that came back on
    yesterday's completed files (a search sent back for correction).
  - **3:30-5:30am** — data entry: keying completed search results and abstracted
    document data into the client's production software fields.
  - **5:30-6:30am** — wrap-up; handoff notes for the incoming US day-shift team
    during the real-time overlap window on urgent files.
- **Their week/month:** Monthly accuracy/SLA scorecards feed the vendor contract or
  the captive center's internal review. Volume tracks the US refinance/purchase
  cycle closely — booms mean mandatory overtime, slow US markets mean reduced hours
  or bench time. [general inference about BPO volume-cyclicality; no specific
  sourced figure for this pattern in title-search BPO specifically]
- **What they complain about:** No specific forum quote was sourced this pass. What
  is documented: job postings surfaced in this research pass consistently ask for
  **2-4 years of "US mortgage/title process" experience** for analyst-level roles in
  Bangalore, implying real skill accumulation the generic BPO wage band (general
  Bengaluru BPO average reported around ₹30,000-42,000/month, Glassdoor, this pass —
  not title-specific) doesn't capture on its own.
- **Repetitive-work inventory:**

| Task | Frequency | Minutes each | Why it's still manual | Data in → data out |
|---|---|---|---|---|
| Searching a county site with no API, only a browser-based public portal | Every search, every county involved | 10-40 min depending on portal quality | 3,000+ US counties each run their own system; many pre-1980s records are index-card scans, not searchable text | County portal screens → compiled document list |
| Re-typing scanned document data (names, dates, instrument numbers, legal descriptions) into structured fields | Every document found, dozens per file | 3-10 min per document | Source documents are scanned images of typed or handwritten originals; OCR error rates are too high to trust directly on legal descriptions | Scanned document image → structured data field |
| Reconciling name variations across decades of records into one chain of title | Every file | 15-40 min | No unique person/parcel identifier links records across time in most counties | Multiple index entries → single examiner-ready chain-of-title write-up |
| Responding to same-file QC corrections from the US-based examiner | Common | 10-20 min per round | County-record ambiguity requires human judgment calls that sometimes differ between offshore analyst and US examiner | QC rejection note → corrected search |

## 5. The document & data layer

This is where the automation opportunity concentrates: almost every row below is
still a PDF, a fax, or a scanned image moving between parties who do not share a
system.

| Document | What it is | Format in practice | Standardized or bespoke | Produced by | Consumed by |
|---|---|---|---|---|---|
| **Title commitment** (Schedule A / B-I / B-II) | The title company's conditional promise to issue a policy. Schedule A = the basics (property, proposed insured, policy amount, current vested owner). Schedule B-I = **requirements** that must be satisfied before the policy issues (pay off loan X, record deed Y, get a release). Schedule B-II = permanent **exceptions** the policy will never cover (recorded easements, mineral rights, specific defects found) | PDF, generated from a template in the production software | ALTA-standardized structure; bespoke content per file | Title officer/examiner | Buyer, lender, closer |
| **Deed — General/Statutory Warranty** | Seller warrants title against all defects, including those predating their ownership | Recorded paper/PDF, state-specific statutory language | Bespoke drafting (parties, legal description) on a state template | Attorney/title company/paralegal | County recorder, new owner |
| **Deed — Special Warranty** | Seller warrants only against defects arising **during their own ownership** — common in commercial and foreclosure/REO sales | Same | Same | Same | Same |
| **Deed — Quitclaim** | No warranty at all; conveys whatever interest (if any) the grantor has — common in divorce transfers, family gifts, clearing a cloud on title | Same | Same | Same | Same |
| **Deed — Grant Deed** | Used in some states (notably California); implies limited statutory warranties (grantor hasn't already conveyed it elsewhere, no undisclosed encumbrances) without being a full warranty deed | Same | Same | Same | Same |
| **Mortgage / Deed of Trust** | The security instrument. A **mortgage** is a 2-party instrument (borrower, lender) typically requiring judicial foreclosure; a **deed of trust** is 3-party (borrower, trustee, lender/beneficiary) and permits non-judicial (out-of-court) foreclosure in the states that use it | Recorded document | Fannie Mae/Freddie Mac uniform-instrument base forms exist per state, with bespoke riders/addenda | Lender's closing docs, executed at signing | County recorder, servicer |
| **Release / Satisfaction / Reconveyance** | The document proving a loan is paid off and its lien removed — called a "satisfaction" in mortgage states, a "reconveyance" in deed-of-trust states (a trustee must reconvey title back) | Recorded document | Standardized template, but every lender issues on its own timeline | Prior lender/servicer | Curative specialist, new lender, recorder |
| **Assignment (of mortgage/deed of trust)** | Records a transfer of the loan/lien from one lender/investor/servicer to another — loans are routinely sold (e.g., into Fannie Mae/Freddie Mac pools) | Recorded document | Standardized template | Assigning lender/servicer | Recorder, curative specialist verifying chain |
| **Subordination agreement** | An existing lienholder (e.g., a HELOC lender) agrees to move behind a new loan (e.g., a refinance) in priority — without it, the "new" first mortgage could legally be junior to an old second lien | Bespoke per deal, notarized, recorded | Bespoke | The subordinating lienholder | Curative specialist, new lender |
| **Lien waiver** | A contractor/subcontractor waives the right to file a mechanics lien for a specific payment received — common on new-construction closings | State-specific statutory forms in many states | Standardized per state, bespoke amounts | Contractor/subcontractor | Title company, builder, lender |
| **Affidavit of identity** | Sworn statement resolving a name-variance issue (e.g., confirming "Wm. Smith" and "William R. Smith" are one person, or documenting a legal name change) | Notarized affidavit | Standardized boilerplate, bespoke facts | Curative specialist, signed by the party | Title company file, recorder (if recorded) |
| **FIRPTA non-foreign affidavit** | Seller certifies, under penalty of perjury, they are not a "foreign person" under the Foreign Investment in Real Property Tax Act — without it, the buyer must withhold 15% of the gross sales price and remit it to the IRS | Standardized template, signed at closing | Standardized | Seller | Buyer (withholding agent), IRS if withholding applies |
| **Owner's affidavit** (affidavit of title) | Seller swears there are no unrecorded liens, no unknown parties in possession, and no recent unpaid work that could support a later-filed mechanics lien — this is what lets the title company insure over the "gap" between the search date and the recording date | Standardized template, notarized at closing | Standardized | Seller | Title company/underwriter |
| **ALTA/NSPS Land Title Survey** | A survey performed to the joint standard set by ALTA and NSPS (National Society of Professional Surveyors); shows boundaries, improvements, easements, encroachments | Professional survey drawing + certification, essentially still a CAD drawing/PDF | Standard exists for survey *content*; each survey is bespoke to the parcel | Licensed surveyor | Title company (insuring over/around encroachments), lender, buyer |
| **Payoff demand statement** | The current lender's statement of the exact amount to satisfy a loan as of a given date, itemized with per-diem interest | PDF or fax from the lender's payoff department | Bespoke per lender's own format | Prior lender/servicer | Escrow officer, closer |
| **HOA estoppel certificate** | The HOA/association's statement of unpaid dues, pending special assessments, and violations, required before closing | PDF, portal download, or mailed letter | Bespoke per HOA/management company; some states set a required content list (e.g., Florida) | HOA or its management company | Escrow officer, buyer, curative specialist |
| **ALTA Settlement Statement** | ALTA-standardized summary of every dollar in and out of the transaction, from the title company's side | PDF, generated by production software | Standardized ALTA form | Escrow officer/closer | Buyer, seller, agents, lender (must reconcile with the CD) |
| **Closing Disclosure (CD)** | The CFPB/TRID (TILA-RESPA Integrated Disclosure)-mandated form the lender must give the borrower at least 3 business days before consummation | PDF, standardized CFPB form | Standardized | Lender | Borrower, escrow officer (reconciling against the settlement statement) |
| **Closing Protection Letter (CPL)** | The underwriter's indemnity to the lender (and often the buyer) against the closing/escrow agent's fraud, dishonesty, or failure to follow closing instructions — it does **not** cover title defects; that's the policy's job | PDF, issued alongside the commitment | Standardized ALTA form | Underwriter | Lender, sometimes buyer |
| **Title policy** (owner's and lender's) | The final insurance contract — a "policy jacket" matching the recorded instruments, on the underwriter's template, with the specific property and exceptions attached | PDF/paper, from the underwriter's policy-issuance portal | Standardized ALTA policy forms, bespoke Schedule A/exceptions | Post-closer/policy typist, underwriter system | Owner, lender |
| **E-recording payload** | The electronic package (document image plus a structured cover-sheet/index data file) submitted to a participating county's recording system | Vendor-specific submission format — Simplifile and CSC each run their own schema, not one national standard | Bespoke per e-recording vendor and per county's accepted fields | Recording clerk/e-recording software | County recorder's system |
| **ALTA Best Practices certification/assessment report** | The deliverable proving a title agency's compliance with ALTA's seven-pillar framework (§7) — an independent third-party assessment report, not a single transaction document | PDF report | Standardized assessment framework, agency-specific findings | Third-party compliance assessor | Lenders requiring proof of the agency's compliance |

Two historical notes worth flagging for anyone evaluating automation here: (1) the
**assignment of mortgage** document was at the center of the 2010-2012 "robo-signing"
scandal, where bank employees were found to be mass-signing assignment and
foreclosure affidavits without the underlying review the documents attested to — a
well-known episode in mortgage-servicing history [unverified — not independently
re-confirmed with a fresh source in this research pass, but widely reported at the
time and part of the resulting National Mortgage Settlement]; and (2) **MERS**
(Mortgage Electronic Registration Systems) exists specifically because assignments
are this manual and this slow to record — MERS tracks loan-servicing transfers in a
private database so lenders don't have to record a new assignment at the county every
time a loan is sold, then only records once at final payoff or foreclosure.
[unverified — MERS mechanics stated from general domain knowledge, not re-confirmed
with a fresh source this pass]

## 6. Systems of record

| System | Category | Who uses it | Market position | API reality | Why it's hard to displace |
|---|---|---|---|---|---|
| **SoftPro** | Title production / closing software | Title agencies and attorneys, especially higher-volume and commercial shops | One of the two long-standing dominant production platforms; no verified market-share % found | Has an integration ecosystem, but agencies build years of deep, agency-specific customization on top | Trust-accounting compliance risk of switching mid-operation; sunk cost in county-specific document template libraries built up over decades |
| **Qualia** | Cloud-based title production / closing platform | Newer entrants and residential-focused agencies; a strong challenger to SoftPro since the mid-2010s | No verified market-share % found; widely described as the fastest-growing modern platform | Built cloud-native; "Qualia Connect" links agents, lenders, and realtors on the same network | Network effects — once an agency's referral partners are on Qualia Connect, leaving loses that connectivity, not just the software |
| **RamQuest** | Title production software | Smaller and regional agencies; some commercial-leaning shops | Legacy, mature player | Moderate | Standard legacy-software switching cost plus trust-accounting migration risk |
| **ResWare** | Configurable title/escrow production software | Larger multi-state agencies wanting heavy workflow customization | Established mid-tier player | Moderate | Deep per-agency configuration work is expensive to redo elsewhere |
| **TitlePoint** | Title-plant search/access aggregator | Title examiners industry-wide, as the primary way to pull property records and prior policies across many counties | High penetration specifically among examiners | Thin/no public API for outside developers | The moat is the underlying **title plant** — a private, decades-built, pre-indexed copy of county land records — not the software shell around it |
| **DataTrace** | Title-plant data and search/production tools | Title agencies and underwriters | Significant industry presence | Same data-moat dynamic as TitlePoint | Same — decades of proprietary indexing effort, not easily rebuilt |
| **Simplifile** | E-recording network | Title companies, lenders, and participating counties | One of the two dominant e-recording networks (with CSC); covers the large majority of the US population | Vendor-specific submission schema; not a single national e-recording standard | County-by-county onboarding relationships took years to build; incumbency is the moat |
| **CSC eRecording** | E-recording network | Same as Simplifile | The other dominant network; ~2,500 counties on e-recording plus paper-recording support across 3,600+ jurisdictions total, covering 90%+ of the US population (source 14) | Same vendor-specific-schema reality | Same county-relationship moat |
| **Pavaso** | eClosing / RON platform | Lenders and title companies | Supports the full range of closing types — traditional, hybrid, RON, IPEN (in-person electronic notarization), and RIN (remote ink-signed notarization) | API integrations with LOS (loan origination system) and title production systems | Lender vendor-approval cycles for anything touching closing/compliance are slow, which locks in whichever platform is already approved |
| **Notarize / Proof** | RON platform | Title companies, lenders, consumers | A leading RON brand; now integrating into Snapdocs per a 2020s partnership (source 43) | Platform-level integrations | State-level RON platform registration/certification requirements plus notary/consumer habit |
| **DocMagic** | Loan document generation and compliance | Lenders | Long-established document-generation vendor | Integrated into lender LOS workflows | A deep compliance rule-engine (TRID and state-specific disclosure rules) is expensive to replicate and lenders won't risk getting it wrong |
| **Snapdocs** | eClosing platform **and** signing-agent scheduling marketplace | Title companies, lenders, notary signing agents | A leading eClosing platform that has also become a dominant scheduling marketplace for signing agents specifically | Platform APIs into lender/title systems | Two-sided marketplace network effect — agents and title companies are both already on it |

### The underwriter families

| Underwriter (brand) | 2025 individual market share | Corporate family |
|---|---|---|
| First American Title | 23.1% | First American Financial Corporation |
| Fidelity National Title | 14.5% | **Fidelity National Financial (FNF)** |
| Old Republic Title | 14.0% | Old Republic International |
| Chicago Title | 13.1% | **Fidelity National Financial (FNF)** |
| Stewart Title | 10.9% | Stewart Information Services |

(source: HousingWire's coverage of ALTA's 2025 market-share data, this pass.) FNF's
underwriter family also includes Commonwealth Land Title, Alamo Title, and National
Title Insurance of New York (source: fnf.com/underwriters). Combining brands into
families, the real concentration is: First American (~23%) + the FNF family
(Fidelity National Title + Chicago Title alone ≈ 28%, before the smaller FNF brands
are added) + Old Republic (~14%) + Stewart (~11%) — which lands in the high-70s to
~80% range once the remaining smaller FNF brands are folded in. **This combined-
family percentage is this author's calculation from the underlying brand-level data
above, not a single published figure** — no source found in this pass states the
four-family total directly, though the underlying brand shares (each independently
sourced) support the "roughly 80% concentration" framing in the brief. The top 5
individual brands alone account for **more than 75%** of all premium (source 3).

### County record systems: the fragmentation problem

The US has **3,000+ county-level (or county-equivalent) recording jurisdictions**,
each running its own independent system, its own formatting rules, and its own
digitization history. E-recording networks now reach counties covering roughly
**90%+ of the US population** (source 14) — but that is a population-weighted
figure, meaning the *counties* still missing e-recording are disproportionately the
smaller, more rural jurisdictions where a research pass in this chapter's other
sections also found the deepest examiner pain: index-card-era records that were
never digitized, sometimes going back well before 1980. There is no single national
system a search or a recording can be routed through — every one of the 3,000+
jurisdictions is its own integration target.

## 7. Rules, regulators, and hard constraints

### 7.1 Unauthorized practice of law (UPL) — a hard limit, state by state

**Unauthorized practice of law (UPL)** statutes prohibit anyone without a law license
from giving legal advice or preparing legal documents affecting title. This is not a
formality — courts have actually shut down non-attorney closing practices for it.
Two documented examples from this pass's research: Alabama's Supreme Court held in
*Coffee County Abstract & Title Co. v. State* (1983) that a title company employee
committed UPL by giving legal opinions on title effect and assisting in deed
preparation (source 41); South Carolina's Supreme Court similarly found that
preparing documents affecting title, providing title opinions, and handling closings
constitutes UPL by non-attorneys. Texas law separately prohibits charging for
preparation of legal instruments affecting title (deeds, deeds of trust, mortgages)
except by licensed attorneys or real estate brokers/salespeople within the scope
their license allows. Florida sits at the other end: a title company **can** conduct
closings and prepare the legal documents needed to issue title insurance without an
attorney on staff.

This produces a real state-by-state split on **who is legally allowed to run a
closing**:

| Category | States (this pass's sourcing; treat exact boundary cases as needing state-specific verification) | What it means operationally |
|---|---|---|
| **Attorney-closing states** (an attorney must conduct or directly supervise the closing) | Commonly cited: Connecticut, Delaware, Georgia, Kentucky, Massachusetts, New Hampshire, North Carolina, South Carolina, West Virginia (source 10, 11) | A licensed attorney — not just a title company — must run the legal side of the transaction |
| **Attorney-involved / partial-involvement states** (an attorney must examine, certify, or opinion title and/or prepare documents, without necessarily running the whole closing) | Commonly cited: Alabama, Louisiana, Mississippi, North Dakota, Oklahoma, Rhode Island, Wyoming (source 10) | Title companies can operate, but specific steps are legally reserved to an attorney |
| **Title/escrow-company states** (no attorney requirement) | The remaining majority of states — roughly 33 by one source's count (source 10) | A licensed title/escrow company can run the entire closing |

Different sources drew this map with slightly different state lists — the underlying
legal reality is set by each state's own bar-association rules, UPL case law, and
sometimes statute, so **this table is a starting orientation, not a substitute for
checking the specific state** before assuming a workflow can skip an attorney.
[unverified — state lists reconciled from overlapping but non-identical sources this
pass; some states appear in more than one source's list under different framing]

### 7.2 Notarization and physical-presence requirements

Traditional notarization requires the signer to physically appear before the notary.
**Remote Online Notarization (RON)** — audio-video notarization where the signer
never physically meets the notary — is now permanently authorized in **49 states
plus DC**, per the National Notary Association's count (source 12). **California is
the sole holdout**: SB 696 became law in 2024, but full RON implementation isn't due
until **January 1, 2030** (source 12). The remaining friction is *interstate*
recognition, not adoption: every state runs its own RON rulebook (identity-proofing
method, recording/retention requirements, which document types qualify), so a RON
closing valid in one state isn't automatically guaranteed recognition in another. The
**SECURE Notarization Act** (S.1561, 119th Congress, introduced May 1, 2025) would set
federal minimum standards — audio-visual session recording, identity verification —
and require every state to recognize notarizations performed in any other state. As
of this research pass it remains **in committee**, with industry backing from ALTA
and the Mortgage Bankers Association but no guarantee of passage (source 12).

### 7.3 State title insurance rate regulation

States regulate title insurance rates on a spectrum. At one end, **Texas, Florida,
and New Mexico use "promulgated" rates** — the state insurance regulator sets the
exact rate every underwriter must charge, with no price competition possible on the
core premium (source: NM OSI rate-case authority under Section 59A-30-8 NMSA 1978,
and this pass's broader search results, source: NM SRCA). In a promulgated state,
shopping for title insurance cannot lower the insurance premium itself — only
ancillary fees and service quality are negotiable. At the other end, most states use
**file-and-use** or fully competitive rate filing, where underwriters set and use
their own rates (subject to filing requirements) and real price competition exists
between agents.

### 7.4 RESPA Sections 8 and 9

Covered in detail in §1.5 (Section 8 — anti-kickback, ABAs, MSAs). **RESPA Section
9** separately prohibits a seller from requiring a buyer, as a condition of sale, to
purchase title insurance from any particular title company — the buyer's right to
choose their own title insurer (for the owner's policy) is a specific, named
protection under this section. [general RESPA-9 mechanics stated from domain
knowledge; not independently re-verified with a fresh citation this pass]

### 7.5 ALTA Best Practices — a lender-driven compliance regime with no legal force

**ALTA (American Land Title Association) Best Practices** is a **voluntary industry
framework, not a government mandate** (source 33). It exists because lenders are
themselves regulated (by the CFPB and banking regulators) on oversight of their
third-party vendors — including title agencies — and demonstrating ALTA Best
Practices compliance, via an independent assessment, is how a title agency proves to
a lender it's a safe vendor to keep sending business to. The **seven pillars**
(source 33):

| Pillar | Focus |
|---|---|
| 1 | Licensing |
| 2 | Escrow trust accounting |
| 3 | Protecting non-public personal information (NPI) |
| 4 | Settlement processes |
| 5 | Policy production |
| 6 | Insurance coverage |
| 7 | Consumer complaints |

Because it is contractually required by lenders rather than legally mandated, ALTA
Best Practices functions as a **de facto national compliance regime** with none of
the enforcement mechanisms of an actual regulator — a title agency doesn't get fined
by the government for failing it, it gets **cut off by lenders** for failing it,
which in practice is just as existential for a small agency's business.

### 7.6 State escrow/trust accounting rules

Every state regulates how title/escrow companies must hold client funds — as a
**fiduciary trust account**, segregated from the company's operating funds, subject
to reconciliation requirements (commonly monthly, sometimes more frequent) and audit.
This is the legal backbone behind the escrow officer's daily trust-account
reconciliation task described in §4.2. Rules and licensing bodies vary by state (some
states license "escrow companies" as a category distinct from title agencies; others
fold escrow authority into the title agency's own license). [general domain
knowledge on trust-accounting structure; state-by-state specifics not individually
re-verified this pass]

### 7.7 Recording statutes: race, notice, and race-notice

Recording statutes determine **who wins when the same property is conveyed or
encumbered twice** — the entire reason recording deadlines and same-day/atomic
closing sequencing matter operationally (source 27, 28):

| Statute type | Rule | Where it applies |
|---|---|---|
| **Race** | Whoever records first wins, full stop — even if the second party actually knew about the first, unrecorded claim | A small minority of states, including Delaware and North Carolina |
| **Notice** | A later purchaser who pays value and has no notice (actual or constructive) of a prior unrecorded claim wins, **regardless of who records first** | Notice-statute states |
| **Race-notice** | A later purchaser wins **only if** they (a) had no notice of the prior claim **and** (b) recorded first | The most common statute type nationally |

This is why the industry treats the interval between closing/funding and recording
as dangerous: in a race or race-notice jurisdiction, a competing claim that gets
recorded first — even one filed after the closing already happened — can legally
prevail. It is also why **e-recording's speed advantage over paper courier isn't a
convenience feature — it directly reduces legal exposure** in every jurisdiction
using race or race-notice rules.

### 7.8 FinCEN's Residential Real Estate Rule — a live, fast-moving reporting regime

The **Financial Crimes Enforcement Network (FinCEN)**, a bureau of the US Treasury,
finalized a rule requiring **certain reporting persons — primarily title agents,
attorneys, and closing/settlement agents — to report beneficial-ownership
information to FinCEN on non-financed (all-cash) transfers of residential real
property to legal entities and trusts**, an anti-money-laundering measure targeting a
long-documented gap (all-cash entity purchases being a common money-laundering
vehicle). The rule's timeline, current as of this research pass:

- **December 1, 2025** — the rule's original effective date.
- **September 30, 2025** — FinCEN announced exemptive relief, postponing actual
  reporting obligations to **March 1, 2026**, citing industry need for more
  implementation time (source 15, 16).
- **March 19, 2026** — the **US District Court for the Eastern District of Texas**,
  in ***Flowers Title Companies, LLC v. Bessent***, ruled that FinCEN lacked
  statutory authority to impose the rule and **vacated it** (source 16).
- **March 20, 2026** — FinCEN issued a compliance statement confirming that
  **reporting persons are not currently required to file real estate reports with
  FinCEN and are not subject to liability for not filing, while the court's order
  remains in force** (source 16).

This is about as live as a regulatory fact can get in this chapter — it was still
moving during this research pass, and the litigation is not necessarily final (an
appeal or a new rulemaking could revive some version of the requirement). **Anyone
building automation around this rule should treat its current status as provisional,
not settled**, and verify the live status before relying on this section. If and when
reporting obligations resume in any form, they land squarely on settlement agents —
exactly the role already buried in the highest volume of manual document handling in
this chapter (§4) — making it a natural automation target regardless of which way the
litigation ultimately resolves.

## 8. What has already been tried

### 8.1 Doma (formerly States Title) — the instant-underwriting machine-learning bet, and its collapse

Doma is the cautionary tale every automation pitch in this vertical should study
first. Founded in 2016 as **States Title**, its core product (launched 2018) was an
"algorithmic, instantaneously underwritten refinance title insurance policy" — using
machine learning on public records to skip the manual examiner step entirely for
qualifying files, later extending the pitch toward purchase-loan title as well
(source 17). It went public via a SPAC (Special Purpose Acquisition Company) merger
with Capitol Investment Corp. V, in a deal valued at **$3 billion including debt**,
adding $350 million to its balance sheet (source 17). Then the mortgage-rate cycle
turned against it: when the Federal Reserve raised rates starting March 2022,
mortgage refinancing — Doma's core volume driver — evaporated. Doma's closed order
count fell from **136,248 in 2022 to 71,953 in 2023**, against a **212,200**
projection made at the time of the SPAC deal (source 17) — a roughly 66% miss
against its own forecast. After a **$124.4 million 2023 loss**, Doma agreed to go
private, acquired by underwriter **Title Resources Group (TRG)** for **$6.29/share**
in an ~$85 million deal (source 18, 19).

What this proves, stated plainly rather than softened: **the automation Doma built
was real, but it was underwritten against a volume forecast that assumed the
refinance boom would continue, and the company had no cushion when the macro
environment (not the technology) turned**. It is evidence that "instant underwriting"
as a technical capability is achievable for a meaningful subset of low-risk files —
it is not evidence that a venture-scale, SPAC-funded bet on that capability was a
sound business, and it is not evidence about what happens to the harder tail of
files (the curative-heavy ones in §4.3) that no instant-underwriting model has
publicly claimed to solve.

### 8.2 The insurtech wave around Doma: Qualia, Endpoint, Spruce, JetClosing

Doma wasn't alone. A cohort of title/closing startups raised venture money in the
same 2018-2021 window (source 38): **Qualia** built modern production software
(and, as covered in §6, won on network effects rather than an underwriting-
automation bet — it is now one of the more durable survivors); **Endpoint** offered
underwriters a technology layer to compete without rebuilding their own stack;
**Spruce** pitched "title agency in a box" for integrated brokerages and iBuyers;
**JetClosing** (Seattle, founded 2016) tried to digitize the closing experience
directly for consumers, raised **$44 million total** across a Series A ($20M, 2018)
and Series B ($11M, 2021), and **shut down in June 2022** — explicitly citing
competition from larger incumbents and a cooling, rate-driven housing market (source
37). The pattern across this cohort: software-layer and workflow startups
(Qualia) fared better than startups betting on displacing the underwriting/risk
function itself (Doma) or on owning the full consumer closing experience
(JetClosing) — [this is an analytical pattern this author drew across the sourced
cases above, not itself a single cited claim].

### 8.3 Blockchain land-registry pilots — tried in multiple countries, adopted in none

Blockchain-based land registries have been piloted in several jurisdictions as a
proposed replacement for both the recording system and (implicitly) the need for
title insurance itself. None has moved past pilot stage:

- **Cook County, Illinois (US):** the startup Velox.re demonstrated using blockchain
  hashing to imitate a cadastral (land-parcel record) entry, then **ceased activity**
  in this direction (source 26).
- **Sweden:** the land registry authority (Lantmäteriet) ran a multi-phase pilot with
  blockchain startup ChromaWay starting 2016, with an internal projection that a full
  rollout could save taxpayers **over €100 million annually** by cutting paperwork and
  processing time — but as of the most recent phase reviewed in this pass's sources,
  **no results had been published and no full rollout had occurred** (source 26).
- **Republic of Georgia:** partnered with blockchain infrastructure provider Bitfury
  (using the Exonum framework) to register land titles with a Bitcoin-blockchain
  timestamp (source 26).

The pattern across all three, stated by one of this pass's sources in almost exactly
these terms: **every country that has tested blockchain land registration has left it
in pilot mode; none has adopted it as a comprehensive replacement for its existing
registration system** (source 26). The likely reason, though this is inference
rather than a sourced conclusion: a blockchain register only solves the *recording*
half of the US problem (tamper-evident sequencing of claims) — it does nothing about
the *curative* half (whether a 1970s deed was properly executed, whether an heir's
claim is valid, whether a lien was ever really released), which is where this
chapter's §4.3 shows the actual labor concentrates.

### 8.4 Wire fraud and business email compromise — a large, live, unsolved problem

Real estate closings are a named, high-value target for **business email compromise
(BEC)** — fraud where an attacker impersonates a party to a wire transfer (often a
title company or closing attorney) via a spoofed or compromised email, redirecting
the buyer's or lender's wire to the attacker's account. The FBI's **Internet Crime
Complaint Center (IC3)** reported **$3.04 billion** in BEC losses in 2025 (up from
$2.77 billion in 2024), with 86% of BEC-related funds moved via wire or ACH transfer
(source 21). Specific real-estate-closing cases named in IC3's own reporting include
a wire of **over $1.3 million** diverted via a compromised email impersonating a
title company, and **over $449,000** diverted via an email impersonating a closing
attorney (source 21); separate trade coverage put total 2025 real-estate-specific
fraud losses at **$275 million** (source 20). The FBI's Financial Fraud Kill Chain
recovery program — a rapid-response mechanism that asks banks to freeze a wire before
it fully clears — initiated **3,900 recovery actions in 2025**, freezing **$679
million of $1.16 billion** in attempted-theft dollars it engaged with, a roughly **58%
success rate** (source 21) — meaning even with an active federal recovery mechanism,
a meaningful share of stolen closing funds are never recovered.

The industry's response has been a layer of **third-party wire-verification
vendors** rather than a structural fix to the underlying email-based-instruction
weakness:

- **CertifID** verifies wiring instructions and backs verified transactions with up
  to $5 million in direct insurance through Lloyd's of London at no extra cost; the
  company reports its dedicated recovery team, working with the US Secret Service,
  has returned **over $126 million** to fraud victims (source 22).
- **FundingShield** targets the lender side specifically — validating wire
  instructions, agent licensing, and closing-protection-letter authenticity before a
  loan funds, rather than at the closing table itself (source 23).

Both are real, adopted products — but their existence is itself evidence that the
underlying weakness (closing instructions traveling over ordinary, spoofable email)
has not been fixed at the protocol level; the industry has instead layered
verification services on top of an inherently vulnerable channel.

## 9. Where the human genuinely adds value

Title is the vertical where automation optimism most often collides with reality. Be
precise about which parts resist.

- **Judgment on defects.** Deciding whether a 40-year-old unreleased mortgage, an
  ambiguous legal description, or a gap in an heirship chain is an acceptable risk *to
  insure* is an underwriting judgment with the underwriter's capital behind it. This is
  the core of the business and it is not a classification problem — it is a
  risk-appetite decision.
- **Curative negotiation.** Persuading a bank's payoff department, a dead borrower's
  heirs, a contractor with a lien, or a county clerk to produce a document nobody is
  legally compelled to produce quickly. Much of this is relationship and persistence
  across institutions that have no obligation to cooperate.
- **Reading old and non-digitised records.** Handwritten deed books, microfilm, tract
  indexes, surveys with metes-and-bounds descriptions referencing a tree that no longer
  exists. Improving, but far from solved for pre-1980 records.
- **Interpreting an ambiguous legal description against a survey.** Genuinely a spatial
  reasoning task on inconsistent historical data.
- **The signing table.** Notarisation requires identity verification and, in many
  states, physical presence. Explaining a stack of documents to a nervous buyer at
  11pm in their kitchen is a human service.
- **Absorbing liability.** The underwriter's promise to defend the title in court is
  what the customer is actually buying. Software does not indemnify.

**The realistic split.** Search, examination against a rules checklist, document
assembly, prorations arithmetic, and status chasing are all substantially automatable.
The **underwriting decision, the curative negotiation, and the notarised signature** are
not — and they are exactly what the licence and the capital exist for. Doma's history
is the case study: sophisticated machine learning applied to instant underwriting did
not, on its own, produce a durable business.

## 10. Glossary

- **Abstract of title** — A condensed history of everything recorded against a property.
- **AfBA** — Affiliated Business Arrangement; a disclosed RESPA safe harbour for jointly owned settlement providers.
- **ALTA** — American Land Title Association; publishes the standard policy and settlement statement forms.
- **Chain of title** — The successive transfers of ownership over time.
- **Cloud on title** — Any claim or defect making ownership uncertain.
- **Commitment** — The title company's promise to insure, subject to Schedule B requirements and exceptions.
- **CPL** — Closing Protection Letter; the underwriter's indemnity to the lender for the settlement agent's conduct.
- **Curative** — The work of clearing defects so a clean policy can issue.
- **Deed** — The instrument that transfers ownership. Distinct from *title*, which is the ownership right itself.
- **E-recording** — Electronic submission of documents to a county recorder, typically via Simplifile or CSC.
- **Encumbrance** — Any claim against the property: mortgage, lien, easement, restriction.
- **Escrow** — Neutral third-party holding of funds and documents pending closing. In some western states the escrow function is separately licensed.
- **Estoppel certificate** — An HOA's or tenant's written statement of amounts owed and terms in effect.
- **Examination** — Reviewing the search results and deciding what to require and what to except.
- **FIRPTA** — Foreign Investment in Real Property Tax Act; requires withholding on sales by foreign persons.
- **Grantor/grantee index** — The county's name-based index; the traditional entry point for a search.
- **Lien** — A monetary claim against a property: mortgage, tax, judgment, mechanics.
- **Metes and bounds** — A legal description by directions and distances rather than lot and block.
- **Payoff / demand statement** — A lender's statement of the exact amount required to release its lien on a given date.
- **Plant** — A privately maintained, geographically indexed copy of county records; faster than searching the county directly.
- **Prorations** — Splitting taxes, HOA dues, rent, and interest between buyer and seller as of the closing date.
- **Quitclaim deed** — Transfers whatever interest the grantor has, with no warranty. Common in curative work.
- **Race, notice, race-notice** — The three recording-statute regimes determining who wins between competing claims.
- **Reconveyance / satisfaction / release** — The document proving a mortgage has been paid off and its lien removed.
- **RON** — Remote Online Notarization; notarising over audio-video with identity proofing.
- **Schedule A** — Who is insured, for how much, and the legal description.
- **Schedule B-I** — Requirements that must be satisfied before the policy issues.
- **Schedule B-II** — Exceptions: what the policy does *not* cover.
- **Settlement agent** — The party conducting the closing and disbursing funds.
- **SNDA** — Subordination, Non-Disturbance and Attornment agreement; a commercial lease/lender document.
- **Underwriter** — The insurance company standing behind the policy, distinct from the title agent that issues it.
- **Wire fraud / BEC** — Business email compromise; fraudsters impersonate a party to divert closing funds. A major and continuing loss source.

## 11. Verify before you rely on this

| Claim | Why it moves | Check against |
|---|---|---|
| FinCEN residential real estate reporting rule — effective date and scope | Effective date and scope have shifted; treat any date as provisional | FinCEN rule page and the Federal Register |
| RON authorisation by state, and interstate recognition | Still expanding; federal SECURE Notarization Act repeatedly reintroduced | National Notary Association; state statutes |
| Share of counties accepting e-recording | Rising every year | PRIA; Simplifile and CSC coverage maps |
| Title premium splits and the ~70-80% agent retention figure | Varies by state and by whether rates are promulgated | State insurance department rate filings |
| Underwriter market shares and the "four families ~80%" figure | Shifts with M&A | ALTA market share reports; company 10-Ks |
| Wire fraud loss totals | Reported annually | FBI IC3 annual report |
| Attorney-closing state lists | Practice rules change and are often custom rather than statutory | State bar and state DOI guidance |
| Doma's current status and ownership | Went private; strategy changed | Company filings and trade press |

**Method note.** Sections 1-8 were written with live web research; sections 9-11 from
domain knowledge after a rate limit ended the research run. Nothing here is legal
advice — title practice differs materially between states, and the differences are
exactly the part that matters.
