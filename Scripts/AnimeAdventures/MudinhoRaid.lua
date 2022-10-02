if game.PlaceId == 8349889591 then

    if not game:IsLoaded() then
        game.Loaded:Wait()
    end

    task.wait(10)

    function PlaceUnits()
        local wave = game:GetService("Workspace")["_wave_num"].Value
        local uID = "{7f4be37f-16c9-4fbf-b4e3-85b25a95e4f7}"
        for i = 1, 4 do
            PlaceToLoc(uID, UnitPos("u1", i))
        end
    end
    function UnitPos(unit, pos)
        local UnitPos = {
            u1 = {
                CFrame.new(-2310.8, 19.76, -107.7),
                CFrame.new(-2310.8, 19.76, -108.7),
                CFrame.new(-2310.8, 19.76, -109.7),
                CFrame.new(-2310.8, 19.76, -110.7)
            }
        }
        return UnitPos[unit][pos]
    end
    function PlaceToLoc(unitId, loc)
        game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unitId, loc)
    end

    local function StartGame()
        if game:GetService("Workspace")["_wave_num"].Value < 1 then
            game:GetService("ReplicatedStorage").endpoints.client_to_server.vote_start:InvokeServer()
        end
    end
    local function AutoUpgrade()
        local wave = game:GetService("Workspace")["_wave_num"].Value
        pcall(function()
            for i, v in next, game:GetService("Workspace")["_UNITS"]:GetChildren() do
                if tostring(v["_stats"].player.Value) == game.Players.LocalPlayer.Name then
                    game:GetService("ReplicatedStorage").endpoints.client_to_server.upgrade_unit_ingame:InvokeServer(v)
                end
            end
        end)
    end

    spawn(function()
        task.wait(1)
        while wait() do
            pcall(function()
                game:GetService("Players").LocalPlayer.PlayerGui.MessageGui.Enabled = false
                StartGame()
                PlaceUnits()
                AutoUpgrade()
            end)
        end
    end)
end
