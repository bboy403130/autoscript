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
MacroID=e6349269-db9b-400a-99d2-0f8976db6acf
Description=命令庫調用演示
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
//<>---------------------------------------------演示命令庫調用
Msgbox "命令庫加法測試：（100+100）= " & lib.測試.加法(100,100)
Call lib.測試.移動(100,100)
Call lib.測試.連接("我是","按鍵精靈8.0 新功能測試例子！")
Call lib.測試.彈出窗口()
//<>---------------------------------------------打開命令庫文件
MessageBox "下面打開命令庫【lib】文件夾裡【測試.qml】文件查看內容！"
If Plugin.File.IsFileExit(".\lib\測試.qml")=True Then
    Call RunApp("notepad.exe .\lib\測試.qml")
Else
    MsgBox "Sorry！做成小精靈測試不會打開「命令庫」文件查看內容哦。"
End If
