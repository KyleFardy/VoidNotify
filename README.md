# Client side

exports['VoidNotify']:NOTIFY(toast, title, message, type, time)

# Server side

TriggerClientEvent('VoidNotify:NOTIFY', source, toast, title, message, type, time)


[Toast]: true or false to show a toast instead of popup

[Title]: Wont Be Shown If Toast

[Message]: Message Shown

[Type]: 
	- success (green)
	- info (blue)
	- warning (yellow)
	- error (red)
	- question (grey)
	- Any Image

[Time]: Length In Milliseconds

[Theme]: light Or dark

[Position]:
	- top-start (Top Left)
	- top (Top Center)
	- top-right (Top Right)
	
	- bottom-start (Bottom Left)
	- bottom (Bottom Center)
	- bottom-right (Bottom Right)
	
	- center-start (Middle Left)
	- center (Middle Center)
	- center-right (Middle Right)