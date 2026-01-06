--hub for my reanims and its settings // stuff
----------------------------------------------------------------
--launcher
--[[hats needed for bot 14768693948,17374846953,17374851733,14768678294,14768701869 or for free bot 4819740796,4489239608,4584029953,4246228452,4324158403 -- put in needed hats to test out without buying hats
_G.scripthere = function()
    game.Players.LocalPlayer.Character = game.Workspace.Dummylolxdnoo -- ideky i need to say this but do not remove this line put your script under this but before the end
    
end
_G.neededhats = {}    -- put hats needed for script will check if hats are equipted if not they will be added each reset. use ids. exe: _G.neededhats = {4524991457,4820152700,4315489767,4794315940,4458601937,4506945409}
_G.type = "noprembot"       -- bot, baseplate, noprembot, spraycanbot(always put all of hats needed in _G.neededhats, works only in fencing, \ to toggle character)
_G.bottype = "OG"     -- OG, Freehat
_G.huboveride = nil   -- if you have a hub and use this reanim you can overide type choice if loading scripts that already have this reanim built in (prob usefull only to me lol) (when releasing scripts with this reanim this line should be removed)
_G.huboveridebt = nil -- if you have a hub and use this reanim you can overide bot type choice if loading scripts that already have this reanim built in (prob usefull only to me lol) (when releasing scripts with this reanim this line should be removed)
loadstring(game:HttpGet("https://raw.githubusercontent.com/Deeri1/ine/main/reanimhub.lua"))()
--[[costom functions
_G.fling(instance,duration) -- teleports hrp to instance for duration time. defualt duration is 2
_G.noclip(false)            -- can be set as true or false. true is noclip false is clip
]]
--lol my code not that good looking --deeri]]
----------------------------------------------------------------

--functions for the different reanims 

loadstring(game:HttpGet("https://raw.githubusercontent.com/Deeri1/ine/main/reanimsafekeeping.txt"))() -- game setup lol

warn("made by deeri btw")
game.StarterGui:SetCore("SendNotification", {
    Title = "Thanks";
    Text = "Your A Wizard "..game.Players.LocalPlayer.Name;
    Duration = 3;
})

function pdeathbaseplategame(nh)
 --vars
	local Players = game:FindFirstChildOfClass("Players")
	local RunService = game:FindFirstChildOfClass("RunService")
	--plr vars
	local Player = Players.LocalPlayer
	local plrname = Player.Name
	local Character = Player["Character"] or Player.CharacterAdded:Wait()
	local char = Character
	local Humanoid = Character:FindFirstChildWhichIsA("Humanoid")
	--Humanoid:ChangeState("Physics")
	--Humanoid.PlatformStand = true
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

	function move(p0,p1) --thanks Gelatek san
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

	--hat stuff
	--finds the hats your missing and sets them as a hat in tempart

	totalmh = 0
	hataray = {}
	idlist = {} -- holds the id of the hats that are needed 
	function fmissinghats(nh)
		for i,v in pairs(nh) do
			for i,h in pairs(workspace.tempart:GetDescendants()) do
				if h:FindFirstChild("Mesh") then
					if h.Mesh.TextureId == v then
						totalmh = totalmh + 1
						table.insert(idlist,h.Parent:GetAttribute("id"))
						table.insert(hataray,h)
					end
				elseif h:FindFirstChild("SpecialMesh") then
					if h.SpecialMesh.TextureId == v then
						totalmh = totalmh + 1
						print(h.Parent:GetAttribute("id"))
						table.insert(idlist,h.Parent:GetAttribute("id"))
						table.insert(hataray,h)
					end
				end
			end
		end
	end


	----------------------------------------------------------------
	--putting on missing hats :)
	--testing if can -gh command :)
	function testgh(ha)
	    print("fired")
		local strangofhats = "-gh "
		for i,v in ha do
			strangofhats = strangofhats..v..", "
		end
		string.sub(strangofhats,1,string.len(strangofhats)-1)
		--	print("here")
		print(strangofhats)
		local chatEvent = Instance.new("BindableEvent")
		game.StarterGui:SetCore("CoreGuiChatConnections", {ChatWindow = {MessagePosted = chatEvent}})
		-- Line above may error. Make sure to use pcall when using it and retry

		chatEvent:Fire(strangofhats)
		chatEvent:Destroy()
		wait()
	end
	function putonmhats(ha)
		for i,v in pairs(ha) do
			tmph = v.Parent:Clone()
			--print("cloned"..v.Parent.Name.."")
			tmph.Parent = workspace[plrname]
		end
		task.wait()
		tempart:Destroy()
	end
    function removedupes()
        for i,v in pairs(workspace[plrname]:GetChildren()) do
            if v:IsA("Accessory") then
                if v:WaitForChild("Handle"):FindFirstChild("Mesh") or v:WaitForChild("Handle"):FindFirstChild("SpecialMesh") then
                    for i2,v2 in pairs(workspace[plrname]:GetChildren()) do
                        if v2:IsA("Accessory") then
                            if v2:WaitForChild("Handle"):FindFirstChild("Mesh") or v2.Handle:FindFirstChild("SpecialMesh") then
                                if v.Handle.Mesh.MeshId == v2.Handle.Mesh.MeshId and v.Handle.Mesh.TextureId == v2.Handle.Mesh.TextureId then
                                    v2:Destroy()
                                elseif v.Handle.SpecialMesh.MeshId == v2.Handle.SpecialMesh.MeshId and v.Handle.SpecialMesh.TextureId == v2.Handle.SpecialMesh.TextureId then
                                    v2:Destroy()
                                end
                            end
                        end
                    end
                end
            end
        end
    end
	--running the functions now

	fmissinghats(nh)
	testgh(idlist)
	wait(.5)
	fmissinghats(nh)
   -- removedupes()
	--putonmhats(hataray)
	wait()
    tempart:Destroy()

	--dummy stuff
	--dummy clone
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
	wait(1) -- :( makes sure hats load
	dummy.Name = "Dummylolxdnoo"
	dummy.Parent = workspace

	dummy.HumanoidRootPart.Position = char.HumanoidRootPart.Position

	game.Players.LocalPlayer.ReplicationFocus = workspace[Player.Name]
	for i, v in pairs(dummy:GetDescendants()) do
		v.Archivable = true
		if v:IsA("BasePart") then
			v.Transparency = .75
			v.CanCollide = false
		end
	end

	---reanim main
	Player.ReplicationFocus = workspace
	settings()["Physics"].PhysicsEnvironmentalThrottle = Enum.EnviromentalPhysicsThrottle.Disabled
    settings().Physics.PhysicsEnvironmentalThrottle = Enum.EnviromentalPhysicsThrottle.Disabled
    settings().Physics.AllowSleep = false
	settings()["Physics"].AllowSleep = false
	settings()["Physics"].ForceCSGv2 = false
	settings()["Physics"].DisableCSGv2 = true
	settings()["Physics"].UseCSGv2 = false
    local dead = false
	task.spawn(function()
        dummy.Humanoid.BreakJointsOnDeath = false
        Players = game.Players
        char = Players.LocalPlayer.Character
        game:GetService("StarterGui"):SetCore("ResetButtonCallback", false) -- kills player
        task.wait(Players.RespawnTime + game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue() / 750)
        wait(1)
        char = Players.LocalPlayer.Character
        local Head = char:FindFirstChild("Head")
        Head:BreakJoints() 
        print("dead")
        game:GetService("StarterGui"):SetCore("ResetButtonCallback", true)
        wait(1)
        dead = true
        local chatEvent = Instance.new("BindableEvent")
        game.StarterGui:SetCore("CoreGuiChatConnections", {ChatWindow = {MessagePosted = chatEvent}})
        -- Line above may error. Make sure to use pcall when using it and retry
        wait(1)
        chatEvent:Fire("-net")
        chatEvent:Destroy()
	end)
	
	for i,v in pairs(char:GetChildren()) do -- making sure hats line up
		if v:IsA("BasePart") and v.Name ~= "HumanoidRootPart" then
			if dummy:FindFirstChild(v.Name) then
				move(v,dummy[v.Name])
			end
		elseif v:IsA("Accessory") then
			for i2,v2 in pairs(dummy:GetChildren()) do
				if v2:IsA("Accessory") and not v2:GetAttribute("used") then -- a bunch of checks lol
					if v.Handle.Size == v2.Handle.Size then
						if (v.Handle:findFirstChild("Mesh") and v2.Handle:findFirstChild("Mesh")) or (v.Handle:findFirstChild("SpecialMesh") and v2.Handle:findFirstChild("SpecialMesh")) then
							if v.Handle:findFirstChild("Mesh") then
								if v.Handle.Mesh.MeshId == v2.Handle.Mesh.MeshId and v.Handle.Mesh.TextureId == v2.Handle.Mesh.TextureId then
									move(v.Handle,v2.Handle)
									v2:SetAttribute("used", true)
                                    tnum = math.random(1,1000000)
                                    v:SetAttribute("id",tnum)
                                    v2:SetAttribute("id",tnum)
								end
							else
								if v.Handle.SpecialMesh.MeshId == v2.Handle.SpecialMesh.MeshId and v.Handle.SpecialMesh.TextureId == v2.Handle.SpecialMesh.TextureId then
									move(v.Handle,v2.Handle)
									v2:SetAttribute("used", true)
                                    tnum = math.random(1,1000000)
                                    v:SetAttribute("id",tnum)
                                    v2:SetAttribute("id",tnum)
								end
							end
						end
					end
				end
			end
		end
	end
	--char.Parent = dummy

	--velocity loop
	--[[task.spawn(function()
	RunService.PreSimulation:Connect(function()
		if not dummy:FindFirstChild("HumanoidRootPart") then
			return
		end
		Velocity = Vector3.new(dummy["HumanoidRootPart"].CFrame.LookVector.X * 85, dummy["Head"].Velocity.Y * 4, dummy["HumanoidRootPart"].CFrame.LookVector.Z * 85)
		for i,v in char:GetChildren() do
			if v:IsA("BasePart") then
				v.CanCollide = false
				if v and v.Parent then
					v.Velocity = Velocity
				end
            elseif v:IsA("Accessory") then
                if v.Handle and v.Handle:IsA("BasePart") then
                    v.Handle.CanCollide = false
                    v.Handle.Velocity = Vector3.new(30, 0, 0)
                end
			end
		end
	end)
	end)]]
	--camera stuff
    RunService.PreSimulation:Connect(function()
        for i,v in char:GetChildren() do
			if v:IsA("BasePart") then
                v.CanCollide = false
            end
        end
    end)
	local CurCameraOffset = workspace.CurrentCamera.CFrame
	workspace.CurrentCamera.CFrame = CurCameraOffset
	Player.Character = dummy
	workspace.CurrentCamera.CFrame = CurCameraOffset
	workspace.CurrentCamera.CameraSubject = dummy.Humanoid
	workspace.CurrentCamera.CFrame = CurCameraOffset

	--fling stuff
    coroutine.wrap(function()
        repeat wait() until dead
        p0 = char.HumanoidRootPart
        p1 = dummy["Right Arm"]
        local AlignPosition = Instance.new("AlignPosition"); do
            AlignPosition.MaxForce = 66666666666
            AlignPosition.RigidityEnabled = true
            AlignPosition.Responsiveness = 200
            AlignPosition.Name = "AlignPosition1"
            AlignPosition.Parent = p0
        end
        local Attachment1 = Instance.new("Attachment"); do
            Attachment1.Position = Vector3.new(0,0,0)
            Attachment1.Orientation = Vector3.new(0,0,0)
            Attachment1.Name = "Attachment1"
            Attachment1.Parent = p0
        end

        local flingatch = Instance.new("Attachment"); do
            flingatch.Parent = p1
        end

        AlignPosition.Attachment0 = Attachment1
        AlignPosition.Attachment1 = flingatch
        local ABV = Instance.new("BodyAngularVelocity")
        ABV.P = 1/0
        ABV.AngularVelocity = Vector3.new(0,0,0)
        ABV.Name = "AngularVelocity"
        ABV.Parent = char.HumanoidRootPart
        char.HumanoidRootPart.Transparency = .5
        char.HumanoidRootPart.AngularVelocity.AngularVelocity = Vector3.new(math.huge,math.huge,math.huge)

        _G.fling = function(instance,duration)
            if duration == nil then
                duration = 3
            end
            local flingatch2 = Instance.new("Attachment"); do
                flingatch2.Parent = instance
            end
            AlignPosition.Attachment1 = flingatch2
            char.HumanoidRootPart.AngularVelocity.AngularVelocity = Vector3.new(math.huge,math.huge,math.huge)
            wait(duration)
            flingatch2:Destroy()
            AlignPosition.Attachment1 = flingatch
        end

        while wait(.5) do
            for i,v in pairs(dummy:GetChildren()) do
                if v:IsA("Accessory") then
                    if not v.Handle:FindFirstChild("Mesh") and not v.Handle:FindFirstChild("SpecialMesh") then
                        for i2,v2 in pairs(char:GetChildren()) do
                            if v2:IsA("Accessory") and v2:GetAttribute("id") == v:GetAttribute("id") then
                                if v2.Handle:FindFirstChild("Mesh") then
                                    v2.Handle.Mesh:Destroy()
                                end
                                if v2.Handle:FindFirstChild("SpecialMesh") then
                                    v2.Handle.SpecialMesh:Destroy()
                                end
                            end
                        end
                    end
                end
            end
        end
    end)()

	--runs the script
	scripthere = _G.scripthere
	--wait(6)
	coroutine.wrap(scripthere)()
    repeat wait() until dead
end--end of baseplate reanim

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

    replicatesignal(game.Players.LocalPlayer.ConnectDiedSignalBackend)
    wait(game.Players.RespawnTime + .1)
    game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState(15)

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
        dummy = game.Workspace:FindFirstChild("Dummylolxdnoo")
        Workspace.CurrentCamera.CameraType = Enum.CameraType.Track
        Workspace.CurrentCamera.CameraSubject  = dummy
        game.Players.LocalPlayer.Character = dummy
	    --repeat task.wait() until workspace[plrname]:FindFirstChild("Unloaded head") and workspace[plrname]:FindFirstChild("Black") and workspace[plrname]:FindFirstChild("MeshPartAccessory") 
        task.wait()
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
                    if v.Name ~= "used" and v.Handle[vm].TextureId ~= "rbxassetid://4324138210" and v.Handle[vm].TextureId ~= "rbxassetid://4246186778" and v.Handle[vm].TextureId ~= "rbxassetid://4584026407" and v.Handle[vm].TextureId ~= "rbxassetid://4489233876" and v.Handle[vm].TextureId ~= "rbxassetid://4819722776" then 
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
                        if v.Handle[vm].TextureId == "rbxassetid://4324138210" then --leftleg
                            v.Handle.CFrame = dummy["Left Leg"].CFrame* CFrame.Angles(math.rad(0),math.rad(0),math.rad(90))
                        end
                        if v.Handle[vm].TextureId == "rbxassetid://4246186778" then -- rightleg
                            v.Handle.CFrame = dummy["Right Leg"].CFrame* CFrame.Angles(math.rad(0),math.rad(180),math.rad(90))
                        end
                        if v.Handle[vm].TextureId == "rbxassetid://4584026407" then -- leftarm
                            v.Handle.CFrame = dummy:WaitForChild("Left Arm").CFrame * CFrame.Angles(math.rad(0),math.rad(0),math.rad(90))
                        end
                        if v.Handle[vm].TextureId == "rbxassetid://4489233876" then -- rightarm
                            v.Handle.CFrame = dummy["Right Arm"].CFrame* CFrame.Angles(math.rad(0),math.rad(180),math.rad(90))
                        end
                        if v.Handle[vm].TextureId == "rbxassetid://4819722776" then --torso
                            v.Handle.CFrame = dummy["Torso"].CFrame* CFrame.Angles(math.rad(0),math.rad(0),math.rad(-15))
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
        dummy = game.Workspace:FindFirstChild("Dummylolxdnoo")
       pcall(function()
	    if workspace:FindFirstChild(plrname).Torso:FindFirstChildOfClass("Motor6D") then
            if workspace:FindFirstChild(plrname).Torso:FindFirstChildOfClass("Motor6D") then
                workspace:FindFirstChild(plrname).HumanoidRootPart.CFrame = CFrame.new(dummy.HumanoidRootPart.CFrame.X+6,dummy.HumanoidRootPart.CFrame.Y+6,dummy.HumanoidRootPart.CFrame.Z+6)
          --dummy.HumanoidRootPart.CFrame
                putonmhats(hataray)
                
        --repeat wait() until workspace:FindFirstChild(plrname):FindFirstChild("Head")
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
                if v and v.Parent~=workspace then
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

function botold(nh)


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
	    --repeat task.wait() until workspace[plrname]:FindFirstChild("Unloaded head") and workspace[plrname]:FindFirstChild("Black") and workspace[plrname]:FindFirstChild("MeshPartAccessory") 
        task.wait()
		for i,v in pairs(workspace[plrname]:GetDescendants()) do
            if v:IsA("Accessory") then
                v.Handle.CanCollide = false
                if v.Handle:FindFirstChild("SpecialMesh") then
                    vm = "SpecialMesh"
                else
                    vm = "Mesh"
                end
                if _G.bottype == "OG" then
                    if v.Name ~= "Accessory (LARM)" and v.Name ~= "Accessory (RARM)" and v.Name ~= "used" and v.Name ~= "Unloaded head" and v.Name ~= "Black" and v.Handle[vm].MeshId ~= "rbxassetid://11263221350" then
                    
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
                        if v.Name == "Accessory (RARM)" then
                            v.Handle.CFrame = dummy["Right Leg"].CFrame* CFrame.Angles(math.rad(0),math.rad(0),math.rad(90))
                        end
                        if v.Name == "Accessory (LARM)" then
                            v.Handle.CFrame = dummy["Left Leg"].CFrame* CFrame.Angles(math.rad(0),math.rad(0),math.rad(90))
                        end
                        if v.Name == "Black" then
                            v.Handle.CFrame = dummy["Torso"].CFrame
                        end
                    end  
                elseif _G.bottype == "Freehat" then
                    if v.Name ~= "used" and v.Handle[vm].TextureId ~= "rbxassetid://4324138210" and v.Handle[vm].TextureId ~= "rbxassetid://4246186778" and v.Handle[vm].TextureId ~= "rbxassetid://4584026407" and v.Handle[vm].TextureId ~= "rbxassetid://4489233876" and v.Handle[vm].TextureId ~= "rbxassetid://4819722776" then 
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
                        if v.Handle[vm].TextureId == "rbxassetid://4324138210" then --leftleg
                            v.Handle.CFrame = dummy["Left Leg"].CFrame* CFrame.Angles(math.rad(0),math.rad(0),math.rad(90))
                        end
                        if v.Handle[vm].TextureId == "rbxassetid://4246186778" then -- rightleg
                            v.Handle.CFrame = dummy["Right Leg"].CFrame* CFrame.Angles(math.rad(0),math.rad(180),math.rad(90))
                        end
                        if v.Handle[vm].TextureId == "rbxassetid://4584026407" then -- leftarm
                            v.Handle.CFrame = dummy:WaitForChild("Left Arm").CFrame * CFrame.Angles(math.rad(0),math.rad(0),math.rad(90))
                        end
                        if v.Handle[vm].TextureId == "rbxassetid://4489233876" then -- rightarm
                            v.Handle.CFrame = dummy["Right Arm"].CFrame* CFrame.Angles(math.rad(0),math.rad(180),math.rad(90))
                        end
                        if v.Handle[vm].TextureId == "rbxassetid://4819722776" then --torso
                            v.Handle.CFrame = dummy["Torso"].CFrame* CFrame.Angles(math.rad(0),math.rad(0),math.rad(-15))
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

    checked = false

    runservice.Stepped:Connect(function()
        if not workspace:FindFirstChild(plrname).Torso:FindFirstChildOfClass("Motor6D") then
            goto()
        end
        if not checked then
            checked = true
                if workspace:FindFirstChild(plrname).Torso:FindFirstChildOfClass("Motor6D") then
                    repeat task.wait() until workspace:FindFirstChild(plrname):FindFirstChild("HumanoidRootPart")
                    for i, v in pairs(workspace:GetDescendants()) do
                        if v:IsA("Part") then
                            if v and v.Parent~=workspace then
                                v.CanCollide = false
                            end
                        end
                    end
                    coroutine.wrap(reanim)()
                end
                goto()
            -- sethiddenproperty(ogplr, "SimulationRadius", 10000000)
            check = false
        end
        wait()
    end)
    i=0
    while i<50 do
        dummy.HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
        dummy.HumanoidRootPart.RotVelocity = Vector3.new(0, 0, 0)
        wait()
        i=i+1
    end

end--end of old bot function

function spraycanbot(nh)
    nh = _G.oldneededhats


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
    local pname = game.Players.LocalPlayer.Name
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
        v.Transparency = 1
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
    for i,v in game.Players[pname].Backpack:GetChildren() do
        if v and v:IsA("Tool") and v.Name == "Spray" then
            v.Parent = game.Players[pname].Character
            v.Parent = game.Players[pname].Backpack
            v.Parent = game.Players[pname].Character.Humanoid
            v.Parent = game.Players[pname].Character
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
                for q,e in game.workspace["Dummylolxdnoo"]:GetChildren() do
                    if e:IsA("Accessory") and e.Name == hatar[1].Name then
                        if e.Handle:FindFirstChild("Mesh") and hatar[1].Handle:FindFirstChild("Mesh") then
                            if e.Handle.Mesh.MeshId == hatar[1].Handle.Mesh.MeshId and e.Handle.Mesh.TextureId == hatar[1].Handle.Mesh.TextureId then
                                e.Handle.Velocity = Vector3.new(0,0,0)
                                e:SetAttribute("Used", true)
                                move(v.Handle, e.Handle)
                            end
                        elseif e.Handle:FindFirstChild("SpecialMesh") and  hatar[1].Handle:FindFirstChild("SpecialMesh") then
                            if e.Handle.SpecialMesh.MeshId == hatar[1].Handle.SpecialMesh.MeshId  and e.Handle.SpecialMesh.TextureId == hatar[1].Handle.SpecialMesh.TextureId then
                                e.Handle.Velocity = Vector3.new(0,0,0)
                                 e:SetAttribute("Used", true)
                                move(v.Handle, e.Handle)
                            end
                        end
                    end
                end

            --move(v.Handle, hatar[1].Handle)
            hatar[1]:Destroy()
            table.remove(hatar,1)
            end
            livetools[stubcount] = v.Handle
            stubcount = stubcount + 1
        end
    end
    for i,v in game.workspace["Dummylolxdnoo"]:GetChildren() do -- removes uneccesary hats
        if v:IsA("Accessory") and v:GetAttribute("Used") == nil then
            v:Destroy()
        end
    end




    local CurCameraOffset = workspace.CurrentCamera.CFrame
    workspace.CurrentCamera.CFrame = CurCameraOffset
    game.Players.LocalPlayer.Character = dummy
    workspace.CurrentCamera.CFrame = CurCameraOffset
    workspace.CurrentCamera.CameraSubject = dummy.Humanoid
    workspace.CurrentCamera.CFrame = CurCameraOffset

    remon = true
    Mouse.KeyDown:connect(function(k)
        if k == "\\" then
        print(pname)
            if remon then
                remon = false
                local CurCameraOffset = workspace.CurrentCamera.CFrame
                workspace.CurrentCamera.CFrame = CurCameraOffset
                game.Players.LocalPlayer.Character = game.Workspace[pname]
                workspace.CurrentCamera.CFrame = CurCameraOffset
                workspace.CurrentCamera.CameraSubject = game.Workspace[pname].Humanoid
                workspace.CurrentCamera.CFrame = CurCameraOffset
            else
                remon = true
                local CurCameraOffset = workspace.CurrentCamera.CFrame
                workspace.CurrentCamera.CFrame = CurCameraOffset
                game.Players.LocalPlayer.Character = dummy
                workspace.CurrentCamera.CFrame = CurCameraOffset
                workspace.CurrentCamera.CameraSubject = dummy:FindFirstChildOfClass("Humanoid")
                workspace.CurrentCamera.CFrame = CurCameraOffset
            end
        end
    end)


    scripthere = _G.scripthere
    coroutine.wrap(scripthere)()

    erd = game:GetService("RunService").PostSimulation:Connect(function()
        for i,v in pairs(livetools) do
            if v then
                v.CanCollide = false
                v.Velocity = Vector3.new(dummy["HumanoidRootPart"].CFrame.LookVector.X * 35, dummy["Head"].Velocity.Y * 4, dummy["HumanoidRootPart"].CFrame.LookVector.Z * -35)
            end
        end
    end)


end-- end of spraycan bot function

function spraycanbotnorep(nh)
    nh = _G.oldneededhats


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
    local pname = game.Players.LocalPlayer.Name
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

   -- game.Players.LocalPlayer.ReplicationFocus = workspace[Player.Name]
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
    for i,v in game.Players[pname].Backpack:GetChildren() do
        if v and v:IsA("Tool") and v.Name == "Spray" then
            v.Parent = game.Players[pname].Character
            v.Parent = game.Players[pname].Backpack
            v.Parent = game.Players[pname].Character.Humanoid
            v.Parent = game.Players[pname].Character
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
            if(hatar[1]==nil)then break end
            print("attached to "..hatar[1].Name)
                for q,e in game.workspace["Dummylolxdnoo"]:GetChildren() do
                    if e:IsA("Accessory") and e.Name == hatar[1].Name then
                        if e.Handle:FindFirstChild("Mesh") and hatar[1].Handle:FindFirstChild("Mesh") then
                            if e.Handle.Mesh.MeshId == hatar[1].Handle.Mesh.MeshId and e.Handle.Mesh.TextureId == hatar[1].Handle.Mesh.TextureId then
                                e.Handle.Velocity = Vector3.new(0,0,0)
                                e:SetAttribute("Used", true)
                                move(v.Handle, e.Handle)
                            end
                        elseif e.Handle:FindFirstChild("SpecialMesh") and  hatar[1].Handle:FindFirstChild("SpecialMesh") then
                            if e.Handle.SpecialMesh.MeshId == hatar[1].Handle.SpecialMesh.MeshId  and e.Handle.SpecialMesh.TextureId == hatar[1].Handle.SpecialMesh.TextureId then
                                e.Handle.Velocity = Vector3.new(0,0,0)
                                 e:SetAttribute("Used", true)
                                move(v.Handle, e.Handle)
                            end
                        end
                    end
                end

            --move(v.Handle, hatar[1].Handle)
            hatar[1]:Destroy()
            table.remove(hatar,1)
            end
            livetools[stubcount] = v.Handle
            stubcount = stubcount + 1
        end
    end
    for i,v in game.workspace["Dummylolxdnoo"]:GetChildren() do -- removes uneccesary hats
        if v:IsA("Accessory") and v:GetAttribute("Used") == nil then
            v:Destroy()
        end
    end




    local CurCameraOffset = workspace.CurrentCamera.CFrame
    workspace.CurrentCamera.CFrame = CurCameraOffset
    game.Players.LocalPlayer.Character = dummy
    workspace.CurrentCamera.CFrame = CurCameraOffset
    workspace.CurrentCamera.CameraSubject = dummy.Humanoid
    workspace.CurrentCamera.CFrame = CurCameraOffset

    remon = true
    Mouse.KeyDown:connect(function(k)
        if k == "\\" then
        print(pname)
            if remon then
                remon = false
                local CurCameraOffset = workspace.CurrentCamera.CFrame
                workspace.CurrentCamera.CFrame = CurCameraOffset
                game.Players.LocalPlayer.Character = game.Workspace[pname]
                workspace.CurrentCamera.CFrame = CurCameraOffset
                workspace.CurrentCamera.CameraSubject = game.Workspace[pname].Humanoid
                workspace.CurrentCamera.CFrame = CurCameraOffset
            else
                remon = true
                local CurCameraOffset = workspace.CurrentCamera.CFrame
                workspace.CurrentCamera.CFrame = CurCameraOffset
                game.Players.LocalPlayer.Character = dummy
                workspace.CurrentCamera.CFrame = CurCameraOffset
                workspace.CurrentCamera.CameraSubject = dummy:FindFirstChildOfClass("Humanoid")
                workspace.CurrentCamera.CFrame = CurCameraOffset
            end
        end
    end)


    scripthere = _G.scripthere
    coroutine.wrap(scripthere)()

    erd = game:GetService("RunService").PostSimulation:Connect(function()
        for i,v in pairs(livetools) do
            if v then
                v.CanCollide = false
                v.Velocity = Vector3.new(dummy["HumanoidRootPart"].CFrame.LookVector.X * 35, dummy["Head"].Velocity.Y * 4, dummy["HumanoidRootPart"].CFrame.LookVector.Z * -35)
            end
        end
    end)


end -- end of spraycan bot no rep function

function new26(nh)
    local Players = game:FindFirstChildOfClass("Players")
	local RunService = game:FindFirstChildOfClass("RunService")
	--plr vars
	local Player = Players.LocalPlayer
	local plrname = Player.Name
	local Character = Player["Character"] or Player.CharacterAdded:Wait()
	local char = Character
	local Humanoid = Character:FindFirstChildWhichIsA("Humanoid")
	--Humanoid:ChangeState("Physics")
	--Humanoid.PlatformStand = true
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
	--hat stuff
	--finds the hats your missing and sets them as a hat in tempart

	totalmh = 0
	hataray = {}
	idlist = {} -- holds the id of the hats that are needed 
	function fmissinghats(nh)
		for i,v in pairs(nh) do
			for i,h in pairs(workspace.tempart:GetDescendants()) do
				if h:FindFirstChild("Mesh") then
					if h.Mesh.TextureId == v then
						totalmh = totalmh + 1
						table.insert(idlist,h.Parent:GetAttribute("id"))
						table.insert(hataray,h)
					end
				elseif h:FindFirstChild("SpecialMesh") then
					if h.SpecialMesh.TextureId == v then
						totalmh = totalmh + 1
						print(h.Parent:GetAttribute("id"))
						table.insert(idlist,h.Parent:GetAttribute("id"))
						table.insert(hataray,h)
					end
				end
			end
		end
	end


	----------------------------------------------------------------
	--putting on missing hats :)
	--testing if can -gh command :)
	function testgh(ha)
	    print("fired")
		local strangofhats = "-gh "
		for i,v in ha do
			strangofhats = strangofhats..v..", "
		end
		string.sub(strangofhats,1,string.len(strangofhats)-1)
		--	print("here")
		print(strangofhats)
		local chatEvent = Instance.new("BindableEvent")
		game.StarterGui:SetCore("CoreGuiChatConnections", {ChatWindow = {MessagePosted = chatEvent}})
		-- Line above may error. Make sure to use pcall when using it and retry

		chatEvent:Fire(strangofhats)
		chatEvent:Destroy()
		wait()
	end
	function putonmhats(ha)
		for i,v in pairs(ha) do
			tmph = v.Parent:Clone()
			--print("cloned"..v.Parent.Name.."")
			tmph.Parent = workspace[plrname]
		end
		task.wait()
		tempart:Destroy()
	end
    function removedupes()
        for i,v in pairs(workspace[plrname]:GetChildren()) do
            if v:IsA("Accessory") then
                if v:WaitForChild("Handle"):FindFirstChild("Mesh") or v:WaitForChild("Handle"):FindFirstChild("SpecialMesh") then
                    for i2,v2 in pairs(workspace[plrname]:GetChildren()) do
                        if v2:IsA("Accessory") then
                            if v2:WaitForChild("Handle"):FindFirstChild("Mesh") or v2.Handle:FindFirstChild("SpecialMesh") then
                                if v.Handle.Mesh.MeshId == v2.Handle.Mesh.MeshId and v.Handle.Mesh.TextureId == v2.Handle.Mesh.TextureId then
                                    v2:Destroy()
                                elseif v.Handle.SpecialMesh.MeshId == v2.Handle.SpecialMesh.MeshId and v.Handle.SpecialMesh.TextureId == v2.Handle.SpecialMesh.TextureId then
                                    v2:Destroy()
                                end
                            end
                        end
                    end
                end
            end
        end
    end
	--running the functions now

	fmissinghats(nh)
	testgh(idlist)
	wait(.5)
	fmissinghats(nh)
   -- removedupes()
	--putonmhats(hataray)
	wait()
    tempart:Destroy()

	--dummy stuff
	--dummy clone
	for i, v in pairs(workspace:GetDescendants()) do
		if v.Name == "Dummylolxdnoo" then
			v:Destroy()
		end
	end
	char = game.Players.LocalPlayer.Character
	char.Archivable = true
    charar = {}
	for i, v in char:GetDescendants() do
		v.Archivable = true
		if v:IsA("BasePart") then
            charar[#charar+1] = v
			v.CanCollide = false
		end
	end

	dummy = char:Clone()
	wait(1) -- :( makes sure hats load
	dummy.Name = "Dummylolxdnoo"
	dummy.Parent = workspace

	dummy.HumanoidRootPart.Position = char.HumanoidRootPart.Position

	game.Players.LocalPlayer.ReplicationFocus = workspace[Player.Name]
    dumar = {}
	for i, v in pairs(dummy:GetDescendants()) do
		v.Archivable = true
		if v:IsA("BasePart") then
            dumar[#dumar+1] = v
			v.Transparency = .75
			v.CanCollide = false
		end
	end

	---reanim main
	Player.ReplicationFocus = workspace
	settings()["Physics"].PhysicsEnvironmentalThrottle = Enum.EnviromentalPhysicsThrottle.Disabled
    settings().Physics.PhysicsEnvironmentalThrottle = Enum.EnviromentalPhysicsThrottle.Disabled
    settings().Physics.AllowSleep = false
	settings()["Physics"].AllowSleep = false
	settings()["Physics"].ForceCSGv2 = false
	settings()["Physics"].DisableCSGv2 = true
	settings()["Physics"].UseCSGv2 = false

function goto()
    for i,v in pairs(charar) do
        for i2,v2 in pairs(dumar) do
            if v.Name == "Handle"  and v2.Name == "Handle" then --hat

                    if v.Name == "LARM" then
                        v.Handle.CFrame = dummy:WaitForChild("Left Arm").CFrame * CFrame.Angles(math.rad(0),math.rad(0),math.rad(90))
                    elseif v.Name == "RARM" then
                        v.Handle.CFrame = dummy["Right Arm"].CFrame* CFrame.Angles(math.rad(0),math.rad(0),math.rad(90))
                    elseif v.Name == "Accessory (RARM)" then
                        v.Handle.CFrame = dummy["Right Leg"].CFrame* CFrame.Angles(math.rad(0),math.rad(0),math.rad(90))
                    elseif v.Name == "Accessory (LARM)" then
                        v.Handle.CFrame = dummy["Left Leg"].CFrame* CFrame.Angles(math.rad(0),math.rad(0),math.rad(90))
                    elseif v.Name == "Black" then
                        v.Handle.CFrame = dummy["Torso"].CFrame

                    elseif v.MeshId == v2.MeshId and v.TextureID == v2.TextureId then --anyother hat  stuff above is bot hats
                        v.CFrame = v2.CFrame
                    end
                end  --V wont need that bc bots dont have limbs
           -- elseif v.Name == v2.Name and v.Parent == workspace[Player.Name] and v2.Parent == dummy then --body matching
            --    v.CFrame = v2.CFrame
           -- end
        end
    end
end


function reanim()
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

checked = false

runservice.Stepped:Connect(function()
    if not workspace:FindFirstChild(plrname).Torso:FindFirstChildOfClass("Motor6D") then
        goto()
    end
    if not checked then
        checked = true
        if workspace:FindFirstChild(plrname).Torso:FindFirstChildOfClass("Motor6D") then
            repeat task.wait() until workspace:FindFirstChild(plrname):FindFirstChild("HumanoidRootPart")
            coroutine.wrap(reanim)()
        end
        goto()
        check = false
    end
    wait()
end)

end --newbot ermm





----------------------------------------------------------------
--tempart is used for holding hats to check

if workspace:FindFirstChild("tempart") then
    workspace.tempart:Destroy()
end
tempart = Instance.new("Part",workspace)
tempart.Parent = workspace
tempart.Name = "tempart"
if _G.huboveride ~= nil then
    _G.type = _G.huboveride
end
if _G.type == "bot" or _G.type == "noprembot" then
    if _G.bottype == "OG" then
        --_G.neededhats = _G.neededhats..{14768693948,11159410305,11263254795,14768678294,14768701869}
    for i,v in pairs({14768693948,17374846953,17374851733,14768678294,14768701869}) do
            table.insert(_G.neededhats,v)
        end
    elseif  _G.bottype == "Freehat" then
        for i,v in pairs({4819740796,4489239608,4584029953,4246228452,4324158403}) do
            table.insert(_G.neededhats,v)
        end
    end
end

for i,v in pairs(_G.neededhats) do
    --print(v)
	pcall(function()
		lol = game:GetObjects("rbxassetid://"..v.."")[1]
   		lol.Parent = tempart
		lol:SetAttribute("id", v)
		print(lol:GetAttribute("id"))
	end)
end
wait(.5)
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
_G.oldneededhats = _G.neededhats
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
    if _G.huboveridebt ~= nil then
        _G.bottype = _G.huboveridebt
    end
    botbasic(neededhats)
elseif _G.type == "noprembot" then
        if _G.huboveridebt ~= nil then
        _G.bottype = _G.huboveridebt
    end
    botold(neededhats)
elseif _G.type == "baseplate" then
    pdeathbaseplategame(neededhats)
elseif _G.type == "spraycanbot" then
    spraycanbot(neededhats)
elseif _G.type == "spraycanbot2" then
    spraycanbotnorep(neededhats)
elseif _G.type == "beta" then
    new26(neededhats)
end
game.StarterGui:SetCore("SendNotification", {
	Title = "Status";
	Text = "Reanimated";
	Duration = 3;
}) 