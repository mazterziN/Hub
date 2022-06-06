local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/mazterziN/Hub/main/UI.lua"))()

local standardTheme = {
    SchemeColor = Color3.fromRGB(50,50,50),
    Background = Color3.fromRGB(20,20,20),
    Header = Color3.fromRGB(0,0,0),
    TextColor = Color3.fromRGB(255,255,255),
    ElementColor = Color3.fromRGB(10, 10, 10)
}

local Window = Library.CreateLib("            • Grand Pirates", standardTheme)

-- MAIN
    local MainTab = Window:NewTab("Main")

    local tools = {}
    for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if v:IsA("Tool") then
            table.insert(tools, v.Name)
        end
    end

    getgenv().AutoFarm = false
    getgenv().CurrentWeapon = "Combat"
    getgenv().CurrentEnemy = "Bandit"
    getgenv().DistanceToFarm = 6

    getgenv().SkillZ = false
    getgenv().SkillC = false
    getgenv().SkillX = false
    getgenv().SkillF = false

    getgenv().AutoQuest = false
    getgenv().CurrentQuest = "Luffo"
    getgenv().FarmStopped = true

    local AutoFarmTween = nil
    local AutoQuestTween = nil

    local enemies =  {
        "Bandit",
        "Swordsmen Bandit",
        "Leader's Right Arm",
        "Bandit Leader",
        "Corrupted Marine",
        "Swordsmen Marine",
        "Jordan",
        "Bobby's Clown",
        "Bobby's Pirate",
        "Bobby The Clown",
        "Monkey",
        "Strong Monkey",
        "Pirate",
        "Evil Marine",
        "Kure",
        "Chef",
        "Krieg Pirate",
        "Yeti",
        "Strong Yeti",
        "Fishman",
        "Fishman Karate User",
        "Alvida Pirate",
        "Dual Katana User",
        "Third Katana User",
        "Masked Tribal",
        "Strong Masked Tribal",
        "Masked Haki User",
        "Tribe Elder"
    }
    local quests =  {
        "Luffo",
        "Marco",
        "Marco(Mountain)",
        "Nima",
        "Cobz",
        "Josh",
        "Zori(Marine)",
        "Boodlo",
        "Pore",
        "Zori",
        "Ray",
        "Mihawko",
        "Ussoap",
        "Mornino",
        "Kaya",
        "Sanjo",
        "Gino",
        "Lili",
        "Gregor",
        "Namy",
        "Arthur",
        "Hiroki",
        "Hayato",
        "Fuyuka",
        "Abaeté",
        "Coaraci",
        "Endi",
        "Tupã"
    }
    function quest(island)
        if island == "Foosha" then
            if game.Workspace["Non-Player Characters"].Quests["Foosha Village"]:FindFirstChild(getgenv().CurrentQuest) then
                local questList = game.Workspace["Non-Player Characters"].Quests["Foosha Village"]:GetChildren()
                for i = 1, #questList do
                    local v = questList[i]
                    if v.Name == getgenv().CurrentQuest and v:IsA("Model") then
                        return v
                    end
                end
            end
        elseif island == "Marine" then
            if game.Workspace["Non-Player Characters"].Quests["Marine Island"]:FindFirstChild(getgenv().CurrentQuest) then
                local questList = game.Workspace["Non-Player Characters"].Quests["Marine Island"]:GetChildren()
                for i = 1, #questList do
                    local v = questList[i]
                    if v.Name == getgenv().CurrentQuest and v:IsA("Model") then
                        return v
                    end
                end
            end
        elseif island == "Orange" then
            if game.Workspace["Non-Player Characters"].Quests["Orange Town"]:FindFirstChild(getgenv().CurrentQuest) then
                local questList = game.Workspace["Non-Player Characters"].Quests["Orange Town"]:GetChildren()
                for i = 1, #questList do
                    local v = questList[i]
                    if v.Name == getgenv().CurrentQuest and v:IsA("Model") then
                        return v
                    end
                end
            end
        elseif island == "Monkey" then
            if game.Workspace["Non-Player Characters"].Quests["Monkey Island"]:FindFirstChild(getgenv().CurrentQuest) then
                local questList = game.Workspace["Non-Player Characters"].Quests["Monkey Island"]:GetChildren()
                for i = 1, #questList do
                    local v = questList[i]
                    if v.Name == getgenv().CurrentQuest and v:IsA("Model") then
                        return v
                    end
                end
            end
        elseif island == "Syrup" then
            if game.Workspace["Non-Player Characters"].Quests["Syrup Island"]:FindFirstChild(getgenv().CurrentQuest) then
                local questList = game.Workspace["Non-Player Characters"].Quests["Syrup Island"]:GetChildren()
                for i = 1, #questList do
                    local v = questList[i]
                    if v.Name == getgenv().CurrentQuest and v:IsA("Model") then
                        return v
                    end
                end
            end
        elseif island == "Baratie" then
            if game.Workspace["Non-Player Characters"].Quests["Baratie"]:FindFirstChild(getgenv().CurrentQuest) then
                local questList = game.Workspace["Non-Player Characters"].Quests["Baratie"]:GetChildren()
                for i = 1, #questList do
                    local v = questList[i]
                    if v.Name == getgenv().CurrentQuest and v:IsA("Model") then
                        return v
                    end
                end
            end
        elseif island == "Yeti" then
            if game.Workspace["Non-Player Characters"].Quests["Yeti Island"]:FindFirstChild(getgenv().CurrentQuest) then
                local questList = game.Workspace["Non-Player Characters"].Quests["Yeti Island"]:GetChildren()
                for i = 1, #questList do
                    local v = questList[i]
                    if v.Name == getgenv().CurrentQuest and v:IsA("Model") then
                        return v
                    end
                end
            end
        elseif island == "Arlong" then
            if game.Workspace["Non-Player Characters"].Quests["Arlong Park"]:FindFirstChild(getgenv().CurrentQuest) then
                local questList = game.Workspace["Non-Player Characters"].Quests["Arlong Park"]:GetChildren()
                for i = 1, #questList do
                    local v = questList[i]
                    if v.Name == getgenv().CurrentQuest and v:IsA("Model") then
                        return v
                    end
                end
            end
        elseif island == "Logue" then
            if game.Workspace["Non-Player Characters"].Quests["Logue Town"]:FindFirstChild(getgenv().CurrentQuest) then
                local questList = game.Workspace["Non-Player Characters"].Quests["Logue Town"]:GetChildren()
                for i = 1, #questList do
                    local v = questList[i]
                    if v.Name == getgenv().CurrentQuest and v:IsA("Model") then
                        return v
                    end
                end
            end
        elseif island == "Asteca" then
            if game.Workspace["Non-Player Characters"].Quests["Asteca island"]:FindFirstChild(getgenv().CurrentQuest) then
                local questList = game.Workspace["Non-Player Characters"].Quests["Asteca island"]:GetChildren()
                for i = 1, #questList do
                    local v = questList[i]
                    if v.Name == getgenv().CurrentQuest and v:IsA("Model") then
                        return v
                    end
                end
            end
        end
    end
    function getQuest()
        if getgenv().AutoQuest then
            local Speed2 = 100
            if getgenv().CurrentQuest == "Luffo" or getgenv().CurrentQuest == "Marco" or getgenv().CurrentQuest == "Marco(Mountain)" or getgenv().CurrentQuest == "Nima" then
                local NPCQuest = quest("Foosha")
                local Distance2 = (NPCQuest.HumanoidRootPart.CFrame.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                local tween_s = game:GetService("TweenService")
                local info = TweenInfo.new(Distance2/Speed2, Enum.EasingStyle.Linear)
                local tween = tween_s:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, info, {CFrame = NPCQuest.HumanoidRootPart.CFrame * CFrame.new(-20,0,-20)})
                AutoQuestTween = tween
                tween:Play()
                wait(Distance2/Speed2)
                game:GetService("Players").LocalPlayer.Build.Remotes.ServerRequest:FireServer("SetQuest", getgenv().CurrentQuest)
            elseif getgenv().CurrentQuest == "Cobz" or getgenv().CurrentQuest == "Josh" or getgenv().CurrentQuest == "Zori(Marine)" then
                local NPCQuest = quest("Marine")
                local Distance2 = (NPCQuest.HumanoidRootPart.CFrame.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                local tween_s = game:GetService("TweenService")
                local info = TweenInfo.new(Distance2/Speed2, Enum.EasingStyle.Linear)
                local tween = tween_s:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, info, {CFrame = NPCQuest.HumanoidRootPart.CFrame * CFrame.new(-20,0,-20)})
                AutoQuestTween = tween
                tween:Play()
                wait(Distance2/Speed2)
                game:GetService("Players").LocalPlayer.Build.Remotes.ServerRequest:FireServer("SetQuest", getgenv().CurrentQuest)
            elseif getgenv().CurrentQuest == "Boodlo" or getgenv().CurrentQuest == "Pore" or getgenv().CurrentQuest == "Zori" then
                local NPCQuest = quest("Orange")
                local Distance2 = (NPCQuest.HumanoidRootPart.CFrame.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                local tween_s = game:GetService("TweenService")
                local info = TweenInfo.new(Distance2/Speed2, Enum.EasingStyle.Linear)
                local tween = tween_s:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, info, {CFrame = NPCQuest.HumanoidRootPart.CFrame * CFrame.new(-20,0,-20)})
                AutoQuestTween = tween
                tween:Play()
                wait(Distance2/Speed2)
                game:GetService("Players").LocalPlayer.Build.Remotes.ServerRequest:FireServer("SetQuest", getgenv().CurrentQuest)
            elseif getgenv().CurrentQuest == "Ray" or getgenv().CurrentQuest == "Mihawko" then
                local NPCQuest = quest("Monkey")
                local Distance2 = (NPCQuest.HumanoidRootPart.CFrame.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                local tween_s = game:GetService("TweenService")
                local info = TweenInfo.new(Distance2/Speed2, Enum.EasingStyle.Linear)
                local tween = tween_s:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, info, {CFrame = NPCQuest.HumanoidRootPart.CFrame * CFrame.new(-20,0,-20)})
                AutoQuestTween = tween
                tween:Play()
                wait(Distance2/Speed2)
                game:GetService("Players").LocalPlayer.Build.Remotes.ServerRequest:FireServer("SetQuest", getgenv().CurrentQuest)
            elseif getgenv().CurrentQuest == "Ussoap" or getgenv().CurrentQuest == "Mornino" or getgenv().CurrentQuest == "Kaya" then
                local NPCQuest = quest("Syrup")
                local Distance2 = (NPCQuest.HumanoidRootPart.CFrame.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                local tween_s = game:GetService("TweenService")
                local info = TweenInfo.new(Distance2/Speed2, Enum.EasingStyle.Linear)
                local tween = tween_s:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, info, {CFrame = NPCQuest.HumanoidRootPart.CFrame * CFrame.new(-20,0,-20)})
                AutoQuestTween = tween
                tween:Play()
                wait(Distance2/Speed2)
                game:GetService("Players").LocalPlayer.Build.Remotes.ServerRequest:FireServer("SetQuest", getgenv().CurrentQuest)
            elseif getgenv().CurrentQuest == "Sanjo" or getgenv().CurrentQuest == "Gino" then
                local NPCQuest = quest("Baratie")
                local Distance2 = (NPCQuest.HumanoidRootPart.CFrame.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                local tween_s = game:GetService("TweenService")
                local info = TweenInfo.new(Distance2/Speed2, Enum.EasingStyle.Linear)
                local tween = tween_s:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, info, {CFrame = NPCQuest.HumanoidRootPart.CFrame * CFrame.new(-20,0,-20)})
                AutoQuestTween = tween
                tween:Play()
                wait(Distance2/Speed2)
                game:GetService("Players").LocalPlayer.Build.Remotes.ServerRequest:FireServer("SetQuest", getgenv().CurrentQuest)
            elseif getgenv().CurrentQuest == "Lili" or getgenv().CurrentQuest == "Gregor" then
                local NPCQuest = quest("Yeti")
                local Distance2 = (NPCQuest.HumanoidRootPart.CFrame.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                local tween_s = game:GetService("TweenService")
                local info = TweenInfo.new(Distance2/Speed2, Enum.EasingStyle.Linear)
                local tween = tween_s:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, info, {CFrame = NPCQuest.HumanoidRootPart.CFrame * CFrame.new(-20,0,-20)})
                AutoQuestTween = tween
                tween:Play()
                wait(Distance2/Speed2)
                game:GetService("Players").LocalPlayer.Build.Remotes.ServerRequest:FireServer("SetQuest", getgenv().CurrentQuest)
            elseif getgenv().CurrentQuest == "Namy" or getgenv().CurrentQuest == "Arthur" then
                local NPCQuest = quest("Arlong")
                local Distance2 = (NPCQuest.HumanoidRootPart.CFrame.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                local tween_s = game:GetService("TweenService")
                local info = TweenInfo.new(Distance2/Speed2, Enum.EasingStyle.Linear)
                local tween = tween_s:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, info, {CFrame = NPCQuest.HumanoidRootPart.CFrame * CFrame.new(-20,0,-20)})
                AutoQuestTween = tween
                tween:Play()
                wait(Distance2/Speed2)
                game:GetService("Players").LocalPlayer.Build.Remotes.ServerRequest:FireServer("SetQuest", getgenv().CurrentQuest)
            elseif getgenv().CurrentQuest == "Hiroki" or getgenv().CurrentQuest == "Hayato" or getgenv().CurrentQuest == "Fuyuka" then
                local NPCQuest = quest("Logue")
                local Distance2 = (NPCQuest.HumanoidRootPart.CFrame.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                local tween_s = game:GetService("TweenService")
                local info = TweenInfo.new(Distance2/Speed2, Enum.EasingStyle.Linear)
                local tween = tween_s:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, info, {CFrame = NPCQuest.HumanoidRootPart.CFrame * CFrame.new(-20,0,-20)})
                AutoQuestTween = tween
                tween:Play()
                wait(Distance2/Speed2)
                game:GetService("Players").LocalPlayer.Build.Remotes.ServerRequest:FireServer("SetQuest", getgenv().CurrentQuest)
            elseif getgenv().CurrentQuest == "Abaeté" or getgenv().CurrentQuest == "Coaraci" or getgenv().CurrentQuest == "Endi" or getgenv().CurrentQuest == "Tupã" then
                local NPCQuest = quest("Asteca")
                local Distance2 = (NPCQuest.HumanoidRootPart.CFrame.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                local tween_s = game:GetService("TweenService")
                local info = TweenInfo.new(Distance2/Speed2, Enum.EasingStyle.Linear)
                local tween = tween_s:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, info, {CFrame = NPCQuest.HumanoidRootPart.CFrame * CFrame.new(-20,0,-20)})
                AutoQuestTween = tween
                tween:Play()
                wait(Distance2/Speed2)
                game:GetService("Players").LocalPlayer.Build.Remotes.ServerRequest:FireServer("SetQuest", getgenv().CurrentQuest)
            end
        end
    end
    function enemy()
        if game:GetService("Workspace")["Non-Player Characters"].Enemies:FindFirstChild(getgenv().CurrentEnemy) then
            local mobs = game:GetService("Workspace")["Non-Player Characters"].Enemies:GetChildren()
            for i = 1, #mobs do
                local v = mobs[i]
                if v.Name == getgenv().CurrentEnemy and v:IsA("Model") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                    return v
                end
            end
        end
    end
    function checkBv()
        if getgenv().AutoFarm then
            if game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyAutoFarm") then return end
            local bv = Instance.new("BodyVelocity")
            bv.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
            bv.Velocity = Vector3.new(0,0,0)
            bv.Name = "BodyAutoFarm"
            bv.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
        else
            if not game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyAutoFarm") then return end
            game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyAutoFarm"):Destroy()
        end
    end

    local AutoFarmSection = MainTab:NewSection("Auto Farm")
    AutoFarmSection:NewToggle("Auto Farm", "", function(s)
        getgenv().AutoFarm = s
    end)
    AutoFarmSection:NewToggle("Auto Quest", "", function(s)
        getgenv().AutoQuest = s
    end)
    AutoFarmSection:NewDropdown("Select NPC to get quest", "", quests, function(co)
        game:GetService("Players").LocalPlayer.Build.Remotes.ServerRequest:FireServer("CancelQuest")
        wait()
        getgenv().CurrentQuest = co
    end)
    AutoFarmSection:NewDropdown("Select NPC to farm", "", enemies, function(co)
        getgenv().CurrentEnemy = co
    end)
    local RefreshWeapon = AutoFarmSection:NewDropdown("Select weapon to farm", "", tools, function(co)
        getgenv().CurrentWeapon = co
    end)
    AutoFarmSection:NewButton("Refresh Weapon", "", function() 
        tools = {}
        for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
            if v:IsA("Tool") then
                table.insert(tools, v.Name)
            end
        end
        RefreshWeapon:Refresh(tools)
    end)
    AutoFarmSection:NewSlider("Distance to Farm", "", 20, 0, function(s)
        getgenv().DistanceToFarm = s
    end)

    local AutoSkillSection = MainTab:NewSection("Auto Skill")
    AutoSkillSection:NewToggle("Auto Skill Z", "", function(s)
        getgenv().SkillZ = s
    end)
    AutoSkillSection:NewToggle("Auto Skill X", "", function(s)
        getgenv().SkillX = s
    end)
    AutoSkillSection:NewToggle("Auto Skill C", "", function(s)
        getgenv().SkillC = s
    end)
    AutoSkillSection:NewToggle("Auto Skill F", "", function(s)
        getgenv().SkillF = s
    end)

    game:GetService("RunService").RenderStepped:Connect(function()
        checkBv()
        if getgenv().AutoFarm then
            if getgenv().FarmStopped == false then
                pcall(function()
                    game:GetService("VirtualUser"):CaptureController()
                    game:GetService("VirtualUser"):ClickButton1(Vector2.new())
                    wait(0.5)
                end)
            end
        end
        if getgenv().AutoFarm then
            pcall(function()
                local useTool = game.Players.LocalPlayer.Backpack[getgenv().CurrentWeapon]
                game.Players.LocalPlayer.Character.Humanoid:EquipTool(useTool)
            end)
        end
        if getgenv().SkillZ then
            pcall(function()
                keypress(0x5A)
                wait(0.1)
                keyrelease(0x5A)
            end)
        end
        if getgenv().SkillX then
            pcall(function()
                keypress(0x58)
                wait()
                keyrelease(0x58)
            end)
        end
        if getgenv().SkillC then
            pcall(function()
                keypress(0x43)
                wait()
                keyrelease(0x43)
            end)
        end
        if getgenv().SkillF then
            pcall(function()
                keypress(0x46)
                wait()
                keyrelease(0x46)
            end)
        end
        game.Players.LocalPlayer.Character.Humanoid.Died:Connect(function()
            if getgenv().AutoFarm then
                AutoFarmTween:Cancel()
                getgenv().AutoFarm = false
                wait(5.5)
                getgenv().AutoFarm = true
            end
            if getgenv().AutoQuest then
                AutoQuestTween:Cancel()
                getgenv().AutoQuest = false
                wait(5.5)
                getgenv().AutoQuest = true
            end
        end)
    end)

    coroutine.wrap(function()
        while wait() do
            if getgenv().FarmStopped == true then
                getQuest()
            end
        end
    end)()

    coroutine.wrap(function()
        while wait() do 
            if game:GetService("Players").LocalPlayer.Build.Remotes.DataStore.CurrentQuestStore.Value == "[]" then
                getgenv().FarmStopped = true
            elseif game:GetService("Players").LocalPlayer.Build.Remotes.DataStore.CurrentQuestStore.Value ~= "[]" then
                getgenv().FarmStopped = false
            end
        end
    end)()

    coroutine.wrap(function()
        while wait() do
            for i,v in pairs(game:GetService("Workspace")["Non-Player Characters"].Enemies:GetChildren()) do
                currentEnemy = enemy()
                if getgenv().AutoFarm and getgenv().FarmStopped == false and v.Name == getgenv().CurrentEnemy and (v.HumanoidRootPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 250 then
                    pcall(function()
                        v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                        v.HumanoidRootPart.CFrame = currentEnemy.HumanoidRootPart.CFrame
                        v.Humanoid:ChangeState(14)
                        v.HumanoidRootPart.CanCollide = false
                        v.Head.CanCollide = false
                        if v.Humanoid:FindFirstChild("Animator") then
                            v.Humanoid.Animator:Destroy()
                        end
                        sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                    end)
                end
            end
        end
    end)()

    coroutine.wrap(function()
        while wait() do
            if getgenv().AutoFarm then
                if getgenv().FarmStopped == false then
                    v = enemy()
                    pcall(function()
                        if game.Players.LocalPlayer.Character.Humanoid.Sit == true then game.Players.LocalPlayer.Character.Humanoid.Sit = false end
                        local Distance2 = (v.HumanoidRootPart.CFrame.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                        if Distance2 < 100 then
                            Speed2 = 150
                        elseif Distance2 < 1000 then
                            Speed2 = 100
                        elseif Distance2 > 1000 then
                            Speed2 = 100
                        end
                        local ts = game:GetService("TweenService")
                        local tsInfo = TweenInfo.new(Distance2/Speed2, Enum.EasingStyle.Linear)
                        local tween = ts:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, tsInfo, {CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,0,getgenv().DistanceToFarm)})
                        AutoFarmTween = tween
                        tween:Play()
                        wait(Distance2/Speed2)
                    end)
                end
            end
        end
    end)()

-- PLAYER
    local PlayerTab = Window:NewTab("Player")
    local CharacterSection = PlayerTab:NewSection("Character")
    local setWs = 16
    local setJp = 50
    local AlwaysSet = false
    CharacterSection:NewSlider("WalkSpeed", "", 128, 16, function(s)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
        setWs = s
    end)
    CharacterSection:NewSlider("JumpPower", "", 512, 50, function(s)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
        setJp = s
    end)
    CharacterSection:NewToggle("Always Set", "", function(s)
        AlwaysSet = s
    end)

    game:GetService("RunService").RenderStepped:Connect(function()
        if AlwaysSet then
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = setWs
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = setJp
        end
    end)

    local player = game.Players.LocalPlayer
    local Character = player.Character or player.CharacterAdded:wait()
    local human = Character:WaitForChild("Humanoid")
    local FlyKey = Enum.KeyCode.X
    local FlyActived = false
    local FlySpeed = 145
    local isFlying = false
    local stopFly = false

    local FlySection = PlayerTab:NewSection("Fly")

    FlySection:NewToggle("Fly", "", function(s)
        if s then
            FlyActived = true
        else
            FlyActived = false
        end
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

-- HAKI
    local HakiTab = Window:NewTab("Haki")
    local HakiSection = HakiTab:NewSection("Haki")

    getgenv().AutoHaki = false
    getgenv().AutoUpgradeHaki = false

    HakiSection:NewToggle("Auto Haki", "", function(s)
        getgenv().AutoHaki = s
    end)
    HakiSection:NewToggle("Auto Upgrade Haki", "", function(s)
        getgenv().AutoUpgradeHaki = s
    end)

    game:GetService("RunService").RenderStepped:Connect(function()
        if getgenv().AutoHaki then
            if game.Players.LocalPlayer.Character.BusoshokuHaki:FindFirstChild("LeftHand") then
                return
            else
                pcall(function()
                    keypress(0x4a)
                    wait(0.1)
                    keyrelease(0x4a)
                end)
            end
        end
        if getgenv().AutoUpgradeHaki then
            wait(10)
            game:GetService("Players").LocalPlayer.Build.Remotes.ServerRequest:FireServer("Busoshoku")
        end
    end)

    local HakiLevel = game:GetService("Players").LocalPlayer.Build.Remotes.DataStore.BusoshokuLevelStore.Value
    local HakiLevelLabel = HakiSection:NewLabel("Haki Level: "..HakiLevel)

    local HakiUses = game:GetService("Players").LocalPlayer.Build.Remotes.DataStore.BusoshokuUsesStore.Value
    local HakiUsesLabel = HakiSection:NewLabel("Haki Uses: "..HakiUses)

    coroutine.wrap(function()
        while wait() do
            local HakiLevel = game:GetService("Players").LocalPlayer.Build.Remotes.DataStore.BusoshokuLevelStore.Value
            HakiLevelLabel:UpdateLabel("Haki Level: "..HakiLevel)
            if HakiLevel < 3 then
            local HakiUses = game:GetService("Players").LocalPlayer.Build.Remotes.DataStore.BusoshokuUsesStore.Value
            HakiUsesLabel:UpdateLabel("Haki Uses: "..HakiUses)
            else
                HakiUsesLabel:UpdateLabel("")
            end
        end
    end)()

-- ESP

    espPlayers = false
    espIslands = false
    espFruits = false

    local ESPTab = Window:NewTab("ESP")
    local ESPSection = ESPTab:NewSection("ESP")

    ESPSection:NewToggle("ESP Players", "", function(s)
        espPlayers = s
    end)
    ESPSection:NewToggle("ESP Islands", "", function(s)
        espIslands = s
    end)
    ESPSection:NewToggle("ESP Fruits", "", function(s)
        espFruits = s
    end)

    game:GetService("RunService").RenderStepped:Connect(function()
        if espPlayers then
            for i,v in pairs(game.Players:GetChildren()) do
                if v ~= game.Players.LocalPlayer then
                    head = v.Character:WaitForChild("Head")
                    if head:FindFirstChild("ESP") then
                        txt = head.ESP.TextLabel
                        local DistanceFromPlayer = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude
                        local PlayerLevel = v.Build.Remotes.DataStore.LevelStore.Value
                        txt.Text = "[LVL. "..PlayerLevel.."]\n"..v.Name.."\n"..math.round(DistanceFromPlayer).."m"
                    else
                        local DistanceFromPlayer = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude
                        local PlayerLevel = v.Build.Remotes.DataStore.LevelStore.Value
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
                        Label.Text = "[LVL. "..PlayerLevel.."]\n"..v.Name.."\n"..math.round(DistanceFromPlayer).."m"
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
    game:GetService("RunService").RenderStepped:Connect(function()
        if espIslands then
            for i,v in pairs(game:GetService("Workspace").World.Map:GetChildren()) do
                if v:IsA("Folder") then
                    if v.Part:FindFirstChild("ESP") then
                        txt = v.Part.ESP.TextLabel
                        local DistanceFromIsland = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Part.CFrame.Position).Magnitude
                        txt.Text = v.Name.."\n"..math.round(DistanceFromIsland).."m"
                    else
                        local DistanceFromIsland = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Part.CFrame.Position).Magnitude
                        local GUI = Instance.new('BillboardGui')
                        Label = Instance.new('TextLabel', GUI)
                        GUI.Adornee = v.Part
                        GUI.Size = UDim2.new(0, 180, 0, 40)
                        GUI.StudsOffset = Vector3.new(50, 100, 0)
                        GUI.Parent = v.Part
                        GUI.AlwaysOnTop = true
                        GUI.Name = "ESP"
                        Label.BackgroundTransparency = 1
                        Label.ZIndex = 5
                        Label.Size = UDim2.new(1, 0, 1, 0)
                        Label.TextColor3 = Color3.fromRGB(255, 0, 0)
                        Label.TextScaled = true
                        Label.Font = Enum.Font.GothamBlack
                        Label.Text = v.Name.."\n"..math.round(DistanceFromIsland).."m"
                        Label.TextStrokeTransparency = 0
                        Label.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
                    end
                end
            end
        else
            pcall(function()
                for _,v in pairs(game:GetService("Workspace").World.Map:GetChildren()) do
                    if v:IsA("Folder") then
                        v.Part.ESP:Destroy()
                    end
                end
            end)
        end
    end)
    game:GetService("RunService").RenderStepped:Connect(function()
        if espFruits then
            if game:GetService("Workspace").IgnoreList:FindFirstChild("Handle") then
                fruit = game:GetService("Workspace").IgnoreList.Handle
                if fruit:FindFirstChild("ESP") then
                    txt = fruit.ESP.TextLabel
                    local DistanceFromFruit = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - fruit.CFrame.Position).Magnitude
                    txt.Text = "Devil Fruit\n"..math.round(DistanceFromFruit).."m"
                else
                    local DistanceFromFruit = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - fruit.CFrame.Position).Magnitude
                    local GUI = Instance.new('BillboardGui')
                    Label = Instance.new('TextLabel', GUI)
                    GUI.Adornee = fruit
                    GUI.Size = UDim2.new(0, 180, 0, 40)
                    GUI.StudsOffset = Vector3.new(0, 5, 0)
                    GUI.Parent = fruit
                    GUI.AlwaysOnTop = true
                    GUI.Name = "ESP"
                    Label.BackgroundTransparency = 1
                    Label.ZIndex = 5
                    Label.Size = UDim2.new(1, 0, 1, 0)
                    Label.TextColor3 = Color3.fromRGB(0, 255, 255)
                    Label.TextScaled = true
                    Label.Font = Enum.Font.GothamBlack
                    Label.Text = "Devil Fruit\n"..math.round(DistanceFromFruit).."m"
                    Label.TextStrokeTransparency = 0
                    Label.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
                end
            end
        else
            pcall(function()
                if game:GetService("Workspace").IgnoreList:FindFirstChild("Handle") then
                    fruit = game:GetService("Workspace").IgnoreList.Handle
                    if fruit:FindFirstChild("ESP") then
                        fruit.ESP:Destroy()
                    end
                end
            end)
        end
    end)

-- TELEPORTS
    local TeleportsTab = Window:NewTab("Teleports")
    local PlayersTpSection = TeleportsTab:NewSection("Players")

    local playersList = game.Players:GetChildren()
    local tpOptions = {}
    for i,v in pairs(playersList) do
        table.insert(tpOptions,v.Name)
    end
    local updatePlayersList = PlayersTpSection:NewDropdown("Teleport to", "", tpOptions, function(co)
        local Distance2 = (game.Players[co].Character.HumanoidRootPart.CFrame.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
        if Distance2 < 50 then
            Speed2 = 1000
        elseif Distance2 < 1000 then
            Speed2 = 100
        elseif Distance2 > 1000 then
            Speed2 = 100
        end
        local bv = Instance.new("BodyVelocity")
        bv.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
        bv.Velocity = Vector3.new(0,0,0)
        bv.Name = "BodyTPPlayer"
        bv.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
        local tween_s = game:GetService("TweenService")
        local info = TweenInfo.new(Distance2/Speed2, Enum.EasingStyle.Linear)
        local tween = tween_s:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, info, {CFrame = game.Players[co].Character.HumanoidRootPart.CFrame + Vector3.new(0,5,0)})
        tween:Play()
        wait(Distance2/Speed2)
        bv:Destroy()
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

    local IslandsTpSection = TeleportsTab:NewSection("Islands")
    local IslandTween = nil
    local islands = {}
    for i,v in pairs(game.Workspace.World.Map:GetChildren()) do
        if v:isA("Folder") then
            table.insert(islands,v.Name)
        end
    end
    IslandsTpSection:NewDropdown("Teleport to", "", islands, function(co)
        game:GetService("Players").LocalPlayer.Build.Remotes.ServerRequest:FireServer("SetSpawn", co)
        wait(0.2)
        game.Players.LocalPlayer.Character.Humanoid.Health = 0
    end)

    local NPCTPSection = TeleportsTab:NewSection("NPCs")
    local Sellers = {
        "Dark Leg-Teacher",
        "Wrestling-Teacher",
        "Fishman Karate-Teacher",
        "Katana-Seller",
        "Dual Katana-Seller",
        "Third Katana Seller",
        "Flintlock-Seller",
        "Bazooka-Seller",
        "Geppo-Teacher",
        "Haki-Teacher",
        "Soru-Teacher",
        "Devil Fruit-Seller",
        "Devil Fruit-Remover",
        "Sea Beast Spawn"
    }
    NPCTPSection:NewDropdown("Teleport to", "", Sellers, function(co)
        Speed2 = 100
        if co == "Katana-Seller" then
            shopLocal = game:GetService("Workspace")["Non-Player Characters"].Shops["Foosha Village"]
            game:GetService("Players").LocalPlayer.Build.Remotes.ServerRequest:FireServer("SetSpawn", shopLocal.Name)
            wait(0.1)
            game.Players.LocalPlayer.Character.Humanoid.Health = 0
            wait(5)
            local Distance2 = (shopLocal[co].HumanoidRootPart.CFrame.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
            local bv = Instance.new("BodyVelocity")
            bv.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
            bv.Velocity = Vector3.new(0,0,0)
            bv.Name = "NPCTPBody"
            bv.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
            local tween_s = game:GetService("TweenService")
            local info = TweenInfo.new(Distance2/Speed2, Enum.EasingStyle.Linear)
            local tween = tween_s:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, info, {CFrame = shopLocal[co].HumanoidRootPart.CFrame + Vector3.new(0,0,10)})
            tween:Play()
            wait(Distance2/Speed2)
            bv:Destroy()
        end
        if co == "Geppo-Teacher" then
            shopLocal = game:GetService("Workspace")["Non-Player Characters"].Shops["Geppo Island"]
            game:GetService("Players").LocalPlayer.Build.Remotes.ServerRequest:FireServer("SetSpawn", shopLocal.Name)
            wait(0.1)
            game.Players.LocalPlayer.Character.Humanoid.Health = 0
            wait(5)
            local Distance2 = (shopLocal[co].HumanoidRootPart.CFrame.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
            local bv = Instance.new("BodyVelocity")
            bv.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
            bv.Velocity = Vector3.new(0,0,0)
            bv.Name = "NPCTPBody"
            bv.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
            local tween_s = game:GetService("TweenService")
            local info = TweenInfo.new(Distance2/Speed2, Enum.EasingStyle.Linear)
            local tween = tween_s:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, info, {CFrame = shopLocal[co].HumanoidRootPart.CFrame + Vector3.new(0,0,10)})
            tween:Play()
            wait(Distance2/Speed2)
            bv:Destroy()

        end
        if co == "Bazooka-Seller" then
            shopLocal = game:GetService("Workspace")["Non-Player Characters"].Shops["Orange Town"]
            game:GetService("Players").LocalPlayer.Build.Remotes.ServerRequest:FireServer("SetSpawn", shopLocal.Name)
            wait(0.1)
            game.Players.LocalPlayer.Character.Humanoid.Health = 0
            wait(5)
            local Distance2 = (shopLocal[co].HumanoidRootPart.CFrame.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
            local bv = Instance.new("BodyVelocity")
            bv.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
            bv.Velocity = Vector3.new(0,0,0)
            bv.Name = "NPCTPBody"
            bv.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
            local tween_s = game:GetService("TweenService")
            local info = TweenInfo.new(Distance2/Speed2, Enum.EasingStyle.Linear)
            local tween = tween_s:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, info, {CFrame = shopLocal[co].HumanoidRootPart.CFrame + Vector3.new(-10,0,0)})
            tween:Play()
            wait(Distance2/Speed2)
            bv:Destroy()

        end
        if co == "Dual Katana-Seller" or co == "Haki-Teacher" then
            shopLocal = game:GetService("Workspace")["Non-Player Characters"].Shops["Monkey Island"]
            game:GetService("Players").LocalPlayer.Build.Remotes.ServerRequest:FireServer("SetSpawn", shopLocal.Name)
            wait(0.1)
            game.Players.LocalPlayer.Character.Humanoid.Health = 0
            wait(5)
            local Distance2 = (shopLocal[co].HumanoidRootPart.CFrame.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
            local bv = Instance.new("BodyVelocity")
            bv.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
            bv.Velocity = Vector3.new(0,0,0)
            bv.Name = "NPCTPBody"
            bv.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
            local tween_s = game:GetService("TweenService")
            local info = TweenInfo.new(Distance2/Speed2, Enum.EasingStyle.Linear)
            local tween = tween_s:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, info, {CFrame = shopLocal[co].HumanoidRootPart.CFrame + Vector3.new(10,0,0)})
            tween:Play()
            wait(Distance2/Speed2)
            bv:Destroy()

        end
        if co == "Soru-Teacher" then
            shopLocal = game:GetService("Workspace")["Non-Player Characters"].Shops["Syrup Village"]
            game:GetService("Players").LocalPlayer.Build.Remotes.ServerRequest:FireServer("SetSpawn", "Syrup Island")
            wait(0.1)
            game.Players.LocalPlayer.Character.Humanoid.Health = 0
            wait(5)
            local Distance2 = (shopLocal[co].HumanoidRootPart.CFrame.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
            local bv = Instance.new("BodyVelocity")
            bv.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
            bv.Velocity = Vector3.new(0,0,0)
            bv.Name = "NPCTPBody"
            bv.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
            local tween_s = game:GetService("TweenService")
            local info = TweenInfo.new(Distance2/Speed2, Enum.EasingStyle.Linear)
            local tween = tween_s:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, info, {CFrame = shopLocal[co].HumanoidRootPart.CFrame + Vector3.new(-10,0,0)})
            tween:Play()
            wait(Distance2/Speed2)
            bv:Destroy()

        end
        if co == "Dark Leg-Teacher" then
            shopLocal = game:GetService("Workspace")["Non-Player Characters"].Shops["Baratie"]
            game:GetService("Players").LocalPlayer.Build.Remotes.ServerRequest:FireServer("SetSpawn", shopLocal.Name)
            wait(0.1)
            game.Players.LocalPlayer.Character.Humanoid.Health = 0
            wait(5)
            local Distance2 = (shopLocal[co].HumanoidRootPart.CFrame.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
            local bv = Instance.new("BodyVelocity")
            bv.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
            bv.Velocity = Vector3.new(0,0,0)
            bv.Name = "NPCTPBody"
            bv.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
            local tween_s = game:GetService("TweenService")
            local info = TweenInfo.new(Distance2/Speed2, Enum.EasingStyle.Linear)
            local tween = tween_s:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, info, {CFrame = shopLocal[co].HumanoidRootPart.CFrame + Vector3.new(0,0,-10)})
            tween:Play()
            wait(Distance2/Speed2)
            bv:Destroy()

        end
        if co == "Wrestling-Teacher" or co == "Third Katana Seller" or co == "Devil Fruit-Remover" then
            shopLocal = game:GetService("Workspace")["Non-Player Characters"].Shops["Yeti Island"]
            game:GetService("Players").LocalPlayer.Build.Remotes.ServerRequest:FireServer("SetSpawn", shopLocal.Name)
            wait(0.1)
            game.Players.LocalPlayer.Character.Humanoid.Health = 0
            wait(5)
            local Distance2 = (shopLocal[co].HumanoidRootPart.CFrame.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
            local bv = Instance.new("BodyVelocity")
            bv.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
            bv.Velocity = Vector3.new(0,0,0)
            bv.Name = "NPCTPBody"
            bv.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
            local tween_s = game:GetService("TweenService")
            local info = TweenInfo.new(Distance2/Speed2, Enum.EasingStyle.Linear)
            local tween = tween_s:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, info, {CFrame = shopLocal[co].HumanoidRootPart.CFrame + Vector3.new(10,0,-10)})
            tween:Play()
            wait(Distance2/Speed2)
            bv:Destroy()

        end
        if co == "Fishman Karate-Teacher" then
            shopLocal = game:GetService("Workspace")["Non-Player Characters"].Shops["Arlong park"]
            game:GetService("Players").LocalPlayer.Build.Remotes.ServerRequest:FireServer("SetSpawn", "Arlong Park")
            wait(0.1)
            game.Players.LocalPlayer.Character.Humanoid.Health = 0
            wait(5)
            local Distance2 = (shopLocal[co].HumanoidRootPart.CFrame.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
            local bv = Instance.new("BodyVelocity")
            bv.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
            bv.Velocity = Vector3.new(0,0,0)
            bv.Name = "NPCTPBody"
            bv.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
            local tween_s = game:GetService("TweenService")
            local info = TweenInfo.new(Distance2/Speed2, Enum.EasingStyle.Linear)
            local tween = tween_s:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, info, {CFrame = shopLocal[co].HumanoidRootPart.CFrame + Vector3.new(0,0,15)})
            tween:Play()
            wait(Distance2/Speed2)
            bv:Destroy()

        end
        if co == "Devil Fruit-Seller" then
            shopLocal = game:GetService("Workspace")["Non-Player Characters"].Shops["Logue Town"]
            game:GetService("Players").LocalPlayer.Build.Remotes.ServerRequest:FireServer("SetSpawn", shopLocal.Name)
            wait(0.1)
            game.Players.LocalPlayer.Character.Humanoid.Health = 0
            wait(5)
            local Distance2 = (shopLocal[co].HumanoidRootPart.CFrame.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
            local bv = Instance.new("BodyVelocity")
            bv.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
            bv.Velocity = Vector3.new(0,0,0)
            bv.Name = "NPCTPBody"
            bv.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
            local tween_s = game:GetService("TweenService")
            local info = TweenInfo.new(Distance2/Speed2, Enum.EasingStyle.Linear)
            local tween = tween_s:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, info, {CFrame = shopLocal[co].HumanoidRootPart.CFrame + Vector3.new(0,0,-10)})
            tween:Play()
            wait(Distance2/Speed2)
            bv:Destroy()

        end
        if co == "Sea Beast Spawn" then
            shopLocal = game:GetService("Workspace")["Non-Player Characters"]
            game:GetService("Players").LocalPlayer.Build.Remotes.ServerRequest:FireServer("SetSpawn", "¿?¿¿¿???")
            wait(0.1)
            game.Players.LocalPlayer.Character.Humanoid.Health = 0
            wait(5)
            local Distance2 = (shopLocal[co].HumanoidRootPart.CFrame.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
            local bv = Instance.new("BodyVelocity")
            bv.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
            bv.Velocity = Vector3.new(0,0,0)
            bv.Name = "NPCTPBody"
            bv.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
            local tween_s = game:GetService("TweenService")
            local info = TweenInfo.new(Distance2/Speed2, Enum.EasingStyle.Linear)
            local tween = tween_s:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, info, {CFrame = shopLocal[co].HumanoidRootPart.CFrame + Vector3.new(0,0,-10)})
            tween:Play()
            wait(Distance2/Speed2)
            bv:Destroy()

        end
    end)

    local FruitTPSection = TeleportsTab:NewSection("Devil Fruit")
    FruitTPSection:NewButton("Click to Teleport to a Devil Fruit", "", function()
        if game:GetService("Workspace").IgnoreList:FindFirstChild("Handle") then
            local fruitLoc = game:GetService("Workspace").IgnoreList.Handle.CFrame
            local Distance2 = (fruitLoc.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
            local Speed2 = 100
            local bv = Instance.new("BodyVelocity")
            bv.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
            bv.Velocity = Vector3.new(0,0,0)
            bv.Name = "BodyTPPlayer"
            bv.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
            local tween_s = game:GetService("TweenService")
            local info = TweenInfo.new(Distance2/Speed2, Enum.EasingStyle.Linear)
            local tween = tween_s:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, info, {CFrame = fruitLoc * CFrame.new(0,0,10)})
            tween:Play()
            wait(Distance2/Speed2)
            bv:Destroy()
        else return end
    end)
-- OTHER
    local OtherTab = Window:NewTab("Other")
    local GameSection = OtherTab:NewSection("Game")



    local tpService = game:GetService("TeleportService")
    GameSection:NewButton("Server Hop", "", function()
        tpService:Teleport(game.PlaceId, game.Players.LocalPlayer)
    end)
    GameSection:NewKeybind("Hide UI", "", Enum.KeyCode.N, function()
        Library:ToggleUI()
    end)
    GameSection:NewButton("Destroy UI", "", function()
        LibName = Library:getUIName()
        game.CoreGui[LibName]:Destroy()
    end)

    local CreditsSection = OtherTab:NewSection("Credits")
    local CreditLabel = CreditsSection:NewLabel(" Hub & Functions by mazter#2222")
    local CreditLabel = CreditsSection:NewLabel(" Kavo UI Library by xHeptc")
