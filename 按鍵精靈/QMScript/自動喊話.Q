[General]
SyntaxVersion=2
BeginHotkey=120
BeginHotkeyMod=0
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=123
StopHotkeyMod=0
RunOnce=1
EnableWindow=
MacroID=eb81f30d-247c-4a36-905a-7346cc2a4b5d
Description=自動喊話
Enable=0
AutoRun=0
[Repeat]
Type=1
Number=1015
[SetupUI]
Type=2
QUI=
[Relative]
SetupOCXFile=
[Comment]
.
【功能說明】.
自動叫賣，反覆輸入一些話.
【使用說明】.
在遊戲中按下熱鍵即可說話，自己可以修改說話的內容。.
最多支持5句話反覆叫喊，可以設定每句話叫喊的時間間隔.
【作者介紹】 vrBrothers.Leo.
【製作日期】 06年08月21日

[Script]
UserVar MoShi=DropList{"普通模擬":0|"超級模擬":1|"硬件模擬":2}=0 "設置模擬方式"
UserVar str1="這是自動喊的第1句話" "請輸入自動叫喊的第1句話"
UserVar str2="這是自動喊的第2句話" "請輸入自動叫喊的第2句話"
UserVar str3="這是自動喊的第3句話" "請輸入自動叫喊的第3句話"
UserVar str4="這是自動喊的第4句話" "請輸入自動叫喊的第4句話"
UserVar str5="這是自動喊的第5句話" "請輸入自動叫喊的第5句話"
UserVar Yanshi=3000 "兩句喊話之間的等待時間，1秒鐘是1000"
//****************設置結束*****************
If MoShi=0 Then
    SetSimMode 0
ElseIf MoShi=1 Then
    SetSimMode 2
ElseIf MoShi=2 Then
    SetSimMode 1
End If
Delay 500
Rem go
SayString str1
KeyPress 13,1
Delay Yanshi
SayString str2
KeyPress 13,1
Delay Yanshi
SayString str3
KeyPress 13,1
Delay Yanshi
SayString str4
KeyPress 13,1
Delay Yanshi
SayString str5
KeyPress 13,1
Delay Yanshi
//等待半分鐘後，進行下一輪叫賣
For 30
    Delay 1000
Next
Goto go
