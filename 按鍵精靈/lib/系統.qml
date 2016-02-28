[Comment]
命令庫是按鍵精靈8.0版推出的全新功能
您可以把自己常用的函數和子程序寫在命令庫裡讓很多個腳本去調用
命令庫最大的優勢是讓多個腳本共享一個命令，修改一處就等於修改多處
目前命令庫功能還在測試當中，有任何建議可以在按鍵精靈論壇提出，網址：http://bbs.ajjl.cn

******注意！這是官方提供的命令庫，請勿修改！避免以後按鍵精靈升級時覆蓋您的修改。******//
******          如需新增命令庫，可在命令庫點擊右鍵選擇「新建」命令庫            ******//



[General]
MacroID=a2f21d32-ba73-4078-ab71-8b1c505273bd
SyntaxVersion=2
Description=系統

[Script]
//請在下面寫上您的子程序或函數
//寫完保存後，在任一命令庫上點擊右鍵並選擇「刷新」即可


Sub 結束進程(映像名稱)
    //Call Lib.系統.結束進程("notepad.exe")
    Dim strComputer, objWMIService, colProcessList, objProcess
    strComputer = "."
    Set objWMIService = GetObject("winmgmts:\\" & strComputer & "\root\cimv2")
    Set colProcessList = objWMIService.ExecQuery("Select * from Win32_Process Where Name = '" & 映像名稱 & "'")
    For Each objProcess in colProcessList
        objProcess.Terminate
    Next
End Sub


//製作：一隻魚
//日期：2010.10.07
//修改：2010.10.07