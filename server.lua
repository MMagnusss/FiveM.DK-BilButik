local QBCore = exports["qb-core"]:GetCoreObject()

-- Events
RegisterNetEvent('sellvehicle', function(pris, vehName)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local vehicle = GetVehiclePedIsIn(GetPlayerPed(src), false)
    local vehPlate = GetVehicleNumberPlateText(vehicle)
    if not vehicle then return QBCore.Functions.Notify("Læs readme", "error") end
    MySQL.insert('INSERT INTO `bilbutik` (`vehicle`, `plate`, `price`, `citizenid`) VALUES (:vehicle, :plate, :price, :citizenid)', {
        citizenid = Player.PlayerData.citizenid,
        vehicle = vehName,
        plate = vehPlate,
        price = pris,
    })
end)