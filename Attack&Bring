-- Merged Attack & Bring Logic for Blox Fruits Auto-Farm
-- Core: Brings monsters close (within 320 studs), enlarges hitbox, immobilizes, then attacks with M1/skills
-- Runs in loops while _G.AutoFarm and _G.BringMonster are true
-- Dependencies: CheckQuest() sets Mon, CFrameMon, etc.; AutoHaki(), EquipWeapon(), topos() helpers

-- Globals
_G.AutoFarm = false  -- Toggle auto-farm (attacks)
_G.BringMonster = true  -- Toggle bringing
_G.SelectWeapon = "Melee"  -- Weapon for equip
Useskill = true  -- Enable skills during attack
StartBring = true  -- Start bring phase
Mon = nil  -- Current quest monster (set by CheckQuest)
CFrameMon = CFrame.new(0, 0, 0)  -- Monster spawn
CFrameQuest = CFrame.new(0, 0, 0)  -- Quest giver
NameQuest = nil
LevelQuest = 1
PosMon = nil  -- Bring position (set dynamically)

-- Helper Functions (essential for logic)
function AutoHaki()
    pcall(function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki", "Observation")
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki", "Buso")
    end)
end

function EquipWeapon(weapon)
    pcall(function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EquipWeapon", weapon)
    end)
end

function topos(cframe)
    if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = cframe
    end
end

function InMyNetWork(part)
    if typeof(isnetworkowner) ~= "function" then return true end
    if not isnetworkowner(part) then
        if (part.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 320 then
            return false
        else
            return true
        end
    else
        return isnetworkowner(part)
    end
end

-- Update Quest/Monster (call before loops; abbreviated for core levels)
function CheckQuest()
    local MyLevel = game:GetService("Players").LocalPlayer.Data.Level.Value
    -- Example for World1 low levels; expand as needed
    if MyLevel >= 1 and MyLevel <= 9 then
        Mon = "Bandit"
        NameQuest = "BanditQuest1"
        LevelQuest = 1
        CFrameQuest = CFrame.new(1059.37195, 15.4495068, 1550.4231)
        CFrameMon = CFrame.new(1045.962646484375, 27.00250816345215, 1560.8203125)
    end
    -- Set bring position near player
    local player = game.Players.LocalPlayer.Character
    if player and player:FindFirstChild("HumanoidRootPart") then
        PosMon = player.HumanoidRootPart.CFrame * CFrame.new(0, 10, 0)
    end
end

-- Merged Bring Logic (runs every 1s; pulls monsters to PosMon if nearby/alive)
spawn(function()
    while task.wait(1) do
        pcall(function()
            CheckQuest()  -- Refresh monster/positions
            for _, monster in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                if _G.BringMonster and _G.AutoFarm and
                   (StartBring and (monster.Name == Mon or monster.Name:find(Mon)) and
                    monster:FindFirstChild("Humanoid") and monster:FindFirstChild("HumanoidRootPart") and
                    monster.Humanoid.Health > 0 and
                    (monster.HumanoidRootPart.Position - (PosMon or CFrame.new(0,0,0)).Position).Magnitude <= 320 and
                    InMyNetWork(monster.HumanoidRootPart)) then
                    
                    -- Special case: Factory Staff (tighter range)
                    if monster.Name == "Factory Staff" and (monster.HumanoidRootPart.Position - PosMon.Position).Magnitude <= 250 then
                        monster.Head.CanCollide = false
                        monster.HumanoidRootPart.CanCollide = false
                        monster.HumanoidRootPart.Size = Vector3.new(60, 60, 60)  -- Enlarge hitbox
                        monster.HumanoidRootPart.CFrame = PosMon  -- Bring to player
                        if monster.Humanoid:FindFirstChild("Animator") then
                            monster.Humanoid.Animator:Destroy()  -- Stop movement
                        end
                        sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                    -- General bring
                    else
                        monster.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                        monster.HumanoidRootPart.CFrame = PosMon
                        monster.HumanoidRootPart.CanCollide = false
                        monster.Head.CanCollide = false
                        if monster.Humanoid:FindFirstChild("Animator") then
                            monster.Humanoid.Animator:Destroy()
                        end
                        sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                    end
                end
            end
        end)
    end
end)

-- Merged Attack Logic (runs every 0.1s; quests, teleports, attacks brought monsters)
spawn(function()
    while task.wait(0.1) do
        if _G.AutoFarm and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
            pcall(function()
                CheckQuest()  -- Update quest/monster

                -- Handle quest acceptance/teleport (if far, use entrances)
                local playerPos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
                if (CFrameQuest.Position - playerPos).Magnitude > 10000 then
                    -- Example entrance (adapt for world)
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-4607.82275, 872.54248, -1667.55688))
                end

                if game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                    topos(CFrameQuest)  -- To quest giver
                    task.wait(0.5)
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", NameQuest, LevelQuest)
                end

                -- Find/attack quest monsters (integrates bring)
                local attacked = false
                for _, monster in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if monster.Name == Mon and monster:FindFirstChild("Humanoid") and monster:FindFirstChild("HumanoidRootPart") and monster.Humanoid.Health > 0 then
                        attacked = true
                        
                        -- Bring if not already (quick check)
                        if _G.BringMonster and (monster.HumanoidRootPart.Position - PosMon.Position).Magnitude > 10 then
                            monster.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                            monster.HumanoidRootPart.CFrame = PosMon
                            monster.HumanoidRootPart.CanCollide = false
                        end

                        repeat
                            task.wait(0.1)  -- Loop delay
                            
                            -- Prep
                            AutoHaki()
                            EquipWeapon(_G.SelectWeapon)
                            Useskill = true

                            -- Position near monster
                            topos(monster.HumanoidRootPart.CFrame * CFrame.new(1, 7, 3))

                            -- Attacks: M1 + Skills (adapt keys for Z/X/C/V if needed)
                            game:GetService("VirtualUser"):CaptureController()
                            game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))  -- M1 click
                            task.wait(0.1)
                            game:GetService("VirtualUser"):Button1Up(Vector2.new(1280, 672))

                            -- Skill example (uncomment/adapt)
                            -- game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.Z, false, game)
                            -- task.wait(0.1)
                            -- game:GetService("VirtualInputManager"):SendKeyEvent(false, Enum.KeyCode.Z, false, game)

                        until not _G.AutoFarm or monster.Humanoid.Health <= 0

                        Useskill = false
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")  -- Reset if needed
                    end
                end

                -- No monsters? Teleport to spawn
                if not attacked then
                    topos(CFrameMon)
                end
            end)
        end
    end
end)

-- Usage: Set _G.AutoFarm = true and _G.BringMonster = true to start
-- Expand CheckQuest() for full levels/worlds from original script
