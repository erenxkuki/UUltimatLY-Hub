-- UUltimatLY HUB | MAIN LOADER 2025
-- Made for KUKI @erenxkuki | Update 28 Tiger

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

local MainTab = Window:CreateTab("Main", 4483362458)

getgenv().AutoFarm = false

MainTab:CreateToggle({
    Name = "Auto Farm Level (Sea 1-3 Auto)",
    CurrentValue = false,
    Callback = function(v)
        getgenv().AutoFarm = v
        if v then
            Rayfield:Notify({Title="Auto Farm ON", Content="Started farming in current sea", Duration=5})
            loadstring(game:HttpGet("https://raw.githubusercontent.com/erenxkuki/UUltimatLY-Hub/main/modules/AutoFarm.lua"))()
        end
    end,
})

Rayfield:Notify({Title="UUltimatLY HUB Loaded!", Content="Made by KUKI @erenxkuki — King is here", Duration=10})
