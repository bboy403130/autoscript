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
MacroID=f1b0229c-b5e6-4576-8ce7-59e06313f7f3
Description=網絡Net插件
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
//測試OK
Rem 撥號
//下面這句是撥號遠程網絡連接(網絡連接名字)[失敗返回<False>,成功返回<True>]
OnLine = Plugin.Net.DialUp("ADSL連接測試")
If OnLine = False Then
    Goto 撥號
End If 
Delay 1000
//下面這句是斷開遠程網絡連接
Call Plugin.Net.HangUp()
//下面這句是判斷連接是否在線[斷線返回<False>,否則返回<True>]
OnLine = Plugin.Net.IsOnline()
If OnLine = False Then
    Goto 撥號
End If 
