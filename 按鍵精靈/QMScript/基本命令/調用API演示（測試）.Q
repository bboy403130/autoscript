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
MacroID=f04b0a7e-5137-4d2b-890c-73a7cce07956
Description=調用API演示（測試）
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

//<>-----------------------------------------------------------------------------<>
//<>------------------------------調用ＡＰＩ：------------------------------------<> 
//<>-----------------------------------------------------------------------------<>
//１：(支持3種調用方法)：
//Declare Function URLDownloadToFile Lib "urlmon" Alias "URLDownloadToFileA" (ByVal pCaller As Long, ByVal szURL As String, ByVal szFileName As String, ByVal dwReserved As Long, ByVal lpfnCB As Long) As Long
//Public Declare Function URLDownloadToFile Lib "urlmon" Alias "URLDownloadToFileA" (ByVal pCaller As Long, ByVal szURL As String, ByVal szFileName As String, ByVal dwReserved As Long, ByVal lpfnCB As Long) As Long
Private Declare Function URLDownloadToFile Lib "urlmon" Alias "URLDownloadToFileA" (ByVal pCaller As Long, ByVal szURL As String, ByVal szFileName As String, ByVal dwReserved As Long, ByVal lpfnCB As Long) As Long
//２：(支持3種調用方法)：
Declare Function GetForegroundWindow Lib "user32" () As Long
Private Declare Function GetWindowText Lib "user32" Alias "GetWindowTextA" (ByVal hwnd As Long, ByVal lpString As String, ByVal cch As Long) As Long
Public Declare Function GetNextWindow Lib "user32" Alias "GetWindow" (ByVal hwnd As Long, ByVal wFlag As Long) As Long


//<>-----------------------------------------------------------------------------<>
//<>------------------------------演示例子１：------------------------------------<>
//<>-----------------------------------------------------------------------------<>
MsgBox "演示例子1：下載文件"
//下載兄弟論壇Logo圖片例子：
判斷 = 下載文件("http://www.anjian.com/images/logo.gif", "c:\logo.gif")
If 判斷 = 0 Then
    If MsgBox("下載文件成功！是否打開查看圖像？",4,"提示：") = 6 Then
        //存放在C盤，下面會幫你打開查看
        RunApp "c:\logo.gif"
    End If
End If


//<>-----------------------------------------------------------------------------<>
//<>------------------------------演示例子２：------------------------------------<> 
//<>-----------------------------------------------------------------------------<>
//首先手動打開多個記事本：
MsgBox "演示例子2： 遍歷窗口句柄"& vbcrlf & vbcrlf &"首先請手動打開多個記事本，然後再按「確定」"
//遍歷符合標題窗口句柄例子：
MsgBox "找到的窗口，它是：" & 遍歷窗口句柄("記事本")


//<>-----------------------------------------------------------------------------<>
//<>------------------------------子程序歸類：------------------------------------<> 
//<>-----------------------------------------------------------------------------<>
EndScript
//１：
Function 下載文件(網頁地址, 保存文件路徑)
    下載文件 = URLDownloadToFile(0, 網頁地址, 保存文件路徑, 0, 0)
End Function
//２：
Function 遍歷窗口句柄(查找標題)
    Dim hwd,長度,句柄集合
    句柄集合=""
    '沒參數 也要加括號()
    hwd = GetForegroundWindow()
    '「標題」這個變量不能去定義，因為不能用普通定義變量的方法。
    標題 = Space(255)  
    GetWindowText hwd, 標題, 255
    Do While hwd <> 0 
        '只有2才表示找下一個窗口
        hwd = GetNextWindow(hwd, 2)
        長度 = GetWindowText(hwd, 標題, 255)
        If InStr(left(標題,長度), 查找標題) > 0 Then
            TracePrint 標題
            句柄集合=句柄集合 & hwd & "|"
        End If
    Loop    
    遍歷窗口句柄 = 句柄集合
End Function
