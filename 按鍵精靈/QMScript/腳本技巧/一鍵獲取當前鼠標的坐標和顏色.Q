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
MacroID=4c00c25a-191a-45a4-ba33-e7a3961d5e72
Description=一鍵獲取當前鼠標的坐標和顏色
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
【請在這裡下拉選擇】.
【功能說明】.
一鍵可得到當前鼠標的坐標和顏色.
.
【使用說明】.
把鼠標移動到任意坐標位置  按下啟動熱鍵即可.
.
【作者介紹】.
【按鍵專家團 晨風】.
.
【製作日期】.
<2006-09-15>

[Script]
dim x,y,color
//聲明變量
GetCursorPos x, y
//得到當前鼠標的坐標位置  並保存到變量x,y中
Color=GetPixelColor(x,y)
//得到指定坐標位置的顏色  並保存到變量color中
MessageBox("坐標為:"&x&","&y&" 顏色為:"&color)
//彈出窗口 輸出坐標和顏色的值
