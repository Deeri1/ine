--hub for my reanims and its settings // stuff
----------------------------------------------------------------
--launcher
--[[hats needed for bot 14768693948,11159410305,11263254795,14768678294,14768701869 -- put in needed hats to test out without buying hats
_G.scripthere = function()
    game.Players.LocalPlayer.Character = game.Workspace.Dummylolxdnoo -- ideky i need to say this but do not remove this line put your script under this but before the end
    
end
_G.neededhats = {} -- put hats needed for script will check if hats are equipted if not they will be added each reset. use ids. exe: _G.neededhats = {14768693948,11159410305,11263254795,14768678294,14768701869}
_G.type = "bot"
_G.bottype = "OG" -- OG, Freehat, Freehair
loadstring(game:HttpGet("https://raw.githubusercontent.com/Deeri1/ine/main/reanimhub.lua"))()

--lol my code not that good looking --deeri]]
----------------------------------------------------------------

--functions for the different reanims

loadstring(game:HttpGet("https://raw.githubusercontent.com/Deeri1/ine/main/reanimsafekeeping.txt"))() -- game setup lol

warn("made by deeri btw")

function botbasic(nh)


    showfakechar = 1
    showrealchar = 0
    player=game.Players.LocalPlayer
    ogplr = player
    char=player.Character
    plrname=char.Name
    realcharee = workspace:FindFirstChild(plrname)
    char.Archivable = true
    workspace.FallenPartsDestroyHeight = 0/0

       --finds the hats your missing and sets them as a hat in tempart

    

       totalmh = 0
       hataray = {}
       function fmissinghats(nh)
           for i,v in pairs(nh) do
               for i,h in pairs(workspace.tempart:GetDescendants()) do
                   if h:FindFirstChild("Mesh") then
                       if h.Mesh.TextureId == v then
                           totalmh = totalmh + 1
                           table.insert(hataray,h)
                       end
                   elseif h:FindFirstChild("SpecialMesh") then
                       if h.SpecialMesh.TextureId == v then
                           totalmh = totalmh + 1
                           table.insert(hataray,h)
                       end
                   end
               end
           end
       end
   
   
       ----------------------------------------------------------------
       --putting on missing hats :)
   
       function putonmhats(ha)
           for i,v in pairs(ha) do
               tmph = v.Parent:Clone()
               --print("cloned"..v.Parent.Name.."")
               tmph.Parent = workspace[plrname]
           end
           task.wait()
       end

       fmissinghats(nh)
       putonmhats(hataray)
       wait()
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

    settings().Physics.PhysicsEnvironmentalThrottle = Enum.EnviromentalPhysicsThrottle.Disabled
    settings().Physics.AllowSleep = false

    game.Players.LocalPlayer.ReplicationFocus = workspace[plrname]
    for i, v in pairs(dummy:GetDescendants()) do
        v.Archivable = true
        if v:IsA("BasePart") then
        v.Transparency = showfakechar
       -- v.CanCollide = false
        end
    end
    game.Players.LocalPlayer.Character = dummy

    for i, v in pairs(workspace.tempart:GetDescendants()) do
        v.Archivable = true

    end

    ----------------------------------------------------------------
    --functions for reanim
 
    ----------------------------------------------------------------
    --main CFrame Function --------------------------------

    function goto()
       pcall(function()
	  --  repeat task.wait() until workspace[plrname]:FindFirstChild("Unloaded head") and workspace[plrname]:FindFirstChild("Black") and workspace[plrname]:FindFirstChild("MeshPartAccessory") 

        for i,v in pairs(workspace[plrname]:GetDescendants()) do
            if v:IsA("Accessory") then
                v.Handle.CanCollide = false
                if v.Handle:FindFirstChild("SpecialMesh") then
                    vm = "SpecialMesh"
                else
                    vm = "Mesh"
                end
                if _G.bottype == "OG" then
                    if v.Name ~= "LARM" and v.Name ~= "RARM" and v.Name ~= "used" and v.Name ~= "Unloaded head" and v.Name ~= "Black" and v.Handle[vm].MeshId ~= "rbxassetid://11263221350" then
                    
                        for i, e in pairs(dummy:GetDescendants()) do
                            if e:IsA("BasePart") then
                            -- e.CanCollide = false
                                e.Massless = true
                            end
                            if e:IsA("Accessory") then
                                if e.Handle:FindFirstChild(vm) then
                                    if  e.Handle[vm].MeshId == v.Handle[vm].MeshId and e.Handle[vm].TextureId == v.Handle[vm].TextureId  then
                                        v.Handle.CFrame = e:findFirstChild("Handle").CFrame
                                    end
                                elseif v.Name == e.Name then
                                        v.Handle.CFrame = e:findFirstChild("Handle").CFrame
                                
                                elseif v.AttachmentPoint == e.AttachmentPoint and v.Handle.Size == e.Handle.Size then
                                        v.Handle.CFrame = e:findFirstChild("Handle").CFrame
                                end
                            end
                        end

                    elseif v.Name ~= "used" then
                        if v.Name == "LARM" then
                            v.Handle.CFrame = dummy:WaitForChild("Left Arm").CFrame * CFrame.Angles(math.rad(0),math.rad(0),math.rad(90))
                        end
                        if v.Name == "RARM" then
                            v.Handle.CFrame = dummy["Right Arm"].CFrame* CFrame.Angles(math.rad(0),math.rad(0),math.rad(90))
                        end
                        if v.Name == "MeshPartAccessory" then
                            v.Handle.CFrame = dummy["Right Leg"].CFrame* CFrame.Angles(math.rad(0),math.rad(0),math.rad(90))
                        end
                        if v.Name == "Unloaded head" then
                            v.Handle.CFrame = dummy["Left Leg"].CFrame* CFrame.Angles(math.rad(0),math.rad(0),math.rad(90))
                        end
                        if v.Name == "Black" then
                            v.Handle.CFrame = dummy["Torso"].CFrame
                        end
                    end  
                elseif _G.bottype == "Freehat" then
                    if v.Handle[vm].TextureId ~= "rbxassetid://4324138210" and v.Handle[vm].TextureId ~= "rbxassetid://4246186778" and v.Handle[vm].TextureId ~= "rbxassetid://4584026407" and v.Handle[vm].TextureId ~= "rbxassetid://4489233876" and v.Handle[vm].TextureId ~= "rbxassetid://4819722776" then 
                        for i, e in pairs(dummy:GetDescendants()) do
                            if e:IsA("BasePart") then
                            -- e.CanCollide = false
                                e.Massless = true
                            end
                            if e:IsA("Accessory") then
                                if e.Handle:FindFirstChild(vm) then
                                    if  e.Handle[vm].MeshId == v.Handle[vm].MeshId and e.Handle[vm].TextureId == v.Handle[vm].TextureId  then
                                        v.Handle.CFrame = e:findFirstChild("Handle").CFrame
                                    end
                                elseif v.Name == e.Name then
                                        v.Handle.CFrame = e:findFirstChild("Handle").CFrame
                                
                                elseif v.AttachmentPoint == e.AttachmentPoint and v.Handle.Size == e.Handle.Size then
                                        v.Handle.CFrame = e:findFirstChild("Handle").CFrame
                                end
                            end 
                        end
                    else
                        if v.Handle[vm].TextureId == "rbxassetid://4324138210" then --leftleg
                            v.Handle.CFrame = dummy["Left Leg"].CFrame* CFrame.Angles(math.rad(0),math.rad(0),math.rad(90))
                        end
                        if v.Handle[vm].TextureId == "rbxassetid://4246186778" then -- rightleg
                            v.Handle.CFrame = dummy["Right Leg"].CFrame* CFrame.Angles(math.rad(0),math.rad(0),math.rad(90))
                        end
                        if v.Handle[vm].TextureId == "rbxassetid://4584026407" then -- leftarm
                            v.Handle.CFrame = dummy:WaitForChild("Left Arm").CFrame * CFrame.Angles(math.rad(0),math.rad(0),math.rad(90))
                        end
                        if v.Handle[vm].TextureId == "rbxassetid://4489233876" then -- rightarm
                            v.Handle.CFrame = dummy["Right Arm"].CFrame* CFrame.Angles(math.rad(0),math.rad(0),math.rad(90))
                        end
                        if v.Handle[vm].TextureId == "rbxassetid://4819722776" then --torso
                            v.Handle.CFrame = dummy["Torso"].CFrame
                        end
                    end

                end
            end
        end
		end)
    end


    ----------------------------------------------------------------
    --kill body
    function reanim() --- killing player and switching to fake char
       pcall(function()
	    if workspace:FindFirstChild(plrname).Torso:FindFirstChildOfClass("Motor6D") then
            if workspace:FindFirstChild(plrname).Torso:FindFirstChildOfClass("Motor6D") then
                workspace:FindFirstChild(plrname).HumanoidRootPart.CFrame = CFrame.new(dummy.HumanoidRootPart.CFrame.X+6,dummy.HumanoidRootPart.CFrame.Y+6,dummy.HumanoidRootPart.CFrame.Z+6)
          --dummy.HumanoidRootPart.CFrame
                putonmhats(hataray)
                
        --repeat wait() until workspace:FindFirstChild(plrname):FindFirstChild("Head")
                if workspace:FindFirstChild(plrname).Torso:FindFirstChildOfClass("Motor6D") then
                    workspace:FindFirstChild(plrname):BreakJoints()
                    workspace:FindFirstChild(plrname).HumanoidRootPart.CFrame = CFrame.new(dummy.HumanoidRootPart.CFrame.X+6,dummy.HumanoidRootPart.CFrame.Y+6,dummy.HumanoidRootPart.CFrame.Z+6)
                end
				wait()

            end
        end
        Workspace.CurrentCamera.CameraType = Enum.CameraType.Track
        Workspace.CurrentCamera.CameraSubject  = dummy
        game.Players.LocalPlayer.Character = dummy
    
    
    
     end)
    end

    ----------------------------------------------------------------
    --final loop

    scripthere = _G.scripthere
    coroutine.wrap(scripthere)() -- runs script on bot :)

    local runservice = game:GetService("RunService")

    runservice.Stepped:Connect(function()
	pcall(function()
        if workspace:FindFirstChild(plrname).Torso:FindFirstChildOfClass("Motor6D") then
            repeat task.wait() until workspace:FindFirstChild(plrname):FindFirstChild("HumanoidRootPart")

            coroutine.wrap(reanim)()
        end
        goto()
       -- sethiddenproperty(ogplr, "SimulationRadius", 10000000)
        for i, v in pairs(workspace:GetDescendants()) do
            if v:IsA("Part") then
                if v.Parent~=workspace then
                    v.CanCollide = false
                end
            end
        end
		end)
    end)
    i=0
    while i<50 do
        dummy.HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
        dummy.HumanoidRootPart.RotVelocity = Vector3.new(0, 0, 0)
        wait()
        i=i+1
    end

end--the end of basic bot function


----------------------------------------------------------------
--tempart is used for holding hats to check

if workspace:FindFirstChild("tempart") then
    workspace.tempart:Destroy()
end
tempart = Instance.new("Part",workspace)
tempart.Parent = workspace
tempart.Name = "tempart"
if _G.type == "bot" then
    if _G.bottype == "OG" then
        --_G.neededhats = _G.neededhats..{14768693948,11159410305,11263254795,14768678294,14768701869}
        for i,v in pairs({14768693948,11159410305,11263254795,14768678294,14768701869}) do
            table.insert(_G.neededhats,v)
        end
    elseif  _G.bottype == "Freehat" then
        for i,v in pairs({4819740796,4489239608,4584029953,4246228452,4324158403}) do
            table.insert(_G.neededhats,v)
        end
    end
end

for i,v in pairs(_G.neededhats) do
print(v)
	pcall(function()
		lol = game:GetObjects("rbxassetid://"..v.."")[1]
   		lol.Parent = tempart
	end)
end

----------------------------------------------------------------

for i,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do

    if v:IsA("Accessory") then -- with the tempart i look at the hats inside and hats i have equiped wil be deleted from it, hats left will be converted to mesh id and sent to reanimation
        for i,e in pairs(workspace.tempart:GetDescendants()) do
            if e:IsA("Accessory") then
                if e.Handle:FindFirstChild("Mesh") then
                    if v.Handle:FindFirstChild("Mesh") then
                        if e.Handle.Mesh.MeshId == v.Handle.Mesh.MeshId and e.Handle.Mesh.TextureId == v.Handle.Mesh.TextureId then
                            e:Destroy()
                        end
                    elseif v.Handle:FindFirstChild("SpecialMesh") then
                    end
                elseif e.Handle:FindFirstChild("SpecialMesh") then
                    if v.Handle:FindFirstChild("Mesh") then            
                    elseif v.Handle:FindFirstChild("SpecialMesh") then
                    if e.Handle.SpecialMesh.MeshId == v.Handle.SpecialMesh.MeshId and e.Handle.SpecialMesh.TextureId == v.Handle.SpecialMesh.TextureId then
                        e:Destroy()
                    end   
                    end
                end
            end
        end
    end
end

----------------------------------------------------------------

neededhats = {}
for i,v in pairs(tempart:GetDescendants()) do -- clearing neededhats and setting and adding meshids to neededhats
    if v:IsA("Accessory") and v:FindFirstChild("Handle") then
    
    if v.Handle:FindFirstChild("SpecialMesh") then
        vm = "SpecialMesh"
    else
        vm = "Mesh"
    end
    table.insert(neededhats, v.Handle[vm].TextureId)
    end
end

----------------------------------------------------------------

if _G.type == "bot" then
    botbasic(neededhats)
end
