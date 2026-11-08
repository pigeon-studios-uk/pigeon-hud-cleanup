fx_version 'cerulean'
game 'gta5'
lua54 'yes'

name 'pigeon-hud-cleanup'
author 'Pigeon Studios'
description 'Hides the parts of GTA\'s HUD you choose, from cash and area names to the crosshair, and sets when the minimap shows.'
version '1.0.0'
repository 'https://github.com/pigeon-studios-uk/pigeon-hud-cleanup'

-- Pigeon Studios version registry entry, read by server/version_check.lua.
pigeon_slug 'pigeon-hud-cleanup'

client_scripts {
    'configuration/config.lua',
    'client/main.lua',
}

server_scripts {
    'server/version_check.lua',
}
