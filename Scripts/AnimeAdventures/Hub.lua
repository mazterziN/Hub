local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/MaterialLua/master/Module.lua"))()

if game.PlaceId == 8304191830 then

    _G.AutoSell = false
    _G.Rarities = {"Rare", "Epic", "Legendary", "Mythic", "Secret"}
    _G.RarityToSell = {}

    repeat wait() until game:IsLoaded()

    local Units = require(game.ReplicatedStorage.src.Loader).load_data(script, "Units")

    local UI = Material.Load({
        Title = " MAZTER HUB • Anime Adventures",
        Style = 1,
        SizeX = 300,
        SizeY = 300,
        Theme = "Dark",
    })
    local MainPg = UI.New({
        Title = "MAIN"
    })
    MainPg.Toggle({
        Text = "Auto Sell",
        Callback = function(v)
            _G.AutoSell = v
        end,
        Enabled = false
    })
    local SRarityDropdown = MainPg.Dropdown({
        Text = "Rarities To Sell",
        Callback = function(op)
            if not table.find(_G.RarityToSell, op) then
                table.insert(_G.RarityToSell, op)
            else
                table.remove(_G.RarityToSell, table.find(_G.RarityToSell, op))
            end
        end,
        Options = _G.Rarities
    })

-- AUTO SELL UNIT PER RARITY
    spawn(function()
        while wait() do
            if _G.AutoSell then
                game:GetService("Players").LocalPlayer.PlayerGui.MessageGui.Enabled = false
                for i, v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.collection.grid.List.Outer.UnitFrames:GetChildren()) do
                    if v:IsA("ImageButton") then
                        for i, u in pairs(v.Main.petimage:GetChildren()) do
                            pcall(function()
                                if u:IsA("Model") then
                                    if string.find(u.Name, ":shiny") then
                                        unitRarity = Units[string.gsub(u.Name, ":shiny", "")]["rarity"]
                                    else
                                        unitRarity = Units[u.Name]["rarity"]
                                    end
                                end
                            end)
                        end
                        if table.find(_G.RarityToSell, unitRarity) then
                            game:GetService("ReplicatedStorage").endpoints.client_to_server.sell_units:InvokeServer({v["_uuid"].Value})
                        end
                    end
                end
            end
        end
    end)
-- AUTO SET TEXT RARITIES DROPDOWN
    spawn(function()
        while wait() do
            if #_G.RarityToSell > 0 then
                SRarityDropdown:SetText("Rarities: ".. table.concat(_G.RarityToSell, ", "))
            else
                SRarityDropdown:SetText("Rarities To Sell")
            end
        end
    end)

elseif game.PlaceId == 8349889591 then

    _G.AutoBuff = false

    _G.AutoUpgrade = false
    _G.UnitsToUpgrade = {}

    _G.AutoSell = false
    _G.UnitsToSell = {}
    _G.SelectedWave = 15
    _G.SellInWave = false

    _G.Units = {}

    repeat wait() until game:IsLoaded()

    local UI = Material.Load({
        Title = " MAZTER HUB • Anime Adventures",
        Style = 1,
        SizeX = 300,
        SizeY = 325,
        Theme = "Dark",
    })
    local MainPg = UI.New({
        Title = "MAIN"
    })
    local UpPg = UI.New({
        Title = "UPGRADE"
    })
    local SellPg = UI.New({
        Title = "SELL"
    })

    MainPg.Toggle({
        Text = "Auto Erwin Buff",
        Callback = function(v)
            _G.AutoBuff = v
        end,
        Enabled = false
    })

    UpPg.Toggle({
        Text = "Auto Upgrade",
        Callback = function(v)
            _G.AutoUpgrade = v
        end,
        Enabled = false
    })
    local UUnitsDropdown = UpPg.Dropdown({
        Text = "Units",
        Callback = function(op)
            if not table.find(_G.UnitsToUpgrade, op) then
                table.insert(_G.UnitsToUpgrade, op)
            else
                table.remove(_G.UnitsToUpgrade, table.find(_G.UnitsToUpgrade, op))
            end
        end,
        Options = _G.Units
    })
    UpPg.Button({
        Text = "Refresh Units",
        Callback = function()
            _G.Units = {}
            for i, v in pairs(game:GetService("Workspace")["_UNITS"]:GetChildren()) do
                if not table.find(_G.Units, v.Name) then
                    if tostring(v["_stats"].player.Value) == game.Players.LocalPlayer.Name then
                        if v.Name ~= "aot_generic" then
                            table.insert(_G.Units, v.Name)
                        end
                    end
                end
            end
            UUnitsDropdown:SetOptions(_G.Units)
        end
    })

    SellPg.Toggle({
        Text = "Auto Sell",
        Callback = function(v)
            _G.AutoSell = v
        end,
        Enabled = false
    })
    SellPg.Toggle({
        Text = "Sell in Selected Wave",
        Callback = function(v)
            _G.SellInWave = v
        end,
        Enabled = false
    })
    local SUnitsDropdown = SellPg.Dropdown({
        Text = "Units",
        Callback = function(op)
            if not table.find(_G.UnitsToSell, op) then
                table.insert(_G.UnitsToSell, op)
            else
                table.remove(_G.UnitsToSell, table.find(_G.UnitsToSell, op))
            end
        end,
        Options = _G.Units
    })
    SellPg.Button({
        Text = "Refresh Units",
        Callback = function()
            _G.Units = {}
            for i, v in pairs(game:GetService("Workspace")["_UNITS"]:GetChildren()) do
                if not table.find(_G.Units, v.Name) then
                    if tostring(v["_stats"].player.Value) == game.Players.LocalPlayer.Name then
                        if v.Name ~= "aot_generic" then
                            table.insert(_G.Units, v.Name)
                        end
                    end
                end
            end
            SUnitsDropdown:SetOptions(_G.Units)
        end
    })
    SellPg.Slider({
        Text = "Wave",
        Callback = function(v)
            _G.SelectedWave = v
        end,
        Min = 0,
        Max = 50,
        Def = 15
    })
    SellPg.Button({
        Text = "Sell All Units",
        Callback = function()
            _G.Units = {}
            for i, v in pairs(game:GetService("Workspace")["_UNITS"]:GetChildren()) do
                if not table.find(_G.Units, v.Name) then
                    if tostring(v["_stats"].player.Value) == game.Players.LocalPlayer.Name then
                        if v.Name ~= "aot_generic" then
                            table.insert(_G.Units, v.Name)
                        end
                    end
                end
            end
            for i, v in next, game:GetService("Workspace")["_UNITS"]:GetChildren() do
                if table.find(_G.Units, v.Name) then
                    if tostring(v["_stats"].player.Value) == game.Players.LocalPlayer.Name then
                        if v.Name ~= "bulma" or v.Name ~= "bulma:shiny" or v.Name ~= "aot_generic" then
                            game:GetService("ReplicatedStorage").endpoints.client_to_server.sell_unit_ingame:InvokeServer(v)
                        end
                    end
                end
            end
        end
    })

-- AUTO ERWIN BUFF
    spawn(function()
        while wait() do
            if _G.AutoBuff then
                pcall(function()
                    for i, v in next, game:GetService("Workspace")["_UNITS"]:GetChildren() do
                        if v.Name == "erwin" then
                            if tostring(v["_stats"].player.Value) == game.Players.LocalPlayer.Name then
                                if v:FindFirstChild("_stats").upgrade.Value >= 3 and v:FindFirstChild("_buffs")["damage_buff"].Value == 0 then
                                    game:GetService("ReplicatedStorage").endpoints.client_to_server.use_active_attack:InvokeServer(v)
                                end
                            end
                        end
                    end
                end)
            end
        end
    end)
-- AUTO UPGRADE
    spawn(function()
        while wait() do
            if _G.AutoUpgrade then
                pcall(function()
                    game:GetService("Players").LocalPlayer.PlayerGui.MessageGui.Enabled = false
                    for i, v in next, game:GetService("Workspace")["_UNITS"]:GetChildren() do
                        if tostring(v["_stats"].player.Value) == game.Players.LocalPlayer.Name then
                            if table.find(_G.UnitsToUpgrade, v.Name) then
                                game:GetService("ReplicatedStorage").endpoints.client_to_server.upgrade_unit_ingame:InvokeServer(v)
                            end
                        end
                    end
                end)
            end
        end
    end)
-- AUTO SELL
    spawn(function()
        while wait() do
            if _G.AutoSell then
                pcall(function()
                    for i, v in next, game:GetService("Workspace")["_UNITS"]:GetChildren() do
                        if tostring(v["_stats"].player.Value) == game.Players.LocalPlayer.Name then
                            if table.find(_G.UnitsToSell, v.Name) then
                                game:GetService("Players").LocalPlayer.PlayerGui.MessageGui.Enabled = false
                                if _G.SellInWave then
                                    if game:GetService("Workspace")["_wave_num"].Value == _G.SelectedWave then
                                        game:GetService("ReplicatedStorage").endpoints.client_to_server.sell_unit_ingame:InvokeServer(v)
                                    end
                                else
                                    game:GetService("ReplicatedStorage").endpoints.client_to_server.sell_unit_ingame:InvokeServer(v)
                                end
                            end
                        end
                    end
                end)
            end
        end
    end)
-- AUTO SET TEXT UPGRADE DROPDOWN
    spawn(function()
        while wait() do
            if #_G.UnitsToUpgrade > 0 then
                UUnitsDropdown:SetText("Units: ".. table.concat(_G.UnitsToUpgrade, ", "))
            else
                UUnitsDropdown:SetText("Units")
            end
        end
    end)
-- AUTO SET TEXT SELL DROPDOWN
    spawn(function()
        while wait() do
            if #_G.UnitsToSell > 0 then
                SUnitsDropdown:SetText("Units: ".. table.concat(_G.UnitsToSell, ", "))
            else
                SUnitsDropdown:SetText("Units")
            end
        end
    end)
end
