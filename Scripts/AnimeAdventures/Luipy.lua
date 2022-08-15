getgenv().map = "tokyoghoul_infinite"
getgenv().waveToLose = 24
getgenv().infiniteUnits = {}
getgenv().getUnitId = {
    bulma = "{de44d3f9-a315-4132-9cd8-bee28c72b74c}",
    erwin = "{433ed73e-0874-4252-a5ae-3631c4956ff6}",
    arima = "{a8ea35a2-75c8-462b-96b2-9309a94c3ff9}"
}

for i, v in pairs(getgenv().getUnitId) do
    table.insert(getgenv().infiniteUnits, i)
end

repeat wait() until game:IsLoaded()

game:GetService("Players").LocalPlayer.Idled:connect(function()
    game:GetService("VirtualUser"):ClickButton2(Vector2.new())
end)

local function BuyItem()
    if getgenv().buyItem then
        if game:GetService("Workspace")["travelling_merchant"]["is_open"].Value == true then
            for _, v in pairs(game:GetService("Workspace")["travelling_merchant"].stand.items:GetChildren()) do
                for i = 1, #getgenv().itemsToBuy do
                    if string.find(v.Name, getgenv().itemsToBuy[i]) then
                        s, e = string.find(v.Name, getgenv().itemsToBuy[i])
                        if table.find(getgenv().itemsToBuy, string.sub(v.Name, s, e)) then
                            if getgenv().itemsToBuy[i] == "StarFruit" then
                                if string.find(v.Name, "Epic") then
                                    game:GetService("ReplicatedStorage").endpoints.client_to_server.buy_travelling_merchant_item:InvokeServer(string.gsub(v.Name, "Epic", ""))
                                end
                            else
                                game:GetService("ReplicatedStorage").endpoints.client_to_server.buy_travelling_merchant_item:InvokeServer(v.Name)
                            end
                        end
                    end
                end
            end
        end
    end
end
local function Join()
    game:GetService("ReplicatedStorage").endpoints.client_to_server.request_join_lobby:InvokeServer("_lobbytemplategreen6")
end
local function Create()
    local args = {
        [1] = "_lobbytemplategreen6",
        [2] = getgenv().map,
        [3] = true,
        [4] = "Hard"
    }
    game:GetService("ReplicatedStorage").endpoints.client_to_server.request_lock_level:InvokeServer(unpack(args))
end
local function StartTP()
    game:GetService("ReplicatedStorage").endpoints.client_to_server.request_start_game:InvokeServer("_lobbytemplategreen6")
end

local function StartGame()
    if game:GetService("Workspace")["_wave_num"].Value < 1 then
        game:GetService("ReplicatedStorage").endpoints.client_to_server.vote_start:InvokeServer()
    end
end
local function PlaceUnits()
    pcall(function()
        if game:GetService("Workspace")["_wave_num"].Value < 3 then

            local u1 = CFrame.new(-3016.866943359375, 58.58513259887695, -40.86863708496094) * CFrame.Angles(0, -0, -0)
            Place1(getgenv().getUnitId["bulma"], u1)
    
        end
        if game:GetService("Workspace")["_wave_num"].Value < 3 then
    
            local u1 = CFrame.new(-3000.849609375, 58.58513641357422, -64.70999908447266) * CFrame.Angles(0, -0, -0)
            local u2 = CFrame.new(-3000.864501953125, 58.58513641357422, -62.40230178833008) * CFrame.Angles(0, -0, -0)
            local u3 = CFrame.new(-3000.8408203125, 58.58513641357422, -60.03608703613281) * CFrame.Angles(0, -0, -0)
            Place3(getgenv().getUnitId["erwin"], u1, u2, u3)
    
        end
        if game:GetService("Workspace")["_wave_num"].Value > 2 and game:GetService("Workspace")["_wave_num"].Value < 6 then
    
            local u1 = CFrame.new(-2997.535400390625, 58.58513641357422, -68.66865539550781) * CFrame.Angles(0, 1.5707963705062866, 0)
            local u2 = CFrame.new(-2997.430419921875, 58.58513641357422, -66.29708862304688) * CFrame.Angles(0, 1.5707963705062866, 0)
            local u3 = CFrame.new(-2997.5947265625, 58.58513641357422, -63.99013900756836) * CFrame.Angles(0, 1.5707963705062866, 0)
            local u4 = CFrame.new(-2997.591064453125, 58.58513641357422, -61.75052261352539) * CFrame.Angles(0, 1.5707963705062866, 0)
            Place4(getgenv().getUnitId["arima"], u1, u2, u3, u4)
    
        end
    end)
end

function Place1(unitId, loc1)
    local UnitCFrame = loc1
    game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unitId, UnitCFrame)
end
function Place3(unitId, loc1, loc2, loc3)
    local UnitCFrame = loc1
    game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unitId, UnitCFrame)

    local UnitCFrame = loc2
    game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unitId, UnitCFrame)

    local UnitCFrame = loc3
    game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unitId, UnitCFrame)
end
function Place4(unitId, loc1, loc2, loc3, loc4)
    local UnitCFrame = loc1
    game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unitId, UnitCFrame)

    local UnitCFrame = loc2
    game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unitId, UnitCFrame)

    local UnitCFrame = loc3
    game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unitId, UnitCFrame)

    local UnitCFrame = loc4
    game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unitId, UnitCFrame)
end

local function AutoUpgrade()
    if game:GetService("Workspace")["_wave_num"].Value > 8  then
        pcall(function()
            for i, v in next, game:GetService("Workspace")["_UNITS"]:GetChildren() do
                if table.find(getgenv().infiniteUnits, v.Name) then
                    if v._stats.upgrade.Value < 10 then
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.upgrade_unit_ingame:InvokeServer(v)
                    end
                end
            end
        end)
    elseif game:GetService("Workspace")["_wave_num"].Value > 4 then
        pcall(function()
            for i, v in next, game:GetService("Workspace")["_UNITS"]:GetChildren() do
                if v.Name == "bulma" then
                    if v._stats.upgrade.Value < 10 then
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.upgrade_unit_ingame:InvokeServer(v)
                    end
                end
            end
        end)
    end
end
local function AutoBuff()
    pcall(function()
        if game:GetService("Workspace")["_wave_num"].Value > 4 then
            for i, v in next, game:GetService("Workspace")["_UNITS"]:GetChildren() do
                if v.Name == "erwin" then
                    if v:FindFirstChild("_stats").upgrade.Value >= 3 and v:FindFirstChild("_buffs")["damage_buff"].Value == 0 then
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.use_active_attack:InvokeServer(v)
                    end
                end
            end
        end
    end)
end
local function AutoSell()
    if game:GetService("Workspace")["_wave_num"].Value > getgenv().waveToLose -1 then
        for i, v in next, game:GetService("Workspace")["_UNITS"]:GetChildren() do
            if table.find(getgenv().infiniteUnits, v.Name) then
                game:GetService("ReplicatedStorage").endpoints.client_to_server.sell_unit_ingame:InvokeServer(v)
            end
        end
    end
end
local function TeleportLobby()
    if game:GetService("Workspace")["_DATA"].GameFinished.Value == true then
        task.wait(5)
        game:GetService("ReplicatedStorage").endpoints.client_to_server.teleport_back_to_lobby:InvokeServer()
    end
end 

if game.PlaceId == 8304191830 then
    while true do
        BuyItem()
        task.wait(1)
        Join()
        task.wait(1)
        Create()
        task.wait(1)
        StartTP()
        task.wait(5)
    end
elseif game.PlaceId == 8349889591 then
    repeat wait() until game:IsLoaded()
    task.wait(20)
    game.Players.LocalPlayer.PlayerGui:WaitForChild("MessageGui").Enabled = false
    _G.a = true 
    while _G.a do
        task.wait()
        if game.Players.LocalPlayer.PlayerGui.ResultsUI.Enabled == true then
            local button = game.Players.LocalPlayer.PlayerGui.ResultsUI.Holder.Buttons.Next
            local events = {"MouseButton1Click", "MouseButton1Down", "Activated"}
            for i,v in pairs(events) do
                for i,v in pairs(getconnections(button[v])) do
                    v:Fire()
                end
            end
        else
            task.wait()
            StartGame()
            PlaceUnits()
            AutoUpgrade()
            AutoBuff()
            AutoSell()
            TeleportLobby()
        end
    end
end
