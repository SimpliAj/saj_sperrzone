ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterCommand('pd', function(source, args, rawCommand)
    local radius = tonumber(args[1])
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getJob().name == "police" then
        for _, playerID in ipairs(GetPlayers()) do
            TriggerClientEvent("grv_sperrzone:setSperrzoneLSPD", playerID, source, radius)
        end
        TriggerEvent('okokChat:ServerMessage','linear-gradient(90deg, rgba(42, 42, 42, 0.9) 0%, rgba(75, 53, 219, 0.9) 100%)', '#4a6cfd','fas fa-bullhorn', 'Sperrzone', 'Polizei', 'Es wurde die Sperrzone von der Polizei ausgerufen', -1)
        exports['GJ_Logs']:createLog({
            EmbedMessage = 'Hat eine LSPD Sperrzone ausgerufen',
            player_id = source,
            channel = 'other logs',
            screenshot = true
        })
    else
        TriggerClientEvent('okokNotify:Alert', source, 'Information', 'Du musst ein Polizeibeamter sein, um dies zu tun!', 5000, 'error')
       -- TriggerClientEvent('chatMessage', source, 'SYSTEM', {255, 0, 0}, 'Du musst ein Polizeibeamter sein, um dies zu tun!')
    end
end)

RegisterCommand('pdrm', function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getJob().name == "police" then
        for _, playerID in ipairs(GetPlayers()) do
            TriggerClientEvent("grv_sperrzone:clearSperrzoneLSPD", playerID)
        end
        TriggerEvent('okokChat:ServerMessage','linear-gradient(90deg, rgba(42, 42, 42, 0.9) 0%, rgba(75, 53, 219, 0.9) 100%)', '#4a6cfd','fas fa-bullhorn', 'Sperrzone', 'Polizei', 'Es wurde die Sperrzone von der Polizei aufgehoben', -1)
        exports['GJ_Logs']:createLog({
            EmbedMessage = 'Hat eine LSPD Sperrzone zurückgerufen',
            player_id = source,
            channel = 'other logs',
            screenshot = true
        })
    else
        TriggerClientEvent('okokNotify:Alert', source, 'Information', 'Du musst ein Polizeibeamter sein, um dies zu tun!', 5000, 'error')
    end
end)
