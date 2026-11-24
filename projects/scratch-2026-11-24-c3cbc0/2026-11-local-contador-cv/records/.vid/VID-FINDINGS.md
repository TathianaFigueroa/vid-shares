<!-- .vid/VID-FINDINGS.md — ViD's own defect log (v0.26.10.3 R12, R13; RECORDS.md). Newest last. -->

# ViD findings — Contador de caracteres para el resumen del CV

## F-1 · Init's consolidation step: two skills disagree

- **Seen:** 2026-11-24 · ViD 0.26.11.1.7 · records 29 · init, step 4 (test list sitting)
- **Where:** skills/vid-test-inventory/SKILL.md §5 ("In init mode, consolidation follows this sitting and precedes the initial commit") against skills/vid-init/SKILL.md ("Init makes the spec only (v0.26.10.9 R1)", the list of what init still does, which names no consolidation)
- **What happened:** the inventory skill asks for consolidation (7a, 7b and its sitting) before init's commit; the init skill's own enumeration of its steps omits it and its spec commit (step 7) names no consolidation commits.
- **Evidence:** PRD.md `## Appends` (2026-11-24 test list sitting); no PRD-HISTORY file written
- **Cost:** not counted
- **Local workaround:** followed vid-init (the governing skill): no consolidation at init; the append stays as an append.
- **Ask:** state in one place whether a spec-only init consolidates, and make the other skill say the same.

## F-2 · A second sitting of the same stop replaces the first on disk

- **Seen:** 2026-11-24 · ViD 0.26.11.1.7 · records 29 · init, step 4
- **Where:** checks/face.sh (`write tests-review` after `write tests`)
- **What happened:** writing the tests-review sitting replaced the tests sitting on disk, so `face.sh end tests` afterwards reported "was not written … nothing to end", and the tests sitting's end is never recorded.
- **Evidence:** .vid/face/ (sitting.json holds tests-review only)
- **Cost:** not counted
- **Local workaround:** ended tests-review; the tests sitting's end is left unrecorded.
- **Ask:** either end the open sitting when another of the same stop is written, or let `end` close a replaced sitting.

## F-3 · An owed census rule fails the spec commit when its folder does not exist yet

- **Seen:** 2026-11-24 · ViD 0.26.11.1.7 · records 29 · init, step 7 (spec commit)
- **Where:** checks/census.sh (the `left :: right` branch: any standard-error output is a FAIL, before the owed rule's pending reading)
- **What happened:** rule rows ratified `owed: census-armed` with `find site -type f` failed the spec commit because site/ is not in the staged tree and find wrote "No such file or directory"; vid-init says every shipped court is presence-gated and the spec commit passes on a tree with no code.
- **Evidence:** .vid/commit-spec.log
- **Cost:** one refused commit
- **Local workaround:** census commands rewritten as `find . -type f -path './site/*'`, which yields an empty population (pending) when site/ is absent.
- **Ask:** treat an owed rule's empty or absent substrate as pending before judging standard error, or say in the inventory skill how a census command must be written to survive a spec-only tree.
