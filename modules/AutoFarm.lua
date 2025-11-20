-- UUltimatLY HUB | modules/AutoFarm.lua
-- FULL AUTO FARM + MOB KILLER INTEGRATED | ALL SEAS | Made for KUKI
-- Update 28 Tiger | November 2025

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
local CommF = ReplicatedStorage.Remotes.CommF_

-- LOAD SEA DETECTOR (auto loads correct table)
loadstring(game:HttpGet("https://raw.githubusercontent.com/erenxkuki/UUltimatLY-Hub/main/modules/SeaDetector.lua"))()

-- WAIT FOR QUEST TABLE
repeat task.wait() until getgenv().QuestTable

-- GET CURRENT QUEST BY LEVEL
local function GetQuest()
    local lvl = LocalPlayer.Data.Level.Value
    for _, v in pairs(getgenv().QuestTable) do
        if lvl >= v.MinLevel and lvl <= v.MaxLevel then
            return v
        end
    end
end

-- SMOOTH TWEEN TELEPORT
local function Tween(pos)
    local dist = (LocalPlayer.Character.HumanoidRootPart.Position - pos.Position).Magnitude
    local tweenInfo = TweenInfo.new(dist / 350, Enum.EasingStyle.Linear)
    local tween = TweenService:Create(LocalPlayer.Character.HumanoidRootPart, tweenInfo, {CFrame = pos})
    tween:Play()
    tween.Completed:Wait()
end

-- MAIN AUTO FARM LOOP (WITH MOB KILLER FULLY INTEGRATED)
spawn(function()
    while task.wait(0.3) do
        if getgenv().AutoFarm then
            pcall(function()
                local Quest = GetQuest()
                if Quest then
                    -- STEP 1: TAKE QUEST
                    if not LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text:find(Quest.Mob) then
                        LocalPlayer.Character.HumanoidRootPart.CFrame = Quest.QuestGiverPos
                        wait(0.8)
                        CommF:InvokeServer("StartQuest", Quest.QuestName, Quest.QuestLevel)
                        wait(0.5)
                    end

                    -- STEP 2: GO TO MOBS
                    Tween(Quest.MobPos)

                    -- STEP 3: KILL ALL MOBS (USING OUR MOBKILLER LOGIC DIRECTLY)
                    for _, mob in pairs(Workspace.Enemies:GetChildren()) do
                        if mob.Name == Quest.Mob and mob:FindFirstChild("Humanoid") and mob.Humanoid.Health > 0 and mob:FindFirstChild("HumanoidRootPart") then
                            mob.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                            mob.HumanoidRootPart.CFrame = Quest.MobPos * CFrame.new(math.random(-6,6), -10, math.random(-6,6))
                            mob.HumanoidRootPart.CanCollide = false
                            mob.Head.CanCollide = false
                            mob.Humanoid.WalkSpeed = 0
                            mob.Humanoid.JumpPower = 0
                            if mob.Humanoid:FindFirstChild("Animator") then
                                mob.Humanoid.Animator:Destroy()
                            end
                            sethiddenproperty(LocalPlayer, "SimulationRadius", math.huge)
                        end
                    end
                end
            end)
        end
    end
end)

print("UUltimatLY HUB → AutoFarm + MobKiller FULLY LOADED | All Seas Ready | KUKI KING")
