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
MacroID=c204790c-bfa5-44ec-86ad-62c44aed5a52
Description=窗口Window插件
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
Dim MyArray
Call RunApp("notepad.exe")
Delay 1000
//=================================================================================
//下面這句是查找窗口類名(0)或者標題("未命名 - 記事本"),返回找到的句柄Hwnd
Hwnd = Plugin.Window.Find(0, "未命名 - 記事本")
MessageBox "查找到的父窗口句柄為：" & Hwnd
//下面這句是根據父窗口句柄(Hwnd)查找子窗口匹配類名("Edit")或者匹配標題(0),返回找到匹配的句柄Hwnd
Hwnd = Plugin.Window.FindEx(Hwnd, 0, "Edit", 0)
MessageBox "查找到的子窗口句柄為：" & Hwnd
//=================================================================================
//下面這句是激活窗口
Call Plugin.Window.Active(Hwnd)
MessageBox "當前激活窗口"
Delay 1000
//下面這句是得到當前最前面的窗口句柄
Hwnd = Plugin.Window.Foreground()
MessageBox "得到當前最前面的窗口句柄為：" & Hwnd
//下面這句是最小化窗口
Call Plugin.Window.Min(Hwnd)
MessageBox "當前最小化"
//下面這句是還原窗口
Call Plugin.Window.Restore(Hwnd)
MessageBox "當前還原窗口"
//下面這句是最大化窗口
Call Plugin.Window.Max(Hwnd)
MessageBox "當前最大化"
//下面這句是還原窗口
Call Plugin.Window.Restore(Hwnd)
MessageBox "當前還原窗口"
//下面這句是得到鼠標指向的窗口句柄
Hwnd0 = Plugin.Window.MousePoint()
MessageBox "得到鼠標指向的窗口句柄為：" & Hwnd0
//下面這句是隱藏窗口
Call Plugin.Window.Hide(Hwnd)
MessageBox "當前隱藏窗口"
//下面這句是顯示窗口
Call Plugin.Window.Show(Hwnd)
MessageBox "當前顯示窗口"
//=================================================================================
//下面這句是得到窗口句柄的邊框大小(包括標題欄)
Rect = Plugin.Window.GetWindowRect(Hwnd)
MessageBox "得到窗口句柄的邊框大小(包括標題欄)為：" & Rect
//下面這句用於分割字符串,將橫坐標和縱坐標分成兩個字符串
MyArray = Split(Rect, "|")
//下面這句將字符串轉換成數值
W1 = Clng(MyArray(0)): H1 = Clng(MyArray(1))
W2 = Clng(MyArray(2)): H2 = Clng(MyArray(3))
MessageBox "邊框大小：       "  &  W2-W1 & "             " & H2-H1
//下面這句是改變窗口大小為(100, 100)
Call Plugin.Window.Size(Hwnd, 100, 100)
MessageBox "當前改變窗口大小"
//下面這句是得到窗口句柄的客戶區大小
Rect = Plugin.Window.GetClientRect(Hwnd)
MessageBox "得到窗口句柄的客戶區大小為：" & Rect
//下面這句用於分割字符串,將橫坐標和縱坐標分成兩個字符串
MyArray = Split(Rect, "|")
//下面這句將字符串轉換成數值
L = Clng(MyArray(0)): T = Clng(MyArray(1))
R = Clng(MyArray(2)): B = Clng(MyArray(3))
//下面這句是改變窗口大小為(W, H)
Call Plugin.Window.Size(Hwnd, W2-W1, H2-H1)
MessageBox "當前改變窗口大小"
//=================================================================================
//下面這句是移動窗口到(100, 100)位置
Call Plugin.Window.Move(Hwnd, 100, 100)
MessageBox "當前移動窗口到(100, 100)位置"
//下面這句是判斷窗口是否打開
Window1 = Plugin.Window.IsWindow(Hwnd)
If Window1 = 1 Then
    MessageBox "窗口打開中"
Else 
    MessageBox "窗口沒有打開"
End If 
//下面這句是得到窗口句柄的標題
Text = Plugin.Window.GetText(Hwnd)
MessageBox "得到窗口句柄的標題為：" & Text
//下面這句是得到窗口句柄的類名
Class1 = Plugin.Window.GetClass(Hwnd)
MessageBox "得到窗口句柄的類名為：" & Class1
//=================================================================================
//下面這句是遍歷符合窗口標題("記事本")的句柄保存到數組(HwndEx)裡
HwndEx = Plugin.Window.Search("記事本")
MessageBox "查找到符合的窗口句柄為：" & HwndEx 
//下面這句用於分割字符串,將橫坐標和縱坐標分成兩個字符串
MyArray = Split(HwndEx, "|")
If UBound(MyArray)>=0 Then    
    For i=0 To UBound(MyArray)-1
        //下面這句將字符串轉換成數值
        MessageBox "第 " & i+1 & " 個窗口句柄為：" & Clng(MyArray(i))        
    Next 
End If 
//=================================================================================
//下面這句是改變窗口大小為(300, 200)
Call Plugin.Window.Size(Hwnd, 300, 200)
MessageBox "當前改變窗口大小"
//=================================================================================
//下面這句是窗口屬性設置為(窗口置前)
Call Plugin.Window.Top(Hwnd, 0)
MessageBox "當前窗口置前"
//下面這句是窗口屬性設置為(取消窗口置前)
Call Plugin.Window.Top(Hwnd, 1)
MessageBox "當前取消窗口置前"
//=================================================================================
//下面這句是關閉窗口
Call Plugin.Window.Close(Hwnd)
MessageBox "當前關閉窗口"
