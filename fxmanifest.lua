fx_version 'cerulean'
game 'gta5'
name 'pfmd_'
author 'PFMD'
version "1.0.1"
use_fxv2_oal 'yes'
lua54 'yes'




client_script {
	'config.lua',
	'client/*.lua',
	'client/editable/*.lua'
}


server_scripts {
	'config.lua',
	'server/*.lua'
}

shared_scripts {
	'@ox_lib/init.lua',
	'config.lua',
	'imports.lua',
}
files {
	'locales/*.json'
}


escrow_ignore {
	'config.lua',
	'editable/*.lua',
	'SETUP/*'
}
