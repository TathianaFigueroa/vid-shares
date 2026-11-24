Lens 4 (web release reviewer), round 1: 8 candidates.
1 subpath hosting breaks root-absolute asset refs (ledger row + rule: no root-absolute or scheme refs in shipped HTML)
2 asset reference case mismatch works on Windows, 404 on Linux host (rule: every local ref matches a file byte-exact)
3 no meta charset → mojibake on host without charset (ledger row: serve without charset, expect meta charset and exact message)
4 behaviour differs between browser engines (Intl.Segmenter missing, execCommand/undo, composition) (rows run in Chromium, Firefox, WebKit)
5 Firefox restores textarea on reload with stale count (ROW-014 in Firefox/WebKit, count agrees with box after load/pageshow)
6 release publishes files beyond the page (PRD, .vid, CLAUDE.md) (rule: deployed artifact = three files)
7 cached old asset paired with new HTML after re-release (grader question)
8 hardcoded 0 / 500 shows when script failed (grader question)
