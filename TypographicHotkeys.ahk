#Hotstring * ? ;Make hotstrings not to wait the end key and trigger inside strings

;==================================Make load on startup, if launched first time
sname := A_Startup . "\" . SubStr(A_ScriptName, 1, -4) . ".lnk"
IfNotExist, %sname%
    ;MsgBox, %sname%
    FileCreateShortcut, %A_ScriptFullPath%, %sname%

;≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡The main combos array. There are all combinations for input stored
combos := ComObjCreate("Scripting.Dictionary")

;===========================================Solaris compose keys
combos.item("c/") := "¢"
combos.item("/c") := "¢"
combos.item("!!") := "¡"
combos.item("l-") := "£"
combos.item("-l") := "£"
combos.item("ox") := "¤"
combos.item("xo") := "¤"
combos.item("y-") := "¥"
combos.item("-y") := "¥"
combos.item("Y-") := "¥"
combos.item("-Y") := "¥"
combos.item("||") := "¦"
combos.item("so") := "§"
combos.item("os") := "§"
combos.item("OS") := "§"
combos.item("SO") := "§"
combos.item("''") := "¨"
combos.item("""""") := "¨"
combos.item("""") := "¨"
combos.item("co") := "©"
combos.item("oc") := "©"
combos.item("OC") := "©"
combos.item("CO") := "©"
combos.item("a-") := "ª"
combos.item("-a") := "ª"
combos.item("<<") := "«"
combos.item("-|") := "¬"
combos.item("|-") := "¬"
combos.item("--") := "-"
;combos.item("or") := "®" ;conflict with logic or
combos.item("ro") := "®"
combos.item("OR") := "®"
combos.item("RO") := "®"
combos.item("^-") := "¯"
combos.item("-^") := "¯"
combos.item("^_") := "¯"
combos.item("_^") := "¯"
combos.item("^0") := "°"
combos.item("0^") := "°"
combos.item("+-") := "±"
combos.item("-+") := "∓"
combos.item("^1") := "¹"
combos.item("1^") := "¹"
combos.item("^2") := "²"
combos.item("2^") := "²"
combos.item("^3") := "³"
combos.item("3^") := "³"
combos.item("\\") := "´"
combos.item("/u") := "µ"
combos.item("u/") := "µ"
combos.item("P!") := "¶"
combos.item("!P") := "¶"
combos.item("^.") := "·"
combos.item(".^") := "·"
combos.item(",,") := "¸"
combos.item("_o") := "º"
combos.item(">>") := "»"
combos.item("14") := "¼"
combos.item("12") := "½"
combos.item("34") := "¾"
combos.item("??") := "¿"
combos.item("A``") := "À"
combos.item("``A") := "À"
combos.item("A'") := "Á"
combos.item("'A") := "Á"
combos.item("А'") := "Á" ;cyr A
combos.item("'А") := "Á" ;cyr A
combos.item("A´") := "Á"
combos.item("´A") := "Á"
combos.item("А´") := "Á" ;cyr A
combos.item("´А") := "Á" ;cyr A
combos.item("A^") := "Â"
combos.item("^A") := "Â"
combos.item("A~") := "Ã"
combos.item("~A") := "Ã"
combos.item("A""") := "Ä"
combos.item("""A") := "Ä"
combos.item("A''") := "Ä"
combos.item("''A") := "Ä"
combos.item("¨A") := "Ä"
combos.item("A¨") := "Ä"
combos.item("A*") := "Å"
combos.item("*A") := "Å"
combos.item("AE") := "Æ"
combos.item("C,") := "Ç"
combos.item(",C") := "Ç"
combos.item("E``") := "È"
combos.item("``E") := "È"
combos.item("E'") := "É"
combos.item("'E") := "É"
combos.item("Е'") := "É" ;cyr E
combos.item("'Е") := "É" ;cyr E
combos.item("E´") := "É"
combos.item("´E") := "É"
combos.item("Е´") := "É" ;cyr E
combos.item("´Е") := "É" ;cyr E
combos.item("E^") := "Ê"
combos.item("^E") := "Ê"
combos.item("E""") := "Ë"
combos.item("""E") := "Ë"
combos.item("E''") := "Ë"
combos.item("''E") := "Ë"
combos.item("¨E") := "Ë"
combos.item("E¨") := "Ë"
combos.item("I``") := "Ì"
combos.item("``I") := "Ì"
combos.item("I'") := "Í"
combos.item("'I") := "Í"
combos.item("I´") := "Í"
combos.item("´I") := "Í"
combos.item("I^") := "Î"
combos.item("^I") := "Î"
combos.item("I""") := "Ï"
combos.item("""I") := "Ï"
combos.item("''I") := "Ï"
combos.item("I''") := "Ï"
combos.item("¨I") := "Ï"
combos.item("I¨") := "Ï"
combos.item("D-") := "Ð"
combos.item("-D") := "Ð"
combos.item("N~") := "Ñ"
combos.item("~N") := "Ñ"
combos.item("O``") := "Ò"
combos.item("``O") := "Ò"
combos.item("O'") := "Ó"
combos.item("'O") := "Ó"
combos.item("О'") := "Ó" ;cyr O
combos.item("'О") := "Ó" ;cyr O
combos.item("O´") := "Ó"
combos.item("´O") := "Ó"
combos.item("О´") := "Ó" ;cyr O
combos.item("´О") := "Ó" ;cyr O
combos.item("O^") := "Ô"
combos.item("^O") := "Ô"
combos.item("O~") := "Õ"
combos.item("~O") := "Õ"
combos.item("O""") := "Ö"
combos.item("""O") := "Ö"
combos.item("O''") := "Ö"
combos.item("''O") := "Ö"
combos.item("¨O") := "Ö"
combos.item("O¨") := "Ö"
combos.item("xx") := "×"
combos.item("-x") := "∗"
combos.item("x-") := "∗"
combos.item("O/") := "Ø"
combos.item("/O") := "Ø"
combos.item("``U") := "Ù"
combos.item("U``") := "Ù"
combos.item("U'") := "Ú"
combos.item("'U") := "Ú"
combos.item("U´") := "Ú"
combos.item("´U") := "Ú"
combos.item("U^") := "Û"
combos.item("^U") := "Û"
combos.item("U''") := "Ü"
combos.item("''U") := "Ü"
combos.item("""U") := "Ü"
combos.item("U""") := "Ü"
combos.item("¨U") := "Ü"
combos.item("U¨") := "Ü"
combos.item("Y'") := "Ý"
combos.item("'Y") := "Ý"
combos.item("Y´") := "Ý"
combos.item("´Y") := "Ý"
combos.item("TH") := "Þ"
combos.item("HT") := "Þ"
combos.item("ss") := "ß"
combos.item("a``") := "à"
combos.item("``a") := "à"
combos.item("'a") := "á"
combos.item("a'") := "á"
combos.item("'а") := "á" ;cyr a
combos.item("а'") := "á" ;cyr a
combos.item("´a") := "á"
combos.item("a´") := "á"
combos.item("´а") := "á" ;cyr a
combos.item("а´") := "á" ;cyr a
combos.item("^a") := "â"
combos.item("a^") := "â"
combos.item("a~") := "ã"
combos.item("~a") := "ã"
combos.item("''a") := "ä"
combos.item("a''") := "ä"
combos.item("a""") := "ä"
combos.item("""a") := "ä"
combos.item("¨a") := "ä"
combos.item("a¨") := "ä"
combos.item("a*") := "å"
combos.item("*a") := "å"
combos.item("ae") := "æ"
combos.item("ае") := "æ" ;cyr ae
combos.item("c,") := "ç"
combos.item(",c") := "ç"
combos.item("e``") := "è"
combos.item("``e") := "è"
combos.item("'e") := "é"
combos.item("e'") := "é" ;cyr e
combos.item("'е") := "é" ;cyr e
combos.item("е'") := "é"
combos.item("´e") := "é"
combos.item("e´") := "é" ;cyr e
combos.item("´е") := "é" ;cyr e
combos.item("е´") := "é"
combos.item("^e") := "ê"
combos.item("e^") := "ê"
combos.item("''e") := "ë"
combos.item("e''") := "ë"
combos.item("¨e") := "ë"
combos.item("e¨") := "ë"
combos.item("e""") := "ë"
combos.item("""e") := "ë"
combos.item("i``") := "ì"
combos.item("``i") := "ì"
combos.item("'i") := "í"
combos.item("i'") := "í"
combos.item("´i") := "í"
combos.item("i´") := "í"
combos.item("^i") := "î"
combos.item("i^") := "î"
combos.item("''i") := "ï"
combos.item("i''") := "ï"
combos.item("¨i") := "ï"
combos.item("i¨") := "ï"
combos.item("i""") := "ï"
combos.item("""i") := "ï"
combos.item("d-") := "ð"
combos.item("-d") := "ð"
combos.item("n~") := "ñ"
combos.item("~n") := "ñ"
combos.item("o``") := "ò"
combos.item("``o") := "ò"
combos.item("'o") := "ó"
combos.item("o'") := "ó"
combos.item("'о") := "ó" ;cyr o
combos.item("о'") := "ó" ;cyr o
combos.item("´o") := "ó"
combos.item("o´") := "ó"
combos.item("´о") := "ó" ;cyr o
combos.item("о´") := "ó" ;cyr o
combos.item("^o") := "ô"
combos.item("o^") := "ô"
combos.item("o~") := "õ"
combos.item("~o") := "õ"
combos.item("''o") := "ö"
combos.item("o''") := "ö"
combos.item("¨o") := "ö"
combos.item("o¨") := "ö"
combos.item("o""") := "ö"
combos.item("""o") := "ö"
combos.item("-:") := "÷"
combos.item(":-") := "÷"
combos.item("o/") := "ø"
combos.item("/o") := "ø"
combos.item("u``") := "ù"
combos.item("``u") := "ù"
combos.item("'u") := "ú"
combos.item("u'") := "ú"
combos.item("´u") := "ú"
combos.item("u´") := "ú"
combos.item("^u") := "û"
combos.item("u^") := "û"
combos.item("''u") := "ü"
combos.item("u''") := "ü"
combos.item("¨u") := "ü"
combos.item("u¨") := "ü"
combos.item("u""") := "ü"
combos.item("""u") := "ü"
combos.item("'y") := "ý" 
combos.item("y'") := "ý" 
combos.item("'у") := "ý" ;cyr y
combos.item("у'") := "ý" ;cyr y
combos.item("´y") := "ý" 
combos.item("y´") := "ý" 
combos.item("´у") := "ý" ;cyr y
combos.item("у´") := "ý" ;cyr y
combos.item("th") := "þ"
combos.item("ht") := "þ"
combos.item("tb") := "þ"
combos.item("bt") := "þ"
combos.item("y''") := "ÿ"
combos.item("''y") := "ÿ"
combos.item("¨y") := "ÿ"
combos.item("y¨") := "ÿ"
combos.item("""y") := "ÿ"
combos.item("y""") := "ÿ"

;====================================Linux compose keys (premixed to solaris)
combos.item("c|") := "¢"
combos.item("|c") := "¢"
combos.item("C|") := "¢"
combos.item("|C") := "¢"
combos.item("C/") := "¢"
combos.item("/C") := "¢"
combos.item("L-") := "£"
combos.item("-L") := "£"
combos.item("Y=") := "¥"
combos.item("=Y") := "¥"
combos.item("!^") := "¦"
combos.item("oC") := "©"
combos.item("Oc") := "©"
combos.item("^_a") := "ª"
combos.item("^a_") := "ª"
combos.item("_a^") := "ª"
combos.item("_^a") := "ª"
combos.item("a_^") := "ª"
combos.item("a^_") := "ª"
combos.item("-,") := "¬"
combos.item(",-") := "¬"
combos.item("oR") := "®"
combos.item("Or") := "®"
combos.item("oo") := "°"
combos.item("deg") := "°"
combos.item("mu") := "µ"
combos.item("p!") := "¶"
combos.item("!p") := "¶"
combos.item("PP") := "¶"
combos.item("par") := "¶"
combos.item("..") := "·"
combos.item(", ") := "¸"
combos.item(" ,") := "¸"
combos.item("º") := "^_o"
combos.item("oA") := "Å"
combos.item("Ao") := "Å"
combos.item("DH") := "Ð"
combos.item("HD") := "Ð"
combos.item("oa") := "å"
combos.item("ao") := "å"
combos.item("_A") := "Ā"
combos.item("A_") := "Ā"
combos.item("a_") := "ā"
combos.item("_a") := "ā"
combos.item("UA") := "Ă"
combos.item("bA") := "Ă"
combos.item("Ua") := "ă"
combos.item("ba") := "ă"
combos.item("A;") := "Ą"
combos.item(";A") := "Ą"
combos.item("a;") := "ą"
combos.item(";a") := "ą"
combos.item("C'") := "Ć"
combos.item("'C") := "Ć"
combos.item("c'") := "ć"
combos.item("'c") := "ć"
combos.item("C´") := "Ć"
combos.item("´C") := "Ć"
combos.item("c´") := "ć"
combos.item("´c") := "ć"
combos.item("C^") := "Ĉ"
combos.item("^C") := "Ĉ"
combos.item("c^") := "ĉ"
combos.item("^c") := "ĉ"
combos.item("cC") := "Č"
combos.item("Cv") := "Č"
combos.item("vC") := "Č"
combos.item("cc") := "č"
combos.item("cv") := "č"
combos.item("vc") := "č"
combos.item("cD") := "Ď"
combos.item("Dv") := "Ď"
combos.item("vD") := "Ď"
combos.item("cd") := "ď"
combos.item("/D") := "Đ"
combos.item("-d") := "đ"
combos.item("/d") := "đ"
combos.item("E_") := "Ē"
combos.item("_E") := "Ē"
combos.item("e_") := "ē"
combos.item("_e") := "ē"
combos.item("UE") := "Ĕ"
combos.item("bE") := "Ĕ"
combos.item("Ue") := "ĕ"
combos.item("be") := "ĕ"
combos.item(";E") := "Ę"
combos.item("E;") := "Ę"
combos.item(";e") := "ę"
combos.item("e;") := "ę"
combos.item("cE") := "Ě"
combos.item("vE") := "Ě"
combos.item("Ev") := "Ě"
combos.item("ce") := "ě"
combos.item("ve") := "ě"
combos.item("ev") := "ě"
combos.item("G^") := "Ĝ"
combos.item("^G") := "Ĝ"
combos.item("g^") := "ĝ"
combos.item("^g") := "ĝ"
combos.item("bG") := "Ğ"
combos.item("UG") := "Ğ"
combos.item("bg") := "ğ"
combos.item("Ug") := "ğ"
combos.item(",G") := "Ģ"
combos.item("G,") := "Ģ"
combos.item(",g") := "ģ"
combos.item("g,") := "ģ"
combos.item("^H") := "Ĥ"
combos.item("H^") := "Ĥ"
combos.item("h^") := "ĥ"
combos.item("^h") := "ĥ"
combos.item("H-") := "Ħ"
combos.item("-H") := "Ħ"
combos.item("H-") := "Ħ"
combos.item("-H") := "Ħ"
combos.item("/h") := "ħ"
combos.item("h/") := "ħ"
combos.item("-h") := "ħ"
combos.item("h-") := "ħ"
combos.item("~I") := "Ĩ"
combos.item("I~") := "Ĩ"
combos.item("i~") := "ĩ"
combos.item("~i") := "ĩ"
combos.item("_I") := "Ī"
combos.item("I_") := "Ī"
combos.item("_i") := "ī"
combos.item("i_") := "ī"
combos.item("bI") := "Ĭ"
combos.item("UI") := "Ĭ"
combos.item("bi") := "ĭ"
combos.item("Ui") := "ĭ"
combos.item(",I") := "Į"
combos.item("I,") := "Į"
combos.item("i,") := "į"
combos.item(",i") := "į"
combos.item(".i") := "ı"
combos.item("i.") := "ı"
combos.item("^J") := "Ĵ"
combos.item("J^") := "Ĵ"
combos.item("j^") := "ĵ"
combos.item("^J") := "ĵ"
combos.item(",K") := "Ķ"
combos.item("K,") := "Ķ"
combos.item(",k") := "ķ"
combos.item("k,") := "ķ"
combos.item("kk") := "ĸ"
combos.item("'L") := "Ĺ"
combos.item("L'") := "Ĺ"
combos.item("'l") := "ĺ"
combos.item("l'") := "ĺ"
combos.item("´L") := "Ĺ"
combos.item("L´") := "Ĺ"
combos.item("´l") := "ĺ"
combos.item("l´") := "ĺ"
combos.item("L,") := "Ļ"
combos.item(",L") := "Ļ"
combos.item("l,") := "ļ"
combos.item(",l") := "ļ"
combos.item("cL") := "Ľ"
combos.item("vL") := "Ľ"
combos.item("Lv") := "Ľ"
combos.item("cl") := "ľ"
combos.item("vl") := "ľ"
combos.item("lv") := "ľ"
combos.item("L-") := "Ł"
combos.item("-L") := "Ł"
combos.item("/L") := "Ł"
combos.item("L/") := "Ł"
combos.item("l-") := "ł"
combos.item("-l") := "ł"
combos.item("/l") := "ł"
combos.item("l/") := "ł"
combos.item("'N") := "Ń"
combos.item("N'") := "Ń"
combos.item("'n") := "ń"
combos.item("n'") := "ń"
combos.item("´N") := "Ń"
combos.item("N´") := "Ń"
combos.item("´n") := "ń"
combos.item("n´") := "ń"
combos.item(",N") := "Ņ"
combos.item("N,") := "Ņ"
combos.item(",n") := "ņ"
combos.item("n,") := "ņ"
combos.item("Nv") := "Ň"
combos.item("vN") := "Ň"
combos.item("cN") := "Ň"
combos.item("cn") := "ň"
combos.item("nv") := "ň"
combos.item("vn") := "ň"
combos.item("NG") := "Ŋ"
combos.item("NJ") := "Ŋ"
combos.item("ng") := "ŋ"
combos.item("nj") := "ŋ"
combos.item("O_") := "Ō"
combos.item("_O") := "Ō"
combos.item("_o") := "ō"
combos.item("o_") := "ō"
combos.item("UO") := "Ŏ"
combos.item("OU") := "Ŏ"
combos.item("bO") := "Ŏ"
combos.item("oU") := "ŏ"
combos.item("Uo") := "ŏ"
combos.item("bo") := "ŏ"
combos.item("=O") := "Ő"
combos.item("O=") := "Ő"
combos.item("=o") := "ő"
combos.item("o=") := "ő"
combos.item("OE") := "Œ"
combos.item("oe") := "œ"
combos.item("'R") := "Ŕ"
combos.item("R'") := "Ŕ"
combos.item("'r") := "ŕ"
combos.item("r'") := "ŕ"
combos.item("´R") := "Ŕ"
combos.item("R´") := "Ŕ"
combos.item("´r") := "ŕ"
combos.item("r´") := "ŕ"
combos.item(",R") := "Ŗ"
combos.item("R,") := "Ŗ"
combos.item(",r") := "ŗ"
combos.item("r,") := "ŗ"
combos.item("cR") := "Ř"
combos.item("Rv") := "Ř"
combos.item("vR") := "Ř"
combos.item("rv") := "ř"
combos.item("vr") := "ř"
combos.item("cr") := "ř"
combos.item("'S") := "Ś"
combos.item("S'") := "Ś"
combos.item("'s") := "ś"
combos.item("s'") := "ś"
combos.item("´S") := "Ś"
combos.item("S´") := "Ś"
combos.item("´s") := "ś"
combos.item("s´") := "ś"
combos.item("^S") := "Ŝ"
combos.item("S^") := "Ŝ"
combos.item("^s") := "ŝ"
combos.item("s^") := "ŝ"
combos.item(",S") := "Ş"
combos.item("S,") := "Ş"
combos.item(",s") := "ş"
combos.item("s,") := "ş"
combos.item("vS") := "Š"
combos.item("Sv") := "Š"
combos.item("cS") := "Š"
combos.item("vS") := "š"
combos.item("Sv") := "š"
combos.item("cs") := "š"
combos.item("T,") := "Ţ"
combos.item(",T") := "Ţ"
combos.item(",t") := "ţ"
combos.item("t,") := "ţ"
combos.item("Tv") := "Ť"
combos.item("vT") := "Ť"
combos.item("cT") := "Ť"
combos.item("ct") := "ť"
combos.item("tv") := "ť"
combos.item("vt") := "ť"
combos.item("-T") := "Ŧ"
combos.item("T-") := "Ŧ"
combos.item("/T") := "Ŧ"
combos.item("T/") := "Ŧ"
combos.item("-t") := "ŧ"
combos.item("t-") := "ŧ"
combos.item("t/") := "ŧ"
combos.item("/t") := "ŧ"
combos.item("U~") := "Ũ"
combos.item("~U") := "Ũ"
combos.item("u~") := "ũ"
combos.item("~u") := "ũ"
combos.item("_U") := "Ū"
combos.item("U_") := "Ū"
combos.item("u_") := "ū"
combos.item("_u") := "ū"
combos.item("bU") := "Ŭ"
combos.item("UU") := "Ŭ"
combos.item("bu") := "ŭ"
combos.item("Uu") := "ŭ"
combos.item("u*") := "Ů"
combos.item("*u") := "Ů"
combos.item("uo") := "ů"
combos.item("ou") := "ů"
combos.item("=U") := "Ű"
combos.item("U=") := "Ű"
combos.item("u=") := "ű"
combos.item("=u") := "ű"
combos.item(",U") := "Ų"
combos.item("U,") := "Ų"
combos.item(";U") := "Ų"
combos.item("U;") := "Ų"
combos.item(";u") := "ų"
combos.item("u;") := "ų"
combos.item("u,") := "ų"
combos.item(",u") := "ų"
combos.item("^W") := "Ŵ"
combos.item("W^") := "Ŵ"
combos.item("^w") := "ŵ"
combos.item("w^") := "ŵ"
combos.item("Y^") := "Ŷ"
combos.item("^Y") := "Ŷ"
combos.item("^y") := "ŷ"
combos.item("^y") := "ŷ"
combos.item("Y""") := "Ÿ"
combos.item("""Y") := "Ÿ"
combos.item("''Y") := "Ÿ"
combos.item("Y''") := "Ÿ"
combos.item("¨Y") := "Ÿ"
combos.item("Y¨") := "Ÿ"
combos.item("'Z") := "Ź"
combos.item("Z'") := "Ź"
combos.item("'z") := "ź"
combos.item("z'") := "ź"
combos.item("´Z") := "Ź"
combos.item("Z´") := "Ź"
combos.item("´z") := "ź"
combos.item("z´") := "ź"
combos.item("cZ") := "Ž"
combos.item("vZ") := "Ž"
combos.item("Zv") := "Ž"
combos.item("cz") := "ž"
combos.item("zv") := "ž"
combos.item("vz") := "ž"
combos.item("fs") := "ſ"
combos.item("fS") := "ſ"
combos.item("b/") := "ƀ"
combos.item("/b") := "ƀ"
combos.item("b-") := "ƀ"
combos.item("-b") := "ƀ"
combos.item("-I") := "Ɨ"
combos.item("I-") := "Ɨ"
combos.item("/I") := "Ɨ"
combos.item("I/") := "Ɨ"
combos.item("-Z") := "Ƶ"
combos.item("Z-") := "Ƶ"
combos.item("/Z") := "Ƶ"
combos.item("Z/") := "Ƶ"
combos.item("/z") := "ƶ"
combos.item("z/") := "ƶ"
combos.item("-z") := "ƶ"
combos.item("z-") := "ƶ"
combos.item("cA") := "Ǎ"
combos.item("Av") := "Ǎ"
combos.item("vA") := "Ǎ"
combos.item("ca") := "ǎ"
combos.item("av") := "ǎ"
combos.item("va") := "ǎ"
combos.item("cI") := "Ǐ"
combos.item("Iv") := "Ǐ"
combos.item("vI") := "Ǐ"
combos.item("ci") := "ǐ"
combos.item("iv") := "ǐ"
combos.item("vi") := "ǐ"
combos.item("cO") := "Ǒ"
combos.item("Ov") := "Ǒ"
combos.item("vO") := "Ǒ"
combos.item("co") := "ǒ"
combos.item("ov") := "ǒ"
combos.item("vo") := "ǒ"
combos.item("cU") := "Ǔ"
combos.item("Uv") := "Ǔ"
combos.item("vU") := "Ǔ"
combos.item("cu") := "ǔ"
combos.item("uv") := "ǔ"
combos.item("vu") := "ǔ"
combos.item("/G") := "Ǥ"
combos.item("G/") := "Ǥ"
combos.item("-G") := "Ǥ"
combos.item("G-") := "Ǥ"
combos.item("g/") := "ǥ"
combos.item("/g") := "ǥ"
combos.item("g-") := "ǥ"
combos.item("-g") := "ǥ"
combos.item("cG") := "Ǧ"
combos.item("Gv") := "Ǧ"
combos.item("vG") := "Ǧ"
combos.item("cg") := "ǧ"
combos.item("gv") := "ǧ"
combos.item("vg") := "ǧ"
combos.item("cK") := "Ǩ"
combos.item("Kv") := "Ǩ"
combos.item("vK") := "Ǩ"
combos.item("ck") := "ǩ"
combos.item("kv") := "ǩ"
combos.item("vk") := "ǩ"
combos.item("O;") := "Ǫ"
combos.item(";O") := "Ǫ"
combos.item("o;") := "ǫ"
combos.item(";o") := "ǫ"
combos.item("O,") := "Ǫ"
combos.item(",O") := "Ǫ"
combos.item("o,") := "ǫ"
combos.item(",o") := "ǫ"
combos.item("cj") := "ǰ"
combos.item("jv") := "ǰ"
combos.item("vj") := "ǰ"
combos.item("'G") := "Ǵ"
combos.item("G'") := "Ǵ"
combos.item("'g") := "ǵ"
combos.item("g'") := "ǵ"
combos.item("´G") := "Ǵ"
combos.item("G´") := "Ǵ"
combos.item("´g") := "ǵ"
combos.item("g´") := "ǵ"
combos.item("N``") := "Ǹ"
combos.item("``N") := "Ǹ"
combos.item("``n") := "ǹ"
combos.item("n``") := "ǹ"
combos.item("cH") := "Ȟ"
combos.item("vH") := "Ȟ"
combos.item("Hv") := "Ȟ"
combos.item("ch") := "ȟ"
combos.item("vh") := "ȟ"
combos.item("hv") := "ȟ"
combos.item(",E") := "Ȩ"
combos.item("E,") := "Ȩ"
combos.item(",e") := "ȩ"
combos.item("e,") := "ȩ"
combos.item("_Y") := "Ȳ"
combos.item("Y_") := "Ȳ"
combos.item("_y") := "ȳ"
combos.item("y_") := "ȳ"
combos.item("ee") := "ə"
combos.item("!e") := "ə"
combos.item("i/") := "ɨ"
combos.item("/i") := "ɨ"
combos.item("i-") := "ɨ"
combos.item("-i") := "ɨ"
combos.item(",D") := "Ḑ"
combos.item("D,") := "Ḑ"
combos.item(",d") := "ḑ"
combos.item("d,") := "ḑ"
combos.item("_G") := "Ḡ"
combos.item("G_") := "Ḡ"
combos.item("_g") := "ḡ"
combos.item("g_") := "ḡ"
combos.item("''H") := "Ḧ"
combos.item("H''") := "Ḧ"
combos.item("¨H") := "Ḧ"
combos.item("H¨") := "Ḧ"
combos.item("""H") := "Ḧ"
combos.item("H""") := "Ḧ"
combos.item("''h") := "ḧ"
combos.item("h''") := "ḧ"
combos.item("¨h") := "ḧ"
combos.item("h¨") := "ḧ"
combos.item("""h") := "ḧ"
combos.item("h""") := "ḧ"
combos.item("H,") := "Ḩ"
combos.item(",H") := "Ḩ"
combos.item("h,") := "ḩ"
combos.item(",h") := "ḩ"
combos.item("'K") := "Ḱ"
combos.item("K'") := "Ḱ"
combos.item("'k") := "ḱ"
combos.item("k'") := "ḱ"
combos.item("'M") := "Ḿ"
combos.item("M'") := "Ḿ"
combos.item("'m") := "ḿ"
combos.item("m'") := "ḿ"
combos.item("'P") := "Ṕ"
combos.item("P'") := "Ṕ"
combos.item("'p") := "ṕ"
combos.item("p'") := "ṕ"
combos.item("´K") := "Ḱ"
combos.item("K´") := "Ḱ"
combos.item("´k") := "ḱ"
combos.item("k´") := "ḱ"
combos.item("´M") := "Ḿ"
combos.item("M´") := "Ḿ"
combos.item("´m") := "ḿ"
combos.item("m´") := "ḿ"
combos.item("´P") := "Ṕ"
combos.item("P´") := "Ṕ"
combos.item("´p") := "ṕ"
combos.item("p´") := "ṕ"
combos.item("~V") := "Ṽ"
combos.item("V~") := "Ṽ"
combos.item("v~") := "ṽ"
combos.item("~v") := "ṽ"
combos.item("``W") := "Ẁ"
combos.item("W``") := "Ẁ"
combos.item("``w") := "ẁ"
combos.item("w``") := "ẁ"
combos.item("'W") := "Ẃ"
combos.item("W'") := "Ẃ"
combos.item("w'") := "ẃ"
combos.item("'w") := "ẃ"
combos.item("´W") := "Ẃ"
combos.item("W´") := "Ẃ"
combos.item("w´") := "ẃ"
combos.item("´w") := "ẃ"
combos.item("W''") := "Ẅ"
combos.item("''W") := "Ẅ"
combos.item("¨W") := "Ẅ"
combos.item("W¨") := "Ẅ"
combos.item("W""") := "Ẅ"
combos.item("""W") := "Ẅ"
combos.item("w''") := "ẅ"
combos.item("''w") := "ẅ"
combos.item("¨w") := "ẅ"
combos.item("w¨") := "ẅ"
combos.item("w""") := "ẅ"
combos.item("""w") := "ẅ"
combos.item("''X") := "Ẍ"
combos.item("X''") := "Ẍ"
combos.item("¨X") := "Ẍ"
combos.item("X¨") := "Ẍ"
combos.item("X""") := "Ẍ"
combos.item("""X") := "Ẍ"
combos.item("''x") := "ẍ"
combos.item("x''") := "ẍ"
combos.item("¨x") := "ẍ"
combos.item("x¨") := "ẍ"
combos.item("x""") := "ẍ"
combos.item("""x") := "ẍ"
combos.item("^Z") := "Ẑ"
combos.item("Z^") := "Ẑ"
combos.item("^z") := "ẑ"
combos.item("z^") := "ẑ"
combos.item("t''") := "ẗ"
combos.item("''t") := "ẗ"
combos.item("¨t") := "ẗ"
combos.item("t¨") := "ẗ"
combos.item("""t") := "ẗ"
combos.item("t""") := "ẗ"
combos.item("w*") := "ẘ"
combos.item("*w") := "ẘ"
combos.item("ow") := "ẘ"
combos.item("wo") := "ẘ"
combos.item("y*") := "ẙ"
combos.item("*y") := "ẙ"
combos.item("oy") := "ẙ"
combos.item("yo") := "ẙ"
combos.item("~E") := "Ẽ"
combos.item("E~") := "Ẽ"
combos.item("~e") := "ẽ"
combos.item("e~") := "ẽ"
combos.item("``Y") := "Ỳ"
combos.item("Y``") := "Ỳ"
combos.item("``y") := "ỳ"
combos.item("y``") := "ỳ"
combos.item("~Y") := "Ỹ"
combos.item("Y~") := "Ỹ"
combos.item("~y") := "ỹ"
combos.item("y~") := "ỹ"
combos.item(" .") := " " ;punctuation space. thin space?
combos.item(" ") := " "
combos.item("--") := "–"
combos.item("--.") := "–"
combos.item("---") := "—"
combos.item("'<") := "‘"
combos.item("<'") := "‘"
combos.item("'>") := "’"
combos.item(">'") := "’"
combos.item("',") := "‚"
combos.item(",'") := "‚"
combos.item("""<") := "“"
combos.item("<""") := "“"
combos.item(""">") := "”"
combos.item(">""") := "”"
combos.item(""",") := "„"
combos.item(",""") := "„"
combos.item("%0") := "‰"
combos.item("%o") := "‰"
combos.item("%O") := "‰"
combos.item(".<") := "‹"
combos.item(".>") := "›"
;---------------------Sup/sub scripts
combos.item("^0") := "⁰"
combos.item("^4") := "⁴"
combos.item("^5") := "⁵"
combos.item("^6") := "⁶"
combos.item("^7") := "⁷"
combos.item("^8") := "⁸"
combos.item("^9") := "⁹"
combos.item("^+") := "⁺"
combos.item("^=") := "⁼"
combos.item("^(") := "⁽"
combos.item("^)") := "⁾"
combos.item("^_n") := "ⁿ"
combos.item("^n") := "ⁿ"
combos.item("_0") := "₀"
combos.item("_1") := "₁"
combos.item("_2") := "₂"
combos.item("_3") := "₃"
combos.item("_4") := "₄"
combos.item("_5") := "₅"
combos.item("_6") := "₆"
combos.item("_7") := "₇"
combos.item("_8") := "₈"
combos.item("_9") := "₉"
combos.item("_+") := "₊"
combos.item("_=") := "₌"
combos.item("_(") := "₍"
combos.item("_)") := "₎"
;-----------------------Currency
combos.item("CE") := "₠"
combos.item("/C") := "₡"
combos.item("C/") := "₡"
combos.item("Cr") := "₢"
combos.item("F=") := "₣"
combos.item("=F") := "₣"
combos.item("F-") := "₣"
combos.item("-F") := "₣"
combos.item("Fr") := "₣"
combos.item("=L") := "₤"
combos.item("L=") := "₤"
combos.item("-L") := "£"
combos.item("L-") := "£"
combos.item("m/") := "₥"
combos.item("/m") := "₥"
combos.item("=N") := "₦"
combos.item("N=") := "₦"
combos.item("Pt") := "₧"
combos.item("Rs") := "₨"
combos.item("=W") := "₩"
combos.item("W=") := "₩"
combos.item("w=") := "₩"
combos.item("=w") := "₩"
combos.item("-d") := "₫"
combos.item("d-") := "₫"
combos.item("=C") := "€"
combos.item("C=") := "€"
combos.item("=E") := "€"
combos.item("E=") := "€"
combos.item("=c") := "€"
combos.item("c=") := "€"
combos.item("^sm") := "℠"
combos.item("^SM") := "℠"
combos.item("^tm") := "™"
combos.item("^TM") := "™"
combos.item("""\") := "〝"
combos.item("""/") := "〞"
;------------------------Additional
combos.item(". ") := " " ;thin space
combos.item(" .") := " " ;thin space
combos.item("| ") := " " ;thin space
combos.item(" |") := " " ;thin space
combos.item("n ") := " " ;n space
combos.item(" n") := " " ;n space
combos.item("m ") := " " ;m space
combos.item(" m") := " " ;m space
combos.item("<-") := "←"
combos.item("->") := "→"
combos.item("^|") := "↑"
combos.item("|^") := "↑"
combos.item("|v") := "↓"
combos.item("v|") := "↓"
combos.item("<3") := "♥"
combos.item("CCCP") := "☭"
;---------------------------Arrow combos
;-------------------TODO: fix it up
combos.item("←→") := "↔"
combos.item("↑↓") := "↕"
combos.item("↓↑") := "↕"
combos.item("←/") := "↚"
combos.item("/←") := "↚"
combos.item("→/") := "↛"
combos.item("/→") := ""
combos.item("↑←") := "↰"
combos.item("↑→") := "↱"
combos.item("↓←") := "↲"
combos.item("↓→") := "↳"
combos.item("→↓") := "↴"
combos.item("↓←-") := "↵"
combos.item("→>") := ""
combos.item(">→") := ""
combos.item("→=") := ""
combos.item("=→") := ""
combos.item("-→") := ""
combos.item("→-") := ""


;=============================================HTML codes
; |     |  =======  |\   /|   |
; |=====|     |     | \ / |   |
; |     |     |     |  v  |   |____

htmlCodes := ComObjCreate("Scripting.Dictionary")

;---------------------------------math
htmlCodes.item("forall") := "∀"
htmlCodes.item("part") := "∂"
htmlCodes.item("exist") := "∃"
htmlCodes.item("empty") := "∅"
htmlCodes.item("nabla") := "∇"
htmlCodes.item("gradient") := "∇"
htmlCodes.item("grad") := "∇"
htmlCodes.item("Grad") := "∇"
htmlCodes.item("Gradient") := "∇"
htmlCodes.item("isin") := "∈"
htmlCodes.item("notin") := "∉"
htmlCodes.item("ni") := "∋"
htmlCodes.item("prod") := "∏"
htmlCodes.item("sum") := "∑"
htmlCodes.item("minus") := "−"
htmlCodes.item("lowast") := "∗"
htmlCodes.item("radic") := "√"
htmlCodes.item("sqrt") := "√"
htmlCodes.item("prop") := "∝"
htmlCodes.item("infin") := "∞"
htmlCodes.item("inf") := "∞"
htmlCodes.item("infinity") := "∞"
htmlCodes.item("ang") := "∠"
htmlCodes.item("and") := "∧"
htmlCodes.item("or") := "∨"
htmlCodes.item("land") := "∧"
htmlCodes.item("lor") := "∨"
htmlCodes.item("cap") := "∩"
htmlCodes.item("cup") := "∪"
htmlCodes.item("int") := "∫"
htmlCodes.item("there4") := "∴"
htmlCodes.item("sim") := "∼"
htmlCodes.item("cong") := "≅"
htmlCodes.item("asymp") := "≈"
htmlCodes.item("ne") := "≠"
htmlCodes.item("equiv") := "≡"
htmlCodes.item("le") := "≤"
htmlCodes.item("ge") := "≥"
htmlCodes.item("sub") := "⊂"
htmlCodes.item("sup") := "⊃"
htmlCodes.item("nsub") := "⊄"
htmlCodes.item("sube") := "⊆"
htmlCodes.item("supe") := "⊇"
htmlCodes.item("oplus") := "⊕"
htmlCodes.item("otimes") := "⊗"
htmlCodes.item("times") := "×"
htmlCodes.item("mult") := "×"
htmlCodes.item("omult") := "⊗"
htmlCodes.item("perp") := "⊥"
htmlCodes.item("sdot") := "⋅"
;--------------------------Greek letters
htmlCodes.item("Alpha") := "Α"
htmlCodes.item("Beta") := "Β"
htmlCodes.item("Gamma") := "Γ"
htmlCodes.item("Delta") := "Δ"
htmlCodes.item("Epsilon") := "Ε"
htmlCodes.item("Zeta") := "Ζ"
htmlCodes.item("Eta") := "Η"
htmlCodes.item("Theta") := "Θ"
htmlCodes.item("Iota") := "Ι"
htmlCodes.item("Kappa") := "Κ"
htmlCodes.item("Lambda") := "Λ"
htmlCodes.item("Mu") := "Μ"
htmlCodes.item("Nu") := "Ν"
htmlCodes.item("Xi") := "Ξ"
htmlCodes.item("Omicron") := "Ο"
htmlCodes.item("Pi") := "Π"
htmlCodes.item("Rho") := "Ρ"
htmlCodes.item("Sigmaf") := " "
htmlCodes.item("Sigma") := "Σ"
htmlCodes.item("Tau") := "Τ"
htmlCodes.item("Upsilon") := "Υ"
htmlCodes.item("Phi") := "Φ"
htmlCodes.item("Chi") := "Χ"
htmlCodes.item("Psi") := "Ψ"
htmlCodes.item("Omega") := "Ω"
htmlCodes.item("alpha") := "α"
htmlCodes.item("alfa") := "α"
htmlCodes.item("beta") := "β"
htmlCodes.item("gamma") := "γ"
htmlCodes.item("delta") := "δ"
htmlCodes.item("epsilon") := "ε"
htmlCodes.item("zeta") := "ζ"
htmlCodes.item("eta") := "η"
htmlCodes.item("theta") := "θ"
htmlCodes.item("iota") := "ι"
htmlCodes.item("kappa") := "κ"
htmlCodes.item("lambda") := "λ"
htmlCodes.item("mu") := "μ"
htmlCodes.item("nu") := "ν"
htmlCodes.item("xi") := "ξ"
htmlCodes.item("omicron") := "ο"
htmlCodes.item("pi") := "π"
htmlCodes.item("rho") := "ρ"
htmlCodes.item("sigmaf") := "ς"
htmlCodes.item("sigma") := "σ"
htmlCodes.item("tau") := "τ"
htmlCodes.item("upsilon") := "υ"
htmlCodes.item("phi") := "φ"
htmlCodes.item("chi") := "χ"
htmlCodes.item("psi") := "ψ"
htmlCodes.item("omega") := "ω"
htmlCodes.item("thetasym") := "ϑ"
htmlCodes.item("upsih") := "ϒ"
htmlCodes.item("piv") := "ϖ"
;------------------------typographic
htmlCodes.item("OElig") := "Œ"
htmlCodes.item("oelig") := "œ"
htmlCodes.item("Scaron") := "Š"
htmlCodes.item("scaron") := "š"
htmlCodes.item("Yuml") := "Ÿ"
htmlCodes.item("fnof") := "ƒ"
htmlCodes.item("corc") := "ˆ"
htmlCodes.item("tilde") := "˜"
htmlCodes.item("ensp") := " "
htmlCodes.item("nsp") := " "
htmlCodes.item("emsp") := " "
htmlCodes.item("msp") := " "
htmlCodes.item("thinsp") := " "
htmlCodes.item("zwnj") := ""
htmlCodes.item("zwj") := ""
htmlCodes.item("lrm") := ""
htmlCodes.item("rlm") := ""
htmlCodes.item("ndash") := "–"
htmlCodes.item("endash") := "–"
htmlCodes.item("mdash") := "—"
htmlCodes.item("emdash") := "—"
htmlCodes.item("lsquo") := "‘"
htmlCodes.item("rsquo") := "’"
htmlCodes.item("sbquo") := "‚"
htmlCodes.item("bsquo") := "‚"
htmlCodes.item("ldquo") := "“"
htmlCodes.item("rdquo") := "”"
htmlCodes.item("bdquo") := "„"
htmlCodes.item("dagger") := "†"
htmlCodes.item("Dagger") := "‡"
htmlCodes.item("bull") := "•"
htmlCodes.item("bullet") := "•"
htmlCodes.item("hellip") := "…"
htmlCodes.item("ell") := "…"
htmlCodes.item("ellipsis") := "…"
htmlCodes.item("permil") := "‰"
htmlCodes.item("prime") := "′"
htmlCodes.item("min") := "′"
htmlCodes.item("minutes") := "′"
htmlCodes.item("Prime") := "″"
htmlCodes.item("sec") := "″"
htmlCodes.item("seconds") := "″"
htmlCodes.item("lsaquo") := "‹"
htmlCodes.item("rsaquo") := "›"
htmlCodes.item("overline") := "‾"
htmlCodes.item("oline") := "‾"
htmlCodes.item("eur") := "€"
htmlCodes.item("euro") := "€"
htmlCodes.item("trade") := "™"
htmlCodes.item("tm") := "™"
htmlCodes.item("larr") := "←"
htmlCodes.item("uarr") := "↑"
htmlCodes.item("rarr") := "→"
htmlCodes.item("darr") := "↓"
htmlCodes.item("harr") := "↔"
htmlCodes.item("carr") := "↵"
htmlCodes.item("lceil") := "⌈"
htmlCodes.item("rceil") := "⌉"
htmlCodes.item("lfloor") := "⌊"
htmlCodes.item("rfloor") := "⌋"
htmlCodes.item("loz") := "◊"
htmlCodes.item("spades") := "♠"
htmlCodes.item("clubs") := "♣"
htmlCodes.item("hearts") := "♥"
htmlCodes.item("diams") := "♦"
htmlCodes.item("iexcl") := "¡"
htmlCodes.item("!excl") := "¡"
htmlCodes.item("cent") := "¢"
htmlCodes.item("pound") := "£"
htmlCodes.item("curren") := "¤"
htmlCodes.item("yen") := "¥"
htmlCodes.item("brvbar") := "¦"
htmlCodes.item("sect") := "§"
htmlCodes.item("section") := "§"
htmlCodes.item("uml") := "¨"
htmlCodes.item("umlaut") := "¨"
htmlCodes.item("copy") := "©"
htmlCodes.item("copyright") := "©"
htmlCodes.item("ordf") := "ª"
htmlCodes.item("laquo") := "«"
htmlCodes.item("raquo") := "»"
htmlCodes.item("not") := "¬"
htmlCodes.item("deg") := "°"
htmlCodes.item("plusmn") := "±"
htmlCodes.item("sup1") := "¹"
htmlCodes.item("sup2") := "²"
htmlCodes.item("sup3") := "³"
htmlCodes.item("acutex") := "´"
htmlCodes.item("micro") := "µ"
htmlCodes.item("para") := "¶"
htmlCodes.item("par") := "¶"
htmlCodes.item("middot") := "·"
htmlCodes.item("cedil") := "¸"
htmlCodes.item("frac14") := "¼"
htmlCodes.item("frac12") := "½"
htmlCodes.item("frac13") := "⅓"
htmlCodes.item("frac15") := "⅕"
htmlCodes.item("frac16") := "⅙"
htmlCodes.item("frac17") := "⅐"
htmlCodes.item("frac18") := "⅛"
htmlCodes.item("frac19") := "⅑"
htmlCodes.item("frac23") := "⅔"
htmlCodes.item("frac25") := "⅖"
htmlCodes.item("frac34") := "¾"
htmlCodes.item("frac45") := "⅘"
htmlCodes.item("iquest") := "¿"
htmlCodes.item("!quest") := "¿"
;--------------------diacritics & modifications
htmlCodes.item("Agrave") := "À"
htmlCodes.item("Aacute") := "Á"
htmlCodes.item("Acirc") := "Â"
htmlCodes.item("Atilde") := "Ã"
htmlCodes.item("Auml") := "Ä"
htmlCodes.item("Aring") := "Å"
htmlCodes.item("AElig") := "Æ"
htmlCodes.item("Ccedil") := "Ç"
htmlCodes.item("Egrave") := "È"
htmlCodes.item("Eacute") := "É"
htmlCodes.item("Ecirc") := "Ê"
htmlCodes.item("Euml") := "Ë"
htmlCodes.item("Igrave") := "Ì"
htmlCodes.item("Iacute") := "Í"
htmlCodes.item("Icirc") := "Î"
htmlCodes.item("Iuml") := "Ï"
htmlCodes.item("ETH") := "Ð"
htmlCodes.item("Ntilde") := "Ñ"
htmlCodes.item("Ograve") := "Ò"
htmlCodes.item("Oacute") := "Ó"
htmlCodes.item("Ocirc") := "Ô"
htmlCodes.item("Otilde") := "Õ"
htmlCodes.item("Ouml") := "Ö"
htmlCodes.item("Oslash") := "Ø"
htmlCodes.item("Ugrave") := "Ù"
htmlCodes.item("Uacute") := "Ú"
htmlCodes.item("Ucirc") := "Û"
htmlCodes.item("Uuml") := "Ü"
htmlCodes.item("Yacute") := "Ý"
htmlCodes.item("THORN") := "Þ"
htmlCodes.item("szlig") := "ß"
htmlCodes.item("agrave") := "à"
htmlCodes.item("aacute") := "á"
htmlCodes.item("acirc") := "â"
htmlCodes.item("atilde") := "ã"
htmlCodes.item("auml") := "ä"
htmlCodes.item("aring") := "å"
htmlCodes.item("aelig") := "æ"
htmlCodes.item("ccedil") := "ç"
htmlCodes.item("egrave") := "è"
htmlCodes.item("eacute") := "é"
htmlCodes.item("ecirc") := "ê"
htmlCodes.item("euml") := "ë"
htmlCodes.item("igrave") := "ì"
htmlCodes.item("iacute") := "í"
htmlCodes.item("icirc") := "î"
htmlCodes.item("iuml") := "ï"
htmlCodes.item("eth") := "ð"
htmlCodes.item("ntilde") := "ñ"
htmlCodes.item("ograve") := "ò"
htmlCodes.item("oacute") := "ó"
htmlCodes.item("ocirc") := "ô"
htmlCodes.item("otilde") := "õ"
htmlCodes.item("ouml") := "ö"
htmlCodes.item("divide") := "÷"
htmlCodes.item("oslash") := "ø"
htmlCodes.item("ugrave") := "ù"
htmlCodes.item("uacute") := "ú"
htmlCodes.item("ucirc") := "û"
htmlCodes.item("uuml") := "ü"
htmlCodes.item("yacute") := "ý"
htmlCodes.item("thorn") := "þ"
htmlCodes.item("yuml") := "ÿ"


;==================================================Additional extensions
; |=====  \  /  =======
; |____    \/      |
; |        /\      |
; |_____  /  \     |

extensions := ComObjCreate("Scripting.Dictionary")

;-----------------------------------------Compose extensions
extensions.item("..") := "‥"
extensions.item("...") := "…"
extensions.item("!?") := "‽"
extensions.item("?!") := "‽"
extensions.item("***") := "⁂"
extensions.item("((") := "⁂"
extensions.item("))") := "⦆"
extensions.item("~~") := "≈"
extensions.item("~-") := "≃"
extensions.item("-~") := "≃"
extensions.item("+-") := "±"
extensions.item("-+") := "∓"
extensions.item("!~") := "∽"
extensions.item("<=") := "≤"
extensions.item("<==") := "≦"
extensions.item(">=") := "≥"
extensions.item(">==") := "≧"
extensions.item("<<") := "≪"
extensions.item(">>") := "≫"
extensions.item("<~") := "≲"
extensions.item(">~") := "≳"
extensions.item("<>") := "≶"
extensions.item("><") := "≷"
extensions.item("==") := "≡"
extensions.item("!=") := "≠"
extensions.item("1/2") := "½"
extensions.item("1/3") := "⅓"
extensions.item("1/4") := "¼"
extensions.item("1/5") := "⅕"
extensions.item("1/6") := "⅙"
extensions.item("1/7") := "⅐"
extensions.item("1/8") := "⅛"
extensions.item("1/9") := "⅑"
extensions.item("1/10") := "⅒"
extensions.item("2/3") := "⅔"
extensions.item("2/5") := "⅖"
extensions.item("3/4") := "¾"
extensions.item("3/5") := "⅗"
extensions.item("3/8") := "⅜"
extensions.item("4/5") := "⅘"
extensions.item("5/6") := "⅚"
extensions.item("5/8") := "⅝"
extensions.item("7/8") := "⅞"
extensions.item("i=") := "₪"
extensions.item("e=") := "€"
extensions.item("CE") := "₠"
extensions.item("F=") := "₣"
extensions.item("Fr=") := "₣"
extensions.item("gb=") := "£"
extensions.item("y=") := "¥"
extensions.item("R-") := "⃏"
extensions.item("P-") := "⃏"
extensions.item("Р-") := "⃏"
extensions.item("T=") := "₮"
extensions.item("Т=") := "₮"
extensions.item("") := ""

;--------------------------------------------Named extensions
extensions.item("inf") := "∞"
extensions.item("infinity") := "∞"
extensions.item("forall") := "∀"
extensions.item("for all") := "∀"
extensions.item("there exists") := "∃"
extensions.item("thereexists") := "∃"
extensions.item("theredoesntexists") := "∄"
extensions.item("there doesn't exists") := "∄"
extensions.item("complement") := "∁"
extensions.item("diff") := "∂"
extensions.item("dif") := "∂"
extensions.item("differential") := "∂"
extensions.item("empty") := "∅"
extensions.item("element of") := "∈"
extensions.item("elementof") := "∈"
extensions.item("notanelementof") := "∉"
extensions.item("not an element of") := "∉"
extensions.item("not element of") := "∉"
extensions.item("small element of") := "∊"
extensions.item("smallelementof") := "∊"
extensions.item("containsasmember") := "∋"
extensions.item("contains as member") := "∋"
extensions.item("does not contain as member") := "∌"
extensions.item("doesnotcontainasmember") := "∌"
extensions.item("subset of") := "⊂"
extensions.item("superset of") := "⊃"
extensions.item("subsetof") := "⊂"
extensions.item("supersetof") := "⊃"
extensions.item("right angle") := "∟"
extensions.item("90deg") := "∟"
extensions.item("90 angle") := "∟"
extensions.item("angle") := "∠"
extensions.item("sqrt") := "√"
extensions.item("square root") := "√"
extensions.item("cube root") := "∛"
extensions.item("cuberoot") := "∛"
extensions.item("fourthroot") := "∜"
extensions.item("fourth root") := "∜"
extensions.item("hypercube root") := "∜"
extensions.item("hypercuberoot") := "∜"
extensions.item("and") := "∧"
extensions.item("disjunction") := "∧"
extensions.item("or") := "∨"
extensions.item("conjunction") := "∨"
extensions.item("intersection") := "∩"
extensions.item("union") := "∪"
extensions.item("integral") := "∫"
extensions.item("double integral") := "∬"
extensions.item("doubleintegral") := "∭"
extensions.item("triple integral") := "∬"
extensions.item("tripleintegral") := "∭"
extensions.item("star") := "★"
extensions.item("check") := "☑"
extensions.item("check2") := "☒"
extensions.item("ok") := "✓"
extensions.item("phone") := "✆"
extensions.item("mail") := "✉"
extensions.item("email") := "✉"
extensions.item("home") := "⌂"
extensions.item("house") := "⌂"
extensions.item("cloud") := "☁"
extensions.item("wave") := "⌇"
extensions.item("hot") := "♨"
extensions.item("piece") := "☮"
extensions.item("victory") := "✌"
extensions.item("radioactive") := "☢"
extensions.item("death") := "☠"
extensions.item("smile") := "☺"
extensions.item("black smile") := "☻"
extensions.item("blacksmile") := "☻"
extensions.item("medicine") := "☤"
extensions.item("plane") := "✈"
extensions.item("comet") := "☄"
extensions.item("hand left") := "☜"
extensions.item("handleft") := "☜"
extensions.item("handtop") := "☝"
extensions.item("hand top") := "☝"
extensions.item("handright") := "☞"
extensions.item("hand right") := "☞"
extensions.item("black hand right") := "☛"
extensions.item("black hand left") := "☚"
extensions.item("blackhandright") := "☛"
extensions.item("blackhandleft") := "☚"
extensions.item("handdown") := "☟"
extensions.item("hand down") := "☟"
extensions.item("command") := "⌘"
extensions.item("cent") := "¢"
extensions.item("CENT") := "￠"
extensions.item("ils") := "₪"
extensions.item("eur") := "€"
extensions.item("eurocurrency") := "₠"
extensions.item("currencyexchange") := "₠"
extensions.item("mnt") := "₮"
extensions.item("rub") := "⃏"
extensions.item("roub") := "⃏"
extensions.item("ru") := "⃏"
extensions.item("rur") := "⃏"
extensions.item("gbp") := "£"
extensions.item("jpy") := "¥"
extensions.item("currency") := "¤"
extensions.item("") := ""

;============================================================Main handler
lastResult := "" ;stores last found symbol
getCombo(list, cmb){
    global lastResult := ""
    str := list.item(cmb)
    if (str){
        lastResult := str
        return true
    }
    return false
}
;----------------------Clear n last symbols
clear(n){
    Loop, %n% {
        SendInput {BS}
    }
}
;----------------------Tries to convert passed code to symbol
getUTF(code){
    If RegExMatch(DataIn, "^[0-9a-fA-F]+$")
    {
      Loop % StrLen(DataIn) / 2
         UTF8Code .= Chr("0x" . SubStr(DataIn, A_Index * 2 - 1, 2))
    }
}
;-------------------------Mac diacritics listener. Waits for letter to input and tries to find it
listenDiacritics(diacr){
    global lastResult
    global combos
    global extensions
    SendInput {raw}%diacr%
    Input targetChr, * L1 V C, {CtrlBreak}
    if (ErrorLevel == "NewInput"){
        return
    }
    targetChr := diacr . targetChr
    getCombo(combos, targetChr) || getCombo(extensions, targetChr)
    if (lastResult){
        clear(StrLen(targetChr))
        SendInput %lastResult%    
    }
    return
}

;========================================================Compose key handler
RAlt::
    ;Cunning hook: RAlt Up sends {CtrlBreak} that stops Input that RAlt has started. 
    Input, combo, V C,{CtrlBreak}
    ;RAlt continues to perform and tries to find passed combination.    
    getCombo(combos, combo) || getCombo(htmlCodes, combo) || getCombo(extensions, combo)
    if (lastResult){
        clear(StrLen(combo))
        SendInput %lastResult%
    }
    return

RAlt Up::
    Send {CtrlBreak}
    return

;=========================================================Symbol sequences handler
;~[ Up::
~sc01a Up::
    ;TODO: make something to ignore not [] as input.
    Input, combo, V C, {sc01a}{sc01b}[]
    if (ErrorLevel == "EndKey:]" || ErrorLevel == "EndKey:sc01B") { ;finish sequence
        getCombo(combos, combo) || getCombo(htmlCodes, combo) || getCombo(extensions, combo)
        if (lastResult) {
            clear(StrLen(combo)+2)
            SendInput %lastResult%
        }
    }
    return

;========================================================Mac diacritics handlers
;!n::
;!~::
!sc031::
+!sc029::
    listenDiacritics("~")
    return

;!`::
!sc029::
    listenDiacritics("``")
    return

;+!
+!sc028::
    SendInput Æ
    return

;!'::
!sc028::
    SendInput æ
    return

;!e::
;!'::
!sc012::
;!sc028:: ;superceded by ae
    listenDiacritics("´")
    return

;!i::
;!^::
!sc017::
+!sc007::
    listenDiacritics("^")
    return

;!u::
;!"::
!sc016::
;+!sc028::
    listenDiacritics("¨")
    return

;+!a::
+!sc01e::
    SendInput Å
    return
;+!c::
+!sc02e::
    SendInput Ç
    return
!sc02e::
    SendInput ç
    return
;+!o::
+!sc18::
    SendInput Ø
    return
!sc18::
    SendInput ø
    return



;===========================================================Hotkeys
;^+!w::
^+!sc011::
    SendInput „
    return
;^+![::
^+!sc01A:: 
    SendInput „
    return
;+![::
+!sc01A::
    SendInput ”
    return
;![::
!sc01A::
    SendInput “
    return

;^+!]::
^+!sc01b::
    SendInput ‚
    return
;+!]::
+!sc01b::
    SendInput ’
    return
;!]::
!sc01b::
    SendInput ‘
    return

;+!t::
+!sc014::
    SendInput ‡
    return
;!t::
!sc014::
    SendInput †
    return

+!7::
    SendInput ‡
    return

;!;::
!sc027::
    SendInput …
    return

;+!r::
+!sc013::
    SendInput ‰
    return

+!3::
    SendInput ‹
    return
+!4::
    SendInput ›
    return

!2::
    SendInput ™
    return

+!-::
    SendInput —
    return
;!-::
!-::
    SendInput –
    return

!1::
    SendInput ¡
    return
!4::
    SendInput ¢
    return
!3::
    SendInput £
    return
;!y::
!sc015::
    SendInput ¥
    return
!6::
    SendInput §
    return
;+!u::
+!sc016::
    SendInput ¨
    return
;!g::
!sc022::
    SendInput ©
    return
!9::
    SendInput ª
    return
;+!\::
+!\::
    SendInput »
    return
;!\::
!\::
    SendInput «
    return
;!l::
!sc026::
    SendInput ¬
    return
;!r::
!sc013::
    SendInput ®
    return
+!8::
    SendInput °
    return
;+!=::
+!=::
    SendInput ±
    return
;+!e::
+!sc012::
    SendInput ´
    return
;!m::
!sc032::
    SendInput µ
    return
!7::
    SendInput ¶
    return
+!9::
    SendInput ·
    return
;+!z::
+!sc02c::
    SendInput ¸
    return
!0::
    SendInput º
    return
;+!?::
+!?::
    SendInput ¿
    return
;!s::
!sc01f::
    SendInput ß
    return
;!a::
!sc01e::
    SendInput å
    return

!Space::
    KeyWait Alt
    SendInput  
    return



;!*::
;+!8::
;    SendInput ×
;    return
^!*::
^+!8::
    SendInput ∙
    return

+^!=::
    SendInput ≡
    return

!=::→
    SendInput ≠
    return

!.::
    SendInput ∙
    return
+!.::
    SendInput •
    return
+!^.::
    SendInput ●
    return

::...::…
::(c)::©
::(r)::® 
::(tm)::™
::(sm)::℠

!^1::
    SendInput ¹
    return
!^2::
    SendInput ²
    return
!^3::
    SendInput ³
    return
!Up::
    SendEvent ↑
    return
!Down::
    SendEvent ↓
    return
!Left::
    SendEvent ←
    return
!Right::
    SendEvent →
    return