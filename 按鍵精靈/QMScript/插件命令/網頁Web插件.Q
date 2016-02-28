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
MacroID=6fbe8f6c-258e-49e7-96de-c435e4407959
Description=網頁Web插件
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
//下面這句是刪除IE臨時文件
Call Plugin.Web.ClearTemp()
//下面這句是清除IE歷史記錄
Call Plugin.Web.ClearHistory()
//下面這句是刪除IE的Cookie
Call Plugin.Web.ClearCookie()
