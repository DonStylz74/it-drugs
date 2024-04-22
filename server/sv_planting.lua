local plants = {}

-- Method to calculate the health percentage for a given WeedPlants index
--- @param k number - WeedPlants table index
--- @return health number - health index [0-100]
local calcHealth = function(k)
    if not plants[k] then return 0 end
    local health = plants[k].health

    -- fertilizer at interval_time amount:
    local fertilizer_amount = plants[k].fertilizer
    local water_amount = plants[k].water

    if fertilizer_amount == 0 and water_amount == 0 then
        health -= math.random(Config.HealthBaseDecay[1], Config.HealthBaseDecay[2])
    elseif fertilizer_amount < Config.FertilizerThreshold or water_amount < Config.WaterThreshold then
        health -= math.random(Config.HealthBaseDecay[1], Config.HealthBaseDecay[2])
    end

    if fertilizer_amount == 0 or water_amount == 0 then
        health -= math.random(Config.HealthBaseDecay[1], Config.HealthBaseDecay[2])
    elseif fertilizer_amount < Config.FertilizerThreshold or water_amount < Config.WaterThreshold then
         health -= math.random(Config.HealthBaseDecay[1], Config.HealthBaseDecay[2])
    end

    plants[k].health = math.max(health, 0.0)
    return math.max(health, 0.0)
end

--- Method to calculate the growth percentage for a given WeedPlants index
--- @param k number - WeedPlants table index
--- @return retval number - growth index [0-100]
local calcGrowth = function(k)
    if not plants[k] then return false end
    -- If the plant is dead the growth doesnt change anymore
    if plants[k].health <= 0 then return 0 end
    local current_time = os.time()
    local growTime = plants[k].growtime * 60
    local progress = os.difftime(current_time, plants[k].time)
    local growth = it.round(progress * 100 / growTime, 2)
    local retval = math.min(growth, 100.00)
    return retval
end

--- Method to calculate the growth stage of a weedplant for a given growth index
--- @param growth number - growth index [0-99]
--- @return stage number - growth stage number [1-3]
local calcStage = function(growth)
    local stage = math.floor(growth / 33) + 1
    if stage > 3 then stage = 3 end
    return stage
end

--- Method to setup all the weedplants, fetched from the database
--- @return nil
local setupPlants = function()
    local result = MySQL.Sync.fetchAll('SELECT * FROM drug_plants')
    local current_time = os.time()

    for k, v in pairs(result) do

        local plantType = Config.Plants[v.type].plantType

        local growTime = v.growtime * 60
        local progress = os.difftime(current_time, v.time)
        local growth = math.min(it.round(progress * 100 / growTime, 2), 100.00)
        local stage = calcStage(growth)
        local modelHash = Config.PlantTypes[plantType][stage][1]
        local coords = json.decode(v.coords)
        local plant = CreateObjectNoOffset(modelHash, coords.x, coords.y, coords.z + Config.PlantTypes[plantType][stage][2], true, true, false)
        FreezeEntityPosition(plant, true)
        plants[plant] = {
            id = v.id,
            coords = vector3(coords.x, coords.y, coords.z),
            time = v.time,
            type = v.type,
            entity = plant,
            fertilizer = v.fertilizer,
            water = v.water,
            growtime = v.growtime,
            health = v.health,
        }
    end
end

--- Method to delete all cached weed plants and their entities
--- @return nil
local destroyAllPlants = function()    
    for k, v in pairs(plants) do
        if DoesEntityExist(k) then
            DeleteEntity(k)
            plants[k] = nil
        end
    end
end

--- Method to update a plant object, removing the existing one and placing a new object
--- @param k number - WeedPlants table index
--- @param stage number - Stage number
--- @return nil
local updatePlantProp = function(k, stage)
    if not plants[k] then return end
    if not DoesEntityExist(k) then return end
    if plants[k].health <= 0 then return end

    local plantType = Config.Plants[plants[k].type].plantType

    local modelHash = Config.PlantTypes[plantType][stage][1]
    DeleteEntity(k)
    local plant = CreateObjectNoOffset(modelHash, plants[k].coords.x, plants[k].coords.y, plants[k].coords.z + Config.PlantTypes[plantType][stage][2], true, true, false)
    FreezeEntityPosition(plant, true)
    plants[plant] = plants[k]
    plants[k] = nil
end

updatePlantNeeds = function ()
    for k, v in pairs(plants) do
        local fertilizer = v.fertilizer
        local water = v.water

        local time = os.time()
        local planted = v.time

        local elapsed = os.difftime(time, planted)
        -- if elapsed is < 1 minute, skip this plant
        if elapsed >= 60 then
            if fertilizer - Config.FertilizerDecay >= 0 then
                plants[k].fertilizer = it.round(fertilizer - Config.FertilizerDecay, 2)
            else
                plants[k].fertilizer = 0
            end
    
            if water - Config.WaterDecay >= 0 then
                plants[k].water = it.round(water - Config.WaterDecay, 2)
            else
                plants[k].water = 0
            end
            local health = calcHealth(k)
            MySQL.update('UPDATE drug_plants SET water = (:water), fertilizer = (:fertilizer), health = (:health) WHERE id = (:id)', {
                ['water'] = v.water,
                ['fertilizer'] = v.fertilizer,
                ['health'] = health,
                ['id'] = v.id,
            })
        end

        local stage = calcStage(calcGrowth(k))
        if stage ~= v.stage then
            plants[k].stage = stage
            updatePlantProp(k, stage)
        end
    end

    SetTimeout(60 * 1000, updatePlantNeeds)
end

AddEventHandler('onResourceStart', function(resource)
    if resource ~= GetCurrentResourceName() then return end
    while not DatabaseSetuped do
        lib.print.info('Waiting for Database to be setup')
        Wait(100)
    end
    if Config.Debug then lib.print.info('Setup Plants') end
    setupPlants()
    if Config.ClearOnStartup then
        Wait(5000) -- Wait 5 seconds to allow all functions to be executed on startup
        for k, v in pairs(plants) do
            if plants[k].health == 0 then
                DeleteEntity(k)
                MySQL.query('DELETE from drug_plants WHERE id = :id', {
                    ['id'] = plants[k].id
                })
                plants[k] = nil
            end
        end
    end

    SendToWebhook(0, 'message', nil, 'Started '..GetCurrentResourceName()..' logger')

end)

AddEventHandler('onResourceStop', function(resource)
    if resource ~= GetCurrentResourceName() then return end
    
    for k, v in pairs(plants) do
        MySQL.update('UPDATE drug_plants SET water = (:water), fertilizer = (:fertilizer) WHERE id = (:id)', {
            ['water'] = json.encode(v.water),
            ['fertilizer'] = json.encode(v.fertilizer),
        })
    end
    
    destroyAllPlants()

end)

--- Events

RegisterNetEvent('it-drugs:server:destroyPlant', function(entity)
    if not plants[entity] then return end
    if #(GetEntityCoords(GetPlayerPed(source)) - plants[entity].coords) > 10 then return end

    SendToWebhook(source, 'plant', 'destroy', plants[entity])

    if Config.Debug then lib.print.info('Does Entity Exists:', DoesEntityExist(entity)) end
    if DoesEntityExist(entity) then
        MySQL.query('DELETE from drug_plants WHERE id = :id', {
            ['id'] = plants[entity].id
        })

        TriggerClientEvent('it-drugs:client:startPlantFire', -1, plants[entity].coords)
        Wait(Config.FireTime / 2)
        DeleteEntity(entity)

        plants[entity] = nil
    end
end)

RegisterNetEvent('it-drugs:server:harvestPlant', function(entity)

    if not plants[entity] then return end
    local src = source
    local player = it.getPlayer(src)
    if not player then return end
    if #(GetEntityCoords(GetPlayerPed(src)) - plants[entity].coords) > 10 then return end
    if calcGrowth(entity) ~= 100 then return end

    if DoesEntityExist(entity) then
        for k, v in pairs(Config.Plants[plants[entity].type].products) do
            local product = k
            local minAmount = v.min
            local maxAmount = v.max
            local amount = math.random(minAmount, maxAmount)
            it.giveItem(src, product, amount)
        end
        if math.random(0, 100) >= Config.Plants[plants[entity].type].seed.chance then 
            local seed = plants[entity].type
            local seedAmount = math.random(Config.Plants[seed].seed.min, Config.Plants[seed].seed.max)
            it.giveItem(src, seed, seedAmount)
        end
    
        DeleteEntity(entity)
        SendToWebhook(src, 'plant', 'harvest', plants[entity])
  
        MySQL.query('DELETE from drug_plants WHERE id = :id', {
            ['id'] = plants[entity].id
        })
        plants[entity] = nil
    end
end)

RegisterNetEvent('it-drugs:server:giveWater', function(entity, item)
    if not plants[entity] then return end
    local src = source
    local player = it.getPlayer(src)
    if not player then return end
    if #(GetEntityCoords(GetPlayerPed(src)) - plants[entity].coords) > 10 then return end

    if it.removeItem(src, item, 1) then

        SendToWebhook(src, 'plant', 'water', plants[entity])

        local itemStrength = Config.PlantWater[item]
        local currentWater = plants[entity].water
        if currentWater + itemStrength >= 100 then
            plants[entity].water = 100
        else
            plants[entity].water = currentWater + itemStrength
        end

        MySQL.update('UPDATE drug_plants SET water = (:water) WHERE id = (:id)', {
            ['water'] = json.encode(plants[entity].water),
            ['id'] = plants[entity].id,
        })
    end
end)

RegisterNetEvent('it-drugs:server:giveFertilizer', function(entity, item)
    if not plants[entity] then return end
    local src = source
    local player = it.getPlayer(src)
    if not player then return end
    if #(GetEntityCoords(GetPlayerPed(src)) - plants[entity].coords) > 10 then return end

    if it.removeItem(src, item, 1) then
        SendToWebhook(src, 'plant', 'fertilize', plants[entity])
        
        local itemStrength = Config.PlantFertilizer[item]
        local currentFertilizer = plants[entity].fertilizer
        if currentFertilizer + itemStrength >= 100 then
            plants[entity].fertilizer = 100
        else
            plants[entity].fertilizer = currentFertilizer + itemStrength
        end
        
        MySQL.update('UPDATE drug_plants SET fertilizer = (:fertilizer) WHERE id = (:id)', {
            ['fertilizer'] = json.encode(plants[entity].fertilizer),
            ['id'] = plants[entity].id,
        })
    end
end)

RegisterNetEvent('it-drugs:server:createNewPlant', function(coords, plantItem, zone)
    local src = source
    local player = it.getPlayer(src)
    local plantInfos = Config.Plants[plantItem]

    if not player then return end
    if #(GetEntityCoords(GetPlayerPed(src)) - coords) > Config.rayCastingDistance + 10 then return end

    if it.removeItem(src, plantItem, 1) then
        local modelHash = GetHashKey(Config.PlantTypes[plantInfos.plantType][1][1])
        local plant = CreateObjectNoOffset(modelHash, coords.x, coords.y, coords.z + Config.PlantTypes[plantInfos.plantType][1][2], true, true, false)
        FreezeEntityPosition(plant, true)
        local time = os.time()

        local growTime = Config.GlobalGrowTime
        if plantInfos.growthTime ~= nil then
            growTime = plantInfos.growthTime
        end
        if Config.Zones[zone] ~= nil and Config.Zones[zone].growMultiplier then
            growTime = (growTime / Config.Zones[zone].growMultiplier)
        end

        MySQL.insert('INSERT INTO `drug_plants` (coords, time, type, water, fertilizer, health, growtime) VALUES (:coords, :time, :type, :water, :fertilizer, :health, :growtime)', {
            ['coords'] = json.encode(coords),
            ['time'] = time,
            ['type'] = plantItem,
            ['water'] = 0.0,
            ['fertilizer'] = 0.0,
            ['health'] = 100.0,
            ['growtime'] = growTime,
        }, function(id)
            plants[plant] = {
                id = id,
                coords = coords,
                time = time,
                type = plantItem,
                water = 0.0,
                fertilizer = 0.0,
                health = 100.0,
                growtime = growTime,
                entity = plant
            }
            SendToWebhook(src, 'plant', 'plant', plants[plant])
        end)
    end
end)

-- Callbacks
lib.callback.register('it-drugs:server:getPlantData', function(source, netId)
    local entity = NetworkGetEntityFromNetworkId(netId)
    if not plants[entity] then return nil end
    if Config.Debug then lib.print.info('Get Plant Data:', entity) end
    local temp = {
        id = plants[entity].id,
        coords = plants[entity].coords,
        time = plants[entity].time,
        type = plants[entity].type,
        fertilizer = plants[entity].fertilizer,
        water = plants[entity].water,
        stage = calcStage(calcGrowth(entity)),
        health = plants[entity].health,
        growth = calcGrowth(entity),
        entity = entity
    }
    if Config.Debug then lib.print.info('Plant Data', temp) end
    return temp
end)

lib.callback.register('it-drugs:server:getPlants', function(source)
    return plants
end)

--- Threads
CreateThread(function()
    Wait(2000) -- Wait 5 seconds to allow all functions to be executed on startup
    updatePlantNeeds()
end)