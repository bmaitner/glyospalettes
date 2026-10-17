# Attribution text for the designers of the colorways ------------------------

# Join a character vector in prose: "a", "a and b", "a, b and c".
prose_join <- function(x) {
  n <- length(x)
  if (n <= 1L) return(x)
  if (n == 2L) return(paste(x, collapse = " and "))
  paste0(paste(x[-n], collapse = ", "), " and ", x[n])
}

# Year used in the package reference: the CRAN publication date when there is
# one, otherwise the current year.
credit_year <- function() {
  d <- tryCatch(utils::packageDescription("glyospalettes")$`Date/Publication`,
                error = function(e) NULL)
  if (is.null(d) || is.na(d)) d <- Sys.Date()
  format(as.Date(substr(as.character(d), 1, 10)), "%Y")
}

# Palette keys behind a credit request: a palette object (plain, combined or
# picked) or a vector of names.
credit_keys <- function(x) {
  if (inherits(x, "glyos_palette")) {
    keys <- if (!is.null(names(x))) names(x) else attr(x, "name")
    keys <- keys[keys %in% names(glyos_palettes)]
    if (length(keys) == 0L) {
      stop("Could not identify the source palettes of this object.", call. = FALSE)
    }
    return(unique(keys))
  }
  if (!is.character(x) || length(x) == 0L) {
    stop("`x` must be a palette object or a character vector of palette names.",
         call. = FALSE)
  }
  unique(vapply(x, palette_key, character(1), USE.NAMES = FALSE))
}

#' Credit the designers of the colorways behind a plot
#'
#' Builds a short attribution sentence naming the colorways used and the
#' companies that designed them, suitable for a figure caption or an
#' acknowledgments section. Naming the designer of a color scheme is ordinary
#' factual attribution; the longer form also states that the colors are
#' approximations and imply no endorsement, which is the wording journals
#' tend to want.
#'
#' @param x What to credit: a palette name, a character vector of names, or a
#'   `glyos_palette` object. Objects from [glyos_pick()] and [glyos_combine()]
#'   carry their source palettes, so the credit covers every colorway that
#'   contributed a color.
#' @param format One of:
#'   \describe{
#'     \item{`"caption"`}{One sentence for a figure caption, e.g. `Colors:
#'       Vice Knight colorway by Toy Pizza (Knights of the Slice), via the
#'       glyospalettes R package.`}
#'     \item{`"acknowledgment"`}{Two sentences in the register of an
#'       acknowledgments section, naming the designers and stating that the
#'       hex values are approximations that imply no endorsement.}
#'     \item{`"markdown"`}{The caption with each colorway linked to its
#'       reference page, for R Markdown, Quarto or pkgdown captions.}
#'   }
#' @param package Logical. Mention the glyospalettes package? Set to `FALSE`
#'   when the package is cited elsewhere in the text.
#'
#' @return A single character string.
#' @seealso [glyos_colorways] for the underlying metadata;
#'   `citation("glyospalettes")` for the package reference.
#' @examples
#' glyos_credit("kots_vice_knight")
#' glyos_credit(c("glyaxia", "hades", "kabuto_infection"))
#' glyos_credit(glyos_pick(c("glyaxia", "kabuto_infection"), n = 4))
#' glyos_credit("glyaxia", format = "acknowledgment")
#' cat(glyos_credit(c("glyaxia", "wom_empyreus"), format = "markdown"))
#'
#' library(ggplot2)
#' ggplot(mpg, aes(displ, hwy, color = drv)) +
#'   geom_point(size = 2.5) +
#'   scale_color_glyos("glyaxia") +
#'   labs(caption = glyos_credit("glyaxia"))
#' @export
glyos_credit <- function(x, format = c("caption", "acknowledgment", "markdown"),
                         package = TRUE) {
  format <- match.arg(format)
  keys <- credit_keys(x)
  meta <- glyos_colorways[match(keys, glyos_colorways$palette), ]

  label <- if (format == "markdown") {
    paste0("[", meta$colorway, "](", meta$source, ")")
  } else {
    meta$colorway
  }

  groups <- character(0)
  for (co in unique(meta$company)) {
    rows <- meta$company == co
    names_co <- unique(label[rows])
    lines_co <- unique(meta$line[rows])
    noun <- if (length(names_co) > 1L) "colorways" else "colorway"
    verb <- if (format == "acknowledgment") " designed by " else " by "
    groups <- c(groups, paste0(
      prose_join(names_co), " ", noun, verb, co,
      " (", paste(lines_co, collapse = ", "), ")"
    ))
  }
  body <- prose_join(groups)
  if (length(groups) > 2L) body <- paste(groups, collapse = "; ")

  pkg <- "the glyospalettes R package"
  if (format == "acknowledgment") {
    out <- paste0("Figure colors are derived from the ", body, ".")
    if (isTRUE(package)) {
      out <- paste0(
        out, " Hex values are approximations from ", pkg, " (Maitner ",
        credit_year(), ") and imply no endorsement by the designers."
      )
    } else {
      out <- paste0(out, " Hex values are approximations and imply no ",
                    "endorsement by the designers.")
    }
    return(out)
  }

  out <- paste0("Colors: ", body)
  if (isTRUE(package)) out <- paste0(out, ", via ", pkg)
  paste0(out, ".")
}
