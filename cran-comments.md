## R CMD check results

0 errors | 0 warnings | 1 note

* This is a new submission.

## Notes for the reviewer

* Possibly misspelled words in DESCRIPTION are proper nouns: the toy system
  (Glyos), its manufacturer (Onell) and the partner companies (TheGodBeast,
  Toyfinity). They are spelled as the companies spell them.

* Per-palette reference links to the Glyos Wiki (glyos.fandom.com) are held
  as data in the `glyos_colorways` data frame rather than as documentation
  links, because that host returns HTTP 403 to automated URL checkers.

## Test environments

* local Windows 11, R 4.4.1
* GitHub Actions: ubuntu-latest (R devel, release, oldrel-1), macos-latest
  (release), windows-latest (release)
* win-builder (devel)
