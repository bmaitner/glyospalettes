# List the available Glyos palettes

List the available Glyos palettes

## Usage

``` r
glyos_palette_names(company = NULL, line = NULL)
```

## Arguments

- company:

  Optional company name (see
  [`glyos_companies()`](https://bmaitner.github.io/rglyos/reference/glyos_companies.md))
  to restrict the list to. Matched case-insensitively and by unique
  prefix, so `"godbeast"` and `"spy monkey"` work.

- line:

  Optional product line (see the `line` column of
  [glyos_colorways](https://bmaitner.github.io/rglyos/reference/glyos_colorways.md))
  to restrict the list to, matched the same way.

## Value

A character vector of palette names accepted by
[`glyos_palette()`](https://bmaitner.github.io/rglyos/reference/glyos_palette.md)
and the `scale_*_glyos()` functions.

## Examples

``` r
glyos_palette_names()
#>   [1] "standard"                    "reverse"                    
#>   [3] "spectre"                     "hades"                      
#>   [5] "infection"                   "neo_phase"                  
#>   [7] "glyaxia"                     "ecroyex"                    
#>   [9] "gatekeeper"                  "gatekeeper_classic"         
#>  [11] "volkriun"                    "zorennor"                   
#>  [13] "reydurran"                   "sonesidar"                  
#>  [15] "ivorinium"                   "stealth"                    
#>  [17] "classified"                  "mordireus"                  
#>  [19] "cosmic_wave"                 "eclipse"                    
#>  [21] "frontier"                    "neo_nebula"                 
#>  [23] "dark_nebula"                 "villser"                    
#>  [25] "metran"                      "ultra_corps"                
#>  [27] "redlaw"                      "sendollest"                 
#>  [29] "rig_crew"                    "skaterriun"                 
#>  [31] "bio_phantom"                 "aetheric"                   
#>  [33] "white_skull"                 "gendrone_union"             
#>  [35] "gendrone_alliance"           "neo_frontier"               
#>  [37] "imperium"                    "bio_hunters"                
#>  [39] "lsa"                         "neo_voss"                   
#>  [41] "relgost"                     "crayhunter"                 
#>  [43] "sunstorm"                    "smoke"                      
#>  [45] "delphi"                      "kabuto_standard"            
#>  [47] "kabuto_infection"            "kabuto_radioactive"         
#>  [49] "kabuto_glyaxia_clone"        "kabuto_scarabite"           
#>  [51] "kabuto_xenoglow"             "kabuto_cerulestar"          
#>  [53] "kabuto_bioberry"             "kabuto_luna"                
#>  [55] "kabuto_sectivorus_supreme"   "wom_empyreus"               
#>  [57] "wom_palidar"                 "wom_umbreus"                
#>  [59] "wom_brutok"                  "wom_crystal_gohlem"         
#>  [61] "wom_magma_gohlem"            "wom_gearion"                
#>  [63] "wom_veridiohm"               "bt_savage_adventurer"       
#>  [65] "bt_nomadic_orc"              "bt_cyclops_ice_raider"      
#>  [67] "bt_crimson_spikesaurian"     "bt_crystal_crusader"        
#>  [69] "bt_livid_dracosaurian"       "bt_oozarian"                
#>  [71] "bt_bloodlust_demon"          "bt_vampire_lord"            
#>  [73] "bt_eldritch_god"             "rf_maxx_zero"               
#>  [75] "rf_hun_dred"                 "rf_sentinel"                
#>  [77] "rf_wrecker"                  "rf_vanguard"                
#>  [79] "rf_cruel"                    "rf_brutal"                  
#>  [81] "rf_nazgar"                   "mordles_jumbo"              
#>  [83] "zeroids_zerak"               "zeroids_zobor"              
#>  [85] "manglors_manglord"           "osm_alpha_phase"            
#>  [87] "osm_beta_phase"              "osm_xodiac"                 
#>  [89] "osm_jack_asteroid"           "osm_mystron"                
#>  [91] "osm_inferno"                 "osm_commander_comet"        
#>  [93] "osm_colossus_rex"            "osm_astro_nautilus"         
#>  [95] "osm_orbitron"                "osm_cosmic_radiation"       
#>  [97] "powerlords_adam_power"       "kots_lime_knight"           
#>  [99] "kots_brick_knight"           "kots_teal_knight"           
#> [101] "kots_purple_knight"          "kots_death_knight"          
#> [103] "kots_vice_knight"            "kots_royal_knight"          
#> [105] "kots_cyber_mama"             "kots_rex_ganon"             
#> [107] "kots_gauss_armor"            "maniax_fishstik"            
#> [109] "maniax_fire_face"            "maniax_death_jaguar"        
#> [111] "maniax_golden_monster"       "maniax_nekro"               
#> [113] "maniax_woodsman"             "maniax_slapshot"            
#> [115] "maniax_grape_king"           "maniax_marine_voyager"      
#> [117] "maniax_ghost_fang"           "biomass_endrax"             
#> [119] "biomass_nuklerios"           "biomass_oozarian"           
#> [121] "biomass_rayexx"              "biomass_neo_nonillia"       
#> [123] "biomass_mind_phantom"        "biomass_deconstructor"      
#> [125] "biomass_unifier"             "callgrim_standard"          
#> [127] "order_standard"              "order_wing_bike"            
#> [129] "norisar_ambush"              "order_eternal"              
#> [131] "order_triton"                "callgrim_dominus"           
#> [133] "caliber_dome"                "order_lorcassic"            
#> [135] "scarabite_callgrim"          "titan_skeleton"             
#> [137] "baron_dark"                  "grimskull"                  
#> [139] "breaker_buildman"            "wor_bog_nar"                
#> [141] "wor_gol_warrior"             "wor_nekroid_nightstalker"   
#> [143] "wor_gol_wildmage"            "wor_gol_hunter"             
#> [145] "wor_nekroid_invader"         "wor_serpax"                 
#> [147] "wor_worian_laser_trooper"    "wor_captain_cobrus"         
#> [149] "wor_gol_oceanlord"           "avrobot_deluxe_orange"      
#> [151] "avrobot_bronze"              "avrobot_gunmetal"           
#> [153] "avrobot_muscle"              "avrobot_bios_allegiant"     
#> [155] "avrobot_centurion"           "avrobot_cyber_orion"        
#> [157] "avrobot_space_pirate_red"    "outlander_original"         
#> [159] "outlander_meta_lavalander"   "outlander_gun_metal"        
#> [161] "outlander_redlaw_purplander" "outlander_ultra_bronze"     
#> [163] "outlander_goldlander"        "outlander_crim"             
#> [165] "outlander_otherlander"       "outlander_split"            
#> [167] "outlander_destian"           "cappy_phibian"              
#> [169] "cappy_belfry"                "cappy_draga"                
#> [171] "cappy_rawnha"                "cappy_tidaloch"             
#> [173] "cappy_plessie"               "cappy_the_veiled"           
#> [175] "cappy_mischievers"           "prismiria"                  
#> [177] "geodraxus"                   "acris"                      
#> [179] "banimon_red_army_men"        "banimon_pink_army_men"      
#> [181] "banimon_border_patrol"       "banimon_havvacor"           
#> [183] "banimon_revolutionary_guard" "banimon_apocalypse"         
#> [185] "bitfigs_pheyden"             "bitfigs_ninja"              
#> [187] "bitfigs_animal"              "bitfigs_space"              
#> [189] "bitfigs_dreadvalken"         "zullbeast"                  
#> [191] "psychozor"                   "zulloid"                    
#> [193] "kaisyriax"                  
glyos_palette_names(company = "TheGodBeast")
#>  [1] "kabuto_standard"           "kabuto_infection"         
#>  [3] "kabuto_radioactive"        "kabuto_glyaxia_clone"     
#>  [5] "kabuto_scarabite"          "kabuto_xenoglow"          
#>  [7] "kabuto_cerulestar"         "kabuto_bioberry"          
#>  [9] "kabuto_luna"               "kabuto_sectivorus_supreme"
glyos_palette_names(line = "Battle Tribes")
#>  [1] "bt_savage_adventurer"    "bt_nomadic_orc"         
#>  [3] "bt_cyclops_ice_raider"   "bt_crimson_spikesaurian"
#>  [5] "bt_crystal_crusader"     "bt_livid_dracosaurian"  
#>  [7] "bt_oozarian"             "bt_bloodlust_demon"     
#>  [9] "bt_vampire_lord"         "bt_eldritch_god"        
```
