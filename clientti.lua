ESX 					  	= nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

function OpenWeaponsSkinsMenu()
	local elements = {}
	local i = 1
	ESX.UI.Menu.CloseAll()

	if IsMK2(GetSelectedPedWeapon(GetPlayerPed(-1))) then
		table.insert(elements, {label = "Default", istint = true, value = 0})
		table.insert(elements, {label = "Classic Gray", istint = true, value = 1})
		table.insert(elements, {label = "Classic TwoTone", istint = true, value = 2})
		table.insert(elements, {label = "Classic White", istint = true, value = 3})
		table.insert(elements, {label = "Classic Beige", istint = true, value = 4})
		table.insert(elements, {label = "Classic Green", istint = true, value = 5})
		table.insert(elements, {label = "Classic Blue", istint = true, value = 6})
		table.insert(elements, {label = "Classic Earth", istint = true, value = 7})
		table.insert(elements, {label = "Classic Brown And Black", istint = true, value = 8})
		table.insert(elements, {label = "Red Contrast", istint = true, value = 9})
		table.insert(elements, {label = "Blue Contrast", istint = true, value = 10})
		table.insert(elements, {label = "Yellow Contrast", istint = true, value = 11})
		table.insert(elements, {label = "Orange Contrast", istint = true, value = 12})
		table.insert(elements, {label = "Bold Pink", istint = true, value = 13})
		table.insert(elements, {label = "Bold Purple And Yellow", istint = true, value = 14})
		table.insert(elements, {label = "Bold Orange", istint = true, value = 15})
		table.insert(elements, {label = "Bold Green And Purple", istint = true, value = 16})
		table.insert(elements, {label = "Bold Red Features", istint = true, value = 17})
		table.insert(elements, {label = "Bold Green Features", istint = true, value = 18})
		table.insert(elements, {label = "Bold Cyan Features", istint = true, value = 19})
		table.insert(elements, {label = "Bold Yellow Features", istint = true, value = 20})
		table.insert(elements, {label = 'Bold Red And White', istint = true, value = 21})
		table.insert(elements, {label = "Bold Blue And White", istint = true, value = 22})
		table.insert(elements, {label = "Metallic Gold", istint = true, value = 23})
		table.insert(elements, {label = "Metallic Platinum", istint = true, value = 24})
		table.insert(elements, {label = "Metallic Gray And Lilac", istint = true, value = 25})
		table.insert(elements, {label = "Metallic Purple And Lime", istint = true, value = 26})
		table.insert(elements, {label = "Metallic Red", istint = true, value = 27})
		table.insert(elements, {label = "Metallic Green", istint = true, value = 28})
		table.insert(elements, {label = "Metallic Blue", istint = true, value = 29})
		table.insert(elements, {label = "Metallic White And Aqua", istint = true, value = 30})                                     
		table.insert(elements, {label = "Metallic Red And Yellow", istint = true, value = 31})
	else
		table.insert(elements, {label = "Default", istint = true, value = 0})
		table.insert(elements, {label = "Green", istint = true, value = 1})
		table.insert(elements, {label = "Gold", istint = true, value = 2})
		table.insert(elements, {label = "Pink", istint = true, value = 3})
		table.insert(elements, {label = "Army", istint = true, value = 4})
		table.insert(elements, {label = "LSPD", istint = true, value = 5})
		table.insert(elements, {label = "Orange", istint = true, value = 6})
		table.insert(elements, {label = "Platinum", istint = true, value = 7})
	end

	ESX.UI.Menu.Open(
	    'default', GetCurrentResourceName(), 'esx_extraitems_skins',
	    {
	        title    = "Maalaus",
	        align    = 'bottom-left',
	        elements = elements,
	    },
	    function(data, menu)
	    	if data.current.reset == true then
	    		for k, v in pairs(WeaponsSkins) do
					if GetHashKey(k) == GetSelectedPedWeapon(GetPlayerPed(-1)) then
						for ke, va in pairs(v.hashes) do
							RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetSelectedPedWeapon(GetPlayerPed(-1)), va)
						end
					end
				end
	    	elseif data.current.camo == nil then
	    		SetPedWeaponTintIndex(GetPlayerPed(-1), GetSelectedPedWeapon(GetPlayerPed(-1)), data.current.value)
	    	else
	    		GiveWeaponComponentToPed(GetPlayerPed(-1), GetSelectedPedWeapon(GetPlayerPed(-1)), data.current.camo)
	    	end
	    end,
	    function(data, menu)  
	        menu.close()
	    end
	)
end

WeaponsSkins = {
	["WEAPON_PISTOL_MK2"] = {
	},
	["WEAPON_SNSPISTOL_MK2"] = {
	},	
	["WEAPON_HEAVYSNIPER_MK2"] = {
	},
	["WEAPON_SPECIALCARBINE_MK2"] = {
	},
}

function IsMK2(item)
	for k, v in pairs(WeaponsSkins) do
		if GetHashKey(k) == item then
			return true
		end
	end
	return false
end

RegisterNetEvent('esx_extraitems:varjaus')
AddEventHandler('esx_extraitems:varjaus', function()
	OpenWeaponsSkinsMenu()
end)

