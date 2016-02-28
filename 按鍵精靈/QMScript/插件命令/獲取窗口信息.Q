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
MacroID=b41b7dd1-10a0-47a3-9935-7183c8a34224
Description=獲取窗口信息
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
　　該腳本查找當前窗口的子窗體，包括按鈕、標籤、圖像、列表框等，並將這些子窗體的窗口句柄、類名、坐標信息，保存到c盤根目錄下的log.txt文件中。.
.
【詳細說明】.
　　該腳本主要舉例說明以下功能：.
　　1、文本文件的讀寫操作。.
　　2、Window插件的調用演示。.
　　3、如何從一個長字符串中，按特定的格式分解出所需要的數據——Split函數使用.
　　4、數組元素的使用方法。.
5、循環語句的使用。.
　　4、如何調用軟件（RunApp的使用）。.
.
【作者介紹】.
ahfxman.
.
【製作日期】.
2006年9月.
.

[Script]
//先定義變量是一個好習慣
dim handle,handle1, s,s1,s2,s3, MyArray,parentH, fileHandle
set TiShiObj = createobject("WScript.Shell")
//=================== 主程序 ======================
//創建一個文件名為
fileHandle ="c:\log.txt"
//調用子程序
Call 查找窗體()
//用筆記本軟件打開剛才保存的文件
Call RunApp(fileHandle)
Rem 結束
//彈出對話框,顯示程序結束
Call TiShiObj.Popup("程序終止運行",3,"3秒後窗口自動關閉",0)
//msgbox "程序終止運行",64,"程序終止運行"
//程序結束
EndScript 
//================== 子程序 ========================
Sub 查找窗體()
    //獲取當前窗口的句柄
    parentH = Plugin.Window.Foreground()
    //如果當前無窗口,則結束程序
    If parentH = 0 Then
        Call MessageBox("沒有找到父窗口，程序結束")
        //Goto 結束
    End If 
    //變量初始化
    handle=1
    handle1=0
    //一直循環查找到子窗口,直到找不到為止
    While handle<>0
        //查找當前窗口的子窗口
        handle = Plugin.Window.FindEx(parentH, handle1,0,0)
        //如果找到子窗口
        If handle <> 0 Then
            //獲取子窗口的信息, GetClientRect 返回的信息是一個字符串, 格式如:123|356|200|400
            s = Plugin.Window.GetClientRect(handle)
            //按|對上面的字符串進行分割, 並保存到數組裡面
            //Split進行分割後, MyArray數組中的數組如下:
            // MyArray(0) = 123  <---窗口的左邊坐標
            // MyArray(1) = 356  <---窗口的上邊坐標
            // MyArray(2) = 200  <---窗口的寬度
            // MyArray(3) = 400  <---窗口的高度
            //注意: 數組的第一個元素, 讀取的時候是 MyArray(0), 而不是  MyArray(1)
            //即數組元素的下標是從 0 開始, 而不是從 1 開始的
            dim MyArray
            MyArray = Split(s, "|", -1, 1)
            //用 & 連字符, 將各數組連接起來
            s = "坐標(x,y)：" & MyArray(0) & "," & MyArray(1) & " 寬度，高度：" & MyArray(2) & "," & MyArray(3)
            //獲取窗口的類名稱
            s1 = Plugin.Window.GetClass(handle)
            s1 = "類名: " & s1
            //獲取窗口的標題
            s2 = Plugin.Window.GetText(handle)
            s2 = ",標題：" & s2
            s3 = " 句柄： " & CStr(handle)
            //保存上面的各種信息寫到文件中,即c:\log.txt
            If fileHandle <> -1 Then
                Call Plugin.File.WriteFileEx(fileHandle, s1 & s2 & s & s3)
            End If 
        End If 
        //更新handle1的值,以保證循環繼續
        handle1 = handle
    Wend 
End Sub
