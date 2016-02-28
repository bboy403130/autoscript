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
MacroID=3f185363-c959-446b-a627-62be0ab6d230
Description=查找當前鼠標所指點的顏色相同個數
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
【作者,wx19841231】..
結果會記錄在桌面上

[Script]
Dim Rx(10000),Ry(10000)
allx=Plugin.Sys.GetScRX()
ally=Plugin.Sys.GetScRY()
Call GetCursorPos(sx,sy)
color1=GetPixelColor(sx,sy)
x=0:y=0:a=0:i=0
t1=Plugin.Sys.GetTime()
While y<=ally/10
    While x<=allx/10
        //搜索範圍,可自行調整
        IfColor x,y,color1,0 Then
            a=a+1
            i=i+1
            Rx(i)=x:Ry(i)=y
        EndIf 
        MoveTo x,y
        x=x+1
        //搜索密度,可自行調整
    wend 
    x=0
    y=y+1
    //搜索密度,可自行調整
wend 
t2=Plugin.Sys.GetTime()
t=t2-t1
Call MessageBox("當前分辨率"&allx&":"&ally&vbCrlf&"啟動腳本時鼠標指向點坐標為"&sx&","&sy&vbCrlf&"所指點顏色為"& color1 &vbCrlf&"你當前屏幕共有 "&a&" 個相同顏色點"&vbCrlf&"總共耗時："&t&" 毫秒"&vbCrlf&"詳情看桌面的測試結果")
Set objShell = CreateObject("WScript.Shell")
desk = objShell.SpecialFolders.Item("desktop")
//↑取得桌面路徑
set fso=CreateObject("Scripting.FileSystemObject")
Const forreading=1
const forwriting=2
const forappending=8
If fso.FileExists(desk&"\測試結果.txt")=0
    set myfile=fso.createtextfile(desk&"\測試結果.txt")
    myfile.Close
    how=0
Else 
    set myfile=fso.opentextfile(desk&"\測試結果.txt",forreading)
    While myfile.atendofstream=0
        zero=myfile.readline
        Lleft=instr(1,zero,"(")
        Rright=instr(1,zero,")")
        If Rright-Lleft-1>0 then
            how=mid(zero,Lleft+1,Rright-Lleft-1)
        End if
        //↑檢測第幾次檢測
    wend 
    myfile.Close
End If 
set myfile=fso.opentextfile(desk&"\測試結果.txt",forappending)
//↑寫一個TXT到桌面
myfile.writeline ("第("& how + 1 &")次測試於"&now)
myfile.writeline ("當前分辨率"&allx&":"&ally)
myfile.writeline ("啟動腳本時鼠標指向點坐標為"&sx&","&sy)
myfile.writeline ("所指點顏色為"&color1)
myfile.writeline ("你當前屏幕共有 "&a&" 個相同顏色點")
myfile.writeline ("總共耗時："&t&" 毫秒")
//↑上面就是寫進TXT的測試結果
If a<>0
    myfile.writeline ("下面是找到點的坐標:x,y")
    While i>0
        myfile.writeline(Rx(i)&","&Ry(i))
        i=i-1
    wend 
    //↑上面就是寫進TXT的找到的點坐標
End If 
myfile.Close
