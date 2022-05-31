repeat wait() until game:IsLoaded() 
game:GetService("Players").LocalPlayer.Idled:connect(function()
    game:GetService("VirtualUser"):ClickButton2(Vector2.new())
end)

-- SONIC SPEED SIMULATOR
if game.PlaceId == 9049840490 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/mazterziN/Hub/main/Scripts/AllStarTowerDefense.lua"))()
    
-- ALL STAR TOWER DEFENSE
elseif game.PlaceId == 4996049426 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/mazterziN/Hub/main/Scripts/AllStarTowerDefense.lua"))()

-- GRAND PIRATES
elseif game.PlaceId == 9136292138 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/mazterziN/Hub/main/Scripts/GrandPirates.lua"))()

-- GENERAL
else
    loadstring(game:HttpGet("https://raw.githubusercontent.com/mazterziN/Hub/main/Scripts/General.lua"))()
end
