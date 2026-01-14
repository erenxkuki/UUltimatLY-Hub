
repeat
    wait()
until game:IsLoaded()
repeat
    wait()
until game:GetService("Players")
repeat
    wait()
until game:GetService("Players").LocalPlayer
repeat
    wait()
until game:GetService("Players").LocalPlayer.PlayerGui
repeat
    wait()
until game:GetService("ReplicatedStorage").Effect.Container
if not game:IsLoaded() then
    local v1 = Instance.new("Message", workspace)
    v1.Text = "Wait Game Loading"
    game.Loaded:Wait()
    v1:Destroy()
    task.wait(15)
end
_G.Settings = {
    ["Main"] = {
        ["Auto Farm Level"] = false,
        ["Fast Auto Farm Level"] = false,
        ["Distance Mob Aura"] = 1000,
        ["Mob Aura"] = false,
        ["Auto New World"] = false,
        ["Auto Saber"] = false,
        ["Auto Pole"] = false,
        ["Auto Pole Hop"] = false,
        ["Auto Buy Ablility"] = false,
        ["Auto SeaBeast"] = false,
        ["Auto Third Sea"] = false,
        ["Auto Factory"] = false,
        ["Auto Factory Hop"] = false,
        ["Auto Bartilo Quest"] = false,
        ["Auto True Triple Katana"] = false,
        ["Auto Rengoku"] = false,
        ["Auto Swan Glasses"] = false,
        ["Auto Dark Coat"] = false,
        ["Auto Ectoplasm"] = false,
        ["Auto Buy Legendary Sword"] = false,
        ["Auto Buy Legendary Sword Hop"] = false,
        ["Auto Buy Enchanment Haki"] = false,
        ["Auto Holy Torch"] = false,
        ["Auto Buddy Swords"] = false,
        ["Auto Farm Boss Hallow"] = false,
        ["Auto Rainbow Haki"] = false,
        ["Auto Elite Hunter"] = false,
        ["Auto Musketeer Hat"] = false,
        ["Auto Buddy Sword"] = false,
        ["Auto Farm Bone"] = false,
        ["Farm Observation"] = false,
        ["Farm Observation Hop"] = false,
        ["Auto Ken-Haki V2"] = false,
        ["Auto Cavander"] = false,
        ["Auto Yama Sword"] = false,
        ["Auto Tushita Sword"] = false,
        ["Auto Serpent Bow"] = false,
        ["Auto Dark Dagger"] = false,
        ["Auto Cake Prince"] = false,
        ["Auto Dough V2"] = false,
        ["Auto Random Bone"] = false,
        ["Auto Fish Tail Sea 1"] = false,
        ["Auto Fish Tail Sea 3"] = false,
        ["Auto Magma Ore Sea 2"] = false,
        ["Auto Magma Ore Sea 1"] = false,
        ["Auto Mystic Droplet"] = false,
        ["Auto Dragon Scales"] = false
    },
    ["FightingStyle"] = {
        ["Auto God Human"] = false,
        ["Auto Superhuman"] = false,
        ["Auto Electric Claw"] = false,
        ["Auto Death Step"] = false,
        ["Auto Fully Death Step"] = false,
        ["Auto SharkMan Karate"] = false,
        ["Auto Fully SharkMan Karate"] = false,
        ["Auto Dragon Talon"] = false
    },
    ["Boss"] = {
        ["Auto All Boss"] = false,
        ["Auto All Boss Hop"] = false,
        ["Auto Boss Select"] = false,
        ["Select Boss"] = "",
        ["Auto Quest"] = false
    },
    ["Mastery"] = {
        ["Select Multi Sword"] = {
            ""
        },
        ["Farm Mastery SwordList"] = false,
        ["Auto Farm Fruit Mastery"] = false,
        ["Auto Farm Gun Mastery"] = false,
        ["Mob Health (%)"] = 15
    },
    ["Evo"] = {
        ["Auto Evo Race [Mink]"] = false,
        ["Auto Evo Race [FishMan]"] = false,
        ["Auto Evo Race [Human]"] = false,
        ["Auto Evo Race [Sky]"] = false
    },
    ["Configs"] = {
        ["Double Quest"] = false,
        ["Bypass TP"] = false,
        ["Select Team"] = "Pirate",
        ["Fast Attack"] = true,
        ["Fast Attack Type"] = "Normal",
        ["Select Weapon"] = {},
        ["Auto Haki"] = true,
        ["Distance Auto Farm"] = 20,
        ["Camera Shaker"] = false,
        ["Skill Z"] = true,
        ["Skill X"] = true,
        ["Skill C"] = true,
        ["Skill V"] = true,
        ["Show Hitbox"] = false,
        ["Bring Mob"] = true,
        ["Disabled Damage"] = false
    },
    ["Stat"] = {
        ["Enabled Auto Stats"] = false,
        ["Auto Stats Kaitun"] = false,
        ["Select Stats"] = {
            "Melee"
        },
        ["Point Select"] = 3,
        ["Enabled Auto Redeem Code"] = false,
        ["Select Level Redeem Code"] = 1
    },
    ["Misc"] = {
        ["No Soru Cooldown"] = false,
        ["No Dash Cooldown"] = false,
        ["Infinities Geppo"] = false,
        ["Infinities Energy"] = false,
        ["No Fog"] = false,
        ["Wall-TP"] = false,
        ["ServerTime"] = false,
        ["Fly"] = false,
        ["Fly Speed"] = 1,
        ["Auto Rejoin"] = true
    },
    ["Teleport"] = {
        ["Teleport to Sea Beast"] = false
    },
    ["Raids"] = {
        ["Auto Raids"] = false,
        ["Kill Aura"] = false,
        ["Auto Awakened"] = false,
        ["Auto Next Place"] = false,
        ["Select Raids"] = {},
        ["Select Mode Raids"] = {},
        ["Auto Start Law Dungeon"] = false,
        ["Auto Farm Law Dungeon"] = false
    },
    ["Combat"] = {
        ["Fov Size"] = 200,
        ["Show Fov"] = false,
        ["Aimbot Skill"] = false
    },
    ["HUD"] = {
        ["FPS"] = 60,
        ["LockFPS"] = false,
        ["Boost FPS Windows"] = false,
        ["White Screen"] = false
    },
    ["Devil_Fruit"] = {
        ["Auto Store Fruits"] = false,
        ["Auto Buy Random Fruits"] = false,
        ["Select Devil Fruits"] = {},
        ["Auto Buy Devil Fruits Sniper"] = false,
        ["Bring Fruit Type"] = "Bring",
        ["Bring Fruit"] = false
    },
    ["Lock"] = {
        ["Level Lock"] = 2400,
        ["Auto Lock Level"] = false,
        ["Beli Lock"] = 1000000,
        ["Auto Lock Beli"] = false
    }
}
getgenv().Load = function()
    print("Loaded!")
    if readfile and (writefile and (isfile and isfolder)) then
        if not isfolder("UUltimatLY Hub") then
            makefolder("UUltimatLY Hub")
        end
        if not isfolder("UUltimatLY Hub/Blox Fruits/") then
            makefolder("UUltimatLY Hub/Blox Fruits/")
        end
        if isfile("Zaque Hub Premium Scriptss/Blox Fruits/US_" .. game.Players.LocalPlayer.Name .. ".json") then
            local v2 = game:GetService("HttpService"):JSONDecode(readfile("UUltimatLY Hub/Blox Fruits/US_" .. game.Players.LocalPlayer.Name .. ".json"))
            local v3, v4, v5 = pairs(v2)
            while true do
                local v6
                v5, v6 = v3(v4, v5)
                if v5 == nil then
                    break
                end
                _G.Settings[v5] = v6
            end
        else
            writefile("UUltimatLY Hub/Blox Fruits/US_" .. game.Players.LocalPlayer.Name .. ".json", game:GetService("HttpService"):JSONEncode(_G.Settings))
        end
    else
        local _ = warn
    end
end
getgenv().SaveSetting = function()
    print("Save!")
    if readfile and (writefile and (isfile and isfolder)) then
        if isfile("UUltimatLY Hub/Blox Fruits/US_" .. game.Players.LocalPlayer.Name .. ".json") then
            game:GetService("HttpService"):JSONDecode(readfile("UUltimatLY Hub/Blox Fruits/US_" .. game.Players.LocalPlayer.Name .. ".json"))
            local v7, v8, v9 = pairs(_G.Settings)
            local v10 = {}
            while true do
                local v11
                v9, v11 = v7(v8, v9)
                if v9 == nil then
                    break
                end
                v10[v9] = v11
            end
            writefile("UUltimatLY Hub/Blox Fruits/US_" .. game.Players.LocalPlayer.Name .. ".json", game:GetService("HttpService"):JSONEncode(v10))
        else
            getgenv().Load()
        end
    else
        local _ = warn
    end
end
getgenv().Load()
if not game:IsLoaded() then
    local v12 = Instance.new("Message", workspace)
    v12.Text = "Wait Game Loading"
    game.Loaded:Wait()
    v12:Destroy()
    task.wait(10)
end
while true do
    wait()
    if game.Players.LocalPlayer.Team == nil and game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Visible == true then
        pcall(function()
            if _G.Settings.Configs["Select Team"] ~= "Pirate" then
                if _G.Settings.Configs["Select Team"] ~= "Marine" then
                    local v13, v14, v15 = pairs({
                        "MouseButton1Click",
                        "MouseButton1Down",
                        "Activated"
                    })
                    while true do
                        local v16
                        v15, v16 = v13(v14, v15)
                        if v15 == nil then
                            break
                        end
                        local v17, v18, v19 = pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Marines.Frame.ViewportFrame.TextButton[v16]))
                        while true do
                            local v20
                            v19, v20 = v17(v18, v19)
                            if v19 == nil then
                                break
                            end
                            v20.Function()
                        end
                    end
                else
                    local v21, v22, v23 = pairs({
                        "MouseButton1Click",
                        "MouseButton1Down",
                        "Activated"
                    })
                    while true do
                        local v24
                        v23, v24 = v21(v22, v23)
                        if v23 == nil then
                            break
                        end
                        local v25, v26, v27 = pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Marines.Frame.ViewportFrame.TextButton[v24]))
                        while true do
                            local v28
                            v27, v28 = v25(v26, v27)
                            if v27 == nil then
                                break
                            end
                            v28.Function()
                        end
                    end
                end
            else
                local v29, v30, v31 = pairs({
                    "MouseButton1Click",
                    "MouseButton1Down",
                    "Activated"
                })
                while true do
                    local v32
                    v31, v32 = v29(v30, v31)
                    if v31 == nil then
                        break
                    end
                    local v33, v34, v35 = pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.ViewportFrame.TextButton[v32]))
                    while true do
                        local v36
                        v35, v36 = v33(v34, v35)
                        if v35 == nil then
                            break
                        end
                        v36.Function()
                    end
                end
            end
        end)
    end
    if game.Players.LocalPlayer.Team ~= nil and game:IsLoaded() then
        local v37 = game.PlaceId
        if v37 == 2753915549 then
            World1 = true
        elseif v37 == 4442272183 then
            World2 = true
        elseif v37 == 7449423635 then
            World3 = true
        else
            game:Shutdown()
        end
        if not LPH_OBFUSCATED then
            function LPH_JIT_MAX(...)
                return ...
            end
            function LPH_NO_VIRTUALIZE(...)
                return ...
            end
            function LPH_NO_UPVALUES(...)
                return ...
            end
        end
        game:GetService("Players").LocalPlayer.Idled:connect(function()
            game:GetService("VirtualUser"):Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
            wait(1)
            game:GetService("VirtualUser"):Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
        end)
        function EquipWeapon(pu38)
            pcall(function()
				-- upvalues: (ref) pu38
                if game.Players.LocalPlayer.Backpack:FindFirstChild(pu38) then
                    local v39 = game.Players.LocalPlayer.Backpack:FindFirstChild(pu38)
                    game.Players.LocalPlayer.Character.Humanoid:EquipTool(v39)
                end
            end)
        end
        function EquipWeaponSword()
            pcall(function()
                local v40, v41, v42 = pairs(game.Players.LocalPlayer.Backpack:GetChildren())
                while true do
                    local v43
                    v42, v43 = v40(v41, v42)
                    if v42 == nil then
                        break
                    end
                    if v43.ToolTip == "Sword" and v43:IsA("Tool") then
                        local v44 = game.Players.LocalPlayer.Backpack:FindFirstChild(v43.Name)
                        game.Players.LocalPlayer.Character.Humanoid:EquipTool(v44)
                    end
                end
            end)
        end
        function TextureNormal()
            if not game:IsLoaded() then
                repeat
                    wait()
                until game:IsLoaded()
            end
            if hookfunction and setreadonly then
                local v45 = getrawmetatable(game)
                local v46 = v45.__newindex
                setreadonly(v45, false)
                local vu47 = nil
                vu47 = hookfunction(v46, function(p48, p49, p50)
					-- upvalues: (ref) vu47
                    if p49 == "Material" then
                        if p50 ~= Enum.Material.Neon and (p50 ~= Enum.Material.Plastic and p50 ~= Enum.Material.ForceField) then
                            p50 = Enum.Material.Plastic
                        end
                    elseif p49 == "TopSurface" then
                        p50 = "Smooth"
                    elseif p49 == "Reflectance" or (p49 == "WaterWaveSize" or (p49 == "WaterWaveSpeed" or p49 == "WaterReflectance")) then
                        p50 = 0
                    elseif p49 == "WaterTransparency" then
                        p50 = 1
                    elseif p49 == "GlobalShadows" then
                        p50 = false
                    end
                    return vu47(p48, p49, p50)
                end)
                setreadonly(v45, true)
            end
            local v51 = game
            local v52 = v51.Workspace
            local v53 = v51:GetService("Lighting")
            local v54 = v52:WaitForChild("Terrain")
            v54.WaterWaveSize = 0
            v54.WaterWaveSpeed = 0
            v54.WaterReflectance = 0
            v54.WaterTransparency = 1
            v53.GlobalShadows = false
            function change(pu55)
                pcall(function()
					-- upvalues: (ref) pu55
                    if pu55.Material ~= Enum.Material.Neon and (pu55.Material ~= Enum.Material.Plastic and pu55.Material ~= Enum.Material.ForceField) then
                        pcall(function()
							-- upvalues: (ref) pu55
                            pu55.Reflectance = 0
                        end)
                        pcall(function()
							-- upvalues: (ref) pu55
                            pu55.Material = Enum.Material.Plastic
                        end)
                        pcall(function()
							-- upvalues: (ref) pu55
                            pu55.TopSurface = "Smooth"
                        end)
                    end
                end)
            end
            game.DescendantAdded:Connect(function(pu56)
                pcall(function()
					-- upvalues: (ref) pu56
                    if pu56:IsA("Part") then
                        change(pu56)
                    elseif pu56:IsA("MeshPart") then
                        change(pu56)
                    elseif pu56:IsA("TrussPart") then
                        change(pu56)
                    elseif pu56:IsA("UnionOperation") then
                        change(pu56)
                    elseif pu56:IsA("CornerWedgePart") then
                        change(pu56)
                    elseif pu56:IsA("WedgePart") then
                        change(pu56)
                    end
                end)
            end)
            local v57, v58, v59 = pairs(game:GetDescendants())
            while true do
                local vu60
                v59, vu60 = v57(v58, v59)
                if v59 == nil then
                    break
                end
                pcall(function()
					-- upvalues: (ref) vu60
                    if vu60:IsA("Part") then
                        change(vu60)
                    elseif vu60:IsA("MeshPart") then
                        change(vu60)
                    elseif vu60:IsA("TrussPart") then
                        change(vu60)
                    elseif vu60:IsA("UnionOperation") then
                        change(vu60)
                    elseif vu60:IsA("CornerWedgePart") then
                        change(vu60)
                    elseif vu60:IsA("WedgePart") then
                        change(vu60)
                    end
                end)
            end
        end
        function WaterRemvoe()
            local v61, v62, v63 = pairs(workspace:GetDescendants())
            while true do
                local v64
                v63, v64 = v61(v62, v63)
                if v63 == nil then
                    break
                end
                if string.find(v64.Name, "Water") then
                    v64:Destroy()
                end
            end
        end
        function ObjectRemvoe()
            local v65, v66, v67 = pairs(workspace:GetDescendants())
            while true do
                local v68
                v67, v68 = v65(v66, v67)
                if v67 == nil then
                    break
                end
                if string.find(v68.Name, "Tree") or string.find(v68.Name, "House") then
                    v68:Destroy()
                end
            end
        end
        function InvisibleObject()
            local v69, v70, v71 = pairs(game:GetService("Workspace"):GetDescendants())
            while true do
                local v72
                v71, v72 = v69(v70, v71)
                if v71 == nil then
                    break
                end
                if (v72:IsA("Part") or (v72:IsA("MeshPart") or v72:IsA("BasePart"))) and v72.Transparency then
                    v72.Transparency = 1
                end
            end
        end
        function isnil(p73)
            return p73 == nil
        end
        local function vu75(p74)
            return math.floor(tonumber(p74) + 0.5)
        end
        Number = math.random(1, 1000000)
        function PlrESP()
			-- upvalues: (ref) vu75
            if ESPPlayer then
                local v76, v77, v78 = pairs(game:GetService("Players"):GetPlayers())
                while true do
                    local v79
                    v78, v79 = v76(v77, v78)
                    if v78 == nil then
                        break
                    end
                    if not isnil(v79.Character) then
                        if v79.Character.Head:FindFirstChild("NameEsp" .. v79.Name) then
                            v79.Character.Head["NameEsp" .. v79.Name].ESP.Text = v79.Name .. " " .. vu75((game:GetService("Players").LocalPlayer.Character.Head.Position - v79.Character.Head.Position).Magnitude / 3) .. " M"
                            v79.Character.Head["NameEsp" .. v79.Name].ESP.HealthESP.Text = "Health " .. math.floor(v79.Character.Humanoid.Health) .. "/" .. math.floor(v79.Character.Humanoid.MaxHealth)
                            v79.Character.Head:FindFirstChild("NameEsp" .. v79.Name).ESP.TextTransparency = 0
                            v79.Character.Head:FindFirstChild("NameEsp" .. v79.Name).ESP.HealthESP.TextTransparency = 0
                        else
                            local v80 = Instance.new("BillboardGui")
                            local v81 = Instance.new("TextLabel")
                            local v82 = Instance.new("TextLabel")
                            v80.Parent = v79.Character.Head
                            v80.Name = "NameEsp" .. v79.Name
                            v80.ExtentsOffset = Vector3.new(0, 1, 0)
                            v80.Size = UDim2.new(1, 200, 1, 30)
                            v80.Adornee = v79.Character.Head
                            v80.AlwaysOnTop = true
                            v81.Name = "ESP"
                            v81.Parent = v80
                            v81.TextTransparency = 0
                            v81.BackgroundTransparency = 1
                            v81.Size = UDim2.new(0, 200, 0, 30)
                            v81.Position = UDim2.new(0, 25, 0, 0)
                            v81.Font = Enum.Font.Gotham
                            v81.Text = v79.Name .. " " .. "[ " .. vu75((game:GetService("Players").LocalPlayer.Character.Head.Position - v79.Character.Head.Position).Magnitude / 3) .. " M ]"
                            if v79.Team ~= game:GetService("Players").LocalPlayer.Team then
                                v81.TextColor3 = Color3.new(255, 0, 0)
                            else
                                v81.TextColor3 = Color3.new(0, 255, 255)
                            end
                            v81.TextSize = 14
                            v81.TextStrokeTransparency = 0.5
                            v81.TextWrapped = true
                            v82.Name = "HealthESP"
                            v82.Parent = v81
                            v82.TextTransparency = 0
                            v82.BackgroundTransparency = 1
                            v82.Position = v81.Position + UDim2.new(0, - 25, 0, 15)
                            v82.Size = UDim2.new(0, 200, 0, 30)
                            v82.Font = Enum.Font.Gotham
                            v82.TextColor3 = Color3.fromRGB(255, 0, 0)
                            v82.TextSize = 14
                            v82.TextStrokeTransparency = 0.5
                            v82.TextWrapped = true
                            v82.Text = "Health " .. math.floor(v79.Character.Humanoid.Health) .. "/" .. math.floor(v79.Character.Humanoid.MaxHealth)
                        end
                    end
                end
            else
                local v83, v84, v85 = pairs(game:GetService("Players"):GetPlayers())
                while true do
                    local v86
                    v85, v86 = v83(v84, v85)
                    if v85 == nil then
                        break
                    end
                    if v86.Character.Head:FindFirstChild("NameEsp" .. v86.Name) then
                        v86.Character.Head:FindFirstChild("NameEsp" .. v86.Name).ESP.TextTransparency = 1
                        v86.Character.Head:FindFirstChild("NameEsp" .. v86.Name).ESP.HealthESP.TextTransparency = 1
                    end
                end
            end
        end
        function IslandESP()
			-- upvalues: (ref) vu75
            local v87, v88, v89 = pairs(game:GetService("Workspace")._WorldOrigin.Locations:GetChildren())
            while true do
                local vu90
                v89, vu90 = v87(v88, v89)
                if v89 == nil then
                    break
                end
                pcall(function()
					-- upvalues: (ref) vu90, (ref) vu75
                    if _G.IslandEsp then
                        if vu90.Name ~= "Sea" then
                            if vu90:FindFirstChild("NameEsp") then
                                vu90.NameEsp.TextLabel.Text = vu90.Name .. "   \n" .. vu75((game:GetService("Players").LocalPlayer.Character.Head.Position - vu90.Position).Magnitude / 3) .. " M"
                            else
                                local v91 = Instance.new("BillboardGui", vu90)
                                v91.Name = "NameEsp"
                                v91.ExtentsOffset = Vector3.new(0, 1, 0)
                                v91.Size = UDim2.new(1, 200, 1, 30)
                                v91.Adornee = vu90
                                v91.AlwaysOnTop = true
                                local v92 = Instance.new("TextLabel", v91)
                                v92.Font = "GothamBold"
                                v92.FontSize = "Size14"
                                v92.TextWrapped = true
                                v92.Size = UDim2.new(1, 0, 1, 0)
                                v92.TextYAlignment = "Top"
                                v92.BackgroundTransparency = 1
                                v92.TextStrokeTransparency = 0.5
                                v92.TextColor3 = Color3.fromRGB(80, 245, 245)
                            end
                        end
                    elseif vu90:FindFirstChild("NameEsp") then
                        vu90:FindFirstChild("NameEsp"):Destroy()
                    end
                end)
            end
        end
        function ChestSESP()
			-- upvalues: (ref) vu75
            local v93, v94, v95 = pairs(game:GetService("Workspace"):GetChildren())
            while true do
                local vu96
                v95, vu96 = v93(v94, v95)
                if v95 == nil then
                    break
                end
                pcall(function()
					-- upvalues: (ref) vu96, (ref) vu75
                    if string.find(vu96.Name, "Chest") then
                        if _G.ChestEsp then
                            if string.find(vu96.Name, "Chest") then
                                if vu96:FindFirstChild("NameEsp") then
                                    vu96["NameEsp" .. Number].TextLabel.Text = vu96.Name .. "   \n" .. vu75((game:GetService("Players").LocalPlayer.Character.Head.Position - vu96.Position).Magnitude / 3) .. " M"
                                else
                                    local v97 = Instance.new("BillboardGui", vu96)
                                    v97.Name = "NameEsp"
                                    v97.ExtentsOffset = Vector3.new(0, 1, 0)
                                    v97.Size = UDim2.new(1, 200, 1, 30)
                                    v97.Adornee = vu96
                                    v97.AlwaysOnTop = true
                                    local v98 = Instance.new("TextLabel", v97)
                                    v98.Font = "GothamBold"
                                    v98.FontSize = "Size14"
                                    v98.TextWrapped = true
                                    v98.Size = UDim2.new(1, 0, 1, 0)
                                    v98.TextYAlignment = "Top"
                                    v98.BackgroundTransparency = 1
                                    v98.TextStrokeTransparency = 0.5
                                    v98.TextColor3 = Color3.fromRGB(0, 255, 250)
                                    if vu96.Name == "Chest1" then
                                        v98.Text = "Chest 1" .. " \n" .. vu75((game:GetService("Players").LocalPlayer.Character.Head.Position - vu96.Position).Magnitude / 3) .. " M"
                                    end
                                    if vu96.Name == "Chest2" then
                                        v98.Text = "Chest 2" .. " \n" .. vu75((game:GetService("Players").LocalPlayer.Character.Head.Position - vu96.Position).Magnitude / 3) .. " M"
                                    end
                                    if vu96.Name == "Chest3" then
                                        v98.Text = "Chest 3" .. " \n" .. vu75((game:GetService("Players").LocalPlayer.Character.Head.Position - vu96.Position).Magnitude / 3) .. " M"
                                    end
                                end
                            end
                        elseif vu96:FindFirstChild("NameEsp") and not _G.ChestEsp then
                            vu96:FindFirstChild("NameEsp"):Destroy()
                        end
                    end
                end)
            end
        end
        function UpdateBfEsp()
			-- upvalues: (ref) vu75
            local v99, v100, v101 = pairs(game:GetService("Workspace"):GetChildren())
            while true do
                local vu102
                v101, vu102 = v99(v100, v101)
                if v101 == nil then
                    break
                end
                pcall(function()
					-- upvalues: (ref) vu102, (ref) vu75
                    if _G.DFEsp then
                        if string.find(vu102.Name, "Fruit") then
                            if vu102.Handle:FindFirstChild("NameEsp") then
                                vu102.Handle["NameEsp" .. Number].TextLabel.Text = vu102.Name .. "   \n" .. vu75((game:GetService("Players").LocalPlayer.Character.Head.Position - vu102.Handle.Position).Magnitude / 3) .. " M"
                            else
                                local v103 = Instance.new("BillboardGui", vu102.Handle)
                                v103.Name = "NameEsp"
                                v103.ExtentsOffset = Vector3.new(0, 1, 0)
                                v103.Size = UDim2.new(1, 200, 1, 30)
                                v103.Adornee = vu102.Handle
                                v103.AlwaysOnTop = true
                                local v104 = Instance.new("TextLabel", v103)
                                v104.Font = "GothamBold"
                                v104.FontSize = "Size14"
                                v104.TextWrapped = true
                                v104.Size = UDim2.new(1, 0, 1, 0)
                                v104.TextYAlignment = "Top"
                                v104.BackgroundTransparency = 1
                                v104.TextStrokeTransparency = 0.5
                                v104.TextColor3 = Color3.fromRGB(255, 0, 0)
                                v104.Text = vu102.Name .. " \n" .. vu75((game:GetService("Players").LocalPlayer.Character.Head.Position - vu102.Handle.Position).Magnitude / 3) .. " M"
                            end
                        end
                    elseif vu102.Handle:FindFirstChild("NameEsp") and not _G.DFEsp then
                        vu102.Handle:FindFirstChild("NameEsp"):Destroy()
                    end
                    if vu102.Handle:FindFirstChild("NameEsp") and not _G.DFEsp then
                        vu102.Handle:FindFirstChild("NameEsp"):Destroy()
                    end
                end)
            end
        end
        function FlowerESP()
			-- upvalues: (ref) vu75
            local v105, v106, v107 = pairs(game:GetService("Workspace"):GetChildren())
            while true do
                local vu108
                v107, vu108 = v105(v106, v107)
                if v107 == nil then
                    break
                end
                pcall(function()
					-- upvalues: (ref) vu108, (ref) vu75
                    if vu108.Name == "Flower2" or vu108.Name == "Flower1" then
                        if _G.FlowerEsp then
                            if vu108:FindFirstChild("NameEsp") then
                                vu108["NameEsp" .. Number].TextLabel.Text = vu108.Name .. "   \n" .. vu75((game:GetService("Players").LocalPlayer.Character.Head.Position - vu108.Position).Magnitude / 3) .. " M"
                            else
                                local v109 = Instance.new("BillboardGui", vu108)
                                v109.Name = "NameEsp"
                                v109.ExtentsOffset = Vector3.new(0, 1, 0)
                                v109.Size = UDim2.new(1, 200, 1, 30)
                                v109.Adornee = vu108
                                v109.AlwaysOnTop = true
                                local v110 = Instance.new("TextLabel", v109)
                                v110.Font = "GothamBold"
                                v110.FontSize = "Size14"
                                v110.TextWrapped = true
                                v110.Size = UDim2.new(1, 0, 1, 0)
                                v110.TextYAlignment = "Top"
                                v110.BackgroundTransparency = 1
                                v110.TextStrokeTransparency = 0.5
                                v110.TextColor3 = Color3.fromRGB(255, 0, 0)
                                if vu108.Name == "Flower1" then
                                    v110.Text = "Blue Flower" .. " \n" .. vu75((game:GetService("Players").LocalPlayer.Character.Head.Position - vu108.Position).Magnitude / 3) .. " M"
                                    v110.TextColor3 = Color3.fromRGB(0, 0, 255)
                                end
                                if vu108.Name == "Flower2" then
                                    v110.Text = "Red Flower" .. " \n" .. vu75((game:GetService("Players").LocalPlayer.Character.Head.Position - vu108.Position).Magnitude / 3) .. " M"
                                    v110.TextColor3 = Color3.fromRGB(255, 0, 0)
                                end
                            end
                        elseif vu108:FindFirstChild("NameEsp") then
                            vu108:FindFirstChild("NameEsp"):Destroy()
                        end
                    end
                    if vu108:FindFirstChild("NameEsp") and not _G.FlowerEsp then
                        vu108:FindFirstChild("NameEsp"):Destroy()
                    end
                end)
            end
        end
        LPH_JIT_MAX(function()
            task.spawn(function()
                game:GetService("RunService").Stepped:Connect(function()
                    pcall(function()
                        if _G.Settings.Main["Auto Farm Level"] or (_G.Settings.Main["Auto New World"] or (_G.Settings.Main["Auto Saber"] or (_G.Settings.Main["Auto Pole"] or (_G.Settings.Main["Auto Third Sea"] or (_G.Settings.Main["Auto Bartilo Quest"] or (_G.Settings.Main["Auto Dark Coat"] or (_G.Settings.Main["Auto Swan Glasses"] or (_G.Settings.Main["Auto True Triple Katana"] or (_G.Settings.Main["Auto Rengoku"] or (_G.Settings.Main["Auto Ectoplasm"] or (_G.Settings.FightingStyle["Auto Fully Death Step"] or (_G.Settings.FightingStyle["Auto Fully SharkMan Karate"] or (_G.Settings.Raids["Auto Farm Law Dungeon"] or (_G.Settings.Main["Auto Rainbow Haki"] or (_G.Settings.Main["Auto Elite Hunter"] or (_G.Settings.Main["Auto Musketeer Hat"] or (_G.Settings.Main["Auto Buddy Sword"] or (_G.Settings.Main["Auto Farm Bone"] or (_G.Settings.Main["Auto Ken-Haki V2"] or (_G.Settings.FightingStyle["Auto God Human"] or (_G.Settings.Main["Auto Cavander"] or (_G.Settings.Main["Auto Cursed Dual Katana"] or (_G.Settings.Main["Auto Yama Sword"] or (_G.Settings.Main["Auto Tushita Sword"] or (_G.Settings.Main["Auto Serpent Bow"] or (_G.Settings.Main["Auto Dark Dagger"] or (_G.Settings.Main["Auto Cake Prince"] or (_G.Settings.Main["Auto Dough V2"] or (_G.Settings.Main["Auto Holy Torch"] or (_G.Settings.Main["Auto Buddy Swords"] or (_G.Settings.Main["Auto Farm Boss Hallow"] or (_G.Settings.Main["Mob Aura"] or (_G.Settings.Main["Auto Quest Soul Guitar"] or (_G.Settings.Main["Auto Quest Soul Guitar Hop"] or (YamaQuest2 or (YamaQuest1 or (Auto_Cursed_Dual_Katana or (Tushita_Quest2 or (Tushita_Quest1 or (AutoFarmMaterial or (teleporttop or (AutoFarmChest or (_G.Settings.Boss["Auto All Boss"] or (_G.Settings.Boss["Auto Boss Select"] or (_G.Settings.Mastery["Auto Farm Fruit Mastery"] or (_G.Settings.Mastery["Auto Farm Gun Mastery"] or (_G.Settings.Mastery["Farm Mastery SwordList"] or (_G.Settings.Teleport["Teleport to Sea Beast"] or (_G.Settings.Main["Auto SeaBeast"] or (_G.Settings.Raids["Auto Raids"] or (_G.Settings.Raids["Auto Next Place"] or (_G.Teleport or (_G.MysticIsland or (_G.BringFound or (_G.Settings.Evo["Auto Evo Race [Mink]"] or (_G.Settings.Evo["Auto Evo Race [FishMan]"] or (_G.Settings.Evo["Auto Evo Race [Human]"] or _G.Settings.Evo["Auto Evo Race [Sky]"]))))))))))))))))))))))))))))))))))))))))))))))))))))))))) then
                            if syn then
                                setfflag("HumanoidParallelRemoveNoPhysics", "False")
                                setfflag("HumanoidParallelRemoveNoPhysicsNoSimulate2", "False")
                                game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
                                if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit == true then
                                    game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit = false
                                end
                            else
                                if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and not game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyVelocity1") then
                                    if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit == true then
                                        game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit = false
                                    end
                                    local v111 = Instance.new("BodyVelocity")
                                    v111.Name = "BodyVelocity1"
                                    v111.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
                                    v111.MaxForce = Vector3.new(10000, 10000, 10000)
                                    v111.Velocity = Vector3.new(0, 0, 0)
                                end
                                local v112, v113, v114 = pairs(game.Players.LocalPlayer.Character:GetDescendants())
                                while true do
                                    local v115
                                    v114, v115 = v112(v113, v114)
                                    if v114 == nil then
                                        break
                                    end
                                    if v115:IsA("BasePart") then
                                        v115.CanCollide = false
                                    end
                                end
                            end
                        elseif game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyVelocity1") then
                            game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyVelocity1"):Destroy()
                        end
                    end)
                end)
            end)
        end)()
        LPH_NO_VIRTUALIZE(function()
            task.spawn(function()
                while true do
                    wait()
                    if setscriptable then
                        setscriptable(game.Players.LocalPlayer, "SimulationRadius", true)
                    end
                    if sethiddenproperty then
                        sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                    end
                end
            end)
        end)()
        LPH_JIT_MAX(function()
            task.spawn(function()
                while task.wait() do
                    pcall(function()
                        if StartMagnet then
                            local v116, v117, v118 = pairs(game.Workspace.Enemies:GetChildren())
                            while true do
                                local v119
                                v118, v119 = v116(v117, v118)
                                if v118 == nil then
                                    break
                                end
                                if not string.find(v119.Name, "Boss") and ((v119.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 500 and InMyNetWork(v119.HumanoidRootPart)) then
                                    v119.HumanoidRootPart.CFrame = PosMon
                                    v119.Humanoid.JumpPower = 0
                                    v119.Humanoid.WalkSpeed = 0
                                    v119.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                    v119.HumanoidRootPart.Transparency = 1
                                    v119.HumanoidRootPart.CanCollide = false
                                    v119.Head.CanCollide = false
                                    if v119.Humanoid:FindFirstChild("Animator") then
                                        v119.Humanoid.Animator:Destroy()
                                    end
                                    v119.Humanoid:ChangeState(11)
                                    v119.Humanoid:ChangeState(14)
                                end
                            end
                        end
                    end)
                end
            end)
        end)()
        LPH_NO_VIRTUALIZE(function()
            spawn(function()
                if game.Players.LocalPlayer.Character:FindFirstChild("Stun") then
                    game.Players.LocalPlayer.Character.Stun.Changed:connect(function()
                        pcall(function()
                            if game.Players.LocalPlayer.Character:FindFirstChild("Stun") then
                                game.Players.LocalPlayer.Character.Stun.Value = 0
                            end
                        end)
                    end)
                end
            end)
        end)()
        local v120 = require(game:GetService("Players").LocalPlayer.PlayerScripts:WaitForChild("CombatFramework"))
        local _ = getupvalues(v120)[2]
        local v121 = require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework.RigController)
        local _ = getupvalues(v121)[2]
        require(game.ReplicatedStorage.CombatFramework.RigLib)
        tick()
        function DisabledDamage()
            task.spawn(function()
                while wait() do
                    pcall(function()
                        if _G.Settings.Configs["Disabled Damage"] then
                            game:GetService("ReplicatedStorage").Assets.GUI.DamageCounter.Enabled = false
                        else
                            game:GetService("ReplicatedStorage").Assets.GUI.DamageCounter.Enabled = true
                        end
                    end)
                end
            end)
        end
        local v122 = game
        local v123 = v122.Workspace
        local _ = v122.Lighting
        local _ = v123.Terrain
        local v124, v125, v126 = pairs(v122:GetDescendants())
        while true do
            local v127, v128 = v124(v125, v126)
            if v127 == nil then
                break
            end
            v126 = v127
            if v128:IsA("ParticleEmitter") or v128:IsA("Trail") then
                v128.Lifetime = NumberRange.new(0)
            elseif v128:IsA("Explosion") then
                v128.BlastPressure = 1
                v128.BlastRadius = 1
            end
        end
        LPH_JIT_MAX(function()
            function CameraShaker()
                spawn(function()
                    local vu129 = require(game.Players.LocalPlayer.PlayerScripts.CombatFramework.CameraShaker)
                    while wait() do
                        pcall(function()
							-- upvalues: (ref) vu129
                            if _G.Settings.Configs["Camera Shaker"] then
                                vu129.CameraShakeInstance.CameraShakeState.Inactive = 0
                            else
                                vu129.CameraShakeInstance.CameraShakeState.Inactive = 3
                            end
                        end)
                    end
                end)
            end
        end)()
        local vu130 = game.Players.LocalPlayer
        local vu131 = debug.getupvalues(require(game.Players.LocalPlayer.PlayerScripts.CombatFramework))
        local vu132 = vu131[2]
        task.spawn(function()
            local v133 = require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework)
            local vu134 = getupvalues(v133)[2]
            require(game.ReplicatedStorage.Util.CameraShaker)
            function maxincrement()
				-- upvalues: (ref) vu134
                return # vu134.activeController.anims.basic
            end
            spawn(function()
                local vu135 = nil
                local _ = hookmetamethod(game, "__namecall", function(p136, ...)
					-- upvalues: (ref) vu135
                    local v137 = {
                        ...
                    }
                    if getnamecallmethod():lower() ~= "fireserver" or v137[1] ~= "hit" then
                        return vu135(p136, ...)
                    end
                    v137[3] = maxincrement()
                    return vu135(p136, unpack(v137))
                end)
            end)
        end)
        function GetCurrentBlade()
			-- upvalues: (ref) vu132
            local v138 = vu132.activeController.blades[1]
            if v138 then
                while v138.Parent ~= game.Players.LocalPlayer.Character do
                    v138 = v138.Parent
                end
                return v138
            end
        end
        function AttackNoCD(p139)
			-- upvalues: (ref) vu132, (ref) vu130, (ref) vu131
            if p139 == 1 then
                local vu140 = vu132.activeController
                for _ = 1, 1 do
                    tick()
                    local v141 = require(game.ReplicatedStorage.CombatFramework.RigLib).getBladeHits(vu130.Character, {
                        vu130.Character.HumanoidRootPart
                    }, 60)
                    local v142, v143, v144 = pairs(v141)
                    local v145 = {}
                    local vu146 = {}
                    while true do
                        local v147, v148 = v142(v143, v144)
                        if v147 == nil then
                            break
                        end
                        v144 = v147
                        if v148.Parent:FindFirstChild("HumanoidRootPart") and not v145[v148.Parent] then
                            table.insert(vu146, v148.Parent.HumanoidRootPart)
                            v145[v148.Parent] = true
                        end
                    end
                    if # vu146 > 0 then
                        local vu149 = debug.getupvalue(vu140.attack, 5)
                        local vu150 = debug.getupvalue(vu140.attack, 6)
                        local vu151 = debug.getupvalue(vu140.attack, 4)
                        local v152 = debug.getupvalue(vu140.attack, 7)
                        local vu153 = (vu149 * 798405 + vu151 * 727595) % vu150
                        local vu154 = vu151 * 798405;
                        (function()
							-- upvalues: (ref) vu153, (ref) vu150, (ref) vu154, (ref) vu149, (ref) vu151
                            vu153 = (vu153 * vu150 + vu154) % 1099511627776
                            vu149 = math.floor(vu153 / vu150)
                            vu151 = vu153 - vu149 * vu150
                        end)()
                        local vu155 = v152 + 1
                        debug.setupvalue(vu140.attack, 5, vu149)
                        debug.setupvalue(vu140.attack, 6, vu150)
                        debug.setupvalue(vu140.attack, 4, vu151)
                        debug.setupvalue(vu140.attack, 7, vu155)
                        pcall(function()
							-- upvalues: (ref) vu130, (ref) vu140, (ref) vu153, (ref) vu155, (ref) vu146
                            if vu130.Character:FindFirstChildOfClass("Tool") and (vu140.blades and vu140.blades[1]) then
                                vu140.animator.anims.basic[1]:Play(0.01, 0.01, 0.01)
                                game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("weaponChange", tostring(GetCurrentBlade()))
                                game.ReplicatedStorage.Remotes.Validator:FireServer(math.floor(vu153 / 1099511627776 * 16777215), vu155)
                                game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("hit", vu146, 2, "")
                            end
                        end)
                    end
                end
            elseif p139 == 0 then
                local vu156 = vu132.activeController
                for _ = 1, 1 do
                    tick()
                    local v157 = require(game.ReplicatedStorage.CombatFramework.RigLib).getBladeHits(vu130.Character, {
                        vu130.Character.HumanoidRootPart
                    }, 60)
                    local v158, v159, v160 = pairs(v157)
                    local v161 = {}
                    local v162 = {}
                    while true do
                        local v163, v164 = v158(v159, v160)
                        if v163 == nil then
                            break
                        end
                        v160 = v163
                        if v164.Parent:FindFirstChild("HumanoidRootPart") and not v161[v164.Parent] then
                            table.insert(v162, v164.Parent.HumanoidRootPart)
                            v161[v164.Parent] = true
                        end
                    end
                    if # v162 > 0 then
                        if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 150 then
                            game:service("VirtualInputManager"):SendKeyEvent(true, "V", false, game)
                            game:service("VirtualInputManager"):SendKeyEvent(false, "V", false, game)
                        end
                        pcall(function()
							-- upvalues: (ref) vu130, (ref) vu156, (ref) vu131, (ref) vu132
                            if vu130.Character:FindFirstChildOfClass("Tool") and (vu156.blades and vu156.blades[1]) then
                                local v165, v166, vu167 = pairs(vu131)
                                while true do
                                    local vu168
                                    vu167, vu168 = v165(v166, vu167)
                                    if vu167 == nil then
                                        break
                                    end
                                    pcall(function()
										-- upvalues: (ref) vu167, (ref) vu132, (ref) vu168
                                        if vu167 == 2 then
                                            local v169 = vu132.activeController
                                            require(game.ReplicatedStorage.Util.CameraShaker):Stop()
                                            vu168.activeController.attacking = false
                                            vu168.activeController.blocking = false
                                            vu168.activeController.focusStart = 1655503339.0980349
                                            vu168.activeController.increment = 4
                                            vu168.activeController.hitboxMagnitude = 55
                                            vu168.activeController.timeToNextBlock = tick()
                                            vu168.activeController.timeToNextAttack = tick()
                                            game:GetService("VirtualUser"):CaptureController()
                                            game:GetService("VirtualUser"):ClickButton1(Vector2.new(1300, 760), game:GetService("Workspace").Camera.CFrame)
                                            v169.animator.anims.basic[1]:Play(0.01, 0.01, 0.01)
                                        end
                                    end)
                                end
                            end
                        end)
                    end
                end
            end
        end
        local vu170 = require(game.Players.LocalPlayer.PlayerScripts.CombatFramework.Particle)
        local vu171 = require(game:GetService("ReplicatedStorage").CombatFramework.RigLib)
        if not shared.orl then
            shared.orl = vu171.wrapAttackAnimationAsync
        end
        if not shared.cpc then
            shared.cpc = vu170.play
        end
        spawn(function()
			-- upvalues: (ref) vu171, (ref) vu170
            game:GetService("RunService").Stepped:Connect(function()
				-- upvalues: (ref) vu171, (ref) vu170
                function vu171.wrapAttackAnimationAsync(p172, p173, p174, p175, p176)
					-- upvalues: (ref) vu171, (ref) vu170
                    local v177 = vu171.getBladeHits(p173, p174, p175)
                    if v177 then
                        function vu170.play()
                        end
                        p172:Play(0.01, 0.01, 0.01)
                        p176(v177)
                        vu170.play = shared.cpc
                        wait(p172.length * 0.5)
                        p172:Stop()
                    end
                end
            end)
        end)
        function InMyNetWork(p178)
            if isnetworkowner then
                return isnetworkowner(p178)
            else
                return (p178.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 200
            end
        end
        local function vu180(p179)
            return game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(p179) or game:GetService("Players").LocalPlayer.Character:FindFirstChild(p179)
        end
        function Com(p181, ...)
            local v182 = game:GetService("ReplicatedStorage").Remotes:FindFirstChild("Comm" .. p181)
            if v182:IsA("RemoteEvent") then
                v182:FireServer(...)
            elseif v182:IsA("RemoteFunction") then
                v182:InvokeServer(...)
            end
        end
        function BTP(p183)
            game.Players.LocalPlayer.Character.Head:Destroy()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = p183
            wait(1)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = p183
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
        end
        local function vu192(...)
            local v184 = {
                ...
            }
            local v185 = v184[1]
            local vu186 = nil
            if type(v185) ~= "vector" then
                if type(v185) ~= "userdata" then
                    if type(v185) == "number" then
                        vu186 = CFrame.new(unpack(v184))
                    end
                else
                    vu186 = v185
                end
            else
                vu186 = CFrame.new(v185)
            end
            if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Health == 0 then
                if tween then
                    tween:Cancel()
                end
                repeat
                    wait()
                until game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Health > 0
                wait(0.2)
            end
            local v187 = {}
            local v188 = (vu186.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).Magnitude
            if v188 < 1000 then
                Speed = 315
            elseif v188 >= 1000 then
                Speed = 300
            end
            if _G.Settings.Configs["Bypass TP"] and (3000 < v188 and not (AutoFarmMaterial or (_G.Settings.Raids["Auto Next Place"] or (_G.Settings.Raids["Auto Raids"] or (_G.Settings.FightingStyle["Auto God Human"] or _G.Settings.Raids["Auto Raids"]))))) and (not game.Players.LocalPlayer.Backpack:FindFirstChild("Special Microchip") and (not game.Players.LocalPlayer.Character:FindFirstChild("Special Microchip") and (not game.Players.LocalPlayer.Backpack:FindFirstChild("God\'s Chalice") and (not game.Players.LocalPlayer.Character:FindFirstChild("God\'s Chalice") and (not game.Players.LocalPlayer.Backpack:FindFirstChild("Hallow Essence") and (not game.Players.LocalPlayer.Character:FindFirstChild("Hallow Essence") and (not game.Players.LocalPlayer.Character:FindFirstChild("Sweet Chalice") and (not game.Players.LocalPlayer.Backpack:FindFirstChild("Sweet Chalice") and (Name ~= "Fishman Commando [Lv. 400]" and (Name ~= "Fishman Warrior [Lv. 375]" and Name ~= "Cake Prince [Lv. 2300] [Raid Boss]")))))))))) then
                pcall(function()
					-- upvalues: (ref) vu186
                    fkwarp = false
                    tween:Cancel()
                    if game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid").Health > 0 then
                        if fkwarp == false then
                            wait()
                            tween:Cancel()
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = vu186
                            wait()
                            game.Players.LocalPlayer.Character.Head:Destroy()
                            game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
                        end
                        fkwarp = true
                    end
                    wait()
                    if game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid").Health > 0 then
                        game.Players.LocalPlayer.Character.Humanoid:ChangeState(14)
                        wait()
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
                    end
                    wait()
                end)
            end
            local vu189 = game:service("TweenService")
            local vu190 = TweenInfo.new((vu186.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).Magnitude / Speed, Enum.EasingStyle.Linear)
            local _, _ = pcall(function()
				-- upvalues: (ref) vu189, (ref) vu190, (ref) vu186
                local v191 = {
                    ["CFrame"] = vu186
                }
                tween = vu189:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, vu190, v191)
                tween:Play()
            end)
            function v187.Stop(_)
                tween:Cancel()
            end
            function v187.Wait(_)
                tween.Completed:Wait()
            end
            return v187
        end
        function toTargetP(pu193)
            if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Health > 0 and game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid") then
                if (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - pu193.Position).Magnitude <= 150 then
                    pcall(function()
						-- upvalues: (ref) pu193
                        tween:Cancel()
                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = pu193
                    end)
                end
                local v194 = game:service("TweenService")
                local v195 = TweenInfo.new((game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - pu193.Position).Magnitude / 325, Enum.EasingStyle.Linear)
                tween = v194:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, v195, {
                    ["CFrame"] = pu193
                })
                tween:Play()
                return {
                    ["Stop"] = function(_)
                        tween:Cancel()
                    end
                }
            end
            tween:Cancel()
            repeat
                wait()
            until game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid") and game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid").Health > 0
            wait(7)
        end
        LPH_NO_VIRTUALIZE(function()
            function InfinitiesEnergy()
                game:GetService("Players").LocalPlayer.Character.Energy.Changed:connect(function()
                    if _G.Settings.Misc["Infinities Energy"] then
                        game:GetService("Players").LocalPlayer.Character.Energy.Value = game:GetService("Players").LocalPlayer.Character.Energy.MaxValue
                    end
                end)
            end
        end)()
        function NoCooldown()
            local v196 = next
            local v197, v198 = getgc()
            while true do
                local vu199
                v198, vu199 = v196(v197, v198)
                if v198 == nil then
                    break
                end
                if typeof(vu199) == "function" then
                    if getfenv(vu199).script == game.Players.LocalPlayer.Character:WaitForChild("Dodge") and _G.Settings.Misc["No Dash Cooldown"] then
                        local v200 = next
                        local v201, v202 = debug.getupvalues(vu199)
                        while true do
                            local vu203, v204 = v200(v201, v202)
                            if vu203 == nil then
                                break
                            end
                            v202 = vu203
                            if tostring(v204) == "0.4" then
                                spawn(function()
									-- upvalues: (ref) vu199, (ref) vu203
                                    repeat
                                        wait(0.1)
                                        debug.setupvalue(vu199, vu203, 0)
                                    until not _G.Settings.Misc["No Dash Cooldown"]
                                end)
                            end
                        end
                    end
                    if getfenv(vu199).script == game.Players.LocalPlayer.Character:WaitForChild("Geppo") and _G.Settings.Misc["Infinities Geppo"] then
                        local v205 = next
                        local v206, v207 = debug.getupvalues(vu199)
                        while true do
                            local vu208, v209 = v205(v206, v207)
                            if vu208 == nil then
                                break
                            end
                            v207 = vu208
                            if tostring(v209) == "0" then
                                spawn(function()
									-- upvalues: (ref) vu199, (ref) vu208
                                    repeat
                                        wait(0.1)
                                        debug.setupvalue(vu199, vu208, 0)
                                    until not _G.Settings.Misc["Infinities Geppo"]
                                end)
                            end
                        end
                    end
                    if getfenv(vu199).script == game.Players.LocalPlayer.Character:WaitForChild("Soru") and _G.Settings.Misc["No Soru Cooldown"] then
                        local v210, v211, v212 = pairs(debug.getupvalues(vu199))
                        while true do
                            local vu213, v214 = v210(v211, v212)
                            if vu213 == nil then
                                break
                            end
                            v212 = vu213
                            if type(v214) == "table" and v214.LastUse then
                                spawn(function()
									-- upvalues: (ref) vu199, (ref) vu213
                                    repeat
                                        wait()
                                        debug.setupvalue(vu199, vu213, {
                                            ["LastAfter"] = 0,
                                            ["LastUse"] = 0
                                        })
                                    until not _G.Settings.Misc["No Soru Cooldown"]
                                end)
                            end
                        end
                    end
                end
            end
        end
        function xray(p215)
            if p215 then
                local v216, v217, v218 = pairs(workspace:GetDescendants())
                while true do
                    local v219
                    v218, v219 = v216(v217, v218)
                    if v218 == nil then
                        break
                    end
                    if v219:IsA("BasePart") and not (v219.Parent:FindFirstChildOfClass("Humanoid") or v219.Parent.Parent:FindFirstChildOfClass("Humanoid")) then
                        v219.LocalTransparencyModifier = 0.5
                    end
                end
            else
                local v220, v221, v222 = pairs(workspace:GetDescendants())
                while true do
                    local v223
                    v222, v223 = v220(v221, v222)
                    if v222 == nil then
                        break
                    end
                    if v223:IsA("BasePart") and not (v223.Parent:FindFirstChildOfClass("Humanoid") or v223.Parent.Parent:FindFirstChildOfClass("Humanoid")) then
                        v223.LocalTransparencyModifier = 0
                    end
                end
            end
        end
        function getRoot(p224)
            return p224:FindFirstChild("HumanoidRootPart") or (p224:FindFirstChild("Torso") or p224:FindFirstChild("UpperTorso"))
        end
        function r15(p225)
            if p225.Character:FindFirstChildOfClass("Humanoid").RigType == Enum.HumanoidRigType.R15 then
                return true
            end
        end
        function ClickCamera()
            game:GetService("VirtualUser"):CaptureController()
            game:GetService("VirtualUser"):ClickButton1(Vector2.new(851, 158), game:GetService("Workspace").Camera.CFrame)
        end
        function Click()
            game:GetService("VirtualUser"):CaptureController()
            game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
        end
        local vu226 = loadstring(game:HttpGet("https://www.klgrth.io/paste/h8yq5/raw"))()
        function Fast_Hop()
            pcall(function()
                for v227 = math.random(1, math.random(40, 75)), 100 do
                    remote = game:GetService("ReplicatedStorage").__ServerBrowser:InvokeServer(v227)
                    local v228, v229, v230 = pairs(remote)
                    while true do
                        local v231
                        v230, v231 = v228(v229, v230)
                        if v230 == nil then
                            break
                        end
                        if tonumber(v231.Count) < 12 then
                            game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, v230)
                        end
                    end
                end
            end)
        end
        function RemoveFruit(p232)
            return p232:gsub(" Fruit", "")
        end
        local vu233 = loadstring(game:HttpGet("https://pastebin.com/raw/EK13Njf3"))()
        function comma_value(p234)
            repeat
                local v235
                p234, v235 = string.gsub(p234, "^(-?%d+)(%d%d%d)", "%1,%2")
            until v235 == 0
            return p234
        end
        local function vu240()
            local v236, v237, v238 = pairs(game.Workspace.SeaBeasts:GetChildren())
            while true do
                local v239
                v238, v239 = v236(v237, v238)
                if v238 == nil then
                    break
                end
                if v239:FindFirstChild("HumanoidRootPart") then
                    return v239
                end
            end
            return false
        end
        local function vu245(_)
            local v241, v242, v243 = pairs(game:GetService("Workspace").Boats:GetChildren())
            while true do
                local v244
                v243, v244 = v241(v242, v243)
                if v243 == nil then
                    break
                end
                if # game:GetService("Workspace").Boats:GetChildren() > 0 and (v244:FindFirstChild("Owner") and tostring(v244.Owner.Value) == game.Players.LocalPlayer.Name) then
                    return v244.Plank.CFrame * CFrame.new(0.1, - 0.5, 0)
                end
            end
            return false
        end
        _G.CheckFruitLocal1M = false
        function CheckFruit1M()
            local v246, v247, v248 = pairs(game.ReplicatedStorage:WaitForChild("Remotes").CommF_:InvokeServer("getInventoryFruits"))
            while true do
                local v249
                v248, v249 = v246(v247, v248)
                if v248 == nil then
                    break
                end
                if v249.Price >= 1000000 then
                    _G.CheckFruitLocal1M = true
                end
            end
        end
        function GetFightingStyle(p250)
            ReturnText = ""
            local v251, v252, v253 = pairs(game.Players.LocalPlayer.Backpack:GetChildren())
            while true do
                local v254
                v253, v254 = v251(v252, v253)
                if v253 == nil then
                    break
                end
                if v254:IsA("Tool") and v254.ToolTip == p250 then
                    ReturnText = v254.Name
                end
            end
            local v255, v256, v257 = pairs(game.Players.LocalPlayer.Character:GetChildren())
            while true do
                local v258
                v257, v258 = v255(v256, v257)
                if v257 == nil then
                    break
                end
                if v258:IsA("Tool") and v258.ToolTip == p250 then
                    ReturnText = v258.Name
                end
            end
            return ReturnText == "" and "Not Have" or ReturnText
        end
        local v259 = game.PlaceId
        if v259 ~= 2753915549 then
            if v259 ~= 4442272183 then
                if v259 ~= 7449423635 then
                    game.Players.LocalPlayer:Kick("??????????????????????")
                else
                    World3 = true
                end
            else
                World2 = true
            end
        else
            World1 = true
        end
        function CheckMasteryWeapon(p260, p261)
            if game.Players.LocalPlayer.Backpack:FindFirstChild(p260) then
                if tonumber(game.Players.LocalPlayer.Backpack:FindFirstChild(p260).Level.Value) < tonumber(p261) then
                    return "true DownTo"
                end
                if tonumber(game.Players.LocalPlayer.Backpack:FindFirstChild(p260).Level.Value) >= tonumber(p261) then
                    return "true UpTo"
                end
            end
            if game.Players.LocalPlayer.Character:FindFirstChild(p260) then
                if tonumber(game.Players.LocalPlayer.Character:FindFirstChild(p260).Level.Value) < tonumber(p261) then
                    return "true DownTo"
                end
                if tonumber(game.Players.LocalPlayer.Character:FindFirstChild(p260).Level.Value) >= tonumber(p261) then
                    return "true UpTo"
                end
            end
            return "else"
        end
        function GetWeaponInventory(p262)
            local v263, v264, v265 = pairs(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventory"))
            while true do
                local v266
                v265, v266 = v263(v264, v265)
                if v265 == nil then
                    break
                end
                if type(v266) == "table" and (v266.Type == "Sword" and v266.Name == p262) then
                    return true
                end
            end
            return false
        end
        function GetMaterial(p267)
            local v268, v269, v270 = pairs(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventory"))
            while true do
                local v271
                v270, v271 = v268(v269, v270)
                if v270 == nil then
                    break
                end
                if type(v271) == "table" and (v271.Type == "Material" and v271.Name == p267) then
                    return v271.Count
                end
            end
            return 0
        end
        local v272 = World1 and {
            "Magma Ore",
            "Leather",
            "Scrap Metal",
            "Angel Wings",
            "Fish Tail"
        } or (World2 and {
            "Magma Ore",
            "Scrap Metal",
            "Radioactive Material",
            "Vampire Fang",
            "Mystic Droplet"
        } or (World3 and {
            "Mini Tusk",
            "Fish Tail",
            "Scrap Metal",
            "Dragon Scale",
            "Conjured Cocoa",
            "Demonic Wisp",
            "Gunpowder"
        } or nil))
        table.sort(v272)
        local function vu278(p273)
            local v274, v275, v276 = pairs(p273)
            while true do
                local v277
                v276, v277 = v274(v275, v276)
                if v276 == nil then
                    break
                end
                if game:GetService("Workspace").Enemies:FindFirstChild(v277) then
                    return true
                end
            end
            return false
        end
        function isNumber(p279)
            if tonumber(p279) ~= nil or p279 == "inf" then
                return true
            end
        end
        local vu280 = game:GetService("Players").LocalPlayer
        local function vu281()
			-- upvalues: (ref) vu280
            if vu280.Character then
                return vu280.Character:WaitForChild("Humanoid").RigType ~= Enum.HumanoidRigType.R15 and "R6" or "R15"
            end
        end
        local function vu285()
			-- upvalues: (ref) vu280, (ref) vu281
            local v282 = vu280.Character
            local _ = v282.PrimaryPart.CFrame
            if vu281() ~= "R6" then
                local v283 = v282.LowerTorso.Root:Clone()
                v282.LowerTorso.Root:Destroy()
                v283.Parent = v282.LowerTorso
            else
                local v284 = v282.HumanoidRootPart:Clone()
                v282.HumanoidRootPart:Destroy()
                v284.Parent = v282
            end
        end
        local function vu287(p286)
            if World1 then
                if p286 == "Magma Ore" then
                    MaterialMob = {
                        "Military Soldier [Lv. 300]",
                        "Military Spy [Lv. 325]"
                    }
                    CFrameMon = CFrame.new(- 5815, 84, 8820)
                elseif p286 == "Leather" or p286 == "Scrap Metal" then
                    MaterialMob = {
                        "Brute [Lv. 45]"
                    }
                    CFrameMon = CFrame.new(- 1145, 15, 4350)
                elseif p286 == "Angel Wings" then
                    MaterialMob = {
                        "God\'s Guard [Lv. 450]"
                    }
                    CFrameMon = CFrame.new(- 4698, 845, - 1912)
                elseif p286 == "Fish Tail" then
                    MaterialMob = {
                        "Fishman Warrior [Lv. 375]",
                        "Fishman Commando [Lv. 400]"
                    }
                    CFrameMon = CFrame.new(61123, 19, 1569)
                end
            end
            if World2 then
                if p286 == "Magma Ore" then
                    MaterialMob = {
                        "Magma Ninja [Lv. 1175]"
                    }
                    CFrameMon = CFrame.new(- 5428, 78, - 5959)
                elseif p286 == "Scrap Metal" then
                    MaterialMob = {
                        "Swan Pirate [Lv. 775]"
                    }
                    CFrameMon = CFrame.new(878, 122, 1235)
                elseif p286 == "Radioactive Material" then
                    MaterialMob = {
                        "Factory Staff [Lv. 800]"
                    }
                    CFrameMon = CFrame.new(295, 73, - 56)
                elseif p286 == "Vampire Fang" then
                    MaterialMob = {
                        "Vampire [Lv. 975]"
                    }
                    CFrameMon = CFrame.new(- 6033, 7, - 1317)
                elseif p286 == "Mystic Droplet" then
                    MaterialMob = {
                        "Water Fighter [Lv. 1450]",
                        "Sea Soldier [Lv. 1425]"
                    }
                    CFrameMon = CFrame.new(- 3385, 239, - 10542)
                end
            end
            if World3 then
                if p286 == "Mini Tusk" then
                    MaterialMob = {
                        "Mythological Pirate [Lv. 1850]"
                    }
                    CFrameMon = CFrame.new(- 13545, 470, - 6917)
                elseif p286 == "Fish Tail" then
                    MaterialMob = {
                        "Fishman Raider [Lv. 1775]",
                        "Fishman Captain [Lv. 1800]"
                    }
                    CFrameMon = CFrame.new(- 10993, 332, - 8940)
                elseif p286 == "Scrap Metal" then
                    MaterialMob = {
                        "Jungle Pirate [Lv. 1900]"
                    }
                    CFrameMon = CFrame.new(- 12107, 332, - 10549)
                elseif p286 == "Dragon Scale" then
                    MaterialMob = {
                        "Dragon Crew Archer [Lv. 1600]",
                        "Dragon Crew Warrior [Lv. 1575]"
                    }
                    CFrameMon = CFrame.new(6594, 383, 139)
                elseif p286 == "Conjured Cocoa" then
                    MaterialMob = {
                        "Cocoa Warrior [Lv. 2300]",
                        "Chocolate Bar Battler [Lv. 2325]",
                        "Sweet Thief [Lv. 2350]",
                        "Candy Rebel [Lv. 2375]"
                    }
                    CFrameMon = CFrame.new(620.6344604492188, 78.93644714355469, - 12581.369140625)
                elseif p286 == "Demonic Wisp" then
                    MaterialMob = {
                        "Demonic Soul [Lv. 2025]"
                    }
                    CFrameMon = CFrame.new(- 9507, 172, 6158)
                elseif p286 == "Gunpowder" then
                    MaterialMob = {
                        "Pistol Billionaire [Lv. 1525]"
                    }
                    CFrameMon = CFrame.new(- 469, 74, 5904)
                end
            end
        end
        function CheckQuest()
            local v288 = game.Players.LocalPlayer.Data.Level.Value
            if World1 then
                if v288 == 1 or v288 <= 9 then
                    LevelFarm = 1
                    Name = "Bandit [Lv. 5]"
                    QuestName = "BanditQuest1"
                    LevelQuest = 1
                    NameMon = "Bandit"
                    CFrameMon = CFrame.new(1145, 17, 1634)
                    VectorMon = Vector3.new(1145, 17, 1634)
                    CFrameQuest = CFrame.new(1060, 17, 1547)
                    VectorQuest = Vector3.new(1060, 17, 1547)
                elseif v288 == 10 or v288 <= 14 then
                    LevelFarm = 2
                    Name = "Monkey [Lv. 14]"
                    QuestName = "JungleQuest"
                    LevelQuest = 1
                    NameMon = "Monkey"
                    CFrameMon = CFrame.new(- 1496, 39, 35)
                    VectorMon = Vector3.new(- 1496, 39, 35)
                    CFrameQuest = CFrame.new(- 1602, 37, 152)
                    VectorQuest = Vector3.new(- 1602, 37, 152)
                elseif v288 == 15 or v288 <= 29 then
                    LevelFarm = 3
                    Name = "Gorilla [Lv. 20]"
                    QuestName = "JungleQuest"
                    LevelQuest = 2
                    NameMon = "Gorilla"
                    CFrameMon = CFrame.new(- 1237, 6, - 486)
                    VectorMon = Vector3.new(- 1237, 7, - 486)
                    CFrameQuest = CFrame.new(- 1602, 37, 152)
                    VectorQuest = Vector3.new(- 1602, 37, 152)
                elseif v288 == 30 or v288 <= 39 then
                    LevelFarm = 4
                    Name = "Pirate [Lv. 35]"
                    QuestName = "BuggyQuest1"
                    LevelQuest = 1
                    NameMon = "Pirate"
                    CFrameMon = CFrame.new(- 1115, 14, 3938)
                    VectorMon = Vector3.new(- 1115, 14, 3938)
                    CFrameQuest = CFrame.new(- 1140, 5, 3828)
                    VectorQuest = Vector3.new(- 1140, 5, 3828)
                elseif v288 == 40 or v288 <= 59 then
                    LevelFarm = 5
                    Name = "Brute [Lv. 45]"
                    QuestName = "BuggyQuest1"
                    LevelQuest = 2
                    NameMon = "Brute"
                    CFrameMon = CFrame.new(- 1145, 15, 4350)
                    VectorMon = Vector3.new(- 1146, 15, 4350)
                    CFrameQuest = CFrame.new(- 1140, 5, 3828)
                    VectorQuest = Vector3.new(- 1140, 5, 3828)
                elseif v288 == 60 or v288 <= 74 then
                    LevelFarm = 6
                    Name = "Desert Bandit [Lv. 60]"
                    QuestName = "DesertQuest"
                    LevelQuest = 1
                    NameMon = "Desert Bandit"
                    CFrameMon = CFrame.new(932, 7, 4484)
                    VectorMon = Vector3.new(932, 7, 4484)
                    CFrameQuest = CFrame.new(897, 7, 4388)
                    VectorQuest = Vector3.new(897, 7, 4388)
                elseif v288 == 75 or v288 <= 89 then
                    LevelFarm = 7
                    Name = "Desert Officer [Lv. 70]"
                    QuestName = "DesertQuest"
                    LevelQuest = 2
                    NameMon = "Desert Officer"
                    CFrameMon = CFrame.new(1572, 10, 4373)
                    VectorMon = Vector3.new(1572, 10, 4373)
                    CFrameQuest = CFrame.new(897, 7, 4388)
                    VectorQuest = Vector3.new(897, 7, 4388)
                elseif v288 == 90 or v288 <= 99 then
                    LevelFarm = 8
                    Name = "Snow Bandit [Lv. 90]"
                    QuestName = "SnowQuest"
                    LevelQuest = 1
                    NameMon = "Snow Bandits"
                    CFrameMon = CFrame.new(1289, 150, - 1442)
                    VectorMon = Vector3.new(1289, 106, - 1442)
                    CFrameQuest = CFrame.new(1386, 87, - 1297)
                    VectorQuest = Vector3.new(1386, 87, - 1297)
                elseif v288 == 100 or v288 <= 119 then
                    LevelFarm = 9
                    Name = "Snowman [Lv. 100]"
                    QuestName = "SnowQuest"
                    LevelQuest = 2
                    NameMon = "Snowman"
                    CFrameMon = CFrame.new(1289, 150, - 1442)
                    VectorMon = Vector3.new(1289, 106, - 1442)
                    CFrameQuest = CFrame.new(1386, 87, - 1297)
                    VectorQuest = Vector3.new(1386, 87, - 1297)
                elseif v288 == 120 or v288 <= 149 then
                    LevelFarm = 10
                    Name = "Chief Petty Officer [Lv. 120]"
                    QuestName = "MarineQuest2"
                    LevelQuest = 1
                    NameMon = "Chief Petty Officer"
                    CFrameMon = CFrame.new(- 4855, 23, 4308)
                    VectorMon = Vector3.new(- 4855, 23, 4308)
                    CFrameQuest = CFrame.new(- 5036, 29, 4325)
                    VectorQuest = Vector3.new(- 5036, 29, 4325)
                elseif v288 == 150 or v288 <= 174 then
                    LevelFarm = 11
                    Name = "Sky Bandit [Lv. 150]"
                    QuestName = "SkyQuest"
                    LevelQuest = 1
                    NameMon = "Sky Bandit"
                    CFrameMon = CFrame.new(- 4981, 278, - 2830)
                    VectorMon = Vector3.new(- 4981, 278, - 2830)
                    CFrameQuest = CFrame.new(- 4842, 718, - 2623)
                    VectorQuest = Vector3.new(- 4842, 718, - 2623)
                elseif v288 == 175 or v288 <= 189 then
                    LevelFarm = 12
                    Name = "Dark Master [Lv. 175]"
                    QuestName = "SkyQuest"
                    LevelQuest = 2
                    NameMon = "Dark Master"
                    CFrameMon = CFrame.new(- 5250, 389, - 2272)
                    VectorMon = Vector3.new(- 5250, 389, - 2272)
                    CFrameQuest = CFrame.new(- 4842, 718, - 2623)
                    VectorQuest = Vector3.new(- 4842, 718, - 2623)
                elseif v288 == 190 or v288 <= 209 then
                    LevelFarm = 13
                    Name = "Prisoner [Lv. 190]"
                    QuestName = "PrisonerQuest"
                    LevelQuest = 1
                    NameMon = "Prisoner"
                    CFrameMon = CFrame.new(5411, 96, 690)
                    VectorMon = Vector3.new(5411, 96, 690)
                    CFrameQuest = CFrame.new(5308, 2, 474)
                    VectorQuest = Vector3.new(5308, 2, 474)
                elseif v288 == 210 or v288 <= 249 then
                    LevelFarm = 14
                    Name = "Dangerous Prisoner [Lv. 210]"
                    QuestName = "PrisonerQuest"
                    LevelQuest = 2
                    NameMon = "Dangerous Prisoner"
                    CFrameMon = CFrame.new(5411, 96, 690)
                    VectorMon = Vector3.new(5411, 96, 690)
                    CFrameQuest = CFrame.new(5308, 2, 474)
                    VectorQuest = Vector3.new(5308, 2, 474)
                elseif v288 == 250 or v288 <= 299 then
                    LevelFarm = 15
                    Name = "Toga Warrior [Lv. 250]"
                    QuestName = "ColosseumQuest"
                    LevelQuest = 1
                    NameMon = "Toga Warrior"
                    CFrameMon = CFrame.new(- 1824, 50, - 2743)
                    VectorMon = Vector3.new(- 1824, 50, - 2743)
                    CFrameQuest = CFrame.new(- 1576, 8, - 2985)
                    VectorQuest = Vector3.new(- 1576, 8, - 2985)
                elseif v288 == 300 or v288 <= 329 then
                    LevelFarm = 16
                    Name = "Military Soldier [Lv. 300]"
                    QuestName = "MagmaQuest"
                    LevelQuest = 1
                    NameMon = "Military Soldier"
                    CFrameMon = CFrame.new(- 5408, 11, 8447)
                    VectorMon = Vector3.new(- 5408, 11, 8447)
                    CFrameQuest = CFrame.new(- 5316, 12, 8517)
                    VectorQuest = Vector3.new(- 5316, 12, 8517)
                elseif v288 == 325 or v288 <= 374 then
                    LevelFarm = 17
                    Name = "Military Spy [Lv. 325]"
                    QuestName = "MagmaQuest"
                    LevelQuest = 2
                    NameMon = "Military Spy"
                    CFrameMon = CFrame.new(- 5815, 84, 8820)
                    VectorMon = Vector3.new(- 5815, 84, 8820)
                    CFrameQuest = CFrame.new(- 5316, 12, 8517)
                    VectorQuest = Vector3.new(- 5316, 12, 8517)
                elseif v288 == 375 or v288 <= 399 then
                    LevelFarm = 18
                    Name = "Fishman Warrior [Lv. 375]"
                    QuestName = "FishmanQuest"
                    LevelQuest = 1
                    NameMon = "Fishman Warrior"
                    CFrameMon = CFrame.new(60859, 19, 1501)
                    VectorMon = Vector3.new(60859, 19, 1501)
                    CFrameQuest = CFrame.new(61123, 19, 1569)
                    VectorQuest = Vector3.new(61123, 19, 1569)
                elseif v288 == 400 or v288 <= 449 then
                    LevelFarm = 19
                    Name = "Fishman Commando [Lv. 400]"
                    QuestName = "FishmanQuest"
                    LevelQuest = 2
                    NameMon = "Fishman Commando"
                    CFrameMon = CFrame.new(61891, 19, 1470)
                    VectorMon = Vector3.new(61891, 19, 1470)
                    CFrameQuest = CFrame.new(61123, 19, 1569)
                    VectorQuest = Vector3.new(61123, 19, 1569)
                elseif v288 == 450 or v288 <= 474 then
                    LevelFarm = 20
                    Name = "God\'s Guard [Lv. 450]"
                    QuestName = "SkyExp1Quest"
                    LevelQuest = 1
                    NameMon = "God\'s Guards"
                    CFrameMon = CFrame.new(- 4698, 845, - 1912)
                    VectorMon = Vector3.new(- 4698, 845, - 1912)
                    CFrameQuest = CFrame.new(- 4722, 845, - 1954)
                    VectorQuest = Vector3.new(- 4722, 846, - 1954)
                elseif v288 == 475 or v288 <= 524 then
                    LevelFarm = 21
                    Name = "Shanda [Lv. 475]"
                    QuestName = "SkyExp1Quest"
                    LevelQuest = 2
                    NameMon = "Shandas"
                    CFrameMon = CFrame.new(- 7685, 5567, - 502)
                    VectorMon = Vector3.new(- 7685, 5567, - 502)
                    CFrameQuest = CFrame.new(- 7862, 5546, - 380)
                    VectorQuest = Vector3.new(- 7862, 5546, - 380)
                elseif v288 == 525 or v288 <= 549 then
                    LevelFarm = 22
                    Name = "Royal Squad [Lv. 525]"
                    QuestName = "SkyExp2Quest"
                    LevelQuest = 1
                    NameMon = "Royal Squad"
                    CFrameMon = CFrame.new(- 7670, 5607, - 1460)
                    VectorMon = Vector3.new(- 7670, 5607, - 1460)
                    CFrameQuest = CFrame.new(- 7904, 5636, - 1412)
                    VectorQuest = Vector3.new(- 7904, 5636, - 1412)
                elseif v288 == 550 or v288 <= 624 then
                    LevelFarm = 23
                    Name = "Royal Soldier [Lv. 550]"
                    QuestName = "SkyExp2Quest"
                    LevelQuest = 2
                    NameMon = "Royal Soldier"
                    CFrameMon = CFrame.new(- 7828, 5607, - 1744)
                    VectorMon = Vector3.new(- 7828, 5607, - 1744)
                    CFrameQuest = CFrame.new(- 7904, 5636, - 1412)
                    VectorQuest = Vector3.new(- 7904, 5636, - 1412)
                elseif v288 == 625 or v288 <= 649 then
                    LevelFarm = 24
                    Name = "Galley Pirate [Lv. 625]"
                    QuestName = "FountainQuest"
                    LevelQuest = 1
                    NameMon = "Galley Pirate"
                    CFrameMon = CFrame.new(5589, 45, 3996)
                    VectorMon = Vector3.new(5589, 45, 3996)
                    CFrameQuest = CFrame.new(5256, 39, 4050)
                    VectorQuest = Vector3.new(5256, 39, 4050)
                elseif v288 >= 650 then
                    LevelFarm = 25
                    Name = "Galley Captain [Lv. 650]"
                    QuestName = "FountainQuest"
                    LevelQuest = 2
                    NameMon = "Galley Captain"
                    CFrameMon = CFrame.new(5649, 39, 4936)
                    VectorMon = Vector3.new(5649, 39, 4936)
                    CFrameQuest = CFrame.new(5256, 39, 4050)
                    VectorQuest = Vector3.new(5256, 39, 4050)
                end
            end
            if World2 then
                if v288 == 700 or v288 <= 724 then
                    LevelFarm = 1
                    Name = "Raider [Lv. 700]"
                    QuestName = "Area1Quest"
                    LevelQuest = 1
                    NameMon = "Raider"
                    CFrameQuest = CFrame.new(- 425, 73, 1837)
                    VectorQuest = Vector3.new(- 425, 73, 1837)
                    CFrameMon = CFrame.new(- 746, 39, 2390)
                    VectorMon = Vector3.new(- 746, 39, 2389)
                elseif v288 == 725 or v288 <= 774 then
                    LevelFarm = 2
                    Name = "Mercenary [Lv. 725]"
                    QuestName = "Area1Quest"
                    LevelQuest = 2
                    NameMon = "Mercenary"
                    CFrameQuest = CFrame.new(- 425, 73, 1837)
                    VectorQuest = Vector3.new(- 425, 73, 1837)
                    CFrameMon = CFrame.new(- 874, 141, 1312)
                    VectorMon = Vector3.new(- 874, 141, 1312)
                elseif v288 == 775 or v288 <= 799 then
                    LevelFarm = 3
                    Name = "Swan Pirate [Lv. 775]"
                    QuestName = "Area2Quest"
                    LevelQuest = 1
                    NameMon = "Swan Pirate"
                    CFrameQuest = CFrame.new(634, 73, 918)
                    VectorQuest = Vector3.new(634, 73, 918)
                    CFrameMon = CFrame.new(878, 122, 1235)
                    VectorMon = Vector3.new(878, 122, 1235)
                elseif v288 == 800 or v288 <= 874 then
                    LevelFarm = 4
                    Name = "Factory Staff [Lv. 800]"
                    QuestName = "Area2Quest"
                    LevelQuest = 2
                    NameMon = "Factory Staff"
                    CFrameQuest = CFrame.new(634, 73, 918)
                    VectorQuest = Vector3.new(634, 73, 918)
                    CFrameMon = CFrame.new(295, 73, - 56)
                    VectorMon = Vector3.new(295, 73, - 56)
                elseif v288 == 875 or v288 <= 899 then
                    LevelFarm = 5
                    Name = "Marine Lieutenant [Lv. 875]"
                    QuestName = "MarineQuest3"
                    LevelQuest = 1
                    NameMon = "Marine Lieutenant"
                    CFrameMon = CFrame.new(- 2806, 73, - 3038)
                    VectorMon = Vector3.new(- 2806, 73, - 3038)
                    CFrameQuest = CFrame.new(- 2443, 73, - 3219)
                    VectorQuest = Vector3.new(- 2443, 73, - 3219)
                elseif v288 == 900 or v288 <= 949 then
                    LevelFarm = 6
                    Name = "Marine Captain [Lv. 900]"
                    QuestName = "MarineQuest3"
                    LevelQuest = 2
                    NameMon = "Marine Captain"
                    CFrameMon = CFrame.new(- 1869, 73, - 3320)
                    VectorMon = Vector3.new(- 1869, 73, - 3320)
                    CFrameQuest = CFrame.new(- 2443, 73, - 3219)
                    VectorQuest = Vector3.new(- 2443, 73, - 3219)
                elseif v288 == 950 or v288 <= 974 then
                    LevelFarm = 7
                    Name = "Zombie [Lv. 950]"
                    QuestName = "ZombieQuest"
                    LevelQuest = 1
                    NameMon = "Zombie"
                    CFrameMon = CFrame.new(- 5736, 126, - 728)
                    VectorMon = Vector3.new(- 5736, 126, - 728)
                    CFrameQuest = CFrame.new(- 5494, 49, - 795)
                    VectorQuest = Vector3.new(- 5494, 49, - 794)
                elseif v288 == 975 or v288 <= 999 then
                    LevelFarm = 8
                    Name = "Vampire [Lv. 975]"
                    QuestName = "ZombieQuest"
                    LevelQuest = 2
                    NameMon = "Vampire"
                    CFrameMon = CFrame.new(- 6033, 7, - 1317)
                    VectorMon = Vector3.new(- 6033, 7, - 1317)
                    CFrameQuest = CFrame.new(- 5494, 49, - 795)
                    VectorQuest = Vector3.new(- 5494, 49, - 795)
                elseif v288 == 1000 or v288 <= 1049 then
                    LevelFarm = 9
                    Name = "Snow Trooper [Lv. 1000]"
                    QuestName = "SnowMountainQuest"
                    LevelQuest = 1
                    NameMon = "Snow Trooper"
                    CFrameMon = CFrame.new(478, 402, - 5362)
                    VectorMon = Vector3.new(478, 402, - 5362)
                    CFrameQuest = CFrame.new(605, 402, - 5371)
                    VectorQuest = Vector3.new(605, 402, - 5371)
                elseif v288 == 1050 or v288 <= 1099 then
                    LevelFarm = 10
                    Name = "Winter Warrior [Lv. 1050]"
                    QuestName = "SnowMountainQuest"
                    LevelQuest = 2
                    NameMon = "Winter Warrior"
                    CFrameMon = CFrame.new(1157, 430, - 5188)
                    VectorMon = Vector3.new(1157, 430, - 5188)
                    CFrameQuest = CFrame.new(605, 402, - 5371)
                    VectorQuest = Vector3.new(605, 402, - 5371)
                elseif v288 == 1100 or v288 <= 1124 then
                    LevelFarm = 11
                    Name = "Lab Subordinate [Lv. 1100]"
                    QuestName = "IceSideQuest"
                    LevelQuest = 1
                    NameMon = "Lab Subordinate"
                    CFrameMon = CFrame.new(- 5782, 42, - 4484)
                    VectorMon = Vector3.new(- 5782, 42, - 4484)
                    CFrameQuest = CFrame.new(- 6060, 16, - 4905)
                    VectorQuest = Vector3.new(- 6060, 16, - 4905)
                elseif v288 == 1125 or v288 <= 1174 then
                    LevelFarm = 12
                    Name = "Horned Warrior [Lv. 1125]"
                    QuestName = "IceSideQuest"
                    LevelQuest = 2
                    NameMon = "Horned Warrior"
                    CFrameMon = CFrame.new(- 6406, 24, - 5805)
                    VectorMon = Vector3.new(- 6406, 24, - 5805)
                    CFrameQuest = CFrame.new(- 6060, 16, - 4905)
                    VectorQuest = Vector3.new(- 6060, 16, - 4905)
                elseif v288 == 1175 or v288 <= 1199 then
                    LevelFarm = 13
                    Name = "Magma Ninja [Lv. 1175]"
                    QuestName = "FireSideQuest"
                    LevelQuest = 1
                    NameMon = "Magma Ninja"
                    CFrameMon = CFrame.new(- 5428, 78, - 5959)
                    VectorMon = Vector3.new(- 5428, 78, - 5959)
                    CFrameQuest = CFrame.new(- 5430, 16, - 5295)
                    VectorQuest = Vector3.new(- 5430, 16, - 5296)
                elseif v288 == 1200 or v288 <= 1249 then
                    LevelFarm = 14
                    Name = "Lava Pirate [Lv. 1200]"
                    QuestName = "FireSideQuest"
                    LevelQuest = 2
                    NameMon = "Lava Pirate"
                    CFrameMon = CFrame.new(- 5270, 42, - 4800)
                    VectorMon = Vector3.new(- 5270, 42, - 4800)
                    CFrameQuest = CFrame.new(- 5430, 16, - 5295)
                    VectorQuest = Vector3.new(- 5430, 16, - 5296)
                elseif v288 == 1250 or v288 <= 1274 then
                    LevelFarm = 15
                    Name = "Ship Deckhand [Lv. 1250]"
                    QuestName = "ShipQuest1"
                    LevelQuest = 1
                    NameMon = "Ship Deckhand"
                    CFrameMon = CFrame.new(1198, 126, 33031)
                    VectorMon = Vector3.new(1198, 126, 33031)
                    CFrameQuest = CFrame.new(1038, 125, 32913)
                    VectorQuest = Vector3.new(1038, 125, 32913)
                elseif v288 == 1275 or v288 <= 1299 then
                    LevelFarm = 16
                    Name = "Ship Engineer [Lv. 1275]"
                    QuestName = "ShipQuest1"
                    LevelQuest = 2
                    NameMon = "Ship Engineer"
                    CFrameMon = CFrame.new(918, 44, 32787)
                    VectorMon = Vector3.new(918, 44, 32787)
                    CFrameQuest = CFrame.new(1038, 125, 32913)
                    VectorQuest = Vector3.new(1038, 125, 32913)
                elseif v288 == 1300 or v288 <= 1324 then
                    LevelFarm = 17
                    Name = "Ship Steward [Lv. 1300]"
                    QuestName = "ShipQuest2"
                    LevelQuest = 1
                    NameMon = "Ship Steward"
                    CFrameMon = CFrame.new(915, 130, 33419)
                    VectorMon = Vector3.new(915, 130, 33419)
                    CFrameQuest = CFrame.new(969, 125, 33245)
                    VectorQuest = Vector3.new(969, 125, 33245)
                elseif v288 == 1325 or v288 <= 1349 then
                    LevelFarm = 18
                    Name = "Ship Officer [Lv. 1325]"
                    QuestName = "ShipQuest2"
                    LevelQuest = 2
                    NameMon = "Ship Officer"
                    CFrameMon = CFrame.new(916, 181, 33335)
                    VectorMon = Vector3.new(916, 181, 33335)
                    CFrameQuest = CFrame.new(969, 125, 33245)
                    VectorQuest = Vector3.new(969, 125, 33245)
                elseif v288 == 1350 or v288 <= 1374 then
                    LevelFarm = 19
                    Name = "Arctic Warrior [Lv. 1350]"
                    QuestName = "FrostQuest"
                    LevelQuest = 1
                    NameMon = "Arctic Warrior"
                    CFrameMon = CFrame.new(6038, 29, - 6231)
                    VectorMon = Vector3.new(6038, 29, - 6231)
                    VectorQuest = Vector3.new(5669, 28, - 6482)
                    CFrameQuest = CFrame.new(5669, 28, - 6482)
                elseif v288 == 1375 or v288 <= 1424 then
                    LevelFarm = 20
                    Name = "Snow Lurker [Lv. 1375]"
                    QuestName = "FrostQuest"
                    LevelQuest = 2
                    NameMon = "Snow Lurker"
                    CFrameMon = CFrame.new(5560, 42, - 6826)
                    VectorMon = Vector3.new(5560, 42, - 6826)
                    VectorQuest = Vector3.new(5669, 28, - 6482)
                    CFrameQuest = CFrame.new(5669, 28, - 6482)
                elseif v288 == 1425 or v288 <= 1449 then
                    LevelFarm = 21
                    Name = "Sea Soldier [Lv. 1425]"
                    QuestName = "ForgottenQuest"
                    LevelQuest = 1
                    NameMon = "Sea Soldier"
                    CFrameMon = CFrame.new(- 3022, 16, - 9722)
                    VectorMon = Vector3.new(- 3022, 16, - 9722)
                    CFrameQuest = CFrame.new(- 3054, 237, - 10148)
                    VectorQuest = Vector3.new(- 3054, 237, - 10148)
                elseif v288 >= 1450 then
                    LevelFarm = 22
                    Name = "Water Fighter [Lv. 1450]"
                    QuestName = "ForgottenQuest"
                    LevelQuest = 2
                    NameMon = "Water Fighter"
                    CFrameMon = CFrame.new(- 3385, 239, - 10542)
                    VectorMon = Vector3.new(- 3385, 239, - 10542)
                    CFrameQuest = CFrame.new(- 3054, 237, - 10148)
                    VectorQuest = Vector3.new(- 3054, 237, - 10148)
                end
            end
            if World3 then
                if v288 == 1500 or v288 <= 1524 then
                    LevelFarm = 1
                    Name = "Pirate Millionaire [Lv. 1500]"
                    QuestName = "PiratePortQuest"
                    LevelQuest = 1
                    NameMon = "Pirate"
                    CFrameMon = CFrame.new(- 373, 75, 5550)
                    VectorMon = Vector3.new(- 373, 75, 5550)
                    CFrameQuest = CFrame.new(- 288, 44, 5576)
                    VectorQuest = Vector3.new(- 288, 44, 5576)
                elseif v288 == 1525 or v288 <= 1574 then
                    LevelFarm = 2
                    Name = "Pistol Billionaire [Lv. 1525]"
                    QuestName = "PiratePortQuest"
                    LevelQuest = 2
                    NameMon = "Pistol"
                    CFrameMon = CFrame.new(- 469, 74, 5904)
                    VectorMon = Vector3.new(- 469, 74, 5904)
                    CFrameQuest = CFrame.new(- 288, 44, 5576)
                    VectorQuest = Vector3.new(- 288, 44, 5576)
                elseif v288 == 1575 or v288 <= 1599 then
                    LevelFarm = 3
                    Name = "Dragon Crew Warrior [Lv. 1575]"
                    QuestName = "AmazonQuest"
                    LevelQuest = 1
                    NameMon = "Warrior"
                    CFrameMon = CFrame.new(6339, 52, - 1213)
                    VectorMon = Vector3.new(6338, 52, - 1213)
                    CFrameQuest = CFrame.new(5835, 52, - 1105)
                    VectorQuest = Vector3.new(5835, 52, - 1105)
                elseif v288 == 1600 or v288 <= 1624 then
                    LevelFarm = 4
                    Name = "Dragon Crew Archer [Lv. 1600]"
                    QuestName = "AmazonQuest"
                    LevelQuest = 2
                    NameMon = "Archer"
                    CFrameMon = CFrame.new(6594, 383, 139)
                    VectorMon = Vector3.new(6594, 383, 139)
                    CFrameQuest = CFrame.new(5835, 52, - 1105)
                    VectorQuest = Vector3.new(5835, 52, - 1105)
                elseif v288 == 1625 or v288 <= 1649 then
                    LevelFarm = 5
                    Name = "Female Islander [Lv. 1625]"
                    QuestName = "AmazonQuest2"
                    LevelQuest = 1
                    NameMon = "Female"
                    CFrameMon = CFrame.new(5308, 819, 1047)
                    VectorMon = Vector3.new(5308, 819, 1047)
                    CFrameQuest = CFrame.new(5443, 602, 751)
                    VectorQuest = Vector3.new(5443, 602, 751)
                elseif v288 == 1650 or v288 <= 1699 then
                    LevelFarm = 6
                    Name = "Giant Islander [Lv. 1650]"
                    QuestName = "AmazonQuest2"
                    LevelQuest = 2
                    NameMon = "Giant Islanders"
                    CFrameMon = CFrame.new(4951, 602, - 68)
                    VectorMon = Vector3.new(4951, 602, - 68)
                    CFrameQuest = CFrame.new(5443, 602, 751)
                    VectorQuest = Vector3.new(5443, 602, 751)
                elseif v288 == 1700 or v288 <= 1724 then
                    LevelFarm = 7
                    Name = "Marine Commodore [Lv. 1700]"
                    QuestName = "MarineTreeIsland"
                    LevelQuest = 1
                    NameMon = "Marine Commodore"
                    CFrameMon = CFrame.new(2447, 73, - 7470)
                    VectorMon = Vector3.new(2447, 73, - 7470)
                    CFrameQuest = CFrame.new(2180, 29, - 6737)
                    VectorQuest = Vector3.new(2180, 29, - 6737)
                elseif v288 == 1725 or v288 <= 1774 then
                    LevelFarm = 8
                    Name = "Marine Rear Admiral [Lv. 1725]"
                    QuestName = "MarineTreeIsland"
                    LevelQuest = 2
                    NameMon = "Marine Rear Admiral"
                    CFrameMon = CFrame.new(3671, 161, - 6932)
                    VectorMon = Vector3.new(3671, 161, - 6932)
                    CFrameQuest = CFrame.new(2180, 29, - 6737)
                    VectorQuest = Vector3.new(2180, 29, - 6737)
                elseif v288 == 1775 or v288 <= 1800 then
                    LevelFarm = 9
                    Name = "Fishman Raider [Lv. 1775]"
                    QuestName = "DeepForestIsland3"
                    LevelQuest = 1
                    NameMon = "Fishman Raider"
                    CFrameMon = CFrame.new(- 10560, 332, - 8466)
                    VectorMon = Vector3.new(- 10560, 332, - 8466)
                    CFrameQuest = CFrame.new(- 10584, 332, - 8758)
                    VectorQuest = Vector3.new(- 10584, 332, - 8758)
                elseif v288 == 1800 or v288 <= 1824 then
                    LevelFarm = 10
                    Name = "Fishman Captain [Lv. 1800]"
                    QuestName = "DeepForestIsland3"
                    LevelQuest = 2
                    NameMon = "Fishman Captain"
                    CFrameMon = CFrame.new(- 10993, 332, - 8940)
                    VectorMon = Vector3.new(- 10993, 332, - 8940)
                    CFrameQuest = CFrame.new(- 10584, 332, - 8758)
                    VectorQuest = Vector3.new(- 10584, 332, - 8758)
                elseif v288 == 1825 or v288 <= 1849 then
                    LevelFarm = 11
                    Name = "Forest Pirate [Lv. 1825]"
                    QuestName = "DeepForestIsland"
                    LevelQuest = 1
                    NameMon = "Forest Pirate"
                    CFrameMon = CFrame.new(- 13479, 333, - 7905)
                    VectorMon = Vector3.new(- 13479, 333, - 7905)
                    CFrameQuest = CFrame.new(- 13232, 333, - 7627)
                    VectorQuest = Vector3.new(- 13232, 333, - 7627)
                elseif v288 == 1850 or v288 <= 1899 then
                    LevelFarm = 12
                    Name = "Mythological Pirate [Lv. 1850]"
                    QuestName = "DeepForestIsland"
                    LevelQuest = 2
                    NameMon = "Mythological Pirate"
                    CFrameMon = CFrame.new(- 13545, 470, - 6917)
                    VectorMon = Vector3.new(- 13545, 470, - 6917)
                    CFrameQuest = CFrame.new(- 13232, 333, - 7627)
                    VectorQuest = Vector3.new(- 13232, 333, - 7627)
                elseif v288 == 1900 or v288 <= 1924 then
                    LevelFarm = 13
                    Name = "Jungle Pirate [Lv. 1900]"
                    QuestName = "DeepForestIsland2"
                    LevelQuest = 1
                    NameMon = "Jungle Pirate"
                    CFrameMon = CFrame.new(- 12107, 332, - 10549)
                    VectorMon = Vector3.new(- 12106, 332, - 10549)
                    CFrameQuest = CFrame.new(- 12684, 391, - 9902)
                    VectorQuest = Vector3.new(- 12684, 391, - 9902)
                elseif v288 == 1925 or v288 <= 1974 then
                    LevelFarm = 14
                    Name = "Musketeer Pirate [Lv. 1925]"
                    QuestName = "DeepForestIsland2"
                    LevelQuest = 2
                    NameMon = "Musketeer Pirate"
                    CFrameMon = CFrame.new(- 13286, 392, - 9769)
                    VectorMon = Vector3.new(- 13286, 392, - 9768)
                    CFrameQuest = CFrame.new(- 12684, 391, - 9902)
                    VectorQuest = Vector3.new(- 12684, 391, - 9902)
                elseif v288 == 1975 or v288 <= 1999 then
                    LevelFarm = 15
                    Name = "Reborn Skeleton [Lv. 1975]"
                    QuestName = "HauntedQuest1"
                    LevelQuest = 1
                    NameMon = "Reborn Skeleton"
                    CFrameMon = CFrame.new(- 8760, 142, 6039)
                    VectorMon = Vector3.new(- 8760, 142, 6039)
                    CFrameQuest = CFrame.new(- 9482, 142, 5567)
                    VectorQuest = Vector3.new(- 9482, 142, 5567)
                elseif v288 == 2000 or v288 <= 2024 then
                    LevelFarm = 16
                    Name = "Living Zombie [Lv. 2000]"
                    QuestName = "HauntedQuest1"
                    LevelQuest = 2
                    NameMon = "Living Zombie"
                    CFrameMon = CFrame.new(- 10144, 140, 5932)
                    VectorMon = Vector3.new(- 10144, 140, 5932)
                    CFrameQuest = CFrame.new(- 9482, 142, 5567)
                    VectorQuest = Vector3.new(- 9482, 142, 5567)
                elseif v288 == 2025 or v288 <= 2049 then
                    LevelFarm = 17
                    Name = "Demonic Soul [Lv. 2025]"
                    QuestName = "HauntedQuest2"
                    LevelQuest = 1
                    NameMon = "Demonic Soul"
                    CFrameMon = CFrame.new(- 9507, 172, 6158)
                    VectorMon = Vector3.new(- 9506, 172, 6158)
                    CFrameQuest = CFrame.new(- 9513, 172, 6079)
                    VectorQuest = Vector3.new(- 9513, 172, 6079)
                elseif v288 == 2050 or v288 <= 2074 then
                    LevelFarm = 18
                    Name = "Posessed Mummy [Lv. 2050]"
                    QuestName = "HauntedQuest2"
                    LevelQuest = 2
                    NameMon = "Posessed Mummy"
                    CFrameMon = CFrame.new(- 9577, 6, 6223)
                    VectorMon = Vector3.new(- 9577, 6, 6223)
                    CFrameQuest = CFrame.new(- 9513, 172, 6079)
                    VectorQuest = Vector3.new(- 9513, 172, 6079)
                elseif v288 == 2075 or v288 <= 2099 then
                    LevelFarm = 19
                    Name = "Peanut Scout [Lv. 2075]"
                    QuestName = "NutsIslandQuest"
                    LevelQuest = 1
                    NameMon = "Peanut Scout"
                    CFrameMon = CFrame.new(- 2124, 123, - 10435)
                    VectorMon = Vector3.new(- 2124, 123, - 10435)
                    CFrameQuest = CFrame.new(- 2104, 38, - 10192)
                    VectorQuest = Vector3.new(- 2104, 38, - 10192)
                elseif v288 == 2100 or v288 <= 2124 then
                    LevelFarm = 20
                    Name = "Peanut President [Lv. 2100]"
                    QuestName = "NutsIslandQuest"
                    LevelQuest = 2
                    NameMon = "Peanut President"
                    CFrameMon = CFrame.new(- 2124, 123, - 10435)
                    VectorMon = Vector3.new(- 2124, 123, - 10435)
                    CFrameQuest = CFrame.new(- 2104, 38, - 10192)
                    VectorQuest = Vector3.new(- 2104, 38, - 10192)
                elseif v288 == 2125 or v288 <= 2149 then
                    LevelFarm = 21
                    Name = "Ice Cream Chef [Lv. 2125]"
                    QuestName = "IceCreamIslandQuest"
                    LevelQuest = 1
                    NameMon = "Ice Cream Chef"
                    CFrameMon = CFrame.new(- 641, 127, - 11062)
                    VectorMon = Vector3.new(- 641, 127, - 11062)
                    CFrameQuest = CFrame.new(- 822, 66, - 10965)
                    VectorQuest = Vector3.new(- 822, 66, - 10965)
                elseif v288 == 2150 or v288 <= 2199 then
                    LevelFarm = 22
                    Name = "Ice Cream Commander [Lv. 2150]"
                    QuestName = "IceCreamIslandQuest"
                    LevelQuest = 2
                    NameMon = "Ice Cream Commander"
                    CFrameMon = CFrame.new(- 641, 127, - 11062)
                    VectorMon = Vector3.new(- 641, 127, - 11062)
                    CFrameQuest = CFrame.new(- 822, 66, - 10965)
                    VectorQuest = Vector3.new(- 822, 66, - 10965)
                elseif v288 == 2200 or v288 <= 2224 then
                    LevelFarm = 23
                    Name = "Cookie Crafter [Lv. 2200]"
                    QuestName = "CakeQuest1"
                    LevelQuest = 1
                    NameMon = "Cookie Crafter"
                    CFrameMon = CFrame.new(- 2365, 38, - 12099)
                    VectorMon = Vector3.new(- 2365, 38, - 12099)
                    CFrameQuest = CFrame.new(- 2020, 38, - 12025)
                    VectorQuest = Vector3.new(- 2020, 38, - 12025)
                elseif v288 == 2225 or v288 <= 2249 then
                    LevelFarm = 24
                    Name = "Cake Guard [Lv. 2225]"
                    QuestName = "CakeQuest1"
                    LevelQuest = 2
                    NameMon = "Cake Guard"
                    CFrameMon = CFrame.new(- 1651, 38, - 12308)
                    VectorMon = Vector3.new(- 1651, 38, - 12308)
                    CFrameQuest = CFrame.new(- 2020, 38, - 12025)
                    VectorQuest = Vector3.new(- 2020, 38, - 12025)
                elseif v288 == 2250 or v288 <= 2274 then
                    LevelFarm = 25
                    Name = "Baking Staff [Lv. 2250]"
                    QuestName = "CakeQuest2"
                    LevelQuest = 1
                    NameMon = "Baking Staff"
                    CFrameMon = CFrame.new(- 1870, 38, - 12938)
                    VectorMon = Vector3.new(- 1870, 38, - 12938)
                    CFrameQuest = CFrame.new(- 1926, 38, - 12850)
                    VectorQuest = Vector3.new(- 1926, 38, - 12850)
                elseif v288 == 2275 or v288 <= 2299 then
                    LevelFarm = 26
                    Name = "Head Baker [Lv. 2275]"
                    QuestName = "CakeQuest2"
                    LevelQuest = 2
                    NameMon = "Head Baker"
                    CFrameMon = CFrame.new(- 1926, 88, - 12850)
                    VectorMon = CFrame.new(- 1870, 38, - 12938)
                    CFrameQuest = CFrame.new(- 1926, 38, - 12850)
                    VectorQuest = Vector3.new(- 1926, 38, - 12850)
                elseif v288 == 2300 or v288 <= 2324 then
                    LevelFarm = 27
                    Name = "Cocoa Warrior [Lv. 2300]"
                    QuestName = "ChocQuest1"
                    LevelQuest = 1
                    NameMon = "Cocoa Warrior"
                    CFrameMon = CFrame.new(231, 23, - 12194)
                    VectorMon = CFrame.new(231, 23, - 12194)
                    CFrameQuest = CFrame.new(231, 23, - 12194)
                    VectorQuest = Vector3.new(231, 23, - 12194)
                elseif v288 == 2325 or v288 <= 2349 then
                    LevelFarm = 28
                    Name = "Chocolate Bar Battler [Lv. 2325]"
                    QuestName = "ChocQuest1"
                    LevelQuest = 2
                    NameMon = "Chocolate Bar Battler"
                    CFrameMon = CFrame.new(231, 23, - 12194)
                    VectorMon = CFrame.new(231, 23, - 12194)
                    CFrameQuest = CFrame.new(231, 23, - 12194)
                    VectorQuest = Vector3.new(231, 23, - 12194)
                elseif v288 == 2350 or v288 <= 2374 then
                    LevelFarm = 29
                    Name = "Sweet Thief [Lv. 2350]"
                    QuestName = "ChocQuest2"
                    LevelQuest = 1
                    NameMon = "Sweet Thief"
                    CFrameMon = CFrame.new(71, 77, - 12632)
                    VectorMon = CFrame.new(71, 77, - 12632)
                    CFrameQuest = CFrame.new(151, 23, - 12774)
                    VectorQuest = Vector3.new(151, 23, - 12774)
                elseif v288 == 2375 or v288 <= 2399 then
                    LevelFarm = 30
                    Name = "Candy Rebel [Lv. 2375]"
                    QuestName = "ChocQuest2"
                    LevelQuest = 2
                    NameMon = "Candy Rebel"
                    CFrameMon = CFrame.new(134, 77, - 12882)
                    VectorMon = CFrame.new(134, 77, - 12882)
                    CFrameQuest = CFrame.new(151, 23, - 12774)
                    VectorQuest = Vector3.new(151, 23, - 12774)
                elseif v288 == 2400 or v288 <= 2424 then
                    LevelFarm = 31
                    Name = "Candy Pirate [Lv. 2400]"
                    QuestName = "CandyQuest1"
                    LevelQuest = 1
                    NameMon = "Candy Pirate"
                    CFrameMon = CFrame.new(- 1423.4515380859375, 116.5498275756836, - 14603.890625)
                    VectorMon = CFrame.new(- 1423.4515380859375, 116.5498275756836, - 14603.890625)
                    CFrameQuest = CFrame.new(- 1147.584716796875, 16.232574462890625, - 14445.6279296875)
                    VectorQuest = Vector3.new(- 1147.584716796875, 16.232574462890625, - 14445.6279296875)
                elseif v288 >= 2425 then
                    LevelFarm = 32
                    Name = "Snow Demon [Lv. 2425]"
                    QuestName = "CandyQuest1"
                    LevelQuest = 2
                    NameMon = "Snow Demon"
                    CFrameMon = CFrame.new(- 941.1054077148438, 56.978214263916016, - 14539.7060546875)
                    VectorMon = CFrame.new(- 941.1054077148438, 56.978214263916016, - 14539.7060546875)
                    CFrameQuest = CFrame.new(- 1147.584716796875, 16.232574462890625, - 14445.6279296875)
                    VectorQuest = Vector3.new(- 1147.584716796875, 16.232574462890625, - 14445.6279296875)
                end
            end
        end
        function CheckOldQuest(p289)
            if World1 then
                if p289 == 1 then
                    Name = "Bandit [Lv. 5]"
                    QuestName = "BanditQuest1"
                    LevelQuest = 1
                    NameMon = "Bandit"
                    CFrameMon = CFrame.new(1145, 17, 1634)
                    VectorMon = Vector3.new(1145, 17, 1634)
                    CFrameQuest = CFrame.new(1060, 17, 1547)
                    VectorQuest = Vector3.new(1060, 17, 1547)
                elseif p289 == 2 then
                    Name = "Monkey [Lv. 14]"
                    QuestName = "JungleQuest"
                    LevelQuest = 1
                    NameMon = "Monkey"
                    CFrameMon = CFrame.new(- 1496, 39, 35)
                    VectorMon = Vector3.new(- 1496, 39, 35)
                    CFrameQuest = CFrame.new(- 1602, 37, 152)
                    VectorQuest = Vector3.new(- 1602, 37, 152)
                elseif p289 == 3 then
                    Name = "Gorilla [Lv. 20]"
                    QuestName = "JungleQuest"
                    LevelQuest = 2
                    NameMon = "Gorilla"
                    CFrameMon = CFrame.new(- 1237, 6, - 486)
                    VectorMon = Vector3.new(- 1237, 7, - 486)
                    CFrameQuest = CFrame.new(- 1602, 37, 152)
                    VectorQuest = Vector3.new(- 1602, 37, 152)
                elseif p289 == 4 then
                    Name = "Pirate [Lv. 35]"
                    QuestName = "BuggyQuest1"
                    LevelQuest = 1
                    NameMon = "Pirate"
                    CFrameMon = CFrame.new(- 1115, 14, 3938)
                    VectorMon = Vector3.new(- 1115, 14, 3938)
                    CFrameQuest = CFrame.new(- 1140, 5, 3828)
                    VectorQuest = Vector3.new(- 1140, 5, 3828)
                elseif p289 == 5 then
                    Name = "Brute [Lv. 45]"
                    QuestName = "BuggyQuest1"
                    LevelQuest = 2
                    NameMon = "Brute"
                    CFrameMon = CFrame.new(- 1145, 15, 4350)
                    VectorMon = Vector3.new(- 1146, 15, 4350)
                    CFrameQuest = CFrame.new(- 1140, 5, 3828)
                    VectorQuest = Vector3.new(- 1140, 5, 3828)
                elseif p289 == 6 then
                    Name = "Desert Bandit [Lv. 60]"
                    QuestName = "DesertQuest"
                    LevelQuest = 1
                    NameMon = "Desert Bandit"
                    CFrameMon = CFrame.new(932, 7, 4484)
                    VectorMon = Vector3.new(932, 7, 4484)
                    CFrameQuest = CFrame.new(897, 7, 4388)
                    VectorQuest = Vector3.new(897, 7, 4388)
                elseif p289 == 7 then
                    Name = "Desert Officer [Lv. 70]"
                    QuestName = "DesertQuest"
                    LevelQuest = 2
                    NameMon = "Desert Officer"
                    CFrameMon = CFrame.new(1572, 10, 4373)
                    VectorMon = Vector3.new(1572, 10, 4373)
                    CFrameQuest = CFrame.new(897, 7, 4388)
                    VectorQuest = Vector3.new(897, 7, 4388)
                elseif p289 == 8 then
                    Name = "Snow Bandit [Lv. 90]"
                    QuestName = "SnowQuest"
                    LevelQuest = 1
                    NameMon = "Snow Bandits"
                    CFrameMon = CFrame.new(1289, 150, - 1442)
                    VectorMon = Vector3.new(1289, 106, - 1442)
                    CFrameQuest = CFrame.new(1386, 87, - 1297)
                    VectorQuest = Vector3.new(1386, 87, - 1297)
                elseif p289 == 9 then
                    Name = "Snowman [Lv. 100]"
                    QuestName = "SnowQuest"
                    LevelQuest = 2
                    NameMon = "Snowman"
                    CFrameMon = CFrame.new(1289, 150, - 1442)
                    VectorMon = Vector3.new(1289, 106, - 1442)
                    CFrameQuest = CFrame.new(1386, 87, - 1297)
                    VectorQuest = Vector3.new(1386, 87, - 1297)
                elseif p289 == 10 then
                    Name = "Chief Petty Officer [Lv. 120]"
                    QuestName = "MarineQuest2"
                    LevelQuest = 1
                    NameMon = "Chief Petty Officer"
                    CFrameMon = CFrame.new(- 4855, 23, 4308)
                    VectorMon = Vector3.new(- 4855, 23, 4308)
                    CFrameQuest = CFrame.new(- 5036, 29, 4325)
                    VectorQuest = Vector3.new(- 5036, 29, 4325)
                elseif p289 == 11 then
                    Name = "Sky Bandit [Lv. 150]"
                    QuestName = "SkyQuest"
                    LevelQuest = 1
                    NameMon = "Sky Bandit"
                    CFrameMon = CFrame.new(- 4981, 278, - 2830)
                    VectorMon = Vector3.new(- 4981, 278, - 2830)
                    CFrameQuest = CFrame.new(- 4842, 718, - 2623)
                    VectorQuest = Vector3.new(- 4842, 718, - 2623)
                elseif p289 == 12 then
                    Name = "Dark Master [Lv. 175]"
                    QuestName = "SkyQuest"
                    LevelQuest = 2
                    NameMon = "Dark Master"
                    CFrameMon = CFrame.new(- 5250, 389, - 2272)
                    VectorMon = Vector3.new(- 5250, 389, - 2272)
                    CFrameQuest = CFrame.new(- 4842, 718, - 2623)
                    VectorQuest = Vector3.new(- 4842, 718, - 2623)
                elseif p289 == 13 then
                    Name = "Prisoner [Lv. 190]"
                    QuestName = "PrisonerQuest"
                    LevelQuest = 1
                    NameMon = "Prisoner"
                    CFrameMon = CFrame.new(5411, 96, 690)
                    VectorMon = Vector3.new(5411, 96, 690)
                    CFrameQuest = CFrame.new(5308, 2, 474)
                    VectorQuest = Vector3.new(5308, 2, 474)
                elseif p289 == 14 then
                    Name = "Dangerous Prisoner [Lv. 210]"
                    QuestName = "PrisonerQuest"
                    LevelQuest = 2
                    NameMon = "Dangerous Prisoner"
                    CFrameMon = CFrame.new(5411, 96, 690)
                    VectorMon = Vector3.new(5411, 96, 690)
                    CFrameQuest = CFrame.new(5308, 2, 474)
                    VectorQuest = Vector3.new(5308, 2, 474)
                elseif p289 == 15 then
                    Name = "Toga Warrior [Lv. 250]"
                    QuestName = "ColosseumQuest"
                    LevelQuest = 1
                    NameMon = "Toga Warrior"
                    CFrameMon = CFrame.new(- 1770, 8, - 2777)
                    VectorMon = Vector3.new(- 1770, 8, - 2777)
                    CFrameQuest = CFrame.new(- 1576, 8, - 2985)
                    VectorQuest = Vector3.new(- 1576, 8, - 2985)
                elseif p289 == 16 then
                    Name = "Military Soldier [Lv. 300]"
                    QuestName = "MagmaQuest"
                    LevelQuest = 1
                    NameMon = "Military Soldier"
                    CFrameMon = CFrame.new(- 5408, 11, 8447)
                    VectorMon = Vector3.new(- 5408, 11, 8447)
                    CFrameQuest = CFrame.new(- 5316, 12, 8517)
                    VectorQuest = Vector3.new(- 5316, 12, 8517)
                elseif p289 == 17 then
                    Name = "Military Spy [Lv. 325]"
                    QuestName = "MagmaQuest"
                    LevelQuest = 2
                    NameMon = "Military Spy"
                    CFrameMon = CFrame.new(- 5815, 84, 8820)
                    VectorMon = Vector3.new(- 5815, 84, 8820)
                    CFrameQuest = CFrame.new(- 5316, 12, 8517)
                    VectorQuest = Vector3.new(- 5316, 12, 8517)
                elseif p289 == 18 then
                    Name = "Fishman Warrior [Lv. 375]"
                    QuestName = "FishmanQuest"
                    LevelQuest = 1
                    NameMon = "Fishman Warrior"
                    CFrameMon = CFrame.new(60859, 19, 1501)
                    VectorMon = Vector3.new(60859, 19, 1501)
                    CFrameQuest = CFrame.new(61123, 19, 1569)
                    VectorQuest = Vector3.new(61123, 19, 1569)
                elseif p289 == 19 then
                    Name = "Fishman Commando [Lv. 400]"
                    QuestName = "FishmanQuest"
                    LevelQuest = 2
                    NameMon = "Fishman Commando"
                    CFrameMon = CFrame.new(61891, 19, 1470)
                    VectorMon = Vector3.new(61891, 19, 1470)
                    CFrameQuest = CFrame.new(61123, 19, 1569)
                    VectorQuest = Vector3.new(61123, 19, 1569)
                elseif p289 == 20 then
                    Name = "God\'s Guard [Lv. 450]"
                    QuestName = "SkyExp1Quest"
                    LevelQuest = 1
                    NameMon = "God\'s Guards"
                    CFrameMon = CFrame.new(- 4698, 845, - 1912)
                    VectorMon = Vector3.new(- 4698, 845, - 1912)
                    CFrameQuest = CFrame.new(- 4722, 845, - 1954)
                    VectorQuest = Vector3.new(- 4722, 846, - 1954)
                elseif p289 == 21 then
                    Name = "Shanda [Lv. 475]"
                    QuestName = "SkyExp1Quest"
                    LevelQuest = 2
                    NameMon = "Shandas"
                    CFrameMon = CFrame.new(- 7685, 5567, - 502)
                    VectorMon = Vector3.new(- 7685, 5567, - 502)
                    CFrameQuest = CFrame.new(- 7862, 5546, - 380)
                    VectorQuest = Vector3.new(- 7862, 5546, - 380)
                elseif p289 == 22 then
                    Name = "Royal Squad [Lv. 525]"
                    QuestName = "SkyExp2Quest"
                    LevelQuest = 1
                    NameMon = "Royal Squad"
                    CFrameMon = CFrame.new(- 7670, 5607, - 1460)
                    VectorMon = Vector3.new(- 7670, 5607, - 1460)
                    CFrameQuest = CFrame.new(- 7904, 5636, - 1412)
                    VectorQuest = Vector3.new(- 7904, 5636, - 1412)
                elseif p289 == 23 then
                    Name = "Royal Soldier [Lv. 550]"
                    QuestName = "SkyExp2Quest"
                    LevelQuest = 2
                    NameMon = "Royal Soldier"
                    CFrameMon = CFrame.new(- 7828, 5607, - 1744)
                    VectorMon = Vector3.new(- 7828, 5607, - 1744)
                    CFrameQuest = CFrame.new(- 7904, 5636, - 1412)
                    VectorQuest = Vector3.new(- 7904, 5636, - 1412)
                elseif p289 == 24 then
                    Name = "Galley Pirate [Lv. 625]"
                    QuestName = "FountainQuest"
                    LevelQuest = 1
                    NameMon = "Galley Pirate"
                    CFrameMon = CFrame.new(5589, 45, 3996)
                    VectorMon = Vector3.new(5589, 45, 3996)
                    CFrameQuest = CFrame.new(5256, 39, 4050)
                    VectorQuest = Vector3.new(5256, 39, 4050)
                elseif p289 == 25 then
                    Name = "Galley Captain [Lv. 650]"
                    QuestName = "FountainQuest"
                    LevelQuest = 2
                    NameMon = "Galley Captain"
                    CFrameMon = CFrame.new(5649, 39, 4936)
                    VectorMon = Vector3.new(5649, 39, 4936)
                    CFrameQuest = CFrame.new(5256, 39, 4050)
                    VectorQuest = Vector3.new(5256, 39, 4050)
                end
            end
            if World2 then
                if p289 == 1 then
                    Name = "Raider [Lv. 700]"
                    QuestName = "Area1Quest"
                    LevelQuest = 1
                    NameMon = "Raider"
                    CFrameQuest = CFrame.new(- 425, 73, 1837)
                    VectorQuest = Vector3.new(- 425, 73, 1837)
                    CFrameMon = CFrame.new(- 746, 39, 2390)
                    VectorMon = Vector3.new(- 746, 39, 2389)
                elseif p289 == 2 then
                    Name = "Mercenary [Lv. 725]"
                    QuestName = "Area1Quest"
                    LevelQuest = 2
                    NameMon = "Mercenary"
                    CFrameQuest = CFrame.new(- 425, 73, 1837)
                    VectorQuest = Vector3.new(- 425, 73, 1837)
                    CFrameMon = CFrame.new(- 874, 141, 1312)
                    VectorMon = Vector3.new(- 874, 141, 1312)
                elseif p289 == 3 then
                    Name = "Swan Pirate [Lv. 775]"
                    QuestName = "Area2Quest"
                    LevelQuest = 1
                    NameMon = "Swan Pirate"
                    CFrameQuest = CFrame.new(634, 73, 918)
                    VectorQuest = Vector3.new(634, 73, 918)
                    CFrameMon = CFrame.new(878, 122, 1235)
                    VectorMon = Vector3.new(878, 122, 1235)
                elseif p289 == 4 then
                    Name = "Factory Staff [Lv. 800]"
                    QuestName = "Area2Quest"
                    LevelQuest = 2
                    NameMon = "Factory Staff"
                    CFrameQuest = CFrame.new(634, 73, 918)
                    VectorQuest = Vector3.new(634, 73, 918)
                    CFrameMon = CFrame.new(295, 73, - 56)
                    VectorMon = Vector3.new(295, 73, - 56)
                elseif p289 == 5 then
                    Name = "Marine Lieutenant [Lv. 875]"
                    QuestName = "MarineQuest3"
                    LevelQuest = 1
                    NameMon = "Marine Lieutenant"
                    CFrameMon = CFrame.new(- 2806, 73, - 3038)
                    VectorMon = Vector3.new(- 2806, 73, - 3038)
                    CFrameQuest = CFrame.new(- 2443, 73, - 3219)
                    VectorQuest = Vector3.new(- 2443, 73, - 3219)
                elseif p289 == 6 then
                    Name = "Marine Captain [Lv. 900]"
                    QuestName = "MarineQuest3"
                    LevelQuest = 2
                    NameMon = "Marine Captain"
                    CFrameMon = CFrame.new(- 1869, 73, - 3320)
                    VectorMon = Vector3.new(- 1869, 73, - 3320)
                    CFrameQuest = CFrame.new(- 2443, 73, - 3219)
                    VectorQuest = Vector3.new(- 2443, 73, - 3219)
                elseif p289 == 7 then
                    Name = "Zombie [Lv. 950]"
                    QuestName = "ZombieQuest"
                    LevelQuest = 1
                    NameMon = "Zombie"
                    CFrameMon = CFrame.new(- 5736, 126, - 728)
                    VectorMon = Vector3.new(- 5736, 126, - 728)
                    CFrameQuest = CFrame.new(- 5494, 49, - 795)
                    VectorQuest = Vector3.new(- 5494, 49, - 794)
                elseif p289 == 8 then
                    Name = "Vampire [Lv. 975]"
                    QuestName = "ZombieQuest"
                    LevelQuest = 2
                    NameMon = "Vampire"
                    CFrameMon = CFrame.new(- 6033, 7, - 1317)
                    VectorMon = Vector3.new(- 6033, 7, - 1317)
                    CFrameQuest = CFrame.new(- 5494, 49, - 795)
                    VectorQuest = Vector3.new(- 5494, 49, - 795)
                elseif p289 == 9 then
                    Name = "Snow Trooper [Lv. 1000]"
                    QuestName = "SnowMountainQuest"
                    LevelQuest = 1
                    NameMon = "Snow Trooper"
                    CFrameMon = CFrame.new(478, 402, - 5362)
                    VectorMon = Vector3.new(478, 402, - 5362)
                    CFrameQuest = CFrame.new(605, 402, - 5371)
                    VectorQuest = Vector3.new(605, 402, - 5371)
                elseif p289 ~= 10 then
                    if p289 ~= 11 then
                        if p289 ~= 12 then
                            if p289 ~= 13 then
                                if p289 ~= 14 then
                                    if p289 ~= 15 then
                                        if p289 ~= 16 then
                                            if p289 ~= 17 then
                                                if p289 ~= 18 then
                                                    if p289 ~= 19 then
                                                        if p289 ~= 20 then
                                                            if p289 ~= 21 then
                                                                if p289 == 22 then
                                                                    Name = "Water Fighter [Lv. 1450]"
                                                                    QuestName = "ForgottenQuest"
                                                                    LevelQuest = 2
                                                                    NameMon = "Water Fighter"
                                                                    CFrameMon = CFrame.new(- 3385, 239, - 10542)
                                                                    VectorMon = Vector3.new(- 3385, 239, - 10542)
                                                                    CFrameQuest = CFrame.new(- 3054, 237, - 10148)
                                                                    VectorQuest = Vector3.new(- 3054, 237, - 10148)
                                                                end
                                                            else
                                                                Name = "Sea Soldier [Lv. 1425]"
                                                                QuestName = "ForgottenQuest"
                                                                LevelQuest = 1
                                                                NameMon = "Sea Soldier"
                                                                CFrameMon = CFrame.new(- 3022, 16, - 9722)
                                                                VectorMon = Vector3.new(- 3022, 16, - 9722)
                                                                CFrameQuest = CFrame.new(- 3054, 237, - 10148)
                                                                VectorQuest = Vector3.new(- 3054, 237, - 10148)
                                                            end
                                                        else
                                                            Name = "Snow Lurker [Lv. 1375]"
                                                            QuestName = "FrostQuest"
                                                            LevelQuest = 2
                                                            NameMon = "Snow Lurker"
                                                            CFrameMon = CFrame.new(5560, 42, - 6826)
                                                            VectorMon = Vector3.new(5560, 42, - 6826)
                                                            VectorQuest = Vector3.new(5669, 28, - 6482)
                                                            CFrameQuest = CFrame.new(5669, 28, - 6482)
                                                        end
                                                    else
                                                        Name = "Arctic Warrior [Lv. 1350]"
                                                        QuestName = "FrostQuest"
                                                        LevelQuest = 1
                                                        NameMon = "Arctic Warrior"
                                                        CFrameMon = CFrame.new(6038, 29, - 6231)
                                                        VectorMon = Vector3.new(6038, 29, - 6231)
                                                        VectorQuest = Vector3.new(5669, 28, - 6482)
                                                        CFrameQuest = CFrame.new(5669, 28, - 6482)
                                                    end
                                                else
                                                    Name = "Ship Officer [Lv. 1325]"
                                                    QuestName = "ShipQuest2"
                                                    LevelQuest = 2
                                                    NameMon = "Ship Officer"
                                                    CFrameMon = CFrame.new(916, 181, 33335)
                                                    VectorMon = Vector3.new(916, 181, 33335)
                                                    CFrameQuest = CFrame.new(969, 125, 33245)
                                                    VectorQuest = Vector3.new(969, 125, 33245)
                                                end
                                            else
                                                Name = "Ship Steward [Lv. 1300]"
                                                QuestName = "ShipQuest2"
                                                LevelQuest = 1
                                                NameMon = "Ship Steward"
                                                CFrameMon = CFrame.new(915, 130, 33419)
                                                VectorMon = Vector3.new(915, 130, 33419)
                                                CFrameQuest = CFrame.new(969, 125, 33245)
                                                VectorQuest = Vector3.new(969, 125, 33245)
                                            end
                                        else
                                            Name = "Ship Engineer [Lv. 1275]"
                                            QuestName = "ShipQuest1"
                                            LevelQuest = 2
                                            NameMon = "Ship Engineer"
                                            CFrameMon = CFrame.new(918, 44, 32787)
                                            VectorMon = Vector3.new(918, 44, 32787)
                                            CFrameQuest = CFrame.new(1038, 125, 32913)
                                            VectorQuest = Vector3.new(1038, 125, 32913)
                                        end
                                    else
                                        Name = "Ship Deckhand [Lv. 1250]"
                                        QuestName = "ShipQuest1"
                                        LevelQuest = 1
                                        NameMon = "Ship Deckhand"
                                        CFrameMon = CFrame.new(1198, 126, 33031)
                                        VectorMon = Vector3.new(1198, 126, 33031)
                                        CFrameQuest = CFrame.new(1038, 125, 32913)
                                        VectorQuest = Vector3.new(1038, 125, 32913)
                                    end
                                else
                                    Name = "Lava Pirate [Lv. 1200]"
                                    QuestName = "FireSideQuest"
                                    LevelQuest = 2
                                    NameMon = "Lava Pirate"
                                    CFrameMon = CFrame.new(- 5270, 42, - 4800)
                                    VectorMon = Vector3.new(- 5270, 42, - 4800)
                                    CFrameQuest = CFrame.new(- 5430, 16, - 5295)
                                    VectorQuest = Vector3.new(- 5430, 16, - 5296)
                                end
                            else
                                Name = "Magma Ninja [Lv. 1175]"
                                QuestName = "FireSideQuest"
                                LevelQuest = 1
                                NameMon = "Magma Ninja"
                                CFrameMon = CFrame.new(- 5428, 78, - 5959)
                                VectorMon = Vector3.new(- 5428, 78, - 5959)
                                CFrameQuest = CFrame.new(- 5430, 16, - 5295)
                                VectorQuest = Vector3.new(- 5430, 16, - 5296)
                            end
                        else
                            Name = "Horned Warrior [Lv. 1125]"
                            QuestName = "IceSideQuest"
                            LevelQuest = 2
                            NameMon = "Horned Warrior"
                            CFrameMon = CFrame.new(- 6406, 24, - 5805)
                            VectorMon = Vector3.new(- 6406, 24, - 5805)
                            CFrameQuest = CFrame.new(- 6060, 16, - 4905)
                            VectorQuest = Vector3.new(- 6060, 16, - 4905)
                        end
                    else
                        Name = "Lab Subordinate [Lv. 1100]"
                        QuestName = "IceSideQuest"
                        LevelQuest = 1
                        NameMon = "Lab Subordinate"
                        CFrameMon = CFrame.new(- 5782, 42, - 4484)
                        VectorMon = Vector3.new(- 5782, 42, - 4484)
                        CFrameQuest = CFrame.new(- 6060, 16, - 4905)
                        VectorQuest = Vector3.new(- 6060, 16, - 4905)
                    end
                else
                    Name = "Winter Warrior [Lv. 1050]"
                    QuestName = "SnowMountainQuest"
                    LevelQuest = 2
                    NameMon = "Winter Warrior"
                    CFrameMon = CFrame.new(1157, 430, - 5188)
                    VectorMon = Vector3.new(1157, 430, - 5188)
                    CFrameQuest = CFrame.new(605, 402, - 5371)
                    VectorQuest = Vector3.new(605, 402, - 5371)
                end
            end
            if World3 then
                if p289 ~= 1 then
                    if p289 ~= 2 then
                        if p289 ~= 3 then
                            if p289 ~= 4 then
                                if p289 ~= 5 then
                                    if p289 ~= 6 then
                                        if p289 ~= 7 then
                                            if p289 ~= 8 then
                                                if p289 ~= 9 then
                                                    if p289 ~= 10 then
                                                        if p289 ~= 11 then
                                                            if p289 ~= 12 then
                                                                if p289 ~= 13 then
                                                                    if p289 ~= 14 then
                                                                        if p289 ~= 15 then
                                                                            if p289 ~= 16 then
                                                                                if p289 ~= 17 then
                                                                                    if p289 ~= 18 then
                                                                                        if p289 ~= 19 then
                                                                                            if p289 ~= 20 then
                                                                                                if p289 ~= 21 then
                                                                                                    if p289 ~= 22 then
                                                                                                        if p289 ~= 23 then
                                                                                                            if p289 ~= 24 then
                                                                                                                if p289 ~= 25 then
                                                                                                                    if p289 ~= 26 then
                                                                                                                        if p289 ~= 27 then
                                                                                                                            if p289 ~= 28 then
                                                                                                                                if p289 ~= 29 then
                                                                                                                                    if p289 ~= 30 then
                                                                                                                                        if p289 ~= 31 then
                                                                                                                                            if p289 == 32 then
                                                                                                                                                Name = "Snow Demon [Lv. 2425]"
                                                                                                                                                QuestName = "CandyQuest1"
                                                                                                                                                LevelQuest = 2
                                                                                                                                                NameMon = "Snow Demon"
                                                                                                                                                CFrameMon = CFrame.new(- 941.1054077148438, 56.978214263916016, - 14539.7060546875)
                                                                                                                                                VectorMon = CFrame.new(- 941.1054077148438, 56.978214263916016, - 14539.7060546875)
                                                                                                                                                CFrameQuest = CFrame.new(- 1147.584716796875, 16.232574462890625, - 14445.6279296875)
                                                                                                                                                VectorQuest = Vector3.new(- 1147.584716796875, 16.232574462890625, - 14445.6279296875)
                                                                                                                                            end
                                                                                                                                        else
                                                                                                                                            Name = "Candy Pirate [Lv. 2400]"
                                                                                                                                            QuestName = "CandyQuest1"
                                                                                                                                            LevelQuest = 1
                                                                                                                                            NameMon = "Candy Pirate"
                                                                                                                                            CFrameMon = CFrame.new(- 1423.4515380859375, 116.5498275756836, - 14603.890625)
                                                                                                                                            VectorMon = CFrame.new(- 1423.4515380859375, 116.5498275756836, - 14603.890625)
                                                                                                                                            CFrameQuest = CFrame.new(- 1147.584716796875, 16.232574462890625, - 14445.6279296875)
                                                                                                                                            VectorQuest = Vector3.new(- 1147.584716796875, 16.232574462890625, - 14445.6279296875)
                                                                                                                                        end
                                                                                                                                    else
                                                                                                                                        Name = "Candy Rebel [Lv. 2375]"
                                                                                                                                        QuestName = "ChocQuest2"
                                                                                                                                        LevelQuest = 2
                                                                                                                                        NameMon = "Candy Rebel"
                                                                                                                                        CFrameMon = CFrame.new(134, 77, - 12882)
                                                                                                                                        VectorMon = CFrame.new(134, 77, - 12882)
                                                                                                                                        CFrameQuest = CFrame.new(151, 23, - 12774)
                                                                                                                                        VectorQuest = Vector3.new(151, 23, - 12774)
                                                                                                                                    end
                                                                                                                                else
                                                                                                                                    Name = "Sweet Thief [Lv. 2350]"
                                                                                                                                    QuestName = "ChocQuest2"
                                                                                                                                    LevelQuest = 1
                                                                                                                                    NameMon = "Sweet Thief"
                                                                                                                                    CFrameMon = CFrame.new(71, 77, - 12632)
                                                                                                                                    VectorMon = CFrame.new(71, 77, - 12632)
                                                                                                                                    CFrameQuest = CFrame.new(151, 23, - 12774)
                                                                                                                                    VectorQuest = Vector3.new(151, 23, - 12774)
                                                                                                                                end
                                                                                                                            else
                                                                                                                                Name = "Chocolate Bar Battler [Lv. 2325]"
                                                                                                                                QuestName = "ChocQuest1"
                                                                                                                                LevelQuest = 2
                                                                                                                                NameMon = "Chocolate Bar Battler"
                                                                                                                                CFrameMon = CFrame.new(231, 23, - 12194)
                                                                                                                                VectorMon = CFrame.new(231, 23, - 12194)
                                                                                                                                CFrameQuest = CFrame.new(231, 23, - 12194)
                                                                                                                                VectorQuest = Vector3.new(231, 23, - 12194)
                                                                                                                            end
                                                                                                                        else
                                                                                                                            Name = "Cocoa Warrior [Lv. 2300]"
                                                                                                                            QuestName = "ChocQuest1"
                                                                                                                            LevelQuest = 1
                                                                                                                            NameMon = "Cocoa Warrior"
                                                                                                                            CFrameMon = CFrame.new(231, 23, - 12194)
                                                                                                                            VectorMon = CFrame.new(231, 23, - 12194)
                                                                                                                            CFrameQuest = CFrame.new(231, 23, - 12194)
                                                                                                                            VectorQuest = Vector3.new(231, 23, - 12194)
                                                                                                                        end
                                                                                                                    else
                                                                                                                        Name = "Head Baker [Lv. 2275]"
                                                                                                                        QuestName = "CakeQuest2"
                                                                                                                        LevelQuest = 2
                                                                                                                        NameMon = "Head Baker"
                                                                                                                        CFrameMon = CFrame.new(- 1926, 88, - 12850)
                                                                                                                        VectorMon = CFrame.new(- 1870, 38, - 12938)
                                                                                                                        CFrameQuest = CFrame.new(- 1926, 38, - 12850)
                                                                                                                        VectorQuest = Vector3.new(- 1926, 38, - 12850)
                                                                                                                    end
                                                                                                                else
                                                                                                                    Name = "Baking Staff [Lv. 2250]"
                                                                                                                    QuestName = "CakeQuest2"
                                                                                                                    LevelQuest = 1
                                                                                                                    NameMon = "Baking Staff"
                                                                                                                    CFrameMon = CFrame.new(- 1870, 38, - 12938)
                                                                                                                    VectorMon = Vector3.new(- 1870, 38, - 12938)
                                                                                                                    CFrameQuest = CFrame.new(- 1926, 38, - 12850)
                                                                                                                    VectorQuest = Vector3.new(- 1926, 38, - 12850)
                                                                                                                end
                                                                                                            else
                                                                                                                Name = "Cake Guard [Lv. 2225]"
                                                                                                                QuestName = "CakeQuest1"
                                                                                                                LevelQuest = 2
                                                                                                                NameMon = "Cake Guard"
                                                                                                                CFrameMon = CFrame.new(- 1651, 38, - 12308)
                                                                                                                VectorMon = Vector3.new(- 1651, 38, - 12308)
                                                                                                                CFrameQuest = CFrame.new(- 2020, 38, - 12025)
                                                                                                                VectorQuest = Vector3.new(- 2020, 38, - 12025)
                                                                                                            end
                                                                                                        else
                                                                                                            Name = "Cookie Crafter [Lv. 2200]"
                                                                                                            QuestName = "CakeQuest1"
                                                                                                            LevelQuest = 1
                                                                                                            NameMon = "Cookie Crafter"
                                                                                                            CFrameMon = CFrame.new(- 2365, 38, - 12099)
                                                                                                            VectorMon = Vector3.new(- 2365, 38, - 12099)
                                                                                                            CFrameQuest = CFrame.new(- 2020, 38, - 12025)
                                                                                                            VectorQuest = Vector3.new(- 2020, 38, - 12025)
                                                                                                        end
                                                                                                    else
                                                                                                        Name = "Ice Cream Commander [Lv. 2150]"
                                                                                                        QuestName = "IceCreamIslandQuest"
                                                                                                        LevelQuest = 2
                                                                                                        NameMon = "Ice Cream Commander"
                                                                                                        CFrameMon = CFrame.new(- 641, 127, - 11062)
                                                                                                        VectorMon = Vector3.new(- 641, 127, - 11062)
                                                                                                        CFrameQuest = CFrame.new(- 822, 66, - 10965)
                                                                                                        VectorQuest = Vector3.new(- 822, 66, - 10965)
                                                                                                    end
                                                                                                else
                                                                                                    Name = "Ice Cream Chef [Lv. 2125]"
                                                                                                    QuestName = "IceCreamIslandQuest"
                                                                                                    LevelQuest = 1
                                                                                                    NameMon = "Ice Cream Chef"
                                                                                                    CFrameMon = CFrame.new(- 641, 127, - 11062)
                                                                                                    VectorMon = Vector3.new(- 641, 127, - 11062)
                                                                                                    CFrameQuest = CFrame.new(- 822, 66, - 10965)
                                                                                                    VectorQuest = Vector3.new(- 822, 66, - 10965)
                                                                                                end
                                                                                            else
                                                                                                Name = "Peanut President [Lv. 2100]"
                                                                                                QuestName = "NutsIslandQuest"
                                                                                                LevelQuest = 2
                                                                                                NameMon = "Peanut President"
                                                                                                CFrameMon = CFrame.new(- 2124, 123, - 10435)
                                                                                                VectorMon = Vector3.new(- 2124, 123, - 10435)
                                                                                                CFrameQuest = CFrame.new(- 2104, 38, - 10192)
                                                                                                VectorQuest = Vector3.new(- 2104, 38, - 10192)
                                                                                            end
                                                                                        else
                                                                                            Name = "Peanut Scout [Lv. 2075]"
                                                                                            QuestName = "NutsIslandQuest"
                                                                                            LevelQuest = 1
                                                                                            NameMon = "Peanut Scout"
                                                                                            CFrameMon = CFrame.new(- 2124, 123, - 10435)
                                                                                            VectorMon = Vector3.new(- 2124, 123, - 10435)
                                                                                            CFrameQuest = CFrame.new(- 2104, 38, - 10192)
                                                                                            VectorQuest = Vector3.new(- 2104, 38, - 10192)
                                                                                        end
                                                                                    else
                                                                                        Name = "Posessed Mummy [Lv. 2050]"
                                                                                        QuestName = "HauntedQuest2"
                                                                                        LevelQuest = 2
                                                                                        NameMon = "Posessed Mummy"
                                                                                        CFrameMon = CFrame.new(- 9577, 6, 6223)
                                                                                        VectorMon = Vector3.new(- 9577, 6, 6223)
                                                                                        CFrameQuest = CFrame.new(- 9513, 172, 6079)
                                                                                        VectorQuest = Vector3.new(- 9513, 172, 6079)
                                                                                    end
                                                                                else
                                                                                    Name = "Demonic Soul [Lv. 2025]"
                                                                                    QuestName = "HauntedQuest2"
                                                                                    LevelQuest = 1
                                                                                    NameMon = "Demonic Soul"
                                                                                    CFrameMon = CFrame.new(- 9507, 172, 6158)
                                                                                    VectorMon = Vector3.new(- 9506, 172, 6158)
                                                                                    CFrameQuest = CFrame.new(- 9513, 172, 6079)
                                                                                    VectorQuest = Vector3.new(- 9513, 172, 6079)
                                                                                end
                                                                            else
                                                                                Name = "Living Zombie [Lv. 2000]"
                                                                                QuestName = "HauntedQuest1"
                                                                                LevelQuest = 2
                                                                                NameMon = "Living Zombie"
                                                                                CFrameMon = CFrame.new(- 10144, 140, 5932)
                                                                                VectorMon = Vector3.new(- 10144, 140, 5932)
                                                                                CFrameQuest = CFrame.new(- 9482, 142, 5567)
                                                                                VectorQuest = Vector3.new(- 9482, 142, 5567)
                                                                            end
                                                                        else
                                                                            Name = "Reborn Skeleton [Lv. 1975]"
                                                                            QuestName = "HauntedQuest1"
                                                                            LevelQuest = 1
                                                                            NameMon = "Reborn Skeleton"
                                                                            CFrameMon = CFrame.new(- 8760, 142, 6039)
                                                                            VectorMon = Vector3.new(- 8760, 142, 6039)
                                                                            CFrameQuest = CFrame.new(- 9482, 142, 5567)
                                                                            VectorQuest = Vector3.new(- 9482, 142, 5567)
                                                                        end
                                                                    else
                                                                        Name = "Musketeer Pirate [Lv. 1925]"
                                                                        QuestName = "DeepForestIsland2"
                                                                        LevelQuest = 2
                                                                        NameMon = "Musketeer Pirate"
                                                                        CFrameMon = CFrame.new(- 13286, 392, - 9769)
                                                                        VectorMon = Vector3.new(- 13286, 392, - 9768)
                                                                        CFrameQuest = CFrame.new(- 12684, 391, - 9902)
                                                                        VectorQuest = Vector3.new(- 12684, 391, - 9902)
                                                                    end
                                                                else
                                                                    Name = "Jungle Pirate [Lv. 1900]"
                                                                    QuestName = "DeepForestIsland2"
                                                                    LevelQuest = 1
                                                                    NameMon = "Jungle Pirate"
                                                                    CFrameMon = CFrame.new(- 12107, 332, - 10549)
                                                                    VectorMon = Vector3.new(- 12106, 332, - 10549)
                                                                    CFrameQuest = CFrame.new(- 12684, 391, - 9902)
                                                                    VectorQuest = Vector3.new(- 12684, 391, - 9902)
                                                                end
                                                            else
                                                                Name = "Mythological Pirate [Lv. 1850]"
                                                                QuestName = "DeepForestIsland"
                                                                LevelQuest = 2
                                                                NameMon = "Mythological Pirate"
                                                                CFrameMon = CFrame.new(- 13545, 470, - 6917)
                                                                VectorMon = Vector3.new(- 13545, 470, - 6917)
                                                                CFrameQuest = CFrame.new(- 13232, 333, - 7627)
                                                                VectorQuest = Vector3.new(- 13232, 333, - 7627)
                                                            end
                                                        else
                                                            Name = "Forest Pirate [Lv. 1825]"
                                                            QuestName = "DeepForestIsland"
                                                            LevelQuest = 1
                                                            NameMon = "Forest Pirate"
                                                            CFrameMon = CFrame.new(- 13479, 333, - 7905)
                                                            VectorMon = Vector3.new(- 13479, 333, - 7905)
                                                            CFrameQuest = CFrame.new(- 13232, 333, - 7627)
                                                            VectorQuest = Vector3.new(- 13232, 333, - 7627)
                                                        end
                                                    else
                                                        Name = "Fishman Captain [Lv. 1800]"
                                                        QuestName = "DeepForestIsland3"
                                                        LevelQuest = 2
                                                        NameMon = "Fishman Captain"
                                                        CFrameMon = CFrame.new(- 10993, 332, - 8940)
                                                        VectorMon = Vector3.new(- 10993, 332, - 8940)
                                                        CFrameQuest = CFrame.new(- 10584, 332, - 8758)
                                                        VectorQuest = Vector3.new(- 10584, 332, - 8758)
                                                    end
                                                else
                                                    Name = "Fishman Raider [Lv. 1775]"
                                                    QuestName = "DeepForestIsland3"
                                                    LevelQuest = 1
                                                    NameMon = "Fishman Raider"
                                                    CFrameMon = CFrame.new(- 10560, 332, - 8466)
                                                    VectorMon = Vector3.new(- 10560, 332, - 8466)
                                                    CFrameQuest = CFrame.new(- 10584, 332, - 8758)
                                                    VectorQuest = Vector3.new(- 10584, 332, - 8758)
                                                end
                                            else
                                                Name = "Marine Rear Admiral [Lv. 1725]"
                                                QuestName = "MarineTreeIsland"
                                                LevelQuest = 2
                                                NameMon = "Marine Rear Admiral"
                                                CFrameMon = CFrame.new(3671, 161, - 6932)
                                                VectorMon = Vector3.new(3671, 161, - 6932)
                                                CFrameQuest = CFrame.new(2180, 29, - 6737)
                                                VectorQuest = Vector3.new(2180, 29, - 6737)
                                            end
                                        else
                                            Name = "Marine Commodore [Lv. 1700]"
                                            QuestName = "MarineTreeIsland"
                                            LevelQuest = 1
                                            NameMon = "Marine Commodore"
                                            CFrameMon = CFrame.new(2447, 73, - 7470)
                                            VectorMon = Vector3.new(2447, 73, - 7470)
                                            CFrameQuest = CFrame.new(2180, 29, - 6737)
                                            VectorQuest = Vector3.new(2180, 29, - 6737)
                                        end
                                    else
                                        Name = "Giant Islander [Lv. 1650]"
                                        QuestName = "AmazonQuest2"
                                        LevelQuest = 2
                                        NameMon = "Giant Islanders"
                                        CFrameMon = CFrame.new(4951, 602, - 68)
                                        VectorMon = Vector3.new(4951, 602, - 68)
                                        CFrameQuest = CFrame.new(5443, 602, 751)
                                        VectorQuest = Vector3.new(5443, 602, 751)
                                    end
                                else
                                    Name = "Female Islander [Lv. 1625]"
                                    QuestName = "AmazonQuest2"
                                    LevelQuest = 1
                                    NameMon = "Female"
                                    CFrameMon = CFrame.new(5308, 819, 1047)
                                    VectorMon = Vector3.new(5308, 819, 1047)
                                    CFrameQuest = CFrame.new(5443, 602, 751)
                                    VectorQuest = Vector3.new(5443, 602, 751)
                                end
                            else
                                Name = "Dragon Crew Archer [Lv. 1600]"
                                QuestName = "AmazonQuest"
                                LevelQuest = 2
                                NameMon = "Archer"
                                CFrameMon = CFrame.new(6594, 383, 139)
                                VectorMon = Vector3.new(6594, 383, 139)
                                CFrameQuest = CFrame.new(5835, 52, - 1105)
                                VectorQuest = Vector3.new(5835, 52, - 1105)
                            end
                        else
                            Name = "Dragon Crew Warrior [Lv. 1575]"
                            QuestName = "AmazonQuest"
                            LevelQuest = 1
                            NameMon = "Warrior"
                            CFrameMon = CFrame.new(6339, 52, - 1213)
                            VectorMon = Vector3.new(6338, 52, - 1213)
                            CFrameQuest = CFrame.new(5835, 52, - 1105)
                            VectorQuest = Vector3.new(5835, 52, - 1105)
                        end
                    else
                        Name = "Pistol Billionaire [Lv. 1525]"
                        QuestName = "PiratePortQuest"
                        LevelQuest = 2
                        NameMon = "Pistol"
                        CFrameMon = CFrame.new(- 469, 74, 5904)
                        VectorMon = Vector3.new(- 469, 74, 5904)
                        CFrameQuest = CFrame.new(- 288, 44, 5576)
                        VectorQuest = Vector3.new(- 288, 44, 5576)
                    end
                else
                    Name = "Pirate Millionaire [Lv. 1500]"
                    QuestName = "PiratePortQuest"
                    LevelQuest = 1
                    NameMon = "Pirate"
                    CFrameMon = CFrame.new(- 373, 75, 5550)
                    VectorMon = Vector3.new(- 373, 75, 5550)
                    CFrameQuest = CFrame.new(- 288, 44, 5576)
                    VectorQuest = Vector3.new(- 288, 44, 5576)
                end
            end
        end
        function CheckBossQuest()
            if _G.Settings.Boss["Select Boss"] ~= "Saber Expert [Lv. 200] [Boss]" then
                if _G.Settings.Boss["Select Boss"] ~= "The Saw [Lv. 100] [Boss]" then
                    if _G.Settings.Boss["Select Boss"] ~= "Greybeard [Lv. 750] [Raid Boss]" then
                        if _G.Settings.Boss["Select Boss"] ~= "The Gorilla King [Lv. 25] [Boss]" then
                            if _G.Settings.Boss["Select Boss"] ~= "Bobby [Lv. 55] [Boss]" then
                                if _G.Settings.Boss["Select Boss"] ~= "Yeti [Lv. 110] [Boss]" then
                                    if _G.Settings.Boss["Select Boss"] ~= "Mob Leader [Lv. 120] [Boss]" then
                                        if _G.Settings.Boss["Select Boss"] ~= "Vice Admiral [Lv. 130] [Boss]" then
                                            if _G.Settings.Boss["Select Boss"] ~= "Warden [Lv. 175] [Boss]" then
                                                if _G.Settings.Boss["Select Boss"] ~= "Chief Warden [Lv. 200] [Boss]" then
                                                    if _G.Settings.Boss["Select Boss"] ~= "Swan [Lv. 225] [Boss]" then
                                                        if _G.Settings.Boss["Select Boss"] ~= "Magma Admiral [Lv. 350] [Boss]" then
                                                            if _G.Settings.Boss["Select Boss"] ~= "Fishman Lord [Lv. 425] [Boss]" then
                                                                if _G.Settings.Boss["Select Boss"] ~= "Wysper [Lv. 500] [Boss]" then
                                                                    if _G.Settings.Boss["Select Boss"] ~= "Thunder God [Lv. 575] [Boss]" then
                                                                        if _G.Settings.Boss["Select Boss"] ~= "Cyborg [Lv. 675] [Boss]" then
                                                                            if _G.Settings.Boss["Select Boss"] ~= "Diamond [Lv. 750] [Boss]" then
                                                                                if _G.Settings.Boss["Select Boss"] ~= "Jeremy [Lv. 850] [Boss]" then
                                                                                    if _G.Settings.Boss["Select Boss"] ~= "Fajita [Lv. 925] [Boss]" then
                                                                                        if _G.Settings.Boss["Select Boss"] ~= "Don Swan [Lv. 1000] [Boss]" then
                                                                                            if _G.Settings.Boss["Select Boss"] ~= "Smoke Admiral [Lv. 1150] [Boss]" then
                                                                                                if _G.Settings.Boss["Select Boss"] ~= "Cursed Captain [Lv. 1325] [Raid Boss]" then
                                                                                                    if _G.Settings.Boss["Select Boss"] ~= "Darkbeard [Lv. 1000] [Raid Boss]" then
                                                                                                        if _G.Settings.Boss["Select Boss"] ~= "Order [Lv. 1250] [Raid Boss]" then
                                                                                                            if _G.Settings.Boss["Select Boss"] ~= "Awakened Ice Admiral [Lv. 1400] [Boss]" then
                                                                                                                if _G.Settings.Boss["Select Boss"] ~= "Tide Keeper [Lv. 1475] [Boss]" then
                                                                                                                    if _G.Settings.Boss["Select Boss"] ~= "Stone [Lv. 1550] [Boss]" then
                                                                                                                        if _G.Settings.Boss["Select Boss"] ~= "Island Empress [Lv. 1675] [Boss]" then
                                                                                                                            if _G.Settings.Boss["Select Boss"] ~= "Kilo Admiral [Lv. 1750] [Boss]" then
                                                                                                                                if _G.Settings.Boss["Select Boss"] ~= "Captain Elephant [Lv. 1875] [Boss]" then
                                                                                                                                    if _G.Settings.Boss["Select Boss"] ~= "Beautiful Pirate [Lv. 1950] [Boss]" then
                                                                                                                                        if _G.Settings.Boss["Select Boss"] ~= "Cake Queen [Lv. 2175] [Boss]" then
                                                                                                                                            if _G.Settings.Boss["Select Boss"] ~= "rip_indra True Form [Lv. 5000] [Raid Boss]" then
                                                                                                                                                if _G.Settings.Boss["Select Boss"] ~= "Longma [Lv. 2000] [Boss]" then
                                                                                                                                                    if _G.Settings.Boss["Select Boss"] == "Soul Reaper [Lv. 2100] [Raid Boss]" then
                                                                                                                                                        MsBoss = "Soul Reaper [Lv. 2100] [Raid Boss]"
                                                                                                                                                        NameBoss = "Soul Reaper"
                                                                                                                                                        CFrameBoss = CFrame.new(- 9515.62109, 315.925537, 6691.12012)
                                                                                                                                                    end
                                                                                                                                                else
                                                                                                                                                    MsBoss = "Longma [Lv. 2000] [Boss]"
                                                                                                                                                    NameBoss = "Longma"
                                                                                                                                                    CFrameBoss = CFrame.new(- 10248.3936, 353.79129, - 9306.34473)
                                                                                                                                                end
                                                                                                                                            else
                                                                                                                                                MsBoss = "rip_indra True Form [Lv. 5000] [Raid Boss]"
                                                                                                                                                NameBoss = "rip_indra True Form"
                                                                                                                                                CFrameBoss = CFrame.new(- 5359, 424, - 2735)
                                                                                                                                            end
                                                                                                                                        else
                                                                                                                                            MsBoss = "Cake Queen [Lv. 2175] [Boss]"
                                                                                                                                            NameBoss = "Cake Queen"
                                                                                                                                            NameQuestBoss = "IceCreamIslandQuest"
                                                                                                                                            LevelQuestBoss = 3
                                                                                                                                            CFrameQuestBoss = CFrame.new(- 716, 382, - 11010)
                                                                                                                                            CFrameBoss = CFrame.new(- 821, 66, - 10965)
                                                                                                                                        end
                                                                                                                                    else
                                                                                                                                        MsBoss = "Beautiful Pirate [Lv. 1950] [Boss]"
                                                                                                                                        NameBoss = "Beautiful Pirate"
                                                                                                                                        NameQuestBoss = "DeepForestIsland2"
                                                                                                                                        LevelQuestBoss = 3
                                                                                                                                        CFrameQuestBoss = CFrame.new(- 12686, 391, - 9902)
                                                                                                                                        CFrameBoss = CFrame.new(5182, 23, - 20)
                                                                                                                                    end
                                                                                                                                else
                                                                                                                                    MsBoss = "Captain Elephant [Lv. 1875] [Boss]"
                                                                                                                                    NameBoss = "Captain Elephant"
                                                                                                                                    NameQuestBoss = "DeepForestIsland"
                                                                                                                                    LevelQuestBoss = 3
                                                                                                                                    CFrameQuestBoss = CFrame.new(- 13232, 333, - 7631)
                                                                                                                                    CFrameBoss = CFrame.new(- 13221, 325, - 8405)
                                                                                                                                end
                                                                                                                            else
                                                                                                                                MsBoss = "Kilo Admiral [Lv. 1750] [Boss]"
                                                                                                                                NameBoss = "Kilo Admiral"
                                                                                                                                NameQuestBoss = "MarineTreeIsland"
                                                                                                                                LevelQuestBoss = 3
                                                                                                                                CFrameQuestBoss = CFrame.new(2178, 29, - 6737)
                                                                                                                                CFrameBoss = CFrame.new(2846, 433, - 7100)
                                                                                                                            end
                                                                                                                        else
                                                                                                                            MsBoss = "Island Empress [Lv. 1675] [Boss]"
                                                                                                                            NameBoss = "Island Empress"
                                                                                                                            NameQuestBoss = "AmazonQuest2"
                                                                                                                            LevelQuestBoss = 3
                                                                                                                            CFrameQuestBoss = CFrame.new(5443, 602, 752)
                                                                                                                            CFrameBoss = CFrame.new(5659, 602, 244)
                                                                                                                        end
                                                                                                                    else
                                                                                                                        MsBoss = "Stone [Lv. 1550] [Boss]"
                                                                                                                        NameBoss = "Stone"
                                                                                                                        NameQuestBoss = "PiratePortQuest"
                                                                                                                        LevelQuestBoss = 3
                                                                                                                        CFrameQuestBoss = CFrame.new(- 290, 44, 5577)
                                                                                                                        CFrameBoss = CFrame.new(- 1085, 40, 6779)
                                                                                                                    end
                                                                                                                else
                                                                                                                    MsBoss = "Tide Keeper [Lv. 1475] [Boss]"
                                                                                                                    NameBoss = "Tide Keeper"
                                                                                                                    NameQuestBoss = "ForgottenQuest"
                                                                                                                    LevelQuestBoss = 3
                                                                                                                    CFrameQuestBoss = CFrame.new(- 3053.89648, 236.881363, - 10148.2324, - 0.985987961, - 3.58504737e-9, 0.16681771, - 3.07832915e-9, 1, 3.29612559e-9, - 0.16681771, 2.73641976e-9, - 0.985987961)
                                                                                                                    CFrameBoss = CFrame.new(- 3570.18652, 123.328949, - 11555.9072, 0.465199202, - 1.3857326e-8, 0.885206044, 4.0332897e-9, 1, 1.35347511e-8, - 0.885206044, - 2.72606271e-9, 0.465199202)
                                                                                                                end
                                                                                                            else
                                                                                                                MsBoss = "Awakened Ice Admiral [Lv. 1400] [Boss]"
                                                                                                                NameBoss = "Awakened Ice Admiral"
                                                                                                                NameQuestBoss = "FrostQuest"
                                                                                                                LevelQuestBoss = 3
                                                                                                                CFrameQuestBoss = CFrame.new(5669.33203, 28.2118053, - 6481.55908, 0.921275556, - 1.25320829e-8, 0.388910472, 4.72230788e-8, 1, - 7.96414241e-8, - 0.388910472, 9.17372489e-8, 0.921275556)
                                                                                                                CFrameBoss = CFrame.new(6407.33936, 340.223785, - 6892.521, 0.49051559, - 5.25310213e-8, - 0.871432424, - 2.76146022e-8, 1, - 7.58250565e-8, 0.871432424, 6.12576301e-8, 0.49051559)
                                                                                                            end
                                                                                                        else
                                                                                                            MsBoss = "Order [Lv. 1250] [Raid Boss]"
                                                                                                            NameBoss = "Order"
                                                                                                            CFrameBoss = CFrame.new(- 6221.15039, 16.2351036, - 5045.23584, - 0.380726993, 7.41463495e-8, 0.924687505, 5.85604774e-8, 1, - 5.60738549e-8, - 0.924687505, 3.28013137e-8, - 0.380726993)
                                                                                                        end
                                                                                                    else
                                                                                                        MsBoss = "Darkbeard [Lv. 1000] [Raid Boss]"
                                                                                                        NameBoss = "Darkbeard"
                                                                                                        CFrameBoss = CFrame.new(3876.00366, 24.6882591, - 3820.21777, - 0.976951957, 4.97356325e-8, 0.213458836, 4.57335361e-8, 1, - 2.36868622e-8, - 0.213458836, - 1.33787044e-8, - 0.976951957)
                                                                                                    end
                                                                                                else
                                                                                                    MsBoss = "Cursed Captain [Lv. 1325] [Raid Boss]"
                                                                                                    NameBoss = "Cursed Captain"
                                                                                                    CFrameBoss = CFrame.new(916.928589, 181.092773, 33422, - 0.999505103, 9.26310495e-9, 0.0314563364, 8.42916226e-9, 1, - 2.6643713e-8, - 0.0314563364, - 2.63653774e-8, - 0.999505103)
                                                                                                end
                                                                                            else
                                                                                                MsBoss = "Smoke Admiral [Lv. 1150] [Boss]"
                                                                                                NameBoss = "Smoke Admiral"
                                                                                                NameQuestBoss = "IceSideQuest"
                                                                                                LevelQuestBoss = 3
                                                                                                CFrameQuestBoss = CFrame.new(- 6059.96191, 15.9868021, - 4904.7373, - 0.444992423, - 3.0874483e-9, 0.895534337, - 3.64098796e-8, 1, - 1.4644522e-8, - 0.895534337, - 3.91229982e-8, - 0.444992423)
                                                                                                CFrameBoss = CFrame.new(- 5115.72754, 23.7664986, - 5338.2207, 0.251453817, 1.48345061e-8, - 0.967869282, 4.02796978e-8, 1, 2.57916977e-8, 0.967869282, - 4.54708946e-8, 0.251453817)
                                                                                            end
                                                                                        else
                                                                                            MsBoss = "Don Swan [Lv. 1000] [Boss]"
                                                                                            NameBoss = "Don Swan"
                                                                                            CFrameBoss = CFrame.new(2288.802, 15.1870775, 863.034607, 0.99974072, - 8.41247214e-8, - 0.0227668174, 8.4774733e-8, 1, 2.75850098e-8, 0.0227668174, - 2.95079072e-8, 0.99974072)
                                                                                        end
                                                                                    else
                                                                                        MsBoss = "Fajita [Lv. 925] [Boss]"
                                                                                        NameBoss = "Fajita"
                                                                                        NameQuestBoss = "MarineQuest3"
                                                                                        LevelQuestBoss = 3
                                                                                        CFrameQuestBoss = CFrame.new(- 2442.65015, 73.0511475, - 3219.11523, - 0.873540044, 4.2329841e-8, - 0.486752301, 5.64383384e-8, 1, - 1.43220786e-8, 0.486752301, - 3.99823996e-8, - 0.873540044)
                                                                                        CFrameBoss = CFrame.new(- 2297.40332, 115.449463, - 3946.53833, 0.961227536, - 1.46645796e-9, - 0.275756449, - 2.3212845e-9, 1, - 1.34094433e-8, 0.275756449, 1.35296352e-8, 0.961227536)
                                                                                    end
                                                                                else
                                                                                    MsBoss = "Jeremy [Lv. 850] [Boss]"
                                                                                    NameBoss = "Jeremy"
                                                                                    NameQuestBoss = "Area2Quest"
                                                                                    LevelQuestBoss = 3
                                                                                    CFrameQuestBoss = CFrame.new(632.698608, 73.1055908, 918.666321, - 0.0319722369, 8.96074881e-10, - 0.999488771, 1.36326533e-10, 1, 8.92172336e-10, 0.999488771, - 1.07732087e-10, - 0.0319722369)
                                                                                    CFrameBoss = CFrame.new(2203.76953, 448.966034, 752.731079, - 0.0217453763, 0, - 0.999763548, 0, 1, 0, 0.999763548, 0, - 0.0217453763)
                                                                                end
                                                                            else
                                                                                MsBoss = "Diamond [Lv. 750] [Boss]"
                                                                                NameBoss = "Diamond"
                                                                                NameQuestBoss = "Area1Quest"
                                                                                LevelQuestBoss = 3
                                                                                CFrameQuestBoss = CFrame.new(- 424.080078, 73.0055847, 1836.91589, 0.253544956, - 1.42165932e-8, 0.967323601, - 6.00147771e-8, 1, 3.04272909e-8, - 0.967323601, - 6.5768397e-8, 0.253544956)
                                                                                CFrameBoss = CFrame.new(- 1736.26587, 198.627731, - 236.412857, - 0.997808516, 0, - 0.0661673471, 0, 1, 0, 0.0661673471, 0, - 0.997808516)
                                                                            end
                                                                        else
                                                                            MsBoss = "Cyborg [Lv. 675] [Boss]"
                                                                            NameBoss = "Cyborg"
                                                                            NameQuestBoss = "FountainQuest"
                                                                            LevelQuestBoss = 3
                                                                            CFrameQuestBoss = CFrame.new(5253.54834, 38.5361786, 4050.45166, - 0.0112687312, - 9.93677887e-8, - 0.999936521, 2.55291371e-10, 1, - 9.93769547e-8, 0.999936521, - 1.37512213e-9, - 0.0112687312)
                                                                            CFrameBoss = CFrame.new(6041.82813, 52.7112198, 3907.45142, - 0.563162148, 1.73805248e-9, - 0.826346457, - 5.94632716e-8, 1, 4.26280238e-8, 0.826346457, 7.31437524e-8, - 0.563162148)
                                                                        end
                                                                    else
                                                                        MsBoss = "Thunder God [Lv. 575] [Boss]"
                                                                        NameBoss = "Thunder God"
                                                                        NameQuestBoss = "SkyExp2Quest"
                                                                        LevelQuestBoss = 3
                                                                        CFrameQuestBoss = CFrame.new(- 7902.78613, 5635.99902, - 1411.98706, - 0.0361216255, - 1.16895912e-7, 0.999347389, 1.44533963e-9, 1, 1.17024491e-7, - 0.999347389, 5.6715117e-9, - 0.0361216255)
                                                                        CFrameBoss = CFrame.new(- 7917.53613, 5616.61377, - 2277.78564, 0.965189934, 4.80563429e-8, - 0.261550069, - 6.73089886e-8, 1, - 6.46515304e-8, 0.261550069, 8.00056768e-8, 0.965189934)
                                                                    end
                                                                else
                                                                    MsBoss = "Wysper [Lv. 500] [Boss]"
                                                                    NameBoss = "Wysper"
                                                                    NameQuestBoss = "SkyExp1Quest"
                                                                    LevelQuestBoss = 3
                                                                    CFrameQuestBoss = CFrame.new(- 7862.94629, 5545.52832, - 379.833954, 0.462944925, 1.45838088e-8, - 0.886386991, 1.0534996e-8, 1, 2.19553424e-8, 0.886386991, - 1.95022007e-8, 0.462944925)
                                                                    CFrameBoss = CFrame.new(- 7925.48389, 5550.76074, - 636.178345, 0.716468513, - 1.22915289e-9, 0.697619379, 3.37381434e-9, 1, - 1.70304748e-9, - 0.697619379, 3.57381835e-9, 0.716468513)
                                                                end
                                                            else
                                                                MsBoss = "Fishman Lord [Lv. 425] [Boss]"
                                                                NameBoss = "Fishman Lord"
                                                                NameQuestBoss = "FishmanQuest"
                                                                LevelQuestBoss = 3
                                                                CFrameQuestBoss = CFrame.new(61123.0859, 18.5066795, 1570.18018, 0.927145958, 1.0624845e-7, 0.374700129, - 6.98219367e-8, 1, - 1.10790765e-7, - 0.374700129, 7.65569368e-8, 0.927145958)
                                                                CFrameBoss = CFrame.new(61351.7773, 31.0306778, 1113.31409, 0.999974668, 0, - 0.00714713801, 0, 1.00000012, 0, 0.00714714266, 0, 0.999974549)
                                                            end
                                                        else
                                                            MsBoss = "Magma Admiral [Lv. 350] [Boss]"
                                                            NameBoss = "Magma Admiral"
                                                            NameQuestBoss = "MagmaQuest"
                                                            LevelQuestBoss = 3
                                                            CFrameQuestBoss = CFrame.new(- 5317.07666, 12.2721891, 8517.41699, 0.51175487, - 2.65508806e-8, - 0.859131515, - 3.91131572e-8, 1, - 5.42026761e-8, 0.859131515, 6.13418294e-8, 0.51175487)
                                                            CFrameBoss = CFrame.new(- 5530.12646, 22.8769703, 8859.91309, 0.857838571, 2.23414389e-8, 0.513919294, 1.53689133e-8, 1, - 6.91265853e-8, - 0.513919294, 6.71978384e-8, 0.857838571)
                                                        end
                                                    else
                                                        MsBoss = "Swan [Lv. 225] [Boss]"
                                                        NameBoss = "Swan"
                                                        NameQuestBoss = "ImpelQuest"
                                                        LevelQuestBoss = 3
                                                        CFrameQuestBoss = CFrame.new(4851.35059, 5.68744135, 743.251282, - 0.538484037, - 6.68303741e-8, - 0.842635691, 1.38001752e-8, 1, - 8.81300792e-8, 0.842635691, - 5.90851599e-8, - 0.538484037)
                                                        CFrameBoss = CFrame.new(5232.5625, 5.26856995, 747.506897, 0.943829298, - 4.5439414e-8, 0.330433697, 3.47818627e-8, 1, 3.81658154e-8, - 0.330433697, - 2.45289105e-8, 0.943829298)
                                                    end
                                                else
                                                    MsBoss = "Chief Warden [Lv. 200] [Boss]"
                                                    NameBoss = "Chief Warden"
                                                    NameQuestBoss = "ImpelQuest"
                                                    LevelQuestBoss = 2
                                                    CFrameQuestBoss = CFrame.new(4851.35059, 5.68744135, 743.251282, - 0.538484037, - 6.68303741e-8, - 0.842635691, 1.38001752e-8, 1, - 8.81300792e-8, 0.842635691, - 5.90851599e-8, - 0.538484037)
                                                    CFrameBoss = CFrame.new(5232.5625, 5.26856995, 747.506897, 0.943829298, - 4.5439414e-8, 0.330433697, 3.47818627e-8, 1, 3.81658154e-8, - 0.330433697, - 2.45289105e-8, 0.943829298)
                                                end
                                            else
                                                MsBoss = "Warden [Lv. 175] [Boss]"
                                                NameBoss = "Warden"
                                                NameQuestBoss = "ImpelQuest"
                                                LevelQuestBoss = 1
                                                CFrameQuestBoss = CFrame.new(4851.35059, 5.68744135, 743.251282, - 0.538484037, - 6.68303741e-8, - 0.842635691, 1.38001752e-8, 1, - 8.81300792e-8, 0.842635691, - 5.90851599e-8, - 0.538484037)
                                                CFrameBoss = CFrame.new(5232.5625, 5.26856995, 747.506897, 0.943829298, - 4.5439414e-8, 0.330433697, 3.47818627e-8, 1, 3.81658154e-8, - 0.330433697, - 2.45289105e-8, 0.943829298)
                                            end
                                        else
                                            MsBoss = "Vice Admiral [Lv. 130] [Boss]"
                                            NameBoss = "Vice Admiral"
                                            NameQuestBoss = "MarineQuest2"
                                            LevelQuestBoss = 2
                                            CFrameQuestBoss = CFrame.new(- 5035.42285, 28.6520386, 4324.50293, - 0.0611100644, - 8.08395768e-8, 0.998130739, - 1.57416586e-8, 1, 8.00271849e-8, - 0.998130739, - 1.08217701e-8, - 0.0611100644)
                                            CFrameBoss = CFrame.new(- 5078.45898, 99.6520691, 4402.1665, - 0.555574954, - 9.88630566e-11, 0.831466436, - 6.35508286e-8, 1, - 4.23449258e-8, - 0.831466436, - 7.63661632e-8, - 0.555574954)
                                        end
                                    else
                                        MsBoss = "Mob Leader [Lv. 120] [Boss]"
                                        NameBoss = "Mob Leader"
                                        CFrameBoss = CFrame.new(- 2848.59399, 7.4272871, 5342.44043, - 0.928248107, - 8.7248246e-8, 0.371961564, - 7.61816636e-8, 1, 4.44474857e-8, - 0.371961564, 1.29216433e-8, - 0.92824)
                                    end
                                else
                                    MsBoss = "Yeti [Lv. 110] [Boss]"
                                    NameBoss = "Yeti"
                                    NameQuestBoss = "SnowQuest"
                                    LevelQuestBoss = 3
                                    CFrameQuestBoss = CFrame.new(1384.90247, 87.3078308, - 1296.6825, 0.280209213, 2.72035177e-8, - 0.959938943, - 6.75690828e-8, 1, 8.6151708e-9, 0.959938943, 6.24481444e-8, 0.280209213)
                                    CFrameBoss = CFrame.new(1221.7356, 138.046906, - 1488.84082, 0.349343032, - 9.49245944e-8, 0.936994851, 6.29478194e-8, 1, 7.7838429e-8, - 0.936994851, 3.17894653e-8, 0.349343032)
                                end
                            else
                                MsBoss = "Bobby [Lv. 55] [Boss]"
                                NameBoss = "Bobby"
                                NameQuestBoss = "BuggyQuest1"
                                LevelQuestBoss = 3
                                CFrameQuestBoss = CFrame.new(- 1139.59717, 4.75205183, 3825.16211, - 0.959730506, - 7.5857054e-9, 0.280922383, - 4.06310328e-8, 1, - 1.11807175e-7, - 0.280922383, - 1.18718916e-7, - 0.959730506)
                                CFrameBoss = CFrame.new(- 1147.65173, 32.5966301, 4156.02588, 0.956680477, - 1.77109952e-10, - 0.29113996, 5.16530874e-10, 1, 1.08897802e-9, 0.29113996, - 1.19218679e-9, 0.956680477)
                            end
                        else
                            MsBoss = "The Gorilla King [Lv. 25] [Boss]"
                            NameBoss = "The Gorilla King"
                            NameQuestBoss = "JungleQuest"
                            LevelQuestBoss = 3
                            CFrameQuestBoss = CFrame.new(- 1604.12012, 36.8521118, 154.23732, 0.0648873374, - 4.70858913e-6, - 0.997892559, 1.41431883e-7, 1, - 4.70933674e-6, 0.997892559, 1.64442184e-7, 0.0648873374)
                            CFrameBoss = CFrame.new(- 1223.52808, 6.27936459, - 502.292664, 0.310949147, - 5.66602516e-8, 0.950426519, - 3.37275488e-8, 1, 7.06501808e-8, - 0.950426519, - 5.40241736e-8, 0.310949147)
                        end
                    else
                        MsBoss = "Greybeard [Lv. 750] [Raid Boss]"
                        NameBoss = "Greybeard"
                        CFrameBoss = CFrame.new(- 4955.72949, 80.8163834, 4305.82666, - 0.433646321, - 1.03394289e-8, 0.901083171, - 3.0443168e-8, 1, - 3.17633075e-9, - 0.901083171, - 2.88092288e-8, - 0.433646321)
                    end
                else
                    MsBoss = "The Saw [Lv. 100] [Boss]"
                    NameBoss = "The Saw"
                    CFrameBoss = CFrame.new(- 683.519897, 13.8534927, 1610.87854, - 0.290192783, 6.88365773e-8, 0.956968188, 6.98413629e-8, 1, - 5.07531119e-8, - 0.956968188, 5.21077759e-8, - 0.290192783)
                end
            else
                MsBoss = "Saber Expert [Lv. 200] [Boss]"
                NameBoss = "Saber Expert"
                CFrameBoss = CFrame.new(- 1458.89502, 29.8870335, - 50.633564, 0.858821094, 1.13848939e-8, 0.512275636, - 4.85649254e-9, 1, - 1.40823326e-8, - 0.512275636, 9.6063415e-9, 0.858821094)
            end
        end
        _G.GetBoss = false
        function GetBossName()
            local v290, v291, v292 = pairs(game.ReplicatedStorage:GetChildren())
            while true do
                local v293
                v292, v293 = v290(v291, v292)
                if v292 == nil then
                    break
                end
                if not _G.GetBoss then
                    if v293.Name ~= "The Gorilla King [Lv. 25] [Boss]" or game.Players.localPlayer.Data.Level.Value < 20 then
                        if v293.Name ~= "Bobby [Lv. 55] [Boss]" or game.Players.localPlayer.Data.Level.Value < 55 then
                            if v293.Name ~= "Yeti [Lv. 110] [Boss]" or game.Players.localPlayer.Data.Level.Value < 105 then
                                if v293.Name ~= "Mob Leader [Lv. 120] [Boss]" or game.Players.localPlayer.Data.Level.Value < 120 then
                                    if v293.Name ~= "Vice Admiral [Lv. 130] [Boss]" or game.Players.localPlayer.Data.Level.Value < 130 then
                                        if v293.Name ~= "Warden [Lv. 175] [Boss]" or game.Players.localPlayer.Data.Level.Value < 175 then
                                            if v293.Name ~= "Saber Expert [Lv. 200] [Boss]" or game.Workspace.Map.Jungle.Final.Part.Transparency ~= 1 then
                                                if v293.Name ~= "Chief Warden [Lv. 200] [Boss]" or game.Players.localPlayer.Data.Level.Value < 200 then
                                                    if v293.Name ~= "Swan [Lv. 225] [Boss]" or game.Players.localPlayer.Data.Level.Value < 250 then
                                                        if v293.Name ~= "Magma Admiral [Lv. 350] [Boss]" or game.Players.localPlayer.Data.Level.Value < 350 then
                                                            if v293.Name ~= "Fishman Lord [Lv. 425] [Boss]" or game.Players.localPlayer.Data.Level.Value < 425 then
                                                                if v293.Name ~= "Wysper [Lv. 500] [Boss]" or game.Players.localPlayer.Data.Level.Value < 500 then
                                                                    if v293.Name ~= "Thunder God [Lv. 575] [Boss]" or game.Players.localPlayer.Data.Level.Value < 575 then
                                                                        if v293.Name ~= "Cyborg [Lv. 675] [Boss]" or game.Players.localPlayer.Data.Level.Value < 675 then
                                                                            if v293.Name ~= "Diamond [Lv. 750] [Boss]" or game.Players.localPlayer.Data.Level.Value < 750 then
                                                                                if v293.Name ~= "Jeremy [Lv. 850] [Boss]" or game.Players.localPlayer.Data.Level.Value < 850 then
                                                                                    if v293.Name ~= "Fajita [Lv. 925] [Boss]" or game.Players.localPlayer.Data.Level.Value < 925 then
                                                                                        if v293.Name ~= "Don Swan [Lv. 1000] [Boss]" or game.Players.localPlayer.Data.Level.Value < 1000 or game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TalkTrevor", "1") ~= 0 then
                                                                                            if v293.Name ~= "Smoke Admiral [Lv. 1150] [Boss]" or game.Players.localPlayer.Data.Level.Value < 1150 then
                                                                                                if v293.Name ~= "Cursed Captain [Lv. 1325] [Raid Boss]" or game.Players.localPlayer.Data.Level.Value < 1325 then
                                                                                                    if v293.Name ~= "Awakened Ice Admiral [Lv. 1400] [Boss]" or game.Players.localPlayer.Data.Level.Value < 1400 then
                                                                                                        if v293.Name ~= "Tide Keeper [Lv. 1475] [Boss]" or game.Players.localPlayer.Data.Level.Value < 1475 then
                                                                                                            if v293.Name ~= "Stone [Lv. 1550] [Boss]" or game.Players.localPlayer.Data.Level.Value < 1550 then
                                                                                                                if v293.Name ~= "Island Empress [Lv. 1675] [Boss]" or game.Players.localPlayer.Data.Level.Value < 1675 then
                                                                                                                    if v293.Name ~= "Kilo Admiral [Lv. 1750] [Boss]" or game.Players.localPlayer.Data.Level.Value < 1750 then
                                                                                                                        if v293.Name ~= "Captain Elephant [Lv. 1875] [Boss]" or game.Players.localPlayer.Data.Level.Value < 1875 then
                                                                                                                            if v293.Name ~= "Beautiful Pirate [Lv. 1950] [Boss]" or game.Players.localPlayer.Data.Level.Value < 1950 then
                                                                                                                                if v293.Name == "Cake Queen [Lv. 2175] [Boss]" and game.Players.localPlayer.Data.Level.Value >= 2175 then
                                                                                                                                    _G.Settings.Boss["Select Boss"] = "Cake Queen [Lv. 2175] [Boss]"
                                                                                                                                end
                                                                                                                            else
                                                                                                                                _G.Settings.Boss["Select Boss"] = "Beautiful Pirate [Lv. 1950] [Boss]"
                                                                                                                            end
                                                                                                                        else
                                                                                                                            _G.Settings.Boss["Select Boss"] = "Captain Elephant [Lv. 1875] [Boss]"
                                                                                                                        end
                                                                                                                    else
                                                                                                                        _G.Settings.Boss["Select Boss"] = "Kilo Admiral [Lv. 1750] [Boss]"
                                                                                                                    end
                                                                                                                else
                                                                                                                    _G.Settings.Boss["Select Boss"] = "Island Empress [Lv. 1675] [Boss]"
                                                                                                                end
                                                                                                            else
                                                                                                                _G.Settings.Boss["Select Boss"] = "Stone [Lv. 1550] [Boss]"
                                                                                                            end
                                                                                                        else
                                                                                                            _G.Settings.Boss["Select Boss"] = "Tide Keeper [Lv. 1475] [Boss]"
                                                                                                        end
                                                                                                    else
                                                                                                        _G.Settings.Boss["Select Boss"] = "Awakened Ice Admiral [Lv. 1400] [Boss]"
                                                                                                    end
                                                                                                else
                                                                                                    _G.Settings.Boss["Select Boss"] = "Cursed Captain [Lv. 1325] [Raid Boss]"
                                                                                                end
                                                                                            else
                                                                                                _G.Settings.Boss["Select Boss"] = "Smoke Admiral [Lv. 1150] [Boss]"
                                                                                            end
                                                                                        else
                                                                                            _G.Settings.Boss["Select Boss"] = "Don Swan [Lv. 1000] [Boss]"
                                                                                        end
                                                                                    else
                                                                                        _G.Settings.Boss["Select Boss"] = "Fajita [Lv. 925] [Boss]"
                                                                                    end
                                                                                else
                                                                                    _G.Settings.Boss["Select Boss"] = "Jeremy [Lv. 850] [Boss]"
                                                                                end
                                                                            else
                                                                                _G.Settings.Boss["Select Boss"] = "Diamond [Lv. 750] [Boss]"
                                                                            end
                                                                        else
                                                                            _G.Settings.Boss["Select Boss"] = "Cyborg [Lv. 675] [Boss]"
                                                                        end
                                                                    else
                                                                        _G.Settings.Boss["Select Boss"] = "Thunder God [Lv. 575] [Boss]"
                                                                    end
                                                                else
                                                                    _G.Settings.Boss["Select Boss"] = "Wysper [Lv. 500] [Boss]"
                                                                end
                                                            else
                                                                _G.Settings.Boss["Select Boss"] = "Fishman Lord [Lv. 425] [Boss]"
                                                            end
                                                        else
                                                            _G.Settings.Boss["Select Boss"] = "Magma Admiral [Lv. 350] [Boss]"
                                                        end
                                                    else
                                                        _G.Settings.Boss["Select Boss"] = "Swan [Lv. 225] [Boss]"
                                                    end
                                                else
                                                    _G.Settings.Boss["Select Boss"] = "Chief Warden [Lv. 200] [Boss]"
                                                end
                                            else
                                                _G.Settings.Boss["Select Boss"] = "Saber Expert [Lv. 200] [Boss]"
                                            end
                                        else
                                            _G.Settings.Boss["Select Boss"] = "Warden [Lv. 175] [Boss]"
                                        end
                                    else
                                        _G.Settings.Boss["Select Boss"] = "Vice Admiral [Lv. 130] [Boss]"
                                    end
                                else
                                    _G.Settings.Boss["Select Boss"] = "Mob Leader [Lv. 120] [Boss]"
                                end
                            else
                                _G.Settings.Boss["Select Boss"] = "Yeti [Lv. 110] [Boss]"
                            end
                        else
                            _G.Settings.Boss["Select Boss"] = "Bobby [Lv. 55] [Boss]"
                        end
                    else
                        _G.Settings.Boss["Select Boss"] = "The Gorilla King [Lv. 25] [Boss]"
                    end
                end
            end
        end
        local v294 = game:GetService("CoreGui").RobloxGui.Modules.Profile:FindFirstChild("G3LIB")
        if v294 then
            v294:Destroy()
        end
        local vu295 = game:GetService("UserInputService")
        local vu296 = game:GetService("TweenService")
        game:GetService("RunService")
        local vu297 = game:GetService("Players").LocalPlayer:GetMouse()
        getgenv().UiSettings = {
            ["Key"] = Enum.KeyCode.RightControl
        }
        local vu298 = {
            ["RoundFrame"] = "ImageLabel",
            ["Shadow"] = "ImageLabel",
            ["Circle"] = "ImageLabel",
            ["CircleButton"] = "ImageButton",
            ["Frame"] = "Frame",
            ["Label"] = "TextLabel",
            ["Button"] = "TextButton",
            ["SmoothButton"] = "ImageButton",
            ["Box"] = "TextBox",
            ["ScrollingFrame"] = "ScrollingFrame",
            ["Menu"] = "ImageButton",
            ["NavBar"] = "ImageButton"
        }
        local vu299 = {
            ["RoundFrame"] = {
                ["BackgroundTransparency"] = 1,
                ["Image"] = "http://www.roblox.com/asset/?id=5554237731",
                ["ScaleType"] = Enum.ScaleType.Slice,
                ["SliceCenter"] = Rect.new(3, 3, 297, 297)
            },
            ["SmoothButton"] = {
                ["AutoButtonColor"] = false,
                ["BackgroundTransparency"] = 1,
                ["Image"] = "http://www.roblox.com/asset/?id=5554237731",
                ["ScaleType"] = Enum.ScaleType.Slice,
                ["SliceCenter"] = Rect.new(3, 3, 297, 297)
            },
            ["Shadow"] = {
                ["Name"] = "Shadow",
                ["BackgroundTransparency"] = 1,
                ["Image"] = "http://www.roblox.com/asset/?id=5554236805",
                ["ScaleType"] = Enum.ScaleType.Slice,
                ["SliceCenter"] = Rect.new(23, 23, 277, 277),
                ["Size"] = UDim2.fromScale(1, 1) + UDim2.fromOffset(30, 30),
                ["Position"] = UDim2.fromOffset(- 15, - 15)
            },
            ["Circle"] = {
                ["BackgroundTransparency"] = 1,
                ["Image"] = "http://www.roblox.com/asset/?id=5554831670"
            },
            ["CircleButton"] = {
                ["BackgroundTransparency"] = 1,
                ["AutoButtonColor"] = false,
                ["Image"] = "http://www.roblox.com/asset/?id=5554831670"
            },
            ["Frame"] = {
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["Size"] = UDim2.fromScale(1, 1)
            },
            ["Label"] = {
                ["BackgroundTransparency"] = 1,
                ["Position"] = UDim2.fromOffset(5, 0),
                ["Size"] = UDim2.fromScale(1, 1) - UDim2.fromOffset(5, 0),
                ["TextSize"] = 14,
                ["TextXAlignment"] = Enum.TextXAlignment.Left
            },
            ["Button"] = {
                ["BackgroundTransparency"] = 1,
                ["Position"] = UDim2.fromOffset(5, 0),
                ["Size"] = UDim2.fromScale(1, 1) - UDim2.fromOffset(5, 0),
                ["TextSize"] = 14,
                ["TextXAlignment"] = Enum.TextXAlignment.Left
            },
            ["Box"] = {
                ["BackgroundTransparency"] = 1,
                ["Position"] = UDim2.fromOffset(5, 0),
                ["Size"] = UDim2.fromScale(1, 1) - UDim2.fromOffset(5, 0),
                ["TextSize"] = 14,
                ["TextXAlignment"] = Enum.TextXAlignment.Left
            },
            ["ScrollingFrame"] = {
                ["BackgroundTransparency"] = 1,
                ["ScrollBarThickness"] = 0,
                ["CanvasSize"] = UDim2.fromScale(0, 0),
                ["Size"] = UDim2.fromScale(1, 1)
            },
            ["Menu"] = {
                ["Name"] = "More",
                ["AutoButtonColor"] = false,
                ["BackgroundTransparency"] = 1,
                ["Image"] = "http://www.roblox.com/asset/?id=5555108481",
                ["Size"] = UDim2.fromOffset(20, 20),
                ["Position"] = UDim2.fromScale(1, 0.5) - UDim2.fromOffset(25, 10)
            },
            ["NavBar"] = {
                ["Name"] = "SheetToggle",
                ["Image"] = "http://www.roblox.com/asset/?id=5576439039",
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromOffset(20, 20),
                ["Position"] = UDim2.fromOffset(5, 5),
                ["AutoButtonColor"] = false
            }
        }
        local vu300 = {
            "RoundFrame",
            "Shadow",
            "Circle",
            "CircleButton",
            "Frame",
            "Label",
            "Button",
            "SmoothButton",
            "Box",
            "ScrollingFrame",
            "Menu",
            "NavBar"
        }
        function FindType(p301)
			-- upvalues: (ref) vu300
            local v302 = next
            local v303 = vu300
            local v304 = nil
            while true do
                local v305
                v304, v305 = v302(v303, v304)
                if v304 == nil then
                    break
                end
                if v305:sub(1, # p301):lower() == p301:lower() then
                    return v305
                end
            end
            return false
        end
        local vu313 = {
            ["new"] = function(p306)
				-- upvalues: (ref) vu298, (ref) vu299
                local v307 = FindType(p306)
                if not v307 then
                    return Instance.new(p306)
                end
                local v308 = Instance.new(vu298[v307])
                if vu299[v307] then
                    local v309 = next
                    local v310 = vu299[v307]
                    local v311 = nil
                    while true do
                        local v312
                        v311, v312 = v309(v310, v311)
                        if v311 == nil then
                            break
                        end
                        v308[v311] = v312
                    end
                end
                return v308
            end
        }
        local function vu319(p314)
			-- upvalues: (ref) vu297
            local v315 = p314.AbsoluteSize.X
            local v316 = p314.AbsoluteSize.Y
            local v317 = math.clamp(vu297.X - p314.AbsolutePosition.X, 0, v315)
            local v318 = math.clamp(vu297.Y - p314.AbsolutePosition.Y, 0, v316)
            return v317 / v315, v318 / v316
        end
        local function vu327(p320, p321, p322)
			-- upvalues: (ref) vu319, (ref) vu313, (ref) vu296
            local v323, v324 = vu319(p320)
            local vu325 = vu313.new("Circle")
            vu325.Size = UDim2.fromScale(0, 0)
            vu325.Position = UDim2.fromScale(v323, v324)
            vu325.ImageColor3 = p322 or p320.ImageColor3
            vu325.ZIndex = 200
            vu325.Parent = p320
            local v326 = p320.AbsoluteSize.X
            vu296:Create(vu325, TweenInfo.new(0.4), {
                ["Position"] = UDim2.fromScale(v323, v324) - UDim2.fromOffset(v326 / 2, v326 / 2),
                ["ImageTransparency"] = 1,
                ["ImageColor3"] = p321,
                ["Size"] = UDim2.fromOffset(v326, v326)
            }):Play()
            spawn(function()
				-- upvalues: (ref) vu325
                wait(0.4)
                vu325:Destroy()
            end)
        end
        local function vu329(_, _, p328, _)
            local _ = p328 == nil
            return Back
        end
        local function vu344(p330, pu331)
			-- upvalues: (ref) vu296, (ref) vu295
            local vu332 = nil
            local vu333 = nil
            local vu334 = nil
            local vu335 = nil
            local function vu340(p336)
				-- upvalues: (ref) vu332, (ref) vu333, (ref) vu296, (ref) pu331
                local v337 = p336.Position - vu332
                local v338 = vu296
                local v339 = {
                    ["Position"] = UDim2.new(vu333.X.Scale, vu333.X.Offset + v337.X, vu333.Y.Scale, vu333.Y.Offset + v337.Y)
                }
                v338:Create(pu331, TweenInfo.new(0.2), v339):Play()
            end
            p330.InputBegan:Connect(function(pu341)
				-- upvalues: (ref) vu334, (ref) vu332, (ref) vu333, (ref) pu331
                if pu341.UserInputType == Enum.UserInputType.MouseButton1 or pu341.UserInputType == Enum.UserInputType.Touch then
                    vu334 = true
                    vu332 = pu341.Position
                    vu333 = pu331.Position
                    pu341.Changed:Connect(function()
						-- upvalues: (ref) pu341, (ref) vu334
                        if pu341.UserInputState == Enum.UserInputState.End then
                            vu334 = false
                        end
                    end)
                end
            end)
            p330.InputChanged:Connect(function(p342)
				-- upvalues: (ref) vu335
                if p342.UserInputType == Enum.UserInputType.MouseMovement or p342.UserInputType == Enum.UserInputType.Touch then
                    vu335 = p342
                end
            end)
            vu295.InputChanged:Connect(function(p343)
				-- upvalues: (ref) vu335, (ref) vu334, (ref) vu340
                if p343 == vu335 and vu334 then
                    vu340(p343)
                end
            end)
        end
        local vu345 = Instance.new("ScreenGui")
        vu345.Name = "UUltimatLY Hub"
        vu345.Parent = game:GetService("CoreGui").RobloxGui.Modules.Profile
        vu345.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        local v555 = ({
            ["Window"] = function(_, p346)
				-- upvalues: (ref) vu345, (ref) vu296, (ref) vu295, (ref) vu344, (ref) vu327
                local vu347 = Instance.new("Frame")
                local v348 = Instance.new("Frame")
                local v349 = Instance.new("UICorner")
                local v350 = Instance.new("ImageLabel")
                local v351 = Instance.new("TextLabel")
                local vu352 = Instance.new("ScrollingFrame")
                local vu353 = Instance.new("UIListLayout")
                local vu354 = Instance.new("ImageLabel")
                local v355 = Instance.new("UICorner")
                local v356 = Instance.new("TextButton")
                local v357 = Instance.new("UICorner")
                local vu358 = Instance.new("Frame")
                local vu359 = Instance.new("ScrollingFrame")
                local vu360 = Instance.new("UIListLayout")
                local vu361 = Instance.new("TextLabel")
                local v362 = Instance.new("Frame")
                local vu363 = Instance.new("Folder")
                local vu364 = Instance.new("UIPageLayout")
                local vu365 = false
                local vu366 = false
                vu347.Name = "Main"
                vu347.Parent = vu345
                vu347.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
                vu347.Position = UDim2.new(0.5, 0, 0.5, 0)
                vu347.ClipsDescendants = true
                vu347.Size = UDim2.new(0, 0, 0, 0)
                vu347.AnchorPoint = Vector2.new(0.5, 0.5)
                vu296:Create(vu347, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    ["Size"] = UDim2.new(0, 600, 0, 700)
                }):Play()
                v348.Name = "Top"
                v348.Parent = vu347
                v348.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                v348.Size = UDim2.new(0, 600, 0, 40)
                v349.CornerRadius = UDim.new(0, 4)
                v349.Name = "UICorner_Top"
                v349.Parent = v348
                v350.Name = "Logo"
                v350.Parent = v348
                v350.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                v350.BackgroundTransparency = 1
                v350.Position = UDim2.new(0.00999999978, 0, 0.075000003, 0)
                v350.Size = UDim2.new(0, 34, 0, 34)
                v350.Image = "http://www.roblox.com/asset/?id=11941159597"
                v351.Name = "NameHub"
                v351.Parent = v348
                v351.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                v351.BackgroundTransparency = 1
                v351.Position = UDim2.new(0.088333331, 0, 0, 0)
                v351.Size = UDim2.new(0, 83, 0, 37)
                v351.Font = Enum.Font.GothamBold
                v351.Text = p346
                v351.TextColor3 = Color3.fromRGB(236, 236, 236)
                v351.TextSize = 16
                v351.TextXAlignment = Enum.TextXAlignment.Left
                vu352.Parent = v348
                vu352.Active = true
                vu352.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                vu352.BackgroundTransparency = 1
                vu352.Position = UDim2.new(0.27700001, 0, 0.25, 0)
                vu352.Size = UDim2.new(0, 345, 0, 23)
                vu352.CanvasSize = UDim2.new(0, 0, 0, 0)
                vu352.ScrollBarThickness = 0
                vu353.Parent = vu352
                vu353.FillDirection = Enum.FillDirection.Horizontal
                vu353.SortOrder = Enum.SortOrder.LayoutOrder
                vu353.Padding = UDim.new(0, 5)
                vu354.Name = "ImageSetting"
                vu354.Parent = v348
                vu354.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                vu354.Position = UDim2.new(0.938333333, 0, 0.200000003, 0)
                vu354.Size = UDim2.new(0, 20, 0, 20)
                vu354.Image = "http://www.roblox.com/asset/?id=11365495533"
                vu354.ImageColor3 = Color3.fromRGB(25, 25, 25)
                v355.CornerRadius = UDim.new(0, 4)
                v355.Name = "UICorner_Setting"
                v355.Parent = vu354
                v356.Name = "ButtonSetttings"
                v356.Parent = vu354
                v356.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                v356.BackgroundTransparency = 1
                v356.Size = UDim2.new(0, 20, 0, 20)
                v356.Font = Enum.Font.SourceSans
                v356.Text = ""
                v356.TextColor3 = Color3.fromRGB(0, 0, 0)
                v356.TextSize = 14
                v357.CornerRadius = UDim.new(0, 4)
                v357.Name = "UICorner_Main"
                v357.Parent = vu347
                local vu367 = Instance.new("Frame")
                vu367.Name = "BackSettingFrame"
                vu367.Parent = vu347
                vu367.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                vu367.BackgroundTransparency = 0.45
                vu367.BorderSizePixel = 0
                vu367.ClipsDescendants = true
                vu367.Position = UDim2.new(0, 0, 0.0571428575, 0)
                vu367.Size = UDim2.new(0, 0, 0, 660)
                vu367.ZIndex = 2
                vu358.Name = "SettingFrame"
                vu358.Parent = vu347
                vu358.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                vu358.BackgroundTransparency = 0
                vu358.BorderSizePixel = 0
                vu358.ClipsDescendants = true
                vu358.Position = UDim2.new(0, 0, 0.0571428575, 0)
                vu358.Size = UDim2.new(0, 0, 0, 660)
                vu358.ZIndex = 3
                local v368 = Instance.new("Frame")
                v368.Name = "SettingFrameE"
                v368.Parent = vu358
                v368.BackgroundColor3 = Color3.fromRGB(255, 25, 25)
                v368.BackgroundTransparency = 1
                v368.BorderSizePixel = 0
                v368.ClipsDescendants = true
                v368.Position = UDim2.new(0, 0, 0, 0)
                v368.Size = UDim2.new(0, 255, 0, 614)
                vu359.Name = "ScrollingFrameSetting"
                vu359.Parent = v368
                vu359.Active = true
                vu359.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                vu359.BackgroundTransparency = 1
                vu359.BorderSizePixel = 0
                vu359.Size = UDim2.new(0, 0, 0, 660)
                vu359.CanvasSize = UDim2.new(0, 0, 0, 0)
                vu359.ScrollBarThickness = 4
                vu359.ClipsDescendants = true
                vu360.Name = "UIListLayoutSetting"
                vu360.Parent = vu359
                vu360.SortOrder = Enum.SortOrder.LayoutOrder
                vu360.Padding = UDim.new(0, 10)
                vu361.Name = "KeyBindUi"
                vu361.Parent = vu358
                vu361.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                vu361.BackgroundTransparency = 1
                vu361.Position = UDim2.new(- 0.00392156886, 0, 0.943939388, 0)
                vu361.Size = UDim2.new(0, 255, 0, 27)
                vu361.Font = Enum.Font.GothamBold
                vu361.Text = "[ Right Control ]"
                vu361.TextColor3 = Color3.fromRGB(222, 222, 222)
                vu361.TextSize = 14
                vu361.ZIndex = 4
                v362.Name = "Container_Page"
                v362.Parent = vu347
                v362.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                v362.BackgroundTransparency = 1
                v362.ClipsDescendants = true
                v362.Position = UDim2.new(0.0266666673, 0, 0.0842857137, 0)
                v362.Size = UDim2.new(0, 567, 0, 621)
                vu363.Name = "PageFolder"
                vu363.Parent = v362
                vu364.Parent = vu363
                vu364.SortOrder = Enum.SortOrder.LayoutOrder
                vu364.EasingDirection = Enum.EasingDirection.InOut
                vu364.EasingStyle = Enum.EasingStyle.Quad
                vu364.Padding = UDim.new(0.5, 0)
                vu364.TweenTime = 0.5
                local v369 = Instance.new("TextButton")
                v369.Name = "ButtonKeybind"
                v369.Parent = vu358
                v369.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                v369.Position = UDim2.new(- 0.00392156886, 0, 0.943939388, 0)
                v369.BackgroundTransparency = 1
                v369.Size = UDim2.new(0, 255, 0, 27)
                v369.Font = Enum.Font.SourceSans
                v369.Text = ""
                v369.TextColor3 = Color3.fromRGB(0, 0, 0)
                v369.TextSize = 14
                v369.MouseButton1Click:Connect(function()
					-- upvalues: (ref) vu361, (ref) vu295
                    vu361.Text = "[ Select Key ]"
                    local v370 = vu295.InputBegan:wait()
                    if v370.KeyCode.Name ~= "Unknown" then
                        getgenv().UiSettings.Key = v370.KeyCode
                        vu361.Text = "[ " .. getgenv().UiSettings.Key.Name .. " ] "
                        Key = v370.KeyCode.Name
                    end
                end)
                local vu371 = false
                vu295.InputBegan:Connect(function(p372, _)
					-- upvalues: (ref) vu371, (ref) vu296, (ref) vu347
                    if p372.KeyCode == getgenv().UiSettings.Key then
                        if vu371 ~= false then
                            vu296:Create(vu347, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                                ["Size"] = UDim2.new(0, 600, 0, 700)
                            }):Play()
                            repeat
                                wait()
                            until vu347.Size == UDim2.new(0, 600, 0, 700)
                            vu371 = false
                        else
                            vu371 = true
                            vu296:Create(vu347, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {
                                ["Size"] = UDim2.new(0, 0, 0, 0)
                            }):Play()
                        end
                    end
                end)
                vu344(v348, vu347)
                game:GetService("RunService").Stepped:Connect(function()
					-- upvalues: (ref) vu352, (ref) vu353, (ref) vu359, (ref) vu360
                    pcall(function()
						-- upvalues: (ref) vu352, (ref) vu353, (ref) vu359, (ref) vu360
                        vu352.CanvasSize = UDim2.new(0, vu353.AbsoluteContentSize.X + 10, 0, 0)
                        vu359.CanvasSize = UDim2.new(0, 0, 0, vu360.AbsoluteContentSize.Y + 10)
                    end)
                end)
                v356.MouseButton1Down:Connect(function()
					-- upvalues: (ref) vu365, (ref) vu296, (ref) vu358, (ref) vu359, (ref) vu367, (ref) vu354
                    if vu365 ~= false then
                        if vu365 == true then
                            vu365 = false
                            vu296:Create(vu358, TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {
                                ["Size"] = UDim2.new(0, 0, 0, 660)
                            }):Play()
                            vu296:Create(vu359, TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {
                                ["Size"] = UDim2.new(0, 0, 0, 660)
                            }):Play()
                            vu296:Create(vu367, TweenInfo.new(0.05, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {
                                ["Size"] = UDim2.new(0, 0, 0, 660)
                            }):Play()
                            vu296:Create(vu354, TweenInfo.new(0.1, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {
                                ["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
                            }):Play()
                        end
                    else
                        vu365 = true
                        vu296:Create(vu358, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                            ["Size"] = UDim2.new(0, 255, 0, 660)
                        }):Play()
                        vu296:Create(vu359, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                            ["Size"] = UDim2.new(0, 255, 0, 660)
                        }):Play()
                        vu296:Create(vu367, TweenInfo.new(0.1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                            ["Size"] = UDim2.new(0, 600, 0, 660)
                        }):Play()
                        vu296:Create(vu354, TweenInfo.new(0.1, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {
                            ["BackgroundColor3"] = Color3.fromRGB(0, 166, 255)
                        }):Play()
                    end
                end)
                function SettingsLabel(p373)
					-- upvalues: (ref) vu359
                    local v374 = Instance.new("Frame")
                    local vu375 = Instance.new("TextLabel")
                    local v376 = {}
                    v374.Name = "LabelFrameSetting"
                    v374.Parent = vu359
                    v374.BackgroundColor3 = Color3.fromRGB(122, 122, 122)
                    v374.BackgroundTransparency = 1
                    v374.Size = UDim2.new(0, 255, 0, 38)
                    vu375.Name = "LabelSetting"
                    vu375.Parent = v374
                    vu375.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    vu375.BackgroundTransparency = 1
                    vu375.Position = UDim2.new(0.0235294141, 0, 0, 0)
                    vu375.Size = UDim2.new(0, 245, 0, 38)
                    vu375.Font = Enum.Font.GothamBold
                    vu375.Text = p373
                    vu375.TextColor3 = Color3.fromRGB(255, 255, 255)
                    vu375.TextSize = 14
                    vu375.TextXAlignment = Enum.TextXAlignment.Left
                    function v376.SetUpdate(_, p377)
						-- upvalues: (ref) vu375
                        vu375.Text = p377
                    end
                    return v376
                end
                function SettingsToggle(_, p378, pu379)
					-- upvalues: (ref) vu359, (ref) vu296
                    local v380 = Instance.new("Frame")
                    local v381 = Instance.new("Frame")
                    local v382 = Instance.new("UICorner")
                    local vu383 = Instance.new("ImageLabel")
                    local v384 = Instance.new("TextLabel")
                    local v385 = Instance.new("TextButton")
                    local v386 = Instance.new("UIStroke")
                    local vu387 = false
                    local vu388 = true
                    local vu389 = true
                    if p378 == nil then
                        p378 = false
                    end
                    v380.Name = "ToggleFrameSetting"
                    v380.Parent = vu359
                    v380.BackgroundColor3 = Color3.fromRGB(122, 122, 122)
                    v380.BackgroundTransparency = 1
                    v380.Size = UDim2.new(0, 255, 0, 26)
                    v381.Name = "TgleFrameSetting"
                    v381.Parent = v380
                    v381.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    v381.BackgroundTransparency = 1
                    v381.BorderSizePixel = 0
                    v381.ClipsDescendants = true
                    v381.Position = UDim2.new(0.0239999816, 0, 0, 0)
                    v381.Size = UDim2.new(0, 26, 0, 26)
                    v382.CornerRadius = UDim.new(0, 3)
                    v382.Name = "UICornerTgleSetting"
                    v382.Parent = v381
                    v386.Thickness = 1
                    v386.Name = ""
                    v386.Parent = v381
                    v386.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                    v386.LineJoinMode = Enum.LineJoinMode.Round
                    v386.Color = Color3.fromRGB(0, 135, 255)
                    v386.Transparency = 0
                    vu383.Name = "Tgle"
                    vu383.Parent = v381
                    vu383.AnchorPoint = Vector2.new(0.5, 0.5)
                    vu383.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    vu383.BackgroundTransparency = 1
                    vu383.Position = UDim2.new(0.512559988, 0, 0.514999986, 0)
                    vu383.Size = UDim2.new(0, 0, 0, 0)
                    vu383.Image = "rbxassetid://6031068421"
                    vu383.ImageColor3 = Color3.fromRGB(0, 135, 255)
                    v384.Name = "TgleSetting"
                    v384.Parent = v380
                    v384.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    v384.BackgroundTransparency = 1
                    v384.Position = UDim2.new(0.164705887, 0, 0, 0)
                    v384.Size = UDim2.new(0, 197, 0, 26)
                    v384.Font = Enum.Font.GothamBold
                    v384.Text = "Toggle  Bypass"
                    v384.TextColor3 = Color3.fromRGB(255, 255, 255)
                    v384.TextSize = 14
                    v384.TextXAlignment = Enum.TextXAlignment.Left
                    v385.Name = "ToggleSetting"
                    v385.Parent = v380
                    v385.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    v385.BackgroundTransparency = 1
                    v385.Size = UDim2.new(0, 255, 0, 26)
                    v385.Font = Enum.Font.SourceSans
                    v385.Text = ""
                    v385.TextColor3 = Color3.fromRGB(0, 0, 0)
                    v385.TextSize = 14
                    v385.MouseButton1Click:Connect(function()
						-- upvalues: (ref) vu387, (ref) vu388, (ref) vu296, (ref) vu383, (ref) pu379
                        if vu387 ~= false or vu388 ~= true then
                            if vu387 == true and vu388 == true then
                                vu387 = false
                                vu296:Create(vu383, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                                    ["Size"] = UDim2.new(0, 29, 0, 28)
                                }):Play()
                                pu379(true)
                            end
                        else
                            vu387 = true
                            vu296:Create(vu383, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                ["Size"] = UDim2.new(0, 0, 0, 0)
                            }):Play()
                            pu379(false)
                        end
                    end)
                    if p378 == true then
                        vu387 = false
                        vu296:Create(vu383, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                            ["Size"] = UDim2.new(0, 29, 0, 28)
                        }):Play()
                        pu379(true)
                    end
                    local vu390 = Instance.new("Frame")
                    local vu391 = Instance.new("ImageLabel")
                    local v392 = {}
                    vu390.Name = "LockerFrame"
                    vu390.Parent = v380
                    vu390.Active = true
                    vu390.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                    vu390.BackgroundTransparency = 0.2
                    vu390.BorderSizePixel = 0
                    vu390.ClipsDescendants = true
                    vu390.Position = UDim2.new(0, 0, - 0.053222228, 0)
                    vu390.Size = UDim2.new(0, 255, 0, 35)
                    vu390.BackgroundTransparency = 1
                    vu391.Name = "LockIcon"
                    vu391.Parent = vu390
                    vu391.AnchorPoint = Vector2.new(0.5, 0.5)
                    vu391.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    vu391.BackgroundTransparency = 1
                    vu391.Position = UDim2.new(0.5, 0, 0.5, 0)
                    vu391.Size = UDim2.new(0, 0, 0, 0)
                    vu391.Image = "http://www.roblox.com/asset/?id=3926305904"
                    vu391.ImageRectOffset = Vector2.new(404, 364)
                    vu391.ImageRectSize = Vector2.new(36, 36)
                    vu391.ImageColor3 = Color3.fromRGB(255, 25, 25)
                    function v392.StatsTrue(_)
						-- upvalues: (ref) vu387, (ref) vu388, (ref) vu389, (ref) vu296, (ref) vu383, (ref) pu379
                        if vu387 == true and vu388 == true or vu389 == true then
                            vu389 = false
                            vu387 = false
                            vu296:Create(vu383, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                                ["Size"] = UDim2.new(0, 29, 0, 28)
                            }):Play()
                            pu379(true)
                        end
                    end
                    function v392.StatsFalse(_)
						-- upvalues: (ref) vu387, (ref) vu388, (ref) vu296, (ref) vu383, (ref) pu379
                        if vu387 == false and vu388 == true then
                            vu387 = true
                            vu296:Create(vu383, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                ["Size"] = UDim2.new(0, 0, 0, 0)
                            }):Play()
                            pu379(false)
                        end
                    end
                    function v392.Lock(_)
						-- upvalues: (ref) vu388, (ref) vu296, (ref) vu390, (ref) vu391
                        vu388 = false
                        vu296:Create(vu390, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0.1), {
                            ["BackgroundTransparency"] = 0.45
                        }):Play()
                        wait()
                        vu296:Create(vu391, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0.1), {
                            ["Size"] = UDim2.new(0, 25, 0, 25)
                        }):Play()
                    end
                    function v392.Unlock(_)
						-- upvalues: (ref) vu388, (ref) vu296, (ref) vu390, (ref) vu391
                        vu388 = true
                        vu296:Create(vu390, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0.1), {
                            ["BackgroundTransparency"] = 1
                        }):Play()
                        wait()
                        vu296:Create(vu391, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0.1), {
                            ["Size"] = UDim2.new(0, 0, 0, 0)
                        }):Play()
                    end
                    return v392
                end
                function SettingsButton(p393, pu394)
					-- upvalues: (ref) vu359, (ref) vu365, (ref) vu327, (ref) vu296
                    local v395 = Instance.new("Frame")
                    local vu396 = Instance.new("Frame")
                    local v397 = Instance.new("UICorner")
                    local vu398 = Instance.new("TextLabel")
                    local v399 = Instance.new("TextButton")
                    v395.Name = "ButtonFrameSetting"
                    v395.Parent = vu359
                    v395.BackgroundColor3 = Color3.fromRGB(122, 122, 122)
                    v395.BackgroundTransparency = 1
                    v395.Size = UDim2.new(0, 255, 0, 26)
                    vu396.Name = "BtnFrameSetting"
                    vu396.Parent = v395
                    vu396.BackgroundColor3 = Color3.fromRGB(0, 155, 255)
                    vu396.BorderSizePixel = 0
                    vu396.Position = UDim2.new(0.0240000002, 0, 0, 0)
                    vu396.Size = UDim2.new(0, 239, 0, 26)
                    vu396.ClipsDescendants = true
                    v397.CornerRadius = UDim.new(0, 3)
                    v397.Name = "UICornerBtnSetting"
                    v397.Parent = vu396
                    vu398.Name = "BtnSetting"
                    vu398.Parent = vu396
                    vu398.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    vu398.BackgroundTransparency = 1
                    vu398.Size = UDim2.new(0, 239, 0, 26)
                    vu398.Font = Enum.Font.GothamBold
                    vu398.Text = p393
                    vu398.TextColor3 = Color3.fromRGB(255, 255, 255)
                    vu398.TextSize = 14
                    v399.Name = "ButtonSetting"
                    v399.Parent = v395
                    v399.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    v399.BackgroundTransparency = 1
                    v399.Size = UDim2.new(0, 255, 0, 26)
                    v399.Font = Enum.Font.SourceSans
                    v399.Text = ""
                    v399.TextColor3 = Color3.fromRGB(0, 0, 0)
                    v399.TextSize = 14
                    v399.MouseButton1Click:Connect(function()
						-- upvalues: (ref) vu365, (ref) vu327, (ref) vu396, (ref) vu398, (ref) vu296, (ref) pu394
                        if vu365 == true then
                            vu327(vu396, Color3.fromRGB(255, 255, 255), Color3.fromRGB(255, 255, 255))
                            vu398.TextSize = 0
                            vu296:Create(vu398, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                ["TextSize"] = 14
                            }):Play()
                            pu394()
                        end
                    end)
                end
                return {
                    ["CraftTab"] = function(_, p400)
						-- upvalues: (ref) vu352, (ref) vu363, (ref) vu359, (ref) vu327, (ref) vu296, (ref) vu364, (ref) vu366, (ref) vu365
                        if not tostring(p400) then
                            tostring(math.random(1, 5000))
                        end
                        local vu401 = Instance.new("Frame")
                        local v402 = Instance.new("UICorner")
                        local vu403 = Instance.new("TextLabel")
                        local v404 = Instance.new("TextButton")
                        Instance.new("Frame")
                        Instance.new("UICorner")
                        vu401.Name = "TabFrame"
                        vu401.Parent = vu352
                        vu401.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
                        vu401.ClipsDescendants = true
                        vu401.Size = UDim2.new(0, 100, 0, 24)
                        v402.CornerRadius = UDim.new(0, 4)
                        v402.Name = "TabUICorner"
                        v402.Parent = vu401
                        vu403.Name = "LabelTab"
                        vu403.Parent = vu401
                        vu403.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        vu403.BackgroundTransparency = 1
                        vu403.Size = UDim2.new(0, 100, 0, 24)
                        vu403.Font = Enum.Font.GothamBold
                        vu403.Text = p400
                        vu403.TextColor3 = Color3.fromRGB(255, 255, 255)
                        vu403.TextSize = 13
                        v404.Name = p400 .. "Server"
                        v404.Parent = vu401
                        v404.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        v404.BackgroundTransparency = 1
                        v404.Size = UDim2.new(0, 100, 0, 24)
                        v404.Font = Enum.Font.SourceSans
                        v404.Text = ""
                        v404.TextColor3 = Color3.fromRGB(0, 0, 0)
                        v404.TextSize = 14
                        local vu405 = Instance.new("Frame")
                        local v406 = Instance.new("UICorner")
                        local vu407 = Instance.new("ScrollingFrame")
                        local v408 = Instance.new("UIListLayout")
                        local vu409 = Instance.new("Frame")
                        local vu410 = Instance.new("UIListLayout")
                        local v411 = Instance.new("UIPadding")
                        local vu412 = Instance.new("Frame")
                        local vu413 = Instance.new("UIListLayout")
                        local v414 = Instance.new("UIPadding")
                        vu405.Name = "PageMain"
                        vu405.Parent = vu363
                        vu405.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                        vu405.ClipsDescendants = true
                        vu405.Position = UDim2.new(0.00529100513, 0, 0.00161030598, 0)
                        vu405.Size = UDim2.new(0, 567, 0, 621)
                        v406.CornerRadius = UDim.new(0, 4)
                        v406.Name = "PageMainUICorner"
                        v406.Parent = vu405
                        vu407.Name = "Scrolling_PageMain"
                        vu407.Parent = vu405
                        vu407.Active = true
                        vu407.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        vu407.BackgroundTransparency = 1
                        vu407.BorderSizePixel = 0
                        vu407.Size = UDim2.new(0, 567, 0, 621)
                        vu407.CanvasSize = UDim2.new(0, 0, 0, 0)
                        vu407.ScrollBarThickness = 4
                        v408.Parent = vu407
                        v408.FillDirection = Enum.FillDirection.Horizontal
                        v408.SortOrder = Enum.SortOrder.LayoutOrder
                        v408.Padding = UDim.new(0, 5)
                        vu409.Name = "Pageleft"
                        vu409.Parent = vu407
                        vu409.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                        vu409.BackgroundTransparency = 1
                        vu409.BorderSizePixel = 0
                        vu409.ClipsDescendants = true
                        vu409.Size = UDim2.new(0, 274, 0, 604)
                        vu410.Name = "UIListLayout_Pageleft"
                        vu410.Parent = vu409
                        vu410.SortOrder = Enum.SortOrder.LayoutOrder
                        vu410.Padding = UDim.new(0, 10)
                        v411.Parent = vu407
                        v411.PaddingLeft = UDim.new(0, 7)
                        v411.PaddingTop = UDim.new(0, 8)
                        vu412.Name = "Pageright"
                        vu412.Parent = vu407
                        vu412.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                        vu412.BackgroundTransparency = 1
                        vu412.BorderSizePixel = 0
                        vu412.ClipsDescendants = true
                        vu412.Size = UDim2.new(0, 274, 0, 604)
                        vu413.Name = "UIListLayout_Pageleft"
                        vu413.Parent = vu412
                        vu413.SortOrder = Enum.SortOrder.LayoutOrder
                        vu413.Padding = UDim.new(0, 10)
                        v414.Name = "UIPaddingSetting"
                        v414.Parent = vu359
                        v414.PaddingTop = UDim.new(0, 10)
                        game:GetService("RunService").Stepped:Connect(function()
							-- upvalues: (ref) vu409, (ref) vu410
                            vu409.Size = UDim2.new(0, 274, 0, vu410.AbsoluteContentSize.Y + 5)
                        end)
                        game:GetService("RunService").Stepped:Connect(function()
							-- upvalues: (ref) vu412, (ref) vu413
                            vu412.Size = UDim2.new(0, 274, 0, vu413.AbsoluteContentSize.Y + 5)
                        end)
                        game:GetService("RunService").Stepped:Connect(function()
							-- upvalues: (ref) vu410, (ref) vu413, (ref) vu407
                            if vu410.AbsoluteContentSize.Y > vu413.AbsoluteContentSize.Y then
                                vu407.CanvasSize = UDim2.new(0, 0, 0, vu410.AbsoluteContentSize.Y + 10)
                            end
                        end)
                        game:GetService("RunService").Stepped:Connect(function()
							-- upvalues: (ref) vu413, (ref) vu410, (ref) vu407
                            if vu413.AbsoluteContentSize.Y > vu410.AbsoluteContentSize.Y then
                                vu407.CanvasSize = UDim2.new(0, 0, 0, vu413.AbsoluteContentSize.Y + 10)
                            end
                        end)
                        v404.MouseButton1Click:Connect(function()
							-- upvalues: (ref) vu327, (ref) vu401, (ref) vu403, (ref) vu296, (ref) vu363, (ref) vu405, (ref) vu364
                            vu327(vu401, Color3.fromRGB(255, 255, 255), Color3.fromRGB(255, 255, 255))
                            vu403.TextSize = 0
                            vu296:Create(vu403, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                ["TextSize"] = 13
                            }):Play()
                            local v415 = next
                            local v416, v417 = vu363:GetChildren()
                            while true do
                                local v418
                                v417, v418 = v415(v416, v417)
                                if v417 == nil then
                                    break
                                end
                                if vu405.Name == "PageMain" then
                                    vu364:JumpTo(vu405)
                                end
                            end
                        end)
                        if vu366 == false then
                            vu364:JumpToIndex(1)
                            vu366 = true
                        end
                        return {
                            ["CraftPage"] = function(_, p419, p420)
								-- upvalues: (ref) vu409, (ref) vu412, (ref) vu365, (ref) vu327, (ref) vu296
                                local vu421 = Instance.new("Frame")
                                local v422 = Instance.new("UICorner")
                                local v423 = Instance.new("Frame")
                                local v424 = Instance.new("TextLabel")
                                local vu425 = Instance.new("UIListLayout")
                                local function v427(p426)
									-- upvalues: (ref) vu409, (ref) vu412
                                    if p426 == 1 then
                                        return vu409
                                    elseif p426 == 2 then
                                        return vu412
                                    else
                                        return vu409
                                    end
                                end
                                vu421.Name = "Page"
                                vu421.Parent = v427(p420)
                                vu421.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
                                vu421.Size = UDim2.new(0, 274, 0, 604)
                                vu421.Visible = true
                                vu421.ClipsDescendants = true
                                v422.CornerRadius = UDim.new(0, 4)
                                v422.Name = "UICorner_Page"
                                v422.Parent = vu421
                                v423.Name = "PageFrame"
                                v423.Parent = vu421
                                v423.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                v423.BackgroundTransparency = 1
                                v423.Size = UDim2.new(0, 274, 0, 24)
                                v424.Name = "TextPage"
                                v424.Parent = v423
                                v424.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                v424.BackgroundTransparency = 1
                                v424.BorderSizePixel = 0
                                v424.Position = UDim2.new(0.0401459858, 0, 0.0978244171, 0)
                                v424.Size = UDim2.new(0, 251, 0, 19)
                                v424.Font = Enum.Font.GothamBold
                                v424.Text = p419
                                v424.TextColor3 = Color3.fromRGB(255, 255, 255)
                                v424.TextSize = 13
                                v424.TextXAlignment = Enum.TextXAlignment.Left
                                vu425.Name = "UIListLayout_Page"
                                vu425.Parent = vu421
                                vu425.SortOrder = Enum.SortOrder.LayoutOrder
                                vu425.Padding = UDim.new(0, 5)
                                game:GetService("RunService").Stepped:Connect(function()
									-- upvalues: (ref) vu421, (ref) vu425
                                    vu421.Size = UDim2.new(0, 274, 0, vu425.AbsoluteContentSize.Y + 15)
                                end)
                                return {
                                    ["Button"] = function(_, p428, pu429)
										-- upvalues: (ref) vu421, (ref) vu365, (ref) vu327, (ref) vu296
                                        local v430 = Instance.new("Frame")
                                        local vu431 = Instance.new("Frame")
                                        local vu432 = Instance.new("TextLabel")
                                        local v433 = Instance.new("UICorner")
                                        local v434 = Instance.new("TextButton")
                                        v430.Name = "Btn"
                                        v430.Parent = vu421
                                        v430.BackgroundColor3 = Color3.fromRGB(255, 0, 255)
                                        v430.BackgroundTransparency = 1
                                        v430.BorderColor3 = Color3.fromRGB(27, 42, 53)
                                        v430.Position = UDim2.new(0, 0, 0.0562913902, 0)
                                        v430.Size = UDim2.new(0, 274, 0, 28)
                                        vu431.Name = "Button"
                                        vu431.Parent = v430
                                        vu431.AnchorPoint = Vector2.new(0.5, 0.5)
                                        vu431.BackgroundColor3 = Color3.fromRGB(0, 155, 255)
                                        vu431.BorderSizePixel = 0
                                        vu431.ClipsDescendants = true
                                        vu431.Position = UDim2.new(0.5, 0, 0.5, 0)
                                        vu431.Size = UDim2.new(0, 262, 0, 24)
                                        vu432.Name = "TextButton"
                                        vu432.Parent = vu431
                                        vu432.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                        vu432.BackgroundTransparency = 1
                                        vu432.Size = UDim2.new(0, 262, 0, 24)
                                        vu432.Font = Enum.Font.GothamBold
                                        vu432.Text = p428
                                        vu432.TextColor3 = Color3.fromRGB(255, 255, 255)
                                        vu432.TextSize = 14
                                        v433.CornerRadius = UDim.new(0, 4)
                                        v433.Name = "UICorner_Button"
                                        v433.Parent = vu431
                                        v434.Name = "Button"
                                        v434.Parent = v430
                                        v434.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                        v434.BackgroundTransparency = 1
                                        v434.Size = UDim2.new(0, 274, 0, 28)
                                        v434.Font = Enum.Font.SourceSans
                                        v434.Text = ""
                                        v434.TextColor3 = Color3.fromRGB(0, 0, 0)
                                        v434.TextSize = 14
                                        v434.MouseButton1Click:Connect(function()
											-- upvalues: (ref) vu365, (ref) vu327, (ref) vu431, (ref) vu432, (ref) vu296, (ref) pu429
                                            if vu365 == false then
                                                vu327(vu431, Color3.fromRGB(255, 255, 255), Color3.fromRGB(255, 255, 255))
                                                vu432.TextSize = 0
                                                vu296:Create(vu432, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                                    ["TextSize"] = 14
                                                }):Play()
                                                pu429()
                                                vu296:Create(vu431, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                                                    ["Size"] = UDim2.new(0, 270, 0, 20)
                                                }):Play()
                                                wait(0.1)
                                                vu296:Create(vu431, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                                                    ["Size"] = UDim2.new(0, 262, 0, 24)
                                                }):Play()
                                            end
                                        end)
                                    end,
                                    ["Slider"] = function(_, p435, pu436, pu437, pu438, pu439, pu440)
										-- upvalues: (ref) vu421
                                        local v441 = Instance.new("Frame")
                                        local v442 = Instance.new("TextLabel")
                                        local v443 = Instance.new("Frame")
                                        local vu444 = Instance.new("TextBox")
                                        local v445 = Instance.new("UICorner")
                                        local vu446 = Instance.new("Frame")
                                        local v447 = Instance.new("UICorner")
                                        local v448 = Instance.new("Frame")
                                        local v449 = Instance.new("UICorner")
                                        local vu450 = Instance.new("Frame")
                                        local v451 = Instance.new("UICorner")
                                        local v452 = {}
                                        v441.Name = "SliderFrame"
                                        v441.Parent = vu421
                                        v441.BackgroundColor3 = Color3.fromRGB(53, 53, 53)
                                        v441.Position = UDim2.new(0.109489053, 0, 0.708609283, 0)
                                        v441.Size = UDim2.new(0, 274, 0, 54)
                                        v441.BackgroundTransparency = 1
                                        v442.Name = "LabelNameSlider"
                                        v442.Parent = v441
                                        v442.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                        v442.BackgroundTransparency = 1
                                        v442.Position = UDim2.new(0.0729926974, 0, 0.0396823473, 0)
                                        v442.Size = UDim2.new(0, 182, 0, 25)
                                        v442.Font = Enum.Font.GothamBold
                                        v442.Text = tostring(p435)
                                        v442.TextColor3 = Color3.fromRGB(255, 255, 255)
                                        v442.TextSize = 14
                                        v442.TextXAlignment = Enum.TextXAlignment.Left
                                        v443.Name = "ShowValueFrame"
                                        v443.Parent = v441
                                        v443.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                                        v443.Position = UDim2.new(0.733576655, 0, 0.0656082779, 0)
                                        v443.Size = UDim2.new(0, 58, 0, 21)
                                        vu444.Name = "CustomValue"
                                        vu444.Parent = v443
                                        vu444.AnchorPoint = Vector2.new(0.5, 0.5)
                                        vu444.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                        vu444.BackgroundTransparency = 1
                                        vu444.Position = UDim2.new(0.5, 0, 0.5, 0)
                                        vu444.Size = UDim2.new(0, 55, 0, 21)
                                        vu444.Font = Enum.Font.GothamBold
                                        vu444.Text = "50"
                                        vu444.TextColor3 = Color3.fromRGB(255, 255, 255)
                                        vu444.TextSize = 11
                                        v445.CornerRadius = UDim.new(0, 4)
                                        v445.Name = "ShowValueFrameUICorner"
                                        v445.Parent = v443
                                        vu446.Name = "ValueFrame"
                                        vu446.Parent = v441
                                        vu446.AnchorPoint = Vector2.new(0.5, 0.5)
                                        vu446.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                                        vu446.Position = UDim2.new(0.5, 0, 0.777777791, 0)
                                        vu446.Size = UDim2.new(0, 245, 0, 5)
                                        v447.CornerRadius = UDim.new(0, 30)
                                        v447.Name = "ValueFrameUICorner"
                                        v447.Parent = vu446
                                        v448.Name = "PartValue"
                                        v448.Parent = vu446
                                        v448.AnchorPoint = Vector2.new(0.5, 0.5)
                                        v448.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                                        v448.BackgroundTransparency = 1
                                        v448.Position = UDim2.new(0.5, 0, 0.777777791, 0)
                                        v448.Size = UDim2.new(0, 245, 0, 5)
                                        v449.CornerRadius = UDim.new(0, 30)
                                        v449.Name = "PartValueUICorner"
                                        v449.Parent = v448
                                        vu450.Name = "MainValue"
                                        vu450.Parent = v448
                                        vu450.BackgroundColor3 = Color3.fromRGB(0, 155, 255)
                                        vu450.Size = UDim2.new((pu439 or 0) / pu438, 0, 0, 5)
                                        vu450.BorderSizePixel = 0
                                        v451.CornerRadius = UDim.new(0, 30)
                                        v451.Name = "MainValueUICorner"
                                        v451.Parent = vu450
                                        local vu453 = Instance.new("Frame")
                                        vu453.Name = "ConneValue"
                                        vu453.Parent = v448
                                        vu453.AnchorPoint = Vector2.new(0.5, 0.5)
                                        vu453.BackgroundColor3 = Color3.fromRGB(0, 135, 255)
                                        vu453.Position = UDim2.new((pu439 or 0) / pu438, 0.5, 0.5, 0, 0)
                                        vu453.Size = UDim2.new(0, 13, 0, 13)
                                        vu453.BorderSizePixel = 0
                                        local v454 = Instance.new("UICorner")
                                        v454.CornerRadius = UDim.new(0, 10)
                                        v454.Parent = vu453
                                        if pu436 == true then
                                            vu444.Text = tostring(pu439 and (string.format(pu439 / pu438 * (pu438 - pu437) + pu437) or 0) or 0)
                                        else
                                            vu444.Text = tostring(pu439 and (math.floor(pu439 / pu438 * (pu438 - pu437) + pu437) or 0) or 0)
                                        end
                                        local function vu459(p455)
											-- upvalues: (ref) vu446, (ref) vu450, (ref) vu453, (ref) pu436, (ref) pu438, (ref) pu437, (ref) vu444, (ref) pu440
                                            local v456 = UDim2.new(math.clamp((p455.Position.X - vu446.AbsolutePosition.X) / vu446.AbsoluteSize.X, 0, 1), 0, 0.5, 0)
                                            vu450:TweenSize(UDim2.new(math.clamp((p455.Position.X - vu446.AbsolutePosition.X) / vu446.AbsoluteSize.X, 0, 1), 0, 0, 5), "Out", "Sine", 0.2, true)
                                            vu453:TweenPosition(v456, "Out", "Sine", 0.2, true)
                                            if pu436 ~= true then
                                                local v457 = math.floor(v456.X.Scale * pu438 / pu438 * (pu438 - pu437) + pu437)
                                                vu444.Text = tostring(v457)
                                                pu440(v457)
                                            else
                                                local v458 = string.format("%.0f", v456.X.Scale * pu438 / pu438 * (pu438 - pu437) + pu437)
                                                vu444.Text = tostring(v458)
                                                pu440(v458)
                                            end
                                        end
                                        local vu460 = false
                                        vu453.InputBegan:Connect(function(p461)
											-- upvalues: (ref) vu460
                                            if p461.UserInputType == Enum.UserInputType.MouseButton1 then
                                                vu460 = true
                                            end
                                        end)
                                        vu453.InputEnded:Connect(function(p462)
											-- upvalues: (ref) vu460
                                            if p462.UserInputType == Enum.UserInputType.MouseButton1 then
                                                vu460 = false
                                            end
                                        end)
                                        v441.InputBegan:Connect(function(p463)
											-- upvalues: (ref) vu460
                                            if p463.UserInputType == Enum.UserInputType.MouseButton1 then
                                                vu460 = true
                                            end
                                        end)
                                        v441.InputEnded:Connect(function(p464)
											-- upvalues: (ref) vu460
                                            if p464.UserInputType == Enum.UserInputType.MouseButton1 then
                                                vu460 = false
                                            end
                                        end)
                                        vu446.InputBegan:Connect(function(p465)
											-- upvalues: (ref) vu460
                                            if p465.UserInputType == Enum.UserInputType.MouseButton1 then
                                                vu460 = true
                                            end
                                        end)
                                        vu446.InputEnded:Connect(function(p466)
											-- upvalues: (ref) vu460
                                            if p466.UserInputType == Enum.UserInputType.MouseButton1 then
                                                vu460 = false
                                            end
                                        end)
                                        game:GetService("UserInputService").InputChanged:Connect(function(p467)
											-- upvalues: (ref) vu460, (ref) vu459
                                            if vu460 and p467.UserInputType == Enum.UserInputType.MouseMovement then
                                                vu459(p467)
                                            end
                                        end)
                                        vu444.FocusLost:Connect(function()
											-- upvalues: (ref) vu444, (ref) pu439, (ref) pu438, (ref) vu450, (ref) vu453, (ref) pu436, (ref) pu437, (ref) pu440
                                            if vu444.Text == "" then
                                                vu444.Text = pu439
                                            end
                                            if pu438 < tonumber(vu444.Text) then
                                                vu444.Text = pu438
                                            end
                                            vu450:TweenSize(UDim2.new((vu444.Text or 0) / pu438, 0, 0, 5), "Out", "Sine", 0.2, true)
                                            vu453:TweenPosition(UDim2.new((vu444.Text or 0) / pu438, 0, 0.6, 0), "Out", "Sine", 0.2, true)
                                            if pu436 ~= true then
                                                local v468 = vu444
                                                local v469 = tostring
                                                local v470 = vu444.Text
                                                if v470 then
                                                    v470 = math.floor(vu444.Text / pu438 * (pu438 - pu437) + pu437)
                                                end
                                                v468.Text = v469(v470)
                                            else
                                                local v471 = vu444
                                                local v472 = tostring
                                                local v473 = vu444.Text
                                                if v473 then
                                                    v473 = string.format("%.0f", vu444.Text / pu438 * (pu438 - pu437) + pu437)
                                                end
                                                v471.Text = v472(v473)
                                            end
                                            pcall(pu440, vu444.Text)
                                        end)
                                        function v452.Update(_, pu474)
											-- upvalues: (ref) vu450, (ref) pu438, (ref) vu453, (ref) vu444, (ref) pu440
                                            vu450:TweenSize(UDim2.new((pu474 or 0) / pu438, 0, 0, 5), "Out", "Sine", 0.2, true)
                                            vu453:TweenPosition(UDim2.new((pu474 or 0) / pu438, 0.5, 0.5, 0, 0), "Out", "Sine", 0.2, true)
                                            vu444.Text = pu474
                                            pcall(function()
												-- upvalues: (ref) pu440, (ref) pu474
                                                pu440(pu474)
                                            end)
                                        end
                                        return v452
                                    end,
                                    ["Dropdown"] = function(_, pu475, p476, p477, pu478)
										-- upvalues: (ref) vu421, (ref) vu365, (ref) vu327, (ref) vu296
                                        local v479 = Instance.new("Frame")
                                        local vu480 = Instance.new("Frame")
                                        local v481 = Instance.new("UICorner")
                                        local vu482 = Instance.new("TextLabel")
                                        local vu483 = Instance.new("ImageLabel")
                                        local vu484 = Instance.new("Frame")
                                        local v485 = Instance.new("Frame")
                                        local v486 = Instance.new("UICorner")
                                        local vu487 = Instance.new("ScrollingFrame")
                                        local vu488 = Instance.new("UIListLayout")
                                        local v489 = Instance.new("UIPadding")
                                        local v490 = Instance.new("TextButton")
                                        local vu491 = false
                                        local v492 = p477 == nil and "nil" or p477
                                        v479.Name = "Drop_Frame"
                                        v479.Parent = vu421
                                        v479.AnchorPoint = Vector2.new(0.5, 0.5)
                                        v479.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                        v479.BackgroundTransparency = 1
                                        v479.ClipsDescendants = true
                                        v479.Position = UDim2.new(0, 0, 0.392454112, 0)
                                        v479.Size = UDim2.new(0, 274, 0, 27)
                                        vu480.Name = "DropDownFrame"
                                        vu480.Parent = v479
                                        vu480.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                                        vu480.BorderSizePixel = 0
                                        vu480.ClipsDescendants = true
                                        vu480.Position = UDim2.new(0.0255474448, 0, 0, 0)
                                        vu480.Size = UDim2.new(0, 258, 0, 27)
                                        v481.CornerRadius = UDim.new(0, 4)
                                        v481.Name = "UICorner_Drop"
                                        v481.Parent = vu480
                                        vu482.Name = "Label_Drop"
                                        vu482.Parent = vu480
                                        vu482.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                        vu482.BackgroundTransparency = 1
                                        vu482.Position = UDim2.new(0.0348837227, 0, 0, 0)
                                        vu482.Size = UDim2.new(0, 202, 0, 26)
                                        vu482.Font = Enum.Font.GothamBold
                                        vu482.Text = pu475 .. " : " .. v492
                                        vu482.TextColor3 = Color3.fromRGB(255, 255, 255)
                                        vu482.TextSize = 14
                                        vu482.TextXAlignment = Enum.TextXAlignment.Left
                                        vu483.Name = "Arrow"
                                        vu483.Parent = vu480
                                        vu483.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                        vu483.BackgroundTransparency = 1
                                        vu483.Position = UDim2.new(0.871363997, 0, 0.0370371342, 0)
                                        vu483.Rotation = 180
                                        vu483.Size = UDim2.new(0, 24, 0, 24)
                                        vu483.Image = "rbxassetid://6031094670"
                                        vu484.Name = "Down_Frame"
                                        vu484.Parent = vu421
                                        vu484.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                        vu484.BackgroundTransparency = 1
                                        vu484.Position = UDim2.new(0, 0, 0.445364237, 0)
                                        vu484.Size = UDim2.new(0, 274, 0, 0)
                                        vu484.ClipsDescendants = true
                                        v485.Name = "Down"
                                        v485.Parent = vu484
                                        v485.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                                        v485.BorderSizePixel = 0
                                        v485.Position = UDim2.new(0.0255474448, 0, 0.0190476142, 0)
                                        v485.Size = UDim2.new(0, 258, 0, 100)
                                        v486.CornerRadius = UDim.new(0, 4)
                                        v486.Name = "UICorner_Down"
                                        v486.Parent = v485
                                        vu487.Name = "ScrollingDownFrame"
                                        vu487.Parent = v485
                                        vu487.Active = true
                                        vu487.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                        vu487.BackgroundTransparency = 1
                                        vu487.BorderSizePixel = 0
                                        vu487.Size = UDim2.new(0, 258, 0, 100)
                                        vu487.CanvasSize = UDim2.new(0, 0, 0, 0)
                                        vu487.ScrollBarThickness = 4
                                        vu488.Name = "UIListLayout_Dwon"
                                        vu488.Parent = vu487
                                        vu488.SortOrder = Enum.SortOrder.LayoutOrder
                                        vu488.Padding = UDim.new(0, 7)
                                        v489.Name = "UIPadding_Down"
                                        v489.Parent = vu487
                                        v489.PaddingTop = UDim.new(0, 10)
                                        v490.Name = "ButtonItem"
                                        v490.Parent = v479
                                        v490.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                        v490.BackgroundTransparency = 1
                                        v490.Font = Enum.Font.SourceSans
                                        v490.Text = ""
                                        v490.TextColor3 = Color3.fromRGB(0, 0, 0)
                                        v490.TextSize = 14
                                        v490.Size = UDim2.new(0, 274, 0, 27)
                                        if v492 ~= "nil" then
                                            pu478(v492)
                                        end
                                        v490.MouseButton1Click:Connect(function()
											-- upvalues: (ref) vu365, (ref) vu491, (ref) vu327, (ref) vu480, (ref) vu296, (ref) vu484, (ref) vu483
                                            if vu365 == false then
                                                if vu491 ~= false then
                                                    if vu491 == true then
                                                        vu491 = false
                                                        vu327(vu480, Color3.fromRGB(255, 255, 255), Color3.fromRGB(255, 255, 255))
                                                        vu296:Create(vu484, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                                            ["Size"] = UDim2.new(0, 274, 0, 0)
                                                        }):Play()
                                                        vu296:Create(vu483, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                                                            ["Rotation"] = 180
                                                        }):Play()
                                                    end
                                                else
                                                    vu491 = true
                                                    vu327(vu480, Color3.fromRGB(255, 255, 255), Color3.fromRGB(255, 255, 255))
                                                    vu296:Create(vu484, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                                        ["Size"] = UDim2.new(0, 274, 0, 105)
                                                    }):Play()
                                                    vu296:Create(vu483, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                                                        ["Rotation"] = 270
                                                    }):Play()
                                                end
                                            end
                                        end)
                                        local v493, v494, v495 = pairs(p476)
                                        while true do
                                            local vu496
                                            v495, vu496 = v493(v494, v495)
                                            if v495 == nil then
                                                break
                                            end
                                            local v497 = Instance.new("Frame")
                                            local vu498 = Instance.new("Frame")
                                            local v499 = Instance.new("UICorner")
                                            local vu500 = Instance.new("TextLabel")
                                            local v501 = Instance.new("TextButton")
                                            v497.Name = "ItemFrame"
                                            v497.Parent = vu487
                                            v497.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                            v497.BackgroundTransparency = 1
                                            v497.Size = UDim2.new(0, 258, 0, 24)
                                            vu498.Name = "Item"
                                            vu498.Parent = v497
                                            vu498.BackgroundColor3 = Color3.fromRGB(0, 155, 255)
                                            vu498.BorderSizePixel = 0
                                            vu498.Position = UDim2.new(0.0503875986, 0, 0, 0)
                                            vu498.Size = UDim2.new(0, 234, 0, 24)
                                            vu498.ClipsDescendants = true
                                            v499.CornerRadius = UDim.new(0, 4)
                                            v499.Name = "UICorner_Item"
                                            v499.Parent = vu498
                                            vu500.Name = "ItemLabel"
                                            vu500.Parent = vu498
                                            vu500.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                            vu500.BackgroundTransparency = 1
                                            vu500.Size = UDim2.new(0, 233, 0, 24)
                                            vu500.Font = Enum.Font.GothamBold
                                            vu500.Text = tostring(vu496)
                                            vu500.TextColor3 = Color3.fromRGB(255, 255, 255)
                                            vu500.TextSize = 14
                                            v501.Name = "ButtonItem"
                                            v501.Parent = v497
                                            v501.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                            v501.BackgroundTransparency = 1
                                            v501.Size = UDim2.new(0, 256, 0, 24)
                                            v501.Font = Enum.Font.SourceSans
                                            v501.Text = ""
                                            v501.TextColor3 = Color3.fromRGB(0, 0, 0)
                                            v501.TextSize = 14
                                            v501.MouseButton1Down:Connect(function()
												-- upvalues: (ref) vu365, (ref) vu500, (ref) vu296, (ref) vu482, (ref) pu475, (ref) vu496, (ref) vu327, (ref) vu498, (ref) pu478, (ref) vu491, (ref) vu484, (ref) vu483
                                                if vu365 == false then
                                                    vu500.TextSize = 0
                                                    vu296:Create(vu500, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0.1), {
                                                        ["TextSize"] = 12
                                                    }):Play()
                                                    vu482.Text = tostring(pu475 .. " : " .. vu496)
                                                    vu327(vu498, Color3.fromRGB(255, 255, 255), Color3.fromRGB(255, 255, 255))
                                                    pu478(vu496)
                                                    vu491 = false
                                                    vu296:Create(vu484, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                                        ["Size"] = UDim2.new(0, 274, 0, 0)
                                                    }):Play()
                                                    vu296:Create(vu483, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                                        ["Rotation"] = 180
                                                    }):Play()
                                                end
                                            end)
                                        end
                                        vu487.CanvasSize = UDim2.new(0, 0, 0, vu488.AbsoluteContentSize.Y + 10)
                                        return {
                                            ["Add"] = function(_, pu502)
												-- upvalues: (ref) vu487, (ref) vu365, (ref) vu296, (ref) vu482, (ref) pu475, (ref) vu327, (ref) pu478, (ref) vu491, (ref) vu484, (ref) vu483, (ref) vu488
                                                local v503 = Instance.new("Frame")
                                                local vu504 = Instance.new("Frame")
                                                local v505 = Instance.new("UICorner")
                                                local vu506 = Instance.new("TextLabel")
                                                local v507 = Instance.new("TextButton")
                                                v503.Name = "ItemFrame"
                                                v503.Parent = vu487
                                                v503.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                                v503.BackgroundTransparency = 1
                                                v503.Size = UDim2.new(0, 258, 0, 24)
                                                vu504.Name = "Item"
                                                vu504.Parent = v503
                                                vu504.BackgroundColor3 = Color3.fromRGB(0, 155, 255)
                                                vu504.BorderSizePixel = 0
                                                vu504.Position = UDim2.new(0.0503875986, 0, 0, 0)
                                                vu504.Size = UDim2.new(0, 234, 0, 24)
                                                vu504.ClipsDescendants = true
                                                v505.CornerRadius = UDim.new(0, 4)
                                                v505.Name = "UICorner_Item"
                                                v505.Parent = vu504
                                                vu506.Name = "ItemLabel"
                                                vu506.Parent = vu504
                                                vu506.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                                vu506.BackgroundTransparency = 1
                                                vu506.Size = UDim2.new(0, 233, 0, 24)
                                                vu506.Font = Enum.Font.GothamBold
                                                vu506.Text = tostring(pu502)
                                                vu506.TextColor3 = Color3.fromRGB(255, 255, 255)
                                                vu506.TextSize = 14
                                                v507.Name = "ButtonItem"
                                                v507.Parent = v503
                                                v507.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                                v507.BackgroundTransparency = 1
                                                v507.Size = UDim2.new(0, 256, 0, 24)
                                                v507.Font = Enum.Font.SourceSans
                                                v507.Text = ""
                                                v507.TextColor3 = Color3.fromRGB(0, 0, 0)
                                                v507.TextSize = 14
                                                v507.MouseButton1Down:Connect(function()
													-- upvalues: (ref) vu365, (ref) vu506, (ref) vu296, (ref) vu482, (ref) pu475, (ref) pu502, (ref) vu327, (ref) vu504, (ref) pu478, (ref) vu491, (ref) vu484, (ref) vu483
                                                    if vu365 == false then
                                                        vu506.TextSize = 0
                                                        vu296:Create(vu506, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0.1), {
                                                            ["TextSize"] = 12
                                                        }):Play()
                                                        vu482.Text = tostring(pu475 .. " : " .. pu502)
                                                        vu327(vu504, Color3.fromRGB(255, 255, 255), Color3.fromRGB(255, 255, 255))
                                                        pu478(pu502)
                                                        vu491 = false
                                                        vu296:Create(vu484, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                                            ["Size"] = UDim2.new(0, 274, 0, 0)
                                                        }):Play()
                                                        vu296:Create(vu483, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                                            ["Rotation"] = 180
                                                        }):Play()
                                                    end
                                                end)
                                                vu487.CanvasSize = UDim2.new(0, 0, 0, vu488.AbsoluteContentSize.Y + 10)
                                            end,
                                            ["Clear"] = function(_)
												-- upvalues: (ref) vu491, (ref) vu482, (ref) pu475, (ref) vu296, (ref) vu484, (ref) vu483, (ref) vu487, (ref) vu488
                                                vu491 = false
                                                vu482.Text = tostring(pu475) .. " : "
                                                vu296:Create(vu484, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                                    ["Size"] = UDim2.new(0, 274, 0, 0)
                                                }):Play()
                                                vu296:Create(vu483, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                                                    ["Rotation"] = 180
                                                }):Play()
                                                local v508 = next
                                                local v509, v510 = vu487:GetChildren()
                                                while true do
                                                    local v511
                                                    v510, v511 = v508(v509, v510)
                                                    if v510 == nil then
                                                        break
                                                    end
                                                    if v511:IsA("Frame") then
                                                        v511:Destroy()
                                                    end
                                                end
                                                vu487.CanvasSize = UDim2.new(0, 0, 0, vu488.AbsoluteContentSize.Y + 10)
                                            end
                                        }
                                    end,
                                    ["ToggleS"] = function(_, _, p512, pu513)
										-- upvalues: (ref) vu421, (ref) vu365, (ref) vu296
                                        local v514 = Instance.new("Frame")
                                        local v515 = Instance.new("TextLabel")
                                        local v516 = Instance.new("Frame")
                                        local v517 = Instance.new("UICorner")
                                        local vu518 = Instance.new("Frame")
                                        local v519 = Instance.new("UICorner")
                                        local v520 = Instance.new("TextButton")
                                        local vu521 = false
                                        local vu522 = true
                                        local v523 = {}
                                        local vu524 = true
                                        if p512 == nil then
                                            p512 = false
                                        end
                                        v514.Name = "ToggleSFrame"
                                        v514.Parent = vu421
                                        v514.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                        v514.BackgroundTransparency = 1
                                        v514.Position = UDim2.new(0, 0, 0.102649003, 0)
                                        v514.Size = UDim2.new(0, 274, 0, 30)
                                        v515.Name = "LabelToggleS"
                                        v515.Parent = v514
                                        v515.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                        v515.BackgroundTransparency = 1
                                        v515.Position = UDim2.new(0.0620437972, 0, 0, 0)
                                        v515.Size = UDim2.new(0, 177, 0, 30)
                                        v515.Font = Enum.Font.GothamBold
                                        v515.Text = "Toggle"
                                        v515.TextColor3 = Color3.fromRGB(255, 255, 255)
                                        v515.TextSize = 14
                                        v515.TextXAlignment = Enum.TextXAlignment.Left
                                        v516.Name = "ToggleS"
                                        v516.Parent = v514
                                        v516.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                                        v516.BorderSizePixel = 0
                                        v516.Position = UDim2.new(0.733576655, 0, 0.166666672, 0)
                                        v516.Size = UDim2.new(0, 43, 0, 19)
                                        v517.CornerRadius = UDim.new(0, 30)
                                        v517.Name = "UICorner_ToggleS"
                                        v517.Parent = v516
                                        vu518.Name = "ToggleSInner"
                                        vu518.Parent = v516
                                        vu518.AnchorPoint = Vector2.new(0.5, 0.5)
                                        vu518.BackgroundColor3 = Color3.fromRGB(0, 115, 255)
                                        vu518.Position = UDim2.new(0, 10, 0.5, 0)
                                        vu518.Size = UDim2.new(0, 17, 0, 17)
                                        v519.CornerRadius = UDim.new(0, 30)
                                        v519.Name = "UICorner_ToggleSInner"
                                        v519.Parent = vu518
                                        v520.Name = "ToggleSBtn"
                                        v520.Parent = v514
                                        v520.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                        v520.BackgroundTransparency = 1
                                        v520.Size = UDim2.new(0, 274, 0, 30)
                                        v520.Font = Enum.Font.SourceSans
                                        v520.Text = ""
                                        v520.TextColor3 = Color3.fromRGB(0, 0, 0)
                                        v520.TextSize = 14
                                        v520.MouseButton1Click:Connect(function()
											-- upvalues: (ref) vu365, (ref) vu521, (ref) vu522, (ref) vu296, (ref) vu518, (ref) pu513
                                            if vu365 == false then
                                                if vu521 ~= false or vu522 ~= true then
                                                    if vu521 == true and vu522 == true then
                                                        vu521 = false
                                                        vu296:Create(vu518, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                                                            ["Position"] = UDim2.new(0.76, 0, 0.5, 0)
                                                        }):Play()
                                                        pu513(true)
                                                    end
                                                else
                                                    vu521 = true
                                                    vu296:Create(vu518, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                                                        ["Position"] = UDim2.new(0, 10, 0.5, 0)
                                                    }):Play()
                                                    pu513(false)
                                                end
                                            end
                                        end)
                                        if p512 == true then
                                            vu521 = false
                                            vu296:Create(vu518, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                                                ["Position"] = UDim2.new(0.76, 0, 0.5, 0)
                                            }):Play()
                                            pu513(true)
                                        end
                                        local vu525 = Instance.new("Frame")
                                        local vu526 = Instance.new("ImageLabel")
                                        vu525.Name = "LockerFrame"
                                        vu525.Parent = v514
                                        vu525.Active = true
                                        vu525.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                                        vu525.BackgroundTransparency = 0.2
                                        vu525.BorderSizePixel = 0
                                        vu525.ClipsDescendants = true
                                        vu525.Position = UDim2.new(- 0.0022222228, 0, 0, 0)
                                        vu525.Size = UDim2.new(0, 274, 0, 30)
                                        vu525.BackgroundTransparency = 1
                                        vu526.Name = "LockIcon"
                                        vu526.Parent = vu525
                                        vu526.AnchorPoint = Vector2.new(0.5, 0.5)
                                        vu526.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                        vu526.BackgroundTransparency = 1
                                        vu526.Position = UDim2.new(0.5, 0, 0.5, 0)
                                        vu526.Size = UDim2.new(0, 0, 0, 0)
                                        vu526.Image = "http://www.roblox.com/asset/?id=3926305904"
                                        vu526.ImageRectOffset = Vector2.new(404, 364)
                                        vu526.ImageRectSize = Vector2.new(36, 36)
                                        vu526.ImageColor3 = Color3.fromRGB(255, 25, 25)
                                        function v523.StatsTrue(_)
											-- upvalues: (ref) vu521, (ref) vu522, (ref) vu524, (ref) vu296, (ref) vu518, (ref) pu513
                                            if vu521 == true and vu522 == true or vu524 == true then
                                                vu521 = false
                                                vu524 = false
                                                vu296:Create(vu518, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                                                    ["Position"] = UDim2.new(0.76, 0, 0.5, 0)
                                                }):Play()
                                                pu513(true)
                                            end
                                        end
                                        function v523.StatsFalse(_)
											-- upvalues: (ref) vu521, (ref) vu522, (ref) vu296, (ref) vu518, (ref) pu513
                                            if vu521 == false and vu522 == true then
                                                vu521 = true
                                                vu296:Create(vu518, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                                                    ["Position"] = UDim2.new(0, 10, 0.5, 0)
                                                }):Play()
                                                pu513(false)
                                            end
                                        end
                                        function v523.Lock(_)
											-- upvalues: (ref) vu522, (ref) vu296, (ref) vu525, (ref) vu526
                                            vu522 = false
                                            vu296:Create(vu525, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0.1), {
                                                ["BackgroundTransparency"] = 0.45
                                            }):Play()
                                            wait()
                                            vu296:Create(vu526, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0.1), {
                                                ["Size"] = UDim2.new(0, 25, 0, 25)
                                            }):Play()
                                        end
                                        function v523.Unlock(_)
											-- upvalues: (ref) vu522, (ref) vu296, (ref) vu525, (ref) vu526
                                            vu522 = true
                                            vu296:Create(vu525, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0.1), {
                                                ["BackgroundTransparency"] = 1
                                            }):Play()
                                            wait()
                                            vu296:Create(vu526, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0.1), {
                                                ["Size"] = UDim2.new(0, 0, 0, 0)
                                            }):Play()
                                        end
                                        return v523
                                    end,
                                    ["Seperator"] = function(_, p527)
										-- upvalues: (ref) vu421
                                        local v528 = Instance.new("Frame")
                                        local v529 = Instance.new("TextLabel")
                                        local v530 = Instance.new("Frame")
                                        local v531 = Instance.new("Frame")
                                        v528.Name = "SepFrame"
                                        v528.Parent = vu421
                                        v528.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                        v528.BackgroundTransparency = 1
                                        v528.Position = UDim2.new(0, 0, 0.102649003, 0)
                                        v528.Size = UDim2.new(0, 274, 0, 30)
                                        v529.Name = "LabelSep"
                                        v529.Parent = v528
                                        v529.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                        v529.BackgroundTransparency = 1
                                        v529.Position = UDim2.new(0.0328467153, 0, 0, 0)
                                        v529.Size = UDim2.new(0, 255, 0, 30)
                                        v529.Font = Enum.Font.GothamBold
                                        v529.Text = p527
                                        v529.TextColor3 = Color3.fromRGB(255, 255, 255)
                                        v529.TextSize = 14
                                        v530.Name = "Liner1"
                                        v530.Parent = v528
                                        v530.BackgroundColor3 = Color3.fromRGB(0, 155, 255)
                                        v530.Position = UDim2.new(0.0620437972, 0, 0.5, 0)
                                        v530.Size = UDim2.new(0, 64, 0, 1)
                                        v531.Name = "LIner2"
                                        v531.Parent = v528
                                        v531.BackgroundColor3 = Color3.fromRGB(0, 155, 255)
                                        v531.Position = UDim2.new(0.708029211, 0, 0.5, 0)
                                        v531.Size = UDim2.new(0, 64, 0, 1)
                                    end,
                                    ["Line"] = function(_, _)
										-- upvalues: (ref) vu421
                                        local v532 = Instance.new("Frame")
                                        local v533 = Instance.new("Frame")
                                        v532.Name = "LineFrame"
                                        v532.Parent = vu421
                                        v532.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                        v532.BackgroundTransparency = 1
                                        v532.Position = UDim2.new(0, 0, 0.102649003, 0)
                                        v532.Size = UDim2.new(0, 274, 0, 30)
                                        v533.Name = "Liner"
                                        v533.Parent = v532
                                        v533.BackgroundColor3 = Color3.fromRGB(0, 155, 255)
                                        v533.Position = UDim2.new(0.0620437972, 0, 0.5, 0)
                                        v533.Size = UDim2.new(0, 241, 0, 1)
                                    end,
                                    ["Label"] = function(_, p534)
										-- upvalues: (ref) vu421
                                        local v535 = Instance.new("Frame")
                                        local vu536 = Instance.new("TextLabel")
                                        local v537 = {}
                                        v535.Name = "LabelFrame"
                                        v535.Parent = vu421
                                        v535.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                        v535.BackgroundTransparency = 1
                                        v535.Position = UDim2.new(0, 0, 0.102649003, 0)
                                        v535.Size = UDim2.new(0, 274, 0, 30)
                                        vu536.Name = "LabelTitle"
                                        vu536.Parent = v535
                                        vu536.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                        vu536.BackgroundTransparency = 1
                                        vu536.Position = UDim2.new(0.0328467153, 0, 0, 0)
                                        vu536.Size = UDim2.new(0, 255, 0, 30)
                                        vu536.Font = Enum.Font.GothamBold
                                        vu536.Text = p534
                                        vu536.TextColor3 = Color3.fromRGB(255, 255, 255)
                                        vu536.TextSize = 14
                                        function v537.Update(_, p538)
											-- upvalues: (ref) vu536
                                            vu536.Text = p538
                                        end
                                        return v537
                                    end,
                                    ["Toggle"] = function(_, p539, p540, pu541)
										-- upvalues: (ref) vu421, (ref) vu365, (ref) vu296
                                        local v542 = Instance.new("Frame")
                                        local v543 = Instance.new("TextLabel")
                                        local v544 = Instance.new("ImageLabel")
                                        local vu545 = Instance.new("ImageLabel")
                                        local v546 = Instance.new("UICorner")
                                        local v547 = Instance.new("TextButton")
                                        local vu548 = false
                                        local v549 = Instance.new("UIStroke")
                                        local vu550 = true
                                        local vu551 = true
                                        if p540 == nil then
                                            p540 = false
                                        end
                                        v542.Name = "ToggleFrame"
                                        v542.Parent = vu421
                                        v542.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                        v542.BackgroundTransparency = 1
                                        v542.Position = UDim2.new(0, 0, 0.102649003, 0)
                                        v542.Size = UDim2.new(0, 274, 0, 30)
                                        v543.Name = "LabelToggle"
                                        v543.Parent = v542
                                        v543.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                        v543.BackgroundTransparency = 1
                                        v543.Position = UDim2.new(0.156934306, 0, 0, 0)
                                        v543.Size = UDim2.new(0, 219, 0, 30)
                                        v543.Font = Enum.Font.GothamBold
                                        v543.Text = p539
                                        v543.TextColor3 = Color3.fromRGB(255, 255, 255)
                                        v543.TextSize = 14
                                        v543.TextXAlignment = Enum.TextXAlignment.Left
                                        v544.Name = "Toggle"
                                        v544.Parent = v542
                                        v544.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                        v544.BackgroundTransparency = 1
                                        v544.Position = UDim2.new(0.0401460081, 0, 0.0666666031, 0)
                                        v544.Size = UDim2.new(0, 25, 0, 25)
                                        v544.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
                                        v544.ImageColor3 = Color3.fromRGB(171, 171, 171)
                                        v544.ImageTransparency = 1
                                        v549.Thickness = 1
                                        v549.Name = ""
                                        v549.Parent = v544
                                        v549.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                                        v549.LineJoinMode = Enum.LineJoinMode.Round
                                        v549.Color = Color3.fromRGB(0, 115, 255)
                                        v549.Transparency = 0
                                        vu545.Name = "ToggleInner"
                                        vu545.Parent = v544
                                        vu545.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                        vu545.BackgroundTransparency = 1
                                        vu545.Position = UDim2.new(0.5095, 0, 0.514999986, 0)
                                        vu545.Size = UDim2.new(0, 0, 0, 0)
                                        vu545.Image = "rbxassetid://6031068421"
                                        vu545.ImageColor3 = Color3.fromRGB(0, 115, 255)
                                        vu545.AnchorPoint = Vector2.new(0.5, 0.5)
                                        v546.CornerRadius = UDim.new(0, 4)
                                        v546.Name = "UICorner_Toggle"
                                        v546.Parent = v544
                                        v547.Name = "ToggleBtn"
                                        v547.Parent = v542
                                        v547.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                        v547.BackgroundTransparency = 1
                                        v547.Size = UDim2.new(0, 274, 0, 30)
                                        v547.Font = Enum.Font.SourceSans
                                        v547.Text = ""
                                        v547.TextColor3 = Color3.fromRGB(0, 0, 0)
                                        v547.TextSize = 14
                                        v547.MouseButton1Click:Connect(function()
											-- upvalues: (ref) vu365, (ref) vu548, (ref) vu550, (ref) vu296, (ref) vu545, (ref) pu541
                                            if vu365 == false then
                                                if vu548 ~= false or vu550 ~= true then
                                                    if vu548 == true and vu550 == true then
                                                        vu548 = false
                                                        vu296:Create(vu545, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                                                            ["Size"] = UDim2.new(0, 27, 0, 26)
                                                        }):Play()
                                                        pu541(true)
                                                    end
                                                else
                                                    vu548 = true
                                                    vu296:Create(vu545, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                                        ["Size"] = UDim2.new(0, 0, 0, 0)
                                                    }):Play()
                                                    pu541(false)
                                                end
                                            end
                                        end)
                                        if p540 == true then
                                            vu548 = false
                                            vu296:Create(vu545, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                                                ["Size"] = UDim2.new(0, 27, 0, 26)
                                            }):Play()
                                            pu541(true)
                                        end
                                        local vu552 = Instance.new("Frame")
                                        local vu553 = Instance.new("ImageLabel")
                                        local v554 = {}
                                        vu552.Name = "LockerFrame"
                                        vu552.Parent = v542
                                        vu552.Active = true
                                        vu552.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                                        vu552.BackgroundTransparency = 0.2
                                        vu552.BorderSizePixel = 0
                                        vu552.ClipsDescendants = true
                                        vu552.Position = UDim2.new(- 0.0022222228, 0, 0, 0)
                                        vu552.Size = UDim2.new(0, 274, 0, 30)
                                        vu552.BackgroundTransparency = 1
                                        vu553.Name = "LockIcon"
                                        vu553.Parent = vu552
                                        vu553.AnchorPoint = Vector2.new(0.5, 0.5)
                                        vu553.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                        vu553.BackgroundTransparency = 1
                                        vu553.Position = UDim2.new(0.5, 0, 0.5, 0)
                                        vu553.Size = UDim2.new(0, 0, 0, 0)
                                        vu553.Image = "http://www.roblox.com/asset/?id=3926305904"
                                        vu553.ImageRectOffset = Vector2.new(404, 364)
                                        vu553.ImageRectSize = Vector2.new(36, 36)
                                        vu553.ImageColor3 = Color3.fromRGB(255, 25, 25)
                                        function v554.StatsTrue(_)
											-- upvalues: (ref) vu548, (ref) vu550, (ref) vu551, (ref) vu296, (ref) vu545, (ref) pu541
                                            if vu548 == true and vu550 == true or vu551 == true then
                                                vu551 = false
                                                vu548 = false
                                                vu296:Create(vu545, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                                                    ["Size"] = UDim2.new(0, 27, 0, 26)
                                                }):Play()
                                                pu541(true)
                                            end
                                        end
                                        function v554.StatsFalse(_)
											-- upvalues: (ref) vu548, (ref) vu550, (ref) vu296, (ref) vu545, (ref) pu541
                                            if vu548 == false and vu550 == true then
                                                vu548 = true
                                                vu296:Create(vu545, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                                    ["Size"] = UDim2.new(0, 0, 0, 0)
                                                }):Play()
                                                pu541(false)
                                            end
                                        end
                                        function v554.Lock(_)
											-- upvalues: (ref) vu550, (ref) vu296, (ref) vu552, (ref) vu553
                                            vu550 = false
                                            vu296:Create(vu552, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0.1), {
                                                ["BackgroundTransparency"] = 0.45
                                            }):Play()
                                            wait()
                                            vu296:Create(vu553, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0.1), {
                                                ["Size"] = UDim2.new(0, 25, 0, 25)
                                            }):Play()
                                        end
                                        function v554.Unlock(_)
											-- upvalues: (ref) vu550, (ref) vu296, (ref) vu552, (ref) vu553
                                            vu550 = true
                                            vu296:Create(vu552, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0.1), {
                                                ["BackgroundTransparency"] = 1
                                            }):Play()
                                            wait()
                                            vu296:Create(vu553, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0.1), {
                                                ["Size"] = UDim2.new(0, 0, 0, 0)
                                            }):Play()
                                        end
                                        return v554
                                    end
                                }
                            end
                        }
                    end
                }
            end
        }):Window("UUltimatLY Hub")
        local v556 = v555:CraftTab("Main Farm")
        local v557 = v555:CraftTab("Misc Farm")
        local v558 = v555:CraftTab("Stats")
        local v559 = v555:CraftTab("Combat")
        local v560 = v555:CraftTab("Teleport")
        local v561 = v555:CraftTab("Dungeon")
        local v562 = v555:CraftTab("Races V4")
        local v563 = v555:CraftTab("Shop")
        local v564 = v555:CraftTab("Devil Fruit")
        local v565 = v555:CraftTab("Misc")
        local v566 = v556:CraftPage("Main Farm", 1)
        local v567 = v556:CraftPage("", 2)
        local v568 = v556:CraftPage("", 1)
        local v569 = v556:CraftPage("", 2)
        local v570 = v556:CraftPage("", 1)
        local v571 = v556:CraftPage("", 2)
        local v572 = v556:CraftPage("", 1)
        local v573 = v557:CraftPage("", 1)
        local v574 = v558:CraftPage("", 1)
        local v575 = v558:CraftPage("", 2)
        local v576 = v559:CraftPage("", 1)
        local v577 = v560:CraftPage("", 1)
        local v578 = v561:CraftPage("", 1)
        local v579 = v561:CraftPage("", 2)
        local v580 = v563:CraftPage("", 1)
        local v581 = v563:CraftPage("", 2)
        local v582 = v564:CraftPage("", 1)
        local v583 = v565:CraftPage("", 1)
        local v584 = v565:CraftPage("", 2)
        local v585 = v565:CraftPage("", 1)
        v565:CraftPage("", 2)
        local v586 = v562:CraftPage("", 1)
        v586:Button("Teleport Temple", function()
            game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(29553.41796875, 15068.7841796875, - 87.90155792236328)
        end)
        v586:Button("Cyborg Trial", function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 300, 0)
        end)
        v586:Button("Mink Trial", function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.MinkTrial.Ceiling.CFrame * CFrame.new(0, - 5, 0)
        end)
        v586:Button("Sky Trial", function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Workspace.Map.SkyTrial.Model.FinishPart.CFrame * CFrame.new(0, - 5, 0)
        end)
        v586:Toggle("Ghoul Trial", false, function(p587)
            _G.Settings.Raids["Kill Aura"] = p587
        end)
        v586:Toggle("Human Trial", false, function(p588)
            _G.Settings.Raids["Kill Aura"] = p588
        end)
        v566:Label("Main")
        v566:Toggle("Auto Farm Level", false, function(p589)
			-- upvalues: (ref) vu192
            _G.Settings.Main["Auto Farm Level"] = p589
            Auto_Farm_Level = p589
            if p589 == false then
                vu192(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
            end
            getgenv().SaveSetting()
        end)
        v566:Toggle("Protect Name", true, function(p590)
            _G.ProtectName = p590
            if not _G.ProtectName then
                game:GetService("CoreGui").PlayerList.PlayerListMaster.OffsetFrame.PlayerScrollList.SizeOffsetFrame.ScrollingFrameContainer.ScrollingFrameClippingFrame.ScollingFrame.OffsetUndoFrame["p_" .. game.Players.LocalPlayer.UserId].ChildrenFrame.NameFrame.BGFrame.OverlayFrame.PlayerName.PlayerName.Text = game.Players.LocalPlayer.Name
            end
        end)
        LPH_JIT_MAX(function()
            task.spawn(function()
                while wait() do
                    if _G.ProtectName then
                        pcall(function()
                            game:GetService("CoreGui").PlayerList.PlayerListMaster.OffsetFrame.PlayerScrollList.SizeOffsetFrame.ScrollingFrameContainer.ScrollingFrameClippingFrame.ScollingFrame.OffsetUndoFrame["p_" .. game.Players.LocalPlayer.UserId].ChildrenFrame.NameFrame.BGFrame.OverlayFrame.PlayerName.PlayerName.Text = "UUltimatLY Hub Security"
                        end)
                    end
                end
            end)
        end)()
        AttackRandomType = 1
        LPH_NO_VIRTUALIZE(function()
            task.spawn(function()
                while wait() do
                    AttackRandomType = math.random(1, 5)
                    wait(0.3)
                end
            end)
        end)()
        _G.RedeemCodeLocalFastAutoFarm = false
        LPH_JIT_MAX(function()
			-- upvalues: (ref) vu233, (ref) vu192
            function AutoFarmLevel()
				-- upvalues: (ref) vu233, (ref) vu192
				-- block 555
                GetQuestTitle = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title
                GetQuest = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest
                local v591 = game.Players.LocalPlayer.Data.Level.Value
                if _G.Settings.Main["Fast Auto Farm Level"] and (15 <= v591 and v591 <= 300) then
					-- goto l7
                end
                if not string.find(GetQuestTitle.Text, NameMon) then
                    game.ReplicatedStorage:WaitForChild("Remotes").CommF_:InvokeServer("AbandonQuest")
                end
                if GetQuest.Visible == false then
                    StartMagnet = false
                    FastAttack = false
                    Questtween = vu192(CFrameQuest.Position, CFrameQuest)
                    if World1 and (Name == "Fishman Commando [Lv. 400]" or Name == "Fishman Warrior [Lv. 375]") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 50000 then
                        if Questtween then
                            Questtween:Stop()
                        end
                        wait(0.5)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
                    elseif World1 and (Name ~= "Fishman Commando [Lv. 400]" and Name ~= "Fishman Warrior [Lv. 375]") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 50000 then
                        if Questtween then
                            Questtween:Stop()
                        end
                        wait(0.5)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(3864.8515625, 6.6796875, - 1926.7841796875))
                    elseif World2 and string.find(Name, "Ship") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 30000 then
                        if Questtween then
                            Questtween:Stop()
                        end
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
                    elseif World2 and not string.find(Name, "Ship") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 30000 then
                        if Questtween then
                            Questtween:Stop()
                        end
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(- 6508.5581054688, 89.034996032715, - 132.83953857422))
                    elseif (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 250 then
                        if Questtween then
                            Questtween:Stop()
                        end
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameQuest
                        wait(1)
                        if game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid").Health > 0 then
                            Com("F_", "StartQuest", QuestName, LevelQuest)
                            Com("F_", "SetSpawnPoint")
                        end
                    end
					-- goto l83
                end
                if GetQuest.Visible ~= true then
					-- ::l83::
                    return
                end
                if not game:GetService("Workspace").Enemies:FindFirstChild(Name) then
                    StartMagnet = false
                    FastAttack = false
                    if not string.find(GetQuestTitle.Text, NameMon) then
                        Com("F_", "AbandonQuest")
                    end
                    Modstween = vu192(CFrameMon.Position, CFrameMon)
                    if World1 and (Name == "Fishman Commando [Lv. 400]" or Name == "Fishman Warrior [Lv. 375]") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 50000 then
                        if Modstween then
                            Modstween:Stop()
                        end
                        wait(0.5)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
                    elseif World1 and (Name ~= "Fishman Commando [Lv. 400]" and Name ~= "Fishman Warrior [Lv. 375]") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 50000 then
                        if Modstween then
                            Modstween:Stop()
                        end
                        wait(0.5)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(3864.8515625, 6.6796875, - 1926.7841796875))
                    elseif World2 and string.find(Name, "Ship") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 30000 then
                        if Modstween then
                            Modstween:Stop()
                        end
                        wait(0.5)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
                    elseif World2 and not string.find(Name, "Ship") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 30000 then
                        if Modstween then
                            Modstween:Stop()
                        end
                        wait(0.5)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(- 6508.5581054688, 89.034996032715, - 132.83953857422))
                    elseif (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 250 then
                        if Modstween then
                            Modstween:Stop()
                        end
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
                    end
					-- goto l83
                end
                local v592, v593, v594 = pairs(game:GetService("Workspace").Enemies:GetChildren())
				-- ::l441::
                while true do
                    local v595
                    v594, v595 = v592(v593, v594)
                    if v594 == nil then
						-- goto l83
                    end
                    if _G.Settings.Main["Auto Farm Level"] and (v595.Name == Name and (v595:FindFirstChild("HumanoidRootPart") and (v595:FindFirstChild("Humanoid") and v595.Humanoid.Health > 0))) then
                        if string.find(GetQuestTitle.Text, NameMon) then
							-- goto l454
                        end
                        Com("F_", "AbandonQuest")
                    end
                end
				-- ::l454::
                wait()
                FarmtoTarget = vu192(v595.HumanoidRootPart.CFrame * CFrame.new(0, _G.Settings.Configs["Distance Auto Farm"], 0))
                if v595:FindFirstChild("HumanoidRootPart") and (v595:FindFirstChild("Humanoid") and (v595.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 250) then
                    if FarmtoTarget then
                        FarmtoTarget:Stop()
                    end
                    if _G.Settings.Configs["Auto Haki"] and not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
                    end
                    if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
                        wait()
                        EquipWeapon(_G.Settings.Configs["Select Weapon"])
                    end
                    StartMagnet = true
                    FastAttack = true
                    if game.Players.LocalPlayer.Data.Level.Value < 20 or game.Players.LocalPlayer.Data.Level.Value > 90 then
                        _G.Settings.Configs["Fast Attack Type"] = "Fast"
                    else
                        _G.Settings.Configs["Fast Attack Type"] = "Slow"
                    end
                    if not _G.Settings.Configs["Fast Attack"] then
                        game:GetService("VirtualUser"):CaptureController()
                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                    end
                    v595.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                    v595.HumanoidRootPart.Transparency = 1
                    v595.Humanoid.JumpPower = 0
                    v595.Humanoid.WalkSpeed = 0
                    v595.HumanoidRootPart.CanCollide = false
                    v595.Humanoid:ChangeState(11)
                    v595.Humanoid:ChangeState(14)
                    PosMon = v595.HumanoidRootPart.CFrame
                    if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 150 then
                        game:service("VirtualInputManager"):SendKeyEvent(true, "V", false, game)
                        game:service("VirtualInputManager"):SendKeyEvent(false, "V", false, game)
                    end
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v595.HumanoidRootPart.CFrame * CFrame.new(0, _G.Settings.Configs["Distance Auto Farm"], 0)
                end
                if game:GetService("Workspace").Enemies:FindFirstChild(Name) and (_G.Settings.Main["Auto Farm Level"] and (string.find(GetQuestTitle.Text, NameMon) and (v595.Humanoid.Health > 0 and (v595.Parent and GetQuest.Visible ~= false)))) then
					-- goto l454
                end
                StartMagnet = false
                FastAttack = false
				-- goto l441
				-- ::l7::
                if _G.Settings.Configs["Auto Haki"] and not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
                end
                if _G.RedeemCodeLocalFastAutoFarm == false then
                    function Redeem(p596)
                        game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(p596)
                    end
                    local v597, v598, v599 = pairs(vu233)
                    while true do
                        local v600
                        v599, v600 = v597(v598, v599)
                        if v599 == nil then
                            break
                        end
                        Redeem(v600)
                    end
                    wait()
                    _G.RedeemCodeLocalFastAutoFarm = true
                end
                if 15 > v591 or v591 > 70 then
					-- goto l22
                end
                local v601 = CFrame.new(- 4698, 845, - 1912)
                if not game:GetService("Workspace").Enemies:FindFirstChild("God\'s Guard [Lv. 450]") then
                    Modstween = vu192(v601)
                    if World1 and (v601.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 1500 then
                        if Modstween then
                            Modstween:Stop()
                        end
                        wait(0.5)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(- 4607.8227539063, 872.54248046875, - 1667.5568847656))
                    elseif (v601.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 150 then
                        if Modstween then
                            Modstween:Stop()
                        end
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v601
                    end
					-- goto l83
                end
                local v602, v603, v604 = pairs(game:GetService("Workspace").Enemies:GetChildren())
				-- goto l28
				-- ::l83::
				-- ::l42::
				-- ::l120::
				-- ::l29::
				-- ::l184::
				-- ::l458::
				-- ::l282::
				-- ::l455::
				-- ::l442::
				-- ::l275::
                if not string.find(GetQuestTitle.Text, QuestName) then
					-- goto l278
                end
				-- ::l277::
                if true then
                    wait()
                    if (v606.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 150 then
                        if v606:FindFirstChild("HumanoidRootPart") and (v606:FindFirstChild("Humanoid") and (v606.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 150) then
                            if FarmtoTarget then
                                FarmtoTarget:Stop()
                            end
                            StartMagnet = true
                            PosMon = v606.HumanoidRootPart.CFrame
                            if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 150 then
                                game:service("VirtualInputManager"):SendKeyEvent(true, "V", false, game)
                                game:service("VirtualInputManager"):SendKeyEvent(false, "V", false, game)
                            end
                            if AttackRandomType ~= 1 then
                                if AttackRandomType ~= 2 then
                                    if AttackRandomType ~= 3 then
                                        if AttackRandomType ~= 4 then
                                            if AttackRandomType ~= 5 then
                                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v606.HumanoidRootPart.CFrame * CFrame.new(0, 30, 1)
                                            else
                                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v606.HumanoidRootPart.CFrame * CFrame.new(- 30, 1, 0)
                                            end
                                        else
                                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v606.HumanoidRootPart.CFrame * CFrame.new(30, 1, 0)
                                        end
                                    else
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v606.HumanoidRootPart.CFrame * CFrame.new(1, 1, - 30)
                                    end
                                else
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v606.HumanoidRootPart.CFrame * CFrame.new(0, 1, 30)
                                end
                            else
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v606.HumanoidRootPart.CFrame * CFrame.new(0, 30, 1)
                            end
                            FastAttack = true
                            EquipWeapon(_G.Settings.Configs["Select Weapon"])
                        end
                    else
                        FarmtoTarget = vu192(v606.HumanoidRootPart.CFrame * CFrame.new(0, 30, 1))
                    end
                end
                if game:GetService("Workspace").Enemies:FindFirstChild(Name) and (_G.Settings.Main["Auto Farm Level"] and (string.find(GetQuestTitle.Text, QuestName) and (v606.Humanoid.Health > 0 and (v606.Parent and GetQuest.Visible ~= false)))) then
					-- goto l277
                end
                FastAttack = false
                StartMagnet = false
				-- ::l264::
                local v605, v606 = v620(v621, v605)
                if v605 == nil then
					-- goto l83
                end
                if _G.Settings.Main["Auto Farm Level"] and (v606.Name == Name and (v606:FindFirstChild("HumanoidRootPart") and (v606:FindFirstChild("Humanoid") and v606.Humanoid.Health > 0))) then
					-- goto l120
                else
					-- goto l264
                end
				-- ::l278::
                Com("F_", "AbandonQuest")
				-- goto l264
				-- ::l277::
				-- ::l315::
				-- ::l490::
				-- ::l452::
				-- ::l187::
				-- ::l210::
				-- ::l201::
                if true then
                    wait()
                    if World1 and (Vector3.new(61163.8515625, 11.6796875, 1819.7841796875) - v608.HumanoidRootPart.Position).magnitude < 5000 then
                        if FarmtoTarget then
                            FarmtoTarget:Stop()
                        end
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
                    elseif (v608.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 150 then
                        if v608:FindFirstChild("HumanoidRootPart") and (v608:FindFirstChild("Humanoid") and (v608.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 150) then
                            if FarmtoTarget then
                                FarmtoTarget:Stop()
                            end
                            if game:GetService("Players").LocalPlayer.PlayerGui.Main.PvpDisabled.Visible == true then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                                    "EnablePvp"
                                }))
                            end
                            if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                                    "Buso"
                                }))
                            end
                            if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 150 then
                                game:service("VirtualInputManager"):SendKeyEvent(true, "V", false, game)
                                game:service("VirtualInputManager"):SendKeyEvent(false, "V", false, game)
                            end
                            if AttackRandomType ~= 1 then
                                if AttackRandomType ~= 2 then
                                    if AttackRandomType ~= 3 then
                                        if AttackRandomType ~= 4 then
                                            if AttackRandomType ~= 5 then
                                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v608.HumanoidRootPart.CFrame * CFrame.new(0, 7, 1)
                                            else
                                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v608.HumanoidRootPart.CFrame * CFrame.new(- 7, 1, 0)
                                            end
                                        else
                                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v608.HumanoidRootPart.CFrame * CFrame.new(7, 1, 0)
                                        end
                                    else
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v608.HumanoidRootPart.CFrame * CFrame.new(1, 1, - 7)
                                    end
                                else
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v608.HumanoidRootPart.CFrame * CFrame.new(0, 1, 7)
                                end
                            else
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v608.HumanoidRootPart.CFrame * CFrame.new(0, 7, 1)
                            end
                            EquipWeapon(_G.Settings.Configs["Select Weapon"])
                            AttackPlayers()
                            wait(0.1)
                            game:service("VirtualInputManager"):SendKeyEvent(true, "X", false, game)
                            game:service("VirtualInputManager"):SendKeyEvent(false, "X", false, game)
                        end
                    else
                        FarmtoTarget = vu192(v608.HumanoidRootPart.CFrame)
                    end
                end
                if _G.Settings.Main["Auto Farm Level"] and (string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, v608.Name) and (v608.Humanoid.Health > 0 and (v608.Parent and GetQuest.Visible ~= false))) then
					-- goto l201
                end
				-- ::l186::
                local v607, v608 = v618(v619, v607)
                if v607 == nil then
					-- goto l83
                end
                if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, v608.Name) and (_G.Settings.Main["Auto Farm Level"] and _G.Settings.Main["Fast Auto Farm Level"]) and (v608.Name == GetQuestTitle.Text:split(" ")[2] and (v608:FindFirstChild("HumanoidRootPart") and (v608:FindFirstChild("Humanoid") and v608.Humanoid.Health > 0))) then
					-- goto l123
                else
					-- goto l186
                end
				-- ::l123::
				-- goto l277
				-- ::l22::
                if 70 > v591 or v591 > 300 then
					-- goto l83
                end
                if GetQuest.Visible ~= false then
					-- goto l103
                end
                if tostring(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("PlayerHunter")):find("We heard some") then
					-- goto l83
                end
                local v609 = CFrame.new(- 4698, 845, - 1912)
                if not game:GetService("Workspace").Enemies:FindFirstChild("God\'s Guard [Lv. 450]") then
                    Modstween = vu192(v609)
                    if World1 and (v609.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 1500 then
                        if Modstween then
                            Modstween:Stop()
                        end
                        wait(0.5)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(- 4607.8227539063, 872.54248046875, - 1667.5568847656))
                    elseif (v609.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 150 then
                        if Modstween then
                            Modstween:Stop()
                        end
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v609
                    end
					-- goto l83
                end
                local v610, v611, v612 = pairs(game:GetService("Workspace").Enemies:GetChildren())
				-- goto l109
				-- ::l103::
                if GetQuest.Visible ~= true then
					-- goto l83
                end
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki", "Buso")
                local v613, v614, v615 = pairs(game:GetService("Workspace").Characters:GetChildren())
                local v616 = {}
                while true do
                    local v617
                    v615, v617 = v613(v614, v615)
                    if v615 == nil then
                        break
                    end
                    table.insert(v616, v617.Name)
                end
                if not table.find(v616, GetQuestTitle.Text:split(" ")[2]) then
					-- goto l185
                end
                local v618, v619
                v618, v619, v607 = pairs(game:GetService("Workspace").Characters:GetChildren())
				-- goto l186
				-- ::l185::
                if not game:GetService("Workspace").Enemies:FindFirstChild(Name) then
                    StartMagnet = false
                    if not string.find(GetQuestTitle.Text, NameCheckQuest) then
                        Com("F_", "AbandonQuest")
                    end
                    Modstween = vu192(CFrameMon)
                    if World1 and (Name == "Fishman Commando [Lv. 400]" or Name == "Fishman Warrior [Lv. 375]") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 50000 then
                        if Questtween then
                            Questtween:Stop()
                        end
                        wait(0.5)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
                    elseif World1 and (Name ~= "Fishman Commando [Lv. 400]" and Name ~= "Fishman Warrior [Lv. 375]") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 50000 then
                        if Questtween then
                            Questtween:Stop()
                        end
                        wait(0.5)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(3864.8515625, 6.6796875, - 1926.7841796875))
                    elseif World2 and string.find(Name, "Ship") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 30000 then
                        if Questtween then
                            Questtween:Stop()
                        end
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
                    elseif World2 and not string.find(Name, "Ship") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 30000 then
                        if Questtween then
                            Questtween:Stop()
                        end
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(- 6508.5581054688, 89.034996032715, - 132.83953857422))
                    elseif (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 150 then
                        if Modstween then
                            Modstween:Stop()
                        end
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
                    end
					-- goto l83
                end
                local v620, v621
                v620, v621, v605 = pairs(game:GetService("Workspace").Enemies:GetChildren())
				-- goto l264
				-- ::l3::
				-- goto l437
				-- ::l24::
				-- goto l28
				-- ::l39::
				-- goto l3
				-- ::l73::
                StartMagnet = false
                FastAttack = false
				-- ::l28::
                local v622
                v604, v622 = v602(v603, v604)
                if v604 == nil then
					-- goto l83
                end
                if not _G.Settings.Main["Fast Auto Farm Level"] or (v622.Name ~= "God\'s Guard [Lv. 450]" or (not v622:FindFirstChild("HumanoidRootPart") or (not v622:FindFirstChild("Humanoid") or v622.Humanoid.Health <= 0))) then
					-- goto l24
                end
				-- ::l39::
                wait()
                FarmtoTarget = vu192(v622.HumanoidRootPart.CFrame * CFrame.new(0, 30, 1))
                if v622:FindFirstChild("HumanoidRootPart") and (v622:FindFirstChild("Humanoid") and (v622.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300) then
                    if FarmtoTarget then
                        FarmtoTarget:Stop()
                    end
                    StartMagnet = true
                    PosMon = v622.HumanoidRootPart.CFrame
                    if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 150 then
                        game:service("VirtualInputManager"):SendKeyEvent(true, "V", false, game)
                        game:service("VirtualInputManager"):SendKeyEvent(false, "V", false, game)
                    end
                    if AttackRandomType ~= 1 then
                        if AttackRandomType ~= 2 then
                            if AttackRandomType ~= 3 then
                                if AttackRandomType ~= 4 then
                                    if AttackRandomType ~= 5 then
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v622.HumanoidRootPart.CFrame * CFrame.new(0, 60, 1)
                                    else
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v622.HumanoidRootPart.CFrame * CFrame.new(- 60, 1, 0)
                                    end
                                else
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v622.HumanoidRootPart.CFrame * CFrame.new(60, 1, 0)
                                end
                            else
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v622.HumanoidRootPart.CFrame * CFrame.new(1, 1, - 60)
                            end
                        else
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v622.HumanoidRootPart.CFrame * CFrame.new(0, 1, 60)
                        end
                    else
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v622.HumanoidRootPart.CFrame * CFrame.new(0, 60, 1)
                    end
                    FastAttack = true
                    EquipWeapon(_G.Settings.Configs["Select Weapon"])
                end
                if game:GetService("Workspace").Enemies:FindFirstChild("God\'s Guard [Lv. 450]") and (_G.Settings.Main["Fast Auto Farm Level"] or _G.Settings.Main["Auto Farm Level"]) and (v622.Humanoid.Health > 0 and v622.Parent) then
					-- goto l39
                else
					-- goto l73
                end
				-- ::l102::
				-- goto l83
				-- ::l154::
                StartMagnet = false
                FastAttack = false
				-- ::l109::
                local v623
                v612, v623 = v610(v611, v612)
                if v612 == nil then
					-- goto l83
                end
                if not _G.Settings.Main["Fast Auto Farm Level"] or (v623.Name ~= "God\'s Guard [Lv. 450]" or (not v623:FindFirstChild("HumanoidRootPart") or (not v623:FindFirstChild("Humanoid") or v623.Humanoid.Health <= 0))) then
					-- goto l39
                end
				-- ::l120::
                wait()
                FarmtoTarget = vu192(v623.HumanoidRootPart.CFrame * CFrame.new(0, 30, 1))
                if v623:FindFirstChild("HumanoidRootPart") and (v623:FindFirstChild("Humanoid") and (v623.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300) then
                    if FarmtoTarget then
                        FarmtoTarget:Stop()
                    end
                    StartMagnet = true
                    PosMon = v623.HumanoidRootPart.CFrame
                    if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 150 then
                        game:service("VirtualInputManager"):SendKeyEvent(true, "V", false, game)
                        game:service("VirtualInputManager"):SendKeyEvent(false, "V", false, game)
                    end
                    if AttackRandomType ~= 1 then
                        if AttackRandomType ~= 2 then
                            if AttackRandomType ~= 3 then
                                if AttackRandomType ~= 4 then
                                    if AttackRandomType ~= 5 then
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v623.HumanoidRootPart.CFrame * CFrame.new(0, 60, 1)
                                    else
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v623.HumanoidRootPart.CFrame * CFrame.new(- 60, 1, 0)
                                    end
                                else
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v623.HumanoidRootPart.CFrame * CFrame.new(60, 1, 0)
                                end
                            else
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v623.HumanoidRootPart.CFrame * CFrame.new(1, 1, - 60)
                            end
                        else
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v623.HumanoidRootPart.CFrame * CFrame.new(0, 1, 60)
                        end
                    else
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v623.HumanoidRootPart.CFrame * CFrame.new(0, 60, 1)
                    end
                    FastAttack = true
                    EquipWeapon(_G.Settings.Configs["Select Weapon"])
                end
                if game:GetService("Workspace").Enemies:FindFirstChild("God\'s Guard [Lv. 450]") and (_G.Settings.Main["Fast Auto Farm Level"] or _G.Settings.Main["Auto Farm Level"]) and (v623.Humanoid.Health > 0 and v623.Parent) then
					-- goto l102
                else
					-- goto l154
                end
				-- ::l437::
				-- goto l109
            end
        end)()
        LPH_JIT_MAX(function()
            function CheckNotifyComplete()
                local v624, v625, v626 = pairs(game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("Notifications"):GetChildren())
                while true do
                    local vu627
                    v626, vu627 = v624(v625, v626)
                    if v626 == nil then
                        break
                    end
                    if vu627.Name == "NotificationTemplate" and string.lower(vu627.Text):find("quest completed") then
                        pcall(function()
							-- upvalues: (ref) vu627
                            vu627:Destroy()
                        end)
                        return true
                    end
                end
                return false
            end
        end)()
        local vu628 = false
        local vu629 = false
        local vu630 = Name
        local vu631 = NameMon
        LPH_JIT_MAX(function()
			-- upvalues: (ref) vu629, (ref) vu630, (ref) vu631, (ref) vu628
            task.spawn(function()
				-- upvalues: (ref) vu629, (ref) vu630, (ref) vu631, (ref) vu628
                while wait(0.1) do
                    pcall(function()
						-- upvalues: (ref) vu629, (ref) vu630, (ref) vu631, (ref) vu628
                        if _G.Settings.Main["Auto Farm Level"] then
                            if _G.Settings.Configs["Double Quest"] then
                                if vu629 ~= true then
                                    CheckQuest()
                                    vu630 = Name
                                    vu631 = NameMon
                                    task.spawn(function()
										-- upvalues: (ref) vu628, (ref) vu629
                                        if vu628 == false and (CheckNotifyComplete() and _G.Settings.Main["Auto Farm Level"]) then
                                            vu628 = true
                                            while wait() do
                                                vu629 = true
                                                if CheckNotifyComplete() or _G.Settings.Main["Auto Farm Level"] == false then
                                                    break
                                                end
                                            end
                                            vu629 = false
                                            vu628 = false
                                        end
                                    end)
                                    if vu629 == true and (LevelFarm and tonumber(LevelFarm - 1) ~= 0) then
                                        CheckOldQuest(tonumber(LevelFarm - 1))
                                    end
                                elseif LevelFarm and tonumber(LevelFarm - 1) ~= 0 then
                                    CheckOldQuest(tonumber(LevelFarm - 1))
                                end
                            else
                                CheckQuest()
                            end
                            AutoFarmLevel()
                        end
                    end)
                end
            end)
        end)()
        v566:Toggle("Auto Farm Chest", AutoFarmChest, function(p632)
			-- upvalues: (ref) vu192
            AutoFarmChest = p632
            if p632 == false then
                vu192(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
            end
            getgenv().SaveSetting()
        end)
        _G.MagnitudeAdd = 0
        task.spawn(function()
			-- upvalues: (ref) vu192
            while true do
                if not wait() then
                    return
                end
                if AutoFarmChest then
                    local v633, v634, v635 = pairs(game:GetService("Workspace"):GetChildren())
                    while true do
                        local v636
                        v635, v636 = v633(v634, v635)
                        if v635 == nil then
                            break
                        end
                        if v636.Name:find("Chest") and (game:GetService("Workspace"):FindFirstChild(v636.Name) and (v636.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 5000 + _G.MagnitudeAdd) then
                            while true do
                                wait()
                                if game:GetService("Workspace"):FindFirstChild(v636.Name) then
                                    toTargetP(v636.CFrame)
                                end
                                if AutoFarmChest == false or not v636.Parent then
                                    vu192(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
                                    _G.MagnitudeAdd = _G.MagnitudeAdd + 1500
                                    break
                                end
                            end
                        end
                    end
                end
            end
        end)
        v566:Label("Mob Aura")
        v566:Slider("Distance Mob Aura", true, 0, 5000, 1000, 1, function(p637)
            _G.Settings.Main["Distance Mob Aura"] = p637
        end)
        v566:Toggle("Mob Aura", _G.Settings.Main["Mob Aura"], function(p638)
			-- upvalues: (ref) vu192
            _G.Settings.Main["Mob Aura"] = p638
            getgenv().SaveSetting()
            if p638 == false then
                vu192(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
            end
        end)
        task.spawn(function()
			-- upvalues: (ref) vu192
            while wait() do
                pcall(function()
					-- upvalues: (ref) vu192
					-- block 37
                    if not _G.Settings.Main["Mob Aura"] then
						-- ::l3::
                        return
                    end
                    local v639, v640, v641 = pairs(game.Workspace.Enemies:GetChildren())
					-- goto l4
					-- ::l13::
                    wait()
                    StartMagnet = true
                    FastAttack = true
                    if _G.Settings.Configs["Auto Haki"] and not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
                    end
                    if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
                        wait()
                        EquipWeapon(_G.Settings.Configs["Select Weapon"])
                    end
                    PosMon = v642.HumanoidRootPart.CFrame
                    if not _G.Settings.Configs["Fast Attack"] then
                        game:GetService("VirtualUser"):CaptureController()
                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                    end
                    v642.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                    if _G.Settings.Configs["Show Hitbox"] then
                        v642.HumanoidRootPart.Transparency = tonumber(_G.Hitbox_LocalTransparency)
                    else
                        v642.HumanoidRootPart.Transparency = 1
                    end
                    v642.Humanoid.JumpPower = 0
                    v642.Humanoid.WalkSpeed = 0
                    v642.HumanoidRootPart.CanCollide = false
                    v642.Humanoid:ChangeState(11)
                    vu192(v642.HumanoidRootPart.CFrame * CFrame.new(0, _G.Settings.Configs["Distance Auto Farm"], 0))
                    if _G.Settings.Main["Mob Aura"] and (v642.Parent and v642.Humanoid.Health > 0) then
						-- goto l13
                    end
                    FastAttack = false
                    StartMagnet = false
					-- ::l4::
                    local v642
                    v641, v642 = v639(v640, v641)
                    if v641 == nil then
						-- goto l3
                    end
                    if v642:FindFirstChild("Humanoid") and (v642:FindFirstChild("HumanoidRootPart") and v642.Humanoid.Health > 0) and (v642.HumanoidRootPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= tonumber(_G.Settings.Main["Distance Mob Aura"]) then
						-- goto l13
                    else
						-- goto l4
                    end
                end)
            end
        end)
        v566:Button("Bypass Anti Cheat", function()
			-- upvalues: (ref) vu285
            game.Players.LocalPlayer.Character.CharacterReady:Destroy()
            local v643 = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 10000000, 0)
            wait(1)
            vu285()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v643
            game.Players.LocalPlayer.Character.HumanoidRootPart.CrewBBG:Destroy()
        end)
        v566:Toggle("AntiBan (soon)")
        v573:Label("Hopper Items")
        v573:Toggle("Hopper Server", _G.Hopper, function(p644)
            _G.Hopper = p644
        end)
        v573:Toggle("Farm Observation Hop", _G.Settings.Main["Farm Observation Hop"], function(p645)
            _G.Settings.Main["Farm Observation Hop"] = p645
        end)
        if World2 then
            v573:Toggle("Auto Factory Hop", _G.Settings.Main["Auto Factory Hop"], function(p646)
                _G.Settings.Main["Auto Factory Hop"] = p646
                getgenv().SaveSetting()
            end)
            v573:Toggle("Auto Buy Legendary Sword Hop", _G.Settings.Main["Auto Buy Legendary Sword Hop"], function(p647)
                _G.Settings.Main["Auto Buy Legendary Sword Hop"] = p647
                getgenv().SaveSetting()
            end)
        end
        if World1 then
            v573:Label("Status : World 1")
            v573:Toggle("Auto New World", _G.Settings.Main["Auto New World"], function(p648)
				-- upvalues: (ref) vu192
                _G.Settings.Main["Auto New World"] = p648
                if p648 == false then
                    vu192(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
                end
                getgenv().SaveSetting()
            end)
            task.spawn(function()
				-- upvalues: (ref) vu192
                while wait() do
                    pcall(function()
						-- upvalues: (ref) vu192
						-- block 55
                        if not _G.Settings.Main["Auto New World"] or game.Players.LocalPlayer.Data.Level.Value < 700 then
							-- ::l3::
                            return
                        end
                        if Auto_Farm_Level then
                            _G.Settings.Main["Auto Farm Level"] = false
                        end
                        if game.Workspace.Map.Ice.Door.CanCollide == true and game.Workspace.Map.Ice.Door.Transparency == 0 then
                            wait(0.5)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("DressrosaQuestProgress", "Detective")
                            EquipWeapon("Key")
                            repeat
                                wait()
                                vu192(CFrame.new(1347.7124, 37.3751602, - 1325.6488))
                            until (CFrame.new(1347.7124, 37.3751602, - 1325.6488).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 or not _G.Settings.Main["Auto New World"]
                            wait(3)
							-- goto l3
                        end
                        if game.Workspace.Map.Ice.Door.CanCollide ~= false or game.Workspace.Map.Ice.Door.Transparency ~= 1 then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
							-- goto l3
                        end
                        if not game:GetService("Workspace").Enemies:FindFirstChild("Ice Admiral [Lv. 700] [Boss]") then
                            vu192(CFrame.new(1347.7124, 37.3751602, - 1325.6488))
							-- goto l3
                        end
                        local v649, v650, v651 = pairs(game:GetService("Workspace").Enemies:GetChildren())
						-- goto l27
						-- ::l32::
                        wait()
                        if _G.Settings.Configs["Auto Haki"] and not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
                        end
                        if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
                            wait()
                            EquipWeapon(_G.Settings.Configs["Select Weapon"])
                        end
                        vu192(v652.HumanoidRootPart.CFrame * CFrame.new(0, _G.Settings.Configs["Distance Auto Farm"], 0))
                        FastAttack = true
                        if not _G.Settings.Configs["Fast Attack"] then
                            game:GetService("VirtualUser"):CaptureController()
                            game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                        end
                        v652.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                        if _G.Settings.Configs["Show Hitbox"] then
                            v652.HumanoidRootPart.Transparency = tonumber(_G.Hitbox_LocalTransparency)
                        else
                            v652.HumanoidRootPart.Transparency = 1
                        end
                        v652.Humanoid.JumpPower = 0
                        v652.Humanoid.WalkSpeed = 0
                        v652.HumanoidRootPart.CanCollide = false
                        v652.Humanoid:ChangeState(11)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
                        if v652.Humanoid.Health > 0 and v652.Parent then
							-- goto l32
                        end
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
						-- ::l27::
                        local v652
                        v651, v652 = v649(v650, v651)
                        if v651 == nil then
							-- goto l3
                        end
                        if v652.Name ~= "Ice Admiral [Lv. 700] [Boss]" or v652.Humanoid.Health <= 0 then
							-- goto l27
                        else
							-- goto l32
                        end
                    end)
                end
            end)
            v573:Toggle("Auto Saber", _G.Settings.Main["Auto Saber"], function(p653)
				-- upvalues: (ref) vu192
                _G.Settings.Main["Auto Saber"] = p653
                if p653 == false then
                    vu192(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
                end
                getgenv().SaveSetting()
            end)
            task.spawn(function()
				-- upvalues: (ref) vu192
                while wait() do
                    pcall(function()
						-- upvalues: (ref) vu192
						-- block 101
                        if not _G.Settings.Main["Auto Saber"] or game.Players.LocalPlayer.Data.Level.Value < 200 or (game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Saber") or game.Players.LocalPlayer.Character:FindFirstChild("Saber")) then
							-- ::l3::
                            return
                        end
                        if Auto_Farm_Level then
                            _G.Settings.Main["Auto Farm Level"] = false
                        end
                        if game:GetService("Workspace").Map.Jungle.Final.Part.Transparency == 0 then
							-- goto l14
                        end
                        if not (game:GetService("Workspace").Enemies:FindFirstChild("Saber Expert [Lv. 200] [Boss]") or game:GetService("ReplicatedStorage"):FindFirstChild("Saber Expert [Lv. 200] [Boss]")) then
							-- goto l3
                        end
                        vu192(CFrame.new(- 1401.85046, 29.9773273, 8.81916237, 0.85820812, 8.76083845e-8, 0.513301849, - 8.55007443e-8, 1, - 2.77243419e-8, - 0.513301849, - 2.00944328e-8, 0.85820812))
                        local v654, v655, v656 = pairs(game:GetService("Workspace").Enemies:GetChildren())
						-- goto l73
						-- ::l14::
                        if game:GetService("Workspace").Map.Jungle.QuestPlates.Door.Transparency == 0 then
                            if (CFrame.new(- 1612.55884, 36.9774132, 148.719543, 0.37091279, 3.0717151e-9, - 0.928667724, 3.97099491e-8, 1, 1.91679348e-8, 0.928667724, - 4.39869794e-8, 0.37091279).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 100 then
                                vu192(CFrame.new(- 1612.55884, 36.9774132, 148.719543, 0.37091279, 3.0717151e-9, - 0.928667724, 3.97099491e-8, 1, 1.91679348e-8, 0.928667724, - 4.39869794e-8, 0.37091279))
                            else
                                vu192(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
                                wait(1)
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate1.Button.CFrame
                                wait(1)
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate2.Button.CFrame
                                wait(1)
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate3.Button.CFrame
                                wait(1)
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate4.Button.CFrame
                                wait(1)
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate5.Button.CFrame
                                wait(1)
                            end
							-- goto l3
                        end
                        if game:GetService("Workspace").Map.Desert.Burn.Part.Transparency == 0 then
                            if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Torch") or game.Players.LocalPlayer.Character:FindFirstChild("Torch") then
                                EquipWeapon("Torch")
                                vu192(CFrame.new(1114.61475, 5.04679728, 4350.22803, - 0.648466587, - 1.28799094e-9, 0.761243105, - 5.70652914e-10, 1, 1.20584542e-9, - 0.761243105, 3.47544882e-10, - 0.648466587))
                            else
                                vu192(CFrame.new(- 1610.00757, 11.5049858, 164.001587, 0.984807551, - 0.167722285, - 0.0449818149, 0.17364943, 0.951244235, 0.254912198, 0.0000342372805, - 0.258850515, 0.965917408))
                            end
							-- goto l3
                        end
                        if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "SickMan") ~= 0 then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "GetCup")
                            wait(0.5)
                            EquipWeapon("Cup")
                            wait(0.5)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "FillCup", game:GetService("Players").LocalPlayer.Character.Cup)
                            wait(0)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "SickMan")
							-- goto l3
                        end
                        if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon") == nil then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon")
							-- goto l3
                        end
                        if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon") ~= 0 then
                            if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon") == 1 then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon")
                                wait(0.5)
                                EquipWeapon("Relic")
                                wait(0.5)
                                vu192(CFrame.new(- 1404.91504, 29.9773273, 3.80598116, 0.876514494, 5.66906877e-9, 0.481375456, 2.53851997e-8, 1, - 5.79995607e-8, - 0.481375456, 6.30572643e-8, 0.876514494))
                            end
							-- goto l3
                        end
                        if not (game:GetService("Workspace").Enemies:FindFirstChild("Mob Leader [Lv. 120] [Boss]") or game:GetService("ReplicatedStorage"):FindFirstChild("Mob Leader [Lv. 120] [Boss]")) then
							-- goto l3
                        end
                        vu192(CFrame.new(- 2967.59521, - 4.91089821, 5328.70703, 0.342208564, - 0.0227849055, 0.939347804, 0.0251603816, 0.999569714, 0.0150796166, - 0.939287126, 0.0184739735, 0.342634559))
                        local v657, v658, v659 = pairs(game:GetService("Workspace").Enemies:GetChildren())
						-- goto l43
						-- ::l3::
						-- ::l15::
						-- goto l43
						-- ::l9::
						-- goto l46
						-- ::l46::
                        wait()
                        StartMagnet = true
                        FastAttack = true
                        if _G.Settings.Configs["Auto Haki"] and not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
                        end
                        if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
                            wait()
                            EquipWeapon(_G.Settings.Configs["Select Weapon"])
                        end
                        vu192(v660.HumanoidRootPart.CFrame * CFrame.new(0, _G.Settings.Configs["Distance Auto Farm"], 0))
                        PosMon = v660.HumanoidRootPart.CFrame
                        if not _G.Settings.Configs["Fast Attack"] then
                            game:GetService("VirtualUser"):CaptureController()
                            game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                        end
                        v660.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                        if _G.Settings.Configs["Show Hitbox"] then
                            v660.HumanoidRootPart.Transparency = tonumber(_G.Hitbox_LocalTransparency)
                        else
                            v660.HumanoidRootPart.Transparency = 1
                        end
                        v660.Humanoid.JumpPower = 0
                        v660.Humanoid.WalkSpeed = 0
                        v660.HumanoidRootPart.CanCollide = false
                        v660.Humanoid:ChangeState(11)
                        if v660.Humanoid.Health > 0 and _G.Settings.Main["Auto Saber"] ~= false then
							-- goto l46
                        end
						-- ::l43::
                        local v660
                        v659, v660 = v657(v658, v659)
                        if v659 == nil then
							-- goto l3
                        end
                        if v660.Name ~= "Mob Leader [Lv. 120] [Boss]" then
							-- goto l3
                        else
							-- goto l71
                        end
						-- ::l71::
						-- goto l9
						-- ::l76::
                        wait()
                        StartMagnet = true
                        FastAttack = true
                        if _G.Settings.Configs["Auto Haki"] and not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
                        end
                        if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
                            wait()
                            EquipWeapon(_G.Settings.Configs["Select Weapon"])
                        end
                        vu192(v661.HumanoidRootPart.CFrame * CFrame.new(0, _G.Settings.Configs["Distance Auto Farm"], 0))
                        PosMon = v661.HumanoidRootPart.CFrame
                        if not _G.Settings.Configs["Fast Attack"] then
                            game:GetService("VirtualUser"):CaptureController()
                            game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                        end
                        v661.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                        if _G.Settings.Configs["Show Hitbox"] then
                            v661.HumanoidRootPart.Transparency = tonumber(_G.Hitbox_LocalTransparency)
                        else
                            v661.HumanoidRootPart.Transparency = 1
                        end
                        v661.Humanoid.JumpPower = 0
                        v661.Humanoid.WalkSpeed = 0
                        v661.HumanoidRootPart.CanCollide = false
                        v661.Humanoid:ChangeState(11)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
                        if v661.Humanoid.Health > 0 and _G.Settings.Main["Auto Saber"] ~= false then
							-- goto l76
                        end
                        if v661.Humanoid.Health <= 0 then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "PlaceRelic")
                        end
                        _G.Settings.Main["Auto Farm Level"] = true
						-- ::l73::
                        local v661
                        v656, v661 = v654(v655, v656)
                        if v656 == nil then
							-- goto l3
                        end
                        if v661.Name ~= "Saber Expert [Lv. 200] [Boss]" then
							-- goto l73
                        else
							-- goto l76
                        end
                    end)
                end
            end)
            v573:Toggle("Auto Pole", _G.Settings.Main["Auto Pole"], function(p662)
				-- upvalues: (ref) vu192
                _G.Settings.Main["Auto Pole"] = p662
                if p662 == false then
                    vu192(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
                end
                getgenv().SaveSetting()
            end)
            v573:Toggle("Auto Pole Hop", _G.Settings.Main["Auto Pole Hop"], function(p663)
				-- upvalues: (ref) vu192
                _G.Settings.Main["Auto Pole Hop"] = p663
                if p663 == false then
                    vu192(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
                end
                getgenv().SaveSetting()
            end)
            task.spawn(function()
				-- upvalues: (ref) vu192
                while wait() do
                    pcall(function()
						-- upvalues: (ref) vu192
						-- block 62
                        if not _G.Settings.Main["Auto Pole"] then
							-- ::l3::
                            return
                        end
                        if not (game.ReplicatedStorage:FindFirstChild("Thunder God [Lv. 575] [Boss]") or game.Workspace.Enemies:FindFirstChild("Thunder God [Lv. 575] [Boss]")) then
                            if _G.Settings.Main["Auto Pole Hop"] then
                                Fast_Hop()
                            end
							-- goto l3
                        end
                        if not game.Workspace.Enemies:FindFirstChild("Thunder God [Lv. 575] [Boss]") then
                            Questtween = vu192(CFrame.new(- 7900.66406, 5606.90918, - 2267.46436).Position, CFrame.new(- 7900.66406, 5606.90918, - 2267.46436))
                            if (CFrame.new(- 7900.66406, 5606.90918, - 2267.46436).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                                if Questtween then
                                    Questtween:Stop()
                                end
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(- 7900.66406, 5606.90918, - 2267.46436)
                            end
							-- goto l3
                        end
                        local v664, v665, v666 = pairs(game.Workspace.Enemies:GetChildren())
						-- goto l12
						-- ::l21::
                        if true then
                            wait()
                            if (v667.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                                if (v667.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                                    if Farmtween then
                                        Farmtween:Stop()
                                    end
                                    StartMagnet = true
                                    FastAttack = true
                                    if _G.Settings.Configs["Auto Haki"] and not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
                                    end
                                    if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
                                        wait()
                                        EquipWeapon(_G.Settings.Configs["Select Weapon"])
                                    end
                                    vu192(v667.HumanoidRootPart.CFrame * CFrame.new(0, _G.Settings.Configs["Distance Auto Farm"], 0))
                                    PosMon = v667.HumanoidRootPart.CFrame
                                    if not _G.Settings.Configs["Fast Attack"] then
                                        game:GetService("VirtualUser"):CaptureController()
                                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                    end
                                    v667.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                    if _G.Settings.Configs["Show Hitbox"] then
                                        v667.HumanoidRootPart.Transparency = tonumber(_G.Hitbox_LocalTransparency)
                                    else
                                        v667.HumanoidRootPart.Transparency = 1
                                    end
                                    v667.Humanoid.JumpPower = 0
                                    v667.Humanoid.WalkSpeed = 0
                                    v667.HumanoidRootPart.CanCollide = false
                                    v667.Humanoid:ChangeState(11)
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
                                end
                            else
                                Farmtween = vu192(v667.HumanoidRootPart.Position, v667.HumanoidRootPart.CFrame)
                            end
                        end
                        if _G.Settings.Main["Auto Pole"] and (v667.Humanoid.Health > 0 and v667.Parent) then
							-- goto l21
                        else
							-- goto l48
                        end
						-- ::l48::
                        StartMagnet = false
                        FastAttack = false
						-- ::l12::
                        local v667
                        v666, v667 = v664(v665, v666)
                        if v666 == nil then
							-- goto l3
                        end
                        if v667.Name ~= "Thunder God [Lv. 575] [Boss]" or (not v667:FindFirstChild("HumanoidRootPart") or (not v667:FindFirstChild("Humanoid") or v667.Humanoid.Health <= 0)) then
							-- goto l12
                        else
							-- goto l21
                        end
                    end)
                end
            end)
            v573:Label("Auto Buy")
            v573:Toggle("Auto Buy Ablility", _G.Settings.Main["Auto Buy Ablility"], function(p668)
				-- upvalues: (ref) vu192
                _G.Settings.Main["Auto Buy Ablility"] = p668
                if p668 == false then
                    vu192(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
                end
                getgenv().SaveSetting()
            end)
            task.spawn(function()
                while wait() do
                    pcall(function()
                        if _G.Settings.Main["Auto Buy Ablility"] and game:GetService("Players").LocalPlayer.Data.Beli.Value >= 885000 then
                            repeat
                                wait()
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                                    "BuyHaki",
                                    "Buso"
                                }))
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                                    "BuyHaki",
                                    "Geppo"
                                }))
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                                    "BuyHaki",
                                    "Soru"
                                }))
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                                    "KenTalk",
                                    "Start"
                                }))
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                                    "KenTalk",
                                    "Buy"
                                }))
                            until not _G.Settings.Main["Auto Buy Ablility"]
                        end
                    end)
                end
            end)
            v573:Label("Farm Materail")
            v573:Dropdown("Select Material", v272, callback, function(p669)
                SelectModeMaterial = p669
            end)
            v573:Toggle("Auto Farm Material", AutoFarmMaterial, function(p670)
				-- upvalues: (ref) vu192
                AutoFarmMaterial = p670
                if p670 == false then
                    vu192(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
                end
                if p670 == false then
                    vu192(game.Players.LocalPlayer.Character.HumanoidRootPart.Position, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
                end
            end)
        elseif World2 then
            v573:Label("Status : World 2")
            v573:Toggle("Auto Sea Beast", _G.Settings.Main["Auto SeaBeast"], function(p671)
                _G.Settings.Main["Auto SeaBeast"] = p671
            end)
            v573:Toggle("Auto Factory", _G.Settings.Main["Auto Factory"], function(p672)
				-- upvalues: (ref) vu192
                _G.Settings.Main["Auto Factory"] = p672
                if p672 == false then
                    vu192(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
                end
                getgenv().SaveSetting()
            end)
            task.spawn(function()
				-- upvalues: (ref) vu192
                while wait() do
                    pcall(function()
						-- upvalues: (ref) vu192
						-- block 58
                        if not _G.Settings.Main["Auto Factory"] then
							-- ::l3::
                            return
                        end
                        if not game.Workspace.Enemies:FindFirstChild("Core") then
                            if game.ReplicatedStorage:FindFirstChild("Core") and game.ReplicatedStorage:FindFirstChild("Core"):FindFirstChild("Humanoid") then
                                _G.FactoryCore = true
                                if _G.Settings.Main["Auto Farm Level"] then
                                    Auto_Farm_Level = false
                                end
                                vu192(CFrame.new(502.7349853515625, 143.0749053955078, - 379.078125))
                            elseif not game.ReplicatedStorage:FindFirstChild("Core") then
                                if _G.Settings.Main["Auto Factory Hop"] or _G.Hopper then
                                    Fast_Hop()
                                elseif _G.Settings.Main["Auto Farm Level"] then
                                    _G.FactoryCore = false
                                    Auto_Farm_Level = true
                                end
                            end
							-- goto l3
                        end
                        _G.FactoryCore = true
                        if _G.Settings.Main["Auto Farm Level"] then
                            Auto_Farm_Level = false
                        end
                        local v673, v674, v675 = pairs(game.Workspace.Enemies:GetChildren())
						-- ::l10::
                        local v676
                        v675, v676 = v673(v674, v675)
                        if v675 == nil then
							-- goto l3
                        end
                        if _G.FactoryCore and (v676.Name == "Core" and v676.Humanoid.Health > 0) then
							-- goto l20
                        else
							-- goto l10
                        end
						-- ::l20::
						-- ::l17::
                        wait()
                        FastAttack = true
                        if _G.Settings.Configs["Auto Haki"] and not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
                        end
                        if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
                            wait()
                            EquipWeapon(_G.Settings.Configs["Select Weapon"])
                        end
                        if not _G.Settings.Configs["Fast Attack"] then
                            game:GetService("VirtualUser"):CaptureController()
                            game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                        end
                        v676.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                        if _G.Settings.Configs["Show Hitbox"] then
                            v676.HumanoidRootPart.Transparency = tonumber(_G.Hitbox_LocalTransparency)
                        else
                            v676.HumanoidRootPart.Transparency = 1
                        end
                        v676.Humanoid.JumpPower = 0
                        v676.Humanoid.WalkSpeed = 0
                        v676.HumanoidRootPart.CanCollide = false
                        v676.Humanoid:ChangeState(11)
                        vu192(v676.HumanoidRootPart.CFrame * CFrame.new(0, 10, 10))
                        if _G.FactoryCore and (v676.Humanoid.Health > 0 and _G.Settings.Main["Auto Factory"] ~= false) then
							-- goto l17
                        end
						-- goto l10
                    end)
                end
            end)
            v573:Toggle("Auto Third World", _G.Settings.Main["Auto Third Sea"], function(p677)
				-- upvalues: (ref) vu192
                _G.Settings.Main["Auto Third Sea"] = p677
                if p677 == false then
                    vu192(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
                end
                getgenv().SaveSetting()
            end)
            task.spawn(function()
				-- upvalues: (ref) vu192
                while wait() do
                    pcall(function()
						-- upvalues: (ref) vu192
						-- block 237
                        if not _G.Settings.Main["Auto Third Sea"] or game.Players.LocalPlayer.Data.Level.Value < 1500 then
							-- ::l3::
                            return
                        end
                        if Auto_Farm_Level then
                            _G.Settings.Main["Auto Farm Level"] = false
                        end
                        if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo") == 3 then
							-- goto l10
                        end
                        if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo") == 0 then
                            if string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Swan Pirates") and (string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "50") and game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == true) then
                                if game.Workspace.Enemies:FindFirstChild("Swan Pirate [Lv. 775]") then
                                    local v678, v679, v680 = pairs(game.Workspace.Enemies:GetChildren())
                                    while true do
                                        local vu681
                                        v680, vu681 = v678(v679, v680)
                                        if v680 == nil then
                                            break
                                        end
                                        if vu681.Name == "Swan Pirate [Lv. 775]" then
                                            pcall(function()
												-- upvalues: (ref) vu681, (ref) vu192
                                                while true do
                                                    wait()
                                                    if (vu681.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                                                        if (vu681.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                                                            if Farmtween then
                                                                Farmtween:Stop()
                                                            end
                                                            FastAttack = true
                                                            StartMagnet = true
                                                            if _G.Settings.Configs["Auto Haki"] and not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
                                                            end
                                                            if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
                                                                wait()
                                                                EquipWeapon(_G.Settings.Configs["Select Weapon"])
                                                            end
                                                            PosMon = vu681.HumanoidRootPart.CFrame
                                                            if not _G.Settings.Configs["Fast Attack"] then
                                                                game:GetService("VirtualUser"):CaptureController()
                                                                game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                                            end
                                                            vu681.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                                            if _G.Settings.Configs["Show Hitbox"] then
                                                                vu681.HumanoidRootPart.Transparency = tonumber(_G.Hitbox_LocalTransparency)
                                                            else
                                                                vu681.HumanoidRootPart.Transparency = 1
                                                            end
                                                            vu681.Humanoid.JumpPower = 0
                                                            vu681.Humanoid.WalkSpeed = 0
                                                            vu681.HumanoidRootPart.CanCollide = false
                                                            vu681.Humanoid:ChangeState(11)
                                                            vu192(vu681.HumanoidRootPart.CFrame * CFrame.new(0, _G.Settings.Configs["Distance Auto Farm"], 0))
                                                        end
                                                    else
                                                        Farmtween = vu192(vu681.HumanoidRootPart.Position, vu681.HumanoidRootPart.CFrame)
                                                    end
                                                    if not vu681.Parent or (vu681.Humanoid.Health <= 0 or (_G.Settings.Main["Auto Third Sea"] == false or game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false)) then
                                                        FastAttack = false
                                                        StartMagnet = false
                                                        return
                                                    end
                                                end
                                            end)
                                        end
                                    end
                                else
                                    Questtween = vu192(CFrame.new(1057.92761, 137.614319, 1242.08069).Position, CFrame.new(1057.92761, 137.614319, 1242.08069))
                                    if (CFrame.new(1057.92761, 137.614319, 1242.08069).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                                        if Bartilotween then
                                            Bartilotween:Stop()
                                        end
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1057.92761, 137.614319, 1242.08069)
                                    end
                                end
                            else
                                Bartilotween = vu192(CFrame.new(- 456.28952, 73.0200958, 299.895966).Position, CFrame.new(- 456.28952, 73.0200958, 299.895966))
                                if (CFrame.new(- 456.28952, 73.0200958, 299.895966).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                                    if Bartilotween then
                                        Bartilotween:Stop()
                                    end
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(- 456.28952, 73.0200958, 299.895966)
                                    Com("F_", "StartQuest", "BartiloQuest", 1)
                                end
                            end
							-- goto l3
                        end
                        if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo") ~= 1 then
                            if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo") == 2 then
                                if (CFrame.new(- 1836, 11, 1714).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                                    if (CFrame.new(- 1836, 11, 1714).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                                        if Bartilotween then
                                            Bartilotween:Stop()
                                        end
                                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(- 1836, 11, 1714)
                                        wait(0.5)
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(- 1850.49329, 13.1789551, 1750.89685)
                                        wait(0.1)
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(- 1858.87305, 19.3777466, 1712.01807)
                                        wait(0.1)
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(- 1803.94324, 16.5789185, 1750.89685)
                                        wait(0.1)
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(- 1858.55835, 16.8604317, 1724.79541)
                                        wait(0.1)
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(- 1869.54224, 15.987854, 1681.00659)
                                        wait(0.1)
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(- 1800.0979, 16.4978027, 1684.52368)
                                        wait(0.1)
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(- 1819.26343, 14.795166, 1717.90625)
                                        wait(0.1)
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(- 1813.51843, 14.8604736, 1724.79541)
                                    end
                                else
                                    Bartilotween = vu192(CFrame.new(- 1836, 11, 1714).Position, CFrame.new(- 1836, 11, 1714))
                                end
                            end
							-- goto l3
                        end
                        if not game.Workspace.Enemies:FindFirstChild("Jeremy [Lv. 850] [Boss]") then
                            Bartilotween = vu192(CFrame.new(2099.88159, 448.931, 648.997375).Position, CFrame.new(2099.88159, 448.931, 648.997375))
                            if (CFrame.new(2099.88159, 448.931, 648.997375).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                                if Bartilotween then
                                    Bartilotween:Stop()
                                end
                                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2099.88159, 448.931, 648.997375)
                            end
							-- goto l3
                        end
                        local v682, v683, v684 = pairs(game.Workspace.Enemies:GetChildren())
						-- goto l185
						-- ::l10::
                        if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetUnlockables").FlamingoAccess == nil then
                            if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetUnlockables").FlamingoAccess == nil then
                                TabelDevilFruitStore = {}
                                TabelDevilFruitOpen = {}
                                local v685, v686, v687 = pairs(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventoryFruits"))
                                while true do
                                    local v688
                                    v687, v688 = v685(v686, v687)
                                    if v687 == nil then
                                        break
                                    end
                                    local v689, v690, v691 = pairs(v688)
                                    while true do
                                        local v692
                                        v691, v692 = v689(v690, v691)
                                        if v691 == nil then
                                            break
                                        end
                                        if v691 == "Name" then
                                            table.insert(TabelDevilFruitStore, v692)
                                        end
                                    end
                                end
                                local v693 = next
                                local v694, v695 = game.ReplicatedStorage:WaitForChild("Remotes").CommF_:InvokeServer("GetFruits")
                                while true do
                                    local v696
                                    v695, v696 = v693(v694, v695)
                                    if v695 == nil then
                                        break
                                    end
                                    if v696.Price >= 1000000 then
                                        table.insert(TabelDevilFruitOpen, v696.Name)
                                    end
                                end
                                local v697, v698, v699 = pairs(TabelDevilFruitOpen)
                                while true do
                                    local v700
                                    v699, v700 = v697(v698, v699)
                                    if v699 == nil then
                                        break
                                    end
                                    local v701, v702, v703 = pairs(TabelDevilFruitStore)
                                    while true do
                                        local v704
                                        v703, v704 = v701(v702, v703)
                                        if v703 == nil then
                                            break
                                        end
                                        if v700 == v704 and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetUnlockables").FlamingoAccess == nil then
                                            if game.Players.LocalPlayer.Backpack:FindFirstChild(v704) then
                                                Com("F_", "TalkTrevor", "1")
                                                Com("F_", "TalkTrevor", "2")
                                                Com("F_", "TalkTrevor", "3")
                                            else
                                                Com("F_", "LoadFruit", v704)
                                            end
                                        end
                                    end
                                end
                                Com("F_", "TalkTrevor", "1")
                                Com("F_", "TalkTrevor", "2")
                                Com("F_", "TalkTrevor", "3")
                            end
							-- goto l3
                        end
                        Com("F_", "TravelZou")
                        if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ZQuestProgress", "Check") ~= 0 then
							-- goto l17
                        end
                        if not game.Workspace.Enemies:FindFirstChild("rip_indra [Lv. 1500] [Boss]") then
                            Com("F_", "ZQuestProgress", "Check")
                            Com("F_", "ZQuestProgress", "Begin")
							-- goto l3
                        end
                        local v705, v706, v707 = pairs(game.Workspace.Enemies:GetChildren())
						-- ::l21::
                        local v708
                        v707, v708 = v705(v706, v707)
                        if v707 == nil then
							-- goto l3
                        end
                        if v708.Name ~= "rip_indra [Lv. 1500] [Boss]" or (not v708:FindFirstChild("Humanoid") or (not v708:FindFirstChild("HumanoidRootPart") or v708.Humanoid.Health <= 0)) then
							-- goto l21
                        else
							-- goto l108
                        end
						-- ::l108::
						-- ::l22::
						-- ::l183::
						-- ::l30::
                        if true then
                            wait()
                            if (v708.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                                if (v708.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                                    if Farmtween then
                                        Farmtween:Stop()
                                    end
                                    FastAttack = true
                                    if _G.Settings.Configs["Auto Haki"] and not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
                                    end
                                    if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
                                        wait()
                                        EquipWeapon(_G.Settings.Configs["Select Weapon"])
                                    end
                                    PosMon = v708.HumanoidRootPart.CFrame
                                    if not _G.Settings.Configs["Fast Attack"] then
                                        game:GetService("VirtualUser"):CaptureController()
                                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                    end
                                    v708.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                    if _G.Settings.Configs["Show Hitbox"] then
                                        v708.HumanoidRootPart.Transparency = tonumber(_G.Hitbox_LocalTransparency)
                                    else
                                        v708.HumanoidRootPart.Transparency = 1
                                    end
                                    v708.Humanoid.JumpPower = 0
                                    v708.Humanoid.WalkSpeed = 0
                                    v708.HumanoidRootPart.CanCollide = false
                                    v708.Humanoid:ChangeState(11)
                                    vu192(v708.HumanoidRootPart.CFrame * CFrame.new(0, _G.Settings.Configs["Distance Auto Farm"], 0))
                                end
                            else
                                Farmtween = vu192(v708.HumanoidRootPart.Position, v708.HumanoidRootPart.CFrame)
                            end
                        end
                        if _G.Settings.Main["Auto Third Sea"] and (v708.Parent and v708.Humanoid.Health > 0) then
							-- goto l11
                        else
							-- goto l3
                        end
						-- ::l11::
						-- goto l30
						-- ::l3::
						-- ::l16::
						-- ::l57::
                        wait(0.5)
                        Check = 2
                        repeat
                            wait()
                            Com("F_", "TravelZou")
                        until Check == 1
                        FastAttack = false
						-- goto l21
						-- ::l17::
                        if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ZQuestProgress", "Check") == 1 then
                            Com("F_", "TravelZou")
							-- goto l3
                        end
                        if not game.Workspace.Enemies:FindFirstChild("Don Swan [Lv. 1000] [Boss]") then
                            TweenDonSwanthireworld = vu192(CFrame.new(2288.802, 15.1870775, 863.034607).Position, CFrame.new(2288.802, 15.1870775, 863.034607))
                            if (CFrame.new(2288.802, 15.1870775, 863.034607).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 and TweenDonSwanthireworld then
                                TweenDonSwanthireworld:Stop()
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2288.802, 15.1870775, 863.034607)
                            end
							-- goto l3
                        end
                        local v709, v710, v711 = pairs(game.Workspace.Enemies:GetChildren())
						-- goto l72
						-- ::l185::
                        local v712
                        v684, v712 = v682(v683, v684)
                        if v684 == nil then
							-- goto l3
                        end
                        if v712.Name ~= "Jeremy [Lv. 850] [Boss]" then
							-- goto l185
                        else
							-- goto l215
                        end
						-- ::l215::
						-- ::l181::
						-- ::l184::
						-- ::l188::
                        if true then
                            wait()
                            if (v712.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                                if (v712.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                                    if Farmtween then
                                        Farmtween:Stop()
                                    end
                                    FastAttack = true
                                    if _G.Settings.Configs["Auto Haki"] and not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
                                    end
                                    if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
                                        wait()
                                        EquipWeapon(_G.Settings.Configs["Select Weapon"])
                                    end
                                    PosMon = v712.HumanoidRootPart.CFrame
                                    if not _G.Settings.Configs["Fast Attack"] then
                                        game:GetService("VirtualUser"):CaptureController()
                                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                    end
                                    v712.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                    if _G.Settings.Configs["Show Hitbox"] then
                                        v712.HumanoidRootPart.Transparency = tonumber(_G.Hitbox_LocalTransparency)
                                    else
                                        v712.HumanoidRootPart.Transparency = 1
                                    end
                                    v712.Humanoid.JumpPower = 0
                                    v712.Humanoid.WalkSpeed = 0
                                    v712.HumanoidRootPart.CanCollide = false
                                    v712.Humanoid:ChangeState(11)
                                    vu192(v712.HumanoidRootPart.CFrame * CFrame.new(0, _G.Settings.Configs["Distance Auto Farm"], 0))
                                end
                            else
                                Farmtween = vu192(v712.HumanoidRootPart.Position, v712.HumanoidRootPart.CFrame)
                            end
                        end
                        if v712.Parent and (v712.Humanoid.Health > 0 and _G.Settings.Main["Auto Third Sea"] ~= false) then
							-- goto l188
                        end
                        FastAttack = false
						-- goto l185
						-- ::l5::
						-- goto l34
						-- ::l34::
						-- goto l81
						-- ::l81::
                        if true then
                            wait()
                            if (v713.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                                if (v713.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                                    if Farmtween then
                                        Farmtween:Stop()
                                    end
                                    FastAttack = true
                                    if _G.Settings.Configs["Auto Haki"] and not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
                                    end
                                    if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
                                        wait()
                                        EquipWeapon(_G.Settings.Configs["Select Weapon"])
                                    end
                                    PosMon = v713.HumanoidRootPart.CFrame
                                    if not _G.Settings.Configs["Fast Attack"] then
                                        game:GetService("VirtualUser"):CaptureController()
                                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                    end
                                    v713.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                    if _G.Settings.Configs["Show Hitbox"] then
                                        v713.HumanoidRootPart.Transparency = tonumber(_G.Hitbox_LocalTransparency)
                                    else
                                        v713.HumanoidRootPart.Transparency = 1
                                    end
                                    v713.Humanoid.JumpPower = 0
                                    v713.Humanoid.WalkSpeed = 0
                                    v713.HumanoidRootPart.CanCollide = false
                                    v713.Humanoid:ChangeState(11)
                                    vu192(v713.HumanoidRootPart.CFrame * CFrame.new(0, _G.Settings.Configs["Distance Auto Farm"], 0))
                                end
                            else
                                Farmtween = vu192(v713.HumanoidRootPart.Position, v713.HumanoidRootPart.CFrame)
                            end
                        end
                        if _G.Settings.Main["Auto Third Sea"] and (v713.Parent and v713.Humanoid.Health > 0) then
							-- goto l180
                        end
                        FastAttack = false
						-- ::l72::
                        local v713
                        v711, v713 = v709(v710, v711)
                        if v711 == nil then
							-- goto l3
                        end
                        if v713.Name ~= "Don Swan [Lv. 1000] [Boss]" or (not v713:FindFirstChild("Humanoid") or (not v713:FindFirstChild("HumanoidRootPart") or v713.Humanoid.Health <= 0)) then
							-- goto l72
                        else
							-- goto l85
                        end
						-- ::l85::
						-- goto l81
						-- ::l180::
						-- goto l5
                    end)
                end
            end)
            v573:Toggle("Auto Bartilo Quest", _G.Settings.Main["Auto Bartilo Quest"], function(p714)
				-- upvalues: (ref) vu192
                _G.Settings.Main["Auto Bartilo Quest"] = p714
                if p714 == false then
                    vu192(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
                end
                getgenv().SaveSetting()
            end)
            task.spawn(function()
				-- upvalues: (ref) vu192
                while wait() do
                    pcall(function()
						-- upvalues: (ref) vu192
						-- block 94
                        if not _G.Settings.Main["Auto Bartilo Quest"] then
							-- ::l3::
                            return
                        end
                        if game.Players.LocalPlayer.Data.Level.Value >= 850 then
                            if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo") == 0 then
                                if string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Swan Pirates") and (string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "50") and game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == true) then
                                    if game.Workspace.Enemies:FindFirstChild("Swan Pirate [Lv. 775]") then
                                        local v715, v716, v717 = pairs(game.Workspace.Enemies:GetChildren())
                                        while true do
                                            local vu718
                                            v717, vu718 = v715(v716, v717)
                                            if v717 == nil then
                                                break
                                            end
                                            if vu718.Name == "Swan Pirate [Lv. 775]" then
                                                pcall(function()
													-- upvalues: (ref) vu718, (ref) vu192
                                                    while true do
                                                        wait()
                                                        if (vu718.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                                                            if (vu718.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                                                                if Farmtween then
                                                                    Farmtween:Stop()
                                                                end
                                                                FastAttack = true
                                                                StartMagnet = true
                                                                if _G.Settings.Configs["Auto Haki"] and not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
                                                                end
                                                                if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
                                                                    wait()
                                                                    EquipWeapon(_G.Settings.Configs["Select Weapon"])
                                                                end
                                                                PosMon = vu718.HumanoidRootPart.CFrame
                                                                if not _G.Settings.Configs["Fast Attack"] then
                                                                    game:GetService("VirtualUser"):CaptureController()
                                                                    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                                                end
                                                                vu718.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                                                if _G.Settings.Configs["Show Hitbox"] then
                                                                    vu718.HumanoidRootPart.Transparency = tonumber(_G.Hitbox_LocalTransparency)
                                                                else
                                                                    vu718.HumanoidRootPart.Transparency = 1
                                                                end
                                                                vu718.Humanoid.JumpPower = 0
                                                                vu718.Humanoid.WalkSpeed = 0
                                                                vu718.HumanoidRootPart.CanCollide = false
                                                                vu718.Humanoid:ChangeState(11)
                                                                vu192(vu718.HumanoidRootPart.CFrame * CFrame.new(0, _G.Settings.Configs["Distance Auto Farm"], 0))
                                                            end
                                                        else
                                                            Farmtween = vu192(vu718.HumanoidRootPart.Position, vu718.HumanoidRootPart.CFrame)
                                                        end
                                                        if not vu718.Parent or (vu718.Humanoid.Health <= 0 or (_G.Settings.Main["Auto Bartilo Quest"] == false or game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false)) then
                                                            StartMagnet = false
                                                            FastAttack = false
                                                            return
                                                        end
                                                    end
                                                end)
                                            end
                                        end
                                    else
                                        Questtween = vu192(CFrame.new(1057.92761, 137.614319, 1242.08069).Position, CFrame.new(1057.92761, 137.614319, 1242.08069))
                                        if (CFrame.new(1057.92761, 137.614319, 1242.08069).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                                            if Questtween then
                                                Questtween:Stop()
                                            end
                                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1057.92761, 137.614319, 1242.08069)
                                        end
                                    end
                                else
                                    Bartilotween = vu192(CFrame.new(- 456.28952, 73.0200958, 299.895966).Position, CFrame.new(- 456.28952, 73.0200958, 299.895966))
                                    if (CFrame.new(- 456.28952, 73.0200958, 299.895966).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                                        if Bartilotween then
                                            Bartilotween:Stop()
                                        end
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(- 456.28952, 73.0200958, 299.895966)
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                                            "StartQuest",
                                            "BartiloQuest",
                                            1
                                        }))
                                    end
                                end
                            end
							-- goto l3
                        end
                        if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo") ~= 1 then
                            if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo") == 2 then
                                if (CFrame.new(- 1836, 11, 1714).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                                    if (CFrame.new(- 1836, 11, 1714).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                                        if Bartilotween then
                                            Bartilotween:Stop()
                                        end
                                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(- 1836, 11, 1714)
                                        wait(0.5)
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(- 1850.49329, 13.1789551, 1750.89685)
                                        wait(1)
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(- 1858.87305, 19.3777466, 1712.01807)
                                        wait(1)
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(- 1803.94324, 16.5789185, 1750.89685)
                                        wait(1)
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(- 1858.55835, 16.8604317, 1724.79541)
                                        wait(1)
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(- 1869.54224, 15.987854, 1681.00659)
                                        wait(1)
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(- 1800.0979, 16.4978027, 1684.52368)
                                        wait(1)
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(- 1819.26343, 14.795166, 1717.90625)
                                        wait(1)
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(- 1813.51843, 14.8604736, 1724.79541)
                                    end
                                else
                                    Bartilotween = vu192(CFrame.new(- 1836, 11, 1714).Position, CFrame.new(- 1836, 11, 1714))
                                end
                            end
							-- goto l3
                        end
                        if not game.Workspace.Enemies:FindFirstChild("Jeremy [Lv. 850] [Boss]") then
                            Bartilotween = vu192(CFrame.new(2099.88159, 448.931, 648.997375).Position, CFrame.new(2099.88159, 448.931, 648.997375))
                            if (CFrame.new(2099.88159, 448.931, 648.997375).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                                if Bartilotween then
                                    Bartilotween:Stop()
                                end
                                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2099.88159, 448.931, 648.997375)
                            end
							-- goto l3
                        end
                        local v719, v720, v721 = pairs(game.Workspace.Enemies:GetChildren())
						-- goto l42
						-- ::l72::
                        FastAttack = false
						-- ::l42::
                        local v722
                        v721, v722 = v719(v720, v721)
                        if v721 == nil then
							-- goto l3
                        end
                        if v722.Name ~= "Jeremy [Lv. 850] [Boss]" then
							-- goto l42
                        end
						-- ::l45::
                        if true then
                            wait()
                            if (v722.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                                if (v722.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                                    if Farmtween then
                                        Farmtween:Stop()
                                    end
                                    FastAttack = true
                                    if _G.Settings.Configs["Auto Haki"] and not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
                                    end
                                    if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
                                        wait()
                                        EquipWeapon(_G.Settings.Configs["Select Weapon"])
                                    end
                                    PosMon = v722.HumanoidRootPart.CFrame
                                    if not _G.Settings.Configs["Fast Attack"] then
                                        game:GetService("VirtualUser"):CaptureController()
                                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                    end
                                    v722.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                    if _G.Settings.Configs["Show Hitbox"] then
                                        v722.HumanoidRootPart.Transparency = tonumber(_G.Hitbox_LocalTransparency)
                                    else
                                        v722.HumanoidRootPart.Transparency = 1
                                    end
                                    v722.Humanoid.JumpPower = 0
                                    v722.Humanoid.WalkSpeed = 0
                                    v722.HumanoidRootPart.CanCollide = false
                                    v722.Humanoid:ChangeState(11)
                                    vu192(v722.HumanoidRootPart.CFrame * CFrame.new(0, _G.Settings.Configs["Distance Auto Farm"], 0))
                                end
                            else
                                Farmtween = vu192(v722.HumanoidRootPart.Position, v722.HumanoidRootPart.CFrame)
                            end
                        end
                        if v722.Parent and (v722.Humanoid.Health > 0 and _G.Settings.Main["Auto Bartilo Quest"] ~= false) then
							-- goto l45
                        else
							-- goto l72
                        end
                    end)
                end
            end)
            v573:Toggle("Auto Dark Coat", _G.Settings.Main["Auto Dark Coat"], function(p723)
				-- upvalues: (ref) vu192
                _G.Settings.Main["Auto Dark Coat"] = p723
                if p723 == false then
                    vu192(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
                end
                getgenv().SaveSetting()
            end)
            task.spawn(function()
				-- upvalues: (ref) vu192
                while wait() do
                    pcall(function()
						-- upvalues: (ref) vu192
						-- block 49
                        if not _G.Settings.Main["Auto Dark Coat"] then
							-- ::l3::
                            return
                        end
                        if not game:GetService("Workspace").Enemies:FindFirstChild("Darkbeard [Lv. 1000] [Raid Boss]") then
                            vu192(CFrame.new(3677.08203125, 62.751937866211, - 3144.8332519531))
                            if _G.Hopper then
                                Fast_Hop()
                            end
							-- goto l3
                        end
                        local v724, v725, v726 = pairs(game:GetService("Workspace").Enemies:GetChildren())
						-- goto l7
						-- ::l24::
                        wait()
                        StartMagnet = true
                        FastAttack = true
                        if _G.Settings.Configs["Auto Haki"] and not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
                        end
                        if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
                            wait()
                            EquipWeapon(_G.Settings.Configs["Select Weapon"])
                        end
                        PosMon = v727.HumanoidRootPart.CFrame
                        if not _G.Settings.Configs["Fast Attack"] then
                            game:GetService("VirtualUser"):CaptureController()
                            game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                        end
                        v727.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                        if _G.Settings.Configs["Show Hitbox"] then
                            v727.HumanoidRootPart.Transparency = tonumber(_G.Hitbox_LocalTransparency)
                        else
                            v727.HumanoidRootPart.Transparency = 1
                        end
                        v727.Humanoid.JumpPower = 0
                        v727.Humanoid.WalkSpeed = 0
                        v727.HumanoidRootPart.CanCollide = false
                        v727.Humanoid:ChangeState(11)
                        vu192(v727.HumanoidRootPart.CFrame * CFrame.new(0, _G.Settings.Configs["Distance Auto Farm"], 0))
                        if _G.Settings.Main["Auto Dark Coat"] ~= false and v727.Humanoid.Health > 0 then
							-- goto l24
                        end
                        StartMagnet = false
                        FastAttack = false
						-- ::l7::
                        local v727
                        v726, v727 = v724(v725, v726)
                        if v726 == nil then
							-- goto l3
                        end
                        if v727.Name == ("Darkbeard [Lv. 1000] [Raid Boss]" or v727.Name == "Darkbeard [Lv. 1000] [Raid Boss]") and (v727.Humanoid.Health > 0 and (v727:IsA("Model") and (v727:FindFirstChild("Humanoid") and v727:FindFirstChild("HumanoidRootPart")))) then
							-- goto l24
                        else
							-- goto l7
                        end
                    end)
                end
            end)
            v573:Toggle("Auto Ectoplasm", _G.Settings.Main["Auto Ectoplasm"], function(p728)
				-- upvalues: (ref) vu192
                _G.Settings.Main["Auto Ectoplasm"] = p728
                if p728 == false then
                    vu192(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
                end
                getgenv().SaveSetting()
            end)
            task.spawn(function()
				-- upvalues: (ref) vu192
                while wait() do
                    pcall(function()
						-- upvalues: (ref) vu192
						-- block 57
                        if not _G.Settings.Main["Auto Ectoplasm"] then
							-- ::l3::
                            return
                        end
                        if not (game:GetService("Workspace").Enemies:FindFirstChild("Ship Deckhand [Lv. 1250]") or (game:GetService("Workspace").Enemies:FindFirstChild("Ship Engineer [Lv. 1275]") or (game:GetService("Workspace").Enemies:FindFirstChild("Ship Steward [Lv. 1300]") or (game:GetService("Workspace").Enemies:FindFirstChild("Ship Officer [Lv. 1325]") or game:GetService("Workspace").Enemies:FindFirstChild("Arctic Warrior [Lv. 1350]"))))) then
                            StartMagnet = false
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
							-- goto l3
                        end
                        local v729, v730, v731 = pairs(game:GetService("Workspace").Enemies:GetChildren())
						-- goto l15
						-- ::l32::
                        wait()
                        StartMagnet = true
                        FastAttack = true
                        if _G.Settings.Configs["Auto Haki"] and not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
                        end
                        if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
                            wait()
                            EquipWeapon(_G.Settings.Configs["Select Weapon"])
                        end
                        PosMon = v732.HumanoidRootPart.CFrame
                        if not _G.Settings.Configs["Fast Attack"] then
                            game:GetService("VirtualUser"):CaptureController()
                            game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                        end
                        v732.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                        if _G.Settings.Configs["Show Hitbox"] then
                            v732.HumanoidRootPart.Transparency = tonumber(_G.Hitbox_LocalTransparency)
                        else
                            v732.HumanoidRootPart.Transparency = 1
                        end
                        v732.Humanoid.JumpPower = 0
                        v732.Humanoid.WalkSpeed = 0
                        v732.HumanoidRootPart.CanCollide = false
                        v732.Humanoid:ChangeState(11)
                        vu192(v732.HumanoidRootPart.CFrame * CFrame.new(0, _G.Settings.Configs["Distance Auto Farm"], 0))
                        if _G.Settings.Main["Auto Ectoplasm"] and (v732.Parent and v732.Humanoid.Health > 0) then
							-- goto l32
                        end
                        StartMagnet = false
                        FastAttack = false
						-- ::l15::
                        local v732
                        v731, v732 = v729(v730, v731)
                        if v731 == nil then
							-- goto l3
                        end
                        if (v732.Name == "Ship Deckhand [Lv. 1250]" or (v732.Name == "Ship Engineer [Lv. 1275]" or (v732.Name == "Ship Steward [Lv. 1300]" or (v732.Name == "Ship Officer [Lv. 1325]" or v732.Name == "Arctic Warrior [Lv. 1350]")))) and (v732:FindFirstChild("Humanoid") and (v732:FindFirstChild("HumanoidRootPart") and v732.Humanoid.Health > 0)) then
							-- goto l32
                        else
							-- goto l15
                        end
                    end)
                end
            end)
            v573:Toggle("Auto True Triple Katana", _G.Settings.Main["Auto True Triple Katana"], function(p733)
				-- upvalues: (ref) vu192
                _G.Settings.Main["Auto True Triple Katana"] = p733
                if p733 == false then
                    vu192(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
                end
                getgenv().SaveSetting()
            end)
            task.spawn(function()
                while wait() do
                    pcall(function()
                        if _G.Settings.Main["Auto True Triple Katana"] then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("MysteriousMan", "2")
                        end
                    end)
                end
            end)
            v573:Toggle("Auto Rengoku Swords", _G.Settings.Main["Auto Rengoku"], function(p734)
				-- upvalues: (ref) vu192
                _G.Settings.Main["Auto Rengoku"] = p734
                if p734 == false then
                    vu192(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
                end
                getgenv().SaveSetting()
            end)
            task.spawn(function()
				-- upvalues: (ref) vu192
                while wait() do
                    pcall(function()
						-- upvalues: (ref) vu192
						-- block 48
                        if not _G.Settings.Main["Auto Rengoku"] then
							-- ::l3::
                            return
                        end
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Hidden Key") or game.Players.LocalPlayer.Character:FindFirstChild("Hidden Key") then
                            EquipWeapon("Hidden Key")
                            vu192(CFrame.new(6571.1201171875, 299.23028564453, - 6967.841796875))
							-- goto l3
                        end
                        if not (game.Workspace.Enemies:FindFirstChild("Snow Lurker [Lv. 1375]") or game:GetService("Workspace").Enemies:FindFirstChild("Arctic Warrior [Lv. 1350]")) then
                            StartMagnet = false
                            FastAttack = false
                            vu192(CFrame.new(5525.7045898438, 262.90060424805, - 6755.1186523438))
							-- goto l3
                        end
                        local v735, v736, v737 = pairs(game.Workspace.Enemies:GetChildren())
						-- goto l14
						-- ::l21::
                        wait()
                        StartMagnet = true
                        FastAttack = true
                        if _G.Settings.Configs["Auto Haki"] and not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
                        end
                        if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
                            wait()
                            EquipWeapon(_G.Settings.Configs["Select Weapon"])
                        end
                        PosMon = v738.HumanoidRootPart.CFrame
                        if not _G.Settings.Configs["Fast Attack"] then
                            game:GetService("VirtualUser"):CaptureController()
                            game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                        end
                        v738.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                        if _G.Settings.Configs["Show Hitbox"] then
                            v738.HumanoidRootPart.Transparency = tonumber(_G.Hitbox_LocalTransparency)
                        else
                            v738.HumanoidRootPart.Transparency = 1
                        end
                        v738.Humanoid.JumpPower = 0
                        v738.Humanoid.WalkSpeed = 0
                        v738.HumanoidRootPart.CanCollide = false
                        v738.Humanoid:ChangeState(11)
                        vu192(v738.HumanoidRootPart.CFrame * CFrame.new(0, _G.Settings.Configs["Distance Auto Farm"], 0))
                        if not game.Players.LocalPlayer.Backpack:FindFirstChild("Hidden Key") and (_G.Settings.Main["Auto Rengoku"] and (v738.Parent and v738.Humanoid.Health > 0)) then
							-- goto l21
                        end
                        StartMagnet = false
                        FastAttack = false
						-- ::l14::
                        local v738
                        v737, v738 = v735(v736, v737)
                        if v737 == nil then
							-- goto l3
                        end
                        if (v738.Name == "Snow Lurker [Lv. 1375]" or v738.Name == "Arctic Warrior [Lv. 1350]") and v738.Humanoid.Health > 0 then
							-- goto l21
                        else
							-- goto l14
                        end
                    end)
                end
            end)
            v573:Toggle("Auto Swan Glasses", _G.Settings.Main["Auto Swan Glasses"], function(p739)
				-- upvalues: (ref) vu192
                _G.Settings.Main["Auto Swan Glasses"] = p739
                if p739 == false then
                    vu192(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
                end
                getgenv().SaveSetting()
            end)
            task.spawn(function()
				-- upvalues: (ref) vu192
                while wait() do
                    pcall(function()
						-- upvalues: (ref) vu192
						-- block 46
                        if not _G.Settings.Main["Auto Swan Glasses"] then
							-- ::l3::
                            return
                        end
                        if not game:GetService("Workspace").Enemies:FindFirstChild("Don Swan [Lv. 1000] [Boss]") then
                            repeat
                                wait()
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(2284.912109375, 15.537666320801, 905.48291015625))
                            until (CFrame.new(2284.912109375, 15.537666320801, 905.48291015625).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 4 or not _G.Settings.Main["Auto Swan Glasses"]
							-- goto l3
                        end
                        local v740, v741, v742 = pairs(game:GetService("Workspace").Enemies:GetChildren())
						-- goto l7
						-- ::l18::
                        wait()
                        StartMagnet = true
                        FastAttack = true
                        if _G.Settings.Configs["Auto Haki"] and not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
                        end
                        if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
                            wait()
                            EquipWeapon(_G.Settings.Configs["Select Weapon"])
                        end
                        PosMon = v743.HumanoidRootPart.CFrame
                        if not _G.Settings.Configs["Fast Attack"] then
                            game:GetService("VirtualUser"):CaptureController()
                            game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                        end
                        v743.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                        if _G.Settings.Configs["Show Hitbox"] then
                            v743.HumanoidRootPart.Transparency = tonumber(_G.Hitbox_LocalTransparency)
                        else
                            v743.HumanoidRootPart.Transparency = 1
                        end
                        v743.Humanoid.JumpPower = 0
                        v743.Humanoid.WalkSpeed = 0
                        v743.HumanoidRootPart.CanCollide = false
                        v743.Humanoid:ChangeState(11)
                        vu192(v743.HumanoidRootPart.CFrame * CFrame.new(0, _G.Settings.Configs["Distance Auto Farm"], 0))
                        if _G.Settings.Main["Auto Swan Glasses"] and v743.Humanoid.Health > 0 then
							-- goto l18
                        end
                        StartMagnet = false
                        FastAttack = false
                        if _G.Hopper then
                            Fast_Hop()
                        end
						-- ::l7::
                        local v743
                        v742, v743 = v740(v741, v742)
                        if v742 == nil then
							-- goto l3
                        end
                        if v743.Name ~= "Don Swan [Lv. 1000] [Boss]" or (v743.Humanoid.Health <= 0 or not (v743:IsA("Model") and (v743:FindFirstChild("Humanoid") and v743:FindFirstChild("HumanoidRootPart")))) then
							-- goto l7
                        else
							-- goto l18
                        end
                    end)
                end
            end)
            v573:Label("Auto Buy")
            v573:Toggle("Auto Buy Legendary Sword", _G.Settings.Main["Auto Buy Legendary Sword"], function(p744)
                _G.Settings.Main["Auto Buy Legendary Sword"] = p744
                getgenv().SaveSetting()
            end)
            task.spawn(function()
                while wait() do
                    pcall(function()
                        if _G.Settings.Main["Auto Buy Legendary Sword"] then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LegendarySwordDealer", "1")
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LegendarySwordDealer", "2")
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LegendarySwordDealer", "3")
                            if _G.Settings.Main["Auto Buy Legendary Sword Hop"] then
                                wait(15)
                                Fast_Hop()
                            end
                        end
                    end)
                end
            end)
            v573:Toggle("Auto Buy Enchanment Haki", _G.Settings.Main["Auto Buy Enchanment Haki"], function(p745)
                _G.Settings.Main["Auto Buy Enchanment Haki"] = p745
                getgenv().SaveSetting()
            end)
            task.spawn(function()
                while wait() do
                    pcall(function()
                        if _G.Settings.Main["Auto Buy Enchanment Haki"] then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                                "ColorsDealer",
                                "2"
                            }))
                        end
                    end)
                end
            end)
            v573:Label("Farm Materail")
            v573:Dropdown("Select Material", v272, callback, function(p746)
                SelectModeMaterial = p746
            end)
            v573:Toggle("Auto Farm Material", AutoFarmMaterial, function(p747)
				-- upvalues: (ref) vu192
                AutoFarmMaterial = p747
                if p747 == false then
                    vu192(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
                end
            end)
            v573:Label("Soul Guitar")
            v573:Toggle("Auto Soul Guitar", _G.Settings.Main["Auto Quest Soul Guitar"], function(p748)
				-- upvalues: (ref) vu192
                _G.Settings.Main["Auto Quest Soul Guitar"] = p748
                if p748 == false then
                    vu192(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
                end
                getgenv().SaveSetting()
            end)
        elseif World3 then
            v573:Label("Status : World 3")
            v573:Toggle("Auto Sea Beast", _G.Settings.Main["Auto SeaBeast"], function(p749)
                _G.Settings.Main["Auto SeaBeast"] = p749
            end)
            v573:Toggle("Auto Holy Torch", _G.Settings.Main["Auto Holy Torch"], function(p750)
				-- upvalues: (ref) vu192
                _G.Settings.Main["Auto Holy Torch"] = p750
                if p750 == false then
                    vu192(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
                end
                getgenv().SaveSetting()
            end)
            task.spawn(function()
				-- upvalues: (ref) vu192
                while wait() do
                    if _G.Settings.Main["Auto Holy Torch"] then
                        repeat
                            vu192(CFrame.new(- 10752, 417, - 9366))
                            wait()
                        until not _G.Settings.Main["Auto Holy Torch"] or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(- 10752, 417, - 9366)).Magnitude <= 10
                        wait(1)
                        repeat
                            vu192(CFrame.new(- 11672, 334, - 9474))
                            wait()
                        until not _G.Settings.Main["Auto Holy Torch"] or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(- 11672, 334, - 9474)).Magnitude <= 10
                        wait(1)
                        repeat
                            vu192(CFrame.new(- 12132, 521, - 10655))
                            wait()
                        until not _G.Settings.Main["Auto Holy Torch"] or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(- 12132, 521, - 10655)).Magnitude <= 10
                        wait(1)
                        repeat
                            vu192(CFrame.new(- 13336, 486, - 6985))
                            wait()
                        until not _G.Settings.Main["Auto Holy Torch"] or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(- 13336, 486, - 6985)).Magnitude <= 10
                        wait(1)
                        repeat
                            vu192(CFrame.new(- 13489, 332, - 7925))
                            wait()
                        until not _G.Settings.Main["Auto Holy Torch"] or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(- 13489, 332, - 7925)).Magnitude <= 10
                    end
                end
            end)
            v573:Toggle("Auto Buddy Swords", _G.Settings.Main["Auto Buddy Swords"], function(p751)
				-- upvalues: (ref) vu192
                _G.Settings.Main["Auto Buddy Swords"] = p751
                if p751 == false then
                    vu192(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
                end
                getgenv().SaveSetting()
            end)
            task.spawn(function()
				-- upvalues: (ref) vu192
                while wait() do
                    pcall(function()
						-- upvalues: (ref) vu192
						-- block 47
                        if not (_G.Settings.Main["Auto Buddy Swords"] and game:GetService("Workspace").Enemies:FindFirstChild("Cake Queen [Lv. 2175] [Boss]")) then
							-- ::l3::
                            return
                        end
                        local v752, v753, v754 = pairs(game:GetService("Workspace").Enemies:GetChildren())
						-- ::l6::
                        local v755
                        v754, v755 = v752(v753, v754)
                        if v754 == nil then
							-- goto l3
                        end
                        if v755.Name ~= ("Cake Queen [Lv. 2175] [Boss]" or v755.Name == "Cake Queen [Lv. 2175] [Boss]") or (v755.Humanoid.Health <= 0 or not (v755:IsA("Model") and (v755:FindFirstChild("Humanoid") and v755:FindFirstChild("HumanoidRootPart")))) then
							-- goto l6
                        end
						-- ::l23::
                        wait()
                        StartMagnet = true
                        FastAttack = true
                        if _G.Settings.Configs["Auto Haki"] and not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
                        end
                        if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
                            wait()
                            EquipWeapon(_G.Settings.Configs["Select Weapon"])
                        end
                        PosMon = v755.HumanoidRootPart.CFrame
                        if not _G.Settings.Configs["Fast Attack"] then
                            game:GetService("VirtualUser"):CaptureController()
                            game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                        end
                        v755.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                        if _G.Settings.Configs["Show Hitbox"] then
                            v755.HumanoidRootPart.Transparency = tonumber(_G.Hitbox_LocalTransparency)
                        else
                            v755.HumanoidRootPart.Transparency = 1
                        end
                        v755.Humanoid.JumpPower = 0
                        v755.Humanoid.WalkSpeed = 0
                        v755.HumanoidRootPart.CanCollide = false
                        v755.Humanoid:ChangeState(11)
                        vu192(v755.HumanoidRootPart.CFrame * CFrame.new(0, _G.Settings.Configs["Distance Auto Farm"], 0))
                        if _G.Settings.Main["Auto Buddy Swords"] and v755.Humanoid.Health > 0 then
							-- goto l23
                        else
							-- goto l41
                        end
						-- ::l41::
                        StartMagnet = false
                        FastAttack = false
                        if _G.Hopper then
                            Fast_Hop()
                        end
						-- goto l6
                    end)
                end
            end)
            v573:Toggle("Auto Farm Boss Hallow", _G.Settings.Main["Auto Farm Boss Hallow"], function(p756)
				-- upvalues: (ref) vu192
                _G.Settings.Main["Auto Farm Boss Hallow"] = p756
                if p756 == false then
                    vu192(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
                end
                getgenv().SaveSetting()
            end)
            task.spawn(function()
				-- upvalues: (ref) vu192
                while wait() do
                    pcall(function()
						-- upvalues: (ref) vu192
						-- block 35
                        if not _G.Settings.Main["Auto Farm Boss Hallow"] then
							-- ::l3::
                            return
                        end
                        if not game:GetService("Workspace").Enemies:FindFirstChild("Soul Reaper [Lv. 2100] [Raid Boss]") then
                            vu192(CFrame.new(- 9524.7890625, 315.80429077148, 6655.7192382813))
							-- goto l3
                        end
                        local v757, v758, v759 = pairs(game:GetService("Workspace").Enemies:GetChildren())
						-- goto l7
						-- ::l10::
                        wait()
                        StartMagnet = true
                        FastAttack = true
                        if _G.Settings.Configs["Auto Haki"] and not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
                        end
                        if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
                            wait()
                            EquipWeapon(_G.Settings.Configs["Select Weapon"])
                        end
                        PosMon = v760.HumanoidRootPart.CFrame
                        if not _G.Settings.Configs["Fast Attack"] then
                            game:GetService("VirtualUser"):CaptureController()
                            game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                        end
                        v760.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                        if _G.Settings.Configs["Show Hitbox"] then
                            v760.HumanoidRootPart.Transparency = tonumber(_G.Hitbox_LocalTransparency)
                        else
                            v760.HumanoidRootPart.Transparency = 1
                        end
                        v760.Humanoid.JumpPower = 0
                        v760.Humanoid.WalkSpeed = 0
                        v760.HumanoidRootPart.CanCollide = false
                        v760.Humanoid:ChangeState(11)
                        vu192(v760.HumanoidRootPart.CFrame * CFrame.new(0, _G.Settings.Configs["Distance Auto Farm"], 0))
                        if v760.Humanoid.Health > 0 and _G.Settings.Main["Auto Farm Boss Hallow"] then
							-- goto l10
                        end
                        StartMagnet = false
                        FastAttack = false
                        if _G.Hopper then
                            Fast_Hop()
                        end
						-- ::l7::
                        local v760
                        v759, v760 = v757(v758, v759)
                        if v759 == nil then
							-- goto l3
                        end
                        if string.find(v760.Name, "Soul Reaper") then
							-- goto l10
                        else
							-- goto l7
                        end
                    end)
                end
            end)
            v573:Toggle("Auto Rainbow Haki", _G.Settings.Main["Auto Rainbow Haki"], function(p761)
				-- upvalues: (ref) vu192
                _G.Settings.Main["Auto Rainbow Haki"] = p761
                if p761 == false then
                    vu192(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
                end
                getgenv().SaveSetting()
            end)
            task.spawn(function()
				-- upvalues: (ref) vu192
                while wait() do
                    pcall(function()
						-- upvalues: (ref) vu192
						-- block 191
                        if not _G.Settings.Main["Auto Rainbow Haki"] then
							-- ::l3::
                            return
                        end
                        if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                            vu192(CFrame.new(- 11892.0703125, 930.57672119141, - 8760.1591796875))
                            if (Vector3.new(- 11892.0703125, 930.57672119141, - 8760.1591796875) - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 30 then
                                wait(1.5)
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("HornedMan", "Bet")
                            end
							-- goto l3
                        end
                        if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible ~= true or not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Stone") then
							-- goto l11
                        end
                        if not game:GetService("Workspace").Enemies:FindFirstChild("Stone [Lv. 1550] [Boss]") then
                            vu192(CFrame.new(- 1086.11621, 38.8425903, 6768.71436, 0.0231462717, - 0.592676699, 0.805107772, 0.0000203251839, 0.805323839, 0.592835128, - 0.999732077, - 0.0137055516, 0.0186523199))
							-- goto l3
                        end
                        local v762, v763, v764 = pairs(game:GetService("Workspace").Enemies:GetChildren())
						-- ::l17::
						-- ::l54::
						-- ::l92::
                        wait()
                        StartMagnet = true
                        FastAttack = true
                        if _G.Settings.Configs["Auto Haki"] and not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
                        end
                        if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
                            wait()
                            EquipWeapon(_G.Settings.Configs["Select Weapon"])
                        end
                        PosMon = v766.HumanoidRootPart.CFrame
                        if not _G.Settings.Configs["Fast Attack"] then
                            game:GetService("VirtualUser"):CaptureController()
                            game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                        end
                        v766.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                        if _G.Settings.Configs["Show Hitbox"] then
                            v766.HumanoidRootPart.Transparency = tonumber(_G.Hitbox_LocalTransparency)
                        else
                            v766.HumanoidRootPart.Transparency = 1
                        end
                        v766.Humanoid.JumpPower = 0
                        v766.Humanoid.WalkSpeed = 0
                        v766.HumanoidRootPart.CanCollide = false
                        v766.Humanoid:ChangeState(11)
                        vu192(v766.HumanoidRootPart.CFrame * CFrame.new(0, _G.Settings.Configs["Distance Auto Farm"], 0))
                        if _G.Settings.Main["Auto Rainbow Haki"] and (v766.Humanoid.Health > 0 and v766.Parent) and game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible ~= false then
							-- goto l54
                        else
							-- goto l119
                        end
						-- ::l119::
						-- ::l110::
                        StartMagnet = false
                        FastAttack = false
						-- ::l89::
                        local v765, v766 = v770(v771, v765)
                        if v765 == nil then
							-- goto l3
                        end
                        if v766.Name ~= "Kilo Admiral [Lv. 1750] [Boss]" then
							-- goto l89
                        else
							-- goto l3
                        end
						-- ::l3::
						-- ::l125::
						-- ::l2::
						-- ::l20::
						-- ::l23::
						-- goto l92
						-- ::l11::
                        if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible ~= true or not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Island Empress") then
							-- goto l48
                        end
                        if not game:GetService("Workspace").Enemies:FindFirstChild("Island Empress [Lv. 1675] [Boss]") then
                            vu192(CFrame.new(5713.98877, 601.922974, 202.751251, - 0.101080291, 0, - 0.994878292, 0, 1, 0, 0.994878292, 0, - 0.101080291))
							-- goto l3
                        end
                        local v767, v768, v769 = pairs(game:GetService("Workspace").Enemies:GetChildren())
						-- goto l54
						-- ::l48::
                        if not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Kilo Admiral") then
							-- goto l85
                        end
                        if not game:GetService("Workspace").Enemies:FindFirstChild("Kilo Admiral [Lv. 1750] [Boss]") then
                            vu192(CFrame.new(2877.61743, 423.558685, - 7207.31006, - 0.989591599, 0, - 0.143904909, 0, 1.00000012, 0, 0.143904924, 0, - 0.989591479))
							-- goto l3
                        end
                        local v770, v771
                        v770, v771, v765 = pairs(game:GetService("Workspace").Enemies:GetChildren())
						-- goto l89
						-- ::l85::
                        if not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Captain Elephant") then
							-- goto l120
                        end
                        if not game:GetService("Workspace").Enemies:FindFirstChild("Captain Elephant [Lv. 1875] [Boss]") then
                            vu192(CFrame.new(- 13485.0283, 331.709259, - 8012.4873, 0.714521289, 7.98849911e-8, 0.69961375, - 1.02065748e-7, 1, - 9.94383065e-9, - 0.69961375, - 6.43015241e-8, 0.714521289))
							-- goto l3
                        end
                        local v772, v773, v774 = pairs(game:GetService("Workspace").Enemies:GetChildren())
						-- goto l124
						-- ::l120::
                        if not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Beautiful Pirate") then
                            vu192(CFrame.new(- 11892.0703125, 930.57672119141, - 8760.1591796875))
                            if (Vector3.new(- 11892.0703125, 930.57672119141, - 8760.1591796875) - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 30 then
                                wait(1.5)
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("HornedMan", "Bet")
                            end
							-- goto l3
                        end
                        if not game:GetService("Workspace").Enemies:FindFirstChild("Beautiful Pirate [Lv. 1950] [Boss]") then
                            vu192(CFrame.new(5312.3598632813, 20.141201019287, - 10.158538818359))
							-- goto l3
                        end
                        local v775, v776, v777 = pairs(game:GetService("Workspace").Enemies:GetChildren())
						-- goto l159
						-- ::l13::
						-- goto l17
						-- ::l18::
						-- goto l84
						-- ::l38::
                        StartMagnet = false
                        FastAttack = false
						-- ::l17::
                        local v778
                        v764, v778 = v762(v763, v764)
                        if v764 == nil then
							-- goto l3
                        end
                        if v778.Name ~= "Stone [Lv. 1550] [Boss]" then
							-- goto l13
                        end
						-- ::l20::
                        wait()
                        StartMagnet = true
                        FastAttack = true
                        if _G.Settings.Configs["Auto Haki"] and not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
                        end
                        if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
                            wait()
                            EquipWeapon(_G.Settings.Configs["Select Weapon"])
                        end
                        PosMon = v778.HumanoidRootPart.CFrame
                        if not _G.Settings.Configs["Fast Attack"] then
                            game:GetService("VirtualUser"):CaptureController()
                            game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                        end
                        v778.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                        if _G.Settings.Configs["Show Hitbox"] then
                            v778.HumanoidRootPart.Transparency = tonumber(_G.Hitbox_LocalTransparency)
                        else
                            v778.HumanoidRootPart.Transparency = 1
                        end
                        v778.Humanoid.JumpPower = 0
                        v778.Humanoid.WalkSpeed = 0
                        v778.HumanoidRootPart.CanCollide = false
                        v778.Humanoid:ChangeState(11)
                        vu192(v778.HumanoidRootPart.CFrame * CFrame.new(0, _G.Settings.Configs["Distance Auto Farm"], 0))
                        if _G.Settings.Main["Auto Rainbow Haki"] and (v778.Humanoid.Health > 0 and v778.Parent) and game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible ~= false then
							-- goto l20
                        else
							-- goto l38
                        end
						-- ::l50::
						-- goto l57
						-- ::l55::
						-- goto l60
						-- ::l57::
						-- goto l90
						-- ::l60::
						-- goto l162
						-- ::l75::
                        StartMagnet = false
                        FastAttack = false
						-- ::l54::
                        local v779
                        v769, v779 = v767(v768, v769)
                        if v769 == nil then
							-- goto l3
                        end
                        if v779.Name ~= "Island Empress [Lv. 1675] [Boss]" then
							-- goto l17
                        end
						-- ::l57::
                        wait()
                        StartMagnet = true
                        FastAttack = true
                        if _G.Settings.Configs["Auto Haki"] and not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
                        end
                        if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
                            wait()
                            EquipWeapon(_G.Settings.Configs["Select Weapon"])
                        end
                        PosMon = v779.HumanoidRootPart.CFrame
                        if not _G.Settings.Configs["Fast Attack"] then
                            game:GetService("VirtualUser"):CaptureController()
                            game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                        end
                        v779.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                        if _G.Settings.Configs["Show Hitbox"] then
                            v779.HumanoidRootPart.Transparency = tonumber(_G.Hitbox_LocalTransparency)
                        else
                            v779.HumanoidRootPart.Transparency = 1
                        end
                        v779.Humanoid.JumpPower = 0
                        v779.Humanoid.WalkSpeed = 0
                        v779.HumanoidRootPart.CanCollide = false
                        v779.Humanoid:ChangeState(11)
                        vu192(v779.HumanoidRootPart.CFrame * CFrame.new(0, _G.Settings.Configs["Distance Auto Farm"], 0))
                        if _G.Settings.Main["Auto Rainbow Haki"] and (v779.Humanoid.Health > 0 and v779.Parent) and game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible ~= false then
							-- goto l57
                        else
							-- goto l75
                        end
						-- ::l84::
						-- goto l55
						-- ::l90::
						-- goto l95
						-- ::l95::
						-- goto l159
						-- ::l127::
                        wait()
                        StartMagnet = true
                        FastAttack = true
                        if _G.Settings.Configs["Auto Haki"] and not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
                        end
                        if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
                            wait()
                            EquipWeapon(_G.Settings.Configs["Select Weapon"])
                        end
                        PosMon = v780.HumanoidRootPart.CFrame
                        if not _G.Settings.Configs["Fast Attack"] then
                            game:GetService("VirtualUser"):CaptureController()
                            game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                        end
                        v780.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                        if _G.Settings.Configs["Show Hitbox"] then
                            v780.HumanoidRootPart.Transparency = tonumber(_G.Hitbox_LocalTransparency)
                        else
                            v780.HumanoidRootPart.Transparency = 1
                        end
                        v780.Humanoid.JumpPower = 0
                        v780.Humanoid.WalkSpeed = 0
                        v780.HumanoidRootPart.CanCollide = false
                        v780.Humanoid:ChangeState(11)
                        vu192(v780.HumanoidRootPart.CFrame * CFrame.new(0, _G.Settings.Configs["Distance Auto Farm"], 0))
                        if _G.Settings.Main["Auto Rainbow Haki"] and (v780.Humanoid.Health > 0 and v780.Parent) and game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible ~= false then
							-- goto l127
                        end
                        StartMagnet = false
                        FastAttack = false
						-- ::l124::
                        local v780
                        v774, v780 = v772(v773, v774)
                        if v774 == nil then
							-- goto l3
                        end
                        if v780.Name ~= "Captain Elephant [Lv. 1875] [Boss]" then
							-- goto l124
                        else
							-- goto l127
                        end
						-- ::l130::
						-- goto l18
						-- ::l154::
						-- goto l50
						-- ::l162::
                        wait()
                        StartMagnet = true
                        FastAttack = true
                        if _G.Settings.Configs["Auto Haki"] and not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
                        end
                        if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
                            wait()
                            EquipWeapon(_G.Settings.Configs["Select Weapon"])
                        end
                        PosMon = v781.HumanoidRootPart.CFrame
                        if not _G.Settings.Configs["Fast Attack"] then
                            game:GetService("VirtualUser"):CaptureController()
                            game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                        end
                        v781.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                        if _G.Settings.Configs["Show Hitbox"] then
                            v781.HumanoidRootPart.Transparency = tonumber(_G.Hitbox_LocalTransparency)
                        else
                            v781.HumanoidRootPart.Transparency = 1
                        end
                        v781.Humanoid.JumpPower = 0
                        v781.Humanoid.WalkSpeed = 0
                        v781.HumanoidRootPart.CanCollide = false
                        v781.Humanoid:ChangeState(11)
                        vu192(v781.HumanoidRootPart.CFrame * CFrame.new(0, _G.Settings.Configs["Distance Auto Farm"], 0))
                        if _G.Settings.Main["Auto Rainbow Haki"] and (v781.Humanoid.Health > 0 and v781.Parent) and game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible ~= false then
							-- goto l162
                        end
                        StartMagnet = false
                        FastAttack = false
						-- ::l159::
                        local v781
                        v777, v781 = v775(v776, v777)
                        if v777 == nil then
							-- goto l3
                        end
                        if v781.Name ~= "Beautiful Pirate [Lv. 1950] [Boss]" then
							-- goto l154
                        else
							-- goto l130
                        end
                    end)
                end
            end)
            v573:Toggle("Auto Elite Hunter", _G.Settings.Main["Auto Elite Hunter"], function(p782)
				-- upvalues: (ref) vu192
                _G.Settings.Main["Auto Elite Hunter"] = p782
                if p782 == false then
                    vu192(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
                end
                getgenv().SaveSetting()
            end)
            task.spawn(function()
				-- upvalues: (ref) vu192
                while wait() do
                    pcall(function()
						-- upvalues: (ref) vu192
						-- block 171
                        if not _G.Settings.Main["Auto Elite Hunter"] then
							-- ::l3::
                            return
                        end
                        if game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible ~= true then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter")
							-- goto l3
                        end
                        if not (string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Diablo") or (string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Urban") or string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Deandre"))) then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter")
							-- goto l3
                        end
                        local v783, v784, v785 = pairs(game.ReplicatedStorage:GetChildren())
                        while true do
                            local v786
                            v785, v786 = v783(v784, v785)
                            if v785 == nil then
                                break
                            end
                            if string.find(v786.Name, "Diablo") then
                                EliteHunter = vu192(v786.HumanoidRootPart.CFrame)
                                if (v786.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 150 then
                                    if EliteHunter then
                                        EliteHunter:Stop()
                                    end
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v786.HumanoidRootPart.CFrame
                                end
                            end
                            if string.find(v786.Name, "Urban") then
                                EliteHunter = vu192(v786.HumanoidRootPart.CFrame)
                                if (v786.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 150 then
                                    if EliteHunter then
                                        EliteHunter:Stop()
                                    end
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v786.HumanoidRootPart.CFrame
                                end
                            end
                            if string.find(v786.Name, "Deandre") then
                                EliteHunter = vu192(v786.HumanoidRootPart.CFrame)
                                if (v786.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 150 then
                                    if EliteHunter then
                                        EliteHunter:Stop()
                                    end
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v786.HumanoidRootPart.CFrame
                                end
                            end
                        end
                        local v787, v788, v789 = pairs(game.Workspace.Enemies:GetChildren())
						-- goto l41
						-- ::l136::
                        if true then
                            wait()
                            if (v790.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 150 then
                                if (v790.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 150 then
                                    if Farmtween then
                                        Farmtween:Stop()
                                    end
                                    if AttackRandomType ~= 1 then
                                        if AttackRandomType ~= 2 then
                                            if AttackRandomType ~= 3 then
                                                if AttackRandomType ~= 4 then
                                                    if AttackRandomType ~= 5 then
                                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v790.HumanoidRootPart.CFrame * CFrame.new(0, 30, 1)
                                                    else
                                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v790.HumanoidRootPart.CFrame * CFrame.new(- 30, 1, 0)
                                                    end
                                                else
                                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v790.HumanoidRootPart.CFrame * CFrame.new(30, 1, 0)
                                                end
                                            else
                                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v790.HumanoidRootPart.CFrame * CFrame.new(1, 1, - 30)
                                            end
                                        else
                                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v790.HumanoidRootPart.CFrame * CFrame.new(0, 1, 30)
                                        end
                                    else
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v790.HumanoidRootPart.CFrame * CFrame.new(0, 30, 1)
                                    end
                                    FastAttack = true
                                    EquipWeapon(_G.Settings.Configs["Select Weapon"])
                                end
                            else
                                Farmtween = vu192(v790.HumanoidRootPart.CFrame)
                            end
                        end
                        if _G.Settings.Main["Auto Elite Hunter"] and (v790.Parent and v790.Humanoid.Health > 0) then
							-- goto l136
                        end
                        FastAttack = false
						-- ::l41::
                        local v790
                        v789, v790 = v787(v788, v789)
                        if v789 == nil then
							-- goto l3
                        end
                        if _G.Settings.Main["Auto Elite Hunter"] and (string.find(v790.Name, "Diablo") and (v790:FindFirstChild("Humanoid") and (v790:FindFirstChild("HumanoidRootPart") and v790.Humanoid.Health > 0))) then
                            while true do
                                if true then
                                    wait()
                                    if (v790.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 150 then
                                        if (v790.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 150 then
                                            if Farmtween then
                                                Farmtween:Stop()
                                            end
                                            if AttackRandomType ~= 1 then
                                                if AttackRandomType ~= 2 then
                                                    if AttackRandomType ~= 3 then
                                                        if AttackRandomType ~= 4 then
                                                            if AttackRandomType ~= 5 then
                                                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v790.HumanoidRootPart.CFrame * CFrame.new(0, 30, 1)
                                                            else
                                                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v790.HumanoidRootPart.CFrame * CFrame.new(- 30, 1, 0)
                                                            end
                                                        else
                                                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v790.HumanoidRootPart.CFrame * CFrame.new(30, 1, 0)
                                                        end
                                                    else
                                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v790.HumanoidRootPart.CFrame * CFrame.new(1, 1, - 30)
                                                    end
                                                else
                                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v790.HumanoidRootPart.CFrame * CFrame.new(0, 1, 30)
                                                end
                                            else
                                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v790.HumanoidRootPart.CFrame * CFrame.new(0, 30, 1)
                                            end
                                            FastAttack = true
                                            EquipWeapon(_G.Settings.Configs["Select Weapon"])
                                        end
                                    else
                                        Farmtween = vu192(v790.HumanoidRootPart.CFrame)
                                    end
                                end
                                if not _G.Settings.Main["Auto Elite Hunter"] or (not v790.Parent or v790.Humanoid.Health <= 0) then
                                    FastAttack = false
									-- goto l45
                                end
                            end
                        end
						-- ::l45::
                        if _G.Settings.Main["Auto Elite Hunter"] and (string.find(v790.Name, "Urban") and (v790:FindFirstChild("Humanoid") and (v790:FindFirstChild("HumanoidRootPart") and v790.Humanoid.Health > 0))) then
                            while true do
                                if true then
                                    wait()
                                    if (v790.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 150 then
                                        if (v790.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 150 then
                                            if Farmtween then
                                                Farmtween:Stop()
                                            end
                                            if AttackRandomType ~= 1 then
                                                if AttackRandomType ~= 2 then
                                                    if AttackRandomType ~= 3 then
                                                        if AttackRandomType ~= 4 then
                                                            if AttackRandomType ~= 5 then
                                                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v790.HumanoidRootPart.CFrame * CFrame.new(0, 30, 1)
                                                            else
                                                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v790.HumanoidRootPart.CFrame * CFrame.new(- 30, 1, 0)
                                                            end
                                                        else
                                                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v790.HumanoidRootPart.CFrame * CFrame.new(30, 1, 0)
                                                        end
                                                    else
                                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v790.HumanoidRootPart.CFrame * CFrame.new(1, 1, - 30)
                                                    end
                                                else
                                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v790.HumanoidRootPart.CFrame * CFrame.new(0, 1, 30)
                                                end
                                            else
                                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v790.HumanoidRootPart.CFrame * CFrame.new(0, 30, 1)
                                            end
                                            FastAttack = true
                                            EquipWeapon(_G.Settings.Configs["Select Weapon"])
                                        end
                                    else
                                        Farmtween = vu192(v790.HumanoidRootPart.CFrame)
                                    end
                                end
                                if not _G.Settings.Main["Auto Elite Hunter"] or (not v790.Parent or v790.Humanoid.Health <= 0) then
                                    FastAttack = false
									-- goto l87
                                end
                            end
                        end
						-- ::l87::
                        if _G.Settings.Main["Auto Elite Hunter"] and (string.find(v790.Name, "Deandre") and (v790:FindFirstChild("Humanoid") and (v790:FindFirstChild("HumanoidRootPart") and v790.Humanoid.Health > 0))) then
							-- goto l136
                        else
							-- goto l41
                        end
                    end)
                end
            end)
            v573:Toggle("Auto Musketeer Hat", _G.Settings.Main["Auto Musketeer Hat"], function(p791)
				-- upvalues: (ref) vu192
                _G.Settings.Main["Auto Musketeer Hat"] = p791
                if p791 == false then
                    vu192(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
                end
                getgenv().SaveSetting()
            end)
            task.spawn(function()
				-- upvalues: (ref) vu192
                while wait() do
                    pcall(function()
						-- upvalues: (ref) vu192
						-- block 102
                        if not _G.Settings.Main["Auto Musketeer Hat"] then
							-- ::l3::
                            return
                        end
                        if game:GetService("Players").LocalPlayer.Data.Level.Value >= 1800 and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress").KilledBandits == false then
							-- goto l8
                        end
                        if game:GetService("Players").LocalPlayer.Data.Level.Value < 1800 or game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress").KilledBoss ~= false then
                            if game:GetService("Players").LocalPlayer.Data.Level.Value >= 1800 and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress", "Citizen") == 2 then
                                vu192(CFrame.new(- 12512.138671875, 340.39279174805, - 9872.8203125))
                            end
							-- goto l3
                        end
                        if not game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible or (not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Captain Elephant") or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible ~= true) then
                            vu192(CFrame.new(- 12443.8671875, 332.40396118164, - 7675.4892578125))
                            if (CFrame.new(- 12443.8671875, 332.40396118164, - 7675.4892578125).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 4 then
                                wait(1.5)
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress", "Citizen")
                            end
							-- goto l3
                        end
                        if not game:GetService("Workspace").Enemies:FindFirstChild("Captain Elephant [Lv. 1875] [Boss]") then
                            vu192(CFrame.new(- 13374.889648438, 421.27752685547, - 8225.208984375))
							-- goto l3
                        end
                        local v792, v793, v794 = pairs(game:GetService("Workspace").Enemies:GetChildren())
						-- goto l65
						-- ::l8::
                        if not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Forest Pirate") or (not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "50") or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible ~= true) then
                            vu192(CFrame.new(- 12443.8671875, 332.40396118164, - 7675.4892578125))
                            if (Vector3.new(- 12443.8671875, 332.40396118164, - 7675.4892578125) - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 30 then
                                wait(1.5)
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", "CitizenQuest", 1)
                            end
							-- goto l3
                        end
                        if not game:GetService("Workspace").Enemies:FindFirstChild("Forest Pirate [Lv. 1825]") then
                            vu192(CFrame.new(- 13206.452148438, 425.89199829102, - 7964.5537109375))
							-- goto l3
                        end
                        local v795, v796, v797 = pairs(game:GetService("Workspace").Enemies:GetChildren())
						-- ::l19::
						-- goto l65
						-- ::l3::
						-- goto l19
						-- ::l2::
						-- goto l68
						-- ::l6::
						-- goto l19
						-- ::l22::
                        wait()
                        StartMagnet = true
                        FastAttack = true
                        if _G.Settings.Configs["Auto Haki"] and not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
                        end
                        if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
                            wait()
                            EquipWeapon(_G.Settings.Configs["Select Weapon"])
                        end
                        PosMon = v798.HumanoidRootPart.CFrame
                        if not _G.Settings.Configs["Fast Attack"] then
                            game:GetService("VirtualUser"):CaptureController()
                            game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                        end
                        v798.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                        if _G.Settings.Configs["Show Hitbox"] then
                            v798.HumanoidRootPart.Transparency = tonumber(_G.Hitbox_LocalTransparency)
                        else
                            v798.HumanoidRootPart.Transparency = 1
                        end
                        v798.Humanoid.JumpPower = 0
                        v798.Humanoid.WalkSpeed = 0
                        v798.HumanoidRootPart.CanCollide = false
                        v798.Humanoid:ChangeState(11)
                        vu192(v798.HumanoidRootPart.CFrame * CFrame.new(0, _G.Settings.Configs["Distance Auto Farm"], 0))
                        if _G.Settings.Main["Auto Musketeer Hat"] and (v798.Humanoid.Health > 0 and v798.Parent) and game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible ~= false then
							-- goto l22
                        end
                        StartMagnet = false
                        FastAttack = false
						-- ::l19::
                        local v798
                        v797, v798 = v795(v796, v797)
                        if v797 == nil then
							-- goto l3
                        end
                        if v798.Name ~= "Forest Pirate [Lv. 1825]" then
							-- goto l6
                        else
							-- goto l22
                        end
						-- ::l68::
                        OldCFrameElephant = v799.HumanoidRootPart.CFrame
						-- goto l92
						-- ::l92::
                        wait()
                        StartMagnet = true
                        FastAttack = true
                        if _G.Settings.Configs["Auto Haki"] and not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
                        end
                        if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
                            wait()
                            EquipWeapon(_G.Settings.Configs["Select Weapon"])
                        end
                        PosMon = v799.HumanoidRootPart.CFrame
                        if not _G.Settings.Configs["Fast Attack"] then
                            game:GetService("VirtualUser"):CaptureController()
                            game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                        end
                        v799.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                        if _G.Settings.Configs["Show Hitbox"] then
                            v799.HumanoidRootPart.Transparency = tonumber(_G.Hitbox_LocalTransparency)
                        else
                            v799.HumanoidRootPart.Transparency = 1
                        end
                        v799.Humanoid.JumpPower = 0
                        v799.Humanoid.WalkSpeed = 0
                        v799.HumanoidRootPart.CanCollide = false
                        v799.Humanoid:ChangeState(11)
                        vu192(v799.HumanoidRootPart.CFrame * CFrame.new(0, _G.Settings.Configs["Distance Auto Farm"], 0))
                        if _G.Settings.Main["Auto Musketeer Hat"] and (v799.Humanoid.Health > 0 and v799.Parent) and game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible ~= false then
							-- goto l92
                        end
                        StartMagnet = false
                        FastAttack = false
						-- ::l65::
                        local v799
                        v794, v799 = v792(v793, v794)
                        if v794 == nil then
							-- goto l3
                        end
                        if v799.Name ~= "Captain Elephant [Lv. 1875] [Boss]" then
							-- goto l3
                        else
							-- goto l2
                        end
                    end)
                end
            end)
            v573:Toggle("Auto Farm Bone", _G.Settings.Main["Auto Farm Bone"], function(p800)
				-- upvalues: (ref) vu192
                _G.Settings.Main["Auto Farm Bone"] = p800
                if p800 == false then
                    vu192(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
                end
                getgenv().SaveSetting()
            end)
            task.spawn(function()
				-- upvalues: (ref) vu192
                while wait() do
                    pcall(function()
						-- upvalues: (ref) vu192
						-- block 55
                        if not _G.Settings.Main["Auto Farm Bone"] then
							-- ::l3::
                            return
                        end
                        if not (game:GetService("Workspace").Enemies:FindFirstChild("Reborn Skeleton [Lv. 1975]") or (game:GetService("Workspace").Enemies:FindFirstChild("Living Zombie [Lv. 2000]") or (game:GetService("Workspace").Enemies:FindFirstChild("Demonic Soul [Lv. 2025]") or game:GetService("Workspace").Enemies:FindFirstChild("Posessed Mummy [Lv. 2050]")))) then
                            vu192(CFrame.new(- 9504.8564453125, 172.14292907714844, 6057.259765625))
							-- goto l3
                        end
                        local v801, v802, v803 = pairs(game:GetService("Workspace").Enemies:GetChildren())
						-- goto l13
						-- ::l28::
                        wait()
                        StartMagnet = true
                        FastAttack = true
                        if _G.Settings.Configs["Auto Haki"] and not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
                        end
                        if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
                            wait()
                            EquipWeapon(_G.Settings.Configs["Select Weapon"])
                        end
                        PosMon = v804.HumanoidRootPart.CFrame
                        if not _G.Settings.Configs["Fast Attack"] then
                            game:GetService("VirtualUser"):CaptureController()
                            game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                        end
                        v804.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                        if _G.Settings.Configs["Show Hitbox"] then
                            v804.HumanoidRootPart.Transparency = tonumber(_G.Hitbox_LocalTransparency)
                        else
                            v804.HumanoidRootPart.Transparency = 1
                        end
                        v804.Humanoid.JumpPower = 0
                        v804.Humanoid.WalkSpeed = 0
                        v804.HumanoidRootPart.CanCollide = false
                        v804.Humanoid:ChangeState(11)
                        vu192(v804.HumanoidRootPart.CFrame * CFrame.new(0, _G.Settings.Configs["Distance Auto Farm"], 0))
                        if _G.Settings.Main["Auto Farm Bone"] and (v804.Humanoid.Health > 0 and (v804.Parent and v804.Humanoid.Health > 0)) then
							-- goto l28
                        end
                        StartMagnet = false
                        FastAttack = false
						-- ::l13::
                        local v804
                        v803, v804 = v801(v802, v803)
                        if v803 == nil then
							-- goto l3
                        end
                        if (v804.Name == "Reborn Skeleton [Lv. 1975]" or (v804.Name == "Living Zombie [Lv. 2000]" or (v804.Name == "Demonic Soul [Lv. 2025]" or v804.Name == "Posessed Mummy [Lv. 2050]"))) and (v804:FindFirstChild("Humanoid") and (v804:FindFirstChild("HumanoidRootPart") and v804.Humanoid.Health > 0)) then
							-- goto l28
                        else
							-- goto l13
                        end
                    end)
                end
            end)
            v573:Toggle("Farm Observation", _G.Settings.Main["Farm Observation"], function(p805)
				-- upvalues: (ref) vu192
                _G.Settings.Main["Farm Observation"] = p805
                if p805 == false then
                    vu192(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
                end
            end)
            task.spawn(function()
                while wait() do
                    pcall(function()
                        if _G.Settings.Main["Farm Observation"] then
                            while true do
                                wait()
                                if not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
                                    game:GetService("VirtualUser"):CaptureController()
                                    game:GetService("VirtualUser"):SetKeyDown("0x65")
                                    wait(2)
                                    game:GetService("VirtualUser"):SetKeyUp("0x65")
                                end
                                if game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") or not _G.Settings.Main["Farm Observation"] then
									-- goto l3
                                end
                            end
                        else
							-- ::l3::
                            return
                        end
                    end)
                end
            end)
            task.spawn(function()
				-- upvalues: (ref) vu192
                pcall(function()
					-- upvalues: (ref) vu192
					-- ::l0::
                    while true do
                        repeat
                            if not wait() then
                                return
                            end
                        until _G.Settings.Main["Farm Observation"]
                        if game:GetService("Players").LocalPlayer.VisionRadius.Value < 3000 then
                            break
                        end
                        game:GetService("StarterGui"):SetCore("SendNotification", {
                            ["Icon"] = "rbxassetid://0",
                            ["Text"] = "You Have Max Points",
                            "Observation"
                        })
                        wait(2)
                    end
					-- ::l8::
                    if not World2 then
						-- goto l11
                    end
                    if game:GetService("Workspace").Enemies:FindFirstChild("Lava Pirate [Lv. 1200]") then
                        if game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
                            wait()
                            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies:FindFirstChild("Lava Pirate [Lv. 1200]").HumanoidRootPart.CFrame * CFrame.new(3, 0, 0)
                            if _G.Settings.Main["Farm Observation"] ~= false and game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
								-- goto l17
                            end
                        else
							-- ::l17::
                            wait()
                            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies:FindFirstChild("Lava Pirate [Lv. 1200]").HumanoidRootPart.CFrame * CFrame.new(0, 50, 0) + wait(1)
                            if not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") and _G.Settings.Main["Farm Observation Hop"] == true then
                                game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
                            end
                            if _G.Settings.Main["Farm Observation"] ~= false and not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
								-- goto l14
                            end
                        end
                    else
						-- ::l14::
                        vu192(CFrame.new(- 5478.39209, 15.9775667, - 5246.9126))
                    end
					-- goto l0
					-- ::l11::
                    if not World1 then
						-- goto l31
                    end
                    if game:GetService("Workspace").Enemies:FindFirstChild("Galley Captain [Lv. 650]") then
                        if game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
                            repeat
                                wait()
                                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies:FindFirstChild("Galley Captain [Lv. 650]").HumanoidRootPart.CFrame * CFrame.new(3, 0, 0)
                            until _G.Settings.Main["Farm Observation"] == false or not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
                        else
                            wait()
                            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies:FindFirstChild("Galley Captain [Lv. 650]").HumanoidRootPart.CFrame * CFrame.new(0, 50, 0)
                            wait(1)
                            if not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") and _G.Settings.Main["Farm Observation Hop"] == true then
                                game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
                            end
                            if _G.Settings.Main["Farm Observation"] ~= false and not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
								-- goto l34
                            end
                        end
                    else
						-- ::l34::
                        vu192(CFrame.new(5533.29785, 88.1079102, 4852.3916))
                    end
					-- goto l0
					-- ::l31::
                    if not World3 then
						-- goto l0
                    end
                    if not game:GetService("Workspace").Enemies:FindFirstChild("Giant Islander [Lv. 1650]") then
						-- goto l54
                    end
                    if not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
						-- goto l57
                    end
                    repeat
                        wait()
                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies:FindFirstChild("Giant Islander [Lv. 1650]").HumanoidRootPart.CFrame * CFrame.new(3, 0, 0)
                    until _G.Settings.Main["Farm Observation"] == false or not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
					-- goto l0
					-- ::l57::
                    wait()
                    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Enemies:FindFirstChild("Giant Islander [Lv. 1650]").HumanoidRootPart.CFrame * CFrame.new(0, 50, 0)
                    wait(1)
                    if not game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") and _G.Settings.Main["Farm Observation Hop"] == true then
                        game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
                    end
                    if _G.Settings.Main["Farm Observation"] == false or game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
						-- goto l0
                    else
						-- goto l57
                    end
					-- ::l54::
                    vu192(CFrame.new(4530.3540039063, 656.75695800781, - 131.60952758789))
					-- goto l0
                end)
            end)
            v573:Toggle("Upgrade Observation Haki", _G.Settings.Main["Auto Ken-Haki V2"], function(p806)
				-- upvalues: (ref) vu192
                _G.Settings.Main["Auto Ken-Haki V2"] = p806
                if p806 == false then
                    vu192(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
                end
                getgenv().SaveSetting()
            end)
            task.spawn(function()
				-- upvalues: (ref) vu192
                while wait() do
                    pcall(function()
						-- upvalues: (ref) vu192
						-- block 109
                        if not _G.Settings.Main["Auto Ken-Haki V2"] then
							-- ::l3::
                            return
                        end
                        if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                            repeat
                                vu192(CFrame.new(- 12444.78515625, 332.40396118164, - 7673.1806640625))
                                wait()
                            until not _G.Settings.Main["Auto Ken-Haki V2"] or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(- 12444.78515625, 332.40396118164, - 7673.1806640625)).Magnitude <= 10
                            wait(0.5)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress", "Citizen")
                            wait(1)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", "CitizenQuest", 1)
							-- goto l3
                        end
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Banana") and (game.Players.LocalPlayer.Backpack:FindFirstChild("Apple") and game.Players.LocalPlayer.Backpack:FindFirstChild("Pineapple")) then
                            repeat
                                vu192(CFrame.new(- 12444.78515625, 332.40396118164, - 7673.1806640625))
                                wait()
                            until not _G.Settings.Main["Auto Ken-Haki V2"] or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(- 12444.78515625, 332.40396118164, - 7673.1806640625)).Magnitude <= 10
                            wait(0.5)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress", "Citizen")
							-- goto l3
                        end
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Fruit Bowl") or game.Players.LocalPlayer.Character:FindFirstChild("Fruit Bowl") then
                            repeat
                                vu192(CFrame.new(- 10920.125, 624.20275878906, - 10266.995117188))
                                wait()
                            until not _G.Settings.Main["Auto Ken-Haki V2"] or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(- 10920.125, 624.20275878906, - 10266.995117188)).Magnitude <= 10
                            wait(0.5)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenTalk2", "Start")
                            wait(1)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenTalk2", "Buy")
							-- goto l3
                        end
                        if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Defeat 50 Forest Pirates") then
							-- goto l32
                        end
						-- ::l33::
                        if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text ~= "Defeat  Captain Elephant (0/1)" then
							-- ::l67::
                            local v807, v808, v809 = pairs(game.Workspace:GetDescendants())
                            while true do
                                local v810
                                v809, v810 = v807(v808, v809)
                                if v809 == nil then
                                    break
                                end
                                if v810.Name == "Apple" or (v810.Name == "Banana" or v810.Name == "Pineapple") then
                                    v810.Handle.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 1, 10)
                                    wait()
                                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v810.Handle, 0)
                                    wait()
                                end
                            end
							-- goto l3
                        end
                        if not game:GetService("Workspace").Enemies:FindFirstChild("Captain Elephant [Lv. 1875] [Boss]") then
                            vu192(CFrame.new(- 13493.12890625, 318.89553833008, - 8373.7919921875))
                            wait()
                            if not _G.Settings.Main["Auto Ken-Haki V2"] or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(- 13493.12890625, 318.89553833008, - 8373.7919921875)).Magnitude <= 10 then
								-- goto l3
                            end
							-- goto l67
                        end
                        local v811, v812, v813 = pairs(game:GetService("Workspace").Enemies:GetChildren())
						-- goto l71
						-- ::l32::
                        if not game:GetService("Workspace").Enemies:FindFirstChild("Forest Pirate [Lv. 1825]") then
                            vu192(CFrame.new(- 13277.568359375, 370.34185791016, - 7821.1572265625))
                            wait()
                            if not _G.Settings.Main["Auto Ken-Haki V2"] or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(- 13277.568359375, 370.34185791016, - 7821.1572265625)).Magnitude <= 10 then
								-- goto l3
                            end
							-- goto l33
                        end
                        local v814, v815, v816 = pairs(game:GetService("Workspace").Enemies:GetChildren())
						-- goto l37
						-- ::l33::
						-- goto l37
						-- ::l3::
						-- ::l40::
                        wait()
                        StartMagnet = true
                        FastAttack = true
                        if _G.Settings.Configs["Auto Haki"] and not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
                        end
                        if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
                            wait()
                            EquipWeapon(_G.Settings.Configs["Select Weapon"])
                        end
                        PosMon = v817.HumanoidRootPart.CFrame
                        if not _G.Settings.Configs["Fast Attack"] then
                            game:GetService("VirtualUser"):CaptureController()
                            game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                        end
                        v817.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                        if _G.Settings.Configs["Show Hitbox"] then
                            v817.HumanoidRootPart.Transparency = tonumber(_G.Hitbox_LocalTransparency)
                        else
                            v817.HumanoidRootPart.Transparency = 1
                        end
                        v817.Humanoid.JumpPower = 0
                        v817.Humanoid.WalkSpeed = 0
                        v817.HumanoidRootPart.CanCollide = false
                        v817.Humanoid:ChangeState(11)
                        vu192(v817.HumanoidRootPart.CFrame * CFrame.new(0, _G.Settings.Configs["Distance Auto Farm"], 0))
                        if _G.Settings.Main["Auto Ken-Haki V2"] and v817.Humanoid.Health > 0 then
							-- goto l40
                        end
                        StartMagnet = false
                        FastAttack = false
						-- ::l37::
                        local v817
                        v816, v817 = v814(v815, v816)
                        if v816 == nil then
							-- goto l3
                        end
                        if v817.Name ~= "Forest Pirate [Lv. 1825]" then
							-- goto l33
                        else
							-- goto l3
                        end
						-- ::l2::
						-- goto l71
						-- ::l35::
						-- goto l66
						-- ::l66::
						-- goto l74
						-- ::l69::
						-- goto l2
						-- ::l74::
                        wait()
                        StartMagnet = true
                        FastAttack = true
                        if _G.Settings.Configs["Auto Haki"] and not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
                        end
                        if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
                            wait()
                            EquipWeapon(_G.Settings.Configs["Select Weapon"])
                        end
                        PosMon = v818.HumanoidRootPart.CFrame
                        if not _G.Settings.Configs["Fast Attack"] then
                            game:GetService("VirtualUser"):CaptureController()
                            game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                        end
                        v818.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                        if _G.Settings.Configs["Show Hitbox"] then
                            v818.HumanoidRootPart.Transparency = tonumber(_G.Hitbox_LocalTransparency)
                        else
                            v818.HumanoidRootPart.Transparency = 1
                        end
                        v818.Humanoid.JumpPower = 0
                        v818.Humanoid.WalkSpeed = 0
                        v818.HumanoidRootPart.CanCollide = false
                        v818.Humanoid:ChangeState(11)
                        vu192(v818.HumanoidRootPart.CFrame * CFrame.new(0, _G.Settings.Configs["Distance Auto Farm"], 0))
                        if _G.Settings.Main["Auto Ken-Haki V2"] and v818.Humanoid.Health > 0 then
							-- goto l74
                        end
                        StartMagnet = false
                        FastAttack = false
						-- ::l71::
                        local v818
                        v813, v818 = v811(v812, v813)
                        if v813 == nil then
							-- goto l3
                        end
                        if v818.Name ~= "Captain Elephant [Lv. 1875] [Boss]" then
							-- goto l69
                        else
							-- goto l35
                        end
                    end)
                end
            end)
            v573:Toggle("Auto Cavander", _G.Settings.Main["Auto Cavander"], function(p819)
				-- upvalues: (ref) vu192
                _G.Settings.Main["Auto Cavander"] = p819
                if p819 == false then
                    vu192(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
                end
                getgenv().SaveSetting()
            end)
            task.spawn(function()
				-- upvalues: (ref) vu192
                while wait() do
                    pcall(function()
						-- upvalues: (ref) vu192
						-- block 41
                        if not _G.Settings.Main["Auto Cavander"] then
							-- ::l3::
                            return
                        end
                        if not game:GetService("Workspace").Enemies:FindFirstChild("Beautiful Pirate [Lv. 1950] [Boss]") then
                            vu192(CFrame.new(5283.609375, 22.56223487854, - 110.78285217285))
							-- goto l3
                        end
                        local v820, v821, v822 = pairs(game:GetService("Workspace").Enemies:GetChildren())
						-- goto l7
						-- ::l18::
                        wait()
                        StartMagnet = true
                        FastAttack = true
                        if _G.Settings.Configs["Auto Haki"] and not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
                        end
                        if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
                            wait()
                            EquipWeapon(_G.Settings.Configs["Select Weapon"])
                        end
                        PosMon = v823.HumanoidRootPart.CFrame
                        if not _G.Settings.Configs["Fast Attack"] then
                            game:GetService("VirtualUser"):CaptureController()
                            game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                        end
                        v823.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                        if _G.Settings.Configs["Show Hitbox"] then
                            v823.HumanoidRootPart.Transparency = tonumber(_G.Hitbox_LocalTransparency)
                        else
                            v823.HumanoidRootPart.Transparency = 1
                        end
                        v823.Humanoid.JumpPower = 0
                        v823.Humanoid.WalkSpeed = 0
                        v823.HumanoidRootPart.CanCollide = false
                        v823.Humanoid:ChangeState(11)
                        vu192(v823.HumanoidRootPart.CFrame * CFrame.new(0, _G.Settings.Configs["Distance Auto Farm"], 0))
                        if _G.Settings.Main["Auto Cavander"] and v823.Humanoid.Health > 0 then
							-- goto l18
                        end
                        StartMagnet = false
                        FastAttack = false
						-- ::l7::
                        local v823
                        v822, v823 = v820(v821, v822)
                        if v822 == nil then
							-- goto l3
                        end
                        if v823.Name ~= "Beautiful Pirate [Lv. 1950] [Boss]" or (v823.Humanoid.Health <= 0 or not (v823:IsA("Model") and (v823:FindFirstChild("Humanoid") and v823:FindFirstChild("HumanoidRootPart")))) then
							-- goto l7
                        else
							-- goto l18
                        end
                    end)
                end
            end)
            v573:Toggle("Auto Yama Sword", _G.Settings.Main["Auto Yama Sword"], function(p824)
                _G.Settings.Main["Auto Yama Sword"] = p824
                getgenv().SaveSetting()
            end)
            task.spawn(function()
                while wait() do
                    if _G.Settings.Main["Auto Yama Sword"] and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter", "Progress") >= 30 then
                        repeat
                            wait()
                            fireclickdetector(game:GetService("Workspace").Map.Waterfall.SealedKatana.Handle.ClickDetector)
                        until game.Players.LocalPlayer.Backpack:FindFirstChild("Yama") or not AutoYama
                    end
                end
            end)
            v573:Toggle("Auto Tushita Sword", _G.Settings.Main["Auto Tushita Sword"], function(p825)
				-- upvalues: (ref) vu192
                _G.Settings.Main["Auto Tushita Sword"] = p825
                if p825 == false then
                    vu192(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
                end
                getgenv().SaveSetting()
            end)
            task.spawn(function()
				-- upvalues: (ref) vu192
				-- ::l0::
                while true do
                    repeat
                        if not wait() then
                            return
                        end
                    until _G.Settings.Main["Auto Tushita Sword"]
                    if game:GetService("Workspace").Enemies:FindFirstChild("Longma [Lv. 2000] [Boss]") then
                        break
                    end
                    vu192(CFrame.new(- 10238.875976563, 389.7912902832, - 9549.7939453125))
                end
                local v826, v827, v828 = pairs(game:GetService("Workspace").Enemies:GetChildren())
				-- goto l9
				-- ::l26::
                wait()
                StartMagnet = true
                FastAttack = true
                if _G.Settings.Configs["Auto Haki"] and not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
                end
                if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
                    wait()
                    EquipWeapon(_G.Settings.Configs["Select Weapon"])
                end
                PosMon = v829.HumanoidRootPart.CFrame
                if not _G.Settings.Configs["Fast Attack"] then
                    game:GetService("VirtualUser"):CaptureController()
                    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                end
                v829.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                if _G.Settings.Configs["Show Hitbox"] then
                    v829.HumanoidRootPart.Transparency = tonumber(_G.Hitbox_LocalTransparency)
                else
                    v829.HumanoidRootPart.Transparency = 1
                end
                v829.Humanoid.JumpPower = 0
                v829.Humanoid.WalkSpeed = 0
                v829.HumanoidRootPart.CanCollide = false
                v829.Humanoid:ChangeState(11)
                vu192(v829.HumanoidRootPart.CFrame * CFrame.new(0, _G.Settings.Configs["Distance Auto Farm"], 0))
                if _G.Settings.Main["Auto Tushita Sword"] and (v829.Parent and v829.Humanoid.Health > 0) then
					-- goto l26
                end
                StartMagnet = false
                FastAttack = false
				-- ::l9::
                local v829
                v828, v829 = v826(v827, v828)
                if v828 == nil then
					-- goto l0
                end
                if v829.Name == ("Longma [Lv. 2000] [Boss]" or v829.Name == "Longma [Lv. 2000] [Boss]") and (v829.Humanoid.Health > 0 and (v829:IsA("Model") and (v829:FindFirstChild("Humanoid") and v829:FindFirstChild("HumanoidRootPart")))) then
					-- goto l26
                else
					-- goto l9
                end
            end)
            v573:Toggle("Auto Serpent Bow", _G.Settings.Main["Auto Serpent Bow"], function(p830)
				-- upvalues: (ref) vu192
                _G.Settings.Main["Auto Serpent Bow"] = p830
                if p830 == false then
                    vu192(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
                end
                getgenv().SaveSetting()
            end)
            task.spawn(function()
				-- upvalues: (ref) vu192
				-- ::l0::
                while true do
                    repeat
                        if not wait() then
                            return
                        end
                    until _G.Settings.Main["Auto Serpent Bow"]
                    if game:GetService("Workspace").Enemies:FindFirstChild("Island Empress [Lv. 1675] [Boss]") then
                        break
                    end
                    vu192(CFrame.new(5543.86328125, 668.97399902344, 199.0341796875))
                end
                local v831, v832, v833 = pairs(game:GetService("Workspace").Enemies:GetChildren())
				-- goto l9
				-- ::l26::
                wait()
                StartMagnet = true
                FastAttack = true
                if _G.Settings.Configs["Auto Haki"] and not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
                end
                if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
                    wait()
                    EquipWeapon(_G.Settings.Configs["Select Weapon"])
                end
                PosMon = v834.HumanoidRootPart.CFrame
                if not _G.Settings.Configs["Fast Attack"] then
                    game:GetService("VirtualUser"):CaptureController()
                    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                end
                v834.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                if _G.Settings.Configs["Show Hitbox"] then
                    v834.HumanoidRootPart.Transparency = tonumber(_G.Hitbox_LocalTransparency)
                else
                    v834.HumanoidRootPart.Transparency = 1
                end
                v834.Humanoid.JumpPower = 0
                v834.Humanoid.WalkSpeed = 0
                v834.HumanoidRootPart.CanCollide = false
                v834.Humanoid:ChangeState(11)
                vu192(v834.HumanoidRootPart.CFrame * CFrame.new(0, _G.Settings.Configs["Distance Auto Farm"], 0))
                if _G.Settings.Main["Auto Serpent Bow"] and (v834.Parent and v834.Humanoid.Health > 0) then
					-- goto l26
                end
                StartMagnet = false
                FastAttack = false
				-- ::l9::
                local v834
                v833, v834 = v831(v832, v833)
                if v833 == nil then
					-- goto l0
                end
                if v834.Name == ("Island Empress [Lv. 1675] [Boss]" or v834.Name == "Island Empress [Lv. 1675] [Boss]") and (v834.Humanoid.Health > 0 and (v834:IsA("Model") and (v834:FindFirstChild("Humanoid") and v834:FindFirstChild("HumanoidRootPart")))) then
					-- goto l26
                else
					-- goto l9
                end
            end)
            v573:Toggle("Auto Dark Dagger", _G.Settings.Main["Auto Dark Dagger"], function(p835)
				-- upvalues: (ref) vu192
                _G.Settings.Main["Auto Dark Dagger"] = p835
                if p835 == false then
                    vu192(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
                end
                getgenv().SaveSetting()
            end)
            task.spawn(function()
				-- upvalues: (ref) vu192
                while wait() do
                    pcall(function()
						-- upvalues: (ref) vu192
						-- block 49
                        if not _G.Settings.Main["Auto Dark Dagger"] then
							-- ::l3::
                            return
                        end
                        if not game:GetService("Workspace").Enemies:FindFirstChild("rip_indra True Form [Lv. 5000] [Raid Boss]") then
                            vu192(CFrame.new(- 5344.822265625, 423.98541259766, - 2725.0930175781))
							-- goto l3
                        end
                        local v836, v837, v838 = pairs(game:GetService("Workspace").Enemies:GetChildren())
						-- goto l7
						-- ::l24::
                        wait()
                        StartMagnet = true
                        FastAttack = true
                        if _G.Settings.Configs["Auto Haki"] and not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
                        end
                        if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
                            wait()
                            EquipWeapon(_G.Settings.Configs["Select Weapon"])
                        end
                        PosMon = v839.HumanoidRootPart.CFrame
                        if not _G.Settings.Configs["Fast Attack"] then
                            game:GetService("VirtualUser"):CaptureController()
                            game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                        end
                        v839.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                        if _G.Settings.Configs["Show Hitbox"] then
                            v839.HumanoidRootPart.Transparency = tonumber(_G.Hitbox_LocalTransparency)
                        else
                            v839.HumanoidRootPart.Transparency = 1
                        end
                        v839.Humanoid.JumpPower = 0
                        v839.Humanoid.WalkSpeed = 0
                        v839.HumanoidRootPart.CanCollide = false
                        v839.Humanoid:ChangeState(11)
                        vu192(v839.HumanoidRootPart.CFrame * CFrame.new(0, _G.Settings.Configs["Distance Auto Farm"], 0))
                        if _G.Settings.Main["Auto Dark Dagger"] and (v839.Parent and v839.Humanoid.Health > 0) then
							-- goto l24
                        end
                        StartMagnet = false
                        FastAttack = false
						-- ::l7::
                        local v839
                        v838, v839 = v836(v837, v838)
                        if v838 == nil then
							-- goto l3
                        end
                        if v839.Name == ("rip_indra True Form [Lv. 5000] [Raid Boss]" or v839.Name == "rip_indra True Form [Lv. 5000] [Raid Boss]") and (v839.Humanoid.Health > 0 and (v839:IsA("Model") and (v839:FindFirstChild("Humanoid") and v839:FindFirstChild("HumanoidRootPart")))) then
							-- goto l24
                        else
							-- goto l7
                        end
                    end)
                end
            end)
            LPH_NO_VIRTUALIZE(function()
                task.spawn(function()
                    while wait() do
                        pcall(function()
                            if string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) ~= 88 then
                                if string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) ~= 87 then
                                    if string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 86 then
                                        KillMob = tonumber(string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"), 41, 41)) - 500
                                    end
                                else
                                    KillMob = tonumber(string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"), 40, 41)) - 500
                                end
                            else
                                KillMob = tonumber(string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"), 39, 41)) - 500
                            end
                        end)
                    end
                end)
            end)()
            v573:Toggle("Auto Cake Prince", _G.Settings.Main["Auto Cake Prince"], function(p840)
				-- upvalues: (ref) vu192
                _G.Settings.Main["Auto Cake Prince"] = p840
                if p840 == false then
                    vu192(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
                end
                getgenv().SaveSetting()
            end)
            task.spawn(function()
				-- upvalues: (ref) vu192
                while wait() do
                    if _G.Settings.Main["Auto Cake Prince"] then
                        pcall(function()
							-- upvalues: (ref) vu192
							-- block 121
                            if not (game.ReplicatedStorage:FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") or game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]")) then
								-- goto l5
                            end
                            if not game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") then
                                if game:GetService("Workspace").Map.CakeLoaf.BigMirror.Other.Transparency == 0 and (CFrame.new(- 1990.672607421875, 4532.99951171875, - 14973.6748046875).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude >= 2000 then
                                    FastAttack = false
                                    Questtween = vu192(CFrame.new(- 2151.82153, 149.315704, - 12404.9053))
                                    if (CFrame.new(- 2151.82153, 149.315704, - 12404.9053).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                                        if Questtween then
                                            Questtween:Stop()
                                        end
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(- 2151.82153, 149.315704, - 12404.9053)
                                        wait(0.1)
                                    end
                                end
								-- goto l53
                            end
                            local v841, v842, v843 = pairs(game.Workspace.Enemies:GetChildren())
							-- ::l9::
                            while true do
                                local v844
                                v843, v844 = v841(v842, v843)
                                if v843 == nil then
									-- goto l53
                                end
                                if _G.Settings.Main["Auto Cake Prince"] and (v844.Name == "Cake Prince [Lv. 2300] [Raid Boss]" and (v844:FindFirstChild("HumanoidRootPart") and (v844:FindFirstChild("Humanoid") and v844.Humanoid.Health > 0))) then
									-- goto l20
                                end
                            end
							-- ::l5::
                            if not (game:GetService("Workspace").Enemies:FindFirstChild("Cookie Crafter [Lv. 2200]") or (game:GetService("Workspace").Enemies:FindFirstChild("Cake Guard [Lv. 2225]") or (game:GetService("Workspace").Enemies:FindFirstChild("Baking Staff [Lv. 2250]") or game:GetService("Workspace").Enemies:FindFirstChild("Head Baker [Lv. 2275]")))) then
                                vu192(CFrame.new(- 2077, 252, - 12373))
								-- ::l53::
                                return
                            end
                            local v845, v846, v847 = pairs(game.Workspace.Enemies:GetChildren())
							-- goto l72
							-- ::l20::
                            if true then
                                wait()
                                if (v844.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                                    if (v844.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                                        if Farmtween then
                                            Farmtween:Stop()
                                        end
                                        FastAttack = true
                                        if _G.Settings.Configs["Auto Haki"] and not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
                                        end
                                        if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
                                            wait()
                                            EquipWeapon(_G.Settings.Configs["Select Weapon"])
                                        end
                                        PosMon = v844.HumanoidRootPart.CFrame
                                        if not _G.Settings.Configs["Fast Attack"] then
                                            game:GetService("VirtualUser"):CaptureController()
                                            game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                        end
                                        v844.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                        if _G.Settings.Configs["Show Hitbox"] then
                                            v844.HumanoidRootPart.Transparency = tonumber(_G.Hitbox_LocalTransparency)
                                        else
                                            v844.HumanoidRootPart.Transparency = 1
                                        end
                                        v844.Humanoid.JumpPower = 0
                                        v844.Humanoid.WalkSpeed = 0
                                        v844.HumanoidRootPart.CanCollide = false
                                        v844.Humanoid:ChangeState(11)
                                        vu192(v844.HumanoidRootPart.CFrame * CFrame.new(0, _G.Settings.Configs["Distance Auto Farm"], 0))
                                    end
                                else
                                    Farmtween = vu192(v844.HumanoidRootPart.CFrame)
                                end
                            end
                            if _G.Settings.Main["Auto Cake Prince"] and (v844.Parent and v844.Humanoid.Health > 0) then
								-- goto l20
                            else
								-- goto l47
                            end
							-- ::l47::
                            FastAttack = false
							-- goto l9
							-- ::l87::
                            if true then
                                wait()
                                if (v848.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                                    if (v848.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                                        if Farmtween then
                                            Farmtween:Stop()
                                        end
                                        FastAttack = true
                                        StartMagnet = true
                                        if _G.Settings.Configs["Auto Haki"] and not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
                                        end
                                        if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
                                            wait()
                                            EquipWeapon(_G.Settings.Configs["Select Weapon"])
                                        end
                                        PosMon = v848.HumanoidRootPart.CFrame
                                        if not _G.Settings.Configs["Fast Attack"] then
                                            game:GetService("VirtualUser"):CaptureController()
                                            game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                        end
                                        v848.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                        if _G.Settings.Configs["Show Hitbox"] then
                                            v848.HumanoidRootPart.Transparency = tonumber(_G.Hitbox_LocalTransparency)
                                        else
                                            v848.HumanoidRootPart.Transparency = 1
                                        end
                                        v848.Humanoid.JumpPower = 0
                                        v848.Humanoid.WalkSpeed = 0
                                        v848.HumanoidRootPart.CanCollide = false
                                        v848.Humanoid:ChangeState(11)
                                        vu192(v848.HumanoidRootPart.CFrame * CFrame.new(0, _G.Settings.Configs["Distance Auto Farm"], 0))
                                    end
                                else
                                    Farmtween = vu192(v848.HumanoidRootPart.CFrame)
                                end
                            end
                            if _G.Settings.Main["Auto Cake Prince"] and (v848.Parent and v848.Humanoid.Health > 0) then
								-- goto l87
                            end
                            StartMagnet = false
                            FastAttack = false
							-- ::l72::
                            local v848
                            v847, v848 = v845(v846, v847)
                            if v847 == nil then
								-- goto l53
                            end
                            if (v848.Name == "Cookie Crafter [Lv. 2200]" or (v848.Name == "Cake Guard [Lv. 2225]" or (v848.Name == "Baking Staff [Lv. 2250]" or v848.Name == "Head Baker [Lv. 2275]"))) and (v848:FindFirstChild("HumanoidRootPart") and (v848:FindFirstChild("Humanoid") and v848.Humanoid.Health > 0)) then
								-- goto l87
                            else
								-- goto l72
                            end
                        end)
                    end
                end
            end)
            DoughMob = {
                "Cookie Crafter [Lv. 2200]",
                "Cake Guard [Lv. 2225]",
                "Baking Staff [Lv. 2250]"
            }
            v573:Toggle("Unlock Dough V2", _G.Settings.Main["Auto Dough V2"], function(p849)
				-- upvalues: (ref) vu192
                _G.Settings.Main["Auto Dough V2"] = p849
                if p849 == false then
                    vu192(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
                end
                getgenv().SaveSetting()
            end)
            task.spawn(function()
				-- upvalues: (ref) vu192
				-- ::l0::
                while true do
                    if not (wait() and _G.Settings.Main["Auto Dough V2"]) then
                        return
                    end
                    if game:GetService("Workspace").Map.CakeLoaf:FindFirstChild("RedDoor") then
                        break
                    end
                    if game.Players.LocalPlayer.Character:FindFirstChild("Red Key") or game.Players.LocalPlayer.Backpack:FindFirstChild("Red Key") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                            "CakeScientist",
                            "Check"
                        }))
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                            "RaidsNpc",
                            "Check"
                        }))
                    end
                end
				-- ::l8::
                if not game:GetService("Workspace").Map.CakeLoaf:FindFirstChild("RedDoor") then
					-- goto l15
                end
                if not (game.Players.LocalPlayer.Character:FindFirstChild("Red Key") or game.Players.LocalPlayer.Backpack:FindFirstChild("Red Key")) then
					-- goto l20
                end
                RedDorTween = toTargetP(CFrame.new(- 2681.97998, 64.3921585, - 12853.7363, 0.149007782, - 1.87902192e-8, 0.98883605, 3.60619588e-8, 1, 1.35681812e-8, - 0.98883605, 3.36376011e-8, 0.149007782))
                if (CFrame.new(- 2681.97998, 64.3921585, - 12853.7363, 0.149007782, - 1.87902192e-8, 0.98883605, 3.60619588e-8, 1, 1.35681812e-8, - 0.98883605, 3.36376011e-8, 0.149007782).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 5 then
                    if RedDorTween then
                        RedDorTween:Stop()
                    end
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(- 2681.97998, 64.3921585, - 12853.7363, 0.149007782, - 1.87902192e-8, 0.98883605, 3.60619588e-8, 1, 1.35681812e-8, - 0.98883605, 3.36376011e-8, 0.149007782)
                    wait(0.5)
                    EquipWeapon("Red Key")
                    wait(0.5)
                end
				-- goto l0
				-- ::l20::
                if game.Workspace:FindFirstChild("Enemies"):FindFirstChild("Dough King [Lv. 2300] [Raid Boss]") or game:GetService("ReplicatedStorage"):FindFirstChild("Dough King [Lv. 2300] [Raid Boss]") then
					-- goto l28
                end
                if not (game.Players.LocalPlayer.Character:FindFirstChild("Sweet Chalice") or game.Players.LocalPlayer.Backpack:FindFirstChild("Sweet Chalice")) then
					-- goto l76
                end
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner", true)
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")
                if not (game:GetService("Workspace").Enemies:FindFirstChild("Cookie Crafter [Lv. 2200]") or (game:GetService("Workspace").Enemies:FindFirstChild("Cake Guard [Lv. 2225]") or (game:GetService("Workspace").Enemies:FindFirstChild("Baking Staff [Lv. 2250]") or game:GetService("Workspace").Enemies:FindFirstChild("Head Baker [Lv. 2275]")))) then
					-- goto l85
                end
                local v850, v851, v852 = pairs(game.Workspace.Enemies:GetChildren())
				-- goto l86
				-- ::l85::
                StartMagnet = false
                FastAttack = false
                Questtween = vu192(CFrame.new(- 2077, 252, - 12373))
                if (CFrame.new(- 2077, 252, - 12373).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                    if Questtween then
                        Questtween:Stop()
                    end
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(- 2077, 252, - 12373)
                end
				-- goto l0
				-- ::l76::
                if (game.Players.LocalPlayer.Backpack:FindFirstChild("God\'s Chalice") or game.Players.LocalPlayer.Character:FindFirstChild("God\'s Chalice")) and GetMaterial("Conjured Cocoa") >= 10 then
					-- goto l132
                end
                if not game.Players.LocalPlayer.Backpack:FindFirstChild("God\'s Chalice") and (not game.Players.LocalPlayer.Character:FindFirstChild("God\'s Chalice") and (game.Workspace.Enemies:FindFirstChild("Deandre [Lv. 1750]") or (game.Workspace.Enemies:FindFirstChild("Urban [Lv. 1750]") or (game.Workspace.Enemies:FindFirstChild("Diablo [Lv. 1750]") or (game.ReplicatedStorage:FindFirstChild("Deandre [Lv. 1750]") or (game.ReplicatedStorage:FindFirstChild("Urban [Lv. 1750]") or game.ReplicatedStorage:FindFirstChild("Diablo [Lv. 1750]"))))))) then
					-- goto l140
                end
                if not (game:GetService("Workspace").Enemies:FindFirstChild("Candy Rebel [Lv. 2375]") or (game:GetService("Workspace").Enemies:FindFirstChild("Sweet Thief [Lv. 2350]") or (game:GetService("Workspace").Enemies:FindFirstChild("Chocolate Bar Battler [Lv. 2325]") or game:GetService("Workspace").Enemies:FindFirstChild("Cocoa Warrior [Lv. 2300]")))) then
					-- goto l276
                end
                local v853, v854, v855 = pairs(game.Workspace.Enemies:GetChildren())
				-- goto l277
				-- ::l140::
                if game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible ~= true then
					-- goto l152
                end
                if not (string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Diablo") or (string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Urban") or string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Deandre"))) then
					-- goto l159
                end
                local v856, v857, v858 = pairs(game:GetService("ReplicatedStorage"):GetChildren())
                while true do
                    local v859
                    v858, v859 = v856(v857, v858)
                    if v858 == nil then
                        break
                    end
                    if string.find(v859.Name, "Diablo") then
                        DoughTween = vu192(v859.HumanoidRootPart.CFrame)
                        if (v859.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 150 then
                            if DoughTween then
                                DoughTween:Stop()
                            end
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v859.HumanoidRootPart.CFrame
                        end
                    end
                    if string.find(v859.Name, "Urban") then
                        DoughTween = vu192(v859.HumanoidRootPart.CFrame)
                        if (v859.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 150 then
                            if DoughTween then
                                DoughTween:Stop()
                            end
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v859.HumanoidRootPart.CFrame
                        end
                    end
                    if string.find(v859.Name, "Deandre") then
                        DoughTween = vu192(v859.HumanoidRootPart.CFrame)
                        if (v859.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 150 then
                            if DoughTween then
                                DoughTween:Stop()
                            end
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v859.HumanoidRootPart.CFrame
                        end
                    end
                end
                local v860, v861, v862 = pairs(game.Workspace.Enemies:GetChildren())
				-- goto l187
				-- ::l152::
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter")
				-- goto l0
				-- ::l187::
				-- ::l160::
				-- ::l48::
				-- ::l106::
				-- ::l298::
				-- ::l254::
				-- goto l277
				-- ::l159::
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter")
				-- goto l0
				-- ::l132::
                game.ReplicatedStorage.Remotes.CommF_:InvokeServer("SweetChaliceNpc")
                wait(0.2)
				-- goto l0
				-- ::l276::
                MagnetFarmCoco = false
                FastAttack = false
                Questtween = vu192(CFrame.new(620.6344604492188, 78.93644714355469, - 12581.369140625))
                if (CFrame.new(620.6344604492188, 78.93644714355469, - 12581.369140625).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 150 then
                    if Questtween then
                        Questtween:Stop()
                    end
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(620.6344604492188, 78.93644714355469, - 12581.369140625)
                end
				-- goto l0
				-- ::l28::
                if not game:GetService("Workspace").Enemies:FindFirstChild("Dough King [Lv. 2300] [Raid Boss]") then
					-- goto l33
                end
                local v863, v864, v865 = pairs(game.Workspace.Enemies:GetChildren())
				-- goto l34
				-- ::l33::
                if game:GetService("Workspace").Map.CakeLoaf.BigMirror.Other.Transparency == 0 then
                    FastAttack = false
                    Questtween = toTargetP(CFrame.new(- 2151.82153, 149.315704, - 12404.9053))
                    if (CFrame.new(- 2151.82153, 149.315704, - 12404.9053).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                        if Questtween then
                            Questtween:Stop()
                        end
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(- 2151.82153, 149.315704, - 12404.9053)
                        wait(1)
                    end
                end
				-- goto l0
				-- ::l34::
				-- ::l227::
				-- ::l202::
				-- ::l211::
				-- ::l191::
				-- ::l107::
				-- ::l229::
				-- ::l103::
                if true then
                    wait()
                    if (v866.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                        if (v866.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                            if Farmtween then
                                Farmtween:Stop()
                            end
                            FastAttack = true
                            PosMon = v866.HumanoidRootPart.CFrame
                            StartMagnet = true
                            EquipWeapon(_G.Settings.Configs["Select Weapon"])
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v866.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner", true)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")
                        end
                    else
                        Farmtween = vu192(v866.HumanoidRootPart.CFrame)
                    end
                end
                if _G.Settings.Main["Auto Dough V2"] and (v866.Parent and v866.Humanoid.Health > 0) then
					-- goto l103
                end
                FastAttack = false
                StartMagnet = false
				-- ::l86::
                local v866
                v852, v866 = v850(v851, v852)
                if v852 == nil then
					-- goto l0
                end
                if _G.Settings.Main["Auto Dough V2"] and (v866.Name == "Cookie Crafter [Lv. 2200]" or (v866.Name == "Cake Guard [Lv. 2225]" or (v866.Name == "Baking Staff [Lv. 2250]" or v866.Name == "Head Baker [Lv. 2275]"))) and (v866:FindFirstChild("HumanoidRootPart") and (v866:FindFirstChild("Humanoid") and v866.Humanoid.Health > 0)) then
					-- goto l300
                else
					-- goto l79
                end
				-- ::l300::
				-- ::l253::
				-- ::l256::
				-- goto l34
				-- ::l79::
				-- ::l252::
				-- ::l231::
				-- ::l228::
				-- ::l49::
				-- ::l205::
				-- ::l199::
				-- ::l32::
				-- ::l115::
				-- ::l74::
				-- ::l30::
				-- ::l18::
				-- ::l86::
				-- ::l250::
                if true then
                    wait()
                    if (v867.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                        if (v867.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                            if Farmtween then
                                Farmtween:Stop()
                            end
                            EquipWeapon(_G.Settings.Configs["Select Weapon"])
                            FastAttack = true
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v867.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)
                        end
                    else
                        Farmtween = vu192(v867.HumanoidRootPart.CFrame)
                    end
                end
                if _G.Settings.Main["Auto Dough V2"] and (v867.Parent and v867.Humanoid.Health > 0) then
					-- goto l250
                end
                FastAttack = false
				-- ::l187::
                local v867
                v862, v867 = v860(v861, v862)
                if v862 == nil then
					-- goto l0
                end
                if _G.Settings.Main["Auto Dough V2"] and (string.find(v867.Name, "Diablo") and (v867:FindFirstChild("Humanoid") and (v867:FindFirstChild("HumanoidRootPart") and v867.Humanoid.Health > 0))) then
                    while true do
                        if true then
                            wait()
                            if (v867.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                                if (v867.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                                    if Farmtween then
                                        Farmtween:Stop()
                                    end
                                    EquipWeapon(_G.Settings.Configs["Select Weapon"])
                                    FastAttack = true
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v867.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)
                                end
                            else
                                Farmtween = vu192(v867.HumanoidRootPart.CFrame)
                            end
                        end
                        if not _G.Settings.Main["Auto Dough V2"] or (not v867.Parent or v867.Humanoid.Health <= 0) then
                            FastAttack = false
							-- goto l191
                        end
                    end
                end
				-- ::l191::
                if _G.Settings.Main["Auto Dough V2"] and (string.find(v867.Name, "Urban") and (v867:FindFirstChild("Humanoid") and (v867:FindFirstChild("HumanoidRootPart") and v867.Humanoid.Health > 0))) then
                    while true do
                        if true then
                            wait()
                            if (v867.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                                if (v867.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                                    if Farmtween then
                                        Farmtween:Stop()
                                    end
                                    EquipWeapon(_G.Settings.Configs["Select Weapon"])
                                    FastAttack = true
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v867.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)
                                end
                            else
                                Farmtween = vu192(v867.HumanoidRootPart.CFrame)
                            end
                        end
                        if not _G.Settings.Main["Auto Dough V2"] or (not v867.Parent or v867.Humanoid.Health <= 0) then
                            FastAttack = false
							-- goto l217
                        end
                    end
                end
				-- ::l217::
                if _G.Settings.Main["Auto Dough V2"] and (string.find(v867.Name, "Deandre") and (v867:FindFirstChild("Humanoid") and (v867:FindFirstChild("HumanoidRootPart") and v867.Humanoid.Health > 0))) then
					-- goto l47
                else
					-- goto l155
                end
				-- ::l155::
				-- ::l151::
				-- ::l306::
				-- ::l262::
				-- ::l270::
				-- ::l130::
				-- ::l135::
				-- goto l187
				-- ::l47::
				-- ::l105::
				-- ::l297::
				-- ::l296::
				-- goto l86
				-- ::l217::
				-- ::l14::
				-- ::l45::
                if true then
                    wait()
                    if (v868.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                        if (v868.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                            if Farmtween then
                                Farmtween:Stop()
                            end
                            EquipWeapon(_G.Settings.Configs["Select Weapon"])
                            v868.HumanoidRootPart.Size = Vector3.new(55, 55, 55)
                            FastAttack = true
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v868.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)
                        end
                    else
                        Farmtween = vu192(v868.HumanoidRootPart.CFrame)
                    end
                end
                if _G.Settings.Main["Auto Dough V2"] and (v868.Parent and v868.Humanoid.Health > 0) and not game:GetService("ReplicatedStorage"):FindFirstChild("Dough King [Lv. 2300] [Raid Boss]") then
					-- goto l45
                else
					-- goto l57
                end
				-- ::l57::
                FastAttack = false
				-- goto l34
				-- ::l15::
                print("Error Whyyy")
				-- goto l0
				-- ::l3::
				-- goto l186
				-- ::l5::
				-- goto l51
				-- ::l7::
				-- goto l217
				-- ::l35::
                if _G.Settings.Main["Auto Dough V2"] and (v868.Name == "Dough King [Lv. 2300] [Raid Boss]" and (v868:FindFirstChild("HumanoidRootPart") and (v868:FindFirstChild("Humanoid") and v868.Humanoid.Health > 0))) then
					-- goto l201
                end
				-- ::l34::
                local v868
                v865, v868 = v863(v864, v865)
                if v865 ~= nil then
					-- goto l35
                end
				-- goto l0
				-- ::l51::
				-- goto l109
				-- ::l87::
				-- goto l294
				-- ::l109::
				-- goto l87
				-- ::l161::
				-- goto l3
				-- ::l163::
				-- goto l161
				-- ::l164::
				-- goto l188
				-- ::l186::
				-- goto l5
				-- ::l188::
				-- goto l187
				-- ::l201::
				-- goto l203
				-- ::l203::
				-- goto l237
				-- ::l225::
				-- goto l7
				-- ::l237::
				-- goto l225
				-- ::l294::
                if true then
                    wait()
                    if (v869.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 150 then
                        if (v869.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 150 then
                            if Farmtween then
                                Farmtween:Stop()
                            end
                            FastAttack = true
                            PosFarmCoco = v869.HumanoidRootPart.CFrame
                            EquipWeapon(_G.Settings.Configs["Select Weapon"])
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v869.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)
                            MagnetFarmCoco = true
                        end
                    else
                        Farmtween = vu192(v869.HumanoidRootPart.CFrame)
                        FastAttack = false
                    end
                end
                if _G.Settings.Main["Auto Dough V2"] and (v869.Parent and v869.Humanoid.Health > 0) then
					-- goto l294
                end
                FastAttack = false
                MagnetFarmCoco = false
				-- ::l277::
                local v869
                v855, v869 = v853(v854, v855)
                if v855 == nil then
					-- goto l0
                end
                if _G.Settings.Main["Auto Dough V2"] and (v869.Name == "Candy Rebel [Lv. 2375]" or (v869.Name == "Sweet Thief [Lv. 2350]" or (v869.Name == "Chocolate Bar Battler [Lv. 2325]" or v869.Name == "Cocoa Warrior [Lv. 2300]"))) and (v869:FindFirstChild("HumanoidRootPart") and (v869:FindFirstChild("Humanoid") and v869.Humanoid.Health > 0)) then
					-- goto l163
                else
					-- goto l164
                end
            end)
            v573:Label("Farm Materail")
            v573:Dropdown("Select Material", v272, callback, function(p870)
                SelectModeMaterial = p870
            end)
            v573:Toggle("Auto Farm Material", AutoFarmMaterial, function(p871)
				-- upvalues: (ref) vu192
                AutoFarmMaterial = p871
                if p871 == false then
                    vu192(game.Players.LocalPlayer.Character.HumanoidRootPart.Position, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
                end
            end)
            v573:Label("Soul Guitar")
            LPH_JIT_MAX(function()
                task.spawn(function()
                    while wait() do
                        if StartSoulGuitarMagnt then
                            pcall(function()
                                local v872, v873, v874 = pairs(game.Workspace.Enemies:GetChildren())
                                while true do
                                    local v875
                                    v874, v875 = v872(v873, v874)
                                    if v874 == nil then
                                        break
                                    end
                                    if v875.Name == "Living Zombie [Lv. 2000]" then
                                        v875.HumanoidRootPart.CFrame = CFrame.new(- 10138.3974609375, 138.6524658203125, 5902.89208984375)
                                        v875.Head.CanCollide = false
                                        v875.Humanoid.Sit = false
                                        v875.HumanoidRootPart.CanCollide = false
                                        v875.Humanoid.JumpPower = 0
                                        v875.Humanoid.WalkSpeed = 0
                                        if v875.Humanoid:FindFirstChild("Animator") then
                                            v875.Humanoid:FindFirstChild("Animator"):Destroy()
                                        end
                                        sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                                    end
                                end
                            end)
                        end
                    end
                end)
            end)()
            v573:Toggle("Auto Quest Soul Guitar", _G.Settings.Main["Auto Quest Soul Guitar"], function(p876)
				-- upvalues: (ref) vu192
                _G.Settings.Main["Auto Quest Soul Guitar"] = p876
                if p876 == false then
                    vu192(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
                end
                getgenv().SaveSetting()
            end)
            v573:Toggle("Auto Quest Soul Guitar Hop", _G.Settings.Main["Auto Quest Soul Guitar Hop"], function(p877)
                _G.Settings.Main["Auto Quest Soul Guitar Hop"] = p877
                getgenv().SaveSetting()
            end)
            v573:Label("Cursed Dual Katana")
            v573:Toggle("Auto Cursed Dual Katana", Auto_Cursed_Dual_Katana, function(p878)
                Auto_Cursed_Dual_Katana = p878
            end)
            task.spawn(function()
                while wait() do
                    pcall(function()
                        if Auto_Cursed_Dual_Katana then
                            if GetWeaponInventory("Cursed Dual Katana") ~= true then
                                if game.Players.LocalPlayer.Character:FindFirstChild("Tushita") or (game.Players.LocalPlayer.Backpack:FindFirstChild("Tushita") or (game.Players.LocalPlayer.Character:FindFirstChild("Yama") or game.Players.LocalPlayer.Backpack:FindFirstChild("Yama"))) then
                                    if game.Players.LocalPlayer.Character:FindFirstChild("Tushita") or game.Players.LocalPlayer.Backpack:FindFirstChild("Tushita") then
                                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Tushita") then
                                            EquipWeapon("Tushita")
                                        else
                                            local v879, v880, v881 = pairs(game.Players.LocalPlayer.Character:GetChildren())
                                            while true do
                                                local v882
                                                v881, v882 = v879(v880, v881)
                                                if v881 == nil then
                                                    break
                                                end
                                                if v882.Name == "Tushita" and v882:IsA("Tool") then
                                                    if v882.Level.Value < 350 then
                                                        _G.Select_Weapon = "Tushita"
                                                        _G.Settings.Main["Auto Farm Bone"] = true
                                                    else
                                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LoadItem", "Yama")
                                                        _G.Settings.Main["Auto Farm Bone"] = false
                                                    end
                                                end
                                            end
                                        end
                                    elseif game.Players.LocalPlayer.Character:FindFirstChild("Yama") or game.Players.LocalPlayer.Backpack:FindFirstChild("Yama") then
                                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Yama") then
                                            EquipWeapon("Yama")
                                        else
                                            local v883, v884, v885 = pairs(game.Players.LocalPlayer.Character:GetChildren())
                                            while true do
                                                local v886
                                                v885, v886 = v883(v884, v885)
                                                if v885 == nil then
                                                    break
                                                end
                                                if v886.Name == "Yama" and v886:IsA("Tool") then
                                                    if v886.Level.Value < 350 then
                                                        _G.Select_Weapon = "Yama"
                                                        _G.Settings.Main["Auto Farm Bone"] = true
                                                    else
                                                        Auto_CDK_Quest = true
                                                        _G.Settings.Main["Auto Farm Bone"] = false
                                                    end
                                                end
                                            end
                                        end
                                    end
                                else
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LoadItem", "Tushita")
                                end
                            elseif not (game.Players.LocalPlayer.Character:FindFirstChild("Cursed Dual Katana") or game.Players.LocalPlayer.Backpack:FindFirstChild("Cursed Dual Katana")) then
                                print("Get Weapon")
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LoadItem", "Cursed Dual Katana")
                            end
                        end
                    end)
                end
            end)
            task.spawn(function()
				-- upvalues: (ref) vu192
                while wait() do
                    pcall(function()
						-- upvalues: (ref) vu192
                        if Auto_CDK_Quest then
                            if GetMaterial("Alucard Fragment") ~= 0 then
                                if GetMaterial("Alucard Fragment") ~= 1 then
                                    if GetMaterial("Alucard Fragment") ~= 2 then
                                        if GetMaterial("Alucard Fragment") ~= 3 then
                                            if GetMaterial("Alucard Fragment") ~= 4 then
                                                if GetMaterial("Alucard Fragment") ~= 5 then
                                                    if GetMaterial("Alucard Fragment") == 6 then
                                                        if game:GetService("Workspace").Enemies:FindFirstChild("Cursed Skeleton Boss [Lv. 2025] [Boss]") or game:GetService("Workspace").ReplicatedStorage:FindFirstChild("Cursed Skeleton Boss [Lv. 2025] [Boss]") then
                                                            Auto_Quest_Yama_1 = false
                                                            Auto_Quest_Yama_2 = false
                                                            Auto_Quest_Yama_3 = false
                                                            Auto_Quest_Tushita_1 = false
                                                            Auto_Quest_Tushita_2 = false
                                                            Auto_Quest_Tushita_3 = false
                                                            if game:GetService("Workspace").Enemies:FindFirstChild("Cursed Skeleton Boss [Lv. 2025] [Boss]") or game:GetService("Workspace").Enemies:FindFirstChild("Cursed Skeleton [Lv. 2200]") then
                                                                local v887, v888, v889 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                                                                while true do
                                                                    local v890
                                                                    v889, v890 = v887(v888, v889)
                                                                    if v889 == nil then
                                                                        break
                                                                    end
                                                                    if (v890.Name == "Cursed Skeleton Boss [Lv. 2025] [Boss]" or v890.Name == "Cursed Skeleton [Lv. 2200]") and v890.Humanoid.Health > 0 then
                                                                        v890.HumanoidRootPart.CanCollide = false
                                                                        v890.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                                                        vu192(v890.HumanoidRootPart.CFrame * CFrame.new(0, 50, 0))
                                                                        game:GetService("VirtualUser"):CaptureController()
                                                                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                                                    end
                                                                end
                                                            end
                                                        elseif (CFrame.new(- 12361.7060546875, 603.3547973632812, - 6550.5341796875).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 100 then
                                                            vu192(CFrame.new(- 12361.7060546875, 603.3547973632812, - 6550.5341796875))
                                                        else
                                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "Progress", "Good")
                                                            wait(1)
                                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "Progress", "Evil")
                                                            wait(1)
                                                            vu192(CFrame.new(- 12361.7060546875, 603.3547973632812, - 6550.5341796875))
                                                            wait(1.5)
                                                            game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
                                                            wait(1.5)
                                                            vu192(CFrame.new(- 12253.5419921875, 598.8999633789062, - 6546.8388671875))
                                                        end
                                                    end
                                                else
                                                    Auto_Quest_Yama_1 = false
                                                    Auto_Quest_Yama_2 = false
                                                    Auto_Quest_Yama_3 = false
                                                    Auto_Quest_Tushita_1 = false
                                                    Auto_Quest_Tushita_2 = false
                                                    Auto_Quest_Tushita_3 = true
                                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "Progress", "Good")
                                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "StartTrial", "Good")
                                                end
                                            else
                                                Auto_Quest_Yama_1 = false
                                                Auto_Quest_Yama_2 = false
                                                Auto_Quest_Yama_3 = false
                                                Auto_Quest_Tushita_1 = false
                                                Auto_Quest_Tushita_2 = true
                                                Auto_Quest_Tushita_3 = false
                                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "Progress", "Good")
                                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "StartTrial", "Good")
                                            end
                                        else
                                            Auto_Quest_Yama_1 = false
                                            Auto_Quest_Yama_2 = false
                                            Auto_Quest_Yama_3 = false
                                            Auto_Quest_Tushita_1 = true
                                            Auto_Quest_Tushita_2 = false
                                            Auto_Quest_Tushita_3 = false
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "Progress", "Good")
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "StartTrial", "Good")
                                        end
                                    else
                                        Auto_Quest_Yama_1 = false
                                        Auto_Quest_Yama_2 = false
                                        Auto_Quest_Yama_3 = true
                                        Auto_Quest_Tushita_1 = false
                                        Auto_Quest_Tushita_2 = false
                                        Auto_Quest_Tushita_3 = false
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "Progress", "Evil")
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "StartTrial", "Evil")
                                    end
                                else
                                    Auto_Quest_Yama_1 = false
                                    Auto_Quest_Yama_2 = true
                                    Auto_Quest_Yama_3 = false
                                    Auto_Quest_Tushita_1 = false
                                    Auto_Quest_Tushita_2 = false
                                    Auto_Quest_Tushita_3 = false
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "Progress", "Evil")
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "StartTrial", "Evil")
                                end
                            else
                                Auto_Quest_Yama_1 = true
                                Auto_Quest_Yama_2 = false
                                Auto_Quest_Yama_3 = false
                                Auto_Quest_Tushita_1 = false
                                Auto_Quest_Tushita_2 = false
                                Auto_Quest_Tushita_3 = false
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "Progress", "Evil")
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "StartTrial", "Evil")
                            end
                        end
                    end)
                end
            end)
            task.spawn(function()
				-- upvalues: (ref) vu192
                while wait() do
                    if Auto_Quest_Yama_1 then
                        pcall(function()
							-- upvalues: (ref) vu192
                            if game:GetService("Workspace").Enemies:FindFirstChild("Mythological Pirate [Lv. 1850]") then
                                local v891, v892, v893 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                                while true do
                                    local v894
                                    v893, v894 = v891(v892, v893)
                                    if v893 == nil then
                                        break
                                    end
                                    if v894.Name == "Mythological Pirate [Lv. 1850]" then
                                        repeat
                                            wait()
                                            vu192(v894.HumanoidRootPart.CFrame * CFrame.new(0, 0, - 2))
                                        until Auto_CDK_Quest == false or (Auto_Cursed_Dual_Katana == false or Auto_Quest_Yama_1 == false)
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "StartTrial", "Evil")
                                    end
                                end
                            else
                                vu192(CFrame.new(- 13451.46484375, 543.712890625, - 6961.0029296875))
                            end
                        end)
                    end
                end
            end)
            task.spawn(function()
                while wait() do
                    pcall(function()
                        if Auto_Quest_Yama_2 then
                            local v895, v896, v897 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                            while true do
                                local v898
                                v897, v898 = v895(v896, v897)
                                if v897 == nil then
                                    break
                                end
                                if v898:FindFirstChild("HazeESP") then
                                    v898.HazeESP.Size = UDim2.new(50, 50, 50, 50)
                                    v898.HazeESP.MaxDistance = "inf"
                                end
                            end
                            local v899, v900, v901 = pairs(game:GetService("ReplicatedStorage"):GetChildren())
                            while true do
                                local v902
                                v901, v902 = v899(v900, v901)
                                if v901 == nil then
                                    break
                                end
                                if v902:FindFirstChild("HazeESP") then
                                    v902.HazeESP.Size = UDim2.new(50, 50, 50, 50)
                                    v902.HazeESP.MaxDistance = "inf"
                                end
                            end
                        end
                    end)
                end
            end)
            task.spawn(function()
                while wait() do
                    pcall(function()
                        local v903, v904, v905 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                        while true do
                            local v906
                            v905, v906 = v903(v904, v905)
                            if v905 == nil then
                                break
                            end
                            if Auto_Quest_Yama_2 and (v906:FindFirstChild("HazeESP") and (v906.HumanoidRootPart.Position - PosMonsEsp.Position).magnitude <= 300) then
                                v906.HumanoidRootPart.CFrame = PosMonsEsp
                                v906.HumanoidRootPart.CanCollide = false
                                v906.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                if not v906.HumanoidRootPart:FindFirstChild("BodyVelocity") then
                                    local v907 = Instance.new("BodyVelocity", v906.HumanoidRootPart)
                                    v907.MaxForce = Vector3.new(1, 1, 1) * math.huge
                                    v907.Velocity = Vector3.new(0, 0, 0)
                                end
                            end
                        end
                    end)
                end
            end)
            task.spawn(function()
				-- upvalues: (ref) vu192
                while wait() do
                    if Auto_Quest_Yama_2 then
                        pcall(function()
							-- upvalues: (ref) vu192
                            local v908, v909, v910 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                            while true do
                                while true do
                                    local v911
                                    v910, v911 = v908(v909, v910)
                                    if v910 == nil then
                                        return
                                    end
                                    if v911:FindFirstChild("HazeESP") then
                                        break
                                    end
									-- ::l5::
                                    local v912, v913, v914 = pairs(game:GetService("ReplicatedStorage"):GetChildren())
                                    while true do
                                        local v915
                                        v914, v915 = v912(v913, v914)
                                        if v914 == nil then
                                            break
                                        end
                                        if v915:FindFirstChild("HazeESP") then
                                            if (v915.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 2000 then
                                                vu192(v915.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
                                            else
                                                BTP(v915.HumanoidRootPart.CFrameMon * CFrame.new(0, 20, 0))
                                            end
                                        end
                                    end
                                end
                                wait()
                                if (v911.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 2000 then
                                    StartMagnet = true
                                    FastAttack = true
                                    if _G.Settings.Configs["Auto Haki"] and not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
                                    end
                                    if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
                                        wait()
                                        EquipWeapon(_G.Settings.Configs["Select Weapon"])
                                    end
                                    PosMonsEsp = v911.HumanoidRootPart.CFrame
                                    if not _G.Settings.Configs["Fast Attack"] then
                                        game:GetService("VirtualUser"):CaptureController()
                                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                    end
                                    v911.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                    if _G.Settings.Configs["Show Hitbox"] then
                                        v911.HumanoidRootPart.Transparency = tonumber(_G.Hitbox_LocalTransparency)
                                    else
                                        v911.HumanoidRootPart.Transparency = 1
                                    end
                                    v911.Humanoid.JumpPower = 0
                                    v911.Humanoid.WalkSpeed = 0
                                    v911.HumanoidRootPart.CanCollide = false
                                    v911.Humanoid:ChangeState(11)
                                    vu192(v911.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
                                else
                                    BTP(y.HumanoidRootPart.CFrameMon * CFrame.new(0, 20, 0))
                                end
                                if Auto_Cursed_Dual_Katana ~= false and (Auto_Quest_Yama_2 ~= false and (v911.Parent and (v911.Humanoid.Health > 0 and v911:FindFirstChild("HazeESP")))) then
									-- goto l5
                                end
                            end
                        end)
                    end
                end
            end)
            task.spawn(function()
				-- upvalues: (ref) vu192
                while wait() do
                    if Auto_Quest_Yama_3 then
                        pcall(function()
							-- upvalues: (ref) vu192
							-- block 76
                            if game.Players.LocalPlayer.Backpack:FindFirstChild("Hallow Essence") then
                                _G.Settings.Main["Auto Farm Bone"] = false
                                vu192(game:GetService("Workspace").Map["Haunted Castle"].Summoner.Detection.CFrame)
								-- goto l4
                            end
                            if not game:GetService("Workspace").Map:FindFirstChild("HellDimension") then
                                if game:GetService("Workspace").Enemies:FindFirstChild("Soul Reaper [Lv. 2100] [Raid Boss]") or game.ReplicatedStorage:FindFirstChild("Soul Reaper [Lv. 2100] [Raid Boss]") then
                                    if game:GetService("Workspace").Enemies:FindFirstChild("Soul Reaper [Lv. 2100] [Raid Boss]") then
                                        local v916, v917, v918 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                                        while true do
                                            local v919
                                            v918, v919 = v916(v917, v918)
                                            if v918 == nil then
                                                break
                                            end
                                            if v919.Name == "Soul Reaper [Lv. 2100] [Raid Boss]" and v919.Humanoid.Health > 0 then
                                                repeat
                                                    wait()
                                                    vu192(v919.HumanoidRootPart.CFrame * CFrame.new(0, 0, - 2))
                                                until Auto_Cursed_Dual_Katana == false or Auto_Quest_Yama_3 == false or game:GetService("Workspace").Map:FindFirstChild("HellDimension")
                                            end
                                        end
                                    else
                                        vu192(CFrame.new(- 9570.033203125, 315.9346923828125, 6726.89306640625))
                                    end
                                else
                                    _G.Settings.Main["Auto Farm Bone"] = true
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones", "Buy", 1, 1)
                                end
								-- ::l4::
                                return
                            end
							-- goto l6
							-- ::l9::
                            wait()
                            if not (game:GetService("Workspace").Enemies:FindFirstChild("Cursed Skeleton [Lv. 2200]") or (game:GetService("Workspace").Enemies:FindFirstChild("Cursed Skeleton [Lv. 2200] [Boss]") or game:GetService("Workspace").Enemies:FindFirstChild("Hell\'s Messenger [Lv. 2200] [Boss]"))) then
                                wait(5)
                                vu192(game:GetService("Workspace").Map.HellDimension.Torch1.CFrame)
                                wait(1.5)
                                game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
                                wait(1.5)
                                vu192(game:GetService("Workspace").Map.HellDimension.Torch2.CFrame)
                                wait(1.5)
                                game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
                                wait(1.5)
                                vu192(game:GetService("Workspace").Map.HellDimension.Torch3.CFrame)
                                wait(1.5)
                                game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
                                wait(1.5)
                                vu192(game:GetService("Workspace").Map.HellDimension.Exit.CFrame)
								-- goto l47
                            end
                            local v920, v921, v922 = pairs(game:GetService("Workspace").Enemies:GetChildren())
							-- goto l15
							-- ::l10::
							-- goto l9
							-- ::l15::
                            local v923
                            v922, v923 = v920(v921, v922)
                            if v922 == nil then
								-- goto l47
                            end
                            if v923.Name ~= "Cursed Skeleton [Lv. 2200]" and (v923.Name ~= "Cursed Skeleton [Lv. 2200] [Boss]" and v923.Name ~= "Hell\'s Messenger [Lv. 2200] [Boss]") or v923.Humanoid.Health <= 0 then
								-- goto l15
                            end
							-- ::l24::
                            wait()
                            StartMagnet = true
                            FastAttack = true
                            if _G.Settings.Configs["Auto Haki"] and not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
                            end
                            if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
                                wait()
                                EquipWeapon(_G.Settings.Configs["Select Weapon"])
                            end
                            PosMonsEsp = v923.HumanoidRootPart.CFrame
                            if not _G.Settings.Configs["Fast Attack"] then
                                game:GetService("VirtualUser"):CaptureController()
                                game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                            end
                            v923.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                            if _G.Settings.Configs["Show Hitbox"] then
                                v923.HumanoidRootPart.Transparency = tonumber(_G.Hitbox_LocalTransparency)
                            else
                                v923.HumanoidRootPart.Transparency = 1
                            end
                            v923.Humanoid.JumpPower = 0
                            v923.Humanoid.WalkSpeed = 0
                            v923.HumanoidRootPart.CanCollide = false
                            v923.Humanoid:ChangeState(11)
                            vu192(v923.HumanoidRootPart.CFrame * CFrame.new(0, 50, 0))
                            if v923.Humanoid.Health <= 0 or (not v923.Parent or Auto_Quest_Yama_3 == false) then
								-- goto l15
                            else
								-- goto l24
                            end
							-- ::l47::
                            if Auto_Cursed_Dual_Katana == false or (Auto_Quest_Yama_3 == false or GetMaterial("Alucard Fragment") == 3) then
								-- goto l4
                            end
							-- ::l6::
                            if true then
								-- goto l10
                            else
								-- goto l47
                            end
                        end)
                    end
                end
            end)
            task.spawn(function()
                while wait() do
                    if Auto_Quest_Tushita_1 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "BoatQuest", workspace.NPCs:FindFirstChild("Luxury Boat Dealer"))
                    end
                end
            end)
            task.spawn(function()
                while wait() do
                    if Auto_Quest_Tushita_1 then
                        BTP(CFrame.new(- 9546.990234375, 21.139892578125, 4686.1142578125))
                        wait(5)
                        BTP(CFrame.new(- 6120.0576171875, 16.455780029296875, - 2250.697265625))
                        wait(5)
                        BTP(CFrame.new(- 9533.2392578125, 7.254445552825928, - 8372.69921875))
                    end
                end
            end)
            task.spawn(function()
				-- upvalues: (ref) vu192
                while wait() do
                    if Auto_Quest_Tushita_2 then
                        pcall(function()
							-- upvalues: (ref) vu192
							-- block 40
                            if (CFrame.new(- 5539.3115234375, 313.800537109375, - 2972.372314453125).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 500 then
                                vu192(CFrame.new(- 5545.1240234375, 313.800537109375, - 2976.616455078125))
								-- ::l38::
                                return
                            end
                            local v924, v925, v926 = pairs(game:GetService("Workspace").Enemies:GetChildren())
							-- goto l4
							-- ::l15::
                            wait()
                            FastAttack = true
                            if _G.Settings.Configs["Auto Haki"] and not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
                            end
                            if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
                                wait()
                                EquipWeapon(_G.Settings.Configs["Select Weapon"])
                            end
                            if not _G.Settings.Configs["Fast Attack"] then
                                game:GetService("VirtualUser"):CaptureController()
                                game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                            end
                            v927.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                            if _G.Settings.Configs["Show Hitbox"] then
                                v927.HumanoidRootPart.Transparency = tonumber(_G.Hitbox_LocalTransparency)
                            else
                                v927.HumanoidRootPart.Transparency = 1
                            end
                            v927.Humanoid.JumpPower = 0
                            v927.Humanoid.WalkSpeed = 0
                            v927.HumanoidRootPart.CanCollide = false
                            v927.Humanoid:ChangeState(11)
                            vu192(v927.HumanoidRootPart.CFrame * CFrame.new(0, 50, 0))
                            if v927.Humanoid.Health > 0 and (v927.Parent and Auto_Quest_Tushita_2 ~= false) then
								-- goto l15
                            end
							-- ::l4::
                            local v927
                            v926, v927 = v924(v925, v926)
                            if v926 == nil then
								-- goto l38
                            end
                            if Auto_Quest_Tushita_2 and (v927:FindFirstChild("HumanoidRootPart") and (v927:FindFirstChild("Humanoid") and (v927.Humanoid.Health > 0 and (v927.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 2000))) then
								-- goto l15
                            else
								-- goto l4
                            end
                        end)
                    end
                end
            end)
            task.spawn(function()
				-- upvalues: (ref) vu192
                while wait() do
                    if Auto_Quest_Tushita_3 then
                        pcall(function()
							-- upvalues: (ref) vu192
							-- block 87
                            if not (game:GetService("Workspace").Enemies:FindFirstChild("Cake Queen [Lv. 2175] [Boss]") or game.ReplicatedStorage:FindFirstChild("Cake Queen [Lv. 2175] [Boss]")) then
								-- goto l5
                            end
                            if not game:GetService("Workspace").Enemies:FindFirstChild("Cake Queen [Lv. 2175] [Boss]") then
                                vu192(CFrame.new(- 709.3132934570312, 381.6005859375, - 11011.396484375))
								-- goto l37
                            end
                            local v928, v929, v930 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                            while true do
								-- ::l9::
                                local v931
                                v930, v931 = v928(v929, v930)
                                if v930 == nil then
									-- goto l37
                                end
                                if v931.Name ~= "Cake Queen [Lv. 2175] [Boss]" or v931.Humanoid.Health <= 0 then
									-- goto l9
                                end
                                repeat
                                    wait()
                                    if _G.Settings.Configs["Auto Haki"] and not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
                                    end
                                    if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
                                        wait()
                                        EquipWeapon(_G.Settings.Configs["Select Weapon"])
                                    end
                                    if not _G.Settings.Configs["Fast Attack"] then
                                        game:GetService("VirtualUser"):CaptureController()
                                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                    end
                                    v931.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                    if _G.Settings.Configs["Show Hitbox"] then
                                        v931.HumanoidRootPart.Transparency = tonumber(_G.Hitbox_LocalTransparency)
                                    else
                                        v931.HumanoidRootPart.Transparency = 1
                                    end
                                    v931.Humanoid.JumpPower = 0
                                    v931.Humanoid.WalkSpeed = 0
                                    v931.HumanoidRootPart.CanCollide = false
                                    v931.Humanoid:ChangeState(11)
                                    vu192(v931.HumanoidRootPart.CFrame * CFrame.new(0, 50, 0))
                                until Auto_Cursed_Dual_Katana == false or Auto_Quest_Tushita_3 == false or game:GetService("Workspace").Map:FindFirstChild("HeavenlyDimension")
                            end
							-- ::l5::
                            if not game:GetService("Workspace").Map:FindFirstChild("HeavenlyDimension") then
								-- ::l40::
                                Fast_Hop()
								-- ::l37::
                                return
                            end
                            wait()
                            if not (game:GetService("Workspace").Enemies:FindFirstChild("Cursed Skeleton [Lv. 2200]") or (game:GetService("Workspace").Enemies:FindFirstChild("Cursed Skeleton [Lv. 2200] [Boss]") or game:GetService("Workspace").Enemies:FindFirstChild("Heaven\'s Guardian [Lv. 2200] [Boss]"))) then
                                wait(5)
                                vu192(game:GetService("Workspace").Map.HeavenlyDimension.Torch1.CFrame)
                                wait(1.5)
                                game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
                                wait(1.5)
                                vu192(game:GetService("Workspace").Map.HeavenlyDimension.Torch2.CFrame)
                                wait(1.5)
                                game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
                                wait(1.5)
                                vu192(game:GetService("Workspace").Map.HeavenlyDimension.Torch3.CFrame)
                                wait(1.5)
                                game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
                                wait(1.5)
                                vu192(game:GetService("Workspace").Map.HeavenlyDimension.Exit.CFrame)
								-- ::l80::
                                if Auto_Cursed_Dual_Katana ~= false and (Auto_Quest_Tushita_3 ~= false and GetMaterial("Alucard Fragment") ~= 6) then
									-- goto l40
                                end
								-- goto l37
                            end
                            local v932, v933, v934 = pairs(game:GetService("Workspace").Enemies:GetChildren())
							-- goto l48
							-- ::l57::
                            wait()
                            if _G.Settings.Configs["Auto Haki"] and not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
                            end
                            if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
                                wait()
                                EquipWeapon(_G.Settings.Configs["Select Weapon"])
                            end
                            if not _G.Settings.Configs["Fast Attack"] then
                                game:GetService("VirtualUser"):CaptureController()
                                game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                            end
                            v935.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                            if _G.Settings.Configs["Show Hitbox"] then
                                v935.HumanoidRootPart.Transparency = tonumber(_G.Hitbox_LocalTransparency)
                            else
                                v935.HumanoidRootPart.Transparency = 1
                            end
                            v935.Humanoid.JumpPower = 0
                            v935.Humanoid.WalkSpeed = 0
                            v935.HumanoidRootPart.CanCollide = false
                            v935.Humanoid:ChangeState(11)
                            if v935.Humanoid.Health > 0 and (v935.Parent and Auto_Quest_Tushita_3 ~= false) then
								-- goto l57
                            end
							-- ::l48::
                            local v935
                            v934, v935 = v932(v933, v934)
                            if v934 == nil then
								-- goto l80
                            end
                            if (v935.Name == "Cursed Skeleton [Lv. 2200]" or (v935.Name == "Cursed Skeleton [Lv. 2200] [Boss]" or v935.Name == "Heaven\'s Guardian [Lv. 2200] [Boss]")) and v935.Humanoid.Health > 0 then
								-- goto l57
                            else
								-- goto l48
                            end
                        end)
                    end
                end
            end)
        end
        task.spawn(function()
			-- upvalues: (ref) vu180, (ref) vu240, (ref) vu192, (ref) vu245
            while wait() do
                if _G.Settings.Main["Auto SeaBeast"] then
                    if vu180("Fist of Darkness") then
                        return
                    end
                    if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit == true or vu240() then
                        if vu240() then
                            pcall(function()
								-- upvalues: (ref) vu192
                                game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit = false
                                local v936, v937, v938 = pairs(game.Workspace.SeaBeasts:GetChildren())
                                while true do
									-- ::l1::
                                    local v939
                                    v938, v939 = v936(v937, v938)
                                    if v938 == nil then
                                        return
                                    end
                                    if not _G.Settings.Main["Auto SeaBeast"] or (not v939:FindFirstChild("HumanoidRootPart") or v939.Health.Value <= 0) then
										-- goto l1
                                    end
									-- ::l8::
                                    if true then
                                        wait()
                                        if (CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position.X, 250, game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Z).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 150 then
                                            if (CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position.X, 250, game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Z).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 150 then
                                                if Farmtween then
                                                    Farmtween:Stop()
                                                end
                                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position.X, 250, game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Z)
                                                SpamSkillSea = true
                                                PosKillSea = v939.HumanoidRootPart.Position
                                            end
                                        else
                                            Farmtween = vu192(CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position.X, 250, game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Z))
                                        end
                                    end
                                    if _G.Settings.Main["Auto SeaBeast"] and (v939.Parent and (v939:FindFirstChild("HumanoidRootPart") and v939.Health.Value ~= 0)) then
										-- goto l8
                                    end
                                    SpamSkillSea = false
                                end
                            end)
                        elseif game.Players.LocalPlayer.Character.Humanoid.Sit == true then
                            SpamSkillSea = false
                            game:service("VirtualInputManager"):SendKeyEvent(true, "W", false, game)
                            wait(0.5)
                            game:service("VirtualInputManager"):SendKeyEvent(false, "W", false, game)
                            wait(1)
                            game:service("VirtualInputManager"):SendKeyEvent(true, "S", false, game)
                            wait(0.5)
                            game:service("VirtualInputManager"):SendKeyEvent(false, "S", false, game)
                            wait(1)
                        end
                    elseif vu245() and (game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and (game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit == false and (World2 and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(38.905670166015625, - 0.4971587657928467, 5150.13623046875)).Magnitude > 30))) or World3 and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(163.8607940673828, - 0.4971587657928467, 3242.834716796875)).Magnitude > 30 then
                        SpamSkillSea = false
                        local v940 = nil
                        if World2 then
                            v940 = vu192(CFrame.new(38.905670166015625, - 0.4971587657928467, 5150.13623046875))
                        elseif World3 then
                            v940 = vu192(CFrame.new(163.8607940673828, - 0.4971587657928467, 3242.834716796875))
                        end
                        v940:Wait()
                        wait(10)
                    elseif vu245() and (game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit == false) then
                        SpamSkillSea = false
                        game:service("VirtualInputManager"):SendKeyEvent(true, "W", false, game)
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = vu245()
                        wait()
                        game:service("VirtualInputManager"):SendKeyEvent(false, "W", false, game)
                        game:service("VirtualInputManager"):SendKeyEvent(true, "W", false, game)
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = vu245()
                        wait()
                        game:service("VirtualInputManager"):SendKeyEvent(false, "W", false, game)
                    elseif not vu245() then
                        Com("F_", "BuyBoat", "Dinghy")
                        wait(3)
                    end
                end
            end
        end)
        task.spawn(function()
            while wait() do
                if _G.Settings.Main["Auto SeaBeast"] and SpamSkillSea then
                    local v941, v942, v943 = pairs({
                        "Melee",
                        "Sword",
                        "DevilFruit",
                        "Gun"
                    })
                    local v944 = {}
                    while true do
                        local v945
                        v943, v945 = v941(v942, v943)
                        if v943 == nil then
                            break
                        end
                        local v946 = v945 == "DevilFruit" and "Blox Fruit" or v945
                        local v947, v948, v949 = pairs(game.Players.LocalPlayer.Backpack:GetChildren())
                        while true do
                            local v950
                            v949, v950 = v947(v948, v949)
                            if v949 == nil then
                                break
                            end
                            if v950:IsA("Tool") and v950.ToolTip == v946 then
                                table.insert(v944, v950.Name)
                            end
                        end
                        local v951, v952, v953 = pairs(game.Players.LocalPlayer.Character:GetChildren())
                        while true do
                            local v954
                            v953, v954 = v951(v952, v953)
                            if v953 == nil then
                                break
                            end
                            if v954:IsA("Tool") and v954.ToolTip == v946 then
                                table.insert(v944, v954.Name)
                            end
                        end
                    end
                    local v955, v956, v957 = pairs(v944)
                    while true do
                        local v958
                        v957, v958 = v955(v956, v957)
                        if v957 == nil then
                            break
                        end
                        repeat
                            wait()
                            EquipWeapon(v958)
                        until game.Players.LocalPlayer.Character:FindFirstChild(v958)
                        wait()
                        local v959 = require(game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool"):FindFirstChild("Data") or game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool"):FindFirstChildOfClass("ModuleScript"))
                        local v960, v961, v962 = pairs(v959.Cooldown)
                        while true do
                            local v963
                            v962, v963 = v960(v961, v962)
                            if v962 == nil then
                                break
                            end
                            if v959.Lvl[v962] <= game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool"):WaitForChild("Level").Value and (v962 ~= nil and (v962 and # v962 == 1)) then
                                game:service("VirtualInputManager"):SendKeyEvent(true, tostring(v962), false, game)
                                wait(0.1)
                                game:service("VirtualInputManager"):SendKeyEvent(false, tostring(v962), false, game)
                                wait()
                            end
                        end
                        wait(0.1)
                    end
                end
            end
        end)
        task.spawn(function()
			-- upvalues: (ref) vu287, (ref) vu278, (ref) vu192
            while wait() do
                if AutoFarmMaterial then
                    pcall(function()
						-- upvalues: (ref) vu287, (ref) vu278, (ref) vu192
						-- block 80
                        if SelectModeMaterial == "" then
							-- ::l3::
                            return
                        end
                        vu287(SelectModeMaterial)
                        if not vu278(MaterialMob) then
                            FastAttack = false
                            Modstween = vu192(CFrameMon)
                            if World1 and table.find(MaterialMob, "Fishman Commando [Lv. 400]") and (CFrameMon.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 50000 then
                                if Modstween then
                                    Modstween:Stop()
                                end
                                wait(0.5)
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
                            elseif World1 and not table.find(MaterialMob, "Fishman Commando [Lv. 400]") and (CFrameMon.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 50000 then
                                if Modstween then
                                    Modstween:Stop()
                                end
                                wait(0.5)
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(3864.8515625, 6.6796875, - 1926.7841796875))
                            elseif World1 and table.find(MaterialMob, "God\'s Guard [Lv. 450]") and (CFrameMon.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 3000 then
                                if Modstween then
                                    Modstween:Stop()
                                end
                                wait(0.5)
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(- 4607.8227539063, 872.54248046875, - 1667.5568847656))
                            elseif (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 150 then
                                if Modstween then
                                    Modstween:Stop()
                                end
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
                            end
							-- goto l3
                        end
                        local v964, v965, v966 = pairs(game:GetService("Workspace").Enemies:GetChildren())
						-- ::l7::
                        local v967
                        v966, v967 = v964(v965, v966)
                        if v966 == nil then
							-- goto l3
                        end
                        if not AutoFarmMaterial or (not table.find(MaterialMob, v967.Name) or (not v967:FindFirstChild("HumanoidRootPart") or (not v967:FindFirstChild("Humanoid") or v967.Humanoid.Health <= 0))) then
							-- goto l7
                        end
						-- ::l18::
                        wait()
                        FarmtoTarget = vu192(v967.HumanoidRootPart.CFrame * CFrame.new(0, 30, 1))
                        if v967:FindFirstChild("HumanoidRootPart") and (v967:FindFirstChild("Humanoid") and (v967.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 150) then
                            if FarmtoTarget then
                                FarmtoTarget:Stop()
                            end
                            FastAttack = true
                            StartMagnet = true
                            EquipWeapon(_G.Settings.Configs["Select Weapon"])
                            PosMon = v967.HumanoidRootPart.CFrame
                            if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 150 then
                                game:service("VirtualInputManager"):SendKeyEvent(true, "V", false, game)
                                game:service("VirtualInputManager"):SendKeyEvent(false, "V", false, game)
                            end
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v967.HumanoidRootPart.CFrame * CFrame.new(0, 30, 1)
                        end
                        if vu278(MaterialMob) and (AutoFarmMaterial and (v967.Humanoid.Health > 0 and v967.Parent)) then
							-- goto l18
                        else
							-- goto l21
                        end
						-- ::l21::
						-- ::l36::
                        FastAttack = false
                        FastAttack = false
                        StartMagnet = false
						-- goto l7
                    end)
                end
            end
        end)
        task.spawn(function()
			-- upvalues: (ref) vu329, (ref) vu192
            while wait() do
                pcall(function()
					-- upvalues: (ref) vu329, (ref) vu192
					-- block 273
                    if GetWeaponInventory("Soul Guitar") ~= false or not _G.Settings.Main["Auto Quest Soul Guitar"] then
						-- ::l3::
                        return
                    end
                    if GetMaterial("Bones") >= 500 and (GetMaterial("Ectoplasm") >= 250 and GetMaterial("Dark Fragment") >= 1) then
						-- goto l12
                    end
                    if GetMaterial("Ectoplasm") > 250 then
						-- goto l120
                    end
                    if not World2 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
						-- goto l3
                    end
                    if not (game:GetService("Workspace").Enemies:FindFirstChild("Ship Deckhand [Lv. 1250]") or (game:GetService("Workspace").Enemies:FindFirstChild("Ship Engineer [Lv. 1275]") or (game:GetService("Workspace").Enemies:FindFirstChild("Ship Steward [Lv. 1300]") or (game:GetService("Workspace").Enemies:FindFirstChild("Ship Officer [Lv. 1325]") or game:GetService("Workspace").Enemies:FindFirstChild("Arctic Warrior [Lv. 1350]"))))) then
                        StartMagnet = false
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
						-- goto l3
                    end
                    local v968, v969, v970 = pairs(game:GetService("Workspace").Enemies:GetChildren())
					-- ::l135::
                    local v971
                    v970, v971 = v968(v969, v970)
                    if v970 == nil then
						-- goto l3
                    end
                    if (v971.Name == "Ship Deckhand [Lv. 1250]" or (v971.Name == "Ship Engineer [Lv. 1275]" or (v971.Name == "Ship Steward [Lv. 1300]" or (v971.Name == "Ship Officer [Lv. 1325]" or v971.Name == "Arctic Warrior [Lv. 1350]")))) and (v971:FindFirstChild("Humanoid") and (v971:FindFirstChild("HumanoidRootPart") and v971.Humanoid.Health > 0)) then
						-- goto l15
                    else
						-- goto l135
                    end
					-- ::l15::
					-- ::l123::
					-- ::l184::
					-- ::l230::
					-- ::l220::
					-- ::l221::
					-- ::l152::
                    wait()
                    StartMagnet = true
                    FastAttack = true
                    if _G.Settings.Configs["Auto Haki"] and not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
                    end
                    if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
                        wait()
                        EquipWeapon(_G.Settings.Configs["Select Weapon"])
                    end
                    PosMon = v971.HumanoidRootPart.CFrame
                    if not _G.Settings.Configs["Fast Attack"] then
                        game:GetService("VirtualUser"):CaptureController()
                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                    end
                    v971.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                    if _G.Settings.Configs["Show Hitbox"] then
                        v971.HumanoidRootPart.Transparency = tonumber(_G.Hitbox_LocalTransparency)
                    else
                        v971.HumanoidRootPart.Transparency = 1
                    end
                    v971.Humanoid.JumpPower = 0
                    v971.Humanoid.WalkSpeed = 0
                    v971.HumanoidRootPart.CanCollide = false
                    v971.Humanoid:ChangeState(11)
                    vu192(v971.HumanoidRootPart.CFrame * CFrame.new(0, _G.Settings.Configs["Distance Auto Farm"], 0))
                    if _G.Settings.Main["Auto Quest Soul Guitar"] and (v971.Parent and v971.Humanoid.Health > 0) then
						-- goto l155
                    else
						-- goto l136
                    end
					-- ::l155::
					-- goto l152
					-- ::l136::
					-- ::l170::
                    StartMagnet = false
                    FastAttack = false
					-- goto l135
					-- ::l3::
					-- ::l8::
					-- ::l177::
					-- ::l119::
					-- ::l5::
					-- ::l54::
                    wait()
                    if _G.Settings.Configs["Auto Haki"] and not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
                    end
                    if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
                        wait()
                        EquipWeapon(_G.Settings.Configs["Select Weapon"])
                    end
                    if not _G.Settings.Configs["Fast Attack"] then
                        game:GetService("VirtualUser"):CaptureController()
                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                    end
                    v973.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                    if _G.Settings.Configs["Show Hitbox"] then
                        v973.HumanoidRootPart.Transparency = tonumber(_G.Hitbox_LocalTransparency)
                    else
                        v973.HumanoidRootPart.Transparency = 1
                    end
                    v973.HumanoidRootPart.CFrame = CFrame.new(- 10138.3974609375, 138.6524658203125, 5902.89208984375)
                    StartSoulGuitarMagnt = true
                    v973.Humanoid.JumpPower = 0
                    v973.Humanoid.WalkSpeed = 0
                    v973.HumanoidRootPart.CanCollide = false
                    v973.Humanoid:ChangeState(11)
                    vu192(v973.HumanoidRootPart.CFrame * CFrame.new(0, 30, 15))
                    if v973.Parent and (v973.Humanoid.Health > 0 and (v973:FindFirstChild("HumanoidRootPart") and (v973:FindFirstChild("Humanoid") and _G.Settings.Main["Auto Quest Soul Guitar"]))) then
						-- goto l57
                    else
						-- goto l46
                    end
					-- ::l57::
					-- goto l54
					-- ::l46::
					-- ::l72::
                    StartSoulGuitarMagnt = false
					-- ::l45::
                    local v972, v973 = v983(v984, v972)
                    if v972 == nil then
						-- goto l42
                    end
                    if v973.Name ~= "Living Zombie [Lv. 2000]" or not (v973:FindFirstChild("Humanoid") and v973:FindFirstChild("HumanoidRootPart")) or game.Players.LocalPlayer:DistanceFromCharacter(v973.HumanoidRootPart.Position) > 2000 then
						-- goto l45
                    else
						-- goto l122
                    end
					-- ::l122::
					-- ::l181::
					-- ::l224::
					-- goto l3
					-- ::l42::
					-- ::l17::
					-- ::l134::
					-- ::l199::
					-- ::l246::
                    wait()
                    StartMagnet = true
                    FastAttack = true
                    if _G.Settings.Configs["Auto Haki"] and not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
                    end
                    if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
                        wait()
                        EquipWeapon(_G.Settings.Configs["Select Weapon"])
                    end
                    PosMon = v975.HumanoidRootPart.CFrame
                    if not _G.Settings.Configs["Fast Attack"] then
                        game:GetService("VirtualUser"):CaptureController()
                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                    end
                    v975.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                    if _G.Settings.Configs["Show Hitbox"] then
                        v975.HumanoidRootPart.Transparency = tonumber(_G.Hitbox_LocalTransparency)
                    else
                        v975.HumanoidRootPart.Transparency = 1
                    end
                    v975.Humanoid.JumpPower = 0
                    v975.Humanoid.WalkSpeed = 0
                    v975.HumanoidRootPart.CanCollide = false
                    v975.Humanoid:ChangeState(11)
                    vu192(v975.HumanoidRootPart.CFrame * CFrame.new(0, _G.Settings.Configs["Distance Auto Farm"], 0))
                    if _G.Settings.Main["Auto Quest Soul Guitar"] and (v975.Humanoid.Health > 0 and (v975.Parent and v975.Humanoid.Health > 0)) then
						-- goto l246
                    else
						-- goto l116
                    end
					-- ::l116::
					-- ::l264::
                    StartMagnet = false
                    FastAttack = false
					-- ::l231::
                    local v974, v975 = v989(v990, v974)
                    if v974 == nil then
						-- goto l3
                    end
                    if (v975.Name == "Reborn Skeleton [Lv. 1975]" or (v975.Name == "Living Zombie [Lv. 2000]" or (v975.Name == "Demonic Soul [Lv. 2025]" or v975.Name == "Posessed Mummy [Lv. 2050]"))) and (v975:FindFirstChild("Humanoid") and (v975:FindFirstChild("HumanoidRootPart") and v975.Humanoid.Health > 0)) then
						-- goto l113
                    else
						-- goto l188
                    end
					-- ::l188::
					-- ::l28::
					-- ::l18::
					-- ::l14::
					-- ::l180::
					-- goto l231
					-- ::l113::
					-- goto l42
					-- ::l12::
                    if (CFrame.new(- 9681.458984375, 6.139880657196045, 6341.3720703125).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                        vu192(CFrame.new(- 9681.458984375, 6.139880657196045, 6341.3720703125))
						-- goto l3
                    end
                    if game:GetService("Workspace").Map["Haunted Castle"].Candle1.Transparency ~= 0 then
                        if string.find(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("gravestoneEvent", 2), "Error") then
                            print("Go to Grave")
                            vu192(CFrame.new(- 8653.2060546875, 140.98487854003906, 6160.033203125))
                        elseif string.find(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("gravestoneEvent", 2), "Nothing") then
                            print("Wait Next Night")
                        else
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("gravestoneEvent", 2, true)
                        end
						-- goto l3
                    end
                    local v976 = game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("CommF_")
                    local v977 = v976:InvokeServer("GuitarPuzzleProgress", "Check")
                    if not v977 then
                        if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("gravestoneEvent", 2) ~= true then
                            if _G.Settings.Main["Auto Quest Soul Guitar Hop"] then
                                Fast_Hop()
                            end
                        else
                            v976:InvokeServer("gravestoneEvent", 2, true)
                        end
                    end
                    if not v977 then
						-- goto l3
                    end
                    local v978 = v977.Swamp
                    local v979 = v977.Gravestones
                    local v980 = v977.Ghost
                    local v981 = v977.Trophies
                    local v982 = v977.Pipes
                    local _ = v977.CraftedOnce
                    if v978 and (v979 and (v980 and (v981 and v982))) then
                        _G.Settings.Main["Auto Quest Soul Guitar"] = false
                    end
                    if v978 then
						-- ::l42::
                        wait(1)
                        if v978 and not v979 then
                            v976:InvokeServer("GuitarPuzzleProgress", "Gravestones")
                        end
                        wait(1)
                        if v978 and (v979 and not v980) then
                            v976:InvokeServer("GuitarPuzzleProgress", "Ghost")
                        end
                        wait(1)
                        if v978 and (v979 and (v980 and not v981)) then
                            v976:InvokeServer("GuitarPuzzleProgress", "Trophies")
                        end
                        wait(1)
                        if v978 and (v979 and (v980 and (v981 and not v982))) then
                            v976:InvokeServer("GuitarPuzzleProgress", "Pipes")
                        end
						-- goto l3
                    end
                    repeat
                        wait()
                        vu329(CFrame.new(- 10141.462890625, 138.6524658203125, 5935.06298828125) * CFrame.new(0, 30, 0))
                    until game.Players.LocalPlayer:DistanceFromCharacter(Vector3.new(- 10141.462890625, 138.6524658203125, 5935.06298828125)) <= 100
                    local v983, v984
                    v983, v984, v972 = pairs(game.Workspace.Enemies:GetChildren())
					-- goto l45
					-- ::l120::
                    if GetMaterial("Dark Fragment") >= 1 then
						-- goto l178
                    end
                    if not World2 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
						-- goto l3
                    end
                    if not (game.ReplicatedStorage:FindFirstChild("Darkbeard [Lv. 1000] [Raid Boss]") or game:GetService("Workspace").Enemies:FindFirstChild("Darkbeard [Lv. 1000] [Raid Boss]")) then
                        vu192(CFrame.new(3798.4575195313, 13.826690673828, - 3399.806640625))
						-- goto l3
                    end
                    local v985, v986, v987 = pairs(game.Workspace.Enemies:GetChildren())
					-- ::l187::
                    local v988
                    v987, v988 = v985(v986, v987)
                    if v987 == nil then
						-- goto l3
                    end
                    if v988.Name ~= "Darkbeard [Lv. 1000] [Raid Boss]" or (v988.Humanoid.Health <= 0 or not (v988:FindFirstChild("Humanoid") and v988:FindFirstChild("HumanoidRootPart"))) then
						-- goto l187
                    else
						-- goto l114
                    end
					-- ::l114::
					-- ::l41::
					-- ::l126::
					-- ::l186::
					-- ::l218::
					-- ::l196::
                    wait()
                    FastAttack = true
                    if _G.Settings.Configs["Auto Haki"] and not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
                    end
                    if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
                        wait()
                        EquipWeapon(_G.Settings.Configs["Select Weapon"])
                    end
                    if not _G.Settings.Configs["Fast Attack"] then
                        game:GetService("VirtualUser"):CaptureController()
                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                    end
                    v988.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                    if _G.Settings.Configs["Show Hitbox"] then
                        v988.HumanoidRootPart.Transparency = tonumber(_G.Hitbox_LocalTransparency)
                    else
                        v988.HumanoidRootPart.Transparency = 1
                    end
                    v988.Humanoid.JumpPower = 0
                    v988.Humanoid.WalkSpeed = 0
                    v988.HumanoidRootPart.CanCollide = false
                    v988.Humanoid:ChangeState(11)
                    vu192(v988.HumanoidRootPart.CFrame * CFrame.new(0, _G.Settings.Configs["Distance Auto Farm"], 0))
                    if not _G.Settings.Main["Auto Quest Soul Guitar"] and v988.Humanoid.Health > 0 then
						-- goto l196
                    end
					-- goto l187
					-- ::l178::
                    if GetMaterial("Bones") > 500 then
						-- goto l3
                    end
                    if not World3 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
						-- goto l3
                    end
                    if not (game:GetService("Workspace").Enemies:FindFirstChild("Reborn Skeleton [Lv. 1975]") or (game:GetService("Workspace").Enemies:FindFirstChild("Living Zombie [Lv. 2000]") or (game:GetService("Workspace").Enemies:FindFirstChild("Demonic Soul [Lv. 2025]") or game:GetService("Workspace").Enemies:FindFirstChild("Posessed Mummy [Lv. 2050]")))) then
                        vu192(CFrame.new(- 9504.8564453125, 172.14292907714844, 6057.259765625))
						-- goto l3
                    end
                    local v989, v990
                    v989, v990, v974 = pairs(game:GetService("Workspace").Enemies:GetChildren())
					-- goto l231
                end)
            end
        end)
        v569:Label("Auto Farm Settings")
        v569:Toggle("Double Quest", true, function(p991)
            _G.Settings.Configs["Double Quest"] = p991
            getgenv().SaveSetting()
        end)
        v569:Toggle("Bypass Tp", true, function(p992)
            _G.Settings.Configs["Bypass TP"] = p992
            getgenv().SaveSetting()
        end)
        if World1 then
            v569:Toggle("Fast Farm Mode", _G.Settings.Main["Fast Auto Farm Level"], function(p993)
                _G.Settings.Main["Fast Auto Farm Level"] = p993
                getgenv().SaveSetting()
            end)
        end
        v569:Toggle("Instant Attack", _G.Settings.Configs["Fast Attack"], function(p994)
            _G.Settings.Configs["Fast Attack"] = p994
            getgenv().SaveSetting()
        end)
        v569:Dropdown("Fast Attack Select", {
            "Very Fast",
            "Normal",
            "Slow"
        }, "Very Fast", function(p995)
            _G.Settings.Configs["Fast Attack Type"] = p995
            getgenv().SaveSetting()
        end)
        task.spawn(function()
            while wait(0.0075) do
                pcall(function()
                    if FastAttack and _G.Settings.Configs["Fast Attack"] then
                        if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
                        end
                        if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") and Fast_Delay then
                            AttackNoCD(0)
                        end
                        if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") and Fast_Delay then
                            AttackNoCD(0)
                        end
                    else
                        if ac.hitboxMagnitude ~= 55 then
                            ac.hitboxMagnitude = 55
                        end
                        ac:attack()
                    end
                end)
            end
        end)
        task.spawn(function()
            while wait(0.1) do
                pcall(function()
                    if FastAttack and _G.Settings.Configs["Fast Attack"] then
                        if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
                        end
                        if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") and Fast_Delay then
                            AttackNoCD(1)
                        end
                        Fast_Delay = true
                        if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") and Fast_Delay then
                            AttackNoCD(1)
                        end
                    else
                        if ac.hitboxMagnitude ~= 55 then
                            ac.hitboxMagnitude = 55
                        end
                        ac:attack()
                    end
                end)
            end
        end)
        v569:Dropdown("Select Weapon", {
            "Melee",
            "Sword",
            "Fruit"
        }, "Melee", function(p996)
            SelectWeapon = p996
        end)
        LPH_JIT_MAX(function()
            task.spawn(function()
                while wait() do
                    pcall(function()
                        if SelectWeapon ~= "Melee" then
                            if SelectWeapon ~= "Sword" then
                                if SelectWeapon ~= "Fruit" then
                                    local v997, v998, v999 = pairs(game.Players.LocalPlayer.Backpack:GetChildren())
                                    while true do
                                        local v1000
                                        v999, v1000 = v997(v998, v999)
                                        if v999 == nil then
                                            break
                                        end
                                        if v1000.ToolTip == "Melee" and game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v1000.Name)) then
                                            _G.Settings.Configs["Select Weapon"] = v1000.Name
                                        end
                                    end
                                else
                                    local v1001, v1002, v1003 = pairs(game.Players.LocalPlayer.Backpack:GetChildren())
                                    while true do
                                        local v1004
                                        v1003, v1004 = v1001(v1002, v1003)
                                        if v1003 == nil then
                                            break
                                        end
                                        if v1004.ToolTip == "Blox Fruit" and game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v1004.Name)) then
                                            _G.Settings.Configs["Select Weapon"] = v1004.Name
                                        end
                                    end
                                end
                            else
                                local v1005, v1006, v1007 = pairs(game.Players.LocalPlayer.Backpack:GetChildren())
                                while true do
                                    local v1008
                                    v1007, v1008 = v1005(v1006, v1007)
                                    if v1007 == nil then
                                        break
                                    end
                                    if v1008.ToolTip == "Sword" and game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v1008.Name)) then
                                        _G.Settings.Configs["Select Weapon"] = v1008.Name
                                    end
                                end
                            end
                        else
                            local v1009, v1010, v1011 = pairs(game.Players.LocalPlayer.Backpack:GetChildren())
                            while true do
                                local v1012
                                v1011, v1012 = v1009(v1010, v1011)
                                if v1011 == nil then
                                    break
                                end
                                if v1012.ToolTip == "Melee" and game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v1012.Name)) then
                                    _G.Settings.Configs["Select Weapon"] = v1012.Name
                                end
                            end
                        end
                    end)
                end
            end)
        end)()
        v569:Label("Misc Configs")
        v569:Button("Fps Booster Super(Synapse X Only)", function(_)
            TextureNormal()
            ObjectRemvoe()
            WaterRemvoe()
            InvisibleObject()
        end)
        v569:Button("Fps Booster", function(_)
            TextureNormal(true)
        end)
        task.spawn(function()
            while wait() do
                pcall(function()
                    if _G.Settings.Configs["Auto Haki"] and not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
                    end
                end)
            end
        end)
        v569:Label("Mob Configs")
        v569:Toggle("Bring Monster", _G.Settings.Configs["Bring Mob"], function(p1013)
            _G.Settings.Configs["Bring Mob"] = p1013
            getgenv().SaveSetting()
        end)
        v569:Toggle("Disabled Damage", _G.Settings.Configs["Disabled Damage"], function(p1014)
            _G.Settings.Configs["Disabled Damage"] = p1014
            DisabledDamage()
            getgenv().SaveSetting()
        end)
        v567:Label("Bosses")
        v567:Toggle("Auto All Boss", _G.Settings.Boss["Auto All Boss"], function(p1015)
			-- upvalues: (ref) vu192
            _G.Settings.Boss["Auto All Boss"] = p1015
            getgenv().SaveSetting()
            _G.GetBoss = false
            MsBoss = ""
            if p1015 == false then
                vu192(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
            end
        end)
        v567:Toggle("Auto All Boss Hop", _G.Settings.Boss["Auto All Boss Hop"], function(p1016)
            _G.Settings.Boss["Auto All Boss Hop"] = p1016
            getgenv().SaveSetting()
        end)
        task.spawn(function()
            while wait() do
                if _G.Settings.Boss["Auto All Boss"] then
                    GetBossName()
                end
            end
        end)
        task.spawn(function()
			-- upvalues: (ref) vu192
            while wait() do
                if _G.Settings.Boss["Auto All Boss"] then
                    pcall(function()
						-- upvalues: (ref) vu192
						-- block 137
                        CheckBossQuest()
                        if MsBoss ~= "Soul Reaper [Lv. 2100] [Raid Boss]" and (MsBoss ~= "Longma [Lv. 2000] [Boss]" and (MsBoss ~= "Don Swan [Lv. 1000] [Boss]" and (MsBoss ~= "Cursed Captain [Lv. 1325] [Raid Boss]" and (MsBoss ~= "Order [Lv. 1250] [Raid Boss]" and MsBoss ~= "rip_indra True Form [Lv. 5000] [Raid Boss]")))) then
							-- goto l13
                        end
                        if not (game:GetService("ReplicatedStorage"):FindFirstChild(MsBoss) or game:GetService("Workspace").Enemies:FindFirstChild(MsBoss)) then
                            _G.GetBoss = false
                            wait(3)
                            if not game:GetService("ReplicatedStorage"):FindFirstChild(MsBoss) and _G.Settings.Boss["Auto All Boss Hop"] then
                                Fast_Hop()
                            end
							-- goto l42
                        end
                        if not game:GetService("Workspace").Enemies:FindFirstChild(MsBoss) then
                            _G.GetBoss = true
                            vu192(CFrameBoss)
							-- goto l42
                        end
                        local v1017, v1018, v1019 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                        while true do
                            local v1020
                            v1019, v1020 = v1017(v1018, v1019)
                            if v1019 == nil then
								-- goto l42
                            end
                            if v1020.Name == MsBoss then
                                repeat
                                    wait()
                                    _G.GetBoss = true
                                    if _G.Settings.Configs["Auto Haki"] and not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
                                    end
                                    if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
                                        wait()
                                        EquipWeapon(_G.Settings.Configs["Select Weapon"])
                                    end
                                    StartMagnet = true
                                    FastAttack = true
                                    vu192(v1020.HumanoidRootPart.CFrame * CFrame.new(1, 30, 0))
                                    PosMon = v1020.HumanoidRootPart.CFrame
                                    v1020.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                    v1020.Humanoid.JumpPower = 0
                                    v1020.Humanoid.WalkSpeed = 0
                                    v1020.HumanoidRootPart.CanCollide = false
                                    v1020.Humanoid:ChangeState(11)
                                until _G.Settings.Boss["Auto All Boss"] == false or (not v1020.Parent or v1020.Humanoid.Health <= 0)
                                _G.GetBoss = false
                            end
                        end
						-- ::l42::
						-- ::l107::
						-- ::l89::
						-- goto l111
						-- ::l13::
                        if not _G.Settings.Boss["Auto Quest"] then
							-- goto l50
                        end
                        CheckBossQuest()
                        if not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameBoss) then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                        end
                        if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                            _G.GetBoss = true
                            repeat
                                wait()
                                vu192(CFrameQuestBoss)
                            until (CFrameQuestBoss.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 or not _G.Settings.Boss["Auto All Boss"]
                            if (CFrameQuestBoss.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 4 then
                                wait(1.1)
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", NameQuestBoss, LevelQuestBoss)
                            end
							-- goto l42
                        end
                        if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible ~= true then
							-- goto l42
                        end
                        if not (game:GetService("ReplicatedStorage"):FindFirstChild(MsBoss) or game:GetService("Workspace").Enemies:FindFirstChild(MsBoss)) then
                            _G.GetBoss = false
                            wait(3)
                            if not game:GetService("ReplicatedStorage"):FindFirstChild(MsBoss) and _G.Settings.Boss["Auto All Boss Hop"] then
                                Fast_Hop()
                            end
							-- goto l42
                        end
                        if not game:GetService("Workspace").Enemies:FindFirstChild(MsBoss) then
                            _G.GetBoss = true
                            vu192(CFrameBoss)
							-- goto l42
                        end
                        local v1021, v1022, v1023 = pairs(game:GetService("Workspace").Enemies:GetChildren())
						-- ::l74::
                        local v1024
                        v1023, v1024 = v1021(v1022, v1023)
                        if v1023 == nil then
							-- goto l42
                        end
                        if v1024.Name ~= MsBoss then
							-- goto l74
                        else
							-- goto l105
                        end
						-- ::l105::
						-- ::l36::
						-- ::l25::
						-- ::l77::
                        if true then
                            wait()
                            _G.GetBoss = true
                            if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameBoss) then
                                if _G.Settings.Configs["Auto Haki"] and not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
                                end
                                if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
                                    wait()
                                    EquipWeapon(_G.Settings.Configs["Select Weapon"])
                                end
                                StartMagnet = true
                                FastAttack = true
                                vu192(v1024.HumanoidRootPart.CFrame * CFrame.new(1, 30, 0))
                                PosMon = v1024.HumanoidRootPart.CFrame
                                v1024.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                v1024.Humanoid.JumpPower = 0
                                v1024.Humanoid.WalkSpeed = 0
                                v1024.HumanoidRootPart.CanCollide = false
                                v1024.Humanoid:ChangeState(11)
                            else
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                            end
                        end
                        if _G.Settings.Boss["Auto All Boss"] ~= false and (v1024.Parent and v1024.Humanoid.Health > 0) then
							-- goto l77
                        end
                        _G.GetBoss = false
						-- goto l74
						-- ::l50::
                        if not (game:GetService("ReplicatedStorage"):FindFirstChild(MsBoss) or game:GetService("Workspace").Enemies:FindFirstChild(MsBoss)) then
                            _G.GetBoss = false
                            wait(3)
                            if not game:GetService("ReplicatedStorage"):FindFirstChild(MsBoss) and _G.Settings.Boss["Auto All Boss Hop"] then
                                Fast_Hop()
                            end
							-- ::l42::
                            return
                        end
                        if not game:GetService("Workspace").Enemies:FindFirstChild(MsBoss) then
                            _G.GetBoss = true
                            vu192(CFrameBoss)
							-- goto l42
                        end
                        local v1025, v1026, v1027 = pairs(game:GetService("Workspace").Enemies:GetChildren())
						-- goto l111
						-- ::l3::
						-- goto l114
						-- ::l22::
						-- goto l3
						-- ::l23::
						-- goto l49
						-- ::l28::
						-- goto l92
						-- ::l49::
						-- goto l22
						-- ::l75::
						-- goto l28
						-- ::l92::
						-- goto l23
						-- ::l110::
						-- goto l125
						-- ::l114::
                        wait()
                        _G.GetBoss = true
                        if _G.Settings.Configs["Auto Haki"] and not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
                        end
                        if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
                            wait()
                            EquipWeapon(_G.Settings.Configs["Select Weapon"])
                        end
                        StartMagnet = true
                        FastAttack = true
                        vu192(v1028.HumanoidRootPart.CFrame * CFrame.new(1, 30, 0))
                        PosMon = v1028.HumanoidRootPart.CFrame
                        v1028.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                        v1028.Humanoid.JumpPower = 0
                        v1028.Humanoid.WalkSpeed = 0
                        v1028.HumanoidRootPart.CanCollide = false
                        v1028.Humanoid:ChangeState(11)
                        if _G.Settings.Boss["Auto All Boss"] == false or (not v1028.Parent or v1028.Humanoid.Health <= 0) then
							-- goto l110
                        else
							-- goto l114
                        end
						-- ::l125::
                        _G.GetBoss = false
						-- ::l111::
                        local v1028
                        v1027, v1028 = v1025(v1026, v1027)
                        if v1027 == nil then
							-- goto l42
                        end
                        if v1028.Name ~= MsBoss then
							-- goto l42
                        else
							-- goto l75
                        end
                    end)
                end
            end
        end)
        v567:Toggle("Auto Boss Select", _G.Settings.Boss["Auto Boss Select"], function(p1029)
			-- upvalues: (ref) vu192
            _G.Settings.Boss["Auto Boss Select"] = p1029
            getgenv().SaveSetting()
            if p1029 == false then
                vu192(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
            end
        end)
        task.spawn(function()
			-- upvalues: (ref) vu192
            while wait() do
                if _G.Settings.Boss["Auto Boss Select"] then
                    pcall(function()
						-- upvalues: (ref) vu192
						-- block 103
                        CheckBossQuest()
                        if MsBoss ~= "Soul Reaper [Lv. 2100] [Raid Boss]" and (MsBoss ~= "Longma [Lv. 2000] [Boss]" and (MsBoss ~= "Don Swan [Lv. 1000] [Boss]" and (MsBoss ~= "Cursed Captain [Lv. 1325] [Raid Boss]" and (MsBoss ~= "Order [Lv. 1250] [Raid Boss]" and MsBoss ~= "rip_indra True Form [Lv. 5000] [Raid Boss]")))) then
							-- goto l13
                        end
                        if not game:GetService("Workspace").Enemies:FindFirstChild(MsBoss) then
                            vu192(CFrameBoss)
							-- goto l36
                        end
                        local v1030, v1031, v1032 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                        while true do
                            local v1033
                            v1032, v1033 = v1030(v1031, v1032)
                            if v1032 == nil then
								-- goto l36
                            end
                            if v1033.Name == MsBoss then
                                repeat
                                    wait()
                                    if _G.Settings.Configs["Auto Haki"] and not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
                                    end
                                    if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
                                        wait()
                                        EquipWeapon(_G.Settings.Configs["Select Weapon"])
                                    end
                                    StartMagnet = true
                                    FastAttack = true
                                    vu192(v1033.HumanoidRootPart.CFrame * CFrame.new(1, 30, 0))
                                    PosMon = v1033.HumanoidRootPart.CFrame
                                    v1033.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                    v1033.Humanoid.JumpPower = 0
                                    v1033.Humanoid.WalkSpeed = 0
                                    v1033.HumanoidRootPart.CanCollide = false
                                    v1033.Humanoid:ChangeState(11)
                                until _G.Settings.Boss["Auto Boss Select"] == false or (not v1033.Parent or v1033.Humanoid.Health <= 0)
                            end
                        end
						-- ::l36::
						-- ::l86::
                        wait()
                        if _G.Settings.Configs["Auto Haki"] and not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
                        end
                        if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
                            wait()
                            EquipWeapon(_G.Settings.Configs["Select Weapon"])
                        end
                        StartMagnet = true
                        FastAttack = true
                        vu192(v1041.HumanoidRootPart.CFrame * CFrame.new(1, 30, 0))
                        PosMon = v1041.HumanoidRootPart.CFrame
                        v1041.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                        v1041.Humanoid.JumpPower = 0
                        v1041.Humanoid.WalkSpeed = 0
                        v1041.HumanoidRootPart.CanCollide = false
                        v1041.Humanoid:ChangeState(11)
                        if _G.Settings.Boss["Auto Boss Select"] == false or (not v1041.Parent or v1041.Humanoid.Health <= 0) then
							-- goto l53
                        else
							-- goto l86
                        end
						-- ::l53::
						-- ::l18::
						-- ::l72::
						-- goto l83
						-- ::l13::
                        if not _G.Settings.Boss["Auto Quest"] then
							-- goto l39
                        end
                        CheckBossQuest()
                        if not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameBoss) then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                        end
                        if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                            repeat
                                wait()
                                vu192(CFrameQuestBoss)
                            until (CFrameQuestBoss.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 or not _G.Settings.Boss["Auto Boss Select"]
                            if (CFrameQuestBoss.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 4 then
                                wait(1.1)
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", NameQuestBoss, LevelQuestBoss)
                            end
							-- goto l36
                        end
                        if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible ~= true then
							-- goto l36
                        end
                        if not game:GetService("Workspace").Enemies:FindFirstChild(MsBoss) then
                            vu192(CFrameBoss)
							-- goto l36
                        end
                        local v1034, v1035, v1036 = pairs(game:GetService("Workspace").Enemies:GetChildren())
						-- ::l57::
                        local v1037
                        v1036, v1037 = v1034(v1035, v1036)
                        if v1036 == nil then
							-- goto l36
                        end
                        if v1037.Name ~= MsBoss then
							-- goto l55
                        else
							-- goto l17
                        end
						-- ::l55::
						-- goto l57
						-- ::l17::
						-- ::l3::
						-- ::l81::
						-- ::l60::
                        if true then
                            wait()
                            if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameBoss) then
                                if _G.Settings.Configs["Auto Haki"] and not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
                                end
                                if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
                                    wait()
                                    EquipWeapon(_G.Settings.Configs["Select Weapon"])
                                end
                                StartMagnet = true
                                FastAttack = true
                                vu192(v1037.HumanoidRootPart.CFrame * CFrame.new(1, 30, 0))
                                PosMon = v1037.HumanoidRootPart.CFrame
                                v1037.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                v1037.Humanoid.JumpPower = 0
                                v1037.Humanoid.WalkSpeed = 0
                                v1037.HumanoidRootPart.CanCollide = false
                                v1037.Humanoid:ChangeState(11)
                            else
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                            end
                        end
                        if _G.Settings.Boss["Auto Boss Select"] ~= false and (v1037.Parent and v1037.Humanoid.Health > 0) then
							-- goto l60
                        end
						-- goto l57
						-- ::l39::
                        if not game:GetService("Workspace").Enemies:FindFirstChild(MsBoss) then
                            vu192(CFrameBoss)
							-- ::l36::
                            return
                        end
                        local v1038, v1039, v1040 = pairs(game:GetService("Workspace").Enemies:GetChildren())
						-- ::l83::
                        local v1041
                        v1040, v1041 = v1038(v1039, v1040)
                        if v1040 == nil then
							-- goto l36
                        end
                        if v1041.Name ~= MsBoss then
							-- goto l20
                        else
							-- goto l23
                        end
						-- ::l20::
						-- ::l82::
						-- goto l83
						-- ::l23::
						-- goto l36
                    end)
                end
            end
        end)
        local v1042, v1043, v1044 = pairs(game:GetService("ReplicatedStorage"):GetChildren())
        local v1045 = {}
        while true do
            local v1046, v1047 = v1042(v1043, v1044)
            if v1046 == nil then
                break
            end
            v1044 = v1046
            if string.find(v1047.Name, "Boss") and v1047.Name ~= "Ice Admiral [Lv. 700] [Boss]" then
                table.insert(v1045, v1047.Name)
            end
        end
        local vu1049 = v567:Dropdown("Select Boss", v1045, callback, function(p1048)
            _G.Settings.Boss["Select Boss"] = p1048
            _G.Settings.Boss["Select Boss"] = p1048
            getgenv().SaveSetting()
        end)
        v567:Button("Refresh Boss", function()
			-- upvalues: (ref) vu1049
            vu1049:Clear()
            local v1050, v1051, v1052 = pairs(game:GetService("ReplicatedStorage"):GetChildren())
            while true do
                local v1053
                v1052, v1053 = v1050(v1051, v1052)
                if v1052 == nil then
                    break
                end
                if string.find(v1053.Name, "Boss") and v1053.Name ~= "Ice Admiral [Lv. 700] [Boss]" then
                    vu1049:Add(v1053.Name)
                end
            end
        end)
        v567:Toggle("Auto Quest", true, function(p1054)
            _G.Settings.Boss["Auto Quest"] = p1054
            getgenv().SaveSetting()
        end)
        v568:Label("Fighting Style")
        local vu1055 = false
        local vu1056 = false
        local vu1057 = false
        local vu1058 = false
        local vu1059 = false
        local vu1060 = false
        function GetAllMeleeFarm()
			-- upvalues: (ref) vu1055, (ref) vu1056, (ref) vu1057, (ref) vu1058, (ref) vu1059, (ref) vu1060
            if vu1055 == false then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                    "BuySuperhuman"
                }))
                if CheckMasteryWeapon("Superhuman", 400) == "true UpTo" then
                    vu1055 = true
                end
            end
            wait(0.5)
            if vu1056 == false then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
                if CheckMasteryWeapon("Electric Claw", 400) == "true UpTo" then
                    vu1056 = true
                end
            end
            wait(0.5)
            if vu1057 == false then
                game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyDragonTalon")
                if CheckMasteryWeapon("Dragon Talon", 400) == "true UpTo" then
                    vu1057 = true
                end
            end
            wait(0.5)
            if vu1058 == false then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                    "BuySharkmanKarate"
                }))
                if CheckMasteryWeapon("Sharkman Karate", 400) == "true UpTo" then
                    vu1058 = true
                end
            end
            wait(0.5)
            if vu1059 == false then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                    "BuyDeathStep"
                }))
                if CheckMasteryWeapon("Death Step", 400) == "true UpTo" then
                    vu1059 = true
                end
            end
            if vu1060 == false then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                    "BuyGodhuman"
                }))
                if CheckMasteryWeapon("Godhuman", 350) == "true UpTo" then
                    vu1060 = true
                end
            end
        end
        v568:Toggle("Auto God Human", _G.Settings.FightingStyle["Auto God Human"], function(p1061)
            _G.Settings.FightingStyle["Auto God Human"] = p1061
            BuyGodhuman = tonumber(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGodhuman", true))
            if BuyGodhuman and BuyGodhuman ~= 1 then
                GetAllMeleeFarm()
            end
            getgenv().SaveSetting()
        end)
        task.spawn(function()
			-- upvalues: (ref) vu1055, (ref) vu1057, (ref) vu1058, (ref) vu1059, (ref) vu1056, (ref) vu287, (ref) vu278, (ref) vu192
            while wait() do
                pcall(function()
					-- upvalues: (ref) vu1055, (ref) vu1057, (ref) vu1058, (ref) vu1059, (ref) vu1056, (ref) vu287, (ref) vu278, (ref) vu192
					-- block 737
                    if not _G.Settings.FightingStyle["Auto God Human"] then
						-- ::l3::
                        return
                    end
                    BuyGodhuman = tonumber(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGodhuman", true))
                    if BuyGodhuman and BuyGodhuman == 1 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGodhuman")
                        _G.Settings.FightingStyle["Auto God Human"] = false
                    end
                    if not HasTalon then
                        BuyDragonTalon = tonumber(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon", true))
                        if BuyDragonTalon and BuyDragonTalon == 1 then
                            HasTalon = true
                        end
                    end
                    if not HasSuperhuman then
                        BuySuperhuman = tonumber(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman", true))
                        if BuySuperhuman and BuySuperhuman == 1 then
                            HasSuperhuman = true
                        end
                    end
                    if not HasKarate then
                        BuySharkmanKarate = tonumber(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate", true))
                        if BuySharkmanKarate and BuySharkmanKarate == 1 then
                            HasKarate = true
                        end
                    end
                    if not HasDeathStep then
                        BuyDeathStep = tonumber(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep", true))
                        if BuyDeathStep and BuyDeathStep == 1 then
                            HasDeathStep = true
                        end
                    end
                    if not HasElectricClaw then
                        BuyElectricClaw = tonumber(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw", true))
                        if BuyElectricClaw and BuyElectricClaw == 1 then
                            HasElectricClaw = true
                        end
                    end
                    if HasSuperhuman then
                        if HasKarate then
                            if HasDeathStep then
                                if HasTalon then
                                    if not HasElectricClaw and game.Players.LocalPlayer:FindFirstChild("WeaponAssetCache") then
                                        _G.Settings.Configs["Select Weapon"] = GetFightingStyle("Melee")
                                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") and game.Players.LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value >= 400 then
                                            if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw", true) ~= 4 then
                                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
                                            elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw", "Start") == nil then
                                                game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(- 12548, 337, - 7481)
                                            end
                                        end
                                        if game.Players.LocalPlayer.Character:FindFirstChild("Electro") and game.Players.LocalPlayer.Character:FindFirstChild("Electro").Level.Value >= 400 then
                                            if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw", true) ~= 4 then
                                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
                                            elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw", "Start") == nil then
                                                game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(- 12548, 337, - 7481)
                                            end
                                        end
                                    end
                                elseif game.Players.LocalPlayer:FindFirstChild("WeaponAssetCache") then
                                    _G.Settings.Configs["Select Weapon"] = GetFightingStyle("Melee")
                                    if game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") and (game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw").Level.Value >= 400 and game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Health > 0) then
                                        if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon", true) ~= 3 then
                                            if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon", true) ~= 1 then
                                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones", "Buy", 1, 1)
                                            else
                                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon")
                                            end
                                        else
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones", "Buy", 1, 1)
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon", true)
                                        end
                                    end
                                    if game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw") and (game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw").Level.Value >= 400 and game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Health > 0) then
                                        if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon", true) ~= 3 then
                                            if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon", true) ~= 1 then
                                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones", "Buy", 1, 1)
                                            else
                                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon")
                                            end
                                        else
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones", "Buy", 1, 1)
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon", true)
                                        end
                                    end
                                end
                            elseif game.Players.LocalPlayer:FindFirstChild("WeaponAssetCache") then
                                if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value >= 400 then
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                                        "BuyDeathStep"
                                    }))
                                end
                                if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 400 then
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                                        "BuyDeathStep"
                                    }))
                                end
                                _G.Settings.Configs["Select Weapon"] = GetFightingStyle("Melee")
                            end
                        elseif game.Players.LocalPlayer:FindFirstChild("WeaponAssetCache") then
                            if not (game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") or (game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate") or (game.Players.LocalPlayer.Backpack:FindFirstChild("Sharkman Karate") or game.Players.LocalPlayer.Character:FindFirstChild("Sharkman Karate")))) then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                                    "BuyFishmanKarate"
                                }))
                            end
                            if game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") and game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate").Level.Value >= 400 then
                                if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate", true) ~= "I lost my house keys, could you help me find them? Thanks." or (game.Players.LocalPlayer.Character:FindFirstChild("Water Key") or game.Players.LocalPlayer.Backpack:FindFirstChild("Water Key")) then
                                    if tonumber(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate", true)) ~= 1 then
                                        if game.Players.LocalPlayer.Character:FindFirstChild("Water Key") or game.Players.LocalPlayer.Backpack:FindFirstChild("Water Key") then
                                            KillSharkMan = false
                                            if Auto_Farm_Level then
                                                _G.Settings.Main["Auto Farm Level"] = true
                                            end
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                                                "BuySharkmanKarate"
                                            }))
                                        end
                                    else
                                        KillSharkMan = false
                                        if Auto_Farm_Level then
                                            _G.Settings.Main["Auto Farm Level"] = true
                                        end
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                                            "BuySharkmanKarate"
                                        }))
                                    end
                                elseif World2 then
                                    KillSharkMan = true
                                    if Auto_Farm_Level then
                                        _G.Settings.Main["Auto Farm Level"] = false
                                    end
                                else
                                    KillSharkMan = false
                                    if Auto_Farm_Level then
                                        _G.Settings.Main["Auto Farm Level"] = true
                                    end
                                end
                            end
                            if game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate") and game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate").Level.Value >= 400 then
                                if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate", true) ~= "I lost my house keys, could you help me find them? Thanks." or (game.Players.LocalPlayer.Character:FindFirstChild("Water Key") or game.Players.LocalPlayer.Backpack:FindFirstChild("Water Key")) then
                                    if tonumber(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate", true)) ~= 1 then
                                        if game.Players.LocalPlayer.Character:FindFirstChild("Water Key") or game.Players.LocalPlayer.Backpack:FindFirstChild("Water Key") then
                                            KillSharkMan = false
                                            if Auto_Farm_Level then
                                                _G.Settings.Main["Auto Farm Level"] = true
                                            end
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                                                "BuySharkmanKarate"
                                            }))
                                        end
                                    else
                                        KillSharkMan = false
                                        if Auto_Farm_Level then
                                            _G.Settings.Main["Auto Farm Level"] = true
                                        end
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                                            "BuySharkmanKarate"
                                        }))
                                    end
                                elseif World2 then
                                    KillSharkMan = true
                                    if Auto_Farm_Level then
                                        _G.Settings.Main["Auto Farm Level"] = false
                                    end
                                else
                                    if Auto_Farm_Level then
                                        _G.Settings.Main["Auto Farm Level"] = true
                                    end
                                    KillSharkMan = false
                                end
                            end
                            _G.Settings.Configs["Select Weapon"] = GetFightingStyle("Melee")
                        end
                    elseif game.Players.LocalPlayer:FindFirstChild("WeaponAssetCache") then
                        if not (game.Players.LocalPlayer.Backpack:FindFirstChild("Combat") or (game.Players.LocalPlayer.Character:FindFirstChild("Combat") or (game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") or (game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") or (game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") or (game.Players.LocalPlayer.Character:FindFirstChild("Electro") or (game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") or (game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate") or (game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") or (game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw") or (game.Players.LocalPlayer.Backpack:FindFirstChild("Superhuman") or game.Players.LocalPlayer.Character:FindFirstChild("Superhuman")))))))))))) then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                                "BuyElectro"
                            }))
                        end
                        _G.Settings.Configs["Select Weapon"] = GetFightingStyle("Melee")
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Combat") or game.Players.LocalPlayer.Character:FindFirstChild("Combat") then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                                "BuyElectro"
                            }))
                        end
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") and game.Players.LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value >= 300 then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                                "BuyBlackLeg"
                            }))
                        end
                        if game.Players.LocalPlayer.Character:FindFirstChild("Electro") and game.Players.LocalPlayer.Character:FindFirstChild("Electro").Level.Value >= 300 then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                                "BuyBlackLeg"
                            }))
                        end
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value >= 300 then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                                "BuyFishmanKarate"
                            }))
                        end
                        if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 300 then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                                "BuyFishmanKarate"
                            }))
                        end
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") and game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate").Level.Value >= 300 then
                            HaveDragonClaw = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                                "BlackbeardReward",
                                "DragonClaw",
                                "2"
                            }))
                            if _G.Settings.FightingStyle["Auto God Human"] and (game.Players.LocalPlayer.Data.Fragments.Value <= 1500 and HaveDragonClaw == 0) then
                                if game.Players.LocalPlayer.Data.Level.Value > 1100 and Auto_Farm_Level then
                                    _G.Settings.Main["Auto Farm Level"] = false
                                end
                            else
                                if Auto_Farm_Level then
                                    _G.Settings.Main["Auto Farm Level"] = true
                                end
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                                    "BlackbeardReward",
                                    "DragonClaw",
                                    "2"
                                }))
                            end
                        end
                        if game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate") and game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate").Level.Value >= 300 then
                            HaveDragonClaw = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                                "BlackbeardReward",
                                "DragonClaw",
                                "2"
                            }))
                            if _G.Settings.FightingStyle["Auto God Human"] and (game.Players.LocalPlayer.Data.Fragments.Value <= 1500 and HaveDragonClaw == 0) then
                                if game.Players.LocalPlayer.Data.Level.Value > 1100 and Auto_Farm_Level then
                                    _G.Settings.Main["Auto Farm Level"] = false
                                end
                            else
                                if Auto_Farm_Level then
                                    _G.Settings.Main["Auto Farm Level"] = true
                                end
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                                    "BlackbeardReward",
                                    "DragonClaw",
                                    "2"
                                }))
                                if Auto_Farm_Level then
                                    _G.Settings.Main["Auto Farm Level"] = true
                                end
                            end
                        end
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") and game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw").Level.Value >= 300 then
                            if Auto_Farm_Level then
                                _G.Settings.Main["Auto Farm Level"] = true
                            end
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                                "BuySuperhuman"
                            }))
                        end
                        if game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw") and game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw").Level.Value >= 300 then
                            if Auto_Farm_Level then
                                _G.Settings.Main["Auto Farm Level"] = true
                            end
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                                "BuySuperhuman"
                            }))
                        end
                    end
                    if BuyGodhuman ~= 1 and (HasSuperhuman and (HasTalon and (HasKarate and (HasDeathStep and HasElectricClaw)))) then
                        if HasSuperhuman and not vu1055 then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                                "BuySuperhuman"
                            }))
                            wait(0.2)
                            if CheckMasteryWeapon("Superhuman", 400) == "true UpTo" or CheckMasteryWeapon("Superhuman", 400) == "true" and vu1055 == false then
                                vu1055 = true
                            end
                        elseif HasTalon and not vu1057 then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                                "BuyDragonTalon"
                            }))
                            wait(0.2)
                            if CheckMasteryWeapon("Dragon Talon", 400) == "true UpTo" or CheckMasteryWeapon("Superhuman", 400) == "true" and vu1057 == false then
                                vu1057 = true
                            end
                        elseif HasKarate and not vu1058 then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                                "BuySharkmanKarate"
                            }))
                            wait(0.2)
                            if CheckMasteryWeapon("Sharkman Karate", 400) == "true UpTo" or CheckMasteryWeapon("Superhuman", 400) == "true" and vu1058 == false then
                                vu1058 = true
                            end
                        elseif HasDeathStep and not vu1059 then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                                "BuyDeathStep"
                            }))
                            wait(0.2)
                            if CheckMasteryWeapon("Death Step", 400) == "true UpTo" or CheckMasteryWeapon("Superhuman", 400) == "true" and vu1059 == false then
                                vu1059 = true
                            end
                        elseif HasElectricClaw and not vu1056 then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                                "BuyElectricClaw"
                            }))
                            wait(0.2)
                            if CheckMasteryWeapon("Electric Claw", 400) == "true UpTo" or CheckMasteryWeapon("Superhuman", 400) == "true" and vu1056 == false then
                                vu1056 = true
                            end
                        end
                    end
                    if BuyGodhuman == 1 or not (vu1055 and (vu1056 and (vu1057 and (vu1058 and vu1059)))) or game.Players.LocalPlayer.Character:FindFirstChild("Godhuman") and game.Players.LocalPlayer.Backpack:FindFirstChild("Godhuman") then
						-- goto l3
                    end
                    if GetMaterial("Fish Tail") >= 20 then
						-- goto l386
                    end
                    if not World1 then
                        Com("F_", "TravelMain")
						-- goto l3
                    end
                    if not World1 then
						-- goto l3
                    end
                    if Auto_Farm_Level then
                        _G.Settings.Main["Auto Farm Level"] = false
                    end
                    vu287("Fish Tail")
                    if not vu278(MaterialMob) then
                        StartMagnet = false
                        FastAttack = false
                        Modstween = vu192(CFrameMon.Position, CFrameMon)
                        if World1 and table.find(MaterialMob, "Fishman Commando [Lv. 400]") and (CFrameMon.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 50000 then
                            if Modstween then
                                Modstween:Stop()
                            end
                            wait(0.5)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
                        elseif World1 and not table.find(MaterialMob, "Fishman Commando [Lv. 400]") and (CFrameMon.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 50000 then
                            if Modstween then
                                Modstween:Stop()
                            end
                            wait(0.5)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(3864.8515625, 6.6796875, - 1926.7841796875))
                        elseif World1 and table.find(MaterialMob, "God\'s Guard [Lv. 450]") and (CFrameMon.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 3000 then
                            if Modstween then
                                Modstween:Stop()
                            end
                            wait(0.5)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(- 4607.8227539063, 872.54248046875, - 1667.5568847656))
                        elseif (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 150 then
                            if Modstween then
                                Modstween:Stop()
                            end
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
                        end
						-- goto l3
                    end
                    local v1062, v1063, v1064 = pairs(game:GetService("Workspace").Enemies:GetChildren())
					-- ::l664::
					-- goto l415
					-- ::l386::
                    if GetMaterial("Magma Ore") < 20 then
						-- goto l390
                    end
                    if GetMaterial("Dragon Scale") < 10 then
						-- goto l393
                    end
                    if GetMaterial("Mystic Droplet") >= 10 then
                        Com("F_", "BuyGodhuman")
                        BuyGodhuman = tonumber(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGodhuman", true))
                        if BuyGodhuman and BuyGodhuman == 1 then
                            _G.Settings.FightingStyle["Auto God Human"] = false
                        end
                        if Auto_Farm_Level then
                            _G.Settings.Main["Auto Farm Level"] = true
                        end
						-- goto l3
                    end
                    if not World2 then
                        Com("F_", "TravelDressrosa")
						-- goto l3
                    end
                    if not World2 then
						-- goto l3
                    end
                    if Auto_Farm_Level then
                        _G.Settings.Main["Auto Farm Level"] = false
                    end
                    vu287("Mystic Droplet")
                    if not vu278(MaterialMob) then
                        FastAttack = false
                        StartMagnet = false
                        Modstween = vu192(CFrameMon.Position, CFrameMon)
                        if World1 and table.find(MaterialMob, "Fishman Commando [Lv. 400]") and (CFrameMon.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 50000 then
                            if Modstween then
                                Modstween:Stop()
                            end
                            wait(0.5)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
                        elseif World1 and not table.find(MaterialMob, "Fishman Commando [Lv. 400]") and (CFrameMon.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 50000 then
                            if Modstween then
                                Modstween:Stop()
                            end
                            wait(0.5)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(3864.8515625, 6.6796875, - 1926.7841796875))
                        elseif World1 and table.find(MaterialMob, "God\'s Guard [Lv. 450]") and (CFrameMon.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 3000 then
                            if Modstween then
                                Modstween:Stop()
                            end
                            wait(0.5)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(- 4607.8227539063, 872.54248046875, - 1667.5568847656))
                        elseif (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 150 then
                            if Modstween then
                                Modstween:Stop()
                            end
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
                        end
						-- goto l3
                    end
                    local v1065, v1066, v1067 = pairs(game:GetService("Workspace").Enemies:GetChildren())
					-- goto l415
					-- ::l390::
                    if not World1 then
                        Com("F_", "TravelMain")
						-- goto l3
                    end
                    if not World1 then
						-- goto l3
                    end
                    if Auto_Farm_Level then
                        _G.Settings.Main["Auto Farm Level"] = false
                    end
                    vu287("Magma Ore")
                    if not vu278(MaterialMob) then
                        StartMagnet = false
                        FastAttack = false
                        Modstween = vu192(CFrameMon.Position, CFrameMon)
                        if World1 and table.find(MaterialMob, "Fishman Commando [Lv. 400]") and (CFrameMon.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 50000 then
                            if Modstween then
                                Modstween:Stop()
                            end
                            wait(0.5)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
                        elseif World1 and not table.find(MaterialMob, "Fishman Commando [Lv. 400]") and (CFrameMon.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 50000 then
                            if Modstween then
                                Modstween:Stop()
                            end
                            wait(0.5)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(3864.8515625, 6.6796875, - 1926.7841796875))
                        elseif World1 and table.find(MaterialMob, "God\'s Guard [Lv. 450]") and (CFrameMon.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 3000 then
                            if Modstween then
                                Modstween:Stop()
                            end
                            wait(0.5)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(- 4607.8227539063, 872.54248046875, - 1667.5568847656))
                        elseif (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 150 then
                            if Modstween then
                                Modstween:Stop()
                            end
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
                        end
						-- goto l3
                    end
                    local v1068, v1069, v1070 = pairs(game:GetService("Workspace").Enemies:GetChildren())
					-- goto l581
					-- ::l3::
					-- goto l664
					-- ::l393::
                    if not World3 then
                        Com("F_", "TravelZou")
						-- goto l3
                    end
                    if not World3 then
						-- goto l3
                    end
                    if Auto_Farm_Level then
                        _G.Settings.Main["Auto Farm Level"] = false
                    end
                    vu287("Dragon Scale")
                    if not vu278(MaterialMob) then
                        StartMagnet = false
                        FastAttack = false
                        Modstween = vu192(CFrameMon.Position, CFrameMon)
                        if World1 and table.find(MaterialMob, "Fishman Commando [Lv. 400]") and (CFrameMon.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 50000 then
                            if Modstween then
                                Modstween:Stop()
                            end
                            wait(0.5)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
                        elseif World1 and not table.find(MaterialMob, "Fishman Commando [Lv. 400]") and (CFrameMon.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 50000 then
                            if Modstween then
                                Modstween:Stop()
                            end
                            wait(0.5)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(3864.8515625, 6.6796875, - 1926.7841796875))
                        elseif World1 and table.find(MaterialMob, "God\'s Guard [Lv. 450]") and (CFrameMon.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 3000 then
                            if Modstween then
                                Modstween:Stop()
                            end
                            wait(0.5)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(- 4607.8227539063, 872.54248046875, - 1667.5568847656))
                        elseif (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 150 then
                            if Modstween then
                                Modstween:Stop()
                            end
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
                        end
						-- goto l3
                    end
                    local v1071, v1072, v1073 = pairs(game:GetService("Workspace").Enemies:GetChildren())
					-- goto l498
					-- ::l2::
					-- goto l592
					-- ::l387::
					-- goto l581
					-- ::l389::
					-- goto l527
					-- ::l392::
					-- goto l389
					-- ::l406::
					-- goto l489
					-- ::l408::
					-- goto l491
					-- ::l413::
					-- goto l488
					-- ::l414::
					-- goto l392
					-- ::l426::
                    wait()
                    FarmtoTarget = vu192(v1074.HumanoidRootPart.CFrame * CFrame.new(0, 30, 1))
                    if v1074:FindFirstChild("HumanoidRootPart") and (v1074:FindFirstChild("Humanoid") and (v1074.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 150) then
                        if FarmtoTarget then
                            FarmtoTarget:Stop()
                        end
                        FastAttack = true
                        EquipWeapon(_G.Settings.Configs["Select Weapon"])
                        StartMagnet = true
                        PosMon = v1074.HumanoidRootPart.CFrame
                        if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 150 then
                            game:service("VirtualInputManager"):SendKeyEvent(true, "V", false, game)
                            game:service("VirtualInputManager"):SendKeyEvent(false, "V", false, game)
                        end
                        vu192(v1074.HumanoidRootPart.CFrame * CFrame.new(0, _G.Settings.Configs["Distance Auto Farm"], 0))
                    end
                    if vu278(MaterialMob) and (_G.Settings.FightingStyle["Auto God Human"] and (v1074.Humanoid.Health > 0 and v1074.Parent)) then
						-- goto l426
                    end
                    FastAttack = false
                    StartMagnet = false
					-- ::l415::
                    local v1074
                    v1067, v1074 = v1065(v1066, v1067)
                    if v1067 == nil then
						-- goto l3
                    end
                    if _G.Settings.FightingStyle["Auto God Human"] and (table.find(MaterialMob, v1074.Name) and (v1074:FindFirstChild("HumanoidRootPart") and (v1074:FindFirstChild("Humanoid") and v1074.Humanoid.Health > 0))) then
						-- goto l496
                    else
						-- goto l497
                    end
					-- ::l429::
					-- goto l665
					-- ::l444::
					-- goto l595
					-- ::l488::
					-- goto l571
					-- ::l489::
					-- goto l572
					-- ::l491::
					-- goto l574
					-- ::l496::
					-- goto l512
					-- ::l497::
					-- goto l580
					-- ::l509::
                    wait()
                    FarmtoTarget = vu192(v1075.HumanoidRootPart.CFrame * CFrame.new(0, _G.Settings.Configs["Distance Auto Farm"], 0))
                    if v1075:FindFirstChild("HumanoidRootPart") and (v1075:FindFirstChild("Humanoid") and (v1075.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 150) then
                        if FarmtoTarget then
                            FarmtoTarget:Stop()
                        end
                        FastAttack = true
                        EquipWeapon(_G.Settings.Configs["Select Weapon"])
                        StartMagnet = true
                        PosMon = v1075.HumanoidRootPart.CFrame
                        if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 150 then
                            game:service("VirtualInputManager"):SendKeyEvent(true, "V", false, game)
                            game:service("VirtualInputManager"):SendKeyEvent(false, "V", false, game)
                        end
                        vu192(v1075.HumanoidRootPart.CFrame * CFrame.new(0, _G.Settings.Configs["Distance Auto Farm"], 0))
                    end
                    if vu278(MaterialMob) and (_G.Settings.FightingStyle["Auto God Human"] and (v1075.Humanoid.Health > 0 and v1075.Parent)) then
						-- goto l509
                    end
                    FastAttack = false
                    StartMagnet = false
					-- ::l498::
                    local v1075
                    v1073, v1075 = v1071(v1072, v1073)
                    if v1073 == nil then
						-- goto l3
                    end
                    if _G.Settings.FightingStyle["Auto God Human"] and (table.find(MaterialMob, v1075.Name) and (v1075:FindFirstChild("HumanoidRootPart") and (v1075:FindFirstChild("Humanoid") and v1075.Humanoid.Health > 0))) then
						-- goto l406
                    else
						-- goto l408
                    end
					-- ::l512::
					-- goto l429
					-- ::l527::
					-- goto l444
					-- ::l571::
					-- goto l654
					-- ::l572::
					-- goto l579
					-- ::l574::
					-- goto l655
					-- ::l579::
					-- goto l509
					-- ::l580::
					-- goto l678
					-- ::l592::
                    wait()
                    FarmtoTarget = vu192(v1076.HumanoidRootPart.CFrame * CFrame.new(0, _G.Settings.Configs["Distance Auto Farm"], 0))
                    if v1076:FindFirstChild("HumanoidRootPart") and (v1076:FindFirstChild("Humanoid") and (v1076.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 150) then
                        if FarmtoTarget then
                            FarmtoTarget:Stop()
                        end
                        FastAttack = true
                        EquipWeapon(_G.Settings.Configs["Select Weapon"])
                        StartMagnet = true
                        PosMon = v1076.HumanoidRootPart.CFrame
                        if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 150 then
                            game:service("VirtualInputManager"):SendKeyEvent(true, "V", false, game)
                            game:service("VirtualInputManager"):SendKeyEvent(false, "V", false, game)
                        end
                        vu192(v1076.HumanoidRootPart.CFrame * CFrame.new(0, _G.Settings.Configs["Distance Auto Farm"], 0))
                    end
                    if vu278(MaterialMob) and (_G.Settings.FightingStyle["Auto God Human"] and (v1076.Humanoid.Health > 0 and v1076.Parent)) then
						-- goto l592
                    end
                    FastAttack = false
                    StartMagnet = false
					-- ::l581::
                    local v1076
                    v1070, v1076 = v1068(v1069, v1070)
                    if v1070 == nil then
						-- goto l3
                    end
                    if _G.Settings.FightingStyle["Auto God Human"] and (table.find(MaterialMob, v1076.Name) and (v1076:FindFirstChild("HumanoidRootPart") and (v1076:FindFirstChild("Humanoid") and v1076.Humanoid.Health > 0))) then
						-- goto l413
                    else
						-- goto l414
                    end
					-- ::l595::
					-- goto l610
					-- ::l610::
					-- goto l387
					-- ::l654::
					-- goto l657
					-- ::l655::
					-- goto l693
					-- ::l657::
					-- goto l663
					-- ::l662::
					-- goto l2
					-- ::l663::
					-- goto l662
					-- ::l665::
					-- goto l426
					-- ::l675::
                    wait()
                    FarmtoTarget = vu192(v1077.HumanoidRootPart.CFrame * CFrame.new(0, _G.Settings.Configs["Distance Auto Farm"], 0))
                    if v1077:FindFirstChild("HumanoidRootPart") and (v1077:FindFirstChild("Humanoid") and (v1077.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 150) then
                        if FarmtoTarget then
                            FarmtoTarget:Stop()
                        end
                        FastAttack = true
                        EquipWeapon(_G.Settings.Configs["Select Weapon"])
                        StartMagnet = true
                        PosMon = v1077.HumanoidRootPart.CFrame
                        if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 150 then
                            game:service("VirtualInputManager"):SendKeyEvent(true, "V", false, game)
                            game:service("VirtualInputManager"):SendKeyEvent(false, "V", false, game)
                        end
                        vu192(v1077.HumanoidRootPart.CFrame * CFrame.new(0, _G.Settings.Configs["Distance Auto Farm"], 0))
                    end
                    if vu278(MaterialMob) and (_G.Settings.FightingStyle["Auto God Human"] and (v1077.Humanoid.Health > 0 and v1077.Parent)) then
						-- goto l675
                    end
                    FastAttack = false
                    StartMagnet = false
					-- ::l664::
                    local v1077
                    v1064, v1077 = v1062(v1063, v1064)
                    if v1064 == nil then
						-- goto l3
                    end
                    if _G.Settings.FightingStyle["Auto God Human"] and (table.find(MaterialMob, v1077.Name) and (v1077:FindFirstChild("HumanoidRootPart") and (v1077:FindFirstChild("Humanoid") and v1077.Humanoid.Health > 0))) then
						-- goto l675
                    else
						-- goto l3
                    end
					-- ::l678::
					-- goto l664
					-- ::l693::
					-- goto l498
                end)
            end
        end)
        task.spawn(function()
			-- upvalues: (ref) vu192
            while wait() do
                pcall(function()
					-- upvalues: (ref) vu192
					-- block 72
                    if not (_G.Settings.FightingStyle["Auto God Human"] and World2) then
						-- ::l3::
                        return
                    end
                    if not (game.Workspace.Enemies:FindFirstChild("Tide Keeper [Lv. 1475] [Boss]") or game.ReplicatedStorage:FindFirstChild("Tide Keeper [Lv. 1475] [Boss]")) then
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Tide Keeper [Lv. 1475] [Boss]") then
                            KillFish = vu192(game:GetService("ReplicatedStorage"):FindFirstChild("Tide Keeper [Lv. 1475] [Boss]").HumanoidRootPart.CFrame)
                        elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate", true) == "I lost my house keys, could you help me find them? Thanks." then
                            Fast_Hop()
                        end
						-- goto l3
                    end
                    if KillSharkMan ~= true or game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate", true) ~= "I lost my house keys, could you help me find them? Thanks." then
						-- goto l3
                    end
                    if KillFish then
                        KillFish:Stop()
                    end
                    Com("F_", "SetSpawnPoint")
                    local v1078, v1079, v1080 = pairs(game.Workspace.Enemies:GetChildren())
					-- goto l18
					-- ::l21::
                    wait()
                    if game.Workspace.Enemies:FindFirstChild(v1081.Name) then
                        if (v1081.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 200 then
                            if (v1081.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 200 then
                                if Farmtween then
                                    Farmtween:Stop()
                                end
                                FastAttack = true
                                if _G.Settings.Configs["Auto Haki"] and not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
                                end
                                if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
                                    wait()
                                    EquipWeapon(_G.Settings.Configs["Select Weapon"])
                                end
                                if not _G.Settings.Configs["Fast Attack"] then
                                    game:GetService("VirtualUser"):CaptureController()
                                    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                end
                                v1081.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                if _G.Settings.Configs["Show Hitbox"] then
                                    v1081.HumanoidRootPart.Transparency = tonumber(_G.Hitbox_LocalTransparency)
                                else
                                    v1081.HumanoidRootPart.Transparency = 1
                                end
                                v1081.Humanoid.JumpPower = 0
                                v1081.Humanoid.WalkSpeed = 0
                                v1081.HumanoidRootPart.CanCollide = false
                                v1081.Humanoid:ChangeState(11)
                                vu192(v1081.HumanoidRootPart.CFrame * CFrame.new(0, _G.Settings.Configs["Distance Auto Farm"], 0))
                                if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 150 then
                                    game:service("VirtualInputManager"):SendKeyEvent(true, "V", false, game)
                                    game:service("VirtualInputManager"):SendKeyEvent(false, "V", false, game)
                                end
                            end
                        else
                            Farmtween = vu192(v1081.HumanoidRootPart.CFrame)
                        end
                    end
                    if v1081.Parent and (_G.Settings.FightingStyle["Auto God Human"] and (KillSharkMan ~= false and v1081.Humanoid.Health ~= 0)) and not (game.Players.LocalPlayer.Character:FindFirstChild("Water Key") or game.Players.LocalPlayer.Backpack:FindFirstChild("Water Key")) then
						-- goto l21
                    end
                    FastAttack = false
					-- ::l18::
                    local v1081
                    v1080, v1081 = v1078(v1079, v1080)
                    if v1080 == nil then
						-- goto l3
                    end
                    if v1081.Name ~= "Tide Keeper [Lv. 1475] [Boss]" then
						-- goto l18
                    else
						-- goto l21
                    end
                end)
            end
        end)
        v568:Toggle("Auto Superhuman", _G.Settings.FightingStyle["Auto Superhuman"], function(p1082)
            _G.Settings.FightingStyle["Auto Superhuman"] = p1082
            getgenv().SaveSetting()
        end)
        task.spawn(function()
            while wait() do
                pcall(function()
                    if _G.Settings.FightingStyle["Auto Superhuman"] and game.Players.LocalPlayer:FindFirstChild("WeaponAssetCache") then
                        if not (game.Players.LocalPlayer.Backpack:FindFirstChild("Combat") or (game.Players.LocalPlayer.Character:FindFirstChild("Combat") or (game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") or (game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") or (game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") or (game.Players.LocalPlayer.Character:FindFirstChild("Electro") or (game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") or (game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate") or (game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") or (game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw") or (game.Players.LocalPlayer.Backpack:FindFirstChild("Superhuman") or game.Players.LocalPlayer.Character:FindFirstChild("Superhuman")))))))))))) then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                                "BuyElectro"
                            }))
                        end
                        _G.Settings.Configs["Select Weapon"] = GetFightingStyle("Melee")
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Combat") or game.Players.LocalPlayer.Character:FindFirstChild("Combat") then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                                "BuyElectro"
                            }))
                        end
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") and game.Players.LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value >= 300 then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                                "BuyBlackLeg"
                            }))
                        end
                        if game.Players.LocalPlayer.Character:FindFirstChild("Electro") and game.Players.LocalPlayer.Character:FindFirstChild("Electro").Level.Value >= 300 then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                                "BuyBlackLeg"
                            }))
                        end
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value >= 300 then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                                "BuyFishmanKarate"
                            }))
                        end
                        if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 300 then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                                "BuyFishmanKarate"
                            }))
                        end
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") and game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate").Level.Value >= 300 then
                            HaveDragonClaw = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                                "BlackbeardReward",
                                "DragonClaw",
                                "2"
                            }))
                            if _G.Settings.FightingStyle["Auto Superhuman"] and (game.Players.LocalPlayer.Data.Fragments.Value <= 1500 and HaveDragonClaw == 0) then
                                if game.Players.LocalPlayer.Data.Level.Value > 1100 then
                                    _G.Settings.Raids["Select Raids"] = "Flame"
                                    _G.Settings.Raids["Auto Raids"] = true
                                    if Auto_Farm_Level then
                                        _G.Settings.Main["Auto Farm Level"] = false
                                    end
                                end
                            else
                                _G.Settings.Raids["Auto Raids"] = false
                                if Auto_Farm_Level then
                                    _G.Settings.Main["Auto Farm Level"] = true
                                end
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                                    "BlackbeardReward",
                                    "DragonClaw",
                                    "2"
                                }))
                                _G.Settings.Raids["Auto Raids"] = false
                                if Auto_Farm_Level then
                                    _G.Settings.Main["Auto Farm Level"] = true
                                end
                            end
                        end
                        if game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate") and game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate").Level.Value >= 300 then
                            HaveDragonClaw = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                                "BlackbeardReward",
                                "DragonClaw",
                                "2"
                            }))
                            if _G.Settings.FightingStyle["Auto Superhuman"] and (game.Players.LocalPlayer.Data.Fragments.Value <= 1500 and HaveDragonClaw == 0) then
                                if game.Players.LocalPlayer.Data.Level.Value > 1100 then
                                    _G.Settings.Raids["Select Raids"] = "Flame"
                                    _G.Settings.Raids["Auto Raids"] = true
                                    if Auto_Farm_Level then
                                        _G.Settings.Main["Auto Farm Level"] = false
                                    end
                                end
                            else
                                _G.Settings.Raids["Auto Raids"] = false
                                if Auto_Farm_Level then
                                    _G.Settings.Main["Auto Farm Level"] = true
                                end
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                                    "BlackbeardReward",
                                    "DragonClaw",
                                    "2"
                                }))
                                _G.Settings.Raids["Auto Raids"] = false
                                if Auto_Farm_Level then
                                    _G.Settings.Main["Auto Farm Level"] = true
                                end
                            end
                        end
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") and game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw").Level.Value >= 300 then
                            Auto_Farm_Level = _G.Settings.Main["Auto Farm Level"]
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                                "BuySuperhuman"
                            }))
                        end
                        if game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw") and game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw").Level.Value >= 300 then
                            Auto_Farm_Level = _G.Settings.Main["Auto Farm Level"]
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                                "BuySuperhuman"
                            }))
                        end
                    end
                end)
            end
        end)
        v568:Toggle("Auto Electric Claw", _G.Settings.FightingStyle["Auto Electric Claw"], function(p1083)
            _G.Settings.FightingStyle["Auto Electric Claw"] = p1083
            getgenv().SaveSetting()
            if _G.Settings.FightingStyle["Auto Electric Claw"] then
                Com("F_", "BuyElectro")
            end
        end)
        task.spawn(function()
            while wait() do
                pcall(function()
                    if _G.Settings.FightingStyle["Auto Electric Claw"] and game.Players.LocalPlayer:FindFirstChild("WeaponAssetCache") then
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") and game.Players.LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value < 400 then
                            _G.Settings.Configs["Select Weapon"] = "Electro"
                        end
                        if game.Players.LocalPlayer.Character:FindFirstChild("Electro") and game.Players.LocalPlayer.Character:FindFirstChild("Electro").Level.Value < 400 then
                            _G.Settings.Configs["Select Weapon"] = "Electro"
                        end
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") and game.Players.LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value >= 400 then
                            if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyElectricClaw", true) ~= 4 then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
                            elseif game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyElectricClaw", "Start") == nil then
                                game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(- 12548, 337, - 7481)
                            end
                        end
                        if game.Players.LocalPlayer.Character:FindFirstChild("Electro") and game.Players.LocalPlayer.Character:FindFirstChild("Electro").Level.Value >= 400 then
                            if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyElectricClaw", true) ~= 4 then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
                            elseif game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyElectricClaw", "Start") == nil then
                                game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(- 12548, 337, - 7481)
                            end
                        end
                    end
                end)
            end
        end)
        v568:Toggle("Auto Death Step", _G.Settings.FightingStyle["Auto Fully Death Step"], function(p1084)
            _G.Settings.FightingStyle["Auto Fully Death Step"] = p1084
            getgenv().SaveSetting()
        end)
        task.spawn(function()
			-- upvalues: (ref) vu192
            while wait() do
                pcall(function()
					-- upvalues: (ref) vu192
					-- block 108
                    if _G.Settings.FightingStyle["Auto Death Step"] then
                        if game.Players.LocalPlayer:FindFirstChild("WeaponAssetCache") then
                            if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value >= 400 then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                                    "BuyDeathStep"
                                }))
                                _G.Settings.Configs["Select Weapon"] = "Death Step"
                            end
                            if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 400 then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                                    "BuyDeathStep"
                                }))
                                _G.Settings.Configs["Select Weapon"] = "Death Step"
                            end
                            if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value < 400 then
                                _G.Settings.Configs["Select Weapon"] = "Black Leg"
                            end
                        end
						-- goto l6
                    end
                    if not _G.Settings.FightingStyle["Auto Fully Death Step"] then
						-- ::l6::
                        return
                    end
                    if (not game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") or game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value < 400) and (not game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") or game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value < 400) then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBlackLeg")
						-- goto l6
                    end
                    if game:GetService("Workspace").Map.IceCastle.Hall.LibraryDoor.PhoeyuDoor.Transparency ~= 0 then
						-- goto l6
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Library Key") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Library Key") then
                        EquipWeapon("Library Key")
                        repeat
                            wait()
                            vu192(CFrame.new(6371.2001953125, 296.63433837890625, - 6841.18115234375))
                        until (CFrame.new(6371.2001953125, 296.63433837890625, - 6841.18115234375).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 or not _G.Settings.FightingStyle["Auto Death Step"]
                        if (CFrame.new(6371.2001953125, 296.63433837890625, - 6841.18115234375).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 then
                            wait(1.2)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep", true)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep")
                            wait(0.5)
                        end
						-- goto l6
                    end
                    if (not game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") or game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value < 450) and (not game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") or game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value < 450) or not (game:GetService("ReplicatedStorage"):FindFirstChild("Awakened Ice Admiral [Lv. 1400] [Boss]") or game:GetService("Workspace").Enemies:FindFirstChild("Awakened Ice Admiral [Lv. 1400] [Boss]")) then
						-- goto l6
                    end
                    if not game:GetService("Workspace").Enemies:FindFirstChild("Awakened Ice Admiral [Lv. 1400] [Boss]") then
                        vu192(game:GetService("ReplicatedStorage"):FindFirstChild("Awakened Ice Admiral [Lv. 1400] [Boss]").HumanoidRootPart.CFrame)
						-- goto l6
                    end
                    local v1085, v1086, v1087 = pairs(game:GetService("Workspace").Enemies:GetChildren())
					-- goto l61
					-- ::l64::
                    wait()
                    if game.Workspace.Enemies:FindFirstChild(v1088.Name) then
                        if (v1088.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 200 then
                            if (v1088.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 200 then
                                if Farmtween then
                                    Farmtween:Stop()
                                end
                                FastAttack = true
                                if _G.Settings.Configs["Auto Haki"] and not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
                                end
                                if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
                                    wait()
                                    EquipWeapon(_G.Settings.Configs["Select Weapon"])
                                end
                                if not _G.Settings.Configs["Fast Attack"] then
                                    game:GetService("VirtualUser"):CaptureController()
                                    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                end
                                v1088.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                if _G.Settings.Configs["Show Hitbox"] then
                                    v1088.HumanoidRootPart.Transparency = tonumber(_G.Hitbox_LocalTransparency)
                                else
                                    v1088.HumanoidRootPart.Transparency = 1
                                end
                                v1088.Humanoid.JumpPower = 0
                                v1088.Humanoid.WalkSpeed = 0
                                v1088.HumanoidRootPart.CanCollide = false
                                v1088.Humanoid:ChangeState(11)
                                vu192(v1088.HumanoidRootPart.CFrame * CFrame.new(0, _G.Settings.Configs["Distance Auto Farm"], 0))
                                if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 150 then
                                    game:service("VirtualInputManager"):SendKeyEvent(true, "V", false, game)
                                    game:service("VirtualInputManager"):SendKeyEvent(false, "V", false, game)
                                end
                            end
                        else
                            Farmtween = vu192(v1088.HumanoidRootPart.CFrame)
                        end
                    end
                    if v1088.Parent and (v1088.Humanoid.Health > 0 and _G.Settings.FightingStyle["Auto Death Step"] ~= false) and not (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Library Key") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Library Key")) then
						-- goto l64
                    end
                    FastAttack = false
					-- ::l61::
                    local v1088
                    v1087, v1088 = v1085(v1086, v1087)
                    if v1087 == nil then
						-- goto l6
                    end
                    if v1088.Name ~= "Awakened Ice Admiral [Lv. 1400] [Boss]" then
						-- goto l61
                    else
						-- goto l64
                    end
                end)
            end
        end)
        v568:Toggle("Auto Shark Man Karate", _G.Settings.FightingStyle["Auto Fully SharkMan Karate"], function(p1089)
            _G.Settings.FightingStyle["Auto Fully SharkMan Karate"] = p1089
            getgenv().SaveSetting()
        end)
        task.spawn(function()
			-- upvalues: (ref) vu192
            while wait() do
                pcall(function()
					-- upvalues: (ref) vu192
					-- block 117
                    if _G.Settings.FightingStyle["Auto SharkMan Karate"] then
                        if game.Players.LocalPlayer:FindFirstChild("WeaponAssetCache") then
                            if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Fishman Karate") or (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Fishman Karate") or (game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Sharkman Karate") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Sharkman Karate"))) then
                                if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Fishman Karate") and game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Fishman Karate").Level.Value >= 400 then
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate")
                                    _G.Settings.Configs["Select Weapon"] = "Sharkman Karate"
                                end
                                if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Fishman Karate") and game:GetService("Players").LocalPlayer.Character:FindFirstChild("Fishman Karate").Level.Value >= 400 then
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate")
                                    _G.Settings.Configs["Select Weapon"] = "Sharkman Karate"
                                end
                                if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Fishman Karate") and game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Fishman Karate").Level.Value <= 400 then
                                    _G.Settings.Configs["Select Weapon"] = "Fishman Karate"
                                end
                            else
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate")
                            end
                        end
						-- goto l6
                    end
                    if not _G.Settings.FightingStyle["Auto Fully SharkMan Karate"] then
						-- ::l6::
                        return
                    end
                    if (not game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate") or game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate").Level.Value < 400) and (not game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") or game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate").Level.Value < 400) then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate")
						-- goto l6
                    end
                    if not string.find(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate"), "keys") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate")
						-- goto l6
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Water Key") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Water Key") then
                        repeat
                            wait()
                            vu192(- 2604.6958, 239.432526, - 10315.1982, 0.0425701365, 0, - 0.999093413, 0, 1, 0, 0.999093413, 0, 0.0425701365)
                        until (CFrame.new(- 2604.6958, 239.432526, - 10315.1982, 0.0425701365, 0, - 0.999093413, 0, 1, 0, 0.999093413, 0, 0.0425701365).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 or not _G.Auto_Fully_SharkMan_Karate
                        if (CFrame.new(- 2604.6958, 239.432526, - 10315.1982, 0.0425701365, 0, - 0.999093413, 0, 1, 0, 0.999093413, 0, 0.0425701365).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 then
                            wait(1.2)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate", true)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate")
                            wait(0.5)
                        end
						-- goto l6
                    end
                    if (not game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") or game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate").Level.Value < 400) and (not game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") or game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate").Level.Value < 400) or not (game:GetService("ReplicatedStorage"):FindFirstChild("Tide Keeper [Lv. 1475] [Boss]") or game:GetService("Workspace").Enemies:FindFirstChild("Tide Keeper [Lv. 1475] [Boss]")) then
						-- goto l6
                    end
                    if not game:GetService("Workspace").Enemies:FindFirstChild("Tide Keeper [Lv. 1475] [Boss]") then
                        vu192(game:GetService("ReplicatedStorage"):FindFirstChild("Tide Keeper [Lv. 1475] [Boss]").HumanoidRootPart.CFrame)
						-- goto l6
                    end
                    local v1090, v1091, v1092 = pairs(game:GetService("Workspace").Enemies:GetChildren())
					-- goto l70
					-- ::l73::
                    wait()
                    if game.Workspace.Enemies:FindFirstChild(v1093.Name) then
                        if (v1093.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 200 then
                            if (v1093.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 200 then
                                if Farmtween then
                                    Farmtween:Stop()
                                end
                                FastAttack = true
                                if _G.Settings.Configs["Auto Haki"] and not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
                                end
                                if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
                                    wait()
                                    EquipWeapon(_G.Settings.Configs["Select Weapon"])
                                end
                                if not _G.Settings.Configs["Fast Attack"] then
                                    game:GetService("VirtualUser"):CaptureController()
                                    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                end
                                v1093.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                if _G.Settings.Configs["Show Hitbox"] then
                                    v1093.HumanoidRootPart.Transparency = tonumber(_G.Hitbox_LocalTransparency)
                                else
                                    v1093.HumanoidRootPart.Transparency = 1
                                end
                                v1093.Humanoid.JumpPower = 0
                                v1093.Humanoid.WalkSpeed = 0
                                v1093.HumanoidRootPart.CanCollide = false
                                v1093.Humanoid:ChangeState(11)
                                vu192(v1093.HumanoidRootPart.CFrame * CFrame.new(0, _G.Settings.Configs["Distance Auto Farm"], 0))
                                if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 150 then
                                    game:service("VirtualInputManager"):SendKeyEvent(true, "V", false, game)
                                    game:service("VirtualInputManager"):SendKeyEvent(false, "V", false, game)
                                end
                            end
                        else
                            Farmtween = vu192(v1093.HumanoidRootPart.CFrame)
                        end
                    end
                    if v1093.Parent and (v1093.Humanoid.Health > 0 and _G.Settings.FightingStyle["Auto Death Step"] ~= false) and not (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Library Key") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Library Key")) then
						-- goto l73
                    end
                    FastAttack = false
					-- ::l70::
                    local v1093
                    v1092, v1093 = v1090(v1091, v1092)
                    if v1092 == nil then
						-- goto l6
                    end
                    if v1093.Name ~= "Tide Keeper [Lv. 1475] [Boss]" then
						-- goto l70
                    else
						-- goto l73
                    end
                end)
            end
        end)
        v568:Toggle("Auto Dragon Talon", _G.Settings.FightingStyle["Auto Dragon Talon"], function(p1094)
            _G.Settings.FightingStyle["Auto Dragon Talon"] = p1094
            getgenv().SaveSetting()
            if _G.Settings.FightingStyle["Auto Dragon Talon"] then
                Com("F_", "BlackbeardReward", "DragonClaw", "2")
            end
        end)
        task.spawn(function()
            while wait() do
                pcall(function()
                    if _G.Settings.FightingStyle["Auto Dragon Talon"] and game.Players.LocalPlayer:FindFirstChild("WeaponAssetCache") then
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") and (game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw").Level.Value <= 399 and game.Players.LocalPlayer.Character.Humanoid.Health > 0) then
                            _G.Settings.Configs["Select Weapon"] = "Dragon Claw"
                        end
                        if game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw") and (game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw").Level.Value <= 399 and game.Players.LocalPlayer.Character.Humanoid.Health > 0) then
                            _G.Settings.Configs["Select Weapon"] = "Dragon Claw"
                        end
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") and (game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw").Level.Value >= 400 and game.Players.LocalPlayer.Character.Humanoid.Health > 0) then
                            _G.Settings.Configs["Select Weapon"] = "Dragon Claw"
                            if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyDragonTalon", true) ~= 3 then
                                if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyDragonTalon", true) ~= 1 then
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon", true)
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon")
                                else
                                    game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyDragonTalon")
                                end
                            else
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones", "Buy", 1, 1)
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon", true)
                            end
                        end
                        if game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw") and (game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw").Level.Value >= 400 and game.Players.LocalPlayer.Character.Humanoid.Health > 0) then
                            _G.Settings.Configs["Select Weapon"] = "Dragon Claw"
                            if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyDragonTalon", true) ~= 3 then
                                if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyDragonTalon", true) ~= 1 then
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon", true)
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon")
                                else
                                    game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyDragonTalon")
                                end
                            else
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones", "Buy", 1, 1)
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon", true)
                            end
                        end
                    end
                end)
            end
        end)
        v570:Label("Mastery Functions")
        task.spawn(function()
            local v1095 = getrawmetatable(game)
            local vu1096 = v1095.__namecall
            setreadonly(v1095, false)
            v1095.__namecall = newcclosure(function(...)
				-- upvalues: (ref) vu1096
                local v1097 = getnamecallmethod()
                local v1098 = {
                    ...
                }
                if tostring(v1097) ~= "FireServer" or (tostring(v1098[1]) ~= "RemoteEvent" or (tostring(v1098[2]) == "true" or (tostring(v1098[2]) == "false" or not (UseSkillMasteryDevilFruit and _G.Settings.Mastery["Auto Farm Fruit Mastery"])))) then
                    return vu1096(...)
                end
                if type(v1098[2]) ~= "vector" then
                    v1098[2] = CFrame.new(PositionSkillMasteryDevilFruit)
                else
                    v1098[2] = PositionSkillMasteryDevilFruit
                end
                return vu1096(unpack(v1098))
            end)
        end)
        task.spawn(function()
            local v1099 = getrawmetatable(game)
            local vu1100 = v1099.__namecall
            setreadonly(v1099, false)
            v1099.__namecall = newcclosure(function(...)
				-- upvalues: (ref) vu1100
                local v1101 = {
                    ...
                }
                if getnamecallmethod() == "InvokeServer" and (SelectWeaponGun and (SelectWeaponGun == "Soul Guitar" and (tostring(v1101[2]) == "TAP" and (_G.Settings.Mastery["Auto Farm Gun Mastery"] and UseSkillMasteryGun)))) then
                    v1101[3] = PositionSkillMasteryGun
                end
                return vu1100(unpack(v1101))
            end)
            setreadonly(v1099, true)
        end)
        LPH_NO_VIRTUALIZE(function()
            task.spawn(function()
                while wait() do
                    local v1102, v1103, v1104 = pairs(game.Players.LocalPlayer.Backpack:GetChildren())
                    while true do
                        local v1105
                        v1104, v1105 = v1102(v1103, v1104)
                        if v1104 == nil then
                            break
                        end
                        if v1105:IsA("Tool") and v1105:FindFirstChild("RemoteFunctionShoot") then
                            SelectWeaponGun = v1105.Name
                        end
                    end
                end
            end)
        end)()
        function AutoFarmMasteryGun()
			-- upvalues: (ref) vu192
			-- block 133
            if not game:GetService("Workspace").Enemies:FindFirstChild(Name) then
                StartMagnet = false
                Modstween = vu192(CFrameMon)
                if World1 and (Name == "Fishman Commando [Lv. 400]" or Name == "Fishman Warrior [Lv. 375]") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 50000 then
                    if Modstween then
                        Modstween:Stop()
                    end
                    wait(0.5)
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
                elseif World1 and (Name ~= "Fishman Commando [Lv. 400]" and Name ~= "Fishman Warrior [Lv. 375]") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 50000 then
                    if Modstween then
                        Modstween:Stop()
                    end
                    wait(0.5)
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(3864.8515625, 6.6796875, - 1926.7841796875))
                elseif World1 and (Name == "God\'s Guard [Lv. 450]" or (Name == "Sky Bandit [Lv. 150]" or Name == "Dark Master [Lv. 175]")) and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 3000 then
                    if Modstween then
                        Modstween:Stop()
                    end
                    wait(0.5)
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(- 4607.8227539063, 872.54248046875, - 1667.5568847656))
                elseif World1 and (Name == "Shanda [Lv. 475]" or (Name == "Royal Squad [Lv. 525]" or Name == "Royal Soldier [Lv. 550]")) and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 5000 then
                    if Modstween then
                        Modstween:Stop()
                    end
                    wait(0.5)
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(- 7894.6176757813, 5547.1416015625, - 380.29119873047))
                elseif World2 and string.find(Name, "Ship") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 30000 then
                    if Modstween then
                        Modstween:Stop()
                    end
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
                elseif World2 and not string.find(Name, "Ship") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 30000 then
                    if Modstween then
                        Modstween:Stop()
                    end
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(- 6508.5581054688, 89.034996032715, - 132.83953857422))
                elseif (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 150 then
                    if Modstween then
                        Modstween:Stop()
                    end
                    wait(0.5)
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
                end
				-- ::l54::
                return
            end
            local v1106, v1107, v1108 = pairs(game:GetService("Workspace").Enemies:GetChildren())
			-- goto l4
			-- ::l15::
            wait()
            FarmtoTarget = vu192(v1110.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
            if v1110:FindFirstChild("HumanoidRootPart") and (v1110:FindFirstChild("Humanoid") and (v1110.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 150) then
                if FarmtoTarget then
                    FarmtoTarget:Stop()
                end
                StartMagnet = true
                PosMon = v1110.HumanoidRootPart.CFrame
                if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 150 then
                    game:service("VirtualInputManager"):SendKeyEvent(true, "V", false, game)
                    game:service("VirtualInputManager"):SendKeyEvent(false, "V", false, game)
                end
                HealthMin = v1110.Humanoid.MaxHealth * _G.Settings.Mastery["Mob Health (%)"] / 100
                PositionSkillMasteryGun = v1110.HumanoidRootPart.Position
                if v1110.Humanoid.Health > HealthMin or (not v1110:FindFirstChild("HumanoidRootPart") or (not v1110:FindFirstChild("Humanoid") or v1110.Humanoid.Health <= 0)) then
                    UseSkillMasteryGun = false
                    Click()
                    EquipWeapon(_G.Settings.Configs["Select Weapon"])
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v1110.HumanoidRootPart.CFrame * CFrame.new(0, 15, 0)
                else
                    EquipWeapon(SelectWeaponGun)
                    UseSkillMasteryGun = true
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v1110.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild(SelectWeaponGun) and game:GetService("Players").LocalPlayer.Character:FindFirstChild(SelectWeaponGun):FindFirstChild("RemoteFunctionShoot") then
                        Click()
                        local v1109 = {
                            v1110.HumanoidRootPart.Position,
                            v1110.HumanoidRootPart
                        }
                        game:GetService("Players").LocalPlayer.Character[SelectWeaponGun].RemoteFunctionShoot:InvokeServer(unpack(v1109))
                    end
                end
            end
            if game:GetService("Workspace").Enemies:FindFirstChild(Name) and (_G.Settings.Mastery["Auto Farm Gun Mastery"] and (v1110.Humanoid.Health > 0 and v1110.Parent)) then
				-- goto l15
            else
				-- goto l46
            end
			-- ::l46::
            UseSkillMasteryGun = false
            StartMagnet = false
			-- ::l4::
            local v1110
            v1108, v1110 = v1106(v1107, v1108)
            if v1108 == nil then
				-- goto l54
            end
            if _G.Settings.Mastery["Auto Farm Gun Mastery"] and (v1110.Name == Name and (v1110:FindFirstChild("HumanoidRootPart") and (v1110:FindFirstChild("Humanoid") and v1110.Humanoid.Health > 0))) then
				-- goto l15
            else
				-- goto l4
            end
        end
        function AutoFarmMasteryDevilFruit()
			-- upvalues: (ref) vu192
			-- block 273
            if not game:GetService("Workspace").Enemies:FindFirstChild(Name) then
                StartMagnet = false
                Modstween = vu192(CFrameMon.Position, CFrameMon)
                if World1 and (Name == "Fishman Commando [Lv. 400]" or Name == "Fishman Warrior [Lv. 375]") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 50000 then
                    if Modstween then
                        Modstween:Stop()
                    end
                    wait(0.5)
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
                elseif World1 and (Name ~= "Fishman Commando [Lv. 400]" and Name ~= "Fishman Warrior [Lv. 375]") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 50000 then
                    if Modstween then
                        Modstween:Stop()
                    end
                    wait(0.5)
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(3864.8515625, 6.6796875, - 1926.7841796875))
                elseif World1 and (Name == "God\'s Guard [Lv. 450]" or (Name == "Sky Bandit [Lv. 150]" or Name == "Dark Master [Lv. 175]")) and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 3000 then
                    if Modstween then
                        Modstween:Stop()
                    end
                    wait(0.5)
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(- 4607.8227539063, 872.54248046875, - 1667.5568847656))
                elseif World1 and (Name == "Shanda [Lv. 475]" or (Name == "Royal Squad [Lv. 525]" or Name == "Royal Soldier [Lv. 550]")) and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 5000 then
                    if Modstween then
                        Modstween:Stop()
                    end
                    wait(0.5)
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(- 7894.6176757813, 5547.1416015625, - 380.29119873047))
                elseif World2 and string.find(Name, "Ship") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 30000 then
                    if Modstween then
                        Modstween:Stop()
                    end
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
                elseif World2 and not string.find(Name, "Ship") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 30000 then
                    if Modstween then
                        Modstween:Stop()
                    end
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(- 6508.5581054688, 89.034996032715, - 132.83953857422))
                elseif (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 150 then
                    if Modstween then
                        Modstween:Stop()
                    end
                    wait(0.5)
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
                end
				-- ::l194::
                return
            end
            local v1111, v1112, v1113 = pairs(game:GetService("Workspace").Enemies:GetChildren())
			-- ::l4::
            local v1114
            v1113, v1114 = v1111(v1112, v1113)
            if v1113 == nil then
				-- goto l194
            end
            if not _G.Settings.Mastery["Auto Farm Fruit Mastery"] or (v1114.Name ~= Name or (not v1114:FindFirstChild("HumanoidRootPart") or (not v1114:FindFirstChild("Humanoid") or v1114.Humanoid.Health <= 0))) then
				-- goto l4
            end
			-- ::l15::
            wait()
            FarmtoTarget = vu192(v1114.HumanoidRootPart.Position, v1114.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
            if v1114:FindFirstChild("HumanoidRootPart") and (v1114:FindFirstChild("Humanoid") and (v1114.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 150) then
                if FarmtoTarget then
                    FarmtoTarget:Stop()
                end
                StartMagnet = true
                PosMon = v1114.HumanoidRootPart.CFrame
                HealthMin = v1114.Humanoid.MaxHealth * _G.Settings.Mastery["Mob Health (%)"] / 100
                if v1114.Humanoid.Health > HealthMin or (not v1114:FindFirstChild("HumanoidRootPart") or (not v1114:FindFirstChild("Humanoid") or v1114.Humanoid.Health <= 0)) then
                    game:GetService("VirtualUser"):CaptureController()
                    game:GetService("VirtualUser"):ClickButton1(Vector2.new(851, 158), game:GetService("Workspace").Camera.CFrame)
                    UseSkillMasteryDevilFruit = false
                    EquipWeapon(_G.Settings.Configs["Select Weapon"])
                    v1114.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v1114.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)
                else
                    EquipWeapon(game.Players.LocalPlayer.Data.DevilFruit.Value)
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v1114.HumanoidRootPart.CFrame * CFrame.new(0, 40, 10)
                    if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") then
                        PositionSkillMasteryDevilFruit = v1114.HumanoidRootPart.Position
                        UseSkillMasteryDevilFruit = true
                        if game:GetService("Players").LocalPlayer.Character:FindFirstChild(game.Players.LocalPlayer.Data.DevilFruit.Value) then
                            MasteryDevilFruit = require(game:GetService("Players").LocalPlayer.Character[game.Players.LocalPlayer.Data.DevilFruit.Value].Data)
                            DevilFruitMastery = game:GetService("Players").LocalPlayer.Character[game.Players.LocalPlayer.Data.DevilFruit.Value].Level.Value
                        elseif game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(game.Players.LocalPlayer.Data.DevilFruit.Value) then
                            MasteryDevilFruit = require(game:GetService("Players").LocalPlayer.Backpack[game.Players.LocalPlayer.Data.DevilFruit.Value].Data)
                            DevilFruitMastery = game:GetService("Players").LocalPlayer.Backpack[game.Players.LocalPlayer.Data.DevilFruit.Value].Level.Value
                        end
                        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dragon-Dragon") then
                            if _G.Settings.Configs["Skill Z"] and (v1114:FindFirstChild("HumanoidRootPart") and (v1114:FindFirstChild("Humanoid") and (v1114.Humanoid.Health > 0 and DevilFruitMastery >= MasteryDevilFruit.Lvl.Z))) then
                                game:service("VirtualInputManager"):SendKeyEvent(true, "Z", false, game)
                                wait(0.1)
                                game:service("VirtualInputManager"):SendKeyEvent(false, "Z", false, game)
                            end
                            if _G.Settings.Configs["Skill X"] and (v1114:FindFirstChild("HumanoidRootPart") and (v1114:FindFirstChild("Humanoid") and (v1114.Humanoid.Health > 0 and DevilFruitMastery >= MasteryDevilFruit.Lvl.X))) then
                                game:service("VirtualInputManager"):SendKeyEvent(true, "X", false, game)
                                wait(0.1)
                                game:service("VirtualInputManager"):SendKeyEvent(false, "X", false, game)
                            end
                        elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Human-Human: Buddha") then
                            if not _G.Settings.Configs["Skill Z"] or (not v1114:FindFirstChild("HumanoidRootPart") or (not v1114:FindFirstChild("Humanoid") or (v1114.Humanoid.Health <= 0 or (game.Players.LocalPlayer.Character.HumanoidRootPart.Size ~= Vector3.new(7.6, 7.676, 3.686) or DevilFruitMastery < MasteryDevilFruit.Lvl.Z)))) then
                                game:service("VirtualInputManager"):SendKeyEvent(true, "Z", false, game)
                                wait(0.1)
                                game:service("VirtualInputManager"):SendKeyEvent(false, "Z", false, game)
                            end
                            if _G.Settings.Configs["Skill X"] and (v1114:FindFirstChild("HumanoidRootPart") and (v1114:FindFirstChild("Humanoid") and (v1114.Humanoid.Health > 0 and DevilFruitMastery >= MasteryDevilFruit.Lvl.X))) then
                                game:service("VirtualInputManager"):SendKeyEvent(true, "X", false, game)
                                wait(0.1)
                                game:service("VirtualInputManager"):SendKeyEvent(false, "X", false, game)
                            end
                            if _G.Settings.Configs["Skill C"] and (v1114:FindFirstChild("HumanoidRootPart") and (v1114:FindFirstChild("Humanoid") and (v1114.Humanoid.Health > 0 and DevilFruitMastery >= MasteryDevilFruit.Lvl.C))) then
                                game:service("VirtualInputManager"):SendKeyEvent(true, "C", false, game)
                                wait(0.1)
                                game:service("VirtualInputManager"):SendKeyEvent(false, "C", false, game)
                            end
                        elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Venom-Venom") then
                            if _G.Settings.Configs["Skill Z"] and (v1114:FindFirstChild("HumanoidRootPart") and (v1114:FindFirstChild("Humanoid") and (v1114.Humanoid.Health > 0 and DevilFruitMastery >= MasteryDevilFruit.Lvl.Z))) then
                                game:service("VirtualInputManager"):SendKeyEvent(true, "Z", false, game)
                                wait(4)
                                game:service("VirtualInputManager"):SendKeyEvent(false, "Z", false, game)
                            end
                            if _G.Settings.Configs["Skill X"] and (v1114:FindFirstChild("HumanoidRootPart") and (v1114:FindFirstChild("Humanoid") and (v1114.Humanoid.Health > 0 and DevilFruitMastery >= MasteryDevilFruit.Lvl.X))) then
                                game:service("VirtualInputManager"):SendKeyEvent(true, "X", false, game)
                                wait(0.1)
                                game:service("VirtualInputManager"):SendKeyEvent(false, "X", false, game)
                            end
                            if _G.Settings.Configs["Skill C"] and (v1114:FindFirstChild("HumanoidRootPart") and (v1114:FindFirstChild("Humanoid") and (v1114.Humanoid.Health > 0 and DevilFruitMastery >= MasteryDevilFruit.Lvl.C))) then
                                game:service("VirtualInputManager"):SendKeyEvent(true, "C", false, game)
                                wait(0.1)
                                game:service("VirtualInputManager"):SendKeyEvent(false, "C", false, game)
                            end
                        elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild(game.Players.LocalPlayer.Data.DevilFruit.Value) then
                            game:GetService("Players").LocalPlayer.Character:FindFirstChild(game.Players.LocalPlayer.Data.DevilFruit.Value).MousePos.Value = v1114.HumanoidRootPart.Position
                            if _G.Settings.Configs["Skill Z"] and (v1114:FindFirstChild("HumanoidRootPart") and (v1114:FindFirstChild("Humanoid") and (v1114.Humanoid.Health > 0 and DevilFruitMastery >= MasteryDevilFruit.Lvl.Z))) then
                                game:service("VirtualInputManager"):SendKeyEvent(true, "Z", false, game)
                                wait(0.1)
                                game:service("VirtualInputManager"):SendKeyEvent(false, "Z", false, game)
                            end
                            if _G.Settings.Configs["Skill X"] and (v1114:FindFirstChild("HumanoidRootPart") and (v1114:FindFirstChild("Humanoid") and (v1114.Humanoid.Health > 0 and DevilFruitMastery >= MasteryDevilFruit.Lvl.X))) then
                                game:service("VirtualInputManager"):SendKeyEvent(true, "X", false, game)
                                wait(0.1)
                                game:service("VirtualInputManager"):SendKeyEvent(false, "X", false, game)
                            end
                            if _G.Settings.Configs["Skill C"] and (v1114:FindFirstChild("HumanoidRootPart") and (v1114:FindFirstChild("Humanoid") and (v1114.Humanoid.Health > 0 and DevilFruitMastery >= MasteryDevilFruit.Lvl.C))) then
                                game:service("VirtualInputManager"):SendKeyEvent(true, "C", false, game)
                                wait(0.1)
                                game:service("VirtualInputManager"):SendKeyEvent(false, "C", false, game)
                            end
                            if _G.Settings.Configs["Skill V"] and (v1114:FindFirstChild("HumanoidRootPart") and (v1114:FindFirstChild("Humanoid") and (v1114.Humanoid.Health > 0 and DevilFruitMastery >= MasteryDevilFruit.Lvl.V))) then
                                game:service("VirtualInputManager"):SendKeyEvent(true, "V", false, game)
                                wait(0.1)
                                game:service("VirtualInputManager"):SendKeyEvent(false, "V", false, game)
                            end
                        end
                    end
                end
            end
            if game:GetService("Workspace").Enemies:FindFirstChild(Name) and (_G.Settings.Mastery["Auto Farm Fruit Mastery"] and (v1114.Humanoid.Health > 0 and v1114.Parent)) then
				-- goto l15
            else
				-- goto l18
            end
			-- ::l18::
			-- ::l186::
            StartMagnet = false
			-- goto l4
        end
        function CheckMasteryWeapon(p1115, p1116)
            if game.Players.LocalPlayer.Backpack:FindFirstChild(p1115) then
                if tonumber(game.Players.LocalPlayer.Backpack:FindFirstChild(p1115).Level.Value) < tonumber(p1116) then
                    return "true DownTo"
                end
                if tonumber(game.Players.LocalPlayer.Backpack:FindFirstChild(p1115).Level.Value) >= tonumber(p1116) then
                    return "true UpTo"
                end
            end
            if game.Players.LocalPlayer.Character:FindFirstChild(p1115) then
                if tonumber(game.Players.LocalPlayer.Character:FindFirstChild(p1115).Level.Value) < tonumber(p1116) then
                    return "true DownTo"
                end
                if tonumber(game.Players.LocalPlayer.Character:FindFirstChild(p1115).Level.Value) >= tonumber(p1116) then
                    return "true UpTo"
                end
            end
            return "else"
        end
        function AutoFarmMasterySwordList()
			-- upvalues: (ref) vu192
            if not (game:GetService("Workspace").Enemies:FindFirstChild(Name) or World3 and (game:GetService("Workspace").Enemies:FindFirstChild("Reborn Skeleton [Lv. 1975]") or (game:GetService("Workspace").Enemies:FindFirstChild("Living Zombie [Lv. 2000]") or (game:GetService("Workspace").Enemies:FindFirstChild("Demonic Soul [Lv. 2025]") or game:GetService("Workspace").Enemies:FindFirstChild("Posessed Mummy [Lv. 2050]"))))) then
                StartMagnet = false
                Modstween = vu192(CFrameMon)
                if World1 and (Name == "Fishman Commando [Lv. 400]" or Name == "Fishman Warrior [Lv. 375]") and (CFrameMon.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 50000 then
                    if Modstween then
                        Modstween:Stop()
                    end
                    wait(0.5)
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
                elseif World1 and (Name ~= "Fishman Commando [Lv. 400]" and Name ~= "Fishman Warrior [Lv. 375]") and (CFrameMon.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 50000 then
                    if Modstween then
                        Modstween:Stop()
                    end
                    wait(0.5)
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(3864.8515625, 6.6796875, - 1926.7841796875))
                elseif World1 and (Name == "God\'s Guard [Lv. 450]" or (Name == "Sky Bandit [Lv. 150]" or Name == "Dark Master [Lv. 175]")) and (CFrameMon.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 3000 then
                    if Modstween then
                        Modstween:Stop()
                    end
                    wait(0.5)
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(- 4607.8227539063, 872.54248046875, - 1667.5568847656))
                elseif World1 and (Name == "Shanda [Lv. 475]" or (Name == "Royal Squad [Lv. 525]" or Name == "Royal Soldier [Lv. 550]")) and (CFrameMon.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 5000 then
                    if Modstween then
                        Modstween:Stop()
                    end
                    wait(0.5)
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(- 7894.6176757813, 5547.1416015625, - 380.29119873047))
                elseif World2 and string.find(Name, "Ship") and (CFrameMon.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 30000 then
                    if Modstween then
                        Modstween:Stop()
                    end
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
                elseif World2 and not string.find(Name, "Ship") and (CFrameMon.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 30000 then
                    if Modstween then
                        Modstween:Stop()
                    end
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(- 6508.5581054688, 89.034996032715, - 132.83953857422))
                elseif (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 150 then
                    if Modstween then
                        Modstween:Stop()
                    end
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
                end
				-- ::l73::
                return
            end
            local v1117, v1118, v1119 = pairs(game:GetService("Workspace").Enemies:GetChildren())
            while true do
				-- ::l14::
                local v1120
                v1119, v1120 = v1117(v1118, v1119)
                if v1119 == nil then
					-- goto l73
                end
                if not _G.Settings.Mastery["Farm Mastery SwordList"] or (not World3 or v1120.Name ~= "Reborn Skeleton [Lv. 1975]" and (v1120.Name ~= "Living Zombie [Lv. 2000]" and (v1120.Name ~= "Demonic Soul [Lv. 2025]" and v1120.Name ~= "Posessed Mummy [Lv. 2050]"))) and v1120.Name ~= Name or (not v1120:FindFirstChild("HumanoidRootPart") or (not v1120:FindFirstChild("Humanoid") or v1120.Humanoid.Health <= 0)) then
					-- goto l14
                end
				-- ::l35::
                wait()
                FarmtoTarget = vu192(v1120.HumanoidRootPart.CFrame * CFrame.new(0, 30, 1))
                if v1120:FindFirstChild("HumanoidRootPart") and (v1120:FindFirstChild("Humanoid") and (v1120.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 150) then
                    if FarmtoTarget then
                        FarmtoTarget:Stop()
                    end
                    FastAttack = true
                    EquipWeaponSword()
                    StartMagnet = true
                    PosMon = v1120.HumanoidRootPart.CFrame
                    if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 150 then
                        game:service("VirtualInputManager"):SendKeyEvent(true, "V", false, game)
                        game:service("VirtualInputManager"):SendKeyEvent(false, "V", false, game)
                    end
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v1120.HumanoidRootPart.CFrame * CFrame.new(0, 30, 1)
                end
                if (game:GetService("Workspace").Enemies:FindFirstChild(Name) or (not World3 or (v1120.Name == "Reborn Skeleton [Lv. 1975]" or (v1120.Name == "Living Zombie [Lv. 2000]" or (v1120.Name == "Demonic Soul [Lv. 2025]" or v1120.Name == "Posessed Mummy [Lv. 2050]")))) and v1120.Name ~= Name) and (_G.Settings.Mastery["Farm Mastery SwordList"] and (v1120.Humanoid.Health > 0 and v1120.Parent)) then
					-- goto l35
                end
                StartMagnet = false
                FastAttack = false
            end
        end
        v570:Toggle("Auto Fruit Mastery", _G.Settings.Mastery["Auto Farm Fruit Mastery"], function(p1121)
			-- upvalues: (ref) vu192
            _G.Settings.Mastery["Auto Farm Fruit Mastery"] = p1121
            if p1121 == false then
                vu192(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
            end
            getgenv().SaveSetting()
        end)
        spawn(function()
            local v1122 = getrawmetatable(game)
            local vu1123 = v1122.__namecall
            setreadonly(v1122, false)
            v1122.__namecall = newcclosure(function(...)
				-- upvalues: (ref) vu1123
                local v1124 = getnamecallmethod()
                local v1125 = {
                    ...
                }
                if tostring(v1124) ~= "FireServer" or (tostring(v1125[1]) ~= "RemoteEvent" or (tostring(v1125[2]) == "true" or (tostring(v1125[2]) == "false" or not (UseSkill and _G.Settings.Mastery["Auto Farm Fruit Mastery"])))) then
                    return vu1123(...)
                end
                if type(v1125[2]) ~= "vector" then
                    v1125[2] = CFrame.new(PositionSkillMasteryDevilFruit)
                else
                    v1125[2] = PositionSkillMasteryDevilFruit
                end
                return vu1123(unpack(v1125))
            end)
        end)
        spawn(function()
			-- upvalues: (ref) vu192
            while wait() do
                if _G.Settings.Mastery["Auto Farm Fruit Mastery"] then
                    pcall(function()
						-- upvalues: (ref) vu192
                        if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible ~= false then
                            if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                                CheckQuest()
                                if game:GetService("Workspace").Enemies:FindFirstChild(Name) then
                                    pcall(function()
										-- upvalues: (ref) vu192
                                        local v1126, v1127, v1128 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                                        while true do
                                            local v1129
                                            v1128, v1129 = v1126(v1127, v1128)
                                            if v1128 == nil then
                                                return
                                            end
                                            if v1129.Name == Name then
                                                repeat
                                                    if true then
                                                        wait()
                                                        if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) then
                                                            HealthMin = v1129.Humanoid.MaxHealth * _G.Settings.Mastery["Mob Health (%)"] / 100
                                                            if v1129.Humanoid.Health > HealthMin then
                                                                StartMagnet = true
                                                                UseSkill = false
                                                                FastAttack = true
                                                                EquipWeapon(_G.Settings.Configs["Select Weapon"])
                                                                vu192(v1129.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                                                                game:GetService("VirtualUser"):CaptureController()
                                                                game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                                                v1129.Head.CanCollide = false
                                                                v1129.HumanoidRootPart.CanCollide = false
                                                                v1129.HumanoidRootPart.Size = Vector3.new(40, 40, 40)
                                                            else
                                                                EquipWeapon(game.Players.LocalPlayer.Data.DevilFruit.Value)
                                                                v1129.Head.CanCollide = false
                                                                v1129.HumanoidRootPart.CanCollide = false
                                                                v1129.HumanoidRootPart.Size = Vector3.new(2, 2, 1)
                                                                vu192(v1129.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                                                                PositionSkillMasteryDevilFruit = v1129.HumanoidRootPart.Position
                                                                StartMagnet = true
                                                                UseSkill = true
                                                                DevilFruitMastery = game:GetService("Players").LocalPlayer.Character[game.Players.LocalPlayer.Data.DevilFruit.Value].Level.Value
                                                                if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dragon-Dragon") then
                                                                    if _G.Settings.Configs["Skill Z"] and (v1129:FindFirstChild("HumanoidRootPart") and (v1129:FindFirstChild("Humanoid") and (v1129.Humanoid.Health > 0 and DevilFruitMastery >= 1))) then
                                                                        game:service("VirtualInputManager"):SendKeyEvent(true, "Z", false, game)
                                                                        wait(0.1)
                                                                        game:service("VirtualInputManager"):SendKeyEvent(false, "Z", false, game)
                                                                    end
                                                                    if _G.Settings.Configs["Skill X"] and (v1129:FindFirstChild("HumanoidRootPart") and (v1129:FindFirstChild("Humanoid") and (v1129.Humanoid.Health > 0 and DevilFruitMastery >= 1))) then
                                                                        game:service("VirtualInputManager"):SendKeyEvent(true, "X", false, game)
                                                                        wait(0.1)
                                                                        game:service("VirtualInputManager"):SendKeyEvent(false, "X", false, game)
                                                                    end
                                                                    if _G.Settings.Configs["Skill C"] and (v1129:FindFirstChild("HumanoidRootPart") and (v1129:FindFirstChild("Humanoid") and (v1129.Humanoid.Health > 0 and DevilFruitMastery >= 1))) then
                                                                        game:service("VirtualInputManager"):SendKeyEvent(true, "C", false, game)
                                                                        wait(2)
                                                                        game:service("VirtualInputManager"):SendKeyEvent(false, "C", false, game)
                                                                    end
                                                                elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Leopard-Leopard") then
                                                                    if _G.Settings.Configs["Skill Z"] and (v1129:FindFirstChild("HumanoidRootPart") and (v1129:FindFirstChild("Humanoid") and (v1129.Humanoid.Health > 0 and DevilFruitMastery >= 1))) then
                                                                        game:service("VirtualInputManager"):SendKeyEvent(true, "Z", false, game)
                                                                        wait(0.5)
                                                                        game:service("VirtualInputManager"):SendKeyEvent(false, "Z", false, game)
                                                                    end
                                                                    if _G.Settings.Configs["Skill X"] and (v1129:FindFirstChild("HumanoidRootPart") and (v1129:FindFirstChild("Humanoid") and (v1129.Humanoid.Health > 0 and DevilFruitMastery >= 1))) then
                                                                        game:service("VirtualInputManager"):SendKeyEvent(true, "X", false, game)
                                                                        wait(0.1)
                                                                        game:service("VirtualInputManager"):SendKeyEvent(false, "X", false, game)
                                                                    end
                                                                    if _G.Settings.Configs["Skill C"] and (v1129:FindFirstChild("HumanoidRootPart") and (v1129:FindFirstChild("Humanoid") and (v1129.Humanoid.Health > 0 and DevilFruitMastery >= 1))) then
                                                                        game:service("VirtualInputManager"):SendKeyEvent(true, "C", false, game)
                                                                        wait(0.1)
                                                                        game:service("VirtualInputManager"):SendKeyEvent(false, "C", false, game)
                                                                    end
                                                                elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Human-Human: Buddha") then
                                                                    if not _G.Settings.Configs["Skill Z"] or (not v1129:FindFirstChild("HumanoidRootPart") or (not v1129:FindFirstChild("Humanoid") or (v1129.Humanoid.Health <= 0 or (DevilFruitMastery < 1 or game.Players.LocalPlayer.Character.HumanoidRootPart.Size ~= Vector3.new(7.6, 7.676, 3.686))))) then
                                                                        game:service("VirtualInputManager"):SendKeyEvent(true, "Z", false, game)
                                                                        wait(0.1)
                                                                        game:service("VirtualInputManager"):SendKeyEvent(false, "Z", false, game)
                                                                    end
                                                                    if _G.Settings.Configs["Skill X"] and (v1129:FindFirstChild("HumanoidRootPart") and (v1129:FindFirstChild("Humanoid") and (v1129.Humanoid.Health > 0 and DevilFruitMastery >= 1))) then
                                                                        game:service("VirtualInputManager"):SendKeyEvent(true, "X", false, game)
                                                                        wait(0.1)
                                                                        game:service("VirtualInputManager"):SendKeyEvent(false, "X", false, game)
                                                                    end
                                                                    if _G.Settings.Configs["Skill C"] and (v1129:FindFirstChild("HumanoidRootPart") and (v1129:FindFirstChild("Humanoid") and (v1129.Humanoid.Health > 0 and DevilFruitMastery >= 1))) then
                                                                        game:service("VirtualInputManager"):SendKeyEvent(true, "C", false, game)
                                                                        wait(0.1)
                                                                        game:service("VirtualInputManager"):SendKeyEvent(false, "C", false, game)
                                                                    end
                                                                elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild(game.Players.LocalPlayer.Data.DevilFruit.Value) then
                                                                    game:GetService("Players").LocalPlayer.Character:FindFirstChild(game.Players.LocalPlayer.Data.DevilFruit.Value).MousePos.Value = v1129.HumanoidRootPart.Position
                                                                    if _G.Settings.Configs["Skill Z"] and (v1129:FindFirstChild("HumanoidRootPart") and (v1129:FindFirstChild("Humanoid") and (v1129.Humanoid.Health > 0 and DevilFruitMastery >= 1))) then
                                                                        game:service("VirtualInputManager"):SendKeyEvent(true, "Z", false, game)
                                                                        wait(0.1)
                                                                        game:service("VirtualInputManager"):SendKeyEvent(false, "Z", false, game)
                                                                    end
                                                                    if _G.Settings.Configs["Skill X"] and (v1129:FindFirstChild("HumanoidRootPart") and (v1129:FindFirstChild("Humanoid") and (v1129.Humanoid.Health > 0 and DevilFruitMastery >= 1))) then
                                                                        game:service("VirtualInputManager"):SendKeyEvent(true, "X", false, game)
                                                                        wait(0.1)
                                                                        game:service("VirtualInputManager"):SendKeyEvent(false, "X", false, game)
                                                                    end
                                                                    if _G.Settings.Configs["Skill C"] and (v1129:FindFirstChild("HumanoidRootPart") and (v1129:FindFirstChild("Humanoid") and (v1129.Humanoid.Health > 0 and DevilFruitMastery >= 1))) then
                                                                        game:service("VirtualInputManager"):SendKeyEvent(true, "C", false, game)
                                                                        wait(0.1)
                                                                        game:service("VirtualInputManager"):SendKeyEvent(false, "C", false, game)
                                                                    end
                                                                    if _G.Settings.Configs["Skill V"] and (v1129:FindFirstChild("HumanoidRootPart") and (v1129:FindFirstChild("Humanoid") and (v1129.Humanoid.Health > 0 and DevilFruitMastery >= 1))) then
                                                                        game:service("VirtualInputManager"):SendKeyEvent(true, "V", false, game)
                                                                        wait(0.1)
                                                                        game:service("VirtualInputManager"):SendKeyEvent(false, "V", false, game)
                                                                    end
                                                                    if _G.Settings.Configs["Skill F"] and (v1129:FindFirstChild("HumanoidRootPart") and (v1129:FindFirstChild("Humanoid") and (v1129.Humanoid.Health > 0 and DevilFruitMastery >= 1))) then
                                                                        game:service("VirtualInputManager"):SendKeyEvent(true, "F", false, game)
                                                                        wait(0.1)
                                                                        game:service("VirtualInputManager"):SendKeyEvent(false, "F", false, game)
                                                                    end
                                                                end
                                                            end
                                                            PosMon = v1129.HumanoidRootPart.CFrame
                                                        else
                                                            StartMagnet = true
                                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                                                        end
                                                    end
                                                until v1129.Humanoid.Health <= 0 or (_G.Settings.Mastery["Auto Farm Fruit Mastery"] == false or game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false)
                                                UseSkillMasteryDevilFruit = true
                                                StartMagnet = true
                                            end
                                        end
                                    end)
                                else
                                    StartMagnet = true
                                    if game:GetService("ReplicatedStorage"):FindFirstChild(Name) then
                                        vu192(game:GetService("ReplicatedStorage"):FindFirstChild(Name).HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                                    else
                                        vu192(CFrameMon)
                                    end
                                end
                            end
                        else
                            CheckQuest()
                            repeat
                                wait()
                                vu192(CFrameQuest)
                            until (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 or not _G.Settings.Mastery["Auto Farm Fruit Mastery"]
                            if (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 30 then
                                wait(0.5)
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", QuestName, LevelQuest)
                            end
                        end
                    end)
                end
            end
        end)
        v570:Toggle("Auto Gun Mastery", _G.Settings.Mastery["Auto Farm Gun Mastery"], function(p1130)
			-- upvalues: (ref) vu192
            _G.Settings.Mastery["Auto Farm Gun Mastery"] = p1130
            if p1130 == false then
                vu192(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
            end
            getgenv().SaveSetting()
        end)
        v571:Label("Mastery Config")
        v571:Slider("Mob Health (%)", true, 0, 100, 15, function(p1131)
            _G.Settings.Mastery["Mob Health (%)"] = p1131
            getgenv().SaveSetting()
        end)
        v571:Label("Skill List")
        v571:Toggle("Skill Z", _G.Settings.Configs["Skill Z"], function(p1132)
            _G.Settings.Configs["Skill Z"] = p1132
            getgenv().SaveSetting()
        end)
        v571:Toggle("Skill X", _G.Settings.Configs["Skill X"], function(p1133)
            _G.Settings.Configs["Skill X"] = p1133
            getgenv().SaveSetting()
        end)
        v571:Toggle("Skill C", _G.Settings.Configs["Skill C"], function(p1134)
            _G.Settings.Configs["Skill C"] = p1134
            getgenv().SaveSetting()
        end)
        v571:Toggle("Skill V", _G.Settings.Configs["Skill V"], function(p1135)
            _G.Settings.Configs["Skill V"] = p1135
            getgenv().SaveSetting()
        end)
        spawn(function()
            while wait() do
                if _G.Settings.Mastery["Auto Farm Fruit Mastery"] then
                    CheckQuest()
                    AutoFarmMasteryDevilFruit()
                end
            end
        end)
        spawn(function()
            while wait() do
                if _G.Settings.Mastery["Auto Farm Gun Mastery"] then
                    CheckQuest()
                    AutoFarmMasteryGun()
                end
            end
        end)
        if World2 then
            v572:Label("Evo Race 1->3")
            v572:Toggle("Auto Evo [Mink]", _G.Settings.Evo["Auto Evo Race [Mink]"], function(p1136)
				-- upvalues: (ref) vu192
                _G.Settings.Evo["Auto Evo Race [Mink]"] = p1136
                if p1136 == false then
                    vu192(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
                end
                getgenv().SaveSetting()
            end)
            v572:Toggle("Auto Evo [FishMan]", _G.Settings.Evo["Auto Evo Race [FishMan]"], function(p1137)
				-- upvalues: (ref) vu192
                _G.Settings.Evo["Auto Evo Race [FishMan]"] = p1137
                if p1137 == false then
                    vu192(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
                end
                getgenv().SaveSetting()
            end)
            v572:Toggle("Auto Evo [Human]", _G.Settings.Evo["Auto Evo Race [Human]"], function(p1138)
				-- upvalues: (ref) vu192
                _G.Settings.Evo["Auto Evo Race [Human]"] = p1138
                if p1138 == false then
                    vu192(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
                end
                getgenv().SaveSetting()
            end)
            v572:Toggle("Auto Evo [Sky]", _G.Settings.Evo["Auto Evo Race [Sky]"], function(p1139)
				-- upvalues: (ref) vu192
                _G.Settings.Evo["Auto Evo Race [Sky]"] = p1139
                if p1139 == false then
                    vu192(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
                end
                getgenv().SaveSetting()
            end)
            task.spawn(function()
				-- upvalues: (ref) vu192
                while wait() do
                    pcall(function()
						-- upvalues: (ref) vu192
						-- block 430
                        if _G.Settings.Evo["Auto Evo Race [Mink]"] then
							-- goto l2
                        end
                        if _G.Settings.Evo["Auto Evo Race [FishMan]"] then
							-- goto l84
                        end
                        if _G.Settings.Evo["Auto Evo Race [Human]"] then
							-- goto l159
                        end
                        if not _G.Settings.Evo["Auto Evo Race [Sky]"] then
							-- ::l10::
                            return
                        end
                        if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist", "1") == - 2 then
							-- goto l345
                        end
                        if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist", "1") == 0 then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist", "2")
							-- goto l10
                        end
                        if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist", "1") ~= 1 then
                            if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist", "1") == 2 then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist", "3")
                            end
							-- goto l10
                        end
                        if not (game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 1") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 1")) then
                            vu192(game.Workspace.Flower1.CFrame)
							-- goto l10
                        end
                        if not (game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 2") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 2")) then
                            vu192(game.Workspace.Flower2.CFrame)
							-- goto l10
                        end
                        if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 3") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 3") then
							-- goto l10
                        end
                        if not game:GetService("Workspace").Enemies:FindFirstChild("Swan Pirate [Lv. 775]") then
                            StartMagnet = false
                            vu192(CFrame.new(980.0985107421875, 121.331298828125, 1287.2093505859375))
							-- goto l10
                        end
                        local v1140, v1141, v1142 = pairs(game:GetService("Workspace").Enemies:GetChildren())
						-- ::l369::
                        while true do
                            local v1143
                            v1142, v1143 = v1140(v1141, v1142)
                            if v1142 == nil then
								-- goto l10
                            end
                            if v1143.Name == "Swan Pirate [Lv. 775]" then
								-- goto l372
                            end
                        end
						-- ::l159::
                        if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist", "1") == - 2 then
							-- goto l163
                        end
                        if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist", "1") == 0 then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist", "2")
							-- goto l10
                        end
                        if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist", "1") ~= 1 then
                            if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist", "1") == 2 then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist", "3")
                            end
							-- goto l10
                        end
                        if not (game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 1") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 1")) then
                            vu192(game.Workspace.Flower1.CFrame)
							-- goto l10
                        end
                        if not (game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 2") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 2")) then
                            vu192(game.Workspace.Flower2.CFrame)
							-- goto l10
                        end
                        if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 3") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 3") then
							-- goto l10
                        end
                        if not game:GetService("Workspace").Enemies:FindFirstChild("Swan Pirate [Lv. 775]") then
                            StartMagnet = false
                            vu192(CFrame.new(980.0985107421875, 121.331298828125, 1287.2093505859375))
							-- goto l10
                        end
                        local v1144, v1145, v1146 = pairs(game:GetService("Workspace").Enemies:GetChildren())
						-- goto l187
						-- ::l10::
						-- ::l3::
						-- ::l73::
                        wait()
                        if game:GetService("Workspace"):FindFirstChild(v1148.Name) then
                            toTargetP(v1148.CFrame)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Wenlocktoad", "3")
                        end
                        if _G.Settings.Evo["Auto Evo Race [Mink]"] ~= false and v1148.Parent then
							-- goto l73
                        end
                        vu192(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
						-- ::l66::
                        local v1147, v1148 = v1176(v1177, v1147)
                        if v1147 == nil then
							-- goto l10
                        end
                        if v1148.Name:find("Chest") and (game:GetService("Workspace"):FindFirstChild(v1148.Name) and (v1148.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 1500) then
							-- goto l37
                        else
							-- goto l403
                        end
						-- ::l403::
						-- ::l76::
						-- ::l342::
						-- ::l66::
						-- ::l236::
                        wait()
                        StartMagnet = true
                        FastAttack = true
                        if _G.Settings.Configs["Auto Haki"] and not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
                        end
                        if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
                            wait()
                            EquipWeapon(_G.Settings.Configs["Select Weapon"])
                        end
                        PosMon = v1150.HumanoidRootPart.CFrame
                        if not _G.Settings.Configs["Fast Attack"] then
                            game:GetService("VirtualUser"):CaptureController()
                            game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                        end
                        v1150.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                        if _G.Settings.Configs["Show Hitbox"] then
                            v1150.HumanoidRootPart.Transparency = tonumber(_G.Hitbox_LocalTransparency)
                        else
                            v1150.HumanoidRootPart.Transparency = 1
                        end
                        v1150.Humanoid.JumpPower = 0
                        v1150.Humanoid.WalkSpeed = 0
                        v1150.HumanoidRootPart.CanCollide = false
                        v1150.Humanoid:ChangeState(11)
                        vu192(v1150.HumanoidRootPart.CFrame * CFrame.new(0, _G.Settings.Configs["Distance Auto Farm"], 0))
                        if v1150.Humanoid.Health <= 0 or not (v1150.Parent and _G.Settings.Evo["Auto Evo Race [Human]"]) then
							-- goto l225
                        else
							-- goto l66
                        end
						-- ::l225::
                        local v1149, v1150 = v1152(v1153, v1149)
                        if v1149 == nil then
							-- goto l10
                        end
                        if v1150.Name ~= "Fajita [Lv. 925] [Boss]" or (v1150.Humanoid.Health <= 0 or not (v1150:IsA("Model") and (v1150:FindFirstChild("Humanoid") and v1150:FindFirstChild("HumanoidRootPart")))) then
							-- goto l225
                        else
							-- goto l265
                        end
						-- ::l265::
						-- ::l261::
						-- ::l348::
						-- ::l359::
						-- goto l236
						-- ::l37::
						-- goto l10
						-- ::l187::
                        local v1151
                        v1146, v1151 = v1144(v1145, v1146)
                        if v1146 == nil then
							-- goto l10
                        end
                        if v1151.Name ~= "Swan Pirate [Lv. 775]" then
							-- goto l187
                        else
							-- goto l306
                        end
						-- ::l306::
						-- ::l219::
						-- ::l218::
						-- ::l221::
						-- ::l266::
						-- ::l304::
						-- ::l361::
						-- ::l32::
						-- ::l401::
						-- ::l405::
						-- ::l115::
						-- ::l190::
                        wait()
                        StartMagnet = true
                        FastAttack = true
                        if _G.Settings.Configs["Auto Haki"] and not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
                        end
                        if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
                            wait()
                            EquipWeapon(_G.Settings.Configs["Select Weapon"])
                        end
                        PosMon = v1151.HumanoidRootPart.CFrame
                        if not _G.Settings.Configs["Fast Attack"] then
                            game:GetService("VirtualUser"):CaptureController()
                            game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                        end
                        v1151.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                        if _G.Settings.Configs["Show Hitbox"] then
                            v1151.HumanoidRootPart.Transparency = tonumber(_G.Hitbox_LocalTransparency)
                        else
                            v1151.HumanoidRootPart.Transparency = 1
                        end
                        v1151.Humanoid.JumpPower = 0
                        v1151.Humanoid.WalkSpeed = 0
                        v1151.HumanoidRootPart.CanCollide = false
                        v1151.Humanoid:ChangeState(11)
                        vu192(v1151.HumanoidRootPart.CFrame * CFrame.new(0, _G.Settings.Configs["Distance Auto Farm"], 0))
                        if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 3") or (not v1151.Parent or (v1151.Humanoid.Health <= 0 or _G.Settings.Evo["Auto Evo Race [Human]"] == false)) then
							-- goto l187
                        else
							-- goto l193
                        end
						-- ::l193::
						-- goto l190
						-- ::l163::
                        if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Wenlocktoad", "1") == 0 then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Wenlocktoad", "2")
							-- goto l10
                        end
                        if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Wenlocktoad", "1") ~= 1 then
							-- goto l10
                        end
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Wenlocktoad", "3")
                        if not game.Workspace.Enemies:FindFirstChild("Fajita [Lv. 925] [Boss]") then
							-- goto l224
                        end
                        local v1152, v1153
                        v1152, v1153, v1149 = pairs(game.Workspace.Enemies:GetChildren())
						-- goto l225
						-- ::l224::
                        if game.ReplicatedStorage:FindFirstChild("Fajita [Lv. 925] [Boss]") then
                            vu192(game.ReplicatedStorage:FindFirstChild("Fajita [Lv. 925] [Boss]").HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
							-- goto l10
                        end
                        if not game.Workspace.Enemies:FindFirstChild("Jeremy [Lv. 850] [Boss]") then
							-- goto l264
                        end
                        local v1154, v1155, v1156 = pairs(game.Workspace.Enemies:GetChildren())
						-- goto l265
						-- ::l264::
                        if game.ReplicatedStorage:FindFirstChild("Jeremy [Lv. 850] [Boss]") then
                            vu192(game.ReplicatedStorage:FindFirstChild("Jeremy [Lv. 850] [Boss]").HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
							-- goto l10
                        end
                        if not game.Workspace.Enemies:FindFirstChild("Diamond [Lv. 750] [Boss]") then
                            if game.ReplicatedStorage:FindFirstChild("Diamond [Lv. 750] [Boss]") then
                                vu192(game.ReplicatedStorage:FindFirstChild("Diamond [Lv. 750] [Boss]").HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                            end
							-- goto l10
                        end
                        local v1157, v1158, v1159 = pairs(game.Workspace.Enemies:GetChildren())
						-- ::l305::
                        local v1160
                        v1159, v1160 = v1157(v1158, v1159)
                        if v1159 == nil then
							-- goto l10
                        end
                        if v1160.Name ~= "Diamond [Lv. 750] [Boss]" or (v1160.Humanoid.Health <= 0 or not (v1160:IsA("Model") and (v1160:FindFirstChild("Humanoid") and v1160:FindFirstChild("HumanoidRootPart")))) then
							-- goto l260
                        else
							-- goto l279
                        end
						-- ::l260::
						-- ::l300::
						-- ::l303::
						-- ::l351::
						-- ::l226::
						-- ::l350::
						-- ::l118::
						-- ::l188::
						-- ::l160::
						-- goto l305
						-- ::l279::
						-- ::l301::
						-- ::l347::
						-- ::l365::
						-- ::l263::
						-- ::l85::
						-- ::l370::
						-- ::l223::
						-- ::l162::
						-- ::l316::
                        wait()
                        StartMagnet = true
                        FastAttack = true
                        if _G.Settings.Configs["Auto Haki"] and not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
                        end
                        if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
                            wait()
                            EquipWeapon(_G.Settings.Configs["Select Weapon"])
                        end
                        PosMon = v1160.HumanoidRootPart.CFrame
                        if not _G.Settings.Configs["Fast Attack"] then
                            game:GetService("VirtualUser"):CaptureController()
                            game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                        end
                        v1160.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                        if _G.Settings.Configs["Show Hitbox"] then
                            v1160.HumanoidRootPart.Transparency = tonumber(_G.Hitbox_LocalTransparency)
                        else
                            v1160.HumanoidRootPart.Transparency = 1
                        end
                        v1160.Humanoid.JumpPower = 0
                        v1160.Humanoid.WalkSpeed = 0
                        v1160.HumanoidRootPart.CanCollide = false
                        v1160.Humanoid:ChangeState(11)
                        vu192(v1160.HumanoidRootPart.CFrame * CFrame.new(0, _G.Settings.Configs["Distance Auto Farm"], 0))
                        if v1160.Humanoid.Health <= 0 or not (v1160.Parent and _G.Settings.Evo["Auto Evo Race [Human]"]) then
							-- goto l168
                        else
							-- goto l316
                        end
						-- ::l168::
						-- goto l305
						-- ::l372::
                        wait()
                        StartMagnet = true
                        FastAttack = true
                        if _G.Settings.Configs["Auto Haki"] and not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
                        end
                        if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
                            wait()
                            EquipWeapon(_G.Settings.Configs["Select Weapon"])
                        end
                        PosMon = v1143.HumanoidRootPart.CFrame
                        if not _G.Settings.Configs["Fast Attack"] then
                            game:GetService("VirtualUser"):CaptureController()
                            game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                        end
                        v1143.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                        if _G.Settings.Configs["Show Hitbox"] then
                            v1143.HumanoidRootPart.Transparency = tonumber(_G.Hitbox_LocalTransparency)
                        else
                            v1143.HumanoidRootPart.Transparency = 1
                        end
                        v1143.Humanoid.JumpPower = 0
                        v1143.Humanoid.WalkSpeed = 0
                        v1143.HumanoidRootPart.CanCollide = false
                        v1143.Humanoid:ChangeState(11)
                        vu192(v1143.HumanoidRootPart.CFrame * CFrame.new(0, _G.Settings.Configs["Distance Auto Farm"], 0))
                        if not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 3") and (v1143.Parent and (v1143.Humanoid.Health > 0 and _G.Settings.Evo["Auto Evo Race [Sky]"] ~= false)) then
							-- goto l372
                        end
						-- goto l369
						-- ::l84::
                        if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist", "1") == - 2 then
                            if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Wenlocktoad", "1") ~= 0 then
                                if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Wenlocktoad", "1") == 1 then
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Wenlocktoad", "3")
                                    local v1161, v1162, v1163 = pairs(game:GetService("Workspace").SeaBeasts:GetChildren())
                                    while true do
                                        local v1164
                                        v1163, v1164 = v1161(v1162, v1163)
                                        if v1163 == nil then
                                            break
                                        end
                                        if v1164:FindFirstChild("HumanoidRootPart") then
                                            repeat
                                                wait()
                                                vu192(v1164.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                                            until not (v1164.Parent and _G.Setting_table.Fishman_Evo) or game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Wenlocktoad", "1") == - 2
                                        end
                                    end
                                end
                            else
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Wenlocktoad", "2")
                            end
							-- goto l10
                        end
                        if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist", "1") == 0 then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist", "2")
							-- goto l10
                        end
                        if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist", "1") ~= 1 then
                            if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist", "1") == 2 then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist", "3")
                            end
							-- goto l10
                        end
                        if not (game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 1") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 1")) then
                            vu192(game.Workspace.Flower1.CFrame)
							-- goto l10
                        end
                        if not (game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 2") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 2")) then
                            vu192(game.Workspace.Flower2.CFrame)
							-- goto l10
                        end
                        if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 3") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 3") then
							-- goto l10
                        end
                        if not game:GetService("Workspace").Enemies:FindFirstChild("Swan Pirate [Lv. 775]") then
                            StartMagnet = false
                            vu192(CFrame.new(980.0985107421875, 121.331298828125, 1287.2093505859375))
							-- goto l10
                        end
                        local v1165, v1166, v1167 = pairs(game:GetService("Workspace").Enemies:GetChildren())
						-- ::l112::
                        local v1168
                        v1167, v1168 = v1165(v1166, v1167)
                        if v1167 == nil then
							-- goto l10
                        end
                        if v1168.Name ~= "Swan Pirate [Lv. 775]" then
							-- goto l112
                        end
						-- ::l115::
                        wait()
                        StartMagnet = true
                        FastAttack = true
                        if _G.Settings.Configs["Auto Haki"] and not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
                        end
                        if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
                            wait()
                            EquipWeapon(_G.Settings.Configs["Select Weapon"])
                        end
                        PosMon = v1168.HumanoidRootPart.CFrame
                        if not _G.Settings.Configs["Fast Attack"] then
                            game:GetService("VirtualUser"):CaptureController()
                            game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                        end
                        v1168.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                        if _G.Settings.Configs["Show Hitbox"] then
                            v1168.HumanoidRootPart.Transparency = tonumber(_G.Hitbox_LocalTransparency)
                        else
                            v1168.HumanoidRootPart.Transparency = 1
                        end
                        v1168.Humanoid.JumpPower = 0
                        v1168.Humanoid.WalkSpeed = 0
                        v1168.HumanoidRootPart.CanCollide = false
                        v1168.Humanoid:ChangeState(11)
                        vu192(v1168.HumanoidRootPart.CFrame * CFrame.new(0, _G.Settings.Configs["Distance Auto Farm"], 0))
                        if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 3") or (not v1168.Parent or (v1168.Humanoid.Health <= 0 or _G.Settings.Evo["Auto Evo Race [FishMan]"] == false)) then
							-- goto l112
                        else
							-- goto l115
                        end
						-- ::l345::
                        if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Wenlocktoad", "1") == 0 then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Wenlocktoad", "2")
							-- goto l10
                        end
                        if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Wenlocktoad", "1") ~= 1 then
							-- goto l10
                        end
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Wenlocktoad", "3")
                        local v1169, v1170, v1171 = pairs(game.Players:GetChildren())
						-- goto l404
						-- ::l2::
                        if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist", "1") == - 2 then
							-- goto l6
                        end
                        if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist", "1") == 0 then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist", "2")
							-- goto l10
                        end
                        if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist", "1") ~= 1 then
                            if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist", "1") == 2 then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist", "3")
                            end
							-- goto l10
                        end
                        if not (game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 1") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 1")) then
                            toTargetP(game.Workspace.Flower1.CFrame)
							-- goto l10
                        end
                        if not (game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 2") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 2")) then
                            toTargetP(game.Workspace.Flower2.CFrame)
							-- goto l10
                        end
                        if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 3") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 3") then
							-- goto l10
                        end
                        if not game:GetService("Workspace").Enemies:FindFirstChild("Swan Pirate [Lv. 775]") then
                            StartMagnet = false
                            vu192(CFrame.new(980.0985107421875, 121.331298828125, 1287.2093505859375))
							-- goto l10
                        end
                        local v1172, v1173, v1174 = pairs(game:GetService("Workspace").Enemies:GetChildren())
						-- ::l31::
                        local v1175
                        v1174, v1175 = v1172(v1173, v1174)
                        if v1174 == nil then
							-- goto l10
                        end
                        if v1175.Name ~= "Swan Pirate [Lv. 775]" then
							-- goto l31
                        else
							-- goto l400
                        end
						-- ::l400::
						-- ::l113::
						-- ::l79::
						-- ::l5::
						-- ::l34::
                        wait()
                        StartMagnet = true
                        FastAttack = true
                        if _G.Settings.Configs["Auto Haki"] and not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
                        end
                        if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
                            wait()
                            EquipWeapon(_G.Settings.Configs["Select Weapon"])
                        end
                        PosMon = v1175.HumanoidRootPart.CFrame
                        if not _G.Settings.Configs["Fast Attack"] then
                            game:GetService("VirtualUser"):CaptureController()
                            game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                        end
                        v1175.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                        if _G.Settings.Configs["Show Hitbox"] then
                            v1175.HumanoidRootPart.Transparency = tonumber(_G.Hitbox_LocalTransparency)
                        else
                            v1175.HumanoidRootPart.Transparency = 1
                        end
                        v1175.Humanoid.JumpPower = 0
                        v1175.Humanoid.WalkSpeed = 0
                        v1175.HumanoidRootPart.CanCollide = false
                        v1175.Humanoid:ChangeState(11)
                        vu192(v1175.HumanoidRootPart.CFrame * CFrame.new(0, _G.Settings.Configs["Distance Auto Farm"], 0))
                        if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 3") or (not v1175.Parent or (v1175.Humanoid.Health <= 0 or _G.Settings.Evo["Auto Evo Race [Mink]"] == false)) then
							-- goto l31
                        else
							-- goto l34
                        end
						-- ::l6::
                        if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Wenlocktoad", "1") == 0 then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Wenlocktoad", "2")
							-- goto l10
                        end
                        if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Wenlocktoad", "1") ~= 1 then
							-- goto l10
                        end
                        local v1176, v1177
                        v1176, v1177, v1147 = pairs(game:GetService("Workspace"):GetChildren())
						-- goto l66
						-- ::l67::
						-- goto l265
						-- ::l239::
						-- goto l276
						-- ::l276::
                        wait()
                        StartMagnet = true
                        FastAttack = true
                        if _G.Settings.Configs["Auto Haki"] and not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
                        end
                        if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
                            wait()
                            EquipWeapon(_G.Settings.Configs["Select Weapon"])
                        end
                        PosMon = v1178.HumanoidRootPart.CFrame
                        if not _G.Settings.Configs["Fast Attack"] then
                            game:GetService("VirtualUser"):CaptureController()
                            game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                        end
                        v1178.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                        if _G.Settings.Configs["Show Hitbox"] then
                            v1178.HumanoidRootPart.Transparency = tonumber(_G.Hitbox_LocalTransparency)
                        else
                            v1178.HumanoidRootPart.Transparency = 1
                        end
                        v1178.Humanoid.JumpPower = 0
                        v1178.Humanoid.WalkSpeed = 0
                        v1178.HumanoidRootPart.CanCollide = false
                        v1178.Humanoid:ChangeState(11)
                        vu192(v1178.HumanoidRootPart.CFrame * CFrame.new(0, _G.Settings.Configs["Distance Auto Farm"], 0))
                        if v1178.Humanoid.Health > 0 and (v1178.Parent and _G.Settings.Evo["Auto Evo Race [Human]"]) then
							-- goto l276
                        end
						-- ::l265::
                        local v1178
                        v1156, v1178 = v1154(v1155, v1156)
                        if v1156 == nil then
							-- goto l10
                        end
                        if v1178.Name ~= "Jeremy [Lv. 850] [Boss]" or (v1178.Humanoid.Health <= 0 or not (v1178:IsA("Model") and (v1178:FindFirstChild("Humanoid") and v1178:FindFirstChild("HumanoidRootPart")))) then
							-- goto l356
                        else
							-- goto l354
                        end
						-- ::l354::
						-- goto l367
						-- ::l356::
						-- goto l368
						-- ::l367::
						-- goto l239
						-- ::l368::
						-- goto l67
						-- ::l409::
                        wait()
                        StartMagnet = true
                        FastAttack = true
                        if _G.Settings.Configs["Auto Haki"] and not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
                        end
                        if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
                            wait()
                            EquipWeapon(_G.Settings.Configs["Select Weapon"])
                        end
                        PosMon = v1179.HumanoidRootPart.CFrame
                        if not _G.Settings.Configs["Fast Attack"] then
                            game:GetService("VirtualUser"):CaptureController()
                            game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                        end
                        v1179.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                        if _G.Settings.Configs["Show Hitbox"] then
                            v1179.HumanoidRootPart.Transparency = tonumber(_G.Hitbox_LocalTransparency)
                        else
                            v1179.HumanoidRootPart.Transparency = 1
                        end
                        v1179.Humanoid.JumpPower = 0
                        v1179.Humanoid.WalkSpeed = 0
                        v1179.HumanoidRootPart.CanCollide = false
                        v1179.Humanoid:ChangeState(11)
                        vu192(v1179.HumanoidRootPart.CFrame * CFrame.new(0, _G.Settings.Configs["Distance Auto Farm"], 0))
                        if v1179.Humanoid.Health <= 0 or _G.Settings.Evo["Auto Evo Race [Sky]"] == false then
							-- ::l404::
                            while true do
                                local v1179
                                v1171, v1179 = v1169(v1170, v1171)
                                if v1171 == nil then
									-- goto l10
                                end
                                if v1179.Name ~= game.Players.LocalPlayer.Name and tostring(v1179.Data.Race.Value) == "Skypiea" then
									-- goto l409
                                end
                            end
                        else
							-- goto l409
                        end
                    end)
                end
            end)
        end
        v574:Label("Stats")
        v574:Toggle("Auto Stats", _G.Settings.Stat["Enabled Auto Stats"], function(p1180)
            _G.Settings.Stat["Enabled Auto Stats"] = p1180
            getgenv().SaveSetting()
        end)
        v574:Toggle("Auto Stat Kaitun", _G.Settings.Stat["Auto Stats Kaitun"], function(p1181)
            _G.Settings.Stat["Auto Stats Kaitun"] = p1181
            getgenv().SaveSetting()
        end)
        task.spawn(function()
            while wait() do
                if _G.Settings.Stat["Auto Stats Kaitun"] then
                    if game:GetService("Players").LocalPlayer.Data.Stats.Melee.Level.Value >= 2400 then
                        local v1182 = {
                            "AddPoint",
                            "Defense",
                            tonumber(UpStatus)
                        }
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v1182))
                    else
                        local v1183 = {
                            "AddPoint",
                            "Melee",
                            tonumber(UpStatus)
                        }
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v1183))
                    end
                end
            end
        end)
        v574:Dropdown("Select Stats", {
            "Max Stats",
            "Melee",
            "Defense",
            "Sword",
            "Gun",
            "Devil Fruits"
        }, callback, function(p1184)
            _G.Settings.Stat["Select Stats"] = p1184
            getgenv().SaveSetting()
        end)
        task.spawn(function()
            pcall(function()
                while wait() do
                    if _G.Settings.Stat["Enabled Auto Stats"] then
                        if _G.Settings.Stat["Select Stats"] ~= "Melee" then
                            if _G.Settings.Stat["Select Stats"] ~= "Defense" then
                                if _G.Settings.Stat["Select Stats"] ~= "Sword" then
                                    if _G.Settings.Stat["Select Stats"] ~= "Gun" then
                                        if _G.Settings.Stat["Select Stats"] ~= "Devil Fruits" then
                                            if _G.Settings.Stat["Select Stats"] == "Max Stats" then
                                                if game:GetService("Players").LocalPlayer.Data.Stats.Melee.Level.Value >= 2400 then
                                                    local v1185 = {
                                                        "AddPoint",
                                                        "Defense",
                                                        _G.Settings.Stat["Point Select"]
                                                    }
                                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v1185))
                                                else
                                                    local v1186 = {
                                                        "AddPoint",
                                                        "Melee",
                                                        _G.Settings.Stat["Point Select"]
                                                    }
                                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v1186))
                                                end
                                            end
                                        else
                                            local v1187 = {
                                                "AddPoint",
                                                "Demon Fruit",
                                                _G.Settings.Stat["Point Select"]
                                            }
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v1187))
                                        end
                                    else
                                        local v1188 = {
                                            "AddPoint",
                                            "Gun",
                                            _G.Settings.Stat["Point Select"]
                                        }
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v1188))
                                    end
                                else
                                    local v1189 = {
                                        "AddPoint",
                                        "Sword",
                                        _G.Settings.Stat["Point Select"]
                                    }
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v1189))
                                end
                            else
                                local v1190 = {
                                    "AddPoint",
                                    "Defense",
                                    _G.Settings.Stat["Point Select"]
                                }
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v1190))
                            end
                        else
                            local v1191 = {
                                "AddPoint",
                                "Melee",
                                _G.Settings.Stat["Point Select"]
                            }
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v1191))
                        end
                    end
                end
            end)
        end)
        v574:Slider("Point Select", true, 0, 9, 3, function(p1192)
            _G.Settings.Stat["Point Select"] = p1192
        end)
        v575:Label("Redeem Code")
        v575:Toggle("Redeem Code", _G.Settings.Stat["Enabled Auto Redeem Code"], function(p1193)
            _G.Settings.Stat["Enabled Auto Redeem Code"] = p1193
            getgenv().SaveSetting()
        end)
        v575:Slider("Redeem Select Level", true, 0, 2450, 15, function(p1194)
            _G.Settings.Stat["Select Level Redeem Code"] = p1194
            getgenv().SaveSetting()
        end)
        task.spawn(function()
			-- upvalues: (ref) vu233
            while wait() do
                pcall(function()
					-- upvalues: (ref) vu233
                    local v1195 = game.Players.LocalPlayer.Data.Level.Value
                    if _G.Settings.Stat["Enabled Auto Redeem Code"] and _G.Settings.Stat["Select Level Redeem Code"] <= v1195 then
                        function Redeem(p1196)
                            game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(p1196)
                        end
                        local v1197, v1198, v1199 = pairs(vu233)
                        while true do
                            local v1200
                            v1199, v1200 = v1197(v1198, v1199)
                            if v1199 == nil then
                                break
                            end
                            Redeem(v1200)
                        end
                        wait(3)
                        _G.Settings.Stat["Enabled Auto Redeem Code"] = false
                    end
                end)
            end
        end)
        v576:Label("Combat")
        getplayers = {}
        local v1201, v1202, v1203 = pairs(game.Players:GetChildren())
        while true do
            local v1204, v1205 = v1201(v1202, v1203)
            if v1204 == nil then
                break
            end
            v1203 = v1204
            if v1205.Name ~= game.Players.LocalPlayer.Name then
                table.insert(getplayers, v1205.Name)
            end
        end
        local vu1207 = v576:Dropdown("Select Player", getplayers, callback, function(p1206)
            SelectPlayer = p1206
        end)
        v576:Button("Refresh", function(_)
			-- upvalues: (ref) vu1207
            vu1207:Clear()
            local v1208, v1209, v1210 = pairs(game.Players:GetChildren())
            while true do
                local v1211
                v1210, v1211 = v1208(v1209, v1210)
                if v1210 == nil then
                    break
                end
                if v1211.Name ~= game.Players.LocalPlayer.Name then
                    vu1207:Add(v1211.Name)
                end
            end
        end)
        v576:Toggle("Spectator Player", SpectatorPlayer, function(p1212)
			-- upvalues: (ref) vu192
            SpectatorPlayer = p1212
            if p1212 == false then
                vu192(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
            end
        end)
        task.spawn(function()
            while wait() do
                if SpectatorPlayer then
                    pcall(function()
                        if game.Players:FindFirstChild(SelectPlayer) then
                            game.Workspace.Camera.CameraSubject = game.Players:FindFirstChild(SelectPlayer).Character.Humanoid
                        end
                    end)
                else
                    game.Workspace.Camera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
                end
            end
        end)
        v576:Toggle("Teleport to Player", teleporttop, function(p1213)
			-- upvalues: (ref) vu192
            teleporttop = p1213
            if p1213 == false then
                vu192(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
            end
        end)
        task.spawn(function()
			-- upvalues: (ref) vu192
            while wait() do
                if teleporttop then
                    pcall(function()
						-- upvalues: (ref) vu192
                        if game.Players:FindFirstChild(SelectPlayer) then
                            vu192(game.Players[SelectPlayer].Character.HumanoidRootPart.CFrame)
                        end
                    end)
                end
            end
        end)
        local vu1214 = game:GetService("Players").LocalPlayer:GetMouse()
        task.spawn(function()
			-- upvalues: (ref) vu1214
            while wait() do
                if _G.Settings.Combat["Aimbot Skill"] then
                    pcall(function()
						-- upvalues: (ref) vu1214
                        local v1215 = math.huge
                        local v1216, v1217, v1218 = pairs(game:GetService("Players"):GetChildren())
                        while true do
                            local v1219
                            v1218, v1219 = v1216(v1217, v1218)
                            if v1218 == nil then
                                break
                            end
                            local v1220 = v1219.Character:FindFirstChild("HumanoidRootPart")
                            local v1221, _ = game.Workspace.CurrentCamera.WorldToScreenPoint(game.Workspace.CurrentCamera, v1220.Position)
                            local v1222 = Vector2.new(vu1214.X, vu1214.Y)
                            local v1223 = (Vector2.new(v1221.X, v1221.Y) - v1222).Magnitude
                            if v1223 < v1215 and (v1223 <= tonumber(_G.Settings.Combat["Fov Size"]) and v1219.Name ~= game.Players.LocalPlayer.Name) then
                                _G.Aim_Players = v1219
                                v1215 = v1223
                            end
                        end
                    end)
                end
            end
        end)
        task.spawn(function()
            local v1224 = getrawmetatable(game)
            local vu1225 = v1224.__namecall
            setreadonly(v1224, false)
            v1224.__namecall = newcclosure(function(...)
				-- upvalues: (ref) vu1225
                local v1226 = getnamecallmethod()
                local v1227 = {
                    ...
                }
                if tostring(v1226) ~= "FireServer" or (tostring(v1227[1]) ~= "RemoteEvent" or (tostring(v1227[2]) == "true" or (tostring(v1227[2]) == "false" or not _G.Settings.Combat["Aimbot Skill"]))) then
                    return vu1225(...)
                end
                v1227[2] = _G.Aim_Players.Character.HumanoidRootPart.Position
                return vu1225(unpack(v1227))
            end)
        end)
        local vu1228 = Drawing.new("Circle")
        vu1228.Color = Color3.fromRGB(255, 255, 255)
        vu1228.Thickness = 1
        vu1228.Radius = 250
        vu1228.NumSides = 460
        vu1228.Filled = false
        vu1228.Transparency = 1
        LPH_NO_VIRTUALIZE(function()
			-- upvalues: (ref) vu1228
            game:GetService("RunService").Stepped:Connect(function()
				-- upvalues: (ref) vu1228
                vu1228.Radius = tonumber(_G.Settings.Combat["Fov Size"])
                vu1228.Thickness = 1
                vu1228.NumSides = 460
                vu1228.Position = game:GetService("UserInputService"):GetMouseLocation()
                if _G.Settings.Combat["Show Fov"] then
                    vu1228.Visible = true
                else
                    vu1228.Visible = false
                end
            end)
        end)()
        v576:Slider("Fov Size", true, 0, 1000, 25, function(p1229)
            _G.Settings.Combat["Fov Size"] = p1229
            getgenv().SaveSetting()
        end)
        v576:Toggle("Show Fov", _G.Settings.Combat["Show Fov"], function(p1230)
            _G.Settings.Combat["Show Fov"] = p1230
        end)
        v576:Toggle("Aimbot Skill", _G.Settings.Combat["Aimbot Skill"], function(p1231)
            _G.Settings.Combat["Aimbot Skill"] = p1231
        end)
        local v1232 = getrawmetatable(game)
        local vu1233 = v1232.__namecall
        setreadonly(v1232, false)
        v1232.__namecall = newcclosure(function(...)
			-- upvalues: (ref) vu1233
            local v1234 = getnamecallmethod()
            local v1235 = {
                ...
            }
            if tostring(v1234) ~= "FireServer" or (tostring(v1235[1]) ~= "RemoteEvent" or (tostring(v1235[2]) == "true" or (tostring(v1235[2]) == "false" or not Skillaimbot))) then
                return vu1233(...)
            end
            v1235[2] = AimBotSkillPosition
            return vu1233(unpack(v1235))
        end)
        LPH_NO_VIRTUALIZE(function()
            task.spawn(function()
                while wait() do
                    local v1236, v1237, v1238 = pairs(game.Players.LocalPlayer.Backpack:GetChildren())
                    while true do
                        local v1239
                        v1238, v1239 = v1236(v1237, v1238)
                        if v1238 == nil then
                            break
                        end
                        if v1239:IsA("Tool") and v1239:FindFirstChild("RemoteFunctionShoot") then
                            SelectToolWeaponGun = v1239.Name
                        end
                    end
                    local v1240, v1241, v1242 = pairs(game.Players.LocalPlayer.Character:GetChildren())
                    while true do
                        local v1243
                        v1242, v1243 = v1240(v1241, v1242)
                        if v1242 == nil then
                            break
                        end
                        if v1243:IsA("Tool") and v1243:FindFirstChild("RemoteFunctionShoot") then
                            SelectToolWeaponGun = v1243.Name
                        end
                    end
                end
            end)
        end)()
        task.spawn(function()
            while wait() do
                if Skillaimbot and (game.Players:FindFirstChild(SelectPlayer) and (game.Players:FindFirstChild(SelectPlayer).Character:FindFirstChild("HumanoidRootPart") and (game.Players:FindFirstChild(SelectPlayer).Character:FindFirstChild("Humanoid") and game.Players:FindFirstChild(SelectPlayer).Character.Humanoid.Health > 0))) then
                    AimBotSkillPosition = game.Players:FindFirstChild(SelectPlayer).Character:FindFirstChild("HumanoidRootPart").Position
                end
            end
        end)
        game:GetService("Players").LocalPlayer:GetMouse().Button1Down:Connect(function()
            if Aimbot and (game.Players.LocalPlayer.Character:FindFirstChild(SelectToolWeaponGun) and game:GetService("Players"):FindFirstChild(SelectPlayer)) then
                tool = game:GetService("Players").LocalPlayer.Character[SelectToolWeaponGun]
                v17 = workspace:FindPartOnRayWithIgnoreList(Ray.new(tool.Handle.CFrame.p, (game:GetService("Players"):FindFirstChild(SelectPlayer).Character.HumanoidRootPart.Position - tool.Handle.CFrame.p).unit * 100), {
                    game.Players.LocalPlayer.Character,
                    workspace._WorldOrigin
                })
                game:GetService("Players").LocalPlayer.Character[SelectToolWeaponGun].RemoteFunctionShoot:InvokeServer(game:GetService("Players"):FindFirstChild(SelectPlayer).Character.HumanoidRootPart.Position, (require(game.ReplicatedStorage.Util).Other.hrpFromPart(v17)))
            end
        end)
        v582:Label("Devil Fruit")
        game.ReplicatedStorage:FindFirstChild("Remotes").CommF_:InvokeServer("GetFruits")
        v582:Dropdown("Select Bring Mode", {
            "Bring",
            "Tween"
        }, callback, function(p1244)
            _G.Settings.Devil_Fruit["Bring Fruit Type"] = p1244
        end)
        v582:Toggle("Auto Bring Fruit", _G.Settings.Devil_Fruit["Bring Fruit"], function(p1245)
            _G.Settings.Devil_Fruit["Bring Fruit"] = p1245
        end)
        task.spawn(function()
			-- upvalues: (ref) vu192
            while wait() do
                if _G.Settings.Devil_Fruit["Bring Fruit"] then
                    pcall(function()
						-- upvalues: (ref) vu192
                        local v1246, v1247, v1248 = pairs(game.Workspace:GetChildren())
                        while true do
                            local v1249
                            v1248, v1249 = v1246(v1247, v1248)
                            if v1248 == nil then
                                break
                            end
                            if v1249:IsA("Tool") and v1249:FindFirstChild("Handle") then
                                if _G.Settings.Devil_Fruit["Bring Fruit Type"] == "Bring" and _G.Settings.Devil_Fruit["Bring Fruit"] then
                                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v1249.Handle, 0)
                                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v1249.Handle, 1)
                                end
                                if _G.Settings.Devil_Fruit["Bring Fruit Type"] == "Tween" and _G.Settings.Devil_Fruit["Bring Fruit"] then
                                    _G.BringFound = true
                                    vu192(v1249.Handle.CFrame)
                                end
                            end
                            if v1249.Name == "Fruit " and v1249:FindFirstChild("Handle") then
                                if _G.Settings.Devil_Fruit["Bring Fruit Type"] == "Bring" and _G.Settings.Devil_Fruit["Bring Fruit"] then
                                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v1249.Handle, 0)
                                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v1249.Handle, 1)
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v1249.Handle.CFrame
                                end
                                if _G.Settings.Devil_Fruit["Bring Fruit Type"] == "Tween" and _G.Settings.Devil_Fruit["Bring Fruit"] then
                                    toTargetP(v1249.Handle.CFrame)
                                end
                            end
                        end
                        local v1250 = game.Workspace:FindFirstChildOfClass("Tool")
                        if _G.BringFound and not v1250 then
                            _G.BringFound = false
                        end
                    end)
                end
            end
        end)
        v582:Toggle("Auto Buy Random Fruits", _G.Settings.Devil_Fruit["Auto Buy Random Fruits"], function(p1251)
            _G.Settings.Devil_Fruit["Auto Buy Random Fruits"] = p1251
            getgenv().SaveSetting()
        end)
        task.spawn(function()
            while wait() do
                if _G.Settings.Devil_Fruit["Auto Buy Random Fruits"] then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin", "Buy")
                    wait(15)
                end
            end
        end)
        v582:Button("Buy Random Fruits", function(_)
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin", "Buy")
        end)
        v582:Toggle("Auto Store Fruits", _G.Settings.Devil_Fruit["Auto Store Fruits"], function(p1252)
            _G.Settings.Devil_Fruit["Auto Store Fruits"] = p1252
            Storr = p1252
            getgenv().SaveSetting()
        end)
        function DropFruit()
            game.Players.LocalPlayer.PlayerGui.Main.FruitInventory.Position = UDim2.new(10.1, 0, 0.1, 0)
            game.Players.LocalPlayer.PlayerGui.Main.FruitInventory.Visible = true
            local v1253 = game.Players.LocalPlayer.PlayerGui.Main.FruitInventory.Container.Stored.ScrollingFrame.Frame
            wait(0.3)
            local v1254, v1255, v1256 = pairs(v1253:GetChildren())
            while true do
                local v1257
                v1256, v1257 = v1254(v1255, v1256)
                if v1256 == nil then
                    break
                end
                if string.find(v1257.Name, "-") then
                    local v1258, v1259, v1260 = pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren())
                    while true do
                        local v1261
                        v1260, v1261 = v1258(v1259, v1260)
                        if v1260 == nil then
                            break
                        end
                        FruitStoreF = string.split(v1261.Name, " ")[1]
                        FruitStoreR = FruitStoreF .. "-" .. FruitStoreF
                        if v1257.Name == FruitStoreR then
                            game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(v1261.Name):Destroy()
                        end
                    end
                end
            end
            local v1262, v1263, v1264 = pairs(v1253:GetChildren())
            while true do
                local v1265
                v1264, v1265 = v1262(v1263, v1264)
                if v1264 == nil then
                    break
                end
                if string.find(v1265.Name, "-") then
                    local v1266, v1267, v1268 = pairs(game:GetService("Players").LocalPlayer.Character:GetChildren())
                    while true do
                        local v1269
                        v1268, v1269 = v1266(v1267, v1268)
                        if v1268 == nil then
                            break
                        end
                        FruitStoreF = string.split(v1269.Name, " ")[1]
                        FruitStoreR = FruitStoreF .. "-" .. FruitStoreF
                        if v1265.Name == FruitStoreR then
                            game:GetService("Players").LocalPlayer.Character:FindFirstChild(v1269.Name):Destroy()
                        end
                    end
                end
            end
        end
        task.spawn(function()
            while wait() do
                if _G.Settings.Devil_Fruit["Auto Store Fruits"] then
                    pcall(function()
                        DropFruit()
                        wait()
                        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Bomb Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Bomb Fruit") then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Bomb-Bomb", game:GetService("Players").LocalPlayer.Character:FindFirstChild("Bomb Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Bomb Fruit"))
                        end
                        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spike Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spike Fruit") then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Spike-Spike", game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spike Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spike Fruit"))
                        end
                        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Chop Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Chop Fruit") then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Chop-Chop", game:GetService("Players").LocalPlayer.Character:FindFirstChild("Chop Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Chop Fruit"))
                        end
                        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spring Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spring Fruit") then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Spring-Spring", game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spring Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spring Fruit"))
                        end
                        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Kilo Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Kilo Fruit") then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Kilo-Kilo", game:GetService("Players").LocalPlayer.Character:FindFirstChild("Kilo Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Kilo Fruit"))
                        end
                        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Smoke Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Smoke Fruit") then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Smoke-Smoke", game:GetService("Players").LocalPlayer.Character:FindFirstChild("Smoke Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Smoke Fruit"))
                        end
                        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spin Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spin Fruit") then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Spin-Spin", game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spin Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spin Fruit"))
                        end
                        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flame Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flame Fruit") then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Flame-Flame", game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flame Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flame Fruit"))
                        end
                        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Bird: Falcon Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Bird: Falcon Fruit") then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Bird-Bird: Falcon", game:GetService("Players").LocalPlayer.Character:FindFirstChild("Bird: Falcon Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Bird: Falcon Fruit"))
                        end
                        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Ice Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Ice Fruit") then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Ice-Ice", game:GetService("Players").LocalPlayer.Character:FindFirstChild("Ice Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Ice Fruit"))
                        end
                        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Sand Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Sand Fruit") then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Sand-Sand", game:GetService("Players").LocalPlayer.Character:FindFirstChild("Sand Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Sand Fruit"))
                        end
                        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dark Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dark Fruit") then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Dark-Dark", game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dark Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dark Fruit"))
                        end
                        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Revive Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Revive Fruit") then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Revive-Revive", game:GetService("Players").LocalPlayer.Character:FindFirstChild("Revive Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Revive Fruit"))
                        end
                        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Diamond Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Diamond Fruit") then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Diamond-Diamond", game:GetService("Players").LocalPlayer.Character:FindFirstChild("Diamond Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Diamond Fruit"))
                        end
                        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Light Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Light Fruit") then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Light-Light", game:GetService("Players").LocalPlayer.Character:FindFirstChild("Light Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Light Fruit"))
                        end
                        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Love Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Love Fruit") then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Love-Love", game:GetService("Players").LocalPlayer.Character:FindFirstChild("Love Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Love Fruit"))
                        end
                        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Rubber Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Rubber Fruit") then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Rubber-Rubber", game:GetService("Players").LocalPlayer.Character:FindFirstChild("Rubber Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Rubber Fruit"))
                        end
                        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Barrier Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Barrier Fruit") then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Barrier-Barrier", game:GetService("Players").LocalPlayer.Character:FindFirstChild("Barrier Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Barrier Fruit"))
                        end
                        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Magma Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Magma Fruit") then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Magma-Magma", game:GetService("Players").LocalPlayer.Character:FindFirstChild("Magma Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Magma Fruit"))
                        end
                        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Portal Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Portal Fruit") then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Portal-Portal", game:GetService("Players").LocalPlayer.Character:FindFirstChild("Portal Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Portal Fruit"))
                        end
                        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Quake Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Quake Fruit") then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Quake-Quake", game:GetService("Players").LocalPlayer.Character:FindFirstChild("Quake Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Quake Fruit"))
                        end
                        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Human-Human: Buddha Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Human-Human: Buddha Fruit") then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Human-Human: Buddha", game:GetService("Players").LocalPlayer.Character:FindFirstChild("Human-Human: Buddha Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Human-Human: Buddha Fruit"))
                        end
                        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("String Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("String Fruit") then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "String-String", game:GetService("Players").LocalPlayer.Character:FindFirstChild("String Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("String Fruit"))
                        end
                        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Bird: Phoenix Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Bird: Phoenix Fruit") then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Bird-Bird: Phoenix", game:GetService("Players").LocalPlayer.Character:FindFirstChild("Bird: Phoenix Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Bird: Phoenix Fruit"))
                        end
                        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Rumble Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Rumble Fruit") then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Rumble-Rumble", game:GetService("Players").LocalPlayer.Character:FindFirstChild("Rumble Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Rumble Fruit"))
                        end
                        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Paw Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Paw Fruit") then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Paw-Paw", game:GetService("Players").LocalPlayer.Character:FindFirstChild("Paw Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Paw Fruit"))
                        end
                        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Blizzard Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Blizzard Fruit") then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Blizzard-Blizzard", game:GetService("Players").LocalPlayer.Character:FindFirstChild("Blizzard Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Blizzard Fruit"))
                        end
                        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Gravity Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Gravity Fruit") then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Gravity-Gravity", game:GetService("Players").LocalPlayer.Character:FindFirstChild("Gravity Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Gravity Fruit"))
                        end
                        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dough Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dough Fruit") then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Dough-Dough", game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dough Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dough Fruit"))
                        end
                        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Shadow Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Shadow Fruit") then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Shadow-Shadow", game:GetService("Players").LocalPlayer.Character:FindFirstChild("Shadow Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Shadow Fruit"))
                        end
                        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Venom Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Venom Fruit") then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Venom-Venom", game:GetService("Players").LocalPlayer.Character:FindFirstChild("Venom Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Venom Fruit"))
                        end
                        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Control Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Control Fruit") then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Control-Control", game:GetService("Players").LocalPlayer.Character:FindFirstChild("Control Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Control Fruit"))
                        end
                        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dragon Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Fruit") then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Dragon-Dragon", game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dragon Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Fruit"))
                        end
                        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Leopard Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Leopard Fruit") then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Leopard-Leopard", game:GetService("Players").LocalPlayer.Character:FindFirstChild("Leopard Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Leopard Fruit"))
                        end
                    end)
                end
            end
        end)
        v577:Label("Teleports")
        v577:Button("World 1", function(_)
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelMain")
        end)
        v577:Button("World 2", function(_)
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
        end)
        v577:Button("World 3", function(_)
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
        end)
        if not World1 then
            v577:Toggle("Teleport to Sea Beast", _G.Settings.Teleport["Teleport to Sea Beast"], function(p1270)
				-- upvalues: (ref) vu192
                _G.Settings.Teleport["Teleport to Sea Beast"] = p1270
                if p1270 == false then
                    vu192(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
                end
                getgenv().SaveSetting()
            end)
            task.spawn(function()
				-- upvalues: (ref) vu192
                while wait() do
                    pcall(function()
						-- upvalues: (ref) vu192
                        if _G.Settings.Teleport["Teleport to Sea Beast"] then
                            local v1271, v1272, v1273 = pairs(game.Workspace.SeaBeasts:GetChildren())
                            while true do
                                local v1274
                                v1273, v1274 = v1271(v1272, v1273)
                                if v1273 == nil then
                                    break
                                end
                                if v1274:FindFirstChild("HumanoidRootPart") then
                                    vu192(v1274.HumanoidRootPart.CFrame * CFrame.new(1, 500, 1))
                                end
                            end
                        end
                    end)
                end
            end)
        end
        Location = {}
        local v1275, v1276, v1277 = pairs(game:GetService("Workspace")._WorldOrigin.Locations:GetChildren())
        while true do
            local v1278
            v1277, v1278 = v1275(v1276, v1277)
            if v1277 == nil then
                break
            end
            table.insert(Location, v1278.Name)
        end
        v577:Dropdown("Select Location", Location, callback, function(p1279)
            _G.Island = p1279
        end)
        v577:Toggle("Teleport To Location", false, function(p1280)
			-- upvalues: (ref) vu192
            _G.Teleport = p1280
            local v1281, v1282, v1283 = pairs(game:GetService("Workspace")._WorldOrigin.Locations:GetChildren())
            while true do
                local v1284
                v1283, v1284 = v1281(v1282, v1283)
                if v1283 == nil then
                    break
                end
                if v1284.Name == _G.Island and _G.Teleport then
                    repeat
                        wait()
                        vu192(v1284.CFrame * CFrame.new(0, 40, 0))
                    until not _G.Teleport or game.Players.LocalPlayer.Character.Humanoid.CFrame == v1284.CFrame
                end
            end
            if _G.Teleport == false then
                vu192(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
            end
        end)
        v577:Toggle("Teleport MysticIsland", false, function(p1285)
			-- upvalues: (ref) vu192
            _G.MysticIsland = p1285
            if game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
                repeat
                    wait()
                    vu192(game:GetService("Workspace").Map:FindFirstChild("MysticIsland").HumanoidRootPart.CFrame * CFrame.new(0, 500, - 100))
                until not _G.MysticIsland or game.Players.LocalPlayer.Character.Humanoid.CFrame == v.CFrame
                vu192(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
            end
            if _G.MysticIsland == false then
                vu192(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
            end
        end)
        v577:Button("Stop Teleport", function(_)
			-- upvalues: (ref) vu192
            vu192(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
        end)
        v578:Label("Dungeon")
        v578:Dropdown("Select Dungeon", {
            "Flame",
            "Ice",
            "Quake",
            "Light",
            "Dark",
            "String",
            "Rumble",
            "Magma",
            "Human: Buddha",
            "Sand",
            "Bird: Phoenix",
            "Dough"
        }, callback, function(p1286)
            _G.Settings.Raids["Select Raids"] = p1286
            getgenv().SaveSetting()
        end)
        v578:Dropdown("Select Mode Dungeon", {
            "Normal",
            "Loop",
            "Hop"
        }, callback, function(p1287)
            _G.Settings.Raids["Select Mode Raids"] = p1287
            getgenv().SaveSetting()
        end)
        v578:Toggle("Auto Farm Dungeon", _G.Settings.Raids["Auto Raids"], function(p1288)
			-- upvalues: (ref) vu192
            _G.Settings.Raids["Auto Raids"] = p1288
            if p1288 == false then
                vu192(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
            end
            getgenv().SaveSetting()
        end)
        v578:Toggle("Auto Awakened Skill", _G.Settings.Raids["Auto Awakened"], function(p1289)
            _G.Settings.Raids["Auto Awakened"] = p1289
            getgenv().SaveSetting()
        end)
        function CheckFruit()
            local v1290, v1291, v1292 = pairs(game.Players.LocalPlayer.Backpack:GetChildren())
            while true do
                local v1293
                v1292, v1293 = v1290(v1291, v1292)
                if v1292 == nil then
                    break
                end
                if v1293:IsA("Tool") and string.find(v1293.Name, "Fruit") then
                    return true
                end
            end
            local v1294, v1295, v1296 = pairs(game.Players.LocalPlayer.Character:GetChildren())
            while true do
                local v1297
                v1296, v1297 = v1294(v1295, v1296)
                if v1296 == nil then
                    break
                end
                if v1297:IsA("Tool") and string.find(v1297.Name, "Fruit") then
                    return true
                end
            end
        end
        task.spawn(function()
            while wait() do
                pcall(function()
                    if _G.Settings.Raids["Auto Raids"] and _G.Settings.Raids["Select Mode Raids"] == "Normal" then
                        if not (game.Players.LocalPlayer.Backpack:FindFirstChild("Special Microchip") or (game.Players.LocalPlayer.Character:FindFirstChild("Special Microchip") or (game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 5") or (game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 4") or (game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 3") or (game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 2") or game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 1"))))))) then
                            local v1298 = {
                                "RaidsNpc",
                                "Select",
                                _G.Settings.Raids["Select Raids"]
                            }
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v1298))
                        end
                    elseif _G.Settings.Raids["Auto Raids"] and _G.Settings.Raids["Select Mode Raids"] == "Hop" then
                        if not (game.Players.LocalPlayer.Backpack:FindFirstChild("Special Microchip") or (game.Players.LocalPlayer.Character:FindFirstChild("Special Microchip") or (game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 5") or (game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 4") or (game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 3") or (game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 2") or game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 1"))))))) then
                            _G.Settings.Devil_Fruit["Bring Fruit"] = true
                            wait(10)
                            if not game.Players.LocalPlayer.Backpack:FindFirstChild("Special Microchip") and ((not game.Players.LocalPlayer.Character:FindFirstChild("Special Microchip") or game.Players.LocalPlayer.PlayerGui.Main.Timer.Visible ~= false) and game.Players.LocalPlayer.PlayerGui.Main.Timer.Visible ~= true and not (game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 5") or (game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 4") or (game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 3") or (game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 2") or game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 1")))))) then
                                Fast_Hop()
                            end
                        end
                    elseif _G.Settings.Raids["Auto Raids"] and _G.Settings.Raids["Select Mode Raids"] == "Loop" and not (game.Players.LocalPlayer.Backpack:FindFirstChild("Special Microchip") or (game.Players.LocalPlayer.Character:FindFirstChild("Special Microchip") or (game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 5") or (game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 4") or (game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 3") or (game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 2") or game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 1"))))))) then
                        _G.Settings.Devil_Fruit["Bring Fruit"] = true
                        wait(10)
                        if not game.Players.LocalPlayer.Backpack:FindFirstChild("Special Microchip") and ((not game.Players.LocalPlayer.Character:FindFirstChild("Special Microchip") or game.Players.LocalPlayer.PlayerGui.Main.Timer.Visible ~= false) and game.Players.LocalPlayer.PlayerGui.Main.Timer.Visible ~= true and not (game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 5") or (game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 4") or (game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 3") or (game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 2") or game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 1")))))) then
                            FindFruit = false
                            if CheckFruit() ~= true and (not game.Players.LocalPlayer.Backpack:FindFirstChild("Special Microchip") and (not game.Players.LocalPlayer.Character:FindFirstChild("Special Microchip") and game.Players.LocalPlayer.PlayerGui.Main.Timer.Visible == false)) then
                                if Storr then
                                    _G.Settings.Devil_Fruit["Auto Store Fruits"] = false
                                end
                                local v1299, v1300, v1301 = pairs(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventoryFruits"))
                                while true do
                                    local v1302
                                    v1301, v1302 = v1299(v1300, v1301)
                                    if v1301 == nil then
                                        break
                                    end
                                    if v1302.Price < 1000000 then
                                        FindFruit = true
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LoadFruit", v1302.Name)
                                    end
                                end
                            end
                            if CheckFruit() == true and (not game.Players.LocalPlayer.Backpack:FindFirstChild("Special Microchip") and (not game.Players.LocalPlayer.Character:FindFirstChild("Special Microchip") and game.Players.LocalPlayer.PlayerGui.Main.Timer.Visible == false)) then
                                FindFruit = true
                                local v1303 = {
                                    "RaidsNpc",
                                    "Select",
                                    tostring(_G.Settings.Raids["Select Raids"])
                                }
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v1303))
                                if Storr then
                                    _G.Settings.Devil_Fruit["Auto Store Fruits"] = true
                                end
                            end
                        end
                    end
                end)
            end
        end)
        task.spawn(function()
			-- upvalues: (ref) vu192
            while wait() do
                pcall(function()
					-- upvalues: (ref) vu192
                    if _G.Settings.Raids["Auto Raids"] then
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Special Microchip") or game.Players.LocalPlayer.Character:FindFirstChild("Special Microchip") and game.Players.LocalPlayer.PlayerGui.Main.Timer.Visible == false then
                            if World2 then
                                fireclickdetector(Workspace.Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector)
                            elseif World3 then
                                fireclickdetector(Workspace.Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector)
                            end
                            wait(5)
							-- goto l3
                        end
                        if game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 5") or (game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 4") or (game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 3") or (game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 2") or game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 1")))) then
                            if game.Players.LocalPlayer.PlayerGui.Main.Timer.Visible ~= true then
								-- goto l3
                            end
                            wait()
                            if game.Players.LocalPlayer.PlayerGui.Main.Timer.Visible ~= false then
                                if game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 5") then
                                    game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 5").CFrame = CFrame.new(game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 5").CFrame.x, 60, game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 5").CFrame.z)
                                    if (game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 5").Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 350 then
                                        if (game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 5").Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 350 then
                                            if Farmtween then
                                                Farmtween:Stop()
                                            end
                                            vu192(game:GetService("Workspace")._WorldOrigin.Locations["Island 5"].CFrame * CFrame.new(4, 65, 10))
                                        end
                                    else
                                        Farmtween = vu192(game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 5").CFrame)
                                    end
                                elseif game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 4") then
                                    game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 4").CFrame = CFrame.new(game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 4").CFrame.x, 60, game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 4").CFrame.z)
                                    if (game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 4").Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 350 then
                                        if (game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 4").Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 350 then
                                            if Farmtween then
                                                Farmtween:Stop()
                                            end
                                            vu192(game:GetService("Workspace")._WorldOrigin.Locations["Island 4"].CFrame * CFrame.new(4, 65, 10))
                                        end
                                    else
                                        Farmtween = vu192(game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 4").CFrame)
                                    end
                                elseif game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 3") then
                                    game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 3").CFrame = CFrame.new(game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 3").CFrame.x, 60, game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 3").CFrame.z)
                                    if (game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 3").Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 350 then
                                        if (game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 3").Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 350 then
                                            if Farmtween then
                                                Farmtween:Stop()
                                            end
                                            vu192(game:GetService("Workspace")._WorldOrigin.Locations["Island 3"].CFrame * CFrame.new(4, 65, 10))
                                        end
                                    else
                                        Farmtween = vu192(game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 3").CFrame)
                                    end
                                elseif game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 2") then
                                    game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 2").CFrame = CFrame.new(game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 2").CFrame.x, 60, game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 2").CFrame.z)
                                    if (game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 2").Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 350 then
                                        if (game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 2").Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 350 then
                                            if Farmtween then
                                                Farmtween:Stop()
                                            end
                                            vu192(game:GetService("Workspace")._WorldOrigin.Locations["Island 2"].CFrame * CFrame.new(4, 65, 10))
                                        end
                                    else
                                        Farmtween = vu192(game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 2").CFrame)
                                    end
                                elseif game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 1") then
                                    game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 1").CFrame = CFrame.new(game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 1").CFrame.x, 60, game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 1").CFrame.z)
                                    if (game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 1").Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 350 then
                                        if (game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 1").Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 350 then
                                            if Farmtween then
                                                Farmtween:Stop()
                                            end
                                            vu192(game:GetService("Workspace")._WorldOrigin.Locations["Island 1"].CFrame * CFrame.new(4, 65, 10))
                                        end
                                    else
                                        Farmtween = vu192(game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 1").CFrame)
                                    end
                                end
                            end
                            if not game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 5") or (not game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 4") or (not game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 3") or (not game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 2") or (not game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 1") or game.Players.LocalPlayer.PlayerGui.Main.Timer.Visible == false)))) then
								-- goto l3
                            end
                        end
                        if _G.Settings.Raids["Auto Awakened"] then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Awakener", "Awaken")
                        end
                        local v1304 = {
                            "RaidsNpc",
                            "Select",
                            tostring(_G.Settings.Raids["Select Raids"])
                        }
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v1304))
                    end
					-- ::l3::
                end)
            end
        end)
        task.spawn(function()
            while wait() do
                pcall(function()
                    if _G.Settings.Raids["Auto Raids"] then
                        local v1305, v1306, v1307 = pairs(game.Workspace.Enemies:GetDescendants())
                        while true do
                            local v1308
                            v1307, v1308 = v1305(v1306, v1307)
                            if v1307 == nil then
                                break
                            end
                            if game.Players.LocalPlayer.PlayerGui.Main.Timer.Visible == true and (v1308:FindFirstChild("Humanoid") and (v1308:FindFirstChild("HumanoidRootPart") and v1308.Humanoid.Health > 0)) then
                                repeat
                                    wait()
                                    v1308.Humanoid.Health = 0
                                    v1308.HumanoidRootPart.CanCollide = false
                                    v1308.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                    v1308.HumanoidRootPart.Transparency = 0.8
                                until not _G.Settings.Raids["Auto Raids"] or (not RaidSuperhuman or (not v1308.Parent or v1308.Humanoid.Health <= 0))
                            end
                        end
                    end
                end)
            end
        end)
        if World2 then
            v579:Label("Law Dungeon")
            v579:Toggle("Auto Farm Law Dungeon", _G.Settings.Raids["Auto Farm Law Dungeon"], function(p1309)
				-- upvalues: (ref) vu192
                _G.Settings.Raids["Auto Farm Law Dungeon"] = p1309
                if p1309 == false then
                    vu192(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
                end
                getgenv().SaveSetting()
            end)
            task.spawn(function()
				-- upvalues: (ref) vu192
                while wait() do
                    if _G.Settings.Raids["Auto Farm Law Dungeon"] then
                        pcall(function()
							-- upvalues: (ref) vu192
							-- block 48
                            if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Microchip") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Microchip") then
                                fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon.Button.Main.ClickDetector)
								-- goto l6
                            end
                            if not (game:GetService("ReplicatedStorage"):FindFirstChild("Order [Lv. 1250] [Raid Boss]") or game:GetService("Workspace").Enemies:FindFirstChild("Order [Lv. 1250] [Raid Boss]")) then
                                wait(3)
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Microchip", "2")
								-- ::l6::
                                return
                            end
                            local v1310, v1311, v1312 = pairs(game.Workspace.Enemies:GetChildren())
							-- goto l12
							-- ::l23::
                            wait()
                            FastAttack = true
                            if _G.Settings.Configs["Auto Haki"] and not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
                            end
                            if not game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Configs["Select Weapon"]) then
                                wait()
                                EquipWeapon(_G.Settings.Configs["Select Weapon"])
                            end
                            if not _G.Settings.Configs["Fast Attack"] then
                                game:GetService("VirtualUser"):CaptureController()
                                game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                            end
                            v1313.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                            if _G.Settings.Configs["Show Hitbox"] then
                                v1313.HumanoidRootPart.Transparency = tonumber(_G.Hitbox_LocalTransparency)
                            else
                                v1313.HumanoidRootPart.Transparency = 1
                            end
                            v1313.Humanoid.JumpPower = 0
                            v1313.Humanoid.WalkSpeed = 0
                            v1313.HumanoidRootPart.CanCollide = false
                            v1313.Humanoid:ChangeState(11)
                            vu192(v1313.HumanoidRootPart.CFrame * CFrame.new(0, _G.Settings.Configs["Distance Auto Farm"], 0))
                            if _G.Settings.Raids["Auto Farm Law Dungeon"] and (v1313.Humanoid.Health > 0 and v1313.Parent) then
								-- goto l23
                            end
                            FastAttack = false
							-- ::l12::
                            while true do
                                local v1313
                                v1312, v1313 = v1310(v1311, v1312)
                                if v1312 == nil then
									-- goto l6
                                end
                                if _G.Settings.Raids["Auto Farm Law Dungeon"] and (v1313.Name == "Order [Lv. 1250] [Raid Boss]" and (v1313:FindFirstChild("HumanoidRootPart") and (v1313:FindFirstChild("Humanoid") and v1313.Humanoid.Health > 0))) then
									-- goto l23
                                end
                            end
                        end)
                    end
                end
            end)
        end
        v580:Label("Bones")
        v580:Toggle("Auto Random Bone", _G.Settings.Main["Auto Random Bone"], function(p1314)
            _G.Settings.Main["Auto Random Bone"] = p1314
            getgenv().SaveSetting()
        end)
        task.spawn(function()
            while wait(0.1) do
                if _G.Settings.Main["Auto Random Bone"] then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones", "Buy", 1, 1)
                end
            end
        end)
        if World2 then
            v580:Label("Legendary Sword")
            v580:Toggle("Auto Legendary Sword", _G.Settings.Main["Auto Buy Legendary Sword"], function(p1315)
                _G.Settings.Main["Auto Buy Legendary Sword"] = p1315
                getgenv().SaveSetting()
            end)
        end
        v580:Toggle("Auto Buy Color Enhancement", _G.Settings.Main["Auto Buy Enchanment Haki"], function(p1316)
            _G.Settings.Main["Auto Buy Enchanment Haki"] = p1316
            getgenv().SaveSetting()
        end)
        task.spawn(function()
            while wait() do
                if _G.Settings.Main["Auto Buy Legendary Sword"] then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                        "LegendarySwordDealer",
                        "1"
                    }))
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                        "LegendarySwordDealer",
                        "2"
                    }))
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                        "LegendarySwordDealer",
                        "3"
                    }))
                end
            end
        end)
        v580:Label("Fragment")
        v580:Button("Refund Stat", function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Refund", "1")
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Refund", "2")
        end)
        v580:Button("Reroll Race", function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Reroll", "1")
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Reroll", "2")
        end)
        v580:Label("Buy Abilities")
        v580:Button("Haki", function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki", "Buso")
        end)
        v580:Button("Geppo", function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki", "Geppo")
        end)
        v580:Button("Soru", function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki", "Soru")
        end)
        v580:Button("KenHaki", function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenTalk", "Buy")
        end)
        v580:Label("Auto Buy Fighting Style")
        v580:Button("Black Leg", function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBlackLeg")
        end)
        v580:Button("Electro", function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectro")
        end)
        v580:Button("Fishman Karate", function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate")
        end)
        v580:Button("Dragon Claw", function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "1")
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "2")
        end)
        v580:Button("Superhuman", function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman")
        end)
        v580:Button("Death Step", function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep")
        end)
        v580:Button("Sharkman Karate", function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate", true)
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate")
        end)
        v580:Button("Electric Claw", function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw", true)
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
        end)
        v580:Button("Dragon Talon", function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon", true)
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon")
        end)
        v580:Button("Godhuman", function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGodhuman", true)
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGodhuman")
        end)
        v581:Label("Sword")
        v581:Button("Katana", function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Katana")
        end)
        v581:Button("Cutlass", function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Cutlass")
        end)
        v581:Button("Duel Katana", function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Duel Katana")
        end)
        v581:Button("Iron Mace", function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Iron Mace")
        end)
        v581:Button("Pipe", function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Pipe")
        end)
        v581:Button("Triple Katana", function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Triple Katana")
        end)
        v581:Button("Dual-Headed Blade", function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Dual-Headed Blade")
        end)
        v581:Button("Bisento", function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Bisento")
        end)
        v581:Button("Soul Cane", function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Soul Cane")
        end)
        v581:Label("Gun")
        v581:Button("Slingshot", function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Slingshot")
        end)
        v581:Button("Musket", function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Musket")
        end)
        v581:Button("Flintlock", function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Flintlock")
        end)
        v581:Button("Refined Flintlock", function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Refined Flintlock")
        end)
        v581:Button("Cannon", function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Cannon")
        end)
        v581:Button("Kabucha", function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Slingshot", "1")
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Slingshot", "2")
        end)
        v581:Label("Accessory")
        v581:Button("Black Cape", function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Black Cape")
        end)
        v581:Button("Toemo Ring", function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Tomoe Ring")
        end)
        v581:Button("Swordsman Hat", function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Swordsman Hat")
        end)
        v581:Label("All Items")
        v581:Button("Buy All Items", function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Swordsman Hat")
            print("Swordsman Hat Buy!")
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Tomoe Ring")
            print("Tomoe Ring Buy!")
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Black Cape")
            print("Black Cape Buy!")
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Slingshot", "1")
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Slingshot", "2")
            print("Kabucha Buy!")
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Cannon")
            print("Cannon Buy!")
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Refined Flintlock")
            print("Refined Flintlock Buy!")
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Flintlock")
            print("Flintlock Buy!")
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Musket")
            print("Musket Buy!")
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Slingshot")
            print("Slingshot Buy!")
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Soul Cane")
            print("Soul Cane Buy!")
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Bisento")
            print("Bisento Buy!")
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Dual-Headed Blade")
            print("Dual-Headed Blade Buy!")
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Pipe")
            print("Pipe Buy!")
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Triple Katana")
            print("Triple Katana Buy!")
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Iron Mace")
            print("Iron Mace Buy!")
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Duel Katana")
            print("Duel Katana Buy!")
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Cutlass")
            print("Cutlass Buy!")
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Katana")
            print("Katana Buy!")
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenTalk", "Buy")
            print("Ken Buy!")
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki", "Soru")
            print("Soru Buy!")
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki", "Geppo")
            print("Geppo Buy!")
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki", "Buso")
            print("Buso Buy!")
        end)
        v583:Label("Fps UnLocker")
        v583:Slider("Fps Lock", true, 5, 240, 5, function(p1317)
            _G.Settings.HUD.FPS = p1317
            getgenv().SaveSetting()
        end)
        v583:Toggle("Lock Fps", _G.Settings.HUD.LockFPS, function(p1318)
            _G.Settings.HUD.LockFPS = p1318
            getgenv().SaveSetting()
            if _G.Settings.HUD.LockFPS ~= true then
                setfpscap(120)
            else
                setfpscap(_G.Settings.HUD.FPS)
            end
        end)
        local vu1319 = game.Lighting
        local vu1320 = Instance.new("ColorCorrectionEffect", vu1319)
        local vu1321 = Instance.new("ColorCorrectionEffect", vu1319)
        OldAmbient = vu1319.Ambient
        OldBrightness = vu1319.Brightness
        OldColorShift_Top = vu1319.ColorShift_Top
        OldBrightnessc = vu1320.Brightness
        OldContrastc = vu1320.Contrast
        OldTintColorc = vu1320.TintColor
        OldTintColore = vu1321.TintColor
        v583:Toggle("Rtx Graphic", _G.RTXMode, function(p1322)
			-- upvalues: (ref) vu1319, (ref) vu1320, (ref) vu1321
            _G.RTXMode = p1322
            if _G.RTXMode then
                while _G.RTXMode do
                    wait()
                    vu1319.Ambient = Color3.fromRGB(33, 33, 33)
                    vu1319.Brightness = 0.3
                    vu1320.Brightness = 0.176
                    vu1320.Contrast = 0.39
                    vu1320.TintColor = Color3.fromRGB(217, 145, 57)
                    game.Lighting.FogEnd = 999
                    if not game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("PointLight") then
                        local v1323 = Instance.new("PointLight")
                        v1323.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
                        v1323.Range = 15
                        v1323.Color = Color3.fromRGB(217, 145, 57)
                    end
                    if not _G.RTXMode then
                        vu1319.Ambient = OldAmbient
                        vu1319.Brightness = OldBrightness
                        vu1319.ColorShift_Top = OldColorShift_Top
                        vu1320.Contrast = OldContrastc
                        vu1320.Brightness = OldBrightnessc
                        vu1320.TintColor = OldTintColorc
                        vu1321.TintColor = OldTintColore
                        game.Lighting.FogEnd = 2500
                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("PointLight"):Destroy()
                    end
                end
            end
        end)
        game:GetService("UserInputService")
        local vu1324 = game:GetService("RunService")
        v583:Toggle("White Screen", _G.Settings.HUD["White Screen"], function(p1325)
			-- upvalues: (ref) vu1324
            _G.Settings.HUD["White Screen"] = p1325
            getgenv().SaveSetting()
            if p1325 == true then
                vu1324:Set3dRenderingEnabled(false)
                setfpscap(30)
            else
                vu1324:Set3dRenderingEnabled(true)
                setfpscap(120)
            end
        end)
        v583:Toggle("No Fog", _G.Settings.Misc["No Fog"], function(p1326)
            _G.Settings.Misc["No Fog"] = p1326
            getgenv().SaveSetting()
        end)
        task.spawn(function()
            while wait() do
                pcall(function()
                    if _G.Settings.Misc["No Fog"] then
                        game.Lighting.FogEnd = math.huge
                        if game:GetService("Lighting"):FindFirstChild("BaseAtmosphere") then
                            game:GetService("Lighting"):FindFirstChild("BaseAtmosphere"):Destroy()
                        end
                    else
                        game.Lighting.FogEnd = 2500
                    end
                end)
            end
        end)
        v585:Label("Esp")
        if World2 then
            v585:Toggle("Flower Esp", _G.FlowerEsp, function(p1327)
                _G.FlowerEsp = p1327
                while _G.FlowerEsp do
                    wait()
                    FlowerESP()
                end
                if _G.FlowerEsp == false then
                    v:FindFirstChild("NameEsp" .. Number):Destroy()
                end
            end)
        end
        v585:Toggle("Fruit Esp", _G.DFEsp, function(p1328)
            _G.DFEsp = p1328
            while _G.DFEsp do
                wait()
                UpdateBfEsp()
            end
        end)
        v585:Toggle("Island Esp", _G.IslandEsp, function(p1329)
            _G.IslandEsp = p1329
            while _G.IslandEsp do
                wait()
                IslandESP()
            end
            if _G.IslandEsp == false then
                v:FindFirstChild("NameEsp"):Destroy()
            end
        end)
        v585:Toggle("Chest Esp", _G.ChestEsp, function(p1330)
            _G.ChestEsp = p1330
            while _G.ChestEsp do
                wait()
                ChestSESP()
            end
            if _G.ChestEsp == false then
                v:FindFirstChild("NameEsp" .. Number):Destroy()
            end
        end)
        v583:Toggle("Inf Mink Race Skill", _G.InfinitieAbilitiesMink, function(p1331)
            _G.InfinitieAbilitiesMink = p1331
            if _G.InfinitieAbilitiesMink then
                game:GetService("ReplicatedStorage").FX.Agility:Clone().Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
            else
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Agility:Destroy()
            end
        end)
        v584:Button("Hop Server", function()
            Fast_Hop()
        end)
        v584:Button("Hop Less Server", function()
			-- upvalues: (ref) vu226
            vu226()
        end)
        v584:Button("Rejoin", function()
            local v1332 = game:GetService("TeleportService")
            local v1333 = game.Players.LocalPlayer
            v1332:Teleport(game.PlaceId, v1333)
        end)
        v584:Toggle("Auto Rejoin", true, function(_)
            _G.Settings.Misc["Auto Rejoin"] = true
            getgenv().SaveSetting()
        end)
        LPH_JIT_MAX(function()
            task.spawn(function()
                while wait() do
                    if _G.Settings.Misc["Auto Rejoin"] then
                        _G.Settings.Misc["Auto Rejoin"] = game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(p1334)
                            if p1334.Name == "ErrorPrompt" and p1334:FindFirstChild("MessageArea") and p1334.MessageArea:FindFirstChild("ErrorFrame") then
                                game:GetService("TeleportService"):Teleport(game.PlaceId)
                            end
                        end)
                    end
                end
            end)
        end)()
        return create
    end
end