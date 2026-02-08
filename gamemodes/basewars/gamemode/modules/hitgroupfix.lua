MODULE.Name 	= "Hitgroup"
MODULE.Author 	= "denomito"

local GM = GM or GAMEMODE

if SERVER then
	local scale_map = {
		[ HITGROUP_HEAD ] = 2,
		[ HITGROUP_LEFTLEG ] = 0.8,
		[ HITGROUP_RIGHTLEG ] = 0.8,
	}

	---@diagnostic disable-next-line: duplicate-set-field
	function GM:ScalePlayerDamage( _, hitgroup, dmginfo )
		local scale = scale_map[ hitgroup ] or 1

		if scale ~= 1 then
			dmginfo:ScaleDamage( scale )
		end
	end
end
