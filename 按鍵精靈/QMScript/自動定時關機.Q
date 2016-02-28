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
MacroID=83ac5446-d86c-44d3-aba2-a89a68cf08a7
Description=自動定時關機
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
===日常應用===.
【功能說明】.
自動定時關機。.
時間格式為24小時制 -- 00：00~23：59。.
當不在這個範圍內會報錯並返回讓用戶重新輸入~~ ：）。.
.
【使用說明】.
電腦在無人值守裡，在設置的時間自動關機！啟動熱鍵為<F10>，中止熱鍵為<F12>。.
.
.
【作者介紹】.
【按鍵專家團 Jimmyzs】.
.
【製作日期】.
<2006-7-13>

[Script]
//*********************************   說明   *****************************************
//時間格式為24小時制 -- 00：00~23：59
//當不在這個範圍內會報錯並返回讓用戶重新輸入~~ ：）
//*********************************   源代碼   *****************************************
dim Obj,UserName,NowTime,LenS,Num
set Obj = createobject("WScript.Shell")
//調用「Wscript.Shell」
UserName=Obj.RegRead("HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\RegisteredOwner")
// RegRead -- 讀取註冊表
YN=Obj.Popup(UserName&" 你好，是否使用自動定時關機？",0,"關機？",36)
//Popup--彈出對話框
If YN=6 Then
    //標記 輸入時間
    Rem InputTime
    SWTime=InputBox ("請輸入關機時間！24小時格式(00:00~23:59之間)！如：2:03 ， 22:35")
    //*********************************** 判斷時間格式 ****************************************************
    LenS=Len(SWTime)
    //Len--獲得字符串的長度
    Num=Instr(SWTime,":")
    //Instr--獲得":"所在字符串中的位置
    If Num=0 Then
        Num=Instr(SWTime,"：")
    End If
    If Num=0 Then
        Call Obj.Popup("間隔符錯誤！請用「 : 」或者「 ： 」",5,"時間格式錯誤！",48)
        //跳到 輸入時間
        Goto InputTime
    End If
    If left(SWTime,Num-1)>23 or left(SWTime,Num-1)<0  Then
        //left--取字符串左邊Num-1個長度的字符
        Call Obj.Popup("小時格式輸入錯誤！",5,"時間格式錯誤！",48)
        Goto InputTime
    End If
    If Right(SWTime,LenS-Num)>59 or Right(SWTime,LenS-Num)<0 Then
        //Right--取字符串右邊LenS-Num個長度的字符
        Call Obj.Popup("分鐘格式輸入錯誤！",5,"時間格式錯誤！",48)
        //跳到 輸入時間
        Goto InputTime
    End If
    //*********************************** 判斷時間格式 ****************************************************
    Call Obj.Popup("系統將在"&SWTime&"關機！！",5,"自動關機！",48)
    Rem Start
    NowTime=Time
    //Time -- 獲得當前時間
    If Hour(SWTime)=Hour(NowTime) and Minute(SWTime)=Minute(NowTime) Then
         //Hour -- 獲得小時， Minute -- 獲得分鐘
        Obj.Run "shutdown /f /s /t 0"
        //調用shutdown命令。 /f--強行關閉應用程序而不提醒， /s--關閉計算機（要重啟的話，請把這改成/r[重啟計算機]），/t time--在time秒後前閉計算機。
    End If
    For 30
    	Delay 1000
    Next
    Goto Start
End If
