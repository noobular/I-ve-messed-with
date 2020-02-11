local function AddNPC( t, class )
	list.Set( "NPC", class or t.Class, t )
end

local Category = "Imperial"

AddNPC( {
	Name = "Imperial",
	Class = "npc_alyx",
	Category = Category,
	Weapons = { "weapon_alyxgun", "weapon_smg1", "weapon_shotgun" },
	KeyValues = { SquadName = "imperial" }
} )

local Category = "Traitors"

AddNPC( {
	Name = "Traitor",
	Class = "npc_alyx",
	Category = Category,
	Weapons = { "weapon_alyxgun", "weapon_smg1", "weapon_shotgun" },
	KeyValues = { SquadName = "traitors" }
} )
