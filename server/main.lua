ESX = nil

CreateThread(function ()
	if exports["es_extended"]:getSharedObject() then
		ESX = exports["es_extended"]:getSharedObject()
		if ESX ~= nil then
			CreateThread(function ()
				Wait(2000)
				print("[ESX] Optimized for ESX Legacy")
			end)
		else
			TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
			if ESX ~= nil then
				CreateThread(function ()
					Wait(2000)
					print("[ESX] Optimized for ESX V1")
				end)
			else
				CreateThread(function ()
					Wait(2000)
					print("[ESX] Failed to fetch Framework")
				end)
			end
		end
	else
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		if ESX ~= nil then
			CreateThread(function ()
				Wait(2000)
				print("[ESX] Optimized for ESX V1")
			end)
			else
				CreateThread(function ()
				Wait(2000)
				print("[ESX] Failed to fetch Framework")
			end)
		end
	end
end)

CreateThread(function ()
	while true do
		Wait(10000)
		for _, id in ipairs(GetPlayers()) do
			local xPlayer = ESX.GetPlayerFromId(id)
			if xPlayer ~= nil then
				local xName = xPlayer.getName()
				for _, blacklistedName in pairs(Config.BlacklistedWords) do
					local name = xName:lower()
					local blacklist = blacklistedName:lower()
					if name:find(blacklist) then
						Config.CustomBanFunction(xPlayer.source, "[Blacklisted Name System] : You have been kicked for a blacklisted ESX Identity Name. Found String: " ..blacklist.. " in Name: " ..name)
					end
				end
			end
		end
	end
end)
