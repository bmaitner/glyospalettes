# Glyos colorway metadata

Background information for every palette in
[glyos_palettes](https://bmaitner.github.io/glyospalettes/reference/glyos_palettes.md):
the company and product line it comes from, the colorway name as the
manufacturer uses it, the year and wave of the reference release where
known, a plain-language description of the colors, the reference figure
whose photograph the palette was sampled from, and a link to that
figure's entry in the Official Glyos Database (Onell Design) or the
Glyos Wiki (partner companies).

## Usage

``` r
glyos_colorways
```

## Format

A data frame with one row per palette and the columns:

- palette:

  Palette name, as used by
  [`glyos_palette()`](https://bmaitner.github.io/glyospalettes/reference/glyos_palette.md).

- company:

  Company that produced the colorway, e.g. `"Onell Design"` or
  `"TheGodBeast"`. See
  [`glyos_companies()`](https://bmaitner.github.io/glyospalettes/reference/glyos_companies.md).

- line:

  Product line, e.g. `"Glyos"`, `"Kabuto Mushi"` or `"Battle Tribes"`.

- colorway:

  Colorway or figure name as used by the manufacturer.

- year:

  Year of the reference release, or `NA` where not recorded.

- wave:

  Release wave or series of the reference release, or `NA`.

- n_colours:

  Number of colors in the palette.

- description:

  Description of the plastic and paint colors.

- reference_figure:

  Figure the palette was sampled from.

- source:

  URL of the reference figure's page.

- image:

  Direct URL of the reference photograph the palette was sampled from,
  hosted by the Official Glyos Database or the Glyos Wiki.

## Source

Official Glyos Database, <https://database.glyos.com/>; the Glyos
Transmission Web Log, <https://onelldesign.blogspot.com/>; and the Glyos
Wiki (glyos.fandom.com).

## Examples

``` r
head(glyos_colorways)
#>     palette      company  line    colorway year    wave n_colours
#> 1  standard Onell Design Glyos    Standard 2015 Wave 49         4
#> 2   reverse Onell Design Glyos     Reverse 2013 Wave 28         4
#> 3   spectre Onell Design Glyos     Spectre 2012 Wave 23         4
#> 4     hades Onell Design Glyos Hades Force 2015 Wave 51         4
#> 5 infection Onell Design Glyos   Infection 2013 Wave 27         4
#> 6 neo_phase Onell Design Glyos   Neo Phase 2013 Wave 26         4
#>                                                                                                          description
#> 1 Light blue and gray plastic with gray painted eyes and gray detail lines; the original Pheyden colors from Wave 1.
#> 2                                  Gray and light blue plastic (the Standard colors swapped) with pink painted eyes.
#> 3                                                       Glow-in-the-dark green plastic with aqua green painted eyes.
#> 4                                           Black plastic with aqua green accents and a glow-in-the-dark green head.
#> 5                                                         Clear red plastic, originally developed with The GodBeast.
#> 6                                                                  Clear neon green plastic with green painted eyes.
#>          reference_figure
#> 1   Standard Pheyden MK V
#> 2   Reverse Pheyden MK II
#> 3   Spectre Pheyden MK II
#> 4     Hades Pheyden MK IV
#> 5       Infection Exellis
#> 6 Neo Phase Pheyden MK II
#>                                                            source
#> 1   https://database.glyos.com/2015/10/standard-pheyden-mk-v.html
#> 2   https://database.glyos.com/2013/06/reverse-pheyden-mk-ii.html
#> 3   https://database.glyos.com/2012/09/spectre-pheyden-mk-ii.html
#> 4     https://database.glyos.com/2015/12/hades-pheyden-mk-iv.html
#> 5       https://database.glyos.com/2013/04/infection-exellis.html
#> 6 https://database.glyos.com/2013/02/neo-phase-pheyden-mk-ii.html
#>                                                                                                                                                                                                                                          image
#> 1 https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEh76aYiewzMj-j-RkSI9sGyKKOyfqkR19pKx-tS6HuaWmI3KlKZodOZIOCQeX6MtSHeKZlAYOQG3QrzrFp5Mvrj8R59X3R6B5wO2IKFwzX7YD516-5Ua7OI50Ngv0taPIa-TKf42XUFTYk/s1600/archive-pheyden-standard5.png
#> 2 https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgY9_Z5SokCydA-Gj_BBBx1-AfKsa_H2LoX7a2AnohXglvzwuYrj7yixveHbVP6saGWYkPoF3Mvqqzj688NvehaJstYACQcvfU4nYDnkg50685xXIg6DOZPE-nCvx8HPE2DPqfSgTMn7_o/s1600/Reverse-Pheyden-MK-II-WEB.png
#> 3     https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhCMGxfNHcpD6Hzc97kBSVB30ZtG7di3q_E8m38D1frvoIt6TbryzUzw0ibYLwSOEjkK2KRyXMa0teqrm8DdWY-uXm5tdDHRl_17dCP1uJTv9624L324g5kgBuHTOsWPb55px391lbC9kg/s1600/archive-pheyden-gitd2.jpg
#> 4    https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiap7SKHglCXiWtYp2N7WOef3wUBdM_wPKKqjXrkrpZHZe7kBnIKHHe7OvCnhvKn4D-Rm377Mholbm7ZHfRNQ0THURAHaI2p39pRx-ti5gVX5hhEocNqCYCz3k3Nird7pGT0GHU8Rol2_A/s1600/archive-pheyden-hades4.png
#> 5 https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjxeWzy1cv0_dvvlmumXcwXCDwh8pg7D1oNB8E8xOeNk3bPh5QZf8wR-c_xxgRRqPrT0o9-0w2mrSRSgws8Oz6ZAAl3nkm0EKC6ZdYYnoGRkAlpiB-KmJokM2HeJxGKUBO-zs01YyNUv7A/s1600/archive-exellis-infection.jpg
#> 6 https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjRD13XPwFsNB38_MxVAfOf5xA2V0U-e8rIG_f5qabSC58VqP5m9-mGduWsztdAdQCNQccGl60D3VO0bW05JBobG5xwjpSjEdi7AKXWvhdNUFylv8ByWSuRYgUZjWN4oAvt43GP00c3JnM/s1600/archive-pheyden-neophase2.jpg
table(glyos_colorways$company)
#> 
#>               Banimon    Bio-Masters Design           Cappy Space 
#>                     6                     8                     8 
#>       Culture Pirates  Four Horsemen Studio ManOrMonster? Studios 
#>                     5                    12                    10 
#>        Nemo's Factory               NiStuff          October Toys 
#>                     8                    10                     4 
#>          Onell Design       Rawshark Studio            Rocom Toys 
#>                    45                    10                    10 
#>     Spaced Out Design  Spy Monkey Creations           TheGodBeast 
#>                     3                    18                    10 
#>             Toy Pizza             Toyfinity            Zullbeasts 
#>                    10                    12                     4 
subset(glyos_colorways, company == "TheGodBeast", c(palette, colorway))
#>                      palette           colorway
#> 46           kabuto_standard           Standard
#> 47          kabuto_infection          Infection
#> 48        kabuto_radioactive        Radioactive
#> 49      kabuto_glyaxia_clone      Glyaxia Clone
#> 50          kabuto_scarabite          Scarabite
#> 51           kabuto_xenoglow           Xenoglow
#> 52         kabuto_cerulestar         Cerulestar
#> 53           kabuto_bioberry           Bioberry
#> 54               kabuto_luna               Luna
#> 55 kabuto_sectivorus_supreme Sectivorus Supreme
```
