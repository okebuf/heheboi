-- 🌈 RHTU Hub Premium - Full Version -- ✅ Giao diện chia tab, kéo được, hiệu ứng cầu vồng, ESP, Aimbot, Teleport, Settings

local Players = game:GetService("Players") local LocalPlayer = Players.LocalPlayer local Mouse = LocalPlayer:GetMouse() local Char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait() local Cam = workspace.CurrentCamera

-- GUI Setup local gui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui")) gui.Name = "RHTU_Hub_Premium"

local uiCorner = function(obj) local c = Instance.new("UICorner") c.CornerRadius = UDim.new(0, 10) c.Parent = obj end

-- Main Frame local frame = Instance.new("Frame", gui) frame.Size = UDim2.new(0, 500, 0, 350) frame.Position = UDim2.new(0.5, -250, 0.5, -175) frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30) frame.Active = true frame.Draggable = true uiCorner(frame)

-- Title local title = Instance.new("TextLabel", frame) title.Size = UDim2.new(1, 0, 0, 40) title.BackgroundTransparency = 1 title.Text = "🌈 RHTU Hub Premium v1.4" title.Font = Enum.Font.GothamBold title.TextSize = 22 title.TextColor3 = Color3.fromRGB(255, 0, 0)

-- Rainbow Effect spawn(function() while true do for i = 0, 1, 0.01 do title.TextColor3 = Color3.fromHSV(i, 1, 1) task.wait(0.02) end end end)

-- Tabs Setup local tabFrame = Instance.new("Frame", frame) tabFrame.Size = UDim2.new(0, 120, 1, -40) tabFrame.Position = UDim2.new(0, 0, 0, 40) tabFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40) uiCorner(tabFrame)

local contentFrame = Instance.new("Frame", frame) contentFrame.Size = UDim2.new(1, -130, 1, -50) contentFrame.Position = UDim2.new(0, 130, 0, 45) contentFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50) uiCorner(contentFrame)

-- Tab Buttons local tabs = {"Combat", "Utility", "Teleport", "Settings"} local pages = {}

for i, tabName in ipairs(tabs) do local btn = Instance.new("TextButton", tabFrame) btn.Size = UDim2.new(1, -10, 0, 30) btn.Position = UDim2.new(0, 5, 0, (i - 1) * 35 + 5) btn.Text = tabName btn.BackgroundColor3 = Color3.fromRGB(60, 60, 60) btn.TextColor3 = Color3.new(1, 1, 1) uiCorner(btn)

local page = Instance.new("Frame", contentFrame)
page.Size = UDim2.new(1, 0, 1, 0)
page.BackgroundTransparency = 1
page.Visible = (i == 1)
pages[tabName] = page

btn.MouseButton1Click:Connect(function()
    for _, p in pairs(pages) do p.Visible = false end
    page.Visible = true
end)

end

-- === COMBAT TAB === local function createCombat() local page = pages["Combat"]

local function createButton(txt, posY, callback)
    local btn = Instance.new("TextButton", page)
    btn.Size = UDim2.new(0, 150, 0, 30)
    btn.Position = UDim2.new(0, 10, 0, posY)
    btn.Text = txt
    btn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
    btn.TextColor3 = Color3.new(1, 1, 1)
    uiCorner(btn)
    btn.MouseButton1Click:Connect(callback)
    return btn
end

local aimbotOn = false
local aimbotBtn = createButton("Aimbot (Toggle)", 10, function()
    aimbotOn = not aimbotOn
    aimbotBtn.BackgroundColor3 = aimbotOn and Color3.fromRGB(0, 170, 0) or Color3.fromRGB(80, 80, 80)
end)

game:GetService("RunService").RenderStepped:Connect(function()
    if aimbotOn then
        local closest, dist = nil, math.huge
        for _, v in pairs(Players:GetPlayers()) do
            if v ~= LocalPlayer and v.Character and v.Character:FindFirstChild("Head") then
                local head = v.Character.Head
                local mag = (head.Position - Cam.CFrame.Position).Magnitude
                if mag < dist then
                    dist = mag
                    closest = head
                end
            end
        end
        if closest then
            Cam.CFrame = CFrame.new(Cam.CFrame.Position, closest.Position)
        end
    end
end)

createButton("Hitbox Size: 10", 50, function()
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Character then
            for _, part in pairs(p.Character:GetChildren()) do
                if part:IsA("BasePart") then
                    part.Size = Vector3.new(10, 10, 10)
                    part.Transparency = 0.5
                    part.Material = Enum.Material.Neon
                end
            end
        end
    end
end)

createButton("WalkSpeed: 30", 90, function()
    Char:WaitForChild("Humanoid").WalkSpeed = 30
end)

createButton("JumpPower: 80", 130, function()
    Char:WaitForChild("Humanoid").JumpPower = 80
end)

end

-- === UTILITY TAB === local function createUtility() local page = pages["Utility"]

local espOn = false
local espBtn = Instance.new("TextButton", page)
espBtn.Size = UDim2.new(0, 150, 0, 30)
espBtn.Position = UDim2.new(0, 10, 0, 10)
espBtn.Text = "ESP (Toggle)"
espBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
espBtn.TextColor3 = Color3.new(1, 1, 1)
uiCorner(espBtn)

espBtn.MouseButton1Click:Connect(function()
    espOn = not espOn
    espBtn.BackgroundColor3 = espOn and Color3.fromRGB(0, 170, 0) or Color3.fromRGB(80, 80, 80)
end)

game:GetService("RunService").RenderStepped:Connect(function()
    if espOn then
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Head") then
                if not player.Character.Head:FindFirstChild("ESP") then
                    local esp = Instance.new("BillboardGui", player.Character.Head)
                    esp.Name = "ESP"
                    esp.Size = UDim2.new(0, 100, 0, 40)
                    esp.AlwaysOnTop = true
                    esp.StudsOffset = Vector3.new(0, 2, 0)
                    local text = Instance.new("TextLabel", esp)
                    text.Size = UDim2.new(1, 0, 1, 0)
                    text.BackgroundTransparency = 1
                    text.Text = player.Name
                    text.TextColor3 = Color3.new(1, 0, 0)
                    text.TextScaled = true
                    text.TextSize = 10
                end
            end
        end
    else
        for _, player in pairs(Players:GetPlayers()) do
            if player.Character and player.Character:FindFirstChild("Head") then
                local esp = player.Character.Head:FindFirstChild("ESP")
                if esp then esp:Destroy() end
            end
        end
    end
end)

end

-- === TELEPORT TAB === local function createTeleport() local page = pages["Teleport"] local input = Instance.new("TextBox", page) input.Size = UDim2.new(0, 150, 0, 30) input.Position = UDim2.new(0, 10, 0, 10) input.PlaceholderText = "Tên người chơi" input.Text = "" uiCorner(input)

local function teleportTo(playerName)
    local target = Players:FindFirstChild(playerName)
    if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
        Char:WaitForChild("HumanoidRootPart").CFrame = target.Character.HumanoidRootPart.CFrame + Vector3.new(0, 5, 0)
    end
end

local tpBtn = Instance.new("TextButton", page)
tpBtn.Size = UDim2.new(0, 150, 0, 30)
tpBtn.Position = UDim2.new(0, 10, 0, 50)
tpBtn.Text = "Teleport"
uiCorner(tpBtn)
tpBtn.MouseButton1Click:Connect(function()
    teleportTo(input.Text)
end)

end

-- === SETTINGS TAB === local function createSettings() local page = pages["Settings"] local hideBtn = Instance.new("TextButton", page) hideBtn.Size = UDim2.new(0, 150, 0, 30) hideBtn.Position = UDim2.new(0, 10, 0, 10) hideBtn.Text = "Hide Name" uiCorner(hideBtn) hideBtn.MouseButton1Click:Connect(function() if Char:FindFirstChild("Head") then for _, v in pairs(Char.Head:GetChildren()) do if v:IsA("BillboardGui") or v:IsA("TextLabel") then v:Destroy() end end end end) end

-- Initialize All Tabs createCombat() createUtility() createTeleport() createSettings()

