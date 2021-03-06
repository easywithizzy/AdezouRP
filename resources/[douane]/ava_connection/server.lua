----------------------------------------------------
------------ MADE BY GITHUB.COM/AVAN0X -------------
------------------- AvaN0x#6348 --------------------
---------- DISCORD REQUESTS ARE BASED ON -----------
--- https://github.com/sadboilogan/discord_perms ---
----------------------------------------------------

local formattedToken

function DiscordRequest(method, endpoint, jsondata)
    local data = nil
    PerformHttpRequest("https://discordapp.com/api/"..endpoint, function(errorCode, resultData, resultHeaders)
			data = {data=resultData, code=errorCode, headers=resultHeaders}
		end,
		method, #jsondata > 0 and json.encode(jsondata) or "",
		{["Content-Type"] = "application/json", ["Authorization"] = formattedToken})

    while data == nil do
        Citizen.Wait(0)
    end

    return data
end

function SendWebhookEmbedMessage(webhookName, title, description, color)
	local webhook = GetConvar(webhookName, "none")
	if webhook ~= "none" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode(
			{
				embeds = {
					{
						title = title,
						description = description,
						color = color
					}
				}
			}), { ['Content-Type'] = 'application/json'})
	end
end

Citizen.CreateThread(function()
	local botToken = GetConvar("avan0x_bot_token", "avan0x_bot_token")
	if botToken ~= "avan0x_bot_token" then
		formattedToken = "Bot " .. botToken
		local guild = DiscordRequest("GET", "guilds/" .. Config.GuildId, {})
		if guild.code == 200 then
			local data = json.decode(guild.data)
			print("Permission system guild set to: "..data.name.." ("..data.id..")")
		else
			print("An error occured, please check your config and ensure everything is correct. Error: " .. (guild.data or guild.code))
		end
	else
		print("You need to use \"set avan0x_bot_token 'YOUR BOT TOKEN'\" in your server.cfg.")
	end
end)


function has_value(table, val)
	if table then
		for k, v in ipairs(table) do
			if v == val then
				return true
			end
		end
	end
	return false
end

AddEventHandler("playerConnecting", function(name, setCallback, deferrals)
    local gotRole = false
	local discordId = nil
	deferrals.defer()
	deferrals.update("Vérification des permissions...")

    for k, v in ipairs(GetPlayerIdentifiers(source)) do
        if string.sub(v, 1, string.len("discord:")) == "discord:" then
			discordId = string.gsub(v, "discord:", "")
            deferrals.update("Ton ID discord a été trouvé...")
            break
        end
    end

    if discordId then
		local endpoint = ("guilds/%s/members/%s"):format(Config.GuildId, discordId)
		local member = DiscordRequest("GET", endpoint, {})
		if member.code == 200 then
			local data = json.decode(member.data)
			for k, v in ipairs(Config.WhitelistedRoles) do 
				if has_value(data.roles, v) then
					gotRole = true
					break
				end
			end

			if gotRole then
				name = data.user.username .. "#" .. data.user.discriminator .. " (" .. name .. ")"
				print(name .. " se connecte.")
				SendWebhookEmbedMessage("avan0x_wh_connections", "", name .. " se connecte.", 311891)
				deferrals.done()
				return
			end
		end
		deferrals.presentCard([==[{"type":"AdaptiveCard","body":[{"type":"TextBlock","size":"ExtraLarge","weight":"Bolder","text":"Discord introuvable ?"},{"type":"TextBlock","text":"Vous devez être présent sur notre discord pour pouvoir nous rejoindre.","wrap":true},{"type":"Image","url":"https://cdn.discordapp.com/attachments/756841114589331457/757211539014156318/banniere_animee.gif","altText":""},{"type":"ActionSet","actions":[{"type":"Action.OpenUrl","title":"Nous rejoindre ! discord.gg/KRTKC6b","url":"https://discord.gg/KRTKC6b"}]}],"$schema":"http://adaptivecards.io/schemas/adaptive-card.json","version":"1.0"}]==],
		function(data, rawData)
			deferrals.done("discord.gg/KRTKC6b")
        end)
    else
        deferrals.done("Discord n'a pas été détecté. Veuillez vous assurer que Discord est en cours d'exécution et est installé. Voir le lien ci-dessous pour un processus de débogage - docs.faxes.zone/docs/debugging-discord")
    end
end)

AddEventHandler('playerDropped', function(reason)
    for k, v in ipairs(GetPlayerIdentifiers(source)) do
		if string.match(v, "discord:") then
			discordId = string.gsub(v, "discord:", "")
			break
		end
    end
	local name = (GetPlayerName(source) or "SteamName")

    if discordId then
        local endpoint = ("users/%s"):format(discordId)
        local member = DiscordRequest("GET", endpoint, {})
        if member.code == 200 then
			local data = json.decode(member.data)
			name = data.username .. "#" .. data.discriminator .. " (" .. name .. ")"
		end
	end
	print(name .. " a quitté.\n\tRaison : " .. reason)
	SendWebhookEmbedMessage("avan0x_wh_connections", "", name .. " a quitté.\n\tRaison : " .. reason, 16733269)
end)


