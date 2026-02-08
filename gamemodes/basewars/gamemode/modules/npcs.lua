MODULE.Name 	= "NPCs"
MODULE.Author 	= "Q2F2 & Ghosty"

local tag = "BaseWars.NPCs"

if CLIENT then return end

util.AddNetworkString("BaseWars.NPCs.Menu")

function MODULE:CreateNPCs()

	-- local Map = game.GetMap()
	-- local Entry = BaseWars.NPCTable[Map]

	-- if not Entry then return end

	-- for k, v in next, Entry do

	-- 	local Ent = ents.Create(v.Class or "bw_npc")
	-- 		if not BaseWars.Ents:Valid(Ent) then continue end

	-- 		Ent:SetPos(v.Pos)
	-- 		Ent:SetAngles(v.Ang)

	-- 	Ent:Spawn()
	-- 	Ent:Activate()

	-- 	Ent:CPPISetOwner(game.GetWorld())

	-- end

end

hook.Add("InitPostEntity", tag .. ".CreateNPCs", Curry(MODULE.CreateNPCs))
