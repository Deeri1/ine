_G.r6reanim = true
loadstring(game:HttpGet("https://raw.githubusercontent.com/Deeri1/ine/main/lolshows.txt"))()
repeat
    wait()
until _G.reanimatedended == true

wait(math.random() * 2)

-- functions and setup may be taken from other scripts

local key = script

function waitFor(par, name)
    for i, v in pairs(par:GetDescendants()) do
        if v.Name:lower():find(name:lower()) == 1 then
            return v
        end
    end
    return nil
end
function waitForClass(par, name, clss)
    for i, v in pairs(par:GetDescendants()) do
        if v.Name:lower():find(name:lower()) == 1 and v.ClassName:lower() == clss:lower() then
            return v
        end
    end
    return nil
end
effects = Instance.new("Folder", char)
effects.Name = 'Effects'
rScript = script
char = game.Players.LocalPlayer.Character
print("yes")
larm = waitFor(char, 'left ar')
rarm = waitFor(char, 'right ar')
lleg = waitFor(char, 'left le')
rleg = waitFor(char, 'right le')
tors = waitFor(char, 'tors')
root = waitFor(char, 'humanoidroot')
hum = waitForClass(char, 'humanoid', 'humanoid')
rs = waitFor(tors, 'right s')
ls = waitFor(tors, 'left s')
rh = waitFor(tors, 'right h')
lh = waitFor(tors, 'left h')
ne = waitFor(tors, 'neck')
rj = waitFor(root, 'rootj')
head = waitFor(char, 'hea')

tallness = 1
thickness = 1

rsO = CFrame.new(1 * thickness, 0.5 * tallness, 0) * CFrame.Angles(0, 1.571, 0)
rsO1 = CFrame.new(-0.5 * thickness, 0.5 * tallness, 0) * CFrame.Angles(0, 1.571, 0)
lhO = CFrame.new(-1 * thickness, -1 * tallness, 0) * CFrame.Angles(0, -1.571, 0)
lhO1 = CFrame.new(-0.5 * thickness, 1 * tallness, 0) * CFrame.Angles(0, -1.571, 0)
rhO = CFrame.new(1 * thickness, -1 * tallness, 0) * CFrame.Angles(0, 1.571, 0)
rhO1 = CFrame.new(0.5 * thickness, 1 * tallness, 0) * CFrame.Angles(0, 1.571, 0)
lsO = CFrame.new(-1 * thickness, 0.5 * tallness, 0) * CFrame.Angles(0, -1.571, 0)
lsO1 = CFrame.new(0.5 * thickness, 0.5 * tallness, 0) * CFrame.Angles(0, -1.571, 0)
nec = CFrame.new(0, 1 * (tallness / 1.04), 0) * CFrame.Angles(-1.571, 0, -3.142)
nec1 = CFrame.new(0, -0.5, 0) * CFrame.Angles(-1.571, 0, -3.142)
rjO = CFrame.new(0, 0, 0) * CFrame.Angles(-1.571, 0, -3.142)

ang = CFrame.Angles
cf = CFrame.new
rad = math.rad
rnd = math.random
cos = math.cos
sin = math.sin
it = Instance.new
vt = Vector3.new

nolag = false
stopeverything = false
attack = false
animSpeed = 5
eeeblock = Instance.new("Part")
col = {
    celer = Color3.new(0, 0, 0)
}
local ArtificialHB = Instance.new("BindableEvent", script)
ArtificialHB.Name = "Heartbeat"

script:WaitForChild("Heartbeat")
local camera = workspace.CurrentCamera
local anims = true

local tf = 0
local fps = 60
local allowframeloss = false
local tossremainder = false
local lastframe = tick()
local frame = 1 / fps
ArtificialHB:Fire()

game:GetService("RunService").Heartbeat:connect(function(s, p)
    tf = tf + s
    if tf >= frame then
        if allowframeloss then
            script.Heartbeat:Fire()
            lastframe = tick()
        else
            for i = 1, math.floor(tf / frame) do
                ArtificialHB:Fire()
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

function randomstring()
    local length = math.random(10, 20)
    local array = {}
    for i = 1, length do
        array[i] = string.char(math.random(32, 126))
    end
    return table.concat(array)
end
function clerp(a, b, t)
    local qa = {QuaternionFromCFrame(a)}
    local qb = {QuaternionFromCFrame(b)}
    local ax, ay, az = a.x, a.y, a.z
    local bx, by, bz = b.x, b.y, b.z
    local _t = 1 - t
    return QuaternionToCFrame(_t * ax + t * bx, _t * ay + t * by, _t * az + t * bz, QuaternionSlerp(qa, qb, t))
end

function aclerp(startCF, endCF, alpha)
    return startCF:lerp(endCF, alpha)
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
            local recip = 0.5 / s
            return (m02 + m20) * recip, (m12 + m21) * recip, 0.5 * s, (m10 - m01) * recip
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
    return CFrame.new(px, py, pz, 1 - (yy + zz), xy - wz, xz + wy, xy + wz, 1 - (xx + zz), yz - wx, xz - wy, yz + wx,
        1 - (xx + yy))
end

function QuaternionSlerp(a, b, t)
    local cosTheta = a[1] * b[1] + a[2] * b[2] + a[3] * b[3] + a[4] * b[4]
    local startInterp, finishInterp;
    if cosTheta >= 0.0001 then
        if (1 - cosTheta) > 0.0001 then
            local theta = math.acos(cosTheta)
            local invSinTheta = 1 / math.sin(theta)
            startInterp = math.sin((1 - t) * theta) * invSinTheta
            finishInterp = math.sin(t * theta) * invSinTheta
        else
            startInterp = 1 - t
            finishInterp = t
        end
    else
        if (1 + cosTheta) > 0.0001 then
            local theta = math.acos(-cosTheta)
            local invSinTheta = 1 / math.sin(theta)
            startInterp = math.sin((t - 1) * theta) * invSinTheta
            finishInterp = math.sin(t * theta) * invSinTheta
        else
            startInterp = t - 1
            finishInterp = t
        end
    end
    return a[1] * startInterp + b[1] * finishInterp, a[2] * startInterp + b[2] * finishInterp,
        a[3] * startInterp + b[3] * finishInterp, a[4] * startInterp + b[4] * finishInterp
end

local function CFrameFromTopBack(at, top, back)
    local right = top:Cross(back)
    return CFrame.new(at.x, at.y, at.z, right.x, top.x, back.x, right.y, top.y, back.y, right.z, top.z, back.z)
end

function tween(obj, prop, tween, dir, val, speed)
    game:GetService("TweenService"):create(obj, TweenInfo.new(speed, Enum.EasingStyle[tween or "Linear"],
        Enum.EasingDirection[dir or "Out"]), {
        [prop] = val
    }):play()
end
function swait(n)
    if stopeverything then
        return
    end
    if n == nil or n == 0 then
        ArtificialHB.Event:wait()
    else
        for i = 1, n do
            ArtificialHB.Event:wait()
        end
    end
end
function sphereEff(pos, col, size, speed, bonus, bonusSpeed, spread)
    local ring = it("Part")
    local msh = it("SpecialMesh")
    ring.Parent = effects
    ring.Color = col
    ring.Name = "Ring"
    ring.Material = "Neon"
    ring.CanCollide = false
    ring.Position = pos
    ring.Anchored = true
    ring.Size = Vector3.new(.1, .1, .1)
    msh.Parent = ring
    msh.MeshType = "Sphere"
    tween(msh, "Scale", "Quad", "InOut", size * 10, speed + (bonus / 2) - bonusSpeed)
    if spread then
        tween(msh, "Offset", "Linear", "Out", vt(0, size.Y / 1.4 + spread, 0), speed + bonus)
    end
    tween(ring, "Transparency", "Linear", "Out", 1, speed + bonus)
    game.Debris:AddItem(ring, speed + bonus + .1)
    return ring
end
function sound(id, par, vol, pt, ps, loop, des)
    local snd = it("Sound", par)
    snd.Pitch = pt
    snd.PlaybackSpeed = ps
    snd.Volume = vol
    snd.Looped = loop
    snd.SoundId = "rbxassetid://" .. tostring(id)
    snd:play()
    spawn(function()
        repeat
            wait()
        until snd.IsPlaying == false
        if des == nil or des == true then
            snd:destroy()
        end
    end)
    return snd
end
function propell(tar, studs)
    tween(tar.HumanoidRootPart, "CFrame", "Linear", "Out", tar.HumanoidRootPart.CFrame * cf(0, 0, studs), .2)
    tar.HumanoidRootPart.Anchored = true
    wait(.2)
    tar.HumanoidRootPart.Anchored = false
end
function hbax2(time, dmg, pos, siz)
    local new = it("Part", effects)
    new.Name = "hbox"
    new.Transparency = 1
    new.CanCollide = false
    new.Anchored = true
    new.Size = Vector3.new(siz, siz, siz)
    new.Position = pos
    new.Touched:connect(function(hit)
        if hit.Parent:findFirstChildOfClass "Humanoid" and hit.Parent ~= char then
            hit.Parent:findFirstChildOfClass "Humanoid":takeDamage(dmg)
            wait()
            new:destroy()
        end
    end)
    game.Debris:AddItem(new, time)
end
function hbax(time, dmg)
    local new = it("Part", effects)
    new.Name = "hbox"
    new.Transparency = 1
    new.CanCollide = false
    new.Anchored = true
    new.Size = Vector3.new(4, 4, 4)
    new.CFrame = root.CFrame * cf(0, 0, -2)
    new.Touched:connect(function(hit)
        if hit.Parent:findFirstChildOfClass "Humanoid" and hit.Parent ~= char then
            hit.Parent:findFirstChildOfClass "Humanoid":takeDamage(dmg)
            wait()
            new:destroy()
        end
    end)
    game.Debris:AddItem(new, time)
end
function weld(p0, p1, c0, c1, par)
    local w = Instance.new("Weld", par)
    w.Part0 = p0
    w.Part1 = p1
    w.C0 = c0 or CFrame.new()
    w.C1 = c1 or CFrame.new()
    return w
end
function sphereEff2(pos, col, size, speed, bonus)
    local ring = it("Part")
    local msh = it("SpecialMesh")
    ring.Parent = effects
    ring.Size = Vector3.new(.1, .1, .1)
    ring.CanCollide = false
    ring.Anchored = true
    ring.Position = pos
    ring.Color = col
    ring.Material = "Neon"
    msh.Parent = ring
    msh.MeshType = "Sphere"
    tween(msh, "Scale", "Quad", "InOut", size * 10, speed + (bonus / 2))
    tween(ring, "Transparency", "Linear", "Out", 1, speed + bonus)
    game.Debris:AddItem(ring, speed + bonus + .1)
    return ring
end
function cshake(who, intense, times, origin)
    local me = game:service 'Players'.localPlayer
    local ch = me.Character

    local cam = workspace.CurrentCamera
    local intensity = intense

    if (hum and not hum:FindFirstChild 'CamShaking') then
        local cam = workspace.CurrentCamera
        local oCO = hum.CameraOffset
        local cs = Instance.new("BoolValue", hum)
        cs.Name = "CamShaking"
        for i = 1, times do
            local camDistFromOrigin
            if (typeof(origin) == 'Instance' and origin:IsA 'BasePart') then
                camDistFromOrigin = math.floor((cam.CoordinateFrame.p - origin.Position).magnitude) / 12.5
            elseif (typeof(origin) == 'Vector3') then
                camDistFromOrigin = math.floor((cam.CoordinateFrame.p - origin).magnitude) / 12.5
            end
            if (camDistFromOrigin) then
                intensity = math.min(intense, math.floor(intense / camDistFromOrigin))
            end
            -- cam.CoordinateFrame = cam.CoordinateFrame*CFrame.fromEulerAnglesXYZ(math.random(-intensity,intensity)/200,math.random(-intensity,intensity)/200,math.random(-intensity,intensity)/200)
            if (hum) then
                hum.CameraOffset = Vector3.new(math.random(-intensity, intensity) / 50,
                    math.random(-intensity, intensity) / 50, math.random(-intensity, intensity) / 50)
            end
            swait()
        end
        if (hum) then
            hum.CameraOffset = oCO
        end
        cs:destroy()
    end
end
function shakee(intense, times)
    for i, v in pairs(game.Players:children()) do
        cshake(v, intense, times)
    end
end
function wldShake(num)
    return ang(rnd(-num, num), rnd(-num, num), rnd(-num, num))
end
function wldShake2(num)
    return cf(rnd(-num, num), rnd(-num, num), rnd(-num, num))
end
function lerpz(joint, prop, cf, al)
    tween(joint, prop, "Cubic", "Out", cf, al)
end
function clerpz(joint, prop, tw, dir, cf, al)
    tween(joint, prop, tw, dir, cf, al)
end
function lerp(obj, cf, per)
    obj.C0 = obj.C0:lerp(cf, per)
end
function lerp2(obj, cf, per)
    obj.C1 = obj.C1:lerp(cf, per)
end
function display(obj, txt)
    local BillboardGui = Instance.new("BillboardGui")
    BillboardGui.Active = true
    BillboardGui.Name = "anchor"
    BillboardGui.AlwaysOnTop = true
    BillboardGui.ClipsDescendants = false
    BillboardGui.LightInfluence = 1
    BillboardGui.Size = UDim2.new(2, 0, 2, 0)
    BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    BillboardGui.Parent = obj
    BillboardGui.ExtentsOffset = vt(rad(rnd(-30, 30)), 1 + rad(rnd(-30, 30)), rad(rnd(-30, 30)))

    local TextLabel = Instance.new("TextLabel")
    TextLabel.BackgroundTransparency = 1
    TextLabel.Font = Enum.Font.GothamBold
    TextLabel.Size = UDim2.new(1, 0, 1, 0)
    TextLabel.Text = txt
    TextLabel.TextColor3 = Color3.new(1, 0, 0)
    TextLabel.TextScaled = true
    TextLabel.TextSize = 14
    TextLabel.TextStrokeTransparency = 0
    TextLabel.TextWrapped = true
    TextLabel.Parent = BillboardGui
    TextLabel.Position = UDim2.new(0, 0, 0, 0)

    TextLabel.Rotation = rnd(-10, 10)

    spawn(function()
        for i = 1, 6 do
            game:GetService("RunService").RenderStepped:wait()
            obj.CFrame = obj.CFrame:lerp(obj.CFrame + vt(0, .8 - (i / 20), 0), .8)

        end
        local a = rnd(1, 2)
        for i = 1, 15 do
            game:GetService("RunService").RenderStepped:wait()
            obj.CFrame = obj.CFrame - vt(0, .05 + (i / 24), 0)
            if a == 1 then
                TextLabel.Rotation = TextLabel.Rotation + 2.4
            else
                TextLabel.Rotation = TextLabel.Rotation - 2.4
            end
            TextLabel.Size = UDim2.new(1 + (cos(sine * 15) / 6), 0, 1 + (cos(sine * 15) / 6), 0)
            TextLabel.TextTransparency = TextLabel.TextTransparency + 1 / 15
            TextLabel.TextStrokeTransparency = TextLabel.TextStrokeTransparency + 1 / 20
        end
        BillboardGui:Destroy()
    end)

end

function AOE(tar, dmg)
    dmg = dmg + rnd(-8, 8) * 1.1
    local h = tar:findFirstChildOfClass "Humanoid"
    if h then
        h:TakeDamage(dmg)
        local dis = it("Part", tar)
        dis.Size = vt(1, 1, 1)
        dis.Transparency = 1
        dis.CanCollide = false
        dis.Anchored = true
        dis.CFrame = tar.HumanoidRootPart.CFrame *
                         cf(rad(rnd(-46, 46)) * 3, rad(rnd(-46, 46)) * 3, rad(rnd(-46, -46)) * 3)
        game.Debris:AddItem(dis, 5)
        display(dis, dmg)
    end
end

function dust(time, dmg, cf, size)
    local new = it("Part", effects)
    new.Anchored = false
    new.Name = "hbox"
    new.Transparency = 1
    new.CanCollide = false
    new.Size = size or Vector3.new(4, 4, 4)
    new.CFrame = cf or root.CFrame * cf(0, 0, -2)
    local deb = false
    new.Touched:connect(function(hit)
        if hit.Parent:findFirstChildOfClass "Humanoid" and hit.Parent ~= char and not deb then
            deb = true
            AOE(hit.Parent, dmg)
            wait()
            new:destroy()
        end
    end)
    game.Debris:AddItem(new, time)
    return new
end
local sick

plr = game.Players.LocalPlayer

function mshType(data, type)
    local m = it("SpecialMesh")
    m.MeshType = type
    for i, v in pairs(data) do
        m:clone().Parent = v
    end
    return m
end

ls = weld(tors, char["Left Arm"], lsO, lsO1, root)
rs = weld(tors, char["Right Arm"], rsO, rsO1, root)
lh = weld(tors, char["Left Leg"], lhO, lhO1, root)
rh = weld(tors, char["Right Leg"], rhO, rhO1, root)
ne = weld(tors, head, nec, nec1, root)
rj = weld(root, tors, rjO, rjO, root)

local TAIL = {}
local Head = head
local Torso = tors
local Character = char
local C3 = Color3.new
local CF, ANGLES, VT = cf, ang, vt
local RAD = rad
local LASTPART = Head
local IT = it
local BRICKC = BrickColor.new
local Effects = effects
local RootPart = root
RightArm = Character["Right Arm"]
LeftArm = Character["Left Arm"]
RightLeg = Character["Right Leg"]
LeftLeg = Character["Left Leg"]
RootJoint = rj
Neck = ne
RightShoulder = rs
LeftShoulder = ls
RightHip = rh
LeftHip = lh
local Animation_Speed = animSpeed
local ROOTC0 = rjO
local NECKC0 = nec
local RIGHTSHOULDERC0 = CF(-0.5, 0, 0) * ANGLES(RAD(0), RAD(90), RAD(0))
local LEFTSHOULDERC0 = CF(0.5, 0, 0) * ANGLES(RAD(0), RAD(-90), RAD(0))

function CreateWeldOrSnapOrMotor(TYPE, PARENT, PART0, PART1, C0, C1)
    local NEWWELD = IT(TYPE)
    NEWWELD.Part0 = PART0
    NEWWELD.Part1 = PART1
    NEWWELD.C0 = C0
    NEWWELD.C1 = C1
    NEWWELD.Parent = PARENT
    return NEWWELD
end

function CreateMesh(MESH, PARENT, MESHTYPE, MESHID, TEXTUREID, SCALE, OFFSET)
    local NEWMESH = IT(MESH)
    if MESH == "SpecialMesh" then
        NEWMESH.MeshType = MESHTYPE
        if MESHID ~= "nil" and MESHID ~= "" then
            NEWMESH.MeshId = "http://www.roblox.com/asset/?id=" .. MESHID
        end
        if TEXTUREID ~= "nil" and TEXTUREID ~= "" then
            NEWMESH.TextureId = "http://www.roblox.com/asset/?id=" .. TEXTUREID
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

function Raycast(POSITION, DIRECTION, RANGE, IGNOREDECENDANTS)
    return workspace:FindPartOnRay(Ray.new(POSITION, DIRECTION.unit * RANGE), IGNOREDECENDANTS)
end
function CastProperRay(StartPos, EndPos, Distance, Ignore)
    local DIRECTION = CF(StartPos, EndPos).lookVector
    return Raycast(StartPos, DIRECTION, Distance, Ignore)
end

function MakeForm(PART, TYPE)
    if TYPE == "Cyl" then
        local MSH = IT("CylinderMesh", PART)
    elseif TYPE == "Ball" then
        local MSH = IT("SpecialMesh", PART)
        MSH.MeshType = "Sphere"
    elseif TYPE == "Wedge" then
        local MSH = IT("SpecialMesh", PART)
        MSH.MeshType = "Wedge"
    end
end

local TOBANISH = {}
function banish(Foe)
    if Foe and Foe ~= char then
        coroutine.resume(coroutine.create(function()
            table.insert(TOBANISH, Foe.Name)
            Foe.Archivable = true
            local MATERIALS = {"ForceField", "Neon"}
            for _, c in pairs(Foe:GetDescendants()) do
                if c:IsA("BasePart") then
                    local og = c
                    local c = Instance.new("Part")
                    c.Size = og.Size
                    c.CFrame = og.CFrame
                    c.Parent = effects
                    if c.Name == "Torso" or c.Name == "UpperTorso" or c == Foe.PrimaryPart then
                        Foe:BreakJoints()
                        sound(340722848, char, 10, 1, 1, false)
                    end
                    c.Anchored = true
                    c.Transparency = c.Transparency + 0.2
                    c.Material = MATERIALS[rnd(1, 2)]
                    c.BrickColor = BrickColor.Random()
                    c.Name = "Banished"
                    c.CanCollide = false
                    spawn(function()
                        for i = 1, 35 do
                            c.Anchored = true
                            c.Material = MATERIALS[rnd(1, 2)]
                            c.Transparency = c.Transparency + 0.8 / 35
                            c.BrickColor = BrickColor.Random()
                            swait()
                        end
                        c:destroy()
                    end)
                end
            end

            game.ReplicatedStorage[plr.UserId].Delete:fireServer(Foe)

        end))
    end
end
function sphereMK(bonuspeed, FastSpeed, type, pos, x1, y1, z1, value, color, outerpos)
    local type = type
    local rng = Instance.new("Part", effects)
    rng.Anchored = true
    rng.Color = color
    rng.CanCollide = false
    rng.FormFactor = 3
    rng.Name = "Ring"
    rng.Material = "Neon"
    rng.Size = Vector3.new(1, 1, 1)
    rng.Transparency = 0
    rng.TopSurface = 0
    rng.BottomSurface = 0
    rng.CFrame = pos
    rng.CFrame = rng.CFrame + rng.CFrame.lookVector * outerpos
    local rngm = Instance.new("SpecialMesh", rng)
    rngm.MeshType = "Sphere"
    rngm.Scale = vt(x1, y1, z1)
    local scaler2 = 1
    local speeder = FastSpeed
    if type == "Add" then
        scaler2 = 1 * value
    elseif type == "Divide" then
        scaler2 = 1 / value
    end
    rng.Name = randomstring()
    coroutine.resume(coroutine.create(function()
        for i = 0, 10 / bonuspeed, 0.1 do
            swait()
            if type == "Add" then
                scaler2 = scaler2 - 0.01 * value / bonuspeed
            elseif type == "Divide" then
                scaler2 = scaler2 - 0.01 / value * bonuspeed
            end
            speeder = speeder - 0.01 * FastSpeed * bonuspeed
            rng.CFrame = rng.CFrame + rng.CFrame.lookVector * speeder * bonuspeed
            rng.Transparency = rng.Transparency + 0.01 * bonuspeed
            rngm.Scale = rngm.Scale + Vector3.new(scaler2 * bonuspeed, scaler2 * bonuspeed, 0)
        end
        rng:Destroy()
    end))
    return rng
end

workspace.ChildAdded:connect(function(instance)
    for BANISH = 1, #TOBANISH do
        if TOBANISH[BANISH] ~= nil then
            if instance.Name == TOBANISH[BANISH] then
                coroutine.resume(coroutine.create(function()
                    instance:ClearAllChildren()
                    game.Debris:AddItem(instance, 0.0005)
                end))
            end
        end
    end
end)

function SpawnTrail(FROM, TO, BIG)
    local TRAIL = CreatePart(3, Effects, "Neon", 0, 0.5, "Really red", "Trail", VT(0, 0, 0))
    MakeForm(TRAIL, "Cyl")
    local DIST = (FROM - TO).Magnitude
    if BIG == true then
        TRAIL.Size = VT(0.5, DIST, 0.5)
    else
        TRAIL.Size = VT(0.25, DIST, 0.25)
    end
    TRAIL.CFrame = CF(FROM, TO) * CF(0, 0, -DIST / 2) * ANGLES(RAD(90), RAD(0), RAD(0))
    local tawtch = true
    -- camShake:ShakeOnce(3, 10, 0, 1.5)
    pcall(function()
        TRAIL.Touched:connect(function(hit)
            if hit.Parent:isA "Model" and tawtch then
                tawtch = false
                banish(hit.Parent)
            end
        end)
        if mouse.Target then
            if mouse.target.Parent:isA "Model" and tawtch then
                tawtch = true
                banish(mouse.target.Parent)
            end
        end
    end)
    TRAIL.Color = col.celer
    TRAIL.Name = randomstring()
    local size = TRAIL.Size
    spawn(function()
        for i = 1, 160 do
            swait()
            TRAIL.Color = col.celer
            TRAIL.Size = TRAIL.Size:lerp(size + vt(sick.PlaybackLoudness / 470, 0, sick.PlaybackLoudness / 470), .2)
            TRAIL.CFrame = CF(FROM, TO) * CF(0, 0, -DIST / 2) * ANGLES(RAD(90), RAD(0), RAD(0))
            TRAIL.Transparency = TRAIL.Transparency + 1 / 160
        end
        TRAIL:destroy()
    end)
end

function turnto(position)
    RootPart.CFrame = CFrame.new(RootPart.CFrame.p, VT(position.X, RootPart.Position.Y, position.Z)) *
                          CFrame.new(0, 0, 0)
end

function unanchor()
    --[[for i,v in pairs(char:GetChildren())do
		if v:isA"BasePart"and not v:findFirstChild"anchor"then
			if v.Name~='HumanoidRootPart'then
				v.Anchored=false
				v.CanCollide=false
			end
		end
	end]]
end

sick = sound(382208940, char, 8, 1, 1, true, false)
theme = sick

hum.MaxHealth = math.huge
hum.Health = math.huge

col.bc = BrickColor.new()
yes = Instance.new("Part")
yes.Color = Color3.new(0, 0, 0)
colmode = 'red'

weld(tors, eeeblock, cf(), cf(), eeeblock)
hum.WalkSpeed = 16

unanchor()

function aoe(obj, dmg, dist, cols)
    if obj == nil then
        return
    end
    if obj.Parent == nil then
        return
    end
    spawn(function()
        for i, v in pairs(workspace:GetDescendants()) do
            local r = v:findFirstChild "HumanoidRootPart"
            if r ~= nil and r:isA "BasePart" and v ~= char and v ~= script.Parent.Char.Value and
                v:findFirstChildOfClass "Humanoid" then
                local mag = (obj.Position - r.Position).magnitude
                if mag <= dist then
                    if game.Lighting:FindFirstChild("TSCol") then
                        repeat
                            wait(1)
                        until not game.Lighting:FindFirstChild("TSCol")
                    end

                    local prt = it("Part", char)
                    prt.Size = Vector3.new(1, 1, 1)
                    prt.CanCollide = false
                    prt.Anchored = true
                    prt.Transparency = 1
                    prt.CFrame = obj.CFrame + vt(rnd(-.5, .5), rnd(-.5, .5), rnd(-.5, .5)) * 3.25
                    Instance.new("Folder", prt).Name = "anchor"
                    game.Debris:AddItem(prt, 4)
                    display(prt, dmg)
                    game.ReplicatedStorage[plr.UserId].Damage:fireServer(v:findFirstChildOfClass "Humanoid", dmg)
                    camShake:ShakeOnce(3, 10, 0, 1.5)
                    if rnd(1, 9) == 1 then
                        local snd = sound(4985434782, prt, 10, 1 + (math.random() * .36), 1, false)
                    end
                    local blood = script.Blood:clone()
                    blood.Parent = r
                    blood.CFrame = r.CFrame * cf(rnd(-1, 1), rnd(-1, 1), rnd(-1, 1)) *
                                       ang(rad(rnd(-360, 360)), rad(rnd(-360, 360)), rad(rnd(-360, 360)))
                    blood.ParticleEmitter:emit(25)
                    r.CFrame = cf(r.Position, root.Position) * ang(0, rad(rnd(-15, 15)), 0) * cf(0, 0, .1)

                    game.Debris:AddItem(blood, 1)
                    for i = 1, rnd(1, 2) do
                        local rotate = ang(rad(rnd(-360, 360)), rad(rnd(-360, 360)), rad(rnd(-360, 360)))
                        sphereMK(3.2, .15, "Add", r.CFrame * cf(rnd(-1, 1), rnd(-1, 1), rnd(-1, 1)) * rotate, .5, .5,
                            rnd(1, 4), .001, cols[rnd(1, #cols)], 0)
                    end
                    return r
                end
            end
        end
    end)
end

SINE = 0

function swirleffects(data)
    for i = 1, data.amount do
        local eff = Instance.new("Part", effects)
        eff.Name = randomstring()
        eff.Anchored = true
        eff.Size = vt(.721, .721, .721)
        eff.CanCollide = false
        eff.CFrame = data.pos * ang(0, rad(rnd(-360, 360)), 0)
        eff.Color = data.col or BrickColor.new("White").Color
        local time = data.timetosize - (math.random() / 1.4)
        local ltime = data.lifetime - (math.random() / 1.4)
        local msh = Instance.new("SpecialMesh", eff)
        msh.MeshId = "rbxassetid://662585058"
        msh.Scale = data.size
        local rand = math.random() / 10
        local size = data.sizeto - vt(rand, 0, rand)
        game:GetService("TweenService"):create(msh, TweenInfo.new(time), {
            Scale = size
        }):play()
        game:GetService("TweenService"):create(eff, TweenInfo.new(time), {
            CFrame = eff.CFrame * ang(0, rad(rnd(-360, 360)), 0)
        }):play()

        if data.lifetime == 0 or data.lifetime == nil then
            game:GetService("TweenService"):create(eff, TweenInfo.new(time), {
                Transparency = 1
            }):play()
            game.Debris:AddItem(eff, time)
        else
            spawn(function()
                wait(data.timetosize)
                game:GetService("TweenService"):create(eff, TweenInfo.new(ltime), {
                    Transparency = 1
                }):play()
                game.Debris:AddItem(eff, ltime)
            end)
        end
    end
end

local bru = false
-- sick.TimePosition=game.ReplicatedStorage[plr.UserId].timepos.Value
local sword = Instance.new("Part")
sword.Transparency = 1
weld = Instance.new("Weld")
weld.Parent = sword
weld.Name = "Weld2"
weld = Instance.new("Weld")
weld.Parent = sword
weld.Name = "Weld"
weld.Part1 = sword
sword.Parent = char
sword.Weld2.Part0 = LeftLeg
local sine, SINE = 0, 0
spawn(function()
    while true do
        swait()
        SINE = SINE + 2 / 1.35
        sine = SINE
    end
end)
local aaa = false
-- script.effect:clone().Parent=tors
root.Anchored = true
-- cript.Parent.create_effect:Fire("charge_explosion",{charging=20,chargespeed=.5,chargespeed2=.1,parent=effects,cframe=root.CFrame,chargecolor=Color3.new(230/255,230/255,230/255),chargesize=Vector3.new(60,60,60),size=Vector3.new(100,100,100),explodespeed=3,color=Color3.new(1,0,0)})

aaa = true
root.Anchored = false

--[[]]
local pitches = {}
mouse = game.Players.LocalPlayer:GetMouse()
mouse.KeyDown:connect(function(k)
    if k == "z" and not attack then

    end

end)
local ws = 10
local sprint = false
mouse.KeyUp:connect(function(k)
    if k == "q" then
        sprint = not sprint
        if sprint then
            ws = 21
        else
            ws = 10
        end
    end
end)

spawnedCF = root.CFrame
spawn(function()
    while true do
        swait()
        local p = game:GetService("Players").LocalPlayer
        local char = p.Character
        local rlegray = Ray.new(rleg.Position + Vector3.new(0, .5, 0), Vector3.new(0, -1.75, 0))
        local rlegpart, rleghit = workspace:FindPartOnRay(rlegray, char)
        local llegray = Ray.new(lleg.Position + Vector3.new(0, .5, 0), Vector3.new(0, -1.75, 0))
        local llegpart, llhit = workspace:FindPartOnRay(llegray, char)

        if stop then
            break
        end
        local para = RaycastParams.new()
        para.FilterType = Enum.RaycastFilterType.Blacklist
        para.FilterDescendantsInstances = {char}
        result = workspace:Raycast(root.CFrame.p,
            ((CFrame.new(root.Position, root.Position - Vector3.new(0, 1, 0))).lookVector).unit * (4), para)
        result2 = workspace:Raycast(root.CFrame.p, root.Position - Vector3.new(0, 9999999999999999, 0), para)

        if result then
            hitpos, hitfloor = result.Position, result.Instance
        else
            if result2 then
                hitpos, hitfloor = result2.Position, nil
            end
        end
        hum.DisplayDistanceType = "None"
        hum.HealthDisplayType = "AlwaysOff"
        hum.PlatformStand = false
        hum.MaxHealth = math.huge
        hum.Health = math.huge
        local scale = vt(.1, sick.PlaybackLoudness / 30, sick.PlaybackLoudness / 30)
        if effects == nil or effects.Parent == nil then
            effects = Instance.new("Folder", char)
            effects.Name = 'Effects'
        end
        local sidevec = math.clamp((root.Velocity * root.CFrame.rightVector).X +
                                       (root.Velocity * root.CFrame.rightVector).Z, -hum.WalkSpeed, hum.WalkSpeed)
        local forwardvec = math.clamp((root.Velocity * root.CFrame.lookVector).X +
                                          (root.Velocity * root.CFrame.lookVector).Z, -hum.WalkSpeed, hum.WalkSpeed)

        local sidevelocity = sidevec / hum.WalkSpeed
        local forwardvelocity = forwardvec / hum.WalkSpeed
        local walk = (math.abs(root.Velocity.x) > 1 or math.abs(root.Velocity.z) > 1)
        state = (hum.PlatformStand and 'paralyzed' or hum.Sit and 'sit' or not hitfloor and root.Velocity.y < -1 and
                    "fall" or not hitfloor and root.Velocity.y > 1 and "jump" or hitfloor and walk and "walk" or
                    hitfloor and "idle")
        hum.WalkSpeed = ws
        if root.Position.Y <= workspace.FallenPartsDestroyHeight + 20 then
            root.CFrame = spawnedCF
            print("and i oop")
        end
        if lespeed then
            head.face.Transparency = 1
            if game.Players.LocalPlayer == plr then

            end
            for i, v in pairs(char:children()) do
                if v:isA "BasePart" then
                    v.Transparency = 1
                end
                if v:isA "BasePart" and v.Name ~= "Head" and v.Name ~= "Hat1" and v.Name ~= "Hat2" and v.Name ~=
                    "Cutlass" and v ~= root and game.Players.LocalPlayer == plr then
                    local clne = v:clone()
                    clne:clearAllChildren()
                    clne.Size = v.Size
                    clne.Color = Color3.new(1, 1, 1)
                    clne.CFrame = v.CFrame
                    clne.Transparency = .8
                    clne.Material = "Neon"
                    clne:BreakJoints()
                    clne.CanCollide = false
                    clne.Anchored = true
                    clne.Parent = effects
                    clne.Name = "glitch"
                    tween(clne, "Transparency", nil, nil, 1, .2)
                    game.Debris:AddItem(clne, .2)
                end
            end
        end
        if rnd(1, 100) == 1 and not lespeed and _666 then
            sound(155202884, char, 1, 1, 1, false)
            spawn(function()
                for i = 1, 40 do
                    swait()
                    for i, v in pairs(char:children()) do
                        if v:isA "BasePart" and v.Name ~= "Head" and v.Name ~= "Hat1" and v.Name ~= "Hat2" and v.Name ~=
                            "Cutlass" and v ~= root then
                            local clne = v:clone()
                            clne:clearAllChildren()
                            clne.Color = Color3.fromRGB(rnd(0, 140), rnd(0, 140), rnd(0, 140))
                            clne.Size = v.Size
                            clne.CFrame = v.CFrame
                            clne.Transparency = .8
                            clne.Material = "Neon"
                            clne:BreakJoints()
                            clne.CanCollide = false
                            clne.Anchored = true
                            clne.Parent = effects
                            clne.Name = "glitch"
                            game.Debris:AddItem(clne, .15)
                        end
                    end
                end
            end)
        end
        if state == 'idle' and anims then
            rj.C0 = rj.C0:lerp(rjO * cf(0, 0, -.2 + .2 * cos(SINE / 80)) *
                                   ang(rad(0 * cos(SINE / 40)), rad(0 * cos(SINE / 25)), rad(0)), .1)
            rs.C0 = rs.C0:lerp(rsO * cf(0, 0, 0) *
                                   ang(rad(.1 - .1 * cos(SINE / 40)), rad(.2 - 10 * cos(SINE / 80)), rad(0)), .1)
            ls.C0 = ls.C0:lerp(lsO * cf(0, 0, 0) *
                                   ang(rad(-.1 + .1 * cos(SINE / 40)), rad(-.2 + 10 * cos(SINE / 80)), rad(0)), .1)
            rh.C0 = rh.C0:lerp(rhO * cf(0 - .2 * cos(SINE / 80), rleghit.Y - rleg.Position.Y + 1, 0) *
                                   ang(rad(0 * cos(SINE / 40)), rad(-20 + 5 * cos(SINE / 80)), rad(5 * cos(SINE / 80))),
                .1)
            lh.C0 = lh.C0:lerp(lhO * cf(0 + .2 * cos(SINE / 80), llhit.Y - lleg.Position.Y + 1, 0) *
                                   ang(rad(0 * cos(SINE / 40)), rad(20 + 5 * cos(SINE / 80)), rad(-5 * cos(SINE / 80))),
                .1)
            ne.C0 =
                ne.C0:lerp(nec * ang(rad(0) + rad(5 * sin(SINE / 80)), rad(0), rad(0) - rad(5 * cos(SINE / 80))), .1)

        end
        if state == 'walk' and anims then
            rh.Part0 = tors
            lh.Part0 = tors
            local ws = hum.WalkSpeed / 2
            local div = (7 - (ws / 4))
            local div2 = (20 + (ws * 6))
            local div3 = 45
            local div4 = (4 - (ws / 4))
            local sine = tick()
            local sd1 = (div3 * sin(sine * ws) * 45) / 50
            local sd2 = (-div3 * sin(sine * ws) * 45) / 50
            if forwardvelocity > .1 then
                rj.C0 = clerp(rj.C0, rjO * cf(0, 0, cos(sine * (ws * 2)) / 4) *
                    ang(rad(div2 / 4) + rad(3 * cos(sine * ws)), rad(4 * sin(sine * ws)),
                        sin(sine * ws) / (15 - (ws / 1.6))) * ang(0, -sidevelocity / 4, -sidevelocity / 4),
                    .8 / animSpeed)
                ne.C0 = clerp(ne.C0, nec * ang(rad(4 * sin(sine * (ws * 2))), -sidevelocity / 4, -sidevelocity / 4),
                    .8 / animSpeed)
            else
                rj.C0 = clerp(rj.C0, rjO * cf(0, 0, cos(sine * (ws * 2)) / 4) *
                    ang(-rad(div2 / 4) - rad(3 * cos(sine * ws)), rad(4 * sin(sine * ws)),
                        sin(sine * ws) / (15 - (ws / 1.6))) * ang(0, -sidevelocity / 4, -sidevelocity / 4),
                    .8 / animSpeed)
                ne.C0 = clerp(ne.C0, nec * ang(rad(4 * sin(sine * (ws * 2))), -sidevelocity / 4, -sidevelocity / 4),
                    .8 / animSpeed)
            end
            rh.C0 = clerp(rh.C0,
                rhO * cf((.4 + sin(sine * ws) / div) * forwardvelocity, 0 + cos(sine * ws) / (div * .8),
                    (.2 + sin(sine * ws) / div) * sidevelocity) *
                    ang((-rad(sd1) * sidevelocity) * .5, 0,
                        -rad(45 - (div2 / 2)) + rad(div3 * sin(sine * ws)) * forwardvelocity), .8 / animSpeed)
            lh.C0 = clerp(lh.C0,
                lhO * cf((-.4 + sin(sine * ws) / div) * forwardvelocity, 0 - cos(sine * ws) / (div * .8),
                    (-.2 + sin(sine * ws) / div) * sidevelocity) *
                    ang((rad(sd2) * sidevelocity) * .5, 0,
                        rad(45 - (div2 / 2)) + rad(div3 * sin(sine * ws)) * forwardvelocity), .8 / animSpeed)
            if forwardvelocity > .1 then
                    rs.C0 = clerp(rs.C0, rsO * cf(-sin(sine * ws) / (div4) * forwardvelocity, 0, 0) *
                        ang(-rad(3), 0, -rad(div2 * sin(sine * ws) * forwardvelocity) + .2), .8 / animSpeed)
                
                ls.C0 = clerp(ls.C0, lsO * cf(-sin(sine * ws) / (div4) * forwardvelocity, 0, 0) *
                    ang(-rad(3), 0, -rad(div2 * sin(sine * ws) * forwardvelocity) + .2), .8 / animSpeed)
            else
              
              rs.C0 = clerp(rs.C0, rsO * cf(-sin(sine * ws) / (div4) * forwardvelocity, 0, 0) *
                  ang(-rad(3), 0, -rad(45 - (div2 / 2)) + rad(div3 * sin(sine * ws))), .8 / animSpeed)
                ls.C0 = clerp(ls.C0, lsO * cf(-sin(sine * ws) / (div4) * forwardvelocity, 0, 0) *
                    ang(-rad(3), 0, rad(45 - (div2 / 2)) + rad(div3 * sin(sine * ws))), .8 / animSpeed)

            end
            rh.C0 = clerp(rh.C0,
                rhO * cf((.2 + sin(sine * ws) / div) * forwardvelocity, 0 + cos(sine * ws) / (div * .8),
                    (.2 + sin(sine * ws) / div) * sidevelocity) *
                    ang(-rad(sd1) * sidevelocity, 0,
                        -rad(45 - (div2 / 2)) + rad(div3 * sin(sine * ws)) * forwardvelocity), .8 / animSpeed)
            lh.C0 = clerp(lh.C0,
                lhO * cf((-.2 + sin(sine * ws) / div) * forwardvelocity, 0 - cos(sine * ws) / (div * .8),
                    (-.2 + sin(sine * ws) / div) * sidevelocity) *
                    ang(rad(sd2) * sidevelocity, 0, rad(45 - (div2 / 2)) + rad(div3 * sin(sine * ws)) * forwardvelocity),
                .8 / animSpeed)
            rs.C0 = clerp(rs.C0, rsO * cf(-sin(sine * ws) / (div4) * forwardvelocity, 0, 0) *
                ang(-rad(3), 0, -rad(div2 * sin(sine * ws) * forwardvelocity) + .2), .8 / animSpeed)
            ls.C0 = clerp(ls.C0, lsO * cf(-sin(sine * ws) / (div4) * forwardvelocity, 0, 0) *
                ang(-rad(3), 0, -rad(div2 * sin(sine * ws) * forwardvelocity) + .2), .8 / animSpeed)
        end
        if state == "jump" and anims then
            rh.Part0 = tors
            lh.Part0 = tors

            local animSpeed = 14

            rj.C0 = clerp(rj.C0, rjO * cf(0, 0, 0) * ang(-rad(3), 0, 0), 3 / animSpeed)
            ne.C0 = clerp(ne.C0, nec * ang(-rad(20), 0, 0), 3 / animSpeed)
            rh.C0 = clerp(rh.C0, rhO * cf(.65, .8, 0) * ang(0, 0, -rad(18)), 3 / animSpeed)
            lh.C0 = clerp(lh.C0, lhO * ang(0, 0, rad(18)), 3 / animSpeed)
            rs.C0 = clerp(rs.C0, rsO * ang(rad(6), 0, rad(2)), 3 / animSpeed)
            ls.C0 = clerp(ls.C0, lsO * ang(rad(6), 0, -rad(2)), 3 / animSpeed)
        end
        if state == "fall" and anims then

            local animSpeed = 14

            rj.C0 = clerp(rj.C0, rjO * cf(0, 0, 0) * ang(rad(10), 0, 0), 3 / animSpeed)
            ne.C0 = clerp(ne.C0, nec * ang(rad(6), 0, 0), 3 / animSpeed)
            rh.C0 = clerp(rh.C0, rhO * cf(.65, .1, 0) * ang(0, 0, rad(11)), 3 / animSpeed)
            lh.C0 = clerp(lh.C0, lhO * ang(0, 0, -rad(5)), 3 / animSpeed)
            rs.C0 = clerp(rs.C0, rsO * cf(0, -.5, .5) * ang(-rad(80), 0, rad(2)), 3 / animSpeed)
            ls.C0 = clerp(ls.C0, lsO * cf(0, -.5, .5) * ang(-rad(80), 0, -rad(2)), 3 / animSpeed)
        end
        if state == "sit" and anims then
            local alpha = .11
            clerpz(rs, "C0", "Quad", "InOut", rsO * cf(0, -.2, 0) * ang(0, 0, -rad(42)), alpha)
            clerpz(ls, "C0", "Quad", "InOut", lsO * cf(0, 0, -.2) * ang(rad(30), 0, -rad(30)), alpha)
            clerpz(rj, "C0", "Quad", "InOut", rjO * cf(0, 0, -1.5) * ang(rad(17 * cos(sine / 50)), 0, 0), .1)
            clerpz(rh, "C0", "Quad", "InOut", rhO * ang(0, 0, rad(90) + rad(17 * cos(sine / 50))) * ang(-rad(8), 0, 0),
                alpha)
            clerpz(lh, "C0", "Quad", "InOut", lhO * ang(0, 0, -rad(90) - rad(17 * cos(sine / 50))) * ang(-rad(8), 0, 0),
                alpha)
            clerpz(ne, "C0", "Quad", "InOut", nec * ang(rad(17 * sin(sine / 50)), 0, 0), alpha)
        end
        rarm.Size = vt(1 * thickness, 2 * tallness, 1 * thickness)
        larm.Size = vt(1 * thickness, 2 * tallness, 1 * thickness)
        tors.Size = vt(2 * thickness, 2 * tallness, 1 * thickness)
        rleg.Size = vt(1 * thickness, 2 * tallness, 1 * thickness)
        lleg.Size = vt(1 * thickness, 2 * tallness, 1 * thickness)
        col.celer = yes.Color
        frame = 1 / fps
        unanchor()
    end
end)

hum.Name = randomstring()
eeeblock.Name = randomstring()
warn("AnimationSpeed: ", .5 / animSpeed)
warn("AnimationSpeed2: ", .8 / animSpeed)
warn("AnimationSpeed3: ", .5 / 2.25)
warn("AnimationSpeed4: ", 3 / 14)
warn("FPS: ", fps)
wait()

