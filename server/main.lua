RegisterCommand("notify", function(source, args, rawCommand)
	TriggerClientEvent('VoidNotify:NOTIFY', -1, args[1], args[2], args[3], args[4], 5000, args[5], args[6])
end, false)
