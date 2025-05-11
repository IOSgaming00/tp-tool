-- LocalScript under StarterGui or ScreenGui

local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
screenGui.Name = "CustomUI"

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 200)
frame.Position = UDim2.new(0.5, -150, 0.5, -100)
frame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
frame.Parent = screenGui

-- Close button
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -35, 0, 5)
closeButton.Text = "X"
closeButton.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
closeButton.TextColor3 = Color3.new(1,1,1)
closeButton.Parent = frame

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 6)
closeCorner.Parent = closeButton

closeButton.MouseButton1Click:Connect(function()
	frame.Visible = false
end)

-- TextBox
local textBox = Instance.new("TextBox")
textBox.Size = UDim2.new(0, 200, 0, 40)
textBox.Position = UDim2.new(0.5, -100, 0.4, -20)
textBox.PlaceholderText = "X, Y, Z"
textBox.Text = ""
textBox.ClearTextOnFocus = false
textBox.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
textBox.TextColor3 = Color3.fromRGB(255, 255, 255)
textBox.Parent = frame

local textBoxCorner = Instance.new("UICorner")
textBoxCorner.CornerRadius = UDim.new(0, 6)
textBoxCorner.Parent = textBox

-- Button under the TextBox
local actionButton = Instance.new("TextButton")
actionButton.Size = UDim2.new(0, 200, 0, 40)
actionButton.Position = UDim2.new(0.5, -100, 0.4, 30)
actionButton.Text = "Teleport to:"
actionButton.BackgroundColor3 = Color3.fromRGB(60, 120, 255)
actionButton.TextColor3 = Color3.fromRGB(255, 255, 255)
actionButton.Parent = frame

local buttonCorner = Instance.new("UICorner")
buttonCorner.CornerRadius = UDim.new(0, 6)
buttonCorner.Parent = actionButton

actionButton.MouseButton1Click:Connect(function()
	local input = textBox.Text

	-- Replace commas with spaces, then split by space
	input = input:gsub(",", " ")
	
	-- collect only numbers
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
