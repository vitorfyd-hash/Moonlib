-- Moon Cat Hub (Redz)
-- versão beta proibido divulgar sem autorização

local MoonLibData = {
    -- ==========================================
    -- MODO RUSH: SEA 1 e SEA 2
    -- Vai direto para a última ilha de cada mar.
    -- ==========================================
    ["RushMode"] = {
        [1] = { -- Sea 1 (Fountain City)
            MobName = "Galley Captain",
            QuestName = "GalleyQuest",
            QuestNum = 2, -- ID da quest no CommF_
            QuestGiver = CFrame.new(5259, 38, 4050),
            MobCFrame = CFrame.new(5644, 38, 4022)
        },
        [2] = { -- Sea 2 (Forgotten Island)
            MobName = "Water Fighter",
            QuestName = "ForgottenQuest",
            QuestNum = 1,
            QuestGiver = CFrame.new(-3054, 237, -10148),
            MobCFrame = CFrame.new(-3334, 240, -10543)
        }
    },

    -- ==========================================
    -- MODO EXATO: SEA 3 (Level 1500 ao 2800)
    -- ==========================================
    ["Sea3_Progressive"] = {
        {
            Min = 1500,
            Max = 1524,
            MobName = "Pirate Millionaire",
            QuestName = "PirateMillionaireQuest",
            QuestNum = 1,
            QuestGiver = CFrame.new(-288, 43, 5580),
            MobCFrame = CFrame.new(-380, 71, 5526)
        },
        {
            Min = 1525,
            Max = 1574,
            MobName = "Pistol Billionaire",
            QuestName = "PirateMillionaireQuest",
            QuestNum = 2,
            QuestGiver = CFrame.new(-288, 43, 5580),
            MobCFrame = CFrame.new(-466, 73, 5382)
        },
        -- Você pode ir adicionando as outras ilhas aqui copiando e colando este bloco...
        
        {
            -- Exemplo do limite máximo (Fevereiro 2026)
            Min = 2775,
            Max = 2800,
            MobName = "Emperor Guard", -- Exemplo de Mob final
            QuestName = "EmperorQuest",
            QuestNum = 1,
            QuestGiver = CFrame.new(1230, 50, -4500), 
            MobCFrame = CFrame.new(1350, 50, -4650)
        }
    }
}

-- O retorno OBRIGATÓRIO para o Loader não dar erro:
return MoonLibData

