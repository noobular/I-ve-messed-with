;; Created by :
;;      Noobular
;; Last Update:
;;      9/17/2017
;; Additional Info
;;      TamperMonkey Script required to download the IDs
;;      Place on Right monitor (1366x768px)

#include <File.au3>

$file = "C:\Users\Noobular\Downloads\DTMIDList.txt";
If FileExists($file) == 1 Then
FileOpen($file, 0)
For $i = 1 to _FileCountLines($file)
    $line = FileReadLine($file, $i)
Next
$array = StringSplit($line,",");
FileClose($file)

MsgBox(0,"Set Mouse Position", "Hover over the x spot for names and press enter")
$x = MouseGetPos(0);
$y = MouseGetPos(1);

ConsoleWrite($x & "   ;   " & $y);
for $i=1 to $array[0]
MouseClick("primary",$x-70,$y,1,1);
Sleep(100);
Send($array[$i]);
Sleep(500);
MouseClick("Primary",$x+70,$y,1,1);
Sleep(500);
MouseClick("Primary",$x,$y,4,1);
Sleep(100);
Next

FileDelete($file);
Else
   MsgBox(0,"File Doesn't Exist!", $file & " path doesn't exist!" &@LF&@LF& "Download an ID List file or make your own!")
EndIf


