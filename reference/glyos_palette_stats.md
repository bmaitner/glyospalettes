# Perceptual statistics for every Glyos palette

Computes, from the hex colors alone, how suitable each palette is for
the common plotting jobs. Used by
[`glyos_find_palettes()`](https://bmaitner.github.io/glyospalettes/reference/glyos_find_palettes.md);
exposed so you can apply your own thresholds.

## Usage

``` r
glyos_palette_stats(names = glyos_palette_names())
```

## Arguments

- names:

  Palette names to compute for. Defaults to all palettes.

## Value

A data frame with one row per palette and the columns:

- palette:

  Palette name.

- n_colours:

  Number of colors.

- min_de:

  Smallest pairwise Lab distance between any two colors. Larger is
  easier to tell apart; 20 is a comfortable floor for categorical use.

- min_de_deutan, min_de_protan, min_de_tritan:

  The same after simulating each color-vision deficiency.

- lum_range:

  Range of CIE lightness (0 to 100) across the palette.

- hue_spread:

  Angular spread of the chromatic colors' hues, in degrees. Near 0 means
  one hue family.

- hue_clusters:

  Number of distinct hue families (hues separated by more than 60
  degrees).

- has_light:

  Whether the palette contains a light or neutral color that can serve
  as a midpoint.

- categorical, colorblind, sequential, diverging:

  Logical flags as used by
  [`glyos_find_palettes()`](https://bmaitner.github.io/glyospalettes/reference/glyos_find_palettes.md).

## Details

Distances are CIE76 (Euclidean in CIE Lab). Color-vision deficiency is
simulated with the Machado, Oliveira and Fernandes (2009) matrices at
full severity for deuteranopia, protanopia and tritanopia. Hue
statistics only consider colors with chroma of at least 20, so grays and
blacks do not count as a hue.

## Examples

``` r
s <- glyos_palette_stats()
head(s[order(-s$min_de_deutan), c("palette", "min_de", "min_de_deutan")])
#>                  palette   min_de min_de_deutan
#> 88       osm_alpha_phase 68.70507      49.76224
#> 78           rf_sentinel 47.62056      48.83391
#> 69 bt_livid_dracosaurian 38.22175      37.96039
#> 76          rf_maxx_zero 40.68568      34.57933
#> 91     osm_jack_asteroid 38.14048      32.93691
#> 92           osm_mystron 33.17829      29.66489
```
