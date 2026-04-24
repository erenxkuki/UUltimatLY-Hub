--[[
   ╔══════════════════════════════════════════════════════════════╗
   ║     ASTRAL HUB - ULTIMATE MEGA MERGE (PART 1 – REWRITTEN)   ║
   ║   Bug fixed: No auto chest collection, no accidental hopping ║
   ║   UI unchanged, Configs extended for future features          ║
   ╚══════════════════════════════════════════════════════════════╝
--]]

--// ================== CONFIGS (Base + Extended) ==================
getgenv().Configs = {
    -- Original Quest / Weapon / FPS configs
    ["Quest"] = {
        ["Evo Race V1"] = true,
        ["Evo Race V2"] = true,
        ["RGB Haki"] = true,
        ["Pull Lerver"] = true
    },
    ["Sword"] = {
        "Dual-Headed Blade", "Smoke Admiral", "Wardens Sword", "Cutlass", "Katana",
        "Dual Katana", "Triple Katana", "Iron Mace", "Saber", "Pole (1st Form)",
        "Gravity Blade", "Longsword", "Rengoku", "Midnight Blade", "Soul Cane",
        "Bisento", "Yama", "Tushita", "Cursed Dual Katana"
    },
    ["Gun"] = {
        "Soul Guitar", "Kabucha", "Venom Bow", "Musket", "Flintlock",
        "Refined Slingshot", "Magma Blaster", "Dual Flintlock", "Cannon",
        "Bizarre Revolver", "Bazooka"
    },
    ["FPS Booster"] = true,

    -- Future features (will be implemented in later parts)
    ["AutoCyborg"]         = false,    -- Chest farming, Darkbeard, etc. (Part 2)
    ["SeaEvents"]          = false,    -- Boats & sea combat (Part 2)
    ["Mirage"]             = false,    -- Mirage Island (Part 2)
    ["RaceV4"]             = false,    -- V4 trials (Part 2)
    ["Dragon"]             = false,    -- Dojo / Draco V1-V3 (Part 2)
    ["Prehistoric"]        = false,    -- Island finder & fully volcanic (Part 2)
    ["Fishing"]            = false,    -- Auto fishing (Part 2)
    ["MaterialFarm"]       = false,    -- Material auto farm (Part 2)
    ["BossFarming"]        = false,    -- All boss auto farm (Part 2)
    ["ESP"]                = false,    -- Player/Chest/Fruit ESP (Part 2)
    ["FastAttack"]         = true,     -- Fast Attack enabled by default (original)
    ["Misc"] = {
        ["PanicMode"]           = false,
        ["RemoveHitVFX"]        = false,
        ["DisableNotifications"]= false,
    }
}

--// Wait for game to load
if not game:IsLoaded() then
    repeat task.wait() until game:IsLoaded()
end

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

local Player = Players.LocalPlayer
local replicated = ReplicatedStorage

--// ================== AUTO TEAM SELECTION ==================
task.spawn(function()
    while task.wait() do
        pcall(function()
            if Player.PlayerGui:FindFirstChild("Main (minimal)") then
                local chooseTeam = Player.PlayerGui["Main (minimal)"]:FindFirstChild("ChooseTeam")
                if chooseTeam and chooseTeam.Visible then
                    replicated.Remotes.CommF_:InvokeServer("SetTeam", "Pirates")
                end
            end
        end)
    end
end)

task.wait(5)

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

--// ================== UI SETUP (Original Astral Hub, unchanged) ==================
if CoreGui:FindFirstChild("AstralHubUI") then
    CoreGui.AstralHubUI:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AstralHubUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = CoreGui

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 350, 0, 140)
MainFrame.Position = UDim2.new(0.5, -175, 0, 20)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
MainFrame.BorderSizePixel = 0
MainFrame.BackgroundTransparency = 0.1
MainFrame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = MainFrame

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(0, 200, 255)
UIStroke.Thickness = 2
UIStroke.Parent = MainFrame

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(1, 0, 0, 35)
TitleLabel.Position = UDim2.new(0, 0, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "ASTRAL HUB"
TitleLabel.TextColor3 = Color3.fromRGB(0, 200, 255)
TitleLabel.Font = Enum.Font.GothamBlack
TitleLabel.TextSize = 18
TitleLabel.Parent = MainFrame

local Divider = Instance.new("Frame")
Divider.Size = UDim2.new(0.9, 0, 0, 2)
Divider.Position = UDim2.new(0.05, 0, 0, 35)
Divider.BackgroundColor3 = Color3.fromRGB(0, 200, 255)
Divider.BorderSizePixel = 0
Divider.Parent = MainFrame

local LevelLabel = Instance.new("TextLabel")
LevelLabel.Size = UDim2.new(0.9, 0, 0, 28)
LevelLabel.Position = UDim2.new(0.05, 0, 0, 45)
LevelLabel.BackgroundTransparency = 1
LevelLabel.Text = "Level: Loading..."
LevelLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
LevelLabel.Font = Enum.Font.GothamBold
LevelLabel.TextSize = 14
LevelLabel.TextXAlignment = Enum.TextXAlignment.Left
LevelLabel.Parent = MainFrame

local TargetLabel = Instance.new("TextLabel")
TargetLabel.Size = UDim2.new(0.9, 0, 0, 28)
TargetLabel.Position = UDim2.new(0.05, 0, 0, 75)
TargetLabel.BackgroundTransparency = 1
TargetLabel.Text = "Target: Loading..."
TargetLabel.TextColor3 = Color3.fromRGB(150, 255, 150)
TargetLabel.Font = Enum.Font.GothamSemibold
TargetLabel.TextSize = 14
TargetLabel.TextXAlignment = Enum.TextXAlignment.Left
TargetLabel.Parent = MainFrame

local StatusLabel = Instance.new("TextLabel")
StatusLabel.Size = UDim2.new(0.9, 0, 0, 28)
StatusLabel.Position = UDim2.new(0.05, 0, 0, 105)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Text = "Status: Idle"
StatusLabel.TextColor3 = Color3.fromRGB(255, 200, 100)
StatusLabel.Font = Enum.Font.Gotham
StatusLabel.TextSize = 13
StatusLabel.TextXAlignment = Enum.TextXAlignment.Left
StatusLabel.Parent = MainFrame

local ErrorLabel = Instance.new("TextLabel")
ErrorLabel.Size = UDim2.new(0, 450, 0, 50)
ErrorLabel.Position = UDim2.new(0.5, -225, 0.85, 0)
ErrorLabel.BackgroundColor3 = Color3.fromRGB(40, 10, 10)
ErrorLabel.TextColor3 = Color3.fromRGB(255, 80, 80)
ErrorLabel.Text = ""
ErrorLabel.TextScaled = true
ErrorLabel.Font = Enum.Font.GothamBold
ErrorLabel.Visible = false
ErrorLabel.Parent = ScreenGui

local ErrorCorner = Instance.new("UICorner")
ErrorCorner.CornerRadius = UDim.new(0, 8)
ErrorCorner.Parent = ErrorLabel

local function ShowError(err)
    ErrorLabel.Text = "ERROR: " .. tostring(err)
    ErrorLabel.Visible = true
    task.delay(5, function()
        ErrorLabel.Visible = false
    end)
end

local function UpdateStatus(text)
    StatusLabel.Text = "Status: " .. tostring(text)
end

--// ================== FPS BOOSTER ==================
task.spawn(function()
    if getgenv().Configs and getgenv().Configs["FPS Booster"] then
        pcall(function() ReplicatedStorage:FindFirstChild("Effect"):Destroy() end)
        pcall(function()
            for _, conn in pairs(getconnections(Player.PlayerGui.Main.Settings.Buttons.FastModeButton.Activated)) do
                conn.Function()
            end
        end)
        Lighting.GlobalShadows = false
        Lighting.FogEnd = 9e9
        Lighting.Brightness = 0
        if settings and settings().Rendering then
            settings().Rendering.QualityLevel = "Level01"
            settings().Rendering.GraphicsMode = "NoGraphics"
        end
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
        if Player.Character then
            for _, obj in ipairs(Player.Character:GetDescendants()) do
                if obj:IsA("Accessory") or obj:IsA("Shirt") or obj:IsA("Pants") then
                    obj:Destroy()
                end
            end
        end
        pcall(function()
            if Player.PlayerGui:FindFirstChild("Notifications") then
                Player.PlayerGui.Notifications.Enabled = false
            end
        end)
    end
end)

--// ================== FAST ATTACK SYSTEM ==================
local Modules = ReplicatedStorage:WaitForChild("Modules")
local Net = Modules:WaitForChild("Net")
local RegisterAttack = Net:WaitForChild("RE/RegisterAttack")
local RegisterHit = Net:WaitForChild("RE/RegisterHit")
local ShootGunEvent = Net:WaitForChild("RE/ShootGunEvent")
local GunValidator = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Validator2")

local AttackConfig = {
    AttackDistance = 65,
    AttackMobs = true,
    AttackPlayers = false,
    AttackCooldown = 0.05,
    ComboResetTime = 0.05,
    MaxCombo = 2,
    HitboxLimbs = {"RightLowerArm", "RightUpperArm", "LeftLowerArm", "LeftUpperArm", "RightHand", "LeftHand"},
    AutoClickEnabled = true
}

local SUCCESS_FLAGS, COMBAT_REMOTE_THREAD = pcall(function()
    return require(Modules.Flags).COMBAT_REMOTE_THREAD or false
end)
local SUCCESS_HIT, HIT_FUNCTION = pcall(function()
    return (getmenv or getsenv)(Net)._G.SendHitsToServer
end)

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

local AttackInstance = FastAttack.new()
table.insert(AttackInstance.Connections, RunService.Stepped:Connect(function()
    AttackInstance:Attack()
end))

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
        if (item.Type == "Sword" or item.Type == "Gun") and item.Name == itemName then
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
    maxPlayers = maxPlayers or 10
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

--// ================== MOVEMENT & NOCLIP SYSTEM ==================
local AutoFarm = true
local AutoBuso = true
local AutoEquipMelee = true
local TweenSpeed = 200
local CurrentTween = nil
local CurrentTargetCFrame = nil
local Bypassing = false

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
    if Bypassing then return end
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
        if targetDist < 5 then
            return
        end
    end
    local tweenInfo = TweenInfo.new(dist / TweenSpeed, Enum.EasingStyle.Linear)
    local tween = TweenService:Create(hrp, tweenInfo, {CFrame = targetCFrame})
    if CurrentTween then
        CurrentTween:Cancel()
    end
    CurrentTargetCFrame = targetCFrame
    CurrentTween = tween
    tween:Play()
end

RunService.Stepped:Connect(function()
    if AutoFarm and Player.Character then
        for _, v in ipairs(Player.Character:GetDescendants()) do
            if v:IsA("BasePart") and v.CanCollide then
                v.CanCollide = false
            end
        end
        local hrp = Player.Character:FindFirstChild("HumanoidRootPart")
        if hrp then
            local bv = hrp:FindFirstChild("FarmVelocity")
            if not bv then
                bv = Instance.new("BodyVelocity")
                bv.Name = "FarmVelocity"
                bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                bv.Velocity = Vector3.zero
                bv.Parent = hrp
            end
        end
    end
end)

--// ================== QUEST DATA SYSTEM (COMPLETE) ==================
local function GetQuestData()
    local levelObj = Player:WaitForChild("Data"):WaitForChild("Level")
    local Level = levelObj.Value
    local TeamSelf = Player.Team and Player.Team.Name or "Pirates"
    local Mon, Qname, Qdata, NameMon, PosQ, PosM, Entrance

    if World1 then
        if Level < 10 then
            if TeamSelf == "Marines" then
                Mon, Qname, Qdata, NameMon = "Trainee", "MarineQuest", 1, "Trainee"
                PosQ = CFrame.new(-2864, 41, 2200)
            else
                Mon, Qname, Qdata, NameMon = "Bandit", "BanditQuest1", 1, "Bandit"
                PosQ = CFrame.new(1038, 41, 1576)
            end
        elseif Level >= 10 and Level < 15 then
            Mon, Qname, Qdata, NameMon = "Monkey", "JungleQuest", 1, "Monkey"
            PosQ = CFrame.new(-1448, 50, 63)
        elseif Level >= 15 and Level < 30 then
            Mon, Qname, Qdata, NameMon = "Gorilla", "JungleQuest", 2, "Gorilla"
            PosQ = CFrame.new(-1142, 40, -515)
        elseif Level >= 30 and Level < 40 then
            Mon, Qname, Qdata, NameMon = "Pirate", "BuggyQuest1", 1, "Pirate"
            PosQ = CFrame.new(-1201, 40, 3857)
        elseif Level >= 40 and Level < 60 then
            Mon, Qname, Qdata, NameMon = "Brute", "BuggyQuest1", 2, "Brute"
            PosQ = CFrame.new(-1387, 24, 4100)
        elseif Level >= 60 and Level < 75 then
            Mon, Qname, Qdata, NameMon = "Desert Bandit", "DesertQuest", 1, "Desert Bandit"
            PosQ = CFrame.new(984, 16, 4417)
        elseif Level >= 75 and Level < 90 then
            Mon, Qname, Qdata, NameMon = "Desert Officer", "DesertQuest", 2, "Desert Officer"
            PosQ = CFrame.new(1547, 14, 4381)
        elseif Level >= 90 and Level < 100 then
            Mon, Qname, Qdata, NameMon = "Snow Bandit", "SnowQuest", 1, "Snow Bandit"
            PosQ = CFrame.new(1356, 105, -1328)
        elseif Level >= 100 and Level < 120 then
            Mon, Qname, Qdata, NameMon = "Snowman", "SnowQuest", 2, "Snowman"
            PosQ = CFrame.new(1218, 138, -1488)
        elseif Level >= 120 and Level < 150 then
            Mon, Qname, Qdata, NameMon = "Chief Petty Officer", "MarineQuest2", 1, "Chief Petty Officer"
            PosQ = CFrame.new(-4931, 65, 4121)
        elseif Level >= 150 and Level < 175 then
            Mon, Qname, Qdata, NameMon = "Sky Bandit", "SkyQuest", 1, "Sky Bandit"
            PosQ = CFrame.new(-4955, 365, -2908)
        elseif Level >= 175 and Level < 190 then
            Mon, Qname, Qdata, NameMon = "Dark Master", "SkyQuest", 2, "Dark Master"
            PosQ = CFrame.new(-5148, 439, -2332)
        elseif Level >= 190 and Level < 210 then
            Mon, Qname, Qdata, NameMon = "Prisoner", "PrisonerQuest", 1, "Prisoner"
            PosQ = CFrame.new(4937, 0, 649)
        elseif Level >= 210 and Level < 250 then
            Mon, Qname, Qdata, NameMon = "Dangerous Prisoner", "PrisonerQuest", 2, "Dangerous Prisoner"
            PosQ = CFrame.new(5099, 0, 1055)
        elseif Level >= 250 and Level < 275 then
            Mon, Qname, Qdata, NameMon = "Toga Warrior", "ColosseumQuest", 1, "Toga Warrior"
            PosQ = CFrame.new(-1872, 49, -2913)
        elseif Level >= 275 and Level < 300 then
            Mon, Qname, Qdata, NameMon = "Gladiator", "ColosseumQuest", 2, "Gladiator"
            PosQ = CFrame.new(-1521, 81, -3066)
        elseif Level >= 300 and Level < 325 then
            Mon, Qname, Qdata, NameMon = "Military Soldier", "MagmaQuest", 1, "Military Soldier"
            PosQ = CFrame.new(-5369, 61, 8556)
        elseif Level >= 325 and Level < 375 then
            Mon, Qname, Qdata, NameMon = "Military Spy", "MagmaQuest", 2, "Military Spy"
            PosQ = CFrame.new(-5787, 75, 8651)
        elseif Level >= 375 and Level < 400 then
            Mon, Qname, Qdata, NameMon = "Fishman Warrior", "FishmanQuest", 1, "Fishman Warrior"
            PosQ = CFrame.new(60844, 98, 1298)
        elseif Level >= 400 and Level < 450 then
            Mon, Qname, Qdata, NameMon = "Fishman Commando", "FishmanQuest", 2, "Fishman Commando"
            PosQ = CFrame.new(61738, 64, 1433)
        elseif Level >= 450 and Level < 475 then
            Mon, Qname, Qdata, NameMon = "God's Guard", "SkyExp1Quest", 1, "God's Guard"
            PosQ = CFrame.new(-4628, 866, -1931)
        elseif Level >= 475 and Level < 525 then
            Mon, Qname, Qdata, NameMon = "Shanda", "SkyExp1Quest", 2, "Shanda"
            PosQ = CFrame.new(-7685, 5601, -441)
        elseif Level >= 525 and Level < 550 then
            Mon, Qname, Qdata, NameMon = "Royal Squad", "SkyExp2Quest", 1, "Royal Squad"
            PosQ = CFrame.new(-7654, 5637, -1407)
        elseif Level >= 550 and Level < 625 then
            Mon, Qname, Qdata, NameMon = "Royal Soldier", "SkyExp2Quest", 2, "Royal Soldier"
            PosQ = CFrame.new(-7760, 5679, -1884)
        elseif Level >= 625 and Level < 650 then
            Mon, Qname, Qdata, NameMon = "Galley Pirate", "FountainQuest", 1, "Galley Pirate"
            PosQ = CFrame.new(5557, 152, 3998)
        elseif Level >= 650 then
            Mon, Qname, Qdata, NameMon = "Galley Captain", "FountainQuest", 2, "Galley Captain"
            PosQ = CFrame.new(5677, 92, 4966)
        end
    elseif World2 then
        if Level < 725 then
            Mon, Qname, Qdata, NameMon = "Raider", "Area1Quest", 1, "Raider"
            PosQ = CFrame.new(68, 93, 2429)
        elseif Level >= 725 and Level < 775 then
            Mon, Qname, Qdata, NameMon = "Mercenary", "Area1Quest", 2, "Mercenary"
            PosQ = CFrame.new(-864, 122, 1453)
        elseif Level >= 775 and Level < 800 then
            Mon, Qname, Qdata, NameMon = "Swan Pirate", "Area2Quest", 1, "Swan Pirate"
            PosQ = CFrame.new(1065, 137, 1324)
        elseif Level >= 800 and Level < 875 then
            Mon, Qname, Qdata, NameMon = "Factory Staff", "Area2Quest", 2, "Factory Staff"
            PosQ = CFrame.new(533, 128, 355)
        elseif Level >= 875 and Level < 900 then
            Mon, Qname, Qdata, NameMon = "Marine Lieutenant", "MarineQuest3", 1, "Marine Lieutenant"
            PosQ = CFrame.new(-2489, 84, -3151)
        elseif Level >= 900 and Level < 950 then
            Mon, Qname, Qdata, NameMon = "Marine Captain", "MarineQuest3", 2, "Marine Captain"
            PosQ = CFrame.new(-2335, 79, -3245)
        elseif Level >= 950 and Level < 975 then
            Mon, Qname, Qdata, NameMon = "Zombie", "ZombieQuest", 1, "Zombie"
            PosQ = CFrame.new(-5536, 101, -835)
        elseif Level >= 975 and Level < 1000 then
            Mon, Qname, Qdata, NameMon = "Vampire", "ZombieQuest", 2, "Vampire"
            PosQ = CFrame.new(-5806, 16, -1164)
        elseif Level >= 1000 and Level < 1050 then
            Mon, Qname, Qdata, NameMon = "Snow Trooper", "SnowMountainQuest", 1, "Snow Trooper"
            PosQ = CFrame.new(535, 432, -5484)
        elseif Level >= 1050 and Level < 1100 then
            Mon, Qname, Qdata, NameMon = "Winter Warrior", "SnowMountainQuest", 2, "Winter Warrior"
            PosQ = CFrame.new(1234, 456, -5174)
        elseif Level >= 1100 and Level < 1125 then
            Mon, Qname, Qdata, NameMon = "Lab Subordinate", "IceSideQuest", 1, "Lab Subordinate"
            PosQ = CFrame.new(-5720, 63, -4784)
        elseif Level >= 1125 and Level < 1175 then
            Mon, Qname, Qdata, NameMon = "Horned Warrior", "IceSideQuest", 2, "Horned Warrior"
            PosQ = CFrame.new(-6292, 91, -5502)
        elseif Level >= 1175 and Level < 1200 then
            Mon, Qname, Qdata, NameMon = "Magma Ninja", "FireSideQuest", 1, "Magma Ninja"
            PosQ = CFrame.new(-5461, 130, -5836)
        elseif Level >= 1200 and Level < 1250 then
            Mon, Qname, Qdata, NameMon = "Lava Pirate", "FireSideQuest", 2, "Lava Pirate"
            PosQ = CFrame.new(-5251, 55, -4774)
        elseif Level >= 1250 and Level < 1275 then
            Mon, Qname, Qdata, NameMon = "Ship Deckhand", "ShipQuest1", 1, "Ship Deckhand"
            PosQ = CFrame.new(921, 125, 33088)
            Entrance = Vector3.new(923.21252441406, 126.9760055542, 32852.83203125)
        elseif Level >= 1275 and Level < 1300 then
            Mon, Qname, Qdata, NameMon = "Ship Engineer", "ShipQuest1", 2, "Ship Engineer"
            PosQ = CFrame.new(886, 40, 32800)
            Entrance = Vector3.new(923.21252441406, 126.9760055542, 32852.83203125)
        elseif Level >= 1300 and Level < 1325 then
            Mon, Qname, Qdata, NameMon = "Ship Steward", "ShipQuest2", 1, "Ship Steward"
            PosQ = CFrame.new(943, 129, 33444)
            Entrance = Vector3.new(923.21252441406, 126.9760055542, 32852.83203125)
        elseif Level >= 1325 and Level < 1350 then
            Mon, Qname, Qdata, NameMon = "Ship Officer", "ShipQuest2", 2, "Ship Officer"
            PosQ = CFrame.new(955, 181, 33331)
            Entrance = Vector3.new(923.21252441406, 126.9760055542, 32852.83203125)
        elseif Level >= 1350 and Level < 1375 then
            Mon, Qname, Qdata, NameMon = "Arctic Warrior", "FrostQuest", 1, "Arctic Warrior"
            PosQ = CFrame.new(5935, 77, -6472)
        elseif Level >= 1375 and Level < 1425 then
            Mon, Qname, Qdata, NameMon = "Snow Lurker", "FrostQuest", 2, "Snow Lurker"
            PosQ = CFrame.new(5628, 57, -6618)
        elseif Level >= 1425 and Level < 1450 then
            Mon, Qname, Qdata, NameMon = "Sea Soldier", "ForgottenQuest", 1, "Sea Soldier"
            PosQ = CFrame.new(-3185, 58, -9663)
        elseif Level >= 1450 then
            Mon, Qname, Qdata, NameMon = "Water Fighter", "ForgottenQuest", 2, "Water Fighter"
            PosQ = CFrame.new(-3262, 298, -10552)
        end
    elseif World3 then
        if Level < 1525 then
            Mon, Qname, Qdata, NameMon = "Pirate Millionaire", "PiratePortQuest", 1, "Pirate Millionaire"
            PosQ = CFrame.new(-193, 56, 5755)
        elseif Level >= 1525 and Level < 1575 then
            Mon, Qname, Qdata, NameMon = "Pistol Billionaire", "PiratePortQuest", 2, "Pistol Billionaire"
            PosQ = CFrame.new(-188, 84, 6337)
        elseif Level >= 1575 and Level < 1600 then
            Mon, Qname, Qdata, NameMon = "Dragon Crew Warrior", "DragonCrewQuest", 1, "Dragon Crew Warrior"
            PosQ = CFrame.new(6615, 50, -978)
        elseif Level >= 1600 and Level < 1625 then
            Mon, Qname, Qdata, NameMon = "Dragon Crew Archer", "DragonCrewQuest", 2, "Dragon Crew Archer"
            PosQ = CFrame.new(6818, 483, 512)
        elseif Level >= 1625 and Level < 1650 then
            Mon, Qname, Qdata, NameMon = "Hydra Enforcer", "VenomCrewQuest", 1, "Hydra Enforcer"
            PosQ = CFrame.new(4547, 1001, 334)
        elseif Level >= 1650 and Level < 1700 then
            Mon, Qname, Qdata, NameMon = "Venomous Assailant", "VenomCrewQuest", 2, "Venomous Assailant"
            PosQ = CFrame.new(4637, 1077, 882)
        elseif Level >= 1700 and Level < 1725 then
            Mon, Qname, Qdata, NameMon = "Marine Commodore", "MarineTreeIsland", 1, "Marine Commodore"
            PosQ = CFrame.new(2198, 128, -7109)
        elseif Level >= 1725 and Level < 1775 then
            Mon, Qname, Qdata, NameMon = "Marine Rear Admiral", "MarineTreeIsland", 2, "Marine Rear Admiral"
            PosQ = CFrame.new(3294, 385, -7048)
        elseif Level >= 1775 and Level < 1800 then
            Mon, Qname, Qdata, NameMon = "Fishman Raider", "DeepForestIsland3", 1, "Fishman Raider"
            PosQ = CFrame.new(-10553, 521, -8176)
        elseif Level >= 1800 and Level < 1825 then
            Mon, Qname, Qdata, NameMon = "Fishman Captain", "DeepForestIsland3", 2, "Fishman Captain"
            PosQ = CFrame.new(-10789, 427, -9131)
        elseif Level >= 1825 and Level < 1850 then
            Mon, Qname, Qdata, NameMon = "Forest Pirate", "DeepForestIsland", 1, "Forest Pirate"
            PosQ = CFrame.new(-13489, 400, -7770)
        elseif Level >= 1850 and Level < 1900 then
            Mon, Qname, Qdata, NameMon = "Mythological Pirate", "DeepForestIsland", 2, "Mythological Pirate"
            PosQ = CFrame.new(-13508, 582, -6985)
        elseif Level >= 1900 and Level < 1925 then
            Mon, Qname, Qdata, NameMon = "Jungle Pirate", "DeepForestIsland2", 1, "Jungle Pirate"
            PosQ = CFrame.new(-12267, 459, -10277)
        elseif Level >= 1925 and Level < 1975 then
            Mon, Qname, Qdata, NameMon = "Musketeer Pirate", "DeepForestIsland2", 2, "Musketeer Pirate"
            PosQ = CFrame.new(-13291, 520, -9904)
        elseif Level >= 1975 and Level < 2000 then
            Mon, Qname, Qdata, NameMon = "Reborn Skeleton", "HauntedQuest1", 1, "Reborn Skeleton"
            PosQ = CFrame.new(-8761, 183, 6168)
        elseif Level >= 2000 and Level < 2025 then
            Mon, Qname, Qdata, NameMon = "Living Zombie", "HauntedQuest1", 2, "Living Zombie"
            PosQ = CFrame.new(-10103, 238, 6179)
        elseif Level >= 2025 and Level < 2050 then
            Mon, Qname, Qdata, NameMon = "Demonic Soul", "HauntedQuest2", 1, "Demonic Soul"
            PosQ = CFrame.new(-9712, 204, 6193)
        elseif Level >= 2050 and Level < 2075 then
            Mon, Qname, Qdata, NameMon = "Posessed Mummy", "HauntedQuest2", 2, "Posessed Mummy"
            PosQ = CFrame.new(-9545, 69, 6339)
        elseif Level >= 2075 and Level < 2100 then
            Mon, Qname, Qdata, NameMon = "Peanut Scout", "NutsIslandQuest", 1, "Peanut Scout"
            PosQ = CFrame.new(-2150, 122, -10358)
        elseif Level >= 2100 and Level < 2125 then
            Mon, Qname, Qdata, NameMon = "Peanut President", "NutsIslandQuest", 2, "Peanut President"
            PosQ = CFrame.new(-2150, 122, -10358)
        elseif Level >= 2125 and Level < 2150 then
            Mon, Qname, Qdata, NameMon = "Ice Cream Chef", "IceCreamIslandQuest", 1, "Ice Cream Chef"
            PosQ = CFrame.new(-789, 209, -11009)
        elseif Level >= 2150 and Level < 2200 then
            Mon, Qname, Qdata, NameMon = "Ice Cream Commander", "IceCreamIslandQuest", 2, "Ice Cream Commander"
            PosQ = CFrame.new(-789, 209, -11009)
        elseif Level >= 2200 and Level < 2225 then
            Mon, Qname, Qdata, NameMon = "Cookie Crafter", "CakeQuest1", 1, "Cookie Crafter"
            PosQ = CFrame.new(-2321, 36, -12216)
        elseif Level >= 2225 and Level < 2250 then
            Mon, Qname, Qdata, NameMon = "Cake Guard", "CakeQuest1", 2, "Cake Guard"
            PosQ = CFrame.new(-1418, 36, -12255)
        elseif Level >= 2250 and Level < 2275 then
            Mon, Qname, Qdata, NameMon = "Baking Staff", "CakeQuest2", 1, "Baking Staff"
            PosQ = CFrame.new(-1980, 36, -12983)
        elseif Level >= 2275 and Level < 2300 then
            Mon, Qname, Qdata, NameMon = "Head Baker", "CakeQuest2", 2, "Head Baker"
            PosQ = CFrame.new(-2251, 52, -13033)
        elseif Level >= 2300 and Level < 2325 then
            Mon, Qname, Qdata, NameMon = "Cocoa Warrior", "ChocQuest1", 1, "Cocoa Warrior"
            PosQ = CFrame.new(167, 26, -12238)
        elseif Level >= 2325 and Level < 2350 then
            Mon, Qname, Qdata, NameMon = "Chocolate Bar Battler", "ChocQuest1", 2, "Chocolate Bar Battler"
            PosQ = CFrame.new(701, 25, -12708)
        elseif Level >= 2350 and Level < 2375 then
            Mon, Qname, Qdata, NameMon = "Sweet Thief", "ChocQuest2", 1, "Sweet Thief"
            PosQ = CFrame.new(-140, 25, -12652)
        elseif Level >= 2375 and Level < 2401 then
            Mon, Qname, Qdata, NameMon = "Candy Rebel", "ChocQuest2", 2, "Candy Rebel"
            PosQ = CFrame.new(47, 25, -13029)
        elseif Level >= 2401 and Level < 2425 then
            Mon, Qname, Qdata, NameMon = "Candy Pirate", "CandyQuest1", 1, "Candy Pirate"
            PosQ = CFrame.new(-1437, 17, -14385)
        elseif Level >= 2425 and Level < 2450 then
            Mon, Qname, Qdata, NameMon = "Snow Demon", "CandyQuest1", 2, "Snow Demon"
            PosQ = CFrame.new(-916, 17, -14638)
        elseif Level >= 2450 and Level < 2475 then
            Mon, Qname, Qdata, NameMon = "Isle Outlaw", "TikiQuest1", 1, "Isle Outlaw"
            PosQ = CFrame.new(-16162, 11, -96)
        elseif Level >= 2475 and Level < 2500 then
            Mon, Qname, Qdata, NameMon = "Island Boy", "TikiQuest1", 2, "Island Boy"
            PosQ = CFrame.new(-16357, 20, 1005)
        elseif Level >= 2500 and Level < 2525 then
            Mon, Qname, Qdata, NameMon = "Sun-kissed Warrior", "TikiQuest2", 1, "Sun-kissed Warrior"
            PosQ = CFrame.new(-16357, 20, 1005)
        elseif Level >= 2525 and Level < 2550 then
            Mon, Qname, Qdata, NameMon = "Isle Champion", "TikiQuest2", 2, "Isle Champion"
            PosQ = CFrame.new(-16848, 21, 1041)
        elseif Level >= 2550 and Level < 2575 then
            Mon, Qname, Qdata, NameMon = "Serpent Hunter", "TikiQuest3", 1, "Serpent Hunter"
            PosQ = CFrame.new(-16621, 121, 1290)
        elseif Level >= 2575 and Level < 2600 then
            Mon, Qname, Qdata, NameMon = "Skull Slayer", "TikiQuest3", 2, "Skull Slayer"
            PosQ = CFrame.new(-16811, 84, 1542)
        elseif Level >= 2600 and Level < 2625 then
            Mon, Qname, Qdata, NameMon = "Reef Bandit", "SubmergedQuest1", 1, "Reef Bandit"
            PosQ = CFrame.new(10951, -2159, 9150)
        elseif Level >= 2625 and Level < 2650 then
            Mon, Qname, Qdata, NameMon = "Coral Pirate", "SubmergedQuest1", 2, "Coral Pirate"
            PosQ = CFrame.new(10744, -2087, 9343)
        elseif Level >= 2650 and Level < 2675 then
            Mon, Qname, Qdata, NameMon = "Sea Chanter", "SubmergedQuest2", 1, "Sea Chanter"
            PosQ = CFrame.new(10661, -2087, 10088)
        elseif Level >= 2675 and Level < 2700 then
            Mon, Qname, Qdata, NameMon = "Ocean Prophet", "SubmergedQuest2", 2, "Ocean Prophet"
            PosQ = CFrame.new(11050, -2001, 10142)
        elseif Level >= 2700 then
            Mon, Qname, Qdata, NameMon = "Grand Devotee", "SubmergedQuest3", 2, "Grand Devotee"
            PosQ = CFrame.new(9568, -1993, 9857)
        end
    end

    if PosQ then PosM = PosQ end
    return {
        Mon = Mon,
        Qname = Qname,
        Qdata = Qdata,
        NameMon = NameMon,
        PosQ = PosQ,
        PosM = PosM,
        Entrance = Entrance
    }
end

--// ================== BRING MOB SYSTEM ==================
task.spawn(function()
    while task.wait(0.2) do
        pcall(function()
            if not AutoFarm then return end
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

--// ================== AUTO BUSO (AURA) ==================
task.spawn(function()
    while task.wait(1) do
        pcall(function()
            if AutoBuso and Player.Character then
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
            if data and data:FindFirstChild("Level") and data.Level.Value >= 60 then
                replicated.Remotes.CommF_:InvokeServer("BuyHaki", "Geppo")
                replicated.Remotes.CommF_:InvokeServer("BuyHaki", "Soru")
                replicated.Remotes.CommF_:InvokeServer("BuyHaki", "Buso")
            end
        end)
    end
end)

--// ================== AUTO EQUIP MELEE ==================
task.spawn(function()
    while task.wait(0.5) do
        pcall(function()
            if AutoEquipMelee and Player.Character then
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
                local melee = Player.Data.Stats.Melee.Level
                local defense = Player.Data.Stats.Defense.Level
                if melee.Value < 2650 then
                    replicated.Remotes.CommF_:InvokeServer("AddPoint", "Melee", points.Value)
                elseif defense.Value < 2550 then
                    replicated.Remotes.CommF_:InvokeServer("AddPoint", "Defense", points.Value)
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

            LevelLabel.Text = "Level: " .. tostring(levelObj.Value)

            -- Travel to Sea 2
            if World1 and levelObj.Value >= 700 then
                TargetLabel.Text = "Target: Traveling to Sea 2"
                UpdateStatus("Traveling to Sea 2")
                local iceMap = Workspace.Map:FindFirstChild("Ice")
                local iceDoor = iceMap and iceMap:FindFirstChild("Door")
                if iceDoor then
                    if iceDoor.CanCollide == true and iceDoor.Transparency == 0 then
                        replicated.Remotes.CommF_:InvokeServer("DressrosaQuestProgress", "Detective")
                        local key = Player.Backpack:FindFirstChild("Key") or char:FindFirstChild("Key")
                        if key and key.Parent == Player.Backpack then
                            char.Humanoid:EquipTool(key)
                        end
                        TweenTo(CFrame.new(1347.7124, 37.3751602, -1325.6488))
                    elseif iceDoor.CanCollide == false and iceDoor.Transparency == 1 then
                        local iceAdmiral = Workspace.Enemies:FindFirstChild("Ice Admiral")
                        if iceAdmiral and iceAdmiral:FindFirstChild("Humanoid") and iceAdmiral.Humanoid.Health > 0 and iceAdmiral:FindFirstChild("HumanoidRootPart") then
                            local targetPos = iceAdmiral.HumanoidRootPart.Position + Vector3.new(0, 14, 0)
                            TweenTo(CFrame.new(targetPos, iceAdmiral.HumanoidRootPart.Position))
                        else
                            TweenTo(CFrame.new(1347.7124, 37.3751602, -1325.6488))
                            if (char.HumanoidRootPart.Position - Vector3.new(1347.7124, 37.3751602, -1325.6488)).Magnitude < 15 then
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
            if World2 and levelObj.Value >= 1500 then
                TargetLabel.Text = "Target: Traveling to Sea 3"
                UpdateStatus("Traveling to Sea 3")
                replicated.Remotes.CommF_:InvokeServer("TravelZou")
                task.wait(1)
                return
            end

            local questData = GetQuestData()
            if not questData or not questData.PosM then
                TargetLabel.Text = "Target: None"
                UpdateStatus("Max Level / Unknown")
                return
            end

            TargetLabel.Text = "Target: " .. tostring(questData.NameMon)
            UpdateStatus("Leveling: " .. questData.NameMon)

            if questData.Entrance then
                if (char.HumanoidRootPart.Position - questData.PosQ.Position).Magnitude > 500 then
                    replicated.Remotes.CommF_:InvokeServer("requestEntrance", questData.Entrance)
                end
            end

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
        if not success then
            ShowError(err)
        end
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

--// ================== HIGHLIGHT CHARACTER ==================
task.spawn(function()
    while task.wait(1) do
        pcall(function()
            if Player.Character and not Player.Character:FindFirstChild("Highlight") then
                local highlight = Instance.new("Highlight")
                highlight.Name = "Highlight"
                highlight.FillColor = Color3.fromRGB(255, 0, 0)
                highlight.OutlineColor = Color3.fromRGB(255, 0, 0)
                highlight.FillTransparency = 0.5
                highlight.Adornee = Player.Character
                highlight.Parent = Player.Character
            end
        end)
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
                    if stuckTime >= 30 then
                        HopLowServer(9)
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

UpdateStatus("Ready")
--[[
   ╔══════════════════════════════════════════════════════════════╗
   ║     ASTRAL HUB - ULTIMATE MEGA MERGE (PART 2 – REWRITTEN)   ║
   ║   Advanced Systems: Cyborg, Sea, Mirage, V4, Dojo, Prehis,  ║
   ║   Fishing, Materials, Boss, ESP, Fast Attacks, Inf Abilities ║
   ║   All features driven by Configs extended in Part 1          ║
   ╚══════════════════════════════════════════════════════════════╝
--]]

--// ================== CONFIGS EXTENSION (already in Part1, but we re‑ensure) ==================
getgenv().Configs = getgenv().Configs or {}
getgenv().Configs.AutoCyborg         = false
getgenv().Configs.SeaEvents          = { Enable=false, DangerLevel="Lv 1", SelectedBoat="Guardian", AutoSail=false,
                                        KillShark=false, KillTerrorShark=false, KillPiranha=false,
                                        KillFishCrew=false, KillHauntedCrew=false, KillPirateGrandBrigade=false,
                                        KillFishBoat=false, KillSeaBeast=false, KillLeviathan=false,
                                        KitsuneIsland=false, ShrineActive=false, CollectAzureEmber=false,
                                        TradeAzureEmber=false, AutoFactory=false, AutoPirateRaid=false,
                                        HopLowPing=false }
getgenv().Configs.Mirage             = { FindMirage=false, HighestPoint=false, CollectGear=false }
getgenv().Configs.RaceV4             = { CompleteTrials=false, TrainV4=false, TeleportToDoors=false, KillPlayerAfterTrial=false }
getgenv().Configs.Dragon             = { DojoBelt=false, FarmBlazeEmber=false, UpgradeDraco=false, DragoV1=false, DragoV2=false, DragoV3=false, TrainDragoV4=false }
getgenv().Configs.Prehistoric        = { FindIsland=false, PatchEvent=false, CollectDinoBones=false, CollectDragonEggs=false, ResetWhenComplete=false, SelectedBoat="Guardian" }
getgenv().Configs.Fishing            = { Enable=false, Rod="Fishing Rod", Bait="Basic Bait" }
getgenv().Configs.MaterialFarm       = { Enable=false, SelectedMaterial=nil }
getgenv().Configs.BossFarming        = {}
getgenv().Configs.ESP                = { Players=false, Fruits=false, Chests=false, IslandLocations=false, Berries=false }
getgenv().Configs.Misc               = { PanicMode=false, RemoveHitVFX=false, DisableNotifications=false, ObservationFarm=false, AutoCitizenQuest=false, AutoTrainingDummy=false, AutoRandomBone=false }
getgenv().Configs.FastAttack         = true
getgenv().Configs.InfiniteAbilities  = false

--// ----------------------------------------------------------------
--  AUTO CYBORG CHEST FARMING (from chest4_optimized.lua)
--// ----------------------------------------------------------------
local CyborgChestCount = 0
local CyborgFistDetected = false
local CyborgFightingBoss = false
local CyborgServerStart = tick()

function HasFistOfDarkness()
    local function check(c) for _, i in pairs(c:GetChildren()) do if i.Name=="Fist of Darkness" then return true end end return false end
    return check(Player.Backpack) or (Player.Character and check(Player.Character))
end

function HasCoreBrain()
    local function check(c) for _, i in pairs(c:GetChildren()) do if i.Name=="Core Brain" then return true end end return false end
    return check(Player.Backpack) or (Player.Character and check(Player.Character))
end

function HasMicrochip()
    for _, i in pairs(Player.Backpack:GetChildren()) do if i.Name=="Microchip" then return true end end
    if Player.Character then for _, i in pairs(Player.Character:GetChildren()) do if i.Name=="Microchip" then return true end end end
    return false
end

function BuyMicrochip()
    if HasMicrochip() then return true end
    replicated.Remotes.CommF_:InvokeServer("BlackbeardReward","Microchip","2")
    task.wait(1)
    return HasMicrochip()
end

function BuyCyborgRace()
    replicated.Remotes.CommF_:InvokeServer("CyborgTrainer","Buy")
    task.wait(2)
    local ok, _ = pcall(function() return Player.Data.Race.Value=="Cyborg" end)
    return ok and _
end

function EquipCoreBrain()
    for _, t in pairs(Player.Backpack:GetChildren()) do
        if t.Name=="Core Brain" then Player.Character.Humanoid:EquipTool(t); return true end
    end
    return false
end

function IsCyborg()
    local ok, _ = pcall(function() return Player.Data.Race.Value=="Cyborg" end)
    return ok and _
end

function GetChest()
    local maxDist = 9999; local nearestChest = nil
    local hrp = Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    for _, v in ipairs(Workspace.Map:GetDescendants()) do
        if string.find(v.Name:lower(),"chest") and v:FindFirstChild("TouchInterest") then
            local dist = (v.Position - hrp.Position).Magnitude
            if dist < maxDist then maxDist = dist; nearestChest = v end
        end
    end
    return nearestChest
end

function FindClickDetector()
    for _, v in ipairs(Workspace:GetDescendants()) do
        if v.Name=="ClickDetector" and v.Parent and v.Parent.Name=="Main"
            and v.Parent.Parent and v.Parent.Parent.Name=="Button"
            and v.Parent.Parent.Parent and v.Parent.Parent.Parent.Name=="RaidSummon" then
            return v, v.Parent.Position
        end
    end
    return nil, nil
end

function ClickDetectorSafe()
    local detector, pos = FindClickDetector()
    if detector then
        if pos and Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
            local dist = (pos - Player.Character.HumanoidRootPart.Position).Magnitude
            if dist > 32 then Player.Character.HumanoidRootPart.CFrame = CFrame.new(pos)+Vector3.new(0,2,0); task.wait(0.5) end
        end
        pcall(function() fireclickdetector(detector) end)
        task.wait(0.3)
        pcall(function() fireclickdetector(detector) end)
        return true
    end
    return false
end

task.spawn(function()
    while task.wait(0.5) do
        if not getgenv().Configs.AutoCyborg then continue end
        pcall(function()
            if IsCyborg() then getgenv().Configs.AutoCyborg=false; UpdateStatus("Cyborg Race Acquired!"); return end
            if HasCoreBrain() and not IsCyborg() then
                EquipCoreBrain(); ClickDetectorSafe(); task.wait(5)
                if BuyCyborgRace() then getgenv().Configs.AutoCyborg=false; UpdateStatus("Cyborg Purchased!") return end
            end
            if HasFistOfDarkness() and not CyborgFistDetected then
                CyborgFistDetected = true; UpdateStatus("Fist of Darkness found!")
                if not HasMicrochip() then BuyMicrochip() end
                if HasMicrochip() then
                    ClickDetectorSafe(); task.wait(3)
                    if CheckBoss("Order") then
                        CyborgFightingBoss = true
                        while CheckBoss("Order") do task.wait(1) end
                        CyborgFightingBoss = false
                        if HasCoreBrain() and not IsCyborg() then
                            EquipCoreBrain(); ClickDetectorSafe(); task.wait(5); BuyCyborgRace()
                        end
                    end
                else
                    local chest = GetChest()
                    if chest then TweenTo(CFrame.new(chest.Position)); CyborgChestCount = CyborgChestCount+1 end
                end
            else
                local chest = GetChest()
                if chest then TweenTo(CFrame.new(chest.Position)); CyborgChestCount = CyborgChestCount+1 end
            end
            if tick()-CyborgServerStart > 900 then HopLowServer(10); CyborgServerStart=tick() end
        end)
    end
end)

--// ----------------------------------------------------------------
--  SEA EVENTS (full) from Gay Hub
--// ----------------------------------------------------------------
local function CheckBoat()
    for _, b in ipairs(Workspace.Boats:GetChildren()) do if b.Owner.Value==Player.Name then return b end end
    return nil
end

local function SitOnBoat(boat)
    local char = Player.Character
    if char and boat and boat:FindFirstChild("VehicleSeat") then
        TweenTo(boat.VehicleSeat.CFrame*CFrame.new(0,2,0)); task.wait(1)
        if char.Humanoid and char.Humanoid.Sit==false then char.Humanoid.Sit = true end
    end
end

task.spawn(function()
    while task.wait(1) do
        local cfg = getgenv().Configs.SeaEvents
        if not cfg.Enable then continue end
        pcall(function()
            if cfg.AutoSail then
                local boat = CheckBoat()
                if not boat then
                    TweenTo(CFrame.new(-16927.451,9.086,433.864))
                    if (Player.Character.HumanoidRootPart.Position-Vector3.new(-16927.451,9.086,433.864)).Magnitude<10 then
                        replicated.Remotes.CommF_:InvokeServer("BuyBoat",cfg.SelectedBoat)
                    end
                else
                    if Player.Character.Humanoid.Sit==false then SitOnBoat(boat)
                    else
                        local zone = cfg.DangerLevel
                        local pos = Vector3.new(-21998,30,-682)
                        if zone=="Lv 2" then pos=Vector3.new(-26780,30,-823)
                        elseif zone=="Lv 3" then pos=Vector3.new(-31172,30,-2257)
                        elseif zone=="Lv 4" then pos=Vector3.new(-34055,30,-2560)
                        elseif zone=="Lv 5" then pos=Vector3.new(-38888,30,-2163)
                        elseif zone=="Lv 6" then pos=Vector3.new(-44542,30,-1245)
                        elseif zone=="Lv Infinite" then pos=Vector3.new(-10000000,31,37016.25) end
                        TweenTo(CFrame.new(pos))
                    end
                end
            end
            local targets = {}
            if cfg.KillShark then table.insert(targets,"Shark") end
            if cfg.KillTerrorShark then table.insert(targets,"Terrorshark") end
            if cfg.KillPiranha then table.insert(targets,"Piranha") end
            if cfg.KillFishCrew then table.insert(targets,"Fish Crew Member") end
            if cfg.KillHauntedCrew then table.insert(targets,"Haunted Crew Member") end
            if cfg.KillFishBoat then table.insert(targets,"FishBoat") end
            if cfg.KillPirateGrandBrigade then table.insert(targets,"PirateBrigade") end
            for _, name in ipairs(targets) do
                local entity = GetAliveBoss(name)
                if entity then TweenTo(entity.HumanoidRootPart.CFrame*CFrame.new(0,20,0)); break end
            end
            if cfg.KillSeaBeast then
                for _, sb in ipairs(Workspace.SeaBeasts:GetChildren()) do
                    if sb:FindFirstChild("Health") and sb.Health.Value>0 and sb:FindFirstChild("HumanoidRootPart") then
                        TweenTo(sb.HumanoidRootPart.CFrame*CFrame.new(0,200,0)); break
                    end
                end
            end
            if cfg.KillLeviathan then
                local lev = Workspace.SeaBeasts:FindFirstChild("Leviathan")
                if lev and lev:FindFirstChild("Health") and lev.Health.Value>0 and lev:FindFirstChild("HumanoidRootPart") then
                    TweenTo(lev.HumanoidRootPart.CFrame*CFrame.new(0,200,0))
                end
            end
            if cfg.KitsuneIsland then
                local island = Workspace._WorldOrigin.Locations:FindFirstChild("Kitsune Island",true)
                if island then
                    if cfg.ShrineActive then
                        local shrine = Workspace.Map:FindFirstChild("KitsuneIsland")
                        if shrine and shrine:FindFirstChild("ShrineActive") then
                            for _, part in ipairs(shrine.ShrineActive:GetDescendants()) do
                                if part.Name=="NeonShrinePart" and part:IsA("BasePart") then
                                    TweenTo(part.CFrame*CFrame.new(0,2,0))
                                    replicated.Modules.Net:FindFirstChild("RE/TouchKitsuneStatue"):FireServer()
                                    break
                                end
                            end
                        end
                    end
                    if cfg.CollectAzureEmber then
                        local ember = Workspace:FindFirstChild("AttachedAzureEmber") or Workspace:FindFirstChild("EmberTemplate")
                        if ember then TweenTo(ember.Part.CFrame) end
                    end
                    if cfg.TradeAzureEmber then
                        replicated.Modules.Net:FindFirstChild("RF/KitsuneStatuePray"):InvokeServer()
                    end
                end
            end
        end)
    end
end)

--// ----------------------------------------------------------------
--  MIRAGE ISLAND FINDER & GEAR COLLECT
--// ----------------------------------------------------------------
task.spawn(function()
    while task.wait(1) do
        if not getgenv().Configs.Mirage.FindMirage then continue end
        pcall(function()
            if not Workspace._WorldOrigin.Locations:FindFirstChild("Mirage Island",true) then
                local boat = CheckBoat()
                if not boat then
                    TweenTo(CFrame.new(-16927.451,9.086,433.864))
                    task.wait(1)
                    replicated.Remotes.CommF_:InvokeServer("BuyBoat","Guardian")
                else
                    if Player.Character.Humanoid.Sit==false then SitOnBoat(boat)
                    else TweenTo(CFrame.new(Vector3.new(-10000000,31,37016.25))) end
                end
            else
                local island = Workspace._WorldOrigin.Locations:FindFirstChild("Mirage Island")
                if island then TweenTo(island.CFrame*CFrame.new(0,300,0)) end
            end
        end)
    end
end)

task.spawn(function()
    while task.wait(0.2) do
        if not getgenv().Configs.Mirage.CollectGear then continue end
        pcall(function()
            for _, part in ipairs(Workspace.Map.MysticIsland:GetDescendants()) do
                if part.Name=="Part" and part:IsA("MeshPart") then TweenTo(part.CFrame); break end
            end
        end)
    end
end)

--// ----------------------------------------------------------------
--  RACE V4 TRIALS COMPLETE + KILL PLAYER AFTER TRIAL
--// ----------------------------------------------------------------
task.spawn(function()
    while task.wait(0.5) do
        if not getgenv().Configs.RaceV4.CompleteTrials then continue end
        pcall(function()
            local race = Player.Data.Race.Value
            if race=="Mink" then
                local t = Workspace.Map:FindFirstChild("MinkTrial"); if t then TweenTo(t.Ceiling.CFrame*CFrame.new(0,-20,0)) end
            elseif race=="Fishman" then
                for _, sb in ipairs(Workspace.SeaBeasts:GetChildren()) do
                    if sb:FindFirstChild("Health") and sb.Health.Value>0 and sb:FindFirstChild("HumanoidRootPart") then
                        TweenTo(sb.HumanoidRootPart.CFrame*CFrame.new(0,200,0)); break
                    end
                end
            elseif race=="Cyborg" then
                local t = Workspace.Map:FindFirstChild("CyborgTrial"); if t then TweenTo(t.Floor.CFrame*CFrame.new(0,500,0)) end
            elseif race=="Skypiea" then
                local t = Workspace.Map:FindFirstChild("SkyTrial")
                if t and t.Model:FindFirstChild("FinishPart") then TweenTo(t.Model.FinishPart.CFrame) end
            elseif race=="Human" or race=="Ghoul" then
                local m = GetAliveBoss("Ancient Vampire") or GetAliveBoss("Ancient Zombie")
                if m then TweenTo(m.HumanoidRootPart.CFrame*CFrame.new(0,20,0)) end
            end
        end)
    end
end)

task.spawn(function()
    while task.wait(0.2) do
        if not getgenv().Configs.RaceV4.KillPlayerAfterTrial then continue end
        for _, p in ipairs(Players:GetPlayers()) do
            if p~=Player and p.Character and p.Character:FindFirstChild("HumanoidRootPart") and p.Character.Humanoid.Health>0 then
                if (Player.Character.HumanoidRootPart.Position-p.Character.HumanoidRootPart.Position).Magnitude<250 then
                    TweenTo(p.Character.HumanoidRootPart.CFrame*CFrame.new(0,0,15)); break
                end
            end
        end
    end
end)

--// ----------------------------------------------------------------
--  DRAGON DOJO BELT QUESTS
--// ----------------------------------------------------------------
task.spawn(function()
    while task.wait(0.5) do
        if not getgenv().Configs.Dragon.DojoBelt then continue end
        pcall(function()
            local net = replicated.Modules.Net:FindFirstChild("RF/InteractDragonQuest")
            if not net then return end
            local result = net:InvokeServer({NPC="Dojo Trainer",Command="RequestQuest"})
            if not result then
                net:InvokeServer({NPC="Dojo Trainer",Command="ClaimQuest"})
            else
                local belt = result.Quest and result.Quest.BeltName
                if belt=="White" then local m=GetAliveBoss("Skull Slayer"); if m then TweenTo(m.HumanoidRootPart.CFrame*CFrame.new(0,20,0)) end
                elseif belt=="Yellow" then getgenv().Configs.SeaEvents.Enable=true; getgenv().Configs.SeaEvents.KillSeaBeast=true; getgenv().Configs.SeaEvents.AutoSail=true
                elseif belt=="Green" then getgenv().Configs.SeaEvents.AutoSail=true
                elseif belt=="Red" then getgenv().Configs.SeaEvents.KillFishBoat=true; getgenv().Configs.SeaEvents.AutoSail=true
                elseif belt=="Black" then getgenv().Configs.Prehistoric.FindIsland=true
                end
            end
        end)
    end
end)

--// ----------------------------------------------------------------
--  PREHISTORIC ISLAND (FINDER + EVENT PATCHER + GOLEM KILLER)
--// ----------------------------------------------------------------
task.spawn(function()
    while task.wait(1) do
        if not getgenv().Configs.Prehistoric.FindIsland then continue end
        pcall(function()
            if not Workspace._WorldOrigin.Locations:FindFirstChild("Prehistoric Island",true) then
                local boat = CheckBoat()
                if not boat then
                    TweenTo(CFrame.new(-16927.451,9.086,433.864))
                    task.wait(1)
                    replicated.Remotes.CommF_:InvokeServer("BuyBoat",getgenv().Configs.Prehistoric.SelectedBoat or "Guardian")
                else
                    if Player.Character.Humanoid.Sit==false then SitOnBoat(boat)
                    else TweenTo(CFrame.new(Vector3.new(-10000000,31,37016.25))) end
                end
            else
                TweenTo(Workspace._WorldOrigin.Locations["Prehistoric Island"].CFrame*CFrame.new(0,500,0))
            end
        end)
    end
end)

task.spawn(function()
    while task.wait(0.5) do
        if not getgenv().Configs.Prehistoric.PatchEvent then continue end
        pcall(function()
            local pre = Workspace.Map:FindFirstChild("PrehistoricIsland")
            if not pre then return end
            for _, obj in ipairs(pre:GetDescendants()) do
                if obj.Name:lower():find("lava") and (obj:IsA("Part") or obj:IsA("MeshPart")) then obj:Destroy() end
            end
            local golem = nil
            for _, name in ipairs({"Lava Golem","Aura Golem","Stone Golem","Rock Golem"}) do
                golem = GetAliveMonster(name); if golem then break end
            end
            if golem then
                golem.Humanoid.WalkSpeed=0; golem.HumanoidRootPart.CanCollide=false
                TweenTo(golem.HumanoidRootPart.CFrame*CFrame.new(0,30,0)); AutoHaki()
            end
            -- Hit volcano rocks
            local rock = nil
            pcall(function()
                local vr = pre.Core.VolcanoRocks
                for _, m in ipairs(vr:GetChildren()) do
                    if m:IsA("Model") then
                        local vrock = m:FindFirstChild("volcanorock")
                        if vrock and vrock:IsA("MeshPart") and (vrock.Color==Color3.fromRGB(185,53,56) or vrock.Color==Color3.fromRGB(185,53,57)) then rock=vrock; break end
                        local vfx = m:FindFirstChild("VFXLayer"); local at0 = vfx and vfx:FindFirstChild("At0")
                        local glow = at0 and at0:FindFirstChild("Glow")
                        if glow and glow.Enabled then rock=vfx; break end
                    end
                end
            end)
            if rock then TweenTo(CFrame.new(rock.Position+Vector3.new(0,5,0))); AutoHaki() end
        end)
    end
end)

--// ----------------------------------------------------------------
--  DRAGO V1-V3
--// ----------------------------------------------------------------
task.spawn(function()
    while task.wait(3) do
        if not getgenv().Configs.Dragon.DragoV1 then continue end
        pcall(function()
            if CheckItem("Dragon Egg")<1 then
                getgenv().Configs.Prehistoric.FindIsland=true; getgenv().Configs.Prehistoric.PatchEvent=true; getgenv().Configs.Prehistoric.CollectDragonEggs=true
            else
                getgenv().Configs.Prehistoric.FindIsland=false; getgenv().Configs.Prehistoric.PatchEvent=false; getgenv().Configs.Prehistoric.CollectDragonEggs=false
            end
        end)
    end
end)

task.spawn(function()
    while task.wait(1) do
        if not getgenv().Configs.Dragon.DragoV2 then continue end
        pcall(function()
            local flowers = Workspace:FindFirstChild("FireFlowers")
            if not flowers then
                local mob = GetAliveMonster("Forest Pirate")
                if mob then TweenTo(mob.HumanoidRootPart.CFrame*CFrame.new(0,20,0)) else TweenTo(CFrame.new(-13206,426,-7965)) end
            else
                for _, flower in ipairs(flowers:GetChildren()) do
                    if flower:IsA("Model") and flower.PrimaryPart then
                        local d = (flower.PrimaryPart.Position-Player.Character.HumanoidRootPart.Position).Magnitude
                        if d<=100 then
                            VirtualInputManager:SendKeyEvent(true,"E",false,game); task.wait(1.5); VirtualInputManager:SendKeyEvent(false,"E",false,game)
                        else TweenTo(CFrame.new(flower.PrimaryPart.Position)) end
                    end
                end
            end
        end)
    end
end)

task.spawn(function()
    while task.wait(2) do
        if not getgenv().Configs.Dragon.DragoV3 then continue end
        pcall(function()
            getgenv().Configs.SeaEvents.Enable=true; getgenv().Configs.SeaEvents.KillTerrorShark=true; getgenv().Configs.SeaEvents.AutoSail=true; getgenv().Configs.SeaEvents.DangerLevel="Lv Infinite"
            if not CheckBoss("Terrorshark") then getgenv().Configs.Dragon.DragoV3=false end
        end)
    end
end)

--// ----------------------------------------------------------------
--  FISHING
--// ----------------------------------------------------------------
task.spawn(function()
    while task.wait(1) do
        if not getgenv().Configs.Fishing.Enable then continue end
        pcall(function()
            local rod = getgenv().Configs.Fishing.Rod; local char = Player.Character
            if not char then return end
            if not char:FindFirstChild(rod) then
                local r = Player.Backpack:FindFirstChild(rod)
                if r then char.Humanoid:EquipTool(r); task.wait(0.5) else replicated.Remotes.CommF_:InvokeServer("LoadItem",rod,{"Gear"}) end
            end
            local tool = char:FindFirstChild(rod)
            if tool then
                local state = tool:GetAttribute("ServerState") or tool:GetAttribute("State")
                local fr = replicated:FindFirstChild("FishReplicated")
                if fr then
                    local req = fr:FindFirstChild("FishingRequest")
                    if req then
                        if state=="Biting" then req:InvokeServer("Catching",1); task.wait(0.25); req:InvokeServer("Catch",1)
                        elseif state=="ReeledIn" or state=="Idle" or not state then
                            req:InvokeServer("StartCasting"); task.wait(0.7)
                            local cast = char.HumanoidRootPart.Position+Vector3.new(0,-10,0)
                            req:InvokeServer("CastLineAtLocation",cast,100,true)
                        end
                    end
                end
            end
        end)
    end
end)

--// ----------------------------------------------------------------
--  MATERIAL FARMING (per world lists)
--// ----------------------------------------------------------------
function GetMaterialMobs(mat)
    if World1 then
        if mat=="Angel Wings" then return {"Shanda","Royal Squad","Royal Soldier","Wysper","Thunder God"},CFrame.new(-4698,845,-1912)
        elseif mat=="Leather + Scrap Metal" then return {"Brute","Pirate"},CFrame.new(-1145,15,4350)
        elseif mat=="Magma Ore" then return {"Military Soldier","Military Spy","Magma Admiral"},CFrame.new(-5815,84,8820)
        elseif mat=="Fish Tail" then return {"Fishman Warrior","Fishman Commando","Fishman Lord"},CFrame.new(61123,19,1569)
        end
    elseif World2 then
        if mat=="Leather + Scrap Metal" then return {"Marine Captain"},CFrame.new(-2010,73,-3326)
        elseif mat=="Magma Ore" then return {"Magma Ninja","Lava Pirate"},CFrame.new(-5428,78,-5959)
        elseif mat=="Ectoplasm" then return {"Ship Deckhand","Ship Engineer","Ship Steward","Ship Officer"},CFrame.new(911,125,33159)
        elseif mat=="Mystic Droplet" then return {"Water Fighter"},CFrame.new(-3385,239,-10542)
        elseif mat=="Radioactive Material" then return {"Factory Staff"},CFrame.new(295,73,-56)
        elseif mat=="Vampire Fang" then return {"Vampire"},CFrame.new(-6033,7,-1317)
        end
    elseif World3 then
        if mat=="Scrap Metal" then return {"Jungle Pirate","Forest Pirate"},CFrame.new(-11975,331,-10620)
        elseif mat=="Fish Tail" then return {"Fishman Raider","Fishman Captain"},CFrame.new(-10993,332,-8940)
        elseif mat=="Conjured Cocoa" then return {"Chocolate Bar Battler","Cocoa Warrior"},CFrame.new(620,78,-12581)
        elseif mat=="Dragon Scale" then return {"Dragon Crew Archer","Dragon Crew Warrior"},CFrame.new(6594,383,139)
        elseif mat=="Gunpowder" then return {"Pistol Billionaire"},CFrame.new(-84,85,6132)
        elseif mat=="Mini Tusk" then return {"Mythological Pirate"},CFrame.new(-13545,470,-6917)
        elseif mat=="Demonic Wisp" then return {"Demonic Soul"},CFrame.new(-9495,453,5977)
        end
    end
    return nil, nil
end

task.spawn(function()
    while task.wait(0.5) do
        local cfg = getgenv().Configs.MaterialFarm
        if not cfg.Enable or not cfg.SelectedMaterial then continue end
        pcall(function()
            local mobs, pos = GetMaterialMobs(cfg.SelectedMaterial)
            if not mobs then return end
            local target = nil
            for _, m in ipairs(mobs) do target = GetAliveMonster(m); if target then break end end
            if target then TweenTo(target.HumanoidRootPart.CFrame*CFrame.new(0,15,0)) elseif pos then TweenTo(pos) end
        end)
    end
end)

--// ----------------------------------------------------------------
--  EXTENDED BOSS FARMING (all worlds)
--// ----------------------------------------------------------------
local allBosses = {
    {Name="The Gorilla King",World=1},{Name="Bobby",World=1},{Name="Yeti",World=1},
    {Name="Mob Leader",World=1},{Name="Vice Admiral",World=1},{Name="Warden",World=1},{Name="Chief Warden",World=1},
    {Name="Swan",World=1},{Name="Magma Admiral",World=1},{Name="Fishman Lord",World=1},{Name="Wysper",World=1},
    {Name="Thunder God",World=1},{Name="Cyborg",World=1},
    {Name="Diamond",World=2},{Name="Jeremy",World=2},{Name="Fajita",World=2},{Name="Don Swan",World=2},
    {Name="Smoke Admiral",World=2},{Name="Awakened Ice Admiral",World=2},{Name="Tide Keeper",World=2},
    {Name="Darkbeard",World=2},{Name="Cursed Captain",World=2},{Name="Order",World=2},
    {Name="Stone",World=3},{Name="Hydra Leader",World=3},{Name="Kilo Admiral",World=3},
    {Name="Captain Elephant",World=3},{Name="Beautiful Pirate",World=3},{Name="Cake Queen",World=3},
    {Name="Longma",World=3},{Name="Soul Reaper",World=3},
}
for _, boss in ipairs(allBosses) do
    local key = "Auto"..boss.Name:gsub(" ","")
    getgenv().Configs.BossFarming[key] = false
    task.spawn(function()
        while task.wait(1) do
            if not getgenv().Configs.BossFarming[key] then continue end
            pcall(function()
                if currentWorld~=boss.World then return end
                local b = GetAliveBoss(boss.Name)
                if b then TweenTo(b.HumanoidRootPart.CFrame*CFrame.new(0,30,0)) end
            end)
        end
    end)
end

--// ----------------------------------------------------------------
--  ESP (Players, Fruits, Chests, Islands, Berries)
--// ----------------------------------------------------------------
task.spawn(function()
    while task.wait(1) do
        local esp = getgenv().Configs.ESP
        if not esp then continue end
        pcall(function()
            if esp.Players then
                for _, plr in ipairs(Players:GetPlayers()) do
                    if plr~=Player and plr.Character and plr.Character:FindFirstChild("Head") then
                        local head = plr.Character.Head
                        local bill = head:FindFirstChild("EspPlr") or Instance.new("BillboardGui")
                        bill.Name="EspPlr"; bill.AlwaysOnTop=true; bill.Size=UDim2.new(0,200,0,30); bill.Adornee=head; bill.Parent=head
                        local lbl = bill:FindFirstChild("TextLabel") or Instance.new("TextLabel")
                        lbl.Font=Enum.Font.Code; lbl.TextSize=14; lbl.Size=UDim2.new(1,0,1,0); lbl.BackgroundTransparency=1
                        lbl.Text=plr.Name.." ["..plr.Data.Level.Value.."]"
                        lbl.TextColor3=(plr.Team==Player.Team) and Color3.new(0,0,1) or Color3.new(1,0,0)
                        lbl.Parent=bill
                    end
                end
            end
            if esp.Fruits then
                for _, obj in ipairs(Workspace:GetChildren()) do
                    if obj:IsA("Tool") and obj.Name:find("Fruit") and obj:FindFirstChild("Handle") then
                        local h = obj.Handle
                        local bill = h:FindFirstChild("EspFruit") or Instance.new("BillboardGui")
                        bill.Name="EspFruit"; bill.AlwaysOnTop=true; bill.Size=UDim2.new(0,200,0,30); bill.Adornee=h; bill.Parent=h
                        local lbl = bill:FindFirstChild("TextLabel") or Instance.new("TextLabel")
                        lbl.Font=Enum.Font.Code; lbl.TextSize=14; lbl.Size=UDim2.new(1,0,1,0); lbl.BackgroundTransparency=1
                        lbl.Text=obj.Name; lbl.TextColor3=Color3.fromRGB(255,255,255); lbl.Parent=bill
                    end
                end
            end
            if esp.Chests then
                for _, chest in ipairs(Workspace:GetDescendants()) do
                    if chest:IsA("Model") and chest:GetAttribute("_ChestTagged") then
                        local part = chest.PrimaryPart or chest:FindFirstChildWhichIsA("BasePart")
                        if part then
                            local bill = part:FindFirstChild("EspChest") or Instance.new("BillboardGui")
                            bill.Name="EspChest"; bill.AlwaysOnTop=true; bill.Size=UDim2.new(0,150,0,20); bill.Adornee=part; bill.Parent=part
                            local lbl = bill:FindFirstChild("TextLabel") or Instance.new("TextLabel")
                            lbl.Font=Enum.Font.Code; lbl.TextSize=12; lbl.Size=UDim2.new(1,0,1,0); lbl.BackgroundTransparency=1
                            lbl.Text="Chest"; lbl.TextColor3=Color3.fromRGB(0,255,255); lbl.Parent=bill
                        end
                    end
                end
            end
            if esp.IslandLocations then
                for _, loc in ipairs(Workspace._WorldOrigin.Locations:GetChildren()) do
                    if loc.Name~="Sea" then
                        local bill = loc:FindFirstChild("EspIsl") or Instance.new("BillboardGui")
                        bill.Name="EspIsl"; bill.AlwaysOnTop=true; bill.Size=UDim2.new(0,200,0,20); bill.Adornee=loc; bill.Parent=loc
                        local lbl = bill:FindFirstChild("TextLabel") or Instance.new("TextLabel")
                        lbl.Font=Enum.Font.Code; lbl.TextSize=12; lbl.Size=UDim2.new(1,0,1,0); lbl.BackgroundTransparency=1
                        lbl.Text=loc.Name; lbl.TextColor3=Color3.fromRGB(0,255,255); lbl.Parent=bill
                    end
                end
            end
            if esp.Berries then
                for _, bush in ipairs(Workspace:GetDescendants()) do
                    if bush:IsA("Model") and bush:GetAttribute("BerryBush") then
                        local part = bush:FindFirstChildWhichIsA("BasePart") or bush.PrimaryPart
                        if part then
                            local bill = part:FindFirstChild("EspBerry") or Instance.new("BillboardGui")
                            bill.Name="EspBerry"; bill.AlwaysOnTop=true; bill.Size=UDim2.new(0,150,0,20); bill.Adornee=part; bill.Parent=part
                            local lbl = bill:FindFirstChild("TextLabel") or Instance.new("TextLabel")
                            lbl.Font=Enum.Font.Code; lbl.TextSize=12; lbl.Size=UDim2.new(1,0,1,0); lbl.BackgroundTransparency=1
                            lbl.Text="Berry"; lbl.TextColor3=Color3.fromRGB(255,0,255); lbl.Parent=bill
                        end
                    end
                end
            end
        end)
    end
end)

--// ----------------------------------------------------------------
--  FAST ATTACK METHODS (Night Slayer & CombatUtil)
--// ----------------------------------------------------------------
-- Night Slayer style (from Code_Fast_Attack)
task.spawn(function()
    while task.wait(0.00001) do
        if not getgenv().Configs.FastAttack then continue end
        pcall(function()
            local char = Player.Character; if not char or not char:FindFirstChild("HumanoidRootPart") then return end
            local tool = char:FindFirstChildOfClass("Tool"); if not tool then return end
            for _, enemy in ipairs(Workspace.Enemies:GetChildren()) do
                if enemy:FindFirstChild("Humanoid") and enemy.Humanoid.Health>0 and enemy:FindFirstChild("HumanoidRootPart") and (enemy.HumanoidRootPart.Position - char.HumanoidRootPart.Position).Magnitude<=60 then
                    Enemy = enemy; break
                end
            end
            if not Enemy then return end
            if Enemy:FindFirstChild("Stun") then Enemy.Stun.Value=0 end
            if Enemy:FindFirstChild("Busy") then Enemy.Busy.Value=false end
            Net:RemoteEvent("RegisterAttack"):FireServer(math.huge)
            Net:RemoteEvent("RegisterHit",true):FireServer(Enemy.Head, {{Enemy,Enemy.Head},Enemy.Head}, nil, tostring(Player.UserId):sub(2,4)..tostring(coroutine.running()):sub(11,15))
        end)
    end
end)

-- CombatUtil style
task.spawn(function()
    local CombatUtil = nil; pcall(function() CombatUtil = require(replicated.Modules.CombatUtil) end)
    while task.wait(0.05) do
        if not getgenv().Configs.FastAttack or not CombatUtil then continue end
        pcall(function()
            local char = Player.Character; if not char or not char:FindFirstChild("HumanoidRootPart") then return end
            local tool = char:FindFirstChildOfClass("Tool"); if not tool then return end
            local weaponName = CombatUtil:GetWeaponName(tool)
            local didFire = false
            for _, enemy in ipairs(Workspace.Enemies:GetChildren()) do
                if enemy:FindFirstChild("Humanoid") and enemy.Humanoid.Health>0 and enemy:FindFirstChild("HumanoidRootPart") then
                    local hrp = enemy.HumanoidRootPart
                    if (hrp.Position - char.HumanoidRootPart.Position).Magnitude<=60 then
                        if not didFire then RegisterAttack:FireServer(); didFire=true end
                        RegisterHit:FireServer(hrp, {{enemy,hrp}}, nil, nil, tostring(Player.UserId))
                        CombatUtil:ApplyDamageHighlight(enemy,char,weaponName,hrp)
                    end
                end
            end
        end)
    end
end)

--// ----------------------------------------------------------------
--  FIGHTING STYLES AUTO-BUY & MASTERY (abbreviated, already done in Part3)
--// ----------------------------------------------------------------
-- Re‑implement the full chain here to be self‐contained
local FS_bought = {BlackLeg=false,Electro=false,FishmanKarate=false,DragonClaw=false,Superhuman=false,DeathStep=false,SharkmanKarate=false,ElectricClaw=false,DragonTalon=false,Godhuman=false}
function GetMastery(name)
    local t = Player.Character and Player.Character:FindFirstChild(name) or Player.Backpack:FindFirstChild(name)
    return t and t:FindFirstChild("Level") and t.Level.Value or 0
end
task.spawn(function()
    while task.wait(2) do
        pcall(function()
            local lvl=Player.Data.Level.Value; local beli=Player.Data.Beli.Value; local frags=Player.Data.Fragments.Value
            if not FS_bought.BlackLeg and lvl>=100 and beli>=150000 then replicated.Remotes.CommF_:InvokeServer("BuyBlackLeg"); if HasItem("Black Leg") then FS_bought.BlackLeg=true end end
            if FS_bought.BlackLeg and not FS_bought.Electro and GetMastery("Black Leg")>=300 then replicated.Remotes.CommF_:InvokeServer("BuyElectro"); if HasItem("Electro") then FS_bought.Electro=true end end
            if FS_bought.Electro and not FS_bought.FishmanKarate and GetMastery("Electro")>=300 then replicated.Remotes.CommF_:InvokeServer("BuyFishmanKarate"); if HasItem("Fishman Karate") then FS_bought.FishmanKarate=true end end
            if FS_bought.FishmanKarate and not FS_bought.DragonClaw and lvl>=1100 and frags>=1500 then replicated.Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","2"); if HasItem("Dragon Claw") then FS_bought.DragonClaw=true end end
            if FS_bought.DragonClaw and not FS_bought.Superhuman and GetMastery("Dragon Claw")>=300 and beli>=3000000 then replicated.Remotes.CommF_:InvokeServer("BuySuperhuman"); if HasItem("Superhuman") then FS_bought.Superhuman=true end end
            if FS_bought.Superhuman and not FS_bought.DeathStep and lvl>=1100 and GetMastery("Black Leg")>=400 and frags>=5000 and beli>=2500000 then replicated.Remotes.CommF_:InvokeServer("BuyDeathStep"); if HasItem("Death Step") then FS_bought.DeathStep=true end end
            if FS_bought.DeathStep and not FS_bought.SharkmanKarate and lvl>=1100 and frags>=5000 and beli>=2550000 then replicated.Remotes.CommF_:InvokeServer("BuySharkmanKarate"); if HasItem("Sharkman Karate") then FS_bought.SharkmanKarate=true end end
            if FS_bought.SharkmanKarate and not FS_bought.ElectricClaw and lvl>=1100 and frags>=5000 and beli>=3000000 then replicated.Remotes.CommF_:InvokeServer("BuyElectricClaw"); if HasItem("Electric Claw") then FS_bought.ElectricClaw=true end end
            if FS_bought.ElectricClaw and not FS_bought.DragonTalon and lvl>=1100 and frags>=5000 and beli>=3000000 and CheckItem("Fire Essence")>0 then EquipTool("Fire Essence"); task.wait(0.5); replicated.Remotes.CommF_:InvokeServer("BuyDragonTalon",true); replicated.Remotes.CommF_:InvokeServer("BuyDragonTalon"); if HasItem("Dragon Talon") then FS_bought.DragonTalon=true end end
            if FS_bought.DragonTalon and not FS_bought.Godhuman and lvl>=1100 and frags>=5000 and beli>=5000000 and CheckItem("Fish Tail")>=20 and CheckItem("Magma Ore")>=20 and CheckItem("Mystic Droplet")>=10 and CheckItem("Dragon Scale")>=10 then replicated.Remotes.CommF_:InvokeServer("BuyGodhuman",true); if HasItem("Godhuman") then FS_bought.Godhuman=true end end
        end)
    end
end)

--// ----------------------------------------------------------------
--  MISC UTILITIES (Panic, Remove VFX, Disable Notifications)
--// ----------------------------------------------------------------
task.spawn(function()
    while task.wait(1) do
        if not getgenv().Configs.Misc.PanicMode then continue end
        pcall(function()
            local hum = Player.Character and Player.Character.Humanoid
            if hum and hum.Health>0 and (hum.Health/hum.MaxHealth)<0.25 then
                TweenTo(Player.Character.HumanoidRootPart.CFrame*CFrame.new(0,500,0))
            end
        end)
    end
end)

task.spawn(function()
    while task.wait(0.5) do
        if not getgenv().Configs.Misc.RemoveHitVFX then continue end
        pcall(function()
            for _, v in ipairs(Workspace._WorldOrigin:GetChildren()) do
                if v.Name=="SlashHit" or v.Name=="CurvedRing" or v.Name=="SwordSlash" or v.Name=="SlashTail" then v:Destroy() end
            end
        end)
    end
end)

task.spawn(function()
    while task.wait(1) do
        if not getgenv().Configs.Misc.DisableNotifications then continue end
        pcall(function() if Player.PlayerGui:FindFirstChild("Notifications") then Player.PlayerGui.Notifications.Enabled=false end end)
    end
end)

--// ----------------------------------------------------------------
--  INFINITE ABILITIES
--// ----------------------------------------------------------------
task.spawn(function()
    while task.wait(0.2) do
        if not getgenv().Configs.InfiniteAbilities then continue end
        pcall(function()
            local e = Player.Character and Player.Character:FindFirstChild("Energy")
            if e then e.Value = e.MaxValue end
            local soru = Player.Character and Player.Character:FindFirstChild("Soru")
            if soru and soru:FindFirstChild("LastUse") then soru.LastUse.Value=0 end
            local v = Player:FindFirstChild("VisionRadius")
            if v then v.Value=9e9 end
        end)
    end
end)

UpdateStatus("Part 2 (Rewritten) – All Advanced Systems Active")
--[[
   ╔══════════════════════════════════════════════════════════════╗
   ║     ASTRAL HUB - ULTIMATE MEGA MERGE (PART 3 – REWRITTEN)   ║
   ║   Core Advanced System: Priority Quests, Special Handlers,   ║
   ║   Raids, Full Volcanic, Auto Fruit, Chest/Berry, Masteries   ║
   ║   & every remaining automation from merged files             ║
   ╚══════════════════════════════════════════════════════════════╝
--]]

--// ================== EXTENDED PRIORITY QUEST DETECTION ==================
local function DeterminePriorityQuest()
    local lvl = Player.Data.Level.Value
    local frags = Player.Data.Fragments.Value
    local beli = Player.Data.Beli.Value
    local race = pcall(function() return Player.Data.Race.Value end) and Player.Data.Race.Value or ""

    -- --- World travels ---
    if World1 and lvl >= 700 then return "TravelSea2" end
    if World2 and lvl >= 1500 then return "TravelSea3" end

    -- --- Weapon / Boss priorities ---
    if not HasItem("Saber") and lvl >= 200 and CheckBoss("Saber Expert") then return "Saber" end
    if not HasItem("Pole (1st Form)") and lvl >= 100 and CheckBoss("Thunder God") then return "Pole" end
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
    if not HasItem("Serpent Bow") and World3 and CheckBoss("Hydra Leader") then return "SerpentBow" end
    if not HasItem("Magma Blaster") and lvl >= 200 and World1 and CheckBoss("Magma Admiral") then return "MagmaBlaster" end
    if not HasItem("Bazooka") and lvl >= 200 and World1 and CheckBoss("Wysper") then return "Bazooka" end
    if not HasItem("Shark Saw") and lvl >= 100 and World1 and CheckBoss("The Saw") then return "SharkSaw" end
    if not HasItem("Wardens Sword") and lvl >= 100 and World1 and CheckBoss("Chief Warden") then return "WardenSword" end
    if not HasItem("Marine Coat") and lvl >= 130 and World1 and CheckBoss("Vice Admiral") then return "MarineCoat" end
    if not HasItem("Swan Coat") and World1 and CheckBoss("Swan") then return "SwanCoat" end  -- Actually Swan is in Impel Down; handled separately
    if not HasItem("Bisento") and lvl >= 110 and World1 and CheckBoss("Greybeard") then return "Bisento" end
    if not HasItem("Dark Dagger") and World3 and CheckBoss("Rip_indra") then return "DarkDagger" end

    -- --- Race evolutions ---
    if getgenv().Configs.Quest["Evo Race V1"] and World2 and lvl >= 850 then
        if replicated.Remotes.CommF_:InvokeServer("Alchemist", "1") ~= -2 then return "EvoRaceV1" end
    end
    if getgenv().Configs.Quest["Evo Race V2"] and World2 and lvl >= 1400 then
        if replicated.Remotes.CommF_:InvokeServer("TalkTrevor", "1") == 0 then return "EvoRaceV2" end
    end
    if World2 and lvl >= 900 and replicated.Remotes.CommF_:InvokeServer("TalkTrevor", "1") ~= 0 and not IsCyborg() then return "DonSwan" end
    if World2 and lvl >= 850 and replicated.Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo") ~= 3 then return "Bartilo" end

    -- --- V4 ---
    if getgenv().Configs.Quest["Pull Lerver"] and World3 and Workspace.Map:FindFirstChild("MysticIsland") then return "PullLever" end
    if getgenv().Configs.RaceV4 and getgenv().Configs.RaceV4.CompleteTrials and World3 then return "RaceV4" end

    -- --- RGB Haki ---
    if getgenv().Configs.Quest["RGB Haki"] and lvl >= 2000 then
        if replicated.Remotes.CommF_:InvokeServer("HornedMan", "Bet") == nil then return "RGB" end
    end

    -- --- Elite Hunters (for Yama progress) ---
    if World3 and not HasItem("Yama") then
        local eliteQuest = replicated.Remotes.CommF_:InvokeServer("EliteHunter")
        if eliteQuest ~= "I don't have anything for you right now. Come back later." then return "EliteHunters" end
    end

    -- --- Cake Prince / Dough King (for materials) ---
    if World3 and lvl >= 2300 then
        local spawnStatus = tostring(replicated.Remotes.CommF_:InvokeServer("CakePrinceSpawner"))
        if spawnStatus == "nil" then return "CakePrince" end
        if CheckBoss("Dough King") then return "DoughKing" end
    end

    -- --- Darkbeard / Core (Second Sea) ---
    if World2 then
        if CheckBoss("Darkbeard") then return "Darkbeard" end
        if CheckBoss("Core") then return "Core" end
    end

    -- --- Godhuman materials ---
    if not HasItem("Godhuman") and lvl >= 1100 then
        if CheckItem("Fish Tail") < 20 or CheckItem("Magma Ore") < 20 or CheckItem("Mystic Droplet") < 10 or CheckItem("Dragon Scale") < 10 then
            return "GodhumanMats"
        end
    end

    -- --- Dragon Talon Fire Essence ---
    if not HasItem("Dragon Talon") and lvl >= 1100 and CheckItem("Fire Essence") == 0 then
        return "FireEssence"
    end

    -- --- Sharkman Karate Water Key ---
    if World2 and lvl >= 1100 then
        if replicated.Remotes.CommF_:InvokeServer("BuySharkmanKarate", true) == "I lost my house keys, could you help me find them? Thanks." then
            return "WaterKey"
        end
    end

    -- --- Auto buy cheap swords/guns ---
    if beli >= 3000000 then
        local cheapSwords = {"Cutlass","Katana","Dual Katana","Soul Cane","Triple Katana","Iron Mace","Pipe","Dual-Headed Blade"}
        for _, s in ipairs(cheapSwords) do if not HasItem(s) then replicated.Remotes.CommF_:InvokeServer("BuyItem", s); task.wait(0.5) end end
        local cheapGuns = {"Musket","Flintlock","Refined Slingshot","Dual Flintlock","Cannon"}
        for _, g in ipairs(cheapGuns) do if not HasItem(g) then replicated.Remotes.CommF_:InvokeServer("BuyItem", g); task.wait(0.5) end end
    end

    -- --- Legendary Sword Dealer / Kabucha ---
    if World2 and beli >= 2500000 then
        replicated.Remotes.CommF_:InvokeServer("LegendarySwordDealer", "1")
        replicated.Remotes.CommF_:InvokeServer("LegendarySwordDealer", "2")
        replicated.Remotes.CommF_:InvokeServer("LegendarySwordDealer", "3")
    end
    if not HasItem("Kabucha") and Player.Data.Fragments.Value >= 10000 then
        replicated.Remotes.CommF_:InvokeServer("BlackbeardReward", "Slingshot", "2")
    end
    if not HasItem("Midnight Blade") and replicated.Remotes.CommF_:InvokeServer("Ectoplasm", "Check") >= 100 then
        replicated.Remotes.CommF_:InvokeServer("Ectoplasm", "Buy", 3)
    end

    return nil
end

--// ================== SPECIAL QUEST HANDLERS (FULL DETAIL) ==================
local CurrentQuest = nil

task.spawn(function()
    while task.wait() do
        if not getgenv().Configs.AutoFarming then continue end
        pcall(function()
            CurrentQuest = DeterminePriorityQuest()
            if not CurrentQuest then return end
            UpdateStatus("Special Quest: " .. CurrentQuest)

            if CurrentQuest == "TravelSea2" then
                TweenTo(CFrame.new(1347.7124, 37.375, -1325.649))
                return
            elseif CurrentQuest == "TravelSea3" then
                if replicated.Remotes.CommF_:InvokeServer("ZQuestProgress", "Check") == 1 then
                    replicated.Remotes.CommF_:InvokeServer("TravelZou")
                else
                    -- Start Zou quest if needed
                    if not Workspace.Enemies:FindFirstChild("rip_indra") then
                        replicated.Remotes.CommF_:InvokeServer("ZQuestProgress", "Begin")
                    else
                        local boss = GetAliveBoss("rip_indra")
                        if boss then TweenTo(boss.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)); AutoHaki() end
                    end
                end
                return
            elseif CurrentQuest == "Saber" then
                local prog = replicated.Remotes.CommF_:InvokeServer("ProQuestProgress")
                if not prog.UsedTorch then
                    TweenTo(CFrame.new(-1612, 11, 161)); task.wait(1)
                    replicated.Remotes.CommF_:InvokeServer("ProQuestProgress", "GetTorch")
                    EquipTool("Torch"); replicated.Remotes.CommF_:InvokeServer("ProQuestProgress", "DestroyTorch")
                elseif not prog.UsedCup then
                    replicated.Remotes.CommF_:InvokeServer("ProQuestProgress", "GetCup")
                    EquipTool("Cup"); replicated.Remotes.CommF_:InvokeServer("ProQuestProgress", "FillCup", Player.Character.Cup)
                    replicated.Remotes.CommF_:InvokeServer("ProQuestProgress", "SickMan")
                elseif not prog.KilledMob then
                    local mob = GetAliveBoss("Mob Leader")
                    if mob then TweenTo(mob.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0)) else TweenTo(CFrame.new(-2848, 7, 5342)) end
                elseif not prog.UsedRelic then
                    replicated.Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon")
                    EquipTool("Relic"); TweenTo(CFrame.new(-1406, 29, 4))
                else
                    local boss = GetAliveBoss("Saber Expert")
                    if boss then TweenTo(boss.HumanoidRootPart.CFrame * CFrame.new(0, 25, 0)) else TweenTo(CFrame.new(-1458, 29, -50)) end
                end
            elseif CurrentQuest == "Pole" then
                local boss = GetAliveBoss("Thunder God")
                if boss then TweenTo(boss.HumanoidRootPart.CFrame * CFrame.new(0, 40, 0)) else TweenTo(CFrame.new(-7894, 5547, -380)) end
            elseif CurrentQuest == "Rengoku" then
                local boss = GetAliveBoss("Awakened Ice Admiral")
                if boss then TweenTo(boss.HumanoidRootPart.CFrame * CFrame.new(0, 40, 0)) else TweenTo(CFrame.new(5668, 28.5, -6483)) end
            elseif CurrentQuest == "GravityBlade" then FightBoss("Orbitus")
            elseif CurrentQuest == "Longsword" then FightBoss("Diamond")
            elseif CurrentQuest == "Flail" then FightBoss("Smoke Admiral")
            elseif CurrentQuest == "Yama" then
                local sealed = Workspace.Map.Waterfall.SealedKatana.Hitbox
                if (sealed.Position - Player.Character.HumanoidRootPart.Position).Magnitude > 300 then TweenTo(sealed.CFrame)
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
                    TweenTo(CFrame.new(-9680, 6, 6346)); task.wait(2)
                    replicated.Remotes.CommF_:InvokeServer("GuitarPuzzleProgress", "Gravestone")
                end
            elseif CurrentQuest == "CDK" then
                local progress = replicated.Remotes.CommF_:InvokeServer("CDKQuest", "Progress")
                if progress.Good == 0 or progress.Good == -3 then
                    TweenTo(CFrame.new(-12379, 601, -6543)); replicated.Remotes.CommF_:InvokeServer("CDKQuest", "StartTrial", "Good")
                elseif progress.Evil == 0 or progress.Evil == -3 then
                    TweenTo(CFrame.new(-12392, 603, -6503)); replicated.Remotes.CommF_:InvokeServer("CDKQuest", "StartTrial", "Evil")
                elseif progress.Good == 4 and progress.Evil == 4 then
                    local boss = GetAliveBoss("Cursed Skeleton Boss")
                    if boss then TweenTo(boss.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)) else TweenTo(CFrame.new(-12330, 603, -6549)) end
                end
            elseif CurrentQuest == "VenomBow" then FightBoss("Hydra Leader")
            elseif CurrentQuest == "TwinHooks" then FightBoss("Captain Elephant")
            elseif CurrentQuest == "SerpentBow" then FightBoss("Hydra Leader")
            elseif CurrentQuest == "MagmaBlaster" then FightBoss("Magma Admiral")
            elseif CurrentQuest == "Bazooka" then FightBoss("Wysper")
            elseif CurrentQuest == "SharkSaw" then FightBoss("The Saw")
            elseif CurrentQuest == "WardenSword" then FightBoss("Chief Warden")
            elseif CurrentQuest == "MarineCoat" then FightBoss("Vice Admiral")
            elseif CurrentQuest == "SwanCoat" then
                local boss = GetAliveBoss("Swan")
                if boss then TweenTo(boss.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0)) end
            elseif CurrentQuest == "Bisento" then FightBoss("Greybeard")
            elseif CurrentQuest == "DarkDagger" then
                local boss = GetAliveBoss("rip_indra") or GetAliveBoss("rip_indra True Form")
                if boss then TweenTo(boss.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)) end
            elseif CurrentQuest == "EvoRaceV1" then
                if not HasItem("Flower 1") then TweenTo(Workspace.Flower1.CFrame)
                elseif not HasItem("Flower 2") then TweenTo(Workspace.Flower2.CFrame)
                elseif not HasItem("Flower 3") then
                    local mob = GetAliveMonster("Swan Pirate")
                    if mob then TweenTo(mob.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)) else TweenTo(CFrame.new(976, 111, 1229)) end
                else replicated.Remotes.CommF_:InvokeServer("Alchemist", "3") end
            elseif CurrentQuest == "EvoRaceV2" then
                local r = Player.Data.Race.Value
                if r == "Human" then
                    local targets = {"Orbitus", "Jeremy", "Diamond"}
                    for _, name in ipairs(targets) do
                        local boss = GetAliveBoss(name)
                        if boss then TweenTo(boss.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)); break end
                    end
                elseif r == "Fishman" then
                    for _, sb in ipairs(Workspace.SeaBeasts:GetChildren()) do
                        if sb:FindFirstChild("Health") and sb.Health.Value > 0 then
                            TweenTo(sb.HumanoidRootPart.CFrame * CFrame.new(0, 200, 0)); break
                        end
                    end
                end
            elseif CurrentQuest == "DonSwan" then FightBoss("Don Swan")
            elseif CurrentQuest == "Bartilo" then
                local prog = replicated.Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo")
                if prog == 0 then TweenTo(CFrame.new(-1836, 11, 1714))
                elseif prog == 1 then
                    local mob = GetAliveMonster("Swan Pirate")
                    if mob then TweenTo(mob.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)) else TweenTo(CFrame.new(976, 111, 1229)) end
                elseif prog == 2 then
                    local boss = GetAliveBoss("Jeremy")
                    if boss then TweenTo(boss.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)) end
                end
            elseif CurrentQuest == "PullLever" then
                local v4 = replicated.Remotes.CommF_:InvokeServer("RaceV4Progress", "Check")
                if v4 == 4 then
                    local myst = Workspace.Map:FindFirstChild("MysticIsland")
                    if myst then
                        for _, obj in ipairs(myst:GetDescendants()) do
                            if obj:IsA("ProximityPrompt") and obj.Parent.Name == "Lever" then
                                TweenTo(obj.Parent.CFrame); fireproximityprompt(obj); break
                            end
                        end
                    end
                end
            elseif CurrentQuest == "RaceV4" then
                -- handled by RaceV4 module in Part 2
            elseif CurrentQuest == "RGB" then
                for _, bossName in ipairs({"Stone", "Hydra Leader", "Kilo Admiral", "Captain Elephant", "Beautiful Pirate"}) do
                    local boss = GetAliveBoss(bossName)
                    if boss then TweenTo(boss.HumanoidRootPart.CFrame * CFrame.new(0, 40, 0)); break end
                end
            elseif CurrentQuest == "EliteHunters" then
                replicated.Remotes.CommF_:InvokeServer("EliteHunter")
                for _, bossName in ipairs({"Diablo", "Deandre", "Urban"}) do
                    local boss = GetAliveBoss(bossName)
                    if boss then TweenTo(boss.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)); break end
                end
            elseif CurrentQuest == "CakePrince" then
                local prince = GetAliveBoss("Cake Prince")
                if prince then TweenTo(prince.HumanoidRootPart.CFrame * CFrame.new(0, 42, 10)) else replicated.Remotes.CommF_:InvokeServer("CakePrinceSpawner", true) end
            elseif CurrentQuest == "DoughKing" then FightBoss("Dough King")
            elseif CurrentQuest == "Darkbeard" then FightBoss("Darkbeard", -30)
            elseif CurrentQuest == "Core" then FightBoss("Core")
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
            elseif CurrentQuest == "WaterKey" then
                if HasItem("Water Key") then
                    EquipTool("Water Key"); replicated.Remotes.CommF_:InvokeServer("BuySharkmanKarate", true)
                else
                    local boss = GetAliveBoss("Tide Keeper")
                    if boss then TweenTo(boss.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)) else HopLowServer(5) end
                end
            end
        end)
    end
end)

-- Helper FightBoss
function FightBoss(bossName, height)
    local boss = GetAliveBoss(bossName)
    if boss then TweenTo(boss.HumanoidRootPart.CFrame * CFrame.new(0, height or 30, 0)) end
end

--// ================== RAID FARMING (AUTO START & COMPLETE) ==================
local RaidState = { SelectedMap = "Ice", InRaid = false }
task.spawn(function()
    while task.wait(1) do
        if CurrentQuest then continue end
        if not getgenv().Configs.RaidSettings.Enabled then continue end
        pcall(function()
            local fruitName = Player.Data.DevilFruit.Value
            if fruitName:find("Dark") then RaidState.SelectedMap = "Dark"
            elseif fruitName:find("Sand") then RaidState.SelectedMap = "Sand"
            elseif fruitName:find("Magma") then RaidState.SelectedMap = "Magma"
            elseif fruitName:find("Rumble") then RaidState.SelectedMap = "Rumble"
            elseif fruitName:find("Flame") then RaidState.SelectedMap = "Flame"
            elseif fruitName:find("Ice") then RaidState.SelectedMap = "Ice"
            elseif fruitName:find("Light") then RaidState.SelectedMap = "Light"
            elseif fruitName:find("String") then RaidState.SelectedMap = "String"
            elseif fruitName:find("Quake") then RaidState.SelectedMap = "Quake"
            elseif fruitName:find("Buddha") then RaidState.SelectedMap = "Buddha"
            else RaidState.SelectedMap = "Ice" end

            if not Player.PlayerGui.Main.TopHUDList.RaidTimer.Visible then
                -- Not in raid: try to start
                if HasItem("Special Microchip") or Player.Data.Fragments.Value >= 1000 then
                    replicated.Remotes.CommF_:InvokeServer("RaidsNpc", "Select", RaidState.SelectedMap)
                    task.wait(0.5)
                    if World2 then
                        fireclickdetector(Workspace.Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector)
                    elseif World3 then
                        TweenTo(CFrame.new(-5034, 315, -2951)); task.wait(2)
                        fireclickdetector(Workspace.Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector)
                    end
                else
                    local fruits = GetFruits()
                    if #fruits > 0 then
                        local cheapest = fruits[1]
                        if cheapest.Value < 1000000 then
                            replicated.Remotes.CommF_:InvokeServer("LoadFruit", cheapest.Name)
                        end
                    end
                end
            else
                -- In raid: farm mobs + awaken
                local mobs = Workspace.Enemies:GetChildren()
                local closest, minDist = nil, math.huge
                for _, mob in ipairs(mobs) do
                    if mob:FindFirstChild("Humanoid") and mob.Humanoid.Health > 0 and mob:FindFirstChild("HumanoidRootPart") then
                        local d = (mob.HumanoidRootPart.Position - Player.Character.HumanoidRootPart.Position).Magnitude
                        if d < minDist then minDist = d; closest = mob end
                    end
                end
                if closest then
                    TweenTo(closest.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                else
                    local islands = {"Island 5", "Island 4", "Island 3", "Island 2", "Island 1"}
                    for _, name in ipairs(islands) do
                        local island = Workspace._WorldOrigin.Locations:FindFirstChild(name)
                        if island then TweenTo(island.CFrame * CFrame.new(0, 120, 0)); break end
                    end
                end
                -- Auto awaken
                pcall(function() replicated.Remotes.CommF_:InvokeServer("Awakener", "Awaken") end)
            end
        end)
    end
end)

--// ================== FULLY VOLCANIC MASTER LOOP ==================
local VolcanoPhase = 0 -- 0:idle, 1:scrap, 2:blaze, 3:craft, 4:sail, 5:raid
local function FullyVolcanicCycle()
    while getgenv().Configs.FullyVolcanic do
        if CheckItem("Scrap Metal") < 10 then
            VolcanoPhase = 1
            UpdateStatus("Volcanic: Scrap Metal " .. CheckItem("Scrap Metal") .. "/10")
            if not Player.PlayerGui.Main.Quest.Visible then
                TweenTo(CFrame.new(-12680, 389, -9902)); task.wait(0.5)
                replicated.Remotes.CommF_:InvokeServer("StartQuest", "DeepForestIsland2", 1)
            end
            local mob = GetAliveMonster("Jungle Pirate") or GetAliveMonster("Forest Pirate")
            if mob then TweenTo(mob.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0)); AutoHaki() else TweenTo(CFrame.new(-11778, 426, -10592)) end
            task.wait(0.5)
        elseif CheckItem("Blaze Ember") < 15 then
            VolcanoPhase = 2
            UpdateStatus("Volcanic: Blaze Ember " .. CheckItem("Blaze Ember") .. "/15")
            local qt = ""
            pcall(function()
                local RF = replicated.Modules.Net:WaitForChild("RF/DragonHunter")
                local res = RF:InvokeServer({Context = "Check"})
                if res then for k, v in pairs(res) do if k == "Text" then qt = tostring(v) end end end
            end)
            if qt == "" then
                TweenTo(CFrame.new(5864.86, 1209.55, 812.78)); task.wait(0.5)
                pcall(function() replicated.Modules.Net:FindFirstChild("RF/DragonHunter"):InvokeServer({Context = "RequestQuest"}) end)
            elseif qt:find("Venomous") then
                local mob = GetAliveMonster("Venomous Assailant")
                if mob then TweenTo(mob.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)); AutoHaki() else TweenTo(CFrame.new(4789.3, 1078.59, 962.76)) end
            elseif qt:find("Hydra") then
                local mob = GetAliveMonster("Hydra Enforcer")
                if mob then TweenTo(mob.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)); AutoHaki() else TweenTo(CFrame.new(4620.62, 1002.3, 399.09)) end
            elseif qt:find("Destroy") or qt:find("tree") then
                local trees = {
                    CFrame.new(5260.28, 1004.24, 347.06), CFrame.new(5237.95, 1004.24, 429.60),
                    CFrame.new(5320.88, 1004.24, 439.15), CFrame.new(5346.71, 1004.24, 359.39)
                }
                for _, cf in ipairs(trees) do TweenTo(cf); task.wait(0.3); AutoHaki(); Attack() end
            end
            local ember = Workspace:FindFirstChild("EmberTemplate")
            if ember and ember:FindFirstChild("Part") then TweenTo(ember.Part.CFrame) end
            task.wait(0.5)
        elseif not HasItem("Volcanic Magnet") then
            VolcanoPhase = 3
            UpdateStatus("Volcanic: Crafting Magnet...")
            TweenTo(CFrame.new(5864.86, 1209.55, 812.78)); task.wait(0.8)
            local tries = 0
            while not HasItem("Volcanic Magnet") and tries < 12 do
                tries = tries + 1
                pcall(function() replicated.Remotes.CommF_:InvokeServer("CraftItem", "Craft", "Volcanic Magnet") end)
                task.wait(0.5)
            end
        elseif not Workspace._WorldOrigin.Locations:FindFirstChild("Prehistoric Island") then
            VolcanoPhase = 4
            UpdateStatus("Volcanic: Sailing to island...")
            getgenv().Configs.Prehistoric.FindIsland = true
            local elapsed = 0
            while not Workspace._WorldOrigin.Locations:FindFirstChild("Prehistoric Island") and elapsed < 600 do
                task.wait(1); elapsed = elapsed + 1
            end
            getgenv().Configs.Prehistoric.FindIsland = false
        else
            VolcanoPhase = 5
            UpdateStatus("Volcanic: Completing raid...")
            getgenv().Configs.Prehistoric.PatchEvent = true
            getgenv().Configs.Prehistoric.CollectDragonEggs = true
            getgenv().Configs.Prehistoric.CollectDinoBones = true
            local start = os.time()
            local eventDone = false
            while not eventDone and os.time() - start < 360 do
                task.wait(1)
                if not Workspace._WorldOrigin.Locations:FindFirstChild("Prehistoric Island") and os.time() - start > 30 then eventDone = true end
            end
            getgenv().Configs.Prehistoric.PatchEvent = false
            getgenv().Configs.Prehistoric.CollectDragonEggs = false
            getgenv().Configs.Prehistoric.CollectDinoBones = false
            -- Reset character for next cycle
            pcall(function() if Player.Character and Player.Character:FindFirstChild("Humanoid") then Player.Character.Humanoid.Health = 0 end end)
            task.wait(5)
        end
        task.wait(0.8)
    end
end

task.spawn(function()
    while task.wait(2) do
        if getgenv().Configs.FullyVolcanic and getgenv().Configs.AutoFarming then
            task.spawn(FullyVolcanicCycle)
            break
        end
    end
end)

--// ================== AUTO FRUIT STORE / COLLECT / RANDOM ==================
task.spawn(function()
    while task.wait(3) do
        if not getgenv().Configs.AutoStoreFruit then continue end
        pcall(function()
            for _, t in ipairs(Player.Backpack:GetChildren()) do
                if t:IsA("Tool") and t:GetAttribute("OriginalName") and string.find(t.Name, "Fruit") then
                    replicated.Remotes.CommF_:InvokeServer("StoreFruit", t:GetAttribute("OriginalName"), t)
                end
            end
            for _, t in ipairs(Player.Character:GetChildren()) do
                if t:IsA("Tool") and t:GetAttribute("OriginalName") and string.find(t.Name, "Fruit") then
                    replicated.Remotes.CommF_:InvokeServer("StoreFruit", t:GetAttribute("OriginalName"), t)
                end
            end
        end)
    end
end)

task.spawn(function()
    while task.wait(2) do
        if not getgenv().Configs.AutoCollectFruit then continue end
        pcall(function()
            for _, obj in ipairs(Workspace:GetChildren()) do
                if obj:IsA("Tool") and obj.Name:find("Fruit") and obj:FindFirstChild("Handle") then
                    if (obj.Handle.Position - Player.Character.HumanoidRootPart.Position).Magnitude < 200 then
                        TweenTo(obj.Handle.CFrame); task.wait(0.5)
                    end
                end
            end
        end)
    end
end)

task.spawn(function()
    while task.wait(10) do
        if not getgenv().Configs.AutoRandomFruit then continue end
        pcall(function() replicated.Remotes.CommF_:InvokeServer("Cousin", "Buy") end)
    end
end)

--// ================== AUTO CHEST & BERRY COLLECT ==================
task.spawn(function()
    while task.wait(1) do
        if not getgenv().Configs.AutoCollectChest then continue end
        pcall(function()
            local chest = GetChest()
            if chest then
                TweenTo(CFrame.new(chest.Position))
                task.wait(0.5)
                CyborgChestCount = (CyborgChestCount or 0) + 1
            end
        end)
    end
end)

task.spawn(function()
    while task.wait(1) do
        if not getgenv().Configs.AutoBerry then continue end
        pcall(function()
            for _, bush in ipairs(Workspace:GetDescendants()) do
                if bush:IsA("Model") and bush:GetAttribute("BerryBush") then
                    local part = bush:FindFirstChildOfClass("BasePart") or bush.PrimaryPart
                    if part and (part.Position - Player.Character.HumanoidRootPart.Position).Magnitude < 50 then
                        TweenTo(part.CFrame)
                        for _, pp in ipairs(bush:GetDescendants()) do
                            if pp:IsA("ProximityPrompt") then fireproximityprompt(pp) end
                        end
                    end
                end
            end
        end)
    end
end)

--// ================== AUTO BONE / ECTOPLASM EXCHANGE ==================
task.spawn(function()
    while task.wait(5) do
        if not getgenv().Configs.Misc.AutoRandomBone then continue end
        pcall(function()
            while replicated.Remotes.CommF_:InvokeServer("Bones", "Check") > 0 do
                replicated.Remotes.CommF_:InvokeServer("Bones", "Buy", 1, 1)
                task.wait(0.5)
            end
        end)
    end
end)

task.spawn(function()
    while task.wait(30) do
        pcall(function()
            if not HasItem("Midnight Blade") and replicated.Remotes.CommF_:InvokeServer("Ectoplasm", "Check") >= 100 then
                replicated.Remotes.CommF_:InvokeServer("Ectoplasm", "Buy", 3)
            end
        end)
    end
end)

--// ================== AUTO OBSERVATION V2 (DODGE TRAINING) ==================
task.spawn(function()
    while task.wait(0.3) do
        if not getgenv().Configs.ObservationFarm then continue end
        pcall(function()
            replicated.Remotes.CommE:FireServer("Ken", true)
            local dodging = Player:GetAttribute("KenDodgesLeft") ~= 0
            for _, enemy in ipairs(Workspace.Enemies:GetChildren()) do
                if enemy:FindFirstChild("Humanoid") and enemy.Humanoid.Health > 0 and enemy:FindFirstChild("HumanoidRootPart") then
                    if dodging then TweenTo(enemy.HumanoidRootPart.CFrame * CFrame.new(3, 0, 0))
                    else TweenTo(Player.Character.HumanoidRootPart.CFrame * CFrame.new(0, 50, 0)) end
                    break
                end
            end
        end)
    end
end)

--// ================== INFINITE ABILITIES ==================
task.spawn(function()
    while task.wait(0.2) do
        if not getgenv().Configs.InfiniteAbilities then continue end
        pcall(function()
            local e = Player.Character and Player.Character:FindFirstChild("Energy")
            if e then e.Value = e.MaxValue end
            local soru = Player.Character and Player.Character:FindFirstChild("Soru")
            if soru and soru:FindFirstChild("LastUse") then soru.LastUse.Value = 0 end
            local v = Player:FindFirstChild("VisionRadius")
            if v then v.Value = 9e9 end
        end)
    end
end)

--// ================== AUTO FACTORY & PIRATE RAID ==================
task.spawn(function()
    while task.wait(2) do
        if not (getgenv().Configs.SeaEvents and getgenv().Configs.SeaEvents.AutoFactory) then continue end
        if World2 then
            local core = GetAliveBoss("Core")
            if core then TweenTo(core.HumanoidRootPart.CFrame * CFrame.new(0, 40, 0)) else TweenTo(CFrame.new(448.47, 199.36, -441.39)) end
        end
    end
end)

task.spawn(function()
    while task.wait(2) do
        if not (getgenv().Configs.SeaEvents and getgenv().Configs.SeaEvents.AutoPirateRaid) then continue end
        if World1 then
            local mob = GetAliveMonster("Galley Pirate") or GetAliveMonster("Galley Captain")
            if mob then TweenTo(mob.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)) else TweenTo(CFrame.new(-5539, 314, -2972)) end
        end
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

--// ================== KILL AURA & STUN PREVENTION ==================
task.spawn(function()
    while task.wait(0.05) do
        if not getgenv().Configs.AutoFarming then continue end
        pcall(function()
            for _, enemy in ipairs(Workspace.Enemies:GetChildren()) do
                if enemy:FindFirstChild("Humanoid") and enemy.Humanoid.Health > 0 and enemy:FindFirstChild("HumanoidRootPart") then
                    if (enemy.HumanoidRootPart.Position - Player.Character.HumanoidRootPart.Position).Magnitude < 70 then
                        if Player.Character:FindFirstChild("Stun") then Player.Character.Stun.Value = 0 end
                        if Player.Character:FindFirstChild("Busy") then Player.Character.Busy.Value = false end
                        if enemy:FindFirstChild("Stun") then enemy.Stun.Value = 0 end
                        if enemy:FindFirstChild("Busy") then enemy.Busy.Value = false end
                        break
                    end
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

--// ================== AUTO BUSO COLORS (RAINBOW) ==================
task.spawn(function()
    while task.wait(5) do
        if not getgenv().Configs.Quest["RGB Haki"] or Player.Data.Level.Value < 2000 then continue end
        pcall(function()
            if replicated.Remotes.CommF_:InvokeServer("HornedMan", "Bet") ~= 1 then
                replicated.Remotes.CommF_:InvokeServer("HornedMan", "Bet")
            end
        end)
    end
end)

--// ================== EXTRA BOSS HOP LOOPS ==================
local hopBosses = {
    {name="Greybeard", world=1}, {name="The Saw", world=1}, {name="Warden", world=1}, {name="Chief Warden", world=1},
    {name="Darkbeard", world=2}, {name="Order", world=2}, {name="Tide Keeper", world=2},
    {name="Stone", world=3}, {name="Kilo Admiral", world=3}, {name="Captain Elephant", world=3},
    {name="Beautiful Pirate", world=3}, {name="Soul Reaper", world=3},
}
for _, b in ipairs(hopBosses) do
    local key = "AutoHop" .. b.name:gsub(" ", "")
    getgenv().Configs.BossFarming[key] = false
    task.spawn(function()
        while task.wait(1) do
            if not getgenv().Configs.BossFarming[key] then continue end
            if currentWorld ~= b.world then return end
            local boss = GetAliveBoss(b.name)
            if boss then TweenTo(boss.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
            else HopLowServer(5) end
        end
    end)
end

--// ================== FINAL CLEANUP ==================
UpdateStatus("Part 3 (Rewritten) – All Core Advanced Systems Active")
--[[
   ╔══════════════════════════════════════════════════════════════╗
   ║     ASTRAL HUB - ULTIMATE MEGA MERGE (PART 4 – REWRITTEN)   ║
   ║   Advanced Fast Attack Methods, Full CDK Trial Steps,        ║
   ║   Soul Guitar Puzzle, Race V4 Moon/Gear, Dojo Belts,         ║
   ║   Factory/Pirate Raid, Training Dummy, Citizen Quest,        ║
   ║   Extended Bosses with Hop, Legendary Swords, Haki Colors    ║
   ╚══════════════════════════════════════════════════════════════╝
--]]

--// ================== EXTENDED FAST ATTACK METHODS ==================
-- Method 2: Panda Hub Style (CollectionService / RemoteEvent based)
task.spawn(function()
    while task.wait(0.000000002) do -- as fast as practically possible
        if not getgenv().Configs.FastAttack then continue end
        pcall(function()
            local char = Player.Character
            if not char or not char:FindFirstChild("HumanoidRootPart") then return end
            local tool = char:FindFirstChildOfClass("Tool")
            if not tool then return end

            -- Clear stuns on player
            if char:FindFirstChild("Stun") then char.Stun.Value = 0 end
            if char:FindFirstChild("Busy") then char.Busy.Value = false end

            -- Fire fast attack on all nearby enemies
            for _, enemy in ipairs(Workspace.Enemies:GetChildren()) do
                if enemy:FindFirstChild("Humanoid") and enemy.Humanoid.Health > 0 and enemy:FindFirstChild("HumanoidRootPart") then
                    local hrp = enemy.HumanoidRootPart
                    if (hrp.Position - char.HumanoidRootPart.Position).Magnitude <= 60 then
                        if enemy:FindFirstChild("Stun") then enemy.Stun.Value = 0 end
                        if enemy:FindFirstChild("Busy") then enemy.Busy.Value = false end

                        local attackRemote = Net:RemoteEvent("RegisterAttack")
                        local hitRemote   = Net:RemoteEvent("RegisterHit", true)
                        attackRemote:FireServer(math.huge)
                        hitRemote:FireServer(
                            enemy.Head,
                            {{enemy, enemy.Head}, enemy.Head},
                            nil,
                            tostring(Player.UserId):sub(2, 4) .. tostring(coroutine.running()):sub(11, 15)
                        )
                    end
                end
            end
        end)
    end
end)

-- Method 3: CombatUtil style (requires CombatUtil module)
task.spawn(function()
    local CombatUtil = nil
    pcall(function() CombatUtil = require(replicated.Modules.CombatUtil) end)
    while task.wait(0.05) do
        if not getgenv().Configs.FastAttack or not CombatUtil then continue end
        pcall(function()
            local char  = Player.Character
            if not char or not char:FindFirstChild("HumanoidRootPart") then return end
            local tool  = char:FindFirstChildOfClass("Tool")
            if not tool then return end

            local weaponName = CombatUtil:GetWeaponName(tool)
            local didFire    = false

            for _, enemy in ipairs(Workspace.Enemies:GetChildren()) do
                if enemy:FindFirstChild("Humanoid") and enemy.Humanoid.Health > 0 then
                    local hrp = enemy:FindFirstChild("HumanoidRootPart")
                    if hrp and (hrp.Position - char.HumanoidRootPart.Position).Magnitude <= 60 then
                        if not didFire then
                            RegisterAttack:FireServer()
                            didFire = true
                        end
                        RegisterHit:FireServer(hrp, {{enemy, hrp}}, nil, nil, tostring(Player.UserId))
                        CombatUtil:ApplyDamageHighlight(enemy, char, weaponName, hrp)
                    end
                end
            end
        end)
    end
end)

--// ================== FULL CDK TRIAL STEPS (DETAILED) ==================
local CDKState = {
    boat1 = false, boat2 = false, boat3 = false,
    killedCakeQueen = false, heavenDone = false,
    hellTorches = {false, false, false},
}

task.spawn(function()
    while task.wait(0.5) do
        -- Only run when CurrentQuest is "CDK"
        if not (CurrentQuest == "CDK") then continue end
        pcall(function()
            local progress = replicated.Remotes.CommF_:InvokeServer("CDKQuest", "Progress")
            -- Open door if needed
            if replicated.Remotes.CommF_:InvokeServer("CDKQuest", "OpenDoor") ~= "opened" then
                replicated.Remotes.CommF_:InvokeServer("CDKQuest", "OpenDoor", true)
                return
            end

            -- ===== GOOD TRIAL (BOAT QUESTS) =====
            if progress.Good == -3 then
                if not CDKState.boat1 then
                    TweenTo(CFrame.new(-4600.37, 15.12, -2881.18))
                    if (Player.Character.HumanoidRootPart.Position - Vector3.new(-4600.37, 15.12, -2881.18)).Magnitude < 5 then
                        local dealer = Workspace.NPCs:FindFirstChild("Luxury Boat Dealer")
                        if dealer then
                            replicated.Remotes.CommF_:InvokeServer("CDKQuest", "BoatQuest", dealer, "Check")
                            replicated.Remotes.CommF_:InvokeServer("CDKQuest", "BoatQuest", dealer)
                            CDKState.boat1 = true
                        end
                    end
                elseif not CDKState.boat2 then
                    TweenTo(CFrame.new(-2068.63, 3.37, -9887.08))
                    if (Player.Character.HumanoidRootPart.Position - Vector3.new(-2068.63, 3.37, -9887.08)).Magnitude < 5 then
                        local dealer = Workspace.NPCs:FindFirstChild("Luxury Boat Dealer")
                        if dealer then
                            replicated.Remotes.CommF_:InvokeServer("CDKQuest", "BoatQuest", dealer, "Check")
                            replicated.Remotes.CommF_:InvokeServer("CDKQuest", "BoatQuest", dealer)
                            CDKState.boat2 = true
                        end
                    end
                elseif not CDKState.boat3 then
                    TweenTo(CFrame.new(-9531.19, 5.92, -8377.75))
                    if (Player.Character.HumanoidRootPart.Position - Vector3.new(-9531.19, 5.92, -8377.75)).Magnitude < 5 then
                        local dealer = Workspace.NPCs:FindFirstChild("Luxury Boat Dealer")
                        if dealer then
                            replicated.Remotes.CommF_:InvokeServer("CDKQuest", "BoatQuest", dealer, "Check")
                            replicated.Remotes.CommF_:InvokeServer("CDKQuest", "BoatQuest", dealer)
                            CDKState.boat3 = true
                        end
                    end
                end
            end

            -- ===== EVIL TRIAL (HAZE KILLS) =====
            if progress.Evil == -4 or progress.Evil == -5 then
                for _, mob in ipairs(Workspace.Enemies:GetChildren()) do
                    if mob:FindFirstChild("HazeESP") and mob:FindFirstChild("Humanoid") and mob.Humanoid.Health > 0 then
                        TweenTo(mob.HumanoidRootPart.CFrame * CFrame.new(0, 25, 0))
                        break
                    end
                end
            end

            -- ===== GOOD TRIAL -5 : KILL CAKE QUEEN THEN HEAVEN DIMENSION =====
            if progress.Good == -5 then
                if not CDKState.killedCakeQueen then
                    local queen = GetAliveBoss("Cake Queen")
                    if queen then
                        TweenTo(queen.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                        if queen.Humanoid.Health <= 0 then CDKState.killedCakeQueen = true end
                    else
                        TweenTo(CFrame.new(-714.64, 381.57, -11021.06))
                    end
                elseif not CDKState.heavenDone then
                    local heaven = Workspace.Map:FindFirstChild("HeavenlyDimension")
                    if heaven then
                        if (heaven.WorldPivot.Position - Player.Character.HumanoidRootPart.Position).Magnitude > 10 then
                            TweenTo(heaven.WorldPivot)
                        else
                            -- Kill angels / god's guards
                            local mob = GetAliveMonster("Angel") or GetAliveMonster("God's Guard")
                            if mob then
                                TweenTo(mob.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                            else
                                -- Light 3 torches
                                for i = 1, 3 do
                                    local torch = heaven:FindFirstChild("Torch" .. i)
                                    if torch and torch.ProximityPrompt then
                                        TweenTo(torch.CFrame)
                                        fireproximityprompt(torch.ProximityPrompt)
                                        task.wait(1)
                                    end
                                end
                                CDKState.heavenDone = true
                            end
                        end
                    end
                end
            end

            -- ===== EVIL TRIAL -5 : HELL DIMENSION =====
            if progress.Evil == -5 then
                local hell = Workspace.Map:FindFirstChild("HellDimension")
                if hell then
                    if (hell.WorldPivot.Position - Player.Character.HumanoidRootPart.Position).Magnitude > 10 then
                        TweenTo(hell.WorldPivot)
                    else
                        local mob = GetAliveMonster("Demon") or GetAliveMonster("Soul Reaper")
                        if mob then
                            TweenTo(mob.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                        else
                            for i = 1, 3 do
                                if not CDKState.hellTorches[i] then
                                    local torch = hell:FindFirstChild("Torch" .. i)
                                    if torch and torch.ProximityPrompt then
                                        TweenTo(torch.CFrame)
                                        fireproximityprompt(torch.ProximityPrompt)
                                        task.wait(1)
                                        CDKState.hellTorches[i] = true
                                    end
                                end
                            end
                        end
                    end
                else
                    -- Get Hallow Essence to spawn Soul Reaper
                    if GetAliveBoss("Soul Reaper") then
                        TweenTo(GetAliveBoss("Soul Reaper").HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                    elseif not HasItem("Hallow Essence") and replicated.Remotes.CommF_:InvokeServer("Bones", "Check") > 0 then
                        replicated.Remotes.CommF_:InvokeServer("Bones", "Buy", 1, 1)
                    elseif HasItem("Hallow Essence") then
                        EquipTool("Hallow Essence")
                        TweenTo(CFrame.new(-8932.86, 143.26, 6063.31))
                    end
                end
            end
        end)
    end
end)

--// ================== FULL SOUL GUITAR PUZZLE ==================
local SoulGuitarPuzzle = {
    swampDone = false,
    gravestonesDone = false,
    trophiesDone = false,
    pipesDone = false,
}

task.spawn(function()
    while task.wait(1) do
        if not (CurrentQuest == "SoulGuitar") then continue end
        pcall(function()
            local puzzle = replicated.Remotes.CommF_:InvokeServer("GuitarPuzzleProgress", "Check")
            if not puzzle then
                TweenTo(CFrame.new(-8652.64, 141.11, 6168.81))
                replicated.Remotes.CommF_:InvokeServer("gravestoneEvent", 2, true)
                return
            end

            -- 1) Swamp puzzle
            if puzzle.Swamp == false then
                local swamp = Workspace.Map["Haunted Castle"].SwampWater
                if swamp and tostring(swamp.BrickColor) == "Maroon" then
                    TweenTo(CFrame.new(-10147.78, 138.63, 5939.56))
                    if (Player.Character.HumanoidRootPart.Position - Vector3.new(-10147.78, 138.63, 5939.56)).Magnitude < 15 then
                        local count = 0
                        for _, mob in ipairs(Workspace.Enemies:GetChildren()) do
                            if mob.Name == "Living Zombie" and mob:FindFirstChild("Humanoid") and mob.Humanoid.Health > 0
                                and (mob.HumanoidRootPart.Position - Player.Character.HumanoidRootPart.Position).Magnitude < 500 then
                                count = count + 1
                            end
                        end
                        if count >= 6 then SoulGuitarPuzzle.swampDone = true end
                    end
                end
            end

            -- 2) Gravestones
            if puzzle.Gravestones == false and not SoulGuitarPuzzle.gravestonesDone then
                local placards = {
                    {name = "Placard7", side = "Left"}, {name = "Placard6", side = "Left"},
                    {name = "Placard5", side = "Left"}, {name = "Placard4", side = "Right"},
                    {name = "Placard3", side = "Left"}, {name = "Placard2", side = "Right"},
                    {name = "Placard1", side = "Right"}
                }
                for _, p in ipairs(placards) do
                    local placard = Workspace.Map["Haunted Castle"][p.name]
                    if placard and placard[p.side].Indicator.BrickColor ~= BrickColor.new("Pearl") then
                        TweenTo(placard[p.side].CFrame)
                        fireclickdetector(placard[p.side].ClickDetector)
                        task.wait(0.5)
                    end
                end
                SoulGuitarPuzzle.gravestonesDone = true
            end

            -- 3) Trophies
            if puzzle.Trophies == false and not SoulGuitarPuzzle.trophiesDone then
                TweenTo(CFrame.new(-9532.82, 6.47, 6078.07))
                local function rotateSegment(segNum, trophyNum)
                    local seg = Workspace.Map["Haunted Castle"].Tablet["Segment" .. segNum]
                    local trophy = Workspace.Map["Haunted Castle"].Trophies.Quest["Trophy" .. trophyNum]
                    if seg and trophy and trophy.Handle then
                        while math.abs(seg.Line.Rotation.Z - trophy.Handle.Rotation.Z) > 1 do
                            TweenTo(seg.CFrame)
                            fireclickdetector(seg.ClickDetector)
                            task.wait(0.5)
                        end
                    end
                end
                rotateSegment(1, 1)
                rotateSegment(3, 2)
                rotateSegment(4, 3)
                rotateSegment(7, 4)
                rotateSegment(10, 5)
                -- Reset middle segments
                for _, s in ipairs({2, 5, 6, 8, 9}) do
                    local seg = Workspace.Map["Haunted Castle"].Tablet["Segment" .. s]
                    if seg then fireclickdetector(seg.ClickDetector) end
                end
                SoulGuitarPuzzle.trophiesDone = true
            end

            -- 4) Pipes (color floor)
            if puzzle.Pipes == false and not SoulGuitarPuzzle.pipesDone then
                local lab = Workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model
                local function clickPipe(num, times)
                    local part = lab["Part" .. num]
                    if part then
                        TweenTo(part.CFrame)
                        for _ = 1, times do
                            fireclickdetector(part.ClickDetector)
                            task.wait(0.3)
                        end
                    end
                end
                clickPipe(3, 1)
                clickPipe(4, 3)
                clickPipe(6, 2)
                clickPipe(8, 1)
                clickPipe(10, 3)
                SoulGuitarPuzzle.pipesDone = true
            end
        end)
    end
end)

--// ================== RACE V4 MOON + LEVER + GEAR ==================
task.spawn(function()
    while task.wait(1) do
        if not (getgenv().Configs.Quest["Pull Lerver"] and CurrentQuest == "PullLever") then continue end
        pcall(function()
            local myst = Workspace.Map:FindFirstChild("MysticIsland")
            if not myst then return end
            local v4Prog = replicated.Remotes.CommF_:InvokeServer("RaceV4Progress", "Check")
            if v4Prog == 4 then
                -- Look at moon
                local moonDir = Lighting:GetMoonDirection()
                Player.Character.HumanoidRootPart.CFrame = CFrame.lookAt(
                    Player.Character.HumanoidRootPart.Position,
                    Player.Character.HumanoidRootPart.Position + moonDir
                )
                task.wait(0.5)
                replicated.Remotes.CommE:FireServer("ActivateAbility")
                task.wait(5)

                -- Collect translucent gears
                for _, obj in ipairs(myst:GetDescendants()) do
                    if obj:IsA("MeshPart") and obj.Transparency < 0.1 then
                        TweenTo(obj.CFrame)
                        task.wait(0.3)
                        VirtualInputManager:SendKeyEvent(true, "Space", false, game)
                        task.wait(0.2)
                        VirtualInputManager:SendKeyEvent(false, "Space", false, game)
                    end
                end

                -- Pull lever
                for _, obj in ipairs(myst:GetDescendants()) do
                    if obj:IsA("ProximityPrompt") and obj.Parent.Name == "Lever" then
                        TweenTo(obj.Parent.CFrame)
                        fireproximityprompt(obj)
                        break
                    end
                end
            end
        end)
    end
end)

--// ================== DRAGON DOJO BELT QUESTS (FULL) ==================
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
                    getgenv().Configs.SeaEvents.Enable = true
                    getgenv().Configs.SeaEvents.KillSeaBeast = true
                    getgenv().Configs.SeaEvents.AutoSail = true
                elseif belt == "Green" then
                    getgenv().Configs.SeaEvents.AutoSail = true
                elseif belt == "Purple" then
                    -- Reuse existing elite hunter system
                    CurrentQuest = "EliteHunters"
                elseif belt == "Red" then
                    getgenv().Configs.SeaEvents.KillFishBoat = true
                    getgenv().Configs.SeaEvents.AutoSail = true
                elseif belt == "Black" then
                    getgenv().Configs.Prehistoric.FindIsland = true
                    getgenv().Configs.Prehistoric.PatchEvent = true
                end
            end
        end)
    end
end)

--// ================== AUTO FACTORY RAID (SEA 2) ==================
task.spawn(function()
    while task.wait(2) do
        if not (getgenv().Configs.SeaEvents and getgenv().Configs.SeaEvents.AutoFactory) then continue end
        if World2 then
            local core = GetAliveBoss("Core")
            if core then
                TweenTo(core.HumanoidRootPart.CFrame * CFrame.new(0, 40, 0))
            else
                TweenTo(CFrame.new(448.47, 199.36, -441.39))
            end
        end
    end
end)

--// ================== AUTO PIRATE RAID (SEA 1) ==================
task.spawn(function()
    while task.wait(2) do
        if not (getgenv().Configs.SeaEvents and getgenv().Configs.SeaEvents.AutoPirateRaid) then continue end
        if World1 then
            local mob = GetAliveMonster("Galley Pirate") or GetAliveMonster("Galley Captain")
            if mob then
                TweenTo(mob.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
            else
                TweenTo(CFrame.new(-5539, 314, -2972))
            end
        end
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
                if dummy then
                    TweenTo(dummy.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                else
                    TweenTo(CFrame.new(3688, 12.75, 170.21))
                end
            end
        end)
    end
end)

--// ================== AUTO CITIZEN QUEST (KEN V2 UNLOCK) ==================
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
                if mob then
                    TweenTo(mob.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                else
                    TweenTo(CFrame.new(-13206, 426, -7965))
                end
            elseif progress == 2 then
                local boss = GetAliveBoss("Captain Elephant")
                if boss then TweenTo(boss.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)) end
            end
        end)
    end
end)

--// ================== EXTENDED BOSS FARMING WITH HOP ==================
local bossHopList = {
    -- World 1
    {Name = "Greybeard", World = 1},
    {Name = "The Saw", World = 1},
    {Name = "Warden", World = 1},
    {Name = "Chief Warden", World = 1},
    -- World 2
    {Name = "Darkbeard", World = 2},
    {Name = "Order", World = 2},
    {Name = "Tide Keeper", World = 2},
    -- World 3
    {Name = "Stone", World = 3},
    {Name = "Kilo Admiral", World = 3},
    {Name = "Captain Elephant", World = 3},
    {Name = "Beautiful Pirate", World = 3},
    {Name = "Soul Reaper", World = 3},
}

for _, boss in ipairs(bossHopList) do
    local cfgKey = "AutoHop" .. boss.Name:gsub(" ", "")
    getgenv().Configs.BossFarming[cfgKey] = false
    task.spawn(function()
        while task.wait(1) do
            if not getgenv().Configs.BossFarming[cfgKey] then continue end
            pcall(function()
                if currentWorld ~= boss.World then return end
                local b = GetAliveBoss(boss.Name)
                if b then
                    TweenTo(b.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
                else
                    HopLowServer(5)
                end
            end)
        end
    end)
end

--// ================== AUTO LEGENDARY SWORD DEALER & TRUE TRIPLE KATANA ==================
task.spawn(function()
    while task.wait(60) do
        if not (World2 and getgenv().Configs.AutoFarming) then continue end
        pcall(function()
            if Player.Data.Beli.Value >= 2500000 then
                replicated.Remotes.CommF_:InvokeServer("LegendarySwordDealer", "1")
                replicated.Remotes.CommF_:InvokeServer("LegendarySwordDealer", "2")
                replicated.Remotes.CommF_:InvokeServer("LegendarySwordDealer", "3")
            end
        end)
    end
end)

task.spawn(function()
    while task.wait(10) do
        if HasItem("Shisui") and HasItem("Wando") and HasItem("Saddi") and not HasItem("True Triple Katana") then
            pcall(function()
                replicated.Remotes.CommF_:InvokeServer("MysteriousMan", "2")
            end)
        end
    end
end)

--// ================== AUTO BUY HAKI COLORS & RACE REROLL ==================
task.spawn(function()
    while task.wait(5) do
        if not getgenv().Configs.Quest["RGB Haki"] or Player.Data.Level.Value < 2000 then continue end
        pcall(function()
            if replicated.Remotes.CommF_:InvokeServer("HornedMan", "Bet") ~= 1 then
                replicated.Remotes.CommF_:InvokeServer("HornedMan", "Bet")
            end
        end)
    end
end)

task.spawn(function()
    while task.wait(60) do
        local fragments = Player.Data.Fragments.Value
        local race = Player.Data.Race.Value
        local desiredRaces = {"Cyborg", "Ghoul", "Human", "Angel", "Shark", "Mink"}
        if fragments >= 3000 and not table.find(desiredRaces, race) then
            pcall(function()
                replicated.Remotes.CommF_:InvokeServer("Alchemist", "2")
            end)
        end
    end
end)

--// ================== SERVER HOP FOR LOW PLAYERS / PING ==================
task.spawn(function()
    while task.wait(60) do
        if not (getgenv().Configs.SeaEvents and getgenv().Configs.SeaEvents.HopLowPing) then continue end
        pcall(function()
            if #Players:GetPlayers() > 8 then
                HopLowServer(6)
            elseif Stats.Network.ServerStatsItem["Data Ping"]:GetValue() and
                tonumber(Stats.Network.ServerStatsItem["Data Ping"]:GetValue()) > 250 then
                HopLowServer(6)
            end
        end)
    end
end)

--// ================== ANTI-KICK / AUTO REJOIN ==================
task.spawn(function()
    while task.wait(2) do
        pcall(function()
            local prompt = game:GetService("CoreGui").RobloxPromptGui.promptOverlay
            for _, child in ipairs(prompt:GetChildren()) do
                if child.Name == "ErrorPrompt" and child.Visible then
                    TeleportService:Teleport(game.PlaceId, Player)
                end
            end
        end)
    end
end)

--// ================== MISC DEATH EFFECTS CLEANUP ==================
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
UpdateStatus("Part 4 (Rewritten) – Advanced Combat, Puzzles, Raids, & Boss Systems Active")
--[[
   ╔══════════════════════════════════════════════════════════════╗
   ║     ASTRAL HUB - ULTIMATE MEGA MERGE (PART 5 – REWRITTEN)   ║
   ║   Complete Fighting Style Chain, Full Mastery Farm,          ║
   ║   All Remaining Weapon Quests, Unlockables, Sanguine Art,   ║
   ║   Dragon Talon/Electric Claw, Hop Bosses, Legendary Swords, ║
   ║   True Triple Katana, Haki Colors, Race Reroll & Utilities  ║
   ╚══════════════════════════════════════════════════════════════╝
--]]

--// ================== CONFIGS EXTENSION ==================
getgenv().Configs = getgenv().Configs or {}
getgenv().Configs.AutoStoreFruit      = false
getgenv().Configs.AutoCollectFruit    = false
getgenv().Configs.AutoRandomFruit     = false
getgenv().Configs.AutoCollectChest    = false
getgenv().Configs.AutoBerry           = false
getgenv().Configs.AutoRandomBone      = false
getgenv().Configs.AutoFarming         = true   -- master farm toggle
getgenv().Configs.MasteryHealthPct    = 25
getgenv().Configs.Misc.AutoTrainingDummy = false
getgenv().Configs.Misc.AutoCitizenQuest = false
getgenv().Configs.SeaEvents.AutoFactory    = false
getgenv().Configs.SeaEvents.AutoPirateRaid = false

--// ================== COMPLETE FIGHTING STYLES AUTO BUY & MASTERY ==================
local FS = {
    BlackLeg = false, Electro = false, FishmanKarate = false,
    DragonClaw = false, Superhuman = false, DeathStep = false,
    SharkmanKarate = false, ElectricClaw = false, DragonTalon = false,
    Godhuman = false, SanguineArt = false
}

function GetMastery(styleName)
    local tool = Player.Character and Player.Character:FindFirstChild(styleName) or Player.Backpack:FindFirstChild(styleName)
    return tool and tool:FindFirstChild("Level") and tool.Level.Value or 0
end

task.spawn(function()
    while task.wait(2) do
        pcall(function()
            local lvl = Player.Data.Level.Value
            local beli = Player.Data.Beli.Value
            local frags = Player.Data.Fragments.Value

            -- 1. Black Leg
            if not FS.BlackLeg and lvl >= 100 and beli >= 150000 then
                replicated.Remotes.CommF_:InvokeServer("BuyBlackLeg")
                if HasItem("Black Leg") then FS.BlackLeg = true end
            end
            -- 2. Electro
            if FS.BlackLeg and not FS.Electro and GetMastery("Black Leg") >= 300 then
                replicated.Remotes.CommF_:InvokeServer("BuyElectro")
                if HasItem("Electro") then FS.Electro = true end
            end
            -- 3. Fishman Karate
            if FS.Electro and not FS.FishmanKarate and GetMastery("Electro") >= 300 then
                replicated.Remotes.CommF_:InvokeServer("BuyFishmanKarate")
                if HasItem("Fishman Karate") then FS.FishmanKarate = true end
            end
            -- 4. Dragon Claw
            if FS.FishmanKarate and not FS.DragonClaw and lvl >= 1100 and frags >= 1500 then
                replicated.Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "2")
                if HasItem("Dragon Claw") then FS.DragonClaw = true end
            end
            -- 5. Superhuman
            if FS.DragonClaw and not FS.Superhuman and GetMastery("Dragon Claw") >= 300 and beli >= 3000000 then
                replicated.Remotes.CommF_:InvokeServer("BuySuperhuman")
                if HasItem("Superhuman") then FS.Superhuman = true end
            end
            -- 6. Death Step
            if FS.Superhuman and not FS.DeathStep and lvl >= 1100 and GetMastery("Black Leg") >= 400 and frags >= 5000 and beli >= 2500000 then
                replicated.Remotes.CommF_:InvokeServer("BuyDeathStep")
                if HasItem("Death Step") then FS.DeathStep = true end
            end
            -- 7. Sharkman Karate
            if FS.DeathStep and not FS.SharkmanKarate and lvl >= 1100 and frags >= 5000 and beli >= 2550000 then
                replicated.Remotes.CommF_:InvokeServer("BuySharkmanKarate")
                if HasItem("Sharkman Karate") then FS.SharkmanKarate = true end
            end
            -- 8. Electric Claw
            if FS.SharkmanKarate and not FS.ElectricClaw and lvl >= 1100 and frags >= 5000 and beli >= 3000000 then
                replicated.Remotes.CommF_:InvokeServer("BuyElectricClaw")
                if HasItem("Electric Claw") then FS.ElectricClaw = true end
            end
            -- 9. Dragon Talon
            if FS.ElectricClaw and not FS.DragonTalon and lvl >= 1100 and frags >= 5000 and beli >= 3000000 then
                if CheckItem("Fire Essence") > 0 then
                    EquipTool("Fire Essence"); task.wait(0.5)
                    replicated.Remotes.CommF_:InvokeServer("BuyDragonTalon", true)
                    replicated.Remotes.CommF_:InvokeServer("BuyDragonTalon")
                    if HasItem("Dragon Talon") then FS.DragonTalon = true end
                end
            end
            -- 10. Godhuman
            if FS.DragonTalon and not FS.Godhuman and lvl >= 1100 and frags >= 5000 and beli >= 5000000 then
                if CheckItem("Fish Tail") >= 20 and CheckItem("Magma Ore") >= 20
                    and CheckItem("Mystic Droplet") >= 10 and CheckItem("Dragon Scale") >= 10 then
                    replicated.Remotes.CommF_:InvokeServer("BuyGodhuman", true)
                    if HasItem("Godhuman") then FS.Godhuman = true end
                end
            end
            -- 11. Sanguine Art
            if FS.Godhuman and not FS.SanguineArt and lvl >= 1100 then
                if GetM("Leviathan Heart") >= 1 then
                    replicated.Remotes.CommF_:InvokeServer("BuySanguineArt")
                    if HasItem("Sanguine Art") then FS.SanguineArt = true end
                end
            end
        end)
    end
end)

--// ================== AUTO MASTERY FARM (FRUIT, SWORD, GUN) ==================
local HealthPct = 25 -- use skills when mob hp <= this percent
task.spawn(function()
    while task.wait(0.3) do
        if CurrentQuest then continue end
        pcall(function()
            local tool = Player.Character and Player.Character:FindFirstChildOfClass("Tool")
            if not tool then return end
            -- Find nearest enemy
            local nearest, minDist = nil, math.huge
            for _, e in ipairs(Workspace.Enemies:GetChildren()) do
                if e:FindFirstChild("Humanoid") and e.Humanoid.Health > 0 and e:FindFirstChild("HumanoidRootPart") then
                    local d = (e.HumanoidRootPart.Position - Player.Character.HumanoidRootPart.Position).Magnitude
                    if d < minDist and d < 100 then nearest = e; minDist = d end
                end
            end
            if not nearest then return end

            local hum = nearest.Humanoid
            local hrp = nearest.HumanoidRootPart
            local tip = tool.ToolTip

            if tip == "Blox Fruit" then
                if hum.Health <= hum.MaxHealth * HealthPct / 100 then
                    TweenTo(hrp.CFrame * CFrame.new(0, 25, 0) * CFrame.Angles(math.rad(-90), 0, 0))
                    VirtualInputManager:SendKeyEvent(true, "Z", false, game); task.wait(0.1); VirtualInputManager:SendKeyEvent(false, "Z", false, game)
                    VirtualInputManager:SendKeyEvent(true, "X", false, game); task.wait(0.1); VirtualInputManager:SendKeyEvent(false, "X", false, game)
                    VirtualInputManager:SendKeyEvent(true, "C", false, game); task.wait(0.1); VirtualInputManager:SendKeyEvent(false, "C", false, game)
                else
                    TweenTo(hrp.CFrame * CFrame.new(0, 30, 0))
                end
            elseif tip == "Sword" then
                TweenTo(hrp.CFrame * CFrame.new(0, 30, 0))
                VirtualInputManager:SendKeyEvent(true, "Z", false, game); task.wait(0.1); VirtualInputManager:SendKeyEvent(false, "Z", false, game)
                VirtualInputManager:SendKeyEvent(true, "X", false, game); task.wait(0.1); VirtualInputManager:SendKeyEvent(false, "X", false, game)
            elseif tip == "Gun" then
                if hum.Health <= hum.MaxHealth * HealthPct / 100 then
                    TweenTo(hrp.CFrame * CFrame.new(0, 25, 0) * CFrame.Angles(math.rad(-90), 0, 0))
                    VirtualInputManager:SendKeyEvent(true, "Z", false, game); task.wait(0.1); VirtualInputManager:SendKeyEvent(false, "Z", false, game)
                    VirtualInputManager:SendKeyEvent(true, "X", false, game); task.wait(0.1); VirtualInputManager:SendKeyEvent(false, "X", false, game)
                else
                    TweenTo(hrp.CFrame * CFrame.new(0, 30, 0))
                end
            end
        end)
    end
end)

--// ================== ALL REMAINING WEAPON QUESTS (DEDICATED LOOPS) ==================
local weaponQuests = {
    -- Sea 1
    {name="Saber",          boss="Saber Expert",         world=1, lvl=200},
    {name="Pole (1st Form)",boss="Thunder God",           world=1, lvl=100},
    {name="Shark Saw",      boss="The Saw",               world=1, lvl=100},
    {name="Wardens Sword",  boss="Chief Warden",          world=1, lvl=100},
    {name="Magma Blaster",  boss="Magma Admiral",         world=1, lvl=200},
    {name="Bazooka",        boss="Wysper",                world=1, lvl=200},
    {name="Marine Coat",    boss="Vice Admiral",          world=1, lvl=130},
    {name="Bisento V2",     boss="Greybeard",             world=1, lvl=110},
    -- Sea 2
    {name="Rengoku",        boss="Awakened Ice Admiral",  world=2, lvl=800},
    {name="Gravity Blade",  boss="Orbitus",               world=2, lvl=800},
    {name="Longsword",      boss="Diamond",               world=2, lvl=800},
    {name="Flail",          boss="Smoke Admiral",          world=2, lvl=800},
    {name="Dark Blade V3",  boss="Darkbeard",             world=2, lvl=800},
    {name="Midnight Blade", boss="Cursed Captain",        world=2, lvl=800},
    -- Sea 3
    {name="Yama",           boss="Ghost",                 world=3, lvl=2000},
    {name="Tushita",        boss="Longma",                world=3, lvl=2000},
    {name="Venom Bow",      boss="Hydra Leader",          world=3, lvl=2000},
    {name="Twin Hooks",     boss="Captain Elephant",      world=3, lvl=2000},
    {name="Serpent Bow",    boss="Hydra Leader",          world=3, lvl=2000},
    -- Accessories
    {name="Don Swan Glasses", boss="Don Swan",            world=2, lvl=900},
    {name="Cavender",       boss="Beautiful Pirate",      world=3, lvl=1950},
    {name="Lei Accessory",  boss="Kilo Admiral",          world=3, lvl=1750},
}

for _, wq in ipairs(weaponQuests) do
    local cfgKey = "Auto" .. wq.name:gsub("[%s%(%)]", "")
    getgenv().Configs.BossFarming[cfgKey] = false
    task.spawn(function()
        while task.wait(1) do
            if not getgenv().Configs.BossFarming[cfgKey] then continue end
            pcall(function()
                if wq.need and not wq.need() then return end
                if currentWorld ~= wq.world then return end
                if Player.Data.Level.Value < wq.lvl then return end
                if wq.boss then
                    local boss = GetAliveBoss(wq.boss)
                    if boss then
                        TweenTo(boss.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                    else
                        HopLowServer(5)
                    end
                end
            end)
        end
    end)
end

--// ================== SANGUINE ART MATERIALS FARM ==================
task.spawn(function()
    while task.wait(2) do
        if not (FS.Godhuman and not FS.SanguineArt) then continue end
        pcall(function()
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
        end)
    end
end)

--// ================== AUTO ELECTRIC CLAW QUEST START ==================
task.spawn(function()
    while task.wait(0.5) do
        if not (FS.SharkmanKarate and not FS.ElectricClaw) then continue end
        pcall(function()
            if replicated.Remotes.CommF_:InvokeServer("BuyElectricClaw", true) == "Nah." then
                replicated.Remotes.CommF_:InvokeServer("BuyElectricClaw", "Start")
                TweenTo(CFrame.new(-12548, 337, -7481))
            end
        end)
    end
end)

--// ================== AUTO RANDOM BONE BUY ==================
task.spawn(function()
    while task.wait(5) do
        if not getgenv().Configs.AutoRandomBone then continue end
        pcall(function()
            while replicated.Remotes.CommF_:InvokeServer("Bones", "Check") > 0 do
                replicated.Remotes.CommF_:InvokeServer("Bones", "Buy", 1, 1)
                task.wait(0.5)
            end
        end)
    end
end)

--// ================== AUTO ECTOPLASM EXCHANGE (MIDNIGHT BLADE) ==================
task.spawn(function()
    while task.wait(30) do
        pcall(function()
            if not HasItem("Midnight Blade") and replicated.Remotes.CommF_:InvokeServer("Ectoplasm", "Check") >= 100 then
                replicated.Remotes.CommF_:InvokeServer("Ectoplasm", "Buy", 3)
            end
        end)
    end
end)

--// ================== AUTO FRUIT STORE / COLLECT / RANDOM ==================
task.spawn(function()
    while task.wait(3) do
        if not getgenv().Configs.AutoStoreFruit then continue end
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

task.spawn(function()
    while task.wait(2) do
        if not getgenv().Configs.AutoCollectFruit then continue end
        pcall(function()
            for _, obj in ipairs(Workspace:GetChildren()) do
                if obj:IsA("Tool") and obj.Name:find("Fruit") and obj:FindFirstChild("Handle") then
                    local dist = (obj.Handle.Position - Player.Character.HumanoidRootPart.Position).Magnitude
                    if dist < 200 then
                        TweenTo(obj.Handle.CFrame); task.wait(0.5)
                    end
                end
            end
        end)
    end
end)

task.spawn(function()
    while task.wait(10) do
        if not getgenv().Configs.AutoRandomFruit then continue end
        pcall(function() replicated.Remotes.CommF_:InvokeServer("Cousin", "Buy") end)
    end
end)

--// ================== AUTO CHEST & BERRY COLLECT ==================
local ChestCollectCount = 0
task.spawn(function()
    while task.wait(1) do
        if not getgenv().Configs.AutoCollectChest then continue end
        pcall(function()
            local chest = GetChest()
            if chest then
                TweenTo(CFrame.new(chest.Position))
                task.wait(0.5)
                ChestCollectCount = ChestCollectCount + 1
            end
        end)
    end
end)

task.spawn(function()
    while task.wait(1) do
        if not getgenv().Configs.AutoBerry then continue end
        pcall(function()
            for _, bush in ipairs(Workspace:GetDescendants()) do
                if bush:IsA("Model") and bush:GetAttribute("BerryBush") then
                    local part = bush:FindFirstChildOfClass("BasePart") or bush.PrimaryPart
                    if part and (part.Position - Player.Character.HumanoidRootPart.Position).Magnitude < 50 then
                        TweenTo(part.CFrame)
                        for _, prompt in ipairs(bush:GetDescendants()) do
                            if prompt:IsA("ProximityPrompt") then fireproximityprompt(prompt) end
                        end
                    end
                end
            end
        end)
    end
end)

--// ================== AUTO FACTORY / PIRATE RAID ==================
task.spawn(function()
    while task.wait(2) do
        if not (getgenv().Configs.SeaEvents and getgenv().Configs.SeaEvents.AutoFactory) then continue end
        if World2 then
            local core = GetAliveBoss("Core")
            if core then
                TweenTo(core.HumanoidRootPart.CFrame * CFrame.new(0, 40, 0))
            else
                TweenTo(CFrame.new(448.47, 199.36, -441.39))
            end
        end
    end
end)

task.spawn(function()
    while task.wait(2) do
        if not (getgenv().Configs.SeaEvents and getgenv().Configs.SeaEvents.AutoPirateRaid) then continue end
        if World1 then
            local mob = GetAliveMonster("Galley Pirate") or GetAliveMonster("Galley Captain")
            if mob then
                TweenTo(mob.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
            else
                TweenTo(CFrame.new(-5539, 314, -2972))
            end
        end
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
                if dummy then
                    TweenTo(dummy.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                else
                    TweenTo(CFrame.new(3688, 12.75, 170.21))
                end
            end
        end)
    end
end)

--// ================== AUTO CITIZEN QUEST (KEN V2 UNLOCK) ==================
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
                if mob then
                    TweenTo(mob.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                else
                    TweenTo(CFrame.new(-13206, 426, -7965))
                end
            elseif progress == 2 then
                local boss = GetAliveBoss("Captain Elephant")
                if boss then TweenTo(boss.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)) end
            end
        end)
    end
end)

--// ================== KILL AURA ENHANCED ==================
task.spawn(function()
    while task.wait(0.05) do
        if not getgenv().Configs.AutoFarming then continue end
        pcall(function()
            for _, enemy in ipairs(Workspace.Enemies:GetChildren()) do
                if enemy:FindFirstChild("Humanoid") and enemy.Humanoid.Health > 0 and enemy:FindFirstChild("HumanoidRootPart") then
                    if (enemy.HumanoidRootPart.Position - Player.Character.HumanoidRootPart.Position).Magnitude < 70 then
                        if Player.Character:FindFirstChild("Stun") then Player.Character.Stun.Value = 0 end
                        if Player.Character:FindFirstChild("Busy") then Player.Character.Busy.Value = false end
                        if enemy:FindFirstChild("Stun") then enemy.Stun.Value = 0 end
                        if enemy:FindFirstChild("Busy") then enemy.Busy.Value = false end
                        break
                    end
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

--// ================== EXTRA MISC CLEANUP ==================
task.spawn(function()
    while task.wait(0.5) do
        pcall(function()
            if Player.Character then
                for _, v in ipairs(Player.Character:GetDescendants()) do
                    if v:IsA("BasePart") and v.CanCollide then v.CanCollide = false end
                end
            end
            -- White screen disable if configured
            if getgenv().Configs.AutoCyborg and getgenv().Configs.AutoCyborg.WhiteScreen then
                RunService:Set3dRenderingEnabled(false)
            else
                RunService:Set3dRenderingEnabled(true)
            end
        end)
    end
end)

--// ================== AUTO REJOIN / ANTI-KICK ==================
task.spawn(function()
    while task.wait(2) do
        pcall(function()
            local prompt = game:GetService("CoreGui").RobloxPromptGui.promptOverlay
            for _, child in ipairs(prompt:GetChildren()) do
                if child.Name == "ErrorPrompt" and child.Visible then
                    TeleportService:Teleport(game.PlaceId, Player)
                end
            end
        end)
    end
end)

--// ================== FINAL NOTIFICATION ==================
UpdateStatus("ALL 5 PARTS ACTIVE – ASTRAL HUB ULTIMATE")
--[[
   ╔══════════════════════════════════════════════════════════════╗
   ║     ASTRAL HUB - ULTIMATE MEGA MERGE (PART 6 – REWRITTEN)   ║
   ║   Auto Sea Events (Full), Kitsune, Mirage, Frozen,          ║
   ║   Leviathan, Sea Beasts, Auto Draco V1-V3, Drive Boat,      ║
   ║   Terror Shark, Pirate Brigade, Ghost Ship & More            ║
   ╚══════════════════════════════════════════════════════════════╝
--]]

--// ================== CONFIGS EXTENSION ==================
getgenv().Configs = getgenv().Configs or {}
getgenv().Configs.SeaEvents = {
    Enable = false,
    DangerLevel = "Lv 1",
    SelectedBoat = "Guardian",
    BoatTweenSpeed = 300,
    AutoSail = false,
    SpeedBoat = false,
    NoClipRock = false,
    Lightning = false,
    -- Sea creatures
    KillShark = false,
    KillTerrorShark = false,
    KillPiranha = false,
    KillFishCrew = false,
    KillHauntedCrew = false,
    KillPirateBrigade = false,
    KillPirateGrandBrigade = false,
    KillGhostShip = false,
    KillFishBoat = false,
    KillSeaBeast = false,
    KillLeviathan = false,
    DodgeSeaBeast = true,
    DodgeTerrorShark = true,
    -- Islands
    KitsuneIsland = false,
    ShrineActive = false,
    CollectAzureEmber = false,
    SetAzureEmber = 20,
    TradeAzureEmber = false,
    SummonKitsune = false,
    -- Mirage
    AutoFindMirage = false,
    AutoBlueGear = false,
    TweenToHighestMirage = false,
    TweenToMirage = false,
    -- Frozen Dimension
    SummonFrozen = false,
    TweenToFrozen = false,
    -- Prehistoric (via sea)
    SummonPrehistoric = false,
    TweenToPrehistoric = false,
    -- Leviathan
    AutoActivateLeviathan = false,
    AutoKillLeviathan = false,
    AutoGetHeartLeviathan = false,
    -- Drive boat to island
    AutoDriveBoat = false,
    AutoDriveBoatIsland = "Tiki Outpost",
    -- Factory / Pirate Raid
    AutoFactory = false,
    AutoPirateRaid = false,
    -- Server
    AutoHopServer = false,
    HopLowPing = false,
    -- Skills
    UseDevilFruitSkill = true,
    UseMeleeSkill = true,
    UseSwordSkill = true,
    UseGunSkill = true,
    DevilFruitZ = true, DevilFruitX = true, DevilFruitC = true, DevilFruitV = false, DevilFruitF = false,
    MeleeZ = true, MeleeX = true, MeleeC = true, MeleeV = true,
}

getgenv().Configs.Draco = {
    V1 = false,  -- Dragon Egg
    V2 = false,  -- Fire Flowers
    V3 = false,  -- Terror Shark (uses sea events)
}

--// ================== HELPER FUNCTIONS FOR SEA ==================
local function CheckBoat()
    for _, b in ipairs(Workspace.Boats:GetChildren()) do
        if b:FindFirstChild("Owner") and b.Owner.Value == Player.Name then return b end
    end
    return nil
end

local function FindMyBoat(boatName)
    for _, b in ipairs(Workspace.Boats:GetChildren()) do
        if b.Name == boatName then
            local owner = b:FindFirstChild("Owner") or b:FindFirstChild("OwnerName")
            if not owner or owner.Value == Player.Name then return b end
        end
    end
    return nil
end

local function MountBoat(boat)
    if not boat or not boat:FindFirstChild("VehicleSeat") then return false end
    local hrp = Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")
    local hum = Player.Character and Player.Character:FindFirstChild("Humanoid")
    if not hrp or not hum then return false end
    if hum.Sit then return true end
    local seat = boat.VehicleSeat
    TweenTo(seat.CFrame * CFrame.new(0, 2, 0))
    task.wait(1.5)
    if not hum.Sit then
        hrp.CFrame = seat.CFrame * CFrame.new(0, 1.5, 0)
        task.wait(0.5)
    end
    return hum.Sit
end

local function DismountBoat()
    local hum = Player.Character and Player.Character:FindFirstChild("Humanoid")
    if hum and hum.Sit then
        hum.Jump = true
        task.wait(0.5)
        hum.Jump = true
    end
end

local function TweenBoat(targetCF)
    local boatName = getgenv().Configs.SeaEvents.SelectedBoat or "Guardian"
    local boat = FindMyBoat(boatName)
    if not boat or not boat:FindFirstChild("VehicleSeat") then return end
    local seat = boat.VehicleSeat
    local speed = getgenv().Configs.SeaEvents.BoatTweenSpeed or 300
    local dist = (seat.Position - targetCF.Position).Magnitude
    if dist < 50 then return end
    local tween = TweenService:Create(seat, TweenInfo.new(dist / speed, Enum.EasingStyle.Linear), {CFrame = targetCF})
    tween:Play()
end

local function HasSeaEnemy()
    local enemies = {"Shark", "Terrorshark", "Piranha", "Fish Crew Member", "Haunted Crew Member", "SeaBeast1", "Leviathan"}
    for _, name in ipairs(enemies) do
        for _, v in ipairs(Workspace.Enemies:GetChildren()) do
            if v.Name == name and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then return true end
        end
    end
    for _, v in ipairs(Workspace.SeaBeasts:GetChildren()) do
        if v:FindFirstChild("Health") and v.Health.Value > 0 then return true end
    end
    return false
end

local function UseSeaSkills()
    local VIM = VirtualInputManager
    local cfg = getgenv().Configs.SeaEvents

    -- Fruit skills
    if cfg.UseDevilFruitSkill then
        for _, t in ipairs(Player.Backpack:GetChildren()) do
            if t:IsA("Tool") and t.ToolTip == "Blox Fruit" then
                Player.Character.Humanoid:EquipTool(t)
                if cfg.DevilFruitZ then VIM:SendKeyEvent(true,"Z",false,game); task.wait(0.05); VIM:SendKeyEvent(false,"Z",false,game) end
                if cfg.DevilFruitX then VIM:SendKeyEvent(true,"X",false,game); task.wait(0.05); VIM:SendKeyEvent(false,"X",false,game) end
                if cfg.DevilFruitC then VIM:SendKeyEvent(true,"C",false,game); task.wait(0.05); VIM:SendKeyEvent(false,"C",false,game) end
                if cfg.DevilFruitV then VIM:SendKeyEvent(true,"V",false,game); task.wait(0.05); VIM:SendKeyEvent(false,"V",false,game) end
                if cfg.DevilFruitF then VIM:SendKeyEvent(true,"F",false,game); task.wait(0.05); VIM:SendKeyEvent(false,"F",false,game) end
                break
            end
        end
    end

    -- Melee skills
    if cfg.UseMeleeSkill then
        for _, t in ipairs(Player.Backpack:GetChildren()) do
            if t:IsA("Tool") and t.ToolTip == "Melee" then
                Player.Character.Humanoid:EquipTool(t)
                if cfg.MeleeZ then VIM:SendKeyEvent(true,"Z",false,game); task.wait(0.05); VIM:SendKeyEvent(false,"Z",false,game) end
                if cfg.MeleeX then VIM:SendKeyEvent(true,"X",false,game); task.wait(0.05); VIM:SendKeyEvent(false,"X",false,game) end
                if cfg.MeleeC then VIM:SendKeyEvent(true,"C",false,game); task.wait(0.05); VIM:SendKeyEvent(false,"C",false,game) end
                if cfg.MeleeV then VIM:SendKeyEvent(true,"V",false,game); task.wait(0.05); VIM:SendKeyEvent(false,"V",false,game) end
                break
            end
        end
    end

    -- Sword skills
    if cfg.UseSwordSkill then
        for _, t in ipairs(Player.Backpack:GetChildren()) do
            if t:IsA("Tool") and t.ToolTip == "Sword" then
                Player.Character.Humanoid:EquipTool(t)
                VIM:SendKeyEvent(true,"Z",false,game); task.wait(0.05); VIM:SendKeyEvent(false,"Z",false,game)
                VIM:SendKeyEvent(true,"X",false,game); task.wait(0.05); VIM:SendKeyEvent(false,"X",false,game)
                break
            end
        end
    end

    -- Gun skills
    if cfg.UseGunSkill then
        for _, t in ipairs(Player.Backpack:GetChildren()) do
            if t:IsA("Tool") and t.ToolTip == "Gun" then
                Player.Character.Humanoid:EquipTool(t)
                VIM:SendKeyEvent(true,"Z",false,game); task.wait(0.05); VIM:SendKeyEvent(false,"Z",false,game)
                VIM:SendKeyEvent(true,"X",false,game); task.wait(0.05); VIM:SendKeyEvent(false,"X",false,game)
                break
            end
        end
    end
end

--// ================== MAIN SEA EVENT LOOP ==================
local _seaDangerZones = {
    ["Lv 1"] = CFrame.new(-21998.375, 30, -682.3),
    ["Lv 2"] = CFrame.new(-26779.5, 30, -822.9),
    ["Lv 3"] = CFrame.new(-31172, 30, -2257),
    ["Lv 4"] = CFrame.new(-34055, 30, -2560),
    ["Lv 5"] = CFrame.new(-38888, 30, -2163),
    ["Lv 6"] = CFrame.new(-44542, 30, -1245),
    ["Lv Infinite"] = CFrame.new(-148073, 9, 7721),
}
local _tikiCF = CFrame.new(-16927.451, 9.086, 433.864)

task.spawn(function()
    while task.wait(0.5) do
        local cfg = getgenv().Configs.SeaEvents
        if not cfg.Enable then continue end
        pcall(function()
            local hrp = Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")
            local hum = Player.Character and Player.Character:FindFirstChild("Humanoid")
            if not hrp or not hum then return end

            -- ======= BOAT BUY / MOUNT / SAIL =======
            if cfg.AutoSail then
                local boatName = cfg.SelectedBoat or "Guardian"
                local boat = FindMyBoat(boatName)

                if not boat then
                    -- Go to Tiki and buy boat
                    if (hrp.Position - _tikiCF.Position).Magnitude > 50 then
                        TweenTo(_tikiCF)
                    else
                        replicated.Remotes.CommF_:InvokeServer("BuyBoat", boatName)
                        task.wait(2)
                    end
                else
                    -- Mount boat
                    if not hum.Sit then
                        MountBoat(boat)
                    else
                        -- Apply speed
                        if cfg.SpeedBoat then
                            local seat = boat:FindFirstChild("VehicleSeat")
                            if seat then
                                seat.MaxSpeed = cfg.BoatTweenSpeed or 300
                                seat.Torque = 30
                                seat.TurnSpeed = 10
                            end
                        end

                        -- No clip rocks
                        if cfg.NoClipRock then
                            for _, part in ipairs(boat:GetDescendants()) do
                                if part:IsA("BasePart") then part.CanCollide = false end
                            end
                        end

                        -- Sail to danger zone
                        if not HasSeaEnemy() then
                            local zoneCF = _seaDangerZones[cfg.DangerLevel] or _seaDangerZones["Lv 1"]
                            TweenBoat(zoneCF)
                        end
                    end
                end
            end

            -- ======= SEA CREATURE COMBAT =======
            local seaMobs = {
                {cfg = cfg.KillShark, name = "Shark", folder = "Enemies"},
                {cfg = cfg.KillTerrorShark, name = "Terrorshark", folder = "Enemies", boss = true},
                {cfg = cfg.KillPiranha, name = "Piranha", folder = "Enemies"},
                {cfg = cfg.KillFishCrew, name = "Fish Crew Member", folder = "Enemies"},
                {cfg = cfg.KillHauntedCrew, name = "Haunted Crew Member", folder = "Enemies"},
                {cfg = cfg.KillGhostShip, name = "Ghost Ship", folder = "Enemies"},
                {cfg = cfg.KillPirateBrigade, name = "PirateBrigade", folder = "Enemies", boat = true},
                {cfg = cfg.KillPirateGrandBrigade, name = "PirateGrandBrigade", folder = "Enemies", boat = true},
                {cfg = cfg.KillFishBoat, name = "FishBoat", folder = "Enemies", boat = true},
            }

            for _, mob in ipairs(seaMobs) do
                if not mob.cfg then continue end
                local found = false
                local folder = mob.folder == "SeaBeasts" and Workspace.SeaBeasts or Workspace.Enemies
                for _, v in ipairs(folder:GetChildren()) do
                    if v.Name == mob.name and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                        found = true
                        if mob.boat and v:FindFirstChild("VehicleSeat") then
                            TweenTo(v.Engine.CFrame * CFrame.new(0, -50, -25))
                        elseif mob.boss then
                            -- Special handling for terror shark (fly above)
                            local hrp2 = v:FindFirstChild("HumanoidRootPart")
                            if hrp2 then
                                if cfg.DodgeTerrorShark and hum.Health < 5000 then
                                    TweenTo(CFrame.new(hrp2.Position + Vector3.new(0, 150, 0)))
                                else
                                    TweenTo(hrp2.CFrame * CFrame.new(0, 30, 0))
                                end
                            end
                        else
                            local hrp2 = v:FindFirstChild("HumanoidRootPart")
                            if hrp2 then TweenTo(hrp2.CFrame * CFrame.new(0, 20, 0)) end
                        end
                        UseSeaSkills()
                        AutoHaki()
                        break
                    end
                end
                if found then break end
            end

            -- ======= SEA BEAST =======
            if cfg.KillSeaBeast then
                for _, sb in ipairs(Workspace.SeaBeasts:GetChildren()) do
                    if sb.Name == "SeaBeast1" and sb:FindFirstChild("Health") and sb.Health.Value > 0 and sb:FindFirstChild("HumanoidRootPart") then
                        local pos = sb.HumanoidRootPart.Position
                        if cfg.DodgeSeaBeast and hum.Health < 5000 then
                            TweenTo(CFrame.new(pos + Vector3.new(math.random(-300,300), 200, math.random(-300,300))))
                        else
                            TweenTo(CFrame.new(pos + Vector3.new(0, 100, 0)))
                        end
                        UseSeaSkills()
                        AutoHaki()
                        break
                    end
                end
            end

            -- ======= LEVIATHAN =======
            if cfg.KillLeviathan then
                local lev = Workspace.SeaBeasts:FindFirstChild("Leviathan")
                if lev and lev:FindFirstChild("Health") and lev.Health.Value > 0 then
                    local seg = lev:FindFirstChild("Leviathan Segment")
                    if seg then
                        TweenTo(CFrame.new(seg.Position + Vector3.new(0, 200, 0)))
                        UseSeaSkills()
                        AutoHaki()
                    end
                end
            end

            -- ======= LIGHTNING (boat speed) =======
            if cfg.Lightning then
                for _, boat in ipairs(Workspace.Boats:GetChildren()) do
                    local seat = boat:FindFirstChild("VehicleSeat")
                    if seat then
                        seat.MaxSpeed = 500
                        seat.Torque = 50
                    end
                end
            end
        end)
    end
end)

--// ================== KITSUNE ISLAND HANDLER ==================
task.spawn(function()
    while task.wait(1) do
        local cfg = getgenv().Configs.SeaEvents
        if not cfg.Enable or not cfg.KitsuneIsland then continue end
        pcall(function()
            local island = Workspace._WorldOrigin.Locations:FindFirstChild("Kitsune Island", true)
            if not island then return end

            -- Tween to shrine
            if cfg.ShrineActive then
                local shrine = Workspace.Map:FindFirstChild("KitsuneIsland")
                if shrine and shrine:FindFirstChild("ShrineActive") then
                    for _, part in ipairs(shrine.ShrineActive:GetDescendants()) do
                        if part.Name == "NeonShrinePart" and part:IsA("BasePart") then
                            TweenTo(part.CFrame * CFrame.new(0, 2, 0))
                            replicated.Modules.Net:FindFirstChild("RE/TouchKitsuneStatue"):FireServer()
                            break
                        end
                    end
                end
            end

            -- Collect Azure Ember
            if cfg.CollectAzureEmber then
                local ember = Workspace:FindFirstChild("AttachedAzureEmber") or Workspace:FindFirstChild("EmberTemplate")
                if ember then
                    local part = ember:FindFirstChild("Part")
                    if part then
                        TweenTo(part.CFrame)
                        task.wait(0.5)
                    end
                end
            end

            -- Trade Azure Ember
            if cfg.TradeAzureEmber and CheckItem("Azure Ember") >= (cfg.SetAzureEmber or 20) then
                replicated.Modules.Net:FindFirstChild("RF/KitsuneStatuePray"):InvokeServer()
            end
        end)
    end
end)

--// ================== SUMMON KITSUNE ISLAND ==================
task.spawn(function()
    while task.wait(1) do
        if not (getgenv().Configs.SeaEvents.Enable and getgenv().Configs.SeaEvents.SummonKitsune) then continue end
        pcall(function()
            if Workspace._WorldOrigin.Locations:FindFirstChild("Kitsune Island") then return end
            local boatName = getgenv().Configs.SeaEvents.SelectedBoat or "Guardian"
            local boat = FindMyBoat(boatName)
            if not boat then
                TweenTo(_tikiCF)
                if (Player.Character.HumanoidRootPart.Position - _tikiCF.Position).Magnitude < 10 then
                    replicated.Remotes.CommF_:InvokeServer("BuyBoat", boatName)
                    task.wait(2)
                end
            else
                MountBoat(boat)
                TweenBoat(CFrame.new(-44541.76, 30, -1244.86))
            end
        end)
    end
end)

--// ================== MIRAGE ISLAND ==================
task.spawn(function()
    while task.wait(1) do
        if not (getgenv().Configs.SeaEvents.Enable and getgenv().Configs.SeaEvents.AutoFindMirage) then continue end
        pcall(function()
            if Workspace._WorldOrigin.Locations:FindFirstChild("Mirage Island", true) then return end
            local boatName = getgenv().Configs.SeaEvents.SelectedBoat or "Guardian"
            local boat = FindMyBoat(boatName)
            if not boat then
                TweenTo(_tikiCF)
                if (Player.Character.HumanoidRootPart.Position - _tikiCF.Position).Magnitude < 10 then
                    replicated.Remotes.CommF_:InvokeServer("BuyBoat", boatName)
                    task.wait(2)
                end
            else
                MountBoat(boat)
                TweenBoat(CFrame.new(-34054.69, 30.22, -2560.12))
            end
        end)
    end
end)

task.spawn(function()
    while task.wait(0.5) do
        if not (getgenv().Configs.SeaEvents.Enable and getgenv().Configs.SeaEvents.AutoBlueGear) then continue end
        pcall(function()
            local myst = Workspace.Map:FindFirstChild("MysticIsland")
            if not myst then return end
            -- Look at moon
            local moonDir = Lighting:GetMoonDirection()
            if Workspace.CurrentCamera then
                Workspace.CurrentCamera.CFrame = CFrame.lookAt(
                    Workspace.CurrentCamera.CFrame.Position,
                    Workspace.CurrentCamera.CFrame.Position + moonDir
                )
            end
            -- Check night time
            local nightTime = Lighting.ClockTime >= 18 or Lighting.ClockTime <= 6
            if nightTime then
                for _, part in ipairs(myst:GetDescendants()) do
                    if part:IsA("MeshPart") and part.Material == Enum.Material.Neon and part.BrickColor == BrickColor.new("Bright blue") then
                        TweenTo(part.CFrame)
                        break
                    end
                end
            end
        end)
    end
end)

--// ================== FROZEN DIMENSION ==================
task.spawn(function()
    while task.wait(1) do
        if not (getgenv().Configs.SeaEvents.Enable and getgenv().Configs.SeaEvents.SummonFrozen) then continue end
        pcall(function()
            if Workspace._WorldOrigin.Locations:FindFirstChild("Frozen Dimension") then return end
            local boatName = getgenv().Configs.SeaEvents.SelectedBoat or "Guardian"
            local boat = FindMyBoat(boatName)
            if not boat then
                TweenTo(_tikiCF)
                if (Player.Character.HumanoidRootPart.Position - _tikiCF.Position).Magnitude < 10 then
                    replicated.Remotes.CommF_:InvokeServer("BuyBoat", boatName)
                    task.wait(2)
                end
            else
                MountBoat(boat)
                TweenBoat(CFrame.new(-148073.36, 9, 7721.05))
            end
        end)
    end
end)

task.spawn(function()
    while task.wait(0.5) do
        if not (getgenv().Configs.SeaEvents.Enable and getgenv().Configs.SeaEvents.TweenToFrozen) then continue end
        pcall(function()
            local frozen = Workspace._WorldOrigin.Locations:FindFirstChild("Frozen Dimension")
            if frozen then TweenTo(frozen.CFrame * CFrame.new(0, 100, 0)) end
        end)
    end
end)

--// ================== LEVIATHAN HANDLERS ==================
task.spawn(function()
    while task.wait(0.5) do
        if not (getgenv().Configs.SeaEvents.Enable and getgenv().Configs.SeaEvents.AutoActivateLeviathan) then continue end
        pcall(function()
            for _, v in ipairs(Workspace.NPCs:GetChildren()) do
                if v.Name:lower():find("leviathan") or v.Name:lower():find("bribe") then
                    local hrp = v:FindFirstChild("HumanoidRootPart") or v:FindFirstChildWhichIsA("BasePart")
                    if hrp then
                        if (Player.Character.HumanoidRootPart.Position - hrp.Position).Magnitude > 20 then
                            TweenTo(hrp.CFrame)
                        else
                            replicated.Remotes.CommF_:InvokeServer("ActivateLeviathan")
                            replicated.Remotes.CommF_:InvokeServer("InfoLeviathan", "1")
                        end
                    end
                end
            end
        end)
    end
end)

task.spawn(function()
    while task.wait(0.1) do
        if not (getgenv().Configs.SeaEvents.Enable and getgenv().Configs.SeaEvents.AutoKillLeviathan) then continue end
        pcall(function()
            for _, v in ipairs(Workspace:GetDescendants()) do
                if v:IsA("Model") and v.Name:lower():find("tail") then
                    local tailHum = v:FindFirstChildOfClass("Humanoid")
                    if tailHum and tailHum.Health > 0 then
                        local tailRoot = v:FindFirstChild("HumanoidRootPart") or v:FindFirstChildWhichIsA("BasePart")
                        if tailRoot then
                            TweenTo(tailRoot.CFrame * CFrame.new(0, 5, -10))
                            UseSeaSkills()
                            AutoHaki()
                            break
                        end
                    end
                end
            end
        end)
    end
end)

--// ================== AUTO DRIVE BOAT TO ISLAND ==================
local _driveIslandPositions = {
    ["Tiki Outpost"] = CFrame.new(-16927.451, 9.086, 433.864),
    ["Hydra Island"] = CFrame.new(-148073.36, 9, 7721.05),
    ["Mirage Area"] = CFrame.new(-34054.69, 30.22, -2560.12),
    ["Kitsune Area"] = CFrame.new(-44541.76, 30, -1244.86),
}

task.spawn(function()
    while task.wait(1) do
        if not (getgenv().Configs.SeaEvents.Enable and getgenv().Configs.SeaEvents.AutoDriveBoat) then continue end
        pcall(function()
            local targetName = getgenv().Configs.SeaEvents.AutoDriveBoatIsland or "Tiki Outpost"
            local targetCF = _driveIslandPositions[targetName] or _driveIslandPositions["Tiki Outpost"]
            local boatName = getgenv().Configs.SeaEvents.SelectedBoat or "Guardian"
            local boat = FindMyBoat(boatName)
            if not boat then
                TweenTo(_tikiCF)
                if (Player.Character.HumanoidRootPart.Position - _tikiCF.Position).Magnitude < 10 then
                    replicated.Remotes.CommF_:InvokeServer("BuyBoat", boatName)
                end
            else
                MountBoat(boat)
                TweenBoat(targetCF)
            end
        end)
    end
end)

--// ================== AUTO DRACO V1-V3 (USING SEA EVENTS) ==================
task.spawn(function()
    while task.wait(3) do
        if not getgenv().Configs.Draco.V1 then continue end
        pcall(function()
            -- V1: Need Dragon Egg -> Enable Prehistoric island finding via sea
            if CheckItem("Dragon Egg") < 1 then
                getgenv().Configs.SeaEvents.Enable = true
                getgenv().Configs.SeaEvents.SummonPrehistoric = true
                getgenv().Configs.SeaEvents.TweenToPrehistoric = true
                getgenv().Configs.Prehistoric.FindIsland = true
                getgenv().Configs.Prehistoric.PatchEvent = true
                getgenv().Configs.Prehistoric.CollectDragonEggs = true
                UpdateStatus("Draco V1: Hunting Dragon Egg...")
            else
                getgenv().Configs.SeaEvents.SummonPrehistoric = false
                getgenv().Configs.SeaEvents.TweenToPrehistoric = false
                getgenv().Configs.Prehistoric.FindIsland = false
                getgenv().Configs.Prehistoric.PatchEvent = false
                getgenv().Configs.Prehistoric.CollectDragonEggs = false
                getgenv().Configs.Draco.V1 = false
                UpdateStatus("Draco V1: Dragon Egg collected!")
            end
        end)
    end
end)

task.spawn(function()
    while task.wait(1) do
        if not getgenv().Configs.Draco.V2 then continue end
        pcall(function()
            local flowers = Workspace:FindFirstChild("FireFlowers")
            if not flowers then
                -- Kill Forest Pirates to spawn FireFlowers
                local mob = GetAliveMonster("Forest Pirate")
                if mob then
                    TweenTo(mob.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
                    AutoHaki()
                    UpdateStatus("Draco V2: Killing Forest Pirate for FireFlowers...")
                else
                    TweenTo(CFrame.new(-13206.452, 425.892, -7964.554))
                end
            else
                -- Collect FireFlowers
                for _, flower in ipairs(flowers:GetChildren()) do
                    if flower:IsA("Model") and flower.PrimaryPart then
                        local d = (flower.PrimaryPart.Position - Player.Character.HumanoidRootPart.Position).Magnitude
                        if d <= 100 then
                            VirtualInputManager:SendKeyEvent(true, "E", false, game)
                            task.wait(1.5)
                            VirtualInputManager:SendKeyEvent(false, "E", false, game)
                            UpdateStatus("Draco V2: Collected FireFlower!")
                        else
                            TweenTo(CFrame.new(flower.PrimaryPart.Position))
                        end
                    end
                end
            end
        end)
    end
end)

task.spawn(function()
    while task.wait(2) do
        if not getgenv().Configs.Draco.V3 then continue end
        pcall(function()
            -- V3: Kill Terror Shark -> Enable sea events
            getgenv().Configs.SeaEvents.Enable = true
            getgenv().Configs.SeaEvents.KillTerrorShark = true
            getgenv().Configs.SeaEvents.AutoSail = true
            getgenv().Configs.SeaEvents.DangerLevel = "Lv Infinite"
            UpdateStatus("Draco V3: Hunting Terror Shark...")
        end)
    end
end)

--// ================== FACTORY / PIRATE RAID AUTO ==================
task.spawn(function()
    while task.wait(2) do
        if not getgenv().Configs.SeaEvents.AutoFactory then continue end
        pcall(function()
            if World2 then
                local core = GetAliveBoss("Core")
                if core then
                    TweenTo(core.HumanoidRootPart.CFrame * CFrame.new(0, 40, 0))
                    AutoHaki()
                    UseSeaSkills()
                else
                    TweenTo(CFrame.new(448.47, 199.36, -441.39))
                end
            end
        end)
    end
end)

task.spawn(function()
    while task.wait(2) do
        if not getgenv().Configs.SeaEvents.AutoPirateRaid then continue end
        pcall(function()
            if World1 then
                local mob = GetAliveMonster("Galley Pirate") or GetAliveMonster("Galley Captain")
                if mob then
                    TweenTo(mob.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                    AutoHaki()
                    UseSeaSkills()
                else
                    TweenTo(CFrame.new(-5539, 314, -2972))
                end
            end
        end)
    end
end)

--// ================== AUTO HOP / LOW PING ==================
task.spawn(function()
    while task.wait(60) do
        if not getgenv().Configs.SeaEvents.AutoHopServer then continue end
        pcall(function()
            if #Players:GetPlayers() > 8 then HopLowServer(6) end
        end)
    end
end)

task.spawn(function()
    while task.wait(120) do
        if not getgenv().Configs.SeaEvents.HopLowPing then continue end
        pcall(function()
            local ping = Stats.Network.ServerStatsItem["Data Ping"]:GetValue()
            if tonumber(ping) > 250 then HopLowServer(6) end
        end)
    end
end)

--// ================== SERVER STATUS NOTIFICATIONS ==================
task.spawn(function()
    while task.wait(5) do
        if not getgenv().Configs.SeaEvents.Enable then continue end
        pcall(function()
            if Workspace._WorldOrigin.Locations:FindFirstChild("Kitsune Island") then
                UpdateStatus("Kitsune Island Spawned!")
            end
            if Workspace._WorldOrigin.Locations:FindFirstChild("Mirage Island") then
                UpdateStatus("Mirage Island Spawned!")
            end
            if Workspace._WorldOrigin.Locations:FindFirstChild("Frozen Dimension") then
                UpdateStatus("Frozen Dimension Spawned!")
            end
            if Workspace._WorldOrigin.Locations:FindFirstChild("Prehistoric Island") then
                UpdateStatus("Prehistoric Island Spawned!")
            end
        end)
    end
end)

--// ================== FINAL INITIALIZATION ==================
UpdateStatus("Part 6 – Sea Events & Draco Systems Active")
--[[
   ╔══════════════════════════════════════════════════════════════╗
   ║     ASTRAL HUB - ULTIMATE MEGA MERGE (PART 7 – REWRITTEN)   ║
   ║   Auto Prehistoric (Full Volcanic), Auto V4 (Trials, Moon,  ║
   ║   Gear, Lever), Auto Fruit (Buy Stock, Eat, Store, Drop,    ║
   ║   Teleport, Collect, Notify), Auto Hop Low Ping & More       ║
   ╚══════════════════════════════════════════════════════════════╝
--]]

--// ================== CONFIGS EXTENSION ==================
getgenv().Configs = getgenv().Configs or {}

-- Prehistoric / Volcanic
getgenv().Configs.Prehistoric = {
    FindIsland = false,
    PatchEvent = false,
    CollectDinoBones = false,
    CollectDragonEggs = false,
    ResetWhenComplete = false,
    FullyVolcanic = false,
    SelectedBoat = "Guardian",
    AutoRemoveLava = false,
    AutoKillGolem = false,
    AutoHitVolcanoRocks = false,
}

-- Auto V4
getgenv().Configs.RaceV4 = {
    CompleteTrials = false,
    PullLever = false,
    LookMoon = false,
    CollectGear = false,
    TeleportToTemple = false,
    TeleportToDoor = false,
    AutoTrain = false,
    AutoBuyGear = false,
    KillPlayerAfterTrial = false,
}

-- Auto Fruit
getgenv().Configs.Fruit = {
    AutoBuyFromStock = false,
    SelectedFruit = nil,
    AutoBuyMirageStock = false,
    SelectedMirageFruit = nil,
    AutoEatFruit = false,
    AutoStoreFruit = false,
    AutoDropFruit = false,
    AutoTeleportToFruit = false,
    AutoTweenToFruit = false,
    AutoCollectFruit = false,
    AutoRandomFruit = false,
    FruitNotification = false,
    StoreRarityFruit = "Common - Mythical",
    FruitBlacklist = {"Bomb-Bomb", "Spike-Spike", "Chop-Chop", "Spring-Spring", "Kilo-Kilo", "Smoke-Smoke", "Spin-Spin"},
}

--// ================== PREHISTORIC ISLAND CONSTANTS ==================
local _Prehis = {
    TikiCF = CFrame.new(-16927.451, 9.086, 433.864),
    DragonNPC_CF = CFrame.new(5864.86377, 1209.55066, 812.775024),
    JungleQuest_CF = CFrame.new(-12680, 389, -9902),
    JungleMob_CF = CFrame.new(-11778, 426, -10592),
    Vslt_CF = CFrame.new(4789.29639, 1078.59082, 962.764099),
    Hydra_CF = CFrame.new(4620.6157, 1002.2954, 399.0868),
    Sail_CF = CFrame.new(-148073.359, 9.0, 7721.051),
    Boat_Speed = 300,
    Tree_CFs = {
        CFrame.new(5260.28223, 1004.24329, 347.062622),
        CFrame.new(5237.94775, 1004.24329, 429.596344),
        CFrame.new(5320.87793, 1004.24329, 439.152954),
        CFrame.new(5346.70752, 1004.24329, 359.389008),
    },
    Golem_Names = {"Lava Golem", "Aura Golem", "Stone Golem", "Rock Golem"},
}

--// ================== PREHISTORIC HELPER FUNCTIONS ==================
local function GetMat(name)
    local n = 0
    pcall(function()
        for _, v in pairs(replicated.Remotes.CommF_:InvokeServer("getInventory")) do
            if type(v) == "table" and v.Name == name then n = tonumber(v.Count) or 0; break end
        end
    end)
    return n
end

local function IsOnDragonQuest()
    local text = ""
    pcall(function()
        local RF = replicated.Modules.Net:FindFirstChild("RF/DragonHunter")
        if RF then
            local res = RF:InvokeServer({Context = "Check"})
            if res then for k, v in pairs(res) do if k == "Text" then text = tostring(v); break end end end
        end
    end)
    return text:find("Venomous") or text:find("Hydra") or text:find("Destroy") or text:find("tree")
end

local function RequestDragonQuest()
    TweenTo(_Prehis.DragonNPC_CF)
    task.wait(0.5)
    pcall(function()
        replicated.Modules.Net:FindFirstChild("RF/DragonHunter"):InvokeServer({Context = "RequestQuest"})
    end)
end

local function GetDragonQuestText()
    local text = ""
    pcall(function()
        local RF = replicated.Modules.Net:FindFirstChild("RF/DragonHunter")
        if RF then
            local res = RF:InvokeServer({Context = "Check"})
            if res then for k, v in pairs(res) do if k == "Text" then text = tostring(v); break end end end
        end
    end)
    return text
end

local function GetActiveVolcanoRock()
    pcall(function()
        local island = Workspace.Map:FindFirstChild("PrehistoricIsland")
        if not island or not island.Core or not island.Core.VolcanoRocks then return nil end
        for _, m in pairs(island.Core.VolcanoRocks:GetChildren()) do
            if m:IsA("Model") then
                local vrock = m:FindFirstChild("volcanorock")
                if vrock and vrock:IsA("MeshPart") then
                    local col = vrock.Color
                    if col == Color3.fromRGB(185, 53, 56) or col == Color3.fromRGB(185, 53, 57) then return vrock end
                end
                local vfx = m:FindFirstChild("VFXLayer")
                local at0 = vfx and vfx:FindFirstChild("At0")
                local glow = at0 and at0:FindFirstChild("Glow")
                if glow and glow.Enabled then return vfx end
            end
        end
    end)
    return nil
end

local function GetGolem()
    for _, name in pairs(_Prehis.Golem_Names) do
        for _, v in pairs(Workspace.Enemies:GetChildren()) do
            if v.Name == name and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                return v
            end
        end
    end
    return nil
end

local function RemoveLava()
    pcall(function()
        local island = Workspace.Map:FindFirstChild("PrehistoricIsland")
        if not island then return end
        local il = island.Core:FindFirstChild("InteriorLava")
        if il then il:Destroy() end
        for _, obj in ipairs(island:GetDescendants()) do
            pcall(function()
                if (obj:IsA("BasePart") or obj:IsA("MeshPart")) and obj.Name:lower():find("lava") then obj:Destroy() end
            end)
        end
        local trial = island:FindFirstChild("TrialTeleport")
        for _, obj in ipairs(island:GetDescendants()) do
            pcall(function()
                if obj.Name == "TouchInterest" and not (trial and obj:IsDescendantOf(trial)) then obj.Parent:Destroy() end
            end)
        end
    end)
end

--// ================== PREHISTORIC ISLAND FINDER ==================
task.spawn(function()
    while task.wait(1) do
        if not (getgenv().Configs.Prehistoric.FindIsland or getgenv().Configs.Prehistoric.FullyVolcanic) then continue end
        pcall(function()
            if Workspace._WorldOrigin.Locations:FindFirstChild("Prehistoric Island", true) then
                local island = Workspace._WorldOrigin.Locations:FindFirstChild("Prehistoric Island")
                TweenTo(island.CFrame * CFrame.new(0, 500, 0))

                -- Activate event if on island
                if Workspace.Map:FindFirstChild("PrehistoricIsland") then
                    local core = Workspace.Map.PrehistoricIsland:FindFirstChild("Core")
                    local prompt = core and core:FindFirstChild("ActivationPrompt")
                    if prompt then
                        local pp = prompt:FindFirstChildOfClass("ProximityPrompt") or prompt:FindFirstChild("ProximityPrompt")
                        if pp then
                            TweenTo(prompt.CFrame)
                            if (Player.Character.HumanoidRootPart.Position - prompt.CFrame.Position).Magnitude < 50 then
                                fireproximityprompt(pp, math.huge)
                                VirtualInputManager:SendKeyEvent(true, "E", false, game)
                                task.wait(1.5)
                                VirtualInputManager:SendKeyEvent(false, "E", false, game)
                            end
                        end
                    end
                end
                return
            end

            -- Not on island: sail
            local boat = CheckBoat()
            if not boat then
                TweenTo(_Prehis.TikiCF)
                if (Player.Character.HumanoidRootPart.Position - _Prehis.TikiCF.Position).Magnitude < 10 then
                    replicated.Remotes.CommF_:InvokeServer("BuyBoat", getgenv().Configs.Prehistoric.SelectedBoat or "Guardian")
                    task.wait(2)
                end
            else
                if Player.Character.Humanoid.Sit == false then
                    MountBoat(boat)
                else
                    TweenBoat(_Prehis.Sail_CF)
                end
            end
        end)
    end
end)

--// ================== PREHISTORIC EVENT COMPLETER ==================
task.spawn(function()
    while task.wait(0.5) do
        if not (getgenv().Configs.Prehistoric.PatchEvent or getgenv().Configs.Prehistoric.FullyVolcanic) then continue end
        pcall(function()
            local island = Workspace.Map:FindFirstChild("PrehistoricIsland")
            if not island then return end

            -- Remove lava
            if getgenv().Configs.Prehistoric.AutoRemoveLava or getgenv().Configs.Prehistoric.FullyVolcanic then
                RemoveLava()
            end

            -- Kill golems
            if getgenv().Configs.Prehistoric.AutoKillGolem or getgenv().Configs.Prehistoric.FullyVolcanic then
                local golem = GetGolem()
                if golem then
                    golem.Humanoid.WalkSpeed = 0
                    golem.HumanoidRootPart.CanCollide = false
                    golem.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                    TweenTo(golem.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                    AutoHaki()
                    EquipTool("Melee")
                    UseSeaSkills()
                    Attack()
                end
            end

            -- Hit active volcano rocks
            if getgenv().Configs.Prehistoric.AutoHitVolcanoRocks or getgenv().Configs.Prehistoric.FullyVolcanic then
                local rock = GetActiveVolcanoRock()
                if rock then
                    TweenTo(CFrame.new(rock.Position + Vector3.new(0, 5, 0)))
                    AutoHaki()
                    UseSeaSkills()
                    Attack()
                end
            end

            -- Auto reset when complete
            if getgenv().Configs.Prehistoric.ResetWhenComplete then
                local trial = island:FindFirstChild("TrialTeleport")
                if trial and trial:FindFirstChild("TouchInterest") then
                    if Player.Character and Player.Character:FindFirstChild("Humanoid") then
                        Player.Character.Humanoid.Health = 0
                    end
                end
            end
        end)
    end
end)

--// ================== DRAGON EGG / DINO BONE COLLECTOR ==================
task.spawn(function()
    while task.wait(1) do
        if not getgenv().Configs.Prehistoric.CollectDragonEggs then continue end
        pcall(function()
            local island = Workspace.Map:FindFirstChild("PrehistoricIsland")
            if not island then return end
            local se = island.Core and island.Core:FindFirstChild("SpawnedDragonEggs")
            if se then
                for _, egg in pairs(se:GetChildren()) do
                    if egg:IsA("Model") then
                        local molten = egg:FindFirstChild("Molten")
                        if molten then
                            TweenTo(molten.CFrame)
                            local pp = molten:FindFirstChildOfClass("ProximityPrompt") or molten:FindFirstChild("ProximityPrompt")
                            if pp then fireproximityprompt(pp, 30) end
                            VirtualInputManager:SendKeyEvent(true, "E", false, game)
                            task.wait(1)
                            VirtualInputManager:SendKeyEvent(false, "E", false, game)
                        end
                    end
                end
            end
        end)
    end
end)

task.spawn(function()
    while task.wait(1) do
        if not getgenv().Configs.Prehistoric.CollectDinoBones then continue end
        pcall(function()
            for _, v in pairs(Workspace:GetChildren()) do
                if v.Name == "DinoBone" and v:IsA("BasePart") then
                    TweenTo(CFrame.new(v.Position))
                    task.wait(0.5)
                end
            end
        end)
    end
end)

--// ================== FULLY VOLCANIC MASTER LOOP ==================
local VolcanoState = { Phase = "idle" }

local function FullyVolcanicCycle()
    while getgenv().Configs.Prehistoric.FullyVolcanic do
        -- PHASE 1: Farm Scrap Metal (need 10)
        if GetMat("Scrap Metal") < 10 then
            VolcanoState.Phase = "Scrap"
            UpdateStatus("Volcanic [1/5]: Scrap Metal " .. GetMat("Scrap Metal") .. "/10")
            if not Player.PlayerGui.Main.Quest.Visible then
                TweenTo(_Prehis.JungleQuest_CF); task.wait(0.5)
                replicated.Remotes.CommF_:InvokeServer("StartQuest", "DeepForestIsland2", 1)
            end
            local mob = GetAliveMonster("Jungle Pirate") or GetAliveMonster("Forest Pirate")
            if mob then
                TweenTo(mob.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
                AutoHaki()
            else
                TweenTo(_Prehis.JungleMob_CF)
            end
            task.wait(0.5)

        -- PHASE 2: Farm Blaze Ember (need 15)
        elseif GetMat("Blaze Ember") < 15 then
            VolcanoState.Phase = "Blaze"
            UpdateStatus("Volcanic [2/5]: Blaze Ember " .. GetMat("Blaze Ember") .. "/15")
            local qt = GetDragonQuestText()
            if qt == "" then
                RequestDragonQuest()
                task.wait(1)
            elseif qt:find("Venomous") then
                local mob = GetAliveMonster("Venomous Assailant")
                if mob then TweenTo(mob.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)); AutoHaki() else TweenTo(_Prehis.Vslt_CF) end
            elseif qt:find("Hydra") then
                local mob = GetAliveMonster("Hydra Enforcer")
                if mob then TweenTo(mob.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)); AutoHaki() else TweenTo(_Prehis.Hydra_CF) end
            elseif qt:find("Destroy") or qt:find("tree") then
                for _, cf in pairs(_Prehis.Tree_CFs) do TweenTo(cf); task.wait(0.3); AutoHaki(); Attack() end
            end
            -- Collect ember if quest complete
            local ember = Workspace:FindFirstChild("EmberTemplate")
            if ember and ember:FindFirstChild("Part") then TweenTo(ember.Part.CFrame) end
            task.wait(0.5)

        -- PHASE 3: Craft Volcanic Magnet
        elseif not HasItem("Volcanic Magnet") then
            VolcanoState.Phase = "Craft"
            UpdateStatus("Volcanic [3/5]: Crafting Magnet...")
            TweenTo(_Prehis.DragonNPC_CF); task.wait(0.8)
            local tries = 0
            while not HasItem("Volcanic Magnet") and tries < 12 do
                tries = tries + 1
                pcall(function() replicated.Remotes.CommF_:InvokeServer("CraftItem", "Craft", "Volcanic Magnet") end)
                task.wait(0.5)
            end

        -- PHASE 4: Sail to Prehistoric Island
        elseif not Workspace._WorldOrigin.Locations:FindFirstChild("Prehistoric Island") then
            VolcanoState.Phase = "Sail"
            UpdateStatus("Volcanic [4/5]: Sailing to island...")
            getgenv().Configs.Prehistoric.FindIsland = true
            local elapsed = 0
            while not Workspace._WorldOrigin.Locations:FindFirstChild("Prehistoric Island") and elapsed < 600 do
                task.wait(1); elapsed = elapsed + 1
            end
            getgenv().Configs.Prehistoric.FindIsland = false

        -- PHASE 5: Complete Raid
        else
            VolcanoState.Phase = "Raid"
            UpdateStatus("Volcanic [5/5]: Completing raid...")
            getgenv().Configs.Prehistoric.PatchEvent = true
            getgenv().Configs.Prehistoric.CollectDragonEggs = true
            getgenv().Configs.Prehistoric.CollectDinoBones = true
            local raidStart = os.time()
            local eventDone = false
            while not eventDone and os.time() - raidStart < 360 do
                task.wait(1)
                if not Workspace._WorldOrigin.Locations:FindFirstChild("Prehistoric Island") and os.time() - raidStart > 30 then eventDone = true end
            end
            getgenv().Configs.Prehistoric.PatchEvent = false
            getgenv().Configs.Prehistoric.CollectDragonEggs = false
            getgenv().Configs.Prehistoric.CollectDinoBones = false
            -- Reset character for next cycle
            pcall(function() if Player.Character and Player.Character:FindFirstChild("Humanoid") then Player.Character.Humanoid.Health = 0 end end)
            task.wait(5)
        end
        task.wait(0.8)
    end
end

task.spawn(function()
    while task.wait(2) do
        if getgenv().Configs.Prehistoric.FullyVolcanic and getgenv().Configs.AutoFarming then
            task.spawn(FullyVolcanicCycle)
            break
        end
    end
end)

--// ================== RACE V4 SYSTEMS ==================
-- V4 Trials Complete
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
                    if sb:FindFirstChild("Health") and sb.Health.Value > 0 and sb:FindFirstChild("HumanoidRootPart") then
                        TweenTo(sb.HumanoidRootPart.CFrame * CFrame.new(0, 200, 0)); break
                    end
                end
            elseif race == "Cyborg" then
                local t = Workspace.Map:FindFirstChild("CyborgTrial")
                if t then TweenTo(t.Floor.CFrame * CFrame.new(0, 500, 0)) end
            elseif race == "Skypiea" then
                local t = Workspace.Map:FindFirstChild("SkyTrial")
                if t and t.Model:FindFirstChild("FinishPart") then TweenTo(t.Model.FinishPart.CFrame) end
            elseif race == "Human" or race == "Ghoul" then
                local m = GetAliveBoss("Ancient Vampire") or GetAliveBoss("Ancient Zombie")
                if m then TweenTo(m.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0)) end
            end
        end)
    end
end)

-- V4 Pull Lever + Moon + Gear
task.spawn(function()
    while task.wait(1) do
        if not getgenv().Configs.RaceV4.PullLever then continue end
        pcall(function()
            local myst = Workspace.Map:FindFirstChild("MysticIsland")
            if not myst then return end
            local v4Prog = replicated.Remotes.CommF_:InvokeServer("RaceV4Progress", "Check")
            if v4Prog == 4 then
                -- Look at moon
                if getgenv().Configs.RaceV4.LookMoon then
                    local moonDir = Lighting:GetMoonDirection()
                    Player.Character.HumanoidRootPart.CFrame = CFrame.lookAt(
                        Player.Character.HumanoidRootPart.Position,
                        Player.Character.HumanoidRootPart.Position + moonDir
                    )
                    task.wait(0.5)
                    replicated.Remotes.CommE:FireServer("ActivateAbility")
                    task.wait(5)
                end

                -- Collect translucent gears
                if getgenv().Configs.RaceV4.CollectGear then
                    for _, obj in ipairs(myst:GetDescendants()) do
                        if obj:IsA("MeshPart") and obj.Transparency < 0.1 then
                            TweenTo(obj.CFrame)
                            task.wait(0.3)
                            VirtualInputManager:SendKeyEvent(true, "Space", false, game)
                            task.wait(0.2)
                            VirtualInputManager:SendKeyEvent(false, "Space", false, game)
                        end
                    end
                end

                -- Pull lever
                for _, obj in ipairs(myst:GetDescendants()) do
                    if obj:IsA("ProximityPrompt") and obj.Parent.Name == "Lever" then
                        TweenTo(obj.Parent.CFrame)
                        fireproximityprompt(obj)
                        break
                    end
                end
            end
        end)
    end
end)

-- V4 Teleport to Temple of Time
task.spawn(function()
    while task.wait(1) do
        if not getgenv().Configs.RaceV4.TeleportToTemple then continue end
        pcall(function()
            Player.Character.HumanoidRootPart.CFrame = CFrame.new(28286.355, 14895.302, 102.625)
        end)
    end
end)

-- V4 Teleport to Race Door
task.spawn(function()
    while task.wait(1) do
        if not getgenv().Configs.RaceV4.TeleportToDoor then continue end
        pcall(function()
            local race = Player.Data.Race.Value
            local doors = {
                Human = CFrame.new(29221.822, 14890.976, -205.991),
                Skypiea = CFrame.new(28960.158, 14919.624, 235.039),
                Fishman = CFrame.new(28231.176, 14890.976, -211.642),
                Cyborg = CFrame.new(28502.682, 14895.976, -423.728),
                Ghoul = CFrame.new(28674.244, 14890.677, 445.431),
                Mink = CFrame.new(29012.342, 14890.976, -380.149),
            }
            local cf = doors[race]
            if cf then TweenTo(cf) end
        end)
    end
end)

-- V4 Auto Train
task.spawn(function()
    while task.wait(0.5) do
        if not getgenv().Configs.RaceV4.AutoTrain then continue end
        pcall(function()
            local raceEnergy = Player.Character and Player.Character:FindFirstChild("RaceEnergy")
            local transformed = Player.Character and Player.Character:FindFirstChild("RaceTransformed")
            if raceEnergy and raceEnergy.Value == 1 and transformed and not transformed.Value then
                VirtualInputManager:SendKeyEvent(true, "Y", false, game)
                task.wait(0.1)
                VirtualInputManager:SendKeyEvent(false, "Y", false, game)
            end
            -- Farm mobs if not transformed
            if transformed and not transformed.Value then
                local mob = nil
                for _, name in ipairs({"Cocoa Warrior", "Chocolate Bar Battler", "Sweet Thief", "Candy Rebel"}) do
                    mob = GetAliveMonster(name)
                    if mob then break end
                end
                if mob then
                    TweenTo(mob.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                    AutoHaki()
                else
                    TweenTo(CFrame.new(216.211, 126.935, -12599.073))
                end
            end
        end)
    end
end)

-- V4 Auto Buy Gear
task.spawn(function()
    while task.wait(5) do
        if not getgenv().Configs.RaceV4.AutoBuyGear then continue end
        pcall(function()
            replicated.Remotes.CommF_:InvokeServer("UpgradeRace", "Buy")
        end)
    end
end)

-- V4 Kill Player After Trial
task.spawn(function()
    while task.wait(0.2) do
        if not getgenv().Configs.RaceV4.KillPlayerAfterTrial then continue end
        for _, p in ipairs(Players:GetPlayers()) do
            if p ~= Player and p.Character and p.Character:FindFirstChild("HumanoidRootPart") and p.Character.Humanoid.Health > 0 then
                if (Player.Character.HumanoidRootPart.Position - p.Character.HumanoidRootPart.Position).Magnitude < 250 then
                    TweenTo(p.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 15)); break
                end
            end
        end
    end
end)

--// ================== AUTO FRUIT SYSTEMS ==================
-- Get fruit lists from stock
local function GetStockFruits()
    local fruits = {}
    pcall(function()
        for _, v in pairs(replicated.Remotes.CommF_:InvokeServer("GetFruits", false)) do
            if v.OnSale == true then table.insert(fruits, v.Name) end
        end
    end)
    return fruits
end

local function GetMirageFruits()
    local fruits = {}
    pcall(function()
        for _, v in pairs(replicated.Remotes.CommF_:InvokeServer("GetFruits", true)) do
            if v.OnSale == true then table.insert(fruits, v.Name) end
        end
    end)
    return fruits
end

local function IsFruitBlacklisted(fruitName)
    for _, bad in ipairs(getgenv().Configs.Fruit.FruitBlacklist or {}) do
        if fruitName == bad then return true end
    end
    return false
end

-- Auto Buy from Stock
task.spawn(function()
    while task.wait(5) do
        if not getgenv().Configs.Fruit.AutoBuyFromStock then continue end
        local fruit = getgenv().Configs.Fruit.SelectedFruit
        if not fruit then continue end
        pcall(function()
            replicated.Remotes.CommF_:InvokeServer("PurchaseRawFruit", fruit)
        end)
    end
end)

-- Auto Buy from Mirage Stock
task.spawn(function()
    while task.wait(5) do
        if not getgenv().Configs.Fruit.AutoBuyMirageStock then continue end
        local fruit = getgenv().Configs.Fruit.SelectedMirageFruit
        if not fruit then continue end
        pcall(function()
            replicated.Remotes.CommF_:InvokeServer("PurchaseRawFruit", fruit)
        end)
    end
end)

-- Auto Eat Fruit
task.spawn(function()
    while task.wait(2) do
        if not getgenv().Configs.Fruit.AutoEatFruit then continue end
        pcall(function()
            for _, tool in ipairs(Player.Backpack:GetChildren()) do
                if tool:IsA("Tool") and tool.Name:find("Fruit") then
                    if tool:FindFirstChild("EatRemote") then
                        EquipTool(tool.Name)
                        task.wait(0.5)
                        tool.EatRemote:InvokeServer("Eat")
                    end
                end
            end
        end)
    end
end)

-- Auto Store Fruit
task.spawn(function()
    while task.wait(3) do
        if not getgenv().Configs.Fruit.AutoStoreFruit then continue end
        pcall(function()
            local function store(tool)
                local originalName = tool:GetAttribute("OriginalName")
                if originalName then
                    if not IsFruitBlacklisted(originalName) then
                        replicated.Remotes.CommF_:InvokeServer("StoreFruit", originalName, tool)
                    end
                end
            end
            for _, tool in ipairs(Player.Backpack:GetChildren()) do
                if tool:IsA("Tool") and string.find(tool.Name, "Fruit") then store(tool) end
            end
            for _, tool in ipairs(Player.Character:GetChildren()) do
                if tool:IsA("Tool") and string.find(tool.Name, "Fruit") then store(tool) end
            end
        end)
    end
end)

-- Auto Drop Fruit (Blacklisted)
task.spawn(function()
    while task.wait(3) do
        if not getgenv().Configs.Fruit.AutoDropFruit then continue end
        pcall(function()
            for _, tool in ipairs(Player.Backpack:GetChildren()) do
                if tool:IsA("Tool") and string.find(tool.Name, "Fruit") then
                    local originalName = tool:GetAttribute("OriginalName")
                    if originalName and IsFruitBlacklisted(originalName) then
                        EquipTool(tool.Name)
                        task.wait(0.3)
                        if tool:FindFirstChild("EatRemote") then
                            tool.EatRemote:InvokeServer("Drop")
                        end
                    end
                end
            end
        end)
    end
end)

-- Auto Teleport to Fruit (instant)
task.spawn(function()
    while task.wait(0.5) do
        if not getgenv().Configs.Fruit.AutoTeleportToFruit then continue end
        pcall(function()
            for _, obj in ipairs(Workspace:GetChildren()) do
                if obj:IsA("Tool") and obj.Name:find("Fruit") and obj:FindFirstChild("Handle") then
                    Player.Character.HumanoidRootPart.CFrame = obj.Handle.CFrame
                    task.wait(0.05)
                    obj.Handle.CFrame = Player.Character.HumanoidRootPart.CFrame
                end
            end
        end)
    end
end)

-- Auto Tween to Fruit
task.spawn(function()
    while task.wait(1) do
        if not getgenv().Configs.Fruit.AutoTweenToFruit then continue end
        pcall(function()
            local closest, minDist = nil, math.huge
            for _, obj in ipairs(Workspace:GetChildren()) do
                if obj:IsA("Tool") and obj.Name:find("Fruit") and obj:FindFirstChild("Handle") then
                    local d = (obj.Handle.Position - Player.Character.HumanoidRootPart.Position).Magnitude
                    if d < minDist then minDist = d; closest = obj end
                end
            end
            if closest and minDist < 500 then
                TweenTo(closest.Handle.CFrame)
                task.wait(1)
            end
        end)
    end
end)

-- Auto Collect Fruit (bring to player)
task.spawn(function()
    while task.wait(1) do
        if not getgenv().Configs.Fruit.AutoCollectFruit then continue end
        pcall(function()
            for _, obj in ipairs(Workspace:GetChildren()) do
                if obj:IsA("Tool") and obj.Name:find("Fruit") and obj:FindFirstChild("Handle") then
                    obj.Handle.CFrame = Player.Character.HumanoidRootPart.CFrame
                end
            end
        end)
    end
end)

-- Auto Random Fruit (Cousin)
task.spawn(function()
    while task.wait(10) do
        if not getgenv().Configs.Fruit.AutoRandomFruit then continue end
        pcall(function()
            replicated.Remotes.CommF_:InvokeServer("Cousin", "Buy")
        end)
    end
end)

-- Fruit Notification
task.spawn(function()
    while task.wait(2) do
        if not getgenv().Configs.Fruit.FruitNotification then continue end
        pcall(function()
            for _, obj in ipairs(Workspace:GetChildren()) do
                if obj:IsA("Tool") and obj.Name:find("Fruit") then
                    UpdateStatus("Fruit detected: " .. obj.Name)
                    break
                end
            end
        end)
    end
end)

--// ================== SERVER HOP / LOW PING ==================
task.spawn(function()
    while task.wait(60) do
        pcall(function()
            if #Players:GetPlayers() > 10 then
                HopLowServer(8)
            end
        end)
    end
end)

task.spawn(function()
    while task.wait(120) do
        pcall(function()
            local ping = Stats.Network.ServerStatsItem["Data Ping"]:GetValue()
            if tonumber(ping) > 300 then
                HopLowServer(6)
            end
        end)
    end
end)

--// ================== FINAL INITIALIZATION ==================
UpdateStatus("Part 7 – Prehistoric, V4 & Fruit Systems Active")
print("Astral Hub Ultimate – Part 7 (Prehistoric, V4 & Fruit) Loaded")
