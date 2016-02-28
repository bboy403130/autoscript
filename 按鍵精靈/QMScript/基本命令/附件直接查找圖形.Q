[General]
SyntaxVersion=2
BeginHotkey=122
BeginHotkeyMod=0
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=123
StopHotkeyMod=0
RunOnce=0
EnableWindow=
MacroID=9876d6ab-8008-45cf-a7b4-63dae9a097c2
Description=附件直接查找圖形
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
在屏幕上查找Windows自帶的掃雷程序裡的笑臉圖形
.

[Attachment]
UEsDBBQAAgAIAGx3jzqSd2hfcwAAAG4EAAALABEAd2lubWluZS5ibXBVVA0AB2r25Ulq9+VJavblSXPyzWNhAAMzINYAYhEgFgJiRgYJsLgFVB4ZHCAXNDQ0YBUnxnxMvVDV//+jIGwmoOnFogvVBFx6CWjE0A7Xi64RDWDTjl0vVv/i0EtAIw7tWPQSgwahXrSwxRHUOMMZL5dA/BKRPKiSrihMzxTmI1LzLwBQSwECFwsUAAIACABsd486kndoX3MAAABuBAAACwAJAAAAAAAAACAAgIEAAAAAd2lubWluZS5ibXBVVAUAB2r25UlQSwUGAAAAAAEAAQBCAAAArQAAAAAA


[Script]
MessageBox "這個例子會啟動一個Windows自帶的掃雷程序，然後查找掃雷程序裡的笑臉圖形"
Call RunApp("winmine.exe")
//加入一點延時，讓掃雷程序順利啟動
Delay 2000
Call FindPic(0,50,1023,767,"winmine.bmp",0.9,intX,intY)
If intX>0 and intY>0 then
    MoveTo intX,intY
    MessageBox "找到圖形，鼠標已經移到圖形上面"
Else 
    MessageBox "沒找到！請確認掃雷程序已經打開，並且您用的是WinXP系統"
End If 
MessageBox "下面把鼠標先移到0，0點，再用附件找圖的方式繼續查找笑臉"
Call FindPic(0,50,1023,767,"Attachment:\winmine.bmp",0.9,intX,intY)
If intX>0 and intY>0 then
    MoveTo intX,intY
    MessageBox "找到圖形，鼠標已經移到圖形上面"
Else 
    MessageBox "沒找到！請確認掃雷程序已經打開，並且您用的是WinXP系統"
End If
MessageBox "腳本演示結束，最好的腳本永遠是您自己製作的。 :-)"
EndScript 
