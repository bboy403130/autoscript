[Comment]
命令庫是按鍵精靈8.0版推出的全新功能
您可以把自己常用的函數和子程序寫在命令庫裡讓很多個腳本去調用
命令庫最大的優勢是讓多個腳本共享一個命令，修改一處就等於修改多處
目前命令庫功能還在測試當中，有任何建議可以在按鍵精靈論壇提出，網址：http://bbs.ajjl.cn

******注意！這是官方提供的命令庫，請勿修改！避免以後按鍵精靈升級時覆蓋您的修改。******//
******          如需新增命令庫，可在命令庫點擊右鍵選擇「新建」命令庫            ******//


[General]
MacroID=3626b374-83c9-406b-978f-7ef9fe123bc1



[Script]
Sub 鍵盤組合鍵(鍵盤碼,模擬方式)
    //例子：Call lib.鍵盤.鍵盤組合鍵("Ctrl + Alt + A",0)
    //模擬方式：【0普通模擬，1硬件模擬，2超級模擬】
    //更多【按鍵碼】可以自行添加
    Dim 控制鍵,輔助鍵,功能鍵,方向鍵,字母鍵,數字鍵,符號鍵
    控制鍵 = "CTRL 17,ALT 18,SHIFT 16,LCTRL 162,LALT 164,LSHIFT 160,RCTRL 163,RALT 165,RSHIFT 161,WIN 91"
    輔助鍵 = "CTRL 17,ALT 18,SHIFT 16,LCTRL 162,LALT 164,LSHIFT 160,RCTRL 163,RALT 165,RSHIFT 161"
    方向鍵 = "DOWN 40,UP 38,LEFT 37,RIGHT 39"
    功能鍵 = "F1 112,F2 113,F3 114,F4 115,F5 116,F6 117,F7 118,F8 119,F9 120,F10 121,F11 122,F12 123,HOME 36,END 35,PAGEDOWN 34,PAGEUP 33,ESC 27,ENTER 13,SPACE 32"
    字母鍵 = "A 65,B 66,C 67,D 68,E 69,F 70,G 71,H 72,I 73,J 74,K 75,L 76,M 77,N 78,O 79,P 80,Q 81,R 82,S 83,T 84,U 85,V 86,W 87,X 88,Y 89,Z 90"
    數字鍵 = "0 48,1 49,2 50,3 51,4 52,5 53,6 54,7 55,8 56,9 57"
    符號鍵 = "~ 192,` 192,- 189,= 187,[ 219,] 221,\ 220,/ 191,? 191,< 188,> 190"
    //安全檢測1
    Dim 轉成大寫,去掉空格,i
    轉成大寫 = UCase(鍵盤碼)
    去掉空格 = Replace(轉成大寫," ","")
    Dim 分割加號,加號數量
    分割加號 = Split(去掉空格,"+") 
    加號數量 = UBound(分割加號)
    If 加號數量>0 And 加號數量<3 Then        
        If InStr(控制鍵,分割加號(0))>0 And 分割加號(0)<>"" Then 
            //計算控制鍵碼
            Dim 控,控制
            控 = Split(控制鍵,",") 
            For i=0 To UBound(控)
                If InStr(控(i),分割加號(0))>0 Then
                    控制 = Split(控(i)," ")   
                    Exit For 
                End If 
            Next       
            Dim 輔,輔助,按鍵
            If 加號數量 = 1 Then   
                If 分割加號(1)<>分割加號(0) And 分割加號(1)<>"" Then    
                    Dim 合法1(4)
                    合法1(0) = InStr(功能鍵,分割加號(1))
                    合法1(1) = InStr(方向鍵,分割加號(1))
                    合法1(2) = InStr(字母鍵,分割加號(1))
                    合法1(3) = InStr(數字鍵,分割加號(1))
                    合法1(4) = InStr(符號鍵,分割加號(1))
                    //安全檢測2
                    If 合法1(0)>0 Or 合法1(1)>0 Or 合法1(2)>0 Or 合法1(3)>0 Or 合法1(4)>0 Then  
                        //計算按鍵鍵碼
                        輔 = Split(字母鍵,",") 
                        For i=0 To UBound(輔)
                            If InStr(輔(i),分割加號(1) & " ")>0 Then
                                輔助 = Split(輔(i)," ")  
                                Goto 完成1 
                            End If 
                        Next  
                        輔 = Split(數字鍵,",") 
                        For i=0 To UBound(輔)
                            If InStr(輔(i),分割加號(1) & " ")>0 Then
                                輔助 = Split(輔(i)," ") 
                                Goto 完成1 
                            End If 
                        Next         
                        輔 = Split(方向鍵,",") 
                        For i=0 To UBound(輔)
                            If InStr(輔(i),分割加號(1) & " ")>0 Then
                                輔助 = Split(輔(i)," ")   
                                Goto 完成1 
                            End If 
                        Next  
                        輔 = Split(功能鍵,",") 
                        For i=0 To UBound(輔)
                            If InStr(輔(i),分割加號(1) & " ")>0 Then
                                輔助 = Split(輔(i)," ")
                                Goto 完成1 
                            End If 
                        Next 
                        輔 = Split(符號鍵,",") 
                        For i=0 To UBound(輔)
                            If InStr(輔(i),分割加號(1) & " ")>0 Then
                                輔助 = Split(輔(i)," ")  
                                Goto 完成1 
                            End If 
                        Next             
                        Rem 完成1 
                        //按鍵盤組合鍵
                        If 模擬方式 = 0 Then
                            KeyDown Clng(控制(1)), 1
                            KeyPress Clng(輔助(1)), 1
                            KeyUp Clng(控制(1)), 1
                        ElseIf 模擬方式 = 1 Then
                            KeyDownH Clng(控制(1)), 1
                            KeyPressH Clng(輔助(1)), 1
                            KeyUpH Clng(控制(1)), 1
                        ElseIf 模擬方式 = 2 Then 
                            KeyDownS Clng(控制(1)), 1
                            KeyPressS Clng(輔助(1)), 1
                            KeyUpS Clng(控制(1)), 1
                        End If 
                        Exit Sub
                    End If 
                End If 
            ElseIf 加號數量 = 2 Then
                If 分割加號(2)<>分割加號(1) And 分割加號(2)<>"" Then 
                    Dim 合法2(5)
                    合法2(0) = InStr(輔助鍵,分割加號(2))
                    合法2(1) = InStr(功能鍵,分割加號(2))
                    合法2(2) = InStr(方向鍵,分割加號(2))
                    合法2(3) = InStr(字母鍵,分割加號(2))
                    合法2(4) = InStr(數字鍵,分割加號(2))
                    合法2(5) = InStr(符號鍵,分割加號(2))
                    //安全檢測3
                    If 合法2(0)>0 Or 合法2(1)>0 Or 合法2(2)>0 Or 合法2(3)>0 Or 合法2(4)>0 Or 合法2(5)>0 Then
                        //計算按鍵鍵碼
                        輔 = Split(字母鍵,",") 
                        For i=0 To UBound(輔)
                            If InStr(輔(i),分割加號(2) & " ")>0 Then
                                按鍵 = Split(輔(i)," ")  
                                Goto 完成2 
                            End If 
                        Next  
                        輔 = Split(數字鍵,",") 
                        For i=0 To UBound(輔)
                            If InStr(輔(i),分割加號(2) & " ")>0 Then
                                按鍵 = Split(輔(i)," ") 
                                Goto 完成2 
                            End If 
                        Next 
                        輔 = Split(方向鍵,",") 
                        For i=0 To UBound(輔)
                            If InStr(輔(i),分割加號(2) & " ")>0 Then
                                按鍵 = Split(輔(i)," ")   
                                Goto 完成2 
                            End If 
                        Next    
                        輔 = Split(功能鍵,",") 
                        For i=0 To UBound(輔)
                            If InStr(輔(i),分割加號(2) & " ")>0 Then
                                按鍵 = Split(輔(i)," ")
                                Goto 完成2 
                            End If 
                        Next  
                        輔 = Split(符號鍵,",") 
                        For i=0 To UBound(輔)
                            If InStr(輔(i),分割加號(2) & " ")>0 Then
                                按鍵 = Split(輔(i)," ")  
                                Goto 完成2 
                            End If 
                        Next 
                        Rem 完成2
                        //計算輔助鍵碼
                        輔 = Split(輔助鍵,",") 
                        For i=0 To UBound(輔)
                            If InStr(輔(i),分割加號(1) & " ")>0 Then
                                輔助 = Split(輔(i)," ")
                                Exit For 
                            End If 
                        Next  
                        //按鍵盤組合鍵
                        If 模擬方式 = 0 Then
                            KeyDown Clng(控制(1)), 1
                            KeyDown Clng(輔助(1)), 1
                            KeyPress Clng(按鍵(1)), 1
                            KeyUp Clng(輔助(1)), 1
                            KeyUp Clng(控制(1)), 1
                        ElseIf 模擬方式 = 1 Then
                            KeyDownH Clng(控制(1)), 1
                            KeyDownH Clng(輔助(1)), 1
                            KeyPressH Clng(按鍵(1)), 1
                            KeyUpH Clng(輔助(1)), 1
                            KeyUpH Clng(控制(1)), 1
                        ElseIf 模擬方式 = 2 Then
                            KeyDownS Clng(控制(1)), 1
                            KeyDownS Clng(輔助(1)), 1
                            KeyPressS Clng(按鍵(1)), 1
                            KeyUpS Clng(輔助(1)), 1
                            KeyUpS Clng(控制(1)), 1
                        End If 
                        Exit Sub
                    End If 
                End If 
            End If
            //通過安檢            
        End If
    End If 
End Sub


Sub 鍵盤按鍵組(鍵碼組,模擬方式,毫秒延時)
    //例子：Call lib.鍵盤.鍵盤按鍵組("A,B,C,SPACE,D,E,F,G",0,50)
    //模擬方式：【0普通模擬，1硬件模擬，2超級模擬】
    //更多【按鍵碼】可以自行添加
    Dim 控制鍵,輔助鍵,功能鍵,方向鍵,字母鍵,數字鍵,符號鍵,組合鍵
    控制鍵 = "CTRL 17,ALT 18,SHIFT 16,LCTRL 162,LALT 164,LSHIFT 160,RCTRL 163,RALT 165,RSHIFT 161,WIN 91"
    功能鍵 = "F1 112,F2 113,F3 114,F4 115,F5 116,F6 117,F7 118,F8 119,F9 120,F10 121,F11 122,F12 123,HOME 36,END 35,PAGEDOWN 34,PAGEUP 33,ESC 27,ENTER 13,SPACE 32"
    方向鍵 = "DOWN 40,UP 38,LEFT 37,RIGHT 39"
    字母鍵 = "A 65,B 66,C 67,D 68,E 69,F 70,G 71,H 72,I 73,J 74,K 75,L 76,M 77,N 78,O 79,P 80,Q 81,R 82,S 83,T 84,U 85,V 86,W 87,X 88,Y 89,Z 90"
    數字鍵 = "0 48,1 49,2 50,3 51,4 52,5 53,6 54,7 55,8 56,9 57"
    符號鍵 = "~ 192,` 192,- 189,= 187,[ 219,] 221,\ 220,/ 191,? 191,< 188,> 190"
    組合鍵 = 控制鍵 &","& 功能鍵 &","& 方向鍵 &","& 字母鍵 &","& 數字鍵 &","& 符號鍵
    //安全檢測
    Dim 轉成大寫,去掉空格
    轉成大寫 = UCase(鍵碼組)
    去掉空格 = Replace(轉成大寫," ","")
    //參數
    Dim 分割逗號,逗號數量,分割鍵碼,鍵盤,鍵碼數量
    分割逗號 = Split(去掉空格,",")
    逗號數量 = UBound(分割逗號) 
    //鍵庫
    分割鍵碼 = Split(組合鍵,",")
    鍵碼數量 = UBound(分割鍵碼)
    Dim i,k,n
    For i=0 To 逗號數量 
        //計算鍵碼
        For k=0 To 鍵碼數量
            鍵盤 = Split(分割鍵碼(k)," ") 
            If 鍵盤(0) = 分割逗號(i) Then 
                If 模擬方式 = 0 Then 
                    KeyPress Clng(鍵盤(1)), 1
                ElseIf 模擬方式 = 1 Then
                    KeyPressH Clng(鍵盤(1)), 1 
                ElseIf 模擬方式 = 2 Then
                    KeyPressS Clng(鍵盤(1)), 1 
                End If 
                n = Plugin.Sys.GetTime() + 毫秒延時
                Do   
                    Delay 5
                loop Until Plugin.Sys.GetTime() >= n
                Exit For
            End If 
        Next
    Next 
End Sub 




Sub KeyList(鍵碼組,模擬方式,毫秒延時)
    //例子：Call lib.鍵盤.KeyList("aA@2?"">.',/|\=-+_)(*&^QAsD",0,50)
    //需要注意的是：當輸入一個引號時（"）必須輸入一對（""）
    //模擬方式：【0普通模擬，1硬件模擬，2超級模擬】
    Dim 鍵碼(46)
    鍵碼(0) ="a═A═65"
    鍵碼(1) ="b═B═66"
    鍵碼(2) ="c═C═67"
    鍵碼(3) ="d═D═68"
    鍵碼(4) ="e═E═69"
    鍵碼(5) ="f═F═70"
    鍵碼(6) ="g═G═71"
    鍵碼(7) ="h═H═72"
    鍵碼(8) ="i═I═73"
    鍵碼(9) ="j═J═74"
    鍵碼(10)="k═K═75"
    鍵碼(11)="l═L═76"
    鍵碼(12)="m═M═77"
    鍵碼(13)="n═N═78"
    鍵碼(14)="o═O═79"
    鍵碼(15)="p═P═80"
    鍵碼(16)="q═Q═81"
    鍵碼(17)="r═R═82"
    鍵碼(18)="s═S═83"
    鍵碼(19)="t═T═84"
    鍵碼(20)="u═U═85"
    鍵碼(21)="v═V═86"
    鍵碼(22)="w═W═87"
    鍵碼(23)="x═X═88"
    鍵碼(24)="y═Y═89"
    鍵碼(25)="z═Z═90"
    鍵碼(26)="`═~═192"
    鍵碼(27)="1═!═49"
    鍵碼(28)="2═@═50"
    鍵碼(29)="3═#═51"
    鍵碼(30)="4═$═52"
    鍵碼(31)="5═%═53"
    鍵碼(32)="6═^═54"
    鍵碼(33)="7═&═55"
    鍵碼(34)="8═*═56"
    鍵碼(35)="9═(═57"
    鍵碼(36)="0═)═48"
    鍵碼(37)="-═_═189"
    鍵碼(38)="=═+═187"
    鍵碼(39)="[═{═219"
    鍵碼(40)="]═}═221"
    鍵碼(41)="\═|═220"
    鍵碼(42)=";═:═186"
    鍵碼(43)="'═""═222"
    鍵碼(44)=",═<═188"
    鍵碼(45)=".═>═190"
    鍵碼(46)="/═?═191"
    //Dim KeyS()
    Dim 數量,判斷,i,m,n
    數量=Len(鍵碼組)
    ReDim KeyS(數量)
    For i=0 to 數量-1
        KeyS(i)=Mid(鍵碼組,i+1,1)
        判斷=False
        For n=0 to 46
            MyKeyS=Split(鍵碼(n),"═")
            If KeyS(i)=MyKeyS(0) Then
                判斷=True
                If 模擬方式 = 0 Then 
                    KeyPress Clng(MyKeyS(2)), 1
                ElseIf 模擬方式 = 1 Then
                    KeyPressH Clng(MyKeyS(2)), 1
                ElseIf 模擬方式 = 2 Then
                    KeyPressS Clng(MyKeyS(2)), 1
                End If
                Exit For
            ElseIf KeyS(i)=MyKeyS(1) Then ://需要按住Shift鍵來模擬
                判斷=True
                If 模擬方式 = 0 Then 
                    KeyDown 16, 1
                    KeyPress Clng(MyKeyS(2)), 1
                    KeyUp 16, 1
                ElseIf 模擬方式 = 1 Then
                    KeyDownH 16, 1
                    KeyPressH Clng(MyKeyS(2)), 1
                    KeyUpH 16, 1
                ElseIf 模擬方式 = 2 Then
                    KeyDownS 16, 1
                    KeyPressS Clng(MyKeyS(2)), 1
                    KeyUpS 16, 1
                End If
                Exit For
            End If
        Next
        m = Plugin.Sys.GetTime() + 毫秒延時
        Do   
            Delay 5
        loop Until Plugin.Sys.GetTime() >= m
        If 判斷=False Then Exit Sub
    Next
End Sub

//製作：一隻魚
//日期：2009.12.24
//修改：2011.04.06


