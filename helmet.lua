if not game:IsLoaded() then
    game.Loaded:Wait()
end   
clear_teleport_queue()
wait(4)
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Briefing"):WaitForChild("SetReady"):FireServer()
wait(8)
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Briefing"):WaitForChild("CutsceneSkipVote"):FireServer()
repeat task.wait(0.025) until Workspace:FindFirstChild(game:GetService("Players").LocalPlayer.Name)
--  
wait(4)
local plr = game:GetService("Players").LocalPlayer
local char = plr.Character
local Map = game:GetService("Workspace").Map
local CRoom = Map.Geometry.CameraRoom
local Objective = Map.Objectives
local KC = CRoom.KeycardSpawns:FindFirstChild("Keycard")
local Spawn = Instance.new("Part")
Spawn.Position = char.Head.Position
Spawn.Anchored = true
Spawn.CanCollide = false
wait(1)
while CRoom.KeycardSpawns:FindFirstChild("Keycard") do
char.HumanoidRootPart.Position = KC.Handle.Position
wait(1)
fireproximityprompt(KC.Base.GrabPrompt)
wait(1)
char.HumanoidRootPart.Position = char.Torso.Position  
end
wait(1)
while Objective.ControlLever:FindFirstChild("Handle") do
char.HumanoidRootPart.Position = Objective.ControlLever.Handle.Position
wait(1)
fireproximityprompt(workspace.Map.Objectives.ControlLever.Handle.ProximityPrompt)
wait(1)
char.HumanoidRootPart.Position = char.Torso.Position 
end
wait(1)
while Objective.Radio:FindFirstChild("Handle") do
char.HumanoidRootPart.Position = Objective.Radio.Handle.Position
wait(1)
fireproximityprompt(game:GetService("Workspace").Map.Objectives.Radio.Handle.ProximityPrompt)
wait(1)
char.HumanoidRootPart.Position = char.Torso.Position
end
wait(1)
char.HumanoidRootPart.Position = Objective.Radar.Hint.Position
wait(1)
for _,es in pairs(Objective.Radar:GetChildren()) do
    if es.Name == "Explosive1" or es.Name == "Explosive2" then
        char.HumanoidRootPart.Position = es.Handle.Position
        wait(1)
        fireproximityprompt(es:FindFirstChild("Handle").ProximityPrompt)
        wait(1)
        char.HumanoidRootPart.Position = char.Torso.Position

    end
end
wait(1)
char:MoveTo(Objective.EscapeZone.Position)
wait(3)
queue_on_teleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/RomanTrotman/helmet/main/helmet.lua'))()")
game:GetService("ReplicatedStorage").Remotes.Teleport.Replay:InvokeServer()
