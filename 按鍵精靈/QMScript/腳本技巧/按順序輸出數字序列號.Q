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
MacroID=dfb33df9-2c96-4a6d-bddb-536242c0fd78
Description=按順序輸出數字序列號
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
按順序輸出數字，可以設定開始的數字和結束的數字。.
.
【作者介紹】按鍵專家團 無憂魔神 (godeden).
.
.

[Script]
// ═══════════════★說★明★═════════════☆═
// 【功能說明】數字序列號輸出【模板】
// 【使用說明】在彈出的對話框中輸入起始號碼(最小數字)跟結束號碼(最大數字)
// 【提示說明】請在記事本中測試
// ═══════════════★定變量★═════════════☆═
dim a,b
// ═══════════════★主程序★═════════════☆═
// 【腳本開始】
a=InputBox("輸入起始號碼")
b=InputBox("輸入結束號碼")
// 【這個cint(x)是把變量值轉換成數字】
a=cint(a)
b=cint(b)
While a<=b
    SayString a
    KeyPress 32,1
    a=a+1
Wend
// ═══════════════★備★注★═════════════☆═
// 【腳本經過修改】
// 【創作日期】2005
// 【數字記號】１２３４５６７８９十
// ═══════════════★結★束★═════════════☆═
