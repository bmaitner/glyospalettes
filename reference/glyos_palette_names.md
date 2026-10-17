# List the available Glyos palettes

List the available Glyos palettes

## Usage

``` r
glyos_palette_names(company = NULL, line = NULL)
```

## Arguments

- company:

  Optional company name (see
  [`glyos_companies()`](https://bmaitner.github.io/glyospalettes/reference/glyos_companies.md))
  to restrict the list to. Matched case-insensitively and by unique
  prefix, so `"godbeast"` and `"spy monkey"` work.

- line:

  Optional product line (see the `line` column of
  [glyos_colorways](https://bmaitner.github.io/glyospalettes/reference/glyos_colorways.md))
  to restrict the list to, matched the same way.

## Value

A character vector of palette names accepted by
[`glyos_palette()`](https://bmaitner.github.io/glyospalettes/reference/glyos_palette.md)
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
#>  [73] "bt_eldritch_god"             "bt_void_minion"             
#>  [75] "bt_savage_destroyer"         "rf_maxx_zero"               
#>  [77] "rf_hun_dred"                 "rf_sentinel"                
#>  [79] "rf_wrecker"                  "rf_vanguard"                
#>  [81] "rf_cruel"                    "rf_brutal"                  
#>  [83] "rf_nazgar"                   "mordles_jumbo"              
#>  [85] "zeroids_zerak"               "zeroids_zobor"              
#>  [87] "manglors_manglord"           "osm_alpha_phase"            
#>  [89] "osm_beta_phase"              "osm_xodiac"                 
#>  [91] "osm_jack_asteroid"           "osm_mystron"                
#>  [93] "osm_inferno"                 "osm_commander_comet"        
#>  [95] "osm_colossus_rex"            "osm_astro_nautilus"         
#>  [97] "osm_orbitron"                "osm_cosmic_radiation"       
#>  [99] "powerlords_adam_power"       "kots_lime_knight"           
#> [101] "kots_brick_knight"           "kots_teal_knight"           
#> [103] "kots_purple_knight"          "kots_death_knight"          
#> [105] "kots_vice_knight"            "kots_royal_knight"          
#> [107] "kots_cyber_mama"             "kots_rex_ganon"             
#> [109] "kots_gauss_armor"            "maniax_fishstik"            
#> [111] "maniax_fire_face"            "maniax_death_jaguar"        
#> [113] "maniax_golden_monster"       "maniax_nekro"               
#> [115] "maniax_woodsman"             "maniax_slapshot"            
#> [117] "maniax_grape_king"           "maniax_marine_voyager"      
#> [119] "maniax_ghost_fang"           "maniax_atom"                
#> [121] "maniax_saber"                "maniax_heroic_duo"          
#> [123] "maniax_robert"               "biomass_endrax"             
#> [125] "biomass_nuklerios"           "biomass_oozarian"           
#> [127] "biomass_rayexx"              "biomass_neo_nonillia"       
#> [129] "biomass_mind_phantom"        "biomass_deconstructor"      
#> [131] "biomass_unifier"             "callgrim_standard"          
#> [133] "order_standard"              "order_wing_bike"            
#> [135] "norisar_ambush"              "order_eternal"              
#> [137] "order_triton"                "callgrim_dominus"           
#> [139] "caliber_dome"                "order_lorcassic"            
#> [141] "scarabite_callgrim"          "titan_skeleton"             
#> [143] "baron_dark"                  "grimskull"                  
#> [145] "breaker_buildman"            "wor_bog_nar"                
#> [147] "wor_gol_warrior"             "wor_nekroid_nightstalker"   
#> [149] "wor_gol_wildmage"            "wor_gol_hunter"             
#> [151] "wor_nekroid_invader"         "wor_serpax"                 
#> [153] "wor_worian_laser_trooper"    "wor_captain_cobrus"         
#> [155] "wor_gol_oceanlord"           "wor_baron_ironblast"        
#> [157] "wor_elapid_saboteur"         "avrobot_deluxe_orange"      
#> [159] "avrobot_bronze"              "avrobot_gunmetal"           
#> [161] "avrobot_muscle"              "avrobot_bios_allegiant"     
#> [163] "avrobot_centurion"           "avrobot_cyber_orion"        
#> [165] "avrobot_space_pirate_red"    "avrobot_buildborn"          
#> [167] "avrobot_vurgon"              "outlander_original"         
#> [169] "outlander_meta_lavalander"   "outlander_gun_metal"        
#> [171] "outlander_redlaw_purplander" "outlander_ultra_bronze"     
#> [173] "outlander_goldlander"        "outlander_crim"             
#> [175] "outlander_otherlander"       "outlander_split"            
#> [177] "outlander_destian"           "cappy_phibian"              
#> [179] "cappy_belfry"                "cappy_draga"                
#> [181] "cappy_rawnha"                "cappy_tidaloch"             
#> [183] "cappy_plessie"               "cappy_the_veiled"           
#> [185] "cappy_mischievers"           "cappy_techmi"               
#> [187] "prismiria"                   "geodraxus"                  
#> [189] "acris"                       "banimon_red_army_men"       
#> [191] "banimon_pink_army_men"       "banimon_border_patrol"      
#> [193] "banimon_havvacor"            "banimon_revolutionary_guard"
#> [195] "banimon_apocalypse"          "bitfigs_pheyden"            
#> [197] "bitfigs_ninja"               "bitfigs_animal"             
#> [199] "bitfigs_space"               "bitfigs_dreadvalken"        
#> [201] "zullbeast"                   "psychozor"                  
#> [203] "zulloid"                     "kaisyriax"                  
#> [205] "paleo_aeronaut"              "paleo_grrellan"             
#> [207] "paleo_podcraft"              "paleo_caustic_marsh"        
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
#> [11] "bt_void_minion"          "bt_savage_destroyer"    
```
