--[[
=====================================
| author: Nkfree                    |
| github: https://github.com/Nkfree |
==========================================================================================================================================
| installation:                                                                                                                          |
|   1. Create resurrectActors folder in <tes3mp>/server/scripts/custom/                                                                  |
|   2. Download main.lua and add it to that newly created resurrectActors folder                                                         |
|   3. Open customScripts.lua and put there this line: require("custom.resurrectActors.main")                                            |
|   4. Save customScripts.lua and launch the server                                                                                      |
|   5. To confirm the script is running fine, you should see "[ResurrectActors] Running..." among the first few lines of server console  |
==========================================================================================================================================
]]

local script = {}

-- Resurrect times for each group are defined here
script.resurrectTimes = {}

script.resurrectTimes["A"] = 60
script.resurrectTimes["B"] = 90
script.resurrectTimes["C"] = 1

-- refId group pairs
-- refId belongs to a group, by default there is A, B and C group
script.refIdGroupPairs = {}

-- A group
script.refIdGroupPairs["alit"] = "A"
script.refIdGroupPairs["alit_blighted"] = "A"
script.refIdGroupPairs["alit_diseased"] = "A"
script.refIdGroupPairs["ancestor_ghost"] = "A"
script.refIdGroupPairs["ascended_sleeper"] = "A"
script.refIdGroupPairs["ash_ghoul"] = "A"
script.refIdGroupPairs["ash_slave"] = "A"
script.refIdGroupPairs["ash_zombie"] = "A"
script.refIdGroupPairs["ash_zombie_fgaz"] = "A"
script.refIdGroupPairs["atronach_flame"] = "A"
script.refIdGroupPairs["atronach_flame_az"] = "A"
script.refIdGroupPairs["atronach_flame_ttmk"] = "A"
script.refIdGroupPairs["atronach_frost"] = "A"
script.refIdGroupPairs["atronach_frost_ttmk"] = "A"
script.refIdGroupPairs["atronach_storm"] = "A"
script.refIdGroupPairs["atronach_storm_az"] = "A"
script.refIdGroupPairs["atronach_storm_ttmk"] = "A"
script.refIdGroupPairs["balyn omavel"] = "A"
script.refIdGroupPairs["bonelord"] = "A"
script.refIdGroupPairs["bonewalker"] = "A"
script.refIdGroupPairs["bonewalker_greater"] = "A"
script.refIdGroupPairs["bonewalker_weak"] = "A"
script.refIdGroupPairs["centurion_shock_baladas"] = "A"
script.refIdGroupPairs["centurion_sphere"] = "A"
script.refIdGroupPairs["centurion_sphere_hts2"] = "A"
script.refIdGroupPairs["centurion_sphere_nchur"] = "A"
script.refIdGroupPairs["centurion_spider_nchur"] = "A"
script.refIdGroupPairs["centurion_steam"] = "A"
script.refIdGroupPairs["centurion_steam_exhibit"] = "A"
script.refIdGroupPairs["centurion_steam_hts"] = "A"
script.refIdGroupPairs["centurion_steam_nchur"] = "A"
script.refIdGroupPairs["clannfear"] = "A"
script.refIdGroupPairs["cliff racer"] = "A"
script.refIdGroupPairs["cliff racer_blighted"] = "A"
script.refIdGroupPairs["cliff racer_diseased"] = "A"
script.refIdGroupPairs["corprus_lame"] = "A"
script.refIdGroupPairs["corprus_stalker"] = "A"
script.refIdGroupPairs["daedroth"] = "A"
script.refIdGroupPairs["daedroth_az"] = "A"
script.refIdGroupPairs["daedroth_baladas"] = "A"
script.refIdGroupPairs["dreugh"] = "A"
script.refIdGroupPairs["dwarven ghost"] = "A"
script.refIdGroupPairs["guar"] = "A"
script.refIdGroupPairs["guar_feral"] = "A"
script.refIdGroupPairs["hunger"] = "A"
script.refIdGroupPairs["hunger_az_01"] = "A"
script.refIdGroupPairs["hunger_az_02"] = "A"
script.refIdGroupPairs["kagouti"] = "A"
script.refIdGroupPairs["kagouti_blighted"] = "A"
script.refIdGroupPairs["kagouti_diseased"] = "A"
script.refIdGroupPairs["kwama forager blighted"] = "A"
script.refIdGroupPairs["kwama forager"] = "A"
script.refIdGroupPairs["kwama forager_tb"] = "A"
script.refIdGroupPairs["kwama queen_abaesen"] = "A"
script.refIdGroupPairs["kwama queen_ahanibi"] = "A"
script.refIdGroupPairs["kwama queen_akimaes"] = "A"
script.refIdGroupPairs["kwama queen_eluba"] = "A"
script.refIdGroupPairs["kwama queen_eretammus"] = "A"
script.refIdGroupPairs["kwama queen_gnisis"] = "A"
script.refIdGroupPairs["kwama queen_hairat"] = "A"
script.refIdGroupPairs["kwama queen_hhem"] = "A"
script.refIdGroupPairs["kwama queen_madas"] = "A"
script.refIdGroupPairs["kwama queen_maesa"] = "A"
script.refIdGroupPairs["kwama queen_matus"] = "A"
script.refIdGroupPairs["kwama queen_panabanit"] = "A"
script.refIdGroupPairs["kwama queen_sarimisun"] = "A"
script.refIdGroupPairs["kwama queen_shurdan"] = "A"
script.refIdGroupPairs["kwama queen_sinamusa"] = "A"
script.refIdGroupPairs["kwama queen_zalkin"] = "A"
script.refIdGroupPairs["kwama warrior blighted"] = "A"
script.refIdGroupPairs["kwama warrior shurdan"] = "A"
script.refIdGroupPairs["kwama warrior"] = "A"
script.refIdGroupPairs["kwama worker blighted"] = "A"
script.refIdGroupPairs["kwama worker diseased"] = "A"
script.refIdGroupPairs["kwama worker entrance"] = "A"
script.refIdGroupPairs["kwama worker"] = "A"
script.refIdGroupPairs["mudcrab"] = "A"
script.refIdGroupPairs["mudcrab-diseased"] = "A"
script.refIdGroupPairs["mudcrab_hrmudcrabnest"] = "A"
script.refIdGroupPairs["netch_betty"] = "A"
script.refIdGroupPairs["netch_betty_ranched"] = "A"
script.refIdGroupPairs["netch_bull"] = "A"
script.refIdGroupPairs["netch_bull_ranched"] = "A"
script.refIdGroupPairs["nix-hound blighted"] = "A"
script.refIdGroupPairs["nix-hound"] = "A"
script.refIdGroupPairs["nix-hound_dampworm"] = "A"
script.refIdGroupPairs["ogrim titan"] = "A"
script.refIdGroupPairs["ogrim"] = "A"
script.refIdGroupPairs["ogrim_az"] = "A"
script.refIdGroupPairs["rat"] = "A"
script.refIdGroupPairs["rat_blighted"] = "A"
script.refIdGroupPairs["rat_diseased"] = "A"
script.refIdGroupPairs["scamp"] = "A"
script.refIdGroupPairs["scrib blighted"] = "A"
script.refIdGroupPairs["scrib diseased"] = "A"
script.refIdGroupPairs["scrib"] = "A"
script.refIdGroupPairs["shalk"] = "A"
script.refIdGroupPairs["shalk_blighted"] = "A"
script.refIdGroupPairs["shalk_diseased"] = "A"
script.refIdGroupPairs["skeleton archer"] = "A"
script.refIdGroupPairs["skeleton champion"] = "A"
script.refIdGroupPairs["skeleton warrior"] = "A"
script.refIdGroupPairs["skeleton"] = "A"
script.refIdGroupPairs["skeleton_weak"] = "A"
script.refIdGroupPairs["slaughterfish"] = "A"
script.refIdGroupPairs["slaughterfish_small"] = "A"
script.refIdGroupPairs["winged twilight"] = "A"

-- B group
script.refIdGroupPairs["dremora"] = "B"
script.refIdGroupPairs["dremora_lord"] = "B"
script.refIdGroupPairs["golden saint"] = "B"

-- C group
script.refIdGroupPairs["scamp_creeper"] = "C"

script.actorsToResurrect = {}


function script.LoadActorsToResurrect()
    local actorsData = jsonInterface.load("custom/resurrectActors.json")

    if actorsData == nil then
        script.SaveActorsToResurrect()
    else
        script.actorsToResurrect = actorsData
    end
end

function script.SaveActorsToResurrect()
    jsonInterface.quicksave("custom/resurrectActors.json", script.actorsToResurrect)
end

function script.CreateInitalActorEntry(initialCellDescription, uniqueIndex, refId, location)
    -- Do not write the same uniqueIndex twice
    if script.actorsToResurrect[uniqueIndex] ~= nil then return end

    script.actorsToResurrect[uniqueIndex] = {
        deathCellDescription = nil,
        refId = string.lower(refId),
        resurrectCellDescription = initialCellDescription,
        resurrectLocation = tableHelper.deepCopy(location)
    }
end

function script.MarkActorDeathCell(cellDescription, uniqueIndex)
    script.actorsToResurrect[uniqueIndex].deathCellDescription = cellDescription
end

function script.GetActorResurrectTime(refId)
    local group = script.refIdGroupPairs[refId]
    return script.resurrectTimes[group]
end

function ResurrectActor(uniqueIndex)

    if logicHandler.GetConnectedPlayerCount() < 1 then return end

    local actorData = script.actorsToResurrect[uniqueIndex]

    if actorData == nil then
        return
    end

    local deathCellDescription = actorData.deathCellDescription
    local refId = actorData.refId
    local resurrectCellDescription = actorData.resurrectCellDescription
    local resurrectLocation = actorData.resurrectLocation

    local cell = LoadedCells[deathCellDescription] or logicHandler.LoadCell(deathCellDescription) or
        LoadedCells[deathCellDescription]

    -- Remove actor from world and cell data
    logicHandler.DeleteObjectForEveryone(deathCellDescription, uniqueIndex)
    tableHelper.removeValue(cell.data.packets.death, uniqueIndex)
    tableHelper.removeValue(cell.data.packets.actorList, uniqueIndex)
    tableHelper.removeValue(cell.data.packets.death, uniqueIndex)
    tableHelper.removeValue(cell.data.packets.container, uniqueIndex)
    tableHelper.removeValue(cell.data.packets.equipment, uniqueIndex)
    tableHelper.removeValue(cell.data.packets.position, uniqueIndex)
    tableHelper.removeValue(cell.data.packets.spawn, uniqueIndex)
    tableHelper.removeValue(cell.data.packets.statsDynamic, uniqueIndex)
    cell.data.objectData[uniqueIndex] = nil

    -- Handle cell unloading - if it should happen
    if deathCellDescription ~= resurrectCellDescription and #cell.visitors == 0 then
        logicHandler.UnloadCell(deathCellDescription)
    end

    cell = LoadedCells[resurrectCellDescription] or logicHandler.LoadCell(resurrectCellDescription) or
        LoadedCells[resurrectCellDescription]

    local newUniqueIndex = logicHandler.CreateObjectAtLocation(resurrectCellDescription, resurrectLocation,
        dataTableBuilder.BuildObjectData(refId), "spawn")

    tes3mp.LogMessage(enumerations.log.INFO,
        "[ResurrectActors] Resurrected " ..
        refId ..
        " with new uniqueIndex: " .. newUniqueIndex .. "(" .. uniqueIndex .. ") at " .. resurrectCellDescription)

    script.CreateInitalActorEntry(resurrectCellDescription, newUniqueIndex, refId, resurrectLocation)
    script.actorsToResurrect[uniqueIndex] = nil
    script.SaveActorsToResurrect()

    if #cell.visitors == 0 then
        logicHandler.UnloadCell(deathCellDescription)
    end
end

-- Due to the way the LoadCell works, either actor positions and dynamic data will be saved
-- or the cell will be loaded
function SaveInitialActorPositions(cellDescription)
    local cell = LoadedCells[cellDescription] or logicHandler.LoadCell(cellDescription) or LoadedCells[cellDescription]

    cell:SaveActorPositions()

    local objectData = cell.data.objectData

    for _, uniqueIndex in ipairs(cell.data.packets.actorList) do
        if objectData[uniqueIndex] ~= nil and objectData[uniqueIndex].refId ~= nil and
            objectData[uniqueIndex].location ~= nil then
            script.CreateInitalActorEntry(cellDescription, uniqueIndex, objectData[uniqueIndex].refId,
                objectData[uniqueIndex].location)
        end
    end

    if #cell.visitors == 0 then
        logicHandler.UnloadCell(cellDescription)
    end
end

function script.OnServerPostInitHandler(eventStatus)
    tes3mp.LogMessage(enumerations.log.INFO, "[ResurrectActors] Running...")
    script.LoadActorsToResurrect()
end

function script.OnActorListHandler(eventStatus, pid, cellDescription, actors)
    tes3mp.StartTimer(tes3mp.CreateTimerEx("SaveInitialActorPositions", time.seconds(1), "s", cellDescription))
end

function script.OnPlayerAuthentifiedHandler(eventStatus, pid)
    -- If there were any other players on the server
    -- the timers should be running correctly,
    -- therefore exit the handler
    if logicHandler.GetConnectedPlayerCount() > 1 then return end

    for uniqueIndex, actorData in pairs(script.actorsToResurrect) do
        if actorData.deathCellDescription ~= nil then
            local resurrectTime = script.GetActorResurrectTime(actorData.refId)
            tes3mp.StartTimer(tes3mp.CreateTimerEx("ResurrectActor", time.seconds(resurrectTime), "s", uniqueIndex))
        end
    end
end

-- Handle customly spawned actors
function script.OnObjectSpawnHandler(eventStatus, pid, cellDescription, objects)
    for uniqueIndex, object in pairs(objects) do
        -- Do not resurrect summons
        if object.summon == nil then
            script.CreateInitalActorEntry(cellDescription, uniqueIndex, object.refId, object.location)
        end
    end
end

function script.OnActorDeathHandler(eventStatus, pid, cellDescription, actors)

    local cell = LoadedCells[cellDescription]
    local unloadAtEnd = false

    if cell == nil then
        unloadAtEnd = true
        logicHandler.LoadCell(cellDescription)
        cell = LoadedCells[cellDescription]
    end

    for uniqueIndex, _ in pairs(actors) do
        local actorData = script.actorsToResurrect[uniqueIndex]
        if actorData == nil or actorData.deathCellDescription == nil then
            local resurrectTime = script.GetActorResurrectTime(actorData.refId)

            if resurrectTime ~= nil then
                script.MarkActorDeathCell(cellDescription, uniqueIndex)
                script.SaveActorsToResurrect()
                tes3mp.StartTimer(tes3mp.CreateTimerEx("ResurrectActor", time.seconds(resurrectTime), "s", uniqueIndex))
            end
        end
    end

    if unloadAtEnd then
        logicHandler.UnloadCell(cellDescription)
    end
end

customEventHooks.registerHandler("OnServerPostInit", script.OnServerPostInitHandler)
customEventHooks.registerHandler("OnActorList", script.OnActorListHandler)
customEventHooks.registerHandler("OnPlayerAuthentified", script.OnPlayerAuthentifiedHandler)
customEventHooks.registerHandler("OnObjectSpawn", script.OnObjectSpawnHandler)
customEventHooks.registerHandler("OnActorDeath", script.OnActorDeathHandler)
