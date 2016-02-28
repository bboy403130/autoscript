[General]
SyntaxVersion=2
MacroID=1f3dfae4-1654-4de0-a32c-37e85ed16fd8
[Comment]
命令庫是按鍵精靈8.0版推出的全新功能
您可以把自己常用的函數和子程序寫在命令庫裡讓很多個腳本去調用
命令庫最大的優勢是讓多個腳本共享一個命令，修改一處就等於修改多處
目前命令庫功能還在測試當中，有任何建議可以在按鍵精靈論壇提出，網址：http://bbs.ajjl.cn

******注意！這是官方提供的命令庫，請勿修改！避免以後按鍵精靈升級時覆蓋您的修改。******//
******          如需新增命令庫，可在命令庫點擊右鍵選擇「新建」命令庫            ******//




[Script]
Function 讀取指定行文本內容(文本路徑, 行數)
    //例子：Msgbox lib.文件.讀取指定行文本內容("C:\Log.txt", 3)
    Dim fso,myfile,i,flag,tempp 
    flag = 1
    Set fso=CreateObject("scripting.FileSystemObject")
    If fso.FileExists(文本路徑) then
        Set myfile = fso.openTextFile(文本路徑,1,false)
    Else
        flag = 0
    End If
    For i=1 To 行數 - 1
        If Not myfile.AtEndOfLine Then
            myfile.SkipLine
            tempp = myfile.Line
        End If
    Next
    If flag = 1 Then
        If Not myfile.AtEndOfLine Then
            讀取指定行文本內容 = myfile.ReadLine
        Else
            讀取指定行文本內容 = "溢出！"
        End If
        myfile.close
    Else
        讀取指定行文本內容 = "文件不存在！"
    End If
    Set fso = Nothing
End Function
Sub 刪除指定行文本內容(文本路徑, 行數)
    //例子：Call lib.文件.刪除指定行文本內容("C:\log.txt",5)
    Dim ForReading ,ForWriting 
    ForReading = 1
    ForWriting = 2
    Dim objFSO,objFile,strLine,strNewFile
    Set objFSO = CreateObject("Scripting.FileSystemObject")
    Set objFile = objFSO.OpenTextFile(文本路徑,ForReading)
    Do Until objFile.AtEndOfStream
        strLine = objFile.Readline       
        If 行數 = objFile.Line-1 or 行數 = 0 then 
            strNewFile = strNewFile 
        Else
            strNewFile = strNewFile & strLine & vbcrlf
        End If
    Loop
    objFile.Close
    Set objFile = objFSO.OpenTextFile(文本路徑,ForWriting)
    objFile.Write strNewFile
    objFile.Close
    Set objFSO = Nothing
End Sub
Sub 替換指定行文本內容(文本路徑, 文本內容, 行數)
    //例子：Call lib.文件.替換指定行文本內容("C:\log.txt","文本內容",5)
    Dim ForReading ,ForWriting 
    ForReading = 1
    ForWriting = 2
    Dim objFSO,objFile,strLine,strNewFile
    Set objFSO = CreateObject("Scripting.FileSystemObject")
    Set objFile = objFSO.OpenTextFile(文本路徑,ForReading)
    Do Until objFile.AtEndOfStream
        strLine = objFile.Readline  
        If 行數 = objFile.Line-1 or 行數 = 0 then
            strNewFile = strNewFile & 文本內容 & vbcrlf
        Else
            strNewFile = strNewFile & strLine & vbcrlf
        End If
    Loop
    objFile.Close
    Set objFile = objFSO.OpenTextFile(文本路徑,ForWriting)
    objFile.Write strNewFile
    objFile.Close
    Set objFSO = Nothing
End Sub
Sub 插入文本內容到指定行(文本路徑, 文本內容, 行數)
    //例子：Call lib.文件.插入文本內容到指定行("C:\log.txt","文本內容",5)
    Dim ForReading ,ForWriting 
    ForReading = 1
    ForWriting = 2
    Dim objFSO,objFile,strLine,strNewFile
    Set objFSO = CreateObject("Scripting.FileSystemObject")
    Set objFile = objFSO.OpenTextFile(文本路徑,ForReading)
    Do Until objFile.AtEndOfStream
        strLine = objFile.Readline       
        strNewFile = strNewFile & strLine & vbcrlf
        If 行數 = objFile.Line-1 or 行數 = 0 then
            strNewFile = strNewFile & 文本內容 & vbcrlf
        End If
    Loop
    objFile.Close
    Set objFile = objFSO.OpenTextFile(文本路徑,ForWriting)
    objFile.Write strNewFile
    objFile.Close
    Set objFSO = Nothing
End Sub
Function 遍歷指定目錄下所有文件名(文件夾路徑)
    //注意：返回的是數組變量，存儲著每一個文件名。
    //例子：數組 = lib.文件.遍歷指定目錄下所有文件名("C:\")
    //      For i=0 to UBound(數組)-1
    //          TracePrint 數組(i)
    //      Next
    Dim 文件名,fso,folder,f,files
    文件名 = ""
    Set fso = CreateObject("Scripting.FileSystemObject")
    Set folder = fso.getfolder(文件夾路徑)
    Set files = folder.files
    For Each f In files
        文件名 = 文件名 & f.name & ","
    Next
    Set fso = Nothing
    //遍歷指定目錄下所有文件名 = 文件名
    遍歷指定目錄下所有文件名 = Split(文件名, ",")
End Function
Function 遍歷指定目錄下所有文件夾名(文件夾路徑)
    //注意：返回的是數組變量，存儲著每一個文件夾名。
    //例子：數組 = lib.文件.遍歷指定目錄下所有文件夾名("C:\")
    //      For i=0 to UBound(數組)-1
    //          TracePrint 數組(i)
    //      Next
    Dim 文件夾名,fso,folder,f,files
    文件夾名 = ""
    Set fso = CreateObject("Scripting.FileSystemObject")
    Set folder = fso.getfolder(文件夾路徑)
    Set files = folder.SubFolders
    For Each f In files
        文件夾名 = 文件夾名 & f.name & ","
    Next
    Set fso = Nothing
    //遍歷指定目錄下所有文件夾名 = 文件夾名
    遍歷指定目錄下所有文件夾名 = Split(文件夾名, ",")
End Function
Function 判斷文件夾是否存在(文件夾路徑)
    //例子：Msgbox lib.文件.判斷文件夾是否存在("c:\WINDOWS")
    Dim fso 
    Set fso = CreateObject("Scripting.FileSystemObject")
    判斷文件夾是否存在 = fso.FolderExists(文件夾路徑)
    Set fso = Nothing
End Function



//製作：一隻魚
//日期：2009.12.22
//修改：2011.05.03


