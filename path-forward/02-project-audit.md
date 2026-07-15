# Audit of Your Three Projects: Keep, Kill, or Ship

Verdicts first, reasoning after. All three verdicts are backed by market research I ran today (July 2026), not vibes.

| Project | Verdict | Deadline |
|---|---|---|
| TNP (college placement platform) | **SHIP FIRST.** Finish, deploy for this placement season, collect the money. | Live before ~Aug 10 (season ramp-up) |
| AgentYap | **LAUNCH AS-IS.** It's not a startup (yet) — it's your distribution engine. | Public within 2 weeks |
| KD (AI OS for Indian lawyers) | **ARCHIVE.** With a public post-mortem, which converts the sunk cost into an asset. | Decision executed by Aug 15 |

---

## TNP — the project you undervalue most

You describe this as "a website for my college for ₹20–40k." Reframe: **it's your only project with a real customer, real money, real users, and a real deadline.** That makes it more validated than KD and AgentYap combined. The customer conversations you regret not having? For TNP, they're built in — the TPO, the students, the recruiters will all tell you what's broken the moment it's live, because they need it during season.

What the market data says, honestly, both directions:

- **The pain is real and the segment is underserved.** The top ~200 colleges are locked up by Superset (acquired by Great Learning; enterprise pricing around ₹50k–2L/*month*). Unstop is a student-employer marketplace, not placement-cell software. Below the top 200, the "tier-3 placement cells run on Excel + WhatsApp + Google Forms" story is repeated across the industry — your own college is living proof.
- **But the ceiling is honest-low.** Tier-3 colleges can realistically pay ₹30k–1.5L/*year*, buy through slow committees, on an academic-year cycle, and cheap competitors (PlacementPilot at ₹2,999/mo, local IndiaMART-listed desktop software) are already circling. This is a founder-led, one-state, 20–50-college lifestyle SaaS at best — a solid ₹10–40L/year business someday, not a venture rocket.

**So the play is:** finish it, run it through your college's placement season (starting ~July 25 — a deadline with teeth, arriving at the perfect time), collect your ₹20–40k, and *extract three assets*: (1) the money, (2) a live case study with real usage numbers — "built the platform that ran placement season for a 2,000-student college" is a resume line and a sales weapon, (3) the option to pitch 5–10 nearby colleges at ₹50k–1L/year during Aug–Oct *if and only if* the pilot goes well. If the option converts, you have revenue and a real business; if not, you still banked assets (1) and (2). Either way you've broken the never-shipped curse. Zero downside.

---

## AgentYap — right asset, wrong mental category

You're evaluating AgentYap as a potential startup ("a platform where people study agentic AI"). As a *business*, it's weak: education content monetizes slowly, and the space has infinite free competition.

As a **distribution asset**, it's the most strategically valuable thing you own:

- It's proof-of-depth in the hottest hiring niche of 2026 (see [06-job-strategy.md](06-job-strategy.md) — AI startups screen for exactly this and can't evaluate it from resumes; yours is public).
- It's a co-founder magnet — its readers are precisely the "poured into startups" people missing from your college (see [07-cofounders-and-people.md](07-cofounders-and-people.md)).
- It's an audience you can later launch *anything* to.

**The play:** launch within two weeks, as-is. Domain, deploy, name and X handle on every page. Then a sustainable cadence: one chapter or paper-breakdown per week, each posted as an X thread. Do NOT let it become the active project that eats your evenings — it's a 3–4 hr/week flywheel, not a product to perfect. (Recognize the pattern: AgentYap was born as an escape hatch from KD's 80% wall — see [08-adhd-mechanics.md](08-adhd-mechanics.md). Launching it converts the escape hatch into infrastructure.)

One content note: you built it by having Claude decompose papers. Fine for drafts — but add the one thing pure-AI content can't have: *you*. "I implemented this memory pattern; here's where the paper's version broke in practice." That layer is what makes readers follow the author and not just the content, and it's the layer that gets you hired.

---

## KD — archive it, and take the exit with honors

The research verdict on Indian legal AI, so you can stop relitigating this in your head:

- **The top of the market is closed.** Harvey isn't a US comparison anymore — it's *in India*, with a Bengaluru office and India's biggest firms (Shardul Amarchand across all offices; AZB; Cyril Amarchand piloting, alongside Legora). Funded locals — Lucio ($7.7M, used by Trilegal/Cyril), Jhana AI (Together Fund/Kunal Shah-backed), Lexlegis (~$7.2M), Jurisphere ($2.2M) — are all fighting for the same few hundred big-firm buyers.
- **The bottom has no money.** India's ~1.4M advocates are mostly solo/district-court, and the documented willingness to pay is near zero — the standard advice to them is "use free Indian Kanoon + free ChatGPT," and the ones who do pay for AI pay ₹1,700/mo for ChatGPT Plus, not for legal-specific tools. Products targeting solos sit at ₹1k–4k/mo, unfunded and unproven.
- Your instinct was right, and now it has data: crowded top, empty-pocketed bottom, ~$20M total VC into the space signaling investors doubt the market's depth. A no-conviction founder in this arena loses to funded, conviction-heavy teams. **Killing KD isn't quitting; it's reading the board correctly.**

**Exit with honors, one week of work:**
1. Write the post-mortem as an AgentYap chapter: "I spent 3 months building an AI OS for Indian lawyers. Here's the architecture, and here's why I'm shutting it down." Failure post-mortems with real technical depth travel far — this one post can do more for your reputation than KD ever would have as a product.
2. Salvage the components — the agent orchestration, the Indian court-data API integrations — as documented, reusable modules. They're generically valuable.
3. *Optional, only if you want a clean conscience:* run the [validation protocol](04-how-to-validate-in-one-week.md) on it once — 10 lawyer conversations in one week. If mid-tier firms (10–50 lawyers — the one segment Harvey prices out and Lucio hasn't reached down to) pull it out of your hands, reopen the file. If not, archive with zero regret. But do not let this become a way to avoid deciding. Default is archive.

---

## The sequencing (expanded in [03-the-90-day-plan.md](03-the-90-day-plan.md))

One at a time, per the WIP-limit rule: **TNP to live (now–Aug 10) → AgentYap launch (parallel-ok because it's a 2-evening deploy, then background cadence) → KD post-mortem (one week, by Aug 15) → then, and only then, the [idea bank](05-idea-bank.md) opens.**
