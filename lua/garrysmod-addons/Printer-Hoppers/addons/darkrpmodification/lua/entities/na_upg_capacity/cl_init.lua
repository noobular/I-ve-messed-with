
include("shared.lua")

function ENT:Initialize()
	surface.CreateFont( "default_capacity", {
		font = "Arial", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name
		extended = false,
		size = 44,
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
		angRotated:RotateAroundAxis( angRotated:Forward(),-90)
		angRotated:RotateAroundAxis( angRotated:Up(), 180)

		cam.Start3D2D(pos + (ang:Up() * 15) + (ang:Right() * -2) + (ang:Forward() * 1),angRotated,.1)

			draw.DrawText("Capacity","default_capacity"	,0	,0	,Color(255,0,255,255),TEXT_ALIGN_LEFT)
			draw.DrawText("Upgrade","default_capacity"	,0	,40	,Color(255,0,255,255),TEXT_ALIGN_LEFT)

		cam.End3D2D()
	else
		self:DrawShadow(false)
	end
end
