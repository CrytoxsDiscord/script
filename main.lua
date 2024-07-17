local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

local Window = Rayfield:CreateWindow({
    Name = "SiriusHub",
    LoadingTitle = "SiriusHub Script Hub",
    LoadingSubtitle = "by Sirius",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "SiriusHub",
        FileName = "config"
    },
    KeySystem = true,
    KeySettings = {
        Title = "SiriusHub",
        Subtitle = "Key System",
        Note = "Key: sirushub245",
        SaveKey = true,
        Key = "sirushub245"
    }
})

local autofarmTab = Window:CreateTab("Autofarm", 4483362458)

local boxJobButton = autofarmTab:CreateButton({
    Name = "Box Job Autofarm",
    Callback = function()
        -- Box Job Autofarm Script
        local player = game.Players.LocalPlayer
        local VirtualInputManager = game:GetService("VirtualInputManager")

        local running = true

        local function walkToPosAndHold(x, y, z, key, holdDuration)
            local character = player.Character
            if not character then
                warn("Character not found for player: " .. player.Name)
                return
            end

            local humanoid = character:FindFirstChildWhichIsA("Humanoid")
            if not humanoid then
                warn("Humanoid not found in character")
                return
            end

            local originalWalkSpeed = humanoid.WalkSpeed
            humanoid.WalkSpeed = 20

            humanoid:MoveTo(Vector3.new(x, y, z))
            print("Walking to position (" .. x .. ", " .. y .. ", " .. z .. ")")

            humanoid.MoveToFinished:Wait()

            local keyCode = Enum.KeyCode[string.upper(key)]
            if keyCode then
                VirtualInputManager:SendKeyEvent(true, keyCode, false, game)
                print("Pressing " .. key .. " key for " .. holdDuration .. " seconds")
                wait(holdDuration)
                VirtualInputManager:SendKeyEvent(false, keyCode, false, game)
                print("Releasing " .. key .. " key")
            else
                warn("Invalid key: " .. key)
            end

            humanoid.WalkSpeed = originalWalkSpeed
        end

        local function equipToolFromBackpack(toolName)
            local character = player.Character
            if not character then
                warn("Character not found for player: " .. player.Name)
                return
            end

            local tool = player.Backpack:FindFirstChild(toolName)
            if not tool then
                warn("Tool not found in backpack: " .. toolName)
                return
            end

            tool.Parent = character
            tool:Activate()
            print("Equipped " .. toolName)
        end

        while running do
            walkToPosAndHold(-552.7131, 3.5371, -86.2408, 'e', 2)
            equipToolFromBackpack("Crate")
            walkToPosAndHold(-403.3928, 3.4122, -71.8816, 'e', 2)
        end
    end
})

local trashJobButton = autofarmTab:CreateButton({
    Name = "Trash Job Autofarm",
    Callback = function()
        -- Trash Job Autofarm Script
        local player = game.Players.LocalPlayer
        local VirtualInputManager = game:GetService("VirtualInputManager")

        local running = true

        local function walkToPosAndHold(x, y, z, key, holdDuration)
            local character = player.Character
            if not character then
                warn("Character not found for player: " .. player.Name)
                return
            end

            local humanoid = character:FindFirstChildWhichIsA("Humanoid")
            if not humanoid then
                warn("Humanoid not found in character")
                return
            end

            local originalWalkSpeed = humanoid.WalkSpeed
            humanoid.WalkSpeed = 20

            humanoid:MoveTo(Vector3.new(x, y, z))
            print("Walking to position (" .. x .. ", " .. y .. ", " .. z .. ")")

            humanoid.MoveToFinished:Wait()

            local keyCode = Enum.KeyCode[string.upper(key)]
            if keyCode then
                VirtualInputManager:SendKeyEvent(true, keyCode, false, game)
                print("Pressing " .. key .. " key for " .. holdDuration .. " seconds")
                wait(holdDuration)
                VirtualInputManager:SendKeyEvent(false, keyCode, false, game)
                print("Releasing " .. key .. " key")
            else
                warn("Invalid key: " .. key)
            end

            humanoid.WalkSpeed = originalWalkSpeed
        end

        local function equipToolFromBackpack(toolName)
            local character = player.Character
            if not character then
                warn("Character not found for player: " .. player.Name)
                return
            end

            local tool = player.Backpack:FindFirstChild(toolName)
            if not tool then
                warn("Tool not found in backpack: " .. toolName)
                return
            end

            tool.Parent = character
            tool:Activate()
            print("Equipped " .. toolName)
        end

        while running do
            walkToPosAndHold(700.8188, 3.5372, 164.5239, 'e', 2)
            equipToolFromBackpack("TrashBag")
            walkToPosAndHold(726.8205, 3.4122, 211.7214, 'e', 2)
        end
    end
})

local aimTab = Window:CreateTab("Aim", 4483362458)

local airhubButton = aimTab:CreateButton({
    Name = "Airhub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Exunys/AirHub/main/AirHub.lua"))()
    end
})

local azureModdedButton = aimTab:CreateButton({
    Name = "AzureModded",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Actyrn/Scripts/main/AzureModded"))()
    end
})

local miscTab = Window:CreateTab("Misc", 4483362458)

local itemNotifierButton = miscTab:CreateButton({
    Name = "Item Notifier",
    Callback = function()
        -- Add your script for Item Notifier here
    end
})

local destroyUIButton = Window:CreateButton({
    Name = "Destroy UI",
    Callback = function()
        Rayfield:Destroy()
    end
})
