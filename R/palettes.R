#' Glyos colorway palettes
#'
#' A named list of color palettes, one per Glyos colorway. Each element is a
#' character vector of hex colors ordered so that the first few colors are the
#' most distinct from one another (body color first, then secondary plastic,
#' then paint accents). Use [glyos_palette()] to pull colors from a palette
#' and [glyos_colorways] for background on each colorway.
#'
#' @details
#' Hex values are approximations. They were curated by sampling the dominant
#' colors of the reference product photograph for each colorway in the
#' Official Glyos Database (<https://database.glyos.com/>) and adjusting them
#' against Onell Design's published color descriptions (for example
#' "Pappysoup Green/Olive Green with light green visors"). Plastics that are
#' clear, glow-in-the-dark, metallic or pearlescent cannot be captured by a
#' single flat color; those palettes reflect how the plastic photographs.
#'
#' @format A named list of character vectors of hex colors.
#' @seealso [glyos_palette()], [glyos_palette_names()], [glyos_colorways],
#'   [glyos_show_palettes()]
#' @examples
#' names(glyos_palettes)
#' glyos_palettes$spectre
#' @export
glyos_palettes <- list(
  standard = c("#8ED7EE", "#4D91A9", "#A8A79A", "#34617B", "#1C3648"),
  reverse = c("#B3B6AC", "#728D9F", "#87DAF1", "#576D7C", "#E2769B"),
  spectre = c("#EEFADA", "#BCC99B", "#9EB49A", "#5FC3A8", "#1C1C19"),
  hades = c("#0F1210", "#38403C", "#537667", "#73B79C", "#A3EAD6"),
  infection = c("#7A0A12", "#D00615", "#E04A5C", "#F0A0A8", "#D9DBCE"),
  neo_phase = c("#0A5C4A", "#09B450", "#0ED675", "#84EDAF", "#F5F5EB"),
  glyaxia = c("#F2B61D", "#1575CC", "#124380", "#B76816", "#25263A"),
  ecroyex = c("#0C93D3", "#162E53", "#0B6EA9", "#C8202E", "#0A1227"),
  gatekeeper = c("#8E4EA6", "#D20C7A", "#651B70", "#E64DA5", "#A6054A"),
  gatekeeper_classic = c("#F72E88", "#40062E", "#E10E5E", "#6E2C90", "#F075C3"),
  volkriun = c("#667A4E", "#212914", "#809571", "#3F4436", "#A6BD9A"),
  zorennor = c("#C1C0BA", "#63666A", "#8FC7E0", "#202020", "#EBEAE6"),
  reydurran = c("#D80728", "#A39C91", "#8A0110", "#1A1418", "#E85A6E"),
  sonesidar = c("#DCA135", "#EDEDE6", "#C37912", "#5FB332", "#A2A092"),
  ivorinium = c("#E3F0F0", "#ACB1A9", "#4A7FB5", "#858475", "#CCD7D5"),
  stealth = c("#E1EDF2", "#A2AEAC", "#CDD7D7", "#6D7465", "#8F9894"),
  classified = c("#0A0708", "#5E6854", "#2D362B", "#A9AC8B", "#171915"),
  mordireus = c("#E63167", "#F775AA", "#B53752", "#FBB4D0", "#453A3A"),
  cosmic_wave = c("#084EAC", "#74B2DC", "#042E7C", "#1C84DA", "#D3ECF7"),
  eclipse = c("#141014", "#BDC5C4", "#47494E", "#EAEEEA", "#6D7276"),
  frontier = c("#DB5F39", "#452E26", "#EAEFEB", "#88301F", "#1A0E0D"),
  neo_nebula = c("#8F78C2", "#2B1A44", "#B9A6DA", "#563C7A", "#C0BEB4"),
  dark_nebula = c("#6C2582", "#160E15", "#B588CE", "#441053", "#894F9F", "#E4CBF2"),
  villser = c("#0D6B6F", "#090909", "#75BEB1", "#074444", "#AEF4E0"),
  metran = c("#204880", "#B1B1A4", "#06102F", "#6581AB", "#325D9F"),
  ultra_corps = c("#9B9C9B", "#0E0C0B", "#E6E6E6", "#545553", "#BCBCBB"),
  redlaw = c("#711E8B", "#BA97C0", "#A437C6", "#2B1A25", "#E7DFE6"),
  sendollest = c("#815A4B", "#5FC3B8", "#431D13", "#9E7B6C", "#1E7F78"),
  rig_crew = c("#AF5E32", "#271917", "#C8B28C", "#6DB35A", "#853E1B"),
  skaterriun = c("#603C2D", "#DD792F", "#D3D8D3", "#3F2820", "#805137"),
  bio_phantom = c("#391C9C", "#C61E57", "#4D4266", "#DB688D", "#D6C6CB", "#261F39"),
  aetheric = c("#583E63", "#181719", "#471A87", "#716F68", "#37333B"),
  white_skull = c("#920C21", "#220F11", "#C82D43", "#52131C", "#DB9AA4"),
  gendrone_union = c("#B9653F", "#282323", "#DA9E78", "#803621", "#E7E1DA"),
  gendrone_alliance = c("#9A4486", "#1A1619", "#B072A6", "#461E3F", "#CDA4C8"),
  neo_frontier = c("#817672", "#191618", "#C3C0BD", "#585555", "#E1E2E2"),
  imperium = c("#2E6778", "#DEA94C", "#7ADAE9", "#C8202E", "#1F3F48"),
  bio_hunters = c("#5B6877", "#C8202E", "#A9AEB3", "#23272C", "#78889C"),
  lsa = c("#1F6331", "#AC7B38", "#3C8D5D", "#0E2C1A", "#D5DBD3"),
  neo_voss = c("#239D88", "#67CEC1", "#507D65", "#30B7A4", "#A1A491"),
  relgost = c("#81AEA4", "#446974", "#ABD3CA", "#323F41", "#628A86"),
  crayhunter = c("#16545B", "#E45D43", "#39747B", "#AD3025", "#C0C9AE"),
  sunstorm = c("#E3953B", "#9F2B01", "#EBB869", "#CD7320", "#F7E1AD", "#3D1912"),
  smoke = c("#726E60", "#C0C4C2", "#423A36", "#9E9F98", "#F3F6F8"),
  delphi = c("#954833", "#BFBDB4", "#4C190F", "#927464", "#DCDFDC")
)

#' Glyos colorway metadata
#'
#' Background information for every palette in [glyos_palettes]: the colorway
#' name as used by Onell Design, the year and wave of the reference release,
#' a plain-language description of the colors, the reference figure whose
#' product photograph the palette was sampled from, and a link to that
#' figure's entry in the Official Glyos Database.
#'
#' @format A data frame with one row per palette and the columns:
#' \describe{
#'   \item{palette}{Palette name, as used by [glyos_palette()].}
#'   \item{colorway}{Colorway name as used by Onell Design.}
#'   \item{year}{Year of the reference release.}
#'   \item{wave}{Onell Design wave number of the reference release.}
#'   \item{n_colours}{Number of colors in the palette.}
#'   \item{description}{Description of the plastic and paint colors.}
#'   \item{reference_figure}{Figure the palette was sampled from.}
#'   \item{source}{URL of the reference figure in the Official Glyos Database.}
#' }
#' @source Official Glyos Database, <https://database.glyos.com/>, and the
#'   Glyos Transmission Web Log, <https://onelldesign.blogspot.com/>.
#' @examples
#' head(glyos_colorways)
#' glyos_colorways[glyos_colorways$year < 2010, c("palette", "description")]
#' @export
glyos_colorways <- local({
  db <- "https://database.glyos.com/"
  rows <- list(
    list("standard", "Standard", 2015L, 49L,
         "Light blue and grey plastic with grey painted eyes and grey detail lines; the original Pheyden colors from Wave 1.",
         "Standard Pheyden MK V", "2015/10/standard-pheyden-mk-v.html"),
    list("reverse", "Reverse", 2013L, 28L,
         "Grey and light blue plastic (the Standard colors swapped) with pink painted eyes.",
         "Reverse Pheyden MK II", "2013/06/reverse-pheyden-mk-ii.html"),
    list("spectre", "Spectre", 2012L, 23L,
         "Glow-in-the-dark green plastic with aqua green painted eyes and black accents.",
         "Spectre Pheyden MK II", "2012/09/spectre-pheyden-mk-ii.html"),
    list("hades", "Hades Force", 2015L, 51L,
         "Black plastic with aqua green accents and a glow-in-the-dark green head.",
         "Hades Pheyden MK IV", "2015/12/hades-pheyden-mk-iv.html"),
    list("infection", "Infection", 2013L, 27L,
         "Clear red plastic, originally developed with The GodBeast.",
         "Infection Exellis", "2013/04/infection-exellis.html"),
    list("neo_phase", "Neo Phase", 2013L, 26L,
         "Clear neon green plastic with green painted eyes.",
         "Neo Phase Pheyden MK II", "2013/02/neo-phase-pheyden-mk-ii.html"),
    list("glyaxia", "Glyaxia Command", 2014L, 36L,
         "Yellow and blue plastic with black visors and white tampo printing.",
         "Glyan Glyaxia Standard", "2014/05/glyan-glyaxia-standard.html"),
    list("ecroyex", "Ecroyex", 2013L, 32L,
         "Bright blue and dark blue plastic with red visors, inspired by Takara's Acroyear figures.",
         "Standard Ecroyex Glyan", "2013/12/standard-ecroyex-glyan.html"),
    list("gatekeeper", "Neo Gatekeeper", 2013L, 30L,
         "Warm purple and magenta plastic with black visors and white tampo printing.",
         "Neo Gatekeeper Sullonev Pheyden", "2013/09/neo-gatekeeper-sullonev-pheyden.html"),
    list("gatekeeper_classic", "Gatekeeper", 2010L, 11L,
         "The original 2010 Gatekeeper run: hot pink and dark purple plastic with black.",
         "Gatekeeper Vollus Pheyden", "2010/09/gatekeeper-vollus-pheyden.html"),
    list("volkriun", "Task Force Volkriun", 2011L, 16L,
         "Pappysoup green and olive green plastic with light green visors.",
         "Glyan Task Force Volkriun", "2011/07/glyan-task-force-volkriun.html"),
    list("zorennor", "Zorennor Exploration Division", 2012L, 20L,
         "Light grey and grey plastic (Pantone Cool Gray 1C and 8C) with light blue visors and Cool Gray 10C detail lines.",
         "Glyan Zorennor Exploration Division", "2012/03/zorennor-exploration-division-glyan.html"),
    list("reydurran", "Reydurran Science Division", 2013L, 27L,
         "True red plastic with black visors and white tampo, alongside the warm grey Engineer Corps.",
         "Glyan Reydurran Science Division", "2013/04/glyan-reydurran-science-division.html"),
    list("sonesidar", "Sonesidar Rescue Unit", 2013L, 26L,
         "White and yellorange plastic with green visors and yellorange tampo printing.",
         "Glyan Sonesidar Rescue Unit", "2013/02/glyan-sonesidar-rescue-unit.html"),
    list("ivorinium", "Ivorinium", 2013L, 28L,
         "Pearlescent white plastic with blue painted eyes.",
         "Ivorinium Pheyden", "2013/06/ivorinium-pheyden.html"),
    list("stealth", "Stealth", 2013L, 28L,
         "Clear colorless plastic with no paint applications.",
         "Stealth Pheyden MK III", "2013/06/stealth-pheyden-mk-iii.html"),
    list("classified", "Classified", 2012L, 23L,
         "Solid black plastic with grey visors or painted eyes.",
         "Classified Pheyden MK III", "2012/09/classified-pheyden-mk-iii.html"),
    list("mordireus", "Mordireus", 2015L, 45L,
         "Neon clear pink plastic.",
         "Mordireus Mutation Skeleden", "2015/05/mordireus-mutation-skeleden.html"),
    list("cosmic_wave", "Cosmic Wave", 2008L, 3L,
         "Clear blue and clear colorless plastic.",
         "Cosmic Wave Pheyden", "2008/03/cosmic-wave-pheyden.html"),
    list("eclipse", "Eclipse", 2016L, 58L,
         "Black and white plastic.",
         "Pheyden Eclipse MK II", "2016/09/pheyden-eclipse-mk-ii.html"),
    list("frontier", "Frontier", 2016L, 58L,
         "White, orange and brown plastic.",
         "Pheyden Frontier MK II", "2016/09/pheyden-frontier-mk-ii.html"),
    list("neo_nebula", "Neo Nebula", 2012L, 24L,
         "Light purple and dark purple plastic with grey detail lines.",
         "Neo Nebula Pheyden", "2012/10/neo-nebula-pheyden.html"),
    list("dark_nebula", "Dark Nebula", 2019L, 83L,
         "Deep purple plastic with lighter purple paint and black.",
         "Glyan Dark Nebula", "2019/09/glyan-dark-nebula.html"),
    list("villser", "Villser Standard", 2018L, 70L,
         "Black plastic with dark teal and pale aqua paint.",
         "Villser Standard MK II", "2018/01/villser-standard-mk-ii.html"),
    list("metran", "Metran Security Command", 2015L, 42L,
         "Metran blue plastic with grey accents and white tampo printing.",
         "Glyan Metran Security Command", "2015/01/glyan-metran-security-command.html"),
    list("ultra_corps", "Gendrone Ultra Corps", 2014L, 34L,
         "Ultra silver plastic with black visors and white tampo printing.",
         "Gendrone Ultra Corps Noboto", "2014/02/gendrone-ultra-corps-noboto.html"),
    list("redlaw", "Redlaw", 2014L, 41L,
         "Clear purple plastic with metallic silver accents and black detail lines.",
         "Redlaw Phanost", "2014/11/redlaw-phanost.html"),
    list("sendollest", "Sendollest Guard", 2015L, 44L,
         "Ultra bronze metallic plastic with aqua and dark aqua accents.",
         "Noboto Sendollest Guard", "2015/03/noboto-sendollest-guard.html"),
    list("rig_crew", "Rig Crew", 2014L, 39L,
         "Brown and black plastic with sand accents and green visors.",
         "Glyan Rig Crew Standard", "2014/09/glyan-rig-crew-standard.html"),
    list("skaterriun", "Skaterriun Skull Commando", 2017L, 63L,
         "Brown plastic with orange and white paint.",
         "Glyan Skaterriun Skull Comando", "2017/04/glyan-skatteriun-skull-comando.html"),
    list("bio_phantom", "Bio Phantom", 2022L, 95L,
         "Clear violet plastic with pink and magenta paint.",
         "Pheyden Bio Phantom", "2022/12/pheyden-bio-phantom.html"),
    list("aetheric", "Core Aetheric", 2022L, 95L,
         "Dark grey-green plastic with violet paint and black.",
         "Glyan Core Aetheric Clone", "2022/12/glyan-core-aetheric-clone.html"),
    list("white_skull", "Strike Team White Skull", 2011L, 18L,
         "Red and maroon plastic with white and black details.",
         "Glyan Strike Team White Skull", "2011/10/glyan-strike-team-white-skull.html"),
    list("gendrone_union", "Gendrone Union", 2017L, 69L,
         "Metallic copper plastic with black and cream accents.",
         "Glyan Gendrone Union Commando", "2017/11/glyan-gendrone-union-commando.html"),
    list("gendrone_alliance", "Gendrone Alliance", 2017L, 67L,
         "Metallic magenta plastic with black and pale pink accents.",
         "Gobon Gendrone Alliance", "2017/09/gobon-gendrone-alliance.html"),
    list("neo_frontier", "Neo Frontier", 2019L, 85L,
         "Warm grey plastic (Pantone Warm Gray 1C) with black and white paint.",
         "Glyan Neo Frontier", "2019/12/glyan-neo-frontier.html"),
    list("imperium", "Gendrone Imperium", 2015L, 48L,
         "Metallic teal blue plastic with red visors and, on Elder Exellis, gold paint.",
         "Elder Exellis Gendrone Imperium", "2015/09/elder-exellis-gendrone-imperium.html"),
    list("bio_hunters", "Bio Hunters", 2015L, 46L,
         "Gunmetal silver plastic with red visors and white tampo printing.",
         "Noboto Bio Hunters", "2015/06/noboto-bio-hunters.html"),
    list("lsa", "Lost Sincroid Army", 2014L, 37L,
         "Green plastic with gold and cream paint, in the old Rechlen and Aves inspired colors.",
         "Standard Lost Sincroid Army", "2014/06/standard-lost-sincroid-army.html"),
    list("neo_voss", "Neo Voss", 2012L, 21L,
         "Clear aqua green plastic, based on sea glass.",
         "Neo Voss Phaseon", "2012/05/neo-voss-phaseon.html"),
    list("relgost", "Relgost Marine Division", 2011L, 17L,
         "Seafoam green and greyish blue plastic.",
         "Glyan Relgost Marine Division", "2011/08/glyan-relgost-marine-division.html"),
    list("crayhunter", "Crayhunter", 2014L, 38L,
         "Grayeen blue and redorange plastic with black visors and white tampo printing.",
         "Glyan Crayhunter Standard", "2014/07/glyan-crayhunter-standard.html"),
    list("sunstorm", "Sunstorm", 2016L, 53L,
         "Pearlescent yellow plastic with orange paint and black accents.",
         "Varteryx Sunstorm", "2016/02/varteryx-sunstorm.html"),
    list("smoke", "Clear Smoke", 2012L, 21L,
         "Clear grey plastic with no paint applications.",
         "Clear Smoke Glyan", "2012/05/clear-smoke-glyan.html"),
    list("delphi", "Delphi", 2020L, 89L,
         "Reddish brown plastic with bone and dark brown paint.",
         "Delphi Monbarann", "2020/12/delphi-monbarann.html")
  )
  out <- data.frame(
    palette = vapply(rows, `[[`, character(1), 1),
    colorway = vapply(rows, `[[`, character(1), 2),
    year = vapply(rows, `[[`, integer(1), 3),
    wave = vapply(rows, `[[`, integer(1), 4),
    description = vapply(rows, `[[`, character(1), 5),
    reference_figure = vapply(rows, `[[`, character(1), 6),
    source = paste0(db, vapply(rows, `[[`, character(1), 7)),
    stringsAsFactors = FALSE
  )
  out$n_colours <- unname(lengths(glyos_palettes[out$palette]))
  out <- out[, c("palette", "colorway", "year", "wave", "n_colours",
                 "description", "reference_figure", "source")]
  rownames(out) <- NULL
  out
})

#' List the available Glyos palettes
#'
#' @return A character vector of palette names accepted by [glyos_palette()]
#'   and the `scale_*_glyos()` functions.
#' @examples
#' glyos_palette_names()
#' @export
glyos_palette_names <- function() {
  names(glyos_palettes)
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
#'
#' @return A character vector of hex colors with class `"glyos_palette"`, which
#'   has a print method that draws the swatches.
#' @examples
#' glyos_palette("spectre")
#' glyos_palette("glyaxia", 3)
#' glyos_palette("hades", 12, type = "continuous")
#'
#' # base graphics
#' barplot(1:5, col = glyos_palette("gatekeeper"))
#' @export
glyos_palette <- function(name, n = NULL, type = c("discrete", "continuous"),
                          strict = TRUE) {
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
  cat("Glyos colorway '", attr(x, "name"), "' (", n, " colours)\n", sep = "")
  cat(cols, sep = " ")
  cat("\n")

  old <- graphics::par(mar = c(0.5, 0.5, 2, 0.5))
  on.exit(graphics::par(old), add = TRUE)
  graphics::plot(
    0, 0, type = "n", xlim = c(0, n), ylim = c(0, 1),
    axes = FALSE, xlab = "", ylab = "",
    main = attr(x, "name"), font.main = 1
  )
  graphics::rect(seq_len(n) - 1, 0, seq_len(n), 1, col = cols, border = NA)
  invisible(x)
}
