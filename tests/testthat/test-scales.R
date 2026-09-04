library(ggplot2)

test_that("discrete scales assign palette colors in order", {
  p <- ggplot(mpg, aes(displ, hwy, colour = drv)) +
    geom_point() +
    scale_colour_glyos_d("glyaxia")
  b <- ggplot_build(p)
  used <- unique(b$data[[1]]$colour)
  expect_setequal(used, glyos_palettes[["glyaxia"]][1:3])

  p_rev <- ggplot(mpg, aes(displ, hwy, colour = drv)) +
    geom_point() +
    scale_colour_glyos_d("glyaxia", reverse = TRUE)
  used_rev <- unique(ggplot_build(p_rev)$data[[1]]$colour)
  expect_setequal(used_rev, rev(glyos_palettes[["glyaxia"]][1:3]))
})

test_that("discrete scales interpolate when data has more levels than colors", {
  p <- ggplot(mpg, aes(displ, hwy, colour = class)) +
    geom_point() +
    scale_colour_glyos_d("eclipse")
  used <- unique(ggplot_build(p)$data[[1]]$colour)
  expect_length(used, length(unique(mpg$class)))
})

test_that("fill scales work", {
  p <- ggplot(mpg, aes(class, fill = drv)) +
    geom_bar() +
    scale_fill_glyos("hades")
  used <- unique(ggplot_build(p)$data[[1]]$fill)
  expect_setequal(used, glyos_palettes[["hades"]][1:3])
})

test_that("continuous scales produce a gradient", {
  p <- ggplot(faithfuld, aes(waiting, eruptions, fill = density)) +
    geom_tile() +
    scale_fill_glyos_c("infection")
  fills <- ggplot_build(p)$data[[1]]$fill
  expect_gt(length(unique(fills)), 10)

  p2 <- ggplot(mpg, aes(displ, hwy, colour = cty)) +
    geom_point() +
    scale_colour_glyos("spectre", discrete = FALSE)
  expect_s3_class(ggplot_build(p2), "ggplot_built")
})

test_that("american spellings are aliases", {
  expect_identical(scale_color_glyos, scale_colour_glyos)
  expect_identical(scale_color_glyos_d, scale_colour_glyos_d)
  expect_identical(scale_color_glyos_c, scale_colour_glyos_c)
})
