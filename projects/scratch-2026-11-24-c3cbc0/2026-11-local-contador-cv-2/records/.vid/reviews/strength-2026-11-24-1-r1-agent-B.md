Strength batch B (REQ-002, REQ-003), round 1: 5 findings.
S-1 | blocking | INVENTORY.md:ROW-005, INVENTORY.md:ROW-035 | message toggled on keyup; paste/drop/undo to above 500 shows no message until a key | fix_from_record
S-2 | blocking | INVENTORY.md:ROW-005, INVENTORY.md:ROW-035 | message as a transient toast that disappears while text stays above 500 | fix_from_record
S-3 | blocking | INVENTORY.md:ROW-008 | test text of single-code-point emoji and precomposed accents gives equal counts; pin multi-code-point emoji and decomposed accents | fix_from_record
S-4 | advisory | INVENTORY.md:ROW-036 | over-limit styling never removed after coming back down | fix_from_record
S-5 | advisory | INVENTORY.md:ROW-021 | caret jumps only above 500; check the caret above 500 too | fix_from_record
