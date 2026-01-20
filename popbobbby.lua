---gh 4684153723,8626032689 (optional hats)

local plr = game.Players.LocalPlayer
local char = game.Players.LocalPlayer.Character


hats = {
    "Hat1",
    "LavanderHair",
    "BrownCharmerHair",
    "Pal Hair",
    "Kate Hair"
}
parts = {} 

for i,v in pairs(hats) do 
    char[tostring(v)].Handle.Mesh:Destroy()
end 

game.Players.LocalPlayer.Character["RockAccessory"].Handle.SpecialMesh:Destroy()

coroutine.resume(coroutine.create(function()
    wait(3)
    
    local plr = game.Players.LocalPlayer
local char = game.Players.LocalPlayer.Character

-- -gh 62234425, 451220849, 376548738, 63690008, 62724852, 5168118559
_G.shooted = false 


hats = {
    "Hat1",
    "LavanderHair",
    "BrownCharmerHair",
    "Pal Hair",
    "Kate Hair"
}
parts = {} 
for i = 1,5 do 
    local part = Instance.new("Part",workspace)
    part.Size = Vector3.new(1,1,1)
    part.CanCollide = false 
    part.Anchored = true
    parts[i] = part 
end 

local ball = Instance.new("Part", workspace)


function attachhat(hat,limb, Postion, Orientation)
    
    print(hat,limb, Postion, Orientation)
    local plr = game.Players.LocalPlayer;
    local chr = plr.Character;
    local hum = chr.Humanoid;
    local hat5 = hat;


    hat5.Handle:BreakJoints();

    local ap = Instance.new('AlignPosition', hat5.Handle);
    local ao = Instance.new('AlignOrientation', hat5.Handle);

    ao.MaxAngularVelocity = math.huge;
    ao.MaxTorque = 1000000;
    ao.RigidityEnabled = false;
    ao.Responsiveness = 200;

    ap.MaxForce = 1000000;
    ap.MaxVelocity = math.huge;
    ap.RigidityEnabled = false;
    ap.ApplyAtCenterOfMass = true;
    ap.Responsiveness = 200;

    local a1 = Instance.new('Attachment', limb);
    local a0 = Instance.new('Attachment', hat5.Handle);

    ap.Attachment0 = a0;
    ap.Attachment1 = a1;
    ao.Attachment0 = a0;
    ao.Attachment1 = a1;

    a1.Position = Postion
    a1.Orientation = Orientation;

    game:GetService("RunService").Heartbeat:Connect(
            function()
                hat5.Handle.Velocity = Vector3.new(-25.05, 0, -25.05)

            end
        )
        
    return a1
end 
--game.Players.LocalPlayer.Character["RockAccessory"].Handle.SpecialMesh:Destroy()

for i,v in pairs(hats) do 
   -- char[tostring(v)].Handle.Mesh:Destroy()
    attachhat(char[tostring(v)],parts[i], Vector3.new(0,0,0), Vector3.new(0,0,0))
end 
attachhat(game.Players.LocalPlayer.Character["RockAccessory"],ball, Vector3.new(0,0,0), Vector3.new(0,0,0))

--ball.Shape = Enum.PartType.Ball 

function explode(pos)
    
    
    for i,v in pairs(parts) do
        local part = v
        local TweenService = game:GetService("TweenService")
    
    
        local pos2 = pos - Vector3.new(0,3,0)
        local rot = Vector3.new(math.random(-180,180),math.random(-180,180),math.random(-180,180))
        part.Position = pos2
        part.Orientation = rot
        local newpos = pos + Vector3.new(math.random(-5,5), math.random(6,10),math.random(-5,5))
        
        local goal = {}
        goal.Position = newpos
        goal.Orientation = rot
        
        coroutine.resume(coroutine.create(function()

            local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Cubic)

        local tween = TweenService:Create(part, tweenInfo, goal)
        tween:Play()
        
        local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Cubic)

        local tween = TweenService:Create(part, tweenInfo, {Position = pos2, Orientation = Vector3.new(0,0,0)})
        
        wait(1.1)
            tween:Play()
            end))
        
        
    end
end


coroutine.resume(coroutine.create(function()
    while true do 
        task.wait()
        
        if _G.shooted == false then 
            ball.Position = char["Right Arm"].Position  - Vector3.new(0,5,0)
            ball.CanCollide = false 
            ball.Anchored = true
        end 
        
    end 
end ))

coroutine.resume(coroutine.create(function()
    while true do 
        task.wait()
        
       ball.Orientation = ball.Orientation + Vector3.new(50,50,50)
        
    end 
end ))


local mouse = plr:GetMouse()
local once = false 

mouse.Button1Down:Connect(function()
    if _G.A == false then 
    _G.shooted = true
    ball.Anchored = false 
    ball.CanCollide = true
     if once == false then 
        once = true 
        ball.Position = char["Right Arm"].Position + Vector3.new(0,1,0)
        else 
            ball.Position = char["Right Arm"].Position + Vector3.new(0,
                2.5,0)
    end 
    
    ball.CanCollide = true 
    ball.Size = Vector3.new(1,1,1)
    local rot = Instance.new("BodyGyro", ball)
    rot.MaxTorque = Vector3.new(0,0,0)
    coroutine.resume(coroutine.create(function()
        while wait() do 
            rot.CFrame = rot.CFrame * CFrame.Angles(0,math.rad(45),0)
        end
    end))
    local t = mouse.Hit.p
    local d = t- char.Torso.Position 
    
    print((t - d).Magnitude)
    local force = d + Vector3.new(0,game.Workspace.Gravity *0.2,0)
    ball.AssemblyLinearVelocity = force
    --ball:ApplyImpulse(force * ball.AssemblyMass)
    local touched = false 
    wait(0.1)
    ball.Touched:Connect(function()
        
        if touched == false then 
            touched = true 
            print("TOUCHED")
            explode(ball.Position)
            ball.CanCollide = false
            wait(0.1)
            _G.shooted = false
            ball.Anchored = true 
            
        end
    end)
    
    

    print(t)

    end 
    
end)

end))



-- -gh 62234425, 451220849, 376548738, 63690008, 62724852, 4623059912
_G.shooted = false 


hats = {
    "Hat1",
    "LavanderHair",
    "BrownCharmerHair",
    "Pal Hair",
    "Kate Hair"
}

local Vector3_101 = Vector3.new(25, 0, 25)
local netless_Y = Vector3.new(0, 25.1, 0)
local function getNetlessVelocity(realPartVelocity) --edit this if you have a better netless method
	local netlessVelocity = realPartVelocity * Vector3_101
	local mag = netlessVelocity.Magnitude
	if mag > 0.1 then
		netlessVelocity *= 100 / mag
	end
	netlessVelocity += netless_Y
	return netlessVelocity
end
local simradius = "shp" --simulation radius (net bypass) method
local antiragdoll = true --removes hingeConstraints and ballSocketConstraints from your character
local newanimate = true --disables the animate script and enables after reanimation
local discharscripts = true --disables all localScripts parented to your character before reanimation
local R15toR6 = true --tries to convert your character to r6 if its r15
local humState16 = false --enables collisions for limbs before the humanoid dies (using hum:ChangeState)
local addtools = false --puts all tools from backpack to character and lets you hold them after reanimation
local hedafterneck = true --disable aligns for head and enable after neck is removed
local loadtime = game:GetService("Players").RespawnTime + 0.5 --anti respawn delay
local method = 3 --reanimation method
local alignmode = 2 --AlignPosition mode
local lp = game:GetService("Players").LocalPlayer
local rs = game:GetService("RunService")
local stepped = rs.Stepped
local heartbeat = rs.Heartbeat
local renderstepped = rs.RenderStepped
local sg = game:GetService("StarterGui")
local ws = game:GetService("Workspace")
local cf = CFrame.new
local v3 = Vector3.new
local v3_0 = v3(0, 0, 0)
local inf = math.huge
local c = lp.Character
if not (c and c.Parent) then
	return
end
c.Destroying:Connect(function()
	c = nil
end)
local function gp(parent, name, className)
	if typeof(parent) == "Instance" then
		for i, v in pairs(parent:GetChildren()) do
			if (v.Name == name) and v:IsA(className) then
				return v
			end
		end
	end
	return nil
end
local function align(Part0, Part1)
	Part0.CustomPhysicalProperties = PhysicalProperties.new(0.0001, 0.0001, 0.0001, 0.0001, 0.0001)

	local att0 = Instance.new("Attachment", Part0)
	att0.Orientation = v3_0
	att0.Position = v3_0
	att0.Name = "att0_" .. Part0.Name
	local att1 = Instance.new("Attachment", Part1)
	att1.Orientation = v3_0
	att1.Position = v3_0
	att1.Name = "att1_" .. Part1.Name
	if (alignmode == 1) or (alignmode == 2) then
		local ape = Instance.new("AlignPosition", att0)
		ape.ApplyAtCenterOfMass = false
		ape.MaxForce = inf
		ape.MaxVelocity = inf
		ape.ReactionForceEnabled = false
		ape.Responsiveness = 200
		ape.Attachment1 = att1
		ape.Attachment0 = att0
		ape.Name = "AlignPositionRtrue"
		ape.RigidityEnabled = true
	end
	if (alignmode == 2) or (alignmode == 3) then
		local apd = Instance.new("AlignPosition", att0)
		apd.ApplyAtCenterOfMass = false
		apd.MaxForce = inf
		apd.MaxVelocity = inf
		apd.ReactionForceEnabled = false
		apd.Responsiveness = 200
		apd.Attachment1 = att1
		apd.Attachment0 = att0
		apd.Name = "AlignPositionRfalse"
		apd.RigidityEnabled = false
	end
	local ao = Instance.new("AlignOrientation", att0)
	ao.MaxAngularVelocity = inf
	ao.MaxTorque = inf
	ao.PrimaryAxisOnly = false
	ao.ReactionTorqueEnabled = false
	ao.Responsiveness = 200
	ao.Attachment1 = att1
	ao.Attachment0 = att0
	ao.RigidityEnabled = false
	if type(getNetlessVelocity) == "function" then
		local realVelocity = v3_0
		local steppedcon = stepped:Connect(function()
			Part0.Velocity = realVelocity
		end)
		local heartbeatcon = heartbeat:Connect(function()
			realVelocity = Part0.Velocity
			Part0.Velocity = getNetlessVelocity(realVelocity)
		end)
		Part0.Destroying:Connect(function()
			Part0 = nil
			steppedcon:Disconnect()
			heartbeatcon:Disconnect()
		end)
	end
end

local function respawnrequest()
	local ccfr = ws.CurrentCamera.CFrame
	local c = lp.Character
	lp.Character = nil
	lp.Character = c
	local con = nil
	con = ws.CurrentCamera.Changed:Connect(function(prop)
		if (prop ~= "Parent") and (prop ~= "CFrame") then
			return
		end
		ws.CurrentCamera.CFrame = ccfr
		con:Disconnect()
	end)
end

local destroyhum = (method == 4) or (method == 5)
local breakjoints = (method == 0) or (method == 4)
local antirespawn = (method == 0) or (method == 2) or (method == 3)

hatcollide = hatcollide and (method == 0)

addtools = addtools and gp(lp, "Backpack", "Backpack")

local fenv = getfenv()
local shp = fenv.sethiddenproperty or fenv.set_hidden_property or fenv.set_hidden_prop or fenv.sethiddenprop
local ssr = fenv.setsimulationradius or fenv.set_simulation_radius or fenv.set_sim_radius or fenv.setsimradius or fenv.set_simulation_rad or fenv.setsimulationrad

if shp and (simradius == "shp") then
	spawn(function()
		while c and heartbeat:Wait() do
			shp(lp, "SimulationRadius", inf)
		end
	end)
elseif ssr and (simradius == "ssr") then
	spawn(function()
		while c and heartbeat:Wait() do
			ssr(inf)
		end
	end)
end

antiragdoll = antiragdoll and function(v)
	if v:IsA("HingeConstraint") or v:IsA("BallSocketConstraint") then
		v.Parent = nil
	end
end

if antiragdoll then
	for i, v in pairs(c:GetDescendants()) do
		antiragdoll(v)
	end
	c.DescendantAdded:Connect(antiragdoll)
end

if antirespawn then
	respawnrequest()
end

if method == 0 then
	wait(loadtime)
	if not c then
		return
	end
end

if discharscripts then
	for i, v in pairs(c:GetChildren()) do
		if v:IsA("LocalScript") then
			v.Disabled = true
		end
	end
elseif newanimate then
	local animate = gp(c, "Animate", "LocalScript")
	if animate and (not animate.Disabled) then
		animate.Disabled = true
	else
		newanimate = false
	end
end

if addtools then
	for i, v in pairs(addtools:GetChildren()) do
		if v:IsA("Tool") then
			v.Parent = c
		end
	end
end

pcall(function()
	settings().Physics.AllowSleep = false
	settings().Physics.PhysicsEnvironmentalThrottle = Enum.EnviromentalPhysicsThrottle.Disabled
end)

local OLDscripts = {}

for i, v in pairs(c:GetDescendants()) do
	if v.ClassName == "Script" then
		table.insert(OLDscripts, v)
	end
end

local scriptNames = {}

for i, v in pairs(c:GetDescendants()) do
	if v:IsA("BasePart") then
		local newName = tostring(i)
		local exists = true
		while exists do
			exists = false
			for i, v in pairs(OLDscripts) do
				if v.Name == newName then
					exists = true
				end
			end
			if exists then
				newName = newName .. "_"    
			end
		end
		table.insert(scriptNames, newName)
		Instance.new("Script", v).Name = newName
	end
end

c.Archivable = true
local hum = c:FindFirstChildOfClass("Humanoid")
if hum then
	for i, v in pairs(hum:GetPlayingAnimationTracks()) do
		v:Stop()
	end
end
local cl = c:Clone()
if hum and humState16 then
	hum:ChangeState(Enum.HumanoidStateType.Physics)
	if destroyhum then
		wait(1.6)
	end
end
if hum and hum.Parent and destroyhum then
	hum:Destroy()
end

if not c then
	return
end

local head = gp(c, "Head", "BasePart")
local torso = gp(c, "Torso", "BasePart") or gp(c, "UpperTorso", "BasePart")
local root = gp(c, "HumanoidRootPart", "BasePart")
if hatcollide and c:FindFirstChildOfClass("Accessory") then
	local anything = c:FindFirstChildOfClass("BodyColors") or gp(c, "Health", "Script")
	if not (torso and root and anything) then
		return
	end
	torso:Destroy()
	root:Destroy()
	if shp then
		for i,v in pairs(c:GetChildren()) do
			if v:IsA("Accessory") then
				shp(v, "BackendAccoutrementState", 0)
			end 
		end
	end
	anything:Destroy()
end

for i, v in pairs(cl:GetDescendants()) do
	if v:IsA("BasePart") then
		v.Transparency = 1
		v.Anchored = false
	end
end

local model = Instance.new("Model", c)
model.Name = model.ClassName

model.Destroying:Connect(function()
	model = nil
end)

for i, v in pairs(c:GetChildren()) do
	if v ~= model then
		if addtools and v:IsA("Tool") then
			for i1, v1 in pairs(v:GetDescendants()) do
				if v1 and v1.Parent and v1:IsA("BasePart") then
					local bv = Instance.new("BodyVelocity", v1)
					bv.Velocity = v3_0
					bv.MaxForce = v3(1000, 1000, 1000)
					bv.P = 1250
					bv.Name = "bv_" .. v.Name
				end
			end
		end
		v.Parent = model
	end
end

if breakjoints then
	model:BreakJoints()
else
	if head and torso then
		for i, v in pairs(model:GetDescendants()) do
			if v:IsA("Weld") or v:IsA("Snap") or v:IsA("Glue") or v:IsA("Motor") or v:IsA("Motor6D") then
				local save = false
				if (v.Part0 == torso) and (v.Part1 == head) then
					save = true
				end
				if (v.Part0 == head) and (v.Part1 == torso) then
					save = true
				end
				if save then
					if hedafterneck then
						hedafterneck = v
					end
				else
					v:Destroy()
				end
			end
		end
	end
	if method == 3 then
		spawn(function()
			wait(loadtime)
			if model then
				model:BreakJoints()
			end
		end)
	end
end

cl.Parent = c
for i, v in pairs(cl:GetChildren()) do
	v.Parent = c
end
cl:Destroy()

local modelDes = {}
for i, v in pairs(model:GetDescendants()) do
	if v:IsA("BasePart") then
		i = tostring(i)
		v.Destroying:Connect(function()
			modelDes[i] = nil
		end)
		modelDes[i] = v
	end
end
local modelcolcon = nil
local function modelcolf()
	if model then
		for i, v in pairs(modelDes) do
			v.CanCollide = false
		end
	else
		modelcolcon:Disconnect()
	end
end
modelcolcon = stepped:Connect(modelcolf)
modelcolf()

for i, scr in pairs(model:GetDescendants()) do
	if (scr.ClassName == "Script") and table.find(scriptNames, scr.Name) then
		local Part0 = scr.Parent
		if Part0:IsA("BasePart") then
			for i1, scr1 in pairs(c:GetDescendants()) do
				if (scr1.ClassName == "Script") and (scr1.Name == scr.Name) and (not scr1:IsDescendantOf(model)) then
					local Part1 = scr1.Parent
					if (Part1.ClassName == Part0.ClassName) and (Part1.Name == Part0.Name) then
						align(Part0, Part1)
						break
					end
				end
			end
		end
	end
end

if (typeof(hedafterneck) == "Instance") and head then
	local aligns = {}
	local con = nil
	con = hedafterneck.Changed:Connect(function(prop)
		if (prop == "Parent") and not hedafterneck.Parent then
			con:Disconnect()
			for i, v in pairs(aligns) do
				v.Enabled = true
			end
		end
	end)
	for i, v in pairs(head:GetDescendants()) do
		if v:IsA("AlignPosition") or v:IsA("AlignOrientation") then
			i = tostring(i)
			aligns[i] = v
			v.Destroying:Connect(function()
				aligns[i] = nil
			end)
			v.Enabled = false
		end
	end
end

for i, v in pairs(c:GetDescendants()) do
	if v and v.Parent then
		if v.ClassName == "Script" then
			if table.find(scriptNames, v.Name) then
				v:Destroy()
			end
		elseif not v:IsDescendantOf(model) then
			if v:IsA("Decal") then
				v.Transparency = 1
			elseif v:IsA("ForceField") then
				v.Visible = false
			elseif v:IsA("Sound") then
				v.Playing = false
			elseif v:IsA("BillboardGui") or v:IsA("SurfaceGui") or v:IsA("ParticleEmitter") or v:IsA("Fire") or v:IsA("Smoke") or v:IsA("Sparkles") then
				v.Enabled = false
			end
		end
	end
end

if newanimate then
	local animate = gp(c, "Animate", "LocalScript")
	if animate then
		animate.Disabled = false
	end
end

if addtools then
	for i, v in pairs(c:GetChildren()) do
		if v:IsA("Tool") then
			v.Parent = addtools
		end
	end
end

local hum0 = model:FindFirstChildOfClass("Humanoid")
if hum0 then
	hum0.Destroying:Connect(function()
		hum0 = nil
	end)
end

local hum1 = c:FindFirstChildOfClass("Humanoid")
if hum1 then
	hum1.Destroying:Connect(function()
		hum1 = nil
	end)
end

if hum1 then
	ws.CurrentCamera.CameraSubject = hum1
	local camSubCon = nil
	local function camSubFunc()
		camSubCon:Disconnect()
		if c and hum1 then
			ws.CurrentCamera.CameraSubject = hum1
		end
	end
	camSubCon = renderstepped:Connect(camSubFunc)
	if hum0 then
		hum0.Changed:Connect(function(prop)
			if hum1 and (prop == "Jump") then
				hum1.Jump = hum0.Jump
			end
		end)
	else
		respawnrequest()
	end
end

local rb = Instance.new("BindableEvent", c)
rb.Event:Connect(function()
	rb:Destroy()
	sg:SetCore("ResetButtonCallback", true)
	if destroyhum then
		c:BreakJoints()
		return
	end
	if hum0 and (hum0.Health > 0) then
		model:BreakJoints()
		hum0.Health = 0
	end
	if antirespawn then
		respawnrequest()
	end
end)
sg:SetCore("ResetButtonCallback", rb)

spawn(function()
	while c do
		if hum0 and hum1 then
			hum1.Jump = hum0.Jump
		end
		wait()
	end
	sg:SetCore("ResetButtonCallback", true)
end)

R15toR6 = R15toR6 and hum1 and (hum1.RigType == Enum.HumanoidRigType.R15)
if R15toR6 then
	local part = gp(c, "HumanoidRootPart", "BasePart") or gp(c, "UpperTorso", "BasePart") or gp(c, "LowerTorso", "BasePart") or gp(c, "Head", "BasePart") or c:FindFirstChildWhichIsA("BasePart")
	if part then
		local cfr = part.CFrame
		local R6parts = { 
			head = {
				Name = "Head",
				Size = v3(2, 1, 1),
				R15 = {
					Head = 0
				}
			},
			torso = {
				Name = "Torso",
				Size = v3(2, 2, 1),
				R15 = {
					UpperTorso = 0.2,
					LowerTorso = -0.8
				}
			},
			root = {
				Name = "HumanoidRootPart",
				Size = v3(2, 2, 1),
				R15 = {
					HumanoidRootPart = 0
				}
			},
			leftArm = {
				Name = "Left Arm",
				Size = v3(1, 2, 1),
				R15 = {
					LeftHand = -0.85,
					LeftLowerArm = -0.2,
					LeftUpperArm = 0.4
				}
			},
			rightArm = {
				Name = "Right Arm",
				Size = v3(1, 2, 1),
				R15 = {
					RightHand = -0.85,
					RightLowerArm = -0.2,
					RightUpperArm = 0.4
				}
			},
			leftLeg = {
				Name = "Left Leg",
				Size = v3(1, 2, 1),
				R15 = {
					LeftFoot = -0.85,
					LeftLowerLeg = -0.15,
					LeftUpperLeg = 0.6
				}
			},
			rightLeg = {
				Name = "Right Leg",
				Size = v3(1, 2, 1),
				R15 = {
					RightFoot = -0.85,
					RightLowerLeg = -0.15,
					RightUpperLeg = 0.6
				}
			}
		}
		for i, v in pairs(c:GetChildren()) do
			if v:IsA("BasePart") then
				for i1, v1 in pairs(v:GetChildren()) do
					if v1:IsA("Motor6D") then
						v1.Part0 = nil
					end
				end
			end
		end
		part.Archivable = true
		for i, v in pairs(R6parts) do
			local part = part:Clone()
			part:ClearAllChildren()
			part.Name = v.Name
			part.Size = v.Size
			part.CFrame = cfr
			part.Anchored = false
			part.Transparency = 1
			part.CanCollide = false
			for i1, v1 in pairs(v.R15) do
				local R15part = gp(c, i1, "BasePart")
				local att = gp(R15part, "att1_" .. i1, "Attachment")
				if R15part then
					local weld = Instance.new("Weld", R15part)
					weld.Name = "Weld_" .. i1
					weld.Part0 = part
					weld.Part1 = R15part
					weld.C0 = cf(0, v1, 0)
					weld.C1 = cf(0, 0, 0)
					R15part.Massless = true
					R15part.Name = "R15_" .. i1
					R15part.Parent = part
					if att then
						att.Parent = part
						att.Position = v3(0, v1, 0)
					end
				end
			end
			part.Parent = c
			R6parts[i] = part
		end
		local R6joints = {
			neck = {
				Parent = R6parts.torso,
				Name = "Neck",
				Part0 = R6parts.torso,
				Part1 = R6parts.head,
				C0 = cf(0, 1, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0),
				C1 = cf(0, -0.5, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0)
			},
			rootJoint = {
				Parent = R6parts.root,
				Name = "RootJoint" ,
				Part0 = R6parts.root,
				Part1 = R6parts.torso,
				C0 = cf(0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0),
				C1 = cf(0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0)
			},
			rightShoulder = {
				Parent = R6parts.torso,
				Name = "Right Shoulder",
				Part0 = R6parts.torso,
				Part1 = R6parts.rightArm,
				C0 = cf(1, 0.5, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0),
				C1 = cf(-0.5, 0.5, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0)
			},
			leftShoulder = {
				Parent = R6parts.torso,
				Name = "Left Shoulder",
				Part0 = R6parts.torso,
				Part1 = R6parts.leftArm,
				C0 = cf(-1, 0.5, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0),
				C1 = cf(0.5, 0.5, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
			},
			rightHip = {
				Parent = R6parts.torso,
				Name = "Right Hip",
				Part0 = R6parts.torso,
				Part1 = R6parts.rightLeg,
				C0 = cf(1, -1, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0),
				C1 = cf(0.5, 1, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0)
			},
			leftHip = {
				Parent = R6parts.torso,
				Name = "Left Hip" ,
				Part0 = R6parts.torso,
				Part1 = R6parts.leftLeg,
				C0 = cf(-1, -1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0),
				C1 = cf(-0.5, 1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
			}
		}
		for i, v in pairs(R6joints) do
			local joint = Instance.new("Motor6D")
			for prop, val in pairs(v) do
				joint[prop] = val
			end
			R6joints[i] = joint
		end
		hum1.RigType = Enum.HumanoidRigType.R6
		hum1.HipHeight = 0
	end
end
local headmove = true
change = .85
movement = 12
mode = 1
Player = game:GetService("Players").LocalPlayer
PlayerGui = Player.PlayerGui
Cam = workspace.CurrentCamera
Backpack = Player.Backpack
Character = Player.Character
Humanoid = Character:FindFirstChildOfClass("Humanoid")
Mouse = Player:GetMouse()
RootPart = Character["HumanoidRootPart"]
Torso = Character["Torso"]
Head = Character["Head"]
RightArm = Character["Right Arm"]
LeftArm = Character["Left Arm"]
RightLeg = Character["Right Leg"]
LeftLeg = Character["Left Leg"]
RootJoint = RootPart["RootJoint"]
Neck = Torso["Neck"]
RightShoulder = Torso["Right Shoulder"]
LeftShoulder = Torso["Left Shoulder"]
RightHip = Torso["Right Hip"]
LeftHip = Torso["Left Hip"]
IT = Instance.new
CF = CFrame.new
VT = Vector3.new
RAD = math.rad
C3 = Color3.new
UD2 = UDim2.new
BRICKC = BrickColor.new
ANGLES = CFrame.Angles
EULER = CFrame.fromEulerAnglesXYZ
COS = math.cos
ACOS = math.acos
SIN = math.sin
ASIN = math.asin
ABS = math.abs
MRANDOM = math.random
FLOOR = math.floor
Animation_Speed = 3
Frame_Speed = 1 / 60
local Speed = 26
local SIZE = 1
local ROOTC0 = CF(0, 0, 0) * ANGLES(RAD(-90), RAD(0), RAD(180))
local NECKC0 = CF(0, 1, 0) * ANGLES(RAD(-90), RAD(0), RAD(180))
local RIGHTSHOULDERC0 = CF(-.5, 0, 0) * ANGLES(RAD(0), RAD(90), RAD(0))
local LEFTSHOULDERC0 = CF(.5, 0, 0) * ANGLES(RAD(0), RAD(-90), RAD(0))
local ANIM = "Idle"
local ATTACK = false

coroutine.resume(coroutine.create(function()
    _G.A = ATTACK
end ))
local COMBO = 1
local Rooted = false
local SINE = 0
local CHANGE = 2 / Animation_Speed
local ROBLOXIDLEANIMATION = IT("Animation")
local ANIMATOR = Humanoid.Animator
local ANIMATE = Character.Animate
local UNANCHOR = true
local KILLCOUNT = 0
ArtificialHB = Instance.new("BindableEvent", script)
ArtificialHB.Name = "ArtificialHB"
script:WaitForChild("ArtificialHB")
frame = Frame_Speed
tf = 0
allowframeloss = false
tossremainder = false
lastframe = tick()
script.ArtificialHB:Fire()
game:GetService("RunService").Heartbeat:connect(function(s, p)
	tf = tf + s
	if tf >= frame then
		if allowframeloss then
			script.ArtificialHB:Fire()
			lastframe = tick()
		else
			for i = 1, math.floor(tf / frame) do
				script.ArtificialHB:Fire()
			end
			lastframe = tick()
		end
		if tossremainder then
			tf = 0
		else
			tf = tf - frame * math.floor(tf / frame)
		end
	end
end)
function Raycast(POSITION, DIRECTION, RANGE, IGNOREDECENDANTS)
	return workspace:FindPartOnRay(Ray.new(POSITION, DIRECTION.unit * RANGE), IGNOREDECENDANTS)
end
function PositiveAngle(NUMBER)
	if NUMBER >= 0 then
		NUMBER = 0
	end
	return NUMBER
end
function NegativeAngle(NUMBER)
	if NUMBER <= 0 then
		NUMBER = 0
	end
	return NUMBER
end
function Swait(NUMBER)
	if NUMBER == 0 or NUMBER == nil then
		ArtificialHB.Event:wait()
	else
		for i = 1, NUMBER do
			ArtificialHB.Event:wait()
		end
	end
end

local __________ = {}
for _,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
    if v:IsA("Accessory") then
		if v.Name == "MeshPartAccessory" then
				table.insert(__________, v)
		end
	end
end
local ___________ = Instance.new("Part", workspace)
___________.Transparency = 1
___________.CanCollide = false
___________.Anchored = true
for i,v in pairs(__________) do 
    
    v.Handle["att1_Handle"].CFrame = CFrame.new(0, 2.20000005, 0, 0.707106829, 0.707106829, 3.09086232e-08, 0, -4.37113918e-08, 1.00000012, 0.707106829, -0.707106829, -3.09086232e-08)
end

for i = 1,#__________ do
	local hat = __________[i]
	hat.Handle.AccessoryWeld:Destroy()
	hat.Handle.Orientation = Vector3.new()

local weld = Instance.new("Weld", ___________)
	weld.Part0 = ___________
	weld.Part1 = hat.Handle
	weld.C0 = CFrame.Angles(90, math.rad((90 / (#__________ - 1)) * i), 0) * CFrame.new(8,0,0)
	weld.Name = "hi"

end

function CreateMesh(MESH, PARENT, MESHTYPE, MESHID, TEXTUREID, SCALE, OFFSET)
	local NEWMESH = IT(MESH)
	if MESH == "SpecialMesh" then
		NEWMESH.MeshType = MESHTYPE
		if MESHID ~= "nil" and MESHID ~= "" then
			NEWMESH.MeshId = "http://www.roblox.com/asset/?id="..MESHID
		end
		if TEXTUREID ~= "nil" and TEXTUREID ~= "" then
			NEWMESH.TextureId = "http://www.roblox.com/asset/?id="..TEXTUREID
		end
	end
	NEWMESH.Offset = OFFSET or VT(0, 0, 0)
	NEWMESH.Scale = SCALE
	NEWMESH.Parent = PARENT
	return NEWMESH
end

function CreatePart(FORMFACTOR, PARENT, MATERIAL, REFLECTANCE, TRANSPARENCY, BRICKCOLOR, NAME, SIZE, ANCHOR)
	local NEWPART = IT("Part")
	NEWPART.formFactor = FORMFACTOR
	NEWPART.Reflectance = REFLECTANCE
	NEWPART.Transparency = TRANSPARENCY
	NEWPART.CanCollide = false
	NEWPART.Locked = true
	NEWPART.Anchored = true
	if ANCHOR == false then
		NEWPART.Anchored = false
	end
	NEWPART.BrickColor = BRICKC(tostring(BRICKCOLOR))
	NEWPART.Name = NAME
	NEWPART.Size = SIZE
	NEWPART.Position = Torso.Position
	NEWPART.Material = MATERIAL
	NEWPART:BreakJoints()
	NEWPART.Parent = PARENT
	return NEWPART
end

local function weldBetween(a, b)
	local weldd = Instance.new("ManualWeld")
	weldd.Part0 = a
	weldd.Part1 = b
	weldd.C0 = CFrame.new()
	weldd.C1 = b.CFrame:inverse() * a.CFrame
	weldd.Parent = a
	return weldd
end


function QuaternionFromCFrame(cf)
	local mx, my, mz, m00, m01, m02, m10, m11, m12, m20, m21, m22 = cf:components()
	local trace = m00 + m11 + m22
	if trace > 0 then 
		local s = math.sqrt(1 + trace)
		local recip = 0.5 / s
		return (m21 - m12) * recip, (m02 - m20) * recip, (m10 - m01) * recip, s * 0.5
	else
		local i = 0
		if m11 > m00 then
			i = 1
		end
		if m22 > (i == 0 and m00 or m11) then
			i = 2
		end
		if i == 0 then
			local s = math.sqrt(m00 - m11 - m22 + 1)
			local recip = 0.5 / s
			return 0.5 * s, (m10 + m01) * recip, (m20 + m02) * recip, (m21 - m12) * recip
		elseif i == 1 then
			local s = math.sqrt(m11 - m22 - m00 + 1)
			local recip = 0.5 / s
			return (m01 + m10) * recip, 0.5 * s, (m21 + m12) * recip, (m02 - m20) * recip
		elseif i == 2 then
			local s = math.sqrt(m22 - m00 - m11 + 1)
			local recip = 0.5 / s return (m02 + m20) * recip, (m12 + m21) * recip, 0.5 * s, (m10 - m01) * recip
		end
	end
end

function QuaternionToCFrame(px, py, pz, x, y, z, w)
	local xs, ys, zs = x + x, y + y, z + z
	local wx, wy, wz = w * xs, w * ys, w * zs
	local xx = x * xs
	local xy = x * ys
	local xz = x * zs
	local yy = y * ys
	local yz = y * zs
	local zz = z * zs
	return CFrame.new(px, py, pz, 1 - (yy + zz), xy - wz, xz + wy, xy + wz, 1 - (xx + zz), yz - wx, xz - wy, yz + wx, 1 - (xx + yy))
end

function QuaternionSlerp(a, b, t)
	local cosTheta = a[1] * b[1] + a[2] * b[2] + a[3] * b[3] + a[4] * b[4]
	local startInterp, finishInterp;
	if cosTheta >= 0.0001 then
		if (1 - cosTheta) > 0.0001 then
			local theta = ACOS(cosTheta)
			local invSinTheta = 1 / SIN(theta)
			startInterp = SIN((1 - t) * theta) * invSinTheta
			finishInterp = SIN(t * theta) * invSinTheta
		else
			startInterp = 1 - t
			finishInterp = t
		end
	else
		if (1 + cosTheta) > 0.0001 then
			local theta = ACOS(-cosTheta)
			local invSinTheta = 1 / SIN(theta)
			startInterp = SIN((t - 1) * theta) * invSinTheta
			finishInterp = SIN(t * theta) * invSinTheta
		else
			startInterp = t - 1
			finishInterp = t
		end
	end
	return a[1] * startInterp + b[1] * finishInterp, a[2] * startInterp + b[2] * finishInterp, a[3] * startInterp + b[3] * finishInterp, a[4] * startInterp + b[4] * finishInterp
end

function Clerp(a, b, t)
	local qa = {QuaternionFromCFrame(a)}
	local qb = {QuaternionFromCFrame(b)}
	local ax, ay, az = a.x, a.y, a.z
	local bx, by, bz = b.x, b.y, b.z
	local _t = 1 - t
	return QuaternionToCFrame(_t * ax + t * bx, _t * ay + t * by, _t * az + t * bz, QuaternionSlerp(qa, qb, t))
end

function CreateFrame(PARENT, TRANSPARENCY, BORDERSIZEPIXEL, POSITION, SIZE, COLOR, BORDERCOLOR, NAME)
	local frame = IT("Frame")
	frame.BackgroundTransparency = TRANSPARENCY
	frame.BorderSizePixel = BORDERSIZEPIXEL
	frame.Position = POSITION
	frame.Size = SIZE
	frame.BackgroundColor3 = COLOR
	frame.BorderColor3 = BORDERCOLOR
	frame.Name = NAME
	frame.Parent = PARENT
	return frame
end

function CreateLabel(PARENT, TEXT, TEXTCOLOR, TEXTFONTSIZE, TEXTFONT, TRANSPARENCY, BORDERSIZEPIXEL, STROKETRANSPARENCY, NAME)
	local label = IT("TextLabel")
	label.BackgroundTransparency = 1
	label.Size = UD2(1, 0, 1, 0)
	label.Position = UD2(0, 0, 0, 0)
	label.TextColor3 = TEXTCOLOR
	label.TextStrokeTransparency = STROKETRANSPARENCY
	label.TextTransparency = TRANSPARENCY
	label.FontSize = TEXTFONTSIZE
	label.Font = TEXTFONT
	label.BorderSizePixel = BORDERSIZEPIXEL
	label.TextScaled = false
	label.Text = TEXT
	label.Name = NAME
	label.Parent = PARENT
	return label
end

function NoOutlines(PART)
	PART.TopSurface, PART.BottomSurface, PART.LeftSurface, PART.RightSurface, PART.FrontSurface, PART.BackSurface = 10, 10, 10, 10, 10, 10
end

function CreateWeldOrSnapOrMotor(TYPE, PARENT, PART0, PART1, C0, C1)
	local NEWWELD = IT(TYPE)
	NEWWELD.Part0 = PART0
	NEWWELD.Part1 = PART1
	NEWWELD.C0 = C0
	NEWWELD.C1 = C1
	NEWWELD.Parent = PARENT
	return NEWWELD
end

local S = IT("Sound")
function CreateSound(ID, PARENT, VOLUME, PITCH, DOESLOOP)
	local NEWSOUND = nil
	coroutine.resume(coroutine.create(function()
		NEWSOUND = S:Clone()
		NEWSOUND.Parent = PARENT
		NEWSOUND.Volume = VOLUME
		NEWSOUND.Pitch = PITCH
		NEWSOUND.SoundId = "http://www.roblox.com/asset/?id="..ID
		NEWSOUND:play()
		if DOESLOOP == true then
			NEWSOUND.Looped = true
		else
			repeat wait(1) until NEWSOUND.Playing == false
			NEWSOUND:remove()
		end
	end))
	return NEWSOUND
end

function CFrameFromTopBack(at, top, back)
	local right = top:Cross(back)
	return CF(at.x, at.y, at.z, right.x, top.x, back.x, right.y, top.y, back.y, right.z, top.z, back.z)
end
local NAMEBILL = Instance.new("BillboardGui",Character)
NAMEBILL.AlwaysOnTop = true
NAMEBILL.Size = UDim2.new(7,35,3,15)
NAMEBILL.StudsOffset = Vector3.new(0,2,0)
NAMEBILL.MaxDistance = 0
NAMEBILL.Adornee = Head
NAMEBILL.Name = "NameBillboard"
local NAMEMODE = Instance.new("TextLabel",NAMEBILL)
NAMEMODE.BackgroundTransparency = 1
NAMEMODE.TextScaled = false
NAMEMODE.BorderSizePixel = 0
NAMEMODE.Text = "Light X"
NAMEMODE.Font = "SciFi"
NAMEMODE.TextSize = 75
NAMEMODE.TextStrokeTransparency = 0
NAMEMODE.Size = UDim2.new(1,0,0.5,0)
NAMEMODE.Parent = NAMEBILL
NAMEMODE.TextColor3 = Color3.fromRGB(200,200,200)
NAMEMODE.TextStrokeColor3 = Color3.new(0,0,0)
local CHATBILL = Instance.new("BillboardGui",Character)
CHATBILL.AlwaysOnTop = true
CHATBILL.Size = UDim2.new(7,35,3,15)
CHATBILL.StudsOffset = Vector3.new(0,4,0)
CHATBILL.MaxDistance = 10000
CHATBILL.Adornee = Head
CHATBILL.Name = "NameBillboard"
local CHAT = Instance.new("TextLabel",CHATBILL)
CHAT.BackgroundTransparency = 1
CHAT.TextScaled = false
CHAT.BorderSizePixel = 0
CHAT.Text = "Welcome to my switcher!"
CHAT.Font = NAMEMODE.Font
CHAT.TextSize = 40
CHAT.TextStrokeTransparency = 0
CHAT.Size = UDim2.new(1,0,0.5,0)
CHAT.Parent = CHATBILL
CHAT.TextColor3 = Color3.fromRGB(200,200,200)
CHAT.TextStrokeColor3 = Color3.new(0,0,0)
local GUN = CreatePart(0, Character, "SmoothPlastic", 0, 1, "Bright blue", "GunPart", VT(1.1, 1.1, 1.1),false)
GUN:BreakJoints()
local gunweld = CreateWeldOrSnapOrMotor("Weld", LeftArm, LeftArm, GUN, CF(0,-0.5,0), CF(0, 0, 0))
local plr = game:GetService('Players').LocalPlayer
local plrgui = plr.PlayerGui
local cam = workspace.Camera
local backp = plr.Backpack
local char = plr.Character
local hum = char.Humanoid
local mouse = plr:GetMouse()
local root = char.HumanoidRootPart
function Align(part0,part1,pos,rot)
	pcall(function()
		Instance.new("Attachment",part0.Handle)
		Instance.new("AlignPosition",part0.Handle)
		Instance.new("AlignOrientation", part0.Handle)
		Instance.new("Attachment",part1)
		part0.Handle.AlignPosition.Attachment0 = part0.Handle.Attachment
		part0.Handle.AlignOrientation.Attachment0 = part0.Handle.Attachment
		part0.Handle.AlignPosition.Attachment1 = part1.Attachment
		part0.Handle.AlignOrientation.Attachment1 = part1.Attachment
		part0.Handle.Attachment.Position = pos
		part0.Handle.Attachment.Orientation = rot
		part0.Handle.AlignPosition.Responsiveness = 2000
		part0.Handle.AlignOrientation.Responsiveness = 2000
		part0.Handle.AlignPosition.RigidityEnabled = true
		part0.Handle.AlignOrientation.RigidityEnabled = true
	end)
end



function attachhat(hat,limb, Postion, Orientation)
    
    print(hat,limb, Postion, Orientation)
    local plr = game.Players.LocalPlayer;
    local chr = plr.Character;
    local hum = chr.Humanoid;
    local hat5 = hat;


    hat5.Handle:BreakJoints();

    local ap = Instance.new('AlignPosition', hat5.Handle);
    local ao = Instance.new('AlignOrientation', hat5.Handle);

    ao.MaxAngularVelocity = math.huge;
    ao.MaxTorque = 1000000;
    ao.RigidityEnabled = false;
    ao.Responsiveness = 200;

    ap.MaxForce = 1000000;
    ap.MaxVelocity = math.huge;
    ap.RigidityEnabled = false;
    ap.ApplyAtCenterOfMass = true;
    ap.Responsiveness = 200;

    local a1 = Instance.new('Attachment', limb);
    local a0 = Instance.new('Attachment', hat5.Handle);

    ap.Attachment0 = a0;
    ap.Attachment1 = a1;
    ao.Attachment0 = a0;
    ao.Attachment1 = a1;

    a1.Position = Postion
    a1.Orientation = Orientation;

 
        
    return a1
end 

attachhat(game.Players.LocalPlayer.Character["Blox Rifle 5000"], game.Players.LocalPlayer.Character["Left Arm"], Vector3.new(-0.914, -1.526, -0.05), Vector3.new(-43.955, -83.995, 179.835))
function MakeForm(PART,TYPE)
	if TYPE == "Cyl" then
		local MSH = IT("CylinderMesh",PART)
	elseif TYPE == "Ball" then
		local MSH = IT("SpecialMesh",PART)
		MSH.MeshType = "Sphere"
	elseif TYPE == "Wedge" then
		local MSH = IT("SpecialMesh",PART)
		MSH.MeshType = "Wedge"
	end
end
Debris = game:GetService("Debris")
function CastProperRay(StartPos, EndPos, Distance, Ignore)
	local DIRECTION = CF(StartPos,EndPos).lookVector
	return Raycast(StartPos, DIRECTION, Distance, Ignore)
end
function unanchor()
	if UNANCHOR == true then
		local g = Character:GetChildren()
		for i = 1, #g do
			if g[i].ClassName == "Part" then
				g[i].Anchored = false
			end
		end
	end
end

RootPart.Size = RootPart.Size*SIZE
Torso.Size = Torso.Size*SIZE
RightArm.Size = RightArm.Size*SIZE
RightLeg.Size = RightLeg.Size*SIZE
LeftArm.Size = LeftArm.Size*SIZE
LeftLeg.Size = LeftLeg.Size*SIZE
RootJoint.C0 = ROOTC0 * CF(0 * SIZE, 0 * SIZE, 0 * SIZE) * ANGLES(RAD(0), RAD(0), RAD(0))
RootJoint.C1 = ROOTC0 * CF(0 * SIZE, 0 * SIZE, 0 * SIZE) * ANGLES(RAD(0), RAD(0), RAD(0))
Neck.C0 = NECKC0 * CF(0 * SIZE, 0 * SIZE, 0 + ((1 * SIZE) - 1)) * ANGLES(RAD(0), RAD(0), RAD(0))
Neck.C1 = CF(0 * SIZE, -0.5 * SIZE, 0 * SIZE) * ANGLES(RAD(-90), RAD(0), RAD(180))
RightShoulder.C1 = CF(0 * SIZE, 0.5 * SIZE, -0.35 * SIZE)
LeftShoulder.C1 = CF(0 * SIZE, 0.5 * SIZE, -0.35 * SIZE)
RightHip.C0 = CF(1 * SIZE, -1 * SIZE, 0 * SIZE) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0))
LeftHip.C0 = CF(-1 * SIZE, -1 * SIZE, 0 * SIZE) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0))
RightHip.C1 = CF(0.5 * SIZE, 1 * SIZE, 0 * SIZE) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0))
LeftHip.C1 = CF(-0.5 * SIZE, 1 * SIZE, 0 * SIZE) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0))
Head.Size = Head.Size*SIZE
RootJoint.Parent = RootPart
Neck.Parent = Torso
RightShoulder.Parent = Torso
LeftShoulder.Parent = Torso
RightHip.Parent = Torso
LeftHip.Parent = Torso

Humanoid.Parent = Character

Humanoid.Died:connect(function()
	ATTACK = true
end)
local customasset
if not getsynasset then
	customasset = getcustomasset
elseif getsynasset  then
	customasset = getsynasset
end
ca = customasset
Humanoid.Changed:connect(function(Jump)
	if Jump == "Jump" and (Disable_Jump == true) then
		Humanoid.Jump = false
	end
end)

local m = game.Players.LocalPlayer:GetMouse()
m.Button1Down:connect(function()
    shoot()
    end )
local sick = Instance.new("Sound",Character)
kan,sound = sick,sick
sound.Looped = true
sound.Playing = true
sound.Volume = 0.5
sound.SoundId = customasset("LIGHTX/5341713393.mp3")
Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "1" and ATTACK == false then
		change = .85
		movement = 12
		Speed = 26
		if mode == 1 then mode = 3 setsng(4272705694) else mode = 1 setsng(5341713393) end
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "2" and ATTACK == false then
		change = .85
		movement = 12
		Speed = 26
		if mode == 1 then mode = 2 setsng(2743829704) else mode = 1 setsng(5341713393) end
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "3" and ATTACK == false then
		change = .85
		movement = 12
		Speed = 26
		if mode == 1 then mode = 4 setsng(1251094537) else mode = 1 setsng(5341713393) end
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "4" and ATTACK == false then
		change = .85
		movement = 12
		Speed = 26
		if mode == 1 then mode = 5 setsng(2695321137) else mode = 1 setsng(5341713393) end
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "5" and ATTACK == false then
		change = .85
		movement = 12
		Speed = 26
		if mode == 1 then mode = 6 setsng(5768466361) else mode = 1 setsng(5341713393) end
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "6" and ATTACK == false then
		change = .85
		movement = 12
		Speed = 8
		if mode == 1 then mode = 7 setsng(5947795746) else mode = 1 setsng(5341713393) end
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "7" and ATTACK == false then
		change = .85
		movement = 12
		Speed = 26
		if mode == 1 then mode = 8 setsng(4921647660) else mode = 1 setsng(5341713393) end
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "8" and ATTACK == false then
		change = .85
		movement = 12
		Speed = 26
		if mode == 1 then mode = 9 setsng(7412119863) else mode = 1 setsng(5341713393) end
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "9" and ATTACK == false then
		change = .85
		movement = 12
		Speed = 26
		if mode == 1 then mode = 10 setsng(2954216473) else mode = 1 setsng(5341713393) end
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "0" and ATTACK == false then
		change = .85
		movement = 12
		Speed = 26
		if mode == 1 then mode = 11 setsng(4521541755) else mode = 1 setsng(5341713393) end
	end
end)


Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "m" and mode == 7 and ATTACK == false then
		change = .85
		movement = 12
		Speed = 26
		if mode == 1 then mode = 12 setsng(7201767701) else mode = 12 setsng(7201767701) end
		transition()
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "m" and mode == 11 and ATTACK == false then
		change = .85
		movement = 12
		Speed = 26
		if mode == 1 then mode = 13 setsng(6598441189) else mode = 13 setsng(6598441189) end
		transition()
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "m" and mode == 6 and ATTACK == false then
		change = .85
		movement = 12
		Speed = 26
		if mode == 1 then mode = 14 setsng(1426044282) else mode = 14 setsng(1426044282) end
		transition()
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "m" and mode == 8 and ATTACK == false then
		change = .85
		movement = 12
		Speed = 26
		if mode == 1 then mode = 15 setsng(172473103) else mode = 15 setsng(172473103) end
		transition()
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "m" and mode == 10 and ATTACK == false then
		change = .85
		movement = 12
		Speed = 26
		if mode == 1 then mode = 16 setsng(4185475912) else mode = 16 setsng(4185475912) end
		transition()
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "n" and mode == 6 and ATTACK == false then
		change = .85
		movement = 12
		Speed = 26
		if mode == 1 then mode = 17 setsng(4678252854) else mode = 17 setsng(4678252854) end
		transition()
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "m" and mode == 4 and ATTACK == false then
		change = .85
		movement = 12
		Speed = 26
		if mode == 1 then mode = 18 setsng(5567767035) else mode = 18 setsng(5567767035) end
		transition()
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "m" and mode == 5 and ATTACK == false then
		change = .85
		movement = 12
		Speed = 26
		if mode == 1 then mode = 19 setsng(3089991101) else mode = 19 setsng(3089991101) end
		transition()
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "b" and mode == 5 and ATTACK == false then
		change = .85
		movement = 12
		Speed = 26
		if mode == 1 then mode = 23 setsng(4531591207) else mode = 23 setsng(4531591207) end
		transition()
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "n" and mode == 10 and ATTACK == false then
		change = .85
		movement = 12
		Speed = 26
		if mode == 1 then mode = 20 setsng(2984992418) else mode = 20 setsng(2984992418) end
		transition()
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "m" and mode == 3 and ATTACK == false then
		change = .85
		movement = 12
		Speed = 26
		if mode == 1 then mode = 21 setsng(930541401) else mode = 21 setsng(930541401) end
		transition()
	end
end)
---aeaeae
Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "n" and mode == 5 and ATTACK == false then
		change = .85
		movement = 12
		Speed = 26
		if mode == 1 then mode = 22 setsng(3255566549) else mode = 22 setsng(3255566549) end
		transition()
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "m" and mode == 2 and ATTACK == false then
		change = .85
		movement = 12
		Speed = 26
		if mode == 1 then mode = 23 setsng(4531591207) else mode = 23 setsng(4531591207) end
		transition()
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "b" and mode == 5 and ATTACK == false then
		change = 1
		movement = 18
		Speed = 48
		if mode == 1 then mode = 24 setsng(4615964997) else mode = 24 setsng(4615964997) end
		transition()
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "n" and mode == 11 and ATTACK == false then
		change = .85
		movement = 12
		Speed = 50
		if mode == 1 then mode = 25 setsong(4920807873) else mode = 25 setsong(4920807873) end
		transition()
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "n" and mode == 8 and ATTACK == false then
		change = .85
		movement = 12
		Speed = 26
		if mode == 1 then mode = 27 setsng(6400668054) else mode = 27 setsng(6400668054) end
		transition()
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "b" and mode == 10 and ATTACK == false then
		change = .85
		movement = 12
		Speed = 26
		if mode == 1 then mode = 26 setsng(613035749) else mode = 26 setsng(613035749) end
		transition()
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "v" and mode == 10 and ATTACK == false then
		change = .85
		movement = 12
		Speed = 100
		if mode == 1 then mode = 28 setsng(573736432) else mode = 28 setsng(573736432) end
		transition()
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "n" and mode == 7 and ATTACK == false then
		change = .85
		movement = 12
		Speed = 35
		if mode == 1 then mode = 30 setsong(316491646) else mode = 30 setsong(316491646) end
		transition()
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "v" and mode == 5 and ATTACK == false then
		change = .85
		movement = 12
		Speed = 56
		if mode == 1 then mode = 29 setsng(1083649139) else mode = 29 setsng(1083649139) end
		transition()
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "b" and mode == 8 and ATTACK == false then
		change = .85
		movement = 12
		Speed = 75
		if mode == 1 then mode = 31 setsng(590640761) else mode = 31 setsng(590640761) end
		transition()
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "n" and mode == 4 and ATTACK == false then
		change = .85
		movement = 12
		Speed = 26
		if mode == 1 then mode = 32 setsng(930541401) else mode = 32 setsng(930541401) end
		transition()
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "v" and mode == 8 and ATTACK == false then
		change = 1
		movement = 18
		Speed = 48
		if mode == 1 then mode = 33 setsng(3666416563) else mode = 33 setsng(3666416563) end
		transition()
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "n" and mode == 3 and ATTACK == false then
		change = .85
		movement = 12
		Speed = 26
		if mode == 1 then mode = 34 setsng(4615932760) else mode = 34 setsng(4615932760) end
		transition()
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "b" and mode == 3 and ATTACK == false then
		change = .85
		movement = 12
		Speed = 26
		if mode == 1 then mode = 35 setsng(1062839413) else mode = 35 setsng(1062839413) end
		transition()
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "m" and mode == 16 and ATTACK == false then
		change = .85
		movement = 12
		Speed = 26
		if mode == 1 then mode = 36 setsong(460874877) else mode = 36 setsong(460874877) end
		transition()
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "b" and mode == 7 and ATTACK == false then
		change = .85
		movement = 12
		Speed = 26
		if mode == 1 then mode = 37 setsong(286050652) else mode = 37 setsong(286050652) end
		transition()
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "n" and mode == 37 and ATTACK == false then
		change = .85
		movement = 12
		Speed = 76
		if mode == 1 then mode = 115 setsong(3299458214) else mode = 115 setsong(3299458214) end
		transition()
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "m" and mode == 12 and ATTACK == false then
		change = .85
		movement = 12
		Speed = 100
		if mode == 1 then mode = 38 setsng(258688195) else mode = 38 setsng(258688195) end
		transition()
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "v" and mode == 3 and ATTACK == false then
		change = .85
		movement = 12
		Speed = 26
		if mode == 1 then mode = 39 setsng(6753293750) else mode = 39 setsng(6753293750) end
		transition()
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "b" and mode == 6 and ATTACK == false then
		change = .85
		movement = 12
		Speed = 26
		if mode == 1 then mode = 40 setsng(334283059) else mode = 40 setsng(334283059) end
		transition()
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "b" and mode == 4 and ATTACK == false then
		change = .65
		movement = 8
		Speed = 16
		if mode == 1 then mode = 41 setsng(324993132) else mode = 41 setsng(324993132) end
		transition()
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "m" and mode == 9 and ATTACK == false then
		change = .85
		movement = 12
		Speed = 100
		if mode == 1 then mode = 42 setsng(915288747) else mode = 42 setsng(915288747) end
		transition()
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "n" and mode == 2 and ATTACK == false then
		change = .85
		movement = 12
		Speed = 26
		if mode == 1 then mode = 43 setsng(1495032271) else mode = 43 setsng(1495032271) end
		transition()
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "v" and mode == 7 and ATTACK == false then
		change = .67
		movement = 9
		Speed = 16
		if mode == 1 then mode = 44 setsong(1036619897) else mode = 44 setsong(1036619897) end
		transition()
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "n" and mode == 9 and ATTACK == false then
		change = .85
		movement = 12
		Speed = 26
		if mode == 1 then mode = 45 setsng(2237242791) else mode = 45 setsng(2237242791) end
		transition()
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "b" and mode == 11 and ATTACK == false then
		change = 1
		movement = 20
		Speed = 50
		if mode == 1 then mode = 46 setsng(6215267007) else mode = 46 setsng(6215267007) end
		transition()
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "b" and mode == 9 and ATTACK == false then
		change = .85
		movement = 12
		Speed = 26
		if mode == 1 then mode = 47 setsng(4434814455) else mode = 47 setsng(4434814455) end
		transition()
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "m" and mode == 25 and ATTACK == false then
		change = .85
		movement = 12
		Speed = 26
		if mode == 1 then mode = 48 setsong(4547510851) else mode = 48 setsong(4547510851) end
		transition()
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "v" and mode == 11 and ATTACK == false then
		change = .85
		movement = 12
		Speed = 26
		if mode == 1 then mode = 49 setsng(1494452913) else mode = 49 setsng(1494452913) end
		transition()
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "v" and mode == 4 and ATTACK == false then
		change = .85
		movement = 12
		Speed = 26
		if mode == 1 then mode = 50 setsng(6080083300) else mode = 50 setsng(6080083300) end
		transition()
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "m" and mode == 44 and ATTACK == false then
		change = 1
		movement = 18
		Speed = 48
		if mode == 1 then mode = 51 setsong(6131568941) else mode = 51 setsong(6131568941) end
		transition()
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "v" and mode == 9 and ATTACK == false then
		change = .85
		movement = 12
		Speed = 26
		if mode == 1 then mode = 52 setsng(1511734302) else mode = 52 setsng(1511734302) end
		transition()
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "m" and mode == 28 and ATTACK == false then
		change = .85
		movement = 12
		Speed = 26
		if mode == 1 then mode = 53 setsng(4027028379) else mode = 53 setsng(4027028379) end
		transition()
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "v" and mode == 6 and ATTACK == false then
		change = .85
		movement = 12
		Speed = 45
		if mode == 1 then mode = 54 setsng(1994963968) else mode = 54 setsng(1994963968) end
		transition()
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "m" and mode == 24 and ATTACK == false then
		change = .85
		movement = 12
		Speed = 26
		if mode == 1 then mode = 55 setsng(3180278564) else mode = 55 setsng(3180278564) end
		transition()
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "m" and mode == 20 and ATTACK == false then
		change = .85
		movement = 12
		Speed = 26
		if mode == 1 then mode = 56 setsng(259554386) else mode = 56 setsng(259554386) end
		transition()
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "m" and mode == 56 and ATTACK == false then
		change = .85
		movement = 12
		Speed = 26
		if mode == 1 then mode = 57 setsng(393346130) else mode = 57 setsng(393346130) end
		transition()
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "m" and mode == 30 and ATTACK == false then
		change = .85
		movement = 12
		Speed = 26
		if mode == 1 then mode = 58 setsong(3213198902) else mode = 58 setsong(3213198902) end
		transition()
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "m" and mode == 46 and ATTACK == false then
		change = 1.3
		movement = 18
		Speed = 40
		if mode == 1 then mode = 59 setsong(6074204488) else mode = 59 setsong(6074204488) end
		transition()
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "n" and mode == 30 and ATTACK == false then
		change = .85
		movement = 12
		Speed = 26
		if mode == 1 then mode = 60 setsong(2763510156) else mode = 60 setsong(2763510156) end
		transition()
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "m" and mode == 37 and ATTACK == false then
		change = 1.3
		movement = 18
		Speed = 40
		if mode == 1 then mode = 61 setsong(2928174894) else mode = 61 setsong(2928174894) end
		transition()
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "m" and mode == 47 and ATTACK == false then
		change = .85
		movement = 12
		Speed = 26
		if mode == 1 then mode = 62 setsng(2928174894) else mode = 62 setsng(2928174894) end
		transition()
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "b" and mode == 2 and ATTACK == false then
		change = .85
		movement = 12
		Speed = 45
		if mode == 1 then mode = 63 setsng(7873813713) else mode = 63 setsng(7873813713) end
		transition()
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "r" and ATTACK == false then
		reload()
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "q" and ATTACK == false then
		hype()
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "n" and mode == 16 and ATTACK == false then
		change = .85
		movement = 12
		Speed = 26
		if mode == 1 then mode = 64 setsong(873042302) else mode = 64 setsong(873042302) end
		transition()
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "v" and mode == 2 and ATTACK == false then
		change = .85
		movement = 12
		Speed = 26
		if mode == 1 then mode = 65 setsng(2647282693) else mode = 65 setsng(2647282693) end
		transition()
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "m" and mode == 34 and ATTACK == false then
		change = .85
		movement = 12
		Speed = 26
		if mode == 1 then mode = 66 setsng(6149743293) else mode = 66 setsng(6149743293) end
		transition()
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "m" and mode == 26 and ATTACK == false then
		change = .85
		movement = 12
		Speed = 26
		if mode == 1 then mode = 67 setsong(745724979) else mode = 67 setsong(745724979) end
		transition()
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "n" and mode == 28 and ATTACK == false then
		change = .85
		movement = 12
		Speed = 50
		if mode == 1 then mode = 68 setsong(5259946954) else mode = 68 setsong(5259946954) end
		transition()
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "b" and mode == 28 and ATTACK == false then
		change = .85
		movement = 12
		Speed = 60
		if mode == 1 then mode = 69 setsong(1846379515) else mode = 69 setsong(1846379515) end
		transition()
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "m" and mode == 29 and ATTACK == false then
		change = .85
		movement = 12
		Speed = 26
		if mode == 1 then mode = 70 setsng(1751171913) else mode = 70 setsng(1751171913) end
		transition()
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "v" and mode == 28 and ATTACK == false then
		change = 1
		movement = 18
		Speed = 48
		if mode == 1 then mode = 71 setsong(1591072638) else mode = 71 setsong(1591072638) end
		transition()
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "n" and mode == 25 and ATTACK == false then
		change = .85
		movement = 12
		Speed = 26
		if mode == 1 then mode = 72 setsong(4835049962) else mode = 72 setsong(4835049962) end
		transition()
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "b" and mode == 16 and ATTACK == false then
		change = .85
		movement = 12
		Speed = 26
		if mode == 1 then mode = 73 setsng(5341713393) else mode = 73 setsng(5341713393) end
		transition()
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "m" and mode == 43 and ATTACK == false then
		change = 1
		movement = 20
		Speed = 50
		if mode == 1 then mode = 74 setsng(1074484884) else mode = 74 setsng(1074484884) end
		transition()
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "m" and mode == 32 and ATTACK == false then
		change = .85
		movement = 12
		Speed = 26
		if mode == 1 then mode = 75 setsng(3158212632) else mode = 75 setsng(3158212632) end
		transition()
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "m" and mode == 67 and ATTACK == false then
		change = .85
		movement = 12
		Speed = 16
		if mode == 1 then mode = 76 setsong(860317713) else mode = 76 setsong(860317713) end
		transition()
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "c" and mode == 11 and ATTACK == false then
		change = 1
		movement = 18
		Speed = 48
		if mode == 1 then mode = 77 setsong(2704518251) else mode = 77 setsong(2704518251) end
		transition()
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "v" and mode == 16 and ATTACK == false then
		change = 1.5
		movement = 18
		Speed = 30
		if mode == 1 then mode = 78 setsong(943961217) else mode = 78 setsong(943961217) end
		transition()
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "m" and mode == 13 and ATTACK == false then
		change = 1.5
		movement = 18
		Speed = 30
		if mode == 1 then mode = 79 setsong(1119709168) else mode = 79 setsong(1119709168) end
		transition()
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "m" and mode == 50 and ATTACK == false then
		change = 1.5
		movement = 18
		Speed = 30
		if mode == 1 then mode = 80 setsng(2557672037) else mode = 80 setsng(2557672037) end
		transition()
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "n" and mode == 29 and ATTACK == false then
		change = 1.5
		movement = 18
		Speed = 45
		if mode == 1 then mode = 81 setsng(1609011649) else mode = 81 setsng(1609011649) end
		transition()
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "b" and mode == 29 and ATTACK == false then
		change = 1.5
		movement = 18
		Speed = 120
		if mode == 1 then mode = 82 setsng(4773298879) else mode = 82 setsng(4773298879) end
		fatetransition()
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "z" and mode == 16 and ATTACK == false then
		ILattack()
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "z" and mode == 36 and ATTACK == false then
		LCattack()
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "z" and mode == 64 and ATTACK == false then
		ILattack()
	end
end)
Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "c" and mode == 5 and ATTACK == false then
		change = 1.5
		movement = 18
		Speed = 200
		if mode == 1 then mode = 83 setsng(4736305916) else mode = 83 setsng(4736305916) end
		transition()
	end
end)
Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "c" and mode == 7 and ATTACK == false then
		change = 0.25
		movement = 4
		Speed = 21
		if mode == 1 then mode = 85 setsng(2910839557) else mode = 85 setsng(2910839557) end
		transition()
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "n" and mode == 48 and ATTACK == false then
		change = 0.85
		movement = 12
		Speed = 24
		if mode == 1 then mode = 86 setsong(798163149) else mode = 86 setsong(798163149) end
		transition()
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "n" and mode == 53 and ATTACK == false then
		change = 0.7
		movement = 12
		Speed = 50
		if mode == 1 then mode = 87 setsng(431166738) else mode = 87 setsng(431166738) end
		transition()
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "c" and mode == 25 and ATTACK == false then
		change = .85
		movement = 12
		Speed = 26
		if mode == 1 then mode = 88 setsong(2588085190) else mode = 88 setsong(2588085190) end
		transition()
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "b" and mode == 25 and ATTACK == false then
		change = 0.7
		movement = 12
		Speed = 76
		if mode == 1 then mode = 89 setsong(5865332363) else mode = 89 setsong(5865332363) end
		transition()
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "v" and mode == 25 and ATTACK == false then
		change = 0.7
		movement = 12
		Speed = 76
		if mode == 1 then mode = 90 setsong(2437243292) else mode = 90 setsong(2437243292) end
		transition()
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "n" and mode == 46 and ATTACK == false then
		change = 0.25
		movement = 4
		Speed = 21
		if mode == 1 then mode = 91 setsng(4720618010) else mode = 91 setsng(4720618010) end
		transition()
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "v" and mode == 71 and ATTACK == false then
		change = 1
		movement = 7
		Speed = 56
		if mode == 1 then mode = 92 setsong(5082737062) else mode = 92 setsong(5082737062) end
		transition()
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "b" and mode == 71 and ATTACK == false then
		change = .85
		movement = 12
		Speed = 26
		if mode == 1 then mode = 93 setsong(6837807444) else mode = 93 setsong(6837807444) end
		transition()
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "n" and mode == 71 and ATTACK == false then
		change = 1
		movement = 20
		Speed = 50
		if mode == 1 then mode = 94 setsong(7189488563) else mode = 94 setsong(7189488563) end
		transition()
	end
end)



Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "m" and mode == 71 and ATTACK == false then
		change = 1
		movement = 20
		Speed = 50
		if mode == 1 then mode = 95 setsong(248608334) else mode = 95 setsong(248608334) end
		transition()
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "b" and mode == 53 and ATTACK == false then
		change = 1
		movement = 7
		Speed = 56
		if mode == 1 then mode = 96 setsong(5700169301) else mode = 96 setsong(5700169301) end
		transition()
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "v" and mode == 53 and ATTACK == false then
		change = 1
		movement = 18
		Speed = 48
		if mode == 1 then mode = 97 setsng(5140065698) else mode = 97 setsng(5140065698) end
		transition()
	end
end)
Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "m" and mode == 52 and ATTACK == false then
		change = 1
		movement = 19
		Speed = 48
		if mode == 1 then mode = 99 setsng(949399870) else mode = 99 setsng(949399870) end
		transition()
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "m" and mode == 21 and ATTACK == false then
		change = 1
		movement = 18
		Speed = 48
		if mode == 1 then mode = 100 setsng(595077490) else mode = 100 setsng(595077490) end
		transition()
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "b" and mode == 30 and ATTACK == false then
		change = 1
		movement = 18
		Speed = 48
		if mode == 1 then mode = 101 setsong(6808089421) else mode = 101 setsong(6808089421) end
		transition()
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "n" and mode == 50 and ATTACK == false then
		change = .85
		movement = 12
		Speed = 26
		if mode == 1 then mode = 102 setsng(240450050) else mode = 102 setsng(240450050) end
		transition()
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "m" and mode == 23 and ATTACK == false then
		change = .85
		movement = 12
		Speed = 120
		if mode == 1 then mode = 103 setsng(7449639667) else mode = 103 setsng(7449639667) end
		transition()
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "c" and mode == 6 and ATTACK == false then
		change = .85
		movement = 12
		Speed = 26
		if mode == 1 then mode = 104 setsng(381823766) else mode = 104 setsng(381823766) end
		transition()
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "n" and mode == 47 and ATTACK == false then
		change = .85
		movement = 12
		Speed = 26
		if mode == 1 then mode = 105 setsng(6491627729) else mode = 105 setsng(6491627729) end
		transition()
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "m" and mode == 103 and ATTACK == false then
		change = .85
		movement = 12
		Speed = 70
		if mode == 1 then mode = 106 setsng(911332127) else mode = 106 setsng(911332127) end
		transition()
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "m" and mode == 68 and ATTACK == false then
		change = .85
		movement = 12
		Speed = 26
		if mode == 1 then mode = 107 setsong(1110421128) else mode = 107 setsong(1110421128) end
		transition()
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "v" and mode == 29 and ATTACK == false then
		change = .85
		movement = 12
		Speed = 26
		if mode == 1 then mode = 108 setsng(142720946) else mode = 108 setsng(142720946) end
		transition()
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "m" and mode == 83 and ATTACK == false then
		change = .85
		movement = 12
		Speed = 26
		if mode == 1 then mode = 109 setsng(744885683) else mode = 109 setsng(744885683) end
		transition()
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "n" and mode == 44 and ATTACK == false then
		change = 1
		movement = 18
		Speed = 48
		if mode == 1 then mode = 110 setsong(8089345939) else mode = 110 setsong(8089345939) end
		transition()
	end
end)

Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "b" and mode == 47 and ATTACK == false then
		change = 1
		movement = 18
		Speed = 48
		if mode == 1 then mode = 111 setsng(8089345939) else mode = 111 setsng(8089345939) end
		transition()
	end
end)
Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "n" and mode == 83 and ATTACK == false then
		change = 1
		movement = 18
		Speed = 48
		if mode == 1 then mode = 112 setsng(1290033819) else mode = 112 setsng(1290033819) end
		transition()
	end
end)
Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "b" and mode == 83 and ATTACK == false then
		change = 1
		movement = 18
		Speed = 48
		if mode == 1 then mode = 113 setsng(720140641) else mode = 113 setsng(720140641) end
		transition()
	end
end)


Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "m" and mode == 22 and ATTACK == false then
		change = 1
		movement = 18
		Speed = 76
		if mode == 1 then mode = 114 setsng(717927706) else mode = 114 setsng(717927706) end
		transition()
	end
end)
Mouse.KeyDown:connect(function(NEWKEY)
	if NEWKEY == "m" and mode == 97 and ATTACK == false then
		transition()
		mode = 98
	end
end)
function reload()
	ATTACK = true
	Rooted = true
	for i=0, .7, 0.1 / Animation_Speed do
		Swait()
		gunweld.C0 = Clerp(gunweld.C0, CF(0*SIZE+0 * COS(SINE / 15), 0*SIZE-0 * COS(SINE /15), 0*SIZE+0 * COS(SINE / 15)) * ANGLES(RAD(-0+0 * COS(SINE / 505)), RAD(-0+0* COS(SINE / 55)), RAD(0-0 * COS(SINE / 15))), 1 / Animation_Speed)
		Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(-0.1+6*math.cos(SINE/25))), 1 / Animation_Speed)
		RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 20), 0*SIZE+0 * COS(SINE / 20), 0*SIZE+0.2 * COS(SINE / 20)) * ANGLES(RAD(-5+2 * COS(SINE / 21)), RAD(5+0 * COS(SINE / 21)), RAD(-10+0 * COS(SINE / 21))), 1 / Animation_Speed)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.3*SIZE-0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1), -0.5*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(160+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.3*SIZE-0 * COS(SINE / 1), -0.3*SIZE+0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(120+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1)), RAD(45+0 * COS(SINE / 1))) * LEFTSHOULDERC0, 1 / Animation_Speed)
		RightHip.C0 = Clerp(RightHip.C0, CF(0.5*SIZE+0 * COS(SINE / 20), -1*SIZE+-0.2 * COS(SINE / 20), 0*SIZE+0 * COS(SINE / 20)) * ANGLES(RAD(-10+5 * COS(SINE / 21)), RAD(-15+0 * COS(SINE / 21)), RAD(8+0 * COS(SINE / 21))), 1 / Animation_Speed)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 20), -1*SIZE+-0.2 * COS(SINE / 20), 0*SIZE+0 * COS(SINE / 20)) * ANGLES(RAD(-10+5 * COS(SINE / 21)), RAD(25+0 * COS(SINE / 21)), RAD(-10+0 * COS(SINE / 21))), 1 / Animation_Speed)
	end
	for i=0, .7, 0.1 / Animation_Speed do
		Swait()
		gunweld.C0 = Clerp(gunweld.C0, CF(0*SIZE+0 * COS(SINE / 15), 0*SIZE-0 * COS(SINE /15), 0*SIZE+0 * COS(SINE / 15)) * ANGLES(RAD(-0+0 * COS(SINE / 505)), RAD(-0+0* COS(SINE / 55)), RAD(0-0 * COS(SINE / 15))), 1 / Animation_Speed)
		Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(-0.1+6*math.cos(SINE/25))), 1 / Animation_Speed)
		RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 20), 0*SIZE+0 * COS(SINE / 20), 0*SIZE+0.2 * COS(SINE / 20)) * ANGLES(RAD(-5+2 * COS(SINE / 21)), RAD(5+0 * COS(SINE / 21)), RAD(-10+0 * COS(SINE / 21))), 1 / Animation_Speed)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.3*SIZE-0 * COS(SINE / 1), 0.2*SIZE+0 * COS(SINE / 1), -0.5*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(140+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1)), RAD(25+0 * COS(SINE / 1))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.3*SIZE-0 * COS(SINE / 1), -0.3*SIZE+0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(120+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1)), RAD(45+0 * COS(SINE / 1))) * LEFTSHOULDERC0, 1 / Animation_Speed)
		RightHip.C0 = Clerp(RightHip.C0, CF(0.5*SIZE+0 * COS(SINE / 20), -1*SIZE+-0.2 * COS(SINE / 20), 0*SIZE+0 * COS(SINE / 20)) * ANGLES(RAD(-10+5 * COS(SINE / 21)), RAD(-15+0 * COS(SINE / 21)), RAD(8+0 * COS(SINE / 21))), 1 / Animation_Speed)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 20), -1*SIZE+-0.2 * COS(SINE / 20), 0*SIZE+0 * COS(SINE / 20)) * ANGLES(RAD(-10+5 * COS(SINE / 21)), RAD(25+0 * COS(SINE / 21)), RAD(-10+0 * COS(SINE / 21))), 1 / Animation_Speed)
	end
	for i=0, .7, 0.1 / Animation_Speed do
		Swait()
		gunweld.C0 = Clerp(gunweld.C0, CF(0*SIZE+0 * COS(SINE / 15), 0*SIZE-0 * COS(SINE /15), 0*SIZE+0 * COS(SINE / 15)) * ANGLES(RAD(-0+0 * COS(SINE / 505)), RAD(-0+0* COS(SINE / 55)), RAD(0-0 * COS(SINE / 15))), 1 / Animation_Speed)
		Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(-0.1+6*math.cos(SINE/25))), 1 / Animation_Speed)
		RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 20), 0*SIZE+0 * COS(SINE / 20), 0*SIZE+0.2 * COS(SINE / 20)) * ANGLES(RAD(-5+2 * COS(SINE / 21)), RAD(5+0 * COS(SINE / 21)), RAD(-10+0 * COS(SINE / 21))), 1 / Animation_Speed)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.3*SIZE-0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1), -0.5*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(160+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.3*SIZE-0 * COS(SINE / 1), -0.3*SIZE+0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(120+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1)), RAD(45+0 * COS(SINE / 1))) * LEFTSHOULDERC0, 1 / Animation_Speed)
		RightHip.C0 = Clerp(RightHip.C0, CF(0.5*SIZE+0 * COS(SINE / 20), -1*SIZE+-0.2 * COS(SINE / 20), 0*SIZE+0 * COS(SINE / 20)) * ANGLES(RAD(-10+5 * COS(SINE / 21)), RAD(-15+0 * COS(SINE / 21)), RAD(8+0 * COS(SINE / 21))), 1 / Animation_Speed)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 20), -1*SIZE+-0.2 * COS(SINE / 20), 0*SIZE+0 * COS(SINE / 20)) * ANGLES(RAD(-10+5 * COS(SINE / 21)), RAD(25+0 * COS(SINE / 21)), RAD(-10+0 * COS(SINE / 21))), 1 / Animation_Speed)
	end
	ATTACK = false
	Rooted = false
end
function transition()
	ATTACK = true
	Rooted = true
	for i=0, .7, 0.1 / Animation_Speed do
		Swait()
		gunweld.C0 = Clerp(gunweld.C0, CF(0*SIZE+0 * COS(SINE / 15), 0*SIZE-0 * COS(SINE /15), 0*SIZE+0 * COS(SINE / 15)) * ANGLES(RAD(-0+0 * COS(SINE / 505)), RAD(-0+0* COS(SINE / 55)), RAD(0-0 * COS(SINE / 15))), 1 / Animation_Speed)
		Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(-0.1+6*math.cos(SINE/25))), 1 / Animation_Speed)

		RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1), 0.3*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(15+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1)), RAD(-10+0 * COS(SINE / 1))), 1 / Animation_Speed)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(-1.3*SIZE-0 * COS(SINE / 1), 0.5*SIZE+0 * COS(SINE / 1), 0.4*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(75+0 * COS(SINE / 1)), RAD(25+0 * COS(SINE / 1)), RAD(-25+0 * COS(SINE / 1))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(1.3*SIZE-0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1), 0.3*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(-15+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1)), RAD(25+0 * COS(SINE / 1))) * LEFTSHOULDERC0, 1 / Animation_Speed)
		RightHip.C0 = Clerp(RightHip.C0, CF(0.5*SIZE+0 * COS(SINE / 1), -1.4*SIZE+0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(15+0 * COS(SINE / 1)), RAD(-15+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1))), 1 / Animation_Speed)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 1), -1.3*SIZE+0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(-35+0 * COS(SINE / 1)), RAD(15+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1))), 1 / Animation_Speed)
	end
	for i=0, .7, 0.1 / Animation_Speed do
		Swait()
		gunweld.C0 = Clerp(gunweld.C0, CF(0*SIZE+0 * COS(SINE / 15), 0*SIZE-0 * COS(SINE /15), 0*SIZE+0 * COS(SINE / 15)) * ANGLES(RAD(-0+0 * COS(SINE / 505)), RAD(-0+0* COS(SINE / 55)), RAD(0-0 * COS(SINE / 15))), 1 / Animation_Speed)
		Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(-0.1+6*math.cos(SINE/25))), 1 / Animation_Speed)

		RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1), -0.7*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(55+0 * COS(SINE / 1)), RAD(10+0 * COS(SINE / 1)), RAD(-20+0 * COS(SINE / 1))), 1 / Animation_Speed)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(-1.6*SIZE-0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1), -0.4*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(65+0 * COS(SINE / 1)), RAD(25+0 * COS(SINE / 1)), RAD(-25+0 * COS(SINE / 1))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(1.3*SIZE-0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1), 0.3*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(35+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1)), RAD(25+0 * COS(SINE / 1))) * LEFTSHOULDERC0, 1 / Animation_Speed)
		RightHip.C0 = Clerp(RightHip.C0, CF(0.5*SIZE+0 * COS(SINE / 1), -1*SIZE+0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(45+0 * COS(SINE / 1)), RAD(-15+0 * COS(SINE / 1)), RAD(-10+0 * COS(SINE / 1))), 1 / Animation_Speed)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 1), -1*SIZE+0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(-15+0 * COS(SINE / 1)), RAD(15+0 * COS(SINE / 1)), RAD(-15+0 * COS(SINE / 1))), 1 / Animation_Speed)
	end
	ATTACK = false
	Rooted = false
end

function ILattack()
	ATTACK = true
	for i=0, .55, 0.1 / Animation_Speed do
		Swait()
		gunweld.C0 = Clerp(gunweld.C0, CF(0*SIZE+0 * COS(SINE / 15), 0*SIZE-0 * COS(SINE /15), 0*SIZE+0 * COS(SINE / 15)) * ANGLES(RAD(-0+0 * COS(SINE / 505)), RAD(-0+0* COS(SINE / 55)), RAD(0-0 * COS(SINE / 15))), 1 / Animation_Speed)
		Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(-0.1+6*math.cos(SINE/25))), 1 / Animation_Speed)

		RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0,0.5,2 - .5 * SIN(SINE/14)) * ANGLES(RAD(20),RAD(0),RAD(0)),.7/3)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0,CF(1.3,.5,0)*ANGLES(RAD(-0+0*COS(SINE/15)),160,RAD(-90))*RIGHTSHOULDERC0,.25)
		RightShoulder.C0 = Clerp(RightShoulder.C0,CF(-1.5,.5,0) * ANGLES(RAD(20),RAD(10),RAD(-10-10*SIN(SINE/15))) * LEFTSHOULDERC0,.7/3)
		RightHip.C0 = Clerp(RightHip.C0,CF(1,-1,-.0) * ANGLES(RAD(10),RAD(80),RAD(10+10*SIN(SINE/15))),1/3)
		LeftHip.C0 = Clerp(LeftHip.C0,CF(-1,-1,-.0) * ANGLES(RAD(20),RAD(-80),RAD(-10-10*SIN(SINE/15))),1/3)
	end
	for i=0, .55, 0.1 / Animation_Speed do
		Swait()
		gunweld.C0 = Clerp(gunweld.C0, CF(0*SIZE+0 * COS(SINE / 15), 0*SIZE-0 * COS(SINE /15), 0*SIZE+0 * COS(SINE / 15)) * ANGLES(RAD(-0+0 * COS(SINE / 505)), RAD(-0+0* COS(SINE / 55)), RAD(0-0 * COS(SINE / 15))), 1 / Animation_Speed)
		Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(-0.1+6*math.cos(SINE/25))), 1 / Animation_Speed)

		RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0,0.5,2 - .5 * SIN(SINE/14)) * ANGLES(RAD(20),RAD(0),RAD(0)),.7/3)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0,CF(1.3,.3,0)*ANGLES(RAD(-0+0*COS(SINE/15)),200,RAD(-90))*RIGHTSHOULDERC0,.25)
		RightShoulder.C0 = Clerp(RightShoulder.C0,CF(-1.5,.5,0) * ANGLES(RAD(20),RAD(10),RAD(-10-10*SIN(SINE/15))) * LEFTSHOULDERC0,.7/3)
		RightHip.C0 = Clerp(RightHip.C0,CF(1,-1,-.0) * ANGLES(RAD(10),RAD(80),RAD(10+10*SIN(SINE/15))),1/3)
		LeftHip.C0 = Clerp(LeftHip.C0,CF(-1,-1,-.0) * ANGLES(RAD(20),RAD(-80),RAD(-10-10*SIN(SINE/15))),1/3)
	end
	ATTACK = false
end

function LCattack()
	ATTACK = true
	for i=0, 2.55, 0.1 / Animation_Speed do
		Swait()
		gunweld.C0 = Clerp(gunweld.C0, CF(0*SIZE+0 * COS(SINE / 15), 0*SIZE-0 * COS(SINE /15), 0*SIZE+0 * COS(SINE / 15)) * ANGLES(RAD(-0+0 * COS(SINE / 505)), RAD(-0+0* COS(SINE / 55)), RAD(0-0 * COS(SINE / 15))), 1 / Animation_Speed)
		Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(70.1+6*math.cos(SINE/25))), 1 / Animation_Speed)

		RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 19), 1.6*SIZE+0 * COS(SINE / 19), 3.5*SIZE+0.3 * COS(SINE / 19)) * ANGLES(RAD(0+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1)), RAD(-80+0 * COS(SINE / 1))), 1 / Animation_Speed)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(-1.4*SIZE-0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1), -0.7*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(120+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1)), RAD(-45+0 * COS(SINE / 1))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(1*SIZE-0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1), -0.6*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(90+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1)), RAD(-70+0 * COS(SINE / 1))) * LEFTSHOULDERC0, 1 / Animation_Speed)
		RightHip.C0 = Clerp(RightHip.C0, CF(0.5*SIZE+0 * COS(SINE / 1), -1*SIZE+0 * COS(SINE / 1), 0.3*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(-10+0 * COS(SINE / 1)), RAD(-25+0 * COS(SINE / 1)), RAD(10+0 * COS(SINE / 1))), 1 / Animation_Speed)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 1), -0.5*SIZE+0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(0+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1))), 1 / Animation_Speed)

	end
	for i=0, 0.05, 0.1 / Animation_Speed do
		Swait()
		gunweld.C0 = Clerp(gunweld.C0, CF(0*SIZE+0 * COS(SINE / 15), 0*SIZE-0 * COS(SINE /15), 0*SIZE+0 * COS(SINE / 15)) * ANGLES(RAD(-0+0 * COS(SINE / 505)), RAD(-0+0* COS(SINE / 55)), RAD(0-0 * COS(SINE / 15))), 1 / Animation_Speed)
		Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(70.1+6*math.cos(SINE/25))), 1 / Animation_Speed)


		RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 19), 2*SIZE+0 * COS(SINE / 19), 3.5*SIZE+0.3 * COS(SINE / 19)) * ANGLES(RAD(0+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1)), RAD(-80+0 * COS(SINE / 1))), 1 / Animation_Speed)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(-1.4*SIZE-0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1), -0.7*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(120+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1)), RAD(-45+0 * COS(SINE / 1))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(1*SIZE-0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1), -0.6*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(90+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1)), RAD(-70+0 * COS(SINE / 1))) * LEFTSHOULDERC0, 1 / Animation_Speed)
		RightHip.C0 = Clerp(RightHip.C0, CF(0.5*SIZE+0 * COS(SINE / 1), -1*SIZE+0 * COS(SINE / 1), 0.3*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(-10+0 * COS(SINE / 1)), RAD(-25+0 * COS(SINE / 1)), RAD(10+0 * COS(SINE / 1))), 1 / Animation_Speed)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 1), -0.5*SIZE+0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(0+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1))), 1 / Animation_Speed)

	end
	for i=0, 0.05, 0.1 / Animation_Speed do
		Swait()
		gunweld.C0 = Clerp(gunweld.C0, CF(0*SIZE+0 * COS(SINE / 15), 0*SIZE-0 * COS(SINE /15), 0*SIZE+0 * COS(SINE / 15)) * ANGLES(RAD(-0+0 * COS(SINE / 505)), RAD(-0+0* COS(SINE / 55)), RAD(0-0 * COS(SINE / 15))), 1 / Animation_Speed)
		Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(70.1+6*math.cos(SINE/25))), 1 / Animation_Speed)


		RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 19), 2.2*SIZE+0 * COS(SINE / 19), 3.5*SIZE+0.3 * COS(SINE / 19)) * ANGLES(RAD(0+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1)), RAD(-80+0 * COS(SINE / 1))), 1 / Animation_Speed)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(-1.4*SIZE-0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1), -0.7*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(120+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1)), RAD(-45+0 * COS(SINE / 1))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(1*SIZE-0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1), -0.6*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(90+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1)), RAD(-70+0 * COS(SINE / 1))) * LEFTSHOULDERC0, 1 / Animation_Speed)
		RightHip.C0 = Clerp(RightHip.C0, CF(0.5*SIZE+0 * COS(SINE / 1), -1*SIZE+0 * COS(SINE / 1), 0.3*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(-10+0 * COS(SINE / 1)), RAD(-25+0 * COS(SINE / 1)), RAD(10+0 * COS(SINE / 1))), 1 / Animation_Speed)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 1), -0.5*SIZE+0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(0+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1))), 1 / Animation_Speed)

	end
	for i=0, 0.05, 0.1 / Animation_Speed do
		Swait()
		gunweld.C0 = Clerp(gunweld.C0, CF(0*SIZE+0 * COS(SINE / 15), 0*SIZE-0 * COS(SINE /15), 0*SIZE+0 * COS(SINE / 15)) * ANGLES(RAD(-0+0 * COS(SINE / 505)), RAD(-0+0* COS(SINE / 55)), RAD(0-0 * COS(SINE / 15))), 1 / Animation_Speed)
		Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(70.1+6*math.cos(SINE/25))), 1 / Animation_Speed)


		RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 19), 2.4*SIZE+0 * COS(SINE / 19), 3.5*SIZE+0.3 * COS(SINE / 19)) * ANGLES(RAD(0+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1)), RAD(-80+0 * COS(SINE / 1))), 1 / Animation_Speed)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(-1.4*SIZE-0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1), -0.7*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(120+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1)), RAD(-45+0 * COS(SINE / 1))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(1*SIZE-0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1), -0.6*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(90+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1)), RAD(-70+0 * COS(SINE / 1))) * LEFTSHOULDERC0, 1 / Animation_Speed)
		RightHip.C0 = Clerp(RightHip.C0, CF(0.5*SIZE+0 * COS(SINE / 1), -1*SIZE+0 * COS(SINE / 1), 0.3*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(-10+0 * COS(SINE / 1)), RAD(-25+0 * COS(SINE / 1)), RAD(10+0 * COS(SINE / 1))), 1 / Animation_Speed)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 1), -0.5*SIZE+0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(0+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1))), 1 / Animation_Speed)

	end
	for i=0, 0.05, 0.1 / Animation_Speed do
		Swait()
		gunweld.C0 = Clerp(gunweld.C0, CF(0*SIZE+0 * COS(SINE / 15), 0*SIZE-0 * COS(SINE /15), 0*SIZE+0 * COS(SINE / 15)) * ANGLES(RAD(-0+0 * COS(SINE / 505)), RAD(-0+0* COS(SINE / 55)), RAD(0-0 * COS(SINE / 15))), 1 / Animation_Speed)
		Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(70.1+6*math.cos(SINE/25))), 1 / Animation_Speed)


		RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 19), 2.6*SIZE+0 * COS(SINE / 19), 3.5*SIZE+0.3 * COS(SINE / 19)) * ANGLES(RAD(0+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1)), RAD(-80+0 * COS(SINE / 1))), 1 / Animation_Speed)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(-1.4*SIZE-0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1), -0.7*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(120+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1)), RAD(-45+0 * COS(SINE / 1))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(1*SIZE-0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1), -0.6*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(90+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1)), RAD(-70+0 * COS(SINE / 1))) * LEFTSHOULDERC0, 1 / Animation_Speed)
		RightHip.C0 = Clerp(RightHip.C0, CF(0.5*SIZE+0 * COS(SINE / 1), -1*SIZE+0 * COS(SINE / 1), 0.3*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(-10+0 * COS(SINE / 1)), RAD(-25+0 * COS(SINE / 1)), RAD(10+0 * COS(SINE / 1))), 1 / Animation_Speed)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 1), -0.5*SIZE+0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(0+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1))), 1 / Animation_Speed)

	end
	for i=0, 0.05, 0.1 / Animation_Speed do
		Swait()
		gunweld.C0 = Clerp(gunweld.C0, CF(0*SIZE+0 * COS(SINE / 15), 0*SIZE-0 * COS(SINE /15), 0*SIZE+0 * COS(SINE / 15)) * ANGLES(RAD(-0+0 * COS(SINE / 505)), RAD(-0+0* COS(SINE / 55)), RAD(0-0 * COS(SINE / 15))), 1 / Animation_Speed)
		Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(70.1+6*math.cos(SINE/25))), 1 / Animation_Speed)


		RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 19), 2.8*SIZE+0 * COS(SINE / 19), 3.5*SIZE+0.3 * COS(SINE / 19)) * ANGLES(RAD(0+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1)), RAD(-80+0 * COS(SINE / 1))), 1 / Animation_Speed)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(-1.4*SIZE-0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1), -0.7*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(120+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1)), RAD(-45+0 * COS(SINE / 1))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(1*SIZE-0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1), -0.6*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(90+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1)), RAD(-70+0 * COS(SINE / 1))) * LEFTSHOULDERC0, 1 / Animation_Speed)
		RightHip.C0 = Clerp(RightHip.C0, CF(0.5*SIZE+0 * COS(SINE / 1), -1*SIZE+0 * COS(SINE / 1), 0.3*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(-10+0 * COS(SINE / 1)), RAD(-25+0 * COS(SINE / 1)), RAD(10+0 * COS(SINE / 1))), 1 / Animation_Speed)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 1), -0.5*SIZE+0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(0+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1))), 1 / Animation_Speed)

	end
	for i=0, 0.05, 0.1 / Animation_Speed do
		Swait()
		gunweld.C0 = Clerp(gunweld.C0, CF(0*SIZE+0 * COS(SINE / 15), 0*SIZE-0 * COS(SINE /15), 0*SIZE+0 * COS(SINE / 15)) * ANGLES(RAD(-0+0 * COS(SINE / 505)), RAD(-0+0* COS(SINE / 55)), RAD(0-0 * COS(SINE / 15))), 1 / Animation_Speed)
		Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(70.1+6*math.cos(SINE/25))), 1 / Animation_Speed)


		RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 19), 3*SIZE+0 * COS(SINE / 19), 3.5*SIZE+0.3 * COS(SINE / 19)) * ANGLES(RAD(0+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1)), RAD(-80+0 * COS(SINE / 1))), 1 / Animation_Speed)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(-1.4*SIZE-0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1), -0.7*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(120+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1)), RAD(-45+0 * COS(SINE / 1))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(1*SIZE-0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1), -0.6*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(90+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1)), RAD(-70+0 * COS(SINE / 1))) * LEFTSHOULDERC0, 1 / Animation_Speed)
		RightHip.C0 = Clerp(RightHip.C0, CF(0.5*SIZE+0 * COS(SINE / 1), -1*SIZE+0 * COS(SINE / 1), 0.3*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(-10+0 * COS(SINE / 1)), RAD(-25+0 * COS(SINE / 1)), RAD(10+0 * COS(SINE / 1))), 1 / Animation_Speed)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 1), -0.5*SIZE+0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(0+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1))), 1 / Animation_Speed)

	end
	for i=0, 0.1, 0.1 / Animation_Speed do
		Swait()
		gunweld.C0 = Clerp(gunweld.C0, CF(0*SIZE+0 * COS(SINE / 15), 0*SIZE-0 * COS(SINE /15), 0*SIZE+0 * COS(SINE / 15)) * ANGLES(RAD(-0+0 * COS(SINE / 505)), RAD(-0+0* COS(SINE / 55)), RAD(0-0 * COS(SINE / 15))), 1 / Animation_Speed)
		Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(70.1+6*math.cos(SINE/25))), 1 / Animation_Speed)


		RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 19), 3.2*SIZE+0 * COS(SINE / 19), 3.5*SIZE+0.3 * COS(SINE / 19)) * ANGLES(RAD(0+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1)), RAD(-80+0 * COS(SINE / 1))), 1 / Animation_Speed)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(-1.4*SIZE-0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1), -0.7*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(120+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1)), RAD(-45+0 * COS(SINE / 1))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(1*SIZE-0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1), -0.6*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(90+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1)), RAD(-70+0 * COS(SINE / 1))) * LEFTSHOULDERC0, 1 / Animation_Speed)
		RightHip.C0 = Clerp(RightHip.C0, CF(0.5*SIZE+0 * COS(SINE / 1), -1*SIZE+0 * COS(SINE / 1), 0.3*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(-10+0 * COS(SINE / 1)), RAD(-25+0 * COS(SINE / 1)), RAD(10+0 * COS(SINE / 1))), 1 / Animation_Speed)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 1), -0.5*SIZE+0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(0+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1))), 1 / Animation_Speed)

	end
	for i=0, 0.1, 0.1 / Animation_Speed do
		Swait()
		gunweld.C0 = Clerp(gunweld.C0, CF(0*SIZE+0 * COS(SINE / 15), 0*SIZE-0 * COS(SINE /15), 0*SIZE+0 * COS(SINE / 15)) * ANGLES(RAD(-0+0 * COS(SINE / 505)), RAD(-0+0* COS(SINE / 55)), RAD(0-0 * COS(SINE / 15))), 1 / Animation_Speed)
		Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(70.1+6*math.cos(SINE/25))), 1 / Animation_Speed)


		RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 19), 3.4*SIZE+0 * COS(SINE / 19), 3.5*SIZE+0.3 * COS(SINE / 19)) * ANGLES(RAD(0+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1)), RAD(-80+0 * COS(SINE / 1))), 1 / Animation_Speed)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(-1.4*SIZE-0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1), -0.7*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(120+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1)), RAD(-45+0 * COS(SINE / 1))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(1*SIZE-0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1), -0.6*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(90+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1)), RAD(-70+0 * COS(SINE / 1))) * LEFTSHOULDERC0, 1 / Animation_Speed)
		RightHip.C0 = Clerp(RightHip.C0, CF(0.5*SIZE+0 * COS(SINE / 1), -1*SIZE+0 * COS(SINE / 1), 0.3*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(-10+0 * COS(SINE / 1)), RAD(-25+0 * COS(SINE / 1)), RAD(10+0 * COS(SINE / 1))), 1 / Animation_Speed)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 1), -0.5*SIZE+0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(0+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1))), 1 / Animation_Speed)

	end
	for i=0, 0.1, 0.1 / Animation_Speed do
		Swait()
		gunweld.C0 = Clerp(gunweld.C0, CF(0*SIZE+0 * COS(SINE / 15), 0*SIZE-0 * COS(SINE /15), 0*SIZE+0 * COS(SINE / 15)) * ANGLES(RAD(-0+0 * COS(SINE / 505)), RAD(-0+0* COS(SINE / 55)), RAD(0-0 * COS(SINE / 15))), 1 / Animation_Speed)
		Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(70.1+6*math.cos(SINE/25))), 1 / Animation_Speed)
		RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 19), 3.6*SIZE+0 * COS(SINE / 19), 3.5*SIZE+0.3 * COS(SINE / 19)) * ANGLES(RAD(0+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1)), RAD(-80+0 * COS(SINE / 1))), 1 / Animation_Speed)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(-1.4*SIZE-0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1), -0.7*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(120+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1)), RAD(-45+0 * COS(SINE / 1))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(1*SIZE-0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1), -0.6*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(90+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1)), RAD(-70+0 * COS(SINE / 1))) * LEFTSHOULDERC0, 1 / Animation_Speed)
		RightHip.C0 = Clerp(RightHip.C0, CF(0.5*SIZE+0 * COS(SINE / 1), -1*SIZE+0 * COS(SINE / 1), 0.3*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(-10+0 * COS(SINE / 1)), RAD(-25+0 * COS(SINE / 1)), RAD(10+0 * COS(SINE / 1))), 1 / Animation_Speed)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 1), -0.5*SIZE+0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(0+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1))), 1 / Animation_Speed)

	end
	for i=0, 0.1, 0.1 / Animation_Speed do
		Swait()
		gunweld.C0 = Clerp(gunweld.C0, CF(0*SIZE+0 * COS(SINE / 15), 0*SIZE-0 * COS(SINE /15), 0*SIZE+0 * COS(SINE / 15)) * ANGLES(RAD(-0+0 * COS(SINE / 505)), RAD(-0+0* COS(SINE / 55)), RAD(0-0 * COS(SINE / 15))), 1 / Animation_Speed)
		Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(70.1+6*math.cos(SINE/25))), 1 / Animation_Speed)
		RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 19), 3.8*SIZE+0 * COS(SINE / 19), 3.5*SIZE+0.3 * COS(SINE / 19)) * ANGLES(RAD(0+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1)), RAD(-80+0 * COS(SINE / 1))), 1 / Animation_Speed)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(-1.4*SIZE-0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1), -0.7*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(120+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1)), RAD(-45+0 * COS(SINE / 1))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(1*SIZE-0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1), -0.6*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(90+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1)), RAD(-70+0 * COS(SINE / 1))) * LEFTSHOULDERC0, 1 / Animation_Speed)
		RightHip.C0 = Clerp(RightHip.C0, CF(0.5*SIZE+0 * COS(SINE / 1), -1*SIZE+0 * COS(SINE / 1), 0.3*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(-10+0 * COS(SINE / 1)), RAD(-25+0 * COS(SINE / 1)), RAD(10+0 * COS(SINE / 1))), 1 / Animation_Speed)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 1), -0.5*SIZE+0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(0+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1))), 1 / Animation_Speed)

	end
	for i=0, 0.1, 0.1 / Animation_Speed do
		Swait()
		gunweld.C0 = Clerp(gunweld.C0, CF(0*SIZE+0 * COS(SINE / 15), 0*SIZE-0 * COS(SINE /15), 0*SIZE+0 * COS(SINE / 15)) * ANGLES(RAD(-0+0 * COS(SINE / 505)), RAD(-0+0* COS(SINE / 55)), RAD(0-0 * COS(SINE / 15))), 1 / Animation_Speed)
		Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(70.1+6*math.cos(SINE/25))), 1 / Animation_Speed)
		RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 19), 4*SIZE+0 * COS(SINE / 19), 3.5*SIZE+0.3 * COS(SINE / 19)) * ANGLES(RAD(0+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1)), RAD(-80+0 * COS(SINE / 1))), 1 / Animation_Speed)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(-1.4*SIZE-0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1), -0.7*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(120+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1)), RAD(-45+0 * COS(SINE / 1))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(1*SIZE-0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1), -0.6*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(90+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1)), RAD(-70+0 * COS(SINE / 1))) * LEFTSHOULDERC0, 1 / Animation_Speed)
		RightHip.C0 = Clerp(RightHip.C0, CF(0.5*SIZE+0 * COS(SINE / 1), -1*SIZE+0 * COS(SINE / 1), 0.3*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(-10+0 * COS(SINE / 1)), RAD(-25+0 * COS(SINE / 1)), RAD(10+0 * COS(SINE / 1))), 1 / Animation_Speed)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 1), -0.5*SIZE+0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(0+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1))), 1 / Animation_Speed)

	end
	for i=0, 0.1, 0.1 / Animation_Speed do
		Swait()
		gunweld.C0 = Clerp(gunweld.C0, CF(0*SIZE+0 * COS(SINE / 15), 0*SIZE-0 * COS(SINE /15), 0*SIZE+0 * COS(SINE / 15)) * ANGLES(RAD(-0+0 * COS(SINE / 505)), RAD(-0+0* COS(SINE / 55)), RAD(0-0 * COS(SINE / 15))), 1 / Animation_Speed)
		Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(70.1+6*math.cos(SINE/25))), 1 / Animation_Speed)


		RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 19), 4.2*SIZE+0 * COS(SINE / 19), 3.5*SIZE+0.3 * COS(SINE / 19)) * ANGLES(RAD(0+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1)), RAD(-80+0 * COS(SINE / 1))), 1 / Animation_Speed)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(-1.4*SIZE-0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1), -0.7*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(120+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1)), RAD(-45+0 * COS(SINE / 1))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(1*SIZE-0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1), -0.6*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(90+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1)), RAD(-70+0 * COS(SINE / 1))) * LEFTSHOULDERC0, 1 / Animation_Speed)
		RightHip.C0 = Clerp(RightHip.C0, CF(0.5*SIZE+0 * COS(SINE / 1), -1*SIZE+0 * COS(SINE / 1), 0.3*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(-10+0 * COS(SINE / 1)), RAD(-25+0 * COS(SINE / 1)), RAD(10+0 * COS(SINE / 1))), 1 / Animation_Speed)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 1), -0.5*SIZE+0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(0+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1))), 1 / Animation_Speed)

	end
	ATTACK = false
end
local actual_last_song = nil
function setsong(id, val)
	pcall(function()
		kan.SoundId = id
		kan.TimePosition = 0
	end)
	if val == nil or val ~= false then
		actual_last_song = id
	end
end
function setsng(id, val) --setsong
	pcall(function()
		kan.SoundId = customasset("LIGHTX/"..id..".mp3")
		kan.TimePosition = 0
	end)
	if val == nil or val ~= false then
		actual_last_song = id
	end
end
function sfx(id, song, position)
	local sound = Instance.new("Sound", Torso)
	sound.Volume = 1
	sound.Name = math.random()
	sound.SoundId = id
	sound:Play()
	game:GetService("Debris"):AddItem(sound, sound.TimeLength)
end
local ExtraShootValue = true
function shoot()
	if ExtraShootValue == true then
		ExtraShootValue = false
		ATTACK = true
		Rooted = true
		for i=0, .7, 0.1 / Animation_Speed do
			Swait()
			gunweld.C0 = Clerp(gunweld.C0, CF(0*SIZE+0 * COS(SINE / 15), 0*SIZE-0 * COS(SINE /15), 0*SIZE+0 * COS(SINE / 15)) * ANGLES(RAD(-0+0 * COS(SINE / 505)), RAD(-0+0* COS(SINE / 55)), RAD(0-0 * COS(SINE / 15))), 1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(195+3*math.cos(SINE/28)),math.rad(20.1+6*math.cos(SINE/25))), 1 / Animation_Speed)
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 20), 0*SIZE+0 * COS(SINE / 20), 0*SIZE+0.2 * COS(SINE / 20)) * ANGLES(RAD(10+3 * COS(SINE / 21)), RAD(10+0 * COS(SINE / 21)), RAD(-10+0 * COS(SINE / 21))), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(0*SIZE-0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1), -1*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(140+0 * COS(SINE / 1)), RAD(25+0 * COS(SINE / 1)), RAD(-35+0 * COS(SINE / 1))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.6*SIZE-0 * COS(SINE / 1), 0.3*SIZE+0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(90+0 * COS(SINE / 1)), RAD(-25+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1))) * LEFTSHOULDERC0, 1 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(0.5*SIZE+0 * COS(SINE / 20), -1.2*SIZE+-0.2 * COS(SINE / 20), 0.3*SIZE+0 * COS(SINE / 20)) * ANGLES(RAD(10+5 * COS(SINE / 21)), RAD(-15+0 * COS(SINE / 21)), RAD(8+0 * COS(SINE / 21))), 1 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 20), -1*SIZE+-0.2 * COS(SINE / 20), 0*SIZE+0 * COS(SINE / 20)) * ANGLES(RAD(25+0 * COS(SINE / 21)), RAD(25+0 * COS(SINE / 21)), RAD(-25+0 * COS(SINE / 21))), 1 / Animation_Speed)
		end
		for i=0, .7, 0.1 / Animation_Speed do
			Swait()
			gunweld.C0 = Clerp(gunweld.C0, CF(0*SIZE+0 * COS(SINE / 15), 0*SIZE-0 * COS(SINE /15), 0*SIZE+0 * COS(SINE / 15)) * ANGLES(RAD(-0+0 * COS(SINE / 505)), RAD(-0+0* COS(SINE / 55)), RAD(0-0 * COS(SINE / 15))), 1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(195+3*math.cos(SINE/28)),math.rad(20.1+6*math.cos(SINE/25))), 1 / Animation_Speed)
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 20), 0.65*SIZE+0 * COS(SINE / 20), 0*SIZE+0.2 * COS(SINE / 20)) * ANGLES(RAD(-10+3 * COS(SINE / 21)), RAD(10+0 * COS(SINE / 21)), RAD(-10+0 * COS(SINE / 21))), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(0*SIZE-0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1), -1*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(140+0 * COS(SINE / 1)), RAD(25+0 * COS(SINE / 1)), RAD(-35+0 * COS(SINE / 1))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.6*SIZE-0 * COS(SINE / 1), 0.3*SIZE+0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(90+0 * COS(SINE / 1)), RAD(-25+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1))) * LEFTSHOULDERC0, 1 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(0.5*SIZE+0 * COS(SINE / 20), -1.2*SIZE+-0.2 * COS(SINE / 20), 0.3*SIZE+0 * COS(SINE / 20)) * ANGLES(RAD(-10+5 * COS(SINE / 21)), RAD(-15+0 * COS(SINE / 21)), RAD(8+0 * COS(SINE / 21))), 1 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 20), -1*SIZE+-0.2 * COS(SINE / 20), 0*SIZE+0 * COS(SINE / 20)) * ANGLES(RAD(0+0 * COS(SINE / 21)), RAD(25+0 * COS(SINE / 21)), RAD(-25+0 * COS(SINE / 21))), 1 / Animation_Speed)
		end
		for i=0, .7, 0.1 / Animation_Speed do
			Swait()
			gunweld.C0 = Clerp(gunweld.C0, CF(0*SIZE+0 * COS(SINE / 15), 0*SIZE-0 * COS(SINE /15), 0*SIZE+0 * COS(SINE / 15)) * ANGLES(RAD(-0+0 * COS(SINE / 505)), RAD(-0+0* COS(SINE / 55)), RAD(0-0 * COS(SINE / 15))), 1 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(195+3*math.cos(SINE/28)),math.rad(20.1+6*math.cos(SINE/25))), 1 / Animation_Speed)
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 20), 0*SIZE+0 * COS(SINE / 20), 0*SIZE+0.2 * COS(SINE / 20)) * ANGLES(RAD(10+3 * COS(SINE / 21)), RAD(10+0 * COS(SINE / 21)), RAD(-10+0 * COS(SINE / 21))), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(0*SIZE-0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1), -1*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(140+0 * COS(SINE / 1)), RAD(25+0 * COS(SINE / 1)), RAD(-35+0 * COS(SINE / 1))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.6*SIZE-0 * COS(SINE / 1), 0.3*SIZE+0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(90+0 * COS(SINE / 1)), RAD(-25+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1))) * LEFTSHOULDERC0, 1 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(0.5*SIZE+0 * COS(SINE / 20), -1.2*SIZE+-0.2 * COS(SINE / 20), 0.3*SIZE+0 * COS(SINE / 20)) * ANGLES(RAD(10+5 * COS(SINE / 21)), RAD(-15+0 * COS(SINE / 21)), RAD(8+0 * COS(SINE / 21))), 1 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 20), -1*SIZE+-0.2 * COS(SINE / 20), 0*SIZE+0 * COS(SINE / 20)) * ANGLES(RAD(25+0 * COS(SINE / 21)), RAD(25+0 * COS(SINE / 21)), RAD(-25+0 * COS(SINE / 21))), 1 / Animation_Speed)
		end
		ATTACK = false
		Rooted = false
		wait(3.3)
		ExtraShootValue = true
	end
end

function hype()
	ATTACK = true
	Rooted = true
	for i=0, 7.7, 0.1 / Animation_Speed do
		Swait()
		gunweld.C0 = Clerp(gunweld.C0, CF(0*SIZE+0 * COS(SINE / 15), 0*SIZE-0 * COS(SINE /15), 0*SIZE+0 * COS(SINE / 15)) * ANGLES(RAD(-0+0 * COS(SINE / 505)), RAD(-0+0* COS(SINE / 55)), RAD(0-0 * COS(SINE / 15))), 1 / Animation_Speed)
		Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(195+3*math.cos(SINE/28)),math.rad(20.1+6*math.cos(SINE/25))), 1 / Animation_Speed)
		RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 2), 0*SIZE+0 * COS(SINE / 2), 0.5*SIZE+0.5 * COS(SINE / 2)) * ANGLES(RAD(-10+10 * COS(SINE / 3)), RAD(0+0 * COS(SINE / 3)), RAD(0+0 * COS(SINE / 3))), 1 / Animation_Speed)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.6*SIZE-0 * COS(SINE / 1), 0.5*SIZE+0.2 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(140+45 * COS(SINE / 2)), RAD(0+0 * COS(SINE / 2)), RAD(0+0 * COS(SINE / 2))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.6*SIZE-0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(-26+10 * COS(SINE / 2)), RAD(0+0 * COS(SINE / 2)), RAD(0+0 * COS(SINE / 2))) * LEFTSHOULDERC0, 1 / Animation_Speed)
		RightHip.C0 = Clerp(RightHip.C0, CF(0.5*SIZE+0 * COS(SINE / 1), -1*SIZE+0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(0+50 * COS(SINE / 2)), RAD(0+0 * COS(SINE / 2)), RAD(0+0 * COS(SINE / 2))), 1 / Animation_Speed)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 1), -1*SIZE+0 * COS(SINE / 1), 0.5*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(-25+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1))), 1 / Animation_Speed)
	end
	for i=0, 7.7, 0.1 / Animation_Speed do
		Swait()
		gunweld.C0 = Clerp(gunweld.C0, CF(0*SIZE+0 * COS(SINE / 15), 0*SIZE-0 * COS(SINE /15), 0*SIZE+0 * COS(SINE / 15)) * ANGLES(RAD(-0+0 * COS(SINE / 505)), RAD(-0+0* COS(SINE / 55)), RAD(0-0 * COS(SINE / 15))), 1 / Animation_Speed)
		Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(195+3*math.cos(SINE/28)),math.rad(20.1+6*math.cos(SINE/25))), 1 / Animation_Speed)
		RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 2), 0*SIZE+0 * COS(SINE / 2), 0.5*SIZE+0.5 * COS(SINE / 2)) * ANGLES(RAD(-10+10 * COS(SINE / 3)), RAD(0+0 * COS(SINE / 3)), RAD(0+0 * COS(SINE / 3))), 1 / Animation_Speed)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.6*SIZE-0 * COS(SINE / 1), 0.5*SIZE+0.2 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(-20+45 * COS(SINE / 2)), RAD(0+0 * COS(SINE / 2)), RAD(0+0 * COS(SINE / 2))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.6*SIZE-0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(-26+10 * COS(SINE / 2)), RAD(0+0 * COS(SINE / 2)), RAD(0+0 * COS(SINE / 2))) * LEFTSHOULDERC0, 1 / Animation_Speed)
		RightHip.C0 = Clerp(RightHip.C0, CF(0.5*SIZE+0 * COS(SINE / 1), -1*SIZE+0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(0+50 * COS(SINE / 2)), RAD(0+0 * COS(SINE / 2)), RAD(0+0 * COS(SINE / 2))), 1 / Animation_Speed)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 1), -1*SIZE+0 * COS(SINE / 1), 0.5*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(-25+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1))), 1 / Animation_Speed)
	end
	ATTACK = false
	Rooted = false
end

function fatetransition()
	ATTACK = true
	Rooted = true
	for i=0, 3.7, 0.1 / Animation_Speed do
		Swait()

		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(-1.3*SIZE-0 * COS(SINE / 15), 0*SIZE+0.15 * COS(SINE / 15), 0*SIZE+0 * COS(SINE / 15)) * ANGLES(RAD(160+0 * COS(SINE / 16)), RAD(0+10 * COS(SINE / 16)), RAD(45+0 * COS(SINE / 16))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(1.3*SIZE-0 * COS(SINE / 16), 0.1*SIZE+0.15 * COS(SINE / 16), 0*SIZE+0 * COS(SINE / 16)) * ANGLES(RAD(-25+15 * COS(SINE / 15)), RAD(-15+0 * COS(SINE / 15)), RAD(10+0 * COS(SINE / 15))) * LEFTSHOULDERC0, 1 / Animation_Speed)
		RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 15), 0*SIZE+1.2 * COS(SINE / 15), 2*SIZE+0.8 * COS(SINE / 10.5)) * ANGLES(RAD(0+-15 * COS(SINE / 16)), RAD(0+0 * COS(SINE / 16)), RAD(0+0 * COS(SINE / 16))), 1 / Animation_Speed)
		RightHip.C0 = Clerp(RightHip.C0, CF(0.5*SIZE+0 * COS(SINE / 17), -1*SIZE+0.2 * COS(SINE / 17), 0.5*SIZE+0.2 * COS(SINE / 17)) * ANGLES(RAD(-25+15 * COS(SINE / 16)), RAD(-15+5 * COS(SINE / 16)), RAD(0+0 * COS(SINE / 16))), 1 / Animation_Speed)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 17), 0*SIZE+0.2 * COS(SINE / 17), -0.4*SIZE+0.2 * COS(SINE / 17)) * ANGLES(RAD(-25+15 * COS(SINE / 16)), RAD(15+7 * COS(SINE / 16)), RAD(0+0 * COS(SINE / 16))), 1 / Animation_Speed)

	end
	for i=0, 4.7, 0.1 / Animation_Speed do
		Swait()
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(-1.3*SIZE-0 * COS(SINE / 15), 0.3*SIZE+0.15 * COS(SINE / 15), 0*SIZE+0 * COS(SINE / 15)) * ANGLES(RAD(90+10 * COS(SINE / 16)), RAD(0+10 * COS(SINE / 16)), RAD(0+0 * COS(SINE / 16))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(1.3*SIZE-0 * COS(SINE / 16), 0.1*SIZE+0.15 * COS(SINE / 16), 0*SIZE+0 * COS(SINE / 16)) * ANGLES(RAD(-25+15 * COS(SINE / 15)), RAD(-15+0 * COS(SINE / 15)), RAD(10+0 * COS(SINE / 15))) * LEFTSHOULDERC0, 1 / Animation_Speed)
		RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 15), 0*SIZE+1.2 * COS(SINE / 15), 2*SIZE+0.8 * COS(SINE / 10.5)) * ANGLES(RAD(0+-15 * COS(SINE / 16)), RAD(0+0 * COS(SINE / 16)), RAD(0+0 * COS(SINE / 16))), 1 / Animation_Speed)
		RightHip.C0 = Clerp(RightHip.C0, CF(0.5*SIZE+0 * COS(SINE / 17), -1*SIZE+0.2 * COS(SINE / 17), 0.5*SIZE+0.2 * COS(SINE / 17)) * ANGLES(RAD(-25+15 * COS(SINE / 16)), RAD(-15+5 * COS(SINE / 16)), RAD(0+0 * COS(SINE / 16))), 1 / Animation_Speed)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 17), 0*SIZE+0.2 * COS(SINE / 17), -0.4*SIZE+0.2 * COS(SINE / 17)) * ANGLES(RAD(-25+15 * COS(SINE / 16)), RAD(15+7 * COS(SINE / 16)), RAD(0+0 * COS(SINE / 16))), 1 / Animation_Speed)

	end
	ATTACK = false
	Rooted = false
end

Player.Chatted:Connect(function(Message)
if string.match(string.lower(Message), "/e id/") then
local remasteredid = string.lower(Message:sub(7)):match('%d+')
setsong(remasteredid)
end
end)

while true do
Swait()





script.Parent = WEAPONGUI
ANIMATE.Parent = nil
for _,v in next, Humanoid:GetPlayingAnimationTracks() do
v:Stop();
end
SINE = SINE + CHANGE


	local HITFLOOR = Character.HumanoidRootPart.Position - Vector3.new(0,1,0)
			if HITFLOOR then
				local HITPOS = HITFLOOR
				___________.Position = HITPOS	
			end
			for i,v in pairs(___________:GetChildren()) do
			if v.Name == "hi" then
			v.C0 = CFrame.Angles(0, math.rad((259 / (#__________ - 1)) * i + -SINE), 0) * CFrame.new(2 + kan.PlaybackLoudness/30,0,0)
			v.C1 = CFrame.Angles(-0, 0, -0) * CFrame.new(0,4.2,0)
			end
			end
local TORSOVELOCITY = (RootPart.Velocity * VT(1, 0, 1)).magnitude
local TORSOVERTICALVELOCITY = RootPart.Velocity.y
local HITFLOOR = Raycast(RootPart.Position, (CF(RootPart.Position, RootPart.Position + VT(0, -1, 0))).lookVector, 4*SIZE, Character)
local WALKSPEEDVALUE = 6 / (Humanoid.WalkSpeed / 16)
local forwardvec =  math.clamp((Torso.Velocity*Torso.CFrame.lookVector).X+(Torso.Velocity*Torso.CFrame.lookVector).Z,-Humanoid.WalkSpeed,Humanoid.WalkSpeed)
local sidevec = math.clamp((Torso.Velocity*Torso.CFrame.rightVector).X+(Torso.Velocity*Torso.CFrame.rightVector).Z,-Humanoid.WalkSpeed,Humanoid.WalkSpeed)
local sidevelocity = sidevec/Humanoid.WalkSpeed
local forwardvelocity = forwardvec/Humanoid.WalkSpeed
if -RootPart.Velocity.Y / 1.5 > -5 and -RootPart.Velocity.Y / 1.5 < 150 then
velocityYFall = RootPart.Velocity.Y / 1.5
elseif -RootPart.Velocity.Y / 1.5 < -5 then
velocityYFall = 5
elseif -RootPart.Velocity.Y / 1.5 > 150 then
velocityYFall = -150
end
if -RootPart.Velocity.Y / 180 > 0 and -RootPart.Velocity.Y / 180 < 1.2 then
velocityYFall2 = RootPart.Velocity.Y / 180
elseif -RootPart.Velocity.Y / 180 < 0 then
velocityYFall2 = 0
elseif -RootPart.Velocity.Y / 180 > 1.2 then
velocityYFall2 = -1.2
end
if -RootPart.Velocity.Y / 1.5 > -5 and -RootPart.Velocity.Y / 1.5 < 50 then
velocityYFall3 = RootPart.Velocity.Y / 1.5
elseif -RootPart.Velocity.Y / 1.5 < -5 then
velocityYFall3 = 5
elseif -RootPart.Velocity.Y / 1.5 > 50 then
velocityYFall3 = -50
end
if -RootPart.Velocity.Y / 1.5 > -50 and -RootPart.Velocity.Y / 1.5 < 20 then
velocityYFall4 = RootPart.Velocity.Y / 1.5
elseif -5 > -RootPart.Velocity.Y / 180 then
velocityYFall4 = 5
elseif -RootPart.Velocity.Y / 180 > 50 then
velocityYFall4 = -50
end
if RootPart.RotVelocity.Y / 6 < 1 and RootPart.RotVelocity.Y / 6 > -1 then
neckrotY = RootPart.RotVelocity.Y / 6
elseif RootPart.RotVelocity.Y / 6 < -1 then
neckrotY = -1
elseif RootPart.RotVelocity.Y / 6 > 1 then
neckrotY = 1
end
if RootPart.RotVelocity.Y / 8 < 0.6 and RootPart.RotVelocity.Y / 8 > -0.6 then
neckrotY2 = RootPart.RotVelocity.Y / 8
elseif RootPart.RotVelocity.Y / 8 < -0.6 then
neckrotY2 = -0.6
elseif RootPart.RotVelocity.Y / 8 > 0.6 then
neckrotY2 = 0.6
end
if RootPart.RotVelocity.Y / 6 < 0.2 and RootPart.RotVelocity.Y / 6 > -0.2 then
torsorotY = RootPart.RotVelocity.Y / 6
elseif RootPart.RotVelocity.Y / 6 < -0.2 then
torsorotY = -0.2
elseif RootPart.RotVelocity.Y / 6 > 0.2 then
torsorotY = 0.2
end
if RootPart.RotVelocity.Y / 8 < 0.2 and RootPart.RotVelocity.Y / 8 > -0.2 then
torsorotY2 = RootPart.RotVelocity.Y / 8
elseif RootPart.RotVelocity.Y / 8 < -0.2 then
torsorotY2 = -0.2
elseif RootPart.RotVelocity.Y / 8 > 0.2 then
torsorotY2 = 0.2
end
torsoY = -(Torso.Velocity * Vector3.new(1, 0, 1)).magnitude / 20
torsoY2 = -(Torso.Velocity * Vector3.new(1, 0, 1)).magnitude / 36
local rightvector = (RootPart.Velocity * RootPart.CFrame.rightVector).X + (RootPart.Velocity * RootPart.CFrame.rightVector).Z
local lookvector = (RootPart.Velocity * RootPart.CFrame.lookVector).X + (RootPart.Velocity * RootPart.CFrame.lookVector).Z
if lookvector > Humanoid.WalkSpeed then
lookvector = Humanoid.WalkSpeed
end
if lookvector < -Humanoid.WalkSpeed then
lookvector = -Humanoid.WalkSpeed
end
if rightvector > Humanoid.WalkSpeed then
rightvector = Humanoid.WalkSpeed
end
if rightvector < -Humanoid.WalkSpeed then
rightvector = -Humanoid.WalkSpeed
end
local lookvel = lookvector / Humanoid.WalkSpeed
local rightvel = rightvector / Humanoid.WalkSpeed
local leftlegheight,rightlegheight = 0,0
local Rray,Lray = Ray.new(RightLeg.Position,RightLeg.CFrame.UpVector.Unit*-2),Ray.new(LeftLeg.Position,LeftLeg.CFrame.UpVector.Unit*-2)
local rp,Rpos = workspace:FindPartOnRayWithIgnoreList(Rray,{Character},false,true)
local lp,Lpos = workspace:FindPartOnRayWithIgnoreList(Lray,{Character},false,true)
leftlegheight,rightlegheight = 0,0
if rp then   rightlegheight = (RightLeg.Position-Rpos).Magnitude-.95   end
if lp then   leftlegheight = (LeftLeg.Position-Lpos).Magnitude-.95   end
if HITFLOOR == nil then
		ANIM = "Midair"
		if ATTACK == false then
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, -1, 0) * ANGLES(math.rad(-(change * 20) - movement / 20 * math.cos(SINE / 2)) * (lookvector / (Humanoid.WalkSpeed * 2)) + math.rad(velocityYFall3 / 10), math.rad(0), math.rad(-(change * 20) - movement / 20 * math.cos(SINE / 2)) * (rightvector / (Humanoid.WalkSpeed * 2))), 1 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.55 - velocityYFall3 / 70, 0) * ANGLES(math.rad(-velocityYFall3 / 10), math.rad(0), math.rad(-velocityYFall)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.55 - velocityYFall3 / 70, 0) * ANGLES(math.rad(-velocityYFall3 / 10), math.rad(0), math.rad(velocityYFall)) * LEFTSHOULDERC0, 1 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(0.5, 0, -0.8) * ANGLES(math.rad(-25), math.rad(0), math.rad(2)), 1 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5, -0.925, 0) * ANGLES(math.rad(-35), math.rad(0), math.rad(-2)), 0.2 / Animation_Speed)
		end 
	elseif TORSOVELOCITY < 1 and HITFLOOR ~= nil then
		ANIM = "Idle"
		if ATTACK == false then
			if mode == 1 then
				sick.Pitch = 1
				NAMEMODE.Text = "LUNAR"
				NAMEMODE.Font = "SourceSansItalic"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(161, 183, 255)
				NAMEMODE.TextColor3 = Color3.fromRGB(209, 220, 255)
				CHAT.Text = "Welcome back."
				CHAT.Font = "SourceSansItalic"
				CHAT.TextStrokeColor3 = Color3.fromRGB(161, 183, 255)
				CHAT.TextColor3 = Color3.fromRGB(209, 220, 255)
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(-0.1+6*math.cos(SINE/25))), 1 / Animation_Speed)
				gunweld.C0 = Clerp(gunweld.C0, CF(0*SIZE+0 * COS(SINE / 15), 0*SIZE-0 * COS(SINE /15), 0*SIZE+0 * COS(SINE / 15)) * ANGLES(RAD(-0+0 * COS(SINE / 505)), RAD(-0+0* COS(SINE / 55)), RAD(0-0 * COS(SINE / 15))), 1 / Animation_Speed)
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 19), 0*SIZE+0 * COS(SINE / 19), 0*SIZE+0.2 * COS(SINE / 19)) * ANGLES(RAD(5+5 * COS(SINE / 20)), RAD(10+0 * COS(SINE / 20)), RAD(0+0 * COS(SINE / 20))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(-0.7*SIZE-0 * COS(SINE / 19), 0*SIZE+0.15 * COS(SINE / 19), -0.4*SIZE+0 * COS(SINE / 19)) * ANGLES(RAD(120+0 * COS(SINE / 20)), RAD(15+5 * COS(SINE / 20)), RAD(65+0 * COS(SINE / 20))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(1*SIZE-0 * COS(SINE / 19), 0*SIZE+0.15 * COS(SINE / 19), 0.3*SIZE+0 * COS(SINE / 19)) * ANGLES(RAD(-100+0 * COS(SINE / 20)), RAD(20+-5 * COS(SINE / 20)), RAD(-70+0 * COS(SINE / 20))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.5*SIZE+0 * COS(SINE / 19), -1.1*SIZE+-0.2 * COS(SINE / 19), 0*SIZE+0 * COS(SINE / 19)) * ANGLES(RAD(0+5 * COS(SINE / 20)), RAD(-10+0 * COS(SINE / 20)), RAD(10+0 * COS(SINE / 20))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.6*SIZE+0 * COS(SINE / 19), -0.9*SIZE+-0.2 * COS(SINE / 19), 0.3*SIZE+0 * COS(SINE / 19)) * ANGLES(RAD(0+5 * COS(SINE / 20)), RAD(0+0 * COS(SINE / 20)), RAD(-20+0 * COS(SINE / 20))), 1 / Animation_Speed)
			elseif mode == 2 then
				--setsong(2743829704)
				NAMEMODE.Text = "Prejudce"
				NAMEMODE.Font = "Ubuntu"
				NAMEMODE.TextColor3 = Color3.fromRGB(0, 0, 50)
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(10, 10, 10)

				CHAT.Text = "Think twice."
				CHAT.Font = "Ubuntu"
				CHAT.TextColor3 = Color3.fromRGB(0, 0, 50)
				CHAT.TextStrokeColor3 = Color3.fromRGB(10, 10, 10)
				Neck.C0 = Clerp(Neck.C0, CF(0,1,0)*ANGLES(math.rad(-90),math.rad(0),math.rad(210)), 1)

				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 13), 0*SIZE+0 * COS(SINE / 13), 1.5*SIZE+0.5 * COS(SINE / 13)) * ANGLES(RAD(0+10 * COS(SINE / 12)), RAD(0+3 * COS(SINE / 12)), RAD(0+0 * COS(SINE / 12))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.6*SIZE-0 * COS(SINE / 13), 0.3*SIZE+0.2 * COS(SINE / 13), 0*SIZE+0 * COS(SINE / 13)) * ANGLES(RAD(-25+0 * COS(SINE / 1)), RAD(-10+0 * COS(SINE / 1)), RAD(15+0 * COS(SINE / 1))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.6*SIZE-0 * COS(SINE / 12.5), 0*SIZE+-0.3 * COS(SINE / 12.5), 0*SIZE+0 * COS(SINE / 12.5)) * ANGLES(RAD(120+5 * COS(SINE / 14)), RAD(10+5 * COS(SINE / 14)), RAD(-15+5 * COS(SINE / 14))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.5*SIZE+0 * COS(SINE / 13.5), -1*SIZE+0.3 * COS(SINE / 13.5), 0*SIZE+0 * COS(SINE / 13.5)) * ANGLES(RAD(-10+5 * COS(SINE / 14)), RAD(-10+5 * COS(SINE / 14)), RAD(10+-5 * COS(SINE / 14))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 15), -0.5*SIZE+0.3 * COS(SINE / 15), 0*SIZE+0 * COS(SINE / 15)) * ANGLES(RAD(10+-10 * COS(SINE / 14.5)), RAD(10+2 * COS(SINE / 14.5)), RAD(-5+5 * COS(SINE / 14.5))), 1 / Animation_Speed)

			elseif mode == 3 then
				NAMEMODE.Text = "SOLITUDE"
				NAMEMODE.Font = "Antique"
				NAMEMODE.TextColor3 = Color3.fromRGB(0, 0, 0)
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)

				CHAT.Text = "TRAGETY IS DRAWN TO THE BITTER."
				CHAT.Font = "Antique"
				CHAT.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
				CHAT.TextColor3 = Color3.fromRGB(0, 0, 0)

				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/0.05)),math.rad(180+3*math.cos(SINE/0.05)),math.rad(-0.1+6*math.cos(SINE/0.02))), 1 / Animation_Speed)


				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 16), 0*SIZE+0 * COS(SINE / 16), -0.7*SIZE+0.2 * COS(SINE / 16)) * ANGLES(RAD(55+5 * COS(SINE / 15)), RAD(0+0 * COS(SINE / 15)), RAD(10+2 * COS(SINE / 15))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1*SIZE-0 * COS(SINE / 15.5), 1*SIZE+0 * COS(SINE / 15.5), -1*SIZE+0.2 * COS(SINE / 15.5)) * ANGLES(RAD(-140+10 * COS(SINE / 0.5)), RAD(0+0 * COS(SINE / 0.5)), RAD(-25+0 * COS(SINE / 0.5))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1*SIZE-0 * COS(SINE / 15.5), 1*SIZE+0 * COS(SINE / 15.5), -1*SIZE+0.2 * COS(SINE / 15.5)) * ANGLES(RAD(-155+-15 * COS(SINE / 0.5)), RAD(0+0 * COS(SINE / 0.5)), RAD(25+0 * COS(SINE / 0.5))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.6*SIZE+0 * COS(SINE / 16), -1*SIZE+0 * COS(SINE / 16), -0.5*SIZE+-0.2 * COS(SINE / 16)) * ANGLES(RAD(-25+5 * COS(SINE / 15)), RAD(-25+3 * COS(SINE / 15)), RAD(8+4 * COS(SINE / 15))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.6*SIZE+0 * COS(SINE / 16), 0*SIZE+0 * COS(SINE / 16), -0.3*SIZE+-0.2 * COS(SINE / 16)) * ANGLES(RAD(45+0 * COS(SINE / 15)), RAD(5+-4 * COS(SINE / 15)), RAD(0+0 * COS(SINE / 15))), 1 / Animation_Speed)
			elseif mode == 4 then
				Humanoid.WalkSpeed = 30
				NAMEMODE.Text = "HOTLINE"
				NAMEMODE.Font = "SourceSans"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
				NAMEMODE.TextColor3 = Color3.fromRGB(0, 0, 0)
				CHAT.Text = "FIRE!"
				CHAT.Font = "SourceSans"
				CHAT.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
				CHAT.TextColor3 = Color3.fromRGB(0, 0, 0)
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(-0.1+6*math.cos(SINE/25))), 1 / Animation_Speed)
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 20), 0*SIZE+0 * COS(SINE / 20), 0*SIZE+0.2 * COS(SINE / 20)) * ANGLES(RAD(15+3 * COS(SINE / 21)), RAD(15+0 * COS(SINE / 21)), RAD(-25+0 * COS(SINE / 21))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.7*SIZE-0 * COS(SINE / 20), 0*SIZE+0.15 * COS(SINE / 20), 0.5*SIZE+0 * COS(SINE / 20)) * ANGLES(RAD(60+-9 * COS(SINE / 21)), RAD(-25+6 * COS(SINE / 21)), RAD(30+6 * COS(SINE / 21))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1*SIZE-0 * COS(SINE / 20), 0.5*SIZE+0.15 * COS(SINE / 20), 1*SIZE+0 * COS(SINE / 20)) * ANGLES(RAD(-120+9 * COS(SINE / 21)), RAD(-15+-7 * COS(SINE / 21)), RAD(70+6 * COS(SINE / 21))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.5*SIZE+0 * COS(SINE / 20), -1.2*SIZE+-0.2 * COS(SINE / 20), 0.3*SIZE+0 * COS(SINE / 20)) * ANGLES(RAD(-20+3 * COS(SINE / 21)), RAD(-25+3 * COS(SINE / 21)), RAD(5+0 * COS(SINE / 21))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 20), -1*SIZE+-0.2 * COS(SINE / 20), 0*SIZE+0 * COS(SINE / 20)) * ANGLES(RAD(25+3 * COS(SINE / 21)), RAD(25+-3 * COS(SINE / 21)), RAD(-25+5 * COS(SINE / 21))), 1 / Animation_Speed)

			elseif mode == 5 then
				--setsong(2695321137)
				Humanoid.WalkSpeed = 30
				NAMEMODE.Text = "POWER"
				NAMEMODE.Font = "Antique"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(255, 98, 0)
				NAMEMODE.TextColor3 = Color3.fromRGB(0, 0, 0)

				CHAT.Text = "THE WORLD QUAKES BENETHE ME!"
				CHAT.Font = "Antique"
				CHAT.TextStrokeColor3 = Color3.fromRGB(255, 98, 0)
				CHAT.TextColor3 = Color3.fromRGB(0, 0, 0)
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(-0.1+6*math.cos(SINE/25))), 1 / Animation_Speed)


				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 13), 0*SIZE+0 * COS(SINE / 13), 0*SIZE+0.5 * COS(SINE / 13)) * ANGLES(RAD(0+5 * COS(SINE / 14)), RAD(0+0 * COS(SINE / 14)), RAD(0+0 * COS(SINE / 14))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.6*SIZE-0 * COS(SINE / 13.5), 0*SIZE+0.3 * COS(SINE / 13.5), 0.3*SIZE+0 * COS(SINE / 13.5)) * ANGLES(RAD(10+5 * COS(SINE / 12)), RAD(10+5 * COS(SINE / 12)), RAD(-20+0 * COS(SINE / 12))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.6*SIZE-0 * COS(SINE / 13), 0*SIZE+0.3 * COS(SINE / 13), 0*SIZE+0 * COS(SINE / 13)) * ANGLES(RAD(120+5 * COS(SINE / 11.5)), RAD(10+5 * COS(SINE / 11.5)), RAD(-15+5 * COS(SINE / 11.5))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.5*SIZE+0 * COS(SINE / 13), -1*SIZE+-0.3 * COS(SINE / 13), 0.1*SIZE+0 * COS(SINE / 13)) * ANGLES(RAD(0+0.5 * COS(SINE / 11)), RAD(-10+0 * COS(SINE / 11)), RAD(8+2 * COS(SINE / 11))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 13), -1.2*SIZE+-0.5 * COS(SINE / 13), 0*SIZE+0 * COS(SINE / 13)) * ANGLES(RAD(5+0 * COS(SINE / 13)), RAD(15+0 * COS(SINE / 13)), RAD(-15+0 * COS(SINE / 13))), 1 / Animation_Speed)

			elseif mode == 6 then
				--setsong(5768466361)
				Humanoid.WalkSpeed = 15
				NAMEMODE.Text = "r e l a x a t i o n"
				NAMEMODE.Font = "SourceSansItalic"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(50, 50, 100)
				NAMEMODE.TextColor3 = Color3.new(0,0,0+(sick.PlaybackLoudness * 0.002))

				CHAT.Text = "Just chill man.."
				CHAT.Font = "SourceSansItalic"
				CHAT.TextStrokeColor3 = Color3.fromRGB(50, 50, 100)
				CHAT.TextColor3 = Color3.new(0,0,0+(sick.PlaybackLoudness * 0.002))
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(-0.1+6*math.cos(SINE/25))), 1 / Animation_Speed)


				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 25), 0*SIZE+0 * COS(SINE / 25), 0*SIZE+-0.4 * COS(SINE / 25)) * ANGLES(RAD(-65.06+-8.67 * COS(SINE / 27)), RAD(0+0 * COS(SINE / 27)), RAD(0+0 * COS(SINE / 27))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1*SIZE-0 * COS(SINE / 25), 1*SIZE+-0.1 * COS(SINE / 25), 0.4*SIZE+0 * COS(SINE / 25)) * ANGLES(RAD(180+-6 * COS(SINE / 27)), RAD(-35+6 * COS(SINE / 27)), RAD(-60+6 * COS(SINE / 27))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.6*SIZE-0 * COS(SINE / 13), 0.5*SIZE+0.1 * COS(SINE / 13), 0.4*SIZE+0.1 * COS(SINE / 13)) * ANGLES(RAD(-31+-5 * COS(SINE / 35)), RAD(25+-5 * COS(SINE / 35)), RAD(-35+-5 * COS(SINE / 13.5))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.36*SIZE+0 * COS(SINE / 25), -0.36*SIZE+0 * COS(SINE / 25), -0.72*SIZE+0.1 * COS(SINE / 25)) * ANGLES(RAD(-56.39+8 * COS(SINE / 27)), RAD(-25+-8 * COS(SINE / 27)), RAD(17.35+-5 * COS(SINE / 27))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.36*SIZE+0 * COS(SINE / 25), -1*SIZE+0.1 * COS(SINE / 25), 0*SIZE+0.1 * COS(SINE / 25)) * ANGLES(RAD(-43.37+8 * COS(SINE / 27)), RAD(26+8 * COS(SINE / 27)), RAD(0+5 * COS(SINE / 27))), 1 / Animation_Speed)

			elseif mode == 7 then
				--setsong(5947795746)
				Humanoid.WalkSpeed = 10
				NAMEMODE.Text = "ZEN"
				NAMEMODE.Font = "SourceSansItalic"
				NAMEMODE.TextColor3 = Color3.fromRGB(200, 200, 200)
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(150, 150, 150)

				CHAT.Text = "power of the mind.."
				CHAT.Font = "SourceSansItalic"
				CHAT.TextColor3 = Color3.fromRGB(200, 200, 200)
				CHAT.TextStrokeColor3 = Color3.fromRGB(150, 150, 150)
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(-0.1+6*math.cos(SINE/25))), 1 / Animation_Speed)


				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 20), 0*SIZE+0 * COS(SINE / 20), 2.5*SIZE+0.5 * COS(SINE / 20)) * ANGLES(RAD(0+5 * COS(SINE / 19)), RAD(0+0 * COS(SINE / 19)), RAD(0+0 * COS(SINE / 19))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1*SIZE-0 * COS(SINE / 1), -0.3*SIZE+0 * COS(SINE / 1), -0.5*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(25+10 * COS(SINE / 20.5)), RAD(-10+5 * COS(SINE / 20.5)), RAD(-80+0 * COS(SINE / 20.5))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.6*SIZE-0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(150+10 * COS(SINE / 20)), RAD(-5+5 * COS(SINE / 20)), RAD(10+5 * COS(SINE / 20))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(1.3*SIZE+0 * COS(SINE / 1), -1*SIZE+0 * COS(SINE / 1), -0.3*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(5+10 * COS(SINE / 19.5)), RAD(0+10 * COS(SINE / 19.5)), RAD(-80+0 * COS(SINE / 19.5))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-1.3*SIZE+0 * COS(SINE / 10), -1*SIZE+0 * COS(SINE / 10), -0.4*SIZE+0 * COS(SINE / 10)) * ANGLES(RAD(5+10 * COS(SINE / 19.5)), RAD(0+-10 * COS(SINE / 19.5)), RAD(80+0 * COS(SINE / 19.5))), 1 / Animation_Speed)
			elseif mode == 8 then
				Humanoid.WalkSpeed = 50
				NAMEMODE.Text = "DESTRUCTION"
				NAMEMODE.Font = "SpecialElite"
				NAMEMODE.TextColor3 = Color3.fromRGB(50, 0, 0)
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(100, 0, 0)
				CHAT.Text = "FALL!"
				CHAT.Font = "Antique"
				CHAT.TextColor3 = Color3.fromRGB(50, 0, 0)
				CHAT.TextStrokeColor3 = Color3.fromRGB(100, 0, 0)
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(-0.1+6*math.cos(SINE/25))), 1 / Animation_Speed)
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 13), 0*SIZE+0 * COS(SINE / 13), 1*SIZE+0.5 * COS(SINE / 13)) * ANGLES(RAD(-25+15 * COS(SINE / 12)), RAD(10+2 * COS(SINE / 12)), RAD(0+0 * COS(SINE / 12))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(-1*SIZE-0 * COS(SINE / 12.5), 0.3*SIZE+0.3 * COS(SINE / 12.5), 0.3*SIZE+0 * COS(SINE / 12.5)) * ANGLES(RAD(10+0 * COS(SINE / 14)), RAD(-15+10 * COS(SINE / 14)), RAD(45+10 * COS(SINE / 14))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(1.3*SIZE-0 * COS(SINE / 12.5), 0.5*SIZE+0.2 * COS(SINE / 12.5), 0*SIZE+0.2 * COS(SINE / 12.5)) * ANGLES(RAD(230+10 * COS(SINE / 13.5)), RAD(20+10 * COS(SINE / 13.5)), RAD(-30+5 * COS(SINE / 13.5))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.5*SIZE+0 * COS(SINE / 1), -1*SIZE+0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(-25+10 * COS(SINE / 14.5)), RAD(-8+5 * COS(SINE / 14.5)), RAD(8+10 * COS(SINE / 14.5))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 15), -0.3*SIZE+0.2 * COS(SINE / 15), 0*SIZE+0 * COS(SINE / 15)) * ANGLES(RAD(15+-10 * COS(SINE / 15.5)), RAD(8+15 * COS(SINE / 15.5)), RAD(-8+5 * COS(SINE / 15.5))), 1 / Animation_Speed)
			elseif mode == 9 then
				Humanoid.WalkSpeed = 35
				NAMEMODE.Text = "SUS"
				NAMEMODE.Font = "Highway"
				NAMEMODE.TextColor3 = Color3.fromRGB(255, 255, 255)
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(200, 200, 200)
				CHAT.Text = "NO IM NOT THE IMPOSTER!!"
				CHAT.Font = "Highway"
				CHAT.TextColor3 = Color3.fromRGB(255, 255, 255)
				CHAT.TextStrokeColor3 = Color3.fromRGB(200, 200, 200)
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(-0.1+6*math.cos(SINE/25))), 1 / Animation_Speed)
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 13), 0*SIZE+0 * COS(SINE / 13), 0*SIZE+0.2 * COS(SINE / 13)) * ANGLES(RAD(0+6 * COS(SINE / 13.5)), RAD(0+0 * COS(SINE / 13.5)), RAD(0+0 * COS(SINE / 13.5))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(0.6*SIZE-0 * COS(SINE / 1), -0.5*SIZE+0 * COS(SINE / 1), 0.9*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(180+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-0.6*SIZE-0 * COS(SINE / 1), -0.5*SIZE+0 * COS(SINE / 1), 0.9*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(180+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.5*SIZE+0 * COS(SINE / 13), -1*SIZE+-0.2 * COS(SINE / 13), -0.2*SIZE+0 * COS(SINE / 13)) * ANGLES(RAD(-5+8 * COS(SINE / 13.5)), RAD(-20+0 * COS(SINE / 13.5)), RAD(8+0 * COS(SINE / 13.5))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 13), -1*SIZE+-0.2 * COS(SINE / 13), -0.2*SIZE+0 * COS(SINE / 13)) * ANGLES(RAD(-5+8 * COS(SINE / 13.5)), RAD(20+0 * COS(SINE / 13.5)), RAD(-8+0 * COS(SINE / 13.5))), 1 / Animation_Speed)
			elseif mode == 10 then
				Humanoid.WalkSpeed = 40
				NAMEMODE.Text = "CMD_446"
				NAMEMODE.Font = "Arcade"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(255, 0, 0)
				NAMEMODE.TextColor3 = Color3.fromRGB(100, 0, 0)
				CHAT.Text = "ERROR404"
				CHAT.Font = "Arcade"
				CHAT.TextStrokeColor3 = Color3.fromRGB(255, 0, 0)
				CHAT.TextColor3 = Color3.fromRGB(100, 0, 0)
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/0.05)),math.rad(180+3*math.cos(SINE/0.05)),math.rad(-0.1+6*math.cos(SINE/0.02))), 1 / Animation_Speed)
				if MRANDOM(1,30) == 1 then
					Neck.C0 = Clerp(Neck.C0,NECKC0 * ANGLES(RAD(20+MRANDOM(-20,20)),RAD((10*COS(SINE/100))+MRANDOM(-20,20)),RAD(MRANDOM(-20,20))),1)
				end
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 13), 0*SIZE+0 * COS(SINE / 13), 2.5*SIZE+0.5 * COS(SINE / 13)) * ANGLES(RAD(60+10 * COS(SINE / 14)), RAD(0+0 * COS(SINE / 14)), RAD(0+0 * COS(SINE / 14))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.3*SIZE-0 * COS(SINE / 0.3), 1*SIZE+0 * COS(SINE / 0.3), -1*SIZE+0.3 * COS(SINE / 0.3)) * ANGLES(RAD(-150+10 * COS(SINE / 0.2)), RAD(10+0 * COS(SINE / 0.2)), RAD(-40+0 * COS(SINE / 0.2))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.6*SIZE-0 * COS(SINE / 13), 0*SIZE+0 * COS(SINE / 13), 0*SIZE+0.2 * COS(SINE / 13)) * ANGLES(RAD(60+15 * COS(SINE / 14)), RAD(0+0 * COS(SINE / 14)), RAD(0+0 * COS(SINE / 14))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.5*SIZE+0 * COS(SINE / 1), -0.5*SIZE+0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(15+10 * COS(SINE / 13.5)), RAD(-10+5 * COS(SINE / 13.5)), RAD(0+0 * COS(SINE / 13.5))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 1), -1*SIZE+0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(-25+15 * COS(SINE / 12)), RAD(10+5 * COS(SINE / 12)), RAD(0+0 * COS(SINE / 12))), 1 / Animation_Speed)
			elseif mode == 11 then
				Humanoid.WalkSpeed = 30
				NAMEMODE.Text = "E R A D I C A T I O N"
				NAMEMODE.Font = "Fantasy"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
				NAMEMODE.TextColor3 = Color3.fromRGB(100, 100, 100)
				CHAT.Text = "RID OF YOUR EXISTANCE!"
				CHAT.Font = "Fantasy"
				CHAT.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
				CHAT.TextColor3 = Color3.fromRGB(100, 100, 100)
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(-0.1+6*math.cos(SINE/25))), 1 / Animation_Speed)
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 13.5), 0*SIZE+0 * COS(SINE / 13.5), 0*SIZE+-0.5 * COS(SINE / 13.5)) * ANGLES(RAD(0+10 * COS(SINE / 13)), RAD(0+0 * COS(SINE / 13)), RAD(0+0 * COS(SINE / 13))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(-0.8*SIZE-0 * COS(SINE / 12), 0*SIZE+0.3 * COS(SINE / 12), -0.5*SIZE+0 * COS(SINE / 12)) * ANGLES(RAD(70+5 * COS(SINE / 13)), RAD(-10+5 * COS(SINE / 13)), RAD(60+0 * COS(SINE / 13))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(0.6*SIZE-0 * COS(SINE / 12), 0.3*SIZE+0.2 * COS(SINE / 12), -0.5*SIZE+0 * COS(SINE / 12)) * ANGLES(RAD(100+10 * COS(SINE / 15)), RAD(-10+5 * COS(SINE / 15)), RAD(-80+0 * COS(SINE / 15))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.6*SIZE+0 * COS(SINE / 13.5), -1*SIZE+0.3 * COS(SINE / 13.5), -0.2*SIZE+0 * COS(SINE / 13.5)) * ANGLES(RAD(-10+10 * COS(SINE / 13)), RAD(-25+10 * COS(SINE / 13)), RAD(8+5 * COS(SINE / 13))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.6*SIZE+0 * COS(SINE / 13.5), -1*SIZE+0.3 * COS(SINE / 13.5), 0*SIZE+0 * COS(SINE / 13.5)) * ANGLES(RAD(-10+10 * COS(SINE / 13)), RAD(25+10 * COS(SINE / 13)), RAD(-8+-5 * COS(SINE / 13))), 1 / Animation_Speed)
			elseif mode == 12 then
				Humanoid.WalkSpeed = 60
				NAMEMODE.Text = "SKY"
				NAMEMODE.Font = "Highway"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(200, 200, 255)
				NAMEMODE.TextColor3 = Color3.fromRGB(255, 255, 255)
				CHAT.Text = "Above and beyond!"
				CHAT.Font = "Highway"
				CHAT.TextStrokeColor3 = Color3.fromRGB(200, 200, 255)
				CHAT.TextColor3 = Color3.fromRGB(255, 255, 255)
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(-0.1+6*math.cos(SINE/25))), 1 / Animation_Speed)
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 15), 0*SIZE+1 * COS(SINE / 15), 15*SIZE+3 * COS(SINE / 15)) * ANGLES(RAD(10+10 * COS(SINE / 12)), RAD(0+10 * COS(SINE / 12)), RAD(0+0 * COS(SINE / 12))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(-1.3*SIZE-0 * COS(SINE / 14), 0.1*SIZE+-0.3 * COS(SINE / 14), 0*SIZE+0 * COS(SINE / 14)) * ANGLES(RAD(0+30 * COS(SINE / 12)), RAD(10+10 * COS(SINE / 12)), RAD(-25+-10 * COS(SINE / 12))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(1.3*SIZE-0 * COS(SINE / 13), 0*SIZE+0.3 * COS(SINE / 13), 0*SIZE+0 * COS(SINE / 13)) * ANGLES(RAD(140+10 * COS(SINE / 13)), RAD(0+0 * COS(SINE / 13)), RAD(25+0 * COS(SINE / 13))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.5*SIZE+0 * COS(SINE / 1), -1*SIZE+0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(-10+35 * COS(SINE / 11)), RAD(-10+0 * COS(SINE / 11)), RAD(10+0 * COS(SINE / 11))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 12.5), -0.3*SIZE+0.3 * COS(SINE / 12.5), 0*SIZE+0 * COS(SINE / 12.5)) * ANGLES(RAD(-10+35 * COS(SINE / 13.5)), RAD(10+10 * COS(SINE / 13.5)), RAD(-10+0 * COS(SINE / 13.5))), 1 / Animation_Speed)
			elseif mode == 13 then
				Humanoid.WalkSpeed = 50
				NAMEMODE.Text = "Onslaught"
				NAMEMODE.Font = "SciFi"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(50, 50, 50)
				NAMEMODE.TextColor3 = Color3.fromRGB(100, 100, 100)
				CHAT.Text = "Go ahead, run."
				CHAT.Font = "SciFi"
				CHAT.TextStrokeColor3 = Color3.fromRGB(50, 50, 50)
				CHAT.TextColor3 = Color3.fromRGB(100, 100, 100)
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(-20+4*math.cos(SINE/18))), 1 / Animation_Speed)
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 19), 0*SIZE+0 * COS(SINE / 19), 0*SIZE+0.2 * COS(SINE / 19)) * ANGLES(RAD(0+5 * COS(SINE / 20)), RAD(0+0 * COS(SINE / 20)), RAD(0+0 * COS(SINE / 20))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.6*SIZE-0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(95+2 * COS(SINE / 20.5)), RAD(0+5 * COS(SINE / 20.5)), RAD(25+5 * COS(SINE / 20.5))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.6*SIZE-0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(-170+5 * COS(SINE / 19.5)), RAD(5+5 * COS(SINE / 19.5)), RAD(3+5 * COS(SINE / 19.5))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.5*SIZE+0 * COS(SINE / 19), -1*SIZE+-0.2 * COS(SINE / 19), 0*SIZE+0 * COS(SINE / 19)) * ANGLES(RAD(0+10 * COS(SINE / 20)), RAD(-15+5 * COS(SINE / 20)), RAD(5+2 * COS(SINE / 20))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 19), -1*SIZE+-0.1 * COS(SINE / 19), 0*SIZE+0 * COS(SINE / 19)) * ANGLES(RAD(-15+10 * COS(SINE / 20)), RAD(15+5 * COS(SINE / 20)), RAD(-10+3 * COS(SINE / 20))), 1 / Animation_Speed)
			elseif mode == 14 then
				Humanoid.WalkSpeed = 30
				NAMEMODE.Text = "Affectionate"
				NAMEMODE.Font = "Highway"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(217+(sick.PlaybackLoudness * .3), 67+(sick.PlaybackLoudness * .3), 192+(sick.PlaybackLoudness * .3))
				NAMEMODE.TextColor3 = Color3.fromRGB(255, 120, 232)
				CHAT.Text = "Hi, sweetheart.."
				CHAT.Font = "Highway"
				CHAT.TextStrokeColor3 = Color3.fromRGB(217+(sick.PlaybackLoudness * .3), 67+(sick.PlaybackLoudness * .3), 192+(sick.PlaybackLoudness * .3))
				CHAT.TextColor3 = Color3.fromRGB(255, 120, 232)
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(200+5*math.cos(SINE/28)),math.rad(-0.1+6*math.cos(SINE/25))), 1 / Animation_Speed)
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE+.2 * math.sin(SINE / 32), 0*SIZE+0 * COS(SINE / 1), 0*SIZE+.1 * math.cos(SINE / 32)) * ANGLES(math.rad(-9.6), RAD(4.7+5 * math.sin(SINE / 32)), RAD(29.2+0 * COS(SINE / 1))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1*SIZE-0 * COS(SINE / 20), 0*SIZE+0.2 * COS(SINE / 20), 1*SIZE+0 * COS(SINE / 20)) * ANGLES(RAD(10+0 * COS(SINE / 21)), RAD(25+0 * COS(SINE / 21)), RAD(-35+-5 * COS(SINE / 21))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1*SIZE-0 * COS(SINE / 20), 0*SIZE+0.2 * COS(SINE / 20), 1*SIZE+0 * COS(SINE / 20)) * ANGLES(RAD(10+0 * COS(SINE / 21)), RAD(-25+0 * COS(SINE / 21)), RAD(25+5 * COS(SINE / 21))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.9*SIZE+.1 * SIN(SINE / 32), -1*SIZE-.1 * COS(SINE / 32)-.05*math.sin(SINE/32)-rightlegheight, -.3*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(-1.8),math.rad(-20.1),math.rad(-17.4-5*math.sin(SINE/32)))*ANGLES(math.rad(0),math.rad(90),math.rad(0)), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-1.1*SIZE+.1 * SIN(SINE / 32), -.8*SIZE-.1 * COS(SINE / 32)+.05*math.sin(SINE/32)-leftlegheight, 0.1*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(-26.6),math.rad(23.2),math.rad(9.5-5*math.sin(SINE/32)))*ANGLES(math.rad(0),math.rad(-90),math.rad(0)), 1 / Animation_Speed) 
			elseif mode == 15 then
				Humanoid.WalkSpeed = 45
				NAMEMODE.Text = "M A L I C E"
				NAMEMODE.Font = "Antique"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
				NAMEMODE.TextColor3 = Color3.fromRGB(10, 10, 10)
				CHAT.Text = "DIE DIE DIE!"
				CHAT.Font = "Antique"
				CHAT.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
				CHAT.TextColor3 = Color3.fromRGB(10, 10, 10)
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(-0.1+6*math.cos(SINE/25))), 1 / Animation_Speed)
				if MRANDOM(1,5) == 1 then
					Neck.C0 = Clerp(Neck.C0,NECKC0 * ANGLES(RAD(20+MRANDOM(-20,20)),RAD((10*COS(SINE/100))+MRANDOM(-20,20)),RAD(MRANDOM(-20,20))),1)
				end
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 16), 0*SIZE+0 * COS(SINE / 16), 2.5*SIZE+1 * COS(SINE / 16)) * ANGLES(RAD(10+MRANDOM(-10,10) * COS(SINE / 1)), RAD(-10+MRANDOM(-10,10) * COS(SINE / 1)), RAD(0+MRANDOM(-10,10) * COS(SINE / 1))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.3*SIZE-0 * COS(SINE / 16), 0*SIZE+0.15 * COS(SINE / 16), -0.5*SIZE+0 * COS(SINE / 16)) * ANGLES(RAD(200+5 * COS(SINE / 17)), RAD(25+5 * COS(SINE / 17)), RAD(-35+0 * COS(SINE / 17))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.6*SIZE-0 * COS(SINE / 16), 0.3*SIZE+0.15 * COS(SINE / 16), 0*SIZE+0 * COS(SINE / 16)) * ANGLES(RAD(-25+10 * COS(SINE / 17)), RAD(0+0 * COS(SINE / 17)), RAD(-35+10 * COS(SINE / 17))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.5*SIZE+0 * COS(SINE / 16), -1*SIZE+0 * COS(SINE / 16), 0.3*SIZE+0 * COS(SINE / 16)) * ANGLES(RAD(-20+-10 * COS(SINE / 17)), RAD(-10+5 * COS(SINE / 17)), RAD(10+0 * COS(SINE / 17))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE+0 * COS(SINE / 16), -1*SIZE+0.15 * COS(SINE / 16), -0.3*SIZE+0 * COS(SINE / 16)) * ANGLES(RAD(-100+0 * COS(SINE / 17)), RAD(10+10 * COS(SINE / 17)), RAD(45+0 * COS(SINE / 17))), 1 / Animation_Speed)
			elseif mode == 16 then
				Humanoid.WalkSpeed = 30
				NAMEMODE.Text = "IMMORTALITY LORD"
				NAMEMODE.Font = "Antique"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
				NAMEMODE.TextColor3 = Color3.fromRGB(10, 10, 10)
				CHAT.Text = "Power."
				CHAT.Font = "Antique"
				CHAT.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
				CHAT.TextColor3 = Color3.fromRGB(10, 10, 10)
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/0.05)),math.rad(180+3*math.cos(SINE/0.05)),math.rad(-0.1+6*math.cos(SINE/0.02))), 1 / Animation_Speed)
				if MRANDOM(1,15) == 1 then
					Neck.C0 = Clerp(Neck.C0,NECKC0 * ANGLES(RAD(20+MRANDOM(-20,20)),RAD((10*COS(SINE/100))+MRANDOM(-20,20)),RAD(MRANDOM(-20,20))),1)
				end

				gunweld.C0 = Clerp(gunweld.C0, CF(0.3*SIZE+0 * COS(SINE / 15), -0.5*SIZE+0 * COS(SINE /15), 0*SIZE+0 * COS(SINE / 15)) * ANGLES(RAD(-0-0 * COS(SINE / 15)), RAD(-0+0* COS(SINE / 15)), RAD(20+0 * COS(SINE / 1))), 1 / Animation_Speed)
				--	gunweld.C0 = Clerp(gunweld.C0, CF(0*SIZE+0 * COS(SINE / 15), -1.4*SIZE-0 * COS(SINE /15), 0*SIZE+0 * COS(SINE / 15)) * ANGLES(RAD(-0-0 * COS(SINE / 15)), RAD(-0+0* COS(SINE / 15)), RAD(20+0 * COS(SINE / 1))), 1 / Animation_Speed)
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0,0.5,2 - .5 * SIN(SINE/14)) * ANGLES(RAD(20),RAD(0),RAD(0)),.7/3)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0,CF(1.3,.5,0)*ANGLES(RAD(-10+0*COS(SINE/15)),160,RAD(0))*RIGHTSHOULDERC0,.25)
				RightShoulder.C0 = Clerp(RightShoulder.C0,CF(-1.5,.5,0) * ANGLES(RAD(20),RAD(10),RAD(-10-10*SIN(SINE/15))) * LEFTSHOULDERC0,.7/3)
				RightHip.C0 = Clerp(RightHip.C0,CF(1,-1,-.0) * ANGLES(RAD(10),RAD(80),RAD(10+10*SIN(SINE/15))),1/3)
				LeftHip.C0 = Clerp(LeftHip.C0,CF(-1,-1,-.0) * ANGLES(RAD(20),RAD(-80),RAD(-10-10*SIN(SINE/15))),1/3)
			elseif mode == 17 then
				Humanoid.WalkSpeed = 15
				NAMEMODE.Text = "Vibin.."
				NAMEMODE.Font = "SciFi"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(0, 0, 30)
				NAMEMODE.TextColor3 = Color3.fromRGB(10, 10, 10)
				CHAT.Text = "Just vibing.."
				CHAT.Font = "SciFi"
				CHAT.TextStrokeColor3 = Color3.fromRGB(0, 0, 30)
				CHAT.TextColor3 = Color3.fromRGB(10, 10, 10)
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(70.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(-0.1+6*math.cos(SINE/25))), 1 / Animation_Speed)

				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 6), 0*SIZE+0 * COS(SINE / 6), 1*SIZE+0.15 * math.sin(SINE / 6)) * ANGLES(math.rad(-40.3+3*math.sin(SINE/9)), RAD(0+0 * COS(SINE / 6.5)), RAD(0+0 * COS(SINE / 6.5))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.6*SIZE-0 * COS(SINE / 10), 0.3*SIZE+0.1 * math.sin(SINE / 8), 0*SIZE+0 * COS(SINE / 10)) * ANGLES(RAD(-55+0 * COS(SINE / 10)), RAD(-10+0 * COS(SINE / 10)), math.rad(25.7+-10*math.sin(SINE/10))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.6*SIZE-0 * COS(SINE / 10), 0.3*SIZE+0.15 * math.sin(SINE / 8), 0*SIZE+0 * COS(SINE / 10)) * ANGLES(RAD(-55+0 * COS(SINE / 10)), RAD(10+0 * COS(SINE / 10)), math.rad(-25+10*math.sin(SINE/10))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.3*SIZE+0 * COS(SINE / 1), -1.5*SIZE+0 * COS(SINE / 1), 0.3*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(40+10 * math.sin(SINE/9)), RAD(-15+0 * COS(SINE / 1)), RAD(8+0 * COS(SINE / 1))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1), -1*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(-35+10 * math.sin(SINE/9)), RAD(14+0 * COS(SINE / 1)), RAD(-8+0 * COS(SINE / 1))), 1 / Animation_Speed)
			elseif mode == 18 then
				Humanoid.WalkSpeed = 30
				NAMEMODE.Text = "BLASPHEMY"
				NAMEMODE.Font = "Ubuntu"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(0, 0, 255)
				NAMEMODE.TextColor3 = Color3.fromRGB(10, 10, 10)
				CHAT.Text = "JUST SHUT UP!"
				CHAT.Font = "Ubuntu"
				CHAT.TextStrokeColor3 = Color3.fromRGB(0, 0, 255)
				CHAT.TextColor3 = Color3.fromRGB(10, 10, 10)
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(-0.1+6*math.cos(SINE/25))), 1 / Animation_Speed)
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 20), 0*SIZE+0 * COS(SINE / 20), 0*SIZE+0.3 * COS(SINE / 20)) * ANGLES(RAD(0+3 * COS(SINE / 21)), RAD(15+4 * COS(SINE / 21)), RAD(15+0 * COS(SINE / 21))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.7*SIZE-0 * COS(SINE / 20), 0*SIZE+0.15 * COS(SINE / 20), 0*SIZE+0 * COS(SINE / 20)) * ANGLES(RAD(50+4 * COS(SINE / 21)), RAD(25+5 * COS(SINE / 21)), RAD(35+0 * COS(SINE / 21))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.6*SIZE-0 * COS(SINE / 20), 0*SIZE+0 * COS(SINE / 20), 0*SIZE+0 * COS(SINE / 20)) * ANGLES(RAD(120+4 * COS(SINE / 21)), RAD(15+0 * COS(SINE / 20.5)), RAD(-25+0 * COS(SINE / 20.5))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.5*SIZE+0 * COS(SINE / 20), -1.35*SIZE+-0.3 * COS(SINE / 20), 0.3*SIZE+0 * COS(SINE / 20)) * ANGLES(RAD(-15+0 * COS(SINE / 21)), RAD(-20+6 * COS(SINE / 21)), RAD(25+-4 * COS(SINE / 21))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 20), -1*SIZE+-0.3 * COS(SINE / 20), 0*SIZE+0 * COS(SINE / 20)) * ANGLES(RAD(0+0 * COS(SINE / 21)), RAD(15+4 * COS(SINE / 21)), RAD(-15+0 * COS(SINE / 21))), 1 / Animation_Speed)
			elseif mode == 19 then
				Humanoid.WalkSpeed = 30
				NAMEMODE.Text = "besmirch"
				NAMEMODE.Font = "Garamond"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(217, 147, 72)
				NAMEMODE.TextColor3 = Color3.fromRGB(48, 33, 16)
				CHAT.Text = "Watch as civilization collapses.."
				CHAT.Font = "Garamond"
				CHAT.TextStrokeColor3 = Color3.fromRGB(217, 147, 72)
				CHAT.TextColor3 = Color3.fromRGB(48, 33, 16)
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(-0.1+6*math.cos(SINE/25))), 1 / Animation_Speed)
				if math.random(1,20) == 1 then
					Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(140.3+3*math.cos(SINE/0.05)),math.rad(-140+3*math.cos(SINE/0.05)),math.rad(-10+6*math.cos(SINE/0.02))), 1 / Animation_Speed)
				end
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 15), 0*SIZE+0 * COS(SINE / 15), 2.5*SIZE+1.3 * COS(SINE / 15)) * ANGLES(RAD(30+10 * COS(SINE / 20)), RAD(0+0 * COS(SINE / 20)), RAD(0+0 * COS(SINE / 20))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.6*SIZE-0 * COS(SINE / 14.5), 0.3*SIZE+0.2 * COS(SINE / 14.5), 0.2*SIZE+0.2 * COS(SINE / 14.5)) * ANGLES(RAD(35+10 * COS(SINE / 14)), RAD(-10+10 * COS(SINE / 14)), RAD(45+15 * COS(SINE / 14))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1*SIZE-0 * COS(SINE / 1), 0.5*SIZE+0 * COS(SINE / 1), 0.5*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(180+10 * COS(SINE / 12)), RAD(10+0 * COS(SINE / 12)), RAD(60+0 * COS(SINE / 12))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.5*SIZE+0 * COS(SINE / 15), -1*SIZE+0.3 * COS(SINE / 15), 0*SIZE+0 * COS(SINE / 15)) * ANGLES(RAD(-25+10 * COS(SINE / 15.5)), RAD(-10+10 * COS(SINE / 15.5)), RAD(8+3 * COS(SINE / 15.5))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 15), -1*SIZE+0 * COS(SINE / 15), 0*SIZE+0 * COS(SINE / 15)) * ANGLES(RAD(25+20 * COS(SINE / 15.5)), RAD(10+10 * COS(SINE / 15.5)), RAD(-10+5 * COS(SINE / 15.5))), 1 / Animation_Speed)

			elseif mode == 20 then
				--setsong(2984992418)
				Humanoid.WalkSpeed = 30
				NAMEMODE.Text = "Obedience"
				NAMEMODE.Font = "Garamond"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(0, 255, 0)
				NAMEMODE.TextColor3 = Color3.fromRGB(0, 0, 0)

				CHAT.Text = "OBEY!"
				CHAT.Font = "Antique"
				CHAT.TextStrokeColor3 = Color3.fromRGB(0, 255, 0)
				CHAT.TextColor3 = Color3.fromRGB(0, 0, 0)
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+15*math.cos(SINE/13)),math.rad(-0.1+15*math.cos(SINE/13))), 1 / Animation_Speed)

				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 15), 0*SIZE+0 * COS(SINE / 15), 2.5*SIZE+1 * COS(SINE / 15)) * ANGLES(RAD(-5+10 * COS(SINE / 13)), RAD(0+15 * COS(SINE / 13)), RAD(0+0 * COS(SINE / 13))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.6*SIZE-0 * COS(SINE / 14), 0.3*SIZE+0.2 * COS(SINE / 14), 0*SIZE+0 * COS(SINE / 14)) * ANGLES(RAD(-25+10 * COS(SINE / 13)), RAD(-10+10 * COS(SINE / 13)), RAD(25+15 * COS(SINE / 13))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.6*SIZE-0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(140+25 * COS(SINE / 15)), RAD(10+0 * COS(SINE / 15)), RAD(-10+0 * COS(SINE / 15))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.5*SIZE+0 * COS(SINE / 15.5), -1*SIZE+0.3 * COS(SINE / 15.5), 0*SIZE+0 * COS(SINE / 15.5)) * ANGLES(RAD(-10+10 * COS(SINE / 13)), RAD(-10+5 * COS(SINE / 13)), RAD(8+-15 * COS(SINE / 13))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 14.5), -1*SIZE+0.3 * COS(SINE / 14.5), 0*SIZE+0 * COS(SINE / 14.5)) * ANGLES(RAD(-20+10 * COS(SINE / 13)), RAD(10+5 * COS(SINE / 13)), RAD(-8+-15 * COS(SINE / 13))), 1 / Animation_Speed)
			elseif mode == 21 then
				--setsong(930541401)
				Humanoid.WalkSpeed = 30
				NAMEMODE.Text = "NIGHTMARE"
				NAMEMODE.Font = "Antique"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(50, 0, 0)
				NAMEMODE.TextColor3 = Color3.fromRGB(10, 10, 10)

				CHAT.Text = "HAUNTING YOUR DREAMS!"
				CHAT.Font = "Antique"
				CHAT.TextStrokeColor3 = Color3.fromRGB(50, 0, 0)
				CHAT.TextColor3 = Color3.fromRGB(10, 10, 10)
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(-0.1+6*math.cos(SINE/25))), 1 / Animation_Speed)



				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 13), 0*SIZE+0 * COS(SINE / 13), 0.2*SIZE+0.4 * COS(SINE / 13)) * ANGLES(RAD(30+15 * COS(SINE / 14)), RAD(0+0 * COS(SINE / 14)), RAD(0+0 * COS(SINE / 14))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(-0.8*SIZE-0 * COS(SINE / 1), 0.5*SIZE+0 * COS(SINE / 1), -1*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(-160+10 * COS(SINE / 14)), RAD(10+0 * COS(SINE / 14)), RAD(25+0 * COS(SINE / 14))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(1.3*SIZE-0 * COS(SINE / 15), 0.3*SIZE+0.2 * COS(SINE / 15), 0.4*SIZE+0 * COS(SINE / 15)) * ANGLES(RAD(0+10 * COS(SINE / 14.5)), RAD(180+-10 * COS(SINE / 14.5)), RAD(120+0 * COS(SINE / 14.5))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.5*SIZE+0 * COS(SINE / 13), -1.3*SIZE+-0.4 * COS(SINE / 13), -0.3*SIZE+-0.3 * COS(SINE / 13)) * ANGLES(RAD(25+20 * COS(SINE / 14)), RAD(-15+5 * COS(SINE / 14)), RAD(0+0 * COS(SINE / 14))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 13), -1.3*SIZE+-0.3 * COS(SINE / 13), 0*SIZE+0 * COS(SINE / 13)) * ANGLES(RAD(0+15 * COS(SINE / 14)), RAD(10+5 * COS(SINE / 14)), RAD(0+0 * COS(SINE / 14))), 1 / Animation_Speed)

			elseif mode == 22 then
				--setsong(3255566549)
				Humanoid.WalkSpeed = 50
				NAMEMODE.Text = "S P A C E T I M E"
				NAMEMODE.Font = "Arcade"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(0, 0, 255)
				NAMEMODE.TextColor3 = Color3.fromRGB(10, 10, 10)
				CHAT.Text = "I am intrinsic to your existance"
				CHAT.Font = "Arcade"
				CHAT.TextStrokeColor3 = Color3.fromRGB(0, 0, 255)
				CHAT.TextColor3 = Color3.fromRGB(10, 10, 10)
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(-0.1+6*math.cos(SINE/25))), 1 / Animation_Speed)
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 15), 0*SIZE+0 * COS(SINE / 15), 2.5*SIZE+0.5 * COS(SINE / 15)) * ANGLES(RAD(-15+5 * COS(SINE / 16)), RAD(10+0 * COS(SINE / 16)), RAD(-5+3 * COS(SINE / 16))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(0.7*SIZE-0 * COS(SINE / 13.5), 0*SIZE+0.15 * COS(SINE / 13.5), -0.5*SIZE+0 * COS(SINE / 13.5)) * ANGLES(RAD(80+0 * COS(SINE / 14.5)), RAD(0+-2 * COS(SINE / 14.5)), RAD(-80+5 * COS(SINE / 14.5))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-0.7*SIZE-0 * COS(SINE / 13.5), 0.3*SIZE+0.15 * COS(SINE / 13.5), -0.5*SIZE+0 * COS(SINE / 13.5)) * ANGLES(RAD(190+0 * COS(SINE / 14.5)), RAD(0+2 * COS(SINE / 14.5)), RAD(80+-5 * COS(SINE / 14.5))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.5*SIZE+0 * COS(SINE / 1), -0.7*SIZE+0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(-15+8 * COS(SINE / 16.5)), RAD(-15+0 * COS(SINE / 16.5)), RAD(8+-3 * COS(SINE / 16.5))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 15.5), -1*SIZE+0 * COS(SINE / 15.5), 0*SIZE+0 * COS(SINE / 15.5)) * ANGLES(RAD(-25+8 * COS(SINE / 16.5)), RAD(15+0 * COS(SINE / 16.5)), RAD(-8+3 * COS(SINE / 16.5))), 1 / Animation_Speed)
			elseif mode == 23 then
				Humanoid.WalkSpeed = 50
				NAMEMODE.Text = "CORRUPTION"
				NAMEMODE.Font = "Fantasy"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(10, 0, 20)
				NAMEMODE.TextColor3 = Color3.fromRGB(50, 10, 100)
				CHAT.Text = "All I see is chaos.."
				CHAT.Font = "Fantasy"
				CHAT.TextStrokeColor3 = Color3.fromRGB(10, 0, 20)
				CHAT.TextColor3 = Color3.fromRGB(50, 10, 100)
				Neck.C0 = Clerp(Neck.C0, CF(0,1,0)*ANGLES(math.rad(-90),RAD(-16+5 * COS(SINE / 14)),math.rad(180)), 1)
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 13), 0*SIZE+0 * COS(SINE / 13), 0*SIZE+0.5 * COS(SINE / 13)) * ANGLES(RAD(25+10 * COS(SINE / 14)), RAD(0+0 * COS(SINE / 14)), RAD(0+0 * COS(SINE / 14))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1*SIZE-0 * COS(SINE / 0.05), 0*SIZE+0.1 * COS(SINE / 0.05), -1*SIZE+0 * COS(SINE / 0.05)) * ANGLES(RAD(210+0 * COS(SINE / 1)), RAD(10+0 * COS(SINE / 1)), RAD(-25+0 * COS(SINE / 1))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1*SIZE-0 * COS(SINE / 12.5), 0.2*SIZE+0.3 * COS(SINE / 12.5), 0.5*SIZE+0 * COS(SINE / 12.5)) * ANGLES(RAD(-45+10 * COS(SINE / 14)), RAD(10+-10 * COS(SINE / 14)), RAD(45+0 * COS(SINE / 14))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.5*SIZE+0 * COS(SINE / 13), -1.2*SIZE+-0.5 * COS(SINE / 13), 0*SIZE+0 * COS(SINE / 13)) * ANGLES(RAD(25+10 * COS(SINE / 14)), RAD(-10+10 * COS(SINE / 14)), RAD(10+0 * COS(SINE / 14))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 13), -1.2*SIZE+-0.5 * COS(SINE / 13), 0*SIZE+0 * COS(SINE / 13)) * ANGLES(RAD(10+10 * COS(SINE / 14)), RAD(10+-10 * COS(SINE / 14)), RAD(-10+0 * COS(SINE / 14))), 1 / Animation_Speed)

			elseif mode == 24 then
				--setsong(4615964997)
				Humanoid.WalkSpeed = 50
				NAMEMODE.Text = "INFINITY"
				NAMEMODE.Font = "Fantasy"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(61, 7, 7)
				NAMEMODE.TextColor3 = Color3.fromRGB(102, 11, 11)

				CHAT.Text = "CATACLYSMIC POWER!"
				CHAT.Font = "Fantasy"
				CHAT.TextStrokeColor3 = Color3.fromRGB(61, 7, 7)
				CHAT.TextColor3 = Color3.fromRGB(102, 11, 11)
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(-0.1+6*math.cos(SINE/25))), 1 / Animation_Speed)

				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 19), 0*SIZE+0 * COS(SINE / 19), -0.7*SIZE+0.2 * COS(SINE / 19)) * ANGLES(RAD(60+5 * COS(SINE / 20)), RAD(15+0 * COS(SINE / 20)), RAD(-10+0 * COS(SINE / 20))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(-1*SIZE-0 * COS(SINE / 19), 0.5*SIZE+0.15 * COS(SINE / 19), -1*SIZE+0 * COS(SINE / 19)) * ANGLES(RAD(215+5 * COS(SINE / 20)), RAD(-20+0 * COS(SINE / 20)), RAD(25+5 * COS(SINE / 20))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(1.3*SIZE-0 * COS(SINE / 19), 0*SIZE+0.15 * COS(SINE / 19), 0.35*SIZE+0 * COS(SINE / 19)) * ANGLES(RAD(25+5 * COS(SINE / 20)), RAD(-10+5 * COS(SINE / 20)), RAD(25+3 * COS(SINE / 20))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.5*SIZE+0 * COS(SINE / 19), -0.5*SIZE+-0.2 * COS(SINE / 19), -0.5*SIZE+0 * COS(SINE / 19)) * ANGLES(RAD(56+5 * COS(SINE / 20)), RAD(-10+5 * COS(SINE / 20)), RAD(10+5 * COS(SINE / 20))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 1), -1.2*SIZE+0-.2 * COS(SINE / 20), 0*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(-10+5 * COS(SINE / 20)), RAD(10+-5 * COS(SINE / 20)), RAD(-10+0 * COS(SINE / 20))), 1 / Animation_Speed)
			elseif mode == 25 then
				--setsong(4920807873)
				Humanoid.WalkSpeed = 50
				NAMEMODE.Text = "HAZARDOUS"
				NAMEMODE.Font = "Antique"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(186, 143, 0)
				NAMEMODE.TextColor3 = Color3.fromRGB(0, 0, 0)

				CHAT.Text = "PREPARE FOR YOUR DEMISE!"
				CHAT.Font = "Antique"
				CHAT.TextStrokeColor3 = Color3.fromRGB(186, 143, 0)
				CHAT.TextColor3 = Color3.fromRGB(0, 0, 0)
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(20.1+6*math.cos(SINE/25))), 1 / Animation_Speed)

				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 15), 0*SIZE+0 * COS(SINE / 15), 0*SIZE+0.3 * COS(SINE / 15)) * ANGLES(RAD(15+5 * COS(SINE / 16)), RAD(5+3 * COS(SINE / 16)), RAD(0+0 * COS(SINE / 16))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(-1*SIZE-0 * COS(SINE / 15.5), 0.5*SIZE+0.2 * COS(SINE / 15.5), -0.8*SIZE+0 * COS(SINE / 15.5)) * ANGLES(RAD(-160+6 * COS(SINE / 16.5)), RAD(-25+5 * COS(SINE / 16.5)), RAD(25+0 * COS(SINE / 16.5))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(1.3*SIZE-0 * COS(SINE / 15.5), 0.3*SIZE+0.2 * COS(SINE / 15.5), 0*SIZE+0 * COS(SINE / 15.5)) * ANGLES(RAD(-45+10 * COS(SINE / 16)), RAD(-5+0 * COS(SINE / 16)), RAD(10+3 * COS(SINE / 16))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.5*SIZE+0 * COS(SINE / 15), -1*SIZE+-0.3 * COS(SINE / 15), 0*SIZE+0 * COS(SINE / 15)) * ANGLES(RAD(-5+10 * COS(SINE / 16)), RAD(-15+0 * COS(SINE / 16)), RAD(5+-3 * COS(SINE / 16))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 15), -1*SIZE+-0.2 * COS(SINE / 15), 0*SIZE+0 * COS(SINE / 15)) * ANGLES(RAD(15+0 * COS(SINE / 16)), RAD(15+0 * COS(SINE / 16)), RAD(-6+-3 * COS(SINE / 16))), 1 / Animation_Speed)

			elseif mode == 26 then
				--setsong(613035749)
				Humanoid.WalkSpeed = 30
				NAMEMODE.Text = "I N C O M P R E H E N S I B L I T Y I S M S"
				NAMEMODE.Font = "SpecialElite"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(186, 46, 46)
				NAMEMODE.TextColor3 = Color3.fromRGB(0, 0, 0)

				CHAT.Text = "U n k n o w n."
				CHAT.Font = "SpecialElite"
				CHAT.TextStrokeColor3 = Color3.fromRGB(186, 46, 46)
				CHAT.TextColor3 = Color3.fromRGB(0, 0, 0)
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(-0.1+6*math.cos(SINE/25))), 1 / Animation_Speed)



				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 13), 0*SIZE+0 * COS(SINE / 13), 0*SIZE+0.4 * COS(SINE / 13)) * ANGLES(RAD(0+5 * COS(SINE / 12)), RAD(0+0 * COS(SINE / 12)), RAD(0+0 * COS(SINE / 12))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1*SIZE-0 * COS(SINE / 13.5), 0.15*SIZE+0.3 * COS(SINE / 13.5), 0.5*SIZE+0 * COS(SINE / 13.5)) * ANGLES(RAD(-50+0 * COS(SINE / 12.5)), RAD(-25+0 * COS(SINE / 12.5)), RAD(-40+0 * COS(SINE / 12.5))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.6*SIZE-0 * COS(SINE / 11), 0*SIZE+0 * COS(SINE / 11), 0*SIZE+0 * COS(SINE / 11)) * ANGLES(RAD(120+15 * COS(SINE / 11.5)), RAD(10+0 * COS(SINE / 11.5)), RAD(10+5 * COS(SINE / 11.5))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.5*SIZE+0 * COS(SINE / 13), -1*SIZE+-0.4 * COS(SINE / 13), 0*SIZE+0 * COS(SINE / 13)) * ANGLES(RAD(-10+5 * COS(SINE / 12)), RAD(-20+5 * COS(SINE / 12)), RAD(8+3 * COS(SINE / 12))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 13), -1*SIZE+-0.4 * COS(SINE / 13), 0*SIZE+0 * COS(SINE / 13)) * ANGLES(RAD(-25+0 * COS(SINE / 12)), RAD(15+-5 * COS(SINE / 12)), RAD(-8+5 * COS(SINE / 12))), 1 / Animation_Speed)
			elseif mode == 27 then
				--setsong(6400668054)
				Humanoid.WalkSpeed = 10
				NAMEMODE.Text = "T H E   A B Y S S"
				NAMEMODE.Font = "Antique"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
				NAMEMODE.TextColor3 = Color3.fromRGB(0, 0, 0)

				CHAT.Text = " "
				CHAT.Font = "SpecialElite"
				CHAT.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
				CHAT.TextColor3 = Color3.fromRGB(0, 0, 0)
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(-0.1+6*math.cos(SINE/25))), 1 / Animation_Speed)

				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 20), 0*SIZE+0 * COS(SINE / 20), 3.5*SIZE+0.5 * COS(SINE / 20)) * ANGLES(RAD(55+-5 * COS(SINE / 21)), RAD(0+0 * COS(SINE / 21)), RAD(0+0 * COS(SINE / 21))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.6*SIZE-0 * COS(SINE / 20), 0.3*SIZE+0.1 * COS(SINE / 20), 0*SIZE+0 * COS(SINE / 20)) * ANGLES(RAD(55+5 * COS(SINE / 21)), RAD(10+0 * COS(SINE / 21)), RAD(25+5 * COS(SINE / 21))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.6*SIZE-0 * COS(SINE / 20), 0.3*SIZE+0.1 * COS(SINE / 20), 0*SIZE+0 * COS(SINE / 20)) * ANGLES(RAD(55+5 * COS(SINE / 21)), RAD(0+0 * COS(SINE / 21)), RAD(-25+-5 * COS(SINE / 21))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.5*SIZE+0 * COS(SINE / 20), -0.3*SIZE+0.1 * COS(SINE / 20), -0.5*SIZE+0 * COS(SINE / 20)) * ANGLES(RAD(-25+10 * COS(SINE / 21)), RAD(-10+0 * COS(SINE / 21)), RAD(8+3 * COS(SINE / 21))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 20), -1.2*SIZE+0.1 * COS(SINE / 20), 0.3*SIZE+0 * COS(SINE / 20)) * ANGLES(RAD(-10+10 * COS(SINE / 21)), RAD(10+0 * COS(SINE / 21)), RAD(-8+-3 * COS(SINE / 21))), 1 / Animation_Speed)
			elseif mode == 28 then
				--setsong(573736432)
				Humanoid.WalkSpeed = 250
				NAMEMODE.Text = "NiL/:'VALUe'"
				NAMEMODE.Font = "Code"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(10, 0, 0)
				NAMEMODE.TextColor3 = Color3.fromRGB(0, 0, 0)

				CHAT.Text = "I WILL ERASE EXISTANCE!"
				CHAT.Font = "SpecialElite"
				CHAT.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
				CHAT.TextColor3 = Color3.fromRGB(0, 0, 0)
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/0.05)),math.rad(180+3*math.cos(SINE/0.05)),math.rad(-0.1+6*math.cos(SINE/0.02))), 1 / Animation_Speed)
				if MRANDOM(1,30) == 1 then
					Neck.C0 = Clerp(Neck.C0,NECKC0 * ANGLES(RAD(20+MRANDOM(-20,20)),RAD((10*COS(SINE/100))+MRANDOM(-20,20)),RAD(MRANDOM(-20,20))),1)
				end


				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 12), 0*SIZE+0 * COS(SINE / 12), 3.5*SIZE+0.5 * COS(SINE / 12)) * ANGLES(RAD(-25+10 * COS(SINE / 13)), RAD(0+0 * COS(SINE / 13)), RAD(0+0 * COS(SINE / 13))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(0.7*SIZE-0 * COS(SINE / 11.5), 1*SIZE+0 * COS(SINE / 11.5), -1*SIZE+0 * COS(SINE / 11.5)) * ANGLES(RAD(-150+15 * COS(SINE / 14)), RAD(10+10 * COS(SINE / 14)), RAD(-25+0 * COS(SINE / 14))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5*SIZE-0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(-45+15 * COS(SINE / 13)), RAD(10+10 * COS(SINE / 13)), RAD(-20+10 * COS(SINE / 13))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.5*SIZE+0 * COS(SINE / 12.5), -1*SIZE+0 * COS(SINE / 12.5), 0*SIZE+0 * COS(SINE / 12.5)) * ANGLES(RAD(-25+10 * COS(SINE / 11.5)), RAD(-10+5 * COS(SINE / 11.5)), RAD(8+5 * COS(SINE / 11.5))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 15), -0.5*SIZE+0 * COS(SINE / 15), 0*SIZE+0 * COS(SINE / 15)) * ANGLES(RAD(-10+-10 * COS(SINE / 10.5)), RAD(10+5 * COS(SINE / 10.5)), RAD(-8+5 * COS(SINE / 10.5))), 1 / Animation_Speed)
			elseif mode == 29 then
				--setsong(1083649139)
				Humanoid.WalkSpeed = 100
				NAMEMODE.Text = "Fate"
				NAMEMODE.Font = "Fondamento"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(184, 168, 0)
				NAMEMODE.TextColor3 = Color3.fromRGB(255, 200, 0)

				CHAT.Text = "Your death is sealed."
				CHAT.Font = "Fondamento"
				CHAT.TextStrokeColor3 = Color3.fromRGB(184, 168, 0)
				CHAT.TextColor3 = Color3.fromRGB(255, 200, 0)
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(-0.1+6*math.cos(SINE/25))), 1 / Animation_Speed)



				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 15), 0*SIZE+1.2 * COS(SINE / 15), 2*SIZE+0.8 * COS(SINE / 10.5)) * ANGLES(RAD(0+-15 * COS(SINE / 16)), RAD(0+0 * COS(SINE / 16)), RAD(0+0 * COS(SINE / 16))), 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(1.4*SIZE-0 * COS(SINE / 17), 0.5*SIZE+0.2 * COS(SINE / 17), 0.2*SIZE+-0.3 * COS(SINE / 17)) * ANGLES(RAD(165+0 * COS(SINE / 1)), RAD(180+0 * COS(SINE / 1)), RAD(-15+0 * COS(SINE / 1))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(-1.6*SIZE-0 * COS(SINE / 17), 0.5*SIZE+0.1 * COS(SINE / 17), 0.2*SIZE+-0.3 * COS(SINE / 17)) * ANGLES(RAD(0+25 * COS(SINE / 16)), RAD(15+-0 * COS(SINE / 16)), RAD(-15+7 * COS(SINE / 16))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.5*SIZE+0 * COS(SINE / 17), -1*SIZE+0.2 * COS(SINE / 17), 0.5*SIZE+0.2 * COS(SINE / 17)) * ANGLES(RAD(-25+15 * COS(SINE / 16)), RAD(-15+5 * COS(SINE / 16)), RAD(0+0 * COS(SINE / 16))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 17), 0*SIZE+0.2 * COS(SINE / 17), -0.4*SIZE+0.2 * COS(SINE / 17)) * ANGLES(RAD(-25+15 * COS(SINE / 16)), RAD(15+7 * COS(SINE / 16)), RAD(0+0 * COS(SINE / 16))), 1 / Animation_Speed)

			elseif mode == 30 then
				--setsong(316491646)
				Humanoid.WalkSpeed = 20
				NAMEMODE.Text = "Atmospherical"
				NAMEMODE.Font = "GothamSemibold"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(0, 247, 255)
				NAMEMODE.TextColor3 = Color3.fromRGB(150+(sick.PlaybackLoudness * .3), 0+(sick.PlaybackLoudness * .3), 150+(sick.PlaybackLoudness * .3))

				CHAT.Text = "From the heavens!"
				CHAT.Font = "GothamSemibold"
				CHAT.TextStrokeColor3 = Color3.fromRGB(0, 247, 255)
				CHAT.TextColor3 = Color3.fromRGB(150+(sick.PlaybackLoudness * .3), 0+(sick.PlaybackLoudness * .3), 150+(sick.PlaybackLoudness * .3))

				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+10*math.cos(SINE/13)),math.rad(-0.1+6*math.cos(SINE/25))), 1 / Animation_Speed)

				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 13), 0*SIZE+0 * COS(SINE / 13), 3.5*SIZE+0.5 * COS(SINE / 13)) * ANGLES(RAD(0+5 * COS(SINE / 14)), RAD(0+6 * COS(SINE / 14)), RAD(0+0 * COS(SINE / 14))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(-1.3*SIZE-0 * COS(SINE / 13.5), 0.2*SIZE+0.2 * COS(SINE / 13.5), 0*SIZE+0 * COS(SINE / 13.5)) * ANGLES(RAD(5+5 * COS(SINE / 14.5)), RAD(-10+5 * COS(SINE / 14.5)), RAD(15+0 * COS(SINE / 14.5))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(0.7*SIZE-0 * COS(SINE / 13.5), 0*SIZE+0.2 * COS(SINE / 13.5), -0.3*SIZE+0 * COS(SINE / 13.5)) * ANGLES(RAD(90+10 * COS(SINE / 14.5)), RAD(0+10 * COS(SINE / 14.5)), RAD(-80+5 * COS(SINE / 14.5))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.33*SIZE+0 * COS(SINE / 13.5), -0.6*SIZE+0.3 * COS(SINE / 13.5), 0*SIZE+0 * COS(SINE / 13.5)) * ANGLES(RAD(-15+10 * COS(SINE / 14.5)), RAD(-25+5 * COS(SINE / 14.5)), RAD(-5+3 * COS(SINE / 14.5))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.8*SIZE+0 * COS(SINE / 13.5), -1*SIZE+0.3 * COS(SINE / 13.5), 0.3*SIZE+0 * COS(SINE / 13.5)) * ANGLES(RAD(-25+-5 * COS(SINE / 14.5)), RAD(3+-10 * COS(SINE / 14.5)), RAD(10+-3 * COS(SINE / 14.5))), 1 / Animation_Speed)

			elseif mode == 31 then
				--setsong(590640761)
				Humanoid.WalkSpeed = 100
				NAMEMODE.Text = "FORCE"
				NAMEMODE.Font = "Antique"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(255, 0, 0)
				NAMEMODE.TextColor3 = Color3.new(0+(sick.PlaybackLoudness * 0.0012),0,0)

				CHAT.Text = "IM BACK!"
				CHAT.Font = "Antique"
				CHAT.TextStrokeColor3 = Color3.fromRGB(255, 0, 0)
				CHAT.TextColor3 = Color3.new(0+(sick.PlaybackLoudness * 0.0012),0,0)
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(-30.1+6*math.cos(SINE/25))), 1 / Animation_Speed)

				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 15), 0*SIZE+0 * COS(SINE / 15), 1.5*SIZE+0.5 * COS(SINE / 15)) * ANGLES(RAD(0+0 * COS(SINE / 16)), RAD(-10+5 * COS(SINE / 16)), RAD(0+0 * COS(SINE / 16))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(-1.3*SIZE-0 * COS(SINE / 15), 0*SIZE+0.15 * COS(SINE / 15), 0.5*SIZE+0 * COS(SINE / 15)) * ANGLES(RAD(56+5 * COS(SINE / 16)), RAD(10+0 * COS(SINE / 16)), RAD(-25+10 * COS(SINE / 16))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(1.2*SIZE-0 * COS(SINE / 15), 0*SIZE+0.15 * COS(SINE / 15), -1*SIZE+0 * COS(SINE / 15)) * ANGLES(RAD(190+0 * COS(SINE / 16)), RAD(25+0 * COS(SINE / 16)), RAD(-10+-8 * COS(SINE / 16))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.5*SIZE+0 * COS(SINE / 15), -0.7*SIZE+0.15 * COS(SINE / 15), 0*SIZE+0 * COS(SINE / 15)) * ANGLES(RAD(-10+10 * COS(SINE / 16)), RAD(-15+0 * COS(SINE / 16)), RAD(10+10 * COS(SINE / 16))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 1), -1.2*SIZE+0 * COS(SINE / 1), 0.3*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(-25+10 * COS(SINE / 16)), RAD(10+0 * COS(SINE / 16)), RAD(-25+3 * COS(SINE / 16))), 1 / Animation_Speed)
			elseif mode == 32 then
				--setsong(930541401)
				Humanoid.WalkSpeed = 23
				NAMEMODE.Text = "Hunter"
				NAMEMODE.Font = "Fantasy"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(59, 31, 5)
				NAMEMODE.TextColor3 = Color3.fromRGB(0, 0, 0)

				CHAT.Text = "Locked and loaded."
				CHAT.Font = "Antique"
				CHAT.TextStrokeColor3 = Color3.fromRGB(59, 31, 5)
				CHAT.TextColor3 = Color3.fromRGB(0, 0, 0)
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(60.1+6*math.cos(SINE/25))), 1 / Animation_Speed)

				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(-1.3*SIZE-0 * COS(SINE / 20), -0.5*SIZE+0.15 * COS(SINE / 20), -0.5*SIZE+0 * COS(SINE / 20)) * ANGLES(RAD(160+-7 * COS(SINE / 21)), RAD(-15+0 * COS(SINE / 21)), RAD(-15+6 * COS(SINE / 21))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(1*SIZE-0 * COS(SINE / 20), 0*SIZE+0.15 * COS(SINE / 20), -0.7*SIZE+0 * COS(SINE / 20)) * ANGLES(RAD(85+4 * COS(SINE / 21)), RAD(-5+4 * COS(SINE / 21)), RAD(-85+0 * COS(SINE / 21))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0 - 0.04 * SIN(SINE / 24)*SIZE, 0 + 0.04 * SIN(SINE / 12)*SIZE, 0 + 0.05*SIZE * COS(SINE / 12)) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(0 - 2.5 * SIN(SINE / 24)), RAD(0)), 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE, -1*SIZE + 0.06 * SIN(SINE / 24) - 0.05*SIZE * COS(SINE / 12), -0.01*SIZE) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(75), RAD(0)) * ANGLES(RAD(-14 - 2.5 * SIN(SINE / 24)), RAD(0), RAD(0)), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE, -1*SIZE - 0.06 * SIN(SINE / 24) - 0.05*SIZE * COS(SINE / 12), -0.01*SIZE) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(-75), RAD(0)) * ANGLES(RAD(-14 + 2.5 * SIN(SINE / 24)), RAD(0), RAD(0)), 1 / Animation_Speed)

			elseif mode == 33 then
				--setsong(3666416563)
				Humanoid.WalkSpeed = 23
				NAMEMODE.Text = "HATRED"
				NAMEMODE.Font = "Antique"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(214, 56, 45)
				NAMEMODE.TextColor3 = Color3.fromRGB(143, 16, 7)

				CHAT.Text = "THIS IS THE END!"
				CHAT.Font = "Antique"
				CHAT.TextStrokeColor3 = Color3.fromRGB(214, 56, 45)
				CHAT.TextColor3 = Color3.fromRGB(143, 16, 7)
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(20.1+6*math.cos(SINE/25))), 1 / Animation_Speed)

				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 15), 0*SIZE+0 * COS(SINE / 15), 0*SIZE+0.3 * COS(SINE / 15)) * ANGLES(RAD(10+-5 * COS(SINE / 16)), RAD(25+0 * COS(SINE / 16)), RAD(0+0 * COS(SINE / 16))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(-1.3*SIZE-0 * COS(SINE / 15), 0.2*SIZE+0.15 * COS(SINE / 15), 0*SIZE+0 * COS(SINE / 15)) * ANGLES(RAD(25+10 * COS(SINE / 16)), RAD(15+0 * COS(SINE / 16)), RAD(-25+8 * COS(SINE / 16))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(1*SIZE-0 * COS(SINE / 15), 0.5*SIZE+0.15 * COS(SINE / 15), 1*SIZE+0 * COS(SINE / 15)) * ANGLES(RAD(120+10 * COS(SINE / 16)), RAD(-10+0 * COS(SINE / 16)), RAD(-80+0 * COS(SINE / 16))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.5*SIZE+0 * COS(SINE / 15), -1.2*SIZE+-0.3 * COS(SINE / 15), 0*SIZE+0 * COS(SINE / 15)) * ANGLES(RAD(0+-5 * COS(SINE / 16)), RAD(-15+10 * COS(SINE / 16)), RAD(10+8 * COS(SINE / 16))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 15), -0.9*SIZE+-0.3 * COS(SINE / 15), 0*SIZE+0 * COS(SINE / 15)) * ANGLES(RAD(10+-5 * COS(SINE / 16)), RAD(25+0 * COS(SINE / 16)), RAD(-25+-8 * COS(SINE / 16))), 1 / Animation_Speed)

			elseif mode == 34 then
				--setsong(4615932760)
				Humanoid.WalkSpeed = 56
				NAMEMODE.Text = "CURSED"
				NAMEMODE.Font = "IndieFlower"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
				NAMEMODE.TextColor3 = Color3.fromRGB(0, 0, 0)

				CHAT.Text = "UNHOLY!"
				CHAT.Font = "IndieFlower"
				CHAT.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
				CHAT.TextColor3 = Color3.fromRGB(0, 0, 0)
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(-0.1+6*math.cos(SINE/25))), 1 / Animation_Speed)



				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 15), 0*SIZE+0.8 * COS(SINE / 15), 2*SIZE+0.8 * COS(SINE / 15)) * ANGLES(RAD(0+-15 * COS(SINE / 16)), RAD(0+0 * COS(SINE / 16)), RAD(0+0 * COS(SINE / 16))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(0.8*SIZE-0 * COS(SINE / 19.5), -0.2*SIZE+0.2 * COS(SINE / 19.5), -0.3*SIZE+0 * COS(SINE / 19.5)) * ANGLES(RAD(70+3 * COS(SINE / 19)), RAD(10+10 * COS(SINE / 19)), RAD(-60+0 * COS(SINE / 19))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-0.8*SIZE-0 * COS(SINE / 19.5), 0.2*SIZE+0.3 * COS(SINE / 19.5), -0.3*SIZE+0 * COS(SINE / 19.5)) * ANGLES(RAD(120+3 * COS(SINE / 19)), RAD(0+3 * COS(SINE / 19)), RAD(60+0 * COS(SINE / 19))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.5*SIZE+0 * COS(SINE / 17), -1*SIZE+0.2 * COS(SINE / 17), 0.5*SIZE+0.2 * COS(SINE / 17)) * ANGLES(RAD(-25+15 * COS(SINE / 16)), RAD(-15+5 * COS(SINE / 16)), RAD(0+0 * COS(SINE / 16))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 17), 0*SIZE+0.2 * COS(SINE / 17), -0.4*SIZE+0.2 * COS(SINE / 17)) * ANGLES(RAD(-25+15 * COS(SINE / 16)), RAD(15+7 * COS(SINE / 16)), RAD(0+0 * COS(SINE / 16))), 1 / Animation_Speed)
			elseif mode == 35 then
				--setsong(1062839413)
				Humanoid.WalkSpeed = 23
				NAMEMODE.Text = "MAXIMUM"
				NAMEMODE.Font = "Bodoni"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
				NAMEMODE.TextColor3 = Color3.fromRGB(0+(sick.PlaybackLoudness * .3), 0+(sick.PlaybackLoudness * .3), 0+(sick.PlaybackLoudness * .3))

				CHAT.Text = "OVERLOADED!"
				CHAT.Font = "Bodoni"
				CHAT.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
				CHAT.TextColor3 = Color3.fromRGB(0+(sick.PlaybackLoudness * .3), 0+(sick.PlaybackLoudness * .3), 0+(sick.PlaybackLoudness * .3))
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(-0.1+6*math.cos(SINE/25))), 1 / Animation_Speed)



				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 16), 0*SIZE+0 * COS(SINE / 16), -0.3*SIZE+0.2 * COS(SINE / 16)) * ANGLES(RAD(25+5 * COS(SINE / 15)), RAD(0+0 * COS(SINE / 15)), RAD(0+0 * COS(SINE / 15))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(-1*SIZE-0 * COS(SINE / 16.5), -0.4*SIZE+0.1 * COS(SINE / 16.5), -0.5*SIZE+0 * COS(SINE / 16.5)) * ANGLES(RAD(-160+2 * COS(SINE / 17)), RAD(0+0 * COS(SINE / 17)), RAD(50+4 * COS(SINE / 17))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(1.3*SIZE-0 * COS(SINE / 17.5), 0*SIZE+0.2 * COS(SINE / 17.5), 0*SIZE+0 * COS(SINE / 17.5)) * ANGLES(RAD(0+10 * COS(SINE / 15.5)), RAD(-30+5 * COS(SINE / 15.5)), RAD(50+0 * COS(SINE / 15.5))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.6*SIZE+0 * COS(SINE / 16), -0.7*SIZE+-0.2 * COS(SINE / 16), 0*SIZE+0 * COS(SINE / 16)) * ANGLES(RAD(25+5 * COS(SINE / 15)), RAD(-8+0 * COS(SINE / 15)), RAD(6+3 * COS(SINE / 15))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 16), -0.7*SIZE+-0.2 * COS(SINE / 16), 0*SIZE+0 * COS(SINE / 16)) * ANGLES(RAD(25+5 * COS(SINE / 15)), RAD(10+0 * COS(SINE / 15)), RAD(-6+-5 * COS(SINE / 15))), 1 / Animation_Speed)

			elseif mode == 36 then
				--setsong(460874877)
				Humanoid.WalkSpeed = 75
				NAMEMODE.Text = "Lightning Cannon"
				NAMEMODE.Font = "Fantasy"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
				NAMEMODE.TextColor3 = Color3.fromRGB(200, 200, 200)

				CHAT.Text = "I'LL BE YOUR UNDOING!"
				CHAT.Font = "Fantasy"
				CHAT.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
				CHAT.TextColor3 = Color3.fromRGB(200, 200, 200)
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/0.05)),math.rad(180+3*math.cos(SINE/0.05)),math.rad(-0.1+6*math.cos(SINE/0.02))), 1 / Animation_Speed)
				if MRANDOM(1,30) == 1 then
					Neck.C0 = Clerp(Neck.C0,NECKC0 * ANGLES(RAD(20+MRANDOM(-20,20)),RAD((10*COS(SINE/100))+MRANDOM(-20,20)),RAD(MRANDOM(-20,20))),1)
				end

				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0.4 * COS(SINE / 20), 0*SIZE+0.1 * COS(SINE / 20), 3.5*SIZE+1 * COS(SINE / 100)) * ANGLES(RAD(0+1 * COS(SINE / 19)), RAD(0+0 * COS(SINE / 19)), RAD(0+0 * COS(SINE / 19))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.6*SIZE-0 * COS(SINE / 12), 0.5*SIZE+0.05 * COS(SINE / 12), 0*SIZE+0 * COS(SINE / 12)) * ANGLES(RAD(0+0 * COS(SINE / 12)), RAD(0+0 * COS(SINE / 12)), RAD(15+3 * COS(SINE / 12))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.6*SIZE-0 * COS(SINE / 12), 0.5*SIZE+0.05 * COS(SINE / 12), 0*SIZE+0 * COS(SINE / 12)) * ANGLES(RAD(160+4 * COS(SINE / 62)), RAD(0+0 * COS(SINE / 62)), RAD(-15+-3 * COS(SINE / 62))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE+0 * COS(SINE / 1), -1*SIZE+0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(-17+9.4 * COS(SINE / 26)), RAD(80+0 * COS(SINE / 26)), RAD(0+0 * COS(SINE / 26))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE+0 * COS(SINE / 1), -0.5*SIZE+0 * COS(SINE / 1), -0.5*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(-22+10.8 * COS(SINE / 32)), RAD(-80+0 * COS(SINE / 32)), RAD(0+0 * COS(SINE / 32))), 1 / Animation_Speed)

			elseif mode == 37 then
				--setsong(286050652)
				Humanoid.WalkSpeed = 150
				NAMEMODE.Text = "PERSERVERENCE"
				NAMEMODE.Font = "Fantasy"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(250, 250, 250)
				NAMEMODE.TextColor3 = Color3.fromRGB(0+(sick.PlaybackLoudness * .3), 0+(sick.PlaybackLoudness * .3), 0+(sick.PlaybackLoudness * .3))

				CHAT.Text = "I WILL NOT LOSE MY FAITH!"
				CHAT.Font = "Fantasy"
				CHAT.TextStrokeColor3 = Color3.fromRGB(250, 250, 250)
				CHAT.TextColor3 = Color3.fromRGB(0+(sick.PlaybackLoudness * .3), 0+(sick.PlaybackLoudness * .3), 0+(sick.PlaybackLoudness * .3))
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(70.1+6*math.cos(SINE/25))), 1 / Animation_Speed)


				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 16), 0*SIZE+0 * COS(SINE / 16), 3.5*SIZE+0.5 * COS(SINE / 16)) * ANGLES(RAD(0+0 * COS(SINE / 15)), RAD(15+7 * COS(SINE / 15)), RAD(8+3 * COS(SINE / 15))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(-1.3*SIZE-0 * COS(SINE / 16.5), 0*SIZE+0.2 * COS(SINE / 16.5), -1*SIZE+0 * COS(SINE / 16.5)) * ANGLES(RAD(160+10 * COS(SINE / 15.5)), RAD(-10+5 * COS(SINE / 15.5)), RAD(8+4 * COS(SINE / 15.5))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(1*SIZE-0 * COS(SINE / 16.5), -0.5*SIZE+0.2 * COS(SINE / 16.5), -1*SIZE+0 * COS(SINE / 16.5)) * ANGLES(RAD(120+10 * COS(SINE / 15.5)), RAD(-20+5 * COS(SINE / 15.5)), RAD(-65+0 * COS(SINE / 15.5))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(-1*SIZE+0 * COS(SINE / 17.5), -0.5*SIZE+0.3 * COS(SINE / 17.5), 0*SIZE+0 * COS(SINE / 17.5)) * ANGLES(RAD(-25+0 * COS(SINE / 17)), RAD(25+-10 * COS(SINE / 17)), RAD(25+5 * COS(SINE / 17))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(0.5*SIZE+0 * COS(SINE / 17.5), -1*SIZE+0.3 * COS(SINE / 17.5), 0*SIZE+0 * COS(SINE / 17.5)) * ANGLES(RAD(-35+15 * COS(SINE / 17)), RAD(-25+10 * COS(SINE / 17)), RAD(25+10 * COS(SINE / 17))), 1 / Animation_Speed)

			elseif mode == 38 then
				--setsong(258688195)
				Humanoid.WalkSpeed = 150
				NAMEMODE.Text = "S P A C E"
				NAMEMODE.Font = "Bodoni"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(50, 50, 100)
				NAMEMODE.TextColor3 = Color3.new(0,0,0+(sick.PlaybackLoudness * 0.0015))

				CHAT.Text = "INTERSTELLAR!"
				CHAT.Font = "Bodoni"
				CHAT.TextStrokeColor3 = Color3.fromRGB(50, 50, 100)
				CHAT.TextColor3 = Color3.new(0,0,0+(sick.PlaybackLoudness * 0.0015))
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(-0.1+6*math.cos(SINE/25))), 1 / Animation_Speed)



				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 5 * COS(SINE / 40), 0*SIZE+0 * COS(SINE / 20), 30*SIZE+5 * COS(SINE / 20)) * ANGLES(RAD(0+10 * COS(SINE / 20)), RAD(0+-10 * COS(SINE / 20)), RAD(0+0 * COS(SINE / 20))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(-0.8*SIZE-0 * COS(SINE / 12), 0*SIZE+0.3 * COS(SINE / 12), -0.5*SIZE+0 * COS(SINE / 12)) * ANGLES(RAD(70+5 * COS(SINE / 13)), RAD(-10+5 * COS(SINE / 13)), RAD(60+0 * COS(SINE / 13))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(0.6*SIZE-0 * COS(SINE / 12), 0.3*SIZE+0.2 * COS(SINE / 12), -0.5*SIZE+0 * COS(SINE / 12)) * ANGLES(RAD(100+10 * COS(SINE / 15)), RAD(-10+5 * COS(SINE / 15)), RAD(-80+0 * COS(SINE / 15))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 21), -1*SIZE+0.3 * COS(SINE / 21), 0*SIZE+0 * COS(SINE / 21)) * ANGLES(RAD(-25+15 * COS(SINE / 19)), RAD(25+0 * COS(SINE / 19)), RAD(-10+5 * COS(SINE / 19))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(0.5*SIZE+0 * COS(SINE / 1), -0.5*SIZE+0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(-15+10 * COS(SINE / 19)), RAD(-10+3 * COS(SINE / 19)), RAD(10+10 * COS(SINE / 19))), 1 / Animation_Speed)

			elseif mode == 39 then
				--setsong(6753293750)
				Humanoid.WalkSpeed = 56
				NAMEMODE.Text = "lost"
				NAMEMODE.Font = "IndieFlower"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
				NAMEMODE.TextColor3 = Color3.fromRGB(0, 0, 0)

				CHAT.Text = " "
				CHAT.Font = "IndieFlower"
				CHAT.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
				CHAT.TextColor3 = Color3.fromRGB(0, 0, 0)
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(-0.1+6*math.cos(SINE/25))), 1 / Animation_Speed)



				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 25), 0*SIZE+0 * COS(SINE / 25), 2.5*SIZE+0.5 * COS(SINE / 25)) * ANGLES(RAD(-24+10 * COS(SINE / 24)), RAD(0+0 * COS(SINE / 24)), RAD(25+5 * COS(SINE / 24))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1*SIZE-0 * COS(SINE / 25.5), 0.8*SIZE+0.2 * COS(SINE / 25.5), -0.5*SIZE+0 * COS(SINE / 25.5)) * ANGLES(RAD(90+5 * COS(SINE / 24.5)), RAD(20+5 * COS(SINE / 24.5)), RAD(-56+10 * COS(SINE / 24.5))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1*SIZE-0 * COS(SINE / 25.5), 1*SIZE+0.2 * COS(SINE / 25.5), -0.5*SIZE+0 * COS(SINE / 25.5)) * ANGLES(RAD(90+5 * COS(SINE / 24.5)), RAD(20+5 * COS(SINE / 24.5)), RAD(65+10 * COS(SINE / 24.5))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.5*SIZE+0 * COS(SINE / 23.5), -1*SIZE+0.1 * COS(SINE / 23.5), 0*SIZE+0 * COS(SINE / 23.5)) * ANGLES(RAD(-25+15 * COS(SINE / 24)), RAD(-15+5 * COS(SINE / 24)), RAD(10+5 * COS(SINE / 24))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 23.5), -0.5*SIZE+0.2 * COS(SINE / 23.5), 0*SIZE+0 * COS(SINE / 23.5)) * ANGLES(RAD(15+-15 * COS(SINE / 24)), RAD(25+5 * COS(SINE / 24)), RAD(-5+4 * COS(SINE / 24))), 1 / Animation_Speed)

			elseif mode == 40 then
				--setsong(334283059)
				Humanoid.WalkSpeed = 56
				NAMEMODE.Text = "Bored"
				NAMEMODE.Font = "Fantasy"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
				NAMEMODE.TextColor3 = Color3.fromRGB(0, 0, 0)

				CHAT.Text = "Just going with the flow.."
				CHAT.Font = "Fantasy"
				CHAT.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
				CHAT.TextColor3 = Color3.fromRGB(0, 0, 0)
				Neck.C0 = Clerp(Neck.C0, CF(0,1,0)*ANGLES(math.rad(-120),math.rad(0),RAD(-180-20 * COS(SINE / 12))), 1)

				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0.5 * COS(SINE / 30), 0*SIZE+0 * COS(SINE / 15), 3*SIZE+0.3 * COS(SINE / 15)) * ANGLES(RAD(-25+5 * COS(SINE / 16)), RAD(0+0 * COS(SINE / 16)), RAD(0+0 * COS(SINE / 16))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(-1.4*SIZE-0 * COS(SINE / 1), 0.3*SIZE+0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(-20+-5 * COS(SINE / 16)), RAD(10+3 * COS(SINE / 16)), RAD(-35+8 * COS(SINE / 16))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(1*SIZE-0 * COS(SINE / 19), 0*SIZE+0.15 * COS(SINE / 19), 0.3*SIZE+0 * COS(SINE / 19)) * ANGLES(RAD(-100+0 * COS(SINE / 20)), RAD(20+-5 * COS(SINE / 20)), RAD(-70+0 * COS(SINE / 20))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.5*SIZE+0 * COS(SINE / 1), -0.7*SIZE+0 * COS(SINE / 1), 0.3*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(-10+-6 * COS(SINE / 16)), RAD(-10+-5 * COS(SINE / 16)), RAD(8+3 * COS(SINE / 16))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 1), -1.2*SIZE+0 * COS(SINE / 1), 0.25*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(25+-5 * COS(SINE / 16)), RAD(10+5 * COS(SINE / 16)), RAD(-8+-3 * COS(SINE / 16))), 1 / Animation_Speed)
			elseif mode == 41 then
				Humanoid.WalkSpeed = 120
				NAMEMODE.Text = "Ritualistic"
				NAMEMODE.Font = "IndieFlower"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
				NAMEMODE.TextColor3 = Color3.fromRGB(150, 1, 1)
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(70.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(-0.1+6*math.cos(SINE/25))), 1 / Animation_Speed)
				CHAT.Text = "EXISTANCE IS A JOKE."
				CHAT.Font = "IndieFlower"
				CHAT.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
				CHAT.TextColor3 = Color3.fromRGB(150, 1, 1)
				gunweld.C0 = Clerp(gunweld.C0, CF(-0.15*SIZE+0 * COS(SINE / 15), 0*SIZE+0 * COS(SINE /15), 0*SIZE+0 * COS(SINE / 15)) * ANGLES(RAD(0+0 * COS(SINE / 505)), RAD(-180+0* COS(SINE / 33)), RAD(-15-0 * COS(SINE / 30))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.6*SIZE-0 * COS(SINE / 28.5), 0*SIZE+0.2 * COS(SINE / 28.5), -0.3*SIZE+0 * COS(SINE / 28.5)) * ANGLES(RAD(190+0 * COS(SINE / 28)), RAD(15+5 * COS(SINE / 28)), RAD(-10+5 * COS(SINE / 28))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1*SIZE-0 * COS(SINE / 28.5), 0*SIZE+0.2 * COS(SINE / 28.5), 0.5*SIZE+0 * COS(SINE / 28.5)) * ANGLES(RAD(-25+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1)), RAD(35+0 * COS(SINE / 1))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE+.2 * math.sin(SINE / 32), 0*SIZE+0 * COS(SINE / 1), 0*SIZE+.1 * math.cos(SINE / 32)) * ANGLES(math.rad(9.6), RAD(.7+5 * math.sin(SINE / 32)), RAD(29.2+0 * COS(SINE / 1))), 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.9*SIZE+.1 * SIN(SINE / 32), -1*SIZE-.1 * COS(SINE / 32)-.05*math.sin(SINE/32)-rightlegheight, -.3*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(-1.8),math.rad(-20.1),math.rad(17.4-5*math.sin(SINE/32)))*ANGLES(math.rad(0),math.rad(90),math.rad(0)), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-1.1*SIZE+.1 * SIN(SINE / 32), -.8*SIZE-.1 * COS(SINE / 32)+.05*math.sin(SINE/32)-leftlegheight, 0.1*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(-26.6),math.rad(23.2),math.rad(-9.5-5*math.sin(SINE/32)))*ANGLES(math.rad(0),math.rad(-90),math.rad(0)), 1 / Animation_Speed)
			elseif mode == 42 then
				Humanoid.WalkSpeed = 300
				NAMEMODE.Text = "oof speed"
				NAMEMODE.Font = "Arcade"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(217, 147, 72)
				NAMEMODE.TextColor3 = Color3.fromRGB(48+(sick.PlaybackLoudness * .4), 33+(sick.PlaybackLoudness * .3), 16)
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(-0.1+6*math.cos(SINE/25))), 1 / Animation_Speed)
				CHAT.Text = " "
				CHAT.Font = "IndieFlower"
				CHAT.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
				CHAT.TextColor3 = Color3.fromRGB(150, 1, 1)
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1), -0.2*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(-6+360 * COS(SINE / 30)), RAD(0+0 * COS(SINE / 30)), RAD(0+0 * COS(SINE / 30))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.6*SIZE-0 * COS(SINE / 1), 0.5*SIZE+0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(0+-75 * COS(SINE / 5)), RAD(0+0 * COS(SINE / 5)), RAD(0+0 * COS(SINE / 5))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.6*SIZE-0 * COS(SINE / 1), 0.5*SIZE+0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(0+75 * COS(SINE / 5)), RAD(0+0 * COS(SINE / 5)), RAD(0+0 * COS(SINE / 5))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE+0 * COS(SINE / 1), -1*SIZE+0 * COS(SINE / 1), -0.01*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(0+75 * COS(SINE / 5)), RAD(90+0 * COS(SINE / 5)), RAD(0+0 * COS(SINE / 5))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE+0 * COS(SINE / 1), -1*SIZE+0 * COS(SINE / 1), -0.01*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(0+-75 * COS(SINE / 5)), RAD(-90+0 * COS(SINE / 5)), RAD(0+0 * COS(SINE / 5))), 1 / Animation_Speed)

			elseif mode == 43 then
				--setsong(1495032271)
				Humanoid.WalkSpeed = 145
				NAMEMODE.Text = "Abstract"
				NAMEMODE.Font = "Fantasy"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(255, 179, 244)
				NAMEMODE.TextColor3 = Color3.fromRGB(16+(sick.PlaybackLoudness * .4), 0+(sick.PlaybackLoudness * .1), 16+(sick.PlaybackLoudness * .35))

				CHAT.Text = "ENDLESS POWER!"
				CHAT.Font = "Fantasy"
				CHAT.TextStrokeColor3 = Color3.fromRGB(255, 179, 244)
				CHAT.TextColor3 = Color3.fromRGB(16+(sick.PlaybackLoudness * .4), 0+(sick.PlaybackLoudness * .2), 16+(sick.PlaybackLoudness * .35))
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(-0.1+6*math.cos(SINE/25))), 1 / Animation_Speed)



				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0.4 * COS(SINE / 20), 0*SIZE+0.2 * COS(SINE / 20), 3.5*SIZE+0.7 * COS(SINE / 40)) * ANGLES(RAD(0+3 * COS(SINE / 19)), RAD(0+0 * COS(SINE / 19)), RAD(0+0 * COS(SINE / 19))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1*SIZE-0 * COS(SINE / 19.65), 0.15*SIZE+0.3 * COS(SINE / 18.35), 0.5*SIZE+0 * COS(SINE / 19.5)) * ANGLES(RAD(-50+0 * COS(SINE / 18.5)), RAD(-25+0 * COS(SINE / 18.65)), RAD(-40+0 * COS(SINE / 18.5))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.6*SIZE-0 * COS(SINE / 11), 0*SIZE+0 * COS(SINE / 11), 0*SIZE+0 * COS(SINE / 11)) * ANGLES(RAD(120+15 * COS(SINE / 20.25)), RAD(10+0 * COS(SINE / 20.75)), RAD(-10+5 * COS(SINE / 19.25))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 19.25), -0.4*SIZE+0.2 * COS(SINE / 19.25), 0*SIZE+0 * COS(SINE / 19.25)) * ANGLES(RAD(-45+-5 * COS(SINE / 18.75)), RAD(25+4 * COS(SINE / 18.75)), RAD(5+0 * COS(SINE / 18.75))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(0.5*SIZE+0 * COS(SINE / 18.25), -1*SIZE+0.3 * COS(SINE / 18.25), 0*SIZE+0 * COS(SINE / 18.25)) * ANGLES(RAD(-35+10 * COS(SINE / 18.5)), RAD(-10+0 * COS(SINE / 18.5)), RAD(-1+6 * COS(SINE / 18.5))), 1 / Animation_Speed)
			elseif mode == 44 then
				Humanoid.WalkSpeed = 20
				NAMEMODE.Text = "SANS"
				NAMEMODE.Font = "SourceSans"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(250, 250, 250)
				NAMEMODE.TextColor3 = Color3.fromRGB(170, 170, 250)
				CHAT.Text = "Burn in hell."
				CHAT.Font = "SourceSans"
				CHAT.TextStrokeColor3 = Color3.fromRGB(250, 250, 250)
				CHAT.TextColor3 = Color3.fromRGB(170, 170, 250)
				Neck.C0 = Clerp(Neck.C0, CF(0,1,0)*ANGLES(math.rad(-120),math.rad(0),RAD(-180-20 * COS(SINE / 12))), 1)
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0 - 0.04 * SIN(SINE / 24)*SIZE, 0 + 0.04 * SIN(SINE / 12)*SIZE, 0 + 0.05*SIZE * COS(SINE / 12)) * ANGLES(RAD(16 - 2.5 * SIN(SINE / 12)), RAD(0 - 2.5 * SIN(SINE / 24)), RAD(0)), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0,CF(-1.6,.5,0) * ANGLES(RAD(20),RAD(10),RAD(-20-10*SIN(SINE/12))) * LEFTSHOULDERC0,.7/3)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(1.4, 0.55, 0) * ANGLES(RAD(190 - 1 * COS(SINE / 15)), RAD(190 - 5*SIN(sick.PlaybackLoudness/500)), RAD(-5 + sick.PlaybackLoudness/545)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE, -1*SIZE + 0.06 * SIN(SINE / 24) - 0.05*SIZE * COS(SINE / 12), -0.01*SIZE) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(75), RAD(0)) * ANGLES(RAD(-10 - 2.5 * SIN(SINE / 24)), RAD(0), RAD(0)), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE, -1*SIZE - 0.06 * SIN(SINE / 24) - 0.05*SIZE * COS(SINE / 12), -0.01*SIZE) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(-75), RAD(-20)) * ANGLES(RAD(-10 + 2.5 * SIN(SINE / 24)), RAD(0), RAD(0)), 1 / Animation_Speed)
			elseif mode == 45 then
				Humanoid.WalkSpeed = 20
				NAMEMODE.Text = "FINAL BOSS"
				NAMEMODE.Font = "Arcade"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(250, 250, 250)
				NAMEMODE.TextColor3 = Color3.fromRGB(0+(sick.PlaybackLoudness * .3), 0+(sick.PlaybackLoudness * .3), 0+(sick.PlaybackLoudness * .3))
				CHAT.Text = "Game over!"
				CHAT.Font = "Arcade"
				CHAT.TextStrokeColor3 = Color3.fromRGB(250, 250, 250)
				CHAT.TextColor3 = Color3.fromRGB(0+(sick.PlaybackLoudness * .3), 0+(sick.PlaybackLoudness * .3), 0+(sick.PlaybackLoudness * .3))
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(-0.1+6*math.cos(SINE/25))), 1 / Animation_Speed)
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 12), 0*SIZE+0 * COS(SINE / 12), 3.5*SIZE+0.5 * COS(SINE / 12)) * ANGLES(RAD(10+5 * COS(SINE / 13)), RAD(0+0 * COS(SINE / 13)), RAD(0+0 * COS(SINE / 13))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.6*SIZE-0 * COS(SINE / 13), 0.2*SIZE+0.2 * COS(SINE / 13), 0.2*SIZE+0 * COS(SINE / 13)) * ANGLES(RAD(20+0 * COS(SINE / 12)), RAD(0+0 * COS(SINE / 12)), RAD(25+10 * COS(SINE / 12))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.6*SIZE-0 * COS(SINE / 13), 0.2*SIZE+0.2 * COS(SINE / 13), 0.2*SIZE+0 * COS(SINE / 13)) * ANGLES(RAD(20+0 * COS(SINE / 12)), RAD(0+0 * COS(SINE / 12)), RAD(-25+-10 * COS(SINE / 12))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.5*SIZE+0 * COS(SINE / 13), -0.5*SIZE+0.2 * COS(SINE / 13), -0.5*SIZE+0 * COS(SINE / 13)) * ANGLES(RAD(-45+5 * COS(SINE / 12)), RAD(-25+0 * COS(SINE / 12)), RAD(0+5 * COS(SINE / 12))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 13), -1*SIZE+0.1 * COS(SINE / 13), 0*SIZE+0 * COS(SINE / 13)) * ANGLES(RAD(15+10 * COS(SINE / 12)), RAD(10+0 * COS(SINE / 12)), RAD(-8+5 * COS(SINE / 12))), 1 / Animation_Speed)
			elseif mode == 46 then
				Humanoid.WalkSpeed = 20
				NAMEMODE.Text = "S T R E S S E D"
				NAMEMODE.Font = "Jura"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(20, 0, 0)
				NAMEMODE.TextColor3 = Color3.fromRGB(0+(sick.PlaybackLoudness * .3), 0, 0)

				CHAT.Text = "NO MORE!"
				CHAT.Font = "Jura"
				CHAT.TextStrokeColor3 = Color3.fromRGB(20, 0, 0)
				CHAT.TextColor3 = Color3.fromRGB(0+(sick.PlaybackLoudness * .3), 0, 0)
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(165+3*math.cos(SINE/28)),math.rad(-20.1+6*math.cos(SINE/25))), 1 / Animation_Speed)
				gunweld.C0 = Clerp(gunweld.C0, CF(-10*SIZE+0 * COS(SINE / 15), -10.7*SIZE-0 * COS(SINE /15), -10*SIZE+0 * COS(SINE / 15)) * ANGLES(RAD(70+-10 * COS(SINE / 19)), RAD(100+0* COS(SINE / 55)), RAD(0-0 * COS(SINE / 15))), 1 / Animation_Speed)

				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE+.2 * math.sin(SINE / 32), 0*SIZE+0 * COS(SINE / 1), 0*SIZE+.1 * math.cos(SINE / 32)) * ANGLES(math.rad(-9.6), RAD(-4.7+5 * math.sin(SINE / 32)), RAD(29.2+0 * COS(SINE / 1))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.6*SIZE-0 * COS(SINE / 1), .3*SIZE+.07 * math.sin(SINE / 30), 0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(-20),math.rad(-10),math.rad(22.7+10*math.sin(SINE/30))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.6*SIZE-0 * COS(SINE / 1), .3*SIZE-.07 * math.sin(SINE / 30), 0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(-20.5), math.rad(10), math.rad(-20.2-10*math.sin(SINE/30))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.9*SIZE+.1 * SIN(SINE / 32), -1*SIZE-.1 * COS(SINE / 32)-.05*math.sin(SINE/32)-rightlegheight, -.3*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(-1.8),math.rad(-20.1),math.rad(17.4-5*math.sin(SINE/32)))*ANGLES(math.rad(0),math.rad(90),math.rad(0)), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-1.1*SIZE+.1 * SIN(SINE / 32), -.8*SIZE-.1 * COS(SINE / 32)+.05*math.sin(SINE/32)-leftlegheight, 0.1*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(-26.6),math.rad(23.2),math.rad(-9.5-5*math.sin(SINE/32)))*ANGLES(math.rad(0),math.rad(-90),math.rad(0)), 1 / Animation_Speed)

			elseif mode == 47 then
				Humanoid.WalkSpeed = 20
				NAMEMODE.Text = "Memer"
				NAMEMODE.Font = "Fantasy"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(100, 100, 255)
				NAMEMODE.TextColor3 = Color3.fromRGB(0, 0, 0+(sick.PlaybackLoudness * 1))

				CHAT.Text = "Splish splash your opinion is trash!"
				CHAT.Font = "Fantasy"
				CHAT.TextStrokeColor3 = Color3.fromRGB(100, 100, 255)
				CHAT.TextColor3 = Color3.fromRGB(0, 0, 0+(sick.PlaybackLoudness * 1))
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(-0.1+6*math.cos(SINE/25))), 1 / Animation_Speed)

				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 8), 0*SIZE+0 * COS(SINE / 8), 5*SIZE+2.5 * COS(SINE / 8)) * ANGLES(RAD(0+360 * COS(SINE / 32)), RAD(0+0 * COS(SINE / 32)), RAD(0+360 * COS(SINE / 32))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.6*SIZE-0 * COS(SINE / 20), 0.5*SIZE+0.5 * COS(SINE / 20), 0*SIZE+0 * COS(SINE / 20)) * ANGLES(RAD(0+360 * COS(SINE / -15)), RAD(25+0 * COS(SINE / -15)), RAD(25+25 * COS(SINE / -15))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.6*SIZE-0 * COS(SINE / 20), 0.5*SIZE+0.5 * COS(SINE / 20), 0*SIZE+0 * COS(SINE / 20)) * ANGLES(RAD(0+360 * COS(SINE / -15)), RAD(25+0 * COS(SINE / -15)), RAD(-25+-25 * COS(SINE / -15))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.5*SIZE+0 * COS(SINE / 8), -1*SIZE+0.5 * COS(SINE / 8), 0*SIZE+0 * COS(SINE / 8)) * ANGLES(RAD(-25+25 * COS(SINE / 16)), RAD(0+0 * COS(SINE / 16)), RAD(-15+25 * COS(SINE / 16))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 8), -1*SIZE+0.5 * COS(SINE / 8), 0*SIZE+0 * COS(SINE / 8)) * ANGLES(RAD(-25+25 * COS(SINE / 16)), RAD(0+0 * COS(SINE / 16)), RAD(15+-25 * COS(SINE / 16))), 1 / Animation_Speed)

			elseif mode == 48 then
				Humanoid.WalkSpeed = 20
				NAMEMODE.Text = "CONTAMINATED"
				NAMEMODE.Font = "Antique"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
				NAMEMODE.TextColor3 = Color3.fromRGB(0, 10+(sick.PlaybackLoudness * 0.3), 0)

				CHAT.Text = "INTOXICATED."
				CHAT.Font = "Antique"
				CHAT.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
				CHAT.TextColor3 = Color3.fromRGB(0, 10+(sick.PlaybackLoudness * 0.3), 0)
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(100.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(-0.1+6*math.cos(SINE/25))), 1 / Animation_Speed)

				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 15), 0*SIZE+0 * COS(SINE / 15), 0*SIZE+0.3 * COS(SINE / 15)) * ANGLES(RAD(25+10 * COS(SINE / 16)), RAD(0+0 * COS(SINE / 16)), RAD(0+0 * COS(SINE / 16))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(-1.3*SIZE-0 * COS(SINE / 15), 0*SIZE+0.2 * COS(SINE / 15), 0*SIZE+0 * COS(SINE / 15)) * ANGLES(RAD(25+25 * COS(SINE / 16)), RAD(0+0 * COS(SINE / 16)), RAD(-10+10 * COS(SINE / 16))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(1.3*SIZE-0 * COS(SINE / 15), 0*SIZE+0 * COS(SINE / 15), 0*SIZE+-0.2 * COS(SINE / 15)) * ANGLES(RAD(-45+10 * COS(SINE / 16)), RAD(-14+5 * COS(SINE / 16)), RAD(10+2 * COS(SINE / 16))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.5*SIZE+0 * COS(SINE / 15), -1.2*SIZE+-0.2 * COS(SINE / 15), 0*SIZE+-0.2 * COS(SINE / 15)) * ANGLES(RAD(25+15 * COS(SINE / 16)), RAD(-15+5 * COS(SINE / 16)), RAD(8+3 * COS(SINE / 16))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 15), -1*SIZE+-0.2 * COS(SINE / 15), 0*SIZE+0 * COS(SINE / 15)) * ANGLES(RAD(25+15 * COS(SINE / 16)), RAD(0+-5 * COS(SINE / 16)), RAD(-8+5 * COS(SINE / 16))), 1 / Animation_Speed)
			elseif mode == 49 then
				Humanoid.WalkSpeed = 20
				NAMEMODE.Text = "EYOZEN"
				NAMEMODE.Font = "Fantasy"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
				NAMEMODE.TextColor3 = Color3.fromRGB(0+(sick.PlaybackLoudness * 0.2), 0, 0+(sick.PlaybackLoudness * 0.3))

				CHAT.Text = "GASTRO!"
				CHAT.Font = "Fantasy"
				CHAT.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
				CHAT.TextColor3 = Color3.fromRGB(0+(sick.PlaybackLoudness * 0.2), 0, 0+(sick.PlaybackLoudness * 0.3))
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(-0.1+720*math.cos(SINE/50))), 1 / Animation_Speed)

				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 1 * COS(SINE / 32), 0*SIZE+0 * COS(SINE / 16), 4*SIZE+1 * COS(SINE / 16)) * ANGLES(RAD(0+3 * COS(SINE / 15)), RAD(0+2 * COS(SINE / 15)), RAD(0+-15 * COS(SINE / 32))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.6*SIZE-0 * COS(SINE / 17), 0.3*SIZE+0.2 * COS(SINE / 17), 0.4*SIZE+0 * COS(SINE / 17)) * ANGLES(RAD(0+-15 * COS(SINE / 15)), RAD(-15+5 * COS(SINE / 15)), RAD(22+5 * COS(SINE / 15))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.6*SIZE-0 * COS(SINE / 17), 0.3*SIZE+0.2 * COS(SINE / 17), 0.4*SIZE+0 * COS(SINE / 17)) * ANGLES(RAD(0+-15 * COS(SINE / 15)), RAD(15+-5 * COS(SINE / 15)), RAD(-25+-5 * COS(SINE / 15))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.5*SIZE+0 * COS(SINE / 16), -1*SIZE+0.2 * COS(SINE / 16), 0.5*SIZE+0 * COS(SINE / 16)) * ANGLES(RAD(-25+-4 * COS(SINE / 15)), RAD(-25+4 * COS(SINE / 15)), RAD(0+4 * COS(SINE / 15))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 16), -0.3*SIZE+0.2 * COS(SINE / 16), 0*SIZE+0 * COS(SINE / 16)) * ANGLES(RAD(-15+-5 * COS(SINE / 15)), RAD(15+5 * COS(SINE / 15)), RAD(0+-5 * COS(SINE / 15))), 1 / Animation_Speed)

			elseif mode == 50 then
				--setsong(6080083300)
				Humanoid.WalkSpeed = 20
				NAMEMODE.Text = "ENIGMA"
				NAMEMODE.Font = "Fantasy"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(20, 0, 0)
				NAMEMODE.TextColor3 = Color3.fromRGB(0, 0, 0)
				CHAT.Text = " "
				CHAT.Font = "Fantasy"
				CHAT.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
				CHAT.TextColor3 = Color3.fromRGB(0+(sick.PlaybackLoudness * 0.2), 0, 0+(sick.PlaybackLoudness * 0.3))
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(165+5*math.cos(SINE/28)),math.rad(-0.1+6*math.cos(SINE/25))), 1 / Animation_Speed)
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE+.2 * math.sin(SINE / 32), 0*SIZE+0 * COS(SINE / 1), 0*SIZE+.1 * math.cos(SINE / 32)) * ANGLES(math.rad(-9.6), RAD(-4.7+5 * math.sin(SINE / 32)), RAD(29.2+0 * COS(SINE / 1))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(-0.8*SIZE-0 * COS(SINE / 28), 0*SIZE+0.3 * COS(SINE / 28), -0.5*SIZE+0 * COS(SINE / 28)) * ANGLES(RAD(70+5 * COS(SINE / 29)), RAD(-10+5 * COS(SINE / 29)), RAD(60+0 * COS(SINE / 29))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(0.6*SIZE-0 * COS(SINE / 28), 0.3*SIZE+0.2 * COS(SINE / 28), -0.5*SIZE+0 * COS(SINE / 28)) * ANGLES(RAD(140+10 * COS(SINE / 29.5)), RAD(-10+5 * COS(SINE / 29.5)), RAD(-80+0 * COS(SINE / 29.5))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.9*SIZE+.1 * SIN(SINE / 32), -1*SIZE-.1 * COS(SINE / 32)-.05*math.sin(SINE/32)-rightlegheight, -.3*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(-1.8),math.rad(-20.1),math.rad(17.4-5*math.sin(SINE/32)))*ANGLES(math.rad(0),math.rad(90),math.rad(0)), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-1.1*SIZE+.1 * SIN(SINE / 32), -.8*SIZE-.1 * COS(SINE / 32)+.05*math.sin(SINE/32)-leftlegheight, 0.1*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(-26.6),math.rad(23.2),math.rad(-9.5-5*math.sin(SINE/32)))*ANGLES(math.rad(0),math.rad(-90),math.rad(0)), 1 / Animation_Speed)
			elseif mode == 51 then
				--setsong(6131568941)
				Humanoid.WalkSpeed = 20
				NAMEMODE.Text = "D E T E R M I N E D"
				NAMEMODE.Font = "Arcade"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(100, 0, 0)
				NAMEMODE.TextColor3 = Color3.fromRGB(155, 0, 0)

				CHAT.Text = "I WONT GIVE UP MY DREAM!"
				CHAT.Font = "Arcade"
				CHAT.TextStrokeColor3 = Color3.fromRGB(100, 0, 0)
				CHAT.TextColor3 = Color3.fromRGB(155, 0, 0)

				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(165+5*math.cos(SINE/28)),math.rad(-0.1+6*math.cos(SINE/25))), 1 / Animation_Speed)

				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 20), 0*SIZE+0 * COS(SINE / 20), -0.5*SIZE+0.3 * COS(SINE / 20)) * ANGLES(RAD(35+6 * COS(SINE / 19)), RAD(-10+0 * COS(SINE / 19)), RAD(5+0 * COS(SINE / 19))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1*SIZE-0 * COS(SINE / 19), 0.5*SIZE+0.2 * COS(SINE / 19), -1*SIZE+0 * COS(SINE / 19)) * ANGLES(RAD(190+10 * COS(SINE / 20)), RAD(5+5 * COS(SINE / 20)), RAD(-25+0 * COS(SINE / 20))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.6*SIZE-0 * COS(SINE / 20), 0.2*SIZE+0.1 * COS(SINE / 20), 0*SIZE+0 * COS(SINE / 20)) * ANGLES(RAD(200+10 * COS(SINE / 19)), RAD(0+5 * COS(SINE / 19)), RAD(-25+5 * COS(SINE / 19))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.5*SIZE+0 * COS(SINE / 20), -0.3*SIZE+-0.3 * COS(SINE / 20), -0.5*SIZE+0 * COS(SINE / 20)) * ANGLES(RAD(35+6 * COS(SINE / 19)), RAD(-10+10 * COS(SINE / 19)), RAD(15+3 * COS(SINE / 19))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 20), -1.2*SIZE+-0.3 * COS(SINE / 20), 0*SIZE+-0.2 * COS(SINE / 20)) * ANGLES(RAD(-35+6 * COS(SINE / 19)), RAD(10+5 * COS(SINE / 19)), RAD(8+3 * COS(SINE / 19))), 1 / Animation_Speed)

			elseif mode == 52 then
				--setsong(1511734302)
				Humanoid.WalkSpeed = 20
				NAMEMODE.Text = "rollin"
				NAMEMODE.Font = "Arcade"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
				NAMEMODE.TextColor3 = Color3.fromRGB(0+(sick.PlaybackLoudness * .3), 0+(sick.PlaybackLoudness * .3), 0+(sick.PlaybackLoudness * .3))
				CHAT.Text = "rollin"
				CHAT.Font = "Arcade"
				CHAT.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
				CHAT.TextColor3 = Color3.fromRGB(0+(sick.PlaybackLoudness * .3), 0+(sick.PlaybackLoudness * .3), 0+(sick.PlaybackLoudness * .3))
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(-0.1+6*math.cos(SINE/25))), 1 / Animation_Speed)
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- -3 * COS(SINE / 4), 0*SIZE+3 * COS(SINE / -10), -0.5*SIZE+0 * COS(SINE / 20)) * ANGLES(RAD(0+0 * COS(SINE / 1)), RAD(-15+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.6*SIZE-0 * COS(SINE / 14), 0.5*SIZE+0 * COS(SINE / 14), 0*SIZE+0 * COS(SINE / 14)) * ANGLES(RAD(0+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1)), RAD(90+0 * COS(SINE / 1))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.6*SIZE-0 * COS(SINE / 1), 0.5*SIZE+0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(90+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1)), RAD(-90+0 * COS(SINE / 1))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.5*SIZE+0 * COS(SINE / 1), -0.3*SIZE+0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(0+0 * COS(SINE / 1)), RAD(-15+0 * COS(SINE / 1)), RAD(20+0 * COS(SINE / 1))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 1), -1*SIZE+0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(0+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1)), RAD(-30+0 * COS(SINE / 1))), 1 / Animation_Speed)

			elseif mode == 53 then
				--setsong(4027028379)
				Humanoid.WalkSpeed = 20
				NAMEMODE.Text = "DEmENTed"
				NAMEMODE.Font = "Arcade"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
				NAMEMODE.TextColor3 = Color3.fromRGB(0, 0, 0)

				CHAT.Text = "[2309:24] unexpected idenifier near 'demented'"
				CHAT.Font = "Arcade"
				CHAT.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
				CHAT.TextColor3 = Color3.fromRGB(0, 0, 0)

				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/4)),math.rad(-0.1+6*math.cos(SINE/25))), 1 / Animation_Speed)
				if MRANDOM(1,10) == 1 then
					Neck.C0 = Clerp(Neck.C0,NECKC0 * ANGLES(RAD(20+MRANDOM(-20,20)),RAD((10*COS(SINE/100))+MRANDOM(-20,20)),RAD(MRANDOM(-20,20))),1)
				end
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 10), 0*SIZE+0 * COS(SINE / 10), -0.15*SIZE+0.3 * COS(SINE / 10)) * ANGLES(math.rad(0+5*math.cos(SINE/11)), RAD(-15+0 * COS(SINE / 11)), RAD(-0+0 * COS(SINE / 11))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(-1.3*SIZE-0 * COS(SINE / 11.5), 1*SIZE+0.1 * COS(SINE / 11.5), 0.5*SIZE+0 * COS(SINE / 11.5)) * ANGLES(RAD(160+10 * COS(SINE / 12)), RAD(-25+0 * COS(SINE / 12)), RAD(25+5 * COS(SINE / 12))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(1.3*SIZE-0 * COS(SINE / 11), 0.1*SIZE+0.2 * COS(SINE / 11), 0.3*SIZE+0 * COS(SINE / 11)) * ANGLES(RAD(15+10 * COS(SINE / 12)), RAD(-5+5 * COS(SINE / 12)), RAD(25+10 * COS(SINE / 12))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.5*SIZE+0 * COS(SINE / 10), -0.7*SIZE+-0.3 * COS(SINE / 10), 0*SIZE+0 * COS(SINE / 10)) * ANGLES(math.rad(0+5*math.cos(SINE/11)), RAD(-10+0 * COS(SINE / 11)), RAD(25+3 * COS(SINE / 11))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 10), -1*SIZE+-0.3 * COS(SINE / 10), 0*SIZE+0 * COS(SINE / 10)) * ANGLES(math.rad(0+5*math.cos(SINE/11)), RAD(10+0 * COS(SINE / 11)), RAD(-5+0 * COS(SINE / 11))), 1 / Animation_Speed)

			elseif mode == 54 then
				Humanoid.WalkSpeed = 20
				NAMEMODE.Text = "SOVEREIGNED"
				NAMEMODE.Font = "Code"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(128, 224, 76)
				NAMEMODE.TextColor3 = Color3.fromRGB(179, 255, 138)
				CHAT.Text = "IM AWOKEN!"
				CHAT.Font = "Code"
				CHAT.TextStrokeColor3 = Color3.fromRGB(128, 224, 76)
				CHAT.TextColor3 = Color3.fromRGB(179, 255, 138)
				gunweld.C0 = Clerp(gunweld.C0, CF(0*SIZE+0 * COS(SINE / 15), 0*SIZE+0 * COS(SINE /15), 0*SIZE+0 * COS(SINE / 15)) * ANGLES(RAD(0+0 * COS(SINE / 19)), RAD(180+0* COS(SINE / 55)), RAD(0+0 * COS(SINE / 15))), 1 / Animation_Speed)
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(195+3*math.cos(SINE/28)),math.rad(40.1+6*math.cos(SINE/25))), 1 / Animation_Speed)
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 15), 0*SIZE+0 * COS(SINE / 15), 2.5*SIZE+0.5 * COS(SINE / 15)) * ANGLES(RAD(0+6 * COS(SINE / 16)), RAD(10+0 * COS(SINE / 16)), RAD(0+0 * COS(SINE / 16))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(0.7*SIZE-0 * COS(SINE / 13.5), 0*SIZE+0.15 * COS(SINE / 13.5), -0.5*SIZE+0 * COS(SINE / 13.5)) * ANGLES(RAD(80+0 * COS(SINE / 14.5)), RAD(0+-2 * COS(SINE / 14.5)), RAD(-80+5 * COS(SINE / 14.5))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-0.7*SIZE-0 * COS(SINE / 13.5), 0.3*SIZE+0.15 * COS(SINE / 13.5), -0.5*SIZE+0 * COS(SINE / 13.5)) * ANGLES(RAD(190+0 * COS(SINE / 14.5)), RAD(0+2 * COS(SINE / 14.5)), RAD(80+-5 * COS(SINE / 14.5))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.5*SIZE+0 * COS(SINE / 12), -1*SIZE+0.1 * COS(SINE / 12), 0*SIZE+0 * COS(SINE / 12)) * ANGLES(RAD(-25+10 * COS(SINE / 12.5)), RAD(-20+0 * COS(SINE / 12.5)), RAD(10+10 * COS(SINE / 12.5))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 12), -0.5*SIZE+0.1 * COS(SINE / 12), 0*SIZE+0 * COS(SINE / 12)) * ANGLES(RAD(0+10 * COS(SINE / 12.5)), RAD(10+-10 * COS(SINE / 12.5)), RAD(-10+-5 * COS(SINE / 12.5))), 1 / Animation_Speed)
			elseif mode == 55 then
				Humanoid.WalkSpeed = 20
				NAMEMODE.Text = "EXTINCTION"
				NAMEMODE.Font = "Code"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(50, 50, 50)
				NAMEMODE.TextColor3 = Color3.fromRGB(0, 0, 0)

				CHAT.Text = "ALL WILL CEASE!"
				CHAT.Font = "Code"
				CHAT.TextStrokeColor3 = Color3.fromRGB(50, 50, 50)
				CHAT.TextColor3 = Color3.fromRGB(0, 0, 0)

				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 17), 0*SIZE+0 * COS(SINE / 17), 0*SIZE+0.3 * COS(SINE / 17)) * ANGLES(RAD(-15+5 * COS(SINE / 16)), RAD(0+0 * COS(SINE / 16)), RAD(0+0 * COS(SINE / 16))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1*SIZE-0 * COS(SINE / 16.5), 0.8*SIZE+0.15 * COS(SINE / 16.5), -0.3*SIZE+0 * COS(SINE / 16.5)) * ANGLES(RAD(180+10 * COS(SINE / 17.5)), RAD(10+0 * COS(SINE / 17.5)), RAD(-45+0 * COS(SINE / 17.5))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1*SIZE-0 * COS(SINE / 16.5), 0.8*SIZE+0.15 * COS(SINE / 16.5), -0.3*SIZE+0 * COS(SINE / 16.5)) * ANGLES(RAD(170+10 * COS(SINE / 17.5)), RAD(-10+0 * COS(SINE / 17.5)), RAD(45+0 * COS(SINE / 17.5))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.4*SIZE+0 * COS(SINE / 17), -1*SIZE+-0.3 * COS(SINE / 17), 0*SIZE+0 * COS(SINE / 17)) * ANGLES(RAD(-15+10 * COS(SINE / 16)), RAD(-25+-5 * COS(SINE / 16)), RAD(10+-3 * COS(SINE / 16))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.4*SIZE+0 * COS(SINE / 17), -1*SIZE+-0.3 * COS(SINE / 17), 0*SIZE+0 * COS(SINE / 17)) * ANGLES(RAD(-15+10 * COS(SINE / 16)), RAD(25+5 * COS(SINE / 16)), RAD(-10+3 * COS(SINE / 16))), 1 / Animation_Speed)

			elseif mode == 56 then
				--setsong(259554386)
				Humanoid.WalkSpeed = 20
				NAMEMODE.Text = "Goodcop"
				NAMEMODE.Font = "Arcade"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(0, 150, 0)
				NAMEMODE.TextColor3 = Color3.fromRGB(0, 255, 0)

				CHAT.Text = "So long, criminal!"
				CHAT.Font = "Arcade"
				CHAT.TextStrokeColor3 = Color3.fromRGB(0, 150, 0)
				CHAT.TextColor3 = Color3.fromRGB(0, 255, 0)
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE+.2 * math.sin(SINE / 32), 0*SIZE+0 * COS(SINE / 1), 0*SIZE+.1 * math.cos(SINE / 32)) * ANGLES(math.rad(0), RAD(0+5 * math.sin(SINE / 32)), RAD(0+0 * COS(SINE / 1))), 1 / Animation_Speed)
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.2*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(99.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(-25.1+6*math.cos(SINE/25))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1*SIZE-0 * COS(SINE / 20), 0*SIZE+0.2 * COS(SINE / 20), 1*SIZE+0 * COS(SINE / 20)) * ANGLES(RAD(10+0 * COS(SINE / 21)), RAD(25+0 * COS(SINE / 21)), RAD(-35+-5 * COS(SINE / 21))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1*SIZE-0 * COS(SINE / 20), 0*SIZE+0.2 * COS(SINE / 20), 1*SIZE+0 * COS(SINE / 20)) * ANGLES(RAD(10+0 * COS(SINE / 21)), RAD(-25+0 * COS(SINE / 21)), RAD(25+5 * COS(SINE / 21))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.9*SIZE+.1 * SIN(SINE / 32), -1*SIZE-.1 * COS(SINE / 32)-.05*math.sin(SINE/32)-rightlegheight, -.3*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(10.8),math.rad(-3.1),math.rad(17.4-5*math.sin(SINE/32)))*ANGLES(math.rad(0),math.rad(90),math.rad(0)), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-1.1*SIZE+.1 * SIN(SINE / 32), -.8*SIZE-.1 * COS(SINE / 32)+.05*math.sin(SINE/32)-leftlegheight, 0.1*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(-6.6),math.rad(5.2),math.rad(-9.5-5*math.sin(SINE/32)))*ANGLES(math.rad(0),math.rad(-90),math.rad(0)), 1 / Animation_Speed) 

			elseif mode == 57 then
				--setsong(393346130)
				Humanoid.WalkSpeed = 20
				NAMEMODE.Text = "Badcop"
				NAMEMODE.Font = "Arcade"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(150, 0, 0)
				NAMEMODE.TextColor3 = Color3.fromRGB(0, 0, 0)

				CHAT.Text = "I'LL BREAK YOU!"
				CHAT.Font = "Arcade"
				CHAT.TextStrokeColor3 = Color3.fromRGB(150, 0, 0)
				CHAT.TextColor3 = Color3.fromRGB(0, 0, 0)
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE+.2 * math.sin(SINE / 32), 0*SIZE+0 * COS(SINE / 1), 0*SIZE+.1 * math.cos(SINE / 32)) * ANGLES(math.rad(0), RAD(0+5 * math.sin(SINE / 32)), RAD(0+0 * COS(SINE / 1))), 1 / Animation_Speed)
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.2*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(70.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(-0.1+36*math.cos(SINE/25))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(0.7*SIZE-0 * COS(SINE / 13.5), 0*SIZE+0.15 * COS(SINE / 13.5), -1*SIZE+0 * COS(SINE / 13.5)) * ANGLES(RAD(80+0 * COS(SINE / 14.5)), RAD(0+-2 * COS(SINE / 14.5)), RAD(-80+5 * COS(SINE / 14.5))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-0.7*SIZE-0 * COS(SINE / 13.5), 0.3*SIZE+0.15 * COS(SINE / 13.5), -1*SIZE+0 * COS(SINE / 13.5)) * ANGLES(RAD(190+0 * COS(SINE / 14.5)), RAD(0+2 * COS(SINE / 14.5)), RAD(80+-5 * COS(SINE / 14.5))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.9*SIZE+.1 * SIN(SINE / 32), -1*SIZE-.1 * COS(SINE / 32)-.05*math.sin(SINE/32)-rightlegheight, -.3*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(10.8),math.rad(-3.1),math.rad(17.4-5*math.sin(SINE/32)))*ANGLES(math.rad(0),math.rad(90),math.rad(0)), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-1.1*SIZE+.1 * SIN(SINE / 32), -.8*SIZE-.1 * COS(SINE / 32)+.05*math.sin(SINE/32)-leftlegheight, 0.1*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(-6.6),math.rad(5.2),math.rad(-9.5-5*math.sin(SINE/32)))*ANGLES(math.rad(0),math.rad(-90),math.rad(0)), 1 / Animation_Speed) 

			elseif mode == 58 then
				--setsong(3213198902)
				Humanoid.WalkSpeed = 20
				NAMEMODE.Text = "Helix"
				NAMEMODE.Font = "Arcade"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
				NAMEMODE.TextColor3 = Color3.fromRGB(255,255,55)

				CHAT.Text = "4th Dimension!"
				CHAT.Font = "Arcade"
				CHAT.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
				CHAT.TextColor3 = Color3.fromRGB(255,255,55)

				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.2*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(70.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(-9.1+6*math.cos(SINE/25))), 1 / Animation_Speed)
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 16), 0*SIZE+0 * COS(SINE / 16), 0*SIZE+0.3 * COS(SINE / 16)) * ANGLES(RAD(0+5 * COS(SINE / 15)), RAD(0+0 * COS(SINE / 15)), RAD(0+0 * COS(SINE / 15))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1*SIZE-0 * COS(SINE / 16.5), 0*SIZE+0.25 * COS(SINE / 16.5), -0.5*SIZE+0 * COS(SINE / 16.5)) * ANGLES(RAD(25+5 * COS(SINE / 15.5)), RAD(10+8 * COS(SINE / 15.5)), RAD(-25+-5 * COS(SINE / 15.5))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1*SIZE-0 * COS(SINE / 16.5), 0*SIZE+0.25 * COS(SINE / 16.5), -0.5*SIZE+0 * COS(SINE / 16.5)) * ANGLES(RAD(25+5 * COS(SINE / 15.5)), RAD(-10+-8 * COS(SINE / 15.5)), RAD(25+5 * COS(SINE / 15.5))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.45*SIZE+0 * COS(SINE / 16), -1*SIZE+-0.3 * COS(SINE / 16), 0*SIZE+0 * COS(SINE / 16)) * ANGLES(RAD(0+8 * COS(SINE / 15)), RAD(-15+0 * COS(SINE / 15)), RAD(8+0 * COS(SINE / 15))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.45*SIZE+0 * COS(SINE / 16), -1*SIZE+-0.3 * COS(SINE / 16), 0*SIZE+0 * COS(SINE / 16)) * ANGLES(RAD(0+8 * COS(SINE / 15)), RAD(15+0 * COS(SINE / 15)), RAD(-8+0 * COS(SINE / 15))), 1 / Animation_Speed)

			elseif mode == 59 then
				--setsong(6074204488)
				Humanoid.WalkSpeed = 20
				NAMEMODE.Text = "STRAINED"
				NAMEMODE.Font = "Fantasy"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(0, 0, 50)
				NAMEMODE.TextColor3 = Color3.fromRGB(0+(sick.PlaybackLoudness * .3), 0+(sick.PlaybackLoudness * .3), 100+(sick.PlaybackLoudness * .2))

				CHAT.Text = "I can't take this any longer..."
				CHAT.Font = "Fantasy"
				CHAT.TextStrokeColor3 = Color3.fromRGB(0, 0, 50)
				CHAT.TextColor3 = Color3.fromRGB(0+(sick.PlaybackLoudness * .3), 0+(sick.PlaybackLoudness * .3), 100+(sick.PlaybackLoudness * .2))

				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.2*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(70.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(25.1+6*math.cos(SINE/25))), 1 / Animation_Speed)
				if MRANDOM(1,15) == 1 then
					Neck.C0 = Clerp(Neck.C0,NECKC0 * ANGLES(RAD(20+MRANDOM(-20,20)),RAD((10*COS(SINE/100))+MRANDOM(-20,20)),RAD(MRANDOM(-20,20))),1)
				end
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 13), 0*SIZE+0 * COS(SINE / 13), 0*SIZE+0.25 * COS(SINE / 13)) * ANGLES(RAD(15+5 * COS(SINE / 14)), RAD(10+0 * COS(SINE / 14)), RAD(0+0 * COS(SINE / 14))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(-1.3*SIZE-0 * COS(SINE / 13.5), 0.5*SIZE+0.15 * COS(SINE / 13.5), 0.5*SIZE+0 * COS(SINE / 13.5)) * ANGLES(RAD(160+3 * COS(SINE / 14.5)), RAD(-25+10 * COS(SINE / 14.5)), RAD(25+2 * COS(SINE / 14.5))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(1.3*SIZE-0 * COS(SINE / 13.5), 0*SIZE+0.2 * COS(SINE / 13.5), 0*SIZE+0 * COS(SINE / 13.5)) * ANGLES(RAD(-25+5 * COS(SINE / 14.5)), RAD(-15+0 * COS(SINE / 14.5)), RAD(25+10 * COS(SINE / 14.5))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.5*SIZE+0 * COS(SINE / 13), -1.2*SIZE+-0.3 * COS(SINE / 13), 0.3*SIZE+0 * COS(SINE / 13)) * ANGLES(RAD(-15+5 * COS(SINE / 14)), RAD(-15+-5 * COS(SINE / 14)), RAD(10+-5 * COS(SINE / 14))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 13), -1*SIZE+-0.3 * COS(SINE / 13), 0*SIZE+0 * COS(SINE / 13)) * ANGLES(RAD(25+5 * COS(SINE / 14)), RAD(15+5 * COS(SINE / 14)), RAD(-10+5 * COS(SINE / 14))), 1 / Animation_Speed)

			elseif mode == 60 then
				Humanoid.WalkSpeed = 20
				NAMEMODE.Text = "INFUSED"
				NAMEMODE.Font = "Fantasy"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(222, 199, 24)
				NAMEMODE.TextColor3 = Color3.fromRGB(0, 0, 0)
				CHAT.Text = " "
				CHAT.Font = "Fantasy"
				CHAT.TextStrokeColor3 = Color3.fromRGB(222, 199, 24)
				CHAT.TextColor3 = Color3.fromRGB(0, 0, 0)
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.2*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(70.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(0.1+6*math.cos(SINE/25))), 1 / Animation_Speed)
				if MRANDOM(1,20) == 1 then
					Neck.C0 = Clerp(Neck.C0,NECKC0 * ANGLES(RAD(20+MRANDOM(-20,20)),RAD((10*COS(SINE/100))+MRANDOM(-20,20)),RAD(MRANDOM(-20,20))),1)
				end
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 15), 0*SIZE+0 * COS(SINE / 15), 5.3*SIZE+0.7 * COS(SINE / 15)) * ANGLES(RAD(35+10 * COS(SINE / 16)), RAD(0+0 * COS(SINE / 16)), RAD(0+0 * COS(SINE / 16))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.2*SIZE-0 * COS(SINE / 16.5), 0*SIZE+0 * COS(SINE / 16.5), 1*SIZE+0 * COS(SINE / 16.5)) * ANGLES(RAD(15+10 * COS(SINE / 15.25)), RAD(-25+5 * COS(SINE / 15.25)), RAD(-35+10 * COS(SINE / 15.25))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.6*SIZE-0 * COS(SINE / 16.5), 0*SIZE+0 * COS(SINE / 16.5), 0*SIZE+0 * COS(SINE / 16.5)) * ANGLES(RAD(15+15 * COS(SINE / 15.25)), RAD(-10+5 * COS(SINE / 15.25)), RAD(-25+10 * COS(SINE / 15.25))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.5*SIZE+0 * COS(SINE / 15.5), -1*SIZE+0.3 * COS(SINE / 15.5), 0*SIZE+0 * COS(SINE / 15.5)) * ANGLES(RAD(0+15 * COS(SINE / 14.5)), RAD(-15+10 * COS(SINE / 14.5)), RAD(8+10 * COS(SINE / 14.5))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 15.75), -0.8*SIZE+0.3 * COS(SINE / 15.75), 0*SIZE+0 * COS(SINE / 15.75)) * ANGLES(RAD(-15+8 * COS(SINE / 14)), RAD(15+0 * COS(SINE / 14)), RAD(-8+-10 * COS(SINE / 14))), 1 / Animation_Speed)
			elseif mode == 61 then
				Humanoid.WalkSpeed = 20
				NAMEMODE.Text = "REPRESSIVE"
				NAMEMODE.Font = "Arcade"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(5, 10, 5)
				NAMEMODE.TextColor3 = Color3.fromRGB(10+(sick.PlaybackLoudness * 0.1), 10+(sick.PlaybackLoudness * 0.3), 10+(sick.PlaybackLoudness * 0.1))
				CHAT.Text = "Just you wait.."
				CHAT.Font = "Arcade"
				CHAT.TextStrokeColor3 = Color3.fromRGB(5, 10, 5)
				CHAT.TextColor3 = Color3.fromRGB(10+(sick.PlaybackLoudness * 0.1), 10+(sick.PlaybackLoudness * 0.3), 10+(sick.PlaybackLoudness * 0.1))
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+0*math.cos(SINE/4)),math.rad(90.1+6*math.cos(SINE/25))), 1 / Animation_Speed)
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 15), 0*SIZE+0 * COS(SINE / 15), -0.2*SIZE+0.3 * COS(SINE / 15)) * ANGLES(RAD(10+3 * COS(SINE / 16)), RAD(0+0 * COS(SINE / 16)), RAD(-90+0 * COS(SINE / 16))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(-1.3*SIZE-0 * COS(SINE / 15.5), 0*SIZE+0.2 * COS(SINE / 15.5), 0*SIZE+0 * COS(SINE / 15.5)) * ANGLES(RAD(180+5 * COS(SINE / 16.5)), RAD(-26+5 * COS(SINE / 16.5)), RAD(10+3 * COS(SINE / 16.5))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(1.3*SIZE-0 * COS(SINE / 15.5), 0*SIZE+0 * COS(SINE / 15.5), 0*SIZE+0 * COS(SINE / 15.5)) * ANGLES(RAD(-15+0 * COS(SINE / 16)), RAD(-10+5 * COS(SINE / 16)), RAD(45+-5 * COS(SINE / 16))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.5*SIZE+0 * COS(SINE / 15), -1*SIZE+-0.3 * COS(SINE / 15), 0*SIZE+0 * COS(SINE / 15)) * ANGLES(RAD(-15+10 * COS(SINE / 16)), RAD(-15+0 * COS(SINE / 16)), RAD(8+-5 * COS(SINE / 16))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 15), -0.7*SIZE+-0.3 * COS(SINE / 15), 0*SIZE+0 * COS(SINE / 15)) * ANGLES(RAD(0+3 * COS(SINE / 16)), RAD(25+0 * COS(SINE / 16)), RAD(-10+-3 * COS(SINE / 16))), 1 / Animation_Speed)
			elseif mode == 62 then
				Humanoid.WalkSpeed = 20
				NAMEMODE.Text = "Kingston"
				NAMEMODE.Font = "Arcade"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(10, 0, 20)
				NAMEMODE.TextColor3 = Color3.fromRGB(50, 10, 100)
				CHAT.Text = ""
				CHAT.Font = "Arcade"
				CHAT.TextStrokeColor3 = Color3.fromRGB(10, 0, 20)
				CHAT.TextColor3 = Color3.fromRGB(50, 10, 100)
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(-0.1+6*math.cos(SINE/25))), 1 / Animation_Speed)
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- .5 * COS(SINE / 12.5), 0*SIZE+0 * COS(SINE / 13), 4*SIZE+3 * COS(SINE / 15)) * ANGLES(RAD(8-11 * COS(SINE /15)), RAD(0+2 * COS(SINE / 13.5)), RAD(0-3 * COS(SINE / 12.5))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(0.72*SIZE-0 * COS(SINE / 13), 0*SIZE+0.23 * COS(SINE / 13), -0.4*SIZE+0 * COS(SINE / 13)) * ANGLES(RAD(69.4+7 * COS(SINE / 13.5)), RAD(325.3+7 * COS(SINE / 13.5)), RAD(-82.41+7 * COS(SINE / 13.5))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-0.72*SIZE-0 * COS(SINE / 13), 0*SIZE+0.2 * COS(SINE / 13), -0.4*SIZE+0 * COS(SINE / 13)) * ANGLES(RAD(117.11+-7 * COS(SINE / 13.5)), RAD(346.99+-7 * COS(SINE / 13.5)), RAD(82.41+-7 * COS(SINE / 13.5))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.5*SIZE+0 * COS(SINE / 13), -0.3*SIZE+0.2 * COS(SINE / 13), -0.2*SIZE+0 * COS(SINE / 13)) * ANGLES(RAD(-25+4 * COS(SINE / 13.5)), RAD(-16+5 * COS(SINE / 13.5)), RAD(0+-5 * COS(SINE / 13.5))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 13), -1*SIZE+0.3 * COS(SINE / 13), 0.3*SIZE+0 * COS(SINE / 13)) * ANGLES(RAD(-25+4 * COS(SINE / 13.5)), RAD(25+5 * COS(SINE / 13.5)), RAD(0+5 * COS(SINE / 13.5))), 1 / Animation_Speed)

			elseif mode == 63 then
				--setsong(7873813713)
				Humanoid.WalkSpeed = 20
				NAMEMODE.Text = "Temptation"
				NAMEMODE.Font = "JosefinSans"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(255, 145, 0)
				NAMEMODE.TextColor3 = Color3.fromRGB(255+(sick.PlaybackLoudness * .3), 187+(sick.PlaybackLoudness * .3), 61)

				CHAT.Text = "Why don't you take a chance?"
				CHAT.Font = "JosefinSans"
				CHAT.TextStrokeColor3 = Color3.fromRGB(255, 145, 0)
				CHAT.TextColor3 = Color3.fromRGB(255+(sick.PlaybackLoudness * .3), 187+(sick.PlaybackLoudness * .3), 61)

				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 16), 0*SIZE+0 * COS(SINE / 16), 5*SIZE+0.5 * COS(SINE / 16)) * ANGLES(RAD(10+5 * COS(SINE / 15)), RAD(20+3 * COS(SINE / 15)), RAD(0+0 * COS(SINE / 15))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1*SIZE-0 * COS(SINE / 21), 0*SIZE+0.2 * COS(SINE / 21), 0.7*SIZE+0 * COS(SINE / 21)) * ANGLES(RAD(10+0 * COS(SINE / 20)), RAD(10+0 * COS(SINE / 20)), RAD(-65+0 * COS(SINE / 20))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.6*SIZE-0 * COS(SINE / 16), -0.2*SIZE+0.2 * COS(SINE / 16), -0.7*SIZE+0 * COS(SINE / 16)) * ANGLES(RAD(180+10 * COS(SINE / 15)), RAD(-10+0 * COS(SINE / 15)), RAD(15+0 * COS(SINE / 15))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 16), -1*SIZE+0.2 * COS(SINE / 16), 0*SIZE+0 * COS(SINE / 16)) * ANGLES(RAD(10+-6 * COS(SINE / 15)), RAD(10+0 * COS(SINE / 15)), RAD(-20+0 * COS(SINE / 15))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(0.7*SIZE+0 * COS(SINE / 16), -0.6*SIZE+0.1 * COS(SINE / 16), -0.5*SIZE+0 * COS(SINE / 16)) * ANGLES(RAD(-55+-10 * COS(SINE / 15)), RAD(-15+0 * COS(SINE / 15)), RAD(-25+8 * COS(SINE / 15))), 1 / Animation_Speed)

			elseif mode == 64 then
				Humanoid.WalkSpeed = 20
				NAMEMODE.Text = "inmagnanimous"
				NAMEMODE.Font = "Sarpanch"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(112, 0, 156)
				NAMEMODE.TextColor3 = Color3.fromRGB(0, 0, 0)
				CHAT.Text = "infinite."
				CHAT.Font = "Sarpanch"
				CHAT.TextStrokeColor3 = Color3.fromRGB(112, 0, 156)
				CHAT.TextColor3 = Color3.fromRGB(0, 0, 0)
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(-0.1+6*math.cos(SINE/25))), 1 / Animation_Speed)
				if MRANDOM(1,15) == 1 then
					Neck.C0 = Clerp(Neck.C0,NECKC0 * ANGLES(RAD(20+MRANDOM(-20,20)),RAD((10*COS(SINE/100))+MRANDOM(-20,20)),RAD(MRANDOM(-20,20))),1)
				end
				gunweld.C0 = Clerp(gunweld.C0, CF(0*SIZE+0 * COS(SINE / 15), 0*SIZE-0 * COS(SINE /15), -0.3*SIZE+0 * COS(SINE / 15)) * ANGLES(RAD(-0+0 * COS(SINE / 505)), RAD(-0+0* COS(SINE / 55)), RAD(-0-0 * COS(SINE / 15))), 1 / Animation_Speed)
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0,0.5,3 - .5 * SIN(SINE/25)) * ANGLES(RAD(20),RAD(0),RAD(0)),.7/3)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(1.3*SIZE-0 * COS(SINE / 31.5), 0*SIZE+0 * COS(SINE / 31.5), 0*SIZE+0 * COS(SINE / 31.5)) * ANGLES(RAD(70+0 * COS(SINE / 32.5)), RAD(10+-5 * COS(SINE / 32.5)), RAD(55+3 * COS(SINE / 32.5))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0,CF(-1.5,.5,0) * ANGLES(RAD(20),RAD(0),RAD(-20-10*SIN(SINE/25))) * LEFTSHOULDERC0,.7/3)
				RightHip.C0 = Clerp(RightHip.C0,CF(1,-1,-.01) * ANGLES(RAD(20),RAD(80),RAD(10+10*SIN(SINE/25))),1/3)
				LeftHip.C0 = Clerp(LeftHip.C0,CF(-1,-1,-.01) * ANGLES(RAD(10),RAD(-80),RAD(-10-10*SIN(SINE/25))),1/3)
			elseif mode == 65 then
				Humanoid.WalkSpeed = 20
				NAMEMODE.Text = "HARDBASS"
				NAMEMODE.Font = "PermanentMarker"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(255, 77, 0)
				NAMEMODE.TextColor3 = Color3.fromRGB(255+(sick.PlaybackLoudness * .3), 145+(sick.PlaybackLoudness * .3), 0+(sick.PlaybackLoudness * .3))
				CHAT.Text = "FEEL THE BASS."
				CHAT.Font = "PermanentMarker"
				CHAT.TextStrokeColor3 = Color3.fromRGB(255, 77, 0)
				CHAT.TextColor3 = Color3.fromRGB(255+(sick.PlaybackLoudness * .3), 145+(sick.PlaybackLoudness * .3), 0+(sick.PlaybackLoudness * .3))
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(-0.1+6*math.cos(SINE/25))), 1 / Animation_Speed)
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 8), 0*SIZE+0 * COS(SINE / 8), 0*SIZE+0.3 * COS(SINE / 8)) * ANGLES(RAD(8+5 * COS(SINE / 9)), RAD(0+0 * COS(SINE / 9)), RAD(0+0 * COS(SINE / 9))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.3*SIZE-0 * COS(SINE / 8), 0*SIZE+0.2 * COS(SINE / 8), -1*SIZE+0 * COS(SINE / 8)) * ANGLES(RAD(210+10 * COS(SINE / 9)), RAD(10+5 * COS(SINE / 9)), RAD(-15+5 * COS(SINE / 9))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.6*SIZE-0 * COS(SINE / 8), 0*SIZE+0.1 * COS(SINE / 8), 0*SIZE+0 * COS(SINE / 8)) * ANGLES(RAD(-45+8 * COS(SINE / 9)), RAD(10+-5 * COS(SINE / 9)), RAD(-25+-8 * COS(SINE / 9))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.5*SIZE+0 * COS(SINE / 8), -1*SIZE+-0.3 * COS(SINE / 8), 0*SIZE+0 * COS(SINE / 8)) * ANGLES(RAD(10+10 * COS(SINE / 9)), RAD(-10+2 * COS(SINE / 9)), RAD(8+3 * COS(SINE / 9))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 8), -1*SIZE+-0.3 * COS(SINE / 8), 0*SIZE+0 * COS(SINE / 8)) * ANGLES(RAD(10+10 * COS(SINE / 9)), RAD(10+0 * COS(SINE / 9)), RAD(-8+-3 * COS(SINE / 9))), 1 / Animation_Speed)
			elseif mode == 66 then
				Humanoid.WalkSpeed = 20
				NAMEMODE.Text = "SUFFERING"
				NAMEMODE.Font = "Arcade"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
				NAMEMODE.TextColor3 = Color3.fromRGB(200, 200, 200)
				CHAT.Text = "WHAT THE FUCK DID I DO!?"
				CHAT.Font = "Arcade"
				CHAT.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
				CHAT.TextColor3 = Color3.fromRGB(200, 200, 200)
				sick.Pitch = .9
				if MRANDOM(1,15) == 1 then
					Neck.C0 = Clerp(Neck.C0,NECKC0 * ANGLES(RAD(20+MRANDOM(-20,20)),RAD((10*COS(SINE/100))+MRANDOM(-20,20)),RAD(MRANDOM(-20,20))),1)
				end
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE+.3 * math.sin(SINE / 32), 0*SIZE+0 * COS(SINE / 1), 0*SIZE+.1 * math.cos(SINE / 32)) * ANGLES(math.rad(20.6), RAD(-4.7+8 * math.sin(SINE / 32)), RAD(-0+0 * COS(SINE / 1))), 1 / Animation_Speed)
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(55.3+3*math.cos(SINE/30)),math.rad(180+15*math.cos(SINE/58)),math.rad(-0.0+0*math.cos(SINE/25))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.6*SIZE-0 * COS(SINE / 1), 0.5*SIZE+0 * COS(SINE / 1), -0*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(20+MRANDOM(-15,15) * COS(SINE / 29)), RAD(-5+MRANDOM(-15,15) * COS(SINE / 29)), RAD(25+MRANDOM(-15,15) * COS(SINE / 29))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.6*SIZE-0 * COS(SINE / 1), 0.5*SIZE+0 * COS(SINE / 1), -0*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(20+MRANDOM(-15,15) * COS(SINE / 29)), RAD(5+MRANDOM(-15,15) * COS(SINE / 29)), RAD(-25+MRANDOM(-15,15) * COS(SINE / 29))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE+.1 * SIN(SINE / 32), -1*SIZE-.1 * COS(SINE / 32)-.05*math.sin(SINE/32)-rightlegheight, -.3*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(16.8),math.rad(-20.1),math.rad(17.4-8*math.sin(SINE/32)))*ANGLES(math.rad(0),math.rad(90),math.rad(0)), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE+.1 * SIN(SINE / 32), -1*SIZE-.1 * COS(SINE / 32)+.05*math.sin(SINE/32)-leftlegheight, -0.3*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(16.6),math.rad(23.2),math.rad(-9.5-8*math.sin(SINE/32)))*ANGLES(math.rad(0),math.rad(-90),math.rad(0)), 1 / Animation_Speed) 


			elseif mode == 67 then
				--setsong(745724979)
				Humanoid.WalkSpeed = 20
				NAMEMODE.Text = "NOSTALIGIA"
				NAMEMODE.Font = "Arcade"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(120, 82, 0)
				NAMEMODE.TextColor3 = Color3.fromRGB(255, 174, 0)
				CHAT.Text = "The good ol' days!"
				CHAT.Font = "Arcade"
				CHAT.TextStrokeColor3 = Color3.fromRGB(120, 82, 0)
				CHAT.TextColor3 = Color3.fromRGB(255, 174, 0)
				sick.Pitch = 1.1
				gunweld.C0 = Clerp(gunweld.C0, CF(0*SIZE+0 * COS(SINE / 15), -.7*SIZE-0 * COS(SINE /15), 0*SIZE+0 * COS(SINE / 15)) * ANGLES(RAD(90+0 * COS(SINE / 505)), RAD(75+0* COS(SINE / 55)), RAD(0-0 * COS(SINE / 15))), 1 / Animation_Speed)
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(75.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(-0.1+6*math.cos(SINE/25))), 1 / Animation_Speed)
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0.2 * COS(SINE / 35), 0*SIZE+0.0 * COS(SINE / 35), 4*SIZE+2 * COS(SINE / 25)) * ANGLES(RAD(25+0 * COS(SINE / 25.5)), RAD(0+0 * COS(SINE / 25.5)), RAD(0-25 * COS(SINE / 35.5))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.6*SIZE-0 * COS(SINE / 32.5), 0*SIZE+0.25 * COS(SINE / 32.5), 0*SIZE+0 * COS(SINE / 32.5)) * ANGLES(RAD(-25+10 * COS(SINE / 31.5)), RAD(10+10 * COS(SINE / 31.5)), RAD(35+15 * COS(SINE / 31.5))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.6*SIZE-0 * COS(SINE / 32.5), 0*SIZE+0.2 * COS(SINE / 32.5), 0*SIZE+0 * COS(SINE / 32.5)) * ANGLES(RAD(180+0 * COS(SINE / 31.5)), RAD(15+0 * COS(SINE / 31.5)), RAD(25+0 * COS(SINE / 31.5))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.5*SIZE+0 * COS(SINE / 25), -0.6*SIZE+-0.2 * COS(SINE / 25), 0*SIZE+0 * COS(SINE / 25)) * ANGLES(RAD(15+-15 * COS(SINE / 25.5)), RAD(0+5 * COS(SINE / 25.5)), RAD(15+-5 * COS(SINE / 25.5))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 25), -1*SIZE+-0.2 * COS(SINE / 25), 0.5*SIZE+0 * COS(SINE / 25)) * ANGLES(RAD(-15+7.5 * COS(SINE / 25.5)), RAD(25+0 * COS(SINE / 25.5)), RAD(-7+0 * COS(SINE / 25.5))), 1 / Animation_Speed)


			elseif mode == 68 then
				--setsong(5259946954)
				Humanoid.WalkSpeed = 20
				NAMEMODE.Text = "HOVERBOARD"
				NAMEMODE.Font = "SciFi"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(89, 170, 255)
				NAMEMODE.TextColor3 = Color3.fromRGB(111, 117, 122)
				CHAT.Text = "Soaring through the air!"
				CHAT.Font = "SciFi"
				CHAT.TextStrokeColor3 = Color3.fromRGB(89, 170, 255)
				CHAT.TextColor3 = Color3.fromRGB(111, 117, 122)
				sick.Pitch = 1
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(-0.1+6*math.cos(SINE/25))), 1 / Animation_Speed)
				gunweld.C0 = Clerp(gunweld.C0, CF(1*SIZE+0 * COS(SINE / 15), -2*SIZE-0 * COS(SINE /15), -2*SIZE+0 * COS(SINE / 15)) * ANGLES(RAD(130+0 * COS(SINE / 505)), RAD(0+0* COS(SINE / 55)), RAD(0-0 * COS(SINE / 15))), 1 / Animation_Speed)
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 31), 0*SIZE+0 * COS(SINE / 31), 4.5*SIZE+0.7 * COS(SINE / 31)) * ANGLES(RAD(0+-10 * COS(SINE / 32)), RAD(0+5 * COS(SINE / 32)), RAD(0+0 * COS(SINE / 32))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.6*SIZE-0 * COS(SINE / 1), 0.3*SIZE+0 * COS(SINE / 1), 0.3*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(25+0 * COS(SINE / 1)), RAD(10+0 * COS(SINE / 1)), RAD(35+0 * COS(SINE / 1))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.6*SIZE-0 * COS(SINE / 1), 0.3*SIZE+0 * COS(SINE / 1), 0.3*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(25+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1)), RAD(-35+0 * COS(SINE / 1))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.5*SIZE+0 * COS(SINE / 32), -.7*SIZE+0 * COS(SINE / 32), 0*SIZE+0 * COS(SINE / 32)) * ANGLES(RAD(0+3 * COS(SINE / 31)), RAD(-15+0 * COS(SINE / 31)), RAD(12+-8 * COS(SINE / 31))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 32), -1*SIZE+0 * COS(SINE / 32), 0.3*SIZE+0 * COS(SINE / 32)) * ANGLES(RAD(-10+-10 * COS(SINE / 31)), RAD(25+0 * COS(SINE / 31)), RAD(-12+3 * COS(SINE / 31))), 1 / Animation_Speed)

			elseif mode == 69 then
				--setsong(1846379515)
				Humanoid.WalkSpeed = 20
				NAMEMODE.Text = "K A R M A"
				NAMEMODE.Font = "Antique"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
				NAMEMODE.TextColor3 = Color3.fromRGB(math.random(1, 255), math.random(1, 255), math.random(1, 255))
				CHAT.Text = "I ' L L   S T R I K E   Y O U   B A C K !"
				CHAT.Font = "Antique"
				CHAT.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
				CHAT.TextColor3 = Color3.fromRGB(math.random(1, 255), math.random(1, 255), math.random(1, 255))
				sick.Pitch = .85
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/0.05)),math.rad(180+3*math.cos(SINE/0.05)),math.rad(-0.1+6*math.cos(SINE/0.02))), 1 / Animation_Speed)
				if MRANDOM(1,5) == 1 then
					Neck.C0 = Clerp(Neck.C0,NECKC0 * ANGLES(RAD(20+MRANDOM(-20,20)),RAD((10*COS(SINE/100))+MRANDOM(-20,20)),RAD(MRANDOM(-20,20))),1)
				end
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * math.sin(SINE / 22), 0*SIZE+1 * math.sin(SINE / 22), 3.5*SIZE+1 * math.sin(SINE / 22)) * ANGLES(RAD(0+15 * math.sin(SINE / 21)), RAD(15+5 * math.sin(SINE / 21)), RAD(-5+0 * math.sin(SINE / 21))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(-1.1*SIZE-0 * COS(SINE / 1), .7*SIZE-.07 * math.sin(SINE / 21), -.5*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(170-0*math.sin(SINE/21)+MRANDOM(-10,10)), math.rad(-15+MRANDOM(-15,15)), math.rad(55-0*math.sin(SINE/21)+MRANDOM(-10,10))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(1.3*SIZE-0 * math.sin(SINE / 22), 0*SIZE+0 * math.sin(SINE / 22), 0*SIZE+0.3 * math.sin(SINE / 22)) * ANGLES(RAD(-10+-12 * math.sin(SINE / 21)), RAD(-15+0 * math.sin(SINE / 21)), RAD(25+12 * math.sin(SINE / 21))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.5*SIZE+0 * math.sin(SINE / 22), -1*SIZE+0 * math.sin(SINE / 22), 0*SIZE+0.3 * math.sin(SINE / 22)) * ANGLES(RAD(-10+-10 * math.sin(SINE / 21)), RAD(-15+8 * math.sin(SINE / 21)), RAD(15+0 * math.sin(SINE / 21))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5*SIZE+0 * math.sin(SINE / 22), -0.3*SIZE+0 * math.sin(SINE / 22), 0*SIZE+0.2 * math.sin(SINE / 22)) * ANGLES(RAD(0+-10 * math.sin(SINE / 21)), RAD(15+0 * math.sin(SINE / 21)), RAD(-10+0 * math.sin(SINE / 21))), 1 / Animation_Speed)

			elseif mode == 70 then
				--setsong(1751171913)
				Humanoid.WalkSpeed = 20
				NAMEMODE.Text = "ANTIDISESTABLISHMENTARIANISM"
				NAMEMODE.Font = "Arcade"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(0, 0, 200)
				NAMEMODE.TextColor3 = Color3.fromRGB(200, 0, 0)
				CHAT.Text = " "
				CHAT.Font = "Arcade"
				CHAT.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
				CHAT.TextColor3 = Color3.fromRGB(0, 0, 0)
				sick.Pitch = 1
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/0.05)),math.rad(200+3*math.cos(SINE/0.05)),math.rad(50.1+6*math.cos(SINE/0.02))), 1 / Animation_Speed)
				if MRANDOM(1,25) == 1 then
					Neck.C0 = Clerp(Neck.C0,NECKC0 * ANGLES(RAD(20+MRANDOM(-20,20)),RAD((10*COS(SINE/100))+MRANDOM(-20,20)),RAD(MRANDOM(-20,20))),1)
				end
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 21), 0*SIZE+0 * COS(SINE / 21), 4*SIZE+1 * COS(SINE / 21)) * ANGLES(RAD(10+10 * COS(SINE / 20)), RAD(35+6 * COS(SINE / 20)), RAD(0+5 * COS(SINE / 20))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(-1.7*SIZE-0 * COS(SINE / 21.5), 0.2*SIZE+0 * COS(SINE / 21.5), -0.5*SIZE+0.15 * COS(SINE / 21.5)) * ANGLES(RAD(170+10 * COS(SINE / 20.5)), RAD(15+0 * COS(SINE / 20.5)), RAD(45+10 * COS(SINE / 20.5))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(0.5*SIZE-0 * COS(SINE / 21.5), 0*SIZE+0.2 * COS(SINE / 21.5), 1*SIZE+0 * COS(SINE / 21.5)) * ANGLES(RAD(15+10 * COS(SINE / 20.5)), RAD(10+5 * COS(SINE / 20.5)), RAD(-45+5 * COS(SINE / 20.5))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.5*SIZE+0 * COS(SINE / 21), -1.2*SIZE+0.15 * COS(SINE / 21), 0.3*SIZE+0 * COS(SINE / 21)) * ANGLES(RAD(-18+15 * COS(SINE / 20)), RAD(-15+8 * COS(SINE / 20)), RAD(25+10 * COS(SINE / 20))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 21), -0.7*SIZE+0.3 * COS(SINE / 21), 0*SIZE+0 * COS(SINE / 21)) * ANGLES(RAD(8+10 * COS(SINE / 20)), RAD(10+5 * COS(SINE / 20)), RAD(-15+10 * COS(SINE / 20))), 1 / Animation_Speed)

			elseif mode == 71 then
				--setsong(1591072638)
				Humanoid.WalkSpeed = 20
				NAMEMODE.Text = "I  N  S  A  N  I  T  Y"
				NAMEMODE.Font = "Antique"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
				NAMEMODE.TextColor3 = Color3.fromRGB(0, 0, 0)
				CHAT.Text = "DARKNESS HAS CONSUMED THE LIGHT..."
				CHAT.Font = "Antique"
				CHAT.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
				CHAT.TextColor3 = Color3.fromRGB(0, 0, 0)
				sick.Pitch = 1
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/0.05)),math.rad(200+3*math.cos(SINE/0.05)),math.rad(-0.1+6*math.cos(SINE/0.02))), 1 / Animation_Speed)
				if MRANDOM(1,5) == 1 then
					Neck.C0 = Clerp(Neck.C0,NECKC0 * ANGLES(RAD(20+MRANDOM(-20,20)),RAD((10*COS(SINE/100))+MRANDOM(-20,20)),RAD(MRANDOM(-20,20))),1)
				end
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE+.3 * math.sin(SINE / 32), 0*SIZE+0 * COS(SINE / 1), 0*SIZE+.1 * math.cos(SINE / 32)) * ANGLES(math.rad(20.6), RAD(-4.7+8 * math.sin(SINE / 32)), RAD(-0+0 * COS(SINE / 1))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5*SIZE-0 * COS(SINE / 1), 0.7*SIZE+0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(170+MRANDOM(-20,20) * COS(SINE / 17)), RAD(25+MRANDOM(-20,20) * COS(SINE / 17)), RAD(-45+MRANDOM(-20,20) * COS(SINE / 17))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5*SIZE-0 * COS(SINE / 1), 0.7*SIZE+0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(170+MRANDOM(-20,20) * COS(SINE / 17)), RAD(-25+MRANDOM(-20,20) * COS(SINE / 17)), RAD(56+MRANDOM(-20,20) * COS(SINE / 17))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(1.1*SIZE+.1 * SIN(SINE / 32), -1*SIZE-.1 * COS(SINE / 32)-.05*math.sin(SINE/32)-rightlegheight, -.3*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(16.8),math.rad(-20.1),math.rad(17.4-8*math.sin(SINE/32)))*ANGLES(math.rad(0),math.rad(90),math.rad(0)), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-1.1*SIZE+.1 * SIN(SINE / 32), -1*SIZE-.1 * COS(SINE / 32)+.05*math.sin(SINE/32)-leftlegheight, -0.3*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(16.6),math.rad(23.2),math.rad(-14.5-8*math.sin(SINE/32)))*ANGLES(math.rad(0),math.rad(-90),math.rad(0)), 1 / Animation_Speed) 

			elseif mode == 72 then
				--setsong(4835049962)
				Humanoid.WalkSpeed = 20
				NAMEMODE.Text = "decaying"
				NAMEMODE.Font = "Antique"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
				NAMEMODE.TextColor3 = Color3.fromRGB(0, 0, 0)
				CHAT.Text = "nothing lasts forever.."
				CHAT.Font = "Antique"
				CHAT.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
				CHAT.TextColor3 = Color3.fromRGB(0, 0, 0)
				sick.Pitch = 1
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/0.05)),math.rad(200+3*math.cos(SINE/0.05)),math.rad(40.1+6*math.cos(SINE/0.02))), 1 / Animation_Speed)
				if MRANDOM(1,25) == 1 then
					Neck.C0 = Clerp(Neck.C0,NECKC0 * ANGLES(RAD(20+MRANDOM(-20,20)),RAD((10*COS(SINE/100))+MRANDOM(-20,20)),RAD(MRANDOM(-20,20))),1)
				end
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 18), 0*SIZE+0 * COS(SINE / 18), -0.3*SIZE+0.2 * COS(SINE / 18)) * ANGLES(RAD(0+3 * COS(SINE / 19)), RAD(15+5 * COS(SINE / 19)), RAD(-25+0 * COS(SINE / 19))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5*SIZE-0 * COS(SINE / 1), 0.3*SIZE+0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(-25+10 * COS(SINE / 19)), RAD(15+0 * COS(SINE / 19)), RAD(25+10 * COS(SINE / 19))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-0.8*SIZE-0 * COS(SINE / 18), 0*SIZE+0 * COS(SINE / 18), -0.5*SIZE+0 * COS(SINE / 18)) * ANGLES(RAD(135+10 * COS(SINE / 19)), RAD(0+0 * COS(SINE / 19)), RAD(65+10 * COS(SINE / 19))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.5*SIZE+0 * COS(SINE / 18), -1*SIZE+-0.2 * COS(SINE / 18), 0.3*SIZE+0 * COS(SINE / 18)) * ANGLES(RAD(-10+0 * COS(SINE / 19)), RAD(-10+0 * COS(SINE / 19)), RAD(15+-10 * COS(SINE / 19))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 18), -0.5*SIZE+-0.2 * COS(SINE / 18), 0*SIZE+0 * COS(SINE / 18)) * ANGLES(RAD(-10+0 * COS(SINE / 19)), RAD(25+0 * COS(SINE / 19)), RAD(-10+-10 * COS(SINE / 19))), 1 / Animation_Speed)

			elseif mode == 73 then
				Humanoid.WalkSpeed = 20
				NAMEMODE.Text = "Studio Dummy"
				NAMEMODE.Font = "Code"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
				NAMEMODE.TextColor3 = Color3.fromRGB(200, 200, 200)
				CHAT.Text = ">spawn dummy=103"
				CHAT.Font = "Code"
				CHAT.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
				CHAT.TextColor3 = Color3.fromRGB(200, 200, 200)
				sick.Pitch = 1
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(-40.1+6*math.cos(SINE/25))), 1 / Animation_Speed)



				gunweld.C0 = Clerp(gunweld.C0, CF(0*SIZE+0 * COS(SINE / 15), -0.7*SIZE-0 * COS(SINE /15), 0.5*SIZE+0 * COS(SINE / 15)) * ANGLES(RAD(90+-10 * COS(SINE / 19)), RAD(100+0* COS(SINE / 55)), RAD(0-0 * COS(SINE / 15))), 1 / Animation_Speed)



				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 20), 0*SIZE+0 * COS(SINE / 20), 0*SIZE+0.2 * COS(SINE / 20)) * ANGLES(RAD(0+0 * COS(SINE / 19)), RAD(-10+5 * COS(SINE / 19)), RAD(0+0 * COS(SINE / 19))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.6*SIZE-0 * COS(SINE / 20), 0.3*SIZE+0.15 * COS(SINE / 20), 0*SIZE+0 * COS(SINE / 20)) * ANGLES(RAD(25+10 * COS(SINE / 19)), RAD(10+5 * COS(SINE / 19)), RAD(25+0 * COS(SINE / 19))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.6*SIZE-0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1), 0.4*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(0+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1)), RAD(15+0 * COS(SINE / 1))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.5*SIZE+0 * COS(SINE / 20), -0.9*SIZE+-0.2 * COS(SINE / 20), 0*SIZE+0 * COS(SINE / 20)) * ANGLES(RAD(-10+0 * COS(SINE / 19)), RAD(-10+0 * COS(SINE / 19)), RAD(15+-10 * COS(SINE / 19))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 20), -1*SIZE+-0.2 * COS(SINE / 20), 0*SIZE+0 * COS(SINE / 20)) * ANGLES(RAD(-20+0 * COS(SINE / 19)), RAD(0+0 * COS(SINE / 19)), RAD(0+-8 * COS(SINE / 19))), 1 / Animation_Speed)

			elseif mode == 74 then
				--setsong(1074484884)
				Humanoid.WalkSpeed = 20
				NAMEMODE.Text = "Afarican God"
				NAMEMODE.Font = "Fondamento"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(196, 64, 20)
				NAMEMODE.TextColor3 = Color3.fromRGB(227, 84, 36)
				CHAT.Text = "SACRED POWER!"
				CHAT.Font = "Fondamento"
				CHAT.TextStrokeColor3 = Color3.fromRGB(196, 64, 20)
				CHAT.TextColor3 = Color3.fromRGB(227, 84, 36)
				sick.Pitch = 1
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(120.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(-0.1+6*math.cos(SINE/25))), 1 / Animation_Speed)
				gunweld.C0 = Clerp(gunweld.C0, CF(-0*SIZE+0 * COS(SINE / 15), -0.7*SIZE-0 * COS(SINE /15), -30*SIZE+0 * COS(SINE / 15)) * ANGLES(RAD(70+-10 * COS(SINE / 19)), RAD(100+0* COS(SINE / 55)), RAD(0-0 * COS(SINE / 15))), 1 / Animation_Speed)
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE+.3 * math.sin(SINE / 32), 0*SIZE+0 * COS(SINE / 1), 0*SIZE+.1 * math.cos(SINE / 32)) * ANGLES(math.rad(20.6), RAD(-4.7+8 * math.sin(SINE / 32)), RAD(-0+0 * COS(SINE / 1))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5*SIZE-0 * COS(SINE / 30), 0.5*SIZE+0.2 * COS(SINE / 30), 0*SIZE+0 * COS(SINE / 30)) * ANGLES(RAD(0+0 * COS(SINE / 29)), RAD(15+0 * COS(SINE / 29)), RAD(130+10 * COS(SINE / 29))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5*SIZE-0 * COS(SINE / 30), 0.5*SIZE+0.2 * COS(SINE / 30), 0*SIZE+0 * COS(SINE / 30)) * ANGLES(RAD(0+0 * COS(SINE / 29)), RAD(-15+0 * COS(SINE / 29)), RAD(-130+-10 * COS(SINE / 29))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE+.1 * SIN(SINE / 32), -1*SIZE-.1 * COS(SINE / 32)-.05*math.sin(SINE/32)-rightlegheight, -.3*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(16.8),math.rad(-20.1),math.rad(17.4-8*math.sin(SINE/32)))*ANGLES(math.rad(0),math.rad(90),math.rad(0)), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE+.1 * SIN(SINE / 32), -1*SIZE-.1 * COS(SINE / 32)+.05*math.sin(SINE/32)-leftlegheight, -0.3*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(16.6),math.rad(23.2),math.rad(-9.5-8*math.sin(SINE/32)))*ANGLES(math.rad(0),math.rad(-90),math.rad(0)), 1 / Animation_Speed) 
			elseif mode == 75 then
				--setsong(3158212632)
				Humanoid.WalkSpeed = 20
				NAMEMODE.Text = "Western"
				NAMEMODE.Font = "Arcade"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(0+(sick.PlaybackLoudness * .3), 0+(sick.PlaybackLoudness * .3), 0+(sick.PlaybackLoudness * .3))
				NAMEMODE.TextColor3 = Color3.fromRGB(255,216,107)
				CHAT.Text = "It's high noon."
				CHAT.Font = "Arcade"
				CHAT.TextStrokeColor3 = Color3.fromRGB(0+(sick.PlaybackLoudness * .3), 0+(sick.PlaybackLoudness * .3), 0+(sick.PlaybackLoudness * .3))
				CHAT.TextColor3 = Color3.fromRGB(255,216,107)
				gunweld.C0 = Clerp(gunweld.C0, CF(0*SIZE+0 * COS(SINE / 15), -1*SIZE-0 * COS(SINE /15), 0*SIZE+0 * COS(SINE / 15)) * ANGLES(RAD(90+0 * COS(SINE / 505)), RAD(0+0* COS(SINE / 55)), RAD(0-360 * COS(SINE / 23))), 1 / Animation_Speed)
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE+.3 * math.sin(SINE / 32), 0*SIZE+0 * COS(SINE / 1), 0*SIZE+.1 * math.cos(SINE / 32)) * ANGLES(math.rad(9.6), RAD(-3+8 * math.sin(SINE / 32)), RAD(35+0 * COS(SINE / 1))), 1 / Animation_Speed)
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+7*math.cos(SINE/30)),math.rad(180+15*math.cos(SINE/58)),math.rad(-35.0+0*math.cos(SINE/25))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.6*SIZE-0 * COS(SINE / 16), 0.3*SIZE+0.2 * COS(SINE / 16), 0*SIZE+0 * COS(SINE / 16)) * ANGLES(RAD(-10+0 * COS(SINE / 15)), RAD(5+0 * COS(SINE / 15)), RAD(15+10 * COS(SINE / 15))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.6*SIZE-0 * COS(SINE / 16), 0*SIZE+0.2 * COS(SINE / 16), -0.5*SIZE+0 * COS(SINE / 16)) * ANGLES(RAD(170+5 * COS(SINE / 15)), RAD(0+0 * COS(SINE / 15)), RAD(-10+5 * COS(SINE / 15))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(.9*SIZE+.1 * SIN(SINE / 32), -1*SIZE-.1 * COS(SINE / 32)-.05*math.sin(SINE/32)-rightlegheight, -.3*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(-9.6),math.rad(-17.1),math.rad(20.4-8*math.sin(SINE/32)))*ANGLES(math.rad(0),math.rad(90),math.rad(0)), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-1.1*SIZE+.1 * SIN(SINE / 32), -1*SIZE-.1 * COS(SINE / 32)+.05*math.sin(SINE/32)-leftlegheight, -0.3*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(9.6),math.rad(9.2),math.rad(-18.5-8*math.sin(SINE/32)))*ANGLES(math.rad(0),math.rad(-90),math.rad(0)), 1 / Animation_Speed) 
			elseif mode == 76 then
				Humanoid.WalkSpeed = 20
				NAMEMODE.Text = ""
				NAMEMODE.Font = "Arcade"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(196, 64, 20)
				NAMEMODE.TextColor3 = Color3.fromRGB(227, 84, 36)
				CHAT.Text = ""
				CHAT.Font = "Arcade"
				CHAT.TextStrokeColor3 = Color3.fromRGB(196, 64, 20)
				CHAT.TextColor3 = Color3.fromRGB(227, 84, 36)
				sick.Pitch = 1
				gunweld.C0 = Clerp(gunweld.C0, CF(-0*SIZE+0 * COS(SINE / 15), -15*SIZE-0 * COS(SINE /15), 0.65*SIZE+0 * COS(SINE / 15)) * ANGLES(RAD(90+0 * COS(SINE / 505)), RAD(-90+0* COS(SINE / 55)), RAD(45-0 * COS(SINE / 15))), 1 / Animation_Speed)

				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(0+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.6*SIZE-0 * COS(SINE / 1), 0.4*SIZE+0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(0+5 * COS(SINE / 50)), RAD(0+0 * COS(SINE / 50)), RAD(0+0 * COS(SINE / 50))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.6*SIZE-0 * COS(SINE / 1), 0.4*SIZE+0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(0+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.5*SIZE+0 * COS(SINE / 1), -1*SIZE+0 * COS(SINE / 1), 0.5*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(0+-5 * COS(SINE / 50)), RAD(0+0 * COS(SINE / 50)), RAD(0+0 * COS(SINE / 50))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 1), -1*SIZE+0 * COS(SINE / 1), 0.5*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(0+5 * COS(SINE / 50)), RAD(0+0 * COS(SINE / 50)), RAD(0+0 * COS(SINE / 50))), 1 / Animation_Speed)
			elseif mode == 77 then
				Humanoid.WalkSpeed = 20
				NAMEMODE.Text = "CHRONOS"
				NAMEMODE.Font = "Code"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(187, 255, 156)
				NAMEMODE.TextColor3 = Color3.fromRGB(138, 255, 84)
				CHAT.Text = "The Prime of Time!"
				CHAT.Font = "Code"
				CHAT.TextStrokeColor3 = Color3.fromRGB(187, 255, 156)
				CHAT.TextColor3 = Color3.fromRGB(138, 255, 84)
				sick.Pitch = 1
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, -0.03 + 0.05 * COS(SINE / 12)) * ANGLES(RAD(0), RAD(0), RAD(-35)), 1 / Animation_Speed)
				Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(0), RAD(35)), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0,CF(-1.6,.5,0) * ANGLES(RAD(0),RAD(0),RAD(-20-10*SIN(SINE/12))) * LEFTSHOULDERC0,.7/3)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(1.4, 0.55, 0) * ANGLES(RAD(180 - 1 * COS(SINE / 15)), RAD(180 - 5*SIN(sick.PlaybackLoudness/500)), RAD(-5 + sick.PlaybackLoudness/545)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(1, -1 - 0.05 * COS(SINE / 12), 0) * ANGLES(RAD(0), RAD(95), RAD(0)) * ANGLES(RAD(-15), RAD(0), RAD(0)), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1 - 0.05 * COS(SINE / 12), 0) * ANGLES(RAD(0), RAD(-55), RAD(0)) * ANGLES(RAD(-12), RAD(0), RAD(0)), 1 / Animation_Speed)

			elseif mode == 78 then
				--setsong(943961217)
				Humanoid.WalkSpeed = 20
				NAMEMODE.Text = "???"
				NAMEMODE.Font = "TitilliumWeb"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(50, 0, 0)
				NAMEMODE.TextColor3 = Color3.fromRGB(0+(sick.PlaybackLoudness * 0.2), 0, 0)

				CHAT.Text = " "
				CHAT.Font = "Code"
				CHAT.TextStrokeColor3 = Color3.fromRGB(50, 0, 0)
				CHAT.TextColor3 = Color3.fromRGB(0, 0, 0)
				sick.Pitch = 1
				if MRANDOM(1,8) == 1 then
					Neck.C0 = Clerp(Neck.C0,NECKC0 * ANGLES(RAD(20+MRANDOM(-20,20)),RAD((10*COS(SINE/100))+MRANDOM(-20,20)),RAD(MRANDOM(-20,20))),1)
				end
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(-0.1+6*math.cos(SINE/25))), 1 / Animation_Speed)
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1), 3.5*SIZE+0.5 * COS(SINE / 1)) * ANGLES(RAD(35+MRANDOM(-20,20) * COS(SINE / 1)), RAD(0+MRANDOM(-20,20) * COS(SINE / 1)), RAD(15+MRANDOM(-20,20) * COS(SINE / 1))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.6*SIZE-0 * COS(SINE / 1), 0.3*SIZE+0 * COS(SINE / 1), 0.5*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(40+0 * COS(SINE / 1)), RAD(-12+0 * COS(SINE / 1)), RAD(25+0 * COS(SINE / 1))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1*SIZE-0 * COS(SINE / 1), 0.5*SIZE+0 * COS(SINE / 1), 0.5*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(-120+0 * COS(SINE / 1)), RAD(25+0 * COS(SINE / 1)), RAD(70+0 * COS(SINE / 1))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.5*SIZE+0 * COS(SINE / 1), -1*SIZE+0 * COS(SINE / 1), 0.3*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(25+0 * COS(SINE / 1)), RAD(-15+0 * COS(SINE / 1)), RAD(10+0 * COS(SINE / 1))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(25+0 * COS(SINE / 1)), RAD(15+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1))), 1 / Animation_Speed)
			elseif mode == 79 then
				Humanoid.WalkSpeed = 24
				NAMEMODE.Text = "S L A U G H T E R"
				NAMEMODE.Font = "IndieFlower"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(50, 0, 0)
				NAMEMODE.TextColor3 = Color3.fromRGB(0+(sick.PlaybackLoudness * 0.2), 0, 0)
				CHAT.Text = "L E T   T H E R E   B E   C A R N A G E!"
				CHAT.Font = "IndieFlower"
				CHAT.TextStrokeColor3 = Color3.fromRGB(50, 0, 0)
				CHAT.TextColor3 = Color3.fromRGB(0+(sick.PlaybackLoudness * 0.2), 0, 0)
				sick.Pitch = 1
				if MRANDOM(1,2) == 1 then
					Neck.C0 = Clerp(Neck.C0,NECKC0 * ANGLES(RAD(20+MRANDOM(-20,20)),RAD((10*COS(SINE/100))+MRANDOM(-20,20)),RAD(MRANDOM(-20,20))),1)
				end
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.6*SIZE-0 * COS(SINE / 1), 0.3*SIZE+0.2 * COS(SINE / 16), 0.5*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(0+6 * COS(SINE / 15)), RAD(-20+0 * COS(SINE / 1)), RAD(35+0 * COS(SINE / 1))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.6*SIZE-0 * COS(SINE / 1), 0.3*SIZE+0.2 * COS(SINE / 16), 0.3*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(140+-6 * COS(SINE / 15)), RAD(20+0 * COS(SINE / 1)), RAD(-35+0 * COS(SINE / 1))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0 - 0.04 * SIN(SINE / 24)*SIZE, 0 + 0.04 * SIN(SINE / 12)*SIZE, 0 + 0.05*SIZE * COS(SINE / 12)) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(0 - 2.5 * SIN(SINE / 24)), RAD(0)), 1 / Animation_Speed)
				Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1.1*SIZE) - 1)) * ANGLES(RAD(5 - 4 * SIN(SINE / 12)), RAD(0), RAD(0)), 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE, -1*SIZE + 0.06 * SIN(SINE / 24) - 0.05*SIZE * COS(SINE / 12), -0.01*SIZE) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(75), RAD(0)) * ANGLES(RAD(-8 - 2.5 * SIN(SINE / 24)), RAD(0), RAD(-10)), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE, -1*SIZE - 0.06 * SIN(SINE / 24) - 0.05*SIZE * COS(SINE / 12), -0.01*SIZE) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(-75), RAD(0)) * ANGLES(RAD(-8 + 2.5 * SIN(SINE / 24)), RAD(0), RAD(-10)), 1 / Animation_Speed)
			elseif mode == 80 then
				Humanoid.WalkSpeed = 20
				NAMEMODE.Text = "Entropy"
				NAMEMODE.Font = "Antique"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(0, 0, 100)
				NAMEMODE.TextColor3 = Color3.fromRGB(0, 0, 0+(sick.PlaybackLoudness * 0.2))
				CHAT.Text = "Corroding.."
				CHAT.Font = "Antique"
				CHAT.TextStrokeColor3 = Color3.fromRGB(0, 0, 100)
				CHAT.TextColor3 = Color3.fromRGB(0, 0, 0+(sick.PlaybackLoudness * 0.2))
				sick.Pitch = 1
				if MRANDOM(1,2) == 1 then
					Neck.C0 = Clerp(Neck.C0,NECKC0 * ANGLES(RAD(20+MRANDOM(-20,20)),RAD((10*COS(SINE/100))+MRANDOM(-20,20)),RAD(MRANDOM(-20,20))),1)
				end
				gunweld.C0 = Clerp(gunweld.C0, CF(-0.5*SIZE+0 * COS(SINE / 15), -0.5*SIZE-0 * COS(SINE /15), -0.5*SIZE+0 * COS(SINE / 15)) * ANGLES(RAD(60+0 * COS(SINE / 505)), RAD(-230+0* COS(SINE / 55)), RAD(-170+0 * COS(SINE / 15))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.2*SIZE-0 * COS(SINE / 15), 0*SIZE+0.1 * COS(SINE / 15), -0.5*SIZE+0 * COS(SINE / 15)) * ANGLES(RAD(120+5 * COS(SINE / 16)), RAD(0+5 * COS(SINE / 16)), RAD(-45+0 * COS(SINE / 16))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-0.7*SIZE-0 * COS(SINE / 15), 0*SIZE+0.2 * COS(SINE / 15), -1*SIZE+0 * COS(SINE / 15)) * ANGLES(RAD(70+0 * COS(SINE / 16)), RAD(-25+5 * COS(SINE / 16)), RAD(65+0 * COS(SINE / 16))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0 - 0.04 * SIN(SINE / 24)*SIZE, 0 + 0.04 * SIN(SINE / 12)*SIZE, 0 + 0.05*SIZE * COS(SINE / 12)) * ANGLES(RAD(15 - 2.5 * SIN(SINE / 12)), RAD(-15 - 2.5 * SIN(SINE / 24)), RAD(0)), 1 / Animation_Speed)
				Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1.1*SIZE) - 1)) * ANGLES(RAD(5 - 4 * SIN(SINE / 12)), RAD(0), RAD(0)), 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE, -1*SIZE + 0.06 * SIN(SINE / 24) - 0.05*SIZE * COS(SINE / 12), -0.01*SIZE) * ANGLES(RAD(30 - 2.5 * SIN(SINE / 12)), RAD(75), RAD(0)) * ANGLES(RAD(-24 - 2.5 * SIN(SINE / 24)), RAD(0), RAD(-10)), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE, -1.3*SIZE - 0.06 * SIN(SINE / 24) - 0.05*SIZE * COS(SINE / 12), -0.01*SIZE) * ANGLES(RAD(-10 - 2.5 * SIN(SINE / 12)), RAD(-75), RAD(0)) * ANGLES(RAD(-8 + 2.5 * SIN(SINE / 24)), RAD(0), RAD(-10)), 1 / Animation_Speed)
			elseif mode == 81 then
				Humanoid.WalkSpeed = 20
				NAMEMODE.Text = "Divine"
				NAMEMODE.Font = "Fantasy"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(255, 199, 56)
				NAMEMODE.TextColor3 = Color3.fromRGB(0+(sick.PlaybackLoudness * 0.2), 0+(sick.PlaybackLoudness * 0.1), 0)

				CHAT.Text = "Judge your sins!"
				CHAT.Font = "Fantasy"
				CHAT.TextStrokeColor3 = Color3.fromRGB(255, 199, 56)
				CHAT.TextColor3 = Color3.fromRGB(0+(sick.PlaybackLoudness * 0.2), 0+(sick.PlaybackLoudness * 0.1), 0)
				sick.Pitch = 1
				if MRANDOM(1,10) == 1 then
					Neck.C0 = Clerp(Neck.C0,NECKC0 * ANGLES(RAD(20+MRANDOM(-20,20)),RAD((10*COS(SINE/100))+MRANDOM(-20,20)),RAD(MRANDOM(-20,20))),1)
				end
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(30.1+6*math.cos(SINE/25))), 1 / Animation_Speed)

				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 15), 0*SIZE+0 * COS(SINE / 15), 4.5*SIZE+0.5 * COS(SINE / 15)) * ANGLES(RAD(-35+5 * COS(SINE / 16)), RAD(25+0 * COS(SINE / 16)), RAD(10+0 * COS(SINE / 16))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.3*SIZE-0 * COS(SINE / 16), -0.5*SIZE+0.15 * COS(SINE / 16), -0.5*SIZE+0 * COS(SINE / 16)) * ANGLES(RAD(140+0 * COS(SINE / 15)), RAD(25+0 * COS(SINE / 15)), RAD(-56+5 * COS(SINE / 15))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.6*SIZE-0 * COS(SINE / 16), 0.5*SIZE+0.15 * COS(SINE / 16), 0*SIZE+0 * COS(SINE / 16)) * ANGLES(RAD(-45+0 * COS(SINE / 15)), RAD(25+5 * COS(SINE / 15)), RAD(-25+10 * COS(SINE / 15))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.5*SIZE+0 * COS(SINE / 15), -0.5*SIZE+0.15 * COS(SINE / 15), -0.5*SIZE+0 * COS(SINE / 15)) * ANGLES(RAD(-25+-10 * COS(SINE / 16)), RAD(-15+0 * COS(SINE / 16)), RAD(10+0 * COS(SINE / 16))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.3*SIZE+0 * COS(SINE / 15), -1.2*SIZE+0.15 * COS(SINE / 15), 0*SIZE+0 * COS(SINE / 15)) * ANGLES(RAD(-10+-10 * COS(SINE / 16)), RAD(25+0 * COS(SINE / 16)), RAD(-25+7 * COS(SINE / 16))), 1 / Animation_Speed)
			elseif mode == 82 then
				--setsong(4773298879)
				NAMEMODE.Text = "F A T E   X"
				NAMEMODE.Font = "Fantasy"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(255, 50, 0)
				NAMEMODE.TextColor3 = Color3.fromRGB(0+(sick.PlaybackLoudness * 0.2), 0, 0)

				CHAT.Text = "There is no escape."
				CHAT.Font = "Fantasy"
				CHAT.TextStrokeColor3 = Color3.fromRGB(255, 50, 0)
				CHAT.TextColor3 = Color3.fromRGB(0+(sick.PlaybackLoudness * 0.2), 0, 0)
				sick.Pitch = 1
				if MRANDOM(1,10) == 1 then
					Neck.C0 = Clerp(Neck.C0,NECKC0 * ANGLES(RAD(20+MRANDOM(-20,20)),RAD((10*COS(SINE/100))+MRANDOM(-20,20)),RAD(MRANDOM(-20,20))),1)
				end
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(30.1+6*math.cos(SINE/25))), 1 / Animation_Speed)

				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 15), 0*SIZE+0 * COS(SINE / 15), 3.5*SIZE+0.5 * COS(SINE / 15)) * ANGLES(RAD(-30+5 * COS(SINE / 16)), RAD(-15+0 * COS(SINE / 16)), RAD(10+0 * COS(SINE / 16))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.6*SIZE-0 * COS(SINE / 15), 0.3*SIZE+0.15 * COS(SINE / 15), 0.5*SIZE+0 * COS(SINE / 15)) * ANGLES(RAD(45+10 * COS(SINE / 16)), RAD(25+0 * COS(SINE / 16)), RAD(35+3 * COS(SINE / 16))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.6*SIZE-0 * COS(SINE / 15), 0*SIZE+0.15 * COS(SINE / 15), 0*SIZE+0 * COS(SINE / 15)) * ANGLES(RAD(150+10 * COS(SINE / 16)), RAD(-10+-5 * COS(SINE / 16)), RAD(-10+0 * COS(SINE / 16))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.5*SIZE+0 * COS(SINE / 15), -0.5*SIZE+0.15 * COS(SINE / 15), -0.5*SIZE+0 * COS(SINE / 15)) * ANGLES(RAD(-35+-10 * COS(SINE / 16)), RAD(-35+0 * COS(SINE / 16)), RAD(10+-10 * COS(SINE / 16))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 15), -1.2*SIZE+0.15 * COS(SINE / 15), 0*SIZE+0 * COS(SINE / 15)) * ANGLES(RAD(-10+-10 * COS(SINE / 16)), RAD(25+0 * COS(SINE / 16)), RAD(-10+10 * COS(SINE / 16))), 1 / Animation_Speed)

			elseif mode == 83 then
				--setsong(4736305916)
				NAMEMODE.Text = "SHATTERED"
				NAMEMODE.Font = "Fantasy"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(75, 0, 140)
				NAMEMODE.TextColor3 = Color3.fromRGB(0+(sick.PlaybackLoudness * 0.2), 0, 0+(sick.PlaybackLoudness * 0.3))

				CHAT.Text = "FRAGMENTED FROM EXISTANCE!"
				CHAT.Font = "Fantasy"
				CHAT.TextStrokeColor3 = Color3.fromRGB(75, 0, 140)
				CHAT.TextColor3 = Color3.fromRGB(0+(sick.PlaybackLoudness * 0.2), 0, 0+(sick.PlaybackLoudness * 0.3))
				sick.Pitch = 1
				if MRANDOM(1,10) == 1 then
					Neck.C0 = Clerp(Neck.C0,NECKC0 * ANGLES(RAD(20+MRANDOM(-20,20)),RAD((10*COS(SINE/100))+MRANDOM(-20,20)),RAD(MRANDOM(-20,20))),1)
				end
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(30.1+6*math.cos(SINE/25))), 1 / Animation_Speed)

				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 16), 0*SIZE+0 * COS(SINE / 16), 0*SIZE+0.3 * COS(SINE / 16)) * ANGLES(RAD(-25+5 * COS(SINE / 17)), RAD(0+3 * COS(SINE / 17)), RAD(0+0 * COS(SINE / 17))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.6*SIZE-0 * COS(SINE / 16), 0.5*SIZE+0.15 * COS(SINE / 16), 0*SIZE+0 * COS(SINE / 16)) * ANGLES(RAD(-35+0 * COS(SINE / 17)), RAD(-10+5 * COS(SINE / 17)), RAD(25+5 * COS(SINE / 17))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.6*SIZE-0 * COS(SINE / 16), 0.5*SIZE+0.2 * COS(SINE / 16), 0*SIZE+0 * COS(SINE / 16)) * ANGLES(RAD(120+0 * COS(SINE / 17)), RAD(10+0 * COS(SINE / 17)), RAD(-25+-5 * COS(SINE / 17))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.5*SIZE+0 * COS(SINE / 16), 0*SIZE+0 * COS(SINE / 16), -0.7*SIZE+0 * COS(SINE / 16)) * ANGLES(RAD(-25+-5 * COS(SINE / 17)), RAD(-15+5 * COS(SINE / 17)), RAD(10+4 * COS(SINE / 17))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 16), -1.5*SIZE+0 * COS(SINE / 16), 0*SIZE+0 * COS(SINE / 16)) * ANGLES(RAD(65+-5 * COS(SINE / 17)), RAD(10+0 * COS(SINE / 17)), RAD(0+-5 * COS(SINE / 17))), 1 / Animation_Speed)

			elseif mode == 85 then
				--setsong(4736305916)
				NAMEMODE.Text = "AQUATIC"
				NAMEMODE.Font = "PatrickHand"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(64, 106, 150)
				NAMEMODE.TextColor3 = Color3.fromRGB(200, 200, 255)

				CHAT.Text = "Watch as the waves go by.."
				CHAT.Font = "PatrickHand"
				CHAT.TextStrokeColor3 = Color3.fromRGB(64, 106, 150)
				CHAT.TextColor3 = Color3.fromRGB(200, 200, 255)
				sick.Pitch = 1
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(-0.1+6*math.cos(SINE/25))), 1 / Animation_Speed)


				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 15), 0*SIZE+0 * COS(SINE / 15), 3.5*SIZE+0.7 * COS(SINE / 15)) * ANGLES(RAD(-15+6 * COS(SINE / 16)), RAD(25+0 * COS(SINE / 16)), RAD(-10+0 * COS(SINE / 16))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.6*SIZE-0 * COS(SINE / 15), 0.2*SIZE+0.15 * COS(SINE / 15), 0.3*SIZE+0.1 * COS(SINE / 15)) * ANGLES(RAD(210+-6 * COS(SINE / 16)), RAD(-25+0 * COS(SINE / 16)), RAD(-40+0 * COS(SINE / 16))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5*SIZE-0 * COS(SINE / 15), 0.3*SIZE+0.15 * COS(SINE / 15), 0.3*SIZE+0 * COS(SINE / 15)) * ANGLES(RAD(-25+-6 * COS(SINE / 16)), RAD(-10+-10 * COS(SINE / 16)), RAD(-40+0 * COS(SINE / 16))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.5*SIZE+0 * COS(SINE / 15), -0.9*SIZE+0.15 * COS(SINE / 15), -0.5*SIZE+0 * COS(SINE / 15)) * ANGLES(RAD(-25+-7 * COS(SINE / 16)), RAD(-25+5 * COS(SINE / 16)), RAD(0+6 * COS(SINE / 16))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 15), -1.3*SIZE+0.15 * COS(SINE / 15), 0*SIZE+0 * COS(SINE / 15)) * ANGLES(RAD(-10+0 * COS(SINE / 16)), RAD(25+0 * COS(SINE / 16)), RAD(-25+-6 * COS(SINE / 16))), 1 / Animation_Speed)
			elseif mode == 86 then
				--setsong(4736305916)
				NAMEMODE.Text = "NUCLEAR"
				NAMEMODE.Font = "Bodoni"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(64, 170, 56)
				NAMEMODE.TextColor3 = Color3.fromRGB(100, 230, 100)

				CHAT.Text = "Shattering DNA.."
				CHAT.Font = "Bodoni"
				CHAT.TextStrokeColor3 = Color3.fromRGB(64, 170, 56)
				CHAT.TextColor3 = Color3.fromRGB(100, 230, 100)
				sick.Pitch = 1

				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.6*SIZE-0 * COS(SINE / 19), 0.2*SIZE+0.15 * COS(SINE / 19), 0.3*SIZE+0 * COS(SINE / 19)) * ANGLES(RAD(65+10 * COS(SINE / 20)), RAD(25+5 * COS(SINE / 20)), RAD(25+0 * COS(SINE / 20))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.6*SIZE-0 * COS(SINE / 19), 0.5*SIZE+0.15 * COS(SINE / 19), 0*SIZE+0 * COS(SINE / 19)) * ANGLES(RAD(160+5 * COS(SINE / 20)), RAD(-10+0 * COS(SINE / 20)), RAD(-10+5 * COS(SINE / 20))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE+.3 * math.sin(SINE / 32), 0*SIZE+0 * COS(SINE / 1), 0*SIZE+.1 * math.cos(SINE / 32)) * ANGLES(math.rad(-12.6), RAD(-4.7+8 * math.sin(SINE / 32)), RAD(-0+0 * COS(SINE / 1))), 1 / Animation_Speed)
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(70.3+3*math.cos(SINE/30)),math.rad(180+15*math.cos(SINE/58)),math.rad(-0.0+0*math.cos(SINE/25))), 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE+.1 * SIN(SINE / 32), -1*SIZE-.1 * COS(SINE / 32)-.05*math.sin(SINE/32)-rightlegheight, -.3*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(-24.8),math.rad(-20.1),math.rad(17.4-8*math.sin(SINE/32)))*ANGLES(math.rad(0),math.rad(90),math.rad(0)), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE+.1 * SIN(SINE / 32), -1*SIZE-.1 * COS(SINE / 32)+.05*math.sin(SINE/32)-leftlegheight, -0.3*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(-8.6),math.rad(23.2),math.rad(-9.5-8*math.sin(SINE/32)))*ANGLES(math.rad(0),math.rad(-90),math.rad(0)), 1 / Animation_Speed) 
			elseif mode == 87 then
				--setsong(4736305916)
				NAMEMODE.Text = "system32"
				NAMEMODE.Font = "Code"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(100, 100, 150)
				NAMEMODE.TextColor3 = Color3.fromRGB(100, 100, 150)

				CHAT.Text = "print('Please Update!')"
				CHAT.Font = "Code"
				CHAT.TextStrokeColor3 = Color3.fromRGB(100, 100, 150)
				CHAT.TextColor3 = Color3.fromRGB(100, 100, 150)
				sick.Pitch = 1
				if MRANDOM(1,3) == 1 then
					Neck.C0 = Clerp(Neck.C0,NECKC0 * ANGLES(RAD(20+MRANDOM(-20,20)),RAD((10*COS(SINE/100))+MRANDOM(-20,20)),RAD(MRANDOM(-20,20))),1)
				end
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 19), 0*SIZE+0 * COS(SINE / 19), 3.5*SIZE+0.5 * COS(SINE / 19)) * ANGLES(RAD(-25+-7 * COS(SINE / 20)), RAD(25+0 * COS(SINE / 20)), RAD(10+0 * COS(SINE / 20))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.6*SIZE-0 * COS(SINE / 19), 0.1*SIZE+0.15 * COS(SINE / 19), 0*SIZE+0 * COS(SINE / 19)) * ANGLES(RAD(25+-8 * COS(SINE / 20)), RAD(-25+0 * COS(SINE / 20)), RAD(-25+0 * COS(SINE / 20))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.6*SIZE-0 * COS(SINE / 19), 0*SIZE+0.15 * COS(SINE / 19), 0*SIZE+0 * COS(SINE / 19)) * ANGLES(RAD(-15+-7 * COS(SINE / 20)), RAD(25+0 * COS(SINE / 20)), RAD(-35+-7 * COS(SINE / 20))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(-0.1*SIZE+0 * COS(SINE / 19), 0*SIZE+0.15 * COS(SINE / 19), -0.5*SIZE+0 * COS(SINE / 19)) * ANGLES(RAD(-25+7 * COS(SINE / 20)), RAD(15+0 * COS(SINE / 20)), RAD(-20+-7 * COS(SINE / 20))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(0.5*SIZE+0 * COS(SINE / 19), -1.2*SIZE+0.15 * COS(SINE / 19), 0.3*SIZE+0 * COS(SINE / 19)) * ANGLES(RAD(-25+10 * COS(SINE / 20)), RAD(-15+0 * COS(SINE / 20)), RAD(0+7 * COS(SINE / 20))), 1 / Animation_Speed)
			elseif mode == 88 then
				--setsong(4736305916)
				NAMEMODE.Text = "ACIDIC"
				NAMEMODE.Font = "Michroma"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(59, 150, 83)
				NAMEMODE.TextColor3 = Color3.fromRGB(34, 201, 93)

				CHAT.Text = "Feel the toxins!"
				CHAT.Font = "Michroma"
				CHAT.TextStrokeColor3 = Color3.fromRGB(59, 150, 83)
				CHAT.TextColor3 = Color3.fromRGB(34, 201, 93)
				sick.Pitch = 1

				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(-0.1+6*math.cos(SINE/25))), 1 / Animation_Speed)


				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 15), 0*SIZE+0 * COS(SINE / 15), 0*SIZE+0.2 * COS(SINE / 15)) * ANGLES(RAD(23+7 * COS(SINE / 16)), RAD(-25+-3 * COS(SINE / 16)), RAD(-6+0 * COS(SINE / 16))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1*SIZE-0 * COS(SINE / 15), 0.5*SIZE+0.15 * COS(SINE / 15), -1*SIZE+0 * COS(SINE / 15)) * ANGLES(RAD(220+-6 * COS(SINE / 16)), RAD(25+0 * COS(SINE / 16)), RAD(-20+0 * COS(SINE / 16))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.6*SIZE-0 * COS(SINE / 15), 0*SIZE+0.15 * COS(SINE / 15), 0.5*SIZE+0 * COS(SINE / 15)) * ANGLES(RAD(56+17 * COS(SINE / 16)), RAD(-20+0 * COS(SINE / 16)), RAD(-35+0 * COS(SINE / 16))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.5*SIZE+0 * COS(SINE / 15), -0.9*SIZE+-0.2 * COS(SINE / 15), 0*SIZE+0 * COS(SINE / 15)) * ANGLES(RAD(25+7 * COS(SINE / 16)), RAD(-15+5 * COS(SINE / 16)), RAD(25+0 * COS(SINE / 16))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 15), -1.4*SIZE+-0.2 * COS(SINE / 15), 0*SIZE+0 * COS(SINE / 15)) * ANGLES(RAD(-15+10 * COS(SINE / 16)), RAD(15+0 * COS(SINE / 16)), RAD(10+0 * COS(SINE / 16))), 1 / Animation_Speed)
			elseif mode == 89 then
				--setsong(4736305916)
				NAMEMODE.Text = "MALIGNANT"
				NAMEMODE.Font = "Jura"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(190, 255, 147)
				NAMEMODE.TextColor3 = Color3.fromRGB(190, 255, 147)

				CHAT.Text = "FEEL YOUR SKIN MELT AWAY!"
				CHAT.Font = "Jura"
				CHAT.TextStrokeColor3 = Color3.fromRGB(190, 255, 147)
				CHAT.TextColor3 = Color3.fromRGB(190, 255, 147)
				sick.Pitch = 1
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(70.1+6*math.cos(SINE/25))), 1 / Animation_Speed)

				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 15), 0*SIZE+0 * COS(SINE / 15), 3*SIZE+0.5 * COS(SINE / 15)) * ANGLES(RAD(0+5 * COS(SINE / 16)), RAD(30+0 * COS(SINE / 16)), RAD(0+0 * COS(SINE / 16))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.6*SIZE-0 * COS(SINE / 15), 0*SIZE+0.15 * COS(SINE / 15), 0.7*SIZE+0 * COS(SINE / 15)) * ANGLES(RAD(65+-6 * COS(SINE / 16)), RAD(-25+5 * COS(SINE / 16)), RAD(35+0 * COS(SINE / 16))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.6*SIZE-0 * COS(SINE / 15), 0*SIZE+0.15 * COS(SINE / 15), 0.7*SIZE+0 * COS(SINE / 15)) * ANGLES(RAD(65+-6 * COS(SINE / 16)), RAD(25+-5 * COS(SINE / 16)), RAD(-35+0 * COS(SINE / 16))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.5*SIZE+0 * COS(SINE / 15), -1.2*SIZE+0.15 * COS(SINE / 15), 0*SIZE+0 * COS(SINE / 15)) * ANGLES(RAD(-15+8 * COS(SINE / 16)), RAD(-15+3 * COS(SINE / 16)), RAD(25+5 * COS(SINE / 16))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 15), -0.4*SIZE+0.15 * COS(SINE / 15), 0*SIZE+0 * COS(SINE / 15)) * ANGLES(RAD(0+0 * COS(SINE / 16)), RAD(25+0 * COS(SINE / 16)), RAD(-10+-5 * COS(SINE / 16))), 1 / Animation_Speed)
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(-0.1+6*math.cos(SINE/25))), 1 / Animation_Speed)


			elseif mode == 90 then
				--setsong(4736305916)
				NAMEMODE.Text = "NOXIOUS"
				NAMEMODE.Font = "Merriweather"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(95, 0, 0)
				NAMEMODE.TextColor3 = Color3.fromRGB(65, 0, 0)

				CHAT.Text = "ENJOY POISONING!"
				CHAT.Font = "Merriweather"
				CHAT.TextStrokeColor3 = Color3.fromRGB(95, 0, 0)
				CHAT.TextColor3 = Color3.fromRGB(65, 0, 0)
				sick.Pitch = 1

				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 1 * COS(SINE / 30), 0*SIZE+0 * COS(SINE / 15), 3*SIZE+0.5 * COS(SINE / 15)) * ANGLES(RAD(15+5 * COS(SINE / 16)), RAD(0+0 * COS(SINE / 16)), RAD(0+0 * COS(SINE / 16))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.6*SIZE-0 * COS(SINE / 1), 0.3*SIZE+0.15 * COS(SINE / 15), 0.3*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(-26+10 * COS(SINE / 15)), RAD(-25+-7 * COS(SINE / 15)), RAD(18+5 * COS(SINE / 15))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.6*SIZE-0 * COS(SINE / 1), 0*SIZE+0.15 * COS(SINE / 15), 0*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(120+10 * COS(SINE / 15)), RAD(10+7 * COS(SINE / 15)), RAD(-10+-5 * COS(SINE / 15))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.3*SIZE+0 * COS(SINE / 1), -0.7*SIZE+0.15 * COS(SINE / 15), -0.1*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(-25+10 * COS(SINE / 15)), RAD(-20+6 * COS(SINE / 15)), RAD(10+-3 * COS(SINE / 15))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.4*SIZE+0 * COS(SINE / 1), -1*SIZE+0.15 * COS(SINE / 15), 0.3*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(-25+10 * COS(SINE / 15)), RAD(25+-6 * COS(SINE / 15)), RAD(-10+3 * COS(SINE / 15))), 1 / Animation_Speed)
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(-0.1+6*math.cos(SINE/25))), 1 / Animation_Speed)


			elseif mode == 91 then
				--setsong(4736305916)
				NAMEMODE.Text = "hollow"
				NAMEMODE.Font = "Arcade"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(0+(sick.PlaybackLoudness * 0.2), 0, 0)
				NAMEMODE.TextColor3 = Color3.fromRGB(0+(sick.PlaybackLoudness * 0.2), 0, 0)

				CHAT.Text = "g o n e . . ."
				CHAT.Font = "Arcade"
				CHAT.TextStrokeColor3 = Color3.fromRGB(0+(sick.PlaybackLoudness * 0.2), 0, 0)
				CHAT.TextColor3 = Color3.fromRGB(0+(sick.PlaybackLoudness * 0.2), 0, 0)
				sick.Pitch = 1
				if MRANDOM(1,7) == 1 then
					Neck.C0 = Clerp(Neck.C0,NECKC0 * ANGLES(RAD(20+MRANDOM(-20,20)),RAD((10*COS(SINE/100))+MRANDOM(-20,20)),RAD(MRANDOM(-20,20))),1)
				end
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(-20.1+6*math.cos(SINE/25))), 1 / Animation_Speed)
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 15), 0*SIZE+0 * COS(SINE / 15), 3*SIZE+0.5 * COS(SINE / 15)) * ANGLES(RAD(-15+7 * COS(SINE / 16)), RAD(15+0 * COS(SINE / 16)), RAD(-10+0 * COS(SINE / 16))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5*SIZE-0 * COS(SINE / 15), 0*SIZE+0.15 * COS(SINE / 15), -1*SIZE+0 * COS(SINE / 15)) * ANGLES(RAD(205+-6 * COS(SINE / 16)), RAD(35+4 * COS(SINE / 16)), RAD(-10+3 * COS(SINE / 16))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.4*SIZE-0 * COS(SINE / 15), 0*SIZE+0.15 * COS(SINE / 15), 0*SIZE+0 * COS(SINE / 15)) * ANGLES(RAD(120+6 * COS(SINE / 16)), RAD(-10+8 * COS(SINE / 16)), RAD(-100+-3 * COS(SINE / 16))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.5*SIZE+0 * COS(SINE / 15), -1.2*SIZE+0.15 * COS(SINE / 15), 0*SIZE+0 * COS(SINE / 15)) * ANGLES(RAD(-10+-6 * COS(SINE / 16)), RAD(-25+0 * COS(SINE / 16)), RAD(25+4 * COS(SINE / 16))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 15), -0.7*SIZE+0.15 * COS(SINE / 15), 0*SIZE+0 * COS(SINE / 15)) * ANGLES(RAD(-10+0 * COS(SINE / 16)), RAD(15+0 * COS(SINE / 16)), RAD(-10+-4 * COS(SINE / 16))), 1 / Animation_Speed)
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(-0.1+6*math.cos(SINE/25))), 1 / Animation_Speed)



			elseif mode == 92 then
				--setsong(4736305916)
				NAMEMODE.Text = "MURDER"
				NAMEMODE.Font = "PermanentMarker"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(0+(sick.PlaybackLoudness * 1.2), 0, 0)
				NAMEMODE.TextColor3 = Color3.fromRGB(0+(sick.PlaybackLoudness * .2), 0, 0)

				CHAT.Text = "Taste the blood."
				CHAT.Font = "PermanentMarker"
				CHAT.TextStrokeColor3 = Color3.fromRGB(0+(sick.PlaybackLoudness * 1.2), 0, 0)
				CHAT.TextColor3 = Color3.fromRGB(0+(sick.PlaybackLoudness * .2), 0, 0)
				sick.Pitch = 1

				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(-0.1+6*math.cos(SINE/25))), 1 / Animation_Speed)

				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 19), 0*SIZE+0 * COS(SINE / 19), 3*SIZE+0.5 * COS(SINE / 19)) * ANGLES(RAD(20+3 * COS(SINE / 20)), RAD(-20+5 * COS(SINE / 20)), RAD(-10+0 * COS(SINE / 20))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.3*SIZE-0 * COS(SINE / 19), 0.5*SIZE+0.15 * COS(SINE / 19), -0.7*SIZE+0 * COS(SINE / 19)) * ANGLES(RAD(200+5 * COS(SINE / 20)), RAD(25+10 * COS(SINE / 20)), RAD(-45+0 * COS(SINE / 20))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.6*SIZE-0 * COS(SINE / 19), 0.2*SIZE+0.15 * COS(SINE / 19), 0*SIZE+0 * COS(SINE / 19)) * ANGLES(RAD(-35+-7 * COS(SINE / 20)), RAD(15+-10 * COS(SINE / 20)), RAD(-25+0 * COS(SINE / 20))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.5*SIZE+0 * COS(SINE / 19), -0.5*SIZE+0.15 * COS(SINE / 19), 0*SIZE+0 * COS(SINE / 19)) * ANGLES(RAD(-25+-10 * COS(SINE / 20)), RAD(-25+0 * COS(SINE / 20)), RAD(6+6 * COS(SINE / 20))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 19), -1.3*SIZE+0.15 * COS(SINE / 19), 0*SIZE+0 * COS(SINE / 19)) * ANGLES(RAD(-45+-10 * COS(SINE / 20)), RAD(25+0 * COS(SINE / 20)), RAD(-15+-6 * COS(SINE / 20))), 1 / Animation_Speed)
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(-0.1+6*math.cos(SINE/25))), 1 / Animation_Speed)


			elseif mode == 93 then
				--setsong(4736305916)
				NAMEMODE.Text = "MANIAC"
				NAMEMODE.Font = "Sarpanch"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(0+(sick.PlaybackLoudness * 1.4), 0, 0)
				NAMEMODE.TextColor3 = Color3.fromRGB(0+(sick.PlaybackLoudness * 1.4), 0, 0)

				CHAT.Text = "INSANITY."
				CHAT.Font = "Sarpanch"
				CHAT.TextStrokeColor3 = Color3.fromRGB(0+(sick.PlaybackLoudness * 1.4), 0, 0)
				CHAT.TextColor3 = Color3.fromRGB(0+(sick.PlaybackLoudness * 1.4), 0, 0)
				sick.Pitch = 1

				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0 - 0.04 * SIN(SINE / 24)*SIZE, 0 + 0.04 * SIN(SINE / 12)*SIZE, 0 + 0.05*SIZE * COS(SINE / 12)) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(0 - 2.5 * SIN(SINE / 24)), RAD(0)), 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-0.6*SIZE-0 * COS(SINE / 12), 0.3*SIZE+0.15 * COS(SINE / 13.5), -0.5*SIZE+0 * COS(SINE / 12)) * ANGLES(RAD(100+10 * COS(SINE / 24)), RAD(-10+5 * COS(SINE / 24)), RAD(80+0 * COS(SINE / 24))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.6*SIZE-0 * COS(SINE / 13.5), 0*SIZE+0.15 * COS(SINE / 13.5), 0.3*SIZE+0 * COS(SINE / 13.5)) * ANGLES(RAD(10+5 * COS(SINE / 24)), RAD(10+5 * COS(SINE / 24)), RAD(-20+0 * COS(SINE / 24))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE, -1*SIZE + 0.06 * SIN(SINE / 24) - 0.05*SIZE * COS(SINE / 12), -0.01*SIZE) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(75), RAD(0)) * ANGLES(RAD(-14 - 2.5 * SIN(SINE / 24)), RAD(0), RAD(0)), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE, -1*SIZE - 0.06 * SIN(SINE / 24) - 0.05*SIZE * COS(SINE / 12), -0.01*SIZE) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(-75), RAD(0)) * ANGLES(RAD(-14 + 2.5 * SIN(SINE / 24)), RAD(0), RAD(0)), 1 / Animation_Speed)
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(-0.1+6*math.cos(SINE/25))), 1 / Animation_Speed)



			elseif mode == 94 then
				--setsong(4736305916)
				NAMEMODE.Text = "BLOODSHED"
				NAMEMODE.Font = "Sarpanch"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(0+(sick.PlaybackLoudness * 0.5), 0+(sick.PlaybackLoudness * 0.1), 0+(sick.PlaybackLoudness * 0.1))
				NAMEMODE.TextColor3 = Color3.fromRGB(0+(sick.PlaybackLoudness * 0.5), 0+(sick.PlaybackLoudness * 0.1), 0+(sick.PlaybackLoudness * 0.1))

				CHAT.Text = "RUIN!"
				CHAT.Font = "Sarpanch"
				CHAT.TextStrokeColor3 = Color3.fromRGB(0+(sick.PlaybackLoudness * 0.5), 0+(sick.PlaybackLoudness * 0.1), 0+(sick.PlaybackLoudness * 0.1))
				CHAT.TextColor3 = Color3.fromRGB(0+(sick.PlaybackLoudness * 0.5), 0+(sick.PlaybackLoudness * 0.1), 0+(sick.PlaybackLoudness * 0.1))
				sick.Pitch = 1

				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(-0.1+6*math.cos(SINE/25))), 1 / Animation_Speed)

				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 19), 0*SIZE+0 * COS(SINE / 19), 0*SIZE+0.2 * COS(SINE / 19)) * ANGLES(RAD(20+5 * COS(SINE / 20)), RAD(15+0 * COS(SINE / 20)), RAD(10+0 * COS(SINE / 20))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.6*SIZE-0 * COS(SINE / 19), 0.5*SIZE+0.15 * COS(SINE / 19), 0.3*SIZE+0 * COS(SINE / 19)) * ANGLES(RAD(170+-10 * COS(SINE / 20)), RAD(20+-7 * COS(SINE / 20)), RAD(-30+0 * COS(SINE / 20))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.6*SIZE-0 * COS(SINE / 19), 0.5*SIZE+0.15 * COS(SINE / 19), 0.3*SIZE+0 * COS(SINE / 19)) * ANGLES(RAD(170+-10 * COS(SINE / 20)), RAD(-20+7 * COS(SINE / 20)), RAD(30+0 * COS(SINE / 20))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.5*SIZE+0 * COS(SINE / 19), -1*SIZE+-0.2 * COS(SINE / 19), 0.3*SIZE+0 * COS(SINE / 19)) * ANGLES(RAD(-20+7 * COS(SINE / 20)), RAD(-15+0 * COS(SINE / 20)), RAD(5+6 * COS(SINE / 20))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 19), -0.7*SIZE+-0.2 * COS(SINE / 19), 0*SIZE+0 * COS(SINE / 19)) * ANGLES(RAD(25+7 * COS(SINE / 20)), RAD(15+0 * COS(SINE / 20)), RAD(-20+-6 * COS(SINE / 20))), 1 / Animation_Speed)
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(-0.1+6*math.cos(SINE/25))), 1 / Animation_Speed)


			elseif mode == 95 then
				--setsong(4736305916)
				NAMEMODE.Text = "ISOLATION"
				NAMEMODE.Font = "Sarpanch"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(0+(sick.PlaybackLoudness * 0.0), 0+(sick.PlaybackLoudness * 00), 0+(sick.PlaybackLoudness * 0.5))
				NAMEMODE.TextColor3 = Color3.fromRGB(0+(sick.PlaybackLoudness * 0.0), 0+(sick.PlaybackLoudness * 00), 0+(sick.PlaybackLoudness * 0.5))

				CHAT.Text = "Eternally alone.."
				CHAT.Font = "Sarpanch"
				CHAT.TextStrokeColor3 = Color3.fromRGB(0+(sick.PlaybackLoudness * 0.0), 0+(sick.PlaybackLoudness * 0), 0+(sick.PlaybackLoudness * 0.5))
				CHAT.TextColor3 = Color3.fromRGB(0+(sick.PlaybackLoudness * 0.0), 0+(sick.PlaybackLoudness * 00), 0+(sick.PlaybackLoudness * 0.5))
				sick.Pitch = 1
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 20), 0*SIZE+0 * COS(SINE / 20), 0.5*SIZE+0.5 * COS(SINE / 20)) * ANGLES(RAD(-15+0 * COS(SINE / 21)), RAD(0+8 * COS(SINE / 21)), RAD(0+3 * COS(SINE / 21))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1*SIZE-0 * COS(SINE / 20), 0*SIZE+0.15 * COS(SINE / 20), -0.5*SIZE+0 * COS(SINE / 20)) * ANGLES(RAD(140+6 * COS(SINE / 19)), RAD(25+7 * COS(SINE / 19)), RAD(-67+0 * COS(SINE / 19))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1*SIZE-0 * COS(SINE / 20), 0.5*SIZE+0.15 * COS(SINE / 20), 0.5*SIZE+0 * COS(SINE / 20)) * ANGLES(RAD(-140+-3 * COS(SINE / 19)), RAD(0+7 * COS(SINE / 19)), RAD(56+0 * COS(SINE / 19))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 20), -1.3*SIZE+0.15 * COS(SINE / 20), -0.3*SIZE+0 * COS(SINE / 20)) * ANGLES(RAD(67+6 * COS(SINE / 21)), RAD(25+3 * COS(SINE / 21)), RAD(30+5 * COS(SINE / 21))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(0.5*SIZE+0 * COS(SINE / 20), -1.5*SIZE+0.15 * COS(SINE / 20), 0*SIZE+0 * COS(SINE / 20)) * ANGLES(RAD(45+6 * COS(SINE / 19)), RAD(-15+-3 * COS(SINE / 19)), RAD(-15+-5 * COS(SINE / 19))), 1 / Animation_Speed)
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(-0.1+6*math.cos(SINE/25))), 1 / Animation_Speed)


			elseif mode == 96 then
				--setsong(4736305916)
				NAMEMODE.Text = "Arcade"
				NAMEMODE.Font = "Arcade"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(0+(sick.PlaybackLoudness * 0),30+(sick.PlaybackLoudness * 0.5), 0+(sick.PlaybackLoudness * 0))
				NAMEMODE.TextColor3 = Color3.fromRGB(0+(sick.PlaybackLoudness * 0), 0+(sick.PlaybackLoudness * 0.5), 0+(sick.PlaybackLoudness * 0))
				CHAT.Text = "Good game."
				CHAT.Font = "Arcade"
				CHAT.TextStrokeColor3 = Color3.fromRGB(0+(sick.PlaybackLoudness * 0), 30+(sick.PlaybackLoudness * 0.5), 0+(sick.PlaybackLoudness * 0))
				CHAT.TextColor3 = Color3.fromRGB(0+(sick.PlaybackLoudness * 0), 0+(sick.PlaybackLoudness * 0.5), 0+(sick.PlaybackLoudness * 0))
				sick.Pitch = 1
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(-0.1+6*math.cos(SINE/25))), 1 / Animation_Speed)
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0.3 * COS(SINE / 19), 0*SIZE+0 * COS(SINE / 19), 4*SIZE+0.5 * COS(SINE / 19)) * ANGLES(RAD(-10+7 * COS(SINE / 20)), RAD(5+3 * COS(SINE / 20)), RAD(0+0 * COS(SINE / 20))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.3*SIZE-0 * COS(SINE / 19), 0.5*SIZE+0.15 * COS(SINE / 19), -1*SIZE+0 * COS(SINE / 19)) * ANGLES(RAD(200+8 * COS(SINE / 20)), RAD(15+5 * COS(SINE / 20)), RAD(-45+6 * COS(SINE / 20))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.3*SIZE-0 * COS(SINE / 19), 0*SIZE+0.15 * COS(SINE / 19), 0.7*SIZE+0 * COS(SINE / 19)) * ANGLES(RAD(90+0 * COS(SINE / 20)), RAD(25+-5 * COS(SINE / 20)), RAD(-34+-6 * COS(SINE / 20))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.5*SIZE+0 * COS(SINE / 19), -1.2*SIZE+0.15 * COS(SINE / 19), 0.3*SIZE+0 * COS(SINE / 19)) * ANGLES(RAD(-25+-8 * COS(SINE / 20)), RAD(-15+3 * COS(SINE / 20)), RAD(15+-10 * COS(SINE / 20))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 1), -0.7*SIZE+0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(0+-8 * COS(SINE / 20)), RAD(15+-3 * COS(SINE / 20)), RAD(-10+10 * COS(SINE / 20))), 1 / Animation_Speed)
			elseif mode == 97 then
				--setsong(4736305916)
				NAMEMODE.Text = "MALWARE"
				NAMEMODE.Font = Enum.Font:GetEnumItems()[math.random(1, #Enum.Font:GetEnumItems())]
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(math.random(1, 255), math.random(1, 255), math.random(1, 255))
				NAMEMODE.TextColor3 = Color3.fromRGB(math.random(1, 255), math.random(1, 255), math.random(1, 255))

				CHAT.Text = "deletion"
				CHAT.Font = Enum.Font:GetEnumItems()[math.random(1, #Enum.Font:GetEnumItems())]
				CHAT.TextStrokeColor3 = Color3.fromRGB(math.random(1, 255), math.random(1, 255), math.random(1, 255))
				CHAT.TextColor3 = Color3.fromRGB(math.random(1, 255), math.random(1, 255), math.random(1, 255))
				sick.Pitch = 1
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(-0.1+6*math.cos(SINE/25))), 1 / Animation_Speed)
				gunweld.C0 = Clerp(gunweld.C0, CF(-0*SIZE+0 * COS(SINE / 15), -15*SIZE-0 * COS(SINE /15), 0.65*SIZE+0 * COS(SINE / 15)) * ANGLES(RAD(90+0 * COS(SINE / 505)), RAD(-90+0* COS(SINE / 55)), RAD(45-0 * COS(SINE / 15))), 1 / Animation_Speed)
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 32.5), 0*SIZE+0 * COS(SINE / 32.5), 0*SIZE+0.15 * COS(SINE / 32.5)) * ANGLES(RAD(0+3 * COS(SINE / 32)), RAD(0+0 * COS(SINE / 32)), RAD(0+0 * COS(SINE / 32))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.6*SIZE-0 * COS(SINE / 32), 0.3*SIZE+-0.1 * COS(SINE / 32), 0*SIZE+0 * COS(SINE / 32)) * ANGLES(RAD(0+5 * COS(SINE / 32)), RAD(-5+0 * COS(SINE / 32)), RAD(10+-8 * COS(SINE / 32))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.6*SIZE-0 * COS(SINE / 32), 0.3*SIZE+-0.1 * COS(SINE / 32), 0*SIZE+0 * COS(SINE / 32)) * ANGLES(RAD(0+5 * COS(SINE / 32)), RAD(5+0 * COS(SINE / 32)), RAD(-10+8 * COS(SINE / 32))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.35*SIZE+0 * COS(SINE / 32.5), -1.08*SIZE+-0.12 * COS(SINE / 32.5), 0.45*SIZE+0 * COS(SINE / 32.5)) * ANGLES(RAD(0+6 * COS(SINE / 32)), RAD(-15+2 * COS(SINE / 32)), RAD(8+0 * COS(SINE / 32))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.35*SIZE+0 * COS(SINE / 32.5), -1.08*SIZE+-0.12 * COS(SINE / 32.5), 0.45*SIZE+0 * COS(SINE / 32.5)) * ANGLES(RAD(0+6 * COS(SINE / 32)), RAD(15+-2 * COS(SINE / 32)), RAD(-8+0 * COS(SINE / 32))), 1 / Animation_Speed)
			elseif mode == 98 then
				--setsong(4736305916)
				NAMEMODE.Text = "MALWARE X"
				NAMEMODE.Font = Enum.Font:GetEnumItems()[math.random(1, #Enum.Font:GetEnumItems())]
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(math.random(1, 255), math.random(1, 50), math.random(1, 155))
				NAMEMODE.TextColor3 = Color3.fromRGB(math.random(1, 255), math.random(1, 50), math.random(1, 155))

				CHAT.Text = "INFECTED"
				CHAT.Font = Enum.Font:GetEnumItems()[math.random(1, #Enum.Font:GetEnumItems())]
				CHAT.TextStrokeColor3 = Color3.fromRGB(math.random(1, 255), math.random(1, 50), math.random(1, 155))
				CHAT.TextColor3 = Color3.fromRGB(math.random(1, 255), math.random(1, 50), math.random(1, 155))
				sick.Pitch = 1
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(-0.1+6*math.cos(SINE/25))), 1 / Animation_Speed)


				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 32.5), 0*SIZE+0.4 * COS(SINE / 32.5), 4.34*SIZE+0.4 * COS(SINE / 32.5)) * ANGLES(RAD(4.34+10 * COS(SINE / 16.5)), RAD(0+0 * COS(SINE / 16.5)), RAD(0+0 * COS(SINE / 16.5))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.6*SIZE-0 * COS(SINE / 32), 0.3*SIZE+0 * COS(SINE / 32), 0*SIZE+0 * COS(SINE / 32)) * ANGLES(RAD(0+0 * COS(SINE / 32)), RAD(-10+-10 * COS(SINE / 32)), RAD(20+20 * COS(SINE / 32))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.6*SIZE-0 * COS(SINE / 32), 0.3*SIZE+0 * COS(SINE / 32), 0*SIZE+0 * COS(SINE / 32)) * ANGLES(RAD(0+0 * COS(SINE / 32)), RAD(10+10 * COS(SINE / 32)), RAD(-20+-20 * COS(SINE / 32))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.5*SIZE+0 * COS(SINE / 32.5), -1*SIZE+-0.4 * COS(SINE / 32.5), 0.2*SIZE+0 * COS(SINE / 32.5)) * ANGLES(RAD(0+0 * COS(SINE / 32)), RAD(-10+0 * COS(SINE / 32)), RAD(13+13 * COS(SINE / 32))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 32.5), -0.36*SIZE+0.2 * COS(SINE / 32.5), -0.72*SIZE+0 * COS(SINE / 32.5)) * ANGLES(RAD(303.61+20 * COS(SINE / 32.5)), RAD(13.01+21 * COS(SINE / 32.5)), RAD(0+10 * COS(SINE / 32.5))), 1 / Animation_Speed)

			elseif mode == 99 then
				--setsong(4736305916)
				NAMEMODE.Text = "dancin"
				NAMEMODE.Font = "Arcade"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(0+(sick.PlaybackLoudness * 0),30+(sick.PlaybackLoudness * 0.5), 0+(sick.PlaybackLoudness * 0))
				NAMEMODE.TextColor3 = Color3.fromRGB(0+(sick.PlaybackLoudness * 0), 0+(sick.PlaybackLoudness * 0.5), 0+(sick.PlaybackLoudness * 0))

				CHAT.Text = "dancin"
				CHAT.Font = "Arcade"
				CHAT.TextStrokeColor3 = Color3.fromRGB(0+(sick.PlaybackLoudness * 0),30+(sick.PlaybackLoudness * 0.5), 0+(sick.PlaybackLoudness * 0))
				CHAT.TextColor3 = Color3.fromRGB(0+(sick.PlaybackLoudness * 0), 0+(sick.PlaybackLoudness * 0.5), 0+(sick.PlaybackLoudness * 0))
				sick.Pitch = 1
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(-0.1+6*math.cos(SINE/25))), 1 / Animation_Speed)


				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(-1.3*SIZE-0 * COS(SINE / 19), 0*SIZE+0.15 * COS(SINE / 19), 0*SIZE+0 * COS(SINE / 19)) * ANGLES(RAD(45+(sick.PlaybackLoudness * .2) * COS(SINE / 99999999)), RAD(-15+5 * COS(SINE / 20)), RAD(-25+-5 * COS(SINE / 20))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(1.3*SIZE-0 * COS(SINE / 19), 0.3*SIZE+0.15 * COS(SINE / 19), 0*SIZE+0 * COS(SINE / 19)) * ANGLES(RAD(-10+5 * COS(SINE / 20)), RAD(-15+-5 * COS(SINE / 20)), RAD(8+5 * COS(SINE / 20))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE+.3 * math.sin(SINE / 32), 0*SIZE+0 * COS(SINE / 1), 0*SIZE+.1 * math.cos(SINE / 32)) * ANGLES(math.rad(0.6), RAD(-4.7+8 * math.sin(SINE / 32)), RAD(-0+0 * COS(SINE / 1))), 1 / Animation_Speed)
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(55.3+3*math.cos(SINE/30)),math.rad(180+15*math.cos(SINE/58)),math.rad(-0.0+0*math.cos(SINE/25))), 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE+.1 * SIN(SINE / 32), -1*SIZE-.1 * COS(SINE / 32)-.05*math.sin(SINE/32)-rightlegheight, -.3*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(0.8),math.rad(-20.1),math.rad(17.4-8*math.sin(SINE/32)))*ANGLES(math.rad(0),math.rad(90),math.rad(0)), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.4*SIZE+0 * COS(SINE / 19), -0.4*SIZE+-0 * COS(SINE / 19), 0*SIZE+0 * COS(SINE / 19)) * ANGLES(RAD(0+5 * COS(SINE / 20)), RAD(20+0 * COS(SINE / 20)), RAD(-14+0 * COS(SINE / 20))), 1 / Animation_Speed)
			elseif mode == 100 then
				--setsong(4736305916)
				NAMEMODE.Text = "DREAM"
				NAMEMODE.Font = "Highway"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(247, 194, 255)
				NAMEMODE.TextColor3 = Color3.fromRGB(255, 255, 255)

				CHAT.Text = "IT'S NOT OVER YET!"
				CHAT.Font = "Highway"
				CHAT.TextStrokeColor3 = Color3.fromRGB(247, 194, 255)
				CHAT.TextColor3 = Color3.fromRGB(255, 255, 255)
				sick.Pitch = 1
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(-0.1+6*math.cos(SINE/25))), 1 / Animation_Speed)


				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE+.3 * math.sin(SINE / 32), 0*SIZE+0 * COS(SINE / 1), 0*SIZE+.1 * math.cos(SINE / 32)) * ANGLES(math.rad(9.6), RAD(-3+8 * math.sin(SINE / 32)), RAD(35+0 * COS(SINE / 1))), 1 / Animation_Speed)
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+7*math.cos(SINE/30)),math.rad(180+15*math.cos(SINE/58)),math.rad(-35.0+0*math.cos(SINE/25))), 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(.9*SIZE+.1 * SIN(SINE / 32), -1*SIZE-.1 * COS(SINE / 32)-.05*math.sin(SINE/32)-rightlegheight, -.3*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(-9.6),math.rad(-17.1),math.rad(20.4-8*math.sin(SINE/32)))*ANGLES(math.rad(0),math.rad(90),math.rad(0)), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-1.1*SIZE+.1 * SIN(SINE / 32), -1*SIZE-.1 * COS(SINE / 32)+.05*math.sin(SINE/32)-leftlegheight, -0.3*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(9.6),math.rad(9.2),math.rad(-18.5-8*math.sin(SINE/32)))*ANGLES(math.rad(0),math.rad(-90),math.rad(0)), 1 / Animation_Speed) 

				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(-0.8*SIZE-0 * COS(SINE / 32), -0.5*SIZE+0.15 * COS(SINE / 32), -0.5*SIZE+0 * COS(SINE / 32)) * ANGLES(RAD(175+-7 * COS(SINE / 33)), RAD(-15+4 * COS(SINE / 33)), RAD(45+3 * COS(SINE / 33))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(1*SIZE-0 * COS(SINE / 32), 0*SIZE+0.15 * COS(SINE / 32), 0.5*SIZE+0 * COS(SINE / 32)) * ANGLES(RAD(120+-5 * COS(SINE / 33)), RAD(-25+-9 * COS(SINE / 33)), RAD(67+10 * COS(SINE / 33))) * LEFTSHOULDERC0, 1 / Animation_Speed)

			elseif mode == 101 then
				NAMEMODE.Text = "MYTHICAL"
				NAMEMODE.Font = "Fantasy"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(247, 97, 255)
				NAMEMODE.TextColor3 = Color3.fromRGB(249, 133, 255)
				CHAT.Text = "Infinite possibilities!"
				CHAT.Font = "Fantasy"
				CHAT.TextStrokeColor3 = Color3.fromRGB(247, 97, 255)
				CHAT.TextColor3 = Color3.fromRGB(249, 133, 255)
				sick.Pitch = 1
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(-0.1+6*math.cos(SINE/25))), 1 / Animation_Speed)
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 20), 0*SIZE+0 * COS(SINE / 20), 4.5*SIZE+1 * COS(SINE / 20)) * ANGLES(RAD(0+4 * COS(SINE / 21)), RAD(-18+8 * COS(SINE / 21)), RAD(-10+4 * COS(SINE / 21))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.2*SIZE-0 * COS(SINE / 20), -0.2*SIZE+0.15 * COS(SINE / 20), -0.5*SIZE+0 * COS(SINE / 20)) * ANGLES(RAD(56+6 * COS(SINE / 21)), RAD(-10+10 * COS(SINE / 21)), RAD(-67+0 * COS(SINE / 21))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1*SIZE-0 * COS(SINE / 20), 0*SIZE+0.15 * COS(SINE / 20), -1*SIZE+0 * COS(SINE / 20)) * ANGLES(RAD(270+7 * COS(SINE / 21)), RAD(-25+10 * COS(SINE / 21)), RAD(76+0 * COS(SINE / 21))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.3*SIZE+0 * COS(SINE / 20), -1.2*SIZE+0.15 * COS(SINE / 20), 0.3*SIZE+0 * COS(SINE / 20)) * ANGLES(RAD(-10+7 * COS(SINE / 21)), RAD(-35+7 * COS(SINE / 21)), RAD(15+10 * COS(SINE / 21))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE+0 * COS(SINE / 20), -0.6*SIZE+0.15 * COS(SINE / 20), 0*SIZE+0 * COS(SINE / 20)) * ANGLES(RAD(-25+7 * COS(SINE / 21)), RAD(25+-7 * COS(SINE / 21)), RAD(45+-10 * COS(SINE / 21))), 1 / Animation_Speed)

			elseif mode == 102 then
				NAMEMODE.Text = "Thinking"
				NAMEMODE.Font = "Arcade"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(150, 150, 150)
				NAMEMODE.TextColor3 = Color3.fromRGB(255, 255, 255)
				CHAT.Text = "Energy equals mass times the speed of light squared."
				CHAT.Font = "Arcade"
				CHAT.TextStrokeColor3 = Color3.fromRGB(150, 150, 150)
				CHAT.TextColor3 = Color3.fromRGB(255, 255, 255)
				sick.Pitch = 1.1
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(-0.1+6*math.cos(SINE/25))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1*SIZE-0 * COS(SINE / 20), 0*SIZE+0.15 * COS(SINE / 20), -0.5*SIZE+0 * COS(SINE / 20)) * ANGLES(RAD(170+7 * COS(SINE / 21)), RAD(18+6 * COS(SINE / 21)), RAD(-25+3.5 * COS(SINE / 21))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.6*SIZE-0 * COS(SINE / 20), 0.15*SIZE+0.1 * COS(SINE / 20), 0*SIZE+0 * COS(SINE / 20)) * ANGLES(RAD(0+0 * COS(SINE / 21)), RAD(15+6 * COS(SINE / 21)), RAD(-9+-5 * COS(SINE / 21))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0 - 0.04 * SIN(SINE / 24)*SIZE, 0 + 0.04 * SIN(SINE / 12)*SIZE, 0 + 0.05*SIZE * COS(SINE / 12)) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(0 - 2.5 * SIN(SINE / 24)), RAD(0)), 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE, -1*SIZE + 0.06 * SIN(SINE / 24) - 0.05*SIZE * COS(SINE / 12), -0.01*SIZE) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(75), RAD(0)) * ANGLES(RAD(-14 - 2.5 * SIN(SINE / 24)), RAD(0), RAD(0)), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE, -1*SIZE - 0.06 * SIN(SINE / 24) - 0.05*SIZE * COS(SINE / 12), -0.01*SIZE) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(-75), RAD(0)) * ANGLES(RAD(-14 + 2.5 * SIN(SINE / 24)), RAD(0), RAD(0)), 1 / Animation_Speed)

			elseif mode == 103 then
				NAMEMODE.Text = "ABNORMAL"
				NAMEMODE.Font = Enum.Font:GetEnumItems()[math.random(1, #Enum.Font:GetEnumItems())]
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(150, 150, 150)
				NAMEMODE.TextColor3 = Color3.fromRGB(255, 255, 255)

				CHAT.Text = "SOMETHINGS NOT RIGHT"
				CHAT.Font = Enum.Font:GetEnumItems()[math.random(1, #Enum.Font:GetEnumItems())]
				CHAT.TextStrokeColor3 = Color3.fromRGB(150, 150, 150)
				CHAT.TextColor3 = Color3.fromRGB(255, 255, 255)
				sick.Pitch = 1

				if MRANDOM(1,3) == 1 then
					Neck.C0 = Clerp(Neck.C0,NECKC0 * ANGLES(RAD(20+MRANDOM(-20,20)),RAD((10*COS(SINE/100))+MRANDOM(-20,20)),RAD(MRANDOM(-20,20))),1)
				end
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(-0.1+6*math.cos(SINE/25))), 1 / Animation_Speed)


				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 20), 0*SIZE+0 * COS(SINE / 20), 3*SIZE+0.5 * COS(SINE / 20)) * ANGLES(RAD(18+12 * COS(SINE / 21)), RAD(5+0 * COS(SINE / 21)), RAD(0+0 * COS(SINE / 21))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(2.75*SIZE-0 * COS(SINE / 20), -1.5*SIZE+0.15 * COS(SINE / 20), -0.3*SIZE+0 * COS(SINE / 20)) * ANGLES(RAD(45+-10 * COS(SINE / 21)), RAD(25+-10 * COS(SINE / 21)), RAD(0+0 * COS(SINE / 21))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-2.5*SIZE-0 * COS(SINE / 20), -0.5*SIZE+0.15 * COS(SINE / 20), -1*SIZE+0 * COS(SINE / 20)) * ANGLES(RAD(150+-10 * COS(SINE / 21)), RAD(0+5 * COS(SINE / 21)), RAD(0+0 * COS(SINE / 21))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE+0 * COS(SINE / 20), 0.2*SIZE+0.15 * COS(SINE / 20), 0.8*SIZE+0 * COS(SINE / 20)) * ANGLES(RAD(25+0 * COS(SINE / 21)), RAD(-25+5 * COS(SINE / 21)), RAD(45+0 * COS(SINE / 21))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE+0 * COS(SINE / 20), 0*SIZE+0.15 * COS(SINE / 20), 0.5*SIZE+0 * COS(SINE / 20)) * ANGLES(RAD(70+0 * COS(SINE / 20)), RAD(25+5 * COS(SINE / 20)), RAD(-45+0 * COS(SINE / 20))), 1 / Animation_Speed)

			elseif mode == 104 then

				NAMEMODE.Text = "Chill"
				NAMEMODE.Font = "Arcade"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(217+(sick.PlaybackLoudness * .3), 67+(sick.PlaybackLoudness * .3), 192+(sick.PlaybackLoudness * .3))
				NAMEMODE.TextColor3 = Color3.fromRGB(255, 120, 232)
				CHAT.Text = " "
				CHAT.Font = "Highway"
				CHAT.TextStrokeColor3 = Color3.fromRGB(217+(sick.PlaybackLoudness * .3), 67+(sick.PlaybackLoudness * .3), 192+(sick.PlaybackLoudness * .3))
				CHAT.TextColor3 = Color3.fromRGB(255, 120, 232)
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(200+5*math.cos(SINE/28)),math.rad(-0.1+6*math.cos(SINE/25))), 1 / Animation_Speed)


				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 20), 0*SIZE+0 * COS(SINE / 20), -1.5*SIZE+0.1 * COS(SINE / 20)) * ANGLES(RAD(-25+3 * COS(SINE / 21)), RAD(8+0 * COS(SINE / 21)), RAD(0+0 * COS(SINE / 21))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.6*SIZE-0 * COS(SINE / 20), -0.3*SIZE+0.15 * COS(SINE / 20), -0.5*SIZE+0 * COS(SINE / 20)) * ANGLES(RAD(120+10 * COS(SINE / 21)), RAD(0+0 * COS(SINE / 21)), RAD(-45+-3 * COS(SINE / 21))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.6*SIZE-0 * COS(SINE / 20), 0.3*SIZE+-0.1 * COS(SINE / 20), 0.5*SIZE+0 * COS(SINE / 20)) * ANGLES(RAD(-25+5 * COS(SINE / 21)), RAD(25+-6 * COS(SINE / 21)), RAD(-25+0 * COS(SINE / 21))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.3*SIZE+0 * COS(SINE / 20), -1.5*SIZE+-0.1 * COS(SINE / 20), 0*SIZE+0 * COS(SINE / 20)) * ANGLES(RAD(56+3 * COS(SINE / 21)), RAD(-20+0 * COS(SINE / 21)), RAD(10+0 * COS(SINE / 21))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.3*SIZE+0 * COS(SINE / 20), 0*SIZE+-0.1 * COS(SINE / 20), 0*SIZE+0 * COS(SINE / 20)) * ANGLES(RAD(0+3 * COS(SINE / 21)), RAD(15+0 * COS(SINE / 21)), RAD(-15+0 * COS(SINE / 21))), 1 / Animation_Speed)
			elseif mode == 105 then

				NAMEMODE.Text = "t-pose"
				NAMEMODE.Font = "Arcade"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
				NAMEMODE.TextColor3 = Color3.fromRGB(255, 255, 255)
				CHAT.Text = " "
				CHAT.Font = "Cartoon"
				CHAT.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
				CHAT.TextColor3 = Color3.fromRGB(255, 255, 255)
				gunweld.C0 = Clerp(gunweld.C0, CF(0*SIZE+0 * COS(SINE / 15), -0*SIZE-0 * COS(SINE /15), -10*SIZE+0 * COS(SINE / 15)) * ANGLES(RAD(-0+0 * COS(SINE / 505)), RAD(-0+0* COS(SINE / 55)), RAD(0-0 * COS(SINE / 15))), 1 / Animation_Speed)
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(-0.1+6*math.cos(SINE/25))), 1 / Animation_Speed)


				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1), 0.5*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(0+MRANDOM(-40,40) * COS(SINE / 1)), RAD(0+MRANDOM(-40,40) * COS(SINE / 1)), RAD(0+MRANDOM(-40,40) * COS(SINE / 1))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5*SIZE-0 * COS(SINE / 1), 0.6*SIZE+0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(0+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1)), RAD(90+0 * COS(SINE / 1))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5*SIZE-0 * COS(SINE / 1), 0.6*SIZE+0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(0+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1)), RAD(-90+0 * COS(SINE / 1))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.5*SIZE+0 * COS(SINE / 1), -1*SIZE+0 * COS(SINE / 1), 0.5*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(0+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 1), -1*SIZE+0 * COS(SINE / 1), 0.5*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(0+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1))), 1 / Animation_Speed)

			elseif mode == 106 then

				NAMEMODE.Text = "Anomalous"
				NAMEMODE.Font = "Arcade"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(math.random(1, 255), math.random(1, 255), math.random(1, 255))
				NAMEMODE.TextColor3 = Color3.fromRGB(math.random(1, 255), math.random(1, 255), math.random(1, 255))
				CHAT.Text = " "
				CHAT.Font = "Cartoon"
				CHAT.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
				CHAT.TextColor3 = Color3.fromRGB(255, 255, 255)
				gunweld.C0 = Clerp(gunweld.C0, CF(0*SIZE+0 * COS(SINE / 15), -0*SIZE-0 * COS(SINE /15), -15*SIZE+0 * COS(SINE / 15)) * ANGLES(RAD(-0+0 * COS(SINE / 505)), RAD(-0+0* COS(SINE / 55)), RAD(0-0 * COS(SINE / 15))), 1 / Animation_Speed)
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(-0.1+6*math.cos(SINE/25))), 1 / Animation_Speed)

				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 20), 0*SIZE+0 * COS(SINE / 20), 1.5*SIZE+0.2 * COS(SINE / 20)) * ANGLES(RAD(15+3 * COS(SINE / 21)), RAD(15+0 * COS(SINE / 21)), RAD(0+0 * COS(SINE / 21))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(0.7*SIZE-0 * COS(SINE / 20), -1.7*SIZE+-0.2 * COS(SINE / 20), 0.3*SIZE+0 * COS(SINE / 20)) * ANGLES(RAD(-10+5 * COS(SINE / 21)), RAD(-25+-5 * COS(SINE / 21)), RAD(0+0 * COS(SINE / 21))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1*SIZE-0 * COS(SINE / 20), -1*SIZE+-0.2 * COS(SINE / 20), -0.5*SIZE+0 * COS(SINE / 20)) * ANGLES(RAD(25+5 * COS(SINE / 21)), RAD(25+6 * COS(SINE / 21)), RAD(-35+0 * COS(SINE / 21))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.5*SIZE+0 * COS(SINE / 20), -3*SIZE+-0.2 * COS(SINE / 20), 1*SIZE+0 * COS(SINE / 20)) * ANGLES(RAD(-25+0 * COS(SINE / 21)), RAD(-25+-5 * COS(SINE / 21)), RAD(0+0 * COS(SINE / 21))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-1.5*SIZE+0 * COS(SINE / 20), -2*SIZE+-0.2 * COS(SINE / 20), -0.5*SIZE+0 * COS(SINE / 20)) * ANGLES(RAD(0+5 * COS(SINE / 21)), RAD(25+5 * COS(SINE / 21)), RAD(-10+0 * COS(SINE / 21))), 1 / Animation_Speed)

			elseif mode == 107 then

				NAMEMODE.Text = "admin"
				NAMEMODE.Font = "Code"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(17, 15, 48)
				NAMEMODE.TextColor3 = Color3.fromRGB(34, 29, 97)
				CHAT.Text = "no memes in general."
				CHAT.Font = "Code"
				CHAT.TextStrokeColor3 = Color3.fromRGB(17, 15, 48)
				CHAT.TextColor3 = Color3.fromRGB(34, 29, 97)
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(-0.1+6*math.cos(SINE/25))), 1 / Animation_Speed)

				gunweld.C0 = Clerp(gunweld.C0, CF(0*SIZE+0 * COS(SINE / 15), -.7*SIZE-0 * COS(SINE /15), 0*SIZE+0 * COS(SINE / 15)) * ANGLES(RAD(90+0 * COS(SINE / 505)), RAD(75+0* COS(SINE / 55)), RAD(0-0 * COS(SINE / 15))), 1 / Animation_Speed)
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0 - 0.04 * SIN(SINE / 24)*SIZE, 0 + 0.04 * SIN(SINE / 12)*SIZE, 0 + 0.05*SIZE * COS(SINE / 12)) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(0 - 2.5 * SIN(SINE / 24)), RAD(0)), 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.6*SIZE-0 * COS(SINE / 32.5), 0*SIZE+0.2 * COS(SINE / 32.5), 0*SIZE+0 * COS(SINE / 32.5)) * ANGLES(RAD(180+0 * COS(SINE / 31.5)), RAD(15+0 * COS(SINE / 31.5)), RAD(25+0 * COS(SINE / 31.5))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.6*SIZE-0 * COS(SINE / 13.5), 0*SIZE+0.2 * COS(SINE / 32.5), 0.3*SIZE+0 * COS(SINE / 13.5)) * ANGLES(RAD(10+5 * COS(SINE / 12)), RAD(10+5 * COS(SINE / 12)), RAD(-20+0 * COS(SINE / 12))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE, -1*SIZE + 0.06 * SIN(SINE / 24) - 0.05*SIZE * COS(SINE / 12), -0.01*SIZE) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(75), RAD(0)) * ANGLES(RAD(-5 - 2.5 * SIN(SINE / 24)), RAD(0), RAD(0)), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE, -1*SIZE - 0.06 * SIN(SINE / 24) - 0.05*SIZE * COS(SINE / 12), -0.01*SIZE) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(-75), RAD(0)) * ANGLES(RAD(-5 + 2.5 * SIN(SINE / 24)), RAD(0), RAD(0)), 1 / Animation_Speed)
			elseif mode == 108 then

				NAMEMODE.Text = "Inferno"
				NAMEMODE.Font = "Garamond"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(145, 44, 0)
				NAMEMODE.TextColor3 = Color3.fromRGB(222, 67, 0)
				CHAT.Text = "BURN, BURN, BURN!"
				CHAT.Font = "Garamond"
				CHAT.TextStrokeColor3 = Color3.fromRGB(145, 44, 0)
				CHAT.TextColor3 = Color3.fromRGB(222, 67, 0)

				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(-0.1+6*math.cos(SINE/25))), 1 / Animation_Speed)


				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1*SIZE-0 * COS(SINE / 25), 1*SIZE+-0.1 * COS(SINE / 25), 0.4*SIZE+0 * COS(SINE / 25)) * ANGLES(RAD(180+-6 * COS(SINE / 27)), RAD(-35+6 * COS(SINE / 27)), RAD(-60+6 * COS(SINE / 27))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.6*SIZE-0 * COS(SINE / 32), 0.3*SIZE+-0.1 * COS(SINE / 32), 0*SIZE+0 * COS(SINE / 32)) * ANGLES(RAD(-20+5 * COS(SINE / 32)), RAD(5+0 * COS(SINE / 32)), RAD(-25+8 * COS(SINE / 32))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0 - 0.04 * SIN(SINE / 24)*SIZE, -0 + 0.04 * SIN(SINE / 12)*SIZE, -1 + 0.05*SIZE * COS(SINE / 12)) * ANGLES(RAD(-18 - 2.5 * SIN(SINE / 12)), RAD(20 - 2.5 * SIN(SINE / 24)), RAD(0)), 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(1.3*SIZE, -.7*SIZE + 0.06 * SIN(SINE / 24) - 0.05*SIZE * COS(SINE / 12), -.86*SIZE) * ANGLES(RAD(-20 - 2.5 * SIN(SINE / 12)), RAD(75), RAD(0)) * ANGLES(RAD(-0 - 2.5 * SIN(SINE / 24)), RAD(0), RAD(0)), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE, -1*SIZE - 0.06 * SIN(SINE / 24) - 0.05*SIZE * COS(SINE / 12), -0.01*SIZE) * ANGLES(RAD(-90 - 2.5 * SIN(SINE / 12)), RAD(-75), RAD(0)) * ANGLES(RAD(-14 + 2.5 * SIN(SINE / 24)), RAD(0), RAD(0)), 1 / Animation_Speed)
			elseif mode == 109 then
				NAMEMODE.Text = "HYPER"
				NAMEMODE.Font = "Fondamento"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(0.1+(sick.PlaybackLoudness * 0.0025),100,100)
				NAMEMODE.TextColor3 = Color3.new(0.1+(sick.PlaybackLoudness * 0.005),200,200)
				CHAT.Text = "All knowing!"
				CHAT.Font = "Fondamento"
				CHAT.TextStrokeColor3 = Color3.fromRGB(0.1+(sick.PlaybackLoudness * 0.0025),100,100)
				CHAT.TextColor3 = Color3.new(0.1+(sick.PlaybackLoudness * 0.005),200,200)

				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(-0.1+6*math.cos(SINE/25))), 1 / Animation_Speed)


				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 20), 0*SIZE+0 * COS(SINE / 20), 1*SIZE+0.3 * COS(SINE / 20)) * ANGLES(RAD(-15+3 * COS(SINE / 21)), RAD(25+-4 * COS(SINE / 21)), RAD(-8+-5 * COS(SINE / 21))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.6*SIZE-0 * COS(SINE / 20), 0.3*SIZE+0.15 * COS(SINE / 20), 0.3*SIZE+0 * COS(SINE / 20)) * ANGLES(RAD(-25+7 * COS(SINE / 21)), RAD(-35+9 * COS(SINE / 21)), RAD(25+9 * COS(SINE / 21))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.6*SIZE-0 * COS(SINE / 20), 0.3*SIZE+0.15 * COS(SINE / 20), 0.3*SIZE+0 * COS(SINE / 20)) * ANGLES(RAD(-25+7 * COS(SINE / 21)), RAD(35+-9 * COS(SINE / 21)), RAD(-40+-9 * COS(SINE / 21))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.5*SIZE+0 * COS(SINE / 20), -1.2*SIZE+0.15 * COS(SINE / 20), 0.3*SIZE+0 * COS(SINE / 20)) * ANGLES(RAD(-20+-9 * COS(SINE / 21)), RAD(-20+8 * COS(SINE / 21)), RAD(10+6 * COS(SINE / 21))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 20), -0.5*SIZE+0.15 * COS(SINE / 20), 0*SIZE+0 * COS(SINE / 20)) * ANGLES(RAD(0+-9 * COS(SINE / 21)), RAD(15+-8 * COS(SINE / 21)), RAD(-20+-7 * COS(SINE / 21))), 1 / Animation_Speed)
			elseif mode == 110 then

				NAMEMODE.Text = "CHARA"
				NAMEMODE.Font = "Arcade"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(0+(sick.PlaybackLoudness * 1.2), 0, 0)
				NAMEMODE.TextColor3 = Color3.fromRGB(0+(sick.PlaybackLoudness * .2), 0, 0)

				CHAT.Text = "Karma coursing through your veins."
				CHAT.Font = "Arcade"
				CHAT.TextStrokeColor3 = Color3.fromRGB(0+(sick.PlaybackLoudness * 1.2), 0, 0)
				CHAT.TextColor3 = Color3.fromRGB(0+(sick.PlaybackLoudness * .2), 0, 0)
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(-0.1+6*math.cos(SINE/25))), 1 / Animation_Speed)
				if MRANDOM(1,15) == 1 then
					Neck.C0 = Clerp(Neck.C0,NECKC0 * ANGLES(RAD(20+MRANDOM(-20,20)),RAD((10*COS(SINE/100))+MRANDOM(-20,20)),RAD(MRANDOM(-20,20))),1)
				end
				gunweld.C0 = Clerp(gunweld.C0, CF(-0.8*SIZE+0 * COS(SINE / 15), -0.5*SIZE-0 * COS(SINE /15), 0*SIZE+0 * COS(SINE / 15)) * ANGLES(RAD(0+0 * COS(SINE / 505)), RAD(0+0* COS(SINE / 55)), RAD(90-0* COS(SINE / 15))), 1 / Animation_Speed)
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 16.5), 0*SIZE+0 * COS(SINE / 16.5), 0*SIZE+0.15 * COS(SINE / 16.5)) * ANGLES(RAD(0+3 * COS(SINE / 16)), RAD(0+0 * COS(SINE / 16)), RAD(0+0 * COS(SINE / 16))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.6*SIZE-0 * COS(SINE / 1), 0.5*SIZE+0.15 * COS(SINE / 16), -0*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(0+MRANDOM(-25,25) * COS(SINE / 1)), RAD(-15+MRANDOM(-25,25) * COS(SINE / 1)), RAD(15+MRANDOM(-25,25) * COS(SINE / 1))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.6*SIZE-0 * COS(SINE / 1), 0.5*SIZE+0.15 * COS(SINE / 16), -0*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(0+MRANDOM(-25,25) * COS(SINE / 1)), RAD(15+MRANDOM(-25,25) * COS(SINE / 1)), RAD(-15+MRANDOM(-25,25) * COS(SINE / 1))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.35*SIZE+0 * COS(SINE / 16.5), -1.08*SIZE+-0.12 * COS(SINE / 16.5), 0.45*SIZE+0 * COS(SINE / 16.5)) * ANGLES(RAD(0+6 * COS(SINE / 16)), RAD(-15+2 * COS(SINE / 16)), RAD(8+0 * COS(SINE / 16))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.35*SIZE+0 * COS(SINE / 16.5), -1.08*SIZE+-0.12 * COS(SINE / 16.5), 0.45*SIZE+0 * COS(SINE / 16.5)) * ANGLES(RAD(0+6 * COS(SINE / 16)), RAD(15+-2 * COS(SINE / 16)), RAD(-8+0 * COS(SINE / 16))), 1 / Animation_Speed)
			elseif mode == 111 then
				NAMEMODE.Text = "torso"
				NAMEMODE.Font = "Arcade"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
				NAMEMODE.TextColor3 = Color3.fromRGB(255, 255, 255)
				CHAT.Text = "bruh my limbs"
				CHAT.Font = "Arcade"
				CHAT.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
				CHAT.TextColor3 = Color3.fromRGB(255, 255, 255)
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), -10.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(-30.1+6*math.cos(SINE/25))), 1 / Animation_Speed)
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 15), 0*SIZE+0 * COS(SINE / 15), 1.5*SIZE+0.5 * COS(SINE / 15)) * ANGLES(RAD(0+0 * COS(SINE / 16)), RAD(-10+5 * COS(SINE / 16)), RAD(0+0 * COS(SINE / 16))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(-1.3*SIZE-0 * COS(SINE / 15), -10*SIZE+0.15 * COS(SINE / 15), 0.5*SIZE+0 * COS(SINE / 15)) * ANGLES(RAD(56+5 * COS(SINE / 16)), RAD(10+0 * COS(SINE / 16)), RAD(-25+10 * COS(SINE / 16))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(1.2*SIZE-0 * COS(SINE / 15), -10*SIZE+0.15 * COS(SINE / 15), -1*SIZE+0 * COS(SINE / 15)) * ANGLES(RAD(190+0 * COS(SINE / 16)), RAD(25+0 * COS(SINE / 16)), RAD(-10+-8 * COS(SINE / 16))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.5*SIZE+0 * COS(SINE / 15), -10.7*SIZE+0.15 * COS(SINE / 15), 0*SIZE+0 * COS(SINE / 15)) * ANGLES(RAD(-10+10 * COS(SINE / 16)), RAD(-15+0 * COS(SINE / 16)), RAD(10+10 * COS(SINE / 16))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 1), -10.2*SIZE+0 * COS(SINE / 1), 0.3*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(-25+10 * COS(SINE / 16)), RAD(10+0 * COS(SINE / 16)), RAD(-25+3 * COS(SINE / 16))), 1 / Animation_Speed)
			elseif mode == 112 then
				NAMEMODE.Text = "MYSTIC"
				NAMEMODE.Font = "Bodoni"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(255, 97, 252)
				NAMEMODE.TextColor3 = Color3.fromRGB(255, 138, 253)
				CHAT.Text = "Calling all magic!"
				CHAT.Font = "Bodoni"
				CHAT.TextStrokeColor3 = Color3.fromRGB(255, 97, 252)
				CHAT.TextColor3 = Color3.fromRGB(255, 138, 253)
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(-0.1+6*math.cos(SINE/25))), 1 / Animation_Speed)

				gunweld.C0 = Clerp(gunweld.C0, CF(0*SIZE+0 * COS(SINE / 15), 4*SIZE-.3 * COS(SINE /15), -2*SIZE+0 * COS(SINE / 15)) * ANGLES(RAD(-20+0 * COS(SINE / 505)), RAD(-30+0* COS(SINE / 33)), RAD(-60-1*COS(SINE / 30))), 1 / Animation_Speed)

				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 20), 0*SIZE+0 * COS(SINE / 20), 4*SIZE+0.8 * COS(SINE / 20)) * ANGLES(RAD(15+7 * COS(SINE / 21)), RAD(8+3 * COS(SINE / 21)), RAD(0+0 * COS(SINE / 21))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1*SIZE-0 * COS(SINE / 20), 0*SIZE+0.15 * COS(SINE / 20), 1*SIZE+0 * COS(SINE / 20)) * ANGLES(RAD(25+8 * COS(SINE / 21)), RAD(-15+-6 * COS(SINE / 21)), RAD(-35+8 * COS(SINE / 21))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1*SIZE-0 * COS(SINE / 20), 0*SIZE+0.15 * COS(SINE / 20), 1*SIZE+0 * COS(SINE / 20)) * ANGLES(RAD(25+8 * COS(SINE / 21)), RAD(15+6 * COS(SINE / 21)), RAD(32+-8 * COS(SINE / 21))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.5*SIZE+0 * COS(SINE / 20), -1*SIZE+0.15 * COS(SINE / 20), 0.3*SIZE+0 * COS(SINE / 20)) * ANGLES(RAD(-25+-12 * COS(SINE / 21)), RAD(-20+0 * COS(SINE / 21)), RAD(15+-13 * COS(SINE / 21))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 20), 0*SIZE+0.15 * COS(SINE / 20), 0*SIZE+0 * COS(SINE / 20)) * ANGLES(RAD(15+-12 * COS(SINE / 21)), RAD(20+0 * COS(SINE / 21)), RAD(-15+13 * COS(SINE / 21))), 1 / Animation_Speed)

			elseif mode == 113 then

				NAMEMODE.Text = "Fracture"
				NAMEMODE.Font = "SpecialElite"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(68, 58, 79)
				NAMEMODE.TextColor3 = Color3.fromRGB(16, 6, 31)

				CHAT.Text = "Broken."
				CHAT.Font = "SpecialElite"
				CHAT.TextStrokeColor3 = Color3.fromRGB(68, 58, 79)
				CHAT.TextColor3 = Color3.fromRGB(16, 6, 31)

				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(-0.1+6*math.cos(SINE/25))), 1 / Animation_Speed)

				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- -0.3 * COS(SINE / 20), 0*SIZE+0.3 * COS(SINE / 20), 3*SIZE+0.5 * COS(SINE / 10)) * ANGLES(RAD(-45+6 * COS(SINE / 21)), RAD(5+-6 * COS(SINE / 21)), RAD(3+3 * COS(SINE / 21))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1*SIZE-0 * COS(SINE / 20), 0*SIZE+0.15 * COS(SINE / 20), -1*SIZE+0 * COS(SINE / 20)) * ANGLES(RAD(35+9 * COS(SINE / 21)), RAD(-10+7 * COS(SINE / 21)), RAD(-100+0 * COS(SINE / 21))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1*SIZE-0 * COS(SINE / 20), 0*SIZE+0.15 * COS(SINE / 20), 1*SIZE+0 * COS(SINE / 20)) * ANGLES(RAD(25+3 * COS(SINE / 21)), RAD(170+0 * COS(SINE / 21)), RAD(-90+6 * COS(SINE / 21))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.35*SIZE+0 * COS(SINE / 20), -1*SIZE+0.15 * COS(SINE / 20), 0.5*SIZE+0 * COS(SINE / 20)) * ANGLES(RAD(-25+9 * COS(SINE / 21)), RAD(-20+3 * COS(SINE / 21)), RAD(8+-5 * COS(SINE / 21))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.35*SIZE+0 * COS(SINE / 20), -0.5*SIZE+0 * COS(SINE / 20), -0.5*SIZE+0 * COS(SINE / 20)) * ANGLES(RAD(-15+9 * COS(SINE / 21)), RAD(15+-3 * COS(SINE / 21)), RAD(-14+8 * COS(SINE / 21))), 1 / Animation_Speed)

			elseif mode == 114 then

				NAMEMODE.Text = "INTRINSIC"
				NAMEMODE.Font = "Sarpanch"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(0+(sick.PlaybackLoudness * 0.0), 0+(sick.PlaybackLoudness * 00), 0+(sick.PlaybackLoudness * 0.1))
				NAMEMODE.TextColor3 = Color3.fromRGB(0+(sick.PlaybackLoudness * 0.0), 0+(sick.PlaybackLoudness * 00), 0+(sick.PlaybackLoudness * 0.5))

				CHAT.Text = "Subpar to your existance."
				CHAT.Font = "Sarpanch"
				CHAT.TextStrokeColor3 = Color3.fromRGB(0+(sick.PlaybackLoudness * 0.0), 0+(sick.PlaybackLoudness * 0), 0+(sick.PlaybackLoudness * 0.1))
				CHAT.TextColor3 = Color3.fromRGB(0+(sick.PlaybackLoudness * 0.0), 0+(sick.PlaybackLoudness * 00), 0+(sick.PlaybackLoudness * 0.5))

				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(-0.1+6*math.cos(SINE/25))), 1 / Animation_Speed)

				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- -0.5 * COS(SINE / 16), 0*SIZE+0.3 * COS(SINE / 16), 4*SIZE+0.7 * COS(SINE / 16)) * ANGLES(RAD(0+0 * COS(SINE / 17)), RAD(0+-7 * COS(SINE / 17)), RAD(0+0 * COS(SINE / 17))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.4*SIZE-0 * COS(SINE / 16), 0.3*SIZE+0.15 * COS(SINE / 16), 0.5*SIZE+0 * COS(SINE / 16)) * ANGLES(RAD(-15+3 * COS(SINE / 17)), RAD(25+-9 * COS(SINE / 17)), RAD(-32+0 * COS(SINE / 17))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.6*SIZE-0 * COS(SINE / 16), 1*SIZE+0.15 * COS(SINE / 16), -0.3*SIZE+0 * COS(SINE / 16)) * ANGLES(RAD(160+8 * COS(SINE / 17)), RAD(-6+0 * COS(SINE / 17)), RAD(35+0 * COS(SINE / 17))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.5*SIZE+0 * COS(SINE / 16), -1.2*SIZE+0.15 * COS(SINE / 16), 0.3*SIZE+0 * COS(SINE / 16)) * ANGLES(RAD(-23+-8 * COS(SINE / 17)), RAD(-20+4 * COS(SINE / 17)), RAD(15+9 * COS(SINE / 17))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 16), -0.3*SIZE+0.15 * COS(SINE / 16), 0*SIZE+0 * COS(SINE / 16)) * ANGLES(RAD(15+-8 * COS(SINE / 17)), RAD(15+-4 * COS(SINE / 17)), RAD(-15+-9 * COS(SINE / 17))), 1 / Animation_Speed)
			elseif mode == 115 then
				NAMEMODE.Text = "fan"
				NAMEMODE.Font = "Arcade"
				NAMEMODE.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
				NAMEMODE.TextColor3 = Color3.fromRGB(255, 255, 255)
				CHAT.Text = " "
				CHAT.Font = "Sarpanch"
				CHAT.TextStrokeColor3 = Color3.fromRGB(0+(sick.PlaybackLoudness * 0.0), 0+(sick.PlaybackLoudness * 0), 0+(sick.PlaybackLoudness * 0.1))
				CHAT.TextColor3 = Color3.fromRGB(0+(sick.PlaybackLoudness * 0.0), 0+(sick.PlaybackLoudness * 00), 0+(sick.PlaybackLoudness * 0.5))
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), .0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(180.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(-0.1+6*math.cos(SINE/25))), 1 / Animation_Speed)
				gunweld.C0 = Clerp(gunweld.C0, CF(10*SIZE+0 * COS(SINE / 15), -0*SIZE-0 * COS(SINE /15), -0*SIZE+0 * COS(SINE / 15)) * ANGLES(RAD(-0+0 * COS(SINE / 505)), RAD(-0+0* COS(SINE / 55)), RAD(0-0 * COS(SINE / 15))), 1 / Animation_Speed)
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0.3 * COS(SINE / 16), 0*SIZE+0.3 * COS(SINE / 16), 3*SIZE+0.35 * COS(SINE / 16)) * ANGLES(RAD(-90+10 * COS(SINE / 17)), RAD(0+-369 * COS(SINE / 20)), RAD(0+9 * COS(SINE / 17))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5*SIZE-0 * COS(SINE / 1), 0.15*SIZE+0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(0+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1)), RAD(90+0 * COS(SINE / 1))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5*SIZE-0 * COS(SINE / 1), 0.15*SIZE+0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(0+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1)), RAD(-90+0 * COS(SINE / 1))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(0*SIZE+0 * COS(SINE / 1), -1*SIZE+0 * COS(SINE / 1), 0.5*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(0+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(0*SIZE+0 * COS(SINE / 1), 1*SIZE+0 * COS(SINE / 1), 0.5*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(0+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1)), RAD(180+0 * COS(SINE / 1))), 1 / Animation_Speed)
			end
		end
	elseif TORSOVELOCITY > 1 and HITFLOOR ~= nil then
		ANIM = "Walk"
		if ATTACK == false then
			if mode == 1 or mode == 110 or mode == 108 or mode == 104 or mode == 24 or mode == 102 or mode == 100 or mode == 99 or mode == 86 or mode == 93 or mode == 94 or mode == 80 or mode == 88 or mode == 44 or mode == 77 or mode == 79 or mode == 73 or mode == 75 or mode == 50 or mode == 72 or mode == 71 or mode == 66 or mode == 61 or mode == 59 or mode == 65 or mode == 56 or mode == 57 or mode == 55 or mode == 41 or mode == 53 or mode == 51 or mode == 48 or mode == 35 or mode == 33 or mode == 32 or mode == 26 or mode == 13 or mode == 23 or mode == 21 or mode == 18 or mode == 5 or mode == 4 or mode == 11 or mode == 14  or mode == 97 then
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(-0.1+6*math.cos(SINE/25))), 1 / Animation_Speed)
				gunweld.C0 = Clerp(gunweld.C0, CF(0*SIZE+0 * COS(SINE / 15), 0*SIZE-0 * COS(SINE /15), 0*SIZE+0 * COS(SINE / 15)) * ANGLES(RAD(-0+0 * COS(SINE / 505)), RAD(-0+0* COS(SINE / 55)), RAD(0-0 * COS(SINE / 15))), 1 / Animation_Speed)
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0 + change / 2 * math.cos(SINE /2)) * ANGLES(math.rad((change * 50) - movement / 20 * math.cos(SINE /2)) * lookvel, torsorotY2 + math.rad(0 - 4 * math.sin(SINE /4)), math.rad(-(change * 20) - movement / 20 * math.cos(SINE /2)) * rightvel + torsorotY2 + math.rad(0 - 1 * math.cos(SINE /4))) * ANGLES(math.rad(0),-math.rad(10+10 * math.cos(SINE/WALKSPEEDVALUE))*sidevelocity,math.rad(0)), .2)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.5, -0.85 + movement / 15 * math.cos(SINE /4) / 2, (-0.25 - movement / 15 * math.cos(SINE /4)) * (-0 + 0.5 * lookvel)) * ANGLES((math.rad(-10 * lookvel + change * 5 + movement * math.cos(SINE /4)) + movement / 10 * math.sin(SINE /4)) * lookvel, math.rad(0 + movement * 1.3 * math.cos(SINE /4)), (math.rad(change * 5 + 0 * math.cos(SINE /4)) + movement / 10 * math.sin(SINE /4)) * (rightvector / (Humanoid.WalkSpeed * 2))),1)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5, -0.85 - movement / 15 * math.cos(SINE /4) / 2, (-0.25 + movement / 15 * math.cos(SINE /4)) * (-.0 + 0.5 * lookvel)) * ANGLES((math.rad(-10 * lookvel + change * 5 - movement * math.cos(SINE /4)) + -(movement / 10) * math.sin(SINE /4)) * lookvel, math.rad(0 + movement * 1.3 * math.cos(SINE /4)), (math.rad(change * 5 - 0 * math.cos(SINE /4)) + -(movement / 10) * math.sin(SINE /4)) * (rightvector / (Humanoid.WalkSpeed * 2))),1)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5 + 0.12 * lookvel ^ 2 - movement / 40 * math.cos(SINE /4) / 3, movement / 150 + movement / 40 * math.cos(SINE /4)) * CFrame.Angles((math.rad(-5 - movement * 2 * math.cos(SINE /4)) + -(movement / 10) * math.sin(SINE /4)) * lookvel, math.rad(0 - movement * 2 * math.cos(SINE /4)), -math.rad(movement * 1 * -0.8 - movement * 1 * math.cos(SINE /2) * lookvel) + math.rad(-5 * rightvel)) * RIGHTSHOULDERC0, .2)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.6*SIZE-0 * COS(SINE / 14), 0*SIZE+-0.3 * COS(SINE / 14), 0*SIZE+0 * COS(SINE / 14)) * ANGLES(RAD(130+10 * COS(SINE / 12)), RAD(-10+5 * COS(SINE / 12)), RAD(-10+5 * COS(SINE / 12))) * LEFTSHOULDERC0, .2)
			elseif mode == 2 or mode == 114 or mode == 113 or mode == 109 or mode == 85 or mode == 101 or mode == 95 or mode == 96  or mode == 92 or mode == 89 or mode == 91 or mode == 90 or mode == 87 or mode == 83 or mode == 82 or mode == 81 or mode == 70 or mode == 63 or mode == 67 or mode == 62 or mode == 54 or mode == 49 or mode == 47 or mode == 45 or mode == 43 or mode == 40  or mode == 39 or mode == 34 or mode == 31 or mode == 30 or mode == 28 or mode == 27 or mode == 25 or mode == 20 or mode == 19 or mode == 6 or mode == 17 or mode == 8 or mode == 10 or mode == 15 or mode == 98 then 
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(-0.1+6*math.cos(SINE/25))), 1 / Animation_Speed)
				gunweld.C0 = Clerp(gunweld.C0, CF(0*SIZE+0 * COS(SINE / 15), 0*SIZE-0 * COS(SINE /15), 0*SIZE+0 * COS(SINE / 15)) * ANGLES(RAD(-0+0 * COS(SINE / 505)), RAD(-0+0* COS(SINE / 55)), RAD(0-0 * COS(SINE / 15))), 1 / Animation_Speed)
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 1 * COS(SINE / 25), 0*SIZE+0 * COS(SINE / 13),2*SIZE+.6 * COS(SINE / 13)) * ANGLES(RAD(55+6 * COS(SINE / 35)), RAD(0+2 * COS(SINE / 35)), RAD(0-15 * COS(SINE / 25))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.6*SIZE-0 * COS(SINE / 11), 0.5*SIZE+0.2 * COS(SINE / 11), 0*SIZE+0 * COS(SINE / 11)) * ANGLES(RAD(-10+-20 * COS(SINE / 13)), RAD(0+0 * COS(SINE / 13)), RAD(25+-10 * COS(SINE / 13))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.6*SIZE-0 * COS(SINE / 11), 0*SIZE+-0.3 * COS(SINE / 11), 0*SIZE+0 * COS(SINE / 11)) * ANGLES(RAD(150+10 * COS(SINE / 14)), RAD(10+10 * COS(SINE / 14)), RAD(-10+10 * COS(SINE / 14))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.5*SIZE+0 * COS(SINE / 13), -0.3*SIZE+0.2 * COS(SINE / 13), -0.2*SIZE+0 * COS(SINE / 13)) * ANGLES(RAD(-25+4 * COS(SINE / 13.5)), RAD(-16+5 * COS(SINE / 13.5)), RAD(0+-5 * COS(SINE / 13.5))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 13), -1*SIZE+0.3 * COS(SINE / 13), 0.3*SIZE+0 * COS(SINE / 13)) * ANGLES(RAD(-25+4 * COS(SINE / 13.5)), RAD(25+5 * COS(SINE / 13.5)), RAD(0+5 * COS(SINE / 13.5))), 1 / Animation_Speed)
			elseif mode == 7 then 
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(-0.1+6*math.cos(SINE/25))), 1 / Animation_Speed)
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 20), 0*SIZE+0 * COS(SINE / 20), 2.5*SIZE+0.5 * COS(SINE / 20)) * ANGLES(RAD(25+5 * COS(SINE / 19)), RAD(0+0 * COS(SINE / 19)), RAD(0+0 * COS(SINE / 19))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.6*SIZE-0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(25+10 * COS(SINE / 20.5)), RAD(0+0 * COS(SINE / 20.5)), RAD(25+0 * COS(SINE / 20.5))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.6*SIZE-0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(150+10 * COS(SINE / 20)), RAD(-5+5 * COS(SINE / 20)), RAD(10+5 * COS(SINE / 20))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(1.3*SIZE+0 * COS(SINE / 1), -1*SIZE+0 * COS(SINE / 1), -0.3*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(5+10 * COS(SINE / 19.5)), RAD(0+10 * COS(SINE / 19.5)), RAD(-80+0 * COS(SINE / 19.5))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-1.3*SIZE+0 * COS(SINE / 10), -1*SIZE+0 * COS(SINE / 10), -0.4*SIZE+0 * COS(SINE / 10)) * ANGLES(RAD(5+10 * COS(SINE / 19.5)), RAD(0+-10 * COS(SINE / 19.5)), RAD(80+0 * COS(SINE / 19.5))), 1 / Animation_Speed)
			elseif mode == 9 then 
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(-0.1+6*math.cos(SINE/25))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(0.6*SIZE-0 * COS(SINE / 1), -0.5*SIZE+0 * COS(SINE / 1), 0.9*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(180+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-0.6*SIZE-0 * COS(SINE / 1), -0.5*SIZE+0 * COS(SINE / 1), 0.9*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(180+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0 + change / 2 * math.cos(SINE /2)) * ANGLES(math.rad((change * 50) - movement / 20 * math.cos(SINE /2)) * lookvel, torsorotY2 + math.rad(0 - 4 * math.sin(SINE /4)), math.rad(-(change * 20) - movement / 20 * math.cos(SINE /2)) * rightvel + torsorotY2 + math.rad(0 - 1 * math.cos(SINE /4))) * ANGLES(math.rad(0),-math.rad(10+10 * math.cos(SINE/WALKSPEEDVALUE))*sidevelocity,math.rad(0)), .2)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.5, -0.85 + movement / 15 * math.cos(SINE /4) / 2, (-0.25 - movement / 15 * math.cos(SINE /4)) * (-0 + 0.5 * lookvel)) * ANGLES((math.rad(-10 * lookvel + change * 5 + movement * math.cos(SINE /4)) + movement / 10 * math.sin(SINE /4)) * lookvel, math.rad(0 + movement * 1.3 * math.cos(SINE /4)), (math.rad(change * 5 + 0 * math.cos(SINE /4)) + movement / 10 * math.sin(SINE /4)) * (rightvector / (Humanoid.WalkSpeed * 2))),1)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5, -0.85 - movement / 15 * math.cos(SINE /4) / 2, (-0.25 + movement / 15 * math.cos(SINE /4)) * (-.0 + 0.5 * lookvel)) * ANGLES((math.rad(-10 * lookvel + change * 5 - movement * math.cos(SINE /4)) + -(movement / 10) * math.sin(SINE /4)) * lookvel, math.rad(0 + movement * 1.3 * math.cos(SINE /4)), (math.rad(change * 5 - 0 * math.cos(SINE /4)) + -(movement / 10) * math.sin(SINE /4)) * (rightvector / (Humanoid.WalkSpeed * 2))),1)
			elseif mode == 38 then 
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(-0.1+6*math.cos(SINE/25))), 1 / Animation_Speed)
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 15), 0*SIZE+0 * COS(SINE / 15), 30*SIZE+5 * COS(SINE / 15)) * ANGLES(RAD(60+10 * COS(SINE / 13)), RAD(0+0 * COS(SINE / 13)), RAD(0+0 * COS(SINE / 13))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.6*SIZE-0 * COS(SINE / 11), 0.5*SIZE+0.2 * COS(SINE / 11), 0*SIZE+0 * COS(SINE / 11)) * ANGLES(RAD(-10+-20 * COS(SINE / 13)), RAD(0+0 * COS(SINE / 13)), RAD(25+-10 * COS(SINE / 13))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.6*SIZE-0 * COS(SINE / 11), 0*SIZE+-0.3 * COS(SINE / 11), 0*SIZE+0 * COS(SINE / 11)) * ANGLES(RAD(150+10 * COS(SINE / 14)), RAD(10+10 * COS(SINE / 14)), RAD(-10+10 * COS(SINE / 14))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.5*SIZE+0 * COS(SINE / 13.5), -1*SIZE+0.3 * COS(SINE / 13.5), 0*SIZE+0 * COS(SINE / 13.5)) * ANGLES(RAD(-10+5 * COS(SINE / 14)), RAD(-10+5 * COS(SINE / 14)), RAD(10+-5 * COS(SINE / 14))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 15), -0.5*SIZE+0.3 * COS(SINE / 15), 0*SIZE+0 * COS(SINE / 15)) * ANGLES(RAD(10+-10 * COS(SINE / 14.5)), RAD(10+2 * COS(SINE / 14.5)), RAD(-5+5 * COS(SINE / 14.5))), 1 / Animation_Speed)
			elseif mode == 12 then 
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(-0.1+6*math.cos(SINE/25))), 1 / Animation_Speed)
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 15), 0*SIZE+0 * COS(SINE / 15), 20*SIZE+3 * COS(SINE / 15)) * ANGLES(RAD(60+10 * COS(SINE / 13)), RAD(0+0 * COS(SINE / 13)), RAD(0+0 * COS(SINE / 13))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.6*SIZE-0 * COS(SINE / 11), 0.5*SIZE+0.2 * COS(SINE / 11), 0*SIZE+0 * COS(SINE / 11)) * ANGLES(RAD(-10+-20 * COS(SINE / 13)), RAD(0+0 * COS(SINE / 13)), RAD(25+-10 * COS(SINE / 13))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.6*SIZE-0 * COS(SINE / 11), 0*SIZE+-0.3 * COS(SINE / 11), 0*SIZE+0 * COS(SINE / 11)) * ANGLES(RAD(150+10 * COS(SINE / 14)), RAD(10+10 * COS(SINE / 14)), RAD(-10+10 * COS(SINE / 14))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.5*SIZE+0 * COS(SINE / 13.5), -1*SIZE+0.3 * COS(SINE / 13.5), 0*SIZE+0 * COS(SINE / 13.5)) * ANGLES(RAD(-10+5 * COS(SINE / 14)), RAD(-10+5 * COS(SINE / 14)), RAD(10+-5 * COS(SINE / 14))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 15), -0.5*SIZE+0.3 * COS(SINE / 15), 0*SIZE+0 * COS(SINE / 15)) * ANGLES(RAD(10+-10 * COS(SINE / 14.5)), RAD(10+2 * COS(SINE / 14.5)), RAD(-5+5 * COS(SINE / 14.5))), 1 / Animation_Speed)
			elseif mode == 22 then 
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(-0.1+6*math.cos(SINE/25))), 1 / Animation_Speed)
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 13), 0*SIZE+0 * COS(SINE / 13), 1.5*SIZE+0.5 * COS(SINE / 13)) * ANGLES(RAD(60+-15 * COS(SINE / 12)), RAD(0+0 * COS(SINE / 12)), RAD(0+0 * COS(SINE / 12))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(0.7*SIZE-0 * COS(SINE / 13.5), 0*SIZE+0.15 * COS(SINE / 13.5), -0.5*SIZE+0 * COS(SINE / 13.5)) * ANGLES(RAD(80+0 * COS(SINE / 14.5)), RAD(0+-2 * COS(SINE / 14.5)), RAD(-80+5 * COS(SINE / 14.5))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-0.7*SIZE-0 * COS(SINE / 13.5), 0.3*SIZE+0.15 * COS(SINE / 13.5), -0.5*SIZE+0 * COS(SINE / 13.5)) * ANGLES(RAD(190+0 * COS(SINE / 14.5)), RAD(0+2 * COS(SINE / 14.5)), RAD(80+-5 * COS(SINE / 14.5))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.5*SIZE+0 * COS(SINE / 13), -0.3*SIZE+0.2 * COS(SINE / 13), -0.2*SIZE+0 * COS(SINE / 13)) * ANGLES(RAD(-25+4 * COS(SINE / 13.5)), RAD(-16+5 * COS(SINE / 13.5)), RAD(0+-5 * COS(SINE / 13.5))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 13), -1*SIZE+0.3 * COS(SINE / 13), 0.3*SIZE+0 * COS(SINE / 13)) * ANGLES(RAD(-25+4 * COS(SINE / 13.5)), RAD(25+5 * COS(SINE / 13.5)), RAD(0+5 * COS(SINE / 13.5))), 1 / Animation_Speed)
			elseif mode == 29 or mode == 69 or mode == 37 or mode == 87 then 
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(-0.1+6*math.cos(SINE/25))), 1 / Animation_Speed)
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 13), 0*SIZE+0 * COS(SINE / 13), 1.5*SIZE+0.5 * COS(SINE / 13)) * ANGLES(RAD(60+-15 * COS(SINE / 12)), RAD(0+0 * COS(SINE / 12)), RAD(0+0 * COS(SINE / 12))), 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(1.4*SIZE-0 * COS(SINE / 17), 0.5*SIZE+0.2 * COS(SINE / 17), 0.2*SIZE+-0.3 * COS(SINE / 17)) * ANGLES(RAD(165+0 * COS(SINE / 1)), RAD(180+0 * COS(SINE / 1)), RAD(-15+0 * COS(SINE / 1))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(-1.6*SIZE-0 * COS(SINE / 17), 0.5*SIZE+0.1 * COS(SINE / 17), 0.2*SIZE+-0.3 * COS(SINE / 17)) * ANGLES(RAD(0+25 * COS(SINE / 16)), RAD(15+-0 * COS(SINE / 16)), RAD(-15+7 * COS(SINE / 16))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.5*SIZE+0 * COS(SINE / 13), -0.3*SIZE+0.2 * COS(SINE / 13), -0.2*SIZE+0 * COS(SINE / 13)) * ANGLES(RAD(-25+4 * COS(SINE / 13.5)), RAD(-16+5 * COS(SINE / 13.5)), RAD(0+-5 * COS(SINE / 13.5))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 13), -1*SIZE+0.3 * COS(SINE / 13), 0.3*SIZE+0 * COS(SINE / 13)) * ANGLES(RAD(-25+4 * COS(SINE / 13.5)), RAD(25+5 * COS(SINE / 13.5)), RAD(0+5 * COS(SINE / 13.5))), 1 / Animation_Speed)
			elseif mode == 3 then 
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(-0.1+6*math.cos(SINE/25))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1*SIZE-0 * COS(SINE / 15.5), 1*SIZE+0 * COS(SINE / 15.5), -1*SIZE+0.2 * COS(SINE / 15.5)) * ANGLES(RAD(-140+10 * COS(SINE / 0.5)), RAD(0+0 * COS(SINE / 0.5)), RAD(-25+0 * COS(SINE / 0.5))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1*SIZE-0 * COS(SINE / 15.5), 1*SIZE+0 * COS(SINE / 15.5), -1*SIZE+0.2 * COS(SINE / 15.5)) * ANGLES(RAD(-155+-15 * COS(SINE / 0.5)), RAD(0+0 * COS(SINE / 0.5)), RAD(25+0 * COS(SINE / 0.5))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0 + change / 2 * math.cos(SINE /2)) * ANGLES(math.rad((change * 50) - movement / 20 * math.cos(SINE /2)) * lookvel, torsorotY2 + math.rad(0 - 4 * math.sin(SINE /4)), math.rad(-(change * 20) - movement / 20 * math.cos(SINE /2)) * rightvel + torsorotY2 + math.rad(0 - 1 * math.cos(SINE /4))) * ANGLES(math.rad(0),-math.rad(10+10 * math.cos(SINE/WALKSPEEDVALUE))*sidevelocity,math.rad(0)), .2)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.5, -0.85 + movement / 15 * math.cos(SINE /4) / 2, (-0.25 - movement / 15 * math.cos(SINE /4)) * (-0 + 0.5 * lookvel)) * ANGLES((math.rad(-10 * lookvel + change * 5 + movement * math.cos(SINE /4)) + movement / 10 * math.sin(SINE /4)) * lookvel, math.rad(0 + movement * 1.3 * math.cos(SINE /4)), (math.rad(change * 5 + 0 * math.cos(SINE /4)) + movement / 10 * math.sin(SINE /4)) * (rightvector / (Humanoid.WalkSpeed * 2))),1)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5, -0.85 - movement / 15 * math.cos(SINE /4) / 2, (-0.25 + movement / 15 * math.cos(SINE /4)) * (-.0 + 0.5 * lookvel)) * ANGLES((math.rad(-10 * lookvel + change * 5 - movement * math.cos(SINE /4)) + -(movement / 10) * math.sin(SINE /4)) * lookvel, math.rad(0 + movement * 1.3 * math.cos(SINE /4)), (math.rad(change * 5 - 0 * math.cos(SINE /4)) + -(movement / 10) * math.sin(SINE /4)) * (rightvector / (Humanoid.WalkSpeed * 2))),1)

			elseif mode == 52 then
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(-0.1+6*math.cos(SINE/25))), 1 / Animation_Speed)
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- -3 * COS(SINE / 4), 0*SIZE+3 * COS(SINE / -10), -0.5*SIZE+0 * COS(SINE / 20)) * ANGLES(RAD(0+0 * COS(SINE / 1)), RAD(-15+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.6*SIZE-0 * COS(SINE / 14), 0.5*SIZE+0 * COS(SINE / 14), 0*SIZE+0 * COS(SINE / 14)) * ANGLES(RAD(0+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1)), RAD(90+0 * COS(SINE / 1))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.6*SIZE-0 * COS(SINE / 1), 0.5*SIZE+0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(90+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1)), RAD(-90+0 * COS(SINE / 1))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.5*SIZE+0 * COS(SINE / 1), -0.3*SIZE+0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(0+0 * COS(SINE / 1)), RAD(-15+0 * COS(SINE / 1)), RAD(20+0 * COS(SINE / 1))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 1), -1*SIZE+0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(0+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1)), RAD(-30+0 * COS(SINE / 1))), 1 / Animation_Speed)
			elseif mode == 58 then
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(-0.1+6*math.cos(SINE/25))), 1 / Animation_Speed)
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, -1.05 + change / 2 * math.cos(SINE /2), 0) * ANGLES(math.rad((change * 20) - movement / 20 * math.cos(SINE /2)) * lookvel, torsorotY2 + math.rad(0 - 4 * math.sin(SINE /4)), math.rad(-(change * 20) - movement / 20 * math.cos(SINE /2)) * rightvel + torsorotY2 + math.rad(0 - 1 * math.cos(SINE /4))) * ANGLES(math.rad(0),-math.rad(10+10 * math.cos(SINE/WALKSPEEDVALUE))*sidevelocity,math.rad(0)), 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.5, -0.85 + movement / 15 * math.cos(SINE /4) / 2, (-0.1 - movement / 15 * math.cos(SINE /4)) * (0.5 + 0.5 * lookvel)) * ANGLES((math.rad(-10 * lookvel + change * 5 + movement * math.cos(SINE /4)) + movement / 10 * math.sin(SINE /4)) * lookvel, math.rad(0 + movement * 2 * math.cos(SINE /4)), (math.rad(change * 5 + movement * math.cos(SINE /4)) + movement / 10 * math.sin(SINE /4)) * (rightvector / (Humanoid.WalkSpeed * 2))),1)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5, -0.85 - movement / 15 * math.cos(SINE /4) / 2, (-0.1 + movement / 15 * math.cos(SINE /4)) * (0.5 + 0.5 * lookvel)) * ANGLES((math.rad(-10 * lookvel + change * 5 - movement * math.cos(SINE /4)) + -(movement / 10) * math.sin(SINE /4)) * lookvel, math.rad(0 + movement * 2 * math.cos(SINE /4)), (math.rad(change * 5 - movement * math.cos(SINE /4)) + -(movement / 10) * math.sin(SINE /4)) * (rightvector / (Humanoid.WalkSpeed * 2))),1)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1*SIZE-0 * COS(SINE / 16.5), 0*SIZE+0.25 * COS(SINE / 16.5), -0.5*SIZE+0 * COS(SINE / 16.5)) * ANGLES(RAD(25+5 * COS(SINE / 15.5)), RAD(10+8 * COS(SINE / 15.5)), RAD(-25+-5 * COS(SINE / 15.5))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1*SIZE-0 * COS(SINE / 16.5), 0*SIZE+0.25 * COS(SINE / 16.5), -0.5*SIZE+0 * COS(SINE / 16.5)) * ANGLES(RAD(25+5 * COS(SINE / 15.5)), RAD(-10+-8 * COS(SINE / 15.5)), RAD(25+5 * COS(SINE / 15.5))) * LEFTSHOULDERC0, 1 / Animation_Speed)
			elseif mode == 60 then
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.2*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(70.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(0.1+6*math.cos(SINE/25))), 1 / Animation_Speed)
				if MRANDOM(1,20) == 1 then
					Neck.C0 = Clerp(Neck.C0,NECKC0 * ANGLES(RAD(20+MRANDOM(-20,20)),RAD((10*COS(SINE/100))+MRANDOM(-20,20)),RAD(MRANDOM(-20,20))),1)
				end
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 15), 0*SIZE+0 * COS(SINE / 15), 5.3*SIZE+0.7 * COS(SINE / 15)) * ANGLES(RAD(56+10 * COS(SINE / 16)), RAD(0+0 * COS(SINE / 16)), RAD(0+0 * COS(SINE / 16))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.2*SIZE-0 * COS(SINE / 16.5), 0*SIZE+0 * COS(SINE / 16.5), 1*SIZE+0 * COS(SINE / 16.5)) * ANGLES(RAD(15+10 * COS(SINE / 15.25)), RAD(-25+5 * COS(SINE / 15.25)), RAD(-35+10 * COS(SINE / 15.25))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.6*SIZE-0 * COS(SINE / 11), 0*SIZE+-0.3 * COS(SINE / 11), 0*SIZE+0 * COS(SINE / 11)) * ANGLES(RAD(150+10 * COS(SINE / 14)), RAD(10+10 * COS(SINE / 14)), RAD(-10+10 * COS(SINE / 14))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.5*SIZE+0 * COS(SINE / 15.5), -1*SIZE+0.3 * COS(SINE / 15.5), 0*SIZE+0 * COS(SINE / 15.5)) * ANGLES(RAD(0+15 * COS(SINE / 14.5)), RAD(-15+10 * COS(SINE / 14.5)), RAD(8+10 * COS(SINE / 14.5))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 15.75), -0.8*SIZE+0.3 * COS(SINE / 15.75), 0*SIZE+0 * COS(SINE / 15.75)) * ANGLES(RAD(-15+8 * COS(SINE / 14)), RAD(15+0 * COS(SINE / 14)), RAD(-8+-10 * COS(SINE / 14))), 1 / Animation_Speed)
			elseif mode == 64 then
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.2*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(70.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(0.1+6*math.cos(SINE/25))), 1 / Animation_Speed)
				if MRANDOM(1,20) == 1 then
					Neck.C0 = Clerp(Neck.C0,NECKC0 * ANGLES(RAD(20+MRANDOM(-20,20)),RAD((10*COS(SINE/100))+MRANDOM(-20,20)),RAD(MRANDOM(-20,20))),1)
				end
				gunweld.C0 = Clerp(gunweld.C0, CF(0*SIZE+0 * COS(SINE / 15), 0*SIZE-0 * COS(SINE /15), -0.3*SIZE+0 * COS(SINE / 15)) * ANGLES(RAD(-0+0 * COS(SINE / 505)), RAD(-0+0* COS(SINE / 55)), RAD(-0-0 * COS(SINE / 15))), 1 / Animation_Speed)
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 31), 0*SIZE+0 * COS(SINE / 31), 2.5*SIZE+0.3 * COS(SINE / 31)) * ANGLES(RAD(56+5 * COS(SINE / 32)), RAD(0+0 * COS(SINE / 32)), RAD(0+0 * COS(SINE / 32))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0,CF(-1.5,.5,0) * ANGLES(RAD(20),RAD(0),RAD(-20-10*SIN(SINE/25))) * LEFTSHOULDERC0,.7/3)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(1.3*SIZE-0 * COS(SINE / 31.5), 0*SIZE+0 * COS(SINE / 31.5), 0*SIZE+0 * COS(SINE / 31.5)) * ANGLES(RAD(70+0 * COS(SINE / 32.5)), RAD(10+-5 * COS(SINE / 32.5)), RAD(55+3 * COS(SINE / 32.5))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0,CF(1,-1,-.01) * ANGLES(RAD(20),RAD(80),RAD(10+10*SIN(SINE/25))),1/3)
				LeftHip.C0 = Clerp(LeftHip.C0,CF(-1,-1,-.01) * ANGLES(RAD(10),RAD(-80),RAD(-10-10*SIN(SINE/25))),1/3)
			elseif mode == 68 then 
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(-70.1+6*math.cos(SINE/25))), 1 / Animation_Speed)
				gunweld.C0 = Clerp(gunweld.C0, CF(1*SIZE+0 * COS(SINE / 15), -2*SIZE-0 * COS(SINE /15), -2*SIZE+0 * COS(SINE / 15)) * ANGLES(RAD(130+0 * COS(SINE / 505)), RAD(0+0* COS(SINE / 55)), RAD(0-0 * COS(SINE / 15))), 1 / Animation_Speed)
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 31), 0*SIZE+0 * COS(SINE / 31), 4.5*SIZE+0.7 * COS(SINE / 31)) * ANGLES(RAD(30+-10 * COS(SINE / 32)), RAD(0+0 * COS(SINE / 32)), RAD(90+0 * COS(SINE / 32))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1*SIZE-0 * COS(SINE / 1), 0.3*SIZE+0 * COS(SINE / 1), -.9*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(0+0 * COS(SINE / 1)), RAD(10+0 * COS(SINE / 1)), RAD(-90+0 * COS(SINE / 1))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.6*SIZE-0 * COS(SINE / 1), 0.3*SIZE+0 * COS(SINE / 1), 0.3*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(25+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1)), RAD(-35+0 * COS(SINE / 1))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.5*SIZE+0 * COS(SINE / 32), -.7*SIZE+0 * COS(SINE / 32), 0*SIZE+0 * COS(SINE / 32)) * ANGLES(RAD(0+3 * COS(SINE / 31)), RAD(-15+0 * COS(SINE / 31)), RAD(12+-8 * COS(SINE / 31))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 32), -1*SIZE+0 * COS(SINE / 32), 0.3*SIZE+0 * COS(SINE / 32)) * ANGLES(RAD(-10+-10 * COS(SINE / 31)), RAD(25+0 * COS(SINE / 31)), RAD(-12+3 * COS(SINE / 31))), 1 / Animation_Speed)
			elseif mode == 74 or mode == 46 then 
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(-0.1+6*math.cos(SINE/25))), 1 / Animation_Speed)
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0 + change / 2 * math.cos(SINE /2)) * ANGLES(math.rad((change * 50) - movement / 20 * math.cos(SINE /2)) * lookvel, torsorotY2 + math.rad(0 - 4 * math.sin(SINE /4)), math.rad(-(change * 20) - movement / 20 * math.cos(SINE /2)) * rightvel + torsorotY2 + math.rad(0 - 1 * math.cos(SINE /4))) * ANGLES(math.rad(0),-math.rad(10+10 * math.cos(SINE/WALKSPEEDVALUE))*sidevelocity,math.rad(0)), .2)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.5, -0.85 + movement / 15 * math.cos(SINE /4) / 2, (-0.25 - movement / 15 * math.cos(SINE /4)) * (-0 + 0.5 * lookvel)) * ANGLES((math.rad(-10 * lookvel + change * 5 + movement * math.cos(SINE /4)) + movement / 10 * math.sin(SINE /4)) * lookvel, math.rad(0 + movement * 1.3 * math.cos(SINE /4)), (math.rad(change * 5 + 0 * math.cos(SINE /4)) + movement / 10 * math.sin(SINE /4)) * (rightvector / (Humanoid.WalkSpeed * 2))),1)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5, -0.85 - movement / 15 * math.cos(SINE /4) / 2, (-0.25 + movement / 15 * math.cos(SINE /4)) * (-.0 + 0.5 * lookvel)) * ANGLES((math.rad(-10 * lookvel + change * 5 - movement * math.cos(SINE /4)) + -(movement / 10) * math.sin(SINE /4)) * lookvel, math.rad(0 + movement * 1.3 * math.cos(SINE /4)), (math.rad(change * 5 - 0 * math.cos(SINE /4)) + -(movement / 10) * math.sin(SINE /4)) * (rightvector / (Humanoid.WalkSpeed * 2))),1)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5 + 0.12 * lookvel ^ 2 - movement / 40 * math.cos(SINE /4) / 3, movement / 150 + movement / 40 * math.cos(SINE /4)) * CFrame.Angles((math.rad(-5 - movement * 2 * math.cos(SINE /4)) + -(movement / 10) * math.sin(SINE /4)) * lookvel, math.rad(0 - movement * 2 * math.cos(SINE /4)), -math.rad(movement * 1 * 0.2 - movement * 1 * math.cos(SINE /2) * lookvel) + math.rad(-5 * rightvel)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5 + 0.12 * lookvel ^ 2 + movement / 40 * math.cos(SINE /4) / 3, movement / 150 - movement / 40 * math.cos(SINE /4)) * CFrame.Angles((math.rad(-5 + movement * 2 * math.cos(SINE /4)) + movement / 10 * math.sin(SINE /4)) * lookvel, math.rad(0 - movement * 2 * math.cos(SINE /4)), -math.rad(-(movement * 1) * 0.2 + movement * 1 * math.cos(SINE /2) * lookvel) + math.rad(-5 * rightvel)) * LEFTSHOULDERC0, 1 / Animation_Speed)
			elseif mode == 76 then 
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(-0.1+6*math.cos(SINE/25))), 1 / Animation_Speed)
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(0+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.6*SIZE-0 * COS(SINE / 1), 0.4*SIZE+0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(0+25 * COS(SINE / 16)), RAD(0+0 * COS(SINE / 50)), RAD(0+0 * COS(SINE / 50))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.6*SIZE-0 * COS(SINE / 1), 0.4*SIZE+0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(0+-25 * COS(SINE / 16)), RAD(0+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.5*SIZE+0 * COS(SINE / 1), -1*SIZE+0 * COS(SINE / 1), 0.5*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(0+-25 * COS(SINE / 16)), RAD(0+0 * COS(SINE / 50)), RAD(0+0 * COS(SINE / 50))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 1), -1*SIZE+0 * COS(SINE / 1), 0.5*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(0+25 * COS(SINE / 16)), RAD(0+0 * COS(SINE / 50)), RAD(0+0 * COS(SINE / 50))), 1 / Animation_Speed)
			elseif mode == 78 then 
				if MRANDOM(1,8) == 1 then
					Neck.C0 = Clerp(Neck.C0,NECKC0 * ANGLES(RAD(20+MRANDOM(-20,20)),RAD((10*COS(SINE/100))+MRANDOM(-20,20)),RAD(MRANDOM(-20,20))),1)
				end
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(-0.1+6*math.cos(SINE/25))), 1 / Animation_Speed)
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1), 3.5*SIZE+0.5 * COS(SINE / 1)) * ANGLES(RAD(76+MRANDOM(-20,20) * COS(SINE / 1)), RAD(0+MRANDOM(-20,20) * COS(SINE / 1)), RAD(15+MRANDOM(-20,20) * COS(SINE / 1))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.6*SIZE-0 * COS(SINE / 1), 0.3*SIZE+0 * COS(SINE / 1), 0.5*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(-10+0 * COS(SINE / 1)), RAD(-12+0 * COS(SINE / 1)), RAD(25+0 * COS(SINE / 1))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1*SIZE-0 * COS(SINE / 1), 0.5*SIZE+0 * COS(SINE / 1), 0.5*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(-120+0 * COS(SINE / 1)), RAD(25+0 * COS(SINE / 1)), RAD(70+0 * COS(SINE / 1))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.5*SIZE+0 * COS(SINE / 1), -1*SIZE+0 * COS(SINE / 1), 0.3*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(10+0 * COS(SINE / 1)), RAD(-15+0 * COS(SINE / 1)), RAD(10+0 * COS(SINE / 1))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(0+0 * COS(SINE / 1)), RAD(15+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1))), 1 / Animation_Speed)
			elseif mode == 16 then 
				if MRANDOM(1,8) == 1 then
					Neck.C0 = Clerp(Neck.C0,NECKC0 * ANGLES(RAD(20+MRANDOM(-20,20)),RAD((10*COS(SINE/100))+MRANDOM(-20,20)),RAD(MRANDOM(-20,20))),1)
				end
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(-0.1+6*math.cos(SINE/25))), 1 / Animation_Speed)
				gunweld.C0 = Clerp(gunweld.C0, CF(0.2*SIZE+0 * COS(SINE / 15), -0.5*SIZE-0 * COS(SINE /15), 0*SIZE+0 * COS(SINE / 15)) * ANGLES(RAD(-0+0 * COS(SINE / 505)), RAD(-0+0* COS(SINE / 55)), RAD(20-0 * COS(SINE / 14))), 1 / Animation_Speed)
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0,0.5,2 - .5 * SIN(SINE/14)) * ANGLES(RAD(30),RAD(0),RAD(0)),.7/3)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0,CF(1.3,.5,0)*ANGLES(RAD(-10+0*COS(SINE/15)),160,RAD(0))*RIGHTSHOULDERC0,.25)
				RightShoulder.C0 = Clerp(RightShoulder.C0,CF(-1.5,.5,0) * ANGLES(RAD(100),RAD(10),RAD(-10-10*SIN(SINE/15))) * LEFTSHOULDERC0,.7/3)
				RightHip.C0 = Clerp(RightHip.C0,CF(1,-1,-.0) * ANGLES(RAD(-10),RAD(80),RAD(10+10*SIN(SINE/15))),1/3)
				LeftHip.C0 = Clerp(LeftHip.C0,CF(-1,-1,-.0) * ANGLES(RAD(-20),RAD(-80),RAD(-10-10*SIN(SINE/15))),1/3)
			elseif mode == 42 then 
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1), -0.2*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(-45+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.6*SIZE-0 * COS(SINE / 1), 0.5*SIZE+0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(-135+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.6*SIZE-0 * COS(SINE / 1), 0.5*SIZE+0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(-135+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE+0 * COS(SINE / 1), -1*SIZE+0 * COS(SINE / 1), -0.01*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(0+75 * COS(SINE / 2)), RAD(90+0 * COS(SINE / 2)), RAD(0+0 * COS(SINE / 2))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE+0 * COS(SINE / 1), -1*SIZE+0 * COS(SINE / 1), -0.01*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(0+-75 * COS(SINE / 2)), RAD(-90+0 * COS(SINE / 2)), RAD(0+0 * COS(SINE / 2))), 1 / Animation_Speed)
			elseif mode == 36 then 
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 15), 0*SIZE+0 * COS(SINE / 15), 3*SIZE+0.5 * COS(SINE / 15)) * ANGLES(RAD(40+0 * COS(SINE / 30)), RAD(0+-5 * COS(SINE / 30)), RAD(0+0 * COS(SINE / 30))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.6*SIZE-0 * COS(SINE / 1), 0.5*SIZE+0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(-45+0 * COS(SINE / 19)), RAD(5+2 * COS(SINE / 19)), RAD(0.7+3 * COS(SINE / 19))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.6*SIZE-0 * COS(SINE / 1), 0.5*SIZE+0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(-45+0 * COS(SINE / 19)), RAD(-5+-2 * COS(SINE / 19)), RAD(0.7+3 * COS(SINE / 19))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE+0 * COS(SINE / 1), -0.5*SIZE+0 * COS(SINE / 1), -0.5*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(-20+9 * COS(SINE / 37)), RAD(80+0 * COS(SINE / 37)), RAD(0+5 * COS(SINE / 37))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE+0 * COS(SINE / 1), -1*SIZE+0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(-20+-9 * COS(SINE / 37)), RAD(-80+0 * COS(SINE / 37)), RAD(0+-5 * COS(SINE / 37))), 1 / Animation_Speed)
			elseif mode == 103 then 
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 20), 0*SIZE+0 * COS(SINE / 20), 3*SIZE+0.5 * COS(SINE / 20)) * ANGLES(RAD(89+12 * COS(SINE / 21)), RAD(5+0 * COS(SINE / 21)), RAD(0+0 * COS(SINE / 21))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(2.75*SIZE-0 * COS(SINE / 20), -1.5*SIZE+0.15 * COS(SINE / 20), 0*SIZE+0 * COS(SINE / 20)) * ANGLES(RAD(25+-10 * COS(SINE / 21)), RAD(25+-10 * COS(SINE / 21)), RAD(0+0 * COS(SINE / 21))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-2.5*SIZE-0 * COS(SINE / 20), -1.5*SIZE+0.15 * COS(SINE / 20), 0*SIZE+0 * COS(SINE / 20)) * ANGLES(RAD(25+-10 * COS(SINE / 21)), RAD(0+5 * COS(SINE / 21)), RAD(-10+0 * COS(SINE / 21))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(1*SIZE+0 * COS(SINE / 20), 0.2*SIZE+0.15 * COS(SINE / 20), 0.8*SIZE+0 * COS(SINE / 20)) * ANGLES(RAD(25+0 * COS(SINE / 21)), RAD(-25+5 * COS(SINE / 21)), RAD(45+0 * COS(SINE / 21))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-1*SIZE+0 * COS(SINE / 20), 0*SIZE+0.15 * COS(SINE / 20), 0.5*SIZE+0 * COS(SINE / 20)) * ANGLES(RAD(25+0 * COS(SINE / 20)), RAD(25+5 * COS(SINE / 20)), RAD(-45+0 * COS(SINE / 20))), 1 / Animation_Speed)
			elseif mode == 105 then 
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1), 0.5*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(0+MRANDOM(-40,40) * COS(SINE / 1)), RAD(0+MRANDOM(-40,40) * COS(SINE / 1)), RAD(0+MRANDOM(-40,40) * COS(SINE / 1))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5*SIZE-0 * COS(SINE / 1), 0.6*SIZE+0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(0+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1)), RAD(90+0 * COS(SINE / 1))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5*SIZE-0 * COS(SINE / 1), 0.6*SIZE+0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(0+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1)), RAD(-90+0 * COS(SINE / 1))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.5*SIZE+0 * COS(SINE / 1), -1*SIZE+0 * COS(SINE / 1), 0.5*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(0+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 1), -1*SIZE+0 * COS(SINE / 1), 0.5*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(0+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1))), 1 / Animation_Speed)
			elseif mode == 106 then 
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0 * COS(SINE / 20), 0*SIZE+0.3 * COS(SINE / 20), 2.5*SIZE+0.4 * COS(SINE / 20)) * ANGLES(RAD(56+-8 * COS(SINE / 21)), RAD(0+0 * COS(SINE / 21)), RAD(0+0 * COS(SINE / 21))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1*SIZE-0 * COS(SINE / 20), -1*SIZE+0.15 * COS(SINE / 20), -1*SIZE+0 * COS(SINE / 20)) * ANGLES(RAD(-25+0 * COS(SINE / 21)), RAD(-25+8 * COS(SINE / 21)), RAD(0+0 * COS(SINE / 21))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1*SIZE-0 * COS(SINE / 20), -1.5*SIZE+0.15 * COS(SINE / 20), 0*SIZE+0 * COS(SINE / 20)) * ANGLES(RAD(-25+0 * COS(SINE / 21)), RAD(25+-5 * COS(SINE / 21)), RAD(-7+0 * COS(SINE / 21))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.8*SIZE+0 * COS(SINE / 20), -2*SIZE+0.15 * COS(SINE / 20), 0*SIZE+0 * COS(SINE / 20)) * ANGLES(RAD(-56+15 * COS(SINE / 21)), RAD(-15+5 * COS(SINE / 21)), RAD(-15+0 * COS(SINE / 21))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.7*SIZE+0 * COS(SINE / 20), -2.5*SIZE+0.15 * COS(SINE / 20), 1*SIZE+0 * COS(SINE / 20)) * ANGLES(RAD(-45+15 * COS(SINE / 21)), RAD(45+-5 * COS(SINE / 21)), RAD(0+0 * COS(SINE / 21))), 1 / Animation_Speed)
			elseif mode == 107 then 
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(-0.1+6*math.cos(SINE/25))), 1 / Animation_Speed)
				gunweld.C0 = Clerp(gunweld.C0, CF(0*SIZE+0 * COS(SINE / 15), -.7*SIZE-0 * COS(SINE /15), 0*SIZE+0 * COS(SINE / 15)) * ANGLES(RAD(90+0 * COS(SINE / 505)), RAD(75+0* COS(SINE / 55)), RAD(0-0 * COS(SINE / 15))), 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.6*SIZE-0 * COS(SINE / 32.5), 0*SIZE+0.2 * COS(SINE / 32.5), 0*SIZE+0 * COS(SINE / 32.5)) * ANGLES(RAD(180+0 * COS(SINE / 31.5)), RAD(15+0 * COS(SINE / 31.5)), RAD(25+0 * COS(SINE / 31.5))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0 + change / 2 * math.cos(SINE /2)) * ANGLES(math.rad((change * 50) - movement / 20 * math.cos(SINE /2)) * lookvel, torsorotY2 + math.rad(0 - 4 * math.sin(SINE /4)), math.rad(-(change * 20) - movement / 20 * math.cos(SINE /2)) * rightvel + torsorotY2 + math.rad(0 - 1 * math.cos(SINE /4))) * ANGLES(math.rad(0),-math.rad(10+10 * math.cos(SINE/WALKSPEEDVALUE))*sidevelocity,math.rad(0)), .2)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.5, -0.85 + movement / 15 * math.cos(SINE /4) / 2, (-0.25 - movement / 15 * math.cos(SINE /4)) * (-0 + 0.5 * lookvel)) * ANGLES((math.rad(-10 * lookvel + change * 5 + movement * math.cos(SINE /4)) + movement / 10 * math.sin(SINE /4)) * lookvel, math.rad(0 + movement * 1.3 * math.cos(SINE /4)), (math.rad(change * 5 + 0 * math.cos(SINE /4)) + movement / 10 * math.sin(SINE /4)) * (rightvector / (Humanoid.WalkSpeed * 2))),1)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5, -0.85 - movement / 15 * math.cos(SINE /4) / 2, (-0.25 + movement / 15 * math.cos(SINE /4)) * (-.0 + 0.5 * lookvel)) * ANGLES((math.rad(-10 * lookvel + change * 5 - movement * math.cos(SINE /4)) + -(movement / 10) * math.sin(SINE /4)) * lookvel, math.rad(0 + movement * 1.3 * math.cos(SINE /4)), (math.rad(change * 5 - 0 * math.cos(SINE /4)) + -(movement / 10) * math.sin(SINE /4)) * (rightvector / (Humanoid.WalkSpeed * 2))),1)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5 + 0.12 * lookvel ^ 2 - movement / 40 * math.cos(SINE /4) / 3, movement / 150 + movement / 40 * math.cos(SINE /4)) * CFrame.Angles((math.rad(-5 - movement * 2 * math.cos(SINE /4)) + -(movement / 10) * math.sin(SINE /4)) * lookvel, math.rad(0 - movement * 2 * math.cos(SINE /4)), -math.rad(movement * 1 * -0.8 - movement * 1 * math.cos(SINE /2) * lookvel) + math.rad(-5 * rightvel)) * RIGHTSHOULDERC0, .2)
			elseif mode == 112 then 
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 1 * COS(SINE / 25), 0*SIZE+0 * COS(SINE / 13),2*SIZE+.6 * COS(SINE / 13)) * ANGLES(RAD(55+6 * COS(SINE / 35)), RAD(0+2 * COS(SINE / 35)), RAD(0-15 * COS(SINE / 25))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1*SIZE-0 * COS(SINE / 20), 0*SIZE+0.15 * COS(SINE / 20), 1*SIZE+0 * COS(SINE / 20)) * ANGLES(RAD(25+8 * COS(SINE / 21)), RAD(-15+-6 * COS(SINE / 21)), RAD(-35+8 * COS(SINE / 21))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1*SIZE-0 * COS(SINE / 20), 0*SIZE+0.15 * COS(SINE / 20), 1*SIZE+0 * COS(SINE / 20)) * ANGLES(RAD(25+8 * COS(SINE / 21)), RAD(15+6 * COS(SINE / 21)), RAD(32+-8 * COS(SINE / 21))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(0.5*SIZE+0 * COS(SINE / 13), -0.3*SIZE+0.2 * COS(SINE / 13), -0.2*SIZE+0 * COS(SINE / 13)) * ANGLES(RAD(-25+4 * COS(SINE / 13.5)), RAD(-16+5 * COS(SINE / 13.5)), RAD(0+-5 * COS(SINE / 13.5))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(-0.5*SIZE+0 * COS(SINE / 13), -1*SIZE+0.3 * COS(SINE / 13), 0.3*SIZE+0 * COS(SINE / 13)) * ANGLES(RAD(-25+4 * COS(SINE / 13.5)), RAD(25+5 * COS(SINE / 13.5)), RAD(0+5 * COS(SINE / 13.5))), 1 / Animation_Speed)
				Neck.C0 = Clerp(Neck.C0, CF(0*SIZE+0 * COS(SINE / 1), 1.0*SIZE+0 * COS(SINE / 1), -.0*SIZE+0 * COS(SINE / 1)) * ANGLES(math.rad(90.3+3*math.cos(SINE/30)),math.rad(180+3*math.cos(SINE/28)),math.rad(-0.1+6*math.cos(SINE/25))), 1 / Animation_Speed)
				gunweld.C0 = Clerp(gunweld.C0, CF(0*SIZE+0 * COS(SINE / 15), 4*SIZE-.3 * COS(SINE /15), -2*SIZE+0 * COS(SINE / 15)) * ANGLES(RAD(-20+0 * COS(SINE / 505)), RAD(-390+15* COS(SINE / 33)), RAD(-100-10 * COS(SINE / 30))), 1 / Animation_Speed)
			elseif mode == 115 then 
				RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0*SIZE- 0.3 * COS(SINE / 16), 0*SIZE+0.3 * COS(SINE / 16), 3*SIZE+0.35 * COS(SINE / 16)) * ANGLES(RAD(-67+10 * COS(SINE / 17)), RAD(0+-369 * COS(SINE / 20)), RAD(0+9 * COS(SINE / 17))), 1 / Animation_Speed)
				RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5*SIZE-0 * COS(SINE / 1), 0.15*SIZE+0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(0+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1)), RAD(90+0 * COS(SINE / 1))) * RIGHTSHOULDERC0, 1 / Animation_Speed)
				LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5*SIZE-0 * COS(SINE / 1), 0.15*SIZE+0 * COS(SINE / 1), 0*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(0+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1)), RAD(-90+0 * COS(SINE / 1))) * LEFTSHOULDERC0, 1 / Animation_Speed)
				RightHip.C0 = Clerp(RightHip.C0, CF(0*SIZE+0 * COS(SINE / 1), -1*SIZE+0 * COS(SINE / 1), 0.5*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(0+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1))), 1 / Animation_Speed)
				LeftHip.C0 = Clerp(LeftHip.C0, CF(0*SIZE+0 * COS(SINE / 1), 1*SIZE+0 * COS(SINE / 1), 0.5*SIZE+0 * COS(SINE / 1)) * ANGLES(RAD(0+0 * COS(SINE / 1)), RAD(0+0 * COS(SINE / 1)), RAD(180+0 * COS(SINE / 1))), 1 / Animation_Speed)

			end end
	end 
	unanchor()
	
		pcall(function()
			if mode == 98 then
				Character['Large Black Sparkle Halo'].Handle.AccessoryWeld.C0 = Character['Large Black Sparkle Halo'].Handle.AccessoryWeld.C0:Lerp(CF(0+0.1*math.cos(SINE/-360),-1.5+0.1*math.cos(SINE/-360),0+0.1*math.cos(SINE/-360))*ANGLES(RAD(-5+5*math.cos(SINE/-360)),RAD((SINE*math.random(10, 20)) - (math.random() * 5)),RAD(-5+5*math.cos(SINE/-360))),.1)
			else
				Character['Large Black Sparkle Halo'].Handle.AccessoryWeld.C0 = Character['Large Black Sparkle Halo'].Handle.AccessoryWeld.C0:Lerp(CF(0+0.1*math.cos(SINE/-360),-1.5+0.1*math.cos(SINE/-360),0+0.1*math.cos(SINE/-360))*ANGLES(RAD(-5+5*math.cos(SINE/-360)),RAD(SINE*2),RAD(-5+5*math.cos(SINE/-360))),.1)
			end
		end)
	
	pcall(function()
			if mode == 98 then
				Character['Golden Spiked Halo'].Handle.AccessoryWeld.C0 = Character['Golden Spiked Halo'].Handle.AccessoryWeld.C0:Lerp(CF(0+0.1*math.cos(SINE/-360),-1.5+0.1*math.cos(SINE/-360),0+0.1*math.cos(SINE/-360))*ANGLES(RAD(-5+5*math.cos(SINE/-360)),RAD((SINE*math.random(10, 20)) - (math.random() * 5)),RAD(-5+5*math.cos(SINE/-360))),.1)
			else
				Character['Golden Spiked Halo'].Handle.AccessoryWeld.C0 = Character['Golden Spiked Halo'].Handle.AccessoryWeld.C0:Lerp(CF(0+0.1*math.cos(SINE/-360),-1.5+0.1*math.cos(SINE/-360),0+0.1*math.cos(SINE/-360))*ANGLES(RAD(-5+5*math.cos(SINE/-360)),RAD(SINE*2),RAD(-5+5*math.cos(SINE/-360))),.1)
			end
		end)

	
	if Rooted == false then
		Disable_Jump = false
		Humanoid.WalkSpeed = Speed
	elseif Rooted == true then
		Disable_Jump = true
		Humanoid.WalkSpeed = 0
	end
	Humanoid.JumpPower = 55
end