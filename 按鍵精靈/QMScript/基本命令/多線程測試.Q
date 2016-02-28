[General]
SyntaxVersion=2
BeginHotkey=122
BeginHotkeyMod=0
PauseHotkey=120
PauseHotkeyMod=0
StopHotkey=123
StopHotkeyMod=0
RunOnce=1
EnableWindow=
MacroID=f2099881-eb0e-41d5-88af-5b027ad87114
Description=多線程測試(升級版)
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
MessageBox "多線程命令還在測試當中，並不穩定，請謹慎使用！" & vbcrlf & vbcrlf & "目前演示例子：多線程、多開並後台同時輸入文字。"
//下面這個例子會打開一個記事本，用3個線程3個記事本同時向其中模擬按鍵


//所謂多線程並不是同時做一件相同的事情，而是不分前後順序執行腳本。
Dimenv Hwnd1          //定義環境變量（多線程需要）
RunApp "notepad.exe"  //啟動幾個記事本測試用
RunApp "notepad.exe"
RunApp "notepad.exe"
Call Plugin.Msg.ShowScrTXT(400, 100, 1024, 600, "請耐心等待「記事本」打開。。。", "0000FF")
Do
    Delay 300                                     //等待記事本工具打開
    Hwnd = Plugin.Window.Search("未命名 - 記事本") //搜索所有記事本窗口句柄
    MyArray = Split(Hwnd, "|")                     //分解句柄
    If UBound(MyArray) >= 0 Then                   //判斷是否搜到句柄？
        For i = 0 To UBound(MyArray) - 1 
            hwndEx = Clng(MyArray(i))                                     //類型轉換
            Call Plugin.Window.Move(hwndEx, i * 100 + 100, i * 100 + 50)  //調整窗口位置
            Call Plugin.Window.Active(hwndEx)                             //激活前面
            Hwnd1 = Plugin.Window.FindEx(hwndEx, 0, "Edit", 0)            //獲取可打字的窗口句柄
            BeginThread 打字                                              //啟動線程
            Delay 100                                                     //啟動線程需要點時間
        Next
        Exit Do
    End If
Loop
Call Plugin.Msg.ShowScrTXT(400, 100, 1024, 600, "多個記事本中，在後台同時輸入10個數字。。。", "0000FF")
//無限循環，不至於讓腳本停止了！
Do
    Delay 500
Loop
Sub 打字()
    Hwnd2=Hwnd1      //首先獲取環境變量句柄
    //然後開始循環或者無限循環需要執行的腳本內容
    For i=0 to 9
        Call Plugin.Bkgnd.SendString(Hwnd2, i)
        Delay 100
        Call Plugin.Bkgnd.KeyPress(Hwnd2, 13)
        Delay 200
    Next
    ExitScript
End Sub
Sub OnScriptExit()
    MessageBox "腳本已經停止！"
End Sub

