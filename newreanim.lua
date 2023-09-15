




_G.scripthere = function()
    game.Players.LocalPlayer.Character = game.Workspace.Dummylolxdnoo

end


loadstring(game:HttpGet("https://raw.githubusercontent.com/Deeri1/ine/main/reanimsafekeeping.txt"))()

showfakechar = 1
showrealchar = 0
player=game.Players.LocalPlayer
ogplr = player
char=player.Character
plrname=char.Name
realcharee = workspace:FindFirstChild(plrname)
char.Archivable = true
workspace.FallenPartsDestroyHeight = 0/0
for i, v in pairs(workspace:GetDescendants()) do
    if v.Name == "Dummylolxdnoo" then
    v:Destroy()
    end
end
for i, v in pairs(char:GetDescendants()) do
    v.Archivable = true

end
local Vector3_101 = Vector3.new(1, 0, 1)
local netless_Y = Vector3.new(0, 25.1, 0)

dummy = char:Clone()
dummy.Name = "Dummylolxdnoo"
dummy.Parent = workspace

dummy.HumanoidRootPart.Position = char.HumanoidRootPart.Position

settings().Physics.PhysicsEnvironmentalThrottle = Enum.EnviromentalPhysicsThrottle.Disabled
settings().Physics.AllowSleep = false
game.Players.LocalPlayer.ReplicationFocus = realcharee
for i, v in pairs(dummy:GetDescendants()) do
    v.Archivable = true
    if v:IsA("BasePart") then
    v.Transparency = showfakechar
    v.CanCollide = false
    end
end
game.Players.LocalPlayer.Character = dummy
scripthere = _G.scripthere
done=false
function waitseclol()
    wait(.2)
    done=true
end
templol = workspace:FindFirstChild(plrname)
   --[[ game:GetService("RunService").Heartbeat:Connect(function()
        ve = Vector3.new(-0, 0, 0)
        ve2 = Vector3.new(-5, 0, 0)
        game.Players.LocalPlayer.Character = dummy
            for i, v in pairs(templol:GetDescendants()) do
                if v:IsA("BasePart") then
--v.CanCollide = false
                end
                if v:IsA("BasePart") and v.Name ~= ("HumanoidRootPart") then
                    v.Velocity = ve
                    v.CanCollide = false
                elseif v:IsA("BasePart") and v.Name == ("HumanoidRootPart") then
                    v.Velocity = ve2
                    v.CanCollide = false
                end
            end
        --wait(0.2)
        for i, v in pairs(templol:GetDescendants()) do
            if v:IsA("Accessory") and v:FindFirstChild("Handle") then
                v.Handle.Velocity = Vector3.new(30, 0, 0)
            end
        end
    end)]]


    started = false

    
function weld(p1,p2)
    local ap = Instance.new('AlignPosition', p1.Handle);
    local ao = Instance.new('AlignOrientation', p1.Handle);
    ao.MaxAngularVelocity = math.huge;
    ao.MaxTorque = 1000000;
    ao.RigidityEnabled = false;
    ao.Responsiveness = 200;
    
	ap.ApplyAtCenterOfMass = true
	ap.MaxForce = 5772000--67752;
	ap.MaxVelocity = math.huge/9e110;
	ap.ReactionForceEnabled = false
	ap.Responsiveness = 200
	ap.RigidityEnabled = false
    if p2:FindFirstChild("checkrem") then
        p2.checkrem:Destroy()
    end
    local a1 = Instance.new('Attachment', p2);
    a1.Name = "checkrem"
    local a0 = Instance.new('Attachment', p1.Handle);
    ap.Attachment0 = a0;
    ap.Attachment1 = a1;
    ao.Attachment0 = a0;
    ao.Attachment1 = a1;
    a1.Position = Vector3.new(0,0,0);


    if p1.Name == "ra" then
        a1.Orientation = Vector3.new(-120,0, 0);
    end
    if p1.Name == "la" then
        a1.Orientation = Vector3.new(-120, 0, 0);
    end
    if p1.Name == "tor" then
        a0.Orientation = Vector3.new(0, 0, 0);
        a1.Orientation = Vector3.new(-0,0,0);   
    end
    if p1.Name == "ll" then
        a1.Orientation = Vector3.new(-0,0,90);
    end
    if p1.Name == "rl" then
        a0.Orientation = Vector3.new(0, 0, 90);
        a1.Orientation = Vector3.new(-0,0,0);
    end
end

function weld2(p1,p2)
    local ap = Instance.new('AlignPosition', p1);
    local ao = Instance.new('AlignOrientation', p1);
    ao.MaxAngularVelocity = math.huge;
    ao.MaxTorque = 1000000;
    ao.RigidityEnabled = false;
    ao.Responsiveness = 200;
    
    ap.MaxForce = 1000000;
    ap.MaxVelocity = Vector3.new(0,0,0)
    ap.RigidityEnabled = true
    ap.ApplyAtCenterOfMass = true
    ap.Responsiveness = 200;
    if p2:FindFirstChild("checkrem") then
        p2.checkrem:Destroy()
    end
    local a1 = Instance.new('Attachment', p2);
    a1.Name = "checkrem"
    local a0 = Instance.new('Attachment', p1);
    ap.Attachment0 = a0;
    ap.Attachment1 = a1;
    ao.Attachment0 = a0;
    ao.Attachment1 = a1;
    a1.Position = Vector3.new(0,0,0);


    if p1.Name == "ra" then
        a1.Orientation = Vector3.new(-120,0, 0);
    end
    if p1.Name == "la" then
        a1.Orientation = Vector3.new(-120, 0, 0);
    end
    if p1.Name == "tor" then
        a0.Orientation = Vector3.new(0, 0, 0);
        a1.Orientation = Vector3.new(-0,0,0);   
    end
    if p1.Name == "ll" then
        a1.Orientation = Vector3.new(-0,0,90);
    end
    if p1.Name == "rl" then
        a0.Orientation = Vector3.new(0, 0, 90);
        a1.Orientation = Vector3.new(-0,0,0);
    end
end

function reanim() --- killing player and switching to fake char
    if workspace:FindFirstChild(plrname).Torso:FindFirstChildOfClass("Motor6D") then
    wait()
    if workspace:FindFirstChild(plrname).Torso:FindFirstChildOfClass("Motor6D") then
    weld2(workspace:FindFirstChild(plrname).HumanoidRootPart,dummy.HumanoidRootPart)
      workspace:FindFirstChild(plrname).HumanoidRootPart.CFrame = CFrame.new(dummy.HumanoidRootPart.CFrame.X+6,dummy.HumanoidRootPart.CFrame.Y+6,dummy.HumanoidRootPart.CFrame.Z+6)
      --dummy.HumanoidRootPart.CFrame
    wait(.1)
    --repeat wait() until workspace:FindFirstChild(plrname):FindFirstChild("Head")
    if workspace:FindFirstChild(plrname).Torso:FindFirstChildOfClass("Motor6D") then
    workspace:FindFirstChild(plrname):BreakJoints()
    workspace:FindFirstChild(plrname).HumanoidRootPart.CFrame = CFrame.new(dummy.HumanoidRootPart.CFrame.X+6,dummy.HumanoidRootPart.CFrame.Y+6,dummy.HumanoidRootPart.CFrame.Z+6)
        end
    end
  
    gotoa()

    end
    Workspace.CurrentCamera.CameraType = Enum.CameraType.Track
    Workspace.CurrentCamera.CameraSubject  = dummy
    game.Players.LocalPlayer.Character = dummy



 
end

--workspace.CurrentCamera.CameraSubject = dummy.Head
num = 0
num2 = 0

--game.Players.LocalPlayer.Character = dummy



function pos(p1,p2)

end
function goto()
    for i, v in pairs(workspace[plrname]:GetDescendants()) do
        game.Players.LocalPlayer.Character = dummy
        if v:IsA("Accessory") then
            if v.Name == "ll" or v.Name == "rl" or v.Name == "tor" or v.Name == "ra" or v.Name =="la" then
                if v.Name == "ll" then
                    weld(v,dummy["Left Leg"])
                    v.Name = "used"
                end
                if v.Name == "rl" then
                    weld(v,dummy["Right Leg"])
                    v.Name = "used"
                end
                if v.Name == "tor" then
                    weld(v,dummy["Torso"])
                    v.Name = "used"
                end
                if v.Name == "ra" then
                    weld(v,dummy["Right Arm"])
                    v.Name = "used"
                end
                if v.Name == "la" then
                    weld(v,dummy["Left Arm"])
                    v.Name = "used"
                end
            else
                if v.Name ~= "used" then
                    if v.Handle:FindFirstChild("SpecialMesh") then
                        vm = "SpecialMesh"
                    else
                        vm = "Mesh"
                    end
                for i, e in pairs(dummy:GetDescendants()) do
                    if e:IsA("Accessory") and e.Name == v.Name and e.Handle[vm].MeshId == v.Handle[vm].MeshId  then
                        weld(v,e.Handle)
                        e.Handle.CanCollide = false
                        v.Name = "used"
                    end
                end
                end
            end
        end
    end
end

function gotoa() --only done once....names each body part and were it should go
    --game.Players.LocalPlayer.Character = workspace[plrname]
    repeat wait() until workspace[plrname]:FindFirstChild("Unloaded head") and workspace[plrname]:FindFirstChild("Extra Left hand (Blocky)_white") and workspace[plrname]:FindFirstChild("Front") 
    for i, v in pairs(workspace[plrname]:GetDescendants()) do
        game.Players.LocalPlayer.Character = dummy
        if v:IsA("Accessory") then 
           
                    if v.Handle:FindFirstChild("SpecialMesh") and v.Handle.SpecialMesh.MeshId == "rbxassetid://12344206657" and v.Name == "Extra Right hand (Blocky)_white" then
                       -- hat7 = v
                        v.Name = "ra"
                        print("ra")
                    end
                    if v.Handle:FindFirstChild("SpecialMesh") and v.Handle.SpecialMesh.MeshId == "rbxassetid://12344207333" and v.Name == "Extra Left hand (Blocky)_white" then
                        hat8 = v
                        v.Name = "la"
                    end
                    if v.Handle:FindFirstChild("SpecialMesh") and v.Handle.SpecialMesh.MeshId == "rbxassetid://11159370334" and v.Name == "Unloaded head" then
                        hat11 = v
                        v.Name = "ll"
                    end
                    if v.Handle:FindFirstChild("SpecialMesh") and v.Handle.SpecialMesh.MeshId == "rbxassetid://11263221350" and v.Name == "MeshPartAccessory" then
                        hat11 = v
                        v.Name = "rl"
                    end
                    if v.Handle:FindFirstChild("SpecialMesh") and v.Handle.SpecialMesh.MeshId == "rbxassetid://13778226115" and v.Name == "Front" then
                        hat11 = v
                        v.Name = "tor"
                    end
                    if v.Name ~= "used" and v.Name ~= "ra" and v.Name ~= "la" and v.Name ~= "ll" and v.Name ~= "rl" and v.Name ~= "tor" then
                        
                    end
        end
    end
    goto()
end

coroutine.wrap(scripthere)()
local runservice = game:GetService("RunService")

runservice.Stepped:Connect(function()
    if workspace:FindFirstChild(plrname):FindFirstChild("Head") then
    coroutine.wrap(reanim)()
    repeat task.wait() until workspace:FindFirstChild(plrname):FindFirstChild("HumanoidRootPart")
   -- workspace:FindFirstChild(plrname).HumanoidRootPart.Anchored = true
   workspace:FindFirstChild(plrname).HumanoidRootPart.CFrame = CFrame.new(dummy.HumanoidRootPart.CFrame.X+6,dummy.HumanoidRootPart.CFrame.Y+6,dummy.HumanoidRootPart.CFrame.Z+6)
   -- dummy .HumanoidRootPart.Anchored = true
    wait()
    end
    sethiddenproperty(ogplr, "SimulationRadius", 10000000)
    for i, v in pairs(workspace:FindFirstChild(plrname):GetDescendants()) do
        if v:IsA("BasePart") then
           v.CanCollide = false
        end
        if v:IsA("Accessory") and v:FindFirstChild("Handle") then
            v.Handle.CanCollide = false
            v.Handle.Velocity = Vector3.new(150,0,0)
        end
        if v.Name =="HumanoidRootPart" then
           v.Velocity = Vector3.new(5, 0, 0) 
           v.CanCollide = false
        end 
    end
   -- game.Players.LocalPlayer.Character = workspace[plrname]
   --  coroutine.wrap(goto)()
    -- coroutine.wrap(gotoa)()
    repeat task.wait() until workspace:FindFirstChild(plrname):FindFirstChild("HumanoidRootPart")
   -- workspace:FindFirstChild(plrname).HumanoidRootPart.Anchored = false
   -- dummy.HumanoidRootPart.Anchored = false
    workspace:FindFirstChild(plrname).HumanoidRootPart.CFrame = CFrame.new(dummy.HumanoidRootPart.CFrame.X+6,dummy.HumanoidRootPart.CFrame.Y+6,dummy.HumanoidRootPart.CFrame.Z+6)

    game.Players.LocalPlayer.Character = dummy
end)

