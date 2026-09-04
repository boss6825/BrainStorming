# 01 · Residential Brokerage and Sales

> **Residential brokerage** is the industry of licensed intermediaries who represent buyers
> and sellers of homes for a fee contingent on closing. In the US this is not one business —
> it is roughly 1.4 million individually licensed people ([NAR membership, 2025](https://www.housingwire.com/articles/nar-2026-member-profile-experience/)),
> most of them legally independent contractors, operating under ~1.5 million active real
> estate licenses, hung under brokerage firms that range from a single agent to a 30,000-agent
> public company. Nobody is required to use one — a seller can sell "For Sale By Owner" (FSBO)
> and a buyer can go direct — but roughly 89% of 2024 home sales involved an agent on at least
> one side ([NAR 2024 Profile of Home Buyers and Sellers](https://www.nar.realtor/research-and-statistics/research-reports/highlights-from-the-profile-of-home-buyers-and-sellers), cited widely; not independently re-verified this session — flagged `[unverified]`).
> The money exists because US home sales are a $2+ trillion/year flow of transactions that are
> each simultaneously a legal contract, a financing event, a title transfer, and (for most
> people) the single largest asset transaction of their life — and because, until August 2024,
> the seller conventionally paid for representation on *both* sides of the deal, a structure a
> federal jury found to be the product of an illegal price-fixing rule and that a 2024
> nationwide settlement forced the industry to unwind. This chapter is about who does what, who
> gets paid when, what software and paperwork the work actually runs on, and where the law
> draws hard lines an AI agent cannot cross.

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

Every dollar in residential brokerage is a **contingent, negotiated fee** — nothing is paid unless
a sale closes, and no government body sets the rate. Until August 17, 2024, the fee was also
**bundled**: the seller signed one listing agreement promising a total commission, and the
listing broker used part of it to pay whichever buyer's agent brought the buyer, advertised
through the Multiple Listing Service (MLS — the regional database of homes for sale; see
§6). The buyer signed nothing about price and often did not know their agent's fee existed.
A federal jury found this bundling illegal in 2024. What follows is the old model, what
changed, and what the money flow actually looks like now.

### 1.1 The 2024 antitrust settlement (Sitzer/Burnett) — what changed and what didn't

In October 2023 a Missouri federal jury found the National Association of Realtors (NAR — the
trade association most US agents belong to) and several large brokerages liable for conspiring
to inflate buyer-broker commissions, by requiring listing brokers to make a blanket,
non-negotiable offer of compensation to buyer's agents in order to list on NAR-affiliated MLSs
(the "Participation Rule"). NAR settled the consolidated cases (*Burnett v. NAR* and the related
*Sitzer* case) in March 2024 for **$418 million paid over four years**, on top of separate
settlements by co-defendant brokerages (Keller Williams, RE/MAX, Anywhere/Realogy, and others),
bringing total disclosed industry relief to **over $1 billion**
([RISMedia, Jan 2026](https://www.rismedia.com/2026/01/15/sitzer-burnett-settlement-deal-nar-january-2025/);
[NAR settlement payment schedule](https://www.nar.realtor/the-facts)). NAR paid $197 million in
February 2025 and owes $72 million more in February 2026.

Two practice changes took effect nationwide on **August 17, 2024** and remain in effect
regardless of the outcome of NAR's pending appeal (oral arguments were heard January 14, 2026;
a ruling was expected late summer/fall 2026 as this chapter was written):

1. **A signed, written buyer agreement is now required before a buyer's agent can tour a home
   with a buyer.** The agreement must state the agent's exact compensation (flat fee, hourly
   rate, or percentage), state it is fully negotiable, and prohibit the agent from receiving
   more than that stated amount from any source (seller concession, listing broker, etc.).
2. **Offers of buyer-broker compensation can no longer be published on the MLS.** A seller/
   listing broker may still choose to pay the buyer's broker — that has not been outlawed — but
   the offer can no longer be broadcast as a blanket MLS field visible to every agent
   nationwide. It must now be negotiated broker-to-broker, disclosed to and approved in writing
   by the seller, and communicated off-MLS (brokerage websites, direct outreach, cover
   letters on offers).

Both changes are about **decoupling and disclosure**, not about banning cooperative
compensation. It is still legal, common, and normal for a seller to pay both sides — it is only
illegal for that offer to be a blanket, MLS-broadcast, non-negotiable rule.

### 1.2 What actually happened in practice by 2025-2026

Commission rates did **not** collapse the way some pre-settlement commentary predicted. A
survey of 806 agents found the average **combined** commission rate was **5.44% in 2025**, up
slightly from 5.32% in 2024 — split roughly 2.77% to the listing side and 2.67% to the buyer
side on a median-priced ($367,711) home, or **$20,003 total**
([Clever/RealTrends survey via Yahoo Finance, 2025](https://finance.yahoo.com/news/agent-commissions-edge-higher-2025-124900985.html)).
RealTrends separately reports combined commissions in 2026 more often landing between 4% and
5.5%. The mechanics changed; the price level, in aggregate, did not fall.

What this chapter **could not verify** with a reliable public figure, despite searching: the
share of buyers now paying their agent directly out of pocket versus via a seller concession
negotiated into the purchase price; the size of the buyer-side fee compression in the minority
of deals where it has fallen; or a national count of buyers who now forgo representation
entirely. Treat any specific number on these three points as speculation unless it cites a
primary source newer than this chapter.

Two operational effects are clear from the practice-change text itself, independent of any
survey:

- **The buyer agreement is a new, mandatory, timestamped document** that did not exist as a
  universal practice before — a compliance artifact every transaction coordinator and managing
  broker must now check for before the first showing, not just before closing.
- **Seller concessions became a more visible workaround.** Because a seller can still agree to
  credit the buyer money at closing (a "concession"), and the buyer can use that credit to pay
  their own agent's contracted fee, a deal can end up looking economically identical to the old
  model while satisfying the new paperwork — the Commission Disbursement Authorization (CDA —
  the closing document instructing the escrow/title company how to split and pay out commission)
  now more often has to reconcile two formally separate promises (the listing agreement's
  seller-authorized payment, if any, and the buyer agreement's buyer-owed fee) instead of one.

### 1.3 Listing-side vs. buy-side money flow

| Step | Who pays whom | Trigger | Typical amount | Governed by |
|---|---|---|---|---|
| Seller → listing brokerage | Total commission owed | Closing | 5.0-6.0% of sale price, negotiable, trending toward 5.44% combined average (2025) | Listing agreement |
| Listing brokerage → buyer brokerage | Cooperative compensation, if seller agreed to pay it | Closing, per CDA | Negotiated broker-to-broker, commonly still near half the total | Written seller authorization (post-Aug 2024, off-MLS) + buyer agreement |
| Buyer → buyer's brokerage | Buyer's agent fee, if not covered by seller/concession | Closing | Whatever the signed buyer agreement states | Buyer-broker agreement (mandatory since Aug 17, 2024) |
| Brokerage → national franchise | Franchise royalty | Ongoing / per transaction | ~5-8% of gross commission off the top, before any agent split | Franchise agreement (e.g., Keller Williams, RE/MAX, Anywhere brands) |
| Brokerage → agent | Agent's split of "company dollar" | Per closed transaction | See §1.4 (split/cap models) | Independent-contractor agreement with brokerage |
| Agent → team lead | Team override, if the lead came from the team | Per closed transaction | Often 20-50 percentage points of the agent's split (see §1.5) | Team agreement (rarely regulated; internal to brokerage) |
| Referring party → receiving brokerage | Referral fee | Per closed transaction sourced from the referral | 25% of GCI (Gross Commission Income) is the commonly cited agent-to-agent industry norm `[unverified — widely repeated in trade content, no primary source confirmed this session]`; portal referral programs run higher (below) | RESPA §8(c) safe harbor — see §7 |
| Buyer/seller's brokerage → lead-gen portal | Portal referral fee | Per closed transaction sourced from portal lead | Zillow Flex: 35-40% of the commission earned; Realtor.com programs: ~30-38% | Referral agreement between portal and brokerage, RESPA §8(c) |

Sources for the portal referral rates: [Zillow Flex fee analysis, The Close](https://theclose.com/zillow-flex/); [bubbleinfo.com on Zillow referral fees, Sept 2025](https://www.bubbleinfo.com/2025/09/21/zillow-referral-fees/); [Realtor.com lead cost breakdown](https://webroimantra.com/blog/realtor-com-leads-cost/).

### 1.4 Commission splits, caps, and 100%-commission brokerages

Brokerages compete on how much of the agent's earned commission the brokerage keeps (the
"split") before the agent takes home the rest, and increasingly on **cap models**, where the
brokerage's cut for the year is fixed in dollars rather than a percentage forever:

| Model | How it works | Example brokerage | Typical numbers |
|---|---|---|---|
| Traditional graduated split | Brokerage keeps a fixed % of every commission, sometimes improving with production | Many independent/franchise offices | 70/30 to 80/20 agent/brokerage is commonly cited `[trade-content consensus, not independently audited this session]` |
| Cap model | Agent pays brokerage a split until cumulative brokerage earnings ("company dollar") hit an annual cap, then keeps ~100% (minus per-transaction fees) for the rest of the year | eXp Realty | 80/20 split, $16,000 annual cap, then 100% minus a per-transaction fee ([The Close](https://theclose.com/real-estate-commission-splits/)) |
| Cap model, lower cap | Same mechanic, smaller cap, tiered by agent type | Real Broker (REAX) | 85/15 split; $12,000 cap for solo agents, $6,000 for team members ([Speicher Group](https://www.speichergroup.com/insights/real-broker-commission-split)) |
| Flat-fee / 100% brokerage | No percentage split at all; agent pays a flat monthly desk fee and/or flat per-transaction fee and keeps the rest | Various flat-fee brokerages | $50-$1,500/month and/or $199-$995/transaction ([Growth Estate](https://www.grwestate.com/en/blog/real-estate-commission-split-explained)) |
| Salaried / W-2 employee | Agent is a payroll employee, not an independent contractor — the industry anomaly | Redfin (pre- and post-2025 Rocket acquisition) | See §8 — ~90% of US agents are 1099 contractors; Redfin's W-2 model is the visible exception |

**Franchise fees** sit on top of all of these when the brokerage itself is a franchisee of a
national brand (Keller Williams, RE/MAX, Century 21, etc.): typically **5-8% of gross
commission**, paid to the franchisor before the local office/agent split is even calculated.

### 1.5 Team splits

Most production above the solo-agent level in the US now happens inside a **team** — one
licensed "team lead" or "rainmaker" (a top producer who generates leads and passes buyer-side
business to salaried or split-commission teammates) plus buyer's agents, showing assistants,
and often an in-house ISA and TC (see §3-4). Team splits stack on top of, not instead of, the
brokerage split:

| Lead source | Typical buyer's-agent split | Notes |
|---|---|---|
| Team-lead-provided/team-marketing lead | 40-50% to the agent | Team lead/brokerage keep the rest for providing the lead, brand, and infrastructure |
| Agent's own self-generated client | 60-80% to the agent | Rewards agents who bring their own book of business |
| Graduated/tiered plans | e.g., 50% up to 15 closed units/year, 60% from 16-30, 70% above 30 | Used to retain top producers ([The Real Estate Trainer](https://therealestatetrainer.com/real-estate-team-commission-splits-buyers-agent/)) |

The brokerage takes its cut first, from the top; the team lead's override is calculated on what
is left; the individual agent's percentage applies to what remains after that
([Speicher Group](https://www.speichergroup.com/insights/how-do-real-estate-teams-split-commission)).

### 1.6 Worked example — following one dollar

A $400,000 sale at the 2025 average combined rate of 5.44% generates **$21,760** in total
commission, split roughly evenly: **$10,880** to the listing side, **$10,880** to the buyer
side.

**Listing side**, agent on an eXp-style 80/20 cap plan, brokerage is a Keller-Williams-style
franchisee charging a 6% franchise royalty:
- Franchise fee off the top: 6% of $10,880 = **$652.80** → to franchisor
- Remaining $10,227.20 split 80/20 → **$8,181.76** to the agent, **$2,045.44** ("company
  dollar") to the brokerage, until the agent's annual cap is met
- Minus a flat per-transaction fee (commonly **$250-$500** on cap-model brokerages) → agent's
  final take is roughly **$7,700-$7,930** on this one deal

**Buyer side**, same $10,880, but the buyer was a Zillow Flex referral:
- Referral fee off the top: 35% of $10,880 = **$3,808** → to Zillow, before any agent split is
  even calculated
- Remaining $7,072 then goes through the same brokerage-split/franchise-fee/team-override
  cascade as the listing side

The two sides never touch the same pool of money and, since August 2024, are authorized by two
separate signed agreements (listing agreement; buyer agreement) reconciled only at closing via
the CDA.

## 2. The lifecycle / process spine

Two parallel processes run through every transaction — the seller's (listing) side and the
buyer's side — and they only merge once an offer is accepted. Each is a chain of handoffs; a
stall anywhere in the chain is a day (or a deal) lost, which is exactly where drudgery and
automation opportunity concentrate.

### 2.1 The listing lifecycle

| # | Stage | Trigger | Owner role | Typical duration | Artifact produced | What makes it stall |
|---|---|---|---|---|---|---|
| 1 | Lead | Seller inquiry, referral, past-client anniversary touch, expired/FSBO prospecting, online lead form | ISA or agent | Minutes to months of nurture | CRM lead record | No speed-to-lead response; lead goes cold or calls a competitor within minutes |
| 2 | Pre-listing | Lead qualifies as a real seller (timeline, motivation, property) | ISA hands to listing agent | 1-7 days | Qualified appointment on calendar | Seller not motivated, or timeline is 12+ months out |
| 3 | CMA (Comparative Market Analysis — a valuation built from recently sold, active, and expired comparable listings, not a licensed appraisal) | Appointment confirmed | Listing agent, sometimes a marketing/listing coordinator pulls raw comps | 1-3 hours of prep | CMA report (PDF/slides) via Cloud CMA, RPR, or MoxiWorks | Thin comp set in a fast-moving or unusual market; agent under-prices or over-prices to win the listing ("buying the listing") |
| 4 | Listing appointment | CMA ready | Listing agent | 45-90 minutes, in person | Verbal or signed commitment | Seller shops multiple agents; agent fails to justify price/commission |
| 5 | Listing agreement | Seller agrees to list | Listing agent, signed via dotloop/zipForm/DocuSign | Same day | Signed listing agreement (exclusive right-to-sell, defines commission, term, marketing authority) | Seller wants an unrealistic price or a shorter/longer term than the agent will accept |
| 6 | Photos, staging, copywriting | Listing agreement signed | Photographer, stager, marketing coordinator, or the agent solo at the low end | 1-5 days | Photo set, staged rooms, MLS listing description | Vacant home with no staging budget; agent writes generic copy; scheduling conflicts with photographer |
| 7 | MLS entry | Listing-ready assets exist | Listing agent or a dedicated MLS data-entry clerk/listing coordinator | 15-60 minutes of manual field entry | Live MLS record (60-100+ structured fields per the RESO Data Dictionary — see §6) | Manual re-typing of the same address/facts across MLS, brokerage website, and syndication portals; field-level errors (wrong school district, wrong lot size) |
| 8 | Syndication | MLS entry goes live | Automatic feed (MLS → Zillow/Realtor.com/Homes.com/brokerage site) | Minutes to 24 hours | Public listing pages | Feed lag or field-mapping mismatches between the MLS's local schema and a portal's schema |
| 9 | Showings | Listing is live | Showing-service software; buyer's agents request times | 1 request per showing | Showing request/confirmation, usually via ShowingTime | Seller-occupied home with tight availability windows; last-minute cancellations |
| 10 | Feedback | Showing completes | Buyer's agent (source), listing agent (collector) | Minutes per showing, aggregated weekly | Feedback log, often auto-collected via ShowingTime surveys | Buyer's agents ignore feedback requests; feedback is vague ("just not the one") |
| 11 | Price reduction | Feedback + days-on-market data suggest overpricing | Listing agent, with seller sign-off | A conversation, then instant MLS update | Price-reduction addendum / updated MLS listing | Seller emotionally anchored to original price; agent avoids the hard conversation |
| 12 | Offer received | Buyer's agent submits | Buyer's agent submits, listing agent presents | Hours to days | Purchase agreement + buyer's disclosures/pre-approval letter | Multiple competing offers create decision paralysis; incomplete offer packages |
| 13 | Negotiation | Offer(s) reviewed | Listing agent relays counteroffers | Hours to days | Countersigned counteroffer(s) | Price/terms/contingency gaps; multiple-offer bidding fatigue |
| 14 | Contract (mutual acceptance) | Buyer and seller agree on final terms | Both agents | Same day as final signature | Fully executed purchase agreement | Last-minute term disputes; missing initials/signatures |
| 15 | Under-contract management | Contract executed | Transaction coordinator (see §4) | 21-45 days typically | Signed disclosures, inspection response, appraisal, loan-commitment tracking, updated timeline | Contingency deadlines missed; inspection repair negotiation stalls; appraisal comes in low |
| 16 | Closing | All contingencies cleared, lender clears to close | Closing/escrow or title agent (not a role covered in depth in this chapter — see the mortgage-and-title chapter) | 30-60 minutes at the table, or fully remote in e-closing states | Closing Disclosure, deed, recorded transfer, CDA | Wire fraud risk, last-minute title defects, buyer's financing falls through at the last moment |
| 17 | Post-close | Funds disburse, keys transfer | TC or listing coordinator | Same day to 1 week | Archived file, referral/review request, CDA reconciliation, sign removal | Agent fails to follow up for the review/referral that funds the next lead |

### 2.2 The buyer lifecycle

| # | Stage | Trigger | Owner role | Typical duration | Artifact produced | What makes it stall |
|---|---|---|---|---|---|---|
| 1 | Lead capture | Portal inquiry (Zillow/Realtor.com/Homes.com), website form, open-house sign-in, referral | ISA or lead-routing software (kvCORE/BoldTrail, Follow Up Boss, BoomTown) | Instant | CRM lead record with source tag | Lead sources with no phone-verified contact info; fake/test leads |
| 2 | Speed-to-lead | Lead lands in CRM | ISA, often via auto-dialer/auto-text | Industry best practice is **under 5 minutes**; conversion drops sharply after that `[widely cited industry benchmark; exact decay curve figures vary by source and were not independently re-verified this session]` | Logged call/text attempt | ISA is on another call; lead arrives outside working hours and nobody (or no AI) responds fast enough |
| 3 | Qualification | Contact made | ISA | 5-15 minute call | Qualified/unqualified tag, timeline, financing status, must-haves | Lead is a tire-kicker (12+ months out, not pre-approved); ISA can't get a callback after 1-2 attempts |
| 4 | Showing scheduling | Buyer qualified and ready to see homes | Buyer's agent or showing assistant, via ShowingTime | Same day to a few days | Confirmed showing appointments | Buyer's schedule conflicts with seller/listing-agent availability |
| 5 | Tours | Appointments confirmed | Buyer's agent (or a dedicated showing assistant for high-volume teams) | 30-60 minutes per home, several homes per outing | Buyer feedback per home, narrowed shortlist | Buyer indecision; agent windshield time between widely spaced showings |
| 6 | Offer writing | Buyer decides on a home | Buyer's agent, using a state/association-standard purchase agreement | 30-90 minutes to draft, plus buyer signature | Signed purchase agreement + buyer's proof of funds/pre-approval + (since Aug 2024) the buyer agreement already on file | Buyer wants nonstandard terms the standard form doesn't anticipate; multiple-offer situations compress drafting time to under an hour |
| 7 | Inspection contingency | Offer accepted | Buyer's agent coordinates inspector; buyer attends | Inspection itself 2-4 hours; response window commonly 5-10 days per contract | Inspection report, repair request/response addendum | Repair negotiation breaks down; inspector availability in a hot market |
| 8 | Appraisal contingency | Lender orders appraisal | Lender/appraiser (external); agent monitors | 1-3 weeks depending on appraiser backlog | Appraisal report; if low, an addendum renegotiating price or buyer bringing extra cash | Low appraisal versus contract price forces renegotiation or deal collapse |
| 9 | Close | All contingencies cleared | TC coordinates buyer's final walk-through and closing logistics | Final walkthrough 1 hour, closing 30-60 minutes | Signed closing documents, keys | Last-minute loan conditions ("stips") from underwriting; wire instructions fraud attempts |

Both lifecycles converge at stage 12-14 of the listing spine / stage 6 of the buyer spine (the
accepted contract), after which a single transaction-coordination process (§4) manages both
sides to close.

## 3. Role inventory

Every role below requires only a state real estate **salesperson** license unless the table
says otherwise. A salesperson license (60-180 hours of pre-licensing education plus a state
exam, requirements vary by state) lets someone represent buyers/sellers and earn
transaction-based compensation, but only while "hung" under a **licensed broker** — brokers hold
a higher license tier (more experience/education) and are the only people legally allowed to
receive commission directly from a closing on behalf of others. Comp figures marked
`[unverified]` are consistent trade-content/industry recall not independently confirmed against
a primary source this session; treat them as directional, not precise.

| Role | Also called | Seniority | License/cert required | Typical comp (US) | Typical comp (India, where known) | Headcount ratio | What they own |
|---|---|---|---|---|---|---|---|
| Solo agent | Independent agent | Entry-mid | Salesperson license | 100% of their own split after brokerage cut (§1.4); no base salary | N/A — US-licensed role | 1 (no team) | Their own entire pipeline, both sides of the business |
| Buyer's agent | Buyer's rep, "buyer specialist" | Entry-mid | Salesperson license | Split per §1.5, typically 40-80% of the buy-side commission | N/A | On a team: often several buyer's agents per 1 team lead `[unverified ratio]` | Buyer relationship, showings, offer strategy, contingency navigation |
| Listing agent | Seller's agent, "listing specialist" | Mid-senior | Salesperson or broker license | Split per §1.4, plus often the team lead's own role | N/A | Frequently the team lead themselves on small teams | Seller relationship, pricing strategy, listing marketing, negotiation |
| Showing assistant | Showing agent | Entry | Salesperson license (showing and discussing property terms is practicing real estate in most states) | Hourly or small flat fee per showing, commonly cited in the tens of dollars per showing `[unverified]`, sometimes a minority commission split instead | N/A | Scales with buyer-agent tour volume on high-volume teams | Physically walking buyers through homes the primary agent didn't have time for |
| ISA (Inside Sales Agent) | Lead-conversion specialist | Entry | No license required for pure lead qualification/appointment-setting (cannot discuss showing terms, pricing strategy, or negotiate — that would require a license) | Base $35,000-$50,000/yr ($18-26/hr); OTE $55,000-65,000 with per-appointment or GCI-based incentives ([MyOutDesk](https://www.myoutdesk.com/services/real-estate-isa/), [insidesalespredictability.com](https://blog.insidesalespredictability.com/how-to-compensate-your-isa)) | No reliable India-specific ISA figure found this session | Commonly 1 ISA supporting several producing agents' lead flow `[unverified ratio]` | Speed-to-lead response, qualification, appointment-setting only — see §4 |
| Transaction coordinator (TC) | TC, closing coordinator | Entry-mid | No license required in most states for pure paperwork/scheduling coordination (cannot give legal/contract advice) | $45,000-$50,000/yr salaried (job postings, Compass and others, 2025-2026); part-time/contract roles as low as $8-12/hr | Offshore TC-adjacent work is commonly bundled into the VA role below rather than a distinct India TC job market found this session | No reliable public figure found for average concurrent files per TC — see §4 | Every file from executed contract to closed and archived — see §4, deepest role in this chapter |
| Listing coordinator | Listing manager | Entry-mid | No license required for pure coordination tasks | Similar band to TC `[unverified]` | Not separately found | N/A | Photos/staging scheduling, MLS entry, syndication QA, showing-feedback collection during the active-listing period |
| Marketing coordinator | Marketing assistant | Entry-mid | None | ~$40,000-55,000/yr `[unverified]` | Not separately found | 1 per team or per mid-size brokerage office `[unverified]` | Listing flyers/brochures, social content, agent personal-brand marketing, email/drip campaigns |
| Team lead / rainmaker | Top producer, team owner | Senior | Salesperson or broker license | Overrides on every team member's production (§1.5) plus their own listing-side production; highly variable, no reliable single figure | N/A | 1 per team (teams range from 2 to 50+ licensed members) | Lead generation, brand, recruiting, training, the team's P&L |
| Managing broker | Broker-in-charge, designated broker, principal broker (title varies by state) | Senior | Broker license (higher tier than salesperson) | Often salaried by the brokerage, sometimes with an office-override on agent production `[unverified figure]` | N/A | 1 per office in traditional models; 1 broker of record can nominally cover many agents/offices at large cloud brokerages (see below) | Legal responsibility for agent supervision and every file's compliance in their office |
| Broker of record | Designated REALTOR®, principal broker | Senior | Broker license | Same band as managing broker, or a fixed override where the *legal* role is separated from day-to-day office management | N/A | At scale (eXp, Real, Compass), one broker of record's name can sit over compliance structures spanning thousands of agents across a state, with day-to-day file review delegated to regional compliance staff | The license the entire brokerage operates under; ultimate liability |
| Compliance reviewer / file auditor | Compliance coordinator | Mid | None required by law, but reports to/works under the broker of record | ~$45,000-60,000/yr `[unverified]` | Not separately found | Scales with total closed-file volume, not agent count `[unverified ratio]` | Auditing every file against the office compliance checklist before/at closing — see §4 |
| Office admin | Front desk / office manager | Entry | None | ~$35,000-45,000/yr `[unverified]` | Not separately found | 1 per office | General office operations, phones, supply, scheduling |
| MLS data-entry clerk | Listing input specialist | Entry | None (not a licensed activity if purely re-keying agent-provided facts) | Hourly, ~$15-22/hr `[unverified]` | Sometimes offshored — folds into the VA role below | 1 can serve many agents at a brokerage or photography vendor | Re-keying every field of every new listing into the MLS correctly |
| Offshore virtual assistant (VA) | REVA (Real Estate Virtual Assistant) | Entry-mid | None | N/A (offshore role) | Philippines-based REVAs: **$800-1,200/month**, versus a US-based equivalent hire at **$3,500-5,000/month** — roughly 80% cheaper ([Somewhere](https://somewhere.com/post/14-jobs-you-can-outsource-to-real-estate-virtual-assistants-in-the-philippines), [Outsourced.ph](https://outsourced.ph/real-estate-virtual-assistant/)); India is a parallel offshore market for the same task categories via generic global staffing platforms, but no reliable India-specific rate figure was found within this session's research budget | 1 VA can absorb the data-entry/scheduling load that would otherwise need a part-time US admin | Listing uploads, photo coordination, brochure updates, transaction-timeline/document tracking, general CRM data entry |
| Photographer | Real estate media vendor | N/A — independent contractor | Usually none beyond general business licensing; drone photography requires an FAA Part 107 remote pilot certificate | Paid per shoot, not per closing `[unverified specific rate]`; often bundled with drone, video, and Matterport 3D-tour add-ons | N/A | 1 vendor can serve many agents/brokerages | Listing photos, video, floor plans, 3D tours |
| Stager | Home stager | N/A — independent vendor | None required; some hold interior-design credentials | Flat project fee plus furniture-rental for the listing period `[unverified specific rate]` | N/A | 1 vendor serves many agents | Furniture/decor placement to maximize showing appeal |
| Sign installer | Sign company / install courier | N/A — independent vendor | None | Paid per install/removal `[unverified specific rate]` | N/A | 1 vendor serves an entire market area | Physically placing and removing yard signs and lockboxes |
| Showing-service staff | Showing-desk agent | Entry | None (call-center confirmation work, not licensed representation) | Hourly customer-service band `[unverified]` | Some showing-service call centers are offshored `[unverified where]` | Call-center scale, many listings per staffer | Confirming/rescheduling showing requests on behalf of listing agents at scale |
| Relocation coordinator | Relo specialist | Mid-senior | Salesperson or broker license | Base production plus relocation-network referral overrides | N/A | 1 per brokerage with a formal relocation department | Managing corporate relocation referrals (e.g., from networks like Cartus/SIRVA) and their extra reporting requirements |
| REO/short-sale specialist | Default-services agent | Mid-senior | Salesperson or broker license, often plus a bank-specific certification/vendor approval | Commission on these deals is frequently compressed below the standard rate by the bank/asset manager or short-sale lender `[unverified specific rate]` | N/A | Small specialist subset of agents per market | Navigating bank/asset-manager portals (for REO — Real Estate Owned, a bank-owned property after foreclosure) or lender short-sale approval (a sale for less than the mortgage balance) |
| New-construction on-site sales agent | Builder's rep, on-site agent | Entry-senior | Salesperson or broker license | Often salary + closing bonus rather than pure commission — represents one builder's inventory exclusively `[unverified specific figures]` | N/A | 1+ per active builder community | Selling only the builder's own inventory, managing builder-specific contracts and construction-timeline communication |
| Luxury agent | High-end specialist | Senior | Salesperson or broker license | Same % structure as any agent, applied to much larger transaction values | N/A | A small fraction of agents per market handle a large share of luxury-tier volume `[unverified ratio]` | Same lifecycle as §2, at a price tier where discretion, staging quality, and network access matter disproportionately |
| Referral-only agent | Inactive/referral agent | Any | Salesperson or broker license kept active | Lives entirely on referral fees (§1.6, ~25% of GCI industry norm `[unverified]`) rather than production splits | N/A | Common exit path for agents leaving active production while keeping license income | Nothing but the referral relationship — no active buyer/seller representation |

## 4. Day in the life

This section is the core of the chapter. Five roles, chosen for headcount or drudgery
concentration: team buyer's agent, ISA, transaction coordinator, managing broker (compliance
review), and offshore virtual assistant. The transaction coordinator and the managing broker
get the deepest treatment, per the research brief for this chapter.

### Team buyer's agent — day in the life

**Who they are:** Usually licensed within the last 1-4 years. Joined an established team
rather than going solo because the team supplies leads, a CRM, a script, and training — at the
cost of a lower commission split on team-generated business (§1.5). Measured on: number of
showings run, showing-to-offer conversion, offers-to-contract conversion, closings per month,
and (at most teams) minimum weekly lead-follow-up-call counts even though lead generation
itself is the ISA's job. Career path is either "graduate" to self-generated business at a
higher split, or move toward becoming a team lead.

**Their stack:** Follow Up Boss, kvCORE/BoldTrail, or Sierra Interactive (CRM + lead alerts +
built-in dialer/texting); ShowingTime (schedule and confirm showings); the local MLS's own
portal (Matrix or Paragon are the two dominant MLS software UIs `[unverified specific
prevalence]`) for property search and disclosures; Cloud CMA or RPR (Realtors Property
Resource, a NAR-provided tool) for comps when writing an offer; dotloop or zipForm for the
purchase agreement itself; DocuSign for signatures the transaction-management tool doesn't
natively handle; a personal or team group chat (text or Slack) for real-time coordination with
the ISA and team lead.

**A typical day:**
- **8:00-8:15am** — Check overnight CRM alerts for new ISA-qualified leads and any showing
  confirmations/cancellations that came in after hours.
- **8:15-9:00am** — Follow-up calls/texts to 5-8 warm leads handed off by the ISA in the last 24
  hours; confirm today's showing appointments.
- **9:00-9:30am** — Pull disclosure packages and recent comps for the homes on today's tour so
  they can answer buyer questions on the spot.
- **9:30am-1:00pm** — Showing block: 3-5 homes with one buyer household. Driving between homes
  ("windshield time") eats a meaningful share of this block in spread-out markets.
- **1:00-1:30pm** — Lunch, usually in the car; phone stays on for inbound leads/texts.
- **1:30-2:30pm** — A buyer decides on a home: pull final comps, discuss offer strategy by
  phone, draft the purchase agreement in dotloop/zipForm, send for e-signature.
- **2:30-3:00pm** — Call the listing agent to walk the offer in, answer questions, start
  negotiating.
- **3:00-4:00pm** — Second round of lead follow-up calls/texts; log every touch in the CRM.
- **4:00-5:00pm** — A second showing block, or prep (staging the car with flyers, printing
  disclosures) for weekend open-house duty.
- **5:00-6:00pm** — Admin: CRM notes on every call/showing from the day, mileage/expense log,
  texting buyers who didn't get a same-day answer.
- **6:00-6:30pm** — Team check-in (call or async message): pipeline update, any offers in
  negotiation, tomorrow's schedule.
- **Evenings and weekends** are not optional extra time — buyers tour after work and on
  weekends, and Saturday/Sunday open-house shifts are frequently a mandatory lead-generation
  duty assigned by the team lead, not a discretionary activity.

**Their week/month:** A weekly team meeting (pipeline review, script/objection-handling
practice); a monthly production review against the team's split tiers (§1.5); continuing-
education (CE) hour tracking against the state license-renewal deadline; periodic MLS
compliance training (photo/data-accuracy rules, fair housing refreshers — see §7).

**What they complain about:** This chapter's research could not source verbatim first-person
complaints from agent forums within budget (Reddit fetches were blocked; see §11 notes). The
consistently reported *theme* in trade press covering agent burnout is the expectation of being
"always on" for buyer texts/calls across evenings and weekends, compounding with low and
unpredictable per-transaction income timing (paid only at closing, weeks to months after the
work) — reported generally, e.g. [McKissock, "Real Estate Agent Burnout"](https://www.mckissock.com/blog/real-estate/real-estate-agent-burnout/) (page was not independently re-fetchable to pull a direct quote this session; theme reflects the article's stated framing, not a verbatim citation).

**Repetitive-work inventory:**

| Task | Frequency | Minutes each | Why it's still manual | Data in -> data out |
|---|---|---|---|---|
| CRM note logging after every call/showing | ~15-25 times/day | 2-3 min | No system-wide voice/showing-visit transcription auto-fills structured CRM fields at most teams | Verbal conversation/showing -> typed CRM note |
| Comp pulling for offer strategy or a listing consult | 3-5 times/week | 20-40 min | Data pull is automatable; comp *selection* is judgment agents don't yet delegate | MLS query -> CMA report |
| Showing confirmation chasing | 5-10 times/day | 5-10 min | Not every listing (FSBO, some MLSs) runs through ShowingTime; sellers/agents don't always respond on the same channel | Text/call -> confirmed calendar slot |
| Re-entering the same buyer's info across CRM, dotloop, and MLS showing requests | 1-3 times/week per new client | 15-20 min | No shared buyer-profile object across these three systems | Buyer intake form -> 3 separate systems |
| Reading the disclosure packet before a new showing | Per new listing shown | 10-15 min | Must actually be read for material facts, even though the document type repeats every time | PDF disclosure packet -> mental checklist |
| Mileage/expense logging | Daily | 5 min | Manual log or app re-entry, needed for the tax deduction | Trip -> spreadsheet/app entry |

### Inside Sales Agent (ISA) — day in the life

**Who they are:** Often the entry point into a real estate sales career — either unlicensed
(legally limited to scheduling/qualification, no discussion of showing terms, pricing, or
negotiation) or a newly licensed agent paying dues before getting their own buyer leads.
Measured almost entirely on **activity metrics**: dials, contacts, and appointments set, with a
downstream (often lagged and disputed) credit for appointments that convert to closings.

**Their stack:** A power/predictive dialer — either a standalone tool (Mojo Dialer,
PhoneBurner) or built into the CRM (kvCORE/BoldTrail, Follow Up Boss, BoomTown all ship a native
dialer); the CRM itself for lead routing and disposition tagging; templated SMS sequences;
lead-source dashboards (Zillow Premier Agent CRM, Realtor.com's lead portal) to see what just
came in; a script binder or in-CRM script prompter for objection handling. Some teams have
begun layering an AI voice/text bot (Structurely, Ylopo's AI) in front of or alongside the human
ISA — see §8.

**A typical day:**
- **8:00-8:15am** — Triage overnight portal leads (Zillow, Realtor.com, Homes.com, website
  forms) by source and recency; the freshest leads get called first because response-time decay
  is steep (industry convention holds most conversion advantage is inside the first five
  minutes; exact decay curves vary by source and were not independently re-verified this
  session).
- **8:15-11:30am** — Dial block #1 through the power dialer: roughly 100-150 dials, yielding
  perhaps 8-15 live conversations. Every attempt auto-logs in the CRM; the *content* of each
  conversation does not.
- **11:30am-12:00pm** — Batch of templated-but-personalized follow-up texts to everyone who
  didn't pick up.
- **12:00-1:00pm** — Lunch.
- **1:00-4:00pm** — Dial block #2, plus any scheduled callback appointments from earlier in the
  week; daily dial targets commonly cited in the 200-300 range.
- **4:00-4:30pm** — Update lead disposition tags (hot/warm/cold/nurture/do-not-call) and route
  qualified appointments to the correct buyer's or listing agent by territory/rotation.
- **4:30-5:30pm** — Pull the "no touch in N days" report and re-queue stale leads into a
  longer-cycle nurture drip.
- **5:30-6:00pm** — Report the day's dial/contact/appointment counts to the team lead or sales
  manager — commonly tracked on a literal whiteboard or a CRM leaderboard dashboard.

**Their week/month:** Weekly script role-play/coaching; monthly conversion-rate review across
the whole funnel (dials -> contacts -> appointments -> closings); Do-Not-Call (DNC) list
maintenance — scrubbing new lead lists against both the National DNC Registry and the team's
own internal DNC list before dialing (see §7 on TCPA); documentation upkeep for prior express
consent where required.

**What they complain about:** No verbatim forum quote could be sourced this session (see §11).
The sourced, structural fact worth stating plainly: this is a high-volume, high-rejection role
by design — 200-300 dials/day against 15-40 live conversations is the explicit target in
industry training material ([Wise Pelican](https://wisepelican.com/real-estate-inside-sales/);
[insidesalespredictability.com](https://blog.insidesalespredictability.com/how-to-hire-the-right-inside-sales-agent-isa-even-if-youve-failed-before)),
meaning the great majority of a shift is unanswered calls and voicemail, not conversation.

**Repetitive-work inventory:**

| Task | Frequency | Minutes each | Why it's still manual | Data in -> data out |
|---|---|---|---|---|
| Dialing down a lead list | 200-300 dials/day | Seconds each, hours in aggregate | No fully deployed AI voice agent at most teams yet; the FCC's Feb 2024 TCPA ruling on AI-generated voices (§7) raises the compliance bar for automating this without consent | Phone number -> connected/no-answer outcome |
| Post-call note logging | 10-30 contacts/day | 1-2 min each | Dialer logs the *event* automatically, not the conversation's content | Conversation -> CRM note/tag |
| Lead re-scoring/tagging | Daily batch | ~20-30 min total | Temperature judgment (hot/warm/cold) is not yet fully trusted to automation at most shops | Call outcome -> lead status field |
| DNC/consent scrubbing of new lead lists | Weekly, per list import | 15-30 min | Legal exposure under TCPA keeps a manual check step even where software could automate it | Raw lead list -> callable, scrubbed list |
| Appointment handoff to the buyer's/listing agent | Several times/week | 5-10 min | Needs a warm-handoff summary, not just a calendar invite | Qualified lead -> agent-ready brief |

## 5. The document & data layer

Residential brokerage is unusual in that its documents are **largely standardised within
a state and almost never across states**. That single property defines both the
automation opportunity and its ceiling.

| Document | Produced by | Standardised? | Format in practice | Why it matters to an agent builder |
|---|---|---|---|---|
| Listing agreement | Listing agent | Yes — state/association form | e-signed PDF | Establishes agency, commission, term. Fixed fields, easily extracted |
| Buyer representation agreement | Buyer's agent | Yes, and near-universal post-2024 | e-signed PDF | Newly mandatory in most of the US: a fresh, high-volume, low-variance document |
| Comparative Market Analysis (CMA) | Listing agent | No | PDF/deck from Cloud CMA, an MLS tool, or Canva | Pure data-to-document generation; already partly automated |
| Purchase agreement | Buyer's agent | Yes — C.A.R. in California, TREC in Texas, state association forms elsewhere | e-signed PDF | The spine of the transaction. Dozens of dates and dollar figures that downstream parties re-key |
| Counteroffer | Either side | Yes | e-signed PDF | Often several rounds; each one changes downstream dates |
| Addenda (financing, appraisal, inspection, HOA, as-is) | Either side | Yes | e-signed PDF | Long tail — a single file may carry 5-25 of them |
| Seller's property disclosure | Seller | Yes, per state | Fillable PDF, often handwritten then scanned | Legally consequential and frequently incomplete: a natural checking target |
| Lead-based paint disclosure | Seller | Yes — federal, for pre-1978 homes | PDF | Federally mandated; a pure rule-check |
| Natural hazard / flood disclosure | Third-party vendor | Vendor form | PDF report | Ordered, delivered, filed. Chase-shaped work |
| Inspection report | Inspector | No — every firm's own template | 20-80 page PDF, photo-heavy | Unstructured; feeds the repair negotiation |
| Repair request / response addendum | Buyer's agent | Yes | e-signed PDF | Derived from the unstructured inspection report — genuine extraction plus drafting |
| Appraisal report | Appraiser | Yes — Fannie Mae 1004 / UAD | PDF plus structured UAD data | See chapter 05 |
| Title commitment | Title company | Yes — ALTA form | PDF | See chapter 04 |
| Closing Disclosure / settlement statement | Lender / title | Yes — CFPB form | PDF | Must be reconciled against the contract: a classic two-system diff |
| Commission Disbursement Authorization (CDA) | Brokerage | Brokerage-specific | PDF or email | Tells the title company who to pay. Small document, high friction |
| Compliance file | Brokerage | Brokerage checklist | Folder in dotloop / SkySlope | The audit artifact — see the compliance reviewer's day in section 4 |

**The structural observation.** Every one of these is generated by a different party, in
a different system, and reconciled by a human. The purchase agreement's dates propagate
into at least six other parties' systems — lender, title, inspector, appraiser, HOA,
brokerage compliance — and **none of them receive it as data.** They receive a PDF and
type it in. This is the single most-repeated waste in the residential transaction, and
it is the thing to look at first.

**MLS data is a different animal.** Listing data is genuinely structured (see RESO
below), which is why listing-side products are far more mature than transaction-side
products. Internalise the asymmetry: **the industry solved the data problem for listings
25 years ago and never solved it for transactions.**

## 6. Systems of record

| System | Category | Who uses it | Market position | API reality | Why it is hard to displace |
|---|---|---|---|---|---|
| The MLS (~500 of them) | Listing database | Every agent | Broker-owned cooperatives; regional near-monopolies | RESO Web API mandated; access needs MLS approval and a data licence per MLS | It is owned by the incumbents it would have to disrupt. Not a vendor — a cartel of members |
| Bright MLS, CRMLS, Stellar, NTREIS | Largest individual MLSs | Regional | Bright and CRMLS each serve 100k+ subscribers | RESO Web API | Consolidating, but slowly |
| RESO Data Dictionary / Web API | Data standard | Vendors | Mandated for NAR-affiliated MLSs | The standard itself, not a product | Adoption is real, but field-level variance between MLSs persists |
| Bridge Interactive (Zillow), Trestle (CoreLogic), MLS Grid, Spark (FBS) | Feed aggregators | Developers | The practical way to reach many MLSs at once | Yes — this is the realistic integration path | They reduce plumbing, not permissioning; you still need per-MLS approval |
| dotloop (Zillow), SkySlope, Lone Wolf Transactions (zipForm) | Transaction management | Agents, TCs, compliance | The three incumbents; zipForm is bundled into many state association memberships | Limited, partner-gated | Bundled into association dues — effectively free to the agent, hard to price against |
| DocuSign | E-signature | Everyone | Default | Good API | Genuinely open; not the bottleneck |
| Follow Up Boss (Zillow), kvCORE / Inside Real Estate, Sierra Interactive, BoomTown, Lofty (Chime), Real Geeks, CINC | Agent CRM | Agents and teams | Fragmented; Follow Up Boss is the power-user favourite | Follow Up Boss has a usable public API; kvCORE is more closed | The switching cost is the agent's entire database of past clients |
| ShowingTime (Zillow) | Showing scheduling | Agents | Near-monopoly in many markets | Partner-gated | Zillow-owned and embedded in MLS contracts |
| Zillow, Realtor.com (Move/News Corp), Redfin, Homes.com (CoStar) | Consumer portals and lead sources | Consumers, sold to agents | Zillow dominant in traffic | Deliberately closed | Their business *is* selling leads; they will not help you disintermediate it |
| Cloud CMA (Lone Wolf), RealScout, Remine, Moxi | Agent-facing tools | Agents | Feature layers over MLS data | Varies | Thin products; the MLS licence underneath is the real gate |

**Read that table as a feasibility filter.** The pattern is consistent: *listing data is
licensable with effort; consumer-intent data is closed; transaction workflow tools are
bundled and near-free.* A product needing MLS data can get it, with paperwork and
per-market grind. A product needing consumer demand data cannot buy it and must
generate its own.

## 7. Rules, regulators, and hard constraints

Design input, not background reading.

### 7.1 Licensing and the reserved acts

Licensing is **per state** (50 regimes plus DC). The acts reserved to a licensed human
generally include negotiating for a party, showing property for compensation,
soliciting listings, and advising on price or terms in a representative capacity. The
consistent principle: **an unlicensed person may perform administrative and ministerial
tasks but may not exercise judgment for a party or negotiate.**

This is exactly why transaction coordinators exist as a legitimate unlicensed role in
most states — NAR's own position is that scheduling, deadline tracking, document
assembly, and coordination fall outside "brokerage activity." **That boundary is the
space an AI agent can legally occupy,** and it is the most useful legal fact in this
chapter.

| Task | Licensed human required? | Notes |
|---|---|---|
| Schedule an inspection; track a contingency date | No | Explicitly administrative |
| Assemble and check a compliance file | No | Though the broker's *sign-off* is a licensed duty |
| Produce a CMA | Grey — preparing an opinion of value for compensation can require a licence or appraisal credential | Check per state |
| Recommend a list price to a seller | Yes | Judgment on behalf of a party |
| Negotiate terms | Yes | Core reserved act |
| Fill blanks on a standard state form | Yes for the agent; drafting *custom clauses* can be UPL even for a licensee | The UPL line is narrower than people assume |
| Answer a factual question about a listing | No | Factual, not advisory |
| Advise whether a neighbourhood is "good" | Nobody may do this — see 7.4 | A discrimination issue, not a licensing one |

### 7.2 Unauthorized practice of law

Agents may complete standardised forms; drafting bespoke contract language is generally
UPL. **For an AI product this bites harder than it looks:** a system that generates
novel contractual language, or answers "what happens legally if I do X", is closer to
practising law than one that fills a state-approved form. Design toward form-filling,
away from advice.

### 7.3 RESPA Section 8 — the business-model killer

RESPA Section 8 prohibits giving or accepting **anything of value for the referral of
settlement service business** (mortgage, title, escrow, appraisal, insurance). This
makes a whole class of obvious marketplace ideas illegal:

- You may not take a fee for sending a buyer to a particular lender or title company.
- You may not accept below-market rent, free software, or marketing co-op money in
  exchange for referrals.
- Affiliated Business Arrangements are a narrow safe harbour requiring disclosure, no
  required use, and returns proportional to ownership.
- Marketing Services Agreements are a grey zone that has drawn repeated enforcement.

**The builder's rule:** charge for *software*, or for *services actually performed*, at
fair market value. Never charge for *sending business*. If your monetisation resembles
a referral fee from a settlement provider, it probably is one. Note the real estate
commission itself is exempt — RESPA targets settlement services, not the brokerage fee.

### 7.4 Fair housing — the hard constraint on any recommendation engine

The Fair Housing Act prohibits discrimination on race, colour, religion, sex (including
sexual orientation and gender identity under HUD's current interpretation), familial
status, national origin, and disability. Many states and cities add source of income,
age, and marital status.

Three operative risks for an AI product:

1. **Steering.** Directing buyers toward or away from areas based on protected
   characteristics — *including by proxy*. School ratings, crime data, and
   "neighbourhood quality" scores correlate strongly with race and are a well-documented
   proxy-discrimination vector. A recommender that ranks neighbourhoods for a buyer is in
   real legal jeopardy however neutral its inputs feel.
2. **Advertising and ad delivery.** The 2022 HUD/DOJ settlement with Meta established
   that **the delivery algorithm itself** can violate the FHA even where the
   advertiser's targeting is lawful. That precedent applies directly to any system
   deciding which listings which people see.
3. **Disparate impact.** Liability does not require intent. A model producing disparate
   outcomes can violate the Act regardless of motive.

**Design consequence:** answer factual questions (tax rate, distance to a hospital,
lot size) and refuse comparative-quality questions about people ("is this a good area",
"what kind of people live there"). Experienced agents already have this reflex. Your
product needs it in the system, not in a prompt.

### 7.5 TCPA, Do-Not-Call, and AI voice — where most "AI SDR" ideas die

Be precise here; this is the most commonly underestimated constraint in the industry.

- The **TCPA** restricts calls and texts using an autodialer or an artificial or
  prerecorded voice to mobile numbers without prior express consent. *Facebook v.
  Duguid* (2021) narrowed the autodialer definition — but did nothing to the
  artificial-voice prong.
- In **February 2024 the FCC declared AI-generated voices to be "artificial" voices**
  under the TCPA. An outbound AI voice call to a consumer therefore needs prior express
  consent, at the robocall standard. This is the single most important legal fact for
  anyone building an AI inside sales agent.
- The **National Do-Not-Call Registry** independently restricts telemarketing, subject
  to an established-business-relationship exception.
- **State mini-TCPAs** (notably Florida and Oklahoma) are stricter than federal law and
  carry their own private rights of action.
- **Call recording consent** is two-party in roughly a dozen states including
  California — relevant to anything that transcribes calls.
- **Bot-disclosure laws** (California SB 1001) require telling a consumer they are
  talking to a machine when trying to incentivise a transaction.

Enforcement runs through **statutory damages of $500-1,500 per call or text**, an active
plaintiffs' bar, and class actions. There is no "move fast" option.

**Design consequence:** inbound handling and consented-lead follow-up are viable; cold
outbound AI voice to consumers is not, absent real consent. Note the asymmetry that
follows — **agent-facing and back-office products face none of this.** That is a strong
argument for building for the transaction coordinator rather than the lead caller.

### 7.6 Post-settlement compliance as a created opportunity

The 2024 settlement's practice changes introduced new mandatory steps: a written buyer
agreement before touring, and compensation negotiated separately rather than advertised
through the MLS. New mandatory steps mean **new compliance checking**, plus retraining
and re-auditing at every brokerage. That is a genuine, recently created, recurring
rule-check workload — an opportunity produced by regulation rather than blocked by it.

## 8. What has already been tried

| Attempt | What it tried | Outcome | The lesson |
|---|---|---|---|
| **Zillow Offers** | Buy homes algorithmically at scale | Shut down 2021 with large losses and layoffs | An AVM good enough for a website is not good enough to trade a balance sheet against |
| **Opendoor** | iBuying as a pure play | Survived; has struggled for profitability | iBuying is capital-intensive, low-margin and rate-exposed. Not a software business |
| **Redfin** | Salaried agents, lower fees | Persisted two decades without displacing the commission model; ultimately acquired | Consumers do not switch brokerage models for a modest fee saving. Distribution beats price |
| **REX** | Sell outside the MLS to escape the commission structure | Failed; litigated against Zillow and NAR | Bypassing the MLS costs you the buyer pool. The network effect is the moat |
| **Compass** | Win agents with better technology | Grew large; the tech spend produced no durable structural advantage | Agent-facing tooling is a recruiting expense, not a defensible product |
| **HomeLight** | Match consumers to agents, then expand into transaction services | Ongoing | Referral-adjacent models must be structured carefully around RESPA |
| **Structurely, Roof AI, Ylopo** | AI text and voice lead qualification | Real adoption, especially in text | AI lead-response by text is a *solved and competitive* category. Do not rebuild it |
| **Rechat, Lofty** | Agent copilot / all-in-one | Established vendors | The CRM layer is crowded and consolidating |
| **Restb.ai** | Computer vision on listing photos | Quietly adopted by MLSs and portals for compliance and tagging | Infrastructure sold to institutions worked where consumer-facing AI did not |

**The synthesis:** consumer-facing disruption of the commission has failed repeatedly
and expensively. What has quietly worked is **infrastructure sold to institutions that
already own distribution** — MLSs, portals, brokerages, title companies.

Note what is conspicuously absent from that table: nobody has convincingly automated the
transaction coordinator, the compliance reviewer, or condition-chasing. Those remain
manual because they are unglamorous, not because they were tried and failed.

## 9. Where the human genuinely adds value

- **Negotiation under emotional load.** A house is the largest financial and emotional
  decision most people make. Much of an agent's real work is managing a seller's
  unrealistic price expectation or a buyer's panic — a counselling function.
- **Physical judgment.** Walking a property and registering the smell of damp, the slope
  of a floor, the neighbour's dog. Photographs do not carry this.
- **Local micro-knowledge.** Which builder cut corners in 2006, which block floods,
  which HOA is dysfunctional, which listing agent never returns calls. Valuable, and in
  no database.
- **Liability absorption.** A licensee carries E&O insurance and personal legal
  exposure. Part of the commission buys someone to be responsible.
- **Deal repair.** When an inspection blows up a deal, recovery is improvisational
  relationship work across five parties at once.
- **Trust between agents.** Deals get done between agents who know each other.
  Reputation is collateral.

**The framing that matters:** the agent's *judgment* is defensible; the agent's
*administration* is not. The industry's own behaviour proves it — that is exactly why
transaction coordinators and offshore VAs exist. **Your opportunity is to be a better
TC, not a better agent.**

## 10. Glossary

- **AVM** — Automated Valuation Model. Algorithmic price estimate (e.g. the Zestimate).
- **Buyer representation agreement** — Contract between a buyer and their agent. Near-universal in the US since 2024.
- **Cap** — The annual ceiling on commission an agent pays their brokerage; beyond it the agent keeps close to 100%.
- **CDA** — Commission Disbursement Authorization. Instructs the closer how to pay the brokerage.
- **CMA** — Comparative Market Analysis. An agent's opinion of value derived from comparable sales.
- **Comp** — A comparable property used to justify a price.
- **Contingency** — A contractual condition letting a party exit (inspection, financing, appraisal).
- **Days on market (DOM)** — How long a listing has been active. Closely watched.
- **Dual agency** — One agent or brokerage representing both sides. Restricted or banned in some states.
- **Earnest money** — The buyer's good-faith deposit, held in escrow.
- **E&O** — Errors and omissions insurance carried by licensees.
- **Escrow** — Neutral third-party holding of funds or documents pending closing.
- **FSBO** — For Sale By Owner; a seller without an agent.
- **IDX** — Internet Data Exchange. The MLS rules and feed letting brokers display each other's listings online.
- **ISA** — Inside Sales Agent. A dedicated phone prospector who qualifies leads.
- **Listing agreement** — Contract between seller and listing brokerage.
- **MLS** — Multiple Listing Service. Broker-owned regional listing cooperative; roughly 500 in the US.
- **Pocket listing** — A listing marketed privately rather than through the MLS; restricted by NAR's Clear Cooperation Policy.
- **Pre-approval** — A lender's conditional commitment based on verified documents. Stronger than a pre-qualification.
- **Procuring cause** — The doctrine deciding which agent earned the commission.
- **RESO** — Real Estate Standards Organization; publishes the Data Dictionary and Web API standard.
- **RESPA** — Real Estate Settlement Procedures Act; Section 8 bans referral fees for settlement services.
- **Split** — How commission divides between agent and brokerage (e.g. 70/30).
- **TC** — Transaction Coordinator; manages the file from contract to close.
- **TCPA** — Telephone Consumer Protection Act; governs calls and texts. AI voices count as artificial voices.
- **Under contract / pending** — Agreed but not yet closed.
- **UPL** — Unauthorized Practice of Law.
- **VOW** — Virtual Office Website; an MLS data-use category allowing broader consumer display than IDX.

## 11. Verify before you rely on this

Structural content above — process flow, roles, document types, who pays whom — is
stable. The following are **time-sensitive or contested** and should be checked against
a primary source before you build on them.

| Claim | Why it moves | Check against |
|---|---|---|
| Commission rates and who pays the buyer's agent | Actively reshaping post-settlement; practice varies by market | NAR practice-change guidance; state association forms; RealTrends and Inman reporting |
| The "140 tasks / 18-23 documents / 8-12 parties" transaction figure | Originates in vendor marketing; plausible but weakly sourced | Treat as illustrative, not citable. Corroborate against a real brokerage file checklist |
| Number of MLSs (~500 and falling) | Consolidating steadily | RESO; Inman MLS consolidation coverage |
| TCPA consent rules and the AI-voice ruling | Active FCC rulemaking and litigation; a 2025 appellate decision vacated part of the consent rules | FCC docket CG 02-278; counsel |
| CFPB enforcement posture on RESPA and MSAs | Changed materially in 2025 | CFPB enforcement actions page |
| Portal listing-access disputes (Zillow, Compass, CoStar) | Live commercial and legal conflict | Current trade press |
| Ownership of named vendors | Consolidation is constant — Zillow owns dotloop, ShowingTime and Follow Up Boss | Vendor sites |

**Method note.** Sections 1-4 of this chapter were written with live web research.
Sections 5-11 were written from domain knowledge after a rate limit cut the research
fan-out short. Sections 1-4 carry the higher evidentiary weight.
