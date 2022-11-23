fx_version 'cerulean'
game 'gta5'

description 'NONAME'
version '0'


client_scripts {
    'client/main.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/main.lua',
    'server/main.lua',
    'server/db_char.lua'
}
ui_page 'html/index.html'

files{
	"html/main.css",
	"html/index.html",
	"html/app.js",
}
dependency 'oxmysql'


lua54 'yes'
server_scripts { '@mysql-async/lib/MySQL.lua' }server_scripts { '@mysql-async/lib/MySQL.lua' }server_scripts { '@mysql-async/lib/MySQL.lua' }server_scripts { '@mysql-async/lib/MySQL.lua' }server_scripts { '@mysql-async/lib/MySQL.lua' }