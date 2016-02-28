[General]
SyntaxVersion=2
MacroID=703c757b-2ea1-46a1-8191-3111913e3930
[Comment]
命令庫是按鍵精靈8.0版推出的全新功能
您可以把自己常用的函數和子程序寫在命令庫裡讓很多個腳本去調用
命令庫最大的優勢是讓多個腳本共享一個命令，修改一處就等於修改多處
目前命令庫功能還在測試當中，有任何建議可以在按鍵精靈論壇提出，網址：http://bbs.ajjl.cn

******注意！這是官方提供的命令庫，請勿修改！避免以後按鍵精靈升級時覆蓋您的修改。******//
******          如需新增命令庫，可在命令庫點擊右鍵選擇「新建」命令庫            ******//



[Script]
//API調用（測試）是一個很強大的功能，可以方便的使用系統自帶的API增強腳本功能。
//但同時API調用又是一個很難用的功能，只有熟悉API的作者（一般是程序員），才能有能力用好。
//因此，按鍵精靈對API調用功能的使用態度應該是：
//1、鼓勵將API調用功能包裝為庫命令，發佈給大家使用。
//2、反對任何利用API調用功能開發寫內存、修改數據封包、修改遊戲客戶端數據等可能侵犯第三方知識產權的功能。
//3、對於一些特殊的API，暫時無法支持的，可以用插件機制來彌補API的不足。

Private Declare Function FindWindow Lib "user32" Alias "FindWindowA" (ByVal lpClassName As String, ByVal lpWindowName As String) As Long
Private Declare Function SetForegroundWindow Lib "user32" (ByVal hwnd As Long) As Long
Private Declare Function GetWindowLong Lib "user32" Alias "GetWindowLongA" (ByVal hwnd As Long, ByVal nIndex As Long) As Long
Private Declare Function SetWindowLong Lib "user32" Alias "SetWindowLongA" (ByVal hwnd As Long, ByVal nIndex As Long, ByVal dwNewLong As Long) As Long
Private Declare Function SetLayeredWindowAttributes Lib "user32" (ByVal hwnd As Long, ByVal crKey As Long, ByVal bAlpha As Byte, ByVal dwFlags As Long) As Long
Private Declare Function GetDesktopWindow Lib "user32" () As Long
Private Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal Hwnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long
Private Declare Function ShowWindow Lib "user32.dll" (ByVal hwnd As Long, ByVal nCmdShow As Long) As Long

Function 查找窗口句柄(窗口類名,窗口標題)
    //例子：MsgBox lib.API.查找窗口句柄("notepad",0)
    Dim sClass, sTitle
    If Cstr(窗口類名) = "0" Then
        查找窗口句柄 = FindWindow(vbNullString, Cstr(窗口標題))
    ElseIf Cstr(窗口標題) = "0" Then
        查找窗口句柄 = FindWindow(Cstr(窗口類名), vbNullString)
    Else
        查找窗口句柄 = FindWindow(Cstr(窗口類名), Cstr(窗口標題))
    End If
End Function
Sub 激活窗口並置前(窗口句柄)
    //窗口句柄 = lib.API.查找窗口句柄("notepad",0)
    //例子：Call lib.API.激活窗口並置前(窗口句柄)
    Dim SW_SHOWNORMAL
    SW_SHOWNORMAL = 1
    If 窗口句柄 <> 0 Then 
        Call ShowWindow(窗口句柄, SW_SHOWNORMAL)
        Call SetForegroundWindow(窗口句柄)
    End If
End Sub
Sub 設置窗口透明度(窗口句柄, 透明度)
    //透明度：0~255
    //窗口句柄 = lib.API.查找窗口句柄("notepad",0)
    //例子：Call lib.API.設置窗口透明度(窗口句柄,100)
    Dim GWL_EXSTYLE, LWA_ALPHA, WS_EX_LAYERED 
    GWL_EXSTYLE = (-20)
    LWA_ALPHA = &H2
    WS_EX_LAYERED = &H80000
    Dim Rt
    If 窗口句柄 <> 0 And 透明度>=0 And 透明度<=255 Then
        Rt = GetWindowLong(窗口句柄, GWL_EXSTYLE)
        Rt = Rt Or WS_EX_LAYERED
        Call SetWindowLong(窗口句柄, GWL_EXSTYLE, Rt)
        Call SetLayeredWindowAttributes(窗口句柄, 0, 透明度, LWA_ALPHA)
    End If
End Sub
Sub 設置窗口鼠標穿透(窗口句柄)
    //窗口句柄 = lib.API.查找窗口句柄("notepad",0)
    //例子：Call lib.API.設置窗口鼠標穿透(窗口句柄)
    Dim GWL_EXSTYLE, WS_EX_TRANSPARENT, WS_EX_LAYERED 
    GWL_EXSTYLE = (-20)
    WS_EX_TRANSPARENT = &H20
    WS_EX_LAYERED = &H80000
    Dim rtn
    If 窗口句柄 <> 0 Then
        rtn = GetWindowLong(窗口句柄, GWL_EXSTYLE)
        rtn = rtn Or WS_EX_LAYERED Or WS_EX_TRANSPARENT
        SetWindowLong 窗口句柄, GWL_EXSTYLE, rtn
    End If
End Sub
Sub 取消窗口設置(窗口句柄, 模式)
    //模式：0(一般窗體)~1(UpdateLayeredWindow畫窗體)
    //窗口句柄 = lib.API.查找窗口句柄("notepad",0)
    //例子：Call lib.API.取消窗口設置(窗口句柄,0)
    Dim GWL_EXSTYLE, WS_EX_LAYERED 
    GWL_EXSTYLE = (-20) 
    WS_EX_LAYERED = &H80000
    If 窗口句柄 <> 0 Then
        If 模式 = 0 then
            '取消鼠標穿透(一般窗體)  
            SetWindowLong 窗口句柄, GWL_EXSTYLE, 0
        Else 
            '取消鼠標穿透(UpdateLayeredWindow畫窗體)  
            SetWindowLong 窗口句柄, GWL_EXSTYLE, WS_EX_LAYERED
        End If
    End If
End Sub
Sub 運行程序(程序路徑)
    //例子：Call Lib.API.運行程序("E:\網絡遊戲\S三國策6\GLSGC.exe")
    Dim P, I, DirPath, ExeName
    P = Split(程序路徑, "\")
    For I = 0 To UBound(P) - 1
        DirPath = DirPath & P(I) & "\"
    Next
    ExeName = P(UBound(P))
    ShellExecute GetDesktopWindow, "open", ExeName, vbNullString, DirPath, 5
End Sub







//製作：一隻魚
//日期：2010.11.10
//修改：2011.06.18
