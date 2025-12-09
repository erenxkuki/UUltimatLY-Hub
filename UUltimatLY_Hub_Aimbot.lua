local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/land9678/Sapi-Hub-V1/refs/heads/main/KavoUI.txt"))()
local AimlockModule = loadstring(game:HttpGet("https://raw.githubusercontent.com/jaanu91/Ip/refs/heads/main/Dk"))()
local ESPModule = loadstring(game:HttpGet("https://raw.githubusercontent.com/jaanu91/Ip/refs/heads/main/Gk"))()
local SilentAimModule = loadstring(game:HttpGet("https://raw.githubusercontent.com/jaanu91/Ip/refs/heads/main/Bg"))()
local StuffsModule = loadstring(game:HttpGet("https://raw.githubusercontent.com/jaanu91/Ip/refs/heads/main/Stuf"))()
local OthersStuffsModule = loadstring(game:HttpGet("https://raw.githubusercontent.com/jaanu91/Ip/refs/heads/main/Mot"))()
local UiSettingsModule = loadstring(game:HttpGet("https://raw.githubusercontent.com/jaanu91/Ip/refs/heads/main/Vot"))()
local ZSkillModule = loadstring(game:HttpGet("https://raw.githubusercontent.com/jaanu91/Ip/refs/heads/main/Teku"))()
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local UserInputService = game:GetService("UserInputService")  
local TeleportService = game:GetService("TeleportService")
local PlayerList = {"None"}

local toggleGui = Instance.new("ScreenGui")
toggleGui.Name = "ToggleGui"
toggleGui.Parent = game.CoreGui

local toggleButton = Instance.new("ImageButton")
toggleButton.Name = "SHV1"
toggleButton.Size = UDim2.new(0, 40, 0, 40)
toggleButton.Position = UDim2.new(0, 5, 0, 10)
toggleButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
toggleButton.BackgroundTransparency = 0.2
toggleButton.BorderSizePixel = 0
toggleButton.ZIndex = 9999
toggleButton.Image = "rbxassetid://73642467719097"
toggleButton.Parent = toggleGui

local toggleCorner = Instance.new("UICorner")
toggleCorner.CornerRadius = UDim.new(0, 8)
toggleCorner.Parent = toggleButton

UiSettingsModule:MakeDraggable(toggleButton)

local Settings = OthersStuffsModule.LoadSettings()

local executor = "Unknown"
if syn then
    executor = "Synapse X"
elseif KRNL_LOADED then
    executor = "KRNL"
elseif fluxus then
    executor = "Fluxus"
elseif getexecutorname then
    local success, execName = pcall(getexecutorname)
    if success and type(execName) == "string" then
        executor = execName
    end
end

local execStatus = (executor == "Xeno" or executor:lower():find("solara") or executor:lower():find("krnl")) and "Not Working" or "Working"

local Window = Library.CreateLib("UUltimatLY Hub Blox Fruit PvP  |  " .. executor, UiSettingsModule.currentTheme)

local Tab = Window:NewTab("◇・Executor Status")
local Section = Tab:NewSection("◈・Information")

Section:NewLabel("Executor: " .. executor)
Section:NewLabel("Status: " .. execStatus)

local Tab = Window:NewTab("⛓・ChangesLogs")
local Section = Tab:NewSection("✏・Updated")

Section:NewLabel("• New Aimbot Released by realryzu AKA (UUltimatLY)💮")
Section:NewLabel("• Added Info Of Target (Name/Health) ✔")
Section:NewLabel("• Optimized Script ✔")
Section:NewLabel("• Improved Fps Boost ✔")
Section:NewLabel("• Fixed Soul Guitar M1in Silent aim ✔")
Section:NewLabel("• Added RTX Graphic (Visual Vibes Only) ✔")
Section:NewLabel("• Added Custom Global Text ✔")
Section:NewLabel("• Added Dash No Cool Down ✔")
Section:NewLabel("• Added Remove Fog or Lava ✔")
Section:NewLabel("• Added Z Skills Work (Except Godhuman Z) ✔")
Section:NewLabel("• Added Fruit M1 Closet Attack ✔")
Section:NewLabel("• Fixed Buddy Sword X in Silent aim ✔")

local Tab = Window:NewTab("❖・Aimbot")
local Section = Tab:NewSection("☘・Settings")

local AimlockPlayersToggle = Section:NewToggle("・Aimlock Players", "Lock onto nearest player", function(state)
    AimlockModule:SetPlayerAimlock(state)
    Settings["AimlockPlayers"] = state
end)

local AimlockPlayersMiniTogglePlayersToggle = Section:NewToggle("・Aimlock Mini Toggle Players", "Lock onto nearest player", function(state)
    AimlockModule:SetMiniTogglePlayerAimlock(state)
    Settings["AimlockPlayersMiniTogglePlayers"] = state
end)

local AimlockNPCToggle = Section:NewToggle("・Aimlock NPC", "Lock onto nearest NPC/Boss", function(state)
    AimlockModule:SetNpcAimlock(state)
    Settings["AimlockNPC"] = state
end)

local AimlockPlayersMiniToggleNPCToggle = Section:NewToggle("・Aimlock Mini Toggle NPC", "Lock onto nearest NPC/Boss", function(state)
    AimlockModule:SetMiniToggleNpcAimlock(state)
    Settings["AimlockPlayersMiniToggleNPC"] = state
end)

local PredictionToggle = Section:NewToggle("・Prediction", "Predict enemy movement", function(state)
    AimlockModule:SetPrediction(state)
    Settings["Prediction"] = state
end)

Section:NewDropdown("・Prediction Amount | Default 0.1s", "Select max Prediction for Aimlock", {"0.2", "0.3", "0.4"}, function(selected)
    local num = tonumber(selected)
    if num then
        AimlockModule:SetPredictionTime(num)
        Settings["PredictionAmount"] = num
    end
end)

local Tab = Window:NewTab("⛩・Silent Aimbot")
local Section = Tab:NewSection("⚓・Settings")

local SilentAimPlayersToggle = Section:NewToggle("・SilentAim Players", "Lock onto nearest player", function(state)
    SilentAimModule:SetPlayerSilentAim(state)
    Settings["SilentAimPlayers"] = state
end)

local SilentMiniTogglePlayersToggle = Section:NewToggle("・SilentAim Mini Toggle Players", "Lock onto nearest player", function(state)
    SilentAimModule:SetMiniTogglePlayerSilentAim(state)
    Settings["SilentMiniTogglePlayers"] = state
end)

local SilentAimNPCToggle = Section:NewToggle("・SilentAim Npcs", "Lock Onto Nearest NPC", function(state)
    SilentAimModule:SetNPCSilentAim(state)
    Settings["SilentAimNPC"] = state
end)

local SilentMiniToggleNPCToggle = Section:NewToggle("・SilentAim Mini Toggle NPC", "Lock onto nearest NPC/Boss", function(state)
    SilentAimModule:SetMiniToggleNpcSilentAim(state)
    Settings["SilentMiniToggleNPC"] = state
end)

local SilentAimPedictionToggle = Section:NewToggle("・SilentAim Prediction", "Prediction On Target", function(state)
    SilentAimModule:SetPrediction(state)
    Settings["SilentAimPediction"] = state
end)

Section:NewDropdown("・Prediction Future | Default 0.1s", "Select Max Prediction For Silent Aim", {"0.2", "0.3", "0.4"}, function(selected)
    local num = tonumber(selected)
    if num then
        SilentAimModule:SetPredictionAmount(num)
        Settings["SilentAimPredictionFuture"] = num
    end
end)

Section:NewDropdown("・Distance Limit | Default 1000m", "Select Max Distance For AimBot", {"200", "400", "600"}, function(selected)
    local num = tonumber(selected)
    if num then
        SilentAimModule:SetDistanceLimit(num)
        Settings["SilentAimDistanceLimit"] = num
    end
end)

for _, plr in ipairs(Players:GetPlayers()) do
    if plr ~= Players.LocalPlayer then
        table.insert(PlayerList, plr.Name)
    end
end

local PlayerDropdown = Section:NewDropdown("・Select Player Target", "Choose A Player To Lock Onto", PlayerList, function(selected)
    if selected == "None" then
        SilentAimModule:SetSelectedPlayer(nil)
    else
        SilentAimModule:SetSelectedPlayer(selected)
    end
end)

local function RefreshPlayerList()
    local newList = {"None"}
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= Players.LocalPlayer then
            table.insert(newList, plr.Name)
        end
    end
    PlayerDropdown:Refresh(newList, true)
end

Players.PlayerAdded:Connect(RefreshPlayerList)
Players.PlayerRemoving:Connect(RefreshPlayerList)
RefreshPlayerList()

local ZSkillToggle = Section:NewToggle("・GodhumanZ Aimlock", "Only Set Godhuman", function(state)
    ZSkillModule:SetZSkills(state)
    Settings["ZSkills"] = state
end)

local HighlightToggle = Section:NewToggle("・Main Highlight", "Current Target Highlighted", function(state)
    SilentAimModule:SetHighlight(state)
    Settings["Highlight"] = state
end)

local ZskillMOneToggle = Section:NewToggle("・Z|M1 Skills(except Godhuman Z)", "Silent Aim That Work With Some Skills", function(state)
    SilentAimModule:SetZSkillorM1(state)
    Settings["Zskillmone"] = state
end)

local Tab = Window:NewTab("✿・Features")
local Section = Tab:NewSection("⚜・Settings")

Section:NewButton("Join Discord", "Get Link Discord server", function()
	local link = "https://discord.gg/dtkbvtrM7G"
    if setclipboard then
        setclipboard(link)
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "UUltimatLY Hub",
            Text = "Copied Discord Link!",
            Duration = 5
        })
    end
end)

local ESPPlayersToggle = Section:NewToggle("・ESP Players", "Toggle Player ESP", function(state)
    ESPModule:SetESP(state)
    Settings["ESPPlayers"] = state
end)

local V3SkillToggle = Section:NewToggle("・V3 Skill", "Auto activate V3 ability", function(state)
    ESPModule:SetV3(state)
    Settings["V3Skill"] = state
end)

local BunnyHopToggle = Section:NewToggle("・Bunny hop", "Toggle Bunnyhop", function(state)
    ESPModule:SetBunnyhop(state)
    Settings["BunnyHop"] = state
end)

local AuraSkillToggle = Section:NewToggle("・Aura Skill", "Auto activate Buso", function(state)
    ESPModule:SetBuso(state)
    Settings["AuraSkill"] = state
end)

local FpsOrPingsToggle = Section:NewToggle("・Fps Or Pings", "Display Ping or Fps", function(state)
    StuffsModule:SetPingsOrFps(state)
    Settings["FpsOrPings"] = state
end)

Section:NewTextBox("Speed Hack", "WalkSpeedValue", function(speedfunc)
    local num = tonumber(speedfunc)
    if num then
        getgenv().WalkSpeedValue = num
        UiSettingsModule:SetWalkSpeed(num)
    end
end)

local FpsBoostToggle = Section:NewToggle("・Fps Boost", "Increase Fps", function(state)
    StuffsModule:SetFpsBoost(state)
    Settings["FpsBoost"] = state
end)

local INFEnergyToggle = Section:NewToggle("・INF Energy", "Max Energy", function(state)
    StuffsModule:SetINFEnergy(state)
    Settings["INFEnergy"] = state
end)

local WalkonWaterToggle = Section:NewToggle("・Walk on Water", "Travel in Water", function(state)
    StuffsModule:SetWalkWater(state)
    Settings["WalkonWater"] = state
end)

local FastAttackToggle = Section:NewToggle("・Fast Attack", "Fast Attack", function(state)
    StuffsModule:SetFastAttack(state)
    Settings["FastAttack"] = state
end)

local AntiAFKToggle = Section:NewToggle("・AntiAfk", "Anti-Afk Only On Before You Off", function(state)
    ESPModule:SetAntiAfk(state)
    Settings["AntiAFK"] = state
end)

Section:NewTextBox("Jump Power", "JumpValue", function(jumpfunc)
  getgenv().JumpValue = jumpfunc
    if getgenv().JumpValue then
        game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower = getgenv().JumpValue
    end
end)

local V4Toggle = Section:NewToggle("・Auto V4", "Auto V4 Transform", function(state)
    UiSettingsModule:SetV4(state)
    Settings["V4"] = state
end)

local FruitCheckToggle = Section:NewToggle("・Spawned Fruit Check", "Check Fruit Spawned", function(state)
    UiSettingsModule:SetFruitCheck(state)
    Settings["FruitCheck"] = state
end)

local TeleportFruitToggle = Section:NewToggle("・Bring Fruits", "It Take Few Seconds To Bring Fruits", function(state)
    UiSettingsModule:SetTeleportFruit(state)
    Settings["TeleportFruit"] = state
end)

local AutoKenToggle = Section:NewToggle("・Auto Ken", " AutoKen", function(state)
    SilentAimModule:SetAutoKen(state)
    Settings["AutoKen"] = state
end)

local LavaToggle = Section:NewToggle("・Remove Lava", "Remove Lava", function(state)
    StuffsModule:SetLava(state)
    Settings["Lava"] = state
end)

local FogToggle = Section:NewToggle("・Remove Fog", "Remove Fog", function(state)
    StuffsModule:SetFog(state)
    Settings["Fog"] = state
end)

local DodgeToggle = Section:NewToggle("・Dodge no cd", "Dodge no cd", function(state)
    ESPModule:SetNoDodgeCD(state)
    Settings["Dodge"] = state
end)

local OpponentToggle = Section:NewToggle("・Target Info(Name/Health)", "Info Of Target", function(state)
    ZSkillModule:SetInfo(state)
    Settings["Opponent"] = state
end)

local Tab = Window:NewTab("⚙・Settings Manager")
local Section = Tab:NewSection("💾・Settings")

Section:NewTextBox("Paste Job Id Here", "Paste JobId and press Enter", function(jobid)
    if jobid and jobid ~= "" then
        TeleportService:TeleportToPlaceInstance(game.PlaceId, jobid, Players.LocalPlayer)
    end
end)

Section:NewButton("Save Current Settings", "Save all current settings", function()
    OthersStuffsModule.SaveSettings(Settings)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "UUltimatLY Hub",
        Text = "Settings Saved!",
        Duration = 4
    })
end)

Section:NewButton("Reset Settings", "Clear saved settings", function()
    OthersStuffsModule.ResetSettings()
    Settings = {} -- also clear local
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "UUltimatLY Hub",
        Text = "Settings Reset!",
        Duration = 4
    })
end)

Section:NewButton("Rejoin Server", "Rejoin your server", function()
    StuffsModule:SetRejoinServer()
end)

Section:NewDropdown("・Global Text Font", "Change font for all text", {
    "Arcade",
    "Cartoon",
    "SciFi",
    "Fantasy",
    "Antique",
    "Garamond",
    "RobotoMono",
    "FredokaOne",
    "LuckiestGuy",
    "PermanentMarker",
    "SpecialElite",
    "Oswald",
    "Nunito"
}, function(selected)
    local fontEnum = Enum.Font[selected]
    if fontEnum then
        ESPModule:SetGlobalFont(fontEnum)
        Settings["GlobalFont"] = selected
    else
        warn("Font not found:", selected)
    end
end)

Section:NewDropdown("・RTX Graphics Mode", "Choose between Autumn or Summer or Spring or Winter", {"Autumn", "Summer", "Spring", "Winter"}, function(selected)
    ESPModule:SetRTXMode(selected)
    Settings["RTXMode"] = selected
end)

Section:NewDropdown("Select Theme", "Choose a color theme", UiSettingsModule:getThemeNames(), function(selected)
    local newColor = UiSettingsModule.themes[selected]
    if newColor then
        UiSettingsModule:updateSchemeColor(newColor, Library)
    end
end)

Section:NewDropdown("Select Background Theme", "Choose a color background", UiSettingsModule:getBackgroundThemeNames(), function(selected)
    local newColor = UiSettingsModule.backgroundThemes[selected]
    if newColor then
        UiSettingsModule:updateBackgroundColor(newColor, Library)
    end
end)

Section:NewDropdown("Select TextColor", "Choose a textcolor", UiSettingsModule:getThemeNames(), function(selected)
    local newColor = UiSettingsModule.themes[selected]
    if newColor then
        UiSettingsModule:updateTextColor(newColor, Library)
    end
end)

Settings = OthersStuffsModule.LoadSettings()

OthersStuffsModule:ApplySettings(Settings, {
    Aimlock = AimlockModule,
    SilentAim = SilentAimModule,
    ESP = ESPModule,
    Stuffs = StuffsModule,
    Ui = UiSettingsModule,
    Zskill= ZSkillModule
}, {
    AimlockPlayers = AimlockPlayersToggle,
    AimlockPlayersMiniTogglePlayers = AimlockPlayersMiniTogglePlayersToggle,
    AimlockNPC = AimlockNPCToggle,
    SilentAimPlayers = SilentAimPlayersToggle,
    SilentAimNPC = SilentAimNPCToggle,
    ESPPlayers = ESPPlayersToggle,
    AntiAFK = AntiAFKToggle,
    FpsOrPings = FpsOrPingsToggle,
    FpsBoost = FpsBoostToggle,
    INFEnergy = INFEnergyToggle,
    FastAttack = FastAttackToggle,
    WalkonWater = WalkonWaterToggle,
    V4 = V4Toggle,
    FruitCheck = FruitCheckToggle,
    TeleportFruit = TeleportFruitToggle,
    AutoKen = AutoKenToggle,
    ZSkills = ZSkillToggle,
    BunnyHop = BunnyHopToggle,
    AuraSkill = AuraSkillToggle,
    V3Skill = V3SkillToggle,
    Highlight = HighlightToggle,
    SilentMiniToggleNPC = SilentMiniToggleNPCToggle,
    SilentMiniTogglePlayers = SilentMiniTogglePlayersToggle,
    Zskillmone = ZskillMOneToggle,
    SilentAimPediction = SilentAimPedictionToggle,
    Dodge = DodgeToggle,
    Lava = LavaToggle,
    Fog = FogToggle
})

OthersStuffsModule.StartFruitNotifier()

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.M then
        Library:ToggleUI()
		toggleButton.Visible = not toggleButton.Visible
    end
end)

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and UserInputService.KeyboardEnabled and input.KeyCode == Enum.KeyCode.G then

        Settings["SilentAimPlayers"] = not Settings["SilentAimPlayers"]
        SilentAimModule:SetPlayerSilentAim(Settings["SilentAimPlayers"])
        if SilentAimPlayersToggle then
            SilentAimPlayersToggle:UpdateToggle(Settings["SilentAimPlayers"])
        end
    end
end)

toggleButton.MouseButton1Click:Connect(function()
    Library:ToggleUI()
end)
