Strength batch A (REQ-001, shell, reachability, journey), round 1: 7 findings, all advisory.
F-1 | advisory | INVENTORY.md:ROW-002, INVENTORY.md:ROW-019, INVENTORY.md:ROW-048 | debounced/polled count passes retrying assertions; read without retry right after the edit and again after a quiet second | fix_model_authority
F-2 | advisory | INVENTORY.md:ROW-020 | isComposing skip with no compositionend handler; drive real composition in Chromium, replay the sequence ending with isComposing=true elsewhere | fix_model_authority
F-3 | advisory | INVENTORY.md:ROW-019, INVENTORY.md:ROW-046 | inputType-filtering handler passes value-assignment tests; drive native edits with real inputTypes | fix_model_authority
F-4 | advisory | INVENTORY.md:ROW-042 | fallback to code points passes an ASCII test; remove the facility before the script runs and enter a combining accent and a ZWJ emoji | fix_model_authority
F-5 | advisory | INVENTORY.md:ROW-023 | add ROW-002, ROW-024, ROW-043, ROW-046, ROW-048 to the engine list | fix_model_authority
F-6 | advisory | INVENTORY.md:ROW-001 | expected counts from the engine's own Intl.Segmenter agree by construction; take them from an engine-independent oracle (GraphemeBreakTest.txt, pinned Unicode version) | fix_model_authority
F-7 | advisory | INVENTORY.md:ROW-001, REQ-001, A-001 | invisible and format characters: "what the person sees" vs grapheme clusters; A-001 does not decide | needs_owner
