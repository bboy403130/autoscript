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
MacroID=185ae05e-aca2-4d22-8a50-d917531d5f71
Description=退出腳本運行演示
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
BeginThread 多線程
For 3 
    Delay 1000
Next 
ExitScript 
//強制中止腳本並退出執行，在這個語句之後的所有命令都不會執行
Sub 多線程()
    i=0
    Do 
        Call Plugin.Msg.ShowScrTXT(0, 0, 600, 300, "屏幕內容填寫" & i, "0000FF") 
        Delay 1000
        i=i+1
    Loop 
End Sub
