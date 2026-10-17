## R CMD check results

0 errors | 0 warnings | 1 note

* This is a new submission. The only NOTE, from win-builder and the local
  check alike, is the "possibly misspelled words in DESCRIPTION" list
  addressed below.

## Notes for the reviewer

* The possibly misspelled words in DESCRIPTION (Glyos, Onell, TheGodBeast,
  Toyfinity) are proper nouns: the toy system, its manufacturer and two of
  the partner companies, spelled as the companies spell them.

* Per-palette reference links to the Glyos Wiki (glyos.fandom.com) are held
  as data in the `glyos_colorways` data frame rather than as documentation
  links, because that host returns HTTP 403 to automated URL checkers.

## Test environments

* local Windows 11, R 4.4.1
* GitHub Actions: ubuntu-latest (R devel, release, oldrel-1), macos-latest
  (release), windows-latest (release)
* win-builder (R-devel): 0 errors, 0 warnings, 1 note (spelling, above)
* R-hub (GitHub Actions): linux, windows, macos, ubuntu-release,
  ubuntu-next, atlas, nosuggests, donttest
