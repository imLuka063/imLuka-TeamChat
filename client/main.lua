
local UserGroup

ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('sendMessageAdmin')
AddEventHandler('sendMessageAdmin', function(id, name, message)
    local myId = PlayerId()
    local pid = GetPlayerFromServerId(id)
    ESX.TriggerServerCallback('luka_tc:GetGroup', function(Group)
        local UserGroup = Group
        if pid == myId or (UserGroup ~= 'user' and pid ~= myId) then
			ESX.ShowNotification("[TEAMCHAT] |" .. name .. " sagt: " .. message)
        end
    end)
end)





