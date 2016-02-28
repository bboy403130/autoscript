[General]
SyntaxVersion=1
BeginHotkey=121
BeginHotkeyMod=0
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=123
StopHotkeyMod=0
RunOnce=1
EnableWindow=
MacroID=4d353010-67d9-4dde-a438-2cada4b9f620
Description=內存進程Memory插件
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
Content=

[Script]
//測試OK
Call RunApp("notepad.exe")
Delay 1000
//下面這句是查找窗口類名(0)或者標題("未命名 - 記事本"),返回找到的句柄Hwnd
Hwnd = Plugin.Window.Find(0, "未命名 - 記事本")
MessageBox "查找到的父窗口句柄為：" & Hwnd
//下面這句是設置進程優先級為(高於標準(A))
Call Plugin.Memory.SetProcessLive(Hwnd, 4)
MessageBox "返設置進程優先級為(高於標準(A))"
//下面這句是返回進程優先級返回到變量(Live)
Live = Plugin.Memory.GetProcessLive(Hwnd)
MessageBox "返回進程優先級為：" & Live
//下面這句是結束句柄(Hwnd)進程
Call Plugin.Memory.TerminateProc(Hwnd)
MessageBox "結束句柄進程"
//===========================================================================
Call RunApp("winmine.exe")
Delay 1000
hwnd=Plugin.Window.Find(0,"踩地雷")
Dim x, y
//x, y中分別保存當前掃雷的長與寬的格子數量
x=Plugin.Memory.Read32Bit(hwnd,&h1005334)
y=Plugin.Memory.Read32Bit(hwnd,&h1005338)
MessageBox "掃雷的長與寬的格子數量為：" & x & "  *  " & y &"格"
//下面這句是從內存地址範圍開始(&H7D7045B4到&H7D8045B4)以步長為(2)進行搜索內存字符串("雷")地址
DiZhi = Plugin.Memory.FindString(Hwnd, "雷", &H7D7045B4, &H7D8045B4, 2)
MessageBox "搜索到第一個""雷""字內存地址為：&H" & Hex(DiZhi)
//下面這句是讀取內存字符串(&H7D7A45B4)內存地址返回到變量(z)
z = Plugin.Memory.ReadString(Hwnd, Clng(DiZhi), 2)
MessageBox "讀到的內存字符串為：" & z
//建個雙重循環，循環所有格子
TestMemory_resut=""
Dim i, j, value, strview
strview="說明：@代表安全，*代表雷" & vbcrlf
For i=0 To x-1
    For j=0 To y-1
        value=Plugin.Memory.Read8Bit(hwnd,&h1005360+(j+i*32+1))
        If value=&h8A or value=&h8F Then
            strview=strview & " *"
        Else 
            strview=strview & " @"
        End If        
    Next 
    strview=strview & vbcrlf   
Next 
TestMemory_resut="掃雷測試:" & strview
MessageBox TestMemory_resut
//關閉掃雷
Call Plugin.Window.Close(hwnd)
MessageBox "關閉掃雷遊戲"
