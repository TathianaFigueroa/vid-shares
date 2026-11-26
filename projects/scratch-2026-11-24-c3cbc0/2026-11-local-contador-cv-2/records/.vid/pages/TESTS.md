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

