#' Display every Glyos palette
#'
#' Draws a swatch strip for each colorway on the current graphics device,
#' labelled with the palette name. Useful for picking a colorway.
#'
#' @param names Optional character vector of palette names to show. Defaults
#'   to all palettes.
#' @param ncol Number of columns to arrange the swatch strips in.
#'
#' @return Invisibly, the character vector of palette names that were drawn.
#' @examples
#' glyos_show_palettes()
#' glyos_show_palettes(c("spectre", "hades", "infection"), ncol = 1)
#' @export
glyos_show_palettes <- function(names = glyos_palette_names(), ncol = 3) {
  names <- match.arg(names, glyos_palette_names(), several.ok = TRUE)
  n <- length(names)
  ncol <- max(1L, min(as.integer(ncol), n))
  nrow <- ceiling(n / ncol)

  old <- graphics::par(mfrow = c(nrow, ncol), mar = c(0.4, 0.4, 1.4, 0.4))
  on.exit(graphics::par(old), add = TRUE)

  for (nm in names) {
    cols <- as.character(glyos_palettes[[nm]])
    k <- length(cols)
    graphics::plot(
      0, 0, type = "n", xlim = c(0, k), ylim = c(0, 1),
      axes = FALSE, xlab = "", ylab = "", main = nm, cex.main = 0.9,
      font.main = 1
    )
    graphics::rect(seq_len(k) - 1, 0, seq_len(k), 1, col = cols, border = NA)
  }
  invisible(names)
}
