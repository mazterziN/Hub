_G.MazterWhitelist = {
    1340755305, -- MAZTER
    1022210737, -- LUIPY
    1934778943, -- SHONEN
    113452795, -- MUDINHO
    2427591310 -- NINJA
}

local AA = {}

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

return AA
