if game.PlaceId == 8349889591 then

    if not game:IsLoaded() then
        game.Loaded:Wait()
    end

    function PlaceUnits()
        local wave = game:GetService("Workspace")["_wave_num"].Value
        if wave < 5 then
            local uID = "{48ad3423-3e66-4608-9d6f-6c151a2ed436}"
            for i = 1, 1 do
                PlaceToLoc(uID, UnitPos("u1", i))
            end
        end
        if wave < 5 then
            local uID = "{6cad356e-d7a7-417e-888b-ecb1a3c13f3f}"
            for i = 1, 4 do
                PlaceToLoc(uID, UnitPos("u2", i))
            end
        end
        if wave < 5 then
            local uID = "{bfe31ceb-f0b6-4bba-a0f0-21fa930f5975}"
            for i = 1, 4 do
                PlaceToLoc(uID, UnitPos("u3", i))
            end
        end
        if wave > 4 then
            local uID = "{3ee5c033-8394-4e76-bede-5cabae6a2e5d}"
            for i = 1, 4 do
                PlaceToLoc(uID, UnitPos("u4", i))
            end
        end
        if wave > 4 then
            local uID = "{6e04e756-4d63-4cac-9f06-1a43fc2283d0}"
            for i = 1, 4 do
                PlaceToLoc(uID, UnitPos("u5", i))
            end
        end
        if wave > 4 then
            local uID = "{5df02cfe-696b-4263-9b8b-34baabb1b7f7}"
            for i = 1, 4 do
                PlaceToLoc(uID, UnitPos("u6", i))
            end
        end
    end
    function UnitPos(unit, pos)
        local UnitPos = {
            u1 = {
                CFrame.new(-598, 21.5, -830)
            },
            u2 = {
                CFrame.new(-619, 6.8, -809.2),
                CFrame.new(-619.8, 6.8, -809.2),
                CFrame.new(-620.6, 6.8, -809.2),
                CFrame.new(-621.4, 6.8, -809.2)
            },
            u3 = {
                CFrame.new(-618.2, 6.8, -809.2),
                CFrame.new(-617.4, 6.8, -809.2),
                CFrame.new(-616.6, 6.8, -809.2),
                CFrame.new(-615.8, 6.8, -809.2)
            },
            u4 = {
                CFrame.new(-621.4, 6.8, -809.2),
                CFrame.new(-622.2, 6.8, -809.2),
                CFrame.new(-623, 6.8, -809.2),
                CFrame.new(-623.8, 6.8, -809.2)
            },
            u5 = {
                CFrame.new(-615, 6.8, -809.2),
                CFrame.new(-614.2, 6.8, -809.2),
                CFrame.new(-613.4, 6.8, -809.2),
                CFrame.new(-612.6, 6.8, -809.2)
            },
            u6 = {
                CFrame.new(-624.6.2, 6.8, -809.2),
                CFrame.new(-625.4, 6.8, -809.2),
                CFrame.new(-626.2, 6.8, -809.2),
                CFrame.new(-627, 6.8, -809.2)
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
