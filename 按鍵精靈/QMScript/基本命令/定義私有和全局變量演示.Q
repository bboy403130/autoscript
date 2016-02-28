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
MacroID=b2790885-7924-41c5-9b04-2f967b877af0
Description=定義私有和全局變量演示
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
Boss = "我是老闆"
//<>---------------------------------------------調用私有變量子程序
Call 演示用子程序()
//<>---------------------------------------------下面測試私有變量是否能讀取到
Msgbox "在全局下查看是否可以讀到私有變量：值 =【" & Point & "】" & vbCrlf & vbCrlf & "為空的話，說明該變量為私有！"
Sub 演示用子程序()
    //<>-----------------------------------------在過程裡定義的變量為私有變量，不定義的為全局變量
    Dim Point
    Point="我是掃地的"
    Msgbox "我是私有變量：值 = 【" & Point & "】" & vbCrlf & vbCrlf & "我是全局變量：值 = 【" & Boss & "】"
End Sub
EndScript 
//<>---------------------------------------------下面是測試例子【2】
i=10
Call test()
Msgbox "這是全局的" & i
EndScript
Sub Test()
    Dim i
    i = 3
    Msgbox "這是局部的 " & i
End Sub
