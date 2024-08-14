blipRadius = 150.0
lspdCol = 3
lspdBlip = "PD: Sperrzone"

local lspdBlip = nil
local radiusBlipLSPD = nil

RegisterNetEvent("grv_sperrzone:setSperrzoneLSPD")
AddEventHandler("grv_sperrzone:setSperrzoneLSPD", function(s, lspdRadius)
    RemoveBlip(lspdBlip)
    RemoveBlip(radiusBlipLSPD)

    if lspdRadius == nil then
        lspdRadius = blipRadius
    end

    local src = s
    local coords = GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(src)))
    lspdBlip = AddBlipForCoord(coords.x, coords.y, coords.z)
    radiusBlipLSPD = AddBlipForRadius(coords.x, coords.y, coords.z, lspdRadius)
    SetBlipSprite(lspdBlip, 161)
    SetBlipAsShortRange(lspdBlip, true)
    SetBlipColour(lspdBlip, lspdCol)
    SetBlipScale(lspdBlip, 1.0)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentString('Sperrzone')
    EndTextCommandSetBlipName(lspdBlip)

    SetBlipAlpha(radiusBlipLSPD, 80)
    SetBlipColour(radiusBlipLSPD, lspdCol)
end)

RegisterNetEvent('grv_sperrzone:clearSperrzoneLSPD')
AddEventHandler("grv_sperrzone:clearSperrzoneLSPD", function()
    RemoveBlip(lspdBlip)
    RemoveBlip(radiusBlipLSPD)
end)
