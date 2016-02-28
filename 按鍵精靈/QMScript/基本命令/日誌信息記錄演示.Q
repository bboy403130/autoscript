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
MacroID=256abed0-03da-4187-9507-61366c49b042
Description=日誌信息記錄演示
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
//<>---------------------------------開始記錄日誌
LogStart "C:\a.log"
For i = 0 To 3
    //<>---------------------------------以下「TracePrint」輸出信息內容將被記錄為日誌
    TracePrint "屏幕內容填寫" & i
    Call Plugin.Msg.ShowScrTXT(0, 0, 600, 300, "屏幕內容填寫" & i, "0000FF")
Next
//<>---------------------------------記錄日誌停止
LogStop 
//<>---------------------------------日誌停止了，下一句「TracePrint」輸出信息不會被記錄
TracePrint "這句不會輸出！"
If MsgBox("日誌記錄完成！是否打開查看內容？",4,"提示：") = 6 Then
    //存放在C盤，下面會幫你打開查看
    RunApp "notepad.exe C:\a.log"
End If

