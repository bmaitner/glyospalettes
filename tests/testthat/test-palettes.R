test_that("all palettes are valid hex colors", {
  for (nm in names(glyos_palettes)) {
    cols <- glyos_palettes[[nm]]
    expect_true(is.character(cols), info = nm)
    expect_true(all(grepl("^#[0-9A-Fa-f]{6}$", cols)), info = nm)
    expect_gte(length(cols), 4)
    expect_equal(anyDuplicated(cols), 0, info = nm)
  }
})

test_that("palette names are lowercase snake_case and unique", {
  nms <- glyos_palette_names()
  expect_true(all(grepl("^[a-z][a-z0-9_]*$", nms)))
  expect_equal(anyDuplicated(nms), 0)
  expect_setequal(nms, names(glyos_palettes))
})

test_that("metadata table matches the palette list", {
  expect_s3_class(glyos_colorways, "data.frame")
  expect_equal(glyos_colorways$palette, names(glyos_palettes))
  expect_equal(anyDuplicated(glyos_colorways$palette), 0)
  expect_true(all(nzchar(glyos_colorways$description)))
  expect_true(all(nzchar(glyos_colorways$company)))
  expect_true(all(nzchar(glyos_colorways$line)))
  expect_true(all(grepl("^https://", glyos_colorways$source)))
  expect_equal(glyos_colorways$n_colours, unname(lengths(glyos_palettes)))
  expect_type(glyos_colorways$year, "integer")
  expect_type(glyos_colorways$wave, "character")
})

test_that("companies are listed with Onell first and cover every row", {
  cos <- glyos_companies()
  expect_equal(cos[1], "Onell Design")
  expect_setequal(cos, unique(glyos_colorways$company))
  expect_gt(length(cos), 10)
})

test_that("palette names can be filtered by company and line", {
  gb <- glyos_palette_names(company = "TheGodBeast")
  expect_true(length(gb) > 0)
  expect_true(all(glyos_colorways$company[match(gb, glyos_colorways$palette)] == "TheGodBeast"))
  expect_equal(glyos_palette_names(company = "godbeast"), gb)
  expect_equal(glyos_palette_names(company = "the god beast"), gb)

  bt <- glyos_palette_names(line = "Battle Tribes")
  expect_true(all(startsWith(bt, "bt_")))
  expect_equal(glyos_palette_names(company = "spy monkey", line = "battle tribes"), bt)

  expect_error(glyos_palette_names(company = "nope"), "Unknown or ambiguous")
  expect_error(glyos_palette_names(company = c("a", "b")), "single string")
})

test_that("glyos_palette returns the full palette by default", {
  p <- glyos_palette("spectre")
  expect_s3_class(p, "glyos_palette")
  expect_equal(as.character(p), glyos_palettes[["spectre"]])
  expect_equal(attr(p, "name"), "spectre")
})

test_that("glyos_palette subsets and interpolates", {
  full <- glyos_palettes[["glyaxia"]]
  expect_equal(as.character(glyos_palette("glyaxia", 3)), full[1:3])

  cont <- glyos_palette("glyaxia", 20, type = "continuous")
  expect_length(cont, 20)
  expect_true(all(grepl("^#[0-9A-Fa-f]{6}$", cont)))

  expect_error(glyos_palette("glyaxia", 50), "only has")
  loose <- glyos_palette("glyaxia", 50, strict = FALSE)
  expect_length(loose, 50)
})

test_that("glyos_palette matches names case-insensitively and errors on unknown", {
  expect_equal(
    as.character(glyos_palette("Spectre")),
    as.character(glyos_palette("spectre"))
  )
  expect_equal(
    as.character(glyos_palette("Kabuto Infection")),
    glyos_palettes[["kabuto_infection"]]
  )
  expect_error(glyos_palette("not_a_colorway"), "Unknown Glyos colorway")
})

test_that("print method runs without error and names the company", {
  grDevices::pdf(NULL)
  on.exit(grDevices::dev.off(), add = TRUE)
  expect_output(print(glyos_palette("hades")), "Onell Design")
  expect_output(print(glyos_palette("wom_empyreus")), "Spy Monkey")
})
