-- Minimal UI with Close + Drag
local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
screenGui.Name = "MinimalUI"

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 350, 0, 200)
frame.Position = UDim2.new(0.5, -175, 0.5, -100)
frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
frame.BackgroundTransparency = 0.05
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
frame.Parent = screenGui

local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 12)
uiCorner.Parent = frame

-- Close button
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 24, 0, 24)
closeBtn.Position = UDim2.new(1, -30, 0, 6)
closeBtn.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
closeBtn.Text = "X"
closeBtn.TextColor3 = Color3.new(1, 1, 1)
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 14
closeBtn.Parent = frame

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 12)
closeCorner.Parent = closeBtn

local tpToGame = Instance.new("TextButton")
tpToGame.Size = UDim2.new(0, 200, 0, 40)
tpToGame.Position = UDim2.new(0.5, -100, 0, 120)
tpToGame.Text = "TP To game"
tpToGame.BackgroundColor3 = Color3.fromRGB(60, 120, 255)
tpToGame.TextColor3 = Color3.fromRGB(255, 255, 255)
tpToGame.Font = Enum.Font.GothamBold
tpToGame.TextSize = 18
tpToGame.Parent = frame

local tpCorner = Instance.new("UICorner")
tpCorner.CornerRadius = UDim.new(0, 6)
tpCorner.Parent = tpToGame

local gameID = Instance.new("TextBox")
gameID.Size = UDim2.new(0, 260, 0, 40)
gameID.Position = UDim2.new(0.5, -130, 0, 60)
gameID.PlaceholderText = "Game ID"
gameID.Text = ""
gameID.ClearTextOnFocus = false
gameID.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
gameID.TextColor3 = Color3.fromRGB(255, 255, 255)
gameID.Font = Enum.Font.Gotham
gameID.TextSize = 18
gameID.Parent = frame

local title = Instance.new("TextLabel")
title.Size = UDim2.new(0,300, 0, 40)
title.Position = UDim2.new(0, 15, 0, 5)
title.BackgroundTransparency = 1
title.Text = "TP to another Game"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBold
title.TextSize = 24
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = frame

local gameIDCorner = Instance.new("UICorner")
gameIDCorner.CornerRadius = UDim.new(0, 6)
gameIDCorner.Parent = gameID

closeBtn.MouseButton1Click:Connect(function()
	frame:Destroy()
end)

local TeleportService = game:GetService("TeleportService")

tpToGame.MouseButton1Click:Connect(function()
	local id = tonumber(gameID.Text)
	if id then
		TeleportService:Teleport(id, player)
	else
		gameID.Text = "❌ Invalid Game ID"
		wait(1.5)
		gameID.Text = ""
	end
end)

