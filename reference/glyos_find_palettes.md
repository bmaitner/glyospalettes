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
#> [13] "wom_empyreus"            "bt_savage_destroyer"    
#> [15] "rf_maxx_zero"            "osm_astro_nautilus"     
#> [17] "bt_nomadic_orc"          "outlander_ultra_bronze" 
#> [19] "osm_commander_comet"     "bt_crimson_spikesaurian"
#> [21] "zeroids_zobor"           "wom_brutok"             
#> [23] "kots_teal_knight"        "gendrone_union"         
#> [25] "zorennor"                "kaisyriax"              
#> [27] "manglors_manglord"       "kots_purple_knight"     
#> [29] "callgrim_dominus"        "redlaw"                 
#> [31] "bt_cyclops_ice_raider"   "osm_orbitron"           
#> [33] "kabuto_glyaxia_clone"    "maniax_fishstik"        
#> [35] "bt_crystal_crusader"     "maniax_woodsman"        
#> [37] "bt_oozarian"            
glyos_find_palettes("diverging", company = "Onell Design")
#> [1] "glyaxia"  "imperium"
glyos_find_palettes("sequential")
#>  [1] "wor_baron_ironblast"         "eclipse"                    
#>  [3] "ultra_corps"                 "frontier"                   
#>  [5] "callgrim_standard"           "neo_frontier"               
#>  [7] "villser"                     "hades"                      
#>  [9] "dark_nebula"                 "maniax_slapshot"            
#> [11] "kots_lime_knight"            "order_standard"             
#> [13] "smoke"                       "delphi"                     
#> [15] "order_wing_bike"             "zullbeast"                  
#> [17] "psychozor"                   "bt_nomadic_orc"             
#> [19] "zorennor"                    "skaterriun"                 
#> [21] "wor_worian_laser_trooper"    "bt_savage_destroyer"        
#> [23] "maniax_atom"                 "kabuto_sectivorus_supreme"  
#> [25] "zeroids_zobor"               "metran"                     
#> [27] "banimon_revolutionary_guard" "outlander_crim"             
#> [29] "cosmic_wave"                 "bt_savage_adventurer"       
#> [31] "maniax_robert"               "osm_inferno"                
#> [33] "wor_elapid_saboteur"         "avrobot_gunmetal"           
#> [35] "outlander_gun_metal"         "maniax_heroic_duo"          
#> [37] "volkriun"                    "neo_nebula"                 
#> [39] "banimon_apocalypse"          "relgost"                    
#> [41] "banimon_border_patrol"       "bio_hunters"                
#> [43] "redlaw"                      "reydurran"                  
#> [45] "bt_void_minion"              "cappy_techmi"               
#> [47] "kots_purple_knight"          "kabuto_xenoglow"            
#> [49] "avrobot_deluxe_orange"       "gendrone_union"             
#> [51] "kabuto_cerulestar"           "caliber_dome"               
#> [53] "bt_vampire_lord"             "maniax_golden_monster"      
#> [55] "kots_gauss_armor"            "banimon_red_army_men"       
#> [57] "neo_phase"                   "rf_wrecker"                 
#> [59] "outlander_goldlander"       
```
