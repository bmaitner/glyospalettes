# Palette provenance

The palettes in `R/aaa-registry.R` are hand-curated, not generated, so there
is no script here that rebuilds them. This directory records where they came
from.

`reference_figures.json` covers Onell Design. For each candidate palette key
it lists the reference figure in the Official Glyos Database (title, year,
wave, entry URL, product image URL) and the seven dominant colors found in the
central region of the product photograph by k-means clustering, with the
share of pixels in each cluster.

`reference_figures_partners.json` covers the partner companies. It is keyed
by company group and then by Glyos Wiki page title, and holds the wiki image
URL, its size, and the same seven k-means clusters. Not every key in either
file became a palette; near-duplicates (for example `hyper_phase` versus
`neo_phase`) and figures whose photograph was mostly packaging or artwork were
dropped.

The final hex values were chosen from those clusters and adjusted by eye
against the manufacturers' color descriptions where they exist: the Onell
drop announcements on the Glyos Transmission Web Log
(https://onelldesign.blogspot.com/), which often name Pantone references
(Cool Gray 1C/8C/10C for Zorennor, Warm Gray 1C for Neo Frontier, Cool Gray
7C for the Rig Crew accessory sets), and the release lists on the Glyos Wiki
(https://glyos.fandom.com/) for the partner lines.

`make_figures.R` regenerates the README figures in `man/figures/`.
