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
MacroID=6ee92d8a-7194-441a-a05f-0024dac67e96
Description=後台按鍵、後台喊話
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
演示如何給一個後台的窗口發送鍵盤消息.
.
【使用說明】.
按下熱鍵會啟動一個寫字板，之後可以將寫字板切換到後台，你也會發現腳本不斷的向寫字板裡面寫入 "Hello, world" 並回車.
.
【作者介紹】.
vrBrothers.CR.
.

[Script]
Call RunApp("notepad")
Delay 1000
//需要確認把記事本放在前台
hwnd=Plugin.Window.Find(0,"未命名 - 記事本")
//需要先得到可以發送按鍵消息的窗口
Hwnd = Plugin.Window.FindEx(Hwnd, 0, "Edit", 0)
//Plugin Window.Active(hwnd)
//Plugin hwnd = Window.GetKeyFocusWnd()
MessageBox "提醒：如果您現在的熱鍵模式是「普通模式」，將有可能導致鍵盤失去響應，按下ctrl+alt+del即可解決這個問題。建議您在設置裡使用「軟件模式」的熱鍵啟動方式。"
MessageBox "現在可以把記事本的窗口放在後台，或者是最小化"
//等待兩秒鐘
Delay 2000
For i=0 To 10
    //後台喊話
    Call Plugin.Bkgnd.SendString(hwnd,"Hello, world")
    //後台按鍵
    Call Plugin.Bkgnd.KeyDown(hwnd,13)
    Delay 500
Next 
