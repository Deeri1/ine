_G.neededhats = {4524991457,4820152700,4315489767,4794315940,4458601937,4506945409}
nh = neededhats


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
ecount = 0
hatar = {}
for i,v in pairs(_G.neededhats) do
    hat = game:GetObjects("rbxassetid://"..v.."")[1]
    hat.Parent = char
    hatar[i] = hat
    ecount = ecount + 1
end
dummy = char:Clone()
wait(1)
dummy.Name = "Dummylolxdnoo"
dummy.Parent = workspace

for i, v in pairs(dummy:GetDescendants()) do
    if v:IsA("Accessory") then
      --  v:Destroy()
    end
    if v:IsA("BasePart") then
        v.CanCollide = false
    end
end


dummy.HumanoidRootPart.Position = char.HumanoidRootPart.Position

game.Players.LocalPlayer.ReplicationFocus = workspace[Player.Name]
for i, v in pairs(dummy:GetDescendants()) do
    v.Archivable = true
    if v:IsA("BasePart") then
    v.Transparency = .25
    v.CanCollide = false
    end
end

amountc = 0
amount = tonumber(amount)
livetools = {}
ecount = ecount + 6
while amountc < ecount do
    local i = 0;
    while i <7 and amountc < ecount do
        local thing = game.workspace.Handle
        if game.Players.LocalPlayer.Backpack:FindFirstChild("Spray") then
            for e,v in game.Players.LocalPlayer.Backpack:GetChildren() do
                if v and v:IsA("Tool") and v.Name == "Spray" then
                    game:GetService'RunService'.Heartbeat:Wait()
                    game:GetService'RunService'.RenderStepped:Wait()
                    v.Handle.Massless = true
                    v.Parent = game.Players.LocalPlayer.Character
                end
            end
            game:GetService'RunService'.Heartbeat:Wait()
            game:GetService'RunService'.RenderStepped:Wait()
            for e,v in game.Players.LocalPlayer.Character:GetChildren() do
                if v and v:IsA("Tool") and v.Name == "Spray" then
                    v.Parent = game.workspace
                end
            end
        end
        game:GetService'RunService'.Heartbeat:Wait()
        game:GetService'RunService'.RenderStepped:Wait()
        firetouchinterest(game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart"), thing, 0) --0 is touch
        wait()
        firetouchinterest(game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart"), thing, 1) -- 1 is untouch
        game:GetService'RunService'.Heartbeat:Wait()
        game:GetService'RunService'.RenderStepped:Wait()
        tool = game.Players.LocalPlayer.Character:FindFirstChild("Spray")
        if tool then
        game:GetService'RunService'.Heartbeat:Wait()
        tool.Parent = game.workspace
        table.insert(livetools,tool)
        amountc = amountc + 1
        i= i + 1
        end
                if game.Players.LocalPlayer.Backpack:FindFirstChild("Spray") then
            for e,v in game.Players.LocalPlayer.Backpack:GetChildren() do
                if v and v:IsA("Tool") and v.Name == "Spray" then
                    game:GetService'RunService'.Heartbeat:Wait()
                    game:GetService'RunService'.RenderStepped:Wait()
                    v.Handle.Massless = true
                    v.Parent = game.Players.LocalPlayer.Character
                end
            end
            game:GetService'RunService'.Heartbeat:Wait()
            game:GetService'RunService'.RenderStepped:Wait()
            for e,v in game.Players.LocalPlayer.Character:GetChildren() do
                if v and v:IsA("Tool") and v.Name == "Spray" then
                    v.Parent = game.workspace
                end
            end
        end
    end
    game:GetService'RunService'.Heartbeat:Wait()
    game:GetService'RunService'.RenderStepped:Wait()
    for e,v in game.Workspace:GetChildren() do
        if v:IsA("Tool") and v.Name == "Spray" then
            game:GetService'RunService'.Heartbeat:Wait()
            game:GetService'RunService'.RenderStepped:Wait()
            v.Handle.Massless = true
            v.Handle.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        end
    end
    game:GetService'RunService'.Heartbeat:Wait()
    game:GetService'RunService'.RenderStepped:Wait()
end
print("done11")
game:GetService'RunService'.Heartbeat:Wait()
game:GetService'RunService'.RenderStepped:Wait()
wait()
for e,v in game.Workspace:GetChildren() do
    if v:IsA("Tool") and v.Name == "Spray" then
        v.Handle.Massless = true
        v.Handle.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    end
end
game:GetService'RunService'.Heartbeat:Wait()
game:GetService'RunService'.RenderStepped:Wait()
wait(1)
for e,v in game.Players.LocalPlayer.Character:GetChildren() do
    if v and v:IsA("Tool") and v.Name == "Spray" then
        v.Parent = game.Players.LocalPlayer.Backpack
    end
end
game:GetService'RunService'.Heartbeat:Wait()
game:GetService'RunService'.RenderStepped:Wait()
stubcount = 0
livetools = {}
for i,v in game.Players.LocalPlayer.Backpack:GetChildren() do
    if v and v:IsA("Tool") and v.Name == "Spray" then
        v.Parent = game.Players.LocalPlayer.Character
		v.Parent = game.Players.LocalPlayer.Backpack
		v.Parent = game.Players.LocalPlayer.Character.Humanoid
		v.Parent = game.Players.LocalPlayer.Character
        wait()
        print(stubcount)
        if stubcount == 0 then
            move(v.Handle, dummy.Head)
        elseif stubcount == 1 then
            move(v.Handle, dummy["Right Arm"])
        elseif stubcount == 2 then
            move(v.Handle, dummy["Left Arm"])
        elseif stubcount == 3 then
            move(v.Handle, dummy["Right Leg"])
        elseif stubcount == 4 then
            move(v.Handle, dummy["Left Leg"])
        elseif stubcount == 5 then
            move(v.Handle, dummy.Torso)
        elseif stubcount > 5 then -- if hats needed
        print("attached to "..hatar[1].Name)
            for q,e in dummy:GetChildren() do
                if e:IsA("Accessory") and e.Name == hatar[1].Name then
                    if e.Handle:FindFirstChild("Mesh") and hatar[1]:FindFirstChild("Mesh") then
                        if e.Handle.Mesh.MeshId == hatar[1].Handle.Mesh.MeshId and e.Handle.Mesh.TextureId == hatar[1].Handle.Mesh.TextureId then
                            move(v.Handle, e.Handle)
                        end
                    elseif e.Handle:FindFirstChild("SpecialMesh") and  hatar[1]:FindFirstChild("SpecialMesh") then
                        if e.Handle.SpecialMesh.MeshId == hatar[1].Handle.SpecialMesh.MeshId  and e.Handle.SpecialMesh.TextureId == hatar[1].Handle.SpecialMesh.TextureId then
                            move(v.Handle, e.Handle)
                        end
                    end
                end
            end

           move(v.Handle, hatar[1].Handle)
           table.remove(hatar,1)
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

erd = game:GetService("RunService").PostSimulation:Connect(function()
    for i,v in pairs(livetools) do
        if v then
            v.CanCollide = false
            v.Velocity = Vector3.new(dummy["HumanoidRootPart"].CFrame.LookVector.X * 35, dummy["Head"].Velocity.Y * 4, dummy["HumanoidRootPart"].CFrame.LookVector.Z * -35)
        end
    end
  end)
