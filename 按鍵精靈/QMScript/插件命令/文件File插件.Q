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
MacroID=f3b9222e-8959-4701-8fe2-14959854a150
Description=文件File插件
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
// 測試OK
//下面這句是保存一個配置文件參數(小節名："Command" 鍵值名："Val" 寫入內容："內容")
Call Plugin.File.WriteINI("Command", "Val", "內容", "C:\Config.ini")
MessageBox "保存一個配置文件鍵值"
//下面這句是讀取一個配置文件參數(小節名："Command" 鍵值名："Val")得到內容(Text )
Text = Plugin.File.ReadINI("Command", "Val", "C:\Config.ini")
MessageBox "得到一個配置文件鍵值為：" & Text
//=================================================================================
//下面這句是複製目標文件("C:\Config.ini")到其他目錄裡("D:\")
Call Plugin.File.CopyFile("C:\Config.ini", "D:\Config.ini")
MessageBox "複製目標文件"
//下面這句是判斷一個文件是否存在返回(IsFile)
IsFile = Plugin.File.IsFileExit("C:\Config.ini")
If IsFile = True Then
    MessageBox "目標文件存在"
Else 
    MessageBox "目標文件不存在"
End If 
//下面這句是刪除目標文件
Call Plugin.File.DeleteFile("C:\Config.ini")
MessageBox "刪除目標文件"
//=================================================================================
//下面這句是移動目標文件("D:\Config.ini")到其他目錄裡("C:\")
Call Plugin.File.MoveFile("D:\Config.ini", "C:\Config.ini")
MessageBox "移動目標文件"
//下面這句是創建一個文件夾
Call Plugin.File.CreateFolder("C:\Plugin")
MessageBox "創建一個文件夾"
//下面這句是刪除目標文件夾
Call Plugin.File.DeleteFolder("C:\Plugin")
MessageBox "刪除目標文件夾"
//下面這句是重命名文件或者文件夾("C:\Config.ini")，改名為("C:\Config.txt")
Call Plugin.File.ReNameFile("C:\Config.ini", "C:\Config.txt")
MessageBox "重命名文件"
//=================================================================================
//下面這句是設置修改文件日期時間
Call Plugin.File.SetDate("C:\Config.txt", "2009-2-19 10:10:10")
MessageBox "設置修改文件日期時間為：" & "2009-2-19 10:10:10"
//下面這句是設置文件屬性讀寫狀態(只讀)
Call Plugin.File.SetAttrib("C:\Config.txt", 1)
MessageBox "設置文件屬性讀寫狀態(只讀)"
//下面這句是設置文件屬性讀寫狀態(取消只讀)
Call Plugin.File.SetAttrib("C:\Config.txt", 0)
MessageBox "設置文件屬性讀寫狀態(取消只讀)"
//=================================================================================
//下面這句是向目標文件("C:\Config.txt")寫入文本內容("內容")
Call Plugin.File.WriteFileEx("C:\Config.txt", "內容")
MessageBox "向目標文件寫入文本內容"
//下面這句是向目標文件("C:\Config.txt")讀出文本內容到變量(Text)
Text = Plugin.File.ReadFileEx("C:\Config.txt")
MessageBox "向目標文件讀出文本內容為：" & Text
//下面這句是得到文件大小長度
Length = Plugin.File.GetFileLength("C:\Config.txt")
MessageBox "得到文件大小長度為：" & Length
//=================================================================================
//下面這句是刪除目標文件
Call Plugin.File.DeleteFile("C:\Config.txt")
MessageBox "刪除目標文件"
