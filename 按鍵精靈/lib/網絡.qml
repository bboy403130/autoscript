[Comment]
命令庫是按鍵精靈8.0版推出的全新功能
您可以把自己常用的函數和子程序寫在命令庫裡讓很多個腳本去調用
命令庫最大的優勢是讓多個腳本共享一個命令，修改一處就等於修改多處
目前命令庫功能還在測試當中，有任何建議可以在按鍵精靈論壇提出，網址：http://bbs.ajjl.cn

******注意！這是官方提供的命令庫，請勿修改！避免以後按鍵精靈升級時覆蓋您的修改。******//
******          如需新增命令庫，可在命令庫點擊右鍵選擇「新建」命令庫            ******//



[General]
MacroID=a1c52b4e-dc44-4ded-887c-ff94144acf68

[Script]
Function 獲得網頁源文件(網頁地址)
    //說明：支持遠程獲取文本內容，如：MsgBox lib.網絡.獲得網頁源文件("http://www.jdyou.com/test.txt")
    //例子：MsgBox lib.網絡.獲得網頁源文件("http://www.jdyou.com")
    Dim xmlHttp, xmlBody, xmlUrl
    Dim ThisCharCode ,NextCharCode ,BytesToBstr
    If InStr(網頁地址, "http://") = 0 Then 
        xmlUrl = "http://" & 網頁地址
    Else
        xmlUrl = 網頁地址
    End if
    Set xmlHttp = CreateObject("Microsoft.XMLHTTP")
    xmlHttp.Open "Get", xmlUrl, False
    xmlHttp.Send
    xmlBody = xmlHttp.ResponseBody
    Set xmlHttp = Nothing  
    獲得網頁源文件 = ""
    If Len(xmlBody) = 0 Then Exit Function
    Set ObjStream = CreateObject("Adodb.Stream")
    With ObjStream
        .Type = 1
        .Mode = 3
        .Open
        .Write xmlBody
        .Position = 0
        .Type = 2
        .Charset = "GB2312"
        BytesToBstr = .ReadText
        .Close
    End With
    Set ObjStream = Nothing    
    獲得網頁源文件 = BytesToBstr
End Function
Function 獲得外網IP地址()   
    //例子：MsgBox lib.網絡.獲得外網IP地址()
    Dim 網頁內容,開始位置,結束位置
    網頁內容 = lib.網絡.獲得網頁源文件("http://iframe.ip138.com/ic.asp")
    開始位置 = inStr(網頁內容,"[") + 1
    結束位置 = inStr(網頁內容,"]") - 開始位置
    獲得外網IP地址 = Mid(網頁內容,開始位置,結束位置)
End Function
Function 發送郵件(你的郵箱帳號, 你的郵箱密碼, 發送郵件地址, 郵件主題, 郵件內容, 郵件附件) 
    //例子：MsgBox lib.網絡.發送郵件("ceshi0000001@163.com","ceshi000001","ceshi0000001@163.com","郵件主題","郵件內容","")
    Dim You_ID,MS_Space,Email
    '帳號和服務器分離 
    You_ID = Split(你的郵箱帳號, "@") 
    '這個是必須要的，不過可以放心的事，不會通過微軟發送郵件 
    MS_Space = "http://schemas.microsoft.com/cdo/configuration/" 
    Set Email = CreateObject("CDO.Message") 
    '這個一定要和發送郵件的帳號一樣
    Email.From = 你的郵箱帳號 
    'Execute "Email.to = 發送郵件地址"
    Email.CC = 發送郵件地址
    Email.Subject = 郵件主題
    Email.Textbody = 郵件內容 
    If 郵件附件 <> "" Then 
        Email.AddAttachment 郵件附件 
    End If 
    With Email.Configuration.Fields 
        '發信端口 
        .Item(MS_Space & "sendusing") = 2 
        'SMTP服務器地址 
        .Item(MS_Space & "smtpserver") = "smtp." & You_ID(1) 
        'SMTP服務器端口 
        .Item(MS_Space & "smtpserverport") = 25 
        .Item(MS_Space & "smtpauthenticate") = 1
        .Item(MS_Space & "sendusername") = You_ID(0) 
        .Item(MS_Space & "sendpassword") = 你的郵箱密碼  
        .Update 
    End With 
    '發送郵件 
    Email.Send 
    '關閉組件 
    Set Email = Nothing 
    發送郵件 = True
    '如果沒有任何錯誤信息，則表示發送成功,否則發送失敗 
    If Err Then 
        Err.Clear 
        發送郵件 = False 
    End If 
End Function 
Function 獲取網絡時間()
    //例子：MsgBox "當前標準時間為：" & lib.網絡.獲取網絡時間()
    //判斷：If NowTime>CDate("2010-5-9") Then
    Dim SvrName(7),xPost,HttpAdd,NowTime,StartTime,i
    StartTime=Now 
    //SvrName(0) = "time-a.nist.gov"
    SvrName(1) = "time-a.timefreq.bldrdoc.gov"
    SvrName(2) = "time-b.timefreq.bldrdoc.gov"
    SvrName(3) = "time-c.timefreq.bldrdoc.gov"
    SvrName(4) = "utcnist.colorado.edu"
    SvrName(5) = "time.nist.gov"
    SvrName(6) = "nist1.datum.com"
    SvrName(7) = "nist1.aol-ca.truetime.com"
    Set xPost=createObject("Microsoft.XMLHTTP") 
    NowTime=""
    Do While NowTime=""
        For i=1 to 7
            NowTime=""
            HttpAdd="Http://" & SvrName(i) & ":13"
            xPost.Open "Put", HttpAdd, False
            xPost.Send
            Delay 10
            If xPost.readyState=4 Then
                NowTime=mid(xPost.responsetext, 8, 17)
                If NowTime<>"" Then
                    NowTime=CDate(NowTime) + 8 / 24
                    Exit Do
                Else
                    xPost.abort
                    NowTime=""
                End If
            End If
        Next
        If DateDiff("s", StartTime, Now)>=30 And NowTime="" Then
            Msgbox "請確定你已經連接上了互聯網！", 0, "獲取網絡時間"
            Exit Do 
        End If
    Loop
    xPost.abort
    Set xPost=Nothing
    獲取網絡時間=NowTime
End Function






//製作：一隻魚
//日期：2009.12.30
//修改：2011.04.19

