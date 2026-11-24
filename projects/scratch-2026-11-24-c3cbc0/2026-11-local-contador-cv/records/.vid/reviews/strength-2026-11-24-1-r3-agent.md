Strength round 3 (delta, table): 2 blocking findings.
1 | blocking | HOS-001, RULE-001 | HOS-001 plants a path the census cannot name, so it never shows the rule's census failing; add a sibling that plants a named call (fetch() and expects the census to fail, with the removed line as control; point HOS-001 at the behaviour rows | fix_model_authority
2 | blocking | INVENTORY.md:ROW-019, INVENTORY.md:ROW-023 | ROW-019 drives its edits in Chromium; ROW-023 requires them in all three engines with no stated path; name which edits run in Firefox and WebKit, exclude the rest | fix_model_authority
Advisory, not raised: navigating away makes no request only if the harness navigates to about:blank; an inline SVG's path data would trip RULE-008 (the icon is data:, so none).
