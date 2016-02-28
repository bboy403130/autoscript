[Comment]
命令庫是按鍵精靈8.0版推出的全新功能
您可以把自己常用的函數和子程序寫在命令庫裡讓很多個腳本去調用
命令庫最大的優勢是讓多個腳本共享一個命令，修改一處就等於修改多處
目前命令庫功能還在測試當中，有任何建議可以在按鍵精靈論壇提出，網址：http://bbs.ajjl.cn

******注意！這是官方提供的命令庫，請勿修改！避免以後按鍵精靈升級時覆蓋您的修改。******//
******          如需新增命令庫，可在命令庫點擊右鍵選擇「新建」命令庫            ******//


[General]
MacroID=dc62cde5-acb9-4b09-8c9d-53e637884bab

[Script]
Sub 移動(a,b)
    MoveTo a,b
    Delay 1000
    Call lib.測試.Yidong(500,200)
End Sub
Sub Yidong(a,b)
    MoveTo a,b
End Sub
Sub 連接(a,b)
    msgbox a & "   " & b
End Sub
Function 加法(a,b)
    加法 = a + b
End Function
Sub 彈出窗口()
    Call Lib.窗口.彈出對話框("彈出窗口a", 9000, "這是在窗口庫中實現的", 0)
End Sub 



