-- LocalScript under StarterGui or a ScreenGui

local player = game.Players.LocalPlayer
local mouse = player:GetMouse()
local screenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
screenGui.Name = "FratingUI"
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Frame
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 220)
frame.Position = UDim2.new(0.5, -250, 0.5, -150)
frame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
frame.Parent = screenGui

local frameCorner = Instance.new("UICorner")
frameCorner.CornerRadius = UDim.new(0, 12)
frameCorner.Parent = frame

-- Title Label
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -40, 0, 50)
title.Position = UDim2.new(0, 20, 0, 5)
title.BackgroundTransparency = 1
title.Text = "Click to teleport menu"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBold
title.TextSize = 22
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = frame

-- Close Button
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -40, 0, 10)
closeButton.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
closeButton.TextColor3 = Color3.new(1, 1, 1)
closeButton.Text = "X"
closeButton.Font = Enum.Font.Gotham
closeButton.TextSize = 18
closeButton.Parent = frame

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 6)
closeCorner.Parent = closeButton

closeButton.MouseButton1Click:Connect(function()
	screenGui:Destroy()
end)

-- Click to Teleport Toggle Button
local toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(0, 260, 0, 40)
toggleButton.Position = UDim2.new(0.5, -130, 0, 100)
toggleButton.Text = "🖱️Click To Teleport [OFF]"
toggleButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.Font = Enum.Font.GothamBold
toggleButton.TextSize = 18
toggleButton.Parent = frame

local toggleCorner = Instance.new("UICorner")
toggleCorner.CornerRadius = UDim.new(0, 6)
toggleCorner.Parent = toggleButton

-- Toggle logic
local clickToTeleportEnabled = false
toggleButton.MouseButton1Click:Connect(function()
	clickToTeleportEnabled = not clickToTeleportEnabled
	if clickToTeleportEnabled then
		toggleButton.Text = "🖱️Click To Teleport [ON]"
		toggleButton.BackgroundColor3 = Color3.fromRGB(40, 200, 120)
	else
		toggleButton.Text = "🖱️Click To Teleport [OFF]"
		toggleButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
	end
end)

-- Teleport on click
mouse.Button1Down:Connect(function()
	if clickToTeleportEnabled then
		local target = mouse.Hit
		if target and player.Character then
			local hrp = player.Character:FindFirstChild("HumanoidRootPart")
			if hrp then
				-- move slightly up so you don't fall into the part
				local teleportPos = target.Position + Vector3.new(0, 3, 0)
				hrp.CFrame = CFrame.new(teleportPos)
			end
		end
	end
end)
