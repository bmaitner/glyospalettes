# rglyos 0.2.1

* Rebuilt every palette from plastic and paint colors only. The first pass
  sampled photographs without masking their backgrounds, so studio greys,
  rock browns and blacks had crept into many palettes (Kabuto Mushi
  Radioactive, for example, is simply neon green and neon pink). Palettes now
  range from 2 to 6 colors.

# rglyos 0.2.0

* Added 148 palettes from 17 Glyos-compatible partner companies (TheGodBeast,
  Spy Monkey Creations, Toyfinity, Four Horsemen Studio, Toy Pizza, Rocom
  Toys, Bio-Masters Design, Rawshark Studio, ManOrMonster? Studios, NiStuff,
  Nemo's Factory, Cappy Space, Banimon, Culture Pirates, October Toys,
  Zullbeasts, Spaced Out Design), for 193 palettes in total.
* `glyos_colorways` gains `company` and `line` columns; `wave` is now
  character and `year` may be `NA` for partner releases.
* New `glyos_companies()`, and `company` / `line` filters on
  `glyos_palette_names()` and `glyos_show_palettes()`.
* New `glyos_find_palettes()` and `glyos_palette_stats()` to shortlist
  palettes that work for categorical, colorblind-safe, sequential or
  diverging use, judged from the colors themselves.
* `glyos_palette()` and the continuous scales gain `sort = TRUE` to order a
  palette from darkest to lightest.
* `glyos_show_palettes()` prints the hex code under each swatch.

# rglyos 0.1.0

* Initial release with 45 palettes based on Onell Design Glyos colorways.
* `glyos_palette()`, `glyos_palette_names()`, `glyos_show_palettes()`.
* ggplot2 scales: `scale_colour_glyos()`, `scale_fill_glyos()` and their
  `_d` / `_c` variants, plus `scale_color_*` aliases.
* `glyos_colorways` metadata table with descriptions and source links.
