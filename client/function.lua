local cooldowns = {}

function checkCooldown(key)
    return cooldowns[key]
end

function handleCooldown(timer, key)
    if type(timer) ~= 'number' or type(key) ~= 'string' then return end

    if cooldowns[key] then
        return 'This key is currently active'
    end

    cooldowns[key] = true
    Citizen.CreateThread(function()
        Citizen.Wait(timer)
        cooldowns[key] = false
    end)
end

function createPed(model, coords)
    lib.requestModel(model)
    local ped = CreatePed(4, model, coords, false, false)
    FreezeEntityPosition(ped, true)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    TaskStartScenarioInPlace(ped, 'WORLD_HUMAN_COP_IDLES')
    return ped
end

function createObject(model, coords)
    lib.requestModel(model)
    local object = CreateObject(model, coords.xyz, false, false, false)
    SetEntityHeading(object, coords.w)
    PlaceObjectOnGroundProperly(object)
    FreezeEntityPosition(object, true)
    return object
end

exports("setCooldown", handleCooldown)
exports("getCooldown", checkCooldown)

exports("createPed", createPed)
exports("createObject", createObject)
