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
MacroID=32af1d79-6ba9-40e6-bd31-1c536cc2df2f
Description=鼠標左鍵連點器（可調頻率）
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
按下熱鍵即可反覆點擊鼠標左鍵，可調整點擊頻率.
.
【使用說明】.
按下熱鍵即可反覆點擊鼠標左鍵，按中止鍵停止運行。.
注意：默認中止熱鍵是雙擊鼠標熱鍵，一般情況下需要多次連擊鼠標左鍵才會停止。也是演示如何使用鼠標熱鍵。.
.
【作者介紹】.
vrBrothers.Leo.
.
【製作日期】.
06年09月04日.
.

[Script]
//說明：按照一定頻率反覆點擊鼠標左鍵
//1秒 = 1000毫秒
UserVar Yanshi=200 "兩次點擊的時間間隔（毫秒）"
LeftClick 1
Delay Yanshi
