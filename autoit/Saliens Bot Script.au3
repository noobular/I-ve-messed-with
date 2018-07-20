HotKeySet("{F1}", "StartScript")
HotKeySet("{F2}", "StopScript")
HotKeySet("{F3}", "PauseScript")
Global $Paused

While 1
WEnd




Func StartScript()
	While 1
		ToolTip('Script is active...',0,0)

		;;Color Variation 1
		$pixel = PixelSearch(0,0,1920,1080,0x346EA9,1)
		if IsArray($pixel) = True Then
			MouseMove($pixel[0], $pixel[1],0)
			;MouseClick("primary",$pixel[0], $pixel[1],10,0)
		EndIf
		;;Color Variation 2
		$pixel = PixelSearch(0,0,1920,1080,0x1275C2,1)
		if IsArray($pixel) = True Then
			MouseMove($pixel[0], $pixel[1],0)
			;MouseClick("primary",$pixel[0], $pixel[1],10,0)
		EndIf
		;;Color Variation 3
		$pixel = PixelSearch(0,0,1920,1080,0x2F7DC4,1)
		if IsArray($pixel) = True Then
			MouseMove($pixel[0], $pixel[1],0)
			;MouseClick("primary",$pixel[0], $pixel[1],10,0)
		EndIf
	WEnd
EndFunc

Func StopScript()
	Exit
EndFunc

Func PauseScript()
	$Paused = NOT $Paused
	While $Paused
		sleep(100)
		ToolTip('Script is paused..',0,0)
	WEnd
EndFunc