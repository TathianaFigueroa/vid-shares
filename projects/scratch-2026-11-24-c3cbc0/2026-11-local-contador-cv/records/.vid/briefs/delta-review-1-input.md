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
```

```vid-prd
REQ-001 AMENDED | functional | T1 | Below the text box the page shows how many characters the box holds out of the limit of 500, in the form A-007 states, updated on every change to the text whatever made it; an invisible character (a zero-width space, a soft hyphen, a direction mark) counts as one like any other. | fail-if: (1) after a change the shown count differs from the characters in the box, where each space, each line break, each accented letter, each emoji and each invisible character counts as one; (2) after text is pasted, cut, dropped or undone the count does not change until a further key is pressed; (3) the count shows characters remaining instead of characters used; (4) the count stops at 500 while the box holds more | serves: the person knows at every moment how long their summary is against the 500 they are allowed (G1) | authority: provisional | confirms_via: owner-decision/no | source: seed, A-001, A-007, A-008, A-016 | covers: DIM-char-count-rule, DIM-count-display | phase: pilot | feature: FEAT-01 | plain: Below the box the page always shows how many characters you have written out of 500, counting every character, space, line break and invisible character as one. | arms: 1 strengthened, 2 retained, 3 retained, 4 retained
CON-004 | constraint | T1 | The page works in the current and previous major versions of Chrome, Edge, Firefox and Safari; on an older browser that lacks the counting feature it shows no count rather than a wrong one. | authority: authoritative | source: A-015 | covers: DIM-count-display
```

RESOLVED: (OQ-1) A-015 — Which browsers must the page support? The counting rule relies on a browser feature that older versions lack (Firefox before version 125, for example).

RESOLVED: (OQ-2) A-016 — Do invisible characters that paste in from Word or PDF (zero-width space, soft hyphen, direction marks) count? The rule counts every character the person sees, and these show nothing.

RESOLVED: (OQ-3) A-017 — Phone keyboards usually have no undo, so undo after a mistaken clear does not reach most phone users. Keep the clear button as ruled (no confirmation, undo on keyboards), or change it?
