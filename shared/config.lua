Config = Config or {}
Locales = Locales or {}

-- ┌───────────────────────────────────┐
-- │  ____                           _ │
-- │ / ___| ___ _ __   ___ _ __ __ _| |│
-- │| |  _ / _ \ '_ \ / _ \ '__/ _` | |│
-- │| |_| |  __/ | | |  __/ | | (_| | |│
-- │ \____|\___|_| |_|\___|_|  \__,_|_|│
-- └───────────────────────────────────┘
-- All general settings like language or webhook can be found here

--[[
    The first thing will be to choose our main language, here you can choose
    between the default languages that you will find within locales/*,
    if yours is not there, feel free to create it!
]]
Config.Language = 'en'
Config.Target = 'ox_target' -- Target system ('qb-target', 'ox_target' or false to disable)

--[[
    Here you set up the discord webhook, you can find more information about
    this in the server/webhook.lua file.
    If you dont know what a webhook is, you can read more about it here:
    https://support.discord.com/hc/en-us/articles/228383668-Intro-to-Webhooks
]]
Config.Webhook = {
    ['active'] = false, -- Set to true to enable the webhook
    ['url'] = nil, -- This will do nothing set you webhook url in server/sv_webhook.lua
    ['name'] = 'it-drugs', -- Name for the webhook
    ['avatar'] = 'https://i.imgur.com/KvZZn88.png', -- Avatar for the webhook
}

-- The Drug Dealer system is a system that allows you to buy seed from a dealer
Config.EnableDealers = true -- Enable drug dealer system

Config.DrugDealers = {
	['seed_dealer'] = { -- Dealer id (Musst be unique)
        label = 'Drug Supplier', -- Dealer name
        locations = { -- Dealer will spawn at one of these locations
            vector4(-36.6369, -1492.3983, 31.2171, 85.0993), --behind store across franklins aunts
            vector4(-49.4244, 1903.6714, 194.3613, 95.7213),
            vector4(2414.2463, 5003.8462, 45.6655, 40.8932),
        },
        ped = 's_m_y_dealer_01', -- Ped model
        blip = {
            display = true, -- Display blip on map
            sprite = 514, -- Select blip from (https://docs.fivem.net/docs/game-references/blips/)
            displayColor = 2, -- Select blip color from (https://docs.fivem.net/docs/game-references/blips/)
            displayText = 'Drug Supplier',
        },
        items = { -- Items the dealer is selling
            ['paper'] = {min = 1, max = 2}, -- min/max price
            ['baggie'] = {min = 2, max = 4},
            ['empty_jar'] = {min = 3, max = 5},
            ['baggie_1oz'] = {min = 3, max = 6},
            ['watering_can'] = {min = 7, max = 10}, -- min/max price
            ['fertilizer'] = {min = 10, max = 15},
            ['liquid_fertilizer'] = {min = 15, max = 20},
            ['advanced_fertilizer'] = {min = 20, max = 25},
            ['weed_ak47_seed'] = {min = 250, max = 300},
            ['weed_ogkush_seed'] = {min = 350, max = 400},
            ['weed_purplehaze_seed'] = {min = 450, max = 500},
            ['weed_skunk_seed'] = {min = 550, max = 600},
            ['coca_seed'] = {min = 750, max = 900},
            ['weed_processing_table'] = {min = 50000, max = 60000},
            ['cocaine_processing_table'] = {min = 75000, max = 90000},
        }
    },
}

--- Growing Related Settings
Config.rayCastingDistance = 7.0 -- distance in meters
Config.FireTime = 10000 -- in ms
Config.ClearOnStartup = true -- Clear dead plants on script start-up
Config.PlayerPlantLimit = 10 -- Max amount of plants a player can have simultaneously

-- ┌───────────────────────────┐
-- │ _____                     │
-- │|__  /___  _ __   ___  ___ │
-- │  / // _ \| '_ \ / _ \/ __|│
-- │ / /| (_) | | | |  __/\__ \│
-- │/____\___/|_| |_|\___||___/│
-- └───────────────────────────┘

Config.OnlyZones = false -- Allow drug growth only in defined zones
Config.GlobalGrowTime = 30 -- Time in minutes for a plant to grow

Config.Zones = {
    ['weed_zone_one'] = { -- Zone id (Musst be unique)
        points = {
		vec3(5388.0, -5327.0, 35.0),  -- Zone coords  Weed --  Cayo Perico island
		vec3(5355.5, -5366.0, 35.0),
		vec3(5316.5, -5324.5, 35.0),
		vec3(5345.0, -5295.0, 35.0),
        },
        thickness = 16.5,
        growMultiplier = 2, -- GlobalGrowTime / growMultiplier = Time in minutes for a plant to grow in this zone
        
        blip = {
            display = true, -- Display blip on map
            sprite = 466, -- Select blip from (https://docs.fivem.net/docs/game-references/blips/)
            displayColor = 2, -- Select blip color from (https://docs.fivem.net/docs/game-references/blips/)
            displayText = 'Grow Zone Weed',
        },
        exclusive = {'weed_ak47_seed', 'weed_ogkush_seed', 'weed_purplehaze_seed' ,'weed_skunk_seed'} -- Types of drugs that will be affected in this are.
    },
    ['weed_zone_two'] = { -- Zone id (Musst be unique)
        points = {
		vec3(5343.0, -5220.0, 27.6),  -- Zone coords Cocaine --  Cayo Perico island
		vec3(5324.0, -5240.0, 27.6),
		vec3(5284.4501953125, -5206.25, 27.6),
		vec3(5303.0, -5185.0, 27.6),
        },
        thickness = 17.00,
        growMultiplier = 2, -- GlobalGrowTime / growMultiplier = Time in minutes for a plant to grow in this zone
        blip = {
            display = true, -- Display blip on map
            sprite = 466, -- Select blip from (https://docs.fivem.net/docs/game-references/blips/)
            displayColor = 0, -- Select blip color from (https://docs.fivem.net/docs/game-references/blips/)
            displayText = 'Grow Zone Cocaine',
        },
        exclusive = {'coca_seed'} -- Types of drugs that will be affected in this are.
    },
    ['weed_zone_three'] = { -- Zone id (Musst be unique)
        points = {
		vec3(-814.0, -61.0, 38.0),  -- Zone coords Weed --  Test Grow Zone
		vec3(-819.0, -42.0, 38.0),
		vec3(-885.0, -72.0, 38.0),
		vec3(-878.0, -86.0, 38.0),
		vec3(-865.0, -87.0, 38.0),
        },
        thickness = 4.0,
        growMultiplier = 2, -- GlobalGrowTime / growMultiplier = Time in minutes for a plant to grow in this zone
        blip = {
            display = true, -- Display blip on map
            sprite = 466, -- Select blip from (https://docs.fivem.net/docs/game-references/blips/)
            displayColor = 2, -- Select blip color from (https://docs.fivem.net/docs/game-references/blips/)
            displayText = 'Test Grow Zone',
        },
        exclusive = {'weed_ak47_seed', 'weed_ogkush_seed', 'weed_purplehaze_seed' ,'weed_skunk_seed', 'coca_seed'} -- Types of drugs that will be affected in this are.
    },
}


-- ┌─────────────────────────────┐
-- │ ____  _             _       │
-- │|  _ \| | __ _ _ __ | |_ ___ │
-- │| |_) | |/ _` | '_ \| __/ __|│
-- │|  __/| | (_| | | | | |_\__ \│
-- │|_|   |_|\__,_|_| |_|\__|___/│
-- └─────────────────────────────┘

Config.PlantDistance = 1.5 -- minimum Distance between two plants

Config.OnlyAllowedGrounds = true -- Allow drug growth only on allowed grounds
Config.AllowedGrounds = {   -- Allowed ground types for planting
    1109728704, -- fields
    -1942898710, -- grass/dirt
    510490462, -- dirt path
    -1286696947,
    -1885547121,
    223086562,
    -461750719,
    1333033863,
    -1907520769,
}

Config.WaterDecay = 1 -- Percent of water that decays every minute
Config.FertilizerDecay = 0.7 -- Percent of fertilizers that decays every minute

Config.FertilizerThreshold = 10
Config.WaterThreshold = 10
Config.HealthBaseDecay = {7, 10} -- Min/Max Amount of health decay when the plant is below the above thresholds for water and nutrition


Config.Items = {
    ['watering_can'] = {
        water = 40,
        fertilizer = 0,
        itemBack = nil, -- Example itemBack = 'watering_can' if you want to get the watering can back after used
    },
    ['liquid_fertilizer'] = {
        water = 20,
        fertilizer = 20,
        itemBack = nil,
    },
    ['fertilizer'] = {
        water = 0,
        fertilizer = 40,
        itemBack = nil,
    },
    ['advanced_fertilizer'] = {
        water = 0,
        fertilizer = 80,
        itemBack = nil,
    },
}

Config.PlantTypes = {
    -- small is growth 0-30%, medium is 30-80%, large is 80-100%
    ["ak45_plant"] = {
        [1] = {"bzzz_prop_seeds_003", 0},
        [2] = {"bkr_prop_weed_01_small_01c", -0.465},
        [3] = {"an_weed_yellow_01_small_01b", -0.47},
        [4] = {"an_weed_yellow_med_01b", -0.47},
        [5] = {"an_weed_yellow_lrg_01b", -0.47},
    },
    ["ogk_plant"] = {
        [1] = {"bzzz_prop_seeds_003", 0},
        [2] = {"bkr_prop_weed_01_small_01c", -0.46},
        [3] = {"an_weed_blue_01_small_01a", -0.47},
        [4] = {"an_weed_blue_med_01b", -0.47},
        [5] = {"an_weed_blue_lrg_01b", -0.47},
    },
    ["ph_plant"] = {
        [1] = {"bzzz_prop_seeds_003", 0},
        [2] = {"bkr_prop_weed_01_small_01c", -0.46},
        [3] = {"an_weed_purple_01_small_01b", -0.47},
        [4] = {"an_weed_purple_med_01b", -0.47},
        [5] = {"an_weed_purple_lrg_01b", -0.47},
    },
    ["sk_plant"] = {
        [1] = {"bzzz_prop_seeds_003", 0},
        [2] = {"bkr_prop_weed_01_small_01c", -0.466},
        [3] = {"an_weed_white_01_small_01b", -0.47},
        [4] = {"an_weed_white_med_01b", -0.47},
        [5] = {"an_weed_white_lrg_01b", -0.47},
    },
    ["coca_plant"] = {
        [1] = {"bzzz_prop_seeds_003", 0},
        [2] = {"bzzz_plant_coca_a", -0.5},
        [3] = {"bzzz_plant_coca_a", 0},
        [4] = {"bzzz_plant_coca_b", 0},
        [5] = {"bzzz_plant_coca_c", 0},
    },
}

Config.Plants = { -- Create seeds for drugs

    ['weed_ak47_seed'] = {
        growthTime = false, -- Cutsom growth time in minutes false if you want to use the global growth time
        label = 'AK47', --
        plantType = 'ak45_plant', -- Choose plant types from (plant1, plant2, small_plant)
        products = { -- Item the plant is going to produce when harvested with the max amount
            ['weed_ak47'] = {min = 15, max = 45},  
            --['other_item'] = {min = 1, max = 2}
        },
        seed = {
            chance = 40, -- Percent of getting back the seed
            min = 1, -- Min amount of seeds
            max = 5 -- Max amount of seeds
        },
        time = 5000 -- Time it takes to plant/harvest in miliseconds
    },
    ['weed_ogkush_seed'] = {
        growthTime = 35, -- Cutsom growth time in minutes false if you want to use the global growth time
        label = 'OG Kush', --
        plantType = 'ogk_plant', -- Choose plant types from (plant1, plant2, small_plant)
        products = { -- Item the plant is going to produce when harvested with the max amount
            ['weed_ogkush'] = {min = 13, max = 39},  
            --['other_item'] = {min = 1, max = 2}
        },
        seed = {
            chance = 30, -- Percent of getting back the seed
            min = 1, -- Min amount of seeds
            max = 4 -- Max amount of seeds
        },
        time = 6000 -- Time it takes to plant/harvest in miliseconds
    },
    ['weed_purplehaze_seed'] = {
        growthTime = 40, -- Cutsom growth time in minutes false if you want to use the global growth time
        label = 'Purple Haze', --
        plantType = 'ph_plant', -- Choose plant types from (plant1, plant2, small_plant)
        products = { -- Item the plant is going to produce when harvested with the max amount
            ['weed_purplehaze'] = {min = 11, max = 33},  
            --['other_item'] = {min = 1, max = 2}
        },
        seed = {
            chance = 20, -- Percent of getting back the seed
            min = 1, -- Min amount of seeds
            max = 3 -- Max amount of seeds
        },
        time = 7000 -- Time it takes to plant/harvest in miliseconds
    },
    ['weed_skunk_seed'] = {
        growthTime = 50, -- Cutsom growth time in minutes false if you want to use the global growth time
        label = 'Skunk', --
        plantType = 'sk_plant', -- Choose plant types from (plant1, plant2, small_plant)
        products = { -- Item the plant is going to produce when harvested with the max amount
            ['weed_skunk'] = {min = 9, max = 27},  
            --['other_item'] = {min = 1, max = 2}
        },
        seed = {
            chance = 15, -- Percent of getting back the seed
            min = 1, -- Min amount of seeds
            max = 2 -- Max amount of seeds
        },
        time = 7000 -- Time it takes to plant/harvest in miliseconds
    },

    ['coca_seed'] = {
        growthTime = 60, -- Cutsom growth time in minutes false if you want to use the global growth time
        label = 'Coca Plant', --
        plantType = 'coca_plant', -- Choose plant types from (plant1, plant2, small_plant) also you can change plants yourself in main/client.lua line: 2
        products = { -- Item the plant is going to produce when harvested with the max amount
            ['coca']= {min = 5, max = 18}
        },
        seed = {
            chance = 25, -- Percent of getting back the seed
            min = 1, -- Min amount of seeds
            max = 3 -- Max amount of seeds
        },
        time = 8000 -- Time it takes to harvest in miliseconds
    },
}

--[[
    Next you have to prepeare the Processing settings. You can create as many processing tables as you want.
    You can create use as many ingrediants as you want. You can also change the processing table models to your liking.
    Each table is for proccessing a specific drug type. You can also create to tables for the same drug type.

]]

-- ┌─────────────────────────────────────────────────┐
-- │ ____                              _             │
-- │|  _ \ _ __ ___   ___ ___  ___ ___(_)_ __   __ _ │
-- │| |_) | '__/ _ \ / __/ _ \/ __/ __| | '_ \ / _` |│
-- │|  __/| | | (_) | (_|  __/\__ \__ \ | | | | (_| |│
-- │|_|   |_|  \___/ \___\___||___/___/_|_| |_|\__, |│
-- │                                           |___/ │
-- └─────────────────────────────────────────────────┘

Config.EnableProcessing = true -- Enable crafting system
Config.ShowIngrediants = true -- Show ingrediants in the processing table

Config.ProcessingSkillCheck = false -- Enable skill check for processingTables (Replaces the progressbar)
Config.SkillCheck = {
    difficulty = {'easy', 'easy', 'medium', 'easy'},
    keys = {'w', 'a', 's', 'd'}
}

Config.ProcessingTables = { -- Create processing table
    ['weed_processing_table'] = {
        type = 'weed',
        model = 'bkr_prop_weed_table_01a', -- Exanples: bkr_prop_weed_table_01a, bkr_prop_meth_table01a, bkr_prop_coke_table01a
        recipes = {
            ['joint_ak'] = {
                label = 'Joint AK47',
                ingrediants = {
                    ['weed_ak47'] = 1,
                    ['paper'] = 1
                },
                outputs = {
                    ['joint_ak'] = 1
                },
                processTime = 7,
                failChance = 5
            },
            ['joint_ogk'] = {
                label = 'Joint OGKush',
                ingrediants = {
                    ['weed_ogkush'] = 1,
                    ['paper'] = 1
                },
                outputs = {
                    ['joint_ogk'] = 1
                },
                processTime = 7,
                failChance = 5
            },
            ['joint_ph'] = {
                label = 'Joint PurpleHaze',
                ingrediants = {
                    ['weed_purplehaze'] = 1,
                    ['paper'] = 1
                },
                outputs = {
                    ['joint_ph'] = 1
                },
                processTime = 7,
                failChance = 5
            },
            ['joint_sk'] = {
                label = 'Joint Skunk',
                ingrediants = {
                    ['weed_skunk'] = 1,
                    ['paper'] = 1
                },
                outputs = {
                    ['joint_sk'] = 1
                },
                processTime = 7,
                failChance = 5
            },


            ['baggie_ak'] = {
                label = 'Baggie AK47',
                ingrediants = {
                    ['weed_ak47'] = 1,
                    ['baggie'] = 1
                },
                outputs = {
                    ['baggie_ak'] = 1
                },
                processTime = 15,
                failChance = 10
            },
            ['baggie_ogk'] = {
                label = 'Baggie OGKush',
                ingrediants = {
                    ['weed_ogkush'] = 1,
                    ['baggie'] = 1
                },
                outputs = {
                    ['baggie_ogk'] = 1
                },
                processTime = 15,
                failChance = 10
            },
            ['baggie_ph'] = {
                label = 'Baggie Purple Haze',
                ingrediants = {
                    ['weed_purplehaze'] = 1,
                    ['baggie'] = 1
                },
                outputs = {
                    ['baggie_ph'] = 1
                },
                processTime = 15,
                failChance = 10
            },
            ['baggie_sk'] = {
                label = 'Baggie Skunk',
                ingrediants = {
                    ['weed_skunk'] = 1,
                    ['baggie'] = 1
                },
                outputs = {
                    ['baggie_sk'] = 1
                },
                processTime = 15,
                failChance = 10
            },


            ['ozjar_ak'] = {
                label = 'Oz Jar AK47',
                ingrediants = {
                    ['weed_ak47'] = 28,
                    ['empty_jar'] = 1
                },
                outputs = {
                    ['ozjar_ak'] = 1
                },
                processTime = 25,
                failChance = 15
            },
            ['ozjar_ogk'] = {
                label = 'Oz Jar OGKush',
                ingrediants = {
                    ['weed_ogkush'] = 28,
                    ['empty_jar'] = 1
                },
                outputs = {
                    ['ozjar_ogk'] = 1
                },
                processTime = 25,
                failChance = 15
            },
            ['ozjar_ph'] = {
                label = 'Oz Jar Purple Haze',
                ingrediants = {
                    ['weed_purplehaze'] = 28,
                    ['empty_jar'] = 1
                },
                outputs = {
                    ['ozjar_ph'] = 1
                },
                processTime = 25,
                failChance = 15
            },
            ['ozjar_sk'] = {
                label = 'Oz Jar Skunk',
                ingrediants = {
                    ['weed_skunk'] = 28,
                    ['empty_jar'] = 1
                },
                outputs = {
                    ['ozjar_sk'] = 1
                },
                processTime = 25,
                failChance = 15
            },
            -- Add more recipes here like this
            --[[ ['weedbag'] = {
                label = 'Weed Bag',
                ingrediants = {
                    ['weed_lemonhaze'] = 3,
                    ['plastic'] = 1
                },
                outputs = {
                    ['weedbag'] = 1
                },
                processTime = 10,
                failChance = 15
            } ]]
        }
    },
    
    ['cocaine_processing_table'] = {
        type = 'cocaine',
        model = 'bkr_prop_coke_table01a', -- Exanples: bkr_prop_weed_table_01a, bkr_prop_meth_table01a, bkr_prop_coke_table01a
        recipes = {
            ['cocaine'] = {
                label = 'Cocaine',
                ingrediants = {
                    ['coca'] = 3,
                    ['nitrous'] = 1
                },
                outputs = {
                    ['cocaine'] = 2
                },
                processTime = 7,
                failChance = 15
            },
            ['baggie_coke'] = {
                label = 'Baggie Cocaine',
                ingrediants = {
                    ['cocaine'] = 2,
                    ['baggie'] = 1
                },
                outputs = {
                    ['baggie_coke'] = 1
                },
                processTime = 10,
                failChance = 10
            },
            ['brick_coke'] = {
                label = 'Oz Brick of Cocaine',
                ingrediants = {
                    ['cocaine'] = 28,
                    ['baggie_1oz'] = 1
                },
                outputs = {
                    ['brick_coke'] = 1
                },
                processTime = 15,
                failChance = 15
            },
        }
    },
}

-- ┌────────────────────────────┐
-- │ ____                       │
-- │|  _ \ _ __ _   _  __ _ ___ │
-- │| | | | '__| | | |/ _` / __|│
-- │| |_| | |  | |_| | (_| \__ \│
-- │|____/|_|   \__,_|\__, |___/│
-- │                  |___/     │
-- └────────────────────────────┘

--[[ Possible Drug Effects:
    runningSpeedIncrease, 
    infinateStamina,
    moreStrength,
    healthRegen,
    foodRegen,
    halfArmor,
    fullArmor,
    drunkWalk,
    psycoWalk,
    outOfBody,
    cameraShake,
    fogEffect,
    confusionEffect,
    whiteoutEffect,
    intenseEffect,
    focusEffect,
    superJump,
    swimming
--]]

Config.EnableDrugs = true -- Enable drug effects
Config.Drugs = { -- Create you own drugs

    ['joint_ak'] = {
        label = 'Joint AK47',
        animation = 'smoke', -- Animations: blunt, sniff, pill
        time = 80, -- Time in seconds of the Effects
        effects = { -- Effects: runningSpeedIncrease, infinateStamina, moreStrength, healthRegen, foodRegen, drunkWalk, psycoWalk, outOfBody, cameraShake, fogEffect, confusionEffect, whiteoutEffect, intenseEffect, focusEffect
            'fogEffect',
            'confusionEffect',
            'healthRegen',
            ''
        }
    },

    ['joint_ogk'] = {
        label = 'Joint OGKush',
        animation = 'smoke', -- Animations: blunt, sniff, pill
        time = 100, -- Time in seconds of the Effects
        effects = { -- Effects: runningSpeedIncrease, infinateStamina, moreStrength, healthRegen, foodRegen, drunkWalk, psycoWalk, outOfBody, cameraShake, fogEffect, confusionEffect, whiteoutEffect, intenseEffect, focusEffect
            'fogEffect',
            'confusionEffect',
            'healthRegen',
            'whiteoutEffect'
        }
    },

    ['joint_ph'] = {
        label = 'Joint Purple Haze',
        animation = 'smoke', -- Animations: blunt, sniff, pill
        time = 125, -- Time in seconds of the Effects
        effects = { -- Effects: runningSpeedIncrease, infinateStamina, moreStrength, healthRegen, foodRegen, drunkWalk, psycoWalk, outOfBody, cameraShake, fogEffect, confusionEffect, whiteoutEffect, intenseEffect, focusEffect
            'intenseEffect',
            'fogEffect',
            'healthRegen',
            'moreStrength',
            'drunkWalk'
        }
    },

    ['joint_sk'] = {
        label = 'Joint Skunk',
        animation = 'smoke', -- Animations: blunt, sniff, pill
        time = 150, -- Time in seconds of the Effects
        effects = { -- Effects: runningSpeedIncrease, infinateStamina, moreStrength, healthRegen, foodRegen, drunkWalk, psycoWalk, outOfBody, cameraShake, fogEffect, confusionEffect, whiteoutEffect, intenseEffect, focusEffect
            'intenseEffect',
            'whiteoutEffect',
            'fogEffect',
            'confusionEffect',
            'healthRegen',
            'moreStrength',
            'drunkWalk'
        }
    },

    ['cocaine'] = {
        label = 'Cocaine',
        animation = 'sniff', -- Animations: blunt, sniff, pill
        time = 60, -- Time in seconds of the Effects
        effects = { -- Effects: runningSpeedIncrease, infinateStamina, moreStrength, healthRegen, foodRegen, drunkWalk, psycoWalk, outOfBody, cameraShake, fogEffect, confusionEffect, whiteoutEffect, intenseEffect, focusEffect
            'runningSpeedIncrease',
            'infinateStamina',
            'fogEffect',
            'psycoWalk'
        }
    },
}

--[[
    You also can sell the drugs you created. You can create as many sell zones as you want.
    You can also change the sell zone models to your liking. You can change the price of each drug in each zone.
]]

-- ┌──────────────────────────────┐
-- │ ____       _ _ _             │
-- │/ ___|  ___| | (_)_ __   __ _ │
-- │\___ \ / _ \ | | | '_ \ / _` |│
-- │ ___) |  __/ | | | | | | (_| |│
-- │|____/ \___|_|_|_|_| |_|\__, |│
-- │                        |___/ │
-- └──────────────────────────────┘

Config.EnableSelling = true -- Enable selling system

Config.MinimumCops = 0 -- Minimum cops required to sell drugs
Config.OnlyCopsOnDuty = true -- Check if cops are on-duty (Only QBCore).
Config.PoliceJobs = {
    'police',
    'offpolice',
    'sheriff',
    'offsheriff',
}

Config.SellSettings = {
    ['onlyAvailableItems'] = true, -- Only offers with drugs the player has in his inventory
    ['sellChance'] = 70, -- Chance to sell drug (in %)
    ['stealChance'] = 15, -- Chance that the ped dont give you money (in %)
    ['sellAmount'] = { -- Amount of drugs you can sell
        min = 1,
        max = 6,
    },
    ['sellTimeout'] = 20, -- Max time you get to choose your option (secs)
    ['giveBonusOnPolice'] = true, -- Give bonus money if there is police online | 1-2 Cops : x1.2 | 3-6 Cops : x1.5 | 7-10 Cops : x1.7 | +10 Cops : x2.0
}

Config.SellZones = {
    ['groove'] = {
        points = {
            vec3(-154.0, -1778.0, 30.0),
            vec3(48.0, -1690.0, 30.0),
            vec3(250.0, -1860.0, 30.0),
            vec3(142.0, -1993.0, 30.0),
            vec3(130.0, -2029.0, 30.0),
        },
        thickness = 27,
        drugs = {
            { item = 'baggie_coke', price = math.random(75, 150)},
            { item = 'joint_ak', price = math.random(15, 20)},
            { item = 'joint_ogk', price = math.random(20, 25)},
            { item = 'joint_ph', price = math.random(30, 35)},
            { item = 'joint_sk', price = math.random(35, 40)},
            { item = 'baggie_ak', price = math.random(20, 25)},
            { item = 'baggie_ogk', price = math.random(25, 30)},
            { item = 'baggie_ph', price = math.random(35, 45)},
            { item = 'baggie_sk', price = math.random(45, 60)}
        }
    },
    ['vinewood'] = {
        points = {
            vec3(685.0, 36.0, 84.0),
            vec3(647.0, 53.0, 84.0),
            vec3(575.0, 81.0, 84.0),
            vec3(529.0, 100.0, 84.0),
            vec3(52.0, 274.0, 84.0),
            vec3(-34.0, 42.0, 84.0),
            vec3(426.0, -125.0, 84.0),
            vec3(494.0, -140.0, 84.0),
            vec3(518.0, -101.0, 84.0),
            vec3(595.0, -60.0, 84.0),
            vec3(667.0, -9.0, 84.0),
        },
        thickness = 59.0,
        drugs = {
            { item = 'baggie_coke', price = math.random(75, 150)},
            { item = 'joint_ak', price = math.random(15, 20)},
            { item = 'joint_ogk', price = math.random(20, 25)},
            { item = 'joint_ph', price = math.random(30, 35)},
            { item = 'joint_sk', price = math.random(35, 40)},
            { item = 'baggie_ak', price = math.random(20, 25)},
            { item = 'baggie_ogk', price = math.random(25, 30)},
            { item = 'baggie_ph', price = math.random(35, 45)},
            { item = 'baggie_sk', price = math.random(45, 60)}
        }
    },
    ['beach'] = {
        points = {
            vec3(-1328.0, -1340.0, 5.0),
            vec3(-1307.0, -1399.0, 5.0),
            vec3(-1297.0, -1421.0, 5.0),
            vec3(-1266.0, -1466.0, 5.0),
            vec3(-1139.0, -1646.0, 5.0),
            vec3(-1129.0, -1640.0, 5.0),
            vec3(-1307.0, -1358.0, 5.0),
            vec3(-1335.0, -1279.0, 5.0),
            vec3(-1349.0, -1285.0, 5.0),
        },
        thickness = 4.0,
        drugs = {
            { item = 'baggie_coke', price = math.random(75, 150)},
            { item = 'joint_ak', price = math.random(15, 20)},
            { item = 'joint_ogk', price = math.random(20, 25)},
            { item = 'joint_ph', price = math.random(30, 35)},
            { item = 'joint_sk', price = math.random(35, 40)},
            { item = 'baggie_ak', price = math.random(20, 25)},
            { item = 'baggie_ogk', price = math.random(25, 30)},
            { item = 'baggie_ph', price = math.random(35, 45)},
            { item = 'baggie_sk', price = math.random(45, 60)}
        }
    },
}

Config.BlacklistPeds = { 
    -- Peds you cant sell drugs to
    "mp_m_shopkeep_01",
    "s_m_y_ammucity_01",
    "s_m_m_lathandy_01",
    "s_f_y_clubbar_01",
    "ig_talcc",
    "g_f_y_vagos_01",
    "hc_hacker",
    "s_m_m_migrant_01",
}

function SendPoliceAlert(coords)
    -- Add You own police alert system here
    local message = 'Drug Deal spotted at '..coords
    TriggerEvent('chat:addMessage', {
        args = {message}
    })
end

function ShowNotification(source, message, type)
    -- Bridge.Functions.Notify(message, type) are the default Framework notifications
    -- You can change this to your own notification systems
    if source ~= nil then -- Server Messages
        if type == 'error' then
            it.notify(source, message, "error")
        elseif type == 'success' then
            it.notify(source, message, "success")
        else
            it.notify(source, message)
        end
    else -- Client Messages
        if type == 'error' then
            it.notify(message, "error")
        elseif type == 'success' then
            it.notify(message, "success")
        else
            it.notify(message)
        end
    end
end

--[[
    Debug mode, you can see all kinds of prints/logs using debug,
    but it's only for development.
]]
Config.EnableVersionCheck = true -- Enable version check
Config.Branch = 'main' -- Set to 'master' to use the master branch, set to 'development' to use the dev branch
Config.Debug = false -- Set to true to enable debug mode
Config.DebugPoly = false -- Set to true to enable debug mode for PolyZone
