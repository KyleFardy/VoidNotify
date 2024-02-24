fx_version 'adamant'
game 'gta5'
author 'Void Development'
description 'Clean Notification System'
version '1.0'
ui_page 'html/ui.html'
files {
	'html/*.*',
}
client_scripts {
	'client/main.lua',
}
server_scripts {
	'server/main.lua',
}
shared_scripts {
    'shared/config.lua'
}
export 'NOTIFY'