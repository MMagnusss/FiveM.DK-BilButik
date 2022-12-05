local QBCore = exports["qb-core"]:GetCoreObject()

-- Events
RegisterNetEvent('sellvehicle', function(pris)
    local src = source
    local vehicle = GetVehiclePedIsIn(GetPlayerPed(src), false)
    local vehPlate = GetVehicleNumberPlateText(vehicle)
    print(src, vehicle, vehPlate)
end)