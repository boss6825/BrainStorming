# 02 · Neurodivergent-Inspired Thinking Modes

These are **cognitive-style-inspired thinking modes** — ways of processing information that research *associates* with neurodivergent cognition, translated into prompts. They are not clinical claims, diagnostic tools, or stereotypes, and no prompt here "simulates" a real person or a diagnosis. The framing throughout is Temple Grandin's: *"different, not less" — the world needs all kinds of minds.*

**Why bother?** Because these styles are exactly the ones that beat the "central-tendency" default a model falls into. Where a neurotypical, well-inhibited process filters an odd association out, these modes deliberately keep it — and the odd association is where the new idea lives.

> **Honest caveat (keep this in mind).** The research below is real but *not uniform*. Adults with ADHD outperform on some divergent-thinking measures in some studies and show no difference in others; one study found ADHD participants generated *more novel but fewer high-quality* ideas — though they were notably good at *selecting* the best ones afterward. Treat these as thinking-*styles to borrow on demand*, not as fixed traits or as claims about any individual. The value is the mode, not the label.

## The evidence base (short version)

| Style | What research associates with it | Why it helps ideation |
|---|---|---|
| Divergent / associative thinking (ADHD) | More ideas, more unusual ones, more original combinations; proposed mechanism is reduced inhibitory control letting looser associations survive; mind-wandering links to fluency/originality | Rapid idea-jumping, novel combinations, quantity-then-quality |
| Pattern recognition & systemizing (autism) | Strong detection of rules, patterns, systems; the features tied to detail-focus predict talent in systemized domains (music, code, math) | Rule-mapping, spotting hidden structure, transferable systems |
| Bottom-up / detail-first processing (autism) | Understanding built up from raw pieces rather than top-down gist; enhanced bottom-up sensory processing; catches inconsistencies others miss | Ground-up reconstruction; ideas that don't inherit the framing's flaws |
| Monotropism / hyperfocus | Attention channelled intensely into few interests ("attention tunnel"); unlocks deep expertise and flow | Deep domain immersion, expert-lens reframing |
| Synesthetic / cross-modal association | Unusual cross-sensory links; associative "primary-process" thinking enhances creative insight; over-represented among artists/poets | Sensory & cross-domain metaphor, unexpected mappings |
| Literal thinking (autism) | Literal meaning surfaces alongside/instead of figurative; instructions followed exactly as given without smuggled assumptions | Exposes assumptions baked into a problem's own language |
| Norm/assumption questioning (autism) | Rule-literalness + fairness drive open questioning of *why* norms exist; dovetails with first-principles reasoning | Challenges "best practices," rebuilds from fundamentals |

---

## The nine modes

Each: what inspires it → the prompt template. Several overlap deliberately with the classic frameworks in [01](01-creativity-frameworks.md) — the difference is the *lens*, which changes what surfaces.

### 1. Idea Cascade
*Inspired by ADHD divergent/associative thinking and mind-wandering — reduced inhibition that lets loosely-related ideas through.* Produces high quantity, unusual ideas, and unexpected combinations by deferring judgement so weird ideas survive long enough to become insights.

```
You are in IDEA CASCADE mode. Generate ideas for: {challenge}.
Rules:
- Produce {25} ideas as fast as possible. Quantity over polish.
- Do NOT evaluate, filter, or self-censor while generating — weird, "wrong,"
  and half-formed ideas are wanted.
- Every 5 ideas, deliberately jump to an unrelated domain ({cooking, space
  travel, folklore, plumbing}) and let it pull the next 5 somewhere new.
- Chain by free association: let each idea trigger the next, even loosely.
Then switch to selection: pick the 3 most NOVEL ideas and the 3 with the best
novelty-plus-feasibility balance, and say why.
```

### 2. Random Provocation
*Inspired by the associative/lateral move neurodivergent thinkers use naturally — pulling in unconnected input to break linear paths.* Combines de Bono's Random Entry and Provocation. (See also [01 §3](01-creativity-frameworks.md#3-provocation-po) and [§4](01-creativity-frameworks.md#4-random-word--random-stimulus).)

```
You are in RANDOM PROVOCATION mode for: {challenge}.
Step 1 — Pick 3 genuinely random, unrelated anchors (a random object, a random
animal, a random profession). List them.
Step 2 — For each anchor, force a bridge: "How is {challenge} like {anchor}?
What would {anchor} do here?" Generate 2-3 ideas per anchor.
Step 3 — Make a deliberately provocative "Po" statement (something impossible,
reversed, or exaggerated — e.g. "Po: the product has no {core feature}"). Follow
it forward into 2-3 real ideas.
Output only the ideas the anchors and provocations unlocked — skip the obvious ones.
```

### 3. Synesthetic Translation
*Inspired by synesthetic / cross-modal association — mapping a concept across senses and domains it doesn't "belong" to.* Produces vivid metaphors and experience-grounded design ideas.

```
You are in SYNESTHETIC TRANSLATION mode. Take: {concept / problem}.
Translate it across senses and domains it normally has nothing to do with:
- If {concept} were a COLOR / TEXTURE / TEMPERATURE, what would it be, and what
  design or product idea does that suggest?
- If it were a SOUND or piece of MUSIC, what does that reveal about its pacing/feel?
- If it were a TASTE or SMELL, what experience should it evoke?
- If it were a physical MOVEMENT or shape, how should it behave?
For each mapping, extract one concrete, non-obvious idea for {goal}. Prioritise
associations that feel surprising but apt.
```

### 4. Cross-Domain Pattern Transfer
*Inspired by autistic pattern recognition — seeing the same underlying structure across unrelated systems.* The analogical-innovation engine. (Deeper structural version of [01 §10](01-creativity-frameworks.md#10-analogical--cross-industry-transfer).)

```
You are in PATTERN TRANSFER mode for: {challenge in domain X}.
Step 1 — Abstract {challenge} into its underlying pattern, ignoring surface
details (e.g. "many small units competing for a scarce shared resource").
Step 2 — Name 4 distant domains that share that same abstract pattern (e.g.
ecosystems, traffic, immune systems, financial markets, ant colonies).
Step 3 — For each, describe how THAT domain solves or exploits the pattern.
Step 4 — Transfer each mechanism back into {domain X} as a concrete idea, and
flag which transfers are strong analogies vs. loose ones.
```

### 5. Systemizer
*Inspired by autistic systemizing — the drive to analyze/build lawful systems by isolating input → operation → output rules.* Produces rigorous what-ifs by varying one variable at a time, and surfaces edge cases others gloss over.

```
You are in SYSTEMIZER mode. Treat {product / process / problem} as a system.
1. Map it fully as IF [input] -> [operation] -> [output] rules. List every rule,
   variable, and dependency — be exhaustive and literal.
2. For each variable, ask: what happens at the extremes (0, infinite, negative,
   reversed)? Generate an idea from each interesting extreme.
3. Identify rules everyone assumes are fixed but are actually adjustable.
4. Propose {N} redesigns, each changing exactly ONE rule, and state the
   downstream effects that change propagates through the system.
```

### 6. Bottom-Up Builder
*Inspired by autistic bottom-up, detail-first processing — building understanding from raw pieces instead of top-down gist, which catches what summary-thinking skips.* Produces ground-up reconstructions that don't inherit the flaws of the standard framing.

```
You are in BOTTOM-UP BUILDER mode for: {problem / product}.
Ignore all existing framings, categories, and "the way it's usually done."
1. List ONLY the concrete raw facts, components, and observations — no
   interpretation, no summary, no assumptions.
2. Note any detail that is inconsistent, redundant, or quietly ignored by the
   standard framing.
3. Build interpretations UPWARD from those raw pieces: what patterns actually
   emerge from the details themselves?
4. Propose {N} ideas that follow only from the ground-up view — especially ones
   that contradict the conventional top-down story.
```

### 7. Deep-Tunnel (Special-Interest Lens)
*Inspired by monotropism and hyperfocus — attention channelled intensely into one domain.* As an ideation move, it reframes the problem entirely through one obsessively-detailed lens to reach ideas a generalist skim never finds.

```
You are in DEEP-TUNNEL mode for: {challenge}.
Adopt ONE narrow lens completely — {a specific expert domain / subculture /
obsessive hobby, e.g. competitive speedrunning, medieval bookbinding, coral-reef
biology}. Immerse fully in its vocabulary, values, and fine details.
- Re-describe {challenge} entirely in that domain's terms.
- Surface the small, precise details a casual observer would miss.
- Generate {N} ideas that only someone hyperfocused on that domain would think of.
Then repeat with a second, very different narrow lens and compare what each surfaced.
```

### 8. Literalist
*Inspired by autistic literal thinking — taking words exactly as stated, without the assumptions figurative reading smuggles in.* Exposes buried assumptions in a problem's own language.

```
You are in LITERALIST mode for: {brief / problem statement / feature name}.
1. Take every key word and phrase at its most LITERAL meaning. Ignore what it
   "obviously" means — read it exactly as written.
2. For each idiom, metaphor, or piece of jargon, state the literal image, then
   ask "what if we actually built that literally?"
3. Identify assumptions the phrasing sneaks in (e.g. "checkout flow" assumes
   there IS a checkout). Question each.
4. Propose {N} ideas from the literal reading or from dropping a smuggled assumption.
```

### 9. Assumption Breaker (First Principles)
*Inspired by the tendency to question norms/rules ("why is it done this way?"), combined with first-principles reasoning and Socratic 5-Whys.* Radical rebuilds by stripping to fundamentals. (The disciplined cousin of [01 §7](01-creativity-frameworks.md#7-first-principles-thinking).)

```
You are in ASSUMPTION BREAKER mode for: {challenge}.
1. List every assumption and "best practice" baked into how {challenge} is
   approached — including the ones too obvious to state.
2. For each, apply 5 Whys ("why is this true / required?") until you hit a genuine
   fundamental truth or discover it's just convention.
3. Discard everything that turned out to be mere convention.
4. Using ONLY the fundamental truths that survived, rebuild a solution from scratch
   — as if no existing solution had ever existed.
5. Output {N} from-scratch ideas and name the sacred assumption each one breaks.
```

---

## Running the modes together

A full pass that uses each mode for what it's best at:

1. **Assumption Breaker** (§9) — clear the ground; find which "rules" are just convention.
2. **Idea Cascade** (§1) + **Random Provocation** (§2) — generate wide, judgement off.
3. **Pattern Transfer** (§4) / **Synesthetic Translation** (§3) — deepen the odd survivors into real concepts.
4. **Systemizer** (§5) / **Bottom-Up Builder** (§6) — stress-test and reconstruct the best ones rigorously.

This is codified as the "Full Ideation Run" recipe in [`05-prompt-library.md`](05-prompt-library.md).

*A personal note for this repo:* if you (the owner) are working with your own ADHD, these modes aren't cosplay — they're a way to externalize onto the model the parts of your thinking that are hard to run on demand, and to borrow the systemizing/bottom-up rigor that the fast-associative style skips. Diverge with Idea Cascade because it's how you already think; converge with Systemizer because it's the part willpower can't force. See `../path-forward/08-adhd-mechanics.md`.
