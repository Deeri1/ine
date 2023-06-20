_G.scripthere = function()
    game.Players.LocalPlayer.Character = game.Workspace.Dummylolxdnoo

end


loadstring(game:HttpGet("https://raw.githubusercontent.com/Deeri1/ine/main/reanimsafekeeping.txt"))()

showfakechar = 1
showrealchar = 0
player=game.Players.LocalPlayer
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

    game:GetService("RunService").Heartbeat:Connect(function()
        ve = Vector3.new(-.5, 0, 0)
        ve2 = Vector3.new(-25, 0, 0)
            templol = workspace:FindFirstChild(plrname)
            for i, v in pairs(templol:GetDescendants()) do
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
                v.Handle.Velocity = Vector3.new(.5, 0, 0)
            end
        end
    end)
    started = false
function reanim()
    if  workspace[plrname]:FindFirstChild("Animate") then
        repeat
          wait()  
        until  workspace[plrname]["Left Arm"].BrickColor.Name ~= BrickColor.new("Medium stone grey").Name
        wait()
		game.Players.LocalPlayer.ReplicationFocus = realcharee
    game.Players.LocalPlayer.Character = workspace[plrname]
    
    if  workspace[plrname]:FindFirstChild("Animate") and started == false then

        started = true
        for i, e in pairs(dummy:GetDescendants()) do
            if e:IsA("Accessory") then
                if e:FindFirstChild("usedlol") then
                    e.usedlol:Destroy()
                end
            end
        end
     --   game.Players:Chat("-gh 5168118559")
    for i, v in pairs(workspace[plrname]:GetDescendants()) do
        if v:IsA("Motor6D") then
            v:Destroy()
        end
        if v:IsA("BasePart") then
            v.CanCollide = false
        end
        if v:IsA("Accessory") then
            if v:FindFirstChild("Handle") and not dummy:FindFirstChild(v.Name) then
            for i, e in pairs(dummy:GetDescendants()) do
                if e:IsA("BasePart") or e:IsA("Part") then
                    e.CanCollide = false
                end
                if e:IsA("Accessory") then
                if v.AttachmentPoint == e.AttachmentPoint and not e:FindFirstChild("usedlol") then
                    v.Name = e.Name
                   lol2 = Instance.new("Part",e)
                   lol2.Parent = e
                    lol2.Name = "usedlol"
                 if not e.Handle:FindFirstChild("Mesh") and not e.Handle:FindFirstChild("SpecialMesh") then
                    if v.Handle:FindFirstChild("SpecialMesh") then
                        v.Handle.SpecialMesh:Destroy()
                    elseif v.Handle:FindFirstChild("Mesh") then
                        v.Handle.Mesh:Destroy()
                    end
                end
            end
                end
        end
             elseif v:FindFirstChild("Handle") and dummy:FindFirstChild(v.Name) then
             if not dummy[v.Name].Handle:FindFirstChild("Mesh") and not dummy[v.Name].Handle:FindFirstChild("SpecialMesh") then
            if v.Handle:FindFirstChild("SpecialMesh") then
                v.Handle.SpecialMesh:Destroy()
            elseif v.Handle:FindFirstChild("Mesh") then
                v.Handle.Mesh:Destroy()
            end
        end
        end 
            end
       -- wait(.1)
    
    end
    if  workspace[plrname]:FindFirstChild("Animate") then
    workspace[plrname].Animate:Destroy()
    workspace[plrname].Humanoid:Destroy()
    end
    started = false
    end
    Workspace.CurrentCamera.CameraType = Enum.CameraType.Track
    Workspace.CurrentCamera.CameraSubject  = dummy
    game.Players.LocalPlayer.Character = dummy
   end
end

--workspace.CurrentCamera.CameraSubject = dummy.Head
num = 0
num2 = 0
function gotoa()
    --game.Players.LocalPlayer.Character = workspace[plrname]
for i, v in pairs(workspace[plrname]:GetDescendants()) do
   -- Workspace.CurrentCamera.CameraSubject  = dummy
        if v:IsA("Accessory") then
            if v:FindFirstChild("Handle") and dummy:FindFirstChild(v.Name)then
            v.Handle.CFrame = dummy:FindFirstChild(v.Name).Handle.CFrame
            v.Handle.CanCollide = false
            v.Handle.Transparency = showrealchar
            dummy:FindFirstChild(v.Name).Handle.CanCollide = false
            elseif v:FindFirstChild("Handle") and not dummy:FindFirstChild(v.Name) then
            for i, e in pairs(dummy:GetDescendants()) do
                if e:IsA("Accessory") then
                if v.AttachmentPoint == e.AttachmentPoint then
                    v.Handle.CFrame = e.Handle.CFrame
                end
         end
            end
        end
    end
end
--game.Players.LocalPlayer.Character = dummy
end
function goto()
    for i, v in pairs(workspace[plrname]:GetDescendants()) do
        -- Workspace.CurrentCamera.CameraSubject  = dummy
             if v:IsA("BasePart") then
             if v.Name == "Right Arm" or v.Name == "Left Arm" or v.Name == "Right Leg" or v.Name == "Left Leg" or v.Name == "Torso" or v.Name == "Head" or v.Name == "HumanoidRootPart" then
              if v.Name == "HumanoidRootPart" then
                v.Position = dummy:FindFirstChild("Torso").Position
              else
                v.CFrame = dummy:FindFirstChild(v.Name).CFrame
              end
                v.Transparency = showrealchar
               -- print(v.Name,v.Parent)
             end
             end
            end
end
coroutine.wrap(scripthere)()
local runservice = game:GetService("RunService")

runservice.Stepped:Connect(function()
    coroutine.wrap(reanim)()
    game.Players.LocalPlayer.Character = workspace[plrname]
     coroutine.wrap(goto)()
     coroutine.wrap(gotoa)()
     game.Players.LocalPlayer.Character = dummy
end)