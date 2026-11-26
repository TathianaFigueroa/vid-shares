# Contador de caracteres para el resumen del CV: the product

As of 2026-11-24 20:06 UTC

- `PRD.md`: not committed yet

Requirements: 3 · Features: 3 · Open questions: 0 · Answers of yours: 13 · Answers of ViD's: 6 · Findings: 4

[[contents]]

## The summary


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


## The qualities it must have

- **NFR: privacy & data protection**: Needs it {id: DIM-nfr-privacy}
- **What counts as one character**: Needs it {id: DIM-char-count-rule}
- **How and when the count is shown**: Needs it {id: DIM-count-display}
- **The 500 boundary and the over-limit message**: Needs it {id: DIM-limit-boundary}
- **What clearing does**: Needs it {id: DIM-clear-action}
- **The interface's Spanish words**: Needs it {id: DIM-spanish-copy}
- **Nothing kept across reloads or visits**: Needs it {id: DIM-no-retention}
- **The text never leaves the page**: Needs it {id: DIM-text-egress}

## The features

::: fold The character counter — 1 requirement in the first version, 0 must never break {id: FEAT-01}

{at: req-001}
**Below the box the page shows how many characters you have written out of 500, counting each character you see, space, line break and lone invisible character as one.** {id: REQ-001}

It fails if:

- (1) after a change the shown count differs from the characters the person sees in the box, where each space, each line break, each accented letter and each emoji counts as one, an emoji built from several joined parts (a family, a skin tone, a flag) counting as one, and where each zero-width space, soft hyphen and direction mark standing on its own counts as one; (2) after text is pasted, cut, dropped
- undone the count does not change until a further key is pressed; (3) the count shows characters remaining instead of characters used; (4) the count stops at 500 while the box holds more

Rests on a ViD decision

:::

::: fold The over-limit message — 1 requirement in the first version, 0 must never break {id: FEAT-02}

{at: req-002}
**When your text passes 500 characters a message says so and disappears once you are back to 500 or fewer; typing is never blocked.** {id: REQ-002}

It fails if:

- (1) on a browser the page supports, the box holds 501 characters and the over-limit message is not shown; (2) the over-limit message is shown while the box holds 500 characters
- fewer; (3) the message is still shown after the text is brought back to 500 characters
- fewer; (4) a key press, paste
- drop that would take the text past 500 characters is refused
- the text is cut to 500; (5) the over-limit message is shown while the count the page shows is 500
- fewer
- is not shown while that count is above 500

Rests on a ViD decision

:::

::: fold The clear button — 1 requirement in the first version, 0 must never break {id: FEAT-03}

{at: req-003}
**One press of the clear button empties the box straight away, without asking, and the count goes back to zero; undo right after brings the text back.** {id: REQ-003}

It fails if:

- (1) after one press of the clear button the box still holds any character; (2) a confirmation
- any other question appears before the box is emptied; (3) after clearing the count shows anything other than zero characters; (4) after clearing the over-limit message is still shown; (5) undo pressed right after clearing does not bring back the text that was cleared

:::

::: fold Beyond the features

{at: con-001}
**The text the person writes, and anything derived from it, never leaves the open page: it is never sent over the network, never placed in the page's address, and never written to cookies or to any storage in the browser.** {id: CON-001}

Must never break

{at: con-002}
**The text box opens empty on every load of the page, and the browser is told not to restore or remember what was typed in it.** {id: CON-002}

Rests on a ViD decision

{at: con-003}
**Every word of the interface is in Spanish, worded as A-010 states, and the page declares Spanish as its language.** {id: CON-003}

Rests on a ViD decision

{at: ng-001}
**Saving the text, in any form, is not part of this version.** {id: NG-001}

{at: ng-002}
**Accounts or sign-in are not part of this version.** {id: NG-002}

{at: ng-003}
**Sending or downloading the CV is not part of this version.** {id: NG-003}

{at: ng-004}
**A spell checker added by the page is not part of this version.** {id: NG-004}

{at: ng-005}
**Writing suggestions are not part of this version.** {id: NG-005}

{at: ng-006}
**Languages other than Spanish are not part of this version.** {id: NG-006}

{at: ng-007}
**Analytics of any kind are not part of this version.** {id: NG-007}

{at: ng-008}
**An elaborate design is not part of this version: a clean, readable page is enough.** {id: NG-008}

{at: ng-009}
**Accessibility work beyond what a plain page gives, such as announcing the count to screen readers, is deferred out of this version.** {id: NG-009}

{at: con-004}
**The page works in the current and previous major versions of Chrome, Edge, Firefox and Safari; on an older browser that lacks the counting feature it shows neither a count nor the over-limit message, rather than wrong ones.** {id: CON-004}

:::

## Decisions

### Yours

- **How does the count treat spaces, line breaks and special letters?** accepted as recommended: every character in the box counts as one, each one the person sees (spaces and line breaks included, an accented letter or an emoji counting as one however many parts it is built from), plus each invisible character standing on its own (a zero-width space, a soft hyphen, a direction mark); an invisible joiner or modifier attached to the letter or emoji before it is part of that character {id: A-001}
- **Does the clear button ask for confirmation first?** accepted as recommended: no confirmation; one press clears the text at once {id: A-002}
- **Once the text passes 500, can the person keep typing?** accepted as recommended: typing is never blocked; the over-limit message stays until the text is back to 500 or fewer {id: A-003}
- **Boundary challenge: keep the clear-all button in the first version?** accepted as recommended: keep {id: A-004}
- **Boundary challenge: keep the over-limit message in the first version?** accepted as recommended: keep {id: A-005}
- **Which qualities does the contract hold?** accepted as recommended: the eight kept (privacy, what counts as one character, how and when the count is shown, the 500 boundary, what clearing does, the Spanish wording, nothing kept across reloads or visits, the text never leaves the page); struck and out of this version: accessibility, phone layout as a requirement, third-party loads, browser spell-check and autofill, an on-page privacy note, text box shape, unrequested controls, large-paste performance, and the catalog floor dimensions security, availability, operability, core-loop continuity, identity, consent, lifecycle, operations, feedback intake, trust states, authorization, notifications, data integrity, proof thresholds, instrumentation; case-by-case dimensions technical SEO and i18n-locale ruled out {id: A-012}
- **The critic's finding F-01: sites that receive the text may count emoji or line breaks as two characters; add help text?** accepted as recommended: leave it; the counting rule of A-001 stands and no help text is added {id: A-013}
- **If the person presses the clear button by mistake, does undo right after it bring the text back?** accepted as recommended: yes, undo right after clearing brings the cleared text back {id: A-014}
- **Which browsers must the page support?** accepted as recommended: the current and previous major versions of Chrome, Edge, Firefox and Safari; on an older browser that lacks the counting feature the page shows no count rather than a wrong one {id: A-015}
- **Do invisible characters pasted from Word or PDF (zero-width space, soft hyphen, direction marks) count?** accepted as recommended: they count, one each, like every other character, because the site that receives the summary counts them too {id: A-016}
- **Phone keyboards usually have no undo; keep the clear button as ruled?** accepted as recommended: keep it as ruled, one press with no question, undo wherever the keyboard has it {id: A-017}
- **A strength reviewer says the census rules judge the file search by its exit code; keep the rules as written?** accepted as recommended: keep the rules as written; the census compares two lists of files and ignores the exit code, and the number beside each rule is its tier {id: A-018}
- **On an older browser that lacks the counting feature the page shows no count; should the over-limit message stay hidden there too?** yes: on such a browser the over-limit message stays hidden too, like the count; the message rule's first failure clause applies to the browsers the page supports (CON-004) {id: A-019}

### ViD's

- **What does the over-limit message say?** "Tu resumen supera los 500 caracteres. Acórtalo para que quepa." shown below the text box, addressing the person as tú (you have seen this) {id: A-006}
- **How is the count shown?** as characters used out of the limit, for example "123 / 500", directly below the text box; past the limit it keeps showing the real count, for example "523 / 500" (you have seen this) {id: A-007}
- **Which edits update the count?** every change to the text counts the same, whether typed, pasted, cut, dropped, undone or autocorrected; an accent typed in two keystrokes counts once it is complete (you have seen this) {id: A-008}
- **What happens to the text on reload or on returning to the page?** the box always opens empty; the browser is told not to restore or remember the text (you have seen this) {id: A-009}
- **Which Spanish does the interface use?** neutral Latin American Spanish, the person addressed as tú, the document called "CV", the page declared as Spanish (you have seen this) {id: A-010}
- **Must the page work on a phone?** no requirement in this version: phone layout was struck by the owner (A-012); the plain page is left readable at phone width as a builder's matter, and nothing is graded against it (you have seen this) {id: A-011}

## Open questions

None.

## History: what changed after the final wording was agreed

Wording here may have been replaced since. Parts 2 to 6 show what holds now.

::: fold 2026-11-24 (test list sitting)

```vid-prd-answers
A-015 | human | 2026-11-24 | Q: Which browsers must the page support? | A: accepted as recommended: the current and previous major versions of Chrome, Edge, Firefox and Safari; on an older browser that lacks the counting feature the page shows no count rather than a wrong one | settles: OQ-1, CON-004
A-016 | human | 2026-11-24 | Q: Do invisible characters pasted from Word or PDF (zero-width space, soft hyphen, direction marks) count? | A: accepted as recommended: they count, one each, like every other character, because the site that receives the summary counts them too | settles: OQ-2, REQ-001
A-017 | human | 2026-11-24 | Q: Phone keyboards usually have no undo; keep the clear button as ruled? | A: accepted as recommended: keep it as ruled, one press with no question, undo wherever the keyboard has it | settles: OQ-3 | unchanged: REQ-003
A-018 | human | 2026-11-24 | Q: A strength reviewer says the census rules judge the file search by its exit code; keep the rules as written? | A: accepted as recommended: keep the rules as written; the census compares two lists of files and ignores the exit code, and the number beside each rule is its tier | settles: contract
A-019 | human | 2026-11-24 | Q: On an older browser that lacks the counting feature the page shows no count; should the over-limit message stay hidden there too? | A: yes: on such a browser the over-limit message stays hidden too, like the count; the message rule's first failure clause applies to the browsers the page supports (CON-004) | settles: REQ-002, CON-004
A-001 AMENDED | human | 2026-11-24 | Q: How does the count treat spaces, line breaks and special letters? | A: accepted as recommended: every character in the box counts as one, each one the person sees (spaces and line breaks included, an accented letter or an emoji counting as one however many parts it is built from), plus each invisible character standing on its own (a zero-width space, a soft hyphen, a direction mark); an invisible joiner or modifier attached to the letter or emoji before it is part of that character | settles: REQ-001, MECH-01 | unchanged: REQ-002
```

```vid-prd
REQ-001 AMENDED | functional | T1 | Below the text box the page shows how many characters the box holds out of the limit of 500, in the form A-007 states, updated on every change to the text whatever made it; an invisible character standing on its own (a zero-width space, a soft hyphen, a direction mark) counts as one like any other, and an invisible part of an emoji or an accented letter adds nothing to it; on an older browser that lacks the counting feature (CON-004) no count is shown. | fail-if: (1) after a change the shown count differs from the characters the person sees in the box, where each space, each line break, each accented letter and each emoji counts as one, an emoji built from several joined parts (a family, a skin tone, a flag) counting as one, and where each zero-width space, soft hyphen and direction mark standing on its own counts as one; (2) after text is pasted, cut, dropped or undone the count does not change until a further key is pressed; (3) the count shows characters remaining instead of characters used; (4) the count stops at 500 while the box holds more | serves: the person knows at every moment how long their summary is against the 500 they are allowed (G1) | authority: provisional | confirms_via: owner-decision/no | source: seed, A-001, A-007, A-008, A-016 | covers: DIM-char-count-rule, DIM-count-display | phase: pilot | feature: FEAT-01 | plain: Below the box the page shows how many characters you have written out of 500, counting each character you see, space, line break and lone invisible character as one. | arms: 1 strengthened, 2 retained, 3 retained, 4 retained
CON-004 | constraint | T1 | The page works in the current and previous major versions of Chrome, Edge, Firefox and Safari; on an older browser that lacks the counting feature it shows neither a count nor the over-limit message, rather than wrong ones. | authority: authoritative | source: A-015, A-019 | covers: DIM-count-display
REQ-002 AMENDED | functional | T1 | While the count the page shows is above 500 characters the message A-006 states is shown below the box, and while that count is 500 or fewer no such message is shown; nothing ever blocks or cuts what the person types or pastes; on an older browser that lacks the counting feature (CON-004) neither the count nor the message is shown. | fail-if: (1) on a browser the page supports, the box holds 501 characters and the over-limit message is not shown; (2) the over-limit message is shown while the box holds 500 characters or fewer; (3) the message is still shown after the text is brought back to 500 characters or fewer; (4) a key press, paste or drop that would take the text past 500 characters is refused, or the text is cut to 500; (5) the over-limit message is shown while the count the page shows is 500 or fewer, or is not shown while that count is above 500 | serves: the person learns the moment their summary no longer fits, without losing anything they wrote (G1) | authority: provisional | confirms_via: owner-decision/no | source: seed, A-001, A-003, A-006, A-019, thesis MECH-02 | covers: DIM-limit-boundary | phase: pilot | feature: FEAT-02 | plain: When your text passes 500 characters a message says so and disappears once you are back to 500 or fewer; typing is never blocked. | arms: 1 retained, 2 retained, 3 retained, 4 retained, 5 retained
```

RESOLVED: (OQ-1) A-015 — Which browsers must the page support? The counting rule relies on a browser feature that older versions lack (Firefox before version 125, for example).

RESOLVED: (OQ-2) A-016 — Do invisible characters that paste in from Word or PDF (zero-width space, soft hyphen, direction marks) count? The rule counts every character the person sees, and these show nothing.

RESOLVED: (OQ-3) A-017 — Phone keyboards usually have no undo, so undo after a mistaken clear does not reach most phone users. Keep the clear button as ruled (no confirmation, undo on keyboards), or change it?

:::


## When it was agreed

- 2026-11-24 — thesis+contract — 3a7c18d
- 2026-11-24 — gap answers — 8cb11f9
- 2026-11-24 — final — 6d33f71
