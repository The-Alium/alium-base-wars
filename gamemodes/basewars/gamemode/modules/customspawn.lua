MODULE.Name 	= "Custom Spawn"
MODULE.Author 	= "denomito"

if SERVER then
	local map_name = game.GetMap()
	local spawns = {}

	for k, v in ipairs( util.JSONToTable( file.Read( "data_static/basewars/" .. map_name .. ".json", "GAME" ) or "{}" ) or {} ) do
		spawns[ k ] = v
	end

	for k, v in ipairs( util.JSONToTable( file.Read( "basewars/" .. map_name .. ".json", "DATA" ) or "{}" ) or {} ) do
		spawns[ k ] = v
	end

	local function replaceSpawn()
		if #spawns > 0 then
			timer.Simple( 0, function()
				for _, v in ipairs( ents.FindByClass( "info_player_start" )  ) do
					v:Remove()
				end

				for i = 1, #spawns do
					local data = spawns[ i ]

					local ent = ents.Create( "info_player_start" )
					ent:SetPos( Vector( data[ 1 ][ 1 ], data[ 1 ][ 2 ], data[ 1 ][ 3 ] ) )
					ent:SetAngles( Angle( data[ 2 ][ 1 ], data[ 2 ][ 2 ], data[ 2 ][ 3 ] ) )
					ent:Spawn()

					MsgC( Color( 255, 0, 0 ), "[CUSTOM SPAWN] ", color_white, tostring( ent ) .. " " .. tostring( ent:GetPos() ) .. "\n" )
				end
			end )
		end
	end

	hook.Add( "InitPostEntity", "BaseWars.ReplaceSpawn", replaceSpawn )
	hook.Add( "PostCleanupMap", "BaseWars.ReplaceSpawn", replaceSpawn )
end
