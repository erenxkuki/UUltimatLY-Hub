--[[
    ╔═══════════════════════════════════════════════════╗
    ║           SolarX UI Library v1.0.0               ║
    ║         Blox Fruits Hub — by SolarX              ║
    ╚═══════════════════════════════════════════════════╝

    USAGE EXAMPLE:
    ──────────────
    local SolarX = loadstring(game:HttpGet("..."))()

    local Window = SolarX:CreateWindow({
        Title = "SolarX",
        SubTitle = "Blox Fruits Hub",
        LogoId = "rbxassetid://6031075938",   -- cube texture
        ToggleKey = Enum.KeyCode.RightShift,
    })

    local FarmTab = Window:AddTab({
        Name = "Farming",
        Icon = "rbxassetid://6031082355",
    })

    local AutoFarm = FarmTab:AddSection("Auto Farm")

    AutoFarm:AddToggle({
        Name = "Auto Farm Level",
        Default = true,
        Callback = function(val) print("AutoFarm:", val) end
    })

    AutoFarm:AddToggle({
        Name = "Auto Farm Nearest",
        Default = true,
        Callback = function(val) end
    })

    AutoFarm:AddDropdown({
        Name = "Select Weapon",
        Options = {"Melee", "Sword", "Gun"},
        Default = "Melee",
        Callback = function(val) print("Weapon:", val) end
    })

    local Settings = FarmTab:AddSection("Farm Settings")

    Settings:AddSlider({
        Name = "Mob Distance",
        Min = 0, Max = 500, Default = 250,
        Callback = function(val) print("Distance:", val) end
    })

    Settings:AddSlider({
        Name = "Tween Speed",
        Min = 0, Max = 400, Default = 200,
        Callback = function(val) end
    })

    Settings:AddButton({
        Name = "Start Farming",
        Callback = function() print("Farming started!") end
    })

    local StatsTab = Window:AddTab({ Name = "Stats", Icon = "rbxassetid://6031068421" })
    local StatsSection = StatsTab:AddSection("Player Status")

    StatsSection:AddLabel({ Name = "Level", Value = "2450 (MAX)" })
    StatsSection:AddLabel({ Name = "Money", Value = "$123,456,789" })
    StatsSection:AddLabel({ Name = "Bounty", Value = "30M" })
]]

-- ══════════════════════════════════════════
--              LIBRARY CORE
-- ══════════════════════════════════════════

local SolarX = {}
SolarX.__index = SolarX

-- ── Services ──────────────────────────────
local Players       = game:GetService("Players")
local TweenService  = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService    = game:GetService("RunService")
local CoreGui       = game:GetService("CoreGui")

local LocalPlayer   = Players.LocalPlayer
local Mouse         = LocalPlayer:GetMouse()

-- ── Theme ─────────────────────────────────
local Theme = {
    Background      = Color3.fromRGB(10, 12, 20),
    Surface         = Color3.fromRGB(16, 19, 32),
    SurfaceAlt      = Color3.fromRGB(20, 24, 40),
    Sidebar         = Color3.fromRGB(13, 15, 26),
    Accent          = Color3.fromRGB(245, 168, 28),       -- gold
    AccentDim       = Color3.fromRGB(180, 120, 15),
    AccentGlow      = Color3.fromRGB(255, 200, 60),
    Text            = Color3.fromRGB(230, 235, 255),
    TextDim         = Color3.fromRGB(130, 140, 170),
    TextMuted       = Color3.fromRGB(70, 80, 110),
    ToggleOn        = Color3.fromRGB(245, 168, 28),
    ToggleOff       = Color3.fromRGB(40, 46, 70),
    SliderFill      = Color3.fromRGB(245, 168, 28),
    SliderBg        = Color3.fromRGB(30, 36, 58),
    Divider         = Color3.fromRGB(25, 30, 50),
    SectionHeader   = Color3.fromRGB(245, 168, 28),
    ButtonBg        = Color3.fromRGB(245, 168, 28),
    ButtonText      = Color3.fromRGB(10, 12, 20),
    DropdownBg      = Color3.fromRGB(22, 27, 46),
    DropdownHover   = Color3.fromRGB(30, 36, 58),
    TabActive       = Color3.fromRGB(245, 168, 28),
    TabInactive     = Color3.fromRGB(0, 0, 0, 0),
    TabActiveText   = Color3.fromRGB(10, 12, 20),
    TabInactiveText = Color3.fromRGB(130, 140, 170),
    Border          = Color3.fromRGB(35, 42, 68),
    Shadow          = Color3.fromRGB(0, 0, 0),
    Star            = Color3.fromRGB(255, 220, 100),
}

-- ── Tween helpers ─────────────────────────
local function Tween(obj, props, duration, style, direction)
    local info = TweenInfo.new(
        duration or 0.2,
        style or Enum.EasingStyle.Quad,
        direction or Enum.EasingDirection.Out
    )
    local t = TweenService:Create(obj, info, props)
    t:Play()
    return t
end

-- ── UI helpers ────────────────────────────
local function Make(class, props, parent)
    local obj = Instance.new(class)
    for k, v in pairs(props or {}) do
        obj[k] = v
    end
    if parent then obj.Parent = parent end
    return obj
end

local function Gradient(parent, c0, c1, rot)
    local g = Make("UIGradient", {
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, c0),
            ColorSequenceKeypoint.new(1, c1),
        }),
        Rotation = rot or 90,
    }, parent)
    return g
end

local function Corner(parent, radius)
    Make("UICorner", { CornerRadius = UDim.new(0, radius or 8) }, parent)
end

local function Stroke(parent, color, thickness)
    Make("UIStroke", {
        Color = color or Theme.Border,
        Thickness = thickness or 1,
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
    }, parent)
end

local function Padding(parent, all, left, right, top, bottom)
    Make("UIPadding", {
        PaddingLeft   = UDim.new(0, left  or all or 0),
        PaddingRight  = UDim.new(0, right or all or 0),
        PaddingTop    = UDim.new(0, top   or all or 0),
        PaddingBottom = UDim.new(0, bottom or all or 0),
    }, parent)
end

-- ══════════════════════════════════════════
--  CUBE LOGO TOGGLE (3-D isometric cube)
-- ══════════════════════════════════════════
local function BuildCubeToggle(parent, toggleCallback)
    -- Outer button (drag + click)
    local CubeBtn = Make("ImageButton", {
        Name = "CubeToggle",
        Size = UDim2.new(0, 56, 0, 56),
        Position = UDim2.new(0, 12, 0, 12),
        BackgroundColor3 = Color3.fromRGB(16, 19, 32),
        BorderSizePixel = 0,
        ZIndex = 20,
        Image = "",           -- keep transparent over the cube faces
        AutoButtonColor = false,
    }, parent)
    Corner(CubeBtn, 10)
    Stroke(CubeBtn, Theme.Accent, 1.5)

    -- Glow ring
    local Glow = Make("ImageLabel", {
        Size = UDim2.new(1, 20, 1, 20),
        Position = UDim2.new(0, -10, 0, -10),
        BackgroundTransparency = 1,
        Image = "rbxassetid://5028857084",   -- radial glow
        ImageColor3 = Theme.AccentGlow,
        ImageTransparency = 0.65,
        ZIndex = 19,
    }, CubeBtn)

    -- ── Isometric Cube (3 faces via ImageLabels) ──
    local CubeFrame = Make("Frame", {
        Size = UDim2.new(0, 38, 0, 38),
        Position = UDim2.new(0.5, -19, 0.5, -19),
        BackgroundTransparency = 1,
        ZIndex = 21,
    }, CubeBtn)

    -- Top face
    local TopFace = Make("ImageLabel", {
        Size = UDim2.new(0, 38, 0, 18),
        Position = UDim2.new(0, 0, 0, 0),
        BackgroundTransparency = 1,
        Image = "rbxassetid://6031075938",   -- default Roblox cube texture
        ImageColor3 = Color3.fromRGB(255, 210, 80),
        ScaleType = Enum.ScaleType.Fit,
        ZIndex = 22,
    }, CubeFrame)

    -- Left face
    local LeftFace = Make("ImageLabel", {
        Size = UDim2.new(0, 19, 0, 22),
        Position = UDim2.new(0, 0, 0, 16),
        BackgroundTransparency = 1,
        Image = "rbxassetid://6031075938",
        ImageColor3 = Color3.fromRGB(200, 150, 30),
        ScaleType = Enum.ScaleType.Fit,
        ZIndex = 22,
    }, CubeFrame)

    -- Right face
    local RightFace = Make("ImageLabel", {
        Size = UDim2.new(0, 19, 0, 22),
        Position = UDim2.new(0, 19, 0, 16),
        BackgroundTransparency = 1,
        Image = "rbxassetid://6031075938",
        ImageColor3 = Color3.fromRGB(140, 100, 15),
        ScaleType = Enum.ScaleType.Fit,
        ZIndex = 22,
    }, CubeFrame)

    -- Spin animation (idle rotate using rotation)
    local angle = 0
    local spinConn
    spinConn = RunService.Heartbeat:Connect(function(dt)
        angle = (angle + dt * 45) % 360
        CubeFrame.Rotation = angle
    end)

    -- Hover glow
    CubeBtn.MouseEnter:Connect(function()
        Tween(Glow, { ImageTransparency = 0.3 }, 0.2)
        Tween(CubeBtn, { BackgroundColor3 = Color3.fromRGB(24, 28, 48) }, 0.2)
    end)
    CubeBtn.MouseLeave:Connect(function()
        Tween(Glow, { ImageTransparency = 0.65 }, 0.3)
        Tween(CubeBtn, { BackgroundColor3 = Color3.fromRGB(16, 19, 32) }, 0.3)
    end)

    CubeBtn.MouseButton1Click:Connect(function()
        if toggleCallback then toggleCallback() end
    end)

    return CubeBtn, spinConn
end

-- ══════════════════════════════════════════
--              CREATE WINDOW
-- ══════════════════════════════════════════
function SolarX:CreateWindow(config)
    config = config or {}
    local Title      = config.Title    or "SolarX"
    local SubTitle   = config.SubTitle or "Blox Fruits Hub"
    local LogoId     = config.LogoId   or "rbxassetid://6031075938"
    local ToggleKey  = config.ToggleKey or Enum.KeyCode.RightShift
    local Size       = config.Size or Vector2.new(820, 520)

    -- ── ScreenGui ─────────────────────────
    local ScreenGui = Make("ScreenGui", {
        Name = "SolarXLib",
        ResetOnSpawn = false,
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
    })
    -- Try to parent to CoreGui (exploits), else PlayerGui
    local ok = pcall(function() ScreenGui.Parent = CoreGui end)
    if not ok then ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui") end

    -- ── Starfield background ───────────────
    local StarField = Make("Frame", {
        Name = "StarField",
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundColor3 = Color3.fromRGB(4, 6, 14),
        BorderSizePixel = 0,
        ZIndex = 0,
    }, ScreenGui)

    -- scatter random stars
    math.randomseed(os.clock())
    for i = 1, 80 do
        local s = math.random(1, 3)
        Make("Frame", {
            Size = UDim2.new(0, s, 0, s),
            Position = UDim2.new(math.random(), 0, math.random(), 0),
            BackgroundColor3 = Theme.Star,
            BackgroundTransparency = math.random(30, 80) / 100,
            BorderSizePixel = 0,
            ZIndex = 1,
        }, StarField)
    end

    -- Nebula glow blobs
    local colors = {
        Color3.fromRGB(60, 30, 120),
        Color3.fromRGB(20, 60, 130),
        Color3.fromRGB(100, 50, 10),
    }
    for i, c in ipairs(colors) do
        local blob = Make("ImageLabel", {
            Size = UDim2.new(0, 340, 0, 340),
            Position = UDim2.new(math.random() * 0.8, 0, math.random() * 0.8, 0),
            BackgroundTransparency = 1,
            Image = "rbxassetid://5028857084",
            ImageColor3 = c,
            ImageTransparency = 0.82,
            ZIndex = 1,
        }, StarField)
    end

    -- ── Main Frame ────────────────────────
    local Main = Make("Frame", {
        Name = "Main",
        Size = UDim2.new(0, Size.X, 0, Size.Y),
        Position = UDim2.new(0.5, -Size.X/2, 0.5, -Size.Y/2),
        BackgroundColor3 = Theme.Background,
        BorderSizePixel = 0,
        ZIndex = 2,
        ClipsDescendants = true,
    }, ScreenGui)
    Corner(Main, 12)
    Stroke(Main, Theme.Border, 1)

    -- Subtle inner gradient
    Gradient(Main,
        Color3.fromRGB(14, 18, 30),
        Color3.fromRGB(8, 10, 18),
        135
    )

    -- ── Drag ──────────────────────────────
    do
        local dragging, dragStart, startPos
        Main.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                dragging  = true
                dragStart = input.Position
                startPos  = Main.Position
            end
        end)
        UserInputService.InputChanged:Connect(function(input)
            if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                local delta = input.Position - dragStart
                Main.Position = UDim2.new(
                    startPos.X.Scale,
                    startPos.X.Offset + delta.X,
                    startPos.Y.Scale,
                    startPos.Y.Offset + delta.Y
                )
            end
        end)
        UserInputService.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                dragging = false
            end
        end)
    end

    -- ── Topbar ────────────────────────────
    local TopBar = Make("Frame", {
        Name = "TopBar",
        Size = UDim2.new(1, 0, 0, 48),
        BackgroundColor3 = Color3.fromRGB(10, 12, 22),
        BorderSizePixel = 0,
        ZIndex = 3,
    }, Main)
    Gradient(TopBar,
        Color3.fromRGB(16, 20, 36),
        Color3.fromRGB(10, 12, 22),
        90
    )

    -- Logo icon (top-left)
    local LogoImg = Make("ImageLabel", {
        Size = UDim2.new(0, 28, 0, 28),
        Position = UDim2.new(0, 14, 0.5, -14),
        BackgroundTransparency = 1,
        Image = LogoId,
        ImageColor3 = Theme.Accent,
        ZIndex = 4,
    }, TopBar)

    -- Title
    local TitleLabel = Make("TextLabel", {
        Size = UDim2.new(0, 120, 1, 0),
        Position = UDim2.new(0, 48, 0, 0),
        BackgroundTransparency = 1,
        Text = Title,
        TextColor3 = Theme.Accent,
        Font = Enum.Font.GothamBold,
        TextSize = 20,
        TextXAlignment = Enum.TextXAlignment.Left,
        ZIndex = 4,
    }, TopBar)

    -- SubTitle / version
    local SubLabel = Make("TextLabel", {
        Size = UDim2.new(0, 200, 1, 0),
        Position = UDim2.new(0, 48, 0, 18),
        BackgroundTransparency = 1,
        Text = SubTitle,
        TextColor3 = Theme.TextDim,
        Font = Enum.Font.Gotham,
        TextSize = 11,
        TextXAlignment = Enum.TextXAlignment.Left,
        ZIndex = 4,
    }, TopBar)

    -- Close button
    local CloseBtn = Make("TextButton", {
        Size = UDim2.new(0, 32, 0, 32),
        Position = UDim2.new(1, -42, 0.5, -16),
        BackgroundColor3 = Color3.fromRGB(180, 40, 40),
        Text = "✕",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        Font = Enum.Font.GothamBold,
        TextSize = 14,
        BorderSizePixel = 0,
        ZIndex = 5,
        AutoButtonColor = false,
    }, TopBar)
    Corner(CloseBtn, 8)
    CloseBtn.MouseButton1Click:Connect(function()
        Tween(Main, { Size = UDim2.new(0, Size.X, 0, 0) }, 0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In)
        task.delay(0.35, function() ScreenGui:Destroy() end)
    end)

    -- Minimise button
    local MinBtn = Make("TextButton", {
        Size = UDim2.new(0, 32, 0, 32),
        Position = UDim2.new(1, -80, 0.5, -16),
        BackgroundColor3 = Color3.fromRGB(50, 56, 80),
        Text = "—",
        TextColor3 = Theme.TextDim,
        Font = Enum.Font.GothamBold,
        TextSize = 14,
        BorderSizePixel = 0,
        ZIndex = 5,
        AutoButtonColor = false,
    }, TopBar)
    Corner(MinBtn, 8)
    local minimized = false
    MinBtn.MouseButton1Click:Connect(function()
        minimized = not minimized
        if minimized then
            Tween(Main, { Size = UDim2.new(0, Size.X, 0, 48) }, 0.3, Enum.EasingStyle.Back)
        else
            Tween(Main, { Size = UDim2.new(0, Size.X, 0, Size.Y) }, 0.3, Enum.EasingStyle.Back)
        end
    end)

    -- Divider below topbar
    Make("Frame", {
        Size = UDim2.new(1, 0, 0, 1),
        Position = UDim2.new(0, 0, 0, 48),
        BackgroundColor3 = Theme.Accent,
        BackgroundTransparency = 0.7,
        BorderSizePixel = 0,
        ZIndex = 3,
    }, Main)

    -- ── Sidebar ───────────────────────────
    local Sidebar = Make("Frame", {
        Name = "Sidebar",
        Size = UDim2.new(0, 160, 1, -48),
        Position = UDim2.new(0, 0, 0, 48),
        BackgroundColor3 = Theme.Sidebar,
        BorderSizePixel = 0,
        ZIndex = 3,
    }, Main)

    -- Sidebar right border
    Make("Frame", {
        Size = UDim2.new(0, 1, 1, 0),
        Position = UDim2.new(1, -1, 0, 0),
        BackgroundColor3 = Theme.Border,
        BorderSizePixel = 0,
        ZIndex = 4,
    }, Sidebar)

    -- Tab list container
    local TabList = Make("ScrollingFrame", {
        Name = "TabList",
        Size = UDim2.new(1, 0, 1, -90),
        Position = UDim2.new(0, 0, 0, 10),
        BackgroundTransparency = 1,
        ScrollBarThickness = 2,
        ScrollBarImageColor3 = Theme.Accent,
        BorderSizePixel = 0,
        ZIndex = 4,
        CanvasSize = UDim2.new(0, 0, 0, 0),
    }, Sidebar)
    Make("UIListLayout", {
        Padding = UDim.new(0, 4),
        FillDirection = Enum.FillDirection.Vertical,
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
    }, TabList)
    Padding(TabList, 6)

    -- Bottom: version label in sidebar
    local VerLabel = Make("TextLabel", {
        Size = UDim2.new(1, 0, 0, 20),
        Position = UDim2.new(0, 0, 1, -28),
        BackgroundTransparency = 1,
        Text = "Version 1.0.0",
        TextColor3 = Theme.TextMuted,
        Font = Enum.Font.Gotham,
        TextSize = 10,
        ZIndex = 4,
    }, Sidebar)

    -- ── Content area ──────────────────────
    local ContentArea = Make("Frame", {
        Name = "Content",
        Size = UDim2.new(1, -160, 1, -48),
        Position = UDim2.new(0, 160, 0, 48),
        BackgroundTransparency = 1,
        ZIndex = 3,
        ClipsDescendants = true,
    }, Main)

    -- ── Cube Toggle (floating, bottom-left of screen) ──
    local CubeHolder = Make("Frame", {
        Name = "CubeHolder",
        Size = UDim2.new(0, 80, 0, 80),
        Position = UDim2.new(0, 20, 1, -100),
        BackgroundTransparency = 1,
        ZIndex = 15,
    }, ScreenGui)

    local visible = true
    local cubeBtn, spinConn = BuildCubeToggle(CubeHolder, function()
        visible = not visible
        if visible then
            Main.Visible = true
            Tween(Main, { Position = UDim2.new(0.5, -Size.X/2, 0.5, -Size.Y/2) }, 0.35, Enum.EasingStyle.Back)
        else
            Tween(Main, { Position = UDim2.new(0.5, -Size.X/2, 0.5, Size.Y + 100) }, 0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
            task.delay(0.35, function() Main.Visible = false end)
        end
    end)

    -- Keyboard toggle
    UserInputService.InputBegan:Connect(function(input, gpe)
        if gpe then return end
        if input.KeyCode == ToggleKey then
            visible = not visible
            if visible then
                Main.Visible = true
                Tween(Main, { Position = UDim2.new(0.5, -Size.X/2, 0.5, -Size.Y/2) }, 0.35, Enum.EasingStyle.Back)
            else
                Tween(Main, { Position = UDim2.new(0.5, -Size.X/2, 0.5, Size.Y + 100) }, 0.3)
                task.delay(0.35, function() Main.Visible = false end)
            end
        end
    end)

    -- Entrance animation
    Main.Size = UDim2.new(0, Size.X, 0, 0)
    Tween(Main, { Size = UDim2.new(0, Size.X, 0, Size.Y) }, 0.45, Enum.EasingStyle.Back)

    -- ══════════════════════════════════════
    --  Window Object (returned to caller)
    -- ══════════════════════════════════════
    local WindowObj = {}
    WindowObj._tabs       = {}
    WindowObj._activeTab  = nil
    WindowObj._tabBtns    = {}

    -- ── internal: switch tab ──────────────
    local function SwitchTab(tabName)
        for name, frame in pairs(WindowObj._tabs) do
            frame.Visible = (name == tabName)
        end
        for name, btn in pairs(WindowObj._tabBtns) do
            if name == tabName then
                Tween(btn, { BackgroundColor3 = Theme.TabActive }, 0.2)
                btn.TextColor3 = Theme.TabActiveText
                -- accent indicator
                if btn:FindFirstChild("Indicator") then
                    btn.Indicator.BackgroundTransparency = 0
                end
            else
                Tween(btn, { BackgroundColor3 = Color3.fromRGB(0,0,0) }, 0.2)
                btn.BackgroundTransparency = 1
                btn.TextColor3 = Theme.TabInactiveText
                if btn:FindFirstChild("Indicator") then
                    btn.Indicator.BackgroundTransparency = 1
                end
            end
        end
        WindowObj._activeTab = tabName
    end

    -- ── AddTab ────────────────────────────
    function WindowObj:AddTab(cfg)
        cfg = cfg or {}
        local tabName = cfg.Name or ("Tab" .. #self._tabs + 1)
        local tabIcon = cfg.Icon or ""

        -- Sidebar button
        local Btn = Make("TextButton", {
            Name = tabName,
            Size = UDim2.new(1, -12, 0, 38),
            BackgroundColor3 = Color3.fromRGB(0, 0, 0),
            BackgroundTransparency = 1,
            Text = "",
            BorderSizePixel = 0,
            ZIndex = 5,
            AutoButtonColor = false,
        }, TabList)
        Corner(Btn, 8)

        -- accent left-bar indicator
        local Indicator = Make("Frame", {
            Name = "Indicator",
            Size = UDim2.new(0, 3, 0.6, 0),
            Position = UDim2.new(0, 0, 0.2, 0),
            BackgroundColor3 = Theme.Accent,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ZIndex = 6,
        }, Btn)
        Corner(Indicator, 2)

        -- icon
        if tabIcon ~= "" then
            Make("ImageLabel", {
                Size = UDim2.new(0, 18, 0, 18),
                Position = UDim2.new(0, 14, 0.5, -9),
                BackgroundTransparency = 1,
                Image = tabIcon,
                ImageColor3 = Theme.TextDim,
                ZIndex = 6,
            }, Btn)
        end

        -- label
        local BtnLabel = Make("TextLabel", {
            Size = UDim2.new(1, tabIcon ~= "" and -38 or -14, 1, 0),
            Position = UDim2.new(0, tabIcon ~= "" and 38 or 14, 0, 0),
            BackgroundTransparency = 1,
            Text = tabName,
            TextColor3 = Theme.TabInactiveText,
            Font = Enum.Font.GothamSemibold,
            TextSize = 13,
            TextXAlignment = Enum.TextXAlignment.Left,
            ZIndex = 6,
        }, Btn)
        Btn.TextColor3 = Theme.TabInactiveText  -- ref for switcher

        -- resize list canvas
        local layout = TabList:FindFirstChildOfClass("UIListLayout")
        if layout then
            TabList.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y + 12)
        end

        -- Content page
        local Page = Make("ScrollingFrame", {
            Name = tabName .. "Page",
            Size = UDim2.new(1, 0, 1, 0),
            BackgroundTransparency = 1,
            ScrollBarThickness = 3,
            ScrollBarImageColor3 = Theme.Accent,
            BorderSizePixel = 0,
            ZIndex = 4,
            Visible = false,
            CanvasSize = UDim2.new(0, 0, 0, 0),
        }, ContentArea)
        Padding(Page, 14)
        local PageLayout = Make("UIListLayout", {
            Padding = UDim.new(0, 10),
            FillDirection = Enum.FillDirection.Vertical,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
        }, Page)
        PageLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            Page.CanvasSize = UDim2.new(0, 0, 0, PageLayout.AbsoluteContentSize.Y + 28)
        end)

        self._tabs[tabName]    = Page
        self._tabBtns[tabName] = Btn
        -- reference label so switcher can recolor icon too
        Btn.TextColor3 = Theme.TabInactiveText

        -- activate first tab automatically
        if not self._activeTab then
            SwitchTab(tabName)
        end

        Btn.MouseButton1Click:Connect(function()
            SwitchTab(tabName)
        end)
        Btn.MouseEnter:Connect(function()
            if self._activeTab ~= tabName then
                Tween(Btn, { BackgroundTransparency = 0.85 }, 0.15)
                Btn.BackgroundColor3 = Theme.SurfaceAlt
            end
        end)
        Btn.MouseLeave:Connect(function()
            if self._activeTab ~= tabName then
                Tween(Btn, { BackgroundTransparency = 1 }, 0.15)
            end
        end)

        -- ══════════════════════════════════
        --  Tab Object (returned to caller)
        -- ══════════════════════════════════
        local TabObj = {}
        TabObj._page = Page

        -- ── AddSection ────────────────────
        function TabObj:AddSection(sName)
            local Section = Make("Frame", {
                Name = sName .. "Section",
                Size = UDim2.new(1, 0, 0, 30),
                BackgroundColor3 = Theme.Surface,
                BorderSizePixel = 0,
                ZIndex = 5,
                AutomaticSize = Enum.AutomaticSize.Y,
            }, Page)
            Corner(Section, 10)
            Stroke(Section, Theme.Border, 1)

            local SList = Make("UIListLayout", {
                Padding = UDim.new(0, 8),
                FillDirection = Enum.FillDirection.Vertical,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
            }, Section)
            Padding(Section, 0, 12, 12, 10, 12)

            -- Section header
            local Header = Make("Frame", {
                Name = "Header",
                Size = UDim2.new(1, 0, 0, 26),
                BackgroundTransparency = 1,
                ZIndex = 6,
                LayoutOrder = 0,
            }, Section)

            Make("TextLabel", {
                Size = UDim2.new(1, 0, 1, 0),
                BackgroundTransparency = 1,
                Text = sName:upper(),
                TextColor3 = Theme.SectionHeader,
                Font = Enum.Font.GothamBold,
                TextSize = 11,
                TextXAlignment = Enum.TextXAlignment.Left,
                LetterSpacing = 2,
                ZIndex = 7,
            }, Header)

            -- divider
            Make("Frame", {
                Size = UDim2.new(1, 0, 0, 1),
                Position = UDim2.new(0, 0, 1, -1),
                BackgroundColor3 = Theme.Accent,
                BackgroundTransparency = 0.75,
                BorderSizePixel = 0,
                ZIndex = 7,
            }, Header)

            local order = 1

            -- ── Helper: item row ──────────
            local function ItemRow(height)
                order = order + 1
                local row = Make("Frame", {
                    Size = UDim2.new(1, 0, 0, height or 36),
                    BackgroundTransparency = 1,
                    ZIndex = 6,
                    LayoutOrder = order,
                }, Section)
                return row
            end

            -- ============================================================
            --  SectionObj
            -- ============================================================
            local SectionObj = {}

            -- ── AddToggle ─────────────────
            function SectionObj:AddToggle(cfg)
                cfg = cfg or {}
                local name     = cfg.Name or "Toggle"
                local default  = cfg.Default or false
                local callback = cfg.Callback or function() end

                local row = ItemRow(36)

                Make("TextLabel", {
                    Size = UDim2.new(1, -60, 1, 0),
                    BackgroundTransparency = 1,
                    Text = name,
                    TextColor3 = Theme.Text,
                    Font = Enum.Font.Gotham,
                    TextSize = 13,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    ZIndex = 7,
                }, row)

                -- Track bg
                local Track = Make("Frame", {
                    Size = UDim2.new(0, 42, 0, 22),
                    Position = UDim2.new(1, -48, 0.5, -11),
                    BackgroundColor3 = default and Theme.ToggleOn or Theme.ToggleOff,
                    BorderSizePixel = 0,
                    ZIndex = 7,
                }, row)
                Corner(Track, 11)

                -- Knob
                local Knob = Make("Frame", {
                    Size = UDim2.new(0, 16, 0, 16),
                    Position = default
                        and UDim2.new(1, -19, 0.5, -8)
                        or  UDim2.new(0, 3,  0.5, -8),
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    BorderSizePixel = 0,
                    ZIndex = 8,
                }, Track)
                Corner(Knob, 8)

                local state = default

                local trackBtn = Make("TextButton", {
                    Size = UDim2.new(1, 0, 1, 0),
                    BackgroundTransparency = 1,
                    Text = "",
                    ZIndex = 9,
                }, Track)

                trackBtn.MouseButton1Click:Connect(function()
                    state = not state
                    if state then
                        Tween(Track, { BackgroundColor3 = Theme.ToggleOn }, 0.2)
                        Tween(Knob, { Position = UDim2.new(1, -19, 0.5, -8) }, 0.2, Enum.EasingStyle.Back)
                    else
                        Tween(Track, { BackgroundColor3 = Theme.ToggleOff }, 0.2)
                        Tween(Knob, { Position = UDim2.new(0, 3, 0.5, -8) }, 0.2, Enum.EasingStyle.Back)
                    end
                    callback(state)
                end)

                local toggle = { Value = default }
                function toggle:Set(v)
                    state = v
                    if v then
                        Track.BackgroundColor3 = Theme.ToggleOn
                        Knob.Position = UDim2.new(1, -19, 0.5, -8)
                    else
                        Track.BackgroundColor3 = Theme.ToggleOff
                        Knob.Position = UDim2.new(0, 3, 0.5, -8)
                    end
                    callback(v)
                end
                return toggle
            end

            -- ── AddSlider ─────────────────
            function SectionObj:AddSlider(cfg)
                cfg = cfg or {}
                local name     = cfg.Name     or "Slider"
                local min      = cfg.Min      or 0
                local max      = cfg.Max      or 100
                local default  = cfg.Default  or min
                local callback = cfg.Callback or function() end

                local row = ItemRow(50)

                local topRow = Make("Frame", {
                    Size = UDim2.new(1, 0, 0, 20),
                    BackgroundTransparency = 1,
                    ZIndex = 7,
                }, row)
                Make("TextLabel", {
                    Size = UDim2.new(0.7, 0, 1, 0),
                    BackgroundTransparency = 1,
                    Text = name,
                    TextColor3 = Theme.Text,
                    Font = Enum.Font.Gotham,
                    TextSize = 13,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    ZIndex = 8,
                }, topRow)
                local ValLabel = Make("TextLabel", {
                    Size = UDim2.new(0.3, 0, 1, 0),
                    Position = UDim2.new(0.7, 0, 0, 0),
                    BackgroundTransparency = 1,
                    Text = tostring(default),
                    TextColor3 = Theme.Accent,
                    Font = Enum.Font.GothamBold,
                    TextSize = 13,
                    TextXAlignment = Enum.TextXAlignment.Right,
                    ZIndex = 8,
                }, topRow)

                local Track = Make("Frame", {
                    Size = UDim2.new(1, 0, 0, 8),
                    Position = UDim2.new(0, 0, 0, 28),
                    BackgroundColor3 = Theme.SliderBg,
                    BorderSizePixel = 0,
                    ZIndex = 7,
                }, row)
                Corner(Track, 4)

                local pct = (default - min) / (max - min)
                local Fill = Make("Frame", {
                    Size = UDim2.new(pct, 0, 1, 0),
                    BackgroundColor3 = Theme.SliderFill,
                    BorderSizePixel = 0,
                    ZIndex = 8,
                }, Track)
                Corner(Fill, 4)
                Gradient(Fill,
                    Theme.AccentGlow,
                    Theme.AccentDim,
                    0
                )

                local Thumb = Make("Frame", {
                    Size = UDim2.new(0, 14, 0, 14),
                    Position = UDim2.new(pct, -7, 0.5, -7),
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    BorderSizePixel = 0,
                    ZIndex = 9,
                }, Track)
                Corner(Thumb, 7)
                Stroke(Thumb, Theme.Accent, 1.5)

                local dragging = false
                local function update(input)
                    local abs = Track.AbsolutePosition.X
                    local w   = Track.AbsoluteSize.X
                    local p   = math.clamp((input.Position.X - abs) / w, 0, 1)
                    local val = math.floor(min + p * (max - min))
                    Fill.Size = UDim2.new(p, 0, 1, 0)
                    Thumb.Position = UDim2.new(p, -7, 0.5, -7)
                    ValLabel.Text  = tostring(val)
                    callback(val)
                end

                Track.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        dragging = true
                        update(input)
                    end
                end)
                UserInputService.InputChanged:Connect(function(input)
                    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                        update(input)
                    end
                end)
                UserInputService.InputEnded:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        dragging = false
                    end
                end)

                local slider = { Value = default }
                function slider:Set(v)
                    local p = math.clamp((v - min) / (max - min), 0, 1)
                    Fill.Size = UDim2.new(p, 0, 1, 0)
                    Thumb.Position = UDim2.new(p, -7, 0.5, -7)
                    ValLabel.Text = tostring(v)
                    callback(v)
                end
                return slider
            end

            -- ── AddDropdown ───────────────
            function SectionObj:AddDropdown(cfg)
                cfg = cfg or {}
                local name     = cfg.Name     or "Dropdown"
                local options  = cfg.Options  or {}
                local default  = cfg.Default  or (options[1] or "")
                local callback = cfg.Callback or function() end

                local row = ItemRow(36)
                Make("TextLabel", {
                    Size = UDim2.new(0.45, 0, 1, 0),
                    BackgroundTransparency = 1,
                    Text = name,
                    TextColor3 = Theme.Text,
                    Font = Enum.Font.Gotham,
                    TextSize = 13,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    ZIndex = 7,
                }, row)

                local DropBtn = Make("TextButton", {
                    Size = UDim2.new(0.5, 0, 0, 28),
                    Position = UDim2.new(0.5, 0, 0.5, -14),
                    BackgroundColor3 = Theme.DropdownBg,
                    BorderSizePixel = 0,
                    Text = "",
                    ZIndex = 7,
                    AutoButtonColor = false,
                }, row)
                Corner(DropBtn, 6)
                Stroke(DropBtn, Theme.Border, 1)

                local Selected = Make("TextLabel", {
                    Size = UDim2.new(1, -28, 1, 0),
                    Position = UDim2.new(0, 10, 0, 0),
                    BackgroundTransparency = 1,
                    Text = default,
                    TextColor3 = Theme.Text,
                    Font = Enum.Font.Gotham,
                    TextSize = 12,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    ZIndex = 8,
                }, DropBtn)

                Make("TextLabel", {
                    Size = UDim2.new(0, 18, 1, 0),
                    Position = UDim2.new(1, -22, 0, 0),
                    BackgroundTransparency = 1,
                    Text = "▾",
                    TextColor3 = Theme.Accent,
                    Font = Enum.Font.GothamBold,
                    TextSize = 14,
                    ZIndex = 8,
                }, DropBtn)

                -- Dropdown list (opens below)
                local OptionList = Make("Frame", {
                    Name = "OptionList",
                    Size = UDim2.new(1, 0, 0, 0),
                    Position = UDim2.new(0, 0, 1, 4),
                    BackgroundColor3 = Theme.DropdownBg,
                    BorderSizePixel = 0,
                    ZIndex = 20,
                    Visible = false,
                    ClipsDescendants = true,
                }, DropBtn)
                Corner(OptionList, 6)
                Stroke(OptionList, Theme.Border, 1)
                Make("UIListLayout", {
                    Padding = UDim.new(0, 2),
                    FillDirection = Enum.FillDirection.Vertical,
                }, OptionList)
                Padding(OptionList, 4)

                for _, opt in ipairs(options) do
                    local OptBtn = Make("TextButton", {
                        Size = UDim2.new(1, 0, 0, 26),
                        BackgroundColor3 = Theme.DropdownBg,
                        BorderSizePixel = 0,
                        Text = opt,
                        TextColor3 = Theme.Text,
                        Font = Enum.Font.Gotham,
                        TextSize = 12,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        ZIndex = 21,
                        AutoButtonColor = false,
                    }, OptionList)
                    Corner(OptBtn, 4)
                    Padding(OptBtn, 0, 8, 8, 0, 0)
                    OptBtn.MouseEnter:Connect(function()
                        Tween(OptBtn, { BackgroundColor3 = Theme.DropdownHover }, 0.1)
                    end)
                    OptBtn.MouseLeave:Connect(function()
                        Tween(OptBtn, { BackgroundColor3 = Theme.DropdownBg }, 0.1)
                    end)
                    OptBtn.MouseButton1Click:Connect(function()
                        Selected.Text = opt
                        Tween(OptionList, { Size = UDim2.new(1, 0, 0, 0) }, 0.15)
                        task.delay(0.16, function() OptionList.Visible = false end)
                        callback(opt)
                    end)
                end

                local totalH = #options * 30 + 8
                local open = false
                DropBtn.MouseButton1Click:Connect(function()
                    open = not open
                    if open then
                        OptionList.Visible = true
                        Tween(OptionList, { Size = UDim2.new(1, 0, 0, totalH) }, 0.2, Enum.EasingStyle.Back)
                    else
                        Tween(OptionList, { Size = UDim2.new(1, 0, 0, 0) }, 0.15)
                        task.delay(0.16, function() OptionList.Visible = false end)
                    end
                end)

                local dd = { Value = default }
                function dd:Set(v)
                    Selected.Text = v
                    callback(v)
                end
                return dd
            end

            -- ── AddButton ─────────────────
            function SectionObj:AddButton(cfg)
                cfg = cfg or {}
                local name     = cfg.Name     or "Button"
                local callback = cfg.Callback or function() end

                local row = ItemRow(36)
                local Btn = Make("TextButton", {
                    Size = UDim2.new(1, 0, 0, 34),
                    Position = UDim2.new(0, 0, 0.5, -17),
                    BackgroundColor3 = Theme.ButtonBg,
                    BorderSizePixel = 0,
                    Text = name,
                    TextColor3 = Theme.ButtonText,
                    Font = Enum.Font.GothamBold,
                    TextSize = 13,
                    ZIndex = 7,
                    AutoButtonColor = false,
                }, row)
                Corner(Btn, 8)
                Gradient(Btn, Theme.AccentGlow, Theme.AccentDim, 90)

                Btn.MouseEnter:Connect(function()
                    Tween(Btn, { BackgroundColor3 = Theme.AccentGlow }, 0.15)
                end)
                Btn.MouseLeave:Connect(function()
                    Tween(Btn, { BackgroundColor3 = Theme.ButtonBg }, 0.15)
                end)
                Btn.MouseButton1Down:Connect(function()
                    Tween(Btn, { Size = UDim2.new(0.97, 0, 0, 30) }, 0.1)
                end)
                Btn.MouseButton1Up:Connect(function()
                    Tween(Btn, { Size = UDim2.new(1, 0, 0, 34) }, 0.15, Enum.EasingStyle.Back)
                end)
                Btn.MouseButton1Click:Connect(callback)
            end

            -- ── AddLabel (info row) ────────
            function SectionObj:AddLabel(cfg)
                cfg = cfg or {}
                local name  = cfg.Name  or "Label"
                local value = cfg.Value or ""

                local row = ItemRow(30)
                Make("TextLabel", {
                    Size = UDim2.new(0.6, 0, 1, 0),
                    BackgroundTransparency = 1,
                    Text = name,
                    TextColor3 = Theme.TextDim,
                    Font = Enum.Font.Gotham,
                    TextSize = 13,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    ZIndex = 7,
                }, row)
                local ValLbl = Make("TextLabel", {
                    Size = UDim2.new(0.4, 0, 1, 0),
                    Position = UDim2.new(0.6, 0, 0, 0),
                    BackgroundTransparency = 1,
                    Text = value,
                    TextColor3 = Theme.Accent,
                    Font = Enum.Font.GothamBold,
                    TextSize = 13,
                    TextXAlignment = Enum.TextXAlignment.Right,
                    ZIndex = 7,
                }, row)

                local lbl = {}
                function lbl:SetValue(v) ValLbl.Text = tostring(v) end
                return lbl
            end

            -- ── AddTextbox ────────────────
            function SectionObj:AddTextbox(cfg)
                cfg = cfg or {}
                local name        = cfg.Name        or "Textbox"
                local placeholder = cfg.Placeholder or "Type here..."
                local default     = cfg.Default     or ""
                local callback    = cfg.Callback    or function() end

                local row = ItemRow(36)
                Make("TextLabel", {
                    Size = UDim2.new(0.4, 0, 1, 0),
                    BackgroundTransparency = 1,
                    Text = name,
                    TextColor3 = Theme.Text,
                    Font = Enum.Font.Gotham,
                    TextSize = 13,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    ZIndex = 7,
                }, row)
                local Box = Make("TextBox", {
                    Size = UDim2.new(0.56, 0, 0, 28),
                    Position = UDim2.new(0.44, 0, 0.5, -14),
                    BackgroundColor3 = Theme.DropdownBg,
                    BorderSizePixel = 0,
                    Text = default,
                    PlaceholderText = placeholder,
                    TextColor3 = Theme.Text,
                    PlaceholderColor3 = Theme.TextMuted,
                    Font = Enum.Font.Gotham,
                    TextSize = 12,
                    ZIndex = 7,
                    ClearTextOnFocus = false,
                }, row)
                Corner(Box, 6)
                Stroke(Box, Theme.Border, 1)
                Padding(Box, 0, 8, 8, 0, 0)

                Box.FocusLost:Connect(function(enter)
                    if enter then callback(Box.Text) end
                end)
            end

            return SectionObj
        end -- AddSection

        return TabObj
    end -- AddTab

    -- ── Destroy ───────────────────────────
    function WindowObj:Destroy()
        if spinConn then spinConn:Disconnect() end
        ScreenGui:Destroy()
    end

    -- ── Notify ────────────────────────────
    function WindowObj:Notify(cfg)
        cfg = cfg or {}
        local title   = cfg.Title   or "SolarX"
        local message = cfg.Message or ""
        local duration = cfg.Duration or 3

        local notif = Make("Frame", {
            Size = UDim2.new(0, 280, 0, 60),
            Position = UDim2.new(1, 10, 1, -70),
            BackgroundColor3 = Theme.Surface,
            BorderSizePixel = 0,
            ZIndex = 50,
        }, ScreenGui)
        Corner(notif, 10)
        Stroke(notif, Theme.Accent, 1)

        Make("TextLabel", {
            Size = UDim2.new(1, -16, 0, 22),
            Position = UDim2.new(0, 12, 0, 8),
            BackgroundTransparency = 1,
            Text = title,
            TextColor3 = Theme.Accent,
            Font = Enum.Font.GothamBold,
            TextSize = 13,
            TextXAlignment = Enum.TextXAlignment.Left,
            ZIndex = 51,
        }, notif)
        Make("TextLabel", {
            Size = UDim2.new(1, -16, 0, 20),
            Position = UDim2.new(0, 12, 0, 30),
            BackgroundTransparency = 1,
            Text = message,
            TextColor3 = Theme.TextDim,
            Font = Enum.Font.Gotham,
            TextSize = 12,
            TextXAlignment = Enum.TextXAlignment.Left,
            ZIndex = 51,
        }, notif)

        -- Slide in
        Tween(notif, { Position = UDim2.new(1, -290, 1, -70) }, 0.4, Enum.EasingStyle.Back)
        task.delay(duration, function()
            Tween(notif, { Position = UDim2.new(1, 10, 1, -70) }, 0.35)
            task.delay(0.4, function() notif:Destroy() end)
        end)
    end

    return WindowObj
end

return SolarX
