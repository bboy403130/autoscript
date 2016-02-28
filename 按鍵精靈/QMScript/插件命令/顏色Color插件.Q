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
MacroID=0d6bea7f-5016-4ed9-a9c5-62e46e13d2ea
Description=顏色Color插件
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
//下面這句是把10進制(R：255, G：0, B：0)份量合併到16進制顏色值變量(Color)中
Color1 = Plugin.Color.GetRGB(255, 0, 0)
MessageBox color1
//下面這句是把16進制顏色("0000FF")轉換分解到10進制(R：R, G：G, B：B)份量中
Call Plugin.Color.ColorToRGB("ffffFF", R, G, B)
MessageBox R&"  " & G &"  " & B
//=================================================================================
//下面這句是把16進制顏色("0000FF")轉換分解到10進制(H：H, S：S, L：L)份量中
Call Plugin.Color.ColorToHSL("0000FF", H, S, L)
MessageBox H&"  " & S &"  " & L
//=================================================================================
//下面這句在屏幕區域範圍內查找16進制顏色("0000FF")的數量
NUM = Plugin.Color.CountColor(0, 0, 1024, 768, "FFFFFF",1)
MessageBox "顏色(""FFFFFF"")的數量=" & NUM
//=================================================================================
//下面這句在屏幕區域範圍內查找多點顏色,返回左上角第一點顏色位置坐標
MessageBox "下面演示在桌面上多點找色：找""我""字位置"
XY = Plugin.Color.FindMutiColor(0, 0, 1024, 768, "FFFFFF", "2|0|FFFFFF,-6|1|FFFFFF,-3|1|FFFFFF,-6|3|FFFFFF,-3|3|FFFFFF,0|3|FFFFFF,4|3|FFFFFF,-1|5|FFFFFF,3|5|FFFFFF,-3|6|FFFFFF,-6|7|FFFFFF,1|8|FFFFFF,4|8|FFFFFF,-5|10|FFFFFF,-3|10|FFFFFF,4|10|FFFFFF", 1)
//下面這句用於分割字符串
MyArray = Split(XY, "|")
//下面這句將字符串轉換成數值
X = CInt(MyArray(0)): Y = CInt(MyArray(1))
MessageBox "屏幕多點找色功能：找屏幕""我""字位置位：" & X&","&Y
MoveTo x,y
//=================================================================================
//下面這句在屏幕區域範圍內查找圖形形狀,返回左上角第一點坐標位置
XY = Plugin.Color.FindShape(0, 0, 1024, 768, "2|0|1,4|0|1,6|0|0,-4|1|1,-1|1|1,5|1|1,-4|3|1,-1|3|1,2|3|1,6|3|1,-4|5|0,2|5|1,5|5|1,-1|6|1,6|6|0,-4|7|1,3|8|1,6|8|1,-4|10|0,-3|10|1,-1|10|1,2|10|0,6|10|1", 1)
//下面這句用於分割字符串
MyArray = Split(XY, "|")
//下面這句將字符串轉換成數值
X = CInt(MyArray(0)): Y = CInt(MyArray(1))
MessageBox "屏幕找圖形形狀功能：找屏幕""我""字位置位：" & X&","&Y
MoveTo x,y
