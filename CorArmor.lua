local targetPosition = Vector3.new(728.44, 7.61, -1732.89)
local radius = 10

local function activatePromptsAtPosition(position, range)
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

    local originalPosition = humanoidRootPart.CFrame
    humanoidRootPart.CFrame = CFrame.new(position)
    task.wait(0.3)

    local foundPrompt = nil

    for _, prompt in ipairs(workspace:GetDescendants()) do
        if prompt:IsA("ProximityPrompt") and prompt.Enabled then
            local parent = prompt.Parent
            if parent and parent:IsA("BasePart") and parent.Name == "CoR_Armor" then
                foundPrompt = prompt
                break
            end
        end
    end

    if foundPrompt then
        pcall(function()
            fireproximityprompt(foundPrompt, 1)
        end)
        task.wait(0.3)
    end

    humanoidRootPart.CFrame = originalPosition
end

activatePromptsAtPosition(targetPosition, radius)
