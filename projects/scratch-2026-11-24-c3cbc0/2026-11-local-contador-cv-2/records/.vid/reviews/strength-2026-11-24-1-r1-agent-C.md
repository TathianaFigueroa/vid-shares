Strength batch C (constraints, rules, hostility), round 1: 8 findings.
F1 | blocking | RULE-001 | ERE does not compile (unescaped getDirectory( and createElement(.a.)); grep exits 2 | fix_model_authority
F2 | blocking | RULE-001, RULE-002, RULE-003, RULE-005, RULE-007, RULE-008 | grep -L exit status differs by grep version; expected 0 vs 1 | fix_model_authority
F3 | blocking | HOS-001 | shows the rule fails when the line is inserted, never that it passes untouched (same for HOS-002) | fix_model_authority
F4 | blocking | INVENTORY.md:ROW-014 | no autocomplete="off" passes in headless Chromium; harness back navigation may not be a bfcache restore | fix_from_record
F5 | advisory | INVENTORY.md:ROW-015 | short usted word list; compare every shipped string with an expected tú set | fix_from_record
F6 | advisory | INVENTORY.md:ROW-022 | headless Chromium guesses UTF-8; add a static check of meta charset in the first 1024 bytes | fix_from_record
F7 | advisory | INVENTORY.md:ROW-012, INVENTORY.md:ROW-051 | window.name and history.state unchecked; requests at close observed outside the page | fix_from_record
F8 | advisory | HOS-002 | preconnect sends no HTTP request; count connections at the outside host's socket | fix_model_authority
