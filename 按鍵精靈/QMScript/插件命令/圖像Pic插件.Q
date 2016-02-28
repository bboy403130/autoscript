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
MacroID=af233f77-2a32-425e-a079-2a60b9310232
Description=圖像Pic插件
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
//下面這句在屏幕區域範圍內截圖保存到("C:\PIC.bmp")裡
Call Plugin.Pic.PrintScreen(0, 0, Plugin.Sys.GetScRX(), Plugin.Sys.GetScRY(), "C:\PIC.bmp")
MessageBox "屏幕截圖已經保存到(C:\PIC.bmp)裡"
Delay 1000
//下面這句在屏幕區域範圍內截圖保存到("C:\PIC.jpg")裡
Call Plugin.Pic.PrintScreen(0, 0, Plugin.Sys.GetScRX(), Plugin.Sys.GetScRY(), "C:\PIC.jpg")
MessageBox "屏幕截圖已經壓縮保存到(C:\PIC.jpg)裡，演示結束"