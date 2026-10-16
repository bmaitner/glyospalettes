min_pair <- function(hex, ...) {
  d <- pick_distances(hex, ...)
  min(d[upper.tri(d)])
}

test_that("glyos_pick returns n distinct colors drawn from the pool", {
  p <- glyos_pick(c("glyaxia", "hades"), n = 5)
  expect_s3_class(p, "glyos_palette")
  expect_length(p, 5)
  expect_equal(anyDuplicated(unname(p)), 0)
  pool <- c(glyos_palettes$glyaxia, glyos_palettes$hades)
  expect_true(all(unname(p) %in% pool))
  expect_true(all(names(p) %in% c("glyaxia", "hades")))
  for (i in seq_along(p)) expect_true(p[[i]] %in% glyos_palettes[[names(p)[i]]])
  expect_equal(attr(p, "min_distance"), min_pair(unname(p)))
  expect_equal(attr(p, "style"), "light")
  expect_equal(attr(p, "background"), "#FFFFFF")
  expect_equal(attr(p, "name"), "glyaxia + hades")
})

test_that("light and dark styles drop colors that vanish into the background", {
  # zorennor's light gray and light blue fail the 3:1 check against white
  light <- glyos_pick("zorennor", n = 2)
  expect_false("#C1C0BA" %in% unname(light))
  expect_false("#8FC7E0" %in% unname(light))
  expect_true(all(contrast_ratio(unname(light), "#FFFFFF") >= 3))

  # hades is black-bodied: its darkest colors fail on a dark theme
  dark <- glyos_pick("hades", n = 2, style = "dark")
  expect_false("#0F1210" %in% unname(dark))
  expect_true(all(contrast_ratio(unname(dark), "#121212") >= 3))
  expect_equal(attr(dark, "background"), "#121212")

  # disabling the filter lets everything back in
  all_in <- glyos_pick("spectre", n = 4, min_contrast = 1)
  expect_setequal(unname(all_in), glyos_palettes$spectre)

  # a custom background overrides the style
  custom <- glyos_pick("spectre", n = 3, style = "light", background = "#000000")
  expect_true(all(contrast_ratio(unname(custom), "#000000") >= 3))
})

test_that("the chosen subset is the most dispersed one when the search is exhaustive", {
  pals <- c("glyaxia", "hades")
  p <- glyos_pick(pals, n = 3, min_contrast = 1)
  pool <- unique(toupper(c(glyos_palettes$glyaxia, glyos_palettes$hades)))
  d <- pick_distances(pool)
  best <- max(apply(utils::combn(length(pool), 3), 2, function(i) min(d[i, i][upper.tri(d[i, i])])))
  expect_equal(attr(p, "min_distance"), best)
})

test_that("greedy search matches exhaustive on a moderate pool", {
  pool <- unique(unlist(glyos_palettes[glyos_palette_names(line = "Battle Tribes")]))
  d <- pick_distances(pool)
  ex <- choose_subset(d, 4, max_exhaustive = 1e6)
  gr <- choose_subset(d, 4, max_exhaustive = 0)
  expect_equal(subset_score(d, gr), subset_score(d, ex), tolerance = 1e-6)
  # and is never far off on a pool where it does not match exactly
  pool2 <- unique(unlist(glyos_palettes[glyos_palette_names(line = "Kabuto Mushi")]))
  d2 <- pick_distances(pool2)
  expect_gte(subset_score(d2, choose_subset(d2, 4, max_exhaustive = 0)),
             0.9 * subset_score(d2, choose_subset(d2, 4, max_exhaustive = 1e6)))
})

test_that("colorblind and grayscale change the criterion", {
  pals <- glyos_palette_names(line = "Battle Tribes")
  normal <- glyos_pick(pals, n = 4, min_contrast = 1)
  cb <- glyos_pick(pals, n = 4, colorblind = TRUE, min_contrast = 1)
  expect_true(attr(cb, "colorblind"))
  expect_gte(min_pair(unname(cb), colorblind = TRUE), min_pair(unname(normal), colorblind = TRUE) - 1e-9)
  expect_equal(attr(cb, "min_distance"), min_pair(unname(cb), colorblind = TRUE))

  grey <- glyos_pick(pals, n = 4, style = "grayscale", min_contrast = 1)
  L <- srgb_to_lab(hex_to_srgb(unname(grey)))[, "L"]
  expect_equal(attr(grey, "min_distance"), min(diff(sort(L))))
  L0 <- srgb_to_lab(hex_to_srgb(unname(normal)))[, "L"]
  expect_gte(min(diff(sort(L))), min(diff(sort(L0))) - 1e-9)
})

test_that("results are ordered so leading subsets stay dispersed", {
  p <- glyos_pick(line = "Kabuto Mushi", n = 5, min_contrast = 1)
  d <- pick_distances(unname(p))
  expect_equal(unname(which.max(d[1, ])), 2L)
})

test_that("company and line filters feed the pool and label the result", {
  byline <- glyos_pick(line = "Kabuto Mushi", n = 4)
  expect_true(all(names(byline) %in% glyos_palette_names(line = "Kabuto Mushi")))
  expect_equal(attr(byline, "name"), "kabuto mushi")

  both <- glyos_pick(company = "spy monkey", line = "battle tribes", n = 3)
  expect_equal(attr(both, "name"), "spy monkey creations / battle tribes")

  mixed <- glyos_pick("glyaxia", company = "Toyfinity", n = 4, min_contrast = 1)
  expect_true(all(names(mixed) %in% c("glyaxia", glyos_palette_names(company = "Toyfinity"))))
  expect_true(startsWith(attr(mixed, "name"), "glyaxia + "))
})

test_that("glyos_pick validates its inputs and reports an empty pool", {
  # kabuto_radioactive has two colors and its neon green fails the contrast check
  expect_error(glyos_pick("kabuto_radioactive", n = 3), "Only 1 of the 2 pooled colors")
  expect_error(glyos_pick("kabuto_radioactive", n = 3, min_contrast = 1), "Only 2 of the 2 pooled colors")
  expect_error(glyos_pick(), "Give `palettes`")
  expect_error(glyos_pick(character(0)), "character vector")
  expect_error(glyos_pick("glyaxia", n = 0), "positive integer")
  expect_error(glyos_pick("glyaxia", n = 2, background = "white"), "hex color")
  expect_error(glyos_pick("nobody", n = 2), "Unknown Glyos colorway")
  expect_error(glyos_pick("glyaxia", n = 2, style = "sepia"))
  expect_error(glyos_pick(company = "nope", n = 2), "Unknown or ambiguous")
  one <- glyos_pick("glyaxia", n = 1)
  expect_length(one, 1)
  expect_equal(attr(one, "min_distance"), Inf)
})

test_that("print method describes a pick", {
  grDevices::pdf(NULL)
  on.exit(grDevices::dev.off(), add = TRUE)
  expect_output(print(glyos_pick(c("glyaxia", "hades"), n = 3, style = "dark",
                                 colorblind = TRUE)),
                "pick of 3 colors from glyaxia \\+ hades")
  expect_output(print(glyos_pick("glyaxia", n = 3)), "min distance")
})
