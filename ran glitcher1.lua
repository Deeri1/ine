game.Players.localPlayer.Character["MeshPartAccessory"].Name = "SwordOne"
game.Players.localPlayer.Character["MeshPartAccessory"].Name = "SwordTwo"
game.Players.localPlayer.Character["MeshPartAccessory"].Name = "SwordFive"
game.Players.localPlayer.Character["MeshPartAccessory"].Name = "SwordFour"
game.Players.localPlayer.Character["BladeMasterAccessory"].Name = "SwordThree"
game.Players.localPlayer.Character["ShadowBladeMasterAccessory"].Name = "SwordSix"

HumanDied = false
local CountSCIFIMOVIELOL = 1
function SCIFIMOVIELOL(Part0,Part1,Position,Angle)
	local AlignPos = Instance.new('AlignPosition', Part1); AlignPos.Name = "AliP_"..CountSCIFIMOVIELOL
	AlignPos.ApplyAtCenterOfMass = true;
	AlignPos.MaxForce = 5772000--67752;
	AlignPos.MaxVelocity = math.huge/9e110;
	AlignPos.ReactionForceEnabled = false;
	AlignPos.Responsiveness = 200;
	AlignPos.RigidityEnabled = false;
	local AlignOri = Instance.new('AlignOrientation', Part1); AlignOri.Name = "AliO_"..CountSCIFIMOVIELOL
	AlignOri.MaxAngularVelocity = math.huge/9e110;
	AlignOri.MaxTorque = 5772000
	AlignOri.PrimaryAxisOnly = false;
	AlignOri.ReactionTorqueEnabled = false;
	AlignOri.Responsiveness = 200;
	AlignOri.RigidityEnabled = false;
	local AttachmentA=Instance.new('Attachment',Part1); AttachmentA.Name = "Ath_"..CountSCIFIMOVIELOL
	local AttachmentB=Instance.new('Attachment',Part0); AttachmentB.Name = "Ath_"..CountSCIFIMOVIELOL
	AttachmentA.Orientation = Angle or Vector3.new(0,0,0)
	AttachmentA.Position = Position or Vector3.new(0,0,0)
	AlignPos.Attachment1 = AttachmentA;
	AlignPos.Attachment0 = AttachmentB;
	AlignOri.Attachment1 = AttachmentA;
	AlignOri.Attachment0 = AttachmentB;
	CountSCIFIMOVIELOL = CountSCIFIMOVIELOL + 1
	return {AlignPos,AlignOri,AttachmentA,AttachmentB}
end

if _G.netted ~= true then
	_G.netted = true
	coroutine.wrap(function()
		settings().Physics.PhysicsEnvironmentalThrottle = Enum.EnviromentalPhysicsThrottle.Disabled
		settings().Physics.AllowSleep = false
		game:GetService("RunService").RenderStepped:Connect(function()
			game:FindFirstChildOfClass("Players").LocalPlayer.MaximumSimulationRadius=math.pow(math.huge,math.huge)
			sethiddenproperty(game:FindFirstChildOfClass("Players").LocalPlayer,"SimulationRadius",math.huge*math.huge)
		end)
	end)()
end

game:FindFirstChildOfClass("Players").LocalPlayer["Character"].Archivable = true
local hatnameclone = {}
for _,v in next, game:FindFirstChildOfClass("Players").LocalPlayer["Character"]:GetChildren() do
	if v:IsA("Accessory") then
		if hatnameclone[v.Name] then
			if hatnameclone[v.Name] == "s" then
				hatnameclone[v.Name] = {}
			end
			table.insert(hatnameclone[v.Name],v)
		else
			hatnameclone[v.Name] = "s"
		end
	end
end
for _,v in pairs(hatnameclone) do
	if type(v) == "table" then
		local num = 1
		for _,w in pairs(v) do
			w.Name = w.Name..num
			num = num + 1
		end
	end
end
hatnameclone = nil

local DeadChar = game:FindFirstChildOfClass("Players").LocalPlayer.Character

local fldr = Instance.new("Folder",game:FindFirstChildOfClass("Players").LocalPlayer["Character"])
fldr.Name = "DMYF"
local CloneChar = DeadChar:Clone()
local ANIMATIONHERE
if CloneChar:FindFirstChild("Animate") then
	ANIMATIONHERE = CloneChar:FindFirstChild("Animate"):Clone()
	CloneChar:FindFirstChild("Animate"):Destroy()
end
if CloneChar:FindFirstChildOfClass("Folder") then CloneChar:FindFirstChildOfClass("Folder"):Destroy() end
if CloneChar.Torso:FindFirstChild("Neck") then
	local Clonessss = CloneChar.Torso:FindFirstChild("Neck"):Clone()
	Clonessss.Part0 = nil
	Clonessss.Part1 = DeadChar.Head
	Clonessss.Parent = DeadChar.Torso
end
CloneChar.Parent = fldr
CloneChar.HumanoidRootPart.CFrame = DeadChar.HumanoidRootPart.CFrame
CloneChar.Humanoid.BreakJointsOnDeath = false
CloneChar.Name = "non"
CloneChar.Humanoid.DisplayDistanceType = "None"

for _,v in next, DeadChar:GetChildren() do
	if v:IsA("Accessory") then
		local topacc = false
		if v.Handle:FindFirstChildOfClass("Weld") then v.Handle:FindFirstChildOfClass("Weld"):Destroy() end
		v.Handle.Massless = true
		v.Handle.CanCollide = false
		if v.Handle:FindFirstChildOfClass("Attachment") then
			local ath__ = v.Handle:FindFirstChildOfClass("Attachment")
			if ath__.Name == "HatAttachment" or ath__.Name == "HairAttachment" or ath__.Name == "FaceFrontAttachment" or ath__.Name == "FaceCenterAttachment" then
				topacc = ath__.Name
			end
		end
        local bv = Instance.new("BodyVelocity",v.Handle)
		bv.Velocity = Vector3.new(0,0,0)
		coroutine.wrap(function()
			if topacc then
				local allthings = SCIFIMOVIELOL(v.Handle,DeadChar.Torso,Vector3.new(0,1.5,0)+ (DeadChar.Head[topacc].Position + (v.Handle[topacc].Position*-1)),Vector3.new(0,0,0))
				local normaltop = allthings[1].Attachment1
				local alipos = allthings[1]
				local alirot = allthings[2]
				local p0 = v.Handle
				local p1 = DeadChar.Head
				alipos.Parent = CloneChar:FindFirstChild(v.Name).Handle
				alirot.Parent = CloneChar:FindFirstChild(v.Name).Handle
				while true do
					game:GetService("RunService").RenderStepped:wait()
					if HumanDied then break end
					coroutine.wrap(function()
						if alipos.Attachment1 == normaltop then
							p0.CFrame = p0.CFrame:lerp((((DeadChar.Torso.CFrame * CFrame.new(0,1.5,0)) * p1[topacc].CFrame) * p0[topacc].CFrame:inverse()),1)
						else
							v.Handle.CFrame = v.Handle.CFrame:lerp(alipos.Attachment1.Parent.CFrame * CFrame.new(alipos.Attachment1.Position) * CFrame.Angles(math.rad(alipos.Attachment1.Rotation.X),math.rad(alipos.Attachment1.Rotation.Y),math.rad(alipos.Attachment1.Rotation.Z)),1)
						end
					end)()
				end
			else
				SCIFIMOVIELOL(v.Handle,CloneChar[v.Name].Handle,Vector3.new(0,0,0),Vector3.new(0,0,0))
			end
		end)()
    end
end

local a = DeadChar.Torso
local b = DeadChar.HumanoidRootPart
local c = DeadChar.Humanoid
a.Parent = game:FindFirstChildOfClass("Workspace")
c.Parent = game:FindFirstChildOfClass("Workspace")
local told = a:Clone()
local told1 = c:Clone()
b["RootJoint"].Part0 = told
b["RootJoint"].Part1 = DeadChar.Head
a.Name = "torso"
a.Neck:Destroy()
c.Name = "Mizt Hub Best"
told.Parent = DeadChar
told1.Parent = DeadChar
DeadChar.PrimaryPart = told
told1.Health = 0
b:Destroy()
a.Parent = DeadChar
c.Parent = DeadChar
told:Destroy()
told1:Destroy()
a.Name = "Torso"

if CloneChar.Head:FindFirstChildOfClass("Decal") then CloneChar.Head:FindFirstChildOfClass("Decal").Transparency = 1 end
if DeadChar:FindFirstChild("Animate") then DeadChar:FindFirstChild("Animate"):Destroy() end

local Collider
function UnCollide()
    if HumanDied then Collider:Disconnect(); return end
    --[[for _,Parts in next, CloneChar:GetChildren() do
        if Parts:IsA("BasePart") then
            Parts.CanCollide = false 
        end 
    end]]
    for _,Parts in next, DeadChar:GetChildren() do
        if Parts:IsA("BasePart") then
        Parts.CanCollide = false
        end 
    end 
end
Collider = game:GetService("RunService").Stepped:Connect(UnCollide)

local resetBindable = Instance.new("BindableEvent")
resetBindable.Event:connect(function()
    game:GetService("StarterGui"):SetCore("ResetButtonCallback", true)
	resetBindable:Destroy()
	HumanDied = true
    pcall(function()
		game:FindFirstChildOfClass("Players").LocalPlayer.Character = DeadChar
		DeadChar.Head:Destroy()
		DeadChar:FindFirstChildOfClass("Humanoid"):Destroy()
		game:FindFirstChildOfClass("Players").LocalPlayer.Character = CloneChar
		if DeadChar:FindFirstChildOfClass("Folder") then DeadChar:FindFirstChildOfClass("Folder"):Destroy() end
	end)
end)
game:GetService("StarterGui"):SetCore("ResetButtonCallback", resetBindable)

coroutine.wrap(function()
    while true do
        game:GetService("RunService").RenderStepped:wait()
        if not CloneChar or not CloneChar:FindFirstChild("Head") or not CloneChar:FindFirstChildOfClass("Humanoid") or CloneChar:FindFirstChildOfClass("Humanoid").Health <= 0 and not DeadChar or not DeadChar:FindFirstChild("Head") or not DeadChar:FindFirstChildOfClass("Humanoid") or DeadChar:FindFirstChildOfClass("Humanoid").Health <= 0 then 
            HumanDied = true
            pcall(function()
				game:FindFirstChildOfClass("Players").LocalPlayer.Character = DeadChar
				DeadChar.Head:Destroy()
				DeadChar:FindFirstChildOfClass("Humanoid"):Destroy()
				game:FindFirstChildOfClass("Players").LocalPlayer.Character = CloneChar
				if DeadChar:FindFirstChildOfClass("Folder") then DeadChar:FindFirstChildOfClass("Folder"):Destroy() end
			end)
            if resetBindable then
                game:GetService("StarterGui"):SetCore("ResetButtonCallback", true)
                resetBindable:Destroy()
            end
            break
        end		
    end
end)()


SCIFIMOVIELOL(DeadChar["Head"],CloneChar["Head"])
SCIFIMOVIELOL(DeadChar["Torso"],CloneChar["Torso"])
SCIFIMOVIELOL(DeadChar["Left Arm"],CloneChar["Left Arm"])
SCIFIMOVIELOL(DeadChar["Right Arm"],CloneChar["Right Arm"])
SCIFIMOVIELOL(DeadChar["Left Leg"],CloneChar["Left Leg"])
SCIFIMOVIELOL(DeadChar["Right Leg"],CloneChar["Right Leg"])

for _,v in pairs(DeadChar:GetChildren()) do
	if v:IsA("BasePart") and v.Name ~= "Head" then
		--[[local bv = Instance.new("BodyVelocity",v)
		bv.Velocity = Vector3.new(0,0,0)
		coroutine.wrap(function()
			while true do
				game:GetService("RunService").RenderStepped:wait()
				if HumanDied then break end
				v.CFrame = CloneChar[v.Name].CFrame
			end
		end)()]]
	elseif v:IsA("BasePart") and v.Name == "Head" then
		local bv = Instance.new("BodyVelocity",v)
		bv.Velocity = Vector3.new(0,0,0)
		coroutine.wrap(function()
			while true do
				game:GetService("RunService").RenderStepped:wait()
				if HumanDied then break end
				v.CFrame = DeadChar.Torso.CFrame * CFrame.new(0,1.5,0)
			end
		end)()
	end
end

for _,BodyParts in next, CloneChar:GetDescendants() do
if BodyParts:IsA("BasePart") or BodyParts:IsA("Part") then
BodyParts.Transparency = 1 end end
game:GetService("RunService").RenderStepped:wait()
game:FindFirstChildOfClass("Players").LocalPlayer.Character = CloneChar
game:FindFirstChildOfClass("Workspace"):FindFirstChildOfClass("Camera").CameraSubject = CloneChar.Humanoid

for _,v in next, DeadChar:GetChildren() do
	if v:IsA("Accessory") then
		if v.Handle:FindFirstChildOfClass("Weld") then v.Handle:FindFirstChildOfClass("Weld"):Destroy() end
	end
end

if ANIMATIONHERE then ANIMATIONHERE.Parent = CloneChar end
mouse = game:GetService("Players").LocalPlayer:GetMouse()

plr = game:GetService("Players").LocalPlayer
plr.CharacterAdded:connect(function()
	script.Disabled = true
	script:destroy()	
end)
char = plr.Character
hum = char.Humanoid
local cam = game.Workspace.CurrentCamera
Camera = cam
local CamInterrupt = false
local TwoD = false
local TargetInfo = {nil, nil}
cam.CameraType = "Custom"
t = char.Torso
h = char.Head
ra = char["Right Arm"]
la = char["Left Arm"]
rl = char["Right Leg"]
ll = char["Left Leg"]
tors = char.Torso
lleg = char["Left Leg"]
root = char.HumanoidRootPart
hed = char.Head
rleg = char["Right Leg"]
rarm = char["Right Arm"]
larm = char["Left Arm"]
radian = math.rad
random = math.random
Vec3 = Vector3.new
Inst = Instance.new
cFrame = CFrame.new
Euler = CFrame.fromEulerAnglesXYZ
vt = Vector3.new
bc = BrickColor.new
br = BrickColor.random
it = Instance.new
cf = CFrame.new


local Booleans = {
  CamFollow = true,
  GyroUse = true
}

function lerp(object, newCFrame, alpha)
  return object:lerp(newCFrame, alpha)
end

local Directer = Inst("BodyGyro", root)
Directer.MaxTorque = Vec3(0, 0, 0)
Directer.P = 600000
local CPart = Inst("Part")
CPart.Anchored = true
CPart.CanCollide = false
CPart.Locked = true
CPart.Transparency = 11

local rainbowmode = false
local chaosmode = false
local duringend = false
local ModeOfGlitch = 1

local kan = Instance.new("Sound",tors)
kan.Volume = 5
kan.TimePosition = 0
kan.PlaybackSpeed = 1
kan.Pitch = 1.02
kan.SoundId = "rbxassetid://603567552"
kan.Name = "wreckeda"
kan.Looped = true
kan:Play()

local REMOTE = Instance.new("RemoteEvent")

REMOTE.Parent = Character

local playbackloudness = 0
local sound = kan
game:GetService("RunService").Heartbeat:Connect(function()
    REMOTE:FireClient(Player, sound)
end)
REMOTE.OnServerEvent:Connect(function(plr, loud)
    if plr.Name == Player.Name then
        playbackloudness = loud
    end
end)

local currentThemePlaying = kan.SoundId
local currentPitch = kan.Pitch
local currentVol = kan.Volume
function newTheme(ID,timepos,pitch,vol)
local kanz = kan
--kanz:Stop()
kanz.Volume = 5
--kanz.TimePosition = timepos
kanz.PlaybackSpeed = pitch
kanz.Pitch = pitch
kanz.SoundId = ID
kanz.Name = "wrecked"
kanz.Looped = true
currentThemePlaying = kanz.SoundId
currentVol = kanz.Volume
currentPitch = kanz.Pitch
--kanz:Play()
--coroutine.resume(coroutine.create(function()
--wait(0.05)
--end))
end


function newThemeCust(ID,timepos,pitch,vol)
local kanz = kan
kanz:Stop()
kanz.Volume = 5
kanz.TimePosition = timepos
kanz.PlaybackSpeed = pitch
kanz.Pitch = pitch
kanz.SoundId = ID
kanz.Name = "wrecked"
kanz.Looped = true
currentThemePlaying = kanz.SoundId
currentVol = kanz.Volume
currentPitch = kanz.Pitch
kanz:Play()
coroutine.resume(coroutine.create(function()
wait(0.05)
end))
end

local mutedtog = false

function CameraEnshaking(Length,Intensity)
coroutine.resume(coroutine.create(function()
      local intensity = 1*Intensity
      local rotM = 0.01*Intensity
for i = 0, Length, 0.1 do
swait()
intensity = intensity - 0.05*Intensity/Length
rotM = rotM - 0.0005*Intensity/Length
      hum.CameraOffset = Vec3(radian(random(-intensity, intensity)), radian(random(-intensity, intensity)), radian(random(-intensity, intensity)))
      cam.CFrame = cam.CFrame * cFrame(radian(random(-intensity, intensity)), radian(random(-intensity, intensity)), radian(random(-intensity, intensity))) * Euler(radian(random(-intensity, intensity)) * rotM, radian(random(-intensity, intensity)) * rotM, radian(random(-intensity, intensity)) * rotM)
end
Humanoid.CameraOffset = Vec3(0, 0, 0)
end))
end
CamShake=function(Part,Distan,Power,Times) 
local de=Part.Position
for i,v in pairs(workspace:children()) do
 if v:IsA("Model") and v:findFirstChild("Humanoid") then
for _,c in pairs(v:children()) do
if c.ClassName=="Part" and (c.Position - de).magnitude < Distan then
local Noob=v.Humanoid
if Noob~=nil then
coroutine.resume(coroutine.create(function()
FV = Instance.new("BoolValue", Noob)
FV.Name = "CameraShake"
for ShakeNum=1,Times do
swait()
local ef=Power
  if ef>=1 then
   Humanoid.CameraOffset = Vector3.new(math.random(-ef,ef),math.random(-ef,ef),math.random(-ef,ef))
  else
   ef=Power*10
   Humanoid.CameraOffset = Vector3.new(math.random(-ef,ef)/10,math.random(-ef,ef)/10,math.random(-ef,ef)/10)
  end	
end
Humanoid.CameraOffset = Vector3.new(0,0,0)
FV:Destroy()
end))
CameraShake(Times, Power, Noob)
end
end
end
end
end
end

local toggleTag = true
local bilguit = Instance.new("BillboardGui", hed)
bilguit.Adornee = nil
bilguit.Name = "ModeName"
bilguit.Size = UDim2.new(4, 0, 1.2, 0)
bilguit.StudsOffset = Vector3.new(-8, 8/1.5, 0)
local modet = Instance.new("TextLabel", bilguit)
modet.Size = UDim2.new(10/2, 0, 7/2, 0)
modet.FontSize = "Size8"
modet.TextScaled = true
modet.TextTransparency = 11
modet.BackgroundTransparency = 11 
modet.TextTransparency = 11
modet.TextStrokeTransparency = 11
modet.Font = "Code"
modet.TextStrokeColor3 = Color3.new(0.75,0.75,0.75)
modet.TextColor3 = Color3.new(1,1,1)
modet.Text = "Enlightened"


function chatfunc(text,color,typet,font,timeex)
local chat = coroutine.wrap(function()
if Character:FindFirstChild("TalkingBillBoard")~= nil then
Character:FindFirstChild("TalkingBillBoard"):destroy()
end
local naeeym2 = Instance.new("BillboardGui",Character)
naeeym2.Size = UDim2.new(0,100,0,40)
naeeym2.StudsOffset = Vector3.new(0,3,0)
naeeym2.Adornee = Character.Head
naeeym2.Name = "TalkingBillBoard"
local tecks2 = Instance.new("TextLabel",naeeym2)
tecks2.BackgroundTransparency = 11
tecks2.BorderSizePixel = 0
tecks2.Text = ""
tecks2.Font = font
tecks2.TextSize = 30
tecks2.TextStrokeTransparency = 11
tecks2.TextColor3 = color
tecks2.TextStrokeColor3 = Color3.new(0,0,0)
tecks2.Size = UDim2.new(1,0,0.5,0)
local tecks3 = Instance.new("TextLabel",naeeym2)
tecks3.BackgroundTransparency = 11
tecks3.BorderSizePixel = 0
tecks3.Text = ""
tecks3.Font = font
tecks3.TextSize = 30
tecks3.TextStrokeTransparency = 11
if typet == "Inverted" then
tecks3.TextColor3 = Color3.new(0,0,0)
tecks3.TextStrokeColor3 = color
elseif typet == "Normal" then
tecks3.TextColor3 = color
tecks3.TextStrokeColor3 = Color3.new(0,0,0)
end
tecks3.Size = UDim2.new(1,0,0.5,0)
coroutine.resume(coroutine.create(function()
while true do
swait(1)
if chaosmode == true then
tecks2.TextColor3 = BrickColor.random().Color
tecks3.TextStrokeColor3 = BrickColor.random().Color
end
end
end))
modet.TextTransparency = modet.TextTransparency  + 1
modet.TextStrokeTransparency = modet.TextStrokeTransparency + 1
for i = 0, 74*timeex do
swait()
modet.TextTransparency = 11
modet.TextStrokeTransparency = 11
tecks2.Text = text
tecks3.Text = text
end
local randomrot = math.random(1,2)
if randomrot == 1 then
for i = 1, 50 do
swait()
tecks2.Text = text
tecks3.Text = text
modet.TextTransparency = modet.TextTransparency - .02
modet.TextStrokeTransparency = modet.TextStrokeTransparency - .02
tecks2.TextStrokeTransparency = tecks2.TextStrokeTransparency +.04
tecks2.TextTransparency = tecks2.TextTransparency + .04
tecks3.TextStrokeTransparency = tecks2.TextStrokeTransparency +.04
tecks3.TextTransparency = tecks2.TextTransparency + .04
end
elseif randomrot == 2 then
	for i = 1, 50 do
swait()
tecks2.Text = text
tecks3.Text = text
modet.TextTransparency = modet.TextTransparency - .02
modet.TextStrokeTransparency = modet.TextStrokeTransparency - .02
tecks2.TextStrokeTransparency = tecks2.TextStrokeTransparency +.04
tecks2.TextTransparency = tecks2.TextTransparency + .04
tecks3.TextStrokeTransparency = tecks2.TextStrokeTransparency +.04
tecks3.TextTransparency = tecks2.TextTransparency + .04
end
end
modet.TextTransparency = 11
modet.TextStrokeTransparency = 11
if toggleTag == false then
modet.TextTransparency = 11
modet.TextStrokeTransparency = 11
end
naeeym2:Destroy()
end)
chat()
end


CFuncs = {	
	["Part"] = {
		Create = function(Parent, Material, Reflectance, Transparency, BColor, Name, Size)
			local Part = Create("Part"){
				Parent = Parent,
				Reflectance = Reflectance,
				Transparency = 1+Transparency,
				CanCollide = false,
				Locked = true,
				BrickColor = BrickColor.new(tostring(BColor)),
				Name = Name,
				Size = Size,
				Material = Material,
			}
			RemoveOutlines(Part)
			return Part
		end;
	};
	
	["Mesh"] = {
		Create = function(Mesh, Part, MeshType, MeshId, OffSet, Scale)
			local Msh = Create(Mesh){
				Parent = Part,
				Offset = OffSet,
				Scale = Scale,
			}
			if Mesh == "SpecialMesh" then
				Msh.MeshType = MeshType
				Msh.MeshId = MeshId
			end
			return Msh
		end;
	};
	
	["Mesh"] = {
		Create = function(Mesh, Part, MeshType, MeshId, OffSet, Scale)
			local Msh = Create(Mesh){
				Parent = Part,
				Offset = OffSet,
				Scale = Scale,
			}
			if Mesh == "SpecialMesh" then
				Msh.MeshType = MeshType
				Msh.MeshId = MeshId
			end
			return Msh
		end;
	};
	
	["Weld"] = {
		Create = function(Parent, Part0, Part1, C0, C1)
			local Weld = Create("Weld"){
				Parent = Parent,
				Part0 = Part0,
				Part1 = Part1,
				C0 = C0,
				C1 = C1,
			}
			return Weld
		end;
	};

	["Sound"] = {
		Create = function(id, par, vol, pit) 
			coroutine.resume(coroutine.create(function()
				local S = Create("Sound"){
					Volume = vol,
                                        Name = "EffectSoundo",
					Pitch = pit or 1,
					SoundId = id,
					Parent = par or workspace,
				}
				wait() 
				S:play() 
				game:GetService("Debris"):AddItem(S, 10)
			end))
		end;
	};

["LongSound"] = {
		Create = function(id, par, vol, pit) 
			coroutine.resume(coroutine.create(function()
				local S = Create("Sound"){
					Volume = vol,
					Pitch = pit or 1,
					SoundId = id,
					Parent = par or workspace,
				}
				wait() 
				S:play() 
				game:GetService("Debris"):AddItem(S, 60)
			end))
		end;
	};
	
	["ParticleEmitter"] = {
		Create = function(Parent, Color1, Color2, LightEmission, Size, Texture, Transparency, ZOffset, Accel, Drag, LockedToPart, VelocityInheritance, EmissionDirection, Enabled, LifeTime, Rate, Rotation, RotSpeed, Speed, VelocitySpread)
			local fp = Create("ParticleEmitter"){
				Parent = Parent,
				Color = ColorSequence.new(Color1, Color2),
				LightEmission = LightEmission,
				Size = Size,
				Texture = Texture,
				Transparency = 1+Transparency,
				ZOffset = ZOffset,
				Acceleration = Accel,
				Drag = Drag,
				LockedToPart = LockedToPart,
				VelocityInheritance = VelocityInheritance,
				EmissionDirection = EmissionDirection,
				Enabled = Enabled,
				Lifetime = LifeTime,
				Rate = Rate,
				Rotation = Rotation,
				RotSpeed = RotSpeed,
				Speed = Speed,
				VelocitySpread = VelocitySpread,
			}
			return fp
		end;
	};

	CreateTemplate = {
	
	};
}



New = function(Object, Parent, Name, Data)
	local Object = Instance.new(Object)
	for Index, Value in pairs(Data or {}) do
		Object[Index] = Value
	end
	Object.Parent = Parent
	Object.Name = Name
	return Object
end
local halocolor = BrickColor.new("Pastel light blue")
local halocolor2 = BrickColor.new("Cool yellow")
local starcolor = BrickColor.new("Bright yellow")
local lunacolor = BrickColor.new("Navy blue")
local lunacolor2 = BrickColor.new("Bright blue")
local wepcolor = BrickColor.new("Really black")
local maincolor = BrickColor.new("Really black")
local m = Instance.new("Model",char)
local m2 = Instance.new("Model",char)
local m3 = Instance.new("Model",char)
local mw1 = Instance.new("Model",char)
local mw2 = Instance.new("Model",char)


gui = function(GuiType, parent, text, backtrans, backcol, pos, size)
  local gui = it(GuiType)
  gui.Parent = parent
  gui.Text = text
  gui.BackgroundTransparency = backtrans
  gui.BackgroundColor3 = backcol
  gui.SizeConstraint = "RelativeXY"
  gui.TextXAlignment = "Center"
  gui.TextYAlignment = "Center"
  gui.Position = pos
  gui.Size = size
  gui.Font = "SourceSans"
  gui.FontSize = "Size14"
  gui.TextWrapped = false
  gui.TextStrokeTransparency = 11
  gui.TextColor = BrickColor.new("White")
  return gui
end
--------------------------- GUI STUFF
local basgui = it("GuiMain")
basgui.Parent = plr.PlayerGui
basgui.Name = "VISgui"
local fullscreenz = it("Frame")
fullscreenz.Parent = basgui
fullscreenz.BackgroundColor3 = Color3.new(255, 255, 255)
fullscreenz.BackgroundTransparency = 11
fullscreenz.BorderColor3 = Color3.new(17, 17, 17)
fullscreenz.Size = UDim2.new(1, 0, 1, 0)
fullscreenz.Position = UDim2.new(0, 0, 0, 0)
local imgl2 = Instance.new("ImageLabel",fullscreenz)
imgl2.BackgroundTransparency = 11
imgl2.BorderSizePixel = 0
imgl2.ImageTransparency = 11.5
imgl2.ImageColor3 = Color3.new(1,1,1)
imgl2.Position = UDim2.new(0.75,-100,0.55,-100)
imgl2.Size = UDim2.new(0,800,0,800)
imgl2.Image = "rbxassetid://2076458450"
local techc = imgl2:Clone()
techc.Parent = fullscreenz
techc.ImageTransparency = 11
techc.Size = UDim2.new(0,900,0,900)
techc.Position = UDim2.new(0.75,-150,0.55,-150)
techc.ImageColor3 = Color3.new(1,1,1)
techc.Image = "rbxassetid://2092248396"
local circl = imgl2:Clone()
circl.Parent = fullscreenz
circl.ImageTransparency = 11
circl.Size = UDim2.new(0,550,0,550)
circl.Position = UDim2.new(0.75,25,0.55,25)
circl.ImageColor3 = Color3.new(0,0,0)
circl.Image = "rbxassetid://2076519836"
local circl2 = imgl2:Clone()
circl2.Parent = fullscreenz
circl2.ImageTransparency = 11
circl2.Size = UDim2.new(0,700,0,700)
circl2.Position = UDim2.new(0.75,-50,0.55,-50)
circl2.ImageColor3 = Color3.new(1,1,1)
circl2.Image = "rbxassetid://2076519836"
local imgl2b = imgl2:Clone()
imgl2b.Parent = fullscreenz
imgl2b.ImageTransparency = 11
imgl2b.Size = UDim2.new(0,600,0,600)
imgl2b.Position = UDim2.new(0.75,0,0.55,0)
imgl2b.ImageColor3 = Color3.new(0,0,0)
local ned = Instance.new("TextLabel",fullscreenz)
ned.ZIndex = 2
ned.Font = "SciFi"
ned.BackgroundTransparency = 11
ned.BorderSizePixel = 0.65
ned.Size = UDim2.new(0.3,0,0.2,0)
ned.Position = UDim2.new(0.7,0,0.8,0)
ned.TextColor3 = BrickColor.new("White").Color
ned.TextStrokeColor3 = BrickColor.new("Medium stone grey").Color
ned.TextScaled = true
ned.TextStrokeTransparency = 11
ned.Text = "ENLIGHTENED"
ned.TextSize = 24
ned.Rotation = 1
ned.TextXAlignment = "Right"
ned.TextYAlignment = "Bottom"

local bguis = Instance.new("BillboardGui",tors)
bguis.Size = UDim2.new(25, 0, 25, 0)
local imgca = Instance.new("ImageLabel",bguis)
imgca.BackgroundTransparency = 11
imgca.ImageTransparency = 11
imgca.Size = UDim2.new(1,0,1,0)
imgca.Image = "rbxassetid://2076519836" --997291547,521073910
imgca.ImageColor3 = Color3.new(0,0,0)

local extrawingmod1 = Instance.new("Model",char)
local extrawingmod2 = Instance.new("Model",char)

function CreateParta(parent,transparency,reflectance,material,brickcolor)
local p = Instance.new("Part")
p.TopSurface = 0
p.BottomSurface = 0
p.Parent = parent
p.Size = Vector3.new(0.1,0.1,0.1)
p.Transparency = 1+transparency
p.Reflectance = reflectance
p.CanCollide = false
p.Locked = true
p.BrickColor = brickcolor
p.Material = material
return p
end

function CreateMesh(parent,meshtype,x1,y1,z1)
local mesh = Instance.new("SpecialMesh",parent)
mesh.MeshType = meshtype
mesh.Scale = Vector3.new(x1*10,y1*10,z1*10)
return mesh
end

function CreateSpecialMesh(parent,meshid,x1,y1,z1)
local mesh = Instance.new("SpecialMesh",parent)
mesh.MeshType = "FileMesh"
mesh.MeshId = meshid
mesh.Scale = Vector3.new(x1,y1,z1)
return mesh
end


function CreateSpecialGlowMesh(parent,meshid,x1,y1,z1)
local mesh = Instance.new("SpecialMesh",parent)
mesh.MeshType = "FileMesh"
mesh.MeshId = meshid
mesh.TextureId = "http://www.roblox.com/asset/?id=269748808"
mesh.Scale = Vector3.new(x1,y1,z1)
mesh.VertexColor = Vector3.new(parent.BrickColor.r, parent.BrickColor.g, parent.BrickColor.b)
return mesh
end

function CreateWeld(parent,part0,part1,C1X,C1Y,C1Z,C1Xa,C1Ya,C1Za,C0X,C0Y,C0Z,C0Xa,C0Ya,C0Za)
local weld = Instance.new("Weld")
weld.Parent = parent
weld.Part0 = part0
weld.Part1 = part1
weld.C1 = CFrame.new(C1X,C1Y,C1Z)*CFrame.Angles(C1Xa,C1Ya,C1Za)
weld.C0 = CFrame.new(C0X,C0Y,C0Z)*CFrame.Angles(C0Xa,C0Ya,C0Za)
return weld
end


--------------
local sorb = CreateParta(m,1,1,"SmoothPlastic",BrickColor.random())
CreateWeld(sorb,rarm,sorb,0,1,0,math.rad(0),math.rad(0),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
local sorb2 = CreateParta(m,1,1,"SmoothPlastic",BrickColor.random())
CreateWeld(sorb2,larm,sorb2,0,1,0,math.rad(0),math.rad(0),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))

local handlex = CreateParta(mw2,1,1,"Neon",maincolor)
CreateMesh(handle,"Brick",0,0,0)
local handlexweld = CreateWeld(handlex,tors,handlex,0,-1.5,-1.05,math.rad(0),math.rad(0),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
local valuaring = 10

local refec = Instance.new("ParticleEmitter",handlex)
refec.Texture = "rbxassetid://0284205403"
refec.LightEmission = 0.95
refec.Color = ColorSequence.new(BrickColor.new("White").Color)
refec.Rate = 0
refec.Lifetime = NumberRange.new(0.5)
refec.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,0.5,0),NumberSequenceKeypoint.new(0.5,0.75,0),NumberSequenceKeypoint.new(1,0.1,0)})
refec.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,1,0),NumberSequenceKeypoint.new(0.5,0.25,0),NumberSequenceKeypoint.new(1,1,0)})
refec.Speed = NumberRange.new(0,2)
refec.Drag = 5
refec.LockedToPart = true
refec.Rotation = NumberRange.new(-500,500)
refec.VelocitySpread = 9000
refec.RotSpeed = NumberRange.new(-500,500)
local refec2 = refec:Clone()
refec2.LightEmission = 0.75
refec2.Texture = "rbxassetid://02109052855"--2108979939 254287058 2109052855
refec2.Parent = handlex
refec2.Rate = 15
refec2.Lifetime = NumberRange.new(0.75)
refec2.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,2.15,0),NumberSequenceKeypoint.new(0.7,2.25,0),NumberSequenceKeypoint.new(0.8,2.15,0),NumberSequenceKeypoint.new(1,1.75,0)})
refec2.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,1,0),NumberSequenceKeypoint.new(0.5,0.65,0),NumberSequenceKeypoint.new(1,1,0)})
refec2.Speed = NumberRange.new(0)
local refec3 = refec:Clone()
refec3.LightEmission = 0.75
refec3.Texture = "rbxassetid://02092248396"
refec3.Parent = handlex
refec3.Rate = 25
refec3.Lifetime = NumberRange.new(1)
refec3.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,2,0),NumberSequenceKeypoint.new(0.8,4,0),NumberSequenceKeypoint.new(1,15,0)})
refec3.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,1,0),NumberSequenceKeypoint.new(0.5,0.65,0),NumberSequenceKeypoint.new(1,1,0)})
refec3.Speed = NumberRange.new(0)
refec3.RotSpeed = NumberRange.new(-50,50)
local refec4 = refec:Clone()
refec4.LightEmission = 0.75
refec4.Texture = "rbxassetid://02273224484"
refec4.Parent = handlex
refec4.Rate = 250
refec4.LockedToPart = false
refec4.VelocityInheritance = 1
refec4.Lifetime = NumberRange.new(1)
refec4.Drag = 5
refec4.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,0.5,0),NumberSequenceKeypoint.new(0.8,1,0),NumberSequenceKeypoint.new(1,0,0)})
refec4.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,1,0),NumberSequenceKeypoint.new(0.2,0,0),NumberSequenceKeypoint.new(1,1,0)})
refec4.Speed = NumberRange.new(1,10)
refec4.RotSpeed = NumberRange.new(-50,50)

for i = 0, 35 do
	valuaring = valuaring + 10
rn = CreateParta(mw2,0,0,"Neon",halocolor)
CreateMesh(rn,"Wedge",0.1,0.5,0.1)
CreateWeld(rn,handlex,rn,0,0.75,0,math.rad(0),math.rad(-90),math.rad(valuaring),0,0,0,math.rad(0),math.rad(0),math.rad(0))
rn = CreateParta(mw2,0,0,"Neon",halocolor)
CreateMesh(rn,"Wedge",0.1,0.5,0.1)
CreateWeld(rn,handlex,rn,0,0.75,0,math.rad(0),math.rad(90),math.rad(valuaring),0,0,0,math.rad(0),math.rad(0),math.rad(0))
rn = CreateParta(mw2,0,0,"Neon",halocolor)
CreateMesh(rn,"Wedge",0.1,0.2,0.05)
CreateWeld(rn,handlex,rn,0,-1.1,0.025,math.rad(0),math.rad(-90),math.rad(valuaring),0,0,0,math.rad(0),math.rad(0),math.rad(0))
rn = CreateParta(mw2,0,0,"Neon",halocolor)
CreateMesh(rn,"Wedge",0.1,0.2,0.05)
CreateWeld(rn,handlex,rn,0,-1.1,0.025,math.rad(0),math.rad(90),math.rad(valuaring),0,0,0,math.rad(0),math.rad(0),math.rad(0))
end


local handle = CreateParta(m,1,1,"Neon",maincolor)
CreateMesh(handle,"Brick",0.5,0.5,0.5)
local handleweld = CreateWeld(handle,tors,handle,0,-1.5,-1.05,math.rad(0),math.rad(0),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))

--- Left wing.

local lwing1 = CreateParta(m,1,1,"Neon",maincolor)
CreateMesh(handle,"Brick",0.5,0.5,0.5)
local lwing1weld = CreateWeld(lwing1,handle,lwing1,3,0,0,math.rad(5),math.rad(0),math.rad(12.5),0,0,0,math.rad(0),math.rad(0),math.rad(0))

local hat = game:GetService("Players").LocalPlayer.Character["SwordOne"]

local function align(part0, part1)

        part0.AccessoryWeld:Destroy()
        local attachment0 = Instance.new("Attachment", part0)
        attachment0.Position = Vector3.new(0, 0, 0) --Custom Positioning Values Here
        attachment0.Orientation = Vector3.new(0, 0, -45) --Custom Rotationing Values here
        local attachment1 = Instance.new("Attachment", part1)
        local weldpos = Instance.new("AlignPosition", part0)
        weldpos.Attachment0 = attachment0
        weldpos.Attachment1 = attachment1
        weldpos.RigidityEnabled = true
        weldpos.ReactionForceEnabled = false
        weldpos.ApplyAtCenterOfMass = false
        weldpos.MaxForce = 20000
        weldpos.MaxVelocity = math.huge
        weldpos.Responsiveness = 200000000000000
        local weldrot = Instance.new("AlignOrientation", part0)
        weldrot.Attachment0 = attachment0
        weldrot.Attachment1 = attachment1
        weldrot.ReactionTorqueEnabled = false
        weldrot.PrimaryAxisOnly = false
        weldrot.MaxTorque = 200000000
        weldrot.MaxAngularVelocity = math.huge
        weldrot.Responsiveness = 200000000000000
    end
    align(hat.Handle, lwing1)
wed = CreateParta(mw1,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,0.5)
CreateWeld(wed,lwing1,wed,0,0,0.25,math.rad(0),math.rad(90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(mw1,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,0.5)
CreateWeld(wed,lwing1,wed,0,0,0.25,math.rad(0),math.rad(-90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(mw1,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,0.5)
CreateWeld(wed,lwing1,wed,0,-0.5,0.25,math.rad(180),math.rad(90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(mw1,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,0.5)
CreateWeld(wed,lwing1,wed,0,-0.5,0.25,math.rad(180),math.rad(-90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(mw1,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,0.5)
CreateWeld(wed,lwing1,wed,0,0.75,-0.25,math.rad(0),math.rad(90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(mw1,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,0.5)
CreateWeld(wed,lwing1,wed,0,0.75,-0.25,math.rad(0),math.rad(-90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(mw1,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,1.5)
CreateWeld(wed,lwing1,wed,0,-0.25,1.75,math.rad(0),math.rad(90),math.rad(90),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(mw1,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,1.5,0.5)
CreateWeld(wed,lwing1,wed,0,-1.75,0.25,math.rad(90),math.rad(90),math.rad(90),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(mw1,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.25,1.75)
CreateWeld(wed,lwing1,wed,0,-0.125,2.5,math.rad(0),math.rad(90),math.rad(90),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(mw1,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,1.75,0.25)
CreateWeld(wed,lwing1,wed,0,-2.5,0.125,math.rad(90),math.rad(90),math.rad(90),0,0,0,math.rad(0),math.rad(0),math.rad(0))


local lwing2 = CreateParta(m,1,1,"Neon",maincolor)
CreateMesh(handle,"Brick",0.5,0.5,0.5)
local lwing2weld = CreateWeld(lwing2,handle,lwing2,4,1,0,math.rad(10),math.rad(0),math.rad(25),0,0,0,math.rad(0),math.rad(0),math.rad(0))
local hat = game:GetService("Players").LocalPlayer.Character["SwordTwo"]

local function align(part0, part1)

        part0.AccessoryWeld:Destroy()
        local attachment0 = Instance.new("Attachment", part0)
        attachment0.Position = Vector3.new(0, 0, 0) --Custom Positioning Values Here
        attachment0.Orientation = Vector3.new(0, 0, -45) --Custom Rotationing Values here
        local attachment1 = Instance.new("Attachment", part1)
        local weldpos = Instance.new("AlignPosition", part0)
        weldpos.Attachment0 = attachment0
        weldpos.Attachment1 = attachment1
        weldpos.RigidityEnabled = true
        weldpos.ReactionForceEnabled = false
        weldpos.ApplyAtCenterOfMass = false
        weldpos.MaxForce = 20000
        weldpos.MaxVelocity = math.huge
        weldpos.Responsiveness = 200000000000000
        local weldrot = Instance.new("AlignOrientation", part0)
        weldrot.Attachment0 = attachment0
        weldrot.Attachment1 = attachment1
        weldrot.ReactionTorqueEnabled = false
        weldrot.PrimaryAxisOnly = false
        weldrot.MaxTorque = 200000000
        weldrot.MaxAngularVelocity = math.huge
        weldrot.Responsiveness = 200000000000000
    end
    align(hat.Handle, lwing2)
wed = CreateParta(mw1,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,0.5)
CreateWeld(wed,lwing2,wed,0,0,0.25,math.rad(0),math.rad(90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(mw1,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,0.5)
CreateWeld(wed,lwing2,wed,0,0,0.25,math.rad(0),math.rad(-90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(mw1,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,0.5)
CreateWeld(wed,lwing2,wed,0,-0.5,0.25,math.rad(180),math.rad(90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(mw1,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,0.5)
CreateWeld(wed,lwing2,wed,0,-0.5,0.25,math.rad(180),math.rad(-90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(mw1,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,0.5)
CreateWeld(wed,lwing2,wed,0,0.75,-0.25,math.rad(0),math.rad(90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(mw1,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,0.5)
CreateWeld(wed,lwing2,wed,0,0.75,-0.25,math.rad(0),math.rad(-90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(mw1,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,1.5)
CreateWeld(wed,lwing2,wed,0,-0.25,1.75,math.rad(0),math.rad(90),math.rad(90),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(mw1,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,1.5,0.5)
CreateWeld(wed,lwing2,wed,0,-1.75,0.25,math.rad(90),math.rad(90),math.rad(90),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(mw1,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.25,1.75)
CreateWeld(wed,lwing2,wed,0,-0.125,2.5,math.rad(0),math.rad(90),math.rad(90),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(mw1,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,1.75,0.25)
CreateWeld(wed,lwing2,wed,0,-2.5,0.125,math.rad(90),math.rad(90),math.rad(90),0,0,0,math.rad(0),math.rad(0),math.rad(0))

local lwing3 = CreateParta(m,1,1,"Neon",maincolor)
CreateMesh(handle,"Brick",0.5,0.5,0.5)
local lwing3weld = CreateWeld(lwing3,handle,lwing3,4.75,2,0,math.rad(15),math.rad(0),math.rad(37.5),0,0,0,math.rad(0),math.rad(0),math.rad(0))
local hat = game:GetService("Players").LocalPlayer.Character["SwordThree"]

local function align(part0, part1)

        part0.AccessoryWeld:Destroy()
        local attachment0 = Instance.new("Attachment", part0)
        attachment0.Position = Vector3.new(0, 0, 0) --Custom Positioning Values Here
        attachment0.Orientation = Vector3.new(0, 0, -45) --Custom Rotationing Values here
        local attachment1 = Instance.new("Attachment", part1)
        local weldpos = Instance.new("AlignPosition", part0)
        weldpos.Attachment0 = attachment0
        weldpos.Attachment1 = attachment1
        weldpos.RigidityEnabled = true
        weldpos.ReactionForceEnabled = false
        weldpos.ApplyAtCenterOfMass = false
        weldpos.MaxForce = 20000
        weldpos.MaxVelocity = math.huge
        weldpos.Responsiveness = 200000000000000
        local weldrot = Instance.new("AlignOrientation", part0)
        weldrot.Attachment0 = attachment0
        weldrot.Attachment1 = attachment1
        weldrot.ReactionTorqueEnabled = false
        weldrot.PrimaryAxisOnly = false
        weldrot.MaxTorque = 200000000
        weldrot.MaxAngularVelocity = math.huge
        weldrot.Responsiveness = 200000000000000
    end
    align(hat.Handle, lwing3)
wed = CreateParta(mw1,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,0.5)
CreateWeld(wed,lwing3,wed,0,0,0.25,math.rad(0),math.rad(90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(mw1,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,0.5)
CreateWeld(wed,lwing3,wed,0,0,0.25,math.rad(0),math.rad(-90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(mw1,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,0.5)
CreateWeld(wed,lwing3,wed,0,-0.5,0.25,math.rad(180),math.rad(90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(mw1,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,0.5)
CreateWeld(wed,lwing3,wed,0,-0.5,0.25,math.rad(180),math.rad(-90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(mw1,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,0.5)
CreateWeld(wed,lwing3,wed,0,0.75,-0.25,math.rad(0),math.rad(90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(mw1,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,0.5)
CreateWeld(wed,lwing3,wed,0,0.75,-0.25,math.rad(0),math.rad(-90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(mw1,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,1.5)
CreateWeld(wed,lwing3,wed,0,-0.25,1.75,math.rad(0),math.rad(90),math.rad(90),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(mw1,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,1.5,0.5)
CreateWeld(wed,lwing3,wed,0,-1.75,0.25,math.rad(90),math.rad(90),math.rad(90),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(mw1,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.25,1.75)
CreateWeld(wed,lwing3,wed,0,-0.125,2.5,math.rad(0),math.rad(90),math.rad(90),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(mw1,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,1.75,0.25)
CreateWeld(wed,lwing3,wed,0,-2.5,0.125,math.rad(90),math.rad(90),math.rad(90),0,0,0,math.rad(0),math.rad(0),math.rad(0))

local lwing4 = CreateParta(m,1,1,"Neon",maincolor)
CreateMesh(handle,"Brick",0.5,0.5,0.5)
local lwing4weld = CreateWeld(lwing4,handle,lwing4,5.75,3,0,math.rad(20),math.rad(0),math.rad(50),0,0,0,math.rad(0),math.rad(0),math.rad(0))

wed = CreateParta(extrawingmod1,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,0.5)
CreateWeld(wed,lwing4,wed,0,0,0.25,math.rad(0),math.rad(90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(extrawingmod1,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,0.5)
CreateWeld(wed,lwing4,wed,0,0,0.25,math.rad(0),math.rad(-90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(extrawingmod1,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,3)
CreateWeld(wed,lwing4,wed,0,-0.25,1.75,math.rad(0),math.rad(90),math.rad(90),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(extrawingmod1,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,3,0.5)
CreateWeld(wed,lwing4,wed,0,-1.75,0.25,math.rad(90),math.rad(90),math.rad(90),0,0,0,math.rad(0),math.rad(0),math.rad(0))

local lwing5 = CreateParta(m,1,1,"Neon",maincolor)
CreateMesh(handle,"Brick",0.5,0.5,0.5)
local lwing5weld = CreateWeld(lwing5,handle,lwing5,6.75,4,0,math.rad(25),math.rad(0),math.rad(62.5),0,0,0,math.rad(0),math.rad(0),math.rad(0))

wed = CreateParta(extrawingmod1,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,0.5)
CreateWeld(wed,lwing5,wed,0,0,0.25,math.rad(0),math.rad(90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(extrawingmod1,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,0.5)
CreateWeld(wed,lwing5,wed,0,0,0.25,math.rad(0),math.rad(-90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(extrawingmod1,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,3)
CreateWeld(wed,lwing5,wed,0,-0.25,1.75,math.rad(0),math.rad(90),math.rad(90),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(extrawingmod1,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,3,0.5)
CreateWeld(wed,lwing5,wed,0,-1.75,0.25,math.rad(90),math.rad(90),math.rad(90),0,0,0,math.rad(0),math.rad(0),math.rad(0))

local lwing6 = CreateParta(m,1,1,"Neon",maincolor)
CreateMesh(handle,"Brick",0.5,0.5,0.5)
local lwing6weld = CreateWeld(lwing6,handle,lwing6,7.75,5,0,math.rad(30),math.rad(0),math.rad(75),0,0,0,math.rad(0),math.rad(0),math.rad(0))

wed = CreateParta(extrawingmod1,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,0.5)
CreateWeld(wed,lwing6,wed,0,0,0.25,math.rad(0),math.rad(90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(extrawingmod1,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,0.5)
CreateWeld(wed,lwing6,wed,0,0,0.25,math.rad(0),math.rad(-90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(extrawingmod1,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,3)
CreateWeld(wed,lwing6,wed,0,-0.25,1.75,math.rad(0),math.rad(90),math.rad(90),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(extrawingmod1,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,3,0.5)
CreateWeld(wed,lwing6,wed,0,-1.75,0.25,math.rad(90),math.rad(90),math.rad(90),0,0,0,math.rad(0),math.rad(0),math.rad(0))

-- Right wing.

local rwing1 = CreateParta(m,1,1,"Neon",maincolor)
CreateMesh(handle,"Brick",0.5,0.5,0.5)
local rwing1weld = CreateWeld(rwing1,handle,rwing1,-3,0,0,math.rad(5),math.rad(0),math.rad(-12.5),0,0,0,math.rad(0),math.rad(0),math.rad(0))
local hat = game:GetService("Players").LocalPlayer.Character["SwordFour"]

local function align(part0, part1)

        part0.AccessoryWeld:Destroy()
        local attachment0 = Instance.new("Attachment", part0)
        attachment0.Position = Vector3.new(0, 0, 0) --Custom Positioning Values Here
        attachment0.Orientation = Vector3.new(0, 0, -45) --Custom Rotationing Values here
        local attachment1 = Instance.new("Attachment", part1)
        local weldpos = Instance.new("AlignPosition", part0)
        weldpos.Attachment0 = attachment0
        weldpos.Attachment1 = attachment1
        weldpos.RigidityEnabled = true
        weldpos.ReactionForceEnabled = false
        weldpos.ApplyAtCenterOfMass = false
        weldpos.MaxForce = 20000
        weldpos.MaxVelocity = math.huge
        weldpos.Responsiveness = 200000000000000
        local weldrot = Instance.new("AlignOrientation", part0)
        weldrot.Attachment0 = attachment0
        weldrot.Attachment1 = attachment1
        weldrot.ReactionTorqueEnabled = false
        weldrot.PrimaryAxisOnly = false
        weldrot.MaxTorque = 200000000
        weldrot.MaxAngularVelocity = math.huge
        weldrot.Responsiveness = 200000000000000
    end
    align(hat.Handle, rwing1)
wed = CreateParta(mw2,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,0.5)
CreateWeld(wed,rwing1,wed,0,0,0.25,math.rad(0),math.rad(90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(mw2,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,0.5)
CreateWeld(wed,rwing1,wed,0,0,0.25,math.rad(0),math.rad(-90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(mw2,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,0.5)
CreateWeld(wed,rwing1,wed,0,-0.5,0.25,math.rad(180),math.rad(90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(mw2,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,0.5)
CreateWeld(wed,rwing1,wed,0,-0.5,0.25,math.rad(180),math.rad(-90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(mw2,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,0.5)
CreateWeld(wed,rwing1,wed,0,0.75,-0.25,math.rad(0),math.rad(90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(mw2,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,0.5)
CreateWeld(wed,rwing1,wed,0,0.75,-0.25,math.rad(0),math.rad(-90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(mw2,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,1.5)
CreateWeld(wed,rwing1,wed,0,-0.25,1.75,math.rad(0),math.rad(90),math.rad(90),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(mw2,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,1.5,0.5)
CreateWeld(wed,rwing1,wed,0,-1.75,0.25,math.rad(90),math.rad(90),math.rad(90),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(mw2,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.25,1.75)
CreateWeld(wed,rwing1,wed,0,-0.125,2.5,math.rad(0),math.rad(90),math.rad(90),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(mw2,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,1.75,0.25)
CreateWeld(wed,rwing1,wed,0,-2.5,0.125,math.rad(90),math.rad(90),math.rad(90),0,0,0,math.rad(0),math.rad(0),math.rad(0))

local rwing2 = CreateParta(m,1,1,"Neon",maincolor)
CreateMesh(handle,"Brick",0.5,0.5,0.5)
local rwing2weld = CreateWeld(rwing2,handle,rwing2,-4,1,0,math.rad(10),math.rad(0),math.rad(-25),0,0,0,math.rad(0),math.rad(0),math.rad(0))
local hat = game:GetService("Players").LocalPlayer.Character["SwordFive"]

local function align(part0, part1)

        part0.AccessoryWeld:Destroy()
        local attachment0 = Instance.new("Attachment", part0)
        attachment0.Position = Vector3.new(0, 0, 0) --Custom Positioning Values Here
        attachment0.Orientation = Vector3.new(0, 0, -45) --Custom Rotationing Values here
        local attachment1 = Instance.new("Attachment", part1)
        local weldpos = Instance.new("AlignPosition", part0)
        weldpos.Attachment0 = attachment0
        weldpos.Attachment1 = attachment1
        weldpos.RigidityEnabled = true
        weldpos.ReactionForceEnabled = false
        weldpos.ApplyAtCenterOfMass = false
        weldpos.MaxForce = 20000
        weldpos.MaxVelocity = math.huge
        weldpos.Responsiveness = 200000000000000
        local weldrot = Instance.new("AlignOrientation", part0)
        weldrot.Attachment0 = attachment0
        weldrot.Attachment1 = attachment1
        weldrot.ReactionTorqueEnabled = false
        weldrot.PrimaryAxisOnly = false
        weldrot.MaxTorque = 200000000
        weldrot.MaxAngularVelocity = math.huge
        weldrot.Responsiveness = 200000000000000
    end
    align(hat.Handle, rwing2)
wed = CreateParta(mw2,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,0.5)
CreateWeld(wed,rwing2,wed,0,0,0.25,math.rad(0),math.rad(90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(mw2,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,0.5)
CreateWeld(wed,rwing2,wed,0,0,0.25,math.rad(0),math.rad(-90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(mw2,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,0.5)
CreateWeld(wed,rwing2,wed,0,-0.5,0.25,math.rad(180),math.rad(90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(mw2,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,0.5)
CreateWeld(wed,rwing2,wed,0,-0.5,0.25,math.rad(180),math.rad(-90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(mw2,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,0.5)
CreateWeld(wed,rwing2,wed,0,0.75,-0.25,math.rad(0),math.rad(90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(mw2,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,0.5)
CreateWeld(wed,rwing2,wed,0,0.75,-0.25,math.rad(0),math.rad(-90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(mw2,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,1.5)
CreateWeld(wed,rwing2,wed,0,-0.25,1.75,math.rad(0),math.rad(90),math.rad(90),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(mw2,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,1.5,0.5)
CreateWeld(wed,rwing2,wed,0,-1.75,0.25,math.rad(90),math.rad(90),math.rad(90),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(mw2,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.25,1.75)
CreateWeld(wed,rwing2,wed,0,-0.125,2.5,math.rad(0),math.rad(90),math.rad(90),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(mw2,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,1.75,0.25)
CreateWeld(wed,rwing2,wed,0,-2.5,0.125,math.rad(90),math.rad(90),math.rad(90),0,0,0,math.rad(0),math.rad(0),math.rad(0))

local rwing3 = CreateParta(m,1,1,"Neon",maincolor)
CreateMesh(handle,"Brick",0.5,0.5,0.5)
local rwing3weld = CreateWeld(rwing3,handle,rwing3,-4.75,2,0,math.rad(15),math.rad(0),math.rad(-37.5),0,0,0,math.rad(0),math.rad(0),math.rad(0))
local hat = game:GetService("Players").LocalPlayer.Character["SwordSix"]

local function align(part0, part1)

        part0.AccessoryWeld:Destroy()
        local attachment0 = Instance.new("Attachment", part0)
        attachment0.Position = Vector3.new(0, 0, 0) --Custom Positioning Values Here
        attachment0.Orientation = Vector3.new(0, 0, -45) --Custom Rotationing Values here
        local attachment1 = Instance.new("Attachment", part1)
        local weldpos = Instance.new("AlignPosition", part0)
        weldpos.Attachment0 = attachment0
        weldpos.Attachment1 = attachment1
        weldpos.RigidityEnabled = true
        weldpos.ReactionForceEnabled = false
        weldpos.ApplyAtCenterOfMass = false
        weldpos.MaxForce = 20000
        weldpos.MaxVelocity = math.huge
        weldpos.Responsiveness = 200000000000000
        local weldrot = Instance.new("AlignOrientation", part0)
        weldrot.Attachment0 = attachment0
        weldrot.Attachment1 = attachment1
        weldrot.ReactionTorqueEnabled = false
        weldrot.PrimaryAxisOnly = false
        weldrot.MaxTorque = 200000000
        weldrot.MaxAngularVelocity = math.huge
        weldrot.Responsiveness = 200000000000000
    end
    align(hat.Handle, rwing3)

wed = CreateParta(mw2,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,0.5)
CreateWeld(wed,rwing3,wed,0,0,0.25,math.rad(0),math.rad(90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(mw2,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,0.5)
CreateWeld(wed,rwing3,wed,0,0,0.25,math.rad(0),math.rad(-90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(mw2,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,0.5)
CreateWeld(wed,rwing3,wed,0,-0.5,0.25,math.rad(180),math.rad(90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(mw2,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,0.5)
CreateWeld(wed,rwing3,wed,0,-0.5,0.25,math.rad(180),math.rad(-90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(mw2,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,0.5)
CreateWeld(wed,rwing3,wed,0,0.75,-0.25,math.rad(0),math.rad(90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(mw2,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,0.5)
CreateWeld(wed,rwing3,wed,0,0.75,-0.25,math.rad(0),math.rad(-90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(mw2,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,1.5)
CreateWeld(wed,rwing3,wed,0,-0.25,1.75,math.rad(0),math.rad(90),math.rad(90),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(mw2,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,1.5,0.5)
CreateWeld(wed,rwing3,wed,0,-1.75,0.25,math.rad(90),math.rad(90),math.rad(90),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(mw2,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.25,1.75)
CreateWeld(wed,rwing3,wed,0,-0.125,2.5,math.rad(0),math.rad(90),math.rad(90),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(mw2,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,1.75,0.25)
CreateWeld(wed,rwing3,wed,0,-2.5,0.125,math.rad(90),math.rad(90),math.rad(90),0,0,0,math.rad(0),math.rad(0),math.rad(0))


local rwing4 = CreateParta(m,1,1,"Neon",maincolor)
CreateMesh(handle,"Brick",0.5,0.5,0.5)
local rwing4weld = CreateWeld(rwing4,handle,rwing4,-5.75,3,0,math.rad(20),math.rad(0),math.rad(-50),0,0,0,math.rad(0),math.rad(0),math.rad(0))

wed = CreateParta(extrawingmod2,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,0.5)
CreateWeld(wed,rwing4,wed,0,0,0.25,math.rad(0),math.rad(90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(extrawingmod2,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,0.5)
CreateWeld(wed,rwing4,wed,0,0,0.25,math.rad(0),math.rad(-90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(extrawingmod2,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,3)
CreateWeld(wed,rwing4,wed,0,-0.25,1.75,math.rad(0),math.rad(90),math.rad(90),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(extrawingmod2,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,3,0.5)
CreateWeld(wed,rwing4,wed,0,-1.75,0.25,math.rad(90),math.rad(90),math.rad(90),0,0,0,math.rad(0),math.rad(0),math.rad(0))

local rwing5 = CreateParta(m,1,1,"Neon",maincolor)
CreateMesh(handle,"Brick",0.5,0.5,0.5)
local rwing5weld = CreateWeld(rwing5,handle,rwing5,-6.75,4,0,math.rad(25),math.rad(0),math.rad(-62.5),0,0,0,math.rad(0),math.rad(0),math.rad(0))

wed = CreateParta(extrawingmod2,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,0.5)
CreateWeld(wed,rwing5,wed,0,0,0.25,math.rad(0),math.rad(90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(extrawingmod2,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,0.5)
CreateWeld(wed,rwing5,wed,0,0,0.25,math.rad(0),math.rad(-90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(extrawingmod2,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,3)
CreateWeld(wed,rwing5,wed,0,-0.25,1.75,math.rad(0),math.rad(90),math.rad(90),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(extrawingmod2,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,3,0.5)
CreateWeld(wed,rwing5,wed,0,-1.75,0.25,math.rad(90),math.rad(90),math.rad(90),0,0,0,math.rad(0),math.rad(0),math.rad(0))

local rwing6 = CreateParta(m,1,1,"Neon",maincolor)
CreateMesh(handle,"Brick",0.5,0.5,0.5)
local rwing6weld = CreateWeld(rwing6,handle,rwing6,-7.75,3,0,math.rad(30),math.rad(0),math.rad(-75),0,0,0,math.rad(0),math.rad(0),math.rad(0))

wed = CreateParta(extrawingmod2,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,0.5)
CreateWeld(wed,rwing6,wed,0,0,0.25,math.rad(0),math.rad(90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(extrawingmod2,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,0.5)
CreateWeld(wed,rwing6,wed,0,0,0.25,math.rad(0),math.rad(-90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(extrawingmod2,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,3)
CreateWeld(wed,rwing6,wed,0,-0.25,1.75,math.rad(0),math.rad(90),math.rad(90),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(extrawingmod2,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,3,0.5)
CreateWeld(wed,rwing6,wed,0,-1.75,0.25,math.rad(90),math.rad(90),math.rad(90),0,0,0,math.rad(0),math.rad(0),math.rad(0))


---- HERES THE RING


--[[ran = CreateParta(m2,0,0,"SmoothPlastic",wepcolor)
CreateMesh(ran,"Wedge",1.02,1.02,1.02)
CreateWeld(ran,larm,ran,0,0.15,0,math.rad(0),math.rad(90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
ran = CreateParta(m,0,0,"SmoothPlastic",wepcolor)
CreateMesh(ran,"Wedge",0.9,0.9,1.025)
CreateWeld(ran,larm,ran,0,0.155,0,math.rad(0),math.rad(90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
ran = CreateParta(m,0,0,"SmoothPlastic",wepcolor)
CreateMesh(ran,"Wedge",1.025,0.9,0.9)
CreateWeld(ran,larm,ran,0,0.155,-0.025,math.rad(0),math.rad(90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))


gan = CreateParta(m,0,0,"SmoothPlastic",wepcolor)
CreateMesh(gan,"Brick",1.075,0.1,1.075)
CreateWeld(gan,larm,gan,0,0.5,0,math.rad(0),math.rad(0),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))

gan = CreateParta(m,0,0,"SmoothPlastic",wepcolor)
CreateMesh(gan,"Brick",1.075,0.1,1.075)
CreateWeld(gan,larm,gan,0,0.75,0,math.rad(0),math.rad(0),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))



gan = CreateParta(m2,0,0,"Neon",halocolor2)
CreateMesh(gan,"Brick",1.095,0.035,1.095)
CreateWeld(gan,larm,gan,0,0.5,0,math.rad(0),math.rad(0),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))

gan = CreateParta(m2,0,0,"Neon",halocolor2)
CreateMesh(gan,"Brick",1.095,0.035,1.095)
CreateWeld(gan,larm,gan,0,0.75,0,math.rad(0),math.rad(0),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))

gane = CreateParta(m3,0,0,"SmoothPlastic",lunacolor2)
CreateMesh(gane,"Brick",1.0625,0.2,1.0625)
CreateWeld(gane,larm,gane,0,0.6,0,math.rad(0),math.rad(0),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))

star = CreateParta(m,0,0,"SmoothPlastic",wepcolor)
CreateSpecialMesh(star,"http://www.roblox.com/asset/?id=45428961",2.5,2.5,2.5)
CreateWeld(star,larm,star,0,0.475,0.6,math.rad(90),math.rad(90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
starl = CreateParta(m3,0,0,"SmoothPlastic",starcolor)
CreateSpecialMesh(starl,"http://www.roblox.com/asset/?id=45428961",1.95,2.55,1.95)
CreateWeld(starl,larm,starl,0,0.475,0.6,math.rad(90),math.rad(90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))

--- second ring

ran = CreateParta(m2,0,0,"SmoothPlastic",wepcolor)
CreateMesh(ran,"Wedge",1.02,1.02,1.02)
CreateWeld(ran,rarm,ran,0,0.15,0,math.rad(0),math.rad(-90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
ran = CreateParta(m,0,0,"SmoothPlastic",wepcolor)
CreateMesh(ran,"Wedge",0.9,0.9,1.025)
CreateWeld(ran,rarm,ran,0,0.155,0,math.rad(0),math.rad(-90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
ran = CreateParta(m,0,0,"SmoothPlastic",wepcolor)
CreateMesh(ran,"Wedge",1.025,0.9,0.9)
CreateWeld(ran,rarm,ran,0,0.155,-0.025,math.rad(0),math.rad(-90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))

gan = CreateParta(m,0,0,"SmoothPlastic",wepcolor)
CreateMesh(gan,"Brick",1.075,0.1,1.075)
CreateWeld(gan,rarm,gan,0,0.5,0,math.rad(0),math.rad(0),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))

gan = CreateParta(m,0,0,"SmoothPlastic",wepcolor)
CreateMesh(gan,"Brick",1.075,0.1,1.075)
CreateWeld(gan,rarm,gan,0,0.75,0,math.rad(0),math.rad(0),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))



gan = CreateParta(m2,0,0,"Neon",halocolor2)
CreateMesh(gan,"Brick",1.095,0.035,1.095)
CreateWeld(gan,rarm,gan,0,0.5,0,math.rad(0),math.rad(0),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))

gan = CreateParta(m2,0,0,"Neon",halocolor2)
CreateMesh(gan,"Brick",1.095,0.035,1.095)
CreateWeld(gan,rarm,gan,0,0.75,0,math.rad(0),math.rad(0),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))

gane = CreateParta(m3,0,0,"SmoothPlastic",lunacolor2)
CreateMesh(gane,"Brick",1.0625,0.2,1.0625)
CreateWeld(gane,rarm,gane,0,0.6,0,math.rad(0),math.rad(0),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))

star = CreateParta(m,0,0,"SmoothPlastic",wepcolor)
CreateSpecialMesh(star,"http://www.roblox.com/asset/?id=45428961",2.5,2.5,2.5)
CreateWeld(star,rarm,star,0,-0.475,0.6,math.rad(90),math.rad(90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
starl = CreateParta(m3,0,0,"SmoothPlastic",starcolor)
CreateSpecialMesh(starl,"http://www.roblox.com/asset/?id=45428961",1.95,2.55,1.95)
CreateWeld(starl,rarm,starl,0,-0.475,0.6,math.rad(90),math.rad(90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))]]--

------------- Trails
local A0 = Instance.new("Attachment",lwing1)
A0.Position = Vector3.new(0,-0.7,0)
local A1 = Instance.new("Attachment",lwing1)
A1.Position = Vector3.new(0,-3.5,0)
tl1 = Instance.new('Trail',lwing1)
tl1.Attachment0 = A0
tl1.Attachment1 = A1
tl1.Texture = "http://www.roblox.com/asset/?id=1049219073"
tl1.LightEmission = 1
tl1.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0),NumberSequenceKeypoint.new(1, 1)})
tl1.Color = ColorSequence.new(BrickColor.new('White').Color)
tl1.Lifetime = 0.6

local A0 = Instance.new("Attachment",lwing2)
A0.Position = Vector3.new(0,-0.7,0)
local A1 = Instance.new("Attachment",lwing2)
A1.Position = Vector3.new(0,-3.5,0)
tl2 = Instance.new('Trail',lwing2)
tl2.Attachment0 = A0
tl2.Attachment1 = A1
tl2.Texture = "http://www.roblox.com/asset/?id=1049219073"
tl2.LightEmission = 1
tl2.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0),NumberSequenceKeypoint.new(1, 1)})
tl2.Color = ColorSequence.new(BrickColor.new('White').Color)
tl2.Lifetime = 0.6

local A0 = Instance.new("Attachment",lwing3)
A0.Position = Vector3.new(0,-0.7,0)
local A1 = Instance.new("Attachment",lwing3)
A1.Position = Vector3.new(0,-3.5,0)
tl3 = Instance.new('Trail',lwing3)
tl3.Attachment0 = A0
tl3.Attachment1 = A1
tl3.Texture = "http://www.roblox.com/asset/?id=1049219073"
tl3.LightEmission = 1
tl3.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0),NumberSequenceKeypoint.new(1, 1)})
tl3.Color = ColorSequence.new(BrickColor.new('White').Color)
tl3.Lifetime = 0.6

local A0 = Instance.new("Attachment",rwing1)
A0.Position = Vector3.new(0,-0.7,0)
local A1 = Instance.new("Attachment",rwing1)
A1.Position = Vector3.new(0,-3.5,0)
tr1 = Instance.new('Trail',rwing1)
tr1.Attachment0 = A0
tr1.Attachment1 = A1
tr1.Texture = "http://www.roblox.com/asset/?id=1049219073"
tr1.LightEmission = 1
tr1.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0),NumberSequenceKeypoint.new(1, 1)})
tr1.Color = ColorSequence.new(BrickColor.new('White').Color)
tr1.Lifetime = 0.6

local A0 = Instance.new("Attachment",rwing2)
A0.Position = Vector3.new(0,-0.7,0)
local A1 = Instance.new("Attachment",rwing2)
A1.Position = Vector3.new(0,-3.5,0)
tr2 = Instance.new('Trail',rwing2)
tr2.Attachment0 = A0
tr2.Attachment1 = A1
tr2.Texture = "http://www.roblox.com/asset/?id=1049219073"
tr2.LightEmission = 1
tr2.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0),NumberSequenceKeypoint.new(1, 1)})
tr2.Color = ColorSequence.new(BrickColor.new('White').Color)
tr2.Lifetime = 0.6

local A0 = Instance.new("Attachment",rwing3)
A0.Position = Vector3.new(0,-0.7,0)
local A1 = Instance.new("Attachment",rwing3)
A1.Position = Vector3.new(0,-3.5,0)
tr3 = Instance.new('Trail',rwing3)
tr3.Attachment0 = A0
tr3.Attachment1 = A1
tr3.Texture = "http://www.roblox.com/asset/?id=1049219073"
tr3.LightEmission = 1
tr3.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0),NumberSequenceKeypoint.new(1, 1)})
tr3.Color = ColorSequence.new(BrickColor.new('White').Color)
tr3.Lifetime = 0.6
--------------

for i, v in pairs(mw2:GetChildren()) do
if v:IsA("Part") then
v.BrickColor = BrickColor.new("White")
v.Material = "Neon"
end
end
for i, v in pairs(mw1:GetChildren()) do
if v:IsA("Part") then
v.Transparency = 11
v.BrickColor = BrickColor.new("White")
v.Material = "Neon"
end
end
for i, v in pairs(extrawingmod1:GetChildren()) do
if v:IsA("Part") then
v.Transparency = 11
v.BrickColor = BrickColor.new("White")
v.Material = "Neon"
end
end
for i, v in pairs(extrawingmod2:GetChildren()) do
if v:IsA("Part") then
v.Transparency = 11
v.BrickColor = BrickColor.new("White")
v.Material = "Neon"
end
end
local MAINRUINCOLOR = BrickColor.new("White")
------


function RemoveOutlines(part)
  part.TopSurface, part.BottomSurface, part.LeftSurface, part.RightSurface, part.FrontSurface, part.BackSurface = 10, 10, 10, 10, 10, 10
end
function CreatePart(Parent, Material, Reflectance, Transparency, BColor, Name, Size)
  local Part = Create("Part")({
    Parent = Parent,
    Reflectance = Reflectance,
    Transparency = 1+Transparency,
    CanCollide = false,
    Locked = true,
    BrickColor = BrickColor.new(tostring(BColor)),
    Name = Name,
    Size = Size,
    Material = Material
  })
  Part.CustomPhysicalProperties = PhysicalProperties.new(0.001, 0.001, 0.001, 0.001, 0.001)
  RemoveOutlines(Part)
  return Part
end
function CreateMesh(Mesh, Part, MeshType, MeshId, OffSet, Scale)
  local Msh = Create(Mesh)({
    Parent = Part,
    Offset = OffSet,
    Scale = Scale
  })
  if Mesh == "SpecialMesh" then
    Msh.MeshType = MeshType
    Msh.MeshId = MeshId
  end
  return Msh
end
function CreateWeld(Parent, Part0, Part1, C0, C1)
  local Weld = Create("Weld")({
    Parent = Parent,
    Part0 = Part0,
    Part1 = Part1,
    C0 = C0,
    C1 = C1
  })
  return Weld
end
Player = game:GetService("Players").LocalPlayer

Character=Player.Character 
PlayerGui=Player.PlayerGui 
Backpack=Player.Backpack 
Torso=Character.Torso 
Head=Character.Head 
Humanoid=Character.Humanoid
m=Instance.new('Model',Character)
LeftArm=Character["Left Arm"] 
LeftLeg=Character["Left Leg"] 
RightArm=Character["Right Arm"] 
RightLeg=Character["Right Leg"] 
LW=Torso["Left Shoulder"] 
LH=Torso["Left Hip"] 
RW=Torso["Right Shoulder"] 
RH=Torso["Right Hip"] 
Face = Head.face
Neck=Torso.Neck
it=Instance.new
attacktype=1
vt=Vector3.new
cf=CFrame.new
euler=CFrame.fromEulerAnglesXYZ
angles=CFrame.Angles
cloaked=false
necko=cf(0, 1, 0, -1, -0, -0, 0, 0, 1, 0, 1, 0)
necko2=cf(0, -0.5, 0, -1, -0, -0, 0, 0, 1, 0, 1, 0)
LHC0=cf(-1,-1,0,-0,-0,-1,0,1,0,1,0,0)
LHC1=cf(-0.5,1,0,-0,-0,-1,0,1,0,1,0,0)
RHC0=cf(1,-1,0,0,0,1,0,1,0,-1,-0,-0)
RHC1=cf(0.5,1,0,0,0,1,0,1,0,-1,-0,-0)
RootPart=Character.HumanoidRootPart
RootJoint=RootPart.RootJoint
RootCF=euler(-1.57,0,3.14)
attack = false 
attackdebounce = false 
deb=false
equipped=true
hand=false
MMouse=nil
combo=0
mana=0
trispeed=.2
attackmode='none'
local idle=0
local Anim="Idle"
local Effects={}
local gun=false
local shoot=false
local sine = 0
local change = 1

function RecolorTextAndRename(name,col1,col2,font)
modet.TextStrokeColor3 = col2
modet.TextColor3 = col1
modet.Font = font
modet.Text = name
techc.ImageColor3 = col2
circl.ImageColor3 = col2
circl2.ImageColor3 = col1
imgca.ImageColor3 = col2
imgl2.ImageColor3 = col1
imgl2b.ImageColor3 = col2
ned.Text = name
ned.TextColor3 = col1
ned.TextStrokeColor3 = col2
end
--save shoulders 
RSH, LSH=nil, nil 
--welds 
RW, LW=Instance.new("Weld"), Instance.new("Weld") 
RW.Name="Right Shoulder" LW.Name="Left Shoulder"
LH=Torso["Left Hip"]
RH=Torso["Right Hip"]
TorsoColor=Torso.BrickColor
function NoOutline(Part)
Part.TopSurface,Part.BottomSurface,Part.LeftSurface,Part.RightSurface,Part.FrontSurface,Part.BackSurface = 10,10,10,10,10,10
end
ch=Character
RSH=ch.Torso["Right Shoulder"] 
LSH=ch.Torso["Left Shoulder"] 
-- 
RSH.Parent=nil 
LSH.Parent=nil
-- 
RW.Name="Right Shoulder"
RW.Part0=char.Torso 
RW.C0=cf(1.5, 0.5, 0) --* CFrame.fromEulerAnglesXYZ(1.3, 0, -0.5) 
RW.C1=cf(0, 0.5, 0) 
RW.Part1=char["Right Arm"] 
RW.Parent=char.Torso 
-- 
LW.Name="Left Shoulder"
LW.Part0=char.Torso 
LW.C0=cf(-1.5, 0.5, 0) --* CFrame.fromEulerAnglesXYZ(1.7, 0, 0.8) 
LW.C1=cf(0, 0.5, 0) 
LW.Part1=char["Left Arm"] 
LW.Parent=char.Torso

local donum=0
 

function part(formfactor,parent,reflectance,transparency,brickcolor,name,size)
local fp=it("Part")
fp.formFactor=formfactor 
fp.Parent=parent
fp.Reflectance=reflectance
fp.Transparency=transparency
fp.CanCollide=false 
fp.Locked=true
fp.BrickColor=brickcolor
fp.Name=name
fp.Size=size
fp.Position=Torso.Position 
NoOutline(fp)
fp.Material="SmoothPlastic"
fp:BreakJoints()
return fp 
end 
 
function mesh(Mesh,part,meshtype,meshid,offset,scale)
local mesh=it(Mesh) 
mesh.Parent=part
if Mesh=="SpecialMesh" then
mesh.MeshType=meshtype
if meshid~="nil" then
mesh.MeshId="http://www.roblox.com/asset/?id="..meshid
end
end
mesh.Offset=offset
mesh.Scale=scale
return mesh
end
 
function weld(parent,part0,part1,c0)
local weld=it("Weld") 
weld.Parent=parent
weld.Part0=part0 
weld.Part1=part1 
weld.C0=c0
return weld
end
 
local Color1=Torso.BrickColor

local bodvel=Instance.new("BodyVelocity")
local bg=Instance.new("BodyGyro")

--------- SazEreno's Artificial HB --------------
ArtificialHB = Instance.new("BindableEvent", script)
ArtificialHB.Name = "ArtificialHB"

script:WaitForChild("ArtificialHB")
Frame_Speed = 1 / 60
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

------------------
function swait(num)
if num == 0 or num == nil then
		ArtificialHB.Event:wait()
	else
		for i = 1, num do
			ArtificialHB.Event:wait()
		end
	end
end

-------- RAINBOW LEAVE IT TO ME
local r = 255
local g = 0
local b = 0
coroutine.resume(coroutine.create(function()
while wait() do
	for i = 0, 254/5 do
		swait()
		g = g + 5
	end
	for i = 0, 254/5 do
		swait()
		r = r - 5
	end
	for i = 0, 254/5 do
		swait()
		b = b + 5
	end
	for i = 0, 254/5 do
		swait()
		g = g - 5
	end
	for i = 0, 254/5 do
		swait()
		r = r + 5
	end
	for i = 0, 254/5 do
		swait()
		b = b - 5
	end
end
end))
 
 
so = function(id,par,vol,pit) 
coroutine.resume(coroutine.create(function()
local sou = Instance.new("Sound",par or workspace)
sou.Volume=vol
sou.Pitch=pit or 1
sou.SoundId=id
swait() 
sou:play() 
game:GetService("Debris"):AddItem(sou,6)
end))
end
 
function clerp(a,b,t) 
local qa = {QuaternionFromCFrame(a)}
local qb = {QuaternionFromCFrame(b)} 
local ax, ay, az = a.x, a.y, a.z 
local bx, by, bz = b.x, b.y, b.z
local _t = 1-t
return QuaternionToCFrame(_t*ax + t*bx, _t*ay + t*by, _t*az + t*bz,QuaternionSlerp(qa, qb, t)) 
end 
 
function QuaternionFromCFrame(cf) 
local mx, my, mz, m00, m01, m02, m10, m11, m12, m20, m21, m22 = cf:components() 
local trace = m00 + m11 + m22 
if trace > 0 then 
local s = math.sqrt(1 + trace) 
local recip = 0.5/s 
return (m21-m12)*recip, (m02-m20)*recip, (m10-m01)*recip, s*0.5 
else 
local i = 0 
if m11 > m00 then
i = 1
end
if m22 > (i == 0 and m00 or m11) then 
i = 2 
end 
if i == 0 then 
local s = math.sqrt(m00-m11-m22+1) 
local recip = 0.5/s 
return 0.5*s, (m10+m01)*recip, (m20+m02)*recip, (m21-m12)*recip 
elseif i == 1 then 
local s = math.sqrt(m11-m22-m00+1) 
local recip = 0.5/s 
return (m01+m10)*recip, 0.5*s, (m21+m12)*recip, (m02-m20)*recip 
elseif i == 2 then 
local s = math.sqrt(m22-m00-m11+1) 
local recip = 0.5/s return (m02+m20)*recip, (m12+m21)*recip, 0.5*s, (m10-m01)*recip 
end 
end 
end
 
function QuaternionToCFrame(px, py, pz, x, y, z, w) 
local xs, ys, zs = x + x, y + y, z + z 
local wx, wy, wz = w*xs, w*ys, w*zs 
local xx = x*xs 
local xy = x*ys 
local xz = x*zs 
local yy = y*ys 
local yz = y*zs 
local zz = z*zs 
return CFrame.new(px, py, pz,1-(yy+zz), xy - wz, xz + wy,xy + wz, 1-(xx+zz), yz - wx, xz - wy, yz + wx, 1-(xx+yy)) 
end
 
function QuaternionSlerp(a, b, t) 
local cosTheta = a[1]*b[1] + a[2]*b[2] + a[3]*b[3] + a[4]*b[4] 
local startInterp, finishInterp; 
if cosTheta >= 0.0001 then 
if (1 - cosTheta) > 0.0001 then 
local theta = math.acos(cosTheta) 
local invSinTheta = 1/math.sin(theta) 
startInterp = math.sin((1-t)*theta)*invSinTheta 
finishInterp = math.sin(t*theta)*invSinTheta  
else 
startInterp = 1-t 
finishInterp = t 
end 
else 
if (1+cosTheta) > 0.0001 then 
local theta = math.acos(-cosTheta) 
local invSinTheta = 1/math.sin(theta) 
startInterp = math.sin((t-1)*theta)*invSinTheta 
finishInterp = math.sin(t*theta)*invSinTheta 
else 
startInterp = t-1 
finishInterp = t 
end 
end 
return a[1]*startInterp + b[1]*finishInterp, a[2]*startInterp + b[2]*finishInterp, a[3]*startInterp + b[3]*finishInterp, a[4]*startInterp + b[4]*finishInterp 
end

local function CFrameFromTopBack(at, top, back)
local right = top:Cross(back)
return CFrame.new(at.x, at.y, at.z,
right.x, top.x, back.x,
right.y, top.y, back.y,
right.z, top.z, back.z)
end

function Triangle(a, b, c)
local edg1 = (c-a):Dot((b-a).unit)
local edg2 = (a-b):Dot((c-b).unit)
local edg3 = (b-c):Dot((a-c).unit)
if edg1 <= (b-a).magnitude and edg1 >= 0 then
a, b, c = a, b, c
elseif edg2 <= (c-b).magnitude and edg2 >= 0 then
a, b, c = b, c, a
elseif edg3 <= (a-c).magnitude and edg3 >= 0 then
a, b, c = c, a, b
else
assert(false, "unreachable")
end
 
local len1 = (c-a):Dot((b-a).unit)
local len2 = (b-a).magnitude - len1
local width = (a + (b-a).unit*len1 - c).magnitude
 
local maincf = CFrameFromTopBack(a, (b-a):Cross(c-b).unit, -(b-a).unit)
 
local list = {}
 
if len1 > 0.01 then
local w1 = Instance.new('WedgePart', m)
game:GetService("Debris"):AddItem(w1,5)
w1.Material = "SmoothPlastic"
w1.FormFactor = 'Custom'
w1.BrickColor = BrickColor.new("Really red")
w1.Transparency = 11
w1.Reflectance = 0
w1.Material = "SmoothPlastic"
w1.CanCollide = false
local l1 = Instance.new("PointLight",w1)
l1.Color = Color3.new(170,0,0)
NoOutline(w1)
local sz = Vector3.new(0.2, width, len1)
w1.Size = sz
local sp = Instance.new("SpecialMesh",w1)
sp.MeshType = "Wedge"
sp.Scale = Vector3.new(0,1,1) * sz/w1.Size
w1:BreakJoints()
w1.Anchored = true
w1.Parent = workspace
w1.Transparency = 11.7
table.insert(Effects,{w1,"Disappear",.01})
w1.CFrame = maincf*CFrame.Angles(math.pi,0,math.pi/2)*CFrame.new(0,width/2,len1/2)
table.insert(list,w1)
end
 
if len2 > 0.01 then
local w2 = Instance.new('WedgePart', m)
game:GetService("Debris"):AddItem(w2,5)
w2.Material = "SmoothPlastic"
w2.FormFactor = 'Custom'
w2.BrickColor = BrickColor.new("Really red")
w2.Transparency = 11
w2.Reflectance = 0
w2.Material = "SmoothPlastic"
w2.CanCollide = false
local l2 = Instance.new("PointLight",w2)
l2.Color = Color3.new(170,0,0)
NoOutline(w2)
local sz = Vector3.new(0.2, width, len2)
w2.Size = sz
local sp = Instance.new("SpecialMesh",w2)
sp.MeshType = "Wedge"
sp.Scale = Vector3.new(0,1,1) * sz/w2.Size
w2:BreakJoints()
w2.Anchored = true
w2.Parent = workspace
w2.Transparency = 11.7
table.insert(Effects,{w2,"Disappear",.01})
w2.CFrame = maincf*CFrame.Angles(math.pi,math.pi,-math.pi/2)*CFrame.new(0,width/2,-len1 - len2/2)
table.insert(list,w2)
end
return unpack(list)
end
 

function Damagefunc(Part, hit, minim, maxim, knockback, Type, Property, Delay, HitSound, HitPitch)
  if hit.Parent == nil then
    return
  end
  local h = hit.Parent:FindFirstChildOfClass("Humanoid")
  for _, v in pairs(hit.Parent:children()) do
    if v:IsA("Humanoid") then
      h = v
    end
  end
  if h ~= nil and hit.Parent.Name ~= Character.Name and hit.Parent:FindFirstChild("Head") ~= nil then
    if hit.Parent:findFirstChild("DebounceHit") ~= nil and hit.Parent.DebounceHit.Value == true then
      return
    end
    local c = Create("ObjectValue")({
      Name = "creator",
      Value = game:GetService("Players"):GetPlayerFromCharacter(script.Parent),
      Parent = h
    })
    game:GetService("Debris"):AddItem(c, 0.5)
    if HitSound ~= nil and HitPitch ~= nil then
      CFuncs.Sound.Create(HitSound, hit, 1, HitPitch)
    end
    local Damage = math.random(minim, maxim)
    local blocked = false
    local block = hit.Parent:findFirstChild("Block")
    if block ~= nil and block.className == "IntValue" and block.Value > 0 then
      blocked = true
      block.Value = block.Value - 1
      print(block.Value)
    end
    if blocked == false then
      HitHealth = h.Health
      h.Health = h.Health - Damage
      if HitHealth ~= h.Health and HitHealth ~= 0 and 0 >= h.Health and h.Parent.Name ~= "Hologram" then
        print("gained kill")
      end
      ShowDamage(Part.CFrame * CFrame.new(0, 0, Part.Size.Z / 2).p + Vector3.new(0, 1.5, 0), -Damage, 1.5, Part.BrickColor.Color)
    else
      h.Health = h.Health - Damage / 2
      ShowDamage(Part.CFrame * CFrame.new(0, 0, Part.Size.Z / 2).p + Vector3.new(0, 1.5, 0), -Damage, 1.5, Part.BrickColor.Color)
    end
    if Type == "Knockdown" then
      local hum = hit.Parent.Humanoid
      hum.PlatformStand = true
      coroutine.resume(coroutine.create(function(HHumanoid)
        swait(1)
        HHumanoid.PlatformStand = false
      end), hum)
      local angle = hit.Position - (Property.Position + Vector3.new(0, 0, 0)).unit
      local bodvol = Create("BodyVelocity")({
        velocity = angle * knockback,
        P = 5000,
        maxForce = Vector3.new(8000, 8000, 8000),
        Parent = hit
      })
      local rl = Create("BodyAngularVelocity")({
        P = 3000,
        maxTorque = Vector3.new(500000, 500000, 500000) * 50000000000000,
        angularvelocity = Vector3.new(math.random(-10, 10), math.random(-10, 10), math.random(-10, 10)),
        Parent = hit
      })
      game:GetService("Debris"):AddItem(bodvol, 0.5)
      game:GetService("Debris"):AddItem(rl, 0.5)
    elseif Type == "Normal" then
      local vp = Create("BodyVelocity")({
        P = 500,
        maxForce = Vector3.new(math.huge, 0, math.huge),
        velocity = Property.CFrame.lookVector * knockback + Property.Velocity / 1.05
      })
      if knockback > 0 then
        vp.Parent = hit.Parent.Head
      end
      game:GetService("Debris"):AddItem(vp, 0.5)
    elseif Type == "Up" then
      local bodyVelocity = Create("BodyVelocity")({
        velocity = Vector3.new(0, 20, 0),
        P = 5000,
        maxForce = Vector3.new(8000, 8000, 8000),
        Parent = hit
      })
      game:GetService("Debris"):AddItem(bodyVelocity, 0.5)
      local bodyVelocity = Create("BodyVelocity")({
        velocity = Vector3.new(0, 20, 0),
        P = 5000,
        maxForce = Vector3.new(8000, 8000, 8000),
        Parent = hit
      })
      game:GetService("Debris"):AddItem(bodyVelocity, 1)
    elseif Type == "Leech" then
      local hum = hit.Parent.Humanoid
      if hum ~= nil then
        for i = 0, 2 do
          Effects.Sphere.Create(BrickColor.new("Bright red"), hit.Parent.Torso.CFrame * cn(0, 0, 0) * angles(math.random(-50, 50), math.random(-50, 50), math.random(-50, 50)), 1, 15, 1, 0, 5, 0, 0.02)
        end
        Humanoid.Health = Humanoid.Health + 10
      end
    elseif Type == "UpKnock" then
      local hum = hit.Parent.Humanoid
      hum.PlatformStand = true
      if hum ~= nil then
        hitr = true
      end
      coroutine.resume(coroutine.create(function(HHumanoid)
        swait(5)
        HHumanoid.PlatformStand = false
        hitr = false
      end), hum)
      local bodyVelocity = Create("BodyVelocity")({
        velocity = Vector3.new(0, 20, 0),
        P = 5000,
        maxForce = Vector3.new(8000, 8000, 8000),
        Parent = hit
      })
      game:GetService("Debris"):AddItem(bodyVelocity, 0.5)
      local bodyVelocity = Create("BodyVelocity")({
        velocity = Vector3.new(0, 20, 0),
        P = 5000,
        maxForce = Vector3.new(8000, 8000, 8000),
        Parent = hit
      })
      game:GetService("Debris"):AddItem(bodyVelocity, 1)
    elseif Type == "Snare" then
      local bp = Create("BodyPosition")({
        P = 2000,
        D = 100,
        maxForce = Vector3.new(math.huge, math.huge, math.huge),
        position = hit.Parent.Torso.Position,
        Parent = hit.Parent.Torso
      })
      game:GetService("Debris"):AddItem(bp, 1)
    elseif Type == "Slashnare" then
      Effects.Block.Create(BrickColor.new("Pastel Blue"), hit.Parent.Torso.CFrame * cn(0, 0, 0), 15*4, 15*4, 15*4, 3*4, 3*4, 3*4, 0.07)
      for i = 1, math.random(4, 5) do
        Effects.Sphere.Create(BrickColor.new("Teal"), hit.Parent.Torso.CFrame * cn(math.random(-5, 5), math.random(-5, 5), math.random(-5, 5)) * angles(math.random(-50, 50), math.random(-50, 50), math.random(-50, 50)), 1, 15, 1, 0, 5, 0, 0.02)
      end
      local bp = Create("BodyPosition")({
        P = 2000,
        D = 100,
        maxForce = Vector3.new(math.huge, math.huge, math.huge),
        position = hit.Parent.Torso.Position,
        Parent = hit.Parent.Torso
      })
      game:GetService("Debris"):AddItem(bp, 1)
    elseif Type == "Spike" then
      CreateBigIceSword(hit.Parent.Torso.CFrame)
      local bp = Create("BodyPosition")({
        P = 2000,
        D = 100,
        maxForce = Vector3.new(math.huge, math.huge, math.huge),
        position = hit.Parent.Torso.Position,
        Parent = hit.Parent.Torso
      })
      game:GetService("Debris"):AddItem(bp, 1)
    elseif Type == "Freeze" then
      local BodPos = Create("BodyPosition")({
        P = 50000,
        D = 1000,
        maxForce = Vector3.new(math.huge, math.huge, math.huge),
        position = hit.Parent.Torso.Position,
        Parent = hit.Parent.Torso
      })
      local BodGy = Create("BodyGyro")({
        maxTorque = Vector3.new(400000, 400000, 400000) * math.huge,
        P = 20000,
        Parent = hit.Parent.Torso,
        cframe = hit.Parent.Torso.CFrame
      })
      hit.Parent.Torso.Anchored = true
      coroutine.resume(coroutine.create(function(Part)
        swait(1.5)
        Part.Anchored = false
      end), hit.Parent.Torso)
      game:GetService("Debris"):AddItem(BodPos, 3)
      game:GetService("Debris"):AddItem(BodGy, 3)
    end
    local debounce = Create("BoolValue")({
      Name = "DebounceHit",
      Parent = hit.Parent,
      Value = true
    })
    game:GetService("Debris"):AddItem(debounce, Delay)
    c = Instance.new("ObjectValue")
    c.Name = "creator"
    c.Value = Player
    c.Parent = h
    game:GetService("Debris"):AddItem(c, 0.5)
  end
end
function ShowDamage(Pos, Text, Time, Color)
  local Rate = 0.03333333333333333
  local Pos = Pos or Vector3.new(0, 0, 0)
  local Text = Text or ""
  local Time = Time or 2
  local Color = Color or Color3.new(1, 0, 1)
  local EffectPart = CreatePart(workspace, "SmoothPlastic", 0, 1, BrickColor.new(Color), "Effect", Vector3.new(0, 0, 0))
  EffectPart.Anchored = true
  local BillboardGui = Create("BillboardGui")({
    Size = UDim2.new(3, 0, 3, 0),
    Adornee = EffectPart,
    Parent = EffectPart
  })
  local TextLabel = Create("TextLabel")({
    BackgroundTransparency = 11,
    Size = UDim2.new(1, 0, 1, 0),
    Text = Text,
    TextColor3 = Color,
    TextScaled = true,
    Font = Enum.Font.ArialBold,
    Parent = BillboardGui
  })
  game.Debris:AddItem(EffectPart, Time + 0.1)
  EffectPart.Parent = game:GetService("Workspace")
  delay(0, function()
    local Frames = Time / Rate
    for Frame = 1, Frames do
      wait(Rate)
      local Percent = Frame / Frames
      EffectPart.CFrame = CFrame.new(Pos) + Vector3.new(0, Percent, 0)
      TextLabel.TextTransparency = Percent
    end
    if EffectPart and EffectPart.Parent then
      EffectPart:Destroy()
    end
  end)
end
function MagniDamage(Part, magni, mindam, maxdam, knock, Type)
  for _, c in pairs(workspace:children()) do
    local hum = c:findFirstChildOfClass("Humanoid")
    if hum ~= nil then
      local head = c:findFirstChild("Head")
      if head ~= nil then
        local targ = head.Position - Part.Position
        local mag = targ.magnitude
        if magni >= mag and c.Name ~= Player.Name then
          Damagefunc(head, head, mindam, maxdam, knock, Type, RootPart, 0.1, "rbxassetid://231917784", 1)
        end
      end
    end
  end
end

function MagniDamageWithEffect(Part, magni, mindam, maxdam, knock, Type)
  for _, c in pairs(workspace:children()) do
    local hum = c:findFirstChild("Humanoid")
    if hum ~= nil then
      local head = c:findFirstChild("Torso")
      if head ~= nil then
        local targ = head.Position - Part.Position
        local mag = targ.magnitude
        if magni >= mag and c.Name ~= Player.Name then
	MagicBlock(BrickColor.new("Pastel light blue"),head.CFrame,5,5,5,1,1,1,0.05)
          Damagefunc(head, head, mindam, maxdam, knock, Type, RootPart, 0.1, "rbxassetid://231917784", 1)
        end
      end
    end
  end
end

function rayCast(Pos, Dir, Max, Ignore)  -- Origin Position , Direction, MaxDistance , IgnoreDescendants
return game:service("Workspace"):FindPartOnRay(Ray.new(Pos, Dir.unit * (Max or 999.999)), Ignore) 
end 

local origcolor = BrickColor.new("Pastel light blue")
---- This section of explosions.

----



function ring(type,pos,scale,value)
local type = type
local rng = Instance.new("Part", char)
        rng.Anchored = true
        rng.BrickColor = origcolor
        rng.CanCollide = false
        rng.FormFactor = 3
        rng.Name = "Ring"
        rng.Size = Vector3.new(1, 1, 1)
        rng.Transparency = 11
        rng.TopSurface = 0
        rng.BottomSurface = 0
        rng.CFrame = pos
        local rngm = Instance.new("SpecialMesh", rng)
        rngm.MeshId = "http://www.roblox.com/asset/?id=3270017"
rngm.Scale = scale
local scaler2 = 1
if type == "Add" then
scaler2 = 1*value
elseif type == "Divide" then
scaler2 = 1/value
end
coroutine.resume(coroutine.create(function()
for i = 0,10,0.1 do
swait()
if type == "Add" then
scaler2 = scaler2 - 0.01*value
elseif type == "Divide" then
scaler2 = scaler2 - 0.01/value
end
rng.Transparency = rng.Transparency + 0.01
rngm.Scale = rngm.Scale + Vector3.new(scaler2, scaler2, 0)
end
rng:Destroy()
end))
end


function wave(type,pos,scale,value)
local type = type
local rng = Instance.new("Part", char)
        rng.Anchored = true
        rng.BrickColor = origcolor
        rng.CanCollide = false
        rng.FormFactor = 3
        rng.Name = "Ring"
        rng.Size = Vector3.new(1, 1, 1)
        rng.Transparency = 11
        rng.TopSurface = 0
        rng.BottomSurface = 0
        rng.CFrame = pos
        local rngm = Instance.new("SpecialMesh", rng)
        rngm.MeshId = "http://www.roblox.com/asset/?id=20329976"
rngm.Scale = scale
local scaler2 = 1
if type == "Add" then
scaler2 = 1*value
elseif type == "Divide" then
scaler2 = 1/value
end
coroutine.resume(coroutine.create(function()
for i = 0,10,0.1 do
swait()
if type == "Add" then
scaler2 = scaler2 - 0.01*value
elseif type == "Divide" then
scaler2 = scaler2 - 0.01/value
end
rng.Transparency = rng.Transparency + 0.01
rngm.Scale = rngm.Scale + Vector3.new(scaler2, scaler2, scaler2)
end
rng:Destroy()
end))
end

function sphere(bonuspeed,type,pos,scale,value,color)
local type = type
local rng = Instance.new("Part", char)
        rng.Anchored = true
if ModeOfGlitch ~= 9 then
        rng.BrickColor = color
elseif ModeOfGlitch == 9 then
rng.Color = Color3.new(kan.PlaybackLoudness/1000,kan.PlaybackLoudness/1000,kan.PlaybackLoudness/1000)
end
        rng.CanCollide = false
        rng.FormFactor = 3
        rng.Name = "Ring"
        rng.Material = "Neon"
        rng.Size = Vector3.new(1, 1, 1)
        rng.Transparency = 11
        rng.TopSurface = 0
        rng.BottomSurface = 0
        rng.CFrame = pos
        local rngm = Instance.new("SpecialMesh", rng)
        rngm.MeshType = "Sphere"
rngm.Scale = scale
if rainbowmode == true then
rng.Color = Color3.new(r/255,g/255,b/255)
end
if ModeOfGlitch == 9 then
coroutine.resume(coroutine.create(function()
while true do
swait()
if rng.Parent ~= nil then
rng.Color = Color3.new(kan.PlaybackLoudness/1000,kan.PlaybackLoudness/1000,kan.PlaybackLoudness/1000)
else
break
end
end
end))
end
local scaler2 = 1
if type == "Add" then
scaler2 = 1*value
elseif type == "Divide" then
scaler2 = 1/value
end
coroutine.resume(coroutine.create(function()
for i = 0,10/bonuspeed,0.1 do
swait()
if rainbowmode == true then
rng.Color = Color3.new(r/255,g/255,b/255)
end
if type == "Add" then
scaler2 = scaler2 - 0.01*value/bonuspeed
elseif type == "Divide" then
scaler2 = scaler2 - 0.01/value*bonuspeed
end
if chaosmode == true then
rng.BrickColor = BrickColor.random()
end
rng.Transparency = rng.Transparency + 0.01*bonuspeed
rngm.Scale = rngm.Scale + Vector3.new(scaler2*bonuspeed, scaler2*bonuspeed, scaler2*bonuspeed)
end
rng:Destroy()
end))
end

function sphere2(bonuspeed,type,pos,scale,value,value2,value3,color)
local type = type
local rng = Instance.new("Part", char)
        rng.Anchored = true
if ModeOfGlitch ~= 9 then
        rng.BrickColor = color
elseif ModeOfGlitch == 9 then
rng.Color = Color3.new(kan.PlaybackLoudness/1000,kan.PlaybackLoudness/1000,kan.PlaybackLoudness/1000)
end
        rng.CanCollide = false
        rng.FormFactor = 3
        rng.Name = "Ring"
        rng.Material = "Neon"
        rng.Size = Vector3.new(1, 1, 1)
        rng.Transparency = 11
        rng.TopSurface = 0
        rng.BottomSurface = 0
        rng.CFrame = pos
        local rngm = Instance.new("SpecialMesh", rng)
        rngm.MeshType = "Sphere"
rngm.Scale = scale
local scaler2 = 1
local scaler2b = 1
local scaler2c = 1
if type == "Add" then
scaler2 = 1*value
scaler2b = 1*value2
scaler2c = 1*value3
elseif type == "Divide" then
scaler2 = 1/value
scaler2b = 1/value2
scaler2c = 1/value3
end
if ModeOfGlitch == 9 then
coroutine.resume(coroutine.create(function()
while true do
swait()
if rng.Parent ~= nil then
rng.Color = Color3.new(kan.PlaybackLoudness/1000,kan.PlaybackLoudness/1000,kan.PlaybackLoudness/1000)
else
break
end
end
end))
end
coroutine.resume(coroutine.create(function()
for i = 0,10/bonuspeed,0.1 do
swait()
if type == "Add" then
scaler2 = scaler2 - 0.01*value/bonuspeed
scaler2b = scaler2b - 0.01*value/bonuspeed
scaler2c = scaler2c - 0.01*value/bonuspeed
elseif type == "Divide" then
scaler2 = scaler2 - 0.01/value*bonuspeed
scaler2b = scaler2b - 0.01/value*bonuspeed
scaler2c = scaler2c - 0.01/value*bonuspeed
end
rng.Transparency = rng.Transparency + 0.01*bonuspeed
rngm.Scale = rngm.Scale + Vector3.new(scaler2*bonuspeed, scaler2b*bonuspeed, scaler2c*bonuspeed)
end
rng:Destroy()
end))
end

function slash(bonuspeed,rotspeed,rotatingop,typeofshape,type,typeoftrans,pos,scale,value,color)
local type = type
local rotenable = rotatingop
local rng = Instance.new("Part", char)
        rng.Anchored = true
        rng.BrickColor = color
        rng.CanCollide = false
        rng.FormFactor = 3
        rng.Name = "Ring"
        rng.Material = "Neon"
        rng.Size = Vector3.new(1, 1, 1)
        rng.Transparency = 11
if typeoftrans == "In" then
rng.Transparency = 11
end
        rng.TopSurface = 0
        rng.BottomSurface = 0
        rng.CFrame = pos
        local rngm = Instance.new("SpecialMesh", rng)
        rngm.MeshType = "FileMesh"
if typeofshape == "Normal" then
rngm.MeshId = "rbxassetid://662586858"
elseif typeofshape == "Round" then
rngm.MeshId = "rbxassetid://662585058"
end
rngm.Scale = scale
local scaler2 = 1/10
if type == "Add" then
scaler2 = 1*value/10
elseif type == "Divide" then
scaler2 = 1/value/10
end
local randomrot = math.random(1,2)
coroutine.resume(coroutine.create(function()
for i = 0,10/bonuspeed,0.1 do
swait()
if type == "Add" then
scaler2 = scaler2 - 0.01*value/bonuspeed/10
elseif type == "Divide" then
scaler2 = scaler2 - 0.01/value*bonuspeed/10
end
if rotenable == true then
if randomrot == 1 then
rng.CFrame = rng.CFrame*CFrame.Angles(0,math.rad(rotspeed*bonuspeed/2),0)
elseif randomrot == 2 then
rng.CFrame = rng.CFrame*CFrame.Angles(0,math.rad(-rotspeed*bonuspeed/2),0)
end
end
if typeoftrans == "Out" then
rng.Transparency = rng.Transparency + 0.01*bonuspeed
elseif typeoftrans == "In" then
rng.Transparency = rng.Transparency - 0.01*bonuspeed
end
rngm.Scale = rngm.Scale + Vector3.new(scaler2*bonuspeed/10, 0, scaler2*bonuspeed/10)
end
rng:Destroy()
end))
end



function PixelBlock(bonuspeed,FastSpeed,type,pos,x1,y1,z1,value,color,outerpos)
local type = type
local rng = Instance.new("Part", char)
        rng.Anchored = true
        rng.BrickColor = color
        rng.CanCollide = false
        rng.FormFactor = 3
        rng.Name = "Ring"
        rng.Material = "Neon"
        rng.Size = Vector3.new(1, 1, 1)
        rng.Transparency = 11
        rng.TopSurface = 0
        rng.BottomSurface = 0
        rng.CFrame = pos
rng.CFrame = rng.CFrame + rng.CFrame.lookVector*outerpos
        local rngm = Instance.new("SpecialMesh", rng)
        rngm.MeshType = "Brick"
rngm.Scale = vt(x1,y1,z1)
if rainbowmode == true then
rng.Color = Color3.new(r/255,g/255,b/255)
end
local scaler2 = 1
local speeder = FastSpeed/10
if type == "Add" then
scaler2 = 1*value
elseif type == "Divide" then
scaler2 = 1/value
end
coroutine.resume(coroutine.create(function()
for i = 0,10/bonuspeed,0.1 do
swait()
if rainbowmode == true then
rng.Color = Color3.new(r/255,g/255,b/255)
end
if type == "Add" then
scaler2 = scaler2 - 0.01*value/bonuspeed
elseif type == "Divide" then
scaler2 = scaler2 - 0.01/value*bonuspeed
end
if chaosmode == true then
rng.BrickColor = BrickColor.random()
end
speeder = speeder - 0.01*FastSpeed*bonuspeed/10
rng.CFrame = rng.CFrame + rng.CFrame.lookVector*speeder*bonuspeed
--rng.Transparency = rng.Transparency + 0.01*bonuspeed
rngm.Scale = rngm.Scale - Vector3.new(scaler2*bonuspeed, scaler2*bonuspeed, scaler2*bonuspeed)
end
rng:Destroy()
end))
end

function PixelBlockX(bonuspeed,FastSpeed,type,pos,x1,y1,z1,value,color,outerpos)
local type = type
local rng = Instance.new("Part", char)
        rng.Anchored = true
        rng.BrickColor = color
        rng.CanCollide = false
        rng.FormFactor = 3
        rng.Name = "Ring"
        rng.Material = "Neon"
        rng.Size = Vector3.new(1, 1, 1)
        rng.Transparency = 11
        rng.TopSurface = 0
        rng.BottomSurface = 0
        rng.CFrame = pos
rng.CFrame = rng.CFrame + rng.CFrame.lookVector*outerpos
        local rngm = Instance.new("SpecialMesh", rng)
        rngm.MeshType = "Brick"
rngm.Scale = vt(x1,y1,z1)
if rainbowmode == true then
rng.Color = Color3.new(r/255,g/255,b/255)
end
local scaler2 = 1
local speeder = FastSpeed/10
if type == "Add" then
scaler2 = 1*value
elseif type == "Divide" then
scaler2 = 1/value
end
coroutine.resume(coroutine.create(function()
for i = 0,10/bonuspeed,0.1 do
swait()
if rainbowmode == true then
rng.Color = Color3.new(r/255,g/255,b/255)
end
if type == "Add" then
scaler2 = scaler2 - 0.01*value/bonuspeed
elseif type == "Divide" then
scaler2 = scaler2 - 0.01/value*bonuspeed
end
if chaosmode == true then
rng.BrickColor = BrickColor.random()
end
speeder = speeder - 0.01*FastSpeed*bonuspeed/10
rng.CFrame = rng.CFrame + rng.CFrame.lookVector*speeder*bonuspeed
rng.Transparency = rng.Transparency + 0.01*bonuspeed
rngm.Scale = rngm.Scale - Vector3.new(scaler2*bonuspeed, scaler2*bonuspeed, scaler2*bonuspeed)
end
rng:Destroy()
end))
end

function PixelBlockNeg(bonuspeed,FastSpeed,type,pos,x1,y1,z1,value,color,outerpos)
local type = type
local rng = Instance.new("Part", char)
        rng.Anchored = true
        rng.BrickColor = color
        rng.CanCollide = false
        rng.FormFactor = 3
        rng.Name = "Ring"
        rng.Material = "Neon"
        rng.Size = Vector3.new(1, 1, 1)
        rng.Transparency = 11
        rng.TopSurface = 0
        rng.BottomSurface = 0
        rng.CFrame = pos
rng.CFrame = rng.CFrame + rng.CFrame.lookVector*outerpos
        local rngm = Instance.new("SpecialMesh", rng)
        rngm.MeshType = "Brick"
rngm.Scale = vt(x1,y1,z1)
if rainbowmode == true then
rng.Color = Color3.new(r/255,g/255,b/255)
end
local scaler2 = 0
local speeder = FastSpeed/10
if type == "Add" then
scaler2 = 1*value
elseif type == "Divide" then
scaler2 = 1/value
end
coroutine.resume(coroutine.create(function()
for i = 0,10/bonuspeed,0.1 do
swait()
if rainbowmode == true then
rng.Color = Color3.new(r/255,g/255,b/255)
end
if type == "Add" then
scaler2 = scaler2 - 0.01*value/bonuspeed
elseif type == "Divide" then
scaler2 = scaler2 - 0.01/value*bonuspeed
end
if chaosmode == true then
rng.BrickColor = BrickColor.random()
end
speeder = speeder + 0.01*FastSpeed*bonuspeed/10
rng.CFrame = rng.CFrame + rng.CFrame.lookVector*speeder*bonuspeed
--rng.Transparency = rng.Transparency + 0.01*bonuspeed
rngm.Scale = rngm.Scale - Vector3.new(scaler2*bonuspeed, scaler2*bonuspeed, scaler2*bonuspeed)
end
rng:Destroy()
end))
end

function block(bonuspeed,type,pos,scale,value,value2,value3,color,color3)
local type = type
local rng = Instance.new("Part", char)
        rng.Anchored = true
        rng.BrickColor = color
        rng.Color = color3
        rng.CanCollide = false
        rng.FormFactor = 3
        rng.Name = "Ring"
        rng.Material = "Neon"
        rng.Size = Vector3.new(1, 1, 1)
        rng.Transparency = 11
        rng.TopSurface = 0
        rng.BottomSurface = 0
        rng.CFrame = pos
        local rngm = Instance.new("SpecialMesh", rng)
        rngm.MeshType = "Brick"
rngm.Scale = scale
local scaler2 = 1
local scaler2b = 1
local scaler2c = 1
if type == "Add" then
scaler2 = 1*value
scaler2b = 1*value2
scaler2c = 1*value3
elseif type == "Divide" then
scaler2 = 1/value
scaler2b = 1/value2
scaler2c = 1/value3
end
coroutine.resume(coroutine.create(function()
for i = 0,10/bonuspeed,0.1 do
swait()
if type == "Add" then
scaler2 = scaler2 - 0.01*value/bonuspeed
scaler2b = scaler2b - 0.01*value/bonuspeed
scaler2c = scaler2c - 0.01*value/bonuspeed
elseif type == "Divide" then
scaler2 = scaler2 - 0.01/value*bonuspeed
scaler2b = scaler2b - 0.01/value*bonuspeed
scaler2c = scaler2c - 0.01/value*bonuspeed
end
rng.CFrame = rng.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360)))
rng.Transparency = rng.Transparency + 0.01*bonuspeed
rngm.Scale = rngm.Scale + Vector3.new(scaler2*bonuspeed, scaler2b*bonuspeed, scaler2c*bonuspeed)
end
rng:Destroy()
end))
end

function sphereMK(bonuspeed,FastSpeed,type,pos,x1,y1,z1,value,color,outerpos)
local type = type
local rng = Instance.new("Part", char)
        rng.Anchored = true
if ModeOfGlitch ~= 9 then
        rng.BrickColor = color
elseif ModeOfGlitch == 9 then
rng.Color = Color3.new(kan.PlaybackLoudness/1000,kan.PlaybackLoudness/1000,kan.PlaybackLoudness/1000)
end
        rng.CanCollide = false
        rng.FormFactor = 3
        rng.Name = "Ring"
        rng.Material = "Neon"
        rng.Size = Vector3.new(1, 1, 1)
        rng.Transparency = 11
        rng.TopSurface = 0
        rng.BottomSurface = 0
        rng.CFrame = pos
rng.CFrame = rng.CFrame + rng.CFrame.lookVector*outerpos
        local rngm = Instance.new("SpecialMesh", rng)
        rngm.MeshType = "Sphere"
rngm.Scale = vt(x1,y1,z1)
if rainbowmode == true then
rng.Color = Color3.new(r/255,g/255,b/255)
end
if ModeOfGlitch == 9 then
coroutine.resume(coroutine.create(function()
while true do
swait()
if rng.Parent ~= nil then
rng.Color = Color3.new(kan.PlaybackLoudness/1000,kan.PlaybackLoudness/1000,kan.PlaybackLoudness/1000)
else
break
end
end
end))
end
local scaler2 = 1
local speeder = FastSpeed
if type == "Add" then
scaler2 = 1*value
elseif type == "Divide" then
scaler2 = 1/value
end
coroutine.resume(coroutine.create(function()
for i = 0,10/bonuspeed,0.1 do
swait()
if rainbowmode == true then
rng.Color = Color3.new(r/255,g/255,b/255)
end
if type == "Add" then
scaler2 = scaler2 - 0.01*value/bonuspeed
elseif type == "Divide" then
scaler2 = scaler2 - 0.01/value*bonuspeed
end
if chaosmode == true then
rng.BrickColor = BrickColor.random()
end
speeder = speeder - 0.01*FastSpeed*bonuspeed
rng.CFrame = rng.CFrame + rng.CFrame.lookVector*speeder*bonuspeed
rng.Transparency = rng.Transparency + 0.01*bonuspeed
rngm.Scale = rngm.Scale + Vector3.new(scaler2*bonuspeed, scaler2*bonuspeed, 0)
end
rng:Destroy()
end))
end


function sphereMKCharge(bonuspeed,FastSpeed,type,pos,x1,y1,z1,value,color,outerpos)
local type = type
local rng = Instance.new("Part", char)
        rng.Anchored = true
if ModeOfGlitch ~= 9 then
        rng.BrickColor = color
elseif ModeOfGlitch == 9 then
rng.Color = Color3.new(kan.PlaybackLoudness/1000,kan.PlaybackLoudness/1000,kan.PlaybackLoudness/1000)
end
        rng.CanCollide = false
        rng.FormFactor = 3
        rng.Name = "Ring"
        rng.Material = "Neon"
        rng.Size = Vector3.new(1, 1, 1)
        rng.Transparency = 11
        rng.TopSurface = 0
        rng.BottomSurface = 0
        rng.CFrame = pos
rng.CFrame = rng.CFrame + rng.CFrame.lookVector*outerpos
        local rngm = Instance.new("SpecialMesh", rng)
        rngm.MeshType = "Sphere"
rngm.Scale = vt(x1,y1,z1)
if rainbowmode == true then
rng.Color = Color3.new(r/255,g/255,b/255)
end
if ModeOfGlitch == 9 then
coroutine.resume(coroutine.create(function()
while true do
swait()
if rng.Parent ~= nil then
rng.Color = Color3.new(kan.PlaybackLoudness/1000,kan.PlaybackLoudness/1000,kan.PlaybackLoudness/1000)
else
break
end
end
end))
end
local scaler2 = 1
local speeder = FastSpeed
if type == "Add" then
scaler2 = 1*value
elseif type == "Divide" then
scaler2 = 1/value
end
coroutine.resume(coroutine.create(function()
for i = 0,10/bonuspeed,0.1 do
swait()
if rainbowmode == true then
rng.Color = Color3.new(r/255,g/255,b/255)
end
if type == "Add" then
scaler2 = scaler2 - 0.01*value/bonuspeed
elseif type == "Divide" then
scaler2 = scaler2 - 0.01/value*bonuspeed
end
if chaosmode == true then
rng.BrickColor = BrickColor.random()
end
speeder = speeder - 0.01*FastSpeed*bonuspeed
rng.CFrame = rng.CFrame + rng.CFrame.lookVector*speeder*bonuspeed
rng.Transparency = rng.Transparency - 0.01*bonuspeed
rngm.Scale = rngm.Scale + Vector3.new(scaler2*bonuspeed, scaler2*bonuspeed, 0)
end
rng:Destroy()
end))
end



function dmg(dude)
if dude.Name ~= Character then
local keptcolor = MAINRUINCOLOR
local bgf = Instance.new("BodyGyro",dude.Head)
bgf.CFrame = bgf.CFrame * CFrame.fromEulerAnglesXYZ(math.rad(-90),0,0)
--[[local val = Instance.new("BoolValue",dude)
val.Name = "IsHit"]]--
local ds = coroutine.wrap(function()
dude:WaitForChild("Head"):BreakJoints()
for i, v in pairs(dude:GetChildren()) do
if v:IsA("Part") or v:IsA("MeshPart") then
v.Name = "DEMINISHED"
end
end
wait(0.5)
targetted = nil
CFuncs["Sound"].Create("rbxassetid://62339698", char, 0.75, 0.285)
coroutine.resume(coroutine.create(function()
for i, v in pairs(dude:GetChildren()) do
if v:IsA("Accessory") then
v:Destroy()
end
if v:IsA("Humanoid") then
v:Destroy()
end
if v:IsA("CharacterMesh") then
v:Destroy()
end
if v:IsA("Model") then
v:Destroy()
end
if v:IsA("Part") or v:IsA("MeshPart") then
for x, o in pairs(v:GetChildren()) do
if o:IsA("Decal") then
o:Destroy()
end
end
coroutine.resume(coroutine.create(function()
v.Material = "Neon"
v.CanCollide = false
v.Anchored = false
local bld = Instance.new("ParticleEmitter",v)
bld.LightEmission = 0.75
bld.Texture = "rbxassetid://0363275192" ---284205403
bld.Color = ColorSequence.new(keptcolor.Color)
bld.Rate = 500
bld.Lifetime = NumberRange.new(1)
bld.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,2,0),NumberSequenceKeypoint.new(0.8,2.25,0),NumberSequenceKeypoint.new(1,0,0)})
bld.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0.5,0),NumberSequenceKeypoint.new(0.8,0.75,0),NumberSequenceKeypoint.new(1,1,0)})
bld.Speed = NumberRange.new(2,5)
bld.VelocitySpread = 50000
bld.Rotation = NumberRange.new(-500,500)
bld.RotSpeed = NumberRange.new(-500,500)
        local sbs = Instance.new("BodyPosition", v)
        sbs.P = 3000
        sbs.D = 1000
        sbs.maxForce = Vector3.new(50000000000, 50000000000, 50000000000)
        sbs.position = v.Position + Vector3.new(math.random(-2,2),10 + math.random(-2,2),math.random(-2,2))
v.Color = keptcolor.Color
coroutine.resume(coroutine.create(function()
for i = 0, 49 do
swait(1)
v:BreakJoints()
v.Transparency = v.Transparency + 0.02
end
v:BreakJoints()
sphere2(1,"Add",v.CFrame,vt(0,0,0),0.1,0.1,0.1,keptcolor)
CFuncs["Sound"].Create("rbxassetid://1192402877", v, 0.5, 0.75)
bld.Speed = NumberRange.new(10,25)
bld.Drag = 5
bld.Acceleration = vt(0,2,0)
wait(0.5)
bld.Enabled = false
wait(8)
v:Destroy()
dude:Destroy()
end))
end))
end
end
end))
end)
ds()
end
end



function FindNearestHead(Position, Distance, SinglePlayer)
	if SinglePlayer then
		return (SinglePlayer.Torso.CFrame.p - Position).magnitude < Distance
	end
	local List = {}
	for i, v in pairs(workspace:GetChildren()) do
		if v:IsA("Model") then
			if v:findFirstChild("Head") then
				if v ~= Character then
					if (v.Head.Position - Position).magnitude <= Distance then
						table.insert(List, v)
					end 
				end 
			end 
		end 
	end
	return List
end

function FaceMouse()
  Cam = workspace.CurrentCamera
  return {
    CFrame.new(char.Torso.Position, Vector3.new(mouse.Hit.p.x, char.Torso.Position.y, mouse.Hit.p.z)),
    Vector3.new(mouse.Hit.p.x, mouse.Hit.p.y, mouse.Hit.p.z)
  }
end

function FaceMouse2()
  Cam = workspace.CurrentCamera
  return {
    CFrame.new(char.Torso.Position, Vector3.new(mouse.Hit.p.x, mouse.Hit.p.y, mouse.Hit.p.z)),
    Vector3.new(mouse.Hit.p.x, mouse.Hit.p.y, mouse.Hit.p.z)
  }
end

-- Functions are ready.
local storehumanoidWS = 16

function resetmode()
attack = true
hum.WalkSpeed = 0
hum.JumpPower = 0
CFuncs["Sound"].Create("rbxassetid://136007472", root, 3,1)
local fvalu = 0
for x = 0, 6 do
for i = 0, 1, 0.6 do
swait()
sphere2(3,"Add",tors.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(1,1,1),-0.01,1.25,-0.01,MAINRUINCOLOR)
fvalu = fvalu + 0.025
slash(math.random(50,100)/10,5,true,"Round","Add","Out",root.CFrame*CFrame.new(0,-3,0)*CFrame.Angles(math.rad(math.random(-5,5)),math.rad(math.random(-360,360)),math.rad(math.random(-5,5))),vt(0.01,0.01,0.01),math.random(5,50)/250,BrickColor.new("White"))
RH.C0=clerp(RH.C0,cf(1,-1.05,0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(7),math.rad(0),math.rad(-16)),.1)
LH.C0=clerp(LH.C0,cf(-1,-1.05,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(3),math.rad(0),math.rad(10)),.1)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,fvalu)*angles(math.rad(0),math.rad(0),math.rad(0)),.8)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(-5),math.rad(0),math.rad(0)),.1)
RW.C0=clerp(RW.C0,cf(1.5,0.5,0)*angles(math.rad(-25),math.rad(0),math.rad(97)),.1)
LW.C0=clerp(LW.C0,cf(-1.5,0.5,0)*angles(math.rad(-27),math.rad(0),math.rad(-98)),.1)
end
for i = 0, 1, 0.6 do
swait()
sphere2(3,"Add",tors.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(1,1,1),-0.01,1.25,-0.01,MAINRUINCOLOR)
fvalu = fvalu + 0.025
slash(math.random(50,100)/10,5,true,"Round","Add","Out",root.CFrame*CFrame.new(0,-3,0)*CFrame.Angles(math.rad(math.random(-5,5)),math.rad(math.random(-360,360)),math.rad(math.random(-5,5))),vt(0.01,0.01,0.01),math.random(5,50)/250,BrickColor.new("White"))
RH.C0=clerp(RH.C0,cf(1,-1.05,0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(7),math.rad(0),math.rad(-16)),.1)
LH.C0=clerp(LH.C0,cf(-1,-1.05,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(3),math.rad(0),math.rad(10)),.1)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,fvalu)*angles(math.rad(0),math.rad(0),math.rad(90)),.8)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(-5),math.rad(0),math.rad(0)),.1)
RW.C0=clerp(RW.C0,cf(1.5,0.5,0)*angles(math.rad(-25),math.rad(0),math.rad(97)),.1)
LW.C0=clerp(LW.C0,cf(-1.5,0.5,0)*angles(math.rad(-27),math.rad(0),math.rad(-98)),.1)
end
for i = 0, 1, 0.6 do
swait()
sphere2(3,"Add",tors.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(1,1,1),-0.01,1.25,-0.01,MAINRUINCOLOR)
fvalu = fvalu + 0.025
slash(math.random(50,100)/10,5,true,"Round","Add","Out",root.CFrame*CFrame.new(0,-3,0)*CFrame.Angles(math.rad(math.random(-5,5)),math.rad(math.random(-360,360)),math.rad(math.random(-5,5))),vt(0.01,0.01,0.01),math.random(5,50)/250,BrickColor.new("White"))
RH.C0=clerp(RH.C0,cf(1,-1.05,0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(7),math.rad(0),math.rad(-16)),.1)
LH.C0=clerp(LH.C0,cf(-1,-1.05,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(3),math.rad(0),math.rad(10)),.1)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,fvalu)*angles(math.rad(0),math.rad(0),math.rad(180)),.8)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(-5),math.rad(0),math.rad(0)),.1)
RW.C0=clerp(RW.C0,cf(1.5,0.5,0)*angles(math.rad(-25),math.rad(0),math.rad(97)),.1)
LW.C0=clerp(LW.C0,cf(-1.5,0.5,0)*angles(math.rad(-27),math.rad(0),math.rad(-98)),.1)
end
for i = 0, 1, 0.6 do
swait()
sphere2(3,"Add",tors.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(1,1,1),-0.01,1.25,-0.01,MAINRUINCOLOR)
fvalu = fvalu + 0.025
slash(math.random(50,100)/10,5,true,"Round","Add","Out",root.CFrame*CFrame.new(0,-3,0)*CFrame.Angles(math.rad(math.random(-5,5)),math.rad(math.random(-360,360)),math.rad(math.random(-5,5))),vt(0.01,0.01,0.01),math.random(5,50)/250,BrickColor.new("White"))
RH.C0=clerp(RH.C0,cf(1,-1.05,0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(7),math.rad(0),math.rad(-16)),.1)
LH.C0=clerp(LH.C0,cf(-1,-1.05,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(3),math.rad(0),math.rad(10)),.1)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,fvalu)*angles(math.rad(0),math.rad(0),math.rad(270)),.8)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(-5),math.rad(0),math.rad(0)),.1)
RW.C0=clerp(RW.C0,cf(1.5,0.5,0)*angles(math.rad(-25),math.rad(0),math.rad(97)),.1)
LW.C0=clerp(LW.C0,cf(-1.5,0.5,0)*angles(math.rad(-27),math.rad(0),math.rad(-98)),.1)
end
end
ModeOfGlitch = 1
storehumanoidWS = 16
hum.JumpPower = 50
rainbowmode = false
chaosmode = false
RecolorTextAndRename("Enlightened",Color3.new(1,1,1),Color3.new(0.75,0.75,0.75),"Code")
newTheme("rbxassetid://603567552",0,1.02,1.25)
MAINRUINCOLOR = BrickColor.new("White")
for i = 0, 24 do
sphere2(2,"Add",tors.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(1,1,1),-0.01,7,-0.01,MAINRUINCOLOR)
slash(math.random(10,50)/10,5,true,"Round","Add","Out",tors.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(0.01,0.01,0.01),math.random(50,250)/250,BrickColor.new("White"))
end
CFuncs["Sound"].Create("rbxassetid://1368637781", root, 7.5,1)
CFuncs["Sound"].Create("rbxassetid://763718160", root, 10, 1.1)
CFuncs["Sound"].Create("rbxassetid://782353443", root, 10, 1)
sphere2(3,"Add",tors.CFrame,vt(1,1,1),0.25,0.25,0.25,MAINRUINCOLOR)
sphere2(4,"Add",tors.CFrame,vt(1,1,1),0.5,0.5,0.5,MAINRUINCOLOR)
sphere2(5,"Add",tors.CFrame,vt(1,1,1),0.75,0.75,0.75,MAINRUINCOLOR)
for i, v in pairs(mw2:GetChildren()) do
if v:IsA("Part") then
v.BrickColor = MAINRUINCOLOR
v.Material = "Neon"
end
end
refec.Color = ColorSequence.new(MAINRUINCOLOR.Color)
refec2.Color = ColorSequence.new(MAINRUINCOLOR.Color)
refec3.Color = ColorSequence.new(MAINRUINCOLOR.Color)
refec4.Color = ColorSequence.new(MAINRUINCOLOR.Color)
tr1.Color = ColorSequence.new(MAINRUINCOLOR.Color)
tr2.Color = ColorSequence.new(MAINRUINCOLOR.Color)
tr3.Color = ColorSequence.new(MAINRUINCOLOR.Color)
tl1.Color = ColorSequence.new(MAINRUINCOLOR.Color)
tl2.Color = ColorSequence.new(MAINRUINCOLOR.Color)
tl3.Color = ColorSequence.new(MAINRUINCOLOR.Color)
for i, v in pairs(mw1:GetChildren()) do
if v:IsA("Part") then
v.Transparency = 11
v.BrickColor = MAINRUINCOLOR
v.Material = "Neon"
end
end
for i, v in pairs(m:GetChildren()) do
if v:IsA("Part") then
v.BrickColor = BrickColor.new("White")
v.Material = "Ice"
end
end
for i, v in pairs(m2:GetChildren()) do
if v:IsA("Part") then
v.BrickColor = BrickColor.new("White")
v.Material = "Ice"
end
end
for i, v in pairs(m3:GetChildren()) do
if v:IsA("Part") then
v.BrickColor = BrickColor.new("White")
v.Material = "Neon"
end
end
for i, v in pairs(extrawingmod1:GetChildren()) do
if v:IsA("Part") then
v.Transparency = 11
v.BrickColor = BrickColor.new("White")
v.Material = "Neon"
end
end
for i, v in pairs(extrawingmod2:GetChildren()) do
if v:IsA("Part") then
v.Transparency = 11
v.BrickColor = BrickColor.new("White")
v.Material = "Neon"
end
end
for i = 0, 5, 0.1 do
swait()
slash(math.random(50,100)/10,5,true,"Round","Add","Out",root.CFrame*CFrame.new(0,-3,0)*CFrame.Angles(math.rad(math.random(-5,5)),math.rad(math.random(-360,360)),math.rad(math.random(-5,5))),vt(0.01,0.01,0.01),math.random(5,50)/250,BrickColor.new("White"))
RH.C0=clerp(RH.C0,cf(1,-1,0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-3),math.rad(0),math.rad(-25)),.1)
LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-3),math.rad(0),math.rad(25)),.1)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,1)*angles(math.rad(-25),math.rad(0),math.rad(0)),.1)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(-10),math.rad(0),math.rad(0)),.1)
RW.C0=clerp(RW.C0,cf(1.5,0.5,0)*angles(math.rad(-20),math.rad(0),math.rad(35)),.1)
LW.C0=clerp(LW.C0,cf(-1.5,0.5,0)*angles(math.rad(-20),math.rad(0),math.rad(-35)),.1)
end
hum.WalkSpeed = 16
attack = false
end

function RecolorThing(one,two,three,four,five,exonetran,exone,extwotran,extwo)
for i, v in pairs(mw2:GetChildren()) do
if v:IsA("Part") then
v.BrickColor = one
v.Material = "Neon"
end
end
refec.Color = ColorSequence.new(one.Color)
refec2.Color = ColorSequence.new(one.Color)
refec3.Color = ColorSequence.new(one.Color)
refec4.Color = ColorSequence.new(one.Color)
tr1.Color = ColorSequence.new(one.Color)
tr2.Color = ColorSequence.new(one.Color)
tr3.Color = ColorSequence.new(one.Color)
for i, v in pairs(mw1:GetChildren()) do
if v:IsA("Part") then
v.Transparency = 11
v.BrickColor = two
v.Material = "Neon"
end
end
tl1.Color = ColorSequence.new(two.Color)
tl2.Color = ColorSequence.new(two.Color)
tl3.Color = ColorSequence.new(two.Color)
for i, v in pairs(m:GetChildren()) do
if v:IsA("Part") then
v.BrickColor = three
v.Material = "Ice"
end
end
for i, v in pairs(m2:GetChildren()) do
if v:IsA("Part") then
v.BrickColor = four
v.Material = "Ice"
end
end
for i, v in pairs(m3:GetChildren()) do
if v:IsA("Part") then
v.BrickColor = five
v.Material = "Neon"
end
end
for i, v in pairs(extrawingmod1:GetChildren()) do
if v:IsA("Part") then
v.Transparency = 1+exonetran
v.BrickColor = exone
v.Material = "Neon"
end
end
for i, v in pairs(extrawingmod2:GetChildren()) do
if v:IsA("Part") then
v.Transparency = 1+extwotran
v.BrickColor = extwo
v.Material = "Neon"
end
end
end

function createBGCircle(size,parent,color)
local bgui = Instance.new("BillboardGui",parent)
bgui.Size = UDim2.new(size, 0, size, 0)
local imgc = Instance.new("ImageLabel",bgui)
imgc.BackgroundTransparency = 11
imgc.ImageTransparency = 11
imgc.Size = UDim2.new(1,0,1,0)
imgc.Image = "rbxassetid://997291547" --997291547,521073910
imgc.ImageColor3 = color
return bgui,imgc
end


function attackone()
	attack = true
local keptcolor = MAINRUINCOLOR
	for i = 0,1,0.1 do
		swait()
            RootJoint.C0 = clerp(RootJoint.C0,RootCF*cf(0,0,0)* angles(math.rad(0),math.rad(-10),math.rad(-20)),0.3)
Torso.Neck.C0 = clerp(Torso.Neck.C0,necko *angles(math.rad(20),math.rad(10),math.rad(20)),.3)
RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5, 0) * angles(math.rad(30), math.rad(0), math.rad(30)), 0.3)
LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5, 0) * angles(math.rad(10), math.rad(0), math.rad(-20)), 0.3)
RH.C0=clerp(RH.C0,cf(1,-1 - 0.05 * math.cos(sine / 25),0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-15),math.rad(0),math.rad(0)),.3)
LH.C0=clerp(LH.C0,cf(-1,-1 - 0.05 * math.cos(sine / 25),0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(2.5),math.rad(0),math.rad(0)),.3)
	end
local distlook = 5
coroutine.resume(coroutine.create(function()
for i = 0, 4 do
swait(2)
CameraEnshaking(2,3)
local hite = Instance.new("Part", char)
        hite.Anchored = true
        hite.CanCollide = false
        hite.FormFactor = 3
        hite.Name = "Ring"
        hite.Material = "Neon"
        hite.Size = Vector3.new(1, 1, 1)
        hite.Transparency = 11
        hite.TopSurface = 0
        hite.BottomSurface = 0
hite.CFrame = root.CFrame*CFrame.new(0,-3,-distlook)
sphere2(4,"Add",hite.CFrame*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),vt(0,1,0),0.2,0.001,0.2,keptcolor)
sphere2(4,"Add",hite.CFrame*CFrame.Angles(math.rad(-20),math.rad(0),math.rad(0)),vt(8,1,8),-0.045,0.15,-0.045,keptcolor)
sphere2(4,"Add",hite.CFrame*CFrame.Angles(math.rad(-20),math.rad(0),math.rad(0)),vt(4,1,4),-0.025,0.25,-0.025,keptcolor)
sphere2(4,"Add",hite.CFrame*CFrame.Angles(math.rad(-20),math.rad(0),math.rad(0)),vt(2,1,2),-0.015,0.35,-0.015,keptcolor)
MagniDamage(hite, 9, 10,25, 0, "Normal")
for i = 0, 14 do
local rsiz = math.random(5,20)
sphereMK(math.random(1,3),0.25,"Add",hite.CFrame*CFrame.new(math.random(-20,20)/50,math.random(-20,20)/50,math.random(-20,20)/50)*CFrame.Angles(math.rad(90 + math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),rsiz/10,rsiz/10,rsiz/10,0,keptcolor,0)
end
CFuncs["Sound"].Create("rbxassetid://178452221", hite, 1, 1)
CFuncs["Sound"].Create("rbxassetid://1042722746", hite, 0.5, 1)
game:GetService("Debris"):AddItem(hite, 5)
distlook = distlook + 10
end
end))
	for i = 0,1,0.1 do
		swait()
            RootJoint.C0 = clerp(RootJoint.C0,RootCF*cf(0,0,0)* angles(math.rad(0),math.rad(5),math.rad(90)),0.5)
Torso.Neck.C0 = clerp(Torso.Neck.C0,necko *angles(math.rad(5),math.rad(0),math.rad(-90)),.5)
RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5, 0) * angles(math.rad(0), math.rad(0), math.rad(120)), 0.5)
LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5, 0) * angles(math.rad(10), math.rad(0), math.rad(-20)), 0.5)
RH.C0=clerp(RH.C0,cf(1,-1 - 0.05 * math.cos(sine / 25),0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-0.5),math.rad(0),math.rad(-10)),.5)
LH.C0=clerp(LH.C0,cf(-1,-1 - 0.05 * math.cos(sine / 25),0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-2.5),math.rad(0),math.rad(-10)),.5)
	end
	attack = false
end

function attacktwo()
	attack = true
	for i = 0,1,0.1 do
		swait()
            RootJoint.C0 = clerp(RootJoint.C0,RootCF*cf(0,-0.15,0)* angles(math.rad(10),math.rad(0),math.rad(0)),0.3)
Torso.Neck.C0 = clerp(Torso.Neck.C0,necko *angles(math.rad(10),math.rad(0),math.rad(0)),.3)
RW.C0 = clerp(RW.C0, CFrame.new(1.25, 0.5, -0.5) * angles(math.rad(40), math.rad(0), math.rad(-90)), 0.3)
LW.C0 = clerp(LW.C0, CFrame.new(-1.25, 0.5, -0.5) * angles(math.rad(40), math.rad(0), math.rad(70)), 0.3)
RH.C0=clerp(RH.C0,cf(1,-1 - 0.05 * math.cos(sine / 25),0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-1.5),math.rad(0),math.rad(10)),.3)
LH.C0=clerp(LH.C0,cf(-1,-1 - 0.05 * math.cos(sine / 25),0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-2.5),math.rad(0),math.rad(-10)),.3)
	end
CameraEnshaking(3,4)
MagniDamage(root, 12, 15,30, 0, "Normal")
sphere2(5,"Add",root.CFrame*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),vt(1,1,1),0.35,0.35,0.35,MAINRUINCOLOR)
sphere2(7.5,"Add",root.CFrame*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),vt(1,1,1),0.35,0.35,0.35,MAINRUINCOLOR)
sphere2(10,"Add",root.CFrame*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),vt(1,1,1),0.35,0.35,0.35,MAINRUINCOLOR)
coroutine.resume(coroutine.create(function()
local eff = Instance.new("ParticleEmitter",root)
eff.Texture = "rbxassetid://0363275192"
eff.LightEmission = 0.95
eff.Color = ColorSequence.new(MAINRUINCOLOR.Color)
eff.Rate = 10000
eff.Lifetime = NumberRange.new(1)
eff.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,15,0),NumberSequenceKeypoint.new(0.8,25,0),NumberSequenceKeypoint.new(1,30,0)})
eff.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0.25,0),NumberSequenceKeypoint.new(0.8,0.75,0),NumberSequenceKeypoint.new(1,1,0)})
eff.Speed = NumberRange.new(10,125)
eff.Drag = 5
eff.Rotation = NumberRange.new(-500,500)
eff.VelocitySpread = 9000
eff.RotSpeed = NumberRange.new(-50,50)
local eff2 = eff:Clone()
eff2.Parent = root
eff2.Texture = "rbxassetid://02273224484"
eff2.Rate = 10000
eff2.Lifetime = NumberRange.new(1.5)
eff2.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(0.1,3,0),NumberSequenceKeypoint.new(0.8,6,0),NumberSequenceKeypoint.new(1,0,0)})
eff2.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,1,0),NumberSequenceKeypoint.new(0.1,0.25,0),NumberSequenceKeypoint.new(0.8,0.5,0),NumberSequenceKeypoint.new(1,1,0)})
eff2.Drag = 5
eff2.Speed = NumberRange.new(25,150)
eff2.Rotation = NumberRange.new(-500,500)
eff2.VelocitySpread = 9000
wait(0.25)
eff2.Enabled = false
eff.Enabled = false
wait(5)
eff2:Destroy()
eff:Destroy()
end))
for i = 0, 9 do
sphere2(7.5,"Add",root.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(1,1,1),-0.0025,1,-0.0025,MAINRUINCOLOR)
end
for i = 0, 24 do
local rsiz = math.random(5,20)
sphereMK(math.random(1,5),0.75,"Add",root.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),rsiz/8,rsiz/8,rsiz/8,0,MAINRUINCOLOR,0)
end
CFuncs["Sound"].Create("rbxassetid://1042705869", root, 2.5, 1)
CFuncs["Sound"].Create("rbxassetid://1042716828", root, 2.25, 1)
CFuncs["Sound"].Create("rbxassetid://1117054464", root, 1, 1)
	for i = 0,2,0.1 do
		swait()
            RootJoint.C0 = clerp(RootJoint.C0,RootCF*cf(0,0.15,0)* angles(math.rad(-10),math.rad(0),math.rad(0)),0.3)
Torso.Neck.C0 = clerp(Torso.Neck.C0,necko *angles(math.rad(-10),math.rad(0),math.rad(0)),.3)
RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5, 0) * angles(math.rad(90), math.rad(0), math.rad(120)), 0.3)
LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5, 0) * angles(math.rad(90), math.rad(0), math.rad(-120)), 0.3)
RH.C0=clerp(RH.C0,cf(1,-1 - 0.05 * math.cos(sine / 25),0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-1.5),math.rad(0),math.rad(-10)),.3)
LH.C0=clerp(LH.C0,cf(-1,-1 - 0.05 * math.cos(sine / 25),0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-2.5),math.rad(0),math.rad(10)),.3)
	end
attack = false
end


function attackthree()
attack = true
local keptcolor = MAINRUINCOLOR
CFuncs["Sound"].Create("rbxassetid://1042700914", root, 2, 1.75)
	for i = 0,1,0.1 do
		swait()
sphere2(6,"Add",root.CFrame + root.CFrame.lookVector*2.5,vt(3,3,3),0.01,0.01,0.01,MAINRUINCOLOR)
            RootJoint.C0 = clerp(RootJoint.C0,RootCF*cf(0,0,0)* angles(math.rad(0),math.rad(0),math.rad(0)),0.5)
Torso.Neck.C0 = clerp(Torso.Neck.C0,necko *angles(math.rad(5),math.rad(0),math.rad(0)),.5)
RW.C0 = clerp(RW.C0, CFrame.new(1.25, 0.5, -0.5) * angles(math.rad(80), math.rad(0), math.rad(-40)), 0.5)
LW.C0 = clerp(LW.C0, CFrame.new(-1.25, 0.5, -0.5) * angles(math.rad(80), math.rad(0), math.rad(40)), 0.5)
RH.C0=clerp(RH.C0,cf(1,-1 - 0.05 * math.cos(sine / 25),0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-1.5),math.rad(0),math.rad(0)),.5)
LH.C0=clerp(LH.C0,cf(-1,-1 - 0.05 * math.cos(sine / 25),0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-2.5),math.rad(0),math.rad(0)),.5)
	end
CFuncs["Sound"].Create("rbxassetid://1042705869", root, 1.5, 0.9)
CFuncs["Sound"].Create("rbxassetid://1042716828", root, 2, 0.9)
local angle = -25
coroutine.resume(coroutine.create(function()
for i = 0, 2 do
local orb = Instance.new("Part", char)
        orb.BrickColor = MAINRUINCOLOR
        orb.CanCollide = false
        orb.FormFactor = 3
        orb.Name = "Ring"
        orb.Material = "Neon"
        orb.Size = Vector3.new(1, 1, 1)
        orb.Transparency = 11.5
        orb.TopSurface = 0
        orb.BottomSurface = 0
        local orbm = Instance.new("SpecialMesh", orb)
        orbm.MeshType = "Sphere"
orbm.Name = "SizeMesh"
orbm.Scale = vt(3,3,3)
orb.CFrame = root.CFrame*CFrame.Angles(0,math.rad(angle),0) + root.CFrame.lookVector*2.5
local bv = Instance.new("BodyVelocity")
bv.maxForce = Vector3.new(1e9, 1e9, 1e9)
bv.velocity = orb.CFrame.lookVector*100
bv.Parent = orb
game:GetService("Debris"):AddItem(orb, 10)
sphere2(6,"Add",orb.CFrame*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),vt(1,1,1),0.15,0.15,0.15,keptcolor)
sphere2(9,"Add",orb.CFrame*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),vt(1,1,1),0.15,0.15,0.15,keptcolor)
coroutine.resume(coroutine.create(function()
MagniDamage(orb, 6, 8,15, 0, "Normal")
for i = 0, 7 do
swait(2.5)
CameraEnshaking(1,2)
MagniDamage(orb, 6, 8,15, 0, "Normal")
CFuncs["Sound"].Create("rbxassetid://1042693018", orb, 1.5, 1.5)
for i = 0, 4 do
local rsiz = math.random(5,10)
sphere2(4,"Add",orb.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(0.5,1,0.5),-0.0025,0.25,-0.0025,keptcolor)
sphereMK(math.random(2,6),0.15,"Add",orb.CFrame*CFrame.new(math.random(-20,20)/50,math.random(-20,20)/50,math.random(-20,20)/50)*CFrame.Angles(math.rad(90 + math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),rsiz/10,rsiz/10,rsiz/10,0,keptcolor,0)
end
sphere2(4,"Add",orb.CFrame*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),vt(1,1,1),0.1,0.1,0.1,keptcolor)
sphere2(8,"Add",orb.CFrame*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),vt(1,1,1),0.1,0.1,0.1,keptcolor)
end
orb.Transparency = 11
orb.Anchored = false
wait(10)
orb:Destroy()
end))
angle = angle + 25
end
end))
	for i = 0,1,0.1 do
		swait()
            RootJoint.C0 = clerp(RootJoint.C0,RootCF*cf(0,0.15,0)* angles(math.rad(-10),math.rad(0),math.rad(0)),0.3)
Torso.Neck.C0 = clerp(Torso.Neck.C0,necko *angles(math.rad(5),math.rad(0),math.rad(0)),.3)
RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5, 0) * angles(math.rad(90), math.rad(0), math.rad(60)), 0.3)
LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5, 0) * angles(math.rad(90), math.rad(0), math.rad(-60)), 0.3)
RH.C0=clerp(RH.C0,cf(1,-1 - 0.05 * math.cos(sine / 25),0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-1.5),math.rad(0),math.rad(-10)),.3)
LH.C0=clerp(LH.C0,cf(-1,-1 - 0.05 * math.cos(sine / 25),0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-2.5),math.rad(0),math.rad(10)),.3)
	end
attack = false
end



------------------------------------- Abilities ---------------------------------------------------------
function Crossfire()
attack = true
hum.WalkSpeed = 0 
local vel = Instance.new("BodyPosition", root)
vel.P = 30000
vel.D = 1000
vel.maxForce = Vector3.new(50000000000, 10e10, 50000000000)
vel.position = root.CFrame.p + vt(0,150,0)
CFuncs["Sound"].Create("rbxassetid://1295446488", root, 7.5, 1)
CFuncs["Sound"].Create("rbxassetid://1368598393", root, 10, 1)
local keptcolor = MAINRUINCOLOR
sphere2(2,"Add",root.CFrame,vt(25,1,25),-0.05,3,-0.05,keptcolor)
sphere2(2,"Add",root.CFrame,vt(50,1,50),-0.1,6,-0.1,keptcolor)
for i = 0, 24 do
slash(math.random(30,60)/10,3,true,"Round","Add","Out",root.CFrame*CFrame.new(0,-3,0)*CFrame.Angles(math.rad(math.random(-10,10)),math.rad(math.random(-360,360)),math.rad(math.random(-10,10))),vt(0.05,0.01,0.05),math.random(25,250)/250,BrickColor.new("White"))
end
	for i = 0,3,0.1 do
		swait()
sphere2(4,"Add",sorb2.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(1.5,1.5,1.5),-0.01,0.15,-0.01,keptcolor)
            RootJoint.C0 = clerp(RootJoint.C0,RootCF*cf(0,0,0)* angles(math.rad(0),math.rad(0),math.rad(-70)),0.5)
Torso.Neck.C0 = clerp(Torso.Neck.C0,necko *angles(math.rad(5),math.rad(0),math.rad(70)),.5)
RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5, 0) * angles(math.rad(6), math.rad(-20), math.rad(12)), 0.5)
LW.C0 = clerp(LW.C0, CFrame.new(-1.05, 0.5, -0.65) * angles(math.rad(-20), math.rad(0), math.rad(140)), 0.5)
RH.C0=clerp(RH.C0,cf(1,-0.25,-0.5)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-1.5),math.rad(0),math.rad(-10)),.5)
LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-1),math.rad(0),math.rad(10)),.5)
	end
local rotz = 25
coroutine.resume(coroutine.create(function()
for i = 0, 4 do
local orb = Instance.new("Part", char)
        orb.BrickColor = keptcolor
        orb.CanCollide = false
        orb.FormFactor = 3
        orb.Name = "Ring"
        orb.Material = "Neon"
        orb.Size = Vector3.new(1, 1, 1)
        orb.Transparency = 11
        orb.TopSurface = 0
        orb.BottomSurface = 0
        local orbm = Instance.new("SpecialMesh", orb)
        orbm.MeshType = "Sphere"
orbm.Name = "SizeMesh"
orbm.Scale = vt(4,4,4)
orb.CFrame = root.CFrame + root.CFrame.lookVector*3
local eff = Instance.new("ParticleEmitter",orb)
eff.Texture = "rbxassetid://0296874871"
eff.LightEmission = 0.95
eff.Color = ColorSequence.new(orb.BrickColor.Color)
eff.Rate = 500
eff.Lifetime = NumberRange.new(1.5)
eff.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,7,0),NumberSequenceKeypoint.new(0.1,5,0),NumberSequenceKeypoint.new(0.8,2,0),NumberSequenceKeypoint.new(1,0,0)})
eff.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(0.8,0.5,0),NumberSequenceKeypoint.new(1,1,0)})
eff.Speed = NumberRange.new(25)
eff.Drag = 5
eff.Rotation = NumberRange.new(-500,500)
eff.VelocitySpread = 9000
eff.RotSpeed = NumberRange.new(-500,500)
	local a = Instance.new("Part",workspace)
	a.Name = "Direction"	
	a.Anchored = true
	a.BrickColor = bc("Bright red")
a.Material = "Neon"
a.Transparency = 11
	a.CanCollide = false
	local ray = Ray.new(
	    orb.CFrame.p,                           -- origin
	    (mouse.Hit.p - orb.CFrame.p).unit * 500 -- direction
	) 
	local ignore = orb
	local hit, position, normal = workspace:FindPartOnRay(ray, ignore)
	a.BottomSurface = 10
	a.TopSurface = 10
	local distance = (orb.CFrame.p - position).magnitude
	a.Size = Vector3.new(0.1, 0.1, 0.1)
	a.CFrame = CFrame.new(orb.CFrame.p, position) * CFrame.new(0, 0, 0)
orb.CFrame = a.CFrame
a:Destroy()
orb.CFrame = orb.CFrame*CFrame.Angles(0,math.rad(rotz),0)
rotz = rotz - 12.5
CFuncs["Sound"].Create("rbxassetid://335657174", orb, 3, 0.75)
CFuncs["Sound"].Create("rbxassetid://304448425", orb, 3.5, 0.9)
local bv = Instance.new("BodyVelocity")
bv.maxForce = Vector3.new(1e9, 1e9, 1e9)
bv.velocity = orb.CFrame.lookVector*225
bv.Parent = orb
game:GetService("Debris"):AddItem(orb, 10)
local hitted = false
local hit =orb.Touched:connect(function(hit) 
	if hitted == false and hit.Parent ~= char then
	hitted = true
	eff.Enabled = false
CameraEnshaking(4,4)
	for i = 0, 9 do
local disr = CreateParta(char,1,1,"Neon",keptcolor)
disr.CFrame = orb.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360)))
local at1 = Instance.new("Attachment",disr)
at1.Position = vt(-15,0,0)
local at2 = Instance.new("Attachment",disr)
at2.Position = vt(15,0,0)
local trl = Instance.new('Trail',disr)
trl.Attachment0 = at1
trl.FaceCamera = true
trl.Attachment1 = at2
trl.Texture = "rbxassetid://02325530138"
trl.LightEmission = 1
trl.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0),NumberSequenceKeypoint.new(1, 1)})
trl.Color = ColorSequence.new(keptcolor.Color)
trl.Lifetime = 0.5
local bv = Instance.new("BodyVelocity")
bv.maxForce = Vector3.new(1e9, 1e9, 1e9)
bv.velocity = disr.CFrame.lookVector*math.random(75,250)
bv.Parent = disr
local val = 0
coroutine.resume(coroutine.create(function()
	swait(30)
	for i = 0, 19 do
		swait()
		val = val + 0.05
		trl.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, val),NumberSequenceKeypoint.new(1, 1)})
	end
game:GetService("Debris"):AddItem(disr, 3)
end))
end
CFuncs["Sound"].Create("rbxassetid://1226980789", orb, 6, 0.7)
CFuncs["Sound"].Create("rbxassetid://1368637781", orb, 8,1)
CFuncs["Sound"].Create("rbxassetid://1368637781", orb, 8,1)
CFuncs["Sound"].Create("rbxassetid://763718160", orb, 7, 1.1)
CFuncs["Sound"].Create("rbxassetid://782353443", orb, 7, 1)
CFuncs["Sound"].Create("rbxassetid://178452221", orb, 6, 0.4)
	MagniDamage(orb, 25, 80,140, 0, "Normal")
sphere2(4,"Add",orb.CFrame,vt(4,4,4),0.5,0.5,0.5,keptcolor)
sphere2(3,"Add",orb.CFrame,vt(4,4,4),0.5,0.5,0.5,keptcolor)
sphere2(2,"Add",orb.CFrame,vt(4,4,4),0.5,0.5,0.5,keptcolor)
for i = 0, 9 do
sphere2(4,"Add",orb.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(1.5,1,1.5),-0.005,4,-0.005,keptcolor)
end
for i = 0, 19 do
slash(math.random(10,50)/10,5,true,"Round","Add","Out",orb.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(0.01,0.01,0.01),math.random(50,250)/250,BrickColor.new("White"))
end
for i = 0, 19 do
local rsiz = math.random(10,30)
sphereMK(math.random(2,6),1,"Add",orb.CFrame*CFrame.new(math.random(-20,20)/50,math.random(-20,20)/50,math.random(-20,20)/50)*CFrame.Angles(math.rad(90 + math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),rsiz/10,rsiz/10,rsiz/10,0,keptcolor,0)
end
local eff = Instance.new("ParticleEmitter",orb)
eff.Texture = "rbxassetid://0296874871"
eff.LightEmission = 0.95
eff.Color = ColorSequence.new(orb.BrickColor.Color)
eff.Rate = 10000
eff.Lifetime = NumberRange.new(1.5)
eff.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(0.1,15,0),NumberSequenceKeypoint.new(0.8,25,0),NumberSequenceKeypoint.new(1,0,0)})
eff.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(0.8,0.5,0),NumberSequenceKeypoint.new(1,1,0)})
eff.Speed = NumberRange.new(150)
eff.Drag = 5
eff.Rotation = NumberRange.new(-500,500)
eff.VelocitySpread = 9000
eff.RotSpeed = NumberRange.new(-500,500)
coroutine.resume(coroutine.create(function()
	wait(0.25)
	eff.Enabled = false
end))
orb.Anchored = true
orb.Transparency = 11
wait(10)
orb:Destroy()
end
end)
end
end))
	for i = 0,1,0.1 do
		swait()
            RootJoint.C0 = clerp(RootJoint.C0,RootCF*cf(0,0,0)* angles(math.rad(0),math.rad(0),math.rad(60)),0.3)
Torso.Neck.C0 = clerp(Torso.Neck.C0,necko *angles(math.rad(5),math.rad(0),math.rad(-60)),.3)
RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5, 0) * angles(math.rad(6), math.rad(-20), math.rad(12)), 0.3)
LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5, 0) * angles(math.rad(90), math.rad(0), math.rad(-20)), 0.3)
RH.C0=clerp(RH.C0,cf(1,-0.25,-0.5)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-1.5),math.rad(0),math.rad(-10)),.5)
LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-1),math.rad(0),math.rad(10)),.5)
	end
	for i = 0,1,0.1 do
		swait()
            RootJoint.C0 = clerp(RootJoint.C0,RootCF*cf(0,0,0)* angles(math.rad(0),math.rad(0),math.rad(70)),0.3)
Torso.Neck.C0 = clerp(Torso.Neck.C0,necko *angles(math.rad(5),math.rad(0),math.rad(-70)),.3)
RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5, 0) * angles(math.rad(6), math.rad(-20), math.rad(12)), 0.3)
LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5, 0) * angles(math.rad(170), math.rad(0), math.rad(-10)), 0.3)
RH.C0=clerp(RH.C0,cf(1,-0.25,-0.5)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-1.5),math.rad(0),math.rad(-10)),.5)
LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-1),math.rad(0),math.rad(10)),.5)
	end
coroutine.resume(coroutine.create(function()
for i = 0, 4 do
local orb = Instance.new("Part", char)
        orb.BrickColor = keptcolor
        orb.CanCollide = false
        orb.FormFactor = 3
        orb.Name = "Ring"
        orb.Material = "Neon"
        orb.Size = Vector3.new(1, 1, 1)
        orb.Transparency = 11
        orb.TopSurface = 0
        orb.BottomSurface = 0
        local orbm = Instance.new("SpecialMesh", orb)
        orbm.MeshType = "Sphere"
orbm.Name = "SizeMesh"
orbm.Scale = vt(4,4,4)
orb.CFrame = root.CFrame + root.CFrame.lookVector*3
local eff = Instance.new("ParticleEmitter",orb)
eff.Texture = "rbxassetid://0296874871"
eff.LightEmission = 0.95
eff.Color = ColorSequence.new(orb.BrickColor.Color)
eff.Rate = 500
eff.Lifetime = NumberRange.new(1.5)
eff.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,7,0),NumberSequenceKeypoint.new(0.1,5,0),NumberSequenceKeypoint.new(0.8,2,0),NumberSequenceKeypoint.new(1,0,0)})
eff.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(0.8,0.5,0),NumberSequenceKeypoint.new(1,1,0)})
eff.Speed = NumberRange.new(25)
eff.Drag = 5
eff.Rotation = NumberRange.new(-500,500)
eff.VelocitySpread = 9000
eff.RotSpeed = NumberRange.new(-500,500)
	local a = Instance.new("Part",workspace)
	a.Name = "Direction"	
	a.Anchored = true
	a.BrickColor = bc("Bright red")
a.Material = "Neon"
a.Transparency = 11
	a.CanCollide = false
	local ray = Ray.new(
	    orb.CFrame.p,                           -- origin
	    (mouse.Hit.p - orb.CFrame.p).unit * 500 -- direction
	) 
	local ignore = orb
	local hit, position, normal = workspace:FindPartOnRay(ray, ignore)
	a.BottomSurface = 10
	a.TopSurface = 10
	local distance = (orb.CFrame.p - position).magnitude
	a.Size = Vector3.new(0.1, 0.1, 0.1)
	a.CFrame = CFrame.new(orb.CFrame.p, position) * CFrame.new(0, 0, 0)
orb.CFrame = a.CFrame
a:Destroy()
rotz = rotz + 12.5
orb.CFrame = orb.CFrame*CFrame.Angles(math.rad(rotz),0,0)
CFuncs["Sound"].Create("rbxassetid://335657174", orb, 3, 0.75)
CFuncs["Sound"].Create("rbxassetid://304448425", orb, 3.5, 0.9)
local bv = Instance.new("BodyVelocity")
bv.maxForce = Vector3.new(1e9, 1e9, 1e9)
bv.velocity = orb.CFrame.lookVector*225
bv.Parent = orb
game:GetService("Debris"):AddItem(orb, 10)
local hitted = false
local hit =orb.Touched:connect(function(hit) 
	if hitted == false and hit.Parent ~= char then
	hitted = true
	eff.Enabled = false
CameraEnshaking(4,4)
for i = 0, 9 do
local disr = CreateParta(char,1,1,"Neon",keptcolor)
disr.CFrame = orb.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360)))
local at1 = Instance.new("Attachment",disr)
at1.Position = vt(-15,0,0)
local at2 = Instance.new("Attachment",disr)
at2.Position = vt(15,0,0)
local trl = Instance.new('Trail',disr)
trl.Attachment0 = at1
trl.FaceCamera = true
trl.Attachment1 = at2
trl.Texture = "rbxassetid://02325530138"
trl.LightEmission = 1
trl.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0),NumberSequenceKeypoint.new(1, 1)})
trl.Color = ColorSequence.new(keptcolor.Color)
trl.Lifetime = 0.5
local bv = Instance.new("BodyVelocity")
bv.maxForce = Vector3.new(1e9, 1e9, 1e9)
bv.velocity = disr.CFrame.lookVector*math.random(75,250)
bv.Parent = disr
local val = 0
coroutine.resume(coroutine.create(function()
	swait(30)
	for i = 0, 19 do
		swait()
		val = val + 0.05
		trl.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, val),NumberSequenceKeypoint.new(1, 1)})
	end
game:GetService("Debris"):AddItem(disr, 3)
end))
end
CFuncs["Sound"].Create("rbxassetid://1226980789", orb, 6, 0.7)
CFuncs["Sound"].Create("rbxassetid://1368637781", orb, 8,1)
CFuncs["Sound"].Create("rbxassetid://1368637781", orb, 8,1)
CFuncs["Sound"].Create("rbxassetid://763718160", orb, 7, 1.1)
CFuncs["Sound"].Create("rbxassetid://782353443", orb, 7, 1)
CFuncs["Sound"].Create("rbxassetid://178452221", orb, 6, 0.4)
	MagniDamage(orb, 25, 80,140, 0, "Normal")
sphere2(4,"Add",orb.CFrame,vt(4,4,4),0.5,0.5,0.5,keptcolor)
sphere2(3,"Add",orb.CFrame,vt(4,4,4),0.5,0.5,0.5,keptcolor)
sphere2(2,"Add",orb.CFrame,vt(4,4,4),0.5,0.5,0.5,keptcolor)
for i = 0, 9 do
sphere2(4,"Add",orb.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(1.5,1,1.5),-0.005,4,-0.005,keptcolor)
end
for i = 0, 19 do
slash(math.random(10,50)/10,5,true,"Round","Add","Out",orb.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(0.01,0.01,0.01),math.random(50,250)/250,BrickColor.new("White"))
end
for i = 0, 24 do
local rsiz = math.random(10,30)
sphereMK(math.random(1,3),1,"Add",orb.CFrame*CFrame.new(math.random(-20,20)/50,math.random(-20,20)/50,math.random(-20,20)/50)*CFrame.Angles(math.rad(90 + math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),rsiz/10,rsiz/10,rsiz/10,0,keptcolor,0)
end
local eff = Instance.new("ParticleEmitter",orb)
eff.Texture = "rbxassetid://0296874871"
eff.LightEmission = 0.95
eff.Color = ColorSequence.new(orb.BrickColor.Color)
eff.Rate = 10000
eff.Lifetime = NumberRange.new(1.5)
eff.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(0.1,15,0),NumberSequenceKeypoint.new(0.8,25,0),NumberSequenceKeypoint.new(1,0,0)})
eff.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(0.8,0.5,0),NumberSequenceKeypoint.new(1,1,0)})
eff.Speed = NumberRange.new(150)
eff.Drag = 5
eff.Rotation = NumberRange.new(-500,500)
eff.VelocitySpread = 9000
eff.RotSpeed = NumberRange.new(-500,500)
coroutine.resume(coroutine.create(function()
	wait(0.25)
	eff.Enabled = false
end))
orb.Anchored = true
orb.Transparency = 11
wait(10)
orb:Destroy()
end
end)
end
end))
	for i = 0,2,0.1 do
		swait()
            RootJoint.C0 = clerp(RootJoint.C0,RootCF*cf(0,0,0)* angles(math.rad(20),math.rad(0),math.rad(-80)),0.3)
Torso.Neck.C0 = clerp(Torso.Neck.C0,necko *angles(math.rad(5),math.rad(0),math.rad(80)),.3)
RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5, 0) * angles(math.rad(6), math.rad(-20), math.rad(12)), 0.3)
LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5, 0) * angles(math.rad(10), math.rad(0), math.rad(-30)), 0.3)
RH.C0=clerp(RH.C0,cf(1,-0.25,-0.5)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-1.5),math.rad(0),math.rad(-10)),.5)
LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-1),math.rad(0),math.rad(10)),.5)
	end
vel:Destroy()
hum.WalkSpeed = storehumanoidWS
attack = false
end

function BeamOfDeath()
attack = true
hum.WalkSpeed = 0 
CFuncs["Sound"].Create("rbxassetid://1368598393", rarm, 8, 1)
for i = 0, 5, 0.1 do
swait()
block(8,"Add",rarm.CFrame*CFrame.new(0,-2,0)*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(1,1,1),0.01,0.01,0.01,BrickColor.new("Really red"),Color3.new(1,0,0))
RH.C0=clerp(RH.C0,cf(1,-0.5,-0.6)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(1),math.rad(0),math.rad(-10)),.1)
LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(1.25),math.rad(0),math.rad(6)),.1)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,1)*angles(math.rad(0),math.rad(0),math.rad(60)),.1)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(20),math.rad(-5),math.rad(-60)),.1)
RW.C0=clerp(RW.C0,cf(1.5,0.5,0)*angles(math.rad(90),math.rad(1),math.rad(60)),.1)
LW.C0=clerp(LW.C0,cf(-0.95,0.65,-0.65)*angles(math.rad(90),math.rad(25),math.rad(73)),.1)
end
CFuncs["Sound"].Create("rbxassetid://335657174", rarm, 8, 1)
for i = 0, 14 do
slash(math.random(10,40)/10,5,true,"Round","Add","Out",rarm.CFrame*CFrame.new(0,-2,0)*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(0.01,0.01,0.01),math.random(25,150)/250,BrickColor.new("Really red"))
end
block(3,"Add",rarm.CFrame*CFrame.new(0,-2,0)*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(1,1,1),0.05,0.05,0.05,BrickColor.new("Really red"),Color3.new(1,0,0))
block(3,"Add",rarm.CFrame*CFrame.new(0,-2,0)*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(1,1,1),0.1,0.15,0.1,BrickColor.new("Really red"),Color3.new(1,0,0))
local keptcolor = MAINRUINCOLOR
local orb = Instance.new("Part", char)
        orb.BrickColor = keptcolor
        orb.CanCollide = false
        orb.FormFactor = 3
        orb.Name = "Ring"
        orb.Material = "Neon"
        orb.Size = Vector3.new(1, 1, 1)
        orb.Transparency = 11
        orb.TopSurface = 0
        orb.BottomSurface = 0
        local orbm = Instance.new("SpecialMesh", orb)
        orbm.MeshType = "Sphere"
orbm.Name = "SizeMesh"
orbm.Scale = vt(22.5,10000,22.5)
orb.CFrame = mouse.Hit
orb.Anchored = true
orb.Orientation = vt(0,0,0)
orb.CFrame = orb.CFrame*CFrame.new(0,1,0)
CFuncs["LongSound"].Create("rbxassetid://1545630949", char, 2.5, 1)
local bgui,imgc = createBGCircle(300,orb,MAINRUINCOLOR.Color)
bgui.AlwaysOnTop = true
imgc.ImageTransparency = 11
imgc.Image = "rbxassetid://2325939897"
local over = false
coroutine.resume(coroutine.create(function()
while true do
swait()
imgc.Rotation = imgc.Rotation + 5
if over == true then
break
end
end
end))
coroutine.resume(coroutine.create(function()
coroutine.resume(coroutine.create(function()
for i = 0, 399 do
swait()
bgui.Size = bgui.Size - UDim2.new(0.5,0,0.5,0)
imgc.ImageTransparency = 1+imgc.ImageTransparency - 0.0025
orbm.Scale = orbm.Scale - vt(0.05,0,0.05)
--orb.Transparency = 1+orb.Transparency - 0.0025
end
end))
wait(9)
CameraEnshaking(15,5)
for i = 0, 99 do
local dis = CreateParta(char,1,1,"Neon",MAINRUINCOLOR)
dis.CFrame = orb.CFrame*CFrame.new(math.random(-5,5),math.random(-5,5),math.random(-5,5))*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360)))
local at1 = Instance.new("Attachment",dis)
at1.Position = vt(-25000,0,0)
local at2 = Instance.new("Attachment",dis)
at2.Position = vt(25000,0,0)
local trl = Instance.new('Trail',dis)
trl.Attachment0 = at1
trl.FaceCamera = true
trl.Attachment1 = at2
trl.Texture = "rbxassetid://01049219073"
trl.LightEmission = 1
trl.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0),NumberSequenceKeypoint.new(1, 1)})
trl.Color = ColorSequence.new(keptcolor.Color)
trl.Lifetime = 5
local bv = Instance.new("BodyVelocity")
bv.maxForce = Vector3.new(1e9, 1e9, 1e9)
bv.velocity = dis.CFrame.lookVector*math.random(1500,7500)
bv.Parent = dis
game:GetService("Debris"):AddItem(dis, 15)
end
CFuncs["Sound"].Create("rbxassetid://763718160", char, 6, 1.1)
CFuncs["Sound"].Create("rbxassetid://782353443", char, 6, 1)
CFuncs["LongSound"].Create("rbxassetid://763717897", char, 5, 0.5)
CFuncs["LongSound"].Create("rbxassetid://763717897", char, 4, 0.75)
CFuncs["Sound"].Create("rbxassetid://1664711478", char, 6, 1)
coroutine.resume(coroutine.create(function()
local hfr,pfr=rayCast(orb.Position,(CFrame.new(orb.Position,orb.Position - Vector3.new(0,1,0))).lookVector,4,char)
if hfr ~= nil then
	for i = 0, 49 do
local deb = Instance.new("Part", char)
deb.Anchored = true
deb.CanCollide = false
deb.FormFactor = 3
deb.Name = "Ring"
deb.Material = hitfloor.Material
deb.Color = hitfloor.Color
deb.Size = vt(math.random(50,55),math.random(50,55),math.random(50,55))
deb.Transparency = 11
deb.TopSurface = 0
deb.BottomSurface = 0
deb.CFrame = orb.CFrame*CFrame.new(math.random(-150,150),-5,math.random(-150,150))*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360)))
local deb2 = Instance.new("Part", char)
deb2.CanCollide = false
deb2.FormFactor = 3
deb2.Name = "Ring"
deb2.Material = hitfloor.Material
deb2.Color = hitfloor.Color
deb2.Size = vt(math.random(34,38),math.random(34,38),math.random(34,38))
deb2.Transparency = 11
deb2.TopSurface = 0
deb2.BottomSurface = 0
deb2.Velocity = vt(math.random(-150,150),math.random(250,650),math.random(-150,150))
deb2.CFrame = orb.CFrame*CFrame.new(math.random(-60,60),-5,math.random(-60,60))*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360)))
local eff = Instance.new("ParticleEmitter",deb)
eff.Texture = "rbxassetid://0363275192"
eff.LightEmission = 0.95
eff.Color = ColorSequence.new(keptcolor.Color)
eff.Rate = 100
eff.Lifetime = NumberRange.new(1)
eff.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,40,0),NumberSequenceKeypoint.new(1,45,0)})
eff.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,1,0),NumberSequenceKeypoint.new(0.5,0.5,0),NumberSequenceKeypoint.new(1,1,0)})
eff.Speed = NumberRange.new(0,5)
eff.Rotation = NumberRange.new(-500,500)
eff.VelocitySpread = 9000
eff.RotSpeed = NumberRange.new(-10,10)
local at1 = Instance.new('Attachment',deb2)
at1.Position = vt(0,15,0)
local at2 = Instance.new('Attachment',deb2)
at2.Position = vt(0,-15,0)
local tl = Instance.new('Trail',deb2)
tl.Attachment0 = at1
tl.Attachment1 = at2
tl.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0),NumberSequenceKeypoint.new(1, 1)})
tl.Color = ColorSequence.new(BrickColor.new('White').Color)
tl.Lifetime = 1
game:GetService("Debris"):AddItem(deb,30)
game:GetService("Debris"):AddItem(deb2,30)
coroutine.resume(coroutine.create(function()
	wait(15)
eff.Enabled = false
	for i = 0, 49 do
		swait()
		deb.Transparency = 1+deb.Transparency + 0.02
	end
wait(1)
	deb:Destroy()
end))
end
end
end))
for i = 0, 49, 0.1 do
swait(1.5)
bgui.Size = bgui.Size + UDim2.new(45,0,45,0)
imgc.ImageTransparency = 1+imgc.ImageTransparency + 0.01
for i, v in pairs(FindNearestHead(orb.CFrame.p, 175)) do
if v:FindFirstChild('Head') then
dmg(v)
end
end
for i = 0, 2 do
slash(math.random(40,80)/10,5,true,"Round","Add","Out",orb.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(0.01,0.01,0.01),math.random(500,2500)/250,BrickColor.new("White"))
end
sphere2(5,"Add",orb.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(10,10,10),5,5,5,keptcolor)
sphere2(5,"Add",orb.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(10,10,10),1,35,1,keptcolor)
sphere2(5,"Add",orb.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(10,10,10),0,50,0,keptcolor)
sphere2(5,"Add",orb.CFrame,vt(10,100000,10),2,2,2,keptcolor)
end
over = true
orb:Destroy()
end))
hum.WalkSpeed = storehumanoidWS
attack = false
end



function Beams()
attack = true
hum.WalkSpeed = 0 
local keptcolor = MAINRUINCOLOR
coroutine.resume(coroutine.create(function()
for i = 0, 24 do
swait(5)
local orb = Instance.new("Part", char)
CFuncs["Sound"].Create("rbxassetid://663361028", orb, 2, 1)
        orb.BrickColor = keptcolor
        orb.CanCollide = false
        orb.FormFactor = 3
        orb.Name = "Ring"
        orb.Material = "Neon"
        orb.Size = Vector3.new(1, 1, 1)
        orb.Transparency = 11
        orb.TopSurface = 0
        orb.BottomSurface = 0
orb.Anchored = true
        local orbm = Instance.new("SpecialMesh", orb)
        orbm.MeshType = "Sphere"
orbm.Name = "SizeMesh"
orbm.Scale = vt(1.25,1.25,1.25)
orb.CFrame = root.CFrame*CFrame.new(math.random(-6,6),math.random(3,9),math.random(-6,6))
sphere2(6,"Add",orb.CFrame,vt(1.25,1.25,1.25),0.025,0.025,0.025,keptcolor)
coroutine.resume(coroutine.create(function()
local eff = Instance.new("ParticleEmitter",orb)
eff.Texture = "rbxassetid://02273224484"
eff.LightEmission = 1
eff.Color = ColorSequence.new(keptcolor.Color)
eff.Rate = 1500
eff.Lifetime = NumberRange.new(0.5,1)
eff.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,4,0),NumberSequenceKeypoint.new(0.2,1,0),NumberSequenceKeypoint.new(1,0,0)})
eff.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,1,0),NumberSequenceKeypoint.new(0.2,0,0),NumberSequenceKeypoint.new(1,1,0)})
eff.Speed = NumberRange.new(10,30)
eff.Drag = 5
eff.Rotation = NumberRange.new(-500,500)
eff.VelocitySpread = 9000
eff.RotSpeed = NumberRange.new(-500,500)
wait(0.25)
eff.Enabled = false
end))
coroutine.resume(coroutine.create(function()
wait(0.5)
CFuncs["Sound"].Create("rbxassetid://161006182", orb, 2.5, 1.1)
sphere2(3,"Add",orb.CFrame,vt(1.25,1.25,1.25),0.025,0.025,0.025,keptcolor)
sphere2(4,"Add",orb.CFrame,vt(1.25,1.25,1.25),0.025,0.025,0.025,keptcolor)
orb.Transparency = 11
	local a = Instance.new("Part",char)
	a.Name = "Direction"	
	a.Anchored = true
	a.BrickColor = keptcolor
a.Material = "Neon"
a.Transparency = 11.25
a.Shape = "Cylinder"
	local ht = Instance.new("Part",char)
	ht.Name = "DirectionHit"	
	ht.Anchored = true
	ht.BrickColor = keptcolor
ht.CanCollide = false
ht.Transparency = 11
ht.Size = vt(0.1,0.1,0.1)
CFuncs["Sound"].Create("rbxassetid://183763487", ht, 2, 1.2)
	a.CanCollide = false
	local ray = Ray.new(
	    orb.CFrame.p,                           -- origin
	    (mouse.Hit.p - orb.CFrame.p).unit * 500 -- direction
	) 
	local ignore = char
	local hit, position, normal = workspace:FindPartOnRay(ray, ignore)
	a.BottomSurface = 10
	a.TopSurface = 10
	local distance = (orb.CFrame.p - position).magnitude
	a.Size = Vector3.new(distance,1,1)
	a.CFrame = CFrame.new(orb.CFrame.p, position) * CFrame.new(0, 0, -distance/2)
	ht.CFrame = CFrame.new(orb.CFrame.p, position) * CFrame.new(0, 0, -distance)
sphere2(2,"Add",ht.CFrame,vt(1.25,1.25,1.25),0.15,0.15,0.15,keptcolor)
sphere2(4,"Add",ht.CFrame,vt(1.25,1.25,1.25),0.15,0.15,0.15,keptcolor)
MagniDamage(ht, 9, 10,15, 0, "Normal")
CameraEnshaking(2,1)
coroutine.resume(coroutine.create(function()
	for i = 0, 9 do
local disr = CreateParta(char,1,1,"Neon",keptcolor)
disr.CFrame = ht.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360)))
local at1 = Instance.new("Attachment",disr)
at1.Position = vt(-2,0,0)
local at2 = Instance.new("Attachment",disr)
at2.Position = vt(2,0,0)
local trl = Instance.new('Trail',disr)
trl.Attachment0 = at1
trl.FaceCamera = true
trl.Attachment1 = at2
trl.Texture = "rbxassetid://02325530138"
trl.LightEmission = 1
trl.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0),NumberSequenceKeypoint.new(1, 1)})
trl.Color = ColorSequence.new(keptcolor.Color)
trl.Lifetime = 0.5
local bv = Instance.new("BodyVelocity")
bv.maxForce = Vector3.new(1e9, 1e9, 1e9)
bv.velocity = disr.CFrame.lookVector*math.random(25,100)
bv.Parent = disr
local val = 0
coroutine.resume(coroutine.create(function()
	swait(30)
	for i = 0, 9 do
		swait()
		val = val + 0.1
		trl.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, val),NumberSequenceKeypoint.new(1, 1)})
	end
game:GetService("Debris"):AddItem(disr, 3)
end))
end
local eff = Instance.new("ParticleEmitter",ht)
eff.Texture = "rbxassetid://02273224484"
eff.LightEmission = 1
eff.Color = ColorSequence.new(keptcolor.Color)
eff.Rate = 5000
eff.Lifetime = NumberRange.new(0.5,1.5)
eff.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,10,0),NumberSequenceKeypoint.new(0.2,2,0),NumberSequenceKeypoint.new(1,0,0)})
eff.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,1,0),NumberSequenceKeypoint.new(0.1,0,0),NumberSequenceKeypoint.new(0.5,0.25,0),NumberSequenceKeypoint.new(1,1,0)})
eff.Speed = NumberRange.new(5,100)
eff.Drag = 5
eff.Rotation = NumberRange.new(-500,500)
eff.VelocitySpread = 9000
eff.RotSpeed = NumberRange.new(-50,50)
wait(0.25)
eff.Enabled = false
end))
for i = 0, 4 do
slash(math.random(10,60)/10,5,true,"Round","Add","Out",ht.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(0.01,0.01,0.01),math.random(10,50)/250,BrickColor.new("White"))
sphere2(8,"Add",orb.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(1,1,1),-0.005,0.125,-0.005,keptcolor)
sphere2(4,"Add",ht.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(2,1,2),-0.01,0.5,-0.01,keptcolor)
local rsiz = math.random(10,30)
sphereMK(math.random(2,4),0.25,"Add",ht.CFrame*CFrame.Angles(math.rad(90 + math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),rsiz/10,rsiz/10,rsiz/10,0,keptcolor,0)
end
a.CFrame = a.CFrame*CFrame.Angles(0,math.rad(90),0)
local msh = Instance.new("SpecialMesh",a)
msh.MeshType = "Cylinder"
msh.Scale = vt(1,1,1)
for i = 0, 49 do
swait()
msh.Scale = msh.Scale + vt(0,0.01,0.01)
a.Transparency = 1+a.Transparency + 0.02
end
wait(1)
orb:Destroy()
a:Destroy()
ht:Destroy()
end))
game:GetService("Debris"):AddItem(orb, 10)
end
end))
	for i = 0,12,0.1 do
		swait()
sphere2(7,"Add",sorb.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(1,1,1),-0.01,0.075,-0.01,keptcolor)
            RootJoint.C0 = clerp(RootJoint.C0,RootCF*cf(0,0,0)* angles(math.rad(0),math.rad(0),math.rad(40)),0.3)
Torso.Neck.C0 = clerp(Torso.Neck.C0,necko *angles(math.rad(-10),math.rad(0),math.rad(-40)),.3)
RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5, 0) * angles(math.rad(170), math.rad(0), math.rad(10)), 0.3)
LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5, 0) * angles(math.rad(6), math.rad(20), math.rad(-10)), 0.3)
RH.C0=clerp(RH.C0,cf(1,-1,0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-1.5),math.rad(-20),math.rad(0)),.3)
LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-1),math.rad(0),math.rad(0)),.3)
	end
hum.WalkSpeed = storehumanoidWS
attack = false
end

function smiter()
local targetted = nil
if mouse.Target.Parent ~= Character and mouse.Target.Parent.Parent ~= Character and mouse.Target.Parent:FindFirstChildOfClass("Humanoid") ~= nil then
targetted = mouse.Target.Parent
end
if targetted ~= nil then
attack = true
hum.WalkSpeed = 0
coroutine.resume(coroutine.create(function()
CFuncs["Sound"].Create("rbxassetid://1117054464", targetted.Head, 2, 1)
sphere2(4,"Add",targetted.Head.CFrame,vt(8,8,8),0.1,0.1,0.1,MAINRUINCOLOR)
local vel = Instance.new("BodyPosition", targetted.Head)
vel.P = 12500
vel.D = 1000
vel.maxForce = Vector3.new(50000000000, 10e10, 50000000000)
vel.position = targetted.Head.CFrame.p
end))
CFuncs["Sound"].Create("rbxassetid://671759140", sorb2, 1, 1.2)
	for i = 0,4,0.1 do
		swait()
sphere2(4,"Add",sorb2.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(1,1,1),-0.01,0.125,-0.01,MAINRUINCOLOR)
            RootJoint.C0 = clerp(RootJoint.C0,RootCF*cf(0,0,0)* angles(math.rad(0),math.rad(0),math.rad(-60)),0.2)
Torso.Neck.C0 = clerp(Torso.Neck.C0,necko *angles(math.rad(-10),math.rad(0),math.rad(60)),.2)
RW.C0=clerp(RW.C0,cf(1.5,0.5 + 0.01 * math.cos(sine / 28),0)*angles(math.rad(15),math.rad(15),math.rad(-10)),.2)
LW.C0=clerp(LW.C0, CFrame.new(-1.5, 0.5, 0) * angles(math.rad(170), math.rad(0), math.rad(-40)), 0.2)
RH.C0=clerp(RH.C0,cf(1,-1,0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-1.5),math.rad(0),math.rad(0)),.2)
LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-1),math.rad(20),math.rad(5)),.2)
	end
coroutine.resume(coroutine.create(function()
CameraEnshaking(6,5)
MagniDamage(targetted.Head, 18, 18,30, 0, "Normal")
CFuncs["Sound"].Create("rbxassetid://1042705869", targetted.Head, 6.5, 0.8)
CFuncs["Sound"].Create("rbxassetid://1042716828", targetted.Head, 6.25, 0.8)
CFuncs["Sound"].Create("rbxassetid://1117054464", targetted.Head, 5, 0.8)
for i = 0, 19 do
slash(math.random(10,50)/10,5,true,"Round","Add","Out",targetted.Head.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(0.01,0.01,0.01),math.random(50,250)/250,BrickColor.new("White"))
end
sphere2(3,"Add",targetted.Head.CFrame,vt(0,40000,0),0.25,0,0.25,MAINRUINCOLOR)
sphere2(2,"Add",targetted.Head.CFrame,vt(0,40000,0),0.25,0,0.25,MAINRUINCOLOR)
sphere2(4,"Add",targetted.Head.CFrame,vt(0,0,0),0.5,0.5,0.5,MAINRUINCOLOR)
sphere2(5,"Add",targetted.Head.CFrame,vt(0,0,0),0.5,0.5,0.5,MAINRUINCOLOR)
coroutine.resume(coroutine.create(function()
local eff = Instance.new("ParticleEmitter",targetted.Head)
eff.Texture = "rbxassetid://0363275192"
eff.LightEmission = 0.95
eff.Color = ColorSequence.new(MAINRUINCOLOR.Color)
eff.Rate = 10000
eff.Lifetime = NumberRange.new(1.5)
eff.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,15,0),NumberSequenceKeypoint.new(0.8,25,0),NumberSequenceKeypoint.new(1,0,0)})
eff.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(0.8,0.5,0),NumberSequenceKeypoint.new(1,1,0)})
eff.Speed = NumberRange.new(25,150)
eff.Drag = 5
eff.Rotation = NumberRange.new(-500,500)
eff.VelocitySpread = 9000
eff.RotSpeed = NumberRange.new(-50,50)
local eff2 = eff:Clone()
eff2.Parent = targetted.Head
eff2.LightEmission = 1
eff2.Color = ColorSequence.new(Color3.new(0.75,0.5,1))
eff2.Texture = "rbxassetid://02273224484"
eff2.Rate = 10000
eff2.Lifetime = NumberRange.new(1,3)
eff2.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,20,0),NumberSequenceKeypoint.new(0.2,10,0),NumberSequenceKeypoint.new(1,0,0)})
eff2.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,1,0),NumberSequenceKeypoint.new(0.2,0,0),NumberSequenceKeypoint.new(0.8,0.5,0),NumberSequenceKeypoint.new(1,1,0)})
eff2.Drag = 5
eff2.Speed = NumberRange.new(50,250)
eff2.Rotation = NumberRange.new(-500,500)
eff2.VelocitySpread = 9000
wait(0.5)
eff2.Enabled = false
eff.Enabled = false
end))
for i = 0, 9 do
sphere2(3,"Add",targetted.Head.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(2,1,2),-0.02,3,-0.02,MAINRUINCOLOR)
end
for i = 0, 49 do
local rsiz = math.random(10,50)
sphereMK(math.random(1,4),1,"Add",targetted.Head.CFrame*CFrame.new(math.random(-20,20)/50,math.random(-20,20)/50,math.random(-20,20)/50)*CFrame.Angles(math.rad(90 + math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),rsiz/10,rsiz/10,rsiz/10,0,MAINRUINCOLOR,0)
end
game:GetService("Debris"):AddItem(vel,1)
dmg(targetted)
end))
	for i = 0,1,0.1 do
		swait()
            RootJoint.C0 = clerp(RootJoint.C0,RootCF*cf(0,0,0)* angles(math.rad(0),math.rad(0),math.rad(-70)),0.5)
Torso.Neck.C0 = clerp(Torso.Neck.C0,necko *angles(math.rad(5),math.rad(0),math.rad(70)),.5)
RW.C0=clerp(RW.C0,cf(1.5,0.5 + 0.01 * math.cos(sine / 28),0)*angles(math.rad(15),math.rad(15),math.rad(-10)),.5)
LW.C0=clerp(LW.C0, CFrame.new(-1.5, 0.5, 0) * angles(math.rad(40), math.rad(0), math.rad(-50)), 0.5)
RH.C0=clerp(RH.C0,cf(1,-1,0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-1.5),math.rad(0),math.rad(0)),.5)
LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-1),math.rad(20),math.rad(5)),.5)
	end
attack = false
hum.WalkSpeed = storehumanoidWS
end
end

function supsmiter()
local targetted = nil
if mouse.Target.Parent ~= Character and mouse.Target.Parent.Parent ~= Character and mouse.Target.Parent:FindFirstChildOfClass("Humanoid") ~= nil then
targetted = mouse.Target.Parent
end
if targetted ~= nil then
attack = true
hum.WalkSpeed = 0
coroutine.resume(coroutine.create(function()
CFuncs["Sound"].Create("rbxassetid://1042716828", targetted.Head, 5, 0.5)
local vel = Instance.new("BodyPosition", targetted.Head)
vel.P = 12500
vel.D = 1000
vel.maxForce = Vector3.new(50000000000, 10e10, 50000000000)
vel.position = targetted.Head.CFrame.p + vt(0,10,0)
for i,v in pairs(targetted:GetChildren()) do
if v:IsA("Part") or v:IsA("MeshPart") then
coroutine.resume(coroutine.create(function()
local bld = Instance.new("ParticleEmitter",v)
bld.LightEmission = 0.75
bld.Texture = "rbxassetid://0363275192" ---284205403
bld.Color = ColorSequence.new(MAINRUINCOLOR.Color)
bld.Rate = 500
bld.Lifetime = NumberRange.new(1)
bld.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,2,0),NumberSequenceKeypoint.new(0.8,2.25,0),NumberSequenceKeypoint.new(1,0,0)})
bld.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0.5,0),NumberSequenceKeypoint.new(0.8,0.75,0),NumberSequenceKeypoint.new(1,1,0)})
bld.Speed = NumberRange.new(2,5)
bld.VelocitySpread = 50000
bld.Rotation = NumberRange.new(-500,500)
bld.RotSpeed = NumberRange.new(-500,500)
end))
end
end
local A1 = Instance.new("Attachment",sorb2)
local A2 = Instance.new("Attachment",targetted.Head)
local Beem = Instance.new("Beam",targetted.Head)
Beem.Attachment0 = A1
Beem.Attachment1 = A2
Beem.LightEmission = 1
Beem.FaceCamera = true
Beem.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0),NumberSequenceKeypoint.new(1, 0)})
Beem.Width0 = 1
Beem.Width1 = 1
Beem.Texture = "rbxassetid://01134824633"
Beem.TextureMode = "Wrap"
Beem.TextureLength = 2
Beem.TextureSpeed = 5
Beem.Color = ColorSequence.new(MAINRUINCOLOR.Color)
end))
local rd = math.random(1,5)
if rd == 1 then
chatfunc("Your fate goes here.",MAINRUINCOLOR.Color,"Inverted","Antique",1.5)
elseif rd == 2 then
chatfunc("You're nonexistant.",MAINRUINCOLOR.Color,"Inverted","Antique",1.5)
elseif rd == 3 then
chatfunc("Sigh... you really make me bored, dont ya?",MAINRUINCOLOR.Color,"Inverted","Antique",1.5)
elseif rd == 4 then
chatfunc("Nothing will exist into you after you're gone!",MAINRUINCOLOR.Color,"Inverted","Antique",1.5)
elseif rd == 5 then
chatfunc("You're a disgrace to this universe!",MAINRUINCOLOR.Color,"Inverted","Antique",1.5)
end
CFuncs["Sound"].Create("rbxassetid://1042700914", sorb2, 2.5, 0.25)
	for i = 0,14,0.1 do
		swait()
rsiz = math.random(5,15)
sphereMK(math.random(3,9),0.25,"Add",sorb2.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),rsiz/10,rsiz/10,rsiz/10,0,MAINRUINCOLOR,-15)	
sphere2(4,"Add",sorb2.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(1.5,1.5,1.5),-0.01,0.15,-0.01,MAINRUINCOLOR)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,1 + 0.1 * math.cos(sine / 28))* angles(math.rad(0),math.rad(0),math.rad(-60)),0.2)
Torso.Neck.C0 = clerp(Torso.Neck.C0,necko *angles(math.rad(-10),math.rad(0),math.rad(60)),.2)
RW.C0=clerp(RW.C0,cf(1.5,0.5 + 0.01 * math.cos(sine / 28),0)*angles(math.rad(15),math.rad(15),math.rad(-10)),.2)
LW.C0=clerp(LW.C0, CFrame.new(-1.5, 0.5, 0) * angles(math.rad(170), math.rad(0), math.rad(-40)), 0.2)
RH.C0=clerp(RH.C0,cf(1,-0.5,-0.6)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-1),math.rad(0),math.rad(-10 + 1 * math.cos(sine / 34))),.2)
LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-1.5),math.rad(0),math.rad(5 + 1 * math.cos(sine / 34))),.2)
	end
sphere2(3,"Add",sorb2.CFrame,vt(0,0,0),0.1,0.1,0.1,MAINRUINCOLOR)
sphere2(3,"Add",sorb2.CFrame,vt(0,0,0),0.2,0.2,0.2,MAINRUINCOLOR)
CFuncs["Sound"].Create("rbxassetid://1368637781", sorb2, 2.5, 1.1)
coroutine.resume(coroutine.create(function()
local ref = Instance.new("Part", char)
ref.Anchored = true
ref.CanCollide = false
ref.Transparency = 11
ref.CFrame = targetted.Head.CFrame
sphere2(1,"Add",targetted.Head.CFrame,vt(8,8,8),0.25,0.25,0.25,MAINRUINCOLOR)
sphere2(2,"Add",targetted.Head.CFrame,vt(8,8,8),0.5,0.5,0.5,MAINRUINCOLOR)
sphere2(3,"Add",targetted.Head.CFrame,vt(8,8,8),0.75,0.75,0.75,MAINRUINCOLOR)
for i = 0, 24 do
slash(math.random(10,25)/10,5,true,"Round","Add","Out",targetted.Head.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(0.001,0.001,0.001),math.random(25,250)/250,BrickColor.new("White"))
end
targetted.Head.Parent:Destroy()
CFuncs["Sound"].Create("rbxassetid://1368637781", ref, 10, 1)
CFuncs["Sound"].Create("rbxassetid://763718160", ref, 10, 1.1)
CFuncs["Sound"].Create("rbxassetid://782353443", ref, 10, 1)
CFuncs["Sound"].Create("rbxassetid://335657174", ref, 10, 1)
wait(5)
ref:Destroy()
end))
attack = false
hum.WalkSpeed = storehumanoidWS
end
end

function BinaryBLINK()
for i = 0, 9 do
sphere2(6,"Add",root.CFrame*CFrame.new(math.random(-15,15),math.random(-15,15),math.random(-15,15))*CFrame.Angles(math.rad(0),math.rad(0),math.rad(90)),vt(0.5,0.5,0.5),-0.005,0.5,-0.005,MAINRUINCOLOR)		sphere2(6,"Add",root.CFrame*CFrame.new(math.random(-15,15),math.random(-15,15),math.random(-15,15))*CFrame.Angles(math.rad(90),math.rad(0),math.rad(0)),vt(0.5,0.5,0.5),-0.005,0.5,-0.005,MAINRUINCOLOR)	    sphere2(6,"Add",root.CFrame*CFrame.new(math.random(-15,15),math.random(-15,15),math.random(-15,15))*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),vt(0.5,0.5,0.5),-0.005,0.5,-0.005,MAINRUINCOLOR)
end
sphere(20,"Add",root.CFrame,vt(0,0,0),0.5,MAINRUINCOLOR)
coroutine.resume(coroutine.create(function()
local eff = Instance.new("ParticleEmitter",root)
eff.Texture = "rbxassetid://01175838406"
eff.LightEmission = 0.95
eff.Color = ColorSequence.new(MAINRUINCOLOR.Color)
eff.Rate = 10000
eff.Lifetime = NumberRange.new(1)
eff.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,4,0),NumberSequenceKeypoint.new(0.8,5,0),NumberSequenceKeypoint.new(1,0,0)})
eff.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(0.8,0.5,0),NumberSequenceKeypoint.new(1,1,0)})
eff.Speed = NumberRange.new(30,160)
eff.Drag = 5
eff.Rotation = NumberRange.new(-500,500)
eff.VelocitySpread = 100000
wait(0.25)
eff.Enabled = false
wait(4)
eff:Destroy()
end))
CFuncs["Sound"].Create("rbxassetid://335657174", root, 5, 1)
CFuncs["Sound"].Create("rbxassetid://1177785010", root, 10,1)
RootPart.CFrame = mouse.Hit *CFrame.new(0,2,0)
CameraEnshaking(2,10)
for i, v in pairs(FindNearestHead(Torso.CFrame.p, 10)) do
if v:FindFirstChild('Head') then
dmg(v)
end
end
for i = 0, 9 do
sphere2(6,"Add",root.CFrame*CFrame.new(math.random(-15,15),math.random(-15,15),math.random(-15,15))*CFrame.Angles(math.rad(0),math.rad(0),math.rad(90)),vt(0.5,0.5,0.5),-0.005,0.5,-0.005,MAINRUINCOLOR)		sphere2(6,"Add",root.CFrame*CFrame.new(math.random(-15,15),math.random(-15,15),math.random(-15,15))*CFrame.Angles(math.rad(90),math.rad(0),math.rad(0)),vt(0.5,0.5,0.5),-0.005,0.5,-0.005,MAINRUINCOLOR)	    sphere2(6,"Add",root.CFrame*CFrame.new(math.random(-15,15),math.random(-15,15),math.random(-15,15))*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),vt(0.5,0.5,0.5),-0.005,0.5,-0.005,MAINRUINCOLOR)
end
sphere(20,"Add",root.CFrame,vt(0,0,0),0.5,MAINRUINCOLOR)
end

function BinaryE()
local posit = -2
attack = true
hum.WalkSpeed = 5
CFuncs["Sound"].Create("rbxassetid://169380495", sorb2, 1, 1)
	for i = 0,2,0.1 do
		swait()
sphere2(7,"Add",sorb2.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(1,1,1),-0.01,0.075,-0.01,MAINRUINCOLOR)
            RootJoint.C0 = clerp(RootJoint.C0,RootCF*cf(0,0,0)* angles(math.rad(0),math.rad(0),math.rad(30)),0.5)
Torso.Neck.C0 = clerp(Torso.Neck.C0,necko *angles(math.rad(10),math.rad(0),math.rad(-30)),.5)
RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5, 0) * angles(math.rad(0), math.rad(0), math.rad(20)), 0.5)
LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5, 0) * angles(math.rad(45), math.rad(6), math.rad(-30)), 0.5)
RH.C0=clerp(RH.C0,cf(1,-1,0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-1.5),math.rad(-20),math.rad(0)),.5)
LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-1),math.rad(0),math.rad(0)),.5)
	end
for i = 0, 2 do
CameraEnshaking(1,2)
local hite = Instance.new("Part", char)
        hite.Anchored = true
        hite.CanCollide = false
        hite.FormFactor = 3
        hite.Name = "Ring"
        hite.Material = "Neon"
        hite.Size = Vector3.new(1, 1, 1)
        hite.Transparency = 11
        hite.TopSurface = 0
        hite.BottomSurface = 0
hite.CFrame = root.CFrame*CFrame.new(0,posit,-5)
CFuncs["Sound"].Create("rbxassetid://231917856", hite, 0.5, 0.9)
CFuncs["Sound"].Create("rbxassetid://231917758", hite, 0.25, 0.8)
coroutine.resume(coroutine.create(function()
local eff = Instance.new("ParticleEmitter",hite)
eff.Texture = "rbxassetid://01175838406"
eff.LightEmission = 0.95
eff.Color = ColorSequence.new(MAINRUINCOLOR.Color)
eff.Rate = 1000
eff.Lifetime = NumberRange.new(1)
eff.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,2,0),NumberSequenceKeypoint.new(0.8,1,0),NumberSequenceKeypoint.new(1,0,0)})
eff.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(0.8,0.5,0),NumberSequenceKeypoint.new(1,1,0)})
eff.Speed = NumberRange.new(10,50)
eff.Drag = 5
eff.Rotation = NumberRange.new(-500,500)
eff.VelocitySpread = 100000
wait(0.25)
eff.Enabled = false
end))
coroutine.resume(coroutine.create(function()
for i = 0, 1 do
	swait()
		sphere2(4,"Add",hite.CFrame*CFrame.new(math.random(-5,5),math.random(-5,5),math.random(-5,5))*CFrame.Angles(math.rad(0),math.rad(0),math.rad(90)),vt(0.5,0.5,0.5),-0.005,0.25,-0.005,MAINRUINCOLOR)
		sphere2(4,"Add",hite.CFrame*CFrame.new(math.random(-5,5),math.random(-5,5),math.random(-5,5))*CFrame.Angles(math.rad(90),math.rad(0),math.rad(0)),vt(0.5,0.5,0.5),-0.005,0.25,-0.005,MAINRUINCOLOR)
	    sphere2(4,"Add",hite.CFrame*CFrame.new(math.random(-5,5),math.random(-5,5),math.random(-5,5))*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),vt(0.5,0.5,0.5),-0.005,0.25,-0.005,MAINRUINCOLOR)
end
end))
sphere2(6,"Add",hite.CFrame*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),vt(2,2,2),0.5,-0.01,-0.01,MAINRUINCOLOR)
MagniDamage(hite, 3, 30,40, 0, "Normal")
game:GetService("Debris"):AddItem(hite, 5)
posit = posit + 2
end
	for i = 0,1,0.1 do
		swait()
sphere2(7,"Add",sorb2.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(1,1,1),-0.01,0.075,-0.01,MAINRUINCOLOR)
            RootJoint.C0 = clerp(RootJoint.C0,RootCF*cf(0,0,0)* angles(math.rad(0),math.rad(0),math.rad(-80)),0.5)
Torso.Neck.C0 = clerp(Torso.Neck.C0,necko *angles(math.rad(10),math.rad(0),math.rad(80)),.5)
RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5, 0) * angles(math.rad(0), math.rad(0), math.rad(20)), 0.5)
LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5, 0) * angles(math.rad(110), math.rad(6), math.rad(40)), 0.5)
RH.C0=clerp(RH.C0,cf(1,-1,0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-1.5),math.rad(-20),math.rad(0)),.5)
LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-1),math.rad(0),math.rad(0)),.5)
	end
	for i = 0,1,0.1 do
		swait()
sphere2(7,"Add",sorb2.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(1,1,1),-0.01,0.075,-0.01,MAINRUINCOLOR)
            RootJoint.C0 = clerp(RootJoint.C0,RootCF*cf(0,-0.2,0)* angles(math.rad(20),math.rad(0),math.rad(60)),0.5)
Torso.Neck.C0 = clerp(Torso.Neck.C0,necko *angles(math.rad(5),math.rad(0),math.rad(-60)),.5)
RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5, 0) * angles(math.rad(90), math.rad(0), math.rad(60)), 0.5)
LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5, 0) * angles(math.rad(60), math.rad(6), math.rad(-50)), 0.5)
RH.C0=clerp(RH.C0,cf(1,-1,0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-1.5),math.rad(-20),math.rad(30)),.5)
LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-1),math.rad(0),math.rad(40)),.5)
	end
	posit = -6
	for i = 0, 6 do
CameraEnshaking(1,3)
local hite = Instance.new("Part", char)
        hite.Anchored = true
        hite.CanCollide = false
        hite.FormFactor = 3
        hite.Name = "Ring"
        hite.Material = "Neon"
        hite.Size = Vector3.new(1, 1, 1)
        hite.Transparency = 11
        hite.TopSurface = 0
        hite.BottomSurface = 0
hite.CFrame = root.CFrame*CFrame.new(posit,0,-5)
CFuncs["Sound"].Create("rbxassetid://231917856", hite, 0.5, 1.2)
CFuncs["Sound"].Create("rbxassetid://231917758", hite, 0.25, 1)
sphere2(6,"Add",hite.CFrame*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),vt(1,1,1),-0.01,1,-0.01,MAINRUINCOLOR)
coroutine.resume(coroutine.create(function()
local eff = Instance.new("ParticleEmitter",hite)
eff.Texture = "rbxassetid://01175838406"
eff.LightEmission = 0.95
eff.Color = ColorSequence.new(MAINRUINCOLOR.Color)
eff.Rate = 1000
eff.Lifetime = NumberRange.new(1)
eff.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,2,0),NumberSequenceKeypoint.new(0.8,1,0),NumberSequenceKeypoint.new(1,0,0)})
eff.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(0.8,0.5,0),NumberSequenceKeypoint.new(1,1,0)})
eff.Speed = NumberRange.new(20,70)
eff.Drag = 5
eff.Rotation = NumberRange.new(-500,500)
eff.VelocitySpread = 100000
wait(0.25)
eff.Enabled = false
end))
coroutine.resume(coroutine.create(function()
for i = 0, 2 do
	swait()
		sphere2(4,"Add",hite.CFrame*CFrame.new(math.random(-10,10),math.random(-10,10),math.random(-10,10))*CFrame.Angles(math.rad(0),math.rad(0),math.rad(90)),vt(0.5,0.5,0.5),-0.005,0.25,-0.005,MAINRUINCOLOR)
		sphere2(4,"Add",hite.CFrame*CFrame.new(math.random(-10,10),math.random(-10,10),math.random(-10,10))*CFrame.Angles(math.rad(90),math.rad(0),math.rad(0)),vt(0.5,0.5,0.5),-0.005,0.25,-0.005,MAINRUINCOLOR)
	    sphere2(4,"Add",hite.CFrame*CFrame.new(math.random(-10,10),math.random(-10,10),math.random(-10,10))*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),vt(0.5,0.5,0.5),-0.005,0.25,-0.005,MAINRUINCOLOR)
end
end))
MagniDamage(hite, 5, 40,70, 0, "Normal")
game:GetService("Debris"):AddItem(hite, 5)
posit = posit + 2
	end
	for i = 0,1,0.1 do
		swait()
sphere2(7,"Add",sorb2.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(1,1,1),-0.01,0.075,-0.01,MAINRUINCOLOR)
            RootJoint.C0 = clerp(RootJoint.C0,RootCF*cf(0,0.1,1.5)* angles(math.rad(-10),math.rad(0),math.rad(-60)),0.5)
Torso.Neck.C0 = clerp(Torso.Neck.C0,necko *angles(math.rad(5),math.rad(0),math.rad(50)),.5)
RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5, 0) * angles(math.rad(20), math.rad(0), math.rad(30)), 0.5)
LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5, 0) * angles(math.rad(140), math.rad(6), math.rad(-50)), 0.5)
RH.C0=clerp(RH.C0,cf(1,-1,0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-1.5),math.rad(10),math.rad(-10)),.5)
LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-1),math.rad(0),math.rad(60)),.5)
	end
	hum.WalkSpeed = storehumanoidWS
attack = false
end



function AZUREFINALE()
attack = true
duringend = true
hum.WalkSpeed = 0
CFuncs["Sound"].Create("rbxassetid://1117054464", char, 7.5, 0.75)
CFuncs["LongSound"].Create("rbxassetid://1042700914", char, 3.5, 0.05)
local hite = Instance.new("Part", char)
        hite.Anchored = true
        hite.CanCollide = false
        hite.FormFactor = 3
        hite.Name = "Ring"
        hite.Material = "Neon"
        hite.Size = Vector3.new(1, 1, 1)
        hite.Transparency = 11
        hite.TopSurface = 0
        hite.BottomSurface = 0
        hite.BrickColor = MAINRUINCOLOR
        local orbm = Instance.new("SpecialMesh", hite)
        orbm.MeshType = "Sphere"
orbm.Name = "SizeMesh"
orbm.Scale = vt(0,0,0)
hite.CFrame = root.CFrame*CFrame.new(0,200,0)
	for i = 0,70,0.1 do
		swait()
orbm.Scale = orbm.Scale + vt(0.5,0.5,0.5)
rsiz = math.random(10,45)
kan.Volume = kan.Volume + 0.01
kan.Pitch = kan.Pitch - 0.00135
sphereMK(math.random(1,4),2.5,"Add",hite.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),rsiz/2,rsiz/2,rsiz/2,0,MAINRUINCOLOR,-300)	
sphere2(4,"Add",hite.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(10,1.5,10),-0.01,10,-0.01,MAINRUINCOLOR)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,1 + 0.1 * math.cos(sine / 28))* angles(math.rad(0),math.rad(0),math.rad(-60)),0.2)
Torso.Neck.C0 = clerp(Torso.Neck.C0,necko *angles(math.rad(-10),math.rad(0),math.rad(60)),.2)
RW.C0=clerp(RW.C0,cf(1.5,0.5 + 0.01 * math.cos(sine / 28),0)*angles(math.rad(15),math.rad(15),math.rad(-10)),.2)
LW.C0=clerp(LW.C0, CFrame.new(-1.5, 0.5, 0) * angles(math.rad(170), math.rad(0), math.rad(-40)), 0.2)
RH.C0=clerp(RH.C0,cf(1,-0.5,-0.6)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-1),math.rad(0),math.rad(-10 + 1 * math.cos(sine / 34))),.2)
LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-1.5),math.rad(0),math.rad(5 + 1 * math.cos(sine / 34))),.2)
	end
	kan.Pitch = 0.1
hite.Transparency = 11
for i = 0,2 do
CFuncs["LongSound"].Create("rbxassetid://324849898", char, 10,0.9)
end
CFuncs["LongSound"].Create("rbxassetid://1117054464", char, 5, 0.75)
sphere2(1,"Add",hite.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(orbm.Scale.X,orbm.Scale.Y,orbm.Scale.Z),-5,-5,-5,MAINRUINCOLOR)
sphere2(1,"Add",hite.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(orbm.Scale.X,orbm.Scale.Y,orbm.Scale.Z),2,2,2,MAINRUINCOLOR)
sphere2(2,"Add",hite.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(orbm.Scale.X,orbm.Scale.Y,orbm.Scale.Z),3,3,3,MAINRUINCOLOR)
coroutine.resume(coroutine.create(function()
local eff = Instance.new("ParticleEmitter",hite)
eff.Texture = "rbxassetid://0284205403"
eff.LightEmission = 0.95
eff.Color = ColorSequence.new(MAINRUINCOLOR.Color)
eff.Rate = 10000
eff.Lifetime = NumberRange.new(5)
eff.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,50,0),NumberSequenceKeypoint.new(0.8,100,0),NumberSequenceKeypoint.new(1,0,0)})
eff.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(0.8,0.5,0),NumberSequenceKeypoint.new(1,1,0)})
eff.Speed = NumberRange.new(600,1250)
eff.Drag = 5
eff.Rotation = NumberRange.new(-500,500)
eff.VelocitySpread = 9000
eff.RotSpeed = NumberRange.new(-500,500)
wait(1)
eff.Enabled = false
end))
	for i = 0,5,0.1 do
		swait()
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,1 + 0.1 * math.cos(sine / 28))* angles(math.rad(0),math.rad(0),math.rad(-60)),0.2)
Torso.Neck.C0 = clerp(Torso.Neck.C0,necko *angles(math.rad(-10),math.rad(0),math.rad(60)),.2)
RW.C0=clerp(RW.C0,cf(1.5,0.5 + 0.01 * math.cos(sine / 28),0)*angles(math.rad(15),math.rad(15),math.rad(-10)),.2)
LW.C0=clerp(LW.C0, CFrame.new(-1.5, 0.5, 0) * angles(math.rad(170), math.rad(0), math.rad(-40)), 0.2)
RH.C0=clerp(RH.C0,cf(1,-0.5,-0.6)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-1),math.rad(0),math.rad(-10 + 1 * math.cos(sine / 34))),.2)
LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-1.5),math.rad(0),math.rad(5 + 1 * math.cos(sine / 34))),.2)
	end
local adsc = 0
local radiatezone = 0
	for i = 0,20,0.1 do
		swait()
adsc = adsc + 0.025
radiatezone = radiatezone + 1.25
sphere2(8,"Add",hite.CFrame,vt(0,0,0),adsc,adsc,adsc,MAINRUINCOLOR)
for i, v in pairs(FindNearestHead(hite.CFrame.p, radiatezone)) do
if v:FindFirstChild('Head') then
dmg(v)
end
end
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,1 + 0.1 * math.cos(sine / 28))* angles(math.rad(0),math.rad(0),math.rad(-60)),0.2)
Torso.Neck.C0 = clerp(Torso.Neck.C0,necko *angles(math.rad(-10),math.rad(0),math.rad(60)),.2)
RW.C0=clerp(RW.C0,cf(1.5,0.5 + 0.01 * math.cos(sine / 28),0)*angles(math.rad(15),math.rad(15),math.rad(-10)),.2)
LW.C0=clerp(LW.C0, CFrame.new(-1.5, 0.5, 0) * angles(math.rad(170), math.rad(0), math.rad(-40)), 0.2)
RH.C0=clerp(RH.C0,cf(1,-0.5,-0.6)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-1),math.rad(0),math.rad(-10 + 1 * math.cos(sine / 34))),.2)
LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-1.5),math.rad(0),math.rad(5 + 1 * math.cos(sine / 34))),.2)
	end
for i = 0,2 do
CFuncs["LongSound"].Create("rbxassetid://665426491", char, 10,0.9)
end
	for i = 0,40,0.1 do
		swait()
adsc = adsc + 0.05
radiatezone = radiatezone + 2.5
sphere2(8,"Add",hite.CFrame,vt(0,0,0),adsc,adsc,adsc,MAINRUINCOLOR)
for i, v in pairs(FindNearestHead(hite.CFrame.p, radiatezone)) do
if v:FindFirstChild('Head') then
dmg(v)
end
end
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,1 + 0.1 * math.cos(sine / 28))* angles(math.rad(0),math.rad(0),math.rad(-60)),0.2)
Torso.Neck.C0 = clerp(Torso.Neck.C0,necko *angles(math.rad(-10),math.rad(0),math.rad(60)),.2)
RW.C0=clerp(RW.C0,cf(1.5,0.5 + 0.01 * math.cos(sine / 28),0)*angles(math.rad(15),math.rad(15),math.rad(-10)),.2)
LW.C0=clerp(LW.C0, CFrame.new(-1.5, 0.5, 0) * angles(math.rad(170), math.rad(0), math.rad(-40)), 0.2)
RH.C0=clerp(RH.C0,cf(1,-0.5,-0.6)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-1),math.rad(0),math.rad(-10 + 1 * math.cos(sine / 34))),.2)
LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-1.5),math.rad(0),math.rad(5 + 1 * math.cos(sine / 34))),.2)
	end
for i = 0,4 do
CFuncs["LongSound"].Create("rbxassetid://665426491", char, 10,0.75)
CFuncs["LongSound"].Create("rbxassetid://923073285", char, 1.25,0.75)
end
	for i = 0,80,0.1 do
		swait()
adsc = adsc + 0.075
radiatezone = radiatezone + 3.75
sphere2(8,"Add",hite.CFrame,vt(0,0,0),adsc,adsc,adsc,MAINRUINCOLOR)
for i, v in pairs(FindNearestHead(hite.CFrame.p, radiatezone)) do
if v:FindFirstChild('Head') then
dmg(v)
end
end
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,1 + 0.1 * math.cos(sine / 28))* angles(math.rad(0),math.rad(0),math.rad(-60)),0.2)
Torso.Neck.C0 = clerp(Torso.Neck.C0,necko *angles(math.rad(-10),math.rad(0),math.rad(60)),.2)
RW.C0=clerp(RW.C0,cf(1.5,0.5 + 0.01 * math.cos(sine / 28),0)*angles(math.rad(15),math.rad(15),math.rad(-10)),.2)
LW.C0=clerp(LW.C0, CFrame.new(-1.5, 0.5, 0) * angles(math.rad(170), math.rad(0), math.rad(-40)), 0.2)
RH.C0=clerp(RH.C0,cf(1,-0.5,-0.6)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-1),math.rad(0),math.rad(-10 + 1 * math.cos(sine / 34))),.2)
LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-1.5),math.rad(0),math.rad(5 + 1 * math.cos(sine / 34))),.2)
	end
hite:Destroy()
duringend = false
hum.WalkSpeed = storehumanoidWS
attack = false
end

function AzureVANISHMENT()
attack = true
hum.WalkSpeed = 0
local truescale = 0
local rd = math.random(1,3)
if rd == 1 then
chatfunc("This is your end!",MAINRUINCOLOR.Color,"Inverted","Antique",2.5)
elseif rd == 2 then
chatfunc("Pathetic.",MAINRUINCOLOR.Color,"Inverted","Antique",2.5)
elseif rd == 3 then
chatfunc("Time to end this.",MAINRUINCOLOR.Color,"Inverted","Antique",2.5)
end
CFuncs["LongSound"].Create("rbxassetid://1368583274", char, 10, 0.25)
for i = 0,49,0.1 do
swait()
truescale = truescale + 0.2
hum.CameraOffset = vt(math.random(-10,10)/100,math.random(-10,10)/100,math.random(-10,10)/100)
slash(5,5,true,"Round","Add","Out",root.CFrame*CFrame.new(0,75,0)*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(3,0.01,3),-3,BrickColor.new("Royal purple"))
block(10,"Add",root.CFrame*CFrame.new(0,75,0)*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(truescale,truescale,truescale),0.01,0.01,0.01,BrickColor.new("Magenta"),BrickColor.new("Magenta").Color)
RH.C0=clerp(RH.C0,cf(1,-0.5,-0.5)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-3),math.rad(5),math.rad(-10)),.5)
LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-3),math.rad(1),math.rad(5)),.5)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,1)*angles(math.rad(0),math.rad(0),math.rad(40)),.5)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(20),math.rad(0),math.rad(-40)),.5)
RW.C0=clerp(RW.C0,cf(1.45,1,0.1)*angles(math.rad(180),math.rad(-30),math.rad(-5)),.5)
LW.C0=clerp(LW.C0,cf(-1.45,0.5,0.1)*angles(math.rad(-5),math.rad(10),math.rad(-10)),.5)
end
hum.CameraOffset = vt(0,0,0)
CFuncs["Sound"].Create("rbxassetid://260411131", rarm, 7.5, 1)
for i = 0,2,0.1 do
swait()
block(10,"Add",rarm.CFrame*CFrame.new(0,-1.5,0)*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(1,1,1),0.01,0.01,0.01,BrickColor.new("Magenta"),BrickColor.new("Magenta").Color)
RH.C0=clerp(RH.C0,cf(1,-0.5,-0.5)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-3),math.rad(5),math.rad(-10)),.5)
LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-3),math.rad(1),math.rad(5)),.5)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,1)*angles(math.rad(0),math.rad(0),math.rad(55)),.5)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(10),math.rad(0),math.rad(-55)),.5)
RW.C0=clerp(RW.C0,cf(1.15,0.5,-0.6)*angles(math.rad(90),math.rad(0),math.rad(-50)),.5)
LW.C0=clerp(LW.C0,cf(-1.45,0.5,0.1)*angles(math.rad(-5),math.rad(10),math.rad(-10)),.5)
end
local orb = Instance.new("Part", char)
for i = 0, 4 do
CFuncs["Sound"].Create("rbxassetid://335657174", char, 7.5, 0.5)
end
local efec = Instance.new("ParticleEmitter",orb)
efec.Texture = "rbxassetid://02109052855"
efec.LightEmission = 1
efec.Color = ColorSequence.new(Color3.new(0.5,0,1))
efec.Rate = 5
efec.Lifetime = NumberRange.new(3)
efec.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,100,0),NumberSequenceKeypoint.new(0.2,175,0),NumberSequenceKeypoint.new(0.6,110,0),NumberSequenceKeypoint.new(0.8,175,0),NumberSequenceKeypoint.new(1,200,0)})
efec.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,1,0),NumberSequenceKeypoint.new(0.1,0.25,0),NumberSequenceKeypoint.new(0.6,0.25,0),NumberSequenceKeypoint.new(1,1,0)})
efec.Drag = 5
efec.LockedToPart = true
efec.Rotation = NumberRange.new(-500,500)
efec.VelocitySpread = 9000
efec.RotSpeed = NumberRange.new(-500,500)
        orb.BrickColor = BrickColor.new("Magenta")
        orb.CanCollide = false
        orb.FormFactor = 3
        orb.Name = "Ring"
        orb.Material = "Neon"
        orb.Size = Vector3.new(1, 1, 1)
        orb.Transparency = 11
        orb.TopSurface = 0
        orb.BottomSurface = 0
        local orbm = Instance.new("SpecialMesh", orb)
        orbm.MeshType = "Sphere"
orbm.Name = "SizeMesh"
orbm.Scale = vt(25,25,25)
orb.CFrame = root.CFrame + root.CFrame.lookVector*3
	local a = Instance.new("Part",workspace)
	a.Name = "Direction"	
	a.Anchored = true
	a.BrickColor = bc("Bright red")
a.Material = "Neon"
a.Transparency = 11
	a.CanCollide = false
	local ray = Ray.new(
	    orb.CFrame.p,                           -- origin
	    (mouse.Hit.p - orb.CFrame.p).unit * 500 -- direction
	) 
	local ignore = orb
	local hit, position, normal = workspace:FindPartOnRay(ray, ignore)
	a.BottomSurface = 10
	a.TopSurface = 10
	local distance = (orb.CFrame.p - position).magnitude
	a.Size = Vector3.new(0.1, 0.1, 0.1)
	a.CFrame = CFrame.new(orb.CFrame.p, position) * CFrame.new(0, 0, 0)
orb.CFrame = a.CFrame
a:Destroy()
local over = false
local bgui,imgc = createBGCircle(250,orb,Color3.new(0.5,0,1))
bgui.AlwaysOnTop = true
imgc.Image = "rbxassetid://2076519836"
coroutine.resume(coroutine.create(function()
while true do
swait()
if over == false then
hum.CameraOffset = vt(math.random(-10,10)/100,math.random(-10,10)/100,math.random(-10,10)/100)
coroutine.resume(coroutine.create(function()
for i, v in pairs(FindNearestHead(orb.CFrame.p, 100)) do
if v:FindFirstChild('Head') then
dmg(v)
end
end
end))
slash(10,2,true,"Round","Add","Out",orb.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(0.01,0.01,0.01),1,BrickColor.new("Dark indigo"))
imgc.Rotation = imgc.Rotation + 5
imgc.ImageTransparency = 11.75 + 0.25 * math.cos(sine / 15)
bgui.Size = UDim2.new(250 + 25 * math.cos(sine / 15),0, 250 + 25 * math.cos(sine / 15),0)
elseif over == true then
break
end
end
end))
local bv = Instance.new("BodyVelocity")
bv.maxForce = Vector3.new(1e9, 1e9, 1e9)
bv.velocity = orb.CFrame.lookVector*50
bv.Parent = orb
coroutine.resume(coroutine.create(function()
wait(10)
hum.CameraOffset = vt(0,0,0)
over = true
efec.Enabled = false
orb.Anchored = true
for i = 0, 2 do
CFuncs["Sound"].Create("rbxassetid://1664711478", char, 10,1)
CFuncs["LongSound"].Create("rbxassetid://763717897", char, 10, 0.5)
CFuncs["LongSound"].Create("rbxassetid://763717897", char, 7.5, 0.25)
CFuncs["Sound"].Create("rbxassetid://763718160", char, 10, 0.9)
CFuncs["Sound"].Create("rbxassetid://782353443", char, 10, 0.5)
CFuncs["Sound"].Create("rbxassetid://335657174", char, 5, 0.75)
CFuncs["LongSound"].Create("rbxassetid://335657174", char, 10, 0.25)
CFuncs["Sound"].Create("rbxassetid://167115397", char, 10, 1)
CFuncs["LongSound"].Create("rbxassetid://167115397", char, 10, 0.75)
CFuncs["LongSound"].Create("rbxassetid://167115397", char, 10, 0.5)
end
for i = 0, 2 do
block(3,"Add",orb.CFrame,vt(1,1,1),6.5,6.5,6.5,BrickColor.new("Dark indigo"),BrickColor.new("Dark indigo").Color)
block(2,"Add",orb.CFrame,vt(1,1,1),6,6,6,BrickColor.new("Royal purple"),BrickColor.new("Royal purple").Color)
block(1,"Add",orb.CFrame,vt(1,1,1),4.5,4.5,4.5,BrickColor.new("Magenta"),BrickColor.new("Magenta").Color)
end
for i = 0, 49 do
slash(math.random(10,30)/10,5,true,"Round","Add","Out",orb.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(0.01,0.01,0.01),math.random(150,2500)/250,BrickColor.new("Royal purple"))
end
imgc.ImageTransparency = 11
--CameraEnshaking(20,30)
for i = 0, 199 do
swait()
--[[coroutine.resume(coroutine.create(function()
for i, v in pairs(FindNearestHead(orb.CFrame.p, 5000)) do
if v:FindFirstChild('Head') then
dmg(v)
end
end
end))]]--
imgc.Rotation = imgc.Rotation + 10
local dis = CreateParta(char,1,1,"Neon",MAINRUINCOLOR)
dis.CFrame = orb.CFrame*CFrame.new(math.random(-5,5),math.random(-5,5),math.random(-5,5))*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360)))
local at1 = Instance.new("Attachment",dis)
at1.Position = vt(-25000,0,0)
local at2 = Instance.new("Attachment",dis)
at2.Position = vt(25000,0,0)
local trl = Instance.new('Trail',dis)
trl.Attachment0 = at1
trl.FaceCamera = true
trl.Attachment1 = at2
trl.Texture = "rbxassetid://01049219073"
trl.LightEmission = 1
trl.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0),NumberSequenceKeypoint.new(1, 1)})
trl.Color = ColorSequence.new(orb.Color)
trl.Lifetime = 5
local bv = Instance.new("BodyVelocity")
bv.maxForce = Vector3.new(1e9, 1e9, 1e9)
bv.velocity = dis.CFrame.lookVector*math.random(500,2500)
bv.Parent = dis
game:GetService("Debris"):AddItem(dis, 5)
sphere2(15,"Add",orb.CFrame,vt(1.25,1.25,1.25),45,45,45,BrickColor.new("Royal purple"))
for i = 0, 2 do
slash(15,5,true,"Round","Add","Out",orb.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(0.01,0.01,0.01),25,BrickColor.new("Really black"))
slash(15,5,true,"Round","Add","Out",orb.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(0.01,0.01,0.01),50,BrickColor.new("Dark indigo"))
end
orbm.Scale = orbm.Scale + vt(10,10,10)
orb.Transparency = 1+orb.Transparency + 0.005
imgc.ImageTransparency = 1+imgc.ImageTransparency + 0.005
bgui.Size = bgui.Size + UDim2.new(35,0,35,0)
end
hum.CameraOffset = vt(0,0,0)
game:GetService("Debris"):AddItem(orb, 10)
end))
for i = 0,2,0.1 do
swait()
RH.C0=clerp(RH.C0,cf(1,-0.5,-0.5)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-3),math.rad(5),math.rad(-10)),.5)
LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-3),math.rad(20),math.rad(10)),.5)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,-0.3,1)*angles(math.rad(5),math.rad(0),math.rad(-45)),.5)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(10),math.rad(0),math.rad(45)),.5)
RW.C0=clerp(RW.C0,cf(1.45,0.5,0)*angles(math.rad(90),math.rad(0),math.rad(50)),.5)
LW.C0=clerp(LW.C0,cf(-1.45,0.5,0.1)*angles(math.rad(20),math.rad(10),math.rad(-30)),.5)
end
attack = false
hum.WalkSpeed = storehumanoidWS
end

function GalacticalBeams()
attack = true
local keptcolor = MAINRUINCOLOR
coroutine.resume(coroutine.create(function()
for i = 0, 0 do
swait(10)
local orb = Instance.new("Part", char)
CFuncs["Sound"].Create("rbxassetid://663361028", orb, 2, 1)
        orb.BrickColor = keptcolor
        orb.CanCollide = false
        orb.FormFactor = 3
        orb.Name = "Ring"
        orb.Material = "Neon"
        orb.Size = Vector3.new(1, 1, 1)
        orb.Transparency = 11
        orb.TopSurface = 0
        orb.BottomSurface = 0
orb.Anchored = true
        local orbm = Instance.new("SpecialMesh", orb)
        orbm.MeshType = "Sphere"
orbm.Name = "SizeMesh"
orbm.Scale = vt(1.25,1.25,1.25)
orb.CFrame = root.CFrame*CFrame.new(math.random(-25,25),math.random(75,150),math.random(-25,25))
coroutine.resume(coroutine.create(function()
orb.Transparency = 11
	local a = Instance.new("Part",char)
	a.Name = "Direction"	
	a.Anchored = true
	a.BrickColor = keptcolor
a.Material = "Neon"
a.Transparency = 11
a.Shape = "Cylinder"
	local x = Instance.new("Part",char)
	x.Name = "Direction"	
	x.Anchored = true
	x.BrickColor = keptcolor
x.Material = "Neon"
x.Transparency = 11
x.Shape = "Cylinder"
	local ht = Instance.new("Part",char)
	ht.Name = "DirectionHit"	
	ht.Anchored = true
	ht.BrickColor = keptcolor
ht.CanCollide = false
ht.Transparency = 11
ht.Size = vt(0.1,0.1,0.1)
	a.CanCollide = false
	local ray = Ray.new(
	    orb.CFrame.p,                           -- origin
	    (mouse.Hit.p - orb.CFrame.p).unit * 1000 -- direction
	) 
	local ignore = char
	local hit, position, normal = workspace:FindPartOnRay(ray, ignore)
	a.BottomSurface = 10
	a.TopSurface = 10
	local distance = (orb.CFrame.p - position).magnitude
	a.Size = Vector3.new(distance,1,1)
	a.CFrame = CFrame.new(orb.CFrame.p, position) * CFrame.new(0, 0, -distance/2)
	ht.CFrame = CFrame.new(orb.CFrame.p, position) * CFrame.new(0, 0, -distance)
	x.CFrame = CFrame.new(orb.CFrame.p, position) * CFrame.new(0, 0, 0)
local poste = 0
local rotation = 0
CFuncs["Sound"].Create("rbxassetid://153092315", char, 1.5, 1)
sphere2(8,"Add",x.CFrame*CFrame.Angles(0,0,0),vt(5,5,5),2.5,2.5,0,keptcolor)
CameraEnshaking(2,2)
coroutine.resume(coroutine.create(function()
local eff = Instance.new("ParticleEmitter",orb)
eff.Texture = "rbxassetid://02273224484"
eff.LightEmission = 1
eff.Color = ColorSequence.new(keptcolor.Color)
eff.Rate = 15000
eff.Lifetime = NumberRange.new(2.5,5)
eff.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,60,0),NumberSequenceKeypoint.new(0.2,3,0),NumberSequenceKeypoint.new(0.8,24,0),NumberSequenceKeypoint.new(1,0,0)})
eff.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,1,0),NumberSequenceKeypoint.new(0.2,0,0),NumberSequenceKeypoint.new(0.5,0,0),NumberSequenceKeypoint.new(1,1,0)})
eff.Speed = NumberRange.new(100,650)
eff.Drag = 5
eff.Rotation = NumberRange.new(-500,500)
eff.VelocitySpread = 9000
eff.RotSpeed = NumberRange.new(-50,50)
wait(0.35)
eff.Enabled = false
end))
for i = 0, 49 do
swait()
rotation = rotation + 5
poste = poste + 1
sphere2(8,"Add",x.CFrame*CFrame.Angles(0,0,math.rad(rotation))*CFrame.new(0,poste,0),vt(5,5,5),-0.05,-0.05,-0.05,keptcolor)
sphere2(8,"Add",x.CFrame*CFrame.Angles(0,0,math.rad(180 + rotation))*CFrame.new(0,poste,0),vt(5,5,5),-0.05,-0.05,-0.05,keptcolor)
sphere2(8,"Add",x.CFrame*CFrame.Angles(0,0,math.rad(-rotation))*CFrame.new(0,poste,0),vt(5,5,5),-0.05,-0.05,-0.05,keptcolor)
sphere2(8,"Add",x.CFrame*CFrame.Angles(0,0,math.rad(180 - rotation))*CFrame.new(0,poste,0),vt(5,5,5),-0.05,-0.05,-0.05,keptcolor)
sphere2(8,"Add",x.CFrame*CFrame.Angles(0,0,math.rad(90 + rotation))*CFrame.new(0,poste,0),vt(5,5,5),-0.05,-0.05,-0.05,keptcolor)
sphere2(8,"Add",x.CFrame*CFrame.Angles(0,0,math.rad(90 - rotation))*CFrame.new(0,poste,0),vt(5,5,5),-0.05,-0.05,-0.05,keptcolor)
sphere2(8,"Add",x.CFrame*CFrame.Angles(0,0,math.rad(270 + rotation))*CFrame.new(0,poste,0),vt(5,5,5),-0.05,-0.05,-0.05,keptcolor)
sphere2(8,"Add",x.CFrame*CFrame.Angles(0,0,math.rad(270 - rotation))*CFrame.new(0,poste,0),vt(5,5,5),-0.05,-0.05,-0.05,keptcolor)
end
local A1 = Instance.new("Attachment",x)
local A2 = Instance.new("Attachment",ht)
local Beem = Instance.new("Beam",ht)
Beem.Attachment0 = A1
Beem.Attachment1 = A2
Beem.LightEmission = 1
Beem.FaceCamera = true
Beem.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 1),NumberSequenceKeypoint.new(0.025, 0),NumberSequenceKeypoint.new(0.975, 0),NumberSequenceKeypoint.new(1, 1)})
Beem.Width0 = 125
Beem.Width1 = 125
Beem.Texture = "rbxassetid://01134824633"
Beem.TextureMode = "Wrap"
Beem.TextureLength = 200
Beem.TextureSpeed = 1.5
Beem.Color = ColorSequence.new(keptcolor.Color)
CameraEnshaking(3,6)
CFuncs["Sound"].Create("rbxassetid://1664711478", char, 1.5, 1)
CFuncs["Sound"].Create("rbxassetid://294188875", char, 2, 1.5)
a.Transparency = 11.25
	for i = 0, 49 do
local disr = CreateParta(char,1,1,"Neon",keptcolor)
disr.CFrame = ht.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360)))
local at1 = Instance.new("Attachment",disr)
at1.Position = vt(-5,0,0)
local at2 = Instance.new("Attachment",disr)
at2.Position = vt(5,0,0)
local trl = Instance.new('Trail',disr)
trl.Attachment0 = at1
trl.FaceCamera = true
trl.Attachment1 = at2
trl.Texture = "rbxassetid://02325530138"
trl.LightEmission = 1
trl.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0),NumberSequenceKeypoint.new(1, 1)})
trl.Color = ColorSequence.new(keptcolor.Color)
trl.Lifetime = 0.5
local bv = Instance.new("BodyVelocity")
bv.maxForce = Vector3.new(1e9, 1e9, 1e9)
bv.velocity = disr.CFrame.lookVector*math.random(50,500)
bv.Parent = disr
local val = 0
coroutine.resume(coroutine.create(function()
	swait(math.random(30,60))
	for i = 0, 19 do
		swait()
		val = val + 0.05
		trl.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, val),NumberSequenceKeypoint.new(1, 1)})
	end
game:GetService("Debris"):AddItem(disr, 3)
end))
end
sphere2(2,"Add",ht.CFrame,vt(1.25,1.25,1.25),0.5,0.5,0.5,keptcolor)
sphere2(4,"Add",ht.CFrame,vt(1.25,1.25,1.25),0.5,0.5,0.5,keptcolor)
sphere2(2,"Add",ht.CFrame,vt(1.25,1.25,1.25),1,1,1,keptcolor)
sphere2(4,"Add",ht.CFrame,vt(1.25,1.25,1.25),1,1,1,keptcolor)
sphere2(2,"Add",ht.CFrame,vt(1.25,1.25,1.25),1.5,1.5,1.5,keptcolor)
sphere2(4,"Add",ht.CFrame,vt(1.25,1.25,1.25),1.5,1.5,1.5,keptcolor)
MagniDamage(ht, 70, 1000,1500, 0, "Normal")
local eff = Instance.new("ParticleEmitter",ht)
eff.Texture = "rbxassetid://02273224484"
eff.LightEmission = 1
eff.Color = ColorSequence.new(keptcolor.Color)
eff.Rate = 500
eff.Lifetime = NumberRange.new(1,3)
eff.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,5,0),NumberSequenceKeypoint.new(0.2,10,0),NumberSequenceKeypoint.new(1,0,0)})
eff.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(0.8,0.25,0),NumberSequenceKeypoint.new(1,1,0)})
eff.Speed = NumberRange.new(80,700)
eff.Drag = 3
eff.Rotation = NumberRange.new(-500,500)
eff.VelocitySpread = 9000
eff.RotSpeed = NumberRange.new(-100,100)
for i = 0, 24 do
sphere2(6,"Add",ht.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(15,1,15),-0.05,math.random(1,5),-0.05,keptcolor)
local rsiz = math.random(10,50)
sphereMK(math.random(3,6),1.25,"Add",ht.CFrame*CFrame.Angles(math.rad(90 + math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),rsiz/10,rsiz/10,rsiz/10,0,keptcolor,0)
end
a.CFrame = a.CFrame*CFrame.Angles(0,math.rad(90),0)
local msh = Instance.new("SpecialMesh",a)
msh.MeshType = "Cylinder"
msh.Scale = vt(1,15,15)
for i = 0, 49 do
swait()
CameraEnshaking(1,4)
MagniDamage(ht, 70, 1000,1500, 0, "Normal")
rotation = rotation + 5
slash(math.random(30,90)/10,5,true,"Round","Add","Out",ht.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(0.01,0.01,0.01),math.random(200,450)/250,BrickColor.new("White"))
sphere2(4,"Add",ht.CFrame,vt(1.25,1.25,1.25),1,1,1,keptcolor)
sphere2(6,"Add",ht.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(15,1,15),-0.05,math.random(1,5),-0.05,keptcolor)
sphere2(8,"Add",x.CFrame*CFrame.Angles(0,0,0),vt(25,25,5),1,1,0,keptcolor)
sphere2(8,"Add",x.CFrame*CFrame.Angles(0,0,math.rad(rotation))*CFrame.new(0,50,0),vt(5,25,10),-0.05,1.5,-0.1,keptcolor)
sphere2(8,"Add",x.CFrame*CFrame.Angles(0,0,math.rad(180 + rotation))*CFrame.new(0,50,0),vt(5,25,10),-0.05,1.5,-0.1,keptcolor)
sphere2(8,"Add",x.CFrame*CFrame.Angles(0,0,math.rad(-rotation))*CFrame.new(0,50,0),vt(5,25,10),-0.05,1.5,-0.1,keptcolor)
sphere2(8,"Add",x.CFrame*CFrame.Angles(0,0,math.rad(180 - rotation))*CFrame.new(0,50,0),vt(5,25,10),-0.05,1.5,-0.1,keptcolor)
sphere2(8,"Add",x.CFrame*CFrame.Angles(0,0,math.rad(90 + rotation))*CFrame.new(0,50,0),vt(5,25,10),-0.05,1.5,-0.1,keptcolor)
sphere2(8,"Add",x.CFrame*CFrame.Angles(0,0,math.rad(90 - rotation))*CFrame.new(0,50,0),vt(5,25,10),-0.05,1.5,-0.1,keptcolor)
sphere2(8,"Add",x.CFrame*CFrame.Angles(0,0,math.rad(270 + rotation))*CFrame.new(0,50,0),vt(5,25,10),-0.05,1.5,-0.1,keptcolor)
sphere2(8,"Add",x.CFrame*CFrame.Angles(0,0,math.rad(270 - rotation))*CFrame.new(0,50,0),vt(5,25,10),-0.05,1.5,-0.1,keptcolor)
for i = 0, 2 do
local rsiz = math.random(50,250)
sphereMK(math.random(3,6),math.random(2,4),"Add",ht.CFrame*CFrame.Angles(math.rad(90 + math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),rsiz/10,rsiz/10,rsiz/10,0,keptcolor,0)
end
msh.Scale = msh.Scale + vt(0,0.25,0.25)
end
eff.Enabled = false
local visibility = 0
for i = 0, 49 do
swait()
visibility = visibility + 0.02
Beem.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 1),NumberSequenceKeypoint.new(0.025, visibility),NumberSequenceKeypoint.new(0.975, visibility),NumberSequenceKeypoint.new(1, 1)})
rotation = rotation + 5
poste = poste - 1
sphere2(8,"Add",x.CFrame*CFrame.Angles(0,0,math.rad(rotation))*CFrame.new(0,poste,0),vt(5,5,5),-0.05,-0.05,-0.05,keptcolor)
sphere2(8,"Add",x.CFrame*CFrame.Angles(0,0,math.rad(180 + rotation))*CFrame.new(0,poste,0),vt(5,5,5),-0.05,-0.05,-0.05,keptcolor)
sphere2(8,"Add",x.CFrame*CFrame.Angles(0,0,math.rad(-rotation))*CFrame.new(0,poste,0),vt(5,5,5),-0.05,-0.05,-0.05,keptcolor)
sphere2(8,"Add",x.CFrame*CFrame.Angles(0,0,math.rad(180 - rotation))*CFrame.new(0,poste,0),vt(5,5,5),-0.05,-0.05,-0.05,keptcolor)
sphere2(8,"Add",x.CFrame*CFrame.Angles(0,0,math.rad(90 + rotation))*CFrame.new(0,poste,0),vt(5,5,5),-0.05,-0.05,-0.05,keptcolor)
sphere2(8,"Add",x.CFrame*CFrame.Angles(0,0,math.rad(90 - rotation))*CFrame.new(0,poste,0),vt(5,5,5),-0.05,-0.05,-0.05,keptcolor)
sphere2(8,"Add",x.CFrame*CFrame.Angles(0,0,math.rad(270 + rotation))*CFrame.new(0,poste,0),vt(5,5,5),-0.05,-0.05,-0.05,keptcolor)
sphere2(8,"Add",x.CFrame*CFrame.Angles(0,0,math.rad(270 - rotation))*CFrame.new(0,poste,0),vt(5,5,5),-0.05,-0.05,-0.05,keptcolor)
msh.Scale = msh.Scale + vt(0,-0.5,-0.5)
a.Transparency = 1+a.Transparency + 0.02
end
wait(1)
orb:Destroy()
a:Destroy()
ht:Destroy()
end))
game:GetService("Debris"):AddItem(orb, 10)
end
end))
hum.WalkSpeed = storehumanoidWS
attack = false
end



function SingularityVoid()
attack = true
hum.WalkSpeed = 0
hum.JumpPower = 0
CFuncs["Sound"].Create("rbxassetid://1208650519", char, 2.5, 1)
local poste = 3
local rotation = 0
local rate = 0
local bgui,imgc = createBGCircle(0,root,Color3.new(0,0,0))
bgui.AlwaysOnTop = true
imgc.ImageTransparency = 11
imgc.Image = "rbxassetid://2076519836"
for i = 0, 124 do
swait()
bgui.Size = bgui.Size + UDim2.new(2.5,0,2.5,0)
imgc.ImageTransparency = 1+imgc.ImageTransparency - 0.01
imgc.Rotation = imgc.Rotation - rotation/10
rotation = rotation + rate
poste = poste + 0.1
rate = rate + 0.1
RH.C0=clerp(RH.C0,cf(1,-1,0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-3),math.rad(0),math.rad(-25)),.1)
LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-3),math.rad(0),math.rad(25)),.1)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0.25,-0.05)*angles(math.rad(-25),math.rad(0),math.rad(0)),.1)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(-10),math.rad(0),math.rad(0)),.1)
RW.C0=clerp(RW.C0,cf(1.5,0.5,0)*angles(math.rad(-10),math.rad(0),math.rad(90)),.1)
LW.C0=clerp(LW.C0,cf(-1.5,0.5,0)*angles(math.rad(-10),math.rad(0),math.rad(-90)),.1)
end
CameraEnshaking(5,12)
local keptcolor = MAINRUINCOLOR
for i, v in pairs(FindNearestHead(root.CFrame.p, 125)) do
if v:FindFirstChild('Head') then
coroutine.resume(coroutine.create(function()
CFuncs["Sound"].Create("rbxassetid://1042716828", v.Head, 5, 0.5)
local vel = Instance.new("BodyPosition", v.Head)
vel.P = 12500
vel.D = 1000
vel.maxForce = Vector3.new(50000000000, 10e10, 50000000000)
vel.position = v.Head.CFrame.p + vt(0,10,0)
for i,v in pairs(v:GetChildren()) do
if v:IsA("Part") or v:IsA("MeshPart") then
coroutine.resume(coroutine.create(function()
local bld = Instance.new("ParticleEmitter",v)
bld.LightEmission = 0.75
bld.Texture = "rbxassetid://0363275192" ---284205403
bld.Color = ColorSequence.new(keptcolor.Color)
bld.Rate = 500
bld.Lifetime = NumberRange.new(1)
bld.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,2,0),NumberSequenceKeypoint.new(0.8,2.25,0),NumberSequenceKeypoint.new(1,0,0)})
bld.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0.5,0),NumberSequenceKeypoint.new(0.8,0.75,0),NumberSequenceKeypoint.new(1,1,0)})
bld.Speed = NumberRange.new(2,5)
bld.VelocitySpread = 50000
bld.Rotation = NumberRange.new(-500,500)
bld.RotSpeed = NumberRange.new(-500,500)
end))
end
end
local A1 = Instance.new("Attachment",root)
local A2 = Instance.new("Attachment",v.Head)
local Beem = Instance.new("Beam",v.Head)
Beem.Attachment0 = A1
Beem.Attachment1 = A2
Beem.LightEmission = 1
Beem.FaceCamera = true
Beem.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0),NumberSequenceKeypoint.new(1, 0)})
Beem.Width0 = 1
Beem.Width1 = 1
Beem.Texture = "rbxassetid://01134824633"
Beem.TextureMode = "Wrap"
Beem.TextureLength = 2
Beem.TextureSpeed = 5
Beem.Color = ColorSequence.new(keptcolor.Color)
wait(5)
coroutine.resume(coroutine.create(function()
local ref = Instance.new("Part", char)
ref.Anchored = true
ref.CanCollide = false
ref.Transparency = 11
ref.CFrame = v.Head.CFrame
sphere2(1,"Add",v.Head.CFrame,vt(25,25,25),-0.25,-0.25,-0.25,keptcolor)
sphere2(2,"Add",v.Head.CFrame,vt(25,25,25),-0.5,-0.5,-0.5,keptcolor)
sphere2(3,"Add",v.Head.CFrame,vt(25,25,25),-0.75,-0.75,-0.75,keptcolor)
for i = 0, 9 do
slash(math.random(10,25)/10,5,true,"Round","Add","Out",v.Head.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(0.5,0.001,0.5),-1,BrickColor.new("Really black"))
end
v.Head.Parent:Destroy()
CFuncs["Sound"].Create("rbxassetid://763718160", ref, 10, 1.1)
CFuncs["Sound"].Create("rbxassetid://782353443", ref, 10, 1)
CFuncs["Sound"].Create("rbxassetid://335657174", ref, 10, 1)
wait(5)
ref:Destroy()
end))
end))
end
end
CFuncs["Sound"].Create("rbxassetid://1664711478", char, 2, 1)
CFuncs["Sound"].Create("rbxassetid://1177785010", char, 3, 1)
CFuncs["Sound"].Create("rbxassetid://167115397", char, 3, 1)
CFuncs["Sound"].Create("rbxassetid://782353443", char, 3, 0.9)
CFuncs["Sound"].Create("rbxassetid://782353443", char, 4, 0.8)
CFuncs["Sound"].Create("rbxassetid://782353443", char, 5, 0.7)
for i = 0, 49 do
slash(math.random(10,50)/10,5,true,"Round","Add","Out",root.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(0.25,0.01,0.25),math.random(150,1000)/250,BrickColor.new("Really black"))
end
coroutine.resume(coroutine.create(function()
local eff = Instance.new("ParticleEmitter",root)
eff.Texture = "rbxassetid://02273224484"
eff.LightEmission = 1
eff.Color = ColorSequence.new(BrickColor.new("Alder").Color)
eff.Rate = 5000000
eff.Lifetime = NumberRange.new(3)
eff.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,25,0),NumberSequenceKeypoint.new(0.2,8,0),NumberSequenceKeypoint.new(1,0.1,0)})
eff.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,1,0),NumberSequenceKeypoint.new(0.2,0,0),NumberSequenceKeypoint.new(1,1,0)})
eff.Speed = NumberRange.new(150,1000)
eff.Drag = 5
eff.Rotation = NumberRange.new(-500,500)
eff.VelocitySpread = 9000
eff.RotSpeed = NumberRange.new(-100,100)
wait(0.5)
eff.Enabled = false
wait(6)
eff:Destroy()
end))
coroutine.resume(coroutine.create(function()
local eff = Instance.new("ParticleEmitter",root)
eff.Texture = "rbxassetid://0363275192"
eff.LightEmission = 0.95
eff.Color = ColorSequence.new(MAINRUINCOLOR.Color)
eff.Rate = 10000
eff.Lifetime = NumberRange.new(1)
eff.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,50,0),NumberSequenceKeypoint.new(0.8,75,0),NumberSequenceKeypoint.new(1,80,0)})
eff.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(0.8,0.5,0),NumberSequenceKeypoint.new(1,1,0)})
eff.Speed = NumberRange.new(100,500)
eff.Drag = 5
eff.Rotation = NumberRange.new(-500,500)
eff.VelocitySpread = 9000
eff.RotSpeed = NumberRange.new(-50,50)
wait(0.5)
eff.Enabled = false
wait(6)
eff:Destroy()
end))
sphere2(10,"Add",root.CFrame,vt(250,250,250),5,5,5,MAINRUINCOLOR)
sphere2(9,"Add",root.CFrame,vt(250,250,250),5,5,5,MAINRUINCOLOR)
sphere2(8,"Add",root.CFrame,vt(250,250,250),5,5,5,MAINRUINCOLOR)
sphere2(2,"Add",root.CFrame,vt(250,250,250),0.1,0.1,0.1,MAINRUINCOLOR)
coroutine.resume(coroutine.create(function()
wait(1)
rotation = 0
rate = 0
for i = 0, 49 do
swait()
bgui.Size = bgui.Size - UDim2.new(rate/2,0,rate/2,0)
imgc.Rotation = imgc.Rotation + rotation/20
rotation = rotation + rate
poste = poste + 1.5
rate = rate + 1.5
end
bgui:Destroy()
end))
hum.WalkSpeed = storehumanoidWS
hum.JumpPower = 50
attack = false
end


function WarpedDash()
attack = true
hum.WalkSpeed = 0
hum.JumpPower = 0
CFuncs["Sound"].Create("rbxassetid://1208650519", tors, 5, 1)
local poste = 3
local rotation = 0
local rate = 0
local bgui,imgc = createBGCircle(100,root,MAINRUINCOLOR.Color)
bgui.AlwaysOnTop = true
imgc.ImageTransparency = 11
imgc.Image = "rbxassetid://2076519836"
for i = 0, 124 do
swait()
bgui.Size = bgui.Size - UDim2.new(0.85,0,0.85,0)
imgc.ImageTransparency = 1+imgc.ImageTransparency - 0.01
imgc.Rotation = imgc.Rotation - rotation/10
rotation = rotation + rate
poste = poste + 0.1
rate = rate + 0.1
sphere2(8,"Add",root.CFrame*CFrame.new(0,-3,0),vt(poste,1,poste),0.05*poste/3,0,0.05*poste/3,MAINRUINCOLOR)
sphere2(8,"Add",root.CFrame*CFrame.new(math.random(-20,20),-3,math.random(-20,20)),vt(1,1,1),-0.01,0.5,-0.01,MAINRUINCOLOR)
sphere2(8,"Add",root.CFrame*CFrame.Angles(0,math.rad(rotation),0)*CFrame.new(0,-3,poste)*CFrame.Angles(math.rad(40),0,0),vt(1,1,1),0.025,0.25,0.025,MAINRUINCOLOR)
sphere2(8,"Add",root.CFrame*CFrame.Angles(0,math.rad(90 + rotation),0)*CFrame.new(0,-3,poste)*CFrame.Angles(math.rad(40),0,0),vt(1,1,1),0.025,0.25,0.025,MAINRUINCOLOR)
sphere2(8,"Add",root.CFrame*CFrame.Angles(0,math.rad(180 + rotation),0)*CFrame.new(0,-3,poste)*CFrame.Angles(math.rad(40),0,0),vt(1,1,1),0.025,0.25,0.025,MAINRUINCOLOR)
sphere2(8,"Add",root.CFrame*CFrame.Angles(0,math.rad(270 + rotation),0)*CFrame.new(0,-3,poste)*CFrame.Angles(math.rad(40),0,0),vt(1,1,1),0.025,0.25,0.025,MAINRUINCOLOR)
slash(math.random(50,100)/10,5,true,"Round","Add","Out",root.CFrame*CFrame.new(0,-3,0)*CFrame.Angles(math.rad(math.random(-5,5)),math.rad(math.random(-360,360)),math.rad(math.random(-5,5))),vt(poste/100,0.01,poste/100),poste/30,BrickColor.new("White"))
RH.C0=clerp(RH.C0,cf(1,-0.35,-0.5)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-2.5),math.rad(-20),math.rad(30)),.5)
LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-2.5),math.rad(0),math.rad(10)),.5)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,-0.75)*angles(math.rad(30),math.rad(0),math.rad(20)),.5)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(-10),math.rad(0),math.rad(-20)),.5)
RW.C0=clerp(RW.C0,cf(1.5,0.5,0)*angles(math.rad(40),math.rad(-8),math.rad(-10)),.5)
LW.C0=clerp(LW.C0,cf(-1.5,0.5,0)*angles(math.rad(-50),math.rad(0),math.rad(-30)),.5)
end
bgui:Destroy()
CameraEnshaking(3,7)
local loc = Instance.new("Part", char)
loc.BrickColor = MAINRUINCOLOR
loc.CanCollide = false
loc.FormFactor = 3
loc.Name = "Ring"
loc.Material = "Neon"
loc.Size = Vector3.new(1, 1, 1)
loc.Transparency = 11
loc.TopSurface = 0
loc.BottomSurface = 0
loc.Anchored = true
loc.CFrame = root.CFrame + root.CFrame.lookVector*100
CFuncs["Sound"].Create("rbxassetid://782353443", loc, 5, 1)
CFuncs["Sound"].Create("rbxassetid://1177785010", loc, 6, 1)
MagniDamage(loc, 95, 500,6000, 0, "Normal")
sphere2(10,"Add",loc.CFrame,vt(5,5,5),-0.05,-0.05,5,MAINRUINCOLOR)
sphere2(8,"Add",loc.CFrame,vt(5,5,5),2.5,2.5,2.5,MAINRUINCOLOR)
sphere2(4,"Add",loc.CFrame,vt(5,5,5),2.5,2.5,2.5,MAINRUINCOLOR)
sphere2(2,"Add",loc.CFrame,vt(5,5,5),2.5,2.5,2.5,MAINRUINCOLOR)
coroutine.resume(coroutine.create(function()
	for i = 0, 49 do
local disr = CreateParta(char,1,1,"Neon",MAINRUINCOLOR)
disr.CFrame = loc.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360)))
local at1 = Instance.new("Attachment",disr)
at1.Position = vt(-5,0,0)
local at2 = Instance.new("Attachment",disr)
at2.Position = vt(5,0,0)
local trl = Instance.new('Trail',disr)
trl.Attachment0 = at1
trl.FaceCamera = true
trl.Attachment1 = at2
trl.Texture = "rbxassetid://02325530138"
trl.LightEmission = 1
trl.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0),NumberSequenceKeypoint.new(1, 1)})
trl.Color = ColorSequence.new(MAINRUINCOLOR.Color)
trl.Lifetime = 0.5
local bv = Instance.new("BodyVelocity")
bv.maxForce = Vector3.new(1e9, 1e9, 1e9)
bv.velocity = disr.CFrame.lookVector*math.random(50,500)
bv.Parent = disr
local val = 0
coroutine.resume(coroutine.create(function()
	swait(math.random(30,60))
	for i = 0, 9 do
		swait()
		val = val + 0.1
		trl.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, val),NumberSequenceKeypoint.new(1, 1)})
	end
game:GetService("Debris"):AddItem(disr, 3)
end))
end
local eff = Instance.new("ParticleEmitter",loc)
eff.Texture = "rbxassetid://0363275192"
eff.LightEmission = 0.95
eff.Color = ColorSequence.new(MAINRUINCOLOR.Color)
eff.Rate = 10000
eff.Lifetime = NumberRange.new(1)
eff.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,50,0),NumberSequenceKeypoint.new(0.8,75,0),NumberSequenceKeypoint.new(1,80,0)})
eff.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(0.8,0.5,0),NumberSequenceKeypoint.new(1,1,0)})
eff.Speed = NumberRange.new(100,500)
eff.Drag = 5
eff.Rotation = NumberRange.new(-500,500)
eff.VelocitySpread = 9000
eff.RotSpeed = NumberRange.new(-50,50)
wait(0.5)
eff.Enabled = false
end))
for i = 0, 29 do
slash(math.random(10,50)/10,5,true,"Round","Add","Out",loc.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(0.01,0.01,0.01),math.random(150,500)/250,BrickColor.new("White"))
end
for i = 0, 49 do
sphere2(math.random(100,300)/100,"Add",loc.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(1,1,5),-0.01,-0.01,5,MAINRUINCOLOR)
end
for i = 0, 9 do
sphere2(3,"Add",loc.CFrame*CFrame.new(math.random(-5,5),math.random(-5,5),0),vt(1,1,5),-0.01,-0.01,5,MAINRUINCOLOR)
end
game:GetService("Debris"):AddItem(loc, 5)
root.CFrame = root.CFrame + root.CFrame.lookVector*200
hum.WalkSpeed = storehumanoidWS
hum.JumpPower = 50
attack = false
end

------------------------------------
function harmonytaunty()
attack = true
hum.WalkSpeed = 0
CFuncs["Sound"].Create("rbxassetid://430312221", tors, 1.25, 1.15)
for i = 0,7,0.1 do
swait()
RH.C0=clerp(RH.C0,cf(1,-0.5,-0.6)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(2),math.rad(0),math.rad(-20 + 6 * math.cos(sine / 34))),.2)
LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(1.5),math.rad(0),math.rad(10 - 4 * math.cos(sine / 47))),.2)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,1 + 0.1 * math.cos(sine / 28))*angles(math.rad(-2 - 3 * math.cos(sine / 34)),math.rad(0),math.rad(-2 + 4 * math.cos(sine / 62))),.2)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(12 - 3 * math.cos(sine / 28)),math.rad(12 - 3 * math.cos(sine / 79)),math.rad(2 - 4 * math.cos(sine / 62))),.2)
RW.C0=clerp(RW.C0,cf(1.45,0.5 + 0.01 * math.cos(sine / 28),-0.1)*angles(math.rad(34 + 2 * math.cos(sine / 33)),math.rad(0),math.rad(-13 - 3 * math.cos(sine / 28))),.2)
LW.C0=clerp(LW.C0,cf(-1.5,0.5 + 0.01 * math.cos(sine / 28),0)*angles(math.rad(80 - 3 * math.cos(sine / 37)),math.rad(0),math.rad(10 + 5 * math.cos(sine / 30))),.2)
end
hum.WalkSpeed = storehumanoidWS
attack = false
end



function vistaunty()
attack = true
hum.WalkSpeed = 0
local rd = math.random(1,5)
if rd == 1 then
chatfunc("You're familiar with this, arent you?",MAINRUINCOLOR.Color,"Inverted","Arcade",1)
elseif rd == 2 then
chatfunc("Dance to the beat. If you want to.",MAINRUINCOLOR.Color,"Inverted","Arcade",1)
elseif rd == 3 then
chatfunc("I'm just bored. Don't mess with me.",MAINRUINCOLOR.Color,"Inverted","Arcade",1)
elseif rd == 4 then
chatfunc("Ready to dance? If not, come back if you want to.",MAINRUINCOLOR.Color,"Inverted","Arcade",1)
elseif rd == 5 then
chatfunc("Ehh, not really into something right now.",MAINRUINCOLOR.Color,"Inverted","Arcade",1)
end
for i = 0, 8, 0.1 do
swait()
RH.C0=clerp(RH.C0,cf(1,-1 - 0.05 * math.cos(sine / 28) + kan.PlaybackLoudness/5000,-0.1)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-2.5),math.rad(-20),math.rad(0 - 2 * math.cos(sine / 56) + kan.PlaybackLoudness/450)),.4)
LH.C0=clerp(LH.C0,cf(-1,-1 - 0.05 * math.cos(sine / 28) - kan.PlaybackLoudness/6500,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-2.5),math.rad(5),math.rad(0 + 2 * math.cos(sine / 56) + kan.PlaybackLoudness/500)),.4)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0 + 0.02 * math.cos(sine / 56) ,0 + 0.05 * math.cos(sine / 28) + kan.PlaybackLoudness/7000)*angles(math.rad(0 - 2 * math.cos(sine / 56)),math.rad(0),math.rad(60)),.4)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(10 + 2 * math.cos(sine / 28) - kan.PlaybackLoudness/60),math.rad(0 + 2 * math.cos(sine / 73)),math.rad(-60)),.4)
RW.C0=clerp(RW.C0,cf(1.5,0.5 + 0.02 * math.cos(sine / 28),0)*angles(math.rad(90 + 5 * math.cos(sine / 34) + kan.PlaybackLoudness/7.5),math.rad(0),math.rad(60 - 2 * math.cos(sine / 38))),.4)
LW.C0=clerp(LW.C0,cf(-1.5,0.5 + 0.02 * math.cos(sine / 28),0)*angles(math.rad(10),math.rad(5),math.rad(7.5)),.4)
end
hum.WalkSpeed = storehumanoidWS
attack = false
end

function shytaunty()
attack = true
hum.WalkSpeed = 0
CFuncs["Sound"].Create("rbxassetid://543623779", tors, 0.35, 1)
local blush = Instance.new("Decal",hed)
blush.Texture = "rbxassetid://0898404027"
blush.Face = "Front"
for i = 0, 13, 0.1 do
swait()
RH.C0=clerp(RH.C0,cf(1,-1 - 0.05 * math.cos(sine / 28) + 0.05 * math.cos(sine / 44),0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(7 - 5 * math.cos(sine / 44)),math.rad(0),math.rad(-6 - 3 * math.cos(sine / 34))),.1)
LH.C0=clerp(LH.C0,cf(-1,-1 - 0.05 * math.cos(sine / 28) - 0.05 * math.cos(sine / 44),0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(3 + 5 * math.cos(sine / 44)),math.rad(0),math.rad(0 + 3 * math.cos(sine / 34))),.1)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0 - 0.05 * math.cos(sine / 44),0 + 0.03 * math.cos(sine / 34),-0.05 + 0.05 * math.cos(sine / 28))*angles(math.rad(0 - 3 * math.cos(sine / 34)),math.rad(0 - 5 * math.cos(sine / 44)),math.rad(-5)),.1)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(2 - 2.5 * math.cos(sine / 28)),math.rad(20 + 5 * math.cos(sine / 62)),math.rad(35 + 5 * math.cos(sine / 59))),.1)
RW.C0=clerp(RW.C0,cf(1,0.5 + 0.1 * math.cos(sine / 28),-0.45)*angles(math.rad(22 - 1 * math.cos(sine / 53)),math.rad(0),math.rad(-60 + 2 * math.cos(sine / 37))),.1)
LW.C0=clerp(LW.C0,cf(-1,0.5 + 0.1 * math.cos(sine / 28),-0.45)*angles(math.rad(26 - 2 * math.cos(sine / 58)),math.rad(0),math.rad(59 - 3 * math.cos(sine / 57) )),.1)
end
coroutine.resume(coroutine.create(function()
for i = 0, 49 do
swait()
blush.Transparency = blush.Transparency + 0.02
end
blush:Destroy()
end))
hum.WalkSpeed = storehumanoidWS
attack = false
end
------------------------------------ Mode Ascendances
function UnknownA()
hum.WalkSpeed = 0
attack = true
local keptcolor = MAINRUINCOLOR
local locat = Instance.new("Part", char)
locat.CanCollide = false
locat.FormFactor = 3
locat.Name = "Ring"
locat.Material = "Neon"
locat.Size = Vector3.new(1, 1, 1)
locat.Transparency = 11
locat.TopSurface = 0
locat.BottomSurface = 0
locat.Anchored = true
locat.CFrame = root.CFrame*CFrame.new(0,-3,0)
local poste = 0
local rotation = 0
local upperpos = 0
local rate = 0
local x = locat

local efec = Instance.new("ParticleEmitter",root)
efec.Texture = "rbxassetid://02109052855"
efec.LightEmission = 1
efec.Color = ColorSequence.new(MAINRUINCOLOR.Color)
efec.Rate = 5
efec.Lifetime = NumberRange.new(1)
efec.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,100,0),NumberSequenceKeypoint.new(0.2,50,0),NumberSequenceKeypoint.new(0.6,125,0),NumberSequenceKeypoint.new(0.8,175,0),NumberSequenceKeypoint.new(1,20,0)})
efec.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,1,0),NumberSequenceKeypoint.new(0.1,0.25,0),NumberSequenceKeypoint.new(0.6,0.25,0),NumberSequenceKeypoint.new(1,1,0)})
efec.Drag = 5
efec.LockedToPart = true
efec.Rotation = NumberRange.new(-500,500)
efec.VelocitySpread = 9000
efec.RotSpeed = NumberRange.new(-500,500)
local efec2 = efec:Clone()
efec2.LightEmission = 1
efec2.Texture = "rbxassetid://02092248396"
efec2.Parent = root
efec2.Rate = 10
efec2.Lifetime = NumberRange.new(1)
efec2.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,175,0),NumberSequenceKeypoint.new(0.5,150,0),NumberSequenceKeypoint.new(0.8,500,0),NumberSequenceKeypoint.new(1,1000,0)})
efec2.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,1,0),NumberSequenceKeypoint.new(0.5,0.5,0),NumberSequenceKeypoint.new(1,1,0)})
efec2.Speed = NumberRange.new(0)
efec2.RotSpeed = NumberRange.new(-100,100)
local efec3 = efec:Clone()
efec3.LightEmission = 1
efec3.Color = ColorSequence.new(Color3.new(0.75,0.85,1))
efec3.Texture = "rbxassetid://02273224484"
efec3.Parent = root
efec3.Rate = 10000
efec3.Drag = 5
efec3.LockedToPart = false
efec3.Lifetime = NumberRange.new(2)
efec3.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,5,0),NumberSequenceKeypoint.new(0.5,10,0),NumberSequenceKeypoint.new(0.8,15,0),NumberSequenceKeypoint.new(1,0,0)})
efec3.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,1,0),NumberSequenceKeypoint.new(0.5,0,0),NumberSequenceKeypoint.new(1,1,0)})
efec3.Speed = NumberRange.new(50,700)
efec3.RotSpeed = NumberRange.new(-100,100)
CFuncs["Sound"].Create("rbxassetid://136007472", char, 3.5,0.7)
CFuncs["Sound"].Create("rbxassetid://289315275", char, 3.5, 1)
CFuncs["Sound"].Create("rbxassetid://419447292", char, 3.5, 1)
sphere2(8,"Add",tors.CFrame,vt(1,1,1),5,5,5,keptcolor)
sphere2(6,"Add",tors.CFrame,vt(1,1,1),5,5,5,keptcolor)
sphere2(4,"Add",tors.CFrame,vt(1,1,1),5,5,5,keptcolor)
sphere2(2,"Add",tors.CFrame,vt(1,1,1),5,5,5,keptcolor)
CameraEnshaking(2,5)
for i = 0, 99 do
local disr = CreateParta(char,1,1,"Neon",keptcolor)
disr.CFrame = root.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360)))
local at1 = Instance.new("Attachment",disr)
at1.Position = vt(-10,0,0)
local at2 = Instance.new("Attachment",disr)
at2.Position = vt(10,0,0)
local trl = Instance.new('Trail',disr)
trl.Attachment0 = at1
trl.FaceCamera = true
trl.Attachment1 = at2
trl.Texture = "rbxassetid://02325530138"
trl.LightEmission = 1
trl.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0),NumberSequenceKeypoint.new(1, 1)})
trl.Color = ColorSequence.new(keptcolor.Color)
trl.Lifetime = 0.5
local bv = Instance.new("BodyVelocity")
bv.maxForce = Vector3.new(1e9, 1e9, 1e9)
bv.velocity = disr.CFrame.lookVector*math.random(50,500)
bv.Parent = disr
local val = 0
coroutine.resume(coroutine.create(function()
	swait(math.random(30,60))
	for i = 0, 19 do
		swait()
		val = val + 0.05
		trl.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, val),NumberSequenceKeypoint.new(1, 1)})
	end
game:GetService("Debris"):AddItem(disr, 3)
end))
end
for i = 0, 49 do
swait()
rotation = rotation + 5
poste = poste + 1
sphere2(math.random(4,6),"Add",tors.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(5,1,5),-0.05,math.random(25,100)/25,-0.05,keptcolor)
slash(math.random(50,100)/10,5,true,"Round","Add","Out",root.CFrame*CFrame.new(0,-3,0)*CFrame.Angles(math.rad(math.random(-5,5)),math.rad(math.random(-360,360)),math.rad(math.random(-5,5))),vt(poste/100,0.01,poste/100),poste/50,BrickColor.new("White"))
sphere2(8,"Add",tors.CFrame,vt(poste/1.5,poste/1.5,poste/1.5),0.01,0.01,0.01,keptcolor)
sphere2(8,"Add",x.CFrame*CFrame.Angles(0,math.rad(rotation),0)*CFrame.new(0,upperpos,poste),vt(5,5,5),-0.05,-0.05,-0.05,keptcolor)
sphere2(8,"Add",x.CFrame*CFrame.Angles(0,math.rad(90 + rotation),0)*CFrame.new(0,upperpos,poste),vt(5,5,5),-0.05,-0.05,-0.05,keptcolor)
sphere2(8,"Add",x.CFrame*CFrame.Angles(0,math.rad(180 + rotation),0)*CFrame.new(0,upperpos,poste),vt(5,5,5),-0.05,-0.05,-0.05,keptcolor)
sphere2(8,"Add",x.CFrame*CFrame.Angles(0,math.rad(270 + rotation),0)*CFrame.new(0,upperpos,poste),vt(5,5,5),-0.05,-0.05,-0.05,keptcolor)
sphere2(8,"Add",x.CFrame*CFrame.Angles(0,math.rad(-rotation),0)*CFrame.new(0,upperpos,poste*2),vt(5,5,5),-0.05,-0.05,-0.05,keptcolor)
sphere2(8,"Add",x.CFrame*CFrame.Angles(0,math.rad(90-rotation),0)*CFrame.new(0,upperpos,poste*2),vt(5,5,5),-0.05,-0.05,-0.05,keptcolor)
sphere2(8,"Add",x.CFrame*CFrame.Angles(0,math.rad(180-rotation),0)*CFrame.new(0,upperpos,poste*2),vt(5,5,5),-0.05,-0.05,-0.05,keptcolor)
sphere2(8,"Add",x.CFrame*CFrame.Angles(0,math.rad(270-rotation),0)*CFrame.new(0,upperpos,poste*2),vt(5,5,5),-0.05,-0.05,-0.05,keptcolor)
RH.C0=clerp(RH.C0,cf(1,-0.05,-0.75)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-2.5),math.rad(0),math.rad(-30)),.5)
LH.C0=clerp(LH.C0,cf(-1,-0.5,-0.25)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-2.5),math.rad(0),math.rad(30)),.5)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,1 + 0.1 * math.cos(sine / 28))*angles(math.rad(20 - 1 * math.cos(sine / 34)),math.rad(0),math.rad(0)),.5)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(55),math.rad(0),math.rad(0)),.5)
RW.C0=clerp(RW.C0,cf(0.75,0.5,-0.25)*angles(math.rad(140),math.rad(0),math.rad(-20 + 2.5 * math.cos(sine / 28))),.5)
LW.C0=clerp(LW.C0,cf(-0.75,0.5,-0.25)*angles(math.rad(140),math.rad(0),math.rad(20 - 2.5 * math.cos(sine / 28))),.5)
end
for i = 0, 149 do
swait()
rotation = rotation + 5
sphere2(math.random(4,6),"Add",tors.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(5,1,5),-0.05,math.random(25,100)/25,-0.05,keptcolor)
slash(math.random(50,100)/10,5,true,"Round","Add","Out",root.CFrame*CFrame.new(0,-3,0)*CFrame.Angles(math.rad(math.random(-5,5)),math.rad(math.random(-360,360)),math.rad(math.random(-5,5))),vt(poste/100,0.01,poste/100),poste/50,BrickColor.new("White"))
sphere2(8,"Add",tors.CFrame,vt(poste/1.5,poste/1.5,poste/1.5),0.01,0.01,0.01,keptcolor)
sphere2(8,"Add",x.CFrame*CFrame.Angles(0,math.rad(rotation),0)*CFrame.new(0,upperpos,poste),vt(5,5,5),-0.05,-0.05,-0.05,keptcolor)
sphere2(8,"Add",x.CFrame*CFrame.Angles(0,math.rad(90 + rotation),0)*CFrame.new(0,upperpos,poste),vt(5,5,5),-0.05,-0.05,-0.05,keptcolor)
sphere2(8,"Add",x.CFrame*CFrame.Angles(0,math.rad(180 + rotation),0)*CFrame.new(0,upperpos,poste),vt(5,5,5),-0.05,-0.05,-0.05,keptcolor)
sphere2(8,"Add",x.CFrame*CFrame.Angles(0,math.rad(270 + rotation),0)*CFrame.new(0,upperpos,poste),vt(5,5,5),-0.05,-0.05,-0.05,keptcolor)
sphere2(8,"Add",x.CFrame*CFrame.Angles(0,math.rad(-rotation),0)*CFrame.new(0,upperpos,poste*2),vt(5,5,5),-0.05,-0.05,-0.05,keptcolor)
sphere2(8,"Add",x.CFrame*CFrame.Angles(0,math.rad(90-rotation),0)*CFrame.new(0,upperpos,poste*2),vt(5,5,5),-0.05,-0.05,-0.05,keptcolor)
sphere2(8,"Add",x.CFrame*CFrame.Angles(0,math.rad(180-rotation),0)*CFrame.new(0,upperpos,poste*2),vt(5,5,5),-0.05,-0.05,-0.05,keptcolor)
sphere2(8,"Add",x.CFrame*CFrame.Angles(0,math.rad(270-rotation),0)*CFrame.new(0,upperpos,poste*2),vt(5,5,5),-0.05,-0.05,-0.05,keptcolor)
RH.C0=clerp(RH.C0,cf(1,-0.05,-0.75)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-2.5),math.rad(0),math.rad(-30)),.5)
LH.C0=clerp(LH.C0,cf(-1,-0.5,-0.25)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-2.5),math.rad(0),math.rad(30)),.5)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,1 + 0.1 * math.cos(sine / 28))*angles(math.rad(20 - 1 * math.cos(sine / 34)),math.rad(0),math.rad(0)),.5)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(55),math.rad(0),math.rad(0)),.5)
RW.C0=clerp(RW.C0,cf(0.75,0.5,-0.25)*angles(math.rad(140),math.rad(0),math.rad(-20 + 2.5 * math.cos(sine / 28))),.5)
LW.C0=clerp(LW.C0,cf(-0.75,0.5,-0.25)*angles(math.rad(140),math.rad(0),math.rad(20 - 2.5 * math.cos(sine / 28))),.5)
end
efec.Enabled = false
efec2.Enabled = false
efec3.Enabled = false
game:GetService("Debris"):AddItem(efec, 5)
game:GetService("Debris"):AddItem(efec2, 5)
game:GetService("Debris"):AddItem(efec3, 5)
ModeOfGlitch = 6000000000
storehumanoidWS = 300
hum.WalkSpeed = 300
rainbowmode = false
chaosmode = false
RecolorTextAndRename("HARMONY",BrickColor.new("Toothpaste").Color,BrickColor.new("Cool yellow").Color,"Highway")
newThemeCust("rbxassetid://603565821",0,1.01,1.5)
MAINRUINCOLOR = BrickColor.new("Toothpaste")
keptcolor = MAINRUINCOLOR
RecolorThing(MAINRUINCOLOR,BrickColor.new("Cool yellow"),MAINRUINCOLOR,MAINRUINCOLOR,MAINRUINCOLOR,1,MAINRUINCOLOR,1,MAINRUINCOLOR)
CFuncs["Sound"].Create("rbxassetid://763717897", char, 4, 1)
CFuncs["Sound"].Create("rbxassetid://1192402877", char, 2.5, 0.75)
CFuncs["Sound"].Create("rbxassetid://1664711478", char, 4, 0.95)
sphere2(1,"Add",x.CFrame*CFrame.new(0,0,0),vt(15,0,15),5,0,5,BrickColor.new("Cool yellow"))
sphere2(2,"Add",x.CFrame*CFrame.new(0,0,0),vt(15,0,15),5,0,5,keptcolor)
sphere2(1,"Add",x.CFrame*CFrame.new(0,0,0),vt(5,50000,5),1.5,1,1.5,BrickColor.new("White"))
sphere2(2,"Add",x.CFrame*CFrame.new(0,0,0),vt(5,50000,5),1.5,1,1.5,BrickColor.new("Cool yellow"))
sphere2(4,"Add",x.CFrame*CFrame.new(0,0,0),vt(5,50000,5),1.5,1,1.5,keptcolor)
for i = 0, 99 do
local dis = CreateParta(char,1,1,"Neon",MAINRUINCOLOR)
dis.CFrame = root.CFrame*CFrame.new(math.random(-5,5),math.random(-5,5),math.random(-5,5))*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360)))
local at1 = Instance.new("Attachment",dis)
at1.Position = vt(-25000,0,0)
local at2 = Instance.new("Attachment",dis)
at2.Position = vt(25000,0,0)
local trl = Instance.new('Trail',dis)
trl.Attachment0 = at1
trl.FaceCamera = true
trl.Attachment1 = at2
trl.Texture = "rbxassetid://01049219073"
trl.LightEmission = 1
trl.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0),NumberSequenceKeypoint.new(1, 1)})
trl.Color = ColorSequence.new(MAINRUINCOLOR.Color)
trl.Lifetime = 5
local bv = Instance.new("BodyVelocity")
bv.maxForce = Vector3.new(1e9, 1e9, 1e9)
bv.velocity = dis.CFrame.lookVector*math.random(500,2500)
bv.Parent = dis
game:GetService("Debris"):AddItem(dis, 10)
end
attack = false
hum.WalkSpeed = storehumanoidWS
for i = 0, 99 do
slash(math.random(10,30)/10,5,true,"Round","Add","Out",root.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(0.01,0.01,0.01),math.random(250,2500)/250,BrickColor.new("White"))
end
for i = 0, 49 do
local rsiz = math.random(150,450)
sphere2(math.random(1,4),"Add",tors.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(15,1,15),-0.05,math.random(25,500)/25,-0.05,BrickColor.new("Cool yellow"))
sphere2(math.random(1,2),"Add",x.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360)))*CFrame.new(math.random(-350,350),math.random(-350,350),math.random(-350,350)),vt(1,1,1),-0.01,math.random(50,250)/10,-0.01,BrickColor.new("Cool yellow"))
sphereMK(math.random(1,2),math.random(2,4),"Add",x.CFrame*CFrame.Angles(math.rad(90 + math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),rsiz/10,rsiz/10,rsiz/10,0,BrickColor.new("White"),0)
end
coroutine.resume(coroutine.create(function()
local eff = Instance.new("ParticleEmitter",x)
eff.Texture = "rbxassetid://02273224484"
eff.LightEmission = 1
eff.Color = ColorSequence.new(BrickColor.new("Cool yellow").Color)
eff.Rate = 50000
eff.Lifetime = NumberRange.new(3,8)
eff.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,120,0),NumberSequenceKeypoint.new(0.2,25,0),NumberSequenceKeypoint.new(1,0.1,0)})
eff.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,1,0),NumberSequenceKeypoint.new(0.2,0,0),NumberSequenceKeypoint.new(1,1,0)})
eff.Speed = NumberRange.new(250,1500)
eff.Drag = 5
eff.Rotation = NumberRange.new(-500,500)
eff.VelocitySpread = 9000
eff.RotSpeed = NumberRange.new(-100,100)
wait(1.25)
eff.Enabled = false
end))
--[[for i, v in pairs(FindNearestHead(Torso.CFrame.p, 2000000000)) do
if v:FindFirstChild('Head') then
dmg(v)
end
end]]--
sphere2(3,"Add",tors.CFrame,vt(1,1,1),10,10,10,keptcolor)
sphere2(2,"Add",tors.CFrame,vt(1,1,1),10,10,10,BrickColor.new("Cool yellow"))
sphere2(1,"Add",tors.CFrame,vt(1,1,1),10,10,10,BrickColor.new("White"))
CameraEnshaking(8,10)
for i = 0, 99 do
swait()
rotation = rotation + 5
poste = poste + 1
upperpos = upperpos + rate
rate = rate + 0.1
sphere2(math.random(1,2),"Add",x.CFrame*CFrame.new(math.random(-350,350),0,math.random(-350,350)),vt(5,1,5),-0.05,math.random(50,250)/50,-0.05,keptcolor)
sphere2(8,"Add",x.CFrame*CFrame.Angles(0,math.rad(rotation),0)*CFrame.new(0,upperpos,poste),vt(5+upperpos/5,5+upperpos/5,5+upperpos/5),-0.05,-0.05,-0.05,BrickColor.new("Cool yellow"))
sphere2(8,"Add",x.CFrame*CFrame.Angles(0,math.rad(90+rotation),0)*CFrame.new(0,upperpos,poste),vt(5+upperpos/5,5+upperpos/5,5+upperpos/5),-0.05,-0.05,-0.05,BrickColor.new("Cool yellow"))
sphere2(8,"Add",x.CFrame*CFrame.Angles(0,math.rad(180+rotation),0)*CFrame.new(0,upperpos,poste),vt(5+upperpos/5,5+upperpos/5,5+upperpos/5),-0.05,-0.05,-0.05,BrickColor.new("Cool yellow"))
sphere2(8,"Add",x.CFrame*CFrame.Angles(0,math.rad(270+rotation),0)*CFrame.new(0,upperpos,poste),vt(5+upperpos/5,5+upperpos/5,5+upperpos/5),-0.05,-0.05,-0.05,BrickColor.new("Cool yellow"))
sphere2(8,"Add",x.CFrame*CFrame.Angles(0,math.rad(-rotation),0)*CFrame.new(0,upperpos/2,poste*2),vt(5+upperpos/10,5+upperpos/10,5+upperpos/10),-0.05,-0.05,-0.05,keptcolor)
sphere2(8,"Add",x.CFrame*CFrame.Angles(0,math.rad(90-rotation),0)*CFrame.new(0,upperpos/2,poste*2),vt(5+upperpos/10,5+upperpos/10,5+upperpos/10),-0.05,-0.05,-0.05,keptcolor)
sphere2(8,"Add",x.CFrame*CFrame.Angles(0,math.rad(180-rotation),0)*CFrame.new(0,upperpos/2,poste*2),vt(5+upperpos/10,5+upperpos/10,5+upperpos/10),-0.05,-0.05,-0.05,keptcolor)
sphere2(8,"Add",x.CFrame*CFrame.Angles(0,math.rad(270-rotation),0)*CFrame.new(0,upperpos/2,poste*2),vt(5+upperpos/10,5+upperpos/10,5+upperpos/10),-0.05,-0.05,-0.05,keptcolor)
end
wait(6)
x:Destroy()
end



function loveydovey()
attack = true
local keptcolor = MAINRUINCOLOR
hum.WalkSpeed = 0
for i = 0, 5, 0.1 do
	swait()
	RH.C0=clerp(RH.C0,cf(1,-1,0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(7),math.rad(0),math.rad(-6)),.1)
LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(3),math.rad(0),math.rad(0)),.1)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,-0.05)*angles(math.rad(0),math.rad(0),math.rad(0)),.1)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(2.5),math.rad(10),math.rad(0)),.1)
RW.C0=clerp(RW.C0,cf(1,0.5,-0.45)*angles(math.rad(22),math.rad(0),math.rad(-37)),.1)
LW.C0=clerp(LW.C0,cf(-1,0.5,-0.45)*angles(math.rad(23),math.rad(0),math.rad(38)),.1)
end
CameraEnshaking(4,9)
sphere2(2,"Add",root.CFrame,vt(5,5,5),0.5,0.5,0.5,keptcolor)
sphere2(2,"Add",root.CFrame,vt(5,5,5),0.75,0.75,0.75,keptcolor)
sphere2(3,"Add",root.CFrame,vt(5,5,5),1,1,1,keptcolor)
sphere2(3,"Add",root.CFrame,vt(5,5,5),1.25,1.25,1.25,keptcolor)
sphere2(1,"Add",root.CFrame,vt(5,10000,5),0.5,0.5,0.5,keptcolor)
sphere2(2,"Add",root.CFrame,vt(5,10000,5),0.6,0.6,0.6,keptcolor)
CFuncs["Sound"].Create("rbxassetid://1368637781", char, 1.5,1.25)
CFuncs["Sound"].Create("rbxassetid://763717897", char, 2.5, 1.25)
CFuncs["Sound"].Create("rbxassetid://1192402877", char, 2.5, 1)
coroutine.resume(coroutine.create(function()
local eff = Instance.new("ParticleEmitter",root)
eff.Texture = "rbxassetid://0363275192"
eff.LightEmission = 0.95
eff.Color = ColorSequence.new(keptcolor.Color)
eff.Rate = 10000
eff.Lifetime = NumberRange.new(1)
eff.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,20,0),NumberSequenceKeypoint.new(0.8,50,0),NumberSequenceKeypoint.new(1,0,0)})
eff.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(0.8,0.5,0),NumberSequenceKeypoint.new(1,1,0)})
eff.Speed = NumberRange.new(50,200)
eff.Drag = 5
eff.Rotation = NumberRange.new(-500,500)
eff.VelocitySpread = 9000
eff.RotSpeed = NumberRange.new(-50,50)
wait(0.5)
eff.Enabled = false
wait(5)
eff:Destroy()
end))
for i = 0, 24 do
slash(math.random(10,50)/10,5,true,"Round","Add","Out",root.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(0.01,0.01,0.01),math.random(250,500)/250,BrickColor.new("White"))
end
for i = 0, 49 do
local rsiz = math.random(70,90)
sphere2(math.random(1,4),"Add",root.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(5,1,5),-0.005,math.random(25,100)/25,-0.005,MAINRUINCOLOR)
end
CFuncs["Sound"].Create("rbxassetid://847061203", char, 1,1)
CFuncs["Sound"].Create("rbxassetid://543623779", root, 1.5,1)
newTheme("rbxassetid://728272672",0,1.02,1.25)
ModeOfGlitch = 9600000000
MAINRUINCOLOR = BrickColor.new("Hot pink")
for i = 0, 1, 0.2 do
	swait()
	RH.C0=clerp(RH.C0,cf(1,-1.05,0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(7),math.rad(0),math.rad(-16)),.8)
LH.C0=clerp(LH.C0,cf(-1,-1.05,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(3),math.rad(0),math.rad(10)),.8)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0.1,0.05)*angles(math.rad(-10),math.rad(0),math.rad(0)),.8)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(-10),math.rad(20),math.rad(0)),.8)
RW.C0=clerp(RW.C0,cf(1.5,0.5,0)*angles(math.rad(12),math.rad(0),math.rad(57)),.8)
LW.C0=clerp(LW.C0,cf(-1.5,0.5,0)*angles(math.rad(13),math.rad(0),math.rad(-58)),.8)
end
for i = 0, 9, 0.1 do
	swait()
	RH.C0=clerp(RH.C0,cf(1,-1,0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(7),math.rad(0),math.rad(-6)),.1)
LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(3),math.rad(0),math.rad(0)),.1)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,-0.05)*angles(math.rad(0),math.rad(0),math.rad(0)),.1)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(2.5),math.rad(10),math.rad(0)),.1)
RW.C0=clerp(RW.C0,cf(1,0.5,-0.45)*angles(math.rad(22),math.rad(0),math.rad(-37)),.1)
LW.C0=clerp(LW.C0,cf(-1,0.5,-0.45)*angles(math.rad(23),math.rad(0),math.rad(38)),.1)
end
CameraEnshaking(2,11)
sphere2(2,"Add",root.CFrame,vt(5,5,5),0.75,0.75,0.75,BrickColor.new("Pink"))
sphere2(2,"Add",root.CFrame,vt(5,5,5),1,1,1,BrickColor.new("Pink"))
sphere2(3,"Add",root.CFrame,vt(5,5,5),1.25,1.25,1.25,MAINRUINCOLOR)
sphere2(3,"Add",root.CFrame,vt(5,5,5),1.5,1.5,1.5,MAINRUINCOLOR)
sphere2(1,"Add",root.CFrame,vt(5,10000,5),0.5,0.5,0.5,BrickColor.new("Pink"))
sphere2(2,"Add",root.CFrame,vt(5,10000,5),1,1,1,MAINRUINCOLOR)
CFuncs["Sound"].Create("rbxassetid://1368637781", char, 2,1)
CFuncs["Sound"].Create("rbxassetid://763717897", char, 3, 1.125)
CFuncs["Sound"].Create("rbxassetid://1192402877", char, 3, 0.75)
for i = 0, 49 do
slash(math.random(10,30)/10,5,true,"Round","Add","Out",root.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(0.01,0.01,0.01),math.random(250,500)/250,BrickColor.new("White"))
end
for i = 0, 49 do
local rsiz = math.random(70,90)
sphere2(math.random(1,4),"Add",root.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(5,1,5),-0.005,math.random(50,200)/25,-0.005,MAINRUINCOLOR)
sphereMK(math.random(1,2),math.random(1,3),"Add",root.CFrame*CFrame.Angles(math.rad(90 + math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),rsiz/10,rsiz/10,rsiz/10,0,BrickColor.new("Pink"),0)
end
CFuncs["Sound"].Create("rbxassetid://847061203", char, 1,1)
for i = 0, 1, 0.2 do
	swait()
	RH.C0=clerp(RH.C0,cf(1,-1.05,0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(7),math.rad(0),math.rad(-16)),.8)
LH.C0=clerp(LH.C0,cf(-1,-1.05,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(3),math.rad(0),math.rad(10)),.8)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0.1,0.05)*angles(math.rad(-10),math.rad(0),math.rad(0)),.8)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(-10),math.rad(20),math.rad(0)),.8)
RW.C0=clerp(RW.C0,cf(1.5,0.5,0)*angles(math.rad(12),math.rad(0),math.rad(57)),.8)
LW.C0=clerp(LW.C0,cf(-1.5,0.5,0)*angles(math.rad(13),math.rad(0),math.rad(-58)),.8)
end
for i = 0, 1, 0.1 do
	swait()
	RH.C0=clerp(RH.C0,cf(1,-1,0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(7),math.rad(0),math.rad(-6)),.1)
LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(3),math.rad(0),math.rad(0)),.1)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,-0.05)*angles(math.rad(0),math.rad(0),math.rad(0)),.1)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(2.5),math.rad(10),math.rad(0)),.1)
RW.C0=clerp(RW.C0,cf(1,0.5,-0.45)*angles(math.rad(22),math.rad(0),math.rad(-37)),.1)
LW.C0=clerp(LW.C0,cf(-1,0.5,-0.45)*angles(math.rad(23),math.rad(0),math.rad(38)),.1)
end
CameraEnshaking(9,14)
sphere2(4,"Add",root.CFrame,vt(5,5,5),1,1,1,BrickColor.new("Pink"))
sphere2(4,"Add",root.CFrame,vt(5,5,5),2,2,2,BrickColor.new("Pink"))
sphere2(9,"Add",root.CFrame,vt(5,5,5),3,3,3,MAINRUINCOLOR)
sphere2(9,"Add",root.CFrame,vt(5,5,5),4,4,4,MAINRUINCOLOR)
CFuncs["Sound"].Create("rbxassetid://847061203", char, 3,0.5)
CFuncs["Sound"].Create("rbxassetid://763717897", char, 5, 0.75)
CFuncs["Sound"].Create("rbxassetid://1192402877", char, 6, 0.5)
CFuncs["Sound"].Create("rbxassetid://1664711478", char, 5, 1)
sphere2(1,"Add",root.CFrame,vt(5,5,5),2,2,2,BrickColor.new("Pink"))
sphere2(1,"Add",root.CFrame,vt(5,5,5),3,3,3,BrickColor.new("Pink"))
sphere2(1,"Add",root.CFrame,vt(5,5,5),4,4,4,BrickColor.new("Pink"))
sphere2(1,"Add",root.CFrame,vt(5,10000,5),2.5,2.5,2.5,BrickColor.new("Pink"))
sphere2(2,"Add",root.CFrame,vt(5,10000,5),3.5,3.5,3.5,MAINRUINCOLOR)
sphere2(1,"Add",root.CFrame,vt(5,5,5),8,8,8,BrickColor.new("Pink"))
sphere2(2,"Add",root.CFrame,vt(5,5,5),14,14,14,MAINRUINCOLOR)
sphere2(3,"Add",root.CFrame,vt(5,5,5),20,20,20,MAINRUINCOLOR)
for i = 0, 99 do
slash(math.random(10,30)/10,5,true,"Round","Add","Out",root.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(0.01,0.01,0.01),math.random(250,2500)/250,BrickColor.new("White"))
end
for i = 0, 99 do
local rsiz = math.random(150,450)
sphere2(math.random(1,4),"Add",root.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(15,1,15),-0.05,math.random(25,500)/25,-0.05,BrickColor.new("Pink"))
sphere2(math.random(1,2),"Add",root.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360)))*CFrame.new(math.random(-350,350),math.random(-350,350),math.random(-350,350)),vt(1,1,1),-0.01,math.random(50,250)/10,-0.01,MAINRUINCOLOR)
sphereMK(math.random(1,2),math.random(4,6),"Add",root.CFrame*CFrame.Angles(math.rad(90 + math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),rsiz/10,rsiz/10,rsiz/10,0,BrickColor.new("Pink"),0)
end
coroutine.resume(coroutine.create(function()
local eff = Instance.new("ParticleEmitter",root)
eff.Texture = "rbxassetid://0749327003"
eff.LightEmission = 1
eff.Color = ColorSequence.new(BrickColor.new("Pink").Color)
eff.Rate = 50000
eff.Lifetime = NumberRange.new(5)
eff.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,50,0),NumberSequenceKeypoint.new(0.5,60,0),NumberSequenceKeypoint.new(1,0.1,0)})
eff.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(0.8,0.5,0),NumberSequenceKeypoint.new(1,1,0)})
eff.Speed = NumberRange.new(250,1000)
eff.Drag = 5
eff.Rotation = NumberRange.new(-50,50)
eff.VelocitySpread = 9000
eff.RotSpeed = NumberRange.new(-50,50)
wait(0.5)
eff.Enabled = false
wait(5)
eff:Destroy()
end))
storehumanoidWS = 100
rainbowmode = false
chaosmode = false
RecolorTextAndRename("LOVE",BrickColor.new("Pink").Color,BrickColor.new("Hot pink").Color,"Cartoon")
RecolorThing(MAINRUINCOLOR,BrickColor.new("Pink"),MAINRUINCOLOR,MAINRUINCOLOR,MAINRUINCOLOR,1,MAINRUINCOLOR,1,MAINRUINCOLOR)
for i = 0, 2, 0.1 do
	swait()
	sphere2(math.random(1,2),"Add",root.CFrame*CFrame.new(math.random(-350,350),0,math.random(-350,350)),vt(5,1,5),-0.05,math.random(50,250)/50,-0.05,MAINRUINCOLOR)
	RH.C0=clerp(RH.C0,cf(1,-1.05,0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(7),math.rad(0),math.rad(-16)),.8)
LH.C0=clerp(LH.C0,cf(-1,-1.05,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(3),math.rad(0),math.rad(10)),.8)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0.1,0.05)*angles(math.rad(-10),math.rad(0),math.rad(0)),.8)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(-15),math.rad(0),math.rad(0)),.8)
RW.C0=clerp(RW.C0,cf(1.5,0.5,0)*angles(math.rad(-25),math.rad(0),math.rad(97)),.8)
LW.C0=clerp(LW.C0,cf(-1.5,0.5,0)*angles(math.rad(-27),math.rad(0),math.rad(-98)),.8)
end
hum.WalkSpeed = storehumanoidWS
attack = false
end

function SolarSystem()
attack = true
hum.WalkSpeed = 0
MAINRUINCOLOR = BrickColor.new("Bright orange")
newThemeCust("rbxassetid://318062185",0,1.01,1.5) --737063244,925278639
local vel = Instance.new("BodyPosition", root)
vel.P = 10000
vel.D = 1000
vel.maxForce = Vector3.new(50000000000, 10e10, 50000000000)
vel.position = root.CFrame.p + vt(0,250,0)
CFuncs["Sound"].Create("rbxassetid://1295446488", char, 5, 0.5)
CFuncs["Sound"].Create("rbxassetid://1368598393", char, 7.5, 0.5)
for i = 0, 49 do
slash(math.random(10,100)/10,3,true,"Round","Add","Out",root.CFrame*CFrame.new(0,-3,0)*CFrame.Angles(math.rad(math.random(-10,10)),math.rad(math.random(-360,360)),math.rad(math.random(-10,10))),vt(0.05,0.01,0.05),math.random(25,500)/250,BrickColor.new("White"))
end
local efec = Instance.new("ParticleEmitter",root)
efec.Texture = "rbxassetid://02109052855"
efec.LightEmission = 1
efec.Color = ColorSequence.new(Color3.new(1,0.45,0))
efec.Rate = 5
efec.Lifetime = NumberRange.new(3)
efec.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,75,0),NumberSequenceKeypoint.new(0.2,60,0),NumberSequenceKeypoint.new(0.6,400,0),NumberSequenceKeypoint.new(0.8,300,0),NumberSequenceKeypoint.new(1,200,0)})
efec.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,1,0),NumberSequenceKeypoint.new(0.1,0.25,0),NumberSequenceKeypoint.new(0.6,0.25,0),NumberSequenceKeypoint.new(1,1,0)})
efec.Drag = 5
efec.LockedToPart = true
efec.Rotation = NumberRange.new(-500,500)
efec.VelocitySpread = 9000
efec.RotSpeed = NumberRange.new(-500,500)
local efec2 = efec:Clone()
efec2.LightEmission = 1
efec2.Texture = "rbxassetid://02092248396"
efec2.Parent = root
efec2.Rate = 10
efec2.Lifetime = NumberRange.new(2)
efec2.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,175,0),NumberSequenceKeypoint.new(0.5,150,0),NumberSequenceKeypoint.new(0.8,500,0),NumberSequenceKeypoint.new(1,1000,0)})
efec2.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,1,0),NumberSequenceKeypoint.new(0.5,0.5,0),NumberSequenceKeypoint.new(1,1,0)})
efec2.Speed = NumberRange.new(0)
efec2.RotSpeed = NumberRange.new(-100,100)
local efec3 = efec:Clone()
efec3.LightEmission = 1
efec3.Color = ColorSequence.new(Color3.new(1,0.85,0.5))
efec3.Texture = "rbxassetid://02273224484"
efec3.Parent = root
efec3.Rate = 10000
efec3.Drag = 5
efec3.LockedToPart = false
efec3.Lifetime = NumberRange.new(2)
efec3.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,5,0),NumberSequenceKeypoint.new(0.5,10,0),NumberSequenceKeypoint.new(0.8,15,0),NumberSequenceKeypoint.new(1,0,0)})
efec3.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,1,0),NumberSequenceKeypoint.new(0.5,0,0),NumberSequenceKeypoint.new(1,1,0)})
efec3.Speed = NumberRange.new(50,1550)
efec3.RotSpeed = NumberRange.new(-100,100)
for x = 0, 10 do
for i = 0, 1, 0.6 do
swait()
hum.CameraOffset = vt(math.random(-10,10)/30,math.random(-10,10)/30,math.random(-10,10)/30)
sphere2(4,"Add",sorb.CFrame*CFrame.new(0,-1,0)*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(1,1,1),0.1,0.1,0.1,MAINRUINCOLOR)
sphere2(4,"Add",sorb2.CFrame*CFrame.new(0,-1,0)*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(1,1,1),0.1,0.1,0.1,MAINRUINCOLOR)
RH.C0=clerp(RH.C0,cf(1,-1.05,0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(7),math.rad(0),math.rad(-16)),.8)
LH.C0=clerp(LH.C0,cf(-1,-1.05,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(3),math.rad(0),math.rad(10)),.8)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.8)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(-5),math.rad(0),math.rad(0)),.8)
RW.C0=clerp(RW.C0,cf(1.5,0.5,0)*angles(math.rad(-25),math.rad(0),math.rad(97)),.8)
LW.C0=clerp(LW.C0,cf(-1.5,0.5,0)*angles(math.rad(-27),math.rad(0),math.rad(-98)),.8)
end
for i = 0, 1, 0.6 do
swait()
hum.CameraOffset = vt(math.random(-10,10)/30,math.random(-10,10)/30,math.random(-10,10)/30)
sphere2(4,"Add",sorb.CFrame*CFrame.new(0,-1,0)*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(1,1,1),0.1,0.1,0.1,MAINRUINCOLOR)
sphere2(4,"Add",sorb2.CFrame*CFrame.new(0,-1,0)*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(1,1,1),0.1,0.1,0.1,MAINRUINCOLOR)
RH.C0=clerp(RH.C0,cf(1,-1.05,0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(7),math.rad(0),math.rad(-16)),.8)
LH.C0=clerp(LH.C0,cf(-1,-1.05,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(3),math.rad(0),math.rad(10)),.8)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(90)),.8)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(-5),math.rad(0),math.rad(0)),.8)
RW.C0=clerp(RW.C0,cf(1.5,0.5,0)*angles(math.rad(-25),math.rad(0),math.rad(97)),.8)
LW.C0=clerp(LW.C0,cf(-1.5,0.5,0)*angles(math.rad(-27),math.rad(0),math.rad(-98)),.8)
end
for i = 0, 1, 0.6 do
swait()
hum.CameraOffset = vt(math.random(-10,10)/30,math.random(-10,10)/30,math.random(-10,10)/30)
sphere2(4,"Add",sorb.CFrame*CFrame.new(0,-1,0)*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(1,1,1),0.1,0.1,0.1,MAINRUINCOLOR)
sphere2(4,"Add",sorb2.CFrame*CFrame.new(0,-1,0)*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(1,1,1),0.1,0.1,0.1,MAINRUINCOLOR)
RH.C0=clerp(RH.C0,cf(1,-1.05,0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(7),math.rad(0),math.rad(-16)),.8)
LH.C0=clerp(LH.C0,cf(-1,-1.05,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(3),math.rad(0),math.rad(10)),.8)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(180)),.8)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(-5),math.rad(0),math.rad(0)),.8)
RW.C0=clerp(RW.C0,cf(1.5,0.5,0)*angles(math.rad(-25),math.rad(0),math.rad(97)),.8)
LW.C0=clerp(LW.C0,cf(-1.5,0.5,0)*angles(math.rad(-27),math.rad(0),math.rad(-98)),.8)
end
for i = 0, 1, 0.6 do
swait()
hum.CameraOffset = vt(math.random(-10,10)/30,math.random(-10,10)/30,math.random(-10,10)/30)
sphere2(4,"Add",sorb.CFrame*CFrame.new(0,-1,0)*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(1,1,1),0.1,0.1,0.1,MAINRUINCOLOR)
sphere2(4,"Add",sorb2.CFrame*CFrame.new(0,-1,0)*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(1,1,1),0.1,0.1,0.1,MAINRUINCOLOR)
RH.C0=clerp(RH.C0,cf(1,-1.05,0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(7),math.rad(0),math.rad(-16)),.8)
LH.C0=clerp(LH.C0,cf(-1,-1.05,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(3),math.rad(0),math.rad(10)),.8)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(270)),.8)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(-5),math.rad(0),math.rad(0)),.8)
RW.C0=clerp(RW.C0,cf(1.5,0.5,0)*angles(math.rad(-25),math.rad(0),math.rad(97)),.8)
LW.C0=clerp(LW.C0,cf(-1.5,0.5,0)*angles(math.rad(-27),math.rad(0),math.rad(-98)),.8)
end
end
local absval = 0
CFuncs["Sound"].Create("rbxassetid://1368583274", char, 7.5, 0.25)
CFuncs["LongSound"].Create("rbxassetid://1368583274", char, 7.5, 0.5)
for i = 0, 40, 0.1 do
swait()
hum.CameraOffset = vt(math.random(-20,20)/10*absval/2,math.random(-20,20)/10*absval/2,math.random(-20,20)/10*absval/2)
absval = absval + 0.01
slash(math.random(50,100)/10,2,true,"Round","Add","Out",root.CFrame*CFrame.Angles(math.rad(math.random(-5,5)),math.rad(math.random(-360,360)),math.rad(math.random(-5,5))),vt(absval*2,0.01,absval*2),math.random(10,100)/1000,BrickColor.new("Bright orange"))
slash(math.random(10,100)/10,2,true,"Round","Add","Out",root.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(absval/3,0.01,absval/3),math.random(50,100)/100,BrickColor.new("Deep orange"))
for i = 0, 1 do
sphere2(4,"Add",root.CFrame*CFrame.new(math.random(-absval*200,absval*200),math.random(-25,25),math.random(-absval*200,absval*200)),vt(1,1,1),0.35,0.35,0.35,MAINRUINCOLOR)
end
sphere2(4,"Add",root.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(1,1,1),absval,absval,absval,MAINRUINCOLOR)
sphere2(4,"Add",root.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(15,5,15),-0.15,absval*5,-0.15,MAINRUINCOLOR)
RH.C0=clerp(RH.C0,cf(1,-0.05,-0.75)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-2.5),math.rad(0),math.rad(-30)),.1)
LH.C0=clerp(LH.C0,cf(-1,-0.5,-0.25)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-2.5),math.rad(0),math.rad(30)),.1)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,1.5 + 0.1 * math.cos(sine / 28))*angles(math.rad(20 - 1 * math.cos(sine / 34)),math.rad(0),math.rad(0)),.1)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(55),math.rad(0),math.rad(0)),.1)
RW.C0=clerp(RW.C0,cf(0.75,0.5,-0.25)*angles(math.rad(140),math.rad(0),math.rad(-20 + 2.5 * math.cos(sine / 28))),.1)
LW.C0=clerp(LW.C0,cf(-0.75,0.5,-0.25)*angles(math.rad(140),math.rad(0),math.rad(20 - 2.5 * math.cos(sine / 28))),.1)
end
for i = 0, 25, 0.1 do
swait()
hum.CameraOffset = vt(math.random(-20,20)/10*absval/2,math.random(-20,20)/10*absval/2,math.random(-20,20)/10*absval/2)
slash(math.random(50,100)/10,2,true,"Round","Add","Out",root.CFrame*CFrame.Angles(math.rad(math.random(-5,5)),math.rad(math.random(-360,360)),math.rad(math.random(-5,5))),vt(absval*2,0.01,absval*2),math.random(10,100)/1000,BrickColor.new("Bright orange"))
slash(math.random(10,100)/10,2,true,"Round","Add","Out",root.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(absval/3,0.01,absval/3),math.random(50,100)/100,BrickColor.new("Deep orange"))
for i = 0, 1 do
sphere2(4,"Add",root.CFrame*CFrame.new(math.random(-absval*200,absval*200),math.random(-25,25),math.random(-absval*200,absval*200)),vt(1,1,1),0.35,0.35,0.35,MAINRUINCOLOR)
end
sphere2(4,"Add",root.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(1,1,1),absval,absval,absval,MAINRUINCOLOR)
sphere2(4,"Add",root.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(15,5,15),-0.15,absval*5,-0.15,MAINRUINCOLOR)
RH.C0=clerp(RH.C0,cf(1,-0.05,-0.75)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-2.5),math.rad(0),math.rad(-30)),.1)
LH.C0=clerp(LH.C0,cf(-1,-0.5,-0.25)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-2.5),math.rad(0),math.rad(30)),.1)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,1.5 + 0.1 * math.cos(sine / 28))*angles(math.rad(20 - 1 * math.cos(sine / 34)),math.rad(0),math.rad(0)),.1)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(55),math.rad(0),math.rad(0)),.1)
RW.C0=clerp(RW.C0,cf(0.75,0.5,-0.25)*angles(math.rad(140),math.rad(0),math.rad(-20 + 2.5 * math.cos(sine / 28))),.1)
LW.C0=clerp(LW.C0,cf(-0.75,0.5,-0.25)*angles(math.rad(140),math.rad(0),math.rad(20 - 2.5 * math.cos(sine / 28))),.1)
end
efec.Enabled = false
efec2.Enabled = false
efec3.Enabled = false
CFuncs["Sound"].Create("rbxassetid://1368637781", char, 5, 0.25)
CFuncs["Sound"].Create("rbxassetid://1368637781", char, 5, 0.5)
CFuncs["Sound"].Create("rbxassetid://1368637781", char, 5, 0.75)
CFuncs["Sound"].Create("rbxassetid://1368637781", char, 7.5, 1)
CFuncs["Sound"].Create("rbxassetid://1368605755", char, 7.5, 1)
CFuncs["Sound"].Create("rbxassetid://763718160", char, 10, 0.5)
CFuncs["Sound"].Create("rbxassetid://763718160", char, 10, 0.25)
CFuncs["Sound"].Create("rbxassetid://782353443", char, 10, 1)
CFuncs["Sound"].Create("rbxassetid://782353443", char, 10, 0.75)
CFuncs["LongSound"].Create("rbxassetid://782353443", char, 10, 0.5)
CFuncs["LongSound"].Create("rbxassetid://782353443", char, 10, 0.25)
for i = 0, 2 do
CFuncs["Sound"].Create("rbxassetid://763717897", char, 10, 0.5)
CFuncs["Sound"].Create("rbxassetid://1664711478", char, 10, 1)
end
for i = 0, 99 do
local dis = CreateParta(char,1,1,"Neon",MAINRUINCOLOR)
dis.CFrame = root.CFrame*CFrame.new(math.random(-5,5),math.random(-5,5),math.random(-5,5))*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360)))
local at1 = Instance.new("Attachment",dis)
at1.Position = vt(-25000,0,0)
local at2 = Instance.new("Attachment",dis)
at2.Position = vt(25000,0,0)
local trl = Instance.new('Trail',dis)
trl.Attachment0 = at1
trl.FaceCamera = true
trl.Attachment1 = at2
trl.Texture = "rbxassetid://01049219073"
trl.LightEmission = 1
trl.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0),NumberSequenceKeypoint.new(1, 1)})
trl.Color = ColorSequence.new(MAINRUINCOLOR.Color)
trl.Lifetime = 5
local bv = Instance.new("BodyVelocity")
bv.maxForce = Vector3.new(1e9, 1e9, 1e9)
bv.velocity = dis.CFrame.lookVector*math.random(500,2500)
bv.Parent = dis
game:GetService("Debris"):AddItem(dis, 15)
end
for i = 0, 49 do
sphere2(1,"Add",root.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(10,10,10),-0.1,absval*100,-0.1,MAINRUINCOLOR)
end
for i = 0, 9, 0.1 do
swait()
hum.CameraOffset = vt(math.random(-20,20)/5*absval,math.random(-20,20)/5*absval,math.random(-20,20)/5*absval)
sphere2(9,"Add",root.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(1,1,1),absval+5,absval+5,absval+5,MAINRUINCOLOR)
for i = 0, 4 do
slash(math.random(10,50)/10,5,true,"Round","Add","Out",root.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(absval/2,0.01,absval/2),math.random(50,5000)/100,BrickColor.new("Deep orange"))
end
RH.C0=clerp(RH.C0,cf(1,-0.05,-0.75)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-2.5),math.rad(0),math.rad(-30)),.1)
LH.C0=clerp(LH.C0,cf(-1,-0.5,-0.25)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-2.5),math.rad(0),math.rad(30)),.1)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,1.5 + 0.1 * math.cos(sine / 28))*angles(math.rad(20 - 1 * math.cos(sine / 34)),math.rad(0),math.rad(0)),.1)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(55),math.rad(0),math.rad(0)),.1)
RW.C0=clerp(RW.C0,cf(0.75,0.5,-0.25)*angles(math.rad(140),math.rad(0),math.rad(-20 + 2.5 * math.cos(sine / 28))),.1)
LW.C0=clerp(LW.C0,cf(-0.75,0.5,-0.25)*angles(math.rad(140),math.rad(0),math.rad(20 - 2.5 * math.cos(sine / 28))),.1)
end
hum.CameraOffset = vt(0,0,0)
vel:Destroy()
efec:Destroy()
efec2:Destroy()
efec3:Destroy()
ModeOfGlitch = 5000000000
storehumanoidWS = 200
hum.WalkSpeed = 200
rainbowmode = false
chaosmode = false
RecolorTextAndRename("SOL",Color3.new(1,0.75,0),Color3.new(1,0.35,0),"Antique")
RecolorThing(MAINRUINCOLOR,MAINRUINCOLOR,MAINRUINCOLOR,MAINRUINCOLOR,MAINRUINCOLOR,1,MAINRUINCOLOR,1,MAINRUINCOLOR)
hum.WalkSpeed = 200
attack = false
end


function ascendAzure()
attack = true
hum.WalkSpeed = 0
newThemeCust("rbxassetid://739066292",0,1.01,1.5)
MAINRUINCOLOR = BrickColor.new("Magenta")
local vel = Instance.new("BodyPosition", root)
vel.P = 25000
vel.D = 1000
vel.maxForce = Vector3.new(50000000000, 10e10, 50000000000)
vel.position = root.CFrame.p + vt(0,250,0)
CFuncs["Sound"].Create("rbxassetid://1295446488", char, 1.5, 1)
for i = 0, 49 do
slash(math.random(10,100)/10,3,true,"Round","Add","Out",root.CFrame*CFrame.new(0,-3,0)*CFrame.Angles(math.rad(math.random(-10,10)),math.rad(math.random(-360,360)),math.rad(math.random(-10,10))),vt(0.05,0.01,0.05),math.random(25,500)/250,BrickColor.new("White"))
end
local efec = Instance.new("ParticleEmitter",root)
efec.Texture = "rbxassetid://02109052855"
efec.LightEmission = 1
efec.Color = ColorSequence.new(Color3.new(0.5,0,1))
efec.Rate = 5
efec.Lifetime = NumberRange.new(3)
efec.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,75,0),NumberSequenceKeypoint.new(0.2,60,0),NumberSequenceKeypoint.new(0.6,400,0),NumberSequenceKeypoint.new(0.8,300,0),NumberSequenceKeypoint.new(1,200,0)})
efec.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,1,0),NumberSequenceKeypoint.new(0.1,0.25,0),NumberSequenceKeypoint.new(0.6,0.25,0),NumberSequenceKeypoint.new(1,1,0)})
efec.Drag = 5
efec.LockedToPart = true
efec.Rotation = NumberRange.new(-500,500)
efec.VelocitySpread = 9000
efec.RotSpeed = NumberRange.new(-500,500)
local efec2 = efec:Clone()
efec2.LightEmission = 1
efec2.Texture = "rbxassetid://02092248396"
efec2.Parent = root
efec2.Rate = 10
efec2.Lifetime = NumberRange.new(2)
efec2.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,175,0),NumberSequenceKeypoint.new(0.5,150,0),NumberSequenceKeypoint.new(0.8,500,0),NumberSequenceKeypoint.new(1,1000,0)})
efec2.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,1,0),NumberSequenceKeypoint.new(0.5,0.5,0),NumberSequenceKeypoint.new(1,1,0)})
efec2.Speed = NumberRange.new(0)
efec2.RotSpeed = NumberRange.new(-100,100)
local efec3 = efec:Clone()
efec3.LightEmission = 1
efec3.Color = ColorSequence.new(Color3.new(0.75,0.5,1))
efec3.Texture = "rbxassetid://02273224484"
efec3.Parent = root
efec3.Rate = 10000
efec3.Drag = 5
efec3.LockedToPart = false
efec3.Lifetime = NumberRange.new(2)
efec3.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,5,0),NumberSequenceKeypoint.new(0.5,10,0),NumberSequenceKeypoint.new(0.8,15,0),NumberSequenceKeypoint.new(1,0,0)})
efec3.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,1,0),NumberSequenceKeypoint.new(0.5,0,0),NumberSequenceKeypoint.new(1,1,0)})
efec3.Speed = NumberRange.new(50,1550)
efec3.RotSpeed = NumberRange.new(-100,100)
for i = 0, 4, 0.1 do
swait()
hum.CameraOffset = vt(math.random(-10,10)/30,math.random(-10,10)/30,math.random(-10,10)/30)
RH.C0=clerp(RH.C0,cf(1,-0.35,-0.5)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-1),math.rad(0),math.rad(-25)),.8)
LH.C0=clerp(LH.C0,cf(-1,-0.45,-0.5)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-1),math.rad(0),math.rad(25)),.8)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.8)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(35),math.rad(0),math.rad(0)),.8)
RW.C0=clerp(RW.C0,cf(1.15,0.5,-0.5)*angles(math.rad(90),math.rad(0),math.rad(-57)),.8)
LW.C0=clerp(LW.C0,cf(-1.15,0.5,-0.5)*angles(math.rad(83),math.rad(0),math.rad(58)),.8)
end
local absval = 0
CFuncs["LongSound"].Create("rbxassetid://1368583274", char, 4.5, 0.2)
for i = 0, 50, 0.1 do
swait()
hum.CameraOffset = vt(math.random(-20,20)/10*absval/2,math.random(-20,20)/10*absval/2,math.random(-20,20)/10*absval/2)
absval = absval + 0.005
sphere2(4,"Add",root.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(1,1,1),absval,absval,absval,MAINRUINCOLOR)
RH.C0=clerp(RH.C0,cf(1,-0.35,-0.5)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-1),math.rad(0),math.rad(-35)),.1)
LH.C0=clerp(LH.C0,cf(-1,-0.45,-0.5)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-1),math.rad(0),math.rad(35)),.1)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0)*angles(math.rad(5),math.rad(0),math.rad(0)),.1)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(55),math.rad(0),math.rad(0)),.1)
RW.C0=clerp(RW.C0,cf(1.15,0.5,-0.5)*angles(math.rad(92),math.rad(0),math.rad(-67)),.1)
LW.C0=clerp(LW.C0,cf(-1.15,0.5,-0.5)*angles(math.rad(90),math.rad(0),math.rad(68)),.1)
end
CFuncs["Sound"].Create("rbxassetid://824687369", char, 5, 0.6)
CFuncs["Sound"].Create("rbxassetid://824687369", char, 5, 0.7)
CFuncs["Sound"].Create("rbxassetid://824687369", char, 5, 0.8)
CFuncs["Sound"].Create("rbxassetid://289315275", char, 7.5, 1)
CFuncs["Sound"].Create("rbxassetid://419447292", char, 7, 1)
CFuncs["Sound"].Create("rbxassetid://419447292", char, 6.5, 0.8)
for i = 0, 99 do
local disr = CreateParta(char,1,1,"Neon",MAINRUINCOLOR)
disr.CFrame = root.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360)))
local at1 = Instance.new("Attachment",disr)
at1.Position = vt(-10,0,0)
local at2 = Instance.new("Attachment",disr)
at2.Position = vt(10,0,0)
local trl = Instance.new('Trail',disr)
trl.Attachment0 = at1
trl.FaceCamera = true
trl.Attachment1 = at2
trl.Texture = "rbxassetid://02325530138"
trl.LightEmission = 1
trl.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0),NumberSequenceKeypoint.new(1, 1)})
trl.Color = ColorSequence.new(MAINRUINCOLOR.Color)
trl.Lifetime = 0.5
local bv = Instance.new("BodyVelocity")
bv.maxForce = Vector3.new(1e9, 1e9, 1e9)
bv.velocity = disr.CFrame.lookVector*math.random(50,750)
bv.Parent = disr
local val = 0
coroutine.resume(coroutine.create(function()
	swait(math.random(30,60))
	for i = 0, 19 do
		swait()
		val = val + 0.05
		trl.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, val),NumberSequenceKeypoint.new(1, 1)})
	end
game:GetService("Debris"):AddItem(disr, 3)
end))
end
sphere2(4,"Add",root.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(1,1,1),absval*2.5,absval*2.5,absval*2.5,MAINRUINCOLOR)
sphere2(4,"Add",root.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(1,1,1),absval*5,absval*5,absval*5,MAINRUINCOLOR)
for i = 0, 25, 0.1 do
swait()
local disr = CreateParta(char,1,1,"Neon",MAINRUINCOLOR)
disr.CFrame = root.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360)))
local at1 = Instance.new("Attachment",disr)
at1.Position = vt(-10,0,0)
local at2 = Instance.new("Attachment",disr)
at2.Position = vt(10,0,0)
local trl = Instance.new('Trail',disr)
trl.Attachment0 = at1
trl.FaceCamera = true
trl.Attachment1 = at2
trl.Texture = "rbxassetid://02325530138"
trl.LightEmission = 1
trl.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0),NumberSequenceKeypoint.new(1, 1)})
trl.Color = ColorSequence.new(MAINRUINCOLOR.Color)
trl.Lifetime = 0.5
local bv = Instance.new("BodyVelocity")
bv.maxForce = Vector3.new(1e9, 1e9, 1e9)
bv.velocity = disr.CFrame.lookVector*math.random(50,750)
bv.Parent = disr
local val = 0
coroutine.resume(coroutine.create(function()
	swait(30)
	for i = 0, 9 do
		swait()
		val = val + 0.1
		trl.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, val),NumberSequenceKeypoint.new(1, 1)})
	end
game:GetService("Debris"):AddItem(disr, 3)
end))
hum.CameraOffset = vt(math.random(-20,20)/10*absval/2,math.random(-20,20)/10*absval/2,math.random(-20,20)/10*absval/2)
sphere2(4,"Add",root.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(1,1,1),absval,absval,absval,MAINRUINCOLOR)
sphere2(4,"Add",root.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(15,5,15),-0.15,absval*5,-0.15,MAINRUINCOLOR)
RH.C0=clerp(RH.C0,cf(1,-0.35,-0.5)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-1),math.rad(0),math.rad(-35)),.1)
LH.C0=clerp(LH.C0,cf(-1,-0.45,-0.5)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-1),math.rad(0),math.rad(35)),.1)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0)*angles(math.rad(5),math.rad(0),math.rad(0)),.1)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(55),math.rad(0),math.rad(0)),.1)
RW.C0=clerp(RW.C0,cf(1.15,0.5,-0.5)*angles(math.rad(92),math.rad(0),math.rad(-67)),.1)
LW.C0=clerp(LW.C0,cf(-1.15,0.5,-0.5)*angles(math.rad(90),math.rad(0),math.rad(68)),.1)
end
efec.Enabled = false
efec2.Enabled = false
efec3.Enabled = false
CFuncs["Sound"].Create("rbxassetid://1368605755", char, 7.5, 1)
CFuncs["Sound"].Create("rbxassetid://763718160", char, 10, 0.5)
CFuncs["Sound"].Create("rbxassetid://763718160", char, 10, 0.25)
CFuncs["Sound"].Create("rbxassetid://782353443", char, 10, 1)
CFuncs["Sound"].Create("rbxassetid://782353443", char, 10, 0.75)
CFuncs["LongSound"].Create("rbxassetid://782353443", char, 10, 0.5)
CFuncs["LongSound"].Create("rbxassetid://782353443", char, 10, 0.25)
CFuncs["Sound"].Create("rbxassetid://1664711478", char, 10, 1)
for i = 0, 2 do
CFuncs["Sound"].Create("rbxassetid://824687369", char, 10, 1)
CFuncs["Sound"].Create("rbxassetid://824687369", char, 10, 0.75)
end
for i = 0, 99 do
local dis = CreateParta(char,1,1,"Neon",MAINRUINCOLOR)
dis.CFrame = root.CFrame*CFrame.new(math.random(-5,5),math.random(-5,5),math.random(-5,5))*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360)))
local at1 = Instance.new("Attachment",dis)
at1.Position = vt(-25000,0,0)
local at2 = Instance.new("Attachment",dis)
at2.Position = vt(25000,0,0)
local trl = Instance.new('Trail',dis)
trl.Attachment0 = at1
trl.FaceCamera = true
trl.Attachment1 = at2
trl.Texture = "rbxassetid://01049219073"
trl.LightEmission = 1
trl.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0),NumberSequenceKeypoint.new(1, 1)})
trl.Color = ColorSequence.new(MAINRUINCOLOR.Color)
trl.Lifetime = 5
local bv = Instance.new("BodyVelocity")
bv.maxForce = Vector3.new(1e9, 1e9, 1e9)
bv.velocity = dis.CFrame.lookVector*math.random(500,2500)
bv.Parent = dis
game:GetService("Debris"):AddItem(dis, 10)
end
for i = 0, 49 do
sphere2(1,"Add",root.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(10,10,10),0.1,absval*100,0.1,BrickColor.new("Royal purple"))
end
for i = 0, 3, 0.1 do
swait()
hum.CameraOffset = vt(math.random(-20,20)/5*absval,math.random(-20,20)/5*absval,math.random(-20,20)/5*absval)
sphere2(9,"Add",root.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(1,1,1),absval+5,absval+5,absval+5,BrickColor.new("Royal purple"))
for i = 0, 4 do
slash(math.random(10,50)/10,5,true,"Round","Add","Out",root.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(absval/2,0.01,absval/2),math.random(50,5000)/100,BrickColor.new("Really black"))
end
RH.C0=clerp(RH.C0,cf(1,-0.05,-0.75)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-2.5),math.rad(0),math.rad(-30)),.1)
LH.C0=clerp(LH.C0,cf(-1,-0.5,-0.25)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-2.5),math.rad(0),math.rad(30)),.1)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,1.5 + 0.1 * math.cos(sine / 28))*angles(math.rad(20 - 1 * math.cos(sine / 34)),math.rad(0),math.rad(0)),.1)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(55),math.rad(0),math.rad(0)),.1)
RW.C0=clerp(RW.C0,cf(0.75,0.5,-0.25)*angles(math.rad(140),math.rad(0),math.rad(-20 + 2.5 * math.cos(sine / 28))),.1)
LW.C0=clerp(LW.C0,cf(-0.75,0.5,-0.25)*angles(math.rad(140),math.rad(0),math.rad(20 - 2.5 * math.cos(sine / 28))),.1)
end
hum.CameraOffset = vt(0,0,0)
vel:Destroy()
efec:Destroy()
efec2:Destroy()
efec3:Destroy()
hum.WalkSpeed = 200
ModeOfGlitch = 2000000000
storehumanoidWS = 200
hum.WalkSpeed = 200
rainbowmode = false
chaosmode = false
RecolorTextAndRename("AZURE X",BrickColor.new("Dark indigo").Color,BrickColor.new("Magenta").Color,"Antique")
RecolorThing(MAINRUINCOLOR,BrickColor.new("Dark indigo"),MAINRUINCOLOR,MAINRUINCOLOR,MAINRUINCOLOR,1,MAINRUINCOLOR,1,MAINRUINCOLOR)
attack = false
end
-------------------------------------

Humanoid.Animator.Parent = nil

Character.Animate:Destroy()

-------------------------------------

local attacktype = 1
mouse.Button1Down:connect(function()
  if attack == false and attacktype == 1 then
    attacktype = 2
    attackone()
  elseif attack == false and attacktype == 2 then
    attacktype = 3
    attacktwo()
  elseif attack == false and attacktype == 3 then
    attacktype = 1
    attackthree()
  elseif attack == false and attacktype == 4 then
    attacktype = 1
    --attackfour()
  end
end)

local OVMID = 1554894079
local OVMPIT = 1
local OVMVOL = 1
mouse.KeyDown:connect(function(k)
if k == "q" and attack == false and ModeOfGlitch ~= 1 then
--resetmode()
ModeOfGlitch = 1
storehumanoidWS = 16
hum.WalkSpeed = 16
hum.JumpPower = 50
rainbowmode = false
chaosmode = false
RecolorTextAndRename("Enlightened",Color3.new(1,1,1),Color3.new(0.75,0.75,0.75),"Code")
newTheme("rbxassetid://603567552",0,1.02,1.25)
MAINRUINCOLOR = BrickColor.new("White")
RecolorThing(MAINRUINCOLOR,MAINRUINCOLOR,MAINRUINCOLOR,MAINRUINCOLOR,MAINRUINCOLOR,1,MAINRUINCOLOR,1,MAINRUINCOLOR)
end
if k == "e" and attack == false and ModeOfGlitch ~= 2 then
                 ModeOfGlitch = 2
storehumanoidWS = 16
hum.WalkSpeed = 16
rainbowmode = false
chaosmode = false
RecolorTextAndRename("Azure",Color3.new(0,0,0),BrickColor.new("Bright violet").Color,"Code")
newTheme("rbxassetid://2027652726",0,1.01,1.25)
MAINRUINCOLOR = BrickColor.new("Bright violet")
RecolorThing(MAINRUINCOLOR,MAINRUINCOLOR,MAINRUINCOLOR,MAINRUINCOLOR,MAINRUINCOLOR,1,MAINRUINCOLOR,1,MAINRUINCOLOR)
end
if k == "r" and attack == false and ModeOfGlitch ~= 3 then
                 ModeOfGlitch = 3
storehumanoidWS = 16
hum.WalkSpeed = 16
rainbowmode = false
chaosmode = false
RecolorTextAndRename("BINARY",Color3.new(0,0,0),Color3.new(0,1,0),"SciFi")
newTheme("rbxassetid://2041343402",0,1.01,1.25)
MAINRUINCOLOR = BrickColor.new("Lime green")
RecolorThing(MAINRUINCOLOR,MAINRUINCOLOR,MAINRUINCOLOR,MAINRUINCOLOR,MAINRUINCOLOR,1,MAINRUINCOLOR,1,MAINRUINCOLOR)
end
if k == "t" and attack == false and ModeOfGlitch ~= 4 then
                 ModeOfGlitch = 4
storehumanoidWS = 16
hum.WalkSpeed = 16
rainbowmode = false
chaosmode = false
RecolorTextAndRename("Luna",Color3.new(0,0,0.25),BrickColor.new("Bright yellow").Color,"SourceSansBold")
newTheme("rbxassetid://2022787645",0,1.02,1.25)
MAINRUINCOLOR = BrickColor.new("Navy blue")
RecolorThing(MAINRUINCOLOR,BrickColor.new("Bright yellow"),MAINRUINCOLOR,MAINRUINCOLOR,MAINRUINCOLOR,1,MAINRUINCOLOR,1,MAINRUINCOLOR)
end
if k == "y" and attack == false and ModeOfGlitch ~= 5 then
                 ModeOfGlitch = 5
storehumanoidWS = 16
hum.WalkSpeed = 16
rainbowmode = false
chaosmode = false
RecolorTextAndRename("Blaze",Color3.new(1,0.5,0),Color3.new(1,1,0),"Fantasy")
newTheme("rbxassetid://318890513",0,1.01,1.25)
MAINRUINCOLOR = BrickColor.new("Deep orange")
RecolorThing(MAINRUINCOLOR,MAINRUINCOLOR,MAINRUINCOLOR,MAINRUINCOLOR,MAINRUINCOLOR,1,MAINRUINCOLOR,1,MAINRUINCOLOR)
end
if k == "u" and attack == false and ModeOfGlitch ~= 6 then
                 ModeOfGlitch = 6
storehumanoidWS = 100
hum.WalkSpeed = 100
rainbowmode = false
chaosmode = false
RecolorTextAndRename("GALACTIC",Color3.new(0,0,0.5),Color3.new(0.75,1,1),"Fantasy")
newTheme("rbxassetid://604910909",0,1.02,1.25)
MAINRUINCOLOR = BrickColor.new("Pastel light blue")
RecolorThing(MAINRUINCOLOR,MAINRUINCOLOR,MAINRUINCOLOR,MAINRUINCOLOR,MAINRUINCOLOR,1,MAINRUINCOLOR,1,MAINRUINCOLOR)
end
if k == "f" and attack == false and ModeOfGlitch ~= 7 then
                 ModeOfGlitch = 7
storehumanoidWS = 175
hum.WalkSpeed = 175
rainbowmode = false
chaosmode = false
RecolorTextAndRename("HYPERSPEED",BrickColor.new("Cyan").Color,BrickColor.new("Toothpaste").Color,"Arcade")
newTheme("rbxassetid://2011847746",0,1.01,1.25)
MAINRUINCOLOR = BrickColor.new("Cyan")
RecolorThing(MAINRUINCOLOR,MAINRUINCOLOR,MAINRUINCOLOR,MAINRUINCOLOR,MAINRUINCOLOR,1,MAINRUINCOLOR,1,MAINRUINCOLOR)
end
if k == "g" and attack == false and ModeOfGlitch ~= 8 then
                 ModeOfGlitch = 8
storehumanoidWS = 100
hum.WalkSpeed = 100
rainbowmode = false
chaosmode = false
RecolorTextAndRename("CHAOTIC",BrickColor.new("Really red").Color,BrickColor.new("Bright red").Color,"Antique")
newTheme("rbxassetid://603566564",0,1.01,1.65)
MAINRUINCOLOR = BrickColor.new("Really red")
RecolorThing(MAINRUINCOLOR,MAINRUINCOLOR,MAINRUINCOLOR,MAINRUINCOLOR,MAINRUINCOLOR,1,MAINRUINCOLOR,1,MAINRUINCOLOR)
end
if k == "h" and attack == false and ModeOfGlitch ~= 9 then
                 ModeOfGlitch = 9
storehumanoidWS = 135
hum.WalkSpeed = 135
rainbowmode = false
chaosmode = false
RecolorTextAndRename("Visualiser",BrickColor.new("Medium stone grey").Color,BrickColor.new("Black").Color,"Arcade")
newTheme("rbxassetid://"..OVMID,0,OVMPIT,OVMVOL)
MAINRUINCOLOR = BrickColor.new("Medium stone grey")
RecolorThing(MAINRUINCOLOR,MAINRUINCOLOR,MAINRUINCOLOR,MAINRUINCOLOR,MAINRUINCOLOR,1,MAINRUINCOLOR,1,MAINRUINCOLOR)
end
if k == "m" and attack == false and ModeOfGlitch == 1 and ModeOfGlitch ~= 1000000000 and plr.Name == "kevin150700" then
                 ModeOfGlitch = 1000000000
storehumanoidWS = 350
hum.WalkSpeed = 350
rainbowmode = false
chaosmode = false
RecolorTextAndRename("DARKNESS",Color3.new(0,0,0),BrickColor.new("Really black").Color,"Antique")
newTheme("rbxassetid://577543579",0,1,1.25)
MAINRUINCOLOR = BrickColor.new("Really black")
RecolorThing(MAINRUINCOLOR,MAINRUINCOLOR,MAINRUINCOLOR,MAINRUINCOLOR,MAINRUINCOLOR,1,MAINRUINCOLOR,1,MAINRUINCOLOR)
end
if k == "j" and attack == false and ModeOfGlitch ~= 9600000000 and plr.Name == "kevin150700" then
loveydovey()
end
if k == "m" and attack == false and ModeOfGlitch == 6 and ModeOfGlitch ~= 6000000000 and plr.Name == "kevin150700" then
UnknownA()
elseif k == "m" and attack == false and ModeOfGlitch == 5 and ModeOfGlitch ~= 5000000000 and plr.Name == "kevin150700" then
SolarSystem()
elseif k == "m" and attack == false and ModeOfGlitch == 2 and ModeOfGlitch ~= 2000000000 and plr.Name == "kevin150700" then
ascendAzure()
end
if k == "b" and ModeOfGlitch == 6000000000 and attack == false then
harmonytaunty()
elseif k == "b" and ModeOfGlitch == 9 and attack == false then
vistaunty()
elseif k == "b" and ModeOfGlitch == 9600000000 and attack == false then
shytaunty()
end
if k == "z" and ModeOfGlitch == 1 and attack == false then
Beams()
elseif k == "z" and ModeOfGlitch == 2 and attack == false  then
smiter()
elseif k == "z" and ModeOfGlitch == 2000000000 and attack == false  then
supsmiter()
elseif k == "z" and ModeOfGlitch == 3 and attack == false  then
BinaryE()
elseif k == "z" and ModeOfGlitch == 4 and attack == false  then
elseif k == "z" and ModeOfGlitch == 5 and attack == false  then
Crossfire()
elseif k == "z" and ModeOfGlitch == 6 and attack == false  then
GalacticalBeams()
elseif k == "z" and ModeOfGlitch == 7 and attack == false  then
WarpedDash()
elseif k == "z" and ModeOfGlitch == 8 and attack == false  then
elseif k == "z" and ModeOfGlitch == 9 and attack == false  then
end
if k == "x" and ModeOfGlitch == 3 and attack == false  then
BinaryBLINK()
end
if k == "v" and ModeOfGlitch == 2 and attack == false  then
SingularityVoid()
elseif k == "v" and ModeOfGlitch == 8 and attack == false then
BeamOfDeath()
elseif k == "v" and ModeOfGlitch == 2000000000 and attack == false then
AzureVANISHMENT()
end
if k == "l" and mutedtog == false then
mutedtog = true
kan.Volume = 0
elseif k == "l" and mutedtog == true then
mutedtog = false
kan.Volume = 1.25
end
if k == "p" and toggleTag == false then
toggleTag = true
modet.TextTransparency = 11
modet.TextStrokeTransparency = 11
elseif k == "p" and toggleTag == true then
toggleTag = false
modet.TextTransparency = 11
modet.TextStrokeTransparency = 11
end
end)

local sunval = 0.01
coroutine.resume(coroutine.create(function()
while true do
for i = 0, 199 do
swait()
sunval = sunval + 0.00005
end
for i = 0, 199 do
swait()
sunval = sunval - 0.00005
end
end
end))
plr.Chatted:connect(function(message)
if ModeOfGlitch == 9 then
if message:sub(1,5) == "play/" then
OVMID = message:sub(6)
newThemeCust("rbxassetid://"..OVMID,0,OVMPIT,OVMVOL)
elseif message:sub(1,6) == "pitch/" then
OVMPIT = message:sub(7)
newTheme("rbxassetid://"..OVMID,0,OVMPIT,OVMVOL)
elseif message:sub(1,4) == "vol/" then
OVMVOL = message:sub(5)
newTheme("rbxassetid://"..OVMID,0,OVMPIT,OVMVOL)
elseif message:sub(1,7) == "skipto/" then
chatfunc("Skipped to "..message:sub(8).." out of "..math.floor(kan.TimeLength).." seconds.",MAINRUINCOLOR.Color,"Inverted","Arcade",1)
newThemeCust("rbxassetid://"..OVMID,message:sub(8),OVMPIT,OVMVOL)
elseif message:sub(1,9) == "telltime/" then
chatfunc("Current time pos: "..math.floor(kan.TimePosition).." out of "..math.floor(kan.TimeLength).." seconds.",MAINRUINCOLOR.Color,"Inverted","Arcade",1)
end
end
end)
local rotperm = 0
coroutine.resume(coroutine.create(function()
while true do
swait()
if ModeOfGlitch == 1 or ModeOfGlitch == 2 or ModeOfGlitch == 3 or ModeOfGlitch == 4 or ModeOfGlitch == 5 or ModeOfGlitch == 6 or ModeOfGlitch == 7 or ModeOfGlitch == 8 or ModeOfGlitch == 1000000000 or ModeOfGlitch == 5000000000 or ModeOfGlitch == 2000000000 or ModeOfGlitch == 6000000000 or ModeOfGlitch == 9600000000 then
sphereMK(7.5,math.random(15,50)/45,"Add",root.CFrame*CFrame.new(math.random(-25,25),-10,math.random(-25,25))*CFrame.Angles(math.rad(90 + math.random(-20,20)),math.rad(math.random(-20,20)),math.rad(math.random(-20,20))),0.75,0.75,10,-0.0075,MAINRUINCOLOR,0)
coroutine.resume(coroutine.create(function()
if ModeOfGlitch == 5000000000 then
sphere2(25,"Add",sorb2.CFrame*CFrame.new(0,-1,0)*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(1,1,1),sunval,sunval,sunval,MAINRUINCOLOR)
end
end))
elseif ModeOfGlitch == 9 and kan.PlaybackLoudness >= 50 then
swait(25 - kan.PlaybackLoudness/80)
sphere2(4,"Add",root.CFrame*CFrame.new(0,-3,0),vt(1,1,1),0.25,0,0.25,MAINRUINCOLOR)
if kan.PlaybackLoudness >= 300 then
CameraEnshaking(1,3)
for i = 0, 4 do
sphereMK(5,math.random(15,35)/150,"Add",root.CFrame*CFrame.new(math.random(-15,15),-10,math.random(-15,15))*CFrame.Angles(math.rad(90 + math.random(-10,10)),math.rad(math.random(-10,10)),math.rad(math.random(-10,10))),1,1,20,-0.01,MAINRUINCOLOR,0)
end
sphere2(5,"Add",root.CFrame*CFrame.new(0,-3,0),vt(1,1,1),0.5,0,0.5,MAINRUINCOLOR)
end
local notsp = Instance.new("Part", char)
notsp.CanCollide = false
notsp.FormFactor = 3
notsp.Name = "Ring"
notsp.Material = "Neon"
notsp.Size = Vector3.new(10, 1, 10)
if kan.PlaybackLoudness >= 300 then
notsp.Size = Vector3.new(25, 1, 25)
end
notsp.Transparency = 11
notsp.TopSurface = 0
notsp.BottomSurface = 0
notsp.Anchored = true
notsp.CFrame = root.CFrame*CFrame.new(0,-3,0)
coroutine.resume(coroutine.create(function()
local eff = Instance.new("ParticleEmitter",notsp)
eff.Texture = "rbxassetid://0288898235"
eff.LightEmission = 0.5
eff.Color = ColorSequence.new(Color3.new(kan.PlaybackLoudness/1000,kan.PlaybackLoudness/1000,kan.PlaybackLoudness/1000))
eff.Rate = 300
eff.Lifetime = NumberRange.new(1)
eff.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,1,0),NumberSequenceKeypoint.new(0.5,0.5,0),NumberSequenceKeypoint.new(1,0,0)})
eff.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(0.8,0.5,0),NumberSequenceKeypoint.new(1,1,0)})
eff.Speed = NumberRange.new(20,40)
eff.Acceleration = vt(0,-75,0)
eff.Drag = 1
eff.Rotation = NumberRange.new(-10,10)
eff.VelocitySpread = 20
eff.RotSpeed = NumberRange.new(-1,1)
coroutine.resume(coroutine.create(function()
while true do
swait()
if eff.Parent ~= nil then
if ModeOfGlitch == 9 then
eff.Color = ColorSequence.new(Color3.new(kan.PlaybackLoudness/1000,kan.PlaybackLoudness/1000,kan.PlaybackLoudness/1000))
elseif ModeOfGlitch ~= 9 then
eff.Color = ColorSequence.new(MAINRUINCOLOR.Color)
end
else
break
end
end
end))
wait(0.1)
eff.Enabled = false
end))
game:GetService("Debris"):AddItem(notsp, 5)
end
end
end))

Humanoid.Name = "GGLITCHER"
Humanoid.MaxHealth = math.huge
Humanoid.Health = math.huge
Instance.new("ForceField",char).Visible = false

idleanim=.4
while true do
Humanoid.MaxHealth = math.huge
Humanoid.Health = math.huge
if mutedtog == false and duringend == false then
kan.Volume = currentVol
elseif mutedtog == true and duringend == false then
kan.Volume = 0
end
if duringend == false then
kan.PlaybackSpeed = currentPitch
kan.Pitch = currentPitch
end
kan.SoundId = currentThemePlaying
kan.Looped = true
kan.Parent = tors
kan:Resume()
modet.Rotation = - 5 * math.cos(sine / 32)
techc.Rotation = techc.Rotation + 1
circl.Rotation = circl.Rotation - kan.PlaybackLoudness/75 - 1
circl2.Rotation = circl2.Rotation + kan.PlaybackLoudness/50 + 1
imgl2.Rotation = imgl2.Rotation - kan.PlaybackLoudness/50
imgl2b.Rotation = imgl2b.Rotation + kan.PlaybackLoudness/25
imgca.ImageTransparency = 11 + 0.25 * math.cos(sine / 30)
imgca.Rotation = imgca.Rotation + kan.PlaybackLoudness/50 + 1
bguis.Size = UDim2.new(15 + 1 * math.cos(sine / 30),0, 15 + 1 * math.cos(sine / 30),0)
ned.Rotation = 0 - 2 * math.cos(sine / 24)
ned.Position = UDim2.new(0.7,0 - 10 * math.cos(sine / 32),0.8,0 - 10 * math.cos(sine / 45))

swait()
if Anim ~= "Run" then
handlexweld.C0=clerp(handlexweld.C0,cf(0 + 0.25 * math.cos(sine / 63),0 + 0.25 * math.cos(sine / 70),0 + 0.05 * math.cos(sine / 57))*angles(math.rad(0 + 2 * math.cos(sine / 55)),math.rad(0 + 2 * math.cos(sine / 46)),math.rad(0 + 2 * math.cos(sine / 32))),.3)
lwing1weld.C1=clerp(lwing1weld.C1,cf(0,1.85 + 0.15 * math.cos(sine / 36),0)*angles(math.rad(0 + 3 * math.cos(sine / 42)),math.rad(0 - 2 * math.cos(sine / 36)),math.rad(90 + 5 * math.cos(sine / 56))),.3)
lwing2weld.C1=clerp(lwing2weld.C1,cf(0,1.85 + 0.15 * math.cos(sine / 38),0)*angles(math.rad(0 + 3 * math.cos(sine / 45)),math.rad(0 - 2 * math.cos(sine / 37)),math.rad(130 + 5 * math.cos(sine / 56))),.3)
lwing3weld.C1=clerp(lwing3weld.C1,cf(0,1.85 + 0.15 * math.cos(sine / 41),0)*angles(math.rad(0 + 3 * math.cos(sine / 48)),math.rad(0 - 2 * math.cos(sine / 51)),math.rad(50 + 5 * math.cos(sine / 56))),.3)
rwing1weld.C1=clerp(rwing1weld.C1,cf(0,1.85 + 0.15 * math.cos(sine / 36),0)*angles(math.rad(0 + 3 * math.cos(sine / 46)),math.rad(0 - 2 * math.cos(sine / 36)),math.rad(-90 - 5 * math.cos(sine / 56))),.3)
rwing2weld.C1=clerp(rwing2weld.C1,cf(0,1.85 + 0.15 * math.cos(sine / 38),0)*angles(math.rad(0 + 3 * math.cos(sine / 50)),math.rad(0 - 2 * math.cos(sine / 37)),math.rad(-130 - 5 * math.cos(sine / 56))),.3)
rwing3weld.C1=clerp(rwing3weld.C1,cf(0,1.85 + 0.15 * math.cos(sine / 41),0)*angles(math.rad(0 + 3 * math.cos(sine / 40)),math.rad(0 - 2 * math.cos(sine / 51)),math.rad(-50 - 5 * math.cos(sine / 56))),.3)
else
handlexweld.C0=clerp(handlexweld.C0,cf(0 + 0.25 * math.cos(sine / 63),0 + 0.25 * math.cos(sine / 70),0.5 + 0.05 * math.cos(sine / 57))*angles(math.rad(0 + 2 * math.cos(sine / 55)),math.rad(0 + 2 * math.cos(sine / 46)),math.rad(0 + 2 * math.cos(sine / 32))),.3)
lwing1weld.C1=clerp(lwing1weld.C1,cf(0,1.85 + 0.15 * math.cos(sine / 25),0)*angles(math.rad(20),math.rad(0),math.rad(90 - root.RotVelocity.Y*3)),.3)
lwing2weld.C1=clerp(lwing2weld.C1,cf(0,1.85 + 0.15 * math.cos(sine / 25),0)*angles(math.rad(20),math.rad(0),math.rad(145 - root.RotVelocity.Y*3)),.3)
lwing3weld.C1=clerp(lwing3weld.C1,cf(0,1.85 + 0.15 * math.cos(sine / 25),0)*angles(math.rad(20),math.rad(0),math.rad(35 - root.RotVelocity.Y*3)),.3)
rwing1weld.C1=clerp(rwing1weld.C1,cf(0,1.85 + 0.15 * math.cos(sine / 25),0)*angles(math.rad(20),math.rad(0),math.rad(-90 - root.RotVelocity.Y*3)),.3)
rwing2weld.C1=clerp(rwing2weld.C1,cf(0,1.85 + 0.15 * math.cos(sine / 25),0)*angles(math.rad(20),math.rad(0),math.rad(-145 - root.RotVelocity.Y*3)),.3)
rwing3weld.C1=clerp(rwing3weld.C1,cf(0,1.85 + 0.15 * math.cos(sine / 25),0)*angles(math.rad(20),math.rad(0),math.rad(-35 - root.RotVelocity.Y*3)),.3)
end
--------------- Visualiser Zone
if ModeOfGlitch == 9 then
modet.TextColor3 = Color3.new(kan.PlaybackLoudness/1000,kan.PlaybackLoudness/1000,kan.PlaybackLoudness/1000)
for i, v in pairs(mw2:GetChildren()) do
if v:IsA("Part") then
v.Color = Color3.new(kan.PlaybackLoudness/1000,kan.PlaybackLoudness/1000,kan.PlaybackLoudness/1000)
v.Material = "Neon"
end
end
for i, v in pairs(mw1:GetChildren()) do
if v:IsA("Part") then
v.Transparency = 11
v.Color = Color3.new(kan.PlaybackLoudness/1000,kan.PlaybackLoudness/1000,kan.PlaybackLoudness/1000)
v.Material = "Neon"
end
end
end
---------------
  sine = sine + change
local torvel=(RootPart.Velocity*Vector3.new(1,0,1)).magnitude 
local velderp=RootPart.Velocity.y
hitfloor,posfloor=rayCast(RootPart.Position,(CFrame.new(RootPart.Position,RootPart.Position - Vector3.new(0,1,0))).lookVector,4,Character)
coroutine.resume(coroutine.create(function()
if ModeOfGlitch == 6 or ModeOfGlitch == 8 or ModeOfGlitch == 6000000000 or ModeOfGlitch == 2000000000 or ModeOfGlitch == 1000000000 or ModeOfGlitch == 5000000000 then
if hitfloor ~= nil then
if ModeOfGlitch ~= 1000000000 and ModeOfGlitch ~= 5000000000 then
slash(math.random(50,100)/10,5,true,"Round","Add","Out",root.CFrame*CFrame.new(0,-3,0)*CFrame.Angles(math.rad(math.random(-5,5)),math.rad(math.random(-360,360)),math.rad(math.random(-5,5))),vt(0.01,0.01,0.01),math.random(5,50)/250,BrickColor.new("White"))
elseif ModeOfGlitch == 1000000000 then
slash(math.random(25,100)/10,5,true,"Round","Add","Out",root.CFrame*CFrame.new(0,-3,0)*CFrame.Angles(math.rad(math.random(-5,5)),math.rad(math.random(-360,360)),math.rad(math.random(-5,5))),vt(0.01,0.01,0.01),math.random(5,85)/250,BrickColor.new("Really black"))
elseif ModeOfGlitch == 5000000000 then
slash(math.random(25,100)/10,5,true,"Round","Add","Out",root.CFrame*CFrame.new(0,-3,0)*CFrame.Angles(math.rad(math.random(-3,3)),math.rad(math.random(-360,360)),math.rad(math.random(-3,3))),vt(0.01,0.01,0.01),math.random(15,125)/250,BrickColor.new("Deep orange"))
end
end
end
end))
if equipped==true or equipped==false then
if attack==false then
idle=idle+1
else
idle=0
end
if idle>=500 then
if attack==false then
--Sheath()
end
end
if RootPart.Velocity.y > 1 and hitfloor==nil then 
Anim="Jump"
if attack==false then
RH.C0=clerp(RH.C0,cf(1,-0.35 - 0.05 * math.cos(sine / 25),-0.75)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-5),math.rad(0),math.rad(-20)),.1)
LH.C0=clerp(LH.C0,cf(-1,-1 - 0.05 * math.cos(sine / 25),0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-5),math.rad(0),math.rad(20)),.1)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0 + 0.05 * math.cos(sine / 25))*angles(math.rad(-tors.Velocity.Y/6),math.rad(0),math.rad(0)),.1)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(-2.5),math.rad(0),math.rad(0)),.1)
RW.C0=clerp(RW.C0,cf(1.45,0.5 + 0.1 * math.cos(sine / 25),0)*angles(math.rad(-5),math.rad(0),math.rad(25)),.1)
LW.C0=clerp(LW.C0,cf(-1.45,0.5 + 0.1 * math.cos(sine / 25),0)*angles(math.rad(-5),math.rad(0),math.rad(-25)),.1)
end
elseif RootPart.Velocity.y < -1 and hitfloor==nil then 
Anim="Fall"
if attack==false then
RH.C0=clerp(RH.C0,cf(1,-0.35 - 0.05 * math.cos(sine / 25),-0.75)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-5),math.rad(0),math.rad(-20)),.1)
LH.C0=clerp(LH.C0,cf(-1,-1 - 0.05 * math.cos(sine / 25),0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-5),math.rad(0),math.rad(20)),.1)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0 + 0.05 * math.cos(sine / 25))*angles(math.rad(-tors.Velocity.Y/6),math.rad(0),math.rad(0)),.1)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(2.5),math.rad(0),math.rad(0)),.1)
RW.C0=clerp(RW.C0,cf(1.45,0.5 + 0.1 * math.cos(sine / 25),0)*angles(math.rad(-15),math.rad(0),math.rad(55)),.1)
LW.C0=clerp(LW.C0,cf(-1.45,0.5 + 0.1 * math.cos(sine / 25),0)*angles(math.rad(-15),math.rad(0),math.rad(-55)),.1)
end
elseif torvel<1 and hitfloor~=nil then
Anim="Idle"
if attack==false then
if ModeOfGlitch == 1 then
RH.C0=clerp(RH.C0,cf(1,-1 - 0.05 * math.cos(sine / 28),0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-2.5),math.rad(-10 + 2 * math.cos(sine / 43)),math.rad(0 - 2 * math.cos(sine / 34))),.1)
LH.C0=clerp(LH.C0,cf(-1,-1 - 0.05 * math.cos(sine / 28),0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-1.5),math.rad(0),math.rad(0 + 2 * math.cos(sine / 34))),.1)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0 + 0.02 * math.cos(sine / 34),0 + 0.05 * math.cos(sine / 28))*angles(math.rad(0 - 2 * math.cos(sine / 34)),math.rad(0),math.rad(10 - 2 * math.cos(sine / 43))),.1)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(5 - 2.5 * math.cos(sine / 28)),math.rad(0 - 2 * math.cos(sine / 47)),math.rad(-10 + 2 * math.cos(sine / 43))),.1)
RW.C0=clerp(RW.C0,cf(1.5,0.5 + 0.1 * math.cos(sine / 28),0)*angles(math.rad(10 + 3 * math.cos(sine / 48)),math.rad(-20 - 4 * math.cos(sine / 53)),math.rad(15 - 3 * math.cos(sine / 38))),.1)
LW.C0=clerp(LW.C0,cf(-1.5,0.5 + 0.1 * math.cos(sine / 28),0)*angles(math.rad(-10 + 2 * math.cos(sine / 45)),math.rad(0),math.rad(-20 + 2 * math.cos(sine / 39))),.1)
elseif ModeOfGlitch == 2 then
RH.C0=clerp(RH.C0,cf(1,-1 - 0.05 * math.cos(sine / 28) - 0.03 * math.cos(sine / 45),0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-7.5 + 3 * math.cos(sine / 45)),math.rad(0),math.rad(0 - 2 * math.cos(sine / 34))),.1)
LH.C0=clerp(LH.C0,cf(-1,-1 - 0.05 * math.cos(sine / 28) + 0.03 * math.cos(sine / 45),0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-2.5 - 3 * math.cos(sine / 45)),math.rad(5),math.rad(0 + 2 * math.cos(sine / 34))),.1)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0 + 0.03 * math.cos(sine / 45),0 + 0.02 * math.cos(sine / 34),0 + 0.05 * math.cos(sine / 28))*angles(math.rad(0 - 2 * math.cos(sine / 34)),math.rad(0 + 3 * math.cos(sine / 45)),math.rad(0)),.1)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(20 - 2.5 * math.cos(sine / 28)),math.rad(0 + 5 * math.cos(sine / 99)),math.rad(0 + 10 * math.cos(sine / 78))),.1)
RW.C0=clerp(RW.C0,cf(1.5,0.5 + 0.01 * math.cos(sine / 28),0)*angles(math.rad(15 + 5 * math.cos(sine / 33)),math.rad(15 + 6 * math.cos(sine / 38)),math.rad(-10 - 3 * math.cos(sine / 42))),.1)
LW.C0=clerp(LW.C0,cf(-0.85,0.5 + 0.05 * math.cos(sine / 28),-0.65)*angles(math.rad(40 - 3 * math.cos(sine / 34)),math.rad(0),math.rad(90 + 5 * math.cos(sine / 28))),.1)
elseif ModeOfGlitch == 3 then
RH.C0=clerp(RH.C0,cf(1,-1 - 0.05 * math.cos(sine / 28),0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-2.5),math.rad(0),math.rad(-5 - 2 * math.cos(sine / 34))),.1)
LH.C0=clerp(LH.C0,cf(-1,-1 - 0.05 * math.cos(sine / 28),0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-1.5),math.rad(20 - 2 * math.cos(sine / 72)),math.rad(0 + 2 * math.cos(sine / 34))),.1)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0 + 0.02 * math.cos(sine / 34),0 + 0.05 * math.cos(sine / 28))*angles(math.rad(0 - 2 * math.cos(sine / 34)),math.rad(0),math.rad(-20 + 2 * math.cos(sine / 72))),.1)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(5 - 2.5 * math.cos(sine / 28)),math.rad(0 + 4 * math.cos(sine / 55)),math.rad(20 - 2 * math.cos(sine / 72))),.1)
RW.C0=clerp(RW.C0,cf(1.15,0.5 + 0.1 * math.cos(sine / 28),0.25)*angles(math.rad(-22 + 2 * math.cos(sine / 38)),math.rad(0),math.rad(-15 - 2 * math.cos(sine / 41))),.1)
LW.C0=clerp(LW.C0,cf(-1.5,0.5 + 0.1 * math.cos(sine / 28),0)*angles(math.rad(10 - 6 * math.cos(sine / 28)),math.rad(0 + 5 * math.cos(sine / 46)),math.rad(-20 + 5 * math.cos(sine / 34))),.1)
elseif ModeOfGlitch == 4 then
RH.C0=clerp(RH.C0,cf(1,-1 - 0.05 * math.cos(sine / 28),0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-2.5),math.rad(-5),math.rad(0 - 3 * math.cos(sine / 34))),.1)
LH.C0=clerp(LH.C0,cf(-1,-1 - 0.05 * math.cos(sine / 28),0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-1.5),math.rad(0),math.rad(10 + 3 * math.cos(sine / 34))),.1)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0 + 0.03 * math.cos(sine / 34),0 + 0.05 * math.cos(sine / 28))*angles(math.rad(0 - 3 * math.cos(sine / 34)),math.rad(0),math.rad(25)),.1)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(10 - 2.5 * math.cos(sine / 28)),math.rad(0 + 2 * math.cos(sine / 57)),math.rad(-25)),.1)
RW.C0=clerp(RW.C0,cf(1.5,0.5 + 0.1 * math.cos(sine / 28),0)*angles(math.rad(10 + 5 * math.cos(sine / 34)),math.rad(0),math.rad(21 + 6 * math.cos(sine / 28))),.1)
LW.C0=clerp(LW.C0,cf(-1.5,0.5 + 0.1 * math.cos(sine / 28),0)*angles(math.rad(-5 + 5 * math.cos(sine / 43)),math.rad(10 - 5 * math.cos(sine / 27)),math.rad(-5 - 3 * math.cos(sine / 36))),.1)
elseif ModeOfGlitch == 5 then
RH.C0=clerp(RH.C0,cf(1,-1 - 0.05 * math.cos(sine / 28) - 0.04 * math.cos(sine / 50),0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-1 + 4 * math.cos(sine / 50)),math.rad(0),math.rad(0 - 2 * math.cos(sine / 34))),.1)
LH.C0=clerp(LH.C0,cf(-1,-1 - 0.05 * math.cos(sine / 28) + 0.04 * math.cos(sine / 50),0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-1.5 - 4 * math.cos(sine / 50)),math.rad(18),math.rad(0 + 2 * math.cos(sine / 34))),.1)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0 + 0.04 * math.cos(sine / 50),0 + 0.03 * math.cos(sine / 34),0 + 0.05 * math.cos(sine / 28))*angles(math.rad(0 - 3 * math.cos(sine / 34)),math.rad(0 + 4 * math.cos(sine / 50)),math.rad(-18)),.1)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(10 - 1 * math.cos(sine / 28)),math.rad(-5 - 2.5 * math.cos(sine / 57)),math.rad(18)),.1)
RW.C0=clerp(RW.C0,cf(0.85,0.5 + 0.05 * math.cos(sine / 28),-0.65)*angles(math.rad(36 - 3 * math.cos(sine / 34)),math.rad(0 - 2 * math.cos(sine / 45)),math.rad(-80 + 2 * math.cos(sine / 28))),.1)
LW.C0=clerp(LW.C0,cf(-0.85,0.5 + 0.05 * math.cos(sine / 28),-0.65)*angles(math.rad(46 + 3 * math.cos(sine / 49)),math.rad(10 + 2 * math.cos(sine / 52)),math.rad(80 - 3 * math.cos(sine / 39))),.1)
elseif ModeOfGlitch == 6 then
RH.C0=clerp(RH.C0,cf(1,-0.5,-0.6)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(2),math.rad(0),math.rad(-10 + 4 * math.cos(sine / 34))),.1)
LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(1.5),math.rad(0),math.rad(5 + 2 * math.cos(sine / 34))),.1)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,1 + 0.1 * math.cos(sine / 28))*angles(math.rad(0 - 2 * math.cos(sine / 34)),math.rad(0),math.rad(-5 - 2 * math.cos(sine / 53))),.1)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(10 - 1 * math.cos(sine / 28)),math.rad(2 + 3 * math.cos(sine / 41)),math.rad(5 + 2 * math.cos(sine / 53))),.1)
RW.C0=clerp(RW.C0,cf(1.5,0.5 + 0.05 * math.cos(sine / 28),0)*angles(math.rad(-2 - 4 * math.cos(sine / 28)),math.rad(0),math.rad(14 + 8 * math.cos(sine / 28))),.1)
LW.C0=clerp(LW.C0,cf(-1.5,0.5 + 0.1 * math.cos(sine / 28),0)*angles(math.rad(5 + 3 * math.cos(sine / 46)),math.rad(10 + 5 * math.cos(sine / 52)),math.rad(-15 - 6 * math.cos(sine / 28))),.1)
elseif ModeOfGlitch == 7 then
RH.C0=clerp(RH.C0,cf(1,-1 - 0.05 * math.cos(sine / 28),0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-2.5),math.rad(1),math.rad(0 - 1 * math.cos(sine / 34))),.1)
LH.C0=clerp(LH.C0,cf(-1,-1 - 0.05 * math.cos(sine / 28),0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-2.5),math.rad(5),math.rad(0 + 1 * math.cos(sine / 34))),.1)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0 + 0.01 * math.cos(sine / 34),0 + 0.05 * math.cos(sine / 28))*angles(math.rad(0 - 1 * math.cos(sine / 34)),math.rad(0),math.rad(0)),.1)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(10 - 2.5 * math.cos(sine / 28)),math.rad(0 + 1 * math.cos(sine / 71)),math.rad(0)),.1)
RW.C0=clerp(RW.C0,cf(1.5,0.5 + 0.02 * math.cos(sine / 28),0)*angles(math.rad(4 - 4 * math.cos(sine / 28)),math.rad(-8),math.rad(10 - 5 * math.cos(sine / 34))),.1)
LW.C0=clerp(LW.C0,cf(-1.5,0.5 + 0.02 * math.cos(sine / 28),0)*angles(math.rad(5),math.rad(5),math.rad(5)),.1)
elseif ModeOfGlitch == 8 or ModeOfGlitch == 1000000000 then
RH.C0=clerp(RH.C0,cf(1,-0.5,-0.6)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(1),math.rad(0),math.rad(-10 + 5 * math.cos(sine / 34))),.1)
LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(1.25),math.rad(0),math.rad(6 + 2 * math.cos(sine / 34))),.1)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,1 + 0.1 * math.cos(sine / 28))*angles(math.rad(0 - 2 * math.cos(sine / 34)),math.rad(0),math.rad(-26 + 2 * math.cos(sine / 44))),.1)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(20 - 1 * math.cos(sine / 28)),math.rad(-5 + 3 * math.cos(sine / 47)),math.rad(26 - 2 * math.cos(sine / 44))),.1)
RW.C0=clerp(RW.C0,cf(1.5,0.5 + 0.05 * math.cos(sine / 28),0)*angles(math.rad(-2 - 3 * math.cos(sine / 30)),math.rad(25 - 3 * math.cos(sine / 38)),math.rad(28 - 6 * math.cos(sine / 34))),.1)
LW.C0=clerp(LW.C0,cf(-0.95,0.65 + 0.075 * math.cos(sine / 28),-0.65)*angles(math.rad(90 + 2 * math.cos(sine / 73)),math.rad(25 + 5 * math.cos(sine / 24)),math.rad(73 - 3 * math.cos(sine / 65))),.1)
elseif ModeOfGlitch == 9 then
RH.C0=clerp(RH.C0,cf(1,-1 - 0.05 * math.cos(sine / 28) + kan.PlaybackLoudness/5000,-0.1)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-2.5),math.rad(-20),math.rad(0 - 2 * math.cos(sine / 56) + kan.PlaybackLoudness/450)),.4)
LH.C0=clerp(LH.C0,cf(-1,-1 - 0.05 * math.cos(sine / 28) - kan.PlaybackLoudness/6500,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-2.5),math.rad(5),math.rad(0 + 2 * math.cos(sine / 56) + kan.PlaybackLoudness/500)),.4)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0 + 0.02 * math.cos(sine / 56) ,0 + 0.05 * math.cos(sine / 28) + kan.PlaybackLoudness/7000)*angles(math.rad(0 - 2 * math.cos(sine / 56)),math.rad(0),math.rad(30)),.4)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(10 + 2 * math.cos(sine / 28) - kan.PlaybackLoudness/60),math.rad(0 + 2 * math.cos(sine / 73)),math.rad(-30)),.4)
RW.C0=clerp(RW.C0,cf(1.5,0.5 + 0.02 * math.cos(sine / 28),0)*angles(math.rad(40 + 5 * math.cos(sine / 34) + kan.PlaybackLoudness/7.5),math.rad(0),math.rad(28 - 2 * math.cos(sine / 38))),.4)
LW.C0=clerp(LW.C0,cf(-1.5,0.5 + 0.02 * math.cos(sine / 28),0)*angles(math.rad(10),math.rad(5),math.rad(7.5)),.4)
elseif ModeOfGlitch == 2000000000 then
RH.C0=clerp(RH.C0,cf(1,-0.5,-0.6)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-1),math.rad(0),math.rad(-10 + 5 * math.cos(sine / 34))),.1)
LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-1.5),math.rad(0),math.rad(5 + 3 * math.cos(sine / 34))),.1)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,1 + 0.1 * math.cos(sine / 28))*angles(math.rad(2 + 3 * math.cos(sine / 34)),math.rad(0),math.rad(34 - 3 * math.cos(sine / 54))),.1)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(15 - 4 * math.cos(sine / 28)),math.rad(0 - 1 * math.cos(sine / 44)),math.rad(-34 + 3 * math.cos(sine / 54))),.1)
RW.C0=clerp(RW.C0,cf(1.5,0.5 + 0.05 * math.cos(sine / 28),0)*angles(math.rad(12 + 5 * math.cos(sine / 62)),math.rad(30 + 5 * math.cos(sine / 48)),math.rad(19 + 6 * math.cos(sine / 36))),.1)
LW.C0=clerp(LW.C0,cf(-1.5,0.5 + 0.1 * math.cos(sine / 28),0)*angles(math.rad(10 + 3 * math.cos(sine / 65)),math.rad(6 + 3 * math.cos(sine / 57)),math.rad(-20 - 7 * math.cos(sine / 36))),.1)
elseif ModeOfGlitch == 5000000000 then
RH.C0=clerp(RH.C0,cf(1,-0.5,-0.6)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(2),math.rad(0),math.rad(-16 + 4 * math.cos(sine / 34))),.1)
LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(1.5),math.rad(10),math.rad(11 + 2 * math.cos(sine / 34))),.1)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,1 + 0.1 * math.cos(sine / 28))*angles(math.rad(-6 - 3 * math.cos(sine / 34)),math.rad(0),math.rad(-25 - 4 * math.cos(sine / 53))),.1)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(10 - 1 * math.cos(sine / 28)),math.rad(0 + 10 * math.cos(sine / 79)),math.rad(25 + 4 * math.cos(sine / 53))),.1)
RW.C0=clerp(RW.C0,cf(1.5,0.5 + 0.05 * math.cos(sine / 28),0)*angles(math.rad(-2 - 4 * math.cos(sine / 28)),math.rad(-20),math.rad(18 + 8 * math.cos(sine / 28))),.1)
LW.C0=clerp(LW.C0,cf(-1.5,0.5 + 0.1 * math.cos(sine / 28),0)*angles(math.rad(170 + 3 * math.cos(sine / 46)),math.rad(10 + 5 * math.cos(sine / 52)),math.rad(-10 - 2 * math.cos(sine / 28))),.1)
elseif ModeOfGlitch == 6000000000 then
RH.C0=clerp(RH.C0,cf(1,-0.5,-0.6)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(2),math.rad(0),math.rad(-15 + 6 * math.cos(sine / 34))),.1)
LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(1.5),math.rad(0),math.rad(7.5 - 4 * math.cos(sine / 47))),.1)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,1 + 0.1 * math.cos(sine / 28))*angles(math.rad(0 - 3 * math.cos(sine / 34)),math.rad(0),math.rad(-1 + 4 * math.cos(sine / 62))),.1)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(10 - 3 * math.cos(sine / 28)),math.rad(5 - 6 * math.cos(sine / 79)),math.rad(1 - 4 * math.cos(sine / 62))),.1)
RW.C0=clerp(RW.C0,cf(0.85,0.5 + 0.01 * math.cos(sine / 28),-0.65)*angles(math.rad(38 + 2 * math.cos(sine / 33)),math.rad(0),math.rad(-95 - 3 * math.cos(sine / 28))),.1)
LW.C0=clerp(LW.C0,cf(-0.85,0.5 + 0.01 * math.cos(sine / 28),-0.65)*angles(math.rad(45 - 3 * math.cos(sine / 37)),math.rad(0),math.rad(80 + 5 * math.cos(sine / 30))),.1)
elseif ModeOfGlitch == 9600000000 then
RH.C0=clerp(RH.C0,cf(1,-1 - 0.05 * math.cos(sine / 28) + 0.05 * math.cos(sine / 44),0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(7 - 5 * math.cos(sine / 44)),math.rad(0),math.rad(-6 - 3 * math.cos(sine / 34))),.1)
LH.C0=clerp(LH.C0,cf(-1,-1 - 0.05 * math.cos(sine / 28) - 0.05 * math.cos(sine / 44),0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(3 + 5 * math.cos(sine / 44)),math.rad(0),math.rad(0 + 3 * math.cos(sine / 34))),.1)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0 - 0.05 * math.cos(sine / 44),0 + 0.03 * math.cos(sine / 34),-0.05 + 0.05 * math.cos(sine / 28))*angles(math.rad(0 - 3 * math.cos(sine / 34)),math.rad(0 - 5 * math.cos(sine / 44)),math.rad(-5)),.1)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(2.5 - 2.5 * math.cos(sine / 28)),math.rad(10 + 5 * math.cos(sine / 62)),math.rad(17 + 5 * math.cos(sine / 59))),.1)
RW.C0=clerp(RW.C0,cf(1,0.5 + 0.1 * math.cos(sine / 28),-0.45)*angles(math.rad(22 - 3 * math.cos(sine / 53)),math.rad(0),math.rad(-37 + 2 * math.cos(sine / 37))),.1)
LW.C0=clerp(LW.C0,cf(-1,0.5 + 0.1 * math.cos(sine / 28),-0.45)*angles(math.rad(23 - 2 * math.cos(sine / 58)),math.rad(0),math.rad(38 - 3 * math.cos(sine / 57) )),.1)
end
end
elseif torvel>2 and torvel<22 and hitfloor~=nil then
Anim="Walk"
if attack==false then
if ModeOfGlitch ~= 9600000000 then
RH.C0=clerp(RH.C0,cf(1,-1 + 0.05 * math.cos(sine / 4),0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(0),math.rad(0 + 5 * math.cos(sine / 8)),math.rad(0 + 35 * math.cos(sine / 8))),.1)
LH.C0=clerp(LH.C0,cf(-1,-1 + 0.05 * math.cos(sine / 4),0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(0),math.rad(0 + 5 * math.cos(sine / 8)),math.rad(0 + 35 * math.cos(sine / 8))),.1)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,-0.05,-0.05 - 0.05 * math.cos(sine / 4))*angles(math.rad(5 + 3 * math.cos(sine / 4)),math.rad(0 + root.RotVelocity.Y/1.5),math.rad(0 - root.RotVelocity.Y - 5 * math.cos(sine / 8))),.1)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(10 - 3 * math.cos(sine / 4)),math.rad(0 + root.RotVelocity.Y/1.5),math.rad(0 - hed.RotVelocity.Y*1.5 + 5 * math.cos(sine / 8))),.1)
RW.C0=clerp(RW.C0,cf(1.5,0.5,0 + 0.25 * math.cos(sine / 8))*angles(math.rad(0 - 50 * math.cos(sine / 8)),math.rad(0),math.rad(5 - 10 * math.cos(sine / 4))),.1)
LW.C0=clerp(LW.C0,cf(-1.5,0.5,0 - 0.25 * math.cos(sine / 8))*angles(math.rad(0 + 50 * math.cos(sine / 8)),math.rad(0),math.rad(-5 + 10 * math.cos(sine / 4))),.1)
elseif ModeOfGlitch == 9600000000 then
RH.C0=clerp(RH.C0,cf(1,-1 + 0.05 * math.cos(sine / 4),0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(0),math.rad(0 + 10 * math.cos(sine / 8)),math.rad(0 + 65 * math.cos(sine / 8))),.1)
LH.C0=clerp(LH.C0,cf(-1,-1 + 0.05 * math.cos(sine / 4),0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(0),math.rad(0 + 10 * math.cos(sine / 8)),math.rad(0 + 65 * math.cos(sine / 8))),.1)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,-0.1,-0.05 + 0.05 * math.cos(sine / 4))*angles(math.rad(15 - 3 * math.cos(sine / 4)),math.rad(0 + root.RotVelocity.Y/1.5),math.rad(0 - root.RotVelocity.Y - 10 * math.cos(sine / 8))),.1)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(-15 + 3 * math.cos(sine / 4)),math.rad(0 - 10 * math.cos(sine / 8)),math.rad(0 - hed.RotVelocity.Y*2.5 + 10 * math.cos(sine / 8))),.1)
RW.C0=clerp(RW.C0,cf(1.5,0.5,0 + 0.25 * math.cos(sine / 8))*angles(math.rad(0 - 80 * math.cos(sine / 8)),math.rad(0),math.rad(5 - 10 * math.cos(sine / 4))),.1)
LW.C0=clerp(LW.C0,cf(-1.5,0.5,0 - 0.25 * math.cos(sine / 8))*angles(math.rad(0 + 80 * math.cos(sine / 8)),math.rad(0),math.rad(-5 + 10 * math.cos(sine / 4))),.1)
end
end
elseif torvel>=22 and hitfloor~=nil then
Anim="Run"
if attack==false then
if ModeOfGlitch ~= 6 and ModeOfGlitch ~= 8 and ModeOfGlitch ~= 1000000000 and ModeOfGlitch ~= 2000000000 and ModeOfGlitch ~= 6000000000 and ModeOfGlitch ~= 5000000000 then
RH.C0=clerp(RH.C0,cf(1,-1 - 0.15 * math.cos(sine / 3),0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(0),math.rad(0),math.rad(0 + 95 * math.cos(sine / 6))),.1)
LH.C0=clerp(LH.C0,cf(-1,-1 - 0.15 * math.cos(sine / 3),0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(0),math.rad(0),math.rad(0 + 95 * math.cos(sine / 6))),.1)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,-0.3,-0.05 + 0.15 * math.cos(sine / 3))*angles(math.rad(25 - 4 * math.cos(sine / 3)),math.rad(0 + root.RotVelocity.Y*1.5),math.rad(0 - root.RotVelocity.Y - 1 * math.cos(sine / 6))),.1)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(-6 + 2 * math.cos(sine / 3)),math.rad(0 + root.RotVelocity.Y*1.5),math.rad(0 - hed.RotVelocity.Y*1.5 + 1 * math.cos(sine / 6))),.1)
RW.C0=clerp(RW.C0,cf(1.5,0.5,0.3)*angles(math.rad(-50 + 10 * math.cos(sine / 3)),math.rad(-10),math.rad(7 + 5 * math.cos(sine / 6))),.1)
LW.C0=clerp(LW.C0,cf(-1.5,0.5,0.3)*angles(math.rad(-50 + 10 * math.cos(sine / 3)),math.rad(10),math.rad(-7 - 5 * math.cos(sine / 6))),.1)
if ModeOfGlitch == 7 or ModeOfGlitch == 9600000000 then
sphereMK(2,-0.5,"Add",root.CFrame*CFrame.new(math.random(-5,5),math.random(-5,5),8)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),0.5,0.5,20,-0.0075,MAINRUINCOLOR,0)
--sphereMK(3,0,"Add",root.CFrame*CFrame.new(0,0,8)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),0.5,5,20,-0.0075,MAINRUINCOLOR,0)
end
elseif ModeOfGlitch == 6 or ModeOfGlitch == 8 or ModeOfGlitch == 1000000000 or ModeOfGlitch == 2000000000 or ModeOfGlitch == 6000000000 or ModeOfGlitch == 5000000000 then
RH.C0=clerp(RH.C0,cf(1,-0.5,-0.6)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(1.5),math.rad(0),math.rad(-20 - 5 * math.cos(sine / 34))),.2)
LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(1),math.rad(0),math.rad(20 + 2 * math.cos(sine / 38))),.2)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0 - 0.15 * math.cos(sine / 47),-0.5,0.5 + 0.1 * math.cos(sine / 28))*angles(math.rad(70),math.rad(0 - root.RotVelocity.Y),math.rad(0 - root.RotVelocity.Y *4.5 + 3 * math.cos(sine / 47))),.2)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(-17 - 5 * math.cos(sine / 52)),math.rad(0 - 3 * math.cos(sine / 37)),math.rad(0 + 2 * math.cos(sine / 78))),.2)
RW.C0=clerp(RW.C0,cf(1.5,0.5 + 0.05 * math.cos(sine / 28),0)*angles(math.rad(-8 - 4 * math.cos(sine / 59)),math.rad(-20 + 7 * math.cos(sine / 62)),math.rad(20 + 5 * math.cos(sine / 50))),.2)
LW.C0=clerp(LW.C0,cf(-1.5,0.5 + 0.1 * math.cos(sine / 28),0)*angles(math.rad(-8 - 3 * math.cos(sine / 55)),math.rad(20 + 8 * math.cos(sine / 67)),math.rad(-20 - 4 * math.cos(sine / 29))),.2)
end
end
end
end
end