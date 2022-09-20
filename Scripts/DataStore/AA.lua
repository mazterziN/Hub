local AA = {}

function AA.Whitelist()
    return {
        1340755305, -- MAZTER
        1022210737, -- LUIPY
        1934778943, -- SHONEN
        113452795, -- MUDINHO
        2427591310 -- NINJA
    }
end

function AA.GetMaps()
    return {
        "Dragon Ball Z",
        "Tokyo Ghoul",
        "Bleach",
        "Hunter x Hunter"
    }
end
function AA.GetMapName(mapId)
    local m;
    if mapId == "namek" then
        m = "Dragon Ball Z"
    elseif mapId == "tokyoghoul" then
        m = "Tokyo Ghoul"
    elseif mapId == "hueco" then
        m = "Bleach"
    elseif mapId == "hxhant" then
        m = "Hunter x Hunter"
    end
    return m
end
function AA.GetMapID(mapName)
    local m;
    if mapName == "Dragon Ball Z" then
        m = "namek"
    elseif mapName == "Tokyo Ghoul" then
        m = "tokyoghoul"
    elseif mapName == "Bleach" then
        m = "hueco"
    elseif mapName == "Hunter x Hunter" then
        m = "hxhant"
    end
    return m
end

function AA.PlaceUnits()
    pcall(function()
        -- HxH
        if _G.Config.Map == "hxhant" then
            if game:GetService("Workspace")["_wave_num"].Value < 3 then
                uID = string.split(_G.Config.Units["u1"], " ")
                for i = 1, 1 do
                    PlaceToLoc(uID[3], UnitPos(_G.Config.Map, "u1", i))
                end
            end
            if game:GetService("Workspace")["_wave_num"].Value < 3 then
                uID = string.split(_G.Config.Units["u2"], " ")
                for i = 1, 3 do
                    PlaceToLoc(uID[3], UnitPos(_G.Config.Map, "u2", i))
                end
            end
            if game:GetService("Workspace")["_wave_num"].Value > 2 and game:GetService("Workspace")["_wave_num"].Value < 6 then
                uID = string.split(_G.Config.Units["u3"], " ")
                for i = 1, 4 do
                    PlaceToLoc(uID[3], UnitPos(_G.Config.Map, "u3", i))
                end
            end
            if game:GetService("Workspace")["_wave_num"].Value > 6 and game:GetService("Workspace")["_wave_num"].Value < 16 then
                uID = string.split(_G.Config.Units["u4"], " ")
                for i = 1, 4 do
                    PlaceToLoc(uID[3], UnitPos(_G.Config.Map, "u4", i))
                end
            end
            if game:GetService("Workspace")["_wave_num"].Value > 10 and game:GetService("Workspace")["_wave_num"].Value < 20 then
                uID = string.split(_G.Config.Units["u5"], " ")
                for i = 1, 4 do
                    PlaceToLoc(uID[3], UnitPos(_G.Config.Map, "u5", i))
                end
            end
            if game:GetService("Workspace")["_wave_num"].Value > 10 and game:GetService("Workspace")["_wave_num"].Value < 20 then
                uID = string.split(_G.Config.Units["u6"], " ")  
                for i = 1, 5 do
                    PlaceToLoc(uID[3], UnitPos(_G.Config.Map, "u6", i))
                end
            end
        -- BLEACH
        elseif _G.Config.Map == "hueco" then
            if game:GetService("Workspace")["_wave_num"].Value < 3 then
                uID = string.split(_G.Config.Units["u1"], " ")
                u1 = CFrame.new(-154.05145263671875, 132.66400146484375, -725.6512451171875) * CFrame.Angles(0, -0, -0)
                PlaceToLoc(uID[3], u1)
            end
            if game:GetService("Workspace")["_wave_num"].Value < 3 then
                uID = string.split(_G.Config.Units["u2"], " ")
                u1 = CFrame.new(-188.1686248779297, 132.6639862060547, -761.1053466796875) * CFrame.Angles(0, -0, -0)
                u2 = CFrame.new(-187.72862243652344, 132.6639862060547, -759.0645751953125) * CFrame.Angles(0, -0, -0)
                u3 = CFrame.new(-187.40025329589844, 132.6639862060547, -757.1781005859375) * CFrame.Angles(0, -0, -0)
                PlaceToLoc(uID[3], u1, u2, u3)
            end
            if game:GetService("Workspace")["_wave_num"].Value > 2 and game:GetService("Workspace")["_wave_num"].Value < 6 then
                uID = string.split(_G.Config.Units["u3"], " ")
                u1 = CFrame.new(-190.58680725097656, 132.66400146484375, -760.87353515625) * CFrame.Angles(0, -0, -0)
                u2 = CFrame.new(-190.31472778320312, 132.66400146484375, -758.8143310546875) * CFrame.Angles(0, -0, -0)
                u3 = CFrame.new(-189.9259033203125, 132.66400146484375, -756.8162841796875) * CFrame.Angles(0, -0, -0)
                u4 = CFrame.new(-189.41905212402344, 132.66400146484375, -754.8712158203125) * CFrame.Angles(0, -0, -0)
                PlaceToLoc(uID[3], u1, u2, u3, u4)
            end
            if game:GetService("Workspace")["_wave_num"].Value > 8 and game:GetService("Workspace")["_wave_num"].Value < 12 then
                uID = string.split(_G.Config.Units["u4"], " ")
                u1 = CFrame.new(-192.7289276123047, 132.66400146484375, -760.8720703125) * CFrame.Angles(0, -0, -0)
                u2 = CFrame.new(-192.354248046875, 132.66400146484375, -758.7332763671875) * CFrame.Angles(0, -0, -0)
                u3 = CFrame.new(-191.98509216308594, 132.66400146484375, -756.726806640625) * CFrame.Angles(0, -0, -0)
                u4 = CFrame.new(-191.9520263671875, 132.66400146484375, -754.6868286132812) * CFrame.Angles(0, -0, -0)
                PlaceToLoc(uID[3], u1, u2, u3, u4)
            end
        -- TOKYO GHOUL
        elseif _G.Config.Map == "tokyoghoul" then
            if game:GetService("Workspace")["_wave_num"].Value < 3 then
                u1 = CFrame.new(-3016.866943359375, 58.58513259887695, -40.86863708496094) * CFrame.Angles(0, -0, -0)
                PlaceToLoc(_G.Config.Units["u1"], u1)
            end
            if game:GetService("Workspace")["_wave_num"].Value < 3 then
                u1 = CFrame.new(-3000.849609375, 58.58513641357422, -64.70999908447266) * CFrame.Angles(0, -0, -0)
                u2 = CFrame.new(-3000.864501953125, 58.58513641357422, -62.40230178833008) * CFrame.Angles(0, -0, -0)
                u3 = CFrame.new(-3000.8408203125, 58.58513641357422, -60.03608703613281) * CFrame.Angles(0, -0, -0)
                PlaceToLoc(_G.Config.Units["u2"], u1, u2, u3)
            end
            if game:GetService("Workspace")["_wave_num"].Value > 2 and game:GetService("Workspace")["_wave_num"].Value < 6 then
                u1 = CFrame.new(-2997.535400390625, 58.58513641357422, -68.66865539550781) * CFrame.Angles(0, 1.5707963705062866, 0)
                u2 = CFrame.new(-2997.430419921875, 58.58513641357422, -66.29708862304688) * CFrame.Angles(0, 1.5707963705062866, 0)
                u3 = CFrame.new(-2997.5947265625, 58.58513641357422, -63.99013900756836) * CFrame.Angles(0, 1.5707963705062866, 0)
                u4 = CFrame.new(-2997.591064453125, 58.58513641357422, -61.75052261352539) * CFrame.Angles(0, 1.5707963705062866, 0)
                PlaceToLoc(_G.Config.Units["u3"], u1, u2, u3, u4)
            end
        -- NAMEK
        elseif _G.Config.Map == "namek" then
            if game:GetService("Workspace")["_wave_num"].Value < 4 then
                u1 = CFrame.new(-2914.83544921875, 91.80620574951172, -737.7935180664062) * CFrame.Angles(3.1415927410125732, -0, -3.1415927410125732)
                PlaceToLoc(_G.Config.Units["u1"], u1)
            end
            if game:GetService("Workspace")["_wave_num"].Value < 4 then
                u1 = CFrame.new(-2940.32861328125, 91.80620574951172, -706.9010009765625) * CFrame.Angles(3.1415927410125732, -0, -3.1415927410125732)
                u2 = CFrame.new(-2942.4169921875, 91.80620574951172, -706.8063354492188) * CFrame.Angles(3.1415927410125732, -0, -3.1415927410125732)
                u3 = CFrame.new(-2944.421875, 91.80620574951172, -707.0632934570312) * CFrame.Angles(3.1415927410125732, -0, -3.1415927410125732)
                PlaceToLoc(_G.Config.Units["u2"], u1, u2, u3)
            end
            if game:GetService("Workspace")["_wave_num"].Value > 3 and game:GetService("Workspace")["_wave_num"].Value < 7 then
                u1 = CFrame.new(-2939.342529296875, 91.80620574951172, -703.744140625) * CFrame.Angles(3.1415927410125732, -0, -3.1415927410125732)
                u2 = CFrame.new(-2941.7685546875, 91.80620574951172, -703.731689453125) * CFrame.Angles(3.1415927410125732, -0, -3.1415927410125732)
                u3 = CFrame.new(-2943.829345703125, 91.80620574951172, -704.05126953125) * CFrame.Angles(3.1415927410125732, -0, -3.1415927410125732)
                u4 = CFrame.new(-2945.931396484375, 91.80620574951172, -704.1384887695312) * CFrame.Angles(3.1415927410125732, -0, -3.1415927410125732)
                PlaceToLoc(_G.Config.Units["u3"], u1, u2, u3, u4)
            end
        end
    end)
end
function PlaceToLoc(unitId, loc1)
    if game:GetService("Workspace")["_wave_num"].Value < _G.Config.WaveToLose then
        local uPos = loc1
        game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unitId, uPos)
    end
end
function UnitPos(map, unit, pos)
    local UnitPos = {
        ["hxhant"] = {
            u1 = {
                CFrame.new(-166.13230895996094, 23.08652687072754, 2939.481201171875) * CFrame.Angles(0, -0, -0)},
            u2 = {
                CFrame.new(-191.25643920898438, 23.01263999938965, 2958.580322265625) * CFrame.Angles(0, -0, -0),
                CFrame.new(-189.54495239257812, 23.01263999938965, 2957.566162109375) * CFrame.Angles(0, -0, -0),
                CFrame.new(-187.8311309814453, 23.01263999938965, 2956.703857421875) * CFrame.Angles(0, -0, -0)},
            u3 = {
                CFrame.new(-191.16966247558594, 23.01263999938965, 2960.654541015625) * CFrame.Angles(0, -0, -0),
                CFrame.new(-188.9988250732422, 23.01263999938965, 2959.70068359375) * CFrame.Angles(0, -0, -0),
                CFrame.new(-186.71351623535156, 23.01263999938965, 2958.539794921875) * CFrame.Angles(0, -0, -0),
                CFrame.new(-184.6988525390625, 23.01263999938965, 2957.416015625) * CFrame.Angles(0, -0, -0)},
            u4 = {
                CFrame.new(-191.62603759765625, 23.01263999938965, 2962.73974609375) * CFrame.Angles(0, -0, -0),
                CFrame.new(-189.68350219726562, 23.01263999938965, 2962.099609375) * CFrame.Angles(0, -0, -0),
                CFrame.new(-187.8390350341797, 23.01263999938965, 2961.35986328125) * CFrame.Angles(0, -0, -0),
                CFrame.new(-185.89329528808594, 23.01263999938965, 2960.667724609375) * CFrame.Angles(0, -0, -0)},
            u5 = {
                u1 = CFrame.new(-193.2178955078125, 23.01263999938965, 2959.273681640625) * CFrame.Angles(0, -0, -0),
                u2 = CFrame.new(-193.9064178466797, 23.01263999938965, 2961.307373046875) * CFrame.Angles(0, -0, -0),
                u3 = CFrame.new(-195.5329132080078, 23.01263999938965, 2958.85205078125) * CFrame.Angles(0, -0, -0),
                u4 = CFrame.new(-196.47361755371094, 23.01263999938965, 2961.348388671875) * CFrame.Angles(0, -0, -0)},
            u6 = {
                CFrame.new(-193.25323486328125, 27.207609176635742, 2957.080322265625) * CFrame.Angles(0, -0, -0),
                CFrame.new(-191.33612060546875, 27.207609176635742, 2956.458740234375) * CFrame.Angles(0, -0, -0),
                CFrame.new(-189.900390625, 27.207609176635742, 2955.205322265625) * CFrame.Angles(0, -0, -0),
                CFrame.new(-188.2447052001953, 27.207609176635742, 2954.1806640625) * CFrame.Angles(0, -0, -0),
                CFrame.new(-191.97756958007812, 27.207609176635742, 2954.621337890625) * CFrame.Angles(0, -0, -0)}
        }
    }
    return UnitPos[map][unit][pos]
end

function AA.Codes()
    return {
        "HUNTER",
        "QUESTFIX",
        "HOLLOW",
        "MUGENTRAIN",
        "GHOUL",
        "subtomaokuma",
        "TWOMILLION",
        "TOADBOIGAMING",
        "SubToKelvingts",
        "SubToBlamspot",
        "FictioNTheFirst",
        "KingLuffy",
        "Cursed",
        "noclypso"
    }
end

return AA
