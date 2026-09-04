# Regenerates the README figures in man/figures/. Run from the package root.
devtools::load_all(quiet = TRUE)
library(ggplot2)

# One strip per Onell palette, hex codes under the swatches
png("man/figures/palettes-onell.png", width = 2000, height = 2600, res = 200)
glyos_show_palettes(company = "Onell Design", ncol = 3)
dev.off()

# Partner companies, one figure each
for (co in setdiff(glyos_companies(), "Onell Design")) {
  nms <- glyos_palette_names(company = co)
  slug <- gsub("[^a-z0-9]+", "-", tolower(co))
  slug <- gsub("^-|-$", "", slug)
  ncol <- 2
  nrow <- ceiling(length(nms) / ncol)
  png(sprintf("man/figures/palettes-%s.png", slug),
      width = 1600, height = 160 + 260 * nrow, res = 200)
  glyos_show_palettes(company = co, ncol = ncol)
  dev.off()
}

# Colorblind-friendly shortlist
cb <- glyos_find_palettes("colorblind")
png("man/figures/palettes-colorblind.png",
    width = 2000, height = 160 + 260 * ceiling(length(cb) / 3), res = 200)
glyos_show_palettes(cb, ncol = 3)
dev.off()

# ggplot2 examples
p1 <- ggplot(mpg, aes(displ, hwy, colour = drv)) +
  geom_point(size = 2.5) +
  scale_colour_glyos("glyaxia") +
  theme_minimal() +
  labs(title = 'scale_colour_glyos("glyaxia")')
p2 <- ggplot(diamonds, aes(cut, fill = clarity)) +
  geom_bar() +
  scale_fill_glyos("gatekeeper") +
  theme_minimal() +
  labs(title = 'scale_fill_glyos("gatekeeper")')
p3 <- ggplot(faithfuld, aes(waiting, eruptions, fill = density)) +
  geom_tile() +
  scale_fill_glyos_c("kabuto_xenoglow", sort = TRUE) +
  theme_minimal() +
  labs(title = 'scale_fill_glyos_c("kabuto_xenoglow", sort = TRUE)')
p4 <- ggplot(mpg, aes(displ, hwy, colour = class)) +
  geom_point(size = 2.5) +
  scale_colour_glyos("osm_beta_phase") +
  theme_minimal() +
  labs(title = 'scale_colour_glyos("osm_beta_phase")')

png("man/figures/examples.png", width = 2000, height = 1500, res = 180)
grid::grid.newpage()
grid::pushViewport(grid::viewport(layout = grid::grid.layout(2, 2)))
plots <- list(p1, p2, p3, p4)
for (i in seq_along(plots)) {
  print(plots[[i]], vp = grid::viewport(
    layout.pos.row = (i - 1) %/% 2 + 1,
    layout.pos.col = (i - 1) %% 2 + 1
  ))
}
dev.off()

file.remove("man/figures/palettes.png")
