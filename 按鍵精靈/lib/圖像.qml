[Comment]
命令庫是按鍵精靈8.0版推出的全新功能
您可以把自己常用的函數和子程序寫在命令庫裡讓很多個腳本去調用
命令庫最大的優勢是讓多個腳本共享一個命令，修改一處就等於修改多處
目前命令庫功能還在測試當中，有任何建議可以在按鍵精靈論壇提出，網址：http://bbs.ajjl.cn

******注意！這是官方提供的命令庫，請勿修改！避免以後按鍵精靈升級時覆蓋您的修改。******//
******          如需新增命令庫，可在命令庫點擊右鍵選擇「新建」命令庫            ******//



[General]
MacroID=d5e279c7-3d49-44d8-ba83-c1700ece0c96

[Script]
Function 查找屏幕圖片數量(左坐標,上坐標,右坐標,下坐標,圖片路徑,相似度)
    //例子：MsgBox lib.圖像.查找屏幕圖片數量(0,0,800,300,"C:\圖標.bmp",0.9)
    //A1.B1.C1.D1  是為了便於設置找圖的範圍
    Dim A1,B1,C1,D1,a,b,c,d,n,x,y,H
    A1=左坐標
    B1=上坐標
    C1=右坐標
    D1=下坐標
    //(a.b.c.d)不要修改
    a=A1: b=B1: c=C1: d=D1
    //n是圖片的數量
    n=0
    Rem 循環搜索
    Call FindPic(a,b,c,d,圖片路徑,相似度,x,y)
    If (x>=0 and y>=0 and y=b and a=A1) Or (x>=0 and y>=0 and y=b and a<>A1) Or (x>=0 and y>=0 and a=A1 and y<>b) Then
        n=n+1: H=y:  a=x+1: b=y
        Goto 循環搜索
    ElseIf a>A1 Then
        a=A1: b=H+1
        Goto 循環搜索
    End If 
    查找屏幕圖片數量 = n
End Function
Sub 無限屏幕截圖(左坐標,上坐標,右坐標,下坐標,保存圖片路徑,文件格式)
    //例子：Call lib.圖像.無限屏幕截圖(0,0,100,100,"C:\","bmp")
    Dim 時間
    時間=Year(Now)& Month(Now)& Day(Now)& Hour(Now)& Minute(Now)& Second(Now)
    Call Plugin.Pic.PrintScreen(左坐標,上坐標,右坐標,下坐標,保存圖片路徑 & 時間 & "." & 文件格式)
End Sub



//製作：一隻魚
//日期：2009.12.22



