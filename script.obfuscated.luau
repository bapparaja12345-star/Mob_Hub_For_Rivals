-- your coppying this script to fuck you
local P = game:GetService("Players")
local LP = P.LocalPlayer
local UIS = game:GetService("UserInputService")
local TS = game:GetService("TweenService")
local Clipboard = setclipboard or toclipboard or syn and syn.write_clipboard

local CorrectPassword = "mob91@1"
local LinkToCopy = "https://link-hub.net/7371115/U5f0ubJClp2s" 
-- crater @bappa_raja
-- Create Login ScreenGui
local LoginGui = Instance.new("ScreenGui", game.CoreGui)
LoginGui.Name = "BappaRajaLoginGui"
LoginGui.ResetOnSpawn = false
-- crater @bappa_raja
-- Guaranteed Click Sound
local ClickSound = Instance.new("Sound", LoginGui)
ClickSound.SoundId = "rbxassetid://8394620892"
ClickSound.Volume = 1

local function playLoginSound()
    local soundClone = ClickSound:Clone()
    soundClone.Parent = LoginGui
    soundClone:Play()
    soundClone.Ended:Connect(function()
        soundClone:Destroy()
    end)
end
-- crater @bappa_raja
-- Main Login Frame
local LoginMain = Instance.new("Frame", LoginGui)
LoginMain.Size = UDim2.new(0, 240, 0, 225)
LoginMain.Position = UDim2.new(0.5, -120, 0.5, -112)
LoginMain.BackgroundColor3 = Color3.fromRGB(6, 12, 6)
LoginMain.Active = true
LoginMain.Visible = true
Instance.new("UICorner", LoginMain).CornerRadius = UDim.new(0, 10)
-- crater @bappa_raja
-- Hacker Background Matrix Grid Effect
local HackerBG = Instance.new("TextLabel", LoginMain)
HackerBG.Size = UDim2.new(1, 0, 1, 0)
HackerBG.BackgroundTransparency = 1
HackerBG.Text = "01010101\n10101010\n01100110\n10011001\n01010101\n10101010\n01100110\n10011001\n01010101\n10101010"
HackerBG.TextColor3 = Color3.fromRGB(0, 255, 65)
HackerBG.TextTransparency = 0.90
HackerBG.Font = Enum.Font.Code
HackerBG.TextSize = 10
HackerBG.TextWrapped = true
HackerBG.ZIndex = 1
-- crater @bappa_raja
local Stroke = Instance.new("UIStroke", LoginMain)
Stroke.Thickness = 1.2
Stroke.Color = Color3.fromRGB(0, 255, 65)

-- Top Bar Frame
local LoginTopBar = Instance.new("Frame", LoginMain)
LoginTopBar.Size = UDim2.new(1, 0, 0, 34)
LoginTopBar.BackgroundTransparency = 1
LoginTopBar.ZIndex = 3
-- crater @bappa_raja
-- Fixed Dragging Logic (Stops mouse sticking bug completely)
local dragging, dragInput, dragStart, startPos
LoginTopBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = LoginMain.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)
-- crater @bappa_raja
LoginTopBar.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UIS.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        LoginMain.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)

-- Title
local LoginTitle = Instance.new("TextLabel", LoginTopBar)
LoginTitle.Size = UDim2.new(1, -40, 1, 0)
LoginTitle.Position = UDim2.new(0, 12, 0, 0)
LoginTitle.Text = "🔒 Mob Hub - Login"
LoginTitle.TextColor3 = Color3.fromRGB(220, 255, 220)
LoginTitle.Font = Enum.Font.Code
LoginTitle.BackgroundTransparency = 1
LoginTitle.TextSize = 10
LoginTitle.TextXAlignment = Enum.TextXAlignment.Left
LoginTitle.ZIndex = 3

-- Exit Button
local LoginExitBtn = Instance.new("TextButton", LoginTopBar)
LoginExitBtn.Size = UDim2.new(0, 20, 0, 20)
LoginExitBtn.Position = UDim2.new(1, -26, 0.5, -10)
LoginExitBtn.BackgroundColor3 = Color3.fromRGB(12, 25, 12)
LoginExitBtn.TextColor3 = Color3.fromRGB(0, 255, 65)
LoginExitBtn.Font = Enum.Font.Code
LoginExitBtn.TextSize = 10
LoginExitBtn.Text = "×"
LoginExitBtn.ZIndex = 3
Instance.new("UICorner", LoginExitBtn).CornerRadius = UDim.new(0, 4)

local ExitStroke = Instance.new("UIStroke", LoginExitBtn)
ExitStroke.Color = Color3.fromRGB(0, 100, 30)
ExitStroke.Thickness = 1

LoginExitBtn.MouseButton1Click:Connect(function()
    playLoginSound()
    LoginGui:Destroy()
end)
-- crater @bappa_raja
-- Divider
local LoginDivider = Instance.new("Frame", LoginMain)
LoginDivider.Size = UDim2.new(1, -20, 0, 1)
LoginDivider.Position = UDim2.new(0, 10, 0, 34)
LoginDivider.BackgroundColor3 = Color3.fromRGB(0, 80, 25)
LoginDivider.BorderSizePixel = 0
LoginDivider.ZIndex = 3

-- Status/Error Text Label
local StatusLabel = Instance.new("TextLabel", LoginMain)
StatusLabel.Size = UDim2.new(1, -20, 0, 20)
StatusLabel.Position = UDim2.new(0, 10, 0, 42)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Font = Enum.Font.Code
StatusLabel.TextSize = 9
StatusLabel.TextColor3 = Color3.fromRGB(120, 220, 120)
StatusLabel.Text = "Enter security password..."
StatusLabel.TextXAlignment = Enum.TextXAlignment.Left
StatusLabel.ZIndex = 3

-- Password Input Box (TextBox fixed)
local PassBox = Instance.new("TextBox", LoginMain)
PassBox.Size = UDim2.new(1, -20, 0, 30)
PassBox.Position = UDim2.new(0, 10, 0, 68)
PassBox.BackgroundColor3 = Color3.fromRGB(10, 18, 10)
PassBox.TextColor3 = Color3.fromRGB(0, 255, 65)
PassBox.Text = "" -- Fixed: Empty text so it doesn't show "TextBox" literally
PassBox.PlaceholderText = "Password..."
PassBox.PlaceholderColor3 = Color3.fromRGB(60, 120, 60)
PassBox.Font = Enum.Font.Code
PassBox.TextSize = 11
PassBox.ClearTextOnFocus = false
PassBox.ZIndex = 3
Instance.new("UICorner", PassBox).CornerRadius = UDim.new(0, 4)

local BoxStroke = Instance.new("UIStroke", PassBox)
BoxStroke.Color = Color3.fromRGB(0, 100, 30)
BoxStroke.Thickness = 1

-- Login Button
local LoginBtn = Instance.new("TextButton", LoginMain)
LoginBtn.Size = UDim2.new(1, -20, 0, 30)
LoginBtn.Position = UDim2.new(0, 10, 0, 106)
LoginBtn.BackgroundColor3 = Color3.fromRGB(0, 60, 20)
LoginBtn.TextColor3 = Color3.fromRGB(0, 255, 65)
LoginBtn.Font = Enum.Font.Code
LoginBtn.TextSize = 10
LoginBtn.Text = "⚡ AUTHORIZE LOGIN"
LoginBtn.ZIndex = 3
Instance.new("UICorner", LoginBtn).CornerRadius = UDim.new(0, 4)

local BtnStroke = Instance.new("UIStroke", LoginBtn)
BtnStroke.Color = Color3.fromRGB(0, 180, 50)
BtnStroke.Thickness = 1

-- Separate Copy Link Button
local CopyBtn = Instance.new("TextButton", LoginMain)
CopyBtn.Size = UDim2.new(1, -20, 0, 30)
CopyBtn.Position = UDim2.new(0, 10, 0, 142)
CopyBtn.BackgroundColor3 = Color3.fromRGB(15, 30, 15)
CopyBtn.TextColor3 = Color3.fromRGB(0, 255, 65)
CopyBtn.Font = Enum.Font.Code
CopyBtn.TextSize = 10
CopyBtn.Text = "📋 GET PASS COPPY LINK"
CopyBtn.ZIndex = 3
Instance.new("UICorner", CopyBtn).CornerRadius = UDim.new(0, 4)

local CopyStroke = Instance.new("UIStroke", CopyBtn)
CopyStroke.Color = Color3.fromRGB(0, 120, 40)
CopyStroke.Thickness = 1

-- Footer Note
local Footer = Instance.new("TextLabel", LoginMain)
Footer.Size = UDim2.new(1, -20, 0, 20)
Footer.Position = UDim2.new(0, 10, 0, 186)
Footer.BackgroundTransparency = 1
Footer.Font = Enum.Font.Code
Footer.TextSize = 8
Footer.TextColor3 = Color3.fromRGB(100, 150, 100)
Footer.Text = "Pass: mob91@1"
Footer.ZIndex = 3
-- crater @bappa_raja
-- Yield execution until successful login
local loggedIn = false
local function attemptLogin()
    playLoginSound()
    if PassBox.Text == CorrectPassword then
        StatusLabel.TextColor3 = Color3.fromRGB(0, 255, 65)
        StatusLabel.Text = "Access Granted!"
        task.wait(0.6)
        LoginGui:Destroy()
        loggedIn = true
    else
        StatusLabel.TextColor3 = Color3.fromRGB(255, 60, 60)
        StatusLabel.Text = "Access Denied: Wrong Password!"
        TS:Create(PassBox, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(40, 10, 10)}):Play()
        task.wait(0.2)
        TS:Create(PassBox, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(10, 18, 10)}):Play()
    end
end

-- Separate copy action function
CopyBtn.MouseButton1Click:Connect(function()
    playLoginSound()
    if Clipboard then
        pcall(function()
            Clipboard(LinkToCopy)
        end)
        StatusLabel.TextColor3 = Color3.fromRGB(0, 255, 65)
        StatusLabel.Text = "Link Copied to Clipboard!"
    else
        StatusLabel.TextColor3 = Color3.fromRGB(255, 180, 0)
        StatusLabel.Text = "Clipboard not supported!"
    end
end)

LoginBtn.MouseButton1Click:Connect(attemptLogin)
PassBox.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        attemptLogin()
    end
end)

-- Wait until user logs in successfully before starting the main hub
while not loggedIn do
    task.wait(0.1)
end


-- ==================== MAIN SCRIPT ====================
local RS_Service = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TS_Service = game:GetService("TweenService")
local C = workspace.CurrentCamera

local SetControlsRemote
pcall(function()
    SetControlsRemote = ReplicatedStorage:WaitForChild("Remotes", 2):WaitForChild("Replication", 2):WaitForChild("Fighter", 2):WaitForChild("SetControls", 2)
end)

_G.A = false
_G.E = true
_G.Speed = false
_G.Fly = false
_G.N = false
_G.S = false

local Keybinds = {
    A = Enum.KeyCode.N,
    E = Enum.KeyCode.G,
    Speed = Enum.KeyCode.Q,
    Fly = Enum.KeyCode.P,
    N = Enum.KeyCode.K,
    S = Enum.KeyCode.Z
}

local SpeedMult = 0.5

-- ==================== 5-SECOND LOADING SCREEN ====================
local LoadGui = Instance.new("ScreenGui", game.CoreGui)
LoadGui.Name = "BappaRajaLoadingGui"
LoadGui.ResetOnSpawn = false

local LoadFrame = Instance.new("Frame", LoadGui)
LoadFrame.Size = UDim2.new(0, 240, 0, 110)
LoadFrame.Position = UDim2.new(0.5, -120, 0.5, -55)
LoadFrame.BackgroundColor3 = Color3.fromRGB(5, 10, 5)
Instance.new("UICorner", LoadFrame).CornerRadius = UDim.new(0, 8)

local LoadStroke = Instance.new("UIStroke", LoadFrame)
LoadStroke.Color = Color3.fromRGB(0, 255, 65)
LoadStroke.Thickness = 1.2

local LoadTitle = Instance.new("TextLabel", LoadFrame)
LoadTitle.Size = UDim2.new(1, 0, 0, 25)
LoadTitle.Position = UDim2.new(0, 0, 0, 12)
LoadTitle.BackgroundTransparency = 1
LoadTitle.Text = "> loading..."
LoadTitle.TextColor3 = Color3.fromRGB(0, 255, 65)
LoadTitle.Font = Enum.Font.Code
LoadTitle.TextSize = 10

local LoadStatus = Instance.new("TextLabel", LoadFrame)
LoadStatus.Size = UDim2.new(1, 0, 0, 18)
LoadStatus.Position = UDim2.new(0, 0, 0, 38)
LoadStatus.BackgroundTransparency = 1
LoadStatus.Text = "loading(3)"
LoadStatus.TextColor3 = Color3.fromRGB(120, 220, 120)
LoadStatus.Font = Enum.Font.Code
LoadStatus.TextSize = 9

local BarBackground = Instance.new("Frame", LoadFrame)
BarBackground.Size = UDim2.new(1, -30, 0, 6)
BarBackground.Position = UDim2.new(0, 15, 0, 72)
BarBackground.BackgroundColor3 = Color3.fromRGB(10, 20, 10)
BarBackground.BorderSizePixel = 0
Instance.new("UICorner", BarBackground).CornerRadius = UDim.new(1, 0)

local BarFill = Instance.new("Frame", BarBackground)
BarFill.Size = UDim2.new(0, 0, 1, 0)
BarFill.BackgroundColor3 = Color3.fromRGB(0, 255, 65)
BarFill.BorderSizePixel = 0
Instance.new("UICorner", BarFill).CornerRadius = UDim.new(1, 0)

task.spawn(function()
    TS_Service:Create(BarFill, TweenInfo.new(5, Enum.EasingStyle.Linear), {Size = UDim2.new(1, 0, 1, 0)}):Play()
    
    task.wait(1.5)
    LoadStatus.Text = "loading(2)"
    task.wait(1.8)
    LoadStatus.Text = "loadstring(1)"
    task.wait(1.4)
    LoadStatus.Text = "Access Granted."
    task.wait(0.3)
    
    LoadGui:Destroy()
end)

task.wait(5.1)

-- ==================== MAIN MENU ====================
local G = Instance.new("ScreenGui", game.CoreGui)
G.Name = "BappaRajaMasterGUI"
G.ResetOnSpawn = false

local ClickSoundMain = Instance.new("Sound", G)
ClickSoundMain.SoundId = "rbxassetid://8394620892"
ClickSoundMain.Volume = 1

local function playClickSound()
    local soundClone = ClickSoundMain:Clone()
    soundClone.Parent = G
    soundClone:Play()
    soundClone.Ended:Connect(function()
        soundClone:Destroy()
    end)
end

local Main = Instance.new("Frame", G)
Main.Size = UDim2.new(0, 210, 0, 390)
Main.Position = UDim2.new(0.05, 0, 0.3, 0)
Main.BackgroundColor3 = Color3.fromRGB(6, 12, 6)
Main.Active = true
Main.Visible = true
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 10)

local HackerBGMain = Instance.new("TextLabel", Main)
HackerBGMain.Size = UDim2.new(1, 0, 1, 0)
HackerBGMain.BackgroundTransparency = 1
HackerBGMain.Text = "01010101\n10101010\n01100110\n10011001\n01010101\n10101010\n01100110\n10011001\n01010101\n10101010\n01100110\n10011001"
HackerBGMain.TextColor3 = Color3.fromRGB(0, 255, 65)
HackerBGMain.TextTransparency = 0.90
HackerBGMain.Font = Enum.Font.Code
HackerBGMain.TextSize = 10
HackerBGMain.TextWrapped = true
HackerBGMain.ZIndex = 1

local StrokeMain = Instance.new("UIStroke", Main)
StrokeMain.Thickness = 1.2
local Grad = Instance.new("UIGradient", StrokeMain)
Grad.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.new(0, 1, 0)),
    ColorSequenceKeypoint.new(0.5, Color3.new(0, 0.3, 0)),
    ColorSequenceKeypoint.new(1, Color3.new(0, 1, 0))
})
task.spawn(function() while task.wait() do Grad.Rotation = (Grad.Rotation + 3) % 360 end end)

local TopBar = Instance.new("Frame", Main)
TopBar.Size = UDim2.new(1, 0, 0, 34)
TopBar.BackgroundTransparency = 1
TopBar.ZIndex = 3

local draggingMain, dragInputMain, dragStartMain, startPosMain
TopBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        draggingMain = true
        dragStartMain = input.Position
        startPosMain = Main.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                draggingMain = false
            end
        end)
    end
end)

TopBar.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInputMain = input
    end
end)

UIS.InputChanged:Connect(function(input)
    if input == dragInputMain and draggingMain then
        local delta = input.Position - dragStartMain
        Main.Position = UDim2.new(startPosMain.X.Scale, startPosMain.X.Offset + delta.X, startPosMain.Y.Scale, startPosMain.Y.Offset + delta.Y)
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        draggingMain = false
    end
end)

local StatusDot = Instance.new("Frame", TopBar)
StatusDot.Size = UDim2.new(0, 5, 0, 5)
StatusDot.Position = UDim2.new(0, 10, 0.5, -2)
StatusDot.BackgroundColor3 = Color3.fromRGB(0, 255, 65)
StatusDot.BorderSizePixel = 0
Instance.new("UICorner", StatusDot).CornerRadius = UDim.new(1, 0)
StatusDot.ZIndex = 3

local Title = Instance.new("TextLabel", TopBar)
Title.Size = UDim2.new(1, -40, 1, 0)
Title.Position = UDim2.new(0, 20, 0, 0)
Title.Text = "👟 Mob hub v2.0"
Title.TextColor3 = Color3.fromRGB(220, 255, 220)
Title.Font = Enum.Font.Code
Title.BackgroundTransparency = 1
Title.TextSize, Title.TextXAlignment = 10, Enum.TextXAlignment.Left
Title.ZIndex = 3

local ExitBtn = Instance.new("TextButton", TopBar)
ExitBtn.Size = UDim2.new(0, 20, 0, 20)
ExitBtn.Position = UDim2.new(1, -26, 0.5, -10)
ExitBtn.BackgroundColor3 = Color3.fromRGB(12, 25, 12)
ExitBtn.TextColor3 = Color3.fromRGB(0, 255, 65)
ExitBtn.Font = Enum.Font.Code
ExitBtn.TextSize = 10
ExitBtn.Text = "×"
ExitBtn.ZIndex = 3
Instance.new("UICorner", ExitBtn).CornerRadius = UDim.new(0, 4)

local ExitStroke = Instance.new("UIStroke", ExitBtn)
ExitStroke.Color = Color3.fromRGB(0, 100, 30)
ExitStroke.Thickness = 1

ExitBtn.MouseButton1Click:Connect(function()
    playClickSound()
    G:Destroy()
end)
-- crater @bappa_raja
local Divider = Instance.new("Frame", Main)
Divider.Size = UDim2.new(1, -20, 0, 1)
Divider.Position = UDim2.new(0, 10, 0, 34)
Divider.BackgroundColor3 = Color3.fromRGB(0, 80, 25)
Divider.BorderSizePixel = 0
Divider.ZIndex = 3

local StatsBar = Instance.new("Frame", Main)
StatsBar.Size = UDim2.new(1, -20, 0, 20)
StatsBar.Position = UDim2.new(0, 10, 0, 38)
StatsBar.BackgroundColor3 = Color3.fromRGB(8, 16, 8)
StatsBar.ZIndex = 3
Instance.new("UICorner", StatsBar).CornerRadius = UDim.new(0, 4)

local StatsStroke = Instance.new("UIStroke", StatsBar)
StatsStroke.Color = Color3.fromRGB(0, 80, 25)
StatsStroke.Thickness = 1

local StatsLabel = Instance.new("TextLabel", StatsBar)
StatsLabel.Size = UDim2.new(1, 0, 1, 0)
StatsLabel.BackgroundTransparency = 1
StatsLabel.Font = Enum.Font.Code
StatsLabel.TextSize = 8
StatsLabel.TextColor3 = Color3.fromRGB(0, 255, 65)
StatsLabel.Text = "FPS: -- | PING: --ms | TIME: --:--:--"
StatsLabel.ZIndex = 3

local StatsDivider = Instance.new("Frame", Main)
StatsDivider.Size = UDim2.new(1, -20, 0, 1)
StatsDivider.Position = UDim2.new(0, 10, 0, 61)
StatsDivider.BackgroundColor3 = Color3.fromRGB(0, 80, 25)
StatsDivider.BorderSizePixel = 0
StatsDivider.ZIndex = 3

local Scroll = Instance.new("ScrollingFrame", Main)
Scroll.Size = UDim2.new(1, -8, 1, -68)
Scroll.Position = UDim2.new(0, 4, 0, 64)
Scroll.BackgroundTransparency = 1
Scroll.CanvasSize = UDim2.new(0, 0, 0, 420)
Scroll.ScrollBarThickness = 2
Scroll.ScrollBarImageColor3 = Color3.fromRGB(0, 255, 65)
Scroll.ZIndex = 3

local UIList = Instance.new("UIListLayout", Scroll)
UIList.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIList.Padding = UDim.new(0, 4)
UIList.SortOrder = Enum.SortOrder.LayoutOrder

local uiVisible = true
UIS.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.RightShift then
        uiVisible = not uiVisible
        playClickSound()
        if uiVisible then
            Main.Visible = true
            Main.Size = UDim2.new(0, 0, 0, 0)
            TS_Service:Create(Main, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = UDim2.new(0, 210, 0, 390)}):Play()
        else
            local tween = TS_Service:Create(Main, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Size = UDim2.new(0, 0, 0, 0)})
            tween:Play()
            tween.Completed:Connect(function()
                if not uiVisible then Main.Visible = false end
            end)
        end
    end
end)

local updateVisualFuncs = {}

local function createBtn(emoji, name, toggleVar)
    local btn = Instance.new("TextButton", Scroll)
    btn.Size = UDim2.new(1, -10, 0, 28)
    btn.Font = Enum.Font.Code
    btn.TextSize = 9
    btn.TextColor3 = Color3.fromRGB(220, 255, 220)
    btn.ZIndex = 4
    
    local function updateVisuals(tweening)
        local state = _G[toggleVar]
        local targetColor = state and Color3.fromRGB(0, 60, 20) or Color3.fromRGB(10, 18, 10)
        if tweening then
            TS_Service:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = targetColor}):Play()
        else
            btn.BackgroundColor3 = targetColor
        end
        btn.Text = " " .. emoji .. " " .. name .. "  •  " .. (state and "<font color='#00FF41'>[ON]</font>" or "<font color='#FF4444'>[OFF]</font>")
        btn.RichText = true
        btn.TextXAlignment = Enum.TextXAlignment.Left
    end
    -- crater @bappa_raja
    updateVisualFuncs[toggleVar] = function()
        updateVisuals(true)
    end
    
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 4)
    
    local stroke = Instance.new("UIStroke", btn)
    stroke.Color = Color3.fromRGB(0, 80, 25)
    stroke.Thickness = 1

    local KeyBtn = Instance.new("TextButton", btn)
    KeyBtn.Size = UDim2.new(0, 36, 0, 18)
    KeyBtn.Position = UDim2.new(1, -38, 0.5, -9)
    KeyBtn.BackgroundColor3 = Color3.fromRGB(5, 15, 5)
    KeyBtn.TextColor3 = Color3.fromRGB(0, 255, 65)
    KeyBtn.Font = Enum.Font.Code
    KeyBtn.TextSize = 8
    KeyBtn.ZIndex = 5
    Instance.new("UICorner", KeyBtn).CornerRadius = UDim.new(0, 3)
    
    local keyStroke = Instance.new("UIStroke", KeyBtn)
    keyStroke.Color = Color3.fromRGB(0, 120, 40)
    keyStroke.Thickness = 1

    local function updateKeyText()
        KeyBtn.Text = "[" .. Keybinds[toggleVar].Name .. "]"
    end
    updateKeyText()

    local listening = false
    KeyBtn.MouseButton1Click:Connect(function()
        playClickSound()
        listening = true
        KeyBtn.Text = "[...]"
        
        local connection
        connection = UIS.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.Keyboard then
                Keybinds[toggleVar] = input.KeyCode
                listening = false
                updateKeyText()
                playClickSound()
                connection:Disconnect()
            end
        end)
    end)
    
    updateVisuals(false)
    
    btn.MouseButton1Click:Connect(function()
        if not listening then
            playClickSound()
            _G[toggleVar] = not _G[toggleVar]
            updateVisuals(true)
        end
    end)
end

local function createSpoofBtn(emoji, name, deviceValue)
    local btn = Instance.new("TextButton", Scroll)
    btn.Size = UDim2.new(1, -10, 0, 28)
    btn.BackgroundColor3 = Color3.fromRGB(10, 18, 10)
    btn.TextColor3 = Color3.fromRGB(200, 255, 200)
    btn.Font = Enum.Font.Code
    btn.TextSize = 9
    btn.Text = " " .. emoji .. " " .. name
    btn.TextXAlignment = Enum.TextXAlignment.Left
    btn.ZIndex = 4
    
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 4)
    
    local stroke = Instance.new("UIStroke", btn)
    stroke.Color = Color3.fromRGB(0, 80, 25)
    stroke.Thickness = 1

    btn.MouseButton1Click:Connect(function()
        playClickSound()
        if SetControlsRemote then
            SetControlsRemote:FireServer("MouseKeyboard")
            task.wait(0.3)
            SetControlsRemote:FireServer(deviceValue)
        end
        TS_Service:Create(btn, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(0, 140, 45)}):Play()
        task.wait(0.15)
        TS_Service:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(10, 18, 10)}):Play()
    end)
end

createBtn("🎯", "Aim", "A")
createBtn("👁️", "ESP", "E")
createBtn("⚡", "Speed", "Speed")
createBtn("🕊️", "Fly", "Fly")
createBtn("👻", "NoClip", "N")
createBtn("🌪️", "Spin", "S")

local Sep = Instance.new("TextLabel", Scroll)
Sep.Size = UDim2.new(1, -10, 0, 20)
Sep.BackgroundTransparency = 1
Sep.Text = " [ DEVICE_SPOOFER ]"
Sep.TextColor3 = Color3.fromRGB(0, 180, 50)
Sep.Font = Enum.Font.Code
Sep.TextSize = 8
Sep.TextXAlignment = Enum.TextXAlignment.Left
Sep.ZIndex = 4

createSpoofBtn("💻", "Mouse & Keyboard", "MouseKeyboard")
createSpoofBtn("🎮", "Gamepad", "Gamepad")
createSpoofBtn("📱", "Touch (Mobile)", "Touch")
createSpoofBtn("🥽", "VR", "VR")

UIS.InputBegan:Connect(function(numInput, gameProcessed)
    if not gameProcessed and numInput.UserInputType == Enum.UserInputType.Keyboard then
        for varName, keyCode in pairs(Keybinds) do
            if numInput.KeyCode == keyCode then
                _G[varName] = not _G[varName]
                playClickSound()
                if updateVisualFuncs[varName] then
                    updateVisualFuncs[varName]()
                end
            end
        end
    end
end)

local lastStatUpdate = 0
RS_Service.RenderStepped:Connect(function(dt)
    if tick() - lastStatUpdate > 0.4 then
        lastStatUpdate = tick()
        local fps = math.floor(1 / dt)
        local ping = 0
        pcall(function()
            ping = math.floor(LP:GetNetworkPing() * 1000)
        end)
        local timeStr = os.date("%H:%M:%S")
        StatsLabel.Text = string.format("FPS: %d | PING: %dms | TIME: %s", fps, ping, timeStr)
    end

    local Char = LP.Character
    if not Char or not Char:FindFirstChild("HumanoidRootPart") then return end
    local Root = Char.HumanoidRootPart
    local Hum = Char:FindFirstChild("Humanoid")

    if _G.N then for _, v in pairs(Char:GetDescendants()) do if v:IsA("BasePart") then v.CanCollide = false end end end
    if _G.Speed and Hum.MoveDirection.Magnitude > 0 then Root.CFrame = Root.CFrame + (Hum.MoveDirection * SpeedMult) end
    if _G.Fly and UIS:IsKeyDown(Enum.KeyCode.Space) then Root.Velocity = Vector3.new(0, 100, 0) end
    if _G.S then Root.CFrame = Root.CFrame * CFrame.Angles(0, math.rad(60), 0) end

    local Target, Closest = nil, 1000
    for _, v in pairs(P:GetPlayers()) do
        if v ~= LP and v.Character and v.Character:FindFirstChild("Head") then
            local Pos, OnScreen = C:WorldToViewportPoint(v.Character.Head.Position)
            if OnScreen then
                local DistM = (Vector2.new(Pos.X, Pos.Y) - UIS:GetMouseLocation()).Magnitude
                if DistM < Closest then Target = v.Character; Closest = DistM end
            end
        end
    end

    if Target and _G.A and UIS:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then
        C.CFrame = CFrame.new(C.CFrame.Position, Target.Head.Position)
    end
end)
-- crater @bappa_raja -- crater @bappa_raja -- crater @bappa_raja
