repeat wait() until game:IsLoaded()

game:GetService("Players").LocalPlayer.Idled:connect(function()
    game:GetService("VirtualUser"):ClickButton2(Vector2.new())
end)

-- SONIC SPEED SIMULATOR
if game.PlaceId == 9049840490 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/mazterziN/Hub/main/Scripts/SonicSpeedSimulator.lua"))()

-- GRAND PIRATES
elseif game.PlaceId == 9136292138 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/mazterziN/Hub/main/Scripts/GrandPirates.lua"))()
    
-- ANIME ADVENTURES
elseif game.PlaceId == 8304191830 or game.PlaceId == 8349889591 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/mazterziN/Hub/main/Scripts/AnimeAdventures.lua"))()
    
-- ONE PUNCH FIGHTERS
elseif game.PlaceId == 10524502174 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/mazterziN/Hub/main/Scripts/OnePunchFighters.lua"))()

-- GENERAL
else
    loadstring(game:HttpGet("https://raw.githubusercontent.com/mazterziN/Hub/main/Scripts/General.lua"))()
end
