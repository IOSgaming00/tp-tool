-- LocalScript under StarterGui or ScreenGui

local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
screenGui.Name = "CustomUI"
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Main Frame
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 220)
frame.Position = UDim2.new(0.5, -150, 0.5, -110)
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
title.Size = UDim2.new(1, -40, 0, 40)
title.Position = UDim2.new(0, 20, 0, 5)
title.BackgroundTransparency = 1
title.Text = "Teleport Menu"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBold
title.TextSize = 24
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = frame

-- Close Button
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -40, 0, 10)
closeButton.Text = "X"
closeButton.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
closeButton.TextColor3 = Color3.new(1,1,1)
closeButton.Font = Enum.Font.Gotham
closeButton.TextSize = 18
closeButton.Parent = frame

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 6)
closeCorner.Parent = closeButton

closeButton.MouseButton1Click:Connect(function()
	frame.Visible = false
end)

-- TextBox
local textBox = Instance.new("TextBox")
textBox.Size = UDim2.new(0, 260, 0, 40)
textBox.Position = UDim2.new(0.5, -130, 0, 60)
textBox.PlaceholderText = "X, Y, Z"
textBox.Text = ""
textBox.ClearTextOnFocus = false
textBox.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
textBox.TextColor3 = Color3.fromRGB(255, 255, 255)
textBox.Font = Enum.Font.Gotham
textBox.TextSize = 18
textBox.Parent = frame

local textBoxCorner = Instance.new("UICorner")
textBoxCorner.CornerRadius = UDim.new(0, 6)
textBoxCorner.Parent = textBox

-- Teleport Button
local actionButton = Instance.new("TextButton")
actionButton.Size = UDim2.new(0, 260, 0, 40)
actionButton.Position = UDim2.new(0.5, -130, 0, 110)
actionButton.Text = "Teleport to:"
actionButton.BackgroundColor3 = Color3.fromRGB(60, 120, 255)
actionButton.TextColor3 = Color3.fromRGB(255, 255, 255)
actionButton.Font = Enum.Font.GothamBold
actionButton.TextSize = 18
actionButton.Parent = frame

local buttonCorner = Instance.new("UICorner")
buttonCorner.CornerRadius = UDim.new(0, 6)
buttonCorner.Parent = actionButton

-- Action
actionButton.MouseButton1Click:Connect(function()
	local input = textBox.Text
	input = input:gsub(",", " ")
	local coords = {}
	for word in input:gmatch("%S+") do
		local num = tonumber(word)
		if num then
			table.insert(coords, num)
		end
	end

	if #coords == 3 then
		local pos = Vector3.new(coords[1], coords[2], coords[3])
		local character = player.Character or player.CharacterAdded:Wait()
		local hrp = character:FindFirstChild("HumanoidRootPart")

		if hrp then
			hrp.CFrame = CFrame.new(pos)
		else
			warn("HumanoidRootPart not found 💀")
		end
	else
		warn("invalid coords 💔 use 3 numbers like: 10 20 30 or 10, 20, 30")
	end
end)
