print("Attempting to NPC_HateAll.LUA")

function onThink()
    local Player_Search = ents.FindByClass( "player" ) --Find any spawned entity in map with class beginning at npc
    for k, Player_Found in pairs( Player_Search ) do
        Player_Found:GetNWInt( "faction" )
    end


--[[
    local NPC_Search = ents.FindByClass( "npc_*" ) --Find any spawned entity in map with class beginning at npc

    for k, NPC_Found in pairs( NPC_Search ) do
        NPC_Found:AddRelationship( "player D_HT 99" )
    end
]]
end


hook.Add( "Think", "NPC_FactionHateships", onThink )