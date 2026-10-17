# Pre-release checklist for glyospalettes. Source the sections one at a time
# from the package root. This folder is in .Rbuildignore and never ships.
#
# The GitHub Actions workflow (.github/workflows/R-CMD-check.yaml) already runs
# R CMD check on Linux/macOS/Windows for every push, so the steps here are the
# ones CRAN asks for beyond that: the --as-cran incoming checks, URL and
# spelling checks, tarball size, and the remote CRAN-like builders.

# 1. Bookkeeping ------------------------------------------------------------
# Bump Version in DESCRIPTION, add a NEWS.md entry, update cran-comments.md.
# usethis::use_version("minor")        # or "patch" / "major"
# usethis::use_release_issue()         # tickable checklist as a GitHub issue

# 2. Regenerate docs, figures and site --------------------------------------
devtools::document()
source("data-raw/make_figures.R")
pkgdown::build_site(preview = FALSE)

# 3. Local checks -----------------------------------------------------------
devtools::test()
chk <- devtools::check(cran = TRUE, incoming = TRUE, remote = TRUE)
stopifnot(length(chk$errors) == 0, length(chk$warnings) == 0)

# URLs in Rd files, README and DESCRIPTION. glyos.fandom.com will report 403
# (bot wall); that is explained in cran-comments.md. Anything else must pass.
urlchecker::url_check()

# Spelling against inst/WORDLIST; add genuine new terms, fix real typos.
spelling::spell_check_package()
# spelling::update_wordlist()          # accept the current list

# Tarball must stay comfortably under CRAN's 5 MB limit. man/figures ships.
tb <- devtools::build(path = tempdir(), quiet = TRUE)
cat(basename(tb), round(file.size(tb) / 1024), "KB\n")
stopifnot(file.size(tb) < 4 * 1024^2)

# 4. Remote builders (results arrive by email / GitHub) ---------------------
devtools::check_win_devel()            # CRAN's Windows R-devel builder
# R-hub v2 runs in this repo's own GitHub Actions (.github/workflows/rhub.yaml).
# First time only: rhub::rhub_doctor(). Pure-R package, so the CRAN-flavoured
# set below is enough; add "clang-asan" etc. only if compiled code appears.
# rhub::rhub_check(platforms = c("linux", "windows", "macos",
#                               "ubuntu-release", "ubuntu-next", "atlas",
#                               "nosuggests", "donttest"))

# 5. Submit -----------------------------------------------------------------
# devtools::release()                  # interactive checklist, then uploads
# After acceptance: usethis::use_github_release(); usethis::use_dev_version()
