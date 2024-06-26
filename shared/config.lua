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
        coords = {
            vector2(5193.7534, -5194.3188), -- Zone coords  Weed --  Cayo Perico island
            vector2(5223.5186, -5184.6665), 
            vector2(5222.6567, -5144.0562), 
            vector2(5195.5068, -5163.0142), 
        },
        growMultiplier = 2, -- GlobalGrowTime / growMultiplier = Time in minutes for a plant to grow in this zone
        
        blip = {
            display = true, -- Display blip on map
            sprite = 466, -- Select blip from (https://docs.fivem.net/docs/game-references/blips/)
            displayColor = 2, -- Select blip color from (https://docs.fivem.net/docs/game-references/blips/)
            displayText = 'Grow Zone Weed',
        },
        exclusive = {'weed_ak47_seed', 'weed_ogkush_seed', 'weed_purplehaze_seed' ,'weed_skunk_seed'} -- Types of drugs that will be affected in this are.
    },
    ['coke_zone_one'] = { -- Zone id (Musst be unique)
        coords = {
            vector2(5321.0454, -5238.9775), -- Zone coords Cocaine --  Cayo Perico island
            vector2(5339.3867, -5219.6318), 
            vector2(5304.3071, -5184.5586), 
            vector2(5285.4985, -5207.1982), 
        },
        growMultiplier = 2, -- GlobalGrowTime / growMultiplier = Time in minutes for a plant to grow in this zone
        blip = {
            display = true, -- Display blip on map
            sprite = 466, -- Select blip from (https://docs.fivem.net/docs/game-references/blips/)
            displayColor = 0, -- Select blip color from (https://docs.fivem.net/docs/game-references/blips/)
            displayText = 'Grow Zone Cocaine',
        },
        exclusive = {'coca_seed'} -- Types of drugs that will be affected in this are.
    },
  --[[  ['weed_zone_two'] = { -- Zone id (Musst be unique)
        coords = {
            vector2(5193.7534, -5194.3188), -- Zone coords  Weed --  Cayo Perico island
            vector2(5223.5186, -5184.6665), 
            vector2(5222.6567, -5144.0562), 
            vector2(5195.5068, -5163.0142), 
        },
        growMultiplier = 2, -- GlobalGrowTime / growMultiplier = Time in minutes for a plant to grow in this zone
        
        blip = {
            display = true, -- Display blip on map
            sprite = 469, -- Select blip from (https://docs.fivem.net/docs/game-references/blips/)
            displayColor = 2, -- Select blip color from (https://docs.fivem.net/docs/game-references/blips/)
            displayText = 'Grow Zone Weed',
        },
        exclusive = {'weed_ak47_seed', 'weed_ogkush_seed', 'weed_purplehaze_seed' ,'weed_skunk_seed'} -- Types of drugs that will be affected in this are.
    },]]--
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
        water = 25,
        fertilizer = 0,
        itemBack = nil, -- Example itemBack = 'watering_can' if you want to get the watering can back after used
    },
    ['liquid_fertilizer'] = {
        water = 15,
        fertilizer = 15,
        itemBack = nil,
    },
    ['fertilizer'] = {
        water = 0,
        fertilizer = 25,
        itemBack = nil,
    },
    ['advanced_fertilizer'] = {
        water = 0,
        fertilizer = 40,
        itemBack = nil,
    },
}

Config.PlantTypes = {
    -- small is growth 0-30%, medium is 30-80%, large is 80-100%
    ["plant1"] = {
        [1] = {"bkr_prop_weed_01_small_01a", -0.5},
        [2] = {"bkr_prop_weed_med_01a", -0.5},
        [3] = {"bkr_prop_weed_lrg_01a", -0.5},
    },
    ["plant2"] = {
        [1] = {"bkr_prop_weed_01_small_01b", -0.5},
        [2] = {"bkr_prop_weed_med_01b",-0.5},
        [3] = {"bkr_prop_weed_lrg_01b", -0.5},
    },
    ["small_plant"] = {
        [1] = {"bkr_prop_weed_bud_02b", 0},
        [2] = {"prop_weed_02", 0},
        [3] = {"prop_weed_01", 0},
    },
    ["coca_plant"] = {
        [1] = {"bzzz_plant_coca_a", 0},
        [2] = {"bzzz_plant_coca_b", 0},
        [3] = {"bzzz_plant_coca_c", 0},
    },
}

Config.Plants = { -- Create seeds for drugs

    ['weed_ak47_seed'] = {
        growthTime = false, -- Cutsom growth time in minutes false if you want to use the global growth time
        label = 'AK47', --
        plantType = 'small_plant', -- Choose plant types from (plant1, plant2, small_plant)
        products = { -- Item the plant is going to produce when harvested with the max amount
            ['weed_ak47'] = {min = 12, max = 32},  
            --['other_item'] = {min = 1, max = 2}
        },
        seed = {
            chance = 50, -- Percent of getting back the seed
            min = 1, -- Min amount of seeds
            max = 5 -- Max amount of seeds
        },
        time = 3000 -- Time it takes to plant/harvest in miliseconds
    },
    ['weed_ogkush_seed'] = {
        growthTime = 40, -- Cutsom growth time in minutes false if you want to use the global growth time
        label = 'OG Kush', --
        plantType = 'plant1', -- Choose plant types from (plant1, plant2, small_plant)
        products = { -- Item the plant is going to produce when harvested with the max amount
            ['weed_ogkush'] = {min = 10, max = 30},  
            --['other_item'] = {min = 1, max = 2}
        },
        seed = {
            chance = 40, -- Percent of getting back the seed
            min = 1, -- Min amount of seeds
            max = 4 -- Max amount of seeds
        },
        time = 3000 -- Time it takes to plant/harvest in miliseconds
    },
    ['weed_purplehaze_seed'] = {
        growthTime = 50, -- Cutsom growth time in minutes false if you want to use the global growth time
        label = 'Purple Haze', --
        plantType = 'plant2', -- Choose plant types from (plant1, plant2, small_plant)
        products = { -- Item the plant is going to produce when harvested with the max amount
            ['weed_purplehaze'] = {min = 8, max = 28},  
            --['other_item'] = {min = 1, max = 2}
        },
        seed = {
            chance = 30, -- Percent of getting back the seed
            min = 1, -- Min amount of seeds
            max = 3 -- Max amount of seeds
        },
        time = 3000 -- Time it takes to plant/harvest in miliseconds
    },
    ['weed_skunk_seed'] = {
        growthTime = 60, -- Cutsom growth time in minutes false if you want to use the global growth time
        label = 'Skunk', --
        plantType = 'plant2', -- Choose plant types from (plant1, plant2, small_plant)
        products = { -- Item the plant is going to produce when harvested with the max amount
            ['weed_skunk'] = {min = 6, max = 20},  
            --['other_item'] = {min = 1, max = 2}
        },
        seed = {
            chance = 20, -- Percent of getting back the seed
            min = 1, -- Min amount of seeds
            max = 2 -- Max amount of seeds
        },
        time = 3000 -- Time it takes to plant/harvest in miliseconds
    },

    ['coca_seed'] = {
        growthTime = 50, -- Cutsom growth time in minutes false if you want to use the global growth time
        label = 'Coca Plant', --
        plantType = 'coca_plant', -- Choose plant types from (plant1, plant2, small_plant) also you can change plants yourself in main/client.lua line: 2
        products = { -- Item the plant is going to produce when harvested with the max amount
            ['coca']= {min = 5, max = 15}
        },
        seed = {
            chance = 50, -- Percent of getting back the seed
            min = 1, -- Min amount of seeds
            max = 2 -- Max amount of seeds
        },
        time = 3000 -- Time it takes to harvest in miliseconds
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
            } ]]--
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
                processTime = 15,
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
                processTime = 25,
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
    ['stealChance'] = 20, -- Chance that the ped dont give you money (in %)
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
            vector2(250.90760803223, -1866.3974609375),
            vector2(146.70475769043, -1990.5447998047),
            vector2(130.3134765625, -2034.3944091797),
            vector2(95.291275024414, -2030.4129638672),
            vector2(88.095336914062, -2009.6634521484),
            vector2(68.878730773926, -1978.8924560547),
            vector2(-153.59761047363, -1779.4030761719),
            vector2(-97.692588806152, -1750.6363525391),
            vector2(-50.927833557129, -1733.6020507812),
            vector2(49.590217590332, -1689.9705810547)
        },
        minZ = 18.035144805908,
        maxZ = 75.059997558594,
        drugs = {
            { item = 'baggie_coke', price = math.random(75, 150)},
            { item = 'joint_ak', price = math.random(15, 25)},
            { item = 'joint_ogk', price = math.random(18, 25)},
            { item = 'joint_ph', price = math.random(21, 30)},
            { item = 'joint_sk', price = math.random(25, 30)},
            { item = 'baggie_ak', price = math.random(18, 30)},
            { item = 'baggie_ogk', price = math.random(21, 30)},
            { item = 'baggie_ph', price = math.random(24, 35)},
            { item = 'baggie_sk', price = math.random(27, 35)}
        }
    },
    ['vinewood'] = {
        points = {
            vector2(-663.80639648438, 114.2766418457),
            vector2(-660.09497070312, 299.65426635742),
            vector2(-546.58837890625, 275.86111450196),
            vector2(-542.21002197266, 357.8136291504),
            vector2(-519.6430053711, 349.90490722656),
            vector2(-512.67572021484, 276.3483581543),
            vector2(21.216751098632, 278.6813659668),
            vector2(49.785594940186, 339.29946899414),
            vector2(108.84923553466, 399.87518310546),
            vector2(124.068069458, 384.4684753418),
            vector2(92.195236206054, 354.55239868164),
            vector2(170.3550567627, 377.32186889648),
            vector2(841.11456298828, 199.74020385742),
            vector2(530.7640991211, -193.10136413574)
        },
        minZ = 45.0,
        maxZ = 125.0,
        drugs = {
            { item = 'baggie_coke', price = math.random(75, 150)},
            { item = 'joint_ak', price = math.random(15, 25)},
            { item = 'joint_ogk', price = math.random(18, 25)},
            { item = 'joint_ph', price = math.random(21, 30)},
            { item = 'joint_sk', price = math.random(25, 30)},
            { item = 'baggie_ak', price = math.random(18, 30)},
            { item = 'baggie_ogk', price = math.random(21, 30)},
            { item = 'baggie_ph', price = math.random(24, 35)},
            { item = 'baggie_sk', price = math.random(27, 35)}
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
    local message = 'Drug Dealer spotted at '..coords
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
