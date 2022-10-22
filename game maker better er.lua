function isframework(scriptInstance)
    if tostring(scriptInstance) == "Framework" then
        return true
    end
    return false
end

function checkArgs(instance,index)
    if tostring(instance):lower():find("camera") and tostring(index) == "CFrame" then
        return true
    end
    return false
end

newindex = hookmetamethod(game, "__newindex", function(self,index,value)
    local callingScr = getcallingscript()

    if isframework(callingScr) and checkArgs(self,index) then
       return;
    end

    return newindex(self,index,value)
end)


if not game.IsLoaded(game) then 
    game.Loaded.Wait(game.Loaded);
end


local IsA = game.IsA;
local newindex = nil 

newindex = hookmetamethod(game, "__newindex", function(self, Index, Value)
    if not checkcaller() and IsA(self, "Humanoid") and Index == "JumpPower" then 
        return
    end
    
    return newindex(self, Index, Value);
end)



local l = game:GetService("Lighting")

local col = Instance.new("ColorCorrectionEffect", l)
col.Brightness = 0
col.Contrast = 0.01
col.Saturation = 0.67
