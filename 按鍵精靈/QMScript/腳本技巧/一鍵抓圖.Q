[General]
SyntaxVersion=2
BeginHotkey=121
BeginHotkeyMod=0
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=123
StopHotkeyMod=0
RunOnce=0
EnableWindow=
MacroID=621a7e36-5ab8-43b4-be2c-3f10ceea0617
Description=一鍵抓圖
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
===日常應用===.
【功能說明】.
一鍵抓圖,抓的圖保存在桌面上! .
.
【使用說明】.
一鍵抓圖,抓的圖保存在桌面上! ,但是自己要的圖片還得在這個基礎上自己修改.[在按鍵上看到很多人不會抓圖].啟動熱鍵為<F10>，中止熱鍵為<F12>。.
.
【作者介紹】.
【按鍵專家團 Jimmyzs】.
.
【製作日期】.
<2006-9-6>.

[Script]
//下面這句在屏幕區域範圍內截圖保存到桌面
//下面兩句是獲取用戶桌面文件夾
set Obj = createobject("WScript.Shell")
FileName = Obj.SpecialFolders("desktop")
Call Plugin.Pic.PrintScreen(10, 10,200 , 200, FileName & "\按鍵精靈一鍵抓圖.bmp")
MessageBox "已經將截圖保存在桌面！"
