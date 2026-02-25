--[[
    --------------------------------------------------------------
    MOON HUB | BY MOON CAT
    --------------------------------------------------------------
    Propriedade: Redz
    Biblioteca: MoonLib
    --------------------------------------------------------------
]]

-- Carregamento da sua biblioteca (MoonLib)
local MoonLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/SeuUsuario/MoonLib/main/Source.lua"))()

-- Criação da Janela Principal (Sem o lema agora)
local Window = MoonLib:CreateWindow({
    Name = "Moon Hub | By Moon Cat",
    SubTitle = "Acesso Oficial",
    LoadingTitle = "Iniciando MoonCat Hub...",
    ConfigSave = true
})

-- 1. ABA PRINCIPAL (HOME)
local MainTab = Window:CreateTab("Home", 4483362458)
MainTab:CreateSection("MoonCat Hub")

MainTab:CreateButton({
    Name = "Executar Redz Main",
    Callback = function()
        -- Código da sua propriedade Redz
        print("Redz scripts carregados!")
        MoonLib:Notify({
            Title = "Redz",
            Content = "Sistema Redz Ativado!",
            Duration = 5
        })
    end,
})

-- 2. ABA DE SCRIPTS (UTILITÁRIOS)
local ScriptTab = Window:CreateTab("Scripts", 4483364285)
ScriptTab:CreateSection("Player Tweaks")

ScriptTab:CreateSlider({
    Name = "Velocidade (WalkSpeed)",
    Range = {16, 500},
    Increment = 1,
    CurrentValue = 16,
    Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
    end,
})

-- 3. ABA DE CONFIGURAÇÕES
local ConfigTab = Window:CreateTab("Config", 4483362458)

ConfigTab:CreateButton({
    Name = "Fechar Hub",
    Callback = function()
        MoonLib:Destroy()
    end,
})

-- Notificação de inicialização padrão
MoonLib:Notify({
    Title = "Moon Hub Carregado",
    Content = "Bem-vindo de volta!",
    Duration = 5
})

print("Moon Hub | By Moon Cat inicializado com sucesso.")
