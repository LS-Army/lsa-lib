fx_version 'cerulean'
lua54 'yes'
game 'gta5'

name 'lss-lib'

shared_script {
  '@ox_lib/init.lua',
}

server_script {
  '@oxmysql/lib/MySQL.lua',
  'server/*.lua'
}

client_scripts {
  'client/*.lua',
}

-- ui_page('web/index.html')

-- files {
--   'web/index.html',
--   'web/style.css',
--   'web/index.js',
--   'locales/*.json'
-- }
