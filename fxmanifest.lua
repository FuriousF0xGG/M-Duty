fx_version 'cerulean'
game 'gta5'

author 'Max W.#0001, thanks to tazio and badger as I did take some code from there staff duty script and PoliceEMSActivity script'
description 'A script to go on duty'
version '0.1'
url 'No_link'

client_scripts {
	'client.lua',
    'EmergencyBlips/cl_emergencyblips.lua',
}

server_scripts {
	'config.lua',
	"server.lua",
    'EmergencyBlips/sv_emergencyblips.lua',
}