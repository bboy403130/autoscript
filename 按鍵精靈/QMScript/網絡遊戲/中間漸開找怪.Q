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
MacroID=f7305e79-1ff2-4026-b508-2eb567732b9b
Description=中間漸開找怪（區域找色）
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
===找怪腳本===.
【功能說明】.
通用腳本，把全屏分成很多區域找怪！.
.
【使用說明】.
本腳本不能單獨運行，只能結合到遊戲腳本中~啟動熱鍵為<F10>，中止熱鍵為<F12>。.
.
【作者介紹】.
【按鍵專家團 Jimmyzs】.
.
【製作日期】.
<2006-7-26>

[Script]
dim NumA,NumB,NumC,NumK,NumN,CenterX,CenterY,GBX,GBY,StepX,StepY
//NumA--X軸移動的變量，NumB--Y軸移動的變量，NumK--中間變量
NumA=0:NumB=0:NumC=0:CenterX=385:CenterY=310:StepX=82:StepY=66
//CenterX，CenterY---中心坐標(一般是人數) StepY,StepY--步長
//****************************主程序開始**************************************
While NumC<3
    //NumC---三圈， 相當會把找怪範圍會成25個格
    NumN=NumC*8:NumK=0
    //NumN---找怪的格子位置
    While NumK<NumN
        //向下移動
        If NumK>0 and NumK<(NumN/4) Then
            NumB=NumB+1
       	End If
        //向左移動
        If NumK>=(NumN/4) and NumK<(NumN/2) Then
            NumA=NumA-1
       	End If
        //向上移動
        If NumK>=(NumN/2) and NumK<(NumN/4)*3 Then
            NumB=NumB-1
       	End If
        //向右移動
        If NumK>=(NumN/4)*3 and NumK<NumN Then
            NumA=NumA+1
       	End If
        //每一格的中心坐標
        GBX=CenterX+StepX*NumA
        GBY=CenterY+StepY*NumB
        Delay Time/2
        //***************查看運行效果********************
        //如果想看本腳本的執行路線，請打開圖畫，再打把下面三句前的//去掉
        //MoveTo GBX GBY
        //Delay 100
        //LeftClick 1
        //*******************************************
        //×××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××
        //×××××××××××××××××××××××××××××  找怪部分 ××××××××××××××××××××××××××××××
        Call FindColorEx (GBX-StepX/2,GBY-StepY/2,GBX+StepX/2,GBY+StepY/2,"FFFFFF",1,0.6,AX,AY)
        //「FFFFFF」----怪的色，其它部分不要動，這裡也可以改成在（GBX-StepX/2,GBY-StepY/2,GBX+StepX/2,GBY+StepY/2）範圍內找圖片
        Delay Time/2
        If AX>0 Then
            //找到色
            MoveTo AX,AY
            //移動到AX，AY
            //*****判斷是否是怪********
            //gosub Mon
            //<判斷是否是怪>子程序在這裡調用！
            //*************************
            Delay Time
            Goto KillMon
       	End If
        //××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××
        NumK=NumK+1
    Wend    
    NumA=NumA+1:NumC=NumC+1
Wend
//************************************主程序結束***************************************
//*************************************************************************************
//******************** 打怪 ********************
Rem KillMon
//下面請自己添加打怪要的動作
//提示：1。可以先判斷是否是怪。[要判斷的話，就寫個子程序，上面有提示<判斷是否是怪>調用的地方。]
//      2。是怪的話就攻擊，殺死後跳到開始，重新開始找怪；不是的話，就跳到下一格接著找！
