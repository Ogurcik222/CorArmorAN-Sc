local function getCORArmor()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    local originalPosition = humanoidRootPart.CFrame

    local armorZoneCoords = Vector3.new(730.184143, 30.2918987, -1730.35852)

    humanoidRootPart.CFrame = CFrame.new(armorZoneCoords)
    task.wait(0.5)

    local armor = workspace:FindFirstChild("CoR_Armor")
    if armor and armor:FindFirstChild("ProximityPrompt") then
        humanoidRootPart.CFrame = armor.CFrame
        task.wait(0.5)

        fireproximityprompt(armor.ProximityPrompt)
    else
        warn("Объект CoR_Armor или его ProximityPrompt не найдены!")
        return
    end

    task.wait(0.3)
    humanoidRootPart.CFrame = originalPosition
end

getCORArmor() 
