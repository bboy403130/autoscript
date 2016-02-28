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
MacroID=3183564f-52cc-43db-8a9a-6af6b967b135
Description=後台Bkgnd插件
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
//=================================================================================
//[[以下是測試後台模擬鼠標取色找色操作]]
//=================================================================================
Call RunApp("mspaint.exe")
Delay 1000
//=================================================================================
//找畫圖區句柄
Hwnd=Plugin.Window.Find(0,"未命名 - 小畫家")
Hwnd=Plugin.Window.FindEx(Hwnd, 0, "AfxFrameOrView42u", 0)
Hwnd=Plugin.Window.FindEx(Hwnd, 0, "Afx:1000000:8", 0)
TracePrint "畫圖區句柄=" & Hwnd
//=================================================================================
//下面這句用於向後台窗口句柄(變量：Hwnd)的客戶區域(坐標：5, 5)處發送一個鼠標左鍵單擊
Call Plugin.Bkgnd.LeftClick(Hwnd, 5, 5)
TracePrint "鼠標在後台窗口(坐標：5, 5)處的單擊"
//=================================================================================
//下面這句用於向後台窗口句柄(變量：Hwnd)的客戶區域(坐標：10, 10)處發送一個鼠標左鍵雙擊
Call Plugin.Bkgnd.LeftDoubleClick(Hwnd, 10, 10)
TracePrint "鼠標在後台窗口(坐標：10, 10)處的雙擊"
//=================================================================================
//下面這句取窗口句柄(變量：Hwnd)窗口的客戶區(坐標：5, 5)處的顏色
Color1 = Plugin.Bkgnd.GetPixelColor(Hwnd, 5, 5)
TracePrint "後台窗口(坐標：5, 5)處的顏色=" & Color1
//=================================================================================
//下面這句按從左到右，從上到下的順序查找窗口句柄(變量：Hwnd)窗口的指定矩形區域內指定顏色
XY = Plugin.Bkgnd.FindColor(Hwnd, 0, 0, 20, 20, "FFFFFF")
//下面這句用於分割字符串,將橫坐標和縱坐標分成兩個字符串
MyArray = Split(XY, "|")
//下面這句將字符串轉換成數值
X = CInt(MyArray(0)): Y = CInt(MyArray(1))
TracePrint "後台窗口顏色X坐標=" & X & "    Y坐標=" & Y
//=================================================================================
//下面這句按(從左到右從上到下的順序找色)模糊查找窗口句柄(變量：Hwnd)窗口的指定矩形區域內指定顏色
XY = Plugin.Bkgnd.FindColorEx(Hwnd, 0, 0, 20, 20, "FFFFFF", 0, 0.9)
//下面這句用於分割字符串
MyArray = Split(XY, "|")
//下面這句將字符串轉換成數值
X = CInt(MyArray(0)): Y = CInt(MyArray(1))
TracePrint "後台窗口顏色X坐標=" & X & "    Y坐標=" & Y
//=================================================================================
//下面這句按從中間到四周的順序查找窗口句柄(變量：Hwnd)窗口的指定的矩形區域內指定顏色
XY = Plugin.Bkgnd.FindCenterColor(Hwnd, 0, 0, 20, 20, "FFFFFF")
//下面這句用於分割字符串,將橫坐標和縱坐標分成兩個字符串
MyArray = Split(XY, "|")
//下面這句將字符串轉換成數值
X = CInt(MyArray(0)): Y = CInt(MyArray(1))
TracePrint "後台窗口顏色X坐標=" & X & "    Y坐標=" & Y
//=================================================================================
Hwnd = Plugin.Window.Find(0, "未命名 - 小畫家")
MessageBox "查找到的父窗口句柄為：" & Hwnd
//下面這句是關閉窗口
Call Plugin.Window.Close(Hwnd)
MessageBox "退出畫圖窗口"
//=================================================================================
//[[以下是測試後台模擬鍵盤操作]]
//=================================================================================
Call RunApp("notepad.exe")
Delay 1000
//=================================================================================
//找記事本輸入區句柄
Hwnd=Plugin.Window.Find(0,"未命名 - 記事本")
Hwnd=Plugin.Window.FindEx(Hwnd, 0, "Edit", 0)
TracePrint "記事本輸入區句柄=" & Hwnd
//=================================================================================
//下面這句用於向後台窗口句柄(變量：Hwnd)發送一個鍵盤(掃瞄碼：65)按鍵
Call Plugin.Bkgnd.KeyPress(Hwnd, 65)
TracePrint "在後台窗口輸入A鍵"
//下面這句用於向後台窗口句柄(變量：Hwnd)發送一個鍵盤(掃瞄碼：66)按下
Call Plugin.Bkgnd.KeyDown(Hwnd, 66)
//下面這句用於向後台窗口句柄(變量：Hwnd)發送一個鍵盤(掃瞄碼：66)按下
Call Plugin.Bkgnd.KeyDown(Hwnd, 66)
TracePrint "在後台窗口輸入B鍵"
//下面這句用於向後台窗口句柄(變量：Hwnd)發送一個文本消息(內容："內容")到客戶區
Call Plugin.Bkgnd.SendString(Hwnd, "內容")
TracePrint "發送一個文本消息(內容)"
//=================================================================================
Hwnd = Plugin.Window.Find(0, "未命名 - 記事本")
MessageBox "查找到的父窗口句柄為：" & Hwnd
//下面這句是關閉窗口
Call Plugin.Window.Close(Hwnd)
MessageBox "退出記事本窗口"
//=================================================================================
