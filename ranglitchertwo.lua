game:GetService("Players").LocalPlayer.Character["MeshPartAccessory"].Name = "SwordOne"
game:GetService("Players").LocalPlayer.Character["MeshPartAccessory"].Name = "SwordTwo"
game:GetService("Players").LocalPlayer.Character["MeshPartAccessory"].Name = "SwordThree"
game:GetService("Players").LocalPlayer.Character["MeshPartAccessory"].Name = "SwordFour"

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
Player = plr
char = plr.Character
-- mouse = plr:GetMouse()
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
CF = CFrame.new
Cos = math.cos
Sin = math.sin
Abs = math.abs
Rad = math.rad
local Player_Size = 1
function shakes(power,length)
	for i,v in pairs(game:GetService("Players"):GetChildren()) do
	local var = script.Shaker:Clone()
	var.Parent = v.PlayerGui
	local pw = var.Shakeval
	local lgth = var.MultLength
	pw.Value = power
	lgth.Value = length
	var.Disabled = false
	end
end

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
CPart.Transparency = 1

local rainbowmode = false
local chaosmode = false

local kan = Instance.new("Sound",char)
kan.Volume = 1.25
kan.TimePosition = 0
kan.PlaybackSpeed = 1
kan.Pitch = 1
kan.SoundId = "rbxassetid://1751171913"
kan.Name = "wrecked"
kan.Looped = true
kan:Play()

local currentThemePlaying = kan.SoundId
local currentPitch = kan.Pitch
local currentVol = kan.Volume
function newTheme(ID,timepos,pitch,vol)
local kanz = kan
--kanz:Stop()
kanz.Volume = vol
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
kanz.Volume = vol
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
modet.TextTransparency = 0
modet.BackgroundTransparency = 1 
modet.TextTransparency = 0
modet.TextStrokeTransparency = 0
modet.Font = "Antique"
modet.TextStrokeColor3 = Color3.new(1,0,0)
modet.TextColor3 = Color3.new(0,0,1)
modet.Text = "DESCLERATION"


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
tecks2.BackgroundTransparency = 1
tecks2.BorderSizePixel = 0
tecks2.Text = ""
tecks2.Font = font
tecks2.TextSize = 30
tecks2.TextStrokeTransparency = 0
tecks2.TextColor3 = color
tecks2.TextStrokeColor3 = Color3.new(0,0,0)
tecks2.Size = UDim2.new(1,0,0.5,0)
local tecks3 = Instance.new("TextLabel",naeeym2)
tecks3.BackgroundTransparency = 1
tecks3.BorderSizePixel = 0
tecks3.Text = ""
tecks3.Font = font
tecks3.TextSize = 30
tecks3.TextStrokeTransparency = 0
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
modet.TextTransparency = 1
modet.TextStrokeTransparency = 1
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
modet.TextTransparency = 0
modet.TextStrokeTransparency = 0
if toggleTag == false then
modet.TextTransparency = 1
modet.TextStrokeTransparency = 1
end
naeeym2:Destroy()
end)
chat()
end

function bosschatfunc(text,color,watval)
for i,v in pairs(game:GetService("Players"):GetPlayers()) do
coroutine.resume(coroutine.create(function()
if v.PlayerGui:FindFirstChild("Dialog")~= nil then
v.PlayerGui:FindFirstChild("Dialog"):destroy()
end
local scrg = Instance.new("ScreenGui",v.PlayerGui)
CFuncs["EchoSound"].Create("rbxassetid://525200869", scrg, 0.5, 1,0,10,0.1,0.25,1)
scrg.Name = "Dialog"
local txtlb = Instance.new("TextLabel",scrg)
txtlb.Text = ""
txtlb.Font = "Bodoni"
txtlb.TextColor3 = Color3.new(0,0,0)
txtlb.TextStrokeTransparency = 0
txtlb.BackgroundTransparency = 0.75
txtlb.BackgroundColor3 = Color3.new(0,0,0)
txtlb.TextStrokeColor3 = color
txtlb.TextScaled = true
txtlb.Size = UDim2.new(1,0,0.25,0)
txtlb.TextXAlignment = "Left"
txtlb.Position = UDim2.new(0,0,0.75 + 1,0)
local txtlb2 = Instance.new("TextLabel",scrg)
txtlb2.Text = "???:"
txtlb2.Font = "Arcade"
txtlb2.TextColor3 = Color3.new(0,0,0)
txtlb2.TextStrokeTransparency = 0
txtlb2.BackgroundTransparency = 1
txtlb2.TextStrokeColor3 = color
txtlb2.TextSize = 40
txtlb2.Size = UDim2.new(1,0,0.25,0)
txtlb2.TextXAlignment = "Left"
txtlb2.Position = UDim2.new(0,0,1,0)
local fvalen = 0.55
local fval = -0.49
coroutine.resume(coroutine.create(function()
while true do
swait()
if chaosmode == true then
txtlb.Rotation = math.random(-1,1)
txtlb2.Rotation = math.random(-1,1)
txtlb.Position = txtlb.Position + UDim2.new(0,math.random(-1,1)/5,0,math.random(-1,1)/5)
txtlb2.Position = txtlb2.Position + UDim2.new(0,math.random(-1,1)/5,0,math.random(-1,1)/5)
txtlb.TextStrokeColor3 = BrickColor.random().Color
txtlb2.TextStrokeColor3 = BrickColor.random().Color
end
end
end))
coroutine.resume(coroutine.create(function()
while true do
swait()
if scrg.Parent ~= nil then
	fvalen = fvalen - 0.0001
elseif scrg.Parent == nil then
break
end
end
end))
local flol = 1.75
local flil = 1.6
coroutine.resume(coroutine.create(function()
	for i = 0, 9 do
		swait()
		fval = fval + 0.05
		flol = flol - 0.1
		flil = flil - 0.1
		txtlb.Text = ""
		txtlb.Position = UDim2.new(0,0,flol,0)
		txtlb2.Position = UDim2.new(0,0,flil,0)
	end
	txtlb.Text = text
wait(watval)
local valinc = 0
for i = 0, 99 do
swait()
valinc = valinc + 0.0001
flol = flol + valinc
flil = flil + valinc
txtlb.Rotation = txtlb.Rotation + valinc*20
txtlb2.Rotation = txtlb2.Rotation - valinc*50
txtlb.Position = UDim2.new(0,0,flol,0)
txtlb2.Position = UDim2.new(0,0,flil,0)
txtlb.TextStrokeTransparency = txtlb.TextStrokeTransparency + 0.01
txtlb.TextTransparency = txtlb.TextTransparency + 0.01
txtlb2.TextStrokeTransparency = txtlb2.TextStrokeTransparency + 0.01
txtlb2.TextTransparency = txtlb2.TextTransparency + 0.01
txtlb.BackgroundTransparency = txtlb.BackgroundTransparency + 0.0025
end
scrg:Destroy()
end))
end))
end
end




CFuncs = {	
	["Part"] = {
		Create = function(Parent, Material, Reflectance, Transparency, BColor, Name, Size)
			local Part = Create("Part"){
				Parent = Parent,
				Reflectance = Reflectance,
				Transparency = Transparency+1,
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

	["TimeSound"] = {
		Create = function(id, par, vol, pit, timepos) 
			coroutine.resume(coroutine.create(function()
				local S = Create("Sound"){
					Volume = vol,
                                        Name = "EffectSoundo",
					Pitch = pit or 1,
					SoundId = id,
                                        TimePosition = timepos,
					Parent = par or workspace,
				}
				wait() 
				S:play() 
				game:GetService("Debris"):AddItem(S, 10)
			end))
		end;
	};
		["EchoSound"] = {
		Create = function(id, par, vol, pit, timepos,delays,echodelay,fedb,dryl) 
			coroutine.resume(coroutine.create(function()
				local Sas = Create("Sound"){
					Volume = vol,
                    Name = "EffectSoundo",
					Pitch = pit or 1,
					SoundId = id,
                    TimePosition = timepos,
					Parent = par or workspace,
				}
				local E = Create("EchoSoundEffect"){
					Delay = echodelay,
                    Name = "Echo",
					Feedback = fedb,
                    DryLevel = dryl,
					Parent = Sas,
				}
				wait() 
				Sas:play() 
				game:GetService("Debris"):AddItem(Sas, delays)
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
				Transparency = Transparency+1,
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
  gui.TextStrokeTransparency = 0
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
fullscreenz.BackgroundTransparency = 1
fullscreenz.BorderColor3 = Color3.new(17, 17, 17)
fullscreenz.Size = UDim2.new(1, 0, 1, 0)
fullscreenz.Position = UDim2.new(0, 0, 0, 0)
local imgl2 = Instance.new("ImageLabel",fullscreenz)
imgl2.BackgroundTransparency = 1
imgl2.BorderSizePixel = 0
imgl2.ImageTransparency = 1
imgl2.ImageColor3 = Color3.new(1,0,0)
imgl2.Position = UDim2.new(0.75,-100,0.55,-100)
imgl2.Size = UDim2.new(0,800,0,800)
imgl2.Image = "rbxassetid://2312119891"
local circl = imgl2:Clone()
circl.Parent = fullscreenz
circl.ImageTransparency = 0
circl.Size = UDim2.new(0,550,0,550)
circl.Position = UDim2.new(0.75,25,0.55,25)
circl.ImageColor3 = Color3.new(0,0,0)
circl.Image = "rbxassetid://2109045978"
local circl2 = imgl2:Clone()
circl2.Parent = fullscreenz
circl2.ImageTransparency = 0
circl2.Size = UDim2.new(200,0,200,0)
circl2.Position = UDim2.new(0.75,-50,0.55,-50)
circl2.ImageColor3 = Color3.new(1,0,0)
circl2.Image = "rbxassetid://2312128106"
local imgl2b = imgl2:Clone()
imgl2b.Parent = fullscreenz
imgl2b.ImageTransparency = 0
imgl2b.Size = UDim2.new(0,600,0,600)
imgl2b.Position = UDim2.new(0.75,0,0.55,0)
imgl2b.ImageColor3 = Color3.new(0,0,0)
local techc = imgl2:Clone()
techc.Parent = fullscreenz
techc.ImageTransparency = 0
techc.Size = UDim2.new(0,900,0,900)
techc.Position = UDim2.new(0.75,-150,0.55,-150)
techc.ImageColor3 = Color3.new(1,0,0)
techc.Image = "rbxassetid://2344830904"
local ned = Instance.new("TextLabel",fullscreenz)
ned.ZIndex = 2
ned.Font = "Arcade"
ned.BackgroundTransparency = 1
ned.BorderSizePixel = 0.65
ned.Size = UDim2.new(0.3,0,0.2,0)
ned.Position = UDim2.new(0.7,0,0.8,0)
ned.TextColor3 = BrickColor.new("Really red").Color
ned.TextStrokeColor3 = BrickColor.new("Dark blue").Color
ned.TextScaled = true
ned.TextStrokeTransparency = 0
ned.Text = "DESCLERATION"
ned.TextSize = 24
ned.Rotation = 1
ned.TextXAlignment = "Right"
ned.TextYAlignment = "Bottom"
local wobble = Instance.new("Frame",basgui)
wobble.Name = "Wobble"
wobble.BackgroundTransparency = 0.5
wobble.Size = UDim2.new(1.1,0,1.1,0)
wobble.Position = UDim2.new(-0.08,0,0.943,0)
local wobble2 = Instance.new("Frame",basgui)
wobble2.Name = "Wobble2"
wobble2.BackgroundTransparency = 0.5
wobble2.Size = UDim2.new(1.1,0,0.09,0)
wobble2.Position = UDim2.new(-0.08,0,0.878,0)
local VIS = Instance.new("Frame",basgui)
VIS.Name = "VIS"
VIS.BackgroundTransparency = 0.1
VIS.Size = UDim2.new(0,131,0,131)
VIS.Position = UDim2.new(0.451,0,0.891,0)
VIS.BorderSizePixel = 4
local VIS2 = Instance.new("Frame",basgui)
VIS2.Name = "VIS2"
VIS2.BackgroundTransparency = 0.1
VIS2.Size = UDim2.new(0,70,0,70)
VIS2.Position = UDim2.new(0.473,0,0.939,0)
VIS2.BorderSizePixel = 4
local VISText = Instance.new("TextLabel",basgui)
VISText.Name = "VisText"
VISText.BackgroundTransparency = 1
VISText.Font = "Arcade"
VISText.Text = "Camellia - Distorted Space"
VISText.TextColor3 = BrickColor.new("Really black").Color
VISText.TextStrokeColor3 = BrickColor.new("Really red").Color
VISText.TextStrokeTransparency = 0
VISText.TextScaled = true
VISText.TextSize = 5
VISText.Size = UDim2.new(0,359,0,85)
VISText.Position = UDim2.new(0.352,0,0.861,0) -- {0.362, 0},{0.891, 0}
VISText.TextXAlignment = "Center"

local extrawingmod1 = Instance.new("Model",char)
local extrawingmod2 = Instance.new("Model",char)

function CreateParta(parent,transparency,reflectance,material,brickcolor)
local p = Instance.new("Part")
p.TopSurface = 0
p.BottomSurface = 0
p.Parent = parent
p.Size = Vector3.new(0.1,0.1,0.1)
p.Transparency = transparency+1
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
mesh.TextureId = "http://www.roblox.com/asset/?id=0"
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
-------------- ground effect
local cen = CreateParta(m,1,1,"SmoothPlastic",BrickColor.random())
CreateWeld(cen,root,cen,0,3,0,math.rad(0),math.rad(0),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
local effar = Instance.new("ParticleEmitter",cen)
effar.Texture = "rbxassetid://0"
effar.LightEmission = 0
effar.Color = ColorSequence.new(Color3.new(1,0,0))
effar.Rate = 0
effar.Enabled = false
effar.EmissionDirection = "Front"
effar.Lifetime = NumberRange.new(1)
effar.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,15,0),NumberSequenceKeypoint.new(0.1,5,0),NumberSequenceKeypoint.new(0.8,15,0),NumberSequenceKeypoint.new(1,40,0)})
effar.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,1,0),NumberSequenceKeypoint.new(0.8,0.5,0),NumberSequenceKeypoint.new(1,1,0)})
effar.Speed = NumberRange.new(80,90)
effar.Acceleration = Vector3.new(0,10,0)
effar.Drag = 5
effar.Rotation = NumberRange.new(-500,500)
effar.SpreadAngle = Vector2.new(0,900)
effar.RotSpeed = NumberRange.new(-500,500)

local secondchar = Instance.new("Model",char)
local GhostCol = BrickColor.new("Really red")
local sectors = CreateParta(secondchar,1,1,"Neon",GhostCol)
CreateMesh(sectors,"Brick",2*8,2*8,1*8)
local torsweld = CreateWeld(sectors,root,sectors,1,-1,-2,math.rad(0),math.rad(0),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))

local seclarm = CreateParta(secondchar,1,0,"Neon",GhostCol)
CreateMesh(seclarm,"Brick",1*8,2*8,1*8)
local larmsweld = CreateWeld(seclarm,sectors,seclarm,1.5,0,0,math.rad(0),math.rad(0),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))

local secrarm = CreateParta(secondchar,1,0,"Neon",GhostCol)
CreateMesh(secrarm,"Brick",1*8,2*8,1*8)
local rarmsweld = CreateWeld(secrarm,sectors,secrarm,-1.5,0,0,math.rad(0),math.rad(0),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))

local seclleg = CreateParta(secondchar,1,0,"Neon",GhostCol)
CreateMesh(seclleg,"Brick",1*8,2*8,1*8)
local llegsweld = CreateWeld(seclleg,sectors,seclleg,0.5,2,0,math.rad(0),math.rad(0),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))

local secrleg = CreateParta(secondchar,1,0,"Neon",GhostCol)
CreateMesh(secrleg,"Brick",1*8,2*8,1*8)
local rlegsweld = CreateWeld(secrleg,sectors,secrleg,-0.5,2,0,math.rad(0),math.rad(0),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))

local seched = CreateParta(secondchar,1,0,"Neon",GhostCol)
CreateMesh(seched,"Brick",1*8,1*8,1*8)
local hedsweld = CreateWeld(seched,sectors,seched,0,-1.5,0,math.rad(0),math.rad(0),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))

----
local sorb = CreateParta(m,1,1,"SmoothPlastic",BrickColor.random())
CreateWeld(sorb,rarm,sorb,0,1,0,math.rad(0),math.rad(0),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
local sorb2 = CreateParta(m,1,1,"SmoothPlastic",BrickColor.random())
CreateWeld(sorb2,larm,sorb2,0,1,0,math.rad(0),math.rad(0),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))

local handlex = CreateParta(mw2,1,1,"Neon",maincolor)
CreateMesh(handle,"Brick",0,0,0)
local handlexweld = CreateWeld(handlex,tors,handlex,0,-1.5,-1.05,math.rad(0),math.rad(0),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
local valuaring = 10
for i = 0, 49 do
	valuaring = valuaring + 10
rn = CreateParta(mw2,0,0,"Neon",halocolor)
CreateMesh(rn,"Brick",0.25,0.1,0.1)
CreateWeld(rn,handlex,rn,0,1,0,math.rad(0),math.rad(0),math.rad(valuaring),0,0,0,math.rad(0),math.rad(0),math.rad(0))
end

handlex = CreateParta(mw2,1,1,"Neon",maincolor)
CreateMesh(handle,"Brick",0,0,0)
CreateWeld(handlex,tors,handlex,0,-1.5,-2.1,math.rad(0),math.rad(0),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
local valuaring = 10
for i = 0, 49 do
	valuaring = valuaring + 10
rn = CreateParta(extrawingmod1,1,0,"Neon",halocolor)
CreateMesh(rn,"Brick",0.5,0.2,0.2)
CreateWeld(rn,handlex,rn,0,2,0,math.rad(0),math.rad(0),math.rad(valuaring),0,0,0,math.rad(0),math.rad(0),math.rad(0))
end


local handle = CreateParta(m,1,1,"Neon",maincolor)
CreateMesh(handle,"Brick",0.5,0.5,0.5)
local handleweld = CreateWeld(handle,tors,handle,0,-1.5,-1.05,math.rad(0),math.rad(0),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))

--- Left wing.

local lwing1 = CreateParta(m,1,0,"Neon",maincolor)
CreateMesh(handle,"Brick",1,0.5,0.5)
local lwing1weld = CreateWeld(lwing1,handle,lwing1,3,0,0,math.rad(5),math.rad(0),math.rad(12.5),0,0,0,math.rad(0),math.rad(0),math.rad(0))
local hat = game:GetService("Players").LocalPlayer.Character["SwordOne"]

local function align(part0, part1)

        part0.AccessoryWeld:Destroy()
        local attachment0 = Instance.new("Attachment", part0)
        attachment0.Position = Vector3.new(1, 1, 0) --Custom Positioning Values Here
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
CreateWeld(wed,lwing1,wed,0,0,0.3,math.rad(0),math.rad(90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(mw1,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,0.5)
CreateWeld(wed,lwing1,wed,0,0,0.2,math.rad(0),math.rad(-90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
A0 = Instance.new('Attachment',wed)
A0.Position = vt(0,0.25,0.25)
wed = CreateParta(mw1,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,3)
CreateWeld(wed,lwing1,wed,0,-0.30,1.80,math.rad(0),math.rad(90),math.rad(90),0,0,0,math.rad(0),math.rad(0),math.rad(0))
A1 = Instance.new('Attachment',wed)
A1.Position = vt(0,-0.25,-2)
wed = CreateParta(mw1,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,3,0.5)
CreateWeld(wed,lwing1,wed,0,-1.70,0.20,math.rad(90),math.rad(90),math.rad(90),0,0,0,math.rad(0),math.rad(0),math.rad(0))

tl1 = Instance.new('Trail',wed)
tl1.Attachment0 = A1
tl1.Attachment1 = A0
tl1.Texture = "rbxassetid://02108945559"
tl1.LightEmission = 1
tl1.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0),NumberSequenceKeypoint.new(1, 1)})
tl1.Color = ColorSequence.new(BrickColor.new('Really red').Color)
tl1.Lifetime = 0.6


local lwing2 = CreateParta(m,1,1,"Neon",maincolor)
CreateMesh(handle,"Brick",0.5,0.5,0.5)
local lwing2weld = CreateWeld(lwing2,handle,lwing2,4,1,0,math.rad(10),math.rad(0),math.rad(25),0,0,0,math.rad(0),math.rad(0),math.rad(0))

wed = CreateParta(mw1,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,0.5)
CreateWeld(wed,lwing2,wed,0,0,0.25,math.rad(0),math.rad(90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(mw1,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,0.5)
CreateWeld(wed,lwing2,wed,0,0,0.25,math.rad(0),math.rad(-90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
A0 = Instance.new('Attachment',wed)
A0.Position = vt(0,0.25,0.25)
wed = CreateParta(mw1,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,3)
CreateWeld(wed,lwing2,wed,0,-0.25,1.75,math.rad(0),math.rad(90),math.rad(90),0,0,0,math.rad(0),math.rad(0),math.rad(0))
A1 = Instance.new('Attachment',wed)
A1.Position = vt(0,-0.25,-2)
wed = CreateParta(mw1,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,3,0.5)
CreateWeld(wed,lwing2,wed,0,-1.75,0.25,math.rad(90),math.rad(90),math.rad(90),0,0,0,math.rad(0),math.rad(0),math.rad(0))

tl2 = Instance.new('Trail',wed)
tl2.Attachment0 = A1
tl2.Attachment1 = A0
tl2.Texture = "rbxassetid://02108945559"
tl2.LightEmission = 1
tl2.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0),NumberSequenceKeypoint.new(1, 1)})
tl2.Color = ColorSequence.new(BrickColor.new('Really red').Color)
tl2.Lifetime = 0.6

local lwing3 = CreateParta(m,1,1,"Neon",maincolor)
CreateMesh(handle,"Brick",0.5,0.5,0.5)
local lwing3weld = CreateWeld(lwing3,handle,lwing3,4.75,2,0,math.rad(15),math.rad(0),math.rad(37.5),0,0,0,math.rad(0),math.rad(0),math.rad(0))
local hat = game:GetService("Players").LocalPlayer.Character["SwordTwo"]

local function align(part0, part1)

        part0.AccessoryWeld:Destroy()
        local attachment0 = Instance.new("Attachment", part0)
        attachment0.Position = Vector3.new(1, 1, 0) --Custom Positioning Values Here
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
A0 = Instance.new('Attachment',wed)
A0.Position = vt(0,0.25,0.25)
wed = CreateParta(mw1,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,3)
CreateWeld(wed,lwing3,wed,0,-0.25,1.75,math.rad(0),math.rad(90),math.rad(90),0,0,0,math.rad(0),math.rad(0),math.rad(0))
A1 = Instance.new('Attachment',wed)
A1.Position = vt(0,-0.25,-2)
wed = CreateParta(mw1,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,3,0.5)
CreateWeld(wed,lwing3,wed,0,-1.75,0.25,math.rad(90),math.rad(90),math.rad(90),0,0,0,math.rad(0),math.rad(0),math.rad(0))

tl3 = Instance.new('Trail',wed)
tl3.Attachment0 = A1
tl3.Attachment1 = A0
tl3.Texture = "rbxassetid://02108945559"
tl3.LightEmission = 1
tl3.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0),NumberSequenceKeypoint.new(1, 1)})
tl3.Color = ColorSequence.new(BrickColor.new('Really red').Color)
tl3.Lifetime = 0.6
local lwing4 = CreateParta(m,1,1,"Neon",maincolor)
CreateMesh(handle,"Brick",0.5,0.5,0.5)
local lwing4weld = CreateWeld(lwing4,handle,lwing4,5.75,3,0,math.rad(20),math.rad(0),math.rad(50),0,0,0,math.rad(0),math.rad(0),math.rad(0))

wed = CreateParta(extrawingmod1,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05*2,0.5*2,0.5*2)
CreateWeld(wed,lwing4,wed,0,0,0.25*2,math.rad(0),math.rad(90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(extrawingmod1,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05*2,0.5*2,0.5*2)
CreateWeld(wed,lwing4,wed,0,0,0.25*2,math.rad(0),math.rad(-90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
A0 = Instance.new('Attachment',wed)
A0.Position = vt(0,0.25*2,0.25*2)
wed = CreateParta(extrawingmod1,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05*2,0.5*2,3*2)
CreateWeld(wed,lwing4,wed,0,-0.25*2,1.75*2,math.rad(0),math.rad(90),math.rad(90),0,0,0,math.rad(0),math.rad(0),math.rad(0))
A1 = Instance.new('Attachment',wed)
A1.Position = vt(0,-0.25*2,-2*2)
wed = CreateParta(extrawingmod1,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.0*25,3*2,0.5*2)
CreateWeld(wed,lwing4,wed,0,-1.75*2,0.25*2,math.rad(90),math.rad(90),math.rad(90),0,0,0,math.rad(0),math.rad(0),math.rad(0))

tl4 = Instance.new('Trail',wed)
tl4.Attachment0 = A1
tl4.Attachment1 = A0
tl4.Texture = "rbxassetid://02108945559"
tl4.LightEmission = 1
tl4.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0),NumberSequenceKeypoint.new(1, 1)})
tl4.Color = ColorSequence.new(BrickColor.new('Really red').Color)
tl4.Lifetime = 0.6
local lwing5 = CreateParta(m,1,1,"Neon",maincolor)
CreateMesh(handle,"Brick",0.5,0.5,0.5)
local lwing5weld = CreateWeld(lwing5,handle,lwing5,6.75,4,0,math.rad(25),math.rad(0),math.rad(62.5),0,0,0,math.rad(0),math.rad(0),math.rad(0))

wed = CreateParta(extrawingmod1,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05*2,0.5*2,0.5*2)
CreateWeld(wed,lwing5,wed,0,0,0.25*2,math.rad(0),math.rad(90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(extrawingmod1,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05*2,0.5*2,0.5*2)
CreateWeld(wed,lwing5,wed,0,0,0.25*2,math.rad(0),math.rad(-90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
A0 = Instance.new('Attachment',wed)
A0.Position = vt(0,0.25*2,0.25*2)
wed = CreateParta(extrawingmod1,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05*2,0.5*2,3*2)
CreateWeld(wed,lwing5,wed,0,-0.25*2,1.75*2,math.rad(0),math.rad(90),math.rad(90),0,0,0,math.rad(0),math.rad(0),math.rad(0))
A1 = Instance.new('Attachment',wed)
A1.Position = vt(0,-0.25*2,-2*2)
wed = CreateParta(extrawingmod1,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05*2,3*2,0.5*2)
CreateWeld(wed,lwing5,wed,0,-1.75*2,0.25*2,math.rad(90),math.rad(90),math.rad(90),0,0,0,math.rad(0),math.rad(0),math.rad(0))

tl5 = Instance.new('Trail',wed)
tl5.Attachment0 = A1
tl5.Attachment1 = A0
tl5.Texture = "rbxassetid://02108945559"
tl5.LightEmission = 1
tl5.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0),NumberSequenceKeypoint.new(1, 1)})
tl5.Color = ColorSequence.new(BrickColor.new('Really red').Color)
tl5.Lifetime = 0.6
local lwing6 = CreateParta(m,1,1,"Neon",maincolor)
CreateMesh(handle,"Brick",0.5,0.5,0.5)
local lwing6weld = CreateWeld(lwing6,handle,lwing6,7.75,5,0,math.rad(30),math.rad(0),math.rad(75),0,0,0,math.rad(0),math.rad(0),math.rad(0))

wed = CreateParta(extrawingmod1,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05*2,0.5*2,0.5*2)
CreateWeld(wed,lwing6,wed,0,0,0.25*2,math.rad(0),math.rad(90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(extrawingmod1,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05*2,0.5*2,0.5*2)
CreateWeld(wed,lwing6,wed,0,0,0.25*2,math.rad(0),math.rad(-90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
A0 = Instance.new('Attachment',wed)
A0.Position = vt(0,0.25*2,0.25*2)
wed = CreateParta(extrawingmod1,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05*2,0.5*2,3*2)
CreateWeld(wed,lwing6,wed,0,-0.25*2,1.75*2,math.rad(0),math.rad(90),math.rad(90),0,0,0,math.rad(0),math.rad(0),math.rad(0))
A1 = Instance.new('Attachment',wed)
A1.Position = vt(0,-0.25*2,-2*2)
wed = CreateParta(extrawingmod1,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05*2,3*2,0.5*2)
CreateWeld(wed,lwing6,wed,0,-1.75*2,0.25*2,math.rad(90),math.rad(90),math.rad(90),0,0,0,math.rad(0),math.rad(0),math.rad(0))
tl6 = Instance.new('Trail',wed)
tl6.Attachment0 = A1
tl6.Attachment1 = A0
tl6.Texture = "rbxassetid://02108945559"
tl6.LightEmission = 1
tl6.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0),NumberSequenceKeypoint.new(1, 1)})
tl6.Color = ColorSequence.new(BrickColor.new('Really red').Color)
tl6.Lifetime = 0.6

tl1.Enabled = false
tl2.Enabled = false
tl3.Enabled = false
tl4.Enabled = false
tl5.Enabled = false
tl6.Enabled = false
-- Right wing.

local rwing1 = CreateParta(m,1,1,"Neon",maincolor)
CreateMesh(handle,"Brick",0.5,0.5,0.5)
local rwing1weld = CreateWeld(rwing1,handle,rwing1,-3,0,0,math.rad(5),math.rad(0),math.rad(-12.5),0,0,0,math.rad(0),math.rad(0),math.rad(0))
local hat = game:GetService("Players").LocalPlayer.Character["SwordThree"]

local function align(part0, part1)

        part0.AccessoryWeld:Destroy()
        local attachment0 = Instance.new("Attachment", part0)
        attachment0.Position = Vector3.new(1, 1, 0) --Custom Positioning Values Here
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
A0 = Instance.new('Attachment',wed)
A0.Position = vt(0,0.25,0.25)
wed = CreateParta(mw2,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,0.5)
CreateWeld(wed,rwing1,wed,0,0,0.25,math.rad(0),math.rad(-90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(mw2,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,3)
CreateWeld(wed,rwing1,wed,0,-0.25,1.75,math.rad(0),math.rad(90),math.rad(90),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(mw2,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,3,0.5)
CreateWeld(wed,rwing1,wed,0,-1.75,0.25,math.rad(90),math.rad(90),math.rad(90),0,0,0,math.rad(0),math.rad(0),math.rad(0))
A1 = Instance.new('Attachment',wed)
A1.Position = vt(0,2,0.25)

tr1 = Instance.new('Trail',wed)
tr1.Attachment0 = A1
tr1.Attachment1 = A0
tr1.Texture = "rbxassetid://02108945559"
tr1.LightEmission = 1
tr1.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0),NumberSequenceKeypoint.new(1, 1)})
tr1.Color = ColorSequence.new(BrickColor.new('Really red').Color)
tr1.Lifetime = 0.6

local rwing2 = CreateParta(m,1,1,"Neon",maincolor)
CreateMesh(handle,"Brick",0.5,0.5,0.5)
local rwing2weld = CreateWeld(rwing2,handle,rwing2,-4,1,0,math.rad(10),math.rad(0),math.rad(-25),0,0,0,math.rad(0),math.rad(0),math.rad(0))

wed = CreateParta(mw2,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,0.5)
CreateWeld(wed,rwing2,wed,0,0,0.25,math.rad(0),math.rad(90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
A0 = Instance.new('Attachment',wed)
A0.Position = vt(0,0.25,0.25)
wed = CreateParta(mw2,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,0.5)
CreateWeld(wed,rwing2,wed,0,0,0.25,math.rad(0),math.rad(-90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(mw2,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,3)
CreateWeld(wed,rwing2,wed,0,-0.25,1.75,math.rad(0),math.rad(90),math.rad(90),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(mw2,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,3,0.5)
CreateWeld(wed,rwing2,wed,0,-1.75,0.25,math.rad(90),math.rad(90),math.rad(90),0,0,0,math.rad(0),math.rad(0),math.rad(0))
A1 = Instance.new('Attachment',wed)
A1.Position = vt(0,2,0.25)

tr2 = Instance.new('Trail',wed)
tr2.Attachment0 = A1
tr2.Attachment1 = A0
tr2.Texture = "rbxassetid://02108945559"
tr2.LightEmission = 1
tr2.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0),NumberSequenceKeypoint.new(1, 1)})
tr2.Color = ColorSequence.new(BrickColor.new('Really red').Color)
tr2.Lifetime = 0.6

local rwing3 = CreateParta(m,1,1,"Neon",maincolor)
CreateMesh(handle,"Brick",0.5,0.5,0.5)
local rwing3weld = CreateWeld(rwing3,handle,rwing3,-4.75,2,0,math.rad(15),math.rad(0),math.rad(-37.5),0,0,0,math.rad(0),math.rad(0),math.rad(0))
local hat = game:GetService("Players").LocalPlayer.Character["SwordFour"]

local function align(part0, part1)

        part0.AccessoryWeld:Destroy()
        local attachment0 = Instance.new("Attachment", part0)
        attachment0.Position = Vector3.new(1, 1, 0) --Custom Positioning Values Here
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
A0 = Instance.new('Attachment',wed)
A0.Position = vt(0,0.25,0.25)
wed = CreateParta(mw2,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,0.5)
CreateWeld(wed,rwing3,wed,0,0,0.25,math.rad(0),math.rad(-90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(mw2,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,0.5,3)
CreateWeld(wed,rwing3,wed,0,-0.25,1.75,math.rad(0),math.rad(90),math.rad(90),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(mw2,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05,3,0.5)
CreateWeld(wed,rwing3,wed,0,-1.75,0.25,math.rad(90),math.rad(90),math.rad(90),0,0,0,math.rad(0),math.rad(0),math.rad(0))
A1 = Instance.new('Attachment',wed)
A1.Position = vt(0,2,0.25)

tr3 = Instance.new('Trail',wed)
tr3.Attachment0 = A1
tr3.Attachment1 = A0
tr3.Texture = "rbxassetid://02108945559"
tr3.LightEmission = 1
tr3.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0),NumberSequenceKeypoint.new(1, 1)})
tr3.Color = ColorSequence.new(BrickColor.new('Really red').Color)
tr3.Lifetime = 0.6


local rwing4 = CreateParta(m,1,1,"Neon",maincolor)
CreateMesh(handle,"Brick",0.5,0.5,0.5)
local rwing4weld = CreateWeld(rwing4,handle,rwing4,-5.75,3,0,math.rad(20),math.rad(0),math.rad(-50),0,0,0,math.rad(0),math.rad(0),math.rad(0))

wed = CreateParta(extrawingmod2,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05*2,0.5*2,0.5*2)
CreateWeld(wed,rwing4,wed,0,0,0.25*2,math.rad(0),math.rad(90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
A0 = Instance.new('Attachment',wed)
A0.Position = vt(0,0.25*2,0.25*2)
wed = CreateParta(extrawingmod2,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05*2,0.5*2,0.5*2)
CreateWeld(wed,rwing4,wed,0,0,0.25*2,math.rad(0),math.rad(-90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(extrawingmod2,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05*2,0.5*2,3*2)
CreateWeld(wed,rwing4,wed,0,-0.25*2,1.75*2,math.rad(0),math.rad(90),math.rad(90),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(extrawingmod2,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05*2,3*2,0.5*2)
CreateWeld(wed,rwing4,wed,0,-1.75*2,0.25*2,math.rad(90),math.rad(90),math.rad(90),0,0,0,math.rad(0),math.rad(0),math.rad(0))
A1 = Instance.new('Attachment',wed)
A1.Position = vt(0,2,0.25)

tr4 = Instance.new('Trail',wed)
tr4.Attachment0 = A1
tr4.Attachment1 = A0
tr4.Texture = "rbxassetid://02108945559"
tr4.LightEmission = 1
tr4.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0),NumberSequenceKeypoint.new(1, 1)})
tr4.Color = ColorSequence.new(BrickColor.new('Really red').Color)
tr4.Lifetime = 0.6

local rwing5 = CreateParta(m,1,1,"Neon",maincolor)
CreateMesh(handle,"Brick",0.5,0.5,0.5)
local rwing5weld = CreateWeld(rwing5,handle,rwing5,-6.75,4,0,math.rad(25),math.rad(0),math.rad(-62.5),0,0,0,math.rad(0),math.rad(0),math.rad(0))

wed = CreateParta(extrawingmod2,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05*2,0.5*2,0.5*2)
CreateWeld(wed,rwing5,wed,0,0,0.25*2,math.rad(0),math.rad(90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
A0 = Instance.new('Attachment',wed)
A0.Position = vt(0,0.25*2,0.25*2)
wed = CreateParta(extrawingmod2,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05*2,0.5*2,0.5*2)
CreateWeld(wed,rwing5,wed,0,0,0.25*2,math.rad(0),math.rad(-90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(extrawingmod2,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05*2,0.5*2,3*2)
CreateWeld(wed,rwing5,wed,0,-0.25*2,1.75*2,math.rad(0),math.rad(90),math.rad(90),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(extrawingmod2,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05*2,3*2,0.5*2)
CreateWeld(wed,rwing5,wed,0,-1.75*2,0.25*2,math.rad(90),math.rad(90),math.rad(90),0,0,0,math.rad(0),math.rad(0),math.rad(0))
A1 = Instance.new('Attachment',wed)
A1.Position = vt(0,2,0.25)

tr5 = Instance.new('Trail',wed)
tr5.Attachment0 = A1
tr5.Attachment1 = A0
tr5.Texture = "rbxassetid://02108945559"
tr5.LightEmission = 1
tr5.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0),NumberSequenceKeypoint.new(1, 1)})
tr5.Color = ColorSequence.new(BrickColor.new('Really red').Color)
tr5.Lifetime = 0.6

local rwing6 = CreateParta(m,1,1,"Neon",maincolor)
CreateMesh(handle,"Brick",0.5,0.5,0.5)
local rwing6weld = CreateWeld(rwing6,handle,rwing6,-7.75,3,0,math.rad(30),math.rad(0),math.rad(-75),0,0,0,math.rad(0),math.rad(0),math.rad(0))

wed = CreateParta(extrawingmod2,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05*2,0.5*2,0.5*2)
CreateWeld(wed,rwing6,wed,0,0,0.25*2,math.rad(0),math.rad(90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
A0 = Instance.new('Attachment',wed)
A0.Position = vt(0,0.25*2,0.25*2)
wed = CreateParta(extrawingmod2,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05*2,0.5*2,0.5*2)
CreateWeld(wed,rwing6,wed,0,0,0.25*2,math.rad(0),math.rad(-90),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(extrawingmod2,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05*2,0.5*2,3*2)
CreateWeld(wed,rwing6,wed,0,-0.25*2,1.75*2,math.rad(0),math.rad(90),math.rad(90),0,0,0,math.rad(0),math.rad(0),math.rad(0))
wed = CreateParta(extrawingmod2,0,0,"Neon",halocolor)
CreateMesh(wed,"Wedge",0.05*2,3*2,0.5*2)
CreateWeld(wed,rwing6,wed,0,-1.75*2,0.25*2,math.rad(90),math.rad(90),math.rad(90),0,0,0,math.rad(0),math.rad(0),math.rad(0))
A1 = Instance.new('Attachment',wed)
A1.Position = vt(0,2,0.25)

tr6 = Instance.new('Trail',wed)
tr6.Attachment0 = A1
tr6.Attachment1 = A0
tr6.Texture = "rbxassetid://02108945559"
tr6.LightEmission = 1
tr6.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0),NumberSequenceKeypoint.new(1, 1)})
tr6.Color = ColorSequence.new(BrickColor.new('Really red').Color)
tr6.Lifetime = 0.6

tr4.Enabled = false
tr5.Enabled = false
tr6.Enabled = false
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

--Knife Thing
local Knife = Instance.new("Part",char)
Knife.CanCollide = false
Knife.Name = "Knife"
local revm = Instance.new("FileMesh",Knife)
revm.MeshId = "http://www.roblox.com/asset/?id=0"
revm.TextureId = "http://www.roblox.com/asset/?id=0"
revm.Scale = Vector3.new(1,1,1)
local revw = Instance.new("Weld",Knife)
revw.Part0 = Knife
revw.Part1 = char["Right Arm"]
revw.C0 = CFrame.new(0,-1,1) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(0))
Knife.Transparency = 1
--

for i, v in pairs(m:GetChildren()) do
if v:IsA("Part") then
v.BrickColor = BrickColor.new("Really black")
v.Material = "Glass"
end
end
for i, v in pairs(m2:GetChildren()) do
if v:IsA("Part") then
v.BrickColor = BrickColor.new("Crimson")
v.Material = "Granite"
end
end
for i, v in pairs(m3:GetChildren()) do
if v:IsA("Part") then
v.BrickColor = BrickColor.new("Really red")
v.Material = "Neon"
end
end
for i, v in pairs(mw2:GetChildren()) do
if v:IsA("Part") then
v.BrickColor = BrickColor.new("Really red")
v.Material = "Neon"
end
end
for i, v in pairs(mw1:GetChildren()) do
if v:IsA("Part") then
v.Transparency = 1
v.BrickColor = BrickColor.new("Dark blue")
v.Material = "Neon"
end
end
for i, v in pairs(extrawingmod1:GetChildren()) do
if v:IsA("Part") then
v.Transparency = 1
v.BrickColor = BrickColor.new("White")
v.Material = "Neon"
end
end
for i, v in pairs(extrawingmod2:GetChildren()) do
if v:IsA("Part") then
v.Transparency = 1
v.BrickColor = BrickColor.new("White")
v.Material = "Neon"
end
end
local MAINRUINCOLOR = BrickColor.new("Really red")
------


function RemoveOutlines(part)
  part.TopSurface, part.BottomSurface, part.LeftSurface, part.RightSurface, part.FrontSurface, part.BackSurface = 10, 10, 10, 10, 10, 10
end
function CreatePart(Parent, Material, Reflectance, Transparency, BColor, Name, Size)
  local Part = Create("Part")({
    Parent = Parent,
    Reflectance = Reflectance,
    Transparency = Transparency+1,
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
function CreateMesha(Mesh, Part, MeshType, MeshId, OffSet, Scale)
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
LS=Torso["Left Shoulder"] 
LH=Torso["Left Hip"] 
RS=Torso["Right Shoulder"] 
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
techc.ImageColor3 = col1
circl.ImageColor3 = col2
circl2.ImageColor3 = col1
imgl2.ImageColor3 = col1
imgl2b.ImageColor3 = col1
ned.Text = name
ned.TextColor3 = col1
ned.TextStrokeColor3 = col2
end

local disably = true

function warnedpeople(text,represfont,color,color2)
	if disably ~= true then
CFuncs["Sound"].Create("rbxassetid://534859368", char, 2.5,1)
CFuncs["Sound"].Create("rbxassetid://963718869", char, 1,1)
for i,v in pairs(game:GetService("Players"):GetPlayers()) do
coroutine.resume(coroutine.create(function()
if v.PlayerGui:FindFirstChild("Spinny")~= nil then
v.PlayerGui:FindFirstChild("Spinny"):destroy()
end
local scrg = Instance.new("ScreenGui",v.PlayerGui)
scrg.Name = "Spinny"
local frm = Instance.new("Frame",scrg)
frm.BackgroundTransparency = 0.25
frm.BackgroundColor3 = color
frm.BorderSizePixel = 0
frm.Rotation = 45
frm.Size = UDim2.new(3,0,0,100)
frm.Position = UDim2.new(-4,0,0,0)
local frm2 = frm:Clone()
frm2.Parent = scrg
frm2.BackgroundColor3 = color2
frm2.Position = UDim2.new(-4.05,0,0,0)
local imlb = Instance.new("ImageLabel",scrg)
imlb.BackgroundTransparency = 1
imlb.BackgroundColor3 = Color3.new(0,0,0)
imlb.Image = "rbxassetid://2344851144"
imlb.Size = UDim2.new(0,750,0,750)
imlb.ImageColor3 = color2
imlb.ImageTransparency = 0.25
imlb.Position = UDim2.new(-2.5,0,-2.5,0)
local imlb2 = imlb:Clone()
imlb2.Image = "rbxassetid://2325939897"
imlb2.Size = UDim2.new(1,0,1,0)
imlb2.ImageColor3 = color
imlb2.ImageTransparency = 0
imlb2.Position = UDim2.new(0,0,0,0)
local imlb3 = imlb:Clone()
imlb3.Image = "rbxassetid://2344830904"
imlb3.Size = UDim2.new(1,0,1,0)
imlb3.ImageColor3 = color2
imlb3.ImageTransparency = 0
imlb3.Position = UDim2.new(0,0,0,0)
local imlb4 = imlb:Clone()
imlb4.Image = "rbxassetid://2344870656"
imlb4.Size = UDim2.new(3,0,3,0)
imlb4.ImageColor3 = Color3.new(1,1,1)
imlb4.ImageTransparency = 0
imlb4.Position = UDim2.new(-1,0,-1,0)
local imlb5 = imlb:Clone()
imlb5.Image = "rbxassetid://2344870656"
imlb5.Size = UDim2.new(10,0,10,0)
imlb5.ImageColor3 = color2
imlb5.ImageTransparency = 0
imlb5.Position = UDim2.new(-4.5,0,-4.5,0)
imlb2.Parent = imlb
imlb3.Parent = imlb
imlb4.Parent = imlb
imlb5.Parent = imlb
local txtlb2 = Instance.new("TextLabel",imlb)
txtlb2.Text = text
txtlb2.Font = represfont
txtlb2.TextColor3 = color
txtlb2.TextStrokeTransparency = 0
txtlb2.BackgroundTransparency = 1
txtlb2.TextStrokeColor3 = color2
txtlb2.TextScaled = true
txtlb2.Size = UDim2.new(1,0,1,0)
txtlb2.Position = UDim2.new(0,0,0,0)
local fvalen = 0.55
local fval = -0.49
coroutine.resume(coroutine.create(function()
while true do
swait()
if chaosmode == true then
txtlb2.Rotation = math.random(-1,1)
imlb.Position = imlb.Position + UDim2.new(0,math.random(-1,1)/5,0,math.random(-1,1)/5)
txtlb2.Position = txtlb2.Position + UDim2.new(0,math.random(-1,1)/5,0,math.random(-1,1)/5)
imlb.ImageColor3 = BrickColor.random().Color
txtlb2.TextStrokeColor3 = BrickColor.random().Color
end
end
end))
coroutine.resume(coroutine.create(function()
while true do
swait()
if scrg.Parent ~= nil then
	fvalen = fvalen - 0.0001
elseif scrg.Parent == nil then
break
end
end
end))
local flol = -5
local flil = 1.6
coroutine.resume(coroutine.create(function()
	for i = 0, 49 do
		swait()
		flol = flol + 0.125
		flil = flil - 0.1
		frm.Size = frm.Size + UDim2.new(0.1,0,0,0)
		frm.Rotation = frm.Rotation - 0.25
		frm2.Size = frm2.Size + UDim2.new(0.1,0,0,0)
		frm2.Rotation = frm.Rotation + 0.325
		imlb3.Rotation = imlb3.Rotation - 10
		imlb2.Rotation = imlb.Rotation + 7.5
		imlb.Rotation = imlb.Rotation + 5
		txtlb2.Rotation = txtlb2.Rotation - 5.125
		imlb.Position = imlb.Position + UDim2.new(0.05125,0,0.04775,0)
	end
	for i = 0, 99 do
		swait()
		fval = fval + 0.05
		flol = flol + 0.005
		frm.Size = frm.Size + UDim2.new(0.005,0,0,0)
		frm.Rotation = frm.Rotation - 0.075
		frm2.Size = frm2.Size + UDim2.new(0.005,0,0,0)
		frm2.Rotation = frm2.Rotation + 0.125
		imlb3.Rotation = imlb3.Rotation - 2
		imlb2.Rotation = imlb.Rotation + 1.5
		imlb.Rotation = imlb.Rotation + 1
		txtlb2.Rotation = txtlb2.Rotation - 1.125
		imlb.Position = imlb.Position + UDim2.new(0.0015,0,0.00075,0)
	end
local valinc = 0
local vinc2 = 1
for i = 0, 99 do
swait()
vinc2 = vinc2 + 0.25
valinc = valinc + 0.0001
flol = flol + valinc
flil = flil + valinc
txtlb2.Rotation = txtlb2.Rotation - 1.125*vinc2
imlb3.Rotation = imlb3.Rotation - 2*vinc2
imlb.Rotation = imlb.Rotation + 1*vinc2
imlb.Position = imlb.Position + UDim2.new(0.0015*vinc2,0,0.0005*vinc2,0)
frm.Size = frm.Size + UDim2.new(0.005*vinc2,0,0,0)
frm.Rotation = frm.Rotation + 0.1*vinc2
frm2.Size = frm2.Size + UDim2.new(0.005*vinc2,0,0,0)
frm2.Rotation = frm2.Rotation + 0.225*vinc2
frm2.BackgroundTransparency = frm2.BackgroundTransparency + 0.0075
frm.BackgroundTransparency = frm.BackgroundTransparency + 0.0075
imlb.ImageTransparency = imlb.ImageTransparency + 0.005
imlb2.ImageTransparency = imlb2.ImageTransparency + 0.01
imlb3.ImageTransparency = imlb3.ImageTransparency + 0.01
imlb4.ImageTransparency = imlb4.ImageTransparency + 0.01
imlb5.ImageTransparency = imlb4.ImageTransparency + 0.01
txtlb2.TextStrokeTransparency = txtlb2.TextStrokeTransparency + 0.01
txtlb2.TextTransparency = txtlb2.TextTransparency + 0.01
end
scrg:Destroy()
end))
end))
end
end
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
RW.Part0=ch.Torso 
RW.C0=cf(1.5, 0.5, 0) --* CFrame.fromEulerAnglesXYZ(1.3, 0, -0.5) 
RW.C1=cf(0, 0.5, 0) 
RW.Part1=ch["Right Arm"] 
RW.Parent=ch.Torso 
-- 
LW.Name="Left Shoulder"
LW.Part0=ch.Torso 
LW.C0=cf(-1.5, 0.5, 0) --* CFrame.fromEulerAnglesXYZ(1.7, 0, 0.8) 
LW.C1=cf(0, 0.5, 0) 
LW.Part1=ch["Left Arm"] 
LW.Parent=ch.Torso 

local Stats=Instance.new("BoolValue")
Stats.Name="Stats"
Stats.Parent=Character
local Atk=Instance.new("NumberValue")
Atk.Name="Damage"
Atk.Parent=Stats
Atk.Value=1
local Def=Instance.new("NumberValue")
Def.Name="Defense"
Def.Parent=Stats
Def.Value=1
local Speed=Instance.new("NumberValue")
Speed.Name="Speed"
Speed.Parent=Stats
Speed.Value=1
local Mvmt=Instance.new("NumberValue")
Mvmt.Name="Movement"
Mvmt.Parent=Stats
Mvmt.Value=1

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
w1.Transparency = 0
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
w1.Transparency = 0.7
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
w2.Transparency = 0
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
w2.Transparency = 0.7
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
      Value = game:GetService("Players").GodzPlaysRB,
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
      h.MaxHealth = 100
      h.Health = h.Health - Damage
      if HitHealth ~= h.Health and HitHealth ~= 0 and 0 >= h.Health and h.Parent.Name ~= "Hologram" then
        print("gained kill")
        dmg(h.Parent)
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
    BackgroundTransparency = 1,
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

function SkullEffect(brickcolor,cframe,x1,y1,z1,delay)
local prt=part(3,workspace,0,0,brickcolor,"Effect",vt(0.5,0.5,0.5))
prt.Anchored=true
prt.CFrame=cframe
local msh=mesh("SpecialMesh",prt,"FileMesh","http://www.roblox.com/asset/?id=4770583",vt(0,0,0),vt(x1,y1,z1))
--http://www.roblox.com/asset/?id=4770560
game:GetService("Debris"):AddItem(prt,2)
CF=prt.CFrame
coroutine.resume(coroutine.create(function(Part,Mesh,TehCF) 
for i=0,1,0.2 do
wait()
Part.CFrame=CF*cf(0,0,-0.4)
end
for i=0,1,delay do
wait()
--Part.CFrame=CF*cf((math.random(-1,0)+math.random())/5,(math.random(-1,0)+math.random())/5,(math.random(-1,0)+math.random())/5)
Mesh.Scale=Mesh.Scale
end
for i=0,1,0.1 do
wait()
Part.Transparency=i
end
Part.Parent=nil
end),prt,msh,CF)
end
 
function MagicBlock(brickcolor,cframe,x1,y1,z1,x3,y3,z3,delay)
local prt=part(3,char,0,0,brickcolor,"Effect",vt(0.5,0.5,0.5))
prt.Anchored=true
prt.Material = "Neon"
prt.CFrame=cframe
prt.CFrame=prt.CFrame*euler(math.random(-50,50),math.random(-50,50),math.random(-50,50))
msh=mesh("BlockMesh",prt,"","",vt(0,0,0),vt(x1,y1,z1))
game:GetService("Debris"):AddItem(prt,5)
coroutine.resume(coroutine.create(function(Part,Mesh) 
for i=0,1,delay do
swait()
Part.CFrame=Part.CFrame*euler(math.random(-50,50),math.random(-50,50),math.random(-50,50))
Part.Transparency=i
Mesh.Scale=Mesh.Scale+vt(x3,y3,z3)
end
Part.Parent=nil
end),prt,msh)
end

function MagicBlockSteady(brickcolor,cframe,x1,y1,z1,x3,y3,z3,delay,rottype)
local prt=part(3,char,0,0,brickcolor,"Effect",vt(0.5,0.5,0.5))
prt.Anchored=true
prt.Material = "Neon"
prt.Transparency = 1
prt.CFrame=cframe
msh=mesh("BlockMesh",prt,"","",vt(0,0,0),vt(x1,y1,z1))
game:GetService("Debris"):AddItem(prt,5)
coroutine.resume(coroutine.create(function(Part,Mesh) 
	local rtype = rottype
for i=0,1,delay do
swait()
if rtype == 1 then
prt.CFrame = prt.CFrame*CFrame.Angles(0,0,0.1)
elseif rtype == 2 then
prt.CFrame = prt.CFrame*CFrame.Angles(0,0,-0.1)
end
Part.Transparency=i
Mesh.Scale=Mesh.Scale+vt(x3,y3,z3)
end
Part.Parent=nil
end),prt,msh)
end

function MagicSphere(brickcolor,cframe,x1,y1,z1,x3,y3,z3,delay)
local prt=part(3,char,0,0,brickcolor,"Effect",vt(0.5,0.5,0.5))
prt.Anchored=true
prt.CFrame=cframe
prt.CFrame=prt.CFrame*euler(math.random(-50,50),math.random(-50,50),math.random(-50,50))
msh=mesh("SpecialMesh",prt,"Sphere","",vt(0,0,0),vt(x1,y1,z1))
game:GetService("Debris"):AddItem(prt,5)
coroutine.resume(coroutine.create(function(Part,Mesh) 
for i=0,1,delay do
wait()
Part.Transparency=i
Mesh.Scale=Mesh.Scale+vt(x3,y3,z3)
end
Part.Parent=nil
end),prt,msh)
end

function MagicBlockSteady(brickcolor,cframe,x1,y1,z1,x3,y3,z3,delay,rottype)
local prt=part(3,char,0,0,brickcolor,"Effect",vt(0.5,0.5,0.5))
prt.Anchored=true
prt.Material = "Neon"
prt.CFrame=cframe
msh=mesh("BlockMesh",prt,"","",vt(0,0,0),vt(x1,y1,z1))
game:GetService("Debris"):AddItem(prt,5)
coroutine.resume(coroutine.create(function(Part,Mesh) 
	local rtype = rottype
for i=0,1,delay do
swait()
if rtype == 1 then
prt.CFrame = prt.CFrame*CFrame.Angles(0,0,0.1)
elseif rtype == 2 then
prt.CFrame = prt.CFrame*CFrame.Angles(0,0,-0.1)
end
Part.Transparency=i
Mesh.Scale=Mesh.Scale+vt(x3,y3,z3)
end
Part.Parent=nil
end),prt,msh)
end

function MagicShock(brickcolor,cframe,x1,y1,x3,y3,delay,rottype)
local prt=part(3,char,1,1,brickcolor,"Effect",vt(0.5,0.5,0.5))
prt.Anchored=true
prt.Material = "Neon"
prt.CFrame=cframe
local dec = decal(prt.Color,"http://www.roblox.com/asset/?id=874580939","Front",prt)
local dec2 = decal(prt.Color,"http://www.roblox.com/asset/?id=874580939","Front",prt)
msh=mesh("BlockMesh",prt,"","",vt(0,0,0),vt(x1,y1,0.01))
game:GetService("Debris"):AddItem(prt,5)
coroutine.resume(coroutine.create(function(Part,Mesh) 
	local rtype = rottype
for i=0,1,delay do
swait()
if rtype == 1 then
prt.CFrame = prt.CFrame*CFrame.Angles(0,0,0.1)
elseif rtype == 2 then
prt.CFrame = prt.CFrame*CFrame.Angles(0,0,-0.1)
end
dec.Transparency=i
dec2.Transparency=i
Mesh.Scale=Mesh.Scale+vt(x3,y3,0)
end
Part.Parent=nil
end),prt,msh)
end

function MagicShockAlt(brickcolor,cframe,x1,y1,x3,y3,delay,rottype)
local prt=part(3,char,0,0,brickcolor,"Effect",vt(0.5,0.5,0.5))
prt.Anchored=true
prt.Material = "Neon"
prt.CFrame=cframe
msh=mesh("BlockMesh",prt,"","",vt(0,0,0),vt(x1,y1,0.01))
game:GetService("Debris"):AddItem(prt,5)
coroutine.resume(coroutine.create(function(Part,Mesh) 
	local rtype = rottype
for i=0,1,delay do
swait()
if rtype == 1 then
prt.CFrame = prt.CFrame*CFrame.Angles(0,0,0.1)
elseif rtype == 2 then
prt.CFrame = prt.CFrame*CFrame.Angles(0,0,-0.1)
end
prt.Transparency=i
Mesh.Scale=Mesh.Scale+vt(x3,y3,0)
end
Part.Parent=nil
end),prt,msh)
end

function MagicShockAltCircle(brickcolor,cframe,x1,z1,x3,z3,delay,rottype)
local prt=part(3,char,0,0,brickcolor,"Effect",vt(0.5,0.5,0.5))
prt.Anchored=true
prt.Material = "Neon"
prt.CFrame=cframe
msh=mesh("BlockMesh",prt,"","",vt(0,0,0),vt(x1,1,z1))
game:GetService("Debris"):AddItem(prt,5)
coroutine.resume(coroutine.create(function(Part,Mesh) 
	local rtype = rottype
for i=0,1,delay do
swait()
if rtype == 1 then
prt.CFrame = prt.CFrame*CFrame.Angles(0,0.1,0)
elseif rtype == 2 then
prt.CFrame = prt.CFrame*CFrame.Angles(0,-0.1,0)
end
prt.Transparency=i
Mesh.Scale=Mesh.Scale+vt(x3,0,z3)
end
Part.Parent=nil
end),prt,msh)
end

function MagicShockTrailAlt(brickcolor,cframe,x1,y1,z1,x3,y3,delay,rottype)
local prt=part(3,char,0,0,brickcolor,"Effect",vt(0.5,0.5,0.5))
prt.Anchored=true
prt.Material = "Neon"
prt.CFrame=cframe
msh=mesh("BlockMesh",prt,"","",vt(0,0,0),vt(x1,y1,z1))
game:GetService("Debris"):AddItem(prt,5)
coroutine.resume(coroutine.create(function(Part,Mesh) 
	local rtype = rottype
for i=0,1,delay do
swait()
if rtype == 1 then
prt.CFrame = prt.CFrame*CFrame.Angles(0,0,0.1)
elseif rtype == 2 then
prt.CFrame = prt.CFrame*CFrame.Angles(0,0,-0.1)
end
prt.Transparency=i
Mesh.Scale=Mesh.Scale+vt(x3,y3,0)
end
Part.Parent=nil
end),prt,msh)
end

function MagicShockTrailAlt2(brickcolor,cframe,x1,y1,z1,x3,y3,z3,delay,rottype)
local prt=part(3,char,0,0,brickcolor,"Effect",vt(0.5,0.5,0.5))
prt.Anchored=true
prt.Material = "Neon"
prt.CFrame=cframe
msh=mesh("BlockMesh",prt,"","",vt(0,0,0),vt(x1,y1,z1))
game:GetService("Debris"):AddItem(prt,5)
coroutine.resume(coroutine.create(function(Part,Mesh) 
	local rtype = rottype
for i=0,1,delay do
swait()
if rtype == 1 then
prt.CFrame = prt.CFrame*CFrame.Angles(0,0,0.1)
elseif rtype == 2 then
prt.CFrame = prt.CFrame*CFrame.Angles(0,0,-0.1)
end
prt.Transparency=i
Mesh.Scale=Mesh.Scale+vt(x3,y3,z3)
end
Part.Parent=nil
end),prt,msh)
end
 
function MagicBlock2(brickcolor,cframe,Parent,x1,y1,z1,x3,y3,z3,delay)
local prt=part(3,char,0,0,brickcolor,"Effect",vt(0.5,0.5,0.5))
prt.Anchored=false
prt.CFrame=cframe
msh=mesh("BlockMesh",prt,"","",vt(0,0,0),vt(x1,y1,z1))
local wld=weld(prt,prt,Parent,cframe)
game:GetService("Debris"):AddItem(prt,5)
coroutine.resume(coroutine.create(function(Part,Mesh,Weld) 
for i=0,1,delay do
wait()
Weld.C0=euler(math.random(-50,50),math.random(-50,50),math.random(-50,50))*cframe
--Part.CFrame=Part.CFrame*euler(math.random(-50,50),math.random(-50,50),math.random(-50,50))
Part.Transparency=i
Mesh.Scale=Mesh.Scale+vt(x3,y3,z3)
end
Part.Parent=nil
end),prt,msh,wld)
end
 
function MagicBlock3(brickcolor,cframe,Parent,x1,y1,z1,x3,y3,z3,delay)
local prt=part(3,workspace,0,0,brickcolor,"Effect",vt(0.5,0.5,0.5))
prt.Anchored=false
prt.CFrame=cframe
msh=mesh("BlockMesh",prt,"","",vt(0,0,0),vt(x1,y1,z1))
local wld=weld(prt,prt,Parent,euler(0,0,0)*cf(0,0,0))
game:GetService("Debris"):AddItem(prt,5)
coroutine.resume(coroutine.create(function(Part,Mesh,Weld) 
for i=0,1,delay do
wait()
Weld.C0=euler(i*20,0,0)
--Part.CFrame=Part.CFrame*euler(math.random(-50,50),math.random(-50,50),math.random(-50,50))
Part.Transparency=i
Mesh.Scale=Mesh.Scale+vt(x3,y3,z3)
end
Part.Parent=nil
end),prt,msh,wld)
end
 
function MagicCircle2(brickcolor,cframe,x1,y1,z1,x3,y3,z3,delay)
local prt=part(3,workspace,0,0,brickcolor,"Effect",vt(0.5,0.5,0.5))
prt.Anchored=true
prt.CFrame=cframe
local msh=mesh("CylinderMesh",prt,"","",vt(0,0,0),vt(x1,y1,z1))
game:GetService("Debris"):AddItem(prt,2)
coroutine.resume(coroutine.create(function(Part,Mesh) 
for i=0,1,delay do
wait()
Part.CFrame=Part.CFrame
Mesh.Scale=Mesh.Scale+vt(x3,y3,z3)
local prt2=part(3,workspace,0,0,brickcolor,"Effect",vt(0.5,0.5,0.5))
prt2.Anchored=true
prt2.CFrame=cframe*euler(math.random(-50,50),math.random(-50,50),math.random(-50,50))
local msh2=mesh("SpecialMesh",prt2,"Sphere","",vt(0,0,0),vt(0.5,0.5,0.5))
game:GetService("Debris"):AddItem(prt2,2)
coroutine.resume(coroutine.create(function(Part,Mesh) 
for i=0,1,0.1 do
wait()
Part.CFrame=Part.CFrame*cf(0,0.5,0)
end
Part.Parent=nil
end),prt2,msh2)
end
for i=0,1,delay*2 do
wait()
Part.CFrame=Part.CFrame
Mesh.Scale=vt((x1+x3)-(x1+x3)*i,(y1+y3)-(y1+y3)*i,(z1+z3)-(z1+z3)*i)
end
Part.Parent=nil
end),prt,msh)
end
 
function MagicCircle(brickcolor,cframe,x1,y1,z1,x3,y3,z3,delay)
local prt=part(3,workspace,0,0,brickcolor,"Effect",vt(0.5,0.5,0.5))
prt.Anchored=true
prt.CFrame=cframe
local msh=mesh("SpecialMesh",prt,"Sphere","",vt(0,0,0),vt(x1,y1,z1))
game:GetService("Debris"):AddItem(prt,2)
coroutine.resume(coroutine.create(function(Part,Mesh) 
for i=0,1,delay do
wait()
Part.CFrame=Part.CFrame
Part.Transparency=i
Mesh.Scale=Mesh.Scale+vt(x3,y3,z3)
end
Part.Parent=nil
end),prt,msh)
end
 
function BreakEffect(brickcolor,cframe,x1,y1,z1)
local prt=part(3,workspace,0,0,brickcolor,"Effect",vt(0.5,0.5,0.5))
prt.Anchored=true
prt.CFrame=cframe*euler(math.random(-50,50),math.random(-50,50),math.random(-50,50))
local msh=mesh("SpecialMesh",prt,"Sphere","",vt(0,0,0),vt(x1,y1,z1))
game:GetService("Debris"):AddItem(prt,2)
coroutine.resume(coroutine.create(function(Part,CF,Numbb,randnumb) 
CF=Part.CFrame
Numbb=0
randnumb=math.random()/10
rand1=math.random()/10
for i=0,1,rand1 do
wait()
CF=CF*cf(0,math.random()/2,0)
--Part.CFrame=Part.CFrame*euler(0.5,0,0)*cf(0,1,0)
Part.CFrame=CF*euler(Numbb,0,0)
Part.Transparency=i
Numbb=Numbb+randnumb
end
Part.Parent=nil
end),prt,CF,Numbb,randnumb)
end
 
function MagicWaveThing(brickcolor,cframe,x1,y1,z1,x3,y3,z3,delay)
local prt=part(3,workspace,0,0,brickcolor,"Effect",vt(0.5,0.5,0.5))
prt.Anchored=true
prt.CFrame=cframe
msh=mesh("SpecialMesh",prt,"FileMesh","http://www.roblox.com/asset/?id=1051557",vt(0,0,0),vt(x1,y1,z1))
game:GetService("Debris"):AddItem(prt,5)
coroutine.resume(coroutine.create(function(Part,Mesh) 
for i=0,1,delay do
wait()
Part.CFrame=Part.CFrame*euler(0,0.7,0)
Part.Transparency=i
Mesh.Scale=Mesh.Scale+vt(x3,y3,z3)
end
Part.Parent=nil
end),prt,msh)
end
 
function WaveEffect(brickcolor,cframe,x1,y1,z1,x3,y3,z3,delay)
local prt=part(3,workspace,0,0,brickcolor,"Effect",vt(0.5,0.5,0.5))
prt.Anchored=true
prt.CFrame=cframe
msh=mesh("SpecialMesh",prt,"FileMesh","http://www.roblox.com/asset/?id=20329976",vt(0,0,0),vt(x1,y1,z1))
game:GetService("Debris"):AddItem(prt,2)
coroutine.resume(coroutine.create(function(Part,Mesh) 
for i=0,1,delay do
wait()
Part.CFrame=Part.CFrame*cf(0,y3/2,0)
Part.Transparency=i
Mesh.Scale=Mesh.Scale+vt(x3,y3,z3)
end
Part.Parent=nil
end),prt,msh)
end
 
function StravEffect(brickcolor,cframe,x,y,z,x1,y1,z1,delay)
local prt=part(3,workspace,0,0,brickcolor,"Effect",vt(0.5,0.5,0.5))
prt.Anchored=true
prt.CFrame=cframe*cf(x,y,z)
msh=mesh("SpecialMesh",prt,"FileMesh","rbxassetid://168892363",vt(0,0,0),vt(x1,y1,z1))
game:GetService("Debris"):AddItem(prt,5)
coroutine.resume(coroutine.create(function(Part,Mesh,ex,why,zee) 
local num=math.random()
local num2=math.random(-3,2)+math.random()
local numm=0
for i=0,1,delay*2 do
swait()
Part.CFrame=cframe*euler(0,numm*num*10,0)*cf(ex,why,zee)*cf(-i*10,num2,0)
Part.Transparency=i
numm=numm+0.01
end
Part.Parent=nil
Mesh.Parent=nil
end),prt,msh,x,y,z)
end

function dmgstart(dmg,what)
	hitcon = what.Touched:connect(function(hit)
		local hum = hit.Parent:FindFirstChild("Humanoid")
		if hum and not hum:IsDescendantOf(Character) then
			hum:TakeDamage(dmg)
		end
	end)
end

function dmgstop()
	hitcon:disconnect()
end

function Cloak()
Face.Parent=nil
cloaked=true
        for _,v in pairs(Torso.Parent:children()) do
                if v.className=="Part" and v.Name~="HumanoidRootPart" then
                coroutine.resume(coroutine.create(function() 
                for i=0,1,0.2 do
                wait()
                v.Transparency=i
                end
                v.Transparency=1
                end))
                end
                if v.className=="Hat" then
                hatp=v.Handle
                coroutine.resume(coroutine.create(function(derp) 
                for i=0,1,0.2 do
                wait()
                derp.Transparency=i
                end
                derp.Transparency=1
                end),hatp)
                end
        end
        for _,v in pairs(m:children()) do
                if v.className=="Part" then
                coroutine.resume(coroutine.create(function() 
                for i=0,1,0.2 do
                wait()
                v.Transparency=i
                end
                v.Transparency=1
                end))
                end
        end
end
 
function UnCloak()
so("http://roblox.com/asset/?id=2767090",Torso,1,1.1) 
Face.Parent=Head 
cloaked=false
        for _,v in pairs(Torso.Parent:children()) do
                if v.className=="Part" and v.Name~="HumanoidRootPart" then
                coroutine.resume(coroutine.create(function() 
                for i=0,1,0.1 do
                wait()
                v.Transparency=v.Transparency-0.1
                end
                v.Transparency=0
                end))
                end
                if v.className=="Hat" then
                hatp=v.Handle
                coroutine.resume(coroutine.create(function(derp) 
                for i=0,1,0.1 do
                wait()
                derp.Transparency=derp.Transparency-0.1
                end
                derp.Transparency=0
                end),hatp)
                end
        end
        for _,v in pairs(m:children()) do
                if v.className=="Part" and v.Name~="hitbox" and v.Name~='tip' then
                coroutine.resume(coroutine.create(function() 
                for i=0,1,0.1 do
                wait()
                v.Transparency=v.Transparency-0.1
                end
                v.Transparency=0
                end))
                v.Transparency=0
                end
        end
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
        rng.Transparency = 0
        rng.TopSurface = 0
        rng.BottomSurface = 0
        rng.CFrame = pos
        local rngm = Instance.new("SpecialMesh", rng)
        rngm.MeshId = "http://www.roblox.com/asset/?id=0"
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
        rng.Transparency = 0
        rng.TopSurface = 0
        rng.BottomSurface = 0
        rng.CFrame = pos
        local rngm = Instance.new("SpecialMesh", rng)
        rngm.MeshId = "http://www.roblox.com/asset/?id=0"
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

function wind(type,pos,scale,value,speed)
local type = type
local rng = Instance.new("Part", char)
        rng.Anchored = true
        rng.BrickColor = origcolor
        rng.CanCollide = false
        rng.FormFactor = 3
        rng.Name = "Ring"
        rng.Size = Vector3.new(1, 1, 1)
        rng.Transparency = 0
        rng.TopSurface = 0
        rng.BottomSurface = 0
        rng.CFrame = pos
        local rngm = Instance.new("SpecialMesh", rng)
        rngm.MeshId = "http://www.roblox.com/asset/?id=0"
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
rng.CFrame = rng.CFrame*CFrame.Angles(0,0.025*speed,0)
rng.Transparency = rng.Transparency + 0.01
rngm.Scale = rngm.Scale + Vector3.new(scaler2, scaler2, scaler2)
end
rng:Destroy()
end))
end

function groundwind(type,pos,scale,value,speed)
local type = type
local rng = Instance.new("Part", char)
        rng.Anchored = true
        rng.BrickColor = origcolor
        rng.CanCollide = false
        rng.FormFactor = 3
        rng.Name = "Ring"
        rng.Size = Vector3.new(1, 1, 1)
        rng.Transparency = 0
        rng.TopSurface = 0
        rng.BottomSurface = 0
        rng.CFrame = pos
        local rngm = Instance.new("SpecialMesh", rng)
        rngm.MeshId = "http://www.roblox.com/asset/?id=0"
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
rng.CFrame = rng.CFrame*CFrame.Angles(0,0.025*speed,0)
rng.Transparency = rng.Transparency + 0.01
rngm.Scale = rngm.Scale + Vector3.new(scaler2, scaler2/5, scaler2)
end
rng:Destroy()
end))
end

function CameraManager()
  if TwoD and not CamInterrupt then
    if Humanoid.Health > 0 then
      Camera.CameraSubject = Humanoid
      Camera.CameraType = "Scriptable"
      Humanoid.AutoRotate = false
      if Booleans.GyroUse then
        Directer.MaxTorque = Vec3(0, huge, 0)
      else
        Directer.MaxTorque = Vec3(0, 0, 0)
      end
      if TargetInfo[1] ~= nil and TargetInfo[2] ~= nil then
        if Booleans.CamFollow then
          CPart.CFrame = cFrame(RootPart.Position, Vec3(TargetInfo[1].Position.X, RootPart.Position.Y, TargetInfo[1].Position.Z))
          Directer.CFrame = cFrame((RootPart.CFrame * cFrame(0, 0, 10)).p, TargetInfo[1].Position)
        else
          CPart.Position = RootPart.Position
        end
      else
        local ahead = (RootPart.CFrame * cFrame(0, 0, -3)).p
        CPart.CFrame = cFrame(RootPart.Position, Vec3(ahead.X, RootPart.Position.Y, ahead.Z))
      end
      Camera.CFrame = lerp(Camera.CFrame, CPart.CFrame * cFrame(25, 3, 0) * Euler(0, radian(90), 0), 0.2)
    else
      Camera.CameraSubject = Humanoid
      Camera.CameraType = "Custom"
      Controller.Disabled = false
    end
  end
end

function ring(type,pos,scale,value)
local type = type
local rng = Instance.new("Part", char)
        rng.Anchored = true
        rng.BrickColor = origcolor
        rng.CanCollide = false
        rng.FormFactor = 3
        rng.Name = "Ring"
        rng.Size = Vector3.new(1, 1, 1)
        rng.Transparency = 0
        rng.TopSurface = 0
        rng.BottomSurface = 0
        rng.CFrame = pos
        local rngm = Instance.new("SpecialMesh", rng)
        rngm.MeshId = "http://www.roblox.com/asset/?id=0"
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
        rng.Transparency = 0
        rng.TopSurface = 0
        rng.BottomSurface = 0
        rng.CFrame = pos
        local rngm = Instance.new("SpecialMesh", rng)
        rngm.MeshId = "http://www.roblox.com/asset/?id=0"
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
        rng.Transparency = 0
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
        rng.Transparency = 0
        rng.TopSurface = 0
        rng.BottomSurface = 0
        rng.CFrame = pos
        local rngm = Instance.new("SpecialMesh", rng)
        rngm.MeshType = "Sphere"
if rainbowmode == true then
rng.Color = Color3.new(r/255,g/255,b/255)
end
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
if chaosmode == true then
rng.BrickColor = BrickColor.random()
end
if rainbowmode == true then
rng.Color = Color3.new(r/255,g/255,b/255)
end
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

function sphere3(bonuspeed,type,pos,scale,value,value2,value3,color)
	
local type = type
local rng = Instance.new("Part", char)
        rng.Anchored = true
if ModeOfGlitch ~= 9 then
	
        rng.Color = color
elseif ModeOfGlitch == 9 then
rng.Color = Color3.new(kan.PlaybackLoudness/1000,kan.PlaybackLoudness/1000,kan.PlaybackLoudness/1000)
end
        rng.CanCollide = false
        rng.FormFactor = 3
        rng.Name = "Ring"
        rng.Material = "Neon"
        rng.Size = Vector3.new(1, 1, 1)
        rng.Transparency = 0
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
        rng.Transparency = 0
if typeoftrans == "In" then
rng.Transparency = 1
end
        rng.TopSurface = 0
        rng.BottomSurface = 0
        rng.CFrame = pos
        local rngm = Instance.new("SpecialMesh", rng)
        rngm.MeshType = "FileMesh"
if rainbowmode == true then
rng.Color = Color3.new(r/255,g/255,b/255)
end
if typeofshape == "Normal" then
rngm.MeshId = "rbxassetid://0"
elseif typeofshape == "Round" then
rngm.MeshId = "rbxassetid://0"
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
if rainbowmode == true then
rng.Color = Color3.new(r/255,g/255,b/255)
end
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
        rng.Transparency = 0
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
        rng.Transparency = 0
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
        rng.Transparency = 0
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
        rng.Transparency = 0
        rng.TopSurface = 0
        rng.BottomSurface = 0
        rng.CFrame = pos
        local rngm = Instance.new("SpecialMesh", rng)
        rngm.MeshType = "Brick"
rngm.Scale = scale
if rainbowmode == true then
rng.Color = Color3.new(r/255,g/255,b/255)
end
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
if rainbowmode == true then
rng.Color = Color3.new(r/255,g/255,b/255)
end
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
        rng.Transparency = 1
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
        rng.Transparency = 1
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
local bgf = Instance.new("BodyGyro",dude.Head)
bgf.CFrame = bgf.CFrame * CFrame.fromEulerAnglesXYZ(math.rad(-90),0,0)
--[[local val = Instance.new("BoolValue",dude)
val.Name = "IsHit"]]--
local ds = coroutine.wrap(function()
dude:WaitForChild("Head"):BreakJoints()
for i, v in pairs(dude:GetChildren()) do
if v:IsA("Part") or v:IsA("MeshPart") then
v.Name = "DEMINISHED"
CFuncs["Sound"].Create("rbxassetid://763718160", v, 0.75, 1.1)
CFuncs["Sound"].Create("rbxassetid://782353443", v, 1, 1)
for i = 0, 1 do
sphere2(1,"Add",v.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(1,1,1),-0.01,3,-0.01,MAINRUINCOLOR,MAINRUINCOLOR.Color)
end
end
end
wait(0.5)
targetted = nil
CFuncs["Sound"].Create("rbxassetid://62339698", char, 0.25, 0.285)
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
bld.LightEmission = 1
bld.Texture = "rbxassetid://00" ---284205403
bld.Color = ColorSequence.new(MAINRUINCOLOR.Color)
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
v.Color = MAINRUINCOLOR.Color
coroutine.resume(coroutine.create(function()
for i = 0, 49 do
swait(1)
v:BreakJoints()
v.Transparency = v.Transparency + 0.02
end
v:BreakJoints()
for i = 0, 4 do
slash(math.random(10,50)/10,3,true,"Round","Add","Out",v.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(0.01,0.0025,0.01),math.random(10,100)/2500,BrickColor.new("White"))
end
sphere2(1,"Add",v.CFrame,vt(1,1,1),-0.08,-0.08,-0.08,MAINRUINCOLOR)
CFuncs["Sound"].Create("rbxassetid://782353117", v, 0.25, 1.2)
CFuncs["Sound"].Create("rbxassetid://1192402877", v, 0.5, 0.75)
bld.Speed = NumberRange.new(10,25)
bld.Drag = 5
bld.Acceleration = vt(0,2,0)
wait(0.5)
bld.Enabled = false
wait(4)
coroutine.resume(coroutine.create(function()
for i = 0, 99 do
swait()
v:Destroy()
dude:Destroy()
end
end))
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

local ModeOfGlitch = 1
-- Functions are ready.
local RHCF = CFrame.fromEulerAnglesXYZ(0, 1.6, 0)
local LHCF = CFrame.fromEulerAnglesXYZ(0, -1.6, 0)
local storehumanoidWS = 16

function createBGCircle(size,parent,color)
local bgui = Instance.new("BillboardGui",parent)
bgui.Size = UDim2.new(size, 0, size, 0)
local imgc = Instance.new("ImageLabel",bgui)
imgc.BackgroundTransparency = 1
imgc.ImageTransparency = 0
imgc.Size = UDim2.new(1,0,1,0)
imgc.Image = "rbxassetid://997291547" --997291547,521073910
imgc.ImageColor3 = color
return bgui,imgc
end

function symbolizeBlink(guipar,size,img,color,bonussize,vol,pit,soundid,spar,rotationenabled,rotsp,delay)
local bgui,imgc = createBGCircle(size,guipar,color)
bgui.AlwaysOnTop = true
imgc.Image = "rbxassetid://" ..img
local rrot = math.random(1,2)
CFuncs["Sound"].Create("rbxassetid://" ..soundid, spar, vol,pit)
coroutine.resume(coroutine.create(function()
for i = 0, 24*delay do
swait()
if rotationenabled == true then
if rrot == 1 then
imgc.Rotation = imgc.Rotation + rotsp
elseif rrot == 2 then
imgc.Rotation = imgc.Rotation - rotsp
end
end
bgui.Size = bgui.Size + UDim2.new(1*bonussize/delay,0,1*bonussize/delay,0)
imgc.ImageTransparency = imgc.ImageTransparency + 0.04/delay
end
bgui:Destroy()
end))
end

function tbeam(col1,col2)
	local lookavec = 0 
	local mult = 1
local elocacenter = CreateParta(char,1,1,"SmoothPlastic",BrickColor.random())
elocacenter.Anchored = true
elocacenter.CFrame = root.CFrame
local eloca1 = CreateParta(elocacenter,1,1,"SmoothPlastic",BrickColor.random())
eloca1.Anchored = true
eloca1.CFrame = elocacenter.CFrame
local at1 = Instance.new("Attachment",eloca1)
at1.Position = vt(0,10,0)
local at2 = Instance.new("Attachment",eloca1)
at2.Position = vt(0,-10,0)
local trl = Instance.new('Trail',eloca1)
trl.Attachment0 = at1
trl.Attachment1 = at2
trl.Texture = "rbxassetid://01049219073"
trl.LightEmission = 1
trl.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0),NumberSequenceKeypoint.new(1, 1)})
trl.Color = ColorSequence.new(col1.Color)
trl.Lifetime = 4
local eff = Instance.new("ParticleEmitter",eloca1)
eff.Texture = "rbxassetid://00"
eff.LightEmission = 1
eff.Color = ColorSequence.new(col1.Color)
eff.Rate = 500000
eff.Lifetime = NumberRange.new(0.5,1)
eff.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,20,0),NumberSequenceKeypoint.new(0.2,2,0),NumberSequenceKeypoint.new(0.8,2,0),NumberSequenceKeypoint.new(1,0,0)})
eff.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,1,0),NumberSequenceKeypoint.new(0.1,0,0),NumberSequenceKeypoint.new(0.8,0,0),NumberSequenceKeypoint.new(1,1,0)})
eff.Speed = NumberRange.new(20,250)
eff.Drag = 5
eff.Rotation = NumberRange.new(-500,500)
eff.VelocitySpread = 9000
eff.RotSpeed = NumberRange.new(-50,50)
local eloca2 = eloca1:Clone()
eloca2.Parent = elocacenter
local eloca3 = CreateParta(elocacenter,1,1,"SmoothPlastic",BrickColor.random())
eloca3.Anchored = true
eloca3.CFrame = elocacenter.CFrame
local at1 = Instance.new("Attachment",eloca3)
at1.Position = vt(0,10,0)
local at2 = Instance.new("Attachment",eloca3)
at2.Position = vt(0,-10,0)
local trl = Instance.new('Trail',eloca3)
trl.Attachment0 = at1
trl.Attachment1 = at2
trl.Texture = "rbxassetid://01049219073"
trl.LightEmission = 1
trl.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0),NumberSequenceKeypoint.new(1, 1)})
trl.Color = ColorSequence.new(col2.Color)
trl.Lifetime = 4
local eff = Instance.new("ParticleEmitter",eloca3)
eff.Texture = "rbxassetid://00"
eff.LightEmission = 1
eff.Color = ColorSequence.new(col2.Color)
eff.Rate = 500000
eff.Lifetime = NumberRange.new(0.5,1)
eff.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,20,0),NumberSequenceKeypoint.new(0.2,2,0),NumberSequenceKeypoint.new(0.8,2,0),NumberSequenceKeypoint.new(1,0,0)})
eff.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,1,0),NumberSequenceKeypoint.new(0.1,0,0),NumberSequenceKeypoint.new(0.8,0,0),NumberSequenceKeypoint.new(1,1,0)})
eff.Speed = NumberRange.new(20,250)
eff.Drag = 5
eff.Rotation = NumberRange.new(-500,500)
eff.VelocitySpread = 9000
eff.RotSpeed = NumberRange.new(-50,50)
local eloca4 = eloca3:Clone()
eloca4.Parent = elocacenter
elocacenter.CFrame = root.CFrame
sphere2(6,"Add",root.CFrame*CFrame.Angles(0,0,0),vt(1,10000,1),0.9,7,0.9,col2)
sphere2(5,"Add",root.CFrame*CFrame.Angles(0,0,0),vt(1,10000,1),0.8,7,0.8,col1)
sphere2(4,"Add",root.CFrame*CFrame.Angles(0,0,0),vt(1,10000,1),0.6,7,0.6,col2)
sphere2(3,"Add",root.CFrame*CFrame.Angles(0,0,0),vt(1,10000,1),0.5,7,0.5,col1)
local effx = Instance.new("ParticleEmitter",root)
effx.Texture = "rbxassetid://00" -- 144580273 74564879
effx.LightEmission = 1
effx.Color = ColorSequence.new(col1.Color)
effx.Rate = 500000
effx.Lifetime = NumberRange.new(0.25,0.75)
effx.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(1,200,0)})
effx.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,1,0),NumberSequenceKeypoint.new(0.1,0.5,0),NumberSequenceKeypoint.new(0.8,0,0),NumberSequenceKeypoint.new(1,1,0)})
effx.Speed = NumberRange.new(0,10)
effx.Drag = 5
effx.Rotation = NumberRange.new(-500,500)
effx.VelocitySpread = 9000
effx.RotSpeed = NumberRange.new(-50,50)
local effx2 = Instance.new("ParticleEmitter",root)
effx2.Texture = "rbxassetid://00"
effx2.LightEmission = 1
effx2.Color = ColorSequence.new(col1.Color)
effx2.Rate = 500000
effx2.Lifetime = NumberRange.new(1,2)
effx2.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,200,0),NumberSequenceKeypoint.new(0.1,50,0),NumberSequenceKeypoint.new(0.8,25,0),NumberSequenceKeypoint.new(1,0,0)})
effx2.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(0.1,0,0),NumberSequenceKeypoint.new(0.8,0,0),NumberSequenceKeypoint.new(1,1,0)})
effx2.Speed = NumberRange.new(50,1200)
effx2.Drag = 5
effx2.Rotation = NumberRange.new(-500,500)
effx2.VelocitySpread = 9000
effx2.RotSpeed = NumberRange.new(-50,50)
local effx3 = effx2:Clone()
effx3.Parent = root
effx3.Color = ColorSequence.new(col2.Color)
symbolizeBlink(root,0,144580273,col1.Color,20,0,0,0,root,true,-5,2)
symbolizeBlink(root,0,144580273,col2.Color,25,0,0,0,root,true,-5,1)
for i = 0, 1 do
CFuncs["Sound"].Create("rbxassetid://763717897", root, 5, 1.25)
CFuncs["Sound"].Create("rbxassetid://1192402877", root, 5,0.75)
CFuncs["Sound"].Create("rbxassetid://1664711478", root, 2.5,1)
CFuncs["Sound"].Create("rbxassetid://763718160", root, 5, 0.75)
end
coroutine.resume(coroutine.create(function()
	wait(0.05)
	effx.Enabled = false
	wait(0.1)
	effx2.Enabled = false
	effx3.Enabled = false
end))
coroutine.resume(coroutine.create(function()
for i = 0, 9, 0.1 do
	swait()
	mult = mult + 0.5
lookavec = lookavec + 0.1*mult
elocacenter.CFrame = elocacenter.CFrame*CFrame.Angles(0,math.rad(5*mult/10),0)
eloca1.CFrame = elocacenter.CFrame*CFrame.new(40+lookavec/5,-15+lookavec*2,0)
eloca2.CFrame = elocacenter.CFrame*CFrame.new(-40-lookavec/5,-15+lookavec*2,0)
eloca3.CFrame = elocacenter.CFrame*CFrame.new(0,-15+lookavec*2,40+lookavec/5)
eloca4.CFrame = elocacenter.CFrame*CFrame.new(0,-15+lookavec*2,-40-lookavec/5)
end
for i,v in pairs(elocacenter:GetDescendants()) do
	if v:IsA("ParticleEmitter") then
		v.Enabled = false
	end
end
wait(6)
effx:Destroy()
effx2:Destroy()
effx3:Destroy()
elocacenter:Destroy()
end))
end

function RecolorThing(one,two,three,four,five,exonetran,exone,extwotran,extwo,secondaryenabled,sectrailenabled)
for i, v in pairs(mw2:GetChildren()) do
if v:IsA("Part") then
v.BrickColor = one
v.Material = "Neon"
end
end
tbeam(one,two)
CFuncs["EchoSound"].Create("rbxassetid://3", root, 1, 1,0,10,0.25,0.25,1)
tr1.Color = ColorSequence.new(one.Color)
tr2.Color = ColorSequence.new(one.Color)
tr3.Color = ColorSequence.new(one.Color)
for i, v in pairs(mw1:GetChildren()) do
if v:IsA("Part") then
if secondaryenabled == false then
v.Transparency = 1
elseif secondaryenabled == true then
v.Transparency = 0
end
v.BrickColor = two
v.Material = "Neon"
end
end
if secondaryenabled == false then
tl1.Enabled = false
tl2.Enabled = false
tl3.Enabled = false
elseif secondaryenabled == true then
tl1.Enabled = true
tl2.Enabled = true
tl3.Enabled = true
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
v.Transparency = exonetran
v.BrickColor = exone
v.Material = "Neon"
end
end
if sectrailenabled == true then
tl4.Enabled = true
tl5.Enabled = true
tl6.Enabled = true
tr4.Enabled = true
tr5.Enabled = true
tr6.Enabled = true
tl4.Color = ColorSequence.new(exone.Color)
tl5.Color = ColorSequence.new(exone.Color)
tl6.Color = ColorSequence.new(exone.Color)
tr4.Color = ColorSequence.new(extwo.Color)
tr5.Color = ColorSequence.new(extwo.Color)
tr6.Color = ColorSequence.new(extwo.Color)
elseif sectrailenabled == false then
tl4.Enabled = false
tl5.Enabled = false
tl6.Enabled = false
tr4.Enabled = false
tr5.Enabled = false
tr6.Enabled = false
end
for i, v in pairs(extrawingmod2:GetChildren()) do
if v:IsA("Part") then
v.Transparency = extwotran
v.BrickColor = extwo
v.Material = "Neon"
end
end
end


function normalmog()
attack = true
hum.WalkSpeed = 0
CFuncs["Sound"].Create("rbxassetid://136007472", root, 5, 1.25)
for i = 0,6,0.1 do
swait()
sphereMK(2.5,-1.5,"Add",root.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),3.5,3.5,45,-0.035,MAINRUINCOLOR,100)
slash(math.random(30,60)/10,5,true,"Round","Add","In",root.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(0.5,0.01,0.5),-0.5,MAINRUINCOLOR)
RH.C0=clerp(RH.C0,cf(1,-1 - 0.05 * math.cos(sine / 28),0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-2.5),math.rad(0),math.rad(30)),.2)
LH.C0=clerp(LH.C0,cf(-1,-1 - 0.05 * math.cos(sine / 28),0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-2.5),math.rad(0),math.rad(-30)),.2)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,-0.3,-0.15)*angles(math.rad(30),math.rad(0),math.rad(0)),.2)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(30),math.rad(0),math.rad(0 - 5 * math.cos(sine / 0.2))),.2)
RW.C0=clerp(RW.C0,cf(1.05,0.4,-0.5)*angles(math.rad(140),math.rad(0),math.rad(-50)),.2)
LW.C0=clerp(LW.C0,cf(-1.05,0.4,-0.5)*angles(math.rad(140),math.rad(0),math.rad(50)),.2)
end
CFuncs["Sound"].Create("rbxassetid://206082327", root, 7.5,1)
CFuncs["Sound"].Create("rbxassetid://847061203", root, 10,1)
CFuncs["Sound"].Create("rbxassetid://239000203", root, 7.5,1)
CFuncs["Sound"].Create("rbxassetid://579687077", root, 7.5,0.75)
CFuncs["Sound"].Create("rbxassetid://1368637781", root, 10,1)
CFuncs["Sound"].Create("rbxassetid://763718160", root, 7.5, 1.1)
CFuncs["Sound"].Create("rbxassetid://782353443", root, 7.5, 1)
rainbowmode = false
chaosmode = false
ModeOfGlitch = 1
storehumanoidWS = 16
newTheme("rbxassetid://614032233",48.6,1,1.25)
RecolorTextAndRename("DESCLERATION",Color3.new(0.25,0,0),Color3.new(1,0,0),"Antique")
CameraEnshaking(5,2.5)
MAINRUINCOLOR = BrickColor.new("Really red")
sphere(2.5,"Add",root.CFrame,vt(0,0,0),1,MAINRUINCOLOR)
for i = 0, 49 do
PixelBlock(1,math.random(1,20),"Add",root.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),2,2,2,0.04,MAINRUINCOLOR,0)
end
for i = 0, 24 do
sphere2(2,"Add",tors.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(1,1,1),-0.01,7,-0.01,MAINRUINCOLOR)
slash(math.random(10,30)/10,5,true,"Round","Add","Out",root.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(0.01,0.01,0.01),math.random(150,350)/250,BrickColor.new("White"))
end
for i = 0,3,0.1 do
sphereMK(2.5,-1,"Add",root.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),2.5,2.5,25,-0.025,MAINRUINCOLOR,0)
end
RecolorThing(MAINRUINCOLOR,MAINRUINCOLOR,MAINRUINCOLOR,MAINRUINCOLOR,MAINRUINCOLOR,1,MAINRUINCOLOR,1,MAINRUINCOLOR,false,false)
for i = 0,2,0.1 do
swait()
RH.C0=clerp(RH.C0,cf(1,-1 - 0.05 * math.cos(sine / 28),0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-2.5),math.rad(0),math.rad(-30)),.5)
LH.C0=clerp(LH.C0,cf(-1,-1 - 0.05 * math.cos(sine / 28),0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-2.5),math.rad(0),math.rad(30)),.5)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0.3,-0.15)*angles(math.rad(-30),math.rad(0),math.rad(0)),.5)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(-30),math.rad(0),math.rad(0 - 2.5 * math.cos(sine / 0.2))),.5)
RW.C0=clerp(RW.C0,cf(1.45,0.4,0)*angles(math.rad(-20),math.rad(0 - 2 * math.cos(sine / 0.2)),math.rad(80 + 2 * math.cos(sine / 0.2))),.5)
LW.C0=clerp(LW.C0,cf(-1.45,0.4,0)*angles(math.rad(-20),math.rad(0 + 2 * math.cos(sine / 0.2)),math.rad(-80 - 2 * math.cos(sine / 0.2))),.5)
end
hum.WalkSpeed = storehumanoidWS
attack = false
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
        hite.Transparency = 1
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
hum.WalkSpeed = 2
local keptcolor = MAINRUINCOLOR
CFuncs["Sound"].Create("rbxassetid://847061203", root, 2, 1)
sphere2(5,"Add",rarm.CFrame*CFrame.new(0,-2,0)*CFrame.Angles(math.rad(90),0,0),vt(1,1,1),0.1,0.1,0.1,keptcolor,keptcolor.Color)
sphere2(5,"Add",rarm.CFrame*CFrame.new(0,-2,0)*CFrame.Angles(math.rad(90),0,0),vt(1,1,1),0.2,0.2,0.2,keptcolor,keptcolor.Color)
for i = 0, 14 do
PixelBlock(1,math.random(1,3),"Add",rarm.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),1,1,1,0.02,keptcolor,0)
end
for i = 0,1,0.1 do
swait()
sphere2(8,"Add",larm.CFrame*CFrame.new(0,-2,0)*CFrame.Angles(math.rad(90),0,0),vt(2.25,0.1,2.25),0.01,0.01,0.01,keptcolor,keptcolor.Color)
RH.C0=clerp(RH.C0,cf(1,-1,0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-2.5),math.rad(0),math.rad(-5)),.3)
LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-2.5),math.rad(30),math.rad(0)),.3)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(60)),.3)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(20),math.rad(0),math.rad(-30)),.3)
RW.C0=clerp(RW.C0,cf(1.15,0.5,-0.5)*angles(math.rad(90),math.rad(0),math.rad(-60)),.3)
LW.C0=clerp(LW.C0,cf(-1.15,0.5,0)*angles(math.rad(-20),math.rad(0),math.rad(-10)),.3)
end
for i = 0, 1 do
CFuncs["Sound"].Create("rbxassetid://763755889", root, 3,1.1)
for i = 0,1,0.6 do
swait()
sphere2(8,"Add",rarm.CFrame*CFrame.new(0,-2,0)*CFrame.Angles(math.rad(90),0,0),vt(2.25,0.1,2.25),0.01,0.01,0.01,keptcolor,keptcolor.Color)
slash(math.random(15,30)/10,5,true,"Round","Add","Out",root.CFrame*CFrame.Angles(math.rad(math.random(-5,5)),math.rad(math.random(-5,5)),math.rad(math.random(-5,5))),vt(0.05,0.01,0.05),math.random(25,75)/250,BrickColor.new("White"))
RH.C0=clerp(RH.C0,cf(1,-1,0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-2.5),math.rad(0),math.rad(-5)),.6)
LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-2.5),math.rad(30),math.rad(0)),.6)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.6)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(20),math.rad(0),math.rad(-30)),.6)
RW.C0=clerp(RW.C0,cf(1.15,0.5,-0.5)*angles(math.rad(90),math.rad(0),math.rad(-60)),.6)
LW.C0=clerp(LW.C0,cf(-1.15,0.5,0)*angles(math.rad(-20),math.rad(0),math.rad(-10)),.6)
end
for i = 0,1,0.6 do
swait()
sphere2(8,"Add",rarm.CFrame*CFrame.new(0,-2,0)*CFrame.Angles(math.rad(90),0,0),vt(2.25,0.1,2.25),0.01,0.01,0.01,keptcolor,keptcolor.Color)
slash(math.random(15,30)/10,5,true,"Round","Add","Out",root.CFrame*CFrame.Angles(math.rad(math.random(-5,5)),math.rad(math.random(-5,5)),math.rad(math.random(-5,5))),vt(0.05,0.01,0.05),math.random(25,75)/250,BrickColor.new("White"))
RH.C0=clerp(RH.C0,cf(1,-1,0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-2.5),math.rad(0),math.rad(-5)),.6)
LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-2.5),math.rad(30),math.rad(0)),.6)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(-90)),.6)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(20),math.rad(0),math.rad(-30)),.6)
RW.C0=clerp(RW.C0,cf(1.15,0.5,-0.5)*angles(math.rad(90),math.rad(0),math.rad(-60)),.6)
LW.C0=clerp(LW.C0,cf(-1.15,0.5,0)*angles(math.rad(-20),math.rad(0),math.rad(-10)),.6)
end
for i = 0,1,0.6 do
swait()
sphere2(8,"Add",rarm.CFrame*CFrame.new(0,-2,0)*CFrame.Angles(math.rad(90),0,0),vt(2.25,0.1,2.25),0.01,0.01,0.01,keptcolor,keptcolor.Color)
slash(math.random(15,30)/10,5,true,"Round","Add","Out",root.CFrame*CFrame.Angles(math.rad(math.random(-5,5)),math.rad(math.random(-5,5)),math.rad(math.random(-5,5))),vt(0.05,0.01,0.05),math.random(25,75)/250,BrickColor.new("White"))
RH.C0=clerp(RH.C0,cf(1,-1,0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-2.5),math.rad(0),math.rad(-5)),.6)
LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-2.5),math.rad(30),math.rad(0)),.6)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(-180)),.6)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(20),math.rad(0),math.rad(-30)),.6)
RW.C0=clerp(RW.C0,cf(1.15,0.5,-0.5)*angles(math.rad(90),math.rad(0),math.rad(-60)),.6)
LW.C0=clerp(LW.C0,cf(-1.15,0.5,0)*angles(math.rad(-20),math.rad(0),math.rad(-10)),.6)
end
for i = 0,1,0.6 do
swait()
sphere2(8,"Add",rarm.CFrame*CFrame.new(0,-2,0)*CFrame.Angles(math.rad(90),0,0),vt(2.25,0.1,2.25),0.01,0.01,0.01,keptcolor,keptcolor.Color)
slash(math.random(15,30)/10,5,true,"Round","Add","Out",root.CFrame*CFrame.Angles(math.rad(math.random(-5,5)),math.rad(math.random(-5,5)),math.rad(math.random(-5,5))),vt(0.05,0.01,0.05),math.random(25,75)/250,BrickColor.new("White"))
RH.C0=clerp(RH.C0,cf(1,-1,0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-2.5),math.rad(0),math.rad(-5)),.6)
LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-2.5),math.rad(30),math.rad(0)),.6)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(-270)),.6)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(20),math.rad(0),math.rad(-30)),.6)
RW.C0=clerp(RW.C0,cf(1.15,0.5,-0.5)*angles(math.rad(90),math.rad(0),math.rad(-60)),.6)
LW.C0=clerp(LW.C0,cf(-1.15,0.5,0)*angles(math.rad(-20),math.rad(0),math.rad(-10)),.6)
end
local rot = 0
local dis = CreateParta(char,0.5,1,"Neon",keptcolor)
CFuncs["EchoSound"].Create("rbxassetid://763718160", dis, 3, 1.1,0,10,0.15,0.5,1)
dis.CFrame = root.CFrame*CFrame.new(0,2,-3)
CreateMesh(dis,"Sphere",10,1,10)
local at1 = Instance.new("Attachment",dis)
at1.Position = vt(-5,0,0)
local at2 = Instance.new("Attachment",dis)
at2.Position = vt(5,0,0)
local trl = Instance.new('Trail',dis)
trl.Attachment0 = at1
trl.Attachment1 = at2
trl.Texture = "rbxassetid://01049219073"
trl.LightEmission = 1
trl.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0),NumberSequenceKeypoint.new(1, 1)})
trl.Color = ColorSequence.new(dis.Color)
trl.Lifetime = 0.6
local a = Instance.new("Part",workspace)
	a.Name = "Direction"	
	a.Anchored = true
	a.BrickColor = bc("Bright red")
a.Material = "Neon"
a.Transparency = 1
	a.CanCollide = false
	local ray = Ray.new(
	    dis.CFrame.p,                           -- origin
	    (mouse.Hit.p - dis.CFrame.p).unit * 500 -- direction
	) 
	local ignore = dis
	local hit, position, normal = workspace:FindPartOnRay(ray, ignore)
	a.BottomSurface = 10
	a.TopSurface = 10
	local distance = (dis.CFrame.p - position).magnitude
	a.Size = Vector3.new(0.1, 0.1, 0.1)
	a.CFrame = CFrame.new(dis.CFrame.p, position) * CFrame.new(0, 0, 0)
dis.CFrame = a.CFrame
dis.CFrame = dis.CFrame*CFrame.Angles(0,math.rad(rot),0)
a:Destroy()
local bv = Instance.new("BodyVelocity")
bv.maxForce = Vector3.new(1e9, 1e9, 1e9)
bv.velocity = dis.CFrame.lookVector*250
bv.Parent = dis
game:GetService("Debris"):AddItem(dis, 5)
local hitted = false
coroutine.resume(coroutine.create(function()
dis.Touched:connect(function(hit) 
	if hitted == false and hit.Parent ~= char then
	hitted = true
	CFuncs["EchoSound"].Create("rbxassetid://782200047", dis, 7, 1.1,0,10,0.15,0.5,1)
	MagniDamage(dis, 30, 33,56, 0, "Normal")
	sphere2(8,"Add",dis.CFrame,vt(10,1,10),1,0.1,1,keptcolor,keptcolor.Color)
	sphere2(4,"Add",dis.CFrame,vt(1,1,1),0.5,0.5,0.5,keptcolor,keptcolor.Color)
	sphere2(3,"Add",dis.CFrame,vt(1,1,1),0.5,0.5,0.5,keptcolor,keptcolor.Color)
	coroutine.resume(coroutine.create(function()
local eff = Instance.new("ParticleEmitter",dis)
eff.Texture = "rbxassetid://02344870656"
eff.LightEmission = 1
eff.Color = ColorSequence.new(dis.Color)
eff.Rate = 10000000
eff.Enabled = true
eff.EmissionDirection = "Front"
eff.Lifetime = NumberRange.new(1)
eff.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,75,0),NumberSequenceKeypoint.new(0.1,20,0),NumberSequenceKeypoint.new(0.8,40,0),NumberSequenceKeypoint.new(1,60,0)})
eff.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0.8,0),NumberSequenceKeypoint.new(0.5,0,0),NumberSequenceKeypoint.new(1,1,0)})
eff.Speed = NumberRange.new(150)
eff.Drag = 5
eff.Rotation = NumberRange.new(-500,500)
eff.SpreadAngle = Vector2.new(0,900)
eff.RotSpeed = NumberRange.new(-500,500)
wait(0.2)
eff.Enabled = false
	end))
	coroutine.resume(coroutine.create(function()
		for i = 0, 9 do
local disr = CreateParta(char,1,1,"Neon",keptcolor)
disr.CFrame = dis.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360)))
local at1 = Instance.new("Attachment",disr)
at1.Position = vt(-5,0,0)
local at2 = Instance.new("Attachment",disr)
at2.Position = vt(5,0,0)
local trl = Instance.new('Trail',disr)
trl.Attachment0 = at1
trl.FaceCamera = true
trl.Attachment1 = at2
trl.Texture = "rbxassetid://02342682798"
trl.LightEmission = 1
trl.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0),NumberSequenceKeypoint.new(1, 1)})
trl.Color = ColorSequence.new(keptcolor.Color)
trl.Lifetime = 0.5
local bv = Instance.new("BodyVelocity")
bv.maxForce = Vector3.new(1e9, 1e9, 1e9)
bv.velocity = disr.CFrame.lookVector*math.random(50,200)
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
local eff = Instance.new("ParticleEmitter",dis)
eff.Texture = "rbxassetid://02273224484"
eff.LightEmission = 1
eff.Color = ColorSequence.new(keptcolor.Color)
eff.Rate = 500000
eff.Lifetime = NumberRange.new(0.5,2)
eff.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,20,0),NumberSequenceKeypoint.new(0.2,2,0),NumberSequenceKeypoint.new(0.8,2,0),NumberSequenceKeypoint.new(1,0,0)})
eff.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,1,0),NumberSequenceKeypoint.new(0.1,0,0),NumberSequenceKeypoint.new(0.8,0,0),NumberSequenceKeypoint.new(1,1,0)})
eff.Speed = NumberRange.new(20,250)
eff.Drag = 5
eff.Rotation = NumberRange.new(-500,500)
eff.VelocitySpread = 9000
eff.RotSpeed = NumberRange.new(-50,50)
wait(0.25)
eff.Enabled = false
end))
	for i = 0, 9 do
		slash(math.random(10,20)/10,5,true,"Round","Add","Out",dis.CFrame*CFrame.Angles(math.rad(math.random(-5,5)),math.rad(math.random(-5,5)),math.rad(math.random(-5,5))),vt(0.01,0.01,0.01),math.random(100,200)/250,BrickColor.new("White"))
	end
for i = 0, 19 do
PixelBlock(1,math.random(5,20),"Add",dis.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),4,4,4,0.08,keptcolor,0)
end
coroutine.resume(coroutine.create(function()
for i = 0, 19 do
swait()
hum.CameraOffset = vt(math.random(-10,10)/70,math.random(-10,10)/70,math.random(-10,10)/70)
end
hum.CameraOffset = vt(0,0,0)
end))
dis.Anchored = true
dis.Transparency = 1
wait(8)
dis:Destroy()
end
end)
end))
rot = rot - 15
end
for i = 0,2,0.1 do
swait()
RH.C0=clerp(RH.C0,cf(1,-1,0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-2.5),math.rad(-30),math.rad(0)),.3)
LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-2.5),math.rad(0),math.rad(5)),.3)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(-60)),.3)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(10),math.rad(0),math.rad(50)),.3)
RW.C0=clerp(RW.C0,cf(1.5,0.5,0)*angles(math.rad(90),math.rad(0),math.rad(60)),.3)
LW.C0=clerp(LW.C0,cf(-1.5,0.5,0)*angles(math.rad(-20),math.rad(0),math.rad(-10)),.3)
end
attack = false
hum.WalkSpeed = storehumanoidWS
end

function attackthree()
attack = true
local keptcolor = MAINRUINCOLOR
CFuncs["Sound"].Create("rbxassetid://136007472", root, 2, 1.5)
	for i = 0,2,0.1 do
		swait()
		sphere2(5,"Add",larm.CFrame*CFrame.new(0,-1.5,0),vt(1,1,1),0.025,0.025,0.025,MAINRUINCOLOR,MAINRUINCOLOR.Color)
RootJoint.C0 = clerp(RootJoint.C0,RootCF*cf(0,0,0)* angles(math.rad(10),math.rad(0),math.rad(50)),0.3)
Torso.Neck.C0 = clerp(Torso.Neck.C0,necko *angles(math.rad(5),math.rad(0),math.rad(-50)),.3)
RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5, 0) * angles(math.rad(80), math.rad(10), math.rad(60)), 0.3)
LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5, 0) * angles(math.rad(140), math.rad(0), math.rad(-70)), 0.3)
RH.C0=clerp(RH.C0,cf(1,-1,0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-1.5),math.rad(-50),math.rad(-10)),.3)
LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-2.5),math.rad(0),math.rad(40)),.3)
	end
CFuncs["Sound"].Create("rbxassetid://763716870", root, 3,1)
CFuncs["Sound"].Create("rbxassetid://782353443", root, 5,0.9)
CFuncs["Sound"].Create("rbxassetid://782225570", root, 4,0.5)
CFuncs["Sound"].Create("rbxassetid://763717569", root, 3,1)
sphere2(5,"Add",root.CFrame,vt(1,1,1),1,1,1,MAINRUINCOLOR)
sphere2(5,"Add",root.CFrame,vt(1,1,1),0.5,0.5,0.5,MAINRUINCOLOR)
for i = 0, 24 do
		slash(math.random(10,50)/10,5,true,"Round","Add","Out",root.CFrame*CFrame.Angles(math.rad(90),math.rad(math.random(-360,360)),math.rad(0)),vt(0.01,0.01,0.01),math.random(50,200)/250,BrickColor.new("White"))
end
for i = 0,4,0.1 do
		swait()
		root.CFrame = root.CFrame + root.CFrame.lookVector*5
		local dis = CreateParta(char,0.25,1,"Neon",MAINRUINCOLOR)
CreateMesh(dis,"Sphere",1,1,1)
dis.Anchored = true
dis.CFrame = larm.CFrame*CFrame.new(0,-3,0)
sphere2(5,"Add",dis.CFrame,vt(1,1,1),0.1,0.1,0.1,dis.BrickColor,dis.Color)
coroutine.resume(coroutine.create(function()
	swait(30)
	dis.Transparency = 1
coroutine.resume(coroutine.create(function()
for i = 0, 19 do
swait()
hum.CameraOffset = vt(math.random(-10,10)/40,math.random(-10,10)/40,math.random(-10,10)/40)
end
hum.CameraOffset = vt(0,0,0)
end))
coroutine.resume(coroutine.create(function()
local eff = Instance.new("ParticleEmitter",dis)
eff.Texture = "rbxassetid://02273224484"
eff.LightEmission = 1
eff.Color = ColorSequence.new(dis.Color)
eff.Rate = 500000
eff.Lifetime = NumberRange.new(0.5,2)
eff.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,20,0),NumberSequenceKeypoint.new(0.2,2,0),NumberSequenceKeypoint.new(0.8,2,0),NumberSequenceKeypoint.new(1,0,0)})
eff.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,1,0),NumberSequenceKeypoint.new(0.1,0,0),NumberSequenceKeypoint.new(0.8,0,0),NumberSequenceKeypoint.new(1,1,0)})
eff.Speed = NumberRange.new(50,450)
eff.Drag = 5
eff.Rotation = NumberRange.new(-500,500)
eff.VelocitySpread = 9000
eff.RotSpeed = NumberRange.new(-50,50)
wait(0.125)
eff.Enabled = false
end))
MagniDamage(dis, 30, 45,50, 0, "Normal")
    for i = 0, 2 do
		slash(math.random(10,80)/10,5,true,"Round","Add","Out",dis.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(0.01,0.01,0.01),math.random(50,150)/250,dis.BrickColor)
	end
	CFuncs["Sound"].Create("rbxassetid://782353117", dis, 1,1)
	CFuncs["Sound"].Create("rbxassetid://1666361078", dis, 1,1.5)
	CFuncs["Sound"].Create("rbxassetid://782353443", dis, 2,1.65)
	sphere2(3,"Add",dis.CFrame,vt(1,1,1),0.4,0.4,0.4,dis.BrickColor,dis.Color)
end))
game:GetService("Debris"):AddItem(dis, 5)
RootJoint.C0 = clerp(RootJoint.C0,RootCF*cf(0,0,0)* angles(math.rad(89),math.rad(-8),math.rad(-5)),0.5)
Torso.Neck.C0 = clerp(Torso.Neck.C0,necko *angles(math.rad(-30),math.rad(0),math.rad(8)),.5)
RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5, 0) * angles(math.rad(-14), math.rad(1), math.rad(17)), 0.5)
LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.85, 0) * angles(math.rad(180), math.rad(0), math.rad(-8)), 0.5)
RH.C0=clerp(RH.C0,cf(1,-0.5,-0.6)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-8),math.rad(0),math.rad(-20)),.5)
LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(9),math.rad(0),math.rad(20)),.5)
	end
attack = false
end
----------------------------------- Abilities

local ActiveGia = false
function THEHELLITSTHATBIG()
ActiveGia = true
attack = true
hum.WalkSpeed = 0
	for i = 0,2,0.1 do
		swait()
            RootJoint.C0 = clerp(RootJoint.C0,RootCF*cf(0,0,0)* angles(math.rad(-20),math.rad(0),math.rad(0)),0.2)
Torso.Neck.C0 = clerp(Torso.Neck.C0,necko *angles(math.rad(-15),math.rad(0),math.rad(0)),.2)
RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5, 0) * angles(math.rad(90), math.rad(0), math.rad(100)), 0.2)
LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5, 0) * angles(math.rad(90), math.rad(0), math.rad(-100)), 0.2)
RH.C0=clerp(RH.C0,cf(1,-1 - 0.05 * math.cos(sine / 25),0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-0.5),math.rad(0),math.rad(-20)),.2)
LH.C0=clerp(LH.C0,cf(-1,-1 - 0.05 * math.cos(sine / 25),0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-2.5),math.rad(10),math.rad(20)),.2)
	end
for i = 0,1,0.1 do
torsweld.C1=clerp(torsweld.C1,cf(0,5*4,-8)*angles(math.rad(0),math.rad(0),math.rad(0)),1)
larmsweld.C1=clerp(larmsweld.C1,cf(1.65*8,0.45*8,0)*angles(math.rad(0),math.rad(0),math.rad(20)),1)
rarmsweld.C1=clerp(rarmsweld.C1,cf(-1.65*8,0.45*8,0)*angles(math.rad(0),math.rad(0),math.rad(-20)),1)
llegsweld.C1=clerp(llegsweld.C1,cf(0.5*8,2*8,0)*angles(math.rad(0),math.rad(0),math.rad(0)),1)
rlegsweld.C1=clerp(rlegsweld.C1,cf(-0.5*8,2*8,0)*angles(math.rad(0),math.rad(0),math.rad(0)),1)
hedsweld.C1=clerp(hedsweld.C1,cf(0,-1.5*8,0)*angles(math.rad(-10),math.rad(0),math.rad(0)),1)
end
CFuncs["Sound"].Create("rbxassetid://528589382", sectors, 5, 1)
secrleg.Transparency = 0.5
seclleg.Transparency = 0.5
secrarm.Transparency = 0.5
seclarm.Transparency = 0.5
seched.Transparency = 0.5
sectors.Transparency = 0.5
for i = 0,25,0.1 do
swait()
PixelBlockNeg(1,math.random(1,5),"Add",sectors.CFrame*CFrame.new(math.random(-25,25),0,math.random(-25,25))*CFrame.Angles(math.rad(90 + math.random(-10,10)),math.rad(math.random(-10,10)),math.rad(math.random(-10,10))),5,5,5,0.1,MAINRUINCOLOR,-10)
torsweld.C1=clerp(torsweld.C1,cf(0,-2 + 0.25 * math.cos(sine / 32) ,-8)*angles(math.rad(0),math.rad(0),math.rad(0)),.025)
larmsweld.C1=clerp(larmsweld.C1,cf(1.65*8,0.45*8,0)*angles(math.rad(0),math.rad(0),math.rad(20)),0.025)
rarmsweld.C1=clerp(rarmsweld.C1,cf(-1.65*8,0.45*8,0)*angles(math.rad(0),math.rad(0),math.rad(-20)),0.025)
llegsweld.C1=clerp(llegsweld.C1,cf(0.5*8,2*8,0)*angles(math.rad(0),math.rad(0),math.rad(0)),0.025)
rlegsweld.C1=clerp(rlegsweld.C1,cf(-0.5*8,2*8,0)*angles(math.rad(0),math.rad(0),math.rad(0)),0.025)
hedsweld.C1=clerp(hedsweld.C1,cf(0,-1.5*8,0.2)*angles(math.rad(-10),math.rad(0),math.rad(0)),0.025)
end
--[[secrleg.Transparency = 1
seclleg.Transparency = 1
secrarm.Transparency = 1
seclarm.Transparency = 1
seched.Transparency = 1
sectors.Transparency = 1]]--
torsweld.Part0 = root
hum.WalkSpeed = storehumanoidWS
attack = false
end

function DESCLEAREDBURST()
attack = true
keptcolor = MAINRUINCOLOR
hum.WalkSpeed = 0
local vel = Instance.new("BodyPosition", root)
vel.P = 10000
vel.D = 1000
vel.maxForce = Vector3.new(50000000000, 10e10, 50000000000)
vel.position = root.CFrame.p + vt(0,250,0)
CFuncs["Sound"].Create("rbxassetid://1295446488", char, 5, 0.5)
CFuncs["Sound"].Create("rbxassetid://1368598393", char, 7.5, 0.5)
CFuncs["EchoSound"].Create("rbxassetid://1718412034", char, 4, 1,0,10,0.15,0.5,1)
for i = 0, 49 do
slash(math.random(10,100)/10,3,true,"Round","Add","Out",root.CFrame*CFrame.new(0,-3,0)*CFrame.Angles(math.rad(math.random(-10,10)),math.rad(math.random(-360,360)),math.rad(math.random(-10,10))),vt(0.05,0.01,0.05),math.random(25,500)/250,BrickColor.new("White"))
end
for x = 0, 10 do
for i = 0, 1, 0.6 do
		swait()
RH.C0=clerp(RH.C0,cf(1,-0.45,-0.45)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-1),math.rad(0),math.rad(-20)),.6)
LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-1),math.rad(0),math.rad(30)),.6)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0.2,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.6)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(10),math.rad(0),math.rad(0)),.6)
RW.C0=clerp(RW.C0,cf(1.05,1.25,0)*angles(math.rad(190),math.rad(0),math.rad(-30)),.6)
LW.C0=clerp(LW.C0,cf(-1.05,1.25,0)*angles(math.rad(190),math.rad(0),math.rad(30)),.6)
end
for i = 0, 1, 0.6 do
		swait()
RH.C0=clerp(RH.C0,cf(1,-0.45,-0.45)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-1),math.rad(0),math.rad(-20)),.6)
LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-1),math.rad(0),math.rad(30)),.6)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0.2,0)*angles(math.rad(90),math.rad(0),math.rad(0)),.6)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(10),math.rad(0),math.rad(0)),.6)
RW.C0=clerp(RW.C0,cf(1.05,1.25,0)*angles(math.rad(190),math.rad(0),math.rad(-30)),.6)
LW.C0=clerp(LW.C0,cf(-1.05,1.25,0)*angles(math.rad(190),math.rad(0),math.rad(30)),.6)
end
for i = 0, 1, 0.6 do
		swait()
RH.C0=clerp(RH.C0,cf(1,-0.45,-0.45)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-1),math.rad(0),math.rad(-20)),.6)
LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-1),math.rad(0),math.rad(30)),.6)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0.2,0)*angles(math.rad(180),math.rad(0),math.rad(0)),.6)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(10),math.rad(0),math.rad(0)),.6)
RW.C0=clerp(RW.C0,cf(1.05,1.25,0)*angles(math.rad(190),math.rad(0),math.rad(-30)),.6)
LW.C0=clerp(LW.C0,cf(-1.05,1.25,0)*angles(math.rad(190),math.rad(0),math.rad(30)),.6)
end
for i = 0, 1, 0.6 do
		swait()
RH.C0=clerp(RH.C0,cf(1,-0.45,-0.45)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-1),math.rad(0),math.rad(-20)),.6)
LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-1),math.rad(0),math.rad(30)),.6)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0.2,0)*angles(math.rad(270),math.rad(0),math.rad(0)),.6)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(10),math.rad(0),math.rad(0)),.6)
RW.C0=clerp(RW.C0,cf(1.05,1.25,0)*angles(math.rad(190),math.rad(0),math.rad(-30)),.6)
LW.C0=clerp(LW.C0,cf(-1.05,1.25,0)*angles(math.rad(190),math.rad(0),math.rad(30)),.6)
end
end
shakes(10,1)
CFuncs["Sound"].Create("rbxassetid://763717897", char, 4, 1)
CFuncs["Sound"].Create("rbxassetid://1192402877", char, 2.5, 0.75)
CFuncs["Sound"].Create("rbxassetid://1664711478", char, 4, 0.95)
sphere2(1,"Add",root.CFrame*CFrame.new(0,0,0),vt(15,0,15),5,0,5,BrickColor.new("Really black"))
sphere2(2,"Add",root.CFrame*CFrame.new(0,0,0),vt(15,0,15),5,0,5,keptcolor)
sphere2(1,"Add",root.CFrame*CFrame.new(0,0,0),vt(5,50000,5),1.5,1,1.5,BrickColor.new("Maroon"))
sphere2(2,"Add",root.CFrame*CFrame.new(0,0,0),vt(5,50000,5),1.5,1,1.5,BrickColor.new("Really black"))
sphere2(4,"Add",root.CFrame*CFrame.new(0,0,0),vt(5,50000,5),1.5,1,1.5,keptcolor)
for i, v in pairs(FindNearestHead(Torso.CFrame.p, 6000000)) do
if v:FindFirstChild('Head') then
dmg(v)
end
end
coroutine.resume(coroutine.create(function()
for i = 0, 99 do
local dis = CreateParta(char,1,1,"Neon",MAINRUINCOLOR)
dis.CFrame = root.CFrame*CFrame.new(math.random(-5,5),math.random(-5,5),math.random(-5,5))*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360)))
local at1 = Instance.new("Attachment",dis)
at1.Position = vt(-25000,0,0)
local at2 = Instance.new("Attachment",dis)
at2.Position = vt(25000,0,0)
local bv = Instance.new("BodyVelocity")
bv.maxForce = Vector3.new(1e9, 1e9, 1e9)
bv.velocity = dis.CFrame.lookVector*math.random(500,2500)
bv.Parent = dis
game:GetService("Debris"):AddItem(dis, 10)
end
for i = 0, 99 do
slash(math.random(10,30)/10,5,true,"Round","Add","Out",root.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(0.01,0.01,0.01),math.random(250,2500)/250,BrickColor.new("Maroon"))
end
for i = 0, 49 do
local rsiz = math.random(150,450)
sphere2(math.random(1,4),"Add",tors.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(15,1,15),-0.05,math.random(25,500)/25,-0.05,BrickColor.new("Really black"))
sphere2(math.random(1,2),"Add",x.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360)))*CFrame.new(math.random(-350,350),math.random(-350,350),math.random(-350,350)),vt(1,1,1),-0.01,math.random(50,250)/10,-0.01,BrickColor.new("Really black"))
sphereMK(math.random(1,2),math.random(2,4),"Add",x.CFrame*CFrame.Angles(math.rad(90 + math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),rsiz/10,rsiz/10,rsiz/10,0,BrickColor.new("Maroon"),0)
end
coroutine.resume(coroutine.create(function()
local eff = Instance.new("ParticleEmitter",x)
eff.Texture = "rbxassetid://02092248396"
eff.LightEmission = 1
eff.Color = ColorSequence.new(BrickColor.new("Maroon").Color)
eff.Rate = 50000
eff.Lifetime = NumberRange.new(6,12)
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
sphere2(3,"Add",tors.CFrame,vt(1,1,1),10,10,10,keptcolor)
sphere2(2,"Add",tors.CFrame,vt(1,1,1),10,10,10,BrickColor.new("Really black"))
sphere2(1,"Add",tors.CFrame,vt(1,1,1),10,10,10,BrickColor.new("Maroon"))
end))
vel:Destroy()
attack = false
hum.WalkSpeed = storehumanoidWS
end

function FiberDestiny()
attack = true
hum.WalkSpeed = 5
local rval = 0
local eval = 1
local rsiz = math.random(5,15)
local radm = math.random(1,3)
if radm == 1 then
chatfunc("DODGE THIS!!",BrickColor.new("Bright bluish green").Color,"Inverted","Antique",1)
elseif radm == 2 then
chatfunc("OUTRAN!!",BrickColor.new("Bright bluish green").Color,"Inverted","Antique",1)
elseif radm == 3 then
chatfunc("GO AHEAD!!",BrickColor.new("Bright bluish green").Color,"Inverted","Antique",1)
end
CFuncs["Sound"].Create("rbxassetid://1690475123", char, 7,1)
for i = 0, 2, 0.1 do
swait()
		sphere2(5,"Add",larm.CFrame*CFrame.new(0,-1.5,0),vt(1,1,1),0.025,0.025,0.025,MAINRUINCOLOR,MAINRUINCOLOR.Color)
RootJoint.C0 = clerp(RootJoint.C0,RootCF*cf(0,0,1)* angles(math.rad(10),math.rad(0),math.rad(50)),0.3)
Torso.Neck.C0 = clerp(Torso.Neck.C0,necko *angles(math.rad(5),math.rad(0),math.rad(-50)),.3)
RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5, 0) * angles(math.rad(80), math.rad(10), math.rad(60)), 0.3)
LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5, 0) * angles(math.rad(140), math.rad(0), math.rad(-70)), 0.3)
RH.C0=clerp(RH.C0,cf(1,-1,0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-1.5),math.rad(-50),math.rad(-10)),.3)
LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-2.5),math.rad(0),math.rad(40)),.3)
end
local THIS = 0
CFuncs["Sound"].Create("rbxassetid://444895479", root, 0.5,1)
	local hb = CreateParta(char,1,1,"SmoothPlastic",BrickColor.random())
	hb.Anchored = true
	hb.CFrame = root.CFrame*CFrame.new(0,1,0) + root.CFrame.lookVector*2
local Shattered = nil
local act = false
local alreadydid = false
for i = 0, 1.5, 0.1 do
swait()
if act == false then
for i, v in pairs(FindNearestHead(sorb2.CFrame.p, 3)) do
if v:FindFirstChild('Head') then
if alreadydid == false then
Shattered = v
hum.WalkSpeed = 0
CFuncs["Sound"].Create("rbxassetid://153092227", root, 5,1)
CFuncs["Sound"].Create("rbxassetid://200632821", root, 1,1.15)
CFuncs["Sound"].Create("rbxassetid://1042716828", root, 1.5,1)
CFuncs["Sound"].Create("rbxassetid://884155627", root, 2,1)
root.Anchored = true
coroutine.resume(coroutine.create(function()
Shattered.Humanoid.WalkSpeed = 0
Shattered:WaitForChild("HumanoidRootPart").Anchored = true
end))
alreadydid = true
act = true
print(Shattered.Name)
end
end
end
elseif act == true then
coroutine.resume(coroutine.create(function()
Shattered:FindFirstChildOfClass("Humanoid").Health = Shattered:FindFirstChildOfClass("Humanoid").Health - 0.25
end))

sphereMK(math.random(1,4),0.15,"Add",root.CFrame*CFrame.new(math.random(-5,5),math.random(-8,-4),math.random(-5,5))*CFrame.Angles(math.rad(90),0,0),rsiz/20,rsiz/20,rsiz/20,0,MAINRUINCOLOR,0)
Shattered.Head.CFrame = RootPart.CFrame*CFrame.new(0,4,4)*CFrame.Angles(math.rad(-90),math.rad(0),0.1)
end
		sphere2(5,"Add",larm.CFrame*CFrame.new(0,-1.5,0),vt(1,1,1),0.025,0.025,0.025,MAINRUINCOLOR,MAINRUINCOLOR.Color)
root.CFrame = root.CFrame + root.CFrame.lookVector*0.85
RootJoint.C0 = clerp(RootJoint.C0,RootCF*cf(0,0,0)* angles(math.rad(89),math.rad(-8),math.rad(-5)),0.5)
Torso.Neck.C0 = clerp(Torso.Neck.C0,necko *angles(math.rad(-30),math.rad(0),math.rad(8)),.5)
RW.C0=clerp(RW.C0,cf(1.45,0.5 + 0.1 * math.cos(sine / 25),0)*angles(math.rad(-15),math.rad(0),math.rad(55)),.1)
LW.C0=clerp(LW.C0,cf(-1.45,0.5 + 0.1 * math.cos(sine / 25),0)*angles(math.rad(-15),math.rad(0),math.rad(-55)),.1)
RH.C0=clerp(RH.C0,cf(1,-0.5,-0.6)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-8),math.rad(0),math.rad(-20)),.5)
LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(9),math.rad(0),math.rad(20)),.5)
end
hb:Destroy()
if act == true then
for i = 0, 6, 0.1 do
swait()
THIS = THIS + 0.1
Shattered.Head.CFrame = RootPart.CFrame*CFrame.new(0,4,-1*THIS)*CFrame.Angles(math.rad(-90),math.rad(0),0.1)
sphereMK(2.5,-2.5,"Add",Shattered.Torso.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),2.5,2.5,30,-0.025,BrickColor.new("Forest green"),100)
RH.C0=clerp(RH.C0,cf(1,-0.35 - 0.05 * math.cos(sine / 25),-0.75)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-5),math.rad(0),math.rad(-20)),.1)
LH.C0=clerp(LH.C0,cf(-1,-1 - 0.05 * math.cos(sine / 25),0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-5),math.rad(0),math.rad(20)),.1)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,2,5 + 0.05 * math.cos(sine / 25))*angles(math.rad(40),math.rad(0),math.rad(0)),.1)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(2.5),math.rad(0),math.rad(0)),.1)
RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5, 0) * angles(math.rad(-14), math.rad(1), math.rad(17)), 0.5)
LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.85, 0) * angles(math.rad(180), math.rad(0), math.rad(-8)), 0.5)
end
CFuncs["EchoSound"].Create("rbxassetid://153092227", root, 10, 1,0,10,0.25,0.5,1)
CFuncs["EchoSound"].Create("rbxassetid://824687369", char, 1.5, 1,0,10,0.25,0.5,1)
CFuncs["EchoSound"].Create("rbxassetid://153092227", char, 2, 0.9,0,10,0.25,0.5,1)
for i = 0, 9 do
CFuncs["EchoSound"].Create("rbxassetid://1690476035", char, 1.5, 1,0.1,10,0.15,0.5,1)
end
CFuncs["EchoSound"].Create("rbxassetid://1690476035", root, 10, 1,0.1,10,0.15,0.5,1)
for x = 0, 2 do
for i = 0, 3, 0.1 do
swait()
coroutine.resume(coroutine.create(function()
Shattered:FindFirstChildOfClass("Humanoid").Health = Shattered:FindFirstChildOfClass("Humanoid").Health - 1.5
end))
rsiz = math.random(5,15)
rval = rval + 100
for i = 0, 2 do
slash(5,5,true,"Round","Add","Out",Shattered.Head.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(0.01,0.01,0.01),math.random(50,350)/250,BrickColor.new("Forest green"))
end
shakes(0.5,0.5)
sphere2(1,"Add",Shattered.Torso.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(1,1,1),-0.01,10,-0.01,MAINRUINCOLOR,MAINRUINCOLOR.Color)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(10 - 2.5 * math.cos(sine / 28)),math.rad(10),math.rad(45)),.1)
Shattered.Head.CFrame = RootPart.CFrame*CFrame.new(0,4,-1*THIS)*CFrame.Angles(math.rad(-90),math.rad(0),0.1)
RH.C0=clerp(RH.C0,cf(1,-0.35 - 0.05 * math.cos(sine / 25),-0.75)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-5),math.rad(0),math.rad(-20)),.1)
LH.C0=clerp(LH.C0,cf(-1,-1 - 0.05 * math.cos(sine / 25),0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-5),math.rad(0),math.rad(20)),.1)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,2,5 + 0.05 * math.cos(sine / 25))*angles(math.rad(40),math.rad(0),math.rad(0)),.1)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(2.5),math.rad(0),math.rad(0)),.1)
RW.C0=clerp(RW.C0,cf(1.5,0.5 + 0.1 * math.cos(sine / 25),0)*angles(math.rad(90),math.rad(0),math.rad(35)),.1)
LW.C0=clerp(LW.C0,cf(-1.5,0.5 + 0.1 * math.cos(sine / 25),0)*angles(math.rad(90),math.rad(0),math.rad(-35)),.1)
end
Shattered:FindFirstChildOfClass("Humanoid").Health = Shattered:FindFirstChildOfClass("Humanoid").Health == 0
end
end
hum.WalkSpeed = storehumanoidWS
root.Anchored = false
hum.WalkSpeed = storehumanoidWS
attack = false
end

function CelestialBloom()
attack = true
hum.WalkSpeed = 0
CFuncs["Sound"].Create("rbxassetid://1368598393", char, 2.5, 0.5)
CFuncs["Sound"].Create("rbxassetid://1368598393", root, 10, 0.5)
CFuncs["EchoSound"].Create("rbxassetid://1718412034", char, 4, 1,0,10,0.15,0.5,1)
for i = 0,70 do
swait()
RH.C0=clerp(RH.C0,cf(1,-0.4,-0.5)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-3),math.rad(0 - 1 * math.cos(sine / 56)),math.rad(-10 - 2 * math.cos(sine / 32))),.3)
LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-3),math.rad(0 - 1 * math.cos(sine / 56)),math.rad(10 + 2 * math.cos(sine / 32))),.3)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0 + 0.02 * math.cos(sine / 32),1 + 0.15 * math.cos(sine / 32))*angles(math.rad(0 - 2 * math.cos(sine / 32)),math.rad(0),math.rad(0)),.3)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(35 - 2 * math.cos(sine / 37)),math.rad(0),math.rad(0)),.3)
RW.C0=clerp(RW.C0,cf(1,0.5 + 0.025 * math.cos(sine / 45),-0.5)*angles(math.rad(90 + 6 * math.cos(sine / 72)),math.rad(3 - 2 * math.cos(sine / 58)),math.rad(-80 + 2 * math.cos(sine / 45))),.3)
LW.C0=clerp(LW.C0,cf(-1,0.5 + 0.025 * math.cos(sine / 45),-0.5)*angles(math.rad(80 - 7 * math.cos(sine / 66)),math.rad(4 - 3 * math.cos(sine / 59)),math.rad(71 - 4 * math.cos(sine / 45))),.3)
end
coroutine.resume(coroutine.create(function()
wait(0.25)
sphere2(1,"Add",root.CFrame,vt(500,500,500),-10,-10,-10,BrickColor.new("Really black"))
sphere2(1,"Add",root.CFrame,vt(750,750,750),-15,-15,-15,BrickColor.new("Maroon"))
CFuncs["Sound"].Create("rbxassetid://134854740", char, 3, 1)
CFuncs["Sound"].Create("rbxassetid://157878578", char, 3, 0.5)
CFuncs["Sound"].Create("rbxassetid://165970126", char, 2, 0.25)
CFuncs["Sound"].Create("rbxassetid://167115397", char, 2, 1)
CFuncs["Sound"].Create("rbxassetid://184173042", char, 4, 1.125)

CFuncs["Sound"].Create("rbxassetid://1368605755", char, 4, 1)
CFuncs["Sound"].Create("rbxassetid://763718160", char, 1.5, 0.5)
CFuncs["Sound"].Create("rbxassetid://763718160", char, 1.5, 0.25)
CFuncs["Sound"].Create("rbxassetid://782353443", char, 4, 1)
CFuncs["Sound"].Create("rbxassetid://782353443", char, 4, 0.75)
CFuncs["LongSound"].Create("rbxassetid://782353443", char, 4, 0.5)
CFuncs["LongSound"].Create("rbxassetid://782353443", char, 4, 0.25)
CFuncs["Sound"].Create("rbxassetid://1664711478", char, 4, 1)
CFuncs["Sound"].Create("rbxassetid://239000203", char, 4, 1)
coroutine.resume(coroutine.create(function()
for i = 0, 42, 0.1 do
swait()
shakes(2,0.5)
MagniDamage(root, 300, 10,25, 0, "Normal")
coroutine.resume(coroutine.create(function()

slash(math.random(10,40)/10,5,true,"Round","Add","Out",root.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(0.01,0.01,0.01),math.random(250,2500)/250,BrickColor.new(math.random(0,1),0,0))

sphere2(5,"Add",root.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(10,10,10),5,5,5,BrickColor.new(math.random(0,1),0,0))
sphere2(5,"Add",root.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(10,10,10),1,35,1,BrickColor.new(math.random(0,1),0,0))
sphere2(5,"Add",root.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(10,10,10),0,50,0,BrickColor.new(math.random(0,1),0,0))
end))
end
hum.WalkSpeed = storehumanoidWS
attack = false
end))
end))
for i = 0,2,0.1 do
swait()
RH.C0=clerp(RH.C0,cf(1,-0.4,-0.5)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-3),math.rad(0 - 1 * math.cos(sine / 56)),math.rad(-10 - 2 * math.cos(sine / 32))),.3)
LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-3),math.rad(0 - 1 * math.cos(sine / 56)),math.rad(10 + 2 * math.cos(sine / 32))),.3)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0.2 + 0.02 * math.cos(sine / 32),1 + 0.15 * math.cos(sine / 32))*angles(math.rad(-20 - 2 * math.cos(sine / 32)),math.rad(0),math.rad(0)),.3)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(-25 - 2 * math.cos(sine / 37)),math.rad(0),math.rad(0)),.3)
RW.C0=clerp(RW.C0,cf(1.5,0.5 + 0.025 * math.cos(sine / 45),0)*angles(math.rad(90 + 6 * math.cos(sine / 72)),math.rad(3 - 2 * math.cos(sine / 58)),math.rad(100 + 2 * math.cos(sine / 45))),.3)
LW.C0=clerp(LW.C0,cf(-1.5,0.5 + 0.025 * math.cos(sine / 45),0)*angles(math.rad(90 - 7 * math.cos(sine / 66)),math.rad(4 - 3 * math.cos(sine / 59)),math.rad(-101 - 4 * math.cos(sine / 45))),.3)
end
end

function LavaPit()
	local lookavec = 0 
	local mult = 1
	local keptcolor = MAINRUINCOLOR
local rd = math.random(1,6)
if rd == 1 then
chatfunc("BURN BURN BURN!!!",MAINRUINCOLOR.Color,"Inverted","Arcade",2.5)
elseif rd == 2 then
chatfunc("BURNING SOUL!!",MAINRUINCOLOR.Color,"Inverted","Arcade",2.5)
elseif rd == 3 then
chatfunc("YOU'LL BE BURNT!!!",MAINRUINCOLOR.Color,"Inverted","Arcade",2.5)
elseif rd == 4 then
chatfunc("JUST DIE ALREADY!!!",MAINRUINCOLOR.Color,"Inverted","Arcade",2.5)
elseif rd == 5 then
chatfunc("YOU LIVED LONG ENOUGH!!!",MAINRUINCOLOR.Color,"Inverted","Arcade",2.5)
elseif rd == 6 then
chatfunc("THE ENDLESS PAIN!!!",MAINRUINCOLOR.Color,"Inverted","Arcade",2.5)
end
local dis = CreateParta(char,0,1,"Neon",keptcolor)
for i = 0, 2 do
CFuncs["Sound"].Create("rbxassetid://335657174", dis, 10, 0.5)
end
dis.CFrame = root.CFrame*CFrame.new(0,2,-3)
CreateMesh(dis,"Sphere",4,4,4)
local at1 = Instance.new("Attachment",dis)
at1.Position = vt(-2,0,0)
local at2 = Instance.new("Attachment",dis)
at2.Position = vt(2,0,0)
local trl = Instance.new('Trail',dis)
trl.Attachment0 = at1
trl.Attachment1 = at2
trl.Texture = "rbxassetid://01049219073"
trl.LightEmission = 1
trl.FaceCamera = true
trl.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0),NumberSequenceKeypoint.new(1, 1)})
trl.Color = ColorSequence.new(dis.Color)
trl.Lifetime = 3
local efec = Instance.new("ParticleEmitter",dis)
efec.Texture = "rbxassetid://0144580273"
efec.LightEmission = 1
efec.Color = ColorSequence.new(keptcolor.Color)
efec.Rate = 500000
efec.Lifetime = NumberRange.new(1)
efec.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,2,0),NumberSequenceKeypoint.new(1,0,0)})
efec.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(1,1,0)})
efec.Drag = 5
efec.Rotation = NumberRange.new(-500,500)
efec.VelocitySpread = 9000
efec.RotSpeed = NumberRange.new(-500,500)
local a = Instance.new("Part",workspace)
	a.Name = "Direction"	
	a.Anchored = true
	a.BrickColor = bc("Bright red")
a.Material = "Neon"
a.Transparency = 1
	a.CanCollide = false
	local ray = Ray.new(
	    dis.CFrame.p,                           -- origin
	    (mouse.Hit.p - dis.CFrame.p).unit * 500 -- direction
	) 
	local ignore = dis
	local hit, position, normal = workspace:FindPartOnRay(ray, ignore)
	a.BottomSurface = 10
	a.TopSurface = 10
	local distance = (dis.CFrame.p - position).magnitude
	a.Size = Vector3.new(0.1, 0.1, 0.1)
	a.CFrame = CFrame.new(dis.CFrame.p, position) * CFrame.new(0, 0, 0)
dis.CFrame = a.CFrame
a:Destroy()
local bv = Instance.new("BodyVelocity")
bv.maxForce = Vector3.new(1e9, 1e9, 1e9)
bv.velocity = dis.CFrame.lookVector*250
bv.Parent = dis
game:GetService("Debris"):AddItem(dis, 15)
local hitted = false
coroutine.resume(coroutine.create(function()
dis.Touched:connect(function(hit) 
	if hitted == false and hit.Parent ~= char then
	hitted = true
	shakes(1,1)
	efec.Enabled = false
	dis.Anchored = true
	dis.Transparency = 1
	local elocacenter = CreateParta(char,1,1,"SmoothPlastic",BrickColor.random())
elocacenter.Anchored = true
elocacenter.CFrame = dis.CFrame*CFrame.new(0,1,0)
elocacenter.Orientation = Vector3.new(0,0,0)
local eloca1 = CreateParta(elocacenter,1,1,"SmoothPlastic",BrickColor.random())
eloca1.Anchored = true
eloca1.CFrame = elocacenter.CFrame
local at1 = Instance.new("Attachment",eloca1)
at1.Position = vt(0,20,0)
local at2 = Instance.new("Attachment",eloca1)
at2.Position = vt(0,-20,0)
local at1b = Instance.new("Attachment",eloca1)
at1b.Position = vt(0,0,100)
local at2b = Instance.new("Attachment",eloca1)
at2b.Position = vt(0,0,-100)
local trl = Instance.new('Trail',eloca1)
trl.Attachment0 = at1
trl.Attachment1 = at2
trl.Texture = "rbxassetid://01049219073"
trl.LightEmission = 1
trl.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0),NumberSequenceKeypoint.new(1, 1)})
trl.Color = ColorSequence.new(keptcolor.Color)
trl.Lifetime = 4
local trl2 = trl:Clone()
trl2.Parent = eloca1
trl2.Attachment0 = at1b
trl2.Attachment1 = at2b
trl2.Texture = "rbxassetid://02108945559"
trl2.Lifetime = 2
local eff = Instance.new("ParticleEmitter",eloca1)
eff.Texture = "rbxassetid://02273224484"
eff.LightEmission = 1
eff.Color = ColorSequence.new(keptcolor.Color)
eff.Rate = 500000
eff.Lifetime = NumberRange.new(0.5,3)
eff.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,50,0),NumberSequenceKeypoint.new(0.2,5,0),NumberSequenceKeypoint.new(0.8,5,0),NumberSequenceKeypoint.new(1,0,0)})
eff.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,1,0),NumberSequenceKeypoint.new(0.1,0,0),NumberSequenceKeypoint.new(0.8,0,0),NumberSequenceKeypoint.new(1,1,0)})
eff.Speed = NumberRange.new(20,250)
eff.Drag = 5
eff.Rotation = NumberRange.new(-500,500)
eff.VelocitySpread = 9000
eff.RotSpeed = NumberRange.new(-50,50)
local eloca2 = eloca1:Clone()
eloca2.Parent = elocacenter
local eloca3 = eloca1:Clone()
eloca3.Parent = elocacenter
local eloca4 = eloca1:Clone()
eloca4.Parent = elocacenter
sphere2(2,"Add",elocacenter.CFrame,vt(1,1,1),2,2,2,keptcolor)
sphere2(3,"Add",elocacenter.CFrame,vt(1,1,1),4,4,4,keptcolor)
sphere2(4,"Add",elocacenter.CFrame,vt(1,1,1),5,5,5,keptcolor)
sphere2(5,"Add",elocacenter.CFrame,vt(1,1,1),6,6,6,keptcolor)
for i = 0, 2 do
CFuncs["Sound"].Create("rbxassetid://419447292", elocacenter, 8, 1)
CFuncs["Sound"].Create("rbxassetid://1192402877", elocacenter, 10, 0.5)
end
CFuncs["Sound"].Create("rbxassetid://763717897", char, 3, 1)
CFuncs["Sound"].Create("rbxassetid://763717897", char, 3, 0.75)
CFuncs["Sound"].Create("rbxassetid://763717897", char, 4, 0.5)
CFuncs["Sound"].Create("rbxassetid://1192402877", char, 6,0.5)
CFuncs["Sound"].Create("rbxassetid://1664711478", char, 2.5,1)
CFuncs["Sound"].Create("rbxassetid://763718160", char, 3, 0.75)
symbolizeBlink(elocacenter,0,144580273,keptcolor.Color,20,0,0,0,root,true,-5,3)
symbolizeBlink(elocacenter,0,144580273,keptcolor.Color,40,0,0,0,root,true,-5,3)
symbolizeBlink(elocacenter,0,144580273,keptcolor.Color,60,0,0,0,root,true,-5,3)
symbolizeBlink(elocacenter,0,144580273,keptcolor.Color,80,0,0,0,root,true,-5,3)
sphere2(2,"Add",elocacenter.CFrame,vt(10,10000,10),2,2,2,keptcolor)
sphere2(1,"Add",elocacenter.CFrame,vt(10,10000,10),2,2,2,keptcolor)
sphere2(2,"Add",elocacenter.CFrame,vt(10,10,10),5,5,5,keptcolor)
sphere2(2,"Add",elocacenter.CFrame,vt(10,10,10),7.5,7.5,7.5,keptcolor)
sphere2(2,"Add",elocacenter.CFrame,vt(10,10,10),10,10,10,keptcolor)
sphere2(2,"Add",elocacenter.CFrame,vt(10,10,10),2.5,2.5,2.5,keptcolor)
for i = 0, 29 do
		slash(math.random(10,30)/10,5,true,"Round","Add","Out",elocacenter.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(0.01,0.01,0.01),math.random(500,1000)/250,BrickColor.new("White"))
	end
local effx = Instance.new("ParticleEmitter",elocacenter)
effx.Texture = "rbxassetid://0144580273" -- 144580273 74564879
effx.LightEmission = 1
effx.Color = ColorSequence.new(keptcolor.Color)
effx.Rate = 500000
effx.Lifetime = NumberRange.new(0.25,0.75)
effx.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(1,200,0)})
effx.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,1,0),NumberSequenceKeypoint.new(0.1,0.5,0),NumberSequenceKeypoint.new(0.8,0,0),NumberSequenceKeypoint.new(1,1,0)})
effx.Speed = NumberRange.new(0,10)
effx.Drag = 5
effx.Rotation = NumberRange.new(-500,500)
effx.VelocitySpread = 9000
effx.RotSpeed = NumberRange.new(-50,50)
coroutine.resume(coroutine.create(function()
	wait(0.05)
	effx.Enabled = false
end))
coroutine.resume(coroutine.create(function()
for i = 0, 14, 0.1 do
	swait()
	mult = mult + 0.5
sphere2(5,"Add",elocacenter.CFrame,vt(1,10000,1),0.05*lookavec/4,0.001,0.05*lookavec/4,keptcolor)
lookavec = lookavec + 0.06*mult
MagniDamage(elocacenter, 1.6*lookavec/2, 0.5,2.5, 0, "Normal")
sphere2(5,"Add",elocacenter.CFrame,vt(1,1,1),0.05*lookavec/2,0.001,0.05*lookavec/2,keptcolor)
elocacenter.CFrame = elocacenter.CFrame*CFrame.Angles(0,math.rad(5*mult/20),0)
eloca1.CFrame = elocacenter.CFrame*CFrame.new(-lookavec,0,0)
eloca2.CFrame = elocacenter.CFrame*CFrame.Angles(0,math.rad(90),0)*CFrame.new(-lookavec,0,0)
eloca3.CFrame = elocacenter.CFrame*CFrame.Angles(0,math.rad(180),0)*CFrame.new(-lookavec,0,0)
eloca4.CFrame = elocacenter.CFrame*CFrame.Angles(0,math.rad(270),0)*CFrame.new(-lookavec,0,0)
end
for i = 0, 119, 0.1 do
	swait()
sphere2(5,"Add",elocacenter.CFrame,vt(1,10000,1),0.05*lookavec/4,0.001,0.05*lookavec/4,keptcolor)
MagniDamage(elocacenter, 1.5*lookavec/2, 0.5,2.5, 0, "Normal")
sphere2(5,"Add",elocacenter.CFrame,vt(1,1,1),0.05*lookavec/2,0.001,0.05*lookavec/2,keptcolor)
elocacenter.CFrame = elocacenter.CFrame*CFrame.Angles(0,math.rad(5*mult/20),0)
eloca1.CFrame = elocacenter.CFrame*CFrame.new(-lookavec,0,0)
eloca2.CFrame = elocacenter.CFrame*CFrame.Angles(0,math.rad(90),0)*CFrame.new(-lookavec,0,0)
eloca3.CFrame = elocacenter.CFrame*CFrame.Angles(0,math.rad(180),0)*CFrame.new(-lookavec,0,0)
eloca4.CFrame = elocacenter.CFrame*CFrame.Angles(0,math.rad(270),0)*CFrame.new(-lookavec,0,0)
end
local effe = Instance.new("ParticleEmitter",elocacenter)
effe.Texture = "rbxassetid://02273224484"
effe.LightEmission = 1
effe.Color = ColorSequence.new(keptcolor.Color)
effe.Rate = 500000
effe.Lifetime = NumberRange.new(3,5)
effe.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,150,0),NumberSequenceKeypoint.new(0.2,15,0),NumberSequenceKeypoint.new(0.8,15,0),NumberSequenceKeypoint.new(1,0,0)})
effe.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,1,0),NumberSequenceKeypoint.new(0.1,0,0),NumberSequenceKeypoint.new(0.8,0,0),NumberSequenceKeypoint.new(1,1,0)})
effe.Speed = NumberRange.new(250,1200)
effe.Drag = 5
effe.Rotation = NumberRange.new(-500,500)
effe.VelocitySpread = 9000
effe.RotSpeed = NumberRange.new(-50,50)
coroutine.resume(coroutine.create(function()
	effx.Enabled = true
	wait(0.15)
	effx.Enabled = false
	wait(0.25)
	effe.Enabled = false
end))
coroutine.resume(coroutine.create(function()
	local elocor = elocacenter
local lookavec = 0 
	local mult = 1
local elocacenter = CreateParta(elocor,1,1,"SmoothPlastic",BrickColor.random())
elocacenter.Anchored = true
elocacenter.CFrame = elocor.CFrame
local eloca1 = CreateParta(elocacenter,1,1,"SmoothPlastic",BrickColor.random())
eloca1.Anchored = true
eloca1.CFrame = elocacenter.CFrame
local at1 = Instance.new("Attachment",eloca1)
at1.Position = vt(0,10,0)
local at2 = Instance.new("Attachment",eloca1)
at2.Position = vt(0,-10,0)
local trl = Instance.new('Trail',eloca1)
trl.Attachment0 = at1
trl.Attachment1 = at2
trl.Texture = "rbxassetid://01049219073"
trl.LightEmission = 1
trl.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0),NumberSequenceKeypoint.new(1, 1)})
trl.Color = ColorSequence.new(keptcolor.Color)
trl.Lifetime = 8
local eff = Instance.new("ParticleEmitter",eloca1)
eff.Texture = "rbxassetid://02273224484"
eff.LightEmission = 1
eff.Color = ColorSequence.new(keptcolor.Color)
eff.Rate = 500000
eff.Lifetime = NumberRange.new(0.5,1)
eff.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,20,0),NumberSequenceKeypoint.new(0.2,2,0),NumberSequenceKeypoint.new(0.8,2,0),NumberSequenceKeypoint.new(1,0,0)})
eff.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,1,0),NumberSequenceKeypoint.new(0.1,0,0),NumberSequenceKeypoint.new(0.8,0,0),NumberSequenceKeypoint.new(1,1,0)})
eff.Speed = NumberRange.new(20,250)
eff.Drag = 5
eff.Rotation = NumberRange.new(-500,500)
eff.VelocitySpread = 9000
eff.RotSpeed = NumberRange.new(-50,50)
local eloca2 = eloca1:Clone()
eloca2.Parent = elocacenter
local eloca3 = eloca1:Clone()
eloca3.Parent = elocacenter
local eloca4 = eloca1:Clone()
eloca4.Parent = elocacenter
coroutine.resume(coroutine.create(function()
for i = 0, 19, 0.1 do
	swait()
	mult = mult + 0.25
lookavec = lookavec + 0.05*mult
elocacenter.CFrame = elocacenter.CFrame*CFrame.Angles(0,math.rad(5*mult/10),0)
eloca1.CFrame = elocacenter.CFrame*CFrame.new(40+lookavec/5,-15+lookavec*2,0)
eloca2.CFrame = elocacenter.CFrame*CFrame.new(-40-lookavec/5,-15+lookavec*2,0)
eloca3.CFrame = elocacenter.CFrame*CFrame.new(0,-15+lookavec*2,40+lookavec/5)
eloca4.CFrame = elocacenter.CFrame*CFrame.new(0,-15+lookavec*2,-40-lookavec/5)
end
for i,v in pairs(elocacenter:GetDescendants()) do
	if v:IsA("ParticleEmitter") then
		v.Enabled = false
	end
end
wait(15)
elocacenter:Destroy()
end))
end))
for i = 0, 9, 0.1 do
	swait()
	mult = mult - 0.5
lookavec = lookavec - 0.06*mult
sphere2(5,"Add",elocacenter.CFrame,vt(1,1,1),0.05*lookavec/2,0.001,0.05*lookavec/2,keptcolor)
elocacenter.CFrame = elocacenter.CFrame*CFrame.Angles(0,math.rad(5*mult/20),0)
eloca1.CFrame = elocacenter.CFrame*CFrame.new(-lookavec,0,0)
eloca2.CFrame = elocacenter.CFrame*CFrame.Angles(0,math.rad(90),0)*CFrame.new(-lookavec,0,0)
eloca3.CFrame = elocacenter.CFrame*CFrame.Angles(0,math.rad(180),0)*CFrame.new(-lookavec,0,0)
eloca4.CFrame = elocacenter.CFrame*CFrame.Angles(0,math.rad(270),0)*CFrame.new(-lookavec,0,0)
end
for i,v in pairs(elocacenter:GetDescendants()) do
	if v:IsA("ParticleEmitter") then
		v.Enabled = false
	end
end
wait(6)
elocacenter:Destroy()
end))
end
end)
end))	
end

function Reblink()
for i = 0, 14 do
slash(math.random(30,100)/10,5,true,"Round","Add","Out",Torso.CFrame*CFrame.new(0,-3,0)*CFrame.Angles(math.rad(math.random(-1, 1)), math.rad(math.random(-360, 360)), math.rad(math.random(-360, 360))),vt(0.05,0.01,0.05),math.random(50,60)/250,MAINRUINCOLOR)
end
sphere(10,"Add",root.CFrame,vt(0,0,0),1,MAINRUINCOLOR)
CFuncs["Sound"].Create("rbxassetid://1177785010", root, 10,1)
RootPart.CFrame = mouse.Hit *CFrame.new(0,2,0)
CameraEnshaking(2,10)
for i, v in pairs(FindNearestHead(Torso.CFrame.p, 20)) do
if v:FindFirstChild('Head') then
dmg(v)
end
end
for i = 0, 14 do
slash(math.random(30,100)/10,5,true,"Round","Add","Out",Torso.CFrame*CFrame.new(0,-3,0)*CFrame.Angles(math.rad(math.random(-1, 1)), math.rad(math.random(-360, 360)), math.rad(math.random(-360, 360))),vt(0.05,0.01,0.05),math.random(50,60)/250,MAINRUINCOLOR)
end
sphere(10,"Add",root.CFrame,vt(0,0,0),1,MAINRUINCOLOR)
end

function SeraphicalThrow()
attack = true
hum.WalkSpeed = 3
local scaled = 0
CFuncs["Sound"].Create("rbxassetid://1368598393", root, 10, 1)
CFuncs["EchoSound"].Create("rbxassetid://1690475123", char, 1.5, 1,0,10,0.15,0.5,1)
CFuncs["EchoSound"].Create("rbxassetid://1690475123", root, 10, 1,0,10,0.15,0.5,1)
for i = 0,4,0.1 do
swait()
scaled = scaled + 0.2
shakes(0.6,0.5)
slash(5,5,true,"Round","Add","Out",root.CFrame*CFrame.new(0,8,0)*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(0.1,0.01,0.1),-0.1,BrickColor.new("Gold"))
block(10,"Add",root.CFrame*CFrame.new(0,8,0)*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(scaled,scaled,scaled),0.01,0.01,0.01,BrickColor.new("New Yeller"),BrickColor.new("New Yeller").Color)
RH.C0=clerp(RH.C0,cf(1,-0.4,-0.5)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-3 + 2.75 * math.cos(sine / 64)),math.rad(0 - 1 * math.cos(sine / 56)),math.rad(-10 - 7 * math.cos(sine / 56))),.1)
LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-3 + 2.75 * math.cos(sine / 64)),math.rad(0 - 1 * math.cos(sine / 56)),math.rad(10 + 3 * math.cos(sine / 52))),.1)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0 + 0.07 * math.cos(sine / 32),2.25 + 0.75 * math.cos(sine / 32))*angles(math.rad(0 - 2 * math.cos(sine / 32)),math.rad(0),math.rad(0)),.1)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(0 - 2 * math.cos(sine / 37)),math.rad(0 + 1 * math.cos(sine / 58)),math.rad(0 + 2 * math.cos(sine / 53))),.1)
RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.4 + 0.05 * math.sin(sine / 30), 0.2) * angles(math.rad(-180), math.rad(0), math.rad(0)), 0.1)
LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.4 + 0.05 * math.cos(sine / 30),0.2) * angles(math.rad(-180), math.rad(0), math.rad(0)), 0.1)
end
hum.CameraOffset = vt(0,0,0)
CFuncs["Sound"].Create("rbxassetid://260411131", rarm, 7.5, 1)
for i = 0,2,0.1 do
swait()
slash(5,5,true,"Round","Add","Out",root.CFrame*CFrame.new(0,8,0)*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(0.1,0.01,0.1),-0.1,BrickColor.new("Gold"))
block(10,"Add",root.CFrame*CFrame.new(0,8,0)*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(scaled,scaled,scaled),0.01,0.01,0.01,BrickColor.new("New Yeller"),BrickColor.new("New Yeller").Color)
RH.C0=clerp(RH.C0,cf(1,-0.4,-0.5)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-3 + 2.75 * math.cos(sine / 64)),math.rad(0 - 1 * math.cos(sine / 56)),math.rad(-10 - 7 * math.cos(sine / 56))),.1)
LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-3 + 2.75 * math.cos(sine / 64)),math.rad(0 - 1 * math.cos(sine / 56)),math.rad(10 + 3 * math.cos(sine / 52))),.1)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0 + 0.07 * math.cos(sine / 32),2.25 + 0.75 * math.cos(sine / 32))*angles(math.rad(-30 - 2 * math.cos(sine / 32)),math.rad(0),math.rad(0)),.1)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(0 - 2 * math.cos(sine / 37)),math.rad(0 + 1 * math.cos(sine / 58)),math.rad(0 + 2 * math.cos(sine / 53))),.1)
RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.4 + 0.05 * math.sin(sine / 30), 0.2) * angles(math.rad(-160), math.rad(0), math.rad(0)), 0.1)
LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.4 + 0.05 * math.cos(sine / 30),0.2) * angles(math.rad(-160), math.rad(0), math.rad(0)), 0.1)
end
local orb = Instance.new("Part", char)
for i = 0, 4 do
CFuncs["Sound"].Create("rbxassetid://335657174", orb, 10, 0.75)
end
        orb.BrickColor = BrickColor.new("Gold")
        orb.CanCollide = false
        orb.FormFactor = 3
        orb.Name = "Ring"
        orb.Material = "Neon"
        orb.Size = Vector3.new(1, 1, 1)
        orb.Transparency = 0
        orb.TopSurface = 0
        orb.BottomSurface = 0
        local orbm = Instance.new("SpecialMesh", orb)
        orbm.MeshType = "Sphere"
orbm.Name = "SizeMesh"
orbm.Scale = vt(10,10,10)
orb.CFrame = root.CFrame + root.CFrame.lookVector*3
	local a = Instance.new("Part",workspace)
	a.Name = "Direction"	
	a.Anchored = true
	a.BrickColor = bc("Bright red")
a.Material = "Neon"
a.Transparency = 1
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
local at1a = Instance.new("Attachment",orb)
at1a.Position = Vector3.new(0,5,0)
local at2a = Instance.new("Attachment",orb)
at2a.Position = Vector3.new(0,5,0)
local at1b = Instance.new("Attachment",orb)
at1b.Position = Vector3.new(5,0,0)
local at2b = Instance.new("Attachment",orb)
at2b.Position = Vector3.new(-5,0,0)
local tl1 = Instance.new('Trail',orb)
tl1.Attachment0 = at1a
tl1.Attachment1 = at2a
tl1.Texture = "http://www.roblox.com/asset/?id=1049219073"
tl1.LightEmission = 1
tl1.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0),NumberSequenceKeypoint.new(1, 1)})
tl1.Color = ColorSequence.new(BrickColor.new('New Yeller').Color)
tl1.Lifetime = 3
local tl2 = tl1:Clone()
tl2.Parent = orb
tl2.Attachment0 = at1b
tl2.Attachment1 = at2b
coroutine.resume(coroutine.create(function()
while true do
swait()
if over == false then
MagniDamage(orb,25,99999,9999999,0,"Normal",153092213)
coroutine.resume(coroutine.create(function()
for i, v in pairs(FindNearestTorso(orb.CFrame.p, 25)) do
if v:FindFirstChild('Head') then
dmg(v)
end
end
end))
slash(10,5,true,"Round","Add","Out",orb.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(0.15,0.01,0.15),-0.05,BrickColor.new("Gold"))
elseif over == true then
break
end
end
end))
local bv = Instance.new("BodyVelocity")
bv.maxForce = Vector3.new(1e9, 1e9, 1e9)
bv.velocity = orb.CFrame.lookVector*350
bv.Parent = orb
coroutine.resume(coroutine.create(function()
wait(1)
over = true
orb.Anchored = true
MagniDamage(orb,125,99999,9999999,0,"Normal",153092213)
coroutine.resume(coroutine.create(function()
for i, v in pairs(FindNearestTorso(orb.CFrame.p, 125)) do
if v:FindFirstChild('Head') then
dmg(v)
end
end
end))
for i = 0, 4 do
CFuncs["Sound"].Create("rbxassetid://1368637781", orb, 7.5,1)
CFuncs["Sound"].Create("rbxassetid://763718160", orb, 10, 1.1)
CFuncs["Sound"].Create("rbxassetid://782353443", orb, 10, 1)
CFuncs["Sound"].Create("rbxassetid://335657174", orb, 10, 1)
end
for i = 0, 2 do
sphere(1,"Add",orb.CFrame,vt(orbm.Scale.x,orbm.Scale.y,orbm.Scale.z),1,BrickColor.new("New Yeller"))
sphere(2,"Add",orb.CFrame,vt(orbm.Scale.x,orbm.Scale.y,orbm.Scale.z),2,BrickColor.new("Bright yellow"))
end
for i = 0, 19 do
slash(math.random(10,20)/10,5,true,"Round","Add","Out",orb.CFrame*CFrame.new(0,-3,0)*CFrame.Angles(math.rad(math.random(-1, 1)), math.rad(math.random(-360, 360)), math.rad(math.random(-360, 360))),vt(0.05,0.01,0.05),math.random(300,400)/250,BrickColor.new"Gold")
sphereMK(1,2.5,"Add",orb.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),5,5,50,-0.05,BrickColor.new("Gold"),0)
sphereMK(2,5,"Add",orb.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),5,5,50,-0.05,BrickColor.new("New Yeller"),0)
end
for i = 0, 49 do
swait()
shakes(0.5,0.3)
orbm.Scale = orbm.Scale + vt(1,1,1)
orb.Transparency = orb.Transparency + 0.02
end
hum.CameraOffset = vt(0,0,0)
game:GetService("Debris"):AddItem(orb, 10)
end))
for i = 0,3,0.1 do
swait()
RH.C0=clerp(RH.C0,cf(1,-0.4,-0.5)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-3 + 2.75 * math.cos(sine / 64)),math.rad(0 - 1 * math.cos(sine / 56)),math.rad(-10 - 7 * math.cos(sine / 56))),.1)
LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-3 + 2.75 * math.cos(sine / 64)),math.rad(0 - 1 * math.cos(sine / 56)),math.rad(10 + 3 * math.cos(sine / 52))),.1)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0 + 0.07 * math.cos(sine / 32),2.25 + 0.75 * math.cos(sine / 32))*angles(math.rad(30 - 2 * math.cos(sine / 32)),math.rad(0),math.rad(0)),.1)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(-30 - 2 * math.cos(sine / 37)),math.rad(0 + 1 * math.cos(sine / 58)),math.rad(0 + 2 * math.cos(sine / 53))),.1)
RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.4 + 0.05 * math.sin(sine / 30), 0.2) * angles(math.rad(-190), math.rad(0), math.rad(0)), 0.1)
LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.4 + 0.05 * math.cos(sine / 30),0.2) * angles(math.rad(-190), math.rad(0), math.rad(0)), 0.1)
end
attack = false
hum.WalkSpeed = 16
end

function ExtCalbeam()
	local lookavec = 0 
	local mult = 1
	local keptcolor = MAINRUINCOLOR
local dis = CreateParta(char,0,1,"Neon",keptcolor)
for i = 0, 2 do
CFuncs["Sound"].Create("rbxassetid://335657174", dis, 10, 0.5)
end
dis.CFrame = root.CFrame*CFrame.new(0,2,-3)
CreateMesh(dis,"Sphere",4,4,4)
local at1 = Instance.new("Attachment",dis)
at1.Position = vt(-2,0,0)
local at2 = Instance.new("Attachment",dis)
at2.Position = vt(2,0,0)
local trl = Instance.new('Trail',dis)
trl.Attachment0 = at1
trl.Attachment1 = at2
trl.Texture = "rbxassetid://01049219073"
trl.LightEmission = 1
trl.FaceCamera = true
trl.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0),NumberSequenceKeypoint.new(1, 1)})
trl.Color = ColorSequence.new(dis.Color)
trl.Lifetime = 3
local efec = Instance.new("ParticleEmitter",dis)
efec.Texture = "rbxassetid://0144580273"
efec.LightEmission = 1
efec.Color = ColorSequence.new(keptcolor.Color)
efec.Rate = 500000
efec.Lifetime = NumberRange.new(1)
efec.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,2,0),NumberSequenceKeypoint.new(1,0,0)})
efec.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(1,1,0)})
efec.Drag = 5
efec.Rotation = NumberRange.new(-500,500)
efec.VelocitySpread = 9000
efec.RotSpeed = NumberRange.new(-500,500)
local a = Instance.new("Part",workspace)
	a.Name = "Direction"	
	a.Anchored = true
	a.BrickColor = bc("Bright red")
a.Material = "Neon"
a.Transparency = 1
	a.CanCollide = false
	local ray = Ray.new(
	    dis.CFrame.p,                           -- origin
	    (mouse.Hit.p - dis.CFrame.p).unit * 500 -- direction
	) 
	local ignore = dis
	local hit, position, normal = workspace:FindPartOnRay(ray, ignore)
	a.BottomSurface = 10
	a.TopSurface = 10
	local distance = (dis.CFrame.p - position).magnitude
	a.Size = Vector3.new(0.1, 0.1, 0.1)
	a.CFrame = CFrame.new(dis.CFrame.p, position) * CFrame.new(0, 0, 0)
dis.CFrame = a.CFrame
a:Destroy()
local bv = Instance.new("BodyVelocity")
bv.maxForce = Vector3.new(1e9, 1e9, 1e9)
bv.velocity = dis.CFrame.lookVector*250
bv.Parent = dis
game:GetService("Debris"):AddItem(dis, 15)
local hitted = false
coroutine.resume(coroutine.create(function()
dis.Touched:connect(function(hit) 
	if hitted == false and hit.Parent ~= char then
	hitted = true
	shakes(1,1)
	efec.Enabled = false
	dis.Anchored = true
	dis.Transparency = 1
	local elocacenter = CreateParta(char,1,1,"SmoothPlastic",BrickColor.random())
elocacenter.Anchored = true
elocacenter.CFrame = dis.CFrame*CFrame.new(0,1,0)
elocacenter.Orientation = Vector3.new(0,0,0)
local eloca1 = CreateParta(elocacenter,1,1,"SmoothPlastic",BrickColor.random())
eloca1.Anchored = true
eloca1.CFrame = elocacenter.CFrame
local at1 = Instance.new("Attachment",eloca1)
at1.Position = vt(0,20,0)
local at2 = Instance.new("Attachment",eloca1)
at2.Position = vt(0,-20,0)
local at1b = Instance.new("Attachment",eloca1)
at1b.Position = vt(0,0,100)
local at2b = Instance.new("Attachment",eloca1)
at2b.Position = vt(0,0,-100)
local trl = Instance.new('Trail',eloca1)
trl.Attachment0 = at1
trl.Attachment1 = at2
trl.Texture = "rbxassetid://01049219073"
trl.LightEmission = 1
trl.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0),NumberSequenceKeypoint.new(1, 1)})
trl.Color = ColorSequence.new(keptcolor.Color)
trl.Lifetime = 4
local trl2 = trl:Clone()
trl2.Parent = eloca1
trl2.Attachment0 = at1b
trl2.Attachment1 = at2b
trl2.Texture = "rbxassetid://02108945559"
trl2.Lifetime = 2
local eff = Instance.new("ParticleEmitter",eloca1)
eff.Texture = "rbxassetid://02273224484"
eff.LightEmission = 1
eff.Color = ColorSequence.new(keptcolor.Color)
eff.Rate = 500000
eff.Lifetime = NumberRange.new(0.5,3)
eff.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,50,0),NumberSequenceKeypoint.new(0.2,5,0),NumberSequenceKeypoint.new(0.8,5,0),NumberSequenceKeypoint.new(1,0,0)})
eff.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,1,0),NumberSequenceKeypoint.new(0.1,0,0),NumberSequenceKeypoint.new(0.8,0,0),NumberSequenceKeypoint.new(1,1,0)})
eff.Speed = NumberRange.new(20,250)
eff.Drag = 5
eff.Rotation = NumberRange.new(-500,500)
eff.VelocitySpread = 9000
eff.RotSpeed = NumberRange.new(-50,50)
local eloca2 = eloca1:Clone()
eloca2.Parent = elocacenter
local eloca3 = eloca1:Clone()
eloca3.Parent = elocacenter
local eloca4 = eloca1:Clone()
eloca4.Parent = elocacenter
sphere2(2,"Add",elocacenter.CFrame,vt(1,1,1),2,2,2,keptcolor)
sphere2(3,"Add",elocacenter.CFrame,vt(1,1,1),4,4,4,keptcolor)
sphere2(4,"Add",elocacenter.CFrame,vt(1,1,1),5,5,5,keptcolor)
sphere2(5,"Add",elocacenter.CFrame,vt(1,1,1),6,6,6,keptcolor)
for i = 0, 2 do
CFuncs["Sound"].Create("rbxassetid://419447292", elocacenter, 8, 1)
CFuncs["Sound"].Create("rbxassetid://1192402877", elocacenter, 10, 0.5)
end
local effx = Instance.new("ParticleEmitter",elocacenter)
effx.Texture = "rbxassetid://0144580273" -- 144580273 74564879
effx.LightEmission = 1
effx.Color = ColorSequence.new(keptcolor.Color)
effx.Rate = 500000
effx.Lifetime = NumberRange.new(0.25,0.75)
effx.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(1,200,0)})
effx.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,1,0),NumberSequenceKeypoint.new(0.1,0.5,0),NumberSequenceKeypoint.new(0.8,0,0),NumberSequenceKeypoint.new(1,1,0)})
effx.Speed = NumberRange.new(0,10)
effx.Drag = 5
effx.Rotation = NumberRange.new(-500,500)
effx.VelocitySpread = 9000
effx.RotSpeed = NumberRange.new(-50,50)
coroutine.resume(coroutine.create(function()
	wait(0.05)
	effx.Enabled = false
end))
coroutine.resume(coroutine.create(function()
for i = 0, 9, 0.1 do
	swait()
	mult = mult + 0.5
lookavec = lookavec + 0.06*mult
sphere2(5,"Add",elocacenter.CFrame,vt(1,1,1),0.05*lookavec/2,0.001,0.05*lookavec/2,keptcolor)
elocacenter.CFrame = elocacenter.CFrame*CFrame.Angles(0,math.rad(5*mult/20),0)
eloca1.CFrame = elocacenter.CFrame*CFrame.new(-lookavec,0,0)
eloca2.CFrame = elocacenter.CFrame*CFrame.Angles(0,math.rad(90),0)*CFrame.new(-lookavec,0,0)
eloca3.CFrame = elocacenter.CFrame*CFrame.Angles(0,math.rad(180),0)*CFrame.new(-lookavec,0,0)
eloca4.CFrame = elocacenter.CFrame*CFrame.Angles(0,math.rad(270),0)*CFrame.new(-lookavec,0,0)
end
for i = 0, 19, 0.1 do
	swait()
sphere2(5,"Add",elocacenter.CFrame,vt(1,1,1),0.05*lookavec/2,0.001,0.05*lookavec/2,keptcolor)
elocacenter.CFrame = elocacenter.CFrame*CFrame.Angles(0,math.rad(5*mult/20),0)
eloca1.CFrame = elocacenter.CFrame*CFrame.new(-lookavec,0,0)
eloca2.CFrame = elocacenter.CFrame*CFrame.Angles(0,math.rad(90),0)*CFrame.new(-lookavec,0,0)
eloca3.CFrame = elocacenter.CFrame*CFrame.Angles(0,math.rad(180),0)*CFrame.new(-lookavec,0,0)
eloca4.CFrame = elocacenter.CFrame*CFrame.Angles(0,math.rad(270),0)*CFrame.new(-lookavec,0,0)
end
shakes(1.5,1.5)
MagniDamage(elocacenter, 200, 50,99, 0, "Normal")
coroutine.resume(coroutine.create(function()
for i, v in pairs(FindNearestHead(elocacenter.CFrame.p, 150)) do
if v:FindFirstChild('Head') then
dmg(v)
end
end
end))
local effe = Instance.new("ParticleEmitter",elocacenter)
effe.Texture = "rbxassetid://02273224484"
effe.LightEmission = 1
effe.Color = ColorSequence.new(keptcolor.Color)
effe.Rate = 500000
effe.Lifetime = NumberRange.new(3,5)
effe.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,150,0),NumberSequenceKeypoint.new(0.2,15,0),NumberSequenceKeypoint.new(0.8,15,0),NumberSequenceKeypoint.new(1,0,0)})
effe.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,1,0),NumberSequenceKeypoint.new(0.1,0,0),NumberSequenceKeypoint.new(0.8,0,0),NumberSequenceKeypoint.new(1,1,0)})
effe.Speed = NumberRange.new(250,1200)
effe.Drag = 5
effe.Rotation = NumberRange.new(-500,500)
effe.VelocitySpread = 9000
effe.RotSpeed = NumberRange.new(-50,50)
coroutine.resume(coroutine.create(function()
	effx.Enabled = true
	wait(0.15)
	effx.Enabled = false
	wait(0.25)
	effe.Enabled = false
end))
coroutine.resume(coroutine.create(function()
	local elocor = elocacenter
local lookavec = 0 
	local mult = 1
local elocacenter = CreateParta(elocor,1,1,"SmoothPlastic",BrickColor.random())
elocacenter.Anchored = true
elocacenter.CFrame = elocor.CFrame
local eloca1 = CreateParta(elocacenter,1,1,"SmoothPlastic",BrickColor.random())
eloca1.Anchored = true
eloca1.CFrame = elocacenter.CFrame
local at1 = Instance.new("Attachment",eloca1)
at1.Position = vt(0,10,0)
local at2 = Instance.new("Attachment",eloca1)
at2.Position = vt(0,-10,0)
local trl = Instance.new('Trail',eloca1)
trl.Attachment0 = at1
trl.Attachment1 = at2
trl.Texture = "rbxassetid://01049219073"
trl.LightEmission = 1
trl.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0),NumberSequenceKeypoint.new(1, 1)})
trl.Color = ColorSequence.new(keptcolor.Color)
trl.Lifetime = 8
local eff = Instance.new("ParticleEmitter",eloca1)
eff.Texture = "rbxassetid://02273224484"
eff.LightEmission = 1
eff.Color = ColorSequence.new(keptcolor.Color)
eff.Rate = 500000
eff.Lifetime = NumberRange.new(0.5,1)
eff.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,20,0),NumberSequenceKeypoint.new(0.2,2,0),NumberSequenceKeypoint.new(0.8,2,0),NumberSequenceKeypoint.new(1,0,0)})
eff.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,1,0),NumberSequenceKeypoint.new(0.1,0,0),NumberSequenceKeypoint.new(0.8,0,0),NumberSequenceKeypoint.new(1,1,0)})
eff.Speed = NumberRange.new(20,250)
eff.Drag = 5
eff.Rotation = NumberRange.new(-500,500)
eff.VelocitySpread = 9000
eff.RotSpeed = NumberRange.new(-50,50)
local eloca2 = eloca1:Clone()
eloca2.Parent = elocacenter
local eloca3 = eloca1:Clone()
eloca3.Parent = elocacenter
local eloca4 = eloca1:Clone()
eloca4.Parent = elocacenter
coroutine.resume(coroutine.create(function()
for i = 0, 19, 0.1 do
	swait()
	mult = mult + 0.25
lookavec = lookavec + 0.05*mult
elocacenter.CFrame = elocacenter.CFrame*CFrame.Angles(0,math.rad(5*mult/10),0)
eloca1.CFrame = elocacenter.CFrame*CFrame.new(40+lookavec/5,-15+lookavec*2,0)
eloca2.CFrame = elocacenter.CFrame*CFrame.new(-40-lookavec/5,-15+lookavec*2,0)
eloca3.CFrame = elocacenter.CFrame*CFrame.new(0,-15+lookavec*2,40+lookavec/5)
eloca4.CFrame = elocacenter.CFrame*CFrame.new(0,-15+lookavec*2,-40-lookavec/5)
end
for i,v in pairs(elocacenter:GetDescendants()) do
	if v:IsA("ParticleEmitter") then
		v.Enabled = false
	end
end
wait(6)
elocacenter:Destroy()
end))
end))
CFuncs["Sound"].Create("rbxassetid://763717897", char, 3, 1)
CFuncs["Sound"].Create("rbxassetid://763717897", char, 3, 0.75)
CFuncs["Sound"].Create("rbxassetid://763717897", char, 4, 0.5)
CFuncs["Sound"].Create("rbxassetid://1192402877", char, 6,0.5)
CFuncs["Sound"].Create("rbxassetid://1664711478", char, 2.5,1)
CFuncs["Sound"].Create("rbxassetid://763718160", char, 3, 0.75)
symbolizeBlink(elocacenter,0,144580273,keptcolor.Color,20,0,0,0,root,true,-5,3)
symbolizeBlink(elocacenter,0,144580273,keptcolor.Color,40,0,0,0,root,true,-5,3)
symbolizeBlink(elocacenter,0,144580273,keptcolor.Color,60,0,0,0,root,true,-5,3)
symbolizeBlink(elocacenter,0,144580273,keptcolor.Color,80,0,0,0,root,true,-5,3)
sphere2(2,"Add",elocacenter.CFrame,vt(10,10000,10),2,2,2,keptcolor)
sphere2(1,"Add",elocacenter.CFrame,vt(10,10000,10),2,2,2,keptcolor)
sphere2(2,"Add",elocacenter.CFrame,vt(10,10,10),5,5,5,keptcolor)
sphere2(2,"Add",elocacenter.CFrame,vt(10,10,10),7.5,7.5,7.5,keptcolor)
sphere2(2,"Add",elocacenter.CFrame,vt(10,10,10),10,10,10,keptcolor)
sphere2(2,"Add",elocacenter.CFrame,vt(10,10,10),2.5,2.5,2.5,keptcolor)
for i = 0, 29 do
		slash(math.random(10,30)/10,5,true,"Round","Add","Out",elocacenter.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(0.01,0.01,0.01),math.random(500,1000)/250,BrickColor.new("White"))
	end
for i = 0, 9, 0.1 do
	swait()
	mult = mult - 0.5
lookavec = lookavec - 0.06*mult
sphere2(5,"Add",elocacenter.CFrame,vt(1,1,1),0.05*lookavec/2,0.001,0.05*lookavec/2,keptcolor)
elocacenter.CFrame = elocacenter.CFrame*CFrame.Angles(0,math.rad(5*mult/20),0)
eloca1.CFrame = elocacenter.CFrame*CFrame.new(-lookavec,0,0)
eloca2.CFrame = elocacenter.CFrame*CFrame.Angles(0,math.rad(90),0)*CFrame.new(-lookavec,0,0)
eloca3.CFrame = elocacenter.CFrame*CFrame.Angles(0,math.rad(180),0)*CFrame.new(-lookavec,0,0)
eloca4.CFrame = elocacenter.CFrame*CFrame.Angles(0,math.rad(270),0)*CFrame.new(-lookavec,0,0)
end
for i,v in pairs(elocacenter:GetDescendants()) do
	if v:IsA("ParticleEmitter") then
		v.Enabled = false
	end
end
wait(6)
elocacenter:Destroy()
end))
end
end)
end))	
end

function Slice()
	attack = true
	hum.WalkSpeed = 0
	bosschatfunc("Hah!",MAINRUINCOLOR.Color,0.3)
	for i = 0,5,0.1 do
		swait()
		sphere2(8,"Add",rarm.CFrame*CFrame.new(0,-1,0)*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(1,1,1),-0.01,0.05,-0.01,BrickColor.new("Really red"),BrickColor.new("Really red").Color)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0 + 0.05 * math.cos(sine / 28))*angles(math.rad(0 - 1 * math.cos(sine / 34)),math.rad(0),math.rad(0)),.1)
Torso.Neck.C0 = clerp(Torso.Neck.C0,necko *angles(math.rad(5),math.rad(0),math.rad(20)),.3)
RW.C0 = clerp(RW.C0, CFrame.new(1.25, 0.5, 0.5) * angles(math.rad(90), math.rad(0), math.rad(100 + 5 * math.cos(sine / 5))), 0.3)
LW.C0 = clerp(LW.C0, CFrame.new(-1.25, 0.5, -0.5) * angles(math.rad(80), math.rad(32), math.rad(60 + 5 * math.cos(sine / 5))), 0.3)
RH.C0=clerp(RH.C0,cf(1,-1,0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-2),math.rad(0),math.rad(-20)),.3)
LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(2),math.rad(10),math.rad(-10)),.3)
	end
	local hitb = CreateParta(m,1,1,"SmoothPlastic",BrickColor.Random())
hitb.Anchored = true
hitb.CFrame = root.CFrame + root.CFrame.lookVector*6
MagniDamage(hitb, 6, 25,40, 0, "Normal",153092213)
coroutine.resume(coroutine.create(function()
	for i = 0, 5 do
		swait(1)
		hitb.CFrame = hitb.CFrame + hitb.CFrame.lookVector*2.5
		MagniDamage(hitb, 6, 25,40, 0, "Normal",153092213)
		
	end
end))
	CFuncs["Sound"].Create("rbxassetid://203691492", handlex, 1.5,1)
local dis = CreateParta(char,1,1,"Neon",BrickColor.random())
dis.CFrame = root.CFrame*CFrame.Angles(0,0,math.rad(math.random(-10,10))) + root.CFrame.lookVector*2
CFuncs["Sound"].Create("rbxassetid://203691785", dis, 2,1)
local at1 = Instance.new("Attachment",dis)
at1.Position = vt(-10,0,0)
local at2 = Instance.new("Attachment",dis)
at2.Position = vt(10,0,0)
local trl = Instance.new('Trail',dis)
trl.Attachment0 = at1
--trl.FaceCamera = true
trl.Attachment1 = at2
trl.Texture = "rbxassetid://02342682798"
trl.LightEmission = 1
trl.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0),NumberSequenceKeypoint.new(1, 1)})
trl.Color = ColorSequence.new(BrickColor.random().Color)
trl.Lifetime = 1
local bv = Instance.new("BodyVelocity")
bv.maxForce = Vector3.new(1e9, 1e9, 1e9)
bv.velocity = dis.CFrame.lookVector*250
bv.Parent = dis
coroutine.resume(coroutine.create(function()
	wait(0.1)
	dis.Anchored = true
	wait(3)
	hitb:Destroy()
	dis:Destroy()
end))
	for i = 0,1,0.3 do
		swait()
		trl.Color = ColorSequence.new(BrickColor.random().Color)
		revw.C0 = CFrame.new(0,-1.5,0) * angles(math.rad(180), math.rad(0), math.rad(0))
           RootJoint.C0 = clerp(RootJoint.C0,RootCF*cf(0,-0.5,0)* angles(math.rad(10),math.rad(0),math.rad(60)),0.3)
Torso.Neck.C0 = clerp(Torso.Neck.C0,necko *angles(math.rad(10),math.rad(-10),math.rad(-60)),.3)
RW.C0 = clerp(RW.C0, CFrame.new(1.25, 0.5, -0.5) * angles(math.rad(90), math.rad(0), math.rad(50)), 0.3)
LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5, 0) * angles(math.rad(-25), math.rad(32), math.rad(-70)), 0.3)
RH.C0=clerp(RH.C0,cf(1,-1,0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-2),math.rad(-30),math.rad(15)),.3)
LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(2),math.rad(0),math.rad(35)),.3)
	end
	for i = 0,2,0.1 do
		swait()
		trl.Color = ColorSequence.new(BrickColor.random().Color)
           RootJoint.C0 = clerp(RootJoint.C0,RootCF*cf(0,-0.5,0)* angles(math.rad(10),math.rad(0),math.rad(70)),0.3)
Torso.Neck.C0 = clerp(Torso.Neck.C0,necko *angles(math.rad(10),math.rad(-10),math.rad(-70)),.3)
RW.C0 = clerp(RW.C0, CFrame.new(1.25, 0.5, -0.5) * angles(math.rad(100), math.rad(0), math.rad(-30)), 0.3)
LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5, 0) * angles(math.rad(-25), math.rad(32), math.rad(-70)), 0.3)
RH.C0=clerp(RH.C0,cf(1,-1,0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-2),math.rad(-35),math.rad(20)),.3)
LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(2),math.rad(0),math.rad(40)),.3)
	end
	attack = false
	trl.Enabled = false
	hum.WalkSpeed = storehumanoidWS
		revw.C0 = CFrame.new(0,-1,1) * angles(math.rad(90), math.rad(0), math.rad(0))

end

-------------------------------------

Humanoid.Animator.Parent = nil

-------------------------------------

local insanemode = false

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
mouse.KeyDown:connect(function(k)
if k == "q" and attack == false and ModeOfGlitch ~= 1 then
--normalmog() ---Disabled and temporary use
ModeOfGlitch = 1
storehumanoidWS = 16
hum.WalkSpeed = 16
rainbowmode = false
chaosmode = false
insanemode = false
newTheme("rbxassetid://1751171913",0,1,1.25) -- 1751171913
RecolorTextAndRename("DESCLERATION",Color3.new(0,0,1),Color3.new(1,0,0),"Antique")
MAINRUINCOLOR = BrickColor.new("Really red")
VISText.Text = "CAMELLIA - DISTORTED SPACE"
RecolorThing(MAINRUINCOLOR,BrickColor.new("Dark blue"),MAINRUINCOLOR,MAINRUINCOLOR,MAINRUINCOLOR,1,MAINRUINCOLOR,1,MAINRUINCOLOR,true,false)
end
if k == "m" and attack == false and ModeOfGlitch == 1 then
ModeOfGlitch = 105
storehumanoidWS = 95
hum.WalkSpeed = 95
rainbowmode = false
chaosmode = false
insanemode = false
newTheme("rbxassetid://1930926455",0,1,1.8)
RecolorTextAndRename("EXPERTIOUS",Color3.new(0.3,0,0),BrickColor.new(0.1,0,0.25).Color,"Antique")
MAINRUINCOLOR = BrickColor.new(70/255,0,0)
VISText.Text = "CAMELLIA - XEROA"
RecolorThing(MAINRUINCOLOR,BrickColor.new(0,0,45/255),MAINRUINCOLOR,MAINRUINCOLOR,MAINRUINCOLOR,1,MAINRUINCOLOR,1,MAINRUINCOLOR,true,false)
end
if k == "e" and attack == false and ModeOfGlitch ~= 2 then
ModeOfGlitch = 2
storehumanoidWS = 16
hum.WalkSpeed = 16
rainbowmode = false
chaosmode = false
insanemode = false
newTheme("rbxassetid://1861780345",0,1,1.25)
RecolorTextAndRename("MORPHICAL",Color3.new(0,1,1),Color3.new(1,1,1),"Arcade")
MAINRUINCOLOR = BrickColor.new("Toothpaste")
VISText.Text = "CAMELLIA - CRYSTALLIZED"
RecolorThing(MAINRUINCOLOR,BrickColor.new("White"),MAINRUINCOLOR,MAINRUINCOLOR,MAINRUINCOLOR,1,MAINRUINCOLOR,1,MAINRUINCOLOR,true,false)
end
if k == "f" and attack == false and ModeOfGlitch ~= 4 then
ModeOfGlitch = 4
storehumanoidWS = 100
hum.WalkSpeed = 100
rainbowmode = false
chaosmode = false
insanemode = false
newTheme("rbxassetid://982687613",0,1,1.3)
RecolorTextAndRename("FIBERIATUS",BrickColor.new("Bright bluish green").Color,BrickColor.new("Forest green").Color,"SciFi")
MAINRUINCOLOR = BrickColor.new("Bright bluish green")
VISText.Text = "CAMELLIA - CHIRALITY"
RecolorThing(MAINRUINCOLOR,BrickColor.new("Forest green"),MAINRUINCOLOR,MAINRUINCOLOR,MAINRUINCOLOR,1,MAINRUINCOLOR,1,MAINRUINCOLOR,true,false)
end
if k == "m" and attack == false and ModeOfGlitch == 2 then
ModeOfGlitch = 205
storehumanoidWS = 85
hum.WalkSpeed = 85
rainbowmode = false
chaosmode = false
insanemode = false
newTheme("rbxassetid://577543579",0,1,1.25)
RecolorTextAndRename("NOCTURNALIST",BrickColor.new("Really black").Color,BrickColor.new("Black").Color,"Antique")
MAINRUINCOLOR = BrickColor.new("Black")
VISText.Text = "XI - BLUE ZENITH"
RecolorThing(MAINRUINCOLOR,BrickColor.new("Really black"),MAINRUINCOLOR,MAINRUINCOLOR,MAINRUINCOLOR,1,MAINRUINCOLOR,1,MAINRUINCOLOR,true,false)
end
if k == "r" and attack == false and ModeOfGlitch ~= 3 then
ModeOfGlitch = 3
storehumanoidWS = 50
hum.WalkSpeed = 50
rainbowmode = false
chaosmode = false
insanemode = false
newTheme("rbxassetid://1119709168",0,1,1.25)
RecolorTextAndRename("ANOMALISTIC",BrickColor.new("Royal purple").Color,Color3.new(1,1,1),"Antique")
MAINRUINCOLOR = BrickColor.new("Royal purple")
VISText.Text = "CAMELLIA - BEZERKERZ WARFARE 345"
RecolorThing(MAINRUINCOLOR,BrickColor.new("White"),MAINRUINCOLOR,MAINRUINCOLOR,MAINRUINCOLOR,1,MAINRUINCOLOR,1,MAINRUINCOLOR,true,false)
end
if k == "t" and attack == false and ModeOfGlitch ~= 5 then
ModeOfGlitch = 5
warn("Animations by Kermat")
storehumanoidWS = 15
hum.WalkSpeed = 15
rainbowmode = false
chaosmode = false
insanemode = false
newTheme("rbxassetid://2404024634",0,1,1.7)
RecolorTextAndRename("DEPRESSION",BrickColor.new("Electric blue").Color,BrickColor.new("Deep blue").Color,"Code")
MAINRUINCOLOR = BrickColor.new("Electric blue")
VISText.Text = "ATLAS - DEFEATED"
RecolorThing(MAINRUINCOLOR,BrickColor.new("Deep blue"),MAINRUINCOLOR,MAINRUINCOLOR,MAINRUINCOLOR,1,MAINRUINCOLOR,1,MAINRUINCOLOR,true,false)
end
if k == "g" and attack == false and ModeOfGlitch ~= 9 then
ModeOfGlitch = 9
storehumanoidWS = 60
hum.WalkSpeed = 60
rainbowmode = false
chaosmode = false
insanemode = true
newTheme("rbxassetid://2330164404",0,1,1.7)
RecolorTextAndRename("GLITCH",BrickColor.new("Really black").Color,Color3.new(math.random(0,0.1),0,0),"Bodoni")
MAINRUINCOLOR = BrickColor.new("Lime green")
VISText.Text = "Neros Day At Disneyland - Heavens Gate"
RecolorThing(MAINRUINCOLOR,BrickColor.new("Really black"),MAINRUINCOLOR,MAINRUINCOLOR,MAINRUINCOLOR,1,MAINRUINCOLOR,1,MAINRUINCOLOR,true,false)
end
if k == "m" and attack == false and ModeOfGlitch == 9 then
ModeOfGlitch = "INSANITY"
storehumanoidWS = 10
hum.WalkSpeed = 10
rainbowmode = false
chaosmode = true
insanemode = false
newTheme("rbxassetid://849713469",0,0.66,1.7)
RecolorTextAndRename("INSANITY",BrickColor.new("Really black").Color,Color3.new(math.random(0,1),math.random(0,1),math.random(0,1)),"Antique")
MAINRUINCOLOR = BrickColor.new("White")
bosschatfunc("The hate and dispair is catching up to me..",MAINRUINCOLOR.Color,5)
VISText.Text = "OFF - Unreasonable Behavior"
RecolorThing(MAINRUINCOLOR,BrickColor.new("White"),MAINRUINCOLOR,MAINRUINCOLOR,MAINRUINCOLOR,1,MAINRUINCOLOR,1,MAINRUINCOLOR,true,false)
end
if k == "y" and attack == false and ModeOfGlitch ~= 6 then
ModeOfGlitch = 6
storehumanoidWS = 60
hum.WalkSpeed = 60
rainbowmode = false
chaosmode = false
insanemode = false
newTheme("rbxassetid://719008519",0,1,1.7)
RecolorTextAndRename("CELESTIAL",BrickColor.new("Really black").Color,BrickColor.new("Maroon").Color,"Fantasy")
MAINRUINCOLOR = BrickColor.new("Maroon")
VISText.Text = "??? - ???"
RecolorThing(MAINRUINCOLOR,BrickColor.new("Really black"),MAINRUINCOLOR,MAINRUINCOLOR,MAINRUINCOLOR,1,MAINRUINCOLOR,1,MAINRUINCOLOR,true,false)
end
if k == "h" and attack == false and ModeOfGlitch ~= 10 then
-- My special mode! ~SpectrumEeveez
ModeOfGlitch = 10
storehumanoidWS = 20
hum.WalkSpeed = 20
rainbowmode = false
chaosmode = false
insanemode = false
newTheme("rbxassetid://1113734859",0,1,1.2)
RecolorTextAndRename("LUSTFUL",BrickColor.new("White").Color,BrickColor.new("Hot pink").Color,"Cartoon")
MAINRUINCOLOR = BrickColor.new("Pink")
VISText.Text = "Doki Doki Literature Club - Your Reality"
RecolorThing(MAINRUINCOLOR,BrickColor.new("Pink"),MAINRUINCOLOR,MAINRUINCOLOR,MAINRUINCOLOR,1,MAINRUINCOLOR,1,MAINRUINCOLOR,true,false)
end
if k == "u" and attack == false and ModeOfGlitch ~= 7 then
ModeOfGlitch = 7
storehumanoidWS = 20
hum.WalkSpeed = 20
rainbowmode = false
chaosmode = false
insanemode = false
newTheme("rbxassetid://2127419486",0,1,1.7)
RecolorTextAndRename("SERAPHICAL",BrickColor.new("New Yeller").Color,BrickColor.new("White").Color,"SciFi")
MAINRUINCOLOR = BrickColor.new("New Yeller")
VISText.Text = "CAMELLIA - COMPLETENESS UNDER INCOMPLETENESS"
RecolorThing(MAINRUINCOLOR,BrickColor.new("White"),MAINRUINCOLOR,MAINRUINCOLOR,MAINRUINCOLOR,1,MAINRUINCOLOR,1,MAINRUINCOLOR,true,false)
end
if k == "m" and attack == false and ModeOfGlitch == 3 then
ModeOfGlitch = 5555
storehumanoidWS = 50
hum.WalkSpeed = 50
rainbowmode = false
chaosmode = false
insanemode = false
newTheme("rbxassetid://1002071384",0,1,1.25)
RecolorTextAndRename("CONFLAGRATION",BrickColor.new("Deep orange").Color,BrickColor.new"New Yeller".Color,"Bodoni")
MAINRUINCOLOR = BrickColor.new("Deep orange")
VISText.Text = "CAMELLIA - ENANTIOMORPHS"
RecolorThing(MAINRUINCOLOR,BrickColor.new("New Yeller"),MAINRUINCOLOR,MAINRUINCOLOR,MAINRUINCOLOR,1,MAINRUINCOLOR,1,MAINRUINCOLOR,true,false)
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
modet.TextTransparency = 0
modet.TextStrokeTransparency = 0
elseif k == "p" and toggleTag == true then
toggleTag = false
modet.TextTransparency = 1
modet.TextStrokeTransparency = 1
end
if k == "z" and attack == false and ModeOfGlitch == 1 then
DESCLEAREDBURST()
end
if k == "z" and attack == false and ModeOfGlitch == 105 then
LavaPit()
end
if k == "x" and attack == false and ModeOfGlitch == 1 then
Reblink()
end
if k == "z" and attack == false and ModeOfGlitch == 4 then
FiberDestiny()
end
if k == "v" and attack == false and ModeOfGlitch == 6 then
CelestialBloom()
end
if k == "z" and attack == false and ModeOfGlitch == 7 then
SeraphicalThrow()
end
if k == "z" and attack == false and ModeOfGlitch == "INSANITY" then
Slice()
end
end)





coroutine.resume(coroutine.create(function()
while true do
swait()
if ModeOfGlitch == 2 then
sphereMK(10,math.random(10,25)/45,"Add",root.CFrame*CFrame.new(math.random(-20,20),-5,math.random(-20,20))*CFrame.Angles(math.rad(90 + math.random(-5,5)),math.rad(math.random(-5,5)),math.rad(math.random(-5,5))),0.4,0.4,8,0,MAINRUINCOLOR,0)
sphereMK(10,math.random(10,25)/45,"Add",root.CFrame*CFrame.new(math.random(-20,20),-5,math.random(-20,20))*CFrame.Angles(math.rad(90 + math.random(-5,5)),math.rad(math.random(-5,5)),math.rad(math.random(-5,5))),0.4,0.4,8,0,BrickColor.new("White"),0)
elseif ModeOfGlitch == 1 then
sphereMK(10,math.random(10,25)/45,"Add",root.CFrame*CFrame.new(math.random(-20,20),-5,math.random(-20,20))*CFrame.Angles(math.rad(90 + math.random(-5,5)),math.rad(math.random(-5,5)),math.rad(math.random(-5,5))),0.4,0.4,8,0,MAINRUINCOLOR,0)
sphereMK(10,math.random(10,25)/45,"Add",root.CFrame*CFrame.new(math.random(-20,20),-5,math.random(-20,20))*CFrame.Angles(math.rad(90 + math.random(-5,5)),math.rad(math.random(-5,5)),math.rad(math.random(-5,5))),0.4,0.4,8,0,BrickColor.new("Dark blue"),0)
elseif ModeOfGlitch == 205 then
sphereMK(5,math.random(-14,-8)/45,"Add",root.CFrame*CFrame.new(math.random(-25,25),10,math.random(-25,25))*CFrame.Angles(math.rad(90 + math.random(-10,10)),math.rad(math.random(-10,10)),math.rad(math.random(-10,10))),0.25,0.25,7.5,-0.0025,MAINRUINCOLOR,0)
sphereMK(5,math.random(-14,-8)/45,"Add",root.CFrame*CFrame.new(math.random(-25,25),-5,math.random(-25,25))*CFrame.Angles(math.rad(90*3 + math.random(-10,10)),math.rad(math.random(-10,10)),math.rad(math.random(-10,10))),0.25,0.25,7.5,-0.0025,MAINRUINCOLOR,0)
sphere2(5,"Add",root.CFrame*CFrame.new(0,-3,0),vt(10,1,10),0.2,0.01,0.2,MAINRUINCOLOR,MAINRUINCOLOR.Color)
elseif ModeOfGlitch == 5 then
sphere2(5,"Add",root.CFrame*CFrame.new(0,-3,0),vt(10,1,10),0.2,0.01,0.2,BrickColor.new("Bright bluish green"),Color3.new(0.1,0,0))
sphereMK(7.5,math.random(15,50)/45,"Add",root.CFrame*CFrame.new(math.random(-15,15),-10,math.random(-15,15))*CFrame.Angles(math.rad(90 + math.random(-20,20)),math.rad(math.random(-20,20)),math.rad(math.random(-20,20))),0.75,0.75,10,-0.0075,MAINRUINCOLOR,0)
sphereMK(7.5,math.random(15,50)/45,"Add",root.CFrame*CFrame.new(math.random(-15,15),-10,math.random(-15,15))*CFrame.Angles(math.rad(90 + math.random(-20,20)),math.rad(math.random(-20,20)),math.rad(math.random(-20,20))),0.75,0.75,10,-0.0075,BrickColor.new("Deep blue"),0)
elseif ModeOfGlitch == 6 then
sphere2(5,"Add",root.CFrame*CFrame.new(0,-3,0),vt(10,1,10),0.2,0.01,0.2,BrickColor.new("Maroon"),Color3.new(0.1,0,0))
sphereMK(10,math.random(10,25)/45,"Add",root.CFrame*CFrame.new(math.random(-20,20),-5,math.random(-20,20))*CFrame.Angles(math.rad(90 + math.random(-5,5)),math.rad(math.random(-5,5)),math.rad(math.random(-5,5))),0.4,0.4,8,0,MAINRUINCOLOR,0)
sphereMK(10,math.random(10,25)/45,"Add",root.CFrame*CFrame.new(math.random(-20,20),-5,math.random(-20,20))*CFrame.Angles(math.rad(90 + math.random(-5,5)),math.rad(math.random(-5,5)),math.rad(math.random(-5,5))),0.4,0.4,8,0,BrickColor.new("White"),0)
slash(math.random(50,100)/10,5,true,"Round","Add","Out",root.CFrame*CFrame.new(0,-3,0)*CFrame.Angles(math.rad(math.random(-5,5)),math.rad(math.random(-360,360)),math.rad(math.random(-5,5))),vt(0.01,0.01,0.01),math.random(5,50)/250,BrickColor.new("White"))
slash(math.random(75,150)/10,5,true,"Round","Add","Out",root.CFrame*CFrame.new(0,-3,0)*CFrame.Angles(math.rad(math.random(-5,5)),math.rad(math.random(-360,360)),math.rad(math.random(-5,5))),vt(0.01,0.01,0.01),math.random(5,150)/250,MAINRUINCOLOR)
elseif ModeOfGlitch == 7 then
sphere2(5,"Add",root.CFrame*CFrame.new(0,-3,0),vt(10,1,10),0.2,0.01,0.2,BrickColor.new("Gold"),Color3.new(0.1,0,0))
sphereMK(10,math.random(10,25)/45,"Add",root.CFrame*CFrame.new(math.random(-20,20),-5,math.random(-20,20))*CFrame.Angles(math.rad(90 + math.random(-5,5)),math.rad(math.random(-5,5)),math.rad(math.random(-5,5))),0.4,0.4,8,0,MAINRUINCOLOR,0)
sphereMK(10,math.random(10,25)/45,"Add",root.CFrame*CFrame.new(math.random(-20,20),-5,math.random(-20,20))*CFrame.Angles(math.rad(90 + math.random(-5,5)),math.rad(math.random(-5,5)),math.rad(math.random(-5,5))),0.4,0.4,8,0,BrickColor.new("White"),0)
slash(math.random(75,150)/10,5,true,"Round","Add","Out",root.CFrame*CFrame.new(0,-3,0)*CFrame.Angles(math.rad(math.random(-5,5)),math.rad(math.random(-360,360)),math.rad(math.random(-5,5))),vt(0.01,0.01,0.01),math.random(5,150)/250,MAINRUINCOLOR)
elseif ModeOfGlitch == 105 then
sphere2(5,"Add",root.CFrame*CFrame.new(0,-3,0),vt(10,1,10),0.2,0.01,0.2,BrickColor.new("C"),Color3.new(0.1,0,0))
sphereMK(10,math.random(10,25)/45,"Add",root.CFrame*CFrame.new(math.random(-50,50),-5,math.random(-50,50))*CFrame.Angles(math.rad(90 + math.random(-5,5)),math.rad(math.random(-5,5)),math.rad(math.random(-5,5))),0.4,0.4,8,0,MAINRUINCOLOR,0)
sphereMK(10,math.random(10,25)/45,"Add",root.CFrame*CFrame.new(math.random(-50,50),-5,math.random(-50,50))*CFrame.Angles(math.rad(90 + math.random(-5,5)),math.rad(math.random(-5,5)),math.rad(math.random(-5,5))),0.4,0.4,8,0,BrickColor.new("Navy blue"),0)
elseif ModeOfGlitch == 4 then
sphere2(5,"Add",root.CFrame*CFrame.new(0,-3,0),vt(10,1,10),0.2,0.01,0.2,BrickColor.new("Bright bluish green"),Color3.new(0.1,0,0))
sphereMK(10,math.random(10,25)/45,"Add",root.CFrame*CFrame.new(math.random(-20,20),-5,math.random(-20,20))*CFrame.Angles(math.rad(90 + math.random(-5,5)),math.rad(math.random(-5,5)),math.rad(math.random(-5,5))),0.4,0.4,8,0,MAINRUINCOLOR,0)
sphereMK(10,math.random(10,25)/45,"Add",root.CFrame*CFrame.new(math.random(-20,20),-5,math.random(-20,20))*CFrame.Angles(math.rad(90 + math.random(-5,5)),math.rad(math.random(-5,5)),math.rad(math.random(-5,5))),0.4,0.4,8,0,BrickColor.new("Forest green"),0)
elseif ModeOfGlitch == 3 then
sphereMK(10,math.random(10,25)/45,"Add",root.CFrame*CFrame.new(math.random(-20,20),-5,math.random(-20,20))*CFrame.Angles(math.rad(90 + math.random(-5,5)),math.rad(math.random(-5,5)),math.rad(math.random(-5,5))),0.4,0.4,8,0,MAINRUINCOLOR,0)
sphereMK(10,math.random(10,25)/45,"Add",root.CFrame*CFrame.new(math.random(-20,20),-5,math.random(-20,20))*CFrame.Angles(math.rad(90 + math.random(-5,5)),math.rad(math.random(-5,5)),math.rad(math.random(-5,5))),0.4,0.4,8,0,BrickColor.new("White"),0)
elseif ModeOfGlitch == 5555 then
slash(math.random(30,60)/10,5,true,"Round","Add","In",tors.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(0.5,0.01,0.5),-0.5,MAINRUINCOLOR)
sphere2(5,"Add",root.CFrame*CFrame.new(0,-3,0),vt(10,1,10),0.2,0.01,0.2,MAINRUINCOLOR,MAINRUINCOLOR.Color)
elseif ModeOfGlitch == 9 then
PixelBlockX(5,0.25,"Add",rarm.CFrame*CFrame.new(0,-1,0)*CFrame.Angles(math.rad(90 + math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),0.75,0.75,0.75,0.0075,MAINRUINCOLOR,0)
PixelBlockX(5,0.25,"Add",larm.CFrame*CFrame.new(0,-1,0)*CFrame.Angles(math.rad(90 + math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),0.75,0.75,0.75,0.0075,MAINRUINCOLOR,0)
elseif ModeOfGlitch == 10 then
swait(25)
sphere2(4,"Add",root.CFrame*CFrame.new(0,-3,0),vt(1,1,1),0.25,0,0.25,MAINRUINCOLOR)
sphere2(5,"Add",root.CFrame*CFrame.new(0,-3,0),vt(1,1,1),0.5,0,0.5,MAINRUINCOLOR)
local notsp = Instance.new("Part", char)
notsp.CanCollide = false
notsp.FormFactor = 3
notsp.Name = "Ring"
notsp.Material = "Neon"
notsp.Size = Vector3.new(10, 1, 10)
if math.random(1,6) == 1 then
notsp.Size = Vector3.new(25, 1, 25)
end
notsp.Transparency = 1
notsp.TopSurface = 0
notsp.BottomSurface = 0
notsp.Anchored = true
notsp.CFrame = root.CFrame*CFrame.new(0,-3,0)
coroutine.resume(coroutine.create(function()
local eff = Instance.new("ParticleEmitter",notsp)
eff.Texture = "rbxassetid://0749327003"
eff.LightEmission = 1
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
if ModeOfGlitch == 10 then
eff.Color = ColorSequence.new(BrickColor.new"Pink".Color)
elseif ModeOfGlitch ~= 10 then
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
coroutine.resume(coroutine.create(function()
while true do
swait(2)
if chaosmode == true then
	Knife.Transparency = 0
RecolorTextAndRename("INSANITY",BrickColor.random().Color,BrickColor.random().Color,"Antique")
tl1.Color = ColorSequence.new(BrickColor.random().Color)
tl2.Color = ColorSequence.new(BrickColor.random().Color)
tl3.Color = ColorSequence.new(BrickColor.random().Color)
for i, v in pairs(mw1:GetChildren()) do
if v:IsA("Part") then
v.Transparency = 0.75
v.BrickColor = BrickColor.random()
v.Material = "Neon"
end
end
for i, v in pairs(m2:GetChildren()) do
if v:IsA("Part") then
	v.Transparency = 0.75
v.BrickColor = BrickColor.random()
v.Material = "Neon"
end
end
for i, v in pairs(mw2:GetChildren()) do
if v:IsA("Part") then
	v.Transparency = 0.75
v.BrickColor = BrickColor.random()
v.Material = "Neon"
end
end
elseif chaosmode == false then
Knife.Transparency = 1
for i, v in pairs(mw2:GetChildren()) do
if v:IsA("Part") then
v.Transparency = 0
v.Material = "Neon"
end
end

end
end
end))

Humanoid.MaxHealth = math.huge
Humanoid.Health = math.huge
Instance.new("ForceField",char).Visible = false

local bguis = Instance.new("BillboardGui",tors)
bguis.Size = UDim2.new(25, 0, 25, 0)
local imgca = Instance.new("ImageLabel",bguis)
imgca.BackgroundTransparency = 1
imgca.ImageTransparency = 1
imgca.Size = UDim2.new(1,0,1,0)
imgca.Image = "rbxassetid://2344830904" --997291547,521073910,2312119891,2344830904
imgca.ImageColor3 = Color3.new(0,0,0)

idleanim=.4
while true do
local WALKSPEEDVALUE = 12 / (hum.WalkSpeed / 16)
if mutedtog == false then
kan.Volume = currentVol
elseif mutedtog == true then
kan.Volume = 0
end
kan.PlaybackSpeed = currentPitch
kan.Pitch = currentPitch
kan.SoundId = currentThemePlaying
kan.Looped = true
kan.Parent = char
kan:Resume()
if ModeOfGlitch ~= 1264532489 and ModeOfGlitch ~= 55469696922 and ModeOfGlitch ~= 4367677813 and ModeOfGlitch ~= 9999999921111 and ModeOfGlitch ~= 999999999556 and ModeOfGlitch ~= 765688533321 and ModeOfGlitch ~= 88893333388 and ModeOfGlitch ~= 808080808080808080808080 then
imgca.ImageTransparency = 1
elseif ModeOfGlitch == 1264532489 or ModeOfGlitch == 55469696922 or ModeOfGlitch == 4367677813 or ModeOfGlitch == 9999999921111 or ModeOfGlitch == 999999999556 or ModeOfGlitch == 765688533321 or ModeOfGlitch == 88893333388 or ModeOfGlitch == 808080808080808080808080 then
imgca.ImageColor3 = MAINRUINCOLOR.Color
imgca.ImageTransparency = 0 + 0.25 * math.cos(sine / 30)
end
imgca.Rotation = imgca.Rotation + 5 + kan.PlaybackLoudness/25
bguis.Size = UDim2.new(15 + 3 * math.cos(sine / 30),0, 15 + 3 * math.cos(sine / 30),0)
coroutine.resume(coroutine.create(function()
	if insanemode == true then
for i, v in pairs(mw1:GetChildren()) do
if v:IsA("Part") then
v.Transparency = 0
v.Color = Color3.fromRGB(0,math.random(0,255),0)
v.Material = "Neon"
end
end
for i, v in pairs(mw2:GetChildren()) do
if v:IsA("Part") then
v.Transparency = 0
v.Color = Color3.fromRGB(0,math.random(0,255),0)
v.Material = "Neon"
end
end
tl1.Color = ColorSequence.new(Color3.fromRGB(0,math.random(0,255),0))
tl2.Color = ColorSequence.new(Color3.fromRGB(0,math.random(0,255),0))
tl3.Color = ColorSequence.new(Color3.fromRGB(0,math.random(0,255),0))
tr1.Color = ColorSequence.new(Color3.fromRGB(0,math.random(0,255),0))
tr2.Color = ColorSequence.new(Color3.fromRGB(0,math.random(0,255),0))
tr3.Color = ColorSequence.new(Color3.fromRGB(0,math.random(0,255),0))
	RecolorTextAndRename("GLITCH",Color3.new(0,0,0),Color3.fromRGB(0,math.random(0,255),0),"Fantasy")
	end
end))

if insanemode == false then
modet.Position = UDim2.new(0,0,0,0)
modet.Rotation = -5 * math.cos(sine / 32)
techc.Rotation = techc.Rotation + 1
circl.Rotation = circl.Rotation - kan.PlaybackLoudness/75 - 1
circl2.Rotation = circl2.Rotation + kan.PlaybackLoudness/50 + 1
imgl2.Rotation = imgl2.Rotation - kan.PlaybackLoudness/50 + 1
imgl2b.Rotation = imgl2b.Rotation + kan.PlaybackLoudness/25 - 1
ned.Rotation = 0 - 2 * math.cos(sine / 24)
ned.Position = UDim2.new(0.7,0 - 10 * math.cos(sine / 32),0.8,0 - 10 * math.cos(sine / 45))
wobble.Rotation = 0 - 1 * math.cos(sine / 24)
wobble.BackgroundColor3 = modet.TextColor3
wobble.BorderColor3 = modet.TextStrokeColor3
wobble.BorderSizePixel = 2
wobble2.Rotation = 0 - 1 * math.cos(sine / 30)
wobble2.BackgroundColor3 = modet.TextStrokeColor3
wobble2.BorderColor3 = modet.TextColor3
wobble2.BorderSizePixel = 2
VIS.Rotation = VIS.Rotation + 1
VIS.BackgroundColor3 = modet.TextStrokeColor3
VIS.BorderColor3 = modet.TextColor3
VIS.BorderSizePixel = 4
VIS2.Rotation = VIS2.Rotation - 1
VIS2.BackgroundColor3 = modet.TextStrokeColor3
VIS2.BorderColor3 = modet.TextColor3
VIS2.BorderSizePixel = 4
VISText.TextColor3 = modet.TextColor3
VISText.TextStrokeColor3 = modet.TextStrokeColor3
VISText.TextStrokeTransparency = 0
VISText.Rotation = 0 - 2 * math.cos(sine / 30)
VISText.Position = UDim2.new(0.370,0 - 10 * math.cos(sine / 50),0.861,0 - 10 * math.cos(sine / 50))
else
	techc.Rotation = techc.Rotation + 1
circl.Rotation = circl.Rotation - kan.PlaybackLoudness/75 + math.random(-5,5)
circl2.Rotation = circl2.Rotation + kan.PlaybackLoudness/50 + math.random(-5,5)
imgl2.Rotation = imgl2.Rotation - kan.PlaybackLoudness/50 + math.random(-5,5)
imgl2b.Rotation = imgl2b.Rotation + kan.PlaybackLoudness/25 + math.random(-5,5)
ned.Rotation = 0 -2 * math.cos(sine / 1) + math.random(-3,3)
ned.Position = UDim2.new(0.7,0 + math.random(-3,3),0.8,0 + math.random(-3,3))
modet.Position = UDim2.new(0,math.random(-1,1),0,math.random(-1,1))
modet.Rotation = -2 * math.cos(sine / 1) + math.random(-3,3)
wobble.Rotation = 0 - 1 * math.cos(sine / 15)
wobble.BackgroundColor3 = modet.TextColor3
wobble.BorderColor3 = modet.TextStrokeColor3
wobble.BorderSizePixel = 2
wobble2.Rotation = 0 - 1 * math.cos(sine / 10)
wobble2.BackgroundColor3 = modet.TextStrokeColor3
wobble2.BorderColor3 = modet.TextColor3
wobble2.BorderSizePixel = 2
VIS.Rotation = VIS.Rotation + 3
VIS.BackgroundColor3 = modet.TextStrokeColor3
VIS.BorderColor3 = modet.TextColor3
VIS.BorderSizePixel = 4
VIS2.Rotation = VIS2.Rotation - 3
VIS2.BackgroundColor3 = modet.TextStrokeColor3
VIS2.BorderColor3 = modet.TextColor3
VIS2.BorderSizePixel = 4
VISText.TextColor3 = modet.TextColor3
VISText.TextStrokeColor3 = modet.TextStrokeColor3
VISText.TextStrokeTransparency = 0
VISText.Rotation = 0 - 2 * math.cos(sine / 30)
VISText.Position = UDim2.new(0.370,0 - 10 * math.cos(sine / 50),0.861,0 - 10 * math.cos(sine / 50))
end

if rainbowmode == true then
	circl.ImageColor3 = Color3.new(r/255,g/255,b/255)
	imgl2b.ImageColor3 = Color3.new(r/255,g/255,b/255)
	modet.TextColor3 = Color3.new(r/255,g/255,b/255)
	ned.TextColor3 = Color3.new(r/255,g/255,b/255)
	tr1.Color = ColorSequence.new(Color3.new(r/255,g/255,b/255))
tr2.Color = ColorSequence.new(Color3.new(r/255,g/255,b/255))
tr3.Color = ColorSequence.new(Color3.new(r/255,g/255,b/255))
tl1.Color = ColorSequence.new(Color3.new(r/255,g/255,b/255))
tl2.Color = ColorSequence.new(Color3.new(r/255,g/255,b/255))
tl3.Color = ColorSequence.new(Color3.new(r/255,g/255,b/255))
for i, v in pairs(mw1:GetChildren()) do
if v:IsA("Part") then
v.Color = Color3.new(r/255,g/255,b/255)
end
end
for i, v in pairs(mw2:GetChildren()) do
if v:IsA("Part") then
v.Color = Color3.new(r/255,g/255,b/255)
end
end
end
CameraManager()

swait()
if ModeOfGlitch ~= 205 and ModeOfGlitch ~= 5555 and ModeOfGlitch ~= 105 and ModeOfGlitch ~= 4 then
handleweld.C0=clerp(handleweld.C0,cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.3)
handlexweld.C0=clerp(handleweld.C0,cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.3)
lwing1weld.C1=clerp(lwing1weld.C1,cf(0,0.5 - 0.75 * math.cos(sine / 60),0)*angles(math.rad(0 + 1 * math.cos(sine / 50)),math.rad(0 - 2 * math.cos(36)),math.rad(360 + 1800 * math.cos(sine / 180))),.3)
lwing2weld.C1=clerp(lwing2weld.C1,cf(0,0 - 1 * math.cos(sine / 60),-0.8)*angles(math.rad(0 + 5 * math.cos(sine / 32.5)),math.rad(0 - 2 * math.cos(37)),math.rad(360)),.3)
lwing3weld.C1=clerp(lwing3weld.C1,cf(0,0.5 - 0.75 * math.cos(sine / 60),0)*angles(math.rad(0 + 1 * math.cos(sine / 70)),math.rad(0),math.rad(180 + 1800 * math.cos(sine / 180))),.3)
rwing1weld.C1=clerp(rwing1weld.C1,cf(0,0.5 - 0.75 * math.cos(sine / 60),0)*angles(math.rad(0 + 1 * math.cos(sine / 50)),math.rad(0),math.rad(-90 + 1800 * math.cos(sine / 180))),.3)
rwing2weld.C1=clerp(rwing2weld.C1,cf(0,-1 + 1 * math.cos(sine / 60),-0.9)*angles(math.rad(0 + 5 * math.cos(sine / 32.5)),math.rad(0 - 2 * math.cos(36)),math.rad(180)),.3)
rwing3weld.C1=clerp(rwing3weld.C1,cf(0,0.5 - 0.75 * math.cos(sine / 60),0)*angles(math.rad(0 + 1 * math.cos(sine / 70)),math.rad(0 - 2 * math.cos(37)),math.rad(90 + 1800 * math.cos(sine / 180))),.3)
elseif ModeOfGlitch == "INSANITY" then
handleweld.C0=clerp(handleweld.C0,cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(20 - 20 * math.cos(sine / 60))),.3)
handlexweld.C0=clerp(handleweld.C0,cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(20 - 20 * math.cos(sine / 60))),.3)
lwing1weld.C1=clerp(lwing1weld.C1,cf(0,0.5 - 0.75 * math.cos(sine / 100),0)*angles(math.rad(0 + 1 * math.cos(sine / 100)),math.rad(0 - 2 * math.cos(36)),math.rad(360 + 1800 * math.cos(sine / 400))),.3)
lwing2weld.C1=clerp(lwing2weld.C1,cf(0,0 - 1 * math.cos(sine / 100),-0.8)*angles(math.rad(0 + 5 * math.cos(sine / 100)),math.rad(0 - 2 * math.cos(37)),math.rad(360)),.3)
lwing3weld.C1=clerp(lwing3weld.C1,cf(0,0.5 - 0.75 * math.cos(sine / 100),0)*angles(math.rad(0 + 1 * math.cos(sine / 100)),math.rad(0),math.rad(180 + 1800 * math.cos(sine / 400))),.3)
rwing1weld.C1=clerp(rwing1weld.C1,cf(0,0.5 - 0.75 * math.cos(sine / 100),0)*angles(math.rad(0 + 1 * math.cos(sine / 100)),math.rad(0),math.rad(-90 + 1800 * math.cos(sine / 400))),.3)
rwing2weld.C1=clerp(rwing2weld.C1,cf(0,-1 + 1 * math.cos(sine / 100),-0.9)*angles(math.rad(0 + 5 * math.cos(sine / 100)),math.rad(0 - 2 * math.cos(100)),math.rad(180)),.3)
rwing3weld.C1=clerp(rwing3weld.C1,cf(0,0.5 - 0.75 * math.cos(sine / 100),0)*angles(math.rad(0 + 1 * math.cos(sine / 100)),math.rad(0 - 2 * math.cos(100)),math.rad(90 + 1800 * math.cos(sine / 400))),.3)

elseif ModeOfGlitch == 205 or ModeOfGlitch == 5555 or ModeOfGlitch == 105 then
handleweld.C0=clerp(handleweld.C0,cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.3)
handlexweld.C0=clerp(handleweld.C0,cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.3)
lwing1weld.C1=clerp(lwing1weld.C1,cf(0,1 - 1.5 * math.cos(sine / 90),0)*angles(math.rad(0 + 1 * math.cos(sine / 50)),math.rad(0 - 2 * math.cos(sine / 36)),math.rad(360 - 7200 * math.cos(sine / 720))),.3)
lwing2weld.C1=clerp(lwing2weld.C1,cf(0,0 - 1 * math.cos(sine / 60),-0.8)*angles(math.rad(0 + 5 * math.cos(sine / 32.5)),math.rad(0 - 2 * math.cos(sine / 37)),math.rad(360)),.3)
lwing3weld.C1=clerp(lwing3weld.C1,cf(0,1 - 1.5 * math.cos(sine / 90),0)*angles(math.rad(0 + 1 * math.cos(sine / 70)),math.rad(0),math.rad(180 - 7200 * math.cos(sine / 720))),.3)
rwing1weld.C1=clerp(rwing1weld.C1,cf(0,1 - 1.5 * math.cos(sine / 90),0)*angles(math.rad(0 + 1 * math.cos(sine / 50)),math.rad(0),math.rad(-90 - 7200 * math.cos(sine / 720))),.3)
rwing2weld.C1=clerp(rwing2weld.C1,cf(0,-1 + 1 * math.cos(sine / 60),-0.9)*angles(math.rad(0 + 5 * math.cos(sine / 32.5)),math.rad(0 - 2 * math.cos(sine / 36)),math.rad(180)),.3)
rwing3weld.C1=clerp(rwing3weld.C1,cf(0,1 - 1.5 * math.cos(sine / 90),0)*angles(math.rad(0 + 1 * math.cos(sine / 70)),math.rad(0 - 2 * math.cos(sine / 37)),math.rad(90 - 7200 * math.cos(sine / 720))),.3)
elseif ModeOfGlitch == 125 then
handleweld.C0=clerp(handleweld.C0,cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.3)
handlexweld.C0=clerp(handleweld.C0,cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.3)
lwing1weld.C1=clerp(lwing1weld.C1,cf(0 + 2.5 * math.cos(sine / 180),0.5 + 0.75 * math.cos(sine / 25),0)*angles(math.rad(0 + 1 * math.cos(sine / 50)),math.rad(0 - 2 * math.cos(sine / 36)),math.rad(0 + 3600 * math.cos(sine / 360))),.3)
lwing2weld.C1=clerp(lwing2weld.C1,cf(0 + 2.5 * math.cos(sine / 180),0.5 + 0.75 * math.cos(sine / 25),0)*angles(math.rad(0 + 1 * math.cos(sine / 70)),math.rad(0 - 2 * math.cos(sine / 37)),math.rad(120 + 3600 * math.cos(sine / 360))),.3)
lwing3weld.C1=clerp(lwing3weld.C1,cf(0 + 2.5 * math.cos(sine / 180),0.5 + 0.75 * math.cos(sine / 25),0)*angles(math.rad(0 + 1 * math.cos(sine / 60)),math.rad(0 - 2 * math.cos(sine / 51)),math.rad(-120 + 3600 * math.cos(sine / 360))),.3)
rwing1weld.C1=clerp(rwing1weld.C1,cf(0 + 1.5 * math.cos(sine / 360),-0.25 - 0.5 * math.cos(sine / 25),0)*angles(math.rad(0 + 1 * math.cos(sine / 50)),math.rad(0 - 2 * math.cos(sine / 36)),math.rad(0 - 3600 * math.cos(sine / 720))),.3)
rwing2weld.C1=clerp(rwing2weld.C1,cf(0 + 1.5 * math.cos(sine / 360),-0.25 - 0.5 * math.cos(sine / 25),0)*angles(math.rad(0 + 1 * math.cos(sine / 70)),math.rad(0 - 2 * math.cos(sine / 37)),math.rad(120 - 3600 * math.cos(sine / 720))),.3)
rwing3weld.C1=clerp(rwing3weld.C1,cf(0 + 1.5 * math.cos(sine / 360),-0.25 - 0.5 * math.cos(sine / 25),0)*angles(math.rad(0 + 1 * math.cos(sine / 60)),math.rad(0 - 2 * math.cos(sine / 51)),math.rad(-120 - 3600 * math.cos(sine / 720))),.3)
elseif ModeOfGlitch == 4 then
handleweld.C0=clerp(handleweld.C0,cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.3)
handlexweld.C0=clerp(handleweld.C0,cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.3)
lwing1weld.C1=clerp(lwing1weld.C1,cf(2,0,0)*angles(math.rad(0),math.rad(0),math.rad(0))*angles(math.rad(0),math.rad(0),math.rad(12.5 + 5 * math.cos(sine / 12))),.3)
lwing2weld.C1=clerp(lwing2weld.C1,cf(3,1,0)*angles(math.rad(0),math.rad(0),math.rad(0))*angles(math.rad(0),math.rad(0),math.rad(25 + 7.5 * math.cos(sine / 12))),.3)
lwing3weld.C1=clerp(lwing3weld.C1,cf(3.75,2,0)*angles(math.rad(0),math.rad(0),math.rad(0))*angles(math.rad(0),math.rad(0),math.rad(37.5 + 10 * math.cos(sine / 12))),.3)
rwing1weld.C1=clerp(rwing1weld.C1,cf(-2,0,0)*angles(math.rad(0),math.rad(0),math.rad(0))*angles(math.rad(0),math.rad(0),math.rad(-12.5 - 5 * math.cos(sine / 12))),.3)
rwing2weld.C1=clerp(rwing2weld.C1,cf(-3,1,0)*angles(math.rad(0),math.rad(0),math.rad(0))*angles(math.rad(0),math.rad(0),math.rad(-25 - 7.5 * math.cos(sine / 12))),.3)
rwing3weld.C1=clerp(rwing3weld.C1,cf(-3.75,2,0)*angles(math.rad(0),math.rad(0),math.rad(0))*angles(math.rad(0),math.rad(0),math.rad(-37.5 - 10 * math.cos(sine / 12))),.3)
elseif ModeOfGlitch == 80 then
handleweld.C0=clerp(handleweld.C0,cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.3)
handlexweld.C0=clerp(handleweld.C0,cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.3)
lwing1weld.C1=clerp(lwing1weld.C1,cf(0 + 2.5 * math.cos(sine / 180),1.5 + 0.75 * math.cos(sine / 25),0)*angles(math.rad(0 + 1 * math.cos(sine / 50)),math.rad(0 - 2 * math.cos(sine / 36)),math.rad(90 + 3600 * math.cos(sine / 360))),.3)
lwing2weld.C1=clerp(lwing2weld.C1,cf(0 + 2.5 * math.cos(sine / 180),1.5 + 0.75 * math.cos(sine / 25),0)*angles(math.rad(0 + 1 * math.cos(sine / 70)),math.rad(0 - 2 * math.cos(sine / 37)),math.rad(147.5 + 3600 * math.cos(sine / 360))),.3)
lwing3weld.C1=clerp(lwing3weld.C1,cf(0 + 2.5 * math.cos(sine / 180),1.5 + 0.75 * math.cos(sine / 25),0)*angles(math.rad(0 + 1 * math.cos(sine / 60)),math.rad(0 - 2 * math.cos(sine / 51)),math.rad(32.5 + 3600 * math.cos(sine / 360))),.3)
rwing1weld.C1=clerp(rwing1weld.C1,cf(0 + 2.5 * math.cos(sine / 180),1.5 + 0.75 * math.cos(sine / 25),0)*angles(math.rad(0 + 1 * math.cos(sine / 50)),math.rad(0 - 2 * math.cos(sine / 36)),math.rad(-90 + 3600 * math.cos(sine / 360))),.3)
rwing2weld.C1=clerp(rwing2weld.C1,cf(0 + 2.5 * math.cos(sine / 180),1.5 + 0.75 * math.cos(sine / 25),0)*angles(math.rad(0 + 1 * math.cos(sine / 70)),math.rad(0 - 2 * math.cos(sine / 37)),math.rad(-147.5 + 3600 * math.cos(sine / 360))),.3)
rwing3weld.C1=clerp(rwing3weld.C1,cf(0 + 2.5 * math.cos(sine / 180),1.5 + 0.75 * math.cos(sine / 25),0)*angles(math.rad(0 + 1 * math.cos(sine / 60)),math.rad(0 - 2 * math.cos(sine / 51)),math.rad(-32.5 + 3600 * math.cos(sine / 360))),.3)
lwing4weld.C1=clerp(lwing4weld.C1,cf(0 - 7.5 * math.cos(sine / 180),1.5 + 0.75 * math.cos(sine / 25),-1)*angles(math.rad(0 + 1 * math.cos(sine / 50)),math.rad(0 - 2 * math.cos(sine / 36)),math.rad(90 - 3600 * math.cos(sine / 360))),.3)
lwing5weld.C1=clerp(lwing5weld.C1,cf(0 - 7.5 * math.cos(sine / 180),1.5 + 0.75 * math.cos(sine / 25),-1)*angles(math.rad(0 + 1 * math.cos(sine / 70)),math.rad(0 - 2 * math.cos(sine / 37)),math.rad(147.5 - 3600 * math.cos(sine / 360))),.3)
lwing6weld.C1=clerp(lwing6weld.C1,cf(0 - 7.5 * math.cos(sine / 180),1.5 + 0.75 * math.cos(sine / 25),-1)*angles(math.rad(0 + 1 * math.cos(sine / 60)),math.rad(0 - 2 * math.cos(sine / 51)),math.rad(32.5 - 3600 * math.cos(sine / 360))),.3)
rwing4weld.C1=clerp(rwing4weld.C1,cf(0 - 7.5 * math.cos(sine / 180),1.5 + 0.75 * math.cos(sine / 25),-1)*angles(math.rad(0 + 1 * math.cos(sine / 50)),math.rad(0 - 2 * math.cos(sine / 36)),math.rad(-90 - 3600 * math.cos(sine / 360))),.3)
rwing5weld.C1=clerp(rwing5weld.C1,cf(0 - 7.5 * math.cos(sine / 180),1.5 + 0.75 * math.cos(sine / 25),-1)*angles(math.rad(0 + 1 * math.cos(sine / 70)),math.rad(0 - 2 * math.cos(sine / 37)),math.rad(-147.5 - 3600 * math.cos(sine / 360))),.3)
rwing6weld.C1=clerp(rwing6weld.C1,cf(0 - 7.5 * math.cos(sine / 180),1.5 + 0.75 * math.cos(sine / 25),-1)*angles(math.rad(0 + 1 * math.cos(sine / 60)),math.rad(0 - 2 * math.cos(sine / 51)),math.rad(-32.5 - 3600 * math.cos(sine / 360))),.3)
end
 sine = sine + change
local torvel=(RootPart.Velocity*Vector3.new(1,0,1)).magnitude 
local velderp=RootPart.Velocity.y
hitfloor,posfloor=rayCast(RootPart.Position,(CFrame.new(RootPart.Position,RootPart.Position - Vector3.new(0,1,0))).lookVector,4,Character)
coroutine.resume(coroutine.create(function()
if ModeOfGlitch == 5 then
	if hitfloor ~= nil then
		slash(math.random(50,100)/10,5,true,"Round","Add","Out",root.CFrame*CFrame.new(0,-3,0)*CFrame.Angles(math.rad(math.random(-5,5)),math.rad(math.random(-360,360)),math.rad(math.random(-5,5))),vt(0.01,0.01,0.01),math.random(5,50)/250,MAINRUINCOLOR)
	end
end
if ModeOfGlitch == 2592865363 then
	if hitfloor ~= nil then
		sphere2(1.5,"Add",root.CFrame*CFrame.new(0,-3,0),vt(1,0.5,1),0.1,0.01,0.1,BrickColor.new("Lime green"),Color3.new(0,1,0))
	end
end
if ModeOfGlitch == 205 or ModeOfGlitch == 5555 or ModeOfGlitch == 4 or ModeOfGlitch == 105 then
if hitfloor ~= nil then
	effar.Enabled = true
	effar.Color = ColorSequence.new(MAINRUINCOLOR.Color)
slash(math.random(50,100)/10,5,true,"Round","Add","Out",root.CFrame*CFrame.new(0,-3,0)*CFrame.Angles(math.rad(math.random(-5,5)),math.rad(math.random(-360,360)),math.rad(math.random(-5,5))),vt(0.01,0.01,0.01),math.random(5,50)/250,BrickColor.new("White"))
if ModeOfGlitch == 205 or ModeOfGlitch == 5555 or ModeOfGlitch == 4 or ModeOfGlitch == 105 then
slash(math.random(75,150)/10,5,true,"Round","Add","Out",root.CFrame*CFrame.new(0,-3,0)*CFrame.Angles(math.rad(math.random(-5,5)),math.rad(math.random(-360,360)),math.rad(math.random(-5,5))),vt(0.01,0.01,0.01),math.random(5,150)/250,MAINRUINCOLOR)
end
if ModeOfGlitch == 105 then
slash(math.random(75,150)/10,5,true,"Round","Add","Out",root.CFrame*CFrame.new(0,-3,0)*CFrame.Angles(math.rad(math.random(-5,5)),math.rad(math.random(-360,360)),math.rad(math.random(-5,5))),vt(0.01,0.01,0.01),math.random(5,350)/250,BrickColor.new("Maroon"))
elseif ModeOfGlitch == 765688533321  then
slash(math.random(75,150)/10,5,true,"Round","Add","Out",root.CFrame*CFrame.new(0,-3,0)*CFrame.Angles(math.rad(math.random(-5,5)),math.rad(math.random(-360,360)),math.rad(math.random(-5,5))),vt(0.01,0.01,0.01),math.random(5,350)/250,BrickColor.new("Really red"))
elseif ModeOfGlitch == 1264532489  then
slash(math.random(75,150)/10,5,true,"Round","Add","Out",root.CFrame*CFrame.new(0,-3,0)*CFrame.Angles(math.rad(math.random(-5,5)),math.rad(math.random(-360,360)),math.rad(math.random(-5,5))),vt(0.01,0.01,0.01),math.random(5,350)/250,BrickColor.new("Deep orange"))
elseif ModeOfGlitch == 999999999556  then
slash(math.random(75,150)/10,5,true,"Round","Add","Out",root.CFrame*CFrame.new(0,-3,0)*CFrame.Angles(math.rad(math.random(-5,5)),math.rad(math.random(-360,360)),math.rad(math.random(-5,5))),vt(0.01,0.01,0.01),math.random(5,350)/250,BrickColor.new("Really blue"))
end
elseif hitfloor == nil then
	effar.Enabled = false
end
elseif ModeOfGlitch ~= 205 and ModeOfGlitch ~= 5555 then
    effar.Enabled = false
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
--Sheath()0
end
end
if RootPart.Velocity.y > 1 and hitfloor==nil then 
Anim="Jump"
if attack==false then
RH.C0=clerp(RH.C0,cf(1,-0.18 - 0.05 * math.cos(sine / 25),-0.65)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-5),math.rad(0),math.rad(-20)),.1)
LH.C0=clerp(LH.C0,cf(-1,-1 - 0.05 * math.cos(sine / 25),0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-5),math.rad(0),math.rad(20)),.1)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0 + 0.05 * math.cos(sine / 25))*angles(math.rad(-10 - 2 * math.cos(sine / 10)),math.rad(0),math.rad(0)),.1)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(-5 - 10 * math.cos(sine / 25)),math.rad(0),math.rad(0)),.1)
RW.C0=clerp(RW.C0,cf(1.45,0.5 + 0.1 * math.cos(sine / 25),0)*angles(math.rad(0),math.rad(0),math.rad(20 + 10 * math.cos(sine / 25))),.1)
LW.C0=clerp(LW.C0,cf(-1.45,0.5 + 0.1 * math.cos(sine / 25),0)*angles(math.rad(0),math.rad(0),math.rad(-20 - 10 * math.cos(sine / 25))),.1)
end
elseif RootPart.Velocity.y < -1 and hitfloor==nil then 
Anim="Fall"
if attack==false then
RH.C0=clerp(RH.C0,cf(1,-0.5 - 0.05 * math.cos(sine / 28),-0.7)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-2.5),math.rad(0),math.rad(0 + 1 * math.cos(sine / 34))),.1)
LH.C0=clerp(LH.C0,cf(-1,-1 - 0.05 * math.cos(sine / 28),0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-2.5),math.rad(0),math.rad(0 + 1 * math.cos(sine / 34))),.1)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0 + 0.05 * math.cos(sine / 25))*angles(math.rad(10 + 5 * math.cos(sine / 15)),math.rad(0),math.rad(0)),.1)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(30 + 10 * math.cos(sine / 25)),math.rad(0),math.rad(0)),.1)
RW.C0=clerp(RW.C0,cf(1.45,0.5 + 0.1 * math.cos(sine / 25),0)*angles(math.rad(-40),math.rad(0 - 10 * math.cos(sine / 25)),math.rad(90)),.1)
LW.C0=clerp(LW.C0,cf(-1.45,0.5 + 0.1 * math.cos(sine / 25),0)*angles(math.rad(-40),math.rad(0 + 10 * math.cos(sine / 25)),math.rad(-90)),.1)
end
elseif torvel<1 and hitfloor~=nil then
Anim="Idle"
if attack==false then
if ModeOfGlitch == 1 then
RH.C0=clerp(RH.C0,cf(1,-1 - 0.05 * math.cos(sine / 32),0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-6),math.rad(0 - 1 * math.cos(sine / 56)),math.rad(1 - 2 * math.cos(sine / 32))),.1)
LH.C0=clerp(LH.C0,cf(-1,-1 - 0.05 * math.cos(sine / 32),0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-0.5),math.rad(0 - 1 * math.cos(sine / 56)),math.rad(-1 + 2 * math.cos(sine / 32))),.1)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0.01 + 0.03 * math.cos(sine / 32),0 + 0.1 * math.cos(sine / 32))*angles(math.rad(1 - 2 * math.cos(sine / 32)),math.rad(0),math.rad(-22 + 2 * math.cos(sine / 56))),.1)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(23 - 2 * math.cos(sine / 37)),math.rad(0 + 5 * math.cos(sine / 43) - 5 * math.cos(sine / 0.25)),math.rad(22 - 2 * math.cos(sine / 56))),.1)
RW.C0=clerp(RW.C0,cf(1.5,0.5 + 0.025 * math.cos(sine / 45),0)*angles(math.rad(5 + 3 * math.cos(sine / 43)),math.rad(-16 - 5 * math.cos(sine / 52)),math.rad(13 + 9 * math.cos(sine / 45))),.1)
LW.C0=clerp(LW.C0,cf(-1,0.5 + 0.025 * math.cos(sine / 45),-0.5)*angles(math.rad(89 - 7 * math.cos(sine / 66)),math.rad(4 - 3 * math.cos(sine / 59)),math.rad(67 - 4 * math.cos(sine / 45))),.1)
elseif ModeOfGlitch == 2 then
RH.C0=clerp(RH.C0,cf(1,-1 - 0.05 * math.cos(sine / 32),0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-6),math.rad(0 - 1 * math.cos(sine / 56)),math.rad(1 - 2 * math.cos(sine / 32))),.1)
LH.C0=clerp(LH.C0,cf(-1,-1 - 0.05 * math.cos(sine / 32),0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-0.5),math.rad(0 - 1 * math.cos(sine / 56)),math.rad(-1 + 2 * math.cos(sine / 32))),.1)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,-0.01 + 0.02 * math.cos(sine / 32),0 + 0.05 * math.cos(sine / 32))*angles(math.rad(1 - 2 * math.cos(sine / 32)),math.rad(0),math.rad(0 + 3 * math.cos(sine / 42))),.1)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(15 - 2 * math.cos(sine / 37)),math.rad(0 + 2 * math.cos(sine / 58)),math.rad(0 + 1 * math.cos(sine / 53))),.1)
RW.C0 = clerp(RW.C0, CFrame.new(1.1, 0.4 + 0.05 * math.sin(sine / 30), 0.2) * angles(math.rad(-30), math.rad(-0), math.rad(-30)), 0.1)
LW.C0 = clerp(LW.C0, CFrame.new(-1.1, 0.4 + 0.05 * math.cos(sine / 30),0.2) * angles(math.rad(-30), math.rad(0), math.rad(30)), 0.1)
elseif ModeOfGlitch == 3 then
local snap = math.random(1,32)
if snap == 1 then
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(22 + math.random(-50,50)),math.rad(math.random(-50,50)),math.rad(math.random(-50,50))),1)
end
RH.C0=clerp(RH.C0,cf(1,-1 - 0.05 * math.cos(sine / 32),0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-3),math.rad(0 - 1 * math.cos(sine / 56)),math.rad(1 - 2 * math.cos(sine / 32))),.1)
LH.C0=clerp(LH.C0,cf(-1,-1 - 0.05 * math.cos(sine / 32),0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-3),math.rad(0 - 1 * math.cos(sine / 56)),math.rad(-1 + 2 * math.cos(sine / 32))),.1)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0.02 + 0.02 * math.cos(sine / 32),0 + 0.05 * math.cos(sine / 32))*angles(math.rad(2 - 2 * math.cos(sine / 32)),math.rad(0),math.rad(0 - 1 * math.cos(sine / 44))),.1)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(22 - 2 * math.cos(sine / 37)),math.rad(0 + 1 * math.cos(sine / 58)),math.rad(0 + 2 * math.cos(sine / 53))),.1)
RW.C0=clerp(RW.C0,cf(0.75,0.5,-0.25)*angles(math.rad(140),math.rad(0),math.rad(-20 + 2.5 * math.cos(sine / 28))),.1)
LW.C0=clerp(LW.C0,cf(-0.75,0.5,-0.25)*angles(math.rad(140),math.rad(0),math.rad(20 - 2.5 * math.cos(sine / 28))),.1)
elseif ModeOfGlitch == 5555 then
RH.C0=clerp(RH.C0,cf(1,-0.4,-0.5)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-3 + 2.75 * math.cos(sine / 64)),math.rad(0 - 1 * math.cos(sine / 56)),math.rad(-10 - 7 * math.cos(sine / 56))),.1)
LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-3 + 2.75 * math.cos(sine / 64)),math.rad(0 - 1 * math.cos(sine / 56)),math.rad(10 + 3 * math.cos(sine / 52))),.1)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0 + 0.02 * math.cos(sine / 32),2.25 + 0.75 * math.cos(sine / 32))*angles(math.rad(0 - 2 * math.cos(sine / 32)),math.rad(0),math.rad(0)),.1)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(13 - 2 * math.cos(sine / 37)),math.rad(0 + 1 * math.cos(sine / 58)),math.rad(0 + 2 * math.cos(sine / 53))),.1)
RW.C0=clerp(RW.C0,cf(1,0.35 + 0.125 * math.cos(sine / 25),-0.45)*angles(math.rad(62 + 6 * math.cos(sine / 72)),math.rad(3 - 2 * math.cos(sine / 58)),math.rad(-82 + 2 * math.cos(sine / 45))),.1)
LW.C0=clerp(LW.C0,cf(-1,0.5 + 0.125 * math.cos(sine / 25),-0.5)*angles(math.rad(89 - 7 * math.cos(sine / 66)),math.rad(4 - 3 * math.cos(sine / 59)),math.rad(67 - 4 * math.cos(sine / 45))),.1)
elseif ModeOfGlitch == 7 then
RH.C0=clerp(RH.C0,cf(1,-0.4,-0.5)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-3 + 2.75 * math.cos(sine / 64)),math.rad(0 - 1 * math.cos(sine / 56)),math.rad(-10 - 7 * math.cos(sine / 56))),.1)
LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-3 + 2.75 * math.cos(sine / 64)),math.rad(0 - 1 * math.cos(sine / 56)),math.rad(10 + 3 * math.cos(sine / 52))),.1)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0 + 0.07 * math.cos(sine / 32),2.25 + 0.75 * math.cos(sine / 32))*angles(math.rad(0 - 2 * math.cos(sine / 32)),math.rad(0),math.rad(0)),.1)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(13 - 2 * math.cos(sine / 37)),math.rad(0 + 1 * math.cos(sine / 58)),math.rad(0 + 2 * math.cos(sine / 53))),.1)
RW.C0 = clerp(RW.C0, CFrame.new(1.1, 0.4 + 0.05 * math.sin(sine / 30), 0.2) * angles(math.rad(-30), math.rad(-0), math.rad(-30)), 0.1)
LW.C0 = clerp(LW.C0, CFrame.new(-1.1, 0.4 + 0.05 * math.cos(sine / 30),0.2) * angles(math.rad(-30), math.rad(0), math.rad(30)), 0.1)

elseif ModeOfGlitch == "INSANITY" then --Insanity Idle
RH.C0 = clerp(RH.C0,cf(1,-1 - 0.05 * math.cos(sine / 50),0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-2.5),math.rad(0),math.rad(0 + 1 * math.cos(sine / 34))),.1)
LH.C0 = clerp(LH.C0,cf(-1,-1 - 0.05 * math.cos(sine / 50),0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-2.5),math.rad(0),math.rad(0 + 1 * math.cos(sine / 34))),.1)
RootJoint.C0 = clerp(RootJoint.C0,RootCF*cf(0,0,0 + 0.05 * math.cos(sine / 50))*angles(math.rad(0 - 1 * math.cos(sine / 34)),math.rad(0),math.rad(0)),.1)
Torso.Neck.C0 = clerp(Torso.Neck.C0,necko*angles(math.rad(40 - 2.5 * math.cos(sine / 50)),math.rad(0),math.rad(0)),.1)
RW.C0 = clerp(RW.C0, CFrame.new(1.25, 0.5, 0.5) * angles(math.rad(90), math.rad(0), math.rad(100 + 1 * math.cos(sine / 40))), 0.3)
LW.C0 = clerp(LW.C0,cf(-1.5,0.5 + 0.1 * math.cos(sine / 50),0)*angles(math.rad(180),math.rad(0),math.rad(20)),.1)

elseif ModeOfGlitch == 4 then
local snap = math.random(1,32)
if snap == 1 then
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(13 + math.random(-10,10)),math.rad(math.random(-10,10)),math.rad(math.random(-10,10))),1)
end
local snap = math.random(1,5)
if snap == 1 then
RW.C0=clerp(RW.C0,cf(1,0.35 + 0.025 * math.cos(sine / 45),-0.5)*angles(math.rad(62 + 6 * math.cos(sine / 72)),math.rad(2 - 4 * math.cos(sine / 58)),math.rad(-65 + 1 * math.cos(sine / 45))),0.5)
LW.C0=clerp(LW.C0,cf(-1,0.5 + 0.025 * math.cos(sine / 45),-0.5)*angles(math.rad(89 - 7 * math.cos(sine / 66)),math.rad(6 - 5 * math.cos(sine / 59)),math.rad(73 - 3 * math.cos(sine / 45))),0.5)
end
sphere2(8,"Add",rleg.CFrame*CFrame.new(0,-1,0)*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(1,1,1),-0.01,0.05,-0.01,BrickColor.new("Bright bluish green"),BrickColor.new("Bright bluish green").Color)
sphere2(8,"Add",lleg.CFrame*CFrame.new(0,-1,0)*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(1,1,1),-0.01,0.05,-0.01,BrickColor.new("Forest green"),BrickColor.new("Forest green").Color)
RH.C0=clerp(RH.C0,cf(1,-0.4,-0.5)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-3),math.rad(0 - 1 * math.cos(sine / 56)),math.rad(-10 - 2 * math.cos(sine / 39))),.1)
LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-6),math.rad(0 - 1 * math.cos(sine / 56)),math.rad(10 + 6 * math.cos(sine / 31))),.1)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0 - 0.125 * math.cos(sine / 50),0 + 0.125 * math.cos(sine / 37),2.25 - 0.75 * math.cos(sine / 24))*angles(math.rad(0 - 2 * math.cos(sine / 32)),math.rad(0),math.rad(0)),.1)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(13 - 2 * math.cos(sine / 37)),math.rad(0 + 1 * math.cos(sine / 58)),math.rad(0 + 2 * math.cos(sine / 53))),.1)
RW.C0=clerp(RW.C0,cf(1,0.35 + 0.025 * math.cos(sine / 45),-0.5)*angles(math.rad(62 + 6 * math.cos(sine / 72)),math.rad(2 - 4 * math.cos(sine / 58)),math.rad(-65 + 1 * math.cos(sine / 45))),.1)
LW.C0=clerp(LW.C0,cf(-1,0.5 + 0.025 * math.cos(sine / 45),-0.5)*angles(math.rad(89 - 7 * math.cos(sine / 66)),math.rad(6 - 5 * math.cos(sine / 59)),math.rad(73 - 3 * math.cos(sine / 45))),.1)
elseif ModeOfGlitch == 5 then
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0* Player_Size, 0* Player_Size, 2 + 0.75* Player_Size * math.cos(sine / 30)) * angles(math.rad(-30), math.rad(0), math.rad(0)), 0.08)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*cf(0, 0, 0 + ((1* Player_Size) - 1)) * angles(math.rad(30 - 10 * math.sin(sine / 30)), math.rad(0), math.rad(0)), 0.08)
RH.C0=clerp(RH.C0,cf(1,-0.3 - 0.1 * math.cos(sine / 32),-0.5)*angles(math.rad(0),math.rad(85),math.rad(10)),.1)
LH.C0=clerp(LH.C0,cf(-1,-0.8 - 0.1 * math.cos(sine / 32),0)*angles(math.rad(30),math.rad(-85),math.rad(-10)),.1)
RW.C0=clerp(RW.C0, cf(1.3 * Player_Size, 1 + 0.02 * math.sin(sine / 30)* Player_Size, 0* Player_Size) * angles(math.rad(20 + 10 *	math.sin(sine / 30)), math.rad(-.6), math.rad(230)), 0.08)
LW.C0=clerp(LW.C0, cf(-1.3 * Player_Size, 1 + 0.02 * math.sin(sine / 30)* Player_Size, 0* Player_Size) * angles(math.rad(20 + 10 *	math.sin(sine / 30)), math.rad(-.6), math.rad(130)), 0.08)
elseif ModeOfGlitch == 105 then
local snap = math.random(1,32)
if snap == 1 then
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(32 + math.random(-10,10)),math.rad(math.random(-10,10)),math.rad(math.random(-10,10))),1)
end
RH.C0=clerp(RH.C0,cf(1,-0.4,-0.5)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-3),math.rad(0 - 1 * math.cos(sine / 56)),math.rad(-10 - 7 * math.cos(sine / 56))),.1)
LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-0.5),math.rad(0 - 1 * math.cos(sine / 56)),math.rad(10 + 3 * math.cos(sine / 52))),.1)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0 + 0.02 * math.cos(sine / 32),2.25 + 0.75 * math.cos(sine / 32))*angles(math.rad(0 - 2 * math.cos(sine / 32)),math.rad(0),math.rad(0)),.1)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(13 - 2 * math.cos(sine / 37)),math.rad(0 + 1 * math.cos(sine / 58)),math.rad(0 + 2 * math.cos(sine / 53))),.1)
RW.C0=clerp(RW.C0,cf(1,0.5 + 0.05 * math.cos(sine / 25),-0.45)*angles(math.rad(62 + 6 * math.cos(sine / 72)),math.rad(3 - 2 * math.cos(sine / 58)),math.rad(-82 + 2 * math.cos(sine / 45))),.1)
LW.C0=clerp(LW.C0,cf(-1.5,0.5 + 0.025 * math.cos(sine / 45),0)*angles(math.rad(32 - 7 * math.cos(sine / 66)),math.rad(6 - 5 * math.cos(sine / 59)),math.rad(-9 - 3 * math.cos(sine / 45))),.1)
elseif ModeOfGlitch == 205 then
RootJoint.C0 = clerp(RootJoint.C0, RootCF * CFrame.new(0, 0, 2.25 + 0.75 * math.cos(sine / 32)) * angles(math.rad(0), math.rad(0), math.rad(0)), 0.15)
Torso.Neck.C0 = clerp(Torso.Neck.C0, necko * angles(math.rad(-2.5 * math.sin(sine / 32)), math.rad(0), math.rad(0)), 0.3)
RH.C0=clerp(RH.C0,cf(1,-0.4,-0.5)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-3),math.rad(0 - 1 * math.cos(sine / 56)),math.rad(-10 - 7 * math.cos(sine / 56))),.1)
LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-3),math.rad(0 - 1 * math.cos(sine / 56)),math.rad(10 + 3 * math.cos(sine / 52))),.1)
RW.C0 = clerp(RW.C0, CFrame.new(1.1, 0.4 + 0.05 * math.sin(sine / 30),0.3 + 0.025 * math.cos(sine / 32)) * angles(math.rad(-30), math.rad(-0), math.rad(-30)), 0.1)
LW.C0 = clerp(LW.C0, CFrame.new(-1.1, 0.4 + 0.05 * math.cos(sine / 30),0.3 + 0.025 * math.cos(sine / 32)) * angles(math.rad(-30), math.rad(0), math.rad(30)), 0.1)
elseif ModeOfGlitch == 6 then
RootJoint.C0 = clerp(RootJoint.C0, RootCF * CF(0, 0, 1.2 + 0.3 * Cos(sine / 20)) * angles(Rad(5), Rad(0), Rad(10)), 0.15)
Torso.Neck.C0 = clerp(tors.Neck.C0, necko * angles(Rad(-4.5 * Sin(sine / 30)), Rad(0), Rad(-10)), 0.3)
RH.C0=clerp(RH.C0,cf(1,-0.5 - 0.1 * math.cos(sine / 30),-0.5)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-3),math.rad(-5.5 - 2 * math.cos(sine / 56)),math.rad(-12 - 2 * math.cos(sine / 32))),.1)
LH.C0=clerp(LH.C0,cf(-1,-0.8 - 0.1 * math.cos(sine / 30),0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-6),math.rad(22 - 2 * math.cos(sine / 56)),math.rad(-1 + 2 * math.cos(sine / 32))),.1)
RW.C0 = clerp(RW.C0, CF(1.5, 0.5 + 0.05 * Sin(sine / 30), 0.025 * Cos(sine / 20)) * angles(Rad(-3 * Sin(sine / 20)), Rad(-10 * Sin(sine / 20)), Rad(13 - 2.5 * Sin(sine / 20))), 0.1)
LW.C0=clerp(LW.C0,cf(-1.35,1 + 0.025 * math.cos(sine / 45),-0.2)*angles(math.rad(148 - 2 * math.cos(sine / 51)),math.rad(0 - 4 * math.cos(sine / 64)),math.rad(22 - 2 * math.cos(sine / 45))),.1)
elseif ModeOfGlitch == 9 then
local snap = math.random(1,5)
if snap == 1 then
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(25 + math.random(-1,1)),math.rad(math.random(-1,1)),math.rad(math.random(-1,1))),0.6)
end
RH.C0=clerp(RH.C0,cf(1,-1 - 0.05 * math.cos(sine / 32),0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-3),math.rad(0 - 1 * math.cos(sine / 56)),math.rad(25 - 2 * math.cos(sine / 32))),.1)
LH.C0=clerp(LH.C0,cf(-1,-1 - 0.05 * math.cos(sine / 32),0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-3),math.rad(0 - 1 * math.cos(sine / 56)),math.rad(-25 + 2 * math.cos(sine / 32))),.1)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,-0.25 + 0.02 * math.cos(sine / 32),-0.1 + 0.05 * math.cos(sine / 32))*angles(math.rad(25 - 2 * math.cos(sine / 32)),math.rad(0),math.rad(0)),.1)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(40 - 2 * math.cos(sine / 37)),math.rad(0 + 1 * math.cos(sine / 58)),math.rad(0 + 2 * math.cos(sine / 53))),.1)
RW.C0=clerp(RW.C0,cf(1.5,0.5 + 0.025 * math.cos(sine / 45),0)*angles(math.rad(50 + 5 * math.cos(sine / 74)),math.rad(1 - 3 * math.cos(sine / 53)),math.rad(90 + 3 * math.cos(sine / 45))),.1)
LW.C0=clerp(LW.C0,cf(-1.5,0.5 + 0.025 * math.cos(sine / 45),0)*angles(math.rad(50 - 3 * math.cos(sine / 73)),math.rad(2 - 1 * math.cos(sine / 55)),math.rad(-90 - 3 * math.cos(sine / 45))),.1)
elseif ModeOfGlitch == 10 then
RH.C0=clerp(RH.C0,cf(1,-1 - 0.05 * math.cos(sine / 28),0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-7.5),math.rad(0),math.rad(0 - 2 * math.cos(sine / 34))),.1)
LH.C0=clerp(LH.C0,cf(-1,-1 - 0.05 * math.cos(sine / 28),0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-2.5),math.rad(0),math.rad(0 + 2 * math.cos(sine / 34))),.1)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0 + 0.02 * math.cos(sine / 34),0 + 0.05 * math.cos(sine / 28))*angles(math.rad(0 - 2 * math.cos(sine / 34)),math.rad(0),math.rad(0)),.1)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(15 - 2.5 * math.cos(sine / 28)),math.rad(0 - 4 * math.cos(sine / 42)),math.rad(0 - 3 * math.cos(sine / 76))),.1)
RW.C0=clerp(RW.C0,cf(1,0.5 + 0.1 * math.cos(sine / 28),-0.2)*angles(math.rad(20),math.rad(0),math.rad(-30)),.1)
LW.C0=clerp(LW.C0,cf(-1,0.5 + 0.1 * math.cos(sine / 28),-0.2)*angles(math.rad(20),math.rad(0),math.rad(30)),.1)
end
end
elseif torvel>2 and torvel<22 and hitfloor~=nil then
Anim="Walk"
if attack==false then
if ModeOfGlitch ~= 205 and ModeOfGlitch ~= 2 and ModeOfGlitch ~= 7 and ModeOfGlitch ~= 5 and ModeOfGlitch ~= 10 then
RH.C0=clerp(RH.C0,cf(1,-1 + 0.05 * math.cos(sine / 4),0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(0),math.rad(0 + 5 * math.cos(sine / 8)),math.rad(0 + 35 * math.cos(sine / 8))),.1)
LH.C0=clerp(LH.C0,cf(-1,-1 + 0.05 * math.cos(sine / 4),0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(0),math.rad(0 + 5 * math.cos(sine / 8)),math.rad(0 + 35 * math.cos(sine / 8))),.1)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,-0.05,-0.05 - 0.05 * math.cos(sine / 4))*angles(math.rad(5 + 3 * math.cos(sine / 4)),math.rad(0 + root.RotVelocity.Y/1.5),math.rad(0 - root.RotVelocity.Y - 5 * math.cos(sine / 8))),.1)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(10 - 3 * math.cos(sine / 4)),math.rad(0 + root.RotVelocity.Y/1.5),math.rad(0 - hed.RotVelocity.Y*1.5 + 5 * math.cos(sine / 8))),.1)
RW.C0=clerp(RW.C0,cf(1.5,0.5,0 + 0.25 * math.cos(sine / 8))*angles(math.rad(0 - 50 * math.cos(sine / 8)),math.rad(0),math.rad(5 - 10 * math.cos(sine / 4))),.1)
LW.C0=clerp(LW.C0,cf(-1.5,0.5,0 - 0.25 * math.cos(sine / 8))*angles(math.rad(0 + 50 * math.cos(sine / 8)),math.rad(0),math.rad(-5 + 10 * math.cos(sine / 4))),.1)
elseif ModeOfGlitch == 10 then
RH.C0=clerp(RH.C0,cf(1,-1 + 0.05 * math.cos(sine / 4),0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(0),math.rad(0 + 10 * math.cos(sine / 8)),math.rad(0 + 65 * math.cos(sine / 8))),.1)
LH.C0=clerp(LH.C0,cf(-1,-1 + 0.05 * math.cos(sine / 4),0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(0),math.rad(0 + 10 * math.cos(sine / 8)),math.rad(0 + 65 * math.cos(sine / 8))),.1)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,-0.1,-0.05 + 0.05 * math.cos(sine / 4))*angles(math.rad(15 - 3 * math.cos(sine / 4)),math.rad(0),math.rad(0 - root.RotVelocity.Y - 10 * math.cos(sine / 8))),.1)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(-15 + 3 * math.cos(sine / 4)),math.rad(0),math.rad(0 - hed.RotVelocity.Y*2.5 + 10 * math.cos(sine / 8))),.1)
RW.C0=clerp(RW.C0,cf(1.5,0.5,0 + 0.25 * math.cos(sine / 8))*angles(math.rad(0 + 80 * math.cos(sine / 8)),math.rad(0),math.rad(5 + 10 * math.cos(sine / 4))),.1)
LW.C0=clerp(LW.C0,cf(-1.5,0.5,0 + 0.25 * math.cos(sine / 8))*angles(math.rad(0 - 80 * math.cos(sine / 8)),math.rad(0),math.rad(5 + 10 * math.cos(sine / 4))),.1)

elseif ModeOfGlitch == 7 then
RH.C0=clerp(RH.C0,cf(1,-0.4,-0.5)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-3 + 2.75 * math.cos(sine / 64)),math.rad(0 - 1 * math.cos(sine / 56)),math.rad(-10 - 7 * math.cos(sine / 56))),.1)
LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-3 + 2.75 * math.cos(sine / 64)),math.rad(0 - 1 * math.cos(sine / 56)),math.rad(10 + 3 * math.cos(sine / 52))),.1)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0 + 0.07 * math.cos(sine / 32),2.25 + 0.75 * math.cos(sine / 32))*angles(math.rad(30 - 2 * math.cos(sine / 32)),math.rad(0),math.rad(0)),.1)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(-29 - 2 * math.cos(sine / 37)),math.rad(0 + 1 * math.cos(sine / 58)),math.rad(0 + 2 * math.cos(sine / 53))),.1)
RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.4 + 0.05 * math.sin(sine / 30), 0.2) * angles(math.rad(-60), math.rad(0), math.rad(0)), 0.1)
LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.4 + 0.05 * math.cos(sine / 30),0.2) * angles(math.rad(-60), math.rad(0), math.rad(0)), 0.1)
elseif ModeOfGlitch == 2 then
RootJoint.C0 = clerp(RootJoint.C0, RootCF * cf(0, 0, -0.175 + 0.025 * math.cos(sine / 3.5) + -math.sin(sine / 3.5) / 7) * angles(math.rad(4-2.5 * math.cos(sine / 3.5)), math.rad(0) - root.RotVelocity.Y / 75, math.rad(5 * math.cos(sine / 7))), 0.15)
Torso.Neck.C0 = clerp(Torso.Neck.C0, necko * angles(math.rad(20 + -2.5 * math.sin(sine / 20)), math.rad(0), math.rad(0) - hed.RotVelocity.Y / 15), 0.3)
RH.C0 = clerp(RH.C0, cf(1, -0.925 - 0.5 * math.cos(sine / 7) / 2, 0.5 * math.cos(sine / 7) / 2) * angles(math.rad(-15 - 5 * math.cos(sine / 7)) - rl.RotVelocity.Y / 75 + -math.sin(sine / 7) / 2.5, math.rad(90 - 0.1 * math.cos(sine / 7)), math.rad(0)) * angles(math.rad(0 + 0.1 * math.cos(sine / 7)), math.rad(0), math.rad(0)), 0.3)
LH.C0 = clerp(LH.C0, cf(-1, -0.925 + 0.5 * math.cos(sine / 7) / 2, -0.5 * math.cos(sine / 7) / 2) * angles(math.rad(-15 + 5 * math.cos(sine / 7)) + ll.RotVelocity.Y / 75 + math.sin(sine / 7) / 2.5, math.rad(-90 - 0.1 * math.cos(sine / 7)), math.rad(0)) * angles(math.rad(0 - 0.1 * math.cos(sine / 7)), math.rad(0), math.rad(0)), 0.3)
RW.C0 = clerp(RW.C0, cf(1.1, 0.4 + 0.05 * math.sin(sine / 30), 0.025 * math.cos(sine / 20)) * angles(math.rad(-30), math.rad(-0), math.rad(-30)), 0.1)
LW.C0 = clerp(LW.C0, cf(-1.1, 0.4 + 0.05 * math.sin(sine / 30), 0.025 * math.cos(sine / 20)) * angles(math.rad(-30), math.rad(0), math.rad(30)), 0.1)
elseif ModeOfGlitch == 5 then
RH.C0=clerp(RH.C0,cf(1,-0.5,-0.6)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(1.5),math.rad(0),math.rad(-20 - 5 * math.cos(sine / 34))),.2)
LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(1),math.rad(0),math.rad(20 + 2 * math.cos(sine / 38))),.2)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0 - 0.15 * math.cos(sine / 47),-0.5,2.25 + 0.75 * math.cos(sine / 30))*angles(math.rad(60),math.rad(0 - root.RotVelocity.Y),math.rad(0 - root.RotVelocity.Y *4.5 + 3 * math.cos(sine / 47))),.2)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(-17 - 5 * math.cos(sine / 52)),math.rad(0 - 3 * math.cos(sine / 37)),math.rad(0 + 2 * math.cos(sine / 78))),.2)
RW.C0=clerp(RW.C0,cf(1.5,0.5 + 0.05 * math.cos(sine / 28),0)*angles(math.rad(-8 - 4 * math.cos(sine / 59)),math.rad(-20 + 7 * math.cos(sine / 62)),math.rad(20 + 5 * math.cos(sine / 50))),.2)
LW.C0=clerp(LW.C0,cf(-1.5,0.5 + 0.1 * math.cos(sine / 28),0)*angles(math.rad(-8 - 3 * math.cos(sine / 55)),math.rad(20 + 8 * math.cos(sine / 67)),math.rad(-20 - 4 * math.cos(sine / 29))),.2)
elseif ModeOfGlitch == 205 then
RootJoint.C0 = clerp(RootJoint.C0, RootCF * CFrame.new(0, 0, 2.25 + 0.75 * math.cos(sine / 32)) * angles(math.rad(45), math.rad(0), math.rad(0)), 0.15)
Torso.Neck.C0 = clerp(Torso.Neck.C0, necko * angles(math.rad(-20 + -2.5 * math.sin(sine / 32)), math.rad(0), math.rad(0)), 0.3)
RH.C0=clerp(RH.C0,cf(1,-0.4,-0.5)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-3),math.rad(0 - 1 * math.cos(sine / 56)),math.rad(-10 - 7 * math.cos(sine / 56))),.1)
LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-3),math.rad(0 - 1 * math.cos(sine / 56)),math.rad(10 + 3 * math.cos(sine / 52))),.1)
RW.C0 = clerp(RW.C0, CFrame.new(1.1, 0.4 + 0.05 * math.sin(sine / 30),0.3 + 0.025 * math.cos(sine / 32)) * angles(math.rad(-30), math.rad(-0), math.rad(-30)), 0.1)
LW.C0 = clerp(LW.C0, CFrame.new(-1.1, 0.4 + 0.05 * math.cos(sine / 30),0.3 + 0.025 * math.cos(sine / 32)) * angles(math.rad(-30), math.rad(0), math.rad(30)), 0.1)
end
end
elseif torvel>=22 and hitfloor~=nil then
Anim="Run"
if attack==false then
if ModeOfGlitch ~= 5555 and ModeOfGlitch ~= 6 and ModeOfGlitch ~= 205 and ModeOfGlitch ~= 3 and ModeOfGlitch ~= 4 and ModeOfGlitch ~= 105 then
RH.C0=clerp(RH.C0,cf(1,-1 - 0.15 * math.cos(sine / 3),0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(0),math.rad(0),math.rad(0 + 95 * math.cos(sine / 6))),.1)
LH.C0=clerp(LH.C0,cf(-1,-1 - 0.15 * math.cos(sine / 3),0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(0),math.rad(0),math.rad(0 + 95 * math.cos(sine / 6))),.1)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,-0.3,-0.05 + 0.15 * math.cos(sine / 3))*angles(math.rad(25 - 4 * math.cos(sine / 3)),math.rad(0 + root.RotVelocity.Y*1.5),math.rad(0 - root.RotVelocity.Y - 1 * math.cos(sine / 6))),.1)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(-6 + 2 * math.cos(sine / 3)),math.rad(0 + root.RotVelocity.Y*1.5),math.rad(0 - hed.RotVelocity.Y*1.5 + 1 * math.cos(sine / 6))),.1)
RW.C0=clerp(RW.C0,cf(1.5,0.5,0.3)*angles(math.rad(-50 + 10 * math.cos(sine / 3)),math.rad(-10),math.rad(7 + 5 * math.cos(sine / 6))),.1)
LW.C0=clerp(LW.C0,cf(-1.5,0.5,0.3)*angles(math.rad(-50 + 10 * math.cos(sine / 3)),math.rad(10),math.rad(-7 - 5 * math.cos(sine / 6))),.1)
elseif ModeOfGlitch == 3 then
RH.C0=clerp(RH.C0,cf(1,-1 - 0.15 * math.cos(sine / 3),0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(0),math.rad(0),math.rad(0 + 95 * math.cos(sine / 6))),.1)
LH.C0=clerp(LH.C0,cf(-1,-1 - 0.15 * math.cos(sine / 3),0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(0),math.rad(0),math.rad(0 + 95 * math.cos(sine / 6))),.1)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,-0.3,-0.05 + 0.15 * math.cos(sine / 3))*angles(math.rad(25 - 4 * math.cos(sine / 3)),math.rad(0 + root.RotVelocity.Y*1.5),math.rad(0 - root.RotVelocity.Y - 1 * math.cos(sine / 6))),.1)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(-6 + 2 * math.cos(sine / 3)),math.rad(0 + root.RotVelocity.Y*1.5),math.rad(0 - hed.RotVelocity.Y*1.5 + 1 * math.cos(sine / 6))),.1)
RW.C0=clerp(RW.C0,cf(1.5,0.5,0)*angles(math.rad(20 - 120 * math.cos(sine / WALKSPEEDVALUE)),math.rad(-10),math.rad(17 + 5 * math.cos(sine / 6))),.1)
LW.C0=clerp(LW.C0,cf(-1.5,0.5,0)*angles(math.rad(20 + 120 * math.cos(sine / WALKSPEEDVALUE)),math.rad(10),math.rad(-17 - 5 * math.cos(sine / 6))),.1)
elseif ModeOfGlitch == 205 then
RootJoint.C0 = clerp(RootJoint.C0, RootCF * CFrame.new(0, 0, 2.25 + 0.75 * math.cos(sine / 32)) * angles(math.rad(45), math.rad(0), math.rad(0)), 0.15)
Torso.Neck.C0 = clerp(Torso.Neck.C0, necko * angles(math.rad(-20 + -2.5 * math.sin(sine / 32)), math.rad(0), math.rad(0)), 0.3)
RH.C0=clerp(RH.C0,cf(1,-0.4,-0.5)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-3),math.rad(0 - 1 * math.cos(sine / 56)),math.rad(-10 - 7 * math.cos(sine / 56))),.1)
LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-3),math.rad(0 - 1 * math.cos(sine / 56)),math.rad(10 + 3 * math.cos(sine / 52))),.1)
RW.C0 = clerp(RW.C0, CFrame.new(1.1, 0.4 + 0.05 * math.sin(sine / 30),0.3 + 0.025 * math.cos(sine / 32)) * angles(math.rad(-30), math.rad(-0), math.rad(-30)), 0.1)
LW.C0 = clerp(LW.C0, CFrame.new(-1.1, 0.4 + 0.05 * math.cos(sine / 30),0.3 + 0.025 * math.cos(sine / 32)) * angles(math.rad(-30), math.rad(0), math.rad(30)), 0.1)
elseif ModeOfGlitch == 6 then
RH.C0=clerp(RH.C0,cf(1,-0.5,-0.6)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(1.5),math.rad(0),math.rad(-20 - 5 * math.cos(sine / 34))),.2)
LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(1),math.rad(0),math.rad(20 + 2 * math.cos(sine / 38))),.2)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0 - 0.15 * math.cos(sine / 30),-0.5,2.25 + 0.75 * math.cos(sine / 32))*angles(math.rad(70),math.rad(0 - root.RotVelocity.Y),math.rad(0 - root.RotVelocity.Y *4.5 + 3 * math.cos(sine / 47))),.2)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(-17 - 5 * math.cos(sine / 52)),math.rad(0 - 3 * math.cos(sine / 37)),math.rad(0 + 2 * math.cos(sine / 78))),.2)
RW.C0=clerp(RW.C0,cf(1.5,0.5 + 0.05 * math.cos(sine / 28),0)*angles(math.rad(-8 - 4 * math.cos(sine / 59)),math.rad(-20 + 7 * math.cos(sine / 62)),math.rad(20 + 5 * math.cos(sine / 50))),.2)
LW.C0=clerp(LW.C0,cf(-1.5,0.5 + 0.1 * math.cos(sine / 28),0)*angles(math.rad(-8 - 3 * math.cos(sine / 55)),math.rad(20 + 8 * math.cos(sine / 67)),math.rad(-20 - 4 * math.cos(sine / 29))),.2)

elseif ModeOfGlitch == 5555 or ModeOfGlitch == 105 or ModeOfGlitch == 4 then
RH.C0=clerp(RH.C0,cf(1,-0.5,-0.6)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(1.5),math.rad(0),math.rad(-20 - 5 * math.cos(sine / 34))),.2)
LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(1),math.rad(0),math.rad(20 + 2 * math.cos(sine / 38))),.2)
RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0 - 0.15 * math.cos(sine / 47),-0.5,2.25 + 0.75 * math.cos(sine / 32))*angles(math.rad(70),math.rad(0 - root.RotVelocity.Y),math.rad(0 - root.RotVelocity.Y *4.5 + 3 * math.cos(sine / 47))),.2)
Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(-17 - 5 * math.cos(sine / 52)),math.rad(0 - 3 * math.cos(sine / 37)),math.rad(0 + 2 * math.cos(sine / 78))),.2)
RW.C0=clerp(RW.C0,cf(1.5,0.5 + 0.05 * math.cos(sine / 28),0)*angles(math.rad(-8 - 4 * math.cos(sine / 59)),math.rad(-20 + 7 * math.cos(sine / 62)),math.rad(20 + 5 * math.cos(sine / 50))),.2)
LW.C0=clerp(LW.C0,cf(-1.5,0.5 + 0.1 * math.cos(sine / 28),0)*angles(math.rad(-8 - 3 * math.cos(sine / 55)),math.rad(20 + 8 * math.cos(sine / 67)),math.rad(-20 - 4 * math.cos(sine / 29))),.2)
end
end
end
end
end