
include("shared.lua")
include("/../na_hopper/config.lua")

function ENT:Initialize()
	surface.CreateFont( "default_upg_money", {
		font = "Arial", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name
		extended = false,
		size = 38,
		weight = 500,
		blursize = 0,
		scanlines = 0,
		antialias = true,
		underline = false,
		italic = false,
		strikeout = false,
		symbol = false,
		rotary = false,
		shadow = false,
		additive = false,
		outline = false,
	} )

end

function ENT:Draw()
	if LocalPlayer():GetPos():Distance(self:GetPos()) <= na_hopper['RenderDistance']  then
		self:DrawShadow(true)
		self:DrawModel()
		local pos = self:GetPos()
		local ang = self:GetAngles()
		local owner = self:Getowning_ent()
		owner = (IsValid(owner) and owner:Nick()) or DarkRP.getPhrase("unknown")

		local angRotated = self:GetAngles()
		angRotated:RotateAroundAxis( angRotated:Right(), 0)
		angRotated:RotateAroundAxis( angRotated:Up(), 90)

		cam.Start3D2D(pos + (ang:Up() * 6) + (ang:Right() * 3.7) + (ang:Forward() * -2),angRotated,.1)
			draw.DrawText("Bonus "..na_hopper['Currency'],"default_upg_money"	,0	,-45	,Color(255,255,255,255),TEXT_ALIGN_LEFT)
			draw.DrawText("Upgrade","default_upg_money"	,0	,-14	,Color(255,255,255,255),TEXT_ALIGN_LEFT)
		cam.End3D2D()
	else
		self:DrawShadow(false)
	end
end