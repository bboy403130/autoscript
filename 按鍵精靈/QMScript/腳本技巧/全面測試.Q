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
MacroID=37e7eb1b-8700-4a1d-9279-1b5528ef62bf
Description=全面測試
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

[UIPackage]
UEsDBBQAAgAIAOJ1ET9aowS3HAAAAC8AAAAJABEAVUlQYWNrYWdlVVQNAAeV1EtOldRLTpXUS05jYmBgYIRiFrf8olxWEGHICOIjgXgmBoYfQBoAUEsBAhcLFAACAAgA4nURP1qjBLccAAAALwAAAAkACQAAAAAAAAAAAACAAAAAAFVJUGFja2FnZVVUBQAHldRLTlBLBQYAAAAAAQABAEAAAABUAAAAAAA=


[Script]
AllStartTime = Plugin.Sys.GetTime()
//PutAttachment Call Plugin.*.bmp
set TiShiObj = createobject("WScript.Shell")
Dim NotepadHwnd
dim TestFileFolder,TestFilePath,PaintTitle
TestFileFolder = "c:\Qm_Auto_Test\"
TestFilePath = TestFileFolder & "測試報告.txt"
PaintTitle = "未命名 - 小畫家"
//PaintClass = "MSPaintApp"
PaintViewClass = "AfxFrameOrView42u"
PaintClientClass = "Afx:1000000:8"
NotepadTitle = "未命名 - 記事本"
//NotepadClass = "notepad"
Call Plugin.File.DeleteFolder("c:\Qm_Auto_Test")
Delay 300
Call Plugin.File.CreateFolder("c:\Qm_Auto_Test")
Delay 300
TestItemTitle = "開始測試，請不要移動鼠標"
TiShiXinXi = TestItemTitle
ScRX = 800
ScRY = 600
Call 提示信息()
TestItemNum = 1
Call Plugin.File.WriteFileEx(TestFilePath,"獲取用戶系統配置")
Call 獲取機器詳細硬件信息()
Call 獲取機器主要硬件信息()
Call 用WMI對像列出系統所有進程()
Call Plugin.File.WriteFileEx(TestFilePath,"開始測試")
Call 測試Sys系統插件()
Call 獲取當前鼠標位置()
Call 獲取鼠標形狀()
Call 獲取指定點顏色()
Call 查找顏色()
Call 查找中心顏色()
Call 查找顏色擴展()
Call 讀取內存()
Call 測試Memory內存進程插件()
Call 測試Color顏色插件()
Call 測試File文件插件()
Call 測試Bkgnd後台控制插件()
Call 測試Window窗口插件()
Call 測試Media多媒體插件()
//Call 測試Msg信息提示插件()
//Call 測試Pic圖像插件()
Call 測試Office辦公文檔插件()
//Call 測試Console控制台插件()
Call 測試Encrypt加解密插件()
Call 測試Net網絡插件()
Call 測試Web網頁插件()
AllEndTime = Plugin.Sys.GetTime()
Call Plugin.File.WriteFileEx(TestFilePath,"全部測試結束，總共耗時" & AllEndTime-AllStartTime & "毫秒")
MsgBox "全部測試結束，總共耗時" & AllEndTime-AllStartTime & "毫秒,點確定後查看測試結果！"
Call RunApp(TestFileFolder)
EndScript 
Sub 提示信息()
    Call Plugin.Msg.HideScrTXT()
    Delay 100
    Call Plugin.Msg.ShowScrTXT(0, 0, ScRX, ScRY, TiShiXinXi, "0000FF")
    Call Plugin.Msg.Tips(TiShiXinXi)
    TracePrint TiShiXinXi
    Delay 100
End Sub
Sub 截圖()
    TiShiXinXi = ScreenSnapShotTitle
    Call 提示信息()
    Call Plugin.Pic.PrintScreen(0, 0, ScRX, ScRY, TestFileFolder & ScreenSnapShotTitle & ".jpg")
End Sub
Sub 開始測試()
    TiShiXinXi = TestItemTitle & "測試開始！"
    Call 提示信息()
    StartTime=Plugin.Sys.GetTime()
    Call Plugin.File.WriteFileEx(TestFilePath,TestItemNum & "." & TiShiXinXi & vbcrlf & "[code]")
    TestItemNum = TestItemNum + 1
End Sub 
Sub 結束測試()
    TiShiXinXi = TestItemTitle & "測試結束！"
    EndTime=Plugin.Sys.GetTime()
    Call 提示信息()
    Call Plugin.File.WriteFileEx(TestFilePath,TiShiXinXi & "●執行速度為：" & EndTime-StartTime & "毫秒" & vbcrlf & "[/code]" & vbcrlf)
End Sub 
Sub 獲取機器詳細硬件信息()
    TestItemTitle = "獲取機器詳細硬件信息"
    Call 開始測試()
    VBSBegin 
        al=""
        set ws=createobject("wscript.shell")
        set fso2=createobject("scripting.filesystemobject")
        ws.run"cmd /c systeminfo >>c:\sys.txt",0,true
        set file2=fso2.opentextfile("c:\sys.txt")
        al=file2.readall
        file2.close
        fso2.deletefile("c:\sys.txt")
    VBSEnd 
    Call Plugin.File.WriteFileEx(TestFilePath,al & vbcrlf)
    Call 結束測試()
End Sub 
Sub 獲取機器主要硬件信息()
    TestItemTitle = "獲取機器主要硬件信息"
    Call 開始測試()
    VBSBegin 
        all=""
        temp=0
        set wshshell=createObject("wscript.shell")
        '啟動WMI服務(沒有這個服務就不行)
        wshshell.run ("%comspec% /c regsvr32 /s scrrun.dll"),0,True
        wshshell.run ("%comspec% /c sc config winmgmt start= auto"),0,True
        wshshell.run ("%comspec% /c net start winmgmt"),0
        strComputer = "."
        Set objWMIService = GetObject("winmgmts:\\" & strComputer & "\root\cimv2")
        '主板
        set board =objwmiservice.execQuery("select * from win32_baseboard")
        for each item in board
            board2=board2 & "主板:" & item.Product
        next
        'CPU
        set cpu =objwmiservice.execQuery("select * from win32_processor")
        for each item in cpu
            cpu2= cpu2 & "CPU:" & item.Name
        next
        '內存
        Set colItems = objWMIService.ExecQuery("Select * from Win32_PhysicalMemory", Null ,48)
        For Each objItem in colItems
            a=objitem.capacity
            temp=temp+objitem.capacity
            n=n+1
        Next
        memory1=temp/1048576
        if n=1 then
            memory2= "內存: " & n & "條" &a&"M"
        else
            memory2= "內存: " & n & "條" &a&"M"&" 總計"&memory1&"M"
        end if
        '硬盤
        set disk =objwmiservice.execQuery("select * from win32_diskdrive")
        for each item in disk
            disk2= disk2&"硬盤: " & item.Model&" "
        next
        '顯卡
        set video =objwmiservice.execQuery("select * from win32_videocontroller",Null,48)
        for each item in video
            video2= video2&"顯卡: " & item.Description
        next
        '網卡
        Set colItems = objWMIService.ExecQuery("Select * from Win32_NetworkAdapter",Null,48)
        For Each objItem in colItems
            if (left(objItem.NetConnectionID,4)="本地連接") then
                lanname=lanname & objItem.Name
            end if
        Next
        lan2="網卡: " & lanname
    VBSEnd 
    Call Plugin.File.WriteFileEx(TestFilePath,board2)
    Call Plugin.File.WriteFileEx(TestFilePath,cpu2)
    Call Plugin.File.WriteFileEx(TestFilePath,memory2)
    Call Plugin.File.WriteFileEx(TestFilePath,disk2)
    Call Plugin.File.WriteFileEx(TestFilePath,video2)
    Call Plugin.File.WriteFileEx(TestFilePath,lan2)
    Call Plugin.File.WriteFileEx(TestFilePath,all)
    Call 結束測試()
End Sub
Sub 用WMI對像列出系統所有進程()
    TestItemTitle = "用WMI對像列出系統所有進程"
    Call 開始測試()
    Set WMI = GetObject("WinMgmts:")
    Set objs = WMI.InstancesOf("Win32_Process")
    stt=stt & vbcrlf & "For Each obj In objs "
    stt=stt & vbcrlf & "Enum1 =  Enum1 & obj.Description & vbcrlf"
    stt=stt & vbcrlf & "Next"
    Execute(stt)
    Call Plugin.File.WriteFileEx(TestFilePath,Enum1)
    Call 結束測試()
End Sub
Sub 測試Sys系統插件()
    TestItemTitle="Sys插件"
    Call 開始測試()
    OS = Plugin.Sys.GetOSType()
    If OS=0 Then
        Call Plugin.File.WriteFileEx(TestFilePath,"您的操作系統版本是Windows 95/98")
    ElseIf OS=1 Then
        Call Plugin.File.WriteFileEx(TestFilePath,"您的操作系統版本是Windows ME/NT/2K/XP")
    ElseIf OS=2 Then
        Call Plugin.File.WriteFileEx(TestFilePath,"您的操作系統版本是Windows 2003")
    ElseIf OS=3 Then
        Call Plugin.File.WriteFileEx(TestFilePath,"您的操作系統版本是Windows 2008")
        PaintTitle = "未命名 - 小畫家"
        PaintClientClass = "Afx:130000:8"
    ElseIf OS=4 Then
        Call Plugin.File.WriteFileEx(TestFilePath,"您的操作系統版本是Windows Vista")
        PaintTitle = "未命名 - 小畫家"
        PaintClientClass = "Afx:1d0000:8"
    ElseIf OS=5 Then
        Call Plugin.File.WriteFileEx(TestFilePath,"您的操作系統版本是Windows 7")
        PaintTitle = "未命名 - 小畫家"
        PaintViewClass = "MSPaintView"
        PaintClientClass = "Afx:9c0000:8"
    ElseIf OS=6 Then
        Call Plugin.File.WriteFileEx(TestFilePath,"您的操作系統版本是Windows CE")
    Else 
        Call Plugin.File.WriteFileEx(TestFilePath,"不能識別當前操作系統版本")
    End If 
    ScRX=Plugin.Sys.GetScRX()
    Call Plugin.File.WriteFileEx(TestFilePath,"您的當前屏幕分辨率寬度：" & ScRX)
    ScRY=Plugin.Sys.GetScRY()
    Call Plugin.File.WriteFileEx(TestFilePath,"您的當前屏幕分辨率高度：" & ScRY)
    ScDep=Plugin.Sys.GetScDep()
    Call Plugin.File.WriteFileEx(TestFilePath,"您的當前屏幕色彩深度：" & ScDep)
    s=Plugin.Sys.GetTime()
    xs=int(s/1000/60/60)
    fz=int(s/1000/60)-xs*60
    m=Clng(s/1000)-fz*60-xs*60*60
    Call Plugin.File.WriteFileEx(TestFilePath,"您的操作系統從啟動到目前的時間：" & xs & "小時" & fz & "分鐘" & m & "秒")
    HDDSN = Plugin.Sys.GetHDDSN()
    Call Plugin.File.WriteFileEx(TestFilePath,"您的硬盤序列號是：" & hex(HDDSN))
    CurrentPath = Plugin.Sys.GetDir(0)
    Call Plugin.File.WriteFileEx(TestFilePath,"獲得當前路徑為：" & CurrentPath)
    Call Plugin.Sys.SetCLB("測試設置剪切板內容")
    Call Plugin.File.WriteFileEx(TestFilePath,"測試設置剪切板內容")
    Clipboard = Plugin.Sys.GetCLB()
    Call Plugin.File.WriteFileEx(TestFilePath,"讀取剪切板內容：" & Clipboard)
    Call 結束測試()
End Sub
Sub 測試File文件插件()
    TestItemTitle="File"
    Call 開始測試()
    fileINI = "C:\QmTestINI.ini"
    Call Plugin.File.WriteINI("Command", "Val", "兼容性測試", fileINI)
    Delay 300
    IsFile = Plugin.File.IsFileExit(fileINI)
    If IsFile = True Then
        txt="目標文件創建成功"
        Text = Plugin.File.ReadINI("Command", "Val", fileINI)
    Else 
        txt="目標文件創建失敗"
    End If 
    Call Plugin.File.WriteFileEx(TestFilePath,fileINI & txt & " 讀寫內容為：" & Text)
    filePath = TestFileFolder & "Log.txt"
    fileHandle=Plugin.File.OpenFile(filePath)
    If fileHandle=-1 Then
        Call Plugin.File.WriteFileEx(TestFilePath,"●創建文件" & filePath & "失敗")
    Else 
        Call Plugin.File.WriteFileEx(TestFilePath,"☆創建文件" & filePath & "成功,返回句柄："& fileHandle)
    End If 
    Call Plugin.File.SeekFile(fileHandle,0)
    Call Plugin.File.WriteFileEx(TestFilePath,"定位到文件開頭")
    Text = "您好，歡迎使用按鍵精靈測試腳本"
    Call Plugin.File.WriteFile(fileHandle,Text)
    Call Plugin.File.WriteFileEx(TestFilePath,"寫入文本：" & Text)
    Text = "下面開始測試"
    Call Plugin.File.WriteLine(fileHandle,Text)
    Call Plugin.File.WriteFileEx(TestFilePath,"寫入一行文本：" & Text)
    Call Plugin.File.CloseFile(fileHandle)
    Call Plugin.File.WriteFileEx(TestFilePath,"☆關閉文件" & filePath)
    Length = Plugin.File.GetFileLength(filePath)
    Call Plugin.File.WriteFileEx(TestFilePath,filePath & "文件長度為：" & Length)
    fileHandle=Plugin.File.OpenFile(filePath)
    If fileHandle=-1 Then
        Call Plugin.File.WriteFileEx(TestFilePath,"●創建文件" & filePath & "失敗")
    Else 
        Call Plugin.File.WriteFileEx(TestFilePath,"☆創建文件" & filePath & "成功,返回句柄：" & fileHandle)
    End If 
    file20byte=Plugin.File.ReadFile(fileHandle,20)
    Call Plugin.File.WriteFileEx(TestFilePath,"讀取20個字符：" & file20byte)
    fileline=Plugin.File.ReadLine(fileHandle)
    Call Plugin.File.WriteFileEx(TestFilePath,"讀取一行字符：" & fileline)
    Call Plugin.File.CloseFile(fileHandle)
    Call Plugin.File.WriteFileEx(TestFilePath,"☆關閉文件" & filePath)
    fileBak = TestFileFolder & "Log.bak"
    Call Plugin.File.CopyFile(filePath, fileBak)
    Delay 300
    IsFile = Plugin.File.IsFileExit(fileBak)
    If IsFile=True Then
        Call Plugin.File.WriteFileEx(TestFilePath,"將" & filePath & "複製到" & fileBak & "成功")
    Else 
        Call Plugin.File.WriteFileEx(TestFilePath,"●將" & filePath & "複製到" & fileBak & "失敗")
    End If 
    Call Plugin.File.MoveFile(fileINI, TestFileFolder & "QmTestINI.ini")
    Delay 300
    IsFile = Plugin.File.IsFileExit(fileINI)
    If IsFile=True Then
        Call Plugin.File.DeleteFile(fileINI)
        Call Plugin.File.WriteFileEx(TestFilePath,"●移動文件失敗，刪除" & fileINI)
    Else 
        Call Plugin.File.WriteFileEx(TestFilePath,"移動文件" & fileINI & "成功")
    End If 
    TestPath = TestFileFolder & "Test"
    Call Plugin.File.CreateFolder(TestPath)
    Delay 300
    IsFile = Plugin.File.IsFileExit(TestPath)
    If IsFile=0 Then
        Call Plugin.File.DeleteFolder(TestPath)
        Call Plugin.File.WriteFileEx(TestFilePath,"創建文件夾成功，刪除文件夾" & TestPath)
    Else 
        Call Plugin.File.WriteFileEx(TestFilePath,"●創建文件夾失敗")
    End If 
    fileBakup = TestFileFolder & "Log.bakup"
    Call Plugin.File.ReNameFile(fileBak, fileBakup)
    Call Plugin.File.WriteFileEx(TestFilePath,"●將" & fileBak & "改名為" & fileBakup)
    Call Plugin.File.SetAttrib(fileBakup, 0)
    Call Plugin.File.SetDate(fileBakup, "2009-2-19 10:10:10")
    Call Plugin.File.WriteFileEx(TestFilePath,"●將" & fileBakup & "修改日期改為2009-2-19 10:10:10")
    //下面命令需要用戶操作
    //    Call Plugin.filepath = File.SelectFile()
    //    Call Plugin.File.WriteFileEx(TestFilePath, "您所選擇的文件是：" & filepath)
    //    Call Plugin.dirPath = File.SelectDirectory()
    //    Call Plugin.File.WriteFileEx(TestFilePath, "您所選擇的目錄是：" & dirPath)
    Call 結束測試()
End Sub
Sub 測試Bkgnd後台控制插件()
    TestItemTitle="Bkgnd"
    Call 開始測試()
    PaintPath="mspaint.exe"
    Call RunApp(PaintPath)
    Call Plugin.File.WriteFileEx(TestFilePath, "運行程序：" & PaintPath)
    Delay 1000
    PaintHwnd=Plugin.Window.Find(0,PaintTitle)
    If PaintHwnd = 0 Then
        Delay 1000
        PaintHwnd=Plugin.Window.Find(0,PaintTitle)
    End If 
    If PaintHwnd = 0 Then
        Call Plugin.File.WriteFileEx(TestFilePath,"☆" & PaintPath & "運行失敗")
    Else 
        Call Plugin.File.WriteFileEx(TestFilePath,"☆" & PaintPath & "運行成功，句柄為：" & PaintHwnd)
        SubHwnd=Plugin.Window.FindEx(PaintHwnd, 0, PaintViewClass, 0)
        SubHwnd=Plugin.Window.FindEx(SubHwnd, 0, PaintClientClass, 0)
        Call Plugin.File.WriteFileEx(TestFilePath,"畫圖區句柄為：" & SubHwnd)
        x = 10
        y = 50
        For 5
            Call Plugin.Bkgnd.LeftClick(SubHwnd, x, y)
            x = x + 10
            y = y + 10
            Delay 100
        Next  
        x = 30
        y = 50
        For 5
            Call Plugin.Bkgnd.LeftDoubleClick(SubHwnd, x, y)
            x = x + 10
            y = y + 10
        Next  
        Call Plugin.File.WriteFileEx(TestFilePath, "後台鼠標模擬結束")
        Call 模擬鼠標操作()
        Color1 = Plugin.Bkgnd.GetPixelColor(SubHwnd, 5, 5)		
        Call Plugin.File.WriteFileEx(TestFilePath,"窗口" & SubHwnd & "(坐標:5,5)處的顏色=" & Color1)
        XY = Plugin.Bkgnd.FindColor(SubHwnd, 0, 0, 700,550,"FFFFFF")
        ZB = InStr(XY, "|")
        X = Clng(Left(XY, ZB - 1)): Y = Clng(Right(XY, Len(XY) - ZB))
        Call Plugin.File.WriteFileEx(TestFilePath,"FindColor查找窗口" & SubHwnd & "顏色:FFFFFF的X坐標="& X & ",Y坐標=" & Y)
        XY = Plugin.Bkgnd.FindColorEx(SubHwnd, 0, 0, 700,550,"FFFFFF", 0, 0.9)
        ZB = InStr(XY, "|")
        X = Clng(Left(XY, ZB - 1)): Y = Clng(Right(XY, Len(XY) - ZB))
        Call Plugin.File.WriteFileEx(TestFilePath,"FindColorEx模糊查找窗口" & SubHwnd & "顏色:FFFFFF的X坐標="& X & ",Y坐標=" & Y)
        XY = Plugin.Bkgnd.FindCenterColor(SubHwnd, 0, 0, 700,550,"FFFFFF")
        ZB = InStr(XY, "|")
        X = Clng(Left(XY, ZB - 1)): Y = Clng(Right(XY, Len(XY) - ZB))
        Call Plugin.File.WriteFileEx(TestFilePath,"FindCenterColor查找窗口" & SubHwnd & "顏色:FFFFFF的X坐標="& X & ",Y坐標=" & Y)
        ScreenSnapShotTitle = "模擬鼠標操作和找色功能結果"
        Call Plugin.File.WriteFileEx(TestFilePath,"模擬鼠標操作和後台找色功能測試結束,關閉畫圖程序,測試結果請查看截圖:" & ScreenSnapShotTitle)
        Call 截圖()
        Call Plugin.Window.Close(PaintHwnd)
        Call Plugin.File.WriteFileEx(TestFilePath,"☆" & PaintPath & "關閉成功")
    End If 
    NotepadPath = "notepad.exe"
    Call RunApp(NotepadPath)
    Call Plugin.File.WriteFileEx(TestFilePath, "運行程序：" & NotepadPath)
    Delay 1000
    NotepadHwnd=Plugin.Window.Find(0,NotepadTitle)
    If NotepadHwnd = 0 Then
        Delay 1000
        NotepadHwnd=Plugin.Window.Find(0,NotepadTitle)
    End If 
    If NotepadHwnd = 0 Then
        Call Plugin.File.WriteFileEx(TestFilePath,"☆" & NotepadPath & "運行失敗")
    Else 
        Call Plugin.File.WriteFileEx(TestFilePath,"☆" & NotepadPath & "運行成功，句柄為：" & NotepadHwnd)
        Call 模擬鍵盤操作()
        SubHwnd=Plugin.Window.FindEx(NotepadHwnd, 0, "Edit", 0)
        If SubHwnd=0 Then
            Call Plugin.File.WriteFileEx(TestFilePath,"●沒有找到子窗口句柄")
        Else 
            Call Plugin.File.WriteFileEx(TestFilePath,"查到到的可輸入區句柄為：" & SubHwnd)
            InputText="後台模擬鍵盤操作測試信息："
            Call Plugin.Bkgnd.SendString(SubHwnd, InputText)
            For 5
                Call Plugin.Bkgnd.KeyPress(SubHwnd, 65)
                Delay 100
            Next  
            Call Plugin.Bkgnd.KeyDown(SubHwnd, 13)
            Call Plugin.Bkgnd.KeyUp(SubHwnd, 13)
            Call Plugin.File.WriteFileEx(TestFilePath,InputText & "aaaaa")
        End If 
    End If 
    Call 結束測試()
End Sub 
Sub 測試Window窗口插件()
    TestItemTitle="Window"
    Call 開始測試()
    InputText = "窗口模擬鍵盤輸入測試信息："
    Call Plugin.Window.SendString(SubHwnd, InputText)
    For 5
        Call Plugin.Window.SendKeyPress(SubHwnd, 66)
        Delay 50
    Next  
    Call Plugin.Window.SendKeyDown(SubHwnd, 13)
    Call Plugin.Window.SendKeyUp(SubHwnd, 13)
    Call Plugin.File.WriteFileEx(TestFilePath,InputText & "bbbbb")
    ScreenSnapShotTitle = "模擬鍵盤相關操作結果"
    Call Plugin.File.WriteFileEx(TestFilePath,"模擬鍵盤相關操作已完成，請查看截圖:" & ScreenSnapShotTitle)
    Call 截圖()
    path=Plugin.Window.GetExePath(NotepadHwnd)
    Call Plugin.File.WriteFileEx(TestFilePath,"記事本路徑是：" & path)
    Call Plugin.Window.Active(NotepadHwnd)
    Call Plugin.File.WriteFileEx(TestFilePath,"激活窗口" & NotepadHwnd)
    Delay 100
    Hwnd = Plugin.Window.Foreground()
    Call Plugin.File.WriteFileEx(TestFilePath,"●得到當前最前面窗口句柄為：" & Hwnd)
    Delay 100
    Call Plugin.Window.Min(NotepadHwnd)
    Call Plugin.File.WriteFileEx(TestFilePath,"最小化窗口" & NotepadHwnd)
    Delay 100
    Call Plugin.Window.Restore(NotepadHwnd)
    Call Plugin.File.WriteFileEx(TestFilePath,"還原窗口" & NotepadHwnd)
    Delay 100
    Call Plugin.Window.Max(NotepadHwnd)
    Call Plugin.File.WriteFileEx(TestFilePath,"最大化窗口" & NotepadHwnd)
    Delay 100
    Call Plugin.Window.Restore(NotepadHwnd)
    Call Plugin.File.WriteFileEx(TestFilePath,"還原窗口" & NotepadHwnd)
    Delay 100
    Call Plugin.Window.Hide(NotepadHwnd)
    Call Plugin.File.WriteFileEx(TestFilePath,"隱藏窗口" & NotepadHwnd)
    Delay 100
    Call Plugin.Window.Show(NotepadHwnd)
    Call Plugin.File.WriteFileEx(TestFilePath,"顯示窗口" & NotepadHwnd)
    Delay 100
    Call Plugin.Window.Top(NotepadHwnd, 0)
    Call Plugin.File.WriteFileEx(TestFilePath,"置前窗口" & NotepadHwnd)
    Delay 100
    Call Plugin.Window.Top(NotepadHwnd, 1)
    Call Plugin.File.WriteFileEx(TestFilePath,"取消置前窗口" & NotepadHwnd)
    Delay 100
    MousePointHwnd = Plugin.Window.MousePoint()
    Call Plugin.File.WriteFileEx(TestFilePath,"得到鼠標指向窗口句柄為：" & MousePointHwnd)
    Delay 100
    Rect = Plugin.Window.GetWindowRect(NotepadHwnd)
    Call Plugin.File.WriteFileEx(TestFilePath,"得到窗口" & NotepadHwnd & "的邊框大小(包括標題欄)為：" & Rect)
    Dim MyArray
    MyArray = Split(Rect, "|")
    W1 = Clng(MyArray(0)): H1 = Clng(MyArray(1))
    W2 = Clng(MyArray(2)): H2 = Clng(MyArray(3))
    Call Plugin.File.WriteFileEx(TestFilePath,"得到窗口" & NotepadHwnd & "的邊框大小(包括標題欄)為：" &  W2-W1 & "*" & H2-H1)
    Delay 100
    Rect = Plugin.Window.GetClientRect(NotepadHwnd)
    Call Plugin.File.WriteFileEx(TestFilePath,"獲取到客戶區大小為：" & Rect)
    MyArray = Split(Rect, "|")
    L = Clng(MyArray(0)): T = Clng(MyArray(1))
    R = Clng(MyArray(2)): B = Clng(MyArray(3))
    Call Plugin.File.WriteFileEx(TestFilePath,"客戶區大小為：" & R-L & "*" & B-T)
    Delay 100
    Call Plugin.Window.Size(NotepadHwnd, 100, 100)
    Call Plugin.File.WriteFileEx(TestFilePath,"改變窗口" & NotepadHwnd & "大小為100*100")
    Delay 100
    Call Plugin.Window.Size(NotepadHwnd, W2-W1, H2-H1)
    Call Plugin.File.WriteFileEx(TestFilePath,"改變窗口" & NotepadHwnd & "大小為" &  W2-W1 & "*" & H2-H1)
    Delay 100
    Call Plugin.Window.Move(NotepadHwnd, 100, 100)
    Call Plugin.File.WriteFileEx(TestFilePath,"移動窗口到(100,100)位置")
    Delay 100
    Window1 = Plugin.Window.IsWindow(NotepadHwnd)
    If Window1 = 1 Then
        Call Plugin.File.WriteFileEx(TestFilePath,"窗口" & NotepadHwnd & "已打開")
    Else 
        Call Plugin.File.WriteFileEx(TestFilePath,"●窗口" & NotepadHwnd & "沒有打開")
    End If 
    Title = Plugin.Window.GetText(NotepadHwnd)
    If Title="" Then
        Call Plugin.File.WriteFileEx(TestFilePath,"●窗口" & NotepadHwnd & "標題獲取失敗")
    Else 
        Call Plugin.File.WriteFileEx(TestFilePath,"窗口" & NotepadHwnd & "標題為：" & Title)
    End If 
    ClassName = Plugin.Window.GetClass(NotepadHwnd)
    If ClassName="" Then
        Call Plugin.File.WriteFileEx(TestFilePath,"●窗口" & NotepadHwnd & "類名獲取失敗")
    Else 
        Call Plugin.File.WriteFileEx(TestFilePath,"窗口" & NotepadHwnd & "類名為：" & ClassName)
    End If 
    HwndEx = Plugin.Window.Search("記事本")
    If HwndEx="" Then
        Call Plugin.File.WriteFileEx(TestFilePath,"●沒有找到符合的窗口句柄")
    Else 
        Call Plugin.File.WriteFileEx(TestFilePath,"查找到的窗口句柄為：" & HwndEx)
    End If 
    MyArray = Split(HwndEx, "|")
    If UBound(MyArray)>=0  Then
        For i=0 To UBound(MyArray)-1
            Call Plugin.File.WriteFileEx(TestFilePath,"第" & i+1 & "個窗口句柄為：" & Clng(MyArray(i)))
        Next 
    End If 
    Call Plugin.Window.Close(NotepadHwnd)
    Call Plugin.File.WriteFileEx(TestFilePath,"☆" & NotepadPath & "關閉成功")
    Call 結束測試()
End Sub
Sub 測試Office辦公文檔插件()
    TestItemTitle="Office"
    Call 開始測試()
    set oExcel = createobject("Excel.Application")
    If TypeName(oExcel) = "Application" Then
        Text = "Office測試"
        XmlPath = TestFileFolder & "測試.xls"
        Call Plugin.Office.WriteXls(1, 1, 1, Text, XmlPath)
        Call Plugin.File.WriteFileEx(TestFilePath,"向" & XmlPath & "寫入文本：" & Text)
        Text = Plugin.Office.ReadXls(1, 1, 1, XmlPath)
        Call Plugin.File.WriteFileEx(TestFilePath,"從" & XmlPath & "Excel文檔工作表(1)單元格(1, 1)讀出內容:" & Text)
    Else 
        Call Plugin.File.WriteFileEx(TestFilePath,"●電腦上未安裝Office辦公軟件")
    End If 
    Call 結束測試()
End Sub
Sub 獲取當前鼠標位置()
    Call GetCursorPos(x,y)
    If x>=0 Then
        Call Plugin.File.WriteFileEx(TestFilePath,"當前鼠標的位置是：" & x &","& y)
    Else 
        Call Plugin.File.WriteFileEx(TestFilePath,"●未能得到當前鼠標位置")
    End If 
End Sub
Sub 獲取指定點顏色()
    color1=GetPixelColor(100,100)
    If color1="" Then
        Call Plugin.File.WriteFileEx(TestFilePath,"●未能得到坐標點:100,100的顏色值")
    Else 
        Call Plugin.File.WriteFileEx(TestFilePath,"坐標點:100,100的顏色值是：" & color1)
    End If 
End Sub
Sub 查找顏色()
    Call FindColor(0,0,ScRX,ScRY,"FFFFFF",x,y)
    If x>=0 Then
        Call Plugin.File.WriteFileEx(TestFilePath,"在0,0," & ScRX & "," & ScRY & "的區域中已尋找到'FFFFFF'顏色。")
    Else 
        Call Plugin.File.WriteFileEx(TestFilePath,"●未能在0,0," & ScRX & "," & ScRY & "的區域中尋找到'FFFFFF'顏色。")
    End If 
End Sub 
Sub 查找中心顏色()
    Call FindCenterColor(0,0,ScRX,ScRY,"FFFFFF",x,y)
    If x>=0 Then
        Call Plugin.File.WriteFileEx(TestFilePath,"在0,0," & ScRX & "," & ScRY & "的區域中已尋找到'FFFFFF'顏色。")
    Else 
        Call Plugin.File.WriteFileEx(TestFilePath,"●未能在0,0," & ScRX & "," & ScRY & "的區域中尋找到'FFFFFF'顏色。")
    End If 
End Sub
Sub 查找顏色擴展()
    Call FindColorEx(0,0,ScRX,ScRY,"FFFFFF",0,0.9,x,y)
    If x>=0 Then
        Call Plugin.File.WriteFileEx(TestFilePath,"在0,0," & ScRX & "," & ScRY & "的區域中從左至右開始已尋找到'FFFFFF'顏色。")
    Else 
        Call Plugin.File.WriteFileEx(TestFilePath,"●未能在0,0," & ScRX & "," & ScRY & "的區域中從左至右開始尋找到'FFFFFF'顏色。")
    End If 
    Delay 1000
    Call FindColorEx(0,0,ScRX,ScRY,"FFFFFF",1,0.9,x,y)
    If x>=0 Then
        Call Plugin.File.WriteFileEx(TestFilePath,"在0,0," & ScRX & "," & ScRY & "的區域中從中心開始已尋找到'FFFFFF'顏色。")
    Else 
        Call Plugin.File.WriteFileEx(TestFilePath,"●未能在0,0," & ScRX & "," & ScRY & "的區域從中心開始尋找到'FFFFFF'顏色。")
    End If 
    Delay 1000
    Call FindColorEx(0,0,ScRX,ScRY,"FFFFFF",2,0.9,x,y)
    If x>=0 Then
        Call Plugin.File.WriteFileEx(TestFilePath,"在0,0," & ScRX & "," & ScRY & "的區域中從右至左開始已尋找'FFFFFF'顏色。")
    Else 
        Call Plugin.File.WriteFileEx(TestFilePath,"●未能在0,0," & ScRX & "," & ScRY & "的區域中從右至左開始尋找到'FFFFFF'顏色。")
    End If 
End Sub 
Sub 查找圖片()
    Call FindPic(0,50,1023,767,"winmine.bmp",0.9,intX,intY)
    If intX>0 and intY>0 Then
        Call Plugin.File.WriteFileEx(TestFilePath,"能在" & ScRX & "X" & ScRY & "的分辨率內尋找到掃雷程序的笑臉圖形")
    Else 
        Call Plugin.File.WriteFileEx(TestFilePath,"●不能在" & ScRX & "X" & ScRY & "的分辨率內尋找到掃雷程序的笑臉圖形")
    End If 
End Sub 
Sub 讀取內存()
    Call ReadMemory(&h400000,2,val)
    Call Plugin.File.WriteFileEx(TestFilePath,"讀取內存地址&h400000的結果是："& CStr(val))
End Sub 
Sub 獲取鼠標形狀()
    shape=GetCursorShape(0)
    Call Plugin.File.WriteFileEx(TestFilePath,"當前鼠標的特徵碼是:" & shape)
End Sub 
Sub 模擬鼠標操作()
    Call Plugin.Window.Max(PaintHwnd)
    Call Plugin.File.WriteFileEx(TestFilePath,"最大化窗口" & PaintHwnd)
    Delay 100
    Call Plugin.Window.Active(PaintHwnd)
    Call Plugin.File.WriteFileEx(TestFilePath,"激活窗口" & PaintHwnd)
    Delay 100
    KeyDown 17,1
    KeyPress 69,1
    KeyUp 17,1
    Delay 100
    SayString "500"
    Delay 50
    KeyPress 9,1
    SayString "500"
    Delay 50
    KeyPress 13,1
    Delay 50
    MoveTo 150,200
    Delay 50
    For 5
        MoveR 10,10
        Delay 50
        LeftClick 1
        Delay 50
    Next 
    Call Plugin.File.WriteFileEx(TestFilePath,"普通鼠標模擬結束")
    Delay 50
    MoveTo 200,200
    Delay 50
    For 5
        MoveRS 10,10
        Delay 50
        LeftClickS 1
        Delay 50
    Next 
    Call Plugin.File.WriteFileEx(TestFilePath,"超級鼠標模擬結束")
    Delay 50
    MoveTo 300,200
    Delay 50
    For 5
        MoveRH 10,10
        LeftClickH 1
        Delay 50
    Next  
    Call Plugin.File.WriteFileEx(TestFilePath,"硬件鼠標模擬結束")
End Sub
Sub 模擬鍵盤操作()
    Call Plugin.Window.Active(NotepadHwnd)
    Delay 300
    SayString "普通模擬:"
    Delay 50
    For 5
        KeyPress 65,1
        Delay 50
    Next  
    KeyPress 13,1
    Call Plugin.File.WriteFileEx(TestFilePath,"普通鍵盤模擬:aaaaa")
    Delay 50
    SayString "超級模擬:"
    Delay 50
    For 5
        KeyPressS 66,1
        Delay 50
    Next 
    KeyPressS 13,1
    Call Plugin.File.WriteFileEx(TestFilePath,"超級鍵盤模擬:bbbbb")
    Delay 50
    SayString "硬件模擬:"
    Delay 50
    For 5
        KeyPressH 67,1
        Delay 50
    Next 
    KeyPressH 13,1
    Call Plugin.File.WriteFileEx(TestFilePath,"硬件鍵盤模擬:ccccc")
End Sub 
Sub TestFindNumber()
    dh_x=916:dh_y=5
    Normal1X=array(dh_x+4,dh_x+1,dh_x,dh_x+4,dh_x+3,dh_x+2,dh_x+1)
    Normal1Y=array(dh_y,dh_y+1,dh_y+2,dh_y+2,dh_y+3,dh_y+4,dh_y+5)
    jx=0
    zuobiao1_i=0
    zuobiao1_y=0
    //    VBSCall zuobiao1_n=getnum(Normal1X,Normal1Y,jx,"FFFFFF")
    If zuobiao1_n < 10 Then
        zuobiao1_y = zuobiao1_y * 10 + zuobiao1_n
    End If 
    For 3
        jx=jx+6
        zuobiao1_n=getnum(Normal1X,Normal1Y,jx,"FFFFFF")
        If zuobiao1_n < 10 Then
            zuobiao1_y = zuobiao1_y * 10 + zuobiao1_n
        End If 
    Next 
    myx=abs(zuobiao1_y)
    Normal2X=array(dh_x+4+50,dh_x+1+50,dh_x+50,dh_x+4+50,dh_x+3+50,dh_x+2+50,dh_x+1+50)
    Normal2Y=array(dh_y,dh_y+1,dh_y+2,dh_y+2,dh_y+3,dh_y+4,dh_y+5)
    jx=0
    zuobiao2_i=0
    zuobiao2_y=0
    zuobiao2_n=getnum(Normal2X,Normal2Y,jx,"FFFFFF")
    If zuobiao2_n < 10 Then
        zuobiao2_y = zuobiao2_y * 10 + zuobiao2_n
    End If 
    For 3
        jx=jx+6
        zuobiao2_n=getnum(Normal2X,Normal2Y,jx,"FFFFFF")
        If zuobiao2_n < 10 Then
            zuobiao2_y = zuobiao2_y * 10 + zuobiao2_n
        End If 
    Next  
    myy=abs(zuobiao2_y)
End Sub
Sub 測試Media多媒體插件()
    TestItemTitle="Media"
    Call 開始測試()
    Call Plugin.Media.Beep(523, 200)
    Call Plugin.Media.Beep(578, 200)
    Call Plugin.Media.Beep(659, 200)
    Call Plugin.Media.Beep(698, 200)
    Call Plugin.Media.Beep(784, 200)
    Call Plugin.Media.Beep(880, 200)
    Call Plugin.Media.Beep(988, 200)
    Call Plugin.File.WriteFileEx(TestFilePath,"Beep播放結束")
    Call Plugin.Media.Play("C:\WINDOWS\Media\Windows XP 啟動.wav")
    Call Plugin.File.WriteFileEx(TestFilePath,"開始播放音樂")
    Call Plugin.Media.Vol(50)
    Call Plugin.File.WriteFileEx(TestFilePath,"設置聲音大小為：50")
    Call Plugin.Media.Stop()
    Call Plugin.File.WriteFileEx(TestFilePath,"停止播放音樂")
    Call 結束測試()
End Sub
Sub 測試Msg信息提示插件()
    TestItemTitle="Msg"
    Call 開始測試()
    PU=0
    //For 1
    Call Plugin.Msg.HideScrTXT()
    Call Plugin.File.WriteFileEx(TestFilePath,"刷新屏幕")
    Delay 300
    Call Plugin.Msg.ShowScrTXT(0, 0, ScRX, ScRY, "屏幕內容填寫  "& PU, "0000FF")
    ScreenSnapShotTitle = "Msg插件測試結果"
    Call Plugin.File.WriteFileEx(TestFilePath,"屏幕輸出內容：屏幕內容填寫  " & PU & "，輸出結果請看截圖:" & ScreenSnapShotTitle)
    Call 截圖()
    Delay 300
    PU=PU+1
    //Next 
    Call 結束測試()
End Sub
Sub 測試Color顏色插件()
    TestItemTitle="Color"
    Call 開始測試()
    Call Plugin.Color.ColorToRGB("0000FF", R, G, B)
    Call Plugin.File.WriteFileEx(TestFilePath,"16進制顏色(0000FF)轉換分解到10進制(R:" & R & ",G:" & G &",B:" & B & ")")
    Color1 = Plugin.Color.GetRGB(255, 0, 0)
    Call Plugin.File.WriteFileEx(TestFilePath,"10進制顏色(255,0,0)轉換為16進制顏色：" & Color1)
    Call Plugin.Color.ColorToHSL("0000FF", H, S, L)
    Call Plugin.File.WriteFileEx(TestFilePath,"16進制顏色(0000FF)轉換分解到10進制(H:" & H & ",S:" & S & ",L:" & L & ")")
    NUM = Plugin.Color.CountColor(0, 0, ScRX, ScRY, "FFFFFF",1)
    Call Plugin.File.WriteFileEx(TestFilePath,"顏色(FFFFFF)的數量=" & NUM)
    XY = Plugin.Color.FindMutiColor(0, 0, ScRX, ScRY, "FFFFFF", "2|0|FFFFFF,-6|1|FFFFFF,-3|1|FFFFFF,-6|3|FFFFFF,-3|3|FFFFFF,0|3|FFFFFF,4|3|FFFFFF,-1|5|FFFFFF,3|5|FFFFFF,-3|6|FFFFFF,-6|7|FFFFFF,1|8|FFFFFF,4|8|FFFFFF,-5|10|FFFFFF,-3|10|FFFFFF,4|10|FFFFFF", 1)
    ZB = InStr(XY, "|")
    X = Clng(Left(XY, ZB - 1)): Y = Clng(Right(XY, Len(XY) - ZB))
    Call Plugin.File.WriteFileEx(TestFilePath,"屏幕多點找色功能：找屏幕""我""字位置為：" & X &","& Y)
    XY = Plugin.Color.FindShape(0, 0, ScRX, ScRY, "5|0|1,4|1|1,7|1|1,-2|2|1,8|2|1,4|3|1,0|4|1,3|5|1,5|5|1,-2|6|1,0|6|1,3|7|1,6|7|1,0|8|1,5|9|1,-2|10|1,0|10|1,2|10|1,8|10|1", 1)
    ZB = InStr(XY, "|")
    X = Clng(Left(XY, ZB - 1)): Y = Clng(Right(XY, Len(XY) - ZB))
    Call Plugin.File.WriteFileEx(TestFilePath,"屏幕找圖形形狀功能：找屏幕""按""字位置為：" & X & "," & Y)
    ScreenSnapShotTitle = "Color插件測試結果"
    Call Plugin.File.WriteFileEx(TestFilePath,"Color(顏色)插件測試結束,測試結果請查看截圖:" & ScreenSnapShotTitle)
    Call 截圖()
    Call 結束測試()
End Sub
Sub 測試Console控制台插件()
    TestItemTitle="Console"
    Call 開始測試()
    Call Plugin.Console.Open()
    Call Plugin.File.WriteFileEx(TestFilePath,"打開控制台窗口")
    Call Plugin.Console.WriteLine("控制台測試開始，請隨意輸入幾個字符，然後按回車")
    Call Plugin.File.WriteFileEx(TestFilePath,"控制台測試開始，請隨意輸入幾個字符，然後按回車")
    ReadLine = Plugin.Console.ReadLine()
    Call Plugin.File.WriteFileEx(TestFilePath,"讀取文本：" & ReadLine)
    Call Plugin.Console.WriteLine("演示腳本結束，退出控制台" & vbcrlf)
    Call Plugin.File.WriteFileEx(TestFilePath,"演示腳本結束，退出控制台" & vbcrlf)
    Call Plugin.Console.Close()
    Call Plugin.File.WriteFileEx(TestFilePath,"關閉控制台窗口")
    Call 結束測試()
End Sub
Sub 測試Pic圖像插件()
    TestItemTitle="Pic"
    Call 開始測試()
    Call Plugin.Pic.PrintScreen(0, 0, ScRX, ScRY, TestFileFolder & "PIC.bmp")
    Call Plugin.File.WriteFileEx(TestFilePath,"截圖保存到(" & TestFileFolder & "PIC.bmp)")
    Delay 200
    Call Plugin.Pic.PrintScreen(0, 0, ScRX, ScRY, TestFileFolder & "PIC.jpg")
    Call Plugin.File.WriteFileEx(TestFilePath,"截圖保存到(" & TestFileFolder & "PIC.jpg)")
    Call 結束測試()
End Sub
Sub 測試Memory內存進程插件()
    TestItemTitle="Memory"
    Call 開始測試()
    WinminePath = "winmine.exe"
    WinmineTitle = "踩地雷"
    Call RunApp(WinminePath)
    Delay 1000
    WinmineHwnd=Plugin.Window.Find(0,WinmineTitle)
    If WinmineHwnd = 0 Then
        Delay 1000
        WinmineHwnd=Plugin.Window.Find(0,WinmineTitle)
    End If 
    If WinmineHwnd=0 Then
        Call Plugin.File.WriteFileEx(TestFilePath,"☆" & WinminePath & "運行失敗")
    Else 
        Call 查找圖片()
        Call Plugin.File.WriteFileEx(TestFilePath,"☆" & WinminePath & "運行成功，句柄為：" & WinmineHwnd)
        Call Plugin.Memory.SetProcessLive(WinmineHwnd, 4)
        Call Plugin.File.WriteFileEx(TestFilePath,"設置進程優先級為(高於標準(A)")
        Live = Plugin.Memory.GetProcessLive(WinmineHwnd)
        Call Plugin.File.WriteFileEx(TestFilePath,"進程優先級為："& Live)
        Dim x, y
        x=Plugin.Memory.Read32Bit(WinmineHwnd,&h1005334)
        y=Plugin.Memory.Read32Bit(WinmineHwnd,&h1005338)
        Call Plugin.File.WriteFileEx(TestFilePath, "掃雷的長與寬的格子數量為：" & x & "  *  " & y & "格")
        strview = ""        
        ClickX = 18
        ClickY = 56
        Call Plugin.Bkgnd.LeftClick(WinmineHwnd,ClickX,ClickY)
        For i = 0 To y-1
            For j = 0 To x-1
                Val = Plugin.Memory.Read8Bit(WinmineHwnd,&h1005360+(j+i*32+1))
                If Val = &h8F or Val = &h8A Then
                    strview = strview & " *"
                    Call Plugin.Bkgnd.RightClick(WinmineHwnd,ClickX + 16*j,ClickY + 16*i)
                Else 
                    strview = strview & " @"
                    Call Plugin.Bkgnd.LeftClick(WinmineHwnd,ClickX + 16*j,ClickY + 16*i)
                End If 
            Next 
            strview = strview & vbcrlf
        Next 
        strview = strview & "說明：@代表安全，*代表雷"
        Call Plugin.File.WriteFileEx(TestFilePath,strview)
        Val = Plugin.Memory.Read8Bit(WinmineHwnd, &H400000)
        Call Plugin.File.WriteFileEx(TestFilePath, "讀取8位內存數值(&H400000)內存地址"& Val)
        Val = Plugin.Memory.Read16Bit(WinmineHwnd, &H400000)
        Call Plugin.File.WriteFileEx(TestFilePath, "讀取16位內存數值(&H400000)內存地址"& Val)
        Val = Plugin.Memory.ReadSingle(WinmineHwnd,&h1005338)
        Call Plugin.File.WriteFileEx(TestFilePath, "讀取32位內存浮點數值(&h1005338)內存地址"& Val)
        Val = Plugin.Memory.ReadDouble(WinmineHwnd, &H400000)
        Call Plugin.File.WriteFileEx(TestFilePath, "讀取64位內存浮點數值(&H400000)內存地址"& Val)
        z = Plugin.Memory.ReadString(WinmineHwnd, &H7D7A45B4, 2)
        Call Plugin.File.WriteFileEx(TestFilePath, "搜索到第一個""雷""字內存地址為：&H" & Hex(DiZhi))
        Val = Plugin.Memory.Find8Bit(WinmineHwnd, 100, &H400000, &H600000, 2)
        Call Plugin.File.WriteFileEx(TestFilePath, "8位內存數值(100)地址："& Val)
        Val = Plugin.Memory.Find16Bit(WinmineHwnd, 100, &H400000, &H600000, 2)
        Call Plugin.File.WriteFileEx(TestFilePath, "16位內存數值(100)地址："& Val)
        Val = Plugin.Memory.Find32Bit(WinmineHwnd, 100, &H400000, &H600000, 2)
        Call Plugin.File.WriteFileEx(TestFilePath, "32位內存數值(100)地址："& Val)
        DiZhi = Plugin.Memory.FindString(WinmineHwnd, "雷", &H7D7045B4, &H7D8045B4, 2)
        Call Plugin.File.WriteFileEx(TestFilePath, "搜索到第一個""雷""字內存地址為：&H" & Hex(DiZhi))
        ScreenSnapShotTitle = "Memory插件測試結果"
        Call Plugin.File.WriteFileEx(TestFilePath,"Memory插件測試結束,測試結果請看截圖:" & ScreenSnapShotTitle)
        Call 截圖()
        Call Plugin.Memory.TerminateProc(WinmineHwnd)
        Call Plugin.File.WriteFileEx(TestFilePath,"☆" & WinminePath & "關閉成功")
    End If 
    Call 結束測試()
End Sub
Sub 測試Encrypt加解密插件()
    TestItemTitle = "Encrypt"
    Call 開始測試()
    TextMD5 = Plugin.Encrypt.Md5String("按鍵精靈")
    Call Plugin.File.WriteFileEx(TestFilePath,"字符串：按鍵精靈 轉換為MD5為：" & TextMD5)
    MD5FilePath = TestFileFolder & "log.txt"
    FileMD5 = Plugin.Encrypt.Md5File(MD5FilePath)
    Call Plugin.File.WriteFileEx(TestFilePath,MD5FilePath & "轉換為MD5為：" & FileMD5)
    Call 結束測試()
End Sub
Sub 測試Net網絡插件()
    TestItemTitle = "Net"
    Call 開始測試()
    Call 結束測試()
End Sub
Sub 測試Web網頁插件()
    TestItemTitle = "Web"
    Call 開始測試()
    Call 結束測試()
End Sub
