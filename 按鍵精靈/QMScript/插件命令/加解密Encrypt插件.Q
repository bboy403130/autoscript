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
MacroID=14e23d57-658b-4c6f-bf7f-13843cb6bef9
Description=加解密Encrypt插件
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
//下面這句是對字符串內容("按鍵精靈")進行MD5加密
TextMD5 = Plugin.Encrypt.Md5String("按鍵精靈")
MessageBox "按鍵精靈=" & TextMD5
//=================================================================================
//下面這句是對路徑文件("C:\WINDOWS\Media\Windows XP 啟動.wav")進行MD5加密
FileMD5 = Plugin.Encrypt.Md5File("C:\WINDOWS\Media\Windows XP 啟動.wav")
MessageBox FileMD5
