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
MacroID=259b91f2-de51-4a84-ac1c-2e4d9bd77776
Description=方形漸開搜怪
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
===網絡遊戲腳本===.
【功能說明】.
取用方形漸開搜怪核心.
1、可以設置搜怪範圍（鼠標活動範圍，讓鼠標不移動到你所設的範圍外）.
2、可以設置漸開起點坐標（有些遊戲主角坐標並不是屏幕中點的，通過設置漸開起點坐標能保證先搜身邊的怪）.
3、可以設置搜索點密度（合理設置好點距搜怪效率會更好）.
4、可以設置從第幾圈開始搜索.
.
【使用說明】.
根據不同的遊戲，設置好用戶自定義變量就OK了.
參數格式請參照默認設置，X、Y坐標之間用「，」分隔.
.
【作者介紹】.
【按鍵專家團 星帆】.
.
【製作日期】.
2006.9.15

[Script]
UserVar LTop="200,100" "鼠標活動範圍：左上角坐標"
UserVar RBot="700,500" "鼠標活動範圍：右下角坐標"
UserVar Center="300,200" "方形漸開搜怪起點"
UserVar L=20 "2個搜怪點之間的距離"
UserVar M=3 "從第幾圈開始搜索"
//變量定義
Dim s,v,i,n,x,y,a1,b1,a2,b2,c1,c2,x0,y0,k1,k2
//在鼠標左上角活動範圍變量「LTop」內查找逗號，用於區分左上角的X、Y坐標
s=InStr(LTop,",")
//Mid(參數1，參數2，參數3）：從字符串中返回指定數目的字符
//參數1（字符串表達式，從中返回字符）
//參數2（參數1中被提取的字符部分的開始位置）
//參數3（要返回的字符數，若省略將返回字符串中從參數2 到字符串結束的所有字符）
//「Mid(LTop,1,s-1)」從字符串「LTop」中的第1個字符開始取s-1個字符
//int(Mid(LTop,1,s-1)):將取到的字符轉換成整數
//取鼠標活動範圍左上角橫坐標賦值到變量a1
a1=int(Mid(LTop,1,s-1))
//取鼠標活動範圍左上角縱坐標賦值到變量b1
b1=int(Mid(LTop,s+1))
s=InStr(RBot,",")
//取鼠標活動範圍右下角橫坐標賦值到變量a2
a2=int(Mid(RBot,1,s-1))
//取鼠標活動範圍右下角縱坐標賦值到變量b2
b2=int(Mid(RBot,s+1))
s=InStr(Center,",")
//取起點坐標賦值到x0,y0
x0=int(Mid(Center,1,s-1))
y0=int(Mid(Center,s+1))
//比較x0到a1和x0到a2的長度，取最長的距離來限制方形漸開的範圍，保證漸開線能全部覆蓋鼠標活動範圍
If x0-a1>=a2-x0 Then
    n=a1
Else 
    //將x0到a2的距離轉換到左邊，方便下面的While x>=n的循環判斷
    n=x0-(a2-x0)
End If 
Rem 開始搜怪
//將點距賦值到v
v=L
//將漸開起點圈數賦值到i
i=M
//將漸開起點坐標賦值到x,y
x=x0:y=y0-v
While x>=n
    k1=0:k2=v
    For 2
        For i
            x=x+k1:y=y+k2
            //只有（x，y）點在鼠標活動範圍內才移動鼠標和執行顏色變化判斷
            If x>=a1 and x<=a2 and y>=b1 and y<=b2 Then
                //計算出x，y後，先取x，y點的顏色賦值到c1
                c1=GetPixelColor(x,y)
                MoveTo x,y
                Delay 10
                //移動到x,y延時10毫秒後再次取x,y點的顏色並賦值到c2
                c2=GetPixelColor(x,y)
                //如果x,y點的顏色鼠標移動前和鼠標移動後的顏色不同，則執行打怪動作
                If c1<>c2  Then
                    //打怪代碼
                    Delay 1000
                    //打完怪後再重新開始搜索
                    Goto 開始搜怪
                End If 
                Delay 1
            End If 
        Next 
        k1=v:k2=0
    Next
    i=i+1:v=v*(-1)
Wend 
Delay 200
//搜索完鼠標活動範圍後重新開始搜索
Goto 開始搜怪
