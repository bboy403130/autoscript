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
MacroID=968acfa3-f6d6-42ed-a3c5-b7bcd7e68d49
Description=多媒體Media插件
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

[Script]
//測試OK
//下面這句是音階(標準(M))音符(DO(1))節拍(1/16拍)
Call Plugin.Media.Beep(523, 200)
//下面這句是音階(標準(M))音符(RE(2))節拍(1/16拍)
Call Plugin.Media.Beep(578, 200)
//下面這句是音階(標準(M))音符(MI(3))節拍(1/16拍)
Call Plugin.Media.Beep(659, 200)
//下面這句是音階(標準(M))音符(FA(4))節拍(1/16拍)
Call Plugin.Media.Beep(698, 200)
//下面這句是音階(標準(M))音符(SO(5))節拍(1/16拍)
Call Plugin.Media.Beep(784, 200)
//下面這句是音階(標準(M))音符(LA(6))節拍(1/16拍)
Call Plugin.Media.Beep(880, 200)
//下面這句是音階(標準(M))音符(SI(7))節拍(1/16拍)
Call Plugin.Media.Beep(988, 200)
MessageBox "Beep 播放結束!!"
//=================================================================================
//下面這句是播放路徑("C:\WINDOWS\Media\Windows XP 啟動.wav")音樂文件
Call Plugin.Media.Play("C:\WINDOWS\Media\Windows XP 啟動.wav")
MessageBox "現在 播放音樂!!"
Delay 1000
//下面這句是關閉聲音播放
Call Plugin.Media.Stop()
MessageBox "播放停止!!"
//=================================================================================
//下面這句是設置波形音量大小為(50)
Call Plugin.Media.Vol(50)
MessageBox "設置了聲音大小!!"
//=================================================================================
//下面這句是播放路徑("C:\WINDOWS\Media\Windows XP 關機.wav")音樂文件
Call Plugin.Media.Play("C:\WINDOWS\Media\Windows XP 關機.wav")
Delay 1000
MessageBox "現在 播放音樂!!"
