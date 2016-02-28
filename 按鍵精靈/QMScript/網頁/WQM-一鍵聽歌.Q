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
MacroID=018f6f7a-9435-4fb5-9324-938f4727f253
Description=WQM-一鍵聽歌
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

[UIPackage]
UEsDBBQAAgAIAHpwET9aowS3HAAAAC8AAAAJABEAVUlQYWNrYWdlVVQNAAchyktOIcpLTiHKS05jYmBgYIRiFrf8olxWEGHICOIjgXgmBoYfQBoAUEsBAhcLFAACAAgAenARP1qjBLccAAAALwAAAAkACQAAAAAAAAAAAACAAAAAAFVJUGFja2FnZVVUBQAHIcpLTlBLBQYAAAAAAQABAEAAAABUAAAAAAA=


[Script]
//
UserVar diange="katy perry" "輸入歌名"
Delay 200
//獲取瀏覽器進程ID
Call Plugin.Web.Bind("WQM.exe")
//跳轉網頁
Call Plugin.Web.Go("http://mp3.baidu.com/")
Delay 500
//在網頁查詢框中輸入歌名
Call Plugin.Web.HtmlInput(diange,"id:ww")
Delay 500
//點擊搜索
Call Plugin.Web.HtmlClick("tag:INPUT&value:百度一下")
Delay 1500
//點擊試聽
Call Plugin.Web.HtmlClick("tag:SPAN&txt*:全部歌曲&index:0")
Call Plugin.Web.Tips("音樂播放中，請欣賞！")

