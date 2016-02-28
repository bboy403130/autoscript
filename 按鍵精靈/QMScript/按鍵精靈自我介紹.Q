[General]
SyntaxVersion=2
BeginHotkey=57
BeginHotkeyMod=2
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=123
StopHotkeyMod=0
RunOnce=1
EnableWindow=
MacroID=992ef3b9-b20f-43c2-bebd-d1280e7b5fa1
Description=按鍵精靈自我介紹
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
===通用腳本===.
【功能說明】.
介紹按鍵精靈最基本的功能，包括打開一個程序、模擬按鍵、延時、鼠標移動、鼠標點擊、鼠標相對移動、保存/恢復鼠標位置、if判斷語句、等待按鍵功能.
.
【使用說明】.
按下熱鍵即可啟動腳本，之後請按照腳本提示進行操作.
.
【製作日期】.
05年05月05日

[Script]
//點擊編輯界面的註釋按鈕，即可看到比較詳細的腳本說明
Call RunApp("notepad")
Delay 2000
StringDelay=1000
//最大化寫字板
KeyDown "Alt", 1
KeyPress "F", 1
KeyUp "Alt", 1
Delay 500
KeyPress "Left", 1
Delay 500
KeyPress "X", 1
SayString "hi，你好，我是""按鍵精靈""，我是個很有趣的軟件，如果你願意花5分鐘的時間來瞭解我，你一定會喜歡上我的。 :-)"
KeyPress "Enter", 1
Delay StringDelay
SayString "願意瞭解我嗎？如果願意，請你按下鍵盤上的Y鍵，如果不喜歡我，那就按下鍵盤上的N鍵（等待按鍵...）"
KeyPress "Enter", 1
Do
    //等待按鍵
    key=WaitKey()
    KeyPress "Enter", 1
    TracePrint "用戶按下的鍵是：" & key
    If key=78 Then
        Call GuanBiChuangKou()
        //按下n不保存，直接關閉
        Delay 1000
        KeyPress "N", 1
        Delay 1000
        Call 腳本結束()
    ElseIf key=89 Then
        Exit do
    Else 
        SayString "請按Y或者N，不要按其他鍵(等待按鍵...)"
        KeyPress "Enter", 1
    End If 
loop
//結束等待
SayString "哈哈，我太高興了，又多了一個喜歡我的朋友，那我先來一個自我介紹吧。"
KeyPress "Enter", 1
Delay StringDelay
SayString "我叫「按鍵精靈」，我的爸爸是偉大的兄弟工作組，我在網上有個家，地址是www.anjian.com，歡迎來做客哦"
KeyPress "Enter", 1
Delay StringDelay
SayString "嗯，好像廢話多了些，如果不希望我繼續廢話，請按一下鍵盤，隨便哪個鍵都可以啦（等待按鍵...）"
KeyPress "Enter", 1
key=WaitKey()
KeyPress "Enter", 1
SayString "嘿嘿，按鍵了吧。其實我的本領就是讓你按一下鍵盤，就可以作很多動作。不過你好像還有點不太理解哦"
KeyPress "Enter", 1
Delay StringDelay
SayString "嗯"
For 6
    SayString "."
    Delay 500
Next 
SayString "讓我想想怎麼解釋給你"
For 6
    SayString "."
    Delay 500
Next 
KeyPress "Enter", 1
SayString "哈，有了，我把一些好朋友使用我的例子介紹給你吧，想聽的話就再按一下鍵盤吧（等待按鍵...）"
KeyPress "Enter", 1
key = WaitKey()
KeyPress "Enter", 1
SayString "呵呵，其實我最多的朋友是玩遊戲的朋友，特別是玩網絡遊戲的朋友。"
KeyPress "Enter", 1
Delay StringDelay
SayString "在遊戲裡，經常要做一些重複的動作，比如反覆按鼠標和鍵盤，有了我就輕鬆啦，我可以代替你按鍵盤和鼠標。"
KeyPress "Enter", 1
Delay StringDelay
SayString "我還很聰明的，只要你稍微熟悉我一些，就可以讓我作出很多聰明的動作，比如在遊戲裡面自動找怪物打怪物。"
KeyPress "Enter", 1
Delay StringDelay
SayString "由於我只是模仿人們雙手的操作，所以我和那些萬惡的外掛是堅決劃清界限的，大家一定要支持我啊"
KeyPress "Enter", 1
Delay StringDelay
SayString "除了玩家之外，我還有很多朋友，比如有的把我當作日常辦公的小助手，減輕了很多工作，可惜不給我發工資。"
KeyPress "Enter", 1
Delay StringDelay
SayString "總之，我很有用啦，雙手可以做到的事情，我都可以代勞，如果你發現有些事情雙手做起來很累，就交給我吧！"
KeyPress "Enter", 1
KeyPress "Enter", 1
Delay StringDelay
SayString "啊，囉嗦了很多啦，下面我還是手把手的告訴你一些我的具體能力吧。"
KeyPress "Enter", 1
Delay StringDelay
SayString "先把我的廢話都清空，嘻嘻，隨便按一個鍵看我本事吧（等待按鍵...）"
KeyPress "Enter", 1
key = WaitKey()
KeyPress "Enter", 1
SayString "注意看哦，我接下來會自動按下""alt+e""進入寫字板的""編輯""菜單，然後再按下a全選我的廢話，再按del清空"
KeyPress "Enter", 1
Delay StringDelay
Delay StringDelay
SayString "倒計時，3、"
Delay StringDelay
SayString "2、"
Delay StringDelay
SayString "1"
Delay StringDelay
KeyDown "Alt",1
KeyPress "E", 1
KeyUp "Alt",1
Delay StringDelay
KeyPress "A", 1
Delay StringDelay
KeyPress "Delete", 1
Delay StringDelay
//第二步
KeyPress "Enter", 1
SayString "呼..... 整個世界清淨了，下面我先介紹一下我的基本能力：模擬鍵盤和鼠標"
KeyPress "Enter", 1
Delay StringDelay
SayString "先按下一下a鍵，注意了，這可不是我說出來的a，是我模擬按出來的哦"
KeyPress "Enter", 1
Delay StringDelay
KeyPress "Enter", 1
KeyPress "A", 1
KeyPress "Enter", 1
KeyPress "Enter", 1
SayString "看明白了嗎？好像不是很明顯，那我按3下a鍵"
KeyPress "Enter", 1
Delay StringDelay
KeyPress "Enter", 1
KeyPress "A", 3
KeyPress "Enter", 1
KeyPress "Enter", 1
SayString "這下是不是更清楚了呢？我再多按一些"
KeyPress "Enter", 1
Delay StringDelay
KeyPress "Enter", 1
KeyPress "A", 1
KeyPress "B", 1
KeyPress "C", 1
KeyPress "D", 1
KeyPress "E", 1
KeyPress "F", 1
KeyPress "G", 1
KeyPress "H", 1
KeyPress "Enter", 1
KeyPress "Enter", 1
SayString "哈，這下看清了吧？上面這些字母都是我模擬鍵盤按下去的。"
KeyPress "Enter", 1
Delay StringDelay
SayString "我還會按 組合鍵 呢，我現在按一下ctrl+a，這樣可以把我的廢話全部選中"
KeyPress "Enter", 1
Delay StringDelay
KeyDown "Ctrl", 1
KeyPress "A", 1
KeyUp "Ctrl", 1
Delay StringDelay
KeyPress "End", 1
SayString "哈哈，看到了吧？我厲害吧？下面介紹一下模擬鼠標，這個動作可複雜了，是套組合動作"
KeyPress "Enter", 1
Delay StringDelay
SayString "想讓我演示的話就按一下鍵盤吧（等待按鍵...）"
KeyPress "Enter", 1
Delay StringDelay
key=WaitKey()
KeyPress "Enter", 1
SayString "我先用鼠標畫一個圓，然後把鼠標移動到屏幕中間，保存一下鼠標的位置，然後按下右鍵，"
KeyPress "Enter", 1
SayString "再向左平移一些，再按下左鍵，然後再把鼠標恢復到中間的位置"
KeyPress "Enter", 1
Delay StringDelay
SayString "是不是看起來很複雜？我用慢動作表演一下，注意開始嘍"
KeyPress "Enter", 1
KeyPress "Enter", 1
Delay StringDelay
//第三步
Call 畫圓()
Delay 1000
Call GetScreenResolution(intX,intY)
MoveTo 0,0
Delay StringDelay
MoveTo intX/2,intY/2
SaveMousePos 
Delay StringDelay
RightClick 1
Delay StringDelay
MoveR -20,0
Delay StringDelay
LeftClick 1
Delay StringDelay
RestoreMousePos 
Delay StringDelay
KeyDown "Ctrl", 1
KeyPress "End", 1
KeyUp "Ctrl", 1
SayString "有沒有看暈呢？呵呵。其實我演示了我模擬鼠標的基本能力，那就是"
KeyPress "Enter", 1
SayString "鼠標點擊、鼠標移動、鼠標相對移動和保存/恢復鼠標位置，當然中間還加了一些""延時"""
Delay StringDelay
KeyPress "Enter", 1
KeyPress "Enter", 1
SayString "好了，基本的本領介紹完了，你可以使用我的編輯功能製作這些動作，全是界面操作，非常非常簡單，快去試試吧！"
Delay StringDelay
Call 腳本結束()
//腳本結束
Sub 腳本結束()
MessageBox "腳本演示結束，最好的腳本永遠是您自己製作的。 :-)"
EndScript 
End Sub
//例子:關閉當前窗口
//說明:Windows裡面按下alt+f4即可關閉當前窗口,模擬這個操作
Sub GuanBiChuangKou()
    KeyDown "Alt", 1
    KeyPress "F4", 1
    KeyUp "Alt", 1
End Sub
//例子:用鼠標畫一個圓
Sub 畫圓()
    r=300:x0=512:y0=384:x=0:y=0:n=0
    While n<3.1415926*2
        x=x0+r*cos(n)
        y=y0-r*sin(n)
        MoveTo x,y
        Delay 20
        n=n+0.03
    Wend 
End Sub
