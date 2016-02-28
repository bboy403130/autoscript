[General]
SyntaxVersion=2
BeginHotkey=121
BeginHotkeyMod=0
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=123
StopHotkeyMod=0
RunOnce=1
EnableWindow=
MacroID=0e6e35bd-72bd-49e4-8661-19ef615e76ff
Description=祘㎝ㄧ计秸ノ簍ボ
Enable=0
AutoRun=0
[Repeat]
Type=0
Number=1
[SetupUI]
Type=2
QUI=
[Relative]
SetupOCXFile=
[Comment]

[Script]
//<>---------------------------------------------祘秸ノ
Call 炊硄祘()
Call 把计祘(100,50)
//<>---------------------------------------------ㄧ计秸ノ
Msgbox 把计ㄧ计(100,50) 
Sub 炊硄祘()
    Msgbox "и琌炊硄祘砆秸ノ"
End Sub
Sub 把计祘(a,b)
    c=a+b
    Msgbox "и琌把计祘砆秸ノ挡狦" & c
End Sub
Function 把计ㄧ计(a,b)
    c=a*b
    把计ㄧ计 = "и琌把计ㄧ计砆秸ノ挡狦" & c
End Function
