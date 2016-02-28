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
MacroID=1187030d-5e67-46cd-946b-4c4a10bdd20a
Description=建立備忘錄到桌面上並定時提醒
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
在桌面建立一個備忘錄並自動提醒.
.
.
【按鍵專家團  wx19841231】.
.
.

[Script]
UserVar thing="提醒事件" "在這輸入你要記錄的事 編輯你需要提醒的事件"
UserVar awoke="3(s)" "在這輸入多少秒s,分鐘m,小時h後提醒"
Set objShell = CreateObject("WScript.Shell")
x = objShell.SpecialFolders.Item("desktop")
//↑取得桌面路徑
set fso=CreateObject("Scripting.FileSystemObject")
const forwriting=2
const forreading=1
set myfile=fso.createtextfile(x & "\備忘錄.txt")
//↑寫一個TXT到桌面
myfile.writeline("時間:"& now)
myfile.writeline("事件:"& thing)
//↑這兩行就是你寫進TXT的內容
myfile.Close
Lleft=instr(1,awoke,"(")
Rright=instr(1,awoke,")")
o=mid(awoke,Lleft+1,Rright-Lleft-1)
//↑檢測沿時單位
p=mid(awoke,1,Lleft-1)
//↑檢測沿時長度
If o="h" Then
    q=3600
ElseIf o="m" Then
    q=60
Else 
    q=1
End If
t=now
do
    Rem 檢查時間
    If DateDiff("s",t,now)>=p*q  Then
        //↑比較時間
        Exit Do
    End If
    Delay 50
loop
Rem 時間到了
Set myfile=fso.OpenTextFile(x & "\備忘錄.txt",ForReading)
a=myfile.ReadLine
b=myfile.ReadLine
//↑讀取剛寫的內容
myfile.Close
MessageBox a & vbCrlf & b
//↑把剛讀取的顯示出來
RunApp x & "\備忘錄.txt"
//↑運行剛建立的TXT文本
