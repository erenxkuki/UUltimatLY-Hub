-- UUltimatLY Hub Loader
-- Icon ID: 73642467719097
-- Made by realryzu for the real ones 🔥

local TweenService = game:GetService("TweenService")
local SoundService = game:GetService("SoundService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- Sound effects (you can change these IDs if you want)
local loadSound = Instance.new("Sound")
loadSound.SoundId = "rbxassetid://6537399654"  -- futuristic whoosh
loadSound.Volume = 0.7

local successSound = Instance.new("Sound")
successSound.SoundId = "rbxassetid://6537399654"  -- deep bass impact
successSound.Volume = 1
successSound.PlaybackSpeed = 0.8

loadSound.Parent = workspace
successSound.Parent = workspace

-- Main ScreenGui
local screen = Instance.new("ScreenGui")
screen.Name = "UUltimatLYUltimateLoader"
screen.ResetOnSpawn = false
screen.Parent = player:WaitForChild("PlayerGui")

-- Background blur & dim
local blur = Instance.new("BlurEffect")
blur.Size = 0
blur.Parent = game.Lighting

local dim = Instance.new("ColorCorrectionEffect")
dim.Brightness = 0
dim.Contrast = 0
dim.Saturation = -0.3
dim.Parent = game.Lighting

-- Animate background effects
TweenService:Create(blur, TweenInfo.new(1.5, Enum.EasingStyle.Sine), {Size = 24}):Play()
TweenService:Create(dim, TweenInfo.new(1.5, Enum.EasingStyle.Sine), {Brightness = -0.15}):Play()

-- Icon (your custom one)
local icon = Instance.new("ImageLabel")
icon.Size = UDim2.new(0, 120, 0, 120)
icon.Position = UDim2.new(0.5, -60, 0.5, -200)
icon.BackgroundTransparency = 1
icon.Image = "rbxassetid://73642467719097"
icon.ImageTransparency = 1
icon.Parent = screen

-- Epic glow around icon
local glow = Instance.new("ImageLabel")
glow.Size = UDim2.new(0, 200, 0, 200)
glow.Position = UDim2.new(0.5, -100, 0.5, -240)
glow.BackgroundTransparency = 1
glow.Image = "rbxassetid://241649826"  -- Roblox glow
glow.ImageColor3 = Color3.fromRGB(255, 0, 100)
glow.ImageTransparency = 1
glow.Parent = screen

-- Title: UUltimatLY
local title = Instance.new("TextLabel")
title.Size = UDim2.new(0, 600, 0, 80)
title.Position = UDim2.new(0.5, -300, 0.5, -50)
title.BackgroundTransparency = 1
title.Text = "UUltimatLY"
title.TextColor3 = Color3.fromRGB(255, 0, 80)
title.Font = Enum.Font.GothamBlack
title.TextSize = 70
title.TextTransparency = 1
title.TextStrokeTransparency = 0.7
title.TextStrokeColor3 = Color3.fromRGB(150, 0, 50)
title.Parent = screen

-- Subtitle
local subtitle = Instance.new("TextLabel")
subtitle.Size = UDim2.new(0, 500, 0, 40)
subtitle.Position = UDim2.new(0.5, -250, 0.5, 20)
subtitle.BackgroundTransparency = 1
subtitle.Text = "Optimizing Ultimate Performance..."
subtitle.TextColor3 = Color3.fromRGB(200, 200, 255)
subtitle.Font = Enum.Font.Gotham
subtitle.TextSize = 24
subtitle.TextTransparency = 1
subtitle.Parent = screen

-- Progress bar container
local barBg = Instance.new("Frame")
barBg.Size = UDim2.new(0, 500, 0, 14)
barBg.Position = UDim2.new(0.5, -250, 0.5, 80)
barBg.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
barBg.BorderSizePixel = 0
barBg.BackgroundTransparency = 1
barBg.Parent = screen

local barFill = Instance.new("Frame")
barFill.Size = UDim2.new(0, 0, 1, 0)
barFill.BackgroundColor3 = Color3.fromRGB(255, 0, 100)
barFill.BorderSizePixel = 0
barFill.Parent = barBg

-- Shining effect on bar
local shine = Instance.new("Frame")
shine.Size = UDim2.new(0, 50, 1, 0)
shine.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
shine.BackgroundTransparency = 0.7
shine.BorderSizePixel = 0
shine.Parent = barFill

-- Particles background
for i = 1, 30 do
    local particle = Instance.new("Frame")
    particle.Size = UDim2.new(0, math.random(2, 8), 0, math.random(20, 80))
    particle.Position = UDim2.new(math.random(), 0, math.random(), 0)
    particle.BackgroundColor3 = Color3.fromRGB(255, 0, 150)
    particle.BorderSizePixel = 0
    particle.BackgroundTransparency = 0.6
    particle.Parent = screen
    
    TweenService:Create(particle, TweenInfo.new(math.random(3, 7), Enum.EasingStyle.Linear, Enum.EasingDirection.In, -1), {
        Position = UDim2.new(math.random(), 0, -0.2, 0),
        Rotation = math.random(-360, 360)
    }):Play()
    
    TweenService:Create(particle, TweenInfo.new(2, Enum.EasingStyle.Sine), {BackgroundTransparency = 1}):Play()
    task.delay(2, function() particle:Destroy() end)
end

-- UICorners & Glows
Instance.new("UICorner", barBg).CornerRadius = UDim.new(0, 7)
Instance.new("UICorner", barFill).CornerRadius = UDim.new(0, 7)

-- START ANIMATION SEQUENCE
loadSound:Play()

-- Fade in icon + glow
TweenService:Create(icon, TweenInfo.new(1.2, Enum.EasingStyle.Quint), {ImageTransparency = 0}):Play()
TweenService:Create(glow, TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {
    ImageTransparency = 0.4,
    Rotation = 360
}):Play()

-- Title drop + pulse
task.wait(0.5)
TweenService:Create(title, TweenInfo.new(1, Enum.EasingStyle.Back), {TextTransparency = 0, Position = UDim2.new(0.5, -300, 0.5, -80)}):Play()
task.wait(0.3)
TweenService:Create(subtitle, TweenInfo.new(0.8, Enum.EasingStyle.Sine), {TextTransparency = 0.3}):Play()
task.wait(0.5)

-- Progress bar fill with shine
TweenService:Create(barBg, TweenInfo.new(0.8), {BackgroundTransparency = 0.7}):Play()
local fillTween = TweenService:Create(barFill, TweenInfo.new(4.5, Enum.EasingStyle.Quint), {Size = UDim2.new(1, 0, 1, 0)})

-- Shine moving across bar
local shineTween = TweenService:Create(shine, TweenInfo.new(1.5, Enum.EasingStyle.Linear, Enum.EasingDirection.In, -1), {Position = UDim2.new(1, 0, 0, 0)})
shineTween:Play()

fillTween:Play()
fillTween.Completed:Wait()

-- Final explosion effect
successSound:Play()
TweenService:Create(title, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {TextSize = 90, TextColor3 = Color3.fromRGB(255, 100, 200)}):Play()
TweenService:Create(icon, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {Size = UDim2.new(0, 180, 0, 180)}):Play()

task.wait(0.8)

-- Fade everything out
TweenService:Create(screen, TweenInfo.new(1), {BackgroundTransparency = 1}):Play()
for _, v in pairs(screen:GetChildren()) do
    if v:IsA("GuiObject") then
        TweenService:Create(v, TweenInfo.new(0.8), {BackgroundTransparency = 1, TextTransparency = 1, ImageTransparency = 1}):Play()
    end
end

task.wait(1)
blur:Destroy()
dim:Destroy()
screen:Destroy()

-- ==================== MAIN HUB GUI (EVEN SEXIER) ====================

local hub = Instance.new("ScreenGui")
hub.Name = "UUltimatLYHub"
hub.ResetOnSpawn = false
hub.Parent = player.PlayerGui

local main = Instance.new("Frame")
main.Size = UDim2.new(0, 800, 0, 500)
main.Position = UDim2.new(0.5, -400, 0.5, -250)
main.BackgroundColor3 = Color3.fromRGB(10, 10, 20)
main.BorderSizePixel = 0
main.BackgroundTransparency = 1
main.Parent = hub

local hubCorner = Instance.new("UICorner")
hubCorner.CornerRadius = UDim.new(0, 20)
hubCorner.Parent = main

local hubGlow = Instance.new("ImageLabel")
hubGlow.Size = UDim2.new(1, 100, 1, 100)
hubGlow.Position = UDim2.new(0, -50, 0, -50)
hubGlow.BackgroundTransparency = 1
hubGlow.Image = "rbxassetid://241649826"
hubGlow.ImageColor3 = Color3.fromRGB(255, 0, 150)
hubGlow.ImageTransparency = 0.8
hubGlow.Parent = main

-- Title with gradient
local grad = Instance.new("UIGradient")
grad.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 150)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(100, 0, 255))
}
grad.Rotation = 45

local hubTitle = Instance.new("TextLabel")
hubTitle.Size = UDim2.new(1, 0, 0, 100)
hubTitle.Text = "UUltimatLY HUB"
hubTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
hubTitle.Font = Enum.Font.GothamBlack
hubTitle.TextSize = 60
hubTitle.BackgroundTransparency = 1
hubTitle.Parent = main
grad.Parent = hubTitle

local hubIcon = Instance.new("ImageLabel")
hubIcon.Size = UDim2.new(0, 90, 0, 90)
hubIcon.Position = UDim2.new(0, 20, 0, 10)
hubIcon.Image = "rbxassetid://73642467719097"
hubIcon.BackgroundTransparency = 1
hubIcon.Parent = main

-- Script buttons (6)
local scripts = {"Script 1", "Script 2", "Script 3", "Script 4", "Script 5", "Script 6"}

for i, name in ipairs(scripts) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 700, 0, 60)
    btn.Position = UDim2.new(0.5, -350, 0, 120 + (i-1)*80)
    btn.BackgroundColor3 = Color3.fromRGB(30, 0, 60)
    btn.Text = name
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 28
    btn.BorderSizePixel = 0
    btn.Parent = main
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 12)
    btnCorner.Parent = btn
    
    local btnGlow = Instance.new("UIStroke")
    btnGlow.Color = Color3.fromRGB(255, 0, 150)
    btnGlow.Thickness = 2
    btnGlow.Transparency = 0.5
    btnGlow.Parent = btn
    
    btn.MouseEnter:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(80, 0, 120)}):Play()
        TweenService:Create(btnGlow, TweenInfo.new(0.3), {Transparency = 0}):Play()
    end)
    
    btn.MouseLeave:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(30, 0, 60)}):Play()
        TweenService:Create(btnGlow, TweenInfo.new(0.3), {Transparency = 0.5}):Play()
    end)
    
    btn.MouseButton1Click:Connect(function()
        btn.Text = "Injected!"
        TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(0, 255, 0)}):Play()
        task.wait(0.5)
        btn.Text = name
        
        -- ==== PUT YOUR 6 SCRIPTS HERE ====
        if i == 1 then loadstring(game:HttpGet("SCRIPT_1_URL_HERE"))() end
        if i == 2 then loadstring(game:HttpGet("SCRIPT_2_URL_HERE"))() end
        if i == 3 then loadstring(game:HttpGet("SCRIPT_3_URL_HERE"))() end
        if i == 4 then loadstring(game:HttpGet("SCRIPT_4_URL_HERE"))() end
        if i == 5 then loadstring(game:HttpGet("SCRIPT_5_URL_HERE"))() end
        if i == 6 then loadstring(game:HttpGet("SCRIPT_6_URL_HERE"))() end
    end)
end

-- Close button
local close = Instance.new("TextButton")
close.Size = UDim2.new(0, 50, 0, 50)
close.Position = UDim2.new(1, -70, 0, 20)
close.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
close.Text = "X"
close.TextColor3 = Color3.new(1,1,1)
close.Font = Enum.Font.GothamBlack
close.TextSize = 30
close.Parent = main
Instance.new("UICorner", close).CornerRadius = UDim.new(0, 10)

close.MouseButton1Click:Connect(function()
    hub:Destroy()
end)

-- Final entrance animation
main.BackgroundTransparency = 1
main.Position = UDim2.new(0.5, -400, -0.5, 0)
TweenService:Create(main, TweenInfo.new(1, Enum.EasingStyle.Back), {Position = UDim2.new(0.5, -400, 0.5, -250), BackgroundTransparency = 0}):Play()

print("UUltimatLY Hub Loaded - You're now unstoppable.")