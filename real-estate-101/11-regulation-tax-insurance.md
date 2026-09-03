# 11 · The Rules Layer — Regulation, Tax, Insurance, and Compliance

> This chapter does two opposite jobs at once, and you should read it with both in mind.
>
> **As a constraint map**, it tells you where an AI agent legally cannot go: which acts
> are reserved to licensed humans, which decisions carry explainability obligations,
> which outbound contact is restricted, and which business models are simply illegal.
>
> **As an opportunity map**, it tells you where compliance *is* the repetitive work —
> high-volume, deadline-driven, rule-bound processes that exist only because a regulator
> demands them, and that are still done by people with spreadsheets and calendars.
>
> The same regulation that blocks one product creates another. Read section 9 before you
> conclude that regulation is only a problem.
>
> Chapters 01-10 each cover their own vertical's rules. This chapter is the cross-cutting
> reference and consolidates the parts that recur.

## Contents

- [1. Who regulates what](#1-who-regulates-what)
- [2. Licensing: which acts require a human](#2-licensing-which-acts-require-a-human)
- [3. Fair housing and fair lending](#3-fair-housing-and-fair-lending)
- [4. Consumer-contact law: the AI agent's hardest constraint](#4-consumer-contact-law-the-ai-agents-hardest-constraint)
- [5. Transaction and settlement regulation](#5-transaction-and-settlement-regulation)
- [6. Property tax and the investor tax layer](#6-property-tax-and-the-investor-tax-layer)
- [7. Insurance](#7-insurance)
- [8. Environmental and climate](#8-environmental-and-climate)
- [9. Where compliance IS the repetitive work](#9-where-compliance-is-the-repetitive-work)
- [10. Roles and days in the life](#10-roles-and-days-in-the-life)
- [11. Glossary](#11-glossary)
- [12. Verify before you rely on this](#12-verify-before-you-rely-on-this)

---

## 1. Who regulates what

| Level | Bodies | What they control |
|---|---|---|
| **Federal (US)** | CFPB (consumer finance), HUD (housing, fair housing), FHFA (Fannie/Freddie), FinCEN (money laundering), IRS (tax), FTC (advertising, unfair practices), DOJ Antitrust, SEC (securities), EPA, OSHA, FCC (calls and texts) | Consumer finance, discrimination, federal tax, securities, environment, safety, telecom |
| **State** | Real estate commissions, insurance departments, banking departments, attorneys general, appraiser boards, contractor boards | **Licensing, landlord-tenant law, contract forms, insurance rates, escrow rules** |
| **County (~3,100)** | Recorders, assessors, clerks, courts | Land records, property assessment, eviction and foreclosure proceedings |
| **Municipal (~19,000)** | Zoning, planning, building departments, rent boards, health and fire | Zoning, permits, inspections, rent regulation, STR rules, building performance standards |

**The single most important structural fact for anyone building real estate software:**
the rules that most affect daily operations — landlord-tenant, licensing, contract
forms, recording, zoning, lien deadlines, assessment appeals — are set at the state,
county, and municipal level, not federally. There is no national rulebook to encode.

This has three consequences you should design around:
1. **Coverage is a moat.** Encoding many jurisdictions is expensive and slow, which is
   why incumbents with national coverage are hard to displace and why a newcomer should
   pick one market and go deep before going wide.
2. **The rules change constantly and asynchronously.** Maintenance is the product, not a
   cost centre. Budget for a permanent rules-maintenance function.
3. **"It works in California" tells you almost nothing about Texas.** Beware demos.

## 2. Licensing: which acts require a human

The consolidated version of the boundary that appears in every chapter. This is the most
practically useful table in the guide for scoping an agent.

| Licence | Reserved acts — a human must do these | Safe for an agent — generally not reserved |
|---|---|---|
| **Real estate salesperson / broker** | Negotiating for a party; representing a party for compensation; soliciting listings; advising on price or terms in a representative capacity | Scheduling, deadline tracking, document assembly, coordination, factual answers, file checking. **NAR's own position places transaction coordination outside brokerage activity** |
| **Mortgage loan originator (NMLS/SAFE Act)** | Taking a residential loan application; offering or negotiating loan terms; advising which product to take | Collecting and verifying documents, clearing conditions, ordering services, status communication, explaining a submitted document |
| **Appraiser (USPAP)** | Signing an opinion of value; the certification | Comp research support, data assembly, report drafting assistance, scheduling. Note: an AVM is a different product, not an appraisal |
| **Attorney** | Legal advice; drafting bespoke contract language; representing a party in court. Note: some states require an attorney at closing | Filling blanks on standard forms (for a licensee), summarising documents, assembling filings, tracking deadlines |
| **Notary** | Verifying identity and witnessing signature — in many states requiring physical or audio-visual presence | Preparing documents for signature; scheduling; post-signing processing |
| **Architect / professional engineer** | Sealing drawings and calculations; taking professional responsibility for a design | Drafting support, code research, coordination, submittal logging |
| **Contractor (per trade)** | Performing licensed work; pulling permits in many jurisdictions | Estimating support, scheduling, documentation, procurement |
| **Property manager (varies by state)** | In many states, managing for a third party for compensation requires a broker's licence | Administrative and coordination work under a licensee |
| **Insurance producer** | Soliciting, negotiating, or selling insurance | Information gathering, document assembly, claims documentation support |
| **Securities (Series 7/63, or issuer exemption)** | Soliciting securities investments for commission | Investor reporting, document assembly, data room administration |

**The pattern to internalise, because it repeats in every single vertical:** the
reserved act is almost always **exercising judgment on behalf of a party, or signing**.
Everything upstream of that — gathering, checking, drafting, chasing, tracking,
summarising — is generally not reserved.

**That is precisely where the labour is.** The processor, the coordinator, the
abstractor, the examiner's assistant, the compliance reviewer: these roles exist because
licensed professionals cannot spend their time on preparation. Building for them is
both the largest opportunity and the safest legal position in this industry.

## 3. Fair housing and fair lending

### The statutes

- **Fair Housing Act** — prohibits discrimination in the sale, rental, financing, and
  advertising of housing on the basis of race, colour, religion, sex (including sexual
  orientation and gender identity under HUD's current interpretation), national origin,
  familial status, and disability.
- **State and local additions** — many jurisdictions add **source of income** (making
  voucher refusal illegal), age, marital status, military status, and criminal history
  protections.
- **ECOA / Regulation B** — prohibits credit discrimination and requires **specific
  adverse action reasons** when credit is denied or offered on worse terms.
- **HMDA** — requires lenders to report loan-level data including race, ethnicity and
  sex, which makes lending outcomes publicly analysable. Regulators, journalists and
  plaintiffs' lawyers mine it.

### Disparate treatment vs disparate impact

**Disparate treatment** is intentional. **Disparate impact** is a facially neutral policy
or model that produces materially different outcomes for a protected class. **Liability
does not require intent, and the protected characteristic need never be an input.**

This is the single most important legal concept for anyone building models in housing,
so state it plainly: *a model that has never seen race can still create race
discrimination liability.* Zip code, school rating, credit history, criminal record,
neighbourhood "quality", and historical prices are all correlated with race in the US
because of historical discrimination. A model trained to reproduce historical outcomes
will reproduce historical discrimination and score it as accuracy.

### The precedents that matter to a builder

- **The 2022 HUD/DOJ settlement with Meta** established that an **ad delivery algorithm**
  can violate the Fair Housing Act even where the advertiser's targeting was lawful.
  Any system deciding which housing listings which people see is in scope.
- **CFPB circulars on adverse action and complex models** make clear that using a model
  you cannot explain does not relieve the obligation to give specific reasons. If you
  cannot explain it, you may not lawfully use it to decide.
- **The interagency AVM quality control rule** requires institutions using automated
  valuation models in credit decisions to maintain quality controls including a
  **nondiscrimination** factor.
- **HUD guidance on criminal-record screening** in tenancy holds that blanket bans
  produce disparate impact and that individualised assessment is expected.

### Design rules that follow

1. **Assemble evidence; do not make the protected decision.** Build the system that
   gathers, verifies, and documents. Leave accept/deny to a human with a record.
2. **If you must score, you must explain.** Reason codes, feature attribution, and
   documented testing are product requirements, not compliance theatre.
3. **Test for disparate impact before launch and continuously after.** Not as a
   one-off audit.
4. **Refuse comparative-quality questions about places and people.** "Is this a good
   neighbourhood" has no safe answer. Facts about a place are fine; judgments that map
   onto who lives there are not.

## 4. Consumer-contact law: the AI agent's hardest constraint

Most first-draft AI product ideas in real estate involve contacting consumers at scale.
This section is why most of them need redesigning.

| Rule | What it restricts | Why it matters for AI |
|---|---|---|
| **TCPA** | Calls and texts to mobile numbers using an autodialer or an **artificial or prerecorded voice**, without prior express consent | **The FCC declared in February 2024 that AI-generated voices are "artificial" voices.** An outbound AI voice call to a consumer therefore requires prior express consent at the robocall standard. This is the single most consequential fact in this section |
| **TCPA damages** | $500 per violation, trebled to $1,500 for wilful violations, with a private right of action and class actions | A campaign of 20,000 texts is a potential $10m+ exposure. There is no "move fast" option |
| **National Do-Not-Call Registry** | Telemarketing calls to registered numbers | Established-business-relationship exception exists but is narrow and time-limited |
| **State mini-TCPAs** (Florida, Oklahoma, Washington and others) | Often stricter than federal law | Separate private rights of action |
| **Call recording consent** | Two-party consent in roughly a dozen states including California | Any system that transcribes calls needs a consent flow |
| **Bot disclosure** (California SB 1001 and similar) | Undisclosed bots used to incentivise a transaction | Disclose that the counterpart is a machine |
| **CAN-SPAM** | Commercial email | Comparatively permissive; opt-out and identification required |
| **State AI statutes** (Colorado, Utah and others) | Disclosure and, in some cases, duties around consequential decisions including housing | An emerging and fast-moving layer |

### The practical shape this forces

| Contact pattern | Viability |
|---|---|
| Inbound: consumer contacts you, agent responds | **Viable.** The strongest position |
| Consented lead follow-up (the consumer submitted a form with clear consent language) | **Viable with careful consent capture and records** |
| Outbound text to an existing client with a relationship | Viable with care; consent and revocation tracking required |
| Cold outbound AI voice to consumers | **Do not.** Squarely within the artificial-voice prohibition |
| Cold outbound SMS at volume to purchased lists | **Do not.** The wholesaling sector's litigation history is instructive |
| **Agent-facing / back-office: no consumer contact at all** | **No TCPA exposure whatsoever** |

**Note that last row.** It is the strategic point of this section: the entire
back-office half of real estate — coordination, processing, abstraction, compliance,
accounting — carries none of this risk. When a consumer-contact idea and a back-office
idea look equally attractive, the back-office one is worth substantially more because
it is not one FCC ruling away from being illegal.

## 5. Transaction and settlement regulation

- **RESPA Section 8** — prohibits anything of value for the **referral** of settlement
  service business (mortgage, title, escrow, appraisal, insurance). Kills referral-fee
  marketplace models. Charge for software or services actually rendered at fair market
  value; never for sending business. Affiliated Business Arrangements are a narrow
  disclosed safe harbour; Marketing Services Agreements are a grey zone with an
  enforcement history. See chapter 01.
- **RESPA Section 9** — a seller may not require the buyer to use a particular title
  company.
- **TRID** — Loan Estimate and Closing Disclosure content and timing, with tolerance
  rules and cures. See chapter 03.
- **FinCEN Residential Real Estate Rule** — reporting obligations on certain
  **non-financed** transfers of residential property to legal entities and trusts,
  aimed at money laundering through real estate. It places a new reporting burden on
  settlement professionals. **Check its current effective date and scope directly** —
  the timeline has moved.
- **Corporate Transparency Act / beneficial ownership reporting** — the scope of who
  must report changed materially in 2025. Verify the current position rather than
  relying on any summary, including this one.
- **OFAC sanctions screening** — parties to a transaction must be screened against
  sanctions lists.
- **Escrow and trust accounting** — segregated accounts, no commingling, periodic
  three-way reconciliation. A common source of licence discipline, and a clean
  automation target.

## 6. Property tax and the investor tax layer

### Property tax

The mechanics: an assessor determines an assessed value → exemptions are applied
(homestead, senior, veteran, agricultural) → a **mill rate** or percentage set by
taxing jurisdictions is applied → a bill issues. Appeals follow a statutory calendar
with **hard deadlines** (see chapter 05).

Property tax is often the single largest operating expense line for a commercial
property, which is why **contingency-fee tax appeal consulting** is a real industry.

**Transfer taxes and recording fees** apply on conveyance and vary enormously — from
nominal to several percent of price depending on the jurisdiction. In India the
equivalent is stamp duty, which is far higher (chapter 13).

### The investor tax layer

| Concept | What it does | Why it creates work |
|---|---|---|
| **Depreciation** | Deducts the building's cost over a statutory life (residential and commercial lives differ) | Requires cost basis tracking per asset per year |
| **Cost segregation** | An engineering study reclassifying components into shorter depreciable lives to accelerate deductions | A whole consulting sub-industry |
| **Bonus depreciation** | Immediate deduction of a share of qualifying property; the percentage has changed repeatedly by legislation | Verify the current schedule; it moves |
| **1031 exchange** | Defers gain on like-kind exchange; 45/180-day deadlines | Pure calendar risk with large money |
| **Passive activity loss rules / real estate professional status** | Limits when losses can offset other income | Requires hour-tracking documentation |
| **QBI / Section 199A** | Deduction for qualifying business income | Entity structuring and documentation |
| **Opportunity Zones** | Deferral and exclusion for qualifying investments | Long compliance and reporting tail |
| **K-1 reporting** | Passes partnership income to investors | Annual production per investor per entity (chapter 08) |

## 7. Insurance

### The products

Homeowners, landlord (dwelling fire), commercial property, general liability, builder's
risk, business interruption, flood (largely the **NFIP** in the US, with a growing
private market), earthquake, **title** (chapter 04), **errors and omissions** for agents,
appraisers and property managers, renters insurance, and umbrella coverage.

### The live crisis, and why it belongs in a real estate guide

Since roughly 2023, property insurance in catastrophe-exposed US markets has been under
severe stress: major carriers restricting or withdrawing from California and Florida,
sharp premium increases, non-renewals, and growing reliance on state-backed **FAIR
plans** as insurers of last resort. Reinsurance costs rose and passed through.

**Why this matters to you as a builder, not just as background:**
- Insurance cost is now a material and volatile line in underwriting. Deals that penciled
  at old premiums do not at new ones.
- In some markets **insurability affects transactability** — a buyer who cannot obtain
  coverage cannot obtain a mortgage.
- Property condition data (roof age, defensible space, wildfire mitigation, water
  mitigation devices) now has direct financial value, which is why computer-vision
  property intelligence companies found a real market in insurance before they found
  one in real estate.

### Claims

FNOL (first notice of loss) → adjuster assignment → inspection → estimate → coverage
determination → settlement → repair. After a catastrophe, carriers surge in
**independent adjusters** who work storm deployments — inspecting dozens of properties
in sequence, photographing damage, writing estimates in **Xactimate** (the dominant
estimating platform), and dealing with distressed homeowners.

Roles: agent/broker, underwriter, **claims adjuster** (staff, independent, or public —
the last representing the policyholder), catastrophe adjuster, risk manager, loss control
inspector, reinsurance analyst.

## 8. Environmental and climate

- **Phase I / Phase II Environmental Site Assessment** — standardised (ASTM) due
  diligence establishing the "innocent landowner" defence under CERCLA. Phase I is
  records and interviews; Phase II is sampling.
- **Lead paint** — federal disclosure for pre-1978 housing; renovation rules for
  contractors.
- **Asbestos, radon, mould** — disclosure and abatement regimes varying by jurisdiction.
- **Flood** — FEMA mapping, NFIP, and **Risk Rating 2.0**, which repriced flood insurance
  toward actuarial rates. Seller flood-history disclosure requirements vary
  significantly between states, and several states still require little or nothing.
- **Wetlands and endangered species** — federal permitting that can stop a development.
- **Building performance standards** — municipal emissions and energy caps with annual
  filings and penalties (chapter 09).
- **Climate disclosure** — the SEC's climate rule and California's disclosure statutes
  have both faced litigation and revision. Verify current status.

## 9. Where compliance IS the repetitive work

The payoff section. Each of these exists **only because a rule requires it**, recurs on a
schedule, is governed by explicit rules, and is still largely done by hand. They are the
cleanest agent-shaped work in the industry, and they are counter-cyclical: compliance
does not stop when transaction volume falls.

| Process | Chapter | Frequency | Why it's still manual | Consequence of failure |
|---|---|---|---|---|
| **Mechanics lien preliminary notices and filings** | 07 | Per project, per state deadline | Deadlines differ by state and by party tier | **Total forfeiture of lien rights** |
| **Certified payroll (Davis-Bacon and state equivalents)** | 07 | Weekly, per worker | Wage classification judgment plus form assembly | Withheld payment, penalties, debarment |
| **LIHTC income certification and annual recertification** | 02 | Annual, per household | Rules-heavy, document-driven | Tax credit recapture — very large |
| **Lease option/notice date tracking** | 09 | Continuous | Dates buried in 90-page leases | Losing a renewal right or being locked into space |
| **COI (certificate of insurance) tracking** | 02, 07, 09 | Continuous, hundreds of vendors | Certificates are PDFs; expiry is a date inside them | Uninsured vendor working on site |
| **Escrow / trust account three-way reconciliation** | 02, 04 | Monthly | Bank, book, and beneficiary ledgers | Licence discipline; misappropriation exposure |
| **HMDA data assembly and scrubbing** | 03 | Annual with ongoing collection | Data quality across many fields and systems | Regulatory findings; fair lending scrutiny |
| **REIT quarterly asset and income testing** | 08 | Quarterly | Done in spreadsheets from holdings data | Loss of REIT status — catastrophic |
| **K-1 production and distribution** | 08 | Annual, per investor | Allocation plus state apportionment | Late K-1s; investor anger; penalties |
| **Side letter obligation tracking** | 08 | Continuous | Obligations live in negotiated PDFs | Breach of investor agreements |
| **Licence and continuing-education renewal tracking** | All | Annual/biennial, per person per state | Multi-state licensees track many renewal dates | Unlicensed activity |
| **State-specific tenant notice generation** | 02 | Continuous | Content and timing prescribed per jurisdiction | Case dismissed on a technicality |
| **Self-storage lien sale notices** | 10 | Continuous | Statutory sequence per state | Void sale; liability to the tenant |
| **Foreclosure notice sequences** | 10 | Per file | Statutory content and timing | Invalid foreclosure |
| **1031 exchange 45/180-day deadlines** | 08, 10 | Per exchange | No extensions | Full taxation of the gain |
| **Building performance standard filings** | 09 | Annual, per building per jurisdiction | Jurisdiction-specific formats | Financial penalties |
| **Property tax appeal deadline calendars** | 05 | Annual, per county | Every county its own date | A year's overpayment locked in |
| **OFAC / KYC / AML screening** | 04, 08 | Per transaction, per investor | Name matching plus documentation | Sanctions violation |
| **FinCEN residential transfer reporting** | 04 | Per qualifying transfer | New obligation on settlement agents | Penalties |
| **NSPIRE / HQS inspection preparation** | 02 | Periodic | Physical standards evidence | Failed inspection; subsidy risk |

**Three things this table has in common,** and they are the criteria worth applying to
any use case you generate:

1. **The rule defines "correct" explicitly.** Unlike judgment work, there is a right
   answer, written down. That makes verification possible — which is what makes an
   agent trustworthy enough to deploy.
2. **The consequence of failure is specific and expensive**, which means someone will
   pay to avoid it. Compare this to "save an agent 20 minutes", which is real but hard
   to price.
3. **Nobody enjoys doing it**, so there is no organisational resistance to automating it
   — unlike work that people consider their professional identity.

## 10. Roles and days in the life

### Brokerage compliance reviewer — day in the life

- **Who they are:** works for a brokerage, reviewing every closed and pending file
  against a checklist. Measured on files reviewed per day and on audit findings.
- **Their stack:** dotloop or SkySlope, the state association's form library, a checklist,
  email.

**A typical day:** work a queue of 20-40 files. For each: is every required form present;
is every signature and initial complete and dated; are the dates internally consistent
(the disclosure delivered *before* the offer, not after); is the buyer representation
agreement executed and dated before the first showing; are commission terms consistent
between the listing agreement, the contract and the CDA; are lead paint and other
required disclosures attached for qualifying properties; is the agent's licence current.
Then **chase the agent** for each deficiency — and chasing agents who are focused on
their next deal is most of the job.

**Repetitive-work inventory**

| Task | Frequency | Minutes | Why manual | Data in → data out |
|---|---|---|---|---|
| Checklist review of a file | 20-40/day | 5-20 | Documents are PDFs; the rules are a written checklist | File → pass/deficiency list |
| Signature and date completeness check | Every file | 3-10 | Visual inspection of many pages | PDFs → completeness result |
| Cross-document consistency check | Every file | 5-15 | Comparing values across separate documents | Multiple PDFs → consistency result |
| Chasing agents for missing items | Continuous | 2-5 each | Agents deprioritise it | Deficiency → corrected file |
| Audit reporting | Monthly | Hours | Assembled by hand | Review data → report |

### Mortgage QC auditor — day in the life

Post-close, a required sample of funded loans is re-underwritten to confirm the file
supports the decision, the data is accurate, and disclosures were timely. The auditor
re-verifies income calculations, re-checks the AUS findings against the documents,
confirms TRID timing, re-runs fraud and identity checks, and writes up defects by
severity. Defects are then rebutted by the origination team and either cured or
reported to investors. **It is a rules-checking job performed on a file someone else
already checked** — and it exists because investors and regulators require it.

### Property tax appeal consultant — day in the life

Covered in chapter 05. In brief: bulk-screen assessment rolls, file petitions before
per-county deadlines, assemble evidence packets, attend hearings, negotiate settlements,
bill on contingency.

### Insurance claims adjuster after a catastrophe — day in the life

Deployed to a storm-affected region for weeks. Each day: a route of 6-12 property
inspections; at each, photograph all damage systematically, measure, assess cause and
coverage, and write a repair estimate in **Xactimate** line by line (each line a coded
item with a unit price); explain coverage to a homeowner who is often distressed and
sometimes hostile; upload documentation. Evenings are spent writing estimates.
**The volume of structured photo documentation and line-item estimating is the work.**

### AML / BSA analyst — day in the life

Reviews transactions and parties flagged by screening: name matches against sanctions
and PEP lists (most are false positives requiring manual clearance), unusual structuring,
entity ownership that obscures a beneficial owner. Documents the review, escalates the
genuine cases, and files reports where required. **A large majority of the work is
clearing false positives** — a well-defined, high-volume, evidence-documented triage task.

## 11. Glossary

- **Adverse action** — Denying credit or offering worse terms; triggers a reasons requirement under ECOA.
- **AfBA** — Affiliated Business Arrangement; a disclosed RESPA safe harbour.
- **AML / BSA** — Anti-Money Laundering / Bank Secrecy Act.
- **CERCLA** — The US environmental liability statute behind Phase I assessments.
- **Disparate impact** — Facially neutral practice producing discriminatory outcomes; unlawful without intent.
- **DNC** — Do Not Call registry.
- **ECOA / Regulation B** — Equal Credit Opportunity Act and its implementing regulation.
- **E&O** — Errors and omissions professional liability insurance.
- **FAIR plan** — State-backed property insurer of last resort.
- **FHA (statute)** — Fair Housing Act. Distinct from FHA the loan programme; context disambiguates.
- **FinCEN** — Financial Crimes Enforcement Network.
- **FNOL** — First Notice of Loss.
- **HMDA** — Home Mortgage Disclosure Act.
- **Mill rate** — Property tax rate expressed in thousandths.
- **NFIP** — National Flood Insurance Program.
- **OFAC** — Office of Foreign Assets Control; sanctions screening.
- **Phase I ESA** — Environmental Site Assessment.
- **RESPA** — Real Estate Settlement Procedures Act.
- **SAFE Act** — Federal law requiring mortgage loan originator licensing.
- **TCPA** — Telephone Consumer Protection Act.
- **TRID** — TILA-RESPA Integrated Disclosure rule.
- **UDAAP** — Unfair, Deceptive, or Abusive Acts and Practices.
- **UPL** — Unauthorized Practice of Law.
- **Xactimate** — The dominant property claims estimating software.

## 12. Verify before you rely on this

**This chapter is the one most likely to go out of date, and the one where being wrong
is most costly. Treat everything in it as orientation and verify anything you build on.**

| Claim | Why it moves | Check against |
|---|---|---|
| **TCPA consent rules and the AI-voice ruling** | Active FCC rulemaking and litigation; a 2025 appellate decision vacated part of the consent framework | FCC docket CG 02-278; counsel |
| **FinCEN residential real estate rule** — effective date and scope | Timeline has shifted | FinCEN; Federal Register |
| **Corporate Transparency Act reporting scope** | Changed materially in 2025 | FinCEN |
| **CFPB enforcement posture and circular status** | Changed materially in 2025; can revert | CFPB; counsel |
| **HUD guidance on criminal screening and fair housing** | Revisited across administrations | HUD FHEO |
| **SEC and California climate disclosure rules** | Litigated and revised | SEC; CARB |
| **Bonus depreciation percentage** | Set by legislation; changed repeatedly | IRC; current tax legislation |
| **State AI statutes** (Colorado, Utah and others) | New and amending rapidly | State legislature |
| **Insurance market withdrawals and FAIR plan status** | Changing season to season | State insurance departments |
| **Flood disclosure requirements by state** | A patchwork that is gradually tightening | State statutes; NRDC and similar trackers |
| **Any licensing question in a specific state** | Amended regularly | That state's commission |

**Method note.** This chapter was written from domain knowledge after a rate limit ended
the research fan-out. It is an orientation to the *shape* of the rules layer, written for
an engineer scoping products — **it is not legal advice, and it is not a compliance
control.** Every substantive decision described here should be reviewed with counsel
licensed in the relevant jurisdiction before it becomes a product feature.
