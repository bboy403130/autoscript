[General]
SyntaxVersion=2
BeginHotkey=121
BeginHotkeyMod=0
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=123
StopHotkeyMod=0
RunOnce=0
EnableWindow=
MacroID=c6ae48df-4a95-413b-8e2c-a92755e9b45d
Description=OnScriptExit子程序
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
【功能說明】.
這個腳本主要演示了OnScriptExit子程序的功能。.
.
在腳本中寫一個名字叫OnScriptExit的子程序，在腳本結束的時候（無論是腳本正常運行結束，還是按下了中止熱鍵結束），腳本會自動調用這個子程序。.
.
比如在這個腳本中，腳本啟動時保存一下鼠標的位置，腳本功能是鼠標一直在屏幕上畫正弦曲線，一旦按下中止熱鍵，腳本在結束前會自動調用OnScriptExit子程序，彈出一個對話框，並且把鼠標恢復到最初保存的位置。.
.
【作者介紹】.
vrBrothers.CR.
07.11.9

[Script]
SaveMousePos 
While 1
    x = 0
    While x < 1024
        y = 300 - sin(x/30) * 100
        MoveTo x,y
        x = x + 1
        Delay 3
    Wend
Wend
Sub OnScriptExit()
    MessageBox "腳本已經停止！"
    RestoreMousePos 
End Sub

