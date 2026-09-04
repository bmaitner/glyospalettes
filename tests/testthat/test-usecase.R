test_that("palette stats cover every palette with sane values", {
  s <- glyos_palette_stats()
  expect_equal(s$palette, glyos_palette_names())
  expect_true(all(s$min_de >= 0))
  expect_true(all(s$lum_range >= 0 & s$lum_range <= 100))
  expect_true(all(s$hue_spread >= 0 & s$hue_spread <= 360))
  expect_type(s$categorical, "logical")
  expect_type(s$colorblind, "logical")
  expect_type(s$sequential, "logical")
  expect_type(s$diverging, "logical")
  # colorblind-safe implies categorical
  expect_true(all(!s$colorblind | s$categorical))
})

test_that("cvd simulation leaves greys alone and shifts reds and greens together", {
  greys <- hex_to_srgb(c("#000000", "#808080", "#FFFFFF"))
  for (t in names(cvd_matrices)) {
    sim <- simulate_cvd(greys, t)
    expect_equal(unname(sim), unname(greys), tolerance = 0.02)
  }
  rg <- srgb_to_lab(simulate_cvd(hex_to_srgb(c("#FF0000", "#00AA00")), "deutan"))
  normal <- srgb_to_lab(hex_to_srgb(c("#FF0000", "#00AA00")))
  expect_lt(stats::dist(rg), stats::dist(normal))
})

test_that("glyos_find_palettes returns matching, ordered palette names", {
  for (u in c("categorical", "colorblind", "sequential", "diverging")) {
    found <- glyos_find_palettes(u)
    expect_type(found, "character")
    expect_true(all(found %in% glyos_palette_names()), info = u)
    s <- glyos_palette_stats(found)
    expect_true(all(s[[u]]), info = u)
  }
  # obvious cases
  expect_true("glyaxia" %in% glyos_find_palettes("categorical"))
  expect_true("neo_phase" %in% glyos_find_palettes("sequential"))
  expect_false("eclipse" %in% glyos_find_palettes("diverging"))

  onell <- glyos_find_palettes("categorical", company = "Onell Design")
  expect_true(all(glyos_colorways$company[match(onell, glyos_colorways$palette)] == "Onell Design"))
  expect_error(glyos_find_palettes("nope"))
})

test_that("sort orders a palette from dark to light", {
  p <- glyos_palette("hades", sort = TRUE)
  L <- srgb_to_lab(hex_to_srgb(as.character(p)))[, "L"]
  expect_true(all(diff(L) >= 0))
  expect_setequal(as.character(p), glyos_palettes[["hades"]])
})
