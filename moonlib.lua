-- Moon Cat Hub | v1.0 Premium
-- Chave: MOON
-- quer divulgar divulgue mísera kk

-- [[ FUNÇÃO PRINCIPAL DO HUB ]]
local function StartMoonHub()
    -- Carregando a Interface (Visual Redz)
    local MoonLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/MOONCAT-HUB/MoonLib/main/redz_ui.lua"))()
    
    local Window = MoonLib:CreateWindow({
        Title = "Moon Cat Hub",
        SubTitle = "quer divulgar divulgue mísera kk",
        Color = Color3.fromRGB(255, 0, 0) -- Vermelho MoonCat
    })

    -- [ ABA DE FARM - MOTOR HOHO ]
    local FarmTab = Window:CreateTab("Auto Farm")
    FarmTab:CreateToggle({
        Name = "Auto Level (HoHo Engine)",
        Callback = function(v)
            _G.AutoFarm = v
            -- O código de farm do HoHo entra aqui
            if v then print("Farm Iniciado!") end
        end
    })

    -- [ ABA DE EVENTOS - TEMPERO ZEN ]
    local EventTab = Window:CreateTab("Sea Events")
    EventTab:CreateToggle({
        Name = "Auto Kitsune/Leviathan (Zen)",
        Callback = function(v)
            _G.ZenEvents = v
            -- O segredo do Zen Hub entra aqui
            if v then print("Buscando Eventos de Mar...") end
        end
    })

    -- [ ABA DE COMBATE - AIM COLOR ]
    local CombatTab = Window:CreateTab("Combate")
    CombatTab:CreateButton({
        Name = "Ativar Aim Color (Blood Strike)",
        Callback = function()
            -- Aqui vai a sua lógica de Aim por Cor
            print("Aim Color Ativado!")
        end
    })
end

-- [[ SISTEMA DE KEY ESTILO HOHO (ANTI-LULA/TAXA) ]]
local function ShowKeySystem()
    local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
    local Main = Instance.new("Frame", ScreenGui)
    Main.Size = UDim2.new(0, 320, 0, 180)
    Main.Position = UDim2.new(0.5, -160, 0.5, -90)
    Main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    Instance.new("UICorner", Main)

    local Title = Instance.new("TextLabel", Main)
    Title.Text = "MOON CAT HUB - KEY SYSTEM"
    Title.Size = UDim2.new(1, 0, 0, 40)
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.BackgroundTransparency = 1
    Title.Font = Enum.Font.GothamBold

    local Input = Instance.new("TextBox", Main)
    Input.PlaceholderText = "Digite a Key (Chave: MOON)"
    Input
    
