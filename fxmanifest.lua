fx_version 'cerulean'
game 'gta5'

author '@allroundjonu'
description 'Advanced Drug System for FiveM'
version 'v1.4.3'

identifier 'it-drugs'

shared_script {
    '@ox_lib/init.lua'
}

ox_libs {
    'math',
}

shared_scripts {
    'shared/config.lua',
    'shared/functions.lua',
    'locales/en.lua',
    'locales/*.lua',
}

client_scripts {
    'client/cl_notarget.lua',

    'client/cl_admin.lua',
    'client/cl_menus.lua',
    'client/cl_dealer.lua',
    'client/cl_planting.lua',
    'client/cl_processing.lua',
    'client/cl_selling.lua',
    'client/cl_target.lua',
    'client/cl_using.lua',
    'client/cl_blips.lua',
    'client/cl_usableitems.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',

    'server/sv_admin.lua',
    'server/sv_dealer.lua',
    'server/sv_planting.lua',
    'server/sv_processing.lua',
    'server/sv_selling.lua',
    'server/sv_usableitems.lua',
    'server/sv_webhooks.lua',
    'server/sv_versioncheck.lua',
    'server/sv_setupdatabase.lua'
}

files = {
    --------------Tables-------------------
    'stream/freeze_it-drugs_table.ytyp',
    'stream/tables/freeze_it-scripts_coke_table.ydr',
    'stream/tables/freeze_it-scripts_empty_table.ydr',
    'stream/tables/freeze_it-scripts_weed_table.ydr',
    'stream/freeze_it-scripts_meth_table.ytyp',
    ---------------empty pot----------------------
    'stream/bzzz_growing_freepot_a.ytyp',
    'stream/pot/bzzz_growing_freepot_b.ydr',
    'stream/pot/bzzz_growing_freepot_textures.ytd',
    ---------------Seedlings----------------------
    'stream/bzzz_prop_seeds_000.ytyp',
    'stream/seedling/bzzz_prop_seeds_003.ydr',
    --------------Weed Types-------------------
    'stream/an_weed.ytyp',
    --------------Lemon Haze-------------------
    'stream/yellow/an_weed_yellow.ytd',
    'stream/yellow/an_weed_yellow_01_small_01b.ydr',
    'stream/yellow/an_weed_yellow_lrg_01b.ydr',
    'stream/yellow/an_weed_yellow_med_01b.ydr',
    'stream/yellow/an_weed_yellow+hi.ytd',
    ---------------Purple haze------------------
    'stream/purple/an_weed_purple.ytd',
    'stream/purple/an_weed_purple_01_small_01b.ydr',
    'stream/purple/an_weed_purple_lrg_01b.ydr',
    'stream/purple/an_weed_purple_med_01b.ydr',
    'stream/purple/an_weed_purple+hi.ytd',
    ---------------White Widow------------------
    'stream/white/an_weed_white.ytd',
    'stream/white/an_weed_white_01_small_01b.ydr',
    'stream/white/an_weed_white_lrg_01b.ydr',
    'stream/white/an_weed_white_med_01b.ydr',
    'stream/white/an_weed_white+hi.ytd',
    ---------------blue berry------------------------
    'stream/blue/an_weed_blue.ytd',
    'stream/blue/an_weed_blue_01_small_01b.ydr',
    'stream/blue/an_weed_blue_lrg_01b.ydr',
    'stream/blue/an_weed_blue_med_01b.ydr',
    'stream/blue/an_weed_blue+hi.ytd',
    ---------------Coca Plant----------------------
    'stream/bzzz_plant_coca_a.ytyp',
    'stream/coca/bzzz_plant_coca_a.ydr',
    'stream/coca/bzzz_plant_coca_b.ydr',
    'stream/coca/bzzz_plant_coca_c.ydr',

}

    ----------------------Tables-----------------------------------------
data_file 'DLC_ITYP_REQUEST' 'stream/freeze_it-drugs_table.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/tables/freeze_it-scripts_coke_table.ydr'
data_file 'DLC_ITYP_REQUEST' 'stream/tables/freeze_it-scripts_meth_table.ydr'
data_file 'DLC_ITYP_REQUEST' 'stream/tables/freeze_it-scripts_weed_table.ydr'
data_file 'DLC_ITYP_REQUEST' 'stream/tables/freeze_it-scripts_empty_table.ydr'
-------------------------Empty Pot--------------------------------
data_file 'DLC_ITYP_REQUEST' 'stream/bzzz_growing_freepot_a.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/pot/bzzz_growing_freepot_b.ydr'
data_file 'DLC_ITYP_REQUEST' 'stream/pot/bzzz_growing_freepot_textures.ydr'
-------------------------Seedlings--------------------------------
data_file 'DLC_ITYP_REQUEST' 'stream/bzzz_prop_seeds_000.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/seedling/bzzz_prop_seeds_003.ydr'
------------------------Weed types-------------------------------
data_file 'DLC_ITYP_REQUEST' 'stream/an_weed.ytyp'
------------------------Lemon haze-------------------------------
data_file 'DLC_ITYP_REQUEST' 'stream/yellow/an_weed_yellow.ytd'
data_file 'DLC_ITYP_REQUEST' 'stream/yellow/an_weed_yellow_01_small_01b.ydr'
data_file 'DLC_ITYP_REQUEST' 'stream/yellow/an_weed_yellow_lrg_01b.ydr'
data_file 'DLC_ITYP_REQUEST' 'stream/yellow/an_weed_yellow_med_01b.ydr'
data_file 'DLC_ITYP_REQUEST' 'stream/yellow/an_weed_yellow+hi.ytd'
-------------------------Purple haze-------------------------------
data_file 'DLC_ITYP_REQUEST' 'stream/purple/an_weed_purple.ytd'
data_file 'DLC_ITYP_REQUEST' 'stream/purple/an_weed_purple_01_small_01b.ydr'
data_file 'DLC_ITYP_REQUEST' 'stream/purple/an_weed_purple_lrg_01b.ydr'
data_file 'DLC_ITYP_REQUEST' 'stream/purple/an_weed_purple_med_01b.ydr'
data_file 'DLC_ITYP_REQUEST' 'stream/purple/an_weed_purple+hi.ytd'
-------------------------White Widow-------------------------------
data_file 'DLC_ITYP_REQUEST' 'stream/white/an_weed_white.ytd'
data_file 'DLC_ITYP_REQUEST' 'stream/white/an_weed_white_01_small_01b.ydr'
data_file 'DLC_ITYP_REQUEST' 'stream/white/an_weed_white_lrg_01b.ydr'
data_file 'DLC_ITYP_REQUEST' 'stream/white/an_weed_white_med_01b.ydr'
data_file 'DLC_ITYP_REQUEST' 'stream/white/an_weed_white+hi.ytd'
-------------------------Blue berry--------------------------------
data_file 'DLC_ITYP_REQUEST' 'stream/blue/an_weed_blue.ytd'
data_file 'DLC_ITYP_REQUEST' 'stream/blue/an_weed_blue_01_small_01b.ydr'
data_file 'DLC_ITYP_REQUEST' 'stream/blue/an_weed_blue_lrg_01b.ydr'
data_file 'DLC_ITYP_REQUEST' 'stream/blue/an_weed_blue_med_01b.ydr'
data_file 'DLC_ITYP_REQUEST' 'stream/blue/an_weed_blue+hi.ytd'
-------------------------Coca Plant--------------------------------
data_file 'DLC_ITYP_REQUEST' 'stream/bzzz_plant_coca_a.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/coca/bzzz_plant_coca_a.ydr'
data_file 'DLC_ITYP_REQUEST' 'stream/coca/bzzz_plant_coca_b.ydr'
data_file 'DLC_ITYP_REQUEST' 'stream/coca/bzzz_plant_coca_c.ydr'



dependencies {
    'ox_lib',
    'oxmysql',
    'it_bridge'
}

lua54 'yes'
