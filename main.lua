-- UUltimatLY HUB | MAIN LOADER 2025 (BULLETPROOF)
-- Made for KUKI @erenxkuki | No Rayfield Fail | Custom UI

repeat wait() until game:IsLoaded()
wait(1)

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- MADARA INTRO (AUTO FIX - NO STUCK BLACK SCREEN)
local introGui = Instance.new("ScreenGui")
introGui.Name = "UUltimatLYIntro"
introGui.ResetOnSpawn = false
introGui.Parent = PlayerGui

local introFrame = Instance.new("Frame")
introFrame.Size = UDim2.new(1, 0, 1, 0)
introFrame.BackgroundColor3 = Color3.new(0, 0, 0)
introFrame.Parent = introGui

local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://6101243460"  -- Madara speech
sound.Volume = 1
sound.Parent = introFrame
sound:Play()

local title = Instance.new("TextLabel")
title.Size = UDim2.new(0.8, 0, 0.2, 0)
title.Position = UDim2.new(0.1, 0, 0.4, 0)
title.BackgroundTransparency = 1
title.Text = "UUltimatLY HUB\nLoading..."
title.TextColor3 = Color3.fromRGB(220, 20, 60)
title.Font = Enum.Font.GothamBlack
title.TextScaled = true
title.Parent = introFrame

-- AUTO DESTROY INTRO AFTER 5 SEC (NO STUCK)
task.delay(5, function()
    introGui:Destroy()
    sound:Stop()
end)

-- SKIP WITH ANY KEY
game:GetService("UserInputService").InputBegan:Connect(function()
    introGui:Destroy()
    sound:Stop()
end)

wait(5)  -- Intro time

-- CUSTOM MINI-UI (NO RAYFIELD FAIL - LOOKS LIKE REDZ)
local hubGui = Instance.new("ScreenGui")
hubGui.Name = "UUltimatLYHub"
hubGui.ResetOnSpawn = false
hubGui.Parent = PlayerGui

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0.4, 0, 0.6, 0)
mainFrame.Position = UDim2.new(0.3, 0, 0.2, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
mainFrame.BorderSizePixel = 0
mainFrame.Visible = false
mainFrame.Parent = hubGui

-- Title
local titleBar = Instance.new("TextLabel")
titleBar.Size = UDim2.new(1, 0, 0.1, 0)
titleBar.BackgroundColor3 = Color3.fromRGB(50, 0, 0)
titleBar.Text = "UUltimatLY HUB by KUKI"
titleBar.TextColor3 = Color3.new(1, 1, 1)
titleBar.Font = Enum.Font.GothamBold
titleBar.TextScaled = true
titleBar.Parent = mainFrame

-- Close
local close = Instance.new("TextButton")
close.Size = UDim2.new(0.1, 0, 1, 0)
close.Position = UDim2.new(0.9, 0, 0, 0)
close.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
close.Text = "X"
close.TextColor3 = Color3.new(1, 1, 1)
close.TextScaled = true
close.Parent = titleBar
close.MouseButton1Click:Connect(function() mainFrame.Visible = false end)

-- Farm Toggle
local farmToggle = Instance.new("TextButton")
farmToggle.Size = UDim2.new(0.9, 0, 0.1, 0)
farmToggle.Position = UDim2.new(0.05, 0, 0.15, 0)
farmToggle.BackgroundColor3 = Color3.fromRGB(50, 0, 0)
farmToggle.Text = "Auto Farm: OFF"
farmToggle.TextColor3 = Color3.new(1, 1, 1)
farmToggle.TextScaled = true
farmToggle.Parent = mainFrame

getgenv().AutoFarm = false
farmToggle.MouseButton1Click:Connect(function()
    getgenv().AutoFarm = not getgenv().AutoFarm
    farmToggle.Text = getgenv().AutoFarm and "Auto Farm: ON" or "Auto Farm: OFF"
    farmToggle.BackgroundColor3 = getgenv().AutoFarm and Color3.fromRGB(0, 150, 0) or Color3.fromRGB(50, 0, 0)
    if getgenv().AutoFarm then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/erenxkuki/UUltimatLY-Hub/main/modules/AutoFarm.lua"))()
    end
end)

-- Bring Mob Toggle
local bringToggle = Instance.new("TextButton")
bringToggle.Size = UDim2.new(0.9, 0, 0.1, 0)
bringToggle.Position = UDim2.new(0.05, 0, 0.3, 0)
bringToggle.BackgroundColor3 = Color3.fromRGB(50, 0, 0)
bringToggle.Text = "Bring Mob: ON"
bringToggle.TextColor3 = Color3.new(1, 1, 1)
bringToggle.TextScaled = true
bringToggle.Parent = mainFrame

getgenv().BringMob = true
bringToggle.MouseButton1Click:Connect(function()
    getgenv().BringMob = not getgenv().BringMob
    bringToggle.Text = getgenv().BringMob and "Bring Mob: ON" or "Bring Mob: OFF"
    bringToggle.BackgroundColor3 = getgenv().BringMob and Color3.fromRGB(0, 150, 0) or Color3.fromRGB(50, 0, 0)
end)

-- Server Hop Button
local hopBtn = Instance.new("TextButton")
hopBtn.Size = UDim2.new(0.9, 0, 0.1, 0)
hopBtn.Position = UDim2.new(0.05, 0, 0.45, 0)
hopBtn.BackgroundColor3 = Color3.fromRGB(50, 0, 0)
hopBtn.Text = "Server Hop"
hopBtn.TextColor3 = Color3.new(1, 1, 1)
hopBtn.TextScaled = true
hopBtn.Parent = mainFrame
hopBtn.MouseButton1Click:Connect(function()
    game:GetService("TeleportService"):Teleport(game.PlaceId, LocalPlayer)
end)

-- INSERT TO TOGGLE UI
game:GetService("UserInputService").InputBegan:Connect(function(key)
    if key.KeyCode == Enum.KeyCode.Insert then
        mainFrame.Visible = not mainFrame.Visible
    end
end)

mainFrame.Visible = true

print("UUltimatLY HUB LOADED | Custom UI | No Rayfield Fail | KUKI KING")
