[General]
SyntaxVersion=2
BeginHotkey=32771
BeginHotkeyMod=0
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=123
StopHotkeyMod=0
RunOnce=1
EnableWindow=
MacroID=f6abbc5e-1f86-40cb-b54a-8c6e6aab8d9a
Description=鼠標熱鍵功能
Enable=0
AutoRun=0
[Repeat]
Type=1
Number=1943232333
[SetupUI]
Type=2
QUI=
[Relative]
SetupOCXFile=
[Comment]
.
【功能說明】.
主要用來演示鼠標熱鍵的有趣之處，在屏幕畫圓.
.
【使用說明】.
雙擊鼠標左鍵即可在屏幕畫圓，按下中止熱鍵即可中止.
.
【作者介紹】.
vrBrothers.Leo.
感謝使用按鍵精靈.
.
【製作日期】.
2006.9.
.

[Script]
//例子:用鼠標畫一個圓
Gosub 畫圓
Sub 畫圓()
    r=300:x0=512:y0=384:x=0:y=0:n=0
    While n<3.1415926*2
        x=x0+r*cos(n)
        y=y0-r*sin(n)
        MoveTo x,y
        Delay 5
        n=n+0.03
    Wend 
End sub
