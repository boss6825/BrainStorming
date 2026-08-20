# The Creative Thinking Toolkit

A working library of prompts and thinking modes for **researching and ideating with AI** — built to push a model (and you) past the first obvious answer into genuinely novel, cross-domain, assumption-breaking territory.

Built July 2026 from a sweep of the creativity-research and prompt-engineering literature (de Bono, Koestler, Fauconnier & Turner, Zwicky, TRIZ, SIT, biomimicry, synectics) and the AI-ideation literature (Tree-of-Thoughts, persona prompting, PanelGPT, the Wharton diversity findings). Sources are in [`06-sources.md`](06-sources.md). Every prompt template is reusable — copy it, fill the `{placeholders}`, paste.

There's a companion Claude skill (`.claude/skills/ideate/`) that turns this library into a runnable workflow. Type `/ideate` (or just ask Claude to brainstorm/research a problem in this repo) and it drives a full session using these techniques. For a **real** multi-model panel (Claude + Codex + Cursor CLI), use `/council` and [07](07-multi-model-panel.md) (Recipe 5 in [05](05-prompt-library.md)). This folder is the reference; the skills are the operators.

---

## The one idea behind all of it

Most "creative" output from an AI is actually the *average* of everything it's seen — fluent, sensible, and boringly central. Wharton's 2023–24 research found LLM brainstorms are **high-quality but low-diversity**: the ideas cluster. So the entire job of this toolkit is to **fight the pull toward the center**. Every technique here is a different lever for doing that:

- **Frameworks** ([01](01-creativity-frameworks.md)) impose *structure* that forces coverage you'd otherwise skip.
- **Neurodivergent-inspired modes** ([02](02-neurodivergent-thinking-modes.md)) borrow *different information-processing styles* that surface associations a central-tendency mind filters out.
- **Combinatorial methods** ([03](03-combinatorial-creativity.md)) manufacture *novelty by collision* — new ideas as new combinations of old parts.
- **LLM-native techniques** ([04](04-llm-divergence-techniques.md)) exploit *how the model itself works* (branching, personas, sampling) to widen the output distribution.
- **Multi-model Council** ([07](07-multi-model-panel.md)) uses real model heterogeneity, independent deep dives, cross-model recombination, and governed shared memory without turning disagreement into majority vote.

## The rhythm: diverge, then converge

Never do both in one breath — it's the single most common mistake. Separate the two phases explicitly, even in the same session:

1. **Diverge** — maximize *quantity and variety*. Judgement off. Weird, wrong, half-formed ideas are wanted, because they're the raw material for the good ones. (Frameworks that generate, all of [02] and [03], and the volume/temperature/panel techniques in [04].)
2. **Converge** — *then* switch to cold evaluation. Score, stress-test, red-team, kill. (First-principles, Devil's Advocate, the Black/Blue hats, and the convergence scorer in [05].)

Doing this with a model is a superpower: it has no ego about its bad ideas, so the divergent phase is genuinely uninhibited if you tell it not to self-censor.

---

## The files

| File | What's in it |
|---|---|
| [01-creativity-frameworks.md](01-creativity-frameworks.md) | Classic frameworks as prompts: SCAMPER, Six Hats, Provocation (PO), Random Word, Reverse Brainstorming, Worst Idea, First Principles, Morphological Analysis, TRIZ, Analogical Transfer, Constraint Injection |
| [02-neurodivergent-thinking-modes.md](02-neurodivergent-thinking-modes.md) | Nine thinking modes inspired by neurodivergent cognitive styles — Idea Cascade, Synesthetic Translation, Pattern Transfer, Systemizer, Bottom-Up Builder, Deep-Tunnel, Literalist, Assumption Breaker, Random Provocation — with the evidence base and an honest note on its limits |
| [03-combinatorial-creativity.md](03-combinatorial-creativity.md) | Idea-by-combination: Conceptual Blending, Bisociation, Adjacent Possible, "A Technique for Producing Ideas", Forced Connections, Synectics, Biomimicry, SIT, Mashup ("X for Y") |
| [04-llm-divergence-techniques.md](04-llm-divergence-techniques.md) | Techniques that exploit the model itself: Tree-of-Thoughts, Persona/Expert prompting, Devil's Advocate, Quantity-Forcing, PanelGPT, Temperature framing, Warm-ups — plus the diversity-trap caveat |
| [05-prompt-library.md](05-prompt-library.md) | The copy-paste greatest hits, plus **composed session recipes** (full ideation run, kill-the-idea red team, research-a-space, deep-tunnel sweep, Council multi-model run) |
| [06-sources.md](06-sources.md) | Every source URL, grouped by topic, with research caveats |
| [07-multi-model-panel.md](07-multi-model-panel.md) | Multi-model Council method: heterogeneous roles, independent deep-dive / cross-pollination / adversarial / converge prompts, governed ledger — complements [03](03-combinatorial-creativity.md)–[05](05-prompt-library.md), does not replace them |

## How to actually use this

- **Stuck for ideas?** Start with a generator from [05](05-prompt-library.md) — the "Full Ideation Run" recipe — or grab Idea Cascade + Random Provocation from [02].
- **Have an idea, want to know if it's real?** Run the "Kill-the-Idea Red Team" recipe in [05]. (This repo's whole ethos is that killing a bad idea early is a win — see `../path-forward/`.)
- **Exploring a new space / doing research?** Use the "Research-a-Space" recipe in [05], then Pattern Transfer ([02]) and Adjacent Possible ([03]) to find the whitespace.
- **Want the model to stop being generic?** Layer a persona ([04](04-llm-divergence-techniques.md)), a constraint ([01](01-creativity-frameworks.md)), and a "make ideas 11–20 weirder" volume rule ([04](04-llm-divergence-techniques.md)) — genericness dies fast under all three.
- **Want genuinely independent models to disagree?** Recipe 5 / `/council` and [07](07-multi-model-panel.md). Requires local Claude Code. Do not fake Grok/Gemini/Codex inside one model.

> One caveat carried throughout: the neurodivergent modes in [02] are framed as *cognitive-style-inspired thinking modes*, not clinical claims, diagnoses, or stereotypes — "different, not less." The research is real but not uniform. See the note at the top of that file.
