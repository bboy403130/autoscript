[General]
SyntaxVersion=2
BeginHotkey=121
BeginHotkeyMod=0
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=123
StopHotkeyMod=0
RunOnce=0
EnableWindow=
MacroID=68a23135-16a6-4442-a9d7-f85011e67657
Description=論壇發腳本的格式自動編排
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
幫助你將按鍵腳本源代碼，按照論壇Discuz!語言進行重新格式編排，主要是對語法進行著色，使腳本代碼看起來更好看。.
.
【詳細說明】.
1.演示了如何調用系統打開文件對話框，以及如何根據用戶的選擇，進行下一步的操作（如打開文件等）。.
2.演示了在「按鍵精靈」中，VBScript語言與按鍵精靈語言是怎麼緊密結合在一起工作的（在使用中，你如果不注意，根本體會不到是在使用VBS語言）。.
3.演示了如何從頭至尾，讀取文件中的所有行，以及同時打開兩個文件，從一個文件中讀、往另外一個文件寫操作。.
4.演示如何從文件名獲取文件的路徑。.
5.演示如何讀寫INI文件中腳本配置。.
.
【作者介紹】.
ahfxman, 風烈焰。.
.
【製作日期】.
2006年9月

[Script]
//變量定義
Dim objDialog, fso
Dim fSourceName,fTargetname
Dim sLine, s, stemp1,stemp2
Dim LineLenOld, LineLenNew
Dim MyArray, i1, i, s1
Dim DirPath
//變量初始化
ForReading = 1:ForWriting = 2:ForAppending=8
remColor="Green"
explainColor="Blue"
IniFileName="c:\path.ini"
//============== 主程序 ===============
Call 讀取路徑()
Call 打開文件()
MessageBox "程序結束, 謝謝使用"
EndScript 
//============== 子程序 ===============
Sub 打開文件()
    Set objDialog = CreateObject("UserAccounts.CommonDialog")
    objDialog.Filter = "腳本文件|*.txt"
    objDialog.InitialDir = DirPath
    intResult = objDialog.ShowOpen
    If intResult <> 0 Then
        Call 保存路徑()
        Call 改名()
        Call 格式編輯()
    Else 
      Call 結束()
   End If
End Sub 
Sub 保存路徑()
    sTemp2 = objDialog.FileName
    MyArray = Split(sTemp2,"\",-1,1)
    i = UBound(MyArray)
    i1 = 1
    s1 = MyArray(0)
    While i1<i
        s1 = s1 & "\" & MyArray(i1)
        i1 = i1+1
    Wend 
    s1 = s1 & "\"
    Call Plugin.File.WriteINI("setup","路徑",s1,IniFileName)
End Sub 
Sub 讀取路徑()
    DirPath = "c:\"
    DirPath = Plugin.File.ReadINI("setup","路徑",IniFileName)
End Sub
Sub 改名()
    fSourceName = objDialog.FileName
    fTargetName = Replace(fSourceName,".txt",".ini")
End Sub
Sub 格式編輯()
    Set fso = CreateObject("Scripting.FileSystemObject")
    Set fSource = fso.OpenTextFile(fSourceName, ForReading, True)
    Set fTarget = fso.OpenTextFile(fTargetName, ForWriting, True)
    While fSource.AtEndOfStream<>true
        sLine = fSource.ReadLine()
        lineLenOld = Len(sLine)
        s=Trim(sLine)
        lineLenNew = Len(s)
        sTemp1 = Left(s,2)
        sTemp2 = Right(s,Len(s)-2)
        If s="[General]"
            s="[color=" & explainColor & "]" & s
        ElseIf s="[Script]"
            s="[/color][color=" & explainColor & "]" & s & "[/color]"
        ElseIf sTemp1="//"
            s="[color=" & remColor & "]" &s &"[/color]"
        Else 
       	End If
        s = Space(lineLenOld-lineLenNew) & s
        fTarget.WriteLine(s)
    Wend     
    fSource.Close
    fTarget.Close
    Call RunApp(fTargetName)
End Sub
Sub 結束()
	EndScript 
End Sub
