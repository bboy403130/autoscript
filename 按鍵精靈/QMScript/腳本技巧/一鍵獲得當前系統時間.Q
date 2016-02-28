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
MacroID=02063318-01aa-43b2-8078-70717932f582
Description=一鍵獲得當前系統時間
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
按下熱鍵，返回當前的時間.
.
【使用說明】.
請先設置一下時間通知方式.
1是彈對話框提示.
2是輸出文本提示（適合網游裡面用）.
.
【按鍵專家團 晨風】 .
.
.

[Script]
UserVar ShuChuFangShi = 1 "獲取到時間之後的輸出方式。1是彈對話框，適合平時看時間；2是文本輸出，適合網游裡使用"
Dim Y,Mon,D,W,h,m,s,SJ
//先聲明變量
Y=Year(Date):Mon=Month(Date):D=Day(Date):W=Weekday(Date,vbMonday)
//利用VBS函數獲得當前系統的年,月,日,星期   並各自保存到變量中
h=Hour(time):m=Minute(time):s=Second(time)
//利用VBS函數獲得當前系統的時,分,秒   並各自保存到變量中
SJ=Y &"年"& Mon &"月"& D &"號 星期"& W &" "& h &"點"& m &"分"& s &"秒"
//把得到的年,月,日,星期,時,分,秒連接起來   並保存到SJ變量中
If ShuChuFangShi=1 Then
    //最後彈出個窗口   顯示當前的系統時間（變量SJ）
    MessageBox SJ
End If  
If ShuChuFangShi=2 Then
    //最後輸出文本   顯示當前的系統時間（變量SJ）
    SayString SJ
End If 
