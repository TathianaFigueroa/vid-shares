Accepted candidates so far (round 1, all lenses), as they landed:
- ROW-012 strengthened: the page's title stays as at load (no text or count in the tab title or history).
- ROW-015 strengthened: no usted, the document called "CV".
- ROW-019 count right after input with no key press (autocorrect, dictation, emoji picker, input-method commit, redo, drag inside, drag out).
- ROW-020 count right during and after composition (dead key; a word still composing on phone keyboards).
- ROW-021 the page never changes what was entered; caret stays after a mid-text insert.
- ROW-022 accents correct when served with no charset.
- ROW-023 key rows hold in Chromium, Firefox and WebKit.
- ROW-024 count and message agree with whatever the box holds after load, reload, back navigation.
- ROW-025 with the script blocked, no count that looks like a reading.
- ROW-026 clipboard untouched by typing, pasting, clearing, undo; ROW-027 its control (copy by hand works).
- ROW-028 formatted paste: plain text only, nothing loaded, line break counts once; ROW-029 its control.
- ROW-030 nothing from the page's address enters the box; ROW-031 its control.
- ROW-032 undo after clear through every browser undo, redo, no doubling.
- ROW-033 double clear then undo restores the text.
- ROW-034 after clear, typing and undo go to the box.
- RULE-001 widened: window.name, caches, serviceWorker, location assign/replace, window.open, document.title, clipboard writes.
- RULE-002 the count decided only by the input event and the clear action (no key/change listeners).
- RULE-003 no HTML written from strings, no strings run as code.
- RULE-004 every local reference relative and exact in letter case.
- Grader questions: usted/CV register; session restore after reopen or restart; a dropped file leaves the page untouched; only site/ files published; cached asset mismatch after a re-release.
- Owner questions raised (to the sitting): which browsers are supported; whether invisible characters (zero-width space, soft hyphen, BOM, direction marks) count; phone keyboards without undo versus A-014.

Accepted in round 2 (all lenses):
- ROW-001 strengthened: leading/trailing spaces, trailing line break, tabs, no-break spaces counted in full; checked on sampled and generated strings.
- ROW-003/004 strengthened: no thousands separator. ROW-015 strengthened: title, placeholder, tooltips, accessible names Spanish and tú. ROW-023 widened to ROW-019, ROW-020, ROW-032, ROW-033. ROW-025 strengthened: no message visible with the script blocked. ROW-028: paste or drop.
- ROW-035 one message, never stacked; ROW-036 no over-limit styling at 500; ROW-037 clear during composition; ROW-038 resize/rotation; ROW-039 live page identical to shipped files, no extra request, cookie or console error (deploy-owed); ROW-040 HTTPS only at the live address (deploy-owed); ROW-041 stylesheet blocked; ROW-042 counting facility missing; ROW-043 text typed while the script loads; ROW-044 unusual input raises no error; ROW-045 own icon, no request to the host root; ROW-046 deletions and replacements; ROW-047 box emptied by editing shows 0; ROW-048 no stale count after quick input then clear; ROW-049 clear, undo, clear; ROW-050 clear reachable by keyboard.
- RULE-001 widened again: new Image, .src =, createElement of img/script/link/iframe, import(, ping=, postMessage, BroadcastChannel, navigator.share, <iframe, meta refresh.
- RULE-005 no other site named in any shipped file (Tier 0) with HOS-002; RULE-006 each script included once; RULE-007 no rich-content editing.
- Grader questions: writing aids not switched off; dark mode; host request logs with visitor addresses; shared origin and framing; opened from file://; browser machine translation.
