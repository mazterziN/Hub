repeat wait() until game:IsLoaded() 
    game:GetService("Players").LocalPlayer.Idled:connect(function()
    game:GetService("VirtualUser"):ClickButton2(Vector2.new())
end)

local colors = {
    SchemeColor = Color3.fromRGB(50,50,50),
    Background = Color3.fromRGB(20,20,20),
    Header = Color3.fromRGB(0,0,0),
    TextColor = Color3.fromRGB(255,255,255),
    ElementColor = Color3.fromRGB(10, 10, 10)
}

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()





-- GENERAL





if game.PlaceId ~= 9049840490 then
    local Window = Library.CreateLib("mazterHub • General", colors)

    local HomeTab = Window:NewTab("Home")
    local Credit1Section = HomeTab:NewSection("Hub & Functions Created by: mazter#2222")
    local Credit2Section = HomeTab:NewSection("Kavo UI Library by: xHeptc")

    local PlayerTab = Window:NewTab("Player")
    local CharacterSection = PlayerTab:NewSection("Character Options")
    local FlySection = PlayerTab:NewSection("Fly Options")

    CharacterSection:NewSlider("WalkSpeed", "", 256, 16, function(s)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
    end)
    CharacterSection:NewSlider("JumpPower", "", 256, 50, function(s)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
    end)
    CharacterSection:NewButton("Reset Options", "", function()
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
    end)

    local player = game.Players.LocalPlayer
    local Character = player.Character or player.CharacterAdded:wait()
    local human = Character:WaitForChild("Humanoid")
    local FlyKey = Enum.KeyCode.X
    local FlyActived = false
    local FlySpeed = 100
    local isFlying = false
    local stopFly = false
    local root = Character:WaitForChild("HumanoidRootPart")

    FlySection:NewToggle("Fly", "", function(s)
        if s then
            FlyActived = true
        else
            FlyActived = false
        end
    end)
    FlySection:NewSlider("Fly Speed", "", 5000, 100, function(s)
        FlySpeed = s
    end)
    FlySection:NewKeybind("Fly Keybind", "", FlyKey, function()
        if not isFlying then
            if not FlyActived then return end
            local bv = Instance.new("BodyVelocity")
            bv.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
            bv.Velocity = Vector3.new(0,0,0)
            bv.Name = "FlightVelocity"
            bv.Parent = root
            isFlying = true
        else
            local bv = root:FindFirstChild("FlightVelocity")
            if bv then bv:Destroy() end
            isFlying = not isFlying
        end
    end)
    game:GetService("UserInputService").InputBegan:connect(function(key)
        if key.KeyCode == Enum.KeyCode.W then
            if isFlying then
                mouse = game.Players.LocalPlayer:GetMouse()
                stopFly = false
                local bv = root:FindFirstChild("FlightVelocity")
                if bv then 
                    while stopFly == false do
                        bv.Velocity = mouse.Hit.lookVector * FlySpeed
                        wait()
                    end
                end
            else return end
        end
        if key.KeyCode == Enum.KeyCode.LeftShift then
            if isFlying then
                local bv = root:FindFirstChild("FlightVelocity")
                if bv then bv.Velocity = Vector3.new(0,1,0) * 50 end
            else return end
        end
        if key.KeyCode == Enum.KeyCode.LeftControl then
            if isFlying then
                local bv = root:FindFirstChild("FlightVelocity")
                if bv then bv.Velocity = Vector3.new(0,-1,0) * 50 end
            else return end
        end
    end)
    game:GetService("UserInputService").InputEnded:connect(function(key)
        if key.KeyCode == Enum.KeyCode.LeftShift or Enum.KeyCode.LeftControl then
            if isFlying then
                local bv = root:FindFirstChild("FlightVelocity")
                if bv then bv.Velocity = Vector3.new(0,0,0) end
            end
        end
        if key.KeyCode == Enum.KeyCode.W then
            if isFlying then
                if not stopFly then
                        stopFly = true
                else return end
            else return end
        end
    end)

    local TeleportsTab = Window:NewTab("Teleports")
    local PlayersTpSection = TeleportsTab:NewSection("Players Teleport")

    local startedTpLoop = false
    local tpLoop = false
    local breakTpLoop = false
    local playersList = game.Players:GetChildren()
    local tpLoopTarget = {}
    local tpOptions = {}
    function StartTpLoop(target)
        if not tpLoop then return end
        if tpLoop then
            startedTpLoop = true
            while wait(0.2) do
                if not tpLoop then break end
                if breakTpLoop then breakTpLoop = false break end
                local plr = game.Players.LocalPlayer.Character.HumanoidRootPart
                local targetPlayer = game.Players[target].Character.HumanoidRootPart
                plr.CFrame = targetPlayer.CFrame
            end
        end
    end 
    for i,v in pairs(playersList) do
        table.insert(tpOptions,v.Name)
    end
    local updatePlayersList = PlayersTpSection:NewDropdown("Teleport to", "", tpOptions, function(co)
        local plr = game.Players.LocalPlayer.Character.HumanoidRootPart
        local targetPlayer = game.Players[co].Character.HumanoidRootPart
        if startedTpLoop then
            tpLoopTarget = co
            breakTpLoop = true
            wait(0.2)
            StartTpLoop(tpLoopTarget)
        else
            tpLoopTarget = co
            plr.CFrame = targetPlayer.CFrame
            StartTpLoop(tpLoopTarget)
        end
    end)
    PlayersTpSection:NewToggle("Tp Loop", "", function(s)
        if s then
            tpLoop = true
            StartTpLoop(tpLoopTarget)
        else
            tpLoop = false
            startedTpLoop = false
        end
    end)

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
    UISection:NewDropdown("Customize the UI", "Changes your theme in UI", {"Dark","Light","Red","Dark & Red","[PREMIUM] Rainbow"}, function(co)
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
        elseif co == "[PREMIUM] Rainbow" then
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

    while wait(1) do
        local playersList = game.Players:GetChildren()
        local tpOptions = {}
     
        for i,v in pairs(playersList) do
            table.insert(tpOptions,v.Name)
        end
        updatePlayersList:Refresh(tpOptions)
    end
--
--
--
--
--
-- SONIC SPEED SIMULATOR
--
--
--
--
--
elseif game.PlaceId == 9049840490 then

    local autoRun = false
    local autoRebirth = false
    local autoRewards = false
    local autoWinRace = false
    local autoBuy = false

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

    local VMSection = MiscTab:NewSection("Vending Machines")
    local CurrentVM = nil
    local ChangeVM = false
    local SelectedVM = false
    function AutoBuy()
        if not autoBuy then return end
        if autoBuy then
            while wait(0.1) do
                if not autoBuy then break end
                if ChangeVM then ChangeVM = false break end
                game:GetService("ReplicatedStorage").Knit.Services.VendorService.RF.EggPurchased:InvokeServer(CurrentVM)
            end
        end
    end
    local VendingMachines = {
        "GreenHill1",
        "GreenHill2",
        "GreenHill3",
        "GreenHill4",
        "GreenHill5",
        "SandyHill1",
        "EmeraldHill1",
        "EmeraldHill2",
        "SnowValley1",
        "HillTop1",
        "HillTop2",}

    VMSection:NewDropdown("Select vending machine to buy", "", VendingMachines, function(co)
        if SelectedVM then
            ChangeVM = true
            CurrentVM = co
            AutoBuy()
        else
            SelectedVM = true
            CurrentVM = co
        end
    end)
    VMSection:NewButton("Buy Once", "", function()
        if CurrentVM == nil then return end
        game:GetService("ReplicatedStorage").Knit.Services.VendorService.RF.EggPurchased:InvokeServer(CurrentVM)
    end)
    VMSection:NewToggle("Auto Buy", "", function(s)
        if s then
            autoBuy = true
            AutoBuy()
        else
            autoBuy = false
        end
    end)

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
    UISection:NewDropdown("Customize the UI", "", {"Dark","Light","Red","Dark & Red","[PREMIUM] Rainbow"}, function(co)
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
        elseif co == "[PREMIUM] Rainbow" then
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
end
