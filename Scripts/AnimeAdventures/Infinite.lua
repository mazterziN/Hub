repeat wait() until game:IsLoaded()

getgenv().getUnitId = {
    money = uMoney,
    buff = uBuff,
    primary = uPrimary,
    secondary = uSecondary,
    hill = uHill
}

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
        [2] = getgenv().map .."_infinite",
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
        -- HxH
        if getgenv().map == "hxhant" then
            if game:GetService("Workspace")["_wave_num"].Value < 3 then
                u1 = CFrame.new(-166.13230895996094, 23.08652687072754, 2939.481201171875) * CFrame.Angles(3.1415927410125732, -0, -3.1415927410125732)
                Place1(getgenv().getUnitId["money"], u1)
            end
            if game:GetService("Workspace")["_wave_num"].Value < 3 then
                u1 = CFrame.new(-201.57717895507812, 23.01263999938965, 2960.910888671875) * CFrame.Angles(3.1415927410125732, -0, -3.1415927410125732)
                u2 = CFrame.new(-199.13308715820312, 23.01263999938965, 2960.990966796875) * CFrame.Angles(3.1415927410125732, -0, -3.1415927410125732)
                u3 = CFrame.new(-196.98342895507812, 23.01263999938965, 2960.8310546875) * CFrame.Angles(3.1415927410125732, -0, -3.1415927410125732)
                Place3(getgenv().getUnitId["buff"], u1, u2, u3)
            end
            if game:GetService("Workspace")["_wave_num"].Value > 2 and game:GetService("Workspace")["_wave_num"].Value < 6 then
                u1 = CFrame.new(-200.44754028320312, 23.01263999938965, 2963.313720703125) * CFrame.Angles(3.1415927410125732, -0, -3.1415927410125732)
                u2 = CFrame.new(-198.4202117919922, 23.01263999938965, 2963.322998046875) * CFrame.Angles(3.1415927410125732, -0, -3.1415927410125732)
                u3 = CFrame.new(-196.4708709716797, 23.01263999938965, 2963.495361328125) * CFrame.Angles(3.1415927410125732, -0, -3.1415927410125732)
                u4 = CFrame.new(-194.35357666015625, 23.01263999938965, 2963.32275390625) * CFrame.Angles(0, -0, -0)
                Place4(getgenv().getUnitId["primary"], u1, u2, u3, u4)
            end
            if game:GetService("Workspace")["_wave_num"].Value > 6 and game:GetService("Workspace")["_wave_num"].Value < 12 then
                u1 = CFrame.new(-196.465576171875, 23.01263999938965, 2966.093017578125) * CFrame.Angles(3.1415927410125732, -0, -3.1415927410125732)
                u2 = CFrame.new(-198.77752685546875, 23.01263999938965, 2965.996826171875) * CFrame.Angles(3.1415927410125732, -0, -3.1415927410125732)
                u3 = CFrame.new(-200.83712768554688, 23.01263999938965, 2965.957763671875) * CFrame.Angles(3.1415927410125732, -0, -3.1415927410125732)
                u4 = CFrame.new(-200.13987731933594, 23.01263999938965, 2967.967529296875) * CFrame.Angles(3.1415927410125732, -0, -3.1415927410125732)
                Place4(getgenv().getUnitId["secondary"], u1, u2, u3, u4)
            end
        -- BLEACH
        elseif getgenv().map == "hueco" then
            if game:GetService("Workspace")["_wave_num"].Value < 3 then
                u1 = CFrame.new(-154.05145263671875, 132.66400146484375, -725.6512451171875) * CFrame.Angles(0, -0, -0)
                Place1(getgenv().getUnitId["money"], u1)
            end
            if game:GetService("Workspace")["_wave_num"].Value < 3 then
                u1 = CFrame.new(-188.1686248779297, 132.6639862060547, -761.1053466796875) * CFrame.Angles(0, -0, -0)
                u2 = CFrame.new(-187.72862243652344, 132.6639862060547, -759.0645751953125) * CFrame.Angles(0, -0, -0)
                u3 = CFrame.new(-187.40025329589844, 132.6639862060547, -757.1781005859375) * CFrame.Angles(0, -0, -0)
                Place3(getgenv().getUnitId["buff"], u1, u2, u3)
            end
            if game:GetService("Workspace")["_wave_num"].Value > 2 and game:GetService("Workspace")["_wave_num"].Value < 6 then
                u1 = CFrame.new(-190.58680725097656, 132.66400146484375, -760.87353515625) * CFrame.Angles(0, -0, -0)
                u2 = CFrame.new(-190.31472778320312, 132.66400146484375, -758.8143310546875) * CFrame.Angles(0, -0, -0)
                u3 = CFrame.new(-189.9259033203125, 132.66400146484375, -756.8162841796875) * CFrame.Angles(0, -0, -0)
                u4 = CFrame.new(-189.41905212402344, 132.66400146484375, -754.8712158203125) * CFrame.Angles(0, -0, -0)
                Place4(getgenv().getUnitId["primary"], u1, u2, u3, u4)
            end
            if game:GetService("Workspace")["_wave_num"].Value > 8 and game:GetService("Workspace")["_wave_num"].Value < 12 then
                u1 = CFrame.new(-192.7289276123047, 132.66400146484375, -760.8720703125) * CFrame.Angles(0, -0, -0)
                u2 = CFrame.new(-192.354248046875, 132.66400146484375, -758.7332763671875) * CFrame.Angles(0, -0, -0)
                u3 = CFrame.new(-191.98509216308594, 132.66400146484375, -756.726806640625) * CFrame.Angles(0, -0, -0)
                u4 = CFrame.new(-191.9520263671875, 132.66400146484375, -754.6868286132812) * CFrame.Angles(0, -0, -0)
                Place4(getgenv().getUnitId["secondary"], u1, u2, u3, u4)
            end
        -- TOKYO GHOUL
        elseif getgenv().map == "tokyoghoul" then
            if game:GetService("Workspace")["_wave_num"].Value < 3 then
                u1 = CFrame.new(-3016.866943359375, 58.58513259887695, -40.86863708496094) * CFrame.Angles(0, -0, -0)
                Place1(getgenv().getUnitId["money"], u1)
            end
            if game:GetService("Workspace")["_wave_num"].Value < 3 then
                u1 = CFrame.new(-3000.849609375, 58.58513641357422, -64.70999908447266) * CFrame.Angles(0, -0, -0)
                u2 = CFrame.new(-3000.864501953125, 58.58513641357422, -62.40230178833008) * CFrame.Angles(0, -0, -0)
                u3 = CFrame.new(-3000.8408203125, 58.58513641357422, -60.03608703613281) * CFrame.Angles(0, -0, -0)
                Place3(getgenv().getUnitId["buff"], u1, u2, u3)
            end
            if game:GetService("Workspace")["_wave_num"].Value > 2 and game:GetService("Workspace")["_wave_num"].Value < 6 then
                u1 = CFrame.new(-2997.535400390625, 58.58513641357422, -68.66865539550781) * CFrame.Angles(0, 1.5707963705062866, 0)
                u2 = CFrame.new(-2997.430419921875, 58.58513641357422, -66.29708862304688) * CFrame.Angles(0, 1.5707963705062866, 0)
                u3 = CFrame.new(-2997.5947265625, 58.58513641357422, -63.99013900756836) * CFrame.Angles(0, 1.5707963705062866, 0)
                u4 = CFrame.new(-2997.591064453125, 58.58513641357422, -61.75052261352539) * CFrame.Angles(0, 1.5707963705062866, 0)
                Place4(getgenv().getUnitId["primary"], u1, u2, u3, u4)
            end
        -- NAMEK
        elseif getgenv().map == "namek" then
            if game:GetService("Workspace")["_wave_num"].Value < 4 then
                u1 = CFrame.new(-2914.83544921875, 91.80620574951172, -737.7935180664062) * CFrame.Angles(3.1415927410125732, -0, -3.1415927410125732)
                Place1(getgenv().getUnitId["money"], u1)
            end
            if game:GetService("Workspace")["_wave_num"].Value < 4 then
                u1 = CFrame.new(-2940.32861328125, 91.80620574951172, -706.9010009765625) * CFrame.Angles(3.1415927410125732, -0, -3.1415927410125732)
                u2 = CFrame.new(-2942.4169921875, 91.80620574951172, -706.8063354492188) * CFrame.Angles(3.1415927410125732, -0, -3.1415927410125732)
                u3 = CFrame.new(-2944.421875, 91.80620574951172, -707.0632934570312) * CFrame.Angles(3.1415927410125732, -0, -3.1415927410125732)
                Place3(getgenv().getUnitId["buff"], u1, u2, u3)
            end
            if game:GetService("Workspace")["_wave_num"].Value > 3 and game:GetService("Workspace")["_wave_num"].Value < 7 then
                u1 = CFrame.new(-2939.342529296875, 91.80620574951172, -703.744140625) * CFrame.Angles(3.1415927410125732, -0, -3.1415927410125732)
                u2 = CFrame.new(-2941.7685546875, 91.80620574951172, -703.731689453125) * CFrame.Angles(3.1415927410125732, -0, -3.1415927410125732)
                u3 = CFrame.new(-2943.829345703125, 91.80620574951172, -704.05126953125) * CFrame.Angles(3.1415927410125732, -0, -3.1415927410125732)
                u4 = CFrame.new(-2945.931396484375, 91.80620574951172, -704.1384887695312) * CFrame.Angles(3.1415927410125732, -0, -3.1415927410125732)
                Place4(getgenv().getUnitId["primary"], u1, u2, u3, u4)
            end
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
                if tostring(v["_stats"].player.Value) == game.Players.LocalPlayer.Name then
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
                elseif v.Name == "kisuke_evolved" then
                    if v:FindFirstChild("_stats").upgrade.Value >= 6 and v:FindFirstChild("_buffs")["attack_cooldown_buff"].Value == 0 and v:FindFirstChild("_buffs")["range_buff"].Value == 0 then
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
            if tostring(v["_stats"].player.Value) == game.Players.LocalPlayer.Name then
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
