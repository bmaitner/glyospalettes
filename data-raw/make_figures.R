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

# glyos_combine(): one color per palette, first-color and distinct variants
draw_named <- function(cols, title, bg = "white") {
  k <- length(cols)
  dark <- relative_luminance(bg) < 0.2
  plot(0, 0, type = "n", xlim = c(0, k), ylim = c(-0.45, 1), axes = FALSE,
       xlab = "", ylab = "", main = title, cex.main = 0.9, font.main = 1,
       xaxs = "i", yaxs = "i")
  rect(-1, -1, k + 1, 2, col = bg, border = NA)
  rect(seq_len(k) - 1, 0, seq_len(k), 1, col = cols, border = NA)
  lab <- if (is.null(names(cols))) as.character(cols) else names(cols)
  text(seq_len(k) - 0.5, -0.22, labels = lab, cex = 0.5, xpd = NA,
       srt = if (k > 8) 30 else 0, col = if (dark) "white" else "black")
}
lines <- c("Kabuto Mushi", "Robo Force", "Battle Tribes", "Outer Space Men")
png("man/figures/combine-examples.png", width = 2000, height = 1100, res = 200)
old <- par(mfrow = c(length(lines), 2), mar = c(0.2, 0.4, 1.4, 0.4))
for (ln in lines) {
  draw_named(glyos_combine(line = ln), sprintf('glyos_combine(line = "%s")', ln))
  draw_named(glyos_combine(line = ln, distinct = TRUE),
             sprintf('glyos_combine(line = "%s", distinct = TRUE)', ln))
}
par(old)
dev.off()

# glyos_pick(): the same pool picked for four plot styles
pool <- c("glyaxia", "hades", "infection", "neo_phase", "gatekeeper")
draw_pick <- function(p, title) {
  bg <- attr(p, "background")
  draw_named(stats::setNames(as.character(p), as.character(p)), title, bg = bg)
}
png("man/figures/pick-examples.png", width = 2000, height = 900, res = 200)
par(mfrow = c(2, 2), mar = c(0.2, 0.4, 1.4, 0.4))
draw_pick(glyos_pick(pool, n = 5), 'glyos_pick(pool, 5)')
draw_pick(glyos_pick(pool, n = 5, style = "dark"), 'glyos_pick(pool, 5, style = "dark")')
draw_pick(glyos_pick(pool, n = 5, colorblind = TRUE), 'glyos_pick(pool, 5, colorblind = TRUE)')
draw_pick(glyos_pick(pool, n = 5, style = "grayscale"), 'glyos_pick(pool, 5, style = "grayscale")')
dev.off()

# ggplot2 examples
p1 <- ggplot(mpg, aes(displ, hwy, colour = drv)) +
  geom_point(size = 2.5) +
  scale_colour_glyos("glyaxia") +
  theme_minimal() +
  labs(title = 'scale_colour_glyos("glyaxia")')
p2 <- ggplot(diamonds, aes(cut, fill = cut)) +
  geom_bar(show.legend = FALSE) +
  scale_fill_glyos("rf_vanguard") +
  theme_minimal() +
  labs(title = 'scale_fill_glyos("rf_vanguard")', x = NULL)
p3 <- ggplot(faithfuld, aes(waiting, eruptions, fill = density)) +
  geom_raster() +
  scale_fill_glyos_c("cosmic_wave", sort = TRUE) +
  theme_minimal() +
  labs(title = 'scale_fill_glyos_c("cosmic_wave", sort = TRUE)')
p4 <- ggplot(economics_long, aes(date, value01, colour = variable)) +
  geom_line(linewidth = 0.8) +
  scale_colour_manual(values = unname(glyos_combine(pool))) +
  theme_minimal() +
  labs(title = 'glyos_combine(c("glyaxia", "hades", ...))', y = NULL)

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

