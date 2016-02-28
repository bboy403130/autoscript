[Comment]
命令庫是按鍵精靈8.0版推出的全新功能
您可以把自己常用的函數和子程序寫在命令庫裡讓很多個腳本去調用
命令庫最大的優勢是讓多個腳本共享一個命令，修改一處就等於修改多處
目前命令庫功能還在測試當中，有任何建議可以在按鍵精靈論壇提出，網址：http://bbs.ajjl.cn

******注意！這是官方提供的命令庫，請勿修改！避免以後按鍵精靈升級時覆蓋您的修改。******//
******          如需新增命令庫，可在命令庫點擊右鍵選擇「新建」命令庫            ******//


[General]
MacroID=3f1e0d02-3591-4461-aead-f3fdd3e337b1

[Script]
Function 結構數組排序(數組,返回類型)
    //數字="100=A|50=B|1=C|0=D|10=E|20=F|12=G|21=H"
    //數組=Split(數字,"|")
    //例子：Msgbox lib.算法.結構數組排序(數組,0)
    //語法格式：數組() = "數字大小=值"
    //數組：NB_PaiXu(0) = "200=A"
    //返回類型：[0全部1最小2最大]
    Dim Int_A,Int_B,Int_Num,Int_Len,A_Str,Int_Temp
    //〈————————————————————初始賦值
    Int_A = 0: Int_Num = UBound(數組)
    For Int_A=0 TO UBound(數組) - 1
        Int_B = Int_A
        For Int_Len=0 To Int_Num - Int_A 
            //〈————————————————根據「=」號分離，進行大小判斷
            A_Str = Split(數組(Int_A), "="): B_Str = Split(數組(Int_B), "=")
            If CSng(A_Str(0)) > CSng(B_Str(0)) Then
                Int_Temp = 數組(Int_A): 數組(Int_A) = 數組(Int_B): 數組(Int_B) = Int_Temp
            End If 
            Int_B = Int_B + 1
        Next 
    Next 
    If 返回類型 = 0 Then
        //〈——————————————————排序結果
        結構數組排序 = Join(數組)
    ElseIf 返回類型 = 1 Then
        //〈——————————————————返回最小值
        結構數組排序 = 數組(0)
    ElseIf 返回類型 = 2 Then
        //〈——————————————————返回最大值
        結構數組排序 = 數組(Int_Num)
    End If 
End Function   
Function 提取字串符中所有數字(字符串)
    //MsgBox lib.算法.提取字串符中所有數字("dfghhj12dsfg3.hgk54dsfg67-45678")
    Dim TQstring    
    TQstring = "Dim rExp, shuzi" & vbCrLf    
    TQstring = TQstring & "shuzi = """"" & vbCrLf 
    TQstring = TQstring & "Set rExp = CreateObject(""VBScript.RegExp"")" & vbCrLf 
    TQstring = TQstring & "rExp.Pattern = ""\d+""" & vbCrLf    //設置過濾模式
    TQstring = TQstring & "rExp.Global = True" & vbCrLf        //設置全局可用性
    TQstring = TQstring & "Dim Num, Nums" & vbCrLf             //定義變量
    TQstring = TQstring & "Set Nums = rExp.Execute(""" & 字符串 & """)" & vbCrLf   //執行搜索  
    TQstring = TQstring & "For Each Num In Nums" & vbCrLf      //遍歷匹配集合
    TQstring = TQstring & "    shuzi = shuzi & Num" & vbCrLf  
    TQstring = TQstring & "next" & vbCrLf  
    TQstring = TQstring & "Set rExp = Nothing"
    Execute TQstring 
    提取字串符中所有數字 = shuzi
End Function
Function 提取漢字拼音首字母(中文漢字)
    //例子：MsgBox lib.算法.提取漢字拼音首字母("我是一隻魚！")
    Dim 拼音首字母,單個漢字,漢字編碼,首字母,i
    拼音首字母=""
    For i=0 To Len(中文漢字)-1
        單個漢字=Mid(中文漢字,i+1,1)    
        漢字編碼 = 65536 + Asc(單個漢字)
        首字母 = ""
        If (漢字編碼 >= 45217 And 漢字編碼 <= 45252)
            首字母 = "A"
        ElseIf (漢字編碼 >= 45253 And 漢字編碼 <= 45760)
            首字母 = "B"
        ElseIf (漢字編碼 >= 45761 And 漢字編碼 <= 46317)
            首字母 = "C"
        ElseIf (漢字編碼 >= 46318 And 漢字編碼 <= 46825)
            首字母 = "D"
        ElseIf (漢字編碼 >= 46826 And 漢字編碼 <= 47009)
            首字母 = "E"
        ElseIf (漢字編碼 >= 47010 And 漢字編碼 <= 47296)
            首字母 = "F"
        ElseIf (漢字編碼 >= 47297 And 漢字編碼 <= 47613)   
            首字母 = "G"  
        ElseIf (漢字編碼 >= 47614 And 漢字編碼 <= 48118)   
            首字母 = "H"  
        ElseIf (漢字編碼 >= 48119 And 漢字編碼 <= 49061)   
            首字母 = "J"  
        ElseIf (漢字編碼 >= 49062 And 漢字編碼 <= 49323)   
            首字母 = "K"  
        ElseIf (漢字編碼 >= 49324 And 漢字編碼 <= 49895)   
            首字母 = "L"  
        ElseIf (漢字編碼 >= 49896 And 漢字編碼 <= 50370)   
            首字母 = "M"  
        ElseIf (漢字編碼 >= 50371 And 漢字編碼 <= 50613)   
            首字母 = "N"  
        ElseIf (漢字編碼 >= 50614 And 漢字編碼 <= 50621)   
            首字母 = "O"  
        ElseIf (漢字編碼 >= 50622 And 漢字編碼 <= 50905)   
            首字母 = "P"  
        ElseIf (漢字編碼 >= 50906 And 漢字編碼 <= 51386)   
            首字母 = "Q"  
        ElseIf (漢字編碼 >= 51387 And 漢字編碼 <= 51445)   
            首字母 = "R"  
        ElseIf (漢字編碼 >= 51446 And 漢字編碼 <= 52217)   
            首字母 = "S"  
        ElseIf (漢字編碼 >= 52218 And 漢字編碼 <= 52697)   
            首字母 = "T"  
        ElseIf (漢字編碼 >= 52698 And 漢字編碼 <= 52979)   
            首字母 = "W"  
        ElseIf (漢字編碼 >= 52980 And 漢字編碼 <= 53640)   
            首字母 = "X"  
        ElseIf (漢字編碼 >= 53689 And 漢字編碼 <= 54480)   
            首字母 = "Y"  
        ElseIf (漢字編碼 >= 54481 And 漢字編碼 <= 55289)   
            首字母 = "Z"  
        EndIf  
        拼音首字母 = 拼音首字母 & 首字母
    Next
    提取漢字拼音首字母 = 拼音首字母
End Function     
Function 中文漢字轉拼音(中文漢字)
    //例子：MsgBox lib.算法.中文漢字轉拼音("我是一隻魚！")
    Dim 拼音庫碼(395)
    拼音庫碼(0) = "A=-20319"
    拼音庫碼(1) = "Ai=-20317"
    拼音庫碼(2) = "An=-20304"
    拼音庫碼(3) = "Ang=-20295"
    拼音庫碼(4) = "Ao=-20292"

    拼音庫碼(5) = "Ba=-20283"
    拼音庫碼(6) = "Bai=-20265"
    拼音庫碼(7) = "Ban=-20257"
    拼音庫碼(8) = "Bang=-20242"
    拼音庫碼(9) = "Bao=-20230"
    拼音庫碼(10) = "Bei=-20051"
    拼音庫碼(11) = "Ben=-20036"
    拼音庫碼(12) = "Beng=-20032"
    拼音庫碼(13) = "Bi=-20026"
    拼音庫碼(14) = "Bian=-20002"
    拼音庫碼(15) = "Biao=-19990"
    拼音庫碼(16) = "Bie=-19986"
    拼音庫碼(17) = "Bin=-19982"
    拼音庫碼(18) = "Bing=-19976"
    拼音庫碼(19) = "Bo=-19805"
    拼音庫碼(20) = "Bu=-19784"

    拼音庫碼(21) = "Ca=-19775"
    拼音庫碼(22) = "Cai=-19774"
    拼音庫碼(23) = "Can=-19763"
    拼音庫碼(24) = "Cang=-19756"
    拼音庫碼(25) = "Cao=-19751"
    拼音庫碼(26) = "Ce=-19746"
    拼音庫碼(27) = "Ceng=-19741"
    拼音庫碼(28) = "Cha=-19739"
    拼音庫碼(29) = "Chai=-19728"
    拼音庫碼(30) = "Chan=-19725"
    拼音庫碼(31) = "Chang=-19715"
    拼音庫碼(32) = "Chao=-19540"
    拼音庫碼(33) = "Che=-19531"
    拼音庫碼(34) = "Chen=-19525"
    拼音庫碼(35) = "Cheng=-19515"
    拼音庫碼(36) = "Chi=-19500"
    拼音庫碼(37) = "Chong=-19484"
    拼音庫碼(38) = "Chou=-19479"
    拼音庫碼(39) = "Chu=-19467"
    拼音庫碼(40) = "Chuai=-19289"
    拼音庫碼(41) = "Chuan=-19288"
    拼音庫碼(42) = "Chuang=-19281"
    拼音庫碼(43) = "Chui=-19275"
    拼音庫碼(44) = "Chun=-19270"
    拼音庫碼(45) = "Chuo=-19263"
    拼音庫碼(46) = "Ci=-19261"
    拼音庫碼(47) = "Cong=-19249"
    拼音庫碼(48) = "Cou=-19243"
    拼音庫碼(49) = "Cu=-19242"
    拼音庫碼(50) = "Cuan=-19238"
    拼音庫碼(51) = "Cui=-19235"
    拼音庫碼(52) = "Cun=-19227"
    拼音庫碼(53) = "Cuo=-19224"

    拼音庫碼(54) = "Da=-19218"
    拼音庫碼(55) = "Dai=-19212"
    拼音庫碼(56) = "Dan=-19038"
    拼音庫碼(57) = "Dang=-19023"
    拼音庫碼(58) = "Dao=-19018"
    拼音庫碼(59) = "De=-19006"
    拼音庫碼(60) = "Deng=-19003"
    拼音庫碼(61) = "Di=-18996"
    拼音庫碼(62) = "Dian=-18977"
    拼音庫碼(63) = "Diao=-18961"
    拼音庫碼(64) = "Die=-18952"
    拼音庫碼(65) = "Ding=-18783"
    拼音庫碼(66) = "Diu=-18774"
    拼音庫碼(67) = "Dong=-18773"
    拼音庫碼(68) = "Dou=-18763"
    拼音庫碼(69) = "Du=-18756"
    拼音庫碼(70) = "Duan=-18741"
    拼音庫碼(71) = "Dui=-18735"
    拼音庫碼(72) = "Dun=-18731"
    拼音庫碼(73) = "Duo=-18722"

    拼音庫碼(74) = "E=-18710"
    拼音庫碼(75) = "En=-18697"
    拼音庫碼(76) = "Er=-18696"

    拼音庫碼(77) = "Fa=-18526"
    拼音庫碼(78) = "Fan=-18518"
    拼音庫碼(79) = "Fang=-18501"
    拼音庫碼(80) = "Fei=-18490"
    拼音庫碼(81) = "Fen=-18478"
    拼音庫碼(82) = "Feng=-18463"
    拼音庫碼(83) = "Fo=-18448"
    拼音庫碼(84) = "Fou=-18447"
    拼音庫碼(85) = "Fu=-18446"

    拼音庫碼(86) = "Ga=-18239"
    拼音庫碼(87) = "Gai=-18237"
    拼音庫碼(88) = "Gan=-18231"
    拼音庫碼(89) = "Gang=-18220"
    拼音庫碼(90) = "Gao=-18211"
    拼音庫碼(91) = "Ge=-18201"
    拼音庫碼(92) = "Gei=-18184"
    拼音庫碼(93) = "Gen=-18183"
    拼音庫碼(94) = "Geng=-18181"
    拼音庫碼(95) = "Gong=-18012"
    拼音庫碼(96) = "Gou=-17997"
    拼音庫碼(97) = "Gu=-17988"
    拼音庫碼(98) = "Gua=-17970"
    拼音庫碼(99) = "Guai=-17964"
    拼音庫碼(100) = "Guan=-17961"
    拼音庫碼(101) = "Guang=-17950"
    拼音庫碼(102) = "Gui=-17947"
    拼音庫碼(103) = "Gun=-17931"
    拼音庫碼(104) = "Guo=-17928"

    拼音庫碼(105) = "Ha=-17922"
    拼音庫碼(106) = "Hai=-17759"
    拼音庫碼(107) = "Han=-17752"
    拼音庫碼(108) = "Hang=-17733"
    拼音庫碼(109) = "Hao=-17730"
    拼音庫碼(110) = "He=-17721"
    拼音庫碼(111) = "Hei=-17703"
    拼音庫碼(112) = "Hen=-17701"
    拼音庫碼(113) = "Heng=-17697"
    拼音庫碼(114) = "Hong=-17692"
    拼音庫碼(115) = "Hou=-17683"
    拼音庫碼(116) = "Hu=-17676"
    拼音庫碼(117) = "Hua=-17496"
    拼音庫碼(118) = "Huai=-17487"
    拼音庫碼(119) = "Huan=-17482"
    拼音庫碼(120) = "Huang=-17468"
    拼音庫碼(121) = "Hui=-17454"
    拼音庫碼(122) = "Hun=-17433"
    拼音庫碼(123) = "Huo=-17427"

    拼音庫碼(124) = "Ji=-17417"
    拼音庫碼(125) = "Jia=-17202"
    拼音庫碼(126) = "Jian=-17185"
    拼音庫碼(127) = "Jiang=-16983"
    拼音庫碼(128) = "Jiao=-16970"
    拼音庫碼(129) = "Jie=-16942"
    拼音庫碼(130) = "Jin=-16915"
    拼音庫碼(131) = "Jing=-16733"
    拼音庫碼(132) = "Jiong=-16708"
    拼音庫碼(133) = "Jiu=-16706"
    拼音庫碼(134) = "Ju=-16689"
    拼音庫碼(135) = "Juan=-16664"
    拼音庫碼(136) = "Jue=-16657"
    拼音庫碼(137) = "Jun=-16647"

    拼音庫碼(138) = "Ka=-16474"
    拼音庫碼(139) = "Kai=-16470"
    拼音庫碼(140) = "Kan=-16465"
    拼音庫碼(141) = "Kang=-16459"
    拼音庫碼(142) = "Kao=-16452"
    拼音庫碼(143) = "Ke=-16448"
    拼音庫碼(144) = "Ken=-16433"
    拼音庫碼(145) = "Keng=-16429"
    拼音庫碼(146) = "Kong=-16427"
    拼音庫碼(147) = "Kou=-16423"
    拼音庫碼(148) = "Ku=-16419"
    拼音庫碼(149) = "Kua=-16412"
    拼音庫碼(150) = "Kuai=-16407"
    拼音庫碼(151) = "Kuan=-16403"
    拼音庫碼(152) = "Kuang=-16401"
    拼音庫碼(153) = "Kui=-16393"
    拼音庫碼(154) = "Kun=-16220"
    拼音庫碼(155) = "Kuo=-16216"

    拼音庫碼(156) = "La=-16212"
    拼音庫碼(157) = "Lai=-16205"
    拼音庫碼(158) = "Lan=-16202"
    拼音庫碼(159) = "Lang=-16187"
    拼音庫碼(160) = "Lao=-16180"
    拼音庫碼(161) = "Le=-16171"
    拼音庫碼(162) = "Lei=-16169"
    拼音庫碼(163) = "Leng=-16158"
    拼音庫碼(164) = "Li=-16155"
    拼音庫碼(165) = "Lia=-15959"
    拼音庫碼(166) = "Lian=-15958"
    拼音庫碼(167) = "Liang=-15944"
    拼音庫碼(168) = "Liao=-15933"
    拼音庫碼(169) = "Lie=-15920"
    拼音庫碼(170) = "Lin=-15915"
    拼音庫碼(171) = "Ling=-15903"
    拼音庫碼(172) = "Liu=-15889"
    拼音庫碼(173) = "Long=-15878"
    拼音庫碼(174) = "Lou=-15707"
    拼音庫碼(175) = "Lu=-15701"
    拼音庫碼(176) = "Lv=-15681"
    拼音庫碼(177) = "Luan=-15667"
    拼音庫碼(178) = "Lue=-15661"
    拼音庫碼(179) = "Lun=-15659"
    拼音庫碼(180) = "Luo=-15652"

    拼音庫碼(181) = "Ma=-15640"
    拼音庫碼(182) = "Mai=-15631"
    拼音庫碼(183) = "Man=-15625"
    拼音庫碼(184) = "Mang=-15454"
    拼音庫碼(185) = "Mao=-15448"
    拼音庫碼(186) = "Me=-15436"
    拼音庫碼(187) = "Mei=-15435"
    拼音庫碼(188) = "Men=-15419"
    拼音庫碼(189) = "Meng=-15416"
    拼音庫碼(190) = "Mi=-15408"
    拼音庫碼(191) = "Mian=-15394"
    拼音庫碼(192) = "Miao=-15385"
    拼音庫碼(193) = "Mie=-15377"
    拼音庫碼(194) = "Min=-15375"
    拼音庫碼(195) = "Ming=-15369"
    拼音庫碼(196) = "Miu=-15363"
    拼音庫碼(197) = "Mo=-15362"
    拼音庫碼(198) = "Mou=-15183"
    拼音庫碼(199) = "Mu=-15180"

    拼音庫碼(200) = "Na=-15165"
    拼音庫碼(201) = "Nai=-15158"
    拼音庫碼(202) = "Nan=-15153"
    拼音庫碼(203) = "Nang=-15150"
    拼音庫碼(204) = "Nao=-15149"
    拼音庫碼(205) = "Ne=-15144"
    拼音庫碼(206) = "Nei=-15143"
    拼音庫碼(207) = "Nen=-15141"
    拼音庫碼(208) = "Neng=-15140"
    拼音庫碼(209) = "Ni=-15139"
    拼音庫碼(210) = "Nian=-15128"
    拼音庫碼(211) = "Niang=-15121"
    拼音庫碼(212) = "Niao=-15119"
    拼音庫碼(213) = "Nie=-15117"
    拼音庫碼(214) = "Nin=-15110"
    拼音庫碼(215) = "Ning=-15109"
    拼音庫碼(216) = "Niu=-14941"
    拼音庫碼(217) = "Nong=-14937"
    拼音庫碼(218) = "Nu=-14933"
    拼音庫碼(219) = "Nv=-14930"
    拼音庫碼(220) = "Nuan=-14929"
    拼音庫碼(221) = "Nue=-14928"
    拼音庫碼(222) = "Nuo=-14926"

    拼音庫碼(223) = "O=-14922"
    拼音庫碼(224) = "Ou=-14921"

    拼音庫碼(225) = "Pa=-14914"
    拼音庫碼(226) = "Pai=-14908"
    拼音庫碼(227) = "Pan=-14902"
    拼音庫碼(228) = "Pang=-14894"
    拼音庫碼(229) = "Pao=-14889"
    拼音庫碼(230) = "Pei=-14882"
    拼音庫碼(231) = "Pen=-14873"
    拼音庫碼(232) = "Peng=-14871"
    拼音庫碼(233) = "Pi=-14857"
    拼音庫碼(234) = "Pian=-14678"
    拼音庫碼(235) = "Piao=-14674"
    拼音庫碼(236) = "Pie=-14670"
    拼音庫碼(237) = "Pin=-14668"
    拼音庫碼(238) = "Ping=-14663"
    拼音庫碼(239) = "Po=-14654"
    拼音庫碼(240) = "Pu=-14645"

    拼音庫碼(241) = "Qi=-14630"
    拼音庫碼(242) = "Qia=-14594"
    拼音庫碼(243) = "Qian=-14429"
    拼音庫碼(244) = "Qiang=-14407"
    拼音庫碼(245) = "Qiao=-14399"
    拼音庫碼(246) = "Qie=-14384"
    拼音庫碼(247) = "Qin=-14379"
    拼音庫碼(248) = "Qing=-14368"
    拼音庫碼(249) = "Qiong=-14355"
    拼音庫碼(250) = "Qiu=-14353"
    拼音庫碼(251) = "Qu=-14345"
    拼音庫碼(252) = "Quan=-14170"
    拼音庫碼(253) = "Que=-14159"
    拼音庫碼(254) = "Qun=-14151"

    拼音庫碼(255) = "Ran=-14149"
    拼音庫碼(256) = "Rang=-14145"
    拼音庫碼(257) = "Rao=-14140"
    拼音庫碼(258) = "Re=-14137"
    拼音庫碼(259) = "Ren=-14135"
    拼音庫碼(260) = "Reng=-14125"
    拼音庫碼(261) = "Ri=-14123"
    拼音庫碼(262) = "Rong=-14122"
    拼音庫碼(263) = "Rou=-14112"
    拼音庫碼(264) = "Ru=-14109"
    拼音庫碼(265) = "Ruan=-14099"
    拼音庫碼(266) = "Rui=-14097"
    拼音庫碼(267) = "Run=-14094"
    拼音庫碼(268) = "Ruo=-14092"

    拼音庫碼(269) = "Sa=-14090"
    拼音庫碼(270) = "Sai=-14087"
    拼音庫碼(271) = "San=-14083"
    拼音庫碼(272) = "Sang=-13917"
    拼音庫碼(273) = "Sao=-13914"
    拼音庫碼(274) = "Se=-13910"
    拼音庫碼(275) = "Sen=-13907"
    拼音庫碼(276) = "Seng=-13906"
    拼音庫碼(277) = "Sha=-13905"
    拼音庫碼(278) = "Shai=-13896"
    拼音庫碼(279) = "Shan=-13894"
    拼音庫碼(280) = "Shang=-13878"
    拼音庫碼(281) = "Shao=-13870"
    拼音庫碼(282) = "She=-13859"
    拼音庫碼(283) = "Shen=-13847"
    拼音庫碼(284) = "Sheng=-13831"
    拼音庫碼(285) = "Shi=-13658"
    拼音庫碼(286) = "Shou=-13611"
    拼音庫碼(287) = "Shu=-13601"
    拼音庫碼(288) = "Shua=-13406"
    拼音庫碼(289) = "Shuai=-13404"
    拼音庫碼(290) = "Shuan=-13400"
    拼音庫碼(291) = "Shuang=-13398"
    拼音庫碼(292) = "Shui=-13395"
    拼音庫碼(293) = "Shun=-13391"
    拼音庫碼(294) = "Shuo=-13387"
    拼音庫碼(295) = "Si=-13383"
    拼音庫碼(296) = "Song=-13367"
    拼音庫碼(297) = "Sou=-13359"
    拼音庫碼(298) = "Su=-13356"
    拼音庫碼(299) = "Suan=-13343"
    拼音庫碼(300) = "Sui=-13340"
    拼音庫碼(301) = "Sun=-13329"
    拼音庫碼(302) = "Suo=-13326"

    拼音庫碼(303) = "Ta=-13318"
    拼音庫碼(304) = "Tai=-13147"
    拼音庫碼(305) = "Tan=-13138"
    拼音庫碼(306) = "Tang=-13120"
    拼音庫碼(307) = "Tao=-13107"
    拼音庫碼(308) = "Te=-13096"
    拼音庫碼(309) = "Teng=-13095"
    拼音庫碼(310) = "Ti=-13091"
    拼音庫碼(311) = "Tian=-13076"
    拼音庫碼(312) = "Tiao=-13068"
    拼音庫碼(313) = "Tie=-13063"
    拼音庫碼(314) = "Ting=-13060"
    拼音庫碼(315) = "Tong=-12888"
    拼音庫碼(316) = "Tou=-12875"
    拼音庫碼(317) = "Tu=-12871"
    拼音庫碼(318) = "Tuan=-12860"
    拼音庫碼(319) = "Tui=-12858"
    拼音庫碼(320) = "Tun=-12852"
    拼音庫碼(321) = "Tuo=-12849"

    拼音庫碼(322) = "Wa=-12838"
    拼音庫碼(323) = "Wai=-12831"
    拼音庫碼(324) = "Wan=-12829"
    拼音庫碼(325) = "Wang=-12812"
    拼音庫碼(326) = "Wei=-12802"
    拼音庫碼(327) = "Wen=-12607"
    拼音庫碼(328) = "Weng=-12597"
    拼音庫碼(329) = "Wo=-12594"
    拼音庫碼(330) = "Wu=-12585"

    拼音庫碼(331) = "Xi=-12556"
    拼音庫碼(332) = "Xia=-12359"
    拼音庫碼(333) = "Xian=-12346"
    拼音庫碼(334) = "Xiang=-12320"
    拼音庫碼(335) = "Xiao=-12300"
    拼音庫碼(336) = "Xie=-12120"
    拼音庫碼(337) = "Xin=-12099"
    拼音庫碼(338) = "Xing=-12089"
    拼音庫碼(339) = "Xiong=-12074"
    拼音庫碼(340) = "Xiu=-12067"
    拼音庫碼(341) = "Xu=-12058"
    拼音庫碼(342) = "Xuan=-12039"
    拼音庫碼(343) = "Xue=-11867"
    拼音庫碼(344) = "Xun=-11861"

    拼音庫碼(345) = "Ya=-11847"
    拼音庫碼(346) = "Yan=-11831"
    拼音庫碼(347) = "Yang=-11798"
    拼音庫碼(348) = "Yao=-11781"
    拼音庫碼(349) = "Ye=-11604"
    拼音庫碼(350) = "Yi=-11589"
    拼音庫碼(351) = "Yin=-11536"
    拼音庫碼(352) = "Ying=-11358"
    拼音庫碼(353) = "Yo=-11340"
    拼音庫碼(354) = "Yong=-11339"
    拼音庫碼(355) = "You=-11324"
    拼音庫碼(356) = "Yu=-11303"
    拼音庫碼(357) = "Yuan=-11097"
    拼音庫碼(358) = "Yue=-11077"
    拼音庫碼(359) = "Yun=-11067"

    拼音庫碼(360) = "Za=-11055"
    拼音庫碼(361) = "Zai=-11052"
    拼音庫碼(362) = "Zan=-11045"
    拼音庫碼(363) = "Zang=-11041"
    拼音庫碼(364) = "Zao=-11038"
    拼音庫碼(365) = "Ze=-11024"
    拼音庫碼(366) = "Zei=-11020"
    拼音庫碼(367) = "Zen=-11019"
    拼音庫碼(368) = "Zeng=-11018"
    拼音庫碼(369) = "Zha=-11014"
    拼音庫碼(370) = "Zhai=-10838"
    拼音庫碼(371) = "Zhan=-10832"
    拼音庫碼(372) = "Zhang=-10815"
    拼音庫碼(373) = "Zhao=-10800"
    拼音庫碼(374) = "Zhe=-10790"
    拼音庫碼(375) = "Zhen=-10780"
    拼音庫碼(376) = "Zheng=-10764"
    拼音庫碼(377) = "Zhi=-10587"
    拼音庫碼(378) = "Zhong=-10544"
    拼音庫碼(379) = "Zhou=-10533"
    拼音庫碼(380) = "Zhu=-10519"
    拼音庫碼(381) = "Zhua=-10331"
    拼音庫碼(382) = "Zhuai=-10329"
    拼音庫碼(383) = "Zhuan=-10328"
    拼音庫碼(384) = "Zhuang=-10322"
    拼音庫碼(385) = "Zhui=-10315"
    拼音庫碼(386) = "Zhun=-10309"
    拼音庫碼(387) = "Zhuo=-10307"
    拼音庫碼(388) = "Zi=-10296"
    拼音庫碼(389) = "Zong=-10281"
    拼音庫碼(390) = "Zou=-10274"
    拼音庫碼(391) = "Zu=-10270"
    拼音庫碼(392) = "Zuan=-10262"
    拼音庫碼(393) = "Zui=-10260"
    拼音庫碼(394) = "Zun=-10256"
    拼音庫碼(395) = "Zuo=-10254"
    漢字拼音 = ""
    Dim i,漢字碼,拼音
    For i = 1 To Len(中文漢字) 
        漢字碼 = Asc(Mid(中文漢字, i, 1))
        If 漢字碼 > 0 And 漢字碼 < 160 Then
            //不在拼音範圍內還原符號
            拼音 = Chr(漢字碼)
        Else
            If 漢字碼 < -20319 Or 漢字碼 > -10247 Then
                //不在拼音範圍內還原符號
                拼音 = Chr(漢字碼)
            Else
                Dim 分割,n,漢字拼音
                For n = UBound(拼音庫碼) To 0 Step -1
                    分割 = Split(拼音庫碼(n), "=")
                    If CLng(分割(1)) <= 漢字碼 Then Exit For
                Next
                拼音 = 分割(0)
            End If
        End If
        漢字拼音 = 漢字拼音 & 拼音
    Next
    中文漢字轉拼音 = 漢字拼音
End Function
Function 隨機字符串(位數)
    //例子：Msgbox lib.算法.隨機字符串(16)
    Dim i,位置,字符串,字母
    字母="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
    字符串=""
    For i=0 To 位數 - 1
        Randomize
        位置 = Int((Len(字母) * Rnd) + 1)
        字符串 = 字符串 & Mid(字母,位置,1)
    Next
    隨機字符串 = 字符串
End Function 
Function 隨機數字串(位數)
    //例子：Msgbox lib.算法.隨機數字串(16)
    Dim i,位置,數字,數字串
    數字="0123456789"
    數字串=""
    For i=0 To 位數 - 1
        Randomize
        位置 = Int((Len(數字) * Rnd) + 1)
        數字串 = 數字串 & Mid(數字,位置,1)
    Next
    隨機數字串 = 數字串
End Function 
Function 隨機取姓名()
    //例子：Msgbox lib.算法.隨機取姓名()
    Dim a,b,c,nei,zhu
    Randomize
    a = CInt((102) * Rnd)
    b = CInt((85) * Rnd)
    c = CInt((59) * Rnd)
    nei = ""
    Select Case a
    Case 1
        zhu = "賈"
    Case 2
        zhu = "趙"
    Case 3
        zhu = "蕭"
    Case 4
        zhu = "梁"
    Case 5
        zhu = "胡"
    Case 6
        zhu = "謝"
    Case 7
        zhu = "曹"
    Case 8
        zhu = "袁"
    Case 9
        zhu = "傅"
    Case 10
        zhu = "彭"
    Case 11
        zhu = "蔣"
    Case 12
        zhu = "蔡"
    Case 13
        zhu = "魏"
    Case 14
        zhu = "薛"
    Case 15
        zhu = "閻"
    Case 16
        zhu = "潘"
    Case 17
        zhu = "戴"
    Case 18
        zhu = "夏"
    Case 19
        zhu = "姜"
    Case 20
        zhu = "姚"
    Case 21
        zhu = "鄒"
    Case 22
        zhu = "熊"
    Case 23
        zhu = "郝"
    Case 24
        zhu = "秦蔣"
    Case 25
        zhu = "邵"
    Case 26
        zhu = "侯"
    Case 27
        zhu = "段"
    Case 28
        zhu = "武"
    Case 29
        zhu = "賴"
    Case 30
        zhu = "龔"
    Case 31
        zhu = "奧"
    Case 32
        zhu = "夏侯"
    Case 33
        zhu = "諸葛"
    Case 34
        zhu = "上官"
    Case 35
        zhu = "歐陽"
    Case 36
        zhu = "尉遲"
    Case 37
        zhu = "公孫"
    Case 38
        zhu = "岳"
    Case 39
        zhu = "墨"
    Case 40
        zhu = "琴"
    Case 41
        zhu = "塗"
    Case 42
        zhu = "溫"
    Case 43
        zhu = "匡"
    Case 44
        zhu = "余"
    Case 45
        zhu = "余"
    Case 46
        zhu = "溫"
    Case 47
        zhu = "景"
    Case 48
        zhu = "莊"
    Case 49
        zhu = "莊"
    Case 50
        zhu = "燕"
    Case 51
        zhu = "司馬"
    Case 52
        zhu = "景"
    Case 53
        zhu = "馬"
    Case 54
        zhu = "伊"
    Case 55
        zhu = "樊"
    Case 56
        zhu = "朱"
    Case 57
        zhu = "馮"
    Case 58
        zhu = "雷"
    Case 59
        zhu = "范"
    Case 60
        zhu = "穆"
    Case 61
        zhu = "麒"
    Case 62
        zhu = "安"
    Case 63
        zhu = "布"
    Case 64
        zhu = "卜"
    Case 65
        zhu = "白"
    Case 66
        zhu = "拜"
    Case 67
        zhu = "鮑"
    Case 68
        zhu = "庹"
    Case 69
        zhu = "崔"
    Case 70
        zhu = "程"
    Case 71
        zhu = "晨"
    Case 72
        zhu = "遲"
    Case 73
        zhu = "常"
    Case 74
        zhu = "車"
    Case 75
        zhu = "翟"
    Case 76
        zhu = "竇"
    Case 77
        zhu = "狄"
    Case 78
        zhu = "費"
    Case 79
        zhu = "范"
    Case 80
        zhu = "郭"
    Case 81
        zhu = "葛"
    Case 82
        zhu = "恭"
    Case 83
        zhu = "霍"
    Case 84
        zhu = "孔"
    Case 85
        zhu = "柯"
    Case 86
        zhu = "駱"
    Case 87
        zhu = "苗"
    Case 88
        zhu = "孟"
    Case 89
        zhu = "潘"
    Case 90
        zhu = "喬"
    Case 91
        zhu = "屠"
    Case 92
        zhu = "邰"
    Case 93
        zhu = "譚"
    Case 94
        zhu = "巫"
    Case 95
        zhu = "翁"
    Case 96
        zhu = "徐"
    Case 97
        zhu = "肖"
    Case 98
        zhu = "蕭"
    Case 99
        zhu = "夏"
    Case 100
        zhu = "袁"
    Case 101
        zhu = "章"
    Case 102
        zhu = "童"
    End Select
    nei = nei & zhu
    Select Case b
    Case 1
        zhu = "雷"
    Case 2
        zhu = "琳"
    Case 3
        zhu = "甜"
    Case 4
        zhu = "琪"
    Case 5
        zhu = "茂"
    Case 6
        zhu = "莆"
    Case 7
        zhu = "倩"
    Case 8
        zhu = "祥"
    Case 9
        zhu = "霞"
    Case 10
        zhu = "莠"
    Case 11
        zhu = "唇"
    Case 12
        zhu = "汝"
    Case 13
        zhu = "瑞"
    Case 14
        zhu = "妮"
    Case 15
        zhu = "莫"
    Case 16
        zhu = "終"
    Case 17
        zhu = "慧"
    Case 18
        zhu = "詩"
    Case 19
        zhu = "雯"
    Case 20
        zhu = "鴻"
    Case 21
        zhu = "喬"
    Case 22
        zhu = "雪"
    Case 23
        zhu = "君"
    Case 24
        zhu = "雅"
    Case 25
        zhu = "森"
    Case 26
        zhu = "沐"
    Case 27
        zhu = "淮"
    Case 28
        zhu = "莉"
    Case 29
        zhu = "淑"
    Case 30
        zhu = "申"
    Case 31
        zhu = "雙"
    Case 32
        zhu = "霆"
    Case 33
        zhu = "媛"
    Case 34
        zhu = "熙"
    Case 35
        zhu = "彩"
    Case 36
        zhu = "明"
    Case 37
        zhu = "琪"
    Case 38
        zhu = "興"
    Case 39
        zhu = "旺"
    Case 40
        zhu = "泉"
    Case 41
        zhu = "誠"
    Case 42
        zhu = "秋"
    Case 43
        zhu = "生"
    Case 44
        zhu = "駿"
    Case 45
        zhu = "晶"
    Case 46
        zhu = "然"
    Case 47
        zhu = "怡"
    Case 48
        zhu = "蓉"
    Case 49
        zhu = "淳"
    Case 50
        zhu = "宇"
    Case 51
        zhu = "玉"
    Case 52
        zhu = "志"
    Case 53
        zhu = "麻"
    Case 54
        zhu = "宏"
    Case 55
        zhu = "靜"
    Case 56
        zhu = "萱"
    Case 57
        zhu = "楚"
    Case 58
        zhu = "茵"
    Case 59
        zhu = "迪"
    Case 60
        zhu = "卡"
    Case 61
        zhu = "輝"
    Case 62
        zhu = "苑"
    Case 63
        zhu = "博"
    Case 64
        zhu = "新"
    Case 65
        zhu = "豪"
    Case 66
        zhu = "炫"
    Case 67
        zhu = "翰"
    Case 68
        zhu = "豪"
    Case 69
        zhu = "睿"
    Case 70
        zhu = "淵"
    Case 71
        zhu = "昊"
    Case 72
        zhu = "宸"
    Case 73
        zhu = "博"
    Case 74
        zhu = "哲"
    Case 75
        zhu = "瀚"
    Case 76
        zhu = "幽"
    Case 77
        zhu = "樺"
    Case 78
        zhu = "逸"
    Case 79
        zhu = "智"
    Case 80
        zhu = "鑫"
    Case 81
        zhu = "鵬"
    Case 82
        zhu = "顧"
    Case 83
        zhu = "瑋"
    Case 84
        zhu = "益"
    Case 85
        zhu = "軒"
    End Select
    nei = nei & zhu
    //第三個字
    Select Case c
    Case 1
        zhu = "敢"
    Case 2
        zhu = "款"
    Case 3
        zhu = "淦"
    Case 4
        zhu = "筐"
    Case 5
        zhu = "貴"
    Case 6
        zhu = "辜"
    Case 7
        zhu = "凱"
    Case 8
        zhu = "植"
    Case 9
        zhu = "奠"
    Case 10
        zhu = "捷"
    Case 11
        zhu = "掎"
    Case 12
        zhu = "探"
    Case 13
        zhu = "敦"
    Case 14
        zhu = "智"
    Case 15
        zhu = "棠"
    Case 16
        zhu = "淘"
    Case 17
        zhu = "淡"
    Case 18
        zhu = "焦"
    Case 19
        zhu = "荔"
    Case 20
        zhu = "軫"
    Case 21
        zhu = "迦"
    Case 22
        zhu = "鈞"
    Case 23
        zhu = "婷"
    Case 24
        zhu = "喋"
    Case 25
        zhu = "塘"
    Case 26
        zhu = "塔"
    Case 27
        zhu = "暖"
    Case 28
        zhu = "楠"
    Case 29
        zhu = "幄"
    Case 30
        zhu = "涯"
    Case 31
        zhu = "焰"
    Case 32
        zhu = "雁"
    Case 33
        zhu = "雅"
    Case 34
        zhu = "雯"
    Case 35
        zhu = "喻"
    Case 36
        zhu = "婺"
    Case 37
        zhu = "琬"
    Case 38
        zhu = "博"
    Case 39
        zhu = "棉"
    Case 40
        zhu = "涵"
    Case 41
        zhu = "淼"
    Case 42
        zhu = "淮"
    Case 43
        zhu = "番"
    Case 44
        zhu = "徨"
    Case 45
        zhu = "惠"
    Case 46
        zhu = "斑"
    Case 47
        zhu = "酣"
    Case 48
        zhu = "邯"
    Case 49
        zhu = "媚"
    Case 50
        zhu = "彬"
    Case 51
        zhu = "棠"
    Case 52
        zhu = "磊"
    Case 53
        zhu = "宸"
    Case 54
        zhu = "瓿"
    Case 55
        zhu = "梅"
    Case 56
        zhu = "晴"
    Case 57
        zhu = "婷"
    Case 58
        zhu = "霞"
    Case 59
        zhu = "惠"
    End Select
    隨機取姓名 = nei & zhu
End Function
Function 得到字符串中字母的數量(字符串)
    //例子：MsgBox lib.算法.得到字符串中字母的數量("[email=abc@#$%de]abc@#$%de[/email]")
    Dim TQstring  
    TQstring = "Dim regEx, Matches, shuliang" & vbCrLf                    //定義變量
    TQstring = TQstring & "Set regEx = New RegExp" & vbCrLf               //建立正則表達式
    TQstring = TQstring & "regEx.Pattern = ""([a-z]{1})""" & vbCrLf       //設置過濾模式
    TQstring = TQstring & "regEx.IgnoreCase = true" & vbCrLf              //設置是否區分字符大小寫
    TQstring = TQstring & "regEx.Global = True" & vbCrLf                  //設置全局可用性
    TQstring = TQstring & "Set Matches = regEx.Execute(""" & 字符串 & """)" & vbCrLf   //執行搜索   
    TQstring = TQstring & "shuliang = Matches.count"
    Execute TQstring 
    得到字符串中字母的數量 = shuliang  
End Function  
Function 十六進制轉十進制(十六進制字符串)
    //例子：Msgbox lib.算法.十六進制轉十進制("FFFFFF")
    Dim D,H,i,Ia
    D = 0
    H = UCase(十六進制字符串)
    For i = 1 To Len(H)
        Ia = Asc(Mid(H, i, 1)) - 48
        If Ia > 9 Then Ia = Ia - 7
        D = D * 16 + Ia
    Next
    十六進制轉十進制 = D
End Function
Sub 乘法表生成器()
    //例子：Call lib.算法.乘法表生成器()
    Dim c,d 
    Dim str,s
    For c = 1 To 9 
        For d = 1 To c
            s = d & "×" & c & "=" & c * d 
            s = s & Space(6-len(s))
            str = str & s & " " 
        Next 
        str = str & vbCrlf  
    Next
    MsgBox str,0,"乘法表生成器" 
End Sub 
Function 洗牌(字符串內容)
    //說明：可以打亂一句內容順序
    //例子：MsgBox lib.算法.洗牌("123啊456")
    Dim 結果,數量,i, j, temp
    數量=Len(字符串內容)
    ReDim tt(數量)
    結果 = ""
    For i = 1 To 數量 
        tt(i) = Mid(字符串內容,i,1)
    Next
    Randomize
    For j = 1 To 數量
        i = Int(數量 * Rnd + 1)
        temp=tt(i)        
        tt(i)=tt(j)
        tt(j)=temp 
    Next
    洗牌 = Join(tt,"")
End Function
Function 判斷是否在一條直線上(起點x坐標,起點y坐標,終點x坐標,終點y坐標,判斷點x坐標,判斷點y坐標)
    //例子：MsgBox CBool(lib.算法.判斷是否在一條直線上(0,3,2,5,4,7))
    //計算公式：y=k*x+b 
    Dim k,b,y   
    判斷是否在一條直線上=False
    //判斷除數是否為0
    If 終點x坐標 - 起點x坐標 = 0 or 終點y坐標 - 起點y坐標 = 0 then
        //只是判斷他是 豎線 還是 橫線
        If (判斷點y坐標 >= 起點y坐標 and 判斷點y坐標 <= 終點y坐標) and (判斷點x坐標 >= 起點x坐標 and 判斷點x坐標 <= 終點x坐標) then
            判斷是否在一條直線上=True 
        End if
        Exit Function 
    End If
    k = abs(終點y坐標-起點y坐標) / abs(終點x坐標-起點x坐標) 
    b = 起點y坐標 - k * 起點x坐標
    y = k * 判斷點x坐標 + b
    //因會計算出小數點，所以加範圍判斷
    If y>判斷點y坐標-1 and y<判斷點y坐標+1 Then
        判斷是否在一條直線上=True
    End If
End Function
Function 角度計算(中心點x坐標,中心點y坐標,移動點x坐標,移動點y坐標)
    //例子：MsgBox lib.算法.角度計算(0,0,10,10)
    //上為0°，右為90°，下為180°，左為270°
    Dim x,y,a,b
    If 移動點x坐標=中心點x坐標 Then
        If 移動點y坐標>中心點y坐標 Then
            //↑
            角度計算 = 0
        Else
            //↓
            角度計算 = 180
        End If
    ElseIf 移動點y坐標=中心點y坐標 Then
        If 移動點x坐標>中心點x坐標 Then
            //→
            角度計算 = 90
        Else
            //←
            角度計算 = 270
        End If
    Else
        If 移動點x坐標>中心點x坐標 and 移動點y坐標>中心點y坐標 Then
            //↘
            b = 90
        ElseIf 移動點x坐標>中心點x坐標 and 移動點y坐標<中心點y坐標 Then
            //↗
            b = 0
        ElseIf 移動點x坐標<中心點x坐標 and 移動點y坐標<中心點y坐標 Then
            //↖
            b = 270
        ElseIf 移動點x坐標<中心點x坐標 and 移動點y坐標>中心點y坐標 Then
            //↙
            b = 180
        End If
        x = abs(移動點y坐標 - 中心點y坐標)
        y = abs(移動點x坐標 - 中心點x坐標)
        If x>0 Then
            //1弧度約為57.3
            a = Atn(y / x)
            角度計算 = fix(a * 57.3) + b
            //角度計算 = fix(a/(3.14159265/180))
        End If
    End If
End Function


//製作：一隻魚
//日期：2009.12.22
//修改：2011.11.30




