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
MacroID=ed204273-9592-4038-b6a1-69bda407749a
Description=調用E語言插件演示
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
//E語言插件模版位置：按鍵精靈目錄下 的 source\QMPlugin插件製作模版(易語言).zip
信息 = MsgBox("因打包【易語言DLL插件】文件容易被殺毒軟件誤報，所以請按【確定】進入論壇詳細查看使用例子及演示！！", 65, "信息提示：")
If 信息=1 Then
    RunApp "http://bbs.vrbrothers.com/viewthread.php?tid=190236"
End If 

