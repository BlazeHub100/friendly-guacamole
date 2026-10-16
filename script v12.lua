-- [[ BlazeHub - Custom Script Hub (RGB + Dark Theme V6) ]] --
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")

local player = Players.LocalPlayer

-- ป้องกันรันซ้ำ
if CoreGui:FindFirstChild("BlazeHubRGB") then
    CoreGui.BlazeHubRGB:Destroy()
end

-- สร้าง ScreenGui หลัก
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "BlazeHubRGB"
screenGui.Parent = CoreGui
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- ปุ่มเปิด/ปิด UI ลอยบนหน้าจอ
local openButton = Instance.new("TextButton")
openButton.Name = "OpenButton"
openButton.Parent = screenGui
openButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
openButton.Position = UDim2.new(0, 15, 0.4, 0)
openButton.Size = UDim2.new(0, 50, 0, 50)
openButton.Font = Enum.Font.GothamBold
openButton.Text = "UI"
openButton.TextColor3 = Color3.fromRGB(255, 255, 255)
openButton.TextSize = 16
openButton.Active = true
openButton.Draggable = true

local openBtnCorner = Instance.new("UICorner")
openBtnCorner.CornerRadius = UDim.new(1, 0) -- ทรงกลม
openBtnCorner.Parent = openButton

local openBtnStroke = Instance.new("UIStroke")
openBtnStroke.Parent = openButton
openBtnStroke.Thickness = 2
openBtnStroke.Color = Color3.fromRGB(255, 255, 255)

-- Main Frame (กรอบหลักสีดำ)
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Parent = screenGui
mainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
mainFrame.BorderSizePixel = 0
mainFrame.Position = UDim2.new(0.5, -175, 0.5, -200)
mainFrame.Size = UDim2.new(0, 350, 0, 460)
mainFrame.Active = true
mainFrame.Draggable = true -- ทำให้เคลื่อนย้ายได้

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 10)
mainCorner.Parent = mainFrame

-- RGB Border (เส้นขอบ RGB รอบนอกของ Main Frame)
local rgbStroke = Instance.new("UIStroke")
rgbStroke.Parent = mainFrame
rgbStroke.Thickness = 3
rgbStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

-- ฟังก์ชันกดปุ่มลอยเพื่อเปิด/ปิด UI
openButton.MouseButton1Click:Connect(function()
    mainFrame.Visible = not mainFrame.Visible
end)

-- Top Bar (แถบหัวข้อ)
local topBar = Instance.new("Frame")
topBar.Name = "TopBar"
topBar.Parent = mainFrame
topBar.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
topBar.BorderSizePixel = 0
topBar.Size = UDim2.new(1, 0, 0, 35)

local topCorner = Instance.new("UICorner")
topCorner.CornerRadius = UDim.new(0, 10)
topCorner.Parent = topBar

local titleLabel = Instance.new("TextLabel")
titleLabel.Parent = topBar
titleLabel.BackgroundTransparency = 1
titleLabel.Position = UDim2.new(0, 15, 0, 0)
titleLabel.Size = UDim2.new(0, 200, 1, 0)
titleLabel.Font = Enum.Font.GothamBold
titleLabel.Text = "BLAZEHUB | MULTI-TOOL"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextSize = 14
titleLabel.TextXAlignment = Enum.TextXAlignment.Left

-- ปุ่มซ่อน UI (กด X ซ่อนหน้าต่างหลัก)
local closeButton = Instance.new("TextButton")
closeButton.Parent = topBar
closeButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
closeButton.Position = UDim2.new(1, -30, 0.5, -12)
closeButton.Size = UDim2.new(0, 24, 0, 24)
closeButton.Font = Enum.Font.GothamBold
closeButton.Text = "X"
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.TextSize = 12

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 6)
closeCorner.Parent = closeButton

closeButton.MouseButton1Click:Connect(function()
    mainFrame.Visible = false
end)

-- Container สำหรับฟังก์ชันต่างๆ (ScrollingFrame)
local container = Instance.new("ScrollingFrame")
container.Parent = mainFrame
container.BackgroundTransparency = 1
container.Position = UDim2.new(0, 10, 0, 45)
container.Size = UDim2.new(1, -20, 1, -55)
container.CanvasSize = UDim2.new(0, 0, 0, 500)
container.ScrollBarThickness = 4

local uiLayout = Instance.new("UIListLayout")
uiLayout.Parent = container
uiLayout.SortOrder = Enum.SortOrder.LayoutOrder
uiLayout.Padding = UDim.new(0, 10)

-- ฟังก์ชันช่วยสร้าง Toggle Button
function createToggle(name, callback)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 0, 40)
    frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    frame.BorderSizePixel = 0
    frame.Parent = container
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = frame
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0.7, 0, 1, 0)
    label.Position = UDim2.new(0, 10, 0, 0)
    label.BackgroundTransparency = 1
    label.Font = Enum.Font.GothamMedium
    label.Text = name
    label.TextColor3 = Color3.fromRGB(220, 220, 220)
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = frame
    
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 50, 0, 24)
    btn.Position = UDim2.new(1, -60, 0.5, -12)
    btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    btn.Text = "OFF"
    btn.Font = Enum.Font.GothamBold
    btn.TextColor3 = Color3.fromRGB(200, 50, 50)
    btn.TextSize = 12
    btn.Parent = frame
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 4)
    btnCorner.Parent = btn
    
    local toggled = false
    btn.MouseButton1Click:Connect(function()
        toggled = not toggled
        if toggled then
            btn.Text = "ON"
            btn.TextColor3 = Color3.fromRGB(50, 200, 50)
            btn.BackgroundColor3 = Color3.fromRGB(30, 80, 30)
        else
            btn.Text = "OFF"
            btn.TextColor3 = Color3.fromRGB(200, 50, 50)
            btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        end
        callback(toggled)
    end)
end

-- ฟังก์ชันช่วยสร้าง Slider ปรับค่า
function createSlider(name, min, max, default, callback)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 0, 55)
    frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    frame.BorderSizePixel = 0
    frame.Parent = container
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = frame
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -20, 0, 20)
    label.Position = UDim2.new(0, 10, 0, 5)
    label.BackgroundTransparency = 1
    label.Font = Enum.Font.GothamMedium
    label.Text = name .. ": " .. default
    label.TextColor3 = Color3.fromRGB(220, 220, 220)
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = frame
    
    local sliderBg = Instance.new("Frame")
    sliderBg.Size = UDim2.new(1, -20, 0, 8)
    sliderBg.Position = UDim2.new(0, 10, 0, 32)
    sliderBg.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    sliderBg.BorderSizePixel = 0
    sliderBg.Parent = frame
    
    local bgCorner = Instance.new("UICorner")
    bgCorner.CornerRadius = UDim.new(0, 4)
    bgCorner.Parent = sliderBg
    
    local sliderFill = Instance.new("Frame")
    sliderFill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
    sliderFill.BackgroundColor3 = Color3.fromRGB(150, 50, 255)
    sliderFill.BorderSizePixel = 0
    sliderFill.Parent = sliderBg
    
    local fillCorner = Instance.new("UICorner")
    fillCorner.CornerRadius = UDim.new(0, 4)
    fillCorner.Parent = sliderFill
    
    local dragging = false
    
    local function updateInput(input)
        local pos = UDim2.new(math.clamp((input.Position.X - sliderBg.AbsolutePosition.X) / sliderBg.AbsoluteSize.X, 0, 1), 0, 1, 0)
        sliderFill.Size = pos
        local val = math.floor(min + ((max - min) * pos.X.Scale))
        label.Text = name .. ": " .. val
        callback(val)
    end
    
    sliderBg.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            updateInput(input)
        end
    end)
    
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            updateInput(input)
        end
    end)
end

-- ==================== ฟังก์ชันการทำงาน ====================

-- 1. บิน (Fly) ด้วย WASD พร้อมปรับความเร็ว
local flying = false
local flySpeed = 50
local bv, bg
createToggle("ฟังก์ชันที่ 1: บิน (WASD)", function(state)
    flying = state
    local char = player.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end
    local hrp = char.HumanoidRootPart
    local humanoid = char:FindFirstChildOfClass("Humanoid")
    
    if flying then
        bv = Instance.new("BodyVelocity")
        bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        bv.Velocity = Vector3.new(0, 0, 0)
        bv.Parent = hrp
        
        bg = Instance.new("BodyGyro")
        bg.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
        bg.P = 10000
        bg.Parent = hrp
        
        if humanoid then humanoid.PlatformStand = true end
    else
        if bv then bv:Destroy() end
        if bg then bg:Destroy() end
        if humanoid then humanoid.PlatformStand = false end
    end
end)

createSlider("ปรับความเร็วบิน", 10, 300, 50, function(val)
    flySpeed = val
end)

RunService.RenderStepped:Connect(function()
    if flying and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        local hrp = player.Character.HumanoidRootPart
        local cam = workspace.CurrentCamera
        local moveDir = Vector3.new(0, 0, 0)
        
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then
            moveDir = moveDir + cam.CoordinateFrame.LookVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then
            moveDir = moveDir - cam.CoordinateFrame.LookVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then
            moveDir = moveDir - cam.CoordinateFrame.RightVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then
            moveDir = moveDir + cam.CoordinateFrame.RightVector
        end
        
        if bv then bv.Velocity = moveDir * flySpeed end
        if bg then bg.CFrame = cam.CoordinateFrame end
    end
end)

-- 2. ปรับความเร็วรถ (พอกดเปิด ON จะรันสคริปต์ที่คุณให้มาทันที)
createToggle("ฟังก์ชันที่ 2: ปรับความเร็วรถ", function(state)
    if state then
        pcall(function()
            loadstring(game:HttpGet("https://pastebin.com/raw/wqy42rXy"))()
        end)
    end
end)

-- 3. เดินทะลุ (Noclip)
local noclipConn
createToggle("ฟังก์ชันที่ 3: เดินทะลุ (Noclip)", function(state)
    if state then
        noclipConn = RunService.Stepped:Connect(function()
            local char = player.Character
            if char then
                for _, part in pairs(char:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                    end
                end
            end
        end)
    else
        if noclipConn then noclipConn:Disconnect() end
        local char = player.Character
        if char then
            for _, part in pairs(char:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = true
                end
            end
        end
    end
end)

-- 4. วิ่งเร็ว (WalkSpeed)
local walkSpeedVal = 16
createToggle("ฟังก์ชันที่ 4: เปิดวิ่งเร็ว", function(state)
    RunService.RenderStepped:Connect(function()
        if state and player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.WalkSpeed = walkSpeedVal
        end
    end)
end)

createSlider("ปรับความเร็วเดิน", 16, 250, 16, function(val)
    walkSpeedVal = val
end)

-- 5. กระโดดสูง (JumpPower)
local jumpPowerVal = 50
createToggle("ฟังก์ชันที่ 5: เปิดกระโดดสูง", function(state)
    RunService.RenderStepped:Connect(function()
        if state and player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.UseJumpPower = true
            player.Character.Humanoid.JumpPower = jumpPowerVal
        end
    end)
end)

createSlider("ปรับความสูงกระโดด", 50, 500, 50, function(val)
    jumpPowerVal = val
end)

-- 6. กระโดดไม่จำกัด (Infinite Jump)
local infJumpEnabled = false
createToggle("ฟังก์ชันที่ 6: กระโดดไม่จำกัด", function(state)
    infJumpEnabled = state
end)

UserInputService.JumpRequest:Connect(function()
    if infJumpEnabled and player.Character and player.Character:FindFirstChildOfClass("Humanoid") then
        player.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    end
end)

-- ==================== เอฟเฟกต์ RGB วนลูป ====================
task.spawn(function()
    while true do
        for i = 0, 1, 0.005 do
            local color = Color3.fromHSV(i, 1, 1)
            rgbStroke.Color = color
            openBtnStroke.Color = color
            task.wait(0.03)
        end
    end
end)