# Contador de caracteres para el resumen del CV: the findings

As of 2026-11-24 16:39 UTC

- `PRD.md`: not committed yet

Still open: 0 · Fixed: 3 · Your rulings: 1 · Noted: 0

[[contents]]

## Still open

None.

## Fixed

- **Advisory**, found by the completeness audit, about the quality "What clearing does" {id: DIM-clear-action}; the requirement "One press of the clear button empties the box straight away, without asking, and the count goes back to zero; undo right after brings the text back." {id: REQ-003}; how it works: "One press of the clear button empties the box at once, with no confirmation, and the count and message follow the empty text." {id: MECH-03}: a mistaken press of the clear button loses the only copy of the text, and whether undo restores it depended on how a builder clears the box; the owner ruled undo restores it (A-014); REQ-003 now carries it as fail-if part (5) {id: F-02}
- **Blocking**, found by the review, about the requirement "When your text passes 500 characters a message says so and disappears once you are back to 500 or fewer; typing is never blocked." {id: REQ-002}: critical — unguarded seam: the message's 500 was not tied to the count the page shows, so a build could show 497 / 500 beside the over-limit message; REQ-002 now uses the shown count and carries part (5); arms (1) to (4) retained {id: F-03}
- **Advisory**, found by the review, about an answer {id: A-011}; an answer {id: A-012}: A-011 said the page must work at phone width while the owner struck phone layout as a requirement (A-012); A-011 restated as no requirement in this version {id: F-04}

## Your rulings

- **Advisory**, found by the red team, about how it works: "The count is recomputed from the box's whole text on every change, whatever made the change, by the counting rule the owner chose." {id: MECH-01}; the summary: value-coherence — destinations may count UTF-16 code units or CRLF line breaks, so a summary at 498 / 500 here may be too long there; A-001 is the owner's explicit rule, so a question for the owner, who left it {id: F-01}

## Noted

None.

