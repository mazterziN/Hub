local uMoney = ""
local uBuff = ""
local uPrimary = ""
local uSecondary = ""
local uTertiary = ""
local uHill = ""
local uHill2 = ""

-- MAZTER
if game.Players.LocalPlayer.UserId == 1340755305 then
    uMoney = "{780300c0-549c-49fb-b06d-22a47675165c}"
    uBuff = "{8c4e6861-5948-4d4f-b0d7-e31e8126d4e7}"
    uPrimary = "{629b8451-5bc7-41ec-8a43-420e79d2bf8f}"
    uSecondary = "{672f9c81-f1a3-4635-b91c-09f6300a0f2e}"
    uTertiary = "{661683f5-c508-484c-ab4b-4bb0023d68d2}"
    uHill = ""
    uHill2 = ""

-- LUIPY
elseif game.Players.LocalPlayer.UserId == 1022210737 then
    uMoney = "{de44d3f9-a315-4132-9cd8-bee28c72b74c}"
    uBuff = "{433ed73e-0874-4252-a5ae-3631c4956ff6}"
    uPrimary = "{d34acf47-2bd7-4dff-a44e-33e4ad0aeed3}"
    uSecondary = "{99f42942-adda-4759-9e43-0b8757dc8528}"
    uTertiary = "{42a36463-ebb8-44a9-9d96-c284da9789ce}"
    uHill = "{8d39cc4d-d5ee-43e7-abc4-48fc047142cc}"
    uHill2 = ""

-- SHONEN
elseif game.Players.LocalPlayer.UserId == 1934778943 then
    uMoney = "{a16aed67-5268-4b99-bc2f-8154dbdba799}"
    uBuff = "{a3b0b275-7a72-4dd3-a8d5-3e2674206584}"
    uPrimary = "{3e2cfdf9-eb56-4d80-8c1a-1decbe74f4eb}"
    uSecondary = "{b4ba835e-f929-455c-b37f-8629c8b6f136}"
    uTertiary = ""
    uHill = ""
    uHill2 = ""

-- MUDINHO
elseif game.Players.LocalPlayer.UserId == 113452795 then
    uMoney = "{48ad3423-3e66-4608-9d6f-6c151a2ed436}"
    uBuff = "{83eef0cd-b64f-42ac-96ae-382c9eec6513}"
    uPrimary = "{7baafd93-ba88-40c5-96d3-1ec424403403}"
    uSecondary = "{0a8f2aad-a41e-493c-be1d-092706fc9f34}"
    uTertiary = "{d6e68563-cf31-47f4-a2ac-2fa2840f61a8}"
    uHill = ""
    uHill2 = ""
end

getgenv().uMoney = uMoney
getgenv().uBuff = uBuff
getgenv().uPrimary = uPrimary
getgenv().uSecondary = uSecondary
getgenv().uTertiary = uTertiary
getgenv().uHill = uHill
getgenv().uHill2 = uHill2
