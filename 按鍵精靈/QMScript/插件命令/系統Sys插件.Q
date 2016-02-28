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
MacroID=0aef30aa-ce07-4ea4-9b09-c6f002645ba9
Description=系統Sys插件
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
//下面這句是獲得屏幕分辨率寬度
ScreenW = Plugin.Sys.GetScRX()
MessageBox "獲得屏幕分辨率寬度："& ScreenW
//下面這句是獲得屏幕分辨率高度
ScreenH = Plugin.Sys.GetScRY()
MessageBox "獲得屏幕分辨率高度："& ScreenH
//下面這句是獲得屏幕色深度(顏色質量)
Dev = Plugin.Sys.GetScDep()
MessageBox "獲得屏幕色深度(顏色質量)："& Dev
//=================================================================================
//下面這句是設置屏幕分辨率(1024×768)/顏色質量(32位)
Call Plugin.Sys.SetSc(1024,768,32)
MessageBox "設置屏幕分辨率"
Call Plugin.Sys.SetSc(ScreenW,ScreenH,Dev)
MessageBox "屏幕分辨率改回來"
//=================================================================================
//下面這句是精準地計算毫秒時間差
s = Plugin.Sys.GetTime()
xs=int(s/1000/60/60)
fz=int(s/1000/60)-xs*60
m=Clng(s/1000)-fz*60-xs*60*60
MessageBox "您的操作系統從啟動到目前的時間：" & xs & "小時" & fz & "分鐘" & m & "秒"
//下面這句是得到硬盤第一個分區的序列號
GetSN = Plugin.Sys.GetHDDSN()
MessageBox "得到硬盤第一個分區的序列號："& GetSN
//=================================================================================
//下面這句是設置剪切板內容
Call Plugin.Sys.SetCLB("剪切板內容")
MessageBox "設置剪切板內容"
//下面這句是獲得剪切板內容
Clipboard = Plugin.Sys.GetCLB()
MessageBox "獲得剪切板內容："& Clipboard
//=================================================================================
//下面這句是獲得(當前路徑)
Path = Plugin.Sys.GetDir(0)
MessageBox "獲得路徑："& Path
EndScript 
//=================================================================================
//下面這句是關機計算機(註銷)
Call Plugin.Sys.ExitOS(0)
