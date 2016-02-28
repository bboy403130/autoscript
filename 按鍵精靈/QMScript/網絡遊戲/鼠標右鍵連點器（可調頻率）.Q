[General]
SyntaxVersion=2
BeginHotkey=121
BeginHotkeyMod=0
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=32771
StopHotkeyMod=0
RunOnce=0
EnableWindow=
MacroID=e42bfd00-f002-4b37-8e29-28ad5396949f
Description=鼠標右鍵連點器（可調頻率）
Enable=0
AutoRun=0
[Repeat]
Type=1
Number=3954080
[SetupUI]
Type=2
QUI=
[Relative]
SetupOCXFile=
[Comment]
===通用腳本===.
【功能說明】.
按下熱鍵即可反覆點擊鼠標右鍵，可調整點擊頻率.
.
【使用說明】.
按下熱鍵即可反覆點擊鼠標右鍵，按中止鍵停止運行。.
.
【作者介紹】.
vrBrothers.Leo.
.
【製作日期】.
05年09月04日

[Script]
//說明：按照一定頻率反覆點擊鼠標右鍵
//1秒 = 1000毫秒
UserVar Yanshi=200 "兩次點擊的時間間隔（毫秒）"
RightClick 1
Delay Yanshi
