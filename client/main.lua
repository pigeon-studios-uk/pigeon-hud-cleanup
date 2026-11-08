--[[
    Pigeon HUD Cleanup: client.

    Hides the parts of GTA's HUD chosen in Config.Hide, and shows the minimap always, only in vehicles or
    never. GTA only hides a HUD part for the frame it's told to, so this runs every frame; it's one quick
    call per hidden part.
]]

local RESOURCE = GetCurrentResourceName()
local SNIPERS = joaat('GROUP_SNIPER') & 0xFFFFFFFF

-- GTA's HUD component IDs, by the names used in the config. Help text, the weapon wheel itself and
-- subtitles aren't here: hiding them breaks things players need.
local COMPONENTS = {
    wanted_stars = 1,
    weapon_icon = 2,
    cash = 3,
    online_cash = 4,
    online_message = 5,
    vehicle_name = 6,
    area_name = 7,
    vehicle_class = 8,
    street_name = 9,
    cash_change = 13,
    reticle = 14,
    radio_station = 16,
    saving_game = 17,
    weapon_wheel_stats = 20,
}
local RETICLE = COMPONENTS.reticle

local hidden = {}
for name, id in pairs(COMPONENTS) do
    if Config.Hide and Config.Hide[name] == true then hidden[#hidden + 1] = id end
end

local function holdingSniper(ped)
    return (GetWeapontypeGroup(GetSelectedPedWeapon(ped)) & 0xFFFFFFFF) == SNIPERS
end

local function minimapWanted(ped)
    local mode = Config.Minimap or 'always'
    if mode == 'never' then return false end
    if mode == 'vehicle' then return IsPedInAnyVehicle(ped, false) end
    return true
end

CreateThread(function()
    local radarShown
    while true do
        local ped = PlayerPedId()

        for _, id in ipairs(hidden) do
            if id ~= RETICLE or not (Config.KeepSniperReticle and holdingSniper(ped)) then
                HideHudComponentThisFrame(id)
            end
        end

        local wanted = minimapWanted(ped)
        if wanted ~= radarShown then
            DisplayRadar(wanted)
            radarShown = wanted
        end

        Wait(0)
    end
end)

AddEventHandler('onResourceStop', function(resource)
    if resource == RESOURCE then DisplayRadar(true) end
end)
