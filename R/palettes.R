#' Glyos colorway palettes
#'
#' A named list of color palettes, one per colorway, covering Onell Design's
#' Glyos line and the Glyos-compatible lines from partner companies such as
#' TheGodBeast, Spy Monkey Creations, Toyfinity and the Four Horsemen. Each
#' element is a character vector of two to six hex colors holding only the
#' plastic and paint colors of that colorway, ordered so that the first few
#' colors are the most distinct from one another (body color first, then
#' secondary plastic, then paint accents). Use [glyos_palette()] to pull colors
#' from a palette and [glyos_colorways] for background on each colorway,
#' including which company made it.
#'
#' @details
#' Hex values are approximations. Onell Design palettes were sampled from the
#' reference product photograph in the Official Glyos Database
#' (<https://database.glyos.com/>) and adjusted against Onell's published
#' color descriptions. Partner-company palettes were sampled from the lead
#' photograph of the figure's page on the Glyos Wiki
#' (<https://glyos.fandom.com/>). Clear, glow-in-the-dark, metallic and
#' pearlescent plastics cannot be captured by a single flat color; those
#' palettes reflect how the plastic photographs.
#'
#' @format A named list of character vectors of hex colors.
#' @seealso [glyos_palette()], [glyos_palette_names()], [glyos_companies()],
#'   [glyos_colorways], [glyos_show_palettes()]
#' @examples
#' length(glyos_palettes)
#' glyos_palettes$spectre
#' glyos_palettes$kabuto_infection
#' @export
glyos_palettes <- stats::setNames(
  lapply(.registry, `[[`, "colours"),
  vapply(.registry, `[[`, character(1), "palette")
)

#' Glyos colorway metadata
#'
#' Background information for every palette in [glyos_palettes]: the company
#' and product line it comes from, the colorway name as the manufacturer uses
#' it, the year and wave of the reference release where known, a
#' plain-language description of the colors, the reference figure whose
#' photograph the palette was sampled from, and a link to that figure's entry
#' in the Official Glyos Database (Onell Design) or the Glyos Wiki (partner
#' companies).
#'
#' @format A data frame with one row per palette and the columns:
#' \describe{
#'   \item{palette}{Palette name, as used by [glyos_palette()].}
#'   \item{company}{Company that produced the colorway, e.g. `"Onell Design"`
#'     or `"TheGodBeast"`. See [glyos_companies()].}
#'   \item{line}{Product line, e.g. `"Glyos"`, `"Kabuto Mushi"` or
#'     `"Battle Tribes"`.}
#'   \item{colorway}{Colorway or figure name as used by the manufacturer.}
#'   \item{year}{Year of the reference release, or `NA` where not recorded.}
#'   \item{wave}{Release wave or series of the reference release, or `NA`.}
#'   \item{n_colours}{Number of colors in the palette.}
#'   \item{description}{Description of the plastic and paint colors.}
#'   \item{reference_figure}{Figure the palette was sampled from.}
#'   \item{source}{URL of the reference figure's page.}
#'   \item{image}{Direct URL of the reference photograph the palette was
#'     sampled from, hosted by the Official Glyos Database or the Glyos Wiki.}
#' }
#' @source Official Glyos Database, <https://database.glyos.com/>; the Glyos
#'   Transmission Web Log, <https://onelldesign.blogspot.com/>; and the Glyos
#'   Wiki, <https://glyos.fandom.com/>.
#' @examples
#' head(glyos_colorways)
#' table(glyos_colorways$company)
#' subset(glyos_colorways, company == "TheGodBeast", c(palette, colorway))
#' @export
glyos_colorways <- local({
  col <- function(field, type) vapply(.registry, `[[`, type, field)
  out <- data.frame(
    palette = col("palette", character(1)),
    company = col("company", character(1)),
    line = col("line", character(1)),
    colorway = col("colorway", character(1)),
    year = col("year", integer(1)),
    wave = col("wave", character(1)),
    n_colours = vapply(.registry, function(x) length(x$colours), integer(1)),
    description = col("description", character(1)),
    reference_figure = col("reference", character(1)),
    source = col("source", character(1)),
    stringsAsFactors = FALSE
  )
  out$image <- unname(.registry_images[out$palette])
  rownames(out) <- NULL
  out
})

#' List the companies with palettes in glyospalettes
#'
#' @return A character vector of company names, sorted with Onell Design
#'   first, that can be passed to the `company` argument of
#'   [glyos_palette_names()] and [glyos_show_palettes()].
#' @examples
#' glyos_companies()
#' @export
glyos_companies <- function() {
  x <- unique(glyos_colorways$company)
  c("Onell Design", sort(setdiff(x, "Onell Design")))
}

#' List the available Glyos palettes
#'
#' @param company Optional company name (see [glyos_companies()]) to restrict
#'   the list to. Matched case-insensitively and by unique prefix, so
#'   `"godbeast"` and `"spy monkey"` work.
#' @param line Optional product line (see the `line` column of
#'   [glyos_colorways]) to restrict the list to, matched the same way.
#'
#' @return A character vector of palette names accepted by [glyos_palette()]
#'   and the `scale_*_glyos()` functions.
#' @examples
#' glyos_palette_names()
#' glyos_palette_names(company = "TheGodBeast")
#' glyos_palette_names(line = "Battle Tribes")
#' @export
glyos_palette_names <- function(company = NULL, line = NULL) {
  keep <- rep(TRUE, nrow(glyos_colorways))
  if (!is.null(company)) {
    keep <- keep & glyos_colorways$company == match_label(company, glyos_colorways$company, "company")
  }
  if (!is.null(line)) {
    keep <- keep & glyos_colorways$line == match_label(line, glyos_colorways$line, "line")
  }
  glyos_colorways$palette[keep]
}

match_label <- function(x, choices, what) {
  if (!is.character(x) || length(x) != 1L) {
    stop("`", what, "` must be a single string.", call. = FALSE)
  }
  u <- unique(choices)
  norm <- function(s) gsub("[^a-z0-9]", "", tolower(s))
  hit <- u[norm(u) == norm(x)]
  if (length(hit) == 0L) hit <- u[startsWith(norm(u), norm(x))]
  if (length(hit) == 0L) hit <- u[grepl(norm(x), norm(u), fixed = TRUE)]
  if (length(hit) != 1L) {
    stop(
      "Unknown or ambiguous ", what, " '", x, "'. Choose one of: ",
      paste(u, collapse = ", "), ".",
      call. = FALSE
    )
  }
  hit
}

# Resolve a user-supplied palette name (any case, spaces or hyphens allowed)
# to its key in glyos_palettes, or error.
palette_key <- function(name) {
  if (!is.character(name) || length(name) != 1L) {
    stop("`name` must be a single string.", call. = FALSE)
  }
  key <- tolower(name)
  key <- gsub("[ -]+", "_", key)
  if (!key %in% names(glyos_palettes)) {
    stop(
      "Unknown Glyos colorway '", name, "'. See glyos_palette_names().",
      call. = FALSE
    )
  }
  key
}

#' Get colors from a Glyos colorway
#'
#' Returns `n` colors from the named colorway, either the first `n` curated
#' colors (`type = "discrete"`) or `n` colors interpolated across the whole
#' palette (`type = "continuous"`).
#'
#' @param name Palette name. Case-insensitive; see [glyos_palette_names()].
#' @param n Number of colors wanted. Defaults to every color in the palette.
#' @param type Either `"discrete"` (default) to return the curated colors as
#'   they are, or `"continuous"` to interpolate `n` colors across the palette
#'   with [grDevices::colorRampPalette()].
#' @param strict Logical. For discrete palettes, error when `n` exceeds the
#'   number of curated colors (default). If `FALSE`, interpolate to `n` colors
#'   instead.
#' @param sort Logical. If `TRUE`, order the colors from darkest to lightest
#'   (by CIE lightness) before selecting or interpolating. Useful when a
#'   palette is used as a sequential gradient; see [glyos_find_palettes()].
#'
#' @return A character vector of hex colors with class `"glyos_palette"`, which
#'   has a print method that draws the swatches.
#' @examples
#' glyos_palette("spectre")
#' glyos_palette("glyaxia", 3)
#' glyos_palette("hades", 12, type = "continuous")
#' glyos_palette("hades", 12, type = "continuous", sort = TRUE)
#' glyos_palette("wom_empyreus")
#'
#' # base graphics
#' barplot(1:5, col = glyos_palette("gatekeeper"))
#' @export
glyos_palette <- function(name, n = NULL, type = c("discrete", "continuous"),
                          strict = TRUE, sort = FALSE) {
  type <- match.arg(type)
  key <- palette_key(name)
  pal <- glyos_palettes[[key]]
  if (isTRUE(sort)) {
    L <- srgb_to_lab(hex_to_srgb(pal))[, "L"]
    pal <- pal[order(L)]
  }

  if (is.null(n)) n <- length(pal)
  n <- as.integer(n)
  if (length(n) != 1L || is.na(n) || n < 1L) {
    stop("`n` must be a single positive integer.", call. = FALSE)
  }

  out <- switch(
    type,
    continuous = grDevices::colorRampPalette(pal)(n),
    discrete = {
      if (n > length(pal)) {
        if (strict) {
          stop(
            "Palette '", key, "' only has ", length(pal), " colors; ",
            n, " were requested. Use type = \"continuous\" or ",
            "strict = FALSE to interpolate.",
            call. = FALSE
          )
        }
        grDevices::colorRampPalette(pal)(n)
      } else {
        pal[seq_len(n)]
      }
    }
  )
  structure(out, class = "glyos_palette", name = key)
}

#' Combine palettes: one color from each of a set of colorways
#'
#' Takes one color from each named palette, or from every palette of a
#' company or product line, and returns them as a single categorical palette
#' named by the colorway each color came from. This is the quick way to get
#' "one color per Kabuto Mushi" or "one color per Battle Tribes figure".
#'
#' By default the first color of each palette is used, which is the main
#' plastic color and so is faithful to each figure but can repeat across a
#' line cast from shared plastics. `distinct = TRUE` instead picks, for each
#' palette in turn, the color from that palette that is farthest (in CIE
#' Lab) from the colors already chosen, which keeps the result legible on a
#' chart at some cost to fidelity. For a stricter selection that also drops
#' colors with poor contrast against the background, see [glyos_pick()].
#'
#' @param palettes Character vector of palette names; see
#'   [glyos_palette_names()]. May be omitted when `company` or `line` is
#'   given.
#' @param company,line Optional filters passed to [glyos_palette_names()];
#'   every matching palette contributes one color.
#' @param which Which color to take from each palette (1 is the main plastic
#'   color). Palettes with fewer colors contribute their last one.
#' @param distinct Logical. Choose each palette's contribution to be as
#'   different as possible from those already chosen, instead of position
#'   `which`?
#'
#' @return A named character vector of hex colors with class
#'   `"glyos_palette"`, one per palette, in the order of `palettes` or of
#'   [glyos_palette_names()]. Pass `unname()`d to
#'   [ggplot2::scale_colour_manual()].
#' @seealso [glyos_pick()], [glyos_palette()]
#' @examples
#' glyos_combine(c("standard", "spectre", "hades", "infection", "glyaxia"))
#' glyos_combine(line = "Kabuto Mushi")
#' glyos_combine(line = "Kabuto Mushi", distinct = TRUE)
#' glyos_combine(company = "Toyfinity", which = 2)
#'
#' library(ggplot2)
#' ggplot(mpg, aes(displ, hwy, color = drv)) +
#'   geom_point(size = 2.5) +
#'   scale_colour_manual(values = unname(glyos_combine(c("glyaxia", "hades", "infection"))))
#' @export
glyos_combine <- function(palettes = NULL, company = NULL, line = NULL,
                          which = 1L, distinct = FALSE) {
  keys <- resolve_palette_set(palettes, company, line)
  which <- as.integer(which)
  if (length(which) != 1L || is.na(which) || which < 1L) {
    stop("`which` must be a single positive integer.", call. = FALSE)
  }
  if (isTRUE(distinct)) {
    chosen <- character(0)
    for (p in keys) {
      pal <- glyos_palettes[[p]]
      if (length(chosen) == 0L) {
        pick <- pal[1L]
      } else {
        lab_pal <- srgb_to_lab(hex_to_srgb(pal))
        lab_chosen <- srgb_to_lab(hex_to_srgb(chosen))
        d <- apply(lab_pal, 1, function(row) {
          min(sqrt(colSums((t(lab_chosen) - row)^2)))
        })
        pick <- pal[which.max(d)]
      }
      chosen <- c(chosen, pick)
    }
    cols <- stats::setNames(chosen, keys)
  } else {
    cols <- vapply(keys, function(p) {
      pal <- glyos_palettes[[p]]
      pal[min(which, length(pal))]
    }, character(1))
  }
  structure(cols, class = "glyos_palette",
            name = set_label(palettes, company, line, keys))
}

#' @export
print.glyos_palette <- function(x, ...) {
  cols <- as.character(x)
  n <- length(cols)
  key <- attr(x, "name")
  meta <- glyos_colorways[glyos_colorways$palette == key, ]
  if (isTRUE(attr(x, "picked"))) {
    cat("Glyos pick of ", n, " colors from ", key, "\n", sep = "")
    cat(attr(x, "style"), " background ", attr(x, "background"),
        if (isTRUE(attr(x, "colorblind"))) ", colorblind-safe" else "",
        ", min distance ", round(attr(x, "min_distance"), 1), "\n", sep = "")
  } else if (nrow(meta) == 1L) {
    cat("Glyos colorway '", key, "' (", n, " colors)\n", sep = "")
    cat(meta$company, " / ", meta$line, ": ", meta$colorway, "\n", sep = "")
  } else {
    cat("Glyos combined palette '", key, "' (", n, " colors)\n", sep = "")
  }
  if (!is.null(names(x))) {
    cat(paste0(names(x), " = ", cols), sep = "\n")
  } else {
    cat(cols, sep = " ")
    cat("
")
  }

  bg <- attr(x, "background")
  old <- graphics::par(mar = c(0.5, 0.5, 2, 0.5),
                       bg = if (is.null(bg)) "white" else bg)
  on.exit(graphics::par(old), add = TRUE)
  graphics::plot(
    0, 0, type = "n", xlim = c(0, n), ylim = c(0, 1),
    axes = FALSE, xlab = "", ylab = "",
    main = key, font.main = 1,
    col.main = if (!is.null(bg) && relative_luminance(bg) < 0.2) "white" else "black"
  )
  graphics::rect(seq_len(n) - 1, 0, seq_len(n), 1, col = cols, border = NA)
  invisible(x)
}
