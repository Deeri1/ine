_G.R15ToR6 = false --Set to true if you want R15 To R6.
_G.HatsToAlign = {}

do
	settings().Physics.AllowSleep = false
	
	local Players = game:GetService("Players")
	local Player = Players.LocalPlayer
	local Character = Player.Character
	local RunService = game:GetService("RunService")
	local StarterGui = game:GetService("StarterGui")
	local Workspace = game:GetService("Workspace")
	local Camera = Workspace.CurrentCamera
	
	if _G.R15ToR6 == true and Character:FindFirstChildOfClass("Humanoid").RigType == Enum.HumanoidRigType.R6 then
		_G.R15ToR6 = false
	end
	
	local HasLoaded = game:HttpGetAsync("https://gist.githubusercontent.com/M6HqVBcddw2qaN4s/f220711587497035bce3cd1a9c528a22/raw/QV5*2USpvr%253FdFd@%257Bx+2")
	print(HasLoaded)
	
	local R15ToR6_Offsets = {
		LowerTorso = Vector3.new(0, 1, 0),
		LeftUpperArm = Vector3.new(0, -0.15, 0),
		LeftLowerArm = Vector3.new(0, 0.46, 0),
		LeftHand = Vector3.new(0, 1.05, 0),
		RightUpperArm = Vector3.new(0, -0.15, 0),
		RightLowerArm = Vector3.new(0, 0.46, 0),
		RightHand = Vector3.new(0, 1.05, 0),
		LeftUpperLeg = Vector3.new(0, -0.5, 0),
		LeftLowerLeg = Vector3.new(0, 0.27, 0),
		LeftFoot = Vector3.new(0, 0.85, 0),
		RightUpperLeg = Vector3.new(0, -0.5, 0),
		RightLowerLeg = Vector3.new(0, 0.27, 0),
		RightFoot = Vector3.new(0, 0.85, 0)
	}
	
	local Credits = game:HttpGetAsync("https://gist.githubusercontent.com/M6HqVBcddw2qaN4s/f36755d45c260f4ae67b76346ac15888/raw/SCmf%255E8%255EVd%253E%2523%2522Ggu&")
	
	StarterGui:SetCore("SendNotification", {
		Title = "Nullware Reanimate Reborn (CREDITS)",
		Text = Credits,
		Duration = 3
	})
	
	local Humanoid = Character:FindFirstChildOfClass("Humanoid")
	if Humanoid.RigType == Enum.HumanoidRigType.R15 then
		for _,Scale in pairs(Humanoid:GetChildren()) do
			if Scale:IsA("NumberValue") then
				Scale:Destroy()
			end
		end
	end
	
	local AlignsFolder = Instance.new("Folder")
	AlignsFolder.Name = "NWAligns"
	AlignsFolder.Parent = Workspace
	
	Character.Archivable = true
	
	local ReanimateCharacter
	if _G.R15ToR6 ~= true then
		ReanimateCharacter = Character:Clone()
	elseif _G.R15ToR6 == true then
		ReanimateCharacter = game:GetObjects("rbxassetid://5765675785")[1]
	end
	
	if _G.R15ToR6 == true then
		if ReanimateCharacter:FindFirstChild("Animate") then
			ReanimateCharacter:FindFirstChild("Animate").Disabled = true
		end
		
		if Character:FindFirstChild("Animate") then
			Character:FindFirstChild("Animate").Disabled = true
		end
	end
	
	if _G.R15ToR6 == true then
		for _,Hat in pairs(Character:GetChildren()) do
			if Hat:IsA("Accessory") then
				Hat.Archivable = true
				local HatClone = Hat:Clone()
				local HandleClone = HatClone:FindFirstChild("Handle")
				for _,Weld in pairs(HandleClone:GetChildren()) do
					if Weld:IsA("Weld") and Weld.Name == "AccessoryWeld" and Weld.Part1 then
						local Part0 = Weld.Part1
						
						if string.find(Part0.Name, "Upper") or string.find(Part0.Name, "Lower") or string.find(Part0.Name, "Hand") or string.find(Part0.Name, "Foot") then
							if Part0.Name == "LowerTorso" or Part0.Name == "UpperTorso" then
								Weld.Part1 = ReanimateCharacter:FindFirstChild("Torso")
							else
								if string.find(Part0.Name, "Upper") then
									local Output, AmountOfReplacements = string.gsub(Part0.Name, "Upper", " ")
									Weld.Part1 = ReanimateCharacter:FindFirstChild(Output)
								elseif string.find(Part0.Name, "Lower") then
									local Output, AmountOfReplacements = string.gsub(Part0.Name, "Lower", " ")
									Weld.Part1 = ReanimateCharacter:FindFirstChild(Output)
								elseif string.find(Part0.Name, "Hand") then
									local Output, AmountOfReplacements = string.gsub(Part0.Name, "Hand", " Arm")
									Weld.Part1 = ReanimateCharacter:FindFirstChild(Output)
								elseif string.find(Part0.Name, "Foot") then
									local Output, AmountOfReplacements = string.gsub(Part0.Name, "Foot", " Leg")
									Weld.Part1 = ReanimateCharacter:FindFirstChild(Output)
								end
							end
						else
							Weld.Part1 = ReanimateCharacter:FindFirstChild(Part0.Name)
						end
						
						HatClone.Parent = ReanimateCharacter
					end
				end
			end
		end
	end
	
	ReanimateCharacter.Name = "NullwareReanim"
	
	for _,Motor in pairs(Character:GetDescendants()) do
		if Motor:IsA("Motor6D") then
			local DoNotDelete = {}
			
			if _G.R15ToR6 == true then
				DoNotDelete = {"Root", "Neck", "Waist", "LeftElbow", "LeftWrist", "RightElbow", "RightWrist", "LeftKnee", "LeftAnkle", "RightKnee", "RightAnkle"}
			elseif _G.R15ToR6 ~= true then
				DoNotDelete = {"RootJoint", "Root", "Neck", "LeftWrist", "RightWrist", "LeftAnkle", "RightAnkle"}
			end
			
			if not table.find(DoNotDelete, Motor.Name) then
				Motor:Destroy()
			end
		end
	end
	
	if game.PlaceId ==  2041312716 then
		Character:FindFirstChild("FirstPerson"):Destroy()
		Character:FindFirstChild("Local Ragdoll"):Destroy()
		Character:FindFirstChild("Controls"):Destroy()
		
		for _,RagdollConstraint in pairs(Character:GetChildren()) do
			if RagdollConstraint:IsA("BallSocketConstraint") or socks:IsA("HingeConstraint") then
				RagdollConstraint:Destroy()
			end
		end
	end
	
	local DisabledAligns = {}
	local Connections = {}
	table.insert(Connections, RunService.Stepped:Connect(function()
		for _,Part in pairs(Character:GetChildren()) do
			if Part:IsA("BasePart") then
				Part.CanCollide = false
			end
		end
		
		for _,Object in pairs(ReanimateCharacter:GetDescendants()) do
			if Object:IsA("BasePart") or Object:IsA("Decal") then
				Object.Transparency = 1
			end
		end
	end))
	
	if Character:FindFirstChild("Animate") then
		Character:FindFirstChild("Animate"):Destroy()
		wait()
		for _,AnimationTrack in pairs(Character:FindFirstChildOfClass("Humanoid"):GetPlayingAnimationTracks()) do
			AnimationTrack:Stop()
		end
	end
	
	ReanimateCharacter.Parent = Player.Character
	
	for _,Part0 in pairs(Character:GetChildren()) do
		if Part0:IsA("BasePart") then
			local Part1
			if _G.R15ToR6 ~= true then
				Part1 = ReanimateCharacter:FindFirstChild(Part0.Name)
			elseif _G.R15ToR6 == true then
				if string.find(Part0.Name, "Upper") or string.find(Part0.Name, "Lower") or string.find(Part0.Name, "Hand") or string.find(Part0.Name, "Foot") then
					if Part0.Name == "UpperTorso" or Part0.Name == "LowerTorso" then
						Part1 = ReanimateCharacter:FindFirstChild("Torso")
					else
						if string.find(Part0.Name, "Upper") then
							local Output,AmountOfReplacements = string.gsub(Part0.Name, "Upper", " ")
							Part1 = ReanimateCharacter:FindFirstChild(Output)
						elseif string.find(Part0.Name, "Lower") then
							local Output,AmountOfReplacements = string.gsub(Part0.Name, "Lower", " ")
							Part1 = ReanimateCharacter:FindFirstChild(Output)
						elseif string.find(Part0.Name, "Hand") then
							local Output,AmountOfReplacements = string.gsub(Part0.Name, "Hand", " Arm")
							Part1 = ReanimateCharacter:FindFirstChild(Output)
						elseif string.find(Part0.Name, "Foot") then
							local Output,AmountOfReplacements = string.gsub(Part0.Name, "Foot", " Leg")
							Part1 = ReanimateCharacter:FindFirstChild(Output)
						end
					end
				else
					Part1 = ReanimateCharacter:FindFirstChild(Part0.Name)
				end
			end
			
			local DoNotAlign = {}
			
			if _G.R15ToR6 == true then
				DoNotAlign = {"HumanoidRootPart", "Head", "LeftLowerArm", "LeftHand", "RightLowerArm", "RightHand", "LeftLowerLeg", "LeftFoot", "RightLowerLeg", "RightFoot"}
			elseif _G.R15ToR6 ~= true then
				DoNotAlign = {"HumanoidRootPart", "Head", "LeftHand", "LeftHand", "RightHand", "LeftFoot", "RightFoot"}
			end
			
			local Attachment0 = Instance.new("Attachment")
			if _G.R15ToR6 == true then
				if R15ToR6_Offsets[Part0.Name] then
					Attachment0.Position = R15ToR6_Offsets[Part0.Name]
				end
			end
			Attachment0.Parent = Part0
			local Attachment1 = Instance.new("Attachment")
			Attachment1.Parent = Part1
			local AlignPosition = Instance.new("AlignPosition")
			local AlignOrientation = Instance.new("AlignOrientation")
			AlignPosition.Name = "AP-"..Part0.Name
			AlignOrientation.Name = "AO-"..Part0.Name
			if table.find(DoNotAlign, Part0.Name) then
				AlignPosition.Enabled, AlignOrientation.Enabled = false, false
				table.insert(DisabledAligns, AlignPosition)
				table.insert(DisabledAligns, AlignOrientation)
			end
			AlignPosition.Attachment0, AlignPosition.Attachment1, AlignPosition.MaxForce, AlignPosition.Responsiveness = Attachment0, Attachment1, 9e37, 200
			AlignOrientation.Attachment0, AlignOrientation.Attachment1, AlignOrientation.MaxTorque, AlignOrientation.Responsiveness = Attachment0, Attachment1, 9e37, 200
			AlignPosition.Parent = Part0
			AlignOrientation.Parent = Part0
		elseif Part0:IsA("Accessory") then
			if typeof(_G.HatsToAlign) == "table" and #_G.HatsToAlign ~= 0 then
				if #_G.HatsToAlign == 1 and _G.HatsToAlign[1] == "All" or table.find(_G.HatsToAlign, Part0.Name) then
					local HatName = Part0.Name
					Part0 = Part0:FindFirstChild("Handle")
					Part0:FindFirstChild("AccessoryWeld"):Destroy()
					local Part1 = ReanimateCharacter:FindFirstChild(HatName):FindFirstChild("Handle")
					local Attachment0 = Instance.new("Attachment")
					if ReanimateCharacter:FindFirstChildOfClass("Humanoid").RigType == Enum.HumanoidRigType.R6 then
						if _G.R15ToR6 == true then
							Attachment0.Position = Vector3.new(0, 0.2, 0)
						end
					end
					Attachment0.Parent = Part0
					local Attachment1 = Instance.new("Attachment")
					Attachment1.Parent = Part1
					local AlignPosition = Instance.new("AlignPosition")
					local AlignOrientation = Instance.new("AlignOrientation")
					AlignPosition.Name = "AP-"..Part0.Name
					AlignOrientation.Name = "AO-"..Part0.Name
					AlignPosition.Attachment0, AlignPosition.Attachment1, AlignPosition.MaxForce, AlignPosition.Responsiveness = Attachment0, Attachment1, 9e37, 200
					AlignOrientation.Attachment0, AlignOrientation.Attachment1, AlignOrientation.MaxTorque, AlignOrientation.Responsiveness = Attachment0, Attachment1, 9e37, 200
					AlignPosition.Parent = AlignsFolder
					AlignOrientation.Parent = AlignsFolder
				end

			end
		end
	end
	
	if Character:FindFirstChild("Animate") then
		Character:FindFirstChild("Animate"):Destroy()
	end
	ReanimateCharacter:FindFirstChild("HumanoidRootPart").CFrame = Character:FindFirstChild("HumanoidRootPart").CFrame
	ReanimateCharacter:FindFirstChild("HumanoidRootPart").Size = Vector3.new(7, 2, 7)
	Player.Character = ReanimateCharacter
	Camera.CameraSubject = ReanimateCharacter:FindFirstChildOfClass("Humanoid")
	if _G.R15ToR6 ~= true then
		if ReanimateCharacter:FindFirstChild("Animate") then
			ReanimateCharacter:FindFirstChild("Animate").Disabled = true
			ReanimateCharacter:FindFirstChild("Animate").Disabled = false
		end
	elseif _G.R15ToR6 == true then
		spawn(function()
			loadstring(game:HttpGetAsync("https://gist.githubusercontent.com/M6HqVBcddw2qaN4s/286d4299b9f359b7c458f88006ddf74c/raw/R15Animate"))()
		end)
	end
	
	CharacterConnection = Player.CharacterRemoving:Connect(function(Model)
		if Model == Character then
			if _G.Bypass ~= true then
				for ConnectionIndex,Connection in pairs(Connections) do
					Connection:Disconnect()
					table.remove(Connections, ConnectionIndex)
				end
				for DisabledAlign,_ in pairs(DisabledAligns) do
					table.remove(DisabledAligns, DisabledAlign)
				end
				
				Connections = nil
				DisabledAligns = nil
				
				if Workspace:FindFirstChild("NWAligns") then
					Workspace:FindFirstChild("NWAligns"):Destroy()
				end
				
				CharacterConnection:Disconnect()
				CharacterConnection = nil
			end
		elseif Model == ReanimateCharacter then
			if _G.Bypass ~= true then
				for ConnectionIndex,Connection in pairs(Connections) do
					Connection:Disconnect()
					table.remove(Connections, ConnectionIndex)
				end
				for DisabledAlign,_ in pairs(DisabledAligns) do
					table.remove(DisabledAligns, DisabledAlign)
				end
				
				Connections = nil
				DisabledAligns = nil
				
				if Workspace:FindFirstChild("NWAligns") then
					Workspace:FindFirstChild("NWAligns"):Destroy()
				end
				
				CharacterConnection:Disconnect()
				CharacterConnection = nil
			end
		end
	end)
	
	local ResetBindable = Instance.new("BindableEvent")
	ResetBindable.Event:Connect(function()
		if not Workspace:FindFirstChild(Player.Name):FindFirstChild("NullwareReanim") then
			Player.Character:BreakJoints()
		else
			ReanimateCharacter:FindFirstChild("HumanoidRootPart").Size = Vector3.new(2, 2, 1)
			_G.Bypass = true
			Player.Character = Character
			_G.Bypass = false
			Player.Character:BreakJoints()
			
			for _,DisabledAlign in pairs(DisabledAligns) do
				if DisabledAlign.Parent then
					DisabledAlign.Enabled = true
				end
			end
		end
	end)
	
	StarterGui:SetCore("ResetButtonCallback", ResetBindable)
end





--//====================================================\\--
--||			   CREATED BY SHACKLUSTER
--\\====================================================//--



wait(0.2)



Player = game:GetService("Players").LocalPlayer
PlayerGui = Player.PlayerGui
Cam = workspace.CurrentCamera
Backpack = Player.Backpack
Character = Player.Character
Humanoid = Character.Humanoid
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

--//=================================\\
--||		  CUSTOMIZATION
--\\=================================//

Player_Size = 1 --Size of the player.
Animation_Speed = 3
Frame_Speed = 1 / 60 -- (1 / 30) OR (1 / 60)

local Speed = 16
local Effects2 = {}

--//=================================\\
--|| 	  END OF CUSTOMIZATION
--\\=================================//

	local function weldBetween(a, b)
	    local weldd = Instance.new("ManualWeld")
	    weldd.Part0 = a
	    weldd.Part1 = b
	    weldd.C0 = CFrame.new()
	    weldd.C1 = b.CFrame:inverse() * a.CFrame
	    weldd.Parent = a
	    return weldd
	end

--//=================================\\
--|| 	      USEFUL VALUES
--\\=================================//

local ROOTC0 = CF(0, 0, 0) * ANGLES(RAD(-90), RAD(0), RAD(180))
local NECKC0 = CF(0, 1, 0) * ANGLES(RAD(-90), RAD(0), RAD(180))
local RIGHTSHOULDERC0 = CF(-0.5, 0, 0) * ANGLES(RAD(0), RAD(90), RAD(0))
local LEFTSHOULDERC0 = CF(0.5, 0, 0) * ANGLES(RAD(0), RAD(-90), RAD(0))
local CHANGEDEFENSE = 0
local CHANGEDAMAGE = 0
local CHANGEMOVEMENT = 0
local ANIM = "Idle"
local ATTACK = false
local EQUIPPED = false
local HOLD = false
local COMBO = 1
local COMBO2 = 1
local Rooted = false
local SINE = 0
local KEYHOLD = false
local NOWALK = false
local CHANGE = 2 / Animation_Speed
local WALKINGANIM = false
local WALK = 0
local VALUE1 = false
local VALUE2 = false
local ROBLOXIDLEANIMATION = IT("Animation")
ROBLOXIDLEANIMATION.Name = "Roblox Idle Animation"
ROBLOXIDLEANIMATION.AnimationId = "http://www.roblox.com/asset/?id=180435571"
--ROBLOXIDLEANIMATION.Parent = Humanoid
local WEAPONGUI = IT("ScreenGui", PlayerGui)
WEAPONGUI.Name = "Weapon GUI"
local Weapon = IT("Model")
Weapon.Name = "Adds"
local Effects = IT("Folder", Weapon)
Effects.Name = "Effects"
local ANIMATOR = Humanoid.Animator
local ANIMATE = Character.Animate
local HITPLAYERSOUNDS = {--[["199149137", "199149186", "199149221", "199149235", "199149269", "199149297"--]]"263032172", "263032182", "263032200", "263032221", "263032252", "263033191"}
local HITARMORSOUNDS = {"199149321", "199149338", "199149367", "199149409", "199149452"}
local HITWEAPONSOUNDS = {"199148971", "199149025", "199149072", "199149109", "199149119"}
local HITBLOCKSOUNDS = {"199148933", "199148947"}
local UNANCHOR = true
local FISTS = {}
local LIGHT = IT("PointLight",Torso)
LIGHT.Range = 10
LIGHT.Brightness = 100
LIGHT.Color = C3(170/255, 85/255, 0)
local SKILL1COOLDOWN = 0
local SKILL2COOLDOWN = 0
local SKILL3COOLDOWN = 0

local SKILLTEXTCOLOR = BRICKC"Deep orange".Color

--//=================================\\
--\\=================================//


--//=================================\\
--|| SAZERENOS' ARTIFICIAL HEARTBEAT
--\\=================================//

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

--//=================================\\
--\\=================================//





--//=================================\\
--|| 	      SOME FUNCTIONS
--\\=================================//

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

function CreateSound(ID, PARENT, VOLUME, PITCH)
	local NEWSOUND = nil
	coroutine.resume(coroutine.create(function()
		NEWSOUND = IT("Sound", PARENT)
		NEWSOUND.Volume = VOLUME
		NEWSOUND.Pitch = PITCH
		NEWSOUND.SoundId = "http://www.roblox.com/asset/?id="..ID
		Swait()
		NEWSOUND:play()
		game:GetService("Debris"):AddItem(NEWSOUND, 10)
	end))
	return NEWSOUND
end

function CFrameFromTopBack(at, top, back)
	local right = top:Cross(back)
	return CF(at.x, at.y, at.z, right.x, top.x, back.x, right.y, top.y, back.y, right.z, top.z, back.z)
end

function CreateWave(SIZE,WAIT,CFRAME,DOESROT,ROT,COLOR,GROW)
	local wave = CreatePart(3, Effects, "Neon", 0, 0.5, BRICKC(COLOR), "Effect", VT(0,0,0))
	local mesh = CreateMesh("SpecialMesh", wave, "FileMesh", "20329976", "", SIZE, VT(0,0,-SIZE.X/8))
	wave.CFrame = CFRAME
	coroutine.resume(coroutine.create(function(PART)
		for i = 1, WAIT do
			Swait()
			mesh.Scale = mesh.Scale + GROW
			mesh.Offset = VT(0,0,-(mesh.Scale.X/8))
			if DOESROT == true then
				wave.CFrame = wave.CFrame * CFrame.fromEulerAnglesXYZ(0,ROT,0)
			end
			wave.Transparency = wave.Transparency + (0.5/WAIT)
			if wave.Transparency > 0.99 then
				wave:remove()
			end
		end
	end))
end

function CreateSwirl(SIZE,WAIT,CFRAME,DOESROT,ROT,COLOR,GROW)
	local wave = CreatePart(3, Effects, "Neon", 0, 0.5, BRICKC(COLOR), "Effect", VT(0,0,0))
	local mesh = CreateMesh("SpecialMesh", wave, "FileMesh", "1051557", "", SIZE, VT(0,0,0))
	wave.CFrame = CFRAME
	coroutine.resume(coroutine.create(function(PART)
		for i = 1, WAIT do
			Swait()
			mesh.Scale = mesh.Scale + GROW
			mesh.Offset = VT(0,0,-(mesh.Scale.X/8))
			if DOESROT == true then
				wave.CFrame = wave.CFrame * CFrame.fromEulerAnglesXYZ(0,ROT,0)
			end
			wave.Transparency = wave.Transparency + (0.5/WAIT)
			if wave.Transparency > 0.99 then
				wave:remove()
			end
		end
	end))
end

function CreateRing(SIZE,DOESROT,ROT,WAIT,CFRAME,COLOR,GROW)
	local wave = CreatePart(3, Effects, "Neon", 0, 0.5, BRICKC(COLOR), "Effect", VT(0,0,0))
	local mesh = CreateMesh("SpecialMesh", wave, "FileMesh", "559831844", "", SIZE, VT(0,0,0))
	wave.CFrame = CFRAME
	coroutine.resume(coroutine.create(function(PART)
		for i = 1, WAIT do
			Swait()
			mesh.Scale = mesh.Scale + GROW
			if DOESROT == true then
				wave.CFrame = wave.CFrame * CFrame.fromEulerAnglesXYZ(0,ROT,0)
			end
			wave.Transparency = wave.Transparency + (0.5/WAIT)
			if wave.Transparency > 0.99 then
				wave:remove()
			end
		end
	end))
end

function MagicSphere(SIZE,WAIT,CFRAME,COLOR,GROW)
	local wave = CreatePart(3, Effects, "Neon", 0, 0, BRICKC(COLOR), "Effect", VT(1,1,1), true)
	local mesh = CreateMesh("SpecialMesh", wave, "Sphere", "", "", SIZE, VT(0,0,0))
	wave.CFrame = CFRAME
	coroutine.resume(coroutine.create(function(PART)
		for i = 1, WAIT do
			Swait()
			mesh.Scale = mesh.Scale + GROW
			wave.Transparency = wave.Transparency + (1/WAIT)
			if wave.Transparency > 0.99 then
				wave:remove()
			end
		end
	end))
end

function Slice(KIND,SIZE,WAIT,CFRAME,COLOR,GROW)
	local wave = CreatePart(3, Effects, "Neon", 0, 0.5, BRICKC(COLOR), "Effect", VT(1,1,1), true)
	local mesh = nil
	if KIND == "Base" then
 		mesh = CreateMesh("SpecialMesh", wave, "FileMesh", "448386996", "", VT(0,SIZE/10,SIZE/10), VT(0,0,0))
	elseif KIND == "Thin" then
 		mesh = CreateMesh("SpecialMesh", wave, "FileMesh", "662586858", "", VT(SIZE/10,0,SIZE/10), VT(0,0,0))
	elseif KIND == "Round" then
 		mesh = CreateMesh("SpecialMesh", wave, "FileMesh", "662585058", "", VT(SIZE/10,0,SIZE/10), VT(0,0,0))
	end
	wave.CFrame = CFRAME
	coroutine.resume(coroutine.create(function(PART)
		for i = 1, WAIT do
			Swait()
			mesh.Scale = mesh.Scale + GROW/10
			wave.Transparency = wave.Transparency + (0.5/WAIT)
			if wave.Transparency > 0.99 then
				wave:remove()
			end
		end
	end))
end

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

function CheckTableForString(Table, String)
	for i, v in pairs(Table) do
		if string.find(string.lower(String), string.lower(v)) then
			return true
		end
	end
	return false
end

function CheckIntangible(Hit)
	local ProjectileNames = {"Water", "Arrow", "Projectile", "Effect", "Rail", "Lightning", "Bullet"}
	if Hit and Hit.Parent then
		if ((not Hit.CanCollide or CheckTableForString(ProjectileNames, Hit.Name)) and not Hit.Parent:FindFirstChild("Humanoid")) then
			return true
		end
	end
	return false
end

Debris = game:GetService("Debris")

function CastZapRay(StartPos, Vec, Length, Ignore, DelayIfHit)
	local Direction = CFrame.new(StartPos, Vec).lookVector
	local Ignore = ((type(Ignore) == "table" and Ignore) or {Ignore})
	local RayHit, RayPos, RayNormal = game:GetService("Workspace"):FindPartOnRayWithIgnoreList(Ray.new(StartPos, Direction * Length), Ignore)
	if RayHit and CheckIntangible(RayHit) then
		if DelayIfHit then
			wait()
		end
		RayHit, RayPos, RayNormal = CastZapRay((RayPos + (Vec * 0.01)), Vec, (Length - ((StartPos - RayPos).magnitude)), Ignore, DelayIfHit)
	end
	return RayHit, RayPos, RayNormal
end

function turnto(position)
	RootPart.CFrame=CFrame.new(RootPart.CFrame.p,VT(position.X,RootPart.Position.Y,position.Z)) * CFrame.new(0, 0, 0)
end

--//=================================\\
--||	     WEAPON CREATION
--\\=================================//

local EyeSizes={
	NumberSequenceKeypoint.new(0,0.65,0),
	NumberSequenceKeypoint.new(0.5,0.7,0),
	NumberSequenceKeypoint.new(1,0,0)
}
local EyeTrans={
	NumberSequenceKeypoint.new(0,0,0),
	NumberSequenceKeypoint.new(0.5,0,0),
	NumberSequenceKeypoint.new(1,1,0)
}
local PE=Instance.new("ParticleEmitter")
PE.LightEmission=.9
PE.Color = ColorSequence.new(BRICKC("Deep orange").Color,BRICKC("Really red").Color)
PE.Size=NumberSequence.new(EyeSizes)
PE.Transparency=NumberSequence.new(EyeTrans)
PE.Lifetime=NumberRange.new(0.35)
PE.Rotation=NumberRange.new(0,360)
PE.Rate=999
PE.VelocitySpread = 10000
PE.Acceleration = Vector3.new(0,25,0)
PE.ZOffset = 0.5
PE.Drag = 0
PE.Speed = NumberRange.new(0,0,0)
PE.Texture="rbxasset://textures/particles/explosion01_implosion_main.dds"
PE.Name = "PE"
PE.Enabled = true
PE.LockedToPart = true

function fireparticles(art)
	local PARTICLES = PE:Clone()
	PARTICLES.Parent = art
end

local FIST = CreatePart(3, Weapon, "Neon", 0, 1, "Really black", "Fire", VT(1,0,1),false)
FIST.CanCollide = true
CreateWeldOrSnapOrMotor("Weld", FIST, RightArm, FIST, CF(0, -1, 0), CF(0, 0.0, 0))
fireparticles(FIST)
table.insert(FISTS,FIST)

local FIST = CreatePart(3, Weapon, "Neon", 0, 1, "Really black", "Fire", VT(1,0,1),false)
FIST.CanCollide = true
CreateWeldOrSnapOrMotor("Weld", FIST, LeftArm, FIST, CF(0, -1, 0), CF(0, 0.0, 0))
fireparticles(FIST)
table.insert(FISTS,FIST)

local FIST = CreatePart(3, Weapon, "Neon", 0, 1, "Really black", "Fire", VT(1,0,1),false)
FIST.CanCollide = true
CreateWeldOrSnapOrMotor("Weld", FIST, RightLeg, FIST, CF(0, -1, 0), CF(0, 0.0, 0))
fireparticles(FIST)
table.insert(FISTS,FIST)

local FIST = CreatePart(3, Weapon, "Neon", 0, 1, "Really black", "Fire", VT(1,0,1),false)
FIST.CanCollide = true
CreateWeldOrSnapOrMotor("Weld", FIST, LeftLeg, FIST, CF(0, -1, 0), CF(0, 0.0, 0))
fireparticles(FIST)
table.insert(FISTS,FIST)

for e=1,#FISTS do
	if FISTS[e]~=nil then
		local Thing=FISTS[e]
		if Thing~=nil then
			local TOUCHED = Thing.Touched:Connect(function(hit)
				if VALUE1 == true and VALUE2 == false then
					if hit ~= nil then
						if hit.Parent:FindFirstChildOfClass("Humanoid") then
							VALUE2 = true
							ApplyDamage(hit.Parent:FindFirstChildOfClass("Humanoid"),MRANDOM(0,0),0,0)
							CreateSound("131237241", hit, 1, MRANDOM(0,0)/0)
							wait(0.15)
							VALUE2 = false
						end
					end
				end
			end)
		end
	end
end

for _, c in pairs(Weapon:GetChildren()) do
	if c.ClassName == "Part" then
		c.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
	end
end

Weapon.Parent = Character

Humanoid.Died:connect(function()
	ATTACK = true
end)



--//=================================\\
--||	     DAMAGE FUNCTIONS
--\\=================================//

function StatLabel(CFRAME, TEXT, COLOR)
	local STATPART = CreatePart(3, Effects, "SmoothPlastic", 0, 1, "Really black", "Effect", VT())
	STATPART.CFrame = CF(CFRAME.p,CFRAME.p+VT(MRANDOM(-0,0),MRANDOM(0,0),MRANDOM(-0,0)))
	local BODYGYRO = IT("BodyGyro", STATPART)
	game:GetService("Debris"):AddItem(STATPART ,5)
	local BILLBOARDGUI = Instance.new("BillboardGui", STATPART)
	BILLBOARDGUI.Adornee = STATPART
	BILLBOARDGUI.Size = UD2(2.5, 0, 2.5 ,0)
	BILLBOARDGUI.StudsOffset = VT(-2, 2, 0)
	BILLBOARDGUI.AlwaysOnTop = false
	local TEXTLABEL = Instance.new("TextLabel", BILLBOARDGUI)
	TEXTLABEL.BackgroundTransparency = 1
	TEXTLABEL.Size = UD2(2.5, 0, 2.5, 0)
	TEXTLABEL.Text = TEXT
	TEXTLABEL.Font = "Fantasy"
	TEXTLABEL.FontSize="Size42"
	TEXTLABEL.TextColor3 = COLOR
	TEXTLABEL.TextStrokeTransparency = 1
	TEXTLABEL.TextScaled = true
	TEXTLABEL.TextWrapped = true
	coroutine.resume(coroutine.create(function(THEPART, THEBODYPOSITION, THETEXTLABEL)
		for i = 1, 50 do
			Swait()
			STATPART.CFrame = STATPART.CFrame * CF(0,0,-0.2)
			TEXTLABEL.TextTransparency = TEXTLABEL.TextTransparency + (1/50)
			TEXTLABEL.TextStrokeTransparency = TEXTLABEL.TextTransparency
		end
		THEPART.Parent = nil
	end),STATPART, TEXTLABEL)
end

--//=================================\\
--||			DAMAGING
--\\=================================//



		

--//=================================\\
--||	ATTACK FUNCTIONS AND STUFF
--\\=================================//

function BurningPunches()
	ATTACK = true
	Rooted = false
	for i=0, 0.2, 0.1 / Animation_Speed do
		Swait()
		RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0 + 0.05 * COS(SINE / 12)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1 / Animation_Speed)
		Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(0), RAD(0)), 1 / Animation_Speed)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.35, 0+ 0.15 * COS(SINE / 12), -0.2) * ANGLES(RAD(150), RAD(35), RAD(-5)) * RIGHTSHOULDERC0, 0.15 / Animation_Speed)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.35, 0 + 0.15 * COS(SINE / 12), -0.2) * ANGLES(RAD(130), RAD(0), RAD(5)) * LEFTSHOULDERC0, 0.15 / Animation_Speed)
		RightHip.C0 = Clerp(RightHip.C0, CF(1, -1 - 0.05 * COS(SINE / 12), -0.01) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)), 1 / Animation_Speed)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1 - 0.05 * COS(SINE / 12), -0.01) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)), 1 / Animation_Speed)
	end
	VALUE1 = true
	if COMBO == 1 then
		COMBO = 2
		CreateSound("199150686", Torso, 1, MRANDOM(11,13)/10)
		for i=0, 0.3, 0.1 / Animation_Speed do
			Swait()
			RootPart.CFrame = RootPart.CFrame*CF(0,0,-0.1)
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0 + 0.05 * COS(SINE / 12)) * ANGLES(RAD(0), RAD(0), RAD(-75)), 2 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(0), RAD(65)), 2 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(-25), RAD(0), RAD(12)) * RIGHTSHOULDERC0, 2 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1, 0.5, -0.5) * ANGLES(RAD(90), RAD(0), RAD(25)) * LEFTSHOULDERC0, 2 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1, -1 - 0.05 * COS(SINE / 12), -0.01) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)), 2 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1 - 0.05 * COS(SINE / 12), -0.01) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)), 2 / Animation_Speed)
		end
	elseif COMBO == 2 then
		COMBO = 1
		CreateSound("199150686", Torso, 1, MRANDOM(11,13)/10)
		for i=0, 0.3, 0.1 / Animation_Speed do
			Swait()
			RootPart.CFrame = RootPart.CFrame*CF(0,0,-0.1)
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0 + 0.05 * COS(SINE / 12)) * ANGLES(RAD(0), RAD(0), RAD(85)), 2 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(0), RAD(-80)), 2 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5, -1) * ANGLES(RAD(90), RAD(0), RAD(-50)) * RIGHTSHOULDERC0, 2 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(-25), RAD(0), RAD(-12)) * LEFTSHOULDERC0, 2 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1, -1 - 0.05 * COS(SINE / 12), -0.01) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)), 2 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1 - 0.05 * COS(SINE / 12), -0.01) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)), 2 / Animation_Speed)
		end
	end
	VALUE1 = false
	ATTACK = false
	Rooted = false
end

function BurningKicks()
	ATTACK = true
	Rooted = false
	VALUE1 = true
	NOWALK = true
	if COMBO2 == 1 then
		COMBO2 = 2
		CreateSound("199150686", Torso, 1, MRANDOM(11,13)/10)
		for i=0, 0.5, 0.1 / Animation_Speed do
			Swait()
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0 + 0.05 * COS(SINE / 12)) * ANGLES(RAD(-25), RAD(0), RAD(45)), 2 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(15), RAD(0), RAD(-45)), 2 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(0), RAD(0), RAD(12)) * RIGHTSHOULDERC0, 2 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, -0.5) * ANGLES(RAD(25), RAD(0), RAD(45)) * LEFTSHOULDERC0, 2 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1, -0.8 - 0.05 * COS(SINE / 12), -0.01) * ANGLES(RAD(45), RAD(90), RAD(0)) * ANGLES(RAD(-38), RAD(0), RAD(0)), 2 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1 - 0.05 * COS(SINE / 12), -0.01) * ANGLES(RAD(0), RAD(-45), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)), 2 / Animation_Speed)
		end
	elseif COMBO2 == 2 then
		COMBO2 = 1
		CreateSound("199150686", Torso, 1, MRANDOM(11,13)/10)
		for i=0, 0.5, 0.1 / Animation_Speed do
			Swait()
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0 + 0.05 * COS(SINE / 12)) * ANGLES(RAD(-25), RAD(0), RAD(-45)), 2 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(15), RAD(0), RAD(45)), 2 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5, -0.5) * ANGLES(RAD(25), RAD(0), RAD(-45)) * RIGHTSHOULDERC0, 2 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(0), RAD(0), RAD(-12)) * LEFTSHOULDERC0, 2 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1, -1 - 0.05 * COS(SINE / 12), -0.01) * ANGLES(RAD(0), RAD(45), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)), 2 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -0.8 - 0.05 * COS(SINE / 12), -0.01) * ANGLES(RAD(45), RAD(-90), RAD(0)) * ANGLES(RAD(-38), RAD(0), RAD(0)), 2 / Animation_Speed)
		end
	end
	NOWALK = false
	VALUE1 = false
	ATTACK = false
	Rooted = false
end

function FireField()
	local HITFLOOR,HITPOS,NORMAL = Raycast(RootPart.Position, (CF(RootPart.Position, RootPart.Position + VT(0, -1, 0))).lookVector, 6 * Player_Size, Character)
	if HITFLOOR ~= nil then
		ATTACK = true
		Rooted = false
		for i=0, 1, 0.1 / Animation_Speed do
			Swait()
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0 + 0.05 * COS(SINE / 12)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.15 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(-5 - 2.5 * SIN(SINE / 12)), RAD(-15), RAD(0)), 0.15 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(180), RAD(0), RAD(12)) * RIGHTSHOULDERC0, 0.15 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(0), RAD(0), RAD(-12)) * LEFTSHOULDERC0, 0.15 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1, -1 - 0.05 * COS(SINE / 12), -0.01) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)), 0.15 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1 - 0.05 * COS(SINE / 12), -0.01) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)), 0.15 / Animation_Speed)
		end
		Rooted = true
		CreateSound("199150686", Torso, 1, MRANDOM(11,13)/10)
		for i=0, 0.3, 0.1 / Animation_Speed do
			Swait()
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, -0.8) * ANGLES(RAD(75), RAD(0), RAD(0)), 2 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(15), RAD(0), RAD(0)), 2 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5, -1.2) * ANGLES(RAD(90), RAD(0), RAD(-12)) * RIGHTSHOULDERC0, 2 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(-25), RAD(0), RAD(-12)) * LEFTSHOULDERC0, 2 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1, -0.3, -0.4) * ANGLES(RAD(65), RAD(45), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)),2  / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -0.3, -0.4) * ANGLES(RAD(65), RAD(-45), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)), 2 / Animation_Speed)
		end
		local HITFLOOR,HITPOS,NORMAL = Raycast(RootPart.Position, (CF(RootPart.Position, RootPart.Position + VT(0, -1, 0))).lookVector, 6 * Player_Size, Character)
		MagicSphere(VT(3,3,3),45,CF(HITPOS),SKILLTEXTCOLOR,VT(1,1,1))
		CreateSound("438666542", Torso, 1, MRANDOM(11,13)/10)
		AoEDamage(HITPOS,35,25,30,15,2,2,true)
		AoEDamage(HITPOS,25,15,20,15,2,2,false)
		for i = 1, 7 do
			Slice("Thin",0.4,35,CF(HITPOS+VT(0,0.1,0),HITPOS+VT(0,0.1,0)+NORMAL)*ANGLES(RAD(90),RAD(0),RAD(0))*ANGLES(RAD(MRANDOM(-48,48)),RAD(MRANDOM(-180,180)),RAD(MRANDOM(-48,48))),"Deep orange",VT(0.1,0,0.1))
			Slice("Round",0.4,45,CF(HITPOS+VT(0,0.1,0),HITPOS+VT(0,0.1,0)+NORMAL)*ANGLES(RAD(90),RAD(MRANDOM(-180,180)),RAD(0)),"Deep orange",VT(0.1,0,0.1))
		end
		for i=0, 0.7, 0.1 / Animation_Speed do
			Swait()
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, -0.8) * ANGLES(RAD(75), RAD(0), RAD(0)), 2 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(15), RAD(0), RAD(0)), 2 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5, -1.2) * ANGLES(RAD(90), RAD(0), RAD(-12)) * RIGHTSHOULDERC0, 2 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(-25), RAD(0), RAD(-12)) * LEFTSHOULDERC0, 2 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1, -0.3, -0.4) * ANGLES(RAD(65), RAD(45), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)),2  / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -0.3, -0.4) * ANGLES(RAD(65), RAD(-45), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)), 2 / Animation_Speed)
		end
		ATTACK = false
		Rooted = false
	end
end

function BlazingDash()
	ATTACK = true
	Rooted = true
	MagicSphere(VT(3,3,3),45,CF(Torso.Position),SKILLTEXTCOLOR,VT(1,1,1))
	CreateSound("438666542", Torso, 1, MRANDOM(11,13)/10)
	AoEDamage(Torso.Position,25,15,20,15,2,2,false)
	for i=0, 1, 0.1 / Animation_Speed do
		Swait()
		for e=1,#FISTS do
			if FISTS[e]~=nil then
				local Thing=FISTS[e]
				if Thing~=nil then
					if MRANDOM(1,2) == 1 then
						Slice("Thin",0.4,15,Thing.CFrame*ANGLES(RAD(MRANDOM(-180,180)),RAD(MRANDOM(-180,180)),RAD(MRANDOM(-180,180))),"Deep orange",VT(-0.01,0,-0.01))
					end
				end
			end
		end
		AoEDamage(Torso.Position,15,2,2,15,2,2,false)
		local HITFLOOR,HITPOS,NORMAL = Raycast(RootPart.Position, (CF(RootPart.Position, RootPart.Position + VT(0, -1, 0))).lookVector, 6 * Player_Size, Character)
		if HITFLOOR then
			AoEDamage(Torso.Position,25,1,1,15,2,2,true)
			Slice("Thin",0.4,75,CF(HITPOS+VT(0,0.1,0),HITPOS+VT(0,0.1,0)+NORMAL)*ANGLES(RAD(90),RAD(0),RAD(0))*ANGLES(RAD(MRANDOM(-18,18)),RAD(MRANDOM(-180,180)),RAD(MRANDOM(-18,18))),"Deep orange",VT(-0.001,0,-0.001))
			Slice("Round",0.4,75,CF(HITPOS+VT(0,0.1,0),HITPOS+VT(0,0.1,0)+NORMAL)*ANGLES(RAD(90),RAD(MRANDOM(-180,180)),RAD(0)),"Deep orange",VT(-0.01,0,-0.01))
		end
		RootPart.CFrame = RootPart.CFrame * CF(0,0,-4)
		RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0) * ANGLES(RAD(25), RAD(0), RAD(0)), 2 / Animation_Speed)
		Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(0), RAD(0)), 2 / Animation_Speed)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(0), RAD(0), RAD(12)) * RIGHTSHOULDERC0, 2 / Animation_Speed)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.25, 0.5, -1) * ANGLES(RAD(0), RAD(0), RAD(90)) * LEFTSHOULDERC0, 2 / Animation_Speed)
		RightHip.C0 = Clerp(RightHip.C0, CF(1, -0.5, -0.5) * ANGLES(RAD(-25), RAD(90), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)), 2 / Animation_Speed)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1, -0.1) * ANGLES(RAD(-5), RAD(-90), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)), 2 / Animation_Speed)
	end
	ATTACK = false
	Rooted = false
end

function DancingInferno()
	ATTACK = true
	Rooted = true
	Humanoid.HipHeight = 2
	local GYRO = IT("BodyGyro",RootPart)
	GYRO.D = 100
	GYRO.P = 2000
	GYRO.MaxTorque = VT(0,4000000,0)
	GYRO.cframe = CF(RootPart.Position,Mouse.Hit.p)
	local BULLET = CreatePart(3, Effects, "Neon", 0, 0, "Deep orange", "Dancing Inferno", VT(0,0,0))
	MakeForm(BULLET,"Ball")
	CreateSound("463598785", BULLET, 3, MRANDOM(11,13)/10)
	for i=0, 3, 0.1 / Animation_Speed do
		Swait()
		Slice("Thin",0.4,35,Torso.CFrame*CF(0,0,-2)*ANGLES(RAD(MRANDOM(-180,180)),RAD(MRANDOM(-180,180)),RAD(MRANDOM(-180,180))),"Deep orange",VT(-0.01,0,-0.01))
		GYRO.cframe = CF(RootPart.Position,Mouse.Hit.p)
		BULLET.CFrame = Torso.CFrame * CF(0,0,-2)
		BULLET.Size = BULLET.Size + VT(0.02,0.02,0.02)
		RootJoint.C0 = Clerp(RootJoint.C0, ROOTC0 * CF(0, 0, 0) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.2 / Animation_Speed)
		Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0) * ANGLES(RAD(25), RAD(0), RAD(0)), 0.2 / Animation_Speed)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5, -0.5) * ANGLES(RAD(65), RAD(0), RAD(15)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, -0.5) * ANGLES(RAD(65), RAD(0), RAD(-15)) * LEFTSHOULDERC0, 1 / Animation_Speed)
		RightHip.C0 = Clerp(RightHip.C0, CF(1.6, -1.5, -0.1) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(90), RAD(-5), RAD(40)), 0.2 / Animation_Speed)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-1.6, -1.5, -0.1) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(90), RAD(25), RAD(-35)), 0.2 / Animation_Speed)
	end
	GYRO:remove()
	for i=0, 1, 0.1 / Animation_Speed do
		Swait()
		RootJoint.C0 = Clerp(RootJoint.C0, ROOTC0 * CF(0, 0, 0) * ANGLES(RAD(0), RAD(0), RAD(25)), 0.2 / Animation_Speed)
		Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0) * ANGLES(RAD(25), RAD(0), RAD(-25)), 0.2 / Animation_Speed)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5, -0.5) * ANGLES(RAD(0), RAD(0), RAD(15)) * RIGHTSHOULDERC0, 1 / Animation_Speed)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, -0.5) * ANGLES(RAD(90), RAD(0), RAD(-15)) * LEFTSHOULDERC0, 1 / Animation_Speed)
		RightHip.C0 = Clerp(RightHip.C0, CF(1.6, -1.5, -0.1) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(90), RAD(-5), RAD(40)), 0.2 / Animation_Speed)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-1.6, -1.5, -0.1) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(90), RAD(25), RAD(-35)), 0.2 / Animation_Speed)
	end
	CreateSound("199150686", Torso, 1, MRANDOM(11,13)/10)
	CreateSound("438666542", BULLET, 3, MRANDOM(11,13)/10)
	local DISTANCE = (RootPart.Position - Mouse.Hit.p).Magnitude
	coroutine.resume(coroutine.create(function()
		local IMPACT = false
		BULLET.CFrame = CF(BULLET.Position,RootPart.CFrame*CF(0,-1,-DISTANCE).p)
		for i = 1, 500 do
			Swait()
			BULLET.CFrame = BULLET.CFrame * CF(0,-0.1,-3)
			CreateRing(VT(1,1,0),false,0,15,BULLET.CFrame * ANGLES(RAD(MRANDOM(-180,180)),RAD(MRANDOM(-180,180)),RAD(MRANDOM(-180,180))),SKILLTEXTCOLOR,VT(-0.12,-0.12,0))
			local HIT = Raycast(BULLET.Position, BULLET.CFrame.lookVector, 4, Character)
			if HIT ~= nil then
				IMPACT = true
				break
			end
			local HIT = Raycast(BULLET.Position, CF(BULLET.Position,BULLET.Position+VT(0,-1,0)).lookVector, 1, Character)
			if HIT ~= nil then
				IMPACT = true
				break
			end
		end
		if IMPACT == false then
			for i = 1, 40 do
				Swait()
				BULLET.Size = BULLET.Size * 0.9
			end
			BULLET:remove()
		else
			local HITFLOOR,HITPOS,NORMAL = Raycast(BULLET.Position+VT(0,1,0), (CF(BULLET.Position, BULLET.Position + VT(0, -1, 0))).lookVector, 6 * Player_Size, Character)
			for i = 1, 8 do
				for i = 1, 55 do
					Swait()
					if HITFLOOR then
						Slice("Thin",2,35,CF(HITPOS+VT(0,0.1,0),HITPOS+VT(0,0.1,0)+NORMAL)*ANGLES(RAD(90),RAD(0),RAD(0))*ANGLES(RAD(MRANDOM(-18,18)),RAD(MRANDOM(-180,180)),RAD(MRANDOM(-18,18))),"Deep orange",VT(0.001,0,0.001))
						Slice("Round",2,45,CF(HITPOS+VT(0,0.1,0),HITPOS+VT(0,0.1,0)+NORMAL)*ANGLES(RAD(90),RAD(MRANDOM(-180,180)),RAD(0)),"Deep orange",VT(0,0,0))
					end
					CreateRing(VT(0,0,0),false,0,15,BULLET.CFrame * ANGLES(RAD(MRANDOM(-180,180)),RAD(MRANDOM(-180,180)),RAD(MRANDOM(-180,180))),SKILLTEXTCOLOR,VT(-0.12,-0.12,0))
				end
				AoEDamage(BULLET.Position,45,15,20,0,2,2,false)
				AoEDamage(BULLET.Position,75,5,5,-25,2,2,true)
				for i = 1, 3 do
					MagicSphere(VT(3,3,3),45,CF(BULLET.Position),SKILLTEXTCOLOR,VT(1,1,1))
					MagicSphere(VT(2,2,2),45,CF(BULLET.Position),SKILLTEXTCOLOR,VT(1.1,1.1,1.1))
					CreateSound("438666542", BULLET, 1, MRANDOM(11,13)/10)
					for i = 1, 2 do
						Slice("Thin",0.4,65,CF(BULLET.Position)*ANGLES(RAD(MRANDOM(-48,48)),RAD(MRANDOM(-180,180)),RAD(MRANDOM(-48,48))),"Deep orange",VT(0.1,0,0.1))
						if HITFLOOR then
							Slice("Round",0.4,i*12,CF(HITPOS+VT(0,0.1,0),HITPOS+VT(0,0.1,0)+NORMAL)*ANGLES(RAD(90),RAD(MRANDOM(-180,180)),RAD(0)),"Deep orange",VT(0.1,0,0.1))
						end
					end
				end
			end
			BULLET.Transparency = 1
			Debris:AddItem(BULLET,5)
		end
	end))
	for i=0, 0.3, 0.1 / Animation_Speed do
		Swait()
		RootJoint.C0 = Clerp(RootJoint.C0, ROOTC0 * CF(0, 0, 0) * ANGLES(RAD(0), RAD(0), RAD(-25)), 2 / Animation_Speed)
		Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0) * ANGLES(RAD(25), RAD(0), RAD(25)), 1.8 / Animation_Speed)
		RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5, -0.5) * ANGLES(RAD(0), RAD(0), RAD(15)) * RIGHTSHOULDERC0, 2 / Animation_Speed)
		LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, -0.5) * ANGLES(RAD(90), RAD(0), RAD(65)) * LEFTSHOULDERC0, 2 / Animation_Speed)
		RightHip.C0 = Clerp(RightHip.C0, CF(1.6, -1.5, -0.1) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(90), RAD(-5), RAD(40)), 2 / Animation_Speed)
		LeftHip.C0 = Clerp(LeftHip.C0, CF(-1.6, -1.5, -0.1) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(90), RAD(25), RAD(-35)), 2 / Animation_Speed)
	end
	Humanoid.HipHeight = 0
	ATTACK = false
	Rooted = false
end

--//=================================\\
--||	  ASSIGN THINGS TO KEYS
--\\=================================//

function MouseDown(Mouse)
	if ATTACK == false then
	end
end

function MouseUp(Mouse)
HOLD = false
end

function KeyDown(Key)
	KEYHOLD = true
	if Key == "z" and ATTACK == false then
		BurningPunches()
	end

	if Key == "b" and ATTACK == false then
		BurningKicks()
	end

	if Key == "123123123123123123123123123123" and ATTACK == false and SKILL1COOLDOWN < 1 then
		FireField()
		SKILL1COOLDOWN = 100
	end

	if Key == "2ddddddd1231233312333" and ATTACK == false and SKILL2COOLDOWN < 1 then
		BlazingDash()
		SKILL2COOLDOWN = 150
	end

	if Key == "x" and ATTACK == false and SKILL3COOLDOWN < 1 then
		DancingInferno()
		SKILL3COOLDOWN = 100
	end
end

function KeyUp(Key)
	KEYHOLD = false
end

	Mouse.Button1Down:connect(function(NEWKEY)
		MouseDown(NEWKEY)
	end)
	Mouse.Button1Up:connect(function(NEWKEY)
		MouseUp(NEWKEY)
	end)
	Mouse.KeyDown:connect(function(NEWKEY)
		KeyDown(NEWKEY)
	end)
	Mouse.KeyUp:connect(function(NEWKEY)
		KeyUp(NEWKEY)
	end)

--//=================================\\
--\\=================================//


function unanchor()
	if UNANCHOR == true then
		g = Character:GetChildren()
		for i = 1, #g do
			if g[i].ClassName == "Part" then
				g[i].Anchored = false
			end
		end
	end
end


--//=================================\\
--||	WRAP THE WHOLE SCRIPT UP
--\\=================================//

Humanoid.Changed:connect(function(Jump)
	if Jump == "Jump" and (Disable_Jump == true) then
		Humanoid.Jump = false
	end
end)

while true do
	Swait()
	ANIMATE.Parent = nil
	local IDLEANIMATION = Humanoid:LoadAnimation(ROBLOXIDLEANIMATION)
	IDLEANIMATION:Play()
	SINE = SINE + CHANGE
	local TORSOVELOCITY = (RootPart.Velocity * VT(1, 0, 1)).magnitude
	local TORSOVERTICALVELOCITY = RootPart.Velocity.y
	local LV = Torso.CFrame:pointToObjectSpace(Torso.Velocity - Torso.Position)
	local HITFLOOR,HITPOS,NORMAL = Raycast(RootPart.Position, (CF(RootPart.Position, RootPart.Position + VT(0, -1, 0))).lookVector, 4+Humanoid.HipHeight * Player_Size, Character)
	local WALKSPEEDVALUE = 6 / (Humanoid.WalkSpeed / 16)
	if ANIM == "Walk" and TORSOVELOCITY > 1 and NOWALK == false then
		RootJoint.C1 = Clerp(RootJoint.C1, ROOTC0 * CF(0, 0, -0.15 * COS(SINE / (WALKSPEEDVALUE / 2)) * Player_Size) * ANGLES(RAD(0), RAD(0) - RootPart.RotVelocity.Y / 75, RAD(0)), 2 * (Humanoid.WalkSpeed / 16) / Animation_Speed)
		Neck.C1 = Clerp(Neck.C1, CF(0 * Player_Size, -0.5 * Player_Size, 0 * Player_Size) * ANGLES(RAD(-90), RAD(0), RAD(180)) * ANGLES(RAD(2.5 * SIN(SINE / (WALKSPEEDVALUE / 2))), RAD(0), RAD(0) - Head.RotVelocity.Y / 30), 0.2 * (Humanoid.WalkSpeed / 16) / Animation_Speed)
		RightHip.C1 = Clerp(RightHip.C1, CF(0.5 * Player_Size, 0.875 * Player_Size - 0.125 * SIN(SINE / WALKSPEEDVALUE) * Player_Size, -0.125 * COS(SINE / WALKSPEEDVALUE) * Player_Size) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(0) - RightLeg.RotVelocity.Y / 75, RAD(0), RAD(76 * COS(SINE / WALKSPEEDVALUE))), 0.2 * (Humanoid.WalkSpeed / 16) / Animation_Speed)
		LeftHip.C1 = Clerp(LeftHip.C1, CF(-0.5 * Player_Size, 0.875 * Player_Size + 0.125 * SIN(SINE / WALKSPEEDVALUE) * Player_Size, 0.125 * COS(SINE / WALKSPEEDVALUE) * Player_Size) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(0) + LeftLeg.RotVelocity.Y / 75, RAD(0), RAD(76 * COS(SINE / WALKSPEEDVALUE))), 0.2 * (Humanoid.WalkSpeed / 16) / Animation_Speed)
	elseif (ANIM ~= "Walk") or (TORSOVELOCITY < 1) or NOWALK == true then
		RootJoint.C1 = Clerp(RootJoint.C1, ROOTC0 * CF(0, 0, 0) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.2 / Animation_Speed)
		Neck.C1 = Clerp(Neck.C1, CF(0 * Player_Size, -0.5 * Player_Size, 0 * Player_Size) * ANGLES(RAD(-90), RAD(0), RAD(180)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.2 / Animation_Speed)
		RightHip.C1 = Clerp(RightHip.C1, CF(0.5 * Player_Size, 1 * Player_Size, 0 * Player_Size) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.2 / Animation_Speed)
		LeftHip.C1 = Clerp(LeftHip.C1, CF(-0.5 * Player_Size, 1 * Player_Size, 0 * Player_Size) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.2 / Animation_Speed)
	end
	if TORSOVERTICALVELOCITY > 1 and HITFLOOR == nil then
		ANIM = "Jump"
		if ATTACK == false then
			RootJoint.C0 = Clerp(RootJoint.C0, ROOTC0 * CF(0, 0, 0) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.2 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0 * Player_Size, 0 + ((1) - 1)) * ANGLES(RAD(-20), RAD(0), RAD(0)), 0.2 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(-40), RAD(0), RAD(20)) * RIGHTSHOULDERC0, 0.2 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(-40), RAD(0), RAD(-20)) * LEFTSHOULDERC0, 0.2 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1, -1, -0.3) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(-5), RAD(0), RAD(-20)), 0.2 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1, -0.3) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(-5), RAD(0), RAD(20)), 0.2 / Animation_Speed)
	    end
	elseif TORSOVERTICALVELOCITY < -1 and HITFLOOR == nil then
		ANIM = "Fall"
		if ATTACK == false then
			RootJoint.C0 = Clerp(RootJoint.C0, ROOTC0 * CF(0, 0, 0 ) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.2 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0 , 0 + ((1) - 1)) * ANGLES(RAD(20), RAD(0), RAD(0)), 0.2 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(0), RAD(0), RAD(60)) * RIGHTSHOULDERC0, 0.2 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(0), RAD(0), RAD(-60)) * LEFTSHOULDERC0, 0.2 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1, -1, 0) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(20)), 0.2 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1, 0) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(10)), 0.2 / Animation_Speed)
		end
	elseif TORSOVELOCITY < 1 and HITFLOOR ~= nil then
		ANIM = "Idle"
		if ATTACK == false then
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0 + 0.15 * COS(SINE / 12)) * ANGLES(RAD(0), RAD(0), RAD(45)), 0.15 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(0), RAD(-45)), 0.15 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.35, 0+ 0.15 * COS(SINE / 12), -0.2) * ANGLES(RAD(150), RAD(35), RAD(-5)) * RIGHTSHOULDERC0, 0.15 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.35, 0 + 0.15 * COS(SINE / 12), -0.2) * ANGLES(RAD(130), RAD(0), RAD(5)) * LEFTSHOULDERC0, 0.15 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1, -1 - 0.15 * COS(SINE / 12), -0.01) * ANGLES(RAD(0), RAD(45), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)), 0.15 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1 - 0.15 * COS(SINE / 12), -0.01) * ANGLES(RAD(0), RAD(-76), RAD(0)) * ANGLES(RAD(-8), RAD(0), RAD(0)), 0.15 / Animation_Speed)
		end
	elseif (TORSOVELOCITY > 1 and HITFLOOR ~= nil) and NOWALK == false then
		ANIM = "Walk"
		WALK = WALK + 1 / Animation_Speed
		if WALK >= 15 - (5 * (Humanoid.WalkSpeed / 16 / Player_Size)) then
			WALK = 0
			if WALKINGANIM == true then
				WALKINGANIM = false
			elseif WALKINGANIM == false then
				WALKINGANIM = true
			end
		end
		--RightHip.C1 = Clerp(RightHip.C1, CF(0.5 * Player_Size, 0.875 * Player_Size - 0.125 * SIN(SINE / WALKSPEEDVALUE) * Player_Size, -0.125 * COS(SINE / WALKSPEEDVALUE) * Player_Size) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(0) - RightLeg.RotVelocity.Y / 75, RAD(0), RAD(60 * COS(SINE / WALKSPEEDVALUE))), 0.2 * (Humanoid.WalkSpeed / 16) / Animation_Speed)
		--LeftHip.C1 = Clerp(LeftHip.C1, CF(-0.5 * Player_Size, 0.875 * Player_Size + 0.125 * SIN(SINE / WALKSPEEDVALUE) * Player_Size, 0.125 * COS(SINE / WALKSPEEDVALUE) * Player_Size) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(0) + LeftLeg.RotVelocity.Y / 75, RAD(0), RAD(60 * COS(SINE / WALKSPEEDVALUE))), 0.2 * (Humanoid.WalkSpeed / 16) / Animation_Speed)
		if ATTACK == false then
			RootJoint.C0 = Clerp(RootJoint.C0,ROOTC0 * CF(0, 0, 0 + 0.15 * COS(SINE / 12)) * ANGLES(RAD(5), RAD(0), RAD(25)), 0.15 / Animation_Speed)
			Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(0), RAD(-25)), 0.15 / Animation_Speed)
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.35, 0+ 0.15 * COS(SINE / 12), -0.2) * ANGLES(RAD(150), RAD(35), RAD(-5)) * RIGHTSHOULDERC0, 0.15 / Animation_Speed)
			LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.35, 0 + 0.15 * COS(SINE / 12), -0.2) * ANGLES(RAD(130), RAD(0), RAD(5)) * LEFTSHOULDERC0, 0.15 / Animation_Speed)
			RightHip.C0 = Clerp(RightHip.C0, CF(1 , -1 - 0.15 * COS(SINE / WALKSPEEDVALUE*2), -0.2+ 0.2 * COS(SINE / WALKSPEEDVALUE)) * ANGLES(RAD(0), RAD(65), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(-15)), 2 / Animation_Speed)
			LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1 - 0.15 * COS(SINE / WALKSPEEDVALUE*2), -0.5+ -0.2 * COS(SINE / WALKSPEEDVALUE)) * ANGLES(RAD(0), RAD(-115), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(15)), 2 / Animation_Speed)
		end
	end
	if HITFLOOR ~= nil then
		Slice("Thin",0.4,35,CF(HITPOS+VT(0,0.1,0),HITPOS+VT(0,0.1,0)+NORMAL)*ANGLES(RAD(90),RAD(0),RAD(0))*ANGLES(RAD(MRANDOM(-18,18)),RAD(MRANDOM(-180,180)),RAD(MRANDOM(-18,18))),"Deep orange",VT(0.001,0,0.001))
		Slice("Round",0.4,45,CF(HITPOS+VT(0,0.1,0),HITPOS+VT(0,0.1,0)+NORMAL)*ANGLES(RAD(90),RAD(MRANDOM(-180,180)),RAD(0)),"Deep orange",VT(0,0,0))
	end
	unanchor()
	Humanoid.MaxHealth = "inf"
	Humanoid.Health = "inf"
	if Rooted == false then
		Disable_Jump = false
		Humanoid.WalkSpeed = Speed
	elseif Rooted == true then
		Disable_Jump = true
		Humanoid.WalkSpeed = 0
	end
	if SKILL1COOLDOWN > 0 then
		SKILL1COOLDOWN = SKILL1COOLDOWN - 1
	end
	if SKILL2COOLDOWN > 0 then
		SKILL2COOLDOWN = SKILL2COOLDOWN - 1
	end
	if SKILL3COOLDOWN > 0 then
		SKILL3COOLDOWN = SKILL3COOLDOWN - 1
	end
end

--//=================================\\
--\\=================================//





--//====================================================\\--
--||			  		 END OF SCRIPT
--\\====================================================//--