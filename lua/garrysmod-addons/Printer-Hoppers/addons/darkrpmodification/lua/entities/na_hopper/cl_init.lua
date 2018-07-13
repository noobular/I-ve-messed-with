-- Noobular's Addons [Printer Hoppers]
-- Created by : Noobular (Uncle Gremblo)
-- Last Update: 1/21/2018
-- No Redistribution
-------------------------------------------

include("shared.lua")
include("config.lua")

function ENT:Initialize()


	surface.CreateFont( "defaultbig", {
		font = "Arial", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name
		extended = false,
		size = 18,
		weight = 500,
		blursize = 0,
		scanlines = 0,
		antialias = true,
		underline = false,
		italic = false,
		strikeout = false,
		symbol = false,
		rotary = false,
		shadow = true,
		additive = false,
		outline = false,
	} )
	surface.CreateFont( "defaultsmall", {
		font = "Arial", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name
		extended = false,
		size = 14,
		weight = 500,
		blursize = 0,
		scanlines = 0,
		antialias = true,
		underline = false,
		italic = false,
		strikeout = false,
		symbol = false,
		rotary = false,
		shadow = true,
		additive = false,
		outline = false,
	} )
end

function ENT:Draw()
	if LocalPlayer():GetPos():Distance(self:GetPos()) <= na_hopper['RenderDistance']  then

		self:DrawModel()
		local pos = self:GetPos()
		local ang = self:GetAngles()
		local owner = self:Getowning_ent()
		 owner = (IsValid(owner) and owner:Nick()) or DarkRP.getPhrase("unknown")
		local progressbar = ( self:GetNWInt("stored") / self:GetNWInt("maxstored") * 310)
		local CollectionLevelBar = ( self:GetNWInt("hopperCollectionXP") / self:GetNWInt("hopperCollectionXPMax") * 310)

		local angRotated = self:GetAngles()
		angRotated:RotateAroundAxis( angRotated:Right(), -38.9)
		angRotated:RotateAroundAxis( angRotated:Up(), 90 )

		local angRotatedUpg = self:GetAngles()
		angRotatedUpg:RotateAroundAxis( angRotatedUpg:Right(), -30)
		angRotatedUpg:RotateAroundAxis( angRotatedUpg:Up(), 90 )

		local PrinterLevelAng = self:GetAngles()
		PrinterLevelAng:RotateAroundAxis( PrinterLevelAng:Right(), -45)
		PrinterLevelAng:RotateAroundAxis( PrinterLevelAng:Up(), 90 )

		local BoostBar = self:GetAngles()
		BoostBar:RotateAroundAxis( BoostBar:Right(), -45)
		BoostBar:RotateAroundAxis( BoostBar:Up(), 90 )

		cam.Start3D2D(pos + (ang:Up() * 48) + (ang:Right() * 15) + (ang:Forward() * -2.15), angRotated, .1)

			draw.RoundedBox(15,5,0,320,78,Color(0,0,0)) -- Main Frame
			draw.RoundedBox(15,45,-15,240,30,Color(0,0,0)) -- Small Bar / name

            -- Printers Collected
			draw.RoundedBox(10,10,5,145,32,Color(00,100,255)) -- Total Printers
			draw.RoundedBox(10,110,5,145/3.2,32,Color(0,50,255)) -- Total Printers

			-- EXP Collected
			draw.RoundedBox(10,160,5,160,32,Color(255,0,0)) -- XP Amount light
			draw.RoundedBox(10,241,5,80,32,Color(99, 3, 3)) -- XP Amount dark
			
			-- Money Collected
			draw.RoundedBox(10,10,40,310,32,Color(50,50,50)) -- gray base
			if progressbar > 1 then
				draw.RoundedBox(10,10,40,progressbar,32,Color(25,255,25)) -- green / top layer
			else
				draw.RoundedBox(30,10,40,progressbar,32,Color(25,255,25)) -- green / top layer
			end
			draw.RoundedBox(5,155,45,136,20,Color(0,0,0)) -- black background for the bar


			draw.DrawText("Owned By: "..owner,"defaultsmall"	,55		,-13	,Color(255,255,255,255),TEXT_ALIGN_LEFT)

			draw.DrawText("Total Printers ","defaultbig"	,15		,11	,Color(255,255,255,255),TEXT_ALIGN_LEFT)
			draw.DrawText(string.Comma(self:GetNWInt("addedPrinters")),"defaultsmall"	,123		,14	,Color(255,255,255,255),TEXT_ALIGN_LEFT)

			draw.DrawText("Stored XP "											,"defaultbig"	,166	,11	,Color(255,255,255,255),TEXT_ALIGN_LEFT)
			draw.DrawText(string.Comma(self:GetNWInt("xpstored"))				,"defaultsmall"	,248	,14	,Color(255,255,255,255),TEXT_ALIGN_LEFT)

			draw.DrawText("Money Collected"							,"defaultbig"	,15		,45	,Color(255,255,255,255),TEXT_ALIGN_LEFT)
			draw.DrawText(na_hopper['Currency']..string.Comma(self:GetNWInt("stored")).." / "..na_hopper['Currency']..string.Comma(self:GetNWInt("maxstored")),"defaultsmall",160,48,Color(255,255,255,255),TEXT_ALIGN_LEFT)


		cam.End3D2D()

			cam.Start3D2D(pos + (ang:Up() * 41.6) + (ang:Right() * 15) + (ang:Forward() * 6), angRotatedUpg, .1)

				draw.RoundedBox(15,5,0,320,78,Color(0,0,0)) -- Main Frame
				draw.RoundedBox(15,45,-15,65,30,Color(0,0,0)) -- Small Bar / name
				draw.DrawText("Upgrades","defaultsmall"	,55		,-13	,Color(255,255,255,255),TEXT_ALIGN_LEFT)

				draw.RoundedBox(10,10,5,145,32,Color(00,200,50)) -- upg1,1

				if self:GetNWBool("upg_money") == true then
					draw.RoundedBox(10,111,5,145/3.2,32,Color(50,200,0)) -- bonus$ toggle
					draw.DrawText(na_hopper['upg_money'].."x","defaultbig"	,120		,11	,Color(255,255,255,255),TEXT_ALIGN_LEFT)
				else
					draw.RoundedBox(10,111,5,145/3.2,32,Color(255,0,0)) -- bonus$ toggle
					draw.DrawText("Off","defaultbig"	,123		,11	,Color(255,255,255,255),TEXT_ALIGN_LEFT)
				end

				draw.RoundedBox(10,175,5,145,32,Color(200,60,50)) -- upg1,2
				if self:GetNWBool("upg_xp") == true then
					draw.RoundedBox(10,276,5,145/3.2,32,Color(50,200,0)) -- Total Printers
					draw.DrawText(na_hopper['upg_xp'].."x","defaultbig"	,283	,11	,Color(255,255,255,255),TEXT_ALIGN_LEFT)
				else
					draw.RoundedBox(10,276,5,145/3.2,32,Color(255,0,0)) -- bonus xp toggle
					draw.DrawText("Off","defaultbig"	,288	,11	,Color(255,255,255,255),TEXT_ALIGN_LEFT)
				end


				draw.RoundedBox(10,10,42,145,32,Color(150,0,255)) -- upg2,1
				if self:GetNWBool("upg_capacity") == true then
					draw.RoundedBox(10,111,42,145/3.2,32,Color(50,200,0)) -- Total Printers
					draw.DrawText("On","defaultbig"	,123		,48	,Color(255,255,255,255),TEXT_ALIGN_LEFT)
				else
					draw.RoundedBox(10,111,42,145/3.2,32,Color(255,0,0)) -- Capacity upg
					draw.DrawText("Off","defaultbig"	,123		,48	,Color(255,255,255,255),TEXT_ALIGN_LEFT)
				end

				draw.RoundedBox(10,175,42,145,32,Color(00,100,255)) -- upg2,2

				if self:GetNWBool("upg_maxprints") == true then
					draw.RoundedBox(10,276,42,145/3.2,32,Color(50,200,0)) -- blank
					draw.DrawText("On","defaultbig"	,288	,48	,Color(255,255,255,255),TEXT_ALIGN_LEFT)
				else
					draw.RoundedBox(10,276,42,145/3.2,32,Color(255,0,0)) -- blank
					draw.DrawText("Off","defaultbig"	,288	,48	,Color(255,255,255,255),TEXT_ALIGN_LEFT)
				end


				draw.DrawText("Bonus "..na_hopper['Currency'],"defaultbig"	,15		,11	,Color(255,255,255,255),TEXT_ALIGN_LEFT)

				draw.DrawText("Bonus XP","defaultbig"	,185	,11	,Color(255,255,255,255),TEXT_ALIGN_LEFT)

				draw.DrawText("Capacity","defaultbig"	,15		,48	,Color(255,255,255,255),TEXT_ALIGN_LEFT)

				draw.DrawText("Max Printers","defaultbig"	,185	,48	,Color(255,255,255,255),TEXT_ALIGN_LEFT)

			cam.End3D2D()

			cam.Start3D2D(pos + (ang:Up() * 33.3) + (ang:Right() * 15) + (ang:Forward() * 12.5), PrinterLevelAng, .1)
				if na_hopper["HopperMoneyMultiplier"] != na_hopper["HopperXPMultiplier"] then
					draw.RoundedBox(15,260,-20,55,30,Color(0,0,0)) -- money
					draw.RoundedBox(15,200,-20,55,30,Color(0,0,0)) -- xp

					draw.DrawText("x"..(na_hopper["HopperMoneyMultiplier"] * self:GetNWInt("hopperLevel")) + 1,"defaultbig"	,210	,-20	,Color(50,200,0,255),TEXT_ALIGN_LEFT)
					draw.DrawText("x"..(na_hopper["HopperXPMultiplier"] * self:GetNWInt("hopperLevel")) + 1,"defaultbig"	,268	,-20	,Color(200,60,50,255),TEXT_ALIGN_LEFT)
				else
					draw.RoundedBox(15,260,-20,50,30,Color(0,0,0)) -- money
					draw.DrawText("x"..(na_hopper["HopperMoneyMultiplier"] * self:GetNWInt("hopperLevel")) + 1,"defaultbig"	,270	,-20	,Color(50,200,0,255),TEXT_ALIGN_LEFT)
				end

				draw.RoundedBox(15,5,-4,320,40,Color(0,0,0)) -- Main Frame
				draw.RoundedBox(15,20,-20,160,30,Color(0,0,0)) -- Small Bar / name

				-- Hopper Level
				draw.RoundedBox(10,10,0,310,32,Color(50,50,50)) -- gray base
				draw.RoundedBox(10,10,0,CollectionLevelBar,32,Color(00,100,255)) -- green / top layer
				draw.RoundedBox(5,250,5,65,20,Color(0,0,0)) -- black background for the bar

				

				draw.DrawText(self:GetNWInt("hopperCollectionXP").." / "..self:GetNWInt("hopperCollectionXPMax"),"defaultbig"	,254	,5	,Color(255,255,255,255),TEXT_ALIGN_LEFT)
				draw.DrawText("Hopper Level: "..(self:GetNWInt("hopperLevel")),"defaultbig"	,35	,-20	,Color(255,255,255,255),TEXT_ALIGN_LEFT)

			cam.End3D2D()

			cam.Start3D2D(pos + (ang:Up() * 30) + (ang:Right() * 15) + (ang:Forward() * 16), BoostBar, .1)
				if self:GetNWBool("upg_money") == true then
					na_hopper["moneymulti"] = (na_hopper["HopperMoneyMultiplier"] * self:GetNWInt("hopperLevel")) + 1 + na_hopper["upg_money"]
				else
					na_hopper["moneymulti"] = (na_hopper["HopperMoneyMultiplier"] * self:GetNWInt("hopperLevel")) + 1
				end

				if self:GetNWBool("upg_xp") == true then
					na_hopper["xpmulti"] = (na_hopper["HopperXPMultiplier"] * self:GetNWInt("hopperLevel")) + 1 + na_hopper["upg_xp"]
				else
					na_hopper["xpmulti"] = ( na_hopper["HopperXPMultiplier"] * self:GetNWInt("hopperLevel") ) + 1
				end

				if self:GetNWBool("upg_capacity") == true then
					na_hopper["capmulti"] = (na_hopper["HopperCapMultiplier"] * self:GetNWInt("hopperLevel")) + 1 + na_hopper["upg_capacity"]
				else
					na_hopper["capmulti"] = (na_hopper["HopperCapMultiplier"] * self:GetNWInt("hopperLevel")) + 1
				end

				draw.RoundedBox(10,8,0,314,24,Color(0,0,0)) -- gray base
				draw.RoundedBox(10,10,3,310,18,Color(50,50,50)) -- gray base
				

				draw.RoundedBox(7,275,4,40,16,Color(0,0,0)) -- max prints
				draw.RoundedBox(7,230,4,40,16,Color(0,0,0)) -- capacity
				draw.RoundedBox(7,185,4,40,16,Color(0,0,0)) -- xp
				draw.RoundedBox(7,140,4,40,16,Color(0,0,0)) -- money

				draw.DrawText("Total Multipliers","defaultbig"	,20	,3	,Color(255,255,255,255),TEXT_ALIGN_LEFT)
				draw.DrawText("x"..na_hopper["moneymulti"],"defaultbig"	,145	,3	,Color(50,200,0,255),TEXT_ALIGN_LEFT)
				draw.DrawText("x"..na_hopper["xpmulti"],"defaultbig"	,190	,3	,Color(200,60,50,255),TEXT_ALIGN_LEFT)
				draw.DrawText("x"..na_hopper["capmulti"],"defaultbig"	,235	,3	,Color(150,0,255,255),TEXT_ALIGN_LEFT)
				draw.DrawText("x0","defaultbig"	,280	,3	,Color(255,255,255,255),TEXT_ALIGN_LEFT)

			cam.End3D2D()
			if na_hopper['VisualRadiusEnabled'] == true then
				cam.Start3D2D(pos + (ang:Up() * 2) + (ang:Right() * -3) + (ang:Forward() * -2.3),self:GetAngles(),2)

					surface.DrawCircle(	0 ,0,(na_hopper['CollectionRadius']) * .5, 255, 0, 0, 255 )

				cam.End3D2D()
			end

		else -- For the render check
		self:DrawShadow(false)
		end
end

function ENT:Think()

end


