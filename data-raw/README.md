# Palette provenance

The palettes in `R/palettes.R` are hand-curated, not generated, so there is no
script here that rebuilds them. This directory records where they came from.

`reference_figures.json` lists, for each candidate palette key, the reference
figure in the Official Glyos Database (title, year, wave, entry URL, product
image URL) and the seven dominant colors found in the central region of the
product photograph by k-means clustering, with the share of pixels in each
cluster. Not every key in the file became a palette; near-duplicates (for
example `hyper_phase` versus `neo_phase`, or `black_skull` versus
`ultra_corps`) were dropped.

The final hex values were chosen from those clusters and adjusted by eye
against Onell Design's color descriptions in the drop announcements on the
Glyos Transmission Web Log (https://onelldesign.blogspot.com/). Where Onell
names a Pantone reference (Cool Gray 1C/8C/10C for Zorennor, Warm Gray 1C for
Neo Frontier, Cool Gray 7C for the Rig Crew accessory sets) the standard sRGB
conversion of that Pantone swatch was used as the anchor.

Metadata for each palette lives in the `glyos_colorways` data frame in
`R/palettes.R`.
