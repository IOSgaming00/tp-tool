-- LocalScript under StarterGui or a ScreenGui

local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
screenGui.Name = "SimpleUI"
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Main Frame
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 100)  -- Adjusted size for displaying coords
frame.Position = UDim2.new(0.5, -150, 0.5, -100)
frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
frame.BackgroundTransparency = 0.05
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
frame.Parent = screenGui

local frameCorner = Instance.new("UICorner")
frameCorner.CornerRadius = UDim.new(0, 12)
frameCorner.Parent = frame

-- Close / Destroy Button
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -35, 0, 5)
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

-- Coordinates TextLabel
local coordsLabel = Instance.new("TextLabel")
coordsLabel.Size = UDim2.new(1, -20, 0, 20)
coordsLabel.Position = UDim2.new(0, 10, 0, 50)
coordsLabel.BackgroundTransparency = 1
coordsLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
coordsLabel.TextSize = 20
coordsLabel.Font = Enum.Font.Gotham
coordsLabel.Text = "X: 0 Y: 0 Z: 0"
coordsLabel.TextStrokeTransparency = 0.5
coordsLabel.Parent = frame

-- Update the coordinates every frame
game:GetService("RunService").Heartbeat:Connect(function()
	local character = player.Character
	if character and character:FindFirstChild("HumanoidRootPart") then
		local position = character.HumanoidRootPart.Position
		coordsLabel.Text = string.format("X: %.2f Y: %.2f Z: %.2f", position.X, position.Y, position.Z)
	end
end)
