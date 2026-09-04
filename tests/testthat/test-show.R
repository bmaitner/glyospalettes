test_that("glyos_show_palettes draws without error", {
  tmp <- tempfile(fileext = ".png")
  grDevices::png(tmp)
  on.exit(grDevices::dev.off(), add = TRUE)
  expect_invisible(glyos_show_palettes())
  expect_equal(glyos_show_palettes(c("spectre", "hades")), c("spectre", "hades"))
  expect_error(glyos_show_palettes("nope"))
})
