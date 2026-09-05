# Glyos colorway palettes

A named list of color palettes, one per colorway, covering Onell
Design's Glyos line and the Glyos-compatible lines from partner
companies such as TheGodBeast, Spy Monkey Creations, Toyfinity and the
Four Horsemen. Each element is a character vector of two to six hex
colors holding only the plastic and paint colors of that colorway,
ordered so that the first few colors are the most distinct from one
another (body color first, then secondary plastic, then paint accents).
Use
[`glyos_palette()`](https://bmaitner.github.io/rglyos/reference/glyos_palette.md)
to pull colors from a palette and
[glyos_colorways](https://bmaitner.github.io/rglyos/reference/glyos_colorways.md)
for background on each colorway, including which company made it.

## Usage

``` r
glyos_palettes
```

## Format

A named list of character vectors of hex colors.

## Details

Hex values are approximations. Onell Design palettes were sampled from
the reference product photograph in the Official Glyos Database
(<https://database.glyos.com/>) and adjusted against Onell's published
color descriptions. Partner-company palettes were sampled from the lead
photograph of the figure's page on the Glyos Wiki
(<https://glyos.fandom.com/>). Clear, glow-in-the-dark, metallic and
pearlescent plastics cannot be captured by a single flat color; those
palettes reflect how the plastic photographs.

## See also

[`glyos_palette()`](https://bmaitner.github.io/rglyos/reference/glyos_palette.md),
[`glyos_palette_names()`](https://bmaitner.github.io/rglyos/reference/glyos_palette_names.md),
[`glyos_companies()`](https://bmaitner.github.io/rglyos/reference/glyos_companies.md),
[glyos_colorways](https://bmaitner.github.io/rglyos/reference/glyos_colorways.md),
[`glyos_show_palettes()`](https://bmaitner.github.io/rglyos/reference/glyos_show_palettes.md)

## Examples

``` r
length(glyos_palettes)
#> [1] 193
glyos_palettes$spectre
#> [1] "#EEFADA" "#BCC99B" "#9EB49A" "#5FC3A8"
glyos_palettes$kabuto_infection
#> [1] "#E61B11" "#911708" "#F86A62"
```
