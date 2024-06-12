-- Load the Orion Library
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

-- Create the main window
local Window = OrionLib:MakeWindow({
    Name = "South Bronx: The Trenches",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "SouthBronxTrenches",
    IntroEnabled = false
})

-- Create a notification to indicate the script has been injected
OrionLib:MakeNotification({
    Name = "Injected",
    Content = "The script has been successfully injected.",
    Image = "rbxassetid://4483345998",
    Time = 5
})

-- Create the Aim tab
local AimTab = Window:MakeTab({
    Name = "Aim",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

-- Add a section to the Aim tab
local AimSection = AimTab:AddSection({
    Name = "Features"
})

-- Add a button for ESP functionality
AimSection:AddButton({
    Name = "ESP",
    Callback = function()
        print("ESP activated")
        loadstring(game:HttpGet(('https://raw.githubusercontent.com/Exunys/ESP-Script/main/ESP.lua'),true))()
    end
})

-- Add a button for Bighead functionality
AimSection:AddButton({
    Name = "Bighead",
    Callback = function()
        print("Bighead activated")

        local Players = game:GetService("Players")
        local RunService = game:GetService("RunService")

        RunService.Stepped:Connect(function()
            for _, player in pairs(Players:GetPlayers()) do
                if player ~= Players.LocalPlayer and player.Character and player.Character:FindFirstChild("Head") then
                    local head = player.Character.Head
                    head.CanCollide = false
                    head.Size = Vector3.new(6, 6, 6)
                    head.Transparency = 0.5
                end
            end
        end)
    end
})

-- Add a button for Silent Aim functionality
AimSection:AddButton({
    Name = "Silent Aim",
    Callback = function()
        print("Silent Aim activated")
        loadstring(game:HttpGet('https://raw.githubusercontent.com/Averiias/Universal-SilentAim/main/main.lua'))()
    end
})

-- Create the Spawners tab
local SpawnersTab = Window:MakeTab({
    Name = "Spawners",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

-- Add a section to the Spawners tab
local SpawnersSection = SpawnersTab:AddSection({
    Name = "Features"
})

-- Add a button for the Draco spawner
SpawnersSection:AddButton({
    Name = "Draco",
    Callback = function()
        print("Draco activated")
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/sg d")
    end
})

-- Create the Grind tab
local GrindTab = Window:MakeTab({
    Name = "Grind",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

-- Add a section to the Grind tab
local GrindSection = GrindTab:AddSection({
    Name = "Features"
})

-- Add buttons to the Grind section
GrindSection:AddButton({
    Name = "CHIPS [SOON]",
    Callback = function()
        print("CHIPS [SOON]")
    end
})

GrindSection:AddButton({
    Name = "BOXES [SOON]",
    Callback = function()
        print("BOXES [SOON]")
    end
})

GrindSection:AddButton({
    Name = "CARDS [SOON]",
    Callback = function()
        print("CARDS [SOON]")
    end
})

GrindSection:AddButton({
    Name = "TRASH [SOON]",
    Callback = function()
        print("TRASH [SOON]")
    end
})

-- Create the Misc tab
local MiscTab = Window:MakeTab({
    Name = "Misc",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

-- Add a section for the Destroy button in the Misc tab
local MiscSection = MiscTab:AddSection({
    Name = "Actions"
})

-- Add a button to destroy the GUI
MiscSection:AddButton({
    Name = "Destroy",
    Callback = function()
        print("GUI destroyed")
        OrionLib:Destroy()
    end
})

-- Initialize the Orion Library
OrionLib:Init()
