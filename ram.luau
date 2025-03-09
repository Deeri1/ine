game.Loaded:Wait()
--vars
local Players = game:FindFirstChildOfClass("Players")
local RunService = game:FindFirstChildOfClass("RunService")
--plr vars
local Player = Players.LocalPlayer
local Character = Player["Character"] or Player.CharacterAdded:Wait()
local char = Character
local Humanoid = Character:FindFirstChildWhichIsA("Humanoid")
local RootPart = Character:WaitForChild("HumanoidRootPart")
local Head = Character:WaitForChild("Head")
local RightArm = Character:WaitForChild("Right Arm")
local LeftArm = Character:WaitForChild("Left Arm")
local RightLeg = Character:WaitForChild("Right Leg")
local LeftLeg = Character:WaitForChild("Left Leg")
local Torso = Character:WaitForChild("Torso")
Local Camera = workspace.CurrentCamera
local Mouse = Player:GetMouse()

--functions
function cfmove(p0,p1)
    p0.Cframe = p1.CFrame
end

function move(p0,p1) --thanks daddy Gelatek
    local AlignPosition = Instance.new("AlignPosition"); do
		AlignPosition.MaxForce = 66666666666
		AlignPosition.RigidityEnabled = true
		AlignPosition.Responsiveness = 200
		AlignPosition.Name = "AlignPosition1"
		AlignPosition.Parent = p0
	end

	local AlignOrientation = Instance.new("AlignOrientation"); do
		AlignOrientation.MaxTorque = 9e9
		AlignOrientation.Responsiveness = 200
		AlignOrientation.Name = "AlignOrientation"
		AlignOrientation.Parent = p0
	end

	local Attachment1 = Instance.new("Attachment"); do
		Attachment1.Position = Vector3.new(0,0,0)
		Attachment1.Orientation = Vector3.new(0,0,0)
		Attachment1.Name = "Attachment1"
		Attachment1.Parent = p0
	end

	local Attachment2 = Instance.new("Attachment"); do
		Attachment2.Parent = p1
	end

	AlignPosition.Attachment0 = Attachment1
	AlignPosition.Attachment1 = Attachment2
	AlignOrientation.Attachment0 = Attachment1
	AlignOrientation.Attachment1 = Attachment2
end

--dummy stuff
--dummy clone
for i, v in pairs(workspace:GetDescendants()) do
    if v.Name == "Dummylolxdnoo" then
    v:Destroy()
    end
end
for i, v in pairs(char:GetDescendants()) do
    v.Archivable = true
    if v:IsA("BasePart") then
        v.CanCollide = false
    end
end

dummy = char:Clone()
dummy.Name = "Dummylolxdnoo"
dummy.Parent = workspace

dummy.HumanoidRootPart.Position = char.HumanoidRootPart.Position

game.Players.LocalPlayer.ReplicationFocus = workspace[plrname]
for i, v in pairs(dummy:GetDescendants()) do
    v.Archivable = true
    if v:IsA("BasePart") then
    v.Transparency = 1
   -- v.CanCollide = false
    end
end
dummy.breakJointsOnDeath = false
---reanim main

game:GetService("StarterGui"):SetCore("ResetButtonCallback", false)
task.wait(Players.RespawnTime + game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue() / 750)
local Head = Character:FindFirstChild("Head")
Head:BreakJoints() 
game:GetService("StarterGui"):SetCore("ResetButtonCallback", true)

for i,v in pairs(char:GetChildren()) do
    if v:IsA("BasePart") then
        if dummy:FindFirstChild(v.Name) then
            move(v,dummy[v.Name])
        end
    elseif v:IsA("Accessory") then
        for i2,v2 in pairs(dummy:GetChildren()) do
            if v2:IsA("Accessory") and v2.Name ~= "used" then -- a bunch of checks lol
                if v.Handle.Size == v2.Handle.Size then
                    if (v.Mesh and v2.Mesh) or (v.SpecialMesh and v2.SpecialMesh) then
                        if v.Mesh then
                            if v.Mesh.MeshId == v2.Mesh.MeshId and v.Mesh.TextureId == v2.Mesh.TextureId then
                                move(v.Handle,v2.Handle)
                                v2.Name = "used"
                            end
                        else
                            if v.SpecialMesh.MeshId == v2.SpecialMesh.MeshId and v.SpecialMesh.TextureId == v2.SpecialMesh.TextureId then
                                move(v.Handle,v2.Handle)
                                v2.Name = "used"
                            end
                        end
                    end
                end
            end
        end
    end
end
char.Parent = dummy

--velocity loop
RunService.PreSimulation:Connect(function()
    Velocity = Vector3.new(dummy["HumanoidRootPart"].CFrame.LookVector.X * 85, dummy["Head"].Velocity.Y * 4, dummy["HumanoidRootPart"].CFrame.LookVector.Z * 85)
    for i,v in char:GetDescendants() do
        if v:IsA("BasePart") then
            if v and v.Parent then
                v.AssemblyLinearVelocity = Velocity
            end
        end
    end
end)