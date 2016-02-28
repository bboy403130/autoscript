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
MacroID=79ee1a60-6e7e-410a-93a6-5d1bcf30be4e
Description=自動備份功能說明
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
在主界面點擊[設置]按鈕可以設置自動備份的方法.
自動備份會在每次編輯腳本和保存腳本時將腳本自動備份.
避免停電等意外故障導致的腳本丟失.
.
.

[Script]
Call 功能介紹()
Call 如何使用備份文件()
EndScript 
Sub 功能介紹()
    Txt="大家好,我是按鍵精靈,今天我要給大家介紹一下如何使用按鍵精靈提供的自動備份功能"&vbcrlf
    Txt=Txt& "在主界面點擊[設置]按鈕可以設置自動備份的方法。"&vbcrlf
    Txt=Txt& "1、提供這個功能可以更好的為你腳本做備份,避免停電等意外故障導致的腳本丟失！！"&vbcrlf
    Txt=Txt& "2、備份功能使用情況："&vbcrlf
    Txt=Txt& "a、會在保存腳本時自動備份一次。"&vbcrlf
    Txt=Txt& "b、會在修改腳本時自動備份一次。"&vbcrlf
    Txt=Txt& "c、備份出來的文件名按順序序號排列保存在[自動備份]目錄裡，提供了十次備份記錄！！"&vbcrlf
    Txt=Txt& "d、在自動備份目錄下點鼠標右鍵，選擇刷新列表，即可看到最近備份的文件"&vbcrlf
    Txt=Txt& "訪問按鍵精靈官網提供的知識庫，學習自動備份功能的設置技巧。"
    MessageBox Txt
End Sub
Sub 如何使用備份文件()
    MessageBox "保存的備份文件後綴名默認為.bak。在使用備份文件時，只要將備份文件的後綴名改為.Q就可以使用了"
    Call RunApp(Plugin.Sys.GetDir(0) & "\QMScript\自動備份")
    MessageBox "介紹結束，大家可以自己動手體驗一下~"
End Sub
