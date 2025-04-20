local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

-- 1. 🎭 Invalid Animation ID (shows on all clients)
local function playInvalidAnimation()
	local anim = Instance.new("Animation")
	anim.AnimationId = "active://123456" -- Invalid scheme
	local track = character:WaitForChild("Humanoid"):LoadAnimation(anim)
	track:Play()
end

-- 2. 🔊 Invalid Sound ID (shows on all clients)
local function playInvalidSound()
	local sound = Instance.new("Sound")
	sound.SoundId = "active://654321" -- Invalid sound scheme
	sound.Parent = workspace
	sound:Play()
end

-- 3. 📦 Missing Asset (shows on all clients)
local function loadMissingDecal()
	local decal = Instance.new("Decal")
	decal.Texture = "rbxassetid://0" -- Nonexistent asset
	decal.Parent = workspace
end

-- 4. 🧾 RemoteFunction Error (shows only on client running it)
local function badRemoteInvoke()
	local remote = Instance.new("RemoteFunction")
	remote.Name = "TestRemote"
	remote.Parent = game.ReplicatedStorage

	-- Calling InvokeClient with bad argument (this won't work and throws an error, but only for this client)
	pcall(function()
		remote:InvokeClient(nil)
	end)
end

-- Run them all with a slight delay between
task.wait(2)
playInvalidAnimation()

task.wait(1)
playInvalidSound()

task.wait(1)
loadMissingDecal()

task.wait(1)
badRemoteInvoke()
