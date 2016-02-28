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
MacroID=c2a722f3-6f63-4793-975d-f5fd58d4c1dc
Description=WQM-一鍵百度搜索按鍵精靈
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
【功能說明】
一鍵百度搜索關鍵字按鍵精靈
【使用說明】
1.打開網頁按鍵精靈
2.啟動腳本即可
【作者介紹】
工程師01
【製作日期】
2009.6.22

[UIPackage]
UEsDBBQAAgAIAF5tEj9aowS3HAAAAC8AAAAJABEAVUlQYWNrYWdlVVQNAAe3Fk1OtxZNTrcWTU5jYmBgYIRiFrf8olxWEGHICOIjgXgmBoYfQBoAUEsBAhcLFAACAAgAXm0SP1qjBLccAAAALwAAAAkACQAAAAAAAAAAAACAAAAAAFVJUGFja2FnZVVUBQAHtxZNTlBLBQYAAAAAAQABAEAAAABUAAAAAAA=


[Script]
UserVar txt="按鍵精靈" "搜索內容"
Call Plugin.Web.Bind("WQM.exe")
Call Plugin.Web.Go("http://www.baidu.com/tw")
//搜索內容
Call Plugin.Web.HtmlInput(txt,"tag:input&name:wd")
//百度一下
Call Plugin.Web.HtmlClick("tag:INPUT&type:submit")
