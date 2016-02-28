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
MacroID=801fe712-e944-4e35-be44-bca33ac84911
Description=硬件或超級模擬鍵盤鼠標
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
【功能說明】
測試硬件模擬和超級模擬命令。

[Script]
MessageBox "這個例子會演示 普通/硬件/超級 這三種模擬方式的效果，點擊確定後3秒鐘開始模擬，會用普通模擬按3下a，硬件模擬按3下b，超級模擬按3下c"
Delay 3000
SetSimMode 0
KeyPress 65,3
MoveTo 0,0
Delay 1000
SetSimMode 1
KeyPress 66,3
MoveTo 100,100
Delay 1000
SetSimMode 2
KeyPress 67,3
MoveTo 200,200
MessageBox "演示結束"
