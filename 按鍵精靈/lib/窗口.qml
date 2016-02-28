[Comment]
命令庫是按鍵精靈8.0版推出的全新功能
您可以把自己常用的函數和子程序寫在命令庫裡讓很多個腳本去調用
命令庫最大的優勢是讓多個腳本共享一個命令，修改一處就等於修改多處
目前命令庫功能還在測試當中，有任何建議可以在按鍵精靈論壇提出，網址：http://bbs.ajjl.cn

******注意！這是官方提供的命令庫，請勿修改！避免以後按鍵精靈升級時覆蓋您的修改。******//
******          如需新增命令庫，可在命令庫點擊右鍵選擇「新建」命令庫            ******//


[General]
MacroID=45322cb5-c49c-4570-97d6-48c53e5170ed

[Script]
Function 得到鼠標在窗口上位置()
    //例子：MsgBox lib.窗口.得到鼠標在窗口上位置()
    Dim 鼠標下句柄,x,y,坐標
    鼠標下句柄 = Plugin.Window.MousePoint()
    Call GetCursorPos(x,y)
    坐標 = Plugin.Window.GetClientRect(鼠標下句柄)
    Dim MyArray
    MyArray = Split(坐標, "|")
    得到鼠標在窗口上位置 = x - Clng(MyArray(0)) & "|" & y - Clng(MyArray(1)) 
End Function

Function 彈出對話框(提示內容,等待時間,提示標題,顯示樣式)
    //例子：MsgBox "你選擇的是：" & lib.窗口.彈出對話框("提示內容",0,"提示標題",68)
    //詳細使用參考這裡：http://bbs.vrbrothers.com/viewthread.php?tid=7662
    Dim obj
    Set obj = CreateObject("WScript.Shell")
    彈出對話框=Cint(obj.Popup(提示內容,等待時間,提示標題,顯示樣式))
    Set obj = Nothing
End Function





//製作：一隻魚
//日期：2009.12.22
//修改：2010.01.19


