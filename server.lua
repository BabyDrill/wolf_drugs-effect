-- Developed by BabyDrill#2788
ESX = exports["es_extended"]:getSharedObject()

Citizen.CreateThread(function()
	print("^4[Wolf Development]^0 Script wolf_stress startato! Developed by BabyDrill#2788")
	for k, v in pairs(Config.Stress) do
		if v.effect.livel > 5 then 
			print("^1[Wolf Development]^0 Attenzione nella droga: "..k.." il livello non deve essere superiore al 5")
		end
		ESX.RegisterUsableItem(v.item, function(source)
			local xPlayer = ESX.GetPlayerFromId(source)
            if v.remove then 
				xPlayer.removeInventoryItem(v.item, 1)
			end
			TriggerClientEvent("wolfdev:stress", source, v.animation, v.effect)
		end)
	end	
end)
-- Developed by BabyDrill#2788