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
MacroID=207e549e-26ed-4db9-b76f-2d79559533d8
Description=輸出一個隨機數字
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
.
【功能說明】.
生成8位數的隨機數，並使用輸入到頁面的文本框.
.
【使用說明】.
打開寫字板，按下熱鍵，就可以輸出一個8位的數字.
.
【作者介紹】 按鍵專家團 無憂魔神(godeden ).
.
.

[Script]
//清空隨機種子數
Rem start
Randomize
//得到 1~99999999 之間的一個隨機數
x = Int((99999999 * Rnd) + 1)
//判斷這個數字是否8位數字，如果不是8位數字，就重新生成
If x<10000000 Then
    Goto start
End If 
SayString x
