
--[[ 
    MOONLIB - FULL ORIGINAL SOURCE
    PROPERTY OF MOON CAT | MOON CAT HUB
    BASE: REDZ (FULL UNCOMPRESSED)
    
    LINK OFICIAL: https://mooncat-hub.github.io/Moonlib/
    LOADSTRING: loadstring(game:HttpGet("https://raw.githubusercontent.com/MOONCAT-HUB/Moonlib/main/moonlib.lua"))()
]]

local MoonLib = {}
local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

-- CONFIGURAÇÃO DE CORES OFICIAIS MOON CAT
local Theme = {
    Main = Color3.fromRGB(15, 15, 15),
    Accent = Color3.fromRGB(120, 0, 255), -- Roxo Neon Oficial
    Outline = Color3.fromRGB(35, 35, 35),
    Text = Color3.fromRGB(255, 255, 255),
    DarkText = Color3.fromRGB(170, 170, 170)
}

-- SISTEMA DE ANIMAÇÃO BRUTO
local function GetEasing(style, dir, time)
    return TweenInfo.new(time, Enum.EasingStyle[style], Enum.EasingDirection[dir])
end

-- SISTEMA DE ARRASTE ORIGINAL (DRAGGABLE)
local function MakeDraggable(gui)
    local dragging, dragInput, dragStart, startPos
    gui.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true; dragStart = input.Position; startPos = gui.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then dragging = false end
            end)
        end
    end)
    gui.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then dragInput = input end
    end)
    RunService.RenderStepped:Connect(function()
        if dragging and dragInput then
            local delta = dragInput.Position - dragStart
            gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
end

function MoonLib:CreateLib(Config)
    local WindowName = Config.Name or "Moon Cat Hub"
    local Screen = Instance.new("ScreenGui", CoreGui)
    Screen.Name = "MoonCat_" .. HttpService:GenerateGUID(false)

    local Main = Instance.new("Frame", Screen)
    Main.Name = "MainFrame"
    Main.BackgroundColor3 = Theme.Main
    Main.Size = UDim2.new(0, 550, 0, 380)
    Main.Position = UDim2.new(0.5, -275, 0.5, -190)
    Main.BorderSizePixel = 0
    Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 10)
    MakeDraggable(Main)

    local Stroke = Instance.new("UIStroke", Main)
    Stroke.Color = Theme.Accent -- Borda Roxo Neon
    Stroke.Thickness = 1.6

    local Sidebar = Instance.new("Frame", Main)
    Sidebar.Name = "Sidebar"
    Sidebar.Size = UDim2.new(0, 150, 1, 0)
    Sidebar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    Sidebar.BorderSizePixel = 0
    Instance.new("UICorner", Sidebar).CornerRadius = UDim.new(0, 10)

    local Title = Instance.new("TextLabel", Sidebar)
    Title.Size = UDim2.new(1, 0, 0, 55)
    Title.Text = WindowName
    Title.TextColor3 = Theme.Accent
    Title.Font = Enum.Font.GothamBold
    Title.TextSize = 16
    Title.BackgroundTransparency = 1

    local TabScroll = Instance.new("ScrollingFrame", Sidebar)
    TabScroll.Size = UDim2.new(1, 0, 1, -65)
    TabScroll.Position = UDim2.new(0, 0, 0, 60)
    TabScroll.BackgroundTransparency = 1
    TabScroll.ScrollBarThickness = 0
    
    local TabList = Instance.new("UIListLayout", TabScroll)
    TabList.Padding = UDim.new(0, 5)
    TabList.HorizontalAlignment = "Center"

    local Container = Instance.new("Frame", Main)
    Container.Name = "Container"
    Container.Size = UDim2.new(1, -165, 1, -15)
    Container.Position = UDim2.new(0, 160, 0, 10)
    Container.BackgroundTransparency = 1
      local LibFuncs = {}

    function LibFuncs:CreateTab(Name)
        local TabBtn = Instance.new("TextButton", TabScroll)
        TabBtn.Name = Name .. "_Tab"
        TabBtn.Size = UDim2.new(0.9, 0, 0, 38)
        TabBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
        TabBtn.Text = "  " .. Name
        TabBtn.TextColor3 = Theme.DarkText
        TabBtn.Font = Enum.Font.GothamMedium
        TabBtn.TextSize = 13
        TabBtn.TextXAlignment = "Left"
        Instance.new("UICorner", TabBtn).CornerRadius = UDim.new(0, 7)

        local Page = Instance.new("ScrollingFrame", Container)
        Page.Name = Name .. "_Page"
        Page.Size = UDim2.new(1, 0, 1, 0)
        Page.Visible = false
        Page.BackgroundTransparency = 1
        Page.ScrollBarThickness = 2
        Page.ScrollBarImageColor3 = Theme.Accent
        
        local PageList = Instance.new("UIListLayout", Page)
        PageList.Padding = UDim.new(0, 8)
        PageList.HorizontalAlignment = "Center"

        TabBtn.MouseButton1Click:Connect(function()
            for _, v in pairs(Container:GetChildren()) do
                if v:IsA("ScrollingFrame") then v.Visible = false end
            end
            for _, v in pairs(TabScroll:GetChildren()) do
                if v:IsA("TextButton") then
                    TweenService:Create(v, GetEasing("Quad", "Out", 0.2), {BackgroundColor3 = Color3.fromRGB(28, 28, 28), TextColor3 = Theme.DarkText}):Play()
                end
            end
            Page.Visible = true
            TweenService:Create(TabBtn, GetEasing("Quad", "Out", 0.2), {BackgroundColor3 = Theme.Accent, TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()
        end)

        local Elements = {}

        function Elements:NewSection(Title)
            local SectionFrame = Instance.new("Frame", Page)
            SectionFrame.Size = UDim2.new(0.95, 0, 0, 32)
            SectionFrame.BackgroundTransparency = 1
            
            local SectionLabel = Instance.new("TextLabel", SectionFrame)
            SectionLabel.Size = UDim2.new(1, 0, 1, 0)
            SectionLabel.Text = Title
            SectionLabel.TextColor3 = Theme.Accent
            SectionLabel.Font = Enum.Font.GothamBold
            SectionLabel.TextSize = 14
            SectionLabel.TextXAlignment = "Left"
            SectionLabel.BackgroundTransparency = 1
            
            local SectionFuncs = {}

            function SectionFuncs:AddButton(Text, Callback)
                local Btn = Instance.new("TextButton", Page)
                Btn.Size = UDim2.new(0.95, 0, 0, 40)
                Btn.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
                Btn.Text = "  " .. Text
                Btn.TextColor3 = Theme.Text
                Btn.Font = Enum.Font.GothamMedium
                Btn.TextSize = 13
                Btn.TextXAlignment = "Left"
                Instance.new("UICorner", Btn).CornerRadius = UDim.new(0, 8)
                
                local BStroke = Instance.new("UIStroke", Btn)
                BStroke.Color = Color3.fromRGB(45, 45, 45)
                BStroke.ApplyStrokeMode = "Border"

                Btn.MouseButton1Click:Connect(Callback)
            end

            function SectionFuncs:AddToggle(Text, Default, Callback)
                local Toggled = Default
                local TglBtn = Instance.new("TextButton", Page)
                TglBtn.Size = UDim2.new(0.95, 0, 0, 40)
                TglBtn.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
                TglBtn.Text = "  " .. Text
                TglBtn.TextColor3 = Theme.Text
                TglBtn.Font = Enum.Font.GothamMedium
                TglBtn.TextSize = 13
                TglBtn.TextXAlignment = "Left"
                Instance.new("UICorner", TglBtn).CornerRadius = UDim.new(0, 8)

                local Checkbox = Instance.new("Frame", TglBtn)
                Checkbox.Size = UDim2.new(0, 36, 0, 20)
                Checkbox.Position = UDim2.new(1, -48, 0.5, -10)
                Checkbox.BackgroundColor3 = Toggled and Theme.Accent or Color3.fromRGB(45, 45, 45)
                Instance.new("UICorner", Checkbox).CornerRadius = UDim.new(1, 0)

                local Indicator = Instance.new("Frame", Checkbox)
                Indicator.Size = UDim2.new(0, 16, 0, 16)
                Indicator.Position = Toggled and UDim2.new(1, -18, 0.5, -8) or UDim2.new(0, 2, 0.5, -8)
                Indicator.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Instance.new("UICorner", Indicator).CornerRadius = UDim.new(1, 0)

                TglBtn.MouseButton1Click:Connect(function()
                    Toggled = not Toggled
                    TweenService:Create(Checkbox, GetEasing("Quad", "Out", 0.2), {BackgroundColor3 = Toggled and Theme.Accent or Color3.fromRGB(45, 45, 45)}):Play()
                    TweenService:Create(Indicator, GetEasing("Quad", "Out", 0.2), {Position = Toggled and UDim2.new(1, -18, 0.5, -8) or UDim2.new(0, 2, 0.5, -8)}):Play()
                    Callback(Toggled)
                end)
            end
            return SectionFuncs
        end
        return Elements
  end
              function SectionFuncs:AddSlider(Text, Min, Max, Default, Callback)
                local SliderFrame = Instance.new("Frame", Page)
                SliderFrame.Size = UDim2.new(0.95, 0, 0, 50)
                SliderFrame.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
                Instance.new("UICorner", SliderFrame).CornerRadius = UDim.new(0, 8)

                local SliderTitle = Instance.new("TextLabel", SliderFrame)
                SliderTitle.Size = UDim2.new(1, -10, 0, 25)
                SliderTitle.Position = UDim2.new(0, 10, 0, 0)
                SliderTitle.Text = Text
                SliderTitle.TextColor3 = Theme.Text
                SliderTitle.Font = Enum.Font.GothamMedium
                SliderTitle.TextSize = 13
                SliderTitle.TextXAlignment = "Left"
                SliderTitle.BackgroundTransparency = 1

                local ValueLabel = Instance.new("TextLabel", SliderFrame)
                ValueLabel.Size = UDim2.new(0, 40, 0, 25)
                ValueLabel.Position = UDim2.new(1, -50, 0, 0)
                ValueLabel.Text = tostring(Default)
                ValueLabel.TextColor3 = Theme.Accent
                ValueLabel.Font = Enum.Font.GothamBold
                ValueLabel.TextSize = 13
                ValueLabel.BackgroundTransparency = 1

                local SliderBar = Instance.new("Frame", SliderFrame)
                SliderBar.Size = UDim2.new(0.9, 0, 0, 4)
                SliderBar.Position = UDim2.new(0.05, 0, 0.75, 0)
                SliderBar.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
                Instance.new("UICorner", SliderBar).CornerRadius = UDim.new(1, 0)

                local SliderFill = Instance.new("Frame", SliderBar)
                SliderFill.Size = UDim2.new((Default - Min) / (Max - Min), 0, 1, 0)
                SliderFill.BackgroundColor3 = Theme.Accent
                Instance.new("UICorner", SliderFill).CornerRadius = UDim.new(1, 0)

                local Sliding = false
                local function UpdateSlider()
                    local Percent = math.clamp((Mouse.X - SliderBar.AbsolutePosition.X) / SliderBar.AbsoluteSize.X, 0, 1)
                    local Value = math.floor(Min + (Max - Min) * Percent)
                    SliderFill.Size = UDim2.new(Percent, 0, 1, 0)
                    ValueLabel.Text = tostring(Value)
                    Callback(Value)
                end

                SliderBar.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then Sliding = true end
                end)
                UIS.InputEnded:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then Sliding = false end
                end)
                UIS.InputChanged:Connect(function(input)
                    if Sliding and input.UserInputType == Enum.UserInputType.MouseMovement then UpdateSlider() end
                end)
            end

            function SectionFuncs:AddDropdown(Text, List, Callback)
                local DropdownFrame = Instance.new("Frame", Page)
                DropdownFrame.Size = UDim2.new(0.95, 0, 0, 40)
                DropdownFrame.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
                DropdownFrame.ClipsDescendants = true
                Instance.new("UICorner", DropdownFrame).CornerRadius = UDim.new(0, 8)

                local DropBtn = Instance.new("TextButton", DropdownFrame)
                DropBtn.Size = UDim2.new(1, 0, 0, 40)
                DropBtn.BackgroundTransparency = 1
                DropBtn.Text = "  " .. Text
                DropBtn.TextColor3 = Theme.Text
                DropBtn.Font = Enum.Font.GothamMedium
                DropBtn.TextSize = 13
                DropBtn.TextXAlignment = "Left"

                local Arrow = Instance.new("TextLabel", DropBtn)
                Arrow.Size = UDim2.new(0, 40, 1, 0)
                Arrow.Position = UDim2.new(1, -40, 0, 0)
                Arrow.Text = ">"
                Arrow.TextColor3 = Theme.Accent
                Arrow.Font = Enum.Font.GothamBold
                Arrow.TextSize = 14
                Arrow.BackgroundTransparency = 1

                local Dropped = false
                DropBtn.MouseButton1Click:Connect(function()
                    Dropped = not Dropped
                    TweenService:Create(DropdownFrame, TweenInfo.new(0.3), {Size = Dropped and UDim2.new(0.95, 0, 0, 40 + (#List * 30)) or UDim2.new(0.95, 0, 0, 40)}):Play()
                    Arrow.Rotation = Dropped and 90 or 0
                end)

                for _, v in pairs(List) do
                    local Item = Instance.new("TextButton", DropdownFrame)
                    Item.Size = UDim2.new(1, 0, 0, 30)
                    Item.Position = UDim2.new(0, 0, 0, 40 + ((_ - 1) * 30))
                    Item.BackgroundTransparency = 1
                    Item.Text = v
                    Item.TextColor3 = Theme.DarkText
                    Item.Font = Enum.Font.GothamMedium
                    Item.TextSize = 12
                    Item.MouseButton1Click:Connect(function()
                        DropBtn.Text = "  " .. Text .. ": " .. v
                        Dropped = false
                        TweenService:Create(DropdownFrame, TweenInfo.new(0.3), {Size = UDim2.new(0.95, 0, 0, 40)}):Play()
                        Arrow.Rotation = 0
                        Callback(v)
                    end)
                end
            end
            return SectionFuncs
        end
        return Elements
    end
    return LibFuncs
end
return MoonLib
