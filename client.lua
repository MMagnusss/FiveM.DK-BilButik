local QBCore = exports['qb-core']:GetCoreObject()
local menuOpen = false

-- Commands

-- /sellcar <pris>
RegisterCommand("sellcar", function(source, args)
    local src = source
    local pris = args[1]
    if not IsPedInAnyVehicle(PlayerPedId(), false) then return QBCore.Functions.Notify("Du er ikke i et køretøj", "error") end
    if not pris or tonumber(pris) <= 0 then return QBCore.Functions.Notify("Prisen skal være over 0", "error") end
    if not pris or tonumber(pris) >= 100000000 then return QBCore.Functions.Notify("Prisen skal være under 100 millioner", "error") end
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    -- if not exports["qb-vehiclekeys"]:HasKeys(QBCore.Functions.GetPlate(vehicle)) then return QBCore.Functions.Notify("Du ejer ikke dette køretøj!", "error") end -- Virker ikke da den returnerer true hele tiden
    TriggerServerEvent('sellvehicle', pris, GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)):lower())
end)
-- /buycar <plade>

-- /carlist
RegisterCommand("carlist", function(source)
    menuOpen = not menuOpen
    SetNuiFocus(menuOpen, menuOpen)
    SendNUIMessage({
        resource = "Bilbutik",
        open = menuOpen,
        loadList = true,
    })
end)

-- NUI Callbacks

RegisterNUICallback("loadList", function()
    QBCore.Functions.TriggerCallback("loadList", function(list)
        SendNUIMessage({
            resource = "Bilbutik",
            list = list,
        })
    end)
end)

RegisterNUICallback("close", function()
    menuOpen = not menuOpen
    SetNuiFocus(menuOpen, menuOpen)
    SendNUIMessage({
        resource = "Bilbutik",
        close = true,
    })
end)