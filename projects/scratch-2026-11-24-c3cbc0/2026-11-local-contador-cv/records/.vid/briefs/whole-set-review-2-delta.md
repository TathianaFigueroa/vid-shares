The delta (the rows the repair changed, verbatim):

REQ-002 | functional | T1 | While the count the page shows is above 500 characters the message A-006 states is shown below the box, and while that count is 500 or fewer no such message is shown; nothing ever blocks or cuts what the person types or pastes. | fail-if: (1) the box holds 501 characters and the over-limit message is not shown; (2) the over-limit message is shown while the box holds 500 characters or fewer; (3) the message is still shown after the text is brought back to 500 characters or fewer; (4) a key press, paste or drop that would take the text past 500 characters is refused, or the text is cut to 500; (5) the over-limit message is shown while the count the page shows is 500 or fewer, or is not shown while that count is above 500 | serves: the person learns the moment their summary no longer fits, without losing anything they wrote (G1) | authority: provisional | confirms_via: owner-decision/no | source: seed, A-001, A-003, A-006, thesis MECH-02 | covers: DIM-limit-boundary | phase: pilot | feature: FEAT-02 | plain: When your text passes 500 characters a message says so and disappears once you are back to 500 or fewer; typing is never blocked.
A-011 | model_proposed | 2026-11-24 | Q: Must the page work on a phone? | A: no requirement in this version: phone layout was struck by the owner (A-012); the plain page is left readable at phone width as a builder's matter, and nothing is graded against it | settles: thesis

Their affected set: REQ-001, REQ-003, A-001, A-006, A-012, MECH-02, DIM-limit-boundary.

Open needs_owner findings and ViD's recommended answers: none.

Open entries of checks/prd.sh --arms for the delta's rows: none.
