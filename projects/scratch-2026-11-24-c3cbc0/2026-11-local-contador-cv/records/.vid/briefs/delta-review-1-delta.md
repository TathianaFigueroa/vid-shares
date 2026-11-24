### 2026-11-24 (test list sitting)

```vid-prd-answers
A-015 | human | 2026-11-24 | Q: Which browsers must the page support? | A: accepted as recommended: the current and previous major versions of Chrome, Edge, Firefox and Safari; on an older browser that lacks the counting feature the page shows no count rather than a wrong one | settles: OQ-1, CON-004
A-016 | human | 2026-11-24 | Q: Do invisible characters pasted from Word or PDF (zero-width space, soft hyphen, direction marks) count? | A: accepted as recommended: they count, one each, like every other character, because the site that receives the summary counts them too | settles: OQ-2, REQ-001
A-017 | human | 2026-11-24 | Q: Phone keyboards usually have no undo; keep the clear button as ruled? | A: accepted as recommended: keep it as ruled, one press with no question, undo wherever the keyboard has it | settles: OQ-3 | unchanged: REQ-003
A-018 | human | 2026-11-24 | Q: A strength reviewer says the census rules judge the file search by its exit code; keep the rules as written? | A: accepted as recommended: keep the rules as written; the census compares two lists of files and ignores the exit code, and the number beside each rule is its tier | settles: contract
```

```vid-prd
REQ-001 AMENDED | functional | T1 | Below the text box the page shows how many characters the box holds out of the limit of 500, in the form A-007 states, updated on every change to the text whatever made it; an invisible character (a zero-width space, a soft hyphen, a direction mark) counts as one like any other. | fail-if: (1) after a change the shown count differs from the characters in the box, where each space, each line break, each accented letter, each emoji and each invisible character counts as one; (2) after text is pasted, cut, dropped or undone the count does not change until a further key is pressed; (3) the count shows characters remaining instead of characters used; (4) the count stops at 500 while the box holds more | serves: the person knows at every moment how long their summary is against the 500 they are allowed (G1) | authority: provisional | confirms_via: owner-decision/no | source: seed, A-001, A-007, A-008, A-016 | covers: DIM-char-count-rule, DIM-count-display | phase: pilot | feature: FEAT-01 | plain: Below the box the page always shows how many characters you have written out of 500, counting every character, space, line break and invisible character as one. | arms: 1 strengthened, 2 retained, 3 retained, 4 retained
CON-004 | constraint | T1 | The page works in the current and previous major versions of Chrome, Edge, Firefox and Safari; on an older browser that lacks the counting feature it shows no count rather than a wrong one. | authority: authoritative | source: A-015 | covers: DIM-count-display
```

RESOLVED: (OQ-1) A-015 — Which browsers must the page support? The counting rule relies on a browser feature that older versions lack (Firefox before version 125, for example).

RESOLVED: (OQ-2) A-016 — Do invisible characters that paste in from Word or PDF (zero-width space, soft hyphen, direction marks) count? The rule counts every character the person sees, and these show nothing.

RESOLVED: (OQ-3) A-017 — Phone keyboards usually have no undo, so undo after a mistaken clear does not reach most phone users. Keep the clear button as ruled (no confirmation, undo on keyboards), or change it?
Open entries of checks/prd.sh --arms for the delta's rows:
REQ-001 arm 1 strengthened | was: after a change the shown count differs from the characters the person sees in the box, where each space, each line break, each accented letter and each emoji counts as one | now: (1) after a change the shown count differs from the characters in the box, where each space, each line break, each accented letter, each emoji and each invisible character counts as one; (2) after text is pasted, cut, dropped or undone the count does not change until a further key is pressed; (3) the count shows characters remaining instead of characters used; (4) the count stops at 500 while the box holds more
