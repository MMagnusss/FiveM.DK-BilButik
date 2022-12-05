local QBCore = exports["qb-core"]:GetCoreObject()

-- Callbacks
QBCore.Functions.CreateCallback("loadList", function(source, cb)
	local result = MySQL.query.await("SELECT * FROM bilbutik", {})
	cb(result)
end)
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

AddEventHandler('onResourceStart', function(resourceName)
    if resourceName ~= GetCurrentResourceName() then return end
    if GetCurrentResourceName() == "Bilbutik" then return end
    Wait(5000)
    print("^1Navngiv "..GetCurrentResourceName().." om til \"Bilbutik\"")
    print("^1Navngiv "..GetCurrentResourceName().." om til \"Bilbutik\"")
    print("^1Navngiv "..GetCurrentResourceName().." om til \"Bilbutik\"")
    print("^1Navngiv "..GetCurrentResourceName().." om til \"Bilbutik\"")
    print("^1Navngiv "..GetCurrentResourceName().." om til \"Bilbutik\"")
    print("^1Navngiv "..GetCurrentResourceName().." om til \"Bilbutik\"")
    print("^1Navngiv "..GetCurrentResourceName().." om til \"Bilbutik\"")
    print("^1Navngiv "..GetCurrentResourceName().." om til \"Bilbutik\"")
    print("^1Navngiv "..GetCurrentResourceName().." om til \"Bilbutik\"")
    print("^1Navngiv "..GetCurrentResourceName().." om til \"Bilbutik\"")
    print("^1Navngiv "..GetCurrentResourceName().." om til \"Bilbutik\"")
end)