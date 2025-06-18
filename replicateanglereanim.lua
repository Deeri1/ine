function scripthere()


end


lplr = game.Players.LocalPlayer
local char = lplr.Character
local hrp = char:WaitForChild("HumanoidRootPart")


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

    settings().Physics.PhysicsEnvironmentalThrottle = Enum.EnviromentalPhysicsThrottle.Disabled
    settings().Physics.AllowSleep = false

    game.Players.LocalPlayer.ReplicationFocus = workspace[plrname]
    for i, v in pairs(dummy:GetDescendants()) do
        v.Archivable = true
        if v:IsA("BasePart") then
            v.Transparency = .75
            --v.CanCollide = false
        end
    end



    local runservice = game:GetService("RunService")

    runservice.Heartbeat:Connect(function()
        sethiddenproperty(char["Right Arm"].Motor6D, "ReplicatCurrentAngle6D", dummy["Right Arm"].Motor6D.C0.Angle)
        


    end)


