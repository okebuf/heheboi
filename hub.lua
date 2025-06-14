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

-- Combat Tab local function createCombat() local page = pages["Combat"]

local aimbotBtn = Instance.new("TextButton", page)
aimbotBtn.Size = UDim2.new(0, 150, 0, 30)
aimbotBtn.Position = UDim2.new(0, 10, 0, 10)
aimbotBtn.Text = "Aimbot (Toggle)"
aimbotBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
aimbotBtn.TextColor3 = Color3.new(1, 1, 1)
uiCorner(aimbotBtn)

local hitboxBtn = Instance.new("TextButton", page)
hitboxBtn.Size = UDim2.new(0, 150, 0, 30)
hitboxBtn.Position = UDim2.new(0, 10, 0, 50)
hitboxBtn.Text = "Hitbox Size: 10"
hitboxBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
hitboxBtn.TextColor3 = Color3.new(1, 1, 1)
uiCorner(hitboxBtn)

local speedBtn = Instance.new("TextButton", page)
speedBtn.Size = UDim2.new(0, 150, 0, 30)
speedBtn.Position = UDim2.new(0, 10, 0, 90)
speedBtn.Text = "Walkspeed: 30"
speedBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
speedBtn.TextColor3 = Color3.new(1, 1, 1)
uiCorner(speedBtn)

local jumpBtn = Instance.new("TextButton", page)
jumpBtn.Size = UDim2.new(0, 150, 0, 30)
jumpBtn.Position = UDim2.new(0, 10, 0, 130)
jumpBtn.Text = "JumpPower: 80"
jumpBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
jumpBtn.TextColor3 = Color3.new(1, 1, 1)
uiCorner(jumpBtn)

-- Functionality
local aimbotOn = false
aimbotBtn.MouseButton1Click:Connect(function()
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

hitboxBtn.MouseButton1Click:Connect(function()
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

speedBtn.MouseButton1Click:Connect(function()
    Char:WaitForChild("Humanoid").WalkSpeed = 30
end)

jumpBtn.MouseButton1Click:Connect(function()
    Char:WaitForChild("Humanoid").JumpPower = 80
end)

end

createCombat()

-- TODO: Utility, Teleport, Settings Tabs (có ESP, View, Follow, Save Config, UI toggle, HideName, GodMode) -- Sẽ tiếp tục thêm vào ở các phần sau nếu bạn muốn

-- END

