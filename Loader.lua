repeat wait() until game:IsLoaded()

game:GetService("Players").LocalPlayer.Idled:connect(function()
    game:GetService("VirtualUser"):ClickButton2(Vector2.new())
end)

-- ANIME ADVENTURES
if game.PlaceId == 8304191830 or game.PlaceId == 8349889591 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/mazterziN/Hub/main/Scripts/AnimeAdventures/Main.lua"))()
    
-- ONE PUNCH FIGHTERS
elseif game.PlaceId == 10524502174 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/mazterziN/Hub/main/Scripts/OnePunchFighters.lua"))()

-- ANIME EVOLUTION
elseif game.PlaceId == 10723695195 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/mazterziN/Hub/main/Scripts/AnimeEvolution.lua"))()
end
