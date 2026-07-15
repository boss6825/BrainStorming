# The Idea Bank

**Access rule (from [01-wrong-assumptions.md](01-wrong-assumptions.md)):** this file stays closed until TNP is live and AgentYap is launched. Ideas are the reward for shipping. If you're reading this with both undone, close the file. I mean it.

---

## How this list was built (so you can trust or challenge it)

You asked for problems painful enough that people pay instantly — and correctly warned against blog-listicle ideas written "in reverse." So the filter here is the one from [04-how-to-validate-in-one-week.md](04-how-to-validate-in-one-week.md): **existing spend + countable loss + deadline pressure + YOUR access.** I also ran market research (July 2026) on the candidate spaces and — just as important — used it to **eliminate** ideas that look good but are already armed camps. The eliminations are listed too, because knowing what NOT to build is half the value.

### Eliminated by evidence (would have looked clever without research)

- **RTO/COD-loss reduction for D2C sellers.** The pain is spectacular (25–35% RTO on COD orders, ₹150–300 lost per return, and COD is still ~60%+ of Indian e-commerce) — which is exactly why it's taken: GoKwik ($450M valuation, 12,000+ merchants, ~$30M ARR) and Shiprocket (₹4.99/order add-on) own it, and their moat is risk-scoring data from billions of orders that a solo founder cannot replicate. The pain being real doesn't make the seat empty.
- **WhatsApp-commerce tooling for small sellers.** A dozen funded players (Wati — $23M Series B with Shopify money — AiSensy, Interakt/Jio, DoubleTick, Gallabox…) in a price war down to ₹999/month, on rails Meta controls. Structurally bad: crowded AND platform-dependent.
- **AI research tools for solo Indian lawyers.** See [02-project-audit.md](02-project-audit.md) — documented willingness-to-pay near zero.
- **Voice agents for clinics/salons/restaurants** — you saw this yourself: YC-funded incumbents already, US and India both. Late.
- **"Brain topology" LLM research** — not a startup; a research agenda. See [01-wrong-assumptions.md](01-wrong-assumptions.md) §4.

---

## The candidates, ranked

### 🥇 1. GST-notice workflow tool for CA firms

**The problem:** GST enforcement has gone AI-driven — automated mismatch detection (GSTR-1 vs 3B, ITC discrepancies, even UPI-inflow-triggered notices to small traders) is producing a surge of notices with 7–15 day response windows and auto-suspension risk. Small CA firms handle dozens of clients' notices with Excel, WhatsApp, and panic.

**Why it clears every filter:**
- *Existing spend:* CA firms already pay for software as a cost of practice (Tally, Winman, Computax, ClearTax's CA pack). You're redirecting budget, not creating it.
- *Countable loss + deadline teeth:* a missed notice deadline = client's registration suspended = CA loses the client. Fear-driven, government-clocked, year-round (not seasonal).
- *Whitespace, verified:* notice management is a *feature claim* inside filing suites, not a product. The one notable CA-firm-focused startup (Suvit) raised only ~$600k before being absorbed by Vyapar — the space has demand but no dominant winner.
- *Your access:* every Indian city street has CA offices; they answer phones; your family/college network certainly knows several. This is the most reachable B2B buyer in India for a 21-year-old.
- *Fits your skills:* notice ingestion → classification → deadline tracking → draft response generation → client document-chasing over WhatsApp. This is an *agent workflow*, your exact craft.

**Shape of v1:** a notice-tracker + response-drafter + client-chaser for firms with 50–500 GST clients, ₹1,500–3,000/month per firm. Concierge-MVP-able: you could deliver the first version half-manually to 3 firms within two weeks of validation. **Honest caveats:** CAs are conservative buyers — it must ride *alongside* their existing filing tools, never ask them to switch; and drafted responses need the CA reviewing, so position as paralegal, not replacement. Validate with the [one-week protocol](04-how-to-validate-in-one-week.md): 15 CA conversations, need 3 paid pilots.

### 🥈 2. TNP expansion (already covered in [02-project-audit.md](02-project-audit.md))

If the pilot season goes well: 5–10 nearby colleges, ₹50k–1L/year. Real, validated, yours — but honest ceiling (slow committee purchases, academic-year cycles, ₹30k–1.5L ACVs, cheap competitors circling). A solid regional business, not a rocket. It earns its slot because it's *already in motion* and every rupee arrives with a case study attached.

### 🥉 3. Agent-evals / reliability audits for Indian companies shipping AI features

**The problem:** every Indian SaaS and services company is bolting agents onto their product in 2026; almost none can answer "how do you know it works?" Evals are the least-sexy, most-paid-for layer of the agent stack, and you literally wrote AgentYap chapters on this.

**Why listed:** perfect skill-fit, B2B buyers with budgets, and it starts as a *service* (₹50k–2L per audit engagement) — profitable from day one, zero build. Services → productize later is the classic bootstrap path. **Caveats:** selling services requires the outbound motion you've been avoiding, and buyers are mid-size companies — reachable via LinkedIn/X and via AgentYap inbound, but slower than CAs. This one gets stronger every month AgentYap grows; it's the natural "AgentYap begins making money" move.

### 4. The wildcard slot — earned, not given

The honest truth from [04-how-to-validate-in-one-week.md](04-how-to-validate-in-one-week.md): the best idea on this list will probably come from a conversation, not from me. WhisperFlow came from watching people type. AtoB came from hanging around truck stops. Your equivalent watching-posts are: QuicShop (what do Indian sellers scream about that *isn't* RTO/WhatsApp? — you're inside the support tickets), placement season (what do recruiters visiting tier-3 colleges struggle with?), and CA offices once you start idea-#1 conversations (CAs will tell you about ten adjacent pains). Keep a running `observations.md` — one line per pain you witness firsthand. After 90 days, that file will beat this one.

**A note on QuicShop-adjacent ideas:** anything serving Indian e-commerce sellers sits near your employer's territory. The learning and network access are fair game; building a directly competing product while interning is not (ethically and possibly contractually). Check your internship agreement before building anything seller-facing, and prefer wedges QuicShop clearly doesn't do (GST/CA work is safely orthogonal).

---

## Why nothing "US-market, everyday-use, WhisperFlow-shaped" is on this list

Because that category demands the one resource you don't have yet: **months of unhurried observation** (Tanay's six months of research) or **rich distribution**. You have neither — you have evenings after an internship, a placement season, and a validation muscle that's never been used. The list above is deliberately shaped for *your* constraints: buyers you can reach this week, revenue in the first month, pain with a government or seasonal clock attached. Win one of these small games first. The WhisperFlow-shaped swing is your *second* startup, taken with cash in the bank, an audience from AgentYap, a co-founder from the tribe, and a trained validation instinct. The founders you admire took their big swing with exactly that stack already assembled — that part never makes it into the podcast episode.
