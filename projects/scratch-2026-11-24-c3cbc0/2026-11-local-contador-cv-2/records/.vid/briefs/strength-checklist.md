# Contador de caracteres para el resumen del CV — GRADING CHECKLIST

> Owner-curated, versioned, injected VERBATIM into every grading brief
> (§7.2). This is the residue that stays human: absent guards leave no
> artifact — no orphan, no site list, no divergent knob — so no census can
> find them; only domain knowledge names them in advance. Every accepted
> absent-guard finding adds one line here: this run's blind spot becomes the
> next run's standard question. Seeded at init from the interview and the
> plugin's seed library (seed/checklist.md); lines the owner marks general
> at run end are promoted back into the seed (§7.3). A seeded line that
> fires nothing across two runs is dropped (the complexity law).

## Standing lines (every project)

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

## Domain lines

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
