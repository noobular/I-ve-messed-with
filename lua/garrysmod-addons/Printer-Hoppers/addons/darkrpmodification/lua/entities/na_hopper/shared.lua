-- Noobular's Addons [Printer Hoppers]
-- Created by : Noobular (Uncle Gremblo)
-- Last Update: 1/21/2018
-- No Redistribution
-------------------------------------------
ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Printer Hopper"
ENT.Author = "Noobular / Uncle Gremblo"
ENT.Category = "(NA) Noobular's Addons"
ENT.Spawnable = true
ENT.AdminSpawnable = true

function ENT:SetupDataTables()
	-- Owning Ent
	self:NetworkVar("Entity", 0, "owning_ent")     -- Owner of the Entity (spawner)

	-- Money Related
	self:SetNWInt("maxstored",na_hopper['MaxStored'])
	self:NetworkVar("Int", 2, "stored")    -- Current $ Stored
	self:NetworkVar("Int", 3, "xpstored")  -- Current XP Stored
	self:NetworkVar("Int", 4, "printersconnected") -- Current Printers Connected

	-- Printer Leveling
	self:SetNWInt("hopperLevel",1)
	self:SetNWInt("hopperCollectionXPMax",na_hopper['CollectionExperienceRequired'])
	self:NetworkVar("Int",6,"hopperCollectionXP")
	
	-- Upgrades
	self:NetworkVar("Bool",1,"upg_money")
	self:NetworkVar("Bool",2,"upg_xp")
	self:NetworkVar("Bool",3,"upg_capacity")
	self:NetworkVar("Bool",4,"upg_maxprints")
end