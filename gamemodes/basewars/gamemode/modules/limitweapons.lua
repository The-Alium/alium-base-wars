MODULE.Name 	= "Limit TacRP"
MODULE.Author 	= "denomito"

local cv_limit = CreateConVar("sv_tacrp_basewars_limit", "3", bit.bor( FCVAR_ARCHIVE + FCVAR_REPLICATED ) , "", 1 )

if SERVER then

	local function limitWeps( ply )
		local weps = ply:GetWeapons()

		local c = 1

		for i = 1, #weps do
			local wep = weps[ i ]
			if wep.ArcticTacRP then
				c = c + 1
				if c > cv_limit:GetInt() then
					return false
				end
			end
		end

		return true
	end

	hook.Add( "PlayerCanPickupWeapon", "CanPickupsBasewears", function( ply, wep )

		---@diagnostic disable-next-line: undefined-field
		if IsValid( wep ) and wep.ArcticTacRP then
			if not limitWeps( ply ) then
				ply:ChatPrint( "Limit weapons!" )

				return false
			end
		end
	end )
end
