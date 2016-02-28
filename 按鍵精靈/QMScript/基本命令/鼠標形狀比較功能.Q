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
MacroID=7dd48867-08f3-4f38-a581-dc780c03a875
Description=鼠標形狀比較功能
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
演示鼠標形狀比較功能，在網絡遊戲中，可以移動鼠標，並且根據鼠標形狀的變化實現打怪功能.
.
【使用說明】.
請使用 抓點抓色 功能首先抓取鼠標的形狀，然後在腳本中進行比較.
.
【作者介紹】.
vrBrothers.Leo.
06.11.7

[Script]
//下面是我們普通的WINDOWS鼠標形狀特徵
//不同電腦上鼠標形狀特徵也許不同，請使用"抓點抓色"功能抓取正確的鼠標形狀特徵
Shape1 = 1593350287
//下面是我們訪問網頁超鏈接時候的手型鼠標形狀
Shape2 = 1055991329
Shape=GetCursorShape(0)
If shape = shape1 then
    MessageBox "當前鼠標形狀是普通的WINDOWS鼠標"
ElseIf shape = shape2 then
    MessageBox "當前鼠標形狀是手型鼠標"
Else 
    MessageBox "不認識當前鼠標形狀！"
End If 
