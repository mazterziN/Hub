local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/mazterziN/Hub/main/UI.lua"))()

local standardTheme = {
    SchemeColor = Color3.fromRGB(50,50,50),
    Background = Color3.fromRGB(20,20,20),
    Header = Color3.fromRGB(0,0,0),
    TextColor = Color3.fromRGB(255,255,255),
    ElementColor = Color3.fromRGB(10, 10, 10)
}

local Window = Library.CreateLib("  • General", standardTheme)

-- MAIN
    local MainTab = Window:NewTab("Main")
    local PlayerSection = MainTab:NewSection("Character")
    local FlySection = MainTab:NewSection("Fly")
    local ESPSection = MainTab:NewSection("ESP")

    local setWs = 16
    local setJp = 50
    local AlwaysSet = false

    local FlyKey = Enum.KeyCode.X
    local FlyActived = false
    local FlySpeed = 100
    local isFlying = false
    local stopFly = false

    local espPlayers = false

    PlayerSection:NewSlider("WalkSpeed", "", 256, 16, function(s)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
        setWs = s
    end)
    PlayerSection:NewSlider("JumpPower", "", 256, 50, function(s)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
        setJp = s
    end)
    PlayerSection:NewToggle("Always Set", "", function(s)
        AlwaysSet = s
    end)
    game:GetService("RunService").RenderStepped:Connect(function()
        if AlwaysSet then
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = setWs
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = setJp
        end
    end)

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
            bv.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
            isFlying = true
        else
            local bv = game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("FlightVelocity")
            if bv then bv:Destroy() end
            isFlying = not isFlying
        end
    end)
    game:GetService("UserInputService").InputBegan:connect(function(key)
        if key.KeyCode == Enum.KeyCode.W then
            if isFlying then
                mouse = game.Players.LocalPlayer:GetMouse()
                stopFly = false
                local bv = game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("FlightVelocity")
                if bv then 
                    while stopFly == false do
                        bv.Velocity = mouse.Hit.lookVector * FlySpeed
                        wait()
                    end
                end
            end
        end
    end)
    game:GetService("UserInputService").InputEnded:connect(function(key)
        if key.KeyCode == Enum.KeyCode.W then
            if isFlying then
                if not stopFly then
                    stopFly = true
                    local bv = game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("FlightVelocity")
                    if bv then bv.Velocity = Vector3.new(0,0,0) end
                end
            end
        end
    end)

    ESPSection:NewToggle("ESP Players", "", function(s)
        espPlayers = s
    end)
    game:GetService("RunService").RenderStepped:Connect(function()
        if espPlayers then
            for i,v in pairs(game.Players:GetChildren()) do
                if v ~= game.Players.LocalPlayer then
                    head = v.Character:WaitForChild("Head")
                    if head:FindFirstChild("ESP") then
                        txt = head.ESP.TextLabel
                        local DistanceFromPlayer = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude
                        txt.Text = v.Name.."\n"..math.round(DistanceFromPlayer).."m"
                    else
                        local DistanceFromPlayer = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude
                        local GUI = Instance.new('BillboardGui')
                        Label = Instance.new('TextLabel', GUI)
                        GUI.Adornee = v.Character.Head
                        GUI.Size = UDim2.new(0, 180, 0, 40)
                        GUI.StudsOffset = Vector3.new(0, 2, 0)
                        GUI.Parent = v.Character.Head
                        GUI.AlwaysOnTop = true
                        GUI.Name = "ESP"
                        Label.BackgroundTransparency = 1
                        Label.ZIndex = 5
                        Label.Size = UDim2.new(1, 0, 1, 0)
                        Label.TextColor3 = Color3.fromRGB(255, 255, 255)
                        Label.TextScaled = true
                        Label.Font = Enum.Font.GothamBlack
                        Label.Text = v.Name.."\n"..math.round(DistanceFromPlayer).."m"
                        Label.TextStrokeTransparency = 0
                        Label.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
                    end
                end
            end
        else
            pcall(function()
                for _,v in pairs(game.Players:GetChildren()) do
                    if v ~= game.Players.LocalPlayer then
                        for _,c in pairs(v.Character.Head:GetChildren()) do
                            if c:IsA('BillboardGui') then
                                c:Destroy()
                            end
                        end
                    end
                end
            end)
        end
    end)

-- TELEPORTS
    local TeleportsTab = Window:NewTab("Teleports")
    local PlayersTpSection = TeleportsTab:NewSection("Players")
    local TPSettingsSection = TeleportsTab:NewSection("Settings")

    local tpLoop = false
    local tpLoopTarget = {}
    local tpWay = "Instantaneous"

    local playersList = game.Players:GetChildren()
    local tpOptions = {}

    for i,v in pairs(playersList) do
        table.insert(tpOptions,v.Name)
    end
    local updatePlayersList = PlayersTpSection:NewDropdown("Teleport to", "", tpOptions, function(co)
        local plr = game.Players.LocalPlayer.Character.HumanoidRootPart
        local targetPlayer = game.Players[co].Character.HumanoidRootPart
        tpLoopTarget = co
        plr.CFrame = targetPlayer.CFrame
    end)
    PlayersTpSection:NewToggle("TP Loop", "", function(s)
        tpLoop = s
    end)
    TPSettingsSection:NewDropdown("Select way to TP", "", {"Instantaneous", "Tween"}, function(co)
        tpWay = co
    end)

    game:GetService("RunService").RenderStepped:Connect(function()
        if tpLoop then
            if tpWay == "Instantaneous" then
                local plr = game.Players.LocalPlayer.Character.HumanoidRootPart
                local targetPlayer = game.Players[tpLoopTarget].Character.HumanoidRootPart
                plr.CFrame = targetPlayer.CFrame
            elseif tpWay == "Tween" then
                local targetPlayer = game.Players[tpLoopTarget].Character.HumanoidRootPart
                local Distance2 = (targetPlayer.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                local Speed2 = 100
                local bv = Instance.new("BodyVelocity")
                bv.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
                bv.Velocity = Vector3.new(0,0,0)
                bv.Name = "TP Player"
                bv.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
                local ts = game:GetService("TweenService")
                local info = TweenInfo.new(Distance2/Speed2, Enum.EasingStyle.Linear)
                local tween = ts:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, info, {CFrame = targetPlayer.CFrame})
                tween:Play()
                wait(Distance2/Speed2)
            end
            if game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("TP Player") then
                game.Players.LocalPlayer.Character.HumanoidRootPart["TP Player"]:Destroy()
            end
        end
    end)
    spawn(function()
        while wait(1) do
            local playersList = game.Players:GetChildren()
            local tpOptions = {}
        
            for i,v in pairs(playersList) do
                table.insert(tpOptions,v.Name)
            end
            updatePlayersList:Refresh(tpOptions)
        end
    end)

-- OTHER

    local OtherTab = Window:NewTab("Other")

    local GameSection = OtherTab:NewSection("Game")
    local tpService = game:GetService("TeleportService")
    GameSection:NewButton("Server Hop", "", function()
        tpService:Teleport(game.PlaceId, game.Players.LocalPlayer)
    end)
    GameSection:NewKeybind("Hide UI", "", Enum.KeyCode.RightAlt, function()
        Library:ToggleUI()
    end)
    GameSection:NewButton("Destroy UI", "", function()
        LibName = Library:getUIName()
        game.CoreGui[LibName]:Destroy()
    end)

    local CreditsSection = OtherTab:NewSection("Credits")
    local CreditLabel = CreditsSection:NewLabel(" Hub & Functions by mazter#2222")
    local CreditLabel = CreditsSection:NewLabel(" Kavo UI Library by xHeptc")
