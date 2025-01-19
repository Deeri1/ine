game:GetObjects("rbxassetid://11975526200")[1].Parent = game.Workspace
rdone = false 
cdone = false 
sdone =false
--game.Workspace.toolsgroup.Position = game.Players.LocalPlayer.Character.Torso.Position
function numchange()
num = 0
while wait() do
num = num-.15
wait(1/60)
num=num+.15
end
end

coroutine.wrap(numchange)()
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local character = LocalPlayer.Character
char = character
backpack = LocalPlayer.Backpack
model = game.Workspace.toolsgroup
thingy = model --feature model go here
model = thingy
numParts = 0
--local model = game.Workspace.MyModel
for i, part in pairs(thingy:GetChildren()) do
    if part:IsA'Part' or part:IsA'Seat' then
    part.CanCollide = false
    if part.name == "bloxyHandle" then
    part.CanCollide = true
    end
	numParts = numParts + 1
    end
end
local UserInputService = game:GetService("UserInputService")
endede = true
player = game.Players.LocalPlayer
function onInputBegan(inputObject)
if endede == true then
endede = false
	if inputObject.KeyCode == Enum.KeyCode.E then
		for i, part in pairs(char:GetChildren()) do
			for i, part in pairs(backpack:GetChildren()) do
			--	part:Destroy()
			end
			if part:IsA'Tool' then

			ogpos = player.Character.HumanoidRootPart.CFrame
			if part:FindFirstChild("Handle")  then
			print("yaa")
				player.Character.HumanoidRootPart.CFrame = CFrame.new(part.Handle.Position + Vector3.new(0,0,0))
			wait(.1)
			end

			player.Character.HumanoidRootPart.CFrame = ogpos
			
			end

		end
	end
	endede = true
	end
end

UserInputService.InputBegan:Connect(onInputBegan)


character = game.Players.LocalPlayer.Character
--character["Right Arm"]:Destroy()
function moveall()


	local sword = backpack:FindFirstChild("Foil")
	
	if sword then
	character = game.Players.LocalPlayer.Character
		--sword.Handle.Mesh:Destroy()
		sword.Name = "used"
		local firstswordpart = model:FindFirstChild("fHandle")
		if firstswordpart then
		--firstswordpart.CanCollide = false
firstswordpart.Name = "used"
			firstswordpart.Transparency = .75
			firstswordpart.CanCollide = false
		sword.Name = "used"
		sword.Handle.CanCollide = true
sword.Parent = character
sword.Handle.CanCollide = true
--wait(10)
sword.Handle.Mesh:Destroy()
sword.Handle.Massless = true
--sword.Handle.Anchored = true

task.wait(0.5)
if character:FindFirstChild("Right Arm") then
print("lol")
character["Right Arm"]:Destroy()

end
num = 0
wait(.9)
sword.Handle.CanCollide = false
--sword.Handle.Anchored = false
game:GetService("RunService").Heartbeat:Connect(function()

sword.Handle.CFrame = firstswordpart.CFrame * CFrame.new(num,num,-num)
--firstradiopart.CFrame = firstradiopart.CFrame * CFrame.new(0,num * 3,0)
sword.Handle.Velocity = Vector3.new(0,(num * 120) + 160,0)


end)
sdone = true
	end
end
	local cola = backpack:FindFirstChild("BloxyCola")
	if cola and cola:IsA("Tool") then
	character = game.Players.LocalPlayer.Character
		--cola.Handle.Mesh:Destroy()
		cola.Name = "used"
		local firstcolapart = model:FindFirstChild("bloxyHandle")
		if firstcolapart then
			firstcolapart.Name = "used"
			firstcolapart.CanCollide = true
			firstcolapart.Transparency = .75
		cola.Name = "used"
cola.Parent = character
cola.Handle.Mesh:Destroy()
cola.Handle.Massless = true
cola.Handle.Anchored = false
cola.Handle.CanCollide = true
task.wait(0.5)
if character:FindFirstChild("Right Arm") then
print("lol")
character["Right Arm"]:Destroy()

end
num = 0
wait(.9)
cola.Handle.CanCollide = false
game:GetService("RunService").Heartbeat:Connect(function()

cola.Handle.CFrame = firstcolapart.CFrame * CFrame.new(num,num,-num)
--firstradiopart.CFrame = firstradiopart.CFrame * CFrame.new(0,num * 3,0)
cola.Handle.Velocity = Vector3.new(0,(num * 120) + 160,0)


end)
cdone = true
end
end
	local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local character = LocalPlayer.Character
backpack = LocalPlayer.Backpack
local radio = backpack:FindFirstChild("BoomBox")
	if radio and radio:IsA("Tool") then
	
		local firstradiopart = model:FindFirstChild("bHandle")
			if firstradiopart then
			firstradiopart.CanCollide = false
			firstradiopart.Name = "used"
			firstradiopart.Transparency = .75
		radio.Name = "used"
radio.Parent = character
radio.Handle.Mesh:Destroy()
radio.Handle.Massless = true
radio.Handle.Anchored = false
radio.Handle.CanCollide = true
task.wait(0.5)
if character:FindFirstChild("Right Arm") then
print("lol")
character["Right Arm"]:Destroy()

end
num = 0
wait(.9)
radio.Handle.CanCollide = false
game:GetService("RunService").Heartbeat:Connect(function()
if radio:FindFirstChild("Handle")  then
radio.Handle.CFrame = firstradiopart.CFrame * CFrame.new(num,num,-num)
--firstradiopart.CFrame = firstradiopart.CFrame * CFrame.new(0,num * 3,0)
radio.Handle.Velocity = Vector3.new(0,(num * 120) + 100,0)
end
end)
rdone = true
end
end
end


while true do
wait()
--repeat wait() until rdone == true and cdone == true and sdone==true 

moveall()

end