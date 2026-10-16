#' Glyos color and fill scales for ggplot2
#'
#' Color and fill scales that use a Glyos colorway palette. The `_d` variants
#' are for discrete data, the `_c` variants for continuous data, and
#' `scale_colour_glyos()` / `scale_fill_glyos()` choose between the two with
#' the `discrete` argument. `scale_color_*` spellings are aliases.
#'
#' @param palette Name of a Glyos colorway. See [glyos_palette_names()].
#' @param discrete Logical. If `TRUE` (default) build a discrete scale,
#'   otherwise a continuous gradient scale.
#' @param reverse Logical. Reverse the order of colors in the palette?
#' @param sort Logical, continuous scales only. Order the palette from darkest
#'   to lightest before building the gradient, so the scale reads as
#'   low-to-high. See [glyos_find_palettes()] for palettes that suit this.
#' @param ... Additional arguments passed on to
#'   [ggplot2::discrete_scale()] (discrete) or
#'   [ggplot2::scale_colour_gradientn()] / [ggplot2::scale_fill_gradientn()]
#'   (continuous).
#'
#' @details
#' Discrete scales draw the first `n` colors of the palette, where `n` is the
#' number of levels in the data. If the data has more levels than the palette
#' has colors, the palette is interpolated with [grDevices::colorRampPalette()]
#' so that every level still receives a distinct color; expect the result to be
#' less legible than the curated colors.
#'
#' @return A ggplot2 scale object.
#' @examples
#' library(ggplot2)
#'
#' ggplot(mpg, aes(displ, hwy, color = class)) +
#'   geom_point(size = 3) +
#'   scale_colour_glyos("glyaxia")
#'
#' ggplot(diamonds, aes(cut, fill = clarity)) +
#'   geom_bar() +
#'   scale_fill_glyos_d("gatekeeper")
#'
#' ggplot(faithfuld, aes(waiting, eruptions, fill = density)) +
#'   geom_tile() +
#'   scale_fill_glyos_c("spectre")
#' @name scale_glyos
NULL

glyos_pal <- function(palette, reverse = FALSE) {
  function(n) {
    cols <- glyos_palette(palette, n = n, type = "discrete", strict = FALSE)
    cols <- as.character(cols)
    if (reverse) cols <- rev(cols)
    cols
  }
}

#' @rdname scale_glyos
#' @export
scale_colour_glyos_d <- function(palette = "standard", reverse = FALSE, ...) {
  ggplot2::discrete_scale(
    aesthetics = "color",
    palette = glyos_pal(palette, reverse),
    ...
  )
}

#' @rdname scale_glyos
#' @export
scale_fill_glyos_d <- function(palette = "standard", reverse = FALSE, ...) {
  ggplot2::discrete_scale(
    aesthetics = "fill",
    palette = glyos_pal(palette, reverse),
    ...
  )
}

#' @rdname scale_glyos
#' @export
scale_colour_glyos_c <- function(palette = "standard", reverse = FALSE,
                                 sort = FALSE, ...) {
  cols <- as.character(glyos_palette(palette, sort = sort))
  if (reverse) cols <- rev(cols)
  ggplot2::scale_colour_gradientn(colours = cols, ...)
}

#' @rdname scale_glyos
#' @export
scale_fill_glyos_c <- function(palette = "standard", reverse = FALSE,
                               sort = FALSE, ...) {
  cols <- as.character(glyos_palette(palette, sort = sort))
  if (reverse) cols <- rev(cols)
  ggplot2::scale_fill_gradientn(colours = cols, ...)
}

#' @rdname scale_glyos
#' @export
scale_colour_glyos <- function(palette = "standard", discrete = TRUE,
                               reverse = FALSE, sort = FALSE, ...) {
  if (discrete) {
    scale_colour_glyos_d(palette = palette, reverse = reverse, ...)
  } else {
    scale_colour_glyos_c(palette = palette, reverse = reverse, sort = sort, ...)
  }
}

#' @rdname scale_glyos
#' @export
scale_fill_glyos <- function(palette = "standard", discrete = TRUE,
                             reverse = FALSE, sort = FALSE, ...) {
  if (discrete) {
    scale_fill_glyos_d(palette = palette, reverse = reverse, ...)
  } else {
    scale_fill_glyos_c(palette = palette, reverse = reverse, sort = sort, ...)
  }
}

#' @rdname scale_glyos
#' @export
scale_color_glyos_d <- scale_colour_glyos_d

#' @rdname scale_glyos
#' @export
scale_color_glyos_c <- scale_colour_glyos_c

#' @rdname scale_glyos
#' @export
scale_color_glyos <- scale_colour_glyos
