-- UUltimatLY HUB | modules/MobKiller.lua
-- CLEAN MOB KILLING FROM YOUR OLD SOURCE (UPGRADED 2025)
-- Made for KUKI | No detection | Instant clear

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer

-- MAIN KILL FUNCTION (call with mob name)
getgenv().KillMobs = function(MobName, PosMon)
    spawn(function()
        while getgenv().AutoFarm do
            pcall(function()
                for _, mob in pairs(Workspace.Enemies:GetChildren()) do
                    if mob.Name == MobName and mob:FindFirstChild("Humanoid") and mob.Humanoid.Health > 0 and mob:FindFirstChild("HumanoidRootPart") then
                        mob.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                        mob.HumanoidRootPart.CFrame = PosMon or LocalPlayer.Character.HumanoidRootPart.CFrame
                        mob.HumanoidRootPart.CanCollide = false
                        mob.Head.CanCollide = false
                        mob.Humanoid.WalkSpeed = 0
                        mob.Humanoid.JumpPower = 0

                        if mob.Humanoid:FindFirstChild("Animator") then
                            mob.Humanoid.Animator:Destroy()
                        end

                        sethiddenproperty(LocalPlayer, "SimulationRadius", math.huge)
                        sethiddenproperty(LocalPlayer, "MaxSimulationRadius", math.huge)
                    end
                end
            end)
            task.wait()
        end
    end)
end

print("MobKiller loaded — ready for KUKI")
