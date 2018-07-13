-- Noobular's Addons [Printer Hoppers]
-- Created by : Noobular (Uncle Gremblo)
-- Last Update: 1/21/2018
-- No Redistribution
-------------------------------------------
AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
AddCSLuaFile("config.lua")

include("shared.lua")
include("config.lua")

local nextAllowance = 0

function ENT:Initialize()
	self:SetNWInt("maxstored",na_hopper['MaxStored'])  -- Needs to be set from the initialization
	self:SetNWInt("hopperCollectionXPMax",na_hopper['CollectionExperienceRequired'])
	self:SetModel("models/props_combine/combine_interface001.mdl")
	-- T2 -- models/props/de_nuke/NuclearTestCabinet.mdl 
	-- T3 -- models/props/de_nuke/equipment1.mdl
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	local phys = self:GetPhysicsObject()
	if phys:IsValid() then
		phys:Wake()
	end
end

function ENT:Use(c, a)
	if na_hopper['DebugMode'] == true then
 		a:addXP(self:GetNWInt("xpstored")+ 100000,true)
 	end
	if self:GetNWInt("stored") != 0 then
		if self:GetNWInt("xpstored") != 0 then
			DarkRP.notify(c,0,5,"You've collected "..na_hopper['Currency']..string.Comma(self:GetNWInt("stored")).." and "..string.Comma(self:GetNWInt("xpstored")).."XP from the hopper.")
			a:addMoney(self:GetNWInt("stored"))
			a:addXP(self:GetNWInt("xpstored"),true)
			self:SetNWInt("stored",0)
			self:SetNWInt("xpstored",0)
		else
			a:addMoney(self:GetNWInt("stored"))
			DarkRP.notify(c,0,5,"You've collected "..na_hopper['Currency']..string.Comma(self:GetNWInt("stored")).." from the hopper.")
			self:SetNWInt("stored",0)
		end
	end
end

function ENT:Touch(e)
	if e:GetClass() == "na_upg_money" and self:GetNWBool("upg_money") != true then
		self:SetNWBool("upg_money",true)
		e:Remove()
	end

	if e:GetClass() == "na_upg_xp" and self:GetNWBool("upg_xp") != true then
		self:SetNWBool("upg_xp",true)
		e:Remove()
	end

	if e:GetClass() == "na_upg_capacity" and self:GetNWBool("upg_capacity") != true then
		self:SetNWBool("upg_capacity",true)
		self:SetNWInt("maxstored",self:GetNWInt("maxstored") * na_hopper['upg_capacity'] )
		e:Remove()
	end

	if e:GetClass() == "na_upg_maxprints" and self:GetNWBool("upg_maxprints") != true then
		self:SetNWBool("upg_maxprints",true)
		e:Remove()
	end
end

function updateCapacity(hopper)
if hopper:GetNWBool("upg_capacity") != true then
	hopper:SetNWInt("maxstored",na_hopper['MaxStored'] * (na_hopper["HopperCapMultiplier"] * hopper:GetNWInt("hopperLevel") + 1))
else
	local upgradebonus = na_hopper['MaxStored'] * na_hopper['upg_capacity']
	hopper:SetNWInt("maxstored",na_hopper['MaxStored'] * (na_hopper["HopperCapMultiplier"] * hopper:GetNWInt("hopperLevel") + 1) + upgradebonus)
end

end

function CheckFull(returnType,hopper)
	if returnType == 1 then
		if hopper:GetNWInt("stored") < hopper:GetNWInt("maxstored") then
			return false
		end
	end

	if returnType == 2 then
		if hopper:GetNWInt("hopperCollectionXP") >= hopper:GetNWInt("hopperCollectionXPMax") then
			hopper:SetNWInt("hopperLevel",hopper:GetNWInt("hopperLevel") + 1)
			hopper:SetNWInt("hopperCollectionXPMax",math.ceil(hopper:GetNWInt("hopperCollectionXPMax") * na_hopper["HopperLevelMultiplier"]))
			hopper:SetNWInt("hopperCollectionXP",0)
			updateCapacity(hopper)
		else
			return false
		end
	end

end


function CheckRadius(ent)
 --resets addedprinters to 0 so it's not infinitely adding random printers
		ent:SetNWInt("addedPrinters",0)
	    -- Searches for all ents in the radius (sphere)
		for k,v in pairs(ents.FindInSphere(ent:GetPos(),na_hopper['CollectionRadius'])) do 

			-- Is the amount being held less than the max capacity
			if CheckFull(1,ent) == false then

				-- Adds spawned_money to the collecter
				if v:GetClass() == "spawned_money" then
					local tr = util.TraceLine( {
						start = ent:GetPos(),
						endpos = v:GetPos(),
					})
					if tr.HitWorld == false then
							ent:SetNWInt("stored",ent:GetNWInt("stored") + v:Getamount())
							v:Remove()
					end
				end

				-- Adds the basic money printer to the count
				if v:GetClass() == "money_printer" then
					local tr = util.TraceLine( {
						start = ent:GetPos(),
						endpos = v:GetPos(),
					})
					if tr.HitWorld == false then
					        --self:SetNWInt("stored",self:GetNWInt("stored") + v:Getamount())
							ent:SetNWInt("addedPrinters",ent:GetNWInt("addedPrinters") + 1)
					end

				end

				-- Adds Vrondakis printers to the count and their money/exp then removes it from their ent so players can't double money.
				if v:GetClass() == "vrondakis_printer" then
					local tr = util.TraceLine( {
						start = ent:GetPos(),
						endpos = v:GetPos(),
					})
					if tr.HitWorld == false then
						ent:SetNWInt("addedPrinters",ent:GetNWInt("addedPrinters") + 1)
						if v:GetNWInt("MoneyAmount") != 0 then
							local storedmoney = v.StoredMoney
							local storedxp = v.StoredXP

							if ent:GetNWBool("upg_money") == true then
								storedmoney = math.ceil(storedmoney * (na_hopper['upg_money'] + (na_hopper["HopperMoneyMultiplier"] * ent:GetNWInt("hopperLevel") + 1)) )
							else
								storedmoney = math.ceil(storedmoney * ((na_hopper["HopperMoneyMultiplier"] * ent:GetNWInt("hopperLevel")) + 1) )
							end

							if ent:GetNWBool("upg_xp") == true then
								storedxp = math.ceil(storedxp * (na_hopper['upg_xp'] + (na_hopper["HopperXPMultiplier"] * ent:GetNWInt("hopperLevel"))) )
							else
								storedxp = math.ceil(storedxp * (na_hopper["HopperXPMultiplier"] * ent:GetNWInt("hopperLevel") + 1 ) )
							end

							ent:SetNWInt("stored",ent:GetNWInt("stored") + storedmoney)
							ent:SetNWInt("xpstored",ent:GetNWInt("xpstored") + storedxp)
							v:SetNWInt("MoneyAmount",0) 
							v.StoredMoney = 0
							v.StoredXP = 0 
							ent:SetNWInt("hopperCollectionXP",ent:GetNWInt("hopperCollectionXP") + 1)
							CheckFull(2,ent)
						end
					end
				end
			end
		end
		nextAllowance = CurTime() + na_hopper['SearchTimer']
end

function ENT:Think()
	if CurTime() < nextAllowance then return end
		CheckRadius(self);
		nextAllowance = CurTime() + na_hopper['SearchTimer']


end


function ENT:OnTakeDamage(dmg)
	if self.burningup then return end

	self.damage = (self.damage or 100) - dmg:GetDamage()
	if self.damage <= 0 then
		local rnd = math.random(1, 10)
		if rnd < 3 then
		else
			self:Destruct()
			self:Remove()
		end
	end
end

function ENT:Destruct()
	self:Remove()
end



--[[
hook.Add( "Think", "na_HopperSearchDelay", function()
	if CurTime() < delay then return end
	SearchPrinters()
	delay = (CurTime() + SearchTimer)
 end )]]