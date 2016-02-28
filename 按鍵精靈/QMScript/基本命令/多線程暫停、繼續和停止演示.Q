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
MacroID=9935b5cb-a294-431f-b9b6-1a4713c6d160
Description=多線程暫停、繼續和停止演示
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
MessageBox "多線程命令還在測試當中，並不穩定，請謹慎使用！不推薦新手使用。"
線程ID=BeginThread(測試) 
Delay 3000
//<>-----------------------------------------啟動「測試」線程的運行，並返回線程ID編號

MsgBox "線程暫停運行！3秒", 64, "演示："
PauseThread 線程ID
Delay 3000
//<>-----------------------------------------等待3秒後暫停「測試」線程的運行

MsgBox "線程繼續運行！3秒", 64, "演示："
ContinueThread 線程ID
Delay 3000
//<>-----------------------------------------等待3秒後繼續「測試」線程的運行

MsgBox "線程停止運行！", 64, "演示："
StopThread 線程ID
//<>-----------------------------------------3秒後停止「測試」線程的運行

ExitScript 
//<>-----------------------------------------停止並退出腳本運行
Sub 測試()
    i=0
    Do 
        Call Plugin.Msg.ShowScrTXT(0, 0, 600, 100, "線程1屏幕內容填寫" & i, "0000FF")
        TracePrint  "屏幕內容填寫" & i
        Call Plugin.Msg.Tips("我是氣泡！線程1屏幕內容填寫" & i)
        Delay 1000
        i=i+1
    Loop 
End Sub

