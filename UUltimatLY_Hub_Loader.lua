-- ═════════════════════════════════════════════
--  UUltimatLY HUB - THE UNSTOPPABLE 2025
--  github.com/erenxkuki/UUltimatLY-Hub
--  FULL POTENTIAL • MAXIMUM SWAG • ZERO LAG
-- ═════════════════════════════════════════════

local TweenService = game:GetService("TweenService")
local SoundService = game:GetService("SoundService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local Repo = "https://raw.githubusercontent.com/erenxkuki/UUltimatLY-Hub/main/"

-- YOUR EXACT 5 SCRIPTS
local Scripts = {
    ["Auto Chest"]     = "UUltimatLY_Auto_Chest.lua",
    ["Aimbot"]         = "UUltimatLY_Hub_Aimbot.lua",
    ["Main Hub"]  = "UUltimatLY_Hub_Main.lua",
    ["V1 Hub"]      = "UUltimatLY_Hub_V1.lua",
    ["V2 Hub"]      = "UUltimatLY_Hub_V2.lua"
}

-- ========================= EPIC LOADER =========================
local loader = Instance.new("ScreenGui")
loader.Name = "UUltimatLYGodLoader"
loader.ResetOnSpawn = false
loader.Parent = player.PlayerGui

-- Blur + Dim
local blur = Instance.new("BlurEffect", game.Lighting)
local dim = Instance.new("ColorCorrectionEffect", game.Lighting)
dim.Saturation = -0.4
dim.Contrast = 0.2
TweenService:Create(blur, TweenInfo.new(1.5), {Size = 30}):Play()
TweenService:Create(dim, TweenInfo.new(1.5), {Brightness = -0.15}):Play()

-- Icon + Pulsing Glow
local icon = Instance.new("ImageLabel", loader)
icon.Size = UDim2.new(0,160,0,160)
icon.Position = UDim2.new(0.5,-80,0.5,-250)
icon.Image = "rbxassetid://73642467719097"
icon.BackgroundTransparency = 1
icon.ImageTransparency = 1

local glow = icon:Clone()
glow.Parent = loader
glow.Size = UDim2.new(0,300,0,300)
glow.Position = UDim2.new(0.5,-150,0.5,-320)
glow.ImageColor3 = Color3.fromRGB(255,0,150)
glow.ImageTransparency = 1
glow.ZIndex = 0

-- Title (UUltimatLY)
local title = Instance.new("TextLabel", loader)
title.Size = UDim2.new(0,800,0,120)
title.Position = UDim2.new(0.5,-400,0.5,-100)
title.Text = "UUltimatLY"
title.Font = Enum.Font.GothamBlack
title.TextSize = 100
title.TextColor3 = Color3.fromRGB(255,0,120)
title.TextStrokeTransparency = 0.6
title.TextStrokeColor3 = Color3.fromRGB(100,0,50)
title.BackgroundTransparency = 1
title.TextTransparency = 1

-- Subtitle
local subtitle = Instance.new("TextLabel", loader)
subtitle.Size = UDim2.new(0,700,0,50)
subtitle.Position = UDim2.new(0.5,-350,0.5,0)
subtitle.Text = "Awakening Ultimate Power..."
subtitle.Font = Enum.Font.GothamSemibold
subtitle.TextSize = 34
subtitle.TextColor3 = Color3.fromRGB(180,180,255)
subtitle.BackgroundTransparency = 1
subtitle.TextTransparency = 1

-- Progress Bar
local barBg = Instance.new("Frame", loader)
barBg.Size = UDim2.new(0,600,0,20)
barBg.Position = UDim2.new(0.5,-300,0.5,100)
barBg.BackgroundColor3 = Color3.fromRGB(15,15,25)
barBg.BorderSizePixel = 0
barBg.BackgroundTransparency = 1
local corner1 = Instance.new("UICorner", barBg); corner1.CornerRadius = UDim.new(0,10)

local barFill = Instance.new("Frame", barBg)
barFill.Size = UDim2.new(0,0,1,0)
barFill.BackgroundColor3 = Color3.fromRGB(255,0,150)
barFill.BorderSizePixel = 0
local corner2 = Instance.new("UICorner", barFill); corner2.CornerRadius = UDim.new(0,10)

-- Shine effect
local shine = Instance.new("Frame", barFill)
shine.Size = UDim2.new(0,100,1,0)
shine.BackgroundColor3 = Color3.new(1,1,1)
shine.BackgroundTransparency = 0.6
shine.Position = UDim2.new(-0.2,0,0,0)

-- Floating particles
for i = 1, 35 do
    local p = Instance.new("Frame", loader)
    p.Size = UDim2.new(0, math.random(4,12), 0, math.random(30,100))
    p.Position = UDim2.new(math.random(),0,1.1,0)
    p.BackgroundColor3 = Color3.fromRGB(255, math.random(0,100), 200)
    p.BorderSizePixel = 0
    p.BackgroundTransparency = 0.4
    TweenService:Create(p, TweenInfo.new(math.random(4,8), Enum.EasingStyle.Linear, Enum.EasingDirection.In, -1), {
        Position = UDim2.new(math.random(),0, -0.3,0),
        Rotation = math.random(-360,360)
    }):Play()
    TweenService:Create(p, TweenInfo.new(3), {BackgroundTransparency = 1}):Play()
end

-- Sound + Start animation
SoundService:PlayLocalSound("rbxassetid://6537399654")
TweenService:Create(icon, TweenInfo.new(1.2, Enum.EasingStyle.Quint), {ImageTransparency = 0}):Play()
TweenService:Create(glow, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {ImageTransparency = 0.4}):Play()
task.wait(0.7)
TweenService:Create(title, TweenInfo.new(1.2, Enum.EasingStyle.Back), {TextTransparency = 0, Position = UDim2.new(0.5,-400,0.5,-130)}):Play()
task.wait(0.5)
TweenService:Create(subtitle, TweenInfo.new(1), {TextTransparency = 0.2}):Play()
TweenService:Create(barBg, TweenInfo.new(1), {BackgroundTransparency = 0.7}):Play()

-- Fill bar with shine
local fill = TweenService:Create(barFill, TweenInfo.new(4.8, Enum.EasingStyle.Quint), {Size = UDim2.new(1,0,1,0)})
local shineMove = TweenService:Create(shine, TweenInfo.new(2, Enum.EasingStyle.Linear, Enum.EasingDirection.In, -1), {Position = UDim2.new(1.2,0,0,0)})
fill:Play(); shineMove:Play()
fill.Completed:Wait()

-- Final boom
SoundService:PlayLocalSound("rbxassetid://1837841479")
TweenService:Create(title, TweenInfo.new(0.5), {TextSize = 130, TextColor3 = Color3.fromRGB(255,100,200)}):Play()
TweenService:Create(icon, TweenInfo.new(0.5), {Size = UDim2.new(0,220,0,220)}):Play()
task.wait(0.8)

-- Fade out loader
for _, v in loader:GetChildren() do
    if v:IsA("GuiObject") then
        TweenService:Create(v, TweenInfo.new(0.8), {Transparency = 1, TextTransparency = 1, ImageTransparency = 1}):Play()
    end
end
task.wait(1)
loader:Destroy()
blur:Destroy(); dim:Destroy()

-- ========================= MAIN HUB (GOD MODE) =========================
local hub = Instance.new("ScreenGui")
hub.Name = "UUltimatLYUltimateHub"
hub.ResetOnSpawn = false
hub.Parent = player.PlayerGui

local main = Instance.new("Frame", hub)
main.Size = UDim2.new(0,850,0,520)
main.Position = UDim2.new(0.5,-425,-0.6,0)
main.BackgroundColor3 = Color3.fromRGB(8,8,18)
main.BackgroundTransparency = 1
main.ClipsDescendants = true
local mainCorner = Instance.new("UICorner", main); mainCorner.CornerRadius = UDim.new(0,22)

-- Outer glow
local outerGlow = Instance.new("ImageLabel", main)
outerGlow.Size = UDim2.new(1,120,1,120)
outerGlow.Position = UDim2.new(0,-60,0,-60)
outerGlow.BackgroundTransparency = 1
outerGlow.Image = "rbxassetid://241649826"
outerGlow.ImageColor3 = Color3.fromRGB(255,0,150)
outerGlow.ImageTransparency = 0.8

-- Title
local hubTitle = Instance.new("TextLabel", main)
hubTitle.Size = UDim2.new(1,0,0,110)
hubTitle.Text = "UUltimatLY HUB"
hubTitle.Font = Enum.Font.GothamBlack
hubTitle.TextSize = 78
hubTitle.TextColor3 = Color3.new(1,1,1)
hubTitle.BackgroundTransparency = 1
local gradient = Instance.new("UIGradient", hubTitle)
gradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255,50,150)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(200,0,255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(100,0,255))
}
gradient.Rotation = 45

-- Your icon in corner
local cornerIcon = Instance.new("ImageLabel", main)
cornerIcon.Size = UDim2.new(0,100,0,100)
cornerIcon.Position = UDim2.new(0,20,0,5)
cornerIcon.Image = "rbxassetid://73642467719097"
cornerIcon.BackgroundTransparency = 1

-- Buttons (5 perfect ones)
local yPos = 140
for name, file in pairs(Scripts) do
    local btn = Instance.new("TextButton", main)
    btn.Size = UDim2.new(0,750,0,78)
    btn.Position = UDim2.new(0.5,-375,0,yPos)
    btn.BackgroundColor3 = Color3.fromRGB(25,0,80)
    btn.Text = name
    btn.TextColor3 = Color3.new(1,1,1)
    btn.Font = Enum.Font.GothamBlack
    btn.TextSize = 36
    btn.BorderSizePixel = 0
    btn.AutoButtonColor = false

    local btnCorner = Instance.new("UICorner", btn); btnCorner.CornerRadius = UDim.new(0,16)
    local stroke = Instance.new("UIStroke", btn)
    stroke.Color = Color3.fromRGB(255,0,180)
    stroke.Thickness = 3
    stroke.Transparency = 0.6

    -- Hover glow
    btn.MouseEnter:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.35, Enum.EasingStyle.Quint), {BackgroundColor3 = Color3.fromRGB(100,0,200)}):Play()
        TweenService:Create(stroke, TweenInfo.new(0.35), {Transparency = 0, Thickness = 5}):Play()
    end)
    btn.MouseLeave:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.35), {BackgroundColor3 = Color3.fromRGB(25,0,80)}):Play()
        TweenService:Create(stroke, TweenInfo.new(0.35), {Transparency = 0.6, Thickness = 3}):Play()
    end)

    -- Click
    btn.MouseButton1Click:Connect(function()
        btn.Text = "INJECTED"
        TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(0,255,100)}):Play()
        TweenService:Create(stroke, TweenInfo.new(0.2), {Color = Color3.fromRGB(0,255,0)}):Play()
        loadstring(game:HttpGet(Repo..file))()
        task.wait(1.2)
        btn.Text = name
        TweenService:Create(btn, TweenInfo.new(0.4), {BackgroundColor3 = Color3.fromRGB(25,0,80)}):Play()
        TweenService:Create(stroke, TweenInfo.new(0.4), {Color = Color3.fromRGB(255,0,180)}):Play()
    end)

    yPos = yPos + 88
end

-- Close button
local close = Instance.new("TextButton", main)
close.Size = UDim2.new(0,60,0,60)
close.Position = UDim2.new(1,-80,0,15)
close.BackgroundColor3 = Color3.fromRGB(220,0,0)
close.Text = "X"
close.TextColor3 = Color3.new(1,1,1)
close.Font = Enum.Font.GothamBlack
close.TextSize = 40
Instance.new("UICorner", close).CornerRadius = UDim.new(0,16)
close.MouseButton1Click:Connect(function() hub:Destroy() end)

-- EPIC entrance
TweenService:Create(main, TweenInfo.new(1.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
    Position = UDim2.new(0.5,-425,0.5,-260),
    BackgroundTransparency = 0
}):Play()

print("UUltimatLY HUB BY realryzu - Loaded Successfully 🔥")
