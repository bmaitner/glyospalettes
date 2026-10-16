# glyospalettes 0.3.0

* New `glyos_pick()` pools the colors of one or more palettes (or of a whole
  company or product line), drops those with poor WCAG contrast against a
  light, dark or grayscale background, and returns the `n` colors whose
  closest pair is farthest apart in CIE Lab, optionally judged under
  simulated color-vision deficiency.
* New `glyos_combine()` takes one color from each of a set of palettes, so a
  product line becomes a categorical palette with one color per figure;
  `distinct = TRUE` spreads the choices out for legibility.
* Both return named vectors (color by source palette) and print with their
  provenance; picks draw their swatches on the background they were chosen
  for. These mirror `tf_pick()` and `tf_team_palette()` in the sibling
  transformerpalettes package.

# glyospalettes 0.2.2

* The package is now called glyospalettes (it started life as rglyos), to
  match its sibling transformerpalettes. Function names are unchanged;
  reinstall with `pak::pak("bmaitner/glyospalettes")`. The old GitHub URL
  redirects.

# glyospalettes 0.2.1

* Rebuilt every palette from plastic and paint colors only. The first pass
  sampled photographs without masking their backgrounds, so studio grays,
  rock browns and blacks had crept into many palettes (Kabuto Mushi
  Radioactive, for example, is simply neon green and neon pink). Palettes now
  range from 2 to 6 colors.
* `glyos_colorways` gains an `image` column with a direct link to the
  reference photograph.
* New pkgdown site at <https://bmaitner.github.io/glyospalettes/> with a filterable
  palette browser (colors, provenance, reference photos) and prefilled GitHub
  issue forms for suggesting palette changes, submitting cleaner photos and
  proposing new colorways.

# glyospalettes 0.2.0

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

# glyospalettes 0.1.0

* Initial release with 45 palettes based on Onell Design Glyos colorways.
* `glyos_palette()`, `glyos_palette_names()`, `glyos_show_palettes()`.
* ggplot2 scales: `scale_colour_glyos()`, `scale_fill_glyos()` and their
  `_d` / `_c` variants, plus `scale_color_*` aliases.
* `glyos_colorways` metadata table with descriptions and source links.
