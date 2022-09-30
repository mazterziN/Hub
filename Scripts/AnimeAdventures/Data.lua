local DS = {}
function DS.Version()
    return "5.5.9"
end
function DS.Whitelist()
    return {
        1340755305, -- MAZTER
        1022210737, -- LUIPY
        1934778943, -- SHONEN
        113452795, -- MUDINHO
        2427591310, -- NINJA
        3421768158 -- DOUGLAS
    }
end
function DS.GetAllMaps()
    return {
        {magnolia = "Fairy Tail"},
        {hxhant = "Hunter x Hunter"},
        {hueco = "Bleach"},
        {tokyoghoul = "Tokyo Ghoul"},
        {marineford = "One Piece"},
        {naruto = "Naruto"},
        {demonslayer = "Kimetsu no Yaiba"},
        {aot = "Attack On Titan"},
        {namek = "Namek"}
    }   
end

function DS.PlaceUnits(option)
    local wave = game:GetService("Workspace")["_wave_num"].Value
    pcall(function()
        if option == "inf" then
            if _G.Config.Inf.Map == "magnolia" then
                if wave < 3 then
                    local uID =  string.split(_G.Config.Inf.Units["u1"], " ")
                    for i = 1, 1 do
                        PlaceToLoc(uID[3], UnitPos(_G.Config.Inf.Map, "u1", i))
                    end
                end
                if wave < 3 then
                    local uID =  string.split(_G.Config.Inf.Units["u2"], " ")
                    for i = 1, 3 do
                        PlaceToLoc(uID[3], UnitPos(_G.Config.Inf.Map, "u2", i))
                    end
                end
                if wave > 2 and wave < 6 then
                    local uID =  string.split(_G.Config.Inf.Units["u3"], " ")
                    for i = 1, 4 do
                        PlaceToLoc(uID[3], UnitPos(_G.Config.Inf.Map, "u3", i))
                    end
                end
                if wave > 6 and wave < 16 then
                    local uID =  string.split(_G.Config.Inf.Units["u4"], " ")
                    for i = 1, 4 do
                        PlaceToLoc(uID[3], UnitPos(_G.Config.Inf.Map, "u4", i))
                    end
                end
                if wave > 10 and wave < 20 then
                    local uID =  string.split(_G.Config.Inf.Units["u5"], " ")
                    for i = 1, 4 do
                        PlaceToLoc(uID[3], UnitPos(_G.Config.Inf.Map, "u5", i))
                    end
                end
                if wave > 10 and wave < 20 then
                    local uID =  string.split(_G.Config.Inf.Units["u6"], " ")  
                    for i = 1, 5 do
                        PlaceToLoc(uID[3], UnitPos(_G.Config.Inf.Map, "u6", i))
                    end
                end
            elseif _G.Config.Inf.Map == "hxhant" then
                if wave < 3 then
                    local uID =  string.split(_G.Config.Inf.Units["u1"], " ")
                    for i = 1, 1 do
                        PlaceToLoc(uID[3], UnitPos(_G.Config.Inf.Map, "u1", i))
                    end
                end
                if wave < 3 then
                    local uID =  string.split(_G.Config.Inf.Units["u2"], " ")
                    for i = 1, 3 do
                        PlaceToLoc(uID[3], UnitPos(_G.Config.Inf.Map, "u2", i))
                    end
                end
                if wave > 2 and wave < 6 then
                    local uID =  string.split(_G.Config.Inf.Units["u3"], " ")
                    for i = 1, 4 do
                        PlaceToLoc(uID[3], UnitPos(_G.Config.Inf.Map, "u3", i))
                    end
                end
                if wave > 6 and wave < 16 then
                    local uID =  string.split(_G.Config.Inf.Units["u4"], " ")
                    for i = 1, 4 do
                        PlaceToLoc(uID[3], UnitPos(_G.Config.Inf.Map, "u4", i))
                    end
                end
                if wave > 10 and wave < 20 then
                    local uID =  string.split(_G.Config.Inf.Units["u5"], " ")
                    for i = 1, 4 do
                        PlaceToLoc(uID[3], UnitPos(_G.Config.Inf.Map, "u5", i))
                    end
                end
                if wave > 10 and wave < 20 then
                    local uID =  string.split(_G.Config.Inf.Units["u6"], " ")  
                    for i = 1, 5 do
                        PlaceToLoc(uID[3], UnitPos(_G.Config.Inf.Map, "u6", i))
                    end
                end
            elseif _G.Config.Inf.Map == "hueco" then
                if wave < 3 then
                    local uID =  string.split(_G.Config.Inf.Units["u1"], " ")
                    for i = 1, 1 do
                        PlaceToLoc(uID[3], UnitPos(_G.Config.Inf.Map, "u1", i))
                    end
                end
                if wave < 3 then
                    local uID =  string.split(_G.Config.Inf.Units["u2"], " ")
                    for i = 1, 3 do
                        PlaceToLoc(uID[3], UnitPos(_G.Config.Inf.Map, "u2", i))
                    end
                end
                if wave > 2 and wave < 6 then
                    local uID =  string.split(_G.Config.Inf.Units["u3"], " ")
                    for i = 1, 4 do
                        PlaceToLoc(uID[3], UnitPos(_G.Config.Inf.Map, "u3", i))
                    end
                end
                if wave > 8 and wave < 12 then
                    local uID =  string.split(_G.Config.Inf.Units["u4"], " ")
                    for i = 1, 4 do
                        PlaceToLoc(uID[3], UnitPos(_G.Config.Inf.Map, "u4", i))
                    end
                end
            elseif _G.Config.Inf.Map == "tokyoghoul" then
                if wave < 3 then
                    uN = "u1"
                    local uID =  string.split(_G.Config.Inf.Units[uN], " ")
                    for i = 1, 1 do
                        PlaceToLoc(uID[3], UnitPos(_G.Config.Inf.Map, uN, i))
                    end
                end
                if wave < 3 then
                    local uID =  string.split(_G.Config.Inf.Units["u2"], " ")
                    for i = 1, 3 do
                        PlaceToLoc(uID[3], UnitPos(_G.Config.Inf.Map, "u2", i))
                    end
                end
                if wave > 2 and wave < 6 then
                    local uID =  string.split(_G.Config.Inf.Units["u3"], " ")
                    for i = 1, 4 do
                        PlaceToLoc(uID[3], UnitPos(_G.Config.Inf.Map, "u3", i))
                    end
                end
            elseif _G.Config.Inf.Map == "marineford" then
                if wave < 5 then
                    uN = "u1"
                    local uID =  string.split(_G.Config.Inf.Units[uN], " ")
                    for i = 1, 1 do
                        PlaceToLoc(uID[3], UnitPos(_G.Config.Inf.Map, uN, i))
                    end
                end
                if wave < 5 then
                    uN = "u2"
                    local uID =  string.split(_G.Config.Inf.Units[uN], " ")
                    for i = 1, 4 do
                        PlaceToLoc(uID[3], UnitPos(_G.Config.Inf.Map, uN, i))
                    end
                end
                if wave > 4 and wave < 10 then
                    uN = "u3"
                    local uID =  string.split(_G.Config.Inf.Units[uN], " ")
                    for i = 1, 4 do
                        PlaceToLoc(uID[3], UnitPos(_G.Config.Inf.Map, uN, i))
                    end
                end
            elseif _G.Config.Inf.Map == "naruto" then
                if wave < 5 then
                    uN = "u1"
                    local uID =  string.split(_G.Config.Inf.Units[uN], " ")
                    for i = 1, 1 do
                        PlaceToLoc(uID[3], UnitPos(_G.Config.Inf.Map, uN, i))
                    end
                end
                if wave < 5 then
                    uN = "u2"
                    local uID =  string.split(_G.Config.Inf.Units[uN], " ")
                    for i = 1, 4 do
                        PlaceToLoc(uID[3], UnitPos(_G.Config.Inf.Map, uN, i))
                    end
                end
                if wave > 4 and wave < 10 then
                    uN = "u3"
                    local uID =  string.split(_G.Config.Inf.Units[uN], " ")
                    for i = 1, 4 do
                        PlaceToLoc(uID[3], UnitPos(_G.Config.Inf.Map, uN, i))
                    end
                end
            elseif _G.Config.Inf.Map == "demonslayer" then
                if wave < 5 then
                    uN = "u1"
                    local uID =  string.split(_G.Config.Inf.Units[uN], " ")
                    for i = 1, 1 do
                        PlaceToLoc(uID[3], UnitPos(_G.Config.Inf.Map, uN, i))
                    end
                end
                if wave < 5 then
                    uN = "u2"
                    local uID =  string.split(_G.Config.Inf.Units[uN], " ")
                    for i = 1, 4 do
                        PlaceToLoc(uID[3], UnitPos(_G.Config.Inf.Map, uN, i))
                    end
                end
                if wave > 4 and wave < 10 then
                    uN = "u3"
                    local uID =  string.split(_G.Config.Inf.Units[uN], " ")
                    for i = 1, 4 do
                        PlaceToLoc(uID[3], UnitPos(_G.Config.Inf.Map, uN, i))
                    end
                end
            elseif _G.Config.Inf.Map == "aot" then
                if wave < 5 then
                    uN = "u1"
                    local uID =  string.split(_G.Config.Inf.Units[uN], " ")
                    for i = 1, 1 do
                        PlaceToLoc(uID[3], UnitPos(_G.Config.Inf.Map, uN, i))
                    end
                end
                if wave < 5 then
                    uN = "u2"
                    local uID =  string.split(_G.Config.Inf.Units[uN], " ")
                    for i = 1, 4 do
                        PlaceToLoc(uID[3], UnitPos(_G.Config.Inf.Map, uN, i))
                    end
                end
                if wave > 4 and wave < 10 then
                    uN = "u3"
                    local uID =  string.split(_G.Config.Inf.Units[uN], " ")
                    for i = 1, 4 do
                        PlaceToLoc(uID[3], UnitPos(_G.Config.Inf.Map, uN, i))
                    end
                end
            elseif _G.Config.Inf.Map == "namek" then
                if wave < 4 then
                    uN = "u1"
                    local uID =  string.split(_G.Config.Inf.Units[uN], " ")
                    for i = 1, 1 do
                        PlaceToLoc(uID[3], UnitPos(_G.Config.Inf.Map, uN, i))
                    end
                end
                if wave < 4 then
                    uN = "u2"
                    local uID =  string.split(_G.Config.Inf.Units[uN], " ")
                    for i = 1, 1 do
                        PlaceToLoc(uID[3], UnitPos(_G.Config.Inf.Map, uN, i))
                    end
                end
                if wave > 3 and wave < 7 then
                    uN = "u3"
                    local uID =  string.split(_G.Config.Inf.Units[uN], " ")
                    for i = 1, 4 do
                        PlaceToLoc(uID[3], UnitPos(_G.Config.Inf.Map, uN, i))
                    end
                end
            end
        elseif option == "chg" then
            if wave < 4 then
                local uID =  string.split(_G.Config.Chg.Units["u1"], " ")
                for i = 1, 1 do
                    PlaceToLoc(uID[3], UnitPos(_G.Config.Chg.CurrentMap, "u1", i))
                end
            end
            if wave < 15 then
                local uID =  string.split(_G.Config.Chg.Units["u2"], " ")
                for i = 1, 4 do
                    PlaceToLoc(uID[3], UnitPos(_G.Config.Chg.CurrentMap, "u2", i))
                end
            end
            if wave < 15 then
                local uID =  string.split(_G.Config.Chg.Units["u3"], " ")
                for i = 1, 4 do
                    PlaceToLoc(uID[3], UnitPos(_G.Config.Chg.CurrentMap, "u3", i))
                end
            end
            if wave > 5 and wave < 15 then
                local uID =  string.split(_G.Config.Chg.Units["u4"], " ")
                for i = 1, 4 do
                    PlaceToLoc(uID[3], UnitPos(_G.Config.Chg.CurrentMap, "u4", i))
                end
            end
            if wave > 5 and wave < 15 then
                local uID =  string.split(_G.Config.Chg.Units["u5"], " ")
                for i = 1, 4 do
                    PlaceToLoc(uID[3], UnitPos(_G.Config.Chg.CurrentMap, "u5", i))
                end
            end
        end
    end)
end
function UnitPos(map, unit, pos)
    local UnitPos = {
        ["magnolia"] = {
            u1 = {
                CFrame.new(-598.0305786132812, 22.5, -830.3179321289062)
            },
            u2 = {
                CFrame.new(-586.0616455078125, 6.7, -812.8890991210938),
                CFrame.new(-587.0616455078125, 6.7, -812.8890991210938),
                CFrame.new(-588.0616455078125, 6.7, -812.8890991210938),
                CFrame.new(-589.0616455078125, 6.7, -812.8890991210938)
            },
            u3 = {
                CFrame.new(-586.0616455078125, 6.7, -813.8890991210938),
                CFrame.new(-587.0616455078125, 6.7, -813.8890991210938),
                CFrame.new(-588.0616455078125, 6.7, -813.8890991210938),
                CFrame.new(-589.0616455078125, 6.7, -813.8890991210938)
            },
            u4 = {
                CFrame.new(-586.0616455078125, 6.7, -814.8890991210938),
                CFrame.new(-587.0616455078125, 6.7, -814.8890991210938),
                CFrame.new(-588.0616455078125, 6.7, -814.8890991210938),
                CFrame.new(-589.0616455078125, 6.7, -814.8890991210938)
            },
            u5 = {
                CFrame.new(-586.0616455078125, 6.7, -811.8890991210938),
                CFrame.new(-587.0616455078125, 6.7, -811.8890991210938),
                CFrame.new(-588.0616455078125, 6.7, -811.8890991210938),
                CFrame.new(-589.0616455078125, 6.7, -811.8890991210938)
            },
            u6 = {
                CFrame.new(-586.0616455078125, 6.7, -810.8890991210938),
                CFrame.new(-587.0616455078125, 6.7, -810.8890991210938),
                CFrame.new(-588.0616455078125, 6.7, -810.8890991210938),
                CFrame.new(-589.0616455078125, 6.7, -810.8890991210938)
            }
        },
        ["hxhant"] = {
            u1 = {
                CFrame.new(-166, 23, 2939)
            },
            u2 = {
                CFrame.new(-190, 23, 2962),
                CFrame.new(-191, 23, 2961),
                CFrame.new(-192, 23, 2960),
                CFrame.new(-193, 23, 2959)
            },
            u3 = {
                CFrame.new(-190, 23, 2960),
                CFrame.new(-191, 23, 2959),
                CFrame.new(-192, 23, 2958),
                CFrame.new(-193, 23, 2957)
            },
            u4 = {
                CFrame.new(-190, 23, 2964),
                CFrame.new(-191, 23, 2963),
                CFrame.new(-192, 23, 2962),
                CFrame.new(-193, 23, 2961)
            },
            u5 = {
                CFrame.new(-190, 23, 2958),
                CFrame.new(-191, 23, 2957),
                CFrame.new(-192, 23, 2956),
                CFrame.new(-193, 23, 2955)
            },
            u6 = {
                CFrame.new(-190, 23, 2966),
                CFrame.new(-191, 23, 2965),
                CFrame.new(-192, 23, 2964),
                CFrame.new(-193, 23, 2963)
            }
        },
        ["hueco"] = {
            u1 = {
                CFrame.new(-154.05145263671875, 132.66400146484375, -725.6512451171875)
            },
            u2 = {
                CFrame.new(-188.1686248779297, 132.6639862060547, -761.1053466796875),
                CFrame.new(-187.72862243652344, 132.6639862060547, -759.0645751953125),
                CFrame.new(-187.40025329589844, 132.6639862060547, -757.1781005859375),
                CFrame.new(-187.40025329589844, 132.6639862060547, -756.1781005859375)
            },
            u3 = {
                CFrame.new(-190.58680725097656, 132.66400146484375, -760.87353515625),
                CFrame.new(-190.31472778320312, 132.66400146484375, -758.8143310546875),
                CFrame.new(-189.9259033203125, 132.66400146484375, -756.8162841796875),
                CFrame.new(-189.41905212402344, 132.66400146484375, -754.8712158203125)
            },
            u4 = {
                CFrame.new(-192.7289276123047, 132.66400146484375, -760.8720703125),
                CFrame.new(-192.354248046875, 132.66400146484375, -758.7332763671875),
                CFrame.new(-191.98509216308594, 132.66400146484375, -756.726806640625),
                CFrame.new(-191.9520263671875, 132.66400146484375, -754.6868286132812)
            }
        },
        ["tokyoghoul"] = {
            u1 = {
                CFrame.new(-3016, 58.58, -40)
            },
            u2 = {
                CFrame.new(-3000, 58.58, -64),
                CFrame.new(-3000, 58.58, -63),
                CFrame.new(-3000, 58.58, -62),
                CFrame.new(-3000, 58.58, -61)
            },
            u3 = {
                CFrame.new(-2999, 58.58, -64),
                CFrame.new(-2999, 58.58, -63),
                CFrame.new(-2999, 58.58, -62),
                CFrame.new(-2999, 58.58, -61)
            },
            u4 = {
                CFrame.new(-3001, 58.58, -64),
                CFrame.new(-3001, 58.58, -63),
                CFrame.new(-3001, 58.58, -62),
                CFrame.new(-3001, 58.58, -61)
            }
        },
        ["marineford"] = {
            u1 = {
                CFrame.new(-2590.36, 34.52, -36.98)
            },
            u2 = {
                CFrame.new(-2528.2, 25.2, -35.7),
                CFrame.new(-2529.2, 25.2, -35.7),
                CFrame.new(-2530.2, 25.2, -35.7),
                CFrame.new(-2531.2, 25.2, -35.7)
            },
            u3 = {
                CFrame.new(-2528.2, 25.2, -36.7),
                CFrame.new(-2529.2, 25.2, -36.7),
                CFrame.new(-2530.2, 25.2, -36.7),
                CFrame.new(-2531.2, 25.2, -36.7)
            },
            u4 = {
                CFrame.new(-2528.2, 25.2, -34.7),
                CFrame.new(-2529.2, 25.2, -34.7),
                CFrame.new(-2530.2, 25.2, -34.7),
                CFrame.new(-2531.2, 25.2, -34.7)
            }
        },
        ["naruto"] = {
            u1 = {
                CFrame.new(-894.9, 29.5, 320.6)
            },
            u2 = {
                CFrame.new(-885.36, 25.28, 336.15),
                CFrame.new(-885.36, 25.28, 335.15),
                CFrame.new(-885.36, 25.28, 334.15),
                CFrame.new(-885.36, 25.28, 333.15)
            },
            u3 = {
                CFrame.new(-886.36, 25.28, 336.15),
                CFrame.new(-886.36, 25.28, 335.15),
                CFrame.new(-886.36, 25.28, 334.15),
                CFrame.new(-886.36, 25.28, 333.15)
            },
            u4 = {
                CFrame.new(-884.36, 25.28, 336.15),
                CFrame.new(-884.36, 25.28, 335.15),
                CFrame.new(-884.36, 25.28, 334.15),
                CFrame.new(-884.36, 25.28, 333.15)
            }
        },
        ["demonslayer"] = {
            u1 = {
                CFrame.new(-2880.86, 34.34, -126.45)
            },
            u2 = {
                CFrame.new(-2865.21, 34.34, -126.25),
                CFrame.new(-2866.21, 34.34, -126.25),
                CFrame.new(-2867.21, 34.34, -126.25),
                CFrame.new(-2868.21, 34.34, -126.25)
            },
            u3 = {
                CFrame.new(-2865.21, 34.34, -127.25),
                CFrame.new(-2866.21, 34.34, -127.25),
                CFrame.new(-2867.21, 34.34, -127.25),
                CFrame.new(-2868.21, 34.34, -127.25)
            },
            u4 = {
                CFrame.new(-2865.21, 34.34, -125.25),
                CFrame.new(-2866.21, 34.34, -125.25),
                CFrame.new(-2867.21, 34.34, -125.25),
                CFrame.new(-2868.21, 34.34, -125.25)
            }
        },
        ["aot"] = {
            u1 = {
                CFrame.new(-2988, 33.75, -618)
            },
            u2 = {
                CFrame.new(-3024.8, 33.74, -684.15),
                CFrame.new(-3025.8, 33.74, -684.15),
                CFrame.new(-3026.8, 33.74, -684.15),
                CFrame.new(-3027.8, 33.74, -684.15)
            },
            u3 = {
                CFrame.new(-3024.8, 33.74, -685.15),
                CFrame.new(-3025.8, 33.74, -685.15),
                CFrame.new(-3026.8, 33.74, -685.15),
                CFrame.new(-3027.8, 33.74, -685.15)
            },
            u4 = {
                CFrame.new(-3024.8, 33.74, -683.15),
                CFrame.new(-3025.8, 33.74, -683.15),
                CFrame.new(-3026.8, 33.74, -683.15),
                CFrame.new(-3027.8, 33.74, -683.15)
            }
        },
        ["namek"] = {
            u1 = {
                CFrame.new(-2914, 91, -737)
            },
            u2 = {
                CFrame.new(-2940, 91, -706),
                CFrame.new(-2941, 91, -706),
                CFrame.new(-2942, 91, -706),
                CFrame.new(-2943, 91, -706)
            },
            u3 = {
                CFrame.new(-2940, 91, -705),
                CFrame.new(-2941, 91, -705),
                CFrame.new(-2942, 91, -705),
                CFrame.new(-2943, 91, -705)
            },
            u4 = {
                CFrame.new(-2940, 91, -707),
                CFrame.new(-2941, 91, -707),
                CFrame.new(-2942, 91, -707),
                CFrame.new(-2943, 91, -707)
            }
        }
    }
    return UnitPos[map][unit][pos]
end
function PlaceToLoc(unitId, loc)
    if game:GetService("Workspace")["_wave_num"].Value < _G.Config.Inf.WaveToLose then
        game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unitId, loc)
    end
end

function DS.Codes()
    return {
        "FAIRY2",
        "FAIRY",
        "subtomaokuma",
        "TOADBOIGAMING",
        "SubToKelvingts",
        "SubToBlamspot",
        "FictioNTheFirst",
        "KingLuffy",
        "Cursed",
        "noclypso"
    }
end
return DS;
