Lens 2 (first-time Spanish-speaking job seeker on a phone), round 1: 9 candidates.
1 count stale after input with no key event (autocorrect, dictation, IME, dead key) (ledger row)
2 page rewrites the text (trim, collapse spaces, NFC, strip) or moves the caret to the end (ledger row)
3 mojibake with no charset or via file:// (ledger row)
4 script dies without Intl.Segmenter → count stuck (ledger row, fallback)
5 undo only via a custom Ctrl+Z handler; browser undo (execCommand undo, iOS) fails, or old summary replaces new typing (ledger row)
6 double tap on clear loses the summary for good (ledger row)
7 rich paste lands markup, or contenteditable counts line breaks as two (ledger row)
8 wording breaks A-010: usted, "currículum"/"hoja de vida" (grader question or row)
9 text reaches an HTML sink (innerHTML, eval...) (rule)
Owner questions raised: invisible characters (zero-width space, soft hyphen, BOM, NBSP) — do they count? A-001 says characters the person sees; Android keyboards have no undo gesture, so A-014's safety net does not reach most phone users.
