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
MacroID=4efcf531-f14d-4ae8-a9ef-1352253ab502
Description=自動刷網頁
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
.
【功能說明】.
自動按F5刷新網頁，可設置刷新的時間頻率，默認是2秒.
.
【使用說明】.
請先打開網頁瀏覽器，訪問你需要刷新的網址。然後按下熱鍵，即可自動刷新。.
注意：刷新的時候請保證瀏覽器在前台，如果切換到後台就無法刷新了。能刷新後台網頁的版本還在製作當中，歡迎大家關注。.
.
【作者介紹】.
vrBrothers.Leo.
2006.9.
.
.

[Script]
UserVar YanShi=5000 "請輸入刷新網頁的時間間隔，默認是5000毫秒，也就是5秒"
KeyPress 116,1
Delay YanShi
