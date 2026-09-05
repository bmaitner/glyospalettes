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

#' List the companies with palettes in rglyos
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
            "Palette '", key, "' only has ", length(pal), " colours; ",
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

#' @export
print.glyos_palette <- function(x, ...) {
  cols <- as.character(x)
  n <- length(cols)
  key <- attr(x, "name")
  meta <- glyos_colorways[glyos_colorways$palette == key, ]
  cat("Glyos colorway '", key, "' (", n, " colours)\n", sep = "")
  if (nrow(meta) == 1L) {
    cat(meta$company, " / ", meta$line, ": ", meta$colorway, "\n", sep = "")
  }
  cat(cols, sep = " ")
  cat("\n")

  old <- graphics::par(mar = c(0.5, 0.5, 2, 0.5))
  on.exit(graphics::par(old), add = TRUE)
  graphics::plot(
    0, 0, type = "n", xlim = c(0, n), ylim = c(0, 1),
    axes = FALSE, xlab = "", ylab = "",
    main = key, font.main = 1
  )
  graphics::rect(seq_len(n) - 1, 0, seq_len(n), 1, col = cols, border = NA)
  invisible(x)
}
