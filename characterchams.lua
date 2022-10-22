-- credits to czopek aka czo#0001


getgenv().S = {
    Enabled = true,
    Material = Enum.Material.ForceField, 
    Color = Color3.fromRGB(209, 36, 36), --// color the chams are gonna be
    Time = 0.5, --// time between creating a new cham thing
}

local Players = game:GetService("Players")
local Player = Players.LocalPlayer

spawn(function()
    while (getgenv().S.Enabled == true) and task.wait() do
        game:GetService("Players").LocalPlayer.Character.Archivable = true
        local Clone = game:GetService("Players").LocalPlayer.Character:Clone()
        for _,Obj in next, Clone:GetDescendants() do
            if Obj.Name == "HumanoidRootPart" or Obj:IsA("Humanoid") or Obj:IsA("LocalScript") or Obj:IsA("Script") or Obj:IsA("Decal") then
                Obj:Destroy()
            elseif Obj:IsA("BasePart") or Obj:IsA("Meshpart") or Obj:IsA("Part") then
                if Obj.Transparency == 1 then
                    Obj:Destroy()
                else
                    Obj.CanCollide = false
                    Obj.Anchored = true
                    Obj.Material = (getgenv().S.Material)
                    Obj.Color = (getgenv().S.Color)
                    Obj.Transparency = 0
                    Obj.Size = Obj.Size + Vector3.new(0.03, 0.03, 0.03)   
                end
            end
            pcall(function()
                Obj.CanCollide = false
            end)
        end
        Clone.Parent = game.Workspace
        wait(getgenv().S.Time)
        Clone:Destroy()  
    end
end)
