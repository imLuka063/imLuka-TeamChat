

ESX 						   = nil
local Group 

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('luka_tc:GetGroup', function(source, cb)
    local player = ESX.GetPlayerFromId(source)

    if player ~= nil then
        Group = player.getGroup()
        if Group ~= nil then 
            cb(Group)
        else
            cb("user")
        end
    else
        cb("user")
    end
end)

RegisterCommand('tc', function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)
    local group = xPlayer.getGroup()
    if group ~= 'user' then
        TriggerClientEvent("sendMessageAdmin", -1, source, xPlayer.getName(), table.concat(args, " "))
        ESX.ShowNotification("Nachricht gesendet: " .. table.concat(args, " "))
    else
        ESX.ShowNotification("Du hast keine Berechtigung, diese Aktion auszuführen.")
    end
end, false)

  