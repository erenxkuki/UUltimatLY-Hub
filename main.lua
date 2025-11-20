-- UUltimatLY HUB | MAIN LOADER 2025
-- Made for KUKI @erenxkuki | Full Farm Tab

repeat wait() until game:IsLoaded()
wait(1)

-- MADARA INTRO
loadstring(game:HttpGet("https://raw.githubusercontent.com/erenxkuki/UUltimatLY-Hub/main/IntroVideo.lua"))()
wait(3)

-- RAYFIELD UI
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/UI-Interface/Rayfield/main/source.lua'))()

local Window = Rayfield:CreateWindow({
    Name = "UUltimatLY HUB",
    LoadingTitle = "UUltimatLY HUB V1",
    LoadingSubtitle = "by KUKI @erenxkuki",
    ConfigurationSaving = {Enabled = true, FolderName = "UUltimatLYHub"},
})

-- FARM TAB (ALL TOGGLES APPEAR HERE)
local FarmTab = Window:CreateTab("Farm", 4483362458)

-- AUTO FARM TOGGLE
FarmTab:CreateToggle({
    Name = "Auto Farm Level (Sea 1-3 Auto Detect)",
    CurrentValue = false,
    Callback = function(v)
        getgenv().AutoFarm = v
        if v then
            Rayfield:Notify({Title="Auto Farm ON", Content="Started farming in current sea", Duration=5})
            loadstring(game:HttpGet("https://raw.githubusercontent.com/erenxkuki/UUltimatLY-Hub/main/modules/AutoFarm.lua"))()
        else
            Rayfield:Notify({Title="Auto Farm OFF", Content="Stopped", Duration=3})
        end
    end,
})

-- BRING MOB TOGGLE
FarmTab:CreateToggle({
    Name = "Bring Mob (Extra Fast)",
    CurrentValue = true,
    Callback = function(v)
        getgenv().BringMob = v
    end,
})

-- AUTO HAKI TOGGLE
FarmTab:CreateToggle({
    Name = "Auto Buso Haki",
    CurrentValue = true,
    Callback = function(v)
        getgenv().AutoHaki = v
    end,
})

-- AUTO OBSERVATION TOGGLE
FarmTab:CreateToggle({
    Name = "Auto Observation Haki",
    CurrentValue = false,
    Callback = function(v)
        getgenv().AutoKen = v
    end,
})

-- AUTO QUEST TOGGLE
FarmTab:CreateToggle({
    Name = "Auto Quest (Skip if already taken)",
    CurrentValue = true,
    Callback = function(v)
        getgenv().AutoQuest = v
    end,
})

-- FAST ATTACK TOGGLE (clean built-in)
FarmTab:CreateToggle({
    Name = "Fast Attack (Clean & Safe)",
    CurrentValue = true,
    Callback = function(v)
        getgenv().FastAttack = v
    end,
})

-- OTHER TABS
local MiscTab = Window:CreateTab("Misc", 4483362458)
MiscTab:CreateButton({Name = "Server Hop", Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/erenxkuki/UUltimatLY-Hub/main/ServerHop.lua"))()
end})

MiscTab:CreateButton({Name = "FPS Boost", Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/erenxkuki/UUltimatLY-Hub/main/FPSBoost.lua"))()
end})

MiscTab:CreateLabel("Made by KUKI @erenxkuki")
MiscTab:CreateLabel("Discord: discord.gg/uultimatly")

Rayfield:Notify({
    Title = "UUltimatLY HUB Loaded!",
    Content = "All toggles in Farm tab — KUKI ON TOP",
    Duration = 10,
})
