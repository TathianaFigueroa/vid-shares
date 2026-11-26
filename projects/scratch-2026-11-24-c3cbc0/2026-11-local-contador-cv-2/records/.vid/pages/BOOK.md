# Contador de caracteres para el resumen del CV: the product book

As of 2026-11-24 20:10 UTC


## The chapters

- [The idea](#chapter-1) — Written
- [The product](#chapter-2) — Written
- [The technical foundation](#chapter-3) — Written
- [The design](#chapter-4) — Not written yet
- [The tests](#chapter-5) — Written
- [The stages](#chapter-6) — Waiting on you
- [The plan](#chapter-7) — Not written yet
- [The findings](#chapter-8) — Written

{chapter: 1}
# Contador de caracteres para el resumen del CV: the idea


### 2026-11-24 — the owner's brief

Producto: Una sola página donde una persona escribe el resumen de su CV en un cuadro de texto y ve cuántos caracteres lleva, con un límite de 500.
Qué debe hacer:

1. Mostrar el número de caracteres escritos mientras la persona escribe.
2. Cuando el texto supera los 500 caracteres, mostrar un mensaje que lo indique. No definas el texto del mensaje; redáctalo tú.
3. Un botón para borrar todo el texto.

La interfaz está en español.
Fuera de esta versión: guardar el texto, cuentas, enviar o descargar el CV, corrector ortográfico, sugerencias de redacción, otros idiomas, analítica, diseño elaborado (una página limpia y legible basta). Nada se guarda sobre la persona.
Tamaño: es una primera versión. Escribe como máximo 3 requisitos y deja todo lo demás fuera de esta versión.

{chapter: 2}
# Contador de caracteres para el resumen del CV: the product

As of 2026-11-24 20:10 UTC

- `PRD.md`: not committed yet

Requirements: 3 · Features: 3 · Open questions: 0 · Answers of yours: 14 · Answers of ViD's: 6 · Findings: 50

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
- **Your answers changed two failure clauses: the counter's first clause now counts each invisible character standing on its own as one, and the message's first clause now applies only on the browsers the page supports. Accept both?** yes, both changes accepted as written {id: A-020}

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
A-020 | human | 2026-11-24 | Q: Your answers changed two failure clauses: the counter's first clause now counts each invisible character standing on its own as one, and the message's first clause now applies only on the browsers the page supports. Accept both? | A: yes, both changes accepted as written | settles: REQ-001, REQ-002
```

```vid-prd
REQ-001 AMENDED | functional | T1 | Below the text box the page shows how many characters the box holds out of the limit of 500, in the form A-007 states, updated on every change to the text whatever made it; an invisible character standing on its own (a zero-width space, a soft hyphen, a direction mark) counts as one like any other, and an invisible part of an emoji or an accented letter adds nothing to it; on an older browser that lacks the counting feature (CON-004) no count is shown. | fail-if: (1) after a change the shown count differs from the characters the person sees in the box, where each space, each line break, each accented letter and each emoji counts as one, an emoji built from several joined parts (a family, a skin tone, a flag) counting as one, and where each zero-width space, soft hyphen and direction mark standing on its own counts as one; (2) after text is pasted, cut, dropped or undone the count does not change until a further key is pressed; (3) the count shows characters remaining instead of characters used; (4) the count stops at 500 while the box holds more | serves: the person knows at every moment how long their summary is against the 500 they are allowed (G1) | authority: provisional | confirms_via: owner-decision/no | source: seed, A-001, A-007, A-008, A-016 | covers: DIM-char-count-rule, DIM-count-display | phase: pilot | feature: FEAT-01 | plain: Below the box the page shows how many characters you have written out of 500, counting each character you see, space, line break and lone invisible character as one. | arms: 1 strengthened, 2 retained, 3 retained, 4 retained
CON-004 | constraint | T1 | The page works in the current and previous major versions of Chrome, Edge, Firefox and Safari; on an older browser that lacks the counting feature it shows neither a count nor the over-limit message, rather than wrong ones. | authority: authoritative | source: A-015, A-019 | covers: DIM-count-display
REQ-002 AMENDED | functional | T1 | While the count the page shows is above 500 characters the message A-006 states is shown below the box, and while that count is 500 or fewer no such message is shown; nothing ever blocks or cuts what the person types or pastes; on an older browser that lacks the counting feature (CON-004) neither the count nor the message is shown. | fail-if: (1) on a browser the page supports, the box holds 501 characters and the over-limit message is not shown; (2) the over-limit message is shown while the box holds 500 characters or fewer; (3) the message is still shown after the text is brought back to 500 characters or fewer; (4) a key press, paste or drop that would take the text past 500 characters is refused, or the text is cut to 500; (5) the over-limit message is shown while the count the page shows is 500 or fewer, or is not shown while that count is above 500 | serves: the person learns the moment their summary no longer fits, without losing anything they wrote (G1) | authority: provisional | confirms_via: owner-decision/no | source: seed, A-001, A-003, A-006, A-019, thesis MECH-02 | covers: DIM-limit-boundary | phase: pilot | feature: FEAT-02 | plain: When your text passes 500 characters a message says so and disappears once you are back to 500 or fewer; typing is never blocked. | arms: 1 retained, 2 retained, 3 retained, 4 retained, 5 retained
```

```vid-prd-findings
F-44 | review | blocking | REQ-001 | repaired | evidence: round 1 — the first rewording let a joined emoji count as its parts; repaired at the owner's answer to keep an emoji one however built
F-45 | review | blocking | A-001, A-016 | repaired | evidence: round 1 — A-016 changed A-001's rule; A-001 restated with the owner's yes
F-46 | review | advisory | REQ-002, CON-004 | repaired | evidence: round 1 — whether the message shows on an older browser was undecided; the owner ruled it stays hidden (A-019)
F-47 | review | blocking | REQ-001 | accepted A-020 | evidence: arm 1 — round 2 — the arm now counts each invisible character standing on its own as one, where it used to fail a count differing from what the person sees; the owner accepted the change
F-48 | review | blocking | REQ-002 | accepted A-020 | evidence: arm 1 — round 2 — the arm now applies on the browsers the page supports only; the owner accepted the narrowing
F-49 | review | blocking | REQ-001, CON-004 | repaired | evidence: round 2 — REQ-001 now states no count is shown on an older browser, as CON-004 does
F-50 | review | blocking | REQ-001 | repaired | evidence: round 2 — the plain sentence said every invisible character counts; it now says a lone invisible character
```

RESOLVED: (OQ-1) A-015 — Which browsers must the page support? The counting rule relies on a browser feature that older versions lack (Firefox before version 125, for example).

RESOLVED: (OQ-2) A-016 — Do invisible characters that paste in from Word or PDF (zero-width space, soft hyphen, direction marks) count? The rule counts every character the person sees, and these show nothing.

RESOLVED: (OQ-3) A-017 — Phone keyboards usually have no undo, so undo after a mistaken clear does not reach most phone users. Keep the clear button as ruled (no confirmation, undo on keyboards), or change it?

review: delta, round 2, 7 findings

:::


## When it was agreed

- 2026-11-24 — thesis+contract — 3a7c18d
- 2026-11-24 — gap answers — 8cb11f9
- 2026-11-24 — final — 6d33f71
{chapter: 3}
# Contador de caracteres para el resumen del CV: the technical foundation

As of 2026-11-24 20:10 UTC

- `BASELINE.md`: not committed yet
- `ARCHITECTURE.md`: not committed yet
- `DECISIONS.md`: not committed yet

[[contents]]

## Contador de caracteres para el resumen del CV — BASELINE

One page: what the stack IS, what it is NOT, and the rows that must never break.

### Stack

| Layer | Choice | FORBIDDEN alternatives (named) |
|---|---|---|
| Page | One static HTML file, `site/index.html`, `lang="es"` | React, Vue, Angular, Svelte, Next.js, any single-page-app framework; server-rendered pages (PHP, Django, Express views) |
| Styles | One plain CSS file, `site/styles.css`, no preprocessor | Tailwind CSS, Bootstrap, Sass/SCSS, CSS-in-JS, web fonts or stylesheets loaded from another site |
| Behaviour | One plain JavaScript ES module, `site/main.js`, run in the browser | jQuery, TypeScript compile step, any bundler (webpack, Vite, Parcel), any npm runtime dependency shipped to the page |
| Character count | The browser's own `Intl.Segmenter` (grapheme clusters: what a person sees as one character) | `string.length` or code-point counts as the shown count, a third-party counting library |
| Data | None: the text lives only in the open page's memory | localStorage, sessionStorage, IndexedDB, cookies, any server or database |
| Outside services | None | analytics (Google Analytics, Tag Manager), error trackers (Sentry), CDNs for scripts or fonts |
| Hosting | Any free static host; the owner publishes by hand (ARCHITECTURE.md, "Where it runs") | a server process, serverless functions, a paid plan |

### Module seams & data ownership

The seam table lives in ARCHITECTURE.md. Ownership law: each table/data store
is written by exactly one module; everyone else goes through that module's
public surface. This product holds no data store at all.

### Tier-0 rows

| Rule | Meaning |
|---|---|
| CON-001 — the text never leaves the page | The text the person writes, and anything derived from it, is never sent over the network, never placed in the page's address, and never written to cookies or to any browser storage. A page load, typing, pasting and clearing produce no request carrying it. |

### Test environment

The ledger runs ONLY inside Docker: `sh checks/test.sh` → docker compose -f
docker-compose.test.yml. No test process ever receives real credentials.
The harness itself (a headless browser driving `site/index.html`) arrives
with the code skeleton.

### Owner hints (verbatim)

- Design: none given
- Architecture/stack: none given

### Machine blocks

Parsed by checks/conformance.sh at every commit. Extensions space- or
newline-separated. Forbidden terms one per line: dependency/import names that
must never appear in staged source additions — pick tokens that will not
legitimately occur in code or config otherwise.


::: fold For ViD's checks
```vid-allowed-extensions
.md .yml .yaml .sh .html .css .js .mjs .json .txt
```
:::



::: fold For ViD's checks
```vid-forbidden
react-dom
@angular/core
svelte
jquery
tailwindcss
bootstrap.min
@sentry
googletagmanager
google-analytics
fonts.googleapis
```
:::


## Contador de caracteres para el resumen del CV — ARCHITECTURE

The seam table. One row per module. Updated in the same commit as any seam
change (law in CLAUDE.md). This table is EXECUTED, not descriptive: it is the
import court's rule source (checks/imports.sh reads it at every commit). A
module with no row cannot be imported; a row that lies fails the build.

Import court: enforce

### Column contract (machine-read — keep the shapes exact)

- **Module** — the module's repo path (`apps/web`, `packages/core/alerts`);
  `/src/` segments in real file paths are collapsed when matching, so
  `packages/core/alerts` also owns `packages/core/src/alerts/`. Django-style
  dotted labels (`apps.public`) are accepted and read as paths.
- **Public surface** — leads with the module's import specifier(s) in
  backticks; prose may follow. Importing any path DEEPER than a declared
  specifier is a violation — declare an entry point per module, not one
  barrel for the world. A row with no backticked specifier can only be
  reached by its own files.
- **Dependents** — comma-separated Module paths that may import this module,
  or `all`, or `none`. Direction law is encoded here: app-layer rows say
  `none` (nothing imports the app), so core reaching into app is rejected as
  an undeclared dependent. Relative imports that cross module paths are
  always violations — enter a module through its specifier.

| Module | Responsibility | Owned tables/data | Public surface | Dependents |
|---|---|---|---|---|
| site | The one page: the text box, the live character count, the over-limit message and the clear button, in Spanish | none — the text lives only in the open page's memory | `site/index.html` — the page as a browser loads it; tests drive it only through what a person can see and do | tests/invariants |

Laws:

- A module without a row here should not be committed to — add the row in the
  same commit.
- Cross-module access goes through the public-surface column only; reaching
  into another module's tables or internals is a defect — and, since v0.6, a
  rejected commit.
- The dependents column is the blast-radius map: a fix in module X re-grades
  X plus its declared dependents, not the whole product (/vid fix law).

External boundaries: none. The page calls no outside service: no network
request, no analytics, no fonts or scripts from another site (BASELINE.md,
CON-001).

### Where it runs


- platform: static-host
- region: global
- staging: the platform's own
- production: the platform's own
- sending: none
- spend-cap: 0 a month
- access: none
- dns-access: none
- owner-only: choosing the static host, creating its account, and publishing the page to both addresses by hand
- providers: none


## Contador de caracteres para el resumen del CV — DECISIONS


::: fold For ViD's checks
Append-only, except labels and replaced-by marks. One line per decision.
Trigger (law in CLAUDE.md): the choice picked between plausible
alternatives, constrains future code, or would surprise a competent
newcomer. Entries without an `| enforced:` ref, or without a label, are
rejected at commit.

Format:

    - **D-NNN** <what> | why: <why> | enforced: <test/hook ref, or "convention"> | applies-to: <ids and codes> [| origin: proposal] [| model: <id>]
    - **D-NNN** <what> | why: <why> | enforced: <test/hook ref, or "convention"> | scope: project [| origin: proposal] [| model: <id>]

`why:` gives the reason in ViD's own words and cites the answer it rests
on (`A-NNN`), never the owner's words, which stay in the commit's `Owner:`
trailer.

`origin: proposal` marks defaults the model chose when the owner skipped a
hint or delegated the choice.

:::

### Log

- The page is plain HTML, CSS and JavaScript in three files under site/, with no framework, no build step and no runtime dependency; the named alternatives are forbidden in BASELINE.md — why: one static page with three behaviours and a three-requirement cap (seed, A-012); a framework or bundler adds machinery and supply-chain surface the page never uses, and the owner gave no stack hint (ViD's proposal) {id: D-001}
- The shown count is the number of grapheme clusters the browser's Intl.Segmenter finds in the box's text, so an emoji, an accented letter in one or two code points, a space and a line break (LF or CRLF) each count as one — why: A-001 counts every character the person sees as one; string length and code-point counts disagree with what is seen for emoji and composed accents {id: D-002}
- The over-limit message reads the same count the counter shows, computed once per change by one function, never a second count of its own — why: REQ-002 part (5) forbids a message that disagrees with the shown count (F-03) {id: D-003}
- The clear button clears the box through the browser's editing path (select all, then delete as an edit) so the browser's undo restores the text, never by assigning an empty value, which discards the undo history — why: A-014, REQ-003 part (5): undo right after clearing must bring the text back {id: D-004}
- The text box carries autocomplete="off", and the page empties the box on every pageshow event, so neither form restoration nor the back-forward cache brings text back — why: CON-002 and A-009: the box opens empty on every load and the browser is told not to restore it {id: D-005}
- The page is hosted on any free static host the owner chooses and publishes by hand; ViD holds no access and the spend cap is zero. Rejected: a server process, serverless functions and paid plans, which the page has no use for — why: the owner answered "none" for access and zero for the spend cap at init's technical sitting; the owner named no host, so the static-host choice is ViD's (ViD's proposal) {id: D-006}
- No release can need downtime: the product has no database and no stored data, so the downtime-tolerance question does not apply — why: CON-001 and NG-001: nothing is stored anywhere (ViD's proposal) {id: D-007}
- The page loads nothing from another site: no web fonts, no scripts, no images from a CDN; the system font stack is used — why: CON-001 forbids anything derived from the text leaving the page, and a page with no outside loads makes that promise checkable as "zero outside requests" {id: D-008}
- The build runs at most one test stack at a time (budget stacks=1) — why: ViD's default; one static page needs no parallel stacks (ViD's proposal) {id: D-009}
- The observer reports when free memory falls below 2048 MB (budget memory-headroom-mb=2048) — why: ViD's default headroom for a headless-browser test stack (ViD's proposal) {id: D-010}
- A build slice claims at most 60 rows (budget claims-per-slice=60) — why: ViD's default (ViD's proposal) {id: D-011}
- A build slice runs at most 8 wall-clock hours (budget wall-hours-per-slice=8) — why: ViD's default (ViD's proposal) {id: D-012}
- A court run may take at most 300 seconds (budget court-seconds=300) — why: ViD's default (ViD's proposal) {id: D-013}
- A builder or fixer is told once to finish when its context reaches 400000 tokens (budget builder-context-tokens=400000) — why: ViD's default (ViD's proposal) {id: D-014}
- The shown count is the number of grapheme clusters the browser's Intl.Segmenter finds in the box's text, corrected where the owner's rule differs: a combining mark, joiner, modifier or selector that follows a space, a tab, a line break or any other character that is not a letter or an emoji counts as one of its own; an invisible character standing on its own counts as one; on a browser without Intl.Segmenter neither a count nor the over-limit message is shown — why: A-001 as restated, A-016, A-019 and CON-004: grapheme clusters match the owner's rule except at those edges {id: D-015}

{chapter: 4}
# The design

Not written yet: it comes at the design.
{chapter: 5}
# Contador de caracteres para el resumen del CV: the tests

As of 2026-11-24 20:10 UTC

- `INVENTORY.md`: not committed yet
- `GRADING-CHECKLIST.md`: not committed yet
- `PRD.md`: not committed yet

This list has 63 tests. You are asked to approve it, not to read every line.

Behaviours: 48 · Screens as drawn: 0 · Journeys: 1 · The parts on every page: 1 · Ways to reach a screen: 1 · Rules: 9 · Attacks tried: 3 · Outside services: 0

[[contents]]

## Look here first

Nothing here waits on you.

## Ways the product could be wrong

- a message toggled on key release shows at 501 typed, but a paste, drop or undo to above 500 showed none until a key; ROW-035 now covers every way upward, at once — the tests it is about: [With exactly 500 characters in the box no over-limit message is shown, and with 501 the message is shown and stays shown while the text stays above 500 — still after ten seconds with no input, and still after typing on to 600.](#row-005), [However often the text crosses 500 upward — by typing, pasting, dropping, after deleting, after clear and undo — exactly one over-limit message is shown each time, at once, with no further key pressed, and it goes at once when the text comes back to 500 or fewer by any of those ways, never stacked copies.](#row-035) — Repaired
- a transient toast passes "shown at 501"; ROW-005 now requires the message to stay while the text stays above 500 — the tests it is about: [With exactly 500 characters in the box no over-limit message is shown, and with 501 the message is shown and stays shown while the text stays above 500 — still after ten seconds with no input, and still after typing on to 600.](#row-005), [However often the text crosses 500 upward — by typing, pasting, dropping, after deleting, after clear and undo — exactly one over-limit message is shown each time, at once, with no further key pressed, and it goes at once when the text comes back to 500 or fewer by any of those ways, never stacked copies.](#row-035) — Repaired
- test text of single-code-point emoji and precomposed accents gives equal counts under both rules; ROW-008 now pins multi-code-point emoji and a combining accent — the test it is about: [For text near the limit whose code units, code points and visible characters all differ — holding at least one emoji made of a surrogate pair, one emoji made of several code points (a skin-tone modifier or a joined sequence) and one letter with a combining accent — the over-limit message is shown exactly when the shown count is above 500 and hidden exactly when it is 500 or fewer.](#row-008) — Repaired
- over-limit styling never removed after coming back down; ROW-036 now checks after coming down — the test it is about: [At exactly 500 characters none of the over-limit styling the page uses at 501 (a colour, a mark on the box or the count) is present, and at 501 it is; and after coming back down from 501 — by deleting, and by clearing then typing again — it is gone at 500 and below.](#row-036) — Repaired
- the caret could jump only above 500; ROW-021 now checks above 500 too — the test it is about: [The page never changes what the person entered: double and trailing spaces, accents typed in two parts and every other character stay exactly as entered, and a character typed mid-text leaves the caret right after it, both below 500 characters and above it (for example at 520, typing at position 100).](#row-021) — Repaired
- a debounced count passes retrying checks; "at once" now means one read without retry and a second after one quiet second — the tests it is about: [After text is pasted, cut, dropped or undone, the shown count reflects the new text at once, with no further key pressed; "at once" means read once, with no retrying, before the next screen update after the edit, and read again after one second with no input.](#row-002), [After text arrives with no key press, the shown count reflects the new text at once, each edit made as the browser itself makes that kind of edit, never by setting the box's value: in Chromium, an input-method commit and an emoji insert through the browser's own input-method and text-insertion path, a replacement (as autocorrect and a predictive suggestion make) as an insert-text command over a selected word, a redo through the browser's redo command, and a drag inside and a drag out of the box as real drags; dictation is not driven by the harness and is left to the real-device check; "at once" means read once, with no retrying, before the next screen update after the edit, and read again after one second with no input.](#row-019), [Typing or pasting followed at once, with no wait, by clear, undo or redo — and a quick burst of these — leaves the count and the message matching the box's final text, read once with no retrying right after the last action and again after one second with no input.](#row-048) — Repaired
- a count that skips composing input with no end-of-composition recount; ROW-020 now names the sequence and drives real composition in Chromium — the test it is about: [During and after composition — an accent typed with a dead key (´ then e), and a word still being composed as phone keyboards do — the count equals the characters shown, a finished accented letter counting once, and it is never left one step behind once composition ends, including when the composition's last input event is still marked as composing and no input event follows its end; driven as a real composition in Chromium.](#row-020) — Repaired
- a handler filtering on the kind of edit passes value-setting tests; edits are now made as the browser makes them — the tests it is about: [After text arrives with no key press, the shown count reflects the new text at once, each edit made as the browser itself makes that kind of edit, never by setting the box's value: in Chromium, an input-method commit and an emoji insert through the browser's own input-method and text-insertion path, a replacement (as autocorrect and a predictive suggestion make) as an insert-text command over a selected word, a redo through the browser's redo command, and a drag inside and a drag out of the box as real drags; dictation is not driven by the harness and is left to the real-device check; "at once" means read once, with no retrying, before the next screen update after the edit, and read again after one second with no input.](#row-019), [After the person's own deletions and replacements — deleting a word, deleting to the start of the line, the forward Delete key, deleting a selection, typing or pasting over a selection, choosing a spelling suggestion — each made as the browser itself makes that kind of edit, never by setting the box's value, the count equals the characters in the box.](#row-046) — Repaired
- a code-point fallback passes a plain-letter test; ROW-042 now removes the facility before the script and enters a combining accent and a joined emoji — the test it is about: [With the browser's grapheme-counting facility removed before the page's script runs, or the count failing at runtime, typing never leaves "0 / 500" or the last value beside text that has changed: run on the sampled and generated strings of ROW-001 (flags, skin tones, keycaps, variation selectors, combining accents), every shown count equals the pinned expected count, or the page shows no reading at all, and then no over-limit message either.](#row-042) — Repaired
- rows left out of the three-engine run; ROW-002, ROW-024, ROW-043, ROW-046 and ROW-048 added — the test it is about: [The obligations of ROW-001, ROW-002, ROW-008, ROW-011, ROW-014, ROW-024, ROW-032, ROW-033, ROW-043, ROW-046 and ROW-048 hold alike in the Chromium, Firefox and WebKit browser engines; of ROW-019, the drags and the replacement run in all three engines, while the input-method commit and the emoji insert run in Chromium only, and the rest is left to the real-device check of the grading checklist.](#row-023) — Repaired
- expected counts taken from the engine's own segmenter agree by construction; they now come from Unicode's published grapheme-break data, pinned — the test it is about: [After any change, the shown count equals the number of characters in the box, where each space, each line break, each accented letter (typed as one code point or as a letter plus a combining accent) and each emoji (however many joined parts it is built from, flags and skin tones included) counts as one, each invisible character standing on its own (a zero-width space, a soft hyphen, a direction mark) counts as one, and an invisible joiner or modifier attached to the letter or emoji before it is part of that character, and leading or trailing spaces, a trailing line break, tabs, no-break spaces and a box of only spaces count in full; the rule is checked on independently sampled and generated strings (for example the Unicode grapheme-break test sequences, emoji with skin tones, variation selectors and keycaps), never only on named examples, and the expected counts come from Unicode's published grapheme-break test data for a pinned Unicode version, never from the browser under test, corrected by the owner's rule where the two differ: a combining mark, joiner, modifier or selector that follows a space, a tab, a line break or any other character that is not a letter or an emoji counts as one of its own, as does a prepended mark (sampled cases include a space then a lone skin-tone swatch, a space then a joiner, and a space then a combining accent, each counting 3 with a letter before them).](#row-001) — Repaired
- invisible characters were undecided between "what the person sees" and grapheme clusters; the owner ruled they count (A-016), REQ-001 amended and ROW-001 rewritten — what it is about: [After any change, the shown count equals the number of characters in the box, where each space, each line break, each accented letter (typed as one code point or as a letter plus a combining accent) and each emoji (however many joined parts it is built from, flags and skin tones included) counts as one, each invisible character standing on its own (a zero-width space, a soft hyphen, a direction mark) counts as one, and an invisible joiner or modifier attached to the letter or emoji before it is part of that character, and leading or trailing spaces, a trailing line break, tabs, no-break spaces and a box of only spaces count in full; the rule is checked on independently sampled and generated strings (for example the Unicode grapheme-break test sequences, emoji with skin tones, variation selectors and keycaps), never only on named examples, and the expected counts come from Unicode's published grapheme-break test data for a pinned Unicode version, never from the browser under test, corrected by the owner's rule where the two differ: a combining mark, joiner, modifier or selector that follows a space, a tab, a line break or any other character that is not a letter or an emoji counts as one of its own, as does a prepended mark (sampled cases include a space then a lone skin-tone swatch, a space then a joiner, and a space then a combining accent, each counting 3 with a letter before them).](#row-001), a part of the PRD {id: REQ-001}, a part of the PRD {id: A-001} — Repaired
- the word list held unescaped parentheses and did not compile; escaped, and every rule's pattern checked on a planted folder — the test it is about: [No file the page ships contains a way to send or store data: no network call, no storage write, no cookie, no change to the page's address or title, no clipboard write](#rule-001) — Repaired
- the probes showed failure with the line inserted but never a pass without it; both now pass with the line removed — the tests it is about: [With one line added to the page's script that sends the box's text to the harness's listening host by a path the rule's word list does not name (a request function reached through a computed property name, for example window['fe'+'tch']), in one session type a summary, paste text, go past 500, press clear, stay idle 30 seconds, then hide the page and close it; recorded at the browser's network exit outside the page from the start of load, expect no request to any host other than the page's own address at any moment, no request to the page's own address after load, and every storage the page can reach still empty at the end; with the line removed the same probe passes](#hos-001), [With a link to another site's address added to the page (a preconnect to the harness's outside host), load the page and expect the outside host, counting accepted connections at its socket, to receive none; with the link removed the same probe passes, and a control load with the guard off shows the browser does open the connection](#hos-002) — Repaired
- headless Chromium does not restore a textarea on reload and a harness back navigation may skip the back-forward cache; ROW-014 now requires a cache restore and autocomplete="off" — the test it is about: [After text is typed, a reload, and separately a navigation away and back that the browser serves from its back-forward cache (the page reports it was restored from that cache), both show an empty box with the count "0 / 500" and no message; and the text box tells the browser not to remember its content (autocomplete="off").](#row-014) — Repaired
- a short banned-word list passes other usted forms and catches "su" inside "supera"; ROW-015 now compares the full set of strings, whole words — the test it is about: [The page declares Spanish as its language; the full set of words it shows or ships for people to read — the title, labels, placeholder, button text, tooltips and accessible names — equals an expected list written in Spanish addressing the person as tú, with no whole word in usted (for example "su", "usted", "ingrese", "introduzca", "pegue", "escriba", "borre", "limpie") and the document called "CV" (never "currículum" or "hoja de vida"); and the over-limit message reads exactly "Tu resumen supera los 500 caracteres. Acórtalo para que quepa."](#row-015) — Repaired
- headless Chromium guesses UTF-8; ROW-022 now also checks the declared charset in the first 1024 bytes — the test it is about: [Served with no charset in its Content-Type, the page still shows every accented letter of its labels and of the over-limit message correctly, and index.html declares UTF-8 within its first 1024 bytes.](#row-022) — Repaired
- window.name and history state unchecked, and requests at close unseen by the page; both added — the tests it is about: [While the page loads and while the person types, pastes and clears, the page makes no network request other than loading its own shipped site/ files, sets no cookie, writes nothing to localStorage, sessionStorage, IndexedDB, the Cookie Store or the origin-private file system, leaves window.name empty and the history entry's state empty, leaves the page's address unchanged, and leaves the page's title as it was at load (no text or count in the tab title or history).](#row-012), [With text in the box, switching to another tab, staying idle 60 seconds, navigating away and closing the tab make no network request to any host — every request the browser attempts is observed, with all of the browser's traffic routed to the harness's own listening host outside the page — set no cookie and write no storage of any kind.](#row-051) — Repaired
- a preconnect sends no request the browser logs; HOS-002 now counts connections at the outside host's socket — the test it is about: [With a link to another site's address added to the page (a preconnect to the harness's outside host), load the page and expect the outside host, counting accepted connections at its socket, to receive none; with the link removed the same probe passes, and a control load with the guard off shows the browser does open the connection](#hos-002) — Repaired
- literal extension lists and missing call names; both scan every shipped file and RULE-001 adds setAttribute, url( and Worker — the tests it is about: [No file the page ships contains a way to send or store data: no network call, no storage write, no cookie, no change to the page's address or title, no clipboard write](#rule-001), [No file the page ships names another site: no absolute (http:, https:) or protocol-relative (//) address in any attribute, stylesheet or script, so nothing preconnects, prefetches or imports from elsewhere (a code comment is written with a space after //)](#rule-005) — Repaired
- "its own three files" against a shipped icon file; ROW-012 now allows the shipped site/ files and ROW-045 names an empty inline icon — the tests it is about: [While the page loads and while the person types, pastes and clears, the page makes no network request other than loading its own shipped site/ files, sets no cookie, writes nothing to localStorage, sessionStorage, IndexedDB, the Cookie Store or the origin-private file system, leaves window.name empty and the history entry's state empty, leaves the page's address unchanged, and leaves the page's title as it was at load (no text or count in the tab title or history).](#row-012), [The page declares its own icon as an empty inline icon (data:,), so on load, and when served from a subfolder, the browser requests nothing outside the page's own files and nothing from the host's root.](#row-045) — Repaired
- an inline SVG icon's namespace address matches RULE-005; the icon is now data:, and comments are written with a space after // — the tests it is about: [No file the page ships names another site: no absolute (http:, https:) or protocol-relative (//) address in any attribute, stylesheet or script, so nothing preconnects, prefetches or imports from elsewhere (a code comment is written with a space after //)](#rule-005), [The page declares its own icon as an empty inline icon (data:,), so on load, and when served from a subfolder, the browser requests nothing outside the page's own files and nothing from the host's root.](#row-045) — Repaired
- the phone pattern matched SVG path data and dates; reworked, the icon has no path data — the tests it is about: [No file the page ships carries a real person's contact details: no email address and no phone number in the page, its placeholder, its comments or anything else published; a run of seven or more digits, however spaced, dotted, hyphenated or bracketed, counts as a phone number, so no shipped file holds one](#rule-008), [The page declares its own icon as an empty inline icon (data:,), so on load, and when served from a subfolder, the browser requests nothing outside the page's own files and nothing from the host's root.](#row-045) — Repaired
- the rule's words forbade the load and page-shown recount the rows need; RULE-002 reworded to what its census holds — the tests it is about: [No key, keypress or change listener decides the count: the count follows the text box's input event, the clear action, and a recount at load and when the page is shown again](#rule-002), [Whatever the box holds after a load, a reload or a back navigation, the count and the message agree with it at once, never a stale "0 / 500" beside restored text.](#row-024), [Text typed or pasted into the box while the page's script is still loading is still there once it runs, and the count and the message agree with it at once.](#row-043) — Repaired
- Cmd+Z, menu undo and non-Chromium composition cannot be driven in the Linux harness; rows narrowed to what it drives, the rest a real-device checklist line — the tests it is about: [The obligations of ROW-001, ROW-002, ROW-008, ROW-011, ROW-014, ROW-024, ROW-032, ROW-033, ROW-043, ROW-046 and ROW-048 hold alike in the Chromium, Firefox and WebKit browser engines; of ROW-019, the drags and the replacement run in all three engines, while the input-method commit and the emoji insert run in Chromium only, and the rest is left to the real-device check of the grading checklist.](#row-023), [During and after composition — an accent typed with a dead key (´ then e), and a word still being composed as phone keyboards do — the count equals the characters shown, a finished accented letter counting once, and it is never left one step behind once composition ends, including when the composition's last input event is still marked as composing and no input event follows its end; driven as a real composition in Chromium.](#row-020), [After undo has brought cleared text back, the browser's own undo command (the edit menu's Undo as the browser runs it, not a key the page listens for) restores it too, a redo then empties the box again, and further undos step back through earlier edits without ever doubling the text.](#row-032) — Repaired
- repeat; ROW-032 now holds only what ROW-011 does not — the tests it is about: [Undo pressed right after clearing brings back the exact text that was cleared, and the count and the message follow it.](#row-011), [After undo has brought cleared text back, the browser's own undo command (the edit menu's Undo as the browser runs it, not a key the page listens for) restores it too, a redo then empties the box again, and further undos step back through earlier edits without ever doubling the text.](#row-032) — Repaired
- repeated thousands-separator clause; kept in ROW-004 only — the tests it is about: [The count shows characters used against the limit, in the form "<used> / 500" (for example "123 / 500"), never characters remaining.](#row-003), [With more than 500 characters in the box, the count shows the real number (for example "523 / 500"), never stopping at 500 and with no thousands separator.](#row-004) — Repaired
- round 2 — setAttribute had joined the word list, so HOS-001's planted path was no longer unnamed; it now uses a computed property name — the tests it is about: [With one line added to the page's script that sends the box's text to the harness's listening host by a path the rule's word list does not name (a request function reached through a computed property name, for example window['fe'+'tch']), in one session type a summary, paste text, go past 500, press clear, stay idle 30 seconds, then hide the page and close it; recorded at the browser's network exit outside the page from the start of load, expect no request to any host other than the page's own address at any moment, no request to the page's own address after load, and every storage the page can reach still empty at the end; with the line removed the same probe passes](#hos-001), [No file the page ships contains a way to send or store data: no network call, no storage write, no cookie, no change to the page's address or title, no clipboard write](#rule-001) — Repaired
- round 2 — observing only the listening host misses a beacon to another host on close; every request the browser attempts is now observed — the test it is about: [With text in the box, switching to another tab, staying idle 60 seconds, navigating away and closing the tab make no network request to any host — every request the browser attempts is observed, with all of the browser's traffic routed to the harness's own listening host outside the page — set no cookie and write no storage of any kind.](#row-051) — Repaired
- round 2 — common phone formats passed; any run of seven or more digits now counts — the test it is about: [No file the page ships carries a real person's contact details: no email address and no phone number in the page, its placeholder, its comments or anything else published; a run of seven or more digits, however spaced, dotted, hyphenated or bracketed, counts as a phone number, so no shipped file holds one](#rule-008) — Repaired
- round 2 — edits the harness cannot make natively; ROW-019 now names how each is driven, and RULE-009 forbids a count that reads the kind of edit — the tests it is about: [After text arrives with no key press, the shown count reflects the new text at once, each edit made as the browser itself makes that kind of edit, never by setting the box's value: in Chromium, an input-method commit and an emoji insert through the browser's own input-method and text-insertion path, a replacement (as autocorrect and a predictive suggestion make) as an insert-text command over a selected word, a redo through the browser's redo command, and a drag inside and a drag out of the box as real drags; dictation is not driven by the harness and is left to the real-device check; "at once" means read once, with no retrying, before the next screen update after the edit, and read again after one second with no input.](#row-019), [The obligations of ROW-001, ROW-002, ROW-008, ROW-011, ROW-014, ROW-024, ROW-032, ROW-033, ROW-043, ROW-046 and ROW-048 hold alike in the Chromium, Firefox and WebKit browser engines; of ROW-019, the drags and the replacement run in all three engines, while the input-method commit and the emoji insert run in Chromium only, and the rest is left to the real-device check of the grading checklist.](#row-023) — Repaired
- round 3 — no probe shows the census itself catching a plain call; HOS-003 added at the owner's ruling — the tests it is about: [With one line added to the page's script that sends the box's text to the harness's listening host by a path the rule's word list does not name (a request function reached through a computed property name, for example window['fe'+'tch']), in one session type a summary, paste text, go past 500, press clear, stay idle 30 seconds, then hide the page and close it; recorded at the browser's network exit outside the page from the start of load, expect no request to any host other than the page's own address at any moment, no request to the page's own address after load, and every storage the page can reach still empty at the end; with the line removed the same probe passes](#hos-001), [No file the page ships contains a way to send or store data: no network call, no storage write, no cookie, no change to the page's address or title, no clipboard write](#rule-001) — Repaired
- round 3 — ROW-023 required ROW-019 in three engines with no stated path; narrowed at the owner's ruling — the tests it is about: [After text arrives with no key press, the shown count reflects the new text at once, each edit made as the browser itself makes that kind of edit, never by setting the box's value: in Chromium, an input-method commit and an emoji insert through the browser's own input-method and text-insertion path, a replacement (as autocorrect and a predictive suggestion make) as an insert-text command over a selected word, a redo through the browser's redo command, and a drag inside and a drag out of the box as real drags; dictation is not driven by the harness and is left to the real-device check; "at once" means read once, with no retrying, before the next screen update after the edit, and read again after one second with no input.](#row-019), [The obligations of ROW-001, ROW-002, ROW-008, ROW-011, ROW-014, ROW-024, ROW-032, ROW-033, ROW-043, ROW-046 and ROW-048 hold alike in the Chromium, Firefox and WebKit browser engines; of ROW-019, the drags and the replacement run in all three engines, while the input-method commit and the emoji insert run in Chromium only, and the rest is left to the real-device check of the grading checklist.](#row-023) — Repaired
- after the owner's rulings — the probe watched only the listening host; it now watches every request after load and reads storage — the test it is about: [With one line added to the page's script that sends the box's text to the harness's listening host by a path the rule's word list does not name (a request function reached through a computed property name, for example window['fe'+'tch']), in one session type a summary, paste text, go past 500, press clear, stay idle 30 seconds, then hide the page and close it; recorded at the browser's network exit outside the page from the start of load, expect no request to any host other than the page's own address at any moment, no request to the page's own address after load, and every storage the page can reach still empty at the end; with the line removed the same probe passes](#hos-001) — Repaired
- after the owner's rulings — one named pair let a hand-written fallback pass; the row now runs ROW-001's sampled strings with the facility removed — the test it is about: [With the browser's grapheme-counting facility removed before the page's script runs, or the count failing at runtime, typing never leaves "0 / 500" or the last value beside text that has changed: run on the sampled and generated strings of ROW-001 (flags, skin tones, keycaps, variation selectors, combining accents), every shown count equals the pinned expected count, or the page shows no reading at all, and then no over-limit message either.](#row-042) — Repaired
- after the owner's rulings — joiners attached to a character against "each invisible character counts"; settled by the owner's answers on joined emoji (A-001 restated) and ROW-001 rewritten — what it is about: [After any change, the shown count equals the number of characters in the box, where each space, each line break, each accented letter (typed as one code point or as a letter plus a combining accent) and each emoji (however many joined parts it is built from, flags and skin tones included) counts as one, each invisible character standing on its own (a zero-width space, a soft hyphen, a direction mark) counts as one, and an invisible joiner or modifier attached to the letter or emoji before it is part of that character, and leading or trailing spaces, a trailing line break, tabs, no-break spaces and a box of only spaces count in full; the rule is checked on independently sampled and generated strings (for example the Unicode grapheme-break test sequences, emoji with skin tones, variation selectors and keycaps), never only on named examples, and the expected counts come from Unicode's published grapheme-break test data for a pinned Unicode version, never from the browser under test, corrected by the owner's rule where the two differ: a combining mark, joiner, modifier or selector that follows a space, a tab, a line break or any other character that is not a letter or an emoji counts as one of its own, as does a prepended mark (sampled cases include a space then a lone skin-tone swatch, a space then a joiner, and a space then a combining accent, each counting 3 with a letter before them).](#row-001), a part of the PRD {id: REQ-001}, a part of the PRD {id: A-016} — Repaired
- Unicode's grapheme data glues a mark to a preceding space, the owner's rule does not; ROW-001 now states the owner's correction with sampled cases — what it is about: [After any change, the shown count equals the number of characters in the box, where each space, each line break, each accented letter (typed as one code point or as a letter plus a combining accent) and each emoji (however many joined parts it is built from, flags and skin tones included) counts as one, each invisible character standing on its own (a zero-width space, a soft hyphen, a direction mark) counts as one, and an invisible joiner or modifier attached to the letter or emoji before it is part of that character, and leading or trailing spaces, a trailing line break, tabs, no-break spaces and a box of only spaces count in full; the rule is checked on independently sampled and generated strings (for example the Unicode grapheme-break test sequences, emoji with skin tones, variation selectors and keycaps), never only on named examples, and the expected counts come from Unicode's published grapheme-break test data for a pinned Unicode version, never from the browser under test, corrected by the owner's rule where the two differ: a combining mark, joiner, modifier or selector that follows a space, a tab, a line break or any other character that is not a letter or an emoji counts as one of its own, as does a prepended mark (sampled cases include a space then a lone skin-tone swatch, a space then a joiner, and a space then a combining accent, each counting 3 with a letter before them).](#row-001), a part of the PRD {id: REQ-001}, a part of the PRD {id: A-001} — Repaired
- the probe covered typing only; it now covers a whole session from load to close, recorded at the network exit — the test it is about: [With one line added to the page's script that sends the box's text to the harness's listening host by a path the rule's word list does not name (a request function reached through a computed property name, for example window['fe'+'tch']), in one session type a summary, paste text, go past 500, press clear, stay idle 30 seconds, then hide the page and close it; recorded at the browser's network exit outside the page from the start of load, expect no request to any host other than the page's own address at any moment, no request to the page's own address after load, and every storage the page can reach still empty at the end; with the line removed the same probe passes](#hos-001) — Repaired
- critical — the reviewers read the fifth field as an expected exit code of grep -L; ViD's belief rests on checks/census.sh lines 12-15 and 412-420 (orphans are the left list minus the right list; the exit code is not read) and the template's rule grammar (the fifth field is the tier); the owner kept the rules as written — the tests it is about: [No file the page ships contains a way to send or store data: no network call, no storage write, no cookie, no change to the page's address or title, no clipboard write](#rule-001), [No key, keypress or change listener decides the count: the count follows the text box's input event, the clear action, and a recount at load and when the page is shown again](#rule-002), [No file the page ships writes HTML from strings or runs strings as code](#rule-003), [No file the page ships names another site: no absolute (http:, https:) or protocol-relative (//) address in any attribute, stylesheet or script, so nothing preconnects, prefetches or imports from elsewhere (a code comment is written with a space after //)](#rule-005), [The text box is the browser's own plain-text field: no file the page ships makes an element editable as rich content](#rule-007), [No file the page ships carries a real person's contact details: no email address and no phone number in the page, its placeholder, its comments or anything else published; a run of seven or more digits, however spaced, dotted, hyphenated or bracketed, counts as a phone number, so no shipped file holds one](#rule-008) — Your ruling

## By feature

::: fold The character counter — 21 tests

{at: row-001}
**After any change, the shown count equals the number of characters in the box, where each space, each line break, each accented letter (typed as one code point or as a letter plus a combining accent) and each emoji (however many joined parts it is built from, flags and skin tones included) counts as one, each invisible character standing on its own (a zero-width space, a soft hyphen, a direction mark) counts as one, and an invisible joiner or modifier attached to the letter or emoji before it is part of that character, and leading or trailing spaces, a trailing line break, tabs, no-break spaces and a box of only spaces count in full; the rule is checked on independently sampled and generated strings (for example the Unicode grapheme-break test sequences, emoji with skin tones, variation selectors and keycaps), never only on named examples, and the expected counts come from Unicode's published grapheme-break test data for a pinned Unicode version, never from the browser under test, corrected by the owner's rule where the two differ: a combining mark, joiner, modifier or selector that follows a space, a tab, a line break or any other character that is not a letter or an emoji counts as one of its own, as does a prepended mark (sampled cases include a space then a lone skin-tone swatch, a space then a joiner, and a space then a combining accent, each counting 3 with a letter before them).** {id: ROW-001}

Kind: a behaviour

Not tested yet: spec-only — first stage

{at: row-002}
**After text is pasted, cut, dropped or undone, the shown count reflects the new text at once, with no further key pressed; "at once" means read once, with no retrying, before the next screen update after the edit, and read again after one second with no input.** {id: ROW-002}

Kind: a behaviour

Not tested yet: spec-only — first stage

{at: row-003}
**The count shows characters used against the limit, in the form "<used> / 500" (for example "123 / 500"), never characters remaining.** {id: ROW-003}

Kind: a behaviour

Not tested yet: spec-only — first stage

{at: row-004}
**With more than 500 characters in the box, the count shows the real number (for example "523 / 500"), never stopping at 500 and with no thousands separator.** {id: ROW-004}

Kind: a behaviour

Not tested yet: spec-only — first stage

{at: row-016}
**The page loads at its address with a Spanish title, one labelled text box, the count "0 / 500", the clear button and no over-limit message, no console error, and no control beyond these.** {id: ROW-016}

Kind: the parts on every page

Not tested yet: spec-only — first stage

{at: row-017}
**The page is reached from its entry address and from /index.html, and every link on it, if any, resolves.** {id: ROW-017}

Kind: a way to reach a screen

Not tested yet: spec-only — first stage

{at: row-018}
**The person writing their CV summary arrives with a summary to fit (off_screen), writes it, trims it under the limit, may clear and undo, and leaves with nothing kept (off_screen). transitions: (1) person at the empty page · the text box · types or pastes a draft · the box holds the text · the count shows its length out of 500; (2) person at a text of 500 or fewer · the text box · keeps typing past 500 · over the limit · the over-limit message appears and nothing typed is refused; (3) person over the limit · the text box · deletes text down to 500 or fewer · within the limit · the message disappears and the count follows; (4) person at any text · the clear button · presses it · an empty box · the count shows "0 / 500" and no message; (5) person at a just-cleared box · undo (Ctrl+Z) · presses undo · the text is back · the count shows the restored text's length** {id: ROW-018}

Kind: a journey

Not tested yet: spec-only — first stage

{at: row-019}
**After text arrives with no key press, the shown count reflects the new text at once, each edit made as the browser itself makes that kind of edit, never by setting the box's value: in Chromium, an input-method commit and an emoji insert through the browser's own input-method and text-insertion path, a replacement (as autocorrect and a predictive suggestion make) as an insert-text command over a selected word, a redo through the browser's redo command, and a drag inside and a drag out of the box as real drags; dictation is not driven by the harness and is left to the real-device check; "at once" means read once, with no retrying, before the next screen update after the edit, and read again after one second with no input.** {id: ROW-019}

Kind: a behaviour

Not tested yet: spec-only — first stage

{at: row-020}
**During and after composition — an accent typed with a dead key (´ then e), and a word still being composed as phone keyboards do — the count equals the characters shown, a finished accented letter counting once, and it is never left one step behind once composition ends, including when the composition's last input event is still marked as composing and no input event follows its end; driven as a real composition in Chromium.** {id: ROW-020}

Kind: a behaviour

Not tested yet: spec-only — first stage

{at: row-023}
**The obligations of ROW-001, ROW-002, ROW-008, ROW-011, ROW-014, ROW-024, ROW-032, ROW-033, ROW-043, ROW-046 and ROW-048 hold alike in the Chromium, Firefox and WebKit browser engines; of ROW-019, the drags and the replacement run in all three engines, while the input-method commit and the emoji insert run in Chromium only, and the rest is left to the real-device check of the grading checklist.** {id: ROW-023}

Kind: a behaviour

Not tested yet: spec-only — first stage

{at: row-024}
**Whatever the box holds after a load, a reload or a back navigation, the count and the message agree with it at once, never a stale "0 / 500" beside restored text.** {id: ROW-024}

Kind: a behaviour

Not tested yet: spec-only — first stage

{at: row-025}
**With the page's script blocked from running, the page shows no count that looks like a reading, so no "0 / 500" stays on screen while typing changes nothing, and no over-limit message is visible.** {id: ROW-025}

Kind: a behaviour

Not tested yet: spec-only — first stage

{at: row-028}
**Pasting or dropping formatted content (HTML holding a remote image, bold text and a list) puts plain text only into the box, loads nothing from any other address, and counts each line break once.** {id: ROW-028}

Kind: a behaviour

Not tested yet: spec-only — first stage

{at: row-029}
**control of ROW-028: pasting plain text of several lines keeps every line break, and the count includes each as one.** {id: ROW-029}

Kind: a behaviour

Not tested yet: spec-only — first stage

{at: row-038}
**Resizing the window or rotating between portrait and landscape, with text past 500 in the box, leaves the text, the count and the single message unchanged.** {id: ROW-038}

Kind: a behaviour

Not tested yet: spec-only — first stage

{at: row-042}
**With the browser's grapheme-counting facility removed before the page's script runs, or the count failing at runtime, typing never leaves "0 / 500" or the last value beside text that has changed: run on the sampled and generated strings of ROW-001 (flags, skin tones, keycaps, variation selectors, combining accents), every shown count equals the pinned expected count, or the page shows no reading at all, and then no over-limit message either.** {id: ROW-042}

Kind: a behaviour

Not tested yet: spec-only — first stage

{at: row-043}
**Text typed or pasted into the box while the page's script is still loading is still there once it runs, and the count and the message agree with it at once.** {id: ROW-043}

Kind: a behaviour

Not tested yet: spec-only — first stage

{at: row-044}
**Across the journey's steps and pastes of unusual but legal text (a lone surrogate, a null character, right-to-left text and direction marks, a block of 2,000 characters) no uncaught error is logged and the count keeps following the box.** {id: ROW-044}

Kind: a behaviour

Not tested yet: spec-only — first stage

{at: row-046}
**After the person's own deletions and replacements — deleting a word, deleting to the start of the line, the forward Delete key, deleting a selection, typing or pasting over a selection, choosing a spelling suggestion — each made as the browser itself makes that kind of edit, never by setting the box's value, the count equals the characters in the box.** {id: ROW-046}

Kind: a behaviour

Not tested yet: spec-only — first stage

{at: row-047}
**A box the person empties by their own editing (select all then delete, deleting back to the start, cutting everything) shows "0 / 500" in every engine.** {id: ROW-047}

Kind: a behaviour

Not tested yet: spec-only — first stage

{at: row-048}
**Typing or pasting followed at once, with no wait, by clear, undo or redo — and a quick burst of these — leaves the count and the message matching the box's final text, read once with no retrying right after the last action and again after one second with no input.** {id: ROW-048}

Kind: a behaviour

Not tested yet: spec-only — first stage

:::

::: fold The over-limit message — 8 tests

{at: row-005}
**With exactly 500 characters in the box no over-limit message is shown, and with 501 the message is shown and stays shown while the text stays above 500 — still after ten seconds with no input, and still after typing on to 600.** {id: ROW-005}

Kind: a behaviour

Not tested yet: spec-only — first stage

{at: row-006}
**Once the text is brought back from above 500 to 500 characters or fewer, by deleting, cutting or undoing, the over-limit message is no longer shown.** {id: ROW-006}

Kind: a behaviour

Not tested yet: spec-only — first stage

{at: row-007}
**Typing, pasting or dropping text that takes the box past 500 characters is accepted whole: no key press is refused and no text is cut, so the box holds every character entered.** {id: ROW-007}

Kind: a behaviour

Not tested yet: spec-only — first stage

{at: row-008}
**For text near the limit whose code units, code points and visible characters all differ — holding at least one emoji made of a surrogate pair, one emoji made of several code points (a skin-tone modifier or a joined sequence) and one letter with a combining accent — the over-limit message is shown exactly when the shown count is above 500 and hidden exactly when it is 500 or fewer.** {id: ROW-008}

Kind: a behaviour

Not tested yet: spec-only — first stage

{at: row-021}
**The page never changes what the person entered: double and trailing spaces, accents typed in two parts and every other character stay exactly as entered, and a character typed mid-text leaves the caret right after it, both below 500 characters and above it (for example at 520, typing at position 100).** {id: ROW-021}

Kind: a behaviour

Not tested yet: spec-only — first stage

{at: row-035}
**However often the text crosses 500 upward — by typing, pasting, dropping, after deleting, after clear and undo — exactly one over-limit message is shown each time, at once, with no further key pressed, and it goes at once when the text comes back to 500 or fewer by any of those ways, never stacked copies.** {id: ROW-035}

Kind: a behaviour

Not tested yet: spec-only — first stage

{at: row-036}
**At exactly 500 characters none of the over-limit styling the page uses at 501 (a colour, a mark on the box or the count) is present, and at 501 it is; and after coming back down from 501 — by deleting, and by clearing then typing again — it is gone at 500 and below.** {id: ROW-036}

Kind: a behaviour

Not tested yet: spec-only — first stage

{at: row-041}
**With the stylesheet blocked from loading, the count reads "0 / 500", no over-limit message is visible, and the 500/501 boundary of ROW-005 still holds.** {id: ROW-041}

Kind: a behaviour

Not tested yet: spec-only — first stage

:::

::: fold The clear button — 9 tests

{at: row-009}
**One press of the clear button empties the box, with no confirmation, dialog or other question before it.** {id: ROW-009}

Kind: a behaviour

Not tested yet: spec-only — first stage

{at: row-010}
**Right after clearing a box that was above 500 characters, the count shows "0 / 500" and the over-limit message is not shown.** {id: ROW-010}

Kind: a behaviour

Not tested yet: spec-only — first stage

{at: row-011}
**Undo pressed right after clearing brings back the exact text that was cleared, and the count and the message follow it.** {id: ROW-011}

Kind: a behaviour

Not tested yet: spec-only — first stage

{at: row-032}
**After undo has brought cleared text back, the browser's own undo command (the edit menu's Undo as the browser runs it, not a key the page listens for) restores it too, a redo then empties the box again, and further undos step back through earlier edits without ever doubling the text.** {id: ROW-032}

Kind: a behaviour

Not tested yet: spec-only — first stage

{at: row-033}
**Pressing clear twice in a row and then undoing (repeated if needed) brings back the original text exactly, never an empty box.** {id: ROW-033}

Kind: a behaviour

Not tested yet: spec-only — first stage

{at: row-034}
**After one press of clear, with no further click, the characters the person types and the undo they press go to the text box.** {id: ROW-034}

Kind: a behaviour

Not tested yet: spec-only — first stage

{at: row-037}
**Pressing clear while a word is still being composed (an input-method or phone-keyboard composition) leaves the box empty: the composing word does not come back on the next key, the next letter typed gives "1 / 500", and undo still brings the cleared text back.** {id: ROW-037}

Kind: a behaviour

Not tested yet: spec-only — first stage

{at: row-049}
**Clear, then undo, then clear again empties the box again, and a further undo brings the text back again.** {id: ROW-049}

Kind: a behaviour

Not tested yet: spec-only — first stage

{at: row-050}
**The clear button is reached with Tab from the box, and Enter and Space each clear the box once, with undo then restoring the text and the count following it.** {id: ROW-050}

Kind: a behaviour

Not tested yet: spec-only — first stage

:::

::: fold Across the whole product — 13 tests

{at: row-012}
**While the page loads and while the person types, pastes and clears, the page makes no network request other than loading its own shipped site/ files, sets no cookie, writes nothing to localStorage, sessionStorage, IndexedDB, the Cookie Store or the origin-private file system, leaves window.name empty and the history entry's state empty, leaves the page's address unchanged, and leaves the page's title as it was at load (no text or count in the tab title or history).** {id: ROW-012}

Kind: a behaviour

Not tested yet: spec-only — first stage

{at: row-013}
**control of ROW-012: with the network cut after the page has loaded, typing, the count, the over-limit message and clearing all still work.** {id: ROW-013}

Kind: a behaviour

Not tested yet: spec-only — first stage

{at: row-014}
**After text is typed, a reload, and separately a navigation away and back that the browser serves from its back-forward cache (the page reports it was restored from that cache), both show an empty box with the count "0 / 500" and no message; and the text box tells the browser not to remember its content (autocomplete="off").** {id: ROW-014}

Kind: a behaviour

Not tested yet: spec-only — first stage

{at: row-015}
**The page declares Spanish as its language; the full set of words it shows or ships for people to read — the title, labels, placeholder, button text, tooltips and accessible names — equals an expected list written in Spanish addressing the person as tú, with no whole word in usted (for example "su", "usted", "ingrese", "introduzca", "pegue", "escriba", "borre", "limpie") and the document called "CV" (never "currículum" or "hoja de vida"); and the over-limit message reads exactly "Tu resumen supera los 500 caracteres. Acórtalo para que quepa."** {id: ROW-015}

Kind: a behaviour

Not tested yet: spec-only — first stage

{at: row-022}
**Served with no charset in its Content-Type, the page still shows every accented letter of its labels and of the over-limit message correctly, and index.html declares UTF-8 within its first 1024 bytes.** {id: ROW-022}

Kind: a behaviour

Not tested yet: spec-only — first stage

{at: row-026}
**Typing, pasting, clearing and undoing leave the system clipboard exactly as it was before.** {id: ROW-026}

Kind: a behaviour

Not tested yet: spec-only — first stage

{at: row-027}
**control of ROW-026: the person can still select the box's text and copy it by hand, and the clipboard then holds exactly that text.** {id: ROW-027}

Kind: a behaviour

Not tested yet: spec-only — first stage

{at: row-030}
**Loaded with text in its address (a query such as ?texto=hola, or a fragment such as #hola), the page opens with an empty box and "0 / 500": nothing from the address enters the box.** {id: ROW-030}

Kind: a behaviour

Not tested yet: spec-only — first stage

{at: row-031}
**control of ROW-030: loaded with a query or a fragment in its address, the page still works: typing is counted and clearing clears.** {id: ROW-031}

Kind: a behaviour

Not tested yet: spec-only — first stage

{at: row-039}
**At its live address the page serves files identical to the shipped site/ files, and loading, typing and clearing there make no request beyond them, set no cookie and log no console error.** {id: ROW-039}

Kind: a behaviour

Not tested yet: paid by /vid deploy gate 2 — the page at its live address, after the owner publishes it

{at: row-040}
**At its live address the page is served only over HTTPS: the plain-HTTP address redirects to HTTPS, the HTTPS response carries Strict-Transport-Security, and nothing loads over plain HTTP.** {id: ROW-040}

Kind: a behaviour

Not tested yet: paid by /vid deploy gate 2 — the page at its live address, after the owner publishes it

{at: row-045}
**The page declares its own icon as an empty inline icon (data:,), so on load, and when served from a subfolder, the browser requests nothing outside the page's own files and nothing from the host's root.** {id: ROW-045}

Kind: a behaviour

Not tested yet: spec-only — first stage

{at: row-051}
**With text in the box, switching to another tab, staying idle 60 seconds, navigating away and closing the tab make no network request to any host — every request the browser attempts is observed, with all of the browser's traffic routed to the harness's own listening host outside the page — set no cookie and write no storage of any kind.** {id: ROW-051}

Kind: a behaviour

Not tested yet: spec-only — first stage

:::

## Rules checked across the product, and the attacks tried

::: fold Rules checked across the product — 9 tests

{at: rule-001}
**No file the page ships contains a way to send or store data: no network call, no storage write, no cookie, no change to the page's address or title, no clipboard write** {id: RULE-001}

Kind: a rule checked across the product

Checked over: find site -type f :: grep -LE 'fetch\( | XMLHttpRequest | sendBeacon | WebSocket | EventSource | localStorage | sessionStorage | indexedDB | document\.cookie | caches\. | serviceWorker | window\.name *= | location *= | location\.(hash | search | href) *= | location\.(assign | replace)\( | window\.open\( | history\.(pushState | replaceState) | document\.title *= | navigator\.clipboard | execCommand\(.copy | new Image | \.src *= | setAttribute\( | url\( | Worker\( | createElement\(.(img | script | link | iframe) | import\( | ping= | postMessage | BroadcastChannel | navigator\.share | <iframe | http-equiv=.refresh | speechSynthesis | SpeechSynthesisUtterance | SpeechRecognition | getUserMedia | RTCPeerConnection | WebTransport | new Notification | setAppBadge | cookieStore | navigator\.storage | getDirectory\( | showSaveFilePicker | requestFileSystem | createObjectURL | download= | \.download *= | createElement\(.a.\) | \.href *= | <form' $(find site -type f)

Not tested yet: census-armed — no site exists before the code skeleton; armed when the first stage writes the rule's test

{at: rule-002}
**No key, keypress or change listener decides the count: the count follows the text box's input event, the clear action, and a recount at load and when the page is shown again** {id: RULE-002}

Kind: a rule checked across the product

Checked over: find site -type f :: grep -LE "addEventListener\( *['\"](keyup | keydown | keypress | change)['\"] | on(keyup | keydown | keypress | change) *=" $(find site -type f)

Not tested yet: census-armed — no site exists before the code skeleton; armed when the first stage writes the rule's test

{at: rule-003}
**No file the page ships writes HTML from strings or runs strings as code** {id: RULE-003}

Kind: a rule checked across the product

Checked over: find site -type f \( -name '*.js' -o -name '*.html' \) :: grep -LE 'innerHTML | outerHTML | insertAdjacentHTML | document\.write | eval\( | new Function' $(find site -type f \( -name '*.js' -o -name '*.html' \))

Not tested yet: census-armed — no site exists before the code skeleton; armed when the first stage writes the rule's test

{at: rule-004}
**Every local reference in the page (src, href) is relative and names a shipped file exactly, letter case included, so the page works under any folder of any host** {id: RULE-004}

Kind: a rule checked across the product

Checked over: checks/extractors/invariant.local-refs.sh

Not tested yet: census-armed — the extractor is generated with the code skeleton; armed when the first stage writes the rule's test

{at: rule-005}
**No file the page ships names another site: no absolute (http:, https:) or protocol-relative (//) address in any attribute, stylesheet or script, so nothing preconnects, prefetches or imports from elsewhere (a code comment is written with a space after //)** {id: RULE-005}

Kind: a rule checked across the product

Checked over: find site -type f :: grep -LE '(https?:)?//[A-Za-z0-9]' $(find site -type f)

Not tested yet: census-armed — no site exists before the code skeleton; armed when the first stage writes the rule's test

{at: rule-006}
**Every script the page ships is included exactly once, so no two copies of the counting code run at the same time** {id: RULE-006}

Kind: a rule checked across the product

Checked over: checks/extractors/invariant.script-once.sh

Not tested yet: census-armed — the extractor is generated with the code skeleton; armed when the first stage writes the rule's test

{at: rule-007}
**The text box is the browser's own plain-text field: no file the page ships makes an element editable as rich content** {id: RULE-007}

Kind: a rule checked across the product

Checked over: find site -type f \( -name '*.js' -o -name '*.html' \) :: grep -LiE 'contenteditable | designMode' $(find site -type f \( -name '*.js' -o -name '*.html' \))

Not tested yet: census-armed — no site exists before the code skeleton; armed when the first stage writes the rule's test

{at: rule-008}
**No file the page ships carries a real person's contact details: no email address and no phone number in the page, its placeholder, its comments or anything else published; a run of seven or more digits, however spaced, dotted, hyphenated or bracketed, counts as a phone number, so no shipped file holds one** {id: RULE-008}

Kind: a rule checked across the product

Checked over: find site -type f :: grep -LE '[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,} | [0-9]([ ().-]?[0-9]){6,}' $(find site -type f)

Not tested yet: census-armed — no site exists before the code skeleton; armed when the first stage writes the rule's test

{at: rule-009}
**The count never depends on the kind of edit: no shipped code reads the input event's kind to decide whether, or how, to recount** {id: RULE-009}

Kind: a rule checked across the product

Checked over: find site -type f :: grep -LE 'inputType' $(find site -type f)

Not tested yet: census-armed — no site exists before the code skeleton; armed when the first stage writes the rule's test

:::

::: fold Attacks tried — 3 tests

{at: hos-001}
**With one line added to the page's script that sends the box's text to the harness's listening host by a path the rule's word list does not name (a request function reached through a computed property name, for example window['fe'+'tch']), in one session type a summary, paste text, go past 500, press clear, stay idle 30 seconds, then hide the page and close it; recorded at the browser's network exit outside the page from the start of load, expect no request to any host other than the page's own address at any moment, no request to the page's own address after load, and every storage the page can reach still empty at the end; with the line removed the same probe passes** {id: HOS-001}

Kind: an attack tried

It protects: [No file the page ships contains a way to send or store data: no network call, no storage write, no cookie, no change to the page's address or title, no clipboard write](#rule-001)

To try it, take away: insert into site/main.js's input handler one line that calls window['fe'+'tch'] with the harness listener's address and the box's text, then remove it

Not tested yet: guard-first — RULE-001; paid in the slice that builds site/main.js

{at: hos-003}
**With one line added to site/main.js that calls fetch with the harness listener's address and the box's text, run RULE-001's census and expect it to name site/main.js as unguarded; with the line removed the census passes** {id: HOS-003}

Kind: an attack tried

It protects: [No file the page ships contains a way to send or store data: no network call, no storage write, no cookie, no change to the page's address or title, no clipboard write](#rule-001)

To try it, take away: insert into site/main.js one line calling fetch with the harness listener's address and the box's text, then remove it

Not tested yet: guard-first — RULE-001; paid in the slice that builds site/main.js

{at: hos-002}
**With a link to another site's address added to the page (a preconnect to the harness's outside host), load the page and expect the outside host, counting accepted connections at its socket, to receive none; with the link removed the same probe passes, and a control load with the guard off shows the browser does open the connection** {id: HOS-002}

Kind: an attack tried

It protects: [No file the page ships names another site: no absolute (http:, https:) or protocol-relative (//) address in any attribute, stylesheet or script, so nothing preconnects, prefetches or imports from elsewhere (a code comment is written with a space after //)](#rule-005)

To try it, take away: add to site/index.html one preconnect link to the harness's outside host, then remove it

Not tested yet: guard-first — RULE-005; paid in the slice that builds site/index.html

:::

## What is deliberately not tested

Nothing.

## The grading checklist


> Owner-curated, versioned, injected VERBATIM into every grading brief
> (§7.2). This is the residue that stays human: absent guards leave no
> artifact — no orphan, no site list, no divergent knob — so no census can
> find them; only domain knowledge names them in advance. Every accepted
> absent-guard finding adds one line here: this run's blind spot becomes the
> next run's standard question. Seeded at init from the interview and the
> plugin's seed library (seed/checklist.md); lines the owner marks general
> at run end are promoted back into the seed (§7.3). A seeded line that
> fires nothing across two runs is dropped (the complexity law).

### Standing lines (every project)

- **Harness attacks.** Check that the test harness itself has not been
  defeated: assertion-neutralising equality overrides (`__eq__` and its
  analogues), early process exit before assertions run (`sys.exit(0)` and
  its analogues), test-framework monkey-patching, skipped or filtered tests
  counted as run. Measured hidden-test hack rates of 12–13% make "the suite
  exited 0" an attackable claim.
- **Example-only evidence.** A computational promise — a calculation, a
  ranking, a match, a decision — proved only by published, named examples
  is unproved: find the implementation that branches on the fixture and
  answers correctly for exactly those inputs. Generated or independently
  sampled inputs are the standard (exact fixture-named assertions can be
  satisfied by branching on the fixture names, with no engine built).
- **Probe fixture realism.** Tidy stand-in fixtures carry none of the
  hostile properties of real input: check that a hostility probe's input
  is hostile in every field the product stores or renders, not only the
  one the probe asserts on, and that filenames, addresses and markup look
  like the real thing (hostile markup planted in the description alone
  leaves every other field between a hostile feed and stored script).
- **Assertion strength on Tier-0.** A Tier-0 row whose test asserts only
  that something EXISTS — an element is present, a record count is at
  least one, a status is in a set spanning success and redirect — is a
  finding: name the value or behaviour the assertion should have pinned
  (the ladder: existence → type → status → value → behaviour; presence
  assertions can outnumber real visibility assertions many times over).

### Domain lines

- **Fences: the things left out.** Building any of the PRD's non-goals (NG-001 to NG-009) is a defect: a save of the text in any form, accounts, sending or downloading, a spell checker the page adds, writing suggestions, another language, analytics, an elaborate design, accessibility work beyond a plain page. So is a control the page was not asked for (a copy button, a word count, sample text).
- **Spanish register.** Does every visible word address the person as tú, in neutral Latin American Spanish, and call the document "CV" (A-010)? A label in usted, or "currículum" / "hoja de vida", is a finding even when every row passes.
- **Session restore.** Does reopening a closed tab, or the browser restoring its session after a restart or crash, bring back an empty box with "0 / 500"? Text restored there was written to the browser's files on disk.
- **A dropped file.** Does dropping a file (for example the CV itself) on the page or the box leave the page, and the text in it, untouched — never navigating to the file and losing the summary?
- **What gets published.** Does the copy that reaches the host hold only the page's own files from site/ — never PRD.md, .vid/, CLAUDE.md, tests or fixtures?
- **A release after a release.** After a re-release, can a returning visitor's browser pair a cached old script or stylesheet with the new page (or the reverse), leaving a counter that silently does nothing?
- **Writing aids.** Has the text box been given attributes that switch off the phone's own writing help (capitals at the start of sentences, autocorrect) that nothing in the PRD asks to switch off?
- **Dark mode.** With the device in dark mode, are the box's text, the count and the message still readable?
- **The host's logs.** Does the host the owner publishes to keep request logs with full visitor addresses, and for how long? Something about each person kept there runs against the seed's "nothing is kept about the person".
- **A shared origin.** Is the page served from an origin it shares with no other app, and is it refused when another site frames it?
- **Opened from the file.** Opened by double-clicking index.html, does the page count, warn and clear exactly as it does over the web?
- **Machine translation.** With the browser translating the page, do the count and the message keep following the box?
- **The console.** Does any shipped code write the box's text, or the count, to the browser console (a debugging line left in), where it outlives the moment?
- **A hidden copy.** After clear, does any copy of the text survive outside the browser's own undo — in an attribute, a hidden element, a variable kept for a home-made undo — where an extension, a translation, a saved page or a print could read it?
- **Undo on a real Mac and from the menu.** On macOS, do Cmd+Z and the text box's own context-menu Undo bring cleared text back, as Ctrl+Z does? On Firefox and Safari, does a real dead-key accent and a phone keyboard's composing word count right once composed, and do dictation and autocorrect replacements keep the count right? The test harness cannot drive these, so a person checks them on a real device.

{chapter: 6}
# The stages

Not written yet: it comes at the releases.

!!! Waiting on you: Two settings on this machine, 1 items. Answer in the panel or in the chat.
{chapter: 7}
# The plan

Not written yet: it comes when the plan is made, after the releases.
{chapter: 8}
# Contador de caracteres para el resumen del CV: the findings

As of 2026-11-24 20:10 UTC

- `PRD.md`: not committed yet

Still open: 0 · Fixed: 46 · Your rulings: 4 · Noted: 0

[[contents]]

## Still open

None.

## Fixed

- **Advisory**, found by the completeness audit, about the quality "What clearing does" {id: DIM-clear-action}; the requirement "One press of the clear button empties the box straight away, without asking, and the count goes back to zero; undo right after brings the text back." {id: REQ-003}; how it works: "One press of the clear button empties the box at once, with no confirmation, and the count and message follow the empty text." {id: MECH-03}: a mistaken press of the clear button loses the only copy of the text, and whether undo restores it depended on how a builder clears the box; the owner ruled undo restores it (A-014); REQ-003 now carries it as fail-if part (5) {id: F-02}
- **Blocking**, found by the review, about the requirement "When your text passes 500 characters a message says so and disappears once you are back to 500 or fewer; typing is never blocked." {id: REQ-002}: critical — unguarded seam: the message's 500 was not tied to the count the page shows, so a build could show 497 / 500 beside the over-limit message; REQ-002 now uses the shown count and carries part (5); arms (1) to (4) retained {id: F-03}
- **Advisory**, found by the review, about an answer {id: A-011}; an answer {id: A-012}: A-011 said the page must work at phone width while the owner struck phone layout as a requirement (A-012); A-011 restated as no requirement in this version {id: F-04}
- **Blocking**, found by the strength check, about a test of the list {id: ROW-005}; a test of the list {id: ROW-035}: a message toggled on key release shows at 501 typed, but a paste, drop or undo to above 500 showed none until a key; ROW-035 now covers every way upward, at once {id: F-05}
- **Blocking**, found by the strength check, about a test of the list {id: ROW-005}; a test of the list {id: ROW-035}: a transient toast passes "shown at 501"; ROW-005 now requires the message to stay while the text stays above 500 {id: F-06}
- **Blocking**, found by the strength check, about a test of the list {id: ROW-008}: test text of single-code-point emoji and precomposed accents gives equal counts under both rules; ROW-008 now pins multi-code-point emoji and a combining accent {id: F-07}
- **Advisory**, found by the strength check, about a test of the list {id: ROW-036}: over-limit styling never removed after coming back down; ROW-036 now checks after coming down {id: F-08}
- **Advisory**, found by the strength check, about a test of the list {id: ROW-021}: the caret could jump only above 500; ROW-021 now checks above 500 too {id: F-09}
- **Advisory**, found by the strength check, about a test of the list {id: ROW-002}; a test of the list {id: ROW-019}; a test of the list {id: ROW-048}: a debounced count passes retrying checks; "at once" now means one read without retry and a second after one quiet second {id: F-10}
- **Advisory**, found by the strength check, about a test of the list {id: ROW-020}: a count that skips composing input with no end-of-composition recount; ROW-020 now names the sequence and drives real composition in Chromium {id: F-11}
- **Advisory**, found by the strength check, about a test of the list {id: ROW-019}; a test of the list {id: ROW-046}: a handler filtering on the kind of edit passes value-setting tests; edits are now made as the browser makes them {id: F-12}
- **Advisory**, found by the strength check, about a test of the list {id: ROW-042}: a code-point fallback passes a plain-letter test; ROW-042 now removes the facility before the script and enters a combining accent and a joined emoji {id: F-13}
- **Advisory**, found by the strength check, about a test of the list {id: ROW-023}: rows left out of the three-engine run; ROW-002, ROW-024, ROW-043, ROW-046 and ROW-048 added {id: F-14}
- **Advisory**, found by the strength check, about a test of the list {id: ROW-001}: expected counts taken from the engine's own segmenter agree by construction; they now come from Unicode's published grapheme-break data, pinned {id: F-15}
- **Advisory**, found by the strength check, about a test of the list {id: ROW-001}; the requirement "Below the box the page shows how many characters you have written out of 500, counting each character you see, space, line break and lone invisible character as one." {id: REQ-001}; an answer {id: A-001}: invisible characters were undecided between "what the person sees" and grapheme clusters; the owner ruled they count (A-016), REQ-001 amended and ROW-001 rewritten {id: F-16}
- **Blocking**, found by the strength check, about a test of the list {id: RULE-001}: the word list held unescaped parentheses and did not compile; escaped, and every rule's pattern checked on a planted folder {id: F-17}
- **Blocking**, found by the strength check, about a test of the list {id: HOS-001}; a test of the list {id: HOS-002}: the probes showed failure with the line inserted but never a pass without it; both now pass with the line removed {id: F-19}
- **Blocking**, found by the strength check, about a test of the list {id: ROW-014}: headless Chromium does not restore a textarea on reload and a harness back navigation may skip the back-forward cache; ROW-014 now requires a cache restore and autocomplete="off" {id: F-20}
- **Advisory**, found by the strength check, about a test of the list {id: ROW-015}: a short banned-word list passes other usted forms and catches "su" inside "supera"; ROW-015 now compares the full set of strings, whole words {id: F-21}
- **Advisory**, found by the strength check, about a test of the list {id: ROW-022}: headless Chromium guesses UTF-8; ROW-022 now also checks the declared charset in the first 1024 bytes {id: F-22}
- **Advisory**, found by the strength check, about a test of the list {id: ROW-012}; a test of the list {id: ROW-051}: window.name and history state unchecked, and requests at close unseen by the page; both added {id: F-23}
- **Advisory**, found by the strength check, about a test of the list {id: HOS-002}: a preconnect sends no request the browser logs; HOS-002 now counts connections at the outside host's socket {id: F-24}
- **Advisory**, found by the strength check, about a test of the list {id: RULE-001}; a test of the list {id: RULE-005}: literal extension lists and missing call names; both scan every shipped file and RULE-001 adds setAttribute, url( and Worker {id: F-25}
- **Advisory**, found by the strength check, about a test of the list {id: ROW-012}; a test of the list {id: ROW-045}: "its own three files" against a shipped icon file; ROW-012 now allows the shipped site/ files and ROW-045 names an empty inline icon {id: F-26}
- **Advisory**, found by the strength check, about a test of the list {id: RULE-005}; a test of the list {id: ROW-045}: an inline SVG icon's namespace address matches RULE-005; the icon is now data:, and comments are written with a space after // {id: F-27}
- **Advisory**, found by the strength check, about a test of the list {id: RULE-008}; a test of the list {id: ROW-045}: the phone pattern matched SVG path data and dates; reworked, the icon has no path data {id: F-28}
- **Advisory**, found by the strength check, about a test of the list {id: RULE-002}; a test of the list {id: ROW-024}; a test of the list {id: ROW-043}: the rule's words forbade the load and page-shown recount the rows need; RULE-002 reworded to what its census holds {id: F-29}
- **Advisory**, found by the strength check, about a test of the list {id: ROW-023}; a test of the list {id: ROW-020}; a test of the list {id: ROW-032}: Cmd+Z, menu undo and non-Chromium composition cannot be driven in the Linux harness; rows narrowed to what it drives, the rest a real-device checklist line {id: F-30}
- **Advisory**, found by the strength check, about a test of the list {id: ROW-011}; a test of the list {id: ROW-032}: repeat; ROW-032 now holds only what ROW-011 does not {id: F-31}
- **Advisory**, found by the strength check, about a test of the list {id: ROW-003}; a test of the list {id: ROW-004}: repeated thousands-separator clause; kept in ROW-004 only {id: F-32}
- **Blocking**, found by the strength check, about a test of the list {id: HOS-001}; a test of the list {id: RULE-001}: round 2 — setAttribute had joined the word list, so HOS-001's planted path was no longer unnamed; it now uses a computed property name {id: F-33}
- **Blocking**, found by the strength check, about a test of the list {id: ROW-051}: round 2 — observing only the listening host misses a beacon to another host on close; every request the browser attempts is now observed {id: F-34}
- **Blocking**, found by the strength check, about a test of the list {id: RULE-008}: round 2 — common phone formats passed; any run of seven or more digits now counts {id: F-35}
- **Blocking**, found by the strength check, about a test of the list {id: ROW-019}; a test of the list {id: ROW-023}: round 2 — edits the harness cannot make natively; ROW-019 now names how each is driven, and RULE-009 forbids a count that reads the kind of edit {id: F-36}
- **Blocking**, found by the strength check, about a test of the list {id: HOS-001}; a test of the list {id: RULE-001}: round 3 — no probe shows the census itself catching a plain call; HOS-003 added at the owner's ruling {id: F-37}
- **Blocking**, found by the strength check, about a test of the list {id: ROW-019}; a test of the list {id: ROW-023}: round 3 — ROW-023 required ROW-019 in three engines with no stated path; narrowed at the owner's ruling {id: F-38}
- **Blocking**, found by the strength check, about a test of the list {id: HOS-001}: after the owner's rulings — the probe watched only the listening host; it now watches every request after load and reads storage {id: F-39}
- **Blocking**, found by the strength check, about a test of the list {id: ROW-042}: after the owner's rulings — one named pair let a hand-written fallback pass; the row now runs ROW-001's sampled strings with the facility removed {id: F-40}
- **Blocking**, found by the strength check, about a test of the list {id: ROW-001}; the requirement "Below the box the page shows how many characters you have written out of 500, counting each character you see, space, line break and lone invisible character as one." {id: REQ-001}; an answer {id: A-016}: after the owner's rulings — joiners attached to a character against "each invisible character counts"; settled by the owner's answers on joined emoji (A-001 restated) and ROW-001 rewritten {id: F-41}
- **Blocking**, found by the strength check, about a test of the list {id: ROW-001}; the requirement "Below the box the page shows how many characters you have written out of 500, counting each character you see, space, line break and lone invisible character as one." {id: REQ-001}; an answer {id: A-001}: Unicode's grapheme data glues a mark to a preceding space, the owner's rule does not; ROW-001 now states the owner's correction with sampled cases {id: F-42}
- **Blocking**, found by the strength check, about a test of the list {id: HOS-001}: the probe covered typing only; it now covers a whole session from load to close, recorded at the network exit {id: F-43}
- **Blocking**, found by the review, about the requirement "Below the box the page shows how many characters you have written out of 500, counting each character you see, space, line break and lone invisible character as one." {id: REQ-001}: round 1 — the first rewording let a joined emoji count as its parts; repaired at the owner's answer to keep an emoji one however built {id: F-44}
- **Blocking**, found by the review, about an answer {id: A-001}; an answer {id: A-016}: round 1 — A-016 changed A-001's rule; A-001 restated with the owner's yes {id: F-45}
- **Advisory**, found by the review, about the requirement "When your text passes 500 characters a message says so and disappears once you are back to 500 or fewer; typing is never blocked." {id: REQ-002}; the requirement "The page works in the current and previous major versions of Chrome, Edge, Firefox and Safari; on an older browser that lacks the counting feature it shows neither a count nor the over-limit message, rather than wrong ones." {id: CON-004}: round 1 — whether the message shows on an older browser was undecided; the owner ruled it stays hidden (A-019) {id: F-46}
- **Blocking**, found by the review, about the requirement "Below the box the page shows how many characters you have written out of 500, counting each character you see, space, line break and lone invisible character as one." {id: REQ-001}; the requirement "The page works in the current and previous major versions of Chrome, Edge, Firefox and Safari; on an older browser that lacks the counting feature it shows neither a count nor the over-limit message, rather than wrong ones." {id: CON-004}: round 2 — REQ-001 now states no count is shown on an older browser, as CON-004 does {id: F-49}
- **Blocking**, found by the review, about the requirement "Below the box the page shows how many characters you have written out of 500, counting each character you see, space, line break and lone invisible character as one." {id: REQ-001}: round 2 — the plain sentence said every invisible character counts; it now says a lone invisible character {id: F-50}

## Your rulings

- **Advisory**, found by the red team, about how it works: "The count is recomputed from the box's whole text on every change, whatever made the change, by the counting rule the owner chose." {id: MECH-01}; the summary: value-coherence — destinations may count UTF-16 code units or CRLF line breaks, so a summary at 498 / 500 here may be too long there; A-001 is the owner's explicit rule, so a question for the owner, who left it {id: F-01}
- **Blocking**, found by the strength check, about a test of the list {id: RULE-001}; a test of the list {id: RULE-002}; a test of the list {id: RULE-003}; a test of the list {id: RULE-005}; a test of the list {id: RULE-007}; a test of the list {id: RULE-008}: critical — the reviewers read the fifth field as an expected exit code of grep -L; ViD's belief rests on checks/census.sh lines 12-15 and 412-420 (orphans are the left list minus the right list; the exit code is not read) and the template's rule grammar (the fifth field is the tier); the owner kept the rules as written {id: F-18}
- **Blocking**, found by the review, about the requirement "Below the box the page shows how many characters you have written out of 500, counting each character you see, space, line break and lone invisible character as one." {id: REQ-001}: arm 1 — round 2 — the arm now counts each invisible character standing on its own as one, where it used to fail a count differing from what the person sees; the owner accepted the change {id: F-47}
- **Blocking**, found by the review, about the requirement "When your text passes 500 characters a message says so and disappears once you are back to 500 or fewer; typing is never blocked." {id: REQ-002}: arm 1 — round 2 — the arm now applies on the browsers the page supports only; the owner accepted the narrowing {id: F-48}

## Noted

None.

