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
MacroID=03b2f85a-36b4-411e-8578-841d335571c9
Description=北Console础ン
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
// 代刚OK
//硂琌ゴ秨北怠
Call Plugin.Console.Open()
//硂琌北糶︽才﹃
Call Plugin.Console.WriteLine("叫繦種块碭礛ó")
//硂琌眖北弄︽才﹃
ReadLine = Plugin.Console.ReadLine()
//硂琌北糶︽才﹃
Call Plugin.Console.WriteLine("眤块琌" & ReadLine & vbcrlf)
Call Plugin.Console.WriteLine("簍ボ竲セ挡叫Y龄癶北" & vbcrlf)
Rem WaitUserInputKey
//硂琌单ノめ北龄
userInput = Plugin.Console.WaitKey()
If userInput = asc("y") or userInput = asc("Y") Then
    Call Plugin.Console.Close()
Else 
    Goto WaitUserInputKey
End If 
//硂琌闽超北怠
Call Plugin.Console.Close()
