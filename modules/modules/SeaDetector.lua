-- UUltimatLY HUB | modules/SeaDetector.lua
-- AUTO DETECT SEA BY PLACEID | Made for KUKI

local PlaceId = game.PlaceId

if PlaceId == 2753915549 then        -- Old World
    getgenv().CurrentSea = 1
    print("UUltimatLY HUB → Detected Sea 1 (Old World)")
elseif PlaceId == 4442272183 then    -- New World
    getgenv().CurrentSea = 2
    print("UUltimatLY HUB → Detected Sea 2 (New World)")
elseif PlaceId == 7449423635 then    -- Third Sea
    getgenv().CurrentSea = 3
    print("UUltimatLY HUB → Detected Sea 3 (Third Sea)")
else
    getgenv().CurrentSea = 1
end

-- Load correct table
if getgenv().CurrentSea == 1 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/erenxkuki/UUltimatLY-Hub/main/modules/Sea1Table.lua"))()
elseif getgenv().CurrentSea == 2 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/erenxkuki/UUltimatLY-Hub/main/modules/Sea2Table.lua"))()
elseif getgenv().CurrentSea == 3 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/erenxkuki/UUltimatLY-Hub/main/modules/Sea3Table.lua"))()
end
