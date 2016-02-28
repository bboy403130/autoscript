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
MacroID=f654c0be-2a57-484a-a776-86e588a5127a
Description=區域模糊找色打怪
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
在屏幕的固定區域使用模糊找色功能尋找怪物，並將鼠標移過去點擊打怪.
.
【使用說明】.
這是個腳本例子，無法直接運行，供大家學習參考.
.
【作者介紹】.
摘自兄弟論壇，帖子網址：.
http://bbs.vrbrothers.com/viewthread.php?tid=20488.
作者： 晨風 .
.
.

[Script]
Call FindColorEx(0,0,1024,768,"FFFFFF",1,0.8,x,y)
//區域模?找色  0,0,1024,768為區域範圍 "FFFFFF"為顏色 1為查找方式(中間向外) 0.8為模?值 x,y為找到顏色後的坐標變量
If x>0 and y>0 Then
    //如果找到顏色  比如找到顏色就會賦值給坐標變量  通過判斷坐標變量可以知道有沒有找到怪
    MoveTo x,y
    //把鼠標移動到該色的坐標 如果找的是怪名字或血條  可能移動不到怪身上 這時就要用鼠標偏移 如：MoveTo x+10 y+10
    Delay 50
    //延時
    LeftClick 1
    //左鍵單擊進行攻擊
End If 
//條件結束
