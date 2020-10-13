local Players = game:GetService("Players")
local RunS = game:GetService("RunService")
local PLR, Mouse = Players.LocalPlayer, Players.LocalPlayer:GetMouse();
local rawmet, Index, NIndex, NCall, Caller = getrawmetatable(game), getrawmetatable(game).__index, getrawmetatable(game).__newindex, getrawmetatable(game).__namecall, checkcaller or is_protosmasher_caller
local noclip, KeyT = false, "x" 
setreadonly(rawmet, false)

RunS.Stepped:Connect(function()
	if noclip == true and PLR and PLR.Character and PLR.Character:FindFirstChild("Humanoid") then
		pcall(function()
			PLR.Character.Head.CanCollide = false
			PLR.Character.Torso.CanCollide = false
		end)
	end
end)

rawmet.__newindex = newcclosure(function(self, crv, Value)
	if Caller() then
		return NIndex(self, crv, Value)
	end
	if tostring(self) == "HumanoidRootPart" or tostring(self) == "Torso" then
		if crv == "CFrame" and self:IsDescendantOf(PLR.Character) then
			return true
		end
	end
	return NIndex(self, crv, Value)
end)
setreadonly(rawmet, true)

Mouse.KeyDown:Connect(function(Key)
	if Key == KeyT then
		noclip = not noclip
		Notify("Entry-Null", "Noclip: "..tostring(noclip), "", 3)
	end
end)

loadstring(game:HttpGet("https://raw.githubusercontent.com/Entry-Null/Noclip/main/Notification.lua", true))()
Notify("Entry-Null", "Press F9 for tutorial.", "", 4);
warn("Press "..string.upper(KeyT).." to toggle noclip");
