HotKeySet("{F4}", "ExitProg")
HotKeySet("{F6}", "Stop")

Func ExitProg()
    Exit 0 ;;Exits the program
EndFunc

    While True
      MouseClick("primary",2595,210,1,1);
	  Sleep(1500);
	  MouseClick("primary",2259,466,1,1);
	  Sleep(1500);
	  MouseClick("primary",2672,413,1,1);
	  Sleep(1500);
	  MouseClick("primary",2590,567,1,1);
    Wend

    Func Stop()
;;Stop the Function "Start"
    Endfunc

; x 2595 , y 210     Fight Button
; x 2259 , y 466     Avatar
; x 2672 , y 383     Wall
; x 2590 , y 547     Post Mob Code