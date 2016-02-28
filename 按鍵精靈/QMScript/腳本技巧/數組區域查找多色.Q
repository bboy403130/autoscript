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
MacroID=475129c3-9188-4426-899c-263a15d71efd
Description=數組區域查找多色
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
此腳本利用數組定義多個顏色進行區域找色(也可以用這種方法區域查找多個圖片).
.
【使用說明】.
先修改顏色代碼  保存退出即可.
.
【作者介紹】.
【按鍵專家團 晨風】.
.
【製作日期】.
<2006-09-15>

[Script]
dim Cor(2)
dim s,x,y
//聲明變量
Cor(0)="FFFFFF":Cor(1)="000000":Cor(2)="00FFFF"
//定義顏色數組變量 請自行修改顏色代碼
Rem start
s=0
//定義數組下標初始值變量
For 3
    //循環3次
    Delay 10
    //循環裡設置延時  防止系統內存佔用太高
    //VBSCall FindCenterColor(0,0,1024,768,Cor(s),x,y)
    Call FindCenterColor(0,0,1024,768,Cor(s),x,y)
    //區域從中間向外查找顏色。0,0,1024,768為區域範圍，Cor(s)為顏色數組變量，x,y為坐標變量
    If x>0 and y>0 Then
        //如果找到顏色
        Delay 100
        //延時100毫秒
        Call MessageBox("找到顏色"&"Cor("&s&") "&"坐標為:"&x&","&y)
        //彈出窗口 找到顏色和坐標
    Else 
        Delay 100
        //延時100毫秒
        Call MessageBox("沒找到顏色"&"Cor("&s&")")
        //彈出窗口 沒有找到顏色
   End If
    //條件結束
    s=s+1
    //變量遞增
Next 
//循環結束
EndScript 
Goto start
