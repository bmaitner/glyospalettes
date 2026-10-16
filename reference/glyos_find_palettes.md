# Find Glyos palettes that suit a plotting use case

Filters the palettes to those whose colors work for a given job, judged
from the perceptual statistics in
[`glyos_palette_stats()`](https://bmaitner.github.io/glyospalettes/reference/glyos_palette_stats.md).
Many colorways look great on a figure but poor on a chart; this surfaces
the ones that hold up.

## Usage

``` r
glyos_find_palettes(
  use = c("categorical", "colorblind", "sequential", "diverging"),
  company = NULL,
  line = NULL,
  min_colours = 4
)
```

## Arguments

- use:

  One of:

  `"categorical"`

  :   Every pair of colors is clearly distinguishable (minimum Lab
      distance of 20 or more). Good for unordered groups.

  `"colorblind"`

  :   Categorical, and still distinguishable under simulated
      deuteranopia, protanopia and tritanopia (minimum distance 15 or
      more in each).

  `"sequential"`

  :   One hue family (hue spread of 45 degrees or less among the
      chromatic colors) spanning at least 50 units of lightness, so a
      continuous gradient reads as low-to-high. Pair with `sort = TRUE`
      in
      [`glyos_palette()`](https://bmaitner.github.io/glyospalettes/reference/glyos_palette.md)
      or the `_c` scales.

  `"diverging"`

  :   Exactly two distinct hue families plus a light or neutral color to
      sit between them. The curated order is not necessarily dark-A,
      light, dark-B; check
      [`glyos_palette_stats()`](https://bmaitner.github.io/glyospalettes/reference/glyos_palette_stats.md)
      and reorder the colors yourself for a continuous diverging scale.

  The thresholds are deliberately simple heuristics computed by
  [`glyos_palette_stats()`](https://bmaitner.github.io/glyospalettes/reference/glyos_palette_stats.md);
  treat the result as a shortlist to look at with
  [`glyos_show_palettes()`](https://bmaitner.github.io/glyospalettes/reference/glyos_show_palettes.md),
  not a guarantee.

- company, line:

  Optional filters passed to
  [`glyos_palette_names()`](https://bmaitner.github.io/glyospalettes/reference/glyos_palette_names.md).

- min_colours:

  Minimum number of colors the palette must have.

## Value

A character vector of palette names, ordered so that the strongest
candidates for the use case come first.

## Examples

``` r
glyos_find_palettes("colorblind")
#>  [1] "rf_sentinel"             "osm_jack_asteroid"      
#>  [3] "rf_vanguard"             "wom_palidar"            
#>  [5] "infection"               "glyaxia"                
#>  [7] "rf_hun_dred"             "bt_livid_dracosaurian"  
#>  [9] "wom_umbreus"             "baron_dark"             
#> [11] "wor_gol_oceanlord"       "maniax_death_jaguar"    
#> [13] "wom_empyreus"            "rf_maxx_zero"           
#> [15] "osm_astro_nautilus"      "bt_nomadic_orc"         
#> [17] "outlander_ultra_bronze"  "osm_commander_comet"    
#> [19] "bt_crimson_spikesaurian" "zeroids_zobor"          
#> [21] "wom_brutok"              "kots_teal_knight"       
#> [23] "gendrone_union"          "zorennor"               
#> [25] "kaisyriax"               "manglors_manglord"      
#> [27] "kots_purple_knight"      "callgrim_dominus"       
#> [29] "redlaw"                  "bt_cyclops_ice_raider"  
#> [31] "osm_orbitron"            "kabuto_glyaxia_clone"   
#> [33] "maniax_fishstik"         "bt_crystal_crusader"    
#> [35] "maniax_woodsman"         "bt_oozarian"            
glyos_find_palettes("diverging", company = "Onell Design")
#> [1] "glyaxia"  "imperium"
glyos_find_palettes("sequential")
#>  [1] "eclipse"                     "ultra_corps"                
#>  [3] "frontier"                    "callgrim_standard"          
#>  [5] "neo_frontier"                "villser"                    
#>  [7] "hades"                       "dark_nebula"                
#>  [9] "maniax_slapshot"             "kots_lime_knight"           
#> [11] "order_standard"              "smoke"                      
#> [13] "delphi"                      "order_wing_bike"            
#> [15] "zullbeast"                   "psychozor"                  
#> [17] "bt_nomadic_orc"              "zorennor"                   
#> [19] "skaterriun"                  "wor_worian_laser_trooper"   
#> [21] "kabuto_sectivorus_supreme"   "zeroids_zobor"              
#> [23] "metran"                      "banimon_revolutionary_guard"
#> [25] "outlander_crim"              "cosmic_wave"                
#> [27] "bt_savage_adventurer"        "osm_inferno"                
#> [29] "avrobot_gunmetal"            "outlander_gun_metal"        
#> [31] "volkriun"                    "neo_nebula"                 
#> [33] "banimon_apocalypse"          "relgost"                    
#> [35] "banimon_border_patrol"       "bio_hunters"                
#> [37] "redlaw"                      "reydurran"                  
#> [39] "kots_purple_knight"          "kabuto_xenoglow"            
#> [41] "avrobot_deluxe_orange"       "gendrone_union"             
#> [43] "kabuto_cerulestar"           "caliber_dome"               
#> [45] "bt_vampire_lord"             "maniax_golden_monster"      
#> [47] "kots_gauss_armor"            "banimon_red_army_men"       
#> [49] "neo_phase"                   "rf_wrecker"                 
#> [51] "outlander_goldlander"       
```
