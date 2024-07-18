local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

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

local boxJobRunning = false
local boxJobToggle = autofarmTab:CreateToggle({
    Name = "Box Job Autofarm",
    CurrentValue = false,
    Flag = "BoxJobToggle",
    Callback = function(Value)
        boxJobRunning = Value
        if boxJobRunning then
            while boxJobRunning do
                local player = game.Players.LocalPlayer
                local VirtualInputManager = game:GetService("VirtualInputManager")

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

                walkToPosAndHold(-552.7131, 3.5371, -86.2408, 'e', 2)
                equipToolFromBackpack("Crate")
                walkToPosAndHold(-403.3928, 3.4122, -71.8816, 'e', 2)
            end
        end
    end
})

local trashJobRunning = false
local trashJobToggle = autofarmTab:CreateToggle({
    Name = "Trash Job Autofarm",
    CurrentValue = false,
    Flag = "TrashJobToggle",
    Callback = function(Value)
        trashJobRunning = Value
        if trashJobRunning then
            while trashJobRunning do
                local player = game.Players.LocalPlayer
                local VirtualInputManager = game:GetService("VirtualInputManager")

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

                walkToPosAndHold(700.8188, 3.5372, 164.5239, 'e', 2)
                equipToolFromBackpack("TrashBag")
                walkToPosAndHold(726.8205, 3.4122, 211.7214, 'e', 2)
            end
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

local function sendNotification(toolName)
    Rayfield:Notify({
        Title = "Player Tool Update",
        Content = "Player: " .. player.Name .. "\nTool: " .. toolName,
        Duration = 6.5,
        Image = 4483362458
    })
end

local function updateTool()
    local character = player.Character
    local tool = character and character:FindFirstChildOfClass("Tool")

    if tool then
        sendNotification(tool.Name)
    else
        sendNotification("None")
    end
end

player.CharacterAdded:Connect(function(character)
    character.ChildAdded:Connect(updateTool)
    character.ChildRemoved:Connect(updateTool)
    updateTool()
end)

player.Backpack.ChildAdded:Connect(updateTool)
player.Backpack.ChildRemoved:Connect(updateTool)

updateTool()

local destroyUIButton = Window:CreateButton({
    Name = "Destroy UI",
    Callback = function()
        Rayfield:Destroy()
    end
})
