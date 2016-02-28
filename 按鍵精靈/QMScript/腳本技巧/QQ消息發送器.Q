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
MacroID=66f8625f-f0f3-4cf8-bc42-e32a36a5f7c1
Description=QQ消息發送器
Enable=0
AutoRun=0
[Repeat]
Type=1
Number=1943232333
[SetupUI]
Type=2
QUI=
[Relative]
SetupOCXFile=
[Comment]
.
【功能說明】.
QQ消息自動發送器.
.
【使用說明】.
請把QQ聊天窗口放在最前，發送過程必須保證窗口在最前方。後台發送的版本正在製作中 ：）.
本腳本僅供娛樂，切勿用於騷擾他人。要做有趣的人，不要作無聊的人。.
.
【作者介紹】.
vrBrothers.Leo.
.
【製作日期】.
2006.9.
.

[Script]
//自定義變量設置
UserVar Hua1="窗前明月光" "發送的第一句話"
UserVar Hua2="疑是地上霜" "發送的第二句話"
UserVar Hua3="舉頭望明月" "發送的第三句話"
UserVar Hua4="低頭思故鄉" "發送的第四句話"
UserVar Hua5="按鍵精靈自動發送" "發送的第五句話"
UserVar Yanshi=1000 "發送兩句話之間的時間間隔，默認1000就是1秒"
//用一個變量來設置需要發送的話的內容
Dim Hua
//發送第一句
Hua = Hua1
Call FaSongXiaoXi()
Delay Yanshi
//發送第二句，以下雷同
Hua = Hua2
Call FaSongXiaoXi()
Delay Yanshi
Hua = Hua3
Call FaSongXiaoXi()
Delay Yanshi
Hua = Hua4
Call FaSongXiaoXi()
Delay Yanshi
Hua = Hua5
Call FaSongXiaoXi()
Delay Yanshi
EndScript 
//發送消息的子程序
Sub FaSongXiaoXi()
    //填上要發的話
    SayString Hua
    Delay 100
    //按下Alt+S的QQ發消息熱鍵，發送成功
    KeyDown 18, 1
    KeyPress 83, 1
    KeyUp 18, 1
End Sub
