Acceptance tests in Docker across Chromium, Firefox and WebKit

tests/acceptance/: 5 files of Playwright tests covering the inventory's
rows, run by docker-compose.acceptance.yml against the page served from its
own container (Dockerfile: product and tests targets). Last run: 96 passed,
0 failed, 15 skipped by design — WebKit's Linux test build undoes nothing,
so undo is checked on real Safari; clipboard and composition run in
Chromium only. Written by the build session at the owner's request, not by
ViD's test author: not ledger evidence, and INVENTORY.md is unchanged.
README gains preview, test and publish instructions; .gitignore keeps
.vid/ and the local preview setting out of the repository.

REQs: REQ-001, REQ-002, REQ-003, CON-001, CON-002, CON-003, CON-004
Decisions: none — nothing surprising
Seams: none
Model: claude-opus-5-5

Owner: "do it i just want you to do it and to put it in github"

Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
