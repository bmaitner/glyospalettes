# Regenerates the README figures in man/figures/. Run from the package root.
devtools::load_all(quiet = TRUE)
library(ggplot2)

png("man/figures/palettes.png", width = 1800, height = 2400, res = 200)
glyos_show_palettes(ncol = 3)
dev.off()

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
  scale_fill_glyos_c("spectre") +
  theme_minimal() +
  labs(title = 'scale_fill_glyos_c("spectre")')
p4 <- ggplot(mpg, aes(displ, hwy, colour = cty)) +
  geom_point(size = 2.5) +
  scale_colour_glyos_c("hades") +
  theme_minimal() +
  labs(title = 'scale_colour_glyos_c("hades")')

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
