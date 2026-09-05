# Display Glyos palettes

Draws a swatch strip for each colorway on the current graphics device,
labelled with the palette name and, by default, the hex code under each
swatch. Useful for picking a colorway or for reporting a color that
looks wrong. With no arguments every palette is drawn, which is a lot;
filter by `company`, `line` or `use` to narrow it down.

## Usage

``` r
glyos_show_palettes(
  names = NULL,
  company = NULL,
  line = NULL,
  use = NULL,
  ncol = 3,
  hex = TRUE
)
```

## Arguments

- names:

  Optional character vector of palette names to show. Defaults to every
  palette matching `company`, `line` and `use`.

- company:

  Optional company name to restrict to; see
  [`glyos_companies()`](https://bmaitner.github.io/rglyos/reference/glyos_companies.md).

- line:

  Optional product line to restrict to; see the `line` column of
  [glyos_colorways](https://bmaitner.github.io/rglyos/reference/glyos_colorways.md).

- use:

  Optional use case to restrict to; see
  [`glyos_find_palettes()`](https://bmaitner.github.io/rglyos/reference/glyos_find_palettes.md).

- ncol:

  Number of columns to arrange the swatch strips in.

- hex:

  Logical. Print the hex code under each swatch?

## Value

Invisibly, the character vector of palette names that were drawn.

## Examples

``` r
glyos_show_palettes(company = "Onell Design")

glyos_show_palettes(company = "TheGodBeast", ncol = 2)

glyos_show_palettes(use = "colorblind", ncol = 4)

glyos_show_palettes(c("spectre", "hades", "infection"), ncol = 1)
```
