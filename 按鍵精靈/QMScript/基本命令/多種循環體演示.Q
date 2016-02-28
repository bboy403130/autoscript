[General]
SyntaxVersion=2
BeginHotkey=49
BeginHotkeyMod=2
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=123
StopHotkeyMod=0
RunOnce=1
EnableWindow=
MacroID=daf2ab41-4a2e-4c1a-bc0b-86336ab0d07b
Description=多種循環體演示
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
//<>---------------------------------------------普通循環
i=0
For 3
    Msgbox "普通循環演示：【" & i & "】"
    i=i+1
Next
//<>---------------------------------------------新語法循環
For i=0 To 3
    Msgbox "新語法To循環演示：【" & i & "】"
Next
//<>---------------------------------------------新語法循環
For i=0 To 10 Step 2
    Msgbox "新語法步進Step循環演示：【" & i & "】"
    If i>7 Then
        Msgbox "達到條件大於7時，離開循環體！"
        Exit For 
    End If 
Next
//<>---------------------------------------------新語法循環
i=0
Do While True
    Msgbox "新語法Do循環演示：【" & i & "】"
    If i>7 Then
        Msgbox "達到條件大於7時，離開循環體！"
        Exit Do
    End If 
    i=i+1
Loop
