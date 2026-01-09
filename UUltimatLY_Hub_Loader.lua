-- UUltimatLY Hub Loader - Made by realryzu (No GUI, Console Only)
-- Supports KAITUN (full auto progression) / FARM modes for Blox Fruits

local script_mode = "KAITUN"  -- Change this line to "FARM" if you want farm mode
-- KAITUN = full account build-up (auto level 1-max, auto stats allocation, auto buy items/fruits, unlocks races/styles/boss drops, etc.)
-- FARM = focused grinding (auto farm level/mobs/bosses/materials, but without full progression automation)

local scripts = {
    -- Blox Fruits main GameId
    [2753915549] = {
        KAITUN = "https://vxezestudio.online/api/scripts/script_f2cpodvqxpq/raw",
        FARM   = "https://vxezestudio.online/api/scripts/script_i4wonghqta8/raw",
    },
}

-- Check if we're in Blox Fruits
local gameId = game.GameId
local cfg = scripts[gameId]

if not cfg then
    game:GetService("Players").LocalPlayer:Kick("Game not supported by UUltimatLY Hub - Only Blox Fruits!")
    return
end

-- Select the script URL
local selected_url = cfg[script_mode:upper()] or cfg.KAITUN  -- fallback to KAITUN

-- Show simple console messages (visible in executor output)
print("──────────────────────────────────────────────")
print("     UUltimatLY Hub Loader - by realryzu      ")
print("──────────────────────────────────────────────")
print("Mode selected: " .. script_mode:upper())
print("Loading script from: " .. selected_url)
print("Starting in 3 seconds...")

wait(3)  -- Short delay so you can read the messages

-- Load the actual script
loadstring(game:HttpGet(selected_url, true))()

print("UUltimatLY Hub - " .. script_mode:upper() .. " mode loaded successfully!")
