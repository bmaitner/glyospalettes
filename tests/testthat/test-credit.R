test_that("glyos_credit names colorway, company and line for one palette", {
  s <- glyos_credit("kots_vice_knight")
  expect_type(s, "character")
  expect_length(s, 1)
  expect_equal(s, "Colors: Vice Knight colorway by Toy Pizza (Knights of the Slice), via the glyospalettes R package.")
  expect_equal(glyos_credit("kots_vice_knight", package = FALSE),
               "Colors: Vice Knight colorway by Toy Pizza (Knights of the Slice).")
})

test_that("glyos_credit groups by company and pluralises", {
  s <- glyos_credit(c("glyaxia", "hades", "kabuto_infection"))
  expect_equal(s, paste0(
    "Colors: Glyaxia Command and Hades Force colorways by Onell Design (Glyos) ",
    "and Infection colorway by TheGodBeast (Kabuto Mushi), via the glyospalettes R package."
  ))
  # three or more companies are separated by semicolons
  three <- glyos_credit(c("glyaxia", "kabuto_infection", "kots_vice_knight"))
  expect_equal(lengths(regmatches(three, gregexpr(";", three, fixed = TRUE))), 2L)
  # duplicates and case-insensitive names collapse
  expect_equal(glyos_credit(c("Glyaxia", "glyaxia")), glyos_credit("glyaxia"))
})

test_that("glyos_credit follows picks and combines back to their sources", {
  p <- glyos_pick(c("glyaxia", "kabuto_infection"), n = 4)
  s <- glyos_credit(p)
  expect_true(grepl("Onell Design", s, fixed = TRUE))
  expect_true(grepl("TheGodBeast", s, fixed = TRUE))
  cmb <- glyos_combine(line = "Kabuto Mushi")
  expect_true(grepl("colorways by TheGodBeast (Kabuto Mushi)", glyos_credit(cmb), fixed = TRUE))
  expect_equal(glyos_credit(glyos_palette("hades")), glyos_credit("hades"))
  expect_equal(glyos_credit(glyos_palette("hades", 8, type = "continuous")), glyos_credit("hades"))
})

test_that("acknowledgment and markdown formats", {
  a <- glyos_credit("glyaxia", format = "acknowledgment")
  expect_true(startsWith(a, "Figure colors are derived from the Glyaxia Command colorway designed by Onell Design (Glyos). Hex values are approximations from the glyospalettes R package (Maitner "))
  expect_true(endsWith(a, ") and imply no endorsement by the designers."))
  a2 <- glyos_credit("glyaxia", format = "acknowledgment", package = FALSE)
  expect_false(grepl("glyospalettes", a2, fixed = TRUE))
  expect_true(grepl("imply no endorsement", a2, fixed = TRUE))

  m <- glyos_credit(c("glyaxia", "wom_empyreus"), format = "markdown")
  expect_true(grepl("[Glyaxia Command](https://database.glyos.com/", m, fixed = TRUE))
  expect_true(grepl("[Empyreus](https://glyos.fandom.com/", m, fixed = TRUE))
})

test_that("glyos_credit validates input", {
  expect_error(glyos_credit("nobody"), "Unknown Glyos colorway")
  expect_error(glyos_credit(character(0)), "palette object or a character vector")
  expect_error(glyos_credit(1:3), "palette object or a character vector")
  expect_error(glyos_credit("glyaxia", format = "footnote"))
})

test_that("the package has a parseable CITATION", {
  cit <- utils::readCitationFile(system.file("CITATION", package = "glyospalettes"),
                                 meta = utils::packageDescription("glyospalettes"))
  expect_s3_class(cit, "bibentry")
  expect_true(grepl("Maitner", format(cit, style = "text"), fixed = TRUE))
})
