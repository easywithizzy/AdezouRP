PlayerGroup = nil

Citizen.CreateThread(function()
	while PlayerGroup == nil do
		ESX.TriggerServerCallback("esx_ava_personalmenu:getUsergroup", function(group) 
			PlayerGroup = group
		end)
		Citizen.Wait(10)
	end
end)


RegisterNetEvent('esx_avan0x:sendReport')
AddEventHandler('esx_avan0x:sendReport', function(id, name, message)
    local myId = PlayerId()
    local sourceId = GetPlayerFromServerId(id)
    if sourceId == myId then
        TriggerEvent('chatMessage', "", {255, 0, 0}, "Rapport envoyé aux administrateurs en ligne !\n")
        TriggerEvent('chatMessage', "", {255, 0, 0}, " [REPORT] ^0| ^2[".. id .."] ^6" .. name .."  "..":^0  " .. message)
    elseif group ~= 'user' and sourceId ~= myId then
        TriggerEvent('chatMessage', "", {255, 0, 0}, " [REPORT] ^0| ^2[".. id .."] ^6" .. name .."  "..":^0  " .. message)
    end
end)
