# 06 · Sources

Every source consulted while building this toolkit (July 2026), grouped by topic. Prompt templates in this library were *authored to operationalize* the cited methods for an LLM — they are not verbatim copies of the sources unless noted.

## Research caveats (read first)

- **Fetch limitations.** Many publisher domains (Medium, ADDitude, NCBI, Frontiers, Scientific American, arXiv PDFs, themarginalian.org, toolshero.com, drewboyd.com, promptingguide.ai, learnprompting.org) returned HTTP 403 to automated fetching through the environment's egress proxy. Their content was captured via web-search extracts (accurate to the extract, not verified line-by-line against full article bodies). Directly fetchable GitHub-hosted prompt libraries supplied the verbatim prompt text.
- **The neurodivergent evidence is real but not uniform.** See the note at the top of [`02-neurodivergent-thinking-modes.md`](02-neurodivergent-thinking-modes.md). Findings on ADHD/autism and creativity vary across studies; treat the modes as thinking-styles to borrow, not as claims about individuals.
- **The LLM diversity trap** (Wharton) is the single most important empirical finding here — AI ideas are high-quality, low-diversity. It shapes all of [`04`](04-llm-divergence-techniques.md).

## Creativity frameworks (01)

- SCAMPER & prompt libraries — https://github.com/0x2e-Tech/awesome-ai-prompts · https://easyaibeginner.com/chatgpt-scamper-framework-prompt-template/
- Six Thinking Hats — https://easyaibeginner.com/chatgpt-six-thinking-hats-framework/ · https://promptbase.com/prompt/six-thinking-hats-method
- Provocation (PO) / lateral thinking — https://www.mycoted.com/Provocation · https://www.debono.com/serious-creativity-article · https://en.wikipedia.org/wiki/Po_(lateral_thinking)
- Random stimulus — https://en.wikipedia.org/wiki/Random_stimulus · https://thepeakperformancecenter.com/educational-learning/thinking/types-of-thinking-2/lateral-thinking/lateral-thinking-techniques/ · https://arxiv.org/html/2405.06715v1 (associative-thinking strategies improve LLM creativity)
- Reverse brainstorming — https://www.makeuseof.com/chatgpt-prompts-make-brainstorming-productive/ · https://ideawake.com/reverse-brainstorming/
- First-principles — https://fs.blog/first-principles/ · https://www.aiforwork.co/prompts/brainstorm-solutions-with-first-principles-thinking
- Morphological analysis — https://www.swemorph.com/ref-by-subject.html · https://nesslabs.com/zwicky-box · https://www.toolshero.com/creativity/morphological-analysis-fritz-zwicky/
- TRIZ / AutoTRIZ — https://arxiv.org/html/2403.13002v2 · https://www.cambridge.org/core/journals/ai-edam/article/enhancing-triz-through-environmentbased-design-methodology-supported-by-a-large-language-model/C3305E839793A17763076FF8BF510E08
- Analogical / cross-industry — https://www.prescouter.com/2024/07/analogical-thinking/ · https://www.pnas.org/doi/10.1073/pnas.1807185116 · https://link.springer.com/chapter/10.1007/978-3-030-61295-5_9

## Neurodivergent-inspired thinking modes (02)

- ADHD divergent thinking — https://www.scientificamerican.com/article/the-creativity-of-adhd/ · https://www.additudemag.com/divergent-thinking-creativity-mind-wandering/ · https://www.frontiersin.org/journals/psychiatry/articles/10.3389/fpsyt.2022.909202/full · https://www.ncbi.nlm.nih.gov/pmc/articles/PMC9283685/
- Autistic pattern recognition / systemizing / talent — https://www.ncbi.nlm.nih.gov/pmc/articles/PMC9283685/ · https://sachscenter.com/power-of-autism/ · https://arxiv.org/pdf/1310.0519
- Bottom-up / detail-first processing — https://www.simplypsychology.org/bottom-up-thinking-autism.html · https://neurolaunch.com/autism-bottom-up-thinking/ · https://www.autismconsultancy.com.au/understanding-cognitive-diversity-bottom-up-thinking-in-autistic-and-neurodivergent-neurotypes/
- Monotropism / hyperfocus — https://en.wikipedia.org/wiki/Monotropism · https://monotropism.org/dinah/attention-tunnelling-and-autism/ · https://reframingautism.org.au/monotropism-understanding-autistic-ways-of-being-through-the-lens-of-attention/
- Synesthesia & creativity — https://www.sciencenewstoday.org/the-science-of-synesthesia-when-senses-cross-wires · https://www.researchgate.net/publication/6301475_Synaesthesia_creativity_and_art_What_is_the_link
- Literal thinking — https://neurolaunch.com/autism-literal-thinking/ · https://weirdlysuccessful.org/literal-thinking/
- Framing ("different, not less") — https://www.uma.edu/news/all-kinds-of-minds-temple-grandin-and-the-power-of-thinking-differently/
- Neurodiversity-aware LLM prompting — https://get-your-message-across.com/best-practices-for-prompt-engineering-ai-for-neurodivergent-users/ · https://www.emergentmind.com/topics/neurodiversity-aware-llm-applications
- Lateral thinking / defixation in LLMs — https://arxiv.org/pdf/2310.05057 (BRAINTEASER) · IDEAFix (creative defixation prompting)

## Combinatorial creativity (03)

- Combinatorial creativity (Popova) — https://www.themarginalian.org/ · https://www.sloww.co/combinatorial-creativity/ · https://www.smithsonianmag.com/innovation/combinatorial-creativity-and-the-myth-of-originality-114843098/
- Conceptual blending (Fauconnier & Turner) — https://www.sciencedirect.com/science/article/pii/S000437021730142X · https://web.pdx.edu/~cgrd/Metaphors%20of%20Conceptual%20Integration.html
- Bisociation (Koestler) — https://en.wikipedia.org/wiki/The_Act_of_Creation · https://www.intechopen.com/chapters/86751
- Adjacent possible / liquid networks (Johnson) — https://www.goodreads.com/book/show/8034188-where-good-ideas-come-from · https://ashishb.net/book-summary/where-good-ideas-come-from/
- A Technique for Producing Ideas (Young) — https://jamesclear.com/book-summaries/a-technique-for-producing-ideas · https://www.themarginalian.org/2012/05/04/a-technique-for-producing-ideas-young/
- Forced connections / random word — https://www.toolshero.com/creativity/forced-connections/ · https://innovationmanagement.se/2012/12/26/random-word-brainstorming-a-simple-powerful-and-effective-ideation-technique/
- Mashup / "X for Y" — https://andrewchen.com/x-for-y-startup-ideas/
- Synectics — https://boisestate.pressbooks.pub/thecreativeprocess/chapter/illumination-synectics/ · https://www.sciencedirect.com/topics/psychology/synectics
- Biomimicry — https://asknature.org/ · https://getinterwoven.com/insight/nature-inspired-design-a-biomimicry-primer/
- Systematic Inventive Thinking (SIT) — https://www.inventionpath.com/systematic-inventive-thinking-tool · https://www.toolshero.com/problem-solving/systematic-inventive-thinking-sit/

## LLM-native divergence techniques (04)

- Tree-of-Thoughts — https://www.promptingguide.ai/techniques/tot · https://github.com/dave1010/tree-of-thought-prompting
- Persona / Expert prompting — https://www.prompthub.us/blog/role-prompting-does-adding-personas-to-your-prompts-really-make-a-difference · https://learnprompting.org/docs/basics/roles
- Devil's advocate — https://www.makeuseof.com/devils-advocate-prompt-chatgpt/
- Quantity-forcing / diversity caveat — https://noinguyenvan.substack.com/p/20-chatgpt-prompts-to-brainstorm · https://www.makeuseof.com/chatgpt-prompts-make-brainstorming-productive/ (Wharton low-diversity finding)
- PanelGPT — https://github.com/holarissun/PanelGPT
- Temperature / stochastic framing — https://www.buildmvpfast.com/blog/inject-randomness-llm-creativity-quality-temperature-sampling-2026
- Ideation prompt patterns — https://www.itonics-innovation.com/blog/chatgpt-prompts-for-ideation · https://www.aiprompthackers.com/p/this-ai-prompt-combines-totally-unrelated-things-for-creativity-boosts
- General prompt-engineering reference — https://github.com/dair-ai/Prompt-Engineering-Guide

## Multi-model panel / Council (07)

Method file [`07-multi-model-panel.md`](07-multi-model-panel.md) operationalizes [`04`](04-llm-divergence-techniques.md) PanelGPT with *real* vendors plus [`03`](03-combinatorial-creativity.md) blending. Ledger safeguards in `council/_template/LEDGER.md` are Council design choices **motivated by** the repo's stigmergy review, not a schema that review proved. Prompts were authored for this repo; they are not copies of the papers.

- Wharton diversity trap (high-quality, low-diversity LLM ideas) — see the [`04`](04-llm-divergence-techniques.md) quantity-forcing / diversity caveat sources above
- PanelGPT (simulated panel; Council is the heterogeneous-model version) — https://github.com/holarissun/PanelGPT
- Conceptual blending / bisociation — see Combinatorial creativity (03) above
- Ledger-State Stigmergy — https://doi.org/10.48550/arXiv.2604.03997
- The Memory Curse (more accessible history can *degrade* cooperation) — https://doi.org/10.48550/arXiv.2605.08060
- When Agents Misremember Collectively (shared-memory false belief) — https://doi.org/10.48550/arXiv.2602.00428
- The Bystander Effect in Multi-Agent Reasoning — https://doi.org/10.48550/arXiv.2605.10698
- Governed Collaborative Memory (curated shared memory) — https://doi.org/10.48550/arXiv.2605.04264
- CoALA memory taxonomy — https://doi.org/10.48550/arXiv.2309.02427
- Repo-local synthesis of the above — [`../old research on startup ideas/stigmergy_memory_llm_swarms_review.md`](../old%20research%20on%20startup%20ideas/stigmergy_memory_llm_swarms_review.md)
- Cursor CLI / Codex plugin are *tools* for Phase 1, not literature; invocation contract is documented in [`07`](07-multi-model-panel.md) and `scripts/cursor-agent.sh`
