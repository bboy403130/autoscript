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
MacroID=0840e189-a2d4-47b9-8a03-6dff97a3048e
Description=下拉型用戶自定義變量
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
//說明：{}當中是下拉的選項 =0是指的默認顯示哪個選項(從0開始)
UserVar Var1=DropList{"低於10%時補血":"0.1"|"低於20%時補血":"0.2"|"低於30%時補血":"0.3"}=2 "自動補血設置"
UserVar Var2=0 "普通自定義變量"
MessageBox(Var1)
MessageBox(Var2)
