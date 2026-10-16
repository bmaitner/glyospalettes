#' Display Glyos palettes
#'
#' Draws a swatch strip for each colorway on the current graphics device,
#' labeled with the palette name and, by default, the hex code under each
#' swatch. Useful for picking a colorway or for reporting a color that looks
#' wrong. With no arguments every palette is drawn, which is a lot; filter by
#' `company`, `line` or `use` to narrow it down.
#'
#' @param names Optional character vector of palette names to show. Defaults
#'   to every palette matching `company`, `line` and `use`.
#' @param company Optional company name to restrict to; see
#'   [glyos_companies()].
#' @param line Optional product line to restrict to; see the `line` column of
#'   [glyos_colorways].
#' @param use Optional use case to restrict to; see [glyos_find_palettes()].
#' @param ncol Number of columns to arrange the swatch strips in.
#' @param hex Logical. Print the hex code under each swatch?
#'
#' @return Invisibly, the character vector of palette names that were drawn.
#' @examples
#' glyos_show_palettes(company = "Onell Design")
#' glyos_show_palettes(company = "TheGodBeast", ncol = 2)
#' glyos_show_palettes(use = "colorblind", ncol = 4)
#' glyos_show_palettes(c("spectre", "hades", "infection"), ncol = 1)
#' @export
glyos_show_palettes <- function(names = NULL, company = NULL, line = NULL,
                                use = NULL, ncol = 3, hex = TRUE) {
  if (is.null(names)) {
    names <- glyos_palette_names(company = company, line = line)
    if (!is.null(use)) {
      names <- intersect(names, glyos_find_palettes(use))
    }
  } else {
    names <- match.arg(names, glyos_palette_names(), several.ok = TRUE)
  }
  n <- length(names)
  if (n == 0L) {
    stop("No palettes match the requested filters.", call. = FALSE)
  }
  ncol <- max(1L, min(as.integer(ncol), n))
  nrow <- ceiling(n / ncol)

  old <- graphics::par(mfrow = c(nrow, ncol), mar = c(0.2, 0.4, 1.4, 0.4))
  on.exit(graphics::par(old), add = TRUE)

  ylim <- if (hex) c(-0.45, 1) else c(0, 1)
  for (nm in names) {
    cols <- as.character(glyos_palettes[[nm]])
    k <- length(cols)
    graphics::plot(
      0, 0, type = "n", xlim = c(0, k), ylim = ylim,
      axes = FALSE, xlab = "", ylab = "", main = nm, cex.main = 0.9,
      font.main = 1, xaxs = "i", yaxs = "i"
    )
    graphics::rect(seq_len(k) - 1, 0, seq_len(k), 1, col = cols, border = NA)
    if (hex) {
      graphics::text(
        seq_len(k) - 0.5, -0.22, labels = cols,
        cex = 0.55, family = "mono", xpd = NA
      )
    }
  }
  invisible(names)
}
