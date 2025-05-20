local Players = game:FindFirstChildOfClass("Players")
local RunService = game:FindFirstChildOfClass("RunService")
--plr vars
local Player = Players.LocalPlayer
local Character = Player["Character"]
local char = Character
local Humanoid = Character:FindFirstChildWhichIsA("Humanoid")
local RootPart = Character:WaitForChild("HumanoidRootPart")
local Head = Character:WaitForChild("Head")
local RightArm = Character:WaitForChild("Right Arm")
local LeftArm = Character:WaitForChild("Left Arm")
local RightLeg = Character:WaitForChild("Right Leg")
local LeftLeg = Character:WaitForChild("Left Leg")
local Torso = Character:WaitForChild("Torso")
local Camera = workspace.CurrentCamera
local Mouse = Player:GetMouse()
workspace.FallenPartsDestroyHeight = 0/0


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
for i, v in pairs(workspace:GetDescendants()) do
    if v.Name == "Dummylolxdnoo" then
    v:Destroy()
    end
end
char = game.Players.LocalPlayer.Character
char.Archivable = true
for i, v in char:GetDescendants() do
    v.Archivable = true
    if v:IsA("BasePart") then
        v.CanCollide = false
    end
end

dummy = char:Clone()
wait(1)
dummy.Name = "Dummylolxdnoo"
dummy.Parent = workspace

dummy.HumanoidRootPart.Position = char.HumanoidRootPart.Position

game.Players.LocalPlayer.ReplicationFocus = workspace[Player.Name]
for i, v in pairs(dummy:GetDescendants()) do
    v.Archivable = true
    if v:IsA("BasePart") then
    v.Transparency = 1
    v.CanCollide = false
    end
end

amountc = 0
amount = tonumber(amount)
livetools = {}
while amountc < 6 do
    local i = 0;
    while i <7 and amountc < 6 do
        local thing = game.workspace.Handle
        firetouchinterest(game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart"), thing, 0) --0 is touch
        wait()
        firetouchinterest(game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart"), thing, 1) -- 1 is untouch
        game:GetService'RunService'.Heartbeat:Wait()
        game:GetService'RunService'.RenderStepped:Wait()
        tool = game.Players.LocalPlayer.Character:WaitForChild("Spray")
        game:GetService'RunService'.Heartbeat:Wait()
        tool.Parent = game.workspace
        table.insert(livetools,tool)
        amountc = amountc + 1
        i= i + 1
    end
    game:GetService'RunService'.Heartbeat:Wait()
    game:GetService'RunService'.RenderStepped:Wait()
    for e,v in game.Workspace:GetChildren() do
        if v:IsA("Tool") then
            game:GetService'RunService'.Heartbeat:Wait()
            game:GetService'RunService'.RenderStepped:Wait()
            v.Handle.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        end
    end
    for e,v in game.Players.LocalPlayer.Backpack:GetChildren() do
        if v and v:IsA("Tool") then
            game:GetService'RunService'.Heartbeat:Wait()
            game:GetService'RunService'.RenderStepped:Wait()
            v.Parent = game.Players.LocalPlayer.Character
        end
    end
    game:GetService'RunService'.Heartbeat:Wait()
    game:GetService'RunService'.RenderStepped:Wait()
    for e,v in game.Players.LocalPlayer.Character:GetChildren() do
        if v and v:IsA("Tool") then
            v.Parent = game.workspace
        end
    end
    game:GetService'RunService'.Heartbeat:Wait()
    game:GetService'RunService'.RenderStepped:Wait()
end
print("done11")
game:GetService'RunService'.Heartbeat:Wait()
game:GetService'RunService'.RenderStepped:Wait()
for e,v in game.Workspace:GetChildren() do
    if v:IsA("Tool") then
        v.Handle.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    end
end
game:GetService'RunService'.Heartbeat:Wait()
game:GetService'RunService'.RenderStepped:Wait()
for e,v in game.Players.LocalPlayer.Character:GetChildren() do
    if v and v:IsA("Tool") then
        v.Parent = game.Players.LocalPlayer.Backpack
    end
end

stubcount = 0
livetools = {}
for i,v in game.Players.LocalPlayer.Backpack:GetChildren() do
    if v and v:IsA("Tool") and v.Name == "Spray" then
        tool.Parent = game.Players.LocalPlayer.Character
		tool.Parent = game.Players.LocalPlayer.Backpack
		tool.Parent = game.Players.LocalPlayer.Character.Humanoid
		tool.Parent = game.Players.LocalPlayer.Character
        if stubcount == 0 then
            move(v.Handle, game.Players.LocalPlayer.Character.Head)
        elseif stubcount == 1 then
            move(v.Handle, game.Players.LocalPlayer.Character.RightArm)
        elseif stubcount == 2 then
            move(v.Handle, game.Players.LocalPlayer.Character.LeftArm)
        elseif stubcount == 3 then
            move(v.Handle, game.Players.LocalPlayer.Character.RightLeg)
        elseif stubcount == 4 then
            move(v.Handle, game.Players.LocalPlayer.Character.LeftLeg)
        elseif stubcount == 5 then
            move(v.Handle, game.Players.LocalPlayer.Character.Torso)
        end
        livetools[stubcount] = v.Handle
        stubcount = stubcount + 1
    end
end



local CurCameraOffset = workspace.CurrentCamera.CFrame
workspace.CurrentCamera.CFrame = CurCameraOffset
game.Players.LocalPlayer.Character = dummy
workspace.CurrentCamera.CFrame = CurCameraOffset
workspace.CurrentCamera.CameraSubject = dummy.Humanoid
workspace.CurrentCamera.CFrame = CurCameraOffset

  erd = game:GetService("RunService").Heartbeat:Connect(function()
    for i,v in pairs(livetools) do
        if v then
           v.Velocity = Vector3.new(0, 100, 0)
        end
    end
  end)