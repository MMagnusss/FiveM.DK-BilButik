local QBCore = exports['qb-core']:GetCoreObject()

-- Commands

-- /sellcar <pris>
RegisterCommand("sellcar", function(source, args)
    local src = source
    local pris = args[1]
    if not IsPedInAnyVehicle(PlayerPedId(), false) then return QBCore.Functions.Notify("Du er ikke i et køretøj", "error") end
    if not pris or tonumber(pris) <= 0 then return QBCore.Functions.Notify("Prisen skal være over 0", "error") end
    if not pris or tonumber(pris) >= 100000000 then return QBCore.Functions.Notify("Prisen skal være under 100 millioner", "error") end
    TriggerServerEvent('sellvehicle', pris, GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsIn(PlayerPedId()))):lower())
end)
-- /buycar <plade>

-- /carlist