--[[
   Astral Hub - Kaitun (Part 1)
   Base Systems: UI, Fast Attack, Movement, Quest Data, Auto Farm Leveling+
--]]

--// ================== CONFIGS (from KuKi Hub) ==================
getgenv().Configs = {
    ["Quest"] = {
        ["Evo Race V1"] = true,
        ["Evo Race V2"] = true,
        ["RGB Haki"] = true,
        ["Pull Lerver"] = true
    },
    ["Sword"] = {
        "Dual-Headed Blade",
        "Smoke Admiral",
        "Wardens Sword",
        "Cutlass",
        "Katana",
        "Dual Katana",
        "Triple Katana",
        "Iron Mace",
        "Saber",
        "Pole (1st Form)",
        "Gravity Blade",
        "Longsword",
        "Rengoku",
        "Midnight Blade",
        "Soul Cane",
        "Bisento",
        "Yama",
        "Tushita",
        "Cursed Dual Katana"
    },
    ["Gun"] = {
        "Soul Guitar",
        "Kabucha",
        "Venom Bow",
        "Musket",
        "Flintlock",
        "Refined Slingshot",
        "Magma Blaster",
        "Dual Flintlock",
        "Cannon",
        "Bizarre Revolver",
        "Bazooka"
    },
    ["FPS Booster"] = true
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

--// ================== UI SETUP (Astral Hub) ==================
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

local function TweenTo(targetCFrame)
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

            -- Travel to Sea 2
            if World1 and levelObj.Value >= 700 then
                LevelLabel.Text = "Level: " .. tostring(levelObj.Value)
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
                LevelLabel.Text = "Level: " .. tostring(levelObj.Value)
                TargetLabel.Text = "Target: Traveling to Sea 3"
                UpdateStatus("Traveling to Sea 3")
                replicated.Remotes.CommF_:InvokeServer("TravelZou")
                task.wait(1)
                return
            end

            local questData = GetQuestData()
            if not questData or not questData.PosM then
                LevelLabel.Text = "Level: Max/Unknown"
                TargetLabel.Text = "Target: None"
                UpdateStatus("Idle")
                return
            end

            LevelLabel.Text = "Level: " .. tostring(levelObj.Value)
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
                    local monPos = targetMon.HumanoidRootPart.Position
                    local farmPos = monPos + Vector3.new(0, 14, 0)
                    local targetCFrame = CFrame.new(farmPos, farmPos + targetMon.HumanoidRootPart.CFrame.LookVector)
                    TweenTo(targetCFrame)
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
   Astral Hub - Part 2
   Advanced Systems: Special Quests, Fighting Styles, Raids, Boss Farming, Mastery
--]]

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local VirtualInputManager = game:GetService("VirtualInputManager")
local TweenService = game:GetService("TweenService")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")

local Player = Players.LocalPlayer
local replicated = ReplicatedStorage

--// ================== HELPER FUNCTIONS (Extended) ==================
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

--// ================== QUEST STATE MACHINE ==================
local CurrentQuest = nil
local QuestState = {}

local function UpdateQuestStatus(text)
    -- This function can be hooked to UI if needed
    pcall(function()
        if _G.UpdateStatus then _G.UpdateStatus(text) end
    end)
end

--// ================== PRIORITY QUEST DETECTION ==================
local function DeterminePriorityQuest()
    local level = Player.Data.Level.Value
    local fragments = Player.Data.Fragments.Value
    local beli = Player.Data.Beli.Value

    -- Saber
    if not HasItem("Saber") and level >= 200 and CheckBoss("Saber Expert") then
        return "Saber"
    end
    -- Pole (1st Form)
    if not HasItem("Pole (1st Form)") and level >= 100 and CheckBoss("Thunder God") then
        return "Pole"
    end
    -- Rengoku
    if not HasItem("Rengoku") and level >= 800 and World2 and CheckBoss("Awakened Ice Admiral") then
        return "Rengoku"
    end
    -- Yama
    if not HasItem("Yama") and level >= 2000 and World3 then
        local progress = replicated.Remotes.CommF_:InvokeServer("EliteHunter", "Progress")
        if progress >= 30 then
            return "Yama"
        end
    end
    -- Tushita
    if not HasItem("Tushita") and World3 then
        local progress = replicated.Remotes.CommF_:InvokeServer("TushitaProgress")
        if progress.OpenedDoor then
            return "Tushita"
        end
    end
    -- Soul Guitar
    if not HasItem("Soul Guitar") and level >= 2000 and CheckItem("Dark Fragment") >= 1 then
        return "SoulGuitar"
    end
    -- Cursed Dual Katana
    if not HasItem("Cursed Dual Katana") and HasItem("Tushita") and HasItem("Yama") then
        return "CDK"
    end
    -- RGB Haki
    if getgenv().Configs.Quest["RGB Haki"] and level >= 2000 then
        if replicated.Remotes.CommF_:InvokeServer("HornedMan", "Bet") == nil then
            return "RGB"
        end
    end
    -- Evo Race V1
    if getgenv().Configs.Quest["Evo Race V1"] and World2 and level >= 850 then
        if not Player.Data.Race:FindFirstChild("Evolved") then
            if replicated.Remotes.CommF_:InvokeServer("Alchemist", "1") ~= -2 then
                return "EvoRaceV1"
            end
        end
    end
    -- Evo Race V2
    if getgenv().Configs.Quest["Evo Race V2"] and World2 and level >= 1400 then
        if replicated.Remotes.CommF_:InvokeServer("TalkTrevor", "1") == 0 then
            return "EvoRaceV2"
        end
    end
    -- Don Swan (prerequisite for V2)
    if World2 and level >= 900 and replicated.Remotes.CommF_:InvokeServer("TalkTrevor", "1") ~= 0 then
        return "DonSwan"
    end
    -- Bartilo Quest (prerequisite for V1)
    if World2 and level >= 850 then
        local progress = replicated.Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo")
        if progress ~= 3 then
            return "Bartilo"
        end
    end
    -- Pull Lever (V4)
    if getgenv().Configs.Quest["Pull Lerver"] and World3 and Workspace.Map:FindFirstChild("MysticIsland") then
        return "PullLever"
    end
    -- Elite Hunters (for Yama progress)
    if World3 and not HasItem("Yama") then
        local eliteQuest = replicated.Remotes.CommF_:InvokeServer("EliteHunter")
        if eliteQuest ~= "I don't have anything for you right now. Come back later." then
            return "EliteHunters"
        end
    end
    -- Cake Prince / Dough King (for materials)
    if World3 and level >= 2300 then
        local spawnStatus = tostring(replicated.Remotes.CommF_:InvokeServer("CakePrinceSpawner"))
        if spawnStatus == "nil" then
            return "CakePrince"
        end
        if CheckBoss("Dough King") then
            return "DoughKing"
        end
    end
    -- Darkbeard / Core (Second Sea)
    if World2 then
        if CheckBoss("Darkbeard") then return "Darkbeard" end
        if CheckBoss("Core") then return "Core" end
    end
    -- Godhuman materials
    if not HasItem("Godhuman") and level >= 1100 then
        if CheckItem("Fish Tail") < 20 or CheckItem("Magma Ore") < 20 or CheckItem("Mystic Droplet") < 10 or CheckItem("Dragon Scale") < 10 then
            return "GodhumanMats"
        end
    end
    -- Dragon Talon Fire Essence
    if not HasItem("Dragon Talon") and level >= 1100 then
        if CheckItem("Fire Essence") == 0 then
            return "FireEssence"
        end
    end

    return nil
end

--// ================== SPECIAL QUEST HANDLERS ==================
local function HandleSaberQuest()
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
        if mob then
            TweenTo(mob.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
        else
            TweenTo(CFrame.new(-2848, 7, 5342))
        end
    elseif not prog.UsedRelic then
        replicated.Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon")
        EquipTool("Relic")
        TweenTo(CFrame.new(-1406, 29, 4))
    else
        local boss = GetAliveBoss("Saber Expert")
        if boss then
            TweenTo(boss.HumanoidRootPart.CFrame * CFrame.new(0, 25, 0))
        else
            TweenTo(CFrame.new(-1458, 29, -50))
        end
    end
end

local function HandlePoleQuest()
    local boss = GetAliveBoss("Thunder God")
    if boss then
        TweenTo(boss.HumanoidRootPart.CFrame * CFrame.new(0, 40, 0))
    else
        TweenTo(CFrame.new(-7894, 5547, -380))
    end
end

local function HandleRengokuQuest()
    local boss = GetAliveBoss("Awakened Ice Admiral")
    if boss then
        TweenTo(boss.HumanoidRootPart.CFrame * CFrame.new(0, 40, 0))
    end
end

local function HandleYamaQuest()
    local sealed = Workspace.Map.Waterfall.SealedKatana.Hitbox
    if (sealed.Position - Player.Character.HumanoidRootPart.Position).Magnitude > 300 then
        TweenTo(sealed.CFrame)
    else
        local ghost = GetAliveBoss("Ghost")
        if ghost then
            TweenTo(ghost.HumanoidRootPart.CFrame * CFrame.new(0, 15, 0))
        else
            fireclickdetector(sealed.ClickDetector)
        end
    end
end

local function HandleTushitaQuest()
    local boss = GetAliveBoss("Longma")
    if boss then
        TweenTo(boss.HumanoidRootPart.CFrame * CFrame.new(0, 40, 0))
    else
        HopLowServer(5)
    end
end

local function HandleSoulGuitarQuest()
    if CheckItem("Bones") < 500 then
        local mob = GetAliveMonster("Living Zombie") or GetAliveMonster("Demonic Soul")
        if mob then
            TweenTo(mob.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
        else
            TweenTo(CFrame.new(-9505, 172, 6158))
        end
    elseif CheckItem("Ectoplasm") < 250 then
        local mob = GetAliveMonster("Ship Deckhand") or GetAliveMonster("Ship Engineer")
        if mob then
            TweenTo(mob.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
        else
            TweenTo(CFrame.new(921, 125, 32937))
        end
    else
        TweenTo(CFrame.new(-9680, 6, 6346))
        task.wait(2)
        replicated.Remotes.CommF_:InvokeServer("GuitarPuzzleProgress", "Gravestone")
    end
end

local function HandleCDKQuest()
    local progress = replicated.Remotes.CommF_:InvokeServer("CDKQuest", "Progress")
    if progress.Good == 0 or progress.Good == -3 then
        TweenTo(CFrame.new(-12379, 601, -6543))
        replicated.Remotes.CommF_:InvokeServer("CDKQuest", "StartTrial", "Good")
    elseif progress.Evil == 0 or progress.Evil == -3 then
        TweenTo(CFrame.new(-12392, 603, -6503))
        replicated.Remotes.CommF_:InvokeServer("CDKQuest", "StartTrial", "Evil")
    elseif progress.Good == 4 and progress.Evil == 4 then
        local boss = GetAliveBoss("Cursed Skeleton Boss")
        if boss then
            TweenTo(boss.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
        else
            TweenTo(CFrame.new(-12330, 603, -6549))
        end
    end
end

local function HandleRGBQuest()
    local bosses = {"Stone", "Hydra Leader", "Kilo Admiral", "Captain Elephant", "Beautiful Pirate"}
    for _, bossName in ipairs(bosses) do
        local boss = GetAliveBoss(bossName)
        if boss then
            TweenTo(boss.HumanoidRootPart.CFrame * CFrame.new(0, 40, 0))
            return
        end
    end
end

local function HandleEvoRaceV1Quest()
    if not HasItem("Flower 1") then
        TweenTo(Workspace.Flower1.CFrame)
    elseif not HasItem("Flower 2") then
        TweenTo(Workspace.Flower2.CFrame)
    elseif not HasItem("Flower 3") then
        TweenTo(CFrame.new(976, 111, 1229))
        local mob = GetAliveMonster("Swan Pirate")
        if mob then
            TweenTo(mob.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
        end
    else
        replicated.Remotes.CommF_:InvokeServer("Alchemist", "3")
    end
end

local function HandleEvoRaceV2Quest()
    if not QuestState.KilledDonSwan then
        local boss = GetAliveBoss("Don Swan")
        if boss then
            TweenTo(boss.HumanoidRootPart.CFrame * CFrame.new(0, 40, 0))
        else
            QuestState.KilledDonSwan = true
        end
    else
        replicated.Remotes.CommF_:InvokeServer("Wenlocktoad", "3")
    end
end

local function HandleDonSwanQuest()
    local boss = GetAliveBoss("Don Swan")
    if boss then
        TweenTo(boss.HumanoidRootPart.CFrame * CFrame.new(0, 40, 0))
    else
        HopLowServer(5)
    end
end

local function HandleBartiloQuest()
    local progress = replicated.Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo")
    if progress == 0 then
        TweenTo(CFrame.new(-1836, 11, 1714))
        if (Player.Character.HumanoidRootPart.Position - Vector3.new(-1836, 11, 1714)).Magnitude < 10 then
            replicated.Remotes.CommF_:InvokeServer("StartQuest", "BartiloQuest", 1)
        end
    elseif progress == 1 then
        local mob = GetAliveMonster("Swan Pirate")
        if mob then
            TweenTo(mob.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
        else
            TweenTo(CFrame.new(976, 111, 1229))
        end
    elseif progress == 2 then
        local boss = GetAliveBoss("Jeremy")
        if boss then
            TweenTo(boss.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
        end
    end
end

local function HandlePullLeverQuest()
    local v4Progress = replicated.Remotes.CommF_:InvokeServer("RaceV4Progress", "Check")
    if v4Progress == 1 then
        replicated.Remotes.CommF_:InvokeServer("RaceV4Progress", "Begin")
    elseif v4Progress == 2 then
        replicated.Remotes.CommF_:InvokeServer("RaceV4Progress", "Teleport")
        TweenTo(CFrame.new(28286, 14896, 102))
    elseif v4Progress == 3 then
        replicated.Remotes.CommF_:InvokeServer("RaceV4Progress", "Continue")
    elseif v4Progress == 4 then
        local mysticIsland = Workspace.Map.MysticIsland
        local lever = mysticIsland:FindFirstChild("Lever")
        if lever then
            TweenTo(lever.CFrame)
            fireproximityprompt(lever.ProximityPrompt)
        end
    end
end

local function HandleEliteHuntersQuest()
    replicated.Remotes.CommF_:InvokeServer("EliteHunter")
    local bosses = {"Diablo", "Deandre", "Urban"}
    for _, bossName in ipairs(bosses) do
        local boss = GetAliveBoss(bossName)
        if boss then
            TweenTo(boss.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
            return
        end
    end
end

local function HandleCakePrinceQuest()
    local prince = GetAliveBoss("Cake Prince")
    if prince then
        TweenTo(prince.HumanoidRootPart.CFrame * CFrame.new(0, 42, 10))
    else
        replicated.Remotes.CommF_:InvokeServer("CakePrinceSpawner", true)
    end
end

local function HandleDoughKingQuest()
    local king = GetAliveBoss("Dough King")
    if king then
        TweenTo(king.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
    end
end

local function HandleDarkbeardQuest()
    local boss = GetAliveBoss("Darkbeard")
    if boss then
        TweenTo(boss.HumanoidRootPart.CFrame * CFrame.new(0, -30, 0))
    end
end

local function HandleCoreQuest()
    local boss = GetAliveBoss("Core")
    if boss then
        TweenTo(boss.HumanoidRootPart.CFrame * CFrame.new(0, 40, 0))
    end
end

local function HandleGodhumanMatsQuest()
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
end

local function HandleFireEssenceQuest()
    if CheckItem("Bones") < 500 then
        local mob = GetAliveMonster("Living Zombie") or GetAliveMonster("Demonic Soul")
        if mob then TweenTo(mob.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)) else TweenTo(CFrame.new(-9505, 172, 6158)) end
    else
        if replicated.Remotes.CommF_:InvokeServer("Bones", "Check") > 0 then
            replicated.Remotes.CommF_:InvokeServer("Bones", "Buy", 1, 1)
        end
    end
end

--// ================== QUEST EXECUTION LOOP ==================
task.spawn(function()
    while task.wait() do
        if not AutoFarm then continue end
        pcall(function()
            CurrentQuest = DeterminePriorityQuest()
            if CurrentQuest then
                UpdateQuestStatus(CurrentQuest)
                if CurrentQuest == "Saber" then HandleSaberQuest()
                elseif CurrentQuest == "Pole" then HandlePoleQuest()
                elseif CurrentQuest == "Rengoku" then HandleRengokuQuest()
                elseif CurrentQuest == "Yama" then HandleYamaQuest()
                elseif CurrentQuest == "Tushita" then HandleTushitaQuest()
                elseif CurrentQuest == "SoulGuitar" then HandleSoulGuitarQuest()
                elseif CurrentQuest == "CDK" then HandleCDKQuest()
                elseif CurrentQuest == "RGB" then HandleRGBQuest()
                elseif CurrentQuest == "EvoRaceV1" then HandleEvoRaceV1Quest()
                elseif CurrentQuest == "EvoRaceV2" then HandleEvoRaceV2Quest()
                elseif CurrentQuest == "DonSwan" then HandleDonSwanQuest()
                elseif CurrentQuest == "Bartilo" then HandleBartiloQuest()
                elseif CurrentQuest == "PullLever" then HandlePullLeverQuest()
                elseif CurrentQuest == "EliteHunters" then HandleEliteHuntersQuest()
                elseif CurrentQuest == "CakePrince" then HandleCakePrinceQuest()
                elseif CurrentQuest == "DoughKing" then HandleDoughKingQuest()
                elseif CurrentQuest == "Darkbeard" then HandleDarkbeardQuest()
                elseif CurrentQuest == "Core" then HandleCoreQuest()
                elseif CurrentQuest == "GodhumanMats" then HandleGodhumanMatsQuest()
                elseif CurrentQuest == "FireEssence" then HandleFireEssenceQuest()
                end
            end
        end)
    end
end)

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
    Godhuman = {bought = false, mastery = false}
}

local function GetFightingStyleMastery(styleName)
    local tool = Player.Character and Player.Character:FindFirstChild(styleName) or Player.Backpack:FindFirstChild(styleName)
    if tool and tool:FindFirstChild("Level") then
        return tool.Level.Value
    end
    return 0
end

task.spawn(function()
    while task.wait(0.5) do
        pcall(function()
            local level = Player.Data.Level.Value
            local beli = Player.Data.Beli.Value
            local fragments = Player.Data.Fragments.Value
            
            -- Black Leg
            if not FightingStyles.BlackLeg.bought and level >= 100 and beli >= 150000 then
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
            if FightingStyles.FishmanKarate.bought and not FightingStyles.DragonClaw.bought and level >= 1100 then
                if fragments >= 1500 then
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
            if FightingStyles.Superhuman.bought and not FightingStyles.DeathStep.bought and level >= 1100 then
                if GetFightingStyleMastery("Black Leg") >= 400 and fragments >= 5000 and beli >= 2500000 then
                    replicated.Remotes.CommF_:InvokeServer("BuyDeathStep")
                    if HasItem("Death Step") then FightingStyles.DeathStep.bought = true; EquipTool("Death Step") end
                end
            end
            -- Sharkman Karate
            if FightingStyles.DeathStep.bought and not FightingStyles.SharkmanKarate.bought and level >= 1100 then
                if fragments >= 5000 and beli >= 2550000 then
                    replicated.Remotes.CommF_:InvokeServer("BuySharkmanKarate")
                    if HasItem("Sharkman Karate") then FightingStyles.SharkmanKarate.bought = true; EquipTool("Sharkman Karate") end
                end
            end
            -- Electric Claw
            if FightingStyles.SharkmanKarate.bought and not FightingStyles.ElectricClaw.bought and level >= 1100 then
                if fragments >= 5000 and beli >= 3000000 then
                    replicated.Remotes.CommF_:InvokeServer("BuyElectricClaw")
                    if HasItem("Electric Claw") then FightingStyles.ElectricClaw.bought = true; EquipTool("Electric Claw") end
                end
            end
            -- Dragon Talon
            if FightingStyles.ElectricClaw.bought and not FightingStyles.DragonTalon.bought and level >= 1100 then
                if fragments >= 5000 and beli >= 3000000 then
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
            if FightingStyles.DragonTalon.bought and not FightingStyles.Godhuman.bought and level >= 1100 then
                if fragments >= 5000 and beli >= 5000000 then
                    if CheckItem("Fish Tail") >= 20 and CheckItem("Magma Ore") >= 20 and CheckItem("Mystic Droplet") >= 10 and CheckItem("Dragon Scale") >= 10 then
                        replicated.Remotes.CommF_:InvokeServer("BuyGodhuman", true)
                        if HasItem("Godhuman") then FightingStyles.Godhuman.bought = true; EquipTool("Godhuman") end
                    end
                end
            end
        end)
    end
end)

--// ================== AUTO MASTERY FARM ==================
task.spawn(function()
    while task.wait(0.3) do
        if CurrentQuest then continue end
        pcall(function()
            local tool = Player.Character and Player.Character:FindFirstChildOfClass("Tool")
            if tool then
                local enemies = Workspace.Enemies:GetChildren()
                if #enemies > 0 then
                    for _, enemy in ipairs(enemies) do
                        if enemy:FindFirstChild("Humanoid") and enemy.Humanoid.Health > 0 then
                            local hrp = enemy:FindFirstChild("HumanoidRootPart")
                            if hrp and (hrp.Position - Player.Character.HumanoidRootPart.Position).Magnitude < 60 then
                                VirtualInputManager:SendKeyEvent(true, "Z", false, game)
                                task.wait(0.1)
                                VirtualInputManager:SendKeyEvent(false, "Z", false, game)
                                VirtualInputManager:SendKeyEvent(true, "X", false, game)
                                task.wait(0.1)
                                VirtualInputManager:SendKeyEvent(false, "X", false, game)
                                VirtualInputManager:SendKeyEvent(true, "C", false, game)
                                task.wait(0.1)
                                VirtualInputManager:SendKeyEvent(false, "C", false, game)
                                break
                            end
                        end
                    end
                end
            end
        end)
    end
end)

--// ================== RAID FARMING ==================
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
                local swords = {"Bisento", "Cutlass", "Katana", "Dual Katana", "Soul Cane", "Triple Katana", "Iron Mace"}
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

--// ================== KILL AURA (AUTO CLICK) ==================
task.spawn(function()
    while task.wait(0.05) do
        if AutoFarm and not CurrentQuest then
            pcall(function()
                for _, enemy in ipairs(Workspace.Enemies:GetChildren()) do
                    if enemy:FindFirstChild("Humanoid") and enemy.Humanoid.Health > 0 then
                        local hrp = enemy:FindFirstChild("HumanoidRootPart")
                        if hrp and (hrp.Position - Player.Character.HumanoidRootPart.Position).Magnitude < 100 then
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

--[[
   Astral Hub - Part 3
   Endgame Systems: Tushita, Yama, CDK, Soul Guitar, Race V4, Godhuman, Boss Farming
--]]

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local VirtualInputManager = game:GetService("VirtualInputManager")
local TweenService = game:GetService("TweenService")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
local CoreGui = game:GetService("CoreGui")

local Player = Players.LocalPlayer
local replicated = ReplicatedStorage

--// ================== HELPER FUNCTIONS (Extended) ==================
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
        if (item.Type == "Sword" or item.Type == "Gun" or item.Type == "Material") and item.Name == itemName then
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

local function TweenTo(targetCFrame)
    -- Placeholder - should be defined in Part 1
    if _G.TweenTo then
        _G.TweenTo(targetCFrame)
    else
        local tween = TweenService:Create(Player.Character.HumanoidRootPart, TweenInfo.new(1), {CFrame = targetCFrame})
        tween:Play()
    end
end

--// ================== ADVANCED QUEST STATE ==================
local CurrentAdvancedQuest = nil
local AdvancedQuestState = {}

--// ================== TUSHITA QUEST (FULL) ==================
-- Step 1: Get God's Chalice from Elite Hunters / Dough King
-- Step 2: Unlock door with Holy Torch (from rip_indra True Form)
-- Step 3: Kill Longma for Tushita

local function HandleTushitaFullQuest()
    local progress = replicated.Remotes.CommF_:InvokeServer("TushitaProgress")
    
    if not progress.OpenedDoor then
        -- Need Holy Torch
        if HasItem("Holy Torch") then
            EquipTool("Holy Torch")
            for i = 1, 5 do
                replicated.Remotes.CommF_:InvokeServer("TushitaProgress", "Torch", i)
                task.wait(0.2)
            end
        else
            -- Farm Holy Torch from rip_indra True Form
            local indra = GetAliveBoss("rip_indra True Form")
            if indra then
                TweenTo(CFrame.new(5714, 19, 254))
                task.wait(1)
                -- Jump to get torch
                VirtualInputManager:SendKeyEvent(true, "Space", false, game)
                task.wait(0.3)
                VirtualInputManager:SendKeyEvent(false, "Space", false, game)
            else
                -- Spawn Indra if possible
                if HasItem("God's Chalice") then
                    EquipTool("God's Chalice")
                    TweenTo(CFrame.new(-5561, 314, -2663))
                    task.wait(2)
                    -- Use chalice
                    fireproximityprompt(Workspace.Map["Boat Castle"].Summoner.Circle.ProximityPrompt)
                else
                    -- Need God's Chalice: farm Elite Hunters or Dough King
                    CurrentAdvancedQuest = "GodsChalice"
                end
            end
        end
    else
        -- Door opened, kill Longma
        local longma = GetAliveBoss("Longma")
        if longma then
            TweenTo(longma.HumanoidRootPart.CFrame * CFrame.new(0, 40, 0))
        else
            HopLowServer(5)
        end
    end
end

--// ================== GOD'S CHALICE FARMING ==================
local function HandleGodsChaliceQuest()
    -- Check Elite Hunters first
    local eliteQuest = replicated.Remotes.CommF_:InvokeServer("EliteHunter")
    if eliteQuest ~= "I don't have anything for you right now. Come back later." then
        replicated.Remotes.CommF_:InvokeServer("EliteHunter")
        local bosses = {"Diablo", "Deandre", "Urban"}
        for _, bossName in ipairs(bosses) do
            local boss = GetAliveBoss(bossName)
            if boss then
                TweenTo(boss.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                return
            end
        end
    end
    
    -- Check Dough King
    local king = GetAliveBoss("Dough King")
    if king then
        TweenTo(king.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
    else
        -- Spawn Dough King
        if CheckItem("Conjured Cocoa") >= 10 and HasItem("Sweet Chalice") then
            EquipTool("Sweet Chalice")
            TweenTo(CFrame.new(-2286, 146, -12226))
            task.wait(2)
            replicated.Remotes.CommF_:InvokeServer("SweetChaliceNpc")
        else
            -- Farm materials
            if CheckItem("Conjured Cocoa") < 10 then
                local mob = GetAliveMonster("Cocoa Warrior") or GetAliveMonster("Chocolate Bar Battler")
                if mob then TweenTo(mob.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                else TweenTo(CFrame.new(658, 24, -12541)) end
            end
        end
    end
end

--// ================== YAMA QUEST (FULL) ==================
local function HandleYamaFullQuest()
    local sealed = Workspace.Map.Waterfall.SealedKatana.Hitbox
    if (sealed.Position - Player.Character.HumanoidRootPart.Position).Magnitude > 300 then
        TweenTo(sealed.CFrame)
    else
        local ghost = GetAliveBoss("Ghost")
        if ghost then
            TweenTo(ghost.HumanoidRootPart.CFrame * CFrame.new(0, 15, 0))
            -- Use skills to kill
            VirtualInputManager:SendKeyEvent(true, "Z", false, game)
            task.wait(0.1)
            VirtualInputManager:SendKeyEvent(false, "Z", false, game)
        else
            fireclickdetector(sealed.ClickDetector)
        end
    end
end

--// ================== CURSED DUAL KATANA (CDK) FULL QUEST ==================
local CDKState = {
    GoodTrialStarted = false,
    EvilTrialStarted = false,
    BoatQuest1 = false,
    BoatQuest2 = false,
    BoatQuest3 = false,
    KilledCakeQueen = false,
    HeavenDimensionDone = false,
    HellDimensionDone = false
}

local function HandleCDKFullQuest()
    local progress = replicated.Remotes.CommF_:InvokeServer("CDKQuest", "Progress")
    
    -- Open door if not opened
    if replicated.Remotes.CommF_:InvokeServer("CDKQuest", "OpenDoor") ~= "opened" then
        replicated.Remotes.CommF_:InvokeServer("CDKQuest", "OpenDoor", true)
        return
    end
    
    -- Good Trial
    if progress.Good == 0 or progress.Good == -3 then
        if progress.Good == 0 then
            TweenTo(CFrame.new(-12379, 601, -6543))
            task.wait(1)
            replicated.Remotes.CommF_:InvokeServer("CDKQuest", "StartTrial", "Good")
        elseif progress.Good == -3 then
            -- Boat Quest for Good
            if not CDKState.BoatQuest1 then
                TweenTo(CFrame.new(-4600, 15, -2881))
                if (Player.Character.HumanoidRootPart.Position - Vector3.new(-4600, 15, -2881)).Magnitude < 5 then
                    replicated.Remotes.CommF_:InvokeServer("CDKQuest", "BoatQuest", Workspace.NPCs:FindFirstChild("Luxury Boat Dealer"), "Check")
                    replicated.Remotes.CommF_:InvokeServer("CDKQuest", "BoatQuest", Workspace.NPCs:FindFirstChild("Luxury Boat Dealer"))
                    CDKState.BoatQuest1 = true
                end
            elseif not CDKState.BoatQuest2 then
                TweenTo(CFrame.new(-2068, 3, -9887))
                if (Player.Character.HumanoidRootPart.Position - Vector3.new(-2068, 3, -9887)).Magnitude < 5 then
                    replicated.Remotes.CommF_:InvokeServer("CDKQuest", "BoatQuest", Workspace.NPCs:FindFirstChild("Luxury Boat Dealer"), "Check")
                    replicated.Remotes.CommF_:InvokeServer("CDKQuest", "BoatQuest", Workspace.NPCs:FindFirstChild("Luxury Boat Dealer"))
                    CDKState.BoatQuest2 = true
                end
            elseif not CDKState.BoatQuest3 then
                TweenTo(CFrame.new(-9531, 5, -8377))
                if (Player.Character.HumanoidRootPart.Position - Vector3.new(-9531, 5, -8377)).Magnitude < 5 then
                    replicated.Remotes.CommF_:InvokeServer("CDKQuest", "BoatQuest", Workspace.NPCs:FindFirstChild("Luxury Boat Dealer"), "Check")
                    replicated.Remotes.CommF_:InvokeServer("CDKQuest", "BoatQuest", Workspace.NPCs:FindFirstChild("Luxury Boat Dealer"))
                    CDKState.BoatQuest3 = true
                end
            end
        end
    elseif progress.Good == 1 or progress.Good == -4 then
        if progress.Good == 1 then
            TweenTo(CFrame.new(-12379, 601, -6543))
            task.wait(1)
            replicated.Remotes.CommF_:InvokeServer("CDKQuest", "StartTrial", "Good")
        elseif progress.Good == -4 then
            -- Kill mobs with HazeESP
            for _, mob in ipairs(Workspace.Enemies:GetChildren()) do
                if mob:FindFirstChild("HazeESP") and mob:FindFirstChild("Humanoid") and mob.Humanoid.Health > 0 then
                    TweenTo(mob.HumanoidRootPart.CFrame * CFrame.new(0, 25, 0))
                    return
                end
            end
            TweenTo(CFrame.new(-13347, 332, -7652))
        end
    elseif progress.Good == 2 or progress.Good == -5 then
        if progress.Good == 2 then
            TweenTo(CFrame.new(-12379, 601, -6543))
            task.wait(1)
            replicated.Remotes.CommF_:InvokeServer("CDKQuest", "StartTrial", "Good")
        elseif progress.Good == -5 then
            if not CDKState.KilledCakeQueen then
                local queen = GetAliveBoss("Cake Queen")
                if queen then
                    TweenTo(queen.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                else
                    TweenTo(CFrame.new(-714, 381, -11021))
                end
            else
                if not CDKState.HeavenDimensionDone then
                    local heaven = Workspace.Map:FindFirstChild("HeavenlyDimension")
                    if heaven then
                        TweenTo(heaven.WorldPivot)
                        if (heaven.WorldPivot.Position - Player.Character.HumanoidRootPart.Position).Magnitude < 10 then
                            -- Kill mobs in Heaven
                            local mob = GetAliveMonster("Angel") or GetAliveMonster("God's Guard")
                            if mob then TweenTo(mob.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                            else
                                -- Light torches
                                for i = 1, 3 do
                                    local torch = heaven:FindFirstChild("Torch"..i)
                                    if torch and torch.ProximityPrompt then
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
        end
    elseif progress.Evil == 0 or progress.Evil == -3 then
        if progress.Evil == 0 then
            TweenTo(CFrame.new(-12392, 603, -6503))
            task.wait(1)
            replicated.Remotes.CommF_:InvokeServer("CDKQuest", "StartTrial", "Evil")
        elseif progress.Evil == -3 then
            -- Kill mobs for Evil
            for _, mob in ipairs(Workspace.Enemies:GetChildren()) do
                if mob:FindFirstChild("HazeESP") and mob:FindFirstChild("Humanoid") and mob.Humanoid.Health > 0 then
                    TweenTo(mob.HumanoidRootPart.CFrame * CFrame.new(0, 25, 0))
                    return
                end
            end
            TweenTo(CFrame.new(-13347, 332, -7652))
        end
    elseif progress.Evil == 1 or progress.Evil == -4 then
        if progress.Evil == 1 then
            TweenTo(CFrame.new(-12392, 603, -6503))
            task.wait(1)
            replicated.Remotes.CommF_:InvokeServer("CDKQuest", "StartTrial", "Evil")
        elseif progress.Evil == -4 then
            -- Haze quest kills
            for _, mob in ipairs(Workspace.Enemies:GetChildren()) do
                if mob:FindFirstChild("HazeESP") and mob:FindFirstChild("Humanoid") and mob.Humanoid.Health > 0 then
                    TweenTo(mob.HumanoidRootPart.CFrame * CFrame.new(0, 25, 0))
                    return
                end
            end
        end
    elseif progress.Evil == 2 or progress.Evil == -5 then
        if progress.Evil == 2 then
            TweenTo(CFrame.new(-12392, 603, -6503))
            task.wait(1)
            replicated.Remotes.CommF_:InvokeServer("CDKQuest", "StartTrial", "Evil")
        elseif progress.Evil == -5 then
            if not CDKState.HellDimensionDone then
                local hell = Workspace.Map:FindFirstChild("HellDimension")
                if hell then
                    TweenTo(hell.WorldPivot)
                    if (hell.WorldPivot.Position - Player.Character.HumanoidRootPart.Position).Magnitude < 10 then
                        local mob = GetAliveMonster("Demon") or GetAliveMonster("Soul Reaper")
                        if mob then TweenTo(mob.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                        else
                            for i = 1, 3 do
                                local torch = hell:FindFirstChild("Torch"..i)
                                if torch and torch.ProximityPrompt then
                                    TweenTo(torch.CFrame)
                                    fireproximityprompt(torch.ProximityPrompt)
                                    task.wait(1)
                                end
                            end
                            CDKState.HellDimensionDone = true
                        end
                    end
                else
                    -- Kill Soul Reaper to get to Hell
                    local reaper = GetAliveBoss("Soul Reaper")
                    if reaper then
                        TweenTo(reaper.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                    end
                end
            end
        end
    elseif progress.Good == 4 and progress.Evil == 4 then
        local boss = GetAliveBoss("Cursed Skeleton Boss")
        if boss then
            TweenTo(boss.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
        else
            TweenTo(CFrame.new(-12330, 603, -6549))
            task.wait(2)
            replicated.Remotes.CommF_:InvokeServer("CDKQuest", "Progress")
        end
    end
end

--// ================== SOUL GUITAR PUZZLE & FARM ==================
local SoulGuitarState = {
    PuzzleStarted = false,
    SwampDone = false,
    PuzzlesDone = {}
}

local function HandleSoulGuitarFullQuest()
    if CheckItem("Bones") < 500 then
        local mob = GetAliveMonster("Living Zombie") or GetAliveMonster("Demonic Soul") or GetAliveMonster("Reborn Skeleton") or GetAliveMonster("Posessed Mummy")
        if mob then
            TweenTo(mob.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
        else
            TweenTo(CFrame.new(-9505, 172, 6158))
        end
    elseif CheckItem("Ectoplasm") < 250 then
        local mob = GetAliveMonster("Ship Deckhand") or GetAliveMonster("Ship Engineer") or GetAliveMonster("Ship Steward") or GetAliveMonster("Ship Officer")
        if mob then
            TweenTo(mob.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
        else
            TweenTo(CFrame.new(921, 125, 32937))
        end
    else
        if not World3 then
            replicated.Remotes.CommF_:InvokeServer("TravelZou")
            task.wait(30)
            return
        end
        
        -- Check swamp color
        local swamp = Workspace.Map["Haunted Castle"].SwampWater
        if swamp and tostring(swamp.BrickColor) == "Maroon" then
            -- Need to do puzzle
            if not SoulGuitarState.SwampDone then
                TweenTo(CFrame.new(-10147, 138, 5939))
                if (Player.Character.HumanoidRootPart.Position - Vector3.new(-10147, 138, 5939)).Magnitude < 10 then
                    -- Count living zombies nearby
                    local count = 0
                    for _, mob in ipairs(Workspace.Enemies:GetChildren()) do
                        if mob.Name == "Living Zombie" and mob:FindFirstChild("Humanoid") and mob.Humanoid.Health > 0 and (mob.HumanoidRootPart.Position - Player.Character.HumanoidRootPart.Position).Magnitude < 500 then
                            count = count + 1
                        end
                    end
                    if count >= 6 then
                        SoulGuitarState.SwampDone = true
                    end
                end
            end
        else
            -- Do grave puzzles
            local puzzleProgress = replicated.Remotes.CommF_:InvokeServer("GuitarPuzzleProgress", "Check")
            if puzzleProgress then
                TweenTo(CFrame.new(-9680, 6, 6346))
                if (Player.Character.HumanoidRootPart.Position - Vector3.new(-9680, 6, 6346)).Magnitude < 5 then
                    for i, v in pairs(puzzleProgress) do
                        if v == false then
                            replicated.Remotes.CommF_:InvokeServer("GuitarPuzzleProgress", i)
                        end
                    end
                end
            else
                -- Trigger gravestone event
                replicated.Remotes.CommF_:InvokeServer("gravestoneEvent", 2, true)
                TweenTo(CFrame.new(-8652, 141, 6168))
            end
        end
    end
end

--// ================== RACE V4 (PULL LEVER) ==================
local V4State = {
    Started = false,
    TrialStarted = false
}

local function HandleRaceV4Quest()
    local progress = replicated.Remotes.CommF_:InvokeServer("RaceV4Progress", "Check")
    
    if progress == 1 then
        replicated.Remotes.CommF_:InvokeServer("RaceV4Progress", "Begin")
    elseif progress == 2 then
        replicated.Remotes.CommF_:InvokeServer("RaceV4Progress", "Teleport")
        TweenTo(CFrame.new(28286, 14896, 102))
    elseif progress == 3 then
        replicated.Remotes.CommF_:InvokeServer("RaceV4Progress", "Continue")
    elseif progress == 4 then
        local mysticIsland = Workspace.Map:FindFirstChild("MysticIsland")
        if mysticIsland then
            -- Find and pull lever
            for _, obj in ipairs(mysticIsland:GetDescendants()) do
                if obj:IsA("ProximityPrompt") and obj.Parent.Name == "Lever" then
                    TweenTo(obj.Parent.CFrame)
                    fireproximityprompt(obj)
                    break
                end
            end
        end
    end
end

--// ================== GODHUMAN MATERIAL FARMING (DETAILED) ==================
local GodhumanMatsState = {
    FishTailDone = false,
    MagmaOreDone = false,
    MysticDropletDone = false,
    DragonScaleDone = false
}

local function HandleGodhumanDetailedQuest()
    if CheckItem("Fish Tail") < 20 then
        if not World1 then
            replicated.Remotes.CommF_:InvokeServer("TravelMain")
            task.wait(30)
            return
        end
        local mob = GetAliveMonster("Fishman Warrior") or GetAliveMonster("Fishman Commando")
        if mob then
            TweenTo(mob.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
        else
            TweenTo(CFrame.new(60946, 65, 1525))
        end
    elseif CheckItem("Magma Ore") < 20 then
        if not World2 then
            replicated.Remotes.CommF_:InvokeServer("TravelDressrosa")
            task.wait(30)
            return
        end
        local mob = GetAliveMonster("Magma Ninja") or GetAliveMonster("Lava Pirate")
        if mob then
            TweenTo(mob.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
        else
            TweenTo(CFrame.new(-5466, 77, -5837))
        end
    elseif CheckItem("Mystic Droplet") < 10 then
        if not World2 then
            replicated.Remotes.CommF_:InvokeServer("TravelDressrosa")
            task.wait(30)
            return
        end
        local mob = GetAliveMonster("Sea Soldier") or GetAliveMonster("Water Fighter")
        if mob then
            TweenTo(mob.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
        else
            TweenTo(CFrame.new(-3115, 63, -9808))
        end
    elseif CheckItem("Dragon Scale") < 10 then
        if not World3 then
            replicated.Remotes.CommF_:InvokeServer("TravelZou")
            task.wait(30)
            return
        end
        local mob = GetAliveMonster("Dragon Crew Warrior") or GetAliveMonster("Dragon Crew Archer")
        if mob then
            TweenTo(mob.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
        else
            TweenTo(CFrame.new(6241, 51, -1243))
        end
    else
        -- All materials collected, buy Godhuman
        if Player.Data.Beli.Value >= 5000000 and Player.Data.Fragments.Value >= 5000 then
            replicated.Remotes.CommF_:InvokeServer("BuyGodhuman", true)
            if HasItem("Godhuman") then
                CurrentAdvancedQuest = nil
            end
        end
    end
end

--// ================== DRAGON TALON FIRE ESSENCE FARM ==================
local function HandleFireEssenceDetailedQuest()
    if CheckItem("Bones") < 500 then
        local mob = GetAliveMonster("Living Zombie") or GetAliveMonster("Demonic Soul") or GetAliveMonster("Reborn Skeleton") or GetAliveMonster("Posessed Mummy")
        if mob then
            TweenTo(mob.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
        else
            TweenTo(CFrame.new(-9505, 172, 6158))
        end
    else
        -- Exchange bones for Fire Essence
        if replicated.Remotes.CommF_:InvokeServer("Bones", "Check") > 0 then
            replicated.Remotes.CommF_:InvokeServer("Bones", "Buy", 1, 1)
        end
        if HasItem("Fire Essence") then
            EquipTool("Fire Essence")
            task.wait(0.5)
            replicated.Remotes.CommF_:InvokeServer("BuyDragonTalon", true)
            replicated.Remotes.CommF_:InvokeServer("BuyDragonTalon")
        end
    end
end

--// ================== CAKE PRINCE & DOUGH KING FARM ==================
local function HandleCakePrinceDoughKingQuest()
    -- Check Dough King first (higher priority)
    local king = GetAliveBoss("Dough King")
    if king then
        TweenTo(king.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
        return
    end
    
    local prince = GetAliveBoss("Cake Prince")
    if prince then
        TweenTo(prince.HumanoidRootPart.CFrame * CFrame.new(0, 42, 10))
        return
    end
    
    -- Spawn Cake Prince
    local spawnStatus = tostring(replicated.Remotes.CommF_:InvokeServer("CakePrinceSpawner"))
    if spawnStatus == "nil" then
        replicated.Remotes.CommF_:InvokeServer("CakePrinceSpawner", true)
    end
    
    -- Farm mobs to spawn Dough King
    if CheckItem("Conjured Cocoa") < 10 then
        local mob = GetAliveMonster("Cocoa Warrior") or GetAliveMonster("Chocolate Bar Battler")
        if mob then
            TweenTo(mob.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
        else
            TweenTo(CFrame.new(658, 24, -12541))
        end
    else
        if not HasItem("Sweet Chalice") then
            -- Farm Sweet Chalice from Cake Prince
            if prince then
                TweenTo(prince.HumanoidRootPart.CFrame * CFrame.new(0, 42, 10))
            end
        else
            -- Use Sweet Chalice to spawn Dough King
            EquipTool("Sweet Chalice")
            TweenTo(CFrame.new(-2286, 146, -12226))
            task.wait(2)
            replicated.Remotes.CommF_:InvokeServer("SweetChaliceNpc")
        end
    end
end

--// ================== ELITE HUNTERS DETAILED ==================
local function HandleEliteHuntersDetailedQuest()
    replicated.Remotes.CommF_:InvokeServer("EliteHunter")
    local bosses = {"Diablo", "Deandre", "Urban"}
    for _, bossName in ipairs(bosses) do
        local boss = GetAliveBoss(bossName)
        if boss then
            TweenTo(boss.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
            return
        end
    end
    -- If no bosses, wait
end

--// ================== DARKBEARD & CORE (SECOND SEA) ==================
local function HandleDarkbeardCoreQuest()
    local darkbeard = GetAliveBoss("Darkbeard")
    if darkbeard then
        TweenTo(darkbeard.HumanoidRootPart.CFrame * CFrame.new(0, -30, 0))
        return
    end
    local core = GetAliveBoss("Core")
    if core then
        TweenTo(core.HumanoidRootPart.CFrame * CFrame.new(0, 40, 0))
        return
    end
end

--// ================== MAIN ADVANCED QUEST LOOP ==================
task.spawn(function()
    while task.wait() do
        if not AutoFarm then continue end
        pcall(function()
            -- Determine which advanced quest to run (priority order)
            local level = Player.Data.Level.Value
            
            -- CDK (highest priority if materials ready)
            if HasItem("Tushita") and HasItem("Yama") and not HasItem("Cursed Dual Katana") then
                CurrentAdvancedQuest = "CDK"
                HandleCDKFullQuest()
            -- Soul Guitar
            elseif not HasItem("Soul Guitar") and level >= 2000 and CheckItem("Dark Fragment") >= 1 then
                CurrentAdvancedQuest = "SoulGuitar"
                HandleSoulGuitarFullQuest()
            -- Tushita
            elseif not HasItem("Tushita") and World3 then
                CurrentAdvancedQuest = "Tushita"
                HandleTushitaFullQuest()
            -- Yama
            elseif not HasItem("Yama") and World3 and replicated.Remotes.CommF_:InvokeServer("EliteHunter", "Progress") >= 30 then
                CurrentAdvancedQuest = "Yama"
                HandleYamaFullQuest()
            -- Race V4
            elseif getgenv().Configs.Quest["Pull Lerver"] and World3 and Workspace.Map:FindFirstChild("MysticIsland") then
                CurrentAdvancedQuest = "RaceV4"
                HandleRaceV4Quest()
            -- Godhuman materials
            elseif not HasItem("Godhuman") and level >= 1100 then
                if CheckItem("Fish Tail") < 20 or CheckItem("Magma Ore") < 20 or CheckItem("Mystic Droplet") < 10 or CheckItem("Dragon Scale") < 10 then
                    CurrentAdvancedQuest = "GodhumanMats"
                    HandleGodhumanDetailedQuest()
                end
            -- Dragon Talon Fire Essence
            elseif not HasItem("Dragon Talon") and level >= 1100 and CheckItem("Fire Essence") == 0 then
                CurrentAdvancedQuest = "FireEssence"
                HandleFireEssenceDetailedQuest()
            -- Cake Prince / Dough King
            elseif World3 and level >= 2300 then
                CurrentAdvancedQuest = "CakePrinceDoughKing"
                HandleCakePrinceDoughKingQuest()
            -- Elite Hunters
            elseif World3 and not HasItem("Yama") then
                local eliteQuest = replicated.Remotes.CommF_:InvokeServer("EliteHunter")
                if eliteQuest ~= "I don't have anything for you right now. Come back later." then
                    CurrentAdvancedQuest = "EliteHunters"
                    HandleEliteHuntersDetailedQuest()
                end
            -- Darkbeard / Core
            elseif World2 then
                if CheckBoss("Darkbeard") or CheckBoss("Core") then
                    CurrentAdvancedQuest = "DarkbeardCore"
                    HandleDarkbeardCoreQuest()
                end
            else
                CurrentAdvancedQuest = nil
            end
        end)
    end
end)

--// ================== AUTO BUY LEGENDARY SWORDS (REPEATED) ==================
task.spawn(function()
    while task.wait(60) do
        pcall(function()
            if World2 and Player.Data.Beli.Value >= 2000000 then
                replicated.Remotes.CommF_:InvokeServer("LegendarySwordDealer", "1")
                replicated.Remotes.CommF_:InvokeServer("LegendarySwordDealer", "2")
                replicated.Remotes.CommF_:InvokeServer("LegendarySwordDealer", "3")
            end
        end)
    end
end)

--// ================== AUTO BUY ALL HAKI (REPEATED) ==================
task.spawn(function()
    while task.wait(10) do
        pcall(function()
            local level = Player.Data.Level.Value
            if level >= 10 then replicated.Remotes.CommF_:InvokeServer("BuyHaki", "Geppo") end
            if level >= 100 then
                replicated.Remotes.CommF_:InvokeServer("BuyHaki", "Soru")
                replicated.Remotes.CommF_:InvokeServer("BuyHaki", "Buso")
            end
            if level >= 300 then replicated.Remotes.CommF_:InvokeServer("KenTalk", "Buy") end
        end)
    end
end)

--// ================== SERVER HOP IF STUCK IN QUEST ==================
task.spawn(function()
    local lastPos = nil
    local stuckTime = 0
    while task.wait(1) do
        pcall(function()
            if CurrentAdvancedQuest then
                local hrp = Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")
                if hrp then
                    local pos = hrp.Position
                    if lastPos and (pos - lastPos).Magnitude < 1 then
                        stuckTime = stuckTime + 1
                        if stuckTime >= 30 then
                            HopLowServer(5)
                            stuckTime = 0
                        end
                    else
                        stuckTime = 0
                        lastPos = pos
                    end
                end
            else
                stuckTime = 0
                lastPos = nil
            end
        end)
    end
end)

--[[
   Astral Hub - Part 4
   Misc Systems & Final Features: UI Enhancements, Auto Misc, Optimization, Endgame Automation
--]]

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local VirtualInputManager = game:GetService("VirtualInputManager")
local TweenService = game:GetService("TweenService")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
local CoreGui = game:GetService("CoreGui")
local Lighting = game:GetService("Lighting")
local CollectionService = game:GetService("CollectionService")

local Player = Players.LocalPlayer
local replicated = ReplicatedStorage

--// ================== GLOBAL VARIABLES (if not defined) ==================
_AutoFarm = _G.AutoFarm or true
_World1 = _G.World1 or (game.PlaceId == 2753915549)
_World2 = _G.World2 or (game.PlaceId == 4442274628)
_World3 = _G.World3 or (game.PlaceId == 7449423635)

--// ================== EXTENDED HELPER FUNCTIONS ==================
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
        if (item.Type == "Sword" or item.Type == "Gun" or item.Type == "Material") and item.Name == itemName then
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

--// ================== AUTO REDEEM ALL CODES ==================
local AllCodes = {
    -- Exp Codes
    "Sub2Fer999", "Enyu_is_Pro", "JCWK", "StarcodeHEO", "MagicBUS",
    "KittGaming", "Sub2CaptainMaui", "Sub2OfficialNoobie", "TheGreatAce",
    "Sub2NoobMaster123", "Sub2Daigrock", "Axiore", "StrawHatMaine",
    "TantaiGaming", "Bluxxy",
    -- Reset Stats Codes
    "SUB2GAMERROBOT_EXP1", "GAMER_ROBOT_1M", "SUBGAMERROBOT_RESET",
    "RESET_5B", "SUB2GAMERROBOT_RESET1",
    -- Other
    "Sub2UncleKizaru", "ADMIN_TROLL", "DRAGONABUSE", "DEVSCOOKING",
    -- Newer codes (add more if known)
    "NOOB2PRO", "FUDD10", "BIGNEWS", "THEYWILL", "FREEDRAGON"
}

task.spawn(function()
    while task.wait(300) do -- Every 5 minutes
        pcall(function()
            for _, code in ipairs(AllCodes) do
                replicated.Remotes.Redeem:InvokeServer(code)
                task.wait(0.5)
            end
        end)
    end
end)

--// ================== ANTI-AFK ENHANCED ==================
task.spawn(function()
    while task.wait(120) do -- Every 2 minutes
        pcall(function()
            VirtualInputManager:SendKeyEvent(true, "Space", false, game)
            task.wait(0.2)
            VirtualInputManager:SendKeyEvent(false, "Space", false, game)
            -- Also move mouse slightly
            VirtualInputManager:SendMouseMoveEvent(100, 100, game)
        end)
    end
end)

--// ================== AUTO REJOIN IF KICKED/DISCONNECTED ==================
-- This is handled by external auto-execute usually, but we can add a simple check
task.spawn(function()
    while task.wait(10) do
        pcall(function()
            if not Player or not Player.Character or not Player.Character:FindFirstChild("HumanoidRootPart") then
                task.wait(5)
                if not Player.Character then
                    -- Attempt to rejoin same game
                    TeleportService:Teleport(game.PlaceId, Player)
                end
            end
        end)
    end
end)

--// ================== AUTO STATS DISTRIBUTION (ADVANCED) ==================
local StatPriority = {"Melee", "Defense", "Sword", "Gun", "Blox Fruit"}
local StatLimits = {Melee = 2650, Defense = 2550, Sword = 2550, Gun = 2550, ["Blox Fruit"] = 2550}

task.spawn(function()
    while task.wait(2) do
        pcall(function()
            local points = Player.Data.Points.Value
            if points <= 0 then return end
            local stats = Player.Data.Stats
            for _, statName in ipairs(StatPriority) do
                local stat = stats[statName]
                if stat and stat.Level.Value < StatLimits[statName] then
                    replicated.Remotes.CommF_:InvokeServer("AddPoint", statName, points)
                    break
                end
            end
        end)
    end
end)

--// ================== AUTO STORE FRUITS (WHITELIST/BLACKLIST) ==================
local FruitBlacklist = {"Bomb-Bomb", "Spike-Spike", "Chop-Chop", "Spring-Spring", "Kilo-Kilo", "Smoke-Smoke", "Spin-Spin"}
local FruitWhitelist = {} -- If empty, all non-blacklisted stored

local function IsFruitBlacklisted(fruitName)
    for _, bad in ipairs(FruitBlacklist) do
        if fruitName == bad then return true end
    end
    return false
end

task.spawn(function()
    while task.wait(3) do
        pcall(function()
            local function storeTool(tool)
                local originalName = tool:GetAttribute("OriginalName")
                if originalName then
                    if IsFruitBlacklisted(originalName) then
                        -- Drop it instead of storing
                        tool.Parent = Workspace
                    else
                        replicated.Remotes.CommF_:InvokeServer("StoreFruit", originalName, tool)
                    end
                end
            end
            for _, tool in ipairs(Player.Backpack:GetChildren()) do
                if tool:IsA("Tool") and string.find(tool.Name, "Fruit") then
                    storeTool(tool)
                end
            end
            for _, tool in ipairs(Player.Character:GetChildren()) do
                if tool:IsA("Tool") and string.find(tool.Name, "Fruit") then
                    storeTool(tool)
                end
            end
        end)
    end
end)

--// ================== AUTO EQUIP BEST MELEE/SWORD/GUN ==================
local function GetBestWeapon(weaponType)
    local bestTool = nil
    local bestDamage = 0
    local inventory = replicated.Remotes.CommF_:InvokeServer("getInventory")
    for _, item in ipairs(inventory) do
        if item.Type == weaponType then
            -- Simple heuristic: use item's base damage or just name
            local damage = 0
            if item.Name == "Godhuman" then damage = 999
            elseif item.Name == "Dragon Talon" then damage = 900
            elseif item.Name == "Electric Claw" then damage = 850
            elseif item.Name == "Sharkman Karate" then damage = 800
            elseif item.Name == "Superhuman" then damage = 700
            elseif item.Name == "Death Step" then damage = 650
            elseif item.Name == "Cursed Dual Katana" then damage = 999
            elseif item.Name == "Tushita" then damage = 800
            elseif item.Name == "Yama" then damage = 800
            elseif item.Name == "Dark Blade" then damage = 900
            elseif item.Name == "Soul Guitar" then damage = 800
            elseif item.Name == "Kabucha" then damage = 700
            end
            if damage > bestDamage then
                bestDamage = damage
                bestTool = item.Name
            end
        end
    end
    return bestTool
end

task.spawn(function()
    while task.wait(1) do
        pcall(function()
            if not _AutoFarm then return end
            local tool = Player.Character and Player.Character:FindFirstChildOfClass("Tool")
            if not tool then
                -- Equip best melee first
                local bestMelee = GetBestWeapon("Melee")
                if bestMelee and HasItem(bestMelee) then
                    EquipTool(bestMelee)
                else
                    local bestSword = GetBestWeapon("Sword")
                    if bestSword and HasItem(bestSword) then
                        EquipTool(bestSword)
                    end
                end
            else
                -- If current tool is not best, switch after cooldown
                if tool.ToolTip == "Melee" then
                    local best = GetBestWeapon("Melee")
                    if best and best ~= tool.Name and HasItem(best) then
                        task.wait(2)
                        EquipTool(best)
                    end
                elseif tool.ToolTip == "Sword" then
                    local best = GetBestWeapon("Sword")
                    if best and best ~= tool.Name and HasItem(best) then
                        task.wait(2)
                        EquipTool(best)
                    end
                end
            end
        end)
    end
end)

--// ================== AUTO RACE REROLL (FOR V4 OR BETTER RACE) ==================
local DesiredRaces = {"Cyborg", "Ghoul", "Human", "Angel", "Shark", "Mink"}
task.spawn(function()
    while task.wait(60) do
        pcall(function()
            local currentRace = Player.Data.Race.Value
            local fragments = Player.Data.Fragments.Value
            if fragments >= 3000 and not table.find(DesiredRaces, currentRace) then
                replicated.Remotes.CommF_:InvokeServer("Alchemist", "2") -- Reroll race
            end
        end)
    end
end)

--// ================== AUTO COLLECT CHESTS & ITEMS ==================
task.spawn(function()
    while task.wait(5) do
        pcall(function()
            for _, obj in ipairs(Workspace:GetDescendants()) do
                if obj:IsA("ProximityPrompt") then
                    local parent = obj.Parent
                    if parent and parent:IsA("Model") and (parent.Name == "Chest" or parent.Name == "Item") then
                        local dist = (parent:GetPivot().Position - Player.Character.HumanoidRootPart.Position).Magnitude
                        if dist < 50 then
                            TweenTo(parent:GetPivot())
                            task.wait(1)
                            fireproximityprompt(obj)
                        end
                    end
                end
            end
        end)
    end
end)

--// ================== AUTO BUY RANDOM ITEMS (CONFIGS) ==================
task.spawn(function()
    while task.wait(30) do
        pcall(function()
            local beli = Player.Data.Beli.Value
            if beli < 1000000 then return end
            
            -- Buy all available swords under 1M
            local cheapSwords = {"Katana", "Cutlass", "Dual Katana", "Iron Mace", "Pipe", "Soul Cane"}
            for _, sword in ipairs(cheapSwords) do
                if not HasItem(sword) then
                    replicated.Remotes.CommF_:InvokeServer("BuyItem", sword)
                    task.wait(0.5)
                end
            end
            -- Buy all guns
            local cheapGuns = {"Flintlock", "Musket", "Refined Slingshot", "Dual Flintlock", "Cannon"}
            for _, gun in ipairs(cheapGuns) do
                if not HasItem(gun) then
                    replicated.Remotes.CommF_:InvokeServer("BuyItem", gun)
                    task.wait(0.5)
                end
            end
        end)
    end
end)

--// ================== AUTO OBSERVATION HAKI V2 (DODGE TRAINING) ==================
task.spawn(function()
    while task.wait(2) do
        pcall(function()
            local ken = Player.Character and Player.Character:FindFirstChild("Ken")
            if ken and ken:FindFirstChild("Level") and ken.Level.Value < 600 then
                -- Find nearest enemy and try to dodge
                for _, enemy in ipairs(Workspace.Enemies:GetChildren()) do
                    if enemy:FindFirstChild("Humanoid") and enemy.Humanoid.Health > 0 then
                        local hrp = enemy:FindFirstChild("HumanoidRootPart")
                        if hrp and (hrp.Position - Player.Character.HumanoidRootPart.Position).Magnitude < 15 then
                            -- Move backwards quickly
                            TweenTo(Player.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -10))
                            break
                        end
                    end
                end
            end
        end)
    end
end)

--// ================== AUTO FARM FRAGMENTS VIA RAIDS (ENHANCED) ==================
local RaidMaps = {"Ice", "Flame", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Buddha", "Sand"}
local CurrentRaidMap = "Ice"

task.spawn(function()
    while task.wait(5) do
        pcall(function()
            if not _AutoFarm then return end
            if Player.PlayerGui.Main.TopHUDList.RaidTimer.Visible then return end -- already in raid
            
            local fragments = Player.Data.Fragments.Value
            if fragments >= 50000 then return end -- enough fragments
            
            -- Check if we have microchip or enough fragments
            if HasItem("Special Microchip") or fragments >= 1000 then
                -- Select a map based on fruit or random
                local fruitName = Player.Data.DevilFruit.Value
                for _, map in ipairs(RaidMaps) do
                    if string.find(fruitName, map) then
                        CurrentRaidMap = map
                        break
                    end
                end
                replicated.Remotes.CommF_:InvokeServer("RaidsNpc", "Select", CurrentRaidMap)
                task.wait(1)
                
                if _World2 then
                    fireclickdetector(Workspace.Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector)
                elseif _World3 then
                    TweenTo(CFrame.new(-5034, 315, -2951))
                    task.wait(3)
                    fireclickdetector(Workspace.Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector)
                end
            else
                -- Load cheapest fruit to get fragments
                local fruits = GetFruits()
                if #fruits > 0 then
                    local cheapest = fruits[1]
                    if cheapest.Value < 1000000 then
                        replicated.Remotes.CommF_:InvokeServer("LoadFruit", cheapest.Name)
                    end
                end
            end
        end)
    end
end)

--// ================== AUTO FRUIT NOTIFIER & GRABBER ==================
task.spawn(function()
    while task.wait(2) do
        pcall(function()
            for _, obj in ipairs(Workspace:GetChildren()) do
                if obj:IsA("Tool") and string.find(obj.Name, "Fruit") and obj:FindFirstChild("Handle") then
                    local dist = (obj.Handle.Position - Player.Character.HumanoidRootPart.Position).Magnitude
                    if dist < 100 then
                        TweenTo(obj.Handle.CFrame)
                        task.wait(1)
                        if Player.Backpack:FindFirstChild(obj.Name) or Player.Character:FindFirstChild(obj.Name) then
                            -- Store or drop based on blacklist
                            local originalName = obj:GetAttribute("OriginalName")
                            if originalName then
                                if table.find(FruitBlacklist, originalName) then
                                    obj.Parent = Workspace
                                else
                                    replicated.Remotes.CommF_:InvokeServer("StoreFruit", originalName, obj)
                                end
                            end
                        end
                    end
                end
            end
        end)
    end
end)

--// ================== AUTO SERVER HOP ON CONDITIONS ==================
local function ShouldHopServer()
    -- Too many players
    if #Players:GetPlayers() > 8 then return true end
    -- No enemies nearby for 1 minute
    local enemyNearby = false
    for _, enemy in ipairs(Workspace.Enemies:GetChildren()) do
        if enemy:FindFirstChild("Humanoid") and enemy.Humanoid.Health > 0 then
            local hrp = enemy:FindFirstChild("HumanoidRootPart")
            if hrp and (hrp.Position - Player.Character.HumanoidRootPart.Position).Magnitude < 200 then
                enemyNearby = true
                break
            end
        end
    end
    if not enemyNearby and _AutoFarm then
        return true
    end
    return false
end

task.spawn(function()
    while task.wait(60) do
        pcall(function()
            if ShouldHopServer() then
                HopLowServer(6)
            end
        end)
    end
end)

--// ================== KILL AURA ENHANCED ==================
task.spawn(function()
    while task.wait(0.05) do
        if not _AutoFarm then continue end
        pcall(function()
            for _, enemy in ipairs(Workspace.Enemies:GetChildren()) do
                if enemy:FindFirstChild("Humanoid") and enemy.Humanoid.Health > 0 then
                    local hrp = enemy:FindFirstChild("HumanoidRootPart")
                    if hrp and (hrp.Position - Player.Character.HumanoidRootPart.Position).Magnitude < 70 then
                        -- Clear stuns
                        if Player.Character:FindFirstChild("Stun") then Player.Character.Stun.Value = 0 end
                        if Player.Character:FindFirstChild("Busy") then Player.Character.Busy.Value = false end
                        if enemy:FindFirstChild("Stun") then enemy.Stun.Value = 0 end
                        if enemy:FindFirstChild("Busy") then enemy.Busy.Value = false end
                        
                        -- Use skills
                        local tool = Player.Character:FindFirstChildOfClass("Tool")
                        if tool and tool.ToolTip ~= "Gun" then
                            VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 1)
                            task.wait(0.02)
                            VirtualInputManager:SendMouseButtonEvent(0, 0, 0, false, game, 1)
                        end
                        break
                    end
                end
            end
        end)
    end
end)

--// ================== UI ENHANCEMENTS (ADDITIONAL LABELS) ==================
-- Add more information to existing UI if present
task.spawn(function()
    while task.wait(1) do
        pcall(function()
            local ui = CoreGui:FindFirstChild("AstralHubUI")
            if ui then
                local main = ui:FindFirstChild("MainFrame")
                if main then
                    -- Add Fragments label if not exists
                    local fragLabel = main:FindFirstChild("FragmentsLabel")
                    if not fragLabel then
                        fragLabel = Instance.new("TextLabel")
                        fragLabel.Name = "FragmentsLabel"
                        fragLabel.Size = UDim2.new(0.9, 0, 0, 20)
                        fragLabel.Position = UDim2.new(0.05, 0, 0, 130)
                        fragLabel.BackgroundTransparency = 1
                        fragLabel.TextColor3 = Color3.fromRGB(200, 200, 255)
                        fragLabel.Font = Enum.Font.Gotham
                        fragLabel.TextSize = 12
                        fragLabel.TextXAlignment = Enum.TextXAlignment.Left
                        fragLabel.Parent = main
                    end
                    fragLabel.Text = "Fragments: " .. Player.Data.Fragments.Value
                    
                    -- Add Beli label
                    local beliLabel = main:FindFirstChild("BeliLabel")
                    if not beliLabel then
                        beliLabel = Instance.new("TextLabel")
                        beliLabel.Name = "BeliLabel"
                        beliLabel.Size = UDim2.new(0.9, 0, 0, 20)
                        beliLabel.Position = UDim2.new(0.05, 0, 0, 150)
                        beliLabel.BackgroundTransparency = 1
                        beliLabel.TextColor3 = Color3.fromRGB(255, 255, 100)
                        beliLabel.Font = Enum.Font.Gotham
                        beliLabel.TextSize = 12
                        beliLabel.TextXAlignment = Enum.TextXAlignment.Left
                        beliLabel.Parent = main
                    end
                    beliLabel.Text = "Beli: " .. Player.Data.Beli.Value
                end
            end
        end)
    end
end)

--// ================== FPS BOOSTER EXTENDED ==================
task.spawn(function()
    if getgenv().Configs and getgenv().Configs["FPS Booster"] then
        -- Remove all non-essential parts from map
        local keepParts = {"Enemies", "Characters", "NPCs", "Doors", "Chests"}
        for _, obj in ipairs(Workspace:GetDescendants()) do
            if obj:IsA("BasePart") and not obj:IsDescendantOf(Workspace.Enemies) then
                local keep = false
                for _, name in ipairs(keepParts) do
                    if obj.Parent and obj.Parent.Name == name then
                        keep = true
                        break
                    end
                end
                if not keep then
                    obj.Material = Enum.Material.Plastic
                    obj.Reflectance = 0
                    obj.CastShadow = false
                end
            end
        end
        -- Disable lighting effects
        for _, effect in ipairs(Lighting:GetChildren()) do
            if effect:IsA("PostEffect") then
                effect.Enabled = false
            end
        end
    end
end)

--// ================== AUTO COLLECT BONES & ECTOPLASM ==================
task.spawn(function()
    while task.wait(5) do
        pcall(function()
            -- Auto exchange bones for random rewards if above 500
            if CheckItem("Bones") > 500 then
                while replicated.Remotes.CommF_:InvokeServer("Bones", "Check") > 0 do
                    replicated.Remotes.CommF_:InvokeServer("Bones", "Buy", 1, 1)
                    task.wait(0.5)
                end
            end
            -- Exchange ectoplasm for midnight blade if not owned
            if not HasItem("Midnight Blade") and replicated.Remotes.CommF_:InvokeServer("Ectoplasm", "Check") >= 100 then
                replicated.Remotes.CommF_:InvokeServer("Ectoplasm", "Buy", 3)
            end
        end)
    end
end)

--// ================== AUTO BUY LEGENDARY SWORDS (REPEATED) ==================
task.spawn(function()
    while task.wait(120) do
        pcall(function()
            if _World2 and Player.Data.Beli.Value >= 2000000 then
                replicated.Remotes.CommF_:InvokeServer("LegendarySwordDealer", "1")
                replicated.Remotes.CommF_:InvokeServer("LegendarySwordDealer", "2")
                replicated.Remotes.CommF_:InvokeServer("LegendarySwordDealer", "3")
            end
        end)
    end
end)

--// ================== AUTO BUY ENHANCEMENT ITEMS ==================
task.spawn(function()
    while task.wait(60) do
        pcall(function()
            local beli = Player.Data.Beli.Value
            if beli >= 10000000 then
                -- Buy stat refund if needed
                -- (not implemented)
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
            -- Close annoying popups
            local screen = Player.PlayerGui:FindFirstChild("ScreenGui")
            if screen then
                for _, child in ipairs(screen:GetChildren()) do
                    if child.Name == "ErrorPrompt" or child.Name == "PurchasePrompt" then
                        child.Visible = false
                    end
                end
            end
        end)
    end
end)

--// ================== FINAL INITIALIZATION ==================
print("Astral Hub - Loaded Successfully!")