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
MacroID=57956eb5-7b84-4bd1-bf20-adcf0abb22ae
Description=中文名變量演示
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
//<>---------------------------------------------用戶自定義變量 支持中文名為變量名
UserVar 啟動=DropList{"打開":1|"關閉":0}=0 "補血啟動開關"
UserVar 補血=0 "補血百分比%"
//<>---------------------------------------------定義變量 支持中文名為變量名
Dim 提示
提示="補血啟動開關未設置打開！"
If 啟動=1 Then 
    Msgbox "補血百分比為："& 補血 & "%"
Else 
    Msgbox 提示
End If
