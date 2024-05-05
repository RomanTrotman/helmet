if game.PlaceId == 13943784614 then
        if not game:IsLoaded() then game.Loaded:Wait() end
        wait(5)
        local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/Jxereas/UI-Libraries/main/notification_gui_library.lua", true))()
        local function failsafe()
            wait(60)
            game:GetService("ReplicatedStorage").Remotes.Teleport.Replay:InvokeServer()
        end
        task.spawn(failsafe)
        wait(4)
        game:GetService("SoundService").OpenNotifSound.Volume = 0
        game:GetService("SoundService").CloseNotifSound.Volume = 0
        Notification.new("info", "Readyed", ".", true, 2)
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Briefing"):WaitForChild("SetReady"):FireServer()
        wait(4)
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Briefing"):WaitForChild("CutsceneSkipVote"):FireServer()
        repeat task.wait(0.025) until Workspace:FindFirstChild(game:GetService("Players").LocalPlayer.Name)
        --  
        wait(1)

        local plr = game:GetService("Players").LocalPlayer
        local char = plr.Character
        local Map = game:GetService("Workspace").Map
        local CRoom = Map.Geometry.CameraRoom
        local Objective = Map.Objectives
        local KC = CRoom.KeycardSpawns:FindFirstChild("Keycard")
        local Spawn = Instance.new("Part")
        Spawn.Position = char.Head.Position
        Spawn.Anchored = true
        local Noclip = nil
        local Clip = nil
    -- skidded noclip
        function noclip()
            Clip = false
            local function Nocl()
                if Clip == false and game.Players.LocalPlayer.Character ~= nil then
                    for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                        if v:IsA('BasePart') and v.CanCollide and v.Name ~= floatName then v.CanCollide = false end
                    end
                end
                wait(0.21)
            end
            Noclip = game:GetService('RunService').Stepped:Connect(Nocl)
        end

        function clip()
            if Noclip then Noclip:Disconnect() end
            Clip = true
        end

        noclip()
        local bodyVelocity = Instance.new("BodyVelocity")
        bodyVelocity.Name = "float"
        bodyVelocity.Parent = game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        local function Intimidate()
            while task.wait(0.025) do
                local args = {
                    [1] = Vector3.new(-0.041778575628995895, -0.09095385670661926,0.9949783086776733)}
                game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Replication"):WaitForChild("Intimidate"):FireServer(unpack(args))

                local args = {
                    [1] = Vector3.new(0.9934772849082947, -0.11377045512199402,-0.007680955342948437)}
                game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Replication"):WaitForChild("Intimidate"):FireServer(unpack(args))

                local args = {
                    [1] = Vector3.new(0.0535888597369194, -0.1127776950597763,-0.9921740293502808)}
                game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Replication"):WaitForChild("Intimidate"):FireServer(unpack(args))
                local args = {
                    [1] = Vector3.new(-0.9832711219787598, -0.1807088851928711,0.0228499174118042)}
                game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Replication"):WaitForChild("Intimidate"):FireServer(unpack(args))
                local args = {
                    [1] = Vector3.new(-0.041778575628995895, -0.09095385670661926,0.9949783086776733)}
                game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Replication"):WaitForChild("Intimidate"):FireServer(unpack(args))

                local args = {
                    [1] = Vector3.new(0.9934772849082947, -0.11377045512199402,-0.007680955342948437)}
                game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Replication"):WaitForChild("Intimidate"):FireServer(unpack(args))

                local args = {
                    [1] = Vector3.new(0.0535888597369194, -0.1127776950597763,-0.9921740293502808)}
                game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Replication"):WaitForChild("Intimidate"):FireServer(unpack(args))
                local args = {
                    [1] = Vector3.new(-0.9832711219787598, -0.1807088851928711,0.0228499174118042)}
                game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Replication"):WaitForChild("Intimidate"):FireServer(unpack(args))
            end
        end
        task.spawn(Intimidate)
        wait(0.4)
        while CRoom.KeycardSpawns:FindFirstChild("Keycard") ~= nil do
            task.wait(0.2)
            if CRoom.KeycardSpawns:FindFirstChild("Keycard") then
                char:MoveTo(KC.Handle.Position)
                fireproximityprompt(KC.Base.GrabPrompt)
            end
        end
        wait(0.2)
        Notification.new("success", "Step 1", "Got keycard", true, 2)
        char:MoveTo(Spawn.Position)
        wait(0.4)
        while workspace.Map.Objectives.ControlLever.Handle.ProximityPrompt.Enabled == true do
            task.wait(0.2)
            if workspace.Map.Objectives.ControlLever:FindFirstChild("Handle") then
                char:MoveTo(Objective.ControlLever.Handle.Position)
                fireproximityprompt(workspace.Map.Objectives.ControlLever.Handle.ProximityPrompt)
            end
        end
        wait(0.2)
        Notification.new("success", "Step 2", "Opened gate", true, 2)
        char:MoveTo(Spawn.Position)
        wait(0.4)
        while Objective.Radio:FindFirstChild("Handle"):FindFirstChild("ProximityPrompt") ~= nil do
            task.wait(0.2)
            if Objective.Radio:FindFirstChild("Handle"):FindFirstChild("ProximityPrompt") then
                char:MoveTo(Objective.Radio.Handle.Position)
                fireproximityprompt(game:GetService("Workspace").Map.Objectives.Radio.Handle.ProximityPrompt)
            end
        end
        wait(0.2)
        Notification.new("success", "Step 3", "Got C4", true, 2)
        char:MoveTo(Spawn.Position)
        wait(0.4)
        for _, es in pairs(Objective.Radar:GetChildren()) do
            if es.Name == "Explosive1" or es.Name == "Explosive2" then
                while es:FindFirstChild("Handle") ~= nil do
                    task.wait(0.2)
                    if es:FindFirstChild("Handle") ~= nil then
                        char:MoveTo(es.Handle.Position)
                        fireproximityprompt(es:FindFirstChild("Handle").ProximityPrompt)
                    end
                end
                wait(0.2)
                Notification.new("success", "Step 4", "Planned bomb", true, 2)
                char:MoveTo(Spawn.Position)
            end
        end
        wait(0.4)
        Notification.new("success", "Step 5", "Attempting to intimidate everyone", true, 2)
for i = 1, 10 do
    task.wait(0.05)
    for i, v in next, game.workspace:GetChildren() do
        if v ~= nil then
            if v.Name ~= game:GetService("Players").LocalPlayer.Name then
                if v:FindFirstChild("HumanoidRootPart") then
                    if v:FindFirstChild("Humanoid") then
                        if v.Humanoid.WalkSpeed >= 10 then
                            if v.HumanoidRootPart:FindFirstChild("FollowPrompt") then
                                if v.Humanoid.WalkSpeed ~= 0 then
                                if v.HumanoidRootPart.FollowPrompt.Enabled == false then
                                        if v:FindFirstChild("Viewmodel_Rifle2") == nil then
                        else
                            local plr = game:GetService("Players").LocalPlayer
                            local char = plr.Character
                            char:MoveTo(v:FindFirstChild("HumanoidRootPart").Position)
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end
end

Notification.new("success", "Step 6", "Attempting to escape", true, 2)
task.wait(3)
        pcall(function()
            repeat
                task.wait(0.03)
                if Objective:FindFirstChild("EscapeZone") then
                    local escape = Objective:FindFirstChild("EscapeZone");
                    char:MoveTo(escape.Position + Vector3.new(0, 3.75, 0))
                end 
            until Objective:FindFirstChild("EscapeZone") == nil
        end)
        Notification.new("success", "End", "Waiting for score", true, 2)
       task.wait(12)
        game:GetService("ReplicatedStorage").Remotes.Teleport.Replay:InvokeServer()
    end
