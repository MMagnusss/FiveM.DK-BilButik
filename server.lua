local QBCore = exports["qb-core"]:GetCoreObject()

-- Callbacks
QBCore.Functions.CreateCallback("loadList", function(source, cb)
	local result = MySQL.query.await("SELECT * FROM `bilbutik`", {})
	cb(result)
end)
-- Events
RegisterNetEvent('sellVehicle', function(pris, vehName)
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

RegisterNetEvent('buyVehicle', function(plate)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local res = MySQL.query.await("SELECT * FROM `bilbutik` WHERE plate=:plate", {plate = plate})
    if not res[1] then return QBCore.Functions.Notify(src, "Der er ikke noget køretøj med pladen: "..plate.." til salg!", "error") end
    MySQL.update("DELETE FROM `bilbutik` WHERE plate=:plate", {plate = plate})
    QBCore.Functions.Notify(src, "Tillykke med dit nye køretøj!", "success")
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