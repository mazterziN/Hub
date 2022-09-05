local Units = require(game.ReplicatedStorage.src.Loader).load_data(script, "Units")

if game.PlaceId == 8304191830 then

    _G.UnitsID = {}

    for i, v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.collection.grid.List.Outer.UnitFrames:GetChildren()) do
        if v:IsA("ImageButton") then
            if v.Equipped.Visible == true then
                for i, u in pairs(v.Main.petimage:GetChildren()) do
                    pcall(function()
                        if u:IsA("Model") then
                            if string.find(u.Name, ":shiny") then
                                unitName = Units[string.gsub(u.Name, ":shiny", "")]["id"]
                            else
                                unitName = Units[u.Name]["id"]
                            end
                        end
                    end)
                end
                table.insert(_G.UnitsID, unitName .. " - " .. v["_uuid"].Value)
            end
        end
    end
    setclipboard(table.concat(_G.UnitsID, "\n", 1, table.getn(_G.UnitsID)))
end
