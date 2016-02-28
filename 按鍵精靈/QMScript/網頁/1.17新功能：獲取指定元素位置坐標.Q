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
MacroID=43b91a53-f401-4b57-ab3f-f8fec6c83a23
Description=1.17新功能：獲取指定元素位置坐標
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
UEsDBBQAAgAIAGZtEj9aowS3HAAAAC8AAAAJABEAVUlQYWNrYWdlVVQNAAcXF01OFxdNThcXTU5jYmBgYIRiFrf8olxWEGHICOIjgXgmBoYfQBoAUEsBAhcLFAACAAgAZm0SP1qjBLccAAAALwAAAAkACQAAAAAAAAAAAACAAAAAAFVJUGFja2FnZVVUBQAHFxdNTlBLBQYAAAAAAQABAEAAAABUAAAAAAA=


[Script]
//<>--------------------------------------綁定WQM（必須的）
PID=Plugin.Web.Bind("wqm.exe")
//<>--------------------------------------打開百度網站
Call Plugin.Web.Go("http://www.baidu.com/tw")
//<>--------------------------------------獲取元素位置
XY=Plugin.Web.HtmlGet("offset","tag:INPUT&type:submit")
//下面這句用於分割字符串
ZB = InStr(XY, "|")
//下面這句將字符串轉換成數值
X = Clng(Left(XY, ZB - 1)): Y = Clng(Right(XY, Len(XY) - ZB))
//<>--------------------------------------得到結果  
MessageBox "「百度一下」左上角坐標位置為：" & X&","&Y  