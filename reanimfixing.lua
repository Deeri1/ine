--hub for my reanims and its settings // stuff
----------------------------------------------------------------
--launcher
--[[hats needed for bot 14768693948,11159410305,11263254795,14768678294,14768701869 or for free bot 4819740796,4489239608,4584029953,4246228452,4324158403 -- put in needed hats to test out without buying hats
_G.scripthere = function()
    game.Players.LocalPlayer.Character = game.Workspace.Dummylolxdnoo -- ideky i need to say this but do not remove this line put your script under this but before the end
    
end
_G.neededhats = {}    -- put hats needed for script will check if hats are equipted if not they will be added each reset. use ids. exe: _G.neededhats = {4524991457,4820152700,4315489767,4794315940,4458601937,4506945409}
_G.type = "bot"       -- bot, baseplate, noprembot, spraycanbot(always put all of hats needed in _G.neededhats, works only in fencing, \ to toggle character)
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

	--running the functions now

	fmissinghats(nh)
	testgh(idlist)
	wait(.5)
	fmissinghats(nh)
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
        game:GetService("StarterGui"):SetCore("ResetButtonCallback", false) -- kills player
        task.wait(Players.RespawnTime + game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue() / 750)
        wait(1)
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
end
game.StarterGui:SetCore("SendNotification", {
	Title = "Status";
	Text = "Reanimated";
	Duration = 3;
}) 