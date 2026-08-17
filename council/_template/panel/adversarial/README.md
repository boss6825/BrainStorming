# Adversarial Cursor outputs

This directory is the **Cursor red-team** pass (Mode 4), not the initial deep-dive.

Run it with `cursor-panel.sh --seat` so every file receives the same `| Model (exact) | \`id\` |` provenance header as the main panel. **Do not** write Cursor red-team evidence with `cursor-agent.sh --out` — that is raw text and is not provenance-complete panel evidence.

```bash
./scripts/cursor-panel.sh \
  --seat <id> council/<slug>/prompts/seat-<label>-adversarial.md \
  --out-dir council/<slug>/panel/adversarial
```

`outputs.manifest` here is the authoritative list for this directory (same merge/resume rules as the main panel). Synthesis (`04-synthesis.md`) reads **this** manifest in addition to `../outputs.manifest`. Cross-pollination (`03-cross-pollination.md`) does **not** — that mode runs before the adversarial pass and uses only the initial panel manifest.

Codex `/codex:adversarial-review` is a plugin seat: save it in this directory with the documented provenance header, then list its basename in this directory's `outputs.manifest`. Do not put adversarial evidence in the initial panel manifest, and do not call a raw plugin dump provenance-complete.

Prompts live under `../../prompts/`. Do not treat `README.md` as a seat.

`--force` reminder and git hygiene: [Council README](../../../README.md).
