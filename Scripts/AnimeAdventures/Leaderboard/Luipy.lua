if game.PlaceId == 8349889591 then

    if not game:IsLoaded() then
        game.Loaded:Wait()
    end

    function PlaceUnits()
        local wave = game:GetService("Workspace")["_wave_num"].Value
        if wave < 5 then
            local uID = "{de44d3f9-a315-4132-9cd8-bee28c72b74c}"
            for i = 1, 1 do
                PlaceToLoc(uID, UnitPos("u1", i))
            end
        end
        if wave < 5 then
            local uID = "{ba705835-7fe6-43f5-b9b2-841d9cdc1ec9}"
            for i = 1, 4 do
                PlaceToLoc(uID, UnitPos("u2", i))
            end
        end
        if wave < 5 then
            local uID = "{52afe808-e41e-4ef9-b05a-109484d2be6a}"
            for i = 1, 3 do
                PlaceToLoc(uID, UnitPos("u3", i))
            end
        end
        if wave > 4 then
            local uID = "{d34acf47-2bd7-4dff-a44e-33e4ad0aeed3}"
            for i = 1, 4 do
                PlaceToLoc(uID, UnitPos("u4", i))
            end
        end
        if wave > 4 then
            local uID = "{9388245f-8059-41b4-9a9d-fa93d8fde9c0}"
            for i = 1, 4 do
                PlaceToLoc(uID, UnitPos("u5", i))
            end
        end
        if wave > 4 then
            local uID = "{181f9fb9-da43-4051-bd89-dc81aa8e7ffc}"
            for i = 1, 4 do
                PlaceToLoc(uID, UnitPos("u6", i))
            end
        end
    end
    function UnitPos(unit, pos)
        local UnitPos = {
            u1 = {
                CFrame.new(-598, 22.5, -830)
            },
            u2 = {
                CFrame.new(-619, 6.8, -810.8),
                CFrame.new(-619.8, 6.8, -810.8),
                CFrame.new(-620.6, 6.8, -810.8),
                CFrame.new(-621.4, 6.8, -810.8)
            },
            u3 = {
                CFrame.new(-618.2, 6.8, -810.8),
                CFrame.new(-617.4, 6.8, -810.8),
                CFrame.new(-616.6, 6.8, -810.8)
            },
            u4 = {
                CFrame.new(-622.2, 6.8, -810.8),
                CFrame.new(-623, 6.8, -810.8),
                CFrame.new(-623.8, 6.8, -810.8),
                CFrame.new(-624.6, 6.8, -810.8)
            },
            u5 = {
                CFrame.new(-615.8, 6.8, -810.8),
                CFrame.new(-615, 6.8, -810.8),
                CFrame.new(-614.2, 6.8, -810.8),
                CFrame.new(-613.4, 6.8, -810.8)
            },
            u6 = {
                CFrame.new(-624.6.2, 6.8, -810.8),
                CFrame.new(-625.4, 6.8, -810.8),
                CFrame.new(-626.2, 6.8, -810.8),
                CFrame.new(-627, 6.8, -810.8)
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

    spawn(function()
        game:GetService("Workspace")["_terrain"].terrain.Houses:Destroy()
        pcall(function()
            game:GetService("Players").LocalPlayer.PlayerGui.MessageGui.Enabled = false
            while wait() do
                StartGame()
                PlaceUnits()
            end
        end)
    end)
end
