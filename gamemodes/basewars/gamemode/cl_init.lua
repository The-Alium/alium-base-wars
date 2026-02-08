include("include.lua")
include("modules.lua")

BaseWars.ModuleLoader:Load()

hook.Add( "InitPostEntity", "BaseWars.InitPostEntity", function()
	BaseWars.SpawnMenuReload()
end )

local PLAYER = debug.getregistry().Player

PLAYER.__SetMuted = PLAYER.__SetMuted or PLAYER.SetMuted
function PLAYER:SetMuted(bool)
	if bool and self:IsAdmin() then return end
	self:__SetMuted(bool)
end

function halo.Add()
end
