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
MacroID=b428d4d1-61ed-40fd-8eda-5eea7783d418
Description=選擇條件結構演示
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
UserVar 變量=0 "輸入（0~9）數字"
//<>---------------------------------------------以下是選擇條件結結構判斷
Select Case 變量
Case 0
    Msgbox "你輸入的數字為：0" 
Case 1
    Msgbox "你輸入的數字為：1" 
Case 2
    Msgbox "你輸入的數字為：2" 
Case 3
    Msgbox "你輸入的數字為：3" 
Case 4
    Msgbox "你輸入的數字為：4" 
Case 5
    Msgbox "你輸入的數字為：5" 
Case 6
    Msgbox "你輸入的數字為：6" 
Case 7
    Msgbox "你輸入的數字為：7" 
Case 8
    Msgbox "你輸入的數字為：8" 
Case 9
    Msgbox "你輸入的數字為：9" 
Case Else
    Msgbox "你輸入的數字不正確，請輸入（0~9）數字！"
End Select
