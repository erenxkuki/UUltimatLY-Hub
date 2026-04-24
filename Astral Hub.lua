--[[
   ╔══════════════════════════════════════════════════════════════╗
   ║     ASTRAL HUB - (PART 1 OF 5)                               ║
   ║     Base Systems: UI, Config, Services, Helpers,             ║
   ║     Fast Attack, Movement, Quest Data, Auto Farm Leveling    ║
   ║                                                              ║
   ╚══════════════════════════════════════════════════════════════╝
--]]

--// ================== WAIT FOR GAME LOAD ==================
if not game:IsLoaded() then
    repeat task.wait() until game:IsLoaded()
end
repeat task.wait() until game.Players.LocalPlayer:FindFirstChild("DataLoaded")

--// ================== SERVICES ==================
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local VirtualInputManager = game:GetService("VirtualInputManager")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local Lighting = game:GetService("Lighting")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
local VirtualUser = game:GetService("VirtualUser")
local StarterGui = game:GetService("StarterGui")
local CollectionService = game:GetService("CollectionService")
local Stats = game:GetService("Stats")
local UserInputService = game:GetService("UserInputService")

local Player = Players.LocalPlayer
local replicated = ReplicatedStorage
local Modules = ReplicatedStorage:WaitForChild("Modules")
local Net = Modules:WaitForChild("Net")

--// ================== WORLD DETECTION ==================
local function DetectWorld()
    local placeId = game.PlaceId
    if placeId == 2753915549 then return 1 end
    if placeId == 4442274628 then return 2 end
    if placeId == 7449423635 then return 3 end
    local map = Workspace:FindFirstChild("Map")
    if map then
        if map:FindFirstChild("Dressrosa") or map:FindFirstChild("Cafe") then return 2 end
        if map:FindFirstChild("PortTown") or map:FindFirstChild("Mansion") then return 3 end
    end
    return 1
end
local currentWorld = DetectWorld()
local World1 = currentWorld == 1
local World2 = currentWorld == 2
local World3 = currentWorld == 3

--// ================== COMPLETE CONFIGS ==================
getgenv().Configs = {
    -- Auto Farm Settings
    ["Auto Farming"] = true,
    
    -- Quest Settings
    ["Quest"] = {
        ["Evo Race V1"] = true,
        ["Evo Race V2"] = true,
        ["RGB Haki"] = true,
        ["Pull Lerver"] = true,
    },
    
    -- Weapon Lists
    ["Sword"] = {
        "Dual-Headed Blade","Smoke Admiral","Wardens Sword","Cutlass","Katana",
        "Dual Katana","Triple Katana","Iron Mace","Saber","Pole (1st Form)",
        "Gravity Blade","Longsword","Rengoku","Midnight Blade","Soul Cane",
        "Bisento","Yama","Tushita","Cursed Dual Katana"
    },
    ["Gun"] = {
        "Soul Guitar","Kabucha","Venom Bow","Musket","Flintlock",
        "Refined Slingshot","Magma Blaster","Dual Flintlock","Cannon",
        "Bizarre Revolver","Bazooka"
    },
    
    -- Melee / Fighting Styles
    ["Melee"] = {
        ["Black Leg"] = true,
        ["Electro"] = true,
        ["Fishman Karate"] = true,
        ["Dragon Claw"] = true,
        ["Superhuman"] = true,
        ["Death Step"] = true,
        ["Sharkman Karate"] = true,
        ["Electric Claw"] = true,
        ["Dragon Talon"] = true,
        ["Godhuman"] = true,
        ["Sanguine Art"] = true,
    },
    
    -- Race
    ["Race"] = {
        ["Auto V2"] = true,
        ["Auto V3"] = true,
        ["Auto V4"] = true,
    },
    
    -- Performance
    ["FPS Booster"] = true,
    
    -- Fast Attack
    ["FastAttack"] = {
        Enabled = true,
        AttackDistance = 65,
        AttackMobs = true,
        AttackPlayers = false,
        AttackCooldown = 0.000000002,
        ComboResetTime = 0.05,
        MaxCombo = 2,
        AutoClickEnabled = true,
        HitboxLimbs = {"RightLowerArm", "RightUpperArm", "LeftLowerArm", "LeftUpperArm", "RightHand", "LeftHand"}
    },
    
    -- Auto Cyborg
    ["AutoCyborg"] = {
        Enabled = true,
        AutoCollectChest = true,
        AutoRejoin = true,
        AutoHop = true,
        AutoJump = true,
        FightDarkbeard = false,
        FightDarkbeardOnlyWithFist = false,
        Starthop = true,
        Antikick = true,
        WhiteScreen = false,
    },
    
    -- Sea Events
    ["SeaEvents"] = {
        Enable = false,
        DangerLevel = "Lv 1",
        SelectedBoat = "Guardian",
        AutoSail = false,
        KillShark = false,
        KillTerrorShark = false,
        KillPiranha = false,
        KillFishCrew = false,
        KillHauntedCrew = false,
        KillPirateGrandBrigade = false,
        KillFishBoat = false,
        KillSeaBeast = false,
        KillLeviathan = false,
        KitsuneIsland = false,
        ShrineActive = false,
        CollectAzureEmber = false,
        TradeAzureEmber = false,
    },
    
    -- Mirage Island
    ["Mirage"] = {
        FindMirage = false,
        HighestPoint = false,
        CollectGear = false,
        AdvancedDealer = false,
        ChestM = false,
        GearESPTransparency = false,
    },
    
    -- Dragon Dojo
    ["Dragon"] = {
        DojoBelt = false,
        FarmBlazeEmber = false,
        UpgradeDraco = false,
        DragoV1 = false,
        DragoV2 = false,
        DragoV3 = false,
        RelicTrial = false,
        TrainDragoV4 = false,
        TpDragoTrial = false,
        BuyDragoRace = false,
        UpgradeDTUzoth = false,
    },
    
    -- Prehistoric Island
    ["Prehistoric"] = {
        FindIsland = false,
        PatchEvent = false,
        CollectDinoBones = false,
        CollectDragonEggs = false,
        ResetWhenComplete = false,
    },
    
    -- Fishing
    ["Fishing"] = {
        Enable = false,
        Rod = "Fishing Rod",
        Bait = "Basic Bait",
    },
    
    -- Material Farm
    ["MaterialFarm"] = {
        Enable = false,
        SelectedMaterial = nil,
    },
    
    -- ESP
    ["ESP"] = {
        Players = false,
        Fruits = false,
        Chests = false,
        IslandLocations = false,
        Berries = false,
    },
    
    -- Misc
    ["Misc"] = {
        PanicMode = false,
        RemoveHitVFX = false,
        DisableNotifications = false,
        StatsValue = 10,
        SelectWeapon = "Melee",
        BringMobs = true,
        AutoBuso = true,
        AutoRaceV3 = false,
        AutoRaceV4 = false,
        SpinPosition = false,
        BypassTP = false,
        SafeMode = false,
        AntiAFK = true,
        AutoTeam = "Pirates",
    },
    
    -- Settings
    ["Settings"] = {
        TweenSpeed = 350,
        HopThreshold = 30,
        MaxServerPlayers = 10,
    }
}

--// ================== AUTO TEAM SELECTION ==================
task.spawn(function()
    while task.wait() do
        pcall(function()
            if Player.PlayerGui:FindFirstChild("Main (minimal)") then
                local chooseTeam = Player.PlayerGui["Main (minimal)"]:FindFirstChild("ChooseTeam")
                if chooseTeam and chooseTeam.Visible then
                    replicated.Remotes.CommF_:InvokeServer("SetTeam", getgenv().Configs.Misc.AutoTeam)
                end
            end
        end)
    end
end)

task.wait(5)

--// ================== NOTIFICATION ==================
StarterGui:SetCore("SendNotification", {
    Title = "Astral Hub Ultimate",
    Text = "Loading Script...",
    Icon = "rbxassetid://122444592900332",
    Duration = 10,
})

--// ================== STATUS UI (DRAGGABLE) ==================
if CoreGui:FindFirstChild("AstralHubUI") then
    CoreGui.AstralHubUI:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AstralHubUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = CoreGui

-- Main Frame
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 380, 0, 310)
MainFrame.Position = UDim2.new(0.5, -190, 0.5, -155)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
MainFrame.BackgroundTransparency = 0.05
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 14)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(0, 200, 255)
MainStroke.Thickness = 2
MainStroke.Transparency = 0.2
MainStroke.Parent = MainFrame

-- Title Bar (Draggable)
local TitleBar = Instance.new("Frame")
TitleBar.Name = "TitleBar"
TitleBar.Size = UDim2.new(1, 0, 0, 36)
TitleBar.BackgroundColor3 = Color3.fromRGB(0, 150, 220)
TitleBar.BorderSizePixel = 0
TitleBar.Parent = MainFrame

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 14)
TitleCorner.Parent = TitleBar

local TitleFix = Instance.new("Frame")
TitleFix.Size = UDim2.new(1, 0, 0.5, 0)
TitleFix.Position = UDim2.new(0, 0, 0.5, 0)
TitleFix.BackgroundColor3 = Color3.fromRGB(0, 150, 220)
TitleFix.BorderSizePixel = 0
TitleFix.Parent = TitleBar

-- Avatar
local Avatar = Instance.new("ImageLabel")
Avatar.Size = UDim2.new(0, 28, 0, 28)
Avatar.Position = UDim2.new(0, 6, 0, 4)
Avatar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Avatar.Image = Players:GetUserThumbnailAsync(Player.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size48x48)
Avatar.Parent = TitleBar
Instance.new("UICorner", Avatar).CornerRadius = UDim.new(1, 0)

-- Title Label
local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(1, -80, 1, 0)
TitleLabel.Position = UDim2.new(0, 40, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "ASTRAL HUB ULTIMATE"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.Font = Enum.Font.GothamBlack
TitleLabel.TextSize = 15
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.Parent = TitleBar

-- Minimize Button
local MinBtn = Instance.new("TextButton")
MinBtn.Text = "─"
MinBtn.Size = UDim2.new(0, 28, 0, 28)
MinBtn.Position = UDim2.new(1, -34, 0, 4)
MinBtn.BackgroundColor3 = Color3.fromRGB(255, 200, 0)
MinBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
MinBtn.Font = Enum.Font.GothamBold
MinBtn.TextSize = 16
MinBtn.BorderSizePixel = 0
MinBtn.Parent = TitleBar
Instance.new("UICorner", MinBtn).CornerRadius = UDim.new(0, 6)

-- Content Area
local ContentFrame = Instance.new("Frame")
ContentFrame.Name = "Content"
ContentFrame.Size = UDim2.new(1, 0, 1, -36)
ContentFrame.Position = UDim2.new(0, 0, 0, 36)
ContentFrame.BackgroundTransparency = 1
ContentFrame.Parent = MainFrame

local ContentLayout = Instance.new("UIListLayout")
ContentLayout.Padding = UDim.new(0, 1)
ContentLayout.Parent = ContentFrame

local ContentPadding = Instance.new("UIPadding")
ContentPadding.PaddingLeft = UDim.new(0, 12)
ContentPadding.PaddingRight = UDim.new(0, 12)
ContentPadding.PaddingTop = UDim.new(0, 6)
ContentPadding.Parent = ContentFrame

-- Helper: Create Label
local function MakeLabel(name, text, color)
    local lbl = Instance.new("TextLabel")
    lbl.Name = name
    lbl.Text = text
    lbl.Size = UDim2.new(1, 0, 0, 24)
    lbl.BackgroundTransparency = 1
    lbl.TextColor3 = color or Color3.fromRGB(200, 200, 200)
    lbl.Font = Enum.Font.GothamBold
    lbl.TextSize = 13
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.RichText = true
    lbl.Parent = ContentFrame
    return lbl
end

-- Helper: Divider
local function MakeDivider()
    local div = Instance.new("Frame")
    div.Size = UDim2.new(1, 0, 0, 1)
    div.BackgroundColor3 = Color3.fromRGB(0, 150, 220)
    div.BackgroundTransparency = 0.5
    div.BorderSizePixel = 0
    div.Parent = ContentFrame
    return div
end

-- Status Label
local StatusRow = MakeLabel("StatusRow", "⚡ Status: Loading...", Color3.fromRGB(255, 220, 50))

MakeDivider()

-- Player Info
local LevelLabel = MakeLabel("LevelLabel", "📊 Level: 0", Color3.fromRGB(255, 255, 255))
local BeliLabel = MakeLabel("BeliLabel", "💰 Beli: 0", Color3.fromRGB(100, 255, 100))
local FragLabel = MakeLabel("FragLabel", "💎 Fragments: 0", Color3.fromRGB(200, 200, 255))
local DFLabel = MakeLabel("DFLabel", "🍎 Devil Fruit: None", Color3.fromRGB(255, 150, 255))

MakeDivider()

-- Target Info
local TargetLabel = MakeLabel("TargetLabel", "🎯 Target: Idle", Color3.fromRGB(150, 255, 150))
local QuestLabel = MakeLabel("QuestLabel", "📋 Quest: None", Color3.fromRGB(255, 200, 100))

MakeDivider()

-- Combat Info
local ChestRow = MakeLabel("ChestRow", "📦 Chests: 0", Color3.fromRGB(100, 220, 100))
local TimeLabel = MakeLabel("TimeLabel", "⏰ Time: 00:00:00", Color3.fromRGB(100, 180, 255))
local FPSLabel = MakeLabel("FPSLabel", "🖥️ FPS: 0", Color3.fromRGB(255, 150, 100))

MakeDivider()

-- Items
local FistRow = MakeLabel("FistRow", "🗡️ Fist of Darkness: ✗", Color3.fromRGB(255, 100, 100))
local CoreRow = MakeLabel("CoreRow", "🧠 Core Brain: ✗", Color3.fromRGB(255, 100, 100))
local ChipRow = MakeLabel("ChipRow", "💊 Microchip: ✗", Color3.fromRGB(255, 100, 100))
local CyborgRow = MakeLabel("CyborgRow", "🤖 Cyborg: ✗", Color3.fromRGB(255, 100, 100))

-- FPS Tracker
local frames, lastTick, fps = 0, tick(), 0
RunService.RenderStepped:Connect(function()
    frames = frames + 1
    if tick() - lastTick >= 1 then
        fps = frames
        frames = 0
        lastTick = tick()
    end
    pcall(function()
        FPSLabel.Text = "🖥️ FPS: " .. fps
    end)
end)

-- Time Formatter
local function FormatTime(gameTime)
    local h = math.floor(gameTime / 3600) % 24
    local m = math.floor(gameTime / 60) % 60
    local s = gameTime % 60
    return string.format("%02d:%02d:%02d", h, m, s)
end

-- Dragging Logic
local dragging, dragStart, startPos
TitleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
    end
end)
UserInputService.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)
UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)

-- Minimize Toggle
local minimized = false
MinBtn.MouseButton1Click:Connect(function()
    minimized = not minimized
    ContentFrame.Visible = not minimized
    MainFrame.Size = minimized and UDim2.new(0, 380, 0, 36) or UDim2.new(0, 380, 0, 310)
    MinBtn.Text = minimized and "+" or "─"
end)

-- Neon Glow Animation
task.spawn(function()
    while task.wait(0.03) do
        MainStroke.Transparency = 0.2 + math.abs(math.sin(tick() * 1.5)) * 0.35
    end
end)

--// ================== STATUS UPDATE FUNCTION ==================
local function UpdateStatus(text)
    StatusRow.Text = "⚡ Status: " .. tostring(text)
end

local function ShowError(err)
    StatusRow.Text = "⚠️ ERROR: " .. tostring(err)
    task.delay(5, function()
        UpdateStatus("Running")
    end)
end

--// ================== FPS BOOSTER ==================
task.spawn(function()
    if getgenv().Configs["FPS Booster"] then
        -- Destroy effects
        pcall(function() ReplicatedStorage:FindFirstChild("Effect"):Destroy() end)
        pcall(function()
            for _, conn in pairs(getconnections(Player.PlayerGui.Main.Settings.Buttons.FastModeButton.Activated)) do
                conn.Function()
            end
        end)
        
        -- Lighting
        Lighting.GlobalShadows = false
        Lighting.FogEnd = 9e9
        Lighting.Brightness = 0
        if settings and settings().Rendering then
            settings().Rendering.QualityLevel = "Level01"
            settings().Rendering.GraphicsMode = "NoGraphics"
        end
        
        -- Optimize workspace
        for _, obj in ipairs(Workspace:GetDescendants()) do
            if obj:IsA("BasePart") or obj:IsA("MeshPart") then
                obj.Material = Enum.Material.Plastic
                obj.Reflectance = 0
                obj.CastShadow = false
            elseif obj:IsA("Decal") or obj:IsA("Texture") then
                obj.Texture = ""
                obj.Transparency = 1
            elseif obj:IsA("ParticleEmitter") or obj:IsA("Trail") then
                obj.Enabled = false
            end
        end
        
        -- Remove accessories
        if Player.Character then
            for _, obj in ipairs(Player.Character:GetDescendants()) do
                if obj:IsA("Accessory") or obj:IsA("Shirt") or obj:IsA("Pants") then
                    obj:Destroy()
                end
            end
        end
        
        -- Disable notifications
        pcall(function()
            if Player.PlayerGui:FindFirstChild("Notifications") then
                Player.PlayerGui.Notifications.Enabled = false
            end
        end)
        
        -- Terrain
        pcall(function()
            local terrain = Workspace.Terrain
            terrain.WaterWaveSize = 0
            terrain.WaterWaveSpeed = 0
            terrain.WaterReflectance = 0
            terrain.WaterTransparency = 0
        end)
        
        -- Disable post effects
        for _, effect in ipairs(Lighting:GetChildren()) do
            if effect:IsA("PostEffect") then
                effect.Enabled = false
            end
        end
    end
end)

--// ================== HELPER FUNCTIONS ==================
local function CheckItem(itemName)
    for _, item in pairs(replicated.Remotes.CommF_:InvokeServer("getInventory")) do
        if item.Type == "Material" and item.Name == itemName then
            return item.Count
        end
    end
    return 0
end

local function HasItem(itemName)
    if Player.Backpack:FindFirstChild(itemName) or Player.Character:FindFirstChild(itemName) then
        return true
    end
    for _, item in pairs(replicated.Remotes.CommF_:InvokeServer("getInventory")) do
        if (item.Type == "Sword" or item.Type == "Gun" or item.Type == "Material" or item.Type == "Melee") and item.Name == itemName then
            return true
        end
    end
    return false
end

local function CheckBoss(bossName)
    return Workspace.Enemies:FindFirstChild(bossName) or ReplicatedStorage:FindFirstChild(bossName)
end

local function GetAliveBoss(bossName)
    for _, boss in ipairs(Workspace.Enemies:GetChildren()) do
        if boss.Name == bossName and boss:FindFirstChild("Humanoid") and boss.Humanoid.Health > 0 then
            return boss
        end
    end
    if ReplicatedStorage:FindFirstChild(bossName) then
        local boss = ReplicatedStorage:FindFirstChild(bossName)
        if boss:FindFirstChild("Humanoid") and boss.Humanoid.Health > 0 then
            return boss
        end
    end
    return nil
end

local function GetAliveMonster(monsterName)
    for _, v in ipairs(Workspace.Enemies:GetChildren()) do
        if v.Name == monsterName and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and v:FindFirstChild("HumanoidRootPart") then
            return v
        end
    end
    for _, v in ipairs(Workspace.Enemies:GetChildren()) do
        if string.find(v.Name, monsterName) and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and v:FindFirstChild("HumanoidRootPart") then
            return v
        end
    end
    return nil
end

local function HopLowServer(maxPlayers)
    maxPlayers = maxPlayers or getgenv().Configs.Settings.MaxServerPlayers
    local placeId = game.PlaceId
    local servers = {}
    local cursor = ""
    repeat
        local success, result = pcall(function()
            return HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. placeId .. "/servers/Public?limit=100&cursor=" .. cursor))
        end)
        if success and result and result.data then
            for _, server in ipairs(result.data) do
                if server.playing < maxPlayers and server.id ~= game.JobId then
                    table.insert(servers, server.id)
                end
            end
            cursor = result.nextPageCursor or ""
        else
            break
        end
    until cursor == "" or #servers > 0
    if #servers > 0 then
        TeleportService:TeleportToPlaceInstance(placeId, servers[1], Player)
    end
end

local function EquipTool(toolName)
    for _, tool in ipairs(Player.Backpack:GetChildren()) do
        if tool:IsA("Tool") and tool.Name == toolName then
            Player.Character.Humanoid:EquipTool(tool)
            return true
        end
    end
    return false
end

local function HasQuest(monName)
    local playerGui = Player:FindFirstChild("PlayerGui")
    if playerGui and playerGui:FindFirstChild("Main") and playerGui.Main:FindFirstChild("Quest") then
        if playerGui.Main.Quest.Visible then
            local container = playerGui.Main.Quest:FindFirstChild("Container")
            if container then
                local questTitle = container:FindFirstChild("QuestTitle")
                if questTitle then
                    local title = questTitle:FindFirstChild("Title")
                    if title then
                        if string.find(title.Text, monName) then
                            return true
                        else
                            replicated.Remotes.CommF_:InvokeServer("AbandonQuest")
                            return false
                        end
                    end
                end
            end
            return true
        end
    end
    return false
end

local function GetFruits()
    local fruits = {}
    for _, item in pairs(replicated.Remotes.CommF_:InvokeServer("getInventory")) do
        if item.Type == "Blox Fruit" and item.Value <= 999999 then
            table.insert(fruits, {Name = item.Name, Value = item.Value})
        end
    end
    table.sort(fruits, function(a, b) return a.Value < b.Value end)
    return fruits
end

local function AutoHaki()
    if Player.Character and not Player.Character:FindFirstChild("HasBuso") then
        replicated.Remotes.CommF_:InvokeServer("Buso")
    end
end

local function IsCyborg()
    local ok, result = pcall(function() return Player.Data.Race.Value == "Cyborg" end)
    return ok and result
end

local function HasFistOfDarkness()
    local function check(container)
        for _, item in pairs(container:GetChildren()) do
            if item.Name == "Fist of Darkness" then return true end
        end
        return false
    end
    if check(Player.Backpack) then return true end
    if Player.Character and check(Player.Character) then return true end
    return false
end

local function HasCoreBrain()
    local function check(container)
        for _, item in pairs(container:GetChildren()) do
            if item.Name == "Core Brain" then return true end
        end
        return false
    end
    if check(Player.Backpack) then return true end
    if Player.Character and check(Player.Character) then return true end
    return false
end

local function HasMicrochip()
    for _, item in pairs(Player.Backpack:GetChildren()) do
        if item.Name == "Microchip" then return true end
    end
    if Player.Character then
        for _, item in pairs(Player.Character:GetChildren()) do
            if item.Name == "Microchip" then return true end
        end
    end
    return false
end

local function GetFightingStyleMastery(styleName)
    local tool = Player.Character and Player.Character:FindFirstChild(styleName) or Player.Backpack:FindFirstChild(styleName)
    if tool and tool:FindFirstChild("Level") then
        return tool.Level.Value
    end
    return 0
end

-- Chest Functions
local function GetChest()
    local minDist = math.huge
    local nearest = nil
    local char = Player.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return nil end
    local hrp = char.HumanoidRootPart
    for _, v in ipairs(Workspace.Map:GetDescendants()) do
        if string.find(v.Name:lower(), "chest") and v:FindFirstChild("TouchInterest") then
            local d = (v.Position - hrp.Position).Magnitude
            if d < minDist then
                minDist = d
                nearest = v
            end
        end
    end
    return nearest
end

local function FindClickDetector()
    for _, v in ipairs(Workspace:GetDescendants()) do
        if v.Name == "ClickDetector" and v.Parent and v.Parent.Name == "Main"
            and v.Parent.Parent and v.Parent.Parent.Name == "Button"
            and v.Parent.Parent.Parent and v.Parent.Parent.Parent.Name == "RaidSummon" then
            return v, v.Parent.Position
        end
    end
    return nil, nil
end

local function ClickDetectorSafe()
    local detector, pos = FindClickDetector()
    if detector then
        if pos and Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
            local dist = (pos - Player.Character.HumanoidRootPart.Position).Magnitude
            if dist > 32 then
                Player.Character.HumanoidRootPart.CFrame = CFrame.new(pos) + Vector3.new(0, 2, 0)
                task.wait(0.5)
            end
        end
        pcall(function() fireclickdetector(detector) end)
        task.wait(0.3)
        pcall(function() fireclickdetector(detector) end)
        return true
    end
    return false
end

local function BuyMicrochip()
    if HasMicrochip() then return true end
    replicated.Remotes.CommF_:InvokeServer("BlackbeardReward", "Microchip", "2")
    task.wait(1)
    return HasMicrochip()
end

local function BuyCyborgRace()
    replicated.Remotes.CommF_:InvokeServer("CyborgTrainer", "Buy")
    task.wait(2)
    local ok, result = pcall(function() return Player.Data.Race.Value == "Cyborg" end)
    return ok and result
end

local function EquipCoreBrain()
    for _, item in pairs(Player.Backpack:GetChildren()) do
        if item.Name == "Core Brain" then
            Player.Character.Humanoid:EquipTool(item)
            return true
        end
    end
    return false
end

--// ================== MOVEMENT & NOCLIP SYSTEM ==================
local AutoFarm = true
local TweenSpeed = getgenv().Configs.Settings.TweenSpeed
local CurrentTween = nil
local CurrentTargetCFrame = nil
local Bypassing = false
local StopTween = false

local function BypassTeleport(targetCFrame)
    if Bypassing then return end
    Bypassing = true
    local lockt = 9
    local dietime = 1
    local Running = true

    task.spawn(function()
        local start = tick()
        while Running and tick() - start < lockt do
            pcall(function()
                if Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
                    Player.Character.HumanoidRootPart.CFrame = targetCFrame
                end
            end)
            task.wait()
        end
    end)

    task.spawn(function()
        task.wait(dietime)
        pcall(function()
            if Player.Character then
                Player.Character:BreakJoints()
            end
        end)
    end)

    task.delay(lockt, function()
        Running = false
        Bypassing = false
    end)
end

function TweenTo(targetCFrame)
    if Bypassing or StopTween then return end
    local char = Player.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end
    local hrp = char.HumanoidRootPart
    local dist = (hrp.Position - targetCFrame.Position).Magnitude
    if dist > 1800 then
        if CurrentTween then
            CurrentTween:Cancel()
            CurrentTween = nil
            CurrentTargetCFrame = nil
        end
        BypassTeleport(targetCFrame)
        return
    end
    if dist < 5 then
        if CurrentTween then
            CurrentTween:Cancel()
            CurrentTween = nil
            CurrentTargetCFrame = nil
        end
        hrp.CFrame = targetCFrame
        return
    end
    if CurrentTween and CurrentTargetCFrame then
        local targetDist = (CurrentTargetCFrame.Position - targetCFrame.Position).Magnitude
        if targetDist < 5 then return end
    end
    local tweenInfo = TweenInfo.new(dist / TweenSpeed, Enum.EasingStyle.Linear)
    local tween = TweenService:Create(hrp, tweenInfo, {CFrame = targetCFrame})
    if CurrentTween then CurrentTween:Cancel() end
    CurrentTargetCFrame = targetCFrame
    CurrentTween = tween
    tween:Play()
end

-- NoClip & Anti-Gravity
RunService.Stepped:Connect(function()
    if AutoFarm or getgenv().Configs.AutoCyborg.Enabled then
        pcall(function()
            if Player.Character then
                for _, v in ipairs(Player.Character:GetDescendants()) do
                    if v:IsA("BasePart") and v.CanCollide then
                        v.CanCollide = false
                    end
                end
                local hrp = Player.Character:FindFirstChild("HumanoidRootPart")
                if hrp and not hrp:FindFirstChild("FarmVelocity") then
                    local bv = Instance.new("BodyVelocity")
                    bv.Name = "FarmVelocity"
                    bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                    bv.Velocity = Vector3.zero
                    bv.Parent = hrp
                end
            end
        end)
    end
end)

--// ================== FAST ATTACK SYSTEM (MULTI-METHOD) ==================
local RegisterAttack = Net:WaitForChild("RE/RegisterAttack")
local RegisterHit = Net:WaitForChild("RE/RegisterHit")
local ShootGunEvent = Net:WaitForChild("RE/ShootGunEvent")
local GunValidator = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Validator2")

local AttackConfig = getgenv().Configs.FastAttack

local SUCCESS_FLAGS, COMBAT_REMOTE_THREAD = pcall(function()
    return require(Modules.Flags).COMBAT_REMOTE_THREAD or false
end)
local SUCCESS_HIT, HIT_FUNCTION = pcall(function()
    return (getmenv or getsenv)(Net)._G.SendHitsToServer
end)

-- Method 1: Astral Hub Fast Attack
local FastAttack = {}
FastAttack.__index = FastAttack

function FastAttack.new()
    local self = setmetatable({
        Debounce = 0,
        ComboDebounce = 0,
        ShootDebounce = 0,
        M1Combo = 0,
        EnemyRootPart = nil,
        Connections = {},
        Overheat = {Dragonstorm = {MaxOverheat = 3, Cooldown = 0, TotalOverheat = 0, Distance = 350, Shooting = false}},
        ShootsPerTarget = {["Dual Flintlock"] = 2},
        SpecialShoots = {["Skull Guitar"] = "TAP", ["Bazooka"] = "Position", ["Cannon"] = "Position", ["Dragonstorm"] = "Overheat"}
    }, FastAttack)
    pcall(function()
        self.CombatFlags = require(Modules.Flags).COMBAT_REMOTE_THREAD
        self.ShootFunction = getupvalue(require(ReplicatedStorage.Controllers.CombatController).Attack, 9)
    end)
    return self
end

function FastAttack:IsEntityAlive(entity)
    local humanoid = entity and entity:FindFirstChild("Humanoid")
    return humanoid and humanoid.Health > 0
end

function FastAttack:CheckStun(Character, Humanoid, ToolTip)
    local Stun = Character:FindFirstChild("Stun")
    local Busy = Character:FindFirstChild("Busy")
    if Humanoid.Sit and (ToolTip == "Sword" or ToolTip == "Melee" or ToolTip == "Blox Fruit") then
        return false
    elseif Stun and Stun.Value > 0 or Busy and Busy.Value then
        return false
    end
    return true
end

function FastAttack:GetBladeHits(Character, Distance)
    local Position = Character:GetPivot().Position
    local BladeHits = {}
    Distance = Distance or AttackConfig.AttackDistance
    local function ProcessTargets(Folder)
        for _, Enemy in ipairs(Folder:GetChildren()) do
            pcall(function()
                if Enemy ~= Character and self:IsEntityAlive(Enemy) then
                    local BasePart = Enemy:FindFirstChild(AttackConfig.HitboxLimbs[math.random(#AttackConfig.HitboxLimbs)]) or Enemy:FindFirstChild("HumanoidRootPart")
                    if BasePart and (Position - BasePart.Position).Magnitude <= Distance then
                        if not self.EnemyRootPart then
                            self.EnemyRootPart = BasePart
                        else
                            table.insert(BladeHits, {Enemy, BasePart})
                        end
                    end
                end
            end)
        end
    end
    if AttackConfig.AttackMobs then pcall(ProcessTargets, Workspace.Enemies) end
    if AttackConfig.AttackPlayers then pcall(ProcessTargets, Workspace.Characters) end
    return BladeHits
end

function FastAttack:GetClosestEnemy(Character, Distance)
    local BladeHits = self:GetBladeHits(Character, Distance)
    local Closest, MinDistance = nil, math.huge
    for _, Hit in ipairs(BladeHits) do
        local Magnitude = (Character:GetPivot().Position - Hit[2].Position).Magnitude
        if Magnitude < MinDistance then
            MinDistance = Magnitude
            Closest = Hit[2]
        end
    end
    return Closest
end

function FastAttack:GetCombo()
    local Combo = (tick() - self.ComboDebounce) <= AttackConfig.ComboResetTime and self.M1Combo or 0
    Combo = Combo >= AttackConfig.MaxCombo and 1 or Combo + 1
    self.ComboDebounce = tick()
    self.M1Combo = Combo
    return Combo
end

function FastAttack:ShootInTarget(TargetPosition)
    local Character = Player.Character
    if not self:IsEntityAlive(Character) then return end
    local Equipped = Character:FindFirstChildOfClass("Tool")
    if not Equipped or Equipped.ToolTip ~= "Gun" then return end
    local Cooldown = Equipped:FindFirstChild("Cooldown") and Equipped.Cooldown.Value or 0.3
    if (tick() - self.ShootDebounce) < Cooldown then return end
    local ShootType = self.SpecialShoots[Equipped.Name] or "Normal"
    if ShootType == "Position" or (ShootType == "TAP" and Equipped:FindFirstChild("RemoteEvent")) then
        Equipped:SetAttribute("LocalTotalShots", (Equipped:GetAttribute("LocalTotalShots") or 0) + 1)
        GunValidator:FireServer(self:GetValidator2())
        if ShootType == "TAP" then
            Equipped.RemoteEvent:FireServer("TAP", TargetPosition)
        else
            ShootGunEvent:FireServer(TargetPosition)
        end
        self.ShootDebounce = tick()
    else
        VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 1)
        task.wait(0.05)
        VirtualInputManager:SendMouseButtonEvent(0, 0, 0, false, game, 1)
        self.ShootDebounce = tick()
    end
end

function FastAttack:GetValidator2()
    if not self.ShootFunction then return 0, 0 end
    local success, v1 = pcall(getupvalue, self.ShootFunction, 15)
    if not success then return 0, 0 end
    local v2 = getupvalue(self.ShootFunction, 13)
    local v3 = getupvalue(self.ShootFunction, 16)
    local v4 = getupvalue(self.ShootFunction, 17)
    local v5 = getupvalue(self.ShootFunction, 14)
    local v6 = getupvalue(self.ShootFunction, 12)
    local v7 = getupvalue(self.ShootFunction, 18)
    local v8 = v6 * v2
    local v9 = (v5 * v2 + v6 * v1) % v3
    v9 = (v9 * v3 + v8) % v4
    v5 = math.floor(v9 / v3)
    v6 = v9 - v5 * v3
    v7 = v7 + 1
    setupvalue(self.ShootFunction, 15, v1)
    setupvalue(self.ShootFunction, 13, v2)
    setupvalue(self.ShootFunction, 16, v3)
    setupvalue(self.ShootFunction, 17, v4)
    setupvalue(self.ShootFunction, 14, v5)
    setupvalue(self.ShootFunction, 12, v6)
    setupvalue(self.ShootFunction, 18, v7)
    return math.floor(v9 / v4 * 16777215), v7
end

function FastAttack:UseNormalClick(Character, Humanoid, Cooldown)
    self.EnemyRootPart = nil
    local BladeHits = self:GetBladeHits(Character)
    if self.EnemyRootPart then
        RegisterAttack:FireServer(Cooldown)
        if COMBAT_REMOTE_THREAD and HIT_FUNCTION then
            HIT_FUNCTION(self.EnemyRootPart, BladeHits)
        else
            RegisterHit:FireServer(self.EnemyRootPart, BladeHits)
        end
    end
end

function FastAttack:UseFruitM1(Character, Equipped, Combo)
    local Targets = self:GetBladeHits(Character)
    if not Targets[1] then return end
    local Direction = (Targets[1][2].Position - Character:GetPivot().Position).Unit
    Equipped.LeftClickRemote:FireServer(Direction, Combo)
end

function FastAttack:Attack()
    if not AttackConfig.AutoClickEnabled or (tick() - self.Debounce) < AttackConfig.AttackCooldown then return end
    local Character = Player.Character
    if not Character or not self:IsEntityAlive(Character) then return end
    local Humanoid = Character.Humanoid
    local Equipped = Character:FindFirstChildOfClass("Tool")
    if not Equipped then return end
    local ToolTip = Equipped.ToolTip
    if not table.find({"Melee", "Blox Fruit", "Sword", "Gun"}, ToolTip) then return end
    local Cooldown = Equipped:FindFirstChild("Cooldown") and Equipped.Cooldown.Value or AttackConfig.AttackCooldown
    if not self:CheckStun(Character, Humanoid, ToolTip) then return end
    local Combo = self:GetCombo()
    Cooldown = Cooldown + (Combo >= AttackConfig.MaxCombo and 0.05 or 0)
    self.Debounce = Combo >= AttackConfig.MaxCombo and ToolTip ~= "Gun" and (tick() + 0.05) or tick()
    if ToolTip == "Blox Fruit" and Equipped:FindFirstChild("LeftClickRemote") then
        self:UseFruitM1(Character, Equipped, Combo)
    elseif ToolTip == "Gun" then
        local Target = self:GetClosestEnemy(Character, 120)
        if Target then
            self:ShootInTarget(Target.Position)
        end
    else
        self:UseNormalClick(Character, Humanoid, Cooldown)
    end
end

-- Method 2:Fast Attack (CollectionService based)
local CombatUtil = nil
pcall(function()
    CombatUtil = require(ReplicatedStorage.Modules.CombatUtil)
end)

local function XeroHubFastAttack()
    local char = Player.Character
    if not char then return end
    local tool = char:FindFirstChildOfClass("Tool")
    if not tool then return end
    
    -- Clear stuns
    if char:FindFirstChild("Stun") then char.Stun.Value = 0 end
    if char:FindFirstChild("Busy") then char.Busy.Value = false end
    
    for _, enemy in ipairs(Workspace.Enemies:GetChildren()) do
        if enemy:FindFirstChild("Humanoid") and enemy.Humanoid.Health > 0 and enemy:FindFirstChild("HumanoidRootPart") then
            if (enemy.HumanoidRootPart.Position - char.HumanoidRootPart.Position).Magnitude <= 60 then
                if enemy:FindFirstChild("Stun") then enemy.Stun.Value = 0 end
                if enemy:FindFirstChild("Busy") then enemy.Busy.Value = false end
                
                -- Fire attack
                Net:RemoteEvent("RegisterAttack"):FireServer(math.huge)
                Net:RemoteEvent("RegisterHit", true):FireServer(
                    enemy.Head,
                    {{enemy, enemy.Head}, enemy.Head},
                    nil,
                    tostring(Player.UserId):sub(2, 4) .. tostring(coroutine.running()):sub(11, 15)
                )
                
                if CombatUtil then
                    local weaponName = CombatUtil:GetWeaponName(tool)
                    CombatUtil:ApplyDamageHighlight(enemy, char, weaponName, enemy.Head)
                end
            end
        end
    end
end

-- Initialize Fast Attack Instances
local AttackInstance = FastAttack.new()
AttackInstance.Connections[#AttackInstance.Connections+1] = RunService.Stepped:Connect(function()
    if AttackConfig.Enabled and AutoFarm then
        AttackInstance:Attack()
    end
end)

task.spawn(function()
    while task.wait(AttackConfig.AttackCooldown) do
        if AttackConfig.Enabled and AutoFarm then
            pcall(XeroHubFastAttack)
        end
    end
end)

--// ================== AUTO BUSO (AURA) ==================
task.spawn(function()
    while task.wait(1) do
        pcall(function()
            if getgenv().Configs.Misc.AutoBuso and Player.Character then
                if not Player.Character:FindFirstChild("HasBuso") then
                    replicated.Remotes.CommF_:InvokeServer("Buso")
                end
            end
        end)
    end
end)

--// ================== AUTO BUY SKILLS ==================
task.spawn(function()
    while task.wait(5) do
        pcall(function()
            local data = Player:FindFirstChild("Data")
            if data and data:FindFirstChild("Level") then
                local lvl = data.Level.Value
                if lvl >= 10 then replicated.Remotes.CommF_:InvokeServer("BuyHaki", "Geppo") end
                if lvl >= 60 then
                    replicated.Remotes.CommF_:InvokeServer("BuyHaki", "Soru")
                    replicated.Remotes.CommF_:InvokeServer("BuyHaki", "Buso")
                end
                if lvl >= 300 then replicated.Remotes.CommF_:InvokeServer("KenTalk", "Buy") end
            end
        end)
    end
end)

--// ================== AUTO EQUIP MELEE ==================
task.spawn(function()
    while task.wait(0.5) do
        pcall(function()
            if AutoFarm and Player.Character then
                local humanoid = Player.Character:FindFirstChild("Humanoid")
                if humanoid and humanoid.Health > 0 then
                    local equipped = Player.Character:FindFirstChildOfClass("Tool")
                    if not equipped or equipped.ToolTip ~= "Melee" then
                        for _, tool in ipairs(Player.Backpack:GetChildren()) do
                            if tool:IsA("Tool") and tool.ToolTip == "Melee" then
                                humanoid:EquipTool(tool)
                                break
                            end
                        end
                    end
                end
            end
        end)
    end
end)

--// ================== AUTO STATS DISTRIBUTION ==================
task.spawn(function()
    while task.wait(1) do
        pcall(function()
            local points = Player:FindFirstChild("Data"):FindFirstChild("Points")
            if points and points.Value > 0 then
                local melee = Player.Data.Stats.Melee.Level.Value
                local defense = Player.Data.Stats.Defense.Level.Value
                if melee < 2650 then
                    replicated.Remotes.CommF_:InvokeServer("AddPoint", "Melee", points.Value)
                elseif defense < 2550 then
                    replicated.Remotes.CommF_:InvokeServer("AddPoint", "Defense", points.Value)
                end
            end
        end)
    end
end)

--// ================== QUEST DATA SYSTEM (COMPLETE - ALL WORLDS) ==================
local SelectMonster = ""
local Quest = nil
local CFrameMon = nil
local CFrameQ = nil
local NameQuest = nil
local QuestLv = nil
local NameMon = nil
local Ms = nil
local Next_Level_X = nil
local Name_Boss = nil
local SelectBoss_P = nil

local function GetQuestData()
    local Level = Player.Data.Level.Value
    
    if World1 then
        if Level <= 9 then
            Ms = "Bandit"
            NameQuest = "BanditQuest1"
            QuestLv = 1
            NameMon = "Bandit"
            CFrameQ = CFrame.new(1059.37195, 15.4495068, 1550.4231)
            CFrameMon = CFrame.new(1175.00793, 43.7162018, 1680.39185)
            Next_Level_X = 10
        elseif Level >= 10 and Level <= 14 then
            Ms = "Monkey"
            NameQuest = "JungleQuest"
            QuestLv = 1
            NameMon = "Monkey"
            CFrameQ = CFrame.new(-1598.92285, 36.9012909, 148.748718)
            CFrameMon = CFrame.new(-1660.75586, 40.1013031, 320.152313)
        elseif Level >= 15 and Level <= 29 then
            Ms = "Gorilla"
            NameQuest = "JungleQuest"
            QuestLv = 2
            NameMon = "Gorilla"
            CFrameQ = CFrame.new(-1598.92285, 36.9012909, 148.748718)
            CFrameMon = CFrame.new(-1196.64343, 7.74201918, -445.539734)
            if Level >= 20 then Name_Boss = "The Gorilla King" end
        elseif Level >= 30 and Level <= 39 then
            Ms = "Pirate"
            NameQuest = "BuggyQuest1"
            QuestLv = 1
            NameMon = "Pirate"
            CFrameQ = CFrame.new(-1139.563, 4.75205, 3830.38672)
            CFrameMon = CFrame.new(-1045.943, 64.4195, 3930.302)
        elseif Level >= 40 and Level <= 59 then
            Ms = "Brute"
            NameQuest = "BuggyQuest1"
            QuestLv = 2
            NameMon = "Brute"
            CFrameQ = CFrame.new(-1139.563, 4.75205, 3830.38672)
            CFrameMon = CFrame.new(-1150.276, 130.601, 4164.93457)
            if Level >= 55 then Name_Boss = "Bobby" end
        elseif Level >= 60 and Level <= 74 then
            Ms = "Desert Bandit"
            NameQuest = "DesertQuest"
            QuestLv = 1
            NameMon = "Desert Bandit"
            CFrameQ = CFrame.new(894.488647, 5.14000702, 4392.43359)
            CFrameMon = CFrame.new(935.8798, 6.44867, 4481.58594)
        elseif Level >= 75 and Level <= 89 then
            Ms = "Desert Officer"
            NameQuest = "DesertQuest"
            QuestLv = 2
            NameMon = "Desert Officer"
            CFrameQ = CFrame.new(894.488647, 5.14000702, 4392.43359)
            CFrameMon = CFrame.new(1608.28223, 8.61422, 4371.00732)
        elseif Level >= 90 and Level <= 99 then
            Ms = "Snow Bandit"
            NameQuest = "SnowQuest"
            QuestLv = 1
            NameMon = "Snow Bandit"
            CFrameQ = CFrame.new(1389.74451, 86.6520844, -1298.90796)
            CFrameMon = CFrame.new(1412.92346, 55.3503647, -1260.62036)
            if Level >= 110 then SelectBoss_P = "Yeti" end
        elseif Level >= 100 and Level <= 119 then
            Ms = "Snowman"
            NameQuest = "SnowQuest"
            QuestLv = 2
            NameMon = "Snowman"
            CFrameQ = CFrame.new(1389.74451, 86.6520844, -1298.90796)
            CFrameMon = CFrame.new(1376.86401, 97.278, -1396.93115)
            if Level >= 110 then SelectBoss_P = "Yeti" end
        elseif Level >= 120 and Level <= 174 then
            Ms = "Chief Petty Officer"
            NameQuest = "MarineQuest2"
            QuestLv = 1
            NameMon = "Chief Petty Officer"
            CFrameQ = CFrame.new(-5039.58643, 27.3500385, 4324.68018)
            CFrameMon = CFrame.new(-4710.35986, 112.026154, 4584.92578)
            if Level >= 130 then SelectBoss_P = "Vice Admiral" end
        elseif Level >= 150 and Level <= 174 then
            Ms = "Sky Bandit"
            NameQuest = "SkyQuest"
            QuestLv = 1
            NameMon = "Sky Bandit"
            CFrameQ = CFrame.new(-4838.70117, 717.669311, -2617.86475)
            CFrameMon = CFrame.new(-4965.37891, 357.374145, -2848.70239)
        elseif Level >= 175 and Level <= 189 then
            Ms = "Dark Master"
            NameQuest = "SkyQuest"
            QuestLv = 2
            NameMon = "Dark Master"
            CFrameQ = CFrame.new(-4838.70117, 717.669311, -2617.86475)
            CFrameMon = CFrame.new(-5224.05859, 484.447845, -2275.99854)
        elseif Level >= 190 and Level <= 209 then
            Ms = "Prisoner"
            NameQuest = "PrisonerQuest"
            QuestLv = 1
            NameMon = "Prisoner"
            CFrameQ = CFrame.new(5309.64746, 1.65426, 477.881561)
            CFrameMon = CFrame.new(5276.55762, 87.83664, 561.01007)
            if Level >= 220 then SelectBoss_P = "Warden" end
            if Level >= 232 then SelectBoss_P = "Chief Warden" end
        elseif Level >= 210 and Level <= 249 then
            Ms = "Dangerous Prisoner"
            NameQuest = "PrisonerQuest"
            QuestLv = 2
            NameMon = "Dangerous Prisoner"
            CFrameQ = CFrame.new(5309.64746, 1.65426, 477.881561)
            CFrameMon = CFrame.new(5276.55762, 87.83664, 561.01007)
        elseif Level >= 250 and Level <= 299 then
            Ms = "Toga Warrior"
            NameQuest = "ColosseumQuest"
            QuestLv = 1
            NameMon = "Toga Warrior"
            CFrameQ = CFrame.new(-1576.11743, 7.38933945, -2983.30762)
            CFrameMon = CFrame.new(-1779.97583, 44.6077499, -2736.35474)
        elseif Level >= 275 and Level <= 299 then
            Ms = "Gladiator"
            NameQuest = "ColosseumQuest"
            QuestLv = 2
            NameMon = "Gladiator"
            CFrameQ = CFrame.new(-1576.11743, 7.38933945, -2983.30762)
            CFrameMon = CFrame.new(-1274.75903, 58.1895943, -3188.16309)
        elseif Level >= 300 and Level <= 324 then
            Ms = "Military Soldier"
            NameQuest = "MagmaQuest"
            QuestLv = 1
            NameMon = "Military Soldier"
            CFrameQ = CFrame.new(-5316.55859, 12.2370615, 8517.2998)
            CFrameMon = CFrame.new(-5363.01123, 41.5056877, 8548.47266)
            if Level >= 350 then SelectBoss_P = "Magma Admiral" end
        elseif Level >= 325 and Level <= 374 then
            Ms = "Military Spy"
            NameQuest = "MagmaQuest"
            QuestLv = 2
            NameMon = "Military Spy"
            CFrameQ = CFrame.new(-5316.55859, 12.2370615, 8517.2998)
            CFrameMon = CFrame.new(-5787.99023, 120.864456, 8762.25293)
        elseif Level >= 375 and Level <= 399 then
            Ms = "Fishman Warrior"
            NameQuest = "FishmanQuest"
            QuestLv = 1
            NameMon = "Fishman Warrior"
            CFrameQ = CFrame.new(61122.5625, 18.4716396, 1568.16504)
            CFrameMon = CFrame.new(60946.6094, 48.6735229, 1525.91687)
            if Level >= 425 then SelectBoss_P = "Fishman Lord" end
        elseif Level >= 400 and Level <= 449 then
            Ms = "Fishman Commando"
            NameQuest = "FishmanQuest"
            QuestLv = 2
            NameMon = "Fishman Commando"
            CFrameQ = CFrame.new(61122.5625, 18.4716396, 1568.16504)
            CFrameMon = CFrame.new(61902.7383, 18.4828358, 1478.33936)
        elseif Level >= 450 and Level <= 474 then
            Ms = "God's Guard"
            NameQuest = "SkyExp1Quest"
            QuestLv = 1
            NameMon = "God's Guards"
            CFrameQ = CFrame.new(-4721.71436, 845.277161, -1954.20105)
            CFrameMon = CFrame.new(-4716.95703, 853.089722, -1933.925427)
        elseif Level >= 475 and Level <= 524 then
            Ms = "Shanda"
            NameQuest = "SkyExp1Quest"
            QuestLv = 2
            NameMon = "Shandas"
            CFrameQ = CFrame.new(-7859.09814, 5544.19043, -381.476196)
            CFrameMon = CFrame.new(-7904.57373, 5584.37646, -459.62973)
            if Level >= 500 then SelectBoss_P = "Wysper" end
        elseif Level >= 525 and Level <= 549 then
            Ms = "Royal Squad"
            NameQuest = "SkyExp2Quest"
            QuestLv = 1
            NameMon = "Royal Squad"
            CFrameQ = CFrame.new(-7906.81592, 5634.6626, -1411.99194)
            CFrameMon = CFrame.new(-7555.04199, 5606.90479, -1303.24744)
        elseif Level >= 550 and Level <= 624 then
            Ms = "Royal Soldier"
            NameQuest = "SkyExp2Quest"
            QuestLv = 2
            NameMon = "Royal Soldier"
            CFrameQ = CFrame.new(-7906.81592, 5634.6626, -1411.99194)
            CFrameMon = CFrame.new(-7837.31152, 5649.65186, -1791.08582)
            if Level >= 575 then SelectBoss_P = "Thunder God" end
        elseif Level >= 625 and Level <= 649 then
            Ms = "Galley Pirate"
            NameQuest = "FountainQuest"
            QuestLv = 1
            NameMon = "Galley Pirate"
            CFrameQ = CFrame.new(5259.81982, 37.3500175, 4050.0293)
            CFrameMon = CFrame.new(5569.80518, 38.5269432, 3849.01196)
        elseif Level >= 650 then
            Ms = "Galley Captain"
            NameQuest = "FountainQuest"
            QuestLv = 2
            NameMon = "Galley Captain"
            CFrameQ = CFrame.new(5259.81982, 37.3500175, 4050.0293)
            CFrameMon = CFrame.new(5782.90186, 94.5326462, 4716.78174)
            if Level >= 675 then SelectBoss_P = "Cyborg" end
        end
    elseif World2 then
        if Level >= 700 and Level <= 724 then
            Ms = "Raider"
            NameQuest = "Area1Quest"
            QuestLv = 1
            NameMon = "Raider"
            CFrameQ = CFrame.new(-429.543518, 71.7699966, 1836.18188)
            CFrameMon = CFrame.new(-737.026123, 10.1748352, 2392.57959)
        elseif Level >= 725 and Level <= 774 then
            Ms = "Mercenary"
            NameQuest = "Area1Quest"
            QuestLv = 2
            NameMon = "Mercenary"
            CFrameQ = CFrame.new(-429.543518, 71.7699966, 1836.18188)
            CFrameMon = CFrame.new(-1022.21271, 72.9855194, 1891.39148)
            if Level >= 750 then SelectBoss_P = "Diamond" end
        elseif Level >= 775 and Level <= 799 then
            Ms = "Swan Pirate"
            NameQuest = "Area2Quest"
            QuestLv = 1
            NameMon = "Swan Pirate"
            CFrameQ = CFrame.new(638.43811, 71.769989, 918.282898)
            CFrameMon = CFrame.new(976.467651, 111.174057, 1229.1084)
        elseif Level >= 800 and Level <= 874 then
            Ms = "Factory Staff"
            NameQuest = "Area2Quest"
            QuestLv = 2
            NameMon = "Factory Staff"
            CFrameQ = CFrame.new(638.43811, 71.769989, 918.282898)
            CFrameMon = CFrame.new(336.74585, 73.1620483, -224.129272)
            if Level >= 850 then SelectBoss_P = "Jeremy" end
        elseif Level >= 875 and Level <= 899 then
            Ms = "Marine Lieutenant"
            NameQuest = "MarineQuest3"
            QuestLv = 1
            NameMon = "Marine Lieutenant"
            CFrameQ = CFrame.new(-2440.79639, 71.7140732, -3216.06812)
            CFrameMon = CFrame.new(-2842.69922, 72.9919434, -2901.90479)
        elseif Level >= 900 and Level <= 949 then
            Ms = "Marine Captain"
            NameQuest = "MarineQuest3"
            QuestLv = 2
            NameMon = "Marine Captain"
            CFrameQ = CFrame.new(-2440.79639, 71.7140732, -3216.06812)
            CFrameMon = CFrame.new(-1814.70313, 72.9919434, -3208.86621)
            if Level >= 925 then SelectBoss_P = "Fajita" end
        elseif Level >= 950 and Level <= 974 then
            Ms = "Zombie"
            NameQuest = "ZombieQuest"
            QuestLv = 1
            NameMon = "Zombie"
            CFrameQ = CFrame.new(-5497.06152, 47.5923004, -795.237061)
            CFrameMon = CFrame.new(-5649.23438, 126.0578, -737.773743)
        elseif Level >= 975 and Level <= 999 then
            Ms = "Vampire"
            NameQuest = "ZombieQuest"
            QuestLv = 2
            NameMon = "Vampire"
            CFrameQ = CFrame.new(-5497.06152, 47.5923004, -795.237061)
            CFrameMon = CFrame.new(-6030.32031, .4377408, -1313.5564)
        elseif Level >= 1000 and Level <= 1049 then
            Ms = "Snow Trooper"
            NameQuest = "SnowMountainQuest"
            QuestLv = 1
            NameMon = "Snow Trooper"
            CFrameQ = CFrame.new(609.858826, 400.119904, -5372.25928)
            CFrameMon = CFrame.new(621.003418, 391.361053, -5335.43604)
        elseif Level >= 1050 and Level <= 1099 then
            Ms = "Winter Warrior"
            NameQuest = "SnowMountainQuest"
            QuestLv = 2
            NameMon = "Winter Warrior"
            CFrameQ = CFrame.new(609.858826, 400.119904, -5372.25928)
            CFrameMon = CFrame.new(1295.62683, 429.447784, -5087.04492)
        elseif Level >= 1100 and Level <= 1124 then
            Ms = "Lab Subordinate"
            NameQuest = "IceSideQuest"
            QuestLv = 1
            NameMon = "Lab Subordinate"
            CFrameQ = CFrame.new(-6064.06885, 15.2422857, -4902.97852)
            CFrameMon = CFrame.new(-5769.2041, 37.9288292, -4468.38721)
        elseif Level >= 1125 and Level <= 1174 then
            Ms = "Horned Warrior"
            NameQuest = "IceSideQuest"
            QuestLv = 2
            NameMon = "Horned Warrior"
            CFrameQ = CFrame.new(-6064.06885, 15.2422857, -4902.97852)
            CFrameMon = CFrame.new(-6401.27979, 15.9775667, -5948.24316)
            if Level >= 1150 then SelectBoss_P = "Smoke Admiral" end
        elseif Level >= 1175 and Level <= 1199 then
            Ms = "Magma Ninja"
            NameQuest = "FireSideQuest"
            QuestLv = 1
            NameMon = "Magma Ninja"
            CFrameQ = CFrame.new(-5428.03174, 15.0622921, -5299.43457)
            CFrameMon = CFrame.new(-5466.06445, 57.6952019, -5837.42822)
        elseif Level >= 1200 and Level <= 1249 then
            Ms = "Lava Pirate"
            NameQuest = "FireSideQuest"
            QuestLv = 2
            NameMon = "Lava Pirate"
            CFrameQ = CFrame.new(-5431.09473, 15.9868021, -5296.53223)
            CFrameMon = CFrame.new(-5169.71729, 34.1234779, -4669.73633)
        elseif Level >= 1250 and Level <= 1274 then
            Ms = "Ship Deckhand"
            NameQuest = "ShipQuest1"
            QuestLv = 1
            NameMon = "Ship Deckhand"
            CFrameQ = CFrame.new(1037.80127, 125.092171, 32911.6016)
            CFrameMon = CFrame.new(1163.80872, 138.288452, 33058.4258)
        elseif Level >= 1275 and Level <= 1299 then
            Ms = "Ship Engineer"
            NameQuest = "ShipQuest1"
            QuestLv = 2
            NameMon = "Ship Engineer"
            CFrameQ = CFrame.new(1037.80127, 125.092171, 32911.6016)
            CFrameMon = CFrame.new(921.30249, 125.40039, 32937.34375)
        elseif Level >= 1300 and Level <= 1324 then
            Ms = "Ship Steward"
            NameQuest = "ShipQuest2"
            QuestLv = 1
            NameMon = "Ship Steward"
            CFrameQ = CFrame.new(968.80957, 125.092171, 33244.125)
            CFrameMon = CFrame.new(917.96057, 136.899322, 33343.41406)
        elseif Level >= 1325 and Level <= 1349 then
            Ms = "Ship Officer"
            NameQuest = "ShipQuest2"
            QuestLv = 2
            NameMon = "Ship Officer"
            CFrameQ = CFrame.new(968.80957, 125.092171, 33244.125)
            CFrameMon = CFrame.new(944.44965, 181.400818, 33278.94531)
        elseif Level >= 1350 and Level <= 1374 then
            Ms = "Arctic Warrior"
            NameQuest = "FrostQuest"
            QuestLv = 1
            NameMon = "Arctic Warrior"
            CFrameQ = CFrame.new(5667.6582, 26.7997818, -6486.08984)
            CFrameMon = CFrame.new(5878.23486, 81.3886948, -6136.35596)
        elseif Level >= 1375 and Level <= 1424 then
            Ms = "Snow Lurker"
            NameQuest = "FrostQuest"
            QuestLv = 2
            NameMon = "Snow Lurker"
            CFrameQ = CFrame.new(5667.6582, 26.7997818, -6486.08984)
            CFrameMon = CFrame.new(5513.36865, 60.546711, -6809.94971)
            if Level >= 1400 then SelectBoss_P = "Awakened Ice Admiral" end
        elseif Level >= 1425 and Level <= 1449 then
            Ms = "Sea Soldier"
            NameQuest = "ForgottenQuest"
            QuestLv = 1
            NameMon = "Sea Soldier"
            CFrameQ = CFrame.new(-3055, 240, -10145)
            CFrameMon = CFrame.new(-3433, 26, -9784)
        elseif Level >= 1450 then
            Ms = "Water Fighter"
            NameQuest = "ForgottenQuest"
            QuestLv = 2
            NameMon = "Water Fighter"
            CFrameQ = CFrame.new(-3054.53, 239.96, -10144.42)
            CFrameMon = CFrame.new(-3360.23, 284.21, -10533.07)
            if Level >= 1475 then SelectBoss_P = "Tide Keeper" end
        end
    elseif World3 then
        if Level >= 1500 and Level <= 1524 then
            Ms = "Pirate Millionaire"
            NameQuest = "PiratePortQuest"
            QuestLv = 1
            NameMon = "Pirate Millionaire"
            CFrameQ = CFrame.new(-449.1593, 108.617653, 5948.00146)
            CFrameMon = CFrame.new(-245.996384, 47.3061523, 5584.10059)
        elseif Level >= 1525 and Level <= 1574 then
            Ms = "Pistol Billionaire"
            NameQuest = "PiratePortQuest"
            QuestLv = 2
            NameMon = "Pistol Billionaire"
            CFrameQ = CFrame.new(-449.1593, 108.617653, 5948.00146)
            CFrameMon = CFrame.new(-187.330154, 86.2398758, 6013.51367)
            if Level >= 1550 then SelectBoss_P = "Stone" end
        elseif Level >= 1575 and Level <= 1599 then
            Ms = "Dragon Crew Warrior"
            NameQuest = "AmazonQuest"
            QuestLv = 1
            NameMon = "Dragon Crew Warrior"
            CFrameQ = CFrame.new(5832.83594, 51.6806107, -1101.51563)
            CFrameMon = CFrame.new(6241.99512, 51.5220833, -1243.97717)
        elseif Level >= 1600 and Level <= 1624 then
            Ms = "Dragon Crew Archer"
            NameQuest = "AmazonQuest"
            QuestLv = 2
            NameMon = "Dragon Crew Archer"
            CFrameQ = CFrame.new(5832.83594, 51.6806107, -1101.51563)
            CFrameMon = CFrame.new(6488.91553, 383.383759, -110.66246)
        elseif Level >= 1625 and Level <= 1649 then
            Ms = "Female Islander"
            NameQuest = "AmazonQuest2"
            QuestLv = 1
            NameMon = "Female Islander"
            CFrameQ = CFrame.new(5448.86133, 601.516174, 751.130676)
            CFrameMon = CFrame.new(4770.49902, 758.9552, 1069.86804)
        elseif Level >= 1650 and Level <= 1699 then
            Ms = "Giant Islander"
            NameQuest = "AmazonQuest2"
            QuestLv = 2
            NameMon = "Giant Islander"
            CFrameQ = CFrame.new(5448.86133, 601.516174, 751.130676)
            CFrameMon = CFrame.new(4530.354, 656.756958, -131.609528)
            if Level >= 1675 then SelectBoss_P = "Island Empress" end
        elseif Level >= 1700 and Level <= 1774 then
            Ms = "Marine Commodore"
            NameQuest = "MarineTreeIsland"
            QuestLv = 1
            NameMon = "Marine Commodore"
            CFrameQ = CFrame.new(2484.06738, 74.2821503, -6786.64453)
            CFrameMon = CFrame.new(2286.00781, 73.1339188, -7159.80908)
            if Level >= 1750 then SelectBoss_P = "Kilo Admiral" end
        elseif Level >= 1775 and Level <= 1799 then
            Ms = "Fishman Raider"
            NameQuest = "DeepForestIsland3"
            QuestLv = 1
            NameMon = "Fishman Raider"
            CFrameQ = CFrame.new(-10581.6563, 330.872955, -8761.18652)
            CFrameMon = CFrame.new(-10407.5264, 331.762634, -8368.5166)
        elseif Level >= 1800 and Level <= 1824 then
            Ms = "Fishman Captain"
            NameQuest = "DeepForestIsland3"
            QuestLv = 2
            NameMon = "Fishman Captain"
            CFrameQ = CFrame.new(-10581.6563, 330.872955, -8761.18652)
            CFrameMon = CFrame.new(-10994.7012, 352.381409, -9002.11035)
        elseif Level >= 1825 and Level <= 1849 then
            Ms = "Forest Pirate"
            NameQuest = "DeepForestIsland"
            QuestLv = 1
            NameMon = "Forest Pirate"
            CFrameQ = CFrame.new(-13234.04, 331.488495, -7625.40137)
            CFrameMon = CFrame.new(-13274.4785, 332.378143, -7769.58057)
        elseif Level >= 1850 and Level <= 1899 then
            Ms = "Mythological Pirate"
            NameQuest = "DeepForestIsland"
            QuestLv = 2
            NameMon = "Mythological Pirate"
            CFrameQ = CFrame.new(-13234.04, 331.488495, -7625.40137)
            CFrameMon = CFrame.new(-13680.6074, 501.081543, -6991.18945)
            if Level >= 1875 then SelectBoss_P = "Captain Elephant" end
        elseif Level >= 1900 and Level <= 1924 then
            Ms = "Jungle Pirate"
            NameQuest = "DeepForestIsland2"
            QuestLv = 1
            NameMon = "Jungle Pirate"
            CFrameQ = CFrame.new(-12680.3818, 389.971039, -9902.01953)
            CFrameMon = CFrame.new(-12256.1602, 331.738281, -10485.8369)
        elseif Level >= 1925 and Level <= 1974 then
            Ms = "Musketeer Pirate"
            NameQuest = "DeepForestIsland2"
            QuestLv = 2
            NameMon = "Musketeer Pirate"
            CFrameQ = CFrame.new(-12680.3818, 389.971039, -9902.01953)
            CFrameMon = CFrame.new(-13457.9043, 391.545654, -9859.17773)
            if Level >= 1950 then SelectBoss_P = "Beautiful Pirate" end
        elseif Level >= 1975 and Level <= 1999 then
            Ms = "Reborn Skeleton"
            NameQuest = "HauntedQuest1"
            QuestLv = 1
            NameMon = "Reborn Skeleton"
            CFrameQ = CFrame.new(-9480.82715, 142.130661, 5566.07129)
            CFrameMon = CFrame.new(-8817.88086, 191.167618, 6298.65576)
        elseif Level >= 2000 and Level <= 2024 then
            Ms = "Living Zombie"
            NameQuest = "HauntedQuest1"
            QuestLv = 2
            NameMon = "Living Zombie"
            CFrameQ = CFrame.new(-9480.82715, 142.130661, 5566.07129)
            CFrameMon = CFrame.new(-10125.2344, 183.947052, 6242.01367)
        elseif Level >= 2025 and Level <= 2049 then
            Ms = "Demonic Soul"
            NameQuest = "HauntedQuest2"
            QuestLv = 1
            NameMon = "Demonic"
            CFrameQ = CFrame.new(-9516.99316, 178.006516, 6078.46533)
            CFrameMon = CFrame.new(-9712.03125, 204.695892, 6193.32227)
        elseif Level >= 2050 and Level <= 2074 then
            Ms = "Posessed Mummy"
            NameQuest = "HauntedQuest2"
            QuestLv = 2
            NameMon = "Posessed Mummy"
            CFrameQ = CFrame.new(-9516.99316, 178.006516, 6078.46533)
            CFrameMon = CFrame.new(-9545.77637, 69.6198959, 6339.56152)
        elseif Level >= 2075 and Level <= 2099 then
            Ms = "Peanut Scout"
            NameQuest = "NutsIslandQuest"
            QuestLv = 1
            NameMon = "Peanut Scout"
            CFrameQ = CFrame.new(-2104.17163, 38.1299706, -10194.418)
            CFrameMon = CFrame.new(-2098.07544, 192.611862, -10248.8867)
        elseif Level >= 2100 and Level <= 2124 then
            Ms = "Peanut President"
            NameQuest = "NutsIslandQuest"
            QuestLv = 2
            NameMon = "Peanut President"
            CFrameQ = CFrame.new(-2104.17163, 38.1299706, -10194.418)
            CFrameMon = CFrame.new(-1876.95959, 192.610947, -10542.2939)
        elseif Level >= 2125 and Level <= 2149 then
            Ms = "Ice Cream Chef"
            NameQuest = "IceCreamIslandQuest"
            QuestLv = 1
            NameMon = "Ice Cream Chef"
            CFrameQ = CFrame.new(-820.404358, 65.8453293, -10965.5654)
            CFrameMon = CFrame.new(-821.614075, 208.39537, -10990.7617)
        elseif Level >= 2150 and Level <= 2199 then
            Ms = "Ice Cream Commander"
            NameQuest = "IceCreamIslandQuest"
            QuestLv = 2
            NameMon = "Ice Cream Commander"
            CFrameQ = CFrame.new(-819.376526, 67.4634171, -10967.2832)
            CFrameMon = CFrame.new(-610.116699, 208.269043, -11253.6865)
            if Level >= 2175 then SelectBoss_P = "Cake Queen" end
        elseif Level >= 2200 and Level <= 2224 then
            Ms = "Cookie Crafter"
            NameQuest = "CakeQuest1"
            QuestLv = 1
            NameMon = "Cookie Crafter"
            CFrameQ = CFrame.new(-2020.60681, 37.8240089, -12027.8086)
            CFrameMon = CFrame.new(-2286.68433, 146.565628, -12226.8818)
        elseif Level >= 2225 and Level <= 2249 then
            Ms = "Cake Guard"
            NameQuest = "CakeQuest1"
            QuestLv = 2
            NameMon = "Cake Guard"
            CFrameQ = CFrame.new(-2020.60681, 37.8240089, -12027.8086)
            CFrameMon = CFrame.new(-1817.97473, 209.563278, -12288.9229)
        elseif Level >= 2250 and Level <= 2299 then
            Ms = "Baking Staff"
            NameQuest = "CakeQuest2"
            QuestLv = 1
            NameMon = "Baking Staff"
            CFrameQ = CFrame.new(-1928.31763, 37.7296638, -12840.626)
            CFrameMon = CFrame.new(-1818.3479, 93.4127579, -12887.6602)
        elseif Level >= 2300 and Level <= 2324 then
            Ms = "Cocoa Warrior"
            NameQuest = "ChocQuest1"
            QuestLv = 1
            NameMon = "Cocoa Warrior"
            CFrameQ = CFrame.new(230.191864, 24.7342587, -12202.6572)
            CFrameMon = CFrame.new(24.6174755, 24.7343426, -12227.2676)
        elseif Level >= 2325 and Level <= 2349 then
            Ms = "Chocolate Bar Battler"
            NameQuest = "ChocQuest1"
            QuestLv = 2
            NameMon = "Chocolate Bar Battler"
            CFrameQ = CFrame.new(230.191864, 24.7342587, -12202.6572)
            CFrameMon = CFrame.new(658.223022, 24.7342587, -12541.9912)
        elseif Level >= 2350 and Level <= 2374 then
            Ms = "Sweet Thief"
            NameQuest = "ChocQuest2"
            QuestLv = 1
            NameMon = "Sweet Thief"
            CFrameQ = CFrame.new(149.143921, 24.793829, -12775.4102)
            CFrameMon = CFrame.new(51.6118431, 24.7938099, -12574.873)
        elseif Level >= 2375 and Level <= 2399 then
            Ms = "Candy Rebel"
            NameQuest = "ChocQuest2"
            QuestLv = 2
            NameMon = "Candy Rebel"
            CFrameQ = CFrame.new(149.143921, 24.793829, -12775.4102)
            CFrameMon = CFrame.new(28.3456059, 24.7938023, -12949.5029)
        elseif Level >= 2400 and Level <= 2424 then
            Ms = "Candy Pirate"
            NameQuest = "CandyQuest1"
            QuestLv = 1
            NameMon = "Candy Pirate"
            CFrameQ = CFrame.new(-1167, 60, -14491)
            CFrameMon = CFrame.new(-1310.50037, 26.0165234, -14562.4043)
        elseif Level >= 2425 and Level <= 2449 then
            Ms = "Snow Demon"
            NameQuest = "CandyQuest1"
            QuestLv = 2
            NameMon = "Snow Demon"
            CFrameQ = CFrame.new(-1167, 60, -14491)
            CFrameMon = CFrame.new(-880.200623, 71.2477646, -14538.6094)
        elseif Level >= 2450 and Level <= 2474 then
            Ms = "Isle Outlaw"
            NameQuest = "TikiQuest1"
            QuestLv = 1
            NameMon = "Isle Outlaw"
            CFrameQ = CFrame.new(-16547.748, 61.135334, -173.413605)
            CFrameMon = CFrame.new(-16442.8145, 116.139, -264.463776)
        elseif Level >= 2475 and Level <= 2499 then
            Ms = "Island Boy"
            NameQuest = "TikiQuest1"
            QuestLv = 2
            NameMon = "Island Boy"
            CFrameQ = CFrame.new(-16547.748, 61.135334, -173.413605)
            CFrameMon = CFrame.new(-16901.2617, 84.0675659, -192.889069)
        elseif Level >= 2500 and Level <= 2524 then
            Ms = "Sun-kissed Warrior"
            NameQuest = "TikiQuest2"
            QuestLv = 1
            NameMon = "Sun"
            CFrameQ = CFrame.new(-16539.0781, 55.6863289, 1051.57385)
            CFrameMon = CFrame.new(-16051.9697, 54.7971497, 1084.67578)
        elseif Level >= 2525 and Level <= 2549 then
            Ms = "Isle Champion"
            NameQuest = "TikiQuest2"
            QuestLv = 2
            NameMon = "Isle Champion"
            CFrameQ = CFrame.new(-16539.0781, 55.6863289, 1051.57385)
            CFrameMon = CFrame.new(-16619.3711, 129.984818, 1071.2356)
        elseif Level >= 2550 and Level <= 2650 then
            Ms = "Skull Slayer"
            NameQuest = "TikiQuest3"
            QuestLv = 2
            NameMon = "Skull Slayer"
            CFrameQ = CFrame.new(-16666.5703, 105.291382, 1576.6925)
            CFrameMon = CFrame.new(-16778.7852, 232.283752, 1442.08325)
        end
    end
    
    return {
        Mon = Ms,
        Qname = NameQuest,
        Qdata = QuestLv,
        NameMon = NameMon,
        PosQ = CFrameQ,
        PosM = CFrameMon,
        Boss = Name_Boss,
        SelectBoss = SelectBoss_P
    }
end

--// ================== BRING MOB SYSTEM ==================
task.spawn(function()
    while task.wait(0.2) do
        pcall(function()
            if not AutoFarm or not getgenv().Configs.Misc.BringMobs then return end
            local char = Player.Character
            if not char then return end
            local root = char:FindFirstChild("HumanoidRootPart")
            if not root then return end
            local questData = GetQuestData()
            if not questData or not questData.NameMon then return end
            local targetMon = GetAliveMonster(questData.NameMon)
            if targetMon and targetMon:FindFirstChild("HumanoidRootPart") then
                local targetPos = targetMon.HumanoidRootPart.Position
                if (root.Position - targetPos).Magnitude < 60 then
                    for _, v in ipairs(Workspace.Enemies:GetChildren()) do
                        if (v.Name == questData.NameMon or string.find(v.Name, questData.NameMon)) and v ~= targetMon then
                            local hrp = v:FindFirstChild("HumanoidRootPart")
                            local hum = v:FindFirstChild("Humanoid")
                            if hrp and hum and hum.Health > 0 then
                                local dist = (hrp.Position - targetPos).Magnitude
                                if dist < 300 then
                                    hrp.CFrame = targetMon.HumanoidRootPart.CFrame
                                    hrp.Velocity = Vector3.zero
                                    hrp.CanCollide = false
                                    if v:FindFirstChild("Head") then v.Head.CanCollide = false end
                                    if v:FindFirstChild("UpperTorso") then v.UpperTorso.CanCollide = false end
                                    if v:FindFirstChild("LowerTorso") then v.LowerTorso.CanCollide = false end
                                end
                            end
                        end
                    end
                end
            end
        end)
    end
end)

--// ================== MAIN AUTO FARM LOGIC (LEVELING) ==================
task.spawn(function()
    while task.wait() do
        local success, err = pcall(function()
            if not AutoFarm then return end
            local char = Player.Character
            if not char or not char:FindFirstChild("HumanoidRootPart") or not char:FindFirstChild("Humanoid") or char.Humanoid.Health <= 0 then
                return
            end
            local data = Player:FindFirstChild("Data")
            if not data then return end
            local levelObj = data:FindFirstChild("Level")
            if not levelObj then return end
            
            local lvl = levelObj.Value
            LevelLabel.Text = "📊 Level: " .. tostring(lvl)

            -- Travel to Sea 2
            if World1 and lvl >= 700 then
                UpdateStatus("Traveling to Sea 2...")
                local iceMap = Workspace.Map:FindFirstChild("Ice")
                local iceDoor = iceMap and iceMap:FindFirstChild("Door")
                if iceDoor then
                    if iceDoor.CanCollide == true and iceDoor.Transparency == 0 then
                        replicated.Remotes.CommF_:InvokeServer("DressrosaQuestProgress", "Detective")
                        local key = Player.Backpack:FindFirstChild("Key") or char:FindFirstChild("Key")
                        if key and key.Parent == Player.Backpack then char.Humanoid:EquipTool(key) end
                        TweenTo(CFrame.new(1347.7124, 37.375, -1325.649))
                    elseif iceDoor.CanCollide == false and iceDoor.Transparency == 1 then
                        local iceAdmiral = Workspace.Enemies:FindFirstChild("Ice Admiral")
                        if iceAdmiral and iceAdmiral:FindFirstChild("Humanoid") and iceAdmiral.Humanoid.Health > 0 then
                            TweenTo(CFrame.new(iceAdmiral.HumanoidRootPart.Position + Vector3.new(0, 14, 0)))
                        else
                            TweenTo(CFrame.new(1347.7124, 37.375, -1325.649))
                            if (char.HumanoidRootPart.Position - Vector3.new(1347.7124, 37.375, -1325.649)).Magnitude < 15 then
                                replicated.Remotes.CommF_:InvokeServer("TravelDressrosa")
                            end
                        end
                    else
                        replicated.Remotes.CommF_:InvokeServer("TravelDressrosa")
                    end
                else
                    replicated.Remotes.CommF_:InvokeServer("TravelDressrosa")
                end
                return
            end

            -- Travel to Sea 3
            if World2 and lvl >= 1500 then
                UpdateStatus("Traveling to Sea 3...")
                if replicated.Remotes.CommF_:InvokeServer("ZQuestProgress", "Check") == 1 then
                    replicated.Remotes.CommF_:InvokeServer("TravelZou")
                else
                    -- Complete Zou quest first
                    if not Workspace.Enemies:FindFirstChild("rip_indra") then
                        replicated.Remotes.CommF_:InvokeServer("ZQuestProgress", "Begin")
                    end
                end
                task.wait(1)
                return
            end

            local questData = GetQuestData()
            if not questData or not questData.PosM then
                TargetLabel.Text = "🎯 Target: None"
                UpdateStatus("Max Level / Unknown")
                return
            end

            TargetLabel.Text = "🎯 Target: " .. tostring(questData.NameMon)
            UpdateStatus("Leveling: " .. questData.NameMon)

            if questData.Qname and not HasQuest(questData.NameMon) then
                TweenTo(questData.PosQ)
                if (char.HumanoidRootPart.Position - questData.PosQ.Position).Magnitude < 15 then
                    replicated.Remotes.CommF_:InvokeServer("StartQuest", questData.Qname, questData.Qdata)
                    task.wait(0.5)
                end
            else
                local targetMon = GetAliveMonster(questData.NameMon)
                if targetMon then
                    local farmPos = targetMon.HumanoidRootPart.Position + Vector3.new(0, 14, 0)
                    TweenTo(CFrame.new(farmPos, farmPos + targetMon.HumanoidRootPart.CFrame.LookVector))
                else
                    TweenTo(questData.PosM)
                end
            end
        end)
        if not success then ShowError(err) end
    end
end)

--// ================== ANTI-AFK ==================
task.spawn(function()
    while task.wait(150) do
        VirtualInputManager:SendKeyEvent(true, "Space", false, game)
        task.wait(0.5)
        VirtualInputManager:SendKeyEvent(false, "Space", false, game)
    end
end)

--// ================== BODY VELOCITY LOCK ==================
task.spawn(function()
    while task.wait() do
        pcall(function()
            local hrp = Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")
            if hrp and not hrp:FindFirstChild("Lock") then
                if Player.Character.Humanoid.Sit then Player.Character.Humanoid.Sit = false end
                local bv = Instance.new("BodyVelocity")
                bv.Name = "Lock"
                bv.MaxForce = Vector3.new(1e9, 1e9, 1e9)
                bv.Velocity = Vector3.zero
                bv.Parent = hrp
            end
        end)
    end
end)

--// ================== HIGHLIGHT CHARACTER ==================
task.spawn(function()
    while task.wait(1) do
        pcall(function()
            if Player.Character and not Player.Character:FindFirstChild("Highlight") then
                local highlight = Instance.new("Highlight")
                highlight.Name = "Highlight"
                highlight.FillColor = Color3.fromRGB(0, 0, 0)
                highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                highlight.FillTransparency = 0.5
                highlight.OutlineTransparency = 0.2
                highlight.Adornee = Player.Character
                highlight.Parent = Player.Character
            end
        end)
    end
end)

--// ================== SERVER HOP IF STUCK ==================
task.spawn(function()
    local lastPos = nil
    local stuckTime = 0
    while task.wait(1) do
        pcall(function()
            local hrp = Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                local pos = hrp.Position
                if lastPos and (pos - lastPos).Magnitude < 1 then
                    stuckTime = stuckTime + 1
                    if stuckTime >= getgenv().Configs.Settings.HopThreshold then
                        HopLowServer()
                        stuckTime = 0
                    end
                else
                    stuckTime = 0
                    lastPos = pos
                end
            end
        end)
    end
end)

--// ================== UI UPDATE LOOP ==================
task.spawn(function()
    while task.wait(0.5) do
        pcall(function()
            -- Level
            if Player.Data.Level then
                LevelLabel.Text = "📊 Level: " .. Player.Data.Level.Value
            end
            
            -- Beli
            local beli = Player.Data.Beli.Value
            if beli >= 1e9 then
                BeliLabel.Text = "💰 Beli: " .. string.format("%.2fB", beli/1e9)
            elseif beli >= 1e6 then
                BeliLabel.Text = "💰 Beli: " .. string.format("%.2fM", beli/1e6)
            elseif beli >= 1e3 then
                BeliLabel.Text = "💰 Beli: " .. string.format("%.1fK", beli/1e3)
            else
                BeliLabel.Text = "💰 Beli: " .. beli
            end
            
            -- Fragments
            FragLabel.Text = "💎 Fragments: " .. (Player.Data.Fragments.Value or 0)
            
            -- Devil Fruit
            local df = Player.Data.DevilFruit.Value
            DFLabel.Text = "🍎 DF: " .. (df == "" and "None" or df)
            
            -- Time
            TimeLabel.Text = "⏰ Time: " .. FormatTime(math.floor(Workspace.DistributedGameTime + 0.5))
            
            -- Items
            local hasFist = HasFistOfDarkness()
            local hasCore = HasCoreBrain()
            local hasChip = HasMicrochip()
            local isCyb = IsCyborg()
            
            FistRow.Text = "🗡️ Fist: " .. (hasFist and "✓" or "✗")
            FistRow.TextColor3 = hasFist and Color3.fromRGB(100,220,100) or Color3.fromRGB(255,100,100)
            
            CoreRow.Text = "🧠 Core: " .. (hasCore and "✓" or "✗")
            CoreRow.TextColor3 = hasCore and Color3.fromRGB(100,220,100) or Color3.fromRGB(255,100,100)
            
            ChipRow.Text = "💊 Chip: " .. (hasChip and "✓" or "✗")
            ChipRow.TextColor3 = hasChip and Color3.fromRGB(100,220,100) or Color3.fromRGB(255,100,100)
            
            CyborgRow.Text = "🤖 Cyborg: " .. (isCyb and "✓" or "✗")
            CyborgRow.TextColor3 = isCyb and Color3.fromRGB(100,220,100) or Color3.fromRGB(255,100,100)
        end)
    end
end)

--// ================== REDEEM CODES ==================
local AllCodes = {
    "Sub2Fer999","Enyu_is_Pro","JCWK","StarcodeHEO","MagicBUS",
    "KittGaming","Sub2CaptainMaui","Sub2OfficialNoobie","TheGreatAce",
    "Sub2NoobMaster123","Sub2Daigrock","Axiore","StrawHatMaine",
    "TantaiGaming","Bluxxy",
    "SUB2GAMERROBOT_EXP1","GAMER_ROBOT_1M","SUBGAMERROBOT_RESET",
    "RESET_5B","SUB2GAMERROBOT_RESET1",
    "Sub2UncleKizaru","ADMIN_TROLL","DRAGONABUSE","DEVSCOOKING",
    "NOOB2PRO","FUDD10","BIGNEWS","THEYWILL","FREEDRAGON"
}

task.spawn(function()
    for _, code in ipairs(AllCodes) do
        pcall(function()
            replicated.Remotes.Redeem:InvokeServer(code)
        end)
        task.wait(0.5)
    end
end)

--// ================== FINAL INITIALIZATION ==================
UpdateStatus("Part 1 Loaded - Ready!")
--[[
   ╔══════════════════════════════════════════════════════════════╗
   ║     ASTRAL HUB - ULTIMATE MEGA MERGE (PART 2 OF 5)          ║
   ║     Advanced Systems: Fighting Styles, Special Quests,       ║
   ║     Boss Farming, Raids, Mastery, Auto Cyborg, Sea Events,  ║
   ║     Mirage, V4, Dragon Dojo, Prehistoric, ESP, Fishing, Misc║
   ╚══════════════════════════════════════════════════════════════╝
--]]

--// ================== FIGHTING STYLES AUTO BUY & MASTERY ==================
local FightingStyles = {
    BlackLeg = {bought = false, mastery = false},
    Electro = {bought = false, mastery = false},
    FishmanKarate = {bought = false, mastery = false},
    DragonClaw = {bought = false, mastery = false},
    Superhuman = {bought = false, mastery = false},
    DeathStep = {bought = false, mastery = false},
    SharkmanKarate = {bought = false, mastery = false},
    ElectricClaw = {bought = false, mastery = false},
    DragonTalon = {bought = false, mastery = false},
    Godhuman = {bought = false, mastery = false},
    SanguineArt = {bought = false, mastery = false}
}

local function GetFightingStyleMastery(styleName)
    local tool = Player.Character and Player.Character:FindFirstChild(styleName) or Player.Backpack:FindFirstChild(styleName)
    if tool and tool:FindFirstChild("Level") then
        return tool.Level.Value
    end
    return 0
end

task.spawn(function()
    while task.wait(1) do
        pcall(function()
            local lvl = Player.Data.Level.Value
            local beli = Player.Data.Beli.Value
            local frags = Player.Data.Fragments.Value

            -- Black Leg
            if getgenv().Configs.Melee["Black Leg"] and not FightingStyles.BlackLeg.bought and lvl >= 100 and beli >= 150000 then
                replicated.Remotes.CommF_:InvokeServer("BuyBlackLeg")
                if HasItem("Black Leg") then FightingStyles.BlackLeg.bought = true; EquipTool("Black Leg") end
            end
            -- Electro
            if FightingStyles.BlackLeg.bought and not FightingStyles.Electro.bought then
                if GetFightingStyleMastery("Black Leg") >= 300 then
                    replicated.Remotes.CommF_:InvokeServer("BuyElectro")
                    if HasItem("Electro") then FightingStyles.Electro.bought = true; EquipTool("Electro") end
                end
            end
            -- Fishman Karate
            if FightingStyles.Electro.bought and not FightingStyles.FishmanKarate.bought then
                if GetFightingStyleMastery("Electro") >= 300 then
                    replicated.Remotes.CommF_:InvokeServer("BuyFishmanKarate")
                    if HasItem("Fishman Karate") then FightingStyles.FishmanKarate.bought = true; EquipTool("Fishman Karate") end
                end
            end
            -- Dragon Claw
            if getgenv().Configs.Melee["Dragon Claw"] and not FightingStyles.DragonClaw.bought and lvl >= 1100 then
                if frags >= 1500 then
                    replicated.Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "2")
                    if HasItem("Dragon Claw") then FightingStyles.DragonClaw.bought = true; EquipTool("Dragon Claw") end
                end
            end
            -- Superhuman
            if FightingStyles.DragonClaw.bought and not FightingStyles.Superhuman.bought then
                if GetFightingStyleMastery("Dragon Claw") >= 300 and beli >= 3000000 then
                    replicated.Remotes.CommF_:InvokeServer("BuySuperhuman")
                    if HasItem("Superhuman") then FightingStyles.Superhuman.bought = true; EquipTool("Superhuman") end
                end
            end
            -- Death Step
            if getgenv().Configs.Melee["Death Step"] and not FightingStyles.DeathStep.bought and lvl >= 1100 then
                if GetFightingStyleMastery("Black Leg") >= 400 and frags >= 5000 and beli >= 2500000 then
                    replicated.Remotes.CommF_:InvokeServer("BuyDeathStep")
                    if HasItem("Death Step") then FightingStyles.DeathStep.bought = true; EquipTool("Death Step") end
                end
            end
            -- Sharkman Karate
            if getgenv().Configs.Melee["Sharkman Karate"] and not FightingStyles.SharkmanKarate.bought and lvl >= 1100 then
                if frags >= 5000 and beli >= 2550000 then
                    replicated.Remotes.CommF_:InvokeServer("BuySharkmanKarate")
                    if HasItem("Sharkman Karate") then FightingStyles.SharkmanKarate.bought = true; EquipTool("Sharkman Karate") end
                end
            end
            -- Electric Claw
            if getgenv().Configs.Melee["Electric Claw"] and not FightingStyles.ElectricClaw.bought and lvl >= 1100 then
                if frags >= 5000 and beli >= 3000000 then
                    replicated.Remotes.CommF_:InvokeServer("BuyElectricClaw")
                    if HasItem("Electric Claw") then FightingStyles.ElectricClaw.bought = true; EquipTool("Electric Claw") end
                end
            end
            -- Dragon Talon
            if getgenv().Configs.Melee["Dragon Talon"] and not FightingStyles.DragonTalon.bought and lvl >= 1100 then
                if frags >= 5000 and beli >= 3000000 then
                    if CheckItem("Fire Essence") > 0 then
                        EquipTool("Fire Essence")
                        task.wait(0.5)
                        replicated.Remotes.CommF_:InvokeServer("BuyDragonTalon", true)
                        replicated.Remotes.CommF_:InvokeServer("BuyDragonTalon")
                        if HasItem("Dragon Talon") then FightingStyles.DragonTalon.bought = true; EquipTool("Dragon Talon") end
                    end
                end
            end
            -- Godhuman
            if getgenv().Configs.Melee["Godhuman"] and not FightingStyles.Godhuman.bought and lvl >= 1100 then
                if frags >= 5000 and beli >= 5000000 then
                    if CheckItem("Fish Tail") >= 20 and CheckItem("Magma Ore") >= 20 and CheckItem("Mystic Droplet") >= 10 and CheckItem("Dragon Scale") >= 10 then
                        replicated.Remotes.CommF_:InvokeServer("BuyGodhuman", true)
                        if HasItem("Godhuman") then FightingStyles.Godhuman.bought = true; EquipTool("Godhuman") end
                    end
                end
            end
            -- Sanguine Art
            if getgenv().Configs.Melee["Sanguine Art"] and not FightingStyles.SanguineArt.bought and lvl >= 1100 then
                if GetM("Leviathan Heart") >= 1 then
                    replicated.Remotes.CommF_:InvokeServer("BuySanguineArt")
                    if HasItem("Sanguine Art") then FightingStyles.SanguineArt.bought = true end
                end
            end

            -- Mastery farming (keep buying until mastery 400)
            for _, style in pairs({
                {name="Black Leg", flag="BlackLeg"},
                {name="Electro", flag="Electro"},
                {name="Fishman Karate", flag="FishmanKarate"},
                {name="Dragon Claw", flag="DragonClaw"},
                {name="Superhuman", flag="Superhuman"},
                {name="Death Step", flag="DeathStep"},
                {name="Sharkman Karate", flag="SharkmanKarate"},
                {name="Electric Claw", flag="ElectricClaw"},
                {name="Dragon Talon", flag="DragonTalon"},
                {name="Godhuman", flag="Godhuman"},
            }) do
                if FightingStyles[style.flag].bought and not FightingStyles[style.flag].mastery then
                    if GetFightingStyleMastery(style.name) >= 400 then
                        FightingStyles[style.flag].mastery = true
                    else
                        -- repeatedly buy to keep gaining mastery? or just rely on combat?
                    end
                end
            end
        end)
    end
end)

--// ================== PRIORITY QUEST DETECTION & HANDLERS ==================
local CurrentQuest = nil
local QuestState = {}

-- Special Quest Execution
task.spawn(function()
    while task.wait() do
        if not AutoFarm then continue end
        pcall(function()
            CurrentQuest = DeterminePriorityQuest()
            if CurrentQuest then
                UpdateStatus("Special Quest: " .. CurrentQuest)
                if CurrentQuest == "Saber" then
                    local prog = replicated.Remotes.CommF_:InvokeServer("ProQuestProgress")
                    if not prog.UsedTorch then
                        TweenTo(CFrame.new(-1612, 11, 161))
                        task.wait(1)
                        replicated.Remotes.CommF_:InvokeServer("ProQuestProgress", "GetTorch")
                        EquipTool("Torch")
                        replicated.Remotes.CommF_:InvokeServer("ProQuestProgress", "DestroyTorch")
                    elseif not prog.UsedCup then
                        replicated.Remotes.CommF_:InvokeServer("ProQuestProgress", "GetCup")
                        EquipTool("Cup")
                        replicated.Remotes.CommF_:InvokeServer("ProQuestProgress", "FillCup", Player.Character.Cup)
                        replicated.Remotes.CommF_:InvokeServer("ProQuestProgress", "SickMan")
                    elseif not prog.KilledMob then
                        local mob = GetAliveBoss("Mob Leader")
                        if mob then TweenTo(mob.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0)) else TweenTo(CFrame.new(-2848, 7, 5342)) end
                    elseif not prog.UsedRelic then
                        replicated.Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon")
                        EquipTool("Relic")
                        TweenTo(CFrame.new(-1406, 29, 4))
                    else
                        local boss = GetAliveBoss("Saber Expert")
                        if boss then TweenTo(boss.HumanoidRootPart.CFrame * CFrame.new(0, 25, 0)) else TweenTo(CFrame.new(-1458, 29, -50)) end
                    end
                elseif CurrentQuest == "Pole" then
                    local boss = GetAliveBoss("Thunder God")
                    if boss then TweenTo(boss.HumanoidRootPart.CFrame * CFrame.new(0, 40, 0)) else TweenTo(CFrame.new(-7894, 5547, -380)) end
                elseif CurrentQuest == "Rengoku" then
                    local boss = GetAliveBoss("Awakened Ice Admiral")
                    if boss then TweenTo(boss.HumanoidRootPart.CFrame * CFrame.new(0, 40, 0)) end
                elseif CurrentQuest == "Yama" then
                    local sealed = Workspace.Map.Waterfall.SealedKatana.Hitbox
                    if (sealed.Position - Player.Character.HumanoidRootPart.Position).Magnitude > 300 then
                        TweenTo(sealed.CFrame)
                    else
                        local ghost = GetAliveBoss("Ghost")
                        if ghost then TweenTo(ghost.HumanoidRootPart.CFrame * CFrame.new(0, 15, 0)) else fireclickdetector(sealed.ClickDetector) end
                    end
                elseif CurrentQuest == "Tushita" then
                    local boss = GetAliveBoss("Longma")
                    if boss then TweenTo(boss.HumanoidRootPart.CFrame * CFrame.new(0, 40, 0)) else HopLowServer(5) end
                elseif CurrentQuest == "SoulGuitar" then
                    if CheckItem("Bones") < 500 then
                        local mob = GetAliveMonster("Living Zombie") or GetAliveMonster("Demonic Soul")
                        if mob then TweenTo(mob.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)) else TweenTo(CFrame.new(-9505, 172, 6158)) end
                    elseif CheckItem("Ectoplasm") < 250 then
                        local mob = GetAliveMonster("Ship Deckhand") or GetAliveMonster("Ship Engineer")
                        if mob then TweenTo(mob.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0)) else TweenTo(CFrame.new(921, 125, 32937)) end
                    else
                        TweenTo(CFrame.new(-9680, 6, 6346))
                        task.wait(2)
                        replicated.Remotes.CommF_:InvokeServer("GuitarPuzzleProgress", "Gravestone")
                    end
                elseif CurrentQuest == "CDK" then
                    local progress = replicated.Remotes.CommF_:InvokeServer("CDKQuest", "Progress")
                    if progress.Good == 0 or progress.Good == -3 then
                        TweenTo(CFrame.new(-12379, 601, -6543))
                        replicated.Remotes.CommF_:InvokeServer("CDKQuest", "StartTrial", "Good")
                    elseif progress.Evil == 0 or progress.Evil == -3 then
                        TweenTo(CFrame.new(-12392, 603, -6503))
                        replicated.Remotes.CommF_:InvokeServer("CDKQuest", "StartTrial", "Evil")
                    elseif progress.Good == 4 and progress.Evil == 4 then
                        local boss = GetAliveBoss("Cursed Skeleton Boss")
                        if boss then TweenTo(boss.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)) else TweenTo(CFrame.new(-12330, 603, -6549)) end
                    end
                elseif CurrentQuest == "RGB" then
                    for _, bossName in ipairs({"Stone", "Hydra Leader", "Kilo Admiral", "Captain Elephant", "Beautiful Pirate"}) do
                        local boss = GetAliveBoss(bossName)
                        if boss then TweenTo(boss.HumanoidRootPart.CFrame * CFrame.new(0, 40, 0)); break end
                    end
                elseif CurrentQuest == "EvoRaceV1" then
                    if not HasItem("Flower 1") then TweenTo(Workspace.Flower1.CFrame)
                    elseif not HasItem("Flower 2") then TweenTo(Workspace.Flower2.CFrame)
                    elseif not HasItem("Flower 3") then
                        local mob = GetAliveMonster("Swan Pirate")
                        if mob then TweenTo(mob.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)) else TweenTo(CFrame.new(976, 111, 1229)) end
                    else replicated.Remotes.CommF_:InvokeServer("Alchemist", "3") end
                elseif CurrentQuest == "EvoRaceV2" then
                    if race == "Human" then
                        for _, bossName in ipairs({"Orbitus", "Jeremy", "Diamond"}) do
                            local boss = GetAliveBoss(bossName)
                            if boss then TweenTo(boss.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)); break end
                        end
                    elseif race == "Fishman" then
                        -- sea beast hunting
                    end
                elseif CurrentQuest == "DonSwan" then
                    local boss = GetAliveBoss("Don Swan")
                    if boss then TweenTo(boss.HumanoidRootPart.CFrame * CFrame.new(0, 40, 0)) else HopLowServer(5) end
                elseif CurrentQuest == "Bartilo" then
                    local progress = replicated.Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo")
                    if progress == 0 then
                        TweenTo(CFrame.new(-1836, 11, 1714))
                    elseif progress == 1 then
                        local mob = GetAliveMonster("Swan Pirate")
                        if mob then TweenTo(mob.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)) else TweenTo(CFrame.new(976, 111, 1229)) end
                    elseif progress == 2 then
                        local boss = GetAliveBoss("Jeremy")
                        if boss then TweenTo(boss.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)) end
                    end
                elseif CurrentQuest == "PullLever" then
                    local v4Progress = replicated.Remotes.CommF_:InvokeServer("RaceV4Progress", "Check")
                    if v4Progress == 4 then
                        for _, obj in ipairs(Workspace.Map.MysticIsland:GetDescendants()) do
                            if obj:IsA("ProximityPrompt") and obj.Parent.Name == "Lever" then
                                TweenTo(obj.Parent.CFrame); fireproximityprompt(obj); break
                            end
                        end
                    end
                elseif CurrentQuest == "EliteHunters" then
                    for _, bossName in ipairs({"Diablo", "Deandre", "Urban"}) do
                        local boss = GetAliveBoss(bossName)
                        if boss then TweenTo(boss.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)); break end
                    end
                elseif CurrentQuest == "CakePrince" then
                    local prince = GetAliveBoss("Cake Prince")
                    if prince then TweenTo(prince.HumanoidRootPart.CFrame * CFrame.new(0, 42, 10)) else replicated.Remotes.CommF_:InvokeServer("CakePrinceSpawner", true) end
                elseif CurrentQuest == "DoughKing" then
                    local king = GetAliveBoss("Dough King")
                    if king then TweenTo(king.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)) end
                elseif CurrentQuest == "Darkbeard" then
                    local boss = GetAliveBoss("Darkbeard")
                    if boss then TweenTo(boss.HumanoidRootPart.CFrame * CFrame.new(0, -30, 0)) end
                elseif CurrentQuest == "Core" then
                    local boss = GetAliveBoss("Core")
                    if boss then TweenTo(boss.HumanoidRootPart.CFrame * CFrame.new(0, 40, 0)) end
                elseif CurrentQuest == "GodhumanMats" then
                    if CheckItem("Fish Tail") < 20 then
                        if not World1 then replicated.Remotes.CommF_:InvokeServer("TravelMain"); task.wait(30) end
                        local mob = GetAliveMonster("Fishman Warrior") or GetAliveMonster("Fishman Commando")
                        if mob then TweenTo(mob.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0)) else TweenTo(CFrame.new(60946, 65, 1525)) end
                    elseif CheckItem("Magma Ore") < 20 then
                        if not World2 then replicated.Remotes.CommF_:InvokeServer("TravelDressrosa"); task.wait(30) end
                        local mob = GetAliveMonster("Magma Ninja") or GetAliveMonster("Lava Pirate")
                        if mob then TweenTo(mob.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0)) else TweenTo(CFrame.new(-5466, 77, -5837)) end
                    elseif CheckItem("Mystic Droplet") < 10 then
                        if not World2 then replicated.Remotes.CommF_:InvokeServer("TravelDressrosa"); task.wait(30) end
                        local mob = GetAliveMonster("Sea Soldier") or GetAliveMonster("Water Fighter")
                        if mob then TweenTo(mob.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0)) else TweenTo(CFrame.new(-3115, 63, -9808)) end
                    elseif CheckItem("Dragon Scale") < 10 then
                        if not World3 then replicated.Remotes.CommF_:InvokeServer("TravelZou"); task.wait(30) end
                        local mob = GetAliveMonster("Dragon Crew Warrior") or GetAliveMonster("Dragon Crew Archer")
                        if mob then TweenTo(mob.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0)) else TweenTo(CFrame.new(6241, 51, -1243)) end
                    end
                elseif CurrentQuest == "FireEssence" then
                    if CheckItem("Bones") < 500 then
                        local mob = GetAliveMonster("Living Zombie") or GetAliveMonster("Demonic Soul")
                        if mob then TweenTo(mob.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)) else TweenTo(CFrame.new(-9505, 172, 6158)) end
                    elseif replicated.Remotes.CommF_:InvokeServer("Bones", "Check") > 0 then
                        replicated.Remotes.CommF_:InvokeServer("Bones", "Buy", 1, 1)
                    end
                end
            end
        end)
    end
end)

--// ================== AUTO CYBORG CHEST FARMING ==================
local ChestCount = 0
local IsFightingBoss = false
local FistDetected = false
local HasCoreBrainFlag = false

task.spawn(function()
    while task.wait(0.5) do
        if not getgenv().Configs.AutoCyborg.Enabled then continue end
        pcall(function()
            if IsCyborg() then
                getgenv().Configs.AutoCyborg.Enabled = false
                UpdateStatus("Cyborg Race Acquired!")
                return
            end

            -- Check Core Brain
            if HasCoreBrain() and not IsCyborg() then
                HasCoreBrainFlag = true
                UpdateStatus("Core Brain found! Buying Cyborg...")
                EquipCoreBrain()
                ClickDetectorSafe()
                task.wait(5)
                if BuyCyborgRace() then
                    UpdateStatus("Cyborg Race Purchased!")
                    return
                end
            end

            -- Check Fist of Darkness
            if HasFistOfDarkness() and not FistDetected then
                FistDetected = true
                UpdateStatus("Fist of Darkness found!")
                if not HasMicrochip() then BuyMicrochip(); task.wait(1) end
                if HasMicrochip() then
                    ClickDetectorSafe()
                    task.wait(3)
                    if CheckBoss("Order") then
                        IsFightingBoss = true
                        local timeout = 0
                        while CheckBoss("Order") and timeout < 300 do
                            task.wait(1); timeout = timeout + 1
                        end
                        IsFightingBoss = false
                        if HasCoreBrain() then
                            EquipCoreBrain()
                            ClickDetectorSafe()
                            task.wait(5)
                            BuyCyborgRace()
                        end
                    end
                else
                    -- Farm chests
                    if getgenv().Configs.AutoCyborg.AutoCollectChest then
                        local chest = GetChest()
                        if chest then
                            TweenTo(CFrame.new(chest.Position))
                            ChestCount = ChestCount + 1
                            ChestRow.Text = "📦 Chests: " .. ChestCount
                        end
                    end
                end
            elseif getgenv().Configs.AutoCyborg.AutoCollectChest and not IsFightingBoss then
                local chest = GetChest()
                if chest then
                    TweenTo(CFrame.new(chest.Position))
                    ChestCount = ChestCount + 1
                    ChestRow.Text = "📦 Chests: " .. ChestCount
                end
            end

            -- Auto hop every 15 minutes
            if getgenv().Configs.AutoCyborg.AutoHop and not IsFightingBoss then
                if tick() - (_G.ServerStartTime or tick()) > 900 then
                    UpdateStatus("Server Hopping...")
                    HopLowServer(10)
                    _G.ServerStartTime = tick()
                end
            end
        end)
    end
end)

--// ================== SEA EVENTS ==================
task.spawn(function()
    while task.wait(1) do
        if not getgenv().Configs.SeaEvents.Enable then continue end
        local cfg = getgenv().Configs.SeaEvents
        pcall(function()
            if cfg.AutoSail then
                local boat = nil
                for _, b in ipairs(Workspace.Boats:GetChildren()) do
                    if b.Owner.Value == Player.Name then boat = b; break end
                end
                if not boat then
                    TweenTo(CFrame.new(-16927.451, 9.086, 433.864))
                    if (Player.Character.HumanoidRootPart.Position - Vector3.new(-16927.451, 9.086, 433.864)).Magnitude < 10 then
                        replicated.Remotes.CommF_:InvokeServer("BuyBoat", cfg.SelectedBoat)
                    end
                else
                    if Player.Character.Humanoid.Sit == false then
                        TweenTo(boat.VehicleSeat.CFrame * CFrame.new(0, 2, 0))
                        task.wait(1)
                        Player.Character.Humanoid.Sit = true
                    else
                        local danger = cfg.DangerLevel
                        local targetPos
                        if danger == "Lv 1" then targetPos = Vector3.new(-21998, 30, -682)
                        elseif danger == "Lv 2" then targetPos = Vector3.new(-26780, 30, -823)
                        elseif danger == "Lv 3" then targetPos = Vector3.new(-31172, 30, -2257)
                        elseif danger == "Lv 4" then targetPos = Vector3.new(-34055, 30, -2560)
                        elseif danger == "Lv 5" then targetPos = Vector3.new(-38888, 30, -2163)
                        elseif danger == "Lv 6" then targetPos = Vector3.new(-44542, 30, -1245)
                        else targetPos = Vector3.new(-10000000, 31, 37016.25) end
                        TweenTo(CFrame.new(targetPos))
                    end
                end
            end
            -- Sea creature combat handled by FastAttack, just tween to them
            local seaTargets = {}
            if cfg.KillShark then table.insert(seaTargets, "Shark") end
            if cfg.KillTerrorShark then table.insert(seaTargets, "Terrorshark") end
            if cfg.KillPiranha then table.insert(seaTargets, "Piranha") end
            if cfg.KillFishCrew then table.insert(seaTargets, "Fish Crew Member") end
            if cfg.KillHauntedCrew then table.insert(seaTargets, "Haunted Crew Member") end
            if cfg.KillFishBoat then table.insert(seaTargets, "FishBoat") end
            if cfg.KillPirateGrandBrigade then table.insert(seaTargets, "PirateBrigade") end
            for _, name in ipairs(seaTargets) do
                local entity = GetAliveBoss(name)
                if entity then TweenTo(entity.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0)); break end
            end
            if cfg.KillSeaBeast then
                for _, sb in ipairs(Workspace.SeaBeasts:GetChildren()) do
                    if sb:FindFirstChild("HumanoidRootPart") and sb:FindFirstChild("Health") and sb.Health.Value > 0 then
                        TweenTo(sb.HumanoidRootPart.CFrame * CFrame.new(0, 200, 0)); break
                    end
                end
            end
            if cfg.KillLeviathan then
                local lev = Workspace.SeaBeasts:FindFirstChild("Leviathan")
                if lev and lev:FindFirstChild("HumanoidRootPart") and lev.Health.Value > 0 then
                    TweenTo(lev.HumanoidRootPart.CFrame * CFrame.new(0, 200, 0))
                end
            end
        end)
    end
end)

--// ================== MIRAGE ISLAND ==================
task.spawn(function()
    while task.wait(1) do
        if not getgenv().Configs.Mirage.FindMirage then continue end
        pcall(function()
            if not Workspace._WorldOrigin.Locations:FindFirstChild("Mirage Island", true) then
                local boat = nil
                for _, b in ipairs(Workspace.Boats:GetChildren()) do
                    if b.Owner.Value == Player.Name then boat = b; break end
                end
                if not boat then
                    TweenTo(CFrame.new(-16927.451, 9.086, 433.864))
                    task.wait(1)
                    replicated.Remotes.CommF_:InvokeServer("BuyBoat", "Guardian")
                else
                    if Player.Character.Humanoid.Sit == false then
                        TweenTo(boat.VehicleSeat.CFrame * CFrame.new(0, 2, 0))
                        task.wait(1)
                        Player.Character.Humanoid.Sit = true
                    else
                        TweenTo(CFrame.new(Vector3.new(-10000000, 31, 37016.25)))
                    end
                end
            else
                local island = Workspace._WorldOrigin.Locations:FindFirstChild("Mirage Island")
                if island then TweenTo(island.CFrame * CFrame.new(0, 300, 0)) end
            end
        end)
    end
end)

--// ================== RACE V4 TRIALS COMPLETE ==================
task.spawn(function()
    while task.wait(0.5) do
        if not getgenv().Configs.RaceV4.CompleteTrials then continue end
        pcall(function()
            local race = Player.Data.Race.Value
            if race == "Mink" then
                local t = Workspace.Map:FindFirstChild("MinkTrial")
                if t then TweenTo(t.Ceiling.CFrame * CFrame.new(0, -20, 0)) end
            elseif race == "Fishman" then
                for _, sb in ipairs(Workspace.SeaBeasts:GetChildren()) do
                    if sb:FindFirstChild("HumanoidRootPart") and sb:FindFirstChild("Health") and sb.Health.Value > 0 then
                        TweenTo(sb.HumanoidRootPart.CFrame * CFrame.new(0, 200, 0)); break
                    end
                end
            elseif race == "Cyborg" then
                local t = Workspace.Map:FindFirstChild("CyborgTrial")
                if t then TweenTo(t.Floor.CFrame * CFrame.new(0, 500, 0)) end
            elseif race == "Skypiea" then
                local t = Workspace.Map:FindFirstChild("SkyTrial")
                if t and t.Model:FindFirstChild("FinishPart") then
                    TweenTo(t.Model.FinishPart.CFrame)
                end
            elseif race == "Human" or race == "Ghoul" then
                local m = GetAliveBoss("Ancient Vampire") or GetAliveBoss("Ancient Zombie")
                if m then TweenTo(m.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0)) end
            end
        end)
    end
end)

--// ================== DRAGON DOJO & PREHISTORIC ==================
task.spawn(function()
    while task.wait(0.5) do
        if not getgenv().Configs.Dragon.DojoBelt then continue end
        pcall(function()
            local net = replicated.Modules.Net:FindFirstChild("RF/InteractDragonQuest")
            if not net then return end
            local result = net:InvokeServer({NPC = "Dojo Trainer", Command = "RequestQuest"})
            if not result then
                net:InvokeServer({NPC = "Dojo Trainer", Command = "ClaimQuest"})
            else
                local belt = result.Quest and result.Quest.BeltName
                if belt == "White" then
                    local m = GetAliveBoss("Skull Slayer")
                    if m then TweenTo(m.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0)) end
                elseif belt == "Yellow" then
                    getgenv().Configs.SeaEvents.KillSeaBeast = true
                    getgenv().Configs.SeaEvents.AutoSail = true
                elseif belt == "Green" then
                    getgenv().Configs.SeaEvents.AutoSail = true
                elseif belt == "Red" then
                    getgenv().Configs.SeaEvents.KillFishBoat = true
                    getgenv().Configs.SeaEvents.AutoSail = true
                elseif belt == "Black" then
                    getgenv().Configs.Prehistoric.FindIsland = true
                end
            end
        end)
    end
end)

-- Prehistoric island finder
task.spawn(function()
    while task.wait(1) do
        if not getgenv().Configs.Prehistoric.FindIsland then continue end
        pcall(function()
            if not Workspace._WorldOrigin.Locations:FindFirstChild("Prehistoric Island", true) then
                local boat = nil
                for _, b in ipairs(Workspace.Boats:GetChildren()) do
                    if b.Owner.Value == Player.Name then boat = b; break end
                end
                if not boat then
                    TweenTo(CFrame.new(-16927.451, 9.086, 433.864))
                    task.wait(1)
                    replicated.Remotes.CommF_:InvokeServer("BuyBoat", "Guardian")
                else
                    if Player.Character.Humanoid.Sit == false then
                        TweenTo(boat.VehicleSeat.CFrame * CFrame.new(0, 2, 0))
                        task.wait(1)
                        Player.Character.Humanoid.Sit = true
                    else
                        TweenTo(CFrame.new(Vector3.new(-10000000, 31, 37016.25)))
                    end
                end
            else
                TweenTo(Workspace._WorldOrigin.Locations["Prehistoric Island"].CFrame * CFrame.new(0, 500, 0))
            end
        end)
    end
end)

-- Prehistoric event patcher & lava golem killer
task.spawn(function()
    while task.wait(0.5) do
        if not getgenv().Configs.Prehistoric.PatchEvent then continue end
        pcall(function()
            local pre = Workspace.Map:FindFirstChild("PrehistoricIsland")
            if pre then
                for _, obj in ipairs(pre:GetDescendants()) do
                    if obj.Name:lower():find("lava") and (obj:IsA("Part") or obj:IsA("MeshPart")) then
                        obj:Destroy()
                    end
                end
                local golem = GetAliveMonster("Lava Golem")
                if golem then
                    TweenTo(golem.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                end
            end
        end)
    end
end)

--// ================== FISHING ==================
task.spawn(function()
    while task.wait(1) do
        if not getgenv().Configs.Fishing.Enable then continue end
        pcall(function()
            local rodName = getgenv().Configs.Fishing.Rod
            local char = Player.Character
            if not char then return end
            if not char:FindFirstChild(rodName) then
                local rod = Player.Backpack:FindFirstChild(rodName)
                if rod then char.Humanoid:EquipTool(rod); task.wait(0.5)
                else replicated.Remotes.CommF_:InvokeServer("LoadItem", rodName, {"Gear"}) end
            end
            local tool = char:FindFirstChild(rodName)
            if tool then
                local state = tool:GetAttribute("ServerState") or tool:GetAttribute("State")
                local fishRep = replicated:FindFirstChild("FishReplicated")
                if fishRep then
                    local req = fishRep:FindFirstChild("FishingRequest")
                    if req then
                        if state == "Biting" then
                            req:InvokeServer("Catching", 1)
                            task.wait(0.25)
                            req:InvokeServer("Catch", 1)
                        elseif state == "ReeledIn" or state == "Idle" or not state then
                            req:InvokeServer("StartCasting")
                            task.wait(0.7)
                            local waterY = require(replicated.Util:WaitForChild("GetWaterHeightAtLocation"))(char.HumanoidRootPart.Position)
                            local castPos = char.HumanoidRootPart.Position + Vector3.new(0, -10, 0)
                            req:InvokeServer("CastLineAtLocation", castPos, 100, true)
                        end
                    end
                end
            end
        end)
    end
end)

--// ================== ESP ==================
task.spawn(function()
    while task.wait(1) do
        local cfg = getgenv().Configs.ESP
        pcall(function()
            if cfg.Players then
                for _, plr in ipairs(Players:GetPlayers()) do
                    if plr ~= Player and plr.Character and plr.Character:FindFirstChild("Head") then
                        local head = plr.Character.Head
                        local bill = head:FindFirstChild("EspPlr") or Instance.new("BillboardGui")
                        bill.Name = "EspPlr"
                        bill.AlwaysOnTop = true
                        bill.Size = UDim2.new(0, 200, 0, 30)
                        bill.Adornee = head
                        bill.Parent = head
                        local label = bill:FindFirstChild("TextLabel") or Instance.new("TextLabel")
                        label.Font = Enum.Font.Code
                        label.TextSize = 14
                        label.Size = UDim2.new(1,0,1,0)
                        label.BackgroundTransparency = 1
                        label.Text = plr.Name .. " [" .. plr.Data.Level.Value .. "]"
                        label.TextColor3 = (plr.Team == Player.Team) and Color3.new(0,0,1) or Color3.new(1,0,0)
                        label.Parent = bill
                    end
                end
            end
            if cfg.Fruits then
                for _, obj in ipairs(Workspace:GetChildren()) do
                    if obj:IsA("Tool") and obj.Name:find("Fruit") and obj:FindFirstChild("Handle") then
                        local handle = obj.Handle
                        local bill = handle:FindFirstChild("EspFruit") or Instance.new("BillboardGui")
                        bill.Name = "EspFruit"
                        bill.AlwaysOnTop = true
                        bill.Size = UDim2.new(0, 200, 0, 30)
                        bill.Adornee = handle
                        bill.Parent = handle
                        local label = bill:FindFirstChild("TextLabel") or Instance.new("TextLabel")
                        label.Font = Enum.Font.Code
                        label.TextSize = 14
                        label.Size = UDim2.new(1,0,1,0)
                        label.BackgroundTransparency = 1
                        label.Text = obj.Name
                        label.TextColor3 = Color3.fromRGB(255,255,255)
                        label.Parent = bill
                    end
                end
            end
            if cfg.Chests then
                for _, chest in ipairs(Workspace:GetDescendants()) do
                    if chest:IsA("Model") and chest:GetAttribute("_ChestTagged") then
                        local part = chest.PrimaryPart or chest:FindFirstChildWhichIsA("BasePart")
                        if part then
                            local bill = part:FindFirstChild("EspChest") or Instance.new("BillboardGui")
                            bill.Name = "EspChest"
                            bill.AlwaysOnTop = true
                            bill.Size = UDim2.new(0,150,0,20)
                            bill.Adornee = part
                            bill.Parent = part
                            local label = bill:FindFirstChild("TextLabel") or Instance.new("TextLabel")
                            label.Font = Enum.Font.Code
                            label.TextSize = 12
                            label.Size = UDim2.new(1,0,1,0)
                            label.BackgroundTransparency = 1
                            label.Text = "Chest"
                            label.TextColor3 = Color3.fromRGB(0,255,255)
                            label.Parent = bill
                        end
                    end
                end
            end
            if cfg.IslandLocations then
                for _, loc in ipairs(Workspace._WorldOrigin.Locations:GetChildren()) do
                    if loc.Name ~= "Sea" then
                        local bill = loc:FindFirstChild("EspIsl") or Instance.new("BillboardGui")
                        bill.Name = "EspIsl"
                        bill.AlwaysOnTop = true
                        bill.Size = UDim2.new(0,200,0,20)
                        bill.Adornee = loc
                        bill.Parent = loc
                        local label = bill:FindFirstChild("TextLabel") or Instance.new("TextLabel")
                        label.Font = Enum.Font.Code
                        label.TextSize = 12
                        label.Size = UDim2.new(1,0,1,0)
                        label.BackgroundTransparency = 1
                        label.Text = loc.Name
                        label.TextColor3 = Color3.fromRGB(0,255,255)
                        label.Parent = bill
                    end
                end
            end
            if cfg.Berries then
                for _, bush in ipairs(Workspace:GetDescendants()) do
                    if bush:IsA("Model") and bush:GetAttribute("BerryBush") then
                        local part = bush:FindFirstChildWhichIsA("BasePart") or bush.PrimaryPart
                        if part then
                            local bill = part:FindFirstChild("EspBerry") or Instance.new("BillboardGui")
                            bill.Name = "EspBerry"
                            bill.AlwaysOnTop = true
                            bill.Size = UDim2.new(0,150,0,20)
                            bill.Adornee = part
                            bill.Parent = part
                            local label = bill:FindFirstChild("TextLabel") or Instance.new("TextLabel")
                            label.Font = Enum.Font.Code
                            label.TextSize = 12
                            label.Size = UDim2.new(1,0,1,0)
                            label.BackgroundTransparency = 1
                            label.Text = "Berry"
                            label.TextColor3 = Color3.fromRGB(255,0,255)
                            label.Parent = bill
                        end
                    end
                end
            end
        end)
    end
end)

--// ================== MISC UTILITIES ==================
-- Panic mode
task.spawn(function()
    while task.wait(1) do
        if not getgenv().Configs.Misc.PanicMode then continue end
        pcall(function()
            local hum = Player.Character and Player.Character.Humanoid
            if hum and hum.Health > 0 and (hum.Health / hum.MaxHealth) < 0.25 then
                TweenTo(Player.Character.HumanoidRootPart.CFrame * CFrame.new(0, 500, 0))
            end
        end)
    end
end)

-- Remove hit VFX
task.spawn(function()
    while task.wait(0.5) do
        if not getgenv().Configs.Misc.RemoveHitVFX then continue end
        pcall(function()
            for _, v in ipairs(Workspace._WorldOrigin:GetChildren()) do
                if v.Name == "SlashHit" or v.Name == "CurvedRing" or v.Name == "SwordSlash" or v.Name == "SlashTail" then
                    v:Destroy()
                end
            end
        end)
    end
end)

-- Disable notifications
task.spawn(function()
    while task.wait(1) do
        if not getgenv().Configs.Misc.DisableNotifications then continue end
        pcall(function()
            if Player.PlayerGui:FindFirstChild("Notifications") then
                Player.PlayerGui.Notifications.Enabled = false
            end
        end)
    end
end)

--// ================== RAID FARMING (AUTO) ==================
local RaidSettings = {
    Enabled = true,
    SelectedMap = "Ice"
}

task.spawn(function()
    while task.wait(1) do
        if CurrentQuest then continue end
        if not RaidSettings.Enabled then continue end
        pcall(function()
            local fragments = Player.Data.Fragments.Value
            local fruits = GetFruits()
            local fruitName = Player.Data.DevilFruit.Value
            
            if fruitName == "Dark-Dark" then RaidSettings.SelectedMap = "Dark"
            elseif fruitName == "Sand-Sand" then RaidSettings.SelectedMap = "Sand"
            elseif fruitName == "Magma-Magma" then RaidSettings.SelectedMap = "Magma"
            elseif fruitName == "Rumble-Rumble" then RaidSettings.SelectedMap = "Rumble"
            elseif fruitName == "Flame-Flame" then RaidSettings.SelectedMap = "Flame"
            elseif fruitName == "Ice-Ice" then RaidSettings.SelectedMap = "Ice"
            elseif fruitName == "Light-Light" then RaidSettings.SelectedMap = "Light"
            elseif fruitName == "String-String" then RaidSettings.SelectedMap = "String"
            elseif fruitName == "Quake-Quake" then RaidSettings.SelectedMap = "Quake"
            elseif fruitName == "Buddha-Buddha" then RaidSettings.SelectedMap = "Buddha"
            end
            
            if not Player.PlayerGui.Main.TopHUDList.RaidTimer.Visible then
                if fragments < 15000 and #fruits > 0 then
                    local cheapest = fruits[1]
                    if cheapest.Value < 1000000 then
                        replicated.Remotes.CommF_:InvokeServer("LoadFruit", cheapest.Name)
                        task.wait(1)
                    end
                end
                if HasItem("Special Microchip") or fragments >= 1000 then
                    replicated.Remotes.CommF_:InvokeServer("RaidsNpc", "Select", RaidSettings.SelectedMap)
                    task.wait(0.5)
                    if World2 then
                        fireclickdetector(Workspace.Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector)
                    elseif World3 then
                        TweenTo(CFrame.new(-5034, 315, -2951))
                        task.wait(2)
                        fireclickdetector(Workspace.Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector)
                    end
                end
            else
                -- Raid in progress, farm mobs
                local mobs = Workspace.Enemies:GetChildren()
                local closest = nil
                local minDist = math.huge
                for _, mob in ipairs(mobs) do
                    if mob:FindFirstChild("Humanoid") and mob.Humanoid.Health > 0 then
                        local hrp = mob:FindFirstChild("HumanoidRootPart")
                        if hrp then
                            local dist = (hrp.Position - Player.Character.HumanoidRootPart.Position).Magnitude
                            if dist < minDist then
                                minDist = dist
                                closest = mob
                            end
                        end
                    end
                end
                if closest then
                    TweenTo(closest.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                else
                    local islands = {"Island 5", "Island 4", "Island 3", "Island 2", "Island 1"}
                    for _, islandName in ipairs(islands) do
                        local island = Workspace._WorldOrigin.Locations:FindFirstChild(islandName)
                        if island then
                            TweenTo(island.CFrame * CFrame.new(0, 120, 0))
                            break
                        end
                    end
                end
            end
        end)
    end
end)

--// ================== AUTO BUY ITEMS & SWORDS ==================
task.spawn(function()
    while task.wait(30) do
        pcall(function()
            local beli = Player.Data.Beli.Value
            if beli >= 3000000 then
                local swords = {"Bisento", "Cutlass", "Katana", "Dual Katana", "Soul Cane", "Triple Katana", "Iron Mace", "Pipe", "Dual-Headed Blade"}
                for _, sword in ipairs(swords) do if not HasItem(sword) then replicated.Remotes.CommF_:InvokeServer("BuyItem", sword) end end
                local guns = {"Musket", "Flintlock", "Refined Slingshot", "Dual Flintlock", "Cannon"}
                for _, gun in ipairs(guns) do if not HasItem(gun) then replicated.Remotes.CommF_:InvokeServer("BuyItem", gun) end end
            end
            if not HasItem("Midnight Blade") then
                if replicated.Remotes.CommF_:InvokeServer("Ectoplasm", "Check") >= 100 then
                    replicated.Remotes.CommF_:InvokeServer("Ectoplasm", "Buy", 3)
                end
            end
            if World2 and beli >= 2500000 then
                replicated.Remotes.CommF_:InvokeServer("LegendarySwordDealer", "1")
                replicated.Remotes.CommF_:InvokeServer("LegendarySwordDealer", "2")
                replicated.Remotes.CommF_:InvokeServer("LegendarySwordDealer", "3")
            end
            if not HasItem("Kabucha") and Player.Data.Fragments.Value >= 10000 then
                replicated.Remotes.CommF_:InvokeServer("BlackbeardReward", "Slingshot", "2")
            end
        end)
    end
end)

--// ================== AUTO OBSERVATION HAKI ==================
task.spawn(function()
    while task.wait(1) do
        pcall(function()
            if Player.Data.Level.Value >= 300 and not Player.Character:FindFirstChild("Ken") then
                replicated.Remotes.CommF_:InvokeServer("KenTalk", "Buy")
            end
        end)
    end
end)

--// ================== AUTO STORE FRUITS ==================
task.spawn(function()
    while task.wait(5) do
        pcall(function()
            for _, tool in ipairs(Player.Backpack:GetChildren()) do
                if tool:IsA("Tool") and tool:GetAttribute("OriginalName") and string.find(tool.Name, "Fruit") then
                    replicated.Remotes.CommF_:InvokeServer("StoreFruit", tool:GetAttribute("OriginalName"), tool)
                end
            end
            for _, tool in ipairs(Player.Character:GetChildren()) do
                if tool:IsA("Tool") and tool:GetAttribute("OriginalName") and string.find(tool.Name, "Fruit") then
                    replicated.Remotes.CommF_:InvokeServer("StoreFruit", tool:GetAttribute("OriginalName"), tool)
                end
            end
        end)
    end
end)

--// ================== NOTIFICATION CLEANUP ==================
task.spawn(function()
    while task.wait(1) do
        pcall(function()
            if Player.PlayerGui:FindFirstChild("Notifications") then
                Player.PlayerGui.Notifications.Enabled = false
            end
        end)
    end
end)

--// ================== AUTO RACE REROLL (V4 or better) ==================
local DesiredRaces = {"Cyborg", "Ghoul", "Human", "Angel", "Shark", "Mink"}
task.spawn(function()
    while task.wait(60) do
        pcall(function()
            local currentRace = Player.Data.Race.Value
            local fragments = Player.Data.Fragments.Value
            if fragments >= 3000 and not table.find(DesiredRaces, currentRace) then
                replicated.Remotes.CommF_:InvokeServer("Alchemist", "2")
            end
        end)
    end
end)

--// ================== FINAL INITIALIZATION ==================
_G.ServerStartTime = tick()
UpdateStatus("Part 2 Loaded - Ready!")
--[[
   ╔══════════════════════════════════════════════════════════════╗
   ║     ASTRAL HUB - ULTIMATE MEGA MERGE (PART 3 OF 5)          ║
   ║     Advanced Quest Handlers (Full), Extended Farming,        ║
   ║     Complete CDK, Soul Guitar, V4, Godhuman, All Bosses      ║
   ╚══════════════════════════════════════════════════════════════╝
--]]

--// ================== OVERRIDE PRIORITY QUEST DETECTION ==================
-- (Replace the DeterminePriorityQuest from Part 2 with this advanced version)
local function DeterminePriorityQuestAdvanced()
    local lvl = Player.Data.Level.Value
    local frags = Player.Data.Fragments.Value
    local beli = Player.Data.Beli.Value
    local race = Player.Data.Race.Value

    -- --- Weapon / Boss priorities ---
    if not HasItem("Magma Blaster") and lvl >= 200 and World1 and CheckBoss("Magma Admiral") then return "MagmaBlaster" end
    if not HasItem("Bazooka") and lvl >= 200 and World1 and CheckBoss("Wysper") then return "Bazooka" end
    if not HasItem("Saber") and lvl >= 200 then return "Saber" end
    if not HasItem("Shark Saw") and lvl >= 100 and World1 and CheckBoss("The Saw") then return "SharkSaw" end
    if not HasItem("Wardens Sword") and lvl >= 100 and World1 and CheckBoss("Chief Warden") then return "WardenSword" end
    if not HasItem("Pole (1st Form)") and lvl >= 100 and World1 and CheckBoss("Thunder God") then return "Pole" end
    if not HasItem("Rengoku") and lvl >= 800 and World2 and CheckBoss("Awakened Ice Admiral") then return "Rengoku" end
    if not HasItem("Gravity Blade") and World2 and lvl >= 800 and CheckBoss("Orbitus") then return "GravityBlade" end
    if not HasItem("Longsword") and World2 and lvl >= 800 and CheckBoss("Diamond") then return "Longsword" end
    if not HasItem("Flail") and World2 and CheckBoss("Smoke Admiral") then return "Flail" end
    if not HasItem("Yama") and lvl >= 2000 and World3 and replicated.Remotes.CommF_:InvokeServer("EliteHunter", "Progress") >= 30 then return "Yama" end
    if not HasItem("Tushita") and World3 and replicated.Remotes.CommF_:InvokeServer("TushitaProgress").OpenedDoor then return "Tushita" end
    if not HasItem("Soul Guitar") and lvl >= 2000 and CheckItem("Dark Fragment") >= 1 then return "SoulGuitar" end
    if not HasItem("Cursed Dual Katana") and HasItem("Tushita") and HasItem("Yama") then return "CDK" end
    if not HasItem("Venom Bow") and World3 and CheckBoss("Hydra Leader") then return "VenomBow" end
    if not HasItem("Twin Hooks") and World3 and CheckBoss("Captain Elephant") then return "TwinHooks" end
    if not HasItem("Serpent Bow") and World3 and CheckBoss("Hydra Leader") then return "SerpentBow" end  -- same boss
    -- Auto buy other swords
    if not HasItem("Cutlass") and beli >= 3000000 then return "BuyItem:Cutlass" end
    if not HasItem("Katana") and beli >= 3000000 then return "BuyItem:Katana" end
    if not HasItem("Dual Katana") and beli >= 3000000 then return "BuyItem:Dual Katana" end
    if not HasItem("Soul Cane") and beli >= 3000000 then return "BuyItem:Soul Cane" end
    if not HasItem("Triple Katana") and beli >= 3000000 then return "BuyItem:Triple Katana" end
    if not HasItem("Iron Mace") and beli >= 3000000 then return "BuyItem:Iron Mace" end
    if not HasItem("Pipe") and beli >= 3000000 then return "BuyItem:Pipe" end
    if not HasItem("Dual-Headed Blade") and beli >= 3000000 then return "BuyItem:Dual-Headed Blade" end
    if not HasItem("Musket") and beli >= 3000000 then return "BuyItem:Musket" end
    if not HasItem("Flintlock") and beli >= 3000000 then return "BuyItem:Flintlock" end
    if not HasItem("Refined Slingshot") and beli >= 3000000 then return "BuyItem:Refined Slingshot" end
    if not HasItem("Dual Flintlock") and beli >= 3000000 then return "BuyItem:Dual Flintlock" end
    if not HasItem("Cannon") and beli >= 3000000 then return "BuyItem:Cannon" end

    -- Race evolutions
    if getgenv().Configs.Quest["Evo Race V1"] and World2 and lvl >= 850 then
        if replicated.Remotes.CommF_:InvokeServer("Alchemist", "1") ~= -2 then return "EvoRaceV1" end
    end
    if getgenv().Configs.Quest["Evo Race V2"] and World2 and lvl >= 1400 then
        if replicated.Remotes.CommF_:InvokeServer("TalkTrevor", "1") == 0 then return "EvoRaceV2" end
    end
    if World2 and lvl >= 900 and replicated.Remotes.CommF_:InvokeServer("TalkTrevor", "1") ~= 0 and lvl >= 1500 then return "DonSwan" end
    if World2 and lvl >= 850 and replicated.Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo") ~= 3 then return "Bartilo" end

    -- V4
    if getgenv().Configs.Quest["Pull Lerver"] and World3 and Workspace.Map:FindFirstChild("MysticIsland") then return "PullLever" end
    -- Also trigger V4 race trials if configured
    if getgenv().Configs.RaceV4.CompleteTrials and World3 then
        if not replicated.Remotes.CommF_:InvokeServer("CheckTempleDoor") then return "RaceV4" end
    end

    -- RGB Haki
    if getgenv().Configs.Quest["RGB Haki"] and lvl >= 2000 then
        if replicated.Remotes.CommF_:InvokeServer("HornedMan", "Bet") == nil then return "RGB" end
    end

    -- Elite Hunters for Yama progress
    if World3 and not HasItem("Yama") then
        local eliteQuest = replicated.Remotes.CommF_:InvokeServer("EliteHunter")
        if eliteQuest ~= "I don't have anything for you right now. Come back later." then return "EliteHunters" end
    end

    -- Cake Prince / Dough King
    if World3 and lvl >= 2300 then
        local spawnStatus = tostring(replicated.Remotes.CommF_:InvokeServer("CakePrinceSpawner"))
        if spawnStatus == "nil" then return "CakePrince" end
        if CheckBoss("Dough King") then return "DoughKing" end
    end

    -- Darkbeard / Core in second sea
    if World2 then
        if CheckBoss("Darkbeard") then return "Darkbeard" end
        if CheckBoss("Core") then return "Core" end
    end

    -- Godhuman materials
    if not HasItem("Godhuman") and lvl >= 1100 then
        if CheckItem("Fish Tail") < 20 or CheckItem("Magma Ore") < 20 or CheckItem("Mystic Droplet") < 10 or CheckItem("Dragon Scale") < 10 then
            return "GodhumanMats"
        end
    end

    -- Dragon Talon fire essence
    if not HasItem("Dragon Talon") and lvl >= 1100 and CheckItem("Fire Essence") == 0 then
        return "FireEssence"
    end

    -- Water Key for Sharkman Karate
    if World2 and lvl >= 1100 then
        if replicated.Remotes.CommF_:InvokeServer("BuySharkmanKarate", true) == "I lost my house keys, could you help me find them? Thanks." then
            return "WaterKey"
        end
    end

    -- Auto buy legendary swords when rich
    if World2 and beli >= 2500000 then
        replicated.Remotes.CommF_:InvokeServer("LegendarySwordDealer", "1")
        replicated.Remotes.CommF_:InvokeServer("LegendarySwordDealer", "2")
        replicated.Remotes.CommF_:InvokeServer("LegendarySwordDealer", "3")
    end

    -- Auto buy midnight blade with ectoplasm
    if not HasItem("Midnight Blade") and replicated.Remotes.CommF_:InvokeServer("Ectoplasm", "Check") >= 100 then
        replicated.Remotes.CommF_:InvokeServer("Ectoplasm", "Buy", 3)
    end

    return nil
end

--// ================== ADVANCED QUEST HANDLERS ==================
local function EquipToolSafe(toolName)
    for _, tool in ipairs(Player.Backpack:GetChildren()) do
        if tool:IsA("Tool") and tool.Name == toolName then
            Player.Character.Humanoid:EquipTool(tool)
            return true
        end
    end
    return false
end

-- ---------- SIMPLE BOSS FIGHT ----------
local function FightBoss(bossName, offset)
    local boss = GetAliveBoss(bossName)
    if boss then
        TweenTo(boss.HumanoidRootPart.CFrame * CFrame.new(0, (offset or 40), 0))
    end
end

-- ================== COMPLETE CDK QUEST ==================
local CDKState = {
    GoodTrialStarted = false,
    EvilTrialStarted = false,
    BoatQuest1Done = false,
    BoatQuest2Done = false,
    BoatQuest3Done = false,
    KilledCakeQueen = false,
    HeavenDimensionDone = false,
    HellDimensionDone = false,
    BossExtant = false
}

local function HandleCDKQuestFull()
    local progress = replicated.Remotes.CommF_:InvokeServer("CDKQuest", "Progress")
    if not replicated.Remotes.CommF_:InvokeServer("CDKQuest", "OpenDoor") == "opened" then
        replicated.Remotes.CommF_:InvokeServer("CDKQuest", "OpenDoor", true)
        return
    end
    -- Good trial
    if progress.Good == 0 or progress.Good == -3 then
        CDKState.GoodTrialStarted = false
        if progress.Good == 0 then
            TweenTo(CFrame.new(-12379.14, 601.43, -6543.61))
            task.wait(1)
            replicated.Remotes.CommF_:InvokeServer("CDKQuest", "StartTrial", "Good")
        elseif progress.Good == -3 then
            -- Boat quests
            if not CDKState.BoatQuest1Done then
                TweenTo(CFrame.new(-4600.37, 15.12, -2881.18))
                if (Player.Character.HumanoidRootPart.Position - Vector3.new(-4600.37, 15.12, -2881.18)).Magnitude < 5 then
                    replicated.Remotes.CommF_:InvokeServer("CDKQuest", "BoatQuest", Workspace.NPCs:FindFirstChild("Luxury Boat Dealer"), "Check")
                    replicated.Remotes.CommF_:InvokeServer("CDKQuest", "BoatQuest", Workspace.NPCs:FindFirstChild("Luxury Boat Dealer"))
                    CDKState.BoatQuest1Done = true
                end
            elseif not CDKState.BoatQuest2Done then
                TweenTo(CFrame.new(-2068.63, 3.37, -9887.08))
                if (Player.Character.HumanoidRootPart.Position - Vector3.new(-2068.63, 3.37, -9887.08)).Magnitude < 5 then
                    replicated.Remotes.CommF_:InvokeServer("CDKQuest", "BoatQuest", Workspace.NPCs:FindFirstChild("Luxury Boat Dealer"), "Check")
                    replicated.Remotes.CommF_:InvokeServer("CDKQuest", "BoatQuest", Workspace.NPCs:FindFirstChild("Luxury Boat Dealer"))
                    CDKState.BoatQuest2Done = true
                end
            elseif not CDKState.BoatQuest3Done then
                TweenTo(CFrame.new(-9531.19, 5.92, -8377.75))
                if (Player.Character.HumanoidRootPart.Position - Vector3.new(-9531.19, 5.92, -8377.75)).Magnitude < 5 then
                    replicated.Remotes.CommF_:InvokeServer("CDKQuest", "BoatQuest", Workspace.NPCs:FindFirstChild("Luxury Boat Dealer"), "Check")
                    replicated.Remotes.CommF_:InvokeServer("CDKQuest", "BoatQuest", Workspace.NPCs:FindFirstChild("Luxury Boat Dealer"))
                    CDKState.BoatQuest3Done = true
                end
            end
        end
    -- Evil trial
    elseif progress.Evil == 0 or progress.Evil == -3 then
        CDKState.EvilTrialStarted = false
        if progress.Evil == 0 then
            TweenTo(CFrame.new(-12392.26, 603.32, -6503.28))
            task.wait(1)
            replicated.Remotes.CommF_:InvokeServer("CDKQuest", "StartTrial", "Evil")
        elseif progress.Evil == -3 then
            -- Haze kill mobs (just tween to group)
            TweenTo(CFrame.new(-13347.7, 332.38, -7652.28))
            if (CFrame.new(-13347.7, 332.38, -7652.28).Position - Player.Character.HumanoidRootPart.Position).Magnitude < 100 then
                -- bring mobs
            end
        end
    -- Good trial -4 (kill mobs with haze ESP, simplified)
    elseif progress.Good == 1 or progress.Good == -4 then
        if progress.Good == 1 then
            TweenTo(CFrame.new(-12379.14, 601.43, -6543.61))
            task.wait(1)
            replicated.Remotes.CommF_:InvokeServer("CDKQuest", "StartTrial", "Good")
        elseif progress.Good == -4 then
            -- kill mobs with HazeESP in castle
            FightBoss("Order") -- placeholder; actual boss is whatever is nearby
            TweenTo(CFrame.new(-5539.31, 313.8, -2972.37))
        end
    -- Good trial -5 (kill Cake Queen, then heaven dimension)
    elseif progress.Good == 2 or progress.Good == -5 then
        if progress.Good == 2 then
            TweenTo(CFrame.new(-12379.14, 601.43, -6543.61))
            task.wait(1)
            replicated.Remotes.CommF_:InvokeServer("CDKQuest", "StartTrial", "Good")
        elseif progress.Good == -5 then
            if not CDKState.KilledCakeQueen then
                local queen = GetAliveBoss("Cake Queen")
                if queen then
                    TweenTo(queen.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                    if queen.Humanoid.Health <= 0 then CDKState.KilledCakeQueen = true end
                else
                    TweenTo(CFrame.new(-714.64, 381.57, -11021.06))
                end
            else
                local heaven = Workspace.Map:FindFirstChild("HeavenlyDimension")
                if heaven and not CDKState.HeavenDimensionDone then
                    if (heaven.WorldPivot.Position - Player.Character.HumanoidRootPart.Position).Magnitude > 10 then
                        TweenTo(heaven.WorldPivot)
                    else
                        -- Kill mobs in heaven
                        local mob = GetAliveMonster("Angel") or GetAliveMonster("God's Guard")
                        if mob then
                            TweenTo(mob.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                        else
                            -- Light torches
                            for i = 1, 3 do
                                local torch = heaven:FindFirstChild("Torch"..i)
                                if torch and torch:FindFirstChild("ProximityPrompt") then
                                    TweenTo(torch.CFrame)
                                    fireproximityprompt(torch.ProximityPrompt)
                                    task.wait(1)
                                end
                            end
                            CDKState.HeavenDimensionDone = true
                        end
                    end
                end
            end
        end
    -- Evil trial -4 / -5 (kill mobs or hell dimension)
    elseif progress.Evil == 1 or progress.Evil == -4 then
        if progress.Evil == 1 then
            TweenTo(CFrame.new(-12392.26, 603.32, -6503.28))
            task.wait(1)
            replicated.Remotes.CommF_:InvokeServer("CDKQuest", "StartTrial", "Evil")
        elseif progress.Evil == -4 then
            TweenTo(CFrame.new(-13347.7, 332.38, -7652.28))
        end
    elseif progress.Evil == 2 or progress.Evil == -5 then
        if progress.Evil == 2 then
            TweenTo(CFrame.new(-12392.26, 603.32, -6503.28))
            task.wait(1)
            replicated.Remotes.CommF_:InvokeServer("CDKQuest", "StartTrial", "Evil")
        elseif progress.Evil == -5 then
            local hell = Workspace.Map:FindFirstChild("HellDimension")
            if hell and not CDKState.HellDimensionDone then
                if (hell.WorldPivot.Position - Player.Character.HumanoidRootPart.Position).Magnitude > 10 then
                    TweenTo(hell.WorldPivot)
                else
                    local mob = GetAliveMonster("Demon") or GetAliveMonster("Soul Reaper")
                    if mob then
                        TweenTo(mob.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                    else
                        for i = 1, 3 do
                            local torch = hell:FindFirstChild("Torch"..i)
                            if torch and torch:FindFirstChild("ProximityPrompt") then
                                TweenTo(torch.CFrame)
                                fireproximityprompt(torch.ProximityPrompt)
                                task.wait(1)
                            end
                        end
                        CDKState.HellDimensionDone = true
                    end
                end
            else
                -- get hallow essence / bones to spawn soul reaper
                if GetAliveBoss("Soul Reaper") then
                    TweenTo(GetAliveBoss("Soul Reaper").HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                else
                    -- farm bones to buy hallow essence
                    if CheckItem("Bones") < 500 then
                        local mob = GetAliveMonster("Living Zombie") or GetAliveMonster("Demonic Soul")
                        if mob then TweenTo(mob.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)) else TweenTo(CFrame.new(-9505, 172, 6158)) end
                    elseif not HasItem("Hallow Essence") and replicated.Remotes.CommF_:InvokeServer("Bones", "Check") > 0 then
                        replicated.Remotes.CommF_:InvokeServer("Bones", "Buy", 1, 1)
                    elseif HasItem("Hallow Essence") then
                        EquipToolSafe("Hallow Essence")
                        TweenTo(CFrame.new(-8932.86, 143.26, 6063.31))
                    end
                end
            end
        end
    -- Final boss
    elseif progress.Good == 4 and progress.Evil == 4 then
        local boss = GetAliveBoss("Cursed Skeleton Boss")
        if boss then
            TweenTo(boss.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
        else
            TweenTo(CFrame.new(-12330.2, 603.32, -6549.12))
            task.wait(2)
            replicated.Remotes.CommF_:InvokeServer("CDKQuest", "Progress")
        end
    end
end

-- ================== COMPLETE SOUL GUITAR QUEST ==================
local SoulGuitarState = {
    PuzzleStarted = false,
    SwampDone = false,
    PuzzlesDone = {}
}
local function HandleSoulGuitarQuestFull()
    if CheckItem("Bones") < 500 then
        local mob = GetAliveMonster("Living Zombie") or GetAliveMonster("Demonic Soul") or GetAliveMonster("Reborn Skeleton") or GetAliveMonster("Posessed Mummy")
        if mob then TweenTo(mob.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)) else TweenTo(CFrame.new(-9505, 172, 6158)) end
    elseif CheckItem("Ectoplasm") < 250 then
        local mob = GetAliveMonster("Ship Deckhand") or GetAliveMonster("Ship Engineer") or GetAliveMonster("Ship Steward") or GetAliveMonster("Ship Officer")
        if mob then TweenTo(mob.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0)) else TweenTo(CFrame.new(921, 125, 32937)) end
    else
        if not World3 then
            replicated.Remotes.CommF_:InvokeServer("TravelZou")
            task.wait(30)
            return
        end
        -- Swamp puzzle
        local swamp = Workspace.Map["Haunted Castle"].SwampWater
        if swamp and tostring(swamp.BrickColor) == "Maroon" then
            if not SoulGuitarState.SwampDone then
                TweenTo(CFrame.new(-10147.78, 138.63, 5939.56))
                if (Player.Character.HumanoidRootPart.Position - Vector3.new(-10147.78, 138.63, 5939.56)).Magnitude < 10 then
                    local count = 0
                    for _, mob in ipairs(Workspace.Enemies:GetChildren()) do
                        if mob.Name == "Living Zombie" and mob:FindFirstChild("Humanoid") and mob.Humanoid.Health > 0 and (mob.HumanoidRootPart.Position - Player.Character.HumanoidRootPart.Position).Magnitude < 500 then
                            count = count + 1
                        end
                    end
                    if count >= 6 then SoulGuitarState.SwampDone = true end
                end
            end
        else
            -- Grave puzzle & trophies
            local puzzleProgress = replicated.Remotes.CommF_:InvokeServer("GuitarPuzzleProgress", "Check")
            if puzzleProgress then
                if (CFrame.new(-9680.74, 6.16, 6346.16).Position - Player.Character.HumanoidRootPart.Position).Magnitude > 5 then
                    TweenTo(CFrame.new(-9680.74, 6.16, 6346.16))
                else
                    for i, v in pairs(puzzleProgress) do
                        if v == false then
                            replicated.Remotes.CommF_:InvokeServer("GuitarPuzzleProgress", i)
                        end
                    end
                end
            elseif not puzzleProgress then
                replicated.Remotes.CommF_:InvokeServer("gravestoneEvent", 2, true)
                TweenTo(CFrame.new(-8652.64, 141.11, 6168.81))
            end
        end
        -- Trophies rotation
        if puzzleProgress and puzzleProgress.Trophies == false then
            local function RotateTrophy(seg, trophy)
                local segObj = Workspace.Map["Haunted Castle"].Tablet["Segment"..seg].Line
                local trophyObj = Workspace.Map["Haunted Castle"].Trophies.Quest["Trophy"..trophy].Handle
                if segObj and trophyObj then
                    TweenTo(segObj.Parent.CFrame)
                    while math.abs(segObj.Rotation.Z - trophyObj.Rotation.Z) > 1 do
                        fireclickdetector(segObj.Parent.ClickDetector)
                        task.wait(0.5)
                    end
                end
            end
            RotateTrophy(1, 1)
            RotateTrophy(3, 2)
            RotateTrophy(4, 3)
            RotateTrophy(7, 4)
            RotateTrophy(10, 5)
            -- Reset middle segments
            for _, s in ipairs({2,5,6,8,9}) do
                local seg = Workspace.Map["Haunted Castle"].Tablet["Segment"..s]
                if seg then fireclickdetector(seg.ClickDetector) end
            end
        end
        -- Pipes puzzle (color floor)
        if puzzleProgress and puzzleProgress.Pipes == false then
            local function ClickColorPart(num, clicks)
                local part = Workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model["Part"..num]
                if part then
                    TweenTo(part.CFrame)
                    for i=1, (clicks or 1) do
                        fireclickdetector(part.ClickDetector)
                        task.wait(0.3)
                    end
                end
            end
            ClickColorPart(3, 1)
            ClickColorPart(4, 3)
            ClickColorPart(6, 2)
            ClickColorPart(8, 1)
            ClickColorPart(10, 3)
        end
    end
end

-- ================== COMPLETE RACE V4 (PULL LEVER + TRIAL) ==================
local V4LeverDone = false
local function HandleRaceV4QuestFull()
    local progress = replicated.Remotes.CommF_:InvokeServer("RaceV4Progress", "Check")
    if progress == 1 then
        replicated.Remotes.CommF_:InvokeServer("RaceV4Progress", "Begin")
    elseif progress == 2 then
        replicated.Remotes.CommF_:InvokeServer("RaceV4Progress", "Teleport")
        TweenTo(CFrame.new(28286, 14897, 103))
    elseif progress == 3 then
        replicated.Remotes.CommF_:InvokeServer("RaceV4Progress", "Continue")
    elseif progress == 4 then
        local myst = Workspace.Map:FindFirstChild("MysticIsland")
        if myst and not V4LeverDone then
            -- Look at moon & activate ability
            local moonDir = Lighting:GetMoonDirection()
            Player.Character.HumanoidRootPart.CFrame = CFrame.lookAt(Player.Character.HumanoidRootPart.Position, Player.Character.HumanoidRootPart.Position + moonDir)
            task.wait(1)
            replicated.Remotes.CommE:FireServer("ActivateAbility")
            task.wait(5)
            -- Collect translucent gears
            for _, obj in ipairs(myst:GetDescendants()) do
                if obj:IsA("MeshPart") and obj.Transparency < 0.1 then
                    TweenTo(obj.CFrame)
                    task.wait(0.5)
                    VirtualInputManager:SendKeyEvent(true, "Space", false, game)
                    task.wait(0.3)
                    VirtualInputManager:SendKeyEvent(false, "Space", false, game)
                end
            end
            V4LeverDone = true
        elseif V4LeverDone then
            -- Pull lever
            for _, obj in ipairs(myst:GetDescendants()) do
                if obj:IsA("ProximityPrompt") and obj.Parent.Name == "Lever" then
                    TweenTo(obj.Parent.CFrame)
                    fireproximityprompt(obj)
                end
            end
        end
    end
end

-- ================== COMPLETE EVO RACE V2 ==================
local EvoRaceV2State = {KilledOrbitus = false, KilledJeremy = false, KilledDiamond = false}
local function HandleEvoRaceV2Full()
    local race = Player.Data.Race.Value
    if race == "Human" then
        local function KillAndCheck(name, flag)
            if not EvoRaceV2State[flag] then
                local boss = GetAliveBoss(name)
                if boss then
                    TweenTo(boss.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                    if boss.Humanoid.Health <= 0 then EvoRaceV2State[flag] = true end
                else
                    HopLowServer(5)
                    task.wait(1)
                    TeleportService:Teleport(game.PlaceId, Player)
                end
            end
        end
        KillAndCheck("Orbitus", "KilledOrbitus")
        KillAndCheck("Jeremy", "KilledJeremy")
        KillAndCheck("Diamond", "KilledDiamond")
        if EvoRaceV2State.KilledOrbitus and EvoRaceV2State.KilledJeremy and EvoRaceV2State.KilledDiamond then
            replicated.Remotes.CommF_:InvokeServer("Wenlocktoad", "3")
        end
    elseif race == "Fishman" then
        -- Kill a sea beast (already handled by SeaEvents if enabled)
        for _, sb in ipairs(Workspace.SeaBeasts:GetChildren()) do
            if sb:FindFirstChild("Health") and sb.Health.Value > 0 then
                TweenTo(sb.HumanoidRootPart.CFrame * CFrame.new(0, 200, 0))
                break
            end
        end
    end
end

-- ================== GODHUMAN MATERIAL FARMING (FULL) ==================
local function HandleGodhumanMatsFull()
    local fishTail = CheckItem("Fish Tail")
    local magmaOre = CheckItem("Magma Ore")
    local mystic = CheckItem("Mystic Droplet")
    local scale = CheckItem("Dragon Scale")
    local beli = Player.Data.Beli.Value
    local frags = Player.Data.Fragments.Value

    if fishTail < 20 then
        if not World1 then replicated.Remotes.CommF_:InvokeServer("TravelMain"); task.wait(30) end
        local mob = GetAliveMonster("Fishman Warrior") or GetAliveMonster("Fishman Commando")
        if mob then TweenTo(mob.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0)) else TweenTo(CFrame.new(60946, 65, 1525)) end
    elseif magmaOre < 20 then
        if not World2 then replicated.Remotes.CommF_:InvokeServer("TravelDressrosa"); task.wait(30) end
        local mob = GetAliveMonster("Magma Ninja") or GetAliveMonster("Lava Pirate")
        if mob then TweenTo(mob.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0)) else TweenTo(CFrame.new(-5466, 78, -5837)) end
    elseif mystic < 10 then
        if not World2 then replicated.Remotes.CommF_:InvokeServer("TravelDressrosa"); task.wait(30) end
        local mob = GetAliveMonster("Sea Soldier") or GetAliveMonster("Water Fighter")
        if mob then TweenTo(mob.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0)) else TweenTo(CFrame.new(-3116, 64, -9808)) end
    elseif scale < 10 then
        if not World3 then replicated.Remotes.CommF_:InvokeServer("TravelZou"); task.wait(30) end
        local mob = GetAliveMonster("Dragon Crew Warrior") or GetAliveMonster("Dragon Crew Archer")
        if mob then TweenTo(mob.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0)) else TweenTo(CFrame.new(6242, 52, -1244)) end
    else
        if beli >= 5000000 and frags >= 5000 then
            replicated.Remotes.CommF_:InvokeServer("BuyGodhuman", true)
            if HasItem("Godhuman") then return end
        end
    end
end

-- ================== FIRE ESSENCE (DRAGON TALON) ==================
local function HandleFireEssenceFull()
    if CheckItem("Bones") < 500 then
        local mob = GetAliveMonster("Living Zombie") or GetAliveMonster("Demonic Soul") or GetAliveMonster("Reborn Skeleton") or GetAliveMonster("Posessed Mummy")
        if mob then TweenTo(mob.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)) else TweenTo(CFrame.new(-9505, 172, 6158)) end
    else
        if replicated.Remotes.CommF_:InvokeServer("Bones", "Check") > 0 then
            replicated.Remotes.CommF_:InvokeServer("Bones", "Buy", 1, 1)
        end
        if HasItem("Fire Essence") then
            EquipToolSafe("Fire Essence")
            task.wait(0.5)
            replicated.Remotes.CommF_:InvokeServer("BuyDragonTalon", true)
            replicated.Remotes.CommF_:InvokeServer("BuyDragonTalon")
        end
    end
end

-- ================== WATER KEY (SHARKMAN KARATE) ==================
local function HandleWaterKey()
    if HasItem("Water Key") then
        EquipToolSafe("Water Key")
        replicated.Remotes.CommF_:InvokeServer("BuySharkmanKarate", true)
    else
        local boss = GetAliveBoss("Tide Keeper")
        if boss then
            TweenTo(boss.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
        else
            HopLowServer(5)
        end
    end
end

-- ================== SMALL BOSS WEAPON QUEST HANDLERS ==================
local function HandleSimpleBossQuest(bossName, worldCheck)
    if worldCheck and not ((World1 and worldCheck == 1) or (World2 and worldCheck == 2) or (World3 and worldCheck == 3)) then
        if worldCheck == 1 then replicated.Remotes.CommF_:InvokeServer("TravelMain")
        elseif worldCheck == 2 then replicated.Remotes.CommF_:InvokeServer("TravelDressrosa")
        elseif worldCheck == 3 then replicated.Remotes.CommF_:InvokeServer("TravelZou") end
        task.wait(30)
        return
    end
    FightBoss(bossName)
end

-- ================== MAIN ADVANCED QUEST LOOP ==================
task.spawn(function()
    while task.wait() do
        if not AutoFarm then continue end
        pcall(function()
            local quest = DeterminePriorityQuestAdvanced()
            if quest then
                UpdateStatus("Advanced Quest: " .. quest)
                -- Buy items directly
                if string.find(quest, "BuyItem:") then
                    local itemName = quest:gsub("BuyItem:", "")
                    replicated.Remotes.CommF_:InvokeServer("BuyItem", itemName)
                    task.wait(1)
                elseif quest == "Saber" then
                    -- re-use Part 2 handler but call it here (inline)
                    local prog = replicated.Remotes.CommF_:InvokeServer("ProQuestProgress")
                    if not prog.UsedTorch then
                        TweenTo(CFrame.new(-1612, 11, 161))
                        task.wait(1)
                        replicated.Remotes.CommF_:InvokeServer("ProQuestProgress", "GetTorch")
                        EquipTool("Torch")
                        replicated.Remotes.CommF_:InvokeServer("ProQuestProgress", "DestroyTorch")
                    elseif not prog.UsedCup then
                        replicated.Remotes.CommF_:InvokeServer("ProQuestProgress", "GetCup")
                        EquipTool("Cup")
                        replicated.Remotes.CommF_:InvokeServer("ProQuestProgress", "FillCup", Player.Character.Cup)
                        replicated.Remotes.CommF_:InvokeServer("ProQuestProgress", "SickMan")
                    elseif not prog.KilledMob then
                        local mob = GetAliveBoss("Mob Leader")
                        if mob then TweenTo(mob.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0)) else TweenTo(CFrame.new(-2848, 7, 5342)) end
                    elseif not prog.UsedRelic then
                        replicated.Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon")
                        EquipTool("Relic")
                        TweenTo(CFrame.new(-1406, 29, 4))
                    else
                        local boss = GetAliveBoss("Saber Expert")
                        if boss then TweenTo(boss.HumanoidRootPart.CFrame * CFrame.new(0, 25, 0)) else TweenTo(CFrame.new(-1458, 29, -50)) end
                    end
                elseif quest == "MagmaBlaster" then HandleSimpleBossQuest("Magma Admiral", 1)
                elseif quest == "Bazooka" then HandleSimpleBossQuest("Wysper", 1)
                elseif quest == "SharkSaw" then HandleSimpleBossQuest("The Saw", 1)
                elseif quest == "WardenSword" then HandleSimpleBossQuest("Chief Warden", 1)
                elseif quest == "Pole" then HandleSimpleBossQuest("Thunder God", 1)
                elseif quest == "Rengoku" then HandleSimpleBossQuest("Awakened Ice Admiral", 2)
                elseif quest == "GravityBlade" then HandleSimpleBossQuest("Orbitus", 2)
                elseif quest == "Longsword" then HandleSimpleBossQuest("Diamond", 2)
                elseif quest == "Flail" then HandleSimpleBossQuest("Smoke Admiral", 2)
                elseif quest == "Yama" then
                    local sealed = Workspace.Map.Waterfall.SealedKatana.Hitbox
                    if (sealed.Position - Player.Character.HumanoidRootPart.Position).Magnitude > 300 then
                        TweenTo(sealed.CFrame)
                    else
                        local ghost = GetAliveBoss("Ghost")
                        if ghost then TweenTo(ghost.HumanoidRootPart.CFrame * CFrame.new(0, 15, 0)) else fireclickdetector(sealed.ClickDetector) end
                    end
                elseif quest == "Tushita" then
                    local boss = GetAliveBoss("Longma")
                    if boss then TweenTo(boss.HumanoidRootPart.CFrame * CFrame.new(0, 40, 0)) else HopLowServer(5) end
                elseif quest == "SoulGuitar" then HandleSoulGuitarQuestFull()
                elseif quest == "CDK" then HandleCDKQuestFull()
                elseif quest == "VenomBow" then HandleSimpleBossQuest("Hydra Leader", 3)
                elseif quest == "TwinHooks" then HandleSimpleBossQuest("Captain Elephant", 3)
                elseif quest == "SerpentBow" then HandleSimpleBossQuest("Hydra Leader", 3)
                elseif quest == "EvoRaceV1" then
                    if not HasItem("Flower 1") then TweenTo(Workspace.Flower1.CFrame)
                    elseif not HasItem("Flower 2") then TweenTo(Workspace.Flower2.CFrame)
                    elseif not HasItem("Flower 3") then
                        local mob = GetAliveMonster("Swan Pirate")
                        if mob then TweenTo(mob.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)) else TweenTo(CFrame.new(976, 111, 1229)) end
                    else replicated.Remotes.CommF_:InvokeServer("Alchemist", "3") end
                elseif quest == "EvoRaceV2" then HandleEvoRaceV2Full()
                elseif quest == "DonSwan" then
                    FightBoss("Don Swan", 40)
                elseif quest == "Bartilo" then
                    local progress = replicated.Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo")
                    if progress == 0 then TweenTo(CFrame.new(-1836, 11, 1714))
                    elseif progress == 1 then
                        local mob = GetAliveMonster("Swan Pirate")
                        if mob then TweenTo(mob.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)) else TweenTo(CFrame.new(976, 111, 1229)) end
                    elseif progress == 2 then
                        local boss = GetAliveBoss("Jeremy")
                        if boss then TweenTo(boss.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)) end
                    end
                elseif quest == "PullLever" or quest == "RaceV4" then HandleRaceV4QuestFull()
                elseif quest == "RGB" then
                    for _, bossName in ipairs({"Stone", "Hydra Leader", "Kilo Admiral", "Captain Elephant", "Beautiful Pirate"}) do
                        local boss = GetAliveBoss(bossName)
                        if boss then TweenTo(boss.HumanoidRootPart.CFrame * CFrame.new(0, 40, 0)); break end
                    end
                elseif quest == "EliteHunters" then
                    replicated.Remotes.CommF_:InvokeServer("EliteHunter")
                    for _, bossName in ipairs({"Diablo", "Deandre", "Urban"}) do
                        local boss = GetAliveBoss(bossName)
                        if boss then TweenTo(boss.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)); break end
                    end
                elseif quest == "CakePrince" then
                    local prince = GetAliveBoss("Cake Prince")
                    if prince then TweenTo(prince.HumanoidRootPart.CFrame * CFrame.new(0, 42, 10)) else replicated.Remotes.CommF_:InvokeServer("CakePrinceSpawner", true) end
                elseif quest == "DoughKing" then
                    FightBoss("Dough King", 30)
                elseif quest == "Darkbeard" then
                    FightBoss("Darkbeard", -30)
                elseif quest == "Core" then
                    FightBoss("Core", 40)
                elseif quest == "GodhumanMats" then HandleGodhumanMatsFull()
                elseif quest == "FireEssence" then HandleFireEssenceFull()
                elseif quest == "WaterKey" then HandleWaterKey()
                end
            else
                UpdateStatus("Idle (Advanced)")
            end
        end)
    end
end)

--// ================== AUTO MATERIAL FARM (CONFIG-BASED) ==================
task.spawn(function()
    while task.wait(1) do
        local cfg = getgenv().Configs.MaterialFarm
        if not cfg.Enable or not cfg.SelectedMaterial then continue end
        pcall(function()
            local mat = cfg.SelectedMaterial
            local mobs, pos = nil, nil
            -- Define material mobs per world
            if World1 then
                if mat == "Angel Wings" then mobs = {"Shanda", "Royal Squad", "Royal Soldier", "Wysper", "Thunder God"}; pos = CFrame.new(-4698, 845, -1912)
                elseif mat == "Leather + Scrap Metal" then mobs = {"Brute", "Pirate"}; pos = CFrame.new(-1145, 15, 4350)
                elseif mat == "Magma Ore" then mobs = {"Military Soldier", "Military Spy", "Magma Admiral"}; pos = CFrame.new(-5815, 84, 8820)
                elseif mat == "Fish Tail" then mobs = {"Fishman Warrior", "Fishman Commando", "Fishman Lord"}; pos = CFrame.new(61123, 19, 1569)
                end
            elseif World2 then
                if mat == "Leather + Scrap Metal" then mobs = {"Marine Captain"}; pos = CFrame.new(-2010, 73, -3326)
                elseif mat == "Magma Ore" then mobs = {"Magma Ninja", "Lava Pirate"}; pos = CFrame.new(-5428, 78, -5959)
                elseif mat == "Ectoplasm" then mobs = {"Ship Deckhand", "Ship Engineer", "Ship Steward", "Ship Officer"}; pos = CFrame.new(911, 125, 33159)
                elseif mat == "Mystic Droplet" then mobs = {"Water Fighter"}; pos = CFrame.new(-3385, 239, -10542)
                elseif mat == "Radioactive Material" then mobs = {"Factory Staff"}; pos = CFrame.new(295, 73, -56)
                elseif mat == "Vampire Fang" then mobs = {"Vampire"}; pos = CFrame.new(-6033, 7, -1317)
                end
            elseif World3 then
                if mat == "Scrap Metal" then mobs = {"Jungle Pirate", "Forest Pirate"}; pos = CFrame.new(-11975, 331, -10620)
                elseif mat == "Fish Tail" then mobs = {"Fishman Raider", "Fishman Captain"}; pos = CFrame.new(-10993, 332, -8940)
                elseif mat == "Conjured Cocoa" then mobs = {"Chocolate Bar Battler", "Cocoa Warrior"}; pos = CFrame.new(620, 78, -12581)
                elseif mat == "Dragon Scale" then mobs = {"Dragon Crew Archer", "Dragon Crew Warrior"}; pos = CFrame.new(6594, 383, 139)
                elseif mat == "Gunpowder" then mobs = {"Pistol Billionaire"}; pos = CFrame.new(-84, 85, 6132)
                elseif mat == "Mini Tusk" then mobs = {"Mythological Pirate"}; pos = CFrame.new(-13545, 470, -6917)
                elseif mat == "Demonic Wisp" then mobs = {"Demonic Soul"}; pos = CFrame.new(-9495, 453, 5977)
                end
            end
            if mobs and pos then
                local target = nil
                for _, m in ipairs(mobs) do target = GetAliveMonster(m); if target then break end end
                if target then TweenTo(target.HumanoidRootPart.CFrame * CFrame.new(0, 15, 0)) else TweenTo(pos) end
            end
        end)
    end
end)

--// ================== AUTO BERRY & CHEST COLLECT ==================
task.spawn(function()
    while task.wait(2) do
        pcall(function()
            -- Chest
            local chest = GetChest()
            if chest then
                TweenTo(CFrame.new(chest.Position))
                ChestCount = ChestCount + 1
                ChestRow.Text = "📦 Chests: " .. ChestCount
            end
            -- Berry (simplified)
            if getgenv().Configs.ESP.Berries then
                for _, bush in ipairs(Workspace:GetDescendants()) do
                    if bush:IsA("Model") and bush:GetAttribute("BerryBush") then
                        local part = bush:FindFirstChildWhichIsA("BasePart") or bush.PrimaryPart
                        if part and (part.Position - Player.Character.HumanoidRootPart.Position).Magnitude < 50 then
                            TweenTo(part.CFrame)
                            for _, prompt in ipairs(bush:GetDescendants()) do
                                if prompt:IsA("ProximityPrompt") then
                                    fireproximityprompt(prompt)
                                end
                            end
                        end
                    end
                end
            end
        end)
    end
end)

--// ================== FINAL CLEANUP & NOTIFICATIONS ==================
UpdateStatus("Part 3 - Ready!")
--[[
   ╔══════════════════════════════════════════════════════════════╗
   ║     ASTRAL HUB - ULTIMATE MEGA MERGE (PART 4 OF 5)          ║
   ║   Mastery Farming, Fruit Automation, Enhanced Bosses,        ║
   ║   Observation V2, Inf Abilities, Sea Events, Dojo,           ║
   ║   Prehistoric, Kitsune, Crafting, and All QoL Systems        ║
   ╚══════════════════════════════════════════════════════════════╝
--]]

--// ================== AUTO MASTERY FARM (FRUITS, SWORD, GUN) ==================
task.spawn(function()
    while task.wait(0.5) do
        if CurrentQuest then continue end
        pcall(function()
            local tool = Player.Character and Player.Character:FindFirstChildOfClass("Tool")
            if not tool then return end
            local enemies = Workspace.Enemies:GetChildren()
            if #enemies == 0 then return end
            -- Find nearest enemy
            local nearest = nil
            local minDist = math.huge
            for _, enemy in ipairs(enemies) do
                if enemy:FindFirstChild("Humanoid") and enemy.Humanoid.Health > 0 then
                    local hrp = enemy:FindFirstChild("HumanoidRootPart")
                    if hrp then
                        local d = (hrp.Position - Player.Character.HumanoidRootPart.Position).Magnitude
                        if d < minDist and d < 100 then
                            minDist = d
                            nearest = enemy
                        end
                    end
                end
            end
            if nearest then
                local hrp = nearest.HumanoidRootPart
                -- For fruit mastery: use Z, X, C; for sword: Z, X; for gun: Z, X (shoot)
                if tool.ToolTip == "Blox Fruit" then
                    if tool:FindFirstChild("LeftClickRemote") then
                        -- M1 for mastery
                        local dir = (hrp.Position - Player.Character.HumanoidRootPart.Position).Unit
                        tool.LeftClickRemote:FireServer(dir, 1)
                    else
                        VirtualInputManager:SendKeyEvent(true, "Z", false, game)
                        task.wait(0.1)
                        VirtualInputManager:SendKeyEvent(false, "Z", false, game)
                        VirtualInputManager:SendKeyEvent(true, "X", false, game)
                        task.wait(0.1)
                        VirtualInputManager:SendKeyEvent(false, "X", false, game)
                        VirtualInputManager:SendKeyEvent(true, "C", false, game)
                        task.wait(0.1)
                        VirtualInputManager:SendKeyEvent(false, "C", false, game)
                    end
                elseif tool.ToolTip == "Sword" then
                    VirtualInputManager:SendKeyEvent(true, "Z", false, game)
                    task.wait(0.1)
                    VirtualInputManager:SendKeyEvent(false, "Z", false, game)
                    VirtualInputManager:SendKeyEvent(true, "X", false, game)
                    task.wait(0.1)
                    VirtualInputManager:SendKeyEvent(false, "X", false, game)
                elseif tool.ToolTip == "Gun" then
                    VirtualInputManager:SendKeyEvent(true, "Z", false, game)
                    task.wait(0.1)
                    VirtualInputManager:SendKeyEvent(false, "Z", false, game)
                    VirtualInputManager:SendKeyEvent(true, "X", false, game)
                    task.wait(0.1)
                    VirtualInputManager:SendKeyEvent(false, "X", false, game)
                end
            end
        end)
    end
end)

--// ================== AUTO COLLECT FRUITS ==================
task.spawn(function()
    while task.wait(2) do
        pcall(function()
            for _, obj in ipairs(Workspace:GetChildren()) do
                if obj:IsA("Tool") and string.find(obj.Name, "Fruit") and obj:FindFirstChild("Handle") then
                    local dist = (obj.Handle.Position - Player.Character.HumanoidRootPart.Position).Magnitude
                    if dist < 200 then
                        TweenTo(obj.Handle.CFrame)
                        task.wait(0.5)
                    end
                end
            end
        end)
    end
end)

task.spawn(function()
    while task.wait(3) do
        pcall(function()
            for _, tool in ipairs(Player.Backpack:GetChildren()) do
                if tool:IsA("Tool") and tool:GetAttribute("OriginalName") and string.find(tool.Name, "Fruit") then
                    local original = tool:GetAttribute("OriginalName")
                    if original and not string.find(original, "Bomb") and not string.find(original, "Spike") and not string.find(original, "Chop") and not string.find(original, "Spring") and not string.find(original, "Kilo") then
                        replicated.Remotes.CommF_:InvokeServer("StoreFruit", original, tool)
                    end
                end
            end
        end)
    end
end)

--// ================== AUTO RANDOM FRUIT (Cousin) ==================
task.spawn(function()
    while task.wait(10) do
        pcall(function()
            replicated.Remotes.CommF_:InvokeServer("Cousin", "Buy")
        end)
    end
end)

--// ================== AUTO ADVANCED FRUIT DEALER TELEPORT ==================
task.spawn(function()
    while task.wait(5) do
        if not getgenv().Configs.Mirage.AdvancedDealer then continue end
        pcall(function()
            for _, npc in ipairs(Workspace.NPCs:GetChildren()) do
                if npc.Name == "Advanced Fruit Dealer" then
                    TweenTo(npc.HumanoidRootPart.CFrame)
                    break
                end
            end
        end)
    end
end)

--// ================== AUTO OBSERVATION V2 (DODGE TRAINING) ==================
task.spawn(function()
    while task.wait(0.5) do
        pcall(function()
            local ken = Player.Character and Player.Character:FindFirstChild("Ken")
            if ken and ken:FindFirstChild("Level") and ken.Level.Value < 600 then
                for _, enemy in ipairs(Workspace.Enemies:GetChildren()) do
                    if enemy:FindFirstChild("Humanoid") and enemy.Humanoid.Health > 0 then
                        local hrp = enemy:FindFirstChild("HumanoidRootPart")
                        if hrp and (hrp.Position - Player.Character.HumanoidRootPart.Position).Magnitude < 15 then
                            TweenTo(Player.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -10))
                            break
                        end
                    end
                end
            end
        end)
    end
end)

--// ================== INFINITE ENERGY / SORU / OBSERVATION RANGE ==================
task.spawn(function()
    while task.wait(0.2) do
        pcall(function()
            if Player.Character and Player.Character:FindFirstChild("Energy") then
                Player.Character.Energy.Value = Player.Character.Energy.MaxValue
            end
        end)
    end
end)

task.spawn(function()
    while task.wait(0.1) do
        pcall(function()
            if Player.Character and Player.Character:FindFirstChild("Soru") then
                local soruScript = Player.Character.Soru
                -- reset LastUse
            end
        end)
    end
end)

task.spawn(function()
    pcall(function()
        local vision = Player:FindFirstChild("VisionRadius")
        if vision then
            vision.Value = math.huge
        end
        Player:GetPropertyChangedSignal("VisionRadius"):Connect(function()
            if Player.VisionRadius then
                Player.VisionRadius.Value = math.huge
            end
        end)
    end)
end)

--// ================== EXTENDED BOSS FARMING (ALL WORLDS) ==================
local extendedBosses = {
    -- World 1
    {Name = "The Gorilla King", Config = false, World = 1},
    {Name = "Bobby", Config = false, World = 1},
    {Name = "Yeti", Config = false, World = 1},
    {Name = "Mob Leader", Config = false, World = 1},
    {Name = "Vice Admiral", Config = false, World = 1},
    {Name = "Warden", Config = false, World = 1},
    {Name = "Chief Warden", Config = false, World = 1},
    {Name = "Swan", Config = false, World = 1},
    {Name = "Magma Admiral", Config = false, World = 1},
    {Name = "Fishman Lord", Config = false, World = 1},
    {Name = "Wysper", Config = false, World = 1},
    {Name = "Thunder God", Config = false, World = 1},
    {Name = "Cyborg", Config = false, World = 1},
    -- World 2
    {Name = "Diamond", Config = false, World = 2},
    {Name = "Jeremy", Config = false, World = 2},
    {Name = "Fajita", Config = false, World = 2},
    {Name = "Don Swan", Config = false, World = 2},
    {Name = "Smoke Admiral", Config = false, World = 2},
    {Name = "Awakened Ice Admiral", Config = false, World = 2},
    {Name = "Tide Keeper", Config = false, World = 2},
    {Name = "Darkbeard", Config = false, World = 2},
    {Name = "Cursed Captain", Config = false, World = 2},
    {Name = "Order", Config = false, World = 2},
    -- World 3
    {Name = "Stone", Config = false, World = 3},
    {Name = "Hydra Leader", Config = false, World = 3},
    {Name = "Kilo Admiral", Config = false, World = 3},
    {Name = "Captain Elephant", Config = false, World = 3},
    {Name = "Beautiful Pirate", Config = false, World = 3},
    {Name = "Cake Queen", Config = false, World = 3},
    {Name = "Longma", Config = false, World = 3},
    {Name = "Soul Reaper", Config = false, World = 3},
}
for _, boss in ipairs(extendedBosses) do
    local bossConfigKey = "Auto" .. boss.Name:gsub(" ", "") .. "Boss"
    getgenv().Configs.BossFarming[bossConfigKey] = false
    task.spawn(function()
        while task.wait(1) do
            if not getgenv().Configs.BossFarming[bossConfigKey] then continue end
            pcall(function()
                if boss.World ~= currentWorld then return end
                local b = GetAliveBoss(boss.Name)
                if b then
                    TweenTo(b.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                else
                    TweenTo(CFrame.new(0, 0, 0)) -- will just stay still
                end
            end)
        end
    end)
end

--// ================== AUTO BONE / ECTOPLASM FARM FOR REWARDS ==================
task.spawn(function()
    while task.wait(5) do
        pcall(function()
            if CheckItem("Bones") > 500 then
                while replicated.Remotes.CommF_:InvokeServer("Bones", "Check") > 0 do
                    replicated.Remotes.CommF_:InvokeServer("Bones", "Buy", 1, 1)
                    task.wait(0.5)
                end
            end
            if not HasItem("Midnight Blade") and replicated.Remotes.CommF_:InvokeServer("Ectoplasm", "Check") >= 100 then
                replicated.Remotes.CommF_:InvokeServer("Ectoplasm", "Buy", 3)
            end
        end)
    end
end)

--// ================== AUTO EQUIP BEST WEAPON ==================
local function GetBestWeapon(weaponType)
    local best = nil
    local bestDmg = 0
    local inventory = replicated.Remotes.CommF_:InvokeServer("getInventory")
    for _, item in ipairs(inventory) do
        if item.Type == weaponType then
            local dmg = 0
            if item.Name == "Godhuman" then dmg = 999
            elseif item.Name == "Dragon Talon" then dmg = 900
            elseif item.Name == "Electric Claw" then dmg = 850
            elseif item.Name == "Sharkman Karate" then dmg = 800
            elseif item.Name == "Superhuman" then dmg = 700
            elseif item.Name == "Cursed Dual Katana" then dmg = 999
            elseif item.Name == "True Triple Katana" then dmg = 800
            elseif item.Name == "Tushita" then dmg = 800
            elseif item.Name == "Yama" then dmg = 800
            elseif item.Name == "Dark Blade" then dmg = 900
            elseif item.Name == "Soul Guitar" then dmg = 800
            elseif item.Name == "Kabucha" then dmg = 700
            end
            if dmg > bestDmg then best = item.Name; bestDmg = dmg end
        end
    end
    return best
end

task.spawn(function()
    while task.wait(2) do
        pcall(function()
            local tool = Player.Character and Player.Character:FindFirstChildOfClass("Tool")
            if tool then
                local bestMelee = GetBestWeapon("Melee")
                if bestMelee and HasItem(bestMelee) and tool.Name ~= bestMelee and tool.ToolTip == "Melee" then
                    EquipTool(bestMelee)
                end
                local bestSword = GetBestWeapon("Sword")
                if bestSword and HasItem(bestSword) and tool.Name ~= bestSword and tool.ToolTip == "Sword" then
                    EquipTool(bestSword)
                end
            end
        end)
    end
end)

--// ================== AUTO LEGENDARY SWORD DEALER / TRUE TRIPLE KATANA ==================
task.spawn(function()
    while task.wait(60) do
        pcall(function()
            if World2 and Player.Data.Beli.Value >= 2500000 then
                replicated.Remotes.CommF_:InvokeServer("LegendarySwordDealer", "1")
                replicated.Remotes.CommF_:InvokeServer("LegendarySwordDealer", "2")
                replicated.Remotes.CommF_:InvokeServer("LegendarySwordDealer", "3")
            end
        end)
    end
end)

task.spawn(function()
    while task.wait(10) do
        pcall(function()
            if HasItem("Shisui") and HasItem("Wando") and HasItem("Saddi") and not HasItem("True Triple Katana") then
                replicated.Remotes.CommF_:InvokeServer("MysteriousMan", "2")
            end
        end)
    end
end)

--// ================== AUTO CRAFT ITEMS (ENHANCED) ==================
local craftItems = {
    "Volcanic Magnet",
    "Dragonheart",
    "Dragonstorm",
    "DinoHood",
    "SharkTooth",
    "TerrorJaw",
    "SharkAnchor",
    "LeviathanCrown",
    "LeviathanShield",
    "LeviathanBoat",
    "LegendaryScroll",
    "MythicalScroll",
}
task.spawn(function()
    while task.wait(30) do
        pcall(function()
            for _, item in ipairs(craftItems) do
                if not HasItem(item) then
                    replicated.Remotes.CommF_:InvokeServer("CraftItem", "Craft", item)
                end
            end
        end)
    end
end)

--// ================== AUTO BUY ALL HAKI / SKILLS (REPEAT) ==================
task.spawn(function()
    while task.wait(10) do
        pcall(function()
            local lvl = Player.Data.Level.Value
            if lvl >= 10 then replicated.Remotes.CommF_:InvokeServer("BuyHaki", "Geppo") end
            if lvl >= 60 then
                replicated.Remotes.CommF_:InvokeServer("BuyHaki", "Soru")
                replicated.Remotes.CommF_:InvokeServer("BuyHaki", "Buso")
            end
            if lvl >= 300 then replicated.Remotes.CommF_:InvokeServer("KenTalk", "Buy") end
        end)
    end
end)

--// ================== AUTO BUSO COLORS (RAINBOW) ==================
task.spawn(function()
    while task.wait(5) do
        pcall(function()
            if getgenv().Configs.Quest["RGB Haki"] and Player.Data.Level.Value >= 2000 then
                if replicated.Remotes.CommF_:InvokeServer("HornedMan", "Bet") ~= 1 then
                    replicated.Remotes.CommF_:InvokeServer("HornedMan", "Bet")
                end
            end
        end)
    end
end)

--// ================== ENHANCED SEA EVENTS (SAIL TO HYDRA, AUTO BOAT BUY) ==================
task.spawn(function()
    while task.wait(5) do
        if not getgenv().Configs.SeaEvents.Enable then continue end
        pcall(function()
            local cfg = getgenv().Configs.SeaEvents
            if cfg.AutoSail then
                local boat = nil
                for _, b in ipairs(Workspace.Boats:GetChildren()) do
                    if b.Owner.Value == Player.Name then boat = b; break end
                end
                if not boat then
                    TweenTo(CFrame.new(-16927, 9, 434))
                    if (Player.Character.HumanoidRootPart.Position - Vector3.new(-16927, 9, 434)).Magnitude < 10 then
                        replicated.Remotes.CommF_:InvokeServer("BuyBoat", cfg.SelectedBoat)
                    end
                elseif cfg.KitsuneIsland then
                    -- Sail to Hydra island to find Kitsune
                    if not Workspace._WorldOrigin.Locations:FindFirstChild("Kitsune Island") then
                        if Player.Character.Humanoid.Sit == false then
                            TweenTo(boat.VehicleSeat.CFrame * CFrame.new(0, 2, 0))
                            task.wait(1)
                            Player.Character.Humanoid.Sit = true
                        else
                            TweenTo(CFrame.new(-10000000, 31, 37016))
                        end
                    else
                        TweenTo(Workspace._WorldOrigin.Locations["Kitsune Island"].CFrame * CFrame.new(0, 500, 0))
                    end
                end
            end
        end)
    end
end)

--// ================== KITSUNE ISLAND FEATURES ==================
task.spawn(function()
    while task.wait(1) do
        if not getgenv().Configs.SeaEvents.KitsuneIsland then continue end
        pcall(function()
            local island = Workspace._WorldOrigin.Locations:FindFirstChild("Kitsune Island", true)
            if island then
                if getgenv().Configs.SeaEvents.ShrineActive then
                    local shrine = Workspace.Map.KitsuneIsland and Workspace.Map.KitsuneIsland:FindFirstChild("ShrineActive")
                    if shrine then
                        for _, part in ipairs(shrine:GetDescendants()) do
                            if part.Name == "NeonShrinePart" and part:IsA("BasePart") then
                                TweenTo(part.CFrame * CFrame.new(0, 2, 0))
                                replicated.Modules.Net:FindFirstChild("RE/TouchKitsuneStatue"):FireServer()
                                break
                            end
                        end
                    end
                end
                if getgenv().Configs.SeaEvents.CollectAzureEmber then
                    local ember = Workspace:FindFirstChild("AttachedAzureEmber") or Workspace:FindFirstChild("EmberTemplate")
                    if ember then
                        TweenTo(ember.Part.CFrame)
                    end
                end
                if getgenv().Configs.SeaEvents.TradeAzureEmber then
                    replicated.Modules.Net["RF/KitsuneStatuePray"]:InvokeServer()
                end
            end
        end)
    end
end)

--// ================== AUTO LOOK AT MOON FOR V4 ==================
task.spawn(function()
    while task.wait(1) do
        if not getgenv().Configs.Quest["Pull Lerver"] then continue end
        pcall(function()
            local moonDir = Lighting:GetMoonDirection()
            Player.Character.HumanoidRootPart.CFrame = CFrame.lookAt(
                Player.Character.HumanoidRootPart.Position,
                Player.Character.HumanoidRootPart.Position + moonDir
            )
        end)
    end
end)

--// ================== SANGUINE ART MATERIALS FARM ==================
task.spawn(function()
    while task.wait(2) do
        if not (getgenv().Configs.Melee["Sanguine Art"] and not HasItem("Sanguine Art")) then continue end
        pcall(function()
            if not GetM("Leviathan Heart") >= 1 then
                if CheckItem("Vampire Fang") < 20 then
                    local mob = GetAliveMonster("Vampire")
                    if mob then TweenTo(mob.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0)) else TweenTo(CFrame.new(-6033, 7, -1317)) end
                elseif CheckItem("Demonic Wisp") < 20 then
                    local mob = GetAliveMonster("Demonic Soul")
                    if mob then TweenTo(mob.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)) else TweenTo(CFrame.new(-9495, 453, 5977)) end
                elseif CheckItem("Dark Fragment") < 1 then
                    local boss = GetAliveBoss("Darkbeard")
                    if boss then TweenTo(boss.HumanoidRootPart.CFrame * CFrame.new(0, -30, 0)) end
                end
            end
        end)
    end
end)

--// ================== DRAGON DOJO FULL BELT SYSTEM (Enhanced) ==================
task.spawn(function()
    while task.wait(1) do
        if not getgenv().Configs.Dragon.DojoBelt then continue end
        pcall(function()
            local net = replicated.Modules.Net:FindFirstChild("RF/InteractDragonQuest")
            if not net then return end
            local result = net:InvokeServer({NPC = "Dojo Trainer", Command = "RequestQuest"})
            if result and result.Quest then
                local belt = result.Quest.BeltName
                if belt == "White" then
                    FightBoss("Skull Slayer")
                elseif belt == "Yellow" then
                    getgenv().Configs.SeaEvents.Enable = true
                    getgenv().Configs.SeaEvents.KillSeaBeast = true
                    getgenv().Configs.SeaEvents.AutoSail = true
                elseif belt == "Green" then
                    getgenv().Configs.SeaEvents.Enable = true
                    getgenv().Configs.SeaEvents.AutoSail = true
                elseif belt == "Purple" then
                    -- Elite Hunters already enabled via main quest system
                elseif belt == "Red" then
                    getgenv().Configs.SeaEvents.KillFishBoat = true
                    getgenv().Configs.SeaEvents.AutoSail = true
                elseif belt == "Black" then
                    getgenv().Configs.Prehistoric.FindIsland = true
                else
                    net:InvokeServer({NPC = "Dojo Trainer", Command = "ClaimQuest"})
                end
            end
        end)
    end
end)

--// ================== PREHISTORIC ISLAND FULL (VOLCANO, EGGS, BONES) ==================
task.spawn(function()
    while task.wait(1) do
        if not getgenv().Configs.Prehistoric.FindIsland then continue end
        pcall(function()
            local pre = Workspace.Map:FindFirstChild("PrehistoricIsland")
            if not pre then return end
            if getgenv().Configs.Prehistoric.PatchEvent then
                for _, obj in ipairs(pre:GetDescendants()) do
                    if obj.Name:lower():find("lava") and (obj:IsA("Part") or obj:IsA("MeshPart")) then obj:Destroy() end
                end
                local golem = GetAliveMonster("Lava Golem")
                if golem then TweenTo(golem.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)) end
            end
            if getgenv().Configs.Prehistoric.CollectDragonEggs then
                local egg = pre.Core.SpawnedDragonEggs and pre.Core.SpawnedDragonEggs:FindFirstChild("DragonEgg")
                if egg then
                    TweenTo(egg.Molten.CFrame)
                    fireproximityprompt(egg.Molten.ProximityPrompt, 30)
                end
            end
            if getgenv().Configs.Prehistoric.CollectDinoBones then
                local bone = Workspace:FindFirstChild("DinoBone")
                if bone then TweenTo(bone.CFrame) end
            end
            if getgenv().Configs.Prehistoric.ResetWhenComplete then
                if pre:FindFirstChild("TrialTeleport") and pre.TrialTeleport:FindFirstChild("TouchInterest") then
                    Player.Character.Humanoid.Health = 0 -- respawn
                end
            end
        end)
    end
end)

--// ================== DRAGO V1-V3 QUESTS ==================
task.spawn(function()
    while task.wait(3) do
        pcall(function()
            if getgenv().Configs.Dragon.DragoV1 then
                if CheckItem("Dragon Egg") < 1 then
                    getgenv().Configs.Prehistoric.FindIsland = true
                    getgenv().Configs.Prehistoric.PatchEvent = true
                    getgenv().Configs.Prehistoric.CollectDragonEggs = true
                else
                    getgenv().Configs.Prehistoric.FindIsland = false
                    getgenv().Configs.Prehistoric.PatchEvent = false
                    getgenv().Configs.Prehistoric.CollectDragonEggs = false
                end
            end
            if getgenv().Configs.Dragon.DragoV2 then
                -- Fire Flowers: kill forest pirates, collect flowers
                if not Workspace:FindFirstChild("FireFlowers") then
                    local mob = GetAliveMonster("Forest Pirate")
                    if mob then TweenTo(mob.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0)) else TweenTo(CFrame.new(-13206, 426, -7965)) end
                else
                    for _, flower in ipairs(Workspace.FireFlowers:GetChildren()) do
                        if flower:IsA("Model") and flower.PrimaryPart then
                            TweenTo(flower.PrimaryPart.CFrame)
                            VirtualInputManager:SendKeyEvent(true, "E", false, game)
                            task.wait(1.5)
                            VirtualInputManager:SendKeyEvent(false, "E", false, game)
                            break
                        end
                    end
                end
            end
            if getgenv().Configs.Dragon.DragoV3 then
                getgenv().Configs.SeaEvents.Enable = true
                getgenv().Configs.SeaEvents.KillTerrorShark = true
                getgenv().Configs.SeaEvents.AutoSail = true
                getgenv().Configs.SeaEvents.DangerLevel = "Lv Infinite"
            end
        end)
    end
end)

--// ================== AUTO PULL LEVER & V4 DOOR ==================
task.spawn(function()
    while task.wait(1) do
        if not getgenv().Configs.RaceV4.TeleportToDoors then continue end
        pcall(function()
            local race = Player.Data.Race.Value
            if race == "Mink" then TweenTo(CFrame.new(29020.66, 14889.43, -379.27))
            elseif race == "Fishman" then TweenTo(CFrame.new(28224.06, 14889.43, -210.59))
            elseif race == "Cyborg" then TweenTo(CFrame.new(28492.41, 14894.43, -422.11))
            elseif race == "Skypiea" then TweenTo(CFrame.new(28967.41, 14918.08, 234.31))
            elseif race == "Ghoul" then TweenTo(CFrame.new(28672.72, 14889.13, 454.60))
            elseif race == "Human" then TweenTo(CFrame.new(29237.29, 14889.43, -206.95))
            end
        end)
    end
end)

--// ================== ANTI-AFK ENHANCED ==================
task.spawn(function()
    while task.wait(120) do
        pcall(function()
            VirtualInputManager:SendKeyEvent(true, "Space", false, game)
            task.wait(0.2)
            VirtualInputManager:SendKeyEvent(false, "Space", false, game)
            VirtualInputManager:SendMouseMoveEvent(100, 100, game)
        end)
    end
end)

--// ================== FINAL INITIALIZATION ==================
UpdateStatus("Part 4 - Ready!")
--[[
   ╔══════════════════════════════════════════════════════════════╗
   ║     ASTRAL HUB - ULTIMATE MEGA MERGE (PART 5 OF 5)            ║
   ║   Final: All Remaining Quests, Bosses, Puzzles,               ║
   ║   Full Cyborg Logic, Extended Mastery, Observation,           ║
   ║   Full CDK/Soul Guitar Steps, Complete Evo V2,                ║
   ║   Bartilo, Water Key, True Triple Katana, and More            ║
   ╚══════════════════════════════════════════════════════════════╝
--]]

--// ================== ENHANCED AUTO CYBORG (FULL CHEST FARMING + DARKBEARD) ==================
-- Replaces Part 2's basic cyborg with full logic from Xero Hub
local CyborgState = {
    FistDetected = false,
    HasCoreBrain = false,
    HasMicrochip = false,
    IsFightingBoss = false,
    MicrochipPurchased = false,
    KeyDetected = false,
    ChestCount = 0,
    LastChestCollectedTime = tick(),
    LastClickTime = 0,
    ClickCooldown = 2,
    AutoCollectChest = true,
    AutoRejoin = true,
    AutoHop = true,
    AutoJump = true,
    FightDarkbeard = false,
    FightDarkbeardOnlyWithFist = false,
    StartHop = true,
    Antikick = true,
    WhiteScreen = false,
    ServerStartTime = tick(),
}

local function ForceStopChestCollection()
    getgenv().Configs.AutoCyborg.AutoCollectChest = false
    CyborgState.FistDetected = true
end

local function ClickDetectorCyborg()
    local detector, pos = FindClickDetector()
    if detector then
        if pos and Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
            local dist = (pos - Player.Character.HumanoidRootPart.Position).Magnitude
            if dist > 32 then
                TweenTo(CFrame.new(pos + Vector3.new(0, 2, 0)))
                task.wait(0.5)
            end
        end
        pcall(function() fireclickdetector(detector) end)
        task.wait(0.3)
        pcall(function() fireclickdetector(detector) end)
        CyborgState.LastClickTime = tick()
        return true
    end
    return false
end

local function BuyMicrochipIfNeeded()
    if HasMicrochip() then CyborgState.HasMicrochip = true; return true end
    if CyborgState.MicrochipPurchased and not HasMicrochip() then
        CyborgState.MicrochipPurchased = false
    end
    replicated.Remotes.CommF_:InvokeServer("BlackbeardReward", "Microchip", "2")
    CyborgState.MicrochipPurchased = true
    task.wait(1)
    if HasMicrochip() then CyborgState.HasMicrochip = true; return true end
    return false
end

local function SpawnBoss()
    if CyborgState.IsFightingBoss then return end
    if HasFistOfDarkness() and not CyborgState.FistDetected then
        ForceStopChestCollection()
        CyborgState.FistDetected = true
    end
    ClickDetectorCyborg()
    task.wait(1)
    if not HasMicrochip() then
        if not BuyMicrochipIfNeeded() then
            getgenv().Configs.AutoCyborg.AutoCollectChest = true
            CyborgState.IsChestFarming = true
            return
        end
    end
    if HasMicrochip() then
        ClickDetectorCyborg()
        task.wait(3)
        if CheckBoss("Order") then
            CyborgState.IsFightingBoss = true
            local timeout = 0
            while CheckBoss("Order") and timeout < 300 do
                task.wait(1)
                timeout = timeout + 1
            end
            CyborgState.IsFightingBoss = false
            if HasCoreBrain() and not IsCyborg() then
                EquipCoreBrain()
                ClickDetectorCyborg()
                task.wait(5)
                BuyCyborgRace()
            end
        end
    end
end

-- Darkbeard fight with optional conditions
task.spawn(function()
    while task.wait(1) do
        if not getgenv().Configs.AutoCyborg.Enabled then continue end
        pcall(function()
            if getgenv().Configs.AutoCyborg.FightDarkbeard then
                local db = CheckBoss("Darkbeard")
                if db and not CyborgState.IsFightingBoss then
                    CyborgState.IsFightingBoss = true
                    UpdateStatus("Fighting Darkbeard...")
                    while db and db:FindFirstChild("Humanoid") and db.Humanoid.Health > 0 do
                        TweenTo(db.HumanoidRootPart.CFrame * CFrame.new(0, -30, 0))
                        task.wait(0.5)
                    end
                    CyborgState.IsFightingBoss = false
                end
            elseif getgenv().Configs.AutoCyborg.FightDarkbeardOnlyWithFist then
                if HasFistOfDarkness() then
                    local db = CheckBoss("Darkbeard")
                    if db and not CyborgState.IsFightingBoss then
                        CyborgState.IsFightingBoss = true
                        while db and db:FindFirstChild("Humanoid") and db.Humanoid.Health > 0 do
                            TweenTo(db.HumanoidRootPart.CFrame * CFrame.new(0, -30, 0))
                            task.wait(0.5)
                        end
                        CyborgState.IsFightingBoss = false
                    elseif not db and not CyborgState.IsFightingBoss then
                        TweenTo(CFrame.new(3779.5, 15.08, -3500.45))
                        task.wait(1)
                        ClickDetectorCyborg()
                        task.wait(3)
                    end
                end
            end
        end)
    end
end)

-- Core Cyborg Loop
task.spawn(function()
    while task.wait(0.5) do
        if not getgenv().Configs.AutoCyborg.Enabled then continue end
        pcall(function()
            if IsCyborg() then
                getgenv().Configs.AutoCyborg.Enabled = false
                UpdateStatus("Cyborg Race Acquired! Stopping.")
                return
            end
            if HasCoreBrain() and not IsCyborg() then
                CyborgState.HasCoreBrain = true
                EquipCoreBrain()
                ClickDetectorCyborg()
                task.wait(5)
                BuyCyborgRace()
                return
            end
            if HasFistOfDarkness() and not CyborgState.FistDetected then
                ForceStopChestCollection()
                SpawnBoss()
                return
            end
            if getgenv().Configs.AutoCyborg.AutoCollectChest then
                local chest = GetChest()
                if chest then
                    TweenTo(CFrame.new(chest.Position))
                    task.wait(0.5)
                    CyborgState.ChestCount = CyborgState.ChestCount + 1
                    ChestRow.Text = "📦 Chests: " .. CyborgState.ChestCount
                    CyborgState.LastChestCollectedTime = tick()
                end
            end
            if getgenv().Configs.AutoCyborg.AutoHop then
                local elapsed = tick() - CyborgState.ServerStartTime
                if elapsed > 900 then
                    UpdateStatus("Server Hopping...")
                    HopLowServer(10)
                    CyborgState.ServerStartTime = tick()
                end
            end
        end)
    end
end)

-- Anti AFK for Cyborg (jump)
task.spawn(function()
    while task.wait(0.1) do
        if not getgenv().Configs.AutoCyborg.AutoJump then continue end
        if CyborgState.IsFightingBoss then continue end
        pcall(function()
            local hum = Player.Character and Player.Character:FindFirstChild("Humanoid")
            if hum then hum:ChangeState(Enum.HumanoidStateType.Jumping) end
        end)
    end
end)

--// ================== FULL BARTILO QUEST (PLATES) ==================
local BartiloDone = false
local function HandleBartiloQuestFull()
    local progress = replicated.Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo")
    if progress == 0 then
        TweenTo(CFrame.new(-1836, 11, 1714))
        if (Player.Character.HumanoidRootPart.Position - Vector3.new(-1836, 11, 1714)).Magnitude < 10 then
            replicated.Remotes.CommF_:InvokeServer("StartQuest", "BartiloQuest", 1)
        end
    elseif progress == 1 then
        local mob = GetAliveMonster("Swan Pirate")
        if mob then TweenTo(mob.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)) else TweenTo(CFrame.new(976, 111, 1229)) end
    elseif progress == 2 then
        local boss = GetAliveBoss("Jeremy")
        if boss then TweenTo(boss.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)) end
    elseif progress == 3 then
        if not BartiloDone then
            -- Plates
            local plates = {"Plate1","Plate2","Plate3","Plate4","Plate5","Plate6","Plate7","Plate8"}
            for _, plate in ipairs(plates) do
                local plateObj = Workspace.Map.Dressrosa.BartiloPlates:FindFirstChild(plate)
                if plateObj then
                    TweenTo(plateObj.CFrame)
                    task.wait(0.5)
                end
            end
            BartiloDone = true
        end
    end
end

--// ================== FULL EVO RACE V2 (HUMAN / FISHMAN) ==================
local EvoRaceV2State = {KilledOrbitus = false, KilledJeremy = false, KilledDiamond = false}
local function HandleEvoRaceV2Human()
    if not EvoRaceV2State.KilledOrbitus then
        local boss = GetAliveBoss("Orbitus")
        if boss then TweenTo(boss.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
        else HopLowServer(5); TeleportService:Teleport(game.PlaceId, Player) end
        if boss and boss.Humanoid.Health <= 0 then EvoRaceV2State.KilledOrbitus = true end
    elseif not EvoRaceV2State.KilledJeremy then
        local boss = GetAliveBoss("Jeremy")
        if boss then TweenTo(boss.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
        else HopLowServer(5); TeleportService:Teleport(game.PlaceId, Player) end
        if boss and boss.Humanoid.Health <= 0 then EvoRaceV2State.KilledJeremy = true end
    elseif not EvoRaceV2State.KilledDiamond then
        local boss = GetAliveBoss("Diamond")
        if boss then TweenTo(boss.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
        else HopLowServer(5); TeleportService:Teleport(game.PlaceId, Player) end
        if boss and boss.Humanoid.Health <= 0 then EvoRaceV2State.KilledDiamond = true end
    else
        replicated.Remotes.CommF_:InvokeServer("Wenlocktoad", "3")
    end
end

local function HandleEvoRaceV2Fishman()
    local boat = nil
    for _, b in ipairs(Workspace.Boats:GetChildren()) do
        if b.Owner.Value == Player.Name then boat = b; break end
    end
    if not boat then
        TweenTo(CFrame.new(-1935, 6, -2564))
        if (Player.Character.HumanoidRootPart.Position - Vector3.new(-1935, 6, -2564)).Magnitude < 3 then
            replicated.Remotes.CommF_:InvokeServer("BuyBoat", "Dinghy")
        end
    else
        if Player.Character.Humanoid.Sit == false then
            TweenTo(boat.VehicleSeat.CFrame * CFrame.new(0, 2, 0))
            task.wait(1)
            Player.Character.Humanoid.Sit = true
        else
            for _, sb in ipairs(Workspace.SeaBeasts:GetChildren()) do
                if sb:FindFirstChild("Health") and sb.Health.Value > 0 then
                    TweenTo(sb.HumanoidRootPart.CFrame * CFrame.new(0, 3, 0))
                    task.wait(0.5)
                    EquipTool("Fishman Karate")
                    VirtualInputManager:SendKeyEvent(true, "Z", false, game)
                    task.wait(0.5)
                    VirtualInputManager:SendKeyEvent(false, "Z", false, game)
                    break
                end
            end
            if not Workspace.SeaBeasts:FindFirstChildOfClass("Model") then
                TweenTo(CFrame.new(3017, -4, -2686)) -- sail
            end
        end
    end
    -- Wenlocktoad should be completed once sea beast killed
end

--// ================== FULL WATER KEY QUEST ==================
local function HandleWaterKeyFull()
    if HasItem("Water Key") then
        EquipTool("Water Key")
        replicated.Remotes.CommF_:InvokeServer("BuySharkmanKarate", true)
    else
        local boss = GetAliveBoss("Tide Keeper")
        if boss then
            TweenTo(boss.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
        else
            HopLowServer(5)
            TeleportService:Teleport(game.PlaceId, Player)
        end
    end
end

--// ================== FULL ELECTRIC CLAW QUEST START ==================
local ElectricClawStarted = false
local function HandleElectricClawQuest()
    if replicated.Remotes.CommF_:InvokeServer("BuyElectricClaw", true) == "Nah." then
        replicated.Remotes.CommF_:InvokeServer("BuyElectricClaw", "Start")
        TweenTo(CFrame.new(-12548, 337, -7481))
    else
        ElectricClawStarted = true
    end
end

--// ================== TRUE TRIPLE KATANA AUTO ==================
task.spawn(function()
    while task.wait(5) do
        pcall(function()
            if HasItem("Shisui") and HasItem("Wando") and HasItem("Saddi") and not HasItem("True Triple Katana") then
                replicated.Remotes.CommF_:InvokeServer("MysteriousMan", "2")
            end
        end)
    end
end)

--// ================== FULL CDK BOAT QUEST (3 DEALERS) ==================
local CDKBoatState = {boat1done=false, boat2done=false, boat3done=false}
local function HandleCDKBoatQuest()
    if not CDKBoatState.boat1done then
        TweenTo(CFrame.new(-4600.37, 15.1245, -2881.18))
        if (Player.Character.HumanoidRootPart.Position - Vector3.new(-4600.37, 15.1245, -2881.18)).Magnitude < 5 then
            local dealer = Workspace.NPCs:FindFirstChild("Luxury Boat Dealer")
            if dealer then
                replicated.Remotes.CommF_:InvokeServer("CDKQuest", "BoatQuest", dealer, "Check")
                replicated.Remotes.CommF_:InvokeServer("CDKQuest", "BoatQuest", dealer)
                CDKBoatState.boat1done = true
            end
        end
    elseif not CDKBoatState.boat2done then
        TweenTo(CFrame.new(-2068.63, 3.37222, -9887.08))
        if (Player.Character.HumanoidRootPart.Position - Vector3.new(-2068.63, 3.37222, -9887.08)).Magnitude < 5 then
            local dealer = Workspace.NPCs:FindFirstChild("Luxury Boat Dealer")
            if dealer then
                replicated.Remotes.CommF_:InvokeServer("CDKQuest", "BoatQuest", dealer, "Check")
                replicated.Remotes.CommF_:InvokeServer("CDKQuest", "BoatQuest", dealer)
                CDKBoatState.boat2done = true
            end
        end
    elseif not CDKBoatState.boat3done then
        TweenTo(CFrame.new(-9531.19, 5.91675, -8377.75))
        if (Player.Character.HumanoidRootPart.Position - Vector3.new(-9531.19, 5.91675, -8377.75)).Magnitude < 5 then
            local dealer = Workspace.NPCs:FindFirstChild("Luxury Boat Dealer")
            if dealer then
                replicated.Remotes.CommF_:InvokeServer("CDKQuest", "BoatQuest", dealer, "Check")
                replicated.Remotes.CommF_:InvokeServer("CDKQuest", "BoatQuest", dealer)
                CDKBoatState.boat3done = true
            end
        end
    end
end

--// ================== FULL SOUL GUITAR PUZZLE (SWAMP, GRAVES, TROPHIES, PIPES) ==================
local SoulGuitarState2 = {
    SwampDone = false,
    PuzzlesDone = {},
    TrophiesDone = false,
    PipesDone = false,
    GravestonesDone = false,
}
local function HandleSoulGuitarPuzzleFull()
    local swamp = Workspace.Map["Haunted Castle"].SwampWater
    -- Swamp
    if swamp and tostring(swamp.BrickColor) == "Maroon" and not SoulGuitarState2.SwampDone then
        TweenTo(CFrame.new(-10147.779, 138.627, 5939.56))
        if (Player.Character.HumanoidRootPart.Position - Vector3.new(-10147.779, 138.627, 5939.56)).Magnitude < 15 then
            local zombies = 0
            for _, mob in ipairs(Workspace.Enemies:GetChildren()) do
                if mob.Name == "Living Zombie" and mob:FindFirstChild("Humanoid") and mob.Humanoid.Health > 0 and (mob.HumanoidRootPart.Position - Player.Character.HumanoidRootPart.Position).Magnitude < 500 then
                    zombies = zombies + 1
                end
            end
            if zombies >= 6 then SoulGuitarState2.SwampDone = true end
        end
    -- Gravestones
    elseif swamp and tostring(swamp.BrickColor) ~= "Maroon" and not SoulGuitarState2.GravestonesDone then
        local puzzle = replicated.Remotes.CommF_:InvokeServer("GuitarPuzzleProgress", "Check")
        if puzzle and puzzle.Gravestones == false then
            -- Fire placards (simplified; actual positions)
            local placards = {
                {name="Placard7", side="Left"},
                {name="Placard6", side="Left"},
                {name="Placard5", side="Left"},
                {name="Placard4", side="Right"},
                {name="Placard3", side="Left"},
                {name="Placard2", side="Right"},
                {name="Placard1", side="Right"},
            }
            for _, p in ipairs(placards) do
                local placard = Workspace.Map["Haunted Castle"][p.name]
                if placard and placard[p.side].Indicator.BrickColor ~= BrickColor.new("Pearl") then
                    TweenTo(placard[p.side].CFrame)
                    fireclickdetector(placard[p.side].ClickDetector)
                    task.wait(0.5)
                end
            end
            SoulGuitarState2.GravestonesDone = true
        end
    -- Trophies
    elseif puzzle and puzzle.Trophies == false then
        TweenTo(CFrame.new(-9532.823, 6.47167, 6078.068))
        -- adjust segments to match trophy rotations (detailed)
        local function RotateSegment(segNum, trophyNum)
            local seg = Workspace.Map["Haunted Castle"].Tablet["Segment"..segNum]
            local trophy = Workspace.Map["Haunted Castle"].Trophies.Quest["Trophy"..trophyNum]
            if seg and trophy and trophy.Handle then
                while math.abs(seg.Line.Rotation.Z - trophy.Handle.Rotation.Z) > 1 do
                    TweenTo(seg.CFrame)
                    fireclickdetector(seg.ClickDetector)
                    task.wait(0.5)
                end
            end
        end
        RotateSegment(1, 1)
        RotateSegment(3, 2)
        RotateSegment(4, 3)
        RotateSegment(7, 4)
        RotateSegment(10, 5)
        -- middle segments click to reset
        for _, s in ipairs({2,5,6,8,9}) do
            local seg = Workspace.Map["Haunted Castle"].Tablet["Segment"..s]
            if seg then fireclickdetector(seg.ClickDetector) end
        end
        SoulGuitarState2.TrophiesDone = true
    -- Pipes
    elseif puzzle and puzzle.Pipes == false then
        local lab = Workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model
        local function ClickPipe(num, times)
            local part = lab["Part"..num]
            if part then
                TweenTo(part.CFrame)
                for i=1,times do
                    fireclickdetector(part.ClickDetector)
                    task.wait(0.3)
                end
            end
        end
        ClickPipe(3, 1)
        ClickPipe(4, 3)
        ClickPipe(6, 2)
        ClickPipe(8, 1)
        ClickPipe(10, 3)
        SoulGuitarState2.PipesDone = true
    end
end

--// ================== FULL OBSERVATION FARM (PER WORLD) ==================
local ObsState = {dodging = false}
task.spawn(function()
    while task.wait(0.2) do
        if not getgenv().Configs.Misc.ObservationFarm then continue end
        pcall(function()
            replicated.Remotes.CommE:FireServer("Ken", true)
            local dodgesLeft = Player:GetAttribute("KenDodgesLeft")
            if dodgesLeft == 0 then
                ObsState.dodging = false
                -- move away from enemies (fly up)
                for _, enemy in ipairs(Workspace.Enemies:GetChildren()) do
                    if enemy:FindFirstChild("Humanoid") and enemy.Humanoid.Health > 0 then
                        TweenTo(Player.Character.HumanoidRootPart.CFrame * CFrame.new(0, 50, 0))
                        break
                    end
                end
            else
                ObsState.dodging = true
                -- move close to enemy to dodge
                local nearest = nil
                local minDist = math.huge
                for _, enemy in ipairs(Workspace.Enemies:GetChildren()) do
                    if enemy:FindFirstChild("Humanoid") and enemy.Humanoid.Health > 0 and enemy:FindFirstChild("HumanoidRootPart") then
                        local d = (enemy.HumanoidRootPart.Position - Player.Character.HumanoidRootPart.Position).Magnitude
                        if d < minDist then
                            minDist = d
                            nearest = enemy
                        end
                    end
                end
                if nearest then
                    TweenTo(nearest.HumanoidRootPart.CFrame * CFrame.new(3, 0, 0))
                end
            end
        end)
    end
end)

--// ================== AUTO FACTORY RAID (SECOND SEA) ==================
task.spawn(function()
    while task.wait(2) do
        if not getgenv().Configs.SeaEvents.Enable or not getgenv().Configs.SeaEvents.AutoFactory then continue end
        pcall(function()
            if World2 then
                local core = GetAliveBoss("Core")
                if core then
                    TweenTo(core.HumanoidRootPart.CFrame * CFrame.new(0, 40, 0))
                else
                    TweenTo(CFrame.new(448.47, 199.36, -441.39))
                end
            end
        end)
    end
end)

--// ================== AUTO PIRATE RAID (WORLD 1) ==================
task.spawn(function()
    while task.wait(2) do
        if not getgenv().Configs.SeaEvents.Enable or not getgenv().Configs.SeaEvents.AutoPirateRaid then continue end
        pcall(function()
            if World1 then
                -- fight galley pirate or galley captain
                local mob = GetAliveMonster("Galley Pirate") or GetAliveMonster("Galley Captain")
                if mob then TweenTo(mob.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)) else TweenTo(CFrame.new(-5539, 314, -2972)) end
            end
        end)
    end
end)

--// ================== AUTO TRAINING DUMMY ==================
task.spawn(function()
    while task.wait(1) do
        if not getgenv().Configs.Misc.AutoTrainingDummy then continue end
        pcall(function()
            if Player.PlayerGui.Main.Quest.Visible == false then
                replicated.Remotes.CommF_:InvokeServer("ArenaTrainer")
            else
                local dummy = GetAliveBoss("Training Dummy")
                if dummy then TweenTo(dummy.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)) else TweenTo(CFrame.new(3688, 12.75, 170.21)) end
            end
        end)
    end
end)

--// ================== AUTO CITIZEN QUEST ==================
task.spawn(function()
    while task.wait(1) do
        if not getgenv().Configs.Misc.AutoCitizenQuest then continue end
        pcall(function()
            local progress = replicated.Remotes.CommF_:InvokeServer("CitizenQuestProgress", "Citizen")
            if progress == 0 then
                TweenTo(CFrame.new(-12443.87, 332.4, -7675.49))
                if (Player.Character.HumanoidRootPart.Position - Vector3.new(-12443.87, 332.4, -7675.49)).Magnitude < 5 then
                    replicated.Remotes.CommF_:InvokeServer("StartQuest", "CitizenQuest", 1)
                end
            elseif progress == 1 then
                local mob = GetAliveMonster("Forest Pirate")
                if mob then TweenTo(mob.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)) else TweenTo(CFrame.new(-13206, 426, -7965)) end
            elseif progress == 2 then
                local boss = GetAliveBoss("Captain Elephant")
                if boss then TweenTo(boss.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)) end
            end
        end)
    end
end)

--// ================== FULL AUTO BERRY COLLECT ==================
task.spawn(function()
    while task.wait(1) do
        if not getgenv().Configs.ESP.Berries then continue end
        pcall(function()
            for _, bush in ipairs(Workspace:GetDescendants()) do
                if bush:IsA("Model") and bush:GetAttribute("BerryBush") then
                    local part = bush:FindFirstChildOfClass("BasePart") or bush.PrimaryPart
                    if part and (part.Position - Player.Character.HumanoidRootPart.Position).Magnitude < 50 then
                        TweenTo(part.CFrame)
                        for _, prompt in ipairs(bush:GetDescendants()) do
                            if prompt:IsA("ProximityPrompt") then
                                fireproximityprompt(prompt)
                            end
                        end
                    end
                end
            end
        end)
    end
end)

--// ================== SERVER HOP (LOWEST PLAYERS / PING) ==================
task.spawn(function()
    while task.wait(60) do
        if not getgenv().Configs.SeaEvents.Enable or not getgenv().Configs.SeaEvents.AutoHopServer then continue end
        pcall(function()
            if #Players:GetPlayers() > 8 then
                HopLowServer(6)
            end
        end)
    end
end)

-- Lowest ping hop 
task.spawn(function()
    while task.wait(120) do
        if not getgenv().Configs.SeaEvents.HopLowPing then continue end
        pcall(function()
            local servers = HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"))
            if servers and servers.data then
                local best = servers.data[1]
                for _, server in ipairs(servers.data) do
                    if (server.ping or 999) < (best.ping or 999) and server.playing < server.maxPlayers then
                        best = server
                    end
                end
                if best and best.id ~= game.JobId then
                    TeleportService:TeleportToPlaceInstance(game.PlaceId, best.id, Player)
                end
            end
        end)
    end
end)

--// ================== AUTO REJOIN (ANTI-KICK) ==================
task.spawn(function()
    while task.wait(2) do
        pcall(function()
            local coregui = game:GetService("CoreGui")
            if coregui:FindFirstChild("RobloxPromptGui") then
                local prompt = coregui.RobloxPromptGui.promptOverlay
                for _, child in ipairs(prompt:GetChildren()) do
                    if child.Name == "ErrorPrompt" and child.Visible then
                        TeleportService:Teleport(game.PlaceId, Player)
                    end
                end
            end
        end)
    end
end)

--// ================== EXTRA EQUIPMENT AUTO-LOAD ==================
task.spawn(function()
    while task.wait(10) do
        pcall(function()
            -- Load best melee
            local bestMelee = GetBestWeapon("Melee")
            if bestMelee and not HasItem(bestMelee) then
                replicated.Remotes.CommF_:InvokeServer("LoadItem", bestMelee)
            end
            -- Load best sword
            local bestSword = GetBestWeapon("Sword")
            if bestSword and not HasItem(bestSword) then
                replicated.Remotes.CommF_:InvokeServer("LoadItem", bestSword)
            end
        end)
    end
end)

--// ================== MISC: DISABLE SCREEN EFFECTS ==================
task.spawn(function()
    while task.wait(1) do
        pcall(function()
            Lighting.Brightness = 0
            Lighting.FogEnd = 99999
            -- white screen disable if configured
            if getgenv().Configs.AutoCyborg.WhiteScreen then
                RunService:Set3dRenderingEnabled(false)
            else
                RunService:Set3dRenderingEnabled(true)
            end
        end)
    end
end)

--// ================== MISC: DEATH EFFECTS REMOVAL ==================
task.spawn(function()
    while task.wait(0.5) do
        pcall(function()
            local effect = ReplicatedStorage:FindFirstChild("Effect")
            if effect then
                if effect.Container:FindFirstChild("Death") then effect.Container.Death:Destroy() end
                if effect.Container:FindFirstChild("Respawn") then effect.Container.Respawn:Destroy() end
            end
        end)
    end
end)

--// ================== FINAL CLEANUP ==================
UpdateStatus("Part 5 - Ready!")