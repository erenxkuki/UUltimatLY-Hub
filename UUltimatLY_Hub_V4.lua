--[[
getgenv().Team = "Marines"          -- Pirates or Marines
loadstring(game:HttpGet("https://raw.githubusercontent.com/Phatdepzaicrystal/Phat/refs/heads/main/Phat.lua"))()
]] --
if getgenv().Team == "Pirates" then
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam", "Pirates")
elseif getgenv().Team == "Marines" then
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam", "Marines")
end
wait(4)
------------------------------------------------------------------------------------------------------------------------------
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local Window =
    Fluent:CreateWindow(
    {
        Title = "UUltimatLY Hub V4",
        SubTitle = "Make by realryzu",
        TabWidth = 160,
        Size = UDim2.fromOffset(530, 350),
        Acrylic = false,
        Theme = "Dark",
        MinimizeKey = Enum.KeyCode.End
    }
)

local Tabs = {
    Sever = Window:AddTab({Title = "Status And Server", Icon = "loader"}),
    Main = Window:AddTab({Title = "Main", Icon = "home"}),
    Setting = Window:AddTab({Title = "Settings", Icon = "sliders"}),
    Player = Window:AddTab({Title = "PvP", Icon = "shield"}),
    Item = Window:AddTab({Title = "Get Item", Icon = "sword"}),
    Fish = Window:AddTab({Title = "Sea Event", Icon = "anchor"}),
    Volcanic = Window:AddTab({Title = "Volcano Event", Icon = "tent"}),	
    S =	Window:AddTab({Title = "Setting For Sea Event", Icon = "layers"}),	
    Teleport = Window:AddTab({Title = "Teleport", Icon = "map"}),
    Fruit = Window:AddTab({Title = "Fruit", Icon = "apple"}),
    Raid = Window:AddTab({Title = "Raid", Icon = "target"}),
    Race = Window:AddTab({Title = "Race", Icon = "flag"}),
    Shop = Window:AddTab({Title = "Shop", Icon = "shopping-bag"}),
    Misc = Window:AddTab({Title = "Misc", Icon = "menu"})
}
local Options = Fluent.Options
do
    --Place Id Check
    local id = game.PlaceId
    if id == 2753915549 then
        World1 = true
    elseif id == 4442272183 then
        World2 = true
    elseif id == 7449423635 then
        World3 = true
    else
        game:Shutdown()
    end

    game:GetService("Players").LocalPlayer.Idled:connect(
        function()
            game:GetService("VirtualUser"):Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
            wait(1)
            game:GetService("VirtualUser"):Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
        end
    )

    local a = Instance.new("ScreenGui")
    local b = Instance.new("ImageButton")
    local c = Instance.new("UICorner")
    a.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    a.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    b.Parent = a
    b.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    b.BorderColor3 = Color3.fromRGB(0, 0, 0)
    b.BorderSizePixel = 0
    b.Position = UDim2.new(0.103761353, 0, 0.214939028, 0)
    b.Size = UDim2.new(0, 55, 0, 55)
    b.Draggable = true
    b.Image = "rbxassetid://73642467719097"
    c.Parent = b
    local function d()
        local e = Instance.new("LocalScript", b)
        e.Parent.MouseButton1Click:Connect(
            function()
                game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.End, false, game)
            end
        )
    end
    coroutine.wrap(d)()

    First_Sea = false
    Second_Sea = false
    Third_Sea = false
    local placeId = game.PlaceId
    if placeId == 2753915549 then
        First_Sea = true
    elseif placeId == 4442272183 then
        Second_Sea = true
    elseif placeId == 7449423635 then
        Third_Sea = true
    end

    ------------------------------------Notify
    local players = game:GetService("Players")
    game:GetService("StarterGui"):SetCore(
        "SendNotification",
        {
            Title = "UUltimatLY Hub",
            Text = "Loaded Success",
            Duration = 10
        }
    )

    ------------------------------------------------------------------------------------------------------------------------------------
    function FindQuest()
        local Lv = game:GetService("Players").LocalPlayer.Data.Level.Value
        if First_Sea then
            if Lv == 1 or Lv <= 9 or SelectMonster == "Bandit" or SelectArea == "" then -- Bandit
                Ms = "Bandit"
                NameQuest = "BanditQuest1"
                QuestLv = 1
                NameMon = "Bandit"
                CFrameQ = CFrame.new(1060.9383544922, 16.455066680908, 1547.7841796875)
                CFrameMon = CFrame.new(1038.5533447266, 41.296249389648, 1576.5098876953)
            elseif Lv == 10 or Lv <= 14 or SelectMonster == "Monkey" or SelectArea == "Jungle" then -- Monkey
                Ms = "Monkey"
                NameQuest = "JungleQuest"
                QuestLv = 1
                NameMon = "Monkey"
                CFrameQ = CFrame.new(-1601.6553955078, 36.85213470459, 153.38809204102)
                CFrameMon = CFrame.new(-1448.1446533203, 50.851993560791, 63.60718536377)
            elseif Lv == 15 or Lv <= 29 or SelectMonster == "Gorilla" or SelectArea == "Jungle" then -- Gorilla
                Ms = "Gorilla"
                NameQuest = "JungleQuest"
                QuestLv = 2
                NameMon = "Gorilla"
                CFrameQ = CFrame.new(-1601.6553955078, 36.85213470459, 153.38809204102)
                CFrameMon = CFrame.new(-1142.6488037109, 40.462348937988, -515.39227294922)
            elseif Lv == 30 or Lv <= 39 or SelectMonster == "Pirate" or SelectArea == "Buggy" then -- Pirate
                Ms = "Pirate"
                NameQuest = "BuggyQuest1"
                QuestLv = 1
                NameMon = "Pirate"
                CFrameQ = CFrame.new(-1140.1761474609, 4.752049446106, 3827.4057617188)
                CFrameMon = CFrame.new(-1201.0881347656, 40.628940582275, 3857.5966796875)
            elseif Lv == 40 or Lv <= 59 or SelectMonster == "Brute" or SelectArea == "Buggy" then -- Brute
                Ms = "Brute"
                NameQuest = "BuggyQuest1"
                QuestLv = 2
                NameMon = "Brute"
                CFrameQ = CFrame.new(-1140.1761474609, 4.752049446106, 3827.4057617188)
                CFrameMon = CFrame.new(-1387.5324707031, 24.592035293579, 4100.9575195313)
            elseif Lv == 60 or Lv <= 74 or SelectMonster == "Desert Bandit" or SelectArea == "Desert" then -- Desert Bandit
                Ms = "Desert Bandit"
                NameQuest = "DesertQuest"
                QuestLv = 1
                NameMon = "Desert Bandit"
                CFrameQ = CFrame.new(896.51721191406, 6.4384617805481, 4390.1494140625)
                CFrameMon = CFrame.new(984.99896240234, 16.109552383423, 4417.91015625)
            elseif Lv == 75 or Lv <= 89 or SelectMonster == "Desert Officer" or SelectArea == "Desert" then -- Desert Officer
                Ms = "Desert Officer"
                NameQuest = "DesertQuest"
                QuestLv = 2
                NameMon = "Desert Officer"
                CFrameQ = CFrame.new(896.51721191406, 6.4384617805481, 4390.1494140625)
                CFrameMon = CFrame.new(1547.1510009766, 14.452038764954, 4381.8002929688)
            elseif Lv == 90 or Lv <= 99 or SelectMonster == "Snow Bandit" or SelectArea == "Snow" then -- Snow Bandit
                Ms = "Snow Bandit"
                NameQuest = "SnowQuest"
                QuestLv = 1
                NameMon = "Snow Bandit"
                CFrameQ = CFrame.new(1386.8073730469, 87.272789001465, -1298.3576660156)
                CFrameMon = CFrame.new(1356.3028564453, 105.76865386963, -1328.2418212891)
            elseif Lv == 100 or Lv <= 119 or SelectMonster == "Snowman" or SelectArea == "Snow" then -- Snowman
                Ms = "Snowman"
                NameQuest = "SnowQuest"
                QuestLv = 2
                NameMon = "Snowman"
                CFrameQ = CFrame.new(1386.8073730469, 87.272789001465, -1298.3576660156)
                CFrameMon = CFrame.new(1218.7956542969, 138.01184082031, -1488.0262451172)
            elseif Lv == 120 or Lv <= 149 or SelectMonster == "Chief Petty Officer" or SelectArea == "Marine" then -- Chief Petty Officer
                Ms = "Chief Petty Officer"
                NameQuest = "MarineQuest2"
                QuestLv = 1
                NameMon = "Chief Petty Officer"
                CFrameQ = CFrame.new(-5035.49609375, 28.677835464478, 4324.1840820313)
                CFrameMon = CFrame.new(-4931.1552734375, 65.793113708496, 4121.8393554688)
            elseif Lv == 150 or Lv <= 174 or SelectMonster == "Sky Bandit" or SelectArea == "Sky" then -- Sky Bandit
                Ms = "Sky Bandit"
                NameQuest = "SkyQuest"
                QuestLv = 1
                NameMon = "Sky Bandit"
                CFrameQ = CFrame.new(-4842.1372070313, 717.69543457031, -2623.0483398438)
                CFrameMon = CFrame.new(-4955.6411132813, 365.46365356445, -2908.1865234375)
            elseif Lv == 175 or Lv <= 189 or SelectMonster == "Dark Master" or SelectArea == "Sky" then -- Dark Master
                Ms = "Dark Master"
                NameQuest = "SkyQuest"
                QuestLv = 2
                NameMon = "Dark Master"
                CFrameQ = CFrame.new(-4842.1372070313, 717.69543457031, -2623.0483398438)
                CFrameMon = CFrame.new(-5148.1650390625, 439.04571533203, -2332.9611816406)
            elseif Lv == 190 or Lv <= 209 or SelectMonster == "Prisoner" or SelectArea == "Prison" then -- Prisoner
                Ms = "Prisoner"
                NameQuest = "PrisonerQuest"
                QuestLv = 1
                NameMon = "Prisoner"
                CFrameQ =
                    CFrame.new(
                    5310.60547,
                    0.350014925,
                    474.946594,
                    0.0175017118,
                    0,
                    0.999846935,
                    0,
                    1,
                    0,
                    -0.999846935,
                    0,
                    0.0175017118
                )
                CFrameMon =
                    CFrame.new(
                    4937.31885,
                    0.332031399,
                    649.574524,
                    0.694649816,
                    0,
                    -0.719348073,
                    0,
                    1,
                    0,
                    0.719348073,
                    0,
                    0.694649816
                )
            elseif Lv == 210 or Lv <= 249 or SelectMonster == "Dangerous Prisoner" or SelectArea == "Prison" then -- Dangerous Prisoner
                Ms = "Dangerous Prisoner"
                NameQuest = "PrisonerQuest"
                QuestLv = 2
                NameMon = "Dangerous Prisoner"
                CFrameQ =
                    CFrame.new(
                    5310.60547,
                    0.350014925,
                    474.946594,
                    0.0175017118,
                    0,
                    0.999846935,
                    0,
                    1,
                    0,
                    -0.999846935,
                    0,
                    0.0175017118
                )
                CFrameMon =
                    CFrame.new(
                    5099.6626,
                    0.351562679,
                    1055.7583,
                    0.898906827,
                    0,
                    -0.438139856,
                    0,
                    1,
                    0,
                    0.438139856,
                    0,
                    0.898906827
                )
            elseif Lv == 250 or Lv <= 274 or SelectMonster == "Toga Warrior" or SelectArea == "Colosseum" then -- Toga Warrior
                Ms = "Toga Warrior"
                NameQuest = "ColosseumQuest"
                QuestLv = 1
                NameMon = "Toga Warrior"
                CFrameQ = CFrame.new(-1577.7890625, 7.4151420593262, -2984.4838867188)
                CFrameMon = CFrame.new(-1872.5166015625, 49.080215454102, -2913.810546875)
            elseif Lv == 275 or Lv <= 299 or SelectMonster == "Gladiator" or SelectArea == "Colosseum" then -- Gladiator
                Ms = "Gladiator"
                NameQuest = "ColosseumQuest"
                QuestLv = 2
                NameMon = "Gladiator"
                CFrameQ = CFrame.new(-1577.7890625, 7.4151420593262, -2984.4838867188)
                CFrameMon = CFrame.new(-1521.3740234375, 81.203170776367, -3066.3139648438)
            elseif Lv == 300 or Lv <= 324 or SelectMonster == "Military Soldier" or SelectArea == "Magma" then -- Military Soldier
                Ms = "Military Soldier"
                NameQuest = "MagmaQuest"
                QuestLv = 1
                NameMon = "Military Soldier"
                CFrameQ = CFrame.new(-5316.1157226563, 12.262831687927, 8517.00390625)
                CFrameMon = CFrame.new(-5369.0004882813, 61.24352645874, 8556.4921875)
            elseif Lv == 325 or Lv <= 374 or SelectMonster == "Military Spy" or SelectArea == "Magma" then -- Military Spy
                Ms = "Military Spy"
                NameQuest = "MagmaQuest"
                QuestLv = 2
                NameMon = "Military Spy"
                CFrameQ = CFrame.new(-5316.1157226563, 12.262831687927, 8517.00390625)
                CFrameMon =
                    CFrame.new(
                    -5787.00293,
                    75.8262634,
                    8651.69922,
                    0.838590562,
                    0,
                    -0.544762194,
                    0,
                    1,
                    0,
                    0.544762194,
                    0,
                    0.838590562
                )
            elseif Lv == 375 or Lv <= 399 or SelectMonster == "Fishman Warrior" or SelectArea == "Fishman" then -- Fishman Warrior
                Ms = "Fishman Warrior"
                NameQuest = "FishmanQuest"
                QuestLv = 1
                NameMon = "Fishman Warrior"
                CFrameQ = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
                CFrameMon = CFrame.new(60844.10546875, 98.462875366211, 1298.3985595703)
                if
                    _G.LevelFarm and
                        (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude >
                            3000
                 then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                        "requestEntrance",
                        Vector3.new(61163.8515625, 11.6796875, 1819.7841796875)
                    )
                end
            elseif Lv == 400 or Lv <= 449 or SelectMonster == "Fishman Commando" or SelectArea == "Fishman" then -- Fishman Commando
                Ms = "Fishman Commando"
                NameQuest = "FishmanQuest"
                QuestLv = 2
                NameMon = "Fishman Commando"
                CFrameQ = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
                CFrameMon = CFrame.new(61738.3984375, 64.207321166992, 1433.8375244141)
                if
                    _G.LevelFarm and
                        (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude >
                            3000
                 then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                        "requestEntrance",
                        Vector3.new(61163.8515625, 11.6796875, 1819.7841796875)
                    )
                end
            elseif Lv == 10 or Lv <= 474 or SelectMonster == "God's Guard" or SelectArea == "Sky Island" then -- God's Guard
                Ms = "God's Guard"
                NameQuest = "SkyExp1Quest"
                QuestLv = 1
                NameMon = "God's Guard"
                CFrameQ = CFrame.new(-4721.8603515625, 845.30297851563, -1953.8489990234)
                CFrameMon = CFrame.new(-4628.0498046875, 866.92877197266, -1931.2352294922)
                if
                    _G.LevelFarm and
                        (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude >
                            3000
                 then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                        "requestEntrance",
                        Vector3.new(-4607.82275, 872.54248, -1667.55688)
                    )
                end
            elseif Lv == 475 or Lv <= 524 or SelectMonster == "Shanda" or SelectArea == "Sky Island" then -- Shanda
                Ms = "Shanda"
                NameQuest = "SkyExp1Quest"
                QuestLv = 2
                NameMon = "Shanda"
                CFrameQ = CFrame.new(-7863.1596679688, 5545.5190429688, -378.42266845703)
                CFrameMon = CFrame.new(-7685.1474609375, 5601.0751953125, -441.38876342773)
                if
                    _G.LevelFarm and
                        (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude >
                            3000
                 then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                        "requestEntrance",
                        Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047)
                    )
                end
            elseif Lv == 525 or Lv <= 549 or SelectMonster == "Royal Squad" or SelectArea == "Sky Island" then -- Royal Squad
                Ms = "Royal Squad"
                NameQuest = "SkyExp2Quest"
                QuestLv = 1
                NameMon = "Royal Squad"
                CFrameQ = CFrame.new(-7903.3828125, 5635.9897460938, -1410.923828125)
                CFrameMon = CFrame.new(-7654.2514648438, 5637.1079101563, -1407.7550048828)
            elseif Lv == 550 or Lv <= 624 or SelectMonster == "Royal Soldier" or SelectArea == "Sky Island" then -- Royal Soldier
                Ms = "Royal Soldier"
                NameQuest = "SkyExp2Quest"
                QuestLv = 2
                NameMon = "Royal Soldier"
                CFrameQ = CFrame.new(-7903.3828125, 5635.9897460938, -1410.923828125)
                CFrameMon = CFrame.new(-7760.4106445313, 5679.9077148438, -1884.8112792969)
            elseif Lv == 625 or Lv <= 649 or SelectMonster == "Galley Pirate" or SelectArea == "Fountain" then -- Galley Pirate
                Ms = "Galley Pirate"
                NameQuest = "FountainQuest"
                QuestLv = 1
                NameMon = "Galley Pirate"
                CFrameQ = CFrame.new(5258.2788085938, 38.526931762695, 4050.044921875)
                CFrameMon = CFrame.new(5557.1684570313, 152.32717895508, 3998.7758789063)
            elseif Lv >= 650 or SelectMonster == "Galley Captain" or SelectArea == "Fountain" then -- Galley Captain
                Ms = "Galley Captain"
                NameQuest = "FountainQuest"
                QuestLv = 2
                NameMon = "Galley Captain"
                CFrameQ = CFrame.new(5258.2788085938, 38.526931762695, 4050.044921875)
                CFrameMon = CFrame.new(5677.6772460938, 92.786109924316, 4966.6323242188)
            end
        end
        if Second_Sea then
            if Lv == 700 or Lv <= 724 or SelectMonster == "Raider" or SelectArea == "Area 1" then -- Raider
                Ms = "Raider"
                NameQuest = "Area1Quest"
                QuestLv = 1
                NameMon = "Raider"
                CFrameQ = CFrame.new(-427.72567749023, 72.99634552002, 1835.9426269531)
                CFrameMon = CFrame.new(68.874565124512, 93.635643005371, 2429.6752929688)
            elseif Lv == 725 or Lv <= 774 or SelectMonster == "Mercenary" or SelectArea == "Area 1" then -- Mercenary
                Ms = "Mercenary"
                NameQuest = "Area1Quest"
                QuestLv = 2
                NameMon = "Mercenary"
                CFrameQ = CFrame.new(-427.72567749023, 72.99634552002, 1835.9426269531)
                CFrameMon = CFrame.new(-864.85009765625, 122.47104644775, 1453.1505126953)
            elseif Lv == 775 or Lv <= 799 or SelectMonster == "Swan Pirate" or SelectArea == "Area 2" then -- Swan Pirate
                Ms = "Swan Pirate"
                NameQuest = "Area2Quest"
                QuestLv = 1
                NameMon = "Swan Pirate"
                CFrameQ = CFrame.new(635.61151123047, 73.096351623535, 917.81298828125)
                CFrameMon = CFrame.new(1065.3669433594, 137.64012145996, 1324.3798828125)
            elseif Lv == 800 or Lv <= 874 or SelectMonster == "Factory Staff" or SelectArea == "Area 2" then -- Factory Staff
                Ms = "Factory Staff"
                NameQuest = "Area2Quest"
                QuestLv = 2
                NameMon = "Factory Staff"
                CFrameQ = CFrame.new(635.61151123047, 73.096351623535, 917.81298828125)
                CFrameMon = CFrame.new(533.22045898438, 128.46876525879, 355.62615966797)
            elseif Lv == 875 or Lv <= 899 or SelectMonster == "Marine Lieutenan" or SelectArea == "Marine" then -- Marine Lieutenant
                Ms = "Marine Lieutenant"
                NameQuest = "MarineQuest3"
                QuestLv = 1
                NameMon = "Marine Lieutenant"
                CFrameQ = CFrame.new(-2440.9934082031, 73.04190826416, -3217.7082519531)
                CFrameMon = CFrame.new(-2489.2622070313, 84.613594055176, -3151.8830566406)
            elseif Lv == 900 or Lv <= 949 or SelectMonster == "Marine Captain" or SelectArea == "Marine" then -- Marine Captain
                Ms = "Marine Captain"
                NameQuest = "MarineQuest3"
                QuestLv = 2
                NameMon = "Marine Captain"
                CFrameQ = CFrame.new(-2440.9934082031, 73.04190826416, -3217.7082519531)
                CFrameMon = CFrame.new(-2335.2026367188, 79.786659240723, -3245.8674316406)
            elseif Lv == 950 or Lv <= 974 or SelectMonster == "Zombie" or SelectArea == "Zombie" then -- Zombie
                Ms = "Zombie"
                NameQuest = "ZombieQuest"
                QuestLv = 1
                NameMon = "Zombie"
                CFrameQ = CFrame.new(-5494.3413085938, 48.505931854248, -794.59094238281)
                CFrameMon = CFrame.new(-5536.4970703125, 101.08577728271, -835.59075927734)
            elseif Lv == 975 or Lv <= 999 or SelectMonster == "Vampire" or SelectArea == "Zombie" then -- Vampire
                Ms = "Vampire"
                NameQuest = "ZombieQuest"
                QuestLv = 2
                NameMon = "Vampire"
                CFrameQ = CFrame.new(-5494.3413085938, 48.505931854248, -794.59094238281)
                CFrameMon = CFrame.new(-5806.1098632813, 16.722528457642, -1164.4384765625)
            elseif Lv == 1000 or Lv <= 1049 or SelectMonster == "Snow Trooper" or SelectArea == "Snow Mountain" then -- Snow Trooper
                Ms = "Snow Trooper"
                NameQuest = "SnowMountainQuest"
                QuestLv = 1
                NameMon = "Snow Trooper"
                CFrameQ = CFrame.new(607.05963134766, 401.44781494141, -5370.5546875)
                CFrameMon = CFrame.new(535.21051025391, 432.74209594727, -5484.9165039063)
            elseif Lv == 1050 or Lv <= 1099 or SelectMonster == "Winter Warrior" or SelectArea == "Snow Mountain" then -- Winter Warrior
                Ms = "Winter Warrior"
                NameQuest = "SnowMountainQuest"
                QuestLv = 2
                NameMon = "Winter Warrior"
                CFrameQ = CFrame.new(607.05963134766, 401.44781494141, -5370.5546875)
                CFrameMon = CFrame.new(1234.4449462891, 456.95419311523, -5174.130859375)
            elseif Lv == 1100 or Lv <= 1124 or SelectMonster == "Lab Subordinate" or SelectArea == "Ice Fire" then -- Lab Subordinate
                Ms = "Lab Subordinate"
                NameQuest = "IceSideQuest"
                QuestLv = 1
                NameMon = "Lab Subordinate"
                CFrameQ = CFrame.new(-6061.841796875, 15.926671981812, -4902.0385742188)
                CFrameMon = CFrame.new(-5720.5576171875, 63.309471130371, -4784.6103515625)
            elseif Lv == 1125 or Lv <= 1174 or SelectMonster == "Horned Warrior" or SelectArea == "Ice Fire" then -- Horned Warrior
                Ms = "Horned Warrior"
                NameQuest = "IceSideQuest"
                QuestLv = 2
                NameMon = "Horned Warrior"
                CFrameQ = CFrame.new(-6061.841796875, 15.926671981812, -4902.0385742188)
                CFrameMon = CFrame.new(-6292.751953125, 91.181983947754, -5502.6499023438)
            elseif Lv == 1175 or Lv <= 1199 or SelectMonster == "Magma Ninja" or SelectArea == "Ice Fire" then -- Magma Ninja
                Ms = "Magma Ninja"
                NameQuest = "FireSideQuest"
                QuestLv = 1
                NameMon = "Magma Ninja"
                CFrameQ = CFrame.new(-5429.0473632813, 15.977565765381, -5297.9614257813)
                CFrameMon = CFrame.new(-5461.8388671875, 130.36347961426, -5836.4702148438)
            elseif Lv == 1200 or Lv <= 1249 or SelectMonster == "Lava Pirate" or SelectArea == "Ice Fire" then -- Lava Pirate
                Ms = "Lava Pirate"
                NameQuest = "FireSideQuest"
                QuestLv = 2
                NameMon = "Lava Pirate"
                CFrameQ = CFrame.new(-5429.0473632813, 15.977565765381, -5297.9614257813)
                CFrameMon = CFrame.new(-5251.1889648438, 55.164535522461, -4774.4096679688)
            elseif Lv == 1250 or Lv <= 1274 or SelectMonster == "Ship Deckhand" or SelectArea == "Ship" then -- Ship Deckhand
                Ms = "Ship Deckhand"
                NameQuest = "ShipQuest1"
                QuestLv = 1
                NameMon = "Ship Deckhand"
                CFrameQ = CFrame.new(1040.2927246094, 125.08293151855, 32911.0390625)
                CFrameMon = CFrame.new(921.12365722656, 125.9839553833, 33088.328125)
                if
                    _G.LevelFarm and
                        (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude >
                            20000
                 then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                        "requestEntrance",
                        Vector3.new(923.21252441406, 126.9760055542, 32852.83203125)
                    )
                end
            elseif Lv == 1275 or Lv <= 1299 or SelectMonster == "Ship Engineer" or SelectArea == "Ship" then -- Ship Engineer
                Ms = "Ship Engineer"
                NameQuest = "ShipQuest1"
                QuestLv = 2
                NameMon = "Ship Engineer"
                CFrameQ = CFrame.new(1040.2927246094, 125.08293151855, 32911.0390625)
                CFrameMon = CFrame.new(886.28179931641, 40.47790145874, 32800.83203125)
                if
                    _G.LevelFarm and
                        (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude >
                            20000
                 then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                        "requestEntrance",
                        Vector3.new(923.21252441406, 126.9760055542, 32852.83203125)
                    )
                end
            elseif Lv == 1300 or Lv <= 1324 or SelectMonster == "Ship Steward" or SelectArea == "Ship" then -- Ship Steward
                Ms = "Ship Steward"
                NameQuest = "ShipQuest2"
                QuestLv = 1
                NameMon = "Ship Steward"
                CFrameQ = CFrame.new(971.42065429688, 125.08293151855, 33245.54296875)
                CFrameMon = CFrame.new(943.85504150391, 129.58183288574, 33444.3671875)
                if
                    _G.LevelFarm and
                        (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude >
                            20000
                 then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                        "requestEntrance",
                        Vector3.new(923.21252441406, 126.9760055542, 32852.83203125)
                    )
                end
            elseif Lv == 1325 or Lv <= 1349 or SelectMonster == "Ship Officer" or SelectArea == "Ship" then -- Ship Officer
                Ms = "Ship Officer"
                NameQuest = "ShipQuest2"
                QuestLv = 2
                NameMon = "Ship Officer"
                CFrameQ = CFrame.new(971.42065429688, 125.08293151855, 33245.54296875)
                CFrameMon = CFrame.new(955.38458251953, 181.08335876465, 33331.890625)
                if
                    _G.LevelFarm and
                        (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude >
                            20000
                 then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                        "requestEntrance",
                        Vector3.new(923.21252441406, 126.9760055542, 32852.83203125)
                    )
                end
            elseif Lv == 1350 or Lv <= 1374 or SelectMonster == "Arctic Warrior" or SelectArea == "Frost" then -- Arctic Warrior
                Ms = "Arctic Warrior"
                NameQuest = "FrostQuest"
                QuestLv = 1
                NameMon = "Arctic Warrior"
                CFrameQ = CFrame.new(5668.1372070313, 28.202531814575, -6484.6005859375)
                CFrameMon = CFrame.new(5935.4541015625, 77.26016998291, -6472.7568359375)
                if
                    _G.LevelFarm and
                        (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude >
                            20000
                 then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                        "requestEntrance",
                        Vector3.new(-6508.5581054688, 89.034996032715, -132.83953857422)
                    )
                end
            elseif Lv == 1375 or Lv <= 1424 or SelectMonster == "Snow Lurker" or SelectArea == "Frost" then -- Snow Lurker
                Ms = "Snow Lurker"
                NameQuest = "FrostQuest"
                QuestLv = 2
                NameMon = "Snow Lurker"
                CFrameQ = CFrame.new(5668.1372070313, 28.202531814575, -6484.6005859375)
                CFrameMon = CFrame.new(5628.482421875, 57.574996948242, -6618.3481445313)
            elseif Lv == 1425 or Lv <= 1449 or SelectMonster == "Sea Soldier" or SelectArea == "Forgotten" then -- Sea Soldier
                Ms = "Sea Soldier"
                NameQuest = "ForgottenQuest"
                QuestLv = 1
                NameMon = "Sea Soldier"
                CFrameQ = CFrame.new(-3054.5827636719, 236.87213134766, -10147.790039063)
                CFrameMon = CFrame.new(-3185.0153808594, 58.789089202881, -9663.6064453125)
            elseif Lv >= 1450 or SelectMonster == "Water Fighter" or SelectArea == "Forgotten" then -- Water Fighter
                Ms = "Water Fighter"
                NameQuest = "ForgottenQuest"
                QuestLv = 2
                NameMon = "Water Fighter"
                CFrameQ = CFrame.new(-3054.5827636719, 236.87213134766, -10147.790039063)
                CFrameMon = CFrame.new(-3262.9301757813, 298.69036865234, -10552.529296875)
            end
        end
        if Third_Sea then
            if Lv == 1500 or Lv <= 1524 or SelectMonster == "Pirate Millionaire" or SelectArea == "Pirate Port" then -- Pirate Millionaire
                Ms = "Pirate Millionaire"
                NameQuest = "PiratePortQuest"
                QuestLv = 1
                NameMon = "Pirate Millionaire"
                CFrameQ = CFrame.new(-289.61752319336, 43.819011688232, 5580.0903320313)
                CFrameMon = CFrame.new(-435.68109130859, 189.69866943359, 5551.0756835938)
            elseif Lv == 1525 or Lv <= 1574 or SelectMonster == "Pistol Billionaire" or SelectArea == "Pirate Port" then -- Pistol Billoonaire
                Ms = "Pistol Billionaire"
                NameQuest = "PiratePortQuest"
                QuestLv = 2
                NameMon = "Pistol Billionaire"
                CFrameQ = CFrame.new(-289.61752319336, 43.819011688232, 5580.0903320313)
                CFrameMon = CFrame.new(-236.53652954102, 217.46676635742, 6006.0883789063)
            elseif Lv == 1575 or Lv <= 1599 or SelectMonster == "Dragon Crew Warrior" or SelectArea == "Amazon" then -- Dragon Crew Warrior
                Ms = "Dragon Crew Warrior"
                NameQuest = "AmazonQuest"
                QuestLv = 1
                NameMon = "Dragon Crew Warrior"
                CFrameQ = CFrame.new(5833.1147460938, 51.60498046875, -1103.0693359375)
                CFrameMon = CFrame.new(6301.9975585938, 104.77153015137, -1082.6075439453)
            elseif Lv == 1600 or Lv <= 1624 or SelectMonster == "Dragon Crew Archer" or SelectArea == "Amazon" then -- Dragon Crew Archer
                Ms = "Dragon Crew Archer"
                NameQuest = "AmazonQuest"
                QuestLv = 2
                NameMon = "Dragon Crew Archer"
                CFrameQ = CFrame.new(5833.1147460938, 51.60498046875, -1103.0693359375)
                CFrameMon = CFrame.new(6831.1171875, 441.76708984375, 446.58615112305)
            elseif Lv == 1625 or Lv <= 1649 or SelectMonster == "Female Islander" or SelectArea == "Amazon" then -- Female Islander
                Ms = "Female Islander"
                NameQuest = "AmazonQuest2"
                QuestLv = 1
                NameMon = "Female Islander"
                CFrameQ = CFrame.new(5446.8793945313, 601.62945556641, 749.45672607422)
                CFrameMon = CFrame.new(5792.5166015625, 848.14392089844, 1084.1818847656)
            elseif Lv == 1650 or Lv <= 1699 or SelectMonster == "Giant Islander" or SelectArea == "Amazon" then -- Giant Islander
                Ms = "Giant Islander"
                NameQuest = "AmazonQuest2"
                QuestLv = 2
                NameMon = "Giant Islander"
                CFrameQ = CFrame.new(5446.8793945313, 601.62945556641, 749.45672607422)
                CFrameMon = CFrame.new(5009.5068359375, 664.11071777344, -40.960144042969)
            elseif Lv == 1700 or Lv <= 1724 or SelectMonster == "Marine Commodore" or SelectArea == "Marine Tree" then -- Marine Commodore
                Ms = "Marine Commodore"
                NameQuest = "MarineTreeIsland"
                QuestLv = 1
                NameMon = "Marine Commodore"
                CFrameQ = CFrame.new(2179.98828125, 28.731239318848, -6740.0551757813)
                CFrameMon = CFrame.new(2198.0063476563, 128.71075439453, -7109.5043945313)
            elseif Lv == 1725 or Lv <= 1774 or SelectMonster == "Marine Rear Admiral" or SelectArea == "Marine Tree" then -- Marine Rear Admiral
                Ms = "Marine Rear Admiral"
                NameQuest = "MarineTreeIsland"
                QuestLv = 2
                NameMon = "Marine Rear Admiral"
                CFrameQ = CFrame.new(2179.98828125, 28.731239318848, -6740.0551757813)
                CFrameMon = CFrame.new(3294.3142089844, 385.41125488281, -7048.6342773438)
            elseif Lv == 1775 or Lv <= 1799 or SelectMonster == "Fishman Raider" or SelectArea == "Deep Forest" then -- Fishman Raide
                Ms = "Fishman Raider"
                NameQuest = "DeepForestIsland3"
                QuestLv = 1
                NameMon = "Fishman Raider"
                CFrameQ = CFrame.new(-10582.759765625, 331.78845214844, -8757.666015625)
                CFrameMon = CFrame.new(-10553.268554688, 521.38439941406, -8176.9458007813)
            elseif Lv == 1800 or Lv <= 1824 or SelectMonster == "Fishman Captain" or SelectArea == "Deep Forest" then -- Fishman Captain
                Ms = "Fishman Captain"
                NameQuest = "DeepForestIsland3"
                QuestLv = 2
                NameMon = "Fishman Captain"
                CFrameQ = CFrame.new(-10583.099609375, 331.78845214844, -8759.4638671875)
                CFrameMon = CFrame.new(-10789.401367188, 427.18637084961, -9131.4423828125)
            elseif Lv == 1825 or Lv <= 1849 or SelectMonster == "Forest Pirate" or SelectArea == "Deep Forest" then -- Forest Pirate
                Ms = "Forest Pirate"
                NameQuest = "DeepForestIsland"
                QuestLv = 1
                NameMon = "Forest Pirate"
                CFrameQ = CFrame.new(-13232.662109375, 332.40396118164, -7626.4819335938)
                CFrameMon = CFrame.new(-13489.397460938, 400.30349731445, -7770.251953125)
            elseif Lv == 1850 or Lv <= 1899 or SelectMonster == "Mythological Pirate" or SelectArea == "Deep Forest" then -- Mythological Pirate
                Ms = "Mythological Pirate"
                NameQuest = "DeepForestIsland"
                QuestLv = 2
                NameMon = "Mythological Pirate"
                CFrameQ = CFrame.new(-13232.662109375, 332.40396118164, -7626.4819335938)
                CFrameMon = CFrame.new(-13508.616210938, 582.46228027344, -6985.3037109375)
            elseif Lv == 1900 or Lv <= 1924 or SelectMonster == "Jungle Pirate" or SelectArea == "Deep Forest" then -- Jungle Pirate
                Ms = "Jungle Pirate"
                NameQuest = "DeepForestIsland2"
                QuestLv = 1
                NameMon = "Jungle Pirate"
                CFrameQ = CFrame.new(-12682.096679688, 390.88653564453, -9902.1240234375)
                CFrameMon = CFrame.new(-12267.103515625, 459.75262451172, -10277.200195313)
            elseif Lv == 1925 or Lv <= 1974 or SelectMonster == "Musketeer Pirate" or SelectArea == "Deep Forest" then -- Musketeer Pirate
                Ms = "Musketeer Pirate"
                NameQuest = "DeepForestIsland2"
                QuestLv = 2
                NameMon = "Musketeer Pirate"
                CFrameQ = CFrame.new(-12682.096679688, 390.88653564453, -9902.1240234375)
                CFrameMon = CFrame.new(-13291.5078125, 520.47338867188, -9904.638671875)
            elseif Lv == 1975 or Lv <= 1999 or SelectMonster == "Reborn Skeleton" or SelectArea == "Haunted Castle" then
                Ms = "Reborn Skeleton"
                NameQuest = "HauntedQuest1"
                QuestLv = 1
                NameMon = "Reborn Skeleton"
                CFrameQ =
                    CFrame.new(
                    -9480.80762,
                    142.130661,
                    5566.37305,
                    -0.00655503059,
                    4.52954225e-08,
                    -0.999978542,
                    2.04920472e-08,
                    1,
                    4.51620679e-08,
                    0.999978542,
                    -2.01955679e-08,
                    -0.00655503059
                )
                CFrameMon =
                    CFrame.new(
                    -8761.77148,
                    183.431747,
                    6168.33301,
                    0.978073597,
                    -1.3950732e-05,
                    -0.208259016,
                    -1.08073925e-06,
                    1,
                    -7.20630269e-05,
                    0.208259016,
                    7.07080399e-05,
                    0.978073597
                )
            elseif Lv == 2000 or Lv <= 2024 or SelectMonster == "Living Zombie" or SelectArea == "Haunted Castle" then
                Ms = "Living Zombie"
                NameQuest = "HauntedQuest1"
                QuestLv = 2
                NameMon = "Living Zombie"
                CFrameQ =
                    CFrame.new(
                    -9480.80762,
                    142.130661,
                    5566.37305,
                    -0.00655503059,
                    4.52954225e-08,
                    -0.999978542,
                    2.04920472e-08,
                    1,
                    4.51620679e-08,
                    0.999978542,
                    -2.01955679e-08,
                    -0.00655503059
                )
                CFrameMon =
                    CFrame.new(
                    -10103.7529,
                    238.565979,
                    6179.75977,
                    0.999474227,
                    2.77547141e-08,
                    0.0324240364,
                    -2.58006327e-08,
                    1,
                    -6.06848474e-08,
                    -0.0324240364,
                    5.98163865e-08,
                    0.999474227
                )
            elseif Lv == 2025 or Lv <= 2049 or SelectMonster == "Demonic Soul" or SelectArea == "Haunted Castle" then
                Ms = "Demonic Soul"
                NameQuest = "HauntedQuest2"
                QuestLv = 1
                NameMon = "Demonic Soul"
                CFrameQ = CFrame.new(-9516.9931640625, 178.00651550293, 6078.4653320313)
                CFrameMon = CFrame.new(-9712.03125, 204.69589233398, 6193.322265625)
            elseif Lv == 2050 or Lv <= 2074 or SelectMonster == "Posessed Mummy" or SelectArea == "Haunted Castle" then
                Ms = "Posessed Mummy"
                NameQuest = "HauntedQuest2"
                QuestLv = 2
                NameMon = "Posessed Mummy"
                CFrameQ = CFrame.new(-9516.9931640625, 178.00651550293, 6078.4653320313)
                CFrameMon = CFrame.new(-9545.7763671875, 69.619895935059, 6339.5615234375)
            elseif Lv == 2075 or Lv <= 2099 or SelectMonster == "Peanut Scout" or SelectArea == "Nut Island" then
                Ms = "Peanut Scout"
                NameQuest = "NutsIslandQuest"
                QuestLv = 1
                NameMon = "Peanut Scout"
                CFrameQ =
                    CFrame.new(
                    -2105.53198,
                    37.2495995,
                    -10195.5088,
                    -0.766061664,
                    0,
                    -0.642767608,
                    0,
                    1,
                    0,
                    0.642767608,
                    0,
                    -0.766061664
                )
                CFrameMon = CFrame.new(-2150.587890625, 122.49767303467, -10358.994140625)
            elseif Lv == 2100 or Lv <= 2124 or SelectMonster == "Peanut President" or SelectArea == "Nut Island" then
                Ms = "Peanut President"
                NameQuest = "NutsIslandQuest"
                QuestLv = 2
                NameMon = "Peanut President"
                CFrameQ =
                    CFrame.new(
                    -2105.53198,
                    37.2495995,
                    -10195.5088,
                    -0.766061664,
                    0,
                    -0.642767608,
                    0,
                    1,
                    0,
                    0.642767608,
                    0,
                    -0.766061664
                )
                CFrameMon = CFrame.new(-2150.587890625, 122.49767303467, -10358.994140625)
            elseif Lv == 2125 or Lv <= 2149 or SelectMonster == "Ice Cream Chef" or SelectArea == "Ice Cream Island" then
                Ms = "Ice Cream Chef"
                NameQuest = "IceCreamIslandQuest"
                QuestLv = 1
                NameMon = "Ice Cream Chef"
                CFrameQ =
                    CFrame.new(
                    -819.376709,
                    64.9259796,
                    -10967.2832,
                    -0.766061664,
                    0,
                    0.642767608,
                    0,
                    1,
                    0,
                    -0.642767608,
                    0,
                    -0.766061664
                )
                CFrameMon =
                    CFrame.new(
                    -789.941528,
                    209.382889,
                    -11009.9805,
                    -0.0703101531,
                    -0,
                    -0.997525156,
                    -0,
                    1.00000012,
                    -0,
                    0.997525275,
                    0,
                    -0.0703101456
                )
            elseif
                Lv == 2150 or Lv <= 2199 or SelectMonster == "Ice Cream Commander" or SelectArea == "Ice Cream Island"
             then
                Ms = "Ice Cream Commander"
                NameQuest = "IceCreamIslandQuest"
                QuestLv = 2
                NameMon = "Ice Cream Commander"
                CFrameQ =
                    CFrame.new(
                    -819.376709,
                    64.9259796,
                    -10967.2832,
                    -0.766061664,
                    0,
                    0.642767608,
                    0,
                    1,
                    0,
                    -0.642767608,
                    0,
                    -0.766061664
                )
                CFrameMon =
                    CFrame.new(
                    -789.941528,
                    209.382889,
                    -11009.9805,
                    -0.0703101531,
                    -0,
                    -0.997525156,
                    -0,
                    1.00000012,
                    -0,
                    0.997525275,
                    0,
                    -0.0703101456
                )
            elseif Lv == 2200 or Lv <= 2224 or SelectMonster == "Cookie Crafter" or SelectArea == "Cake Island" then
                Ms = "Cookie Crafter"
                NameQuest = "CakeQuest1"
                QuestLv = 1
                NameMon = "Cookie Crafter"
                CFrameQ =
                    CFrame.new(
                    -2022.29858,
                    36.9275894,
                    -12030.9766,
                    -0.961273909,
                    0,
                    -0.275594592,
                    0,
                    1,
                    0,
                    0.275594592,
                    0,
                    -0.961273909
                )
                CFrameMon =
                    CFrame.new(
                    -2321.71216,
                    36.699482,
                    -12216.7871,
                    -0.780074954,
                    0,
                    0.625686109,
                    0,
                    1,
                    0,
                    -0.625686109,
                    0,
                    -0.780074954
                )
            elseif Lv == 2225 or Lv <= 2249 or SelectMonster == "Cake Guard" or SelectArea == "Cake Island" then
                Ms = "Cake Guard"
                NameQuest = "CakeQuest1"
                QuestLv = 2
                NameMon = "Cake Guard"
                CFrameQ =
                    CFrame.new(
                    -2022.29858,
                    36.9275894,
                    -12030.9766,
                    -0.961273909,
                    0,
                    -0.275594592,
                    0,
                    1,
                    0,
                    0.275594592,
                    0,
                    -0.961273909
                )
                CFrameMon =
                    CFrame.new(
                    -1418.11011,
                    36.6718941,
                    -12255.7324,
                    0.0677844882,
                    0,
                    0.997700036,
                    0,
                    1,
                    0,
                    -0.997700036,
                    0,
                    0.0677844882
                )
            elseif Lv == 2250 or Lv <= 2274 or SelectMonster == "Baking Staff" or SelectArea == "Cake Island" then
                Ms = "Baking Staff"
                NameQuest = "CakeQuest2"
                QuestLv = 1
                NameMon = "Baking Staff"
                CFrameQ =
                    CFrame.new(
                    -1928.31763,
                    37.7296638,
                    -12840.626,
                    0.951068401,
                    -0,
                    -0.308980465,
                    0,
                    1,
                    -0,
                    0.308980465,
                    0,
                    0.951068401
                )
                CFrameMon =
                    CFrame.new(
                    -1980.43848,
                    36.6716766,
                    -12983.8418,
                    -0.254443765,
                    0,
                    -0.967087567,
                    0,
                    1,
                    0,
                    0.967087567,
                    0,
                    -0.254443765
                )
            elseif Lv == 2275 or Lv <= 2299 or SelectMonster == "Head Baker" or SelectArea == "Cake Island" then
                Ms = "Head Baker"
                NameQuest = "CakeQuest2"
                QuestLv = 2
                NameMon = "Head Baker"
                CFrameQ =
                    CFrame.new(
                    -1928.31763,
                    37.7296638,
                    -12840.626,
                    0.951068401,
                    -0,
                    -0.308980465,
                    0,
                    1,
                    -0,
                    0.308980465,
                    0,
                    0.951068401
                )
                CFrameMon =
                    CFrame.new(
                    -2251.5791,
                    52.2714615,
                    -13033.3965,
                    -0.991971016,
                    0,
                    -0.126466095,
                    0,
                    1,
                    0,
                    0.126466095,
                    0,
                    -0.991971016
                )
            elseif Lv == 2300 or Lv <= 2324 or SelectMonster == "Cocoa Warrior" or SelectArea == "Choco Island" then
                Ms = "Cocoa Warrior"
                NameQuest = "ChocQuest1"
                QuestLv = 1
                NameMon = "Cocoa Warrior"
                CFrameQ = CFrame.new(231.75, 23.9003029, -12200.292, -1, 0, 0, 0, 1, 0, 0, 0, -1)
                CFrameMon =
                    CFrame.new(
                    167.978516,
                    26.2254658,
                    -12238.874,
                    -0.939700961,
                    0,
                    0.341998369,
                    0,
                    1,
                    0,
                    -0.341998369,
                    0,
                    -0.939700961
                )
            elseif Lv == 2325 or Lv <= 2349 or SelectMonster == "Chocolate Bar Battler" or SelectArea == "Choco Island" then
                Ms = "Chocolate Bar Battler"
                NameQuest = "ChocQuest1"
                QuestLv = 2
                NameMon = "Chocolate Bar Battler"
                CFrameQ = CFrame.new(231.75, 23.9003029, -12200.292, -1, 0, 0, 0, 1, 0, 0, 0, -1)
                CFrameMon =
                    CFrame.new(
                    701.312073,
                    25.5824986,
                    -12708.2148,
                    -0.342042685,
                    0,
                    -0.939684391,
                    0,
                    1,
                    0,
                    0.939684391,
                    0,
                    -0.342042685
                )
            elseif Lv == 2350 or Lv <= 2374 or SelectMonster == "Sweet Thief" or SelectArea == "Choco Island" then
                Ms = "Sweet Thief"
                NameQuest = "ChocQuest2"
                QuestLv = 1
                NameMon = "Sweet Thief"
                CFrameQ =
                    CFrame.new(
                    151.198242,
                    23.8907146,
                    -12774.6172,
                    0.422592998,
                    0,
                    0.906319618,
                    0,
                    1,
                    0,
                    -0.906319618,
                    0,
                    0.422592998
                )
                CFrameMon =
                    CFrame.new(
                    -140.258301,
                    25.5824986,
                    -12652.3115,
                    0.173624337,
                    -0,
                    -0.984811902,
                    0,
                    1,
                    -0,
                    0.984811902,
                    0,
                    0.173624337
                )
            elseif Lv == 2375 or Lv <= 2400 or SelectMonster == "Candy Rebel" or SelectArea == "Choco Island" then
                Ms = "Candy Rebel"
                NameQuest = "ChocQuest2"
                QuestLv = 2
                NameMon = "Candy Rebel"
                CFrameQ =
                    CFrame.new(
                    151.198242,
                    23.8907146,
                    -12774.6172,
                    0.422592998,
                    0,
                    0.906319618,
                    0,
                    1,
                    0,
                    -0.906319618,
                    0,
                    0.422592998
                )
                CFrameMon =
                    CFrame.new(
                    47.9231453,
                    25.5824986,
                    -13029.2402,
                    -0.819156051,
                    0,
                    -0.573571265,
                    0,
                    1,
                    0,
                    0.573571265,
                    0,
                    -0.819156051
                )
            elseif Lv == 2400 or Lv <= 2424 or SelectMonster == "Candy Pirate" or SelectArea == "Candy Island" then
                Ms = "Candy Pirate"
                NameQuest = "CandyQuest1"
                QuestLv = 1
                NameMon = "Candy Pirate"
                CFrameQ =
                    CFrame.new(
                    -1149.328,
                    13.5759039,
                    -14445.6143,
                    -0.156446099,
                    0,
                    -0.987686574,
                    0,
                    1,
                    0,
                    0.987686574,
                    0,
                    -0.156446099
                )
                CFrameMon =
                    CFrame.new(
                    -1437.56348,
                    17.1481285,
                    -14385.6934,
                    0.173624337,
                    -0,
                    -0.984811902,
                    0,
                    1,
                    -0,
                    0.984811902,
                    0,
                    0.173624337
                )
            elseif Lv == 2425 or Lv <= 2449 or SelectMonster == "Snow Demon" or SelectArea == "Candy Island" then
                Ms = "Snow Demon"
                NameQuest = "CandyQuest1"
                QuestLv = 2
                NameMon = "Snow Demon"
                CFrameQ =
                    CFrame.new(
                    -1149.328,
                    13.5759039,
                    -14445.6143,
                    -0.156446099,
                    0,
                    -0.987686574,
                    0,
                    1,
                    0,
                    0.987686574,
                    0,
                    -0.156446099
                )
                CFrameMon =
                    CFrame.new(
                    -916.222656,
                    17.1481285,
                    -14638.8125,
                    0.866007268,
                    0,
                    0.500031412,
                    0,
                    1,
                    0,
                    -0.500031412,
                    0,
                    0.866007268
                )
            elseif Lv == 2450 or Lv <= 2474 or SelectMonster == "Isle Outlaw" or SelectArea == "Tiki Outpost" then
                Ms = "Isle Outlaw"
                NameQuest = "TikiQuest1"
                QuestLv = 1
                NameMon = "Isle Outlaw"
                CFrameQ = CFrame.new(-16549.890625, 55.68635559082031, -179.91360473632812)
                CFrameMon = CFrame.new(-16162.8193359375, 11.6863374710083, -96.45481872558594)
            elseif Lv == 2475 or Lv <= 2524 or SelectMonster == "Island Boy" or SelectArea == "Tiki Outpost" then
                Ms = "Island Boy"
                NameQuest = "TikiQuest1"
                QuestLv = 2
                NameMon = "Island Boy"
                CFrameQ = CFrame.new(-16549.890625, 55.68635559082031, -179.91360473632812)
                CFrameMon = CFrame.new(-16912.130859375, 11.787443161010742, -133.0850830078125)
            elseif Lv >= 2525 or SelectMonster == "Isle Champion" or SelectArea == "Tiki Outpost" then
                Ms = "Isle Champion"
                NameQuest = "TikiQuest2"
                QuestLv = 2
                NameMon = "Isle Champion"
                CFrameQ = CFrame.new(-16542.447265625, 55.68632888793945, 1044.41650390625)
                CFrameMon = CFrame.new(-16848.94140625, 21.68633460998535, 1041.4490966796875)
            elseif Lv == 2550 or Lv <= 2575 or SelectMonster == "Serpent Hunter" or SelectArea == "Tiki Outpost 2" then
                Ms = "Serpent Hunter"
                NameQuest = "TikiQuest3"
                QuestLv = 1
                NameMon = "Serpent Hunter"
                CFrameQ =
                    CFrame.new(
                    -16668.0312,
                    105.315765,
                    1568.60132,
                    -0.999815822,
                    2.53269654e-08,
                    0.0191932656,
                    2.47972114e-08,
                    1,
                    -2.78390253e-08,
                    -0.0191932656,
                    -2.73579577e-08,
                    -0.999815822
                )
                CFrameMon =
                    CFrame.new(
                    -16645.6426,
                    163.092682,
                    1352.87317,
                    0.999801993,
                    -7.3039903e-09,
                    0.0198997185,
                    5.12876497e-09,
                    1,
                    1.09360379e-07,
                    -0.0198997185,
                    -1.09236666e-07,
                    0.999801993
                )
            elseif Lv == 2600 or SelectMonster == "Skull Slayer" or SelectArea == "Tiki Outpost 2" then
                Ms = "Skull Slayer"
                NameQuest = "TikiQuest3"
                QuestLv = 2
                NameMon = "Skull Slayer"
                CFrameQ =
                    CFrame.new(
                    -16668.0312,
                    105.315765,
                    1568.60132,
                    -0.999815822,
                    2.53269654e-08,
                    0.0191932656,
                    2.47972114e-08,
                    1,
                    -2.78390253e-08,
                    -0.0191932656,
                    -2.73579577e-08,
                    -0.999815822
                )
                CFrameMon =
                    CFrame.new(
                    -16838.25,
                    122.900497,
                    1722.86694,
                    0.998448908,
                    3.55804843e-08,
                    -0.0556759238,
                    -3.229162e-08,
                    1,
                    5.99712138e-08,
                    0.0556759238,
                    -5.80803281e-08,
                    0.998448908
                )
            end
        end
    end

    --// Select Monster
    if First_Sea then
        tableMon = {
            "Bandit",
            "Monkey",
            "Gorilla",
            "Pirate",
            "Brute",
            "Desert Bandit",
            "Desert Officer",
            "Snow Bandit",
            "Snowman",
            "Chief Petty Officer",
            "Sky Bandit",
            "Dark Master",
            "Prisoner",
            "Dangerous Prisoner",
            "Toga Warrior",
            "Gladiator",
            "Military Soldier",
            "Military Spy",
            "Fishman Warrior",
            "Fishman Commando",
            "God's Guard",
            "Shanda",
            "Royal Squad",
            "Royal Soldier",
            "Galley Pirate",
            "Galley Captain"
        }
    elseif Second_Sea then
        tableMon = {
            "Raider",
            "Mercenary",
            "Swan Pirate",
            "Factory Staff",
            "Marine Lieutenant",
            "Marine Captain",
            "Zombie",
            "Vampire",
            "Snow Trooper",
            "Winter Warrior",
            "Lab Subordinate",
            "Horned Warrior",
            "Magma Ninja",
            "Lava Pirate",
            "Ship Deckhand",
            "Ship Engineer",
            "Ship Steward",
            "Ship Officer",
            "Arctic Warrior",
            "Snow Lurker",
            "Sea Soldier",
            "Water Fighter"
        }
    elseif Third_Sea then
        tableMon = {
            "Pirate Millionaire",
            "Dragon Crew Warrior",
            "Dragon Crew Archer",
            "Female Islander",
            "Giant Islander",
            "Marine Commodore",
            "Marine Rear Admiral",
            "Fishman Raider",
            "Fishman Captain",
            "Forest Pirate",
            "Mythological Pirate",
            "Jungle Pirate",
            "Musketeer Pirate",
            "Reborn Skeleton",
            "Living Zombie",
            "Demonic Soul",
            "Posessed Mummy",
            "Peanut Scout",
            "Peanut President",
            "Ice Cream Chef",
            "Ice Cream Commander",
            "Cookie Crafter",
            "Cake Guard",
            "Baking Staff",
            "Head Baker",
            "Cocoa Warrior",
            "Chocolate Bar Battler",
            "Sweet Thief",
            "Candy Rebel",
            "Candy Pirate",
            "Snow Demon",
            "Isle Outlaw",
            "Island Boy",
            "Isle Champion"
        }
    end

    --// Select Island
    if First_Sea then
        AreaList = {
            "Jungle",
            "Buggy",
            "Desert",
            "Snow",
            "Marine",
            "Sky",
            "Prison",
            "Colosseum",
            "Magma",
            "Fishman",
            "Sky Island",
            "Fountain"
        }
    elseif Second_Sea then
        AreaList = {
            "Area 1",
            "Area 2",
            "Zombie",
            "Marine",
            "Snow Mountain",
            "Ice fire",
            "Ship",
            "Frost",
            "Forgotten"
        }
    elseif Third_Sea then
        AreaList = {
            "Pirate Port",
            "Amazon",
            "Marine Tree",
            "Deep Forest",
            "Haunted Castle",
            "Nut Island",
            "Ice Cream Island",
            "Cake Island",
            "Choco Island",
            "Candy Island",
            "Tiki Outpost"
        }
    end

    --// Check Boss Quest
    function CheckBossQuest()
        if First_Sea then
            if SelectBoss == "The Gorilla King" then
                BossMon = "The Gorilla King"
                NameBoss = "The Gorrila King"
                NameQuestBoss = "JungleQuest"
                QuestLvBoss = 3
                RewardBoss = "Reward:\n$2,000\n7,000 Exp."
                CFrameQBoss = CFrame.new(-1601.6553955078, 36.85213470459, 153.38809204102)
                CFrameBoss =
                    CFrame.new(
                    -1088.75977,
                    8.13463783,
                    -488.559906,
                    -0.707134247,
                    0,
                    0.707079291,
                    0,
                    1,
                    0,
                    -0.707079291,
                    0,
                    -0.707134247
                )
            elseif SelectBoss == "Bobby" then
                BossMon = "Bobby"
                NameBoss = "Bobby"
                NameQuestBoss = "BuggyQuest1"
                QuestLvBoss = 3
                RewardBoss = "Reward:\n$8,000\n35,000 Exp."
                CFrameQBoss = CFrame.new(-1140.1761474609, 4.752049446106, 3827.4057617188)
                CFrameBoss = CFrame.new(-1087.3760986328, 46.949409484863, 4040.1462402344)
            elseif SelectBoss == "The Saw" then
                BossMon = "The Saw"
                NameBoss = "The Saw"
                CFrameBoss = CFrame.new(-784.89715576172, 72.427383422852, 1603.5822753906)
            elseif SelectBoss == "Yeti" then
                BossMon = "Yeti"
                NameBoss = "Yeti"
                NameQuestBoss = "SnowQuest"
                QuestLvBoss = 3
                RewardBoss = "Reward:\n$10,000\n180,000 Exp."
                CFrameQBoss = CFrame.new(1386.8073730469, 87.272789001465, -1298.3576660156)
                CFrameBoss = CFrame.new(1218.7956542969, 138.01184082031, -1488.0262451172)
            elseif SelectBoss == "Mob Leader" then
                BossMon = "Mob Leader"
                NameBoss = "Mob Leader"
                CFrameBoss = CFrame.new(-2844.7307128906, 7.4180502891541, 5356.6723632813)
            elseif SelectBoss == "Vice Admiral" then
                BossMon = "Vice Admiral"
                NameBoss = "Vice Admiral"
                NameQuestBoss = "MarineQuest2"
                QuestLvBoss = 2
                RewardBoss = "Reward:\n$10,000\n180,000 Exp."
                CFrameQBoss = CFrame.new(-5036.2465820313, 28.677835464478, 4324.56640625)
                CFrameBoss = CFrame.new(-5006.5454101563, 88.032081604004, 4353.162109375)
            elseif SelectBoss == "Saber Expert" then
                NameBoss = "Saber Expert"
                BossMon = "Saber Expert"
                CFrameBoss = CFrame.new(-1458.89502, 29.8870335, -50.633564)
            elseif SelectBoss == "Warden" then
                BossMon = "Warden"
                NameBoss = "Warden"
                NameQuestBoss = "ImpelQuest"
                QuestLvBoss = 1
                RewardBoss = "Reward:\n$6,000\n850,000 Exp."
                CFrameBoss =
                    CFrame.new(
                    5278.04932,
                    2.15167475,
                    944.101929,
                    0.220546961,
                    -4.49946401e-06,
                    0.975376427,
                    -1.95412576e-05,
                    1,
                    9.03162072e-06,
                    -0.975376427,
                    -2.10519756e-05,
                    0.220546961
                )
                CFrameQBoss =
                    CFrame.new(
                    5191.86133,
                    2.84020686,
                    686.438721,
                    -0.731384635,
                    0,
                    0.681965172,
                    0,
                    1,
                    0,
                    -0.681965172,
                    0,
                    -0.731384635
                )
            elseif SelectBoss == "Chief Warden" then
                BossMon = "Chief Warden"
                NameBoss = "Chief Warden"
                NameQuestBoss = "ImpelQuest"
                QuestLvBoss = 2
                RewardBoss = "Reward:\n$10,000\n1,000,000 Exp."
                CFrameBoss =
                    CFrame.new(
                    5206.92578,
                    0.997753382,
                    814.976746,
                    0.342041343,
                    -0.00062915677,
                    0.939684749,
                    0.00191645394,
                    0.999998152,
                    -2.80422337e-05,
                    -0.939682961,
                    0.00181045406,
                    0.342041939
                )
                CFrameQBoss =
                    CFrame.new(
                    5191.86133,
                    2.84020686,
                    686.438721,
                    -0.731384635,
                    0,
                    0.681965172,
                    0,
                    1,
                    0,
                    -0.681965172,
                    0,
                    -0.731384635
                )
            elseif SelectBoss == "Swan" then
                BossMon = "Swan"
                NameBoss = "Swan"
                NameQuestBoss = "ImpelQuest"
                QuestLvBoss = 3
                RewardBoss = "Reward:\n$15,000\n1,600,000 Exp."
                CFrameBoss =
                    CFrame.new(
                    5325.09619,
                    7.03906584,
                    719.570679,
                    -0.309060812,
                    0,
                    0.951042235,
                    0,
                    1,
                    0,
                    -0.951042235,
                    0,
                    -0.309060812
                )
                CFrameQBoss =
                    CFrame.new(
                    5191.86133,
                    2.84020686,
                    686.438721,
                    -0.731384635,
                    0,
                    0.681965172,
                    0,
                    1,
                    0,
                    -0.681965172,
                    0,
                    -0.731384635
                )
            elseif SelectBoss == "Magma Admiral" then
                BossMon = "Magma Admiral"
                NameBoss = "Magma Admiral"
                NameQuestBoss = "MagmaQuest"
                QuestLvBoss = 3
                RewardBoss = "Reward:\n$15,000\n2,800,000 Exp."
                CFrameQBoss = CFrame.new(-5314.6220703125, 12.262420654297, 8517.279296875)
                CFrameBoss = CFrame.new(-5765.8969726563, 82.92064666748, 8718.3046875)
            elseif SelectBoss == "Fishman Lord" then
                BossMon = "Fishman Lord"
                NameBoss = "Fishman Lord"
                NameQuestBoss = "FishmanQuest"
                QuestLvBoss = 3
                RewardBoss = "Reward:\n$15,000\n4,000,000 Exp."
                CFrameQBoss = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
                CFrameBoss = CFrame.new(61260.15234375, 30.950881958008, 1193.4329833984)
            elseif SelectBoss == "Wysper" then
                BossMon = "Wysper"
                NameBoss = "Wysper"
                NameQuestBoss = "SkyExp1Quest"
                QuestLvBoss = 3
                RewardBoss = "Reward:\n$15,000\n4,800,000 Exp."
                CFrameQBoss = CFrame.new(-7861.947265625, 5545.517578125, -379.85974121094)
                CFrameBoss = CFrame.new(-7866.1333007813, 5576.4311523438, -546.74816894531)
            elseif SelectBoss == "Thunder God" then
                BossMon = "Thunder God"
                NameBoss = "Thunder God"
                NameQuestBoss = "SkyExp2Quest"
                QuestLvBoss = 3
                RewardBoss = "Reward:\n$20,000\n5,800,000 Exp."
                CFrameQBoss = CFrame.new(-7903.3828125, 5635.9897460938, -1410.923828125)
                CFrameBoss = CFrame.new(-7994.984375, 5761.025390625, -2088.6479492188)
            elseif SelectBoss == "Cyborg" then
                BossMon = "Cyborg"
                NameBoss = "Cyborg"
                NameQuestBoss = "FountainQuest"
                QuestLvBoss = 3
                RewardBoss = "Reward:\n$20,000\n7,500,000 Exp."
                CFrameQBoss = CFrame.new(5258.2788085938, 38.526931762695, 4050.044921875)
                CFrameBoss = CFrame.new(6094.0249023438, 73.770050048828, 3825.7348632813)
            elseif SelectBoss == "Ice Admiral" then
                BossMon = "Ice Admiral"
                NameBoss = "Ice Admiral"
                CFrameBoss =
                    CFrame.new(
                    1266.08948,
                    26.1757946,
                    -1399.57678,
                    -0.573599219,
                    0,
                    -0.81913656,
                    0,
                    1,
                    0,
                    0.81913656,
                    0,
                    -0.573599219
                )
            elseif SelectBoss == "Greybeard" then
                BossMon = "Greybeard"
                NameBoss = "Greybeard"
                CFrameBoss = CFrame.new(-5081.3452148438, 85.221641540527, 4257.3588867188)
            end
        end
        if Second_Sea then
            if SelectBoss == "Diamond" then
                BossMon = "Diamond"
                NameBoss = "Diamond"
                NameQuestBoss = "Area1Quest"
                QuestLvBoss = 3
                RewardBoss = "Reward:\n$25,000\n9,000,000 Exp."
                CFrameQBoss = CFrame.new(-427.5666809082, 73.313781738281, 1835.4208984375)
                CFrameBoss = CFrame.new(-1576.7166748047, 198.59265136719, 13.724286079407)
            elseif SelectBoss == "Jeremy" then
                BossMon = "Jeremy"
                NameBoss = "Jeremy"
                NameQuestBoss = "Area2Quest"
                QuestLvBoss = 3
                RewardBoss = "Reward:\n$25,000\n11,500,000 Exp."
                CFrameQBoss = CFrame.new(636.79943847656, 73.413787841797, 918.00415039063)
                CFrameBoss = CFrame.new(2006.9261474609, 448.95666503906, 853.98284912109)
            elseif SelectBoss == "Fajita" then
                BossMon = "Fajita"
                NameBoss = "Fajita"
                NameQuestBoss = "MarineQuest3"
                QuestLvBoss = 3
                RewardBoss = "Reward:\n$25,000\n15,000,000 Exp."
                CFrameQBoss = CFrame.new(-2441.986328125, 73.359344482422, -3217.5324707031)
                CFrameBoss = CFrame.new(-2172.7399902344, 103.32216644287, -4015.025390625)
            elseif SelectBoss == "Don Swan" then
                BossMon = "Don Swan"
                NameBoss = "Don Swan"
                CFrameBoss = CFrame.new(2286.2004394531, 15.177839279175, 863.8388671875)
            elseif SelectBoss == "Smoke Admiral" then
                BossMon = "Smoke Admiral"
                NameBoss = "Smoke Admiral"
                NameQuestBoss = "IceSideQuest"
                QuestLvBoss = 3
                RewardBoss = "Reward:\n$20,000\n25,000,000 Exp."
                CFrameQBoss = CFrame.new(-5429.0473632813, 15.977565765381, -5297.9614257813)
                CFrameBoss = CFrame.new(-5275.1987304688, 20.757257461548, -5260.6669921875)
            elseif SelectBoss == "Awakened Ice Admiral" then
                BossMon = "Awakened Ice Admiral"
                NameBoss = "Awakened Ice Admiral"
                NameQuestBoss = "FrostQuest"
                QuestLvBoss = 3
                RewardBoss = "Reward:\n$20,000\n36,000,000 Exp."
                CFrameQBoss = CFrame.new(5668.9780273438, 28.519989013672, -6483.3520507813)
                CFrameBoss = CFrame.new(6403.5439453125, 340.29766845703, -6894.5595703125)
            elseif SelectBoss == "Tide Keeper" then
                BossMon = "Tide Keeper"
                NameBoss = "Tide Keeper"
                NameQuestBoss = "ForgottenQuest"
                QuestLvBoss = 3
                RewardBoss = "Reward:\n$12,500\n38,000,000 Exp."
                CFrameQBoss = CFrame.new(-3053.9814453125, 237.18954467773, -10145.0390625)
                CFrameBoss = CFrame.new(-3795.6423339844, 105.88877105713, -11421.307617188)
            elseif SelectBoss == "Darkbeard" then
                BossMon = "Darkbeard"
                NameBoss = "Darkbeard"
                CFrameMon = CFrame.new(3677.08203125, 62.751937866211, -3144.8332519531)
            elseif SelectBoss == "Cursed Captain" then
                BossMon = "Cursed Captain"
                NameBoss = "Cursed Captain"
                CFrameBoss = CFrame.new(916.928589, 181.092773, 33422)
            elseif SelectBoss == "Order" then
                BossMon = "Order"
                NameBoss = "Order"
                CFrameBoss = CFrame.new(-6217.2021484375, 28.047645568848, -5053.1357421875)
            end
        end
        if Third_Sea then
            if SelectBoss == "Stone" then
                BossMon = "Stone"
                NameBoss = "Stone"
                NameQuestBoss = "PiratePortQuest"
                QuestLvBoss = 3
                RewardBoss = "Reward:\n$25,000\n40,000,000 Exp."
                CFrameQBoss = CFrame.new(-289.76705932617, 43.819011688232, 5579.9384765625)
                CFrameBoss = CFrame.new(-1027.6512451172, 92.404174804688, 6578.8530273438)
            elseif SelectBoss == "Island Empress" then
                BossMon = "Island Empress"
                NameBoss = "Island Empress"
                NameQuestBoss = "AmazonQuest2"
                QuestLvBoss = 3
                RewardBoss = "Reward:\n$30,000\n52,000,000 Exp."
                CFrameQBoss = CFrame.new(5445.9541015625, 601.62945556641, 751.43792724609)
                CFrameBoss = CFrame.new(5543.86328125, 668.97399902344, 199.0341796875)
            elseif SelectBoss == "Kilo Admiral" then
                BossMon = "Kilo Admiral"
                NameBoss = "Kilo Admiral"
                NameQuestBoss = "MarineTreeIsland"
                QuestLvBoss = 3
                RewardBoss = "Reward:\n$35,000\n56,000,000 Exp."
                CFrameQBoss = CFrame.new(2179.3010253906, 28.731239318848, -6739.9741210938)
                CFrameBoss = CFrame.new(2764.2233886719, 432.46154785156, -7144.4580078125)
            elseif SelectBoss == "Captain Elephant" then
                BossMon = "Captain Elephant"
                NameBoss = "Captain Elephant"
                NameQuestBoss = "DeepForestIsland"
                QuestLvBoss = 3
                RewardBoss = "Reward:\n$40,000\n67,000,000 Exp."
                CFrameQBoss = CFrame.new(-13232.682617188, 332.40396118164, -7626.01171875)
                CFrameBoss = CFrame.new(-13376.7578125, 433.28689575195, -8071.392578125)
            elseif SelectBoss == "Beautiful Pirate" then
                BossMon = "Beautiful Pirate"
                NameBoss = "Beautiful Pirate"
                NameQuestBoss = "DeepForestIsland2"
                QuestLvBoss = 3
                RewardBoss = "Reward:\n$50,000\n70,000,000 Exp."
                CFrameQBoss = CFrame.new(-12682.096679688, 390.88653564453, -9902.1240234375)
                CFrameBoss = CFrame.new(5283.609375, 22.56223487854, -110.78285217285)
            elseif SelectBoss == "Cake Queen" then
                BossMon = "Cake Queen"
                NameBoss = "Cake Queen"
                NameQuestBoss = "IceCreamIslandQuest"
                QuestLvBoss = 3
                RewardBoss = "Reward:\n$30,000\n112,500,000 Exp."
                CFrameQBoss =
                    CFrame.new(
                    -819.376709,
                    64.9259796,
                    -10967.2832,
                    -0.766061664,
                    0,
                    0.642767608,
                    0,
                    1,
                    0,
                    -0.642767608,
                    0,
                    -0.766061664
                )
                CFrameBoss =
                    CFrame.new(
                    -678.648804,
                    381.353943,
                    -11114.2012,
                    -0.908641815,
                    0.00149294338,
                    0.41757378,
                    0.00837114919,
                    0.999857843,
                    0.0146408929,
                    -0.417492568,
                    0.0167988986,
                    -0.90852499
                )
            elseif SelectBoss == "Longma" then
                BossMon = "Longma"
                NameBoss = "Longma"
                CFrameBoss = CFrame.new(-10238.875976563, 389.7912902832, -9549.7939453125)
            elseif SelectBoss == "Soul Reaper" then
                BossMon = "Soul Reaper"
                NameBoss = "Soul Reaper"
                CFrameBoss = CFrame.new(-9524.7890625, 315.80429077148, 6655.7192382813)
            elseif SelectBoss == "rip_indra True Form" then
                BossMon = "rip_indra True Form"
                NameBoss = "rip_indra True Form"
                CFrameBoss = CFrame.new(-5415.3920898438, 505.74133300781, -2814.0166015625)
            end
        end
    end

    --// Check Material
    function MaterialMon()
        if SelectMaterial == "Radioactive Material" then
            MMon = "Factory Staff"
            MPos = CFrame.new(295, 73, -56)
            SP = "Default"
        elseif SelectMaterial == "Mystic Droplet" then
            MMon = "Water Fighter"
            MPos = CFrame.new(-3385, 239, -10542)
            SP = "Default"
        elseif SelectMaterial == "Magma Ore" then
            if First_Sea then
                MMon = "Military Spy"
                MPos = CFrame.new(-5815, 84, 8820)
                SP = "Default"
            elseif Second_Sea then
                MMon = "Magma Ninja"
                MPos = CFrame.new(-5428, 78, -5959)
                SP = "Default"
            end
        elseif SelectMaterial == "Angel Wings" then
            MMon = "God's Guard"
            MPos = CFrame.new(-4698, 845, -1912)
            SP = "Default"
            if
                (game.Players.LocalPlayer.Character.HumanoidRootPart.Position -
                    Vector3.new(-7859.09814, 5544.19043, -381.476196)).Magnitude >= 5000
             then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                    "requestEntrance",
                    Vector3.new(-7859.09814, 5544.19043, -381.476196)
                )
            end
        elseif SelectMaterial == "Leather" then
            if First_Sea then
                MMon = "Brute"
                MPos = CFrame.new(-1145, 15, 4350)
                SP = "Default"
            elseif Second_Sea then
                MMon = "Marine Captain"
                MPos = CFrame.new(-2010.5059814453125, 73.00115966796875, -3326.620849609375)
                SP = "Default"
            elseif Third_Sea then
                MMon = "Jungle Pirate"
                MPos = CFrame.new(-11975.78515625, 331.7734069824219, -10620.0302734375)
                SP = "Default"
            end
        elseif SelectMaterial == "Scrap Metal" then
            if First_Sea then
                MMon = "Brute"
                MPos = CFrame.new(-1145, 15, 4350)
                SP = "Default"
            elseif Second_Sea then
                MMon = "Swan Pirate"
                MPos = CFrame.new(878, 122, 1235)
                SP = "Default"
            elseif Third_Sea then
                MMon = "Jungle Pirate"
                MPos = CFrame.new(-12107, 332, -10549)
                SP = "Default"
            end
        elseif SelectMaterial == "Fish Tail" then
            if Third_Sea then
                MMon = "Fishman Raider"
                MPos = CFrame.new(-10993, 332, -8940)
                SP = "Default"
            elseif First_Sea then
                MMon = "Fishman Warrior"
                MPos = CFrame.new(61123, 19, 1569)
                SP = "Default"
                if
                    (game.Players.LocalPlayer.Character.HumanoidRootPart.Position -
                        Vector3.new(61163.8515625, 5.342342376708984, 1819.7841796875)).Magnitude >= 17000
                 then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                        "requestEntrance",
                        Vector3.new(61163.8515625, 5.342342376708984, 1819.7841796875)
                    )
                end
            end
        elseif SelectMaterial == "Demonic Wisp" then
            MMon = "Demonic Soul"
            MPos = CFrame.new(-9507, 172, 6158)
            SP = "Default"
        elseif SelectMaterial == "Vampire Fang" then
            MMon = "Vampire"
            MPos = CFrame.new(-6033, 7, -1317)
            SP = "Default"
        elseif SelectMaterial == "Conjured Cocoa" then
            MMon = "Chocolate Bar Battler"
            MPos = CFrame.new(620.6344604492188, 78.93644714355469, -12581.369140625)
            SP = "Default"
        elseif SelectMaterial == "Dragon Scale" then
            MMon = "Dragon Crew Archer"
            MPos = CFrame.new(6594, 383, 139)
            SP = "Default"
        elseif SelectMaterial == "Gunpowder" then
            MMon = "Pistol Billionaire"
            MPos = CFrame.new(-469, 74, 5904)
            SP = "Default"
        elseif SelectMaterial == "Mini Tusk" then
            MMon = "Mythological Pirate"
            MPos = CFrame.new(-13545, 470, -6917)
            SP = "Default"
        end
    end

    ---------------------Esp

    function UpdateIslandESP()
        for i, v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
            pcall(
                function()
                    if IslandESP then
                        if v.Name ~= "Sea" then
                            if not v:FindFirstChild("NameEsp") then
                                local bill = Instance.new("BillboardGui", v)
                                bill.Name = "NameEsp"
                                bill.ExtentsOffset = Vector3.new(0, 1, 0)
                                bill.Size = UDim2.new(1, 200, 1, 30)
                                bill.Adornee = v
                                bill.AlwaysOnTop = true
                                local name = Instance.new("TextLabel", bill)
                                name.Font = "GothamBold"
                                name.FontSize = "Size14"
                                name.TextWrapped = true
                                name.Size = UDim2.new(1, 0, 1, 0)
                                name.TextYAlignment = "Top"
                                name.BackgroundTransparency = 1
                                name.TextStrokeTransparency = 0.5
                                name.TextColor3 = Color3.fromRGB(8, 0, 0)
                            else
                                v["NameEsp"].TextLabel.Text =
                                    (v.Name ..
                                    "   \n" ..
                                        round(
                                            (game:GetService("Players").LocalPlayer.Character.Head.Position - v.Position).Magnitude /
                                                3
                                        ) ..
                                            " Distance")
                            end
                        end
                    else
                        if v:FindFirstChild("NameEsp") then
                            v:FindFirstChild("NameEsp"):Destroy()
                        end
                    end
                end
            )
        end
    end

    function isnil(thing)
        return (thing == nil)
    end
    local function round(n)
        return math.floor(tonumber(n) + 0.5)
    end
    Number = math.random(1, 1000000)
    function UpdatePlayerChams()
        for i, v in pairs(game:GetService "Players":GetChildren()) do
            pcall(
                function()
                    if not isnil(v.Character) then
                        if ESPPlayer then
                            if not isnil(v.Character.Head) and not v.Character.Head:FindFirstChild("NameEsp" .. Number) then
                                local bill = Instance.new("BillboardGui", v.Character.Head)
                                bill.Name = "NameEsp" .. Number
                                bill.ExtentsOffset = Vector3.new(0, 1, 0)
                                bill.Size = UDim2.new(1, 200, 1, 30)
                                bill.Adornee = v.Character.Head
                                bill.AlwaysOnTop = true
                                local name = Instance.new("TextLabel", bill)
                                name.Font = Enum.Font.GothamSemibold
                                name.FontSize = "Size10"
                                name.TextWrapped = true
                                name.Text =
                                    (v.Name ..
                                    " \n" ..
                                        round(
                                            (game:GetService("Players").LocalPlayer.Character.Head.Position -
                                                v.Character.Head.Position).Magnitude / 3
                                        ) ..
                                            " Distance")
                                name.Size = UDim2.new(1, 0, 1, 0)
                                name.TextYAlignment = "Top"
                                name.BackgroundTransparency = 1
                                name.TextStrokeTransparency = 0.5
                                if v.Team == game.Players.LocalPlayer.Team then
                                    name.TextColor3 = Color3.new(0, 0, 254)
                                else
                                    name.TextColor3 = Color3.new(255, 0, 0)
                                end
                            else
                                v.Character.Head["NameEsp" .. Number].TextLabel.Text =
                                    (v.Name ..
                                    " | " ..
                                        round(
                                            (game:GetService("Players").LocalPlayer.Character.Head.Position -
                                                v.Character.Head.Position).Magnitude / 3
                                        ) ..
                                            " Distance\nHealth : " ..
                                                round(
                                                    v.Character.Humanoid.Health * 100 / v.Character.Humanoid.MaxHealth
                                                ) ..
                                                    "%")
                            end
                        else
                            if v.Character.Head:FindFirstChild("NameEsp" .. Number) then
                                v.Character.Head:FindFirstChild("NameEsp" .. Number):Destroy()
                            end
                        end
                    end
                end
            )
        end
    end
    function UpdateChestChams()
        for i, v in pairs(game.Workspace:GetChildren()) do
            pcall(
                function()
                    if string.find(v.Name, "Chest") then
                        if ChestESP then
                            if string.find(v.Name, "Chest") then
                                if not v:FindFirstChild("NameEsp" .. Number) then
                                    local bill = Instance.new("BillboardGui", v)
                                    bill.Name = "NameEsp" .. Number
                                    bill.ExtentsOffset = Vector3.new(0, 1, 0)
                                    bill.Size = UDim2.new(1, 200, 1, 30)
                                    bill.Adornee = v
                                    bill.AlwaysOnTop = true
                                    local name = Instance.new("TextLabel", bill)
                                    name.Font = Enum.Font.GothamSemibold
                                    name.FontSize = "Size14"
                                    name.TextWrapped = true
                                    name.Size = UDim2.new(1, 0, 1, 0)
                                    name.TextYAlignment = "Top"
                                    name.BackgroundTransparency = 1
                                    name.TextStrokeTransparency = 0.5
                                    if v.Name == "Chest1" then
                                        name.TextColor3 = Color3.fromRGB(109, 109, 109)
                                        name.Text =
                                            ("Chest 1" ..
                                            " \n" ..
                                                round(
                                                    (game:GetService("Players").LocalPlayer.Character.Head.Position -
                                                        v.Position).Magnitude / 3
                                                ) ..
                                                    " Distance")
                                    end
                                    if v.Name == "Chest2" then
                                        name.TextColor3 = Color3.fromRGB(173, 158, 21)
                                        name.Text =
                                            ("Chest 2" ..
                                            " \n" ..
                                                round(
                                                    (game:GetService("Players").LocalPlayer.Character.Head.Position -
                                                        v.Position).Magnitude / 3
                                                ) ..
                                                    " Distance")
                                    end
                                    if v.Name == "Chest3" then
                                        name.TextColor3 = Color3.fromRGB(85, 255, 255)
                                        name.Text =
                                            ("Chest 3" ..
                                            " \n" ..
                                                round(
                                                    (game:GetService("Players").LocalPlayer.Character.Head.Position -
                                                        v.Position).Magnitude / 3
                                                ) ..
                                                    " Distance")
                                    end
                                else
                                    v["NameEsp" .. Number].TextLabel.Text =
                                        (v.Name ..
                                        "   \n" ..
                                            round(
                                                (game:GetService("Players").LocalPlayer.Character.Head.Position -
                                                    v.Position).Magnitude / 3
                                            ) ..
                                                " Distance")
                                end
                            end
                        else
                            if v:FindFirstChild("NameEsp" .. Number) then
                                v:FindFirstChild("NameEsp" .. Number):Destroy()
                            end
                        end
                    end
                end
            )
        end
    end
    function UpdateDevilChams()
        for i, v in pairs(game.Workspace:GetChildren()) do
            pcall(
                function()
                    if DevilFruitESP then
                        if string.find(v.Name, "Fruit") then
                            if not v.Handle:FindFirstChild("NameEsp" .. Number) then
                                local bill = Instance.new("BillboardGui", v.Handle)
                                bill.Name = "NameEsp" .. Number
                                bill.ExtentsOffset = Vector3.new(0, 1, 0)
                                bill.Size = UDim2.new(1, 200, 1, 30)
                                bill.Adornee = v.Handle
                                bill.AlwaysOnTop = true
                                local name = Instance.new("TextLabel", bill)
                                name.Font = Enum.Font.GothamSemibold
                                name.FontSize = "Size14"
                                name.TextWrapped = true
                                name.Size = UDim2.new(1, 0, 1, 0)
                                name.TextYAlignment = "Top"
                                name.BackgroundTransparency = 1
                                name.TextStrokeTransparency = 0.5
                                name.TextColor3 = Color3.fromRGB(255, 255, 255)
                                name.Text =
                                    (v.Name ..
                                    " \n" ..
                                        round(
                                            (game:GetService("Players").LocalPlayer.Character.Head.Position -
                                                v.Handle.Position).Magnitude / 3
                                        ) ..
                                            " Distance")
                            else
                                v.Handle["NameEsp" .. Number].TextLabel.Text =
                                    (v.Name ..
                                    "   \n" ..
                                        round(
                                            (game:GetService("Players").LocalPlayer.Character.Head.Position -
                                                v.Handle.Position).Magnitude / 3
                                        ) ..
                                            " Distance")
                            end
                        end
                    else
                        if v.Handle:FindFirstChild("NameEsp" .. Number) then
                            v.Handle:FindFirstChild("NameEsp" .. Number):Destroy()
                        end
                    end
                end
            )
        end
    end
    function UpdateFlowerChams()
        for i, v in pairs(game.Workspace:GetChildren()) do
            pcall(
                function()
                    if v.Name == "Flower2" or v.Name == "Flower1" then
                        if FlowerESP then
                            if not v:FindFirstChild("NameEsp" .. Number) then
                                local bill = Instance.new("BillboardGui", v)
                                bill.Name = "NameEsp" .. Number
                                bill.ExtentsOffset = Vector3.new(0, 1, 0)
                                bill.Size = UDim2.new(1, 200, 1, 30)
                                bill.Adornee = v
                                bill.AlwaysOnTop = true
                                local name = Instance.new("TextLabel", bill)
                                name.Font = Enum.Font.GothamSemibold
                                name.FontSize = "Size14"
                                name.TextWrapped = true
                                name.Size = UDim2.new(1, 0, 1, 0)
                                name.TextYAlignment = "Top"
                                name.BackgroundTransparency = 1
                                name.TextStrokeTransparency = 0.5
                                name.TextColor3 = Color3.fromRGB(255, 0, 0)
                                if v.Name == "Flower1" then
                                    name.Text =
                                        ("Blue Flower" ..
                                        " \n" ..
                                            round(
                                                (game:GetService("Players").LocalPlayer.Character.Head.Position -
                                                    v.Position).Magnitude / 3
                                            ) ..
                                                " Distance")
                                    name.TextColor3 = Color3.fromRGB(0, 0, 255)
                                end
                                if v.Name == "Flower2" then
                                    name.Text =
                                        ("Red Flower" ..
                                        " \n" ..
                                            round(
                                                (game:GetService("Players").LocalPlayer.Character.Head.Position -
                                                    v.Position).Magnitude / 3
                                            ) ..
                                                " Distance")
                                    name.TextColor3 = Color3.fromRGB(255, 0, 0)
                                end
                            else
                                v["NameEsp" .. Number].TextLabel.Text =
                                    (v.Name ..
                                    "   \n" ..
                                        round(
                                            (game:GetService("Players").LocalPlayer.Character.Head.Position - v.Position).Magnitude /
                                                3
                                        ) ..
                                            " Distance")
                            end
                        else
                            if v:FindFirstChild("NameEsp" .. Number) then
                                v:FindFirstChild("NameEsp" .. Number):Destroy()
                            end
                        end
                    end
                end
            )
        end
    end
    function UpdateRealFruitChams()
        for i, v in pairs(game.Workspace.AppleSpawner:GetChildren()) do
            if v:IsA("Tool") then
                if RealFruitESP then
                    if not v.Handle:FindFirstChild("NameEsp" .. Number) then
                        local bill = Instance.new("BillboardGui", v.Handle)
                        bill.Name = "NameEsp" .. Number
                        bill.ExtentsOffset = Vector3.new(0, 1, 0)
                        bill.Size = UDim2.new(1, 200, 1, 30)
                        bill.Adornee = v.Handle
                        bill.AlwaysOnTop = true
                        local name = Instance.new("TextLabel", bill)
                        name.Font = Enum.Font.GothamSemibold
                        name.FontSize = "Size14"
                        name.TextWrapped = true
                        name.Size = UDim2.new(1, 0, 1, 0)
                        name.TextYAlignment = "Top"
                        name.BackgroundTransparency = 1
                        name.TextStrokeTransparency = 0.5
                        name.TextColor3 = Color3.fromRGB(255, 0, 0)
                        name.Text =
                            (v.Name ..
                            " \n" ..
                                round(
                                    (game:GetService("Players").LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude /
                                        3
                                ) ..
                                    " Distance")
                    else
                        v.Handle["NameEsp" .. Number].TextLabel.Text =
                            (v.Name ..
                            " " ..
                                round(
                                    (game:GetService("Players").LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude /
                                        3
                                ) ..
                                    " Distance")
                    end
                else
                    if v.Handle:FindFirstChild("NameEsp" .. Number) then
                        v.Handle:FindFirstChild("NameEsp" .. Number):Destroy()
                    end
                end
            end
        end
        for i, v in pairs(game.Workspace.PineappleSpawner:GetChildren()) do
            if v:IsA("Tool") then
                if RealFruitESP then
                    if not v.Handle:FindFirstChild("NameEsp" .. Number) then
                        local bill = Instance.new("BillboardGui", v.Handle)
                        bill.Name = "NameEsp" .. Number
                        bill.ExtentsOffset = Vector3.new(0, 1, 0)
                        bill.Size = UDim2.new(1, 200, 1, 30)
                        bill.Adornee = v.Handle
                        bill.AlwaysOnTop = true
                        local name = Instance.new("TextLabel", bill)
                        name.Font = Enum.Font.GothamSemibold
                        name.FontSize = "Size14"
                        name.TextWrapped = true
                        name.Size = UDim2.new(1, 0, 1, 0)
                        name.TextYAlignment = "Top"
                        name.BackgroundTransparency = 1
                        name.TextStrokeTransparency = 0.5
                        name.TextColor3 = Color3.fromRGB(255, 174, 0)
                        name.Text =
                            (v.Name ..
                            " \n" ..
                                round(
                                    (game:GetService("Players").LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude /
                                        3
                                ) ..
                                    " Distance")
                    else
                        v.Handle["NameEsp" .. Number].TextLabel.Text =
                            (v.Name ..
                            " " ..
                                round(
                                    (game:GetService("Players").LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude /
                                        3
                                ) ..
                                    " Distance")
                    end
                else
                    if v.Handle:FindFirstChild("NameEsp" .. Number) then
                        v.Handle:FindFirstChild("NameEsp" .. Number):Destroy()
                    end
                end
            end
        end
        for i, v in pairs(game.Workspace.BananaSpawner:GetChildren()) do
            if v:IsA("Tool") then
                if RealFruitESP then
                    if not v.Handle:FindFirstChild("NameEsp" .. Number) then
                        local bill = Instance.new("BillboardGui", v.Handle)
                        bill.Name = "NameEsp" .. Number
                        bill.ExtentsOffset = Vector3.new(0, 1, 0)
                        bill.Size = UDim2.new(1, 200, 1, 30)
                        bill.Adornee = v.Handle
                        bill.AlwaysOnTop = true
                        local name = Instance.new("TextLabel", bill)
                        name.Font = Enum.Font.GothamSemibold
                        name.FontSize = "Size14"
                        name.TextWrapped = true
                        name.Size = UDim2.new(1, 0, 1, 0)
                        name.TextYAlignment = "Top"
                        name.BackgroundTransparency = 1
                        name.TextStrokeTransparency = 0.5
                        name.TextColor3 = Color3.fromRGB(251, 255, 0)
                        name.Text =
                            (v.Name ..
                            " \n" ..
                                round(
                                    (game:GetService("Players").LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude /
                                        3
                                ) ..
                                    " Distance")
                    else
                        v.Handle["NameEsp" .. Number].TextLabel.Text =
                            (v.Name ..
                            " " ..
                                round(
                                    (game:GetService("Players").LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude /
                                        3
                                ) ..
                                    " Distance")
                    end
                else
                    if v.Handle:FindFirstChild("NameEsp" .. Number) then
                        v.Handle:FindFirstChild("NameEsp" .. Number):Destroy()
                    end
                end
            end
        end
    end

    function UpdateIslandESP()
        for i, v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
            pcall(
                function()
                    if IslandESP then
                        if v.Name ~= "Sea" then
                            if not v:FindFirstChild("NameEsp") then
                                local bill = Instance.new("BillboardGui", v)
                                bill.Name = "NameEsp"
                                bill.ExtentsOffset = Vector3.new(0, 1, 0)
                                bill.Size = UDim2.new(1, 200, 1, 30)
                                bill.Adornee = v
                                bill.AlwaysOnTop = true
                                local name = Instance.new("TextLabel", bill)
                                name.Font = "GothamBold"
                                name.FontSize = "Size14"
                                name.TextWrapped = true
                                name.Size = UDim2.new(1, 0, 1, 0)
                                name.TextYAlignment = "Top"
                                name.BackgroundTransparency = 1
                                name.TextStrokeTransparency = 0.5
                                name.TextColor3 = Color3.fromRGB(7, 236, 240)
                            else
                                v["NameEsp"].TextLabel.Text =
                                    (v.Name ..
                                    "   \n" ..
                                        round(
                                            (game:GetService("Players").LocalPlayer.Character.Head.Position - v.Position).Magnitude /
                                                3
                                        ) ..
                                            " Distance")
                            end
                        end
                    else
                        if v:FindFirstChild("NameEsp") then
                            v:FindFirstChild("NameEsp"):Destroy()
                        end
                    end
                end
            )
        end
    end

    function isnil(thing)
        return (thing == nil)
    end
    local function round(n)
        return math.floor(tonumber(n) + 0.5)
    end
    Number = math.random(1, 1000000)
    function UpdatePlayerChams()
        for i, v in pairs(game:GetService "Players":GetChildren()) do
            pcall(
                function()
                    if not isnil(v.Character) then
                        if ESPPlayer then
                            if not isnil(v.Character.Head) and not v.Character.Head:FindFirstChild("NameEsp" .. Number) then
                                local bill = Instance.new("BillboardGui", v.Character.Head)
                                bill.Name = "NameEsp" .. Number
                                bill.ExtentsOffset = Vector3.new(0, 1, 0)
                                bill.Size = UDim2.new(1, 200, 1, 30)
                                bill.Adornee = v.Character.Head
                                bill.AlwaysOnTop = true
                                local name = Instance.new("TextLabel", bill)
                                name.Font = Enum.Font.GothamSemibold
                                name.FontSize = "Size14"
                                name.TextWrapped = true
                                name.Text =
                                    (v.Name ..
                                    " \n" ..
                                        round(
                                            (game:GetService("Players").LocalPlayer.Character.Head.Position -
                                                v.Character.Head.Position).Magnitude / 3
                                        ) ..
                                            " Distance")
                                name.Size = UDim2.new(1, 0, 1, 0)
                                name.TextYAlignment = "Top"
                                name.BackgroundTransparency = 1
                                name.TextStrokeTransparency = 0.5
                                if v.Team == game.Players.LocalPlayer.Team then
                                    name.TextColor3 = Color3.new(0, 255, 0)
                                else
                                    name.TextColor3 = Color3.new(255, 0, 0)
                                end
                            else
                                v.Character.Head["NameEsp" .. Number].TextLabel.Text =
                                    (v.Name ..
                                    " | " ..
                                        round(
                                            (game:GetService("Players").LocalPlayer.Character.Head.Position -
                                                v.Character.Head.Position).Magnitude / 3
                                        ) ..
                                            " Distance\nHealth : " ..
                                                round(
                                                    v.Character.Humanoid.Health * 100 / v.Character.Humanoid.MaxHealth
                                                ) ..
                                                    "%")
                            end
                        else
                            if v.Character.Head:FindFirstChild("NameEsp" .. Number) then
                                v.Character.Head:FindFirstChild("NameEsp" .. Number):Destroy()
                            end
                        end
                    end
                end
            )
        end
    end
    function UpdateChestChams()
        for i, v in pairs(game.Workspace:GetChildren()) do
            pcall(
                function()
                    if string.find(v.Name, "Chest") then
                        if ChestESP then
                            if string.find(v.Name, "Chest") then
                                if not v:FindFirstChild("NameEsp" .. Number) then
                                    local bill = Instance.new("BillboardGui", v)
                                    bill.Name = "NameEsp" .. Number
                                    bill.ExtentsOffset = Vector3.new(0, 1, 0)
                                    bill.Size = UDim2.new(1, 200, 1, 30)
                                    bill.Adornee = v
                                    bill.AlwaysOnTop = true
                                    local name = Instance.new("TextLabel", bill)
                                    name.Font = Enum.Font.GothamSemibold
                                    name.FontSize = "Size14"
                                    name.TextWrapped = true
                                    name.Size = UDim2.new(1, 0, 1, 0)
                                    name.TextYAlignment = "Top"
                                    name.BackgroundTransparency = 1
                                    name.TextStrokeTransparency = 0.5
                                    if v.Name == "Chest1" then
                                        name.TextColor3 = Color3.fromRGB(109, 109, 109)
                                        name.Text =
                                            ("Chest 1" ..
                                            " \n" ..
                                                round(
                                                    (game:GetService("Players").LocalPlayer.Character.Head.Position -
                                                        v.Position).Magnitude / 3
                                                ) ..
                                                    " Distance")
                                    end
                                    if v.Name == "Chest2" then
                                        name.TextColor3 = Color3.fromRGB(173, 158, 21)
                                        name.Text =
                                            ("Chest 2" ..
                                            " \n" ..
                                                round(
                                                    (game:GetService("Players").LocalPlayer.Character.Head.Position -
                                                        v.Position).Magnitude / 3
                                                ) ..
                                                    " Distance")
                                    end
                                    if v.Name == "Chest3" then
                                        name.TextColor3 = Color3.fromRGB(85, 255, 255)
                                        name.Text =
                                            ("Chest 3" ..
                                            " \n" ..
                                                round(
                                                    (game:GetService("Players").LocalPlayer.Character.Head.Position -
                                                        v.Position).Magnitude / 3
                                                ) ..
                                                    " Distance")
                                    end
                                else
                                    v["NameEsp" .. Number].TextLabel.Text =
                                        (v.Name ..
                                        "   \n" ..
                                            round(
                                                (game:GetService("Players").LocalPlayer.Character.Head.Position -
                                                    v.Position).Magnitude / 3
                                            ) ..
                                                " Distance")
                                end
                            end
                        else
                            if v:FindFirstChild("NameEsp" .. Number) then
                                v:FindFirstChild("NameEsp" .. Number):Destroy()
                            end
                        end
                    end
                end
            )
        end
    end
    function UpdateDevilChams()
        for i, v in pairs(game.Workspace:GetChildren()) do
            pcall(
                function()
                    if DevilFruitESP then
                        if string.find(v.Name, "Fruit") then
                            if not v.Handle:FindFirstChild("NameEsp" .. Number) then
                                local bill = Instance.new("BillboardGui", v.Handle)
                                bill.Name = "NameEsp" .. Number
                                bill.ExtentsOffset = Vector3.new(0, 1, 0)
                                bill.Size = UDim2.new(1, 200, 1, 30)
                                bill.Adornee = v.Handle
                                bill.AlwaysOnTop = true
                                local name = Instance.new("TextLabel", bill)
                                name.Font = Enum.Font.GothamSemibold
                                name.FontSize = "Size14"
                                name.TextWrapped = true
                                name.Size = UDim2.new(1, 0, 1, 0)
                                name.TextYAlignment = "Top"
                                name.BackgroundTransparency = 1
                                name.TextStrokeTransparency = 0.5
                                name.TextColor3 = Color3.fromRGB(255, 255, 255)
                                name.Text =
                                    (v.Name ..
                                    " \n" ..
                                        round(
                                            (game:GetService("Players").LocalPlayer.Character.Head.Position -
                                                v.Handle.Position).Magnitude / 3
                                        ) ..
                                            " Distance")
                            else
                                v.Handle["NameEsp" .. Number].TextLabel.Text =
                                    (v.Name ..
                                    "   \n" ..
                                        round(
                                            (game:GetService("Players").LocalPlayer.Character.Head.Position -
                                                v.Handle.Position).Magnitude / 3
                                        ) ..
                                            " Distance")
                            end
                        end
                    else
                        if v.Handle:FindFirstChild("NameEsp" .. Number) then
                            v.Handle:FindFirstChild("NameEsp" .. Number):Destroy()
                        end
                    end
                end
            )
        end
    end
    function UpdateFlowerChams()
        for i, v in pairs(game.Workspace:GetChildren()) do
            pcall(
                function()
                    if v.Name == "Flower2" or v.Name == "Flower1" then
                        if FlowerESP then
                            if not v:FindFirstChild("NameEsp" .. Number) then
                                local bill = Instance.new("BillboardGui", v)
                                bill.Name = "NameEsp" .. Number
                                bill.ExtentsOffset = Vector3.new(0, 1, 0)
                                bill.Size = UDim2.new(1, 200, 1, 30)
                                bill.Adornee = v
                                bill.AlwaysOnTop = true
                                local name = Instance.new("TextLabel", bill)
                                name.Font = Enum.Font.GothamSemibold
                                name.FontSize = "Size14"
                                name.TextWrapped = true
                                name.Size = UDim2.new(1, 0, 1, 0)
                                name.TextYAlignment = "Top"
                                name.BackgroundTransparency = 1
                                name.TextStrokeTransparency = 0.5
                                name.TextColor3 = Color3.fromRGB(255, 0, 0)
                                if v.Name == "Flower1" then
                                    name.Text =
                                        ("Blue Flower" ..
                                        " \n" ..
                                            round(
                                                (game:GetService("Players").LocalPlayer.Character.Head.Position -
                                                    v.Position).Magnitude / 3
                                            ) ..
                                                " Distance")
                                    name.TextColor3 = Color3.fromRGB(0, 0, 255)
                                end
                                if v.Name == "Flower2" then
                                    name.Text =
                                        ("Red Flower" ..
                                        " \n" ..
                                            round(
                                                (game:GetService("Players").LocalPlayer.Character.Head.Position -
                                                    v.Position).Magnitude / 3
                                            ) ..
                                                " Distance")
                                    name.TextColor3 = Color3.fromRGB(255, 0, 0)
                                end
                            else
                                v["NameEsp" .. Number].TextLabel.Text =
                                    (v.Name ..
                                    "   \n" ..
                                        round(
                                            (game:GetService("Players").LocalPlayer.Character.Head.Position - v.Position).Magnitude /
                                                3
                                        ) ..
                                            " Distance")
                            end
                        else
                            if v:FindFirstChild("NameEsp" .. Number) then
                                v:FindFirstChild("NameEsp" .. Number):Destroy()
                            end
                        end
                    end
                end
            )
        end
    end
    function UpdateRealFruitChams()
        for i, v in pairs(game.Workspace.AppleSpawner:GetChildren()) do
            if v:IsA("Tool") then
                if RealFruitESP then
                    if not v.Handle:FindFirstChild("NameEsp" .. Number) then
                        local bill = Instance.new("BillboardGui", v.Handle)
                        bill.Name = "NameEsp" .. Number
                        bill.ExtentsOffset = Vector3.new(0, 1, 0)
                        bill.Size = UDim2.new(1, 200, 1, 30)
                        bill.Adornee = v.Handle
                        bill.AlwaysOnTop = true
                        local name = Instance.new("TextLabel", bill)
                        name.Font = Enum.Font.GothamSemibold
                        name.FontSize = "Size14"
                        name.TextWrapped = true
                        name.Size = UDim2.new(1, 0, 1, 0)
                        name.TextYAlignment = "Top"
                        name.BackgroundTransparency = 1
                        name.TextStrokeTransparency = 0.5
                        name.TextColor3 = Color3.fromRGB(255, 0, 0)
                        name.Text =
                            (v.Name ..
                            " \n" ..
                                round(
                                    (game:GetService("Players").LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude /
                                        3
                                ) ..
                                    " Distance")
                    else
                        v.Handle["NameEsp" .. Number].TextLabel.Text =
                            (v.Name ..
                            " " ..
                                round(
                                    (game:GetService("Players").LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude /
                                        3
                                ) ..
                                    " Distance")
                    end
                else
                    if v.Handle:FindFirstChild("NameEsp" .. Number) then
                        v.Handle:FindFirstChild("NameEsp" .. Number):Destroy()
                    end
                end
            end
        end
        for i, v in pairs(game.Workspace.PineappleSpawner:GetChildren()) do
            if v:IsA("Tool") then
                if RealFruitESP then
                    if not v.Handle:FindFirstChild("NameEsp" .. Number) then
                        local bill = Instance.new("BillboardGui", v.Handle)
                        bill.Name = "NameEsp" .. Number
                        bill.ExtentsOffset = Vector3.new(0, 1, 0)
                        bill.Size = UDim2.new(1, 200, 1, 30)
                        bill.Adornee = v.Handle
                        bill.AlwaysOnTop = true
                        local name = Instance.new("TextLabel", bill)
                        name.Font = Enum.Font.GothamSemibold
                        name.FontSize = "Size14"
                        name.TextWrapped = true
                        name.Size = UDim2.new(1, 0, 1, 0)
                        name.TextYAlignment = "Top"
                        name.BackgroundTransparency = 1
                        name.TextStrokeTransparency = 0.5
                        name.TextColor3 = Color3.fromRGB(255, 174, 0)
                        name.Text =
                            (v.Name ..
                            " \n" ..
                                round(
                                    (game:GetService("Players").LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude /
                                        3
                                ) ..
                                    " Distance")
                    else
                        v.Handle["NameEsp" .. Number].TextLabel.Text =
                            (v.Name ..
                            " " ..
                                round(
                                    (game:GetService("Players").LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude /
                                        3
                                ) ..
                                    " Distance")
                    end
                else
                    if v.Handle:FindFirstChild("NameEsp" .. Number) then
                        v.Handle:FindFirstChild("NameEsp" .. Number):Destroy()
                    end
                end
            end
        end
        for i, v in pairs(game.Workspace.BananaSpawner:GetChildren()) do
            if v:IsA("Tool") then
                if RealFruitESP then
                    if not v.Handle:FindFirstChild("NameEsp" .. Number) then
                        local bill = Instance.new("BillboardGui", v.Handle)
                        bill.Name = "NameEsp" .. Number
                        bill.ExtentsOffset = Vector3.new(0, 1, 0)
                        bill.Size = UDim2.new(1, 200, 1, 30)
                        bill.Adornee = v.Handle
                        bill.AlwaysOnTop = true
                        local name = Instance.new("TextLabel", bill)
                        name.Font = Enum.Font.GothamSemibold
                        name.FontSize = "Size14"
                        name.TextWrapped = true
                        name.Size = UDim2.new(1, 0, 1, 0)
                        name.TextYAlignment = "Top"
                        name.BackgroundTransparency = 1
                        name.TextStrokeTransparency = 0.5
                        name.TextColor3 = Color3.fromRGB(251, 255, 0)
                        name.Text =
                            (v.Name ..
                            " \n" ..
                                round(
                                    (game:GetService("Players").LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude /
                                        3
                                ) ..
                                    " Distance")
                    else
                        v.Handle["NameEsp" .. Number].TextLabel.Text =
                            (v.Name ..
                            " " ..
                                round(
                                    (game:GetService("Players").LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude /
                                        3
                                ) ..
                                    " Distance")
                    end
                else
                    if v.Handle:FindFirstChild("NameEsp" .. Number) then
                        v.Handle:FindFirstChild("NameEsp" .. Number):Destroy()
                    end
                end
            end
        end
    end

    spawn(
        function()
            while wait() do
                pcall(
                    function()
                        if MobESP then
                            for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v:FindFirstChild("HumanoidRootPart") then
                                    if not v:FindFirstChild("MobEap") then
                                        local BillboardGui = Instance.new("BillboardGui")
                                        local TextLabel = Instance.new("TextLabel")

                                        BillboardGui.Parent = v
                                        BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                                        BillboardGui.Active = true
                                        BillboardGui.Name = "MobEap"
                                        BillboardGui.AlwaysOnTop = true
                                        BillboardGui.LightInfluence = 1.000
                                        BillboardGui.Size = UDim2.new(0, 200, 0, 50)
                                        BillboardGui.StudsOffset = Vector3.new(0, 2.5, 0)

                                        TextLabel.Parent = BillboardGui
                                        TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                        TextLabel.BackgroundTransparency = 1.000
                                        TextLabel.Size = UDim2.new(0, 200, 0, 50)
                                        TextLabel.Font = Enum.Font.GothamBold
                                        TextLabel.TextColor3 = Color3.fromRGB(7, 236, 240)
                                        TextLabel.Text.Size = 35
                                    end
                                    local Dis =
                                        math.floor(
                                        (game.Players.LocalPlayer.Character.HumanoidRootPart.Position -
                                            v.HumanoidRootPart.Position).Magnitude
                                    )
                                    v.MobEap.TextLabel.Text = v.Name .. " - " .. Dis .. " Distance"
                                end
                            end
                        else
                            for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v:FindFirstChild("MobEap") then
                                    v.MobEap:Destroy()
                                end
                            end
                        end
                    end
                )
            end
        end
    )

    spawn(
        function()
            while wait() do
                pcall(
                    function()
                        if SeaESP then
                            for i, v in pairs(game:GetService("Workspace").SeaBeasts:GetChildren()) do
                                if v:FindFirstChild("HumanoidRootPart") then
                                    if not v:FindFirstChild("Seaesps") then
                                        local BillboardGui = Instance.new("BillboardGui")
                                        local TextLabel = Instance.new("TextLabel")

                                        BillboardGui.Parent = v
                                        BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                                        BillboardGui.Active = true
                                        BillboardGui.Name = "Seaesps"
                                        BillboardGui.AlwaysOnTop = true
                                        BillboardGui.LightInfluence = 1.000
                                        BillboardGui.Size = UDim2.new(0, 200, 0, 50)
                                        BillboardGui.StudsOffset = Vector3.new(0, 2.5, 0)

                                        TextLabel.Parent = BillboardGui
                                        TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                        TextLabel.BackgroundTransparency = 1.000
                                        TextLabel.Size = UDim2.new(0, 200, 0, 50)
                                        TextLabel.Font = Enum.Font.GothamBold
                                        TextLabel.TextColor3 = Color3.fromRGB(7, 236, 240)
                                        TextLabel.Text.Size = 35
                                    end
                                    local Dis =
                                        math.floor(
                                        (game.Players.LocalPlayer.Character.HumanoidRootPart.Position -
                                            v.HumanoidRootPart.Position).Magnitude
                                    )
                                    v.Seaesps.TextLabel.Text = v.Name .. " - " .. Dis .. " Distance"
                                end
                            end
                        else
                            for i, v in pairs(game:GetService("Workspace").SeaBeasts:GetChildren()) do
                                if v:FindFirstChild("Seaesps") then
                                    v.Seaesps:Destroy()
                                end
                            end
                        end
                    end
                )
            end
        end
    )

    spawn(
        function()
            while wait() do
                pcall(
                    function()
                        if NpcESP then
                            for i, v in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
                                if v:FindFirstChild("HumanoidRootPart") then
                                    if not v:FindFirstChild("NpcEspes") then
                                        local BillboardGui = Instance.new("BillboardGui")
                                        local TextLabel = Instance.new("TextLabel")

                                        BillboardGui.Parent = v
                                        BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                                        BillboardGui.Active = true
                                        BillboardGui.Name = "NpcEspes"
                                        BillboardGui.AlwaysOnTop = true
                                        BillboardGui.LightInfluence = 1.000
                                        BillboardGui.Size = UDim2.new(0, 200, 0, 50)
                                        BillboardGui.StudsOffset = Vector3.new(0, 2.5, 0)

                                        TextLabel.Parent = BillboardGui
                                        TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                        TextLabel.BackgroundTransparency = 1.000
                                        TextLabel.Size = UDim2.new(0, 200, 0, 50)
                                        TextLabel.Font = Enum.Font.GothamBold
                                        TextLabel.TextColor3 = Color3.fromRGB(7, 236, 240)
                                        TextLabel.Text.Size = 35
                                    end
                                    local Dis =
                                        math.floor(
                                        (game.Players.LocalPlayer.Character.HumanoidRootPart.Position -
                                            v.HumanoidRootPart.Position).Magnitude
                                    )
                                    v.NpcEspes.TextLabel.Text = v.Name .. " - " .. Dis .. " Distance"
                                end
                            end
                        else
                            for i, v in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
                                if v:FindFirstChild("NpcEspes") then
                                    v.NpcEspes:Destroy()
                                end
                            end
                        end
                    end
                )
            end
        end
    )

    function isnil(thing)
        return (thing == nil)
    end
    local function round(n)
        return math.floor(tonumber(n) + 0.5)
    end
    Number = math.random(1, 1000000)

    function UpdateIslandMirageESP()
        for i, v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
            pcall(
                function()
                    if MirageIslandESP then
                        if v.Name == "Mirage Island" then
                            if not v:FindFirstChild("NameEsp") then
                                local bill = Instance.new("BillboardGui", v)
                                bill.Name = "NameEsp"
                                bill.ExtentsOffset = Vector3.new(0, 1, 0)
                                bill.Size = UDim2.new(1, 200, 1, 30)
                                bill.Adornee = v
                                bill.AlwaysOnTop = true
                                local name = Instance.new("TextLabel", bill)
                                name.Font = "Code"
                                name.FontSize = "Size14"
                                name.TextWrapped = true
                                name.Size = UDim2.new(1, 0, 1, 0)
                                name.TextYAlignment = "Top"
                                name.BackgroundTransparency = 1
                                name.TextStrokeTransparency = 0.5
                                name.TextColor3 = Color3.fromRGB(80, 245, 245)
                            else
                                v["NameEsp"].TextLabel.Text =
                                    (v.Name ..
                                    "   \n" ..
                                        round(
                                            (game:GetService("Players").LocalPlayer.Character.Head.Position - v.Position).Magnitude /
                                                3
                                        ) ..
                                            " M")
                            end
                        end
                    else
                        if v:FindFirstChild("NameEsp") then
                            v:FindFirstChild("NameEsp"):Destroy()
                        end
                    end
                end
            )
        end
    end

    function isnil(thing)
        return (thing == nil)
    end
    local function round(n)
        return math.floor(tonumber(n) + 0.5)
    end
    Number = math.random(1, 1000000)

    function UpdateAfdESP()
        for i, v in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
            pcall(
                function()
                    if AfdESP then
                        if v.Name == "Advanced Fruit Dealer" then
                            if not v:FindFirstChild("NameEsp") then
                                local bill = Instance.new("BillboardGui", v)
                                bill.Name = "NameEsp"
                                bill.ExtentsOffset = Vector3.new(0, 1, 0)
                                bill.Size = UDim2.new(1, 200, 1, 30)
                                bill.Adornee = v
                                bill.AlwaysOnTop = true
                                local name = Instance.new("TextLabel", bill)
                                name.Font = "Code"
                                name.FontSize = "Size14"
                                name.TextWrapped = true
                                name.Size = UDim2.new(1, 0, 1, 0)
                                name.TextYAlignment = "Top"
                                name.BackgroundTransparency = 1
                                name.TextStrokeTransparency = 0.5
                                name.TextColor3 = Color3.fromRGB(80, 245, 245)
                            else
                                v["NameEsp"].TextLabel.Text =
                                    (v.Name ..
                                    "   \n" ..
                                        round(
                                            (game:GetService("Players").LocalPlayer.Character.Head.Position - v.Position).Magnitude /
                                                3
                                        ) ..
                                            " M")
                            end
                        end
                    else
                        if v:FindFirstChild("NameEsp") then
                            v:FindFirstChild("NameEsp"):Destroy()
                        end
                    end
                end
            )
        end
    end

    function UpdateAuraESP()
        for i, v in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
            pcall(
                function()
                    if AuraESP then
                        if v.Name == "Master of Enhancement" then
                            if not v:FindFirstChild("NameEsp") then
                                local bill = Instance.new("BillboardGui", v)
                                bill.Name = "NameEsp"
                                bill.ExtentsOffset = Vector3.new(0, 1, 0)
                                bill.Size = UDim2.new(1, 200, 1, 30)
                                bill.Adornee = v
                                bill.AlwaysOnTop = true
                                local name = Instance.new("TextLabel", bill)
                                name.Font = "Code"
                                name.FontSize = "Size14"
                                name.TextWrapped = true
                                name.Size = UDim2.new(1, 0, 1, 0)
                                name.TextYAlignment = "Top"
                                name.BackgroundTransparency = 1
                                name.TextStrokeTransparency = 0.5
                                name.TextColor3 = Color3.fromRGB(80, 245, 245)
                            else
                                v["NameEsp"].TextLabel.Text =
                                    (v.Name ..
                                    "   \n" ..
                                        round(
                                            (game:GetService("Players").LocalPlayer.Character.Head.Position - v.Position).Magnitude /
                                                3
                                        ) ..
                                            " M")
                            end
                        end
                    else
                        if v:FindFirstChild("NameEsp") then
                            v:FindFirstChild("NameEsp"):Destroy()
                        end
                    end
                end
            )
        end
    end

    function UpdateLSDESP()
        for i, v in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
            pcall(
                function()
                    if LADESP then
                        if v.Name == "Legendary Sword Dealer" then
                            if not v:FindFirstChild("NameEsp") then
                                local bill = Instance.new("BillboardGui", v)
                                bill.Name = "NameEsp"
                                bill.ExtentsOffset = Vector3.new(0, 1, 0)
                                bill.Size = UDim2.new(1, 200, 1, 30)
                                bill.Adornee = v
                                bill.AlwaysOnTop = true
                                local name = Instance.new("TextLabel", bill)
                                name.Font = "Code"
                                name.FontSize = "Size14"
                                name.TextWrapped = true
                                name.Size = UDim2.new(1, 0, 1, 0)
                                name.TextYAlignment = "Top"
                                name.BackgroundTransparency = 1
                                name.TextStrokeTransparency = 0.5
                                name.TextColor3 = Color3.fromRGB(80, 245, 245)
                            else
                                v["NameEsp"].TextLabel.Text =
                                    (v.Name ..
                                    "   \n" ..
                                        round(
                                            (game:GetService("Players").LocalPlayer.Character.Head.Position - v.Position).Magnitude /
                                                3
                                        ) ..
                                            " M")
                            end
                        end
                    else
                        if v:FindFirstChild("NameEsp") then
                            v:FindFirstChild("NameEsp"):Destroy()
                        end
                    end
                end
            )
        end
    end

    function UpdateGeaESP()
        for i, v in pairs(game:GetService("Workspace").Map.MysticIsland:GetChildren()) do
            pcall(
                function()
                    if GearESP then
                        if v.Name == "MeshPart" then
                            if not v:FindFirstChild("NameEsp") then
                                local bill = Instance.new("BillboardGui", v)
                                bill.Name = "NameEsp"
                                bill.ExtentsOffset = Vector3.new(0, 1, 0)
                                bill.Size = UDim2.new(1, 200, 1, 30)
                                bill.Adornee = v
                                bill.AlwaysOnTop = true
                                local name = Instance.new("TextLabel", bill)
                                name.Font = "Code"
                                name.FontSize = "Size14"
                                name.TextWrapped = true
                                name.Size = UDim2.new(1, 0, 1, 0)
                                name.TextYAlignment = "Top"
                                name.BackgroundTransparency = 1
                                name.TextStrokeTransparency = 0.5
                                name.TextColor3 = Color3.fromRGB(80, 245, 245)
                            else
                                v["NameEsp"].TextLabel.Text =
                                    (v.Name ..
                                    "   \n" ..
                                        round(
                                            (game:GetService("Players").LocalPlayer.Character.Head.Position - v.Position).Magnitude /
                                                3
                                        ) ..
                                            " M")
                            end
                        end
                    else
                        if v:FindFirstChild("NameEsp") then
                            v:FindFirstChild("NameEsp"):Destroy()
                        end
                    end
                end
            )
        end
    end
    --------------------------------------------------------------------------------------------------------------------------------------------
    ---------Tween

    function Tween2(P1)
        local Distance = (P1.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
        if Distance >= 1 then
            Speed = 350
        end
        game:GetService("TweenService"):Create(
            game.Players.LocalPlayer.Character.HumanoidRootPart,
            TweenInfo.new(Distance / Speed, Enum.EasingStyle.Linear),
            {
                CFrame = P1
            }
        ):Play()
        if _G.CancelTween2 then
            game:GetService("TweenService"):Create(
                game.Players.LocalPlayer.Character.HumanoidRootPart,
                TweenInfo.new(Distance / Speed, Enum.EasingStyle.Linear),
                {
                    CFrame = P1
                }
            ):Cancel()
        end
        _G.Clip2 = true
        wait(Distance / Speed)
        _G.Clip2 = false
    end

    --BTP
    function BTP(Position)
        game.Players.LocalPlayer.Character.Head:Destroy()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Position
        wait(0.5)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Position
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
    end
    --BTPZ
    function BTPZ(Point)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Point
        task.wait()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Point
    end
    ------Bypass TP 2
    function GetIsLand(...)
        local RealtargetPos = {...}
        local targetPos = RealtargetPos[1]
        local RealTarget
        if type(targetPos) == "vector" then
            RealTarget = targetPos
        elseif type(targetPos) == "userdata" then
            RealTarget = targetPos.Position
        elseif type(targetPos) == "number" then
            RealTarget = CFrame.new(unpack(RealtargetPos))
            RealTarget = RealTarget.p
        end

        local ReturnValue
        local CheckInOut = math.huge
        if game.Players.LocalPlayer.Team then
            for i, v in pairs(
                game.Workspace._WorldOrigin.PlayerSpawns:FindFirstChild(tostring(game.Players.LocalPlayer.Team)):GetChildren(

                )
            ) do
                local ReMagnitude = (RealTarget - v:GetModelCFrame().p).Magnitude
                if ReMagnitude < CheckInOut then
                    CheckInOut = ReMagnitude
                    ReturnValue = v.Name
                end
            end
            if ReturnValue then
                return ReturnValue
            end
        end
    end

    function toTarget(...)
        local RealtargetPos = {...}
        local targetPos = RealtargetPos[1]
        local RealTarget
        if type(targetPos) == "vector" then
            RealTarget = CFrame.new(targetPos)
        elseif type(targetPos) == "userdata" then
            RealTarget = targetPos
        elseif type(targetPos) == "number" then
            RealTarget = CFrame.new(unpack(RealtargetPos))
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
        local tweenfunc = {}
        local Distance =
            (RealTarget.Position -
            game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).Magnitude
        if Distance < 1000 then
            Speed = 315
        elseif Distance >= 1000 then
            Speed = 300
        end
        if BypassTP then
            if
                Distance > 3000 and not AutoNextIsland and
                    not (game.Players.LocalPlayer.Backpack:FindFirstChild("Special Microchip") or
                        game.Players.LocalPlayer.Character:FindFirstChild("Special Microchip") or
                        game.Players.LocalPlayer.Backpack:FindFirstChild("God's Chalice") or
                        game.Players.LocalPlayer.Character:FindFirstChild("God's Chalice") or
                        game.Players.LocalPlayer.Backpack:FindFirstChild("Hallow Essence") or
                        game.Players.LocalPlayer.Character:FindFirstChild("Hallow Essence") or
                        game.Players.LocalPlayer.Character:FindFirstChild("Sweet Chalice") or
                        game.Players.LocalPlayer.Backpack:FindFirstChild("Sweet Chalice")) and
                    not (Name == "Fishman Commando" or Name == "Fishman Warrior")
             then
                pcall(
                    function()
                        tween:Cancel()
                        fkwarp = false
                        if
                            game:GetService("Players")["LocalPlayer"].Data:FindFirstChild("SpawnPoint").Value ==
                                tostring(GetIsLand(RealTarget))
                         then
                            wait(.1)
                            Com("F_", "TeleportToSpawn")
                        elseif
                            game:GetService("Players")["LocalPlayer"].Data:FindFirstChild("LastSpawnPoint").Value ==
                                tostring(GetIsLand(RealTarget))
                         then
                            game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid"):ChangeState(15)
                            wait(0.1)
                            repeat
                                wait()
                            until game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid").Health > 0
                        else
                            if game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid").Health > 0 then
                                if fkwarp == false then
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = RealTarget
                                end
                                fkwarp = true
                            end
                            wait(.08)
                            game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid"):ChangeState(15)
                            repeat
                                wait()
                            until game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid").Health > 0
                            wait(.1)
                            Com("F_", "SetSpawnPoint")
                        end
                        wait(0.2)

                        return
                    end
                )
            end
        end

        local tween_s = game:service "TweenService"
        local info =
            TweenInfo.new(
            (RealTarget.Position -
                game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).Magnitude /
                Speed,
            Enum.EasingStyle.Linear
        )
        local tweenw, err =
            pcall(
            function()
                tween =
                    tween_s:Create(game.Players.LocalPlayer.Character["HumanoidRootPart"], info, {CFrame = RealTarget})
                tween:Play()
            end
        )

        function tweenfunc:Stop()
            tween:Cancel()
        end

        function tweenfunc:Wait()
            tween.Completed:Wait()
        end

        return tweenfunc
    end

    ------

    function Tween(Pos)
        Distance = (Pos.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
        if game.Players.LocalPlayer.Character.Humanoid.Sit == true then
            game.Players.LocalPlayer.Character.Humanoid.Sit = false
        end
        pcall(
            function()
                tween =
                    game:GetService("TweenService"):Create(
                    game.Players.LocalPlayer.Character.HumanoidRootPart,
                    TweenInfo.new(Distance / 300, Enum.EasingStyle.Linear),
                    {CFrame = Pos}
                )
            end
        )
        tween:Play()
        if Distance <= 300 then
            tween:Cancel()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Pos
        end
        if _G.StopTween == true then
            tween:Cancel()
            _G.Clip = false
        end
    end

    ---------

    function toTargetP(CFgo)
        if
            game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Health <= 0 or
                not game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid")
         then
            tween:Cancel()
            repeat
                wait()
            until game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid") and
                game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid").Health > 0
            wait(7)
            return
        end
        if
            (game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart.Position - CFgo.Position).Magnitude <=
                150
         then
            pcall(
                function()
                    tween:Cancel()

                    game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart.CFrame = CFgo

                    return
                end
            )
        end
        local tween_s = game:service "TweenService"
        local info =
            TweenInfo.new(
            (game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart.Position - CFgo.Position).Magnitude /
                325,
            Enum.EasingStyle.Linear
        )
        tween = tween_s:Create(game.Players.LocalPlayer.Character["HumanoidRootPart"], info, {CFrame = CFgo})
        tween:Play()

        local tweenfunc = {}

        function tweenfunc:Stop()
            tween:Cancel()
        end

        return tweenfunc
    end

    --function TP to Boat/Ship
    function TweenShip(CFgo)
        local tween_s = game:service "TweenService"
        local info =
            TweenInfo.new(
            (game:GetService("Workspace").Boats.MarineBrigade.VehicleSeat.CFrame.Position - CFgo.Position).Magnitude /
                300,
            Enum.EasingStyle.Linear
        )
        tween = tween_s:Create(game:GetService("Workspace").Boats.MarineBrigade.VehicleSeat, info, {CFrame = CFgo})
        tween:Play()

        local tweenfunc = {}

        function tweenfunc:Stop()
            tween:Cancel()
        end

        return tweenfunc
    end

    function TweenBoat(CFgo)
        if
            game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Health <= 0 or
                not game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid")
         then
            tween:Cancel()
            repeat
                wait()
            until game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid") and
                game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid").Health > 0
            wait(7)
            return
        end
        local tween_s = game:service "TweenService"
        local info =
            TweenInfo.new(
            (game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart.Position - CFgo.Position).Magnitude /
                325,
            Enum.EasingStyle.Linear
        )
        tween = tween_s:Create(game.Players.LocalPlayer.Character["HumanoidRootPart"], info, {CFrame = CFgo})
        tween:Play()

        local tweenfunc = {}

        function tweenfunc:Stop()
            tween:Cancel()
        end

        return tweenfunc
    end

    --select weapon
    function EquipTool(ToolSe)
        if game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe) then
            local tool = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe)
            wait(0.5)
            game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
        end
    end

    --aimbot mastery

    spawn(
        function()
            local gg = getrawmetatable(game)
            local old = gg.__namecall
            setreadonly(gg, false)
            gg.__namecall =
                newcclosure(
                function(...)
                    local method = getnamecallmethod()
                    local args = {
                        ...
                    }
                    if tostring(method) == "FireServer" then
                        if tostring(args[1]) == "RemoteEvent" then
                            if tostring(args[2]) ~= "true" and tostring(args[2]) ~= "false" then
                                if _G.UseSkill then
                                    if type(args[2]) == "vector" then
                                        args[2] = PositionSkillMasteryDevilFruit
                                    else
                                        args[2] = CFrame.new(PositionSkillMasteryDevilFruit)
                                    end
                                    return old(unpack(args))
                                end
                            end
                        end
                    end
                    return old(...)
                end
            )
        end
    )
    --Equip Gun
    spawn(
        function()
            pcall(
                function()
                    while task.wait() do
                        for i, v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
                            if v:IsA("Tool") then
                                if v:FindFirstChild("RemoteFunctionShoot") then
                                    CurrentEquipGun = v.Name
                                end
                            end
                        end
                    end
                end
            )
        end
    )

    -- [Body Gyro]
    spawn(
        function()
            while task.wait() do
                pcall(
                    function()
                        if
                            _G.TeleportIsland or AutoFarmChest or _G.chestsea2 or _G.chestsea3 or _G.CastleRaid or
                                _G.CollectAzure or
                                _G.TweenToKitsune or
                                _G.AutoCandy or
                                _G.GhostShip or
                                _G.Ship or
                                _G.SailBoat or
                                _G.Auto_Holy_Torch or
                                _G.FindMirageIsland or
                                _G.TeleportPly or
                                _G.Tweenfruit or
                                _G.AutoFishCrew or
                                _G.AutoShark or
                                _G.AutoCakeV2 or
                                _G.AutoMysticIsland or
                                _G.AutoQuestRace or
                                _G.AutoBuyBoat or
                                _G.dao or
                                _G.AutoMirage or
                                AutoFarmAcient or
                                _G.AutoQuestRace or
                                Auto_Law or
                                _G.AutoAllBoss or
                                AutoTushita or
                                _G.AutoHolyTorch or
                                _G.AutoTerrorshark or
                                _G.farmpiranya or
                                _G.DriveMytic or
                                _G.AutoCakeV2V2 or
                                PirateShip or
                                _G.AutoSeaBeast or
                                _G.AutoNear or
                                _G.BossRaid or
                                _G.GrabChest or
                                AutoCitizen or
                                _G.Ectoplasm or
                                AutoEvoRace or
                                AutoBartilo or
                                AutoFactory or
                                BringChestz or
                                BringFruitz or
                                _G.LevelFarm or
                                _G.Clip2 or
                                AutoFarmNoQuest or
                                _G.AutoBone or
                                AutoFarmSelectMonsterQuest or
                                AutoFarmSelectMonsterNoQuest or
                                _G.AutoBoss or
                                AutoFarmBossQuest or
                                AutoFarmMasGun or
                                AutoFarmMasDevilFruit or
                                AutoFarmSelectArea or
                                AutoSecondSea or
                                AutoThirdSea or
                                AutoDeathStep or
                                AutoSuperhuman or
                                AutoSharkman or
                                AutoElectricClaw or
                                AutoDragonTalon or
                                AutoGodhuman or
                                AutoRengoku or
                                AutoBuddySword or
                                AutoPole or
                                AutoHallowSycthe or
                                AutoCavander or
                                AutoTushita or
                                AutoDarkDagger or
                                _G.CakePrince or
                                _G.AutoElite or
                                AutoRainbowHaki or
                                AutoSaber or
                                AutoFarmKen or
                                AutoKenHop or
                                AutoKenV2 or
                                _G.AutoKillPlayerMelee or
                                _G.AutoKillPlayerGun or
                                _G.AutoKillPlayerFruit or
                                AutoDungeon or
                                AutoNextIsland or
                                AutoAdvanceDungeon or
                                Musketeer or
                                RipIndra or
                                Auto_Serpent_Bow or
                                AutoTorch or
                                AutoSoulGuitar or
                                Auto_Cursed_Dual_Katana or
                                _G.AutoMaterial or
                                Auto_Quest_Yama_1 or
                                Auto_Quest_Yama_2 or
                                Auto_Quest_Yama_3 or
                                Auto_Quest_Tushita_1 or
                                Auto_Quest_Tushita_2 or
                                Auto_Quest_Tushita_3 or
                                _G.Factory or
                                _G.SwanGlasses or
                                AutoBartilo or
                                AutoEvoRace or
                                _G.Ectoplasm
                         then
                            if
                                not game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild(
                                    "BodyClip"
                                )
                             then
                                local Noclip = Instance.new("BodyVelocity")
                                Noclip.Name = "BodyClip"
                                Noclip.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
                                Noclip.MaxForce = Vector3.new(100000, 100000, 100000)
                                Noclip.Velocity = Vector3.new(0, 0, 0)
                            end
                        else
                            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip"):Destroy(

                            )
                        end
                    end
                )
            end
        end
    )

    --No CLip Auto Farm
    spawn(
        function()
            pcall(
                function()
                    game:GetService("RunService").Stepped:Connect(
                        function()
                            if
                                _G.TeleportIsland or _G.CastleRaid or AutoFarmChest or _G.CollectAzure or
                                    _G.TweenToKitsune or
                                    _G.AutoCandy or
                                    _G.GhostShip or
                                    _G.Ship or
                                    _G.SailBoat or
                                    _G.Auto_Holy_Torch or
                                    _G.Tweenfruit or
                                    _G.FindMirageIsland or
                                    _G.TeleportPly or
                                    _G.AutoFishCrew or
                                    _G.AutoShark or
                                    _G.AutoMysticIsland or
                                    _G.AutoCakeV2 or
                                    _G.AutoQuestRace or
                                    _G.AutoBuyBoat or
                                    _G.dao or
                                    AutoFarmAcient or
                                    _G.AutoMirage or
                                    Auto_Law or
                                    _G.AutoQuestRace or
                                    _G.AutoAllBoss or
                                    _G.AutoHolyTorch or
                                    AutoTushita or
                                    _G.farmpiranya or
                                    _G.AutoTerrorshark or
                                    _G.AutoNear or
                                    _G.AutoCakeV2V2 or
                                    PirateShip or
                                    _G.AutoSeaBeast or
                                    _G.DriveMytic or
                                    _G.BossRaid or
                                    _G.GrabChest or
                                    AutoCitizen or
                                    _G.Ectoplasm or
                                    AutoEvoRace or
                                    AutoBartilo or
                                    AutoFactory or
                                    BringChestz or
                                    BringFruitz or
                                    _G.LevelFarm or
                                    _G.Clip2 or
                                    AutoFarmNoQuest or
                                    _G.AutoBone or
                                    AutoFarmSelectMonsterQuest or
                                    AutoFarmSelectMonsterNoQuest or
                                    _G.AutoBoss or
                                    AutoFarmBossQuest or
                                    AutoFarmMasGun or
                                    AutoFarmMasDevilFruit or
                                    AutoFarmSelectArea or
                                    AutoSecondSea or
                                    AutoThirdSea or
                                    AutoDeathStep or
                                    AutoSuperhuman or
                                    AutoSharkman or
                                    AutoElectricClaw or
                                    AutoDragonTalon or
                                    AutoGodhuman or
                                    AutoRengoku or
                                    AutoBuddySword or
                                    AutoPole or
                                    AutoHallowSycthe or
                                    AutoCavander or
                                    AutoTushita or
                                    AutoDarkDagger or
                                    _G.CakePrince or
                                    _G.AutoElite or
                                    AutoRainbowHaki or
                                    AutoSaber or
                                    AutoFarmKen or
                                    AutoKenHop or
                                    AutoKenV2 or
                                    _G.AutoKillPlayerMelee or
                                    _G.AutoKillPlayerGun or
                                    _G.AutoKillPlayerFruit or
                                    AutoDungeon or
                                    AutoNextIsland or
                                    AutoAdvanceDungeon or
                                    Musketeer or
                                    RipIndra or
                                    Auto_Serpent_Bow or
                                    AutoTorch or
                                    AutoSoulGuitar or
                                    Auto_Cursed_Dual_Katana or
                                    _G.AutoMaterial or
                                    Auto_Quest_Yama_1 or
                                    Auto_Quest_Yama_2 or
                                    Auto_Quest_Yama_3 or
                                    Auto_Quest_Tushita_1 or
                                    Auto_Quest_Tushita_2 or
                                    Auto_Quest_Tushita_3 or
                                    _G.Factory or
                                    _G.SwanGlasses or
                                    AutoBartilo or
                                    AutoEvoRace or
                                    _G.Ectoplasm
                             then
                                for i, v in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
                                    if v:IsA("BasePart") then
                                        v.CanCollide = false
                                    end
                                end
                            end
                        end
                    )
                end
            )
        end
    )

    --Check Material
    function CheckMaterial(matname)
        for i, v in pairs(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventory")) do
            if type(v) == "table" then
                if v.Type == "Material" then
                    if v.Name == matname then
                        return v.Count
                    end
                end
            end
        end
        return 0
    end

    function GetWeaponInventory(Weaponname)
        for i, v in pairs(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventory")) do
            if type(v) == "table" then
                if v.Type == "Sword" then
                    if v.Name == Weaponname then
                        return true
                    end
                end
            end
        end
        return false
    end

    function AttackNoCoolDown()
        local v228 = {};
        local v229 = game:GetService("Workspace").Enemies:GetChildren();
        local v230 = FindEnemiesInRange(v228, v229);
        if not v230 then
            return;
        end
        local v231 = GetEquippedTool();
        if not v231 then
            return;
        end
        pcall(function()
            local v477 = game:GetService("ReplicatedStorage");
            local v478 = v477:WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RE/RegisterAttack");
            local v479 = v477:WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RE/RegisterHit");
            if (# v228 > 0) then
                v478:FireServer(1e-9);
                v479:FireServer(v230, v228);
            else
                task.wait(1e-9);
            end
        end);
    end
    Type = 1;
    spawn(function()
        while wait() do
            if (Type == 1) then
                Pos = CFrame.new(0, 40, 0);
            elseif (Type == 2) then
                Pos = CFrame.new(- 40, 40, 0);
           elseif (Type == 3) then
                Pos = CFrame.new(40, 40, 0);
            elseif (Type == 4) then
                Pos = CFrame.new(0, 40, 40);
            elseif (Type == 5) then
                Pos = CFrame.new(0, 40, - 40);
            end
        end
    end);
    spawn(function()
        while wait() do
            Type = 1;
            wait(0.2);
            Type = 2;
            wait(0.2);
            Type = 3;
            wait(0.2);
            Type = 4;
            wait(0.2);
            Type = 5;
            wait(0.2);
        end
    end);
    --auto turn haki
    function AutoHaki()
        if not game:GetService("Players").LocalPlayer.Character:FindFirstChild("HasBuso") then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
        end
    end
    ---Bypass Teleport
    function BTP(P)
        repeat
            wait(0.5)
            game.Players.LocalPlayer.Character.Humanoid:ChangeState(15)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = P
            task.wait()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = P
        until (P.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 2000
    end

    function BTP(p)
        pcall(
            function()
                if
                    (p.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude >= 2000 and
                        not Auto_Raid and
                        game.Players.LocalPlayer.Character.Humanoid.Health > 0
                 then
                    if NameMon == "FishmanQuest" then
                        Tween(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
                        wait()
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                            "requestEntrance",
                            Vector3.new(61163.8515625, 11.6796875, 1819.7841796875)
                        )
                    elseif Mon == "God's Guard" then
                        Tween(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
                        wait()
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                            "requestEntrance",
                            Vector3.new(-4607.82275, 872.54248, -1667.55688)
                        )
                    elseif NameMon == "SkyExp1Quest" then
                        Tween(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
                        wait()
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                            "requestEntrance",
                            Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047)
                        )
                    elseif NameMon == "ShipQuest1" then
                        Tween(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
                        wait()
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                            "requestEntrance",
                            Vector3.new(923.21252441406, 126.9760055542, 32852.83203125)
                        )
                    elseif NameMon == "ShipQuest2" then
                        Tween(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
                        wait()
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                            "requestEntrance",
                            Vector3.new(923.21252441406, 126.9760055542, 32852.83203125)
                        )
                    elseif NameMon == "FrostQuest" then
                        Tween(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
                        wait()
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                            "requestEntrance",
                            Vector3.new(-6508.5581054688, 89.034996032715, -132.83953857422)
                        )
                    else
                        repeat
                            wait(0.5)
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = p
                            wait(.05)
                            game.Players.LocalPlayer.Character.Head:Destroy()
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = p
                        until (p.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <
                            2500 and game.Players.LocalPlayer.Character.Humanoid.Health > 0
                        wait()
                    end
                end
            end
        )
    end

    function nHgshEJpoqgHTBEJZ(c)
        tab = {}
        for i = 1, #c do
            x = string.len(c[i])
            y = string.char(x)
            table.insert(tab, y)
        end
        x = table.concat(tab)
        return x
    end
    ---------------Fast
    _G.FastAttack = true

    if _G.FastAttack then
        local _ENV = (getgenv or getrenv or getfenv)()

        local function SafeWaitForChild(parent, childName)
            local success, result =
                pcall(
                function()
                    return parent:WaitForChild(childName)
                end
            )
            if not success or not result then
                warn("noooooo: " .. childName)
            end
            return result
        end

        local function WaitChilds(path, ...)
            local last = path
            for _, child in {...} do
                last = last:FindFirstChild(child) or SafeWaitForChild(last, child)
                if not last then
                    break
                end
            end
            return last
        end

        local VirtualInputManager = game:GetService("VirtualInputManager")
        local CollectionService = game:GetService("CollectionService")
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local TeleportService = game:GetService("TeleportService")
        local RunService = game:GetService("RunService")
        local Players = game:GetService("Players")
        local Player = Players.LocalPlayer

        if not Player then
            warn("Không tìm thấy người chơi cục bộ.")
            return
        end

        local Remotes = SafeWaitForChild(ReplicatedStorage, "Remotes")
        if not Remotes then
            return
        end

        local Validator = SafeWaitForChild(Remotes, "Validator")
        local CommF = SafeWaitForChild(Remotes, "CommF_")
        local CommE = SafeWaitForChild(Remotes, "CommE")

        local ChestModels = SafeWaitForChild(workspace, "ChestModels")
        local WorldOrigin = SafeWaitForChild(workspace, "_WorldOrigin")
        local Characters = SafeWaitForChild(workspace, "Characters")
        local Enemies = SafeWaitForChild(workspace, "Enemies")
        local Map = SafeWaitForChild(workspace, "Map")

        local EnemySpawns = SafeWaitForChild(WorldOrigin, "EnemySpawns")
        local Locations = SafeWaitForChild(WorldOrigin, "Locations")

        local RenderStepped = RunService.RenderStepped
        local Heartbeat = RunService.Heartbeat
        local Stepped = RunService.Stepped

        local Modules = SafeWaitForChild(ReplicatedStorage, "Modules")
        local Net = SafeWaitForChild(Modules, "Net")

        local sethiddenproperty = sethiddenproperty or function(...)
                return ...
            end
        local setupvalue = setupvalue or (debug and debug.setupvalue)
        local getupvalue = getupvalue or (debug and debug.getupvalue)

        local Settings = {
            AutoClick = true,
            ClickDelay = 0
        }

        local Module = {}

        Module.FastAttack =
            (function()
            if _ENV.rz_FastAttack then
                return _ENV.rz_FastAttack
            end

            local FastAttack = {
                Distance = 200000,
                attackMobs = true,
                attackPlayers = true,
                Equipped = nil
            }

            local RegisterAttack = SafeWaitForChild(Net, "RE/RegisterAttack")
            local RegisterHit = SafeWaitForChild(Net, "RE/RegisterHit")

            local function IsAlive(character)
                return character and character:FindFirstChild("Humanoid") and character.Humanoid.Health > 0
            end

            local function ProcessEnemies(OthersEnemies, Folder)
                local BasePart = nil
                for _, Enemy in Folder:GetChildren() do
                    local Head = Enemy:FindFirstChild("Head")
                    if Head and IsAlive(Enemy) and Player:DistanceFromCharacter(Head.Position) < FastAttack.Distance then
                        if Enemy ~= Player.Character then
                            table.insert(OthersEnemies, {Enemy, Head})
                            BasePart = Head
                        end
                    end
                end
                return BasePart
            end

            function FastAttack:Attack(BasePart, OthersEnemies)
                if not BasePart or #OthersEnemies == 0 then
                    return
                end
                RegisterAttack:FireServer(Settings.ClickDelay or 0)
                RegisterHit:FireServer(BasePart, OthersEnemies)
            end

            function FastAttack:AttackNearest()
                local OthersEnemies = {}
                local Part1 = ProcessEnemies(OthersEnemies, Enemies)
                local Part2 = ProcessEnemies(OthersEnemies, Characters)
                if #OthersEnemies > 0 then
                    self:Attack(Part1 or Part2, OthersEnemies)
                else
                    wait(0)
                end
            end

            function FastAttack:BladeHits()
                local Equipped = IsAlive(Player.Character) and Player.Character:FindFirstChildOfClass("Tool")
                if Equipped and Equipped.ToolTip ~= "Gun" then
                    self:AttackNearest()
                else
                    wait(0,01)
                end
            end

            spawn(
                function()
                    while task.wait(Settings.ClickDelay) do
                        if Settings.AutoClick then
                            FastAttack:BladeHits()
                        end
                    end
                end
            )

            _ENV.rz_FastAttack = FastAttack
            return FastAttack
        end)()
    end

    ---------------------------------------idk
    function to(v232)
        repeat
            wait(_G.Fast_Delay)
            game.Players.LocalPlayer.Character.Humanoid:ChangeState(15)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v232
            task.wait()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v232
        until (v232.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 2000
    end
    function to(v233)
        pcall(
            function()
                if
                    (((v233.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude >= 2000) and
                        not Auto_Raid and
                        (game.Players.LocalPlayer.Character.Humanoid.Health > 0))
                 then
                    if (NameMon == "FishmanQuest") then
                        Tween(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
                        wait()
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                            "requestEntrance",
                            Vector3.new(61163.8515625, 11.6796875, 1819.7841796875)
                        )
                    elseif (Mon == "God's Guard") then
                        Tween(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
                        wait()
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                            "requestEntrance",
                            Vector3.new(-4607.82275, 872.54248, -1667.55688)
                        )
                    elseif (NameMon == "SkyExp1Quest") then
                        Tween(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
                        wait()
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                            "requestEntrance",
                            Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047)
                        )
                    elseif (NameMon == "ShipQuest1") then
                        Tween(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
                        wait()
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                            "requestEntrance",
                            Vector3.new(923.21252441406, 126.9760055542, 32852.83203125)
                        )
                    elseif (NameMon == "ShipQuest2") then
                        Tween(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
                        wait()
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                            "requestEntrance",
                            Vector3.new(923.21252441406, 126.9760055542, 32852.83203125)
                        )
                    elseif (NameMon == "FrostQuest") then
                        Tween(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
                        wait()
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                            "requestEntrance",
                            Vector3.new(-6508.5581054688, 89.034996032715, -132.83953857422)
                        )
                    else
                        repeat
                            wait(_G.Fast_Delay)
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v233
                            wait(0.05)
                            game.Players.LocalPlayer.Character.Head:Destroy()
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v233
                        until ((v233.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <
                            2500) and (game.Players.LocalPlayer.Character.Humanoid.Health > 0)
                        wait()
                    end
                end
            end
        )
    end

    ----------------------------------Tab Sever-------------------------

    local JobId = Tabs.Sever:AddSection("Job ID")

    local v105 =
        Tabs.Sever:AddInput(
        "Input",
        {
            Title = "Job ID",
            Default = "",
            Placeholder = "",
            Numeric = false,
            Finished = false,
            Callback = function(v301)
                _G.Job = v301
            end
        }
    )
    Tabs.Sever:AddButton(
        {
            Title = "Join Sever",
            Description = "",
            Callback = function()
                game:GetService("TeleportService"):TeleportToPlaceInstance(
                    game.placeId,
                    _G.Job,
                    game.Players.LocalPlayer
                )
            end
        }
    )

    local Status = Tabs.Sever:AddSection("Sever Discord")

    Tabs.Sever:AddButton(
        {
            Title = "Sever Discord PhatCrystal",
            Description = "Click to copy the Discord link",
            Callback = function()
                setclipboard("https://discord.gg/hyGgHBudcs")
                print("Discord link copied!")
            end
        }
    )

    local SeverZzz = Tabs.Sever:AddSection("Sever")
    Tabs.Sever:AddButton(
        {
            Title = "Rejoin Server",
            Description = "",
            Callback = function()
                game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
            end
        }
    )

    Tabs.Sever:AddButton(
        {
            Title = "Hop Server",
            Description = "",
            Callback = function()
                Hop()
            end
        }
    )

    function Hop()
        local PlaceID = game.PlaceId
        local AllIDs = {}
        local foundAnything = ""
        local actualHour = os.date("!*t").hour
        local Deleted = false
        function TPReturner()
            local Site
            if foundAnything == "" then
                Site =
                    game.HttpService:JSONDecode(
                    game:HttpGet(
                        "https://games.roblox.com/v1/games/" .. PlaceID .. "/servers/Public?sortOrder=Asc&limit=100"
                    )
                )
            else
                Site =
                    game.HttpService:JSONDecode(
                    game:HttpGet(
                        "https://games.roblox.com/v1/games/" ..
                            PlaceID .. "/servers/Public?sortOrder=Asc&limit=100&cursor=" .. foundAnything
                    )
                )
            end
            local ID = ""
            if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
                foundAnything = Site.nextPageCursor
            end
            local num = 0
            for i, v in pairs(Site.data) do
                local Possible = true
                ID = tostring(v.id)
                if tonumber(v.maxPlayers) > tonumber(v.playing) then
                    for _, Existing in pairs(AllIDs) do
                        if num ~= 0 then
                            if ID == tostring(Existing) then
                                Possible = false
                            end
                        else
                            if tonumber(actualHour) ~= tonumber(Existing) then
                                local delFile =
                                    pcall(
                                    function()
                                        AllIDs = {}
                                        table.insert(AllIDs, actualHour)
                                    end
                                )
                            end
                        end
                        num = num + 1
                    end
                    if Possible == true then
                        table.insert(AllIDs, ID)
                        wait()
                        pcall(
                            function()
                                wait()
                                game:GetService("TeleportService"):TeleportToPlaceInstance(
                                    PlaceID,
                                    ID,
                                    game.Players.LocalPlayer
                                )
                            end
                        )
                        wait(4)
                    end
                end
            end
        end
        function Teleport()
            while wait() do
                pcall(
                    function()
                        TPReturner()
                        if foundAnything ~= "" then
                            TPReturner()
                        end
                    end
                )
            end
        end
        Teleport()
    end

    local v102 =
        Tabs.Sever:AddParagraph(
        {
            Title = "Time In Sever",
            Content = ""
        }
    )
    local function v103()
        local v297 = math.floor(workspace.DistributedGameTime + 0.5)
        local v298 = math.floor(v297 / (60 ^ 2)) % 24
        local v299 = math.floor(v297 / 60) % 60
        local v300 = v297 % 60
        v102:SetDesc(string.format("%02d H - %02d m - %02d s", v298, v299, v300))
    end
    spawn(
        function()
            while wait() do
                pcall(v103)
            end
        end
    )

    local SeverOw = Tabs.Sever:AddSection("Status Sever")
    local v529 =
        Tabs.Sever:AddParagraph(
        {
            Title = "Elite",
            Content = "Status Elite"
        }
    )
    spawn(
        function()
            while wait() do
                pcall(
                    function()
                        if
                            (game:GetService("ReplicatedStorage"):FindFirstChild("Diablo") or
                                game:GetService("ReplicatedStorage"):FindFirstChild("Deandre") or
                                game:GetService("ReplicatedStorage"):FindFirstChild("Urban") or
                                game:GetService("Workspace").Enemies:FindFirstChild("Diablo") or
                                game:GetService("Workspace").Enemies:FindFirstChild("Deandre") or
                                game:GetService("Workspace").Enemies:FindFirstChild("Urban"))
                         then
                            v529:SetDesc(
                                "Elite Boss: ✅️ | Killed:  " ..
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                        "EliteHunter",
                                        "Progress"
                                    )
                            )
                        else
                            v529:SetDesc(
                                "Elite Boss: ❌️ | Killed: " ..
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                        "EliteHunter",
                                        "Progress"
                                    )
                            )
                        end
                    end
                )
            end
        end
    )

    local v491 =
        Tabs.Sever:AddParagraph(
        {
            Title = "Status Dough Prince",
            Content = ""
        }
    )
    spawn(
        function()
            while wait() do
                pcall(
                    function()
                        if
                            (string.len(
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")
                            ) == 88)
                         then
                            v491:SetDesc(
                                "Mob: " ..
                                    string.sub(
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                            "CakePrinceSpawner"
                                        ),
                                        39,
                                        41
                                    ) ..
                                        ""
                            )
                        elseif
                            (string.len(
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")
                            ) == 87)
                         then
                            v491:SetDesc(
                                "Mob: " ..
                                    string.sub(
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                            "CakePrinceSpawner"
                                        ),
                                        39,
                                        40
                                    ) ..
                                        ""
                            )
                        elseif
                            (string.len(
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")
                            ) == 86)
                         then
                            v491:SetDesc(
                                "Mob: " ..
                                    string.sub(
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                            "CakePrinceSpawner"
                                        ),
                                        39,
                                        39
                                    ) ..
                                        " "
                            )
                        else
                            v491:SetDesc("Dough Prince : ✅️")
                        end
                    end
                )
            end
        end
    )

    local Swordd =
        Tabs.Sever:AddParagraph(
        {
            Title = "Legendary Sword",
            Content = "Status Legendary Sword"
        }
    )
    spawn(function()
        local previousStatus = ""
        while wait(1) do
            local swordStatus = "Not Found Legend Swords"
            if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LegendarySwordDealer", "1") then
                swordStatus = "Shisui"
            elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LegendarySwordDealer", "2") then
                swordStatus = "Wando"
            elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LegendarySwordDealer", "3") then
                swordStatus = "Saddi"
            end
            Swordd:SetDesc(swordStatus)
        end
    end)

	
    local v104 =
        Tabs.Sever:AddParagraph(
        {
            Title = "Leviathan Island",
            Content = "Status Leviathan Island"
        }
    )
    spawn(
        function()
            pcall(
                function()
                    while wait() do
                        if game:GetService("Workspace").Map:FindFirstChild("FrozenDimension") then
                            v104:SetDesc("✅️")
                        else
                            v104:SetDesc("❌️")
                        end
                    end
                end
            )
        end
    )

    local v169 =
        Tabs.Sever:AddParagraph(
        {
            Title = "Volcanic Island",
            Content = "Status Volcanic Island"
        }
    )
    spawn(
        function()
            pcall(
                function()
                    while wait() do
                        if game:GetService("Workspace").Map:FindFirstChild("PrehistoricIsland") then
                            v169:SetDesc("✅️")
                        else
                            v169:SetDesc("❌️")
                        end
                    end
                end
            )
        end
    )

    local v0z =
        Tabs.Sever:AddParagraph(
        {
            Title = "Mirage Island",
            Content = "Status Mirage Island"
        }
    )
    spawn(
        function()
            while wait() do
                pcall(
                    function()
                        local v793 = game:GetService("Lighting").Sky.MoonTextureId
                        if (v793 == "http://www.roblox.com/asset/?id=9709149431") then
                            FullMoonStatus = "100%"
                        elseif (v793 == "http://www.roblox.com/asset/?id=9709149052") then
                            FullMoonStatus = "75%"
                        elseif (v793 == "http://www.roblox.com/asset/?id=9709143733") then
                            FullMoonStatus = "50%"
                        elseif (v793 == "http://www.roblox.com/asset/?id=9709150401") then
                            FullMoonStatus = "25%"
                        elseif (v793 == "http://www.roblox.com/asset/?id=9709149680") then
                            FullMoonStatus = "15%"
                        else
                            FullMoonStatus = "0%"
                        end
                    end
                )
            end
        end
    )
    spawn(
        function()
            while wait() do
                pcall(
                    function()
                        if game.Workspace.Map:FindFirstChild("MysticIsland") then
                            MirageStatus = "✅️"
                        else
                            MirageStatus = "❌️"
                        end
                    end
                )
            end
        end
    )
    spawn(
        function()
            pcall(
                function()
                    while wait() do
                        v0z:SetDesc("Status Mirage " .. MirageStatus .. " | Status Full Moon " .. FullMoonStatus)
                    end
                end
            )
        end
    )

    local v499 =
        Tabs.Sever:AddParagraph(
        {
            Title = "Kitsune Island",
            Content = "Status Kitsune Island"
        }
    )
    spawn(
        function()
            pcall(
                function()
                    while wait() do
                        if game:GetService("Workspace").Map:FindFirstChild("KitsuneIsland") then
                            v499:SetDesc("✅️")
                        else
                            v499:SetDesc("❌️")
                        end
                    end
                end
            )
        end
    )
    ----------------------------------------Tab Main---------------------------------
    local DropdownSelectWeapon =
        Tabs.Main:AddDropdown(
        "DropdownSelectWeapon",
        {
            Title = "Choose Weapon",
            Values = {"Melee", "Sword", "Blox Fruit"},
            Multi = false,
            Default = 1
        }
    )
    DropdownSelectWeapon:SetValue("Melee")
    DropdownSelectWeapon:OnChanged(
        function(Value)
            ChooseWeapon = Value
        end
    )
    task.spawn(
        function()
            while wait() do
                pcall(
                    function()
                        if ChooseWeapon == "Melee" then
                            for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                                if v.ToolTip == "Melee" then
                                    if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
                                        SelectWeapon = v.Name
                                    end
                                end
                            end
                        elseif ChooseWeapon == "Sword" then
                            for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                                if v.ToolTip == "Sword" then
                                    if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
                                        SelectWeapon = v.Name
                                    end
                                end
                            end
                        elseif ChooseWeapon == "Blox Fruit" then
                            for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                                if v.ToolTip == "Blox Fruit" then
                                    if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
                                        SelectWeapon = v.Name
                                    end
                                end
                            end
                        else
                            for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                                if v.ToolTip == "Melee" then
                                    if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
                                        SelectWeapon = v.Name
                                    end
                                end
                            end
                        end
                    end
                )
            end
        end
    )

    local ToggleLevel = Tabs.Main:AddToggle("ToggleLevel", {Title = "Auto Level", Default = false})
    ToggleLevel:OnChanged(
        function(Value)
            _G.LevelFarm = Value
        end
    )
    Options.ToggleLevel:SetValue(false)

    spawn(
        function()
            while task.wait() do
                if _G.LevelFarm then
                    pcall(
                        function()
                            FindQuest()
                            if
                                not string.find(
                                    game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,
                                    NameMon
                                ) or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                             then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                                if BypassTP then
                                    if
                                        (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameQ.Position).Magnitude >
                                            2500
                                     then
                                        BTP(CFrameQ)
                                    elseif
                                        (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameQ.Position).Magnitude <
                                            2500
                                     then
                                        Tween(CFrameQ)
                                    end
                                else
                                    Tween(CFrameQ)
                                end
                                if
                                    (CFrameQ.Position -
                                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <=
                                            5
                                 then
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                        "StartQuest",
                                        NameQuest,
                                        QuestLv
                                    )
                                end
                            elseif
                                string.find(
                                    game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,
                                    NameMon
                                ) or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true
                             then
                                for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                    if
                                        v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and
                                            v.Humanoid.Health > 0
                                     then
                                        if v.Name == Ms then
                                            repeat
                                                wait(0)

                                                bringmob = true
                                                AutoHaki()
                                                EquipTool(SelectWeapon)
                                                Tween(v.HumanoidRootPart.CFrame * CFrame.new(posX, posY, posZ))
                                                v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                                v.HumanoidRootPart.Transparency = 1
                                                v.Humanoid.JumpPower = 0
                                                v.Humanoid.WalkSpeed = 0
                                                v.HumanoidRootPart.CanCollide = false
                                                FarmPos = v.HumanoidRootPart.CFrame
                                                MonFarm = v.Name
						AttackNoCoolDown()
                                            until not _G.LevelFarm or not v.Parent or v.Humanoid.Health <= 0 or
                                                not game:GetService("Workspace").Enemies:FindFirstChild(v.Name) or
                                                game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                            bringmob = false
                                        end
                                    end
                                end
                                for i, v in pairs(
                                    game:GetService("Workspace")["_WorldOrigin"].EnemySpawns:GetChildren()
                                ) do
                                    if string.find(v.Name, NameMon) then
                                        if
                                            (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Position).Magnitude >=
                                                10
                                         then
                                            Tween(v.CFrame * CFrame.new(15, 10, 2))
                                        end
                                    end
                                end
                            end
                        end
                    )
                end
            end
        end
    )

    local ToggleMobAura = Tabs.Main:AddToggle("ToggleMobAura", {Title = "Farm Near", Default = false})
    ToggleMobAura:OnChanged(
        function(Value)
            _G.AutoNear = Value
        end
    )
    Options.ToggleMobAura:SetValue(false)
    spawn(
        function()
            while wait(.1) do
                if _G.AutoNear then
                    pcall(
                        function()
                            for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
                                if
                                    v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and
                                        v.Humanoid.Health > 0
                                 then
                                    if v.Name then
                                        if
                                            (game.Players.LocalPlayer.Character.HumanoidRootPart.Position -
                                                v:FindFirstChild("HumanoidRootPart").Position).Magnitude <= 5000
                                         then
                                            repeat
                                                wait(0)

                                                bringmob = true
                                                AutoHaki()					
                                                EquipTool(SelectWeapon)
                                                Tween(v.HumanoidRootPart.CFrame * CFrame.new(posX, posY, posZ))
                                                v.HumanoidRootPart.Size = Vector3.new(1, 1, 1)
                                                v.HumanoidRootPart.Transparency = 1
                                                v.Humanoid.JumpPower = 0
                                                v.Humanoid.WalkSpeed = 0
                                                v.HumanoidRootPart.CanCollide = false
                                                FarmPos = v.HumanoidRootPart.CFrame
                                                MonFarm = v.Name
                                            until --Click
                                            not _G.AutoNear or not v.Parent or v.Humanoid.Health <= 0 or
                                                not game.Workspace.Enemies:FindFirstChild(v.Name)
                                            bringmob = false
                                        end
                                    end
                                end
                            end
                        end
                    )
                end
            end
        end
    )

    local ToggleCastleRaid = Tabs.Main:AddToggle("ToggleCastleRaid", {Title = "Auto Castle Raid", Default = false})
    ToggleCastleRaid:OnChanged(
        function(Value)
            _G.CastleRaid = Value
        end
    )
    Options.ToggleCastleRaid:SetValue(false)
    spawn(
        function()
            while wait() do
                if _G.CastleRaid then
                    pcall(
                        function()
                            local CFrameCastleRaid = CFrame.new(-5075.50927734375, 314.5155029296875, -3150.0224609375)
                            if
                                (CFrame.new(-5075.50927734375, 314.5155029296875, -3150.0224609375).Position -
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 500
                             then
                                for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                    if
                                        _G.CastleRaid and v:FindFirstChild("HumanoidRootPart") and
                                            v:FindFirstChild("Humanoid") and
                                            v.Humanoid.Health > 0
                                     then
                                        if
                                            (v.HumanoidRootPart.Position -
                                                game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <
                                                2000
                                         then
                                            repeat
                                                wait(0)

                                                bringmob = true
                                                AutoHaki()
                                                EquipTool(SelectWeapon)
                                                v.HumanoidRootPart.CanCollide = false
                                                v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                                Tween(v.HumanoidRootPart.CFrame * CFrame.new(posX, posY, posZ))
                                            until v.Humanoid.Health <= 0 or not v.Parent or not _G.CastleRaid
                                            bringmob = false
                                        end
                                    end
                                end
                            else
                                if BypassTP then
                                    if
                                        (game.Players.LocalPlayer.Character.HumanoidRootPart.Position -
                                            CFrameCastleRaid.Position).Magnitude > 2500
                                     then
                                        BTPZ(CFrameCastleRaid)
                                    elseif
                                        (game.Players.LocalPlayer.Character.HumanoidRootPart.Position -
                                            CFrameCastleRaid.Position).Magnitude < 2500
                                     then
                                        Tween2(CFrameCastleRaid)
                                    end
                                end
                            end
                        end
                    )
                end
            end
        end
    )

    local Mastery = Tabs.Main:AddSection("Mastery Farm")
    local DropdownMastery =
        Tabs.Main:AddDropdown(
        "DropdownMastery",
        {
            Title = "Mastery Mode",
            Values = {"Level", "Near Mobs"},
            Multi = false,
            Default = 1
        }
    )

    DropdownMastery:SetValue("Level")

    DropdownMastery:OnChanged(
        function(Value)
            TypeMastery = Value
        end
    )

    local ToggleMasteryFruit =
        Tabs.Main:AddToggle("ToggleMasteryFruit", {Title = "Auto BF Mastery [Not Work]", Default = false})
    ToggleMasteryFruit:OnChanged(
        function(Value)
            AutoFarmMasDevilFruit = Value
        end
    )
    Options.ToggleMasteryFruit:SetValue(false)

    local SliderHealt =
        Tabs.Main:AddSlider(
        "SliderHealt",
        {
            Title = "Health (%) Mob",
            Description = "",
            Default = 25,
            Min = 0,
            Max = 100,
            Rounding = 1,
            Callback = function(Value)
                KillPercent = Value
            end
        }
    )

    SliderHealt:OnChanged(
        function(Value)
            KillPercent = Value
        end
    )

    SliderHealt:SetValue(25)

    local Mastery = Tabs.Main:AddSection("Mastery Farm")
    local DropdownMastery =
        Tabs.Main:AddDropdown(
        "DropdownMastery",
        {
            Title = "Mastery Mode",
            Values = {"Level", "Near Mobs"},
            Multi = false,
            Default = 1
        }
    )

    DropdownMastery:SetValue("Level")

    DropdownMastery:OnChanged(
        function(Value)
            TypeMastery = Value
        end
    )

    local ToggleMasteryFruit = Tabs.Main:AddToggle("ToggleMasteryFruit", {Title = "Auto BF Mastery", Default = false})
    ToggleMasteryFruit:OnChanged(
        function(Value)
            AutoFarmMasDevilFruit = Value
        end
    )
    Options.ToggleMasteryFruit:SetValue(false)

    local SliderHealt =
        Tabs.Main:AddSlider(
        "SliderHealt",
        {
            Title = "Health (%) Mob",
            Description = "",
            Default = 25,
            Min = 0,
            Max = 100,
            Rounding = 1,
            Callback = function(Value)
                KillPercent = Value
            end
        }
    )

    SliderHealt:OnChanged(
        function(Value)
            KillPercent = Value
        end
    )

    SliderHealt:SetValue(25)

    spawn(
        function()
            while task.wait(1) do
                if _G.UseSkill then
                    pcall(
                        function()
                            if _G.UseSkill then
                                for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                    if
                                        v.Name == MonFarm and v:FindFirstChild("Humanoid") and
                                            v:FindFirstChild("HumanoidRootPart") and
                                            v.Humanoid.Health <= v.Humanoid.MaxHealth * KillPercent / 100
                                     then
                                        repeat
                                            game:GetService("RunService").Heartbeat:wait()
                                            EquipTool(game.Players.LocalPlayer.Data.DevilFruit.Value)
                                            Tween(v.HumanoidRootPart.CFrame * CFrame.new(posX, posY, posZ))
                                            PositionSkillMasteryDevilFruit = v.HumanoidRootPart.Position
                                            if
                                                game:GetService("Players").LocalPlayer.Character:FindFirstChild(
                                                    game.Players.LocalPlayer.Data.DevilFruit.Value
                                                )
                                             then
                                                game:GetService("Players").LocalPlayer.Character:FindFirstChild(
                                                        game.Players.LocalPlayer.Data.DevilFruit.Value
                                                    ).MousePos.Value = PositionSkillMasteryDevilFruit
                                                local DevilFruitMastery =
                                                    game:GetService("Players").LocalPlayer.Character:FindFirstChild(
                                                    game.Players.LocalPlayer.Data.DevilFruit.Value
                                                ).Level.Value
                                                if SkillZ and DevilFruitMastery >= 1 then
                                                    game:service("VirtualInputManager"):SendKeyEvent(
                                                        true,
                                                        "Z",
                                                        false,
                                                        game
                                                    )
                                                    wait(0.1)
                                                    game:service("VirtualInputManager"):SendKeyEvent(
                                                        false,
                                                        "Z",
                                                        false,
                                                        game
                                                    )
                                                end
                                                if SkillX and DevilFruitMastery >= 2 then
                                                    game:service("VirtualInputManager"):SendKeyEvent(
                                                        true,
                                                        "X",
                                                        false,
                                                        game
                                                    )
                                                    wait(0.2)
                                                    game:service("VirtualInputManager"):SendKeyEvent(
                                                        false,
                                                        "X",
                                                        false,
                                                        game
                                                    )
                                                end
                                                if SkillC and DevilFruitMastery >= 3 then
                                                    game:service("VirtualInputManager"):SendKeyEvent(
                                                        true,
                                                        "C",
                                                        false,
                                                        game
                                                    )
                                                    wait(0.3)
                                                    game:service("VirtualInputManager"):SendKeyEvent(
                                                        false,
                                                        "C",
                                                        false,
                                                        game
                                                    )
                                                end
                                                if SkillV and DevilFruitMastery >= 4 then
                                                    game:service("VirtualInputManager"):SendKeyEvent(
                                                        true,
                                                        "V",
                                                        false,
                                                        game
                                                    )
                                                    wait(0.4)
                                                    game:service("VirtualInputManager"):SendKeyEvent(
                                                        false,
                                                        "V",
                                                        false,
                                                        game
                                                    )
                                                end
                                                if SkillF and DevilFruitMastery >= 5 then
                                                    game:GetService("VirtualInputManager"):SendKeyEvent(
                                                        true,
                                                        "F",
                                                        false,
                                                        game
                                                    )
                                                    wait(0.5)
                                                    game:GetService("VirtualInputManager"):SendKeyEvent(
                                                        false,
                                                        "F",
                                                        false,
                                                        game
                                                    )
                                                end
                                            end
                                        until not AutoFarmMasDevilFruit or not _G.UseSkill or v.Humanoid.Health == 0
                                    end
                                end
                            end
                        end
                    )
                end
            end
        end
    )
    spawn(
        function()
            while task.wait(.1) do
                if AutoFarmMasDevilFruit and TypeMastery == "Level" then
                    ---------Near Mas
                    pcall(
                        function()
                            CheckLevel(SelectMonster)
                            if
                                not string.find(
                                    game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,
                                    NameMon
                                ) or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                             then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                                if BypassTP then
                                    if
                                        (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameQ.Position).Magnitude >
                                            2500
                                     then
                                        BTP(CFrameQ)
                                        wait(0.2)
                                    elseif
                                        (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameQ.Position).Magnitude <
                                            2500
                                     then
                                        Tween(CFrameQ)
                                    end
                                else
                                    Tween(CFrameQ)
                                end
                                if
                                    (CFrameQ.Position -
                                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <=
                                        5
                                 then
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                        "StartQuest",
                                        NameQuest,
                                        QuestLv
                                    )
                                end
                            elseif
                                string.find(
                                    game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,
                                    NameMon
                                ) or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true
                             then
                                for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                    if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
                                        if v.Name == Ms then
                                            repeat
                                                game:GetService("RunService").Heartbeat:wait()
                                                if v.Humanoid.Health <= v.Humanoid.MaxHealth * KillPercent / 100 then
                                                    _G.UseSkill = true
                                                else
                                                    _G.UseSkill = false
                                                    AutoHaki()
                                                    bringmob = true
                                                    EquipTool(SelectWeapon)
                                                    Tween(v.HumanoidRootPart.CFrame * CFrame.new(posX, posY, posZ))
                                                    v.HumanoidRootPart.Size = Vector3.new(1, 1, 1)
                                                    v.HumanoidRootPart.Transparency = 1
                                                    v.Humanoid.JumpPower = 0
                                                    v.Humanoid.WalkSpeed = 0
                                                    v.HumanoidRootPart.CanCollide = false
                                                    FarmPos = v.HumanoidRootPart.CFrame
                                                    MonFarm = v.Name

                                                    NormalAttack()
                                                end
                                            until not AutoFarmMasDevilFruit or not v.Parent or v.Humanoid.Health == 0 or
                                                game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible ==
                                                    false or
                                                not game:GetService("Workspace").Enemies:FindFirstChild(v.Name) or
                                                not TypeMastery == "Level"
                                            bringmob = false
                                            _G.UseSkill = false
                                            _G.FastAttack = true
                                        end
                                    end
                                end
                            end
                        end
                    )
                elseif AutoFarmMasDevilFruit and TypeMastery == "Near Mobs" then
                    pcall(
                        function()
                            for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
                                if v.Name and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
                                    if
                                        (game.Players.LocalPlayer.Character.HumanoidRootPart.Position -
                                            v:FindFirstChild("HumanoidRootPart").Position).Magnitude <= 5000
                                     then
                                        repeat
                                            game:GetService("RunService").Heartbeat:wait()
                                            if v.Humanoid.Health <= v.Humanoid.MaxHealth * KillPercent / 100 then
                                                _G.UseSkill = true
                                            else
                                                _G.UseSkill = false
                                                AutoHaki()
                                                bringmob = true
                                                EquipTool(SelectWeapon)
                                                Tween(v.HumanoidRootPart.CFrame * CFrame.new(posX, posY, posZ))
                                                v.HumanoidRootPart.Size = Vector3.new(1, 1, 1)
                                                v.HumanoidRootPart.Transparency = 1
                                                v.Humanoid.JumpPower = 0
                                                v.Humanoid.WalkSpeed = 0
                                                v.HumanoidRootPart.CanCollide = false
                                                --v.Humanoid:ChangeState(11)
                                                --v.Humanoid:ChangeState(14)
                                                FarmPos = v.HumanoidRootPart.CFrame
                                                MonFarm = v.Name

                                                NormalAttack(0,5)
                                                FastAttack(0,05)
                                                SuperFastAttack(0,03)
                                                MaruFastAttack(0,001)
                                            end
                                        until not AutoFarmMasDevilFruit or not MasteryType == "Near Mobs" or
                                            not v.Parent or
                                            v.Humanoid.Health == 0 or
                                            not TypeMastery == "Near Mobs"
                                        bringmob = false
                                        _G.UseSkill = false
                                        _G.FastAttack = true
                                    end
                                end
                            end
                        end
                    )
                end
            end
        end
    )

    if Second_Sea then
        local ToggleVatChatKiDi = Tabs.Main:AddToggle("ToggleVatChatKiDi", {Title = "Auto Ectoplasm", Default = false})
        ToggleVatChatKiDi:OnChanged(
            function(Value)
                _G.Ectoplasm = Value
            end
        )
        Options.ToggleVatChatKiDi:SetValue(false)

        spawn(
            function()
                while wait(0.1) do
                    pcall(
                        function()
                            if _G.Ectoplasm then
                                if
                                    game:GetService("Workspace").Enemies:FindFirstChild("Ship Deckhand") or
                                        game:GetService("Workspace").Enemies:FindFirstChild("Ship Engineer") or
                                        game:GetService("Workspace").Enemies:FindFirstChild("Ship Steward") or
                                        game:GetService("Workspace").Enemies:FindFirstChild("Ship Officer")
                                 then
                                    for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                        if
                                            v.Name == "Ship Steward" or v.Name == "Ship Engineer" or
                                                v.Name == "Ship Deckhand" or
                                                v.Name == "Ship Officer" and v:FindFirstChild("Humanoid")
                                         then
                                            if v.Humanoid.Health > 0 then
                                                repeat
                                                    wait(0)

                                                    AutoHaki()
                                                    bringmob = true
                                                    EquipTool(SelectWeapon)
                                                    Tween(v.HumanoidRootPart.CFrame * CFrame.new(posX, posY, posZ))
                                                    v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                                    v.HumanoidRootPart.Transparency = 1
                                                    v.Humanoid.JumpPower = 0
                                                    v.Humanoid.WalkSpeed = 0
                                                    v.HumanoidRootPart.CanCollide = false
                                                    FarmPos = v.HumanoidRootPart.CFrame
                                                    MonFarm = v.Name
                                                until --Click

                                                _G.Ectoplasm == false or not v.Parent or v.Humanoid.Health == 0 or
                                                    not game:GetService("Workspace").Enemies:FindFirstChild(v.Name)
                                                bringmob = false
                                            end
                                        end
                                    end
                                else
                                    local Distance =
                                        (Vector3.new(904.4072265625, 181.05767822266, 33341.38671875) -
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                                    if Distance > 20000 then
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                            "requestEntrance",
                                            Vector3.new(923.21252441406, 126.9760055542, 32852.83203125)
                                        )
                                    end
                                    Tween2(CFrame.new(904.4072265625, 181.05767822266, 33341.38671875))
                                end
                            end
                        end
                    )
                end
            end
        )
    end

    local boss = Tabs.Main:AddSection("Boss Farm")

    if First_Sea then
        tableBoss = {
            "Raid Boss First Sea |",
            "The Gorilla King",
            "Bobby",
            "Yeti",
            "Mob Leader",
            "Vice Admiral",
            "Warden",
            "Chief Warden",
            "Swan",
            "Magma Admiral",
            "Fishman Lord",
            "Wysper",
            "Thunder God",
            "Cyborg",
            "Saber Expert"
        }
    elseif Second_Sea then
        tableBoss = {
            "Raid Boss Second Sea |",
            "Diamond",
            "Jeremy",
            "Fajita",
            "Don Swan",
            "Smoke Admiral",
            "Cursed Captain",
            "Darkbeard",
            "Order",
            "Awakened Ice Admiral",
            "Tide Keeper"
        }
    elseif Third_Sea then
        tableBoss = {
            "Raid Boss Third Sea |",
            "Stone",
            "Island Empress",
            "Kilo Admiral",
            "Captain Elephant",
            "Beautiful Pirate",
            "rip_indra True Form",
            "Longma",
            "Soul Reaper",
            "Cake Queen"
        }
    end

    local DropdownBoss =
        Tabs.Main:AddDropdown(
        "DropdownBoss",
        {
            Title = "Boss:",
            Values = tableBoss,
            Multi = false,
            Default = 1
        }
    )

    DropdownBoss:SetValue("")
    DropdownBoss:OnChanged(
        function(Value)
            _G.SelectBoss = Value
        end
    )

    local ToggleAutoFarmBoss = Tabs.Main:AddToggle("ToggleAutoFarmBoss", {Title = "Kill Boss", Default = false})

    ToggleAutoFarmBoss:OnChanged(
        function(Value)
            _G.AutoBoss = Value
        end
    )

    Options.ToggleAutoFarmBoss:SetValue(false)
    spawn(
        function()
            while wait() do
                if _G.AutoBoss and BypassTP then
                    pcall(
                        function()
                            if game:GetService("Workspace").Enemies:FindFirstChild(_G.SelectBoss) then
                                for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                    if v.Name == _G.SelectBoss then
                                        if
                                            v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and
                                                v.Humanoid.Health > 0
                                         then
                                            repeat
                                                wait(0)

                                                AutoHaki()
                                                bringmob = true
                                                EquipTool(SelectWeapon)
                                                v.HumanoidRootPart.CanCollide = false
                                                v.Humanoid.WalkSpeed = 0
                                                v.HumanoidRootPart.Size = Vector3.new(80, 80, 80)
                                                Tween(v.HumanoidRootPart.CFrame * Pos)
                                                sethiddenproperty(
                                                    game:GetService("Players").LocalPlayer,
                                                    "SimulationRadius",
                                                    math.huge
                                                )
                                            until not _G.AutoBoss or not v.Parent or v.Humanoid.Health <= 0
                                            bringmob = false
                                        end
                                    end
                                end
                            elseif game.ReplicatedStorage:FindFirstChild(_G.SelectBoss) then
                                if
                                    ((game.ReplicatedStorage:FindFirstChild(_G.SelectBoss).HumanoidRootPart.CFrame).Position -
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 1500
                                 then
                                    Tween(game.ReplicatedStorage:FindFirstChild(_G.SelectBoss).HumanoidRootPart.CFrame)
                                else
                                    BTP(game.ReplicatedStorage:FindFirstChild(_G.SelectBoss).HumanoidRootPart.CFrame)
                                end
                            end
                        end
                    )
                end
            end
        end
    )

    spawn(
        function()
            while wait() do
                if _G.AutoBoss and not BypassTP then
                    pcall(
                        function()
                            if game:GetService("Workspace").Enemies:FindFirstChild(_G.SelectBoss) then
                                for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                    if v.Name == _G.SelectBoss then
                                        if
                                            v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and
                                                v.Humanoid.Health > 0
                                         then
                                            repeat
                                                wait(0)

                                                AutoHaki()
                                                bringmob = true
                                                EquipTool(SelectWeapon)
                                                v.HumanoidRootPart.CanCollide = false
                                                v.Humanoid.WalkSpeed = 0
                                                v.HumanoidRootPart.Size = Vector3.new(80, 80, 80)
                                                Tween(v.HumanoidRootPart.CFrame * Pos)
                                                sethiddenproperty(
                                                    game:GetService("Players").LocalPlayer,
                                                    "SimulationRadius",
                                                    math.huge
                                                )
                                            until not _G.AutoBoss or not v.Parent or v.Humanoid.Health <= 0
                                            bringmob = false
                                        end
                                    end
                                end
                            else
                                if game:GetService("ReplicatedStorage"):FindFirstChild(_G.SelectBoss) then
                                    Tween(
                                        game:GetService("ReplicatedStorage"):FindFirstChild(_G.SelectBoss).HumanoidRootPart.CFrame *
                                            CFrame.new(5, 10, 7)
                                    )
                                end
                            end
                        end
                    )
                end
            end
        end
    )

    local Material = Tabs.Main:AddSection("Material Farm")

    if First_Sea then
        MaterialList = {
            "Scrap Metal",
            "Leather",
            "Angel Wings",
            "Magma Ore",
            "Fish Tail"
        }
    elseif Second_Sea then
        MaterialList = {
            "Scrap Metal",
            "Leather",
            "Radioactive Material",
            "Mystic Droplet",
            "Magma Ore",
            "Vampire Fang"
        }
    elseif Third_Sea then
        MaterialList = {
            "Scrap Metal",
            "Leather",
            "Demonic Wisp",
            "Conjured Cocoa",
            "Dragon Scale",
            "Gunpowder",
            "Fish Tail",
            "Mini Tusk"
        }
    end

    local DropdownMaterial =
        Tabs.Main:AddDropdown(
        "DropdownMaterial",
        {
            Title = "Choose Material",
            Values = MaterialList,
            Multi = false,
            Default = 1
        }
    )

    DropdownMaterial:SetValue("Conjured Cocoa")

    DropdownMaterial:OnChanged(
        function(Value)
            SelectMaterial = Value
        end
    )

    local ToggleMaterial = Tabs.Main:AddToggle("ToggleMaterial", {Title = "Auto Material", Default = false})

    ToggleMaterial:OnChanged(
        function(Value)
            _G.AutoMaterial = Value
        end
    )
    Options.ToggleMaterial:SetValue(false)
    spawn(
        function()
            while task.wait() do
                if _G.AutoMaterial then
                    pcall(
                        function()
                            MaterialMon(SelectMaterial)

                            if BypassTP then
                                if
                                    (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - MPos.Position).Magnitude >
                                        3500
                                 then
                                    BTP(MPos)
                                elseif
                                    (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - MPos.Position).Magnitude <
                                        3500
                                 then
                                    Tween(MPos)
                                end
                            else
                                Tween(MPos)
                            end
                            if game:GetService("Workspace").Enemies:FindFirstChild(MMon) then
                                for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
                                    if
                                        v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and
                                            v.Humanoid.Health > 0
                                     then
                                        if v.Name == MMon then
                                            repeat
                                                wait(0)

                                                AutoHaki()
                                                bringmob = true
                                                EquipTool(SelectWeapon)
                                                Tween(v.HumanoidRootPart.CFrame * CFrame.new(posX, posY, posZ))
                                                v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                                v.HumanoidRootPart.Transparency = 1
                                                v.Humanoid.JumpPower = 0
                                                v.Humanoid.WalkSpeed = 0
                                                v.HumanoidRootPart.CanCollide = false
                                                FarmPos = v.HumanoidRootPart.CFrame
                                                MonFarm = v.Name
                                            until --Click
                                            not _G.AutoMaterial or not v.Parent or v.Humanoid.Health <= 0
                                            bringmob = false
                                        end
                                    end
                                end
                            else
                                for i, v in pairs(
                                    game:GetService("Workspace")["_WorldOrigin"].EnemySpawns:GetChildren()
                                ) do
                                    if string.find(v.Name, Mon) then
                                        if
                                            (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Position).Magnitude >=
                                                10
                                         then
                                            Tween(v.CFrame * CFrame.new(posX, posY, posZ))
                                        end
                                    end
                                end
                            end
                        end
                    )
                end
            end
        end
    )
    ---------------------------Tab Sea---------------------------------------

    if Second_Sea or Third_Sea then
        local RoughSea = Tabs.Fish:AddSection("Kitsune")

        local ToggleEspKitsune =
            Tabs.Fish:AddToggle("ToggleEspKitsune", {Title = "Esp Kitsune Island", Default = false})
        ToggleEspKitsune:OnChanged(
            function(Value)
                KitsuneEsp = Value
                while IslandESP do
                    wait()
                    UpdateKitsune()
                end
            end
        )
        Options.ToggleEspKitsune:SetValue(false)

        function UpdateKitsune()
            for i, v in pairs(game:GetService("Workspace").Map.KitsuneIsalnd.ShrineActive:GetChildren()) do
                pcall(
                    function()
                        if KitsuneEsp then
                            if v.Name ~= "NeonShrinePart" then
                                if not v:FindFirstChild("IslandESP") then
                                    local bill = Instance.new("BillboardGui", v)
                                    bill.Name = "IslandESP"
                                    bill.ExtentsOffset = Vector3.new(0, 1, 0)
                                    bill.Size = UDim2.new(1, 200, 1, 30)
                                    bill.Adornee = v
                                    bill.AlwaysOnTop = true
                                    local name = Instance.new("TextLabel", bill)
                                    name.Font = "Code"
                                    name.FontSize = "Size14"
                                    name.TextWrapped = true
                                    name.Size = UDim2.new(1, 0, 1, 0)
                                    name.TextYAlignment = "Top"
                                    name.BackgroundTransparency = 1
                                    name.TextStrokeTransparency = 0.5
                                    name.TextColor3 = Color3.fromRGB(80, 245, 245)
                                    name.Text = "Kitsune Island"
                                else
                                    v["IslandESP"].TextLabel.Text = "Kitsune Island"
                                end
                            end
                        else
                            if v:FindFirstChild("IslandESP") then
                                v:FindFirstChild("IslandESP"):Destroy()
                            end
                        end
                    end
                )
            end
        end

        local ToggleTPKitsune =
            Tabs.Fish:AddToggle("ToggleTPKitsune", {Title = "Tween To Kitsune Island", Default = false})
        ToggleTPKitsune:OnChanged(
            function(Value)
                _G.TweenToKitsune = Value
            end
        )
        Options.ToggleTPKitsune:SetValue(false)
        spawn(
            function()
                local kitsuneIsland
                while not kitsuneIsland do
                    kitsuneIsland = game:GetService("Workspace").Map:FindFirstChild("KitsuneIsland")
                    wait(1)
                end
                while wait() do
                    if _G.TweenToKitsune then
                        local shrineActive = kitsuneIsland:FindFirstChild("ShrineActive")
                        if shrineActive then
                            for _, v in pairs(shrineActive:GetDescendants()) do
                                if v:IsA("BasePart") and v.Name:find("NeonShrinePart") then
                                    Tween(v.CFrame)
                                end
                            end
                        end
                    end
                end
            end
        )

        local ToggleCollectAzure =
            Tabs.Fish:AddToggle("ToggleCollectAzure", {Title = "Collect Azure Ambers", Default = false})
        ToggleCollectAzure:OnChanged(
            function(Value)
                _G.CollectAzure = Value
            end
        )
        Options.ToggleCollectAzure:SetValue(false)
        spawn(
            function()
                while wait() do
                    if _G.CollectAzure then
                        pcall(
                            function()
                                if game:GetService("Workspace"):FindFirstChild("AttachedAzureEmber") then
                                    Tween(
                                        game:GetService("Workspace"):WaitForChild("EmberTemplate"):FindFirstChild(
                                            "Part"
                                        ).CFrame
                                    )
                                    print("Azure")
                                end
                            end
                        )
                    end
                end
            end
        )
    end

    if Second_Sea or Third_Sea then
        local RoughSea = Tabs.Fish:AddSection("Rough Sea")

        local ToggleSailBoat = Tabs.Fish:AddToggle("ToggleSailBoat", {Title = "Auto Buy Ship", Default = false})
        ToggleSailBoat:OnChanged(
            function(Value)
                _G.SailBoat = Value
            end
        )
        Options.ToggleSailBoat:SetValue(false)

        spawn(
            function()
                while wait() do
                    pcall(
                        function()
                            if _G.SailBoat then
                                if
                                    not game:GetService("Workspace").Enemies:FindFirstChild("Shark") or
                                        not game:GetService("Workspace").Enemies:FindFirstChild("Terrorshark") or
                                        not game:GetService("Workspace").Enemies:FindFirstChild("Piranha") or
                                        not game:GetService("Workspace").Enemies:FindFirstChild("Fish Crew Member")
                                 then
                                    if not game:GetService("Workspace").Boats:FindFirstChild("PirateGrandBrigade") then
                                        buyb =
                                            TweenBoat(CFrame.new(-16927.451171875, 9.0863618850708, 433.8642883300781))
                                        if
                                            (CFrame.new(-16927.451171875, 9.0863618850708, 433.8642883300781).Position -
                                                game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <=
                                                10
                                         then
                                            if buyb then
                                                buyb:Stop()
                                            end
                                            local args = {
                                                [1] = "BuyBoat",
                                                [2] = "PirateGrandBrigade"
                                            }

                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                                unpack(args)
                                            )
                                        end
                                    elseif game:GetService("Workspace").Boats:FindFirstChild("PirateGrandBrigade") then
                                        if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit == false then
                                            TweenBoat(
                                                game:GetService("Workspace").Boats.PirateGrandBrigade.VehicleSeat.CFrame *
                                                    CFrame.new(0, 1, 0)
                                            )
                                        else
                                            for i, v in pairs(game:GetService("Workspace").Boats:GetChildren()) do
                                                if v.Name == "PirateGrandBrigade" then
                                                    repeat
                                                        wait()
                                                        if
                                                            (CFrame.new(
                                                                -17013.80078125,
                                                                10.962434768676758,
                                                                438.0169982910156
                                                            ).Position -
                                                                game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <=
                                                                10
                                                         then
                                                            TweenShip(
                                                                CFrame.new(
                                                                    -33163.1875,
                                                                    10.964323997497559,
                                                                    -324.4842224121094
                                                                )
                                                            )
                                                        elseif
                                                            (CFrame.new(
                                                                -33163.1875,
                                                                10.964323997497559,
                                                                -324.4842224121094
                                                            ).Position -
                                                                game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <=
                                                                10
                                                         then
                                                            TweenShip(
                                                                CFrame.new(
                                                                    -37952.49609375,
                                                                    10.96342945098877,
                                                                    -1324.12109375
                                                                )
                                                            )
                                                        elseif
                                                            (CFrame.new(
                                                                -37952.49609375,
                                                                10.96342945098877,
                                                                -1324.12109375
                                                            ).Position -
                                                                game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <=
                                                                10
                                                         then
                                                            TweenShip(
                                                                CFrame.new(
                                                                    -33163.1875,
                                                                    10.964323997497559,
                                                                    -324.4842224121094
                                                                )
                                                            )
                                                        end
                                                    until game:GetService("Workspace").Enemies:FindFirstChild("Shark") or
                                                        game:GetService("Workspace").Enemies:FindFirstChild(
                                                            "Terrorshark"
                                                        ) or
                                                        game:GetService("Workspace").Enemies:FindFirstChild("Piranha") or
                                                        game:GetService("Workspace").Enemies:FindFirstChild(
                                                            "Fish Crew Member"
                                                        ) or
                                                        _G.SailBoat == false
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    )
                end
            end
        )

        spawn(
            function()
                pcall(
                    function()
                        while wait() do
                            if _G.SailBoat then
                                if
                                    game:GetService("Workspace").Enemies:FindFirstChild("Shark") or
                                        game:GetService("Workspace").Enemies:FindFirstChild("Terrorshark") or
                                        game:GetService("Workspace").Enemies:FindFirstChild("Piranha") or
                                        game:GetService("Workspace").Enemies:FindFirstChild("Fish Crew Member")
                                 then
                                    game.Players.LocalPlayer.Character.Humanoid.Sit = false
                                end
                            end
                        end
                    end
                )
            end
        )

        local ToggleTerrorshark =
            Tabs.Fish:AddToggle("ToggleTerrorshark", {Title = " Kill Terrorshark", Default = false})

        ToggleTerrorshark:OnChanged(
            function(Value)
                _G.AutoTerrorshark = Value
            end
        )
        Options.ToggleTerrorshark:SetValue(false)
        spawn(
            function()
                while wait() do
                    if _G.AutoTerrorshark then
                        pcall(
                            function()
                                if game:GetService("Workspace").Enemies:FindFirstChild("Terrorshark") then
                                    for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                        if v.Name == "Terrorshark" then
                                            if
                                                v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and
                                                    v.Humanoid.Health > 0
                                             then
                                                repeat
                                                    wait(0)

                                                    AutoHaki()
                                                    EquipTool(SelectWeapon)
                                                    v.HumanoidRootPart.CanCollide = false
                                                    v.Humanoid.WalkSpeed = 0
                                                    v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                                    Tween(v.HumanoidRootPart.CFrame * CFrame.new(posX, posY, posZ))
                                                until not _G.AutoTerrorshark or not v.Parent or v.Humanoid.Health <= 0
                                            end
                                        end
                                    end
                                else
                                    if game:GetService("ReplicatedStorage"):FindFirstChild("Terrorshark") then
                                        Tween(
                                            game:GetService("ReplicatedStorage"):FindFirstChild("Terrorshark").HumanoidRootPart.CFrame *
                                                CFrame.new(2, 20, 2)
                                        )
                                    else
                                    end
                                end
                            end
                        )
                    end
                end
            end
        )

        local TogglePiranha = Tabs.Fish:AddToggle("TogglePiranha", {Title = " Kill Piranha", Default = false})

        TogglePiranha:OnChanged(
            function(Value)
                _G.farmpiranya = Value
            end
        )
        Options.TogglePiranha:SetValue(false)

        spawn(
            function()
                while wait() do
                    if _G.farmpiranya then
                        pcall(
                            function()
                                if game:GetService("Workspace").Enemies:FindFirstChild("Piranha") then
                                    for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                        if v.Name == "Piranha" then
                                            if
                                                v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and
                                                    v.Humanoid.Health > 0
                                             then
                                                repeat
                                                    wait(0)

                                                    AutoHaki()
                                                    EquipTool(SelectWeapon)
                                                    v.HumanoidRootPart.CanCollide = false
                                                    v.Humanoid.WalkSpeed = 0
                                                    v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                                    Tween(v.HumanoidRootPart.CFrame * CFrame.new(posX, posY, posZ))
                                                until not _G.farmpiranya or not v.Parent or v.Humanoid.Health <= 0
                                            end
                                        end
                                    end
                                else
                                    if game:GetService("ReplicatedStorage"):FindFirstChild("Piranha") then
                                        Tween(
                                            game:GetService("ReplicatedStorage"):FindFirstChild("Piranha").HumanoidRootPart.CFrame *
                                                CFrame.new(2, 20, 2)
                                        )
                                    else
                                    end
                                end
                            end
                        )
                    end
                end
            end
        )

        local ToggleShark = Tabs.Fish:AddToggle("ToggleShark", {Title = " Kill Shark", Default = false})
        ToggleShark:OnChanged(
            function(Value)
                _G.AutoShark = Value
            end
        )
        Options.ToggleShark:SetValue(false)
        spawn(
            function()
                while wait() do
                    if _G.AutoShark then
                        pcall(
                            function()
                                if game:GetService("Workspace").Enemies:FindFirstChild("Shark") then
                                    for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                        if v.Name == "Shark" then
                                            if
                                                v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and
                                                    v.Humanoid.Health > 0
                                             then
                                                repeat
                                                    wait(0)

                                                    AutoHaki()
                                                    EquipTool(SelectWeapon)
                                                    v.HumanoidRootPart.CanCollide = false
                                                    v.Humanoid.WalkSpeed = 0
                                                    v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                                    Tween(v.HumanoidRootPart.CFrame * CFrame.new(posX, posY, posZ))
                                                    game.Players.LocalPlayer.Character.Humanoid.Sit = false
                                                until not _G.AutoShark or not v.Parent or v.Humanoid.Health <= 0
                                            end
                                        end
                                    end
                                else
                                    Tween(
                                        game:GetService("Workspace").Boats.PirateGrandBrigade.VehicleSeat.CFrame *
                                            CFrame.new(0, 1, 0)
                                    )
                                    if game:GetService("ReplicatedStorage"):FindFirstChild("Terrorshark") then
                                        Tween(
                                            game:GetService("ReplicatedStorage"):FindFirstChild("Terrorshark").HumanoidRootPart.CFrame *
                                                CFrame.new(2, 20, 2)
                                        )
                                    else
                                    end
                                end
                            end
                        )
                    end
                end
            end
        )

        local ToggleFishCrew = Tabs.Fish:AddToggle("ToggleFishCrew", {Title = " Kill Fish Crew", Default = false})
        ToggleFishCrew:OnChanged(
            function(Value)
                _G.AutoFishCrew = Value
            end
        )
        Options.ToggleFishCrew:SetValue(false)

        spawn(
            function()
                while wait() do
                    if _G.AutoFishCrew then
                        pcall(
                            function()
                                if game:GetService("Workspace").Enemies:FindFirstChild("Fish Crew Member") then
                                    for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                        if v.Name == "Fish Crew Member" then
                                            if
                                                v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and
                                                    v.Humanoid.Health > 0
                                             then
                                                repeat
                                                    wait(0)

                                                    AutoHaki()
                                                    EquipTool(SelectWeapon)
                                                    v.HumanoidRootPart.CanCollide = false
                                                    v.Humanoid.WalkSpeed = 0
                                                    v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                                    Tween(v.HumanoidRootPart.CFrame * CFrame.new(posX, posY, posZ))

                                                    game.Players.LocalPlayer.Character.Humanoid.Sit = false
                                                until not _G.AutoFishCrew or not v.Parent or v.Humanoid.Health <= 0
                                            end
                                        end
                                    end
                                else
                                    Tween(
                                        game:GetService("Workspace").Boats.PirateGrandBrigade.VehicleSeat.CFrame *
                                            CFrame.new(0, 1, 0)
                                    )
                                    if game:GetService("ReplicatedStorage"):FindFirstChild("Fish Crew Member") then
                                        Tween(
                                            game:GetService("ReplicatedStorage"):FindFirstChild("Fish Crew Member").HumanoidRootPart.CFrame *
                                                CFrame.new(2, 20, 2)
                                        )
                                    else
                                    end
                                end
                            end
                        )
                    end
                end
            end
        )

        local ToggleShip = Tabs.Fish:AddToggle("ToggleShip", {Title = "Kill Ship", Default = false})
        ToggleShip:OnChanged(
            function(Value)
                _G.Ship = Value
            end
        )
        Options.ToggleShip:SetValue(false)
        function CheckPirateBoat()
            local checkmmpb = {"PirateGrandBrigade", "PirateBrigade"}
            for r, v in next, game:GetService("Workspace").Enemies:GetChildren() do
                if table.find(checkmmpb, v.Name) and v:FindFirstChild("Health") and v.Health.Value > 0 then
                    return v
                end
            end
        end

        spawn(
            function()
                while wait() do
                    if _G.Ship then
                        pcall(
                            function()
                                if CheckPirateBoat() then
                                    game:GetService("VirtualInputManager"):SendKeyEvent(true, 32, false, game)
                                    wait(.5)
                                    game:GetService("VirtualInputManager"):SendKeyEvent(false, 32, false, game)
                                    local v = CheckPirateBoat()
                                    repeat
                                        wait()
                                        spawn(Tween(v.Engine.CFrame * CFrame.new(0, -20, 0)), 1)
                                        AimBotSkillPosition =
                                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame *
                                            CFrame.new(0, -5, 0)
                                        Skillaimbot = true
                                        AutoSkill = false
                                    until not v or not v.Parent or v.Health.Value <= 0 or not CheckPirateBoat()
                                    Skillaimbot = true
                                    AutoSkill = false
                                end
                            end
                        )
                    end
                end
            end
        )

        local ToggleGhostShip = Tabs.Fish:AddToggle("ToggleGhostShip", {Title = "Kill Ghost Ship", Default = false})
        ToggleGhostShip:OnChanged(
            function(Value)
                _G.GhostShip = Value
            end
        )
        Options.ToggleGhostShip:SetValue(false)

        function CheckPirateBoat()
            local checkmmpb = {"FishBoat"}
            for r, v in next, game:GetService("Workspace").Enemies:GetChildren() do
                if table.find(checkmmpb, v.Name) and v:FindFirstChild("Health") and v.Health.Value > 0 then
                    return v
                end
            end
        end
        spawn(
            function()
                while wait() do
                    pcall(
                        function()
                            if _G.bjirFishBoat then
                                if CheckPirateBoat() then
                                    game:GetService("VirtualInputManager"):SendKeyEvent(true, 32, false, game)
                                    wait(0.5)
                                    game:GetService("VirtualInputManager"):SendKeyEvent(false, 32, false, game)
                                    local v = CheckPirateBoat()
                                    repeat
                                        wait()
                                        spawn(Tween(v.Engine.CFrame * CFrame.new(0, -20, 0), 1))
                                        AutoSkill = true
                                        Skillaimbot = true
                                        AimBotSkillPosition =
                                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame *
                                            CFrame.new(0, -5, 0)
                                    until v.Parent or v.Health.Value <= 0 or not CheckPirateBoat()
                                    AutoSkill = false
                                    Skillaimbot = false
                                end
                            end
                        end
                    )
                end
            end
        )

        spawn(
            function()
                while wait() do
                    if _G.bjirFishBoat then
                        pcall(
                            function()
                                if CheckPirateBoat() then
                                    AutoHaki()
                                    game:GetService("VirtualUser"):CaptureController()
                                    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                    for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                                        if v:IsA("Tool") then
                                            if v.ToolTip == "Melee" then -- "Blox Fruit" , "Sword" , "Wear" , "Agility"
                                                game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
                                            end
                                        end
                                    end
                                    game:GetService("VirtualInputManager"):SendKeyEvent(
                                        true,
                                        122,
                                        false,
                                        game.Players.LocalPlayer.Character.HumanoidRootPart
                                    )
                                    game:GetService("VirtualInputManager"):SendKeyEvent(
                                        false,
                                        122,
                                        false,
                                        game.Players.LocalPlayer.Character.HumanoidRootPart
                                    )
                                    wait(.2)
                                    game:GetService("VirtualInputManager"):SendKeyEvent(
                                        true,
                                        120,
                                        false,
                                        game.Players.LocalPlayer.Character.HumanoidRootPart
                                    )
                                    game:GetService("VirtualInputManager"):SendKeyEvent(
                                        false,
                                        120,
                                        false,
                                        game.Players.LocalPlayer.Character.HumanoidRootPart
                                    )
                                    wait(.2)
                                    game:GetService("VirtualInputManager"):SendKeyEvent(
                                        true,
                                        99,
                                        false,
                                        game.Players.LocalPlayer.Character.HumanoidRootPart
                                    )
                                    game:GetService("VirtualInputManager"):SendKeyEvent(
                                        false,
                                        99,
                                        false,
                                        game.Players.LocalPlayer.Character.HumanoidRootPart
                                    )
                                    wait(.2)
                                    game:GetService("VirtualInputManager"):SendKeyEvent(
                                        false,
                                        "C",
                                        false,
                                        game.Players.LocalPlayer.Character.HumanoidRootPart
                                    )
                                    for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                                        if v:IsA("Tool") then
                                            if v.ToolTip == "Blox Fruit" then -- "Blox Fruit" , "Sword" , "Wear" , "Agility"
                                                game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
                                            end
                                        end
                                    end
                                    game:GetService("VirtualInputManager"):SendKeyEvent(
                                        true,
                                        122,
                                        false,
                                        game.Players.LocalPlayer.Character.HumanoidRootPart
                                    )
                                    game:GetService("VirtualInputManager"):SendKeyEvent(
                                        false,
                                        122,
                                        false,
                                        game.Players.LocalPlayer.Character.HumanoidRootPart
                                    )
                                    wait(.2)
                                    game:GetService("VirtualInputManager"):SendKeyEvent(
                                        true,
                                        120,
                                        false,
                                        game.Players.LocalPlayer.Character.HumanoidRootPart
                                    )
                                    game:GetService("VirtualInputManager"):SendKeyEvent(
                                        false,
                                        120,
                                        false,
                                        game.Players.LocalPlayer.Character.HumanoidRootPart
                                    )
                                    wait(.2)
                                    game:GetService("VirtualInputManager"):SendKeyEvent(
                                        true,
                                        99,
                                        false,
                                        game.Players.LocalPlayer.Character.HumanoidRootPart
                                    )
                                    game:GetService("VirtualInputManager"):SendKeyEvent(
                                        false,
                                        99,
                                        false,
                                        game.Players.LocalPlayer.Character.HumanoidRootPart
                                    )
                                    wait(.2)
                                    game:GetService("VirtualInputManager"):SendKeyEvent(
                                        true,
                                        "V",
                                        false,
                                        game.Players.LocalPlayer.Character.HumanoidRootPart
                                    )
                                    game:GetService("VirtualInputManager"):SendKeyEvent(
                                        false,
                                        "V",
                                        false,
                                        game.Players.LocalPlayer.Character.HumanoidRootPart
                                    )
                                    wait(0.6)
                                    for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                                        if v:IsA("Tool") then
                                            if v.ToolTip == "Sword" then -- "Blox Fruit" , "Sword" , "Wear" , "Agility"
                                                game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
                                            end
                                        end
                                    end
                                    game:GetService("VirtualInputManager"):SendKeyEvent(
                                        true,
                                        122,
                                        false,
                                        game.Players.LocalPlayer.Character.HumanoidRootPart
                                    )
                                    game:GetService("VirtualInputManager"):SendKeyEvent(
                                        false,
                                        122,
                                        false,
                                        game.Players.LocalPlayer.Character.HumanoidRootPart
                                    )
                                    wait(.2)
                                    game:GetService("VirtualInputManager"):SendKeyEvent(
                                        true,
                                        120,
                                        false,
                                        game.Players.LocalPlayer.Character.HumanoidRootPart
                                    )
                                    game:GetService("VirtualInputManager"):SendKeyEvent(
                                        false,
                                        120,
                                        false,
                                        game.Players.LocalPlayer.Character.HumanoidRootPart
                                    )
                                    wait(.2)
                                    game:GetService("VirtualInputManager"):SendKeyEvent(
                                        true,
                                        99,
                                        false,
                                        game.Players.LocalPlayer.Character.HumanoidRootPart
                                    )
                                    game:GetService("VirtualInputManager"):SendKeyEvent(
                                        false,
                                        99,
                                        false,
                                        game.Players.LocalPlayer.Character.HumanoidRootPart
                                    )
                                    wait(0.5)
                                    for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                                        if v:IsA("Tool") then
                                            if v.ToolTip == "Gun" then -- "Blox Fruit" , "Sword" , "Wear" , "Agility"
                                                game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
                                            end
                                        end
                                    end
                                    game:GetService("VirtualInputManager"):SendKeyEvent(
                                        true,
                                        122,
                                        false,
                                        game.Players.LocalPlayer.Character.HumanoidRootPart
                                    )
                                    game:GetService("VirtualInputManager"):SendKeyEvent(
                                        false,
                                        122,
                                        false,
                                        game.Players.LocalPlayer.Character.HumanoidRootPart
                                    )
                                    wait(.2)
                                    game:GetService("VirtualInputManager"):SendKeyEvent(
                                        true,
                                        120,
                                        false,
                                        game.Players.LocalPlayer.Character.HumanoidRootPart
                                    )
                                    game:GetService("VirtualInputManager"):SendKeyEvent(
                                        false,
                                        120,
                                        false,
                                        game.Players.LocalPlayer.Character.HumanoidRootPart
                                    )
                                    wait(.2)
                                    game:GetService("VirtualInputManager"):SendKeyEvent(
                                        true,
                                        99,
                                        false,
                                        game.Players.LocalPlayer.Character.HumanoidRootPart
                                    )
                                    game:GetService("VirtualInputManager"):SendKeyEvent(
                                        false,
                                        99,
                                        false,
                                        game.Players.LocalPlayer.Character.HumanoidRootPart
                                    )
                                end
                            end
                        )
                    end
                end
            end
        )

        if Second_Sea or Third_Sea then
            local Sea = Tabs.Fish:AddSection("Sea Beast")

            local ToggleSeaBeAst = Tabs.Fish:AddToggle("ToggleSeaBeAst", {Title = "Auto Sea Beast", Default = false})

            ToggleSeaBeAst:OnChanged(
                function(Value)
                    _G.AutoSeaBeast = Value
                end
            )
            Options.ToggleSeaBeAst:SetValue(false)

            Skillz = true
            Skillx = true
            Skillc = true
            Skillv = true

            spawn(
                function()
                    while wait() do
                        pcall(
                            function()
                                if AutoSkill then
                                    if Skillz then
                                        game:service("VirtualInputManager"):SendKeyEvent(true, "Z", false, game)
                                        wait(.1)
                                        game:service("VirtualInputManager"):SendKeyEvent(false, "Z", false, game)
                                    end
                                    if Skillx then
                                        game:service("VirtualInputManager"):SendKeyEvent(true, "X", false, game)
                                        wait(.1)
                                        game:service("VirtualInputManager"):SendKeyEvent(false, "X", false, game)
                                    end
                                    if Skillc then
                                        game:service("VirtualInputManager"):SendKeyEvent(true, "C", false, game)
                                        wait(.1)
                                        game:service("VirtualInputManager"):SendKeyEvent(false, "C", false, game)
                                    end
                                    if Skillv then
                                        game:service("VirtualInputManager"):SendKeyEvent(true, "V", false, game)
                                        wait(.1)
                                        game:service("VirtualInputManager"):SendKeyEvent(false, "V", false, game)
                                    end
                                end
                            end
                        )
                    end
                end
            )
            task.spawn(
                function()
                    while wait() do
                        pcall(
                            function()
                                if _G.AutoSeaBeast then
                                    if not game:GetService("Workspace").SeaBeasts:FindFirstChild("SeaBeast1") then
                                        if not game:GetService("Workspace").Boats:FindFirstChild("PirateGrandBrigade") then
                                            if not game:GetService("Workspace").Boats:FindFirstChild("PirateBasic") then
                                                if
                                                    not game:GetService("Workspace").Boats:FindFirstChild(
                                                        "PirateGrandBrigade"
                                                    )
                                                 then
                                                    buyb =
                                                        TweenBoat(
                                                        CFrame.new(
                                                            -4513.90087890625,
                                                            16.76398277282715,
                                                            -2658.820556640625
                                                        )
                                                    )
                                                    if
                                                        (CFrame.new(
                                                            -4513.90087890625,
                                                            16.76398277282715,
                                                            -2658.820556640625
                                                        ).Position -
                                                            game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <=
                                                            10
                                                     then
                                                        if buyb then
                                                            buyb:Stop()
                                                        end
                                                        local args = {
                                                            [1] = "BuyBoat",
                                                            [2] = "PirateGrandBrigade"
                                                        }

                                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                                            unpack(args)
                                                        )
                                                    end
                                                elseif
                                                    game:GetService("Workspace").Boats:FindFirstChild(
                                                        "PirateGrandBrigade"
                                                    )
                                                 then
                                                    if
                                                        game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit ==
                                                            false
                                                     then
                                                        TweenBoat(
                                                            game:GetService("Workspace").Boats.PirateGrandBrigade.VehicleSeat.CFrame *
                                                                CFrame.new(0, 1, 0)
                                                        )
                                                    elseif
                                                        game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit ==
                                                            true
                                                     then
                                                        repeat
                                                            wait()
                                                            if
                                                                (game:GetService("Workspace").Boats.PirateGrandBrigade.VehicleSeat.CFrame.Position -
                                                                    game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <=
                                                                    10
                                                             then
                                                                TweenShip(
                                                                    CFrame.new(
                                                                        35.04552459716797,
                                                                        17.750778198242188,
                                                                        4819.267578125
                                                                    )
                                                                )
                                                            end
                                                        until game:GetService("Workspace").SeaBeasts:FindFirstChild(
                                                            "SeaBeast1"
                                                        ) or _G.AutoSeaBeast == false
                                                    end
                                                end
                                            elseif
                                                game:GetService("Workspace").Boats:FindFirstChild("PirateGrandBrigade")
                                             then
                                                for is, vs in pairs(game:GetService("Workspace").Boats:GetChildren()) do
                                                    if vs.Name == "PirateGrandBrigade" then
                                                        if vs:FindFirstChild("VehicleSeat") then
                                                            repeat
                                                                wait()
                                                                game.Players.LocalPlayer.Character:WaitForChild(
                                                                        "Humanoid"
                                                                    ).Sit = false
                                                                TweenBoat(vs.VehicleSeat.CFrame * CFrame.new(0, 1, 0))
                                                            until not game:GetService("Workspace").Boats:FindFirstChild(
                                                                "PirateGrandBrigade"
                                                            ) or _G.AutoSeaBeast == false
                                                        end
                                                    end
                                                end
                                            end
                                        elseif game:GetService("Workspace").Boats:FindFirstChild("PirateGrandBrigade") then
                                            for iss, v in pairs(game:GetService("Workspace").Boats:GetChildren()) do
                                                if v.Name == "PirateGrandBrigade" then
                                                    if v:FindFirstChild("VehicleSeat") then
                                                        repeat
                                                            wait()
                                                            game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit =
                                                                false
                                                            TweenBoat(v.VehicleSeat.CFrame * CFrame.new(0, 1, 0))
                                                        until not game:GetService("Workspace").Boats:FindFirstChild(
                                                            "PirateGrandBrigade"
                                                        ) or _G.AutoSeaBeast == false
                                                    end
                                                end
                                            end
                                        end
                                    elseif game:GetService("Workspace").SeaBeasts:FindFirstChild("SeaBeast1") then
                                        for i, v in pairs(game:GetService("Workspace").SeaBeasts:GetChildren()) do
                                            if v:FindFirstChild("HumanoidRootPart") then
                                                repeat
                                                    wait()
                                                    game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit =
                                                        false
                                                    TweenBoat(v.HumanoidRootPart.CFrame * CFrame.new(0, 500, 0))
                                                    EquipAllWeapon()
                                                    AutoSkill = true
                                                    AimBotSkillPosition = v.HumanoidRootPart
                                                    Skillaimbot = true
                                                until not v:FindFirstChild("HumanoidRootPart") or
                                                    _G.AutoSeaBeast == false
                                                AutoSkill = false
                                                Skillaimbot = false
                                            end
                                        end
                                    end
                                end
                            end
                        )
                    end
                end
            )

            local AutoMysticIsland = Tabs.Fish:AddSection("Mirage Island")

            local ToggleTweenMirageIsland =
                Tabs.Fish:AddToggle("ToggleTweenMirageIsland", {Title = "Tween To Mirage Island", Default = false})
            ToggleTweenMirageIsland:OnChanged(
                function(Value)
                    _G.AutoMysticIsland = Value
                end
            )
            Options.ToggleTweenMirageIsland:SetValue(false)
            spawn(
                function()
                    pcall(
                        function()
                            while wait() do
                                if _G.AutoMysticIsland then
                                    if game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
                                        Tween(
                                            CFrame.new(
                                                game:GetService("Workspace").Map.MysticIsland.Center.Position.X,
                                                500,
                                                game:GetService("Workspace").Map.MysticIsland.Center.Position.Z
                                            )
                                        )
                                    end
                                end
                            end
                        end
                    )
                end
            )

            local ToggleTweenGear = Tabs.Fish:AddToggle("ToggleTweenGear", {Title = "Tween To Gear", Default = false})
            ToggleTweenGear:OnChanged(
                function(Value)
                    _G.TweenToGear = Value
                end
            )
            Options.ToggleTweenGear:SetValue(false)

            spawn(
                function()
                    pcall(
                        function()
                            while wait() do
                                if _G.TweenToGear then
                                    if game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
                                        for i, v in pairs(game:GetService("Workspace").Map.MysticIsland:GetChildren()) do
                                            if v:IsA("MeshPart") then
                                                if v.Material == Enum.Material.Neon then
                                                    Tween(v.CFrame)
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    )
                end
            )

            local Togglelockmoon =
                Tabs.Fish:AddToggle("Togglelockmoon", {Title = "Lock Moon and Use Race Skill", Default = false})
            Togglelockmoon:OnChanged(
                function(Value)
                    _G.AutoLockMoon = Value
                end
            )
            Options.Togglelockmoon:SetValue(false)

            spawn(
                function()
                    while wait() do
                        pcall(
                            function()
                                if _G.AutoLockMoon then
                                    local moonDir = game.Lighting:GetMoonDirection()
                                    local lookAtPos = game.Workspace.CurrentCamera.CFrame.p + moonDir * 100
                                    game.Workspace.CurrentCamera.CFrame =
                                        CFrame.lookAt(game.Workspace.CurrentCamera.CFrame.p, lookAtPos)
                                end
                            end
                        )
                    end
                end
            )

            spawn(
                function()
                    while wait() do
                        pcall(
                            function()
                                if _G.AutoLockMoon then
                                    game:GetService("VirtualInputManager"):SendKeyEvent(true, "T", false, game)
                                    wait(0.1)
                                    game:GetService("VirtualInputManager"):SendKeyEvent(false, "T", false, game)
                                end
                            end
                        )
                    end
                end
            )

            local ToggleMirage = Tabs.Fish:AddToggle("ToggleMirage", {Title = "Auto Mirage Island", Default = false})
            ToggleMirage:OnChanged(
                function(Value)
                    _G.AutoSeaBeast = Value
                end
            )

            Options.ToggleMirage:SetValue(false)

            local AutoW = Tabs.Fish:AddToggle("AutoW", {Title = "Auto Press W", Default = false})
            AutoW:OnChanged(
                function(Value)
                    _G.AutoW = Value
                end
            )
            Options.AutoW:SetValue(false)
            spawn(
                function()
                    while wait() do
                        pcall(
                            function()
                                if _G.AutoW then
                                    game:GetService("VirtualInputManager"):SendKeyEvent(true, "W", false, game)
                                end
                            end
                        )
                    end
                end
            )
        end

----------------------------------------------------Setting----------------------------
local test = Tabs.Setting:AddSection("Local Player")

local ToggleInfSoru = Tabs.Setting:AddToggle("ToggleInfSoru", {Title = "Inf Soru", Default = false})
ToggleInfSoru:OnChanged(
    function(v537)
        ToggleInfSoru = v537
    end
)
spawn(
    function()
        while wait() do
            pcall(
                function()
                    if
                        (ToggleInfSoru and
                            (game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart") ~= nil))
                     then
                        for v1680, v1681 in next, getgc() do
                            if game:GetService("Players").LocalPlayer.Character.Soru then
                                if
                                    ((typeof(v1681) == "function") and
                                        (getfenv(v1681).script == game:GetService("Players").LocalPlayer.Character.Soru))
                                 then
                                    for v2309, v2310 in next, getupvalues(v1681) do
                                        if (typeof(v2310) == "table") then
                                            repeat
                                                wait(0.1)
                                                v2310.LastUse = 0
                                            until not _G.Infsoru or
                                                (game:GetService("Players").LocalPlayer.Character.Humanoid.Health <= 0)
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            )
        end
    end
)

local AutoV3 =
    Tabs.Setting:AddToggle(
    "ToggleAutoT",
    {
        Title = "Auto Active V3",
        Description = "",
        Default = false
    }
)
AutoV3:OnChanged(
    function(Siu)
        _G.AutoT = Siu
    end
)
Options.ToggleAutoT:SetValue(false)
spawn(function()
    while wait() do
        pcall(function()
            if _G.AutoT then
                game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("ActivateAbility");
            end
        end);
    end
end);

local v86 =
    Tabs.Setting:AddToggle(
    "ToggleAutoY",
    {
        Title = "Auto Active V4",
        Description = "",
        Default = false
    }
)
v86:OnChanged(
    function(v274)
        _G.AutoY = v274
    end
)
Options.ToggleAutoY:SetValue(false)
spawn(
    function()
        while wait() do
            pcall(
                function()
                    if _G.AutoY then
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, "Y", false, game)
                        wait()
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, "Y", false, game)
                    end
                end
            )
        end
    end
)

local NoClipz =
    Tabs.Setting:AddToggle(
    "NoClipz",
    {
        Title = "No Clip",
        Description = "",
        Default = false
    }
)
NoClipz:OnChanged(function(v)
    getgenv().NoClip = v
    if getgenv().NoClipConnection then getgenv().NoClipConnection:Disconnect() end
    if v then
        getgenv().NoClipConnection = game:GetService("RunService").Stepped:Connect(function()
            for _, p in ipairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                if p:IsA("BasePart") then p.CanCollide = false end
            end
        end)
    else
        for _, p in ipairs(game.Players.LocalPlayer.Character:GetDescendants()) do
            if p:IsA("BasePart") then p.CanCollide = true end
        end
    end
end)

local v117 = Tabs.Setting:AddToggle("ToggleEnablePvp", {
    Title = "Turn On PVP",
    Description = "",
    Default = false
});
v117:OnChanged(function(v314)
    _G.EnabledPvP = v314;
end);
Options.ToggleEnablePvp:SetValue(false);
spawn(function()
    pcall(function()
        while wait() do
            if _G.EnabledPvP then
                if (game:GetService("Players").LocalPlayer.PlayerGui.Main.PvpDisabled.Visible == true) then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EnablePvp");
                end
            end
        end
    end);
end);

Tabs.Setting:AddButton(
    {
        Title = "Stop Tween",
        Description = "",
        Callback = function()
	      Tween(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame);
	      _G.Clip = false;
        end
    }
)

local SettingFarm = Tabs.Setting:AddSection("Setting Farm")

local v153 =
    Tabs.Setting:AddToggle(
    "ToggleAntiBand",
    {
        Title = "Anti Band",
        Description = "",
        Default = true
    }
)
v153:OnChanged(
    function(v384)
        _G.AntiBand = v384
    end
)
local v154 = {
    17884881,
    120173604,
    912348
}
spawn(
    function()
        while wait() do
            if _G.AntiBand then
                for v809, v810 in pairs(game:GetService("Players"):GetPlayers()) do
                    if table.find(v154, v810.UserId) then
                        Hop()
                    end
                end
            end
        end
    end
)

local RemoveNotify = Tabs.Setting:AddToggle("ToggleRemoveNotify", {
    Title = "Remove Notifications",
    Description = "",
    Default = false
});
RemoveNotify:OnChanged(function(v278)
    RemoveNotify = v278;
end);
Options.ToggleRemoveNotify:SetValue(false);
spawn(function()
    while wait() do
        if RemoveNotify then
            game.Players.LocalPlayer.PlayerGui.Notifications.Enabled = false;
        else
            game.Players.LocalPlayer.PlayerGui.Notifications.Enabled = true;
        end
    end
end);

local SetSpawn = Tabs.Setting:AddToggle("ToggleSaveSpawn", {
    Title = "Auto Set Spawn",
    Description = "",
    Default = false
});
SetSpawn:OnChanged(function(v276)
    _G.SaveSpawn = v276;
    if v276 then
        local v648 = {
            [1] = "SetSpawnPoint"
        };
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v648));
    end
end);
Options.ToggleSaveSpawn:SetValue(false);
spawn(function()
    while wait() do
        pcall(function()
            if _G.SaveSpawn then
                local v797 = {
                    [1] = "SetSpawnPoint"
                };
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v797));
            end
        end);
    end
end);

local ToggleWhite = Tabs.Setting:AddToggle("ToggleWhite", {Title = " Enable White Screen", Default = false})
ToggleWhite:OnChanged(
    function(Value)
        _G.WhiteScreen = Value
        if _G.WhiteScreen == true then
            game:GetService("RunService"):Set3dRenderingEnabled(false)
        elseif _G.WhiteScreen == false then
            game:GetService("RunService"):Set3dRenderingEnabled(true)
        end
    end
)
Options.ToggleWhite:SetValue(false)

Tabs.Setting:AddButton(
    {
        Title = "Fps Booster",
        Description = "Boost your fps",
        Callback = function()
            FPSBooster()
        end
    }
)

function FPSBooster()
    local decalsyeeted = true
    local g = game
    local w = g.Workspace
    local l = g.Lighting
    local t = w.Terrain
    sethiddenproperty(l, "Technology", 2)
    sethiddenproperty(t, "Decoration", false)
    t.WaterWaveSize = 0
    t.WaterWaveSpeed = 0
    t.WaterReflectance = 0
    t.WaterTransparency = 0
    l.GlobalShadows = false
    l.FogEnd = 9e9
    l.Brightness = 0
    settings().Rendering.QualityLevel = "Level01"
    for i, v in pairs(g:GetDescendants()) do
        if v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
            v.Material = "Plastic"
            v.Reflectance = 0
        elseif v:IsA("Decal") or v:IsA("Texture") and decalsyeeted then
            v.Transparency = 1
        elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
            v.Lifetime = NumberRange.new(0)
        elseif v:IsA("Explosion") then
            v.BlastPressure = 1
            v.BlastRadius = 1
        elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") then
            v.Enabled = false
        elseif v:IsA("MeshPart") then
            v.Material = "Plastic"
            v.Reflectance = 0
            v.TextureID = 10385902758728957
        end
    end
    for i, e in pairs(l:GetChildren()) do
        if
            e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or
                e:IsA("DepthOfFieldEffect")
         then
            e.Enabled = false
        end
    end
end

local Nofrog = Tabs.Setting:AddToggle("Nofrog", {Title = "No Frog", Default = false})
Nofrog:OnChanged(
    function(Value)
        getgenv().NoFrog = Value
    end
)
spawn(
    function()
        while true do
            if getgenv().NoFrog then
                pcall(
                    function()
                        local lighting = game:GetService("Lighting")
                        if lighting:FindFirstChild("LightingLayers") then
                            lighting.LightingLayers:Destroy()
                        end
                        if lighting:FindFirstChild("Sky") then
                            lighting.Sky:Destroy()
                        end
                    end
                )
            end
            wait(1)
            while not getgenv().NoFrog do
                wait(1)
            end
        end
    end
)

Tabs.Setting:AddButton(
    {
        Title = "No Magma",
        Description = "",
        Callback = function()
           for i,v in pairs(game.Workspace:GetDescendants()) do
           if v.Name == "Lava" then   
               v:Destroy()
           end
       end
       for i,v in pairs(game.ReplicatedStorage:GetDescendants()) do
           if v.Name == "Lava" then   
               v:Destroy()
           end
       end
   end,
  }
)

local SKill = Tabs.Setting:AddSection("Settings Mastery")
local ToggleZ = Tabs.Setting:AddToggle("ToggleZ", {Title = "Skill Z", Default = true})
ToggleZ:OnChanged(
    function(Value)
        SkillZ = Value
    end
)
Options.ToggleZ:SetValue(true)

local ToggleX = Tabs.Setting:AddToggle("ToggleX", {Title = "Skill X", Default = true})
ToggleX:OnChanged(
    function(Value)
        SkillX = Value
    end
)
Options.ToggleX:SetValue(true)

local ToggleC = Tabs.Setting:AddToggle("ToggleC", {Title = "Skill C", Default = true})
ToggleC:OnChanged(
    function(Value)
        SkillC = Value
    end
)
Options.ToggleC:SetValue(true)

local ToggleV = Tabs.Setting:AddToggle("ToggleV", {Title = "Skill V", Default = true})
ToggleV:OnChanged(
    function(Value)
        SkillV = Value
    end
)
Options.ToggleV:SetValue(true)

local ToggleF = Tabs.Setting:AddToggle("ToggleF", {Title = "Skill F", Default = false})
ToggleF:OnChanged(
    function(Value)
        SkillF = Value
    end
)
Options.ToggleF:SetValue(false)

local AutoStasts = Tabs.Setting:AddSection("Auto Stasts")

local ToggleMelee = Tabs.Setting:AddToggle("ToggleMelee", {Title = "Add Melee", Default = false})
ToggleMelee:OnChanged(
    function(Value)
        _G.Auto_Stats_Melee = Value
    end
)
Options.ToggleMelee:SetValue(false)

local ToggleDe = Tabs.Setting:AddToggle("ToggleDe", {Title = "Add Defense", Default = false})
ToggleDe:OnChanged(
    function(Value)
        _G.Auto_Stats_Defense = Value
    end
)
Options.ToggleDe:SetValue(false)

local ToggleSword = Tabs.Setting:AddToggle("ToggleSword", {Title = "Add Sword", Default = false})
ToggleSword:OnChanged(
    function(Value)
        _G.Auto_Stats_Sword = Value
    end
)
Options.ToggleSword:SetValue(false)

local ToggleGun = Tabs.Setting:AddToggle("ToggleGun", {Title = "Add Gun", Default = false})
ToggleGun:OnChanged(
    function(Value)
        _G.Auto_Stats_Gun = Value
    end
)
Options.ToggleGun:SetValue(false)

local ToggleFruit = Tabs.Setting:AddToggle("ToggleFruit", {Title = "Add Demon Fruit", Default = false})
ToggleFruit:OnChanged(
    function(Value)
        _G.Auto_Stats_Devil_Fruit = Value
    end
)
Options.ToggleFruit:SetValue(false)

spawn(
    function()
        while wait() do
            if _G.Auto_Stats_Devil_Fruit then
                local args = {
                    [1] = "AddPoint",
                    [2] = "Demon Fruit",
                    [3] = 3
                }

                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            end
        end
    end
)

spawn(
    function()
        while wait() do
            if _G.Auto_Stats_Gun then
                local args = {
                    [1] = "AddPoint",
                    [2] = "Gun",
                    [3] = 3
                }

                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            end
        end
    end
)

spawn(
    function()
        while wait() do
            if _G.Auto_Stats_Sword then
                local args = {
                    [1] = "AddPoint",
                    [2] = "Sword",
                    [3] = 3
                }

                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            end
        end
    end
)

spawn(
    function()
        while wait() do
            if _G.Auto_Stats_Defense then
                local args = {
                    [1] = "AddPoint",
                    [2] = "Defense",
                    [3] = 3
                }

                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            end
        end
    end
)

spawn(
    function()
        while wait() do
            if _G.Auto_Stats_Melee then
                local args = {
                    [1] = "AddPoint",
                    [2] = "Melee",
                    [3] = 3
                }

                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            end
        end
    end
)

        
        -----------------------------------------Tab Player------------------------------------------------------------
        local Playerslist = {}
        for i, v in pairs(game:GetService("Players"):GetChildren()) do
            table.insert(Playerslist, v.Name)
        end

        local SelectedPly =
            Tabs.Player:AddDropdown(
            "SelectedPly",
            {
                Title = "Select Player",
                Values = Playerslist,
                Multi = false,
                Default = 1
            }
        )

        SelectedPly:OnChanged(
            function(Value)
                _G.SelectPly = Value
            end
        )

        local ToggleTeleport = Tabs.Player:AddToggle("ToggleTeleport", {Title = "Teleport To Player", Default = false})
        ToggleTeleport:OnChanged(
            function(Value)
                _G.TeleportPly = Value
                pcall(
                    function()
                        if _G.TeleportPly then
                            repeat
                                toTarget(game:GetService("Players")[_G.SelectPly].Character.HumanoidRootPart.CFrame)
                                wait()
                            until _G.TeleportPly == false
                        end
                    end
                )
            end
        )
        Options.ToggleTeleport:SetValue(false)

        local ToggleQuanSat = Tabs.Player:AddToggle("ToggleQuanSat", {Title = "Spectate Player", Default = false})
        ToggleQuanSat:OnChanged(
            function(Value)
                SpectatePlys = Value
                local plr1 = game:GetService("Players").LocalPlayer.Character.Humanoid
                local plr2 = game:GetService("Players"):FindFirstChild(_G.SelectPly)
                repeat
                    wait(.1)
                    game:GetService("Workspace").Camera.CameraSubject =
                        game:GetService("Players"):FindFirstChild(_G.SelectPly).Character.Humanoid
                until SpectatePlys == false
                game:GetService("Workspace").Camera.CameraSubject =
                    game:GetService("Players").LocalPlayer.Character.Humanoid
            end
        )
        Options.ToggleQuanSat:SetValue(false)

        local Teleport = Tabs.Player:AddSection("PVP")

        local ToggleAimBotSkill = Tabs.Player:AddToggle("ToggleAimBotSkill", {Title = "Aimbot Skill", Default = false})
        ToggleAimBotSkill:OnChanged(
            function(Value)
                Skillaimbot = Value
            end
        )
        Options.ToggleAimBotSkill:SetValue(false)

        local ToggleAimbotGun = Tabs.Player:AddToggle("ToggleAimbotGun", {Title = "Aimbot Gun", Default = false})
        ToggleAimbotGun:OnChanged(
            function(Value)
                Aimbot = Value
            end
        )
        Options.ToggleAimbotGun:SetValue(false)

        local gg = getrawmetatable(game)
        local old = gg.__namecall
        setreadonly(gg, false)
        gg.__namecall =
            newcclosure(
            function(...)
                local method = getnamecallmethod()
                local args = {...}
                if tostring(method) == "FireServer" then
                    if tostring(args[1]) == "RemoteEvent" then
                        if tostring(args[2]) ~= "true" and tostring(args[2]) ~= "false" then
                            if Skillaimbot then
                                args[2] = AimBotSkillPosition
                                return old(unpack(args))
                            end
                        end
                    end
                end
                return old(...)
            end
        )

        spawn(
            function()
                while wait() do
                    for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                        if v:IsA("Tool") then
                            if v:FindFirstChild("RemoteFunctionShoot") then
                                SelectToolWeaponGun = v.Name
                            end
                        end
                    end
                    for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                        if v:IsA("Tool") then
                            if v:FindFirstChild("RemoteFunctionShoot") then
                                SelectToolWeaponGun = v.Name
                            end
                        end
                    end
                end
            end
        )

        task.spawn(
            function()
                while wait() do
                    if Skillaimbot then
                        if
                            game.Players:FindFirstChild(SelectPlayer) and
                                game.Players:FindFirstChild(SelectPlayer).Character:FindFirstChild("HumanoidRootPart") and
                                game.Players:FindFirstChild(SelectPlayer).Character:FindFirstChild("Humanoid") and
                                game.Players:FindFirstChild(SelectPlayer).Character.Humanoid.Health > 0
                         then
                            AimBotSkillPosition =
                                game.Players:FindFirstChild(SelectPlayer).Character:FindFirstChild("HumanoidRootPart").Position
                        end
                    end
                end
            end
        )

        local lp = game:GetService("Players").LocalPlayer
        local mouse = lp:GetMouse()
        mouse.Button1Down:Connect(
            function()
                if
                    Aimbot and game.Players.LocalPlayer.Character:FindFirstChild(SelectToolWeaponGun) and
                        game:GetService("Players"):FindFirstChild(SelectPlayer)
                 then
                    tool = game:GetService("Players").LocalPlayer.Character[SelectToolWeaponGun]
                    v17 =
                        workspace:FindPartOnRayWithIgnoreList(
                        Ray.new(
                            tool.Handle.CFrame.p,
                            (game:GetService("Players"):FindFirstChild(SelectPlayer).Character.HumanoidRootPart.Position -
                                tool.Handle.CFrame.p).unit * 100
                        ),
                        {game.Players.LocalPlayer.Character, workspace._WorldOrigin}
                    )
                    game:GetService("Players").LocalPlayer.Character[SelectToolWeaponGun].RemoteFunctionShoot:InvokeServer(
                        game:GetService("Players"):FindFirstChild(SelectPlayer).Character.HumanoidRootPart.Position,
                        (require(game.ReplicatedStorage.Util).Other.hrpFromPart(v17))
                    )
                end
            end
        )

        ---------------------------------Tab Item---------------------------------------
        local AutoElite = Tabs.Item:AddSection("Elite Hunter Farm")

        local ToggleElite = Tabs.Item:AddToggle("ToggleElite", {Title = "Auto Elite Hunter", Default = false})

        ToggleElite:OnChanged(
            function(Value)
                _G.AutoElite = Value
            end
        )
        Options.ToggleElite:SetValue(false)
        spawn(
            function()
                while task.wait() do
                    if _G.AutoElite then
                        pcall(
                            function()
                                if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                                    if
                                        string.find(
                                            game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,
                                            "Diablo"
                                        ) or
                                            string.find(
                                                game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,
                                                "Deandre"
                                            ) or
                                            string.find(
                                                game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,
                                                "Urban"
                                            )
                                     then
                                        if
                                            game:GetService("Workspace").Enemies:FindFirstChild("Diablo") or
                                                game:GetService("Workspace").Enemies:FindFirstChild("Deandre") or
                                                game:GetService("Workspace").Enemies:FindFirstChild("Urban")
                                         then
                                            for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                                if
                                                    v:FindFirstChild("Humanoid") and
                                                        v:FindFirstChild("HumanoidRootPart") and
                                                        v.Humanoid.Health > 0
                                                 then
                                                    if v.Name == "Diablo" or v.Name == "Deandre" or v.Name == "Urban" then
                                                        repeat
                                                            wait(0)

                                                            EquipTool(SelectWeapon)
                                                            AutoHaki()
                                                            toTarget(
                                                                v.HumanoidRootPart.CFrame * CFrame.new(posX, posY, posZ)
                                                            )
                                                            MonsterPosition = v.HumanoidRootPart.CFrame
                                                            v.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
                                                            v.Humanoid.JumpPower = 0
                                                            v.Humanoid.WalkSpeed = 0
                                                            v.HumanoidRootPart.CanCollide = false
                                                            v.HumanoidRootPart.Size = Vector3.new(1, 1, 1)
                                                        until _G.AutoElite == false or v.Humanoid.Health <= 0 or
                                                            not v.Parent
                                                    end
                                                end
                                            end
                                        else
                                            if game:GetService("ReplicatedStorage"):FindFirstChild("Diablo") then
                                                toTarget(
                                                    game:GetService("ReplicatedStorage"):FindFirstChild("Diablo").HumanoidRootPart.CFrame *
                                                        CFrame.new(posX, posY, posZ)
                                                )
                                            elseif game:GetService("ReplicatedStorage"):FindFirstChild("Deandre") then
                                                toTarget(
                                                    game:GetService("ReplicatedStorage"):FindFirstChild("Deandre").HumanoidRootPart.CFrame *
                                                        CFrame.new(posX, posY, posZ)
                                                )
                                            elseif game:GetService("ReplicatedStorage"):FindFirstChild("Urban") then
                                                toTarget(
                                                    game:GetService("ReplicatedStorage"):FindFirstChild("Urban").HumanoidRootPart.CFrame *
                                                        CFrame.new(posX, posY, posZ)
                                                )
                                            end
                                        end
                                    end
                                else
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter")
                                end
                            end
                        )
                    end
                end
            end
        )
    end

    local FarmZzzIz = Tabs.Item:AddSection("Other Farm")

    local ToggleCake = Tabs.Item:AddToggle("ToggleCake", {Title = "Auto Cake Prince", Default = false})
    ToggleCake:OnChanged(
        function(Value)
            _G.CakePrice = Value
        end
    )
    Options.ToggleCake:SetValue(false)
    spawn(
        function()
            while wait() do
                if _G.CakePrice then
                    pcall(
                        function()
                            if
                                game.ReplicatedStorage:FindFirstChild("Cake Prince") or
                                    game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince") or
                                    game.ReplicatedStorage:FindFirstChild("Dough King") or
                                    game:GetService("Workspace").Enemies:FindFirstChild("Dough King")
                             then
                                if
                                    game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince") or
                                        game:GetService("Workspace").Enemies:FindFirstChild("Dough King")
                                 then
                                    for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                        if v.Name == "Cake Prince" or v.Name == "Dough King" then
                                            repeat
                                                wait(_G.Fast_Delay)
                                                AutoHaki()
                                                EquipTool(SelectWeapon)
                                                v.HumanoidRootPart.CanCollide = false
                                                v.Humanoid.WalkSpeed = 0
                                                v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                                Tween(v.HumanoidRootPart.CFrame * Pos)
                                                AttackNoCoolDown()
                                            until _G.CakePrice == false or not v.Parent or v.Humanoid.Health <= 0
                                        end
                                    end
                                else
                                    Tween2(CFrame.new(-2009.2802734375, 4532.97216796875, -14937.3076171875))
                                end
                            else
                                if
                                    game.Workspace.Enemies:FindFirstChild("Baking Staff") or
                                        game.Workspace.Enemies:FindFirstChild("Head Baker") or
                                        game.Workspace.Enemies:FindFirstChild("Cake Guard") or
                                        game.Workspace.Enemies:FindFirstChild("Cookie Crafter")
                                 then
                                    for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                        if
                                            (v.Name == "Baking Staff" or v.Name == "Head Baker" or
                                                v.Name == "Cake Guard" or
                                                v.Name == "Cookie Crafter") and
                                                v.Humanoid.Health > 0
                                         then
                                            repeat
                                                wait(_G.Fast_Delay)
                                                AutoHaki()
                                                EquipTool(SelectWeapon)
                                                bringmob = true
                                                v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                                POSCAKE = v.HumanoidRootPart.CFrame
                                                Tween(v.HumanoidRootPart.CFrame * Pos)
                                                AttackNoCoolDown()
                                            until _G.CakePrice == false or
                                                game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince") or
                                                game:GetService("ReplicatedStorage"):FindFirstChild("Dough King") or
                                                not v.Parent or
                                                v.Humanoid.Health <= 0
                                        end
                                    end
                                else
                                    bringmob = false
                                    Tween2(CFrame.new(-1579.9111328125, 329.7358703613281, -12310.365234375))
                                end
                            end
                        end
                    )
                end
            end
        end
    )
    spawn(
        function()
            game:GetService("RunService").Heartbeat:Connect(
                function()
                    pcall(
                        function()
                            for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if
                                    _G.Cake and bringmob and
                                        (v.Name == "Cookie Crafter" or v.Name == "Cake Guard" or
                                            v.Name == "Baking Staff" or
                                            v.Name == "Head Baker") and
                                        (v.HumanoidRootPart.Position - POSCAKE.Position).magnitude <= 350
                                 then
                                    v.HumanoidRootPart.CFrame = POSCAKE
                                    v.HumanoidRootPart.CanCollide = false
                                    v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                    if v.Humanoid:FindFirstChild("Animator") then
                                        v.Humanoid.Animator:Destroy()
                                    end
                                    sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                                end
                            end
                        end
                    )
                end
            )
        end
    )
    spawn(
        function()
            while wait() do
                if _G.CakePrice then
                    pcall(
                        function()
                            if
                                game.ReplicatedStorage:FindFirstChild("Cake Prince") or
                                    game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince") or
                                    game.ReplicatedStorage:FindFirstChild("Dough King") or
                                    game:GetService("Workspace").Enemies:FindFirstChild("Dough King")
                             then
                                if
                                    game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince") or
                                        game:GetService("Workspace").Enemies:FindFirstChild("Dough King")
                                 then
                                    for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                        if v.Name == "Cake Prince" or v.Name == "Dough King" then
                                            repeat
                                                wait(_G.Fast_Delay)
                                                AutoHaki()
                                                EquipTool(SelectWeapon)
                                                v.HumanoidRootPart.CanCollide = false
                                                v.Humanoid.WalkSpeed = 0
                                                v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                                Tween(v.HumanoidRootPart.CFrame * Pos)
                                                AttackNoCoolDown()
                                            until _G.CakePrice == false or not v.Parent or v.Humanoid.Health <= 0
                                        end
                                    end
                                else
                                    Tween2(CFrame.new(-2009.2802734375, 4532.97216796875, -14937.3076171875))
                                end
                            else
                                if
                                    game.Workspace.Enemies:FindFirstChild("Baking Staff") or
                                        game.Workspace.Enemies:FindFirstChild("Head Baker") or
                                        game.Workspace.Enemies:FindFirstChild("Cake Guard") or
                                        game.Workspace.Enemies:FindFirstChild("Cookie Crafter")
                                 then
                                    for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                        if
                                            (v.Name == "Baking Staff" or v.Name == "Head Baker" or
                                                v.Name == "Cake Guard" or
                                                v.Name == "Cookie Crafter") and
                                                v.Humanoid.Health > 0
                                         then
                                            repeat
                                                wait(_G.Fast_Delay)
                                                AutoHaki()
                                                EquipTool(SelectWeapon)
                                                bringmob = true
                                                v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                                POSCAKE = v.HumanoidRootPart.CFrame
                                                Tween(v.HumanoidRootPart.CFrame * Pos)
                                                AttackNoCoolDown()
                                            until _G.CakePrice == false or
                                                game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince") or
                                                game:GetService("ReplicatedStorage"):FindFirstChild("Dough King") or
                                                not v.Parent or
                                                v.Humanoid.Health <= 0
                                        end
                                    end
                                else
                                    bringmob = false
                                    Tween2(CFrame.new(-1579.9111328125, 329.7358703613281, -12310.365234375))
                                end
                            end
                        end
                    )
                end
            end
        end
    )

    local ToggleBone = Tabs.Item:AddToggle("ToggleBone", {Title = "Auto Bone", Default = false})
    ToggleBone:OnChanged(
        function(Value)
            _G.Bone = Value
        end
    )
    Options.ToggleBone:SetValue(false)
    local BoneCFrame = CFrame.new(-9515.75, 174.8521728515625, 6079.40625)
    spawn(
        function()
            while wait() do
                if _G.Bone then
                    pcall(
                        function()
                            local QuestTitle =
                                game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text
                            if not string.find(QuestTitle, "Demonic Soul") then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                            end
                            if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                                Tween2(BoneCFrame)
                                if
                                    (BoneCFrame.Position -
                                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <=
                                        3
                                 then
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                        "StartQuest",
                                        "HauntedQuest2",
                                        1
                                    )
                                end
                            elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                                if
                                    game:GetService("Workspace").Enemies:FindFirstChild("Reborn Skeleton") or
                                        game:GetService("Workspace").Enemies:FindFirstChild("Living Zombie") or
                                        game:GetService("Workspace").Enemies:FindFirstChild("Demonic Soul") or
                                        game:GetService("Workspace").Enemies:FindFirstChild("Posessed Mummy")
                                 then
                                    for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                        if
                                            v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and
                                                v.Humanoid.Health > 0
                                         then
                                            if
                                                v.Name == "Reborn Skeleton" or v.Name == "Living Zombie" or
                                                    v.Name == "Demonic Soul" or
                                                    v.Name == "Posessed Mummy"
                                             then
                                                if
                                                    string.find(
                                                        game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,
                                                        "Demonic Soul"
                                                    )
                                                 then
                                                    repeat
                                                        wait(_G.Fast_Delay)
                                                        AutoHaki()
                                                        EquipTool(SelectWeapon)
                                                        v.HumanoidRootPart.CanCollide = false
                                                        v.Humanoid.WalkSpeed = 0
                                                        v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                                        Tween(v.HumanoidRootPart.CFrame * Pos)
                                                        AttackNoCoolDown()
                                                        MonFarm = v.Name
                                                    until not _G.Bone or v.Humanoid.Health <= 0 or not v.Parent or
                                                        game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible ==
                                                            false
                                                else
                                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                                        "AbandonQuest"
                                                    )
                                                    bringmob = false
                                                end
                                            end
                                        end
                                    end
                                else
                                end
                            end
                        end
                    )
                end
            end
        end
    )

    local EzPhatdepzai = Tabs.Item:AddSection("World Quest")

    local v119 =
        Tabs.Item:AddToggle(
        "ToggleAutoSea2",
        {
            Title = "Auto Second Sea",
            Description = "",
            Default = false
        }
    )
    v119:OnChanged(
        function(v315)
            _G.Auto_Sea2 = v315
        end
    )
    Options.ToggleAutoSea2:SetValue(false)
    spawn(
        function()
            while wait() do
                if _G.Auto_Sea2 then
                    pcall(
                        function()
                            local v800 = game:GetService("Players").LocalPlayer.Data.Level.Value
                            if ((v800 >= 700) and First_Sea) then
                                if
                                    ((game:GetService("Workspace").Map.Ice.Door.CanCollide == false) and
                                        (game:GetService("Workspace").Map.Ice.Door.Transparency == 1))
                                 then
                                    local v1346 = CFrame.new(4849.29883, 5.65138149, 719.611877)
                                    repeat
                                        Tween(v1346)
                                        wait()
                                    until ((v1346.Position -
                                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <=
                                        3) or (_G.Auto_Sea2 == false)
                                    wait(1.1)
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                        "DressrosaQuestProgress",
                                        "Detective"
                                    )
                                    wait(0.5)
                                    EquipTool("Key")
                                    repeat
                                        Tween(CFrame.new(1347.7124, 37.3751602, -1325.6488))
                                        wait()
                                    until ((Vector3.new(1347.7124, 37.3751602, -1325.6488) -
                                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <=
                                        3) or (_G.Auto_Sea2 == false)
                                    wait(0.5)
                                elseif
                                    ((game:GetService("Workspace").Map.Ice.Door.CanCollide == false) and
                                        (game:GetService("Workspace").Map.Ice.Door.Transparency == 1))
                                 then
                                    if game:GetService("Workspace").Enemies:FindFirstChild("Ice Admiral") then
                                        for v1680, v1681 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                            if (v1681.Name == "Ice Admiral") then
                                                if (not v1681.Humanoid.Health <= 0) then
                                                    if
                                                        (v1681:FindFirstChild("Humanoid") and
                                                            v1681:FindFirstChild("HumanoidRootPart") and
                                                            (v1681.Humanoid.Health > 0))
                                                     then
                                                        OldCFrameSecond = v1681.HumanoidRootPart.CFrame
                                                        repeat
                                                            task.wait(_G.Fast_Delay)
                                                            AutoHaki()
                                                            EquipTool(SelectWeapon)
                                                            v1681.HumanoidRootPart.CanCollide = false
                                                            v1681.Humanoid.WalkSpeed = 0
                                                            v1681.Head.CanCollide = false
                                                            v1681.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                                            v1681.HumanoidRootPart.CFrame = OldCFrameSecond
                                                            Tween(v1681.HumanoidRootPart.CFrame * Pos)
                                                            AttackNoCoolDown()
                                                            sethiddenproperty(
                                                                game:GetService("Players").LocalPlayer,
                                                                "SimulationRadius",
                                                                math.huge
                                                            )
                                                        until not _G.Auto_Sea2 or not v1681.Parent or
                                                            (v1681.Humanoid.Health <= 0)
                                                    end
                                                else
                                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                                        "TravelDressrosa"
                                                    )
                                                end
                                            end
                                        end
                                    elseif game:GetService("ReplicatedStorage"):FindFirstChild("Ice Admiral") then
                                        Tween(
                                            game:GetService("ReplicatedStorage"):FindFirstChild("Ice Admiral").HumanoidRootPart.CFrame *
                                                CFrame.new(5, 10, 7)
                                        )
                                    end
                                end
                            end
                        end
                    )
                end
            end
        end
    )

    local v120 =
        Tabs.Item:AddToggle(
        "ToggleAutoSea3",
        {
            Title = "Auto Third Sea",
            Description = "",
            Default = false
        }
    )
    v120:OnChanged(
        function(v316)
            _G.Auto_Sea3 = v316
        end
    )
    Options.ToggleAutoSea3:SetValue(false)
    spawn(
        function()
            while wait() do
                if _G.AutoSea3 then
                    pcall(
                        function()
                            if ((game:GetService("Players").LocalPlayer.Data.Level.Value >= 1500) and Second_Sea) then
                                _G.AutoLevel = false
                                if
                                    (game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer(
                                        "ZQuestProgress",
                                        "General"
                                    ) == 0)
                                 then
                                    Tween(CFrame.new(-1926.3221435547, 12.819851875305, 1738.3092041016))
                                    if
                                        ((CFrame.new(-1926.3221435547, 12.819851875305, 1738.3092041016).Position -
                                            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <=
                                            10)
                                     then
                                        wait(1.5)
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                            "ZQuestProgress",
                                            "Begin"
                                        )
                                    end
                                    wait(1.8)
                                    if game:GetService("Workspace").Enemies:FindFirstChild("rip_indra") then
                                        for v1578, v1579 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                            if (v1579.Name == "rip_indra") then
                                                OldCFrameThird = v1579.HumanoidRootPart.CFrame
                                                repeat
                                                    task.wait(_G.Fast_Delay)
                                                    AutoHaki()
                                                    EquipTool(SelectWeapon)
                                                    Tween(v1579.HumanoidRootPart.CFrame * Pos)
                                                    v1579.HumanoidRootPart.CFrame = OldCFrameThird
                                                    v1579.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                                    v1579.HumanoidRootPart.CanCollide = false
                                                    v1579.Humanoid.WalkSpeed = 0
                                                    AttackNoCoolDown()
                                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                                        "TravelZou"
                                                    )
                                                until (_G.AutoSea3 == false) or (v1579.Humanoid.Health <= 0) or
                                                    not v1579.Parent
                                            end
                                        end
                                    elseif
                                        (not game:GetService("Workspace").Enemies:FindFirstChild("rip_indra") and
                                            ((CFrame.new(-26880.93359375, 22.848554611206, 473.18951416016).Position -
                                                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <=
                                                1000))
                                     then
                                        Tween(CFrame.new(-26880.93359375, 22.848554611206, 473.18951416016))
                                    end
                                end
                            end
                        end
                    )
                end
            end
        end
    )

    local Items = Tabs.Item:AddSection("Items Farm")

    local v69 =
        Tabs.Item:AddToggle(
        "ToggleAutoSaber",
        {
            Title = "Auto Saber",
            Description = "Sea 1",
            Default = false
        }
    )
    v69:OnChanged(
        function(v260)
            _G.Auto_Saber = v260
        end
    )
    Options.ToggleAutoSaber:SetValue(false)
    spawn(
        function()
            while task.wait() do
                if (_G.Auto_Saber and (game.Players.LocalPlayer.Data.Level.Value >= 200)) then
                    pcall(
                        function()
                            if (game:GetService("Workspace").Map.Jungle.Final.Part.Transparency == 0) then
                                if (game:GetService("Workspace").Map.Jungle.QuestPlates.Door.Transparency == 0) then
                                    if
                                        ((CFrame.new(
                                            -1612.55884,
                                            36.9774132,
                                            148.719543,
                                            0.37091279,
                                            3.071715e-9,
                                            -0.928667724,
                                            3.970995e-8,
                                            1,
                                            1.9167935e-8,
                                            0.928667724,
                                            -4.398698e-8,
                                            0.37091279
                                        ).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <=
                                            100)
                                     then
                                        Tween(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
                                        wait(1)
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                                            game:GetService("Workspace").Map.Jungle.QuestPlates.Plate1.Button.CFrame
                                        wait(1)
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                                            game:GetService("Workspace").Map.Jungle.QuestPlates.Plate2.Button.CFrame
                                        wait(1)
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                                            game:GetService("Workspace").Map.Jungle.QuestPlates.Plate3.Button.CFrame
                                        wait(1)
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                                            game:GetService("Workspace").Map.Jungle.QuestPlates.Plate4.Button.CFrame
                                        wait(1)
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                                            game:GetService("Workspace").Map.Jungle.QuestPlates.Plate5.Button.CFrame
                                        wait(1)
                                    else
                                        Tween(
                                            CFrame.new(
                                                -1612.55884,
                                                36.9774132,
                                                148.719543,
                                                0.37091279,
                                                3.071715e-9,
                                                -0.928667724,
                                                3.970995e-8,
                                                1,
                                                1.9167935e-8,
                                                0.928667724,
                                                -4.398698e-8,
                                                0.37091279
                                            )
                                        )
                                    end
                                elseif (game:GetService("Workspace").Map.Desert.Burn.Part.Transparency == 0) then
                                    if
                                        (game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Torch") or
                                            game.Players.LocalPlayer.Character:FindFirstChild("Torch"))
                                     then
                                        EquipTool("Torch")
                                        Tween(
                                            CFrame.new(
                                                1114.61475,
                                                5.04679728,
                                                4350.22803,
                                                -0.648466587,
                                                -1.2879909e-9,
                                                0.761243105,
                                                -5.706529e-10,
                                                1,
                                                1.2058454e-9,
                                                -0.761243105,
                                                3.4754488e-10,
                                                -0.648466587
                                            )
                                        )
                                    else
                                        Tween(
                                            CFrame.new(
                                                -1610.00757,
                                                11.5049858,
                                                164.001587,
                                                0.984807551,
                                                -0.167722285,
                                                -0.0449818149,
                                                0.17364943,
                                                0.951244235,
                                                0.254912198,
                                                0.00003423728,
                                                -0.258850515,
                                                0.965917408
                                            )
                                        )
                                    end
                                elseif
                                    (game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                        "ProQuestProgress",
                                        "SickMan"
                                    ) ~= 0)
                                 then
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                        "ProQuestProgress",
                                        "GetCup"
                                    )
                                    wait(0.5)
                                    EquipTool("Cup")
                                    wait(0.5)
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                        "ProQuestProgress",
                                        "FillCup",
                                        game:GetService("Players").LocalPlayer.Character.Cup
                                    )
                                    wait(0)
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                        "ProQuestProgress",
                                        "SickMan"
                                    )
                                elseif
                                    (game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                        "ProQuestProgress",
                                        "RichSon"
                                    ) == nil)
                                 then
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                        "ProQuestProgress",
                                        "RichSon"
                                    )
                                elseif
                                    (game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                        "ProQuestProgress",
                                        "RichSon"
                                    ) == 0)
                                 then
                                    if
                                        (game:GetService("Workspace").Enemies:FindFirstChild("Mob Leader") or
                                            game:GetService("ReplicatedStorage"):FindFirstChild("Mob Leader"))
                                     then
                                        Tween(
                                            CFrame.new(
                                                -2967.59521,
                                                -4.91089821,
                                                5328.70703,
                                                0.342208564,
                                                -0.0227849055,
                                                0.939347804,
                                                0.0251603816,
                                                0.999569714,
                                                0.0150796166,
                                                -0.939287126,
                                                0.0184739735,
                                                0.342634559
                                            )
                                        )
                                        for v1799, v1800 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                            if (v1800.Name == "Mob Leader") then
                                                if
                                                    game:GetService("Workspace").Enemies:FindFirstChild(
                                                        "Mob Leader [Lv. 120] [Boss]"
                                                    )
                                                 then
                                                    if
                                                        (v1800:FindFirstChild("Humanoid") and
                                                            v1800:FindFirstChild("HumanoidRootPart") and
                                                            (v1800.Humanoid.Health > 0))
                                                     then
                                                        repeat
                                                            task.wait(_G.Fast_Delay)
                                                            AutoHaki()
                                                            EquipTool(SelectWeapon)
                                                            v1800.HumanoidRootPart.CanCollide = false
                                                            v1800.Humanoid.WalkSpeed = 0
                                                            v1800.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                                            Tween(v1800.HumanoidRootPart.CFrame * Pos)
                                                            AttackNoCoolDown()
                                                        until (v1800.Humanoid.Health <= 0) or not _G.Auto_Saber
                                                    end
                                                end
                                                if game:GetService("ReplicatedStorage"):FindFirstChild("Mob Leader") then
                                                    Tween(
                                                        game:GetService("ReplicatedStorage"):FindFirstChild(
                                                            "Mob Leader"
                                                        ).HumanoidRootPart.CFrame * CFrame.new(2, 20, 2)
                                                    )
                                                end
                                            end
                                        end
                                    end
                                elseif
                                    (game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                        "ProQuestProgress",
                                        "RichSon"
                                    ) == 1)
                                 then
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                        "ProQuestProgress",
                                        "RichSon"
                                    )
                                    wait(0.5)
                                    EquipTool("Relic")
                                    wait(0.5)
                                    Tween(
                                        CFrame.new(
                                            -1404.91504,
                                            29.9773273,
                                            3.80598116,
                                            0.876514494,
                                            5.6690688e-9,
                                            0.481375456,
                                            2.53852e-8,
                                            1,
                                            -5.799956e-8,
                                            -0.481375456,
                                            6.3057264e-8,
                                            0.876514494
                                        )
                                    )
                                end
                            elseif
                                (game:GetService("Workspace").Enemies:FindFirstChild("Saber Expert") or
                                    game:GetService("ReplicatedStorage"):FindFirstChild("Saber Expert"))
                             then
                                for v1460, v1461 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                    if
                                        (v1461:FindFirstChild("Humanoid") and v1461:FindFirstChild("HumanoidRootPart") and
                                            (v1461.Humanoid.Health > 0))
                                     then
                                        if (v1461.Name == "Saber Expert") then
                                            repeat
                                                task.wait(_G.Fast_Delay)
                                                EquipTool(SelectWeapon)
                                                Tween(v1461.HumanoidRootPart.CFrame * Pos)
                                                v1461.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                                v1461.HumanoidRootPart.Transparency = 1
                                                v1461.Humanoid.JumpPower = 0
                                                v1461.Humanoid.WalkSpeed = 0
                                                v1461.HumanoidRootPart.CanCollide = false
                                                bringmob = true
                                                FarmPos = v1461.HumanoidRootPart.CFrame
                                                MonFarm = v1461.Name
                                                AttackNoCoolDown()
                                            until (v1461.Humanoid.Health <= 0) or not _G.Auto_Saber
                                            bringmob = true
                                            if (v1461.Humanoid.Health <= 0) then
                                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                                    "ProQuestProgress",
                                                    "PlaceRelic"
                                                )
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    )
                end
            end
        end
    )
    local v70 =
        Tabs.Item:AddToggle(
        "ToggleAutoPoleV1",
        {
            Title = "Auto Pole V1",
            Description = "Sea 1",
            Default = false
        }
    )
    v70:OnChanged(
        function(v261)
            _G.Auto_PoleV1 = v261
        end
    )
    Options.ToggleAutoPoleV1:SetValue(false)
    local v71 = CFrame.new(-7748.0185546875, 5606.80615234375, -2305.898681640625)
    spawn(
        function()
            while wait() do
                if _G.Auto_PoleV1 then
                    pcall(
                        function()
                            if game:GetService("Workspace").Enemies:FindFirstChild("Thunder God") then
                                for v1042, v1043 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                    if (v1043.Name == "Thunder God") then
                                        if
                                            (v1043:FindFirstChild("Humanoid") and
                                                v1043:FindFirstChild("HumanoidRootPart") and
                                                (v1043.Humanoid.Health > 0))
                                         then
                                            repeat
                                                task.wait(_G.Fast_Delay)
                                                AutoHaki()
                                                EquipTool(SelectWeapon)
                                                v1043.HumanoidRootPart.CanCollide = false
                                                v1043.Humanoid.WalkSpeed = 0
                                                v1043.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                                Tween(v1043.HumanoidRootPart.CFrame * Pos)
                                                AttackNoCoolDown()
                                            until not _G.Auto_PoleV1 or not v1043.Parent or (v1043.Humanoid.Health <= 0)
                                        end
                                    end
                                end
                            elseif
                                ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v71.Position).Magnitude <
                                    1500)
                             then
                                Tween(v71)
                            end
                            Tween(CFrame.new(-7748.0185546875, 5606.80615234375, -2305.898681640625))
                            if game:GetService("ReplicatedStorage"):FindFirstChild("Thunder God") then
                                Tween(
                                    game:GetService("ReplicatedStorage"):FindFirstChild("Thunder God").HumanoidRootPart.CFrame *
                                        CFrame.new(2, 20, 2)
                                )
                            end
                        end
                    )
                end
            end
        end
    )
    local v72 =
        Tabs.Item:AddToggle(
        "ToggleAutoSaw",
        {
            Title = "Auto Shark Saw",
            Description = "Sea 1",
            Default = false
        }
    )
    v72:OnChanged(
        function(v262)
            _G.Auto_Saw = v262
        end
    )
    Options.ToggleAutoSaw:SetValue(false)
    local v71 = CFrame.new(-690.33081054688, 15.09425163269, 1582.2380371094)
    spawn(
        function()
            while wait() do
                if _G.Auto_Saw then
                    pcall(
                        function()
                            if game:GetService("Workspace").Enemies:FindFirstChild("The Saw") then
                                for v1044, v1045 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                    if (v1045.Name == "The Saw") then
                                        if
                                            (v1045:FindFirstChild("Humanoid") and
                                                v1045:FindFirstChild("HumanoidRootPart") and
                                                (v1045.Humanoid.Health > 0))
                                         then
                                            repeat
                                                task.wait(_G.Fast_Delay)
                                                AutoHaki()
                                                EquipTool(SelectWeapon)
                                                v1045.HumanoidRootPart.CanCollide = false
                                                v1045.Humanoid.WalkSpeed = 0
                                                v1045.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                                Tween(v1045.HumanoidRootPart.CFrame * Pos)
                                                AttackNoCoolDown()
                                            until not _G.Auto_Saw or not v1045.Parent or (v1045.Humanoid.Health <= 0)
                                        end
                                    end
                                end
                            elseif
                                ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v71.Position).Magnitude <
                                    1500)
                             then
                                Tween(v71)
                            end
                            Tween(CFrame.new(-690.33081054688, 15.09425163269, 1582.2380371094))
                            if game:GetService("ReplicatedStorage"):FindFirstChild("The Saw") then
                                Tween(
                                    game:GetService("ReplicatedStorage"):FindFirstChild("The Saw").HumanoidRootPart.CFrame *
                                        CFrame.new(2, 20, 2)
                                )
                            end
                        end
                    )
                end
            end
        end
    )
    local v73 =
        Tabs.Item:AddToggle(
        "ToggleAutoWarden",
        {
            Title = "Auto Warden Sword",
            Description = "Sea 1",
            Default = false
        }
    )
    v73:OnChanged(
        function(v263)
            _G.Auto_Warden = v263
        end
    )
    Options.ToggleAutoWarden:SetValue(false)
    local v74 = CFrame.new(5186.14697265625, 24.86684226989746, 832.1885375976562)
    spawn(
        function()
            while wait() do
                if _G.Auto_Warden then
                    pcall(
                        function()
                            if game:GetService("Workspace").Enemies:FindFirstChild("Chief Warden") then
                                for v1046, v1047 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                    if (v1047.Name == "Chief Warden") then
                                        if
                                            (v1047:FindFirstChild("Humanoid") and
                                                v1047:FindFirstChild("HumanoidRootPart") and
                                                (v1047.Humanoid.Health > 0))
                                         then
                                            repeat
                                                task.wait(_G.Fast_Delay)
                                                AutoHaki()
                                                EquipTool(SelectWeapon)
                                                v1047.HumanoidRootPart.CanCollide = false
                                                v1047.Humanoid.WalkSpeed = 0
                                                v1047.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                                Tween(v1047.HumanoidRootPart.CFrame * Pos)
                                                AttackNoCoolDown()
                                            until not _G.Auto_Warden or not v1047.Parent or (v1047.Humanoid.Health <= 0)
                                        end
                                    end
                                end
                            elseif
                                ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v74.Position).Magnitude <
                                    1500)
                             then
                                Tween(v74)
                            end
                            Tween(CFrame.new(5186.14697265625, 24.86684226989746, 832.1885375976562))
                            if game:GetService("ReplicatedStorage"):FindFirstChild("Chief Warden") then
                                Tween(
                                    game:GetService("ReplicatedStorage"):FindFirstChild("Chief Warden").HumanoidRootPart.CFrame *
                                        CFrame.new(2, 20, 2)
                                )
                            end
                        end
                    )
                end
            end
        end
    )
    if Third_Sea then
        local ToggleHallow = Tabs.Item:AddToggle("ToggleHallow", {Title = "Auto Hallow Scythe", Default = false})

        ToggleHallow:OnChanged(
            function(Value)
                AutoHallowSycthe = Value
            end
        )
        Options.ToggleHallow:SetValue(false)
        spawn(
            function()
                while wait() do
                    if AutoHallowSycthe then
                        pcall(
                            function()
                                if game:GetService("Workspace").Enemies:FindFirstChild("Soul Reaper") then
                                    for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                        if string.find(v.Name, "Soul Reaper") then
                                            repeat
                                                wait(0)

                                                AutoHaki()
                                                EquipTool(SelectWeapon)
                                                v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                                Tween(v.HumanoidRootPart.CFrame * CFrame.new(posX, posY, posZ))
                                                v.HumanoidRootPart.Transparency = 1
                                                sethiddenproperty(
                                                    game.Players.LocalPlayer,
                                                    "SimulationRadius",
                                                    math.huge
                                                )
                                            until --Click
                                            v.Humanoid.Health <= 0 or AutoHallowSycthe == false
                                        end
                                    end
                                elseif
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Hallow Essence") or
                                        game:GetService("Players").LocalPlayer.Character:FindFirstChild(
                                            "Hallow Essence"
                                        )
                                 then
                                    repeat
                                        Tween(CFrame.new(-8932.322265625, 146.83154296875, 6062.55078125))
                                        wait()
                                    until (CFrame.new(-8932.322265625, 146.83154296875, 6062.55078125).Position -
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 8
                                    EquipTool("Hallow Essence")
                                else
                                    if game:GetService("ReplicatedStorage"):FindFirstChild("Soul Reaper") then
                                        Tween(
                                            game:GetService("ReplicatedStorage"):FindFirstChild("Soul Reaper").HumanoidRootPart.CFrame *
                                                CFrame.new(2, 20, 2)
                                        )
                                    else
                                    end
                                end
                            end
                        )
                    end
                end
            end
        )

        spawn(
            function()
                while wait(0.001) do
                    if AutoHallowSycthe then
                        local args = {
                            [1] = "Bones",
                            [2] = "Buy",
                            [3] = 1,
                            [4] = 1
                        }

                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                    end
                end
            end
        )

        local ToggleYama = Tabs.Item:AddToggle("ToggleYama", {Title = "Auto Get Yama", Default = false})
        ToggleYama:OnChanged(
            function(Value)
                _G.AutoYama = Value
            end
        )
        Options.ToggleYama:SetValue(false)
        spawn(
            function()
                while wait() do
                    if _G.AutoYama then
                        if
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter", "Progress") >=
                                30
                         then
                            repeat
                                wait(.1)
                                fireclickdetector(
                                    game:GetService("Workspace").Map.Waterfall.SealedKatana.Handle.ClickDetector
                                )
                            until game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Yama") or
                                not _G.AutoYama
                        end
                    end
                end
            end
        )

        local ToggleTushita = Tabs.Item:AddToggle("ToggleTushita", {Title = "Auto Tushita", Default = false})
        ToggleTushita:OnChanged(
            function(Value)
                AutoTushita = Value
            end
        )
        Options.ToggleTushita:SetValue(false)
        spawn(
            function()
                while wait() do
                    if AutoTushita then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Longma") then
                            for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if
                                    v.Name == ("Longma" or v.Name == "Longma") and v.Humanoid.Health > 0 and
                                        v:IsA("Model") and
                                        v:FindFirstChild("Humanoid") and
                                        v:FindFirstChild("HumanoidRootPart")
                                 then
                                    repeat
                                        wait(0)

                                        AutoHaki()
                                        if not game.Players.LocalPlayer.Character:FindFirstChild(SelectWeapon) then
                                            wait()
                                            EquipTool(SelectWeapon)
                                        end
                                        FarmPos = v.HumanoidRootPart.CFrame
                                        --Click
                                        v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                        v.Humanoid.JumpPower = 0
                                        v.Humanoid.WalkSpeed = 0
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid:ChangeState(11)
                                        Tween(v.HumanoidRootPart.CFrame * Pos)
                                    until not AutoTushita or not v.Parent or v.Humanoid.Health <= 0
                                end
                            end
                        else
                            Tween(CFrame.new(-10238.875976563, 389.7912902832, -9549.7939453125))
                        end
                    end
                end
            end
        )

        local ToggleHoly = Tabs.Item:AddToggle("ToggleHoly", {Title = "Auto Holy Torch", Default = false})
        ToggleHoly:OnChanged(
            function(Value)
                _G.Auto_Holy_Torch = Value
            end
        )
        Options.ToggleHoly:SetValue(false)
        spawn(
            function()
                while wait() do
                    if _G.Auto_Holy_Torch then
                        pcall(
                            function()
                                wait(1)
                                repeat
                                    Tween(CFrame.new(-10752, 417, -9366))
                                    wait()
                                until not _G.Auto_Holy_Torch or
                                    (game.Players.LocalPlayer.Character.HumanoidRootPart.Position -
                                        Vector3.new(-10752, 417, -9366)).Magnitude <= 10
                                wait(1)
                                repeat
                                    Tween(CFrame.new(-11672, 334, -9474))
                                    wait()
                                until not _G.Auto_Holy_Torch or
                                    (game.Players.LocalPlayer.Character.HumanoidRootPart.Position -
                                        Vector3.new(-11672, 334, -9474)).Magnitude <= 10
                                wait(1)
                                repeat
                                    Tween(CFrame.new(-12132, 521, -10655))
                                    wait()
                                until not _G.Auto_Holy_Torch or
                                    (game.Players.LocalPlayer.Character.HumanoidRootPart.Position -
                                        Vector3.new(-12132, 521, -10655)).Magnitude <= 10
                                wait(1)
                                repeat
                                    Tween(CFrame.new(-13336, 486, -6985))
                                    wait()
                                until not _G.Auto_Holy_Torch or
                                    (game.Players.LocalPlayer.Character.HumanoidRootPart.Position -
                                        Vector3.new(-13336, 486, -6985)).Magnitude <= 10
                                wait(1)
                                repeat
                                    Tween(CFrame.new(-13489, 332, -7925))
                                    wait()
                                until not _G.Auto_Holy_Torch or
                                    (game.Players.LocalPlayer.Character.HumanoidRootPart.Position -
                                        Vector3.new(-13489, 332, -7925)).Magnitude <= 10
                            end
                        )
                    end
                end
            end
        )
    end
end

local v79 = Tabs.Item:AddToggle("ToggleAutoSkullGuitar", {
    Title = "Skull Guitar",
    Description = "Sea 3",
    Default = false
});
v79:OnChanged(function(v268)
    _G.Auto_SkullGuitar = v268;
end);
Options.ToggleAutoSkullGuitar:SetValue(false);
spawn(function()
    while wait() do
        pcall(function()
            if _G.Auto_SkullGuitar then
                if (GetWeaponInventory("Skull Guitar") == false) then
                    if ((CFrame.new(- 9681.458984375, 6.139880657196045, 6341.3720703125).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 5000) then
                        if game:GetService("Workspace").NPCs:FindFirstChild("Skeleton Machine") then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("soulGuitarBuy", true);
                        elseif (game:GetService("Workspace").Map["Haunted Castle"].Candle1.Transparency == 0) then
                            if (game:GetService("Workspace").Map["Haunted Castle"].Placard1.Left.Part.Transparency == 0) then
                                Quest2 = true;
                                repeat
                                    wait();
                                    Tween(CFrame.new(- 8762.69140625, 176.84783935546875, 6171.3076171875));
                                until ((CFrame.new(- 8762.69140625, 176.84783935546875, 6171.3076171875).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3) or not _G.Auto_SkullGuitar
                                wait(1);
                                fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Placard7.Left.ClickDetector);
                                wait(1);
                                fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Placard6.Left.ClickDetector);
                                wait(1);
                                fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Placard5.Left.ClickDetector);
                                wait(1);
                                fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Placard4.Right.ClickDetector);
                                wait(1);
                                fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Placard3.Left.ClickDetector);
                                wait(1);
                                fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Placard2.Right.ClickDetector);
                                wait(1);
                                fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Placard1.Right.ClickDetector);
                                wait(1);
                            elseif game:GetService("Workspace").Map["Haunted Castle"].Tablet.Segment1:FindFirstChild("ClickDetector") then
                                if game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part1:FindFirstChild("ClickDetector") then
                                    Quest4 = true;
                                    repeat
                                        wait();
                                        Tween(CFrame.new(- 9553.5986328125, 65.62338256835938, 6041.58837890625));
                                    until ((CFrame.new(- 9553.5986328125, 65.62338256835938, 6041.58837890625).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3) or not _G.Auto_SkullGuitar
                                    wait(1);
                                    Tween(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part3.CFrame);
                                    wait(1);
                                    fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part3.ClickDetector);
                                    wait(1);
                                    Tween(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part4.CFrame);
                                    wait(1);
                                    fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part4.ClickDetector);
                                    wait(1);
                                    fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part4.ClickDetector);
                                    wait(1);
                                    fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part4.ClickDetector);
                                    wait(1);
                                    Tween(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part6.CFrame);
                                    wait(1);
                                    fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part6.ClickDetector);
                                    wait(1);
                                    fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part6.ClickDetector);
                                    wait(1);
                                    Tween(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part8.CFrame);
                                    wait(1);
                                    fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part8.ClickDetector);
                                    wait(1);
                                    Tween(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part10.CFrame);
                                    wait(1);
                                    fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part10.ClickDetector);
                                    wait(1);
                                    fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part10.ClickDetector);
                                    wait(1);
                                    fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part10.ClickDetector);
                                else
                                    Quest3 = true;
                                end
                            else
                                if game:GetService("Workspace").NPCs:FindFirstChild("Ghost") then
                                    local v1798 = {
                                        [1] = "GuitarPuzzleProgress",
                                        [2] = "Ghost"
                                    };
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v1798));
                                end
                                if game.Workspace.Enemies:FindFirstChild("Living Zombie") then
                                    for v1804, v1805 in pairs(game.Workspace.Enemies:GetChildren()) do
                                        if (v1805:FindFirstChild("HumanoidRootPart") and v1805:FindFirstChild("Humanoid") and (v1805.Humanoid.Health > 0)) then
                                            if (v1805.Name == "Living Zombie") then
                                                EquipTool(SelectWeapon);
                                                v1805.HumanoidRootPart.Size = Vector3.new(60, 60, 60);
                                                v1805.HumanoidRootPart.Transparency = 1;
                                                v1805.Humanoid.JumpPower = 0;
                                                v1805.Humanoid.WalkSpeed = 0;
                                                v1805.HumanoidRootPart.CanCollide = false;
                                                v1805.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0) ;
                                                Tween(CFrame.new(- 10160.787109375, 138.6616973876953, 5955.03076171875));
                                                game:GetService("VirtualUser"):CaptureController();
                                                game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672));
                                            end
                                        end
                                    end
                                else
                                    Tween2(CFrame.new(- 10160.787109375, 138.6616973876953, 5955.03076171875));
                                end
                            end
                        elseif string.find(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("gravestoneEvent", 2), "Error") then
                            Tween2(CFrame.new(- 8653.2060546875, 140.98487854003906, 6160.033203125));
                        elseif string.find(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("gravestoneEvent", 2), "Nothing") then
                            Tween("Wait Full Moon");
                        else
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("gravestoneEvent", 2, true);
                        end
                    else
                        Tween2(CFrame.new(- 9681.458984375, 6.139880657196045, 6341.3720703125));
                    end
                end
            end
        end);
    end
end);

local v80 = Tabs.Item:AddToggle("ToggleAutoBuddy", {
    Title = "Auto Buddy",
    Description = "Sea 3",
    Default = false
});
v80:OnChanged(function(v269)
    _G.Auto_Buddy = v269;
end);
Options.ToggleAutoBuddy:SetValue(false);
local v81 = CFrame.new(- 731.2034301757812, 381.5658874511719, - 11198.4951171875);
spawn(function()
    while wait() do
        if _G.Auto_Buddy then
            pcall(function()
                if game:GetService("Workspace").Enemies:FindFirstChild("Cake Queen") then
                    for v1050, v1051 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if (v1051.Name == "Cake Queen") then
                            if (v1051:FindFirstChild("Humanoid") and v1051:FindFirstChild("HumanoidRootPart") and (v1051.Humanoid.Health > 0)) then
                                repeat
                                    task.wait(_G.Fast_Delay);
                                    AutoHaki();
                                    EquipTool(SelectWeapon);
                                    v1051.HumanoidRootPart.CanCollide = false;
                                    v1051.Humanoid.WalkSpeed = 0;
                                    v1051.HumanoidRootPart.Size = Vector3.new(50, 50, 50);
                                    Tween(v1051.HumanoidRootPart.CFrame * Pos);
                                    AttackNoCoolDown();
                                until not _G.Auto_Buddy or not v1051.Parent or (v1051.Humanoid.Health <= 0)
                            end
                        end
                    end
                elseif ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v81.Position).Magnitude < 1500) then
                    Tween2(v81);
                end
                Tween2(CFrame.new(- 731.2034301757812, 381.5658874511719, - 11198.4951171875));
                if game:GetService("ReplicatedStorage"):FindFirstChild("Cake Queen") then
                    Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Cake Queen").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2));
                end
            end);
        end
    end
end);

local v82 =
    Tabs.Item:AddToggle(
    "ToggleAutoDualKatana",
    {
        Title = "Auto CDK",
        Description = "",
        Default = false
    }
)
v82:OnChanged(
    function(v270)
        _G.Auto_DualKatana = v270
    end
)
Options.ToggleAutoDualKatana:SetValue(false)
spawn(
    function()
        while wait() do
            pcall(
                function()
                    if _G.Auto_DualKatana then
                        if
                            (game.Players.LocalPlayer.Character:FindFirstChild("Tushita") or
                                game.Players.LocalPlayer.Backpack:FindFirstChild("Tushita") or
                                game.Players.LocalPlayer.Character:FindFirstChild("Yama") or
                                game.Players.LocalPlayer.Backpack:FindFirstChild("Yama"))
                         then
                            if
                                (game.Players.LocalPlayer.Character:FindFirstChild("Tushita") or
                                    game.Players.LocalPlayer.Backpack:FindFirstChild("Tushita"))
                             then
                                if game.Players.LocalPlayer.Backpack:FindFirstChild("Tushita") then
                                    EquipTool("Tushita")
                                end
                            elseif
                                (game.Players.LocalPlayer.Character:FindFirstChild("Yama") or
                                    game.Players.LocalPlayer.Backpack:FindFirstChild("Yama"))
                             then
                                if game.Players.LocalPlayer.Backpack:FindFirstChild("Yama") then
                                    EquipTool("Yama")
                                end
                            end
                        else
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LoadItem", "Tushita")
                        end
                    end
                end
            )
        end
    end
)
spawn(
    function()
        while wait() do
            pcall(
                function()
                    if _G.Auto_DualKatana then
                        if (GetMaterial("Alucard Fragment") == 0) then
                            Auto_Quest_Yama_1 = true
                            Auto_Quest_Yama_2 = false
                            Auto_Quest_Yama_3 = false
                            Auto_Quest_Tushita_1 = false
                            Auto_Quest_Tushita_2 = false
                            Auto_Quest_Tushita_3 = false
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                "CDKQuest",
                                "Progress",
                                "Evil"
                            )
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                "CDKQuest",
                                "StartTrial",
                                "Evil"
                            )
                        elseif (GetMaterial("Alucard Fragment") == 1) then
                            Auto_Quest_Yama_1 = false
                            Auto_Quest_Yama_2 = true
                            Auto_Quest_Yama_3 = false
                            Auto_Quest_Tushita_1 = false
                            Auto_Quest_Tushita_2 = false
                            Auto_Quest_Tushita_3 = false
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                "CDKQuest",
                                "Progress",
                                "Evil"
                            )
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                "CDKQuest",
                                "StartTrial",
                                "Evil"
                            )
                        elseif (GetMaterial("Alucard Fragment") == 2) then
                            Auto_Quest_Yama_1 = false
                            Auto_Quest_Yama_2 = false
                            Auto_Quest_Yama_3 = true
                            Auto_Quest_Tushita_1 = false
                            Auto_Quest_Tushita_2 = false
                            Auto_Quest_Tushita_3 = false
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                "CDKQuest",
                                "Progress",
                                "Evil"
                            )
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                "CDKQuest",
                                "StartTrial",
                                "Evil"
                            )
                        elseif (GetMaterial("Alucard Fragment") == 3) then
                            Auto_Quest_Yama_1 = false
                            Auto_Quest_Yama_2 = false
                            Auto_Quest_Yama_3 = false
                            Auto_Quest_Tushita_1 = true
                            Auto_Quest_Tushita_2 = false
                            Auto_Quest_Tushita_3 = false
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                "CDKQuest",
                                "Progress",
                                "Good"
                            )
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                "CDKQuest",
                                "StartTrial",
                                "Good"
                            )
                        elseif (GetMaterial("Alucard Fragment") == 4) then
                            Auto_Quest_Yama_1 = false
                            Auto_Quest_Yama_2 = false
                            Auto_Quest_Yama_3 = false
                            Auto_Quest_Tushita_1 = false
                            Auto_Quest_Tushita_2 = true
                            Auto_Quest_Tushita_3 = false
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                "CDKQuest",
                                "Progress",
                                "Good"
                            )
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                "CDKQuest",
                                "StartTrial",
                                "Good"
                            )
                        elseif (GetMaterial("Alucard Fragment") == 5) then
                            Auto_Quest_Yama_1 = false
                            Auto_Quest_Yama_2 = false
                            Auto_Quest_Yama_3 = false
                            Auto_Quest_Tushita_1 = false
                            Auto_Quest_Tushita_2 = false
                            Auto_Quest_Tushita_3 = true
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                "CDKQuest",
                                "Progress",
                                "Good"
                            )
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                "CDKQuest",
                                "StartTrial",
                                "Good"
                            )
                        elseif (GetMaterial("Alucard Fragment") == 6) then
                            if
                                (game:GetService("Workspace").Enemies:FindFirstChild(
                                    "Cursed Skeleton Boss [Lv. 2025] [Boss]"
                                ) or
                                    game:GetService("Workspace").ReplicatedStorage:FindFirstChild(
                                        "Cursed Skeleton Boss [Lv. 2025] [Boss]"
                                    ))
                             then
                                Auto_Quest_Yama_1 = false
                                Auto_Quest_Yama_2 = false
                                Auto_Quest_Yama_3 = false
                                Auto_Quest_Tushita_1 = false
                                Auto_Quest_Tushita_2 = false
                                Auto_Quest_Tushita_3 = false
                                if
                                    (game:GetService("Workspace").Enemies:FindFirstChild(
                                        "Cursed Skeleton Boss [Lv. 2025] [Boss]"
                                    ) or
                                        game:GetService("Workspace").Enemies:FindFirstChild(
                                            "Cursed Skeleton [Lv. 2200]"
                                        ))
                                 then
                                    for v1842, v1843 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                        if ((v1843.Name == "Cursed Skeleton Boss") or (v1843.Name == "Cursed Skeleton")) then
                                            if (v1843.Humanoid.Health > 0) then
                                                EquipTool(Sword)
                                                Tween(v1843.HumanoidRootPart.CFrame * pos)
                                                v1843.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                                v1843.HumanoidRootPart.Transparency = 1
                                                v1843.Humanoid.JumpPower = 0
                                                v1843.Humanoid.WalkSpeed = 0
                                                v1843.HumanoidRootPart.CanCollide = false
                                                bringmob = true
                                                FarmPos = v1843.HumanoidRootPart.CFrame
                                                MonFarm = v1843.Name
                                                AttackNoCoolDown()
                                            end
                                        end
                                    end
                                end
                            elseif
                                ((CFrame.new(-12361.7060546875, 603.3547973632812, -6550.5341796875).Position -
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 100)
                             then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                    "CDKQuest",
                                    "Progress",
                                    "Good"
                                )
                                wait(1)
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                    "CDKQuest",
                                    "Progress",
                                    "Evil"
                                )
                                wait(1)
                                Tween(CFrame.new(-12361.7060546875, 603.3547973632812, -6550.5341796875))
                                wait(1.5)
                                game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
                                wait(1.5)
                                Tween(CFrame.new(-12253.5419921875, 598.8999633789062, -6546.8388671875))
                            else
                                Tween(CFrame.new(-12361.7060546875, 603.3547973632812, -6550.5341796875))
                            end
                        end
                    end
                end
            )
        end
    end
)
spawn(
    function()
        while wait() do
            if Auto_Quest_Yama_1 then
                pcall(
                    function()
                        if game:GetService("Workspace").Enemies:FindFirstChild("Mythological Pirate") then
                            for v1052, v1053 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if (v1053.Name == "Mythological Pirate") then
                                    repeat
                                        wait()
                                        Tween(v1053.HumanoidRootPart.CFrame * CFrame.new(0, 0, -2))
                                    until (_G.Auto_DualKatana == false) or (Auto_Quest_Yama_1 == false)
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                        "CDKQuest",
                                        "StartTrial",
                                        "Evil"
                                    )
                                end
                            end
                        else
                            Tween(CFrame.new(-13451.46484375, 543.712890625, -6961.0029296875))
                        end
                    end
                )
            end
        end
    end
)
spawn(
    function()
        while wait() do
            pcall(
                function()
                    if Auto_Quest_Yama_2 then
                        for v858, v859 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v859:FindFirstChild("HazeESP") then
                                v859.HazeESP.Size = UDim2.new(50, 50, 50, 50)
                                v859.HazeESP.MaxDistance = "inf"
                            end
                        end
                        for v860, v861 in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
                            if v861:FindFirstChild("HazeESP") then
                                v861.HazeESP.Size = UDim2.new(50, 50, 50, 50)
                                v861.HazeESP.MaxDistance = "inf"
                            end
                        end
                    end
                end
            )
        end
    end
)
spawn(
    function()
        while wait() do
            pcall(
                function()
                    for v731, v732 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if
                            (Auto_Quest_Yama_2 and v732:FindFirstChild("HazeESP") and
                                ((v732.HumanoidRootPart.Position - FarmPossEsp.Position).magnitude <= 300))
                         then
                            v732.HumanoidRootPart.CFrame = FarmPossEsp
                            v732.HumanoidRootPart.CanCollide = false
                            v732.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                            if not v732.HumanoidRootPart:FindFirstChild("BodyVelocity") then
                                local v1058 = Instance.new("BodyVelocity", v732.HumanoidRootPart)
                                v1058.MaxForce = Vector3.new(1, 1, 1) * math.huge
                                v1058.Velocity = Vector3.new(0, 0, 0)
                            end
                        end
                    end
                end
            )
        end
    end
)
spawn(
    function()
        while wait() do
            if Auto_Quest_Yama_2 then
                pcall(
                    function()
                        for v865, v866 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v866:FindFirstChild("HazeESP") then
                                repeat
                                    wait()
                                    if
                                        ((v866.HumanoidRootPart.Position -
                                            game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude >
                                            2000)
                                     then
                                        Tween(v866.HumanoidRootPart.CFrame * Pos)
                                    else
                                        EquipTool(Sword)
                                        Tween(v866.HumanoidRootPart.CFrame * Pos)
                                        v866.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                        v866.HumanoidRootPart.Transparency = 1
                                        v866.Humanoid.JumpPower = 0
                                        v866.Humanoid.WalkSpeed = 0
                                        v866.HumanoidRootPart.CanCollide = false
                                        FarmPos = v866.HumanoidRootPart.CFrame
                                        MonFarm = v866.Name
                                        AttackNoCoolDown()
                                        if ((v866.Humanoid.Health <= 0) and v866.Humanoid:FindFirstChild("Animator")) then
                                            v866.Humanoid.Animator:Destroy()
                                        end
                                    end
                                until (_G.Auto_DualKatana == false) or (Auto_Quest_Yama_2 == false) or not v866.Parent or
                                    (v866.Humanoid.Health <= 0) or
                                    not v866:FindFirstChild("HazeESP")
                            else
                                for v1342, v1343 in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
                                    if v1343:FindFirstChild("HazeESP") then
                                        if
                                            ((v1343.HumanoidRootPart.Position -
                                                game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude >
                                                2000)
                                         then
                                            Tween(v1343.HumanoidRootPart.CFrameMon * CFrame.new(2, 20, 2))
                                        else
                                            Tween(v1343.HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                                        end
                                    end
                                end
                            end
                        end
                    end
                )
            end
        end
    end
)
spawn(
    function()
        while wait() do
            if Auto_Quest_Yama_3 then
                pcall(
                    function()
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Hallow Essence") then
                            Tween(game:GetService("Workspace").Map["Haunted Castle"].Summoner.Detection.CFrame)
                        elseif game:GetService("Workspace").Map:FindFirstChild("HellDimension") then
                            repeat
                                wait()
                                if
                                    (game:GetService("Workspace").Enemies:FindFirstChild("Cursed Skeleton [Lv. 2200]") or
                                        game:GetService("Workspace").Enemies:FindFirstChild(
                                            "Cursed Skeleton [Lv. 2200] [Boss]"
                                        ) or
                                        game:GetService("Workspace").Enemies:FindFirstChild(
                                            "Hell's Messenger [Lv. 2200] [Boss]"
                                        ))
                                 then
                                    for v1641, v1642 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                        if
                                            ((v1642.Name == "Cursed Skeleton") or (v1642.Name == "Cursed Skeleton") or
                                                (v1642.Name == "Hell's Messenger"))
                                         then
                                            if (v1642.Humanoid.Health > 0) then
                                                repeat
                                                    wait()
                                                    EquipTool(Sword)
                                                    Tween(v1642.HumanoidRootPart.CFrame * Pos)
                                                    v1642.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                                    v1642.HumanoidRootPart.Transparency = 1
                                                    v1642.Humanoid.JumpPower = 0
                                                    v1642.Humanoid.WalkSpeed = 0
                                                    v1642.HumanoidRootPart.CanCollide = false
                                                    FarmPos = v1642.HumanoidRootPart.CFrame
                                                    MonFarm = v1642.Name
                                                    AttackNoCoolDown()
                                                    if
                                                        ((v1642.Humanoid.Health <= 0) and
                                                            v1642.Humanoid:FindFirstChild("Animator"))
                                                     then
                                                        v1642.Humanoid.Animator:Destroy()
                                                    end
                                                until (v1642.Humanoid.Health <= 0) or not v1642.Parent or
                                                    (Auto_Quest_Yama_3 == false)
                                            end
                                        end
                                    end
                                else
                                    wait(5)
                                    Tween(game:GetService("Workspace").Map.HellDimension.Torch1.CFrame)
                                    wait(1.5)
                                    game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
                                    wait(1.5)
                                    Tweem(game:GetService("Workspace").Map.HellDimension.Torch2.CFrame)
                                    wait(1.5)
                                    game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
                                    wait(1.5)
                                    Tween(game:GetService("Workspace").Map.HellDimension.Torch3.CFrame)
                                    wait(1.5)
                                    game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
                                    wait(1.5)
                                    Tween(game:GetService("Workspace").Map.HellDimension.Exit.CFrame)
                                end
                            until (_G.Auto_DualKatana == false) or (Auto_Quest_Yama_3 == false) or
                                (GetMaterial("Alucard Fragment") == 3)
                        elseif
                            (game:GetService("Workspace").Enemies:FindFirstChild("Soul Reaper") or
                                game.ReplicatedStorage:FindFirstChild("Soul Reaper [Lv. 2100] [Raid Boss]"))
                         then
                            if game:GetService("Workspace").Enemies:FindFirstChild("Soul Reaper") then
                                for v1671, v1672 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                    if (v1672.Name == "Soul Reaper") then
                                        if (v1672.Humanoid.Health > 0) then
                                            repeat
                                                wait()
                                                Tween(v1672.HumanoidRootPart.CFrame * Pos)
                                            until (_G.Auto_DualKatana == false) or (Auto_Quest_Yama_3 == false) or
                                                game:GetService("Workspace").Map:FindFirstChild("HellDimension")
                                        end
                                    end
                                end
                            else
                                Tween(CFrame.new(-9570.033203125, 315.9346923828125, 6726.89306640625))
                            end
                        else
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones", "Buy", 1, 1)
                        end
                    end
                )
            end
        end
    end
)
spawn(
    function()
        while wait() do
            if Auto_Quest_Tushita_1 then
                Tween(CFrame.new(-9546.990234375, 21.139892578125, 4686.1142578125))
                wait(5)
                Tween(CFrame.new(-6120.0576171875, 16.455780029296875, -2250.697265625))
                wait(5)
                Tween(CFrame.new(-9533.2392578125, 7.254445552825928, -8372.69921875))
            end
        end
    end
)
spawn(
    function()
        while wait() do
            if Auto_Quest_Tushita_2 then
                pcall(
                    function()
                        if
                            ((CFrame.new(-5539.3115234375, 313.800537109375, -2972.372314453125).Position -
                                game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 500)
                         then
                            for v1061, v1062 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if
                                    (Auto_Quest_Tushita_2 and v1062:FindFirstChild("HumanoidRootPart") and
                                        v1062:FindFirstChild("Humanoid") and
                                        (v1062.Humanoid.Health > 0))
                                 then
                                    if
                                        ((v1062.HumanoidRootPart.Position -
                                            game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <
                                            2000)
                                     then
                                        repeat
                                            wait()
                                            EquipTool(Sword)
                                            Tween(v1062.HumanoidRootPart.CFrame * Pos)
                                            v1062.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                            v1062.HumanoidRootPart.Transparency = 1
                                            v1062.Humanoid.JumpPower = 0
                                            v1062.Humanoid.WalkSpeed = 0
                                            v1062.HumanoidRootPart.CanCollide = false
                                            FarmPos = v1062.HumanoidRootPart.CFrame
                                            MonFarm = v1062.Name
                                            AttackNoCoolDown()
                                            if
                                                ((v1062.Humanoid.Health <= 0) and
                                                    v1062.Humanoid:FindFirstChild("Animator"))
                                             then
                                                v1062.Humanoid.Animator:Destroy()
                                            end
                                        until (v1062.Humanoid.Health <= 0) or not v1062.Parent or
                                            (Auto_Quest_Tushita_2 == false)
                                    end
                                end
                            end
                        else
                            Tween(CFrame.new(-5545.1240234375, 313.800537109375, -2976.616455078125))
                        end
                    end
                )
            end
        end
    end
)
spawn(
    function()
        while wait() do
            if Auto_Quest_Tushita_3 then
                pcall(
                    function()
                        if
                            (game:GetService("Workspace").Enemies:FindFirstChild("Cake Queen") or
                                game.ReplicatedStorage:FindFirstChild("Cake Queen [Lv. 2175] [Boss]"))
                         then
                            if game:GetService("Workspace").Enemies:FindFirstChild("Cake Queen") then
                                for v1464, v1465 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                    if (v1465.Name == "Cake Queen") then
                                        if (v1465.Humanoid.Health > 0) then
                                            repeat
                                                wait()
                                                EquipTool(Sword)
                                                Tween(v1465.HumanoidRootPart.CFrame * Pos)
                                                v1465.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                                v1465.HumanoidRootPart.Transparency = 1
                                                v1465.Humanoid.JumpPower = 0
                                                v1465.Humanoid.WalkSpeed = 0
                                                v1465.HumanoidRootPart.CanCollide = false
                                                FarmPos = v1465.HumanoidRootPart.CFrame
                                                MonFarm = v1465.Name
                                                AttackNoCoolDown()
                                                if
                                                    ((v1465.Humanoid.Health <= 0) and
                                                        v1465.Humanoid:FindFirstChild("Animator"))
                                                 then
                                                    v1465.Humanoid.Animator:Destroy()
                                                end
                                            until (_G.Auto_DualKatana == false) or (Auto_Quest_Tushita_3 == false) or
                                                game:GetService("Workspace").Map:FindFirstChild("HeavenlyDimension")
                                        end
                                    end
                                end
                            else
                                Tween(CFrame.new(-709.3132934570312, 381.6005859375, -11011.396484375))
                            end
                        elseif game:GetService("Workspace").Map:FindFirstChild("HeavenlyDimension") then
                            repeat
                                wait()
                                if
                                    (game:GetService("Workspace").Enemies:FindFirstChild("Cursed Skeleton [Lv. 2200]") or
                                        game:GetService("Workspace").Enemies:FindFirstChild(
                                            "Cursed Skeleton [Lv. 2200] [Boss]"
                                        ) or
                                        game:GetService("Workspace").Enemies:FindFirstChild(
                                            "Heaven's Guardian [Lv. 2200] [Boss]"
                                        ))
                                 then
                                    for v1650, v1651 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                        if
                                            ((v1651.Name == "Cursed Skeleton") or (v1651.Name == "Cursed Skeleton") or
                                                (v1651.Name == "Heaven's Guardian"))
                                         then
                                            if (v1651.Humanoid.Health > 0) then
                                                repeat
                                                    wait()
                                                    EquipTool(Sword)
                                                    Tween(v1651.HumanoidRootPart.CFrame * Pos)
                                                    v1651.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                                    v1651.HumanoidRootPart.Transparency = 1
                                                    v1651.Humanoid.JumpPower = 0
                                                    v1651.Humanoid.WalkSpeed = 0
                                                    v1651.HumanoidRootPart.CanCollide = false
                                                    FarmPos = v1651.HumanoidRootPart.CFrame
                                                    MonFarm = v1651.Name
                                                    AttackNoCoolDown()
                                                    if
                                                        ((v1651.Humanoid.Health <= 0) and
                                                            v1651.Humanoid:FindFirstChild("Animator"))
                                                     then
                                                        v1651.Humanoid.Animator:Destroy()
                                                    end
                                                until (v1651.Humanoid.Health <= 0) or not v1651.Parent or
                                                    (Auto_Quest_Tushita_3 == false)
                                            end
                                        end
                                    end
                                else
                                    wait(5)
                                    Tween(game:GetService("Workspace").Map.HeavenlyDimension.Torch1.CFrame)
                                    wait(1.5)
                                    game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
                                    wait(1.5)
                                    Tween(game:GetService("Workspace").Map.HeavenlyDimension.Torch2.CFrame)
                                    wait(1.5)
                                    game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
                                    wait(1.5)
                                    Tween(game:GetService("Workspace").Map.HeavenlyDimension.Torch3.CFrame)
                                    wait(1.5)
                                    game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
                                    wait(1.5)
                                    Tween(game:GetService("Workspace").Map.HeavenlyDimension.Exit.CFrame)
                                end
                            until not _G.Auto_DualKatana or not Auto_Quest_Tushita_3 or
                                (GetMaterial("Alucard Fragment") == 6)
                        end
                    end
                )
            end
        end
    end
)

local v78 =
    Tabs.Item:AddToggle(
    "ToggleAutoRainbowHaki",
    {
        Title = "Auto Ranbow Haki",
        Description = "",
        Default = false
    }
)
v78:OnChanged(
    function(v267)
        _G.Auto_RainbowHaki = v267
    end
)
Options.ToggleAutoRainbowHaki:SetValue(false)
spawn(
    function()
        pcall(
            function()
                while wait(0.1) do
                    if _G.Auto_RainbowHaki then
                        if not game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible then
                            Tween(CFrame.new(-11892.0703125, 930.57672119141, -8760.1591796875))
                            if
                                ((Vector3.new(-11892.0703125, 930.57672119141, -8760.1591796875) -
                                    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <=
                                    30)
                             then
                                wait(1.5)
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("HornedMan", "Bet")
                            end
                        elseif
                            (game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible and
                                string.find(
                                    game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,
                                    "Stone"
                                ))
                         then
                            if game:GetService("Workspace").Enemies:FindFirstChild("Stone") then
                                for v1563, v1564 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                    if (v1564.Name == "Stone") then
                                        OldCFrameRainbow = v1564.HumanoidRootPart.CFrame
                                        repeat
                                            task.wait(_G.Fast_Delay)
                                            EquipTool(SelectWeapon)
                                            Tween(v1564.HumanoidRootPart.CFrame * Pos)
                                            v1564.HumanoidRootPart.CanCollide = false
                                            v1564.HumanoidRootPart.CFrame = OldCFrameRainbow
                                            v1564.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                            AttackNoCoolDown()
                                        until not _G.Auto_RainbowHaki or (v1564.Humanoid.Health <= 0) or
                                            not v1564.Parent or
                                            not game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible
                                    end
                                end
                            else
                                Tween(CFrame.new(-1086.11621, 38.8425903, 6768.71436))
                            end
                        elseif
                            (game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible and
                                string.find(
                                    game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,
                                    "Hydra Leader"
                                ))
                         then
                            if game:GetService("Workspace").Enemies:FindFirstChild("Hydra Leader") then
                                for v1669, v1670 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                    if (v1670.Name == "Hydra Leader") then
                                        OldCFrameRainbow = v1670.HumanoidRootPart.CFrame
                                        repeat
                                            task.wait(_G.Fast_Delay)
                                            EquipTool(SelectWeapon)
                                            Tween(v1670.HumanoidRootPart.CFrame * Pos)
                                            v1670.HumanoidRootPart.CanCollide = false
                                            v1670.HumanoidRootPart.CFrame = OldCFrameRainbow
                                            v1670.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                            AttackNoCoolDown()
                                        until not _G.Auto_RainbowHaki or (v1670.Humanoid.Health <= 0) or
                                            not v1670.Parent or
                                            not game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible
                                    end
                                end
                            else
                                Tween(CFrame.new(5713.98877, 601.922974, 202.751251))
                            end
                        elseif
                            string.find(
                                game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,
                                "Kilo Admiral"
                            )
                         then
                            if game:GetService("Workspace").Enemies:FindFirstChild("Kilo Admiral") then
                                for v1762, v1763 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                    if (v1763.Name == "Kilo Admiral") then
                                        OldCFrameRainbow = v1763.HumanoidRootPart.CFrame
                                        repeat
                                            task.wait(_G.Fast_Delay)
                                            EquipTool(SelectWeapon)
                                            Tween(v1763.HumanoidRootPart.CFrame * Pos)
                                            v1763.HumanoidRootPart.CanCollide = false
                                            v1763.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                            v1763.HumanoidRootPart.CFrame = OldCFrameRainbow
                                            AttackNoCoolDown()
                                        until not _G.Auto_RainbowHaki or (v1763.Humanoid.Health <= 0) or
                                            not v1763.Parent or
                                            not game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible
                                    end
                                end
                            else
                                Tween(CFrame.new(2877.61743, 423.558685, -7207.31006))
                            end
                        elseif
                            string.find(
                                game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,
                                "Captain Elephant"
                            )
                         then
                            if game:GetService("Workspace").Enemies:FindFirstChild("Captain Elephant") then
                                for v1774, v1775 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                    if (v1775.Name == "Captain Elephant") then
                                        OldCFrameRainbow = v1775.HumanoidRootPart.CFrame
                                        repeat
                                            task.wait(_G.Fast_Delay)
                                            EquipTool(SelectWeapon)
                                            Tween(v1775.HumanoidRootPart.CFrame * Pos)
                                            v1775.HumanoidRootPart.CanCollide = false
                                            v1775.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                            v1775.HumanoidRootPart.CFrame = OldCFrameRainbow
                                            AttackNoCoolDown()
                                        until not _G.Auto_RainbowHaki or (v1775.Humanoid.Health <= 0) or
                                            not v1775.Parent or
                                            not game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible
                                    end
                                end
                            else
                                Tween(CFrame.new(-13485.0283, 331.709259, -8012.4873))
                            end
                        elseif
                            string.find(
                                game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,
                                "Beautiful Pirate"
                            )
                         then
                            if game:GetService("Workspace").Enemies:FindFirstChild("Beautiful Pirate") then
                                for v1802, v1803 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                    if (v1803.Name == "Beautiful Pirate") then
                                        OldCFrameRainbow = v1803.HumanoidRootPart.CFrame
                                        repeat
                                            task.wait(_G.Fast_Delay)
                                            EquipTool(SelectWeapon)
                                            Tween(v1803.HumanoidRootPart.CFrame * Pos)
                                            v1803.HumanoidRootPart.CanCollide = false
                                            v1803.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                            v1803.HumanoidRootPart.CFrame = OldCFrameRainbow
                                            AttackNoCoolDown()
                                        until not _G.Auto_RainbowHaki or (v1803.Humanoid.Health <= 0) or
                                            not v1803.Parent or
                                            not game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible
                                    end
                                end
                            else
                                Tween(CFrame.new(5312.3598632813, 20.141201019287, -10.158538818359))
                            end
                        else
                            Tween(CFrame.new(-11892.0703125, 930.57672119141, -8760.1591796875))
                            if
                                ((Vector3.new(-11892.0703125, 930.57672119141, -8760.1591796875) -
                                    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <=
                                    30)
                             then
                                wait(1.5)
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("HornedMan", "Bet")
                            end
                        end
                    end
                end
            end
        )
    end
)
if Second_Sea then
    local ToggleFactory = Tabs.Item:AddToggle("ToggleFactory", {Title = "Auto Farm Factory", Default = false})
    ToggleFactory:OnChanged(
        function(Value)
            _G.Factory = Value
        end
    )
    Options.ToggleFactory:SetValue(false)

    spawn(
        function()
            while wait() do
                if _G.Factory then
                    if game.Workspace.Enemies:FindFirstChild("Core") then
                        for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
                            if v.Name == "Core" and v.Humanoid.Health > 0 then
                                repeat
                                    wait(0)

                                    repeat
                                        Tween(CFrame.new(448.46756, 199.356781, -441.389252))
                                        wait()
                                    until not _G.Factory or
                                        (game.Players.LocalPlayer.Character.HumanoidRootPart.Position -
                                            Vector3.new(448.46756, 199.356781, -441.389252)).Magnitude <= 10
                                    EquipTool(SelectWeapon)
                                    AutoHaki()
                                    Tween(v.HumanoidRootPart.CFrame * CFrame.new(posX, posY, posZ))
                                    v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                    v.HumanoidRootPart.Transparency = 1
                                    v.Humanoid.JumpPower = 0
                                    v.Humanoid.WalkSpeed = 0
                                    v.HumanoidRootPart.CanCollide = false
                                    FarmPos = v.HumanoidRootPart.CFrame
                                    MonFarm = v.Name
                                until --Click
                                not v.Parent or v.Humanoid.Health <= 0 or _G.Factory == false
                            end
                        end
                    elseif game.ReplicatedStorage:FindFirstChild("Core") then
                        repeat
                            Tween(CFrame.new(448.46756, 199.356781, -441.389252))
                            wait()
                        until not _G.Factory or
                            (game.Players.LocalPlayer.Character.HumanoidRootPart.Position -
                                Vector3.new(448.46756, 199.356781, -441.389252)).Magnitude <= 10
                    end
                end
            end
        end
    )
end

if Third_Sea then
    local ToggleCakeV2 = Tabs.Item:AddToggle("ToggleCakeV2", {Title = "Kill Dough King", Default = false})
    ToggleCakeV2:OnChanged(
        function(Value)
            _G.AutoCakeV2 = Value
        end
    )
    Options.ToggleCakeV2:SetValue(false)
end
spawn(
    function()
        while wait() do
            if _G.AutoCakeV2 then
                pcall(
                    function()
                        if game:GetService("Workspace").Enemies:FindFirstChild("Dough King") then
                            for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == "Dough King" then
                                    if
                                        v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and
                                            v.Humanoid.Health > 0
                                     then
                                        repeat
                                            wait(0)

                                            AutoHaki()
                                            EquipTool(SelectWeapon)
                                            v.HumanoidRootPart.CanCollide = false
                                            v.Humanoid.WalkSpeed = 0
                                            v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                            Tween(v.HumanoidRootPart.CFrame * CFrame.new(posX, posY, posZ))
                                        until not _G.AutoCakeV2 or not v.Parent or v.Humanoid.Health <= 0
                                    end
                                end
                            end
                        else
                            if game:GetService("ReplicatedStorage"):FindFirstChild("Dough King") then
                                Tween(
                                    game:GetService("ReplicatedStorage"):FindFirstChild("Dough King").HumanoidRootPart.CFrame *
                                        CFrame.new(2, 20, 2)
                                )
                            else
                            end
                        end
                    end
                )
            end
        end
    end
)

if Second_Sea or Third_Sea then
    local ToggleHakiColor = Tabs.Item:AddToggle("ToggleHakiColor", {Title = "Buy Haki Color", Default = false})
    ToggleHakiColor:OnChanged(
        function(Value)
            _G.Auto_Buy_Enchancement = Value
        end
    )
    Options.ToggleHakiColor:SetValue(false)
    spawn(
        function()
            while wait() do
                if _G.Auto_Buy_Enchancement then
                    local args = {
                        [1] = "ColorsDealer",
                        [2] = "2"
                    }
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                end
            end
        end
    )
end

if Second_Sea then
    local ToggleSwordLengend =
        Tabs.Item:AddToggle("ToggleSwordLengend", {Title = "Buy Sword Lengendary", Default = false})
    ToggleSwordLengend:OnChanged(
        function(Value)
            _G.BuyLengendSword = Value
        end
    )
    Options.ToggleSwordLengend:SetValue(false)

    spawn(
        function()
            while wait(.1) do
                pcall(
                    function()
                        if _G.BuyLengendSword or Triple_A then
                            local args = {
                                [1] = "LegendarySwordDealer",
                                [2] = "2"
                            }
                            -- Triple_A
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                        else
                            wait(2)
                        end
                    end
                )
            end
        end
    )
end

local Chestt = Tabs.Item:AddSection("Chest Farm")

local ToggleFarmChest = Tabs.Item:AddToggle("ToggleFarmChest", {Title = "Auto Farm Chest[Tween]", Default = false})
ToggleFarmChest:OnChanged(
    function(Value)
        _G.AutoCollectChest = Value
    end
)
Options.ToggleFarmChest:SetValue(false)
spawn(
    function()
        while wait() do
            if _G.AutoCollectChest then
                local v673 = game:GetService("Players")
                local v674 = v673.LocalPlayer
                local v675 = v674.Character or v674.CharacterAdded:Wait()
                local v676 = v675:GetPivot().Position
                local v677 = game:GetService("CollectionService")
                local v678 = v677:GetTagged("_ChestTagged")
                local v679, v680 = math.huge
                for v765 = 1, #v678 do
                    local v766 = v678[v765]
                    local v767 = (v766:GetPivot().Position - v676).Magnitude
                    if (not v766:GetAttribute("IsDisabled") and (v767 < v679)) then
                        v679, v680 = v767, v766
                    end
                end
                if v680 then
                    local v840 = v680:GetPivot().Position
                    local v841 = CFrame.new(v840)
                    Tween2(v841)
                end
            end
        end
    end
)

local ToggleFarmChestBP = Tabs.Item:AddToggle("ToggleFarmChestBP", {Title = "Auto Farm Chest[Bypass]", Default = false})
ToggleFarmChestBP:OnChanged(
    function(v488)
        _G.ChestBypass = v488;
    end
)
Options.ToggleFarmChestBP:SetValue(false)
spawn(function()
	while wait() do
		if _G.ChestBypass then
			local v1996 = game:GetService("Players");
			local v1997 = v1996.LocalPlayer;
			local v1998 = game:GetService("CollectionService");
			local v1999 = v1997.Character or v1997.CharacterAdded:Wait() ;
			local v2000 = tick();
			while (tick() - v2000) < 4  do
				v1999 = v1997.Character or v1997.CharacterAdded:Wait() ;
				local v2090 = v1999:GetPivot().Position;
				local v2091 = v1998:GetTagged("_ChestTagged");
				local v2092, v2093 = math.huge;
				for v2150 = 1, #v2091 do
					local v2151 = v2091[v2150];
					local v2152 = (v2151:GetPivot().Position - v2090).Magnitude;
					if ( not v2151:GetAttribute("IsDisabled") and (v2152 < v2092)) then
						v2092, v2093 = v2152, v2151;
					end
				end
				if v2093 then
					local v2220 = v2093:GetPivot().Position;
					v1999:PivotTo(CFrame.new(v2220));
					wait(0.2);
				else
					break;
				end
			end
			if v1997.Character then
				v1997.Character:BreakJoints();
				v1997.CharacterAdded:Wait();
			end
		end
	end
end);

local ChestStop =
    Tabs.Item:AddToggle("ChestStop", {Title = "Stop When Have God's Chalice& Fist Of Darkness", Default = false})
ChestStop:OnChanged(
    function(Value)
        getgenv().StopChest = Value
    end
)
spawn(
    function()
        while wait(0.5) do
            if getgenv().StopChest then
                local player = game.Players.LocalPlayer
                if not player then
                    task.wait(0.5)
                    return
                end
                local backpack = player:FindFirstChild("Backpack")
                local character = player.Character
                if backpack and character then
                    if
                        backpack:FindFirstChild("Fist of Darkness") or character:FindFirstChild("Fist of Darkness") or
                            backpack:FindFirstChild("God's Chalice") or
                            character:FindFirstChild("God's Chalice")
                     then
                        _G.AutoCollectChest = false
                        if ToggleFarmChest and typeof(ToggleFarmChest.Set) == "function" then
                            ToggleFarmChest:Set(false)
                        end
                        break
                    end
                end
            end
        end
    end
)

local boss = Tabs.Item:AddSection("Boss-Item Farm")

local Cyborg = Tabs.Item:AddToggle("Cyborg", {Title = "Auto Get Cyborg Race", Description = "", Default = false })
Cyborg:OnChanged(function(Value)
    getgenv().AutoCyborg = Value
end)
spawn(function()
    pcall(function()
        while task.wait(0.5) do
            if getgenv().AutoCyborg then
                if not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Microchip") 
                and not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Microchip") 
                and not game:GetService("Workspace").Enemies:FindFirstChild("Order") 
                and not game:GetService("ReplicatedStorage"):FindFirstChild("Order") then
                    wait(0.3)
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Microchip", "1")
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Microchip", "2")
                end
            end
        end
    end)
end)
spawn(function()
    pcall(function()
        while task.wait(0.5) do
            if getgenv().AutoCyborg then
                if not game:GetService("Workspace").Enemies:FindFirstChild("Order") 
                and not game:GetService("ReplicatedStorage"):FindFirstChild("Order") then
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Microchip") 
                    or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Microchip") then
                        fireclickdetector(
                            game:GetService("Workspace").Map.CircleIsland.RaidSummon.Button.Main.ClickDetector
                        )
                    end
                end                
                if game:GetService("ReplicatedStorage"):FindFirstChild("Order") 
                or game:GetService("Workspace").Enemies:FindFirstChild("Order") then
                    if game:GetService("Workspace").Enemies:FindFirstChild("Order") then
                        for _, i in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if i.Name == "Order" then
                                repeat 
                                    task.wait(0.1)
                                    AutoHaki()
                                    EquipWeapon(SelectWeapon)
                                    Tween2(i.HumanoidRootPart.CFrame * Pos)
                                    i.HumanoidRootPart.CanCollide = false
                                    i.HumanoidRootPart.Size = Vector3.new(120, 120, 120)
                                until not i.Parent or i.Humanoid.Health <= 0 or getgenv().AutoCyborg == false
                            end
                        end
                    elseif game:GetService("ReplicatedStorage"):FindFirstChild("Order") then
                        Tween2(CFrame.new(-6217.2021484375, 28.047645568848, -5053.1357421875))
                    end
                end
            end
        end
    end)
end)

local Ghoul = Tabs.Item:AddToggle("Ghoul", {Title = "Auto Get Ghoul Race", Default = false })
Ghoul:OnChanged(function(Value)
    getgenv().AutoGhoul = Value
end)
spawn(function()
    while task.wait(0.1) do
        if not getgenv().AutoGhoul then break end
        local enemies = game:GetService("Workspace").Enemies
        local cursedCaptain = enemies:FindFirstChild("Cursed Captain")
        if cursedCaptain and cursedCaptain:FindFirstChild("Humanoid") and cursedCaptain:FindFirstChild("HumanoidRootPart") then
            local humanoid = cursedCaptain.Humanoid
            local rootPart = cursedCaptain.HumanoidRootPart
            if humanoid.Health > 0 then
                rootPart.CanCollide = false
                humanoid.WalkSpeed = 0
                rootPart.Size = Vector3.new(50,50,50)
                repeat
                    task.wait(0.05)
                    AutoHaki()
                    EquipWeapon(SelectWeapon)
                    Tween2(rootPart.CFrame * CFrame.new(0, 10, 0))
                    sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", 1000)
                until not getgenv().AutoGhoul or humanoid.Health <= 0 or not cursedCaptain.Parent
            end
        else
            local storageCaptain = game:GetService("ReplicatedStorage"):FindFirstChild("Cursed Captain")
            if storageCaptain then
                Tween2(storageCaptain.HumanoidRootPart.CFrame * CFrame.new(5,10,2))
            end
        end
    end
end)
Tabs.Item:AddParagraph({
     Title = "Farm Boss Prenium",
     Content = string.rep("-", 30)
})
local Ripindra = Tabs.Item:AddToggle("Ripindra", {Title = "Kill Rip Indra", Default = false })
Ripindra:OnChanged(function(Value)
    getgenv().AutoRipIndra = Value
end)
spawn(function()
    pcall(function()
        while task.wait(1) do
            if getgenv().AutoRipIndra and Third_Sea then
                local enemies = game:GetService("Workspace").Enemies
                local player = game:GetService("Players").LocalPlayer                
                if enemies:FindFirstChild("rip_indra True Form") or enemies:FindFirstChild("rip_indra") then
                    for _, v in pairs(enemies:GetChildren()) do
                        if (v.Name == "rip_indra True Form" or v.Name == "rip_indra") and v.Humanoid.Health > 0 and v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
                            repeat
                                task.wait(0.3)
                                pcall(function()
                                    AutoHaki()
                                    EquipWeapon(SelectWeapon)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.Humanoid.WalkSpeed = 0
                                    Tween2(v.HumanoidRootPart.CFrame * Pos)
                                end)
                            until getgenv().AutoRipIndra == false or v.Humanoid.Health <= 0
                        end
                    end
                elseif player.Backpack:FindFirstChild("God's Chalice") or player.Character:FindFirstChild("God's Chalice") then
                    repeat
                        task.wait(0.3)
                        Tween2(CFrame.new(-5563.75048828125, 320.4276123046875, -2662.509521484375))
                        EquipWeapon("God's Chalice")
                    until not (player.Backpack:FindFirstChild("God's Chalice") or player.Character:FindFirstChild("God's Chalice"))
                elseif game:GetService("ReplicatedStorage"):FindFirstChild("rip_indra True Form") then
                    local ripIndraTrueForm = game:GetService("ReplicatedStorage"):FindFirstChild("rip_indra True Form")
                    Tween2(ripIndraTrueForm.HumanoidRootPart.CFrame * Pos)
                end
            end
        end
    end)
end)
local Soul = Tabs.Item:AddToggle("Soul", {Title = "Kill Soul Reaper", Default = false })
Soul:OnChanged(function(Value)
    getgenv().AutoSoulReaper = Value
end)
spawn(function()
    while true do
        if getgenv().AutoSoulReaper and Third_Sea then
            pcall(function()
                local workspaceEnemies = game:GetService("Workspace").Enemies
                local replicatedStorage = game:GetService("ReplicatedStorage")
                local player = game:GetService("Players").LocalPlayer
                local backpack = player.Backpack
                local character = player.Character
                local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
                if workspaceEnemies:FindFirstChild("Soul Reaper") then
                    for _, v in pairs(workspaceEnemies:GetChildren()) do
                        if string.find(v.Name, "Soul Reaper") then
                            repeat 
                                task.wait(0.1)
                                AutoHaki()
                                EquipWeapon(SelectWeapon)
                                Tween2(v.HumanoidRootPart.CFrame * Pos)
                                v.HumanoidRootPart.CanCollide = false
                                v.Humanoid.WalkSpeed = 0
                                v.HumanoidRootPart.Transparency = 1
                            until v.Humanoid.Health <= 0 or not getgenv().AutoSoulReaper
                        end
                    end
                elseif backpack:FindFirstChild("Hallow Essence") or character:FindFirstChild("Hallow Essence") then
                    local targetPosition = CFrame.new(-8932.322265625, 146.83154296875, 6062.55078125)
                    repeat
                        Tween2(targetPosition)
                        task.wait(0.1)
                    until (targetPosition.Position - humanoidRootPart.Position).Magnitude <= 8
                    EquipWeapon("Hallow Essence")
                else
                    local soulReaper = replicatedStorage:FindFirstChild("Soul Reaper")
                    if soulReaper then
                        Tween2(soulReaper.HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                    end
                end
            end)
        end
        task.wait(0.1)
    end
end)

local DoughKing = Tabs.Item:AddToggle("DoughKing", {Title = "Kill Dough King", Default = false })
DoughKing:OnChanged(function(Value)
    getgenv().AutoDoughKing = Value
end)
spawn(function()
    game:GetService("RunService").Heartbeat:Connect(function()
        pcall(function()
            for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                if getgenv().AutoDoughKing and StartCakegetgenv().StartMagnet and 
                   (v.Name == "Cookie Crafter" or v.Name == "Cake Guard" or v.Name == "Baking Staff" or v.Name == "Head Baker") and 
                   (v.HumanoidRootPart.Position - POSCAKE.Position).magnitude <= 300 then
                    v.HumanoidRootPart.CFrame = POSCAKE
                    v.HumanoidRootPart.CanCollide = false
                    if v.Humanoid:FindFirstChild("Animator") then
                        v.Humanoid.Animator:Destroy()
                    end
                    sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                end
            end
        end)
    end)
end)
spawn(function()
    while task.wait(0.1) do
        if getgenv().AutoDoughKing and Third_Sea then
            pcall(function()
                if game.Players.LocalPlayer.Backpack:FindFirstChild("God's Chalice") or 
                   game.Players.LocalPlayer.Character:FindFirstChild("God's Chalice") then
                    if string.find(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SweetChaliceNpc"), "Where") then
                        game.StarterGui:SetCore("SendNotification", {
                            Title = "UUltimatLY Hub Notification",
                            Text = "Not Have Enough Material",
                            Icon = "http://www.roblox.com/asset/?id=113653485299271",
                            Duration = 2.5
                        })
                    else
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SweetChaliceNpc")
                    end
                elseif game.Players.LocalPlayer.Backpack:FindFirstChild("Sweet Chalice") or 
                       game.Players.LocalPlayer.Character:FindFirstChild("Sweet Chalice") then
                    if string.find(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"), 
                                   "Do you want to open the portal now?") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")
                    else
                        if game.Workspace.Enemies:FindFirstChild("Baking Staff") or 
                           game.Workspace.Enemies:FindFirstChild("Head Baker") or 
                           game.Workspace.Enemies:FindFirstChild("Cake Guard") or 
                           game.Workspace.Enemies:FindFirstChild("Cookie Crafter") then
                            for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do  
                                if (v.Name == "Baking Staff" or v.Name == "Head Baker" or 
                                    v.Name == "Cake Guard" or v.Name == "Cookie Crafter") and 
                                    v.Humanoid.Health > 0 then
                                    repeat
                                        task.wait(0.05)
                                        AutoHaki()
                                        EquipWeapon(SelectWeapon)
                                        POSCAKE = v.HumanoidRootPart.CFrame
                                        Tween2Tween2(v.HumanoidRootPart.CFrame * Pos)
                                    until getgenv().AutoDoughKing == false or 
                                          game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince") or 
                                          not v.Parent or 
                                          v.Humanoid.Health <= 0
                                end
                            end
                        else
                            Tween2(CFrame.new(-1820.063, 210.748, -12297.496))
                        end
                    end
                elseif game.ReplicatedStorage:FindFirstChild("Dough King") or 
                       game:GetService("Workspace").Enemies:FindFirstChild("Dough King") then
                    if game:GetService("Workspace").Enemies:FindFirstChild("Dough King") then
                        for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do 
                            if v.Name == "Dough King" then
                                repeat
                                    task.wait(0.05)
                                    AutoHaki()
                                    EquipWeapon(SelectWeapon)
                                    v.HumanoidRootPart.CanCollide = false
                                    Tween2(v.HumanoidRootPart.CFrame * Pos)
                                until getgenv().AutoDoughKing == false or 
                                      not v.Parent or 
                                      v.Humanoid.Health <= 0
                            end    
                        end    
                    else
                        Tween2(CFrame.new(-2009.280, 4532.972, -14937.308))
                    end
                elseif game.Players.LocalPlayer.Backpack:FindFirstChild("Red Key") or 
                       game.Players.LocalPlayer.Character:FindFirstChild("Red Key") then
                    local args = {
                        [1] = "CakeScientist",
                        [2] = "Check"
                    }
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                else
                    if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                        if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Diablo") or 
                           string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Deandre") or 
                           string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Urban") then
                            if game:GetService("Workspace").Enemies:FindFirstChild("Diablo") or 
                               game:GetService("Workspace").Enemies:FindFirstChild("Deandre") or 
                               game:GetService("Workspace").Enemies:FindFirstChild("Urban") then
                                for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                    if v.Name == "Diablo" or v.Name == "Deandre" or v.Name == "Urban" then
                                        if v:FindFirstChild("Humanoid") and 
                                           v:FindFirstChild("HumanoidRootPart") and 
                                           v.Humanoid.Health > 0 then
                                            repeat
                                                task.wait(0.05)
                                                AutoHaki()
                                                EquipWeapon(SelectWeapon)    
                                                v.HumanoidRootPart.CanCollide = false
                                                v.Humanoid.WalkSpeed = 0
                                                Tween2(v.HumanoidRootPart.CFrame * Pos)                                                    
                                                sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                                            until getgenv().AutoDoughKing == false or 
                                                  v.Humanoid.Health <= 0 or 
                                                  not v.Parent or 
                                                  game.Players.LocalPlayer.Backpack:FindFirstChild("God's Chalice") or 
                                                  game.Players.LocalPlayer.Character:FindFirstChild("God's Chalice")
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)
local DarkBe = Tabs.Item:AddToggle("DarkBe", {Title = "Kill Darkbeard", Default = false })
DarkBe:OnChanged(function(Value)
    getgenv().AutoDarkbeard = Value
end)
spawn(function()
    while task.wait(0.1) do
        if getgenv().AutoDarkbeard and Second_Sea then
            pcall(function()
                local enemies = game:GetService("Workspace").Enemies
                local player = game:GetService("Players").LocalPlayer
                if enemies:FindFirstChild("Darkbeard") then
                    for _, v in pairs(enemies:GetChildren()) do
                        if v.Name == "Darkbeard" and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                            repeat
                                task.wait(0.05)
                                AutoHaki()
                                EquipWeapon(SelectWeapon)
                                v.HumanoidRootPart.CanCollide = false
                                v.Humanoid.WalkSpeed = 0           
                                Tween2(v.HumanoidRootPart.CFrame * Pos)
                            until not getgenv().AutoDarkbeard or not v.Parent or v.Humanoid.Health <= 0
                        end
                    end
                elseif player.Backpack:FindFirstChild("Fist of Darkness") or player.Character:FindFirstChild("Fist of Darkness") then
                    repeat
                        task.wait(0.1)
                        Tween2(CFrame.new(3778.584, 15.791, -3499.404))
                        EquipWeapon("Fist of Darkness")
                    until not getgenv().AutoDarkbeard
                elseif game:GetService("ReplicatedStorage"):FindFirstChild("Darkbeard") then
                    Tween2(game:GetService("ReplicatedStorage"):FindFirstChild("Darkbeard").HumanoidRootPart.CFrame * Pos)
                end
            end)
        end
    end
end)
Tabs.Item:AddParagraph({
     Title = "Farm Observation",
     Content = string.rep("-", 30)
})
local ObservationRange = Tabs.Item:AddParagraph({
    Title = "Observation Level",
    Content = ""
})
spawn(function()
    local lastValue = game:GetService("Players").LocalPlayer.VisionRadius.Value
    while wait(0.1) do
        pcall(function()
            local currentValue = game:GetService("Players").LocalPlayer.VisionRadius.Value
            if currentValue ~= lastValue then
                ObservationRange:SetDesc("Observation Range Level: " .. math.floor(currentValue))
                lastValue = currentValue
            end
        end)
    end
end)
local Kenv2 = Tabs.Item:AddToggle("Kenv2", {Title = "Auto UP Observation V2", Default = false })
Kenv2:OnChanged(function(Value)
    getgenv().AutoObservationHakiV2 = Value
end)    
spawn(function()
    local lastUpdateTime = tick()
    while task.wait(0.1) do
        pcall(function()
            if getgenv().AutoObservationHakiV2 and World3 then
                if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                    if tick() - lastUpdateTime >= 1 then
                        Tweem2(CFrame.new(-12444.78515625, 332.40396118164, -7673.1806640625))
                        lastUpdateTime = tick()
                    end
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress", "Citizen")
                    task.wait(1)
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", "CitizenQuest", 1)
                else
                    if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Defeat 50 Forest Pirates") then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Forest Pirate") then
                            for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == "Forest Pirate" then
                                    repeat
                                        if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
                                        end
                                        EquipWeapon(SelectWeapon)
                                        Tween2(v.HumanoidRootPart.CFrame * Pos)
                                        PosHee = v.HumanoidRootPart.CFrame
                                        v.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                    until getgenv().AutoObservationHakiV2 == false or v.Humanoid.Health <= 0
                                end
                            end
                        end
                    elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text == "Defeat Captain Elephant (0/1)" then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Captain Elephant") then
                            for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == "Captain Elephant" then
                                    repeat
                                        if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
                                        end
                                        EquipWeapon(SelectWeapon)
                                        Tween2(v.HumanoidRootPart.CFrame * Pos)
                                        if sethiddenproperty then
                                            sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                                        end
                                        v.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                    until getgenv().AutoObservationHakiV2 == false or v.Humanoid.Health <= 0
                                end
                            end
                        end
                    end
                end
                if game.Players.LocalPlayer.Backpack:FindFirstChild("Banana") and 
                    game.Players.LocalPlayer.Backpack:FindFirstChild("Apple") and 
                    game.Players.LocalPlayer.Backpack:FindFirstChild("Pineapple") then
                    if tick() - lastUpdateTime >= 1 then
                        Tweem2(CFrame.new(-12444.78515625, 332.40396118164, -7673.1806640625))
                        lastUpdateTime = tick()
                    end
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress", "Citizen")
                elseif game.Players.LocalPlayer.Backpack:FindFirstChild("Fruit Bowl") or 
                        game.Players.LocalPlayer.Character:FindFirstChild("Fruit Bowl") then
                    if tick() - lastUpdateTime >= 1 then
                        Tweem2(CFrame.new(-10920.125, 624.20275878906, -10266.995117188))
                        lastUpdateTime = tick()
                    end
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenTalk2", "Start")
                    task.wait(1)
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenTalk2", "Buy")
                end
            end
        end)
    end
end)
spawn(function()
    local lastUpdate = tick()
    while true do
        task.wait(0.1)
        pcall(function()
            if getgenv().AutoObservationHakiV2 and World3 then
                if sethiddenproperty then
                    if tick() - lastUpdate >= 1 then
                        sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                        lastUpdate = tick()
                    end
                end
            end
        end)
    end
end)
spawn(function()
    game:GetService("RunService").Heartbeat:Connect(function()
        pcall(function()
            if getgenv().AutoObservationHakiV2 and World3 then
                local character = game:GetService("Players").LocalPlayer.Character
                if character and character:FindFirstChild("Humanoid") then
                    local humanoid = character.Humanoid
                    if humanoid:GetState() ~= Enum.HumanoidStateType.Physics then
                        humanoid:ChangeState(Enum.HumanoidStateType.Physics)
                    end
                end
            end
        end)
    end)
end)
spawn(function()
    pcall(function()
        game:GetService("RunService").Heartbeat:Connect(function()
            task.wait(0.1)
            if getgenv().AutoObservationHakiV2 and getgenv().StartMagnet then
                local enemies = game.Workspace.Enemies:GetChildren()
                for i, v in ipairs(enemies) do
                    if v.Name == "Forest Pirate" and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                        local humanoidRootPart = v.HumanoidRootPart
                        if humanoidRootPart.CanCollide ~= false then
                            humanoidRootPart.CanCollide = false
                        end
                        if humanoidRootPart.Size ~= Vector3.new(50, 50, 50) then
                            humanoidRootPart.Size = Vector3.new(50, 50, 50)
                        end
                        if humanoidRootPart.CFrame ~= PosHee then
                            humanoidRootPart.CFrame = PosHee
                        end
                    end
                end
            end
        end)
    end)
end)
spawn(function()
    game:GetService("RunService").Heartbeat:Connect(function()
        pcall(function()
            if getgenv().AutoObservationHakiV2 and getgenv().StartMagnet then
                CheckQuest()
                local enemies = game.Workspace.Enemies:GetChildren()
                for i, v in ipairs(enemies) do
                    if v.Name == Ms and v:FindFirstChild("Humanoid") then
                        local humanoid = v.Humanoid
                        if humanoid.Health > 0 then
                            humanoid:ChangeState(11)
                            task.wait(0.1)
                            humanoid:ChangeState(14)
                        end
                    end
                end
            end
        end)
    end)
end)
local FarmKen = Tabs.Item:AddToggle("FarmKen", {Title = "Farm Observation", Default = false })
FarmKen:OnChanged(function(Value)
    getgenv().AutoObservation = Value
end)
spawn(function()
    pcall(function()
        while task.wait(0.1) do
            if getgenv().AutoObservation then
                if game:GetService("Players").LocalPlayer.VisionRadius.Value >= 5000 then
                    Alert:create("You Have Max Points")
                    task.wait(1)
                else
                    local enemyName, spawnPos
                    local player = game:GetService("Players").LocalPlayer
                    local workspaceEnemies = game:GetService("Workspace").Enemies
                    local gui = player.PlayerGui.ScreenGui
                    if Second_Sea then
                        enemyName = "Lava Pirate [Lv. 1200]"
                        spawnPos = CFrame.new(-5478.39209, 15.9775667, -5246.9126)
                    elseif First_Sea then
                        enemyName = "Galley Captain"
                        spawnPos = CFrame.new(5533.29785, 88.1079102, 4852.3916)
                    elseif Third_Sea then
                        enemyName = "Venomous Assailant"
                        spawnPos = CFrame.new(4638.78564453125, 1078.94091796875, 881.8002319335938)
                    end
                    local enemy = workspaceEnemies:FindFirstChild(enemyName)
                    if enemy then
                        if gui:FindFirstChild("ImageLabel") then
                            repeat
                                task.wait(0.1)
                                player.Character.HumanoidRootPart.CFrame = enemy.HumanoidRootPart.CFrame * CFrame.new(3, 0, 0)
                            until not getgenv().AutoObservation or not gui:FindFirstChild("ImageLabel")
                        else
                            repeat
                                task.wait(0.1)
                                player.Character.HumanoidRootPart.CFrame = enemy.HumanoidRootPart.CFrame * CFrame.new(0, 50, 0)
                                if not gui:FindFirstChild("ImageLabel") and getgenv().AutoObservation_Hop then
                                    game:GetService("TeleportService"):Teleport(game.PlaceId, player)
                                end
                            until not getgenv().AutoObservation or gui:FindFirstChild("ImageLabel")
                        end
                    else
                        Tweem2(spawnPos)
                    end
                end
            end
        end
    end)
end)
-------------------------------------------------Tab Volcano----------------------------------------------------------------------------------
local PlayersService = game:GetService("Players")
local RunService = game:GetService("RunService")
local VirtualInput = game:GetService("VirtualInputManager")
local Workspace = game:GetService("Workspace")
local BoatSpeed = 500

local SpeedBoatSlider =
    Tabs.Volcanic:AddSlider(
    "SliderSpeedBoat",
    {
        Title = "Speed Boat",
        Description = "",
        Default = BoatSpeed,
        Min = 0,
        Max = 350,
        Rounding = 1,
        Callback = function(value)
            BoatSpeed = value
        end
    }
)

SpeedBoatSlider:SetValue(BoatSpeed)

local AutoFindPrehistoricToggle =
    Tabs.Volcanic:AddToggle(
    "AutoFindPrehistoric",
    {
        Title = "Auto Find Prehistoric Island",
        Description = "",
        Default = false
    }
)

Options.AutoFindPrehistoric:SetValue(false)
AutoFindPrehistoricToggle:OnChanged(
    function(state)
        _G.AutoFindPrehistoric = state
    end
)

local AvailableSeats = {}
local IsFindingBoat = false
local IslandFound = false

RunService.RenderStepped:Connect(
    function()
        if not _G.AutoFindPrehistoric then
            IslandFound = false
            return
        end

        local LocalPlayer = PlayersService.LocalPlayer
        local Character = LocalPlayer.Character
        if not Character or not Character:FindFirstChild("Humanoid") then
            return
        end

        local function FindAndMoveToBoat()
            if IsFindingBoat then
                return
            end
            IsFindingBoat = true

            for _, seat in pairs(AvailableSeats) do
                if seat and seat.Parent and seat.Name == "VehicleSeat" and not seat.Occupant then
                    Tween2(seat.CFrame)
                    break
                end
            end

            IsFindingBoat = false
        end

        local Humanoid = Character.Humanoid
        local OnBoat = false
        local CurrentSeat = nil

        for _, boat in pairs(Workspace.Boats:GetChildren()) do
            local Seat = boat:FindFirstChild("VehicleSeat")
            if Seat and Seat.Occupant == Humanoid then
                OnBoat = true
                CurrentSeat = Seat
                AvailableSeats[boat.Name] = Seat
            elseif Seat and not Seat.Occupant then
                FindAndMoveToBoat()
            end
        end

        if not OnBoat then
            return
        end

        CurrentSeat.MaxSpeed = BoatSpeed
        CurrentSeat.CFrame =
            CFrame.new(Vector3.new(CurrentSeat.Position.X, CurrentSeat.Position.Y, CurrentSeat.Position.Z)) *
            CurrentSeat.CFrame.Rotation
        VirtualInput:SendKeyEvent(true, "W", false, game)

        for _, part in pairs(Workspace.Boats:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end

        for _, part in pairs(Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end

        local IslandNames = {
            "ShipwreckIsland",
            "SandIsland",
            "TreeIsland",
            "TinyIsland",
            "MysticIsland",
            "KitsuneIsland",
            "FrozenDimension"
        }

        for _, islandName in ipairs(IslandNames) do
            local Island = Workspace.Map:FindFirstChild(islandName)
            if Island and Island:IsA("Model") then
                Island:Destroy()
            end
        end

        local PrehistoricIsland = Workspace.Map:FindFirstChild("PrehistoricIsland")
        if PrehistoricIsland then
            VirtualInput:SendKeyEvent(false, "W", false, game)
            _G.AutoFindPrehistoric = false

            if not IslandFound then
                Fluent:Notify(
                    {
                        Title = "Prehistoric Island Spawn",
                        Content = "UUltimatLY Hub Notification",
                        Duration = 10
                    }
                )
                IslandFound = true
            end

            return
        end
    end
)

local Gojo = Tabs.Volcanic:AddSection("Dojo Quest")

local CheckQuestGojo = Tabs.Volcanic:AddParagraph({
    Title = "Status Quest Dojo",
    Content = "Status|",
});
spawn(function()
    pcall(function()
        while wait() do
            local v654 = {
                [1] = {
                    Context = "Check"
                }
            };
            local v655 = game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RF/DragonHunter"):InvokeServer(unpack(v654));
            if (typeof(v655) == "table") then
                for v877, v878 in pairs(v655) do
                    if (v878 == "Defeat 3 Venomous Assailants On Hydra Island.") then
                        CheckQuestGojo:SetDesc("Defeat 3 Venomous Assailants On Hydra Island.");
                    elseif (v878 == "Defeat 3 Hydra Enforcers On Hydra Island.") then
                        CheckQuestGojo:SetDesc("Defeat 3 Hydra Enforcers On Hydra Island.");
                    elseif (v878 == "Destroy 10 Trees On Hydra Island.") then
                        CheckQuestGojo:SetDesc("Destroy 10 trees on Hydra Island.");
                    end
                end
            else
                print(v655);
            end
        end
    end);
end);

local ToogleDojoQ = Tabs.Volcanic:AddToggle("ToogleDojoQ", {Title = "Tele To Dojo Trainer", Default = false })
ToogleDojoQ:OnChanged(function(Value)
    getgenv().DojoClaimQuest = Value
	end
)
Options.ToogleDojoQ:SetValue(false)

local DojoQuestNpc = CFrame.new(5855.19629, 1208.32178, 872.713501, 0.606994748, -1.81058823e-09, -0.794705868, 5.72712722e-09, 1, 2.09605577e-09, 0.794705868, -5.82367621e-09, 0.606994748)
spawn(function()
    while wait(0.2) do
        if getgenv().DojoClaimQuest and Third_Sea then
            pcall(function()
                if BypassTP then
                    BTP(DojoQuestNpc)
                else
                    Tween2(DojoQuestNpc)
                end
                local distance = (DojoQuestNpc.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                if distance <= 5 then
                    local Sibidi = {
                        ["NPC"] = "Dojo Trainer",
                        ["Command"] = "ClaimQuest"
                    }
                    game:GetService("ReplicatedStorage").Modules.Net["RF/InteractDragonQuest"]:InvokeServer(Sibidi)
                    wait(1)
                    local requestQuestTable = {
                        ["NPC"] = "Dojo Trainer",
                        ["Command"] = "RequestQuest"
                    }
                    game:GetService("ReplicatedStorage").Modules.Net["RF/InteractDragonQuest"]:InvokeServer(requestQuestTable)
                end
            end)
        end
    end
end)

local UpdTalon = Tabs.Volcanic:AddToggle("UpdTalon", {Title = "Auto Update Dragon Talon", Default = false })
UpdTalon:OnChanged(function(Value)
    getgenv().DragonTalonUpgrade = Value
	end)	
Options.UpdTalon:SetValue(false)

spawn(function()
    while wait(0.2) do
        if getgenv().DragonTalonUpgrade and Third_Sea then
            local UzothNPC = CFrame.new(5661.89014, 1211.31909, 864.836731, 0.811413169, -1.36805838e-08, -0.584473014, 4.75227395e-08, 1, 4.25682458e-08, 0.584473014, -6.23161966e-08, 0.811413169)
            local distance = (UzothNPC.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
            if distance > 5 then
                Tween2(UzothNPC)
            else
                local ohTable1 = {
                    ["NPC"] = "Uzoth",
                    ["Command"] = "Upgrade"
                }                
                game:GetService("ReplicatedStorage").Modules.Net["RF/InteractDragonQuest"]:InvokeServer(ohTable1)
            end
        end
    end
end)

local AutoDragonHunter =
    Tabs.Volcanic:AddToggle("AutoDragonHunter", {Title = "Auto Dragon Hunter Quest", Default = false})

AutoDragonHunter:OnChanged(
    function(Value)
        _G.AutoDragonHunter = Value
    end
)

Options.AutoDragonHunter:SetValue(false)

spawn(
    function()
        while wait(0.2) do
            if _G.AutoDragonHunter and Third_Sea then
                local DragonHunterNPC =
                    CFrame.new(
                    5861.5517578125,
                    1209.9515380859375,
                    810.2301025390625,
                    0.7272793054580688,
                    -0.08736011385917664,
                    0.6807591319084167,
                    0.138326957821846,
                    0.9901700019836426,
                    -0.020713597536087036,
                    -0.6722577214241028,
                    0.10923191159963608,
                    0.7322143912315369
                )

                local Distance =
                    (DragonHunterNPC.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude

                if Distance > 5 then
                    Tween2(DragonHunterNPC)
                else
                     local Skibidi = {
                        [1] = "Dragon Hunter",
                        [2] = "2"
                    }
                    game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RF/DragonHunter"):InvokeServer(unpack(Skibidi));
                    local Sbidiki = {
                        ["NPC"] = "Dragon Hunter",
                        ["Command"] = "RequestQuest"
                    }
                    game:GetService("ReplicatedStorage").Modules.Net["RF/DragonHunter"]:InvokeServer(Sbidiki)
                end
            end
        end
    end
)

local AutoHydraEnforcer =
    Tabs.Volcanic:AddToggle("AutoEmber", {Title = "Attack Hydra Enforcer", Default = false})
AutoHydraEnforcer:OnChanged(
    function(Value)
        _G.AutoHydraEnforcer = Value
    end
)
spawn(
    function()
        while wait(0.2) do
            if _G.AutoHydraEnforcer and Third_Sea then
                pcall(
                    function()
                        local playerRoot = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                        local ghost = game:GetService("Workspace").Enemies:FindFirstChild("Ghost")
                        local hydraEnforcer = game:GetService("Workspace").Enemies:FindFirstChild("Hydra Enforcer")
                        if ghost or hydraEnforcer then
                            for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == "Hydra Enforcer" then
                                    if
                                        v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and
                                            v.Humanoid.Health > 0
                                     then
                                        repeat
                                            game:GetService("RunService").Heartbeat:wait()
                                            AutoHaki()
                                            EquipTool(SelectWeapon)
                                            Tween2(v.HumanoidRootPart.CFrame * Pos)
                                            v.HumanoidRootPart.CanCollide = false
			                    v.Humanoid.WalkSpeed = 0
			                    v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
		                          until not _G.AutoHydraEnforcer or v.Humanoid.Health <= 0
                                    end
                                end
                            end
                        else
                            Tween2(
                                CFrame.new(
                                    5394.36475,
                                    1082.71057,
                                    561.993958,
                                    -0.62453711,
                                    3.17826405e-08,
                                    -0.780995131,
                                    6.77530991e-08,
                                    1,
                                    -1.34849545e-08,
                                    0.780995131,
                                    -6.13366922e-08,
                                    -0.62453711
                                )
                            )
                        end
                    end
                )
            end
        end
    end
)

local AutoVenomousAssailant =
    Tabs.Volcanic:AddToggle("AutoEmber", {Title = "Attack Venomous Assailant", Default = false})
AutoVenomousAssailant:OnChanged(
    function(Value)
        _G.AutoVenomousAssailant = Value
    end
)
spawn(
    function()
        while wait(0.2) do
            if _G.AutoVenomousAssailant and Third_Sea then
                pcall(
                    function()
                        local venomousAssailant = game:GetService("Workspace").Enemies:FindFirstChild("Venomous Assailant")
                        if ghost or venomousAssailant then
                            for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == "Venomous Assailant" then
                                    if
                                        v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and
                                            v.Humanoid.Health > 0
                                     then
                                        repeat
                                            game:GetService("RunService").Heartbeat:wait()
                                            AutoHaki()
                                            EquipTool(SelectWeapon)
                                            Tween2(v.HumanoidRootPart.CFrame * Pos)
                                            v.HumanoidRootPart.CanCollide = false
			                    v.Humanoid.WalkSpeed = 0
			                    v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
		                          until not _G.AutoVenomousAssailant or v.Humanoid.Health <= 0
                                    end
                                end
                            end
                        else
                            Tween2(
                                CFrame.new(
                                    5394.36475,
                                    1082.71057,
                                    561.993958,
                                    -0.62453711,
                                    3.17826405e-08,
                                    -0.780995131,
                                    6.77530991e-08,
                                    1,
                                    -1.34849545e-08,
                                    0.780995131,
                                    -6.13366922e-08,
                                    -0.62453711
                                )
                            )
                        end
                    end
                )
            end
        end
    end
)

local HydraTree =
    Tabs.Volcanic:AddToggle(
    "HydraTree",
    {
        Title = "Destroy Tree On Hydra Island",
        Description = "",
        Default = false
    }
)
HydraTree:OnChanged(
    function(v389)
        _G.AutoHydraTree = v389
    end
)
local function v161(v390)
    local v391 = game:GetService("VirtualInputManager")
    v391:SendKeyEvent(true, v390, false, game)
    v391:SendKeyEvent(false, v390, false, game)
end
local function SpamSkill(v392)
    local v393 = game.Players.LocalPlayer
    local v394 = v393.Backpack
    for v562, v563 in pairs(v394:GetChildren()) do
        if (v563:IsA("Tool") and (v563.ToolTip == v392)) then
            v563.Parent = v393.Character
            for v812, v813 in ipairs(
                {
                    "Z",
                    "X",
                    "C",
                    "V",
                    "F"
                }
            ) do
                wait()
                pcall(
                    function()
                        v161(v813)
                    end
                )
            end
            v563.Parent = v394
            break
        end
    end
end
local v163 = {
    CFrame.new(5288.61962890625, 1005.4000244140625, 392.43011474609375),
    CFrame.new(5343.39453125, 1004.1998901367188, 361.0687561035156),
    CFrame.new(5235.78564453125, 1004.1998901367188, 431.4530944824219),
    CFrame.new(5321.30615234375, 1004.1998901367188, 440.8951416015625),
    CFrame.new(5258.96484375, 1004.1998901367188, 345.5052490234375)
}
spawn(
    function()
        while wait() do
            if _G.AutoHydraTree then
                AutoHaki()
                for v814, v815 in ipairs(v163) do
                    if not _G.AutoHydraTree then
                        break
                    end
                    Tween2(v815)
                    wait()
                    local v816 = game.Players.LocalPlayer.Character
                    if (v816 and v816:FindFirstChild("HumanoidRootPart")) then
                        local v902 = (v816.HumanoidRootPart.Position - v815.Position).Magnitude
                        if (v902 <= 1) then
                            SpamSkill("Melee")
                            SpamSkill("Sword")
                            SpamSkill("Gun")
                        end
                    end
                end
            end
        end
    end
)

local Vocaniga = Tabs.Volcanic:AddSection("Volcano Event")

Tabs.Volcanic:AddButton({
    Title = "Auto Craft Volcanic Magnet",
    Callback = function()
        local craftvol = {
            [1] = "CraftItem",
            [2] = "Craft",
            [3] = "Volcanic Magnet"
        }
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(craftvol))
    end
})

local PrehisIsl = Tabs.Volcanic:AddToggle("PrehisIsl", {Title = "Tween To Prehistoric Island", Default = false })
PrehisIsl:OnChanged(function(Value)
    _G.TweenToPrehistoric = Value
end)
spawn(function()
    local island
    while not island do
        island = game:GetService("Workspace").Map:FindFirstChild("PrehistoricIsland")
        wait()
    end
    while wait() do
        if _G.TweenToPrehistoric and Third_Sea then
            local prehistoricIslandCore = game:GetService("Workspace").Map:FindFirstChild("PrehistoricIsland")
            if prehistoricIslandCore then
                local relic = prehistoricIslandCore:FindFirstChild("Core") and prehistoricIslandCore.Core:FindFirstChild("PrehistoricRelic")
                local skull = relic and relic:FindFirstChild("Skull")
                if skull then
                    Tween(CFrame.new(skull.Position))
                    _G.TweenToPrehistoric = false
                end
            end
        end
    end
end)

---------------------------------Tab Teleport----------------------------------
local Teleport = Tabs.Teleport:AddSection("Teleport")

Tabs.Teleport:AddButton(
    {
        Title = "TP To World 1",
        Description = "",
        Callback = function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelMain")
        end
    }
)

Tabs.Teleport:AddButton(
    {
        Title = "TP To World 2",
        Description = "",
        Callback = function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
        end
    }
)

Tabs.Teleport:AddButton(
    {
        Title = "TP To World 3",
        Description = "",
        Callback = function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
        end
    }
)

local Mastery = Tabs.Teleport:AddSection("Teleport Island")

if First_Sea then
    IslandList = {
        "WindMill",
        "Marine",
        "Middle Town",
        "Jungle",
        "Pirate Village",
        "Desert",
        "Snow Island",
        "MarineFord",
        "Colosseum",
        "Sky Island 1",
        "Sky Island 2",
        "Sky Island 3",
        "Prison",
        "Magma Village",
        "Under Water Island",
        "Fountain City",
        "Shank Room",
        "Mob Island"
    }
elseif Second_Sea then
    IslandList = {
        "The Cafe",
        "First Spot",
        "Dark Area",
        "Flamingo Mansion",
        "Flamingo Room",
        "Green Zone",
        "Factory",
        "Colosseum",
        "Zombie Island",
        "Snow Mountain",
        "Hot And Cold",
        "Cursed Ship",
        "Ice Castle",
        "Forgotten Island",
        "Ussop Island",
    }
elseif Third_Sea then
    IslandList = {
        "Mansion",
        "Port Town",
        "Great Tree",
        "Castle On The Sea",
        "Hydra Island",
        "Floating Turtle",
        "Haunted Castle",
        "Ice Cream Island",
        "Peanut Island",
        "Cake Island",
        "Cocoa Island",
        "Candy Island",
        "Tiki Outpost"
    }
end

local DropdownIsland =
    Tabs.Teleport:AddDropdown(
    "DropdownIsland",
    {
        Title = "Choose Island",
        Values = IslandList,
        Multi = false,
        Default = 1
    }
)

DropdownIsland:SetValue("...")
DropdownIsland:OnChanged(
    function(Value)
        _G.SelectIsland = Value
    end
)

local ToggleIsland = Tabs.Teleport:AddToggle("ToggleIsland", {Title = "Tween To Island", Default = false})
ToggleIsland:OnChanged(
    function(Value)
        _G.TeleportIsland = Value
        if _G.TeleportIsland == true then
            repeat
                wait()
                if _G.SelectIsland == "WindMill" then
                    toTarget(CFrame.new(979.79895019531, 16.516613006592, 1429.0466308594))
                elseif _G.SelectIsland == "Marine" then
                    toTarget(CFrame.new(-2566.4296875, 6.8556680679321, 2045.2561035156))
                elseif _G.SelectIsland == "Middle Town" then
                    toTarget(CFrame.new(-690.33081054688, 15.09425163269, 1582.2380371094))
                elseif _G.SelectIsland == "Jungle" then
                    toTarget(CFrame.new(-1612.7957763672, 36.852081298828, 149.12843322754))
                elseif _G.SelectIsland == "Pirate Village" then
                    toTarget(CFrame.new(-1181.3093261719, 4.7514905929565, 3803.5456542969))
                elseif _G.SelectIsland == "Desert" then
                    toTarget(CFrame.new(944.15789794922, 20.919729232788, 4373.3002929688))
                elseif _G.SelectIsland == "Snow Island" then
                    toTarget(CFrame.new(1347.8067626953, 104.66806030273, -1319.7370605469))
                elseif _G.SelectIsland == "MarineFord" then
                    toTarget(CFrame.new(-4914.8212890625, 50.963626861572, 4281.0278320313))
                elseif _G.SelectIsland == "Colosseum" then
                    toTarget(CFrame.new(-1427.6203613281, 7.2881078720093, -2792.7722167969))
                elseif _G.SelectIsland == "Sky Island 1" then
                    toTarget(CFrame.new(-4869.1025390625, 733.46051025391, -2667.0180664063))
                elseif _G.SelectIsland == "Sky Island 2" then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                        "requestEntrance",
                        Vector3.new(-4607.82275, 872.54248, -1667.55688)
                    )
                elseif _G.SelectIsland == "Sky Island 3" then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                        "requestEntrance",
                        Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047)
                    )
                elseif _G.SelectIsland == "Prison" then
                    toTarget(CFrame.new(4875.330078125, 5.6519818305969, 734.85021972656))
                elseif _G.SelectIsland == "Magma Village" then
                    toTarget(CFrame.new(-5247.7163085938, 12.883934020996, 8504.96875))
                elseif _G.SelectIsland == "Under Water Island" then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                        "requestEntrance",
                        Vector3.new(61163.8515625, 11.6796875, 1819.7841796875)
                    )
                elseif _G.SelectIsland == "Fountain City" then
                    toTarget(CFrame.new(5127.1284179688, 59.501365661621, 4105.4458007813))
                elseif _G.SelectIsland == "Shank Room" then
                    toTarget(CFrame.new(-1442.16553, 29.8788261, -28.3547478))
                elseif _G.SelectIsland == "Mob Island" then
                    toTarget(CFrame.new(-2850.20068, 7.39224768, 5354.99268))
                elseif _G.SelectIsland == "The Cafe" then
                    toTarget(CFrame.new(-385.2510070800781, 73.09505462646484, 280.3890075683594))
                elseif _G.SelectIsland == "First Spot" then
                    toTarget(CFrame.new(-11.311455726624, 29.276733398438, 2771.5224609375))
                elseif _G.SelectIsland == "Dark Area" then
                    toTarget(CFrame.new(3780.0302734375, 22.652164459229, -3498.5859375))
                elseif _G.SelectIsland == "Flamingo Mansion" then
                    BTPZ(CFrame.new(-483.73370361328, 332.0383605957, 595.32708740234))
                elseif _G.SelectIsland == "Flamingo Room" then
                    toTarget(CFrame.new(2284.4140625, 15.152037620544, 875.72534179688))
                elseif _G.SelectIsland == "Green Zone" then
                    toTarget(CFrame.new(-2448.5300292969, 73.016105651855, -3210.6306152344))
                elseif _G.SelectIsland == "Factory" then
                    toTarget(CFrame.new(424.12698364258, 211.16171264648, -427.54049682617))
                elseif _G.SelectIsland == "Colossuim" then
                    toTarget(CFrame.new(-1503.6224365234, 219.7956237793, 1369.3101806641))
                elseif _G.SelectIsland == "Zombie Island" then
                    toTarget(CFrame.new(-5622.033203125, 492.19604492188, -781.78552246094))
                elseif _G.SelectIsland == "Snow Mountain" then
                    toTarget(CFrame.new(753.14288330078, 408.23559570313, -5274.6147460938))
                elseif _G.SelectIsland == "Hot And Cold" then
                    toTarget(CFrame.new(-6127.654296875, 15.951762199402, -5040.2861328125))
                elseif _G.SelectIsland == "Cursed Ship" then
                    toTarget(CFrame.new(923.40197753906, 125.05712890625, 32885.875))
                elseif _G.SelectIsland == "Ice Castle" then
                    toTarget(CFrame.new(6148.4116210938, 294.38687133789, -6741.1166992188))
                elseif _G.SelectIsland == "Forgotten Island" then
                    toTarget(CFrame.new(-3032.7641601563, 317.89672851563, -10075.373046875))
                elseif _G.SelectIsland == "Ussop Island" then
                    toTarget(CFrame.new(4816.8618164063, 8.4599885940552, 2863.8195800781))
                elseif _G.SelectIsland == "Mini Sky Island" then
                    toTarget(CFrame.new(-288.74060058594, 49326.31640625, -35248.59375))
                elseif _G.SelectIsland == "Great Tree" then
                    toTarget(CFrame.new(2681.2736816406, 1682.8092041016, -7190.9853515625))
                elseif _G.SelectIsland == "Castle On The Sea" then
                    BTPZ(CFrame.new(-5075.50927734375, 314.5155029296875, -3150.0224609375))
                elseif _G.SelectIsland == "MiniSky" then
                    toTarget(CFrame.new(-260.65557861328, 49325.8046875, -35253.5703125))
                elseif _G.SelectIsland == "Port Town" then
                    toTarget(CFrame.new(-290.7376708984375, 6.729952812194824, 5343.5537109375))
                elseif _G.SelectIsland == "Hydra Island" then
                    toTarget(CFrame.new(5753.5478515625, 610.7880859375, -282.33172607421875))
                elseif _G.SelectIsland == "Floating Turtle" then
                    toTarget(CFrame.new(-13274.528320313, 531.82073974609, -7579.22265625))
                elseif _G.SelectIsland == "Mansion" then
                    BTPZ(CFrame.new(-12468.5380859375, 375.0094299316406, -7554.62548828125))
                elseif _G.SelectIsland == "Haunted Castle" then
                    toTarget(CFrame.new(-9515.3720703125, 164.00624084473, 5786.0610351562))
                elseif _G.SelectIsland == "Ice Cream Island" then
                    toTarget(CFrame.new(-902.56817626953, 79.93204498291, -10988.84765625))
                elseif _G.SelectIsland == "Peanut Island" then
                    toTarget(CFrame.new(-2062.7475585938, 50.473892211914, -10232.568359375))
                elseif _G.SelectIsland == "Cake Island" then
                    toTarget(CFrame.new(-1884.7747802734375, 19.327526092529297, -11666.8974609375))
                elseif _G.SelectIsland == "Cocoa Island" then
                    toTarget(CFrame.new(87.94276428222656, 73.55451202392578, -12319.46484375))
                elseif _G.SelectIsland == "Candy Island" then
                    toTarget(CFrame.new(-1014.4241943359375, 149.11068725585938, -14555.962890625))
                elseif _G.SelectIsland == "Tiki Outpost" then
                    toTarget(CFrame.new(-16542.447265625, 55.68632888793945, 1044.41650390625))
                end
            until not _G.TeleportIsland
        end
    end
)
Options.ToggleIsland:SetValue(false)

local TpNPC = Tabs.Teleport:AddSection("Tele To NPC")

if First_Sea then
    NPCList = {
        "Sword Dealer",
        "Rich Man",
        "Hasan",
        "Ability Teacher",
        "Robotmega",
        "Advanced Weapon Dealer",
        "Parlus",
        "Master Sword Dealer",
        "Instinct Teacher",
        "Living Skeleton",
    }
elseif Second_Sea then
    NPCList = {
        "Manager",
        "Nerd",
        "arowe",
        "Trevor",
        "Alchemist",
        "Mysterious Man",
        "Crew Captain",
        "rip_indra",
        "arltmetic",
        "Experimic[Ghoul Change]",
        "El Rodofol",
        "El Admin",
        "Phoenyu[Sea2]",
        "Dairock[Sea2]",
        "Martial Arts Master[Sea2]",
        "The Strongest God"
    }
elseif Third_Sea then
    NPCList = {
        "Blacksmith",
        "Death King",
        "Werid Machine",
        "Elite Hunter",
        "Remove Blox Fruit",
        "Previous Hero",
        "Acient Monk",
        "Hungry Man",
        "Crypt Master",
        "drip_mama",
        "Sick Scientist",
        "Sweet Crafter",
        "Shipwright Teacher",
        "Shark Hunter",
        "Beast Hunter",
        "Spy",
    }
end

local DropdownNPC =
    Tabs.Teleport:AddDropdown(
    "DropdownNPC",
    {
        Title = "Choose NPC",
        Values = NPCList,
        Multi = false,
        Default = 1
    }
)

DropdownNPC:SetValue("...")
DropdownNPC:OnChanged(
    function(Value)
        _G.SelectNPC = Value
    end
)

local ToggleNPC = Tabs.Teleport:AddToggle("ToggleNPC", {Title = "Tween To NPC", Default = false})
ToggleNPC:OnChanged(
    function(Value)
        _G.TeleportNPC = Value
        if _G.TeleportNPC == true then
            repeat
                wait()
                if _G.SelectNPC == "Sword Dealer" then
                    Tween2(CFrame.new(-2539.558837890625, 6.614826679229736, 2028.5797119140625))
                elseif _G.SelectNPC == "Rich Man" then
                    Tween2(CFrame.new(-905.4583129882812, 13.787052154541016, 4078.601806640625))
                elseif _G.SelectNPC == "Hasan" then
                    Tween2(CFrame.new(1319.5235595703125, 15.86517333984375, 4488.37841796875))
                elseif _G.SelectNPC == "Ability Teacher" then
                    Tween2(CFrame.new(1489.6800537109375, 40.84608840942383, -1414.084716796875))
                elseif _G.SelectNPC == "Robotmega" then
                    Tween2(CFrame.new(-1037.048583984375, 9.68704605102539, 1800.3603515625))
                elseif _G.SelectNPC == "Advanced Weapon Dealer" then
                    Tween2(CFrame.new(-4997.7578125, 41.287044525146484, 4402.53515625))
                elseif _G.SelectNPC == "Parlus" then
                    Tween2(CFrame.new(-4931.53857421875, 96.39425659179688, 3869.43505859375))
                elseif _G.SelectNPC == "Master Sword Dealer" then
                    Tween2(CFrame.new(-4749.52587890625, 717.697021484375, -2658.385986328125))
                elseif _G.SelectNPC == "Instinct Teacher" then
                    Tween2(CFrame.new(-8040.74755859375, 5756.06787109375, -1926.5037841796875))
                elseif _G.SelectNPC == "Living Skeleton" then
                    Tween2(CFrame.new(-5463.73291015625, 8.62612533569336, 8877.783203125))
                elseif _G.SelectNPC == "Manager" then
                    Tween2(CFrame.new(-385.54248046875, 73.0650405883789, 330.1056823730469))
                elseif _G.SelectNPC == "Nerd" then
                    Tween2(CFrame.new(-398.9334411621094, 73.09505462646484, 259.4021301269531))
                elseif _G.SelectNPC == "arowe" then
                    Tween2(CFrame.new(-1989.70361328125, 125.52833557128906, -72.03471374511719))
                elseif _G.SelectNPC == "Trevor" then
                    Tween2(CFrame.new(-337.1565856933594, 331.89599609375, 639.19775390625))
                elseif _G.SelectNPC == "Alchemist" then
                    Tween2(CFrame.new(-2774.590576171875, 73.21097564697266, -3570.2119140625))
                elseif _G.SelectNPC == "Mysterious Man" then
                    Tween2(CFrame.new(-2574.777099609375, 1623.7242431640625, -3745.75341796875))
                elseif _G.SelectNPC == "Crew Captain" then
                    Tween2(CFrame.new(-5693.0849609375, 127.21127319335938, -821.1600952148438))
                elseif _G.SelectNPC == "rip_indra" then
                    Tween2(CFrame.new(-5654.2685546875, 178.89596557617188, -1349.7425537109375))
                elseif _G.SelectNPC == "arltmetic" then
                    Tween2(CFrame.new(-4977.15380859375, 143.79434204101562, -5389.06884765625))
                elseif _G.SelectNPC == "Experimic[Ghoul Change]" then
                    Tween2(CFrame.new(918.8460693359375, 129.16561889648438, 33453.796875))
                elseif _G.SelectNPC == "El Rodofol" then
                    Tween2(CFrame.new(939.5582275390625, 40.47803497314453, 32778.12890625))
                elseif _G.SelectNPC == "El Admin" then
                    Tween2(CFrame.new(1323.3121337890625, 125.47376251220703, 33138.3515625))
                elseif _G.SelectNPC == "Phoenyu[Sea2]" then
                    Tween2(CFrame.new(6357.33349609375, 296.6669616699219, -6769.6103515625))
                elseif _G.SelectNPC == "Dairock[Sea2]" then
                    Tween2(CFrame.new(-2600.471435546875, 238.88172912597656, -10321.1484375))
                elseif _G.SelectNPC == "Martial Arts Master[Sea2]" then
                    Tween2(CFrame.new(1378.6502685546875, 247.4630584716797, -5196.61474609375))
                elseif _G.SelectNPC == "The Strongest God" then
                    Tween2(CFrame.new(4739.3837890625, 7.974522113800049, 2910.386474609375))
                elseif _G.SelectNPC == "Blacksmith" then
                    Tween2(CFrame.new(-468.08258056640625, 19.14280128479004, 5732.6162109375))
                elseif _G.SelectNPC == "Death King" then
                    Tween2(CFrame.new(-8721.248046875, 142.3568878173828, 6251.09228515625))
                elseif _G.SelectNPC == "Werid Machine" then
                    Tween2(CFrame.new(-9681.32421875, 6.140038013458252, 6343.5341796875))
                elseif _G.SelectNPC == "Elite Hunter" then
                    Tween2(CFrame.new(-5417.755859375, 316.1022644042969, -2823.448486328125))
                elseif _G.SelectNPC == "Remove Blox Fruit" then
                    Tween2(CFrame.new(-5573.68896484375, 1088.7596435546875, -2658.131591796875))
                elseif _G.SelectNPC == "Previous Hero" then
                    Tween2(CFrame.new(-10371.025390625, 336.2735595703125, -10131.0810546875))
                elseif _G.SelectNPC == "Acient Monk" then
                    Tween2(CFrame.new(-13775.3466796875, 334.50689697265625, -9878.029296875))
                elseif _G.SelectNPC == "Hungry Man" then
                    Tween2(CFrame.new(-10922.33203125, 624.1702270507812, -10267.595703125))
                elseif _G.SelectNPC == "Crypt Master" then
                    Tween2(CFrame.new(-12135.29296875, 577.1981811523438, -6709.46728515625))
                elseif _G.SelectNPC == "drip_mama" then
                    Tween2(CFrame.new(-2137.877197265625, 72.22284698486328, -12326.1796875))
                elseif _G.SelectNPC == "Sick Scientist" then
                    Tween2(CFrame.new(-2814.095458984375, 254.81251525878906, -12592.908203125))
                elseif _G.SelectNPC == "Sweet Crafter" then
                    Tween2(CFrame.new(228.89129638671875, 25.343040466308594, -12773.3046875))
                elseif _G.SelectNPC == "Shipwright Teacher" then
                    Tween2(CFrame.new(-16526.60546875, 75.8989486694336, 312.47515869140625))
                elseif _G.SelectNPC == "Shark Hunter" then
                    Tween2(CFrame.new(-16525, 107.56005096435547, 752.9271240234375))
                elseif _G.SelectNPC == "Beast Hunter" then
                    Tween2(CFrame.new(-16282.984375, 72.79424285888672, 260.19268798828125))
                elseif _G.SelectNPC == "Spy" then
                    Tween2(CFrame.new(-16472.328125, 527.78857421875, 538.5908813476562))
                end
            until not _G.TeleportNPC
        end
    end
)
Options.ToggleNPC:SetValue(false)

local Hopre = Tabs.Teleport:AddSection("Hop Sever Premium")

local TS

local function scrapeAPI()
    local req = (syn and syn.request) or (http and http.request) or request
    local success, response =
        pcall(
        function()
            return req(
                {
                    Url = "https://b7f13292-4118-461d-b8e9-207be68b749e-00-2rgvijjkq7q4q.pike.replit.dev/JobId/fullmoon",
                    Method = "GET"
                }
            )
        end
    )

    if success and response and response.Body then
        local data = game.HttpService:JSONDecode(response.Body)
        if data.Amount and data.Amount > 0 then
            local jobIds = {}
            for _, job in ipairs(data.JobId) do
                for jobId, _ in pairs(job) do
                    table.insert(jobIds, jobId)
                end
            end
            TS = tick()
            return jobIds
        end
    end

    return nil
end

local function scrapeAPI_2()
    local req = (syn and syn.request) or (http and http.request) or request
    local success, response =
        pcall(
        function()
            return req(
                {
                    Url = "https://b7f13292-4118-461d-b8e9-207be68b749e-00-2rgvijjkq7q4q.pike.replit.dev/JobId/mirage",
                    Method = "GET"
                }
            )
        end
    )

    if success and response and response.Body then
        local data = game.HttpService:JSONDecode(response.Body)
        if data.Amount and data.Amount > 0 then
            local jobIds = {}
            for _, job in ipairs(data.JobId) do
                for jobId, _ in pairs(job) do
                    table.insert(jobIds, jobId)
                end
            end
            return jobIds
        end
    end

    return nil
end

local function scrapeAPI_3()
    local req = (syn and syn.request) or (http and http.request) or request
    local success, response =
        pcall(
        function()
            return req(
                {
                    Url = "https://b7f13292-4118-461d-b8e9-207be68b749e-00-2rgvijjkq7q4q.pike.replit.dev/JobId/indra",
                    Method = "GET"
                }
            )
        end
    )

    if success and response and response.Body then
        local data = game.HttpService:JSONDecode(response.Body)
        if data.Amount and data.Amount > 0 then
            local jobIds = {}
            for _, job in ipairs(data.JobId) do
                for jobId, _ in pairs(job) do
                    table.insert(jobIds, jobId)
                end
            end
            return jobIds
        end
    end

    return nil
end

local function scrapeAPI_4()
    local req = (syn and syn.request) or (http and http.request) or request
    local success, response =
        pcall(
        function()
            return req(
                {
                    Url = "https://b7f13292-4118-461d-b8e9-207be68b749e-00-2rgvijjkq7q4q.pike.replit.dev/JobId/doughking",
                    Method = "GET"
                }
            )
        end
    )

    if success and response and response.Body then
        local data = game.HttpService:JSONDecode(response.Body)
        if data.Amount and data.Amount > 0 then
            local jobIds = {}
            for _, job in ipairs(data.JobId) do
                for jobId, _ in pairs(job) do
                    table.insert(jobIds, jobId)
                end
            end
            return jobIds
        end
    end

    return nil
end

local function scrapeAPI_5()
    local req = (syn and syn.request) or (http and http.request) or request
    local success, response =
        pcall(
        function()
            return req(
                {
                    Url = "https://b7f13292-4118-461d-b8e9-207be68b749e-00-2rgvijjkq7q4q.pike.replit.dev/JobId/darkbread",
                    Method = "GET"
                }
            )
        end
    )

    if success and response and response.Body then
        local data = game.HttpService:JSONDecode(response.Body)
        if data.Amount and data.Amount > 0 then
            local jobIds = {}
            for _, job in ipairs(data.JobId) do
                for jobId, _ in pairs(job) do
                    table.insert(jobIds, jobId)
                end
            end
            return jobIds
        end
    end

    return nil
end

local function scrapeAPI_6()
    local req = (syn and syn.request) or (http and http.request) or request
    local success, response =
        pcall(
        function()
            return req(
                {
                    Url = "https://b7f13292-4118-461d-b8e9-207be68b749e-00-2rgvijjkq7q4q.pike.replit.dev/JobId/captain",
                    Method = "GET"
                }
            )
        end
    )

    if success and response and response.Body then
        local data = game.HttpService:JSONDecode(response.Body)
        if data.Amount and data.Amount > 0 then
            local jobIds = {}
            for _, job in ipairs(data.JobId) do
                for jobId, _ in pairs(job) do
                    table.insert(jobIds, jobId)
                end
            end
            return jobIds
        end
    end

    return nil
end

local function scrapeAPI_7()
    local req = (syn and syn.request) or (http and http.request) or request
    local success, response =
        pcall(
        function()
            return req(
                {
                    Url = "https://b7f13292-4118-461d-b8e9-207be68b749e-00-2rgvijjkq7q4q.pike.replit.dev/JobId/lowsever",
                    Method = "GET"
                }
            )
        end
    )

    if success and response and response.Body then
        local data = game.HttpService:JSONDecode(response.Body)
        if data.Amount and data.Amount > 0 then
            local jobIds = {}
            for _, job in ipairs(data.JobId) do
                for jobId, _ in pairs(job) do
                    table.insert(jobIds, jobId)
                end
            end
            return jobIds
        end
    end

    return nil
end

local function scrapeAPI_8()
    local req = (syn and syn.request) or (http and http.request) or request
    local success, response =
        pcall(
        function()
            return req(
                {
                    Url = "https://b7f13292-4118-461d-b8e9-207be68b749e-00-2rgvijjkq7q4q.pike.replit.dev/JobId/volcano",
                    Method = "GET"
                }
            )
        end
    )

    if success and response and response.Body then
        local data = game.HttpService:JSONDecode(response.Body)
        if data.Amount and data.Amount > 0 then
            local jobIds = {}
            for _, job in ipairs(data.JobId) do
                for jobId, _ in pairs(job) do
                    table.insert(jobIds, jobId)
                end
            end
            return jobIds
        end
    end

    return nil
end

Tabs.Teleport:AddButton(
    {
        Title = "Hop Server Full Moon",
        Callback = function()
            local jobIds = scrapeAPI()
            if not jobIds then
                Fluent:Notify(
                    {
                        Title = "Hopping",
                        Content = "Wait To Find New Sever!!",
                        Duration = 4
                    }
                )
                return
            end

            task.spawn(
                function()
                    for _, jobId in ipairs(jobIds) do
                        game:GetService("ReplicatedStorage").__ServerBrowser:InvokeServer("teleport", jobId)
                        task.wait(5)
                    end
                end
            )
        end
    }
)

Tabs.Teleport:AddButton(
    {
        Title = "Hop Server Mirage",
        Callback = function()
            local jobIds = scrapeAPI_2()
            if not jobIds then
                Fluent:Notify(
                    {
                        Title = "Hopping",
                        Content = "Wait To Find New Sever!!",
                        Duration = 4
                    }
                )
                return
            end

            task.spawn(
                function()
                    for _, jobId in ipairs(jobIds) do
                        game:GetService("ReplicatedStorage").__ServerBrowser:InvokeServer("teleport", jobId)
                        task.wait(5)
                    end
                end
            )
        end
    }
)

Tabs.Teleport:AddButton(
    {
        Title = "Hop Server Rip Indra",
        Callback = function()
            local jobIds = scrapeAPI_3()
            if not jobIds then
                Fluent:Notify(
                    {
                        Title = "Hopping",
                        Content = "Wait To Find New Sever!!",
                        Duration = 4
                    }
                )
                return
            end

            task.spawn(
                function()
                    for _, jobId in ipairs(jobIds) do
                        game:GetService("ReplicatedStorage").__ServerBrowser:InvokeServer("teleport", jobId)
                        task.wait(5)
                    end
                end
            )
        end
    }
)

Tabs.Teleport:AddButton(
    {
        Title = "Hop Server Dough King",
        Callback = function()
            local jobIds = scrapeAPI_4()
            if not jobIds then
                Fluent:Notify(
                    {
                        Title = "Hopping",
                        Content = "Wait To Find New Sever!!",
                        Duration = 4
                    }
                )
                return
            end

            task.spawn(
                function()
                    for _, jobId in ipairs(jobIds) do
                        game:GetService("ReplicatedStorage").__ServerBrowser:InvokeServer("teleport", jobId)
                        task.wait(5)
                    end
                end
            )
        end
    }
)

Tabs.Teleport:AddButton(
    {
        Title = "Hop Server Dark Beard",
        Description = "Go To Second Sea Plz",
        Callback = function()
            local jobIds = scrapeAPI_5()
            if not jobIds then
                Fluent:Notify(
                    {
                        Title = "Hopping",
                        Content = "Wait To Find New Sever!!",
                        Duration = 4
                    }
                )
                return
            end

            task.spawn(
                function()
                    for _, jobId in ipairs(jobIds) do
                        game:GetService("ReplicatedStorage").__ServerBrowser:InvokeServer("teleport", jobId)
                        task.wait(5)
                    end
                end
            )
        end
    }
)

Tabs.Teleport:AddButton(
    {
        Title = "Hop Server Cursed Captain",
        Description = "Go To Second Sea Plz",
        Callback = function()
            local jobIds = scrapeAPI_6()
            if not jobIds then
                Fluent:Notify(
                    {
                        Title = "Hopping",
                        Content = "Wait To Find New Sever!!",
                        Duration = 4
                    }
                )
                return
            end

            task.spawn(
                function()
                    for _, jobId in ipairs(jobIds) do
                        game:GetService("ReplicatedStorage").__ServerBrowser:InvokeServer("teleport", jobId)
                        task.wait(5)
                    end
                end
            )
        end
    }
)

Tabs.Teleport:AddButton(
    {
        Title = "Hop Server Low Sever",
        Callback = function()
            local jobIds = scrapeAPI_7()
            if not jobIds then
                Fluent:Notify(
                    {
                        Title = "Hopping",
                        Content = "Wait To Find New Sever!!",
                        Duration = 4
                    }
                )
                return
            end

            task.spawn(
                function()
                    for _, jobId in ipairs(jobIds) do
                        game:GetService("ReplicatedStorage").__ServerBrowser:InvokeServer("teleport", jobId)
                        task.wait(5)
                    end
                end
            )
        end
    }
)

Tabs.Teleport:AddButton(
    {
        Title = "Hop Server Volcano Island",
        Callback = function()
            local jobIds = scrapeAPI_8()
            if not jobIds then
                Fluent:Notify(
                    {
                        Title = "Hopping",
                        Content = "Wait To Find New Sever!!",
                        Duration = 4
                    }
                )
                return
            end

            task.spawn(
                function()
                    for _, jobId in ipairs(jobIds) do
                        game:GetService("ReplicatedStorage").__ServerBrowser:InvokeServer("teleport", jobId)
                        task.wait(5)
                    end
                end
            )
        end
    }
)

----------------------------------Raid-------------------------------
local Remote_GetFruits = game.ReplicatedStorage:FindFirstChild("Remotes").CommF_:InvokeServer("GetFruits")
Table_DevilFruitSniper = {}
ShopDevilSell = {}
for i, v in next, Remote_GetFruits do
    table.insert(Table_DevilFruitSniper, v.Name)
    if v.OnSale then
        table.insert(ShopDevilSell, v.Name)
    end
end

_G.SelectFruit = "Leopard"

local DropdownFruit =
    Tabs.Fruit:AddDropdown(
    "DropdownFruit",
    {
        Title = "Choose Fruit",
        Values = Table_DevilFruitSniper,
        Multi = false,
        Default = 1
    }
)

DropdownFruit:SetValue("...")

DropdownFruit:OnChanged(
    function(Value)
        _G.SelectFruit = Value
    end
)

local ToggleFruit = Tabs.Fruit:AddToggle("ToggleFruit", {Title = "Auto Buy Fruit Sniper", Default = false})
ToggleFruit:OnChanged(
    function(Value)
        _G.AutoBuyFruitSniper = Value
    end
)
Options.ToggleFruit:SetValue(false)
spawn(
    function()
        pcall(
            function()
                while wait(.1) do
                    if _G.AutoBuyFruitSniper then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetFruits")
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                            "PurchaseRawFruit",
                            "_G.SelectFruit",
                            false
                        )
                    end
                end
            end
        )
    end
)

local ToggleStore = Tabs.Fruit:AddToggle("ToggleStore", {Title = "Auto Store Fruit", Default = false})
ToggleStore:OnChanged(
    function(Value)
        _G.AutoStoreFruit = Value
    end
)
Options.ToggleStore:SetValue(false)

spawn(
    function()
        while task.wait() do
            if _G.AutoStoreFruit then
                pcall(
                    function()
                        if _G.AutoStoreFruit then
                            if
                                game:GetService("Players").LocalPlayer.Character:FindFirstChild("Bomb Fruit") or
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Bomb Fruit")
                             then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                    "StoreFruit",
                                    "Bomb-Bomb",
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Rocket Fruit")
                                )
                            end
                            if
                                game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spike Fruit") or
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spike Fruit")
                             then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                    "StoreFruit",
                                    "Spike-Spike",
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spike Fruit")
                                )
                            end
                            if
                                game:GetService("Players").LocalPlayer.Character:FindFirstChild("Chop Fruit") or
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Chop Fruit")
                             then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                    "StoreFruit",
                                    "Chop-Chop",
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Chop Fruit")
                                )
                            end
                            if
                                game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spring Fruit") or
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spring Fruit")
                             then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                    "StoreFruit",
                                    "Spring-Spring",
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spring Fruit")
                                )
                            end
                            if
                                game:GetService("Players").LocalPlayer.Character:FindFirstChild("Rocket Fruit") or
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Rocket Fruit")
                             then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                    "StoreFruit",
                                    "Rocket-Rocket",
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Kilo Fruit")
                                )
                            end
                            if
                                game:GetService("Players").LocalPlayer.Character:FindFirstChild("Smoke Fruit") or
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Smoke Fruit")
                             then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                    "StoreFruit",
                                    "Smoke-Smoke",
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Smoke Fruit")
                                )
                            end
                            if
                                game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spin Fruit") or
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spin Fruit")
                             then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                    "StoreFruit",
                                    "Spin-Spin",
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spin Fruit")
                                )
                            end
                            if
                                game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flame Fruit") or
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flame Fruit")
                             then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                    "StoreFruit",
                                    "Flame-Flame",
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flame Fruit")
                                )
                            end
                            if
                                game:GetService("Players").LocalPlayer.Character:FindFirstChild("Bird: Falcon Fruit") or
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Bird: Falcon Fruit")
                             then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                    "StoreFruit",
                                    "Bird-Bird: Falcon",
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Bird: Falcon Fruit")
                                )
                            end
                            if
                                game:GetService("Players").LocalPlayer.Character:FindFirstChild("Ice Fruit") or
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Ice Fruit")
                             then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                    "StoreFruit",
                                    "Ice-Ice",
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Ice Fruit")
                                )
                            end
                            if
                                game:GetService("Players").LocalPlayer.Character:FindFirstChild("Sand Fruit") or
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Sand Fruit")
                             then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                    "StoreFruit",
                                    "Sand-Sand",
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Sand Fruit")
                                )
                            end
                            if
                                game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dark Fruit") or
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dark Fruit")
                             then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                    "StoreFruit",
                                    "Dark-Dark",
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dark Fruit")
                                )
                            end
                            if
                                game:GetService("Players").LocalPlayer.Character:FindFirstChild("Ghost Fruit") or
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Revive Fruit")
                             then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                    "StoreFruit",
                                    "Ghost-Ghost",
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Revive Fruit")
                                )
                            end
                            if
                                game:GetService("Players").LocalPlayer.Character:FindFirstChild("Diamond Fruit") or
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Diamond Fruit")
                             then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                    "StoreFruit",
                                    "Diamond-Diamond",
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Diamond Fruit")
                                )
                            end
                            if
                                game:GetService("Players").LocalPlayer.Character:FindFirstChild("Light Fruit") or
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Light Fruit")
                             then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                    "StoreFruit",
                                    "Light-Light",
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Light Fruit")
                                )
                            end
                            if
                                game:GetService("Players").LocalPlayer.Character:FindFirstChild("Love Fruit") or
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Love Fruit")
                             then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                    "StoreFruit",
                                    "Love-Love",
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Love Fruit")
                                )
                            end
                            if
                                game:GetService("Players").LocalPlayer.Character:FindFirstChild("Rubber Fruit") or
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Rubber Fruit")
                             then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                    "StoreFruit",
                                    "Rubber-Rubber",
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Rubber Fruit")
                                )
                            end
                            if
                                game:GetService("Players").LocalPlayer.Character:FindFirstChild("Barrier Fruit") or
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Barrier Fruit")
                             then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                    "StoreFruit",
                                    "Barrier-Barrier",
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Barrier Fruit")
                                )
                            end
                            if
                                game:GetService("Players").LocalPlayer.Character:FindFirstChild("Magma Fruit") or
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Magma Fruit")
                             then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                    "StoreFruit",
                                    "Magma-Magma",
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Magma Fruit")
                                )
                            end
                            if
                                game:GetService("Players").LocalPlayer.Character:FindFirstChild("Portal Fruit") or
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Portal Fruit")
                             then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                    "StoreFruit",
                                    "Portal-Portal",
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Portal Fruit")
                                )
                            end

                            if
                                game:GetService("Players").LocalPlayer.Character:FindFirstChild("Quake Fruit") or
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Quake Fruit")
                             then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                    "StoreFruit",
                                    "Quake-Quake",
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Quake Fruit")
                                )
                            end
                            if
                                game:GetService("Players").LocalPlayer.Character:FindFirstChild(
                                    "Human-Human: Buddha Fruit"
                                ) or
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(
                                        "Human-Human: Buddha Fruit"
                                    )
                             then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                    "StoreFruit",
                                    "Human-Human: Buddha",
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(
                                        "Human-Human: Buddha Fruit"
                                    )
                                )
                            end
                            if
                                game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spider Fruit") or
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spider Fruit")
                             then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                    "StoreFruit",
                                    "Spider-Spider",
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spider Fruit")
                                )
                            end
                            if
                                game:GetService("Players").LocalPlayer.Character:FindFirstChild("Bird: Phoenix Fruit") or
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(
                                        "Bird: Phoenix Fruit"
                                    )
                             then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                    "StoreFruit",
                                    "Bird-Bird: Phoenix",
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(
                                        "Bird: Phoenix Fruit"
                                    )
                                )
                            end
                            if
                                game:GetService("Players").LocalPlayer.Character:FindFirstChild("Rumble Fruit") or
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Rumble Fruit")
                             then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                    "StoreFruit",
                                    "Rumble-Rumble",
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Rumble Fruit")
                                )
                            end
                            if
                                game:GetService("Players").LocalPlayer.Character:FindFirstChild("Pain Fruit") or
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Pain Fruit")
                             then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                    "StoreFruit",
                                    "Pain-Pain",
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Pain Fruit")
                                )
                            end
                            if
                                game:GetService("Players").LocalPlayer.Character:FindFirstChild("Gravity Fruit") or
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Gravity Fruit")
                             then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                    "StoreFruit",
                                    "Gravity-Gravity",
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Gravity Fruit")
                                )
                            end
                            if
                                game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dough Fruit") or
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dough Fruit")
                             then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                    "StoreFruit",
                                    "Dough-Dough",
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dough Fruit")
                                )
                            end
                            if
                                game:GetService("Players").LocalPlayer.Character:FindFirstChild("Shadow Fruit") or
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Shadow Fruit")
                             then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                    "StoreFruit",
                                    "Shadow-Shadow",
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Shadow Fruit")
                                )
                            end
                            if
                                game:GetService("Players").LocalPlayer.Character:FindFirstChild("Venom Fruit") or
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Venom Fruit")
                             then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                    "StoreFruit",
                                    "Venom-Venom",
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Venom Fruit")
                                )
                            end
                            if
                                game:GetService("Players").LocalPlayer.Character:FindFirstChild("Control Fruit") or
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Control Fruit")
                             then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                    "StoreFruit",
                                    "Control-Control",
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Control Fruit")
                                )
                            end
                            if
                                game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spirit Fruit") or
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spirit Fruit")
                             then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                    "StoreFruit",
                                    "Spirit-Spirit",
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spirit Fruit")
                                )
			    end		
                            if
                                game:GetService("Players").LocalPlayer.Character:FindFirstChild("Gas Fruit") or
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Gas Fruit")
                             then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                    "StoreFruit",
                                    "Gas-Gas",
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Gas Fruit")
                                )					
                            end
                            if
                                game:GetService("Players").LocalPlayer.Character:FindFirstChild("Yeti Fruit") or
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Yeti Fruit")
                             then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                    "StoreFruit",
                                    "Yeti-Yeti",
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Yeti Fruit")
                                )					
                            end

                            if
                                game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dragon Fruit") or
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Fruit")
                             then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                    "StoreFruit",
                                    "Dragon-Dragon",
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Fruit")
                                )
                                if
                                    game:GetService("Players").LocalPlayer.Character:FindFirstChild("Leopard Fruit") or
                                        game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Leopard Fruit")
                                 then
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                        "StoreFruit",
                                        "Leopard-Leopard",
                                        game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Leopard Fruit")
                                    )
                                end
                            end
                        end
                    end
                )
            end
            wait(0.3)
        end
    end
)

local ToggleRandomFruit = Tabs.Fruit:AddToggle("ToggleRandomFruit", {Title = "Auto Random Fruit", Default = false})
ToggleRandomFruit:OnChanged(
    function(Value)
        _G.Random_Auto = Value
    end
)
Options.ToggleRandomFruit:SetValue(false)
spawn(
    function()
        pcall(
            function()
                while wait(.1) do
                    if _G.Random_Auto then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin", "Buy")
                    end
                end
            end
        )
    end
)

local ToggleCollect = Tabs.Fruit:AddToggle("ToggleCollect", {Title = "Collect Devil Fruit", Default = false})
ToggleCollect:OnChanged(
    function(Value)
        _G.Tweenfruit = Value
    end
)
Options.ToggleCollect:SetValue(false)

spawn(
    function()
        while wait(.1) do
            if _G.Tweenfruit then
                for i, v in pairs(game.Workspace:GetChildren()) do
                    if string.find(v.Name, "Fruit") then
                        Tween(v.Handle.CFrame)
                    end
                end
            end
        end
    end
)

local Chips = {
    "Flame",
    "Ice",
    "Quake",
    "Light",
    "Dark",
    "Spider",
    "Rumble",
    "Magma",
    "Buddha",
    "Sand",
    "Phoenix",
    "Dough"
}

local DropdownRaid =
    Tabs.Raid:AddDropdown(
    "DropdownRaid",
    {
        Title = "Choose Raid",
        Values = Chips,
        Multi = false,
        Default = 1
    }
)
DropdownRaid:SetValue("...")
DropdownRaid:OnChanged(
    function(Value)
        SelectChip = Value
    end
)

local ToggleBuy = Tabs.Raid:AddToggle("ToggleBuy", {Title = "Buy Chip", Default = false})
ToggleBuy:OnChanged(
    function(Value)
        _G.Auto_Buy_Chips_Dungeon = Value
    end
)
Options.ToggleBuy:SetValue(false)
spawn(
    function()
        while wait() do
            if _G.Auto_Buy_Chips_Dungeon then
                pcall(
                    function()
                        local args = {
                            [1] = "RaidsNpc",
                            [2] = "Select",
                            [3] = "SelectChip"
                        }
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                    end
                )
            end
        end
    end
)

local ToggleKillAura = Tabs.Raid:AddToggle("ToggleKillAura", {Title = "Kill Aura", Default = false})
ToggleKillAura:OnChanged(
    function(Value)
        KillAura = Value
    end
)
Options.ToggleKillAura:SetValue(false)
spawn(
    function()
        while wait() do
            if KillAura then
                pcall(
                    function()
                        for i, v in pairs(game.Workspace.Enemies:GetDescendants()) do
                            if
                                v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and
                                    v.Humanoid.Health > 0
                             then
                                repeat
                                    task.wait()
                                    sethiddenproperty(
                                        game:GetService("Players").LocalPlayer,
                                        "SimulationRadius",
                                        math.huge
                                    )
                                    v.Humanoid.Health = 0
                                    v.HumanoidRootPart.CanCollide = false
                                until not KillAura or not v.Parent or v.Humanoid.Health <= 0
                            end
                        end
                    end
                )
            end
        end
    end
)

local v139 = Tabs.Raid:AddToggle("ToggleStart", {
    Title = "Start Raid",
    Description = "",
    Default = false
});
v139:OnChanged(function(v355)
    _G.Auto_StartRaid = v355;
end);
Options.ToggleStart:SetValue(false);
spawn(function()
    while wait() do
        pcall(function()
            if _G.Auto_StartRaid then
                if (game:GetService("Players")['LocalPlayer'].PlayerGui.Main.Timer.Visible == false) then
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Microchip") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Microchip") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Special Microchip") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Special Microchip") then
                        if Sea2 then
                            Tween2(CFrame.new(- 6438.73535, 250.645355, - 4501.50684));
                            local v1547 = {
                                [1] = "SetSpawnPoint"
                            };
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v1547));
                            fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector);
                        elseif Sea3 then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(- 5075.50927734375, 314.5155029296875, - 3150.0224609375));
                            Tween(CFrame.new(- 5017.40869, 314.844055, - 2823.0127, - 0.925743818, 4.482175e-8, - 0.378151238, 4.5550315e-9, 1, 1.0737756e-7, 0.378151238, 9.768162e-8, - 0.925743818));
                            local v1656 = {
                                [1] = "SetSpawnPoint"
                            };
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v1656));
                            fireclickdetector(game:GetService("Workspace").Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector);
                        end
                    end
                end
            end
        end);
    end
end);
local v140 = Tabs.Raid:AddToggle("ToggleNextIsland", {
    Title = "Auto Finish Raid",
    Description = "",
    Default = false
});
v140:OnChanged(function(v356)
    AutoNextIsland = v356;
    if not v356 then
        _G.AutoNear = false;
    end
end);
Options.ToggleNextIsland:SetValue(false);
spawn(function()
    local v357 = {};
    while task.wait() do
        if AutoNextIsland then
            pcall(function()
                local v806 = game.Players.LocalPlayer.Character;
                if (v806 and v806:FindFirstChild("HumanoidRootPart")) then
                    local v900 = game:GetService("Workspace")['_WorldOrigin'].Locations;
                    local v901 = v806.HumanoidRootPart.Position;
                    if (((v901 - Vector3.new(- 6438.73535, 250.645355, - 4501.50684)).Magnitude < 1) or ((v901 - Vector3.new(- 5017.40869, 314.844055, - 2823.0127)).Magnitude < 1)) then
                        v357 = {};
                    end
                    if v900:FindFirstChild("Island 1") then
                        _G.AutoNear = true;
                    end
                    if (v900:FindFirstChild("Island 2") and not v357["Island 2"]) then
                        Tween(v900:FindFirstChild("Island 2").CFrame);
                        v357["Island 2"] = true;
                        AutoNextIsland = false;
                        wait();
                        AutoNextIsland = true;
                    elseif (v900:FindFirstChild("Island 3") and not v357["Island 3"]) then
                        Tween(v900:FindFirstChild("Island 3").CFrame);
                        v357["Island 3"] = true;
                        AutoNextIsland = false;
                        wait();
                        AutoNextIsland = true;
                    elseif (v900:FindFirstChild("Island 4") and not v357["Island 4"]) then
                        Tween(v900:FindFirstChild("Island 4").CFrame);
                        v357["Island 4"] = true;
                        AutoNextIsland = false;
                        wait();
                        AutoNextIsland = true;
                    elseif (v900:FindFirstChild("Island 5") and not v357["Island 5"]) then
                        Tween(v900:FindFirstChild("Island 5").CFrame);
                        v357["Island 5"] = true;
                        AutoNextIsland = false;
                        wait();
                        AutoNextIsland = true;
                    end
                end
            end);
        end
    end
end);

local ToggleAwake = Tabs.Raid:AddToggle("ToggleAwake", {Title = "Auto Awake", Default = false})
ToggleAwake:OnChanged(
    function(Value)
        AutoAwakenAbilities = Value
    end
)
Options.ToggleAwake:SetValue(false)
spawn(
    function()
        while wait() do
            if AutoAwakenAbilities then
                pcall(
                    function()
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Awakener", "Awaken")
                    end
                )
            end
        end
    end
)

local ToggleGetFruit = Tabs.Raid:AddToggle("ToggleGetFruit", {Title = "Get Fruit Low Bely", Default = false})
ToggleGetFruit:OnChanged(
    function(Value)
        _G.Autofruit = Value
    end
)

spawn(
    function()
        while wait(.1) do
            pcall(
                function()
                    if _G.Autofruit then
                        local args = {
                            [1] = "LoadFruit",
                            [2] = "Rocket-Rocket"
                        }

                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

                        local args = {
                            [1] = "LoadFruit",
                            [2] = "Spin-Spin"
                        }

                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

                        local args = {
                            [1] = "LoadFruit",
                            [2] = "Chop-Chop"
                        }

                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

                        local args = {
                            [1] = "LoadFruit",
                            [2] = "Spring-Spring"
                        }

                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

                        local args = {
                            [1] = "LoadFruit",
                            [2] = "Bomb-Bomb"
                        }

                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

                        local args = {
                            [1] = "LoadFruit",
                            [2] = "Smoke-Smoke"
                        }

                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

                        local args = {
                            [1] = "LoadFruit",
                            [2] = "Spike-Spike"
                        }

                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

                        local args = {
                            [1] = "LoadFruit",
                            [2] = "Flame-Flame"
                        }

                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

                        local args = {
                            [1] = "LoadFruit",
                            [2] = "Falcon-Falcon"
                        }

                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

                        local args = {
                            [1] = "LoadFruit",
                            [2] = "Ice-Ice"
                        }

                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

                        local args = {
                            [1] = "LoadFruit",
                            [2] = "Sand-Sand"
                        }

                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

                        local args = {
                            [1] = "LoadFruit",
                            [2] = "Dark-Dark"
                        }

                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

                        local args = {
                            [1] = "LoadFruit",
                            [2] = "Ghost-Ghost"
                        }

                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

                        local args = {
                            [1] = "LoadFruit",
                            [2] = "Diamond-Diamond"
                        }

                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

                        local args = {
                            [1] = "LoadFruit",
                            [2] = "Light-Light"
                        }

                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

                        local args = {
                            [1] = "LoadFruit",
                            [2] = "Rubber-Rubber"
                        }

                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

                        local args = {
                            [1] = "LoadFruit",
                            [2] = "Barrier-Barrier"
                        }

                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                    end
                end
            )
        end
    end
)

if Second_Sea then
    Tabs.Raid:AddButton(
        {
            Title = "Teleport To Raid Lab",
            Description = "",
            Callback = function()
                Tween2(CFrame.new(-6438.73535, 250.645355, -4501.50684))
            end
        }
    )
elseif Third_Sea then
    Tabs.Raid:AddButton(
        {
            Title = "Teleport To Raid Lab",
            Description = "",
            Callback = function()
                Tween2(
                    CFrame.new(
                        -5017.40869,
                        314.844055,
                        -2823.0127,
                        -0.925743818,
                        4.48217499e-08,
                        -0.378151238,
                        4.55503146e-09,
                        1,
                        1.07377559e-07,
                        0.378151238,
                        9.7681621e-08,
                        -0.925743818
                    )
                )
            end
        }
    )
end

local Mastery = Tabs.Raid:AddSection("Law Raid")

local ToggleLaw = Tabs.Raid:AddToggle("ToggleLaw", {Title = "Auto Law", Default = false})

ToggleLaw:OnChanged(
    function(Value)
        Auto_Law = Value
    end
)
Options.ToggleLaw:SetValue(false)
spawn(
    function()
        pcall(
            function()
                while wait() do
                    if Auto_Law then
                        if
                            not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Microchip") and
                                not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Microchip") and
                                not game:GetService("Workspace").Enemies:FindFirstChild("Order") and
                                not game:GetService("ReplicatedStorage"):FindFirstChild("Order")
                         then
                            wait(0.3)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                "BlackbeardReward",
                                "Microchip",
                                "1"
                            )
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                "BlackbeardReward",
                                "Microchip",
                                "2"
                            )
                        end
                    end
                end
            end
        )
    end
)

spawn(
    function()
        pcall(
            function()
                while wait(0.4) do
                    if Auto_Law then
                        if
                            not game:GetService("Workspace").Enemies:FindFirstChild("Order") and
                                not game:GetService("ReplicatedStorage"):FindFirstChild("Order")
                         then
                            if
                                game:GetService("Players").LocalPlayer.Character:FindFirstChild("Microchip") or
                                    game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Microchip")
                             then
                                fireclickdetector(
                                    game:GetService("Workspace").Map.CircleIsland.RaidSummon.Button.Main.ClickDetector
                                )
                            end
                        end
                        if
                            game:GetService("ReplicatedStorage"):FindFirstChild("Order") or
                                game:GetService("Workspace").Enemies:FindFirstChild("Order")
                         then
                            if game:GetService("Workspace").Enemies:FindFirstChild("Order") then
                                for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                    if v.Name == "Order" then
                                        repeat
                                            wait(0)

                                            AutoHaki()
                                            EquipTool(SelectWeapon)
                                            Tween(v.HumanoidRootPart.CFrame * CFrame.new(posX, posY, posZ))
                                            v.HumanoidRootPart.CanCollide = false
                                            v.HumanoidRootPart.Size = Vector3.new(120, 120, 120)
                                        until --Click
                                        not v.Parent or v.Humanoid.Health <= 0 or Auto_Law == false
                                    end
                                end
                            elseif game:GetService("ReplicatedStorage"):FindFirstChild("Order") then
                                Tween(CFrame.new(-6217.2021484375, 28.047645568848, -5053.1357421875))
                            end
                        end
                    end
                end
            end
        )
    end
)

--------------------------------------------------------------------------------------------------------------------------------------------
--RaceV4

Tabs.Race:AddButton(
    {
        Title = "Timple Of Time",
        Description = "",
        Callback = function()
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame =
                CFrame.new(28286.35546875, 14895.3017578125, 102.62469482421875)
        end
    }
)

Tabs.Race:AddButton(
    {
        Title = "Lever Pull",
        Description = "",
        Callback = function()
            Tween2(CFrame.new(28575.181640625, 14936.6279296875, 72.31636810302734))
        end
    }
)

Tabs.Race:AddButton(
    {
        Title = "Acient One",
        Description = "",
        Callback = function()
            Tween2(CFrame.new(28981.552734375, 14888.4267578125, -120.245849609375))
        end
    }
)

Tabs.Race:AddButton(
    {
        Title = "Tele To Clock",
        Description = "",
        Callback = function()
		    Tween2(CFrame.new(29551.9941, 15069.002, -85.5179291));
        end
    }
)


local Mastery = Tabs.Race:AddSection("Auto Race")

Tabs.Race:AddButton(
    {
        Title = "Race Door",
        Description = "",
        Callback = function()
            Game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame =
                CFrame.new(28286.35546875, 14895.3017578125, 102.62469482421875)
            wait(0.1)
            Game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame =
                CFrame.new(28286.35546875, 14895.3017578125, 102.62469482421875)
            wait(0.1)
            Game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame =
                CFrame.new(28286.35546875, 14895.3017578125, 102.62469482421875)
            wait(0.1)
            Game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame =
                CFrame.new(28286.35546875, 14895.3017578125, 102.62469482421875)
            wait(0.5)
            if game:GetService("Players").LocalPlayer.Data.Race.Value == "Human" then
                Tween2(CFrame.new(29221.822265625, 14890.9755859375, -205.99114990234375))
            elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Skypiea" then
                Tween2(CFrame.new(28960.158203125, 14919.6240234375, 235.03948974609375))
            elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Fishman" then
                Tween2(CFrame.new(28231.17578125, 14890.9755859375, -211.64173889160156))
            elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Cyborg" then
                Tween2(CFrame.new(28502.681640625, 14895.9755859375, -423.7279357910156))
            elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Ghoul" then
                Tween2(CFrame.new(28674.244140625, 14890.6767578125, 445.4310607910156))
            elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Mink" then
                Tween2(CFrame.new(29012.341796875, 14890.9755859375, -380.1492614746094))
            end
        end
    }
)

local ToggleAutotrial = Tabs.Race:AddToggle("ToggleAutotrial", {Title = "Auto Finish Trial", Default = false})
ToggleAutotrial:OnChanged(
    function(Value)
        _G.AutoQuestRace = Value
    end
)
Options.ToggleAutotrial:SetValue(false)
spawn(
    function()
        pcall(
            function()
                while wait() do
                    if _G.AutoQuestRace then
                        if (game:GetService("Players").LocalPlayer.Data.Race.Value == "Human") then
                            for v1123, v1124 in pairs(game.Workspace.Enemies:GetDescendants()) do
                                if
                                    (v1124:FindFirstChild("Humanoid") and v1124:FindFirstChild("HumanoidRootPart") and
                                        (v1124.Humanoid.Health > 0))
                                 then
                                    pcall(
                                        function()
                                            repeat
                                                wait()
                                                v1124.Humanoid.Health = 0
                                                v1124.HumanoidRootPart.CanCollide = false
                                                sethiddenproperty(
                                                    game.Players.LocalPlayer,
                                                    "SimulationRadius",
                                                    math.huge
                                                )
                                            until not _G.AutoQuestRace or not v1124.Parent or
                                                (v1124.Humanoid.Health <= 0)
                                        end
                                    )
                                end
                            end
                        elseif (game:GetService("Players").LocalPlayer.Data.Race.Value == "Skypiea") then
                            for v1470, v1471 in pairs(game:GetService("Workspace").Map.SkyTrial.Model:GetDescendants()) do
                                if (v1471.Name == "snowisland_Cylinder.081") then
                                    BTPZ(v1471.CFrame * CFrame.new(0, 0, 0))
                                end
                            end
                        elseif (game:GetService("Players").LocalPlayer.Data.Race.Value == "Fishman") then
                            for v1582, v1583 in pairs(game:GetService("Workspace").SeaBeasts.SeaBeast1:GetDescendants()) do
                                if (v1583.Name == "HumanoidRootPart") then
                                    Tween(v1583.CFrame * Pos)
                                    for v1746, v1747 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                                        if v1747:IsA("Tool") then
                                            if (v1747.ToolTip == "Melee") then
                                                game.Players.LocalPlayer.Character.Humanoid:EquipTool(v1747)
                                            end
                                        end
                                    end
                                    game:GetService("VirtualInputManager"):SendKeyEvent(
                                        true,
                                        122,
                                        false,
                                        game.Players.LocalPlayer.Character.HumanoidRootPart
                                    )
                                    game:GetService("VirtualInputManager"):SendKeyEvent(
                                        false,
                                        122,
                                        false,
                                        game.Players.LocalPlayer.Character.HumanoidRootPart
                                    )
                                    wait(0.2)
                                    game:GetService("VirtualInputManager"):SendKeyEvent(
                                        true,
                                        120,
                                        false,
                                        game.Players.LocalPlayer.Character.HumanoidRootPart
                                    )
                                    game:GetService("VirtualInputManager"):SendKeyEvent(
                                        false,
                                        120,
                                        false,
                                        game.Players.LocalPlayer.Character.HumanoidRootPart
                                    )
                                    wait(0.2)
                                    game:GetService("VirtualInputManager"):SendKeyEvent(
                                        true,
                                        99,
                                        false,
                                        game.Players.LocalPlayer.Character.HumanoidRootPart
                                    )
                                    game:GetService("VirtualInputManager"):SendKeyEvent(
                                        false,
                                        99,
                                        false,
                                        game.Players.LocalPlayer.Character.HumanoidRootPart
                                    )
                                    for v1748, v1749 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                                        if v1749:IsA("Tool") then
                                            if (v1749.ToolTip == "Blox Fruit") then
                                                game.Players.LocalPlayer.Character.Humanoid:EquipTool(v1749)
                                            end
                                        end
                                    end
                                    game:GetService("VirtualInputManager"):SendKeyEvent(
                                        true,
                                        122,
                                        false,
                                        game.Players.LocalPlayer.Character.HumanoidRootPart
                                    )
                                    game:GetService("VirtualInputManager"):SendKeyEvent(
                                        false,
                                        122,
                                        false,
                                        game.Players.LocalPlayer.Character.HumanoidRootPart
                                    )
                                    wait(0.2)
                                    game:GetService("VirtualInputManager"):SendKeyEvent(
                                        true,
                                        120,
                                        false,
                                        game.Players.LocalPlayer.Character.HumanoidRootPart
                                    )
                                    game:GetService("VirtualInputManager"):SendKeyEvent(
                                        false,
                                        120,
                                        false,
                                        game.Players.LocalPlayer.Character.HumanoidRootPart
                                    )
                                    wait(0.2)
                                    game:GetService("VirtualInputManager"):SendKeyEvent(
                                        true,
                                        99,
                                        false,
                                        game.Players.LocalPlayer.Character.HumanoidRootPart
                                    )
                                    game:GetService("VirtualInputManager"):SendKeyEvent(
                                        false,
                                        99,
                                        false,
                                        game.Players.LocalPlayer.Character.HumanoidRootPart
                                    )
                                    wait()
                                    for v1750, v1751 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                                        if v1751:IsA("Tool") then
                                            if (v1751.ToolTip == "Sword") then
                                                game.Players.LocalPlayer.Character.Humanoid:EquipTool(v1751)
                                            end
                                        end
                                    end
                                    game:GetService("VirtualInputManager"):SendKeyEvent(
                                        true,
                                        122,
                                        false,
                                        game.Players.LocalPlayer.Character.HumanoidRootPart
                                    )
                                    game:GetService("VirtualInputManager"):SendKeyEvent(
                                        false,
                                        122,
                                        false,
                                        game.Players.LocalPlayer.Character.HumanoidRootPart
                                    )
                                    wait(0.2)
                                    game:GetService("VirtualInputManager"):SendKeyEvent(
                                        true,
                                        120,
                                        false,
                                        game.Players.LocalPlayer.Character.HumanoidRootPart
                                    )
                                    game:GetService("VirtualInputManager"):SendKeyEvent(
                                        false,
                                        120,
                                        false,
                                        game.Players.LocalPlayer.Character.HumanoidRootPart
                                    )
                                    wait(0.2)
                                    game:GetService("VirtualInputManager"):SendKeyEvent(
                                        true,
                                        99,
                                        false,
                                        game.Players.LocalPlayer.Character.HumanoidRootPart
                                    )
                                    game:GetService("VirtualInputManager"):SendKeyEvent(
                                        false,
                                        99,
                                        false,
                                        game.Players.LocalPlayer.Character.HumanoidRootPart
                                    )
                                    wait()
                                    for v1752, v1753 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                                        if v1753:IsA("Tool") then
                                            if (v1753.ToolTip == "Gun") then
                                                game.Players.LocalPlayer.Character.Humanoid:EquipTool(v1753)
                                            end
                                        end
                                    end
                                    game:GetService("VirtualInputManager"):SendKeyEvent(
                                        true,
                                        122,
                                        false,
                                        game.Players.LocalPlayer.Character.HumanoidRootPart
                                    )
                                    game:GetService("VirtualInputManager"):SendKeyEvent(
                                        false,
                                        122,
                                        false,
                                        game.Players.LocalPlayer.Character.HumanoidRootPart
                                    )
                                    wait(0.2)
                                    game:GetService("VirtualInputManager"):SendKeyEvent(
                                        true,
                                        120,
                                        false,
                                        game.Players.LocalPlayer.Character.HumanoidRootPart
                                    )
                                    game:GetService("VirtualInputManager"):SendKeyEvent(
                                        false,
                                        120,
                                        false,
                                        game.Players.LocalPlayer.Character.HumanoidRootPart
                                    )
                                    wait(0.2)
                                    game:GetService("VirtualInputManager"):SendKeyEvent(
                                        true,
                                        99,
                                        false,
                                        game.Players.LocalPlayer.Character.HumanoidRootPart
                                    )
                                    game:GetService("VirtualInputManager"):SendKeyEvent(
                                        false,
                                        99,
                                        false,
                                        game.Players.LocalPlayer.Character.HumanoidRootPart
                                    )
                                end
                            end
                        elseif (game:GetService("Players").LocalPlayer.Data.Race.Value == "Cyborg") then
                            Tween(CFrame.new(28654, 14898.7832, -30, 1, 0, 0, 0, 1, 0, 0, 0, 1))
                        elseif (game:GetService("Players").LocalPlayer.Data.Race.Value == "Ghoul") then
                            for v1764, v1765 in pairs(game.Workspace.Enemies:GetDescendants()) do
                                if
                                    (v1765:FindFirstChild("Humanoid") and v1765:FindFirstChild("HumanoidRootPart") and
                                        (v1765.Humanoid.Health > 0))
                                 then
                                    pcall(
                                        function()
                                            repeat
                                                wait()
                                                v1765.Humanoid.Health = 0
                                                v1765.HumanoidRootPart.CanCollide = false
                                                sethiddenproperty(
                                                    game.Players.LocalPlayer,
                                                    "SimulationRadius",
                                                    math.huge
                                                )
                                            until not _G.AutoQuestRace or not v1765.Parent or
                                                (v1765.Humanoid.Health <= 0)
                                        end
                                    )
                                end
                            end
                        elseif (game:GetService("Players").LocalPlayer.Data.Race.Value == "Mink") then
                            for v1790, v1791 in pairs(game:GetService("Workspace"):GetDescendants()) do
                                if (v1791.Name == "StartPoint") then
                                    Tween(v1791.CFrame * CFrame.new(0, 10, 0))
                                end
                            end
                        end
                    end
                end
            end
        )
    end
)
local v146 =
    Tabs.Race:AddToggle(
    "ToggleKillTrial",
    {
        Title = "Auto Kill Player",
        Description = "",
        Default = false
    }
)
v146:OnChanged(
    function(v363)
        _G.AutoKillTrial = v363
    end
)
Options.ToggleKillTrial:SetValue(false)
spawn(
    function()
        while wait() do
            pcall(
                function()
                    if _G.AutoKillTrial then
                        for v870, v871 in pairs(game:GetService("Players"):GetChildren()) do
                            if
                                (v871.Name and (v871.Name ~= game.Players.LocalPlayer.Name) and
                                    ((v871.Character.HumanoidRootPart.Position -
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 100))
                             then
                                if (v871.Character.Humanoid.Health > 0) then
                                    repeat
                                        wait(_G.Fast_Delay)
                                        EquipTool(SelectWeapon)
                                        AutoHaki()
                                        Tween(v871.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 5))
                                        v871.Character.HumanoidRootPart.CanCollide = false
                                        v871.Character.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                        AttackNoCoolDown()
                                    until not _G.AutoKillTrial or not v871.Parent or
                                        (v871.Character.Humanoid.Health <= 0)
                                end
                            end
                        end
                    end
                end
            )
        end
    end
)

local Mastery = Tabs.Race:AddSection("Auto Train")

local ToggleAutoAcientQuest = Tabs.Race:AddToggle("ToggleAutoAcientQuest", {Title = "Auto Train", Default = false})
ToggleAutoAcientQuest:OnChanged(
    function(Value)
        AutoFarmAcient = Value
    end
)
Options.ToggleAutoAcientQuest:SetValue(false)
local AcientCframe = CFrame.new(216.211181640625, 126.9352035522461, -12599.0732421875)

spawn(
    function()
        pcall(
            function()
                while wait() do
                    if AutoFarmAcient then
                        if game.Players.LocalPlayer.Character.RaceTransformed.Value == true then
                            AutoFarmAcient = false
                            toTarget(CFrame.new(216.211181640625, 126.9352035522461, -12599.0732421875))
                        end
                    end
                end
            end
        )
    end
)
spawn(
    function()
        while wait() do
            if AutoFarmAcient then
                pcall(
                    function()
                        if
                            game:GetService("Workspace").Enemies:FindFirstChild("Cocoa Warrior") or
                                game:GetService("Workspace").Enemies:FindFirstChild("Chocolate Bar Battler") or
                                game:GetService("Workspace").Enemies:FindFirstChild("Sweet Thief") or
                                game:GetService("Workspace").Enemies:FindFirstChild("Candy Rebel")
                         then
                            for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if
                                    v.Name == "Cocoa Warrior" or v.Name == "Chocolate Bar Battler" or
                                        v.Name == "Sweet Thief" or
                                        v.Name == "Candy Rebel"
                                 then
                                    if
                                        v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and
                                            v.Humanoid.Health > 0
                                     then
                                        bringmob = true
                                        repeat
                                            wait(0)

                                            AutoHaki()
                                            EquipTool(SelectWeapon)
                                            v.HumanoidRootPart.CanCollide = false
                                            v.Humanoid.WalkSpeed = 0
                                            v.Head.CanCollide = false
                                            FarmPos = v.HumanoidRootPart.CFrame
                                            MonFarm = v.Name
                                            Tween(v.HumanoidRootPart.CFrame * CFrame.new(posX, posY, posZ))
                                        until not AutoFarmAcient or not v.Parent or v.Humanoid.Health <= 0
                                        bringmob = false
                                    end
                                end
                            end
                        else
                            toTarget(AcientCframe)
                        end
                    end
                )
            end
        end
    end
)
spawn(
    function()
        pcall(
            function()
                while wait() do
                    if AutoFarmAcient then
                        if game.Players.LocalPlayer.Character.RaceTransformed.Value == false then
                            AutoFarmAcient = true
                        end
                    end
                end
            end
        )
    end
)
spawn(
    function()
        while wait() do
            pcall(
                function()
                    if AutoFarmAcient then
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, "Y", false, game)
                        wait(0.1)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, "Y", false, game)
                    end
                end
            )
        end
    end
)

local ToggleEvoRace = Tabs.Race:AddToggle("ToggleEvoRace", {Title = "Auto Race V2", Default = false})
ToggleEvoRace:OnChanged(
    function(Value)
        _G.EvoRace = Value
    end
)
Options.ToggleEvoRace:SetValue(false)
spawn(
    function()
        pcall(
            function()
                while wait(0.1) do
                    if _G.EvoRace then
                        if not game:GetService("Players").LocalPlayer.Data.Race:FindFirstChild("Evolved") then
                            if (game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist", "1") == 0) then
                                topos(
                                    CFrame.new(
                                        -2779.83521,
                                        72.9661407,
                                        -3574.02002,
                                        -0.730484903,
                                        6.390141e-8,
                                        -0.68292886,
                                        3.5996322e-8,
                                        1,
                                        5.5066703e-8,
                                        0.68292886,
                                        1.5642467e-8,
                                        -0.730484903
                                    )
                                )
                                if
                                    ((Vector3.new(-2779.83521, 72.9661407, -3574.02002) -
                                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <=
                                        4)
                                 then
                                    wait(1.3)
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist", "2")
                                end
                            elseif
                                (game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist", "1") == 1)
                             then
                                pcall(
                                    function()
                                        if
                                            (not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(
                                                "Flower 1"
                                            ) and
                                                not game:GetService("Players").LocalPlayer.Character:FindFirstChild(
                                                    "Flower 1"
                                                ))
                                         then
                                            topos(game:GetService("Workspace").Flower1.CFrame)
                                        elseif
                                            (not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(
                                                "Flower 2"
                                            ) and
                                                not game:GetService("Players").LocalPlayer.Character:FindFirstChild(
                                                    "Flower 2"
                                                ))
                                         then
                                            topos(game:GetService("Workspace").Flower2.CFrame)
                                        elseif
                                            (not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(
                                                "Flower 3"
                                            ) and
                                                not game:GetService("Players").LocalPlayer.Character:FindFirstChild(
                                                    "Flower 3"
                                                ))
                                         then
                                            if game:GetService("Workspace").Enemies:FindFirstChild("Zombie") then
                                                for v2664, v2665 in pairs(
                                                    game:GetService("Workspace").Enemies:GetChildren()
                                                ) do
                                                    if (v2665.Name == "Zombie") then
                                                        repeat
                                                            task.wait()
                                                            AutoHaki()
                                                            EquipWeapon(_G.SelectWeapon)
                                                            topos(v2665.HumanoidRootPart.CFrame * Pos)
                                                            v2665.HumanoidRootPart.CanCollide = false
                                                            v2665.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                                            PosMonEvo = v2665.HumanoidRootPart.CFrame
                                                            StartEvoMagnet = true
                                                        until game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(
                                                            "Flower 3"
                                                        ) or
                                                            not v2665.Parent or
                                                            (v2665.Humanoid.Health <= 0) or
                                                            (_G.EvoRace == false)
                                                        StartEvoMagnet = false
                                                    end
                                                end
                                            else
                                                StartEvoMagnet = false
                                                topos(CFrame.new(-5685.9233398438, 48.480125427246, -853.23724365234))
                                            end
                                        end
                                    end
                                )
                            elseif
                                (game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist", "1") == 2)
                             then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist", "3")
                            end
                        end
                    end
                end
            end
        )
    end
)

-----------------------------------------------Tab Shop--------------------------------------

local ToggleRandomBone = Tabs.Shop:AddToggle("ToggleRandomBone", {Title = "Random Bone", Default = false})
ToggleRandomBone:OnChanged(
    function(Value)
        _G.AutoRandomBone = Value
    end
)
Options.ToggleRandomBone:SetValue(false)

spawn(
    function()
        while wait(0.0000000000000000000000000000000000000000000000000001) do
            if _G.AutoRandomBone then
                local args = {
                    [1] = "Bones",
                    [2] = "Buy",
                    [3] = 1,
                    [4] = 1
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            end
        end
    end
)

Tabs.Shop:AddButton(
    {
        Title = "Pray",
        Description = "",
        Callback = function()
            local v573 = {
                [1] = "gravestoneEvent",
                [2] = 2
            };
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v573));
        end
    }
)

Tabs.Shop:AddButton(
    {
        Title = "Try Luck",
        Description = "",
        Callback = function()
            local v572 = {
                [1] = "gravestoneEvent",
                [2] = 1
            };
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v572));
        end
    }
)

Tabs.Shop:AddButton(
    {
        Title = "Geppo",
        Description = "",
        Callback = function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki", "Geppo")
        end
    }
)

Tabs.Shop:AddButton(
    {
        Title = "Buso Haki",
        Description = "",
        Callback = function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki", "Buso")
        end
    }
)

Tabs.Shop:AddButton(
    {
        Title = "Soru",
        Description = "",
        Callback = function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki", "Soru")
        end
    }
)

Tabs.Shop:AddButton(
    {
        Title = "Ken Haki",
        Description = "",
        Callback = function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenTalk", "Buy")
        end
    }
)

local Mastery = Tabs.Shop:AddSection("Fighting Styles")

Tabs.Shop:AddButton(
    {
        Title = "Black Leg",
        Description = "",
        Callback = function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBlackLeg")
        end
    }
)

Tabs.Shop:AddButton(
    {
        Title = "Electro",
        Description = "",
        Callback = function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectro")
        end
    }
)
Tabs.Shop:AddButton(
    {
        Title = "Fishman Karate",
        Description = "",
        Callback = function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate")
        end
    }
)
Tabs.Shop:AddButton(
    {
        Title = "Dragon Claw",
        Description = "",
        Callback = function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "1")
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "2")
        end
    }
)
Tabs.Shop:AddButton(
    {
        Title = "Superhuman",
        Description = "",
        Callback = function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman")
        end
    }
)
Tabs.Shop:AddButton(
    {
        Title = "Death Step",
        Description = "",
        Callback = function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep")
        end
    }
)
Tabs.Shop:AddButton(
    {
        Title = "Sharkman Karate",
        Description = "",
        Callback = function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate", true)
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate")
        end
    }
)
Tabs.Shop:AddButton(
    {
        Title = "Electric Claw",
        Description = "",
        Callback = function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
        end
    }
)
Tabs.Shop:AddButton(
    {
        Title = "Dragon Talon",
        Description = "",
        Callback = function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon")
        end
    }
)
Tabs.Shop:AddButton(
    {
        Title = "Godhuman",
        Description = "",
        Callback = function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGodhuman")
        end
    }
)
Tabs.Shop:AddButton(
    {
        Title = "Sanguine Art",
        Description = "",
        Callback = function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySanguineArt", true)
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySanguineArt")
        end
    }
)

local Mastery = Tabs.Shop:AddSection("Misc Items")

Tabs.Shop:AddButton(
    {
        Title = "Refund Stats",
        Description = "",
        Callback = function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Refund", "1")
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Refund", "2")
        end
    }
)
Tabs.Shop:AddButton(
    {
        Title = "Reroll Race",
        Description = "",
        Callback = function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Reroll", "1")
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Reroll", "2")
        end
    }
)
Tabs.Shop:AddButton(
    {
        Title = "Change Ghoul Race",
        Description = "",
        Callback = function()
            local v366 = {
                [1] = "Ectoplasm",
                [2] = "Change",
                [3] = 4
            }
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v366))
        end
    }
)
Tabs.Shop:AddButton(
    {
        Title = "Change Cyborg Race",
        Description = "",
        Callback = function()
            local v367 = {
                [1] = "CyborgTrainer",
                [2] = "Buy"
            }
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v367))
        end
    }
)
Tabs.Shop:AddButton(
    {
        Title = "Change Draco Race",
        Description = "Go To Sea 3 Plz",
        Callback = function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                "requestEntrance",
                Vector3.new(5661.5322265625, 1013.0907592773438, -334.9649963378906)
            )
            Tween2(CFrame.new(5814.42724609375, 1208.3267822265625, 884.5785522460938))
            local v368 = Vector3.new(5814.42724609375, 1208.3267822265625, 884.5785522460938)
            local v369 = game.Players.LocalPlayer
            local v370 = v369.Character or v369.CharacterAdded:Wait()
            repeat
                wait()
            until (v370.HumanoidRootPart.Position - v368).Magnitude < 1
            local v371 = {
                [1] = {
                    NPC = "Dragon Wizard",
                    Command = "DragonRace"
                }
            }
            game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RF/InteractDragonQuest"):InvokeServer(
                unpack(v371)
            )
        end
    }
)

--------------------------------------------------------------------------------------------------------------------------------------------
--misc

local Mastery = Tabs.Misc:AddSection("Team")

Tabs.Misc:AddButton(
    {
        Title = "Join Pirates Team",
        Description = "",
        Callback = function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam", "Pirates")
        end
    }
)

Tabs.Misc:AddButton(
    {
        Title = "Join Marines Team",
        Description = "",
        Callback = function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam", "Marines")
        end
    }
)

local Mastery = Tabs.Misc:AddSection("Check Shop")

Tabs.Misc:AddButton(
    {
        Title = "Devil Shop Menu",
        Description = "",
        Callback = function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetFruits")
            game:GetService("Players").LocalPlayer.PlayerGui.Main.FruitShop.Visible = true
        end
    }
)

Tabs.Misc:AddButton(
    {
        Title = "Color Haki Menu",
        Description = "",
        Callback = function()
            game.Players.localPlayer.PlayerGui.Main.Colors.Visible = true
        end
    }
)

Tabs.Misc:AddButton(
    {
        Title = "Title Name Menu",
        Description = "",
        Callback = function()
            local args = {
                [1] = "getTitles"
            }
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            game.Players.localPlayer.PlayerGui.Main.Titles.Visible = true
        end
    }
)

Tabs.Misc:AddButton(
    {
        Title = "Awakening Menu",
        Description = "",
        Callback = function()
            game:GetService("Players").LocalPlayer.PlayerGui.Main.AwakeningToggler.Visible = true
        end
    }
)

local Mastery = Tabs.Misc:AddSection("Fun")

Tabs.Misc:AddButton(
    {
        Title = "Rain Fruit",
        Description = "Rain fruit (Fake)",
        Callback = function()
            for i, v in pairs(game:GetObjects("rbxassetid://14759368201")[1]:GetChildren()) do
                v.Parent = game.Workspace.Map
                v:MoveTo(
                    game.Players.LocalPlayer.Character.PrimaryPart.Position +
                        Vector3.new(math.random(-50, 50), 100, math.random(-50, 50))
                )
                if v.Fruit:FindFirstChild("AnimationController") then
                    v.Fruit:FindFirstChild("AnimationController"):LoadAnimation(v.Fruit:FindFirstChild("Idle")):Play()
                end
                v.Handle.Touched:Connect(
                    function(otherPart)
                        if otherPart.Parent == game.Players.LocalPlayer.Character then
                            v.Parent = game.Players.LocalPlayer.Backpack
                            game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
                        end
                    end
                )
            end
        end
    }
)

Tabs.Misc:AddInput(
    "Input_Level",
    {
        Title = "Fake Level",
        Default = "",
        Placeholder = "",
        Numeric = false,
        Finished = false,
        Callback = function(v327)
            game:GetService("Players")["LocalPlayer"].Data.Level.Value = tonumber(v327)
        end
    }
)

Tabs.Misc:AddInput(
    "Input_EXP",
    {
        Title = "Fake EXP",
        Default = "",
        Placeholder = "",
        Numeric = false,
        Finished = false,
        Callback = function(v329)
            game:GetService("Players")["LocalPlayer"].Data.Exp.Value = tonumber(v329)
        end
    }
)

Tabs.Misc:AddInput(
    "Input_Beli",
    {
        Title = "Fake Money",
        Default = "",
        Placeholder = "",
        Numeric = false,
        Finished = false,
        Callback = function(v331)
            game:GetService("Players")["LocalPlayer"].Data.Beli.Value = tonumber(v331)
        end
    }
)
Tabs.Misc:AddInput(
    "Input_Fragments",
    {
        Title = "Fake Fragment",
        Default = "",
        Placeholder = "",
        Numeric = false,
        Finished = false,
        Callback = function(v333)
            game:GetService("Players")["LocalPlayer"].Data.Fragments.Value = tonumber(v333)
        end
    }
)

local Mastery = Tabs.Misc:AddSection("Misc")

local v150 = {
    "KITT_RESET",
    "Sub2UncleKizaru",
    "SUB2GAMERROBOT_RESET1",
    "Sub2Fer999",
    "Enyu_is_Pro",
    "JCWK",
    "StarcodeHEO",
    "MagicBus",
    "KittGaming",
    "Sub2CaptainMaui",
    "Sub2OfficalNoobie",
    "TheGreatAce",
    "Sub2NoobMaster123",
    "Sub2Daigrock",
    "Axiore",
    "StrawHatMaine",
    "TantaiGaming",
    "Bluxxy",
    "SUB2GAMERROBOT_EXP1",
    "Chandler",
    "NOMOREHACK",
    "BANEXPLOIT",
    "WildDares",
    "BossBuild",
    "GetPranked",
    "EARN_FRUITS",
    "FIGHT4FRUIT",
    "NOEXPLOITER",
    "NOOB2ADMIN",
    "CODESLIDE",
    "ADMINHACKED",
    "ADMINDARES",
    "fruitconcepts",
    "krazydares",
    "TRIPLEABUSE",
    "SEATROLLING",
    "24NOADMIN",
    "REWARDFUN",
    "NEWTROLL",
    "fudd10_v2",
    "Fudd10",
    "Bignews",
    "SECRET_ADMIN"
}
Tabs.Misc:AddButton(
    {
        Title = "Redeem All X2 Code",
        Description = "",
        Callback = function()
            for v559, v560 in ipairs(v150) do
                RedeemCode(v560)
            end
        end
    }
)
function RedeemCode(v377)
    game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(v377)
end

local ToggleRejoin = Tabs.Misc:AddToggle("ToggleRejoin", {Title = "Auto Rejoin", Default = true})
ToggleRejoin:OnChanged(
    function(Value)
        _G.AutoRejoin = Value
    end
)

Options.ToggleRejoin:SetValue(true)
spawn(
    function()
        while wait() do
            if _G.AutoRejoin then
                getgenv().rejoin =
                    game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(
                    function(child)
                        if
                            child.Name == "ErrorPrompt" and child:FindFirstChild("MessageArea") and
                                child.MessageArea:FindFirstChild("ErrorFrame")
                         then
                            game:GetService("TeleportService"):Teleport(game.PlaceId)
                        end
                    end
                )
            end
        end
    end
)

local Mastery = Tabs.Misc:AddSection("Esp")

local ToggleEspPlayer = Tabs.Misc:AddToggle("ToggleEspPlayer", {Title = "Esp Player", Default = false})

ToggleEspPlayer:OnChanged(
    function(Value)
        ESPPlayer = Value
        UpdatePlayerChams()
    end
)
Options.ToggleEspPlayer:SetValue(false)

local ToggleEspFruit = Tabs.Misc:AddToggle("ToggleEspFruit", {Title = "Esp Devil Fruit", Default = false})

ToggleEspFruit:OnChanged(
    function(Value)
        DevilFruitESP = Value
        while DevilFruitESP do
            wait()
            UpdateDevilChams()
        end
    end
)
Options.ToggleEspFruit:SetValue(false)

local ToggleEspIsland = Tabs.Misc:AddToggle("ToggleEspIsland", {Title = "Esp Island", Default = false})

ToggleEspIsland:OnChanged(
    function(Value)
        IslandESP = Value
        while IslandESP do
            wait()
            UpdateIslandESP()
        end
    end
)
Options.ToggleEspIsland:SetValue(false)

local ToggleEspFlower = Tabs.Misc:AddToggle("ToggleEspFlower", {Title = "Esp Flower", Default = false})

ToggleEspFlower:OnChanged(
    function(Value)
        FlowerESP = Value
        UpdateFlowerChams()
    end
)
Options.ToggleEspFlower:SetValue(false)

spawn(
    function()
        while wait(2) do
            if FlowerESP then
                UpdateFlowerChams()
            end
            if DevilFruitESP then
                UpdateDevilChams()
            end
            if ChestESP then
                UpdateChestChams()
            end
            if ESPPlayer then
                UpdatePlayerChams()
            end
            if RealFruitESP then
                UpdateRealFruitChams()
            end
        end
    end
)
--------------------------------
--------------------------------
local LeviIsland = Tabs.Fish:AddSection("Leviathan Island")

local AutoFindFrozenDimension =
    Tabs.Fish:AddToggle(
    "AutoFindFrozenDimension",
    {
        Title = "Auto Find Frozen Dimension",
        Description = "",
        Default = false
    }
)

Options.AutoFindFrozenDimension:SetValue(false)
AutoFindFrozenDimension:OnChanged(
    function(state)
        _G.AutoFindFrozenDimension = state
    end
)

local AvailableSeats = {}
local IsFindingBoat = false
local IslandFound = false

RunService.RenderStepped:Connect(
    function()
        if not _G.AutoFindFrozenDimension then
            IslandFound = false
            return
        end

        local LocalPlayer = PlayersService.LocalPlayer
        local Character = LocalPlayer.Character
        if not Character or not Character:FindFirstChild("Humanoid") then
            return
        end

        local function FindAndMoveToBoat()
            if IsFindingBoat then
                return
            end
            IsFindingBoat = true

            for _, seat in pairs(AvailableSeats) do
                if seat and seat.Parent and seat.Name == "VehicleSeat" and not seat.Occupant then
                    Tween2(seat.CFrame)
                    break
                end
            end

            IsFindingBoat = false
        end

        local Humanoid = Character.Humanoid
        local OnBoat = false
        local CurrentSeat = nil

        for _, boat in pairs(Workspace.Boats:GetChildren()) do
            local Seat = boat:FindFirstChild("VehicleSeat")
            if Seat and Seat.Occupant == Humanoid then
                OnBoat = true
                CurrentSeat = Seat
                AvailableSeats[boat.Name] = Seat
            elseif Seat and not Seat.Occupant then
                FindAndMoveToBoat()
            end
        end

        if not OnBoat then
            return
        end

        CurrentSeat.MaxSpeed = BoatSpeed
        CurrentSeat.CFrame =
            CFrame.new(Vector3.new(CurrentSeat.Position.X, CurrentSeat.Position.Y, CurrentSeat.Position.Z)) *
            CurrentSeat.CFrame.Rotation
        VirtualInput:SendKeyEvent(true, "W", false, game)

        for _, part in pairs(Workspace.Boats:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end

        for _, part in pairs(Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end

        local IslandNames = {
            "ShipwreckIsland",
            "SandIsland",
            "TreeIsland",
            "TinyIsland",
            "MysticIsland",
            "KitsuneIsland",
            "FrozenDimension"
        }

        for _, islandName in ipairs(IslandNames) do
            local Island = Workspace.Map:FindFirstChild(islandName)
            if Island and Island:IsA("Model") then
                Island:Destroy()
            end
        end

        local PrehistoricIsland = Workspace.Map:FindFirstChild("FrozenDimension")
        if PrehistoricIsland then
            VirtualInput:SendKeyEvent(false, "W", false, game)
            _G.AutoFindPrehistoric = false

            if not IslandFound then
                Fluent:Notify(
                    {
                        Title = "Frozen Dimension Spawn",
                        Content = "UUltimatLY Hub Notification",
                        Duration = 10
                    }
                )
                IslandFound = true
            end

            return
        end
    end
)

local ToggleTPFrozenDimension = Tabs.Fish:AddToggle("ToggleTPFrozenDimension", {
    Title = "Tween To Frozen Dimension",
    Description = "",
    Default = false
});
ToggleTPFrozenDimension:OnChanged(function(v385)
    _G.TweenToFrozenDimension = v385;
end);
Options.ToggleTPFrozenDimension:SetValue(false)
spawn(function()
    local v386;
    while not v386 do
        v386 = game:GetService("Workspace").Map:FindFirstChild("FrozenDimension");
        wait();
    end
    while wait() do
        if _G.TweenToFrozenDimension then
            if v386 then
                Tween(v386.CFrame);
            end
        end
    end
end);

local AttackLevi = Tabs.Fish:AddToggle("AttackLevi", {Title = "Auto Attack Leviathan [BETA]", Default = false})
AttackLevi:OnChanged(
    function(state)
        getgenv().KillLevi = state
    end
)
spawn(
    function()
        while wait(0.5) do
            if getgenv().KillLevi and Third_Sea then
                pcall(
                    function()
                        for _, v in pairs(game:GetService("Workspace").SeaBeasts:GetChildren()) do
                            if v.Name == "Leviathan" and v:FindFirstChild("HumanoidRootPart") then
                                repeat
                                    wait(0.2)
                                    if
                                        (game.Players.LocalPlayer.Character.HumanoidRootPart.Position -
                                            v.HumanoidRootPart.Position).Magnitude > 10
                                     then
                                        Tween2(v.HumanoidRootPart.CFrame * CFrame.new(0, 500, 0))
                                    end
                                    if not getgenv().SeaSkill then
                                        getgenv().SeaSkill = true
                                        AutoHaki()
                                        AimBotSkillPosition = v.HumanoidRootPart
                                        Skillaimbot = true
                                    end
                                until not v:FindFirstChild("HumanoidRootPart") or not getgenv().KillLevi

                                getgenv().SeaSkill = false
                                Skillaimbot = false
                            end
                        end
                    end
                )
            end
        end
    end
)

local Ship = Tabs.S:AddSection("Setting Ship")
local NoRock = Tabs.S:AddToggle("NoRock", {Title = "No Clip Ship", Default = true })
NoRock:OnChanged(function(Value)
    getgenv().GoThroughRocks = Value
end)
spawn(function()
    while wait(1) do
        if getgenv().GoThroughRocks or getgenv().SailBoat then
            for _, boat in ipairs(game:GetService("Workspace").Boats:GetChildren()) do
                for _, part in ipairs(boat:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                    end
                end
            end
        else
            for _, boat in ipairs(game:GetService("Workspace").Boats:GetChildren()) do
                for _, part in ipairs(boat:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = true
                    end
                end
            end
        end
    end
end)

Tabs.S:AddParagraph({
    Title = "Setting For Leviathan",
    Content = string.rep("-", 21)
})
Tabs.S:AddParagraph({
    Title = "Choose Weapons For Leviathan",
})
local UseFruit1 = Tabs.S:AddToggle("Toggle", {
    Title = "Select Use Fruit",
    Default = true
})
UseFruit1:OnChanged(function(value)
    getgenv().UseSeaFruitSkill = value
end)
local UseMelee1 = Tabs.S:AddToggle("UseMelee1", {
    Title = "Select Use Melee",
    Default = true
})
UseMelee1:OnChanged(function(value)
    getgenv().UseSeaMeleeSkill = value
end)
local UseSword1 = Tabs.S:AddToggle("UseSword1", {
    Title = "Select Use Sword",
    Default = true
})
UseSword1:OnChanged(function(value)
    getgenv().UseSeaSwordSkill = value
end)
local UseGun1 = Tabs.S:AddToggle("UseGun1", {
    Title = "Select Use Gun",
    Default = true
})
UseGun1:OnChanged(function(value)
    getgenv().UseSeaGunSkill = value
end)
Tabs.S:AddParagraph({
    Title = "Select Skill Fruit",
})
local UseSkillFruit = Tabs.S:AddToggle("UseSkillFruit", {
    Title = "Skill Fruit Z",
    Default = true
})
UseSkillFruit:OnChanged(function(value)
    getgenv().SkillFruitZ = value
end)
local UseSkillFruit1 = Tabs.S:AddToggle("UseSkillFruit1", {
    Title = "Skill Fruit X",
    Default = true
})
UseSkillFruit1:OnChanged(function(value)
    getgenv().SkillFruitX = value
end)
local UseSkillFruit2 = Tabs.S:AddToggle("UseSkillFruit2", {
    Title = "Skill Fruit C",
    Default = true
})
UseSkillFruit2:OnChanged(function(value)
    getgenv().SkillFruitC = value
end)
local UseSkillFruit3 = Tabs.S:AddToggle("UseSkillFruit3", {
    Title = "Skill Fruit V",
    Default = false
})
UseSkillFruit3:OnChanged(function(value)
    getgenv().SkillFruitV = value
end)
local UseSkillFruit4 = Tabs.S:AddToggle("UseSkillFruit4", {
    Title = "Skill Fruit F",
    Default = false
})
UseSkillFruit4:OnChanged(function(value)
    getgenv().SkillFruitF = value
end)
Tabs.S:AddParagraph({
    Title = "Select Skill Melee",
})
local UseSkillMelee = Tabs.S:AddToggle("UseSkillMelee", {
    Title = "Skill Melee Z",
    Default = true
})
UseSkillMelee:OnChanged(function(value)
    getgenv().SkillMeleeZ = value
end)
local UseSkillMelee1 = Tabs.S:AddToggle("UseSkillMelee1", {
    Title = "Skill Melee X",
    Default = true
})
UseSkillMelee1:OnChanged(function(value)
    getgenv().SkillMeleeX = value
end)
local UseSkillMelee2 = Tabs.S:AddToggle("UseSkillMelee2", {
    Title = "Skill Melee C",
    Default = true
})
UseSkillMelee2:OnChanged(function(value)
    getgenv().SkillMeleeC = value
end)
Tabs.S:AddParagraph({
    Title = "Setting Skill Sword And Gun",
    Content = string.rep("-", 21)
})
Tabs.S:AddParagraph({
    Title = "Select Skill Sword And Gun",
})
local UseSkillSword = Tabs.S:AddToggle("UseSkillSword", {
    Title = "Sword And Gun Skill Z",
    Default = true
})
UseSkillSword:OnChanged(function(value)
    getgenv().SkillSwordZ = value
    getgenv().SkillGunZ = value
end) 
local UseSkillSword1 = Tabs.S:AddToggle("UseSkillSword1", {
    Title = "Sword And Gun Skill X",
    Default = true
})
UseSkillSword1:OnChanged(function(value)
    getgenv().SkillSwordX = value
    getgenv().SkillGunX = value
end)
local gg = getrawmetatable(game)
local old = gg.__namecall
setreadonly(gg, false)
gg.__namecall = newcclosure(function(...)
    local method = getnamecallmethod()
    local args = {...}    
    if tostring(method) == "FireServer" then
        if tostring(args[1]) == "RemoteEvent" then
            if tostring(args[2]) ~= "true" and tostring(args[2]) ~= "false" then
                if Skillaimbot then
                    args[2] = AimBotSkillPosition
                    return old(unpack(args))
                end
            end
        end
    end
    return old(...)
end)
local function useSkill(skillKey, holdTime)
    game:service('VirtualInputManager'):SendKeyEvent(true, skillKey, false, game)
    wait(holdTime or 0.1)
    game:service('VirtualInputManager'):SendKeyEvent(false, skillKey, false, game)
end
spawn(function()
    while task.wait(0.5) do
        pcall(function()
            if UseSkill then
                for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if v.Name == MonFarm and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") 
                    and v.Humanoid.Health <= v.Humanoid.MaxHealth * getgenv().Kill_At / 100 then                        
                        if getgenv().SkillZ then useSkill("Z", getgenv().HoldSKillZ) end
                        if getgenv().SkillX then useSkill("X", getgenv().HoldSKillX) end
                        if getgenv().SkillC then useSkill("C", getgenv().HoldSKillC) end
                    end
                end
            end
        end)
    end
end)
spawn(function()
    while wait(0.5) do
        pcall(function()
            if UseGunSkill then
                for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if v.Name == MonFarm and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") 
                    and v.Humanoid.Health <= v.Humanoid.MaxHealth * getgenv().Kill_At / 100 then                        
                        if getgenv().SkillZ then useSkill("Z", 0.1) end
                    end
                end
            end
        end)
    end
end)
--------------------------------------------------
local v171 = Tabs.Volcanic:AddToggle("ToggleDefendVolcano", {
    Title = "Auto Start Event",
    Description = "",
    Default = false
});
v171:OnChanged(function(v401)
    _G.AutoDefendVolcano = v401;
end);
local v175 = Tabs.Volcanic:AddToggle("ToggleKillAura", {
    Title = "Auto Kill Golems",
    Description = "",
    Default = false
});
v175:OnChanged(function(v413)
    KillAura = v413;
end);
Options.ToggleKillAura:SetValue(false);
spawn(function()
    while wait() do
        if KillAura then
            pcall(function()
                for v884, v885 in pairs(game.Workspace.Enemies:GetDescendants()) do
                    if (v885:FindFirstChild("Humanoid") and v885:FindFirstChild("HumanoidRootPart") and (v885.Humanoid.Health > 0)) then
                        repeat
                            task.wait();
                            sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge);
                            v885.Humanoid.Health = 0;
                            v885.HumanoidRootPart.CanCollide = false;
                        until not KillAura or not v885.Parent or (v885.Humanoid.Health <= 0)
                    end
                end
            end);
        end
    end
end);

local v176 =
    Tabs.Volcanic:AddToggle(
    "ToggleCollectBone",
    {
        Title = "Collect Bone",
        Description = "",
        Default = false
    }
)
v176:OnChanged(
    function(v414)
        _G.AutoCollectBone = v414
    end
)
spawn(
    function()
        while wait() do
            if _G.AutoCollectBone then
                for v820, v821 in pairs(workspace:GetDescendants()) do
                    if (v821:IsA("BasePart") and (v821.Name == "DinoBone")) then
                        Tween2(CFrame.new(v821.Position))
                    end
                end
            end
        end
    end
)

local v177 =
    Tabs.Volcanic:AddToggle(
    "ToggleCollectEgg",
    {
        Title = "Collect Egg",
        Description = "",
        Default = false
    }
)
v177:OnChanged(
    function(v415)
        _G.AutoCollectEgg = v415
    end
)
spawn(
    function()
        while wait() do
            if _G.AutoCollectEgg then
                local v758 = workspace.Map.PrehistoricIsland.Core.SpawnedDragonEggs:GetChildren()
                if (#v758 > 0) then
                    local v886 = v758[math.random(1, #v758)]
                    if (v886:IsA("Model") and v886.PrimaryPart) then
                        Tween2(v886.PrimaryPart.CFrame)
                        local v1127 = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
                        local v1128 = v886.PrimaryPart.Position
                        local v1129 = (v1127 - v1128).Magnitude
                        if (v1129 <= 1) then
                            game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
                            wait(1.5)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false, "E", false, game)
                        end
                    end
                end
            end
        end
    end
)

local DracoRace =
    Tabs.Volcanic:AddToggle(
    "DracoRace",
    {
        Title = "Tp to Draco Trial Door",
        Description = "",
        Default = false
    }
)
DracoRace:OnChanged(
    function(Value)
        _G.AutoTrialTeleport = Value
    end
)
spawn(
    function()
        while wait() do
            if _G.AutoTrialTeleport then
                local Prehistoric = workspace.Map.PrehistoricIsland:FindFirstChild("TrialTeleport")
                if (Prehistoric and Prehistoric:IsA("Part")) then
                    Tween2(CFrame.new(Prehistoric.Position))
                end
            end
        end
    end
)

local FarmPri = Tabs.S:AddSection("Setting For Volcano Event")

local v107 = Tabs.S:AddToggle("ToggleMelee", {
    Title = "Spam Skill Melle",
    Description = "",
    Default = false
});
v107:OnChanged(function(v402)
    _G.UseMelee = v402;
end);
local v109 = Tabs.S:AddToggle("ToggleSword", {
    Title = "Spam Skill Sword",
    Description = "",
    Default = false
});
v109:OnChanged(function(v403)
    _G.UseSword = v403;
end);
local v110 = Tabs.S:AddToggle("ToggleGun", {
    Title = "Spam Skill Gun",
    Description = "",
    Default = false
});
v110:OnChanged(function(v404)
    _G.UseGun = v404;
end);
local v111 = Tabs.S:AddToggle("ToggleFruit", {
    Title = "Spam Skill Fruit",
    Description = "",
    Default = false
});
v111:OnChanged(function(v4099)
    _G.UseFruit = v4099;
end);
local function v172(v405)
    game:GetService("VirtualInputManager"):SendKeyEvent(true, v405, false, game);
    game:GetService("VirtualInputManager"):SendKeyEvent(false, v405, false, game);
end
local function v173()
    local v406 = game.Workspace.Map.PrehistoricIsland.Core:FindFirstChild("InteriorLava");
    if (v406 and v406:IsA("Model")) then
        v406:Destroy();
    end
    local v407 = game.Workspace.Map:FindFirstChild("PrehistoricIsland");
    if v407 then
        for v750, v751 in pairs(v407:GetDescendants()) do
            if (v751:IsA("Part") and v751.Name:lower():find("lava")) then
                v751:Destroy();
            end
        end
    end
    local v408 = game.Workspace.Map:FindFirstChild("PrehistoricIsland");
    if v408 then
        for v752, v753 in pairs(v408:GetDescendants()) do
            if v753:IsA("Model") then
                for v905, v906 in pairs(v753:GetDescendants()) do
                    if (v906:IsA("MeshPart") and v906.Name:lower():find("lava")) then
                        v906:Destroy();
                    end
                end
            end
        end
    end
end
local function v174()
    local v409 = game.Workspace.Map.PrehistoricIsland.Core.VolcanoRocks;
    for v564, v565 in pairs(v409:GetChildren()) do
        if v565:IsA("Model") then
            local v754 = v565:FindFirstChild("volcanorock");
            if (v754 and v754:IsA("MeshPart")) then
                local v881 = v754.Color;
                if ((v881 == Color3.fromRGB(185, 53, 56)) or (v881 == Color3.fromRGB(185, 53, 57))) then
                    return v754;
                end
            end
        end
    end
    return nil;
end
local function v162(v410)
    local v411 = game.Players.LocalPlayer;
    local v412 = v411.Backpack;
    for v566, v567 in pairs(v412:GetChildren()) do
        if (v567:IsA("Tool") and (v567.ToolTip == v410)) then
            v567.Parent = v411.Character;
            for v818, v819 in ipairs({
                "Z",
                "X",
                "C",
                "V",
                "F"
            }) do
                wait();
                pcall(function()
                    v172(v819);
                end);
            end
            v567.Parent = v412;
            break;
        end
    end
end
spawn(function()
    while wait() do
        if _G.AutoDefendVolcano then
            AutoHaki();
            pcall(v173);
            local v757 = v174();
            if v757 then
                local v882 = CFrame.new(v757.Position + Vector3.new(0, 0, 0));
                Tween2(v882);
                local v883 = v757.Color;
                if ((v883 ~= Color3.fromRGB(185, 53, 56)) and (v883 ~= Color3.fromRGB(185, 53, 57))) then
                    v757 = v174();
                else
                    local v1125 = game.Players.LocalPlayer.Character.HumanoidRootPart.Position;
                    local v1126 = ((v1125 - v757.Position) - Vector3.new(0, 0, 0)).Magnitude;
                    if (v1126 <= 1) then
                        if _G.UseMelee then
                            v162("Melee");
                        end
                        if _G.UseSword then
                            v162("Sword");
                        end
                        if _G.UseGun then
                            v162("Gun");
                        end
			if _G.UseFruit then
                            v162("Fruit");
                        end		
                    end
                    _G.TweenToPrehistoric = false;
                end
            else
                _G.TweenToPrehistoric = true;
            end
        end
    end
end);
