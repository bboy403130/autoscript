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
MacroID=603a0d92-39e1-4f0b-8075-5da86172a1d0
Description=信息提示Msg插件
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
For PU=0 To 9
    //下面這句是直接對屏幕進行刷新清除
    Call Plugin.Msg.HideScrTXT()
    //延遲半秒等待刷新完畢
    Delay 500
    //下面這句是在屏幕上範圍位置(0, 0, 1024, 100)進行輸出內容("屏幕內容填寫")
    Call Plugin.Msg.ShowScrTXT(0, 0, 1024, 100, "屏幕內容填寫  " & PU, "0000FF")
    //延遲半秒可以讓你看的清楚
    Delay 500
    //下面這句是在系統托盤上顯示提示信息
    Call Plugin.Msg.Tips("屏幕內容填寫  " & PU)
    //延遲半秒可以讓你看的清楚
    Delay 500
Next
EndScript 
//1.首先[發送者]必須註冊飛信帳號
//2.[接收方]必須要在[發送者]的飛信帳號好友列表裡
//3.註冊飛信帳號地址：http://www.fetion.com.cn/account/register/
//參數3，當長度為0時表示接收方號碼與發送用戶相同
SMS = Plugin.Msg.SendSMS("13900000001","1314520","13900000002","發送短信消息內容")
If SMS = True Then 
    MessageBox "發送成功！"
Else 
    MessageBox "發送失敗！"
End If 
