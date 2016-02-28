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
MacroID=09fcfac4-f5cb-4604-819f-9f7b726ec631
Description=網游通用帳號輸入器v1
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
===通用腳本===.
【功能說明】.
比如你的腳本裡面有全自動輸入帳號跟密碼時,在那個位置刪掉你的帳號密碼輸入,換成加入按F11鍵就可以幫你輸,這樣你的帳號跟密碼不會被人知道了.
.
【使用說明】.
注意:此腳本要一直開著,除非你退出遊戲不玩時再關掉;.
前提是光標在輸帳號框裡面閃動;輸完後會幫你回車;.
122為F11鍵(只要在你的腳本加入按F11鍵就可以).
輸入啟動按鍵碼! 如:F1~F12鍵為112~123碼;a~z鍵為65~90碼;.
(注意:按鍵碼,不要設成跟你腳本有衝突的鍵).
.
【作者介紹】.
一隻魚(OneFish)♂.
.
【製作日期】.
2004.12.21

[Script]
//前提是光標在輸帳號框裡面閃動
GG=InputBox("請輸入您的帳號!!!"&Vbcrlf&"無內容輸入時直接按[確定]或[取消]退出!!!")
If StrComp("",GG)=0 Then
    Goto 結束
End If
MM=InputBox("請輸入您的密碼!!!"&Vbcrlf&"無內容輸入時直接按[確定]或[取消]退出!!!")
If StrComp("",MM)=0 Then
    Goto 結束
End If
KEY=InputBox("請輸入啟動按鍵碼! 如:F1~F12鍵為112~123碼;a~z鍵為65~90碼;"&Vbcrlf&"無內容輸入時直接按[確定]或[取消]退出!!!")
If StrComp("",KEY)=0 Then
     Goto 結束
End If
//轉換按鍵碼
KEY=CInt(KEY)
Rem ID
Delay 100
K=WaitKey()
//122為F11鍵(只要在你的腳本加入按F11鍵就可以)
If K=KEY Then
    //GG為帳號
    SayString GG
    Delay 500
    KeyPress 9 ,1
    Delay 200
    //MM為密碼
    SayString MM
    Delay 500
    KeyPress 13, 1
End If
Goto ID
Rem 結束
EndScript 
