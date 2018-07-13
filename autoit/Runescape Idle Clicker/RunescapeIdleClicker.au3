#include <MsgBoxConstants.au3>

ToolTip("Program Launched!",350,350, "Runescape Idle : Adventures Clicker.",1,2)


HotKeySet( "{F1}", "SetSkillLocation")
HotKeySet( "{F2}", "SetGridLocation")
HotKeySet( "{F3}", "SetAbilityLocation")

HotKeySet( "{F5}", "Activate")
HotKeySet( "{F6}", "deactivate")

HotKeySet( "{F8}", "EndProgram")
HotKeySet( "{F9}", "Test")
HotKeySet( "{F10}", "OverNight")

  Global $M1X = 0
  Global $M1Y = 0

  Global $M2X = 0
  Global $M2Y = 0

  Global $M3X = 0
  Global $M3Y = 0

  Global $activated = False

func SetSkillLocation()
   $M1X = MouseGetPos(0)
   $M1Y = MouseGetPos(1)
   ToolTip("X-Position: "& $M1X & " Y-Position: " & $M1Y,$M1X,$M1Y+40,"Skill Position Set!",1,2)
EndFunc

func SetGridLocation()
   $M2X = MouseGetPos(0)
   $M2Y = MouseGetPos(1)
   ToolTip("X-Position: "& $M2X & " Y-Position: " & $M2Y,$M2X,$M2Y+40,"Grid Position Set!",1,2)
EndFunc


func SetAbilityLocation()
   $M3X = MouseGetPos(0)
   $M3Y = MouseGetPos(1)
   ToolTip("X-Position: "& $M3X & " Y-Position: " & $M3Y,$M3X,$M3Y+40,"Ability Position Set!",1,2)
EndFunc

func EndProgram()
   while 1

	  Exit

   WEnd
EndFunc

func Test()

EndFunc

func OverNight()
     ToolTip("",0,0)
	  $activated = True
	  while 1
		 if $activated = True then
			if $M1X = 0 Then
			Else
			   MouseClick("primary",$M1X,$M1Y,2,0)
			   MouseClick("primary",$M2X,$M2Y,2,0)
			EndIf
		 EndIf
	  WEnd
EndFunc


func Deactivate()
   $activated = False
EndFunc

func Activate()
   ToolTip("",0,0)
   if $M1X = 0 Then
   Else
	  $activated = True
	  if $M3X = 0 Then
		 Else
			MouseClick("primary",$M3X,$M3Y,2,0)
			MouseClick("primary",$M3X,$M3Y + 80,2,0)
			MouseClick("primary",$M3X,$M3Y + 160,2,0)
			MouseClick("primary",$M3X,$M3Y + 240,2,0)
			MouseClick("primary",$M3X,$M3Y + 320,2,0)
	  EndIf
	  While 1
	  if $activated = true then
		 MouseClick("primary",$M1X,$M1Y,30,0)


		 MouseClick("primary",$M2X		,$M2Y,2,0)
		 MouseClick("primary",$M2X + 100,$M2Y,2,0)
		 MouseClick("primary",$M2X + 200,$M2Y,2,0)

		 MouseClick("primary",$M2X	 	,$M2Y + 75,2,0)
		 MouseClick("primary",$M2X + 100,$M2Y + 75,2,0)
		 MouseClick("primary",$M2X + 200,$M2Y + 75,2,0)

		 MouseClick("primary",$M2X	 	,$M2Y + 150,2,0)
		 MouseClick("primary",$M2X + 100,$M2Y + 150,2,0)
		 MouseClick("primary",$M2X + 200,$M2Y + 150,2,0)
	  EndIf
	  WEnd
   EndIf

EndFunc

while 1
WEnd