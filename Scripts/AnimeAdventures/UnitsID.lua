local money = ""
local buff = ""
local primary = ""
local secondary = ""

-- MAZTER
if game.Players.LocalPlayer.UserId == 1340755305 then
    money = "{780300c0-549c-49fb-b06d-22a47675165c}"
    buff = "{8c4e6861-5948-4d4f-b0d7-e31e8126d4e7}"
    primary = "{629b8451-5bc7-41ec-8a43-420e79d2bf8f}"
    secondary = "{672f9c81-f1a3-4635-b91c-09f6300a0f2e}"

-- LUIPY
elseif game.Players.LocalPlayer.UserId == 1022210737 then
    money = "{de44d3f9-a315-4132-9cd8-bee28c72b74c}"
    buff = "{433ed73e-0874-4252-a5ae-3631c4956ff6}"
    primary = "{a8ea35a2-75c8-462b-96b2-9309a94c3ff9}"
    secondary = "{99f42942-adda-4759-9e43-0b8757dc8528}"
end

_G.Money = money
_G.Buff = buff
_G.Primary = primary
_G.Secondary = secondary
