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
MacroID=ee22e37e-e500-4614-8b0f-0365d863f6a9
Description=辦公文檔Office插件
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
//測試OK
//在您的電腦上需要安裝有Office辦公軟件,否則使用不了
//下面這句是打開Excel文檔工作表
Call Plugin.Office.OpenXls("C:\測試.xls")
//下面這句是向Excel文檔工作表(1)單元格(1, 1)寫入("內容")內容
Call Plugin.Office.WriteXls(1, 1, 1, "內容")
MessageBox "寫入單元格的內容是：""內容"""
//=================================================================================
//下面這句是向Excel文檔工作表(1)單元格(1, 1)讀出內容存入(Text)變量
Text = Plugin.Office.ReadXls(1, 1, 1)
//下面這句是關閉Excel文檔工作表
Call Plugin.Office.CloseXls()
MessageBox "讀取到的單元格內容是：" & Text
//=================================================================================
//下面這句是刪除目標文件
MessageBox "可以打開(C:\測試.xls)文件查看是否成功寫入內容"
