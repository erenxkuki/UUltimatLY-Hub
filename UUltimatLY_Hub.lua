
-- Made By The Goated RealRyzu
local WindUI = (loadstring(game:HttpGet("https://raw.githubusercontent.com/erenxkuki/UltimateHub/refs/heads/main/lib.lua%20(1)%20(2).lua")))();
local Window = WindUI:CreateWindow({
	Title = "UUltimatLY Hub [Freemium]",
	Author = "Blox Fruits",
	Folder = "UUltimatLY Hub",
	Icon = "rbxassetid://73642467719097",
	Background = "rbxassetid://126536800211376",
	Size = UDim2.fromOffset(450, 300),
	MinSize = Vector2.new(520, 330),
	Transparent = false,
	Theme = "Dark",
	SideBarWidth = 180,
	HideSearchBar = true,
	ScrollBarEnabled = false
});
WindUI:AddTheme({
    Name = "UUltimatLYHub Theme",
    Accent = Color3.fromHex("#18181b"),
    Background = Color3.fromHex("#101010"), -- Accent
    Outline = Color3.fromHex("#FFFFFF"),
    Text = Color3.fromHex("#FFFFFF"),
    Placeholder = Color3.fromHex("#7a7a7a"),
    Button = WindUI:Gradient({                                                      
				["0"] = { Color = Color3.fromHex("#fb2c36"), Transparency = 0 },            
				["100"]   = { Color = Color3.fromHex("#ff6900"), Transparency = 0 },      
			}, {                                                                            
				Rotation = 0,                                                               
			}),
    Icon = Color3.fromHex("#a1a1aa"),
})
WindUI:SetTheme("UUltimatLYHub Theme")
Window:EditOpenButton({
	Icon = "rbxassetid://73642467719097",
	CornerRadius = UDim.new(0, 10),
	Position = UDim2.new(0, 75, 0, 100),
	OnlyMobile = false,
	Enabled = true,
	Draggable = true
});
local Tabs = {
	MainTab = Window:Tab({
		Title = "Main",
		Icon = "rbxassetid://10723407389"
	}),
	OthersTab = Window:Tab({
		Title = "Others",
		Icon = "inbox"
	}),
	ItemsTab = Window:Tab({
		Title = "Items",
		Icon = "box"
	}),
	SettingsTab = Window:Tab({
		Title = "Settings",
		Icon = "settings"
	}),
	LocalPlayerTab = Window:Tab({
		Title = "Local Player",
		Icon = "user"
	}),
	StatsTab = Window:Tab({
		Title = "Stats",
		Icon = "rbxassetid://10709770317"
	}),
	SeaEventTab = Window:Tab({
		Title = "Sea Event",
		Icon = "anchor"
	}),
	SeaStackTab = Window:Tab({
		Title = "Sea Stack",
		Icon = "waves"
	}),
	SeaSettingsTab = Window:Tab({
		Title = "Sea Settings",
		Icon = "cog"
	}),
	DragonDojoTab = Window:Tab({
		Title = "Dragon Dojo",
		Icon = "shield"
	}),
	RaceTab = Window:Tab({
		Title = "Race",
		Icon = "bot"
	}),
	CombatTab = Window:Tab({
		Title = "Combat",
		Icon = "sword"
	}),
	RaidTab = Window:Tab({
		Title = "Raid",
		Icon = "rbxassetid://10723345749"
	}),
	EspTab = Window:Tab({
		Title = "Esp",
		Icon = "rbxassetid://10723346959"
	}),
	TeleportTab = Window:Tab({
		Title = "Teleport",
		Icon = "rbxassetid://10734886004"
	}),
	ShopTab = Window:Tab({
		Title = "Shop",
		Icon = "shopping-cart"
	}),
	FruitTab = Window:Tab({
		Title = "Fruit",
		Icon = "rbxassetid://10734883986"
	}),
	MiscTab = Window:Tab({
		Title = "Misc",
		Icon = "layout-grid"
	}),
	ServerTab = Window:Tab({
		Title = "Server",
		Icon = "server"
	})
};
Window:SelectTab(1);

-- [[ Initialize Script Variables ]] --

_G.SelectWeapon = "Melee"
_G.FarmLevelMethod = "Quest"
_G.MasteryMethod = "Quest"
_G.FarmDistance = 35
_G.PlayerTweenSpeed = 300
_G.BringMob = true
_G.BringMobMode = "Normal"
_G.AttackAura = true


if game.PlaceId == 2753915549 then
	World1 = true;
elseif game.PlaceId == 4442272183 then
	World2 = true;
elseif game.PlaceId == 7449423635 then
	World3 = true;
end;

-- [[ Declare Variables ]] --
Workspace = game:GetService("Workspace");
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local Character
local Humanoid
local HumanoidRootPart
local MyLevel

local function SetupCharacter(char)
    Character = char
    Humanoid = char:WaitForChild("Humanoid")
    HumanoidRootPart = char:WaitForChild("HumanoidRootPart")
end

if LocalPlayer.Character then
    SetupCharacter(LocalPlayer.Character)
end

LocalPlayer.CharacterAdded:Connect(function(char)
    SetupCharacter(char)
end)

MyLevel = LocalPlayer:WaitForChild("Data"):WaitForChild("Level").Value

ReplicatedStorage = game.ReplicatedStorage
Remotes = ReplicatedStorage.Remotes
Enemies = Workspace.Enemies
RunService = game:GetService("RunService")
TweenService = game:GetService("TweenService")
VirtualInputManager = game:GetService("VirtualInputManager")
TeleportService = game:GetService("TeleportService");

function sendKeySkill(skill)
    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode[skill], false, game)
    task.wait(0.1)
    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode[skill], false, game)
end

function CheckQuest()
	if World1 then
		if MyLevel == 1 or MyLevel <= 9 then
			Mon = "Bandit";
			LevelQuest = 1;
			NameQuest = "BanditQuest1";
			NameMon = "Bandit";
			CFrameQuest = CFrame.new(1059.37195, 15.4495068, 1550.4231, 0.939700544, -0, -0.341998369, 0, 1, -0, 0.341998369, 0, 0.939700544);
			CFrameMon = CFrame.new(1045.962646484375, 27.00250816345215, 1560.8203125);
		elseif MyLevel == 10 or MyLevel <= 14 then
			Mon = "Monkey";
			LevelQuest = 1;
			NameQuest = "JungleQuest";
			NameMon = "Monkey";
			CFrameQuest = CFrame.new(-1598.08911, 35.5501175, 153.377838, 0, 0, 1, 0, 1, -0, -1, 0, 0);
			CFrameMon = CFrame.new(-1448.51806640625, 67.85301208496094, 11.46579647064209);
		elseif MyLevel == 15 or MyLevel <= 29 then
			Mon = "Gorilla";
			LevelQuest = 2;
			NameQuest = "JungleQuest";
			NameMon = "Gorilla";
			CFrameQuest = CFrame.new(-1598.08911, 35.5501175, 153.377838, 0, 0, 1, 0, 1, -0, -1, 0, 0);
			CFrameMon = CFrame.new(-1129.8836669921875, 40.46354675292969, -525.4237060546875);
		elseif MyLevel == 30 or MyLevel <= 39 then
			Mon = "Pirate";
			LevelQuest = 1;
			NameQuest = "BuggyQuest1";
			NameMon = "Pirate";
			CFrameQuest = CFrame.new(-1141.07483, 4.10001802, 3831.5498, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627);
			CFrameMon = CFrame.new(-1103.513427734375, 13.752052307128906, 3896.091064453125);
		elseif MyLevel == 40 or MyLevel <= 59 then
			Mon = "Brute";
			LevelQuest = 2;
			NameQuest = "BuggyQuest1";
			NameMon = "Brute";
			CFrameQuest = CFrame.new(-1141.07483, 4.10001802, 3831.5498, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627);
			CFrameMon = CFrame.new(-1140.083740234375, 14.809885025024414, 4322.92138671875);
		elseif MyLevel == 60 or MyLevel <= 74 then
			Mon = "Desert Bandit";
			LevelQuest = 1;
			NameQuest = "DesertQuest";
			NameMon = "Desert Bandit";
			CFrameQuest = CFrame.new(894.488647, 5.14000702, 4392.43359, 0.819155693, -0, -0.573571265, 0, 1, -0, 0.573571265, 0, 0.819155693);
			CFrameMon = CFrame.new(924.7998046875, 6.44867467880249, 4481.5859375);
		elseif MyLevel == 75 or MyLevel <= 89 then
			Mon = "Desert Officer";
			LevelQuest = 2;
			NameQuest = "DesertQuest";
			NameMon = "Desert Officer";
			CFrameQuest = CFrame.new(894.488647, 5.14000702, 4392.43359, 0.819155693, -0, -0.573571265, 0, 1, -0, 0.573571265, 0, 0.819155693);
			CFrameMon = CFrame.new(1608.2822265625, 8.614224433898926, 4371.00732421875);
		elseif MyLevel == 90 or MyLevel <= 99 then
			Mon = "Snow Bandit";
			LevelQuest = 1;
			NameQuest = "SnowQuest";
			NameMon = "Snow Bandit";
			CFrameQuest = CFrame.new(1389.74451, 88.1519318, -1298.90796, -0.342042685, 0, 0.939684391, 0, 1, 0, -0.939684391, 0, -0.342042685);
			CFrameMon = CFrame.new(1354.347900390625, 87.27277374267578, -1393.946533203125);
		elseif MyLevel == 100 or MyLevel <= 119 then
			Mon = "Snowman";
			LevelQuest = 2;
			NameQuest = "SnowQuest";
			NameMon = "Snowman";
			CFrameQuest = CFrame.new(1389.74451, 88.1519318, -1298.90796, -0.342042685, 0, 0.939684391, 0, 1, 0, -0.939684391, 0, -0.342042685);
			CFrameMon = CFrame.new(1201.6412353515625, 144.57958984375, -1550.0670166015625);
		elseif MyLevel == 120 or MyLevel <= 149 then
			Mon = "Chief Petty Officer";
			LevelQuest = 1;
			NameQuest = "MarineQuest2";
			NameMon = "Chief Petty Officer";
			CFrameQuest = CFrame.new(-5039.58643, 27.3500385, 4324.68018, 0, 0, -1, 0, 1, 0, 1, 0, 0);
			CFrameMon = CFrame.new(-4881.23095703125, 22.65204429626465, 4273.75244140625);
		elseif MyLevel == 150 or MyLevel <= 174 then
			Mon = "Sky Bandit";
			LevelQuest = 1;
			NameQuest = "SkyQuest";
			NameMon = "Sky Bandit";
			CFrameQuest = CFrame.new(-4839.53027, 716.368591, -2619.44165, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268);
			CFrameMon = CFrame.new(-4953.20703125, 295.74420166015625, -2899.22900390625);
		elseif MyLevel == 175 or MyLevel <= 189 then
			Mon = "Dark Master";
			LevelQuest = 2;
			NameQuest = "SkyQuest";
			NameMon = "Dark Master";
			CFrameQuest = CFrame.new(-4839.53027, 716.368591, -2619.44165, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268);
			CFrameMon = CFrame.new(-5259.8447265625, 391.3976745605469, -2229.035400390625);
		elseif MyLevel == 190 or MyLevel <= 209 then
			Mon = "Prisoner";
			LevelQuest = 1;
			NameQuest = "PrisonerQuest";
			NameMon = "Prisoner";
			CFrameQuest = CFrame.new(5308.93115, 1.65517521, 475.120514, -0.0894274712, -0.00000000500292918, -0.995993316, 0.00000000160817859, 1, -0.00000000516744869, 0.995993316, -0.00000000206384709, -0.0894274712);
			CFrameMon = CFrame.new(5098.9736328125, -0.3204058110713959, 474.2373352050781);
		elseif MyLevel == 210 or MyLevel <= 249 then
			Mon = "Dangerous Prisoner";
			LevelQuest = 2;
			NameQuest = "PrisonerQuest";
			NameMon = "Dangerous Prisoner";
			CFrameQuest = CFrame.new(5308.93115, 1.65517521, 475.120514, -0.0894274712, -0.00000000500292918, -0.995993316, 0.00000000160817859, 1, -0.00000000516744869, 0.995993316, -0.00000000206384709, -0.0894274712);
			CFrameMon = CFrame.new(5654.5634765625, 15.633401870727539, 866.2991943359375);
		elseif MyLevel == 250 or MyLevel <= 274 then
			Mon = "Toga Warrior";
			LevelQuest = 1;
			NameQuest = "ColosseumQuest";
			NameMon = "Toga Warrior";
			CFrameQuest = CFrame.new(-1580.04663, 6.35000277, -2986.47534, -0.515037298, 0, -0.857167721, 0, 1, 0, 0.857167721, 0, -0.515037298);
			CFrameMon = CFrame.new(-1820.21484375, 51.68385696411133, -2740.6650390625);
		elseif MyLevel == 275 or MyLevel <= 299 then
			Mon = "Gladiator";
			LevelQuest = 2;
			NameQuest = "ColosseumQuest";
			NameMon = "Gladiator";
			CFrameQuest = CFrame.new(-1580.04663, 6.35000277, -2986.47534, -0.515037298, 0, -0.857167721, 0, 1, 0, 0.857167721, 0, -0.515037298);
			CFrameMon = CFrame.new(-1292.838134765625, 56.380882263183594, -3339.031494140625);
		elseif MyLevel == 300 or MyLevel <= 324 then
			Mon = "Military Soldier";
			LevelQuest = 1;
			NameQuest = "MagmaQuest";
			NameMon = "Military Soldier";
			CFrameQuest = CFrame.new(-5313.37012, 10.9500084, 8515.29395, -0.499959469, 0, 0.866048813, 0, 1, 0, -0.866048813, 0, -0.499959469);
			CFrameMon = CFrame.new(-5411.16455078125, 11.081554412841797, 8454.29296875);
		elseif MyLevel == 325 or MyLevel <= 374 then
			Mon = "Military Spy";
			LevelQuest = 2;
			NameQuest = "MagmaQuest";
			NameMon = "Military Spy";
			CFrameQuest = CFrame.new(-5313.37012, 10.9500084, 8515.29395, -0.499959469, 0, 0.866048813, 0, 1, 0, -0.866048813, 0, -0.499959469);
			CFrameMon = CFrame.new(-5802.8681640625, 86.26241302490234, 8828.859375);
		elseif MyLevel == 375 or MyLevel <= 399 then
			Mon = "Fishman Warrior";
			LevelQuest = 1;
			NameQuest = "FishmanQuest";
			NameMon = "Fishman Warrior";
			CFrameQuest = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734);
			CFrameMon = CFrame.new(60878.30078125, 18.482830047607422, 1543.7574462890625);
			if _G.AutoFarmLevel and (CFrameQuest.Position - HumanoidRootPart.Position).Magnitude > 10000 then
				Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(61163.8515625, 11.6796875, 1819.7841796875));
			end;
		elseif MyLevel == 400 or MyLevel <= 449 then
			Mon = "Fishman Commando";
			LevelQuest = 2;
			NameQuest = "FishmanQuest";
			NameMon = "Fishman Commando";
			CFrameQuest = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734);
			CFrameMon = CFrame.new(61922.6328125, 18.482830047607422, 1493.934326171875);
			if _G.AutoFarmLevel and (CFrameQuest.Position - HumanoidRootPart.Position).Magnitude > 10000 then
				Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(61163.8515625, 11.6796875, 1819.7841796875));
			end;
		elseif MyLevel == 450 or MyLevel <= 474 then
			Mon = "God's Guard";
			LevelQuest = 1;
			NameQuest = "SkyExp1Quest";
			NameMon = "God's Guard";
			CFrameQuest = CFrame.new(-4721.88867, 843.874695, -1949.96643, 0.996191859, -0, -0.0871884301, 0, 1, -0, 0.0871884301, 0, 0.996191859);
			CFrameMon = CFrame.new(-4710.04296875, 845.2769775390625, -1927.3079833984375);
			if _G.AutoFarmLevel and (CFrameQuest.Position - HumanoidRootPart.Position).Magnitude > 10000 then
				Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-4607.82275, 872.54248, -1667.55688));
			end;
		elseif MyLevel == 475 or MyLevel <= 524 then
			Mon = "Shanda";
			LevelQuest = 2;
			NameQuest = "SkyExp1Quest";
			NameMon = "Shanda";
			CFrameQuest = CFrame.new(-7859.09814, 5544.19043, -381.476196, -0.422592998, 0, 0.906319618, 0, 1, 0, -0.906319618, 0, -0.422592998);
			CFrameMon = CFrame.new(-7678.48974609375, 5566.40380859375, -497.2156066894531);
			if _G.AutoFarmLevel and (CFrameQuest.Position - HumanoidRootPart.Position).Magnitude > 10000 then
				Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047));
			end;
		elseif MyLevel == 525 or MyLevel <= 549 then
			Mon = "Royal Squad";
			LevelQuest = 1;
			NameQuest = "SkyExp2Quest";
			NameMon = "Royal Squad";
			CFrameQuest = CFrame.new(-7906.81592, 5634.6626, -1411.99194, 0, 0, -1, 0, 1, 0, 1, 0, 0);
			CFrameMon = CFrame.new(-7624.25244140625, 5658.13330078125, -1467.354248046875);
		elseif MyLevel == 550 or MyLevel <= 624 then
			Mon = "Royal Soldier";
			LevelQuest = 2;
			NameQuest = "SkyExp2Quest";
			NameMon = "Royal Soldier";
			CFrameQuest = CFrame.new(-7906.81592, 5634.6626, -1411.99194, 0, 0, -1, 0, 1, 0, 1, 0, 0);
			CFrameMon = CFrame.new(-7836.75341796875, 5645.6640625, -1790.6236572265625);
		elseif MyLevel == 625 or MyLevel <= 649 then
			Mon = "Galley Pirate";
			LevelQuest = 1;
			NameQuest = "FountainQuest";
			NameMon = "Galley Pirate";
			CFrameQuest = CFrame.new(5259.81982, 37.3500175, 4050.0293, 0.087131381, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, 0.087131381);
			CFrameMon = CFrame.new(5551.02197265625, 78.90135192871094, 3930.412841796875);
		elseif MyLevel >= 650 then
			Mon = "Galley Captain";
			LevelQuest = 2;
			NameQuest = "FountainQuest";
			NameMon = "Galley Captain";
			CFrameQuest = CFrame.new(5259.81982, 37.3500175, 4050.0293, 0.087131381, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, 0.087131381);
			CFrameMon = CFrame.new(5441.95166015625, 42.50205993652344, 4950.09375);
		end;
	elseif World2 then
		if MyLevel == 700 or MyLevel <= 724 then
			Mon = "Raider";
			LevelQuest = 1;
			NameQuest = "Area1Quest";
			NameMon = "Raider";
			CFrameQuest = CFrame.new(-429.543518, 71.7699966, 1836.18188, -0.22495985, 0, -0.974368095, 0, 1, 0, 0.974368095, 0, -0.22495985);
			CFrameMon = CFrame.new(-728.3267211914062, 52.779319763183594, 2345.7705078125);
		elseif MyLevel == 725 or MyLevel <= 774 then
			Mon = "Mercenary";
			LevelQuest = 2;
			NameQuest = "Area1Quest";
			NameMon = "Mercenary";
			CFrameQuest = CFrame.new(-429.543518, 71.7699966, 1836.18188, -0.22495985, 0, -0.974368095, 0, 1, 0, 0.974368095, 0, -0.22495985);
			CFrameMon = CFrame.new(-1004.3244018554688, 80.15886688232422, 1424.619384765625);
		elseif MyLevel == 775 or MyLevel <= 799 then
			Mon = "Swan Pirate";
			LevelQuest = 1;
			NameQuest = "Area2Quest";
			NameMon = "Swan Pirate";
			CFrameQuest = CFrame.new(638.43811, 71.769989, 918.282898, 0.139203906, 0, 0.99026376, 0, 1, 0, -0.99026376, 0, 0.139203906);
			CFrameMon = CFrame.new(1068.664306640625, 137.61428833007812, 1322.1060791015625);
		elseif MyLevel == 800 or MyLevel <= 874 then
			Mon = "Factory Staff";
			NameQuest = "Area2Quest";
			LevelQuest = 2;
			NameMon = "Factory Staff";
			CFrameQuest = CFrame.new(632.698608, 73.1055908, 918.666321, -0.0319722369, 0.000000000896074881, -0.999488771, 0.000000000136326533, 1, 0.000000000892172336, 0.999488771, -0.000000000107732087, -0.0319722369);
			CFrameMon = CFrame.new(73.07867431640625, 81.86344146728516, -27.470672607421875);
		elseif MyLevel == 875 or MyLevel <= 899 then
			Mon = "Marine Lieutenant";
			LevelQuest = 1;
			NameQuest = "MarineQuest3";
			NameMon = "Marine Lieutenant";
			CFrameQuest = CFrame.new(-2440.79639, 71.7140732, -3216.06812, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268);
			CFrameMon = CFrame.new(-2821.372314453125, 75.89727783203125, -3070.089111328125);
		elseif MyLevel == 900 or MyLevel <= 949 then
			Mon = "Marine Captain";
			LevelQuest = 2;
			NameQuest = "MarineQuest3";
			NameMon = "Marine Captain";
			CFrameQuest = CFrame.new(-2440.79639, 71.7140732, -3216.06812, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268);
			CFrameMon = CFrame.new(-1861.2310791015625, 80.17658233642578, -3254.697509765625);
		elseif MyLevel == 950 or MyLevel <= 974 then
			Mon = "Zombie";
			LevelQuest = 1;
			NameQuest = "ZombieQuest";
			NameMon = "Zombie";
			CFrameQuest = CFrame.new(-5497.06152, 47.5923004, -795.237061, -0.29242146, 0, -0.95628953, 0, 1, 0, 0.95628953, 0, -0.29242146);
			CFrameMon = CFrame.new(-5657.77685546875, 78.96973419189453, -928.68701171875);
		elseif MyLevel == 975 or MyLevel <= 999 then
			Mon = "Vampire";
			LevelQuest = 2;
			NameQuest = "ZombieQuest";
			NameMon = "Vampire";
			CFrameQuest = CFrame.new(-5497.06152, 47.5923004, -795.237061, -0.29242146, 0, -0.95628953, 0, 1, 0, 0.95628953, 0, -0.29242146);
			CFrameMon = CFrame.new(-6037.66796875, 32.18463897705078, -1340.6597900390625);
		elseif MyLevel == 1000 or MyLevel <= 1049 then
			Mon = "Snow Trooper";
			LevelQuest = 1;
			NameQuest = "SnowMountainQuest";
			NameMon = "Snow Trooper";
			CFrameQuest = CFrame.new(609.858826, 400.119904, -5372.25928, -0.374604106, 0, 0.92718488, 0, 1, 0, -0.92718488, 0, -0.374604106);
			CFrameMon = CFrame.new(549.1473388671875, 427.3870544433594, -5563.69873046875);
		elseif MyLevel == 1050 or MyLevel <= 1099 then
			Mon = "Winter Warrior";
			LevelQuest = 2;
			NameQuest = "SnowMountainQuest";
			NameMon = "Winter Warrior";
			CFrameQuest = CFrame.new(609.858826, 400.119904, -5372.25928, -0.374604106, 0, 0.92718488, 0, 1, 0, -0.92718488, 0, -0.374604106);
			CFrameMon = CFrame.new(1142.7451171875, 475.6398010253906, -5199.41650390625);
		elseif MyLevel == 1100 or MyLevel <= 1124 then
			Mon = "Lab Subordinate";
			LevelQuest = 1;
			NameQuest = "IceSideQuest";
			NameMon = "Lab Subordinate";
			CFrameQuest = CFrame.new(-6064.06885, 15.2422857, -4902.97852, 0.453972578, -0, -0.891015649, 0, 1, -0, 0.891015649, 0, 0.453972578);
			CFrameMon = CFrame.new(-5707.4716796875, 15.951709747314453, -4513.39208984375);
		elseif MyLevel == 1125 or MyLevel <= 1174 then
			Mon = "Horned Warrior";
			LevelQuest = 2;
			NameQuest = "IceSideQuest";
			NameMon = "Horned Warrior";
			CFrameQuest = CFrame.new(-6064.06885, 15.2422857, -4902.97852, 0.453972578, -0, -0.891015649, 0, 1, -0, 0.891015649, 0, 0.453972578);
			CFrameMon = CFrame.new(-6341.36669921875, 15.951770782470703, -5723.162109375);
		elseif MyLevel == 1175 or MyLevel <= 1199 then
			Mon = "Magma Ninja";
			LevelQuest = 1;
			NameQuest = "FireSideQuest";
			NameMon = "Magma Ninja";
			CFrameQuest = CFrame.new(-5428.03174, 15.0622921, -5299.43457, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213);
			CFrameMon = CFrame.new(-5449.6728515625, 76.65874481201172, -5808.20068359375);
		elseif MyLevel == 1200 or MyLevel <= 1249 then
			Mon = "Lava Pirate";
			LevelQuest = 2;
			NameQuest = "FireSideQuest";
			NameMon = "Lava Pirate";
			CFrameQuest = CFrame.new(-5428.03174, 15.0622921, -5299.43457, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213);
			CFrameMon = CFrame.new(-5213.33154296875, 49.73788070678711, -4701.451171875);
		elseif MyLevel == 1250 or MyLevel <= 1274 then
			Mon = "Ship Deckhand";
			LevelQuest = 1;
			NameQuest = "ShipQuest1";
			NameMon = "Ship Deckhand";
			CFrameQuest = CFrame.new(1037.80127, 125.092171, 32911.6016);
			CFrameMon = CFrame.new(1212.0111083984375, 150.79205322265625, 33059.24609375);
			if _G.AutoFarmLevel and (CFrameQuest.Position - HumanoidRootPart.Position).Magnitude > 10000 then
				Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125));
			end;
		elseif MyLevel == 1275 or MyLevel <= 1299 then
			Mon = "Ship Engineer";
			LevelQuest = 2;
			NameQuest = "ShipQuest1";
			NameMon = "Ship Engineer";
			CFrameQuest = CFrame.new(1037.80127, 125.092171, 32911.6016);
			CFrameMon = CFrame.new(919.4786376953125, 43.54401397705078, 32779.96875);
			if _G.AutoFarmLevel and (CFrameQuest.Position - HumanoidRootPart.Position).Magnitude > 10000 then
				Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125));
			end;
		elseif MyLevel == 1300 or MyLevel <= 1324 then
			Mon = "Ship Steward";
			LevelQuest = 1;
			NameQuest = "ShipQuest2";
			NameMon = "Ship Steward";
			CFrameQuest = CFrame.new(968.80957, 125.092171, 33244.125);
			CFrameMon = CFrame.new(919.4385375976562, 129.55599975585938, 33436.03515625);
			if _G.AutoFarmLevel and (CFrameQuest.Position - HumanoidRootPart.Position).Magnitude > 10000 then
				Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125));
			end;
		elseif MyLevel == 1325 or MyLevel <= 1349 then
			Mon = "Ship Officer";
			LevelQuest = 2;
			NameQuest = "ShipQuest2";
			NameMon = "Ship Officer";
			CFrameQuest = CFrame.new(968.80957, 125.092171, 33244.125);
			CFrameMon = CFrame.new(1036.0179443359375, 181.4390411376953, 33315.7265625);
			if _G.AutoFarmLevel and (CFrameQuest.Position - HumanoidRootPart.Position).Magnitude > 10000 then
				Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125));
			end;
		elseif MyLevel == 1350 or MyLevel <= 1374 then
			Mon = "Arctic Warrior";
			LevelQuest = 1;
			NameQuest = "FrostQuest";
			NameMon = "Arctic Warrior";
			CFrameQuest = CFrame.new(5667.6582, 26.7997818, -6486.08984, -0.933587909, 0, -0.358349502, 0, 1, 0, 0.358349502, 0, -0.933587909);
			CFrameMon = CFrame.new(5966.24609375, 62.97002029418945, -6179.3828125);
			if _G.AutoFarmLevel and (CFrameQuest.Position - HumanoidRootPart.Position).Magnitude > 10000 then
				Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-6508.5581054688, 5000.034996032715, -132.83953857422));
			end;
		elseif MyLevel == 1375 or MyLevel <= 1424 then
			Mon = "Snow Lurker";
			LevelQuest = 2;
			NameQuest = "FrostQuest";
			NameMon = "Snow Lurker";
			CFrameQuest = CFrame.new(5667.6582, 26.7997818, -6486.08984, -0.933587909, 0, -0.358349502, 0, 1, 0, 0.358349502, 0, -0.933587909);
			CFrameMon = CFrame.new(5407.07373046875, 69.19437408447266, -6880.88037109375);
		elseif MyLevel == 1425 or MyLevel <= 1449 then
			Mon = "Sea Soldier";
			LevelQuest = 1;
			NameQuest = "ForgottenQuest";
			NameMon = "Sea Soldier";
			CFrameQuest = CFrame.new(-3054.44458, 235.544281, -10142.8193, 0.990270376, -0, -0.13915664, 0, 1, -0, 0.13915664, 0, 0.990270376);
			CFrameMon = CFrame.new(-3028.2236328125, 64.67451477050781, -9775.4267578125);
		elseif MyLevel >= 1450 then
			Mon = "Water Fighter";
			LevelQuest = 2;
			NameQuest = "ForgottenQuest";
			NameMon = "Water Fighter";
			CFrameQuest = CFrame.new(-3054.44458, 235.544281, -10142.8193, 0.990270376, -0, -0.13915664, 0, 1, -0, 0.13915664, 0, 0.990270376);
			CFrameMon = CFrame.new(-3352.9013671875, 285.01556396484375, -10534.841796875);
		end;
	elseif World3 then
		if MyLevel == 1500 or MyLevel <= 1524 then
			Mon = "Pirate Millionaire";
			LevelQuest = 1;
			NameQuest = "PiratePortQuest";
			NameMon = "Pirate Millionaire";
			CFrameQuest = CFrame.new(-290.074677, 42.9034653, 5581.58984, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627);
			CFrameMon = CFrame.new(-245.9963836669922, 47.30615234375, 5584.1005859375);
		elseif MyLevel == 1525 or MyLevel <= 1574 then
			Mon = "Pistol Billionaire";
			LevelQuest = 2;
			NameQuest = "PiratePortQuest";
			NameMon = "Pistol Billionaire";
			CFrameQuest = CFrame.new(-290.074677, 42.9034653, 5581.58984, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627);
			CFrameMon = CFrame.new(-187.3301544189453, 86.23987579345703, 6013.513671875);
		elseif MyLevel == 1575 or MyLevel <= 1599 then
			Mon = "Dragon Crew Warrior";
			LevelQuest = 1;
			NameQuest = "AmazonQuest";
			NameMon = "Dragon Crew Warrior";
			CFrameQuest = CFrame.new(5832.83594, 51.6806107, -1101.51563, 0.898790359, -0, -0.438378751, 0, 1, -0, 0.438378751, 0, 0.898790359);
			CFrameMon = CFrame.new(6141.140625, 51.35136413574219, -1340.738525390625);
		elseif MyLevel == 1600 or MyLevel <= 1624 then
			Mon = "Dragon Crew Archer [Lv. 1600]";
			NameQuest = "AmazonQuest";
			LevelQuest = 2;
			NameMon = "Dragon Crew Archer";
			CFrameQuest = CFrame.new(5833.1147460938, 51.60498046875, -1103.0693359375);
			CFrameMon = CFrame.new(6616.41748046875, 441.7670593261719, 446.0469970703125);
		elseif MyLevel == 1625 or MyLevel <= 1649 then
			Mon = "Female Islander";
			NameQuest = "AmazonQuest2";
			LevelQuest = 1;
			NameMon = "Female Islander";
			CFrameQuest = CFrame.new(5446.8793945313, 601.62945556641, 749.45672607422);
			CFrameMon = CFrame.new(4685.25830078125, 735.8078002929688, 815.3425903320312);
		elseif MyLevel == 1650 or MyLevel <= 1699 then
			Mon = "Giant Islander [Lv. 1650]";
			NameQuest = "AmazonQuest2";
			LevelQuest = 2;
			NameMon = "Giant Islander";
			CFrameQuest = CFrame.new(5446.8793945313, 601.62945556641, 749.45672607422);
			CFrameMon = CFrame.new(4729.09423828125, 590.436767578125, -36.97627639770508);
		elseif MyLevel == 1700 or MyLevel <= 1724 then
			Mon = "Marine Commodore";
			LevelQuest = 1;
			NameQuest = "MarineTreeIsland";
			NameMon = "Marine Commodore";
			CFrameQuest = CFrame.new(2180.54126, 27.8156815, -6741.5498, -0.965929747, 0, 0.258804798, 0, 1, 0, -0.258804798, 0, -0.965929747);
			CFrameMon = CFrame.new(2286.0078125, 73.13391876220703, -7159.80908203125);
		elseif MyLevel == 1725 or MyLevel <= 1774 then
			Mon = "Marine Rear Admiral [Lv. 1725]";
			NameMon = "Marine Rear Admiral";
			NameQuest = "MarineTreeIsland";
			LevelQuest = 2;
			CFrameQuest = CFrame.new(2179.98828125, 28.731239318848, -6740.0551757813);
			CFrameMon = CFrame.new(3656.773681640625, 160.52406311035156, -7001.5986328125);
		elseif MyLevel == 1775 or MyLevel <= 1799 then
			Mon = "Fishman Raider";
			LevelQuest = 1;
			NameQuest = "DeepForestIsland3";
			NameMon = "Fishman Raider";
			CFrameQuest = CFrame.new(-10581.6563, 330.872955, -8761.18652, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213);
			CFrameMon = CFrame.new(-10407.5263671875, 331.76263427734375, -8368.5166015625);
		elseif MyLevel == 1800 or MyLevel <= 1824 then
			Mon = "Fishman Captain";
			LevelQuest = 2;
			NameQuest = "DeepForestIsland3";
			NameMon = "Fishman Captain";
			CFrameQuest = CFrame.new(-10581.6563, 330.872955, -8761.18652, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213);
			CFrameMon = CFrame.new(-10994.701171875, 352.38140869140625, -9002.1103515625);
		elseif MyLevel == 1825 or MyLevel <= 1849 then
			Mon = "Forest Pirate";
			LevelQuest = 1;
			NameQuest = "DeepForestIsland";
			NameMon = "Forest Pirate";
			CFrameQuest = CFrame.new(-13234.04, 331.488495, -7625.40137, 0.707134247, -0, -0.707079291, 0, 1, -0, 0.707079291, 0, 0.707134247);
			CFrameMon = CFrame.new(-13274.478515625, 332.3781433105469, -7769.58056640625);
		elseif MyLevel == 1850 or MyLevel <= 1899 then
			Mon = "Mythological Pirate";
			LevelQuest = 2;
			NameQuest = "DeepForestIsland";
			NameMon = "Mythological Pirate";
			CFrameQuest = CFrame.new(-13234.04, 331.488495, -7625.40137, 0.707134247, -0, -0.707079291, 0, 1, -0, 0.707079291, 0, 0.707134247);
			CFrameMon = CFrame.new(-13680.607421875, 501.08154296875, -6991.189453125);
		elseif MyLevel == 1900 or MyLevel <= 1924 then
			Mon = "Jungle Pirate";
			LevelQuest = 1;
			NameQuest = "DeepForestIsland2";
			NameMon = "Jungle Pirate";
			CFrameQuest = CFrame.new(-12680.3818, 389.971039, -9902.01953, -0.0871315002, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, -0.0871315002);
			CFrameMon = CFrame.new(-12256.16015625, 331.73828125, -10485.8369140625);
		elseif MyLevel == 1925 or MyLevel <= 1974 then
			Mon = "Musketeer Pirate";
			LevelQuest = 2;
			NameQuest = "DeepForestIsland2";
			NameMon = "Musketeer Pirate";
			CFrameQuest = CFrame.new(-12680.3818, 389.971039, -9902.01953, -0.0871315002, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, -0.0871315002);
			CFrameMon = CFrame.new(-13457.904296875, 391.545654296875, -9859.177734375);
		elseif MyLevel == 1975 or MyLevel <= 1999 then
			Mon = "Reborn Skeleton";
			LevelQuest = 1;
			NameQuest = "HauntedQuest1";
			NameMon = "Reborn Skeleton";
			CFrameQuest = CFrame.new(-9479.2168, 141.215088, 5566.09277, 0, 0, 1, 0, 1, -0, -1, 0, 0);
			CFrameMon = CFrame.new(-8763.7236328125, 165.72299194335938, 6159.86181640625);
		elseif MyLevel == 2000 or MyLevel <= 2024 then
			Mon = "Living Zombie";
			LevelQuest = 2;
			NameQuest = "HauntedQuest1";
			NameMon = "Living Zombie";
			CFrameQuest = CFrame.new(-9479.2168, 141.215088, 5566.09277, 0, 0, 1, 0, 1, -0, -1, 0, 0);
			CFrameMon = CFrame.new(-10144.1318359375, 138.62667846679688, 5838.0888671875);
		elseif MyLevel == 2025 or MyLevel <= 2049 then
			Mon = "Demonic Soul";
			LevelQuest = 1;
			NameQuest = "HauntedQuest2";
			NameMon = "Demonic Soul";
			CFrameQuest = CFrame.new(-9516.99316, 172.017181, 6078.46533, 0, 0, -1, 0, 1, 0, 1, 0, 0);
			CFrameMon = CFrame.new(-9505.8720703125, 172.10482788085938, 6158.9931640625);
		elseif MyLevel == 2050 or MyLevel <= 2074 then
			Mon = "Posessed Mummy";
			LevelQuest = 2;
			NameQuest = "HauntedQuest2";
			NameMon = "Posessed Mummy";
			CFrameQuest = CFrame.new(-9516.99316, 172.017181, 6078.46533, 0, 0, -1, 0, 1, 0, 1, 0, 0);
			CFrameMon = CFrame.new(-9582.0224609375, 6.251527309417725, 6205.478515625);
		elseif MyLevel == 2075 or MyLevel <= 2099 then
			Mon = "Peanut Scout";
			LevelQuest = 1;
			NameQuest = "NutsIslandQuest";
			NameMon = "Peanut Scout";
			CFrameQuest = CFrame.new(-2104.3908691406, 38.104167938232, -10194.21875, 0, 0, -1, 0, 1, 0, 1, 0, 0);
			CFrameMon = CFrame.new(-2143.241943359375, 47.72198486328125, -10029.9951171875);
		elseif MyLevel == 2100 or MyLevel <= 2124 then
			Mon = "Peanut President";
			LevelQuest = 2;
			NameQuest = "NutsIslandQuest";
			NameMon = "Peanut President";
			CFrameQuest = CFrame.new(-2104.3908691406, 38.104167938232, -10194.21875, 0, 0, -1, 0, 1, 0, 1, 0, 0);
			CFrameMon = CFrame.new(-1859.35400390625, 38.10316848754883, -10422.4296875);
		elseif MyLevel == 2125 or MyLevel <= 2149 then
			Mon = "Ice Cream Chef";
			LevelQuest = 1;
			NameQuest = "IceCreamIslandQuest";
			NameMon = "Ice Cream Chef";
			CFrameQuest = CFrame.new(-820.64825439453, 65.819526672363, -10965.795898438, 0, 0, -1, 0, 1, 0, 1, 0, 0);
			CFrameMon = CFrame.new(-872.24658203125, 65.81957244873047, -10919.95703125);
		elseif MyLevel == 2150 or MyLevel <= 2199 then
			Mon = "Ice Cream Commander";
			LevelQuest = 2;
			NameQuest = "IceCreamIslandQuest";
			NameMon = "Ice Cream Commander";
			CFrameQuest = CFrame.new(-820.64825439453, 65.819526672363, -10965.795898438, 0, 0, -1, 0, 1, 0, 1, 0, 0);
			CFrameMon = CFrame.new(-558.06103515625, 112.04895782470703, -11290.7744140625);
		elseif MyLevel == 2200 or MyLevel <= 2224 then
			Mon = "Cookie Crafter";
			LevelQuest = 1;
			NameQuest = "CakeQuest1";
			NameMon = "Cookie Crafter";
			CFrameQuest = CFrame.new(-2021.32007, 37.7982254, -12028.7295, 0.957576931, -0.0000000880302053, 0.288177818, 0.000000069301187, 1, 0.0000000751931211, -0.288177818, -0.000000052032135, 0.957576931);
			CFrameMon = CFrame.new(-2374.13671875, 37.79826354980469, -12125.30859375);
		elseif MyLevel == 2225 or MyLevel <= 2249 then
			Mon = "Cake Guard";
			LevelQuest = 2;
			NameQuest = "CakeQuest1";
			NameMon = "Cake Guard";
			CFrameQuest = CFrame.new(-2021.32007, 37.7982254, -12028.7295, 0.957576931, -0.0000000880302053, 0.288177818, 0.000000069301187, 1, 0.0000000751931211, -0.288177818, -0.000000052032135, 0.957576931);
			CFrameMon = CFrame.new(-1598.3070068359375, 43.773197174072266, -12244.5810546875);
		elseif MyLevel == 2250 or MyLevel <= 2274 then
			Mon = "Baking Staff";
			LevelQuest = 1;
			NameQuest = "CakeQuest2";
			NameMon = "Baking Staff";
			CFrameQuest = CFrame.new(-1927.91602, 37.7981339, -12842.5391, -0.96804446, 0.0000000422142143, 0.250778586, 0.0000000474911062, 1, 0.0000000149904711, -0.250778586, 0.0000000264211941, -0.96804446);
			CFrameMon = CFrame.new(-1887.8099365234375, 77.6185073852539, -12998.3505859375);
		elseif MyLevel == 2275 or MyLevel <= 2299 then
			Mon = "Head Baker";
			LevelQuest = 2;
			NameQuest = "CakeQuest2";
			NameMon = "Head Baker";
			CFrameQuest = CFrame.new(-1927.91602, 37.7981339, -12842.5391, -0.96804446, 0.0000000422142143, 0.250778586, 0.0000000474911062, 1, 0.0000000149904711, -0.250778586, 0.0000000264211941, -0.96804446);
			CFrameMon = CFrame.new(-2216.188232421875, 82.884521484375, -12869.2939453125);
		elseif MyLevel == 2300 or MyLevel <= 2324 then
			Mon = "Cocoa Warrior";
			LevelQuest = 1;
			NameQuest = "ChocQuest1";
			NameMon = "Cocoa Warrior";
			CFrameQuest = CFrame.new(233.22836303710938, 29.876001358032227, -12201.2333984375);
			CFrameMon = CFrame.new(-21.55328369140625, 80.57499694824219, -12352.3876953125);
		elseif MyLevel == 2325 or MyLevel <= 2349 then
			Mon = "Chocolate Bar Battler";
			LevelQuest = 2;
			NameQuest = "ChocQuest1";
			NameMon = "Chocolate Bar Battler";
			CFrameQuest = CFrame.new(233.22836303710938, 29.876001358032227, -12201.2333984375);
			CFrameMon = CFrame.new(582.590576171875, 77.18809509277344, -12463.162109375);
		elseif MyLevel == 2350 or MyLevel <= 2374 then
			Mon = "Sweet Thief";
			LevelQuest = 1;
			NameQuest = "ChocQuest2";
			NameMon = "Sweet Thief";
			CFrameQuest = CFrame.new(150.5066375732422, 30.693693161010742, -12774.5029296875);
			CFrameMon = CFrame.new(165.1884765625, 76.05885314941406, -12600.8369140625);
		elseif MyLevel == 2375 or MyLevel <= 2399 then
			Mon = "Candy Rebel";
			LevelQuest = 2;
			NameQuest = "ChocQuest2";
			NameMon = "Candy Rebel";
			CFrameQuest = CFrame.new(150.5066375732422, 30.693693161010742, -12774.5029296875);
			CFrameMon = CFrame.new(134.86563110351562, 77.2476806640625, -12876.5478515625);
		elseif MyLevel == 2400 or MyLevel <= 2424 then
			Mon = "Candy Pirate";
			LevelQuest = 1;
			NameQuest = "CandyQuest1";
			NameMon = "Candy Pirate";
			CFrameQuest = CFrame.new(-1150.0400390625, 20.378934860229492, -14446.3349609375);
			CFrameMon = CFrame.new(-1310.5003662109375, 26.016523361206055, -14562.404296875);
		elseif MyLevel == 2425 or MyLevel <= 2449 then
			Mon = "Snow Demon";
			LevelQuest = 2;
			NameQuest = "CandyQuest1";
			NameMon = "Snow Demon";
			CFrameQuest = CFrame.new(-1150.0400390625, 20.378934860229492, -14446.3349609375);
			CFrameMon = CFrame.new(-880.2006225585938, 71.24776458740234, -14538.609375);
		elseif MyLevel == 2450 or MyLevel <= 2474 then
			Mon = "Isle Outlaw";
			LevelQuest = 1;
			NameQuest = "TikiQuest1";
			NameMon = "Isle Outlaw";
			CFrameQuest = CFrame.new(-16547.748046875, 61.13533401489258, -173.41360473632812);
			CFrameMon = CFrame.new(-16442.814453125, 116.13899993896484, -264.4637756347656);
		elseif MyLevel == 2475 or MyLevel <= 2524 then
			Mon = "Island Boy";
			LevelQuest = 2;
			NameQuest = "TikiQuest1";
			NameMon = "Island Boy";
			CFrameQuest = CFrame.new(-16547.748046875, 61.13533401489258, -173.41360473632812);
			CFrameMon = CFrame.new(-16901.26171875, 84.06756591796875, -192.88906860351562);
		elseif MyLevel == 2525 or MyLevel <= 2549 then
			Mon = "Isle Champion";
			LevelQuest = 2;
			NameQuest = "TikiQuest2";
			NameMon = "Isle Champion";
			CFrameQuest = CFrame.new(-16539.078125, 55.68632888793945, 1051.5738525390625);
			CFrameMon = CFrame.new(-16641.6796875, 235.7825469970703, 1031.282958984375);
		elseif MyLevel == 2550 or MyLevel <= 2574 then
			Mon = "Serpent Hunter";
			LevelQuest = 1;
			NameQuest = "TikiQuest3";
			NameMon = "Serpent Hunter";
			CFrameQuest = CFrame.new(-16661.890625, 105.2862319946289, 1576.69775390625);
			CFrameMon = CFrame.new(-16587.896484375, 154.21299743652344, 1533.40966796875);
		elseif MyLevel == 2575 or MyLevel <= 2599 then
			Mon = "Skull Slayer";
			LevelQuest = 2;
			NameQuest = "TikiQuest3";
			NameMon = "Skull Slayer";
			CFrameQuest = CFrame.new(-16661.890625, 105.2862319946289, 1576.69775390625);
			CFrameMon = CFrame.new(-16885.203125, 114.12911224365234, 1627.949951171875);
		elseif MyLevel == 2600 or MyLevel <= 2624 then
			Mon = "Reef Bandit";
			LevelQuest = 1;
			NameQuest = "SubmergedQuest1";
			NameMon = "Reef Bandit";
			CFrameQuest = CFrame.new(10782.134765625, -2087.722412109375, 9268.5205078125);
			CFrameMon = CFrame.new(10918.134765625, -2115.56103515625, 9055.9892578125);
		elseif MyLevel == 2625 or MyLevel <= 2649 then
			Mon = "Coral Pirate";
			LevelQuest = 2;
			NameQuest = "SubmergedQuest1";
			NameMon = "Coral Pirate";
			CFrameQuest = CFrame.new(10782.134765625, -2087.722412109375, 9268.5205078125);
			CFrameMon = CFrame.new(10656.0869140625, -2018.734375, 9258.4365234375);
		elseif MyLevel == 2650 or MyLevel <= 2674 then
			Mon = "Sea Chanter";
			LevelQuest = 1;
			NameQuest = "SubmergedQuest2";
			NameMon = "Sea Chanter";
			CFrameQuest = CFrame.new(10879.5546875, -2086.19921875, 10027.486328125);
			CFrameMon = CFrame.new(10691.50390625, -2023.15234375, 10026.27734375);
		elseif MyLevel == 2675 or MyLevel <= 2699 then
			Mon = "Ocean Prophet";
			LevelQuest = 2;
			NameQuest = "SubmergedQuest2";
			NameMon = "Ocean Prophet";
			CFrameQuest = CFrame.new(10879.5546875, -2086.19921875, 10027.486328125);
			CFrameMon = CFrame.new(10900.3876953125, -1973.1259765625, 10233.232421875);
		elseif MyLevel == 2700 or MyLevel >= 2700 then
			Mon = "Grand Devotee";
			LevelQuest = 2;
			NameQuest = "SubmergedQuest3";
			NameMon = "Grand Devotee";
			CFrameQuest = CFrame.new(9634.6875, -1992.443603515625, 9608.3154296875);
			CFrameMon = CFrame.new(9653.1376953125, -1928.2684326171875, 9915.9423828125);
		end;
	end;
end;
task.spawn(function()
	ReplicatedStorage.Util.Sound.Storage.Other.DeathSound:Destroy();
	ReplicatedStorage.Effect.Container.Death:Destroy();
	ReplicatedStorage.Util.Sound.Storage.Other.SpawnSound:Destroy();
	ReplicatedStorage.Effect.Container.Spawn:Destroy();
end);
function Hop()
	local module = (loadstring(game:HttpGet("https://raw.githubusercontent.com/raw-scriptpastebin/FE/main/Server_Hop_Settings")))();
	module:Teleport(game.PlaceId);
end;
function isnil(thing)
	return thing == nil;
end;
function round(n)
	return math.floor(tonumber(n) + 0.5);
end;
spawn(function()
	while wait() do
		task.wait(1)
		if not _G.EspIsland then return end
		for i, v in pairs(Workspace._WorldOrigin.Locations:GetChildren()) do
			pcall(function()
				if _G.EspIsland then
					if v.Name ~= "Sea" then
						if not v:FindFirstChild("EspIsland") then
							local bill = Instance.new("BillboardGui", v);
							bill.Name = "EspIsland";
							bill.ExtentsOffset = Vector3.new(0, 1, 0);
							bill.Size = UDim2.new(0, 200, 0, 30);
							bill.Adornee = v;
							bill.AlwaysOnTop = true;
							local name = Instance.new("TextLabel", bill);
							name.Font = Enum.Font.GothamMedium;
							name.TextSize = 14;
							name.TextWrapped = true;
							name.Size = UDim2.new(1, 0, 1, 0);
							name.TextYAlignment = Enum.TextYAlignment.Top;
							name.BackgroundTransparency = 1;
							name.TextColor3 = Color3.fromRGB(255, 255, 255);
						else
							v.EspIsland.TextLabel.Text = v.Name .. "   \n" .. round(((Character.Head.Position - v.Position)).Magnitude / 3) .. " Distance";
						end;
					end;
				elseif v:FindFirstChild("EspIsland") then
					(v:FindFirstChild("EspIsland")):Destroy();
				end;
			end);
		end;
	end;
end);
spawn(function()
	while wait() do
		task.wait(1)
		if not _G.EspPlayer then return end
		for i, v in pairs((game:GetService("Players")):GetChildren()) do
			pcall(function()
				if not v.Character == nil then
					if _G.EspPlayer then
						if not v.Character.Head:FindFirstChild(("EspPlayer")) then
							local bill = Instance.new("BillboardGui", v.Character.Head);
							bill.Name = "EspPlayer";
							bill.ExtentsOffset = Vector3.new(0, 1, 0);
							bill.Size = UDim2.new(1, 200, 1, 30);
							bill.Adornee = v.Character.Head;
							bill.AlwaysOnTop = true;
							local name = Instance.new("TextLabel", bill);
							name.Font = Enum.Font.GothamSemibold;
							name.FontSize = "Size14";
							name.TextWrapped = true;
							name.Text = v.Name .. " \n" .. round(((Character.Head.Position - v.Character.Head.Position)).Magnitude / 3) .. " Distance";
							name.Size = UDim2.new(1, 0, 1, 0);
							name.TextYAlignment = "Top";
							name.BackgroundTransparency = 1;
							name.TextStrokeTransparency = 0.5;
							if v.Team == LocalPlayer.Team then
								name.TextColor3 = Color3.fromRGB(50, 200, 50);
							else
								name.TextColor3 = Color3.fromRGB(200, 50, 50);
							end;
						else
							v.Character.Head["EspPlayer"].TextLabel.Text = v.Name .. " | " .. round(((Character.Head.Position - v.Character.Head.Position)).Magnitude / 3) .. " Distance\nHealth : " .. round(v.Character.Humanoid.Health * 100 / v.Character.Humanoid.MaxHealth) .. "%";
						end;
					elseif v.Character.Head:FindFirstChild("EspPlayer") then
						(v.Character.Head:FindFirstChild("EspPlayer")):Destroy();
					end;
				end;
			end);
		end;
	end;
end);
spawn(function()
	while wait() do
		task.wait(1)
		if not _G.EspChest then return end
		for i, v in pairs(Workspace.ChestModels:GetChildren()) do
			pcall(function()
				if string.find(v.Name, "Chest") then
					if _G.EspChest then
						if string.find(v.Name, "Chest") then
							if not v:FindFirstChild(("EspChest")) then
								local bill = Instance.new("BillboardGui", v);
								bill.Name = "EspChest";
								bill.ExtentsOffset = Vector3.new(0, 1, 0);
								bill.Size = UDim2.new(1, 200, 1, 30);
								bill.Adornee = v;
								bill.AlwaysOnTop = true;
								local name = Instance.new("TextLabel", bill);
								name.Font = Enum.Font.Nunito;
								name.FontSize = "Size14";
								name.TextWrapped = true;
								name.Size = UDim2.new(1, 0, 1, 0);
								name.TextYAlignment = "Top";
								name.BackgroundTransparency = 1;
								name.TextStrokeTransparency = 0.5;
								if v.Name == "SilverChest" then
									name.TextColor3 = Color3.fromRGB(109, 109, 109);
									name.Text = "Silver Chest" .. " \n" .. round(((Character.Head.Position - v.RootPart.Position)).Magnitude / 3) .. " Distance";
								end;
								if v.Name == "GoldChest" then
									name.TextColor3 = Color3.fromRGB(173, 158, 21);
									name.Text = "Gold Chest" .. " \n" .. round(((Character.Head.Position - v.RootPart.Position)).Magnitude / 3) .. " Distance";
								end;
								if v.Name == "DiamondChest" then
									name.TextColor3 = Color3.fromRGB(20, 200, 200);
									name.Text = "Diamond Chest" .. " \n" .. round(((Character.Head.Position - v.RootPart.Position)).Magnitude / 3) .. " Distance";
								end;
							else
								v["EspChest"].TextLabel.Text = v.Name .. "   \n" .. round(((Character.Head.Position - v.RootPart.Position)).Magnitude / 3) .. " Distance";
							end;
						end;
					elseif v:FindFirstChild("EspChest") then
						(v:FindFirstChild("EspChest")):Destroy();
					end;
				end;
			end);
		end;
	end;
end);
spawn(function()
	while wait() do
		task.wait(1)
		if not _G.EspDevilfruit then return end
		for i, v in pairs(Workspace:GetDescendants()) do
			pcall(function()
				if _G.EspDevilfruit then
					if v.Name and string.find(v.Name, "Fruit") then
						if not v.Handle:FindFirstChild(("EspDevilFruit")) then
							local bill = Instance.new("BillboardGui", v.Handle);
							bill.Name = "EspDevilFruit";
							bill.ExtentsOffset = Vector3.new(0, 1, 0);
							bill.Size = UDim2.new(1, 200, 1, 30);
							bill.Adornee = v.Handle;
							bill.AlwaysOnTop = true;
							local name = Instance.new("TextLabel", bill);
							name.Font = Enum.Font.GothamSemibold;
							name.FontSize = "Size14";
							name.TextWrapped = true;
							name.Size = UDim2.new(1, 0, 1, 0);
							name.TextYAlignment = "Top";
							name.BackgroundTransparency = 1;
							name.TextStrokeTransparency = 0.5;
							name.TextColor3 = Color3.fromRGB(255, 255, 255);
							name.Text = v.Name .. " \n" .. round(((Character.Head.Position - v.Handle.Position)).Magnitude / 3) .. " Distance";
							local rainbowColors = {
								Color3.fromRGB(255, 0, 0),
								Color3.fromRGB(255, 127, 0),
								Color3.fromRGB(255, 255, 0),
								Color3.fromRGB(0, 255, 0),
								Color3.fromRGB(0, 0, 255),
								Color3.fromRGB(75, 0, 130),
								Color3.fromRGB(148, 0, 211)
							};
							local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut);
							(coroutine.wrap(function()
								while true do
									for _, color in ipairs(rainbowColors) do
										local tween = TweenService:Create(name, tweenInfo, {
											TextColor3 = color
										});
										tween:Play();
										tween.Completed:Wait();
									end;
								end;
							end))();
						else
							v.Handle["EspDevilFruit"].TextLabel.Text = v.Name .. " \n" .. round(((Character.Head.Position - v.Handle.Position)).Magnitude / 3) .. " Distance";
						end;
					end;
				elseif v.Handle:FindFirstChild("EspDevilFruit") then
					(v.Handle:FindFirstChild("EspDevilFruit")):Destroy();
				end;
			end);
		end;
	end;
end);
spawn(function()
	while wait() do
		task.wait(1)
		if not _G.EspFlower then return end
		for i, v in pairs(Workspace:GetChildren()) do
			pcall(function()
				if v.Name == "Flower2" or v.Name == "Flower1" then
					if _G.EspFlower then
						if not v:FindFirstChild(("EspFlower")) then
							local bill = Instance.new("BillboardGui", v);
							bill.Name = "EspFlower";
							bill.ExtentsOffset = Vector3.new(0, 1, 0);
							bill.Size = UDim2.new(1, 200, 1, 30);
							bill.Adornee = v;
							bill.AlwaysOnTop = true;
							local name = Instance.new("TextLabel", bill);
							name.Font = Enum.Font.GothamSemibold;
							name.FontSize = "Size14";
							name.TextWrapped = true;
							name.Size = UDim2.new(1, 0, 1, 0);
							name.TextYAlignment = "Top";
							name.BackgroundTransparency = 1;
							name.TextStrokeTransparency = 0.5;
							name.TextColor3 = Color3.fromRGB(255, 100, 100);
							if v.Name == "Flower1" then
								name.Text = "Blue Flower" .. " \n" .. round(((Character.Head.Position - v.Position)).Magnitude / 3) .. " Distance";
								name.TextColor3 = Color3.fromRGB(40, 40, 255);
							end;
							if v.Name == "Flower2" then
								name.Text = "Red Flower" .. " \n" .. round(((Character.Head.Position - v.Position)).Magnitude / 3) .. " Distance";
								name.TextColor3 = Color3.fromRGB(255, 100, 100);
							end;
						else
							v["EspFlower"].TextLabel.Text = v.Name .. "   \n" .. round(((Character.Head.Position - v.Position)).Magnitude / 3) .. " Distance";
						end;
					elseif v:FindFirstChild("EspFlower") then
						(v:FindFirstChild("EspFlower")):Destroy();
					end;
				end;
			end);
		end;
	end;
end);
spawn(function()
	while wait() do
		task.wait(1)
		if not _G.EspRealFruit then return end
		for i, v in pairs(Workspace.AppleSpawner:GetChildren()) do
			if v:IsA("Tool") then
				if _G.EspRealFruit then
					if not v.Handle:FindFirstChild(("EspRealFruit")) then
						local bill = Instance.new("BillboardGui", v.Handle);
						bill.Name = "EspRealFruit";
						bill.ExtentsOffset = Vector3.new(0, 1, 0);
						bill.Size = UDim2.new(1, 200, 1, 30);
						bill.Adornee = v.Handle;
						bill.AlwaysOnTop = true;
						local name = Instance.new("TextLabel", bill);
						name.Font = Enum.Font.GothamSemibold;
						name.FontSize = "Size14";
						name.TextWrapped = true;
						name.Size = UDim2.new(1, 0, 1, 0);
						name.TextYAlignment = "Top";
						name.BackgroundTransparency = 1;
						name.TextStrokeTransparency = 0.5;
						name.TextColor3 = Color3.fromRGB(200, 70, 70);
						name.Text = v.Name .. " \n" .. round(((Character.Head.Position - v.Handle.Position)).Magnitude / 3) .. " Distance";
					else
						v.Handle["EspRealFruit"].TextLabel.Text = v.Name .. " " .. round(((Character.Head.Position - v.Handle.Position)).Magnitude / 3) .. " Distance";
					end;
				elseif v.Handle:FindFirstChild("EspRealFruit") then
					(v.Handle:FindFirstChild("EspRealFruit")):Destroy();
				end;
			end;
		end;
		for i, v in pairs(Workspace.PineappleSpawner:GetChildren()) do
			if v:IsA("Tool") then
				if _G.EspRealFruit then
					if not v.Handle:FindFirstChild(("EspRealFruit")) then
						local bill = Instance.new("BillboardGui", v.Handle);
						bill.Name = "EspRealFruit";
						bill.ExtentsOffset = Vector3.new(0, 1, 0);
						bill.Size = UDim2.new(1, 200, 1, 30);
						bill.Adornee = v.Handle;
						bill.AlwaysOnTop = true;
						local name = Instance.new("TextLabel", bill);
						name.Font = Enum.Font.GothamSemibold;
						name.FontSize = "Size14";
						name.TextWrapped = true;
						name.Size = UDim2.new(1, 0, 1, 0);
						name.TextYAlignment = "Top";
						name.BackgroundTransparency = 1;
						name.TextStrokeTransparency = 0.5;
						name.TextColor3 = Color3.fromRGB(255, 170, 0);
						name.Text = v.Name .. " \n" .. round(((Character.Head.Position - v.Handle.Position)).Magnitude / 3) .. " Distance";
					else
						v.Handle["EspRealFruit"].TextLabel.Text = v.Name .. " " .. round(((Character.Head.Position - v.Handle.Position)).Magnitude / 3) .. " Distance";
					end;
				elseif v.Handle:FindFirstChild("EspRealFruit") then
					(v.Handle:FindFirstChild("EspRealFruit")):Destroy();
				end;
			end;
		end;
		for i, v in pairs(Workspace.BananaSpawner:GetChildren()) do
			if v:IsA("Tool") then
				if _G.EspRealFruit then
					if not v.Handle:FindFirstChild(("EspRealFruit")) then
						local bill = Instance.new("BillboardGui", v.Handle);
						bill.Name = "EspRealFruit";
						bill.ExtentsOffset = Vector3.new(0, 1, 0);
						bill.Size = UDim2.new(1, 200, 1, 30);
						bill.Adornee = v.Handle;
						bill.AlwaysOnTop = true;
						local name = Instance.new("TextLabel", bill);
						name.Font = Enum.Font.GothamSemibold;
						name.FontSize = "Size14";
						name.TextWrapped = true;
						name.Size = UDim2.new(1, 0, 1, 0);
						name.TextYAlignment = "Top";
						name.BackgroundTransparency = 1;
						name.TextStrokeTransparency = 0.5;
						name.TextColor3 = Color3.fromRGB(240, 255, 10);
						name.Text = v.Name .. " \n" .. round(((Character.Head.Position - v.Handle.Position)).Magnitude / 3) .. " Distance";
					else
						v.Handle["EspRealFruit"].TextLabel.Text = v.Name .. " " .. round(((Character.Head.Position - v.Handle.Position)).Magnitude / 3) .. " Distance";
					end;
				elseif v.Handle:FindFirstChild("EspRealFruit") then
					(v.Handle:FindFirstChild("EspRealFruit")):Destroy();
				end;
			end;
		end;
	end;
end);
spawn(function()
	while wait() do
		task.wait(1)
		if not _G.EspMonster then return end
		pcall(function()
			if _G.EspMonster then
				for i, v in pairs(Enemies:GetChildren()) do
					if v:FindFirstChild("HumanoidRootPart") then
						if not v:FindFirstChild("EspMonster") then
							local BillboardGui = Instance.new("BillboardGui");
							local TextLabel = Instance.new("TextLabel");
							BillboardGui.Parent = v;
							BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
							BillboardGui.Active = true;
							BillboardGui.Name = "EspMonster";
							BillboardGui.AlwaysOnTop = true;
							BillboardGui.LightInfluence = 1;
							BillboardGui.Size = UDim2.new(0, 200, 0, 50);
							BillboardGui.StudsOffset = Vector3.new(0, 2.5, 0);
							TextLabel.Parent = BillboardGui;
							TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
							TextLabel.BackgroundTransparency = 1;
							TextLabel.Size = UDim2.new(0, 200, 0, 50);
							TextLabel.Font = Enum.Font.GothamBold;
							TextLabel.TextColor3 = Color3.fromRGB(120, 130, 230);
							TextLabel.Text.Size = 35;
						end;
						local Dis = math.floor((HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude);
						v.EspMonster.TextLabel.Text = v.Name .. " - " .. Dis .. " Distance";
					end;
				end;
			else
				for i, v in pairs(Enemies:GetChildren()) do
					if v:FindFirstChild("EspMonster") then
						v.EspMonster:Destroy();
					end;
				end;
			end;
		end);
	end;
end);
spawn(function()
	while wait() do
		task.wait(1)
		if not _G.EspSeabeast then return end
		pcall(function()
			if _G.EspSeabeast then
				for i, v in pairs(Workspace.SeaBeasts:GetChildren()) do
					if v:FindFirstChild("HumanoidRootPart") then
						if not v:FindFirstChild("EspSeabeasts") then
							local BillboardGui = Instance.new("BillboardGui");
							local TextLabel = Instance.new("TextLabel");
							BillboardGui.Parent = v;
							BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
							BillboardGui.Active = true;
							BillboardGui.Name = "EspSeabeasts";
							BillboardGui.AlwaysOnTop = true;
							BillboardGui.LightInfluence = 1;
							BillboardGui.Size = UDim2.new(0, 200, 0, 50);
							BillboardGui.StudsOffset = Vector3.new(0, 2.5, 0);
							TextLabel.Parent = BillboardGui;
							TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
							TextLabel.BackgroundTransparency = 1;
							TextLabel.Size = UDim2.new(0, 200, 0, 50);
							TextLabel.Font = Enum.Font.Gotham;
							TextLabel.TextColor3 = Color3.fromRGB(60, 240, 120);
							TextLabel.Text.Size = 35;
						end;
						local Dis = math.floor((HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude);
						v.EspSeabeasts.TextLabel.Text = v.Name .. " - " .. Dis .. " Distance";
					end;
				end;
			else
				for i, v in pairs(Workspace.SeaBeasts:GetChildren()) do
					if v:FindFirstChild("EspSeabeasts") then
						v.EspSeabeasts:Destroy();
					end;
				end;
			end;
		end);
	end;
end);
spawn(function()
	while wait() do
		task.wait(1)
		if not _G.EspNpc then return end
		pcall(function()
			if _G.EspNpc then
				for i, v in pairs(Workspace.NPCs:GetChildren()) do
					if v:FindFirstChild("HumanoidRootPart") then
						if not v:FindFirstChild("EspNpc") then
							local BillboardGui = Instance.new("BillboardGui");
							local TextLabel = Instance.new("TextLabel");
							BillboardGui.Parent = v;
							BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
							BillboardGui.Active = true;
							BillboardGui.Name = "EspNpc";
							BillboardGui.AlwaysOnTop = true;
							BillboardGui.LightInfluence = 1;
							BillboardGui.Size = UDim2.new(0, 200, 0, 50);
							BillboardGui.StudsOffset = Vector3.new(0, 2.5, 0);
							TextLabel.Parent = BillboardGui;
							TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
							TextLabel.BackgroundTransparency = 1;
							TextLabel.Size = UDim2.new(0, 200, 0, 50);
							TextLabel.Font = Enum.Font.Cartoon;
							TextLabel.TextColor3 = Color3.fromRGB(200, 60, 120);
							TextLabel.Text.Size = 45;
						end;
						local Dis = math.floor((HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude);
						v.EspNpc.TextLabel.Text = v.Name .. " - " .. Dis .. " Distance";
					end;
				end;
			else
				for i, v in pairs(Workspace.NPCs:GetChildren()) do
					if v:FindFirstChild("EspNpc") then
						v.EspNpc:Destroy();
					end;
				end;
			end;
		end);
	end;
end);
spawn(function()
	while wait() do
		task.wait(1)
		if not _G.EspMirage then return end
		for i, v in pairs(Workspace._WorldOrigin.Locations:GetChildren()) do
			pcall(function()
				if _G.EspMirage then
					if v.Name == "Mirage Island" then
						if not v:FindFirstChild("EspMirageIsland") then
							local bill = Instance.new("BillboardGui", v);
							bill.Name = "EspMirageIsland";
							bill.ExtentsOffset = Vector3.new(0, 1, 0);
							bill.Size = UDim2.new(1, 200, 1, 30);
							bill.Adornee = v;
							bill.AlwaysOnTop = true;
							local name = Instance.new("TextLabel", bill);
							name.Font = "Code";
							name.FontSize = "Size14";
							name.TextWrapped = true;
							name.Size = UDim2.new(1, 0, 1, 0);
							name.TextYAlignment = "Top";
							name.BackgroundTransparency = 1;
							name.TextStrokeTransparency = 0.5;
							name.TextColor3 = Color3.fromRGB(50, 180, 50);
						else
							v.EspMirageIsland.TextLabel.Text = v.Name .. "   \n" .. round(((Character.Head.Position - v.Position)).Magnitude / 3) .. " M";
						end;
					end;
				elseif v:FindFirstChild("EspMirageIsland") then
					(v:FindFirstChild("EspMirageIsland")):Destroy();
				end;
			end);
		end;
	end;
end);
spawn(function()
	while wait() do
		task.wait(1)
		if not _G.EspKitsune then return end
		for i, v in pairs(Workspace._WorldOrigin.Locations:GetChildren()) do
			pcall(function()
				if _G.EspKitsune then
					if v.Name == "Kitsune Island" then
						if not v:FindFirstChild("EspKitsuneIsland") then
							local bill = Instance.new("BillboardGui", v);
							bill.Name = "EspKitsuneIsland";
							bill.ExtentsOffset = Vector3.new(0, 1, 0);
							bill.Size = UDim2.new(1, 200, 1, 30);
							bill.Adornee = v;
							bill.AlwaysOnTop = true;
							local name = Instance.new("TextLabel", bill);
							name.Font = "Code";
							name.FontSize = "Size14";
							name.TextWrapped = true;
							name.Size = UDim2.new(1, 0, 1, 0);
							name.TextYAlignment = "Top";
							name.BackgroundTransparency = 1;
							name.TextStrokeTransparency = 0.5;
							name.TextColor3 = Color3.fromRGB(40, 40, 180);
						else
							v.EspKitsuneIsland.TextLabel.Text = v.Name .. "   \n" .. round(((Character.Head.Position - v.Position)).Magnitude / 3) .. " M";
						end;
					end;
				elseif v:FindFirstChild("EspKitsuneIsland") then
					(v:FindFirstChild("EspKitsuneIsland")):Destroy();
				end;
			end);
		end;
	end;
end);
spawn(function()
	while wait() do
		task.wait(1)
		if not _G.EspFrozen then return end
		for i, v in pairs(Workspace._WorldOrigin.Locations:GetChildren()) do
			pcall(function()
				if _G.EspFrozen then
					if v.Name == "Frozen Dimension" then
						if not v:FindFirstChild("EspFrozen") then
							local bill = Instance.new("BillboardGui", v);
							bill.Name = "EspFrozen";
							bill.ExtentsOffset = Vector3.new(0, 1, 0);
							bill.Size = UDim2.new(1, 200, 1, 30);
							bill.Adornee = v;
							bill.AlwaysOnTop = true;
							local name = Instance.new("TextLabel", bill);
							name.Font = "Code";
							name.FontSize = "Size14";
							name.TextWrapped = true;
							name.Size = UDim2.new(1, 0, 1, 0);
							name.TextYAlignment = "Top";
							name.BackgroundTransparency = 1;
							name.TextStrokeTransparency = 0.5;
							name.TextColor3 = Color3.fromRGB(50, 180, 255);
						else
							v.EspFrozen.TextLabel.Text = v.Name .. "   \n" .. round(((Character.Head.Position - v.Position)).Magnitude / 3) .. " M";
						end;
					end;
				elseif v:FindFirstChild("EspFrozen") then
					(v:FindFirstChild("EspFrozen")):Destroy();
				end;
			end);
		end;
	end;
end);
spawn(function()
	while wait() do
		task.wait(1)
		if not _G.EspPrehistoric then return end
		for i, v in pairs(Workspace._WorldOrigin.Locations:GetChildren()) do
			pcall(function()
				if _G.EspPrehistoric then
					if v.Name == "Prehistoric Island" then
						if not v:FindFirstChild("EspPrehistoric") then
							local bill = Instance.new("BillboardGui", v);
							bill.Name = "EspPrehistoric";
							bill.ExtentsOffset = Vector3.new(0, 1, 0);
							bill.Size = UDim2.new(1, 200, 1, 30);
							bill.Adornee = v;
							bill.AlwaysOnTop = true;
							local name = Instance.new("TextLabel", bill);
							name.Font = "Code";
							name.FontSize = "Size14";
							name.TextWrapped = true;
							name.Size = UDim2.new(1, 0, 1, 0);
							name.TextYAlignment = "Top";
							name.BackgroundTransparency = 1;
							name.TextStrokeTransparency = 0.5;
							name.TextColor3 = Color3.fromRGB(200, 50, 40);
						else
							v.EspPrehistoric.TextLabel.Text = v.Name .. "   \n" .. round(((Character.Head.Position - v.Position)).Magnitude / 3) .. " M";
						end;
					end;
				elseif v:FindFirstChild("EspPrehistoric") then
					(v:FindFirstChild("EspPrehistoric")):Destroy();
				end;
			end);
		end;
	end;
end);
spawn(function()
	while wait() do
		task.wait(1)
		if not _G.EspAdvFruitDealer then return end
		for i, v in pairs(Workspace.NPCs:GetChildren()) do
			pcall(function()
				if _G.EspAdvFruitDealer then
					if v.Name == "Advanced Fruit Dealer" then
						if not v:FindFirstChild("EspAdvanceFruitDealer") then
							local bill = Instance.new("BillboardGui", v);
							bill.Name = "EspAdvanceFruitDealer";
							bill.ExtentsOffset = Vector3.new(0, 1, 0);
							bill.Size = UDim2.new(1, 200, 1, 30);
							bill.Adornee = v;
							bill.AlwaysOnTop = true;
							local name = Instance.new("TextLabel", bill);
							name.Font = "Code";
							name.FontSize = "Size14";
							name.TextWrapped = true;
							name.Size = UDim2.new(1, 0, 1, 0);
							name.TextYAlignment = "Top";
							name.BackgroundTransparency = 1;
							name.TextStrokeTransparency = 0.5;
							name.TextColor3 = Color3.fromRGB(250, 50, 50);
						else
							v.EspAdvanceFruitDealer.TextLabel.Text = v.Name .. "   \n" .. round(((Character.Head.Position - v.Position)).Magnitude / 3) .. " M";
						end;
					end;
				elseif v:FindFirstChild("EspAdvanceFruitDealer") then
					(v:FindFirstChild("EspAdvanceFruitDealer")):Destroy();
				end;
			end);
		end;
	end;
end);
spawn(function()
	while wait() do
		task.wait(1)
		if not _G.EspAura then return end
		for i, v in pairs(Workspace.NPCs:GetChildren()) do
			pcall(function()
				if _G.EspAura then
					if v.Name == "Master of Enhancement" then
						if not v:FindFirstChild("EspAura") then
							local bill = Instance.new("BillboardGui", v);
							bill.Name = "EspAura";
							bill.ExtentsOffset = Vector3.new(0, 1, 0);
							bill.Size = UDim2.new(1, 200, 1, 30);
							bill.Adornee = v;
							bill.AlwaysOnTop = true;
							local name = Instance.new("TextLabel", bill);
							name.Font = "Code";
							name.FontSize = "Size14";
							name.TextWrapped = true;
							name.Size = UDim2.new(1, 0, 1, 0);
							name.TextYAlignment = "Top";
							name.BackgroundTransparency = 1;
							name.TextStrokeTransparency = 0.5;
							name.TextColor3 = Color3.fromRGB(200, 55, 255);
						else
							v.EspAura.TextLabel.Text = v.Name .. "   \n" .. round(((Character.Head.Position - v.Position)).Magnitude / 3) .. " M";
						end;
					end;
				elseif v:FindFirstChild("EspAura") then
					(v:FindFirstChild("EspAura")):Destroy();
				end;
			end);
		end;
	end;
end);
spawn(function()
	while wait() do
		task.wait(1)
		if not _G.EspGear then return end
		if Workspace.Map:FindFirstChild("MysticIsland") then
			for i, v in pairs(Workspace.Map.MysticIsland:GetChildren()) do
				pcall(function()
					if _G.EspGear then
						if v.Name == "MeshPart" then
							if not v:FindFirstChild("AutoFarmBlazeEmber") then
								local bill = Instance.new("BillboardGui", v);
								bill.Name = "EspGear";
								bill.ExtentsOffset = Vector3.new(0, 1, 0);
								bill.Size = UDim2.new(1, 200, 1, 30);
								bill.Adornee = v;
								bill.AlwaysOnTop = true;
								local name = Instance.new("TextLabel", bill);
								name.Font = "Code";
								name.FontSize = "Size14";
								name.TextWrapped = true;
								name.Size = UDim2.new(1, 0, 1, 0);
								name.TextYAlignment = "Top";
								name.BackgroundTransparency = 1;
								name.TextStrokeTransparency = 0.5;
								name.TextColor3 = Color3.fromRGB(80, 245, 245);
							else
								v.EspGear.TextLabel.Text = v.Name .. "   \n" .. round(((Character.Head.Position - v.Position)).Magnitude / 3) .. " M";
							end;
						end;
					elseif v:FindFirstChild("EspGear") then
						(v:FindFirstChild("EspGear")):Destroy();
					end;
				end);
			end;
		end;
	end;
end);
function Click()
	(game:GetService("VirtualUser")):CaptureController();
	(game:GetService("VirtualUser")):Button1Down(Vector2.new(1280, 672));
end;
function AutoHaki()
	if not Character:FindFirstChild("HasBuso") then
		Remotes.CommF_:InvokeServer("Buso");
	end;
end;
function UnEquipWeapon(wp)
	if Character:FindFirstChild(wp) then
		(Character:FindFirstChild(wp)).Parent = LocalPlayer.Backpack;
	end;
end;
function EquipWeapon(val)
	if not Character:FindFirstChild(val) then
		if LocalPlayer.Backpack:FindFirstChild(val) then
			Tool = LocalPlayer.Backpack:FindFirstChild(val);
			Character.Humanoid:EquipTool(Tool);
		end;
	end;
end;
task.spawn(function()
	for i, v in pairs(Workspace._WorldOrigin:GetChildren()) do
		pcall(function()
			if v.Name == "CurvedRing" or v.Name == "SlashHit" or v.Name == "SwordSlash" or v.Name == "SlashTail" or v.Name == "Sounds" then
				v:Destroy();
			end;
		end);
	end;
end);
function GetDistance(target)
	return math.floor((target.Position - HumanoidRootPart.Position).Magnitude);
end;
function BTP(value)
	pcall(function()
		if (value.Position - HumanoidRootPart.Position).Magnitude >= 2000 and Character.Humanoid.Health > 0 then
			repeat
				wait();
				HumanoidRootPart.CFrame = value;
				Remotes.CommF_:InvokeServer("SetSpawnPoint");
				HumanoidRootPart.CFrame = value;
				Remotes.CommF_:InvokeServer("SetSpawnPoint");
				wait();
				Character.Head:Destroy();
				HumanoidRootPart.CFrame = value;
			until (value.Position - HumanoidRootPart.Position).Magnitude <= 2000 and Character.Humanoid.Health > 0;
		end;
	end);
end;
function InstantTp(value)
	HumanoidRootPart.CFrame = value;
end;
function TweenBoat(pos)
	local Boat = Workspace.Boats[_G.SelectedBoat];
	if not Boat or (not Boat:FindFirstChild("VehicleSeat")) then
		return {
			Stop = function()
			end
		};
	end;
	local targetCFrame = pos;
	if typeof(pos) == "Instance" and pos:IsA("BasePart") then
		targetCFrame = pos.CFrame;
	elseif typeof(pos) ~= "CFrame" then
		return {
			Stop = function()
			end
		};
	end;
	local startPosition = Boat.VehicleSeat.Position;
	local endPosition = targetCFrame.Position;
	local distance = (startPosition - endPosition).Magnitude;
	local tween = nil;
	local duration = distance / (_G.BoatTweenSpeed or 100);
	local info = TweenInfo.new(duration, Enum.EasingStyle.Linear);
	tween = TweenService:Create(Boat.VehicleSeat, info, {
		CFrame = targetCFrame
	});
	if distance > 25 then
		tween:Play();
	else
		warn("Jarak terlalu dekat, tween dibatalkan.");
	end;
	local StopTweenBoat = {};
	function StopTweenBoat:Stop()
		if tween and tween.PlaybackState == Enum.PlaybackState.Playing then
			tween:Cancel();
		end;
	end;
	return StopTweenBoat;
end;
function TweenPlayer(pos)
	local distance = (HumanoidRootPart.Position - pos.Position).Magnitude
	local time = distance / _G.PlayerTweenSpeed

	local tweenInfo = TweenInfo.new(
		time,
		Enum.EasingStyle.Linear,
		Enum.EasingDirection.Out
	)

	local tween = TweenService:Create(
		HumanoidRootPart,
		tweenInfo,
		{ CFrame = pos }
	)

	tween:Play()

	local stoppos = {};
	function stoppos:Stop()
		tween:Cancel();
	end;

	return stoppos;
end
function TweenPlayerOld(pos)
	task.spawn(function()
		pcall(function()
			if Character.Humanoid.Sit == true then
				Character.Humanoid.Sit = true;
			end;
			if LocalPlayer:DistanceFromCharacter(pos.Position) <= 50 then
				HumanoidRootPart.CFrame = pos;
				if Character:FindFirstChild("Root") then
					Character.Root:Destroy();
					wait();
					TweenPlayer(HumanoidRootPart.CFrame);
					wait();
				end;
				if Character:FindFirstChild("Root") then
					Character.Root:Remove();
				end;
			elseif not Character:FindFirstChild("Root") then
				local rootPart = Instance.new("Part", Character);
				rootPart.Size = Vector3.new(1, 0.5, 1);
				rootPart.Name = "Root";
				rootPart.Anchored = true;
				rootPart.Transparency = 1;
				rootPart.CanCollide = false;
				rootPart.CFrame = HumanoidRootPart.CFrame;
			end;
			local distance = (HumanoidRootPart.Position - pos.Position).Magnitude;
			local tweenInfo = TweenInfo.new(distance / _G.PlayerTweenSpeed, Enum.EasingStyle.Linear);
			local success, tweenError = pcall(function()
				local tween = TweenService:Create(Character.Root, tweenInfo, {
					CFrame = pos
				});
				tween:Play();
			end);
			if _G.StopTween == true then
				tween:Cancel();
			end;
			if not success then
				return tweenError;
			end;
			Character.Root.CFrame = HumanoidRootPart.CFrame;
			if success and Character:FindFirstChild("Root") then
				pcall(function()
					local distanceFromTarget = (HumanoidRootPart.Position - pos.Position).Magnitude;
					if distanceFromTarget >= 50 then
						task.spawn(function()
							pcall(function()
								if (Character.Root.Position - HumanoidRootPart.Position).Magnitude > 200 then
									Character.Root.CFrame = HumanoidRootPart.CFrame;
								else
									HumanoidRootPart.CFrame = Character.Root.CFrame;
								end;
							end);
						end);
					elseif distanceFromTarget >= 25 and distanceFromTarget < 40 then
						HumanoidRootPart.CFrame = pos;
					elseif distanceFromTarget < 25 then
						HumanoidRootPart.CFrame = pos;
					end;
				end);
			end;
			local stoppos = {};
			function stoppos:Stop()
				tween:Cancel();
			end;
			return stoppos;
		end);
	end);
end;
task.spawn(function()
	while task.wait() do
		pcall(function()
			HumanoidRootPart.CFrame = Character.Root.CFrame;
			if (Character.Root.Position - HumanoidRootPart.Position).Magnitude >= 1 then
				Character.Root.CFrame = HumanoidRootPart.CFrame;
			end;
		end);
	end;
end);
task.spawn(function()
	RunService.RenderStepped:Connect(function()
		pcall(function()
			if setscriptable then
				setscriptable(LocalPlayer, "SimulationRadius", true);
			end;
			if sethiddenproperty then
				sethiddenproperty(LocalPlayer, "SimulationRadius", math.huge);
			end;
		end);
	end);
end);

local Modules = ReplicatedStorage:WaitForChild("Modules");
local Net = Modules:WaitForChild("Net");
local AttackModule = {};
local RegisterAttack = Net:WaitForChild("RE/RegisterAttack");
local RegisterHit = Net:WaitForChild("RE/RegisterHit");
function AttackModule:AttackEnemy(Target, Table)
	if Target then
		RegisterAttack:FireServer(0);
		RegisterHit:FireServer(Target, Table or {});
	end;
end;
function AttackModule:AttackNearest()
	local mon = {
		nil,
		{}
	};
	for _, Enemy in Enemies:GetChildren() do
		if not mon[1] and Enemy:FindFirstChild("HumanoidRootPart", true) and LocalPlayer:DistanceFromCharacter(Enemy.HumanoidRootPart.Position) < 60 then
			mon[1] = Enemy:FindFirstChild("HumanoidRootPart");
		elseif Enemy:FindFirstChild("HumanoidRootPart", true) and LocalPlayer:DistanceFromCharacter(Enemy.HumanoidRootPart.Position) < 60 then
			table.insert(mon[2], {
				[1] = Enemy,
				[2] = Enemy:FindFirstChild("HumanoidRootPart")
			});
		end;
	end;
	self:AttackEnemy(unpack(mon));
	local player = {
		nil,
		{}
	};
	for _, Player in Players:GetChildren() do
		if not player[1] and Player:FindFirstChild("HumanoidRootPart", true) and LocalPlayer:DistanceFromCharacter(Player.HumanoidRootPart.Position) < 60 then
			player[1] = Player.Character:FindFirstChild("HumanoidRootPart");
		elseif Player.Character:FindFirstChild("HumanoidRootPart", true) and LocalPlayer:DistanceFromCharacter(Player.HumanoidRootPart.Position) < 60 then
			table.insert(player[2], {
				[1] = Player,
				[2] = Player.Character:FindFirstChild("HumanoidRootPart")
			});
		end;
	end;
	self:AttackEnemy(unpack(player));
end;
function AttackModule:BladeHits()
	self:AttackNearest();
end;
function Attack()
	if not _G.AutoFarmFruitMastery or (not _G.AutoFarmGunMastery) then
		AttackModule:BladeHits();
	end;
end;
function Actived()
	local tool = Character:FindFirstChildOfClass("Tool")
	for i, v in next,getconnections(tool.Activated) do 
		if typeof(v.Function) == 'function' then 
			getupvalues(v.Function)
		end 
	end 
end
function AttackM1()
	local tool = Character:FindFirstChildOfClass("Tool")
	local LeftClickRemote = tool:FindFirstChild('LeftClickRemote');
	if getToolTip() == "Blox Fruit" then
		if LeftClickRemote then
			Actived()
			LeftClickRemote:FireServer(Vector3.new(0.01,-500,0.01),1,true);		
			LeftClickRemote:FireServer(false)
		end
	end
end
function NormalAttack()
	AttackModule:BladeHits();
end;
spawn(function()
	RunService.RenderStepped:Connect(function()
		pcall(function()
			if UseSkill or UseGunSkill or _G.SeaSkill then
				for i, v in pairs(LocalPlayer.PlayerGui.Notifications:GetChildren()) do
					for _, Notif in pairs(v:GetChildren()) do
						if string.find(Notif.Text, "Skill locked!") then
							v:Destroy();
						end;
					end;
				end;
			end;
		end);
	end);
end);
function EquipWeaponSword()
	pcall(function()
		for i, v in pairs(LocalPlayer.Backpack:GetChildren()) do
			if v.ToolTip == "Sword" and v:IsA("Tool") then
				local ToolHumanoid = LocalPlayer.Backpack:FindFirstChild(v.Name);
				Character.Humanoid:EquipTool(ToolHumanoid);
			end;
		end;
	end);
end;
spawn(function()
	local angle = 0;
	while wait() do
		if _G.SpinPosition then
			local radius = 20;
			local farmDistance = _G.FarmDistance;
			local radian = math.rad(angle);
			local x = math.cos(radian) * radius;
			local z = math.sin(radian) * radius;
			Pos = CFrame.new(x, farmDistance, z);
			angle = (angle + 30) % 360;
		else
			Pos = CFrame.new(0, _G.FarmDistance, 0);
		end;
		wait(0);
	end;
end);
spawn(function()
	pcall(function()
		while wait() do
			if World1 then
				if _G.AutoSaber or _G.AutoSecondSea or _G.AutoWardenSword or _G.AutoGreybeard or _G.AutoPole or _G.AutoSharkSaw then
					if not HumanoidRootPart:FindFirstChild("BodyClip") then
						local Noclip = Instance.new("BodyVelocity");
						Noclip.Name = "BodyClip";
						Noclip.Parent = HumanoidRootPart;
						Noclip.MaxForce = Vector3.new(100000, 100000, 100000);
						Noclip.Velocity = Vector3.new(0, 0, 0);
					end;
				end;
			end;
		end;
	end);
end);
spawn(function()
	pcall(function()
		while wait() do
			if World1 then
				if _G.AutoSaber or _G.AutoSecondSea or _G.AutoWardenSword or _G.AutoGreybeard or _G.AutoPole or _G.AutoSharkSaw then
					for _, v in pairs(Character:GetDescendants()) do
						if v:IsA("BasePart") then
							v.CanCollide = false;
						end;
					end;
				end;
			end;
		end;
	end);
end);
spawn(function()
	pcall(function()
		while wait() do
			if World2 then
				if _G.LawRaid or _G.AutoRengoku or _G.AutoThirdSea or _G.AutoDragonTrident or _G.AutoAttackSeabeasts or _G.AutoRaid then
					if not HumanoidRootPart:FindFirstChild("BodyClip") then
						local Noclip = Instance.new("BodyVelocity");
						Noclip.Name = "BodyClip";
						Noclip.Parent = HumanoidRootPart;
						Noclip.MaxForce = Vector3.new(100000, 100000, 100000);
						Noclip.Velocity = Vector3.new(0, 0, 0);
					end;
				end;
			end;
		end;
	end);
end);
spawn(function()
	pcall(function()
		while wait() do
			if World2 then
				if _G.AutoRengoku or _G.AutoThirdSea or _G.AutoDragonTrident or _G.AutoAttackSeabeasts or _G.AutoRaid then
					for _, v in pairs(Character:GetDescendants()) do
						if v:IsA("BasePart") then
							v.CanCollide = false;
						end;
					end;
				end;
			end;
		end;
	end);
end);
spawn(function()
	pcall(function()
		while wait() do
			if World3 then
				if _G.AutoPirateRaid or _G.AutoKillCakeprince or _G.TweenToKitsuneIsland or _G.TweenToFrozenDimension or _G.SummonForzenDimension or _G.SummonKitsuneIsland or _G.TweenToMirageIsland or _G.AutoTrain or _G.SailBoat or _G.AutoKillPlayerAfterTrial or _G.TweenToHighestMirage or _G.AutoTrial or _G.FindBlueGear or _G.AutoFarmBone or _G.AutoKillDoughking or _G.AutoSoulGuitar or _G.AutoTushita or _G.AutoEliteHunter or _G.AutoDarkDagger or _G.AutoHallowScythe or _G.AutoFarmKatakuri or _G.AutoBuddySword or _G.AutoRaid or _G.AutoSummonTyrantOfTheSkies or _G.AutoKillTyrantOfTheSkies then
					if not HumanoidRootPart:FindFirstChild("BodyClip") then
						local Noclip = Instance.new("BodyVelocity");
						Noclip.Name = "BodyClip";
						Noclip.Parent = HumanoidRootPart;
						Noclip.MaxForce = Vector3.new(100000, 100000, 100000);
						Noclip.Velocity = Vector3.new(0, 0, 0);
					end;
				end;
			end;
		end;
	end);
end);
spawn(function()
	pcall(function()
		while wait() do
			if World3 then
				if _G.AutoPirateRaid or _G.AutoKillCakeprince or _G.TweenToKitsuneIsland or _G.TweenToFrozenDimension or _G.SummonForzenDimension or _G.SummonKitsuneIsland or _G.TweenToMirageIsland or _G.AutoTrain or _G.SailBoat or _G.AutoKillPlayerAfterTrial or _G.TweenToHighestMirage or _G.AutoTrial or _G.FindBlueGear or _G.AutoFarmBone or _G.AutoKillDoughking or _G.AutoSoulGuitar or _G.AutoTushita or _G.AutoEliteHunter or _G.AutoDarkDagger or _G.AutoHallowScythe or _G.AutoFarmKatakuri or _G.AutoBuddySword or _G.AutoRaid or _G.AutoSummonTyrantOfTheSkies or _G.AutoKillTyrantOfTheSkies then
					for _, v in pairs(Character:GetDescendants()) do
						if v:IsA("BasePart") then
							v.CanCollide = false;
						end;
					end;
				end;
			end;
		end;
	end);
end);
spawn(function()
	pcall(function()
		while wait() do
			if _G.AutoFarmLevel or _G.AutoFarmChestTween or _G.AutoElectricClaw or _G.AutoFarmFruitMastery or _G.AutoFarmGunMastery or _G.TeleportIsland or _G.TeleportToPlayer or _G.TweenToFruit or _G.TeleportNPC or _G.AutoFarmMon or _G.AutoFarmAllBoss or _G.AutoFarmBoss or _G.AutoFarmSwordMastery or _G.AutoFarmMaterial or _G.AutoAttackMonDungeon or _G.AutoFarmCandy then
				if not HumanoidRootPart:FindFirstChild("BodyClip") then
					local Noclip = Instance.new("BodyVelocity");
					Noclip.Name = "BodyClip";
					Noclip.Parent = HumanoidRootPart;
					Noclip.MaxForce = Vector3.new(100000, 100000, 100000);
					Noclip.Velocity = Vector3.new(0, 0, 0);
				end;
			end;
		end;
	end);
end);
spawn(function()
	pcall(function()
		RunService.Stepped:Connect(function()
			if _G.AutoFarmLevel or _G.AutoFarmChestTween or _G.AutoElectricClaw or _G.AutoFarmFruitMastery or _G.AutoFarmGunMastery or _G.TeleportIsland or _G.TeleportToPlayer or _G.TweenToFruit or _G.TeleportNPC or _G.AutoFarmMon or _G.AutoFarmAllBoss or _G.AutoFarmBoss or _G.AutoFarmSwordMastery or _G.AutoFarmMaterial or _G.AutoAttackMonDungeon or _G.AutoFarmCandy then
				for _, v in pairs(Character:GetDescendants()) do
					if v:IsA("BasePart") then
						v.CanCollide = false;
					end;
				end;
			end;
		end);
	end);
end);
function StopTween(State)
	if not State then
		_G.StopTween = true;
		TweenPlayer(HumanoidRootPart.CFrame);
		if HumanoidRootPart:FindFirstChild("BodyClip") then
			(HumanoidRootPart:FindFirstChild("BodyClip")):Destroy();
		end;
		_G.StopTween = false;
	end;
end;
function RemoveAnimation(Mon)
	Mon.Humanoid:ChangeState(11);
	if Mon.Humanoid:FindFirstChild("Animator") then
		Mon.Humanoid.Animator:Destroy();
	end;
end;
spawn(function()
	pcall(function()
		while wait() do
			for i, v in pairs(LocalPlayer.Backpack:GetChildren()) do
				if v:IsA("Tool") then
					if v:FindFirstChild("RemoteFunctionShoot") then
						SelectWeaponGun = v.Name;
					end;
				end;
			end;
		end;
	end);
end);
local ConfigManager = Window.ConfigManager;
local Config = ConfigManager:CreateConfig("Blox Fruits Config");
InfoSection = Tabs.MainTab:Section({
	Title = "Info",
	TextXAlignment = "Left"
});
GameTimeParagraph = InfoSection:Paragraph({
	Title = "Game Time",
	Desc = "0",
	Image = "timer",
	ImageSize = 20
});
spawn(function()
	while task.wait() do
		pcall(function()
			local GameTime = math.floor(Workspace.DistributedGameTime + 0.5);
			local Hour = math.floor(GameTime / 60 ^ 2) % 24;
			local Minute = math.floor(GameTime / 60 ^ 1) % 60;
			local Second = math.floor(GameTime / 60 ^ 0) % 60;
			GameTimeParagraph:SetDesc(Hour .. " Hours " .. Minute .. " Minute " .. Second .. " Second");
		end);
	end;
end);
FpsParagraph = InfoSection:Paragraph({
	Title = "Fps",
	Desc = "0",
	Image = "monitor",
	ImageSize = 20
});
spawn(function()
	while task.wait() do
		pcall(function()
			FpsParagraph:SetDesc(Workspace:GetRealPhysicsFPS());
		end);
	end;
end);
PingParagraph = InfoSection:Paragraph({
	Title = "Ping", 
	Desc = "0",
	Image = "signal",
	ImageSize = 20
});
spawn(function()
	while task.wait() do
		pcall(function()
			PingParagraph:SetDesc((game:GetService("Stats")).Network.ServerStatsItem["Data Ping"]:GetValueString());
		end);
	end;
end);
DiscordServerParagraph = InfoSection:Paragraph({
	Title = "Discord Server",
	Desc = "https://discord.gg/dGd8gsSqGp"
});
CopyDiscordServerLinkButton = InfoSection:Button({
	Title = "Copy Discord Server Link",
	Callback = function()
		setclipboard("https://discord.gg/dGd8gsSqGp");
		WindUI:Notify({
			Title = "Notification",
			Content = "Copied",
			Duration = 3
		});
	end
});
LevelFarmSection = Tabs.MainTab:Section({
	Title = "Level Farm",
	TextXAlignment = "Left"
});
local WeaponList = {
	"Melee",
	"Sword",
	"Blox Fruit"
};
ChooseWeaponDropdown = LevelFarmSection:Dropdown({
	Title = "Choose Weapon",
	Values = WeaponList,
	Value = _G.SelectWeapon or "Melee",
	Callback = function(option)
		_G.SelectWeapon = option;
	end
});
ChooseWeaponDropdown:Select("Melee");
Config:Register("ChooseWeaponDropdown", ChooseWeaponDropdown);
function getWeapon(weapon)
	for i, v in pairs(LocalPlayer.Backpack:GetChildren()) do
		if v.ToolTip == weapon then
			if LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
				return v.Name;
			end;
		end;
	end;
	return nil;
end;
function getToolTip()
	for i, v in pairs(LocalPlayer.Backpack:GetChildren()) do
		return v.ToolTip
	end;
end
task.spawn(function()
	while wait(0.2) do
		pcall(function()
			for i, v in pairs(LocalPlayer.Backpack:GetChildren()) do
				if v.ToolTip == _G.SelectWeapon then
					if LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
						_G.SelectedWeapon = v.Name;
					end;
				end;
			end;
		end);
	end;
end);
local LevelFarmMethodList = {
	"Quest",
	"No Quest",
	"Nearest"
};
LevelFarmMethodDropdown = LevelFarmSection:Dropdown({
	Title = "Choose Method",
	Values = LevelFarmMethodList,
	Value = "Quest",
	Callback = function(option)
		_G.FarmLevelMethod = option;
	end
});
LevelFarmMethodDropdown:Select("Quest");
Config:Register("LevelFarmMethodDropdown", LevelFarmMethodDropdown);
AutoLevelFarmToggle = LevelFarmSection:Toggle({
	Title = "Auto Farm Level",
	Value = false,
	Callback = function(state)
		_G.AutoFarmLevel = state;
		StopTween(_G.AutoFarmLevel);
	end
});
Config:Register("AutoLevelFarmToggle", AutoLevelFarmToggle);
spawn(function()
	while wait() do
		wait(0.2);
		if _G.FarmLevelMethod == "No Quest" and _G.AutoFarmLevel then
			pcall(function()
				CheckQuest();
				if Enemies:FindFirstChild(Mon) then
					for i, v in pairs(Enemies:GetChildren()) do
						if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
							if v.Name == Mon then
								repeat
									RunService.Heartbeat:wait();
									EquipWeapon(_G.SelectedWeapon);
									AutoHaki();
									PosMon = v.HumanoidRootPart.CFrame;
									MonFarm = v.Name;
									TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
									v.Humanoid.WalkSpeed = 0;
									v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
									Attack();
								until not _G.AutoFarmLevel or v.Humanoid.Health <= 0 or (not v.Parent) or LocalPlayer.PlayerGui.Main.Quest.Visible == false;
							end;
						end;
					end;
				else
					TweenPlayer(CFrameMon);
					UnEquipWeapon(_G.SelectedWeapon);
				end;
			end);
		end;
	end;
end);
spawn(function()
	while wait() do
		wait(0.2);
		if _G.FarmLevelMethod == "Nearest" and _G.AutoFarmLevel then
			pcall(function()
				for i, v in pairs(Enemies:GetChildren()) do
					if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
						if v.Name then
							if (HumanoidRootPart.Position - (v:FindFirstChild("HumanoidRootPart")).Position).Magnitude <= 5000 then
								repeat
									RunService.Heartbeat:wait();
									AutoHaki();
									EquipWeapon(_G.SelectedWeapon);
									TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
									v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
									PosMon = v.HumanoidRootPart.CFrame;
									MonFarm = v.Name;
									Attack();
								until not _G.AutoFarmLevel or (not v.Parent) or v.Humanoid.Health <= 0 or (not Enemies:FindFirstChild(v.Name));
							end;
						end;
					end;
				end;
			end);
		end;
	end;
end);
spawn(function()
	while wait() do
		wait(0.2);
		if _G.FarmLevelMethod == "Quest" and _G.AutoFarmLevel then
			pcall(function()
				CheckQuest();
				local QuestTitle = LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text;
				if not string.find(QuestTitle, NameMon) then
					Remotes.CommF_:InvokeServer("AbandonQuest");
				end;
				if LocalPlayer.PlayerGui.Main.Quest.Visible == false then
					Remotes.CommF_:InvokeServer("StartQuest", NameQuest, LevelQuest);
				elseif LocalPlayer.PlayerGui.Main.Quest.Visible == true then
					if Enemies:FindFirstChild(Mon) then
						for i, v in pairs(Enemies:GetChildren()) do
							if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
								if v.Name == Mon then
									if string.find(LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) then
										repeat
											RunService.Heartbeat:wait();
											EquipWeapon(_G.SelectedWeapon);
											AutoHaki();
											PosMon = v.HumanoidRootPart.CFrame;
											TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
											v.Humanoid.WalkSpeed = 0;
											v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
											MonFarm = v.Name;
											Attack();
										until not _G.AutoFarmLevel or v.Humanoid.Health <= 0 or (not v.Parent) or LocalPlayer.PlayerGui.Main.Quest.Visible == false;
									end;
								end;
							end;
						end;
					else
						TweenPlayer(CFrameMon);
						UnEquipWeapon(_G.SelectedWeapon);
					end;
				end;
			end);
		end;
	end;
end);
MasteryFarmSection = Tabs.MainTab:Section({
	Title = "Mastery Farm",
	TextXAlignment = "Left"
});
MasteryMethodList = {};
if World3 then
	MasteryMethodList = {
		"Quest",
		"No Quest",
		"Nearest",
		"Cakeprince",
		"Bones"
	};
elseif World2 or World1 then
	MasteryMethodList = {
		"Quest",
		"No Quest",
		"Nearest"
	};
end;
MasteryMethodDropdown = MasteryFarmSection:Dropdown({
	Title = "Choose Method",
	Values = MasteryMethodList,
	Value = _G.MasteryMethod or "Quest",
	Callback = function(option)
		_G.MasteryMethod = option;
	end
});
MasteryMethodDropdown:Select("Quest");
Config:Register("MasteryMethodDropdown", MasteryMethodDropdown);
AutoFruitMasteryToggle = MasteryFarmSection:Toggle({
	Title = "Auto Fruit Mastery",
	Value = false,
	Callback = function(state)
		_G.AutoFarmFruitMastery = state;
		StopTween(_G.AutoFarmFruitMastery);
	end
});
Config:Register("AutoFruitMasteryToggle", AutoFruitMasteryToggle);
AutoGunMasteryToggle = MasteryFarmSection:Toggle({
	Title = "Auto Gun Mastery",
	Value = false,
	Callback = function(state)
		_G.AutoFarmGunMastery = state;
		StopTween(_G.AutoFarmGunMastery);
	end
});
Config:Register("AutoGunMasteryToggle", AutoGunMasteryToggle);
SwordList = {};
local Inventory = Remotes.CommF_:InvokeServer("getInventory");
task.spawn(function()
	for i, v in ipairs(Inventory) do
		if v.Type == "Sword" then
			table.insert(SwordList, v.Name);
		end;
	end;
end);
ChooseSwordDropdown = MasteryFarmSection:Dropdown({
	Title = "Choose Sword",
	Values = SwordList,
	Value = nil,
	Callback = function(option)
		_G.SelectedMasterySword = option;
	end
});
Config:Register("ChooseSwordDropdown", ChooseSwordDropdown);
function getInfoSword(SwordName)
	if Character:FindFirstChild(SwordName) then
		return true;
	elseif LocalPlayer.Backpack:FindFirstChild(SwordName) then
		return true;
	end;
	return false;
end;
spawn(function()
	while wait() do
		wait(0.2);
		pcall(function()
			if _G.AutoFarmSwordMastery then
				if not getInfoSword(_G.SelectedMasterySword) then
					Remotes.CommF_:InvokeServer("LoadItem", _G.SelectedMasterySword);
				end;
			end;
		end);
	end;
end);
AutoSwordMasteryToggle = MasteryFarmSection:Toggle({
	Title = "Auto Sword Mastery",
	Value = false,
	Callback = function(state)
		_G.AutoFarmSwordMastery = state;
		StopTween(_G.AutoFarmSwordMastery);
	end
});
Config:Register("AutoSwordMasteryToggle", AutoSwordMasteryToggle);
spawn(function()
	while wait() do
		wait(0.2);
		if _G.AutoFarmSwordMastery and _G.MasteryMethod == "Quest" then
			pcall(function()
				CheckQuest();
				if not string.find(LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) or LocalPlayer.PlayerGui.Main.Quest.Visible == false then
					Remotes.CommF_:InvokeServer("AbandonQuest");
					TweenPlayer(CFrameQuest);
					if (CFrameQuest.Position - HumanoidRootPart.Position).Magnitude <= 5 then
						Remotes.CommF_:InvokeServer("StartQuest", NameQuest, LevelQuest);
					end;
				elseif string.find(LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) or LocalPlayer.PlayerGui.Main.Quest.Visible == true then
					if Enemies:FindFirstChild(Mon) then
						for i, v in pairs(Enemies:GetChildren()) do
							if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
								if v.Name == Mon then
									repeat
										RunService.Heartbeat:wait();
										EquipWeapon(_G.SelectedMasterySword);
										TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
										AutoHaki();
										v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
										v.HumanoidRootPart.Transparency = 1;
										v.Humanoid.JumpPower = 0;
										v.Humanoid.WalkSpeed = 0;
										PosMon = v.HumanoidRootPart.CFrame;
										MonFarm = v.Name;
										Attack();
									until not _G.AutoFarmSwordMastery or (not v.Parent) or v.Humanoid.Health == 0 or LocalPlayer.PlayerGui.Main.Quest.Visible == false or (not Enemies:FindFirstChild(v.Name)) or not _G.MasteryMethod == "Quest";
								end;
							end;
						end;
					else
						TweenPlayer(CFrameMon);
						UnEquipWeapon(_G.SelectedMasterySword);
					end;
				end;
			end);
		elseif _G.AutoFarmSwordMastery and _G.MasteryMethod == "No Quest" then
			pcall(function()
				CheckQuest();
				TweenPlayer(CFrameMon);
				if Enemies:FindFirstChild(Mon) then
					for i, v in pairs(Enemies:GetChildren()) do
						if v.Name == Mon and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
							repeat
								RunService.Heartbeat:wait();
								EquipWeapon(_G.SelectedMasterySword);
								TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
								AutoHaki();
								v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
								v.HumanoidRootPart.Transparency = 1;
								v.Humanoid.JumpPower = 0;
								v.Humanoid.WalkSpeed = 0;
								PosMon = v.HumanoidRootPart.CFrame;
								MonFarm = v.Name;
								Attack();
							until not _G.AutoFarmSwordMastery or (not v.Parent) or v.Humanoid.Health == 0 or (not Enemies:FindFirstChild(v.Name)) or not _G.MasteryMethod == "No Quest";
						end;
					end;
				else
					UnEquipWeapon(_G.SelectedMasterySword);
					TweenPlayer(CFrameMon);
				end;
			end);
		elseif _G.AutoFarmSwordMastery and _G.MasteryMethod == "Bones" then
			pcall(function()
				TweenPlayer(QuestBonePos);
				if Enemies:FindFirstChild("Reborn Skeleton") or Enemies:FindFirstChild("Living Zombie") or Enemies:FindFirstChild("Demonic Soul") or Enemies:FindFirstChild("Posessed Mummy") then
					for i, v in pairs(Enemies:GetChildren()) do
						if v.Name == "Reborn Skeleton" or v.Name == "Living Zombie" or v.Name == "Demonic Soul" or v.Name == "Posessed Mummy" then
							if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
								repeat
									RunService.Heartbeat:wait();
									EquipWeapon(_G.SelectedMasterySword);
									TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
									AutoHaki();
									v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
									v.HumanoidRootPart.Transparency = 1;
									v.Humanoid.JumpPower = 0;
									v.Humanoid.WalkSpeed = 0;
									PosMon = v.HumanoidRootPart.CFrame;
									MonFarm = v.Name;
									Attack();
								until not _G.AutoFarmSwordMastery or v.Humanoid.Health <= 0 or (not v.Parent) or (not Enemies:FindFirstChild(v.Name)) or not _G.MasteryMethod == "Bones";
							end;
						elseif ReplicatedStorage:FindFirstChild("Demonic Soul") then
							TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
						end;
					end;
				end;
			end);
		elseif _G.AutoFarmSwordMastery and _G.MasteryMethod == "Cakeprince" then
			pcall(function()
				local PosCake = CFrame.new(-2091.911865234375, 70.00884246826172, -12142.8359375);
				TweenPlayer(PosCake);
				if Enemies:FindFirstChild("Cookie Crafter") or Enemies:FindFirstChild("Cake Guard") or Enemies:FindFirstChild("Baking Staff") or Enemies:FindFirstChild("Head Baker") then
					for i, v in pairs(Enemies:GetChildren()) do
						if v.Name == "Cookie Crafter" or v.Name == "Cake Guard" or v.Name == "Baking Staff" or v.Name == "Head Baker" then
							if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
								repeat
									RunService.Heartbeat:wait();
									EquipWeapon(_G.SelectedMasterySword);
									TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
									AutoHaki();
									v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
									v.HumanoidRootPart.Transparency = 1;
									v.Humanoid.JumpPower = 0;
									v.Humanoid.WalkSpeed = 0;
									PosMon = v.HumanoidRootPart.CFrame;
									MonFarm = v.Name;
									Attack();
								until not _G.AutoFarmSwordMastery or v.Humanoid.Health <= 0 or (not v.Parent) or (not Enemies:FindFirstChild(v.Name)) or not _G.MasteryMethod == "Cakeprince";
							end;
						elseif ReplicatedStorage:FindFirstChild("Baking Staff") then
							TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
						end;
					end;
				end;
			end);
		elseif _G.AutoFarmSwordMastery and _G.MasteryMethod == "Nearest" then
			pcall(function()
				for i, v in pairs(Enemies:GetChildren()) do
					if v.Name and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
						if (HumanoidRootPart.Position - (v:FindFirstChild("HumanoidRootPart")).Position).Magnitude <= 2000 then
							repeat
								RunService.Heartbeat:wait();
								EquipWeapon(_G.SelectedMasterySword);
								TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
								AutoHaki();
								v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
								v.HumanoidRootPart.Transparency = 1;
								v.Humanoid.JumpPower = 0;
								v.Humanoid.WalkSpeed = 0;
								PosMon = v.HumanoidRootPart.CFrame;
								MonFarm = v.Name;
								Attack();
							until not _G.AutoFarmSwordMastery or (not v.Parent) or v.Humanoid.Health == 0 or not _G.MasteryMethod == "Nearest";
						end;
					end;
				end;
			end);
		elseif _G.AutoFarmSwordMastery and _G.MasteryMethod == "Boss" then
			if LocalPlayer.PlayerGui.Main.Quest.Visible == false then
				CheckBossQuest();
				TweenPlayer(CFrameQBoss);
				if (CFrameQBoss.Position - HumanoidRootPart.Position).Magnitude <= 5 then
					Remotes.CommF_:InvokeServer("StartQuest", NameQuestBoss, QuestLvBoss);
				end;
			elseif LocalPlayer.PlayerGui.Main.Quest.Visible == true then
				pcall(function()
					CheckBossQuest();
					if Enemies:FindFirstChild(SelectBoss) then
						for i, v in pairs(Enemies:GetChildren()) do
							if v.Name == selectBoss and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
								repeat
									RunService.Heartbeat:wait();
									EquipWeapon(_G.SelectedMasterySword);
									TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
									AutoHaki();
									v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
									v.HumanoidRootPart.Transparency = 1;
									v.Humanoid.JumpPower = 0;
									v.Humanoid.WalkSpeed = 0;
									PosMon = v.HumanoidRootPart.CFrame;
									MonFarm = v.Name;
									Attack();
								until not _G.AutoFarmSwordMastery or not _G.MasteryMethod == "Boss" or (not v.Parent) or v.Humanoid.Health == 0 or LocalPlayer.PlayerGui.Main.Quest.Visible == false or (not Enemies:FindFirstChild(v.Name));
							end;
						end;
					end;
				end);
			end;
		end;
	end;
end);
spawn(function()
	while task.wait(0.2) do
		if _G.AutoFarmFruitMastery and _G.MasteryMethod == "Quest" then
			pcall(function()
				CheckQuest();
				if not string.find(LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) or LocalPlayer.PlayerGui.Main.Quest.Visible == false then
					Remotes.CommF_:InvokeServer("AbandonQuest");
					TweenPlayer(CFrameQuest);
					if (CFrameQuest.Position - HumanoidRootPart.Position).Magnitude <= 5 then
						Remotes.CommF_:InvokeServer("StartQuest", NameQuest, LevelQuest);
					end;
				elseif string.find(LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) or LocalPlayer.PlayerGui.Main.Quest.Visible == true then
					if Enemies:FindFirstChild(Mon) then
						for i, v in pairs(Enemies:GetChildren()) do
							if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
								if v.Name == Mon then
									repeat
										RunService.Heartbeat:wait();
										if v.Humanoid.Health <= v.Humanoid.MaxHealth * _G.MasteryHealth / 100 then
											EquipWeapon(LocalPlayer.Data.DevilFruit.Value);
											TweenPlayer(v.HumanoidRootPart.CFrame * CFrame.new(0, 25, 0) * CFrame.Angles(math.rad((-90)), 0, 0));
											Skillaimbot = true;
											UseSkill = true;
										else
											UseSkill = false;
											Skillaimbot = false;
											EquipWeapon(_G.SelectedWeapon);
											TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
											NormalAttack();
										end;
										AutoHaki();
										v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
										v.HumanoidRootPart.Transparency = 1;
										v.Humanoid.JumpPower = 0;
										v.Humanoid.WalkSpeed = 0;
										PosMon = v.HumanoidRootPart.CFrame;
										MonFarm = v.Name;
										AimBotSkillPosition = v.HumanoidRootPart.Position;
										Skillaimbot = true;
									until not _G.AutoFarmFruitMastery or (not v.Parent) or v.Humanoid.Health == 0 or LocalPlayer.PlayerGui.Main.Quest.Visible == false or (not Enemies:FindFirstChild(v.Name)) or not _G.MasteryMethod == "Quest";
									UseSkill = false;
									Skillaimbot = false;
								end;
							end;
						end;
					else
						UseSkill = false;
						TweenPlayer(CFrameMon);
						UnEquipWeapon(SelectWeapon);
					end;
				end;
			end);
		elseif _G.AutoFarmFruitMastery and _G.MasteryMethod == "No Quest" then
			pcall(function()
				CheckQuest();
				TweenPlayer(CFrameMon);
				if Enemies:FindFirstChild(Mon) then
					for i, v in pairs(Enemies:GetChildren()) do
						if v.Name == Mon and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
							repeat
								RunService.Heartbeat:wait();
								if v.Humanoid.Health <= v.Humanoid.MaxHealth * _G.MasteryHealth / 100 then
									EquipWeapon(LocalPlayer.Data.DevilFruit.Value);
									UseSkill = true;
									Skillaimbot = true;
									TweenPlayer(v.HumanoidRootPart.CFrame * CFrame.new(0, 25, 0) * CFrame.Angles(math.rad((-90)), 0, 0));
								else
									UseSkill = false;
									Skillaimbot = false;
									EquipWeapon(_G.SelectedWeapon);
									TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
									NormalAttack();
								end;
								AutoHaki();
								v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
								v.HumanoidRootPart.Transparency = 1;
								v.Humanoid.JumpPower = 0;
								v.Humanoid.WalkSpeed = 0;
								PosMon = v.HumanoidRootPart.CFrame;
								MonFarm = v.Name;
								AimBotSkillPosition = v.HumanoidRootPart.Position;
							until not _G.AutoFarmFruitMastery or (not v.Parent) or v.Humanoid.Health == 0 or (not Enemies:FindFirstChild(v.Name)) or not _G.MasteryMethod == "No Quest";
							UseSkill = false;
							Skillaimbot = false;
						end;
					end;
				else
					UseSkill = false;
					UnEquipWeapon(_G.SelectedWeapon);
					TweenPlayer(CFrameMon);
				end;
			end);
		elseif _G.AutoFarmFruitMastery and _G.MasteryMethod == "Bones" then
			pcall(function()
				TweenPlayer(QuestBonePos);
				if Enemies:FindFirstChild("Reborn Skeleton") or Enemies:FindFirstChild("Living Zombie") or Enemies:FindFirstChild("Demonic Soul") or Enemies:FindFirstChild("Posessed Mummy") then
					for i, v in pairs(Enemies:GetChildren()) do
						if v.Name == "Reborn Skeleton" or v.Name == "Living Zombie" or v.Name == "Demonic Soul" or v.Name == "Posessed Mummy" then
							if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
								repeat
									RunService.Heartbeat:wait();
									if v.Humanoid.Health <= v.Humanoid.MaxHealth * _G.MasteryHealth / 100 then
										EquipWeapon(LocalPlayer.Data.DevilFruit.Value);
										UseSkill = true;
										Skillaimbot = true;
										TweenPlayer(v.HumanoidRootPart.CFrame * CFrame.new(0, 25, 0) * CFrame.Angles(math.rad((-90)), 0, 0));
									else
										UseSkill = false;
										Skillaimbot = false;
										EquipWeapon(_G.SelectedWeapon);
										TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
										NormalAttack();
									end;
									AutoHaki();
									v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
									v.HumanoidRootPart.Transparency = 1;
									v.Humanoid.JumpPower = 0;
									v.Humanoid.WalkSpeed = 0;
									PosMon = v.HumanoidRootPart.CFrame;
									MonFarm = v.Name;
									AimBotSkillPosition = v.HumanoidRootPart.Position;
								until not _G.AutoFarmFruitMastery or v.Humanoid.Health <= 0 or (not v.Parent) or (not Enemies:FindFirstChild(v.Name)) or not _G.MasteryMethod == "Bones";
								UseSkill = false;
								Skillaimbot = false;
							end;
						elseif ReplicatedStorage:FindFirstChild("Demonic Soul") then
							TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
						end;
					end;
				end;
			end);
		elseif _G.AutoFarmFruitMastery and _G.MasteryMethod == "Cakeprince" then
			pcall(function()
				local PosCake = CFrame.new(-2091.911865234375, 70.00884246826172, -12142.8359375);
				TweenPlayer(PosCake);
				if Enemies:FindFirstChild("Cookie Crafter") or Enemies:FindFirstChild("Cake Guard") or Enemies:FindFirstChild("Baking Staff") or Enemies:FindFirstChild("Head Baker") then
					for i, v in pairs(Enemies:GetChildren()) do
						if v.Name == "Cookie Crafter" or v.Name == "Cake Guard" or v.Name == "Baking Staff" or v.Name == "Head Baker" then
							if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
								repeat
									RunService.Heartbeat:wait();
									if v.Humanoid.Health <= v.Humanoid.MaxHealth * _G.MasteryHealth / 100 then
										EquipWeapon(LocalPlayer.Data.DevilFruit.Value);
										UseSkill = true;
										Skillaimbot = true;
										TweenPlayer(v.HumanoidRootPart.CFrame * CFrame.new(0, 25, 0) * CFrame.Angles(math.rad((-90)), 0, 0));
									else
										UseSkill = false;
										Skillaimbot = false;
										EquipWeapon(_G.SelectedWeapon);
										TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
										NormalAttack();
									end;
									AutoHaki();
									v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
									v.HumanoidRootPart.Transparency = 1;
									v.Humanoid.JumpPower = 0;
									v.Humanoid.WalkSpeed = 0;
									PosMon = v.HumanoidRootPart.CFrame;
									MonFarm = v.Name;
									AimBotSkillPosition = v.HumanoidRootPart.Position;
								until not _G.AutoFarmFruitMastery or v.Humanoid.Health <= 0 or (not v.Parent) or (not Enemies:FindFirstChild(v.Name)) or not _G.MasteryMethod == "Cakeprince";
								UseSkill = false;
								Skillaimbot = false;
							end;
						elseif ReplicatedStorage:FindFirstChild("Baking Staff") then
							TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
						end;
					end;
				end;
			end);
		elseif _G.AutoFarmFruitMastery and _G.MasteryMethod == "Nearest" then
			pcall(function()
				for i, v in pairs(Enemies:GetChildren()) do
					if v.Name and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
						if (HumanoidRootPart.Position - (v:FindFirstChild("HumanoidRootPart")).Position).Magnitude <= 2000 then
							repeat
								RunService.Heartbeat:wait();
								if v.Humanoid.Health <= v.Humanoid.MaxHealth * _G.MasteryHealth / 100 then
									EquipWeapon(LocalPlayer.Data.DevilFruit.Value);
									TweenPlayer(v.HumanoidRootPart.CFrame * CFrame.new(0, 25, 0) * CFrame.Angles(math.rad((-90)), 0, 0));
									Skillaimbot = true;
									UseSkill = true;
								else
									Skillaimbot = false;
									UseSkill = false;
									EquipWeapon(_G.SelectedWeapon);
									TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
									NormalAttack();
								end;
								AutoHaki();
								v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
								v.HumanoidRootPart.Transparency = 1;
								v.Humanoid.JumpPower = 0;
								v.Humanoid.WalkSpeed = 0;
								PosMon = v.HumanoidRootPart.CFrame;
								MonFarm = v.Name;
								AimBotSkillPosition = v.HumanoidRootPart.Position;
							until not _G.AutoFarmFruitMastery or (not v.Parent) or v.Humanoid.Health == 0 or not _G.MasteryMethod == "Nearest";
							UseSkill = false;
							Skillaimbot = false;
						end;
					end;
				end;
			end);
		elseif _G.AutoFarmFruitMastery and _G.MasteryMethod == "Boss" then
			if LocalPlayer.PlayerGui.Main.Quest.Visible == false then
				CheckBossQuest();
				TweenPlayer(CFrameQBoss);
				if (CFrameQBoss.Position - HumanoidRootPart.Position).Magnitude <= 5 then
					Remotes.CommF_:InvokeServer("StartQuest", NameQuestBoss, QuestLvBoss);
				end;
			elseif LocalPlayer.PlayerGui.Main.Quest.Visible == true then
				pcall(function()
					CheckBossQuest();
					if Enemies:FindFirstChild(SelectBoss) then
						for i, v in pairs(Enemies:GetChildren()) do
							if v.Name == selectBoss and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
								repeat
									RunService.Heartbeat:wait();
									if v.Humanoid.Health <= v.Humanoid.MaxHealth * _G.MasteryHealth / 100 then
										EquipWeapon(LocalPlayer.Data.DevilFruit.Value);
										TweenPlayer(v.HumanoidRootPart.CFrame * CFrame.new(0, 25, 0) * CFrame.Angles(math.rad((-90)), 0, 0));
										Skillaimbot = true;
										UseSkill = true;
									else
										EquipWeapon(_G.SelectedWeapon);
										UseSkill = false;
										Skillaimbot = false;
										TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
										NormalAttack();
									end;
									AutoHaki();
									v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
									v.HumanoidRootPart.Transparency = 1;
									v.Humanoid.JumpPower = 0;
									v.Humanoid.WalkSpeed = 0;
									PosMon = v.HumanoidRootPart.CFrame;
									MonFarm = v.Name;
									AimBotSkillPosition = v.HumanoidRootPart.Position;
								until not _G.AutoFarmFruitMastery or not _G.MasteryMethod == "Boss" or (not v.Parent) or v.Humanoid.Health == 0 or LocalPlayer.PlayerGui.Main.Quest.Visible == false or (not Enemies:FindFirstChild(v.Name));
								UseSkill = false;
								Skillaimbot = false;
							end;
						end;
					else
						UseSkill = false;
						Skillaimbot = false;
					end;
				end);
			end;
		end;
	end;
end);
spawn(function()
	while wait() do
		wait(0.2);
		if _G.AutoFarmGunMastery and _G.MasteryMethod == "Quest" then
			pcall(function()
				CheckQuest();
				if not string.find(LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) or LocalPlayer.PlayerGui.Main.Quest.Visible == false then
					Remotes.CommF_:InvokeServer("AbandonQuest");
					TweenPlayer(CFrameQuest);
					if (CFrameQuest.Position - HumanoidRootPart.Position).Magnitude <= 5 then
						Remotes.CommF_:InvokeServer("StartQuest", NameQuest, LevelQuest);
					end;
				elseif string.find(LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) or LocalPlayer.PlayerGui.Main.Quest.Visible == true then
					if Enemies:FindFirstChild(Mon) then
						for i, v in pairs(Enemies:GetChildren()) do
							if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
								if v.Name == Mon then
									repeat
										RunService.Heartbeat:wait();
										if v.Humanoid.Health <= v.Humanoid.MaxHealth * _G.MasteryHealth / 100 then
											EquipWeapon(SelectWeaponGun);
											local ShootPosition = HumanoidRootPart.CFrame * CFrame.new(0, (-15), 0);
											(Character.Humanoid:FindFirstChild("")):InvokeServer("TAP", Vector3.new(ShootPosition.Position));
											TweenPlayer(v.HumanoidRootPart.CFrame * CFrame.new(0, 25, 0) * CFrame.Angles(math.rad((-90)), 0, 0));
											UseGunSkill = true;
											Skillaimbot = true;
										else
											UseGunSkill = false;
											Skillaimbot = false;
											EquipWeapon(_G.SelectedWeapon);
											TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
										end;
										AutoHaki();
										v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
										v.HumanoidRootPart.Transparency = 1;
										v.Humanoid.JumpPower = 0;
										v.Humanoid.WalkSpeed = 0;
										PosMon = v.HumanoidRootPart.CFrame;
										MonFarm = v.Name;
										AimBotSkillPosition = v.HumanoidRootPart.Position;
										NormalAttack();
									until not _G.AutoFarmGunMastery or (not v.Parent) or v.Humanoid.Health <= 0 or LocalPlayer.PlayerGui.Main.Quest.Visible == false or (not Enemies:FindFirstChild(v.Name)) or not _G.MasteryMethod == "Quest";
									UseGunSkill = false;
									Skillaimbot = false;
								end;
							end;
						end;
					else
						UseGunSkill = false;
						Skillaimbot = false;
						TweenPlayer(CFrameMon);
					end;
				end;
			end);
		elseif _G.AutoFarmGunMastery and _G.MasteryMethod == "No Quest" then
			pcall(function()
				CheckQuest();
				TweenPlayer(CFrameMon);
				if Enemies:FindFirstChild(Mon) then
					for i, v in pairs(Enemies:GetChildren()) do
						if v.Name == Mon and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
							repeat
								RunService.Heartbeat:wait();
								if v.Humanoid.Health <= v.Humanoid.MaxHealth * _G.MasteryHealth / 100 then
									local ShootPosition = HumanoidRootPart.CFrame * CFrame.new(0, (-15), 0);
									(Character.Humanoid:FindFirstChild("")):InvokeServer("TAP", Vector3.new(ShootPosition.Position));
									EquipWeapon(SelectWeaponGun);
									TweenPlayer(v.HumanoidRootPart.CFrame * CFrame.new(0, 25, 0) * CFrame.Angles(math.rad((-90)), 0, 0));
									UseGunSkill = true;
									Skillaimbot = true;
								else
									Skillaimbot = false;
									UseGunSkill = false;
									EquipWeapon(_G.SelectedWeapon);
									TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
								end;
								AutoHaki();
								v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
								v.HumanoidRootPart.Transparency = 1;
								v.Humanoid.JumpPower = 0;
								v.Humanoid.WalkSpeed = 0;
								PosMon = v.HumanoidRootPart.CFrame;
								MonFarm = v.Name;
								AimBotSkillPosition = v.HumanoidRootPart.Position;
								NormalAttack();
							until not _G.AutoFarmGunMastery or (not v.Parent) or v.Humanoid.Health <= 0 or (not Enemies:FindFirstChild(v.Name)) or not _G.MasteryMethod == "No Quest";
						end;
					end;
				else
					UseGunSkill = false;
					Skillaimbot = false;
					UnEquipWeapon(_G.SelectedWeapon);
					TweenPlayer(CFrameMon);
				end;
			end);
		elseif _G.AutoFarmGunMastery and _G.MasteryMethod == "Bones" then
			pcall(function()
				TweenPlayer(QuestBonePos);
				if Enemies:FindFirstChild("Reborn Skeleton") or Enemies:FindFirstChild("Living Zombie") or Enemies:FindFirstChild("Demonic Soul") or Enemies:FindFirstChild("Posessed Mummy") then
					for i, v in pairs(Enemies:GetChildren()) do
						if v.Name == "Reborn Skeleton" or v.Name == "Living Zombie" or v.Name == "Demonic Soul" or v.Name == "Posessed Mummy" then
							if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
								repeat
									RunService.Heartbeat:wait();
									if v.Humanoid.Health <= v.Humanoid.MaxHealth * _G.MasteryHealth / 100 then
										EquipWeapon(SelectWeaponGun);
										local ShootPosition = HumanoidRootPart.CFrame * CFrame.new(0, (-15), 0);
										(Character.Humanoid:FindFirstChild("")):InvokeServer("TAP", Vector3.new(ShootPosition.Position));
										UseGunSkill = true;
										Skillaimbot = true;
										TweenPlayer(v.HumanoidRootPart.CFrame * CFrame.new(0, 25, 0) * CFrame.Angles(math.rad((-90)), 0, 0));
									else
										UseGunSkill = false;
										Skillaimbot = false;
										EquipWeapon(_G.SelectedWeapon);
										TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
									end;
									AutoHaki();
									v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
									v.HumanoidRootPart.Transparency = 1;
									v.Humanoid.JumpPower = 0;
									v.Humanoid.WalkSpeed = 0;
									PosMon = v.HumanoidRootPart.CFrame;
									MonFarm = v.Name;
									AimBotSkillPosition = v.HumanoidRootPart.Position;
									NormalAttack();
								until not _G.AutoFarmGunMastery or not _G.MasteryMethod == "Bones" or v.Humanoid.Health <= 0 or (not v.Parent);
								UseGunSkill = false;
								Skillaimbot = false;
							elseif ReplicatedStorage:FindFirstChild("Demonic Soul") then
								TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
							end;
						end;
					end;
				end;
			end);
		elseif _G.AutoFarmGunMastery and _G.MasteryMethod == "Cakeprince" then
			pcall(function()
				local PosCake = CFrame.new(-2091.911865234375, 70.00884246826172, -12142.8359375);
				TweenPlayer(PosCake);
				if Enemies:FindFirstChild("Cookie Crafter") or Enemies:FindFirstChild("Cake Guard") or Enemies:FindFirstChild("Baking Staff") or Enemies:FindFirstChild("Head Baker") then
					for i, v in pairs(Enemies:GetChildren()) do
						if v.Name == "Cookie Crafter" or v.Name == "Cake Guard" or v.Name == "Baking Staff" or v.Name == "Head Baker" then
							if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
								repeat
									RunService.Heartbeat:wait();
									if v.Humanoid.Health <= v.Humanoid.MaxHealth * _G.MasteryHealth / 100 then
										EquipWeapon(SelectWeaponGun);
										local ShootPosition = HumanoidRootPart.CFrame * CFrame.new(0, (-15), 0);
										(Character.Humanoid:FindFirstChild("")):InvokeServer("TAP", Vector3.new(ShootPosition.Position));
										UseGunSkill = true;
										Skillaimbot = true;
										TweenPlayer(v.HumanoidRootPart.CFrame * CFrame.new(0, 25, 0) * CFrame.Angles(math.rad((-90)), 0, 0));
									else
										UseGunSkill = false;
										Skillaimbot = false;
										EquipWeapon(_G.SelectedWeapon);
										TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
									end;
									AutoHaki();
									v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
									v.HumanoidRootPart.Transparency = 1;
									v.Humanoid.JumpPower = 0;
									v.Humanoid.WalkSpeed = 0;
									PosMon = v.HumanoidRootPart.CFrame;
									MonFarm = v.Name;
									AimBotSkillPosition = v.HumanoidRootPart.Position;
									NormalAttack();
								until not _G.AutoFarmGunMastery or not _G.MasteryMethod == "Cakeprince" or v.Humanoid.Health <= 0 or (not v.Parent);
								UseGunSkill = false;
								Skillaimbot = false;
							elseif ReplicatedStorage:FindFirstChild("Cake Guard") then
								TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
							end;
						end;
					end;
				end;
			end);
		elseif _G.AutoFarmGunMastery and _G.MasteryMethod == "Nearest" then
			pcall(function()
				for i, v in pairs(Enemies:GetChildren()) do
					if v.Name and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
						if (HumanoidRootPart.Position - (v:FindFirstChild("HumanoidRootPart")).Position).Magnitude <= 2000 then
							repeat
								RunService.Heartbeat:wait();
								if v.Humanoid.Health <= v.Humanoid.MaxHealth * _G.MasteryHealth / 100 then
									EquipWeapon(SelectWeaponGun);
									local ShootPosition = HumanoidRootPart.CFrame * CFrame.new(0, (-15), 0);
									(Character.Humanoid:FindFirstChild("")):InvokeServer("TAP", Vector3.new(ShootPosition.Position));
									TweenPlayer(v.HumanoidRootPart.CFrame * CFrame.new(0, 25, 0) * CFrame.Angles(math.rad((-90)), 0, 0));
									UseGunSkill = true;
									Skillaimbot = true;
								else
									UseGunSkill = false;
									Skillaimbot = false;
									AutoHaki();
									EquipWeapon(_G.SelectedWeapon);
									TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
								end;
								AutoHaki();
								v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
								v.HumanoidRootPart.Transparency = 1;
								v.Humanoid.JumpPower = 0;
								v.Humanoid.WalkSpeed = 0;
								PosMon = v.HumanoidRootPart.CFrame;
								MonFarm = v.Name;
								AimBotSkillPosition = v.HumanoidRootPart.Position;
								NormalAttack();
							until not _G.AutoFarmGunMastery or (not v.Parent) or v.Humanoid.Health <= 0 or not _G.MasteryMethod == "Nearest";
							UseGunSkill = false;
							Skillaimbot = false;
						end;
					end;
				end;
			end);
		elseif _G.AutoFarmGunMastery and _G.MasteryMethod == "Boss" then
			if LocalPlayer.PlayerGui.Main.Quest.Visible == false then
				CheckBossQuest();
				TweenPlayer(CFrameQBoss);
				if (CFrameQBoss.Position - HumanoidRootPart.Position).Magnitude <= 5 then
					Remotes.CommF_:InvokeServer("StartQuest", NameQuestBoss, QuestLvBoss);
				end;
			elseif LocalPlayer.PlayerGui.Main.Quest.Visible == true then
				pcall(function()
					CheckBossQuest();
					if Enemies:FindFirstChild(SelectBoss) then
						for i, v in pairs(Enemies:GetChildren()) do
							if v.Name == selectBoss and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
								repeat
									RunService.Heartbeat:wait();
									if v.Humanoid.Health <= v.Humanoid.MaxHealth * _G.MasteryHealth / 100 then
										EquipWeapon(SelectWeaponGun);
										local ShootPosition = HumanoidRootPart.CFrame * CFrame.new(0, (-15), 0);
										(Character.Humanoid:FindFirstChild("")):InvokeServer("TAP", Vector3.new(ShootPosition.Position));
										TweenPlayer(v.HumanoidRootPart.CFrame * CFrame.new(0, 25, 0) * CFrame.Angles(math.rad((-90)), 0, 0));
										UseGunSkill = true;
										Skillaimbot = true;
									else
										UseGunSkill = false;
										Skillaimbot = false;
										AutoHaki();
										EquipWeapon(_G.SelectedWeapon);
										TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
									end;
									AutoHaki();
									v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
									v.HumanoidRootPart.Transparency = 1;
									v.Humanoid.JumpPower = 0;
									v.Humanoid.WalkSpeed = 0;
									PosMon = v.HumanoidRootPart.CFrame;
									MonFarm = v.Name;
									AimBotSkillPosition = v.HumanoidRootPart.Position;
									NormalAttack();
								until not _G.AutoFarmGunMastery or not _G.MasteryMethod == "Boss" or (not v.Parent) or v.Humanoid.Health <= 0 or LocalPlayer.PlayerGui.Main.Quest.Visible == false or (not Enemies:FindFirstChild(v.Name));
								Skillaimbot = false;
							end;
						end;
					else
						UseGunSkill = false;
						Skillaimbot = false;
						TweenPlayer((ReplicatedStorage:FindFirstChild(SelectBoss)).HumanoidRootPart.CFrame * Pos);
					end;
				end);
			end;
		end;
	end;
end);
HolidayGiftSection = Tabs.MainTab:Section({
	Title = "Holiday Gift",
	TextXAlignment = "Left"
});
CountdownParagraph = HolidayGiftSection:Paragraph({
	Title = "Countdown",
	Desc = "00:00:00"
})
spawn(function()
	while wait(0.5) do
		local countdownGift = tostring(Workspace.Countdown:FindFirstChild("SurfaceGui").TextLabel.Text)
		CountdownParagraph:SetDesc(countdownGift)
	end
end)
TeleportToHolidayGiftToggle = HolidayGiftSection:Toggle({
	Title = "Teleport To Holiday Gift",
	Default = false,
	Callback = function(state)
		_G.TeleportToHolidayGift = state
		StopTween(_G.TeleportToHolidayGift)
	end
})
spawn(function()
	while wait() do
		if _G.TeleportToHolidayGift then
			pcall(function()
				local countdown = Workspace.Countdown
				if countdown then
					TweenPlayer(countdown.CFrame) 
				end
			end)
		end
	end
end)
function findProximityPrompt(obj)
	return obj:FindFirstChild("ProximityPrompt", true);
end;
AutoCollectHolidayGiftToggle = HolidayGiftSection:Toggle({
	Title = "Auto Collect Holiday Gift",
	Default = false,
	Callback = function(state)
		_G.AutoCollectHolidayGift = state
	end
})
spawn(function()
	while wait() do
		if _G.AutoCollectHolidayGift then
			pcall(function()
				for i, v in pairs(Workspace._WorldOrigin:GetChildren()) do
					if v.Name == "Present" and (v.renderHighlight.Value.Value == LocalPlayer.Name or string.find(v.renderHighlight.Value.Value, LocalPlayer.Name)) then
						repeat 
							wait()
							TweenPlayer(v.Root.CFrame)
							if fireproximityprompt then
								fireproximityprompt(findProximityPrompt(v))
							end
						until not v.Parent or _G.AutoCollectHolidayGift == false
					end;
				end;
			end)
		end
	end
end)
AutoStoreHolidayGiftToggle = HolidayGiftSection:Toggle({
	Title = "Auto Store Holiday Gift",
	Default = false,
	Callback = function(state)
		_G.AutoStoreHolidayGift = state
	end
})
spawn(function()
	while wait() do
		if _G.AutoStoreHolidayGift then
			pcall(function()
				for i, v in pairs(LocalPlayer.Backpack:GetChildren()) do
					if string.find(v.Name, "Holiday Gift") then
						if LocalPlayer.Backpack:FindFirstChild(v.Name) then
							EquipWeapon(v.Name)
							Remotes.CommF_:InvokeServer("StoreHolidayGift")
						end;
					end;
				end;
			end)
		end
	end
end)
UnstoreHolidayGiftButton = HolidayGiftSection:Button({
	Title = "Unstore Holiday Gift",
	Callback = function()
		local inventory = Remotes.CommF_:InvokeServer("getInventory");
		for i, v in pairs(inventory) do
			if string.find(v.Name, "Holiday Gift") then
				Remotes.CommF_:InvokeServer("UnstoreHolidayGift", v.Name)
			end;
		end;
	end
})
CandyFarmSection = Tabs.MainTab:Section({
	Title = "Candy Farm",
	TextXAlignment = "Left"
});
AutoFarmCandyToggle = CandyFarmSection:Toggle({
	Title = "Auto Farm Candy",
	Desc = "Kill Nearest Mon",
	Default = false,
	Callback = function(state)
		_G.AutoFarmCandy = state
		StopTween(_G.AutoFarmCandy)
	end
})
spawn(function()
	while wait() do
		wait(0.2);
		if _G.AutoFarmCandy then
			pcall(function()
				CheckQuest();
				if (HumanoidRootPart.Position - CFrameMon.Position).Magnitude < 5000 then
					for i, v in pairs(Enemies:GetChildren()) do
						if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
							if (v.HumanoidRootPart.Position - CFrameMon.Position).Magnitude < 5000 then
								repeat
									RunService.Heartbeat:wait();
									EquipWeapon(_G.SelectedWeapon);
									AutoHaki();
									PosMon = v.HumanoidRootPart.CFrame;
									MonFarm = v.Name;
									TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
									v.Humanoid.WalkSpeed = 0;
									v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
									Attack();
								until not _G.AutoFarmCandy or v.Humanoid.Health <= 0 or (not v.Parent)
							end;
						end;
					end;
				else
					TweenPlayer(CFrameMon);
					UnEquipWeapon(_G.SelectedWeapon);
				end;
			end);
		end;
	end;
end);
local tradeCandyList = {
	"2x EXP (15 mins.) (50 Candy)",
	"Stats Refund (75 Candy)",
	"Race Reroll (100 Candy)"
}
TradeCandyDropdown = CandyFarmSection:Dropdown({
	Title = "Choose Item",
	Desc = "Select Item for Trade Candy",
	Values = tradeCandyList,
	Value = nil,
	Callback = function(option)
		_G.SelectedTradeCandy = option
	end
})
TradeCandyButton = CandyFarmSection:Button({
	Title = "Trade Candy",
	Callback = function()
		for i, v in (tradeCandyList) do
			if _G.SelectedTradeCandy == v then
				Remotes.CommF_:InvokeServer("Candies", "Buy", 1, i)
				break
			end
		end
	end
})
local limitedTradeCandyList = {
	"Elf Hat (250 Candy)",
	"Santa Hat (500 Candy)",
	"Sleigh (1000 Candy)"
}
LimitedTradeCandyDropdown = CandyFarmSection:Dropdown({
	Title = "Choose Limited Item",
	Desc = "Select Item for Limited Trade Candy",
	Values = limitedTradeCandyList,
	Value = nil,
	Callback = function(option)
		_G.SelectedLimitedTradeCandy = option
	end
})
TradeCandyButton = CandyFarmSection:Button({
	Title = "Trade Candy",
	Callback = function()
		for i, v in (limitedTradeCandyList) do
			if _G.SelectedLimitedTradeCandy == v then
				Remotes.CommF_:InvokeServer("Candies", "Buy", 2, i)
				break
			end
		end
	end
})
TyrantOfTheSkiesBossSection = Tabs.MainTab:Section({
	Title = "Tyrant Of The Skies",
	TextXAlignment = "Left"
});
TyrantOfTheSkiesEyesParagraph = TyrantOfTheSkiesBossSection:Paragraph({
	Title = "Eyes",
	Desc = "0/4"
});
function checkEagleEye()
	local islandModel = Workspace.Map.TikiOutpost.IslandModel;
	local targetEyes = {
		Eye1 = false,
		Eye2 = false,
		Eye3 = false,
		Eye4 = false
	};
	for _, v in ipairs(islandModel:GetChildren()) do
		if string.match(v.Name, "^Eye%d$") and targetEyes[v.Name] ~= nil then
			if tonumber(v.Transparency) == 0 then
				targetEyes[v.Name] = true;
			end;
		end;
	end;
	local eyeCount = 0
    for _, found in pairs(targetEyes) do
        if found then
            eyeCount = eyeCount + 1
        end
    end
    return eyeCount
end;
spawn(function()
	while wait(1) do
		TyrantOfTheSkiesEyesLabel:SetDesc(checkEagleEye().."/4")
	end;
end);
function AttackGucci()
	for _, model in pairs(Workspace.Map.TikiOutpost.IslandModel:GetChildren()) do
		if model:FindFirstChild("EagleBossArena") then
			for i, v in pairs(model.EagleBossArena:GetChildren()) do
				if v.Name == "Tree" then
					TweenPlayer(CFrame.new(v.WorldPivot.Position));
					useAllSkill();
				end;
			end;
		end;
	end;
end;
AutoSummonTyrantOfTheSkiesToggle = TyrantOfTheSkiesBossSection:Toggle({
	Title = "Auto Summon Tyrant Of The Skies",
	Value = false,
	Callback = function(state)
		_G.AutoSummonTyrantOfTheSkies = state;
		StopTween(_G.AutoSummonTyrantOfTheSkies);
	end
});
Config:Register("AutoSummonTyrantOfTheSkiesToggle", AutoSummonTyrantOfTheSkiesToggle);
spawn(function()
	while wait() do
		wait(0.2);
		if _G.AutoSummonTyrantOfTheSkies then
			pcall(function()
				if not Enemies:FindFirstChild("Tyrant of the Skies") then
					if checkEagleEye() < 4 then
						for i, v in pairs(Enemies:GetChildren()) do
							if v.Name == "Serpent Hunter" or v.Name == "Skull Slayer" or v.Name == "Isle Champion" or v.Name == "Sun-kissed Warrior" then
								if v.Humanoid and v.Humanoid.Health > 0 then
									repeat
										wait();
										EquipWeapon(_G.SelectedWeapon);
										TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
										AutoHaki();
										PosMon = v.HumanoidRootPart.CFrame;
										MonFarm = v.Name;
										Attack();
									until not v.Parent or v.Humanoid.Health <= 0 or checkEagleEye() or (not _G.AutoSummonTyrantOfTheSkies);
								end;
							end;
						end;
					else
						repeat
							wait();
							AttackGucci();
						until Enemies:FindFirstChild("Tyrant of the Skies") or (not _G.AutoSummonTyrantOfTheSkies);
					end;
				end;
			end);
		end;
	end;
end);
AutoKillTyrantOfTheSkiesToggle = TyrantOfTheSkiesBossSection:Toggle({
	Title = "Auto Kill Tyrant Of The Skies",
	Value = false,
	Callback = function(state)
		_G.AutoKillTyrantOfTheSkies = state;
		StopTween(_G.AutoKillTyrantOfTheSkies);
	end
});
Config:Register("AutoKillTyrantOfTheSkiesToggle", AutoKillTyrantOfTheSkiesToggle);
spawn(function()
	while wait() do
		wait(0.2);
		if _G.AutoKillTyrantOfTheSkies then
			pcall(function()
				if Enemies:FindFirstChild("Tyrant of the Skies") then
					for i, v in pairs(Enemies:GetChildren()) do
						if v.Name == "Tyrant of the Skies" then
							repeat
								wait();
								EquipWeapon(_G.SelectedWeapon);
								TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
								AutoHaki();
								Attack();
							until not v.Parent or (not Enemies:FindFirstChild("Tyrant of the Skies")) or (not _G.AutoKillTyrantOfTheSkies);
						end;
					end;
				end;
			end);
		end;
	end;
end);
MonFarmSection = Tabs.MainTab:Section({
	Title = "Mon Farm",
	TextXAlignment = "Left"
});
tableMon = {};
task.spawn(function()
	if World1 then
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
		};
	elseif World2 then
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
		};
	elseif World3 then
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
			"Sun-kissed Warrior",
			"Isle Champion",
			"Ocean Prophet",
			"Sea Chanter",
			"Coral Pirate",
			"Reef Bandit",
		};
	end;
end);
ChooseMonDropdown = MonFarmSection:Dropdown({
	Title = "Choose Mon",
	Values = tableMon,
	Value = nil,
	Callback = function(option)
		_G.SelectedMon = option;
	end
});
Config:Register("ChooseMonDropdown", ChooseMonDropdown);
AutoMonFarmToggle = MonFarmSection:Toggle({
	Title = "Auto Farm Mon",
	Desc = "Auto Kill Mon When Spawn",
	Value = false,
	Callback = function(state)
		_G.AutoFarmMon = state;
		StopTween(_G.AutoFarmMon);
	end
});
Config:Register("AutoMonFarmToggle", AutoMonFarmToggle);
spawn(function()
	while wait() do
		wait(0.2);
		if _G.AutoFarmMon then
			pcall(function()
				if Enemies:FindFirstChild(_G.SelectedMon) then
					for i, v in pairs(Enemies:GetChildren()) do
						if v.Name == _G.SelectedMon then
							if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
								repeat
									RunService.Heartbeat:wait();
									AutoHaki();
									EquipWeapon(_G.SelectedWeapon);
									v.Humanoid.WalkSpeed = 0;
									PosMon = v.HumanoidRootPart.CFrame;
									MonFarm = v.Name;
									v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
									TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
									Attack();
								until not _G.AutoFarmMon or (not v.Parent) or v.Humanoid.Health <= 0;
							end;
						end;
					end;
				end;
			end);
		end;
	end;
end);
BerrySection = Tabs.MainTab:Section({
	Title = "Berry",
	TextXAlignment = "Left"
});
function getBerry()
	local result = {};
	for i, v in pairs(Workspace.Map:GetDescendants()) do
		if string.find(v.Name, "{") and string.find(v.Name, "}") and v:FindFirstChild("Berries") then
			for key, val in pairs(v.Berries:GetAttributes()) do
				if string.find(key, "_BerryCFrame") then
					table.insert(result, v);
				end;
			end;
		end;
	end;
	return result;
end;
AutoCollectBerryToggle = BerrySection:Toggle({
	Title = "Auto Collect Berry",
	Desc = "Auto Collect Berry",
	Value = false,
	Callback = function(state)
		_G.AutoCollectBerry = state;
		StopTween(_G.AutoCollectBerry);
	end
});
Config:Register("AutoCollectBerryToggle", AutoCollectBerryToggle);
spawn(function()
	while wait() do
		wait(0.2)
		if _G.AutoCollectBerry then
			pcall(function()
				for i, v in pairs(getBerry()) do
					if v then
						local berries = v.Berries:GetChildren();
						if #berries > 0 then
							for _, berry in pairs(berries) do
								repeat
									wait();
									TweenPlayer(CFrame.new(berry.WorldPivot.Position));
									if (berry.WorldPivot.Position - HumanoidRootPart.Position).Magnitude <= 8 then
										sendKeyEvent("E");
									end;
								until not _G.AutoCollectBerry or (not berry.Parent);
							end;
						else
							TweenPlayer(CFrame.new(v.WorldPivot.Position));
						end;
					end;
				end;
			end);
		end;
	end;
end);
-- FishSection = Tabs.MainTab:Section({
-- 	Title = "Fish Farm",
-- 	TextXAlignment = "Left"
-- });
-- ClaimStarterPackButton = FishSection:Button({
-- 	Title = "Claim Starter Pack",
-- 	Callback = function()
-- 		(((ReplicatedStorage:WaitForChild("Modules")):WaitForChild("Net")):WaitForChild("RF/JobsRemoteFunction")):InvokeServer("FishingNPC", "Rod", "Check", "Fisherman");
-- 		(((ReplicatedStorage:WaitForChild("Modules")):WaitForChild("Net")):WaitForChild("RF/JobsRemoteFunction")):InvokeServer("FishingNPC", "Bait", "Check", "Fisherman");
-- 	end
-- });
-- AutoFarmFishToggle = FishSection:Toggle({
-- 	Title = "Auto Farm Fish",
-- 	Desc = "Auto Farm Fish",
-- 	Value = false,
-- 	Callback = function(state)
-- 		_G.AutoFarmFish = state;
-- 	end
-- });
-- Config:Register("AutoFarmFishToggle", AutoFarmFishToggle);
-- LocalPlayer.PlayerGui.ChildAdded:Connect(function(child)
-- 	if _G.AutoFarmFish then
-- 		if child.Name == "Fishing_Reeling" then
-- 			((ReplicatedStorage:WaitForChild("FishReplicated")):WaitForChild("FishingRequest")):InvokeServer("Catch", 1, 0, 1);
-- 		end;
-- 	end;
-- end);
-- spawn(function()
-- 	while wait() do
-- 		pcall(function()
-- 			if _G.AutoFarmFish then
-- 				if not (Character:FindFirstChild("Fishing Rod")):WaitForChild("Bobber") then
-- 					((ReplicatedStorage:WaitForChild("FishReplicated")):WaitForChild("FishingRequest")):InvokeServer("CastLineAtLocation", Vector3.new(24.130386352539062, -4, 5280.6806640625), 100, true);
-- 				end;
-- 			end;
-- 		end);
-- 	end;
-- end);
-- AutoSellFishToggle = FishSection:Toggle({
-- 	Title = "Auto Sell Fish",
-- 	Desc = "Auto Sell Fish",
-- 	Value = false,
-- 	Callback = function(state)
-- 		_G.AutoSellFish = state;
-- 	end
-- });
-- Config:Register("AutoSellFishToggle", AutoSellFishToggle);
-- spawn(function()
-- 	while wait() do
-- 		wait(0.2);
-- 		pcall(function()
-- 			if _G.AutoSellFish then
-- 				ReplicatedStorage:WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RF/JobsRemoteFunction"):InvokeServer("FishingNPC", "SellFish")
-- 			end;
-- 		end);
-- 	end;
-- end)
-- AutoBuyBaitToggle = FishSection:Toggle({
-- 	Title = "Auto Buy Bait",
-- 	Desc = "Auto Buy Bait",
-- 	Value = false,
-- 	Callback = function(state)
-- 		_G.AutoBuyBait = state;
-- 	end
-- });
-- spawn(function()
-- 	while wait() do
-- 		wait(0.2);
-- 		pcall(function()
-- 			if _G.AutoBuyBait then
-- 				(((ReplicatedStorage:WaitForChild("Modules")):WaitForChild("Net")):WaitForChild("RF/Craft")):InvokeServer("Craft", "Basic Bait", {});
-- 			end;
-- 		end);
-- 	end;
-- end);
BossSection = Tabs.MainTab:Section({
	Title = "Boss Farm",
	TextXAlignment = "Left"
});
BossStatusParagraph = BossSection:Paragraph({
	Title = "Boss Status",
	Desc = "N/A"
});
spawn(function()
	while wait(0.2) do
		pcall(function()
			if ReplicatedStorage:FindFirstChild(_G.SelectedBoss) or Enemies:FindFirstChild(_G.SelectedBoss) then
				BossStatusParagraph:SetDesc("Spawn!");
			else
				BossStatusParagraph:SetDesc("Not Spawn");
			end;
		end);
	end;
end);
tableBoss = {};
task.spawn(function()
	if World1 then
		tableBoss = {
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
		};
	elseif World2 then
		tableBoss = {
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
		};
	elseif World3 then
		tableBoss = {
			"Stone",
			"Island Empress",
			"Kilo Admiral",
			"Captain Elephant",
			"Beautiful Pirate",
			"rip_indra True Form",
			"Longma",
			"Soul Reaper",
			"Cake Queen"
		};
	end;
end);
ChooseBossDropdown = BossSection:Dropdown({
	Title = "Choose Boss",
	Values = tableBoss,
	Value = nil,
	Callback = function(option)
		_G.SelectedBoss = option;
	end
});
Config:Register("ChooseBossDropdown", ChooseBossDropdown);
AutoFarmBossToggle = BossSection:Toggle({
	Title = "Auto Farm Boss",
	Desc = "Auto Kill Boss When Spawn",
	Value = false,
	Callback = function(state)
		_G.AutoFarmBoss = state;
		StopTween(_G.AutoFarmBoss);
	end
});
Config:Register("AutoFarmBossToggle", AutoFarmBossToggle);
spawn(function()
	while wait() do
		wait(0.2);
		if _G.AutoFarmBoss then
			pcall(function()
				if Enemies:FindFirstChild(_G.SelectedBoss) then
					for i, v in pairs(Enemies:GetChildren()) do
						if v.Name == _G.SelectedBoss then
							if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
								repeat
									RunService.Heartbeat:wait();
									AutoHaki();
									EquipWeapon(_G.SelectedWeapon);
									v.Humanoid.WalkSpeed = 0;
									v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
									TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
									Attack();
								until not _G.AutoFarmBoss or (not v.Parent) or v.Humanoid.Health <= 0;
							end;
						end;
					end;
				elseif ReplicatedStorage:FindFirstChild(_G.SelectedBoss) then
					TweenPlayer((ReplicatedStorage:FindFirstChild(_G.SelectedBoss)).HumanoidRootPart.CFrame * CFrame.new(5, 10, 2));
				end;
			end);
		end;
	end;
end);
AutoFarmAllBossToggle = BossSection:Toggle({
	Title = "Auto Farm All Boss",
	Value = false,
	Callback = function(state)
		_G.AutoFarmAllBoss = state;
		StopTween(_G.AutoFarmAllBoss);
	end
});
Config:Register("AutoFarmAllBossToggle", AutoFarmAllBossToggle);
spawn(function()
	while wait() do
		wait(0.2);
		if _G.AutoFarmAllBoss then
			pcall(function()
				for i, boss in pairs(tableBoss) do
					if Enemies:FindFirstChild(boss) then
						for i, v in pairs(Enemies:GetChildren()) do
							if v.Name == boss then
								if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
									repeat
										RunService.Heartbeat:wait();
										AutoHaki();
										EquipWeapon(_G.SelectedWeapon);
										v.Humanoid.WalkSpeed = 0;
										v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
										TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
										Attack();
									until not _G.AutoFarmAllBoss or (not v.Parent) or v.Humanoid.Health <= 0;
								end;
							end;
						end;
					elseif ReplicatedStorage:FindFirstChild(boss) then
						TweenPlayer((ReplicatedStorage:FindFirstChild(boss)).HumanoidRootPart.CFrame * CFrame.new(5, 10, 2));
					end;
				end;
			end);
		end;
	end;
end);
EliteHunterSection = Tabs.OthersTab:Section({
	Title = "Elite Hunter",
	TextXAlignment = "Left"
});
EliteHunterParagraph = EliteHunterSection:Paragraph({
	Title = "Elite Hunter Status",
	Desc = "N/A"
});
spawn(function()
	while wait(0.2) do
		pcall(function()
			if ReplicatedStorage:FindFirstChild("Diablo") or ReplicatedStorage:FindFirstChild("Deandre") or ReplicatedStorage:FindFirstChild("Urban") or Enemies:FindFirstChild("Diablo") or Enemies:FindFirstChild("Deandre") or Enemies:FindFirstChild("Urban") then
				EliteHunterParagraph:SetDesc("Spawn!");
			else
				EliteHunterParagraph:SetDesc("Not Spawn");
			end;
		end);
	end;
end);
EliteHunterProgressParagraph = EliteHunterSection:Paragraph({
	Title = "Elite Hunter Progress",
	Desc = "N/A"
});
spawn(function()
	while wait() do
		pcall(function()
			if World1 or World2 then
				EliteHunterProgressParagraph:SetDesc("Sea 3 Only");
			elseif World3 then
				EliteHunterProgressParagraph:SetDesc(Remotes.CommF_:InvokeServer("EliteHunter", "Progress"));
			end;
		end);
	end;
end);
AutoEliteHunterToggle = EliteHunterSection:Toggle({
	Title = "Auto Elite Hunter",
	Desc = "Function Sea 3 Only",
	Value = false,
	Callback = function(state)
		_G.AutoEliteHunter = state;
		StopTween(_G.AutoEliteHunter);
	end
});
Config:Register("AutoEliteHunterToggle", AutoEliteHunterToggle);
AutoEliteHunterHopToggle = EliteHunterSection:Toggle({
	Title = "Auto Elite Hunter Hop",
	Desc = "Function Sea 3 Only",
	Value = false,
	Callback = function(state)
		_G.AutoEliteHunterHop = state;
	end
});
Config:Register("AutoEliteHunterHopToggle", AutoEliteHunterHopToggle);
spawn(function()
	while wait() do
		wait(0.2);
		if _G.AutoEliteHunter and World3 then
			pcall(function()
				local QuestTitle = LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text;
				if ReplicatedStorage:FindFirstChild("Diablo") or ReplicatedStorage:FindFirstChild("Deandre") or ReplicatedStorage:FindFirstChild("Urban") or Enemies:FindFirstChild("Diablo") or Enemies:FindFirstChild("Deandre") or Enemies:FindFirstChild("Urban") then
					if LocalPlayer.PlayerGui.Main.Quest.Visible == false then
						TweenPlayer(CFrame.new(-5418.892578125, 313.74130249023, -2826.2260742188));
						if (Vector3.new((-5418.892578125), 313.74130249023, (-2826.2260742188)) - HumanoidRootPart.Position).Magnitude <= 3 then
							Remotes.CommF_:InvokeServer("EliteHunter");
						end;
					elseif LocalPlayer.PlayerGui.Main.Quest.Visible == true then
						if string.find(QuestTitle, "Diablo") or string.find(QuestTitle, "Deandre") or string.find(QuestTitle, "Urban") then
							if Enemies:FindFirstChild("Diablo") or Enemies:FindFirstChild("Deandre") or Enemies:FindFirstChild("Urban") then
								for i, v in pairs(Enemies:GetChildren()) do
									if v.Name == "Diablo" or v.Name == "Deandre" or v.Name == "Urban" then
										if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
											repeat
												RunService.Heartbeat:wait();
												AutoHaki();
												EquipWeapon(_G.SelectedWeapon);
												v.Humanoid.WalkSpeed = 0;
												v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
												TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
												Attack();
											until _G.AutoEliteHunter == false or v.Humanoid.Health <= 0 or (not v.Parent);
										end;
									end;
								end;
							elseif ReplicatedStorage:FindFirstChild("Diablo") or ReplicatedStorage:FindFirstChild("Deandre") or ReplicatedStorage:FindFirstChild("Urban") then
								for i, v in pairs(ReplicatedStorage:GetChildren()) do
									if v.Name == "Diablo" or v.Name == "Deandre" or v.Name == "Urban" then
										TweenPlayer(CFrame.new(v.WorldPivot.Position));
									end;
								end;
							end;
						end;
					end;
				end;
			end);
		end;
	end;
end);
spawn(function()
	while wait() do
		wait(0.2);
		if _G.AutoEliteHunterHop and World3 then
			pcall(function()
				if _G.AutoEliteHunter then
					if not ReplicatedStorage:FindFirstChild("Diablo") and (not ReplicatedStorage:FindFirstChild("Deandre")) and (not ReplicatedStorage:FindFirstChild("Urban")) and (not Enemies:FindFirstChild("Diablo")) and (not Enemies:FindFirstChild("Deandre")) and (not Enemies:FindFirstChild("Urban")) then
						Hop();
					end;
				end;
			end);
		end;
	end;
end);
BoneFarmSection = Tabs.OthersTab:Section({
	Title = "Bone Farm",
	TextXAlignment = "Left"
});
local listBoneFarmMethod = {
	"Quest",
	"No Quest"
};
BoneFarmMethodDropdown = BoneFarmSection:Dropdown({
	Title = "Choose Method",
	Values = listBoneFarmMethod,
	Value = nil,
	Callback = function(option)
		_G.SelectedBoneFarmMethod = option;
	end
});
BoneFarmMethodDropdown:Select("No Quest");
Config:Register("BoneFarmMethodDropdown", BoneFarmMethodDropdown);
BoneCountParagraph = BoneFarmSection:Paragraph({
	Title = "Bones Owned",
	Desc = "N/A"
});
spawn(function()
	while wait(0.2) do
		pcall(function()
			local Bones = GetCountMaterials("Bones");
			BoneCountParagraph:SetDesc(tostring(Bones));
		end);
	end;
end);
AutoFarmBoneToggle = BoneFarmSection:Toggle({
	Title = "Auto Farm Bone",
	Desc = "Function Sea 3 Only",
	Value = false,
	Callback = function(state)
		_G.AutoFarmBone = state;
		StopTween(_G.AutoFarmBone);
	end
});
Config:Register("AutoFarmBoneToggle", AutoFarmBoneToggle);
BonePos = CFrame.new(-9506.234375, 172.130615234375, 6117.0771484375);
spawn(function()
	while wait() do
		wait(0.2);
		if _G.SelectedBoneFarmMethod == "No Quest" and _G.AutoFarmBone and World3 then
			pcall(function()
				if Enemies:FindFirstChild("Reborn Skeleton") or Enemies:FindFirstChild("Living Zombie") or Enemies:FindFirstChild("Demonic Soul") or Enemies:FindFirstChild("Posessed Mummy") then
					for i, v in pairs(Enemies:GetChildren()) do
						if v.Name == "Reborn Skeleton" or v.Name == "Living Zombie" or v.Name == "Demonic Soul" or v.Name == "Posessed Mummy" then
							if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
								repeat
									RunService.Heartbeat:wait();
									AutoHaki();
									EquipWeapon(_G.SelectedWeapon);
									v.Humanoid.WalkSpeed = 0;
									PosMon = v.HumanoidRootPart.CFrame;
									MonFarm = v.Name;
									TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
									Attack();
								until not _G.AutoFarmBone or (not v.Parent) or v.Humanoid.Health <= 0;
							end;
						end;
					end;
				else
					UnEquipWeapon(_G.SelectedWeapon);
					TweenPlayer(CFrame.new(-9506.234375, 172.130615234375, 6117.0771484375));
				end;
			end);
		end;
	end;
end);
BoneQuestPos = CFrame.new(-9516.99316, 172.017181, 6078.46533, 0, 0, -1, 0, 1, 0, 1, 0, 0);
spawn(function()
	while wait() do
		wait(0.2);
		if _G.SelectedBoneFarmMethod == "Quest" and _G.AutoFarmBone and World3 then
			pcall(function()
				local QuestTitle = LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text;
				if not string.find(QuestTitle, "Demonic Soul") then
					Remotes.CommF_:InvokeServer("AbandonQuest");
				end;
				if LocalPlayer.PlayerGui.Main.Quest.Visible == false then
					TweenPlayer(BoneQuestPos);
					if (BoneQuestPos.Position - HumanoidRootPart.Position).Magnitude <= 3 then
						Remotes.CommF_:InvokeServer("StartQuest", "HauntedQuest2", 1);
					end;
				elseif LocalPlayer.PlayerGui.Main.Quest.Visible == true then
					if Enemies:FindFirstChild("Reborn Skeleton") or Enemies:FindFirstChild("Living Zombie") or Enemies:FindFirstChild("Demonic Soul") or Enemies:FindFirstChild("Posessed Mummy") then
						for i, v in pairs(Enemies:GetChildren()) do
							if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
								if v.Name == "Reborn Skeleton" or v.Name == "Living Zombie" or v.Name == "Demonic Soul" or v.Name == "Posessed Mummy" then
									if string.find(LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Demonic Soul") then
										repeat
											RunService.Heartbeat:wait();
											EquipWeapon(_G.SelectedWeapon);
											AutoHaki();
											PosMon = v.HumanoidRootPart.CFrame;
											MonFarm = v.Name;
											TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
											v.Humanoid.WalkSpeed = 0;
											Attack();
										until not _G.AutoFarmBone or v.Humanoid.Health <= 0 or (not v.Parent) or LocalPlayer.PlayerGui.Main.Quest.Visible == false;
									end;
								end;
							end;
						end;
					end;
				end;
			end);
		end;
	end;
end);
AutoRandomSurpriseToggle = BoneFarmSection:Toggle({
	Title = "Auto Random Surprise",
	Desc = "Function Sea 3 Only",
	Value = false,
	Callback = function(state)
		_G.AutoRandomSurprise = state;
		StopTween(_G.AutoRandomSurprise);
	end
});
Config:Register("AutoRandomSurpriseToggle", AutoRandomSurpriseToggle);
spawn(function()
	pcall(function()
		while wait() do
			wait(0.2);
			if _G.AutoRandomSurprise then
				Remotes.CommF_:InvokeServer("Bones", "Buy", 1, 1);
			end;
		end;
	end);
end);
PirateRaidSection = Tabs.OthersTab:Section({
	Title = "Pirate Raid",
	TextXAlignment = "Left"
});
AutoPirateRaidToggle = PirateRaidSection:Toggle({
	Title = "Auto Pirate Raid",
	Desc = "Function Sea 3 Only",
	Value = false,
	Callback = function(state)
		_G.AutoPirateRaid = state;
		StopTween(_G.AutoPirateRaid);
	end
});
Config:Register("AutoPirateRaidToggle", AutoPirateRaidToggle);
function getPirateRaidEnemies()
	local PirateRaidPos = CFrame.new(-5515.08301, 343.112762, -3013.25171, 0.0679906458, 0.0000000121971047, -0.997685969, -0.0000000640159001, 1, 0.00000000786281706, 0.997685969, 0.000000063333168, 0.0679906458);
	for _, v in pairs(Enemies:GetChildren()) do
		if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
			local enemyPos = v.HumanoidRootPart.Position;
			if (PirateRaidPos.Position - enemyPos).Magnitude <= 2000 then
				if v then
					return v;
				else
					return false;
				end;
			end;
		end;
	end;
end;
spawn(function()
	while wait() do
		wait(0.2)
		if _G.AutoPirateRaid then
			pcall(function()
				for i, v in pairs(Enemies:GetChildren()) do
					if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
						if v.Name then
							if getPirateRaidEnemies() then
								if (HumanoidRootPart.Position - (v:FindFirstChild("HumanoidRootPart")).Position).Magnitude <= 2000 then
									repeat
										RunService.Heartbeat:wait();
										AutoHaki();
										EquipWeapon(_G.SelectedWeapon);
										TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
										v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
										v.HumanoidRootPart.Transparency = 1;
										v.Humanoid.JumpPower = 0;
										v.Humanoid.WalkSpeed = 0;
										PosMon = v.HumanoidRootPart.CFrame;
										MonFarm = v.Name;
										Attack();
									until not _G.AutoPirateRaid or (not v.Parent) or v.Humanoid.Health <= 0 or (not Enemies:FindFirstChild(v.Name));
								end;
							else
								TweenPlayer(CFrame.new(-5515.08301, 343.112762, -3013.25171, 0.0679906458, 0.0000000121971047, -0.997685969, -0.0000000640159001, 1, 0.00000000786281706, 0.997685969, 0.000000063333168, 0.0679906458));
							end;
						end;
					end;
				end;
			end);
		end;
	end;
end);
ChestFarmSection = Tabs.OthersTab:Section({
	Title = "Chest Farm",
	TextXAlignment = "Left"
});
AutoFarmChestTweenToggle = ChestFarmSection:Toggle({
	Title = "Auto Farm Chest Tween",
	Desc = "Tween to chest",
	Value = false,
	Callback = function(state)
		_G.AutoFarmChestTween = state;
		StopTween(_G.AutoFarmChestTween);
	end
});
Config:Register("AutoFarmChestTweenToggle", AutoFarmChestTweenToggle);
AutoFarmChestInstantToggle = ChestFarmSection:Toggle({
	Title = "Auto Farm Chest Instant",
	Desc = "Instant to chest",
	Value = false,
	Callback = function(state)
		_G.AutoFarmChestInstant = state;
		StopTween(_G.AutoFarmChestInstant);
	end
});
Config:Register("AutoFarmChestInstantToggle", AutoFarmChestInstantToggle);
AutoStopItemsToggle = ChestFarmSection:Toggle({
	Title = "Auto Stop Items",
	Desc = "Stop When Get God's Chalice or FoD",
	Value = false,
	Callback = function(state)
		_G.AutoStopItems = state;
		StopTween(_G.AutoStopItems);
	end
});
Config:Register("AutoStopItemsToggle", AutoStopItemsToggle);
spawn(function()
	while wait() do
		wait(0.2);
		pcall(function()
			if _G.AutoStopItems then
				if LocalPlayer.Backpack:FindFirstChild("God's Chalice") or Character:FindFirstChild("God's Chalice") or LocalPlayer.Backpack:FindFirstChild("Fist of Darkness") or Character:FindFirstChild("Fist of Darkness") then
					AutoFarmChestInstantToggle:Set(false);
					AutoFarmChestTweenToggle:Set(false);
					TweenPlayer(HumanoidRootPart.CFrame);
				end;
			end;
		end);
	end;
end);
spawn(function()
	while wait() do
		wait(0.2);
		pcall(function()
			if _G.AutoFarmChestTween then
				for i, v in pairs(Workspace.ChestModels:GetChildren()) do
					if v.Name:find("Chest") then
						repeat
							wait();
							TweenPlayer(v.RootPart.CFrame);
						until _G.AutoFarmChestTween == false or (not v.Parent);
						TweenPlayer(HumanoidRootPart.CFrame);
					end;
				end;
			end;
		end);
	end;
end);
spawn(function()
	while wait() do
		wait(0.2);
		pcall(function()
			if _G.AutoFarmChestInstant then
				for i, v in pairs(Workspace.ChestModels:GetChildren()) do
					if v.Name:find("Chest") then
						repeat
							wait();
							if v.Name == "DiamondChest" then
								InstantTp(v.RootPart.CFrame);
							elseif v.Name == "GoldChest" then
								InstantTp(v.RootPart.CFrame);
							elseif v.Name == "SilverChest" then
								InstantTp(v.RootPart.CFrame);
							end;
						until not _G.AutoFarmChestInstant or (not v.Parent);
					end;
				end;
			end;
		end);
	end;
end);
CakePrinceSection = Tabs.OthersTab:Section({
	Title = "Cake Prince",
	TextXAlignment = "Left"
});
CakePrinceStatusParagraph = CakePrinceSection:Paragraph({
	Title = "Cake Prince Status",
	Desc = "N/A"
});
spawn(function()
	while task.wait(5) do
		pcall(function()
			if World3 then
				if string.len(Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 88 then
					CakePrinceStatusParagraph:SetDesc(string.sub(Remotes.CommF_:InvokeServer("CakePrinceSpawner"), 39, 41) .. " Remaining");
				elseif string.len(Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 87 then
					CakePrinceStatusParagraph:SetDesc(string.sub(Remotes.CommF_:InvokeServer("CakePrinceSpawner"), 39, 40) .. " Remaining");
				elseif string.len(Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 86 then
					CakePrinceStatusParagraph:SetDesc(string.sub(Remotes.CommF_:InvokeServer("CakePrinceSpawner"), 39, 39) .. " Remaining");
				else
					CakePrinceStatusParagraph:SetDesc("Cake Prince Status: Spawned!");
				end;
			else
				CakePrinceStatusParagraph:SetDesc("Sea 3 only");
			end;
		end);
	end;
end);
AutoKatakuriToggle = CakePrinceSection:Toggle({
	Title = "Auto Katakuri",
	Desc = "Auto Farm + Kill Cake Prince [ Sea 3 Only ]",
	Value = false,
	Callback = function(state)
		_G.AutoFarmKatakuri = state;
		StopTween(_G.AutoFarmKatakuri);
	end
});
Config:Register("AutoKatakuriToggle", AutoKatakuriToggle);
AutoSpawnCakePrinceToggle = CakePrinceSection:Toggle({
	Title = "Auto Spawn Cake Prince",
	Desc = "Function Sea 3 Only",
	Value = false,
	Callback = function(state)
		_G.AutoSpawnCakeprince = state;
		StopTween(_G.AutoSpawnCakeprince);
	end
});
Config:Register("AutoSpawnCakePrinceToggle", AutoSpawnCakePrinceToggle);
spawn(function()
	while wait() do
		wait(0.2);
		if _G.AutoSpawnCakeprince and World3 then
			wait(2);
			Remotes.CommF_:InvokeServer("CakePrinceSpawner", true);
		end;
	end;
end);
spawn(function()
	while wait() do
		wait(0.2);
		if _G.AutoFarmKatakuri and World3 then
			pcall(function()
				if ReplicatedStorage:FindFirstChild("Cake Prince") or Enemies:FindFirstChild("Cake Prince") then
					if Enemies:FindFirstChild("Cake Prince") then
						for i, v in pairs(Enemies:GetChildren()) do
							if v.Name == "Cake Prince" then
								if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
									repeat
										RunService.Heartbeat:wait();
										AutoHaki();
										EquipWeapon(_G.SelectedWeapon);
										v.Humanoid.WalkSpeed = 0;
										v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
										TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
										RemoveAnimation(v);
										Attack();
									until not _G.AutoFarmKatakuri or (not v.Parent) or v.Humanoid.Health <= 0;
								end;
							end;
						end;
					elseif Workspace.Map.CakeLoaf.BigMirror.Other.Transparency == 0 and ((CFrame.new((-1990.672607421875), 4532.99951171875, (-14973.6748046875))).Position - HumanoidRootPart.Position).Magnitude >= 2000 then
						TweenPlayer(CFrame.new(-2151.82153, 149.315704, -12404.9053));
					end;
				elseif Enemies:FindFirstChild("Cookie Crafter") or Enemies:FindFirstChild("Cake Guard") or Enemies:FindFirstChild("Baking Staff") or Enemies:FindFirstChild("Head Baker") then
					for i, v in pairs(Enemies:GetChildren()) do
						if v.Name == "Cookie Crafter" or v.Name == "Cake Guard" or v.Name == "Baking Staff" or v.Name == "Head Baker" then
							if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
								repeat
									RunService.Heartbeat:wait();
									AutoHaki();
									EquipWeapon(_G.SelectedWeapon);
									v.Humanoid.WalkSpeed = 0;
									v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
									PosMon = v.HumanoidRootPart.CFrame;
									MonFarm = v.Name;
									TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
									Attack();
								until not _G.AutoFarmKatakuri or (not v.Parent) or v.Humanoid.Health <= 0 or Workspace.Map.CakeLoaf.BigMirror.Other.Transparency == 0 or ReplicatedStorage:FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") or Enemies:FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]");
							end;
						end;
					end;
				else
					UnEquipWeapon(_G.SelectedWeapon);
					TweenPlayer(CFrame.new(-2091.911865234375, 70.00884246826172, -12142.8359375));
				end;
			end);
		end;
	end;
end);
AutoKillCakePrinceToggle = CakePrinceSection:Toggle({
	Title = "Auto Kill Cake Prince",
	Desc = "Function Sea 3 Only",
	Value = false,
	Callback = function(state)
		_G.AutoKillCakeprince = state;
		StopTween(_G.AutoKillCakeprince);
	end
});
Config:Register("AutoKillCakePrinceToggle", AutoKillCakePrinceToggle);
AutoKillDoughKingToggle = CakePrinceSection:Toggle({
	Title = "Auto Kill Dough King",
	Desc = "Function Sea 3 Only",
	Value = false,
	Callback = function(state)
		_G.AutoKillDoughking = state;
		StopTween(_G.AutoKillDoughking);
	end
});
Config:Register("AutoKillDoughKingToggle", AutoKillDoughKingToggle);
spawn(function()
	while wait() do
		wait(0.2);
		if _G.AutoKillCakeprince and World3 then
			pcall(function()
				if Enemies:FindFirstChild("Cake Prince") then
					for i, v in pairs(Enemies:GetChildren()) do
						if v.Name == "Cake Prince" then
							if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
								repeat
									RunService.Heartbeat:wait();
									AutoHaki();
									EquipWeapon(_G.SelectedWeapon);
									v.Humanoid.WalkSpeed = 0;
									v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
									TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
									RemoveAnimation(v);
									Attack();
									if v.Humanoid:FindFirstChild("Animator") then
										v.Humanoid.Animator:Destroy();
									end;
								until not _G.AutoKillCakeprince or (not v.Parent) or v.Humanoid.Health <= 0;
							end;
						end;
					end;
				else
					UnEquipWeapon(_G.SelectedWeapon);
				end;
			end);
		end;
	end;
end);
spawn(function()
	while wait() do
		wait(0.2);
		if _G.AutoKillDoughking and World3 then
			pcall(function()
				if Enemies:FindFirstChild("Dough King") then
					for i, v in pairs(Enemies:GetChildren()) do
						if v.Name == "Dough King" then
							if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
								repeat
									RunService.Heartbeat:wait();
									AutoHaki();
									EquipWeapon(_G.SelectedWeapon);
									v.Humanoid.WalkSpeed = 0;
									v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
									TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
									RemoveAnimation(v);
									Attack();
									if v.Humanoid:FindFirstChild("Animator") then
										v.Humanoid.Animator:Destroy();
									end;
								until not _G.AutoKillDoughking or (not v.Parent) or v.Humanoid.Health <= 0;
							end;
						end;
					end;
				end;
			end);
		end;
	end;
end);
MaterialsSection = Tabs.OthersTab:Section({
	Title = "Materials",
	TextXAlignment = "Left"
});
MaterialList = {};
task.spawn(function()
	if World1 then
		MaterialList = {
			"Magma Ore",
			"Angel Wings",
			"Leather",
			"Scrap Metal"
		};
	elseif World2 then
		MaterialList = {
			"Radioactive",
			"Mystic Droplet",
			"Magma Ore",
			"Leather",
			"Ectoplasm",
			"Scrap Metal"
		};
	elseif World3 then
		MaterialList = {
			"Leather",
			"Scrap Metal",
			"Conjured Cocoa",
			"Dragon Scale",
			"Gunpowder",
			"Fish Tail",
			"Mini Tusk"
		};
	end;
end);
function getConfigMaterial(Material)
	if Material == "Radioactive" and World2 then
		MaterialMon = {
			"Factory Staff"
		};
		MaterialPos = CFrame.new(-507.7895202636719, 72.99479675292969, -126.45632934570312);
	elseif Material == "Mystic Droplet" and World2 then
		MaterialMon = {
			"Water Fighter"
		};
		MaterialPos = CFrame.new(-3352.9013671875, 285.01556396484375, -10534.841796875);
	elseif Material == "Magma Ore" and World1 then
		MaterialMon = {
			"Military Spy"
		};
		MaterialPos = CFrame.new(-5850.2802734375, 77.28675079345703, 8848.6748046875);
	elseif Material == "Magma Ore" and World2 then
		MaterialMon = {
			"Lava Pirate"
		};
		MaterialPos = CFrame.new(-5234.60595703125, 51.953372955322266, -4732.27880859375);
	elseif Material == "Angel Wings" and World1 then
		MaterialMon = {
			"Royal Soldier"
		};
		MaterialPos = CFrame.new(-7827.15625, 5606.912109375, -1705.5833740234375);
	elseif Material == "Leather" and World1 then
		MaterialMon = {
			"Pirate"
		};
		MaterialPos = CFrame.new(-1211.8792724609375, 4.787090301513672, 3916.83056640625);
	elseif Material == "Leather" and World2 then
		MaterialMon = {
			"Marine Captain"
		};
		MaterialPos = CFrame.new(-2010.5059814453125, 73.00115966796875, -3326.620849609375);
	elseif Material == "Leather" and World3 then
		MaterialMon = {
			"Jungle Pirate"
		};
		MaterialPos = CFrame.new(-11975.78515625, 331.7734069824219, -10620.0302734375);
	elseif Material == "Ectoplasm" and World2 then
		MaterialMon = {
			"Ship Deckhand",
			"Ship Engineer",
			"Ship Steward",
			"Ship Officer"
		};
		MaterialPos = CFrame.new(911.35827636719, 125.95812988281, 33159.5390625);
	elseif Material == "Scrap Metal" and World1 then
		MaterialMon = {
			"Brute"
		};
		MaterialPos = CFrame.new(-1132.4202880859375, 14.844913482666016, 4293.30517578125);
	elseif Material == "Scrap Metal" and World2 then
		MaterialMon = {
			"Mercenary"
		};
		MaterialPos = CFrame.new(-972.307373046875, 73.04473876953125, 1419.2901611328125);
	elseif Material == "Scrap Metal" and World3 then
		MaterialMon = {
			"Pirate Millionaire"
		};
		MaterialPos = CFrame.new(-289.6311950683594, 43.8282470703125, 5583.66357421875);
	elseif Material == "Conjured Cocoa" and World3 then
		MaterialMon = {
			"Chocolate Bar Battler"
		};
		MaterialPos = CFrame.new(744.7930908203125, 24.76934242248535, -12637.7255859375);
	elseif Material == "Dragon Scale" and World3 then
		MaterialMon = {
			"Dragon Crew Warrior"
		};
		MaterialPos = CFrame.new(5824.06982421875, 51.38640213012695, -1106.694580078125);
	elseif Material == "Gunpowder" and World3 then
		MaterialMon = {
			"Pistol Billionaire"
		};
		MaterialPos = CFrame.new(-379.6134338378906, 73.84449768066406, 5928.5263671875);
	elseif Material == "Fish Tail" and World3 then
		MaterialMon = {
			"Fishman Captain"
		};
		MaterialPos = CFrame.new(-10961.0126953125, 331.7977600097656, -8914.29296875);
	elseif Material == "Mini Tusk" and World3 then
		MaterialMon = {
			"Mithological Pirate"
		};
		MaterialPos = CFrame.new(-13516.0458984375, 469.8182373046875, -6899.16064453125);
	end;
end;
MaterialDropdown = MaterialsSection:Dropdown({
	Title = "Choose Material",
	Values = MaterialList,
	Value = nil,
	Callback = function(option)
		_G.SelectedMaterial = option;
	end
});
MaterialDropdown:Select(MaterialList[1]);
Config:Register("MaterialDropdown", MaterialDropdown);
AutoFarmMaterialToggle = MaterialsSection:Toggle({
	Title = "Auto Farm Material",
	Value = false,
	Callback = function(state)
		_G.AutoFarmMaterial = state;
		StopTween(_G.AutoFarmMaterial);
	end
});
Config:Register("AutoFarmMaterialToggle", AutoFarmMaterialToggle);
spawn(function()
	while wait() do
		wait(0.2);
		if _G.AutoFarmMaterial then
			pcall(function()
				getConfigMaterial(_G.SelectedMaterial);
				for i, mon in pairs(MaterialMon) do
					if Enemies:FindFirstChild(mon) then
						for i, v in pairs(Enemies:GetChildren()) do
							if v.Name == mon then
								if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
									repeat
										RunService.Heartbeat:wait();
										AutoHaki();
										EquipWeapon(_G.SelectedWeapon);
										PosMon = v.HumanoidRootPart.CFrame;
										MonFarm = v.Name;
										TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
										Attack();
									until not _G.AutoFarmMaterial or (not v.Parent) or v.Humanoid.Health <= 0;
								end;
							end;
						end;
					else
						UnEquipWeapon(_G.SelectedWeapon);
						local Distance = (Vector3.new(MaterialPos) - HumanoidRootPart.Position).Magnitude;
						if Distance > 18000 and _G.SelectedMaterial == "Ectoplasm" then
							Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125));
						end;
						TweenPlayer(MaterialPos);
					end;
				end;
			end);
		end;
	end;
end);
SettingsSection = Tabs.SettingsTab:Section({
	Title = "Settings",
	TextXAlignment = "Left"
});
SpinPositionToggle = SettingsSection:Toggle({
	Title = "Spin Position",
	Desc = "Spin Position When Farm",
	Value = false,
	Callback = function(state)
		_G.SpinPosition = state;
	end
});
Config:Register("SpinPositionToggle", SpinPositionToggle);
FarmDistanceSlider = SettingsSection:Slider({
	Title = "Farm Distance",
	Step = 1,
	Value = {
		Min = 10,
		Max = 50,
		Value = _G.FarmDistance or 35
	},
	Callback = function(value)
		_G.FarmDistance = value;
	end
});
FarmDistanceSlider:Set(35);
Config:Register("FarmDistanceSlider", FarmDistanceSlider);
PlayerTweenSpeedSlider = SettingsSection:Slider({
	Title = "Player Tween Speed",
	Step = 1,
	Value = {
		Min = 50,
		Max = 350,
		Value = _G.PlayerTweenSpeed or 300
	},
	Callback = function(value)
		_G.PlayerTweenSpeed = value;
	end
});
PlayerTweenSpeedSlider:Set(300);
Config:Register("PlayerTweenSpeedSlider", PlayerTweenSpeedSlider);
BringMobToggle = SettingsSection:Toggle({
	Title = "Bring Mob",
	Value = true,
	Callback = function(state)
		_G.BringMob = state;
	end
});
Config:Register("BringMobToggle", BringMobToggle);
spawn(function()
	while wait() do
		wait(0.2);
		if _G.BringMob then
			pcall(function()
				for i, v in pairs(Enemies:GetChildren()) do
					if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and (not string.find(v.Name, "Boss")) and v.Name == MonFarm and (v.HumanoidRootPart.Position - HumanoidRootPart.Position).Magnitude <= BringMobDistance then
						v.HumanoidRootPart.CFrame = PosMon;
						v.Humanoid.JumpPower = 0
						v.Humanoid.WalkSpeed = 0
						v.HumanoidRootPart.Size = Vector3.new(60,60,60)
						v.HumanoidRootPart.CanCollide = false
						v.Head.CanCollide = false
						if v.Humanoid:FindFirstChild("Animator") then
							v.Humanoid.Animator:Destroy()
						end
						v.Humanoid:ChangeState(11)
						v.Humanoid:ChangeState(14)
					end;
				end;
			end);
		end;
	end;
end);
local BringList = {
	"Low",
	"Normal",
	"High"
};
BringMobDropdown = SettingsSection:Dropdown({
	Title = "Bring Mob",
	Values = BringList,
	Value = _G.BringMobMode or "Normal",
	Callback = function(option)
		_G.BringMobMode = option;
	end
});
BringMobDropdown:Select("Normal");
Config:Register("BringMobDropdown", BringMobDropdown);
spawn(function()
	while wait() do
		wait(0.2);
		if _G.BringMob then
			pcall(function()
				if _G.BringMobMode == "Low" then
					BringMobDistance = 150;
				elseif _G.BringMobMode == "Normal" then
					BringMobDistance = 250;
				elseif _G.BringMobMode == "High" then
					BringMobDistance = 800;
				end;
			end);
		end;
	end;
end);
AttackAuraToggle = SettingsSection:Toggle({
	Title = "Atatck Aura",
	Desc = "Attack Nearest Enemies",
	Value = _G.AttackAura or false,
	Callback = function(state)
		_G.AttackAura = state;
	end
});
Config:Register("AttackAuraToggle", AttackAuraToggle);
spawn(function()
	RunService.RenderStepped:Connect(function()
		if _G.AttackAura and (not _G.AutoFarmFruitMastery) and (not _G.AutoFarmGunMastery) then
			pcall(function()
				Attack();
				AttackM1();
			end);
		end;
	end);
end);
GraphicSettingSection = Tabs.SettingsTab:Section({
	Title = "Graphic",
	TextXAlignment = "Left"
});
HideNotificationToggle = GraphicSettingSection:Toggle({
	Title = "Hide Notification",
	Value = false,
	Callback = function(state)
		_G.HideNotification = state;
	end
});
spawn(function()
	while wait(0.2) do
		local Notif = LocalPlayer.PlayerGui.Notifications;
		if _G.HideNotification then
			Notif.Enabled = false;
		else
			Notif.Enabled = true;
		end;
	end;
end);
HideDamageTextToggle = GraphicSettingSection:Toggle({
	Title = "Hide Damage Text",
	Value = false,
	Callback = function(state)
		_G.HideDamageText = state;
	end
});
Config:Register("HideDamageTextToggle", HideDamageTextToggle);
spawn(function()
	while wait() do
		wait(0.2);
		if _G.HideDamageText then
			ReplicatedStorage.Assets.GUI.DamageCounter.Enabled = false;
		else
			ReplicatedStorage.Assets.GUI.DamageCounter.Enabled = true;
		end;
	end;
end);
BlackScreenToggle = GraphicSettingSection:Toggle({
	Title = "Black Screen",
	Value = false,
	Callback = function(state)
		_G.BlackScreen = state;
	end
});
Config:Register("BlackScreenToggle", BlackScreenToggle);
spawn(function()
	while wait() do
		wait(0.2);
		if _G.BlackScreen then
			LocalPlayer.PlayerGui.Main.Blackscreen.Size = UDim2.new(500, 0, 500, 500);
		else
			LocalPlayer.PlayerGui.Main.Blackscreen.Size = UDim2.new(1, 0, 500, 500);
		end;
	end;
end);
WhiteScreenToggle = GraphicSettingSection:Toggle({
	Title = "White Screen",
	Value = false,
	Callback = function(state)
		_G.WhiteScreen = state;
	end
});
Config:Register("WhiteScreenToggle", WhiteScreenToggle);
spawn(function()
	while _G.WhiteScreen do
		wait(0.2);
		if _G.WhiteScreen then
			RunService:Set3dRenderingEnabled(false);
		else
			RunService:Set3dRenderingEnabled(true);
		end;
	end;
end);
MasterySettingsSection = Tabs.SettingsTab:Section({
	Title = "Mastery Settings",
	TextXAlignment = "Left"
});
MasteryHealthSlider = MasterySettingsSection:Slider({
	Title = "Mastery Health %",
	Step = 1,
	Value = {
		Min = 1,
		Max = 100,
		Value = 25
	},
	Callback = function(value)
		_G.MasteryHealth = value;
	end
});
MasteryHealthSlider:Set(25);
Config:Register("MasteryHealthSlider", MasteryHealthSlider);
DevilFruitSkillParagraph = MasterySettingsSection:Paragraph({
	Title = "Devil Fruit Skill"
});
local FruitSkillList = {
	"Z",
	"X",
	"C",
	"V",
	"F",
}
MasteryFruitSkillDropdown = MasterySettingsSection:Dropdown({
	Title = "Choose Fruit Skill",
	Values = FruitSkillList,
	Value = {"Z", "X", "C"},
	Multi = true,
	Callback = function(option)
		_G.SelectedFruitSkill = option;
	end
});
GunSkillParagraph = MasterySettingsSection:Paragraph({
	Title = "Gun Skill"
});
local GunSkillList = {
	"Z",
	"X",
}
MasteryGunSkillDropdown = MasterySettingsSection:Dropdown({
	Title = "Choose Gun Skill",
	Values = GunSkillList,
	Value = {"Z", "X"},
	Multi = true,
	Callback = function(option)
		_G.SelectedGunSkill = option;
	end
});
OthersSettingsSection = Tabs.SettingsTab:Section({
	Title = "Others",
	TextXAlignment = "Left"
});
AutoSetSpawnPointToggle = OthersSettingsSection:Toggle({
	Title = "Auto Set Spawn Point",
	Value = false,
	Callback = function(state)
		_G.AutoSetSpawnPoint = state;
	end
});
Config:Register("AutoSetSpawnPointToggle", AutoSetSpawnPointToggle);
spawn(function()
	while _G.AutoSetSpawnPoint do
		task.wait()
		if _G.AutoSetSpawnPoint then
			pcall(function()
				Remotes.CommF_:InvokeServer("SetSpawnPoint");
			end);
		end;
	end;
end);
AutoObservationToggle = OthersSettingsSection:Toggle({
	Title = "Auto Observation",
	Value = false,
	Callback = function(state)
		_G.AutoObservation = state;
	end
});
Config:Register("AutoObservationToggle", AutoObservationToggle);
spawn(function()
	while wait() do
		wait(0.2);
		if _G.AutoObservation then
			if not LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
				(game:GetService("VirtualUser")):CaptureController();
				(game:GetService("VirtualUser")):SetKeyDown("0x65");
				wait();
				(game:GetService("VirtualUser")):SetKeyUp("0x65");
			end;
		end;
	end;
end);
AutoHakiToggle = OthersSettingsSection:Toggle({
	Title = "Auto Haki",
	Value = false,
	Callback = function(state)
		_G.AutoHaki = state;
	end
});
Config:Register("AutoHakiToggle", AutoHakiToggle);
AutoRejoinToggle = OthersSettingsSection:Toggle({
	Title = "Auto Rejoin",
	Value = false,
	Callback = function(state)
		_G.AutoRejoin = state;
	end
});
Config:Register("AutoRejoinToggle", AutoRejoinToggle);
spawn(function()
	while wait() do
		wait(0.2);
		if _G.AutoRejoin then
			game.CoreGui.RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(v)
				if v.Name == "ErrorPrompt" and v:FindFirstChild("MessageArea") and v.MessageArea:FindFirstChild("ErrorFrame") then
					TeleportService:Teleport(game.PlaceId);
				end;
			end);
		end;
	end;
end);
spawn(function()
	while wait() do
		wait(0.2);
		if wait() then
			if not Character:FindFirstChild("HasBuso") then
				Remotes.CommF_:InvokeServer("Buso");
			end;
		end;
	end;
end);
WorldSection = Tabs.ItemsTab:Section({
	Title = "World",
	TextXAlignment = "Left"
});
AutoSecondSeaToggle = WorldSection:Toggle({
	Title = "Auto Second Sea",
	Desc = "Function Sea 1 Only",
	Value = false,
	Callback = function(state)
		_G.AutoSecondSea = state;
		StopTween(_G.AutoSecondSea);
	end
});
Config:Register("AutoSecondSeaToggle", AutoSecondSeaToggle);
AutoThirdSeaToggle = WorldSection:Toggle({
	Title = "Auto Third Sea",
	Desc = "Function Sea 2 Only",
	Value = false,
	Callback = function(state)
		_G.AutoThirdSea = state;
		StopTween(_G.AutoThirdSea);
	end
});
Config:Register("AutoThirdSeaToggle", AutoThirdSeaToggle);
spawn(function()
	while wait() do
		wait(0.2);
		if _G.AutoThirdSea and World2 then
			pcall(function()
				if LocalPlayer.Data.Level.Value >= 1500 and World2 then
					if Remotes.CommF_:InvokeServer("ZQuestProgress", "General") == 0 then
						TweenPlayer(CFrame.new(-1926.3221435547, 12.819851875305, 1738.3092041016));
						if ((CFrame.new((-1926.3221435547), 12.819851875305, 1738.3092041016)).Position - HumanoidRootPart.Position).Magnitude <= 10 then
							wait(1.5);
							Remotes.CommF_:InvokeServer("ZQuestProgress", "Begin");
						end;
						wait(1.8);
						if Enemies:FindFirstChild("rip_indra") then
							for i, v in pairs(Enemies:GetChildren()) do
								if v.Name == "rip_indra" then
									OldCFrameThird = v.HumanoidRootPart.CFrame;
									repeat
										RunService.Heartbeat:wait();
										AutoHaki();
										EquipWeapon(_G.SelectedWeapon);
										TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
										v.HumanoidRootPart.CFrame = OldCFrameThird;
										v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
										v.Humanoid.WalkSpeed = 0;
										Attack();
										Remotes.CommF_:InvokeServer("TravelZou");
									until _G.AutoThirdSea == false or v.Humanoid.Health <= 0 or (not v.Parent);
								end;
							end;
						elseif not Enemies:FindFirstChild("rip_indra") and ((CFrame.new((-26880.93359375), 22.848554611206, 473.18951416016)).Position - HumanoidRootPart.Position).Magnitude <= 1000 then
							TweenPlayer(CFrame.new(-26880.93359375, 22.848554611206, 473.18951416016));
						end;
					end;
				end;
			end);
		end;
	end;
end);
spawn(function()
	while wait() do
		wait(0.2);
		if _G.AutoSecondSea and World1 then
			pcall(function()
				if MyLevel >= 700 and World1 then
					if Workspace.Map.Ice.Door.CanCollide == false and Workspace.Map.Ice.Door.Transparency == 1 then
						local CFrame1 = CFrame.new(4849.29883, 5.65138149, 719.611877);
						repeat
							TweenPlayer(CFrame1);
							wait();
						until (CFrame1.Position - HumanoidRootPart.Position).Magnitude <= 3 or _G.AutoSecondSea == false;
						wait(1.1);
						Remotes.CommF_:InvokeServer("DressrosaQuestProgress", "Detective");
						wait(0.5);
						EquipWeapon("Key");
						repeat
							TweenPlayer(CFrame.new(1347.7124, 37.3751602, -1325.6488));
							wait();
						until (Vector3.new(1347.7124, 37.3751602, (-1325.6488)) - HumanoidRootPart.Position).Magnitude <= 3 or _G.AutoSecondSea == false;
						wait(0.5);
					elseif Workspace.Map.Ice.Door.CanCollide == false and Workspace.Map.Ice.Door.Transparency == 1 then
						if Enemies:FindFirstChild("Ice Admiral") then
							for i, v in pairs(Enemies:GetChildren()) do
								if v.Name == "Ice Admiral" then
									if not v.Humanoid.Health <= 0 then
										if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
											OldCFrameSecond = v.HumanoidRootPart.CFrame;
											repeat
												RunService.Heartbeat:wait();
												AutoHaki();
												EquipWeapon(_G.SelectedWeapon);
												v.Humanoid.WalkSpeed = 0;
												v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
												v.HumanoidRootPart.CFrame = OldCFrameSecond;
												TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
												Attack();
											until not _G.AutoSecondSea or (not v.Parent) or v.Humanoid.Health <= 0;
										end;
									else
										Remotes.CommF_:InvokeServer("TravelDressrosa");
									end;
								end;
							end;
						elseif ReplicatedStorage:FindFirstChild("Ice Admiral") then
							TweenPlayer((ReplicatedStorage:FindFirstChild("Ice Admiral")).HumanoidRootPart.CFrame * CFrame.new(5, 10, 7));
						end;
					end;
				end;
			end);
		end;
	end;
end);
FightingStyleSection = Tabs.ItemsTab:Section({
	Title = "Fighting Style",
	TextXAlignment = "Left"
});
AutoSuperHumanToggle = FightingStyleSection:Toggle({
	Title = "Auto Super Human",
	Value = false,
	Callback = function(state)
		_G.AutoSuperHuman = state;
		StopTween(_G.AutoSuperHuman);
	end
});
Config:Register("AutoSuperHumanToggle", AutoSuperHumanToggle);
AutoDeathStepToggle = FightingStyleSection:Toggle({
	Title = "Auto Death Step",
	Value = false,
	Callback = function(state)
		_G.AutoDeathStep = state;
		StopTween(_G.AutoDeathStep);
	end
});
Config:Register("AutoDeathStepToggle", AutoDeathStepToggle);
AutoSharkmanKarateToggle = FightingStyleSection:Toggle({
	Title = "Auto Sharkman Karate",
	Value = false,
	Callback = function(state)
		_G.AutoFishmanKarate = state;
		StopTween(_G.AutoFishmanKarate);
	end
});
Config:Register("AutoSharkmanKarateToggle", AutoSharkmanKarateToggle);
AutoElectricClawToggle = FightingStyleSection:Toggle({
	Title = "Auto Electric Claw",
	Value = false,
	Callback = function(state)
		_G.AutoElectricClaw = state;
		StopTween(_G.AutoElectricClaw);
	end
});
Config:Register("AutoElectricClawToggle", AutoElectricClawToggle);
AutoDragonTalonToggle = FightingStyleSection:Toggle({
	Title = "Auto Dragon Talon",
	Value = false,
	Callback = function(state)
		_G.AutoDragonTalon = state;
		StopTween(_G.AutoDragonTalon);
	end
});
Config:Register("AutoDragonTalonToggle", AutoDragonTalonToggle);
AutoGodHumanToggle = FightingStyleSection:Toggle({
	Title = "Auto God Human",
	Value = false,
	Callback = function(state)
		_G.AutoGodHuman = state;
		StopTween(_G.AutoGodHuman);
	end
});
Config:Register("AutoGodHumanToggle", AutoGodHumanToggle);
spawn(function()
	while wait() do
		wait(0.2);
		if _G.AutoGodHuman then
			pcall(function()
				if Character:FindFirstChild("Superhuman") or LocalPlayer.Backpack:FindFirstChild("Superhuman") or LocalPlayer.Backpack:FindFirstChild("Black Leg") or Character:FindFirstChild("Black Leg") or LocalPlayer.Backpack:FindFirstChild("Death Step") or Character:FindFirstChild("Death Step") or LocalPlayer.Backpack:FindFirstChild("Fishman Karate") or Character:FindFirstChild("Fishman Karate") or LocalPlayer.Backpack:FindFirstChild("Sharkman Karate") or Character:FindFirstChild("Sharkman Karate") or LocalPlayer.Backpack:FindFirstChild("Electro") or Character:FindFirstChild("Electro") or LocalPlayer.Backpack:FindFirstChild("Electric Claw") or Character:FindFirstChild("Electric Claw") or LocalPlayer.Backpack:FindFirstChild("Dragon Claw") or Character:FindFirstChild("Dragon Claw") or LocalPlayer.Backpack:FindFirstChild("Dragon Talon") or Character:FindFirstChild("Dragon Talon") or Character:FindFirstChild("Godhuman") or LocalPlayer.Backpack:FindFirstChild("Godhuman") then
					if Remotes.CommF_:InvokeServer("BuySuperhuman", true) == 1 then
						if LocalPlayer.Backpack:FindFirstChild("Superhuman") and (LocalPlayer.Backpack:FindFirstChild("Superhuman")).Level.Value >= 400 or Character:FindFirstChild("Superhuman") and (Character:FindFirstChild("Superhuman")).Level.Value >= 400 then
							Remotes.CommF_:InvokeServer("BuyDeathStep");
						end;
					else
						WindUI:Notify({
							Title = "Notification",
							Content = "Not Have Superhuman",
							Icon = "bell",
							Duration = 5
						});
					end;
					if Remotes.CommF_:InvokeServer("BuyDeathStep", true) == 1 then
						if LocalPlayer.Backpack:FindFirstChild("Death Step") and (LocalPlayer.Backpack:FindFirstChild("Death Step")).Level.Value >= 400 or Character:FindFirstChild("Death Step") and (Character:FindFirstChild("Death Step")).Level.Value >= 400 then
							Remotes.CommF_:InvokeServer("BuySharkmanKarate");
						end;
					else
						WindUI:Notify({
							Title = "Notification",
							Content = "Not Have Death Step",
							Icon = "bell",
							Duration = 5
						});
					end;
					if Remotes.CommF_:InvokeServer("BuySharkmanKarate", true) == 1 then
						if LocalPlayer.Backpack:FindFirstChild("Sharkman Karate") and (LocalPlayer.Backpack:FindFirstChild("Sharkman Karate")).Level.Value >= 400 or Character:FindFirstChild("Sharkman Karate") and (Character:FindFirstChild("Sharkman Karate")).Level.Value >= 400 then
							Remotes.CommF_:InvokeServer("BuyElectricClaw");
						end;
					else
						WindUI:Notify({
							Title = "Notification",
							Content = "Not Have Sharkman Karate",
							Icon = "bell",
							Duration = 5
						});
					end;
					if Remotes.CommF_:InvokeServer("BuyElectricClaw", true) == 1 then
						if LocalPlayer.Backpack:FindFirstChild("Electric Claw") and (LocalPlayer.Backpack:FindFirstChild("Electric Claw")).Level.Value >= 400 or Character:FindFirstChild("Electric Claw") and (Character:FindFirstChild("Electric Claw")).Level.Value >= 400 then
							Remotes.CommF_:InvokeServer("BuyDragonTalon");
						end;
					else
						WindUI:Notify({
							Title = "Notification",
							Content = "Not Have Electric Claw",
							Icon = "bell",
							Duration = 5
						});
					end;
					if Remotes.CommF_:InvokeServer("BuyDragonTalon", true) == 1 then
						if LocalPlayer.Backpack:FindFirstChild("Dragon Talon") and (LocalPlayer.Backpack:FindFirstChild("Dragon Talon")).Level.Value >= 400 or Character:FindFirstChild("Dragon Talon") and (Character:FindFirstChild("Dragon Talon")).Level.Value >= 400 then
							if string.find(Remotes.CommF_:InvokeServer("BuyGodhuman", true), "Bring") then
								WindUI:Notify({
									Title = "Notification",
									Content = "Not Have Enough Material",
									Icon = "bell",
									Duration = 5
								});
							else
								Remotes.CommF_:InvokeServer("BuyGodhuman");
							end;
						end;
					else
						WindUI:Notify({
							Title = "Notification",
							Content = "Not Have Dragon Talon",
							Icon = "bell",
							Duration = 5
						});
					end;
				else
					Remotes.CommF_:InvokeServer("BuySuperhuman");
				end;
			end);
		end;
	end;
end);
spawn(function()
	while wait() do
		wait(0.2);
		if _G.AutoDragonTalon then
			if LocalPlayer.Backpack:FindFirstChild("Dragon Claw") or Character:FindFirstChild("Dragon Claw") or LocalPlayer.Backpack:FindFirstChild("Dragon Talon") or Character:FindFirstChild("Dragon Talon") then
				if LocalPlayer.Backpack:FindFirstChild("Dragon Claw") and (LocalPlayer.Backpack:FindFirstChild("Dragon Claw")).Level.Value >= 400 then
					Remotes.CommF_:InvokeServer("BuyDragonTalon");
					_G.SelectedWeapon = "Dragon Talon";
				end;
				if Character:FindFirstChild("Dragon Claw") and (Character:FindFirstChild("Dragon Claw")).Level.Value >= 400 then
					Remotes.CommF_:InvokeServer("BuyDragonTalon");
					_G.SelectedWeapon = "Dragon Talon";
				end;
				if LocalPlayer.Backpack:FindFirstChild("Dragon Claw") and (LocalPlayer.Backpack:FindFirstChild("Dragon Claw")).Level.Value <= 399 then
					_G.SelectedWeapon = "Dragon Claw";
				end;
			else
				Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "2");
			end;
		end;
	end;
end);
spawn(function()
	pcall(function()
		while wait() do
			wait(0.2);
			if _G.AutoFishmanKarate then
				Remotes.CommF_:InvokeServer("BuyFishmanKarate");
				if string.find(Remotes.CommF_:InvokeServer("BuySharkmanKarate"), "keys") then
					if Character:FindFirstChild("Water Key") or LocalPlayer.Backpack:FindFirstChild("Water Key") then
						TweenPlayer(CFrame.new(-2604.6958, 239.432526, -10315.1982, 0.0425701365, 0, -0.999093413, 0, 1, 0, 0.999093413, 0, 0.0425701365));
						Remotes.CommF_:InvokeServer("BuySharkmanKarate");
					elseif Character:FindFirstChild("Fishman Karate") and (Character:FindFirstChild("Fishman Karate")).Level.Value >= 400 then
					else
						if Enemies:FindFirstChild("Tide Keeper") then
							for i, v in pairs(Enemies:GetChildren()) do
								if v.Name == "Tide Keeper" then
									repeat
										RunService.Heartbeat:wait();
										AutoHaki();
										EquipWeapon(_G.SelectedWeapon);
										v.Humanoid.WalkSpeed = 0;
										v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
										TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
										Attack();
									until not v.Parent or v.Humanoid.Health <= 0 or _G.AutoFishmanKarate == false or Character:FindFirstChild("Water Key") or LocalPlayer.Backpack:FindFirstChild("Water Key");
								end;
							end;
						else
							TweenPlayer(CFrame.new(-3570.18652, 123.328949, -11555.9072, 0.465199202, -0.000000013857326, 0.885206044, 0.0000000040332897, 1, 0.0000000135347511, -0.885206044, -0.00000000272606271, 0.465199202));
							wait(3);
						end;
					end;
				else
					Remotes.CommF_:InvokeServer("BuySharkmanKarate");
				end;
			end;
		end;
	end);
end);
spawn(function()
	pcall(function()
		while wait() do
			wait(0.2);
			if _G.AutoElectricClaw then
				if LocalPlayer.Backpack:FindFirstChild("Electro") or Character:FindFirstChild("Electro") or LocalPlayer.Backpack:FindFirstChild("Electric Claw") or Character:FindFirstChild("Electric Claw") then
					if LocalPlayer.Backpack:FindFirstChild("Electro") and (LocalPlayer.Backpack:FindFirstChild("Electro")).Level.Value >= 400 then
						Remotes.CommF_:InvokeServer("BuyElectricClaw");
						_G.SelectedWeapon = "Electric Claw";
					end;
					if Character:FindFirstChild("Electro") and (Character:FindFirstChild("Electro")).Level.Value >= 400 then
						Remotes.CommF_:InvokeServer("BuyElectricClaw");
						_G.SelectedWeapon = "Electric Claw";
					end;
					if LocalPlayer.Backpack:FindFirstChild("Electro") and (LocalPlayer.Backpack:FindFirstChild("Electro")).Level.Value <= 399 then
						_G.SelectedWeapon = "Electro";
					end;
				else
					Remotes.CommF_:InvokeServer("BuyElectro");
				end;
			end;
			if _G.AutoElectricClaw then
				if LocalPlayer.Backpack:FindFirstChild("Electro") or Character:FindFirstChild("Electro") then
					if LocalPlayer.Backpack:FindFirstChild("Electro") or Character:FindFirstChild("Electro") and (LocalPlayer.Backpack:FindFirstChild("Electro")).Level.Value >= 400 or (Character:FindFirstChild("Electro")).Level.Value >= 400 then
						if _G.AutoFarmLevel == false then
							repeat
								RunService.Heartbeat:wait();
								TweenPlayer(CFrame.new(-10371.4717, 330.764496, -10131.4199));
							until not _G.AutoElectricClaw or (HumanoidRootPart.Position - (CFrame.new((-10371.4717), 330.764496, (-10131.4199))).Position).Magnitude <= 10;
							Remotes.CommF_:InvokeServer("BuyElectricClaw", "Start");
							wait(2);
							repeat
								task.wait();
								TweenPlayer(CFrame.new(-12550.532226563, 336.22631835938, -7510.4233398438));
							until not _G.AutoElectricClaw or (HumanoidRootPart.Position - (CFrame.new((-12550.532226563), 336.22631835938, (-7510.4233398438))).Position).Magnitude <= 10;
							wait(1);
							repeat
								task.wait();
								TweenPlayer(CFrame.new(-10371.4717, 330.764496, -10131.4199));
							until not _G.AutoElectricClaw or (HumanoidRootPart.Position - (CFrame.new((-10371.4717), 330.764496, (-10131.4199))).Position).Magnitude <= 10;
							wait(1);
							Remotes.CommF_:InvokeServer("BuyElectricClaw");
						elseif _G.AutoFarmLevel == true then
							_G.AutoFarmLevel = false;
							wait(1);
							repeat
								task.wait();
								TweenPlayer(CFrame.new(-10371.4717, 330.764496, -10131.4199));
							until not _G.AutoElectricClaw or (HumanoidRootPart.Position - (CFrame.new((-10371.4717), 330.764496, (-10131.4199))).Position).Magnitude <= 10;
							Remotes.CommF_:InvokeServer("BuyElectricClaw", "Start");
							wait(2);
							repeat
								task.wait();
								TweenPlayer(CFrame.new(-12550.532226563, 336.22631835938, -7510.4233398438));
							until not _G.AutoElectricClaw or (HumanoidRootPart.Position - (CFrame.new((-12550.532226563), 336.22631835938, (-7510.4233398438))).Position).Magnitude <= 10;
							wait(1);
							repeat
								task.wait();
								TweenPlayer(CFrame.new(-10371.4717, 330.764496, -10131.4199));
							until not _G.AutoElectricClaw or (HumanoidRootPart.Position - (CFrame.new((-10371.4717), 330.764496, (-10131.4199))).Position).Magnitude <= 10;
							wait(1);
							Remotes.CommF_:InvokeServer("BuyElectricClaw");
							_G.SelectedWeapon = "Electric Claw";
							wait(0.1);
							_G.AutoFarmLevel = true;
						end;
					end;
				end;
			end;
		end;
	end);
end);
spawn(function()
	while wait() do
		wait(0.2);
		if _G.AutoDeathStep then
			if LocalPlayer.Backpack:FindFirstChild("Black Leg") or Character:FindFirstChild("Black Leg") or LocalPlayer.Backpack:FindFirstChild("Death Step") or Character:FindFirstChild("Death Step") then
				if LocalPlayer.Backpack:FindFirstChild("Black Leg") and (LocalPlayer.Backpack:FindFirstChild("Black Leg")).Level.Value >= 450 then
					Remotes.CommF_:InvokeServer("BuyDeathStep");
					_G.SelectedWeapon = "Death Step";
				end;
				if Character:FindFirstChild("Black Leg") and (Character:FindFirstChild("Black Leg")).Level.Value >= 450 then
					Remotes.CommF_:InvokeServer("BuyDeathStep");
					_G.SelectedWeapon = "Death Step";
				end;
				if LocalPlayer.Backpack:FindFirstChild("Black Leg") and (LocalPlayer.Backpack:FindFirstChild("Black Leg")).Level.Value <= 449 then
					_G.SelectedWeapon = "Black Leg";
				end;
			else
				Remotes.CommF_:InvokeServer("BuyBlackLeg");
			end;
		end;
	end;
end);
spawn(function()
	pcall(function()
		while wait() do
			wait(0.2);
			if _G.AutoSuperHuman then
				if LocalPlayer.Backpack:FindFirstChild("Combat") or Character:FindFirstChild("Combat") and LocalPlayer.Data.Beli.Value >= 150000 then
					UnEquipWeapon("Combat");
					wait(0.1);
					Remotes.CommF_:InvokeServer("BuyBlackLeg");
				end;
				if Character:FindFirstChild("Superhuman") or LocalPlayer.Backpack:FindFirstChild("Superhuman") then
					_G.SelectedWeapon = "Superhuman";
				end;
				if LocalPlayer.Backpack:FindFirstChild("Black Leg") or Character:FindFirstChild("Black Leg") or LocalPlayer.Backpack:FindFirstChild("Electro") or Character:FindFirstChild("Electro") or LocalPlayer.Backpack:FindFirstChild("Fishman Karate") or Character:FindFirstChild("Fishman Karate") or LocalPlayer.Backpack:FindFirstChild("Dragon Claw") or Character:FindFirstChild("Dragon Claw") then
					if LocalPlayer.Backpack:FindFirstChild("Black Leg") and (LocalPlayer.Backpack:FindFirstChild("Black Leg")).Level.Value <= 299 then
						_G.SelectedWeapon = "Black Leg";
					end;
					if LocalPlayer.Backpack:FindFirstChild("Electro") and (LocalPlayer.Backpack:FindFirstChild("Electro")).Level.Value <= 299 then
						_G.SelectedWeapon = "Electro";
					end;
					if LocalPlayer.Backpack:FindFirstChild("Fishman Karate") and (LocalPlayer.Backpack:FindFirstChild("Fishman Karate")).Level.Value <= 299 then
						_G.SelectedWeapon = "Fishman Karate";
					end;
					if LocalPlayer.Backpack:FindFirstChild("Dragon Claw") and (LocalPlayer.Backpack:FindFirstChild("Dragon Claw")).Level.Value <= 299 then
						_G.SelectedWeapon = "Dragon Claw";
					end;
					if LocalPlayer.Backpack:FindFirstChild("Black Leg") and (LocalPlayer.Backpack:FindFirstChild("Black Leg")).Level.Value >= 300 and LocalPlayer.Data.Beli.Value >= 300000 then
						UnEquipWeapon("Black Leg");
						wait(0.1);
						Remotes.CommF_:InvokeServer("BuyElectro");
					end;
					if Character:FindFirstChild("Black Leg") and (Character:FindFirstChild("Black Leg")).Level.Value >= 300 and LocalPlayer.Data.Beli.Value >= 300000 then
						UnEquipWeapon("Black Leg");
						wait(0.1);
						Remotes.CommF_:InvokeServer("BuyElectro");
					end;
					if LocalPlayer.Backpack:FindFirstChild("Electro") and (LocalPlayer.Backpack:FindFirstChild("Electro")).Level.Value >= 300 and LocalPlayer.Data.Beli.Value >= 750000 then
						UnEquipWeapon("Electro");
						wait(0.1);
						Remotes.CommF_:InvokeServer("BuyFishmanKarate");
					end;
					if Character:FindFirstChild("Electro") and (Character:FindFirstChild("Electro")).Level.Value >= 300 and LocalPlayer.Data.Beli.Value >= 750000 then
						UnEquipWeapon("Electro");
						wait(0.1);
						Remotes.CommF_:InvokeServer("BuyFishmanKarate");
					end;
					if LocalPlayer.Backpack:FindFirstChild("Fishman Karate") and (LocalPlayer.Backpack:FindFirstChild("Fishman Karate")).Level.Value >= 300 and LocalPlayer.Data.Fragments.Value >= 1500 then
						UnEquipWeapon("Fishman Karate");
						wait(0.1);
						Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "1");
						Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "2");
					end;
					if Character:FindFirstChild("Fishman Karate") and (Character:FindFirstChild("Fishman Karate")).Level.Value >= 300 and LocalPlayer.Data.Fragments.Value >= 1500 then
						UnEquipWeapon("Fishman Karate");
						wait(0.1);
						Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "1");
						Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "2");
					end;
					if LocalPlayer.Backpack:FindFirstChild("Dragon Claw") and (LocalPlayer.Backpack:FindFirstChild("Dragon Claw")).Level.Value >= 300 and LocalPlayer.Data.Beli.Value >= 3000000 then
						UnEquipWeapon("Dragon Claw");
						wait(0.1);
						Remotes.CommF_:InvokeServer("BuySuperhuman");
					end;
					if Character:FindFirstChild("Dragon Claw") and (Character:FindFirstChild("Dragon Claw")).Level.Value >= 300 and LocalPlayer.Data.Beli.Value >= 3000000 then
						UnEquipWeapon("Dragon Claw");
						wait(0.1);
						Remotes.CommF_:InvokeServer("BuySuperhuman");
					end;
				end;
			end;
		end;
	end);
end);
GunSwordSection = Tabs.ItemsTab:Section({
	Title = "Gun & Sword",
	TextXAlignment = "Left"
});
AutoGetSaberToggle = GunSwordSection:Toggle({
	Title = "Auto Get Saber",
	Desc = "Function Sea 1 Only",
	Value = false,
	Callback = function(state)
		_G.AutoSaber = state;
		StopTween(_G.AutoSaber);
	end
});
Config:Register("AutoGetSaberToggle", AutoGetSaberToggle);
spawn(function()
	while wait() do
		wait(0.2);
		if _G.AutoSaber and World1 and LocalPlayer.Data.Level.Value >= 200 then
			pcall(function()
				if Workspace.Map.Jungle.Final.Part.Transparency == 0 then
					if Workspace.Map.Jungle.QuestPlates.Door.Transparency == 0 then
						if ((CFrame.new((-1612.55884), 36.9774132, 148.719543, 0.37091279, 0.0000000030717151, (-0.928667724), 0.0000000397099491, 1, 0.0000000191679348, 0.928667724, (-0.0000000439869794), 0.37091279)).Position - HumanoidRootPart.Position).Magnitude <= 100 then
							TweenPlayer(HumanoidRootPart.CFrame);
							wait(1);
							HumanoidRootPart.CFrame = Workspace.Map.Jungle.QuestPlates.Plate1.Button.CFrame;
							wait(1);
							HumanoidRootPart.CFrame = Workspace.Map.Jungle.QuestPlates.Plate2.Button.CFrame;
							wait(1);
							HumanoidRootPart.CFrame = Workspace.Map.Jungle.QuestPlates.Plate3.Button.CFrame;
							wait(1);
							HumanoidRootPart.CFrame = Workspace.Map.Jungle.QuestPlates.Plate4.Button.CFrame;
							wait(1);
							HumanoidRootPart.CFrame = Workspace.Map.Jungle.QuestPlates.Plate5.Button.CFrame;
							wait(1);
						else
							TweenPlayer(CFrame.new(-1612.55884, 36.9774132, 148.719543, 0.37091279, 0.0000000030717151, -0.928667724, 0.0000000397099491, 1, 0.0000000191679348, 0.928667724, -0.0000000439869794, 0.37091279));
						end;
					elseif Workspace.Map.Desert.Burn.Part.Transparency == 0 then
						if LocalPlayer.Backpack:FindFirstChild("Torch") or Character:FindFirstChild("Torch") then
							EquipWeapon("Torch");
							TweenPlayer(CFrame.new(1114.61475, 5.04679728, 4350.22803, -0.648466587, -0.00000000128799094, 0.761243105, -0.000000000570652914, 1, 0.00000000120584542, -0.761243105, 0.000000000347544882, -0.648466587));
						else
							TweenPlayer(CFrame.new(-1610.00757, 11.5049858, 164.001587, 0.984807551, -0.167722285, -0.0449818149, 0.17364943, 0.951244235, 0.254912198, 0.0000342372805, -0.258850515, 0.965917408));
						end;
					elseif Remotes.CommF_:InvokeServer("ProQuestProgress", "SickMan") ~= 0 then
						Remotes.CommF_:InvokeServer("ProQuestProgress", "GetCup");
						wait(0.5);
						EquipWeapon("Cup");
						wait(0.5);
						Remotes.CommF_:InvokeServer("ProQuestProgress", "FillCup", Character.Cup);
						wait(0);
						Remotes.CommF_:InvokeServer("ProQuestProgress", "SickMan");
					elseif Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon") == nil then
						Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon");
					elseif Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon") == 0 then
						if Enemies:FindFirstChild("Mob Leader") or ReplicatedStorage:FindFirstChild("Mob Leader") then
							TweenPlayer(CFrame.new(-2967.59521, -4.91089821, 5328.70703, 0.342208564, -0.0227849055, 0.939347804, 0.0251603816, 0.999569714, 0.0150796166, -0.939287126, 0.0184739735, 0.342634559));
							for i, v in pairs(Enemies:GetChildren()) do
								if v.Name == "Mob Leader" then
									if Enemies:FindFirstChild("Mob Leader [Lv. 120] [Boss]") then
										if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
											repeat
												RunService.Heartbeat:wait();
												AutoHaki();
												EquipWeapon(_G.SelectedWeapon);
												v.Humanoid.WalkSpeed = 0;
												v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
												TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
												Attack();
											until v.Humanoid.Health <= 0 or (not _G.AutoSaber);
										end;
									end;
									if ReplicatedStorage:FindFirstChild("Mob Leader") then
										TweenPlayer((ReplicatedStorage:FindFirstChild("Mob Leader")).HumanoidRootPart.CFrame * Pos);
									end;
								end;
							end;
						end;
					elseif Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon") == 1 then
						Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon");
						wait(0.5);
						EquipWeapon("Relic");
						wait(0.5);
						TweenPlayer(CFrame.new(-1404.91504, 29.9773273, 3.80598116, 0.876514494, 0.00000000566906877, 0.481375456, 0.0000000253851997, 1, -0.0000000579995607, -0.481375456, 0.0000000630572643, 0.876514494));
					end;
				elseif Enemies:FindFirstChild("Saber Expert") or ReplicatedStorage:FindFirstChild("Saber Expert") then
					for i, v in pairs(Enemies:GetChildren()) do
						if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
							if v.Name == "Saber Expert" then
								repeat
									RunService.Heartbeat:wait();
									EquipWeapon(_G.SelectedWeapon);
									TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
									v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
									v.HumanoidRootPart.Transparency = 1;
									v.Humanoid.JumpPower = 0;
									v.Humanoid.WalkSpeed = 0;
									PosMon = v.HumanoidRootPart.CFrame;
									MonFarm = v.Name;
									Attack();
								until v.Humanoid.Health <= 0 or (not _G.AutoSaber);
								if v.Humanoid.Health <= 0 then
									Remotes.CommF_:InvokeServer("ProQuestProgress", "PlaceRelic");
								end;
							end;
						end;
					end;
				end;
			end);
		end;
	end;
end);
AutoBuddySwordToggle = GunSwordSection:Toggle({
	Title = "Auto Buddy Sword",
	Desc = "Function Sea 3 Only",
	Value = false,
	Callback = function(state)
		_G.AutoBuddySword = state;
		StopTween(_G.AutoBuddySword);
	end
});
Config:Register("AutoBuddySwordToggle", AutoBuddySwordToggle);
spawn(function()
	while wait() do
		wait(0.2);
		if _G.AutoBuddySword and World3 then
			pcall(function()
				if Enemies:FindFirstChild("Cake Queen") then
					for i, v in pairs(Enemies:GetChildren()) do
						if v.Name == "Cake Queen" then
							if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
								repeat
									RunService.Heartbeat:wait();
									AutoHaki();
									EquipWeapon(_G.SelectedWeapon);
									v.Humanoid.WalkSpeed = 0;
									v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
									TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
									Attack();
								until not _G.AutoBuddySword or (not v.Parent) or v.Humanoid.Health <= 0;
							end;
						end;
					end;
				else
					UnEquipWeapon(_G.SelectedWeapon);
					TweenPlayer(CFrame.new(-731.2034301757812, 381.5658874511719, -11198.4951171875));
				end;
			end);
		end;
	end;
end);
function CheckItemCount(itemName, itemCount)
	for i, v in next, ReplicatedStorage.Remotes.CommF_:InvokeServer("getInventory") do
		if v.Name == itemName and v.Count >= itemCount then
			return true;
		end;
	end;
	return false;
end;
function DetectChest()
	local dist = math.huge;
	local name;
	for k, v in pairs(Workspace:GetChildren()) do
		if string.match(v.Name, "Chest") then
			local magnitude = (v.Position - HumanoidRootPart.Position).magnitude;
			if magnitude < dist then
				dist = magnitude;
				name = v;
			end;
		end;
	end;
	if not name then
		for i, v in next, Workspace.Map:GetDescendants() do
			if v:IsA("Part") and string.find(v.Name, "Chest") then
				local magnitude = (v.Position - HumanoidRootPart.Position).magnitude;
				if magnitude < dist then
					dist = magnitude;
					name = v;
				end;
			end;
		end;
	end;
	return name;
end;
local MobBlacklist = {};
function DetectPartSpawnMob(name)
	local name1;
	if string.find(name, "Lv.") then
		name1 = name:gsub(" %pLv. %d+%p", "");
	end;
	for i, v in pairs(Workspace._WorldOrigin.EnemySpawns:GetChildren()) do
		local stringgsub;
		if string.find(v.Name, "Lv.") then
			stringgsub = v.Name:gsub(" %pLv. %d+%p", "");
		end;
		if v:IsA("Part") and (stringgsub and stringgsub == name or name == v.Name or name1 and v.Name == name1) then
			return v;
		end;
	end;
	for i, v in pairs(getnilinstances()) do
		local stringgsub;
		if string.find(v.Name, "Lv.") then
			stringgsub = v.Name:gsub(" %pLv. %d+%p", "");
		end;
		if v:IsA("Part") and (stringgsub and stringgsub == name or name == v.Name or name1 and v.Name == name1) then
			return v;
		end;
	end;
end;
function TeleportSpawnMob(Path, value)
	if typeof(Path) == "table" then
		if #MobBlacklist >= 4 then
			MobBlacklist = {};
			return;
		end;
		local GetPart;
		for i, v in next, Path do
			if not table.find(MobBlacklist, v) then
				GetPart = DetectPartSpawnMob(v);
				repeat
					task.wait();
					TweenPlayer(GetPart.CFrame * CFrame.new(0, 60, 0));
				until (GetPart.Position - plr.HumanoidRootPart.Position).Magnitude <= 100 or DetectMob(Path) or (not value);
			end;
		end;
	else
		GetPart = DetectPartSpawnMob(Path);
		TweenPlayer(GetPart.CFrame * CFrame.new(0, 60, 0));
	end;
end;
function DetectMob(c)
	local dist = math.huge;
	local name;
	for i, v in pairs(Enemies:GetChildren()) do
		local stringgsub = v.Name:gsub(" %pLv. %d+%p", "");
		if (typeof(c) == "table" and (table.find(c, v.Name) or table.find(c, stringgsub)) or (v.Name == c or c == stringgsub)) and v:IsA("Model") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and v:FindFirstChild("HumanoidRootPart") then
			local magnitude = (v.HumanoidRootPart.Position - HumanoidRootPart.Position).magnitude;
			if magnitude < dist then
				dist = magnitude;
				name = v;
			end;
		end;
	end;
	return name;
end;
function DetectRequestSoulGuitar()
	local Mob = {};
	local PlaceId;
	local NameRemote;
	if not CheckItemCount("Ectoplasm", 250) then
		Mob = {
			"Ship Deckhand [Lv. 1250]",
			"Ship Steward [Lv. 1300]",
			"Ship Officer [Lv. 1325]",
			"Ship Engineer [Lv. 1275]"
		};
		PlaceId = 4442272183;
		NameRemote = "TravelDressrosa";
	elseif not CheckItemCount("Bones", 500) then
		Mob = {
			"Reborn Skeleton [Lv. 1975]",
			"Demonic Soul [Lv. 2025]",
			"Living Zombie [Lv. 2000]",
			"Posessed Mummy [Lv. 2050]"
		};
		PlaceId = 7449423635;
		NameRemote = "TravelZou";
	end;
	return Mob, PlaceId, NameRemote;
end;
local CommF = Remotes.CommF_;
function GuitarPuzzleProgress()
	if not CommF:InvokeServer("GuitarPuzzleProgress", "Check") then
		if game.Lighting.Sky.MoonTextureId == "http://www.roblox.com/asset/?id=9709149431" and (game.Lighting.ClockTime > 16 or game.Lighting.ClockTime < 5) then
			if LocalPlayer:DistanceFromCharacter(Vector3.new(-8654.314453125, 140.9499053955078, 6167.5283203125)) > 50 then
				TweenPlayer(CFrame.new(-8654.314453125, 140.9499053955078, 6167.5283203125));
			end;
			CommF:InvokeServer("gravestoneEvent", 2);
			CommF:InvokeServer("gravestoneEvent", 2, true);
			task.wait(1);
		else
			WindUI:Notify({
				Title = "Notification",
				Content = "Hop Full Moon",
				Icon = "bell",
				Duration = 5
			});
			Hop();
		end;
	else
		if LocalPlayer.PlayerGui.Main.Dialogue.Visible then
			game.VirtualUser:Button1Down(Vector2.new(0, 0));
			game.VirtualUser:Button1Down(Vector2.new(0, 0));
		end;
		if not (CommF:InvokeServer("GuitarPuzzleProgress", "Check")).Swamp then
			if ((CFrame.new((-10171.7607421875), 138.62667846679688, 6008.0654296875)).Position - HumanoidRootPart.Position).Magnitude > 100 then
				toTarget(HumanoidRootPart.Position, (CFrame.new(-10171.7607421875, 138.62667846679688, 6008.0654296875)).Position, CFrame.new(-10171.7607421875, 138.62667846679688 + 20, 6008.0654296875));
			elseif CountZombie() == 6 then
				for i, v in pairs(Enemies:GetChildren()) do
					if v.Name == "Living Zombie [Lv. 2000]" and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
						repeat
							task.wait();
							EquipWeapon(_G.SelectedWeapon);
							AutoHaki();
							v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
							PosMon = v.HumanoidRootPart.CFrame;
							MonFarm = v.Name;
							TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
							Attack();
						until v.Humanoid.Health <= 0 or (not v.Parent);
					end;
				end;
			end;
			return;
		elseif not (CommF:InvokeServer("GuitarPuzzleProgress", "Check")).Gravestones then
			if LocalPlayer:DistanceFromCharacter(Vector3.new(-8761.4765625, 142.10487365722656, 6086.07861328125)) > 50 then
				TweenPlayer(CFrame.new(-8761.4765625, 142.10487365722656, 6086.07861328125));
			else
				local ClickSigns = {
					Workspace.Map["Haunted Castle"].Placard1.Right.ClickDetector,
					Workspace.Map["Haunted Castle"].Placard2.Right.ClickDetector,
					Workspace.Map["Haunted Castle"].Placard3.Left.ClickDetector,
					Workspace.Map["Haunted Castle"].Placard4.Right.ClickDetector,
					Workspace.Map["Haunted Castle"].Placard5.Left.ClickDetector,
					Workspace.Map["Haunted Castle"].Placard6.Left.ClickDetector,
					Workspace.Map["Haunted Castle"].Placard7.Left.ClickDetector
				};
				for i, v in pairs(ClickSigns) do
					fireclickdetector(v);
				end;
			end;
		elseif not (CommF:InvokeServer("GuitarPuzzleProgress", "Check")).Ghost then
			if LocalPlayer:DistanceFromCharacter(Vector3.new(-9755.6591796875, 271.0661315917969, 6290.61474609375)) > 50 then
				TweenPlayer(CFrame.new(-9755.6591796875, 271.0661315917969, 6290.61474609375));
			end;
			CommF:InvokeServer("GuitarPuzzleProgress", "Ghost");
			task.wait(3);
		elseif not (CommF:InvokeServer("GuitarPuzzleProgress", "Check")).Trophies then
			if LocalPlayer:DistanceFromCharacter(Vector3.new(-9530.0126953125, 6.104853630065918, 6054.83349609375)) > 50 then
				TweenPlayer(CFrame.new(-9530.0126953125, 6.104853630065918, 6054.83349609375));
			end;
			local Tablet = Workspace.Map["Haunted Castle"].Tablet;
			for i, v in pairs(BlankTablets) do
				local x = Tablet[v];
				if x.Line.Position.X ~= 0 then
					repeat
						task.wait();
						fireclickdetector(x.ClickDetector);
					until x.Line.Position.X == 0;
				end;
			end;
			for i, v in pairs(Trophy) do
				local x = Workspace.Map["Haunted Castle"].Trophies.Quest[v].Handle.CFrame;
				x = tostring(x);
				x = (x:split(", "))[4];
				local c = "180";
				if x == "1" or x == "-1" then
					c = "90";
				end;
				if not string.find(tostring(Tablet[i].Line.Rotation.Z), c) then
					repeat
						task.wait();
						fireclickdetector(Tablet[i].ClickDetector);
					until string.find(tostring(Tablet[i].Line.Rotation.Z), c);
					print(i, c);
				end;
			end;
		elseif not (CommF:InvokeServer("GuitarPuzzleProgress", "Check")).Pipes then
			for i, v in pairs(Pipes) do
				local x = Workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model[i];
				if x.BrickColor.Name ~= v then
					repeat
						task.wait();
						fireclickdetector(x.ClickDetector);
					until x.BrickColor.Name == v;
				end;
			end;
		end;
	end;
end;
function AutoSoulGuitar()
	if Remotes.CommF_:InvokeServer("soulGuitarBuy", true) == "[You already own this item.]" then
		WindUI:Notify({
			Title = "Notification",
			Content = "You already own this item",
			Icon = "bell",
			Duration = 5
		});
		task.wait(5);
		return;
	end;
	if LocalPlayer.Data.Fragments.Value < 5000 then
		task.wait(2);
		WindUI:Notify({
			Title = "Notification",
			Content = "Need 5000 Fragments",
			Icon = "bell",
			Duration = 5
		});
		return;
	end;
	if not CheckItemCount("Ectoplasm", 250) then
		task.wait(2);
		WindUI:Notify({
			Title = "Notification",
			Content = "Need 250 Ectoplasm",
			Icon = "bell",
			Duration = 5
		});
		return;
	end;
	if CheckItemCount("Dark Fragment", 1) and CheckItemCount("Ectoplasm", 250) and CheckItemCount("Bones", 500) then
		Remotes.CommF_:InvokeServer("soulGuitarBuy", true);
		Remotes.CommF_:InvokeServer("soulGuitarBuy");
		if World3 then
			GuitarPuzzleProgress();
		else
			Remotes.CommF_:InvokeServer("TravelZou");
		end;
		return;
	end;
	if not CheckItemCount("Dark Fragment", 1) then
		if World2 then
			if CheckNameBoss("Darkbeard [Lv. 1000] [Raid Boss]") then
				local v = CheckNameBoss("Darkbeard [Lv. 1000] [Raid Boss]");
				repeat
					task.wait();
					AutoHaki();
					EquipWeapon(_G.SelectedWeapon);
					v.Humanoid.WalkSpeed = 0;
					v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
					TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
					Attack();
				until v.Humanoid.Health <= 0 or (not v.Parent);
			elseif Character:FindFirstChild("Fist of Darkness") or LocalPlayer.Backpack:FindFirstChild("Fist of Darkness") then
				if (Workspace.Map.DarkbeardArena.Summoner.Detection.Position - HumanoidRootPart.Position).Magnitude <= 5 then
					EquipWeapon("Fist of Darkness");
					firetouchinterest(Character["Fist of Darkness"].Handle, Workspace.Map.DarkbeardArena.Summoner.Detection, 0);
					firetouchinterest(Character["Fist of Darkness"].Handle, Workspace.Map.DarkbeardArena.Summoner.Detection, 1);
					firetouchinterest(HumanoidRootPart, Workspace.Map.DarkbeardArena.Summoner.Detection, 0);
					firetouchinterest(HumanoidRootPart, Workspace.Map.DarkbeardArena.Summoner.Detection, 1);
				else
					TweenPlayer(Workspace.Map.DarkbeardArena.Summoner.Detection.CFrame);
				end;
			else
				local v = DetectChest();
				repeat
					task.wait();
					if (HumanoidRootPart.Position - v.Position).Magnitude <= 2 then
						firetouchinterest(v, HumanoidRootPart, 0);
						firetouchinterest(v, HumanoidRootPart, 1);
					end;
					if (HumanoidRootPart.Position - v.Position).Magnitude <= 5 then
						sendKeyEvent("W")
					end;
					InstantTp(v.CFrame * CFrame.new(0, 1, 0));
				until not v or (not v.Parent) or (not _G.AutoSoulGuitar);
			end;
		else
			Remotes.CommF_:InvokeServer("TravelDressrosa");
		end;
	else
		local Mob, PlaceId, NameRemote = DetectRequestSoulGuitar();
		if game.PlaceId == PlaceId then
			if not DetectMob(Mob) then
				TeleportSpawnMob(Mob, _G.AutoSoulGuitar);
			else
				local v = DetectMob(Mob);
				repeat
					task.wait();
					EquipWeapon(_G.SelectedWeapon);
					AutoHaki();
					v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
					PosMon = v.HumanoidRootPart.CFrame;
					MonFarm = v.Name;
					TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
					Attack();
				until not v or (not v.Parent) or v.Humanoid.Health <= 0 or (not _G.AutoSoulGuitar);
			end;
		else
			Remotes.CommF_:InvokeServer(NameRemote);
		end;
	end;
end;
AutoSoulGuitarToggle = GunSwordSection:Toggle({
	Title = "Auto Soul Guitar",
	Desc = "Function Sea 3 Only",
	Value = false,
	Callback = function(state)
		_G.AutoSoulGuitar = state;
		StopTween(_G.AutoSoulGuitar);
	end
});
Config:Register("AutoSoulGuitarToggle", AutoSoulGuitarToggle);
spawn(function()
	while wait() do
		wait(0.2);
		pcall(function()
			if _G.AutoSoulGuitar then
				AutoSoulGuitar();
			end;
		end);
	end;
end);
AutoRengokuToggle = GunSwordSection:Toggle({
	Title = "Auto Rengoku",
	Desc = "Function Sea 2 Only",
	Value = false,
	Callback = function(state)
		_G.AutoRengoku = state;
		StopTween(_G.AutoRengoku);
	end
});
Config:Register("AutoRengokuToggle", AutoRengokuToggle);
spawn(function()
	pcall(function()
		while wait() do
			wait(0.2);
			if _G.AutoRengoku and World2 then
				if LocalPlayer.Backpack:FindFirstChild("Hidden Key") or Character:FindFirstChild("Hidden Key") then
					EquipWeapon("Hidden Key");
					TweenPlayer(CFrame.new(6571.1201171875, 299.23028564453, -6967.841796875));
				elseif Enemies:FindFirstChild("Snow Lurker") or Enemies:FindFirstChild("Arctic Warrior") then
					for i, v in pairs(Enemies:GetChildren()) do
						if (v.Name == "Snow Lurker" or v.Name == "Arctic Warrior") and v.Humanoid.Health > 0 then
							repeat
								RunService.Heartbeat:wait();
								EquipWeapon(_G.SelectedWeapon);
								AutoHaki();
								v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
								PosMon = v.HumanoidRootPart.CFrame;
								MonFarm = v.Name;
								TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
								Attack();
							until LocalPlayer.Backpack:FindFirstChild("Hidden Key") or _G.AutoRengoku == false or (not v.Parent) or v.Humanoid.Health <= 0;
						end;
					end;
				else
					TweenPlayer(CFrame.new(5439.716796875, 84.420944213867, -6715.1635742188));
				end;
			end;
		end;
	end);
end);
AutoHallowScytheToggle = GunSwordSection:Toggle({
	Title = "Auto Hallow Scythe",
	Desc = "Function Sea 3 Only",
	Value = false,
	Callback = function(state)
		_G.AutoHallowScythe = state;
		StopTween(_G.AutoHallowScythe);
	end
});
Config:Register("AutoHallowScytheToggle", AutoHallowScytheToggle);
AutoWardenSwordToggle = GunSwordSection:Toggle({
	Title = "Auto Warden Sword",
	Desc = "Function Sea 1 Only",
	Value = false,
	Callback = function(state)
		_G.AutoWardenSword = state;
		StopTween(_G.AutoWardenSword);
	end
});
Config:Register("AutoWardenSwordToggle", AutoWardenSwordToggle);
AutoGetYamaToggle = GunSwordSection:Toggle({
	Title = "Auto Get Yama",
	Desc = "Need 30 Elite Hunter, Function Sea 3 Only",
	Value = false,
	Callback = function(state)
		_G.AutoYama = state;
		StopTween(_G.AutoYama);
	end
});
Config:Register("AutoGetYamaToggle", AutoGetYamaToggle);
AutoGetYamaHopToggle = GunSwordSection:Toggle({
	Title = "Auto Get Yama Hop",
	Desc = "Hop If Elite Hunter Not Spawn",
	Value = false,
	Callback = function(state)
		_G.AutoYamaHop = state;
		StopTween(_G.AutoYamaHop);
	end
});
Config:Register("AutoGetYamaHopToggle", AutoGetYamaHopToggle);
AutoGetTushitaToggle = GunSwordSection:Toggle({
	Title = "Auto Get Tushita",
	Value = false,
	Callback = function(state)
		_G.AutoTushita = state;
		StopTween(_G.AutoTushita);
	end
});
Config:Register("AutoGetTushitaToggle", AutoGetTushitaToggle);
AutoDragonTridentToggle = GunSwordSection:Toggle({
	Title = "Auto Dragon Trident",
	Desc = "Function Sea 2 Only",
	Value = false,
	Callback = function(state)
		_G.AutoDragonTrident = state;
		StopTween(_G.AutoDragonTrident);
	end
});
Config:Register("AutoDragonTridentToggle", AutoDragonTridentToggle);
AutoDragonTridentToggle = GunSwordSection:Toggle({
	Title = "Auto Greybeard",
	Desc = "Function Sea 1 Only",
	Value = false,
	Callback = function(state)
		_G.AutoGreybeard = state;
		StopTween(_G.AutoGreybeard);
	end
});
Config:Register("AutoDragonTridentToggle", AutoDragonTridentToggle);
AutoSharkSawToggle = GunSwordSection:Toggle({
	Title = "Auto Shark Saw",
	Desc = "Function Sea 1 Only",
	Value = false,
	Callback = function(state)
		_G.AutoSharkSaw = state;
		StopTween(_G.AutoSharkSaw);
	end
});
Config:Register("AutoSharkSawToggle", AutoSharkSawToggle);
AutoPoleToggle = GunSwordSection:Toggle({
	Title = "Auto Pole",
	Desc = "Function Sea 1 Only",
	Value = false,
	Callback = function(state)
		_G.AutoPole = state;
		StopTween(_G.AutoPole);
	end
});
Config:Register("AutoPoleToggle", AutoPoleToggle);
AutoDarkDaggerToggle = GunSwordSection:Toggle({
	Title = "Auto Dark Dagger",
	Desc = "Need Spawn Rip Indra, Function Sea 3 Only",
	Value = false,
	Callback = function(state)
		_G.AutoDarkDagger = state;
		StopTween(_G.AutoDarkDagger);
	end
});
Config:Register("AutoDarkDaggerToggle", AutoDarkDaggerToggle);
spawn(function()
	pcall(function()
		while wait() do
			wait(0.2);
			if _G.AutoDarkDagger and World3 then
				if Enemies:FindFirstChild("rip_indra True Form") or Enemies:FindFirstChild("rip_indra") then
					for i, v in pairs(Enemies:GetChildren()) do
						if v.Name == ("rip_indra True Form" or v.Name == "rip_indra") and v.Humanoid.Health > 0 and v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
							repeat
								RunService.Heartbeat:wait();
								AutoHaki();
								EquipWeapon(_G.SelectedWeapon);
								v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
								TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
								Attack();
							until _G.AutoDarkDagger == false or v.Humanoid.Health <= 0;
						end;
					end;
				else
					UnEquipWeapon(_G.SelectedWeapon);
					TweenPlayer(CFrame.new(-5344.822265625, 423.98541259766, -2725.0930175781));
				end;
			end;
		end;
	end);
end);
spawn(function()
	while wait() do
		wait(0.2);
		if _G.AutoPole and World1 then
			pcall(function()
				if Enemies:FindFirstChild("Thunder God") then
					for i, v in pairs(Enemies:GetChildren()) do
						if v.Name == "Thunder God" then
							if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
								repeat
									RunService.Heartbeat:wait();
									AutoHaki();
									EquipWeapon(_G.SelectedWeapon);
									v.Humanoid.WalkSpeed = 0;
									v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
									TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
									Attack();
								until not _G.AutoPole or (not v.Parent) or v.Humanoid.Health <= 0;
							end;
						end;
					end;
				else
					UnEquipWeapon(_G.SelectedWeapon);
					TweenPlayer(CFrame.new(-7748.0185546875, 5606.80615234375, -2305.898681640625));
				end;
			end);
		end;
	end;
end);
spawn(function()
	while wait() do
		wait(0.2);
		if _G.AutoSharkSaw and World1 then
			pcall(function()
				if Enemies:FindFirstChild("The Saw") then
					for i, v in pairs(Enemies:GetChildren()) do
						if v.Name == "The Saw" then
							if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
								repeat
									RunService.Heartbeat:wait();
									AutoHaki();
									EquipWeapon(_G.SelectedWeapon);
									v.Humanoid.WalkSpeed = 0;
									v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
									TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
									Attack();
								until not _G.AutoSharkSaw or (not v.Parent) or v.Humanoid.Health <= 0;
							end;
						end;
					end;
				else
					UnEquipWeapon(_G.SelectedWeapon);
					TweenPlayer(CFrame.new(-690.33081054688, 15.09425163269, 1582.2380371094));
				end;
			end);
		end;
	end;
end);
spawn(function()
	while wait() do
		wait(0.2);
		if _G.AutoGreybeard and World1 then
			pcall(function()
				if Enemies:FindFirstChild("Greybeard") then
					for i, v in pairs(Enemies:GetChildren()) do
						if v.Name == "Greybeard" then
							if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
								repeat
									RunService.Heartbeat:wait();
									AutoHaki();
									EquipWeapon(_G.SelectedWeapon);
									v.Humanoid.WalkSpeed = 0;
									v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
									TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
									Attack();
								until not _G.AutoGreybeard or (not v.Parent) or v.Humanoid.Health <= 0;
							end;
						end;
					end;
				else
					UnEquipWeapon(_G.SelectedWeapon);
					TweenPlayer(CFrame.new(-5023.38330078125, 28.65203285217285, 4332.3818359375));
				end;
			end);
		end;
	end;
end);
spawn(function()
	while wait() do
		wait(0.2);
		if _G.AutoDragonTrident and World2 then
			pcall(function()
				if Enemies:FindFirstChild("Tide Keeper") then
					for i, v in pairs(Enemies:GetChildren()) do
						if v.Name == "Tide Keeper" then
							if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
								repeat
									RunService.Heartbeat:wait();
									AutoHaki();
									EquipWeapon(_G.SelectedWeapon);
									v.Humanoid.WalkSpeed = 0;
									v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
									TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
									Attack();
								until not _G.AutoDragonTrident or (not v.Parent) or v.Humanoid.Health <= 0;
							end;
						end;
					end;
				else
					UnEquipWeapon(_G.SelectedWeapon);
					TweenPlayer(CFrame.new(-3914.830322265625, 123.29389190673828, -11516.8642578125));
				end;
			end);
		end;
	end;
end);
function CheckTorch()
	local a;
	if not Workspace.Map.Turtle.QuestTorches.Torch1.Particles.Main.Enabled then
		a = "1";
	elseif not Workspace.Map.Turtle.QuestTorches.Torch2.Particles.Main.Enabled then
		a = "2";
	elseif not Workspace.Map.Turtle.QuestTorches.Torch3.Particles.Main.Enabled then
		a = "3";
	elseif not Workspace.Map.Turtle.QuestTorches.Torch4.Particles.Main.Enabled then
		a = "4";
	elseif not Workspace.Map.Turtle.QuestTorches.Torch5.Particles.Main.Enabled then
		a = "5";
	end;
	for i, v in next, Workspace.Map.Turtle.QuestTorches:GetChildren() do
		if v:IsA("MeshPart") and string.find(v.Name, a) and (not v.Particles.Main.Enabled) then
			return v;
		end;
	end;
end;
function CheckNameBoss(a)
	for i, v in next, ReplicatedStorage:GetChildren() do
		if v:IsA("Model") and (typeof(a) == "table" and table.find(a, v.Name) or v.Name == a) and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
			return v;
		end;
	end;
	for i, v in next, Enemies:GetChildren() do
		if v:IsA("Model") and (typeof(a) == "table" and table.find(a, v.Name) or v.Name == a) and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
			return v;
		end;
	end;
end;
spawn(function()
	while wait() do
		wait(0.2);
		if _G.AutoTushita and World3 then
			pcall(function()
				if not Workspace.Map.Turtle:FindFirstChild("TushitaGate") then
					if CheckNameBoss("Longma [Lv. 2000] [Boss]") then
						local v = CheckNameBoss("Longma [Lv. 2000] [Boss]");
						repeat
							task.wait();
							AutoHaki();
							EquipWeapon(_G.SelectedWeapon);
							v.Humanoid.WalkSpeed = 0;
							v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
							TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
							Attack();
						until not v or (not v.Parent) or v.Humanoid.Health == 0;
					end;
				elseif CheckNameBoss("rip_indra True Form [Lv. 5000] [Raid Boss]") then
					if not Character:FindFirstChild("Holy Torch") and (not LocalPlayer.Backpack:FindFirstChild("Holy Torch")) then
						TweenPlayer(Workspace.Map.Waterfall.SecretRoom.Room.Door.Door.Hitbox.CFrame);
					else
						EquipWeapon("Holy Torch");
						if CheckTorch() then
							TweenPlayer((CheckTorch()).CFrame);
						end;
					end;
				else
					WindUI:Notify({
						Title = "Notification",
						Content = "Rip Indra Not Spawn",
						Icon = "bell",
						Duration = 5
					});
					task.wait(3);
				end;
			end);
		end;
	end;
end);
spawn(function()
	while wait() do
		wait(0.2);
		if _G.AutoYamaHop and World3 then
			pcall(function()
				if Remotes.CommF_:InvokeServer("EliteHunter", "Progress") < 30 then
					if _G.AutoYama then
						if not ReplicatedStorage:FindFirstChild("Diablo") and (not ReplicatedStorage:FindFirstChild("Deandre")) and (not ReplicatedStorage:FindFirstChild("Urban")) and (not Enemies:FindFirstChild("Diablo")) and (not Enemies:FindFirstChild("Deandre")) and (not Enemies:FindFirstChild("Urban")) then
							Hop();
						end;
					end;
				end;
			end);
		end;
	end;
end);
spawn(function()
	while wait() do
		wait(0.2);
		if _G.AutoYama and World3 then
			if Remotes.CommF_:InvokeServer("EliteHunter", "Progress") >= 30 then
				repeat
					wait(0.1);
					fireclickdetector(Workspace.Map.Waterfall.SealedKatana.Handle.ClickDetector);
				until LocalPlayer.Backpack:FindFirstChild("Yama") or (not _G.AutoYama);
			elseif string.find(QuestTitle, "Diablo") or string.find(QuestTitle, "Deandre") or string.find(QuestTitle, "Urban") then
				if ReplicatedStorage:FindFirstChild("Diablo") and ( ReplicatedStorage:FindFirstChild("Deandre")) and ( ReplicatedStorage:FindFirstChild("Urban")) and ( Enemies:FindFirstChild("Diablo")) and ( Enemies:FindFirstChild("Deandre")) and ( Enemies:FindFirstChild("Urban")) then
					for i, v in pairs(Enemies:GetChildren()) do
						if v.Name == "Diablo" or v.Name == "Deandre" or v.Name == "Urban" then
							if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
								repeat
									RunService.Heartbeat:wait();
									AutoHaki();
									EquipWeapon(_G.SelectedWeapon);
									v.Humanoid.WalkSpeed = 0;
									v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
									TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
									Attack();
								until not _G.AutoYama or v.Humanoid.Health <= 0 or (not v.Parent);
							end;
						end;
					end;
				end;
			else
				Remotes.CommF_:InvokeServer("EliteHunter");
			end;
		end;
	end;
end);
spawn(function()
	while wait() do
		wait(0.2);
		if _G.AutoWardenSword and World1 then
			pcall(function()
				if Enemies:FindFirstChild("Chief Warden") then
					for i, v in pairs(Enemies:GetChildren()) do
						if v.Name == "Chief Warden" then
							if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
								repeat
									RunService.Heartbeat:wait();
									AutoHaki();
									EquipWeapon(_G.SelectedWeapon);
									v.Humanoid.WalkSpeed = 0;
									v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
									TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
									Attack();
								until not _G.AutoWardenSword or (not v.Parent) or v.Humanoid.Health <= 0;
							end;
						end;
					end;
				else
					UnEquipWeapon(_G.SelectedWeapon);
					TweenPlayer(CFrame.new(5186.14697265625, 24.86684226989746, 832.1885375976562));
				end;
			end);
		end;
	end;
end);
spawn(function()
	while wait() do
		wait(0.2);
		if _G.AutoHallowScythe then
			pcall(function()
				if Enemies:FindFirstChild("Soul Reaper") then
					for i, v in pairs(Enemies:GetChildren()) do
						if string.find(v.Name, "Soul Reaper") then
							repeat
								RunService.Heartbeat:wait();
								EquipWeapon(_G.SelectedWeapon);
								AutoHaki();
								v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
								TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
								v.HumanoidRootPart.Transparency = 1;
								Attack();
							until v.Humanoid.Health <= 0 or _G.AutoHallowScythe == false;
						end;
					end;
				elseif LocalPlayer.Backpack:FindFirstChild("Hallow Essence") or Character:FindFirstChild("Hallow Essence") then
					repeat
						TweenPlayer(CFrame.new(-8932.322265625, 146.83154296875, 6062.55078125));
						wait();
					until ((CFrame.new((-8932.322265625), 146.83154296875, 6062.55078125)).Position - HumanoidRootPart.Position).Magnitude <= 8;
					EquipWeapon("Hallow Essence");
				elseif ReplicatedStorage:FindFirstChild("Soul Reaper") then
					TweenPlayer((ReplicatedStorage:FindFirstChild("Soul Reaper")).HumanoidRootPart.CFrame * CFrame.new(2, 20, 2));
				end;
			end);
		end;
	end;
end);
StatsSection = Tabs.StatsTab:Section({
	Title = "Stats",
	TextXAlignment = "Left"
});
StatsPointParagraph = StatsSection:Paragraph({
	Title = "Stats",
	Desc = "0"
});
spawn(function()
	while wait(0.2) do
		pcall(function()
			StatsPointParagraph:SetDesc(tostring(LocalPlayer.Data.Points.Value));
		end);
	end;
end);
AutoAddMeleeStats = StatsSection:Toggle({
	Title = "Add Melee Stats",
	Value = false,
	Callback = function(state)
		_G.AddMeleeStats = state;
	end
});
Config:Register("AutoAddMeleeStats", AutoAddMeleeStats);
AutoAddDefenseStats = StatsSection:Toggle({
	Title = "Add Defense Stats",
	Value = false,
	Callback = function(state)
		_G.AddDefenseStats = state;
	end
});
Config:Register("AutoAddDefenseStats", AutoAddDefenseStats);
AutoAddSwordStats = StatsSection:Toggle({
	Title = "Add Sword Stats",
	Value = false,
	Callback = function(state)
		_G.AddSwordStats = state;
	end
});
Config:Register("AutoAddSwordStats", AutoAddSwordStats);
AutoAddGunStats = StatsSection:Toggle({
	Title = "Add Gun Stats",
	Value = false,
	Callback = function(state)
		_G.AddGunStats = state;
	end
});
Config:Register("AutoAddGunStats", AutoAddGunStats);
AutoAddDevilFruitStats = StatsSection:Toggle({
	Title = "Add Devil Fruit Stats",
	Value = false,
	Callback = function(state)
		_G.AddFruitStats = state;
	end
});
Config:Register("AutoAddDevilFruitStats", AutoAddDevilFruitStats);
StatsPointToAddSlider = StatsSection:Slider({
	Title = "Point",
	Step = 1,
	Value = {
		Min = 1,
		Max = 100,
		Value = 1
	},
	Callback = function(value)
		PointStats = value;
	end
});
StatsPointToAddSlider:Set(1);
Config:Register("StatsPointToAddSlider", StatsPointToAddSlider);
function addStatsPoint(args)
	Remotes.CommF_:InvokeServer("AddPoint", args, PointStats);
end;
spawn(function()
	while wait(0.2) do
		if tonumber(LocalPlayer.Data.Points.Value) >= tonumber(PointStats) then
			if _G.AddMeleeStats then
				addStatsPoint("Melee");
			end;
			if _G.AddDefenseStats then
				addStatsPoint("Defense");
			end;
			if _G.AddSwordStats then
				addStatsPoint("Sword");
			end;
			if _G.AddGunStats then
				addStatsPoint("Gun");
			end;
			if _G.AddFruitStats then
				addStatsPoint("Demon Fruit");
			end;
		end;
	end;
end);
RaidSection = Tabs.RaidTab:Section({
	Title = "Raid",
	TextXAlignment = "Left"
});
TimeRaidParagraph = RaidSection:Paragraph({
	Title = "Raid Time",
	Desc = "N/A"
});
IslandRaidParagraph = RaidSection:Paragraph({
	Title = "Island",
	Desc = "N/A"
});
spawn(function()
	pcall(function()
		while wait(0.2) do
			if LocalPlayer.PlayerGui.Main.TopHUDList.RaidTimer.Visible == true then
				TimeRaidParagraph:SetDesc(LocalPlayer.PlayerGui.Main.TopHUDList.RaidTimer.Text);
			else
				TimeRaidParagraph:SetDesc("Wait For Raid");
			end;
		end;
	end);
end);
spawn(function()
	pcall(function()
		while wait(0.2) do
			if Workspace.Map.RaidMap:FindFirstChild("RaidIsland5") then
				IslandRaidParagraph:SetDesc("🏝️ Island 5");
			elseif Workspace.Map.RaidMap:FindFirstChild("RaidIsland4") then
				IslandRaidParagraph:SetDesc("🏝️ Island 4");
			elseif Workspace.Map.RaidMap:FindFirstChild("RaidIsland3") then
				IslandRaidParagraph:SetDesc("🏝️ Island 3");
			elseif Workspace.Map.RaidMap:FindFirstChild("RaidIsland2") then
				IslandRaidParagraph:SetDesc("🏝️ Island 2");
			elseif Workspace.Map.RaidMap:FindFirstChild("RaidIsland1") then
				IslandRaidParagraph:SetDesc("🏝️ Island 1");
			else
				IslandRaidParagraph:SetDesc("Start Raid");
			end;
		end;
	end);
end);
function getMyIslandRaid(island)
	for i, v in pairs(Workspace._WorldOrigin.Locations:GetChildren()) do
		if v.Name == island and (v.Position - HumanoidRootPart.Position).Magnitude <= 3000 then
			return v;
		end;
	end;
	return nil;
end;
function NextRaidIsland()
	local RaidPos = CFrame.new(0, 35, 0);
	if LocalPlayer.PlayerGui.Main.TopHUDList.RaidTimer.Visible == true then
		if getMyIslandRaid("Island 5") then
			TweenPlayer((getMyIslandRaid("Island 5")).CFrame * RaidPos);
		elseif getMyIslandRaid("Island 4") then
			TweenPlayer((getMyIslandRaid("Island 4")).CFrame * RaidPos);
		elseif getMyIslandRaid("Island 3") then
			TweenPlayer((getMyIslandRaid("Island 3")).CFrame * RaidPos);
		elseif getMyIslandRaid("Island 2") then
			TweenPlayer((getMyIslandRaid("Island 2")).CFrame * RaidPos);
		elseif getMyIslandRaid("Island 1") then
			TweenPlayer((getMyIslandRaid("Island 1")).CFrame * RaidPos);
		end;
	end;
end;
function CheckMonRaids()
	for i, v in pairs(Enemies:GetChildren()) do
		if (v.HumanoidRootPart.Position - HumanoidRootPart.Position).Magnitude <= 500 then
			return v;
		end;
	end;
	return nil;
end;
spawn(function()
	pcall(function()
		while wait() do
			wait(0.2);
			if _G.AutoRaid and (World2 or World3) then
				if LocalPlayer.PlayerGui.Main.TopHUDList.RaidTimer.Visible == true then
					if CheckMonRaids() then
						for i, v in pairs(Enemies:GetChildren()) do
							if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
								if (v.HumanoidRootPart.Position - HumanoidRootPart.Position).Magnitude <= 500 then
									pcall(function()
										repeat
											wait();
											EquipWeapon(_G.SelectedWeapon);
											TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
											AutoHaki();
											Attack();
										until not _G.AutoRaid or (not v.Parent) or v.Humanoid.Health <= 0 or (not Enemies:FindFirstChild(v.Name));
									end);
								else
									NextRaidIsland();
								end;
							end;
						end;
					else
						NextRaidIsland();
					end;
				end;
			end;
		end;
	end);
end);
spawn(function()
	while wait() do
		wait(0.2);
		pcall(function()
			if _G.AutoRaid and (World2 or World3) then
				if LocalPlayer.PlayerGui.Main.TopHUDList.RaidTimer.Visible == false then
					if not Workspace.Map.RaidMap:FindFirstChild("RaidIsland1") and LocalPlayer.Backpack:FindFirstChild("Special Microchip") or Character:FindFirstChild("Special Microchip") then
						if World2 then
							fireclickdetector(Workspace.Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector);
						elseif World3 then
							Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-5083.26025390625, 314.6056823730469, -3175.673095703125));
							fireclickdetector(Workspace.Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector);
						end;
					end;
				end;
			end;
		end);
	end;
end);
Raidslist = {};
RaidsModule = require(ReplicatedStorage.Raids);
task.spawn(function()
	for i, v in pairs(RaidsModule.raids) do
		table.insert(Raidslist, v);
	end;
	for i, v in pairs(RaidsModule.advancedRaids) do
		table.insert(Raidslist, v);
	end;
end);
ChooseChipRaidDropdown = RaidSection:Dropdown({
	Title = "Choose Chip",
	Values = Raidslist,
	Value = nil,
	Callback = function(option)
		_G.SelectedChip = option;
	end
});
Config:Register("ChooseChipRaidDropdown", ChooseChipRaidDropdown);
spawn(function()
	pcall(function()
		while wait() do
			wait(0.2);
			if _G.AutoRaid and (World2 or World3) then
				if not LocalPlayer.Backpack:FindFirstChild("Special Microchip") or (not Character:FindFirstChild("Special Microchip")) then
					if not Workspace._WorldOrigin.Locations:FindFirstChild("Island 1") then
						Remotes.CommF_:InvokeServer("RaidsNpc", "Select", _G.SelectedChip);
					end;
				end;
			end;
		end;
	end);
end);
AutoRaidToggle = RaidSection:Toggle({
	Title = "Auto Raid",
	Desc = "Complete automatically",
	Value = false,
	Callback = function(state)
		_G.AutoRaid = state;
		StopTween(_G.AutoRaid);
	end
});
Config:Register("AutoRaidToggle", AutoRaidToggle);
AutoAwakeningToggle = RaidSection:Toggle({
	Title = "Auto Awaken",
	Value = false,
	Callback = function(state)
		_G.AutoAwaken = state;
	end
});
Config:Register("AutoAwakeningToggle", AutoAwakeningToggle);
spawn(function()
	while wait(0.2) do
		if _G.AutoAwaken then
			pcall(function()
				Remotes.CommF_:InvokeServer("Awakener", "Awaken");
			end);
		end;
	end;
end);
RarityFruits = {
	Common = {
		"Rocket Fruit",
		"Spin Fruit",
		"Blade Fruit",
		"Spring Fruit",
		"Bomb Fruit",
		"Smoke Fruit",
		"Spike Fruit"
	},
	Uncommon = {
		"Flame Fruit",
		"Falcon Fruit",
		"Ice Fruit",
		"Sand Fruit",
		"Diamond Fruit",
		"Dark Fruit"
	},
	Rare = {
		"Light Fruit",
		"Rubber Fruit",
		"Barrier Fruit",
		"Ghost Fruit",
		"Magma Fruit"
	},
	Legendary = {
		"Quake Fruit",
		"Buddha Fruit",
		"Love Fruit",
		"Spider Fruit",
		"Sound Fruit",
		"Phoenix Fruit",
		"Portal Fruit",
		"Rumble Fruit",
		"Pain Fruit",
		"Blizzard Fruit"
	},
	Mythical = {
		"Gravity Fruit",
		"Mammoth Fruit",
		"T-Rex Fruit",
		"Dough Fruit",
		"Shadow Fruit",
		"Venom Fruit",
		"Control Fruit",
		"Gas Fruit",
		"Spirit Fruit",
		"Leopard Fruit",
		"Yeti Fruit",
		"Kitsune Fruit",
		"Dragon Fruit"
	}
};
SelectUnstoreRarityFruits = {
	"Mythical - Common",
	"Legendary - Common",
	"Rare - Common",
	"Uncommon - Common",
	"Common"
};
UnstoreRarityFruitDropdown = RaidSection:Dropdown({
	Title = "Unstore Rarity Fruit",
	Values = SelectUnstoreRarityFruits,
	Value = nil,
	Callback = function(option)
		_G.UnstoreRarityFruit = option;
	end
});
Config:Register("UnstoreRarityFruitDropdown", UnstoreRarityFruitDropdown);
function CheckUnstoreFruits(rarity)
	local result = {};
	for i, v in pairs(RarityFruits) do
		if rarity == "Mythical - Common" then
			if i == "Common" or i == "Uncommon" or i == "Rare" or i == "Legendary" or i == "Mythical" then
				for _, fruit in ipairs(v) do
					table.insert(result, fruit);
				end;
			end;
		elseif rarity == "Legendary - Common" then
			if i == "Uncommon" or i == "Rare" or i == "Legendary" or i == "Common" then
				for _, fruit in ipairs(v) do
					table.insert(result, fruit);
				end;
			end;
		elseif rarity == "Rare - Common" then
			if i == "Rare" or i == "Uncommon" or i == "Common" then
				for _, fruit in ipairs(v) do
					table.insert(result, fruit);
				end;
			end;
		elseif rarity == "Uncommon - Common" then
			if i == "Uncommon" or i == "Common" then
				for _, fruit in ipairs(v) do
					table.insert(result, fruit);
				end;
			end;
		elseif rarity == "Common" then
			if i == "Common" then
				for _, fruit in ipairs(v) do
					table.insert(result, fruit);
				end;
			end;
		end;
	end;
	return result;
end;
AutoUnstoreDevilFruitToggle = RaidSection:Toggle({
	Title = "Auto Unstore Devil Fruit",
	Value = false,
	Callback = function(state)
		_G.UnstoreDevilFruit = state;
	end
});
Config:Register("AutoUnstoreDevilFruitToggle", AutoUnstoreDevilFruitToggle);
function GetFruitsInfo()
	for i, v in pairs(LocalPlayer.Backpack:GetChildren()) do
		if string.find(v.Name, "Fruit") then
			return true;
		end;
	end;
	for i, v in pairs(Character:GetChildren()) do
		if string.find(v.Name, "Fruit") then
			return true;
		end;
	end;
	return false;
end;
spawn(function()
	while wait() do
		wait(0.2);
		pcall(function()
			if _G.UnstoreDevilFruit then
				local inventory = Remotes.CommF_:InvokeServer("getInventory");
				for i, v in pairs(inventory) do
					for z, Res in pairs(CheckUnstoreFruits(_G.UnstoreRarityFruit)) do
						resfruit = string.gsub(Res, " Fruit", "") .. "-" .. string.gsub(Res, " Fruit", "");
						if v.Name == resfruit then
							if not GetFruitsInfo() then
								Remotes.CommF_:InvokeServer("LoadFruit", resfruit);
							end;
						end;
					end;
				end;
			end;
		end);
	end;
end);
TeleportTolabButton = RaidSection:Button({
	Title = "Teleport To Lab",
	Callback = function()
		if World2 then
			TweenPlayer(CFrame.new(-6438.73535, 250.645355, -4501.50684));
		elseif World3 then
			TweenPlayer(CFrame.new(-5017.40869, 314.844055, -2823.0127, -0.925743818, 0.0000000448217499, -0.378151238, 0.00000000455503146, 1, 0.000000107377559, 0.378151238, 0.000000097681621, -0.925743818));
		end;
	end
});
LawRaidSection = Tabs.RaidTab:Section({
	Title = "Law Raid",
	TextXAlignment = "Left"
});
AutoLawRaidToggle = LawRaidSection:Toggle({
	Title = "Auto Law Raid",
	Value = false,
	Callback = function(state)
		_G.LawRaid = value;
		StopTween(_G.LawRaid);
	end
});
Config:Register("AutoLawRaidToggle", AutoLawRaidToggle);
spawn(function()
	pcall(function()
		while wait() do
			wait(0.2);
			if _G.LawRaid then
				if not Character:FindFirstChild("Microchip") and (not LocalPlayer.Backpack:FindFirstChild("Microchip")) and (not Enemies:FindFirstChild("Order")) and (not ReplicatedStorage:FindFirstChild("Order")) then
					wait(0.3);
					Remotes.CommF_:InvokeServer("BlackbeardReward", "Microchip", "1");
					Remotes.CommF_:InvokeServer("BlackbeardReward", "Microchip", "2");
				end;
			end;
		end;
	end);
end);
spawn(function()
	pcall(function()
		while wait() do
			wait(0.2);
			if _G.LawRaid then
				if not Enemies:FindFirstChild("Order") and (not ReplicatedStorage:FindFirstChild("Order")) then
					if Character:FindFirstChild("Microchip") or LocalPlayer.Backpack:FindFirstChild("Microchip") then
						fireclickdetector(Workspace.Map.CircleIsland.RaidSummon.Button.Main.ClickDetector);
					end;
				end;
				if ReplicatedStorage:FindFirstChild("Order") or Enemies:FindFirstChild("Order") then
					if Enemies:FindFirstChild("Order") then
						for i, v in pairs(Enemies:GetChildren()) do
							if v.Name == "Order" then
								repeat
									RunService.Heartbeat:wait();
									AutoHaki();
									EquipWeapon(_G.SelectedWeapon);
									TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
									v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
									Attack();
								until not v.Parent or v.Humanoid.Health <= 0 or _G.LawRaid == false;
							end;
						end;
					elseif ReplicatedStorage:FindFirstChild("Order") then
						TweenPlayer(CFrame.new(-6217.2021484375, 28.047645568848, -5053.1357421875));
					end;
				end;
			end;
		end;
	end);
end);
DungeonSection = Tabs.RaidTab:Section({
	Title = "Dungeon",
	TextXAlignment = "Left"
});
TeleportToHubButton = DungeonSection:Button({
	Title = "Telpeort To Dungeon Hub",
	Callback = function()
		Net:WaitForChild("RF/DungeonNPCFunction"):InvokeServer("TeleportToDungeonHub", false)
	end
})
AutoAttackMonDungeonToggle = DungeonSection:Toggle({
	Title = "Auto Attack Mon",
	Desc = "Auto Attack Nearest",
	Default = false,
	Callback = function(state)
		_G.AutoAttackMonDungeon = state
		StopTween(_G.AutoAttackMonDungeon)
	end
})
function getHighestFloor()
	local highest = 1
	local highestFloor = nil

	for _, v in pairs(workspace.Map.Dungeon:GetChildren()) do
		local num = tonumber(v.Name)
		if num and num > highest then
			highest = num
			highestFloor = v
		end
	end

	return highestFloor
end
function getCurrentFloor()
	local highest = 1

	for _, v in pairs(workspace.Map.Dungeon:GetChildren()) do
		local num = tonumber(v.Name)
		if num and num > highest then
			highest = num
		end
	end

	local targetFloor = tostring(highest - 2)
	return workspace.Map.Dungeon:FindFirstChild(targetFloor)
end
spawn(function()
	while wait() do
		if _G.AutoAttackMonDungeon then
			pcall(function()
				if (HumanoidRootPart.Position - getHighestFloor().Root.Position).Magnitude < 9000 then
					for i, v in pairs(Enemies:GetChildren()) do
						if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
							if not string.find(v.Name, "Blank Buddy") then
								repeat
									RunService.Heartbeat:wait();
									AutoHaki();
									EquipWeapon(_G.SelectedWeapon);
									TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
									v.HumanoidRootPart.Size = Vector3.new(1, 7, 1);
									Attack();
								until v.Humanoid.Health <= 0 or not v.Humanoid or not v.HumanoidRootPart or _G.AutoAttackMonDungeon == false;
							end
						end
					end
				else
					if _G.AutoNextFloor then
						firetouchinterest(getCurrentFloor().ExitTeleporter.Root, HumanoidRootPart, 0);
						firetouchinterest(getCurrentFloor().ExitTeleporter.Root, HumanoidRootPart, 1);
						wait(0.5)
					end
				end
			end)
		end
	end
end)
AutoNextFloorToggle = DungeonSection:Toggle({
	Title = "Auto Next Floor",
	Desc = "Instant Teleport To Highest Floor",
	Default = false,
	Callback = function(state)
		_G.AutoNextFloor = state
	end
})
AutoChooseCardToggle = DungeonSection:Toggle({
	Title = "Auto Choose Card",
	Desc = "Choose Random Card (Coming Soon)",
	Default = false,
	Callback = function(state)
		_G.AutoChooseCard = state
	end
})
function findTextButton(obj)
	for _, v in ipairs(obj:GetDescendants()) do
		if v:IsA("TextButton") then
			return v
		end
	end
	return nil
end
spawn(function()
	while wait() do
		if _G.AutoChooseCard then
			pcall(function()
				for i, v in pairs(LocalPlayer.PlayerGui:GetChildren()) do
					if v.Name == "Gui" and #v:GetChildren() > 0 then
						local btn = findTextButton(v)
						local displayName = v:FindFirstChild('DisplayName').Text
						if string.find(displayName, "Melee") or displayName == "Lifestyle" then
							firesignal(btn.Activated)
						else
							firesignal(btn.Activated)
						end
					end
				end
			end)
		end
	end
end)
RaceTabSection = Tabs.RaceTab:Section({
	Title = "Race",
	TextXAlignment = "Left"
});
local PlaceV4List = {
	"Top Of GreatTree",
	"Timple Of Time",
	"Lever Pull",
	"Acient One"
};
SelectedPlaceDropdown = RaceTabSection:Dropdown({
	Title = "Selected Place",
	Values = PlaceV4List,
	Value = nil,
	Callback = function(value)
		_G.SelectedV4Place = value;
	end
});
Config:Register("SelectedPlaceDropdown", SelectedPlaceDropdown);
TeleportToPlaceToggle = RaceTabSection:Toggle({
	Title = "Teleport To Place",
	Value = false,
	Callback = function(state)
		_G.TeleportToPlace = state;
	end
});
spawn(function()
	while wait() do
		wait(0.2);
		if _G.TeleportToPlace then
			pcall(function()
				if _G.SelectedV4Place == "Top Of GreatTree" then
					TweenPlayer(CFrame.new(2947.556884765625, 2281.630615234375, -7213.54931640625));
				elseif _G.SelectedV4Place == "Timple Of Time" then
					HumanoidRootPart.CFrame = CFrame.new(28286.35546875, 14895.3017578125, 102.62469482421875);
				elseif _G.SelectedV4Place == "Lever Pull" then
					local LeverPullPos = CFrame.new(28575.181640625, 14936.6279296875, 72.31636810302734);
					if (LeverPullPos.Position - HumanoidRootPart.Position).Magnitude >= 1000 then
						HumanoidRootPart.CFrame = CFrame.new(28286.35546875, 14895.3017578125, 102.62469482421875);
					else
						TweenPlayer(LeverPullPos);
					end;
				elseif _G.SelectedV4Place == "Acient One" then
					TweenPlayer(CFrame.new(28981.552734375, 14888.4267578125, -120.245849609375));
				end;
			end);
		end;
	end;
end);
AutoBuyGearToggle = RaceTabSection:Toggle({
	Title = "Auto Buy Gear",
	Value = false,
	Callback = function(state)
		_G.AutoBuyGear = state;
	end
});
Config:Register("AutoBuyGearToggle", AutoBuyGearToggle);
spawn(function()
	pcall(function()
		while wait() do
			if _G.AutoBuyGear then
				local args = {
					[1] = true
				};
				local args = {
					[1] = "UpgradeRace",
					[2] = "Buy"
				};
				Remotes:WaitForChild("CommF_"):InvokeServer(unpack(args));
			end;
		end;
	end);
end);
TweenToMirageIslandToggle = RaceTabSection:Toggle({
	Title = "Tween To Mirage Island",
	Desc = "Tween to highest point",
	Value = false,
	Callback = function(state)
		_G.TweenToHighestMirage = state;
	end
});
Config:Register("TweenToMirageIslandToggle", TweenToMirageIslandToggle);
FindBlueGearToggle = RaceTabSection:Toggle({
	Title = "Find Blue Gear",
	Value = false,
	Callback = function(state)
		_G.FindBlueGear = state;
	end
});
Config:Register("FindBlueGearToggle", FindBlueGearToggle);
spawn(function()
	pcall(function()
		while wait() do
			wait(0.2);
			if _G.FindBlueGear then
				if Workspace.Map:FindFirstChild("MysticIsland") then
					for i, v in pairs(Workspace.Map.MysticIsland:GetChildren()) do
						if v:IsA("MeshPart") then
							if v.Material == Enum.Material.Neon then
								TweenPlayer(v.CFrame);
							end;
						end;
					end;
				end;
			end;
		end;
	end);
end);
LookMoonAbilityToggle = RaceTabSection:Toggle({
	Title = "Look Moon & use Ability",
	Value = false,
	Callback = function(state)
		_G.LookMoonAbility = state;
	end
});
Config:Register("LookMoonAbilityToggle", LookMoonAbilityToggle);
spawn(function()
	while wait() do
		wait(0.2);
		pcall(function()
			if _G.LookMoonAbility then
				wait();
				local moonDir = game.Lighting:GetMoonDirection();
				local lookAtPos = Workspace.CurrentCamera.CFrame.p + moonDir * 100;
				Workspace.CurrentCamera.CFrame = CFrame.lookAt(Workspace.CurrentCamera.CFrame.p, lookAtPos);
			end;
		end);
	end;
end);
AutoTrainToggle = RaceTabSection:Toggle({
	Title = "Auto Train",
	Value = false,
	Callback = function(state)
		_G.AutoTrain = state;
		StopTween(_G.AutoTrain);
	end
});
Config:Register("AutoTrainToggle", AutoTrainToggle);
spawn(function()
	pcall(function()
		while wait() do
			wait(0.2);
			if _G.AutoTrain then
				if Character.RaceTransformed.Value == true then
					StartFarmTrain = false;
					TweenPlayer(CFrame.new(216.211181640625, 126.9352035522461, -12599.0732421875));
				end;
			end;
		end;
	end);
end);
spawn(function()
	while wait() do
		wait(0.2);
		if StartFarmTrain and World3 then
			pcall(function()
				if Enemies:FindFirstChild("Cocoa Warrior") or Enemies:FindFirstChild("Chocolate Bar Battler") or Enemies:FindFirstChild("Sweet Thief") or Enemies:FindFirstChild("Candy Rebel") then
					for i, v in pairs(Enemies:GetChildren()) do
						if v.Name == "Cocoa Warrior" or v.Name == "Chocolate Bar Battler" or v.Name == "Sweet Thief" or v.Name == "Candy Rebel" then
							if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
								repeat
									RunService.Heartbeat:wait();
									AutoHaki();
									EquipWeapon(_G.SelectedWeapon);
									v.Humanoid.WalkSpeed = 0;
									PosMon = v.HumanoidRootPart.CFrame;
									MonFarm = v.Name;
									TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
									Attack();
								until not StartFarmTrain or (not v.Parent) or v.Humanoid.Health <= 0;
							end;
						end;
					end;
				else
					TweenPlayer(CFrame.new(216.211181640625, 126.9352035522461, -12599.0732421875));
				end;
			end);
		end;
	end;
end);
spawn(function()
	pcall(function()
		while wait(0.2) do
			if _G.AutoTrain then
				if Character.RaceTransformed.Value == false then
					StartFarmTrain = true;
				end;
			end;
		end;
	end);
end);
spawn(function()
	while wait() do
		wait(0.2);
		pcall(function()
			if _G.AutoTrain then
				if tonumber((Character:WaitForChild("RaceEnergy")).Value) == 1 then
					if Character.RaceTransformed.Value == false then
						(game:GetService("VirtualInputManager")):SendKeyEvent(true, "Y", false, game);
						wait(0.1);
						(game:GetService("VirtualInputManager")):SendKeyEvent(false, "Y", false, game);
					end;
				end;
			end;
		end);
	end;
end);
TeleportToRaceDoorButton = RaceTabSection:Button({
	Title = "Teleport To Race Door",
	Callback = function()
		HumanoidRootPart.CFrame = CFrame.new(28286.35546875, 14895.3017578125, 102.62469482421875);
		wait(0.1);
		HumanoidRootPart.CFrame = CFrame.new(28286.35546875, 14895.3017578125, 102.62469482421875);
		wait(0.1);
		HumanoidRootPart.CFrame = CFrame.new(28286.35546875, 14895.3017578125, 102.62469482421875);
		wait(0.1);
		HumanoidRootPart.CFrame = CFrame.new(28286.35546875, 14895.3017578125, 102.62469482421875);
		wait(0.5);
		if LocalPlayer.Data.Race.Value == "Human" then
			TweenPlayer(CFrame.new(29221.822265625, 14890.9755859375, -205.99114990234375));
		elseif LocalPlayer.Data.Race.Value == "Skypiea" then
			TweenPlayer(CFrame.new(28960.158203125, 14919.6240234375, 235.03948974609375));
		elseif LocalPlayer.Data.Race.Value == "Fishman" then
			TweenPlayer(CFrame.new(28231.17578125, 14890.9755859375, -211.64173889160156));
		elseif LocalPlayer.Data.Race.Value == "Cyborg" then
			TweenPlayer(CFrame.new(28502.681640625, 14895.9755859375, -423.7279357910156));
		elseif LocalPlayer.Data.Race.Value == "Ghoul" then
			TweenPlayer(CFrame.new(28674.244140625, 14890.6767578125, 445.4310607910156));
		elseif LocalPlayer.Data.Race.Value == "Mink" then
			TweenPlayer(CFrame.new(29012.341796875, 14890.9755859375, -380.1492614746094));
		end;
	end
});
BuyAcientQuestButton = RaceTabSection:Button({
	Title = "Buy Acient Quest",
	Callback = function()
		Remotes.CommF_:InvokeServer("UpgradeRace", "Buy");
	end
});
AutoTrialToggle = RaceTabSection:Toggle({
	Title = "Auto Trial",
	Value = false,
	Callback = function(value)
		_G.AutoTrial = value;
		StopTween(_G.AutoTrial);
	end
});
Config:Register("AutoTrialToggle", AutoTrialToggle);
spawn(function()
	pcall(function()
		while wait() do
			wait(0.2);
			if _G.AutoTrial then
				if LocalPlayer.Data.Race.Value == "Human" then
					for i, v in pairs(Enemies:GetDescendants()) do
						if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
							pcall(function()
								repeat
									wait(0.1);
									v.Humanoid.Health = 0;
								until not _G.AutoTrial or (not v.Parent) or v.Humanoid.Health <= 0;
							end);
						end;
					end;
				elseif LocalPlayer.Data.Race.Value == "Skypiea" then
					for i, v in pairs(Workspace.Map.SkyTrial.Model:GetDescendants()) do
						if v.Name == "snowisland_Cylinder.081" then
							TweenPlayer(v.CFrame * CFrame.new(0, 0, 0));
						end;
					end;
				elseif LocalPlayer.Data.Race.Value == "Fishman" then
					for i, v in pairs(Workspace.SeaBeasts.SeaBeast1:GetDescendants()) do
						if v.Name == "HumanoidRootPart" then
							repeat
								wait();
								TweenPlayer(v.CFrame * CFrame.new(0, 200, 0));
								useAllSkill();
							until not _G.AutoTrial or (not v.Parent) or v.Humanoid.Health <= 0 or (not v:FindFirstChild("HumanoidRootPart"));
						end;
					end;
				elseif LocalPlayer.Data.Race.Value == "Cyborg" then
					TweenPlayer(CFrame.new(28654, 14898.7832, -30, 1, 0, 0, 0, 1, 0, 0, 0, 1));
				elseif LocalPlayer.Data.Race.Value == "Ghoul" then
					for i, v in pairs(Enemies:GetDescendants()) do
						if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
							pcall(function()
								repeat
									wait(0.1);
									v.Humanoid.Health = 0;
								until not _G.AutoTrial or (not v.Parent) or v.Humanoid.Health <= 0;
							end);
						end;
					end;
				elseif LocalPlayer.Data.Race.Value == "Mink" then
					for i, v in pairs(Workspace:GetDescendants()) do
						if v.Name == "StartPoint" then
							TweenPlayer(v.CFrame * CFrame.new(0, 10, 0));
						end;
					end;
				end;
			end;
		end;
	end);
end);
AutoKillPlayerAfterTrialToggle = RaceTabSection:Toggle({
	Title = "Auto Kill Player After Trial",
	Value = false,
	Callback = function(value)
		_G.AutoKillPlayerAfterTrial = value;
	end
});
Config:Register("AutoKillPlayerAfterTrialToggle", AutoKillPlayerAfterTrialToggle);
spawn(function()
	while wait() do
		wait(0.2);
		if _G.AutoKillPlayerAfterTrial then
			if LocalPlayer.PlayerGui.Main.TopHUDList.Timer.Visible == true then
				for i, v in pairs((game:GetService("Players")):GetPlayers()) do
					if v ~= LocalPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
						if (v.HumanoidRootPart.Position - HumanoidRootPart.Position).Magnitude <= 500 then
							if v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health > 0 then
								repeat
									RunService.Heartbeat:Wait();
									EquipWeapon(_G.SelectedWeapon);
									AutoHaki();
									TweenPlayer(v.HumanoidRootPart.CFrame * CFrame.new(0, 0, 40));
									Attack();
								until not _G.AutoKillPlayerAfterTrial or (not v.Character) or v.Character.Humanoid.Health <= 0;
							end;
						end;
					end;
				end;
			end;
		end;
	end;
end);
TeleportSection = Tabs.TeleportTab:Section({
	Title = "Teleport",
	TextXAlignment = "Left"
});
TeleportToFirstSeaButton = TeleportSection:Button({
	Title = "Teleport To First Sea",
	Callback = function()
		Remotes.CommF_:InvokeServer("TravelMain");
	end
});
TeleportToSecondSeaButton = TeleportSection:Button({
	Title = "Teleport To Second Sea",
	Callback = function()
		Remotes.CommF_:InvokeServer("TravelDressrosa");
	end
});
TeleportToThirdSeaButton = TeleportSection:Button({
	Title = "Teleport To Third Sea",
	Callback = function()
		Remotes.CommF_:InvokeServer("TravelZou");
	end
});
ShopSection = Tabs.ShopTab:Section({
	Title = "Shop",
	TextXAlignment = "Left"
});
AutoBuyLegendarySwordToggle = ShopSection:Toggle({
	Title = "Auto Buy Legendary Sword",
	Value = false,
	Callback = function(state)
		_G.AutoBuyLegendarySword = state;
	end
});
spawn(function()
	while wait() do
		wait(0.2);
		if _G.AutoBuyLegendarySword then
			pcall(function()
				Remotes.CommF_:InvokeServer("LegendarySwordDealer", "1");
				Remotes.CommF_:InvokeServer("LegendarySwordDealer", "2");
				Remotes.CommF_:InvokeServer("LegendarySwordDealer", "3");
			end);
		end;
	end;
end);
AutoBuyHakiColorToggle = ShopSection:Toggle({
	Title = "Auto Buy Haki Color",
	Value = false,
	Callback = function(state)
		_G.AutoBuyHakiColor = state;
	end
});
spawn(function()
	while wait() do
		wait(0.2);
		if _G.AutoBuyHakiColor then
			Remotes.CommF_:InvokeServer("ColorsDealer", "2");
		end;
	end;
end);
AbilitiesShopSection = Tabs.ShopTab:Section({
	Title = "Abilities",
	TextXAlignment = "Left"
});
BuyGeppoButton = AbilitiesShopSection:Button({
	Title = "Buy Geppo",
	Desc = "$10,000",
	Callback = function()
		Remotes.CommF_:InvokeServer("BuyHaki", "Geppo");
	end
});
BuyBusoHaki = AbilitiesShopSection:Button({
	Title = "Buy Buso Haki",
	Desc = "$25,000",
	Callback = function()
		Remotes.CommF_:InvokeServer("BuyHaki", "Buso");
	end
});
BuySoruButton = AbilitiesShopSection:Button({
	Title = "Buy Soru",
	Desc = "$25,000",
	Callback = function()
		Remotes.CommF_:InvokeServer("BuyHaki", "Soru");
	end
});
BuyObservationHakiButton = AbilitiesShopSection:Button({
	Title = "Buy Observation Haki",
	Desc = "$750,000",
	Callback = function()
		Remotes.CommF_:InvokeServer("KenTalk", "Buy");
	end
});
FightingStyleShopSection = Tabs.ShopTab:Section({
	Title = "Fighting Style",
	TextXAlignment = "Left"
});
BuyBlackLegButton = FightingStyleShopSection:Button({
	Title = "Buy Black Leg",
	Desc = "$150,000",
	Callback = function()
		Remotes.CommF_:InvokeServer("BuyBlackLeg");
	end
});
BuyElectroButton = FightingStyleShopSection:Button({
	Title = "Buy Electro",
	Desc = "$550,000",
	Callback = function()
		Remotes.CommF_:InvokeServer("BuyElectro");
	end
});
BuyFishmanKarateButton = FightingStyleShopSection:Button({
	Title = "Buy Fishman Karate",
	Desc = "$750,000",
	Callback = function()
		Remotes.CommF_:InvokeServer("BuyFishmanKarate");
	end
});
BuyDragonClawButton = FightingStyleShopSection:Button({
	Title = "Buy Dragon Claw",
	Desc = "ƒ1,500",
	Callback = function()
		Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "1");
		Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "2");
	end
});
BuySuperhumanButton = FightingStyleShopSection:Button({
	Title = "Buy Superhuman",
	Desc = "$3,000,000",
	Callback = function()
		Remotes.CommF_:InvokeServer("BuySuperhuman");
	end
});
BuyDeathStepButton = FightingStyleShopSection:Button({
	Title = "Buy Death Step",
	Desc = "ƒ5,000 $5,000,000",
	Callback = function()
		Remotes.CommF_:InvokeServer("BuyDeathStep");
	end
});
BuySharkmanKarateButton = FightingStyleShopSection:Button({
	Title = "Buy Sharkman Karate",
	Desc = "ƒ5,000 $2,500,000",
	Callback = function()
		Remotes.CommF_:InvokeServer("BuySharkmanKarate", true);
		Remotes.CommF_:InvokeServer("BuySharkmanKarate");
	end
});
BuyElectricClawButton = FightingStyleShopSection:Button({
	Title = "Buy Electric Claw",
	Desc = "ƒ5,000 $3,000,000",
	Callback = function()
		Remotes.CommF_:InvokeServer("BuyElectricClaw");
	end
});
BuyDragonTalonButton = FightingStyleShopSection:Button({
	Title = "Buy Dragon Talon",
	Desc = "ƒ5,000 $3,000,000",
	Callback = function()
		Remotes.CommF_:InvokeServer("BuyDragonTalon");
	end
});
BuyGodHumanButton = FightingStyleShopSection:Button({
	Title = "Buy God Human",
	Desc = "ƒ5,000 $5,000,000",
	Callback = function()
		Remotes.CommF_:InvokeServer("BuyGodhuman");
	end
});
BuySanguineArtButton = FightingStyleShopSection:Button({
	Title = "Buy Sanguine Art",
	Desc = "ƒ5,000 $5,000,000",
	Callback = function()
		Remotes.CommF_:InvokeServer("BuySanguineArt", true);
		Remotes.CommF_:InvokeServer("BuySanguineArt");
	end
});
SwordShopSection = Tabs.ShopTab:Section({
	Title = "Sword",
	TextXAlignment = "Left"
});
BuyCutlassButton = SwordShopSection:Button({
	Title = "Buy Cutlass",
	Desc = "$1,000",
	Callback = function()
		Remotes.CommF_:InvokeServer("BuyItem", "Cutlass");
	end
});
BuyKatanaButton = SwordShopSection:Button({
	Title = "Buy Katana",
	Desc = "$1,000",
	Callback = function()
		Remotes.CommF_:InvokeServer("BuyItem", "Katana");
	end
});
BuyIronMaceButton = SwordShopSection:Button({
	Title = "Buy Iron Mace",
	Desc = "$25,000",
	Callback = function()
		Remotes.CommF_:InvokeServer("BuyItem", "Iron Mace");
	end
});
BuyDualKatanaButton = SwordShopSection:Button({
	Title = "Buy Dual Katana",
	Desc = "$12,000",
	Callback = function()
		Remotes.CommF_:InvokeServer("BuyItem", "Dual Katana");
	end
});
BuyTripleKatanaButton = SwordShopSection:Button({
	Title = "Buy Triple Katana",
	Desc = "$60,000",
	Callback = function()
		Remotes.CommF_:InvokeServer("BuyItem", "Triple Katana");
	end
});
BuyPipeButton = SwordShopSection:Button({
	Title = "Buy Pipe",
	Desc = "$100,000",
	Callback = function()
		Remotes.CommF_:InvokeServer("BuyItem", "Pipe");
	end
});
BuyDualHeadedBladeButton = SwordShopSection:Button({
	Title = "Buy Dual Headed Blade",
	Desc = "$400,000",
	Callback = function()
		Remotes.CommF_:InvokeServer("BuyItem", "Dual-Headed Blade");
	end
});
BuyBisentoButton = SwordShopSection:Button({
	Title = "Buy Bisento",
	Desc = "$1,200,000",
	Callback = function()
		Remotes.CommF_:InvokeServer("BuyItem", "Bisento");
	end
});
BuySoulCaneButton = SwordShopSection:Button({
	Title = "Buy Soul Cane",
	Desc = "$1,000",
	Callback = function()
		Remotes.CommF_:InvokeServer("BuyItem", "Soul Cane");
	end
});
GunShopSection = Tabs.ShopTab:Section({
	Title = "Gun",
	TextXAlignment = "Left"
});
BuySlingshotButton = GunShopSection:Button({
	Title = "Buy Slingshot",
	Desc = "$5,000",
	Callback = function()
		Remotes.CommF_:InvokeServer("BuyItem", "Slingshot");
	end
});
BuyMusketButton = GunShopSection:Button({
	Title = "Buy Musket",
	Desc = "$8,000",
	Callback = function()
		Remotes.CommF_:InvokeServer("BuyItem", "Musket");
	end
});
BuyFintlockButton = GunShopSection:Button({
	Title = "Buy Flintlock",
	Desc = "$10,500",
	Callback = function()
		Remotes.CommF_:InvokeServer("BuyItem", "Flintlock");
	end
});
BuyRefinedFintlockButton = GunShopSection:Button({
	Title = "Buy Refined Fintlock",
	Desc = "$60,000",
	Callback = function()
		Remotes.CommF_:InvokeServer("BuyItem", "Refined Fintlock");
	end
});
BuyCanonButton = GunShopSection:Button({
	Title = "Buy Cannon",
	Desc = "$100,000",
	Callback = function()
		Remotes.CommF_:InvokeServer("BuyItem", "Cannon");
	end
});
BuyKabuchaButton = GunShopSection:Button({
	Title = "Buy Kabucha",
	Desc = "ƒ1,500",
	Callback = function()
		Remotes.CommF_:InvokeServer("BlackbeardReward", "Slingshot", "1");
		Remotes.CommF_:InvokeServer("BlackbeardReward", "Slingshot", "2");
	end
});
StatsShopSection = Tabs.ShopTab:Section({
	Title = "Stats",
	TextXAlignment = "Left"
});
ResetStatsShopButton = StatsShopSection:Button({
	Title = "Reset Stats",
	Desc = "ƒ2,500",
	Callback = function()
		Remotes.CommF_:InvokeServer("BlackbeardReward", "Refund", "1");
		Remotes.CommF_:InvokeServer("BlackbeardReward", "Refund", "2");
	end
});
RandomRaceShopButton = StatsShopSection:Button({
	Title = "Random Race",
	Desc = "ƒ3,000",
	Callback = function()
		Remotes.CommF_:InvokeServer("BlackbeardReward", "Reroll", "1");
		Remotes.CommF_:InvokeServer("BlackbeardReward", "Reroll", "2");
	end
});
AccessoriesShopSection = Tabs.ShopTab:Section({
	Title = "Accessories",
	TextXAlignment = "Left"
});
BuyBlackCapeButton = AccessoriesShopSection:Button({
	Title = "Buy Black Cape",
	Desc = "$50,000",
	Callback = function()
		Remotes.CommF_:InvokeServer("BuyItem", "Black Cape");
	end
});
BuySwordsmanHatButton = AccessoriesShopSection:Button({
	Title = "Buy Swordsman Hat",
	Desc = "$150,000",
	Callback = function()
		Remotes.CommF_:InvokeServer("BuyItem", "Swordsman Hat");
	end
});
BuyTomoeRingButton = AccessoriesShopSection:Button({
	Title = "Buy Tomoe Ring",
	Desc = "$500,000",
	Callback = function()
		Remotes.CommF_:InvokeServer("BuyItem", "Tomoe Ring");
	end
});
CombatTabSection = Tabs.CombatTab:Section({
	Title = "Combat",
	TextXAlignment = "Left"
});
PlayerInServerTotalParagraph = CombatTabSection:Paragraph({
	Title = "Players In Server",
	Desc = "0"
});
spawn(function()
	while wait(0.2) do
		pcall(function()
			for i, v in pairs((game:GetService("Players")):GetPlayers()) do
				if i == 12 then
					PlayerInServerTotalParagraph:SetDesc(i .. " / " .. "12" .. "(Max)");
				elseif i == 1 then
					PlayerInServerTotalParagraph:SetDesc(i .. " / " .. "12");
				else
					PlayerInServerTotalParagraph:SetDesc(i .. " / " .. "12");
				end;
			end;
		end);
	end;
end);
PlayerList = {};
task.spawn(function()
	for i, v in pairs((game:GetService("Players")):GetChildren()) do
		table.insert(PlayerList, v.Name);
	end;
end);
SelectedPlayerDropdown = CombatTabSection:Dropdown({
	Title = "Choose Player",
	Values = PlayerList,
	Value = tostring(PlayerList[1]),
	Callback = function(option)
		_G.SelectedPlayer = option;
	end
});
RefreshPlayerButton = CombatTabSection:Button({
	Title = "Refresh Player",
	Callback = function()
		PlayerList = {};
		for i, v in pairs((game:GetService("Players")):GetChildren()) do
			table.insert(PlayerList, v.Name);
		end;
		SelectedPlayerDropdown:Refresh(PlayerList);
	end
});
SpectatePlayerToggle = CombatTabSection:Toggle({
	Title = "Spectate Player",
	Value = false,
	Callback = function(state)
		_G.SpectatePlys = state;
	end
});
spawn(function()
	while wait() do
		wait(0.2);
		if _G.SpectatePlys then
			pcall(function()
				repeat
					wait(0.1);
					Workspace.Camera.CameraSubject = ((game:GetService("Players")):FindFirstChild(_G.SelectedPlayer)).Character.Humanoid;
				until _G.SpectatePlys == false or (not (game:GetService("Players")):FindFirstChild(_G.SelectedPlayer));
				Workspace.Camera.CameraSubject = Character.Humanoid;
			end);
		end;
	end;
end);
TeleportToPlayerToggle = CombatTabSection:Toggle({
	Title = "Teleport To Player",
	Value = false,
	Callback = function(state)
		_G.TeleportToPlayer = value;
		pcall(function()
			if _G.TeleportToPlayer then
				repeat
					TweenPlayer((game:GetService("Players"))[_G.SelectedPlayer].HumanoidRootPart.CFrame);
					wait();
				until _G.TeleportToPlayer == false or (not (game:GetService("Players")):FindFirstChild(_G.SelectedPlayer));
			end;
			StopTween(_G.TeleportToPlayer);
		end);
	end
});
TeleportIslandSection = Tabs.TeleportTab:Section({
	Title = "Island",
	TextXAlignment = "Left"
});
IslandList = {};
task.spawn(function()
	if World1 then
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
		};
	elseif World2 then
		IslandList = {
			"The Cafe",
			"Frist Spot",
			"Dark Area",
			"Flamingo Mansion",
			"Flamingo Room",
			"Green Zone",
			"Factory",
			"Colossuim",
			"Zombie Island",
			"Two Snow Mountain",
			"Punk Hazard",
			"Cursed Ship",
			"Ice Castle",
			"Forgotten Island",
			"Ussop Island",
			"Mini Sky Island"
		};
	elseif World3 then
		IslandList = {
			"Mansion",
			"Port Town",
			"Great Tree",
			"Castle On The Sea",
			"MiniSky",
			"Hydra Island",
			"Floating Turtle",
			"Haunted Castle",
			"Ice Cream Island",
			"Peanut Island",
			"Cake Island",
			"Cocoa Island",
			"Candy Island",
			"Tiki Outpost",
			"Dragon Dojo"
		};
	end;
end);
SelectedTeleportIslandDropdown = TeleportIslandSection:Dropdown({
	Title = "Choose Island",
	Values = IslandList,
	Value = IslandList[1],
	Callback = function(option)
		_G.SelectIsland = option;
	end
});
SelectedTeleportIslandDropdown:Select(IslandList[1]);
Config:Register("SelectedTeleportIslandDropdown", SelectedTeleportIslandDropdown);
AutoTeleportToIslandToggle = TeleportIslandSection:Toggle({
	Title = "Teleport To Island",
	Value = false,
	Callback = function(state)
		_G.TeleportIsland = state;
		if _G.TeleportIsland then
			repeat
				wait();
				if _G.SelectIsland == "WindMill" then
					TweenPlayer(CFrame.new(979.79895019531, 16.516613006592, 1429.0466308594));
				elseif _G.SelectIsland == "Marine" then
					TweenPlayer(CFrame.new(-2566.4296875, 6.8556680679321, 2045.2561035156));
				elseif _G.SelectIsland == "Middle Town" then
					TweenPlayer(CFrame.new(-690.33081054688, 15.09425163269, 1582.2380371094));
				elseif _G.SelectIsland == "Jungle" then
					TweenPlayer(CFrame.new(-1612.7957763672, 36.852081298828, 149.12843322754));
				elseif _G.SelectIsland == "Pirate Village" then
					TweenPlayer(CFrame.new(-1181.3093261719, 4.7514905929565, 3803.5456542969));
				elseif _G.SelectIsland == "Desert" then
					TweenPlayer(CFrame.new(944.15789794922, 20.919729232788, 4373.3002929688));
				elseif _G.SelectIsland == "Snow Island" then
					TweenPlayer(CFrame.new(1347.8067626953, 104.66806030273, -1319.7370605469));
				elseif _G.SelectIsland == "MarineFord" then
					TweenPlayer(CFrame.new(-4914.8212890625, 50.963626861572, 4281.0278320313));
				elseif _G.SelectIsland == "Colosseum" then
					TweenPlayer(CFrame.new(-1427.6203613281, 7.2881078720093, -2792.7722167969));
				elseif _G.SelectIsland == "Sky Island 1" then
					TweenPlayer(CFrame.new(-4869.1025390625, 733.46051025391, -2667.0180664063));
				elseif _G.SelectIsland == "Sky Island 2" then
					Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-4607.82275, 872.54248, -1667.55688));
				elseif _G.SelectIsland == "Sky Island 3" then
					Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047));
				elseif _G.SelectIsland == "Prison" then
					TweenPlayer(CFrame.new(4875.330078125, 5.6519818305969, 734.85021972656));
				elseif _G.SelectIsland == "Magma Village" then
					TweenPlayer(CFrame.new(-5247.7163085938, 12.883934020996, 8504.96875));
				elseif _G.SelectIsland == "Under Water Island" then
					Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(61163.8515625, 11.6796875, 1819.7841796875));
				elseif _G.SelectIsland == "Fountain City" then
					TweenPlayer(CFrame.new(5127.1284179688, 59.501365661621, 4105.4458007813));
				elseif _G.SelectIsland == "Shank Room" then
					TweenPlayer(CFrame.new(-1442.16553, 29.8788261, -28.3547478));
				elseif _G.SelectIsland == "Mob Island" then
					TweenPlayer(CFrame.new(-2850.20068, 7.39224768, 5354.99268));
				elseif _G.SelectIsland == "The Cafe" then
					TweenPlayer(CFrame.new(-380.47927856445, 77.220390319824, 255.82550048828));
				elseif _G.SelectIsland == "Frist Spot" then
					TweenPlayer(CFrame.new(-11.311455726624, 29.276733398438, 2771.5224609375));
				elseif _G.SelectIsland == "Dark Area" then
					TweenPlayer(CFrame.new(3780.0302734375, 22.652164459229, -3498.5859375));
				elseif _G.SelectIsland == "Flamingo Mansion" then
					TweenPlayer(CFrame.new(-483.73370361328, 332.0383605957, 595.32708740234));
				elseif _G.SelectIsland == "Flamingo Room" then
					TweenPlayer(CFrame.new(2284.4140625, 15.152037620544, 875.72534179688));
				elseif _G.SelectIsland == "Green Zone" then
					TweenPlayer(CFrame.new(-2448.5300292969, 73.016105651855, -3210.6306152344));
				elseif _G.SelectIsland == "Factory" then
					TweenPlayer(CFrame.new(424.12698364258, 211.16171264648, -427.54049682617));
				elseif _G.SelectIsland == "Colossuim" then
					TweenPlayer(CFrame.new(-1503.6224365234, 219.7956237793, 1369.3101806641));
				elseif _G.SelectIsland == "Zombie Island" then
					TweenPlayer(CFrame.new(-5622.033203125, 492.19604492188, -781.78552246094));
				elseif _G.SelectIsland == "Two Snow Mountain" then
					TweenPlayer(CFrame.new(753.14288330078, 408.23559570313, -5274.6147460938));
				elseif _G.SelectIsland == "Punk Hazard" then
					TweenPlayer(CFrame.new(-6127.654296875, 15.951762199402, -5040.2861328125));
				elseif _G.SelectIsland == "Cursed Ship" then
					TweenPlayer(CFrame.new(923.40197753906, 125.05712890625, 32885.875));
				elseif _G.SelectIsland == "Ice Castle" then
					TweenPlayer(CFrame.new(6148.4116210938, 294.38687133789, -6741.1166992188));
				elseif _G.SelectIsland == "Forgotten Island" then
					TweenPlayer(CFrame.new(-3032.7641601563, 317.89672851563, -10075.373046875));
				elseif _G.SelectIsland == "Ussop Island" then
					TweenPlayer(CFrame.new(4816.8618164063, 8.4599885940552, 2863.8195800781));
				elseif _G.SelectIsland == "Mini Sky Island" then
					TweenPlayer(CFrame.new(-288.74060058594, 49326.31640625, -35248.59375));
				elseif _G.SelectIsland == "Great Tree" then
					TweenPlayer(CFrame.new(2681.2736816406, 1682.8092041016, -7190.9853515625));
				elseif _G.SelectIsland == "Castle On The Sea" then
					Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-5083.26025390625, 314.6056823730469, -3175.673095703125));
				elseif _G.SelectIsland == "MiniSky" then
					TweenPlayer(CFrame.new(-260.65557861328, 49325.8046875, -35253.5703125));
				elseif _G.SelectIsland == "Port Town" then
					TweenPlayer(CFrame.new(-290.7376708984375, 6.729952812194824, 5343.5537109375));
				elseif _G.SelectIsland == "Hydra Island" then
					TweenPlayer(CFrame.new(5291.24951, 1005.4433, 393.762421, 0.994222522, 0.00000000945717726, -0.10733854, -0.00000000708227299, 1, 0.0000000225065655, 0.10733854, -0.0000000216163336, 0.994222522));
				elseif _G.SelectIsland == "Floating Turtle" then
					TweenPlayer(CFrame.new(-13274.528320313, 531.82073974609, -7579.22265625));
				elseif _G.SelectIsland == "Mansion" then
					Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-12471.169921875, 374.94024658203, -7551.677734375));
				elseif _G.SelectIsland == "Haunted Castle" then
					TweenPlayer(CFrame.new(-9515.3720703125, 164.00624084473, 5786.0610351562));
				elseif _G.SelectIsland == "Ice Cream Island" then
					TweenPlayer(CFrame.new(-902.56817626953, 79.93204498291, -10988.84765625));
				elseif _G.SelectIsland == "Peanut Island" then
					TweenPlayer(CFrame.new(-2062.7475585938, 50.473892211914, -10232.568359375));
				elseif _G.SelectIsland == "Cake Island" then
					TweenPlayer(CFrame.new(-1884.7747802734375, 19.327526092529297, -11666.8974609375));
				elseif _G.SelectIsland == "Cocoa Island" then
					TweenPlayer(CFrame.new(87.94276428222656, 73.55451202392578, -12319.46484375));
				elseif _G.SelectIsland == "Candy Island" then
					TweenPlayer(CFrame.new(-1014.4241943359375, 149.11068725585938, -14555.962890625));
				elseif _G.SelectIsland == "Tiki Outpost" then
					TweenPlayer(CFrame.new(-16218.6826, 9.08636189, 445.618408, -0.0610186495, 0.00000000110512588, -0.99813664, -0.0000000183458475, 1, 0.00000000222871765, 0.99813664, 0.0000000184476558, -0.0610186495));
				elseif _G.SelectIsland == "Dragon Dojo" then
					TweenPlayer(CFrame.new(5743.31934, 1206.90991, 936.011047, 0.475779682, -0.00000000366404773, -0.879564524, 0.0000000254969592, 1, 0.00000000962622693, 0.879564524, -0.000000027006184, 0.475779682));
				end;
			until not _G.TeleportIsland;
		end;
		StopTween(_G.TeleportIsland);
	end
});
TeleportNpcSection = Tabs.TeleportTab:Section({
	Title = "Npc",
	TextXAlignment = "Left"
});
NpcList = {};
task.spawn(function()
	if World1 then
		NpcList = {
			"Random Devil Fruit",
			"Blox Fruits Dealer",
			"Remove Devil Fruit",
			"Ability Teacher",
			"Dark Step",
			"Electro",
			"Fishman Karate"
		};
	elseif World2 then
		NpcList = {
			"Dargon Berath",
			"Mtsterious Man",
			"Mysterious Scientist",
			"Awakening Expert",
			"Nerd",
			"Bar Manager",
			"Blox Fruits Dealer",
			"Trevor",
			"Enhancement Editor",
			"Pirate Recruiter",
			"Marines Recruiter",
			"Chemist",
			"Cyborg",
			"Ghoul Mark",
			"Guashiem",
			"El Admin",
			"El Rodolfo",
			"Arowe"
		};
	elseif World3 then
		NpcList = {
			"Blox Fruits Dealer",
			"Remove Devil Fruit",
			"Horned Man",
			"Hungey Man",
			"Previous Hero",
			"Butler",
			"Lunoven",
			"Trevor",
			"Elite Hunter",
			"Player Hunter",
			"Uzoth"
		};
	end;
end);
SelectedNpcTeleport = TeleportNpcSection:Dropdown({
	Title = "Choose Npc",
	Values = NpcList,
	Value = NpcList[1],
	Callback = function(option)
		_G.SelectNPC = option;
	end
});
SelectedNpcTeleport:Select(NpcList[1]);
Config:Register("SelectedNpcTeleport", SelectedNpcTeleport);
TeleportToNpcToggle = TeleportNpcSection:Toggle({
	Title = "Teleport To Npc",
	Value = false,
	Callback = function(state)
		_G.TeleportNPC = state;
		if _G.TeleportNPC then
			repeat
				wait();
				if _G.SelectNPC == "Dargon Berath" then
					TweenPlayer(CFrame.new(703.372986, 186.985519, 654.522034, 1, 0, 0, 0, 1, 0, 0, 0, 1));
				elseif _G.SelectNPC == "Mtsterious Man" then
					TweenPlayer(CFrame.new(-2574.43335, 1627.92371, -3739.35767, 0.378697902, -0.00000000906400288, 0.92552036, -0.00000000895582009, 1, 0.0000000134578926, -0.92552036, -0.0000000133852689, 0.378697902));
				elseif _G.SelectNPC == "Mysterious Scientist" then
					TweenPlayer(CFrame.new(-6437.87793, 250.645355, -4498.92773, 0.502376854, -0.0000000101223634, -0.864648759, 0.0000000234106086, 1, 0.00000000189508653, 0.864648759, -0.0000000211940012, 0.502376854));
				elseif _G.SelectNPC == "Awakening Expert" then
					TweenPlayer(CFrame.new(-408.098846, 16.0459061, 247.432846, 0.028394036, 0.000000000617599138, 0.999596894, -0.00000000557905944, 1, -0.000000000459372484, -0.999596894, -0.00000000556376767, 0.028394036));
				elseif _G.SelectNPC == "Nerd" then
					TweenPlayer(CFrame.new(-401.783722, 73.0859299, 262.306702, 1, 0, 0, 0, 1, 0, 0, 0, 1));
				elseif _G.SelectNPC == "Bar Manager" then
					TweenPlayer(CFrame.new(-385.84726, 73.0458984, 316.088806, 1, 0, 0, 0, 1, 0, 0, 0, 1));
				elseif _G.SelectNPC == "Blox Fruits Dealer" then
					TweenPlayer(CFrame.new(-450.725464, 73.0458984, 355.636902, -0.780352175, -0.000000027266168, 0.625340283, 0.00000000978516468, 1, 0.0000000558128797, -0.625340283, 0.0000000496727601, -0.780352175));
				elseif _G.SelectNPC == "Trevor" then
					TweenPlayer(CFrame.new(-341.498322, 331.886444, 643.024963, 1, 0, 0, 0, 1, 0, 0, 0, 1));
				elseif _G.SelectNPC == "Plokster" then
					TweenPlayer(CFrame.new(-1885.16016, 88.3838196, -1912.28723, -0.513468027, 0, 0.858108759, 0, 1, 0, -0.858108759, 0, -0.513468027));
				elseif _G.SelectNPC == "Enhancement Editor" then
					TweenPlayer(CFrame.new(-346.820221, 72.9856339, 1194.36218, 1, 0, 0, 0, 1, 0, 0, 0, 1));
				elseif _G.SelectNPC == "Pirate Recruiter" then
					TweenPlayer(CFrame.new(-428.072998, 72.9495239, 1445.32422, 1, 0, 0, 0, 1, 0, 0, 0, 1));
				elseif _G.SelectNPC == "Marines Recruiter" then
					TweenPlayer(CFrame.new(-1349.77295, 72.9853363, -1045.12964, 0.866493046, 0, -0.499189168, 0, 1, 0, 0.499189168, 0, 0.866493046));
				elseif _G.SelectNPC == "Chemist" then
					TweenPlayer(CFrame.new(-2777.45288, 72.9919434, -3572.25732, 1, 0, 0, 0, 1, 0, 0, 0, 1));
				elseif _G.SelectNPC == "Ghoul Mark" then
					TweenPlayer(CFrame.new(635.172546, 125.976357, 33219.832, 1, 0, 0, 0, 1, 0, 0, 0, 1));
				elseif _G.SelectNPC == "Cyborg" then
					TweenPlayer(CFrame.new(629.146851, 312.307373, -531.624146, 1, 0, 0, 0, 1, 0, 0, 0, 1));
				elseif _G.SelectNPC == "Guashiem" then
					TweenPlayer(CFrame.new(937.953003, 181.083359, 33277.9297, 1, -0.0000000860126406, 0.0000000000000000381773896, 0.0000000860126406, 1, -0.000000000000000189969598, -0.000000000000000038177373, 0.000000000000000189969598, 1));
				elseif _G.SelectNPC == "El Admin" then
					TweenPlayer(CFrame.new(1322.80835, 126.345039, 33135.8789, 0.988783717, -0.0000000869797603, -0.149354503, 0.0000000862223786, 1, -0.0000000115461916, 0.149354503, -0.00000000146101409, 0.988783717));
				elseif _G.SelectNPC == "El Rodolfo" then
					TweenPlayer(CFrame.new(941.228699, 40.4686775, 32778.9922, -0.818029106, -0.0000000119524382, 0.575176775, -0.0000000128741648, 1, 0.00000000247053866, -0.575176775, -0.00000000538394795, -0.818029106));
				elseif _G.SelectNPC == "Arowe" then
					TweenPlayer(CFrame.new(-1994.51038, 125.519142, -72.2622986, -0.16715166, -0.0000000655417338, -0.985931218, -0.0000000713315558, 1, -0.0000000543836585, 0.985931218, 0.0000000612376851, -0.16715166));
				elseif _G.SelectNPC == "Random Devil Fruit" then
					TweenPlayer(CFrame.new(-1436.19727, 61.8777695, 4.75247526, -0.557794094, 0.0000000274216543, 0.829979479, 0.0000000583273234, 1, 0.00000000616037932, -0.829979479, 0.0000000518467118, -0.557794094));
				elseif _G.SelectNPC == "Blox Fruits Dealer" then
					TweenPlayer(CFrame.new(-923.255066, 7.67800522, 1608.61011, 1, 0, 0, 0, 1, 0, 0, 0, 1));
				elseif _G.SelectNPC == "Remove Devil Fruit" then
					TweenPlayer(CFrame.new(5664.80469, 64.677681, 867.85907, 1, 0, 0, 0, 1, 0, 0, 0, 1));
				elseif _G.SelectNPC == "Ability Teacher" then
					TweenPlayer(CFrame.new(-1057.67822, 9.65220833, 1799.49146, -0.865874112, -0.0000000926330159, 0.500262439, -0.0000000733759435, 1, 0.00000005816689, -0.500262439, 0.0000000136579752, -0.865874112));
				elseif _G.SelectNPC == "Dark Step" then
					TweenPlayer(CFrame.new(-987.873047, 13.7778397, 3989.4978, 1, 0, 0, 0, 1, 0, 0, 0, 1));
				elseif _G.SelectNPC == "Electro" then
					TweenPlayer(CFrame.new(-5389.49561, 13.283, -2149.80151, 1, 0, 0, 0, 1, 0, 0, 0, 1));
				elseif _G.SelectNPC == "Fishman Karate" then
					TweenPlayer(CFrame.new(61581.8047, 18.8965912, 987.832703, 1, 0, 0, 0, 1, 0, 0, 0, 1));
				elseif _G.SelectNPC == "Random Devil Fruit" then
					TweenPlayer(CFrame.new(-12491, 337, -7449));
				elseif _G.SelectNPC == "Blox Fruits Dealer" then
					TweenPlayer(CFrame.new(-12511, 337, -7448));
				elseif _G.SelectNPC == "Remove Devil Fruit" then
					TweenPlayer(CFrame.new(-5571, 1089, -2661));
				elseif _G.SelectNPC == "Horned Man" then
					TweenPlayer(CFrame.new(-11890, 931, -8760));
				elseif _G.SelectNPC == "Hungey Man" then
					TweenPlayer(CFrame.new(-10919, 624, -10268));
				elseif _G.SelectNPC == "Previous Hero" then
					TweenPlayer(CFrame.new(-10368, 332, -10128));
				elseif _G.SelectNPC == "Butler" then
					TweenPlayer(CFrame.new(-5125, 316, -3130));
				elseif _G.SelectNPC == "Lunoven" then
					TweenPlayer(CFrame.new(-5117, 316, -3093));
				elseif _G.SelectNPC == "Elite Hunter" then
					TweenPlayer(CFrame.new(-5420, 314, -2828));
				elseif _G.SelectNPC == "Player Hunter" then
					TweenPlayer(CFrame.new(-5559, 314, -2840));
				elseif _G.SelectNPC == "Uzoth" then
					TweenPlayer(CFrame.new(-9785, 852, 6667));
				end;
			until not _G.TeleportNPC;
		end;
		StopTween(_G.TeleportNPC);
	end
});
EspSection = Tabs.EspTab:Section({
	Title = "Esp",
	TextXAlignment = "Left"
});
EspPlayerToggle = EspSection:Toggle({
	Title = "Esp Player",
	Desc = "Highlight Player",
	Value = false,
	Callback = function(state)
		_G.EspPlayer = state;
	end
});
Config:Register("EspPlayerToggle", EspPlayerToggle);
EspChestToggle = EspSection:Toggle({
	Title = "Esp Chest",
	Desc = "Highlight Chest",
	Value = false,
	Callback = function(state)
		_G.EspChest = state;
	end
});
Config:Register("EspChestToggle", EspChestToggle);
EspDevilFruitToggle = EspSection:Toggle({
	Title = "Esp DevilFruit",
	Desc = "Highlight DevilFruit",
	Value = false,
	Callback = function(state)
		_G.EspDevilfruit = state;
	end
});
Config:Register("EspDevilFruitToggle", EspDevilFruitToggle);
EspRealFruitToggle = EspSection:Toggle({
	Title = "Esp RealFruit",
	Desc = "Highlight RealFruit",
	Value = false,
	Callback = function(state)
		_G.EspRealFruit = state;
	end
})
Config:Register("EspRealFruitToggle", EspRealFruitToggle);
EspFlowerToggle = EspSection:Toggle({
	Title = "Esp Flower",
	Desc = "Highlight Flower",
	Value = false,
	Callback = function(state)
		_G.EspFlower = state;
	end
});
Config:Register("EspFlowerToggle", EspFlowerToggle);
EspIslandToggle = EspSection:Toggle({
	Title = "Esp Island",
	Desc = "Highlight Island",
	Value = false,
	Callback = function(state)
		_G.EspIsland = state;
	end
});
Config:Register("EspIslandToggle", EspIslandToggle);
EspNpcToggle = EspSection:Toggle({
	Title = "Esp Npc",
	Desc = "Highlight Npc",
	Value = false,
	Callback = function(state)
		_G.EspNpc = state;
	end
});
Config:Register("EspNpcToggle", EspNpcToggle);
EspSeaBeastToggle = EspSection:Toggle({
	Title = "Esp Sea Beast",
	Desc = "Highlight SeaBeast",
	Value = false,
	Callback = function(state)
		_G.EspSeabeast = state;
	end
});
Config:Register("EspSeaBeastToggle", EspSeaBeastToggle);
EspMonsterToggle = EspSection:Toggle({
	Title = "Esp Monster",
	Desc = "Highlight Monster",
	Value = false,
	Callback = function(state)
		_G.EspMonster = state;
	end
});
Config:Register("EspMonsterToggle", EspMonsterToggle);
EspMirageIslandToggle = EspSection:Toggle({
	Title = "Esp Mirage Island",
	Desc = "Highlight Mirage Island",
	Value = false,
	Callback = function(state)
		_G.EspMirage = state;
	end
});
Config:Register("EspMirageIslandToggle", EspMirageIslandToggle);
EspKitsuneIslandToggle = EspSection:Toggle({
	Title = "Esp Kitsune Island",
	Desc = "Highlight Kitsune Island",
	Value = false,
	Callback = function(state)
		_G.EspKitsune = state;
	end
});
Config:Register("EspKitsuneIslandToggle", EspKitsuneIslandToggle);
EspFrozenDimensionToggle = EspSection:Toggle({
	Title = "Esp Frozen Dimension",
	Desc = "Highlight Frozen Dimension",
	Value = false,
	Callback = function(state)
		_G.EspFrozen = state;
	end
});
Config:Register("EspFrozenDimensionToggle", EspFrozenDimensionToggle);
EspPrehistoricIslandToggle = EspSection:Toggle({
	Title = "Esp Prehistoric Island",
	Desc = "Highlight Prehistoric Island",
	Value = false,
	Callback = function(state)
		_G.EspPrehistoric = state;
	end
});
Config:Register("EspPrehistoricIslandToggle", EspPrehistoricIslandToggle);
EspGearToggle = EspSection:Toggle({
	Title = "Esp Gear",
	Desc = "Highlight Gear",
	Value = false,
	Callback = function(state)
		_G.EspGear = state;
	end
});
Config:Register("EspGearToggle", EspGearToggle);
DragonDojoSection = Tabs.DragonDojoTab:Section({
	Title = "Dragon Dojo",
	TextXAlignment = "Left"
});
AutoFarmBlazeEmberToggle = DragonDojoSection:Toggle({
	Title = "Auto Farm Blaze Ember",
	Desc = "Auto Compleate Quest + Collect Blaze Ember [ Sea 3 Only ]",
	Value = false,
	Callback = function(state)
		_G.AutoFarmBlazeEmber = state;
		StopTween(_G.AutoFarmBlazeEmber);
	end
});
Config:Register("AutoFarmBlazeEmberToggle", AutoFarmBlazeEmberToggle);
function getBlazeEmberQuest()
	local ResQuest = (((ReplicatedStorage:WaitForChild("Modules")):WaitForChild("Net")):WaitForChild("RF/DragonHunter")):InvokeServer({
		Context = "Check"
	});
	if ResQuest then
		for key, value in pairs(ResQuest) do
			if key == "Text" then
				return value;
			end;
		end;
	end;
end;
function getRequestQuest()
	local Req = (((ReplicatedStorage:WaitForChild("Modules")):WaitForChild("Net")):WaitForChild("RF/DragonHunter")):InvokeServer({
		Context = "RequestQuest"
	});
	return Req;
end;
function getIsOnQuest()
	local ResQuest = (((ReplicatedStorage:WaitForChild("Modules")):WaitForChild("Net")):WaitForChild("RF/DragonHunter")):InvokeServer({
		Context = "Check"
	});
	if ResQuest then
		for key, value in pairs(ResQuest) do
			if key == "Text" then
				if string.find(value, "Venomous Assailant") or string.find(value, "Hydra Enforcer") or string.find(value, "Destroy 10 trees") then
					return true;
				end;
			end;
		end;
	end;
	return false;
end;
spawn(function()
	while wait() do
		wait(0.2);
		if _G.AutoFarmBlazeEmber then
			pcall(function()
				if not _G.OnBlazeQuest and (not getIsOnQuest()) then
					local DragonHunterPos = CFrame.new(5864.86377, 1209.55066, 812.775024, 0.879059196, 0.00000000381980803, 0.476712614, -0.0000000131110456, 1, 0.0000000161639893, -0.476712614, -0.0000000204593036, 0.879059196);
					TweenPlayer(DragonHunterPos);
					(((ReplicatedStorage:WaitForChild("Modules")):WaitForChild("Net")):WaitForChild("RF/DragonHunter")):InvokeServer({
						Context = "RequestQuest"
					});
				end;
				SaveBlazeEmberQuest();
				_G.OnBlazeQuest = true;
			end);
		end;
	end;
end);
function SaveBlazeEmberQuest()
	if string.find(getBlazeEmberQuest(), "Venomous Assailant") then
		_G.BlazeEmberQuest = "Venomous Assailant";
	elseif string.find(getBlazeEmberQuest(), "Hydra Enforcer") then
		_G.BlazeEmberQuest = "Hydra Enforcer";
	elseif string.find(getBlazeEmberQuest(), "Destroy 10 trees") then
		_G.BlazeEmberQuest = "Destroy 10 trees";
	end;
end;
_G.OnBlazeQuest = false;
spawn(function()
	while wait(0.2) do
		if isQuestCompleated() then
			_G.OnBlazeQuest = false;
		end;
	end;
end);
spawn(function()
	while wait() do
		wait(0.2);
		if _G.AutoFarmBlazeEmber then
			pcall(function()
				if _G.BlazeEmberQuest == "Venomous Assailant" and _G.OnBlazeQuest then
					autoKillVenemousAssailant();
				elseif _G.BlazeEmberQuest == "Hydra Enforcer" and _G.OnBlazeQuest then
					autoKillHydraEnforcer();
				elseif _G.BlazeEmberQuest == "Destroy 10 trees" and _G.OnBlazeQuest then
					autoDestroyHydraTrees();
				end;
			end);
		end;
	end;
end);
function isQuestCompleated()
	for i, v in pairs(LocalPlayer.PlayerGui.Notifications:GetChildren()) do
		for _, Notif in pairs(v:GetChildren()) do
			if string.find(Notif.Text, "Task completed!") or string.find(Notif.Text, "Head back to the Dojo") then
				return true;
			end;
		end;
	end;
	return false;
end;
function CollectBlazeEmber()
	InstantTp(((Workspace:WaitForChild("EmberTemplate")):FindFirstChild("Part")).CFrame);
end;
function autoKillVenemousAssailant()
	if not Enemies:FindFirstChild("Venomous Assailant") then
		TweenPlayer(CFrame.new(4789.29639, 1078.59082, 962.764099, -0.381989956, 0.0000000198627319, 0.924166501, 0.0000000126859874, 1, -0.0000000162490341, -0.924166501, 0.00000000551699708, -0.381989956));
	else
		for i, v in pairs(Enemies:GetChildren()) do
			if v.Name == "Venomous Assailant" then
				if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
					repeat
						RunService.Heartbeat:wait();
						AutoHaki();
						EquipWeapon(_G.SelectedWeapon);
						v.Humanoid.WalkSpeed = 0;
						v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
						PosMon = v.HumanoidRootPart.CFrame;
						MonFarm = v.Name;
						TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
						Attack();
					until not v.Parent or v.Humanoid.Health <= 0 or (not _G.AutoFarmBlazeEmber) or (not _G.OnBlazeQuest);
				end;
			end;
		end;
	end;
end;
function autoKillHydraEnforcer()
	if not Enemies:FindFirstChild("Hydra Enforcer") then
		TweenPlayer(CFrame.new(4789.29639, 1078.59082, 962.764099, -0.381989956, 0.0000000198627319, 0.924166501, 0.0000000126859874, 1, -0.0000000162490341, -0.924166501, 0.00000000551699708, -0.381989956));
	else
		for i, v in pairs(Enemies:GetChildren()) do
			if v.Name == "Hydra Enforcer" then
				if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
					repeat
						RunService.Heartbeat:wait();
						AutoHaki();
						EquipWeapon(_G.SelectedWeapon);
						v.Humanoid.WalkSpeed = 0;
						v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
						PosMon = v.HumanoidRootPart.CFrame;
						MonFarm = v.Name;
						TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
						Attack();
					until not v.Parent or v.Humanoid.Health <= 0 or (not _G.AutoFarmBlazeEmber) or (not _G.OnBlazeQuest);
				end;
			end;
		end;
	end;
end;
function autoDestroyHydraTrees()
	local Pos1 = CFrame.new(5260.28223, 1004.24329, 347.062622, 0.923247099, -0.00000000370291953, 0.384206682, -0.000000000671108058, 1, 0.0000000112505019, -0.384206682, -0.0000000106448379, 0.923247099);
	local Pos2 = CFrame.new(5237.94775, 1004.24329, 429.596344, 0.371416599, 0.00000000207420636, 0.92846632, 0.00000000476562345, 1, -0.00000000414041734, -0.92846632, 0.00000000596254068, 0.371416599);
	local Pos3 = CFrame.new(5320.87793, 1004.24329, 439.152954, 0.136340275, -0.0000000995428806, -0.990662038, 0.0000000610136723, 1, -0.0000000920841288, 0.990662038, -0.0000000478891593, 0.136340275);
	local Pos4 = CFrame.new(5346.70752, 1004.24329, 359.389008, 0.296962529, 0.0000000642768185, -0.954889119, -0.0000000737323518, 1, 0.0000000443832349, 0.954889119, 0.0000000572260639, 0.296962529);
	local myPos = HumanoidRootPart.CFrame;
	if (myPos.Position - Pos1.Position).Magnitude <= 3 then
		useAllSkill();
	else
		TweenPlayer(Pos1);
	end;
	if (myPos.Position - Pos2.Position).Magnitude <= 3 then
		useAllSkill();
	else
		TweenPlayer(Pos2);
	end;
	if (myPos.Position - Pos3.Position).Magnitude <= 3 then
		useAllSkill();
	else
		TweenPlayer(Pos3);
	end;
	if (myPos.Position - Pos4.Position).Magnitude <= 3 then
		useAllSkill();
	else
		TweenPlayer(Pos4);
	end;
end;
DoneSkillGun = false;
DoneSkillSword = false;
DoneSkillFruit = false;
DoneSkillMelee = false;
function useAllSkill()
	if DoneSkillFruit == false then
		EquipWeapon(getWeapon("Blox Fruit"))
		sendKeyEvent("Z")
		sendKeyEvent("X")
		sendKeyEvent("C")
		sendKeyEvent("V")
		sendKeyEvent("F")
		DoneSkillFruit = true;
	end;
	if DoneSkillMelee == false then
		EquipWeapon(getWeapon("Melee"))
		sendKeyEvent("Z")
		sendKeyEvent("X")
		sendKeyEvent("C")
		sendKeyEvent("V")
		DoneSkillMelee = true;
	end;
	if DoneSkillSword == false then
		EquipWeapon(getWeapon("Sword"))
		sendKeyEvent("Z")
		sendKeyEvent("X")
		DoneSkillSword = true;
	end;
	if DoneSkillGun == false then
		EquipWeapon(getWeapon("Gun"))
		sendKeyEvent("Z")
		sendKeyEvent("X")
		DoneSkillGun = true;
	end;
	DoneSkillGun = false;
	DoneSkillSword = false;
	DoneSkillFruit = false;
	DoneSkillMelee = false;
end;
spawn(function()
	while wait() do
		wait(0.2);
		if _G.AutoFarmBlazeEmber then
			pcall(function()
				if (Workspace:WaitForChild("EmberTemplate")):FindFirstChild("Part") then
					CollectBlazeEmber();
				end;
			end);
		end;
	end;
end);
CraftVolcanicMagnetButton = DragonDojoSection:Button({
	Title = "Craft Volcanic Magnet",
	Callback = function()
		Remotes:WaitForChild("CommF_"):InvokeServer("CraftItem", "Craft", "Volcanic Magnet");
	end
});
local SailBoatSection = Tabs.SeaEventTab:Section({
	Title = "Sail Boat",
	TextXAlignment = "Left"
});
local BoatList = {
	"Guardian",
	"Beast Hunter",
	"PirateGrandBrigade",
	"MarineGrandBrigade",
	"PirateBrigade",
	"MarineBrigade",
	"PirateSloop",
	"MarineSloop"
};
local ZoneList = {
	"Zone 1",
	"Zone 2",
	"Zone 3",
	"Zone 4",
	"Zone 5",
	"Zone 6",
	"Infinite"
};
ChooseBoatDropdown = SailBoatSection:Dropdown({
	Title = "Choose Boat",
	Values = BoatList,
	Value = "Guardian",
	Callback = function(option)
		_G.SelectedBoat = option;
	end
});
Config:Register("ChooseBoatDropdown", ChooseBoatDropdown);
ChooseZoneDropdown = SailBoatSection:Dropdown({
	Title = "Choose Zone",
	Values = ZoneList,
	Value = "Zone 5",
	Callback = function(option)
		_G.SelectedZone = option;
	end
});
Config:Register("ChooseZoneDropdown", ChooseZoneDropdown);
BoatTweenSpeedSlider = SailBoatSection:Slider({
	Title = "Boat Tween Speed",
	Step = 1,
	Value = {
		Min = 50,
		Max = 350,
		Value = 300
	},
	Callback = function(value)
		_G.BoatTweenSpeed = value;
	end
});
BoatTweenSpeedSlider:Set(300);
Config:Register("BoatTweenSpeedSlider", BoatTweenSpeedSlider);
AutoSailBoatToggle = SailBoatSection:Toggle({
	Title = "Sail Boat",
	Desc = "Auto Sail Boat & Kill Enemies",
	Value = false,
	Callback = function(state)
		_G.SailBoat = state;
		StopTween(_G.SailBoat);
		if not _G.SailBoat then
			_G.SeaSkill = false;
			Skillaimbot = false;
		end;
	end
});
Config:Register("AutoSailBoatToggle", AutoSailBoatToggle);
local CFrameSelectedZone;
spawn(function()
	pcall(function()
		while wait(0.2) do
			if _G.SelectedZone == "Zone 1" then
				CFrameSelectedZone = CFrame.new(-21998.375, 30.0006084, -682.309143, 0.120013528, 0.00690158736, 0.99274826, -0.0574118942, 0.998350561, -0.000000000236509201, -0.991110802, -0.0569955558, 0.120211802);
			elseif _G.SelectedZone == "Zone 2" then
				CFrameSelectedZone = CFrame.new(-26779.5215, 30.0005474, -822.858032, 0.307457417, 0.019647358, 0.951358974, -0.0637726262, 0.997964442, -0.000000000415334017, -0.949422479, -0.0606706589, 0.308084518);
			elseif _G.SelectedZone == "Zone 3" then
				CFrameSelectedZone = CFrame.new(-31171.957, 30.0001011, -2256.93774, 0.37637493, 0.0150483791, 0.926345229, -0.0399504974, 0.999201655, 0.0000000000270896673, -0.925605655, -0.0370079502, 0.376675636);
			elseif _G.SelectedZone == "Zone 4" then
				CFrameSelectedZone = CFrame.new(-34054.6875, 30.2187767, -2560.12012, 0.0935864747, -0.00122954219, 0.995610416, 0.0624034069, 0.998040259, -0.00463332096, -0.993653536, 0.062563099, 0.0934797972);
			elseif _G.SelectedZone == "Zone 5" then
				CFrameSelectedZone = CFrame.new(-38887.5547, 30.0004578, -2162.99023, -0.188895494, -0.00704088295, 0.981971979, -0.0372481011, 0.999306023, -0.00000000139882339, -0.981290519, -0.0365765914, -0.189026669);
			elseif _G.SelectedZone == "Zone 6" then
				CFrameSelectedZone = CFrame.new(-44541.7617, 30.0003204, -1244.8584, -0.0844199061, -0.00553312758, 0.9964149, -0.0654025897, 0.997858942, 0.000000000202319411, -0.99428153, -0.0651681125, -0.0846010372);
			elseif _G.SelectedZone == "Infinite" then
				CFrameSelectedZone = CFrame.new(-148073.359, 8.99999523, 7721.05078, -0.0825930536, -0.00000154416148, 0.996583343, -0.000018696026, 1, -0.000000000000391858095, -0.996583343, -0.0000186321486, -0.0825930536);
			end;
		end;
	end);
end);
function CheckBoat()
	for i, v in pairs(Workspace.Boats:GetChildren()) do
		if v.Name == _G.SelectedBoat then
			for _, child in pairs(v:GetChildren()) do
				if child.Name == "MyBoatEsp" then
					return v;
				end;
			end;
		end;
	end;
	return false;
end;
function CheckEnemiesBoat()
	if Enemies:FindFirstChild("FishBoat") or Enemies:FindFirstChild("PirateBrigade") or Enemies:FindFirstChild("PirateGrandBrigade") then
		return true;
	end;
	return false;
end;
function CheckShark()
	for i, v in pairs(Enemies:GetChildren()) do
		if v.Name == "Shark" and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
			if Enemies:FindFirstChild("Shark") then
				if (v.HumanoidRootPart.Position - HumanoidRootPart.Position).Magnitude <= 200 then
					return true;
				end;
			end;
		end;
	end;
	return false;
end;
function CheckPiranha()
	for i, v in pairs(Enemies:GetChildren()) do
		if v.Name == "Piranha" and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
			if Enemies:FindFirstChild("Piranha") then
				if (v.HumanoidRootPart.Position - HumanoidRootPart.Position).Magnitude <= 200 then
					return true;
				end;
			end;
		end;
	end;
	return false;
end;
function AddEsp(Name, Parent)
	local BillboardGui = Instance.new("BillboardGui");
	BillboardGui.Parent = Parent;
	BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
	BillboardGui.Active = true;
	BillboardGui.Name = Name;
	BillboardGui.AlwaysOnTop = true;
	BillboardGui.LightInfluence = 1;
	BillboardGui.Size = UDim2.new(0, 200, 0, 50);
	BillboardGui.StudsOffset = Vector3.new(0, 2.5, 0);
	local TextLabel = Instance.new("TextLabel");
	TextLabel.Parent = BillboardGui;
	TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
	TextLabel.BackgroundTransparency = 1;
	TextLabel.Size = UDim2.new(1, 0, 1, 0);
	TextLabel.Font = Enum.Font.GothamBold;
	TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255);
	TextLabel.TextSize = 15;
	TextLabel.Text = "";
end;
spawn(function()
	while wait() do
		wait(0.2);
		pcall(function()
			if _G.SailBoat then
				if not CheckBoat() then
					local BuyBoatCFrame = CFrame.new(-16927.451171875, 9.0863618850708, 433.8642883300781);
					if (BuyBoatCFrame.Position - HumanoidRootPart.Position).Magnitude > 2000 then
						BTP(BuyBoatCFrame);
					else
						BuyBoat = TweenPlayer(BuyBoatCFrame);
					end;
					if ((CFrame.new((-16927.451171875), 9.0863618850708, 433.8642883300781)).Position - HumanoidRootPart.Position).Magnitude <= 10 then
						if BuyBoat then
							BuyBoat:Stop();
						end;
						Remotes.CommF_:InvokeServer("BuyBoat", _G.SelectedBoat);
						for i, v in pairs(Workspace.Boats:GetChildren()) do
							if v.Name == _G.SelectedBoat then
								if (v.VehicleSeat.CFrame.Position - HumanoidRootPart.Position).Magnitude <= 100 then
									AddEsp("MyBoatEsp", v);
								end;
							end;
						end;
						wait(1);
					end;
				elseif CheckBoat() then
					for i, v in pairs(Workspace.Boats:GetChildren()) do
						if v.Name == _G.SelectedBoat then
							if v:FindFirstChild("MyBoatEsp") then
								if (Character:WaitForChild("Humanoid")).Sit == false then
									if CheckShark() and _G.AutoFarmShark or Enemies:FindFirstChild("Terrorshark") and _G.AutoFarmTerrorshark or CheckPiranha() and _G.AutoFarmPiranha or Enemies:FindFirstChild("Fish Crew Member") and _G.AutoFarmFishCrewMember or Enemies:FindFirstChild("FishBoat") and _G.AutoFarmGhostShip or Enemies:FindFirstChild("PirateBrigade") and _G.AutoFarmPirateBrigade or Enemies:FindFirstChild("PirateGrandBrigade") and _G.AutoFarmPirateGrandBrigade or CheckSeaBeast() and _G.AutoFarmSeabeast then
										if stoppos then
											stoppos:Stop();
										end;
									else
										stoppos = TweenPlayer(v.VehicleSeat.CFrame * CFrame.new(0, 1, 0));
									end;
								else
									repeat
										wait();
										StopTweenBoat = TweenBoat(CFrameSelectedZone);
									until CheckShark() and _G.AutoFarmShark or Enemies:FindFirstChild("Terrorshark") and _G.AutoFarmTerrorshark or CheckPiranha() and _G.AutoFarmPiranha or Enemies:FindFirstChild("Fish Crew Member") and _G.AutoFarmFishCrewMember or Enemies:FindFirstChild("FishBoat") and _G.AutoFarmGhostShip or Enemies:FindFirstChild("PirateBrigade") and _G.AutoFarmPirateBrigade or Enemies:FindFirstChild("PirateGrandBrigade") and _G.AutoFarmPirateGrandBrigade or CheckSeaBeast() and _G.AutoFarmSeabeast or (Character:WaitForChild("Humanoid")).Sit == false or _G.SailBoat == false;
									if StopTweenBoat then
										StopTweenBoat:Stop();
									end;
									(game:GetService("VirtualInputManager")):SendKeyEvent(true, 32, false, game);
									wait(0.1);
									(game:GetService("VirtualInputManager")):SendKeyEvent(false, 32, false, game);
								end;
							end;
						end;
					end;
				end;
			end;
		end);
	end;
end);
spawn(function()
	pcall(function()
		while wait() do
			wait(0.2);
			if _G.SailBoat then
				if CheckShark() and _G.AutoFarmShark or Enemies:FindFirstChild("Terrorshark") and _G.AutoFarmTerrorshark or CheckPiranha() and _G.AutoFarmPiranha or Enemies:FindFirstChild("Fish Crew Member") and _G.AutoFarmFishCrewMember or Enemies:FindFirstChild("FishBoat") and _G.AutoFarmGhostShip or Enemies:FindFirstChild("PirateBrigade") and _G.AutoFarmPirateBrigade or Enemies:FindFirstChild("PirateGrandBrigade") and _G.AutoFarmPirateGrandBrigade or CheckSeaBeast() and _G.AutoFarmSeabeast then
					if Character.Humanoid.Sit == true then
						(game:GetService("VirtualInputManager")):SendKeyEvent(true, 32, false, game);
						wait(0.1);
						(game:GetService("VirtualInputManager")):SendKeyEvent(false, 32, false, game);
					end;
				end;
			end;
		end;
	end);
end);
spawn(function()
	while wait() do
		wait(0.2);
		if _G.SailBoat then
			pcall(function()
				if _G.SailBoat and Enemies:FindFirstChild("Fish Crew Member") and _G.AutoFarmFishCrewMember then
					for i, v in pairs(Enemies:GetChildren()) do
						if Enemies:FindFirstChild("Fish Crew Member") then
							if v.Name == "Fish Crew Member" then
								if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
									repeat
										RunService.Heartbeat:wait();
										AutoHaki();
										EquipWeapon(_G.SelectedWeapon);
										TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
										_G.SeaSkill = false;
										Attack();
									until not _G.AutoFarmFishCrewMember or (not v.Parent) or v.Humanoid.Health <= 0;
								end;
							end;
						end;
					end;
				elseif _G.SailBoat and Enemies:FindFirstChild("FishBoat") and _G.AutoFarmGhostShip then
					for i, v in pairs(Enemies:GetChildren()) do
						if Enemies:FindFirstChild("FishBoat") then
							repeat
								RunService.Heartbeat:wait();
								local BoatCFrame = v.Engine.CFrame;
								if (BoatCFrame.Position - HumanoidRootPart.Position).Magnitude <= 50 then
									_G.SeaSkill = true;
								else
									_G.SeaSkill = false;
								end;
								TweenPlayer(BoatCFrame);
								AutoHaki();
								Skillaimbot = true;
								AimSkill = v.Engine.CFrame * CFrame.new(0, (-15), 0);
								AimBotSkillPosition = AimSkill.Position;
							until not v.Parent or v.Health < 0 or (not Enemies:FindFirstChild("FishBoat")) or (not v:FindFirstChild("Engine")) or (not _G.AutoFarmGhostShip);
							Skillaimbot = false;
							_G.SeaSkill = false;
						end;
					end;
				elseif _G.SailBoat and Enemies:FindFirstChild("PirateGrandBrigade") and _G.AutoFarmPirateGrandBrigade then
					for i, v in pairs(Enemies:GetChildren()) do
						if Enemies:FindFirstChild("PirateGrandBrigade") then
							repeat
								RunService.Heartbeat:wait();
								local BoatCFrame = v.Engine.CFrame;
								AutoHaki();
								if (BoatCFrame.Position - HumanoidRootPart.Position).Magnitude <= 50 then
									_G.SeaSkill = true;
								else
									_G.SeaSkill = false;
								end;
								TweenPlayer(BoatCFrame);
								Skillaimbot = true;
								AimSkill = v.Engine.CFrame * CFrame.new(0, (-15), 0);
								AimBotSkillPosition = AimSkill.Position;
							until not v.Parent or v.Health.Value < 0 or (not Enemies:FindFirstChild("PirateGrandBrigade")) or (not v:FindFirstChild("Engine")) or (not _G.AutoFarmPirateGrandBrigade);
							Skillaimbot = false;
							_G.SeaSkill = false;
						end;
					end;
				elseif _G.SailBoat and Enemies:FindFirstChild("PirateBrigade") and _G.AutoFarmPirateBrigade then
					for i, v in pairs(Enemies:GetChildren()) do
						if Enemies:FindFirstChild("PirateBrigade") then
							repeat
								RunService.Heartbeat:wait();
								local BoatCFrame = v.Engine.CFrame;
								if (BoatCFrame.Position - HumanoidRootPart.Position).Magnitude <= 50 then
									_G.SeaSkill = true;
								else
									_G.SeaSkill = false;
								end;
								TweenPlayer(BoatCFrame);
								Skillaimbot = true;
								AutoHaki();
								AimSkill = v.Engine.CFrame * CFrame.new(0, (-15), 0);
								AimBotSkillPosition = AimSkill.Position;
							until not v.Parent or v.Health.Value < 0 or (not Enemies:FindFirstChild("PirateBrigade")) or (not v:FindFirstChild("Engine")) or (not _G.AutoFarmPirateBrigade);
							Skillaimbot = false;
							_G.SeaSkill = false;
						end;
					end;
				elseif _G.SailBoat and CheckSeaBeast() and _G.AutoFarmSeabeast then
					if Workspace:FindFirstChild("SeaBeasts") then
						for i, v in pairs(Workspace.SeaBeasts:GetChildren()) do
							if CheckSeaBeast() then
								repeat
									RunService.Heartbeat:wait();
									CFrameSeaBeast = v.HumanoidRootPart.CFrame * CFrame.new(0, 400, 0);
									if (CFrameSeaBeast.Position - HumanoidRootPart.CFrame.Position).Magnitude <= 400 then
										_G.SeaSkill = true;
									else
										_G.SeaSkill = false;
									end;
									AutoHaki();
									Skillaimbot = true;
									AimBotSkillPosition = v.HumanoidRootPart.CFrame.Position;
									if DodgeSeabeasts() then
										TweenPlayer(v.HumanoidRootPart.CFrame * CFrame.new(math.random((-200), 300), 400, math.random((-200), 300)));
									else
										TweenPlayer(v.HumanoidRootPart.CFrame * CFrame.new(0, 400, 0));
									end;
								until not _G.AutoFarmSeabeast or CheckSeaBeast() == false or (not v:FindFirstChild("Humanoid")) or (not v:FindFirstChild("HumanoidRootPart")) or v.Humanoid.Health <= 0 or (not v.Parent);
								Skillaimbot = false;
								_G.SeaSkill = false;
							else
								Skillaimbot = false;
								_G.SeaSkill = false;
							end;
						end;
					end;
				elseif _G.SailBoat and Enemies:FindFirstChild("Terrorshark") and _G.AutoFarmTerrorshark then
					for i, v in pairs(Enemies:GetChildren()) do
						if Enemies:FindFirstChild("Terrorshark") then
							if v.Name == "Terrorshark" then
								if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
									repeat
										RunService.Heartbeat:wait();
										AutoHaki();
										EquipWeapon(_G.SelectedWeapon);
										_G.SeaSkill = false;
										Attack();
										TweenPlayer(v.HumanoidRootPart.CFrame * CFrame.new(0, 50, 0));
									until not _G.AutoFarmTerrorshark or (not v.Parent) or v.Humanoid.Health <= 0;
								end;
							end;
						end;
					end;
				elseif _G.SailBoat and CheckPiranha() and _G.AutoFarmPiranha then
					for i, v in pairs(Enemies:GetChildren()) do
						if Enemies:FindFirstChild("Piranha") then
							if v.Name == "Piranha" then
								if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
									repeat
										RunService.Heartbeat:wait();
										AutoHaki();
										EquipWeapon(_G.SelectedWeapon);
										TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
										_G.SeaSkill = false;
										Attack();
									until not _G.AutoFarmPiranha or (not v.Parent) or v.Humanoid.Health <= 0;
								end;
							end;
						end;
					end;
				elseif _G.SailBoat and CheckShark() and _G.AutoFarmShark then
					for i, v in pairs(Enemies:GetChildren()) do
						if Enemies:FindFirstChild("Shark") then
							if v.Name == "Shark" then
								if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
									repeat
										RunService.Heartbeat:wait();
										AutoHaki();
										EquipWeapon(_G.SelectedWeapon);
										TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
										_G.SeaSkill = false;
										Attack();
									until not _G.AutoFarmShark or (not v.Parent) or v.Humanoid.Health <= 0;
								end;
							end;
						end;
					end;
				else
					Skillaimbot = false;
					_G.SeaSkill = false;
					UnEquipWeapon(_G.SelectedWeapon);
				end;
			end);
		end;
	end;
end);
function DodgeSeabeasts()
	local seaBeastsFolder = Workspace.SeaBeasts;
	for _, seaBeast in pairs(seaBeastsFolder:GetChildren()) do
		if seaBeast:FindFirstChild("Humanoid") and seaBeast:FindFirstChild("Anims") then
			local humanoid = seaBeast.Humanoid;
			local animator = humanoid:FindFirstChildOfClass("Animator") or humanoid;
			for _, anim in pairs(seaBeast.Anims:GetChildren()) do
				if anim:IsA("Animation") then
					if anim.AnimationId == "rbxassetid://8708221792" or anim.AnimationId == "rbxassetid://8708222556" or anim.AnimationId == "rbxassetid://8708223619" or anim.AnimationId == "rbxassetid://8708225668" then
						for _, animationTrack in pairs(animator:GetPlayingAnimationTracks()) do
							if animationTrack.Animation.AnimationId == anim.AnimationId then
								if animationTrack.IsPlaying then
									return true;
								else
									return false;
								end;
							end;
						end;
					end;
				end;
			end;
		end;
	end;
end;
SeaEventEnemiesSection = Tabs.SeaEventTab:Section({
	Title = "Enemies",
	TextXAlignment = "Left"
});
AutoFarmSharkToggle = SeaEventEnemiesSection:Toggle({
	Title = "Auto Farm Shark",
	Value = false,
	Callback = function(state)
		_G.AutoFarmShark = state;
		StopTween(_G.AutoFarmShark);
	end
});
Config:Register("AutoFarmSharkToggle", AutoFarmSharkToggle);
AutoFarmPiranhaToggle = SeaEventEnemiesSection:Toggle({
	Title = "Auto Farm Piranha",
	Value = false,
	Callback = function(state)
		_G.AutoFarmPiranha = state;
		StopTween(_G.AutoFarmPiranha);
	end
});
Config:Register("AutoFarmPiranhaToggle", AutoFarmPiranhaToggle);
AutoFarmFishCrewMemberToggle = SeaEventEnemiesSection:Toggle({
	Title = "Auto Farm Fish Crew Member",
	Value = false,
	Callback = function(state)
		_G.AutoFarmFishCrewMember = state;
		StopTween(_G.AutoFarmFishCrewMember);
	end
});
Config:Register("AutoFarmFishCrewMemberToggle", AutoFarmFishCrewMemberToggle);
SeaEventBoatSection = Tabs.SeaEventTab:Section({
	Title = "Boat",
	TextXAlignment = "Left"
});
AutoFarmGhostShipToggle = SeaEventBoatSection:Toggle({
	Title = "Auto Farm Ghost Ship",
	Value = false,
	Callback = function(state)
		_G.AutoFarmGhostShip = state;
		StopTween(_G.AutoFarmGhostShip);
	end
});
Config:Register("AutoFarmGhostShipToggle", AutoFarmGhostShipToggle);
AutoFarmPirateBrigadeToggle = SeaEventBoatSection:Toggle({
	Title = "Auto Farm Pirate Brigade",
	Value = false,
	Callback = function(state)
		_G.AutoFarmPirateBrigade = state;
		StopTween(_G.AutoFarmPirateBrigade);
	end
});
Config:Register("AutoFarmPirateBrigadeToggle", AutoFarmPirateBrigadeToggle);
AutoFarmPirateGrandBrigadeToggle = SeaEventBoatSection:Toggle({
	Title = "Auto Farm Pirate Grand Brigade",
	Value = false,
	Callback = function(state)
		_G.AutoFarmPirateGrandBrigade = state;
		StopTween(_G.AutoFarmPirateGrandBrigade);
	end
});
Config:Register("AutoFarmPirateGrandBrigadeToggle", AutoFarmPirateGrandBrigadeToggle);
SeaEventBossSection = Tabs.SeaEventTab:Section({
	Title = "Boss",
	TextXAlignment = "Left"
});
AutoFarmTerrorsharkToggle = SeaEventBossSection:Toggle({
	Title = "Auto Farm Terrorshark",
	Value = false,
	Callback = function(state)
		_G.AutoFarmTerrorshark = state;
		StopTween(_G.AutoFarmTerrorshark);
	end
});
Config:Register("AutoFarmTerrorsharkToggle", AutoFarmTerrorsharkToggle);
AutoFarmSeabeastsToggle = SeaEventBossSection:Toggle({
	Title = "Auto Farm Seabeasts",
	Value = false,
	Callback = function(state)
		_G.AutoFarmSeabeast = state;
		StopTween(_G.AutoFarmSeabeast);
	end
});
Config:Register("AutoFarmSeabeastsToggle", AutoFarmSeabeastsToggle);
PrehistoricSection = Tabs.SeaStackTab:Section({
	Title = "Prehistoric",
	TextXAlignment = "Left"
});
spawn(function()
	pcall(function()
		while wait(0.2) do
			if Workspace._WorldOrigin.Locations:FindFirstChild("Mirage Island") then
				MirageStatusParagraph:SetDesc("🏝️ Mirage Island Spawned");
			else
				MirageStatusParagraph:SetDesc("🏝️ Mirage Island Not Spawn");
			end;
			if Workspace._WorldOrigin.Locations:FindFirstChild("Kitsune Island") then
				KitsuneStatusParagraph:SetDesc("⛩️ Kitsune Island Spawned");
			else
				KitsuneStatusParagraph:SetDesc("⛩️ Kitsune Island Not Spawn");
			end;
			if Workspace._WorldOrigin.Locations:FindFirstChild("Frozen Dimension") then
				FrozenStatusParagraph:SetDesc("❄️ Frozen Dimension Spawned");
			else
				FrozenStatusParagraph:SetDesc("❄️ Frozen Dimension Not Spawn");
			end;
			if Workspace._WorldOrigin.Locations:FindFirstChild("Prehistoric Island") then
				PrehistoricStatusParagraph:SetDesc("🦴 Prehistoric Island Spawned");
			else
				PrehistoricStatusParagraph:SetDesc("🦴 Prehistoric Island Not Spawn");
			end;
		end;
	end);
end);
PrehistoricStatusSeaStackParagraph = PrehistoricSection:Paragraph({
	Title = "Prehistoric Status",
	Desc = "N/A"
});
AutoSummonPrehistoricIslandToggle = PrehistoricSection:Toggle({
	Title = "Summon Prehistoric Island",
	Desc = "Need Volcanic Magnet",
	Value = false,
	Callback = function(state)
		_G.SummonPrehistoricIsland = state;
		StopTween(_G.SummonPrehistoricIsland);
	end
});
Config:Register("AutoSummonPrehistoricIslandToggle", AutoSummonPrehistoricIslandToggle);
spawn(function()
	while wait() do
		wait(0.2);
		pcall(function()
			if _G.SummonPrehistoricIsland and World3 then
				if not Workspace.Boats:FindFirstChild(_G.SelectedBoat) then
					local BuyBoatCFrame = CFrame.new(-16927.451171875, 9.0863618850708, 433.8642883300781);
					if (BuyBoatCFrame.Position - HumanoidRootPart.Position).Magnitude > 2000 then
						BTP(BuyBoatCFrame);
					else
						BuyBoat = TweenPlayer(BuyBoatCFrame);
					end;
					if ((CFrame.new((-16927.451171875), 9.0863618850708, 433.8642883300781)).Position - HumanoidRootPart.Position).Magnitude <= 10 then
						if BuyBoat then
							BuyBoat:Stop();
						end;
						Remotes.CommF_:InvokeServer("BuyBoat", _G.SelectedBoat);
						wait(1);
					end;
				elseif Workspace.Boats:FindFirstChild(_G.SelectedBoat) then
					repeat
						wait();
						if (Character:WaitForChild("Humanoid")).Sit == false then
							if TweenBoatPrehistoric then
								TweenBoatPrehistoric:Stop();
							end;
							local stoppos = TweenPlayer((Workspace.Boats:FindFirstChild(_G.SelectedBoat)).VehicleSeat.CFrame * CFrame.new(0, 1, 0));
						elseif (Character:WaitForChild("Humanoid")).Sit == true then
							TweenBoatPrehistoric = TweenBoat(CFrame.new(-148073.359, 8.99999523, 7721.05078, -0.0825930536, -0.00000154416148, 0.996583343, -0.000018696026, 1, -0.000000000000391858095, -0.996583343, -0.0000186321486, -0.0825930536));
						end;
					until not _G.SummonPrehistoricIsland or Workspace._WorldOrigin.Locations:FindFirstChild("Prehistoric Island");
					if TweenBoatPrehistoric then
						TweenBoatPrehistoric:Stop();
					end;
				end;
			end;
		end);
	end;
end);
TweenToPrehistoricIslandToggle = PrehistoricSection:Toggle({
	Title = "Tween To Prehistoric Island",
	Desc = "Need Spawn",
	Value = false,
	Callback = function(state)
		_G.TweenToPrehistoricIsland = state;
		StopTween(_G.TweenToPrehistoricIsland);
	end
});
Config:Register("TweenToPrehistoricIslandToggle", TweenToPrehistoricIslandToggle);
spawn(function()
	while wait() do
		wait(0.2);
		if _G.TweenToPrehistoricIsland then
			pcall(function()
				if Workspace._WorldOrigin.Locations:FindFirstChild("Prehistoric Island") then
					TweenPlayer((Workspace._WorldOrigin.Locations:FindFirstChild("Prehistoric Island")).CFrame);
				end;
			end);
		end;
	end;
end);
AutoKillLavaGolemToggle = PrehistoricSection:Toggle({
	Title = "Auto Kill Lava Golem",
	Value = false,
	Callback = function(state)
		_G.AutoKillLavaGolem = state;
		StopTween(_G.AutoKillLavaGolem);
	end
});
spawn(function()
	while wait() do
		wait(0.2);
		if _G.AutoKillLavaGolem and World3 then
			pcall(function()
				if Enemies:FindFirstChild("Lava Golem") then
					for i, v in pairs(Enemies:GetChildren()) do
						if v.Name == "Lava Golem" then
							if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
								repeat
									RunService.Heartbeat:wait();
									AutoHaki();
									EquipWeapon(_G.SelectedWeapon);
									v.Humanoid.WalkSpeed = 0;
									v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
									PosMon = v.HumanoidRootPart.CFrame;
									MonFarm = v.Name;
									TweenPlayer(v.HumanoidRootPart.CFrame * Pos);
									Attack();
								until not _G.AutoKillLavaGolem or (not v.Parent) or v.Humanoid.Health <= 0;
							end;
						end;
					end;
				end;
			end);
		end;
	end;
end);
FrozenDimensionSection = Tabs.SeaStackTab:Section({
	Title = "Frozen Dimension",
	TextXAlignment = "Left"
})
FrozenStatusParagraph = FrozenDimensionSection:Paragraph({
	Title = "Frozen Status",
	Desc = "N/A"
});
AutoSummonFrozenDimensionToggle = FrozenDimensionSection:Toggle({
	Title = "Summon Frozen Dimension",
	Value = false,
	Callback = function(state)
		_G.SummonForzenDimension = state;
		StopTween(_G.SummonForzenDimension);
	end
});
Config:Register("AutoSummonFrozenDimensionToggle", AutoSummonFrozenDimensionToggle);
spawn(function()
	while wait() do
		wait(0.2);
		pcall(function()
			if _G.SummonForzenDimension and World3 then
				if not Workspace.Boats:FindFirstChild(_G.SelectedBoat) then
					local BuyBoatCFrame = CFrame.new(-16927.451171875, 9.0863618850708, 433.8642883300781);
					if (BuyBoatCFrame.Position - HumanoidRootPart.Position).Magnitude > 2000 then
						BTP(BuyBoatCFrame);
					else
						BuyBoat = TweenPlayer(BuyBoatCFrame);
					end;
					if ((CFrame.new((-16927.451171875), 9.0863618850708, 433.8642883300781)).Position - HumanoidRootPart.Position).Magnitude <= 10 then
						if BuyBoat then
							BuyBoat:Stop();
						end;
						Remotes.CommF_:InvokeServer("BuyBoat", _G.SelectedBoat);
						wait(1);
					end;
				elseif Workspace.Boats:FindFirstChild(_G.SelectedBoat) then
					repeat
						wait();
						if (Character:WaitForChild("Humanoid")).Sit == false then
							if TweenBoatFrozen then
								TweenBoatFrozen:Stop();
							end;
							local stoppos = TweenPlayer((Workspace.Boats:FindFirstChild(_G.SelectedBoat)).VehicleSeat.CFrame * CFrame.new(0, 1, 0));
						elseif (Character:WaitForChild("Humanoid")).Sit == true then
							TweenBoatFrozen = TweenBoat(CFrame.new(-148073.359, 8.99999523, 7721.05078, -0.0825930536, -0.00000154416148, 0.996583343, -0.000018696026, 1, -0.000000000000391858095, -0.996583343, -0.0000186321486, -0.0825930536));
						end;
					until not _G.SummonForzenDimension or Workspace._WorldOrigin.Locations:FindFirstChild("Frozen Dimension");
					if TweenBoatFrozen then
						TweenBoatFrozen:Stop();
					end;
				end;
			end;
		end);
	end;
end);
TweenToFrozenDimensionToggle = FrozenDimensionSection:Toggle({
	Title = "Tween To Frozen Dimension",
	Value = false,
	Callback = function(state)
		_G.TweenToFrozenDimension = state;
		StopTween(_G.TweenToFrozenDimension);
	end
});
Config:Register("TweenToFrozenDimensionToggle", TweenToFrozenDimensionToggle);
spawn(function()
	while wait() do
		wait(0.2);
		if _G.TweenToFrozenDimension then
			pcall(function()
				repeat
					wait();
					TweenPlayer((Workspace._WorldOrigin.Locations:FindFirstChild("Frozen Dimension")).CFrame);
				until not _G.TweenToFrozenDimension;
			end);
		end;
	end;
end);
BribeLeviathanStatusParagraph = FrozenDimensionSection:Paragraph({
	Title = "Leviathan Status",
	Desc = "0"
});
BribeLeviathanButton = FrozenDimensionSection:Button({
	Title = "Bribe Leviathan",
	Callback = function()
		local Status = Remotes.CommF_:InvokeServer("InfoLeviathan", "2");
		BribeLeviathanStatusParagraph:SetDesc(Status);
	end
});
KitsuneIslandSection = Tabs.SeaStackTab:Section({
	Title = "Kitsune Island",
	TextXAlignment = "Left"
})
KitsuneStatusParagraph = KitsuneIslandSection:Paragraph({
	Title = "Kitsune Status",
	Desc = "N/A"
});
AutoSummonKitsuneIslandToggle = KitsuneIslandSection:Toggle({
	Title = "Summon Kitsune Island",
	Value = false,
	Callback = function(state)
		_G.SummonKitsuneIsland = state;
		StopTween(_G.SummonKitsuneIsland);
	end
});
Config:Register("AutoSummonKitsuneIslandToggle", AutoSummonKitsuneIslandToggle);
TweenToKitsuneIslandToggle = KitsuneIslandSection:Toggle({
	Title = "Tween To Kitsune Island",
	Value = false,
	Callback = function(state)
		_G.TweenToKitsuneIsland = state;
		StopTween(_G.TweenToKitsuneIsland);
	end
});
Config:Register("TweenToKitsuneIslandToggle", TweenToKitsuneIslandToggle);
spawn(function()
	while wait() do
		wait(0.2);
		if _G.TweenToKitsuneIsland and World3 then
			if Workspace.Map:FindFirstChild("KitsuneIsland") then
				TweenPlayer(Workspace.Map.KitsuneIsland.ShrineActive.NeonShrinePart.CFrame * CFrame.new(0, 0, 10));
			end;
		end;
	end;
end);
spawn(function()
	while wait() do
		wait(0.2);
		pcall(function()
			if _G.SummonKitsuneIsland and World3 then
				if not Workspace.Boats:FindFirstChild(_G.SelectedBoat) then
					local BuyBoatCFrame = CFrame.new(-16927.451171875, 9.0863618850708, 433.8642883300781);
					if (BuyBoatCFrame.Position - HumanoidRootPart.Position).Magnitude > 2000 then
						BTP(BuyBoatCFrame);
					else
						BuyBoatKitsune = TweenPlayer(BuyBoatCFrame);
					end;
					if ((CFrame.new((-16927.451171875), 9.0863618850708, 433.8642883300781)).Position - HumanoidRootPart.Position).Magnitude <= 10 then
						if BuyBoatKitsune then
							BuyBoatKitsune:Stop();
						end;
						Remotes.CommF_:InvokeServer("BuyBoat", _G.SelectedBoat);
						wait(1);
					end;
				elseif Workspace.Boats:FindFirstChild(_G.SelectedBoat) then
					repeat
						wait();
						if (Character:WaitForChild("Humanoid")).Sit == false then
							if TweenBoatKitsune then
								TweenBoatKitsune:Stop();
							end;
							local stoppos = TweenPlayer((Workspace.Boats:FindFirstChild(_G.SelectedBoat)).VehicleSeat.CFrame * CFrame.new(0, 1, 0));
						elseif (Character:WaitForChild("Humanoid")).Sit == true then
							TweenBoatKitsune = TweenBoat(CFrame.new(-44541.7617, 30.0003204, -1244.8584, -0.0844199061, -0.00553312758, 0.9964149, -0.0654025897, 0.997858942, 0.000000000202319411, -0.99428153, -0.0651681125, -0.0846010372));
						end;
					until not _G.SummonKitsuneIsland or Workspace._WorldOrigin.Locations:FindFirstChild("Kitsune Island");
					if TweenBoatKitsune then
						TweenBoatKitsune:Stop();
					end;
				end;
			end;
		end);
	end;
end);
AutoCollectAzureEmberToggle = KitsuneIslandSection:Toggle({
	Title = "Auto Collect Azure Ember",
	Value = false,
	Callback = function(state)
		_G.AutoCollectAzureEmber = state;
	end
});
Config:Register("AutoCollectAzureEmberToggle", AutoCollectAzureEmberToggle);
spawn(function()
	while wait() do
		wait(0.2);
		if _G.AutoCollectAzureEmber and World3 then
			pcall(function()
				if Workspace:FindFirstChild("AttachedAzureEmber") then
					TweenPlayer(((Workspace:WaitForChild("EmberTemplate")):FindFirstChild("Part")).CFrame);
				end;
			end);
		end;
	end;
end);
SetAzureEmberSlider = KitsuneIslandSection:Slider({
	Title = "Set Azure Ember",
	Step = 1,
	Value = {
		Min = 1,
		Max = 25,
		Value = 20
	},
	Callback = function(value)
		_G.SetAzureEmber = value;
	end
});
SetAzureEmberSlider:Set(25)
Config:Register("SetAzureEmberSlider", SetAzureEmberSlider);
AutoTradeAzureEmberToggle = KitsuneIslandSection:Toggle({
	Title = "Auto Trade Azure Ember",
	Value = false,
	Callback = function(state)
		_G.AutoTradeAzureEmber = state;
	end
});
Config:Register("AutoTradeAzureEmberToggle", AutoTradeAzureEmberToggle);
function GetCountMaterials(MaterialName)
	local Inventory = Remotes.CommF_:InvokeServer("getInventory");
	for i, v in pairs(Inventory) do
		if v.Name == MaterialName then
			return v.Count;
		end;
	end;
end;
spawn(function()
	while wait() do
		wait(0.2);
		if _G.AutoTradeAzureEmber and World3 then
			pcall(function()
				local AzureAvilable = GetCountMaterials("Azure Ember");
				if AzureAvilable >= _G.SetAzureEmber then
					(ReplicatedStorage.Modules.Net:FindFirstChild("RF/KitsuneStatuePray")):InvokeServer();
					Remotes.CommF_:InvokeServer("KitsuneStatuePray");
				end;
			end);
		end;
	end;
end);
MirageIslandSection = Tabs.SeaStackTab:Section({
	Title = "Mirage Island",
	TextXAlignment = "Left"
})
MirageStatusParagraph = MirageIslandSection:Paragraph({
	Title = "Mirage Status",
	Desc = "N/A"
});
TweenToMirageIslandToggle = MirageIslandSection:Toggle({
	Title = "Tween To Mirage Island",
	Value = false,
	Callback = function(state)
		_G.TweenToMirageIsland = state;
		StopTween(_G.TweenToMirageIsland);
	end
});
Config:Register("TweenToMirageIslandToggle", TweenToMirageIslandToggle);
function GetHighestPoint()
	for i, v in pairs(Workspace.Map.MysticIsland:GetDescendants()) do
		if v:IsA("MeshPart") then
			if v.MeshId == "rbxassetid://6745037796" then
				return v;
			end;
		end;
	end;
end;
spawn(function()
	pcall(function()
		while wait() do
			wait(0.2);
			if _G.TweenToHighestMirage then
				if Workspace.Map:FindFirstChild("MysticIsland") then
					TweenPlayer((GetHighestPoint()).CFrame * CFrame.new(0, 211.88, 0));
				end;
			end;
		end;
	end);
end);
spawn(function()
	pcall(function()
		while wait() do
			wait(0.2);
			if _G.TweenToMirageIsland then
				if Workspace.Map:FindFirstChild("MysticIsland") then
					TweenPlayer((GetHighestPoint()).CFrame * CFrame.new(0, 211.88, 0));
				end;
			end;
		end;
	end);
end);
SeaBeastSeaStackSection = Tabs.SeaStackTab:Section({
	Title = "Sea Beasts",
	TextXAlignment = "Left"
});
AutoAttackSeaBeastsToggle = SeaBeastSeaStackSection:Toggle({
	Title = "Auto Attack Seabeasts",
	Value = false,
	Callback = function(state)
		_G.AutoAttackSeabeasts = state;
		StopTween(_G.AutoAttackSeabeasts);
	end
});
Config:Register("AutoAttackSeaBeastsToggle", AutoAttackSeaBeastsToggle);
spawn(function()
	pcall(function()
		while wait() do
			wait(0.2);
			if _G.AutoAttackSeabeasts and (World2 or World3) then
				if Workspace:FindFirstChild("SeaBeasts") then
					for i, v in pairs(Workspace.SeaBeasts:GetChildren()) do
						if CheckSeaBeast() then
							repeat
								RunService.Heartbeat:wait();
								CFrameSeaBeast = v.HumanoidRootPart.CFrame * CFrame.new(0, 200, 0);
								if (CFrameSeaBeast.Position - HumanoidRootPart.CFrame.Position).Magnitude <= 400 then
									_G.SeaSkill = true;
								else
									_G.SeaSkill = false;
								end;
								AutoHaki();
								Skillaimbot = true;
								AimBotSkillPosition = v.HumanoidRootPart.CFrame.Position;
								if SBAttacking then
									TweenPlayer(CFrameSeaBeast * CFrame.new(math.random(100, 300), 100, math.random(100, 300)));
								else
									TweenPlayer(CFrameSeaBeast * CFrame.new(0, 100, 0));
								end;
							until not _G.AutoAttackSeabeasts or CheckSeaBeast() == false or (not v:FindFirstChild("Humanoid")) or (not v:FindFirstChild("HumanoidRootPart")) or v.Humanoid.Health < 0 or (not v.Parent);
							Skillaimbot = false;
							_G.SeaSkill = false;
						else
							Skillaimbot = false;
							_G.SeaSkill = false;
						end;
					end;
				end;
			end;
		end;
	end);
end);
SettingSeaSection = Tabs.SeaSettingsTab:Section({
	Title = "Settings",
	TextXAlignment = "Left"
});
LightningToggle = SettingSeaSection:Toggle({
	Title = "Lightning",
	Value = false,
	Callback = function(state)
		_G.Lighting = state;
	end
});
local RunService = game:GetService("RunService");
RunService.Heartbeat:Connect(function()
	local Lighting = game:GetService("Lighting");
	if _G.Lightning then
		Lighting.ClockTime = 12;
	end;
end);
IncreaseSpeedBoatToggle = SettingSeaSection:Toggle({
	Title = "Increase Speed Boat",
	Value = false,
	Callback = function(state)
		_G.IncreaseSpeedBoat = state;
	end
});
spawn(function()
	while wait(0.2) do
		pcall(function()
			local vehicleSeats = {};
			for i, v in pairs(Workspace.Boats:GetDescendants()) do
				if v:IsA("VehicleSeat") then
					table.insert(vehicleSeats, v);
				end;
			end;
			if _G.IncreaseSpeedBoat then
				for _, v in pairs(vehicleSeats) do
					v.MaxSpeed = 350;
				end;
			else
				for _, v in pairs(vehicleSeats) do
					v.MaxSpeed = 150;
				end;
			end;
		end);
	end;
end);
NoClipRockToggle = SettingSeaSection:Toggle({
	Title = "No Clip Rock",
	Value = false,
	Callback = function(state)
		_G.NoClipRock = state;
	end
});
spawn(function()
	while wait(0.2) do
		pcall(function()
			for i, boat in pairs(Workspace.Boats:GetChildren()) do
				for _, v in pairs(Workspace.Boats[boat.Name]:GetDescendants()) do
					if v:IsA("BasePart") then
						if _G.NoClipRock or _G.SailBoat then
							v.CanCollide = false;
						else
							v.CanCollide = true;
						end;
					end;
				end;
			end;
		end);
	end;
end);
SettingSeaSection = Tabs.SeaSettingsTab:Section({
	Title = "Tools",
	TextXAlignment = "Left"
});
UseDevilFruitSkillToggle = SettingSeaSection:Toggle({
	Title = "Use Devil Fruit Skill",
	Value = true,
	Callback = function(state)
		_G.UseDevilFruitSkill = state;
	end
});
Config:Register("UseDevilFruitSkillToggle", UseDevilFruitSkillToggle);
UseMeleeSkillToggle = SettingSeaSection:Toggle({
	Title = "Use Melee Skill",
	Value = true,
	Callback = function(state)
		_G.UseMeleeSkill = state;
	end
});
Config:Register("UseMeleeSkillToggle", UseMeleeSkillToggle);
UseSwordSkillToggle = SettingSeaSection:Toggle({
	Title = "Use Sword Skill",
	Value = true,
	Callback = function(state)
		_G.UseSwordSkill = state;
	end
});
Config:Register("UseSwordSkillToggle", UseSwordSkillToggle);
UseGunSkillToggle = SettingSeaSection:Toggle({
	Title = "Use Gun Skill",
	Value = true,
	Callback = function(state)
		_G.UseGunSkill = state;
	end
});
Config:Register("UseGunSkillToggle", UseGunSkillToggle);
DevilFruitSkillSection = Tabs.SeaSettingsTab:Section({
	Title = "Devil Fruit Skill",
	TextXAlignment = "Left"
});
Config:Register("UseDevilFruitSkillToggle", UseDevilFruitSkillToggle);
DevilFruiSKillSeaEventDropdown = DevilFruitSkillSection:Dropdown({
	Title = "Select Devil Fruit Skill",
	Values = FruitSkillList,
	Value = {"Z", "X", "C"},
	Multi = true,
	Callback = function(value)
		_G.DevilFruitSkillSeaEvent = value;
	end
});
MeleeSkillSection = Tabs.SeaSettingsTab:Section({
	Title = "Melee Skill",
	TextXAlignment = "Left"
});
local MeleeSkillList = {
	"Z",
	"X",
	"C",
	"V"
};
MeleeSkillSeaEventDropdown = MeleeSkillSection:Dropdown({
	Title = "Select Melee Skill",
	Values = MeleeSkillList,
	Value = {"Z", "X", "C", "V"},
	Multi = true,
	Callback = function(value)
		_G.MeleeSkillSeaEvent = value;
	end
});
DoneSkillGun = false;
DoneSkillSword = false;
DoneSkillFruit = false;
DoneSkillMelee = false;
spawn(function()
	while wait() do
		wait(0.1);
		pcall(function()
			if _G.SeaSkill then
				if _G.UseDevilFruitSkill and DoneSkillFruit == false then
					EquipWeapon(getWeapon("Blox Fruit"))
					for i, v in pairs(_G.DevilFruitSkillSeaEvent) do
						sendKeyEvent(v)
					end;
					DoneSkillFruit = true;
				end;
				if _G.UseMeleeSkill and DoneSkillMelee == false then
					EquipWeapon(getWeapon("Melee"))
					for i, v in pairs(_G.MeleeSkillSeaEvent) do
						sendKeyEvent(v)
					end;
					DoneSkillMelee = true;
				end;
				if _G.UseSwordSkill and DoneSkillSword == false then
					EquipWeapon(getWeapon("Sword"));
					sendKeyEvent("Z");
					wait(0.1);
					sendKeyEvent("X");
					DoneSkillSword = true;
				end;
				if _G.UseGunSkill and DoneSkillGun == false then
					EquipWeapon(getWeapon("Gun"))
					sendKeyEvent("Z");
					wait(0.1);
					sendKeyEvent("X");
					DoneSkillGun = true;
				end;
				DoneSkillGun = false;
				DoneSkillSword = false;
				DoneSkillFruit = false;
				DoneSkillMelee = false;
			end;
		end);
	end;
end);
function CheckSeaBeast()
	if Workspace:FindFirstChild("SeaBeasts") then
		for i, v in pairs(Workspace.SeaBeasts:GetChildren()) do
			if v:FindFirstChild("Humanoid") or v:FindFirstChild("HumanoidRootPart") or v.Humanoid.Health < 0 then
				return true;
			end;
		end;
	end;
	return false;
end;
local gg = getrawmetatable(game);
local old = gg.__namecall;
setreadonly(gg, false);
gg.__namecall = newcclosure(function(...)
	local method = getnamecallmethod();
	local args = {
		...
	};
	if tostring(method) == "FireServer" then
		if tostring(args[1]) == "RemoteEvent" then
			if tostring(args[2]) ~= "true" and tostring(args[2]) ~= "false" then
				if Skillaimbot then
					args[2] = AimBotSkillPosition;
					return old(unpack(args));
				end;
			end;
		end;
	end;
	return old(...);
end);
spawn(function()
	while wait() do
		wait(0.2);
		pcall(function()
			if UseSkill then
				for _, skill in pairs(_G.SelectedFruitSkill) do
					sendKeyEvent(skill)
				end;
			end;
		end);
	end;
end);
spawn(function()
	while wait() do
		wait(0.2);
		pcall(function()
			if UseGunSkill then
				for _, skill in pairs(_G.SelectedGunSkill) do
					sendKeyEvent(skill)
				end;
			end;
		end);
	end;
end);
LocalPlayerSection = Tabs.LocalPlayerTab:Section({
	Title = "Local Player",
	TextXAlignment = "Left"
});
AutoActiveRaceV3Toggle = LocalPlayerSection:Toggle({
	Title = "Active Race V3",
	Value = false,
	Callback = function(state)
		_G.ActiveRaceV3 = state;
	end
});
Config:Register("AutoActiveRaceV3Toggle", AutoActiveRaceV3Toggle);
AutoActiveRaceV4Toggle = LocalPlayerSection:Toggle({
	Title = "Active Race V4",
	Value = false,
	Callback = function(state)
		_G.ActiveRaceV4 = state;
	end
});
Config:Register("AutoActiveRaceV4Toggle", AutoActiveRaceV4Toggle);
spawn(function()
	while wait() do
		wait(0.2);
		if _G.ActiveRaceV4 then
			if tonumber((Character:WaitForChild("RaceEnergy")).Value) == 1 then
				if Character.RaceTransformed.Value == false then
					(game:GetService("VirtualInputManager")):SendKeyEvent(true, "Y", false, game);
					wait(0.1);
					(game:GetService("VirtualInputManager")):SendKeyEvent(false, "Y", false, game);
				end;
			end;
		end;
	end;
end);
spawn(function()
	pcall(function()
		while wait() do
			wait(0.2);
			if _G.ActiveRaceV3 then
				Remotes.CommE:FireServer("ActivateAbility");
			end;
		end;
	end);
end);
WalkOnWaterToggle = LocalPlayerSection:Toggle({
	Title = "Walk On Water",
	Value = false,
	Callback = function(state)
		_G.WalkOnWater = state;
	end
});
Config:Register("WalkOnWaterToggle", WalkOnWaterToggle);
spawn(function()
	while wait() do
		wait(0.2);
		pcall(function()
			if _G.WalkOnWater then
				Workspace.Map["WaterBase-Plane"].Size = Vector3.new(1000, 112, 1000);
			else
				Workspace.Map["WaterBase-Plane"].Size = Vector3.new(1000, 80, 1000);
			end;
		end);
	end;
end);
NoClipPlayerToggle = LocalPlayerSection:Toggle({
	Title = "No Clip",
	Value = false,
	Callback = function(state)
		_G.NoClip = state;
	end
});
Config:Register("NoClipPlayerToggle", NoClipPlayerToggle);
FruitSection = Tabs.FruitTab:Section({
	Title = "Fruit",
	TextXAlignment = "Left"
});
AutoRandomFruitToggle = FruitSection:Toggle({
	Title = "Auto Random Fruit",
	Value = false,
	Callback = function(state)
		_G.AutoRandomFruit = state;
	end
});
Config:Register("AutoRandomFruitToggle", AutoRandomFruitToggle);
spawn(function()
	pcall(function()
		while wait() do
			wait(0.2);
			if _G.AutoRandomFruit then
				Remotes.CommF_:InvokeServer("Cousin", "Buy");
			end;
		end;
	end);
end);
SelectStoreRarityFruits = {
	"Common - Mythical",
	"Uncommon - Mythical",
	"Rare - Mythical",
	"Legendary - Mythical",
	"Mythical"
};
StoreRarityFruitDropdown = FruitSection:Dropdown({
	Title = "Store Rarity Fruit",
	Values = SelectStoreRarityFruits,
	Value = SelectStoreRarityFruits[1],
	Callback = function(option)
		_G.StoreRarityFruit = option;
	end
});
Config:Register("StoreRarityFruitDropdown", StoreRarityFruitDropdown);
function CheckStoreFruits()
	for i, v in pairs(RarityFruits) do
		if _G.StoreRarityFruit == "Common - Mythical" then
			if i == "Common" or i == "Uncommon" or i == "Rare" or i == "Legendary" or i == "Mythical" then
				for _, fruit in ipairs(v) do
					table.insert(ResultStoreFruits, fruit);
				end;
			end;
		elseif _G.StoreRarityFruit == "Uncommon - Mythical" then
			if i == "Uncommon" or i == "Rare" or i == "Legendary" or i == "Mythical" then
				for _, fruit in ipairs(v) do
					table.insert(ResultStoreFruits, fruit);
				end;
			end;
		elseif _G.StoreRarityFruit == "Rare - Mythical" then
			if i == "Rare" or i == "Legendary" or i == "Mythical" then
				for _, fruit in ipairs(v) do
					table.insert(ResultStoreFruits, fruit);
				end;
			end;
		elseif _G.StoreRarityFruit == "Legendary - Mythical" then
			if i == "Legendary" or i == "Mythical" then
				for _, fruit in ipairs(v) do
					table.insert(ResultStoreFruits, fruit);
				end;
			end;
		elseif _G.StoreRarityFruit == "Mythical" then
			if i == "Mythical" then
				for _, fruit in ipairs(v) do
					table.insert(ResultStoreFruits, fruit);
				end;
			end;
		end;
	end;
end;
AutoStoreFruitToggle = FruitSection:Toggle({
	Title = "Auto Store Fruit",
	Value = false,
	Callback = function(state)
		_G.AutoStoreFruit = state;
	end
});
spawn(function()
	while wait(0.2) do
		pcall(function()
			if _G.AutoStoreFruit then
				for i, v in pairs(LocalPlayer.Backpack:GetChildren()) do
					if string.find(v.Name, "Fruit") then
						ResultStoreFruits = {};
						CheckStoreFruits();
						for z, Res in pairs(ResultStoreFruits) do
							if v.Name == Res then
								local NameFruit = v.Name;
								local FirstNameFruit = string.gsub(v.Name, " Fruit", "");
								if LocalPlayer.Backpack:FindFirstChild(NameFruit) then
									Remotes.CommF_:InvokeServer("StoreFruit", FirstNameFruit .. "-" .. FirstNameFruit, LocalPlayer.Backpack:FindFirstChild(NameFruit));
								end;
							end;
						end;
					end;
				end;
			end;
		end);
	end;
end);
FruitNotification = FruitSection:Toggle({
	Title = "Fruit Notification",
	Value = false,
	Callback = function(state)
		_G.FruitNotification = value;
	end
});
Config:Register("FruitNotification", FruitNotification);
spawn(function()
	while wait() do
		wait(5);
		if _G.FruitNotification then
			for i, v in pairs(Workspace:GetChildren()) do
				if string.find(v.Name, "Fruit") then
					WindUI:Notify({
						Title = "Fruit found",
						Content = v.Name,
						Icon = "bell",
						Duration = 3
					});
				end;
			end;
		end;
	end;
end);
TeleportToFruitToggle = FruitSection:Toggle({
	Title = "Teleport To Fruit",
	Value = false,
	Callback = function(state)
		_G.TeleportToFruit = state;
	end
});
Config:Register("TeleportToFruitToggle", TeleportToFruitToggle);
spawn(function()
	while wait() do
		wait(0.2);
		if _G.TeleportToFruit then
			for i, v in pairs(Workspace:GetChildren()) do
				if string.find(v.Name, "Fruit") then
					HumanoidRootPart.CFrame = v.Handle.CFrame;
				end;
			end;
		end;
	end;
end);
TweenToFruitToggle = FruitSection:Toggle({
	Title = "Tween To Fruit",
	Value = false,
	Callback = function(state)
		_G.TweenToFruit = state;
	end
});
Config:Register("TweenToFruitToggle", TweenToFruitToggle);
spawn(function()
	while wait() do
		wait(0.2);
		if _G.TweenToFruit then
			for i, v in pairs(Workspace:GetChildren()) do
				if string.find(v.Name, "Fruit") then
					TweenPlayer(v.Handle.CFrame);
				end;
			end;
		end;
	end;
end);
GrabFruitButton = FruitSection:Button({
	Title = "Grab Fruit",
	Callback = function()
		for i, v in pairs(Workspace:GetChildren()) do
			if v:IsA("Tool") then
				v.Handle.CFrame = HumanoidRootPart.CFrame;
			end;
		end;
	end
});
VisualSection = Tabs.FruitTab:Section({
	Title = "Visual",
	TextXAlignment = "Left"
});
function RainFruit()
	for i, v in pairs((game:GetObjects("rbxassetid://14759368201"))[1]:GetChildren()) do
		v.Parent = Workspace.Map;
		v:MoveTo(Character.PrimaryPart.Position + Vector3.new(math.random((-50), 50), 100, math.random((-50), 50)));
		if v.Fruit:FindFirstChild("AnimationController") then
			((v.Fruit:FindFirstChild("AnimationController")):LoadAnimation(v.Fruit:FindFirstChild("Idle"))):Play();
		end;
		v.Handle.Touched:Connect(function(x)
			if x.Parent == Character then
				v.Parent = LocalPlayer.Backpack;
				Character.Humanoid:EquipTool(v);
			end;
		end);
	end;
end;
RainFruitButton = VisualSection:Button({
	Title = "Rain Fruit",
	Callback = function()
		RainFruit();
	end
});
TeamSection = Tabs.MiscTab:Section({
	Title = "Teams",
	TextXAlignment = "Left"
});
JoinPiratesTeamButton = TeamSection:Button({
	Title = "Join Pirates Team",
	Callback = function()
		Remotes.CommF_:InvokeServer("SetTeam", "Pirates");
	end
});
JoinMarinesTeamButton = TeamSection:Button({
	Title = "Join Marines Team",
	Callback = function()
		Remotes.CommF_:InvokeServer("SetTeam", "Marines");
	end
});
CodeSection = Tabs.MiscTab:Section({
	Title = "Codes",
	TextXAlignment = "Left"
});
local codeList = {
	"KITTGAMING",
	"ENYU_IS_PRO",
	"FUDD10",
	"BIGNEWS",
	"THEGREATACE",
	"SUB2GAMERROBOT_EXP1",
	"STRAWHATMAIME",
	"SUB2OFFICIALNOOBIE",
	"SUB2NOOBMASTER123",
	"SUB2DAIGROCK",
	"AXIORE",
	"TANTAIGAMIMG",
	"STRAWHATMAINE",
	"JCWK",
	"FUDD10_V2",
	"SUB2FER999",
	"MAGICBIS",
	"TY_FOR_WATCHING",
	"STARCODEHEO"
};
function redeemCode(code)
	Remotes.Redeem:InvokeServer(code);
end;
local RedeemAllCodesButton = CodeSection:Button({
	Title = "Redeem All Codes",
	Callback = function()
		for i, v in pairs(codeList) do
			redeemCode(v);
		end;
	end
});
GraphicMiscSection = Tabs.MiscTab:Section({
	Title = "Graphics",
	TextXAlignment = "Left"
});
function boostFps()
	local decalsyeeted = true;
	local g = game;
	local w = g.Workspace;
	local l = g.Lighting;
	local t = w.Terrain;
	(settings()).Rendering.QualityLevel = "Level01";
	for i, v in pairs(g:GetDescendants()) do
		if v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
			v.Material = "Plastic";
			v.Reflectance = 0;
		elseif v:IsA("Decal") or v:IsA("Texture") and decalsyeeted then
			v.Transparency = 1;
		elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
			v.Lifetime = NumberRange.new(0);
		elseif v:IsA("Explosion") then
			v.BlastPressure = 1;
			v.BlastRadius = 1;
		elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") then
			v.Enabled = false;
		end;
	end;
end;
FpsBoostButton = GraphicMiscSection:Button({
	Title = "Fps Boost",
	Callback = function()
		boostFps();
	end
});
RemoveFogButton = GraphicMiscSection:Button({
	Title = "Remove Fog",
	Callback = function()
		(game:GetService("Lighting")).LightingLayers:Destroy();
		(game:GetService("Lighting")).Sky:Destroy();
		game.Lighting.FogEnd = 9000000000;
	end
});
RemoveLavaButton = GraphicMiscSection:Button({
	Title = "Remove Lava",
	Callback = function()
		for i, v in pairs(Workspace:GetDescendants()) do
			if v.Name == "Lava" then
				v:Destroy();
			end;
		end;
		for i, v in pairs(ReplicatedStorage:GetDescendants()) do
			if v.Name == "Lava" then
				v:Destroy();
			end;
		end;
	end
});
ServerTabSection = Tabs.ServerTab:Section({
	Title = "Server",
	TextXAlignment = "Left"
});
RejoinServerButton = ServerTabSection:Button({
	Title = "Rejoin Server",
	Callback = function()
		TeleportService:Teleport(game.PlaceId);
	end
});
ServerHopButton = ServerTabSection:Button({
	Title = "Server Hop",
	Callback = function()
		local module = (loadstring(game:HttpGet("https://raw.githubusercontent.com/raw-scriptpastebin/FE/main/Server_Hop_Settings")))();
		module:Teleport(game.PlaceId);
	end
});
JobIdParagraph = ServerTabSection:Paragraph({
	Title = "Job ID",
	Desc = game.JobId
});
CopyJobIdButton = ServerTabSection:Button({
	Title = "Copy Job ID",
	Callback = function()
		setclipboard(game.JobId);
	end
});
EnterJobIdInput = ServerTabSection:Input({
	Title = "Enter Job ID",
	Callback = function(value)
		_G.JobId = value;
	end
});
JoinJobIdButton = ServerTabSection:Button({
	Title = "Join Job ID",
	Callback = function()
		TeleportService:TeleportToPlaceInstance(game.PlaceId, _G.JobId);
	end
});
StatusServerSection = Tabs.ServerTab:Section({
	Title = "Status Server",
	TextXAlignment = "Left"
});
MoonServerParagraph = StatusServerSection:Paragraph({
	Title = "Moon Server",
	Desc = "N/A"
});
KitsuneStatusParagraph = StatusServerSection:Paragraph({
	Title = "Kitsune Status",
	Desc = "N/A"
});
FrozenStatusParagraph = StatusServerSection:Paragraph({
	Title = "Frozen Status",
	Desc = "N/A"
});
MirageStatusParagraph = StatusServerSection:Paragraph({
	Title = "Mirage Status",
	Desc = "N/A"
});
HakiDealerStatusParagraph = StatusServerSection:Paragraph({
	Title = "Haki Dealer Status",
	Desc = "N/A"
});
PrehistoricStatusParagraph = StatusServerSection:Paragraph({
	Title = "Prehistoric Status",
	Desc = "N/A"
});
spawn(function()
	while task.wait() do
		pcall(function()
			if (game:GetService("Lighting")).Sky.MoonTextureId == "http://www.roblox.com/asset/?id=9709149431" then
				MoonServerParagraph:SetDesc("🌕 Full Moon 100%");
			elseif (game:GetService("Lighting")).Sky.MoonTextureId == "http://www.roblox.com/asset/?id=9709149052" then
				MoonServerParagraph:SetDesc("🌖 Full Moon 75%");
			elseif (game:GetService("Lighting")).Sky.MoonTextureId == "http://www.roblox.com/asset/?id=9709143733" then
				MoonServerParagraph:SetDesc("🌗 Full Moon 50%");
			elseif (game:GetService("Lighting")).Sky.MoonTextureId == "http://www.roblox.com/asset/?id=9709150401" then
				MoonServerParagraph:SetDesc("🌘 Full Moon 25%");
			elseif (game:GetService("Lighting")).Sky.MoonTextureId == "http://www.roblox.com/asset/?id=9709149680" then
				MoonServerParagraph:SetDesc("🌘 Full Moon 15%");
			else
				MoonServerParagraph:SetDesc("🌑 Full Moon 0%");
			end;
		end);
	end;
end);
spawn(function()
	pcall(function()
		while wait(0.2) do
			if World3 then
				if Workspace._WorldOrigin.Locations:FindFirstChild("Kitsune Island") then
					KitsuneStatusParagraph:SetDesc("⛩️ Kitsune Island is Spawned");
				else
					KitsuneStatusParagraph:SetDesc("⛩️ Kitsune Island Not Spawn");
				end;
			else
				KitsuneStatusParagraph:SetDesc("World 3 Only");
			end;
		end;
	end);
end);
spawn(function()
	pcall(function()
		while wait(0.2) do
			if World3 then
				if Workspace._WorldOrigin.Locations:FindFirstChild("Prehistoric Island") then
					PrehistoricStatusParagraph:SetDesc("🦴 Prehistoric Island is Spawned");
				else
					PrehistoricStatusParagraph:SetDesc("🦴 Prehistoric Island Not Spawn");
				end;
			else
				PrehistoricStatusParagraph:SetDesc("World 3 Only");
			end;
		end;
	end);
end);
spawn(function()
	pcall(function()
		while wait(0.2) do
			if Workspace._WorldOrigin.Locations:FindFirstChild("Frozen Dimension") then
				FrozenStatusParagraph:SetDesc("❄️ Frozen Dimension Spawned");
			else
				FrozenStatusParagraph:SetDesc("❄️ Frozen Dimension Not Spawn");
			end;
		end;
	end);
end);
spawn(function()
	pcall(function()
		while wait(0.2) do
			if World2 or World3 then
				if Workspace._WorldOrigin.Locations:FindFirstChild("Mirage Island") then
					MirageStatusParagraph:SetDesc("🏝️ Mirage Island is Spawned");
				else
					MirageStatusParagraph:SetDesc("🏝️ Mirage Island Not Spawn");
				end;
			else
				MirageStatusParagraph:SetDesc("World 3 Only");
			end;
		end;
	end);
end);
spawn(function()
	while wait(0.2) do
		pcall(function()
			local response = Remotes:WaitForChild("CommF_"):InvokeServer("ColorsDealer", "1");
			if response then
				HakiDealerStatusParagraph:SetDesc("🟢 Master Of Auras Spawned");
			else
				HakiDealerStatusParagraph:SetDesc("🔴 Master Of Auras Not Spawn");
			end;
		end);
	end;
end);

 
