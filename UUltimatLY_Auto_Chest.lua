

local q = game.Players.LocalPlayer;
local U = game:GetService("UserInputService");
task.spawn(function()
	while task.wait(1) do
		if q.Character and q.Character:FindFirstChildOfClass("Humanoid") then
			(q.Character:FindFirstChildOfClass("Humanoid")):ChangeState(Enum.HumanoidStateType.Jumping);
		end;
	end;
end);
local f = game:GetService("TweenService");
local i = game:GetService("CoreGui");
if i:FindFirstChild("UUltimatLY_Purple_UI") then
	i.UUltimatLY_Purple_UI:Destroy();
end;
local B = Instance.new("ScreenGui");
B.Name = "UUltimatLY_Purple_UI";
B.IgnoreGuiInset = true;
B.ResetOnSpawn = false;
B.Parent = i;
local l = Instance.new("Frame");
l.Size = UDim2.new(.45, 0, .1, 0);
l.Position = UDim2.new(.5, 0, .15, 0);
l.AnchorPoint = Vector2.new(.5, .5);
l.BackgroundColor3 = Color3.fromRGB(20, 20, 35);
l.BackgroundTransparency = .3;
l.BorderSizePixel = 0;
l.Parent = B;
l.Visible = false;
local x = Instance.new("UICorner");
x.CornerRadius = UDim.new(0, 25);
x.Parent = l;
local C = Instance.new("UIStroke");
C.Thickness = 2;
C.Color = Color3.fromRGB(170, 0, 255);
C.ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
C.Parent = l;
local X = Instance.new("ImageLabel");
X.Size = UDim2.new(1.4, 0, 2, 0);
X.Position = UDim2.new(-0.2, 0, -0.5, 0);
X.BackgroundTransparency = 1;
X.Image = "rbxassetid://4996891970";
X.ImageColor3 = Color3.fromRGB(170, 0, 255);
X.ImageTransparency = .55;
X.ZIndex = -1;
X.Parent = l;
local g = Instance.new("UIGradient");
g.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(25, 0, 40)), ColorSequenceKeypoint.new(1, Color3.fromRGB(10, 0, 25)) });
g.Rotation = 45;
g.Parent = l;
local E = Instance.new("TextLabel");
E.Size = UDim2.new(1, 0, 1, 0);
E.BackgroundTransparency = 1;
E.Text = "UUltimatLY Hub - Auto Chest";
E.TextColor3 = Color3.fromRGB(200, 0, 255);
E.Font = Enum.Font.GothamBlack;
E.TextScaled = true;
E.TextStrokeTransparency = .5;
E.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
E.Parent = l;
l.Visible = true;
l.BackgroundTransparency = 1;
l.Size = UDim2.new(.2, 0, .05, 0);
E.TextTransparency = 1;
C.Thickness = 0;
X.ImageTransparency = 1;
(f:Create(l, TweenInfo.new(1, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { BackgroundTransparency = .3, Size = UDim2.new(.45, 0, .1, 0) })):Play();
(f:Create(E, TweenInfo.new(1, Enum.EasingStyle.Quad), { TextTransparency = 0 })):Play();
(f:Create(C, TweenInfo.new(1, Enum.EasingStyle.Quad), { Thickness = 2 })):Play();
(f:Create(X, TweenInfo.new(1, Enum.EasingStyle.Quad), { ImageTransparency = .55 })):Play();
local v = game:GetService("Players");
local H = v.LocalPlayer;
local function Z(q)
	if not q then
		return;
	end;
	if q:FindFirstChild("PurpleAura") then
		q.PurpleAura:Destroy();
	end;
	local U = Instance.new("Highlight");
	U.Name = "PurpleAura";
	U.FillColor = Color3.fromRGB(170, 0, 255);
	U.OutlineColor = Color3.fromRGB(200, 100, 255);
	U.FillTransparency = .3;
	U.OutlineTransparency = 0;
	U.Parent = q;
end;
if H.Character then
	Z(H.Character);
end;
H.CharacterAdded:Connect(function(q)
	q:WaitForChild("HumanoidRootPart");
	task.wait(1);
	Z(q);
end);
local M = game:GetService("Players");
local A = game:GetService("RunService");
local c = M.LocalPlayer;
local F = "UUltimatLY Hub";
local e = 18;
local k = Vector3.new(0, 1.8, 0);
local K = 1.0;
local function m(q)
	if not q then
		return;
	end;
	local U = q:FindFirstChild("Head") or q:FindFirstChildWhichIsA("BasePart");
	if not U then
		return;
	end;
	local f = U:FindFirstChild("UUltimatLY_FastAttack_Label");
	if f then
		f:Destroy();
	end;
	local i = Instance.new("BillboardGui");
	i.Name = "UUltimatLY_FastAttack_Label";
	i.Adornee = U;
	i.AlwaysOnTop = true;
	i.Size = UDim2.new(0, 200, 0, 40);
	i.StudsOffset = k;
	i.Parent = U;
	local B = Instance.new("TextLabel");
	B.Name = "Label";
	B.Size = UDim2.new(1, 0, 1, 0);
	B.BackgroundTransparency = 1;
	B.Text = F;
	B.Font = Enum.Font.SourceSansBold;
	B.TextSize = e;
	B.TextStrokeTransparency = .6;
	B.TextTransparency = 0;
	B.TextScaled = false;
	B.Parent = i;
	local l = 0;
	local x;
	x = A.RenderStepped:Connect(function(q)
			l = (l + q * K) % 1;
			local U = Color3.fromHSV(l, .9, 1);
			if B and B.Parent then
				B.TextColor3 = U;
			else
				if x then
					x:Disconnect();
				end;
			end;
		end);
end;
local function d(q)
	if not q.Parent then
		q.AncestryChanged:Wait();
	end;
	wait(.1);
	m(q);
end;
if c.Character then
	d(c.Character);
end;
c.CharacterAdded:Connect(d);
c.AncestryChanged:Connect(function(q, U)
	if not U then
 
	end;
end);
local z = (game:GetService("Players")).LocalPlayer;
local n = workspace._WorldOrigin.Locations;
local function y()
	if not z.Character then
		z.CharacterAdded:Wait();
	end;
	z.Character:WaitForChild("HumanoidRootPart");
	return z.Character;
end;
local function P(q)
	local U = (y()).LowerTorso;
	table.sort(q, function(q, f)
		local i = U.Position;
		local B = (i - q.Position).Magnitude;
		local l = (i - f.Position).Magnitude;
		return B < l;
	end);
end;
local o, J = {}, true;
local function Y()
	if J then
		J = false;
		for q, U in pairs(game:GetDescendants()) do
			if U.Name:find("Chest") and U.ClassName == "Part" then
				table.insert(o, U);
			end;
		end;
	end;
	local q = {};
	for U, f in pairs(o) do
		if f:FindFirstChild("TouchInterest") then
			table.insert(q, f);
		end;
	end;
	P(q);
	return q;
end;
local function V(q)
	for U, f in pairs((y()):GetChildren()) do
		if f:IsA("BasePart") then
			f.CanCollide = not q;
		end;
	end;
end;
local function b(q)
	local U = (y()).HumanoidRootPart;
	V(true);
	U.CFrame = q + Vector3.new(0, 3, 0);
	V(false);
end;
local function h()
	task.spawn(function()
		while task.wait() do
			local q = Y();
			if #q > 0 then
				b(q[1].CFrame);
			else
 
			end;
		end;
	end);
end;
task.spawn(function()
	local q = game:GetService("ReplicatedStorage");
	while task.wait() do
		pcall(function()
			q.Remotes.CommF_:InvokeServer("SetTeam", "Marines");
		end);
	end;
end);
z.CharacterAdded:Connect(function()
	task.wait();
	h();
end);
h();
repeat
	task.wait(2);
until game:IsLoaded();
local T = game:GetService("HttpService");
local Q = game:GetService("TeleportService");
local p = game:GetService("Players");
local L = p.LocalPlayer;
local s = game.PlaceId;
local u = {};
local O = "";
local N = (os.date("!*t")).hour;
local I = pcall(function()
		u = T:JSONDecode(readfile("NotSameServers.json"));
	end);
if not I then
	table.insert(u, N);
	writefile("NotSameServers.json", T:JSONEncode(u));
end;
local function R()
	local q = Instance.new("ScreenGui");
	q.Name = "UUltimatLY_Hub_HopUI";
	q.ResetOnSpawn = false;
	q.IgnoreGuiInset = true;
	q.Parent = game:GetService("CoreGui");
	local U = Instance.new("Frame");
	U.Size = UDim2.new(1, 0, 1, 0);
	U.BackgroundColor3 = Color3.new(0, 0, 0);
	U.BorderSizePixel = 0;
	U.BackgroundTransparency = 0;
	U.Parent = q;
	local f = Instance.new("TextLabel");
	f.Size = UDim2.new(1, 0, .2, 0);
	f.Position = UDim2.new(0, 0, .35, 0);
	f.BackgroundTransparency = 1;
	f.Text = "UUltimatLY Hub - Auto Collect Chest";
	f.TextColor3 = Color3.new(1, 1, 1);
	f.Font = Enum.Font.SourceSansBold;
	f.TextScaled = true;
	f.Parent = U;
	local i = Instance.new("TextLabel");
	i.Size = UDim2.new(1, 0, .2, 0);
	i.Position = UDim2.new(0, 0, .5, 0);
	i.BackgroundTransparency = 1;
	i.Text = "Hopping";
	i.TextColor3 = Color3.fromRGB(255, 170, 0);
	i.Font = Enum.Font.SourceSansBold;
	i.TextScaled = true;
	i.Parent = U;
end;
function TPReturner()
	local q;
	if O == "" then
		q = T:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. (s .. "/servers/Public?sortOrder=Asc&limit=100")));
	else
		q = T:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. (s .. ("/servers/Public?sortOrder=Asc&limit=100&cursor=" .. O))));
	end;
	if q.nextPageCursor and q.nextPageCursor ~= "null" then
		O = q.nextPageCursor;
	end;
	local U = 0;
	for q, f in pairs(q.data) do
		local i = tostring(f.id);
		local B = true;
		if tonumber(f.playing) < tonumber(f.maxPlayers) then
			for q, f in pairs(u) do
				if U ~= 0 then
					if i == tostring(f) then
						B = false;
					end;
				else
					if tonumber(N) ~= tonumber(f) then
						local q = pcall(function()
								delfile("NotSameServers.json");
								u = {};
								table.insert(u, N);
							end);
					end;
				end;
				U = U + 1;
			end;
			if B then
				table.insert(u, i);
				pcall(function()
					writefile("NotSameServers.json", T:JSONEncode(u));
					R();
					task.wait(3);
					Q:TeleportToPlaceInstance(s, i, L);
				end);
				task.wait(4);
			end;
		end;
	end;
end;
function TeleportLoop()
	while task.wait() do
		pcall(function()
			TPReturner();
			if O ~= "" then
				TPReturner();
			end;
		end);
	end;
end;
task.delay(180, function()
	TeleportLoop();
end);
local w = game:GetService("Players");
local S = w.LocalPlayer;
local W = game:GetService("CoreGui");
if W:FindFirstChild("HN_MiniUI") then
	W.HN_MiniUI:Destroy();
end;
local a = Instance.new("ScreenGui");
a.Name = "HN_MiniUI";
a.Parent = W;
local function D(q, U, f, i)
	local B = Instance.new("TextLabel");
	B.Size = UDim2.new(0, 120, 0, 15);
	B.Position = UDim2.new(1, -140, .1, U);
	B.AnchorPoint = Vector2.new(0, 0);
	B.BackgroundTransparency = 1;
	B.Text = q;
	B.TextColor3 = Color3.fromRGB(170, 0, 255);
	B.Font = Enum.Font.GothamBold;
	B.TextSize = 12;
	B.Parent = a;
	local l = Instance.new("TextButton");
	l.Size = UDim2.new(0, 20, 0, 20);
	l.Position = UDim2.new(1, -70, .1, U + 20);
	l.AnchorPoint = Vector2.new(0, 0);
	l.TextColor3 = Color3.fromRGB(255, 255, 255);
	l.TextSize = 14;
	l.Font = Enum.Font.GothamBold;
	l.Parent = a;
	(Instance.new("UICorner", l)).CornerRadius = UDim.new(1, 0);
	local x = f;
	local function C()
		if x then
			l.BackgroundColor3 = Color3.fromRGB(170, 0, 255);
			l.Text = "\226\156\147";
		else
			l.BackgroundColor3 = Color3.fromRGB(100, 100, 100);
			l.Text = "";
		end;
	end;
	C();
	l.MouseButton1Click:Connect(function()
		x = not x;
		C();
		i(x);
	end);
	return function()
		return x;
	end, function(q)
		x = q;
		C();
		i(x);
	end;
end;
local j = true;
D("Anti Kick", 0, true, function(q)
	j = q;
end);
task.spawn(function()
	while task.wait(13) do
		if j and (S.Character and S.Character:FindFirstChild("Humanoid")) then
			S.Character.Humanoid.Health = 0;
		end;
	end;
end);
local G = false;
local function t(q)
	if S.Character then
		for U, f in ipairs(S.Character:GetDescendants()) do
			if f:IsA("BasePart") or f:IsA("Decal") then
				f.LocalTransparencyModifier = q and 1 or 0;
			end;
		end;
	end;
end;
local r, qN = D("Invisible", 60, false, function(q)
		G = q;
		t(G);
	end);
S.CharacterAdded:Connect(function(q)
	q:WaitForChild("HumanoidRootPart");
	task.wait(.2);
	if G then
		t(true);
	end;
end);
local function UN(q)
	for U, f in ipairs(workspace:GetDescendants()) do
		if f:IsA("BasePart") or f:IsA("Decal") then
			if not f:IsDescendantOf(S.Character) then
				f.LocalTransparencyModifier = q and 1 or 0;
			end;
		end;
	end;
end;
D("Clear Map", 120, false, function(q)
	UN(q);
end);