Strength table pass, round 1: 11 findings.
F-01 | blocking | RULE-001 | ERE does not compile | fix_model_authority
F-02 | blocking | RULE-001, RULE-002, RULE-003, RULE-005, RULE-007, RULE-008 | grep -L judged by an expected exit value; contradictory 0 vs 1 | fix_model_authority
F-03 | advisory | RULE-001, RULE-005 | literal extension lists and literal API names; scan every file, add setAttribute(, url(, Worker( | fix_model_authority
F-04 | advisory | ROW-012, ROW-045 | "its own three files" vs a shipped icon file | fix_model_authority
F-05 | advisory | RULE-005, ROW-045 | inline SVG icon's xmlns matches RULE-005; //word comments match | fix_model_authority
F-06 | advisory | RULE-008, ROW-045 | phone pattern matches SVG path data and ISO dates | fix_model_authority
F-07 | advisory | RULE-002, ROW-024, ROW-043 | rule statement says input event only; rows need a load and pageshow recount | fix_model_authority
F-08 | advisory | ROW-015 | "su" substring inside the required "supera" | fix_model_authority
F-09 | advisory | ROW-023, ROW-020, ROW-032 | Cmd+Z, context-menu undo and non-Chromium composition cannot be driven in a Linux headless harness | fix_model_authority
F-10 | advisory | ROW-011, ROW-032 | repeat | fix_model_authority
F-11 | advisory | ROW-003, ROW-004 | repeat of the thousands-separator clause | fix_model_authority
