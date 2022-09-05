local money = ""
local buff = ""
local primary = ""
local secondary = ""
local air = ""

-- MAZTER
if game.Players.LocalPlayer.UserId == 1340755305 then
    money = "{780300c0-549c-49fb-b06d-22a47675165c}"
    buff = "{8c4e6861-5948-4d4f-b0d7-e31e8126d4e7}"
    primary = "{629b8451-5bc7-41ec-8a43-420e79d2bf8f}"
    secondary = "{672f9c81-f1a3-4635-b91c-09f6300a0f2e}"
    air = ""

-- LUIPY
elseif game.Players.LocalPlayer.UserId == 1022210737 then
    money = "{de44d3f9-a315-4132-9cd8-bee28c72b74c}"
    buff = "{433ed73e-0874-4252-a5ae-3631c4956ff6}"
    primary = "{a8ea35a2-75c8-462b-96b2-9309a94c3ff9}"
    secondary = "{99f42942-adda-4759-9e43-0b8757dc8528}"
    air = ""

-- SHONEN
elseif game.Players.LocalPlayer.UserId == 0 then
    money = "{a16aed67-5268-4b99-bc2f-8154dbdba799}"
    buff = "{a3b0b275-7a72-4dd3-a8d5-3e2674206584}"
    primary = "{3e2cfdf9-eb56-4d80-8c1a-1decbe74f4eb}"
    secondary = "{b4ba835e-f929-455c-b37f-8629c8b6f136}"
    air = ""

-- MUDINHO
elseif game.Players.LocalPlayer.UserId == 113452795 then
    money = "{48ad3423-3e66-4608-9d6f-6c151a2ed436}"
    buff = "{83eef0cd-b64f-42ac-96ae-382c9eec6513}"
    primary = "{0a8f2aad-a41e-493c-be1d-092706fc9f34}"
    secondary = "{0662643b-af70-4fa0-b63f-888d6643dd29}"
    air = ""
end

_G.Money = money
_G.Buff = buff
_G.Primary = primary
_G.Secondary = secondary
_G.Air = air
