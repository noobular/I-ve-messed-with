local factions = {"No Faction", "Traitors","Imperial"}

local FACTION_NONE = {}

local FACTION_TRAITOR = {}
local FACTION_TRAITOR_NPCS = {
	"npc_strider",
	"npc_imperial_fist_apothecary_f",
	"npc_imperial_fist_captain_f",
	"npc_imperial_fist_devastator_f",
	"npc_imperial_fist_librarian_f",
	"npc_rollermine"
}

local FACTION_IMPERIAL = {}
local FACTION_IMPERIAL_NPCS = {
	"npc_alyx",
	"npc_antlion",
	"npc_antlionguard",
	"npc_imperial_fist_master_f",
	"npc_imperial_fist_marine_f",
	"npc_imperial_fist_sergeant_f",
	"npc_imperial_fist_veteran_f",
	"npc_imperial_fist_vetserg_f"
}


function NV_PlayerInitialSpawn( ply )
	local player_faction = table.Random(factions)
	ply:SetNWInt("faction",player_faction)

	if player_faction == "No Faction" then
		table.Add(FACTION_NONE, {ply:UserID()})
		local string = table.ToString(FACTION_NONE,"No Faction",true)
		print(string)
	end

	if player_faction == "Traitors" then
		table.Add(FACTION_TRAITOR, {ply:UserID()})
		local string = table.ToString(FACTION_TRAITOR,"Traitors",true)
		print(string)
	end

	if player_faction == "Imperial" then
		table.Add(FACTION_IMPERIAL, {ply:UserID()})
		local string = table.ToString(FACTION_IMPERIAL,"Imperials",true)
		print(string)
	end

	
	print( ply:GetName().." joined the server, and was placed on the "..ply:GetNWInt("faction").." Team.n/" )
end

function NPC() 
	if FACTION_TRAITOR_NPCS ~= nil then   -- for the traitors if any exist in the list of traitor npc classes
		for k, NPC_INDEX in pairs( FACTION_TRAITOR_NPCS ) do  -- Iterate through the list of npc classes for the traitors
			local TRAITOR_SEARCH = ents.FindByClass(NPC_INDEX)   -- find all ents of the current class we're iterating through
			for k, NPC_ENTITY in pairs(TRAITOR_SEARCH) do -- iterate through each found entity

				for k, SUB_INDEX in pairs ( FACTION_IMPERIAL_NPCS ) do
					local IMPERIAL_SEARCH = ents.FindByClass( SUB_INDEX )  
					for k, SUB_ENTITY in pairs ( IMPERIAL_SEARCH ) do
						NPC_ENTITY:AddEntityRelationship( SUB_ENTITY, D_HT, 99 )
						SUB_ENTITY:AddEntityRelationship( NPC_ENTITY, D_HT, 99 )
					end
				end

				for k, SUB_NPC_INDEX in pairs(TRAITOR_SEARCH) do -- iterate through each found adding the friend relationship
					NPC_ENTITY:AddEntityRelationship( SUB_NPC_INDEX, D_LI, 99 )
					SUB_NPC_INDEX:AddEntityRelationship( NPC_ENTITY, D_LI, 99 )
				end

				if FACTION_TRAITOR ~= nil then  -- players that are traitors, befriend the traitor npc
					for k, user in pairs( FACTION_TRAITOR ) do
						print(user)
						NPC_ENTITY:AddEntityRelationship( Player(user), D_LI, 99 )
					end
				end

				if FACTION_IMPERIAL ~= nil then 
					for k, user in pairs( FACTION_IMPERIAL ) do  -- players that are imperial hate the traitor npc
						NPC_ENTITY:AddEntityRelationship( Player(user), D_HT, 99 )
					end
				end
				
				if FACTION_NONE ~= nil then 
					for k, user in pairs( FACTION_NONE ) do  -- players that are imperial hate the traitor npc
						NPC_ENTITY:AddEntityRelationship( Player(user), D_HT, 99 )
					end
				end

			end
		end
	end

	if FACTION_IMPERIAL_NPCS ~= nil then

		for k, NPC_INDEX in pairs( FACTION_IMPERIAL_NPCS ) do   -- iterate through each npc class
			local IMPERIAL_SEARCH = ents.FindByClass(NPC_INDEX)  -- search iterated class string

			for k, NPC_ENTITY in pairs(IMPERIAL_SEARCH) do     -- iterate through the search of class entity

				for k, SUB_INDEX in pairs ( FACTION_TRAITOR_NPCS) do
					local TRAITOR_SEARCH = ents.FindByClass(SUB_INDEX)  
					for k, SUB_ENTITY in pairs ( TRAITOR_SEARCH ) do
						NPC_ENTITY:AddEntityRelationship( SUB_ENTITY, D_HT, 99 )
						SUB_ENTITY:AddEntityRelationship( NPC_ENTITY, D_HT, 99 )
					end
				end

				for k, SUB_NPC_INDEX in pairs(IMPERIAL_SEARCH) do -- iterate through each found adding the friend relationship
					NPC_ENTITY:AddEntityRelationship( SUB_NPC_INDEX, D_LI, 99 )
					SUB_NPC_INDEX:AddEntityRelationship( NPC_ENTITY, D_LI, 99 )
				end

				if FACTION_TRAITOR ~= nil then 
					for k, user in pairs( FACTION_TRAITOR ) do
						NPC_ENTITY:AddEntityRelationship( Player(user), D_HT, 99 )
					end
				end
				if FACTION_IMPERIAL ~= nil then 
					for k, user in pairs( FACTION_IMPERIAL ) do
						NPC_ENTITY:AddEntityRelationship( Player(user), D_LI, 99 )
					end
				end
				
				if FACTION_NONE ~= nil then 
					for k, user in pairs( FACTION_NONE ) do  -- players that are imperial hate the traitor npc
						NPC_ENTITY:AddEntityRelationship( Player(user), D_HT, 99 )
					end
				end
			end
		end
	end



end




function SetNPCFaction(class,faction)
	local NPC_Search = ents.FindByClass(class) 

	if NPC_Search ~= nil then
		for k, NPC_Found in pairs( NPC_Search ) do
			NPC_Found:SetHealth(1)
			if faction == "imperial" then

				if FACTION_TRAITOR ~= nil then 
					for k, user in pairs( FACTION_TRAITOR ) do
						print(user)
						NPC_Found:AddEntityRelationship( Player(user), D_LI, 99 )
					end
				end
				if FACTION_IMPERIAL ~= nil then 
					for k, user in pairs( FACTION_IMPERIAL ) do
						NPC_Found:AddEntityRelationship( Player(user), D_HT, 99 )
					end
				end

				if FACTION_TRAITOR_NPCS ~= nil then
					for k, NPC_INDEX in pairs( FACTION_TRAITOR_NPCS ) do
						local TRAITOR_SEARCH = ents.FindByClass(NPC_INDEX) 
						for k, NPC_Entity in pairs(TRAITOR_SEARCH) do
							print(NPC_Entity)
							
							NPC_Entity:AddEntityRelationship( NPC_INDEX, D_LI, 99 )

						end
					end
				end


				if FACTION_IMPERIAL ~= nil then 
					for k, user in pairs( FACTION_IMPERIAL ) do
						NPC_Found:AddEntityRelationship( Player(user), D_HT, 99 )
					end
				end

				if FACTION_IMPERIAL_NPCS ~= nil then 
					for k, NPC_INDEX in pairs( FACTION_IMPERIAL_NPCS ) do
					
						--NPC_Found:AddEntityRelationship( NPC_INDEX, D_HT, 99 )

					end
				end
			end




			if faction == "traitor" then
				local NPC_Search = ents.FindByClass(class) -- Traitor
				for k, NPC_Found in pairs( NPC_Search ) do
					if FACTION_IMPERIAL ~= nil then 
						for k, user in pairs( FACTION_IMPERIAL ) do
						
							--NPC_Found:AddEntityRelationship( Player(user), D_LI, 99 )
							
						end
					end
				end
			
				if FACTION_TRAITOR ~= nil then 
					for k, user in pairs( FACTION_TRAITOR ) do
						
						--NPC_Found:AddEntityRelationship( Player(user), D_HT, 99 )
			
					end
				end
			end

		end
	end

end

function Thinking() 
	NPC()
end




function NV_PlayerDisconnected (ply)



end

hook.Add( "Think", "NVUtility_Think", Thinking )
hook.Add( "PlayerDisconnected", "NVUtility_Disconnected", NV_PlayerDisconnected )
hook.Add( "PlayerInitialSpawn", "NVUtility_InitialSpawn", NV_PlayerInitialSpawn )
