-- Script tạo menu trong suốt, tự động mở, icon di chuyển được, hỗ trợ tất cả thiết bị, hiển thị notification
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")

-- Tạo ScreenGui
local player = Players.LocalPlayer
local playerGui = player.PlayerGui
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = playerGui
screenGui.Name = "TransparentMenu"
screenGui.ResetOnSpawn = false
screenGui.IgnoreGuiInset = true

-- Tạo Frame chính (Menu nền trong suốt)
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 0, 0, 0)
mainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
mainFrame.BackgroundTransparency = 0.5
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui
mainFrame.Visible = true

-- Bo góc cho Frame
local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 15)
uiCorner.Parent = mainFrame

-- Thêm hiệu ứng viền (UIStroke)
local uiStroke = Instance.new("UIStroke")
uiStroke.Thickness = 2
uiStroke.Color = Color3.fromRGB(255, 255, 255)
uiStroke.Transparency = 0.5
uiStroke.Parent = mainFrame

-- Thêm hiệu ứng Gradient
local uiGradient = Instance.new("UIGradient")
uiGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(100, 100, 100))
})
uiGradient.Rotation = 45
uiGradient.Parent = mainFrame

-- Tạo tiêu đề Menu
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 0, 50)
titleLabel.Position = UDim2.new(0, 0, 0, 10)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "Main Menu"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextSize = 30
titleLabel.Font = Enum.Font.GothamBold
titleLabel.Parent = mainFrame

-- Tạo nút Play (chỉ giao diện)
local playButton = Instance.new("TextButton")
playButton.Size = UDim2.new(0, 150, 0, 50)
playButton.Position = UDim2.new(0.5, -75, 0, 100)
playButton.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
playButton.BackgroundTransparency = 0.2
playButton.Text = "Play"
playButton.TextColor3 = Color3.fromRGB(255, 255, 255)
playButton.TextSize = 20
playButton.Font = Enum.Font.Gotham
playButton.Parent = mainFrame

local buttonCorner = Instance.new("UICorner")
buttonCorner.CornerRadius = UDim.new(0, 10)
buttonCorner.Parent = playButton

-- Tạo nút Settings (chỉ giao diện)
local settingsButton = Instance.new("TextButton")
settingsButton.Size = UDim2.new(0, 150, 0, 50)
settingsButton.Position = UDim2.new(0.5, -75, 0, 170)
settingsButton.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
settingsButton.BackgroundTransparency = 0.2
settingsButton.Text = "Settings"
settingsButton.TextColor3 = Color3.fromRGB(255, 255, 255)
settingsButton.TextSize = 20
settingsButton.Font = Enum.Font.Gotham
settingsButton.Parent = mainFrame

local settingsButtonCorner = Instance.new("UICorner")
settingsButtonCorner.CornerRadius = UDim.new(0, 10)
settingsButtonCorner.Parent = settingsButton

-- Tạo nút Exit (chỉ giao diện)
local exitButton = Instance.new("TextButton")
exitButton.Size = UDim2.new(0, 150, 0, 50)
exitButton.Position = UDim2.new(0.5, -75, 0, 240)
exitButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
exitButton.BackgroundTransparency = 0.2
exitButton.Text = "Exit"
exitButton.TextColor3 = Color3.fromRGB(255, 255, 255)
exitButton.TextSize = 20
exitButton.Font = Enum.Font.Gotham
exitButton.Parent = mainFrame

local exitButtonCorner = Instance.new("UICorner")
exitButtonCorner.CornerRadius = UDim.new(0, 10)
exitButtonCorner.Parent = exitButton

-- Tạo Icon (TextButton) có thể di chuyển
local menuIcon = Instance.new("TextButton")
menuIcon.Size = UDim2.new(0, 50, 0, 50)
menuIcon.Position = UDim2.new(1, -60, 1, -60)
menuIcon.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
menuIcon.BackgroundTransparency = 0.2
menuIcon.Text = "Menu"
menuIcon.TextColor3 = Color3.fromRGB(255, 255, 255)
menuIcon.TextSize = 20
menuIcon.Font = Enum.Font.Gotham
menuIcon.Parent = screenGui

local iconCorner = Instance.new("UICorner")
iconCorner.CornerRadius = UDim.new(0, 10)
iconCorner.Parent = menuIcon

-- Tạo Notification
local notification = Instance.new("TextLabel")
notification.Size = UDim2.new(0, 200, 0, 50)
notification.Position = UDim2.new(0.5, -100, 0, 10)
notification.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
notification.BackgroundTransparency = 0.5
notification.Text = "Menu Loaded!"
notification.TextColor3 = Color3.fromRGB(255, 255, 255)
notification.TextSize = 20
notification.Font = Enum.Font.Gotham
notification.Parent = screenGui
notification.Visible = false

local notifCorner = Instance.new("UICorner")
notifCorner.CornerRadius = UDim.new(0, 10)
notifCorner.Parent = notification

-- Hiệu ứng Hover cho nút
local function addHoverEffect(button)
    button.MouseEnter:Connect(function()
        local tween = TweenService:Create(button, TweenInfo.new(0.2), {BackgroundTransparency = 0})
        tween:Play()
    end)
    button.MouseLeave:Connect(function()
        local tween = TweenService:Create(button, TweenInfo.new(0.2), {BackgroundTransparency = 0.2})
        tween:Play()
    end)
    button.TouchTap:Connect(function()
        local tween = TweenService:Create(button, TweenInfo.new(0.2), {BackgroundTransparency = 0})
        tween:Play()
        wait(0.2)
        tween = TweenService:Create(button, TweenInfo.new(0.2), {BackgroundTransparency = 0.2})
        tween:Play()
    end)
end

addHoverEffect(playButton)
addHoverEffect(settingsButton)
addHoverEffect(exitButton)
addHoverEffect(menuIcon)

-- Logic kéo thả Icon
local dragging = false
local dragStart = nil
local startPos = nil
local isToggling = false

menuIcon.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = menuIcon.Position
    end
end)

menuIcon.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        if dragging and not isToggling then
            dragging = false
            local delta = input.Position - dragStart
            if math.abs(delta.X) < 10 and math.abs(delta.Y) < 10 then
                isToggling = true
                mainFrame.Visible = not mainFrame.Visible
                if mainFrame.Visible then
                    mainFrame.Size = UDim2.new(0, 0, 0, 0)
                    local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
                    local tween = TweenService:Create(mainFrame, tweenInfo, {Size = UDim2.new(0, 400, 0, 300)})
                    tween:Play()
                    tween.Completed:Connect(function()
                        isToggling = false
                    end)
                else
                    wait(0.1)
                    isToggling = false
                end
            else
                dragging = false
            end
        end
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        local newPos = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
        menuIcon.Position = newPos
    end
end)

-- Hiệu ứng mở Menu và hiển thị Notification
local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local tween = TweenService:Create(mainFrame, tweenInfo, {Size = UDim2.new(0, 400, 0, 300)})
tween:Play()
tween.Completed:Connect(function()
    notification.Visible = true
    wait(3)
    local notifTween = TweenService:Create(notification, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 1, TextTransparency = 1})
    notifTween:Play()
    notifTween.Completed:Connect(function()
        notification.Visible = false
    end)
end)
