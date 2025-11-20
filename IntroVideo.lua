-- UUltimatLY HUB | IntroVideo.lua
-- PLAYS FULLSCREEN MADARA / GOJO VIDEO ON JOIN
-- Made for KUKI | 2025

local VideoID = "8187046270"  -- Madara Uchiha Perfect Susanoo (4K 60FPS)
-- Change to "7678344578" for Gojo Domain Expansion
-- Change to "9042329876" for Sukuna vs Mahoraga

local Intro = Instance.new("ScreenGui")
local VideoFrame = Instance.new("VideoFrame")

Intro.Name = "UUltimatLYIntro"
Intro.Parent = game:GetService("CoreGui")
Intro.ResetOnSpawn = false

VideoFrame.Parent = Intro
VideoFrame.Size = UDim2.new(1, 0, 1, 0)
VideoFrame.Position = UDim2.new(0, 0, 0, 0)
VideoFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
VideoFrame.Video = "rbxassetid://" .. VideoID
VideoFrame.Looped = false
VideoFrame.Volume = 0.7
VideoFrame.ZIndex = 999999

-- Play the video
VideoFrame:Play()

-- Auto remove after video ends (most are 30-45 sec)
task.delay(45, function()
    Intro:Destroy()
end)

-- Optional: Skip with any key press
game:GetService("UserInputService").InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Keyboard or input.UserInputType == Enum.UserInputType.MouseButton1 then
        Intro:Destroy()
    end
end)

print("UUltimatLY HUB → Intro Video Playing | KUKI LEGEND")
