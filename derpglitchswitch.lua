_G.scripthere = function()
    game.Players.LocalPlayer.Character = game.Workspace.Dummylolxdnoo -- ideky i need to say this but do not remove this line put your script under this but before the end
    game:GetService("Players").LocalPlayer.Character["MeshPartAccessory"].Name = "gamer2"
game:GetService("Players").LocalPlayer.Character["MeshPartAccessory"].Name = "gamer1"
game:GetService("Players").LocalPlayer.Character["ShadowBladeMasterAccessory"].Name = "gamer3"
game:GetService("Players").LocalPlayer.Character["MeshPartAccessory"].Name = "gamer4"
game:GetService("Players").LocalPlayer.Character["MeshPartAccessory"].Name = "gamer5"
game:GetService("Players").LocalPlayer.Character["BladeMasterAccessory"].Name = "gamer6"


warn([[DERPZ GLITCH-SWITCH V1 Loaded.
The glitcher series is back. And now freshly made!
...And a different name.

Base by Lunnekoo.
FD to FE Converter by Nebula_Zorua OR Drahazar (Thank you so much..)
Wing Animations by X5UL.
Some effects done by Salvo_Starly.
Left and right gauntlet made by...? I don't know this one.
View Bobbing, Idea, Wings, Core, Everything else... Done by Derpz.

]])
--require(script:WaitForChild'EzConvert')();
wait(1/60)
------------- ORIGINAL WIELDER: DerpzDeNugget (Also known as Jake Davies.)
print([[Icons:
! = New
? = Spoilers
* = Exclusivity
C = Changes

]])
warn([[V 0.7 (IN DEVELOPMENT) Update Log:
! - Main modes added.
! - Made Visualiser-friendly (Read above about FD to FE conv for more info)
! - Determined added to Flying
! - Completed click attacks.
! - DJ Derpz added (M on Derpz...?)& Enraged Derpz (N on Derpz...?)
! - Added EXTREMELY CORRUPT DERPZ (M on Corrupt_Derpz
! - Changed name from DERPZGLITCHER REWORK to DERPZ GLITCH-SWITCH
! - Revamped Revengeful entirely.
! - Wing animations!
! - 
]])
print([[
The original Wielder.. The start of it all. Their name... Was Derpz.
They were an average person.. Mostly cheery and fun to hang out with.
A few years pass, And depression hits him like a truck. He starts feeling like he's not enough.. Like he's always not enough.
..So he started educating himself about Robloxian modification. He kept doing it, Until he found the correct thing for him..
It was a heart replacement which can modify the body in several ways. He called it the CORE.
So... He attempted to do it on himself. And.. He succeeded. The only thing he needed now, Was to modify what it could do.
	He modified it.. But... Something felt odd. He programmed it to give his body "Switcher" modifications. And so... It did happen. But not how he expected.
	Wings appeared on him, Along with there being a gauntlet.. Which for some reason, He couldn't get off.
	He knew that something happened; And something big happened.
	This was a new era of power. A new thing he'd have to get used to.
	
	
												He called this setup...
	
	
	
	
                                   âââââ âââââ âââââ âââââ ââââââ
                                   âââââ âââââ âââââ âââââ ââââââ
                                   ï¸±ââââ âââââ âââââ âââââ ï¸±ï¸±ââââ
                                   ï¸±ââââ âââââ âââââ âââââ ï¸±ââââï¸±
                                   âââââ âââââ âââââ ââï¸±ï¸±ï¸± ââââââ
                                   âââââ âââââ âââââ ââï¸±ï¸±ï¸± ââââââ	
	
âââââ ââï¸±ï¸±ï¸± ââââ ââââââ âââââ ââï¸±âââ ââ ââ â âââââ ï¸±ï¸±ï¸±ï¸±ï¸±ï¸± ââââ ââââââ âââââ ââï¸±ââ
âââââ ââï¸±ï¸±ï¸± ââ«â£â ââââââ âââââ ââï¸±âââ ââ ââ â âââââ ï¸±ï¸±ï¸±ï¸±ï¸±ï¸± ââ«â£â ââââââ âââââ ââï¸±ââ
ââï¸±ââ ââï¸±ï¸±ï¸± ï¸±ââï¸± ââââââ ââï¸±ââ ââââââ ââ ââ â âââââ ââââââ ï¸±ââï¸± ââââââ ââï¸±ââ âââââ
âââââ ââï¸±ââ ï¸±ââï¸± ï¸±ï¸±ââï¸±ï¸± ââï¸±ââ ââââââ ââ ââ â âââââ ââââââ ï¸±ââï¸± ï¸±ï¸±ââï¸±ï¸± ââï¸±ââ âââââ
âââ»ââ âââââ ââ«â£â ï¸±ï¸±ââï¸±ï¸± âââââ ââï¸±âââ ââ ââ â âââââ ââââââ ââ«â£â ï¸±ï¸±ââï¸±ï¸± âââââ ââï¸±ââ
âââââ âââââ ââââ ï¸±ï¸±ââï¸±ï¸± âââââ ââï¸±âââ ââ ââ â âââââ ï¸±ââââï¸± ââââ ï¸±ï¸±ââï¸±ï¸± âââââ ââï¸±ââ	
		
	]])
---- Sources and functions might be taken from others
plr = game:GetService("Players").LocalPlayer
Player = game:GetService("Players").LocalPlayer
print(plr,plr:GetMouse())
char = plr.Character
hum = char.Humanoid
mouse = plr:GetMouse()
local cam = game.Workspace.CurrentCamera
Camera = cam
local CamInterrupt = false
local TwoD = false
local TargetInfo = {nil, nil}
local Hue = 0
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
rotation = 0
poste = 0
ModeOfDerpz = "Derpz?"
Global = false

--Face changing functions
function Neutral() --okthen

	--eyes

	--eyes ð
end
function Upset() --cri

	--eyes

	--eyes ð
end
function Happy() --HHHHHHHHHHHHHHHHHHHHHHHH


	--eyes

	--eyes ð
end
function Determined() --It'S NOt oVEr uNtIl iT'S OveR

	--eyes

	--eyes ð
end
function Insane() --hahahhahah


	--eyes

	--eyes ð
end
function Sleeping() --Yes, I did make a sleeping face.

	--eyes

	--eyes ð
end
function CuteMeme()

	--eyes

	--eyes ð
end
--Face changing functions
--
function FocusOnPlayer()
	for i,v in pairs(game:GetService("Players"):GetChildren()) do
		local var = script.Focus.Focus1:Clone()
		var.Parent = v.PlayerGui
		var.Disabled = false
	end
end
function FocusSideways()
	for i,v in pairs(game:GetService("Players"):GetChildren()) do
		local var = script.Focus.Focus2:Clone()
		var.Parent = v.PlayerGui
		var.Disabled = false
	end
end
function TestThingy() --WIP, But I don't mind
	for i,v in pairs(game:GetService("Players"):GetChildren()) do
		local var = script.Focus.asd:Clone()
		var.Parent = v.PlayerGui
		var.Disabled = false
	end
end
function ZoomInOnFace() --ZOOOOOOM
	for i,v in pairs(game:GetService("Players"):GetChildren()) do
		local var = script.Focus.ZoomIn:Clone()
		var.Parent = v.PlayerGui
		var.Disabled = false
	end
end
--
--Shaking
function shakes(power,length)
	for i,v in pairs(game:GetService("Players"):GetChildren()) do
		local var = script.Shaker:Clone()
		var.Parent = v.Character
		local pw = var.Shakeval
		local lgth = var.MultLength
		pw.Value = power
		lgth.Value = length
		var.Disabled = false
	end
end
function CameraEnshaking(power,length)
	for i,v in pairs(game:GetService("Players"):GetChildren()) do
		local var = script.Shaker:Clone()
		var.Parent = v.Character
		local pw = var.Shakeval
		local lgth = var.MultLength
		pw.Value = power
		lgth.Value = length
		var.Disabled = false
	end
end

function localshakes(power,length)
	local var = script.Shaker:Clone()
	var.Parent = plr.Character
	local pw = var.Shakeval
	local lgth = var.MultLength
	pw.Value = power
	lgth.Value = length
	var.Disabled = false
end
--Shaking



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

local ORGID = 511836626
local ORVOL = 10
local ORPIT = 1.1
local kan = Instance.new("Sound",char)
kan.Volume = 10
kan.TimePosition = 0
kan.PlaybackSpeed = 1.01
kan.Pitch = 1.01
kan.SoundId = "rbxassetid://0"
kan.Name = "derpzglitcher music"
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
	kanz.Name = " "
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
modet.Font = "Arcade"
modet.TextStrokeColor3 = Color3.fromRGB(255,165,0)
modet.TextColor3 = Color3.fromRGB(75,0,130)
modet.Text = "Ki"


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
		for i = 0, 74*timeex do
			swait()
			tecks2.Text = text
			tecks3.Text = text
		end
		local randomrot = math.random(1,2)
		if randomrot == 1 then
			for i = 1, 50 do
				swait()
				tecks2.Text = text
				tecks3.Text = text
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
				tecks2.TextStrokeTransparency = tecks2.TextStrokeTransparency +.04
				tecks2.TextTransparency = tecks2.TextTransparency + .04
				tecks3.TextStrokeTransparency = tecks2.TextStrokeTransparency +.04
				tecks3.TextTransparency = tecks2.TextTransparency + .04
			end
		end
		if toggleTag == false then
		end
		naeeym2:Destroy()
	end)
	chat()
end

function newbosschatfunc(text,color1,color2,delay)
	for _,v in next, game:service'Players':players() do
		coroutine.wrap(function()
			if(script:FindFirstChild'BossChat' and v.Character)then
				local cha = script.BossChat:Clone()
				cha.Color1.Value=color1
				cha.Color2.Value=color2
				cha.Text.Value=text
				cha.Ghghghghgh.Value=delay
				cha.Mode.Value= "Ki"
				cha.ModeName.Value= modet.Text..":"
				cha.Parent=v.Character
				wait()
				cha.Disabled = false
				game:service'Debris':AddItem(cha,(delay/60)*4)
			end
		end)()
	end
end

function bosschatfunc(text,color,watval)
	newbosschatfunc(text,BrickColor.new'Navy blue'.Color,color,watval*30)
end




FELOADLIBRARY = {}
loadstring(game:GetObjects("rbxassetid://5209815302")[1].Source)()
local Create = FELOADLIBRARY.Create

CFuncs = {	
	["Part"] = {
		Create = function(Parent, Material, Reflectance, Transparency, BColor, Name, Size)
			local Part = Create("Part"){
				Parent = Parent,
				Reflectance = Reflectance,
				Transparency = Transparency,
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
				Transparency = Transparency,
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
--local guitl = script.Gui
--guitl.Parent = plr.PlayerGui
--local saw = guitl.Hell.saw
--local nad = guitl.Hell.text

local visualae = {}




local extrawingmod1 = Instance.new("Model",char)
local extrawingmod2 = Instance.new("Model",char)

function CreateParta(parent,transparency,reflectance,material,brickcolor)
	local p = Instance.new("Part")
	p.TopSurface = 0
	p.BottomSurface = 0
	p.Parent = parent
	p.Size = Vector3.new(0.1,0.1,0.1)
	p.Transparency = transparency
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

local cen = CreateParta(m,1,1,"SmoothPlastic",BrickColor.random())
CreateWeld(cen,root,cen,0,3,0,math.rad(0),math.rad(0),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
local effar = Instance.new("ParticleEmitter",cen)
effar.Texture = "rbxassetid://2344870656"
effar.LightEmission = 1
effar.Color = ColorSequence.new(Color3.new(1,0,0))
effar.Rate = 50
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
--------------
--------------
local sorb = CreateParta(m,1,1,"SmoothPlastic",BrickColor.random())
CreateWeld(sorb,rarm,sorb,0,1,0,math.rad(0),math.rad(0),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
local sorb2 = CreateParta(m,1,1,"SmoothPlastic",BrickColor.random())
CreateWeld(sorb2,larm,sorb2,0,1,0,math.rad(0),math.rad(0),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))

local handlex = CreateParta(mw2,1,1,"Neon",maincolor)
CreateMesh(handlex,"Brick",0,0,0)
CreateWeld(handlex,Part451,handlex,0,0,0,math.rad(0),math.rad(0),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
local handlexweld = CreateWeld(handlex,rarm,handlex,0,0.5,-1.05,math.rad(-30),math.rad(0),math.rad(0),0,0,0,math.rad(0),math.rad(0),math.rad(0))
------


function RemoveOutlines(part)
	part.TopSurface, part.BottomSurface, part.LeftSurface, part.RightSurface, part.FrontSurface, part.BackSurface = 10, 10, 10, 10, 10, 10
end
function CreatePart(Parent, Material, Reflectance, Transparency, BColor, Name, Size)
	local Part = Create("Part")({
		Parent = Parent,
		Reflectance = Reflectance,
		Transparency = Transparency,
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


function warnedpeople(text,represfont,color,color2)
	CFuncs["Sound"].Create("rbxassetid://534859368", char, 2.5,1)
	CFuncs["Sound"].Create("rbxassetid://963718869", char, 1,1)
	for i,v in pairs(game:GetService("Players"):GetPlayers()) do
		coroutine.resume(coroutine.create(function()
			if v.PlayerGui:FindFirstChild("boi")~= nil then
				v.PlayerGui:FindFirstChild("boi"):destroy()
			end
			local scrg = Instance.new("ScreenGui",v.PlayerGui)
			scrg.Name = "boi"
			frm = script:WaitForChild("WarnGUI").Holder:Clone()
			frm.Parent = scrg
			flm = script:WaitForChild("WarnGUI").Holder.Edge:Clone()
			flm.Parent = scrg
			flm2 = script:WaitForChild("WarnGUI").Holder.Edge2:Clone()
			flm2.Parent = scrg
			local Edittxt = frm.Edittext
			local Warn = frm.Warn
			local DepsImg = frm.Deps
			local fvalen = 0.55
			local fval = -0.49
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
				frm.BackgroundTransparency = 1
				flm.BackgroundTransparency = 1
				flm2.BackgroundTransparency = 1
				DepsImg.ImageTransparency = 1
				Edittxt.TextStrokeTransparency = 1
				Edittxt.TextTransparency = 1
				Warn.TextStrokeTransparency = 1
				Warn.TextTransparency = 1
				for i = 0, 99 do
					swait()
					frm.Edittext.Text = text
					frm.Edittext.Font = represfont
					frm.Edittext.TextColor3 = color
					frm.Edittext.TextStrokeColor3 = color2
					frm.Position = UDim2.new(-0.0598, 0,0.677, 0)
					frm.Rotation = 10 + 1 * math.sin(sine/36)
					Edittxt.Rotation = 0 + 2 * math.cos(sine/-36)
					Warn.Rotation  = 0 + 2 * math.sin(sine/-36)
					frm.Position = UDim2.new(-0.0598, 0,0.677, 0)
					frm.BackgroundTransparency = frm.BackgroundTransparency - 0.005
					flm.BackgroundTransparency = flm.BackgroundTransparency - 0.01
					flm2.BackgroundTransparency = flm2.BackgroundTransparency - 0.01
					DepsImg.ImageTransparency = DepsImg.ImageTransparency - 0.01
					Edittxt.TextStrokeTransparency = Edittxt.TextStrokeTransparency - 0.01
					Edittxt.TextTransparency = Edittxt.TextTransparency - 0.01
					Warn.TextStrokeTransparency = Edittxt.TextStrokeTransparency - 0.01
					Warn.TextTransparency = Edittxt.TextTransparency - 0.01
				end
				for i = 0, 99 do
					swait()
					fval = fval + 0.05
					flol = flol + 0.005
					frm.Position = UDim2.new(-0.0598, 0,0.677, 0)
					frm.Rotation = 10 + 1 * math.sin(sine/36)
					Edittxt.Rotation = 0 + 2 * math.cos(sine/-36)
					Warn.Rotation  = 0 + 2 * math.sin(sine/-36)
				end
				local valinc = 0
				local vinc2 = 1
				for i = 0, 99 do
					swait()
					vinc2 = vinc2 + 0.25
					valinc = valinc + 0.0001
					flol = flol + valinc
					flil = flil + valinc
					frm.Position = UDim2.new(-0.0598, 0,0.677, 0)
					frm.Rotation = 10 + 1 * math.sin(sine/36)
					Edittxt.Rotation = 0 + 2 * math.cos(sine/-36)
					Warn.Rotation  = 0 + 2 * math.sin(sine/-36)
					frm.Position = UDim2.new(-0.0598, 0,0.677, 0)
					frm.BackgroundTransparency = frm.BackgroundTransparency + 0.005
					flm.BackgroundTransparency = flm.BackgroundTransparency + 0.01
					flm2.BackgroundTransparency = flm2.BackgroundTransparency + 0.01
					DepsImg.ImageTransparency = DepsImg.ImageTransparency + 0.01
					Edittxt.TextStrokeTransparency = Edittxt.TextStrokeTransparency + 0.01
					Edittxt.TextTransparency = Edittxt.TextTransparency + 0.01
					Warn.TextStrokeTransparency = Edittxt.TextStrokeTransparency + 0.01
					Warn.TextTransparency = Edittxt.TextTransparency + 0.01
				end
				scrg:Destroy()
			end))
		end))
	end
end

function BossChatFuncTop(text,represfont,color,color2)
	for i,v in pairs(game:GetService("Players"):GetPlayers()) do
		coroutine.resume(coroutine.create(function()
			if v.PlayerGui:FindFirstChild("boi")~= nil then
				v.PlayerGui:FindFirstChild("boi"):destroy()
			end
			local scrg = Instance.new("ScreenGui",v.PlayerGui)
			scrg.Name = "boi"
			local ohno2 = script:WaitForChild("TopBossChat").Frame:Clone()
			ohno2.Parent = scrg
			local ohno = ohno2.TextLabel
			local fvalen = 0.55
			local fval = -0.49
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
				ohno2.BackgroundTransparency = 1
				ohno.TextStrokeTransparency = 1
				ohno.TextTransparency = 1
				for i = 0, 40 do
					swait()
					ohno.Text = ""
					ohno.Font = represfont
					ohno.TextColor3 = color
					ohno.TextStrokeColor3 = color2
					ohno2.BackgroundTransparency = ohno2.BackgroundTransparency - 0.05
					ohno.TextTransparency = ohno.TextTransparency - 0.05
					ohno.TextStrokeTransparency = ohno.TextStrokeTransparency - 0.05
				end
				for i = 1,string.len(text),1 do
					ohno.Text = string.sub(text,1,i)
					wait(0.03)
				end
				wait(1)
				local valinc = 0
				local vinc2 = 1
				for i = 0, 99 do
					swait()
					vinc2 = vinc2 + 0.25
					valinc = valinc + 0.0001
					flol = flol + valinc
					flil = flil + valinc
					ohno2.BackgroundTransparency = ohno2.BackgroundTransparency + 0.05
					ohno.TextTransparency = ohno.TextTransparency + 0.05
					ohno.TextStrokeTransparency = ohno.TextStrokeTransparency + 0.05

				end
				scrg:Destroy()
			end))
		end))
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
function nonlerpanim(jointorweld,cframe,alpha,easestyle,easedirect)
	local info = TweenInfo.new(alpha,easestyle,easedirect,0,false,0)
	local actualanim = game:GetService("TweenService"):Create(jointorweld,info,{C0=cframe})
	actualanim:Play()
	return actualanim
end
function Animate(jointorweld,cframe,alpha,easestyle,easedirect)
	local info = TweenInfo.new(alpha,easestyle,easedirect,0,false,0)
	local actualanim = game:GetService("TweenService"):Create(jointorweld,info,{C0=cframe})
	actualanim:Play()
	return actualanim
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

function ragdollJoint(character, part0, part1, attachmentName, className, properties)
	attachmentName = attachmentName.."RigAttachment"
	local constraint = Instance.new(className.."Constraint")
	constraint.Attachment0 = part0:FindFirstChild(attachmentName)
	constraint.Attachment1 = part1:FindFirstChild(attachmentName)
	constraint.Name = "RagdollConstraint"..part1.Name

	for _,propertyData in next,properties or {} do
		constraint[propertyData[1]] = propertyData[2]
	end

	constraint.Parent = character
end
function R15Ragdoll(character,KeepArms)
	character:BreakJoints()
	coroutine.resume(coroutine.create(function()
		recurse(character, function(_,v)
			if v:IsA("Attachment") then
				v.Axis = Vector3.new(0, 1, 0)
				v.SecondaryAxis = Vector3.new(0, 0, 1)
				v.Rotation = Vector3.new(0, 0, 0)
			end
		end)
		for _,child in next,character:GetChildren() do
			if child:IsA("Accoutrement") then
				for _,part in next,child:GetChildren() do
					if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
						local attachment1 = part:FindFirstChildOfClass("Attachment")
						local attachment0 = getAttachment0(character,attachment1.Name)
						if attachment0 and attachment1 then
							local constraint = Instance.new("HingeConstraint")
							constraint.Attachment0 = attachment0
							constraint.Attachment1 = attachment1
							constraint.LimitsEnabled = true
							constraint.UpperAngle = 0
							constraint.LowerAngle = 0
							constraint.Parent = character
						end
						ArtificialHitbox(part)
					elseif part.Name == "HumanoidRootPart" then
						part:remove()
					end
				end
			end
		end

		ragdollJoint(character,character.LowerTorso, character.UpperTorso, "Waist", "BallSocket", {
			{"LimitsEnabled",true};
			{"UpperAngle",5};
		})
		if character:FindFirstChild("Head") then
			ragdollJoint(character,character.UpperTorso, character.Head, "Neck", "BallSocket", {
				{"LimitsEnabled",true};
				{"UpperAngle",15};
			})
		end

		local handProperties = {
			{"LimitsEnabled", true};
			{"UpperAngle",0};
			{"LowerAngle",0};
		}
		ragdollJoint(character,character.LeftLowerArm, character.LeftHand, "LeftWrist", "Hinge", handProperties)
		ragdollJoint(character,character.RightLowerArm, character.RightHand, "RightWrist", "Hinge", handProperties)

		local shinProperties = {
			{"LimitsEnabled", true};
			{"UpperAngle", 0};
			{"LowerAngle", -75};
		}
		ragdollJoint(character,character.LeftUpperLeg, character.LeftLowerLeg, "LeftKnee", "Hinge", shinProperties)
		ragdollJoint(character,character.RightUpperLeg, character.RightLowerLeg, "RightKnee", "Hinge", shinProperties)

		local footProperties = {
			{"LimitsEnabled", true};
			{"UpperAngle", 15};
			{"LowerAngle", -45};
		}
		ragdollJoint(character,character.LeftLowerLeg, character.LeftFoot, "LeftAnkle", "Hinge", footProperties)
		ragdollJoint(character,character.RightLowerLeg, character.RightFoot, "RightAnkle", "Hinge", footProperties)
		if KeepArms == true then
			ragdollJoint(character,character.UpperTorso, character.RightUpperArm, "RightShoulder", "BallSocket")
			ragdollJoint(character,character.RightUpperArm, character.RightLowerArm, "RightElbow", "BallSocket")
			ragdollJoint(character,character.UpperTorso, character.LeftUpperArm, "LeftShoulder", "BallSocket")
			ragdollJoint(character,character.LeftUpperArm, character.LeftLowerArm, "LeftElbow", "BallSocket")
		end
		ragdollJoint(character,character.LowerTorso, character.LeftUpperLeg, "LeftHip", "BallSocket")
		ragdollJoint(character,character.LowerTorso, character.RightUpperLeg, "RightHip", "BallSocket")
		game:GetService("Debris"):AddItem(character,50)
	end))
end


local gauntlet2 = Instance.new("Part")
gauntlet2.Transparency = 1
gauntlet2.Parent = char
local finalweld2 = Instance.new("Weld",gauntlet2)
finalweld2.Part0 = gauntlet2
finalweld2.Part1 = larm
gauntlet2.Anchored = false
function scythetrans(trans)
	for i,v in pairs (gauntlet2:GetChildren()) do
		if v.Name ~= "Weld" then
			v.Transparency = trans
			if v.Name == "Meshes/J" then
				if trans < 1 then
					v.ParticleEmitter.Enabled = true
				else
					v.ParticleEmitter.Enabled = false
				end
			end
		end
	end
end
scythetrans(1)

function Ragdoll(Character2,CharTorso,KeepArms)
	coroutine.resume(coroutine.create(function()
		Character2:BreakJoints()
		if Character2:FindFirstChild("HumanoidRootPart") then
			--	Character2.HumanoidRootPart:Destroy()
		else
		end
		local hum = Character2:FindFirstChildOfClass("Humanoid")
		hum:remove()
		local function Scan(ch)
			local e
			for e = 1,#ch do
				Scan(ch[e]:GetChildren())
				if ch[e].ClassName == "Weld" or ch[e].ClassName == "Motor6D" then
					ch[e]:remove()
				end
			end
		end
		local NEWHUM = Instance.new("Humanoid")
		NEWHUM.Health = 0
		NEWHUM.MaxHealth = 0
		NEWHUM.PlatformStand = true
		NEWHUM.Parent = Character2
		NEWHUM.DisplayDistanceType = "None"

		local ch = Character2:GetChildren()
		local i
		for i = 1,#ch do
			if ch[i].Name == "THandle1" or ch[i].Name == "THandle2" then
				ch[i]:remove()
			end
		end

		local Torso2 = Character2.Torso
		local movevector = Vector3.new()

		if Torso2 then
			movevector = CFrame.new(CharTorso.Position,Torso2.Position).lookVector
			local Head = Character2:FindFirstChild("Head")
			if Head then
				local Neck = Instance.new("Weld")
				Neck.Name = "Neck"
				Neck.Part0 = Torso2
				Neck.Part1 = Head
				Neck.C0 = CFrame.new(0, 1.5, 0)
				Neck.C1 = CFrame.new()
				Neck.Parent = Torso2

			end
			local Limb = Character2:FindFirstChild("Right Arm")
			if Limb and KeepArms == true then

				Limb.CFrame = Torso2.CFrame * CFrame.new(1.5, 0, 0)
				local Joint = Instance.new("Glue")
				Joint.Name = "RightShoulder"
				Joint.Part0 = Torso2
				Joint.Part1 = Limb
				Joint.C0 = CFrame.new(1.5, 0.5, 0, 0, 0, 1, 0, 1, 0, -1, -0, -0)
				Joint.C1 = CFrame.new(-0, 0.5, 0, 0, 0, 1, 0, 1, 0, -1, -0, -0)
				Joint.Parent = Torso2

				local B = Instance.new("Part")
				B.TopSurface = 0
				B.BottomSurface = 0
				B.formFactor = "Symmetric"
				B.Size = Vector3.new(1, 1, 1)
				B.Transparency = 1
				B.CFrame = Limb.CFrame * CFrame.new(0, -0.5, 0)
				B.Parent = Character2
				local W = Instance.new("Weld")
				W.Part0 = Limb
				W.Part1 = B
				W.C0 = CFrame.new(0, -0.5, 0)
				W.Parent = Limb

			end
			local Limb = Character2:FindFirstChild("Left Arm")
			if Limb and KeepArms == true then

				Limb.CFrame = Torso2.CFrame * CFrame.new(-1.5, 0, 0)
				local Joint = Instance.new("Glue")
				Joint.Name = "LeftShoulder"
				Joint.Part0 = Torso2
				Joint.Part1 = Limb
				Joint.C0 = CFrame.new(-1.5, 0.5, 0, -0, -0, -1, 0, 1, 0, 1, 0, 0)
				Joint.C1 = CFrame.new(0, 0.5, 0, -0, -0, -1, 0, 1, 0, 1, 0, 0)
				Joint.Parent = Torso2

				local B = Instance.new("Part")
				B.TopSurface = 0
				B.BottomSurface = 0
				B.formFactor = "Symmetric"
				B.Size = Vector3.new(1, 1, 1)
				B.Transparency = 1
				B.CFrame = Limb.CFrame * CFrame.new(0, -0.5, 0)
				B.Parent = Character2
				local W = Instance.new("Weld")
				W.Part0 = Limb
				W.Part1 = B
				W.C0 = CFrame.new(0, -0.5, 0)
				W.Parent = Limb

			end
			local Limb = Character2:FindFirstChild("Right Leg")
			if Limb then

				Limb.CFrame = Torso2.CFrame * CFrame.new(0.5, -2, 0)
				local Joint = Instance.new("Glue")
				Joint.Name = "RightHip"
				Joint.Part0 = Torso2
				Joint.Part1 = Limb
				Joint.C0 = CFrame.new(0.5, -1, 0, 0, 0, 1, 0, 1, 0, -1, -0, -0)
				Joint.C1 = CFrame.new(0, 1, 0, 0, 0, 1, 0, 1, 0, -1, -0, -0)
				Joint.Parent = Torso2

				local B = Instance.new("Part")
				B.TopSurface = 0
				B.BottomSurface = 0
				B.formFactor = "Symmetric"
				B.Size = Vector3.new(1, 1, 1)
				B.Transparency = 1
				B.CFrame = Limb.CFrame * CFrame.new(0, -0.5, 0)
				B.Parent = Character2
				local W = Instance.new("Weld")
				W.Part0 = Limb
				W.Part1 = B
				W.C0 = CFrame.new(0, -0.5, 0)
				W.Parent = Limb

			end
			local Limb = Character2:FindFirstChild("Left Leg")
			if Limb then

				Limb.CFrame = Torso2.CFrame * CFrame.new(-0.5, -2, 0)
				local Joint = Instance.new("Glue")
				Joint.Name = "LeftHip"
				Joint.Part0 = Torso2
				Joint.Part1 = Limb
				Joint.C0 = CFrame.new(-0.5, -1, 0, -0, -0, -1, 0, 1, 0, 1, 0, 0)
				Joint.C1 = CFrame.new(-0, 1, 0, -0, -0, -1, 0, 1, 0, 1, 0, 0)
				Joint.Parent = Torso2

				local B = Instance.new("Part")
				B.TopSurface = 0
				B.BottomSurface = 0
				B.formFactor = "Symmetric"
				B.Size = Vector3.new(1, 1, 1)
				B.Transparency = 1
				B.CFrame = Limb.CFrame * CFrame.new(0, -0.5, 0)
				B.Parent = Character2
				local W = Instance.new("Weld")
				W.Part0 = Limb
				W.Part1 = B
				W.C0 = CFrame.new(0, -0.5, 0)
				W.Parent = Limb

			end
			--[
			local Bar = Instance.new("Part")
			Bar.TopSurface = 0
			Bar.BottomSurface = 0
			Bar.formFactor = "Symmetric"
			Bar.Size = Vector3.new(1, 1, 1)
			Bar.Transparency = 1
			Bar.CFrame = Torso2.CFrame * CFrame.new(0, 0.5, 0)
			Bar.Parent = Character2
			local Weld = Instance.new("Weld")
			Weld.Part0 = Torso2
			Weld.Part1 = Bar
			Weld.C0 = CFrame.new(0, 0.5, 0)
			Weld.Parent = Torso2
			--]]
		end
		Character2.Parent = workspace
		game:GetService("Debris"):AddItem(Character2,90)

		return Character2,Torso2
	end))
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
		c = Instance.new("ObjectValue")
		c.Name = "creator"
		c.Value = Player
		c.Parent = h

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
			h.MaxHealth = 60
			if char:FindFirstChild("ur screwed now") then
				h.Health = h.Health - Damage*16500
			else
				h.Health = h.Health - Damage
			end
			if HitHealth ~= h.Health and HitHealth ~= 0 and 0 >= h.Health then
				print("gained kill")
				if h.Parent:FindFirstChild("Torso") then
					h.Parent:FindFirstChild("Torso").CFrame = h.Parent:FindFirstChild("Torso").CFrame * angles(math.rad(2), math.rad(0), math.rad(0))
					Ragdoll(h.Parent,Torso,true)
				elseif h.Parent:FindFirstChild("UpperTorso") then
					R15Ragdoll(h.Parent,true)
				end
			end
			ShowDamage(Part.CFrame * CFrame.new(0, 0, Part.Size.Z / 2).p + Vector3.new(0, 1.5, 0), -Damage, 1.5, Part.BrickColor.Color)
		else
			h.Health = h.Health - Damage*16500
			ShowDamage(Part.CFrame * CFrame.new(0, 0, Part.Size.Z / 2).p + Vector3.new(0, 1.5, 0), -Damage, 1.5, Part.BrickColor.Color)
		end
		if Type == "Knockdown" then
			local hum = hit.Parent:FindFirstChildOfClass("Humanoid")
			hum.PlatformStand = true
			coroutine.resume(coroutine.create(function(HHumanoid)
				swait(1)
				if hum.Name ~= "Corpse" then
					HHumanoid.PlatformStand = false
				else
				end
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
					--  Effects.Sphere.Create(BrickColor.new("Bright red"), hit.Parent.Torso.CFrame * cn(0, 0, 0) * angles(math.random(-50, 50), math.random(-50, 50), math.random(-50, 50)), 1, 15, 1, 0, 5, 0, 0.02)
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
			--  Effects.Block.Create(BrickColor.new("Pastel Blue"), hit.Parent.Torso.CFrame * cn(0, 0, 0), 15*4, 15*4, 15*4, 3*4, 3*4, 3*4, 0.07)
			for i = 1, math.random(4, 5) do
				-- Effects.Sphere.Create(BrickColor.new("Teal"), hit.Parent.Torso.CFrame * cn(math.random(-5, 5), math.random(-5, 5), math.random(-5, 5)) * angles(math.random(-50, 50), math.random(-50, 50), math.random(-50, 50)), 1, 15, 1, 0, 5, 0, 0.02)
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
			-- CreateBigIceSword(hit.Parent.Torso.CFrame)
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
					--MagicBlock(BrickColor.new("Pastel light blue"),head.CFrame,5,5,5,1,1,1,0.05)
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

local derpz = Character:GetChildren()
for i=1, #derpz do 
	if (derpz[i].className == "Accessory") then 
		--derpz[i].Parent = nil
	elseif (derpz[i].className == "Shirt") then
		--derpz[i].Parent = nil
	elseif (derpz[i].className == "Pants") then
		--derpz[i].Parent = nil
	elseif (derpz[i].className == "CharacterMesh") then
		--derpz[i].Parent = nil
	elseif (derpz[i].className == "ShirtGraphic") then
		--derpz[i].Parent = nil

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
	rng.Transparency = 0
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
	rngm.MeshId = "http://www.roblox.com/asset/?id=1051557"
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
	rngm.MeshId = "http://www.roblox.com/asset/?id=1051557"
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
	rng.Transparency = 0
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
	if ModeOfDerpz ~= 9 then
		rng.BrickColor = color
	elseif ModeOfDerpz == 9 then
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
	if ModeOfDerpz == 9 then
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
	if ModeOfDerpz ~= 9 then
		rng.BrickColor = color
	elseif ModeOfDerpz == 9 then
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
	if ModeOfDerpz == 9 then
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
	if ModeOfDerpz ~= 9 then
		rng.BrickColor = color
	elseif ModeOfDerpz == 9 then
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
	rng.CFrame = rng.CFrame + rng.CFrame.lookVector*outerpos
	local rngm = Instance.new("SpecialMesh", rng)
	rngm.MeshType = "Sphere"
	rngm.Scale = vt(x1,y1,z1)
	if rainbowmode == true then
		rng.Color = Color3.new(r/255,g/255,b/255)
	end
	if ModeOfDerpz == 9 then
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

function RecolorTextAndRename(name,col1,col2,font)
	modet.TextStrokeColor3 = col2
	modet.TextColor3 = col1
	modet.Font = font
	modet.Text = name
end

function sphereMKCharge(bonuspeed,FastSpeed,type,pos,x1,y1,z1,value,color,outerpos)
	local type = type
	local rng = Instance.new("Part", char)
	rng.Anchored = true
	if ModeOfDerpz ~= 9 then
		rng.BrickColor = color
	elseif ModeOfDerpz == 9 then
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
	if ModeOfDerpz == 9 then
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
ono = 0
function dmg(dude)
	if dude.Name ~= Character then
		local keptcolor = BrickColor.new("Really red")
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
						--v:Destroy()
					end
					if v:IsA("Humanoid") then
						--v:Destroy()
					end
					if v:IsA("CharacterMesh") then
						--v:Destroy()
					end--
					if v:IsA("Model") then
						--v:Destroy()
					end
					if v:IsA("Part") or v:IsA("MeshPart") then
						for x, o in pairs(v:GetChildren()) do
							if o:IsA("Decal") then
								--o:Destroy()
							end
						end
						coroutine.resume(coroutine.create(function()
							v.Material = "Neon"
							v.CanCollide = false
							v.Anchored = false
							local bld = Instance.new("ParticleEmitter",v)
							bld.LightEmission = 0.75
							bld.Texture = "rbxassetid://363275192" ---284205403
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
--Wings
ModeColor = BrickColor.new("Royal purple")
ModeColor2 = BrickColor.new("Dark orange")
Player=game:GetService('Players').LocalPlayer
Character=Player.Character
m=Instance.new('Model',Character)
it=Instance.new
function nooutline(part)
	part.TopSurface,part.BottomSurface,part.LeftSurface,part.RightSurface,part.FrontSurface,part.BackSurface = 10,10,10,10,10,10
end
function part(formfactor,parent,material,reflectance,transparency,brickcolor,name,size)
	local fp=it("Part")
	fp.formFactor=formfactor
	fp.Parent=parent
	fp.Reflectance=reflectance
	fp.Transparency=transparency
	fp.CanCollide=false
	fp.Locked=true
	fp.BrickColor=BrickColor.new(tostring(brickcolor))
	fp.Name=name
	fp.Size=size
	fp.Position=Character.Torso.Position
	nooutline(fp)
	fp.Material=material
	fp:BreakJoints()
	return fp
end
function mesh(Mesh,part,meshtype,meshid,offset,scale)
	local mesh=it(Mesh)
	mesh.Parent=part
	if Mesh=="SpecialMesh" then
		mesh.MeshType=meshtype
		mesh.MeshId=meshid
	end
	mesh.Offset=offset
	mesh.Scale=scale
	return mesh
end
function weld(parent,part0,part1,c0,c1)
	local weld=it("Weld")
	weld.Parent=parent
	weld.Part0=part0
	weld.Part1=part1
	weld.C0=c0
	weld.C1=c1
	return weld
end

Handle=part(Enum.FormFactor.Symmetric,m,Enum.Material.Neon,0,0,"Really black","Handle",Vector3.new(0.737122595, 0.326575577, 1.51724529))
--game:GetService("Players").LocalPlayer.Character["MeshPartAccessory"].Name = "gamer2"

Handleweld=weld(m,Character["Torso"],Handle,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-2.13700104, 0.574226379, 0.555047989, -0.931082726, 0.359660119, 0.0610630736, -0.118210077, -0.139092848, -0.983198643, -0.345123857, -0.922657371, 0.172022387))
Part2=part(Enum.FormFactor.Custom,m,Enum.Material.Neon,0,0,ModeColor,"Part2",Vector3.new(0.199999973, 0.999999881, 1.19999993))
Part2weld=weld(m,Handle,Part2,CFrame.new(0, 0, 0, -0.931082726, 0.359660119, 0.0610630736, -0.118210077, -0.139092848, -0.983198643, -0.345123857, -0.922657371, 0.172022387),CFrame.new(-0.00289154053, 0.126571655, 5.5479126, 0.0988398939, 0.141292349, 0.985026062, -0.628047705, -0.758960247, 0.171884969, 0.771877706, -0.635627985, 0.0137228817))
mesh("SpecialMesh",Part2,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 1, 1))
Part3=part(Enum.FormFactor.Custom,m,Enum.Material.Neon,0,0,ModeColor,"Part3",Vector3.new(0.199999973, 0.799999833, 4.99999952))
local hat = game:GetService("Players").LocalPlayer.Character["gamer2"]

local function align(part0, part1)

	part0.AccessoryWeld:Destroy()
	local attachment0 = Instance.new("Attachment", part0)
	attachment0.Position = Vector3.new(0, 0, 0) --Custom Positioning Values Here
	attachment0.Orientation = Vector3.new(140, 90, 0) --Custom Rotationing Values here
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
align(hat.Handle, Part3)
Part3weld=weld(m,Handle,Part3,CFrame.new(0, 0, 0, -0.931082726, 0.359660119, 0.0610630736, -0.118210077, -0.139092848, -0.983198643, -0.345123857, -0.922657371, 0.172022387),CFrame.new(0.00289916992, 0.226577759, -2.44792938, -0.0988399088, -0.141292334, -0.985026062, -0.628047764, -0.758960366, 0.171885014, -0.771877646, 0.635628104, -0.0137228817))
Part8=part(Enum.FormFactor.Custom,m,Enum.Material.Neon,0,0,ModeColor,"Part8",Vector3.new(0.199999988, 0.199999988, 4.99999952))
Part8weld=weld(m,Handle,Part8,CFrame.new(0, 0, 0, -0.931082726, 0.359660119, 0.0610630736, -0.118210077, -0.139092848, -0.983198643, -0.345123857, -0.922657371, 0.172022387),CFrame.new(0.00289916992, -0.2734375, -2.4479599, -0.0988401547, -0.141291723, -0.985021472, -0.628046155, -0.758955657, 0.171884909, -0.771873593, 0.635628045, -0.01372243))
mesh("SpecialMesh",Part8,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 1, 1))
Part9=part(Enum.FormFactor.Custom,m,Enum.Material.Neon,0,0,ModeColor,"Part9",Vector3.new(0.200000003, 0.799999952, 4.19999981))
local hat = game:GetService("Players").LocalPlayer.Character["gamer3"]

local function align(part0, part1)

	part0.AccessoryWeld:Destroy()
	local attachment0 = Instance.new("Attachment", part0)
	attachment0.Position = Vector3.new(0, 0, 0) --Custom Positioning Values Here
	attachment0.Orientation = Vector3.new(140, 90, 0) --Custom Rotationing Values here
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
align(hat.Handle, Part9)
Part9weld=weld(m,Handle,Part9,CFrame.new(0, 0, 0, -0.931082726, 0.359660119, 0.0610630736, -0.118210077, -0.139092848, -0.983198643, -0.345123857, -0.922657371, 0.172022387),CFrame.new(0.00296020508, -1.61325073, -1.90857697, -0.0988346785, -0.141285136, -0.985027492, -0.484457493, -0.857815087, 0.171647519, -0.869218469, 0.494164973, 0.0163349751))
Part10=part(Enum.FormFactor.Custom,m,Enum.Material.Neon,0,0,ModeColor,"Part10",Vector3.new(0.200000003, 0.200000003, 4.19999981))
Part10weld=weld(m,Handle,Part10,CFrame.new(0, 0, 0, -0.931082726, 0.359660119, 0.0610630736, -0.118210077, -0.139092848, -0.983198643, -0.345123857, -0.922657371, 0.172022387),CFrame.new(0.00296783447, -2.11328506, -1.90859222, -0.0988349468, -0.141284555, -0.985023022, -0.484456658, -0.857810557, 0.1716474, -0.869214356, 0.494165629, 0.0163354147))
mesh("SpecialMesh",Part10,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 1, 1))
Part13=part(Enum.FormFactor.Custom,m,Enum.Material.Neon,0,0,ModeColor,"Part13",Vector3.new(0.200000003, 1, 1.20000005))

Part13weld=weld(m,Handle,Part13,CFrame.new(0, 0, 0, -0.931082726, 0.359660119, 0.0610630736, -0.118210077, -0.139092848, -0.983198643, -0.345123857, -0.922657371, 0.172022387),CFrame.new(-0.00296020508, -1.71326065, 4.60858154, 0.0988346562, 0.141285151, 0.985027492, -0.484457433, -0.857815027, 0.171647474, 0.869218528, -0.494164854, -0.016334977))
mesh("SpecialMesh",Part13,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 1, 1))
Part18=part(Enum.FormFactor.Custom,m,Enum.Material.Neon,0,0,ModeColor,"Part18",Vector3.new(0.199999973, 0.199999973, 4.59999943))
local hat = game:GetService("Players").LocalPlayer.Character["gamer5"]

local function align(part0, part1)

	part0.AccessoryWeld:Destroy()
	local attachment0 = Instance.new("Attachment", part0)
	attachment0.Position = Vector3.new(0, -.5, 0) --Custom Positioning Values Here
	attachment0.Orientation = Vector3.new(140, 90, 0) --Custom Rotationing Values here
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
align(hat.Handle, Part18)
Part18weld=weld(m,Handle,Part18,CFrame.new(0, 0, 0, -0.931082726, 0.359660119, 0.0610630736, -0.118210077, -0.139092848, -0.983198643, -0.345123857, -0.922657371, 0.172022387),CFrame.new(0.0030670166, -1.17616272, -2.13925934, -0.0988550559, -0.141272128, -0.985022783, -0.558375001, -0.81147331, 0.172419131, -0.823677719, 0.567056596, 0.00133541063))
mesh("SpecialMesh",Part18,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 1, 1))
Part101=part(Enum.FormFactor.Symmetric,m,Enum.Material.Neon,0,0,"Really black","Part101",Vector3.new(0.737122595, 0.326575577, 1.47424531))

Part101weld=weld(m,Handle,Part101,CFrame.new(0, 0, 0, -0.931082726, 0.359660119, 0.0610630736, -0.118210077, -0.139092848, -0.983198643, -0.345123857, -0.922657371, 0.172022387),CFrame.new(-0.229278564, 0.00509643555, -1.30854034, -0.995167911, 0.00477665802, 0.0980637521, -0.0976645499, -0.150390878, -0.983790755, 0.010048613, -0.988614321, 0.150130734))
Part21=part(Enum.FormFactor.Custom,m,Enum.Material.Neon,0,0,ModeColor,"Part21",Vector3.new(0.199999973, 0.999999881, 1.19999993))
Part21weld=weld(m,Handle,Part21,CFrame.new(0, 0, 0, -0.931082726, 0.359660119, 0.0610630736, -0.118210077, -0.139092848, -0.983198643, -0.345123857, -0.922657371, 0.172022387),CFrame.new(-0.003074646, -0.77614212, 5.03923035, 0.0988549143, 0.141272902, 0.985027492, -0.558376133, -0.811478198, 0.172419384, 0.823682308, -0.567056, -0.0013350076))
mesh("SpecialMesh",Part21,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 1, 1))
Part20=part(Enum.FormFactor.Custom,m,Enum.Material.Neon,0,0,ModeColor,"Part20",Vector3.new(0.199999973, 0.799999833, 4.59999943))
Part20weld=weld(m,Handle,Part20,CFrame.new(0, 0, 0, -0.931082726, 0.359660119, 0.0610630736, -0.118210077, -0.139092848, -0.983198643, -0.345123857, -0.922657371, 0.172022387),CFrame.new(0.0030670166, -0.676166534, -2.13925934, -0.0988565385, -0.141273394, -0.985032141, -0.558380485, -0.81147939, 0.172420278, -0.823683262, 0.56705898, 0.00133514532))


local particleemitter = Instance.new("ParticleEmitter", Part3)
particleemitter.Speed = NumberRange.new(0.30000001192093, 0.30000001192093)
particleemitter.Rotation = NumberRange.new(0, 360)
particleemitter.Color = ColorSequence.new(ModeColor.Color,ModeColor2.Color)
particleemitter.LightEmission = 1
particleemitter.Texture = "http://www.roblox.com/asset/?id=468084989"
particleemitter.Transparency = NumberSequence.new(0,1,1)
particleemitter.Size = NumberSequence.new(0,1.5,0)
particleemitter.EmissionDirection = Enum.NormalId.Back
particleemitter.Lifetime = NumberRange.new(5, 5)
particleemitter.LockedToPart = true
particleemitter.Rate = 50
local particleemitter = Instance.new("ParticleEmitter", Part9)
particleemitter.Speed = NumberRange.new(0.30000001192093, 0.30000001192093)
particleemitter.Rotation = NumberRange.new(0, 360)
particleemitter.Color = ColorSequence.new(ModeColor.Color,ModeColor2.Color)
particleemitter.LightEmission = 1
particleemitter.Texture = "http://www.roblox.com/asset/?id=468084989"
particleemitter.Transparency = NumberSequence.new(0,1,1)
particleemitter.Size = NumberSequence.new(0,1.5,0)
particleemitter.EmissionDirection = Enum.NormalId.Back
particleemitter.Lifetime = NumberRange.new(5, 5)
particleemitter.LockedToPart = true
particleemitter.Rate = 50
local particleemitter = Instance.new("ParticleEmitter", Part20)
particleemitter.Speed = NumberRange.new(0.30000001192093, 0.30000001192093)
particleemitter.Rotation = NumberRange.new(0, 360)
particleemitter.Color = ColorSequence.new(ModeColor.Color,ModeColor2.Color)
particleemitter.LightEmission = 1
particleemitter.Texture = "http://www.roblox.com/asset/?id=468084989"
particleemitter.Transparency = NumberSequence.new(0,1,1)
particleemitter.Size = NumberSequence.new(0,1.5,0)
particleemitter.EmissionDirection = Enum.NormalId.Back
particleemitter.Lifetime = NumberRange.new(5, 5)
particleemitter.LockedToPart = true
particleemitter.Rate = 50
-------------------------------------------------
Player=game:GetService('Players').LocalPlayer
Character=Player.Character
M1=Instance.new('Model',Character)
it=Instance.new
function nooutline(part)
	part.TopSurface,part.BottomSurface,part.LeftSurface,part.RightSurface,part.FrontSurface,part.BackSurface = 10,10,10,10,10,10
end
function part(formfactor,parent,material,reflectance,transparency,brickcolor,name,size)
	local fp=it("Part")
	fp.formFactor=formfactor
	fp.Parent=parent
	fp.Reflectance=reflectance
	fp.Transparency=transparency
	fp.CanCollide=false
	fp.Locked=true
	fp.BrickColor=BrickColor.new(tostring(brickcolor))
	fp.Name=name
	fp.Size=size
	fp.Position=Character.Torso.Position
	nooutline(fp)
	fp.Material=material
	fp:BreakJoints()
	return fp
end
function mesh(Mesh,part,meshtype,meshid,offset,scale)
	local mesh=it(Mesh)
	mesh.Parent=part
	if Mesh=="SpecialMesh" then
		mesh.MeshType=meshtype
		mesh.MeshId=meshid
	end
	mesh.Offset=offset
	mesh.Scale=scale
	return mesh
end
function weld(parent,part0,part1,c0,c1)
	local weld=it("Weld")
	weld.Parent=parent
	weld.Part0=part0
	weld.Part1=part1
	weld.C0=c0
	weld.C1=c1
	return weld
end

Handle2=part(Enum.FormFactor.Symmetric,M1,Enum.Material.Neon,0,0,"Really black","Handle2",Vector3.new(0.737122595, 0.326575577, 1.51724529))
Handle2weld=weld(M1,Character["Torso"],Handle2,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(2.07476044, 0.582122803, 0.578117371, -0.931082726, -0.359660119, -0.0610630736, 0.118210077, -0.139092848, -0.983198643, 0.345123857, -0.922657371, 0.172022387))
Part10=part(Enum.FormFactor.Custom,M1,Enum.Material.Neon,0,0,ModeColor2,"Part10",Vector3.new(0.200000003, 0.200000003, 4.19999981))
Part10weld=weld(M1,Handle2,Part10,CFrame.new(0, 0, 0, -0.931082726, -0.359660119, -0.0610630736, 0.118210077, -0.139092848, -0.983198643, 0.345123857, -0.922657371, 0.172022387),CFrame.new(-0.0029296875, -2.11326599, -1.90862274, -0.0988372117, 0.141284317, 0.985022843, 0.484451026, -0.857813537, 0.171648204, 0.869217157, 0.494160533, 0.0163385645))
mesh("SpecialMesh",Part10,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 1, 1))
Part101=part(Enum.FormFactor.Symmetric,M1,Enum.Material.Neon,0,0,"Really black","Part101",Vector3.new(0.737122595, 0.326575577, 1.47424531))
local hat = game:GetService("Players").LocalPlayer.Character["gamer4"]

local function align(part0, part1)

	part0.AccessoryWeld:Destroy()
	local attachment0 = Instance.new("Attachment", part0)
	attachment0.Position = Vector3.new(2, 2, 0) --Custom Positioning Values Here
	attachment0.Orientation = Vector3.new(-0, 90, 90) --Custom Rotationing Values here
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
align(hat.Handle, Part101)
Part101weld=weld(M1,Handle2,Part101,CFrame.new(0, 0, 0, -0.931082726, -0.359660119, -0.0610630736, 0.118210077, -0.139092848, -0.983198643, 0.345123857, -0.922657371, 0.172022387),CFrame.new(0.229278564, 0.00509643555, -1.30853653, -0.995167911, -0.00477665802, -0.0980637521, 0.0976645499, -0.150390878, -0.983790755, -0.010048613, -0.988614321, 0.150130734))
Part13=part(Enum.FormFactor.Custom,M1,Enum.Material.Neon,0,0,ModeColor2,"Part13",Vector3.new(0.200000003, 1, 1.20000005))
Part13weld=weld(M1,Handle2,Part13,CFrame.new(0, 0, 0, -0.931082726, -0.359660119, -0.0610630736, 0.118210077, -0.139092848, -0.983198643, 0.345123857, -0.922657371, 0.172022387),CFrame.new(0.00296020508, -1.71326447, 4.60858154, 0.0988346562, -0.141285151, -0.985027492, 0.484457433, -0.857815027, 0.171647474, -0.869218528, -0.494164854, -0.016334977))
mesh("SpecialMesh",Part13,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 1, 1))
Part18=part(Enum.FormFactor.Custom,M1,Enum.Material.Neon,0,0,ModeColor2,"Part18",Vector3.new(0.199999973, 0.199999973, 4.59999943))
local hat = game:GetService("Players").LocalPlayer.Character["gamer6"]

local function align(part0, part1)

	part0.AccessoryWeld:Destroy()
	local attachment0 = Instance.new("Attachment", part0)
	attachment0.Position = Vector3.new(0, 0, 0) --Custom Positioning Values Here
	attachment0.Orientation = Vector3.new(140, 90, 0) --Custom Rotationing Values here
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
align(hat.Handle, Part18)
Part18weld=weld(M1,Handle2,Part18,CFrame.new(0, 0, 0, -0.931082726, -0.359660119, -0.0610630736, 0.118210077, -0.139092848, -0.983198643, 0.345123857, -0.922657371, 0.172022387),CFrame.new(-0.0030670166, -1.1761322, -2.13922882, -0.0988577381, 0.141272023, 0.985022545, 0.558369696, -0.811476648, 0.172420546, 0.823680997, 0.567051828, 0.00133872975))
mesh("SpecialMesh",Part18,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 1, 1))
Part2=part(Enum.FormFactor.Custom,M1,Enum.Material.Neon,0,0,ModeColor2,"Part2",Vector3.new(0.199999973, 0.999999881, 1.19999993))
Part2weld=weld(M1,Handle2,Part2,CFrame.new(0, 0, 0, -0.931082726, -0.359660119, -0.0610630736, 0.118210077, -0.139092848, -0.983198643, 0.345123857, -0.922657371, 0.172022387),CFrame.new(0.00288391113, 0.126571655, 5.54790497, 0.0988398939, -0.141292349, -0.985026062, 0.628047705, -0.758960247, 0.171884969, -0.771877706, -0.635627985, 0.0137228817))
mesh("SpecialMesh",Part2,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 1, 1))
Part20=part(Enum.FormFactor.Custom,M1,Enum.Material.Neon,0,0,ModeColor2,"Part20",Vector3.new(0.199999973, 0.799999833, 4.59999943))
Part20weld=weld(M1,Handle2,Part20,CFrame.new(0, 0, 0, -0.931082726, -0.359660119, -0.0610630736, 0.118210077, -0.139092848, -0.983198643, 0.345123857, -0.922657371, 0.172022387),CFrame.new(-0.00305175781, -0.676185608, -2.1392746, -0.0988565087, 0.141273409, 0.985032201, 0.558380425, -0.81147939, 0.172420278, 0.8236835, 0.567058921, 0.00133515324))
Part21=part(Enum.FormFactor.Custom,M1,Enum.Material.Neon,0,0,ModeColor2,"Part21",Vector3.new(0.199999973, 0.999999881, 1.19999993))
local hat = game:GetService("Players").LocalPlayer.Character["gamer1"]

local function align(part0, part1)

	part0.AccessoryWeld:Destroy()
	local attachment0 = Instance.new("Attachment", part0)
	attachment0.Position = Vector3.new(0, -.5, 0) --Custom Positioning Values Here
	attachment0.Orientation = Vector3.new(-0, 90, 0) --Custom Rotationing Values here
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
align(hat.Handle, Part21)
Part21weld=weld(M1,Handle2,Part21,CFrame.new(0, 0, 0, -0.931082726, -0.359660119, -0.0610630736, 0.118210077, -0.139092848, -0.983198643, 0.345123857, -0.922657371, 0.172022387),CFrame.new(0.003074646, -0.776145935, 5.03923798, 0.0988549143, -0.141272902, -0.985027492, 0.558376133, -0.811478198, 0.172419384, -0.823682308, -0.567056, -0.0013350076))
mesh("SpecialMesh",Part21,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 1, 1))
Part3=part(Enum.FormFactor.Custom,M1,Enum.Material.Neon,0,0,ModeColor2,"Part3",Vector3.new(0.199999973, 0.799999833, 4.99999952))
Part3weld=weld(M1,Handle2,Part3,CFrame.new(0, 0, 0, -0.931082726, -0.359660119, -0.0610630736, 0.118210077, -0.139092848, -0.983198643, 0.345123857, -0.922657371, 0.172022387),CFrame.new(-0.00289154053, 0.226577759, -2.44792175, -0.0988399088, 0.141292334, 0.985026062, 0.628047764, -0.758960366, 0.171885014, 0.771877646, 0.635628104, -0.0137228817))
Part8=part(Enum.FormFactor.Custom,M1,Enum.Material.Neon,0,0,ModeColor2,"Part8",Vector3.new(0.199999988, 0.199999988, 4.99999952))
Part8weld=weld(M1,Handle2,Part8,CFrame.new(0, 0, 0, -0.931082726, -0.359660119, -0.0610630736, 0.118210077, -0.139092848, -0.983198643, 0.345123857, -0.922657371, 0.172022387),CFrame.new(-0.00289154053, -0.2734375, -2.44793701, -0.098837696, 0.141291857, 0.985021651, 0.628049672, -0.758953035, 0.171883389, 0.771870911, 0.635631084, -0.0137251355))
mesh("SpecialMesh",Part8,Enum.MeshType.Wedge,"",Vector3.new(0, 0, 0),Vector3.new(1, 1, 1))
Part9=part(Enum.FormFactor.Custom,M1,Enum.Material.Neon,0,0,ModeColor2,"Part9",Vector3.new(0.200000003, 0.799999952, 4.19999981))
Part9weld=weld(M1,Handle2,Part9,CFrame.new(0, 0, 0, -0.931082726, -0.359660119, -0.0610630736, 0.118210077, -0.139092848, -0.983198643, 0.345123857, -0.922657371, 0.172022387),CFrame.new(-0.00295257568, -1.61328125, -1.90859985, -0.0988361612, 0.141285598, 0.985031843, 0.484461337, -0.857816219, 0.171648264, 0.86921978, 0.494167566, 0.0163351614))


local particleemitter = Instance.new("ParticleEmitter", Part3)
particleemitter.Speed = NumberRange.new(0.30000001192093, 0.30000001192093)
particleemitter.Rotation = NumberRange.new(0, 360)
particleemitter.Color = ColorSequence.new(ModeColor.Color,ModeColor2.Color)
particleemitter.LightEmission = 1
particleemitter.Texture = "http://www.roblox.com/asset/?id=468084989"
particleemitter.Transparency = NumberSequence.new(0,1,1)
particleemitter.Size = NumberSequence.new(0,1.5,0)
particleemitter.EmissionDirection = Enum.NormalId.Back
particleemitter.Lifetime = NumberRange.new(5, 5)
particleemitter.LockedToPart = true
particleemitter.Rate = 50
local particleemitter = Instance.new("ParticleEmitter", Part9)
particleemitter.Speed = NumberRange.new(0.30000001192093, 0.30000001192093)
particleemitter.Rotation = NumberRange.new(0, 360)
particleemitter.Color = ColorSequence.new(ModeColor.Color,ModeColor2.Color)
particleemitter.LightEmission = 1
particleemitter.Texture = "http://www.roblox.com/asset/?id=468084989"
particleemitter.Transparency = NumberSequence.new(0,1,1)
particleemitter.Size = NumberSequence.new(0,1.5,0)
particleemitter.EmissionDirection = Enum.NormalId.Back
particleemitter.Lifetime = NumberRange.new(5, 5)
particleemitter.LockedToPart = true
particleemitter.Rate = 50
local particleemitter = Instance.new("ParticleEmitter", Part20)
particleemitter.Speed = NumberRange.new(0.30000001192093, 0.30000001192093)
particleemitter.Rotation = NumberRange.new(0, 360)
particleemitter.Color = ColorSequence.new(ModeColor.Color,ModeColor2.Color)
particleemitter.LightEmission = 1
particleemitter.Texture = "http://www.roblox.com/asset/?id=468084989"
particleemitter.Transparency = NumberSequence.new(0,1,1)
particleemitter.Size = NumberSequence.new(0,1.5,0)
particleemitter.EmissionDirection = Enum.NormalId.Back
particleemitter.Lifetime = NumberRange.new(5, 5)
particleemitter.LockedToPart = true
particleemitter.Rate = 50
--------------------------------------------------------------------------
local ModeOfDerpz = "Derpz?"
-- Functions are ready.
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
BIGBADNUMBER = 0
BIGBADNUMBER2 = 0
----------------------------------- Abilities



function stressintro()
	attack = true
	ModeOfDerpz = "Transforming"
	kan.SoundId = "rbxassetid://4641438921"
	BossChatFuncTop("Is this really what you want...?... PREPARE FOR YOU'RE DEMISE ","Code",BrickColor.new("Medium red").Color,Color3.new(0,0,0))
	MAINRUINCOLOR = BrickColor.new("Maroon")
	local keptcolor = MAINRUINCOLOR
	local locat = Instance.new("Part", char)
	locat.CanCollide = false
	locat.FormFactor = 3
	locat.Name = "Ring"
	locat.Material = "Neon"
	locat.Size = Vector3.new(1, 1, 1)
	locat.Transparency = 1
	locat.TopSurface = 0
	locat.BottomSurface = 0
	locat.Anchored = true
	locat.CFrame = root.CFrame*CFrame.new(0,-3,0)
	local poste = 0
	local rotation = 0
	local upperpos = 0
	local rate = 0
	local x = locat
	for i = 0, 24, 0.1 do
		swait()
		slash(math.random(50,100)/10,5,true,"Round","Add","Out",root.CFrame*CFrame.new(0,-3,0)*CFrame.Angles(math.rad(math.random(-5,5)),math.rad(math.random(-360,360)),math.rad(math.random(-5,5))),vt(0.01,0.01,0.01),math.random(5,50)/250,BrickColor.new("White"))
		sphereMK(1,-2,"Add",tors.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),2.5,2.5,15,-0.025,MAINRUINCOLOR,100)
		RH.C0=clerp(RH.C0,cf(1,-0.05,-0.75)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-2.5),math.rad(0),math.rad(-30)),.1)
		LH.C0=clerp(LH.C0,cf(-1,-0.5,-0.25)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-2.5),math.rad(0),math.rad(30)),.1)
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,1.5 + 0.1 * math.cos(sine / 28))*angles(math.rad(20 - 1 * math.cos(sine / 34)),math.rad(0),math.rad(0)),.1)
		Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(55),math.rad(0),math.rad(0)),.1)
		RW.C0=clerp(RW.C0,cf(0.75,0.5,-0.25)*angles(math.rad(140),math.rad(0),math.rad(-20 + 2.5 * math.cos(sine / 28))),.1)
		LW.C0=clerp(LW.C0,cf(-0.75,0.5,-0.25)*angles(math.rad(140),math.rad(0),math.rad(20 - 2.5 * math.cos(sine / 28))),.1)
	end
	coroutine.resume(coroutine.create(function()
		--CamShakeAll(25,30,char)
		sphere(5,"Add",root.CFrame,vt(0,0,0),2.5,MAINRUINCOLOR)
		CFuncs["Sound"].Create("rbxassetid://847061203", char, 0.5,1)
		wait(0.55)
		--CamShakeAll(25,60,char)
		sphere(5,"Add",root.CFrame,vt(0,0,0),7.5,MAINRUINCOLOR)
		sphere(5,"Add",root.CFrame,vt(0,0,0),5,MAINRUINCOLOR)
		sphere(5,"Add",root.CFrame,vt(0,0,0),2.5,MAINRUINCOLOR)
		CFuncs["Sound"].Create("rbxassetid://847061203", char, 1,1)
		wait(0.55)
		--CamShakeAll(25,90,char)
		sphere(5,"Add",root.CFrame,vt(0,0,0),12.5,MAINRUINCOLOR)
		sphere(5,"Add",root.CFrame,vt(0,0,0),10,MAINRUINCOLOR)
		sphere(5,"Add",root.CFrame,vt(0,0,0),7.5,MAINRUINCOLOR)
		sphere(5,"Add",root.CFrame,vt(0,0,0),5,MAINRUINCOLOR)
		sphere(5,"Add",root.CFrame,vt(0,0,0),2.5,MAINRUINCOLOR)
		CFuncs["Sound"].Create("rbxassetid://847061203", char, 2,1)
		wait(0.55)

		--CamShakeAll(60,120,char)
		CFuncs["Sound"].Create("rbxassetid://763717897", char, 4, 1)
		CFuncs["Sound"].Create("rbxassetid://1192402877", char, 2.5, 0.75)
		CFuncs["Sound"].Create("rbxassetid://1664711478", char, 4, 0.95)
		sphere2(1,"Add",x.CFrame*CFrame.new(0,0,0),vt(15,0,15),5,0,5,BrickColor.new("Really black"))
		sphere2(2,"Add",x.CFrame*CFrame.new(0,0,0),vt(15,0,15),5,0,5,keptcolor)
		sphere2(1,"Add",x.CFrame*CFrame.new(0,0,0),vt(5,50000,5),1.5,1,1.5,BrickColor.new("Maroon"))
		sphere2(2,"Add",x.CFrame*CFrame.new(0,0,0),vt(5,50000,5),1.5,1,1.5,BrickColor.new("Really black"))
		sphere2(4,"Add",x.CFrame*CFrame.new(0,0,0),vt(5,50000,5),1.5,1,1.5,keptcolor)
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
			attack = false
			hum.WalkSpeed = storehumanoidWS
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
				eff.Texture = "rbxassetid://2092248396"
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
	end))
	for i = 0, 12.5, 0.1 do
		swait()
		slash(math.random(50,100)/10,5,true,"Round","Add","Out",root.CFrame*CFrame.new(0,-3,0)*CFrame.Angles(math.rad(math.random(-5,5)),math.rad(math.random(-360,360)),math.rad(math.random(-5,5))),vt(0.01,0.01,0.01),math.random(5,50)/250,BrickColor.new("White"))
		sphereMK(1,-2,"Add",tors.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),2.5,2.5,15,-0.025,MAINRUINCOLOR,100)
		RH.C0=clerp(RH.C0,cf(1,-0.05,-0.75)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-2.5),math.rad(0),math.rad(-30)),.1)
		LH.C0=clerp(LH.C0,cf(-1,-0.5,-0.25)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-2.5),math.rad(0),math.rad(30)),.1)
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,1.5 + 0.1 * math.cos(sine / 28))*angles(math.rad(20 - 1 * math.cos(sine / 34)),math.rad(0),math.rad(0)),.1)
		Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(55),math.rad(0),math.rad(0)),.1)
		RW.C0=clerp(RW.C0,cf(0.75,0.5,-0.25)*angles(math.rad(140),math.rad(0),math.rad(-20 + 2.5 * math.cos(sine / 28))),.1)
		LW.C0=clerp(LW.C0,cf(-0.75,0.5,-0.25)*angles(math.rad(140),math.rad(0),math.rad(20 - 2.5 * math.cos(sine / 28))),.1)
		BossChatFuncTop("YOU'RE EXISTANCE IS A MISTAKE... YOU SCUM. ","Code",BrickColor.new("Medium red").Color,Color3.new(0,0,0))

		ModeOfDerpz = "STRESS"
		attack = false
	end
end
function ITSREALLYNOTOVER()
	attack = true
	ModeOfDerpz = "Transforming"
	Happy()
	RecolorTextAndRename("Gmod.",Color3.fromRGB(0,0,100),Color3.fromRGB(0,0,150),"Arcade","...")

	newTheme("rbxassetid://1180273873",0,1,5)
	kan.TimePosition = 135.500
	repeat swait() until kan.IsLoaded
	for i = 0, 16, 0.1 do
		swait()
		local Alpha = .3
		RootJoint.C0 = RootJoint.C0:lerp(cf(0,0.2,-0.2)*angles(math.rad(-20),math.rad(0),math.rad(0))*RootCF,Alpha)
		LH.C0 = LH.C0:lerp(cf(-1,-1.1,0)*angles(math.rad(20.4),math.rad(0),math.rad(0))*angles(math.rad(0),math.rad(-90),math.rad(0)),Alpha)
		RH.C0 = RH.C0:lerp(cf(1,-1.1,0)*angles(math.rad(20.4),math.rad(0),math.rad(0))*angles(math.rad(0),math.rad(90),math.rad(0)),Alpha)
		LW.C0 = LW.C0:lerp(cf(-1.1,0.5,0.2)*angles(math.rad(-45.4),math.rad(15.9),math.rad(35.9)),Alpha)
		RW.C0 = RW.C0:lerp(cf(1.1,0.3,0.5)*angles(math.rad(-55.1),math.rad(-15.7),math.rad(-45.5)),Alpha)
		Torso.Neck.C0 = Torso.Neck.C0:lerp(cf(0.1,0.1,0.3)*angles(math.rad(-22.5),math.rad(-2.7),math.rad(3))*necko,Alpha)
	end

	BossChatFuncTop("As I fell to the ocean floor...","SciFi",BrickColor.new("Navy blue").Color,Color3.new(0,0,0))
	wait(0.5)

	Neutral()
	for i = 0, 16, .1 do
		swait()
		local Alpha = .1
		RH.C0=clerp(RH.C0,cf(1,-1-.2*math.cos(sine/16),0)*angles(0,math.rad(90),0),.1)
		LH.C0=clerp(LH.C0,cf(-1,-1-.2*math.cos(sine/16),.05)*angles(0,math.rad(15),0)*angles(math.rad(0),math.rad(-90),math.rad(0)),.1)
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0+.2*math.cos(sine/16)),.1)  
		Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(25),0,0),.1)
		RW.C0=clerp(RW.C0,cf(1,0.5+.2*math.cos(sine/16),-.65)*angles(math.rad(45),0,math.rad(-90)),.1)
		LW.C0=clerp(LW.C0,cf(-1,0.5+.2*math.cos(sine/16),-.65)*angles(math.rad(-45),0,math.rad(100)),.1)
	end
	BossChatFuncTop("Fading light through an open door...","SciFi",BrickColor.new("Navy blue").Color,Color3.new(0,0,0))
	Neutral()

	for i = 0, 16, .1 do

		swait()
		local Alpha = .1
		RH.C0=clerp(RH.C0,cf(1,-1-.2*math.cos(sine/16),0)*angles(0,math.rad(90),0),.1)
		LH.C0=clerp(LH.C0,cf(-1,-1-.2*math.cos(sine/16),.05)*angles(0,math.rad(15),0)*angles(math.rad(0),math.rad(-90),math.rad(0)),.1)
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0+.2*math.cos(sine/16)),.1)  
		Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(25),0,0),.1)
		RW.C0=clerp(RW.C0,cf(1,0.5+.2*math.cos(sine/16),-.65)*angles(math.rad(45),0,math.rad(-90)),.1)
		LW.C0=clerp(LW.C0,cf(-1,0.5+.2*math.cos(sine/16),-.65)*angles(math.rad(-45),0,math.rad(100)),.1)
	end
	BossChatFuncTop("I saw myself rise with the water...","SciFi",BrickColor.new("Navy blue").Color,Color3.new(0,0,0))
	Happy()

	for i = 0, 20, .1 do

		swait()
		local Alpha = .1
		RH.C0=clerp(RH.C0,cf(1,-1-.2*math.cos(sine/16),0)*angles(0,math.rad(90),0),.1)
		LH.C0=clerp(LH.C0,cf(-1,-1-.2*math.cos(sine/16),.05)*angles(0,math.rad(15),0)*angles(math.rad(0),math.rad(-90),math.rad(0)),.1)
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0 + 0.05 * math.cos(sine / 28))*angles(math.rad(0 - 1 * math.cos(sine / 34)),math.rad(0),math.rad(0)),.1)  
		Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(25),0,0),.1)
		RW.C0=clerp(RW.C0,cf(1,0.5+.2*math.cos(sine/16),-.65)*angles(math.rad(45),0,math.rad(-90)),.1)
		LW.C0=clerp(LW.C0,cf(-1,0.5+.2*math.cos(sine/16),-.65)*angles(math.rad(-45),0,math.rad(100)),.1)
	end
	wait(0.1)
	BossChatFuncTop("They thought they could keep me down...","SciFi",BrickColor.new("Navy blue").Color,Color3.new(0,0,0))
	Upset()

	for i = 0, 16, .1 do
		swait()
		local Alpha = .3
		RH.C0=clerp(RH.C0,cf(1,-1-.2*math.cos(sine/16),0)*angles(0,math.rad(90),0),.1)
		LH.C0=clerp(LH.C0,cf(-1,-1-.2*math.cos(sine/16),.05)*angles(0,math.rad(15),0)*angles(math.rad(0),math.rad(-90),math.rad(0)),.1)
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0+.2*math.cos(sine/16)),.1)  
		Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(25),0,0),.1)
		RW.C0=clerp(RW.C0,cf(1,0.5+.2*math.cos(sine/16),-.65)*angles(math.rad(45),0,math.rad(-90)),.1)
		LW.C0=clerp(LW.C0,cf(-1,0.5+.2*math.cos(sine/16),-.65)*angles(math.rad(-45),0,math.rad(100)),.1)
	end
	BossChatFuncTop("Hold their breath and watch me drown...","SciFi",BrickColor.new("Navy blue").Color,Color3.new(0,0,0))
	Upset()

	for i = 0, 16, .1 do
		swait()
		local Alpha = .3

		RH.C0=clerp(RH.C0,cf(1,-1-.2*math.cos(sine/16),0)*angles(0,math.rad(90),0),.1)
		LH.C0=clerp(LH.C0,cf(-1,-1-.2*math.cos(sine/16),.05)*angles(0,math.rad(15),0)*angles(math.rad(0),math.rad(-90),math.rad(0)),.1)
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0+.2*math.cos(sine/16)),.1)  
		Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(25),0,0),.1)
		RW.C0=clerp(RW.C0,cf(1,0.5+.2*math.cos(sine/16),-.65)*angles(math.rad(45),0,math.rad(-90)),.1)
		LW.C0=clerp(LW.C0,cf(-1,0.5+.2*math.cos(sine/16),-.65)*angles(math.rad(-45),0,math.rad(100)),.1)
	end
	BossChatFuncTop("But all they did has pushed me higher...","SciFi",BrickColor.new("Really red").Color,Color3.new(0,0,0))
	Happy()

	for i = 0, 23, .1 do
		swait()
		local Alpha = .3
		RH.C0=clerp(RH.C0,cf(1,-.9 - 0.2 * math.cos(sine / 18),0)*angles(math.rad(0),math.rad(70.9234902394),math.rad(0))*angles(math.rad(-1 - 2 * math.cos(sine / 32)),math.rad(0),math.rad(20)),.1)
		LH.C0=clerp(LH.C0,cf(-1,-.9 - 0.2 * math.cos(sine / 18),0)*angles(math.rad(0),math.rad(-70.6353234),math.rad(0))*angles(math.rad(-1 - 2 * math.cos(sine / 32)),math.rad(0),math.rad(-20)),.1)
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,-0.1 + 0.2 * math.cos(sine / 18))*angles(math.rad(20),math.rad(0),math.rad(0)),.1)
		Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(-10 + 2.5 * math.cos(sine / 18)),math.rad(10),math.rad(0)),.1)
		RW.C0=clerp(RW.C0,cf(1.5, 0.5 + 0.05 * math.sin(sine / 20), 0) * angles(math.rad(180 - 4 * math.cos(sine / 32)), math.rad(5 - 4 * math.cos(sine / 32)), math.rad(25 - 4 * math.cos(sine / 32))), 0.1)
		LW.C0=clerp(LW.C0,cf(-1.5, 0.5 + 0.05 * math.sin(sine / 20), 0) * angles(math.rad(180 + 4 * math.cos(sine / 32)), math.rad(-5 + 4 * math.cos(sine / 32)), math.rad(-25 + 4 * math.cos(sine / 32))), 0.1)								
	end
	BossChatFuncTop("We don't care what they say;","SciFi",BrickColor.new("Navy blue").Color,Color3.new(0,0,0))
	wait(0.5)

	Neutral()
	for i = 0, 16, .1 do
		swait()
		local Alpha = .1
		RH.C0=clerp(RH.C0,cf(1,-1-.2*math.cos(sine/16),0)*angles(1,math.rad(94),0),.1)
		LH.C0=clerp(LH.C0,cf(-1,-1-.2*math.cos(sine/16),.05)*angles(0,math.rad(-18),0)*angles(math.rad(0),math.rad(-94),math.rad(0)),.1)
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0 + 0.05 * math.cos(sine / 25))*angles(math.rad(-tors.Velocity.Y/6),math.rad(0),math.rad(0)),.1)   
		Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(-25),0,0),.1)
		RW.C0=clerp(RW.C0,cf(1.45,0.5 + 0.1 * math.cos(sine / 25),0)*angles(math.rad(-5),math.rad(0),math.rad(25)),.1)
		LW.C0=clerp(LW.C0,cf(-1.45,0.5 + 0.1 * math.cos(sine / 25),0)*angles(math.rad(-5),math.rad(0),math.rad(-25)),.1)
	end
	BossChatFuncTop("We will be here all day..","SciFi",BrickColor.new("Navy blue").Color,Color3.new(0,0,0))
	Neutral()

	for i = 0, 16, .1 do

		swait()
		local Alpha = .1
		RH.C0=clerp(RH.C0,cf(1,-1-.2*math.cos(sine/16),0)*angles(0,math.rad(90),0),.1)
		LH.C0=clerp(LH.C0,cf(-1,-1-.2*math.cos(sine/16),.05)*angles(0,math.rad(15),0)*angles(math.rad(0),math.rad(-90),math.rad(0)),.1)
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0+.2*math.cos(sine/16)),.1)    
		Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(0,0,0),.1)
		RW.C0=clerp(RW.C0,cf(1.45,0.5 + 0.1 * math.cos(sine / 25),0)*angles(math.rad(15),math.rad(10),math.rad(25)),.1)
		LW.C0=clerp(LW.C0,cf(-1.45,0.5 + 0.1 * math.cos(sine / 25),0)*angles(math.rad(-15),math.rad(-6),math.rad(-25)),.1)
	end
	BossChatFuncTop("Weâll stay here 'till itâs over...","SciFi",BrickColor.new("Navy blue").Color,Color3.new(0,0,0))
	Happy()

	for i = 0, 20, .1 do

		swait()
		local Alpha = .1
		RootJoint.C0 = RootJoint.C0:lerp(cf(0,0.2,0)*angles(math.rad(1.8),math.rad(0),math.rad(0))*RootCF,Alpha)
		LH.C0 = LH.C0:lerp(cf(-1,-1,0.2)*angles(math.rad(-1.7),math.rad(19.2),math.rad(0))*angles(math.rad(0),math.rad(-90),math.rad(0)),Alpha)
		RH.C0 = RH.C0:lerp(cf(1,-1,0.1)*angles(math.rad(-1.7),math.rad(-11.7),math.rad(0))*angles(math.rad(0),math.rad(90),math.rad(0)),Alpha)
		LW.C0 = LW.C0:lerp(cf(-1.5,0.5,0.2)*angles(math.rad(-0.9),math.rad(14.4),math.rad(-0.5)),Alpha)
		RW.C0 = RW.C0:lerp(cf(1.4,0.5,0.2)*angles(math.rad(-3.6),math.rad(-13.7),math.rad(-1.3)),Alpha)
		Torso.Neck.C0 = Torso.Neck.C0:lerp(cf(0.1,0.1,0.4)*angles(math.rad(-20.4),math.rad(0.1),math.rad(1.2))*necko,Alpha)
	end
	wait(0.1)
	BossChatFuncTop("'Till the world's out of sight..","SciFi",BrickColor.new("Navy blue").Color,Color3.new(0,0,0))
	Upset()

	for i = 0, 16, .1 do
		swait()
		local Alpha = .3
		RH.C0=clerp(RH.C0,cf(1,-1-.2*math.cos(sine/16),0)*angles(0,math.rad(90),0),.1)
		LH.C0=clerp(LH.C0,cf(-1,-1-.2*math.cos(sine/16),.05)*angles(0,math.rad(15),0)*angles(math.rad(0),math.rad(-90),math.rad(0)),.1)
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0+.2*math.cos(sine/16)),.1)    
		Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(25),0,0),.1)
		RW.C0=clerp(RW.C0,cf(1,0.5+.2*math.cos(sine/16),-.65)*angles(math.rad(45),0,math.rad(-90)),.1)
		LW.C0=clerp(LW.C0,cf(-1,0.5+.2*math.cos(sine/16),-.65)*angles(math.rad(-45),0,math.rad(100)),.1)
	end
	BossChatFuncTop("We will stand; We will fight,","SciFi",BrickColor.new("Navy blue").Color,Color3.new(0,0,0))
	Upset()

	for i = 0, 16, .1 do
		swait()
		local Alpha = .3
		RH.C0=clerp(RH.C0,cf(1,-1-.2*math.cos(sine/16),0)*angles(0,math.rad(90),0),.1)
		LH.C0=clerp(LH.C0,cf(-1,-1-.2*math.cos(sine/16),.05)*angles(0,math.rad(15),0)*angles(math.rad(0),math.rad(-90),math.rad(0)),.1)
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0+.2*math.cos(sine/16)),.1)    
		Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(25),0,0),.1)
		RW.C0=clerp(RW.C0,cf(1,0.5+.2*math.cos(sine/16),-.65)*angles(math.rad(45),0,math.rad(-90)),.1)
		LW.C0=clerp(LW.C0,cf(-1,0.5+.2*math.cos(sine/16),-.65)*angles(math.rad(-45),0,math.rad(100)),.1)
	end
	BossChatFuncTop("It's not over 'till it's over...","SciFi",BrickColor.new("Navy blue").Color,Color3.new(0,0,0))
	Neutral()

	for i = 0, 20, .1 do
		swait()
		local Alpha = .3
		RH.C0=clerp(RH.C0,cf(1,-1-.2*math.cos(sine/16),0)*angles(0,math.rad(90),0),.1)
		LH.C0=clerp(LH.C0,cf(-1,-1-.2*math.cos(sine/16),.05)*angles(0,math.rad(15),0)*angles(math.rad(0),math.rad(-90),math.rad(0)),.1)
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0+.2*math.cos(sine/16)),.1)  
		Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(25),0,0),.1)
		RW.C0=clerp(RW.C0,cf(1,0.5+.2*math.cos(sine/16),-.65)*angles(math.rad(45),0,math.rad(-90)),.1)
		LW.C0=clerp(LW.C0,cf(-1,0.5+.2*math.cos(sine/16),-.65)*angles(math.rad(-45),0,math.rad(100)),.1)
	end
	BossChatFuncTop("Through the night and the rain...","SciFi",BrickColor.new("Navy blue").Color,Color3.new(0,0,0))
	wait(0.5)
	Neutral()
	for i = 0, 16, .1 do
		swait()
		local Alpha = .1
		RootJoint.C0 = RootJoint.C0:lerp(cf(0,0.2,0)*angles(math.rad(1.8),math.rad(0),math.rad(0))*RootCF,Alpha)
		LH.C0 = LH.C0:lerp(cf(-1,-1,0)*angles(math.rad(-1.7),math.rad(0),math.rad(0))*angles(math.rad(0),math.rad(-90),math.rad(0)),Alpha)
		RH.C0 = RH.C0:lerp(cf(1,-1,0)*angles(math.rad(-1.7),math.rad(0),math.rad(0))*angles(math.rad(0),math.rad(90),math.rad(0)),Alpha)
		LW.C0 = LW.C0:lerp(cf(-1.1,0.5,0.2)*angles(math.rad(-45.4),math.rad(15.9),math.rad(35.9)),Alpha)
		RW.C0 = RW.C0:lerp(cf(1.5,0.3,-0.1)*angles(math.rad(-71.2),math.rad(3.7),math.rad(93.1)),Alpha)
		Torso.Neck.C0 = Torso.Neck.C0:lerp(cf(-0.1,0,0.1)*angles(math.rad(-13.8),math.rad(-39.1),math.rad(-5.7))*necko,Alpha)
	end
	BossChatFuncTop("Through the time and the pain...","SciFi",BrickColor.new("Navy blue").Color,Color3.new(0,0,0))
	Neutral()

	for i = 0, 16, .1 do

		swait()
		local Alpha = .1
		RootJoint.C0 = RootJoint.C0:lerp(cf(0,0.2,0)*angles(math.rad(1.8),math.rad(0),math.rad(0))*RootCF,Alpha)
		LH.C0 = LH.C0:lerp(cf(-1,-1,0.2)*angles(math.rad(-1.7),math.rad(19.2),math.rad(0))*angles(math.rad(0),math.rad(-90),math.rad(0)),Alpha)
		RH.C0 = RH.C0:lerp(cf(1,-1,0)*angles(math.rad(-1.7),math.rad(0),math.rad(0))*angles(math.rad(0),math.rad(90),math.rad(0)),Alpha)
		LW.C0 = LW.C0:lerp(cf(-1.5,0.4,0)*angles(math.rad(12.7),math.rad(0),math.rad(-87)),Alpha)
		RW.C0 = RW.C0:lerp(cf(1.2,0.3,0.5)*angles(math.rad(-64),math.rad(-26.7),math.rad(-40.4)),Alpha)
		Torso.Neck.C0 = Torso.Neck.C0:lerp(cf(0.2,0,0.1)*angles(math.rad(-11.7),math.rad(25.7),math.rad(5.5))*necko,Alpha)
	end
	BossChatFuncTop("The sun will never fall...","SciFi",BrickColor.new("Navy blue").Color,Color3.new(0,0,0))
	Happy()

	for i = 0, 20, .1 do

		swait()
		local Alpha = .1
		RootJoint.C0 = RootJoint.C0:lerp(cf(0,0.2,0)*angles(math.rad(1.8),math.rad(0),math.rad(0))*RootCF,Alpha)
		LH.C0 = LH.C0:lerp(cf(-1,-1,0.2)*angles(math.rad(-1.7),math.rad(19.2),math.rad(0))*angles(math.rad(0),math.rad(-90),math.rad(0)),Alpha)
		RH.C0 = RH.C0:lerp(cf(1,-1,0.1)*angles(math.rad(-1.7),math.rad(-11.7),math.rad(0))*angles(math.rad(0),math.rad(90),math.rad(0)),Alpha)
		LW.C0 = LW.C0:lerp(cf(-1.5,0.5,0.2)*angles(math.rad(-0.9),math.rad(14.4),math.rad(-0.5)),Alpha)
		RW.C0 = RW.C0:lerp(cf(1.4,0.5,0.2)*angles(math.rad(-3.6),math.rad(-13.7),math.rad(-1.3)),Alpha)
		Torso.Neck.C0 = Torso.Neck.C0:lerp(cf(0.1,0.1,0.4)*angles(math.rad(-20.4),math.rad(0.1),math.rad(1.2))*necko,Alpha)
	end
	wait(0.1)
	BossChatFuncTop("And then at the end of it all...","SciFi",BrickColor.new("Navy blue").Color,Color3.new(0,0,0))
	Upset()

	for i = 0, 16, .1 do
		swait()
		local Alpha = .3
		RootJoint.C0 = RootJoint.C0:lerp(cf(0,0,0)*angles(math.rad(1.8),math.rad(0),math.rad(0))*RootCF,Alpha)
		LH.C0 = LH.C0:lerp(cf(-1,-0.9,0)*angles(math.rad(-11.2),math.rad(19.2),math.rad(0))*angles(math.rad(0),math.rad(-90),math.rad(0)),Alpha)
		RH.C0 = RH.C0:lerp(cf(0.9,-1,0.3)*angles(math.rad(-1.7),math.rad(-30.6),math.rad(0))*angles(math.rad(0),math.rad(90),math.rad(0)),Alpha)
		LW.C0 = LW.C0:lerp(cf(-1.5,0.3,0.2)*angles(math.rad(19.2),math.rad(-47.6),math.rad(-56)),Alpha)
		RW.C0 = RW.C0:lerp(cf(1.5,0.5,0.2)*angles(math.rad(95.5),math.rad(-15.8),math.rad(62.5)),Alpha)
		Torso.Neck.C0 = Torso.Neck.C0:lerp(cf(0.1,0,0.2)*angles(math.rad(-9.2),math.rad(0.1),math.rad(1.2))*necko,Alpha)
	end
	BossChatFuncTop("We will win, we will chant...","SciFi",BrickColor.new("Navy blue").Color,Color3.new(0,0,0))
	Upset()

	for i = 0, 16, .1 do
		swait()
		local Alpha = .3
		EffectBoi(e,"Really red",Head.CFrame*CFrame.new(.2,.2,-.5)*CFrame.Angles(-math.rad(90+math.random(-12,12)),math.rad(math.random(-12,12)),math.random(-120,120)),2,2,2,-.06,-.06,-.06,.03,"Sphere",7,2,"")

		RootJoint.C0 = RootJoint.C0:lerp(cf(0,0.8,0)*angles(math.rad(1.8),math.rad(0),math.rad(0))*RootCF,Alpha)
		LH.C0 = LH.C0:lerp(cf(-1,-0.9,0)*angles(math.rad(-11.2),math.rad(19.2),math.rad(0))*angles(math.rad(0),math.rad(-90),math.rad(0)),Alpha)
		RH.C0 = RH.C0:lerp(cf(0.9,-0.1,-0.1)*angles(math.rad(-1.7),math.rad(-30.6),math.rad(0))*angles(math.rad(0),math.rad(90),math.rad(0)),Alpha)
		LW.C0 = LW.C0:lerp(cf(-1.4,1.2,-0.1)*angles(math.rad(167.6),math.rad(-71.4),math.rad(1.5)),Alpha)
		RW.C0 = RW.C0:lerp(cf(1.4,0.6,0)*angles(math.rad(103.4),math.rad(-75.5),math.rad(109.8)),Alpha)
		Torso.Neck.C0 = Torso.Neck.C0:lerp(cf(0.1,0.2,-0.5)*angles(math.rad(26.7),math.rad(0.1),math.rad(1.2))*necko,Alpha)
	end
	BossChatFuncTop("IT'S NOT OVER 'TILL IT'S OVER!!!","Code",BrickColor.new("Really red").Color,Color3.new(0,0,0))
	Determined()
	Eye1.BrickColor = BrickColor.new("Really red")
	Eye2.BrickColor = BrickColor.new("Really red")
	for i = 0, 21, .1 do
		CameraEnshaking(0.2, 0.1)
		swait()
		BIGBADNUMBER = BIGBADNUMBER + 0.01
		BIGBADNUMBER2 = BIGBADNUMBER2 + 0.05
		local Alpha = .3
		sphere2(1,"Add",root.CFrame,vt(BIGBADNUMBER,BIGBADNUMBER,BIGBADNUMBER),BIGBADNUMBER,BIGBADNUMBER,BIGBADNUMBER,BrickColor.new("Really red"))
		sphere2(5,"Add",root.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(BIGBADNUMBER2,1,BIGBADNUMBER2),0,50,0,BrickColor.new("Deep blue"))

		RootJoint.C0 = RootJoint.C0:lerp(cf(0,0.8,0)*angles(math.rad(-15.7),math.rad(0),math.rad(0))*RootCF,Alpha)
		LH.C0 = LH.C0:lerp(cf(-1,-0.9,0)*angles(math.rad(-11.2),math.rad(19.2),math.rad(0))*angles(math.rad(0),math.rad(-90),math.rad(0)),Alpha)
		RH.C0 = RH.C0:lerp(cf(0.9,-0.1,-0.1)*angles(math.rad(-1.7),math.rad(-30.6),math.rad(0))*angles(math.rad(0),math.rad(90),math.rad(0)),Alpha)
		LW.C0 = LW.C0:lerp(cf(-0.8,0.6,-0.8)*angles(math.rad(167.5),math.rad(-33),math.rad(35)),Alpha)
		RW.C0 = RW.C0:lerp(cf(1,0.5,-0.7)*angles(math.rad(130.7),math.rad(-26.6),math.rad(-27.2)),Alpha)
		Torso.Neck.C0 = Torso.Neck.C0:lerp(cf(0.1,0.2,0.3)*angles(math.rad(-21),math.rad(0.1),math.rad(1.2))*necko,Alpha)
	end
	sphere(1,"Add",root.CFrame*CFrame.Angles(math.rad(math.random(-10,10)),math.rad(math.random(-10,10)),math.rad(math.random(-10,10))),vt(1,100000,1),0.6,BrickColor.new("Maroon"))
	sphere(1,"Add",root.CFrame,vt(BIGBADNUMBER,BIGBADNUMBER,BIGBADNUMBER),0.8,BrickColor.new("Really red"))
	for i = 0, 49 do
		CameraEnshaking(0.6, 0.5)
		PixelBlockX(1,math.random(1,20),"Add",root.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),BIGBADNUMBER,BIGBADNUMBER,BIGBADNUMBER,0.16,BrickColor.new("Maroon"),0)
		sphereMK(2.5,-1,"Add",root.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),2.5,2.5,25,-0.025,BrickColor.new("Really red"),0)
		slash(math.random(10,20)/10,5,true,"Round","Add","Out",Torso.CFrame*CFrame.new(0,-3,0)*CFrame.Angles(math.rad(math.random(-30, 30)), math.rad(math.random(-30, 30)), math.rad(math.random(-40, 40))),vt(BIGBADNUMBER,BIGBADNUMBER,BIGBADNUMBER),math.random(50,60)/250,BrickColor.new("Really red"))
	end
	CFuncs["Sound"].Create("rbxassetid://239000203", root, 4, 1)
	CFuncs["Sound"].Create("rbxassetid://1042716828", root, 2, 1)
	CFuncs["Sound"].Create("rbxassetid://847061203", root, 3, 1)
	attack = false
	attack = false
	ModeOfDerpz = "Determined2"
	storehumanoidWS = 100
	hum.WalkSpeed = 100
	rainbowmode = false
	chaosmode = false
	CORRUPTCHAOS = false
	RecolorTextAndRename("GREATLY DETERMINED KI!",Color3.new(0.5,0,0),BrickColor.new("Really red").Color,"Arcade","Tristam - Till It's Over")
	ModeColor = BrickColor.new("Really red")
	ModeColor2 = BrickColor.new("Really black")
	Shadow = true
	BIGBADNUMBER = 0
	BIGBADNUMBER2 = 0
end
function ITSNOTOVER()
	attack = true
	ModeOfDerpz = "Transforming"
	Happy()
	RecolorTextAndRename("Ki.",Color3.fromRGB(0,0,100),Color3.fromRGB(0,0,150),"Arcade")

	newThemeCust("rbxassetid://2755395143",0,1.02,5)
	kan.TimePosition = 47.5
	repeat swait() until kan.IsLoaded
	for i = 0, 47, 0.1 do
		swait()
		local Alpha = .3
		RootJoint.C0 = RootJoint.C0:lerp(cf(0,0.2,-0.2)*angles(math.rad(-20),math.rad(0),math.rad(0))*RootCF,Alpha)
		LH.C0 = LH.C0:lerp(cf(-1,-1.1,0)*angles(math.rad(20.4),math.rad(0),math.rad(0))*angles(math.rad(0),math.rad(-90),math.rad(0)),Alpha)
		RH.C0 = RH.C0:lerp(cf(1,-1.1,0)*angles(math.rad(20.4),math.rad(0),math.rad(0))*angles(math.rad(0),math.rad(90),math.rad(0)),Alpha)
		LW.C0 = LW.C0:lerp(cf(-1.1,0.5,0.2)*angles(math.rad(-45.4),math.rad(15.9),math.rad(35.9)),Alpha)
		RW.C0 = RW.C0:lerp(cf(1.1,0.3,0.5)*angles(math.rad(-55.1),math.rad(-15.7),math.rad(-45.5)),Alpha)
		Torso.Neck.C0 = Torso.Neck.C0:lerp(cf(0.1,0.1,0.3)*angles(math.rad(-22.5),math.rad(-2.7),math.rad(3))*necko,Alpha)
	end

	BossChatFuncTop("We don't care what they say;","SciFi",BrickColor.new("Navy blue").Color,Color3.new(0,0,0))
	wait(0.5)
	Neutral()
	for i = 0, 16, .1 do
		swait()
		local Alpha = .1
		RootJoint.C0 = RootJoint.C0:lerp(cf(0,0.2,0)*angles(math.rad(1.8),math.rad(0),math.rad(0))*RootCF,Alpha)
		LH.C0 = LH.C0:lerp(cf(-1,-1,0)*angles(math.rad(-1.7),math.rad(0),math.rad(0))*angles(math.rad(0),math.rad(-90),math.rad(0)),Alpha)
		RH.C0 = RH.C0:lerp(cf(1,-1,0)*angles(math.rad(-1.7),math.rad(0),math.rad(0))*angles(math.rad(0),math.rad(90),math.rad(0)),Alpha)
		LW.C0 = LW.C0:lerp(cf(-1.1,0.5,0.2)*angles(math.rad(-45.4),math.rad(15.9),math.rad(35.9)),Alpha)
		RW.C0 = RW.C0:lerp(cf(1.5,0.3,-0.1)*angles(math.rad(-71.2),math.rad(3.7),math.rad(93.1)),Alpha)
		Torso.Neck.C0 = Torso.Neck.C0:lerp(cf(-0.1,0,0.1)*angles(math.rad(-13.8),math.rad(-39.1),math.rad(-5.7))*necko,Alpha)
	end
	BossChatFuncTop("We will be here all day..","SciFi",BrickColor.new("Navy blue").Color,Color3.new(0,0,0))
	Neutral()
	for i = 0, 16, .1 do

		swait()
		local Alpha = .1
		RootJoint.C0 = RootJoint.C0:lerp(cf(0,0.2,0)*angles(math.rad(1.8),math.rad(0),math.rad(0))*RootCF,Alpha)
		LH.C0 = LH.C0:lerp(cf(-1,-1,0.2)*angles(math.rad(-1.7),math.rad(19.2),math.rad(0))*angles(math.rad(0),math.rad(-90),math.rad(0)),Alpha)
		RH.C0 = RH.C0:lerp(cf(1,-1,0)*angles(math.rad(-1.7),math.rad(0),math.rad(0))*angles(math.rad(0),math.rad(90),math.rad(0)),Alpha)
		LW.C0 = LW.C0:lerp(cf(-1.5,0.4,0)*angles(math.rad(12.7),math.rad(0),math.rad(-87)),Alpha)
		RW.C0 = RW.C0:lerp(cf(1.2,0.3,0.5)*angles(math.rad(-64),math.rad(-26.7),math.rad(-40.4)),Alpha)
		Torso.Neck.C0 = Torso.Neck.C0:lerp(cf(0.2,0,0.1)*angles(math.rad(-11.7),math.rad(25.7),math.rad(5.5))*necko,Alpha)
	end
	BossChatFuncTop("Weâll stay here 'till itâs over...","SciFi",BrickColor.new("Navy blue").Color,Color3.new(0,0,0))
	Happy()
	for i = 0, 20, .1 do

		swait()
		local Alpha = .1
		RootJoint.C0 = RootJoint.C0:lerp(cf(0,0.2,0)*angles(math.rad(1.8),math.rad(0),math.rad(0))*RootCF,Alpha)
		LH.C0 = LH.C0:lerp(cf(-1,-1,0.2)*angles(math.rad(-1.7),math.rad(19.2),math.rad(0))*angles(math.rad(0),math.rad(-90),math.rad(0)),Alpha)
		RH.C0 = RH.C0:lerp(cf(1,-1,0.1)*angles(math.rad(-1.7),math.rad(-11.7),math.rad(0))*angles(math.rad(0),math.rad(90),math.rad(0)),Alpha)
		LW.C0 = LW.C0:lerp(cf(-1.5,0.5,0.2)*angles(math.rad(-0.9),math.rad(14.4),math.rad(-0.5)),Alpha)
		RW.C0 = RW.C0:lerp(cf(1.4,0.5,0.2)*angles(math.rad(-3.6),math.rad(-13.7),math.rad(-1.3)),Alpha)
		Torso.Neck.C0 = Torso.Neck.C0:lerp(cf(0.1,0.1,0.4)*angles(math.rad(-20.4),math.rad(0.1),math.rad(1.2))*necko,Alpha)
	end
	wait(0.1)
	BossChatFuncTop("'Till the world's out of sight..","SciFi",BrickColor.new("Navy blue").Color,Color3.new(0,0,0))
	Upset()
	for i = 0, 16, .1 do
		swait()
		local Alpha = .3
		RootJoint.C0 = RootJoint.C0:lerp(cf(0,0,0)*angles(math.rad(1.8),math.rad(0),math.rad(0))*RootCF,Alpha)
		LH.C0 = LH.C0:lerp(cf(-1,-0.9,0)*angles(math.rad(-11.2),math.rad(19.2),math.rad(0))*angles(math.rad(0),math.rad(-90),math.rad(0)),Alpha)
		RH.C0 = RH.C0:lerp(cf(0.9,-1,0.3)*angles(math.rad(-1.7),math.rad(-30.6),math.rad(0))*angles(math.rad(0),math.rad(90),math.rad(0)),Alpha)
		LW.C0 = LW.C0:lerp(cf(-1.5,0.3,0.2)*angles(math.rad(19.2),math.rad(-47.6),math.rad(-56)),Alpha)
		RW.C0 = RW.C0:lerp(cf(1.5,0.5,0.2)*angles(math.rad(95.5),math.rad(-15.8),math.rad(62.5)),Alpha)
		Torso.Neck.C0 = Torso.Neck.C0:lerp(cf(0.1,0,0.2)*angles(math.rad(-9.2),math.rad(0.1),math.rad(1.2))*necko,Alpha)
	end
	BossChatFuncTop("We will stand; We will fight,","SciFi",BrickColor.new("Navy blue").Color,Color3.new(0,0,0))
	Upset()
	for i = 0, 16, .1 do
		swait()
		local Alpha = .3
		EffectBoi(e,"Really red",Head.CFrame*CFrame.new(.2,.2,-.5)*CFrame.Angles(-math.rad(90+math.random(-12,12)),math.rad(math.random(-12,12)),math.random(-120,120)),2,2,2,-.06,-.06,-.06,.03,"Sphere",7,2,"")

		RootJoint.C0 = RootJoint.C0:lerp(cf(0,0.8,0)*angles(math.rad(1.8),math.rad(0),math.rad(0))*RootCF,Alpha)
		LH.C0 = LH.C0:lerp(cf(-1,-0.9,0)*angles(math.rad(-11.2),math.rad(19.2),math.rad(0))*angles(math.rad(0),math.rad(-90),math.rad(0)),Alpha)
		RH.C0 = RH.C0:lerp(cf(0.9,-0.1,-0.1)*angles(math.rad(-1.7),math.rad(-30.6),math.rad(0))*angles(math.rad(0),math.rad(90),math.rad(0)),Alpha)
		LW.C0 = LW.C0:lerp(cf(-1.4,1.2,-0.1)*angles(math.rad(167.6),math.rad(-71.4),math.rad(1.5)),Alpha)
		RW.C0 = RW.C0:lerp(cf(1.4,0.6,0)*angles(math.rad(103.4),math.rad(-75.5),math.rad(109.8)),Alpha)
		Torso.Neck.C0 = Torso.Neck.C0:lerp(cf(0.1,0.2,-0.5)*angles(math.rad(26.7),math.rad(0.1),math.rad(1.2))*necko,Alpha)
	end
	BossChatFuncTop("IT'S NOT OVER TILL IT'S OVER...","Code",BrickColor.new("Really red").Color,Color3.new(0,0,0))
	Determined()
	Eye1.BrickColor = BrickColor.new("Really red")
	Eye2.BrickColor = BrickColor.new("Really red")
	for i = 0, 21, .1 do
		CameraEnshaking(0.2, 0.1)
		swait()
		BIGBADNUMBER = BIGBADNUMBER + 0.01
		BIGBADNUMBER2 = BIGBADNUMBER2 + 0.05
		local Alpha = .3
		sphere2(1,"Add",root.CFrame,vt(BIGBADNUMBER,BIGBADNUMBER,BIGBADNUMBER),BIGBADNUMBER,BIGBADNUMBER,BIGBADNUMBER,BrickColor.new("Really red"))
		sphere2(5,"Add",root.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(BIGBADNUMBER2,1,BIGBADNUMBER2),0,50,0,BrickColor.new("Deep blue"))

		RootJoint.C0 = RootJoint.C0:lerp(cf(0,0.8,0)*angles(math.rad(-15.7),math.rad(0),math.rad(0))*RootCF,Alpha)
		LH.C0 = LH.C0:lerp(cf(-1,-0.9,0)*angles(math.rad(-11.2),math.rad(19.2),math.rad(0))*angles(math.rad(0),math.rad(-90),math.rad(0)),Alpha)
		RH.C0 = RH.C0:lerp(cf(0.9,-0.1,-0.1)*angles(math.rad(-1.7),math.rad(-30.6),math.rad(0))*angles(math.rad(0),math.rad(90),math.rad(0)),Alpha)
		LW.C0 = LW.C0:lerp(cf(-0.8,0.6,-0.8)*angles(math.rad(167.5),math.rad(-33),math.rad(35)),Alpha)
		RW.C0 = RW.C0:lerp(cf(1,0.5,-0.7)*angles(math.rad(130.7),math.rad(-26.6),math.rad(-27.2)),Alpha)
		Torso.Neck.C0 = Torso.Neck.C0:lerp(cf(0.1,0.2,0.3)*angles(math.rad(-21),math.rad(0.1),math.rad(1.2))*necko,Alpha)
	end
	sphere(1,"Add",root.CFrame*CFrame.Angles(math.rad(math.random(-10,10)),math.rad(math.random(-10,10)),math.rad(math.random(-10,10))),vt(1,100000,1),0.6,BrickColor.new("Maroon"))
	sphere(1,"Add",root.CFrame,vt(BIGBADNUMBER,BIGBADNUMBER,BIGBADNUMBER),0.8,BrickColor.new("Really red"))
	for i = 0, 49 do
		CameraEnshaking(0.6, 0.5)
		PixelBlockX(1,math.random(1,20),"Add",root.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),BIGBADNUMBER,BIGBADNUMBER,BIGBADNUMBER,0.16,BrickColor.new("Maroon"),0)
		sphereMK(2.5,-1,"Add",root.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),2.5,2.5,25,-0.025,BrickColor.new("Really red"),0)
		slash(math.random(10,20)/10,5,true,"Round","Add","Out",Torso.CFrame*CFrame.new(0,-3,0)*CFrame.Angles(math.rad(math.random(-30, 30)), math.rad(math.random(-30, 30)), math.rad(math.random(-40, 40))),vt(BIGBADNUMBER,BIGBADNUMBER,BIGBADNUMBER),math.random(50,60)/250,BrickColor.new("Really red"))
	end
	CFuncs["Sound"].Create("rbxassetid://239000203", root, 4, 1)
	CFuncs["Sound"].Create("rbxassetid://1042716828", root, 2, 1)
	CFuncs["Sound"].Create("rbxassetid://847061203", root, 3, 1)
	attack = false
	ModeOfDerpz = "DETERMINED"
	storehumanoidWS = 100
	hum.WalkSpeed = 100
	rainbowmode = false
	chaosmode = false
	Shadow = true
	RecolorTextAndRename("DETERMINED KI!",Color3.new(0.5,0,0),BrickColor.new("Really red").Color,"Arcade","Tristam - Till It's Over")
	ModeColor = BrickColor.new("Really red")
	ModeColor2 = BrickColor.new("Really red")
	BIGBADNUMBER = 0
	BIGBADNUMBER2 = 0
end
ENRAGE = false
function ENRAAAAGE()
	attack = true
	ModeOfDerpz = "Transforming"
	Happy()
	RecolorTextAndRename("Ki",Color3.fromRGB(75,0,130),Color3.fromRGB(255,165,0),"Arcade")
	for i = 0, 2, .1 do
		swait()
		RH.C0=clerp(RH.C0,cf(1,-1 - 0.05 * math.cos(sine / 28),0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-2.5),math.rad(0),math.rad(0 + 1 * math.cos(sine / 34))),.5)
		LH.C0=clerp(LH.C0,cf(-1,-1 - 0.05 * math.cos(sine / 28),0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-2.5),math.rad(0),math.rad(0 + 1 * math.cos(sine / 34))),.5)
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0 + 0.05 * math.cos(sine / 28))*angles(math.rad(0 - 1 * math.cos(sine / 34)),math.rad(0),math.rad(0)),.5)
		Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(20 - 2.5 * math.cos(sine / 28)),math.rad(0),math.rad(0)),.5)
		RW.C0=clerp(RW.C0,cf(1.5,0.5 + 0.1 * math.cos(sine / 70),0)*angles(math.rad(0 + 1 * math.cos(sine / 0.0001) ),math.rad(0),math.rad(0 + 1 * math.cos(sine / 0.0001))),.5)
		LW.C0=clerp(LW.C0,cf(-1.5,0.5 + 0.1 * math.cos(sine / 28),0)*angles(math.rad(0),math.rad(0),math.rad(0)),.5)
	end
	ENRAGE = false
	newThemeCust("rbxassetid://425521107",0,1,5)
	kan.TimePosition = 0
	repeat swait() until kan.IsLoaded
	wait(2)
	bosschatfunc(".....",ModeColor.Color,1)
	Neutral()
	for i = 0, 40, .1 do
		swait()
		RH.C0=clerp(RH.C0,cf(1,-1 - 0.05 * math.cos(sine / 28),0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-2.5),math.rad(0),math.rad(0 + 1 * math.cos(sine / 34))),.1)
		LH.C0=clerp(LH.C0,cf(-1,-1 - 0.05 * math.cos(sine / 28),0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-2.5),math.rad(0),math.rad(0 + 1 * math.cos(sine / 34))),.1)
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0 + 0.05 * math.cos(sine / 28))*angles(math.rad(0 - 1 * math.cos(sine / 34)),math.rad(0),math.rad(0)),.1)
		Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(20 - 2.5 * math.cos(sine / 28)),math.rad(0),math.rad(0)),.1)
		RW.C0=clerp(RW.C0,cf(1.5,0.5 + 0.1 * math.cos(sine / 70),0)*angles(math.rad(0 + 1 * math.cos(sine / 0.0001) ),math.rad(0),math.rad(0 + 1 * math.cos(sine / 0.0001))),.1)
		LW.C0=clerp(LW.C0,cf(-1.5,0.5 + 0.1 * math.cos(sine / 28),0)*angles(math.rad(0),math.rad(0),math.rad(0)),.1)
	end
	for i = 0, 30, .1 do
		swait()
		RH.C0=clerp(RH.C0,cf(1,-1 - 0.05 * math.cos(sine / 28),0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-2.5),math.rad(0),math.rad(0 + 1 * math.cos(sine / 34))),.1)
		LH.C0=clerp(LH.C0,cf(-1,-1 - 0.05 * math.cos(sine / 28),0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-2.5),math.rad(0),math.rad(0 + 1 * math.cos(sine / 34))),.1)
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0 + 0.05 * math.cos(sine / 28))*angles(math.rad(0 - 1 * math.cos(sine / 34)),math.rad(0),math.rad(0)),.1)
		Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(30 - 2.5 * math.cos(sine / 28)+ math.random(-2,2)),math.rad(0 + math.random(-2,2)),math.rad(0 + math.random(-2,2))),.1)
		RW.C0=clerp(RW.C0,cf(1.5,0.5 + 0.1 * math.cos(sine / 70),0)*angles(math.rad(0 + 1 * math.cos(sine / 0.0001) ),math.rad(0),math.rad(0 + 1 * math.cos(sine / 0.0001))),.1)
		LW.C0=clerp(LW.C0,cf(-1.5,0.5 + 0.1 * math.cos(sine / 28),0)*angles(math.rad(0),math.rad(0),math.rad(0)),.1)
	end
	Upset()
	bosschatfunc("No..",ModeColor2.Color,1)
	for i = 0, 10, .1 do
		swait()
		RH.C0=clerp(RH.C0,cf(1,-1 - 0.05 * math.cos(sine / 28),0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-2.5),math.rad(0),math.rad(0 + 1 * math.cos(sine / 34))),.1)
		LH.C0=clerp(LH.C0,cf(-1,-1 - 0.05 * math.cos(sine / 28),0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-2.5),math.rad(0),math.rad(0 + 1 * math.cos(sine / 34))),.1)
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0 + 0.05 * math.cos(sine / 28))*angles(math.rad(0 - 1 * math.cos(sine / 34)),math.rad(0),math.rad(0)),.1)
		Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(5 - 2.5 * math.cos(sine / 28)+ math.random(-2,2)),math.rad(0 + math.random(-2,2)),math.rad(0 + math.random(-2,2))),.1)
		RW.C0=clerp(RW.C0,cf(1.5,0.5 + 0.1 * math.cos(sine / 70),0)*angles(math.rad(0 + 1 * math.cos(sine / 0.0001) ),math.rad(0),math.rad(0 + 1 * math.cos(sine / 0.0001))),.1)
		LW.C0=clerp(LW.C0,cf(-1.5,0.5 + 0.1 * math.cos(sine / 28),0)*angles(math.rad(0),math.rad(0),math.rad(0)),.1)
	end
	bosschatfunc("I.. Will not take anymore of this....",ModeColor2.Color,1)
	for i = 0, 25, .1 do
		swait()
		RH.C0=clerp(RH.C0,cf(1,-1 - 0.05 * math.cos(sine / 28),0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-2.5),math.rad(0),math.rad(0 + 1 * math.cos(sine / 34))),.1)
		LH.C0=clerp(LH.C0,cf(-1,-1 - 0.05 * math.cos(sine / 28),0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-2.5),math.rad(0),math.rad(0 + 1 * math.cos(sine / 34))),.1)
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0 + 0.05 * math.cos(sine / 28))*angles(math.rad(0 - 1 * math.cos(sine / 34)),math.rad(0),math.rad(0)),.1)
		Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(5 - 2.5 * math.cos(sine / 28)+ math.random(-2,2)),math.rad(-20 + math.random(-2,2)),math.rad(0 + math.random(-2,2))),.1)
		RW.C0=clerp(RW.C0,cf(1.5,0.5 + 0.1 * math.cos(sine / 70),0)*angles(math.rad(0 + 1 * math.cos(sine / 0.0001) ),math.rad(0),math.rad(0 + 1 * math.cos(sine / 0.0001))),.1)
		LW.C0=clerp(LW.C0,cf(-1.5,0.5 + 0.1 * math.cos(sine / 28),0)*angles(math.rad(0),math.rad(0),math.rad(0)),.1)
	end
	bosschatfunc("I will not let you live...",ModeColor2.Color,1)
	for i = 0, 25, .1 do
		swait()
		RH.C0=clerp(RH.C0,cf(1,-1 - 0.05 * math.cos(sine / 28),0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-2.5),math.rad(0),math.rad(0 + 1 * math.cos(sine / 34))),.1)
		LH.C0=clerp(LH.C0,cf(-1,-1 - 0.05 * math.cos(sine / 28),0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-2.5),math.rad(0),math.rad(0 + 1 * math.cos(sine / 34))),.1)
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0 + 0.05 * math.cos(sine / 28))*angles(math.rad(0 - 1 * math.cos(sine / 34)),math.rad(0),math.rad(0)),.1)
		Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(10 - 2.5 * math.cos(sine / 28)+ math.random(-2,2)),math.rad(20 + math.random(-2,2)),math.rad(0 + math.random(-2,2))),.1)
		RW.C0=clerp(RW.C0,cf(1.5,0.5 + 0.1 * math.cos(sine / 70),0)*angles(math.rad(0 + 1 * math.cos(sine / 0.0001) ),math.rad(0),math.rad(0 + 1 * math.cos(sine / 0.0001))),.1)
		LW.C0=clerp(LW.C0,cf(-1.5,0.5 + 0.1 * math.cos(sine / 28),0)*angles(math.rad(0),math.rad(0),math.rad(0)),.1)
	end
	bosschatfunc("You wouldnt back Down....",ModeColor2.Color,1)
	for i = 0, 35, .1 do
		swait()
		RH.C0=clerp(RH.C0,cf(1,-1 - 0.05 * math.cos(sine / 28),0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-2.5),math.rad(0),math.rad(0 + 1 * math.cos(sine / 34))),.1)
		LH.C0=clerp(LH.C0,cf(-1,-1 - 0.05 * math.cos(sine / 28),0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-2.5),math.rad(0),math.rad(0 + 1 * math.cos(sine / 34))),.1)
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0 + 0.05 * math.cos(sine / 28))*angles(math.rad(0 - 1 * math.cos(sine / 34)),math.rad(0),math.rad(0)),.1)
		Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(25 - 2.5 * math.cos(sine / 28)+ math.random(-2,2)),math.rad(0 + math.random(-2,2)),math.rad(0 + math.random(-2,2))),.1)
		RW.C0=clerp(RW.C0,cf(0.9,0.5 + 0.1 * math.cos(sine / 28),-0.8)*angles(math.rad(-80),math.rad(0),math.rad(-80)),.1)
		LW.C0=clerp(LW.C0,cf(-0.9,0.5 + 0.1 * math.cos(sine / 40),-0.9)*angles(math.rad(100),math.rad(10),math.rad(70)),.1)
	end
	bosschatfunc("AND NOW ITS YOUR TURN TO DIE!",ModeColor2.Color,1)
	for i = 0, 10, .1 do
		swait()
		RH.C0=clerp(RH.C0,cf(1,-1 - 0.05 * math.cos(sine / 28),0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-2.5),math.rad(0),math.rad(0 + 1 * math.cos(sine / 34))),.1)
		LH.C0=clerp(LH.C0,cf(-1,-1 - 0.05 * math.cos(sine / 28),0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-2.5),math.rad(0),math.rad(0 + 1 * math.cos(sine / 34))),.1)
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0 + 0.05 * math.cos(sine / 28))*angles(math.rad(0 - 1 * math.cos(sine / 34)),math.rad(0),math.rad(0)),.1)
		Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(0 - 2.5 * math.cos(sine / 28)+ math.random(-2,2)),math.rad(0 + math.random(-2,2)),math.rad(0 + math.random(-2,2))),.1)
		RW.C0=clerp(RW.C0,cf(0.9,0.5 + 0.1 * math.cos(sine / 28),-0.8)*angles(math.rad(-80),math.rad(0),math.rad(-80)),.1)
		LW.C0=clerp(LW.C0,cf(-1.5,0.5 + 0.1 * math.cos(sine / 40),0)*angles(math.rad(100),math.rad(10),math.rad(0)),.1)
	end
	attack = false
	ModeOfDerpz = "ENRAGED"
	Upset()
	storehumanoidWS = 20
	hum.WalkSpeed = 20
	RecolorTextAndRename("MURDEROUS KI!",Color3.fromRGB(150,0,0),Color3.fromRGB(0,0,100),"Antique") --This breaks Character so hard lol
	chaosmode = false
	rainbowmode = false
	ENRAGE = true
	ModeColor = BrickColor.new("Really red")
	ModeColor2 = BrickColor.new("Really red")
end
function attackone()
	attack = true
	for x = 0, 1 do
		for i = 0,1,0.5 do
			swait()
			RH.C0=clerp(RH.C0,cf(1,-1 - 0.05 * math.cos(sine / 28),0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(6),math.rad(0),math.rad(-10 + 1 * math.cos(sine / 34))),.3)
			LH.C0=clerp(LH.C0,cf(-1,-1 - 0.05 * math.cos(sine / 28),0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(3),math.rad(0),math.rad(0 + 1 * math.cos(sine / 34))),.3)
			RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(90)),.3)
			Torso.Neck.C0=clerp(Torso.Neck.C0,necko*cf(0,0,0)*angles(math.rad(10),math.rad(15),math.rad(0)),.3)
			RW.C0=clerp(RW.C0,cf(1.5,0.5 + 0.1 * math.cos(sine / 30),0)*angles(math.rad(90),math.rad(0),math.rad(90)),.3)
			LW.C0=clerp(LW.C0,cf(-0.85,0.5 + 0.1 * math.cos(sine / 28),-0.65)*angles(math.rad(40),math.rad(0),math.rad(100)),.3)
		end
		for i = 0,1,0.5 do
			swait()
			RH.C0=clerp(RH.C0,cf(1,-1 - 0.05 * math.cos(sine / 28),0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(6),math.rad(0),math.rad(-10 + 1 * math.cos(sine / 34))),.3)
			LH.C0=clerp(LH.C0,cf(-1,-1 - 0.05 * math.cos(sine / 28),0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(3),math.rad(0),math.rad(0 + 1 * math.cos(sine / 34))),.3)
			RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(180)),.3)
			Torso.Neck.C0=clerp(Torso.Neck.C0,necko*cf(0,0,0)*angles(math.rad(10),math.rad(15),math.rad(0)),.3)
			RW.C0=clerp(RW.C0,cf(1.5,0.5 + 0.1 * math.cos(sine / 30),0)*angles(math.rad(90),math.rad(0),math.rad(90)),.3)
			LW.C0=clerp(LW.C0,cf(-0.85,0.5 + 0.1 * math.cos(sine / 28),-0.65)*angles(math.rad(40),math.rad(0),math.rad(100)),.3)
		end
		for i = 0,1,0.5 do
			swait()
			RH.C0=clerp(RH.C0,cf(1,-1 - 0.05 * math.cos(sine / 28),0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(6),math.rad(0),math.rad(-10 + 1 * math.cos(sine / 34))),.3)
			LH.C0=clerp(LH.C0,cf(-1,-1 - 0.05 * math.cos(sine / 28),0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(3),math.rad(0),math.rad(0 + 1 * math.cos(sine / 34))),.3)
			RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(270)),.3)
			Torso.Neck.C0=clerp(Torso.Neck.C0,necko*cf(0,0,0)*angles(math.rad(10),math.rad(15),math.rad(0)),.3)
			RW.C0=clerp(RW.C0,cf(1.5,0.5 + 0.1 * math.cos(sine / 30),0)*angles(math.rad(90),math.rad(0),math.rad(90)),.3)
			LW.C0=clerp(LW.C0,cf(-0.85,0.5 + 0.1 * math.cos(sine / 28),-0.65)*angles(math.rad(40),math.rad(0),math.rad(100)),.3)
		end
		for i = 0,1,0.5 do
			swait()
			RH.C0=clerp(RH.C0,cf(1,-1 - 0.05 * math.cos(sine / 28),0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(6),math.rad(0),math.rad(-10 + 1 * math.cos(sine / 34))),.3)
			LH.C0=clerp(LH.C0,cf(-1,-1 - 0.05 * math.cos(sine / 28),0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(3),math.rad(0),math.rad(0 + 1 * math.cos(sine / 34))),.3)
			RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.3)
			Torso.Neck.C0=clerp(Torso.Neck.C0,necko*cf(0,0,0)*angles(math.rad(10),math.rad(15),math.rad(0)),.3)
			RW.C0=clerp(RW.C0,cf(1.5,0.5 + 0.1 * math.cos(sine / 30),0)*angles(math.rad(90),math.rad(0),math.rad(90)),.3)
			LW.C0=clerp(LW.C0,cf(-0.85,0.5 + 0.1 * math.cos(sine / 28),-0.65)*angles(math.rad(40),math.rad(0),math.rad(100)),.8)
		end
	end
	CFuncs["Sound"].Create("rbxassetid://153092213", Head, 2.5,1)

	local hitb = CreateParta(m,1,1,"SmoothPlastic",BrickColor.Random())
	hitb.Anchored = true
	hitb.CFrame = root.CFrame + root.CFrame.lookVector*4
	MagniDamage(hitb, 4, 10,50, 0, "Knockdown",153092213)
	shakes(0.1,0.1)
	hitb:Destroy()
	for i = 0,1,0.1 do
		swait()
		sphere2(8,"Add",rarm.CFrame*CFrame.new(0,-1,0)*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(1,1,1),-0.01,0.01,-0.01,ModeColor2,Color3.new(0,1,0))
		RootJoint.C0 = clerp(RootJoint.C0,RootCF*cf(0,0,0)* angles(math.rad(-5),math.rad(0),math.rad(70)),0.4)
		Torso.Neck.C0 = clerp(Torso.Neck.C0,necko *angles(math.rad(20),math.rad(0),math.rad(-70)),.4)
		RW.C0 = clerp(RW.C0, CFrame.new(1.45, 0.5, 0) * angles(math.rad(90), math.rad(0), math.rad(70)), 0.4)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.45, 0.5, 0) * angles(math.rad(90), math.rad(0), math.rad(40)), 0.4)
		RH.C0=clerp(RH.C0,cf(1.3,-1 - 0.05 * math.cos(sine / 25),-0.75)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-10),math.rad(0),math.rad(-50)),.4)
		LH.C0=clerp(LH.C0,cf(-1,-1 - 0.05 * math.cos(sine / 25),0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-5),math.rad(0),math.rad(-10)),.4)
	end
	attack = false
end
function attacktwo()
	attack = true
	for i = 0,5,0.5 do
		swait()
		sphere2(8,"Add",larm.CFrame*CFrame.new(0,-1,0)*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(1,1,1),-0.01,0.01,-0.01,ModeColor,Color3.new(0,1,0))
		RH.C0=clerp(RH.C0,cf(1,-1 - 0.05 * math.cos(sine / 28),0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(6),math.rad(0),math.rad(-10 + 1 * math.cos(sine / 34))),.3)
		LH.C0=clerp(LH.C0,cf(-1,-1 - 0.05 * math.cos(sine / 28),0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(60),math.rad(0),math.rad(0 + 1 * math.cos(sine / 34))),.3)
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(-30)),.3)
		Torso.Neck.C0=clerp(Torso.Neck.C0,necko*cf(0,0,0)*angles(math.rad(10),math.rad(15),math.rad(0)),.3)
		RW.C0=clerp(RW.C0,cf(1.5,0.5 + 0.1 * math.cos(sine / 30),0)*angles(math.rad(40),math.rad(0),math.rad(-100)),.3)
		LW.C0=clerp(LW.C0,cf(-0.85,0.5 + 0.1 * math.cos(sine / 28),-0.65)*angles(math.rad(90),math.rad(0),math.rad(90)),.3)
	end
	CFuncs["Sound"].Create("rbxassetid://153092213", Head, 2.5,1)

	local hitb = CreateParta(m,1,1,"SmoothPlastic",BrickColor.Random())
	hitb.Anchored = true
	hitb.CFrame = root.CFrame + root.CFrame.lookVector*4
	MagniDamage(hitb, 4, 10,50, 0, "Knockdown",153092213)
	shakes(0.1,0.1)
	hitb:Destroy()
	for i = 0,1,0.1 do
		swait()
		sphere2(8,"Add",larm.CFrame*CFrame.new(0,-1,0)*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(1,1,1),-0.01,0.01,-0.01,ModeColor,Color3.new(0,1,0))
		RootJoint.C0 = clerp(RootJoint.C0,RootCF*cf(0,0,0)* angles(math.rad(-5),math.rad(0),math.rad(-40)),0.4)
		Torso.Neck.C0 = clerp(Torso.Neck.C0,necko *angles(math.rad(0),math.rad(40),math.rad(40)),.4)
		RW.C0 = clerp(RW.C0, CFrame.new(1.45, 0.5, 0) * angles(math.rad(90), math.rad(0), math.rad(-70)), 0.4)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.45, 0.5, 0) * angles(math.rad(90), math.rad(0), math.rad(-40)), 0.4)
		RH.C0=clerp(RH.C0,cf(1.3,-1 - 0.05 * math.cos(sine / 25),-0.75)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-10),math.rad(0),math.rad(-50)),.4)
		LH.C0=clerp(LH.C0,cf(-1,-1 - 0.05 * math.cos(sine / 25),0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-60),math.rad(0),math.rad(-10)),.4)
	end
	attack = false
end
function attackthree()
	attack = true
	for i = 0, 2, 0.1 do
		swait()
		slash(math.random(25,50)/10,5,true,"Round","Add","Out",rarm.CFrame*CFrame.new(0,-6,0)*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(0.1,0.01,0.1),-0.1,BrickColor.new("Really black"))

		RH.C0=clerp(RH.C0,cf(1,-0.15,-0.5)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-3),math.rad(-15),math.rad(-20)),.1)
		LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-3),math.rad(1),math.rad(20)),.1)
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0.25,-0.05)*angles(math.rad(-20),math.rad(0),math.rad(30)),.1)
		Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(20),math.rad(0),math.rad(-30)),.1)
		RW.C0=clerp(RW.C0,cf(1.05,1.30,0)*angles(math.rad(190),math.rad(0),math.rad(-30)),.6)
		LW.C0=clerp(LW.C0,cf(-1.05,1.30,0)*angles(math.rad(190),math.rad(0),math.rad(30)),.6)
	end
	CFuncs["Sound"].Create("rbxassetid://1208650519", root, 1, 1)
	CameraEnshaking(0.1,1)
	for i, v in pairs(FindNearestHead(Torso.CFrame.p, 18.5)) do
		if v:FindFirstChild('Head') then
			dmg(v)
		end
	end
	sphere(5,"Add",root.CFrame*CFrame.new(0,-2.9,0),vt(0,0,0),1,ModeColor)
	sphere(10,"Add",root.CFrame*CFrame.new(0,-2.9,0),vt(0,0,0),2,ModeColor2)
	sphere(1,"Add",root.CFrame*CFrame.new(0,-2.9,0),vt(30,0.1,30),0.01,ModeColor)
	for i = 0, 2, 0.1 do
		swait()
		slash(math.random(25,50)/10,5,true,"Round","Add","Out",tors.CFrame*CFrame.new(0,-6,0)*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(0.1,0.01,0.1),-0.1,BrickColor.new("Really black"))
		sphereMK(2.5,0.75,"Add",root.CFrame*CFrame.new(math.random(-52.5,52.5),-5,math.random(-52.5,52.5))*CFrame.Angles(math.rad(90 + math.rad(math.random(-45,45))),math.rad(math.random(-45,45)),math.rad(math.random(-45,45))),2.5,2.5,25,-0.025,ModeColor,0)
		sphereMK(2.5,0.75,"Add",root.CFrame*CFrame.new(math.random(-52.5,52.5),-5,math.random(-52.5,52.5))*CFrame.Angles(math.rad(90 + math.rad(math.random(-45,45))),math.rad(math.random(-45,45)),math.rad(math.random(-45,45))),2.5,2.5,25,-0.025,ModeColor2,0)
		RH.C0=clerp(RH.C0,cf(1,-1,-0.5)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(0),math.rad(0),math.rad(10)),.4)
		LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(0),math.rad(0),math.rad(10)),.4)
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0)*angles(math.rad(10),math.rad(0),math.rad(0)),.4)
		Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(40),math.rad(0),math.rad(0)),.4)
		RW.C0=clerp(RW.C0,cf(1.5,0.5,0)*angles(math.rad(-50),math.rad(0),math.rad(30)),.4)
		LW.C0=clerp(LW.C0,cf(-1.5,0.5,0)*angles(math.rad(-50),math.rad(0),math.rad(-30)),.4)
	end
	attack = false
end

function RemindedOfIRLBully()
	attack = true
	bosschatfunc("...You really remind me of someone.",ModeColor.Color,4)
	for i = 0,20,0.1 do
		swait()
		Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(25 - 5 * math.cos(sine / 10)),math.rad(0),math.rad(0)),.1)
		RH.C0=clerp(RH.C0,cf(1,-1 - 0.025 * math.cos(sine / 32),0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-1.5),math.rad(0),math.rad(10)),.1)
		LH.C0=clerp(LH.C0,cf(-1,-1 - 0.025 * math.cos(sine / 32),0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-1.5),math.rad(0),math.rad(-10)),.1)
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0 + 0.025 * math.cos(sine / 32))*angles(math.rad(10 - 0.5 * math.cos(sine / 32)),math.rad(0),math.rad(0)),.1)
		RW.C0=clerp(RW.C0,cf(1.5,0.5,0)*angles(math.rad(90 + 1 * math.cos(sine / 0.252)),math.rad(0 + 1 * math.cos(sine / 0.123)),math.rad(15 + 1 * math.cos(sine / 0.6))),.1)
		LW.C0=clerp(LW.C0,cf(-1.5,0.5,0)*angles(math.rad(10 + 1 * math.cos(sine / 0.568)),math.rad(0 + 1 * math.cos(sine / 0.664)),math.rad(0 + 1 * math.cos(sine / 0.23))),.1)
		sphere2(8,"Add",rarm.CFrame*CFrame.new(0,-1,0)*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(1,1,1),-0.005,0.005,-0.005,ModeColor,Color3.new(0,1,0))
	end
	bosschatfunc("You're just killing innocents....",ModeColor.Color,4)
	for i = 0,20,0.1 do
		swait()
		Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(5 - 5 * math.cos(sine / 10)),math.rad(0),math.rad(0)),.1)
		RH.C0=clerp(RH.C0,cf(1,-1 - 0.025 * math.cos(sine / 32),0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-1.5),math.rad(0),math.rad(10)),.1)
		LH.C0=clerp(LH.C0,cf(-1,-1 - 0.025 * math.cos(sine / 32),0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-1.5),math.rad(0),math.rad(-10)),.1)
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0 + 0.025 * math.cos(sine / 32))*angles(math.rad(10 - 0.5 * math.cos(sine / 32)),math.rad(0),math.rad(0)),.1)
		RW.C0=clerp(RW.C0,cf(1.5,0.5,0)*angles(math.rad(30 + 1 * math.cos(sine / 0.252)),math.rad(0 + 1 * math.cos(sine / 0.123)),math.rad(15 + 1 * math.cos(sine / 0.6))),.1)
		LW.C0=clerp(LW.C0,cf(-1.5,0.5,0)*angles(math.rad(10 + 1 * math.cos(sine / 0.568)),math.rad(0 + 1 * math.cos(sine / 0.664)),math.rad(-15 + 1 * math.cos(sine / 0.23))),.1)
		sphere2(8,"Add",rarm.CFrame*CFrame.new(0,-1,0)*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(1,1,1),-0.005,0.005,-0.005,ModeColor,Color3.new(0,1,0))
	end
	bosschatfunc("I think you need Some karma....",ModeColor.Color,4)
	for i = 0,20,0.1 do
		swait()
		Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(5 - 5 * math.cos(sine / 10)),math.rad(0),math.rad(0)),.1)
		RH.C0=clerp(RH.C0,cf(1,-1 - 0.025 * math.cos(sine / 32),0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-1.5),math.rad(0),math.rad(10)),.1)
		LH.C0=clerp(LH.C0,cf(-1,-1 - 0.025 * math.cos(sine / 32),0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-1.5),math.rad(0),math.rad(-10)),.1)
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0 + 0.025 * math.cos(sine / 32))*angles(math.rad(10 - 0.5 * math.cos(sine / 32)),math.rad(0),math.rad(0)),.1)
		RW.C0=clerp(RW.C0,cf(1.5,0.5,0)*angles(math.rad(30 + 1 * math.cos(sine / 0.252)),math.rad(0 + 1 * math.cos(sine / 0.123)),math.rad(15 + 1 * math.cos(sine / 0.6))),.1)
		LW.C0=clerp(LW.C0,cf(-1.5,0.5,0)*angles(math.rad(10 + 1 * math.cos(sine / 0.568)),math.rad(0 + 1 * math.cos(sine / 0.664)),math.rad(-15 + 1 * math.cos(sine / 0.23))),.1)
		sphere2(8,"Add",rarm.CFrame*CFrame.new(0,-1,0)*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(1,1,1),-0.005,0.005,-0.005,ModeColor,Color3.new(0,1,0))
	end
	RecolorTextAndRename("Karma Ki",Color3.fromRGB(255,0,0),Color3.fromRGB(0,0,0),"Antique")
	chaosmode = false
	rainbowmode = false
	ENRAGE = false
	Global = false
	Shadow = true
	CORRUPTCHAOS = false
	newTheme("rbxassetid://733456981",0,1.02,5)
	ModeColor = BrickColor.new("Black")
	ModeColor2 = BrickColor.new("Really red")
	ModeOfDerpz = "Karma"
	attack = false
end
function Hmph() --Hmph. Your bad lOOopOoOKLOlaAOlaoALondijkwaiufnhbase bvfjkabgfi;qkBGIK|FB
	attack = true
	ok = Instance.new("Sound",tors)
	ok.Volume = 4
	ok.SoundId = "rbxassetid://2854929194"
	ok:Play()
	for i = 0,5,0.1 do
		swait()
		local Alpha = .3
		RootJoint.C0 = RootJoint.C0:lerp(cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0))*RootCF,Alpha)
		LH.C0 = LH.C0:lerp(cf(-1,-1,-0.1)*angles(math.rad(2),math.rad(0),math.rad(0))*angles(math.rad(0),math.rad(-90),math.rad(0)),Alpha)
		RH.C0 = RH.C0:lerp(cf(1,-1.1,0)*angles(math.rad(-6),math.rad(0),math.rad(0))*angles(math.rad(0),math.rad(90),math.rad(0)),Alpha)
		LW.C0 = LW.C0:lerp(cf(-0.5,-0.2,-0.7)*angles(math.rad(-6.8),math.rad(21.2),math.rad(-178.3)),Alpha)
		RW.C0 = RW.C0:lerp(cf(0.8,0.5,-0.9)*angles(math.rad(84.8),math.rad(21.3),math.rad(-67.9)),Alpha)
		Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(25 - 5 * math.cos(sine / 10)),math.rad(0),math.rad(40)),.1)

	end
	attack = false
end
function attackfour()
	attack = true
	hum.WalkSpeed = 0
	for i = 0, 4, 0.1 do
		swait()
		local Alpha = .1
		sphere2(8,"Add",rarm.CFrame*CFrame.new(0,-1,0)*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(1,1,1),-0.05,0.05,-0.05,ModeColor,Color3.new(0,1,0))
		sphere2(8,"Add",larm.CFrame*CFrame.new(0,-1,0)*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(1,1,1),-0.05,0.05,-0.05,ModeColor2,Color3.new(0,1,0))
		RootJoint.C0 = RootJoint.C0:lerp(cf(0,1.7,0)*angles(math.rad(21.6),math.rad(0),math.rad(0))*RootCF,Alpha)
		LH.C0 = LH.C0:lerp(cf(-1,-1,-0.1)*angles(math.rad(-32.9),math.rad(0),math.rad(0))*angles(math.rad(0),math.rad(-90),math.rad(0)),Alpha)
		RH.C0 = RH.C0:lerp(cf(1,0.1,-0.8)*angles(math.rad(0),math.rad(0),math.rad(0))*angles(math.rad(0),math.rad(90),math.rad(0)),Alpha)
		LW.C0 = LW.C0:lerp(cf(-1.2,1.5,0)*angles(math.rad(153.6),math.rad(-2.9),math.rad(31)),Alpha)
		RW.C0 = RW.C0:lerp(cf(1,1.4,-0.2)*angles(math.rad(176),math.rad(3.2),math.rad(-33.3)),Alpha)
		Torso.Neck.C0 = Torso.Neck.C0:lerp(cf(0,0.3,0.4)*angles(math.rad(-32),math.rad(0),math.rad(0))*necko,Alpha)
	end
	local hitb = CreateParta(m,1,1,"SmoothPlastic",BrickColor.Random())
	hitb.Anchored = true
	hitb.CFrame = root.CFrame + root.CFrame.lookVector*4
	MagniDamage(hitb, 20, 10,50, 0, "Knockdown",153092213)
	shakes(0.1,0.1)
	sphere2(1,"Add",tors.CFrame,vt(0,0,0),1,1,1,ModeColor2)
	sphere2(1,"Add",tors.CFrame,vt(0,0,0),2,2,2,ModeColor)
	sphere2(1,"Add",tors.CFrame,vt(0,0,0),2.5,2.5,2.5,ModeColor2)
	sphere2(1,"Add",root.CFrame,vt(0,0,0),3,3,3,ModeColor)
	sphere2(5,"Add",root.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(10,10,10),1,35,1,BrickColor.new("Navy blue"))
	sphere2(5,"Add",root.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(10,10,10),0,50,0,BrickColor.new("Navy blue"))

	CFuncs["Sound"].Create("rbxassetid://763718160", char, 1.5, 0.5)
	CFuncs["Sound"].Create("rbxassetid://763718160", char, 1.5, 0.25)
	CFuncs["Sound"].Create("rbxassetid://782353443", char, 4, 1)
	CFuncs["Sound"].Create("rbxassetid://782353443", char, 4, 0.75)
	for i = 0, 10, 0.1 do
		swait()
		local Alpha = .3
		sphere2(8,"Add",rarm.CFrame*CFrame.new(0,-1,0)*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(1,1,1),-0.005,0.005,-0.005,ModeColor,Color3.new(0,1,0))
		sphere2(8,"Add",larm.CFrame*CFrame.new(0,-1,0)*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(1,1,1),-0.005,0.005,-0.005,ModeColor2,Color3.new(0,1,0))

		RootJoint.C0 = RootJoint.C0:lerp(cf(0,-1,-1.2)*angles(math.rad(-37),math.rad(0),math.rad(0))*RootCF,Alpha)
		LH.C0 = LH.C0:lerp(cf(-1,-1,-0.1)*angles(math.rad(-32.9),math.rad(0),math.rad(0))*angles(math.rad(0),math.rad(-90),math.rad(0)),Alpha)
		RH.C0 = RH.C0:lerp(cf(1,0.2,-0.3)*angles(math.rad(39.2),math.rad(0),math.rad(0))*angles(math.rad(0),math.rad(90),math.rad(0)),Alpha)
		LW.C0 = LW.C0:lerp(cf(-1.4,0.4,-0.8)*angles(math.rad(37.4),math.rad(-4.2),math.rad(-9.8)),Alpha)
		RW.C0 = RW.C0:lerp(cf(1.6,0.4,-0.7)*angles(math.rad(27.1),math.rad(-9.9),math.rad(24)),Alpha)
		Torso.Neck.C0 = Torso.Neck.C0:lerp(cf(0,0.2,0.2)*angles(math.rad(-21.3),math.rad(0),math.rad(0))*necko,Alpha)
	end
	hum.WalkSpeed = storehumanoidWS
	attack = false
end
function YouFightLikeAPRFan() --HAH
	hum.WalkSpeed = 0
	attack = true
	local voice = Instance.new("Sound",tors)
	voice.SoundId = "rbxassetid://2852509470"
	voice.Volume = 10
	voice:Play()
	--2852509470
	bosschatfunc("You fight like a Poison Resistance fan.",BrickColor.new("Really red").Color,4)
	for i = 0,15,0.1 do

		swait()
		local Alpha = .3
		RootJoint.C0 = RootJoint.C0:lerp(cf(-0.3,0,-0.2)*angles(math.rad(0),math.rad(-79.5),math.rad(0))*RootCF,Alpha)
		LH.C0 = LH.C0:lerp(cf(-1,-1,0)*angles(math.rad(0),math.rad(0),math.rad(0))*angles(math.rad(0),math.rad(-90),math.rad(0)),Alpha)
		RH.C0 = RH.C0:lerp(cf(0.9,-1,0.4)*angles(math.rad(0),math.rad(-45),math.rad(0))*angles(math.rad(0),math.rad(90),math.rad(0)),Alpha)
		LW.C0 = LW.C0:lerp(cf(-1.5,0.5,0)*angles(math.rad(-2.9),math.rad(-6.8),math.rad(-88.4)),Alpha)
		RW.C0 = RW.C0:lerp(cf(1.3,0.3,0)*angles(math.rad(44.8),math.rad(-36.3),math.rad(-6.6)),Alpha)
		Torso.Neck.C0 = Torso.Neck.C0:lerp(cf(-0.1,0,0)*angles(math.rad(0),math.rad(71.1),math.rad(0))*necko,Alpha)
	end
	bosschatfunc("What are you,",BrickColor.new("Really red").Color,4)
	for i = 0,5,0.1 do
		swait()
		local Alpha = .3
		RootJoint.C0 = RootJoint.C0:lerp(cf(-0.3,0,-0.2)*angles(math.rad(0),math.rad(-79.5),math.rad(0))*RootCF,Alpha)
		LH.C0 = LH.C0:lerp(cf(-1,-1,0)*angles(math.rad(0),math.rad(0),math.rad(0))*angles(math.rad(0),math.rad(-90),math.rad(0)),Alpha)
		RH.C0 = RH.C0:lerp(cf(0.9,-1,0.4)*angles(math.rad(0),math.rad(-45),math.rad(0))*angles(math.rad(0),math.rad(90),math.rad(0)),Alpha)
		LW.C0 = LW.C0:lerp(cf(-1.5,0.5,0)*angles(math.rad(-2.9),math.rad(-6.8),math.rad(-88.4)),Alpha)
		RW.C0 = RW.C0:lerp(cf(1.3,0.3,0.4)*angles(math.rad(137.8),math.rad(-32.3),math.rad(117.1)),Alpha)
		Torso.Neck.C0 = Torso.Neck.C0:lerp(cf(0,0.2,-0.5)*angles(math.rad(12.4),math.rad(71.7),math.rad(15.7))*necko,Alpha)
	end
	Neutral()
	bosschatfunc("Stupid?",BrickColor.new("Maroon").Color,4)
	ORVOL = 0
	for i = 0,8,0.1 do
		swait()
		local Alpha = .3
		RootJoint.C0 = RootJoint.C0:lerp(cf(-0.3,0,-0.2)*angles(math.rad(0),math.rad(-79.5),math.rad(0))*RootCF,Alpha)
		LH.C0 = LH.C0:lerp(cf(-1,-1,0)*angles(math.rad(0),math.rad(0),math.rad(0))*angles(math.rad(0),math.rad(-90),math.rad(0)),Alpha)
		RH.C0 = RH.C0:lerp(cf(0.9,-1,0.4)*angles(math.rad(0),math.rad(-45),math.rad(0))*angles(math.rad(0),math.rad(90),math.rad(0)),Alpha)
		LW.C0 = LW.C0:lerp(cf(-1.6,0.6,0)*angles(math.rad(179.2),math.rad(14.5),math.rad(-53.6)),Alpha)
		RW.C0 = RW.C0:lerp(cf(1.2,0.3,0.4)*angles(math.rad(120.5),math.rad(33.4),math.rad(69.4)),Alpha)
		Torso.Neck.C0 = Torso.Neck.C0:lerp(cf(0,0.2,-0.5)*angles(math.rad(12.4),math.rad(71.7),math.rad(15.7))*necko,Alpha)
	end
	ORVOL = 10
	Upset()
	hum.WalkSpeed = storehumanoidWS
	attack = false
end
function varidash()
	attack = true
	hum.WalkSpeed = 0
	FaceMouse2()
	for i = 0, 10, 0.1 do
		swait()
		local Alpha = .1
		RootJoint.C0 = RootJoint.C0:lerp(cf(0.2,-0.5,-0.6)*angles(math.rad(-42),math.rad(6.5),math.rad(-25.1))*RootCF,Alpha)
		LH.C0 = LH.C0:lerp(cf(-1.1,-1.2,-0.1)*angles(math.rad(8.4),math.rad(37.9),math.rad(3.5))*angles(math.rad(0),math.rad(-90),math.rad(0)),Alpha)
		RH.C0 = RH.C0:lerp(cf(0.9,0.1,-0.3)*angles(math.rad(56.6),math.rad(-1),math.rad(26.9))*angles(math.rad(0),math.rad(90),math.rad(0)),Alpha)
		LW.C0 = LW.C0:lerp(cf(-1.4,0.1,0.1)*angles(math.rad(19.5),math.rad(65),math.rad(-39.5)),Alpha)
		RW.C0 = RW.C0:lerp(cf(1.6,0.1,-0.3)*angles(math.rad(50.4),math.rad(-24.5),math.rad(24.3)),Alpha)
		Torso.Neck.C0 = Torso.Neck.C0:lerp(cf(0.1,0,-0.3)*angles(math.rad(19.8),math.rad(-7.2),math.rad(-0.2))*necko,Alpha)
	end
	for i = 0, 1, 0.1 do
		swait()
		local Alpha = .8
		RootJoint.C0 = RootJoint.C0:lerp(cf(0,0.1,-1.2)*angles(math.rad(-30.5),math.rad(59.4),math.rad(0))*RootCF,Alpha)
		LH.C0 = LH.C0:lerp(cf(-1.3,-0.8,0.3)*angles(math.rad(-15.1),math.rad(26.1),math.rad(-1.2))*angles(math.rad(0),math.rad(-90),math.rad(0)),Alpha)
		RH.C0 = RH.C0:lerp(cf(1,-0.5,0.1)*angles(math.rad(39.7),math.rad(-40.6),math.rad(43.5))*angles(math.rad(0),math.rad(90),math.rad(0)),Alpha)
		LW.C0 = LW.C0:lerp(cf(-1.3,0.7,0.1)*angles(math.rad(-7.2),math.rad(50.7),math.rad(-43.7)),Alpha)
		RW.C0 = RW.C0:lerp(cf(1.7,0.5,0)*angles(math.rad(67.6),math.rad(-14.9),math.rad(55)),Alpha)
		Torso.Neck.C0 = Torso.Neck.C0:lerp(cf(0.1,0,0.2)*angles(math.rad(-1.2),math.rad(-48.1),math.rad(3.2))*necko,Alpha)
	end
	local MAINRUINCOLOR = ModeColor
	local loc = Instance.new("Part", char)
	loc.BrickColor = MAINRUINCOLOR
	loc.CanCollide = false
	loc.FormFactor = 3
	loc.Name = "Ring"
	loc.Material = "Neon"
	loc.Size = Vector3.new(1, 1, 1)
	loc.Transparency = 1
	loc.TopSurface = 0
	loc.BottomSurface = 0
	loc.Anchored = true
	loc.CFrame = root.CFrame + root.CFrame.lookVector*100
	CFuncs["Sound"].Create("rbxassetid://782353443", loc, 5, 1)
	CFuncs["Sound"].Create("rbxassetid://1177785010", loc, 6, 1)
	MagniDamage(loc, 95, 500,6000, 0, "Normal",0)
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
			trl.Texture = "rbxassetid://2325530138"
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
		eff.Texture = "rbxassetid://363275192"
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
	wait(1)
	hum.WalkSpeed = storehumanoidWS
	attack = false
end
--Knife Thing
local revolver = Instance.new("Part",char)
revolver.CanCollide = false
revolver.Name = "Knife"
local revm = Instance.new("FileMesh",revolver)
revm.MeshId = "http://www.roblox.com/asset/?id=121944778"
revm.TextureId = "http://www.roblox.com/asset/?id=121944805"
revm.Scale = Vector3.new(1,1,1)
local revw = Instance.new("Weld",revolver)
revw.Part0 = revolver
revw.Part1 = char["Right Arm"]
revw.C0 = CFrame.new(0,-1,1) * angles(math.rad(90), math.rad(0), math.rad(0))
revolver.Transparency = 1
--
local rootPart = char:FindFirstChild("HumanoidRootPart")
local NewInstance = function(instance,parent,properties)
	local inst = Instance.new(instance,parent)
	if(properties)then
		for i,v in next, properties do
			pcall(function() inst[i] = v end)
		end
	end
	return inst;
end
function ScytheMode()
	Shadow = true
	attack = true
	storehumanoidWS = 100
	hum.WalkSpeed = 100
	chaosmode = false
	rainbowmode = false
	ENRAGE = false
	Global = false
	CORRUPTCHAOS = false
	Upset()
	ModeOfDerpz = "TRANSFORMATION THING AAAAAAAA"
	kan.SoundId = "rbxassetid://1880742400"
	kan.Pitch = 0.81
	kan:Play()

	local easingstyle = Enum.EasingStyle.Sine
	local easingdir = Enum.EasingDirection.InOut
	local animatetime = 1.5
	Animate(RootJoint,cf(0,0,0)*angles(math.rad(-15.3),math.rad(-15.1),math.rad(8.1))*RootCF,animatetime,easingstyle,easingdir)
	Animate(LH,cf(-1,-1,0)*angles(math.rad(6),math.rad(12.9),math.rad(-12.3))*angles(math.rad(0),math.rad(-90),math.rad(0)),animatetime,easingstyle,easingdir)
	Animate(RH,cf(1,-1.3,0)*angles(math.rad(15.2),math.rad(0),math.rad(0))*angles(math.rad(0),math.rad(90),math.rad(0)),animatetime,easingstyle,easingdir)
	Animate(LW,cf(-1.6,0.3,-0.3)*angles(math.rad(11.7),math.rad(-20.8),math.rad(-20.8)),animatetime,easingstyle,easingdir)
	Animate(RW,cf(1.4,0.1,-0.3)*angles(math.rad(20.3),math.rad(23.2),math.rad(-8.3)),animatetime,easingstyle,easingdir)
	Animate(Torso.Neck,cf(-0.1,0,0)*angles(math.rad(0),math.rad(18.6),math.rad(-5.9))*necko,animatetime,easingstyle,easingdir).Completed:Wait()
	wait(.5)

	local easingstyle = Enum.EasingStyle.Back
	local easingdir = Enum.EasingDirection.Out
	local animatetime = .2
	Animate(RootJoint,cf(0,0,0)*angles(math.rad(0),math.rad(34.7),math.rad(0))*RootCF,animatetime,easingstyle,easingdir)
	Animate(LH,cf(-1,-1,0)*angles(math.rad(-12.3),math.rad(14.3),math.rad(-9))*angles(math.rad(0),math.rad(-90),math.rad(0)),animatetime,easingstyle,easingdir)
	Animate(RH,cf(1,-1.1,0)*angles(math.rad(10.8),math.rad(-33.5),math.rad(16.9))*angles(math.rad(0),math.rad(90),math.rad(0)),animatetime,easingstyle,easingdir)
	Animate(LW,cf(-1.5,0.6,0.1)*angles(math.rad(96.2),math.rad(-7.7),math.rad(-86.9)),animatetime,easingstyle,easingdir)
	Animate(RW,cf(1.4,0.6,0.2)*angles(math.rad(-3),math.rad(-25.4),math.rad(8.3)),animatetime,easingstyle,easingdir)
	Animate(Torso.Neck,cf(-0.1,0,0)*angles(math.rad(-0.3),math.rad(-33.6),math.rad(-3.8))*necko,animatetime,easingstyle,easingdir).Completed:Wait()
	wait(.2)
	local easingstyle = Enum.EasingStyle.Sine
	local easingdir = Enum.EasingDirection.InOut
	local animatetime = 1.5
	Animate(RootJoint,cf(0,0,0)*angles(math.rad(10.3),math.rad(34.2),math.rad(-5.8))*RootCF,animatetime,easingstyle,easingdir)
	Animate(LH,cf(-1,-1.2,0)*angles(math.rad(-13.7),math.rad(14.5),math.rad(-8.6))*angles(math.rad(0),math.rad(-90),math.rad(0)),animatetime,easingstyle,easingdir)
	Animate(RH,cf(1,-1.1,0)*angles(math.rad(-9.3),math.rad(-36.8),math.rad(5.3))*angles(math.rad(0),math.rad(90),math.rad(0)),animatetime,easingstyle,easingdir)
	Animate(LW,cf(-1.5,0.6,0.1)*angles(math.rad(97.6),math.rad(-30.1),math.rad(-86.4)),animatetime,easingstyle,easingdir)
	Animate(RW,cf(1.4,0.6,0.2)*angles(math.rad(-16.3),math.rad(-26.5),math.rad(2.4)),animatetime,easingstyle,easingdir)
	Animate(Torso.Neck,cf(-0.2,0,0.2)*angles(math.rad(-17.1),math.rad(-32.2),math.rad(-11.4))*necko,animatetime,easingstyle,easingdir)
	local lol = 1
	for i = 0,15,0.1 do
		swait()
		lol = lol - 1/150
		scythetrans(lol)
	end
	local easingstyle = Enum.EasingStyle.Back
	local easingdir = Enum.EasingDirection.Out
	local animatetime = .5
	Animate(RootJoint,cf(0,0,0)*angles(math.rad(10.3),math.rad(34.2),math.rad(-5.8))*RootCF,animatetime,easingstyle,easingdir)
	Animate(LH,cf(-1,-1.2,0)*angles(math.rad(-13.7),math.rad(14.5),math.rad(-8.6))*angles(math.rad(0),math.rad(-90),math.rad(0)),animatetime,easingstyle,easingdir)
	Animate(RH,cf(1,-1.1,0)*angles(math.rad(-9.3),math.rad(-36.8),math.rad(5.3))*angles(math.rad(0),math.rad(90),math.rad(0)),animatetime,easingstyle,easingdir)
	Animate(LW,cf(-1.5,0.1,0.1)*angles(math.rad(95.6),math.rad(4.7),math.rad(-86.9)),animatetime,easingstyle,easingdir)
	Animate(RW,cf(1.5,0.2,0.3)*angles(math.rad(-16.3),math.rad(-26.5),math.rad(2.4)),animatetime,easingstyle,easingdir)
	Animate(Torso.Neck,cf(-0.3,0.1,0.3)*angles(math.rad(-27.8),math.rad(-29.9),math.rad(-16.9))*necko,animatetime,easingstyle,easingdir).Completed:Wait()
	wait(.5)


	local easingstyle = Enum.EasingStyle.Back
	local easingdir = Enum.EasingDirection.Out
	local animatetime = .7
	Animate(RootJoint,cf(0,0,0)*angles(math.rad(-12.1),math.rad(-19.1),math.rad(11.1))*RootCF,animatetime,easingstyle,easingdir)
	Animate(LH,cf(-1,-0.8,-0.3)*angles(math.rad(13.1),math.rad(9.1),math.rad(-14.2))*angles(math.rad(0),math.rad(-90),math.rad(0)),animatetime,easingstyle,easingdir)
	Animate(RH,cf(1.1,-1.4,0.1)*angles(math.rad(-9.3),math.rad(-36.8),math.rad(5.3))*angles(math.rad(0),math.rad(90),math.rad(0)),animatetime,easingstyle,easingdir)
	Animate(LW,cf(-1.3,0.3,-0.8)*angles(math.rad(76.3),math.rad(5.7),math.rad(38.7)),animatetime,easingstyle,easingdir)
	Animate(RW,cf(0.9,0,-0.9)*angles(math.rad(83),math.rad(7.3),math.rad(-42.6)),animatetime,easingstyle,easingdir)
	Animate(Torso.Neck,cf(-0.1,0,0.1)*angles(math.rad(-4.1),math.rad(21.3),math.rad(-4.7))*necko,animatetime,easingstyle,easingdir).Completed:Wait()
	wait(.5)
	ModeOfDerpz = "FullyEnragedJake"
	attack = false
	ModeColor = BrickColor.new("Really black")
	ModeColor2 = BrickColor.new("Really black")

	RecolorTextAndRename("Scythe Ki",BrickColor.new("Really black").Color,BrickColor.new("Really black").Color,"SciFi")
end
function ICANTTAKEITANYMORE()
	attack = true
	local MAINRUINCOLOR = ModeColor
	bosschatfunc("I.. Can't...",MAINRUINCOLOR.Color,1)
	for i = 0,25,0.1 do
		swait()
		RH.C0=clerp(RH.C0,cf(1,-1 - 0.05 * math.cos(sine / 28),0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-2.5),math.rad(0),math.rad(0 + 1 * math.cos(sine / 34))),.1)
		LH.C0=clerp(LH.C0,cf(-1,-1 - 0.05 * math.cos(sine / 28),0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-2.5),math.rad(0),math.rad(0 + 1 * math.cos(sine / 34))),.1)
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0 + 0.05 * math.cos(sine / 28))*angles(math.rad(0 - 1 * math.cos(sine / 34)),math.rad(0),math.rad(0)),.1)
		Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(40 - 4.5 * math.cos(sine / 28)),math.rad(0),math.rad(0)),.1)
		RW.C0=clerp(RW.C0,cf(1.5,0.5 + 0.1 * math.cos(sine / 28),0)*angles(math.rad(0),math.rad(0),math.rad(0)),.1)
		LW.C0=clerp(LW.C0,cf(-1.5,0.5 + 0.1 * math.cos(sine / 28),0)*angles(math.rad(0),math.rad(0),math.rad(0)),.1)
	end
	bosschatfunc("Take... It...",MAINRUINCOLOR.Color,1)

	for i = 0,20,0.1 do
		swait()
		RH.C0=clerp(RH.C0,cf(1,-1 - 0.05 * math.cos(sine / 32),0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-3 + 3 * math.cos(sine / 40)),math.rad(0 - 1 * math.cos(sine / 56)),math.rad(25 - 2 * math.cos(sine / 32))),.1)
		LH.C0=clerp(LH.C0,cf(-1,-1 - 0.05 * math.cos(sine / 32),0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-3 + 3 * math.cos(sine / 40)),math.rad(0 - 1 * math.cos(sine / 56)),math.rad(-25 + 2 * math.cos(sine / 32))),.1)
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,-0.25 + 0.02 * math.cos(sine / 32),-0.1 + 0.05 * math.cos(sine / 32))*angles(math.rad(25 - 3 * math.cos(sine / 40)),math.rad(0),math.rad(0)),.1)
		Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(25 - 2 * math.cos(sine / 37)),math.rad(0 + 1 * math.cos(sine / 58)),math.rad(0 + 2 * math.cos(sine / 53))),.1)
		RW.C0=clerp(RW.C0,cf(1.5,0.5 + 0.025 * math.cos(sine / 45),0)*angles(math.rad(25 + 5 * math.cos(sine / 74)),math.rad(1 - 3 * math.cos(sine / 53)),math.rad(1 + 3 * math.cos(sine / 45))),.1)
		LW.C0=clerp(LW.C0,cf(-1.5,0.5 + 0.025 * math.cos(sine / 45),0)*angles(math.rad(25 - 3 * math.cos(sine / 73)),math.rad(2 - 1 * math.cos(sine / 55)),math.rad(-3 - 3 * math.cos(sine / 45))),.1)
	end
	bosschatfunc("Any... More...",MAINRUINCOLOR.Color,1)

	for i = 0,30,0.1 do
		swait()
		RH.C0=clerp(RH.C0,cf(1,0.35 - 0.05 * math.cos(sine / 32),-0.7)*angles(math.rad(-20),math.rad(90),math.rad(0))*angles(math.rad(-3),math.rad(0 - 1 * math.cos(sine / 56)),math.rad(25 - 2 * math.cos(sine / 32))),.1)
		LH.C0=clerp(LH.C0,cf(-1,-1.125 - 0.05 * math.cos(sine / 32),-0.6)*angles(math.rad(-105),math.rad(-90),math.rad(0))*angles(math.rad(-3),math.rad(0 - 1 * math.cos(sine / 56)),math.rad(-25 + 2 * math.cos(sine / 32))),.1)
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,-1.3 + 0.05 * math.cos(sine / 32))*angles(math.rad(7.5 - 2 * math.cos(sine / 32)),math.rad(0),math.rad(0)),.1)
		Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(35 - 2.5 * math.cos(sine / 28)),math.rad(0),math.rad(0)),.1)
		RW.C0=clerp(RW.C0,cf(1.5,0.5 + 0.1 * math.cos(sine / 28),0)*angles(math.rad(0),math.rad(0),math.rad(0)),.1)
		LW.C0=clerp(LW.C0,cf(-1.5,0.5 + 0.1 * math.cos(sine / 28),0)*angles(math.rad(0),math.rad(0),math.rad(0)),.1)
	end
	for i = 0,30,0.1 do
		swait()
		revolver.Transparency = revolver.Transparency - 0.05
		RH.C0=clerp(RH.C0,cf(1,0.35 - 0.05 * math.cos(sine / 32),-0.7)*angles(math.rad(-20),math.rad(90),math.rad(0))*angles(math.rad(-3),math.rad(0 - 1 * math.cos(sine / 56)),math.rad(25 - 2 * math.cos(sine / 32))),.1)
		LH.C0=clerp(LH.C0,cf(-1,-1.125 - 0.05 * math.cos(sine / 32),-0.6)*angles(math.rad(-105),math.rad(-90),math.rad(0))*angles(math.rad(-3),math.rad(0 - 1 * math.cos(sine / 56)),math.rad(-25 + 2 * math.cos(sine / 32))),.1)
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,-1.3 + 0.05 * math.cos(sine / 32))*angles(math.rad(7.5 - 2 * math.cos(sine / 32)),math.rad(0),math.rad(0)),.1)
		Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(35 - 2.5 * math.cos(sine / 28)),math.rad(0),math.rad(0)),.1)
		RW.C0=clerp(RW.C0,cf(1.5,0.5 + 0.1 * math.cos(sine / 28),0)*angles(math.rad(90),math.rad(0),math.rad(0)),.1)
		LW.C0=clerp(LW.C0,cf(-1.5,0.5 + 0.1 * math.cos(sine / 28),0)*angles(math.rad(0),math.rad(0),math.rad(0)),.1)
	end
	for i = 0,50,0.1 do
		swait()
		FHead.Transparency = FHead.Transparency - 0.1
		revw.C0 = CFrame.new(1,0,0) * angles(math.rad(0), math.rad(0), math.rad(-50))
		RH.C0=clerp(RH.C0,cf(1,0.35 - 0.05 * math.cos(sine / 32),-0.7)*angles(math.rad(-20),math.rad(90),math.rad(0))*angles(math.rad(-3),math.rad(0 - 1 * math.cos(sine / 56)),math.rad(25 - 2 * math.cos(sine / 32))),.1)
		LH.C0=clerp(LH.C0,cf(-1,-1.125 - 0.05 * math.cos(sine / 32),-0.6)*angles(math.rad(-105),math.rad(-90),math.rad(0))*angles(math.rad(-3),math.rad(0 - 1 * math.cos(sine / 56)),math.rad(-25 + 2 * math.cos(sine / 32))),.1)
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,-1.3 + 0.05 * math.cos(sine / 32))*angles(math.rad(7.5 - 2 * math.cos(sine / 32)),math.rad(0),math.rad(0)),.1)
		Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(0 - 2.5 * math.cos(sine / 28)),math.rad(0),math.rad(0)),.1)
		RW.C0=clerp(RW.C0,cf(1.5,0.5 + 0.1 * math.cos(sine / 28),-1)*angles(math.rad(90),math.rad(0),math.rad(-40)),.1)
		LW.C0=clerp(LW.C0,cf(-0.6,0.5 + 0.1 * math.cos(sine / 28),-1)*angles(math.rad(90),math.rad(0),math.rad(40)),.1)
	end
	bosschatfunc("I... I-I'm.. Sorry...",MAINRUINCOLOR.Color,1)
	for i = 0,50,0.1 do
		swait()
		RH.C0=clerp(RH.C0,cf(1,0.35 - 0.05 * math.cos(sine / 32),-0.7)*angles(math.rad(-20),math.rad(90),math.rad(0))*angles(math.rad(-3),math.rad(0 - 1 * math.cos(sine / 56)),math.rad(25 - 2 * math.cos(sine / 32))),.1)
		LH.C0=clerp(LH.C0,cf(-1,-1.125 - 0.05 * math.cos(sine / 32),-0.6)*angles(math.rad(-105),math.rad(-90),math.rad(0))*angles(math.rad(-3),math.rad(0 - 1 * math.cos(sine / 56)),math.rad(-25 + 2 * math.cos(sine / 32))),.1)
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,-1.3 + 0.05 * math.cos(sine / 32))*angles(math.rad(7.5 - 2 * math.cos(sine / 32)),math.rad(0),math.rad(0)),.1)
		Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(10 - 2.5 * math.cos(sine / 28)),math.rad(0),math.rad(0)),.1)
		RW.C0=clerp(RW.C0,cf(1.5,0.5 + 0.1 * math.cos(sine / 28),-1)*angles(math.rad(90),math.rad(0),math.rad(-40)),.1)
		LW.C0=clerp(LW.C0,cf(-0.6,0.5 + 0.1 * math.cos(sine / 28),-1)*angles(math.rad(90),math.rad(0),math.rad(40)),.1)
	end
	local kan = Instance.new("Sound",revolver)
	kan.Volume = 10
	kan.TimePosition = 0
	kan.PlaybackSpeed = 1
	kan.Pitch = 1
	kan.SoundId = "rbxassetid://210943487"
	kan.Name = "DED"
	kan.Looped = false
	kan:Play()
	local kanzz = Instance.new("Sound",hed)
	kanzz.Volume = 5
	kanzz.TimePosition = 0
	kanzz.PlaybackSpeed = 1.5
	kanzz.Pitch = 1
	kanzz.SoundId = "rbxassetid://199977936"
	kanzz.Name = "dedy"
	kanzz.Looped = false
	kanzz:Play()
	for i = 0,30,0.1 do
		swait()
		revw.C0 = CFrame.new(1,-1,0) * angles(math.rad(0), math.rad(0), math.rad(-50))
		RH.C0=clerp(RH.C0,cf(1,0.35 - 0.05 * math.cos(sine / 32),-0.7)*angles(math.rad(-20),math.rad(90),math.rad(0))*angles(math.rad(-3),math.rad(0 - 1 * math.cos(sine / 56)),math.rad(25 - 2 * math.cos(sine / 32))),.1)
		LH.C0=clerp(LH.C0,cf(-1,-1.125 - 0.05 * math.cos(sine / 32),-0.6)*angles(math.rad(-105),math.rad(-90),math.rad(0))*angles(math.rad(-3),math.rad(0 - 1 * math.cos(sine / 56)),math.rad(-25 + 2 * math.cos(sine / 32))),.1)
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,-1.3 + 0.05 * math.cos(sine / 32))*angles(math.rad(7.5 - 2 * math.cos(sine / 32)),math.rad(0),math.rad(0)),.1)
		Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(30 - 2.5 * math.cos(sine / 28)),math.rad(0),math.rad(0)),.1)
		RW.C0=clerp(RW.C0,cf(1.5,0.5 + 0.1 * math.cos(sine / 28),-0.3)*angles(math.rad(90),math.rad(0),math.rad(-30)),.1)
		LW.C0=clerp(LW.C0,cf(-0.6,0.5 + 0.1 * math.cos(sine / 28),-0.3)*angles(math.rad(90),math.rad(0),math.rad(30)),.1)
	end
	local Soul1 = Instance.new("Part", Character)
	Soul1.Name = "Soul"
	Soul1.Anchored = true
	Soul1.Shape = Enum.PartType.Block
	Soul1.CanCollide = false
	Soul1.BrickColor = MAINRUINCOLOR
	Soul1.Transparency = 0
	Soul1.Material = "Neon"
	Soul1.Size = Vector3.new(0.26, 0.5, 0.21)
	Soul1.TopSurface = Enum.SurfaceType.Smooth
	Soul1.BottomSurface = Enum.SurfaceType.Smooth


	local M1 = Instance.new("SpecialMesh")
	M1.Parent = Soul1
	M1.MeshType = "Sphere"
	M1.Scale = Vector3.new(1,1,1)

	local Soul2 = Instance.new("Part", Character)
	Soul2.Name = "Soul"
	Soul2.Anchored = true
	Soul2.Shape = Enum.PartType.Block
	Soul2.CanCollide = false
	Soul2.BrickColor = MAINRUINCOLOR
	Soul2.Transparency = 0
	Soul2.Material = "Neon"
	Soul2.Size = Vector3.new(0.26, 0.5, 0.21)
	Soul2.TopSurface = Enum.SurfaceType.Smooth
	Soul2.BottomSurface = Enum.SurfaceType.Smooth
	for i = 0,30,0.1 do
		swait()
		RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,1,-2.5)*angles(math.rad(90),math.rad(0),math.rad(180)),.2)
		Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(0),math.rad(0),math.rad(90)),.4)
		RW.C0=clerp(RW.C0,cf(1.5,0.5,0)*angles(math.rad(180),math.rad(0),math.rad(90)),.2)
		LW.C0=clerp(LW.C0,cf(-1.5,0.5,0)*angles(math.rad(0),math.rad(0),math.rad(-90)),.2)
		RH.C0=clerp(RH.C0,cf(1,-1,0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-20),math.rad(0),math.rad(0)),.2)
		LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-20),math.rad(0),math.rad(0)),.2)
	end
	wait(2)
	for i = 0,1.7,0.01 do
		Soul1.CFrame = rootPart.CFrame * CFrame.new(math.random(5,15)/100, math.random(95,105)/100, -1)*CFrame.fromEulerAnglesXYZ(0,0,math.rad(30))
		Soul2.CFrame = rootPart.CFrame * CFrame.new(math.random(-15,-5)/100, math.random(95,105)/100, -1)*CFrame.fromEulerAnglesXYZ(0,0,math.rad(-30))
	end
	Soul1.CFrame = rootPart.CFrame * CFrame.new(0.1, 1, -1)*CFrame.fromEulerAnglesXYZ(0,0,math.rad(30))
	Soul2.CFrame = rootPart.CFrame * CFrame.new(-0.1, 1, -1)*CFrame.fromEulerAnglesXYZ(0,0,math.rad(-30))
	wait(1)
	S = Instance.new("Sound")
	S.Parent = Character.Torso
	S.SoundId = "rbxassetid://973028066"
	S.Volume = 10
	S.Looped = false
	S.Pitch = 1
	S:Play()
	Soul1.CFrame = rootPart.CFrame * CFrame.new(0.25, 1, -1)*CFrame.fromEulerAnglesXYZ(0,0,math.rad(30))
	Soul2.CFrame = rootPart.CFrame * CFrame.new(-0.25, 1, -1)*CFrame.fromEulerAnglesXYZ(0,0,math.rad(-30))
	wait(1)
	Soul1.Anchored = false
	Soul2.Anchored = false
	Soul1.Velocity = ((Soul1.CFrame*CFrame.new(5,0,math.random(-2,2))).p-Soul1.CFrame.p)*5
	Soul2.Velocity = ((Soul2.CFrame*CFrame.new(-5,0,math.random(-2,2))).p-Soul2.CFrame.p)*5
	for i = 1,60,2 do
		Soul1.Transparency = i/30
		Soul2.Transparency = i/30
		swait()
	end
	wait(1)
	CFuncs["EchoSound"].Create("rbxassetid://427025525", root, 4, 1,0,10,0.15,0.5,1)
	local v = Character.Torso
	if(v:IsA'BasePart')then
		dust = NewInstance("ParticleEmitter",v,{
			Color = ColorSequence.new(Color3.new(1,1,1)),
			LightEmission=0,
			LightInfluence=1,
			Size=NumberSequence.new{NumberSequenceKeypoint.new(0,1,0),NumberSequenceKeypoint.new(1,0,0)},
			Texture="rbxassetid://284205403",
			Transparency=NumberSequence.new{NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(1,1,0)},
			Lifetime = NumberRange.new(1),
			Rate=150,
			Acceleration = Vector3.new(0,10,0),
			Speed = NumberRange.new(5),
			Enabled = true
		})
	end
	for i = 0, 4, 0.1 do
		Character.Head.Transparency = Character.Head.Transparency + 0.15
		Character.Head.face.Transparency = Character.Head.face.Transparency + 0.15
		t.Transparency = t.Transparency + 0.15
		larm.Transparency = larm.Transparency + 0.15
		rarm.Transparency = rarm.Transparency + 0.15
		lleg.Transparency = lleg.Transparency + 0.15
		rleg.Transparency = rleg.Transparency + 0.15
	end
	CameraEnshaking(0.05, 4)
	wait(2)
	Character:ClearAllChildren()
	--Unfinished
	attack = false
end
function SPECIALInsaneDerpz()
	warnedpeople("Derpz is using Insane's finale!","Arcade",BrickColor.Random().Color,BrickColor.Random().Color)
	attack = true
	ZoomInOnFace()
	for i = 0, 10, 0.1 do
		swait()
		local Alpha = .3
		sphere2(8,"Add",larm.CFrame*CFrame.new(0,-1,0)*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(1,1,1),-0.01,0.01,-0.01,BrickColor.random(),Color3.new(0,1,0))

		RootJoint.C0 = RootJoint.C0:lerp(cf(0,0,0)*angles(math.rad(0),math.rad(59.4),math.rad(0))*RootCF,Alpha)
		LH.C0 = LH.C0:lerp(cf(-0.9,-1,0.3)*angles(math.rad(1.3),math.rad(38.4),math.rad(-0.7))*angles(math.rad(0),math.rad(-90),math.rad(0)),Alpha)
		RH.C0 = RH.C0:lerp(cf(1,-1,0)*angles(math.rad(-15.2),math.rad(-27.2),math.rad(-5.2))*angles(math.rad(0),math.rad(90),math.rad(0)),Alpha)
		LW.C0 = LW.C0:lerp(cf(-1.5,0.8,0.1)*angles(math.rad(161.3),math.rad(-36.6),math.rad(-2.3)),Alpha)
		RW.C0 = RW.C0:lerp(cf(1.5,0.5,0.2)*angles(math.rad(0),math.rad(-23.1),math.rad(0)),Alpha)
		Torso.Neck.C0 = Torso.Neck.C0:lerp(cf(-0.1,0,-0.1)*angles(math.rad(2.6),math.rad(-48.2),math.rad(-6.8))*necko,Alpha)
	end
	for i = 0, 5, 0.1 do
		swait()
		local Alpha = .3
		RootJoint.C0 = RootJoint.C0:lerp(cf(0,0,0)*angles(math.rad(0),math.rad(59.4),math.rad(0))*RootCF,Alpha)
		LH.C0 = LH.C0:lerp(cf(-0.9,-1,0.3)*angles(math.rad(1.3),math.rad(38.4),math.rad(-0.7))*angles(math.rad(0),math.rad(-90),math.rad(0)),Alpha)
		RH.C0 = RH.C0:lerp(cf(1,-1,0)*angles(math.rad(-15.2),math.rad(-27.2),math.rad(-5.2))*angles(math.rad(0),math.rad(90),math.rad(0)),Alpha)
		LW.C0 = LW.C0:lerp(cf(-1.4,0.5,0.3)*angles(math.rad(-173),math.rad(-37.7),math.rad(10.7)),Alpha)
		RW.C0 = RW.C0:lerp(cf(1.6,0.4,0)*angles(math.rad(-18.1),math.rad(-6.7),math.rad(2)),Alpha)
		Torso.Neck.C0 = Torso.Neck.C0:lerp(cf(0.1,0,0.2)*angles(math.rad(-1.2),math.rad(-48.1),math.rad(3.2))*necko,Alpha)
	end
	hum.WalkSpeed = storehumanoidWS
	attack = false
end
function BURNINHELL()
	hum.WalkSpeed = 0
	attack = true
	bosschatfunc("You know what you deserve?",BrickColor.new("Really blue").Color,4)
	for i = 0, 15, 0.1 do
		swait()
		local Alpha = .1
		RootJoint.C0 = RootJoint.C0:lerp(cf(0.1,0 + 0.1 * math.cos(sine / 24),-0.3)*angles(math.rad(0),math.rad(25.6),math.rad(0))*RootCF,Alpha)
		LH.C0 = LH.C0:lerp(cf(-1,-1 - 0.1 * math.cos(sine / 24),0.3)*angles(math.rad(0),math.rad(26.1),math.rad(0))*angles(math.rad(0),math.rad(-90),math.rad(0)),Alpha)
		RH.C0 = RH.C0:lerp(cf(1,-1- 0.1 * math.cos(sine / 24),0.1)*angles(math.rad(-12.5),math.rad(-33.4),math.rad(-5.4))*angles(math.rad(0),math.rad(90),math.rad(0)),Alpha)
		LW.C0 = LW.C0:lerp(cf(-1.3,1.1,-0.3)*angles(math.rad(158.7+ math.random(-1,1)),math.rad(14+ math.random(-1,1)),math.rad(33.2+ math.random(-1,1))),Alpha)
		RW.C0 = RW.C0:lerp(cf(1.4,0.4,0.3)*angles(math.rad(67.5),math.rad(6.8),math.rad(17.7)),Alpha)
		Torso.Neck.C0 = Torso.Neck.C0:lerp(cf(0,0.1,0.1)*angles(math.rad(-9.4 + math.random(-1,1)),math.rad(-26.3+ math.random(-1,1)),math.rad(-4.7+ math.random(-1,1)))*necko,Alpha)
	end
	bosschatfunc("TO BURN IN HELL!",BrickColor.new("Really red").Color,4)
	for i = 0, 7, 0.1 do
		swait()
		local Alpha = .3
		RootJoint.C0 = RootJoint.C0:lerp(cf(0,-0.1,0)*angles(math.rad(12.3),math.rad(0),math.rad(0))*RootCF,Alpha)
		LH.C0 = LH.C0:lerp(cf(-1,0,-0.8)*angles(math.rad(0),math.rad(0),math.rad(0))*angles(math.rad(0),math.rad(-90),math.rad(0)),Alpha)
		RH.C0 = RH.C0:lerp(cf(1,-1,0)*angles(math.rad(-12.9),math.rad(0),math.rad(0))*angles(math.rad(0),math.rad(90),math.rad(0)),Alpha)
		LW.C0 = LW.C0:lerp(cf(-1.5,0.9,0)*angles(math.rad(-179.8+ math.random(-3,3)),math.rad(0.1+ math.random(-3,3)),math.rad(27.6+ math.random(-3,3))),Alpha)
		RW.C0 = RW.C0:lerp(cf(1.5,0.5,0.1)*angles(math.rad(-19.9+ math.random(-3,3)),math.rad(0+ math.random(-3,3)),math.rad(0+ math.random(-3,3))),Alpha)
		Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(25 - 2.5 * math.cos(sine / 37) - math.random(-3,3)),math.rad(20 + 1.8 * math.cos(sine / 43) - 5 * math.cos(sine / 0.25)),math.rad(0 - 2 * math.cos(sine / 56) - math.random(-5,5))),.1)
	end
	local keptcolor = ModeColor
	local keptcolor2 = ModeColor2
	sphere2(4,"Add",root.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(1.5,1,1.5),-0.005,4,-0.005,keptcolor)
	slash(math.random(10,50)/10,5,true,"Round","Add","Out",root.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(0.01,0.01,0.01),math.random(50,250)/250,keptcolor)
	block(2,"Add",root.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(4,4,4),0.5,0.5,0.5,keptcolor2,keptcolor2.Color)
	block(1,"Add",root.CFrame*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(4,4,4),0.5,0.5,0.5,keptcolor2,keptcolor2.Color)

	MagniDamage(tors, 50, 500,6000, 0, "Knockdown",0)
	for i = 0, 10, 0.1 do
		swait()
		local Alpha = .3
		RootJoint.C0 = RootJoint.C0:lerp(cf(0,-0.2,-0.2)*angles(math.rad(-14.4),math.rad(0),math.rad(0))*RootCF,Alpha)
		LH.C0 = LH.C0:lerp(cf(-1,-0.6,-0.7)*angles(math.rad(14.7),math.rad(0),math.rad(0))*angles(math.rad(0),math.rad(-90),math.rad(0)),Alpha)
		RH.C0 = RH.C0:lerp(cf(1,-1.3,-0.1)*angles(math.rad(-43.8),math.rad(0),math.rad(0))*angles(math.rad(0),math.rad(90),math.rad(0)),Alpha)
		LW.C0 = LW.C0:lerp(cf(-1.2,1.1,-0.1)*angles(math.rad(165.1+ math.random(-5,5)),math.rad(-14.2+ math.random(-5,5)),math.rad(38.3+ math.random(-5,5))),Alpha)
		RW.C0 = RW.C0:lerp(cf(1.5,0.3,0)*angles(math.rad(-56),math.rad(0),math.rad(0)),Alpha)
		Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(35 - 2.5 * math.cos(sine / 37) - math.random(-5,5)),math.rad(0 + 1.8 * math.cos(sine / 43) - 5 * math.cos(sine / 0.005)),math.rad( - 2 * math.cos(sine / 56) - math.random(-5,5))),.1)

	end
	attack = false
	hum.WalkSpeed = storehumanoidWS
end
CORRUPTCHAOS = false
-------------------------------------

Humanoid.Animator.Parent = nil

-------------------------------------
print(mouse,mouse.Button1Down)
local attacktype = 1
mouse.Button1Down:connect(function()
	if attack == false and attacktype == 1 then
		attacktype = 2
		attackone()
	elseif attack == false and attacktype == 2 then
		attacktype = 3
		attacktwo()
	elseif attack == false and attacktype == 3 then
		attacktype = 4
		attackthree()
	elseif attack == false and attacktype == 4 then
		attacktype = 1
		attackfour()
	end
end)
Shadow = false
newTheme("rbxassetid://1751171913",0,1.02,5)
mouse.KeyDown:connect(function(k)
	if k == "l" and mutedtog == false then
		mutedtog = true
		kan.Volume = 0.05
	elseif k == "l" and mutedtog == true then
		mutedtog = false
		kan.Volume = 5
	end
	rotationa = 0
	if k == "q" and attack == false and ModeOfDerpz ~= "Derpz?" then
		attack = true
		ModeOfDerpz = "Transforming"
		local bbbb=Create("Sound"){
			Parent=char,
			SoundId="rbxassetid://898407368",
			Volume=5,
			PlaybackSpeed=1.5,
			MaxDistance=66666666,
			Name="h",
		}
		bbbb:Play()
		local a = 0
		for i = 0, 10, 0.1 do
			swait()
			local Alpha = .1
			a = a + 0.01
			EffectBoi(e,"Royal purple",CFrame.new(root.Position-Vector3.new(0,3,0)),4,6,4,3+a,-.09-a,3+a,.05,"FileMesh",2,math.random(-21,21),"20329976")
			EffectBoi(e,"Dark orange",CFrame.new(root.Position-Vector3.new(0,3,0)),5,1,5,3+a,0+a,3+a,.05,"FileMesh",2,math.random(-21,21),"20329976")
			EffectBoi(e,"Royal purple",CFrame.new(Torso.Position)*CFrame.Angles(math.random(-120,120),math.random(-120,120),math.random(-120,120)),.01+.01*a,.01+.002*a,.01+.005*a,0.008+.045*a,0+.007*a,0.008+.045*a,.04,"FileMesh",2,math.random(-42,42),"662585058")
			EffectBoi(e,"Dark orange",CFrame.new(Torso.Position)*CFrame.Angles(math.random(-120,120),math.random(-120,120),math.random(-120,120)),.03+.01*i,.002+.01*a,.01+.005*a,0.008+.045*a,0+.007*a,0.008+.045*a,.04,"FileMesh",2,math.random(-42,42),"662585058")

			RootJoint.C0 = RootJoint.C0:lerp(cf(0,-0.2,-0.2)*angles(math.rad(-19.3),math.rad(0),math.rad(0))*RootCF,Alpha)
			LH.C0 = LH.C0:lerp(cf(-1,-0.7,-0.2)*angles(math.rad(23.2),math.rad(0),math.rad(0))*angles(math.rad(0),math.rad(-90),math.rad(0)),Alpha)
			RH.C0 = RH.C0:lerp(cf(1,-1,0)*angles(math.rad(0),math.rad(0),math.rad(0))*angles(math.rad(0),math.rad(90),math.rad(0)),Alpha)
			LW.C0 = LW.C0:lerp(cf(-1.1,0.4,-0.5)*angles(math.rad(136.7),math.rad(16.8),math.rad(29.1)),Alpha)
			RW.C0 = RW.C0:lerp(cf(0.9,0.8,-0.6)*angles(math.rad(129.9),math.rad(-17.4),math.rad(-38.4)),Alpha)
			Torso.Neck.C0 = Torso.Neck.C0:lerp(cf(0,0.2,0.3)*angles(math.rad(-25.1),math.rad(0),math.rad(0))*necko,Alpha)
		end
		ModeOfDerpz = "Derpz?"
		Neutral()
		storehumanoidWS = 20
		hum.WalkSpeed = 20
		RecolorTextAndRename("Ki",Color3.fromRGB(75,0,130),Color3.fromRGB(255,165,0),"Arcade")
		chaosmode = false
		rainbowmode = false
		ENRAGE = false
		Global = false
		Shadow = false
		CORRUPTCHAOS = false
		newTheme("rbxassetid://1751171913",0,1.02,5)
		ModeColor = BrickColor.new("Royal purple")
		ModeColor2 = BrickColor.new("Dark orange")
		CFuncs["Sound"].Create("rbxassetid://1368637781", root, 10,1)
		CFuncs["Sound"].Create("rbxassetid://763718160", root, 7.5, 1.1)
		CFuncs["Sound"].Create("rbxassetid://782353443", root, 7.5, 1)
		for i = 0, 15, 0.1 do
			swait()
			local Alpha = .3
			RootJoint.C0 = RootJoint.C0:lerp(cf(0,-0.2,0.1)*angles(math.rad(14.3),math.rad(0),math.rad(0))*RootCF,Alpha)
			LH.C0 = LH.C0:lerp(cf(-1,-0.9,0.1)*angles(math.rad(-17),math.rad(0),math.rad(0))*angles(math.rad(0),math.rad(-90),math.rad(0)),Alpha)
			RH.C0 = RH.C0:lerp(cf(1,-0.8,0.1)*angles(math.rad(-13.1),math.rad(0),math.rad(0))*angles(math.rad(0),math.rad(90),math.rad(0)),Alpha)
			LW.C0 = LW.C0:lerp(cf(-1.5,0.9,0)*angles(math.rad(66.3),math.rad(-13.4),math.rad(-89.4)),Alpha)
			RW.C0 = RW.C0:lerp(cf(1.5,0.9,0.2)*angles(math.rad(63.6),math.rad(9.7),math.rad(74)),Alpha)
			Torso.Neck.C0 = Torso.Neck.C0:lerp(cf(0,0,0)*angles(math.rad(0.6),math.rad(0),math.rad(0))*necko,Alpha)
		end
		attack = false
	elseif k == "m" and attack == false and ModeOfDerpz == "Derpz?" then
		ModeOfDerpz = "DJ"
		Happy()
		storehumanoidWS = 20
		hum.WalkSpeed = 20
		RecolorTextAndRename("D.J KI!",Color3.fromRGB(0,0,100),Color3.fromRGB(0,0,150),"Arcade")
		chaosmode = false
		rainbowmode = false
		ENRAGE = false
		Global = false
		Shadow = false
		CORRUPTCHAOS = false
		newTheme("rbxassetid://514916695",0,1,5)
		ModeColor = BrickColor.new("Really blue")
		ModeColor2 = BrickColor.new("Navy blue")
	elseif k == "n" and attack == false and ModeOfDerpz == "Derpz?" then
		Global = true
		Shadow = true
		CORRUPTCHAOS = false
		ENRAAAAGE()

	elseif k == "m" and attack == false and ModeOfDerpz == "Flying!" then
		ENRAGE = false
		Global = true
		Shadow = false
		CORRUPTCHAOS = false
		Neutral()
		ITSNOTOVER()
	elseif k == "n" and attack == false and ModeOfDerpz == "Flying!" then
		ENRAGE = false
		Global = true
		Shadow = false
		CORRUPTCHAOS = false
		Neutral()
		ITSREALLYNOTOVER()
	elseif k == "n" and attack == false and ModeOfDerpz == "DJ" then
		ModeOfDerpz = "DJSTUPID"
		Happy()
		storehumanoidWS = 999
		hum.WalkSpeed = 999
		RecolorTextAndRename("what is ki doing...?",Color3.fromRGB(0,0,100),Color3.fromRGB(0,0,150),"Cartoon")
		chaosmode = false
		rainbowmode = false
		Global = false
		newTheme("rbxassetid://281136047",0,1,5)
		ModeColor = BrickColor.new("Hot pink")
		ModeColor2 = BrickColor.new("Pink")
		ENRAGE = false
		Shadow = false
		CORRUPTCHAOS = false
	elseif k == "n" and attack == false and ModeOfDerpz == "Serene" then
		ModeOfDerpz = "Interstellar"
		Happy()
		storehumanoidWS = 100
		hum.WalkSpeed = 100
		chaosmode = false
		rainbowmode = false
		ModeColor = BrickColor.new("Toothpaste")
		ModeColor2 = BrickColor.new("Really red")
		ENRAGE = false
		Global = false
		Shadow = false
		CORRUPTCHAOS = false
		newTheme("rbxassetid://166255269",0,1.02,5)
		RecolorTextAndRename("Interstellar Ki!",BrickColor.new("Really red").Color,BrickColor.new("Toothpaste").Color,"Arcade")
		Hmph()
		bosschatfunc("Hmph.",ModeColor2.Color,1)

	elseif k == "e" and attack == false and ModeOfDerpz ~= "Serene" then
		ModeOfDerpz = "Serene"
		Happy()
		storehumanoidWS = 20
		hum.WalkSpeed = 20
		chaosmode = false
		rainbowmode = false
		ModeColor = BrickColor.new("Toothpaste")
		ModeColor2 = BrickColor.new("Toothpaste")
		ENRAGE = false
		Global = false
		Shadow = false
		CORRUPTCHAOS = false
		newTheme("rbxassetid://2914547104",0,1.1,5)
		RecolorTextAndRename("Happy Ki.",BrickColor.new("Toothpaste").Color,BrickColor.new("Deep blue").Color,"Code")
	elseif k == "r" and attack == false and ModeOfDerpz ~= "Corrupt" then
		ModeOfDerpz = "Corrupt"
		Neutral()
		storehumanoidWS = 20
		hum.WalkSpeed = 20
		chaosmode = false
		rainbowmode = false
		ENRAGE = false
		Global = false
		Shadow = true
		CORRUPTCHAOS = false
		ModeColor = BrickColor.new("Maroon")
		ModeColor2 = BrickColor.new("Really red")
		newTheme("rbxassetid://466949705",0,1.02,5)
		RecolorTextAndRename("CoRrUpT_Ki.",BrickColor.new("Maroon").Color,BrickColor.new("Really red").Color,"SciFi")
	elseif k == "t" and attack == false and ModeOfDerpz ~= "Insane" then
		ModeOfDerpz = "Insane"
		Happy()
		storehumanoidWS = 20
		hum.WalkSpeed = 20
		chaosmode = true
		rainbowmode = false
		ENRAGE = false
		Global = false
		Insane()
		Shadow = true
		CORRUPTCHAOS = false
		ModeColor = BrickColor.new("Black")
		ModeColor2 = BrickColor.new("Black")
		newTheme("rbxassetid://623662713",0,1.02,5)
		RecolorTextAndRename("GLITCHY KI",BrickColor.random().Color,BrickColor.random().Color,"Code")
	elseif k == "y" and attack == false and ModeOfDerpz ~= "Divinitive" then
		ModeOfDerpz = "Divinitive"
		Happy()
		storehumanoidWS = 20
		hum.WalkSpeed = 20
		chaosmode = false
		rainbowmode = false
		ENRAGE = false
		Global = false
		Shadow = false
		CORRUPTCHAOS = false
		ModeColor = BrickColor.new("Deep blue")
		ModeColor2 = BrickColor.new("Cool yellow")
		newTheme("rbxassetid://381305433",0,1.02,5)
		RecolorTextAndRename("Divinitive Ki.",BrickColor.new("Navy blue").Color,BrickColor.new("Cool yellow").Color,"Code")
	elseif k == "b" and attack == false and ModeOfDerpz == "Flying!" then
		ModeOfDerpz = "Injustice"
		storehumanoidWS = 100
		hum.WalkSpeed = 100
		chaosmode = false
		rainbowmode = false
		ENRAGE = false
		Global = false
		Shadow = false
		CORRUPTCHAOS = false
		RecolorTextAndRename("INJUSTICE KI!", Color3.new(0, 0, 0), Color3.new(1, 1, 0, 1),"Fantasy","Panda Eyes - Colorblind")
		newTheme("rbxassetid://262402387", 0, 1, 4)
		ModeColor = BrickColor.new("Really black")
		ModeColor2 = BrickColor.new("Bright yellow")

	elseif k == "u" and attack == false and ModeOfDerpz ~= "Flying!" then
		ModeOfDerpz = "Flying!"
		Happy()
		storehumanoidWS = 100
		hum.WalkSpeed = 100
		chaosmode = false
		rainbowmode = false
		ENRAGE = false
		Global = false
		Shadow = false
		CORRUPTCHAOS = false
		ModeColor = BrickColor.new("Deep blue")
		ModeColor2 = BrickColor.new("Deep blue")
		newTheme("rbxassetid://343594081",0,1.02,5)
		RecolorTextAndRename("Airborne Ki!",BrickColor.new("Deep blue").Color,BrickColor.new("Really blue").Color,"Arcade")
	elseif k == "p" and attack == false and ModeOfDerpz ~= "FlyingRelax!" then
		ModeOfDerpz = "FlyingRelax!"
		storehumanoidWS = 100
		hum.WalkSpeed = 100
		chaosmode = false
		rainbowmode = false
		ENRAGE = false
		Global = false
		Shadow = false
		CORRUPTCHAOS = false
		ModeColor = BrickColor.new("Dark indigo")
		ModeColor2 = BrickColor.new("Navy blue")
		local randomsong = math.random(1,5)
		if randomsong == 1 then
			newTheme("rbxassetid://1369365817",0,1.02,10)
			Neutral()
		elseif randomsong == 2 then
			newThemeCust("rbxassetid://997948124",0,1,10)
			Happy()
		elseif randomsong == 3 then
			newTheme("rbxassetid://1145101566", 0.01, 1, 10)
			Upset()
		elseif randomsong == 4 then
			newTheme("rbxassetid://4576478128", 0, 1.01, 10)
			Neutral()
		elseif randomsong == 5 then
			newTheme("rbxassetid://585362578", 0.01, 1.02, 10)
			Happy()
		end
		RecolorTextAndRename("Very Relaxed Ki!",Color3.fromRGB(75,0,130),Color3.fromRGB(25,25,112),"Arcade")
	elseif k == "n" and attack == false and ModeOfDerpz == "Insane" then
		ModeOfDerpz = "Depressed"
		Upset()
		storehumanoidWS = 7
		hum.WalkSpeed = 7
		chaosmode = false
		rainbowmode = false
		ENRAGE = false
		Global = false
		Shadow = true
		CORRUPTCHAOS = false
		ModeColor = BrickColor.new("Navy blue")
		ModeColor2 = BrickColor.new("Black")
		newTheme("rbxassetid://381916526",0,0.82,5)
		RecolorTextAndRename("Upset Ki",BrickColor.new("Deep blue").Color,BrickColor.new("Really blue").Color,"Code")
	elseif k == "b" and attack == false and ModeOfDerpz == "Depressed" then
		ModeOfDerpz = "SOLITUDE"
		Upset()
		storehumanoidWS = 10
		hum.WalkSpeed = 10
		chaosmode = false
		rainbowmode = false
		ENRAGE = false
		Global = false
		Shadow = true
		CORRUPTCHAOS = false
		ModeColor = BrickColor.new("Really black")
		ModeColor2 = BrickColor.new("Really red")
		newTheme("rbxassetid://723652641",0,0.9,4)
		RecolorTextAndRename("SolItUdIcAl Ki",BrickColor.new("Really black").Color,BrickColor.new("Really red").Color,"Garamond")

	elseif k == "n" and attack == false and ModeOfDerpz == "SOLITUDE" then
		stressintro()
		Upset()
		storehumanoidWS = 100
		hum.WalkSpeed = 100
		chaosmode = false
		rainbowmode = false
		ENRAGE = false
		Global = false
		Shadow = true
		CORRUPTCHAOS = false
		ModeColor = BrickColor.new("Really black")
		ModeColor2 = BrickColor.new("Really red")
		newTheme("rbxassetid://4641438921",0,0.9,4)
		RecolorTextAndRename("STRESSED KI",BrickColor.new("Really black").Color,BrickColor.new("Really red").Color,"Garamond")

	elseif k == "m" and attack == false and ModeOfDerpz == "Insane" then
		ModeOfDerpz = "Genocidial"
		Insane()
		storehumanoidWS = 7
		hum.WalkSpeed = 7
		chaosmode = false
		rainbowmode = false
		ENRAGE = false
		Global = false
		Shadow = true
		CORRUPTCHAOS = false
		ModeColor = BrickColor.new("Black")
		ModeColor2 = BrickColor.new("Black")
		newTheme("rbxassetid://583415095",0,0.45,5)
		RecolorTextAndRename("...",BrickColor.new("Black").Color,BrickColor.new("Really red").Color,"Antique")
	elseif k == "f" and attack == false and ModeOfDerpz ~= "REVENGE" then
		ModeOfDerpz = "REVENGE"
		Upset()
		storehumanoidWS = 100
		hum.WalkSpeed = 100
		chaosmode = false
		rainbowmode = false
		ENRAGE = false
		Global = false
		Shadow = true
		CORRUPTCHAOS = false
		ModeColor = BrickColor.new("Black")
		ModeColor2 = BrickColor.new("Really red")
		newTheme("rbxassetid://844654533",0,1.05,5)
		RecolorTextAndRename("EXTREAMLY ENRAGED KI",BrickColor.new("Really red").Color,BrickColor.new("Black").Color,"SciFi")
	elseif k == "g" and attack == false and ModeOfDerpz ~= "RAINBOW" then
		ModeOfDerpz = "RAINBOW"
		Happy()
		storehumanoidWS = 100
		hum.WalkSpeed = 100
		chaosmode = false
		rainbowmode = true
		ENRAGE = false
		Global = false
		Shadow = false
		ModeColor = BrickColor.new("Deep blue")
		ModeColor2 = BrickColor.new("Navy blue")
		local rdm = math.random(1,2)
		if rdm == 1 then
			newTheme("rbxassetid://163180634",0,1.02,5)
		else
			newTheme("rbxassetid://581409031",0,1.02,5)
		end

		RecolorTextAndRename("Rainbow Ki!",BrickColor.new("Really red").Color,BrickColor.new("Black").Color,"SciFi")
	elseif k == "m" and attack == false and ModeOfDerpz == "Corrupt" then
		ModeOfDerpz = "EXTREMECORRUPT"
		storehumanoidWS = 10
		hum.WalkSpeed = 10
		chaosmode = false
		rainbowmode = false
		ENRAGE = false
		Global = false
		Shadow = true
		CORRUPTCHAOS = true
		ModeColor = BrickColor.new("Black")
		ModeColor2 = BrickColor.new("Really black")
		newTheme("rbxassetid://2330164404",0,0.95,5)
		RecolorTextAndRename("EÌ·Í ÍÌÌ¿ÌÌÌÌÌÌÌÍ ÍÌ½ÍÌÌ¹Ì±ÌÍÌ®Ì¥Ì¨Ì¢ÍÌ¯Ì¼ÍÌ¤Ì¢ÌÌÍxÌµÍÌ¢ÌºÍÌ¥ÌÍÌ¥Ì¦ÍÌ¨Ì®ÍÍÍÌ¹Ì¨Ì±tÌ¸ÍÌÍÌÌ¾ÌÌÌÌÌÌÌÍÍÍÍÌ½ÌÌÍÌÍÌÌÌÌ®Ì©Ì²Ì°ÍÌ¡Ì¬ÌÍÌÌÌ¼Ì­ÍÌ»Ì§ÌÌÍÍÍÌ¬Ì©Ì©ÌÌ¹rÌ¶ÌÌÌÍÌÍÍÍÌÍÍÌÍÌÍÌÌÌÌÌÍÍÍÌºÍÌ ÌºÍÍÌ»eÌµÍÍÌÍÍÌÍÌÌÌÍÍÍÌÌÍÌÍÌÌÌ¿ÍÌÌÍÌ¾ÌÍÌ±ÌÌÌ¼Ì¯ÌÌ­Ì°ÍÌ±ÌÍÌ Ì»ÌºaÌµÌÌÍÍÌ½ÍÌÍÌ³Ì¦Ì¨mÌ¶ÌÌÌÍÌ½ÌÌÍ ÌÍÍÍÌÍÍÌÌÍÌ¾ÌÌÌÌÍÍÌÌÌ²ÌºÌ²ÌªÌ¦Ì²ÍÌ ÍÌ¥Ì ÍÌ¢Ì¹Ì ÌªÌÌÍÌ»ÍlÌ¶ÌÍÍÍÍÍÌÍÌÌÌÌÍÍ ÌÌ¿Ì¿ÍÌÍÌÍÍÍÍÌÌÌ½ÌÍÍÍÌ©Ì§Ì»Ì®Ì¼Ì©ÍÍÌÍÌ§ÍÌyÌ¶ÍÌÌÌÌÌÌÍÍÌÍÍÌ¹Ì®ÌÌÍÌ¨ÌªÍÌ°Ì¥ÍÌÌ¡ÍÍ Ì·ÍÌÌÌÌ½ÍÌ¥Ì¹Ì±Ì¼ÌÌ°Ì®ÌÍÌÌ£ÌÌ©ÌÌ¡Ì§Ì®Ì±Ì®CÌ´ÍÌÌÌÌÌÌÍÌ¤Ì©ÍÌ¡ÍÌ¬Ì³Ì®Ì®Ì¥ÍÍÌÌÌ¹Ì®oÌ´ÍÌÍÌÌ¿ÌÍÌÌÌÌÍÌÌÌÌÌÍÍÍÍÍÍÌ¾ÌÌÍÍÌ«Ì®ÍÍÌrÌ´ÌÌ½ÌÌÌÌÌÌÌÍ ÍÍÍÌÍÌÌ¿ÌÌÍÍÍÍÌ¦ÌÌ°Ì¹ÌÌ¡ÍÌ°ÍÍÍÌ»Ì±Ì°ÍÍÍÍÌªÌ¤ÍÍÌÌÌÌ³Ì­Ì±rÌ·ÍÍÌÌ»ÍÌ¤ÍÌÌ¦ÍÌ»Ì¯ÍÍÍÍÍuÌ´ÌÌÌÌÍÌÍÍÍÍÍÌÌÍ ÌÍÍÌ¾ÍÍÌÍÍÌÍÍÌÍÍÍÌªÌ ÌÌÍpÌµÍÍÍÌÍÍÌÌÌÌÌÌÌÍÌÌÍÌÍÌ½ÍÍÌÍÍÌÍÌÍÌÌ¯Ì¯Ì¼ÍÌ¢tÌ¸ÍÌÍÌÍÍÍÍÌÍÍÍÌÌÌ¿ÍÍÍÍÌ¯Ì«eÌ¸ÌÌÍÌÌÌÌÌÍ ÌÍÍÌÌ¿ÌÍÌÌÌÍÍÌÍÍÌÍÍÌÌÌÌ¦Ì°Ì Ì»ÌÌºÌ¨Ì²Ì¦Ì§ÍÍÍÌÌ¡Ì¹dÌ·ÌÌÍ ÌÌÌÌÌÍ Ì»ÌÌÍÌºÌ«ÍÌ«Ì°ÍÌ­ÍÌ©Ì£ÌÌ¼ÌÌ¢ÍÍÌ¥Ì¼ÍÌ» Ì¸ÌÌÌÌÌÌÍÌÌ½ÍÌÌÌÌÌÍÍÍÌÍ ÍÌ¾ÍÍÍÌÌÌÌÌÌ²Ì¼ÍÍÌ©Ì°Ì¢ÍKÌ¸ÍÌÌ¾ÍÍÌÍÍÌÌÌÌÌÌÌÌÌ½ÌÍÌ¿ÍÌÌ¢iÌ¸ÌÌÌ¿ÌÍÌÌÍÌÍÌÍÌÍÌÍÌÍÌÌÌÌÍÌÍÌÌÌ£ÍÌÌ¼ÍÌ¡Ì©Ì»Ì±ÍÌÍÌÌÍÌ£Ì«Ì¨ÌÍÍÌÌ Í",BrickColor.new("Really red").Color,BrickColor.new("Black").Color,"Antique")
	elseif k == "m" and attack == false and ModeOfDerpz == "RAINBOW" then
		ModeOfDerpz = "Festivity"
		storehumanoidWS = 20
		hum.WalkSpeed = 20
		chaosmode = false
		rainbowmode = false
		ENRAGE = false
		Global = false
		Shadow = false
		CORRUPTCHAOS = false
		Happy()
		ModeColor = BrickColor.new("Black")
		ModeColor2 = BrickColor.new("Really black")
		newTheme("rbxassetid://862258091",0,1.02,5)
		RecolorTextAndRename("XMas Ki",BrickColor.new("Really red").Color,BrickColor.new("Black").Color,"Antique")
	end
	if k == "n" and attack == false and ModeOfDerpz == "RAINBOW" then
		ModeOfDerpz = "Sleepy"
		storehumanoidWS = 0
		hum.WalkSpeed = 0
		chaosmode = false
		rainbowmode = false
		ENRAGE = false
		Global = false
		Shadow = false
		CORRUPTCHAOS = false
		Sleeping()
		ModeColor = BrickColor.new("Navy blue")
		ModeColor2 = BrickColor.new("Deep blue")
		newTheme("rbxassetid://862258091",0,1.02,5)
		RecolorTextAndRename("Sleepy k..i...",BrickColor.new("Really blue").Color,BrickColor.new("Black").Color,"Arcade")
	end
	if k == "h" and attack == false and ModeOfDerpz ~= "Powered" then
		ModeOfDerpz = "Powered"
		storehumanoidWS = 50
		hum.WalkSpeed = 50
		chaosmode = false
		rainbowmode = false
		ENRAGE = false
		Global = false
		Shadow = false
		CORRUPTCHAOS = false
		Neutral()
		ModeColor = BrickColor.new("Deep blue")
		ModeColor2 = BrickColor.new("Navy blue")
		newTheme("rbxassetid://2685427316",0,1.02,5)
		RecolorTextAndRename("Sovereigned Ki.",BrickColor.new("Really blue").Color,BrickColor.new("Deep blue").Color,"SciFi")
	end
	if k == "j" and attack == false and ModeOfDerpz ~= "meme" then
		ModeOfDerpz = "meme"
		storehumanoidWS = 400
		hum.WalkSpeed = 400
		chaosmode = false
		rainbowmode = false
		ENRAGE = false
		Global = false
		Shadow = false
		CORRUPTCHAOS = false
		CuteMeme()
		ModeColor = BrickColor.new("Pink")
		ModeColor2 = BrickColor.new("Pink")
		newTheme("rbxassetid://3727388982",0,1.01,10)
		RecolorTextAndRename("ki",BrickColor.new("Pink").Color,BrickColor.new("Pink").Color,"Cartoon")
	end
	if k == "m" and attack == false and ModeOfDerpz == "meme" then
		ModeOfDerpz = "sans"
		storehumanoidWS = 400
		hum.WalkSpeed = 400
		rainbowmode = false
		chaosmode = false
		RecolorTextAndRename([[sans ki                                          Thank you for focing this to happen ]], BrickColor.new("Cyan").Color, BrickColor.new("Cyan").Color,"Arcade","TheFatRat - Unity?")
		local rdm = math.random(1,2)
		if rdm == 1 then
			newTheme("rbxassetid://3368520702", 0.01, 1, 10)
		elseif rdm == 2 then
			newTheme("rbxassetid://4951534350", 0.01, 1, 10)
			RecolorTextAndRename([[Coffin Dance Ki]], BrickColor.new("Cyan").Color, BrickColor.new("Cyan").Color,"Arcade","Astronomia - Coffin Dance")
		end
		chaosmode = false
		rainbowmode = false
		ENRAGE = false
		Global = false
		Shadow = false
		CORRUPTCHAOS = false
		CuteMeme()
		ModeColor = BrickColor.new("Cyan")
		ModeColor2 = BrickColor.new("Cyan")

	end
	if k == "k" and attack == false and ModeOfDerpz ~= "Fighter" then
		ModeOfDerpz = "Fighter"
		storehumanoidWS = 20
		hum.WalkSpeed = 20
		chaosmode = false
		rainbowmode = false
		ENRAGE = false
		Global = false
		Shadow = true
		CORRUPTCHAOS = false
		Upset()
		ModeColor = BrickColor.new("Navy blue")
		ModeColor2 = BrickColor.new("White")
		newTheme("rbxassetid://2776462258",0,1.01,5)
		RecolorTextAndRename("Fighter Ki",BrickColor.new("Navy blue").Color,BrickColor.new("Black").Color,"Cartoon")
	end
	if k == "v" and attack == false and ModeOfDerpz == "Fighter" then
		attack = true
		newbosschatfunc("I'm Just A Ghost Possesing an Animatronic fox Lookin to kick Some ###, Whats Wrong with that Eh?",BrickColor.new("Royal purple").Color,BrickColor.new("Neon orange").Color,230)
		for i = 0,20,0.1 do

			swait()
			local Alpha = .3
			RootJoint.C0 = RootJoint.C0:lerp(cf(-0.3,0,-0.2)*angles(math.rad(0),math.rad(-79.5),math.rad(0))*RootCF,Alpha)
			LH.C0 = LH.C0:lerp(cf(-1,-1,0)*angles(math.rad(0),math.rad(0),math.rad(0))*angles(math.rad(0),math.rad(-90),math.rad(0)),Alpha)
			RH.C0 = RH.C0:lerp(cf(0.9,-1,0.4)*angles(math.rad(0),math.rad(-45),math.rad(0))*angles(math.rad(0),math.rad(90),math.rad(0)),Alpha)
			LW.C0 = LW.C0:lerp(cf(-1.5,0.5,0)*angles(math.rad(-2.9),math.rad(-6.8),math.rad(-88.4)),Alpha)
			RW.C0 = RW.C0:lerp(cf(1.3,0.3,0)*angles(math.rad(44.8),math.rad(-36.3),math.rad(-6.6)),Alpha)
			Torso.Neck.C0 = Torso.Neck.C0:lerp(cf(-0.1,0,0)*angles(math.rad(0),math.rad(71.1),math.rad(0))*necko,Alpha)
		end
		attack = false
	end
	if k == "m" and attack == false and ModeOfDerpz == "Powered" then
		attack = true
		ModeOfDerpz = "Powered+"
		storehumanoidWS = 70
		hum.WalkSpeed = 70
		chaosmode = false
		rainbowmode = false
		ENRAGE = false
		Global = false
		Shadow = true
		CORRUPTCHAOS = false
		Neutral()
		ModeColor = BrickColor.new("Really blue")
		ModeColor2 = BrickColor.new("Really black")
		newTheme("rbxassetid://1537276744",0,1.1,5)
		RecolorTextAndRename([[/*-.TRULY SOVEREIGNED KI!-*\]],BrickColor.new("Really black").Color,BrickColor.new("Really blue").Color,"SciFi")
		attack = false
		wait(1)
	elseif k == "m" and attack == false and ModeOfDerpz == "Powered+" then
		ModeOfDerpz = "Ultimate"
		storehumanoidWS = 70
		hum.WalkSpeed = 70
		chaosmode = false
		rainbowmode = false
		ENRAGE = false
		Global = false
		Shadow = true
		CORRUPTCHAOS = false
		Neutral()
		ModeColor = BrickColor.new("Really blue")
		ModeColor2 = BrickColor.new("Really black")
		newTheme("rbxassetid://1276814239",0,1.02,10) 
		RecolorTextAndRename("*-.ULTIMATE KI!.-*",BrickColor.new("Really black").Color,BrickColor.new("Really blue").Color,"SciFi")
	elseif k == "m" and attack == false and ModeOfDerpz == "Ultimate" then
		ModeOfDerpz = "TrueUlti"
		storehumanoidWS = 70
		hum.WalkSpeed = 70
		chaosmode = false
		rainbowmode = false
		ENRAGE = false
		Global = false
		Shadow = false
		CORRUPTCHAOS = false
		Neutral()
		ModeColor = BrickColor.new("Really blue")
		ModeColor2 = BrickColor.new("Really black")
		newTheme("rbxassetid://1464474710",0,1.02,10)
		RecolorTextAndRename("'.-*TRULY ULTIMATE KI*-.-'",BrickColor.new("Really black").Color,BrickColor.new("Really blue").Color,"SciFi")

	end

	------Attacks!
	if k == "b" and attack == false and ModeOfDerpz == "REVENGE" then
		RemindedOfIRLBully()
	end
	if k == "b" and attack == false and ModeOfDerpz == "Fighter" then
		YouFightLikeAPRFan()
	end
	if k == "b" and attack == false and ModeOfDerpz == "Insane" then
		SPECIALInsaneDerpz()
	end
	if k == "b" and attack == false and ModeOfDerpz == "Derpz?" then
		ScytheMode()
	end
	if k == "z" and attack == false and ModeOfDerpz == "Derpz?" then
		varidash()
	end
	if k == "z" and attack == false and ModeOfDerpz == "Derpz?" then
		BURNINHELL()
	end
	if k == "v" and attack == false and ModeOfDerpz == "Depressed" then
		ICANTTAKEITANYMORE()
	end
	if k == "8" and attack == false then
		warnedpeople("This is a test","Bodoni",BrickColor.new("Navy blue").Color,Color3.new(0,0,0))
	end
	if k == "9" and attack == false then
		BossChatFuncTop("This is a test","Bodoni",BrickColor.new("Navy blue").Color,Color3.new(0,0,0))
	end
end)
ah = false
--Upper-head Shadow by IgnorantRojo
--FHead = Character.xHead.FaceShadow


plr.Chatted:connect(function(message)
	if ModeOfDerpz == "DJ" then
		if message:sub(1,3) == "id/" then

			newTheme("rbxassetid://"..message:sub(4),0,1.02,5)
			kan.TimePosition = 0
			kan:Play()
		elseif message:sub(1,6) == "pitch/" then
			ORPIT = message:sub(7)
		elseif message:sub(1,4) == "vol/" then
			ORVOL = message:sub(5)
		elseif message:sub(1,7) == "skipto/" then
			kan.TimePosition = message:sub(8)
		end
	end
end)
transp=0
e=Instance.new("Folder",char)
e.Name = "Effects"
function EffectBoi(par,color,CF,x,y,z,x1,y1,z1,de,mtyp,typ,rad,id,min,max,qu)
	local ex=Create("Part"){
		Size=Vector3.new(.2,.2,.2),
		BrickColor=BrickColor.new(color),
		CanCollide=false,
		Material="Neon",
		Anchored=true,
		Parent=par,
		Transparency=transp}
	NoOutline(ex)
	ex.CFrame=CF
	local exe=Create("SpecialMesh"){
		Scale=Vector3.new(x,y,z),
		MeshType=mtyp,
		Parent=ex}
	if mtyp=="FileMesh"and id~=""then
		exe.MeshId="rbxassetid://"..id
	end
	game:GetService("Debris"):AddItem(ex,10)
	local ez=ex.CFrame
	local nu=0
	local no=math.random()-math.random()
	coroutine.resume(coroutine.create(function()
		for i=transp,1.01,de do
			swait()
			if typ~=5 then
				ex.Transparency=i
			end
			exe.Scale=exe.Scale+Vector3.new(x1,y1,z1)
			if typ==1 then
				ex.CFrame=ex.CFrame*CFrame.Angles(math.random(-360,360),math.random(-360,360),math.random(-360,360))
			elseif typ==2 then
				ex.CFrame=ex.CFrame*CFrame.Angles(0,math.rad(rad),0)
			elseif typ==3 then
				ex.CFrame=ex.CFrame*CFrame.new(0,0,rad)
			elseif typ==4 then
				nu=nu+no
				ez=ez*CFrame.new(0,math.random(min,max)/qu,0)
				ex.CFrame=ez*CFrame.Angles(nu,0,0)
				--ex.CFrame=ex.CFrame
			elseif typ==7 then
				ex.CFrame=ez*CFrame.new(0,0,rad*i)
				ex.CFrame=ex.CFrame*CFrame.Angles(math.random(-360,360),math.random(-360,360),math.random(-360,360))
			end
		end
		ex:Remove()
	end))
	return ex
end
--fakehead = Character.xHead
Humanoid.Name = "DERPZDENUGGET'S DERPZ GLITCH-SWITCH"
Humanoid.MaxHealth = math.huge
Humanoid.Health = math.huge
Instance.new("ForceField",char).Visible = false

--------------------------------------

-------------------------------------
Neutral()
idleanim=.4
while true do

	Humanoid.MaxHealth = math.huge
	Humanoid.Health = math.huge
	Humanoid.JumpPower = 130
	if Hue > 360 or Hue == 0 then
		Hue = 0
	end
	Hue = Hue + 1
	if CORRUPTCHAOS == true then
		rdm = math.random(0,4)
		if rdm == 1 then
			Neutral()
		elseif rdm == 2 then
			Happy()
		elseif rdm == 3 then
			Upset()
		elseif rdm == 4 then
			Insane()
		elseif rdm == 0 then
			Determined()
		end
	else
	end


	if ModeOfDerpz == "SOLITUDE" and attack == false then

		revolver.Transparency = 0


	elseif ModeOfDerpz ~= "SOLITUDE" and attack == false  then

		revolver.Transparency = 1
	end

	if ModeOfDerpz ~= "FullyEnragedJake" and attack == false then
		scythetrans(1)
	elseif ModeOfDerpz ~= "Transforming"  then
		scythetrans(1)
	end
	if Shadow == true then
		--FHead.Transparency = 0.2
	elseif Shadow == false then
		--FHead.Transparency = 1
	end
	if Shadow == true and chaosmode ~= true and ModeOfDerpz ~= "Determined" and ModeOfDerpz ~= "Genocidial" and attack ~= true then

		--Eye1.BrickColor = BrickColor.new("Really red")
		--Eye2.BrickColor = BrickColor.new("Really red")
	elseif Shadow == false and chaosmode ~= true and ModeOfDerpz ~= "Determined" and attack ~= true and ModeOfDerpz ~= "Genocidial" then

		--Eye1.BrickColor = BrickColor.new("Bright green")
		--Eye2.BrickColor = BrickColor.new("Bright green")
	elseif Shadow == true and chaosmode ~= false and ModeOfDerpz == "Determined" then

		--Eye1.BrickColor = BrickColor.new("Really red")
		--Eye2.BrickColor = BrickColor.new("Really red")

	elseif ModeOfDerpz == "Genocidial" then

		--Eye1.BrickColor = BrickColor.new("Black")
		--Eye2.BrickColor = BrickColor.new("Black")
	end
	if Global == false then
		kan.Parent = tors
		kan.RollOffMode = "Inverse"
		kan.MaxDistance = 100000
	elseif Global == true then
		kan.Parent = char
		kan.RollOffMode = "LinearSquare"
		kan.MaxDistance = 100000
	end
	if mutedtog == false then
		kan.Volume = ORVOL
	elseif mutedtog == true then
		kan.Volume = 0
	end
	kan.Looped = true
	kan.Parent = tors
	kan:Resume()
	if chaosmode == false  then

		for i = 1,#visualae do
		end
	else
		for i = 1,#visualae do
		end

		---------------------------------------------
	end
	CameraManager()
	swait()
	sine = sine + change
	local torvel=(RootPart.Velocity*Vector3.new(1,0,1)).magnitude 
	local velderp=RootPart.Velocity.y
	hitfloor,posfloor=rayCast(RootPart.Position,(CFrame.new(RootPart.Position,RootPart.Position - Vector3.new(0,1,0))).lookVector,4,Character)
	coroutine.resume(coroutine.create(function()
		for i, v in pairs(m:GetChildren()) do
			if v:IsA("BasePart") then
				v.BrickColor = ModeColor
				v.Transparency = 0
			elseif v:IsA("ParticleEmitter") then
				v.Color = ColorSequence.new(ModeColor.Color,ModeColor2.Color)
			end
		end
		for i, v in pairs(M1:GetChildren()) do
			if v:IsA("BasePart") then
				v.BrickColor = ModeColor2
				v.Transparency = 0
			elseif v:IsA("ParticleEmitter") then
				v.Color = ColorSequence.new(ModeColor.Color,ModeColor2.Color)
			end
		end
		if ENRAGE == true then
			script.Core.Core.ColorChange.Color = Color3.new(math.random(0,1),0,0)
			script.Core.Core.ColorChange2.Color = Color3.new(math.random(0,1),0,0)
			for i, v in pairs(m:GetChildren()) do
				if v:IsA("BasePart") then
					v.Color = Color3.new(math.random(0,1),0,0)
				end
			end
			for i, v in pairs(M1:GetChildren()) do
				if v:IsA("BasePart") then
					v.Color = Color3.new(math.random(0,1),0,0)
				end
			end
		elseif rainbowmode == true and ModeOfDerpz == "RAINBOW" then
			script.Core.Core.ColorChange.Color = Color3.new(r/255,g/255,b/255)
			script.Core.Core.ColorChange2.Color = Color3.new(r/255,g/255,b/255)
			RecolorTextAndRename("Varicolored Derpz!",Color3.new(r/255,g/255,b/255),Color3.new(r/500,g/500,b/500),"Arcade")
			for i, v in pairs(m:GetChildren()) do
				if v:IsA("BasePart") then
					v.Color = Color3.new(r/255,g/255,b/255)
					v.Transparency = 0.4
				end
			end
			for i, v in pairs(M1:GetChildren()) do
				if v:IsA("BasePart") then
					v.Color = Color3.new(r/255,g/255,b/255)
					v.Transparency = 0.4
				end
			end
		elseif ModeOfDerpz == "Festivity" then
			script.Core.Core.ColorChange.Color = Color3.fromHSV(Hue/360,1,math.min(kan.PlaybackLoudness/500,1))
			script.Core.Core.ColorChange2.Color = Color3.fromHSV(Hue/360,1,math.min(kan.PlaybackLoudness/500,1))
			RecolorTextAndRename("Festivity Derpz!",Color3.fromHSV(Hue/360,1,math.min(kan.PlaybackLoudness/500,1)),Color3.new(0,0,0.5),"Arcade")
			for i, v in pairs(m:GetChildren()) do
				if v:IsA("BasePart") then
					v.Color = Color3.fromHSV(Hue/360,1,math.min(kan.PlaybackLoudness/500,1))
				end
			end
			for i, v in pairs(M1:GetChildren()) do
				if v:IsA("BasePart") then
					v.Color = Color3.fromHSV(Hue/360,1,math.min(kan.PlaybackLoudness/500,1))
				end
			end
		end
		if chaosmode == true then
			RecolorTextAndRename("GlItChY Ki...",BrickColor.random().Color,BrickColor.random().Color,"Code")
			for i, v in pairs(m:GetChildren()) do
				if v:IsA("BasePart") then
					v.BrickColor = BrickColor.random()
				elseif v:IsA("ParticleEmitter") then
					v.Color = ColorSequence.new(ModeColor.Color,ModeColor2.Color)
				end
			end
			for i, v in pairs(M1:GetChildren()) do
				if v:IsA("BasePart") then
					v.BrickColor = BrickColor.random()
					v.Transparency = 0.50
				elseif v:IsA("ParticleEmitter") then
					v.Color = ColorSequence.new(ModeColor.Color,ModeColor2.Color)
				elseif chaosmode == false then
					for i, v in pairs(m:GetChildren()) do
						if v:IsA("BasePart") then
							v.BrickColor = ModeColor
						end
					end
					for i, v in pairs(M1:GetChildren()) do
						if v:IsA("BasePart") then
							v.BrickColor = ModeColor2

						end
					end
				end
			end
		end

		if ModeOfDerpz == "Flying!" or ModeOfDerpz == "Injustice" or ModeOfDerpz == "DETERMINED" or ModeOfDerpz == "Powered" or ModeOfDerpz == "Powered+" or ModeOfDerpz == 62 or ModeOfDerpz == 82 or ModeOfDerpz == 23 or ModeOfDerpz == 14 or ModeOfDerpz == 24 or ModeOfDerpz == 34 or ModeOfDerpz == 44 or ModeOfDerpz == 54 or ModeOfDerpz == 64 or ModeOfDerpz == 65 or ModeOfDerpz == 85 or ModeOfDerpz == "Unbeatable" then
			if hitfloor ~= nil then
				effar.Enabled = true
				effar.Color = ColorSequence.new(ModeColor.Color)
				slash(math.random(50,100)/10,5,true,"Round","Add","Out",root.CFrame*CFrame.new(0,-3,0)*CFrame.Angles(math.rad(math.random(-5,5)),math.rad(math.random(-360,360)),math.rad(math.random(-5,5))),vt(0.01,0.01,0.01),math.random(5,50)/250,ModeColor)
			elseif hitfloor == nil then
				effar.Enabled = false
			end

		elseif ModeOfDerpz == "REVENGE" then
			if hitfloor ~= nil  and ah == false then
				effar.Enabled = true
				EffectBoi(e,"Maroon",Head.CFrame*CFrame.new(.2,.2,-.5)*CFrame.Angles(-math.rad(90+math.random(-12,12)),math.rad(math.random(-12,12)),math.random(-120,120)),2,2,2,-.06,-.06,-.06,.03,"Sphere",7,2,"")

				Handle2weld.C1 = clerp(Handle2weld.C1,cf(2.5,2,0.5 + 0.1 * math.cos(sine / 30))*angles(math.rad(0),math.rad(360 * math.cos(sine / 100)),math.rad(0 * math.cos(sine / 10))),.1)
				Handleweld.C1 = clerp(Handleweld.C1,cf(-2.5,2,0.5 + 0.1 * math.cos(sine / 30))*angles(math.rad(0),math.rad(360 * math.cos(sine / 100)),math.rad(0 * math.cos(sine / 10))),.1)
			elseif ah == true and hitfloor ~= nil then
				effar.Enabled = true

				Handle2weld.C1 = clerp(Handle2weld.C1,cf(2.5,4,-10 + 0.1 * math.cos(sine / 30))*angles(math.rad(0),math.rad(50 * math.cos(sine / 100)),math.rad(0 * math.cos(sine / 10))),.1)
				Handleweld.C1 = clerp(Handleweld.C1,cf(-2.5,2,-10 + 0.1 * math.cos(sine / 30))*angles(math.rad(0),math.rad(-50 * math.cos(sine / 100)),math.rad(0 * math.cos(sine / 10))),.1)

			end
		elseif ModeOfDerpz == "EXTREMECORRUPT" then
			if hitfloor ~= nil then
				Handle2weld.C1 = clerp(Handle2weld.C1,cf(1+ math.random(-1,1),-1.12+ math.random(-1,1),1.1+ 0.3 * math.cos(sine / 50)+ math.random(-1,1))*angles(math.rad(-90+ math.random(-7,7)),math.rad(16 * math.cos(sine / 50)+ math.random(-7,7)),math.rad(-16 * math.cos(sine / 50)+ math.random(-7,7))),.1)
				Handleweld.C1 = clerp(Handleweld.C1,cf(-1+ math.random(-1,1),-1.12+ math.random(-1,1),1.1+ 0.3 * math.cos(sine / 50)+ math.random(-1,1))*angles(math.rad(-90+ math.random(-7,7)),math.rad(-16 * math.cos(sine / 50)+ math.random(-7,7)),math.rad(16 * math.cos(sine / 50)+ math.random(-7,7))),.1)
				--+ math.random(-7,7)
			end
		elseif ModeOfDerpz == "Sleepy" then
			if hitfloor ~= nil then
				Handle2weld.C1 = clerp(Handle2weld.C1,cf(1,-1.12,1.1+ 0.3 * math.cos(sine / 50))*angles(math.rad(-90),math.rad(16),math.rad(-16)),.1)
				Handleweld.C1 = clerp(Handleweld.C1,cf(-1,-1.12,1.1+ 0.3 * math.cos(sine / 50))*angles(math.rad(-90),math.rad(-16),math.rad(16)),.1)

			end
		elseif ModeOfDerpz ~= 5 or ModeOfDerpz ~= 7 or ModeOfDerpz ~= 8 or ModeOfDerpz ~= 62 or ModeOfDerpz ~= 82 or ModeOfDerpz ~= 23 or ModeOfDerpz ~= 14 or ModeOfDerpz ~= 24 or ModeOfDerpz ~= 34 or ModeOfDerpz ~= 44 or ModeOfDerpz ~= 54 or ModeOfDerpz ~= 64 or ModeOfDerpz ~= 65 or ModeOfDerpz ~= 85 then
			effar.Enabled = false
			Handle2weld.C1 = clerp(Handle2weld.C1,cf(1,-1.12,1.1+ 0.3 * math.cos(sine / 50))*angles(math.rad(-90),math.rad(16 * math.cos(sine / 50)),math.rad(-16 * math.cos(sine / 50))),.1)
			Handleweld.C1 = clerp(Handleweld.C1,cf(-1,-1.12,1.1+ 0.3 * math.cos(sine / 50))*angles(math.rad(-90),math.rad(-16 * math.cos(sine / 50)),math.rad(16 * math.cos(sine / 50))),.1)
		end
	end))
	--nad.Text = modet.Text
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
				Handle2weld.C1 = clerp(Handle2weld.C1,cf(1,-1.12,1.1 + 0.1 * math.cos(sine / 10))*angles(math.rad(-90),math.rad(-25 * math.cos(sine / 10)),math.rad(-16 * math.cos(sine / 10))),.1)
				Handleweld.C1 = clerp(Handleweld.C1,cf(-1,-1.12,1.1 + 0.1 * math.cos(sine / 10))*angles(math.rad(-90),math.rad(25 * math.cos(sine / 10)),math.rad(16 * math.cos(sine / 10))),.1)

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
				Handle2weld.C1 = clerp(Handle2weld.C1,cf(1,-1.12,1.1+ 0.3 * math.cos(sine / 50))*angles(math.rad(-60),math.rad(16 * math.cos(sine / 10)),math.rad(-16 * math.cos(sine / 10))),.1)
				Handleweld.C1 = clerp(Handleweld.C1,cf(-1,-1.12,1.1+ 0.3 * math.cos(sine / 50))*angles(math.rad(-60),math.rad(-16 * math.cos(sine / 10)),math.rad(16 * math.cos(sine / 10))),.1)

				RH.C0=clerp(RH.C0,cf(1,-0.35 - 0.05 * math.cos(sine / 25),-0.75)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-5),math.rad(0),math.rad(-20)),.1)
				LH.C0=clerp(LH.C0,cf(-1,-1 - 0.05 * math.cos(sine / 25),0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-5),math.rad(0),math.rad(20)),.1)
				RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0 + 0.05 * math.cos(sine / 25))*angles(math.rad(10 + 5 * math.cos(sine / 15)),math.rad(0),math.rad(0)),.1)
				Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(30 + 10 * math.cos(sine / 25)),math.rad(0),math.rad(0)),.1)
				RW.C0=clerp(RW.C0,cf(1.45,0.5 + 0.1 * math.cos(sine / 25),0)*angles(math.rad(-40),math.rad(0 - 10 * math.cos(sine / 25)),math.rad(90)),.1)
				LW.C0=clerp(LW.C0,cf(-1.45,0.5 + 0.1 * math.cos(sine / 25),0)*angles(math.rad(-40),math.rad(0 + 10 * math.cos(sine / 25)),math.rad(-90)),.1)
			end
		elseif torvel<1 and hitfloor~=nil then
			Anim="Idle"
			if attack==false then

				if ModeOfDerpz == "Derpz?" then
					local Alpha = .3
					RootJoint.C0 = RootJoint.C0:lerp(cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0))*RootCF,Alpha)
					LH.C0 = LH.C0:lerp(cf(-1,-1,0)*angles(math.rad(0),math.rad(0),math.rad(0))*angles(math.rad(0),math.rad(-90),math.rad(0)),Alpha)
					RH.C0 = RH.C0:lerp(cf(0.8,-1,0.4)*angles(math.rad(0),math.rad(-53.2),math.rad(0))*angles(math.rad(0),math.rad(90),math.rad(0)),Alpha)
					LW.C0 = LW.C0:lerp(cf(-1.4,0.2,-0.1)*angles(math.rad(51.7),math.rad(-11.5),math.rad(14.2)),Alpha)
					RW.C0 = RW.C0:lerp(cf(1.6,0.5,-0.2)*angles(math.rad(28.1),math.rad(28.8),math.rad(-14.4)),Alpha)
					Torso.Neck.C0 = Torso.Neck.C0:lerp(cf(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0))*necko,Alpha)
				elseif ModeOfDerpz == "FlyingRelax!" then
					RH.C0=clerp(RH.C0,cf(1,-1,-0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-3),math.rad(0 + 13 * math.cos(sine / 85)),math.rad(14 - 25 * math.cos(sine / 81))),.1)
					LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-3),math.rad(0 - 13 * math.cos(sine / 95)),math.rad(-15 + 29 * math.cos(sine / 95))),.1)
					RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,6 + 0.5 * math.cos(sine / 85))*angles(math.rad(-65 + 25 * math.cos(sine / 123)),math.rad(0),math.rad(0)),.1)
					Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(30 - 1 * math.cos(sine / 0.5265)),math.rad(0 - 1 * math.cos(sine / 0.25)),math.rad(0 - 1 * math.cos(sine / 0.465))),.1)
					RW.C0=clerp(RW.C0,cf(1.3,0.5,0)*angles(math.rad(180),math.rad(-90),math.rad(15))*angles(math.rad(-35),0,0)*angles(math.rad(10 + 2.5 * math.cos(sine / 0.252)),math.rad(0 + 2.5 * math.cos(sine / 0.123)),math.rad(5 + 2.5 * math.cos(sine / 0.6)))*angles(0,math.rad(0 - 15 * math.cos(sine / 0.25)),math.rad(0 - 15 * math.cos(sine / 0.465))),.1)
					LW.C0=clerp(LW.C0,cf(-1.3,0.5,0)*angles(math.rad(180),math.rad(90),math.rad(-15))*angles(math.rad(-35),0,0)*angles(math.rad(10 + 2.5 * math.cos(sine / 0.568)),math.rad(0 + 2.5 * math.cos(sine / 0.664)),math.rad(-5 + 2.5 * math.cos(sine / 0.23)))*angles(0,math.rad(0 - 15 * math.cos(sine / 0.25)),math.rad(0 - 15 * math.cos(sine / 0.465))),.1)
				elseif ModeOfDerpz == "Serene" then
					RH.C0=clerp(RH.C0,cf(1,-1 - 0.05 * math.cos(sine / 28),0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-7.5),math.rad(0),math.rad(0 - 2 * math.cos(sine / 34))),.1)
					LH.C0=clerp(LH.C0,cf(-1,-1 - 0.05 * math.cos(sine / 28),0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-2.5),math.rad(0),math.rad(0 + 2 * math.cos(sine / 34))),.1)
					RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0 + 0.02 * math.cos(sine / 34),0 + 0.05 * math.cos(sine / 28))*angles(math.rad(0 - 2 * math.cos(sine / 34)),math.rad(0),math.rad(0)),.1)
					Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(15 - 2.5 * math.cos(sine / 28)),math.rad(0 - 4 * math.cos(sine / 42)),math.rad(0 - 3 * math.cos(sine / 76))),.1)
					RW.C0=clerp(RW.C0,cf(0.8,0.5 + 0.1 * math.cos(sine / 28),-0.5)*angles(math.rad(0 - 0 * math.cos(sine / 39)),math.rad(0),math.rad(-70 - 0 * math.cos(sine / 47))),.1)
					LW.C0=clerp(LW.C0,cf(-0.85,0.5 + 0.1 * math.cos(sine / 28),-0.65)*angles(math.rad(40 - 1 * math.cos(sine / 34)),math.rad(0),math.rad(90 + 2.5 * math.cos(sine / 28))),.1)
				elseif ModeOfDerpz == "meme" then
					local Alpha = .3
					RootJoint.C0 = RootJoint.C0:lerp(cf(0.1,-0.3 + kan.PlaybackLoudness/1000,0)*angles(math.rad(-2.2),math.rad(-2.8),math.rad(-14.2 * math.cos(sine/10)))*RootCF,Alpha)
					LH.C0 = LH.C0:lerp(cf(-0.9,-0.8-kan.PlaybackLoudness/1000,-0.2)*angles(math.rad(-10),math.rad(0),math.rad(-4.6+14.2 * math.cos(sine/10)))*angles(math.rad(0),math.rad(-90),math.rad(0)),Alpha)
					RH.C0 = RH.C0:lerp(cf(1,-0.7-kan.PlaybackLoudness/1000,-0.2)*angles(math.rad(-13.3),math.rad(0),math.rad(10.4+14.2 * math.cos(sine/10)))*angles(math.rad(0),math.rad(90),math.rad(0)),Alpha)
					LW.C0 = LW.C0:lerp(cf(-1.4,0.3,0.2)*angles(math.rad(40 + kan.PlaybackLoudness/5),math.rad(26 * math.cos(sine/10)),math.rad(-14.1)),Alpha)
					RW.C0 = RW.C0:lerp(cf(1.5,0.4,0.1)*angles(math.rad(40 +kan.PlaybackLoudness/5),math.rad(-16.8 * math.cos(sine/10)),math.rad(10.5)),Alpha)
					Torso.Neck.C0 = Torso.Neck.C0:lerp(cf(0.3 * math.cos(sine/10),0,0.2)*angles(math.rad(-9.8),math.rad(0),math.rad(14.5 * math.cos(sine/10)))*necko,Alpha)
				elseif ModeOfDerpz == "Corrupt" then
					local snap = math.random(1,200)
					if snap == 1 then
						Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(25 + math.random(-1,1)),math.rad(math.random(-1,1)),math.rad(20 + math.random(-1,1))),0.6)
					end
					rotation = rotation + 5
					poste = 4
					ono = ono + 0.1 * math.cos(sine/20)
					sphere2(8,"Add",root.CFrame*CFrame.Angles(math.rad(90),0,math.rad(rotation))*CFrame.new(0,poste,0),vt(1,1,1),-0.05,-0.05,-0.05,ModeColor)
					sphere2(8,"Add",root.CFrame*CFrame.Angles(math.rad(90),0,math.rad(180 + rotation))*CFrame.new(ono,poste,0),vt(1,1,1),-0.05,-0.05,-0.05,ModeColor)
					sphere2(8,"Add",root.CFrame*CFrame.Angles(math.rad(90),0,math.rad(-rotation))*CFrame.new(0,poste,0),vt(1,1,1),-0.05,-0.05,-0.05,ModeColor)
					sphere2(8,"Add",root.CFrame*CFrame.Angles(math.rad(90),0,math.rad(180 - rotation))*CFrame.new(ono,poste,0),vt(1,1,1),-0.05,-0.05,-0.05,ModeColor)
					sphere2(8,"Add",root.CFrame*CFrame.Angles(math.rad(90),0,math.rad(90 + rotation))*CFrame.new(0,poste,0),vt(1,1,1),-0.05,-0.05,-0.05,ModeColor2)
					sphere2(8,"Add",root.CFrame*CFrame.Angles(math.rad(90),0,math.rad(90 - rotation))*CFrame.new(ono,poste,0),vt(1,1,1),-0.05,-0.05,-0.05,ModeColor2)
					sphere2(8,"Add",root.CFrame*CFrame.Angles(math.rad(90),0,math.rad(270 + rotation))*CFrame.new(0,poste,0),vt(1,1,1),-0.05,-0.05,-0.05,ModeColor2)
					sphere2(8,"Add",root.CFrame*CFrame.Angles(math.rad(90),0,math.rad(270 - rotation))*CFrame.new(ono,poste,0),vt(1,1,1),-0.05,-0.05,-0.05,ModeColor2)
					RH.C0=clerp(RH.C0,cf(1,-1 - 0.05 * math.cos(sine / 28),0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-2.5),math.rad(0),math.rad(0 - 3 * math.cos(sine / 34))),.1)
					LH.C0=clerp(LH.C0,cf(-1,-1 - 0.05 * math.cos(sine / 28),0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-2.5),math.rad(20 - 3 * math.cos(sine / 56)),math.rad(0 + 3 * math.cos(sine / 34))),.1)
					RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0 + 0.03 * math.cos(sine / 34),0 + 0.05 * math.cos(sine / 28))*angles(math.rad(0 - 3 * math.cos(sine / 34)),math.rad(0),math.rad(-20 + 3 * math.cos(sine / 56))),.1)
					Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(10 - 3.5 * math.cos(sine / 33)),math.rad(0 + 4 * math.cos(sine / 63)),math.rad(20 - 3 * math.cos(sine / 56))),.1)
					RW.C0=clerp(RW.C0,cf(1,0.5 + 0.1 * math.cos(sine / 28),0.45)*angles(math.rad(-30 - 3 * math.cos(sine / 53)),math.rad(0),math.rad(-30 + 2 * math.cos(sine / 37))),.1)
					LW.C0=clerp(LW.C0,cf(-1,0.5 + 0.1 * math.cos(sine / 28),0.45)*angles(math.rad(-30 - 2 * math.cos(sine / 58)),math.rad(0),math.rad(30 - 3 * math.cos(sine / 57) )),.1)
				elseif ModeOfDerpz == "Insane" then
					local snap = math.random(1,200)
					if snap == 1 then
						Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(25 + math.random(-1,1)),math.rad(math.random(-1,1)),math.rad(math.random(-1,1))),0.6)
						RW.C0=clerp(RW.C0,cf(1.5,0.5 + 0.025 * math.cos(sine / 45),0)*angles(math.rad(25 + 5 * math.cos(sine / 74) + math.random(-1,1)),math.rad(1 - 3 * math.cos(sine / 53) + math.random(-1,1)),math.rad(1 + 3 * math.cos(sine / 45) + math.random(-1,1))),.6)
						LW.C0=clerp(LW.C0,cf(-1.5,0.5 + 0.025 * math.cos(sine / 45),0)*angles(math.rad(25 - 3 * math.cos(sine / 73) + math.random(-1,1)),math.rad(2 - 1 * math.cos(sine / 55) + math.random(-1,1)),math.rad(-3 - 3 * math.cos(sine / 45) + math.random(-1,1))),.6)
					end
					RH.C0=clerp(RH.C0,cf(1,-1 - 0.05 * math.cos(sine / 28),0)*angles(math.rad(30),math.rad(90),math.rad(0))*angles(math.rad(-2.5),math.rad(0),math.rad(0 + 1 * math.cos(sine / 34))),.1)
					LH.C0=clerp(LH.C0,cf(-1,-1 - 0.05 * math.cos(sine / 28),0)*angles(math.rad(30),math.rad(-90),math.rad(0))*angles(math.rad(-2.5),math.rad(0),math.rad(0 + 1 * math.cos(sine / 34))),.1)
					RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0 + 0.05 * math.cos(sine / 28))*angles(math.rad(30 - 1 * math.cos(sine / 34)),math.rad(0),math.rad(0)),.1)
					Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(20 - 2.5 * math.cos(sine / 28)+ math.random(-5,5)),math.rad(0 + math.random(-5,5)),math.rad(0 + math.random(-5,5))),.1)
					RW.C0=clerp(RW.C0,cf(1.5,0.5 + 0.05 * math.cos(sine / 28),0)*angles(math.rad(30),math.rad(0),math.rad(0)),.1)
					LW.C0=clerp(LW.C0,cf(-1.5,0.5 + 0.05 * math.cos(sine / 28),0)*angles(math.rad(30),math.rad(0),math.rad(0)),.1)
				elseif ModeOfDerpz == "Divinitive" then
					RH.C0=clerp(RH.C0,cf(1,-1 - 0.05 * math.cos(sine / 28),0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-2.5),math.rad(0),math.rad(0 - 2 * math.cos(sine / 34))),.1)
					LH.C0=clerp(LH.C0,cf(-1,-1 - 0.05 * math.cos(sine / 28),0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-2.5),math.rad(0),math.rad(0 + 2 * math.cos(sine / 34))),.1)
					RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0 + 0.02 * math.cos(sine / 34),0 + 0.05 * math.cos(sine / 28))*angles(math.rad(0 - 2 * math.cos(sine / 34)),math.rad(0),math.rad(0)),.1)
					Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(5 - 2.5 * math.cos(sine / 28)),math.rad(0 - 4 * math.cos(sine / 42)),math.rad(0 - 3 * math.cos(sine / 76))),.1)
					RW.C0=clerp(RW.C0,cf(1,0.5 + 0.1 * math.cos(sine / 28),0.45)*angles(math.rad(-30 - 3 * math.cos(sine / 53)),math.rad(0),math.rad(-30 + 2 * math.cos(sine / 37))),.1)
					LW.C0=clerp(LW.C0,cf(-1.5,0.5,0)*angles(math.rad(7 + 2 * math.cos(sine / 57)),math.rad(20 + 4 * math.cos(sine / 47)),math.rad(-0 - 2 * math.cos(sine / 29))),.1)
				elseif ModeOfDerpz == "DJ" then
					RH.C0=clerp(RH.C0,cf(1,-1 - 0.05 * math.cos(sine / 28 - kan.PlaybackLoudness/150) + kan.PlaybackLoudness/1000,-0.1)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-2.5),math.rad(-20),math.rad(0 - 2 * math.cos(sine / 56) + kan.PlaybackLoudness/450)),.1)
					LH.C0=clerp(LH.C0,cf(-1,-1 - 0.05 * math.cos(sine / 28- kan.PlaybackLoudness/150 ) - kan.PlaybackLoudness/6500,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-2.5),math.rad(5),math.rad(0 + 2 * math.cos(sine / 56) + kan.PlaybackLoudness/500)),.1)
					RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0 + 0.02 * math.cos(sine / 56) ,0 + 0.05 * math.cos(sine / 28 - kan.PlaybackLoudness/150) + kan.PlaybackLoudness/7000)*angles(math.rad(0 - 2 * math.cos(sine / 56)),math.rad(0),math.rad(5)),.1)
					Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(10 + 5 * math.cos(sine / 28 - kan.PlaybackLoudness/150))+ kan.PlaybackLoudness/1000,math.rad(0 + 2 * math.cos(sine / 73)),math.rad(0)),.1)
					RW.C0=clerp(RW.C0,cf(1.5,0.5 + 0.1 * math.cos(sine / 57),0)*angles(math.rad(40 + 5 * math.cos(sine / 34) + kan.PlaybackLoudness/7.5),math.rad(0),math.rad(0 - 2 * math.cos(sine / 38))),.1)
					LW.C0=clerp(LW.C0,cf(-1,0.5 + 0.1 * math.cos(sine / 28),0.45)*angles(math.rad(-30 - 2 * math.cos(sine / 58)),math.rad(0),math.rad(30 - 3 * math.cos(sine / 57) )),.1)
				elseif ModeOfDerpz == "DJSTUPID" then
					RH.C0=clerp(RH.C0,cf(1,-1 - 0.05 * math.cos(sine / 28) + kan.PlaybackLoudness/5000,-0.1)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-2.5),math.rad(-20),math.rad(0 - 2 * math.cos(sine / 56) + kan.PlaybackLoudness/450)),.1)
					LH.C0=clerp(LH.C0,cf(-1,-1 - 0.05 * math.cos(sine / 28) - kan.PlaybackLoudness/6500,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-2.5),math.rad(5),math.rad(0 + 2 * math.cos(sine / 56) + kan.PlaybackLoudness/500)),.1)
					RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0 + 0.02 * math.cos(sine / 56) ,0 + 0.05 * math.cos(sine / 28) + kan.PlaybackLoudness/700)*angles(math.rad(0 - 2 * math.cos(sine / 56)),math.rad(0),math.rad(5)),.1)
					Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(10 + 5 * math.cos(sine / 28 - kan.PlaybackLoudness/1))+ kan.PlaybackLoudness,math.rad(0 + 2 * math.cos(sine / 73)),math.rad(0)),.1)
					RW.C0=clerp(RW.C0,cf(1.5,0.5 + 0.1 * math.cos(sine / 57),0)*angles(math.rad(40 + 5 * math.cos(sine / 34) + kan.PlaybackLoudness/1),math.rad(0),math.rad(0 - 2 * math.cos(sine / 38))),.1)
					LW.C0=clerp(LW.C0,cf(-1,0.5 + 0.1 * math.cos(sine / 28),0.45)*angles(math.rad(-30 - 2 * math.cos(sine / 58)),math.rad(0),math.rad(30 - 3 * math.cos(sine / 57) )),.1)
				elseif ModeOfDerpz == "Flying!" then
					Handle2weld.C1 = clerp(Handle2weld.C1,cf(1,-1.12,1.1 + 0.1 * math.cos(sine / 10))*angles(math.rad(-90),math.rad(16 * math.cos(sine / 10)),math.rad(-16 * math.cos(sine / 10))),.1)
					Handleweld.C1 = clerp(Handleweld.C1,cf(-1,-1.12,1.1 + 0.1 * math.cos(sine / 10))*angles(math.rad(-90),math.rad(-16 * math.cos(sine / 10)),math.rad(16 * math.cos(sine / 10))),.1)

					RH.C0=clerp(RH.C0,cf(1,-0.4,-0.5)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-3),math.rad(0 - 1 * math.cos(sine / 56)),math.rad(-10 - 7 * math.cos(sine / 56))),.1)
					LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-3),math.rad(0 - 1 * math.cos(sine / 56)),math.rad(10 + 3 * math.cos(sine / 52))),.1)
					RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0 + 0.02 * math.cos(sine / 32),1 + 0.15 * math.cos(sine / 25))*angles(math.rad(0 - 2 * math.cos(sine / 32)),math.rad(0),math.rad(0)),.1)
					Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(15),math.rad(0),math.rad(0 + 2.5 * math.cos(sine / 28))),.1)
					RW.C0=clerp(RW.C0,cf(1,0.5 + 0.1 * math.cos(sine / 28),-0.8)*angles(math.rad(68),math.rad(0),math.rad(-90 - 2.5 * math.cos(sine / 28))),.1)
					LW.C0=clerp(LW.C0,cf(-1,0.5 + 0.1 * math.cos(sine / 28),-0.6)*angles(math.rad(90),math.rad(0),math.rad(90 + 2.5 * math.cos(sine / 28))),.1)
				elseif ModeOfDerpz == "Determined2" then
					local Alpha = .1
					RootJoint.C0 = RootJoint.C0:lerp(cf(0,0 - 0.1 * math.cos(sine/20),-0.2)*angles(math.rad(-23.4),math.rad(-44.8),math.rad(0))*RootCF,Alpha)
					LH.C0 = LH.C0:lerp(cf(-1.3,-0.6+0.1 * math.cos(sine/20),-0.3)*angles(math.rad(21.3),math.rad(36.7),math.rad(-13.1))*angles(math.rad(0),math.rad(-90),math.rad(0)),Alpha)
					RH.C0 = RH.C0:lerp(cf(0.9,-1.3+0.1 * math.cos(sine/20),-0.1)*angles(math.rad(-20),math.rad(0),math.rad(0))*angles(math.rad(0),math.rad(90),math.rad(0)),Alpha)
					LW.C0 = LW.C0:lerp(cf(-1.5,0.7-0.2 * math.cos(sine/21),0.1)*angles(math.rad(-9),math.rad(10.2),math.rad(-31.3)),Alpha)
					RW.C0 = RW.C0:lerp(cf(1.4,1-0.2 * math.cos(sine/21),0)*angles(math.rad(127.6 - 10 * math.cos(sine/31)),math.rad(27.9 - 7 * math.cos(sine/32)),math.rad(62.4 + 4 * math.cos(sine/30))),Alpha)
					Torso.Neck.C0 = Torso.Neck.C0:lerp(cf(0,0,-0.2)*angles(math.rad(15.9),math.rad(36.8),math.rad(-5.5))*necko,Alpha)
				elseif ModeOfDerpz == "Injustice" then
					local Alpha = .1
					RootJoint.C0 = RootJoint.C0:lerp(cf(0,1.4 + 0.4 * math.cos(sine / 28),0.2)*angles(math.rad(15.3),math.rad(-1.6),math.rad(0))*RootCF,Alpha)
					LH.C0 = LH.C0:lerp(cf(-0.8,-0.7,0)*angles(math.rad(-29.4 - 5 * math.cos(sine / 13)),math.rad(17.8+ 5 * math.cos(sine / 15)),math.rad(-14.1 - 5 * math.cos(sine / 14)))*angles(math.rad(0),math.rad(-90),math.rad(0)),Alpha)
					RH.C0 = RH.C0:lerp(cf(1,-0.4 + 0.05 * math.cos(sine / 28),-0.8)*angles(math.rad(-29.9 + 5 * math.cos(sine / 13)),math.rad(-12.8 - 5 * math.cos(sine / 15)),math.rad(5.5+ 5 * math.cos(sine / 14)))*angles(math.rad(0),math.rad(90),math.rad(0)),Alpha)
					RW.C0 = clerp(RW.C0, cf(0.85, 0.5 + 0.1 * math.cos(sine / 28), -0.65) * angles(math.rad(30 - 1 * math.cos(sine / 34)), math.rad(0), math.rad(-100 - 2.5 * math.cos(sine / 28))), 0.1)
					LW.C0 = clerp(LW.C0, cf(-0.85, 0.5 + 0.1 * math.cos(sine / 27), -0.65) * angles(math.rad(40 - 1 * math.cos(sine / 35)), math.rad(0), math.rad(90 + 2.5 * math.cos(sine / 40))), 0.1)
					Torso.Neck.C0 = Torso.Neck.C0:lerp(cf(0,0.1,0.3)*angles(math.rad(-24.4),math.rad(0),math.rad(0))*necko,Alpha)
				elseif ModeOfDerpz == "Fighter" then
					local Alpha = .3
					RootJoint.C0 = RootJoint.C0:lerp(cf(-0.3,0,0)*angles(math.rad(0),math.rad(-35.9),math.rad(0))*RootCF,Alpha)
					LH.C0 = LH.C0:lerp(cf(-1,-1,0)*angles(math.rad(0),math.rad(0),math.rad(0))*angles(math.rad(0),math.rad(-90),math.rad(0)),Alpha)
					RH.C0 = RH.C0:lerp(cf(0.9,-1,0.4)*angles(math.rad(0),math.rad(-45),math.rad(0))*angles(math.rad(0),math.rad(90),math.rad(0)),Alpha)
					LW.C0 = LW.C0:lerp(cf(-1.4,0.3,0)*angles(math.rad(51.3),math.rad(0),math.rad(12.7)),Alpha)
					RW.C0 = RW.C0:lerp(cf(1.3,0.3,0)*angles(math.rad(44.8),math.rad(-36.3),math.rad(-6.6)),Alpha)
					Torso.Neck.C0 = Torso.Neck.C0:lerp(cf(0,0,0)*angles(math.rad(0),math.rad(27.5),math.rad(0))*necko,Alpha)
				elseif ModeOfDerpz == "DETERMINED" then
					Handle2weld.C1 = clerp(Handle2weld.C1,cf(1,-1.12,1.1 + 0.1 * math.cos(sine / 10))*angles(math.rad(-90),math.rad(16 * math.cos(sine / 10)),math.rad(-16 * math.cos(sine / 10))),.1)
					Handleweld.C1 = clerp(Handleweld.C1,cf(-1,-1.12,1.1 + 0.1 * math.cos(sine / 10))*angles(math.rad(-90),math.rad(-16 * math.cos(sine / 10)),math.rad(16 * math.cos(sine / 10))),.1)

					local snap = math.random(1,200)
					if snap == 1 then
						Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(25 + math.random(-1,1)),math.rad(math.random(-1,1)),math.rad(20 + math.random(-1,1))),0.6)
					end
					RH.C0=clerp(RH.C0,cf(1,-0.4,-0.5)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-3),math.rad(0 - 1 * math.cos(sine / 56)),math.rad(-10 - 2 * math.cos(sine / 32))),.1)
					LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-3),math.rad(0 - 1 * math.cos(sine / 56)),math.rad(10 + 2 * math.cos(sine / 32))),.1)
					RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0 + 0.02 * math.cos(sine / 20),1 + 0.15 * math.cos(sine / 32))*angles(math.rad(0 - 2 * math.cos(sine / 32)),math.rad(0),math.rad(10)),.1)
					Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(15 - 2 * math.cos(sine / 37)),math.rad(0 + 2 * math.cos(sine / 58)),math.rad(-10 + 2 * math.cos(sine / 53))),.1)
					RW.C0=clerp(RW.C0,cf(0.8,0.5 + 0.05 * math.cos(sine / 28),0.3)*angles(math.rad(-40),math.rad(0),math.rad(-50)),.1)
					LW.C0=clerp(LW.C0,cf(-0.9,0.5 + 0.1 * math.cos(sine / 40),-0.9)*angles(math.rad(100),math.rad(10),math.rad(70)),.1)
				elseif ModeOfDerpz == "ENRAGED" then
					RH.C0=clerp(RH.C0,cf(1,-1 - 0.1 * math.cos(sine / 24),-0.5)*angles(math.rad(0),math.rad(80),math.rad(17 - 2 * math.cos(sine / 32)))*angles(math.rad(0),math.rad(5.5 - 2 * math.cos(sine / 56)),math.rad(1 - 2 * math.cos(sine / 32))),.1)
					LH.C0=clerp(LH.C0,cf(-1,-1 - 0.1 * math.cos(sine / 24),0)*angles(math.rad(0),math.rad(-82),math.rad(-17 - 2 * math.cos(sine / 32)))*angles(math.rad(-6),math.rad(-22 - 2 * math.cos(sine / 56)),math.rad(12 + 2 * math.cos(sine / 32))),.1)
					RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0 + 0.1 * math.cos(sine / 24))*angles(math.rad(15 - 2 * math.cos(sine / 32)),math.rad(0),math.rad(22 + 2 * math.cos(sine / 56))),.1)
					Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(20 - 2.5 * math.cos(sine / 28)+ math.random(-4,4)),math.rad(0 + math.random(-4,4)),math.rad(-22 + math.random(-4,4))),.1)
					RW.C0=clerp(RW.C0,cf(1.5,0.5 + 0.1 * math.cos(sine / 70),0)*angles(math.rad(170),math.rad(0),math.rad(-25)),.1)
					LW.C0=clerp(LW.C0,cf(-1.5,0.5 + 0.1 * math.cos(sine / 28),0)*angles(math.rad(170),math.rad(0),math.rad(22)),.1)
				elseif ModeOfDerpz == "Interstellar" then
					sphere2(8,"Add",rarm.CFrame*CFrame.new(0,-1,0)*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(1,1,1),-0.01,0.05,-0.01,BrickColor.new("Maroon"),Color3.new(0,1,0))
					sphere2(8,"Add",larm.CFrame*CFrame.new(0,-1,0)*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(1,1,1),-0.01,0.01,-0.01,BrickColor.new("Toothpaste"),Color3.new(0,1,0))

					RH.C0=clerp(RH.C0,cf(1,-1 - 0.15 * math.cos(sine / 22),0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-3),math.rad(-5.5 - 2 * math.cos(sine / 56)),math.rad(-12 - 2 * math.cos(sine / 32))),.1)
					LH.C0=clerp(LH.C0,cf(-1,-1 - 0.15 * math.cos(sine / 22),0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-6),math.rad(22 - 2 * math.cos(sine / 56)),math.rad(-1 + 2 * math.cos(sine / 32))),.1)
					RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0.01 + 0.03 * math.cos(sine / 40),0 + 0.15 * math.cos(sine / 22))*angles(math.rad(1 - 2 * math.cos(sine / 32)),math.rad(0),math.rad(22 + 2 * math.cos(sine / 56))),.1)
					Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(13 - 2 * math.cos(sine / 37)),math.rad(0 + 5 * math.cos(sine / 43)),math.rad(-22 - 2 * math.cos(sine / 56))),.1)
					RW.C0=clerp(RW.C0,cf(1.5,0.5 + 0.050 * math.cos(sine / 10),0.2)*angles(math.rad(89 + 10 * math.cos(sine / 100)),math.rad(0 - 1 * math.cos(sine / 32)),math.rad(30 - 8 * math.cos(sine / 100))),.1)
					LW.C0=clerp(LW.C0,cf(-1.35,0.5 + 0.125 * math.cos(sine / 10),0)*angles(math.rad(5 - 2 * math.cos(sine / 21)),math.rad(16 - 4 * math.cos(sine / 44)),math.rad(-13 - 6 * math.cos(sine / 25))),.1)
				elseif ModeOfDerpz == "Depressed" then
					local Alpha = .1
					RootJoint.C0 = RootJoint.C0:lerp(cf(0,-1.8,0)*angles(math.rad(0),math.rad(0),math.rad(0))*RootCF,Alpha)
					LH.C0 = LH.C0:lerp(cf(-1,0.7,-0.5)*angles(math.rad(12),math.rad(19.9),math.rad(0))*angles(math.rad(0),math.rad(-90),math.rad(0)),Alpha)
					RH.C0 = RH.C0:lerp(cf(1,0.3,-0.4)*angles(math.rad(35.4),math.rad(4.3),math.rad(6.5))*angles(math.rad(0),math.rad(90),math.rad(0)),Alpha)
					LW.C0 = LW.C0:lerp(cf(-1.1,0.7,-0.4)*angles(math.rad(103.3),math.rad(-11.7),math.rad(54.6)),Alpha)
					RW.C0 = RW.C0:lerp(cf(1,0.5,-0.3)*angles(math.rad(98.2),math.rad(9.2),math.rad(-45.3)),Alpha)
					Torso.Neck.C0 = Torso.Neck.C0:lerp(cf(0,0.2,0.4)*angles(math.rad(-28),math.rad(0),math.rad(0))*necko,Alpha)
				elseif ModeOfDerpz == "STRESS" then
					local snap = math.random(1,5)
					if snap == 1 then
						Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(25 + math.random(-1,1)),math.rad(math.random(-1,1)),math.rad(math.random(-1,1))),0.6)
						RW.C0=clerp(RW.C0,cf(1.5,0.5 + 0.025 * math.cos(sine / 45),0)*angles(math.rad(25 + 5 * math.cos(sine / 74) + math.random(-1,1)),math.rad(1 - 3 * math.cos(sine / 53) + math.random(-1,1)),math.rad(1 + 3 * math.cos(sine / 45) + math.random(-1,1))),.6)
					end
					RH.C0=clerp(RH.C0,cf(1,-0.4,-0.5)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-3),math.rad(0 - 1 * math.cos(sine / 56)),math.rad(-10 - 2 * math.cos(sine / 39))),.1)
					LH.C0=clerp(LH.C0,cf(-1,-1,0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-3),math.rad(0 - 1 * math.cos(sine / 56)),math.rad(10 + 6 * math.cos(sine / 31))),.1)
					RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,-0.25 + 0.02 * math.cos(sine / 32),1 + 0.1 * math.cos(sine / 32))*angles(math.rad(25 - 2 * math.cos(sine / 32)),math.rad(0),math.rad(0)),.1)
					Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(25 - 2 * math.cos(sine / 37)),math.rad(0 + 1 * math.cos(sine / 58)),math.rad(0 + 2 * math.cos(sine / 53))),.1)
					RW.C0=clerp(RW.C0,cf(1.5,0.5 + 0.025 * math.cos(sine / 45),0)*angles(math.rad(25 + 5 * math.cos(sine / 74)),math.rad(1 - 3 * math.cos(sine / 53)),math.rad(1 + 3 * math.cos(sine / 45))),.1)
					LW.C0=clerp(LW.C0,cf(-1.5,0.5,0)*angles(math.rad(160),math.rad(0),math.rad(25)),.1)
				elseif ModeOfDerpz == "FullyEnragedJake" then
					local Alpha = .25
					RootJoint.C0 = RootJoint.C0:lerp(cf(0,0 + .2 * math.cos(sine/50),0)*angles(math.rad(-12.6 + 4 * math.cos(sine/50)),math.rad(-45.7),math.rad(-14.1))*RootCF,Alpha)
					LH.C0 = LH.C0:lerp(cf(-0.9,-1.1 - .2 * math.cos(sine/50),0)*angles(math.rad(13.2 -4 * math.cos(sine/50)),math.rad(25.7),math.rad(-0.5))*angles(math.rad(0),math.rad(-90),math.rad(0)),Alpha)
					RH.C0 = RH.C0:lerp(cf(1.1,-1.1 - .2 * math.cos(sine/50),0.1)*angles(math.rad(7.4 -4 * math.cos(sine/50)),math.rad(-33.5),math.rad(12.6))*angles(math.rad(0),math.rad(90),math.rad(0)),Alpha)
					LW.C0 = LW.C0:lerp(cf(-0.5,0.1 + .2 * math.cos(sine/49),-0.9)*angles(math.rad(84.6 + 4 * math.cos(sine/25) + math.random(-2,2)),math.rad(0 + 4 * math.cos(sine/26)+ math.random(-2,2)),math.rad(57.9 + 4 * math.cos(sine/24)+ math.random(-2,2))),Alpha)
					RW.C0 = RW.C0:lerp(cf(1.4,0.1 + .2 * math.cos(sine/49),-0.3)*angles(math.rad(81.8 + 4 * math.cos(sine/25) + math.random(-2,2)),math.rad(2.5 - 4 * math.cos(sine/26)+ math.random(-2,2)),math.rad(-29.1 + 4 * math.cos(sine/24)+ math.random(-2,2))),Alpha)
					Torso.Neck.C0 = Torso.Neck.C0:lerp(cf(0.2,0,0)*angles(math.rad(-11.3 + math.random(-2,2)),math.rad(40.6 + math.random(-2,2)),math.rad(19.2 + math.random(-2,2)))*necko,Alpha)
				elseif ModeOfDerpz == "sans" then
					local Alpha = .3
					local speediboi = 15
					local slowerboi = speediboi/2
					RootJoint.C0 = RootJoint.C0:lerp(cf(-0.2 * math.cos(sine/speediboi),0.2 * math.cos(sine/slowerboi),0)*angles(math.rad(7.7 * math.cos(sine/30)),math.rad(0),math.rad(0))*RootCF,Alpha)
					LH.C0 = LH.C0:lerp(cf(-0.9+0.2 * math.cos(sine/speediboi),-1.1 - 0.2 * math.cos(sine/slowerboi),0)*angles(math.rad(-5 - 7.7 * math.cos(sine/30)),math.rad(7.5),math.rad(-12.3))*angles(math.rad(0),math.rad(-90),math.rad(0)),Alpha)
					RH.C0 = RH.C0:lerp(cf(1.3+0.2 * math.cos(sine/speediboi),-1.1 - 0.2 * math.cos(sine/slowerboi),0.1)*angles(math.rad(-5 - 7.7 * math.cos(sine/30)),math.rad(-9.8),math.rad(5.6))*angles(math.rad(0),math.rad(90),math.rad(0)),Alpha)
					LW.C0 = LW.C0:lerp(cf(-1.3,0.5,0.4)*angles(math.rad(-56.6),math.rad(29),math.rad(41)),Alpha)
					RW.C0 = RW.C0:lerp(cf(1.4,0.4,0.3)*angles(math.rad(-40.5),math.rad(-24.9),math.rad(-39.3)),Alpha)
					Torso.Neck.C0 = Torso.Neck.C0:lerp(cf(0.1 * math.cos(sine/speediboi),0,0.3 )*angles(math.rad(-15.1),math.rad(0),math.rad(7 * math.cos(sine/speediboi)))*necko,Alpha)
				elseif ModeOfDerpz == "SOLITUDE" then
					RH.C0=clerp(RH.C0,cf(1,-1 - 0.1 * math.cos(sine / 32),0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-10 - 2.5 * math.cos(sine / 32)),math.rad(-20),math.rad(0)),.1)
					LH.C0=clerp(LH.C0,cf(-1,-1 - 0.1 * math.cos(sine / 32),0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(0),math.rad(0),math.rad(-10 + 2.5 * math.cos(sine / 32))),.1)
					RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0 + 0.1 * math.cos(sine / 32))*angles(math.rad(10 - 2 * math.cos(sine / 32)),math.rad(0),math.rad(20)),.1)
					Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(25 - 2.5 * math.cos(sine / 32)),math.rad(0 - 15 * math.cos(sine / 0.25)),math.rad(-20 - 5 * math.cos(sine / 0.465))),.1)
					RW.C0=clerp(RW.C0,cf(1.5,0.5,0)*angles(math.rad(10),math.rad(-20),math.rad(30 + 2.5 * math.cos(sine / 25))),.1)
					LW.C0=clerp(LW.C0,cf(-1.5,0.5,0)*angles(math.rad(160),math.rad(0),math.rad(25)),.1)

				elseif ModeOfDerpz == "Genocidial" then
					sphereMK(2,1/45,"Add",root.CFrame*CFrame.new(math.random(-10,10),-3,math.random(-10,10))*CFrame.Angles(math.rad(90 + math.random(-3,3)),math.rad(math.random(-3,3)),math.rad(math.random(-3,3))),0.5,0.5,0.5,0,BrickColor.new("Really red"),0)

					RH.C0=clerp(RH.C0,cf(1,-1 - 0.05 * math.cos(sine / 100),0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(-2.5),math.rad(0),math.rad(0 + 1 * math.cos(sine / 34))),.1)
					LH.C0=clerp(LH.C0,cf(-1,-1 - 0.05 * math.cos(sine / 100),0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(-2.5),math.rad(0),math.rad(0 + 1 * math.cos(sine / 34))),.1)
					RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0 + 0.05 * math.cos(sine / 100))*angles(math.rad(0 - 1 * math.cos(sine / 34)),math.rad(0),math.rad(0)),.1)
					Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(25 - 2.5 * math.cos(sine / 100)+ math.random(-4,4)),math.rad(0+ math.random(-4,4)),math.rad(0 - 3 * math.cos(sine / 100)+ math.random(-4,4))),.1)
					RW.C0=clerp(RW.C0,cf(1.2,0.5 + 0.01 * math.cos(sine / 100),-0.5)*angles(math.rad(90),math.rad(0),math.rad(-75 - 2.5 * math.cos(sine / 100))),.1)
					LW.C0=clerp(LW.C0,cf(-1.5,0.5 + 0.01 * math.cos(sine / 100),0)*angles(math.rad(0),math.rad(0),math.rad(0 + 2.5 * math.cos(sine / 100))),.1)
				elseif ModeOfDerpz == "REVENGE" then
					local Alpha = .1

					ah = false
					RootJoint.C0 = RootJoint.C0:lerp(cf(0 + 0.1 * math.cos(sine / 48),2 + 0.5 * math.cos(sine / 30),0 + 0.1 * math.cos(sine / 39))*angles(math.rad(0),math.rad(-24.8),math.rad(0))*RootCF,Alpha)
					LH.C0 = LH.C0:lerp(cf(-0.9,-1 - 0.15 * math.cos(sine / 33),0.2)*angles(math.rad(-2.7 + 5 * math.cos(sine / 67)),math.rad(25.9),math.rad(-3.5))*angles(math.rad(0),math.rad(-90),math.rad(0)),Alpha)
					RH.C0 = RH.C0:lerp(cf(0.9,-0.5  - 0.15 * math.cos(sine / 33),-0.5)*angles(math.rad(5.6 + 5 * math.cos(sine / 19)),math.rad(-24.2),math.rad(7.4))*angles(math.rad(0),math.rad(90),math.rad(0)),Alpha)
					LW.C0 = LW.C0:lerp(cf(-1.4,0.5,0.3)*angles(math.rad(-20+ math.random(-2,2)),math.rad(20.2+ math.random(-2,2)),math.rad(-25 + 7 * math.cos(sine / 100)+ math.random(-2,2))),Alpha)
					RW.C0 = RW.C0:lerp(cf(1.6,0.7,0.3)*angles(math.rad(171.3+ math.random(-2,2)),math.rad(23.1+ math.random(-2,2)),math.rad(7.1 + 5 * math.cos(sine / 37)  + math.random(-2,2))),Alpha)
					Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(15 - 2.5 * math.cos(sine / 100)+ math.random(-4,4)),math.rad(0+ math.random(-4,4)),math.rad(22 - 3 * math.cos(sine / 100)+ math.random(-4,4))),.1)
					sphere2(8,"Add",rarm.CFrame*CFrame.new(0,-1,0)*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))),vt(1,1,1),-0.005,0.005,-0.005,ModeColor,Color3.new(0,1,0))
				elseif ModeOfDerpz == "RAINBOW" then
					local Alpha = 0.1
					RootJoint.C0 = RootJoint.C0:lerp(cf(0,0 + 0.1 * math.cos(sine / 32),0)*angles(math.rad(0),math.rad(31.7),math.rad(0))*RootCF,Alpha)
					LH.C0 = LH.C0:lerp(cf(-0.9,-0.9- 0.1 * math.cos(sine / 32),-0.1)*angles(math.rad(-16.4 + 3 * math.cos(sine / 60)),math.rad(29.8 + 4 * math.cos(sine / 60)),math.rad(-3.4))*angles(math.rad(0),math.rad(-90),math.rad(0)),Alpha)
					RH.C0 = RH.C0:lerp(cf(1.1,-0.9- 0.1 * math.cos(sine / 32) ,-0.1)*angles(math.rad(5.9),math.rad(-28.4),math.rad(10.9 + 1.5 * math.cos(sine / 33)))*angles(math.rad(0),math.rad(90),math.rad(0)),Alpha)
					LW.C0 = LW.C0:lerp(cf(-0.9,0.3 - 0.1 * math.cos(sine / 34),-0.6)*angles(math.rad(140.9),math.rad(-19.3),math.rad(83.7)),Alpha)
					RW.C0 = RW.C0:lerp(cf(1.3,0.4 - 0.1 * math.cos(sine / 34),-0.6)*angles(math.rad(54),math.rad(-30.6),math.rad(-51.4)),Alpha)
					Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(0 - 2 * math.cos(sine / 37)),math.rad(0 + 5 * math.cos(sine / 43)),math.rad(-22 - 2 * math.cos(sine / 56))),.1)
				elseif ModeOfDerpz == "EXTREMECORRUPT" then
					local Alpha = .3
					RootJoint.C0 = RootJoint.C0:lerp(cf(0,-1.1,-0.6)*angles(math.rad(-43.7),math.rad(-24.8),math.rad(0))*RootCF,Alpha)
					LH.C0 = LH.C0:lerp(cf(-1,0.9,-0.4)*angles(math.rad(37.1+ math.random(-4,4)),math.rad(21.4+ math.random(-4,4)),math.rad(-19.3+ math.random(-4,4)))*angles(math.rad(0),math.rad(-90),math.rad(0)),Alpha)
					RH.C0 = RH.C0:lerp(cf(0.6,-0.7,-1)*angles(math.rad(-29.2+ math.random(-4,4)),math.rad(23.3+ math.random(-4,4)),math.rad(10.7+ math.random(-4,4)))*angles(math.rad(0),math.rad(90),math.rad(0)),Alpha)
					LW.C0 = LW.C0:lerp(cf(-1.1,1.2,0.2)*angles(math.rad(-173.8+ math.random(-4,4)),math.rad(-48.1+ math.random(-4,4)),math.rad(24.2+ math.random(-4,4))),Alpha)
					RW.C0 = RW.C0:lerp(cf(1.3,0.6,-0.2)*angles(math.rad(-164.8+ math.random(-4,4)),math.rad(14.1+ math.random(-4,4)),math.rad(-19.9+ math.random(-4,4))),Alpha)
					Torso.Neck.C0 = Torso.Neck.C0:lerp(cf(0,0.2,0.5)*angles(math.rad(-33.8+ math.random(-7,7)),math.rad(6.7+ math.random(-7,7)),math.rad(3.1+ math.random(-7,7)))*necko,Alpha)
				elseif ModeOfDerpz == "Festivity" then
					local Alpha = .1
					RootJoint.C0 = RootJoint.C0:lerp(cf(0,-1.6,0.1)*angles(math.rad(15.7),math.rad(0),math.rad(0))*RootCF,Alpha)
					LH.C0 = LH.C0:lerp(cf(-1,0.2,-0.9)*angles(math.rad(0),math.rad(0),math.rad(0))*angles(math.rad(0),math.rad(-90),math.rad(0)),Alpha)
					RH.C0 = RH.C0:lerp(cf(1,-0.9,0.2)*angles(math.rad(70.7),math.rad(0),math.rad(0))*angles(math.rad(0),math.rad(90),math.rad(0)),Alpha)
					LW.C0 = LW.C0:lerp(cf(-1.4,0.52,0.4)*angles(math.rad(-25),math.rad(16.1),math.rad(-8.7)),Alpha)
					RW.C0 = RW.C0:lerp(cf(1.4,0.35,0.5)*angles(math.rad(-36.2),math.rad(-24.4),math.rad(-8.8)),Alpha)
					Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(20.8 - 2 * math.cos(sine / 37)),math.rad(0.8),math.rad(8.5 -10 * math.cos(sine / 56))),.1)
				elseif ModeOfDerpz == "Sleepy" then
					local Alpha = .1
					RootJoint.C0 = RootJoint.C0:lerp(cf(0,-2.3,0.1)*angles(math.rad(79.2),math.rad(0),math.rad(0))*RootCF,Alpha)
					LH.C0 = LH.C0:lerp(cf(-1,-1,0)*angles(math.rad(11.8),math.rad(0),math.rad(0))*angles(math.rad(0),math.rad(-90),math.rad(0)),Alpha)
					RH.C0 = RH.C0:lerp(cf(1,-1.3,0.2)*angles(math.rad(54.5),math.rad(-21.7),math.rad(-38.5))*angles(math.rad(0),math.rad(90),math.rad(0)),Alpha)
					LW.C0 = LW.C0:lerp(cf(-0.9,1.1,0.4)*angles(math.rad(169.7),math.rad(-5.5),math.rad(43.4)),Alpha)
					RW.C0 = RW.C0:lerp(cf(0.9,0.9,0.5)*angles(math.rad(176.2),math.rad(6.9),math.rad(-24.9)),Alpha)
					Torso.Neck.C0 = Torso.Neck.C0:lerp(cf(-0.2,0,0.3)*angles(math.rad(-16.3),math.rad(-31.1),math.rad(-8.1))*necko,Alpha)
				elseif ModeOfDerpz == "Powered" then
					Handle2weld.C1 = clerp(Handle2weld.C1,cf(1,-1.12,1.1 + 0.1 * math.cos(sine / 10))*angles(math.rad(-90),math.rad(16 * math.cos(sine / 10)),math.rad(-16 * math.cos(sine / 10))),.1)
					Handleweld.C1 = clerp(Handleweld.C1,cf(-1,-1.12,1.1 + 0.1 * math.cos(sine / 10))*angles(math.rad(-90),math.rad(-16 * math.cos(sine / 10)),math.rad(16 * math.cos(sine / 10))),.1)
					local Alpha = .1
					sphereMK(3,1/45,"Add",lleg.CFrame*CFrame.new(math.random(-1,1),-1,math.random(-1,1))*CFrame.Angles(math.rad(-90 + math.random(-3,3)),math.rad(math.random(-3,3)),math.rad(math.random(-3,3))),0.4,0.4,0.4,0,BrickColor.Blue(),0)
					sphereMK(3,1/45,"Add",rleg.CFrame*CFrame.new(math.random(-1,1),-1,math.random(-1,1))*CFrame.Angles(math.rad(-90 + math.random(-3,3)),math.rad(math.random(-3,3)),math.rad(math.random(-3,3))),0.4,0.4,0.4,0,BrickColor.Black(),0)

					RootJoint.C0 = RootJoint.C0:lerp(cf(-0.2,1.9 - 0.5 * math.cos(sine / 36),0)*angles(math.rad(0),math.rad(-25.4),math.rad(0))*RootCF,Alpha)
					LH.C0 = LH.C0:lerp(cf(-1,-1.1+ 0.05 * math.cos(sine / 36),0.1)*angles(math.rad(-20.6),math.rad(0),math.rad(0))*angles(math.rad(0),math.rad(-90),math.rad(0)),Alpha)
					RH.C0 = RH.C0:lerp(cf(1,-0.2+ 0.05 * math.cos(sine / 36),-0.6)*angles(math.rad(0),math.rad(0),math.rad(0))*angles(math.rad(0),math.rad(90),math.rad(0)),Alpha)
					LW.C0 = LW.C0:lerp(cf(-1.6,0.9+ 0.1 * math.cos(sine / 38),0.1)*angles(math.rad(171.4),math.rad(0),math.rad(-30.6)),Alpha)
					RW.C0 = RW.C0:lerp(cf(1.5,0.6+ 0.1 * math.cos(sine / 38),0)*angles(math.rad(0),math.rad(0),math.rad(22.3)),Alpha)
					Torso.Neck.C0 = Torso.Neck.C0:lerp(cf(0.2,0,0.1)*angles(math.rad(-16.2),math.rad(32.2),math.rad(8.8))*necko,Alpha)
				elseif ModeOfDerpz == "Lustful" then -- oh no.
					Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(25 - 2.5 * math.cos(sine / 80)),math.rad(0),math.rad(0 + 10 * math.cos(sine / 100))),.1)
					LW.C0 = LW.C0:lerp(cf(-1.2,0.5,-0.6)*angles(math.rad(0),math.rad(-25),math.rad(0)),0.1)
					RW.C0 = RW.C0:lerp(cf(0.6,0.5,-0.8)*angles(math.rad(105),math.rad(1.8),math.rad(-93.6)),0.1)
					RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,0,0+ 0.1 * math.cos(sine / 80))*angles(math.rad(0),math.rad(0),math.rad(0)),.1)
					LH.C0 = LH.C0:lerp(cf(-0.9,-1- 0.1 * math.cos(sine / 80),0.2)*angles(math.rad(-2.7),math.rad(25.9),math.rad(-3.5))*angles(math.rad(0),math.rad(-90),math.rad(0)),.1)
					RH.C0 = RH.C0:lerp(cf(1,-1- 0.1 * math.cos(sine / 80),0)*angles(math.rad(0),math.rad(0),math.rad(0))*angles(math.rad(0),math.rad(90),math.rad(0)),.1)
				elseif ModeOfDerpz == "Powered+" then
					local Alpha = .3
					EffectBoi(e,"Deep blue",Head.CFrame*CFrame.new(-.2,.2,-.5)*CFrame.Angles(-math.rad(90+math.random(-12,12)),math.rad(math.random(-12,12)),math.random(-120,120)),2,2,2,-.06,-.06,-.06,.03,"Sphere",7,2,"")

					Handle2weld.C1 = clerp(Handle2weld.C1,cf(1,-1.12,1.1 + 0.1 * math.cos(sine / 10))*angles(math.rad(-90),math.rad(16 * math.cos(sine / 10)),math.rad(-16 * math.cos(sine / 10))),.1)
					Handleweld.C1 = clerp(Handleweld.C1,cf(-1,-1.12,1.1 + 0.1 * math.cos(sine / 10))*angles(math.rad(-90),math.rad(-16 * math.cos(sine / 10)),math.rad(16 * math.cos(sine / 10))),.1)

					RootJoint.C0 = RootJoint.C0:lerp(cf(0,1.9 - 0.5 * math.cos(sine / 36),0)*angles(math.rad(0),math.rad(0),math.rad(0))*RootCF,Alpha)
					LH.C0 = LH.C0:lerp(cf(-1,-0.2,-1)*angles(math.rad(-23.2),math.rad(0),math.rad(0))*angles(math.rad(0),math.rad(-90),math.rad(0)),Alpha)
					RH.C0 = RH.C0:lerp(cf(1,-1,0.1)*angles(math.rad(-6.4),math.rad(0),math.rad(0))*angles(math.rad(0),math.rad(90),math.rad(0)),Alpha)
					LW.C0 = LW.C0:lerp(cf(-1,0.3+ 0.1 * math.cos(sine / 37),-0.6)*angles(math.rad(90),math.rad(0.1),math.rad(75.4)),Alpha)
					RW.C0 = RW.C0:lerp(cf(0.9,0.3+ 0.1 * math.cos(sine / 37),-0.7)*angles(math.rad(92.5),math.rad(-4.2),math.rad(-58.9)),Alpha)
					Torso.Neck.C0 = Torso.Neck.C0:lerp(cf(0,0.1,0.2)*angles(math.rad(-18.8),math.rad(0),math.rad(0))*necko,Alpha)
				else --Modes which don't have animations yet
					local Alpha = .08
					RootJoint.C0 = RootJoint.C0:lerp(cf(0,0,0)*angles(math.rad(0),math.rad(-24.8),math.rad(0))*RootCF,Alpha)
					LH.C0 = LH.C0:lerp(cf(-0.9,-1,0.2)*angles(math.rad(-2.7),math.rad(25.9),math.rad(-3.5))*angles(math.rad(0),math.rad(-90),math.rad(0)),Alpha)
					RH.C0 = RH.C0:lerp(cf(1,-1,0)*angles(math.rad(0),math.rad(0),math.rad(0))*angles(math.rad(0),math.rad(90),math.rad(0)),Alpha)
					LW.C0 = LW.C0:lerp(cf(-1.4,0.5,0.2)*angles(math.rad(0),math.rad(20.2),math.rad(0)),Alpha)
					RW.C0 = RW.C0:lerp(cf(1.4,0.5,0.1)*angles(math.rad(0),math.rad(-16.8),math.rad(0)),Alpha)
					Torso.Neck.C0 = Torso.Neck.C0:lerp(cf(0.2,0,0)*angles(math.rad(-7.9),math.rad(22.5),math.rad(7.7))*necko,Alpha)
				end
			end
		elseif torvel>2 and torvel<22 and hitfloor~=nil then
			Anim="Walk"
			if attack==false then
				if ModeOfDerpz == "Corrupt" then
					RH.C0=clerp(RH.C0,cf(1,-1,0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(1.5),math.rad(0),math.rad(-20 - 5 * math.cos(sine / 34))),.2)
					LH.C0=clerp(LH.C0,cf(-1,-.5,-.6)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(1),math.rad(0),math.rad(20 + 2 * math.cos(sine / 38))),.2)
					RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0 - 0.15 * math.cos(sine / 47),-0.5,0.5 + 0.1 * math.cos(sine / 28))*angles(math.rad(45),math.rad(0 - root.RotVelocity.Y),math.rad(0 - root.RotVelocity.Y *4.5 + 3 * math.cos(sine / 47))),.2)
					Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(-17 - 5 * math.cos(sine / 52)),math.rad(0 - 3 * math.cos(sine / 37)),math.rad(0 + 2 * math.cos(sine / 78))),.2)
					RW.C0=clerp(RW.C0,cf(1,0.5 + 0.1 * math.cos(sine / 28),0.45)*angles(math.rad(-30 - 3 * math.cos(sine / 53)),math.rad(0),math.rad(-30 + 2 * math.cos(sine / 37))),.1)
					LW.C0=clerp(LW.C0,cf(-1,0.5 + 0.1 * math.cos(sine / 28),0.45)*angles(math.rad(-30 - 2 * math.cos(sine / 58)),math.rad(0),math.rad(30 - 3 * math.cos(sine / 57) )),.1)
				elseif ModeOfDerpz == "Serene" then
					RW.C0=clerp(RW.C0,cf(0.8,0.5 + 0.1 * math.cos(sine / 4),-0.5)*angles(math.rad(0 - 0 * math.cos(sine / 39)),math.rad(0),math.rad(-70 - 0 * math.cos(sine / 47))),.1)
					LW.C0=clerp(LW.C0,cf(-0.85,0.5 + 0.1 * math.cos(sine / 4),-0.65)*angles(math.rad(40 - 1 * math.cos(sine / 34)),math.rad(0),math.rad(90 + 2.5 * math.cos(sine / 28))),.1)
					RH.C0 = clerp(RH.C0, cf(1, -0.9, -0 - 0.30 * math.cos(sine / 4)) * angles(math.rad(0), math.rad(90), math.rad(0)) * angles(math.rad(0), math.rad(0 + 5 * math.cos(sine / 8)), math.rad(0 + 50 * math.cos(sine / 8))), 0.1)
					LH.C0 = clerp(LH.C0, cf(-1, -0.9, -0 + 0.30 * math.cos(sine / 4)) * angles(math.rad(0), math.rad(-90), math.rad(0)) * angles(math.rad(0), math.rad(0 + 5 * math.cos(sine / 8)), math.rad(0 + 50 * math.cos(sine / 8))), 0.1)
					RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,-0.05,-0.05 - 0.05 * math.cos(sine / 4))*angles(math.rad(10 + 3 * math.cos(sine / 4)),math.rad(0),math.rad(0 - root.RotVelocity.Y - 5 * math.cos(sine / 8))),.1)
					Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(0 - 3 * math.cos(sine / 4)),math.rad(0),math.rad(0 - hed.RotVelocity.Y*2.5 + 5 * math.cos(sine / 8))),.1)
				elseif ModeOfDerpz == "Insane" then
					Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(20 - 2.5 * math.cos(sine / 28)+ math.random(-5,5)),math.rad(0 + math.random(-5,5)),math.rad(0 + math.random(-5,5))),.1)
					RH.C0 = clerp(RH.C0, cf(1, -0.9, -0 - 0.30 * math.cos(sine / 4)) * angles(math.rad(0), math.rad(90), math.rad(0)) * angles(math.rad(0), math.rad(0 + 5 * math.cos(sine / 8)), math.rad(0 + 50 * math.cos(sine / 8))), 0.1)
					LH.C0 = clerp(LH.C0, cf(-1, -0.9, -0 + 0.30 * math.cos(sine / 4)) * angles(math.rad(0), math.rad(-90), math.rad(0)) * angles(math.rad(0), math.rad(0 + 5 * math.cos(sine / 8)), math.rad(0 + 50 * math.cos(sine / 8))), 0.1)
					RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,-0.05,-0.05 - 0.05 * math.cos(sine / 4))*angles(math.rad(10 + 3 * math.cos(sine / 4)),math.rad(0),math.rad(0 - root.RotVelocity.Y - 5 * math.cos(sine / 8))),.1)
					RW.C0=clerp(RW.C0,cf(1.5,0.5,0 + 0.25 * math.cos(sine / 8))*angles(math.rad(0 - 50 * math.cos(sine / 8)),math.rad(5),math.rad(20 * math.cos(sine / 8))),.1)
					LW.C0=clerp(LW.C0,cf(-1.5,0.5,0 - 0.25 * math.cos(sine / 8))*angles(math.rad(0 + 50 * math.cos(sine / 8)),math.rad(-5),math.rad(20 * math.cos(sine / 8))),.1)
				elseif ModeOfDerpz == "DJ" then
					RH.C0 = clerp(RH.C0, cf(1, -0.9, -0 - 0.30 * math.cos(sine / 4)) * angles(math.rad(0), math.rad(90), math.rad(0)) * angles(math.rad(0), math.rad(0 + 5 * math.cos(sine / 8)), math.rad(0 + 50 * math.cos(sine / 8))), 0.1)
					LH.C0 = clerp(LH.C0, cf(-1, -0.9, -0 + 0.30 * math.cos(sine / 4)) * angles(math.rad(0), math.rad(-90), math.rad(0)) * angles(math.rad(0), math.rad(0 + 5 * math.cos(sine / 8)), math.rad(0 + 50 * math.cos(sine / 8))), 0.1)
					RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,-0.05,-0.05 - 0.05 * math.cos(sine / 4))*angles(math.rad(10 + 3 * math.cos(sine / 4)),math.rad(0),math.rad(0 - root.RotVelocity.Y - 5 * math.cos(sine / 8))),.1)
					Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(0 - 3 * math.cos(sine / 4)),math.rad(0),math.rad(0 - hed.RotVelocity.Y*2.5 + 5 * math.cos(sine / 8))),.1)
					LW.C0=clerp(LW.C0,cf(-1.5,0.5,0 - 0.25 * math.cos(sine / 8))*angles(math.rad(0 + 50 * math.cos(sine / 8)),math.rad(-5),math.rad(20 * math.cos(sine / 8))),.1)
					RW.C0=clerp(RW.C0,cf(1.5,0.5 + 0.02 * math.cos(sine / 28),0)*angles(math.rad(40 + 5 * math.cos(sine / 34) + kan.PlaybackLoudness/7.5),math.rad(0),math.rad(0 - 2 * math.cos(sine / 38))),.1)
				elseif ModeOfDerpz == "Genocidial" or ModeOfDerpz == "Depressed" then
					RH.C0=clerp(RH.C0,cf(1,-1 + 0.05 * math.cos(sine / 40),0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(0),math.rad(0 + 5 * math.cos(sine / 40)),math.rad(0 + 35 * math.cos(sine / 40))),.1)
					LH.C0=clerp(LH.C0,cf(-1,-1 + 0.05 * math.cos(sine / 40),0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(0),math.rad(0 + 5 * math.cos(sine / 40)),math.rad(0 + 35 * math.cos(sine / 40))),.1)
					RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,-0.05,-0.05 - 0.05 * math.cos(sine / 20))*angles(math.rad(0 + 0 * math.cos(sine / 40)),math.rad(0),math.rad(0 - root.RotVelocity.Y)),.09)
					Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(25 - 2.5 * math.cos(sine / 100)),math.rad(0),math.rad(0 - 3 * math.cos(sine / 100))),.03)
					RW.C0=clerp(RW.C0,cf(1.5,0.5,0 + 0.25 * math.cos(sine / 40))*angles(math.rad(0 - 10 * math.cos(sine / 40)),math.rad(0),math.rad(0 - 0 * math.cos(sine / 4))),.05)
					LW.C0=clerp(LW.C0,cf(-1.5,0.5,0 - 0.25 * math.cos(sine / 40))*angles(math.rad(0 + 10 * math.cos(sine / 40)),math.rad(0),math.rad(0 + 0 * math.cos(sine / 4))),.05)
				elseif ModeOfDerpz == "Genocidial" then
					sphereMK(2,1/45,"Add",root.CFrame*CFrame.new(math.random(-10,10),-3,math.random(-10,10))*CFrame.Angles(math.rad(90 + math.random(-3,3)),math.rad(math.random(-3,3)),math.rad(math.random(-3,3))),0.5,0.5,0.5,0,BrickColor.new("Really red"),0)
				elseif ModeOfDerpz == "Lustful" then
					RH.C0=clerp(RH.C0,cf(1,-1 + 0.05 * math.cos(sine / 20),0)*angles(math.rad(0),math.rad(90),math.rad(0))*angles(math.rad(0),math.rad(0 + 5 * math.cos(sine / 40)),math.rad(0 + 35 * math.cos(sine / 40))),.1)
					LH.C0=clerp(LH.C0,cf(-1,-1 + 0.05 * math.cos(sine / 20),0)*angles(math.rad(0),math.rad(-90),math.rad(0))*angles(math.rad(0),math.rad(0 + 5 * math.cos(sine / 40)),math.rad(0 + 35 * math.cos(sine / 40))),.1)
					RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,-0.05,-0.05 - 0.05 * math.cos(sine / 20))*angles(math.rad(5 + 3 * math.cos(sine / 20)),math.rad(0),math.rad(0 - root.RotVelocity.Y - 5 * math.cos(sine / 40))),.1)
					Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(25 - 5 * math.cos(sine / 60)),math.rad(0),math.rad(0 - hed.RotVelocity.Y*2.5 + 5 * math.cos(sine / 40))),.1)
					LW.C0 = LW.C0:lerp(cf(-1.2,0.5,-0.6)*angles(math.rad(0),math.rad(-25),math.rad(0)),0.1)
					RW.C0 = RW.C0:lerp(cf(0.6,0.5,-0.8)*angles(math.rad(105),math.rad(1.8),math.rad(-93.6)),0.1)

				elseif ModeOfDerpz ~= "Corrupt" and ModeOfDerpz ~= "Insane" and ModeOfDerpz ~= "DJ" and ModeOfDerpz ~= "Serene" and ModeOfDerpz ~= "Genocidial" and ModeOfDerpz ~= "Depressed" and ModeOfDerpz ~= "Lustful" then
					RH.C0 = clerp(RH.C0, cf(1, -0.9, -0 - 0.30 * math.cos(sine / 4)) * angles(math.rad(0), math.rad(90), math.rad(0)) * angles(math.rad(0), math.rad(0 + 5 * math.cos(sine / 8)), math.rad(0 + 50 * math.cos(sine / 8))), 0.1)
					LH.C0 = clerp(LH.C0, cf(-1, -0.9, -0 + 0.30 * math.cos(sine / 4)) * angles(math.rad(0), math.rad(-90), math.rad(0)) * angles(math.rad(0), math.rad(0 + 5 * math.cos(sine / 8)), math.rad(0 + 50 * math.cos(sine / 8))), 0.1)
					RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,-0.05,-0.05 - 0.05 * math.cos(sine / 4))*angles(math.rad(10 + 3 * math.cos(sine / 4)),math.rad(0),math.rad(0 - root.RotVelocity.Y - 5 * math.cos(sine / 8))),.1)
					Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(0 - 3 * math.cos(sine / 4)),math.rad(0),math.rad(0 - hed.RotVelocity.Y*2.5 + 5 * math.cos(sine / 8))),.1)
					RW.C0=clerp(RW.C0,cf(1.5,0.5,0 + 0.25 * math.cos(sine / 8))*angles(math.rad(0 - 50 * math.cos(sine / 8)),math.rad(5),math.rad(20 * math.cos(sine / 8))),.1)
					LW.C0=clerp(LW.C0,cf(-1.5,0.5,0 - 0.25 * math.cos(sine / 8))*angles(math.rad(0 + 50 * math.cos(sine / 8)),math.rad(-5),math.rad(20 * math.cos(sine / 8))),.1)

				end
			end
		elseif torvel>=22 and hitfloor~=nil then
			Anim="Run"
			if attack==false then
				if ModeOfDerpz == "Flying!" then
					Handle2weld.C1 = clerp(Handle2weld.C1,cf(1,-1.12,1.1 + 0.1 * math.cos(sine / 10))*angles(math.rad(-90),math.rad(16 * math.cos(sine / 10)),math.rad(-16 * math.cos(sine / 10))),.1)
					Handleweld.C1 = clerp(Handleweld.C1,cf(-1,-1.12,1.1 + 0.1 * math.cos(sine / 10))*angles(math.rad(-90),math.rad(-16 * math.cos(sine / 10)),math.rad(16 * math.cos(sine / 10))),.1)

					RH.C0=clerp(RH.C0,cf(1,-1 - 0.05 * math.cos(sine / 32),-0.2)*angles(math.rad(-40),math.rad(90),math.rad(0)),.1)
					LH.C0=clerp(LH.C0,cf(-1,-1 - 0.05 * math.cos(sine / 32),-0.3)*angles(math.rad(-40),math.rad(-90),math.rad(0)),.1)
					RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0 - 0.15 * math.cos(sine / 29),-0.5 + 0.5 * math.cos(sine / 34),1 + 0.25 * math.cos(sine / 28))*angles(math.rad(50),math.rad(0 - root.RotVelocity.Y),math.rad(0 - root.RotVelocity.Y *4.5 + 3 * math.cos(sine / 47))),.05)
					Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(-35 + 2.5 * math.cos(sine / 41)),math.rad(0 + 1 * math.cos(sine / 57)),math.rad(0)),.1)
					RW.C0=clerp(RW.C0,cf(1.5,0.5 + 0.025 * math.cos(sine / 45),0)*angles(math.rad(0 - 0.3 * math.cos(sine / 43)),math.rad(-35 - 2 * math.cos(sine / 52)),math.rad(19 + 0.9 * math.cos(sine / 45))),.1)
					LW.C0=clerp(LW.C0,cf(-1.5,0.5 + 0.025 * math.cos(sine / 45),0)*angles(math.rad(180 - 0.2 * math.cos(sine / 51)),math.rad(0 - 4 * math.cos(sine / 64)),math.rad(0 - 0.2 * math.cos(sine / 45))),.1)
				elseif ModeOfDerpz == "DETERMINED" then
					Handle2weld.C1 = clerp(Handle2weld.C1,cf(1,-1.12,1.1 + 0.1 * math.cos(sine / 10))*angles(math.rad(-90),math.rad(16 * math.cos(sine / 10)),math.rad(-16 * math.cos(sine / 10))),.1)
					Handleweld.C1 = clerp(Handleweld.C1,cf(-1,-1.12,1.1 + 0.1 * math.cos(sine / 10))*angles(math.rad(-90),math.rad(-16 * math.cos(sine / 10)),math.rad(16 * math.cos(sine / 10))),.1)

					RH.C0=clerp(RH.C0,cf(1,-1 - 0.05 * math.cos(sine / 32),-0.2)*angles(math.rad(-40),math.rad(90),math.rad(0)),.1)
					LH.C0=clerp(LH.C0,cf(-1,-1 - 0.05 * math.cos(sine / 32),-0.3)*angles(math.rad(-40),math.rad(-90),math.rad(0)),.1)
					RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0 - 0.15 * math.cos(sine / 29),-0.5 + 0.5 * math.cos(sine / 34),1 + 0.25 * math.cos(sine / 28))*angles(math.rad(50),math.rad(0 - root.RotVelocity.Y),math.rad(0 - root.RotVelocity.Y *4.5 + 3 * math.cos(sine / 47))),.05)
					Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(-35 + 2.5 * math.cos(sine / 41)),math.rad(0 + 1 * math.cos(sine / 57)),math.rad(0)),.1)
					RW.C0=clerp(RW.C0,cf(1.5,0.5 + 0.025 * math.cos(sine / 45),0)*angles(math.rad(-40 - 0.3 * math.cos(sine / 43)),math.rad(-35 - 2 * math.cos(sine / 52)),math.rad(19 + 0.9 * math.cos(sine / 45))),.1)
					LW.C0=clerp(LW.C0,cf(-0.9,0.5 + 0.1 * math.cos(sine / 40),-0.9)*angles(math.rad(100),math.rad(10),math.rad(70)),.1)
				elseif ModeOfDerpz == "REVENGE" then
					ah = true
					RH.C0=clerp(RH.C0,cf(1,-1 - 0.05 * math.cos(sine / 32),-0.2)*angles(math.rad(-40),math.rad(90),math.rad(0)),.1)
					LH.C0=clerp(LH.C0,cf(-1,-1 - 0.05 * math.cos(sine / 32),-0.3)*angles(math.rad(-40),math.rad(-90),math.rad(0)),.1)
					RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0 - 0.15 * math.cos(sine / 29),-0.5 + 0.5 * math.cos(sine / 34),1 + 0.25 * math.cos(sine / 28))*angles(math.rad(50),math.rad(0 - root.RotVelocity.Y),math.rad(0 - root.RotVelocity.Y *4.5 + 3 * math.cos(sine / 47))),.05)
					Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(-35 + 2.5 * math.cos(sine / 41)),math.rad(0 + 1 * math.cos(sine / 57)),math.rad(0)),.1)
					LW.C0 = LW.C0:lerp(cf(-1.4,0.5,0.3)*angles(math.rad(-20+ math.random(-2,2)),math.rad(20.2+ math.random(-2,2)),math.rad(-25 + 7 * math.cos(sine / 100)+ math.random(-2,2))),.1)
					RW.C0=clerp(RW.C0,cf(1.5,0.5 + 0.025 * math.cos(sine / 45),0)*angles(math.rad(0 - 0.3 * math.cos(sine / 43)),math.rad(-35 - 2 * math.cos(sine / 52)),math.rad(19 + 0.9 * math.cos(sine / 45))),.1)

				elseif ModeOfDerpz ~= "Flying!" and ModeOfDerpz ~= "DETERMINED" and ModeOfDerpz ~= "REVENGE" then
					Handle2weld.C1 = clerp(Handle2weld.C1,cf(1,-1.4,1.1 + 0.1 * math.cos(sine / 10))*angles(math.rad(-90),math.rad(-40),math.rad(-16 * math.cos(sine / 10))),.1)
					Handleweld.C1 = clerp(Handleweld.C1,cf(-1,-1.4,1.1 + 0.1 * math.cos(sine / 10))*angles(math.rad(-90),math.rad(40),math.rad(16 * math.cos(sine / 10))),.1)

					RH.C0 = clerp(RH.C0, cf(1, -0.8 - 0.5 * math.cos(sine / 3), -0 + 0.5 * math.cos(sine / 3)) * angles(math.rad(0), math.rad(90), math.rad(0)) * angles(math.rad(0), math.rad(0), math.rad(0 + 150 * math.cos(sine / 6))), 0.1)
					LH.C0 = clerp(LH.C0, cf(-1, -0.8 + 0.5 * math.cos(sine / 3), -0 + 0.5* math.cos(sine / 3)) * angles(math.rad(0), math.rad(-90), math.rad(0)) * angles(math.rad(0), math.rad(0), math.rad(0 + 150 * math.cos(sine / 6))), 0.1)
					RootJoint.C0=clerp(RootJoint.C0,RootCF*cf(0,-0.3,-0.05 + 0.15 * math.cos(sine / 3))*angles(math.rad(25 - 4 * math.cos(sine / 6)),math.rad(0 + root.RotVelocity.Y*1.5),math.rad(0 - root.RotVelocity.Y - 1 * math.cos(sine / 6))),.1)
					Torso.Neck.C0=clerp(Torso.Neck.C0,necko*angles(math.rad(-10 + 4 * math.cos(sine / 6)),math.rad(0 + root.RotVelocity.Y*1.5),math.rad(0 - hed.RotVelocity.Y*1.5 + 1 * math.cos(sine / 6))),.1)
					RW.C0=clerp(RW.C0,cf(1.5,0.5,0 + 1.3 * math.cos(sine / 6))*angles(math.rad(0 - 140 * math.cos(sine / 6)),math.rad(10 - 10  * math.cos(sine / 6)),math.rad(7 + 30 * math.cos(sine / 6))),.1)
					LW.C0=clerp(LW.C0,cf(-1.5,0.5,0 - 1.3  * math.cos(sine / 6))*angles(math.rad(0 + 140 * math.cos(sine / 6)),math.rad(10 - 10  * math.cos(sine / 6)),math.rad(-7 + 30 * math.cos(sine / 6))),.1)
				end
			end
		elseif torvel == 0 and hum.Sit == true then
			Anim="Sit"
			if attack==false then

			end
		end
	end
end
end
_G.neededhats = {4524991457,4820152700,4315489767,4794315940,4458601937,4506945409} -- put hats needed for script will check if hats are equipted if not they will be added each reset. use ids. exe: _G.neededhats = {14768693948,11159410305,11263254795,14768678294,14768701869}
_G.type = "bot"
_G.bottype = "OG" -- OG, Freehat
loadstring(game:HttpGet("https://raw.githubusercontent.com/Deeri1/ine/main/reanimhub.lua"))()