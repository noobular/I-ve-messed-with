--[[print("Attempting to NPC_Factions.LUA")

local t = 0
local interval = 60
local SpawnPos = Vector(-609.531250, 388.740387, -52.753815)

function onThink()
	if t < CurTime() then
		t = CurTime() + interval
		local NPC_Generating = ents.Create("npc_alyx")
		NPC_Generating:SetPos(SpawnPos)
		NPC_Generating:Spawn()
		NPC_Generating:Give("weapon_smg1")
		NPC_Generating:SetHealth(.1)
		--print(player.GetByID( 1 ):GetClass())
		--NPC_Generating:AddEntityRelationship( player.GetByID( 1 ), D_HT, 99 ) 
		NPC_Generating:AddRelationship( "player D_HT 99" )


		-- Hate the player, would need to change this to the table of players, or if i can get the player class, i would use other function

		local NPC_Search = ents.FindByClass( "npc_*" ) --Find any spawned entity in map with class beginning at npc
		for _, NPC_Found in pairs( NPC_Search ) do --for every found entity do
			if !NPC_Found:IsNPC() then return end -- if found entity is not NPC then do nothing
			if NPC_Found:GetClass() != NPC_Generating:GetClass() then -- if found entity is not self entity then continue
				NPC_Found:AddEntityRelationship( NPC_Generating, D_HT, 99 ) -- found entity will hate self entity
				NPC_Found:AddRelationship( "player D_HT 99" )
	
				NPC_Generating:AddEntityRelationship( NPC_Found, D_HT, 99 ) -- self entity will hate found entity

			end
		end

	end
	return true
end


hook.Add( "Think", "NPC_Faction Relationships", onThink )