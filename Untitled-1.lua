
_G.player = game.Players.LocalPlayer
repeat wait() until _G["player".._G.player.Name] ~= nil
print("madeit")
--- idle nothing equiped


_G.data = _G["player".._G.player.Name]
data = _G.data
Char = workspace[_G.player.Name]
char = Char
tors = char.Torso
hrp = Char.HumanoidRootPart
leftleg = Char["Left Leg"]
ll = leftleg
Humanoid = Char:WaitForChild("Humanoid")
humanoid = Humanoid
oldwalkspeed = humanoid.WalkSpeed
oldjumppower = humanoid.JumpPower
hrp = Char:WaitForChild("HumanoidRootPart")

local runservice = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local shiftKeyL = Enum.KeyCode.LeftShift
local shiftKeyR = Enum.KeyCode.RightShift


local function ismovekeydown()
	return UserInputService:IsKeyDown(Enum.KeyCode.W) or UserInputService:IsKeyDown(Enum.KeyCode.A) or UserInputService:IsKeyDown(Enum.KeyCode.S) or UserInputService:IsKeyDown(Enum.KeyCode.D)
end

local function input(_input, _gameProcessedEvent)
	if UserInputService:IsKeyDown(Enum.KeyCode.W) or UserInputService:IsKeyDown(Enum.KeyCode.A) or UserInputService:IsKeyDown(Enum.KeyCode.S) or UserInputService:IsKeyDown(Enum.KeyCode.D) then
		moving = true
		print("lol")
	end
end
local function doneinput(_input, _gameProcessedEvent)
	if UserInputService:IsKeyDown(Enum.KeyCode.W) or UserInputService:IsKeyDown(Enum.KeyCode.A) or UserInputService:IsKeyDown(Enum.KeyCode.S) or UserInputService:IsKeyDown(Enum.KeyCode.D) then
		wait()
		doneinput()
	else
		moving = false
		
	end
end
UserInputService.InputBegan:Connect(input)
UserInputService.InputEnded:Connect(doneinput)
humanoid.Jumping:Connect(function(isActive)
	if isActive then
		jump = true
	else
		jump = false
	end
end)
local anim = Instance.new('Animation')
anim.AnimationId = 'rbxassetid://13391282249'
animationclear = Humanoid:LoadAnimation(anim)
item = data.holding.id.idle
print(item)
id = item
local anim = Instance.new('Animation')
anim.AnimationId = 'rbxassetid://'..id..''
animationidle = Humanoid:LoadAnimation(anim)
item = data.holding.id.walk
print(item)
id = item
local anim = Instance.new('Animation')
anim.AnimationId = 'rbxassetid://'..id..''
animationwalk = Humanoid:LoadAnimation(anim)
item = data.holding.id.jump
print(item)
id = item
local anim = Instance.new('Animation')
anim.AnimationId = 'rbxassetid://'..id..''
animationjump = Humanoid:LoadAnimation(anim)
function stopall()
	animationidle:Stop()
	animationjump:Stop()
	animationwalk:Stop()
	animationclear:Stop()
end
local runservice = game:GetService("RunService")
rightblock =  Char.TopRight
leftblock = Char.BottomLeft

rightraypart = Instance.new("Part")
rightraypart.Color = rightblock.Color
rightraypart.Parent = Char
rightraypart.CanCollide = false
rightraypart.Size = Vector3.new(1,1,1)

leftraypart = Instance.new("Part")
leftraypart.Color = leftblock.Color
leftraypart.Parent = Char
leftraypart.CanCollide = false
leftraypart.Size = Vector3.new(1,1,1)
local raycastParams = RaycastParams.new()
raycastParams.FilterDescendantsInstances = {Char}
raycastParams.FilterType = Enum.RaycastFilterType.Exclude
raycastParams.IgnoreWater = true
runservice.RenderStepped:Connect(function()

	rightblock =  Char.TopRight
	leftblock = Char.BottomLeft
	rightray = workspace:Raycast(rightblock.CFrame.p,rightblock.CFrame.LookVector*10,raycastParams)
	leftray = workspace:Raycast(leftblock.CFrame.p,leftblock.CFrame.LookVector*10,raycastParams)
	
	if rightray and leftray and rightray.Distance <= 1 and leftray.Distance <= 1 then
		rightraypart.Position = rightray.Position
		leftraypart.Position = leftray.Position
		stopall()
		animationclear:Play()
		preventanim = true
		avrage = (rightray.Position.X + leftray.Position.X)/2
        print(avrage)
        --hrp.CFrame = CFrame.lookAt(hrp.Position,Vector3.new(hrp.Position.X,hrp.Position.Y,rightray.Position.z))
        hrp.CFrame = CFrame.new(Vector3.new(avrage,hrp.Position.y,hrp.Position.z) - Vector3.new(0 ,0, 0),Vector3.new(rightray.Position.X,hrp.Position.y,hrp.Position.z))  * CFrame.Angles(0,-80,0)
        -- * hrp.CFrame.Rotation
        onwall = true
		humanoid.WalkSpeed = 0
        humanoid.JumpPower = 0
        humanoid.AutoRotate = false
		swapped = true
		
		
		
	else
        if onwall == true then
        onwall = false
        humanoid.WalkSpeed = oldwalkspeed
        humanoid.JumpPower = oldjumppower
		preventanim = false
        humanoid.AutoRotate = true
        end
        if moving == true and jump == false then
            --print("walking...")
            if not animationwalk.IsPlaying and not preventanim then
                stopall()
                animationwalk:Play()
            end
        end
        if moving == false and jump == false then
            if not animationidle.IsPlaying and not preventanim then
                stopall()
                animationidle:Play(.25)
            end
        end
        if jump == true then
            if not animationjump.IsPlaying then
            --print("jumping...")
            stopall()
                animationjump:Play()
                preventanim = true
                wait(.5)
                preventanim = false
                stopall()
            end
        end
	end
	
	
	
	
	
	
	
	
	
	
	
	
	

end)
--[[starting raycast

rightblock =  Char.TopRight
leftblock = Char.Bottomleft

rightray = workspace:Raycast(rightblock.Position, Vector3.new(rightblock.Position.X+1,rightblock.Position.Y,rightblock.Position.Z))
if rightray then
rightraypart = Instance.new("Part")
rightraypart.Color = rightblock.Color
rightraypart.Parent = Char
rightraypart.Position = rightray.Position
end
]]



