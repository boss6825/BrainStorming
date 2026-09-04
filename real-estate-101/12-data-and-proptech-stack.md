# 12 · The Data Layer and the Proptech / AI Stack

> Written engineer-to-engineer. Every chapter before this one described work that could
> be automated. This chapter answers the question that determines whether any of it is
> actually buildable: **can you get the data, can you integrate with the system of
> record, and has someone already built this?**
>
> Read section 5 (integration reality) before you get attached to an idea. In real
> estate, feasibility is far more often a *licensing* question than an engineering one.

## Contents

- [1. The data map](#1-the-data-map)
- [2. The legal reality of getting data](#2-the-legal-reality-of-getting-data)
- [3. The proptech landscape](#3-the-proptech-landscape)
- [4. What AI is actually doing in production](#4-what-ai-is-actually-doing-in-production)
- [5. Integration reality: the API table](#5-integration-reality-the-api-table)
- [6. Data-side roles and their days](#6-data-side-roles-and-their-days)
- [7. Building here: practical notes](#7-building-here-practical-notes)
- [8. Glossary](#8-glossary)
- [9. Verify before you rely on this](#9-verify-before-you-rely-on-this)

---

## 1. The data map

### MLS data (US for-sale listings)

**What it is.** Roughly 500 regional Multiple Listing Services, each a cooperative owned
by its member brokers, each holding the authoritative listing data for its territory.
Consolidating slowly, but still highly fragmented.

**How you get it.** Not by scraping. You apply to each MLS, sign a data licence, and
consume a feed under a defined use category:

| Category | What it permits |
|---|---|
| **IDX** | Display of other brokers' listings on a broker's own website, with rules on attribution, refresh frequency, and what may be shown |
| **VOW** (Virtual Office Website) | Broader consumer display, behind a registration and broker-consumer relationship |
| **Syndication** | Feeds to portals |
| **Back office / broker data** | A brokerage's own data for its own operations |

**The standards.** **RESO** (Real Estate Standards Organization) publishes the **Data
Dictionary** (a common field vocabulary) and the **Web API** (an OData-based REST
interface). NAR-affiliated MLSs are required to support them. **RETS** was the older
XML pull standard and is deprecated. RESO adoption genuinely helps — but field coverage
and local extensions still vary between MLSs, so "RESO-compliant" does not mean
"identical schema".

**The aggregators**, which are the practical integration path:

| Aggregator | Owner | Notes |
|---|---|---|
| **Bridge Interactive** | Zillow | Free feeds for approved applications; note who owns it |
| **Trestle** | CoreLogic | Broad MLS coverage, paid |
| **MLS Grid** | MLS-backed | RESO-native, standardised licensing across participating MLSs |
| **Spark Platform** | FBS | API access for FBS-served MLSs |

**They reduce plumbing, not permissioning.** You still need each MLS's approval and each
MLS's licence terms. Budget months, not days, for national coverage.

### Public records

| Dataset | Source | Reality |
|---|---|---|
| Assessment / tax roll | County assessor | Format and access vary per county. Some offer bulk downloads, many offer only a search page |
| Deeds and mortgages | County recorder | The authoritative ownership record. Wildly varying digitisation, often nothing before the 1980s |
| Parcel boundaries / GIS | County or state | Increasingly available; **Regrid** aggregates nationally |
| Building permits | Municipality | ~19,000 sources; a genuine mess |
| Code violations | Municipality | Same |
| Court records (eviction, foreclosure) | County courts | Access varies; some states restrict bulk access |

**The aggregators:** ATTOM, CoreLogic, First American DataTree, Black Knight/ICE,
Lightbox, Regrid, Estated, PropMix. They exist precisely because normalising 3,100
counties is expensive. Pricing is typically per-record or a substantial annual licence.

**The honest note:** "just get the public records" is the most common underestimation by
engineers new to this industry. The data is *public* in the legal sense and
*inaccessible* in the practical sense. Building your own national public-records pipeline
is a company, not a feature.

### Portals and the lead economy

Zillow, Realtor.com (Move/News Corp), Redfin, Homes.com (CoStar), Trulia, Apartments.com
(CoStar), Rent.com, Zumper.

**Their business model is selling leads to agents, not selling data.** Understanding
this explains most consumer-facing industry behaviour: the portal aggregates consumer
demand and monetises it by charging agents for introductions, sometimes on a
pay-per-lead basis and sometimes as a **referral fee percentage of the commission** on
closing. That is why portals guard their consumer data absolutely and why no useful
public API exists.

### Commercial real estate data

| Source | What it holds | Access |
|---|---|---|
| **CoStar** | Properties, tenants, availabilities, sale and lease comps | Expensive subscription; **no redistribution**; actively litigated |
| Crexi | Listings and data; the main challenger | Subscription |
| CompStak | Lease comps, crowdsourced from brokers who contribute to get access | Subscription; clever incentive design |
| Reonomy, Moody's/REIS, Green Street | Ownership, market analytics, valuation | Subscription |
| Placer.ai | Mobile-location-derived foot traffic | Subscription |

**CoStar's moat is worth studying:** it is not primarily technology. CoStar employs a
large research staff who telephone brokers and property managers to collect data that
exists in no public record. Two decades on, that manual collection operation remains the
moat. It is a striking counterexample to the assumption that data collection is
inevitably automated away.

### Geospatial, imagery, and property intelligence

Parcel boundaries (Regrid, county GIS), aerial and satellite imagery (Nearmap,
EagleView, Vexcel, Google), computer vision on property condition and roofs (Cape
Analytics, Zesty.ai, Restb.ai), interior capture (Matterport, CubiCasa, Polycam), LiDAR.

**Note where this found its market:** these companies sell substantially into
**insurance** — where a roof's condition has immediate underwriting value — more than
into real estate proper. A recurring pattern: property data monetises better in adjacent
industries than in real estate itself.

### Risk data

FEMA flood maps and NFIP data, First Street Foundation (climate risk), wildfire models,
crime data, school ratings.

**Two cautions.** First, school and crime data are **fair-housing sensitive** — they are
well-documented proxies for race, and surfacing them as neighbourhood quality signals is
legally risky (chapter 11). Second, FEMA flood maps are known to understate risk in
many areas, which is why private climate risk models emerged.

### Mortgage and credit data

**HMDA** is genuinely useful and genuinely open: loan-level records including
application outcome, loan characteristics, and applicant race, ethnicity and sex, for
most US mortgage lending. It is one of the richest public datasets in US finance and is
underused by builders. **MISMO** is the industry data standard (chapter 03). GSE
loan-level performance datasets are published for research. Credit bureau and payroll
data (The Work Number, Truv, Argyle, Plaid) are commercial and permissioned.

### Rental data

**There is no MLS for rentals.** No authoritative, standardised, licensable source of
what is available at what rent. The gap is filled by ILS portals (Zillow Rentals,
Apartments.com), by property management systems holding their customers' data, and by
research products (Zillow's rent indices, ApartmentList, Yardi Matrix, CoStar). Note
that aggregating competitors' non-public rents carries the antitrust exposure discussed
in chapter 02.

## 2. The legal reality of getting data

The question every engineer asks: **can I just scrape it?** The honest answer is
"sometimes, narrowly, and the cases you are thinking of do not say what you think".

| Case / rule | What it actually established |
|---|---|
| **hiQ v. LinkedIn** | Scraping *public* data is unlikely to violate the Computer Fraud and Abuse Act — but hiQ ultimately lost on **breach of contract** for violating LinkedIn's terms of use. The headline "scraping is legal" is a misreading |
| **Van Buren v. United States** | Narrowed CFAA "exceeds authorised access"; helpful for scrapers but about authorisation, not terms of service |
| **CoStar v. CREXi** | Long-running litigation over use of CoStar's data and photographs. Establishes that data owners in this industry will litigate aggressively |
| **MLS rules** | Contractual, not statutory: your data licence dictates display, retention, refresh, and redistribution. Violating it terminates your access — which is usually worse than a lawsuit |
| **Copyright in listing photographs** | **This bites constantly.** The photographer typically owns the copyright, not the agent, the seller, or the MLS. Sites that copy listing photos have faced repeated infringement claims |
| **Terms of service** | The practical constraint on most portals. Even where scraping is not criminal, it is a contract breach that can end access and support an injunction |

**Practical guidance:**
- **Never build a business whose core input is scraped from a party that will notice.**
  You are constructing a dependency on a data owner's forbearance.
- **Licensed feeds are slower to obtain and vastly more durable.** Budget the time.
- **The safest data is your customer's own.** Their leases, their rent rolls, their loan
  files, their work orders. No licensing question, no scraping risk, and it is the data
  most of this guide's drudgery actually operates on. **This is the single most
  important strategic observation in the chapter.**

## 3. The proptech landscape

An honest status map. The 2021-22 funding boom was followed by a severe contraction,
and a great deal of the category is consolidating or gone.

| Category | Notable names | Honest status |
|---|---|---|
| **iBuying** | Opendoor; Zillow Offers and RedfinNow (dead) | Structurally difficult. Capital-intensive, rate-exposed, thin margin |
| **Power buyers / cash offers** | Homeward, Orchard, Knock, EasyKnock, Ribbon | Heavy attrition; several failed or pivoted |
| **Rent-to-own** | Divvy, Home Partners (Blackstone), Landis | Struggled; regulatory and reputational scrutiny |
| **Fractional / tokenised ownership** | Arrived, Roofstock, Lofty, Pacaso, RealT | Persistent niche; tokenisation has not solved liquidity because the constraints are legal, not technical |
| **Brokerage tech** | Compass, Rechat, Lofty, Side | Consolidating; tooling is a recruiting expense |
| **Mortgage tech** | Blend, Maxwell, nCino, Ocrolus, Zest, Candor | Real products; the front end got solved, the middle did not |
| **Title tech** | Qualia (won), Doma (public collapse, taken private), Endpoint, Spruce, JetClosing (dead) | Workflow won; instant underwriting did not |
| **PM tech** | AppFolio, Buildium, DoorLoop, EliseAI, Funnel, Property Meld | The most competitive AI vertical in real estate |
| **Construction tech** | Procore (won), Levelset (acquired), Built, Rabbet, OpenSpace, Buildots, Katerra (bankrupt) | Coordination and money-flow won; vertical integration failed |
| **CRE tech** | VTS, Dealpath, CompStak, Cherre, Northspyre, Prophia | Moderate scale; data licensing is the constraint |
| **FM tech** | Corrigo, Building Engines, Nuvolo, SmartRent, Density | Workflow of record won; sensing and analytics struggled |
| **Insurtech (property)** | Hippo, Lemonade, Kin, Steadily | Public market disappointment; underwriting is hard |
| **Investor / fund tech** | Juniper Square, Agora, Altvia | Genuine success in back-office administration |

**Pattern across the whole table, worth stating explicitly:** the winners owned a
**workflow of record** that someone was obliged to run (Procore, Qualia, Juniper Square,
Corrigo, AppFolio). The losers tried to take **principal risk** on real estate assets
(iBuyers, power buyers, Katerra) or to sell **insight without an obligation** (analytics
dashboards, digital twins).

## 4. What AI is actually doing in production

Be rigorous here. Separate what is deployed and paid for from what is a pilot from what
is marketing.

### (i) Genuinely deployed and paid for

| Application | Vendors | Notes |
|---|---|---|
| **Leasing conversation AI** (text/email) | EliseAI, Funnel, Zuma, Colleen | The most mature AI category in real estate. Enterprise multifamily adoption is real |
| **Document extraction** | Ocrolus, Candor, and the incumbents' own features | Paystub, bank statement, and loan document parsing is **commoditised**. Do not build this as a business |
| **Lease abstraction** | Prophia, MRI/Leverton, Occupier | Real products; contested market |
| **Computer vision on property imagery** | Cape Analytics, Zesty.ai, Restb.ai | Sold mainly into insurance and MLS compliance |
| **Automated appraisal review and waivers** | Fannie's Collateral Underwriter, Freddie's LCA | The largest-scale AI deployment in US real estate, and it belongs to the GSEs |
| **Revenue management / pricing** | RealPage, Yardi, IDeaS, PriceLabs, Beyond | Mature — and now carrying antitrust risk in multifamily |
| **Listing content generation** | Embedded in most CRMs and MLS tools | Solved, commoditised |
| **AI text lead response** | Structurely, Ylopo, Lofty | Established category |

### (ii) Pilots and pilot purgatory

Autonomous HVAC optimisation (real deployments, savings claims hard to verify
independently); AI construction takeoff (accuracy contested on complex scopes);
underwriting copilots for CRE; digital twins; general-purpose "real estate copilots"
attached to CRMs; voice agents for inbound calls (technically capable, constrained by
consent rules and by integration depth).

### (iii) Mostly marketing

"AI-powered" applied to conventional statistical scoring; predictive seller-lead
models with unverifiable accuracy claims; blockchain title; the general claim that a
chatbot over a CRM constitutes agentic automation.

### (iv) The competitive baseline nobody mentions

**The real incumbent is an offshore analyst.** Across title search, mortgage processing,
lease abstraction, fund accounting, CAD drafting, CRE research, valuation support, and FM
help desk, the established solution is a trained person in India or the Philippines
working a night shift for a fraction of a US salary.

State the implication plainly: **an AI agent in these workflows is not competing against
nothing. It is competing against a competent human at a low hourly cost, who handles
exceptions gracefully, needs no integration work, and carries no compliance novelty.**

That has three consequences:
1. Pure cost-per-task arguments are weaker than they look. Compete on **speed,
   consistency, coverage hours, auditability, and scale elasticity**.
2. The strongest near-term products often **augment the offshore team** rather than
   replace it — which is a real business with a real buyer.
3. **If you are building from India, you have a structural advantage**: you can see the
   actual workflow, hire people who have done it, and build hybrid human-plus-agent
   delivery that a purely software company cannot. See chapter 14.

## 5. Integration reality: the API table

The most actionable table in this chapter. "Can I integrate?" decides more real estate
product ideas than "can I build it?".

| System | Category | Public API? | Access reality | Hostility to third parties |
|---|---|---|---|---|
| **Procore** | Construction | **Yes, well documented** | Developer programme, marketplace | **Low — a genuine ecosystem.** The positive outlier |
| **ENERGY STAR Portfolio Manager** | Benchmarking | **Yes, free, public** | Open | None |
| **HMDA / FFIEC** | Mortgage data | **Yes, free, public** | Bulk download and API | None |
| DocuSign | E-signature | Yes | Standard | Low |
| Salesforce | CRM | Yes | Standard | Low |
| **Juniper Square** | Fund admin | Yes | Partner | Low-medium |
| **MLS Grid / Trestle / Bridge / Spark** | MLS feeds | Yes (RESO Web API) | **Per-MLS approval plus licence.** Months of paperwork | Medium — procedural, not adversarial |
| Follow Up Boss | Brokerage CRM | Yes | Usable public API | Low |
| **ICE / Encompass** | Mortgage LOS | Yes (Developer Connect) | Partner programme, paid | Medium-high |
| Blend, nCino, Maxwell | Mortgage POS | Yes | Partner | Medium |
| **Qualia** | Title production | Yes | Partner marketplace | Medium |
| SoftPro, RamQuest, ResWare | Title production | Limited | Partner, often bespoke | Medium-high |
| **AppFolio** | Property management | Yes, limited | Partner | Medium |
| **Yardi** | Property/investment management | Yes, but **gated and commonly charged per interface** | Partner agreement; a persistent practitioner complaint about cost and friction | **High** |
| **RealPage** | Property management | Partner-gated | Partner agreement | High |
| Entrata | Property management | Partner-gated | Partner agreement | Medium-high |
| MRI | Property/investment | Partner-gated | Partner agreement | High |
| **Argus Enterprise** | CRE valuation | Very limited | Proprietary file format | **High — the format is the moat** |
| Building automation systems | Building control | **BACnet / Modbus open protocols**, plus **Tridium Niagara** as the integration layer | Site-by-site access; data is poorly labelled | Low protocol hostility, high practical friction |
| CMMS/IWMS (Corrigo, Maximo, Planon, Archibus) | Facilities | Varies | Enterprise/partner | Medium-high |
| **CoStar** | CRE data | **No** | Subscription only; redistribution prohibited and litigated | **Very high** |
| **Zillow / Realtor.com / Redfin** | Consumer portals | Effectively no | Their business is leads, not data | **Very high** |
| County recorders and assessors | Public records | ~None; a handful of exceptions | Per-county portals, some bulk files, much CAPTCHA and paper | Not hostile, just absent |
| **Municipal permitting** (Accela, Tyler EnerGov, OpenGov) | Govtech | Limited; jurisdiction-configured | Procurement-gated | Medium |

**How to read this table.** Three tiers:

1. **Open and buildable:** Procore, HMDA, Portfolio Manager, BACnet, DocuSign, modern
   CRMs. Start here if you want to ship.
2. **Gated but reachable with commercial effort:** MLS feeds, LOS platforms, title
   production systems, PM platforms. Months of business development, real money, and a
   partner agreement. Viable with patience.
3. **Effectively closed:** CoStar, consumer portals, Argus's format. Build around them,
   not through them.

**The strategic conclusion, again:** the most reliably accessible data in real estate is
**your own customer's documents and records**. That is why document-intelligence and
workflow products can ship faster than data or marketplace products, and it is the
single most useful planning insight in this chapter.

## 6. Data-side roles and their days

### MLS data compliance / listing violation reviewer

Every MLS employs staff who enforce its rules: checking that listings are entered
accurately and on time, that photographs meet standards and do not contain prohibited
content (agent branding, people's faces, signage), that status changes are timely, that
Clear Cooperation obligations are met, and that remarks fields do not contain
contact information or fair-housing-problematic language. They review flagged listings,
issue warnings, and levy fines.

**Repetitive-work note:** this is high-volume, rule-based review of images and text
against an explicit written rulebook. **It is one of the cleanest computer-vision plus
text-classification use cases in the industry**, and MLSs have in fact been early
adopters of vendors like Restb.ai for exactly this.

### CoStar research associate

Described earlier: telephones brokers, owners, and property managers to collect and
verify property, tenant, availability, and comp data that appears in no public record.
Also field verification. **Understand this job before assuming CRE data collection is
automatable** — a well-funded public company has had two decades and strong incentive to
automate it away and still employs people to make the calls, because the data exists only
in someone's head until they are asked.

### Listing input / data entry coordinator

Brokerages and teams employ people (often offshore) to type listing data into the MLS
from a seller's information sheet, upload and order photographs, write remarks, and
correct violations. Pure re-keying between systems.

### Data engineer at a proptech firm

Their day is a familiar shape with an unfamiliar difficulty: ingesting many MLS feeds
with subtly different field usage; normalising county assessment data across hundreds of
schemas; **entity resolution** (deciding that "123 Main St", "123 Main Street Unit 1",
and APN 045-231-09 are the same property — the single hardest recurring technical
problem in real estate data); address standardisation; deduplicating listings that appear
across multiple sources; and maintaining pipelines that break whenever a county changes
its website.

**If you build here, entity resolution and address normalisation will consume more of
your time than you expect.** It is the industry's `NP-hard`-feeling problem.

## 7. Building here: practical notes

A short list of things that would have saved most newcomers months.

1. **Check data access before you design.** Feasibility is usually a licensing question.
2. **Start with your customer's own documents.** No gatekeeper, and it is where the
   drudgery lives.
3. **Pick one jurisdiction and go deep.** National coverage is a moat precisely because
   it is slow; you cannot start with it.
4. **Assume PDF and email are the integration layer.** For a large share of real estate
   counterparties, that is the actual interface, and a product that works over email
   attachments has a wider addressable market than one requiring an API.
5. **Design for verification, not autonomy.** In a liability-heavy industry, an agent
   that shows its work and flags uncertainty is deployable; one that silently decides is
   not. Every regulated workflow in this guide needs an audit trail.
6. **Sell to the person with the obligation.** Compliance deadlines and contractual
   obligations create budget; "efficiency" often does not.
7. **Price against an offshore analyst, not against nothing.**
8. **Expect the buyer and the user to be different people** (chapter 00, section 4).

## 8. Glossary

- **AVM** — Automated Valuation Model.
- **BACnet** — Open building automation communication protocol.
- **Brick Schema / Project Haystack** — Semantic tagging standards for building data.
- **CFAA** — Computer Fraud and Abuse Act; the US anti-hacking statute invoked in scraping disputes.
- **Clear Cooperation Policy** — NAR rule requiring listings to be submitted to the MLS shortly after public marketing.
- **Entity resolution** — Determining that multiple records refer to the same property.
- **HMDA** — Home Mortgage Disclosure Act data; public loan-level mortgage records.
- **IDX** — Internet Data Exchange; the MLS rules and feed for broker websites.
- **ILS** — Internet Listing Service; rental portals.
- **LOS / POS** — Loan Origination System / Point of Sale.
- **MISMO** — The mortgage industry data standard.
- **Niagara** — Tridium's building systems integration framework.
- **RESO** — Real Estate Standards Organization; publishes the Data Dictionary and Web API.
- **RETS** — Real Estate Transaction Standard; the deprecated predecessor to the RESO Web API.
- **VOW** — Virtual Office Website; an MLS data-use category.

## 9. Verify before you rely on this

| Claim | Why it moves | Check against |
|---|---|---|
| MLS count and consolidation | Falling steadily | RESO; Inman coverage |
| Aggregator coverage, pricing, and terms | Commercial and changing | Bridge, Trestle, MLS Grid, Spark directly |
| **Any specific API's availability and cost** | Changes without notice; partner terms are private | The vendor's developer portal, then a sales conversation |
| CoStar v. CREXi outcome | Ongoing litigation | Court dockets |
| hiQ v. LinkedIn final disposition | The case resolved differently from the widely-cited early ruling | The final judgment; counsel |
| Company status across the proptech table | Constant consolidation and failure | Current trade press; filings |
| AI vendor adoption claims | Vendor-reported | Customer references; independent reporting |
| Offshore labour pricing | Commercially sensitive | Direct quotes |

**Method note.** This chapter was written from domain knowledge after a rate limit ended
the research fan-out. API availability and commercial terms in particular are **volatile
and private** — the table in section 5 reflects general market posture and should be
treated as a starting hypothesis to verify with each vendor, not as current fact.
