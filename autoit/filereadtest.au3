#include <File.au3>

$file = "C:\Users\Noobular\Downloads\test.txt"
FileOpen($file, 0)
For $i = 1 to _FileCountLines($file)
    $line = FileReadLine($file, $i)

msgbox(0,'','the line ' & $i & ' is ' & $line)
Next
$array = StringSplit($line,",");
FileClose($file)

for $i=1 to $array[0]
MouseClick("primary",2549,730,1,1);
Send($array[$i]);
Sleep(500);
MouseClick("Primary",2700,730,1,1);
Sleep(500);
MouseClick("Primary",2627,730,4,1);
Sleep(100);
Next

FileDelete(%file);