local function Base()
	local BorderCorner = 16
	local ScreenWidth = ScrW() / 2 
	local ScreenHeight = 6
	local BorderAmtH = 2
	local BorderAmtW = 4

	local nothing = 0
	local DrawHealth = LocalPlayer():Health() or 0
	local DrawFullBar = ScrW() / 4
	local DrawMaxHealth = LocalPlayer():GetMaxHealth() or 0
	local DrawArmor = LocalPlayer():Armor() or 0
	local DrawEnergy = math.ceil(LocalPlayer():getDarkRPVar("Energy") or 0)
	local DrawMoney = LocalPlayer():getDarkRPVar("money")
	local DrawSalary = LocalPlayer():getDarkRPVar("salary")
	local DrawJob = LocalPlayer():getDarkRPVar("job")
	local DrawLevel = LocalPlayer():getDarkRPVar("level")
	local DrawRank = ""
/*
		if player:IsUserGroup("user") then
			DrawRank = "user"
		end

		if player:IsUserGroup("Bronze VIP") then
			DrawRank = "Bronze VIP"
		end
		
		if player:IsUserGroup("Silver VIP") then
			DrawRank = "Silver VIP"
		end
		
		if player:IsUserGroup("Gold VIP") then
			DrawRank = "Gold VIP"
		end
		
		if player:IsUserGroup("Platinum VIP") then
			DrawRank = "Platinum VIP"
		end
*/



	local hplength2 = ((ScrW()/4) / LocalPlayer():GetMaxHealth() * LocalPlayer():Health())
	local armorlength2 = ((ScrW()/4) / 255 * LocalPlayer():Armor())


	draw.RoundedBox(20,ScrW() / 2 - ScreenWidth - 20,ScrH() - ScrH()/ScreenHeight,ScrW()/3.5 ,ScrH()/ScreenHeight + 50,Color(25,25,25,230)) -- Left Base 
	draw.RoundedBox(20,ScrW() / 1.375 ,ScrH() - ScrH()/ScreenHeight,ScrW()/3.5 ,ScrH()/ScreenHeight + 50,Color(25,25,25,230)) -- Right Base
	draw.RoundedBox(0,ScrW()  / 3.7 ,ScrH() - ScrH() / 12.5,ScrW()/2.1875 ,ScrH()/ScreenHeight,Color(25,25,25,230)) -- Middle Base

	

		function NewBar(name,xvar,yvar,vartype,barlength,color1,color2,color3,coloralphaa)
			draw.RoundedBox(BorderCorner,ScrW() - ScrW() / xvar ,ScrH() / yvar,ScrW()/4,ScrH()/20,Color(40,40,40,220)) -- Background
			if vartype != 0 then
				draw.RoundedBox(BorderCorner,ScrW() - ScrW() / xvar + 3,ScrH() / yvar + BorderAmtH,barlength - 6,ScrH() / 20 - BorderAmtW,Color(color1,color2,color3,coloralphaa)) -- Actual Health Bar
			end
			draw.DrawText(name..": "..vartype,"CloseCaption_Bold",ScrW() - ScrW() / xvar + 10,ScrH() / yvar + BorderAmtH,Color(255,255,255,255))
		end

		function NewBar2(name,xvar,yvar,vartype,barlength,color1,color2,color3,coloralphaa)
			draw.RoundedBox(BorderCorner,ScrW() - ScrW() / xvar ,ScrH() / yvar,ScrW()/4,ScrH()/20,Color(40,40,40,220)) -- Background
			if vartype != 0 then
				draw.RoundedBox(BorderCorner,ScrW() - ScrW() / xvar + 3,ScrH() / yvar + BorderAmtH,barlength - 6,ScrH() / 20 - BorderAmtW,Color(color1,color2,color3,coloralphaa)) -- Actual Health Bar
			end
			draw.DrawText(name..""..vartype,"CloseCaption_Bold",ScrW() - ScrW() / xvar + 10,ScrH() / yvar + BorderAmtH,Color(255,255,255,255))
		end

	



		NewBar("Health",1.01,1.190,DrawHealth,hplength2,240,0,0,255)
		NewBar("Armor",1.01,1.120,DrawArmor,armorlength2,0,0,200,255)
		NewBar2("",1.01,1.057,DarkRP.formatMoney(DrawMoney),DrawFullBar,0,255,0,255)

		NewBar("Rank",3.85,1.19,DrawRank.." "..DrawMaxHealth,DrawFullBar,235,119,0,220)	
		NewBar("Job",3.85,1.12,DrawJob,DrawFullBar,40,40,40,220)
		NewBar("Salary",3.85,1.057,DrawSalary,DrawFullBar,40,40,40,220)
		draw.RoundedBox(120,ScrW() / 2 -125 ,ScrH() - ScrH()/8,250,250,Color(25,25,25,255)) -- Level Circle
		draw.DrawText("Level","CloseCaption_Bold",ScrW() / 2.1,ScrH() - ScrH() / 9,Color(255,0,0,255))
		draw.DrawText(DrawLevel,"CloseCaption_Bold",ScrW() / 2.03,ScrH() - ScrH() / 13.5,Color(255,0,0,255))
end
/*---------------------------------------------------------------------------
HUD ConVars
---------------------------------------------------------------------------*/
local ConVars = {}
local HUDWidth
local HUDHeight

local Color = Color
local CurTime = CurTime
local cvars = cvars
local DarkRP = DarkRP
local draw = draw
local GetConVar = GetConVar
local hook = hook
local IsValid = IsValid
local Lerp = Lerp
local localplayer
local math = math
local pairs = pairs
local ScrW, ScrH = ScrW, ScrH
local SortedPairs = SortedPairs
local string = string
local surface = surface
local table = table
local timer = timer
local tostring = tostring
local plyMeta = FindMetaTable("Player")

local colors = {}
colors.black = Color(0, 0, 0, 255)
colors.blue = Color(0, 0, 255, 255)
colors.brightred = Color(200, 30, 30, 255)
colors.darkred = Color(0, 0, 70, 100)
colors.darkblack = Color(0, 0, 0, 200)
colors.gray1 = Color(0, 0, 0, 155)
colors.gray2 = Color(51, 58, 51,100)
colors.red = Color(255, 0, 0, 255)
colors.white = Color(255, 255, 255, 255)
colors.white1 = Color(255, 255, 255, 200)

local function ReloadConVars()
	ConVars = {
		background = {0,0,0,100},
		Healthbackground = {0,0,0,200},
		Healthforeground = {140,0,0,180},
		HealthText = {255,255,255,200},
		Job1 = {0,0,150,200},
		Job2 = {0,0,0,255},
		salary1 = {0,150,0,200},
		salary2 = {0,0,0,255}
	}

	for name, Colour in pairs(ConVars) do
		ConVars[name] = {}
		for num, rgb in SortedPairs(Colour) do
			local CVar = GetConVar(name..num) or CreateClientConVar(name..num, rgb, true, false)
			table.insert(ConVars[name], CVar:GetInt())

			if not cvars.GetConVarCallbacks(name..num, false) then
				cvars.AddChangeCallback(name..num, function() timer.Simple(0,ReloadConVars) end)
			end
		end
		ConVars[name] = Color(unpack(ConVars[name]))
	end


	HUDWidth = (GetConVar("HudW") or  CreateClientConVar("HudW", 240, true, false)):GetInt()
	HUDHeight = (GetConVar("HudH") or CreateClientConVar("HudH", 115, true, false)):GetInt()

	if not cvars.GetConVarCallbacks("HudW", false) and not cvars.GetConVarCallbacks("HudH", false) then
		cvars.AddChangeCallback("HudW", function() timer.Simple(0,ReloadConVars) end)
		cvars.AddChangeCallback("HudH", function() timer.Simple(0,ReloadConVars) end)
	end
end
ReloadConVars()

local Scrw, Scrh, RelativeY
/*---------------------------------------------------------------------------
HUD Seperate Elements
---------------------------------------------------------------------------*/

local Page = Material("icon16/page_white_text.png")
local function GunLicense()
	if localplayer:getDarkRPVar("HasGunlicense") then
	end
end

local agendaText
local function Agenda()

	local agenda = localplayer:getAgendaTable()
	if not agenda then return end
	agendaText = agendaText or DarkRP.textWrap((localplayer:getDarkRPVar("agenda") or ""):gsub("//", "\n"):gsub("\\n", "\n"), "DarkRPHUD1", 440)

	draw.RoundedBox(10, 10, 10, 460, 110, colors.gray1)
	draw.RoundedBox(10, 12, 12, 456, 106, colors.gray2)
	draw.RoundedBox(10, 12, 12, 456, 20, colors.darkred)

	draw.DrawNonParsedText(agenda.Title, "DarkRPHUD1", 30, 12, colors.red, 0)
	draw.DrawNonParsedText(agendaText, "DarkRPHUD1", 30, 35, colors.white, 0)
end

hook.Add("DarkRPVarChanged", "agendaHUD", function(ply, var, _, new)
	if ply ~= localplayer then return end
	if var == "agenda" and new then
		agendaText = DarkRP.textWrap(new:gsub("//", "\n"):gsub("\\n", "\n"), "DarkRPHUD1", 440)
	else
		agendaText = nil
	end

	if var == "salary" then
		salaryText = DarkRP.getPhrase("salary", DarkRP.formatMoney(new), "")
	end

	if var == "job" or var == "money" then
		JobWalletText = string.format("%s\n%s",
			DarkRP.getPhrase("job", var == "job" and new or localplayer:getDarkRPVar("job") or ""),
			DarkRP.getPhrase("wallet", var == "money" and DarkRP.formatMoney(new) or DarkRP.formatMoney(localplayer:getDarkRPVar("money")), "")
		)
	end
end)

local VoiceChatTexture = surface.GetTextureID("voice/icntlk_pl")
local function DrawVoiceChat()
	if localplayer.DRPIsTalking then
		local chbxX, chboxY = chat.GetChatBoxPos()

		local Rotating = math.sin(CurTime()*3)
		local backwards = 0
		if Rotating < 0 then
			Rotating = 1-(1+Rotating)
			backwards = 180
		end
		surface.SetTexture(VoiceChatTexture)
		surface.SetDrawColor(ConVars.Healthforeground)
		surface.DrawTexturedRectRotated(Scrw - 100, chboxY, Rotating*96, 96, backwards)
	end
end

local function LockDown()
	local chbxX, chboxY = chat.GetChatBoxPos()
	if GetGlobalBool("DarkRP_LockDown") then
		local cin = (math.sin(CurTime()) + 1) / 2
		local chatBoxSize = math.floor(Scrh / 4)
		draw.DrawNonParsedText(DarkRP.getPhrase("lockdown_started"), "ScoreboardSubtitle", chbxX, chboxY + chatBoxSize, Color(cin * 255, 0, 255 - (cin * 255), 255), TEXT_ALIGN_LEFT)
	end
end

local Arrested = function() end

usermessage.Hook("GotArrested", function(msg)
	local StartArrested = CurTime()
	local ArrestedUntil = msg:ReadFloat()

	Arrested = function()
		if CurTime() - StartArrested <= ArrestedUntil and localplayer:getDarkRPVar("Arrested") then
			draw.DrawNonParsedText(DarkRP.getPhrase("youre_arrested", math.ceil(ArrestedUntil - (CurTime() - StartArrested))), "DarkRPHUD1", Scrw/2, Scrh - Scrh/12, colors.white, 1)
		elseif not localplayer:getDarkRPVar("Arrested") then
			Arrested = function() end
		end
	end
end)

local AdminTell = function() end

usermessage.Hook("AdminTell", function(msg)
	timer.Destroy("DarkRP_AdminTell")
	local Message = msg:ReadString()

	AdminTell = function()
		draw.RoundedBox(4, 10, 10, Scrw - 20, 110, colors.darkblack)
		draw.DrawNonParsedText(DarkRP.getPhrase("listen_up"), "GModToolName", Scrw / 2 + 10, 10, colors.white, 1)
		draw.DrawNonParsedText(Message, "ChatFont", Scrw / 2 + 10, 90, colors.brightred, 1)
	end

	timer.Create("DarkRP_AdminTell", 10, 1, function()
		AdminTell = function() end
	end)
end)


/*---------------------------------------------------------------------------
Entity HUDPaint things
---------------------------------------------------------------------------*/
-- Draw a player's name, health and/or job above the head
-- This syntax allows for easy overriding
plyMeta.drawPlayerInfo = plyMeta.drawPlayerInfo or function(self)
	local pos = self:EyePos()

	pos.z = pos.z + 10 -- The position we want is a bit above the position of the eyes
	pos = pos:ToScreen()
	if not self:getDarkRPVar("wanted") then
		-- Move the text up a few pixels to compensate for the height of the text
		pos.y = pos.y - 50
	end

	if GAMEMODE.Config.showname then
		local nick, plyTeam = self:Nick(), self:Team()
		draw.DrawNonParsedText(nick, "DarkRPHUD2", pos.x + 1, pos.y + 1, colors.black, 1)
		draw.DrawNonParsedText(nick, "DarkRPHUD2", pos.x, pos.y, RPExtraTeams[plyTeam] and RPExtraTeams[plyTeam].color or team.GetColor(plyTeam) , 1)
	end

	if GAMEMODE.Config.showhealth then
		local health = DarkRP.getPhrase("health", self:Health())
		draw.DrawNonParsedText(health, "DarkRPHUD2", pos.x + 1, pos.y + 21, colors.black, 1)
		draw.DrawNonParsedText(health, "DarkRPHUD2", pos.x, pos.y + 20, colors.white1, 1)
	end

	if GAMEMODE.Config.showjob then
		local teamname = self:getDarkRPVar("job") or team.GetName(self:Team())
		draw.DrawNonParsedText(teamname, "DarkRPHUD2", pos.x + 1, pos.y + 41, colors.black, 1)
		draw.DrawNonParsedText(teamname, "DarkRPHUD2", pos.x, pos.y + 40, colors.white1, 1)
	end

	if self:getDarkRPVar("HasGunlicense") then
		surface.SetMaterial(Page)
		surface.SetDrawColor(255,255,255,255)
		surface.DrawTexturedRect(pos.x-16, pos.y + 60, 32, 32)
	end
end

-- Draw wanted information above a player's head
-- This syntax allows for easy overriding
plyMeta.drawWantedInfo = plyMeta.drawWantedInfo or function(self)
	if not self:Alive() then return end

	local pos = self:EyePos()
	if not pos:isInSight({localplayer, self}) then return end

	pos.z = pos.z + 10
	pos = pos:ToScreen()

	if GAMEMODE.Config.showname then
		local nick, plyTeam = self:Nick(), self:Team()
		draw.DrawNonParsedText(nick, "DarkRPHUD2", pos.x + 1, pos.y + 1, colors.black, 1)
		draw.DrawNonParsedText(nick, "DarkRPHUD2", pos.x, pos.y, RPExtraTeams[plyTeam] and RPExtraTeams[plyTeam].color or team.GetColor(plyTeam) , 1)
	end

	local wantedText = DarkRP.getPhrase("wanted", tostring(self:getDarkRPVar("wantedReason")))

	draw.DrawNonParsedText(wantedText, "DarkRPHUD2", pos.x, pos.y - 40, colors.white1, 1)
	draw.DrawNonParsedText(wantedText, "DarkRPHUD2", pos.x + 1, pos.y - 41, colors.red, 1)
end

/*---------------------------------------------------------------------------
The Entity display: draw HUD information about entities
---------------------------------------------------------------------------*/
local function DrawEntityDisplay()

	local shootPos = localplayer:GetShootPos()
	local aimVec = localplayer:GetAimVector()

	for k, ply in pairs(players or player.GetAll()) do
		if ply == localplayer or not player:Alive() or player:GetNoDraw() then continue end
		local hisPos = player:GetShootPos()
		if player:getDarkRPVar("wanted") then player:drawWantedInfo() end

		if GAMEMODE.Config.globalshow then
			player:drawPlayerInfo()
		-- Draw when you're (almost) looking at him
		elseif hisPos:DistToSqr(shootPos) < 160000 then
			local pos = hisPos - shootPos
			local unitPos = pos:GetNormalized()
			if unitPos:Dot(aimVec) > 0.95 then
				local trace = util.QuickTrace(shootPos, pos, localplayer)
				if trace.Hit and trace.Entity ~= ply then return end
				player:drawPlayerInfo()
			end
		end
	end

	local tr = localplayer:GetEyeTrace()

	if IsValid(tr.Entity) and tr.Entity:isKeysOwnable() and tr.Entity:GetPos():DistToSqr(localplayer:GetPos()) < 40000 then
		tr.Entity:drawOwnableInfo()
	end
end

/*---------------------------------------------------------------------------
Drawing death notices
---------------------------------------------------------------------------*/
function GAMEMODE:DrawDeathNotice(x, y)
	if not GAMEMODE.Config.showdeaths then return end
	self.BaseClass:DrawDeathNotice(x, y)
end

/*---------------------------------------------------------------------------
Display notifications
---------------------------------------------------------------------------*/
local function DisplayNotify(msg)
	local txt = msg:ReadString()
	GAMEMODE:AddNotify(txt, msg:ReadShort(), msg:ReadLong())
	surface.PlaySound("buttons/lightswitch2.wav")

	-- Log to client console
	print(txt)
end
usermessage.Hook("_Notify", DisplayNotify)

/*---------------------------------------------------------------------------
Remove some elements from the HUD in favour of the DarkRP HUD
---------------------------------------------------------------------------*/
function GAMEMODE:HUDShouldDraw(name)
	if name == "CHudHealth" or
		name == "CHudBattery" or
		name == "CHudSuitPower" or
		(HelpToggled and name == "CHudChat") then
			return false
	else
		return true
	end
end

/*---------------------------------------------------------------------------
Disable players' names popping up when looking at them
---------------------------------------------------------------------------*/
function GAMEMODE:HUDDrawTargetID()
    return false
end

/*---------------------------------------------------------------------------
Actual HUDPaint hook
---------------------------------------------------------------------------*/
local hideHUDElements = {
	["DarkRP_HUD"]				= true,
	["DarkRP_EntityDisplay"] 	= true,
	["DarkRP_ZombieInfo"] 		= true,
	["DarkRP_LocalPlayerHUD"] 	= true,
	["DarkRP_Hungermod"] 		= true,
	["DarkRP_Agenda"] 			= true,
}

local function hideElements(name)

	if name == "CHudHealth" or name == "CHudBattery" or name == "CHudSuitPower" then
		return false
	end
	
	if hideHUDElements[name] then
		return false
	end
	
end
hook.Add("HUDShouldDraw", "hideElements", hideElements)


function DrawHUD()
		localplayer = localplayer and IsValid(localplayer) and localplayer or LocalPlayer()
		if not IsValid(localplayer) then return end
		-- Custom Shitnigs
		Base()
	--	HealthBar()
	--	ArmorBar()
		-- Defaults
		GunLicense()
		Agenda()
		DrawVoiceChat()
		LockDown()
		Arrested()
		AdminTell()
		DrawEntityDisplay()
end

hook.Add("HUDPaint","DrawHUD", DrawHUD)