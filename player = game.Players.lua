player = game.Players.LocalPlayer
char = player.Character
hum = char.Humanoid
hrp = char.HumanoidRootPart
mouse = player:GetMouse()

--Load car model--
lol = game:GetObjects("rbxassetid://13157415169")[1]
lol.Parent = game.workspace
--model done loaded--
repeat wait() until game.workspace:FindFirstChild("lolcarmodel")
function newweld(target,base)
	weld = Instance.new("Weld")
	weld.Parent = base
	weld.Part0 = base
	weld.Part1 = target
	weld.C1 = CFrame.new(0,0,0)
end
car = lol
function carvel()
	lol =  game:GetService("RunService").Heartbeat:Connect(function()
        if on == true then
			hrp.Velocity = Vector3.new(0,0,0)
            hrp.CFrame =seat.CFrame +Vector3.new(0,.75,.5)
			if vertical >0 then 
				vertical = vertical-.0005
			end
             if vertical<0 then
		        vertical = 0
		  end
            bpartrot = bpart.Rotation
        else
            lol:Disconnect()
        end
	end)
end
if char.MeshPartAccessory.AttachmentPoint == car.MeshPartAccessory.AttachmentPoint then
	--char:FindFirstChild("MeshPartAccessory").Handle.Velocity = Vector3.new(0,25,0)
--[[	char:FindFirstChild("MeshPartAccessory").Handle.CanCollide = false
	char:FindFirstChild("MeshPartAccessory").Handle.AccessoryWeld:Destroy()
	newweld(char:FindFirstChild("MeshPartAccessory").Handle,car:FindFirstChild("MeshPartAccessory").Handle)]]
	seat = car:FindFirstChild("seat part")
	--coroutine.wrap(carvel)()
end
local c = game.Players.LocalPlayer.Character:FindFirstChild("MeshPartAccessory").Handle
c.AccessoryWeld:Destroy()
c.Anchored = false
local cRot = 0.1
game:GetService("RunService").RenderStepped:Connect(function(dt)
    cRot = cRot + 0*dt
    c.Anchored = true
	bpartrot = bpart.Rotation
	bpartcf = bpart.CFrame
    c.CFrame = bpartcf * CFrame.new(0,.75,0) * CFrame.Angles(0,0,0)
    c.Velocity = Vector3.new(0,0,0)
    c.Anchored = false
end)

spacedelay = false
on = false
function sit(part)
	if spacedelay == false then
	if part.Parent == char then
			hum.Sit = true
			on = true
			hrp.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
			hrp.RotVelocity = Vector3.new(0, 0, 0)
			hum:SetStateEnabled(Enum.HumanoidStateType.Jumping,false)
			coroutine.wrap(carvel)()
		end
	end
end
bpart = car:FindFirstChild("basepiece")
vertical = 0
mouse.KeyDown:connect(function(key)
	--dirrection = CFrame.new(1, 0, 0) * bpart.CFrame.LookVector
		if key:byte() == 101 then
		if spacedelay == false then
			spacedelay = true
			hum.Sit = false
			hum:SetStateEnabled(Enum.HumanoidStateType.Jumping,true)
			on = false
			wait(3)
			spacedelay = false
			
		end
	end
	if key:byte() == 32 then
		if on == true then
		    print(vertical)
			vertical = vertical+1
			print(vertical)
		end
	end
end)    
local UserInputService = game:GetService("UserInputService")
acceleration = 0
turn = 0
UserInputService.InputBegan:Connect(function(inputObject, gameProcessed)
	if gameProcessed then return end
	if inputObject.KeyCode == Enum.KeyCode.W and on == true then
		while UserInputService:IsKeyDown(Enum.KeyCode.W) do
			acceleration = acceleration
			bpartrot = bpart.Rotation
			bpartcf = bpart.CFrame
			bpart.CFrame += bpartcf.LookVector * (.1 + (.1*acceleration))
			bpart.CFrame = (bpart.CFrame + Vector3.new(0,vertical,0)) * CFrame.Angles(0, math.rad(turn), 0)
			acceleration = acceleration +.01
			task.wait()
		end
		while acceleration >= 0  and not UserInputService:IsKeyDown(Enum.KeyCode.W)  do
			bpartrot = bpart.Rotation
			bpartcf = bpart.CFrame
			bpart.CFrame += bpartcf.LookVector * (.1 + (.1*acceleration))
			bpart.CFrame = (bpart.CFrame + Vector3.new(0,vertical,0)) * CFrame.Angles(0, math.rad(turn), 0)
			acceleration = acceleration -.1
			task.wait()
		end
	end
	if inputObject.KeyCode == Enum.KeyCode.A  and on == true then
		while UserInputService:IsKeyDown(Enum.KeyCode.A) do
			if turn <= 10 then
			turn = turn+.1
			end
			task.wait()
		end
		while turn> 0 and not UserInputService:IsKeyDown(Enum.KeyCode.A) do
			turn = turn-.1
			task.wait()
		end
	end
	if inputObject.KeyCode == Enum.KeyCode.R  and on == true then
		car.basepiece.CFrame = CFrame.new(0,5,0)
	end
	if inputObject.KeyCode == Enum.KeyCode.D  and on == true  then
		while UserInputService:IsKeyDown(Enum.KeyCode.D) do
			if turn>= -10 then
				turn = turn-.1
			end
			task.wait()
			
		end
		while turn< 0 and not UserInputService:IsKeyDown(Enum.KeyCode.D) do
			turn = turn+.1
			task.wait()
		end
	end
end)
local player = game:GetService("Players").LocalPlayer.Character
local aligns = {}
local hataligns = {}
function fgvbhnjmi(number)
    sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", number)
end
game:GetService("RunService").Heartbeat:Connect(function()
    ve = Vector3.new(30, 0, 0)
   if player:FindFirstChild("Head") then
        --[[player["Head"].Velocity = ve
        player["Torso"].Velocity = ve
        player["Left Arm"].Velocity = ve
        player["Right Arm"].Velocity = ve
        player["Left Leg"].Velocity = ve
        player["Right Leg"].Velocity = ve]]
        player["Torso"].CanCollide = false
        player["Left Arm"].CanCollide = true
        player["Right Arm"].CanCollide = true
        player["Left Leg"].CanCollide = false
        player["Right Leg"].CanCollide = false
    end
    for i, v in pairs(player:GetDescendants()) do
        if v:IsA("Accessory") then
            v.Handle.Velocity = Vector3.new(0, 0, 90)
        end
    end
end)

wait(0.1)
settings().Physics.PhysicsEnvironmentalThrottle = Enum.EnviromentalPhysicsThrottle.Disabled
settings().Physics.AllowSleep = false
seat.Touched:Connect(sit)
