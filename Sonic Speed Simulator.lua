if game.PlaceId == 9049840490 then

    local autoRun = false
    local autoRebirth = false
    local autoRewards = false
    local autoWinRace = false

    local Window = Library.CreateLib("mazterHub • Sonic Speed Simulator", colors)

    local HomeTab = Window:NewTab("Home")
    local Credit1Section = HomeTab:NewSection("Hub & Functions Created by: mazter#2222")
    local Credit2Section = HomeTab:NewSection("Kavo UI Library by: xHeptc")

    local MainTab = Window:NewTab("Main")
    local AutoFarmSection = MainTab:NewSection("Auto Farm")

    function onAutoRun()
        if autoRun then
            while wait(0.2) do
                if not autoRun then break end
                local args = {
                    [1] = {
                        ["Character"] = game:GetService("Players").LocalPlayer.Character,
                        ["CFrame"] = CFrame.new(-9815.359375, 235.47698974609375, -7407.9609375) * CFrame.Angles(4.007224330138115e-09, -0.6135990619659424, 9.134029643753649e-10),
                        ["IsRunning"] = false
                    }
                }
                game:GetService("ReplicatedStorage").Knit.Services.CharacterService.RE.UpdateCharacterState:FireServer(unpack(args))
            end
        end
    end
    function onAutoRebirth()
        if autoRebirth then
            while wait(1) do
                if not autoRebirth then break end
                game:GetService("ReplicatedStorage").Knit.Services.LevelingService.RF.AttemptRebirth:InvokeServer()
            end
        end
    end
    function onRewardsBanks()
        local banks = {
            "GreenHillLobby",
            "GreenHillLobbyGroup",
            "SnowValleyTower",
            "HillTopNextToWallRun"
        }
        if autoRewards then
            while wait(1) do
                if not autoRewards then break end
                for i,v in pairs(banks) do
                    game:GetService("ReplicatedStorage").Knit.Services.RewardService.RF.GiveRewardInBank:InvokeServer(v)
                    print(v)
                end
            end
        end
    end
    spawn(function()
        local Knit = require(game:GetService("ReplicatedStorage").Knit)
        local CharacterService = Knit.GetService("CharacterService")
        local RaceService = Knit.GetService("RaceService")
        local RaceController = Knit.GetController("RaceController")

        RaceService.RaceStarting:Connect(function(GUID)
            if autoWinRace then
                local RaceEnd = game:GetService("Workspace").Map.Triggers:WaitForChild("RaceEndZone")
                wait(6.5)
                CharacterService.CharacterTouchedTrigger:Fire(tostring(RaceEnd:GetAttribute("GUID")))
            end
        end);

        RaceService.PromptRace:Connect(function(idek, GUID)
            if autoWinRace then
                RaceService.JoinRace:Fire(GUID)
            end
        end)
    end)
    AutoFarmSection:NewToggle("Auto Run","", function(s)
        if s then
            autoRun = true
            onAutoRun()
        else
            autoRun = false
        end
    end)    
    AutoFarmSection:NewToggle("Auto Rebirth","", function(s)
        if s then
            autoRebirth = true
            onAutoRebirth()
        else
            autoRebirth = false
        end
    end)
    AutoFarmSection:NewToggle("Auto Win Race","", function(s)
        if s then
            autoWinRace = true
        else
            autoWinRace = false
        end
    end)
    AutoFarmSection:NewToggle("Auto All Rewards Banks","", function(s)
        if s then
            autoRewards = true
            onRewardsBanks()
        else
            autoRewards = false
        end
    end)
    AutoFarmSection:NewButton("Collect All Orbs", "", function()
        local WorldDrops = game.Workspace:WaitForChild("World Currencies")
        local drops = WorldDrops:GetChildren()
        for i = 1, #drops do
    	    local child = drops[i]
    	    local args = {
                [1] = child.Name
            }
        game:GetService("ReplicatedStorage").Knit.Services.WorldCurrencyService.RE.PickupCurrency:FireServer(unpack(args))
        child:Destroy()
        end
    end)

    local MiscTab = Window:NewTab("Misc")
    local MiscSection = MiscTab:NewSection("Miscellaneous")
    MiscSection:NewButton("Unlock All Characters", "", function()
        local Knit = game:GetService("ReplicatedStorage").Knit
        local RequestUnlockCharacter = Knit.Services.CharacterService.RE.RequestUnlockCharacter
        local RequestTeleportToZone = Knit.Services.ZoneService.RF.RequestTeleportToZone
        local RedeemCode = Knit.Services.RedeemService.RF.RedeemCode
        
        RequestTeleportToZone:InvokeServer("Green Hill")
        RequestUnlockCharacter:FireServer("sonic")
        wait(0.5)
        
        RequestTeleportToZone:InvokeServer("Lost Valley")
        RequestUnlockCharacter:FireServer("tails")
        wait(0.5)
        
        RequestTeleportToZone:InvokeServer("Emerald Hill")
        RequestUnlockCharacter:FireServer("knuckles")
        wait(0.5)
        
        RedeemCode:InvokeServer("riders")
    end)

    local AutoBuySection = MiscTab:NewSection("AutoBuy")
    AutoBuySection:NewDropdown("")



    local OtherTab = Window:NewTab("Other")
    local GameSection = OtherTab:NewSection("Game Options")
    local UISection = OtherTab:NewSection("UI Configurations")

    local tpService = game:GetService("TeleportService")
    GameSection:NewButton("Server Hop", "", function()
        tpService:Teleport(game.PlaceId, game.Players.LocalPlayer)
    end)

    local rgbColor = Color3.new(0,0,0)
    local onRainbow = false
    UISection:NewKeybind("Hide UI", "", Enum.KeyCode.RightAlt, function()
        Library:ToggleUI()
    end)
    UISection:NewDropdown("Customize the UI", "Changes your theme in UI", {"Dark","Light","Red","Dark & Red","Light & Red","Rainbow"}, function(co)
        if co == "Dark" then
            onRainbow = true
            Library:ChangeColor("Background", Color3.fromRGB(20,20,20))
            Library:ChangeColor("Header", Color3.fromRGB(0,0,0))
            Library:ChangeColor("SchemeColor", Color3.fromRGB(50,50,50))
            Library:ChangeColor("ElementColor", Color3.fromRGB(10, 10, 10))
            Library:ChangeColor("TextColor", Color3.fromRGB(255,255,255))
        elseif co == "Light" then
            onRainbow = true
            Library:ChangeColor("Background", Color3.fromRGB(191, 191, 191))
            Library:ChangeColor("Header", Color3.fromRGB(156, 156, 156))
            Library:ChangeColor("SchemeColor", Color3.fromRGB(255, 255, 255))
            Library:ChangeColor("ElementColor", Color3.fromRGB(166, 166, 166))
            Library:ChangeColor("TextColor", Color3.fromRGB(0,0,0))
        elseif co == "Red" then
            onRainbow = true
            Library:ChangeColor("Background", Color3.fromRGB(50,0,0))
            Library:ChangeColor("Header", Color3.fromRGB(255,0,0))
            Library:ChangeColor("SchemeColor", Color3.fromRGB(150,0,0))
            Library:ChangeColor("ElementColor", Color3.fromRGB(10,10,10))
            Library:ChangeColor("TextColor", Color3.fromRGB(255,255,255))
        elseif co == "Dark & Red" then
            onRainbow = true
            Library:ChangeColor("Background", Color3.fromRGB(50,0,0))
            Library:ChangeColor("Header", Color3.fromRGB(0,0,0))
            Library:ChangeColor("SchemeColor", Color3.fromRGB(255,0,0))
            Library:ChangeColor("ElementColor", Color3.fromRGB(20, 20, 20))
            Library:ChangeColor("TextColor", Color3.fromRGB(255,255,255))
        elseif co == "Light & Red" then
            onRainbow = true
            Library:ChangeColor("Background", Color3.fromRGB(176, 107, 107))
            Library:ChangeColor("Header", Color3.fromRGB(255, 92, 92))
            Library:ChangeColor("SchemeColor", Color3.fromRGB(250, 187, 187))
            Library:ChangeColor("ElementColor", Color3.fromRGB(117, 43, 43))
            Library:ChangeColor("TextColor", Color3.fromRGB(0,0,0))
        elseif co == "Rainbow" then
            if game.Players.LocalPlayer.UserId ~= 232422286 then return end
            onRainbow = false
            Library:ChangeColor("Background", Color3.fromRGB(20,20,20))
            Library:ChangeColor("Header", Color3.fromRGB(0,0,0))
            Library:ChangeColor("ElementColor", Color3.fromRGB(10, 10, 10))
            Library:ChangeColor("TextColor", Color3.fromRGB(255,255,255))
            while true do
                if onRainbow == true then break end
                rgbColor = Color3.new(255/255,0/255,0/255)
                Library:ChangeColor("SchemeColor", rgbColor)
                for i = 0,255,10 do
                    if onRainbow == true then break end
                    rgbColor = Color3.new(255/255,i/255,0/255)
                    Library:ChangeColor("SchemeColor", rgbColor)
                    wait()
                end
                for i = 255,0,-10 do
                    if onRainbow == true then break end
                    rgbColor = Color3.new(i/255,255/255,0/255)
                    Library:ChangeColor("SchemeColor", rgbColor)
                    wait()
                end
                for i = 0,255,10 do
                    if onRainbow == true then break end
                    rgbColor = Color3.new(0/255,255/255,i/255)
                    Library:ChangeColor("SchemeColor", rgbColor)
                    wait()
                end
                for i = 255,0,-10 do
                    if onRainbow == true then break end
                    rgbColor = Color3.new(0/255,i/255,255/255)
                    Library:ChangeColor("SchemeColor", rgbColor)
                    wait()
                end
                for i = 0,255,10 do
                    if onRainbow == true then break end
                    rgbColor = Color3.new(i/255,0/255,255/255)
                    Library:ChangeColor("SchemeColor", rgbColor)
                    wait()
                end
                for i = 255,0,-10 do
                    if onRainbow == true then break end
                    rgbColor = Color3.new(255/255,0/255,i/255)
                    Library:ChangeColor("SchemeColor", rgbColor)
                    wait()
                end
                wait()
            end
        end
    end)