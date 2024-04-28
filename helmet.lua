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
local Noclip = nil
local Clip = nil

function noclip()
	Clip = false
	local function Nocl()
		if Clip == false and game.Players.LocalPlayer.Character ~= nil then
			for _,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
				if v:IsA('BasePart') and v.CanCollide and v.Name ~= floatName then
					v.CanCollide = false
				end
			end
		end
		wait(0.21) -- basic optimization
	end
	Noclip = game:GetService('RunService').Stepped:Connect(Nocl)
end

noclip() -- to toggle noclip() and clip()
local bodyVelocity = Instance.new("BodyVelocity")
               bodyVelocity.Name = "float"
               bodyVelocity.Parent = game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
wait(1)
while CRoom.KeycardSpawns:FindFirstChild("Keycard") ~= nil do
    task.wait(0.2)
if CRoom.KeycardSpawns:FindFirstChild("Keycard") then
char:MoveTo(KC.Handle.Position)
fireproximityprompt(KC.Base.GrabPrompt)
end
end
wait(0.2)
char:MoveTo(Spawn.Position) 
wait(1)
while workspace.Map.Objectives.ControlLever.Handle.ProximityPrompt.Enabled == true do
    task.wait(0.2)
if workspace.Map.Objectives.ControlLever:FindFirstChild("Handle") then 
  char:MoveTo(Objective.ControlLever.Handle.Position)
        fireproximityprompt(workspace.Map.Objectives.ControlLever.Handle.ProximityPrompt)
end
end
wait(0.2)
char:MoveTo(Spawn.Position)
wait(1)
while Objective.Radio:FindFirstChild("Handle"):FindFirstChild("ProximityPrompt") ~= nil do
    task.wait(0.2)
if Objective.Radio:FindFirstChild("Handle"):FindFirstChild("ProximityPrompt") then
    char:MoveTo(Objective.Radio.Handle.Position)
fireproximityprompt(game:GetService("Workspace").Map.Objectives.Radio.Handle.ProximityPrompt)
end
end
wait(0.2)
char:MoveTo(Spawn.Position)
wait(1)
for _,es in pairs(Objective.Radar:GetChildren()) do
    if es.Name == "Explosive1" or es.Name == "Explosive2" then
        while es:FindFirstChild("Handle") ~= nil do
            task.wait(0.2)
if  es:FindFirstChild("Handle") ~= nil then
 char:MoveTo(es.Handle.Position)
        fireproximityprompt(es:FindFirstChild("Handle").ProximityPrompt)
        end
end
        wait(0.2)
        char:MoveTo(Spawn.Position)

    end
end
wait(1)
game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").float:Destroy()
char:MoveTo(Objective.EscapeZone.Position)
wait(3)
queue_on_teleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/RomanTrotman/helmet/main/helmet.lua'))()")
game:GetService("ReplicatedStorage").Remotes.Teleport.Replay:InvokeServer()

