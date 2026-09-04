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
  expect_setequal(glyos_colorways$palette, names(glyos_palettes))
  expect_equal(anyDuplicated(glyos_colorways$palette), 0)
  expect_true(all(nzchar(glyos_colorways$description)))
  expect_true(all(nzchar(glyos_colorways$source)))
  expect_equal(glyos_colorways$n_colours,
               unname(lengths(glyos_palettes[glyos_colorways$palette])))
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
  expect_error(glyos_palette("not_a_colorway"), "Unknown Glyos colorway")
})

test_that("print method runs without error", {
  grDevices::pdf(NULL)
  on.exit(grDevices::dev.off(), add = TRUE)
  expect_output(print(glyos_palette("hades")), "hades")
})
