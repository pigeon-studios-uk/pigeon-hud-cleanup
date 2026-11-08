Config = {}

-- GTA's HUD parts, each hidden (true) or kept (false).
Config.Hide = {
    wanted_stars = true,     -- the wanted level stars
    cash = true,             -- story-mode cash, top right
    online_cash = true,      -- GTA Online cash and bank, top right
    cash_change = true,      -- the "+$100" that pops up when cash changes
    vehicle_name = true,     -- the vehicle's name, bottom right, when you get in
    vehicle_class = true,    -- the vehicle's class, under its name
    area_name = true,        -- the area's name, bottom right, such as "Vinewood"
    street_name = true,      -- the street's name, bottom right
    radio_station = false,   -- the station's name when the radio changes
    weapon_icon = false,     -- the weapon and ammo, top right, when you switch weapons
    weapon_wheel_stats = true, -- the damage, fire rate and range bars on the weapon wheel
    reticle = false,         -- the crosshair while aiming
    saving_game = true,      -- the "saving" spinner, bottom right
    online_message = false,  -- GTA Online's big messages in the middle of the screen
}

-- With reticle = true, keep the crosshair for sniper rifles, so they can still be aimed unscoped.
Config.KeepSniperReticle = true

-- The minimap, with the health and armour bars under it:
--   'always'   shown, as GTA has it
--   'vehicle'  only shown while in a vehicle
--   'never'    never shown
Config.Minimap = 'always'

-- Update checks are controlled in server.cfg for every Pigeon Studios resource at once:
--     set pigeon_update_check "on"      (default)  |  "quiet"  |  "off"
