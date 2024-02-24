function NOTIFY(toast, title, message, type, time, theme, position, sound)
	SendNUIMessage({
		action = 'do_notification',
		toast = toast,
		title = title,
		message = message,
		type = type,
		time = time,
		theme = theme,
		position = Config.Position,
		sound = sound,
	})
end

RegisterNetEvent('VoidNotify:NOTIFY')
AddEventHandler('VoidNotify:NOTIFY', function(toast, title, message, type, time, theme, position, sound)
	NOTIFY(toast, title, message, type, time, theme or Config.Theme, position or Config.Position, sound or Config.Sound);
end)
