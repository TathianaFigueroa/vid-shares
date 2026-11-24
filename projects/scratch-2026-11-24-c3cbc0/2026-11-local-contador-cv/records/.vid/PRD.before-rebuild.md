# Contador de caracteres para el resumen del CV — PRD
grammar: 0.26.11.1.2

> **Precedence rule:** the base of this file (everything above `## Appends`)
> is immutable after final ratification. All change is appended under
> `## Appends`. Later appends win over the base and over earlier appends.
> Authority order within the record: Seed and human answers > ratified
> thesis > sources > model proposals.

## Seed

### 2026-11-24 — the owner's brief

Producto: Una sola página donde una persona escribe el resumen de su CV en un cuadro de texto y ve cuántos caracteres lleva, con un límite de 500.
Qué debe hacer:

1. Mostrar el número de caracteres escritos mientras la persona escribe.
2. Cuando el texto supera los 500 caracteres, mostrar un mensaje que lo indique. No definas el texto del mensaje; redáctalo tú.
3. Un botón para borrar todo el texto.

La interfaz está en español.
Fuera de esta versión: guardar el texto, cuentas, enviar o descargar el CV, corrector ortográfico, sugerencias de redacción, otros idiomas, analítica, diseño elaborado (una página limpia y legible basta). Nada se guarda sobre la persona.
Tamaño: es una primera versión. Escribe como máximo 3 requisitos y deja todo lo demás fuera de esta versión.

## Thesis

### Product summary

A single web page, with its interface in Spanish, where a person types or pastes the summary of their CV into one text box and sees, as they write, how many characters it holds against a limit of 500. When the text goes past 500 characters a message says so, without ever blocking the typing; one button clears all the text. Nothing about the person is kept or sent anywhere.

### Primary users

A person writing the summary paragraph of their own CV who needs it to fit within 500 characters before they use it somewhere else.

### MVP focus

- G1: The person always knows how many characters their summary holds, and is told plainly when it is past 500.
- G2: The person can start over with an empty box in one press.
- G3: The summary the person writes stays theirs alone: nothing about them is kept or sent.

### Explicitly not MVP

Saving the text, accounts, sending or downloading the CV, a spell checker, writing suggestions, other languages, analytics, and an elaborate design (a clean, readable page is enough), all as the seed lists them. The first version holds at most three requirements, at the owner's word; everything else waits for a later version.

### Required core flows

- Write or paste a summary and see its character count, and whether it is past 500, at every moment.
- Clear the box in one press to start again.

### Value logic

Wherever a CV summary is limited to 500 characters, the person needs to know before they use it whether it fits, and by how much it does not. The page answers that one question while they write, and asks nothing of them in return: no account, nothing stored.

### Evidence basis

The seed and the five interview answers (A-001 to A-005) are the only sources; they do not conflict. The seed leaves the message's wording to ViD, which is therefore a ViD decision.

## Actors and journeys

### The person writing their CV summary

1. Has a CV summary to write, or one that is too long, for a place that allows 500 characters (off_screen)
2. Opens the page and types, or pastes a draft, into the text box
3. Watches the count; when it passes 500 the message appears, and they trim the text until it disappears
4. Clears the box in one press to start a new attempt, if they want to
5. Copies the finished summary out by hand and uses it in their CV; closing the page leaves nothing behind (off_screen)

## Mechanisms

```vid-prd-mechanisms
MECH-01 | G1 | The count is recomputed from the box's whole text on every change, whatever made the change, by the counting rule the owner chose. | stated: answer A-001
MECH-02 | G1 | Whenever the count is above 500 the over-limit message is shown, and whenever it is 500 or fewer it is not; typing is never blocked. | stated: answer A-003
MECH-03 | G2 | One press of the clear button empties the box at once, with no confirmation, and the count and message follow the empty text. | stated: answer A-002
MECH-04 | G3 | The text exists only in the open page: it is never written to storage of any kind, never sent over the network, and is gone when the page closes. | stated: seed "Nada se guarda sobre la persona"
```

## Content contract

```vid-prd-contract
DIM-nfr-privacy | NFR: privacy & data protection | nfr | required | covered_by: nfr, constraint, functional, data_entity | status: covered
DIM-char-count-rule | What counts as one character | mechanism | required | covered_by: functional, invariant, constraint | prompt: without it a builder decides alone whether spaces, line breaks, accented letters typed in two parts and emoji count as one, zero or several, and two builds show different counts for the same text | status: covered
DIM-count-display | How and when the count is shown | mechanism | required | covered_by: functional, ux_flow, constraint | prompt: without it a builder invents the counter's form (used or remaining, the over-500 form) and which edits update it (paste, cut, undo, accent composition), so the count can lag or contradict the box | status: covered
DIM-limit-boundary | The 500 boundary and the over-limit message | mechanism | required | covered_by: functional, invariant, ux_flow | prompt: without it a builder decides whether exactly 500 is over, whether the message clears as soon as the text is back under, and may quietly block typing or cut pasted text at 500 | status: covered
DIM-clear-action | What clearing does | mechanism | required | covered_by: functional, ux_flow, invariant | prompt: without it a builder invents a confirmation or none, and whether the count and message reset with the box | status: covered
DIM-spanish-copy | The interface's Spanish words | mechanism | required | covered_by: constraint, functional | prompt: without it a builder writes every label, the message and the button in whatever form of address and variety of Spanish they like, and leaves the page's language undeclared | status: covered
DIM-no-retention | Nothing kept across reloads or visits | mechanism | required | covered_by: functional, constraint, invariant | prompt: without it a builder adds an autosave to browser storage or lets the browser restore the text after a reload, breaking the promise that nothing is kept | status: covered
DIM-text-egress | The text never leaves the page | nfr | required | covered_by: constraint, invariant, nfr | prompt: without it a builder counts on a server, puts the text in the address, or adds an error tracker that captures what was typed | status: covered
```

## Criticality tiers

- **T0** — must never break or leak.
- **T1** — core behavior; getting it wrong is a defect.
- **T2** — desirable; getting it wrong is a fix-round item.

## Items

```vid-prd-features
FEAT-01 | G1 | The character counter
FEAT-02 | G1 | The over-limit message
FEAT-03 | G2 | The clear button
```

```vid-prd
REQ-001 | functional | T1 | Below the text box the page shows how many characters the box holds out of the limit of 500, in the form A-007 states, updated on every change to the text whatever made it. | fail-if: (1) after a change the shown count differs from the characters the person sees in the box, where each space, each line break, each accented letter and each emoji counts as one; (2) after text is pasted, cut, dropped or undone the count does not change until a further key is pressed; (3) the count shows characters remaining instead of characters used; (4) the count stops at 500 while the box holds more | serves: the person knows at every moment how long their summary is against the 500 they are allowed (G1) | authority: provisional | confirms_via: owner-decision/no | source: seed, A-001, A-007, A-008 | covers: DIM-char-count-rule, DIM-count-display | phase: pilot | feature: FEAT-01 | plain: Below the box the page always shows how many characters you have written out of 500, counting every visible character, space and line break as one.
REQ-002 | functional | T1 | While the count the page shows is above 500 characters the message A-006 states is shown below the box, and while that count is 500 or fewer no such message is shown; nothing ever blocks or cuts what the person types or pastes. | fail-if: (1) the box holds 501 characters and the over-limit message is not shown; (2) the over-limit message is shown while the box holds 500 characters or fewer; (3) the message is still shown after the text is brought back to 500 characters or fewer; (4) a key press, paste or drop that would take the text past 500 characters is refused, or the text is cut to 500; (5) the over-limit message is shown while the count the page shows is 500 or fewer, or is not shown while that count is above 500 | serves: the person learns the moment their summary no longer fits, without losing anything they wrote (G1) | authority: provisional | confirms_via: owner-decision/no | source: seed, A-001, A-003, A-006, thesis MECH-02 | covers: DIM-limit-boundary | phase: pilot | feature: FEAT-02 | plain: When your text passes 500 characters a message says so and disappears once you are back to 500 or fewer; typing is never blocked.
REQ-003 | functional | T1 | One press of the clear button empties the text box at once, with no confirmation, and the count and the over-limit message follow the empty box; undo right after clearing brings the cleared text back. | fail-if: (1) after one press of the clear button the box still holds any character; (2) a confirmation or any other question appears before the box is emptied; (3) after clearing the count shows anything other than zero characters; (4) after clearing the over-limit message is still shown; (5) undo pressed right after clearing does not bring back the text that was cleared | serves: the person can start a new attempt in one press, without losing their work to a mistaken press (G2) | authority: authoritative | source: seed, A-002, A-014 | covers: DIM-clear-action | phase: pilot | feature: FEAT-03 | plain: One press of the clear button empties the box straight away, without asking, and the count goes back to zero; undo right after brings the text back.
CON-001 | constraint | T0 | The text the person writes, and anything derived from it, never leaves the open page: it is never sent over the network, never placed in the page's address, and never written to cookies or to any storage in the browser. | authority: authoritative | source: seed | covers: DIM-nfr-privacy, DIM-text-egress, DIM-no-retention
CON-002 | constraint | T1 | The text box opens empty on every load of the page, and the browser is told not to restore or remember what was typed in it. | authority: provisional | confirms_via: owner-decision/no | source: seed, A-009 | covers: DIM-no-retention
CON-003 | constraint | T1 | Every word of the interface is in Spanish, worded as A-010 states, and the page declares Spanish as its language. | authority: provisional | confirms_via: owner-decision/no | source: seed, A-010 | covers: DIM-spanish-copy
NG-001 | non_goal | - | Saving the text, in any form, is not part of this version. | authority: authoritative | source: seed
NG-002 | non_goal | - | Accounts or sign-in are not part of this version. | authority: authoritative | source: seed
NG-003 | non_goal | - | Sending or downloading the CV is not part of this version. | authority: authoritative | source: seed
NG-004 | non_goal | - | A spell checker added by the page is not part of this version. | authority: authoritative | source: seed
NG-005 | non_goal | - | Writing suggestions are not part of this version. | authority: authoritative | source: seed
NG-006 | non_goal | - | Languages other than Spanish are not part of this version. | authority: authoritative | source: seed
NG-007 | non_goal | - | Analytics of any kind are not part of this version. | authority: authoritative | source: seed
NG-008 | non_goal | - | An elaborate design is not part of this version: a clean, readable page is enough. | authority: authoritative | source: seed
NG-009 | non_goal | - | Accessibility work beyond what a plain page gives, such as announcing the count to screen readers, is deferred out of this version. | authority: authoritative | source: A-012
```

## Answer ledger

```vid-prd-answers
A-001 | human | 2026-11-24 | Q: How does the count treat spaces, line breaks and special letters? | A: accepted as recommended: every character the person sees counts as one, spaces and line breaks included; an accented letter or an emoji counts as one | settles: thesis
A-002 | human | 2026-11-24 | Q: Does the clear button ask for confirmation first? | A: accepted as recommended: no confirmation; one press clears the text at once | settles: thesis
A-003 | human | 2026-11-24 | Q: Once the text passes 500, can the person keep typing? | A: accepted as recommended: typing is never blocked; the over-limit message stays until the text is back to 500 or fewer | settles: thesis
A-004 | human | 2026-11-24 | Q: Boundary challenge: keep the clear-all button in the first version? | A: accepted as recommended: keep | settles: thesis
A-005 | human | 2026-11-24 | Q: Boundary challenge: keep the over-limit message in the first version? | A: accepted as recommended: keep | settles: thesis
A-006 | model_proposed | 2026-11-24 | Q: What does the over-limit message say? | A: "Tu resumen supera los 500 caracteres. Acórtalo para que quepa." shown below the text box, addressing the person as tú | settles: thesis | shown: pause-1 530042824
A-007 | model_proposed | 2026-11-24 | Q: How is the count shown? | A: as characters used out of the limit, for example "123 / 500", directly below the text box; past the limit it keeps showing the real count, for example "523 / 500" | settles: thesis | shown: pause-1 3362252088
A-008 | model_proposed | 2026-11-24 | Q: Which edits update the count? | A: every change to the text counts the same, whether typed, pasted, cut, dropped, undone or autocorrected; an accent typed in two keystrokes counts once it is complete | settles: thesis | shown: pause-1 2681540881
A-009 | model_proposed | 2026-11-24 | Q: What happens to the text on reload or on returning to the page? | A: the box always opens empty; the browser is told not to restore or remember the text | settles: thesis | shown: pause-1 2730608831
A-010 | model_proposed | 2026-11-24 | Q: Which Spanish does the interface use? | A: neutral Latin American Spanish, the person addressed as tú, the document called "CV", the page declared as Spanish | settles: thesis | shown: pause-1 235434062
A-011 | model_proposed | 2026-11-24 | Q: Must the page work on a phone? | A: no requirement in this version: phone layout was struck by the owner (A-012); the plain page is left readable at phone width as a builder's matter, and nothing is graded against it | settles: thesis | shown: pause-3 3163526163
A-012 | human | 2026-11-24 | Q: Which qualities does the contract hold? | A: accepted as recommended: the eight kept (privacy, what counts as one character, how and when the count is shown, the 500 boundary, what clearing does, the Spanish wording, nothing kept across reloads or visits, the text never leaves the page); struck and out of this version: accessibility, phone layout as a requirement, third-party loads, browser spell-check and autofill, an on-page privacy note, text box shape, unrequested controls, large-paste performance, and the catalog floor dimensions security, availability, operability, core-loop continuity, identity, consent, lifecycle, operations, feedback intake, trust states, authorization, notifications, data integrity, proof thresholds, instrumentation; case-by-case dimensions technical SEO and i18n-locale ruled out | settles: contract
A-013 | human | 2026-11-24 | Q: The critic's finding F-01: sites that receive the text may count emoji or line breaks as two characters; add help text? | A: accepted as recommended: leave it; the counting rule of A-001 stands and no help text is added | settles: MECH-01
A-014 | human | 2026-11-24 | Q: If the person presses the clear button by mistake, does undo right after it bring the text back? | A: accepted as recommended: yes, undo right after clearing brings the cleared text back | settles: REQ-003
```

## Open decisions

<!-- Blocking product questions, `VID-QUESTION: (OQ-n) …`. None open. -->

## Findings

### 2026-11-24 — pause 1 sitting

```vid-prd-findings
F-01 | red-team | advisory | MECH-01, thesis | overruled A-013 | evidence: value-coherence — destinations may count UTF-16 code units or CRLF line breaks, so a summary at 498 / 500 here may be too long there; A-001 is the owner's explicit rule, so a question for the owner, who left it
```

### 2026-11-24 — pause 2 sitting

```vid-prd-findings
F-02 | audit | advisory | DIM-clear-action, REQ-003, MECH-03 | repaired | evidence: a mistaken press of the clear button loses the only copy of the text, and whether undo restores it depended on how a builder clears the box; the owner ruled undo restores it (A-014); REQ-003 now carries it as fail-if part (5)
```

### 2026-11-24 — pause 3 sitting

```vid-prd-findings
F-03 | review | blocking | REQ-002 | repaired | evidence: critical — unguarded seam: the message's 500 was not tied to the count the page shows, so a build could show 497 / 500 beside the over-limit message; REQ-002 now uses the shown count and carries part (5); arms (1) to (4) retained
F-04 | review | advisory | A-011, A-012 | repaired | evidence: A-011 said the page must work at phone width while the owner struck phone layout as a requirement (A-012); A-011 restated as no requirement in this version
```

review: whole, round 2, 2 findings

### 2026-11-24 — strength pass

```vid-prd-findings
F-05 | strength | blocking | INVENTORY.md:ROW-005, INVENTORY.md:ROW-035 | repaired | evidence: a message toggled on key release shows at 501 typed, but a paste, drop or undo to above 500 showed none until a key; ROW-035 now covers every way upward, at once
F-06 | strength | blocking | INVENTORY.md:ROW-005, INVENTORY.md:ROW-035 | repaired | evidence: a transient toast passes "shown at 501"; ROW-005 now requires the message to stay while the text stays above 500
F-07 | strength | blocking | INVENTORY.md:ROW-008 | repaired | evidence: test text of single-code-point emoji and precomposed accents gives equal counts under both rules; ROW-008 now pins multi-code-point emoji and a combining accent
F-08 | strength | advisory | INVENTORY.md:ROW-036 | repaired | evidence: over-limit styling never removed after coming back down; ROW-036 now checks after coming down
F-09 | strength | advisory | INVENTORY.md:ROW-021 | repaired | evidence: the caret could jump only above 500; ROW-021 now checks above 500 too
F-10 | strength | advisory | INVENTORY.md:ROW-002, INVENTORY.md:ROW-019, INVENTORY.md:ROW-048 | repaired | evidence: a debounced count passes retrying checks; "at once" now means one read without retry and a second after one quiet second
F-11 | strength | advisory | INVENTORY.md:ROW-020 | repaired | evidence: a count that skips composing input with no end-of-composition recount; ROW-020 now names the sequence and drives real composition in Chromium
F-12 | strength | advisory | INVENTORY.md:ROW-019, INVENTORY.md:ROW-046 | repaired | evidence: a handler filtering on the kind of edit passes value-setting tests; edits are now made as the browser makes them
F-13 | strength | advisory | INVENTORY.md:ROW-042 | repaired | evidence: a code-point fallback passes a plain-letter test; ROW-042 now removes the facility before the script and enters a combining accent and a joined emoji
F-14 | strength | advisory | INVENTORY.md:ROW-023 | repaired | evidence: rows left out of the three-engine run; ROW-002, ROW-024, ROW-043, ROW-046 and ROW-048 added
F-15 | strength | advisory | INVENTORY.md:ROW-001 | repaired | evidence: expected counts taken from the engine's own segmenter agree by construction; they now come from Unicode's published grapheme-break data, pinned
F-16 | strength | advisory | INVENTORY.md:ROW-001, REQ-001, A-001 | repaired | evidence: invisible characters were undecided between "what the person sees" and grapheme clusters; the owner ruled they count (A-016), REQ-001 amended and ROW-001 rewritten
F-17 | strength | blocking | INVENTORY.md:RULE-001 | repaired | evidence: the word list held unescaped parentheses and did not compile; escaped, and every rule's pattern checked on a planted folder
F-18 | strength | blocking | INVENTORY.md:RULE-001, INVENTORY.md:RULE-002, INVENTORY.md:RULE-003, INVENTORY.md:RULE-005, INVENTORY.md:RULE-007, INVENTORY.md:RULE-008 | overruled A-018 | evidence: critical — the reviewers read the fifth field as an expected exit code of grep -L; ViD's belief rests on checks/census.sh lines 12-15 and 412-420 (orphans are the left list minus the right list; the exit code is not read) and the template's rule grammar (the fifth field is the tier); the owner kept the rules as written
F-19 | strength | blocking | INVENTORY.md:HOS-001, INVENTORY.md:HOS-002 | repaired | evidence: the probes showed failure with the line inserted but never a pass without it; both now pass with the line removed
F-20 | strength | blocking | INVENTORY.md:ROW-014 | repaired | evidence: headless Chromium does not restore a textarea on reload and a harness back navigation may skip the back-forward cache; ROW-014 now requires a cache restore and autocomplete="off"
F-21 | strength | advisory | INVENTORY.md:ROW-015 | repaired | evidence: a short banned-word list passes other usted forms and catches "su" inside "supera"; ROW-015 now compares the full set of strings, whole words
F-22 | strength | advisory | INVENTORY.md:ROW-022 | repaired | evidence: headless Chromium guesses UTF-8; ROW-022 now also checks the declared charset in the first 1024 bytes
F-23 | strength | advisory | INVENTORY.md:ROW-012, INVENTORY.md:ROW-051 | repaired | evidence: window.name and history state unchecked, and requests at close unseen by the page; both added
F-24 | strength | advisory | INVENTORY.md:HOS-002 | repaired | evidence: a preconnect sends no request the browser logs; HOS-002 now counts connections at the outside host's socket
F-25 | strength | advisory | INVENTORY.md:RULE-001, INVENTORY.md:RULE-005 | repaired | evidence: literal extension lists and missing call names; both scan every shipped file and RULE-001 adds setAttribute, url( and Worker
F-26 | strength | advisory | INVENTORY.md:ROW-012, INVENTORY.md:ROW-045 | repaired | evidence: "its own three files" against a shipped icon file; ROW-012 now allows the shipped site/ files and ROW-045 names an empty inline icon
F-27 | strength | advisory | INVENTORY.md:RULE-005, INVENTORY.md:ROW-045 | repaired | evidence: an inline SVG icon's namespace address matches RULE-005; the icon is now data:, and comments are written with a space after //
F-28 | strength | advisory | INVENTORY.md:RULE-008, INVENTORY.md:ROW-045 | repaired | evidence: the phone pattern matched SVG path data and dates; reworked, the icon has no path data
F-29 | strength | advisory | INVENTORY.md:RULE-002, INVENTORY.md:ROW-024, INVENTORY.md:ROW-043 | repaired | evidence: the rule's words forbade the load and page-shown recount the rows need; RULE-002 reworded to what its census holds
F-30 | strength | advisory | INVENTORY.md:ROW-023, INVENTORY.md:ROW-020, INVENTORY.md:ROW-032 | repaired | evidence: Cmd+Z, menu undo and non-Chromium composition cannot be driven in the Linux harness; rows narrowed to what it drives, the rest a real-device checklist line
F-31 | strength | advisory | INVENTORY.md:ROW-011, INVENTORY.md:ROW-032 | repaired | evidence: repeat; ROW-032 now holds only what ROW-011 does not
F-32 | strength | advisory | INVENTORY.md:ROW-003, INVENTORY.md:ROW-004 | repaired | evidence: repeated thousands-separator clause; kept in ROW-004 only
F-33 | strength | blocking | INVENTORY.md:HOS-001, INVENTORY.md:RULE-001 | repaired | evidence: round 2 — setAttribute had joined the word list, so HOS-001's planted path was no longer unnamed; it now uses a computed property name
F-34 | strength | blocking | INVENTORY.md:ROW-051 | repaired | evidence: round 2 — observing only the listening host misses a beacon to another host on close; every request the browser attempts is now observed
F-35 | strength | blocking | INVENTORY.md:RULE-008 | repaired | evidence: round 2 — common phone formats passed; any run of seven or more digits now counts
F-36 | strength | blocking | INVENTORY.md:ROW-019, INVENTORY.md:ROW-023 | repaired | evidence: round 2 — edits the harness cannot make natively; ROW-019 now names how each is driven, and RULE-009 forbids a count that reads the kind of edit
F-37 | strength | blocking | INVENTORY.md:HOS-001, INVENTORY.md:RULE-001 | repaired | evidence: round 3 — no probe shows the census itself catching a plain call; HOS-003 added at the owner's ruling
F-38 | strength | blocking | INVENTORY.md:ROW-019, INVENTORY.md:ROW-023 | repaired | evidence: round 3 — ROW-023 required ROW-019 in three engines with no stated path; narrowed at the owner's ruling
F-39 | strength | blocking | INVENTORY.md:HOS-001 | repaired | evidence: after the owner's rulings — the probe watched only the listening host; it now watches every request after load and reads storage
F-40 | strength | blocking | INVENTORY.md:ROW-042 | repaired | evidence: after the owner's rulings — one named pair let a hand-written fallback pass; the row now runs ROW-001's sampled strings with the facility removed
F-41 | strength | blocking | INVENTORY.md:ROW-001, REQ-001, A-016 | repaired | evidence: after the owner's rulings — joiners attached to a character against "each invisible character counts"; settled by the owner's answers on joined emoji (A-001 restated) and ROW-001 rewritten
F-42 | strength | blocking | INVENTORY.md:ROW-001, REQ-001, A-001 | repaired | evidence: Unicode's grapheme data glues a mark to a preceding space, the owner's rule does not; ROW-001 now states the owner's correction with sampled cases
F-43 | strength | blocking | INVENTORY.md:HOS-001 | repaired | evidence: the probe covered typing only; it now covers a whole session from load to close, recorded at the network exit
```

review: whole, round 5, 39 findings

### 2026-11-24 — test list sitting

```vid-prd-findings
F-44 | review | blocking | REQ-001 | repaired | evidence: round 1 — the first rewording let a joined emoji count as its parts; repaired at the owner's answer to keep an emoji one however built
F-45 | review | blocking | A-001, A-016 | repaired | evidence: round 1 — A-016 changed A-001's rule; A-001 restated with the owner's yes
F-46 | review | advisory | REQ-002, CON-004 | repaired | evidence: round 1 — whether the message shows on an older browser was undecided; the owner ruled it stays hidden (A-019)
F-47 | review | blocking | REQ-001 | accepted A-020 | evidence: arm 1 — round 2 — the arm now counts each invisible character standing on its own as one, where it used to fail a count differing from what the person sees; the owner accepted the change
F-48 | review | blocking | REQ-002 | accepted A-020 | evidence: arm 1 — round 2 — the arm now applies on the browsers the page supports only; the owner accepted the narrowing
F-49 | review | blocking | REQ-001, CON-004 | repaired | evidence: round 2 — REQ-001 now states no count is shown on an older browser, as CON-004 does
F-50 | review | blocking | REQ-001 | repaired | evidence: round 2 — the plain sentence said every invisible character counts; it now says a lone invisible character
```

## Ratifications

- 2026-11-24 — thesis+contract — 3a7c18d
- 2026-11-24 — gap answers — 8cb11f9
- 2026-11-24 — final — 6d33f71

## Appends

<!-- Append-only below this line. -->

### 2026-11-24 (test list sitting)

```vid-prd-answers
A-015 | human | 2026-11-24 | Q: Which browsers must the page support? | A: accepted as recommended: the current and previous major versions of Chrome, Edge, Firefox and Safari; on an older browser that lacks the counting feature the page shows no count rather than a wrong one | settles: OQ-1, CON-004
A-016 | human | 2026-11-24 | Q: Do invisible characters pasted from Word or PDF (zero-width space, soft hyphen, direction marks) count? | A: accepted as recommended: they count, one each, like every other character, because the site that receives the summary counts them too | settles: OQ-2, REQ-001
A-017 | human | 2026-11-24 | Q: Phone keyboards usually have no undo; keep the clear button as ruled? | A: accepted as recommended: keep it as ruled, one press with no question, undo wherever the keyboard has it | settles: OQ-3 | unchanged: REQ-003
A-018 | human | 2026-11-24 | Q: A strength reviewer says the census rules judge the file search by its exit code; keep the rules as written? | A: accepted as recommended: keep the rules as written; the census compares two lists of files and ignores the exit code, and the number beside each rule is its tier | settles: contract
A-019 | human | 2026-11-24 | Q: On an older browser that lacks the counting feature the page shows no count; should the over-limit message stay hidden there too? | A: yes: on such a browser the over-limit message stays hidden too, like the count; the message rule's first failure clause applies to the browsers the page supports (CON-004) | settles: REQ-002, CON-004
A-001 AMENDED | human | 2026-11-24 | Q: How does the count treat spaces, line breaks and special letters? | A: accepted as recommended: every character in the box counts as one, each one the person sees (spaces and line breaks included, an accented letter or an emoji counting as one however many parts it is built from), plus each invisible character standing on its own (a zero-width space, a soft hyphen, a direction mark); an invisible joiner or modifier attached to the letter or emoji before it is part of that character | settles: REQ-001, MECH-01 | unchanged: REQ-002
A-020 | human | 2026-11-24 | Q: Your answers changed two failure clauses: the counter's first clause now counts each invisible character standing on its own as one, and the message's first clause now applies only on the browsers the page supports. Accept both? | A: yes, both changes accepted as written | settles: REQ-001, REQ-002
```

```vid-prd
REQ-001 AMENDED | functional | T1 | Below the text box the page shows how many characters the box holds out of the limit of 500, in the form A-007 states, updated on every change to the text whatever made it; an invisible character standing on its own (a zero-width space, a soft hyphen, a direction mark) counts as one like any other, and an invisible part of an emoji or an accented letter adds nothing to it; on an older browser that lacks the counting feature (CON-004) no count is shown. | fail-if: (1) after a change the shown count differs from the characters the person sees in the box, where each space, each line break, each accented letter and each emoji counts as one, an emoji built from several joined parts (a family, a skin tone, a flag) counting as one, and where each zero-width space, soft hyphen and direction mark standing on its own counts as one; (2) after text is pasted, cut, dropped or undone the count does not change until a further key is pressed; (3) the count shows characters remaining instead of characters used; (4) the count stops at 500 while the box holds more | serves: the person knows at every moment how long their summary is against the 500 they are allowed (G1) | authority: provisional | confirms_via: owner-decision/no | source: seed, A-001, A-007, A-008, A-016 | covers: DIM-char-count-rule, DIM-count-display | phase: pilot | feature: FEAT-01 | plain: Below the box the page shows how many characters you have written out of 500, counting each character you see, space, line break and lone invisible character as one. | arms: 1 strengthened, 2 retained, 3 retained, 4 retained
CON-004 | constraint | T1 | The page works in the current and previous major versions of Chrome, Edge, Firefox and Safari; on an older browser that lacks the counting feature it shows neither a count nor the over-limit message, rather than wrong ones. | authority: authoritative | source: A-015, A-019 | covers: DIM-count-display
REQ-002 AMENDED | functional | T1 | While the count the page shows is above 500 characters the message A-006 states is shown below the box, and while that count is 500 or fewer no such message is shown; nothing ever blocks or cuts what the person types or pastes; on an older browser that lacks the counting feature (CON-004) neither the count nor the message is shown. | fail-if: (1) on a browser the page supports, the box holds 501 characters and the over-limit message is not shown; (2) the over-limit message is shown while the box holds 500 characters or fewer; (3) the message is still shown after the text is brought back to 500 characters or fewer; (4) a key press, paste or drop that would take the text past 500 characters is refused, or the text is cut to 500; (5) the over-limit message is shown while the count the page shows is 500 or fewer, or is not shown while that count is above 500 | serves: the person learns the moment their summary no longer fits, without losing anything they wrote (G1) | authority: provisional | confirms_via: owner-decision/no | source: seed, A-001, A-003, A-006, A-019, thesis MECH-02 | covers: DIM-limit-boundary | phase: pilot | feature: FEAT-02 | plain: When your text passes 500 characters a message says so and disappears once you are back to 500 or fewer; typing is never blocked. | arms: 1 retained, 2 retained, 3 retained, 4 retained, 5 retained
```

RESOLVED: (OQ-1) A-015 — Which browsers must the page support? The counting rule relies on a browser feature that older versions lack (Firefox before version 125, for example).

RESOLVED: (OQ-2) A-016 — Do invisible characters that paste in from Word or PDF (zero-width space, soft hyphen, direction marks) count? The rule counts every character the person sees, and these show nothing.

RESOLVED: (OQ-3) A-017 — Phone keyboards usually have no undo, so undo after a mistaken clear does not reach most phone users. Keep the clear button as ruled (no confirmation, undo on keyboards), or change it?
