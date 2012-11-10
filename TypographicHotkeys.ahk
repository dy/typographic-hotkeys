#Hotstring * ? ;Make hotstrings not to wait the end key and trigger inside strings

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
combos.item("or") := "®"
combos.item("ro") := "®"
combos.item("OR") := "®"
combos.item("RO") := "®"
combos.item("^-") := "¯"
combos.item("-^") := "¯"
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
combos.item("A`") := "À"
combos.item("`A") := "À"
combos.item("A'") := "Á"
combos.item("'A") := "Á"
combos.item("A^") := "Â"
combos.item("^A") := "Â"
combos.item("A~") := "Ã"
combos.item("~A") := "Ã"
combos.item("A""") := "Ä"
combos.item("""A") := "Ä"
combos.item("A''") := "Ä"
combos.item("''A") := "Ä"
combos.item("A*") := "Å"
combos.item("*A") := "Å"
combos.item("AE") := "Æ"
combos.item("C,") := "Ç"
combos.item(",C") := "Ç"
combos.item("E`") := "È"
combos.item("`E") := "È"
combos.item("E'") := "É"
combos.item("'E") := "É"
combos.item("E^") := "Ê"
combos.item("^E") := "Ê"
combos.item("E""") := "Ë"
combos.item("""E") := "Ë"
combos.item("E''") := "Ë"
combos.item("''E") := "Ë"
combos.item("I`") := "Ì"
combos.item("`I") := "Ì"
combos.item("I'") := "Í"
combos.item("'I") := "Í"
combos.item("I^") := "Î"
combos.item("^I") := "Î"
combos.item("I""") := "Ï"
combos.item("""I") := "Ï"
combos.item("''I") := "Ï"
combos.item("I''") := "Ï"
combos.item("D-") := "Ð"
combos.item("-D") := "Ð"
combos.item("N~") := "Ñ"
combos.item("~N") := "Ñ"
combos.item("O`") := "Ò"
combos.item("`O") := "Ò"
combos.item("O'") := "Ó"
combos.item("'O") := "Ó"
combos.item("O^") := "Ô"
combos.item("^O") := "Ô"
combos.item("O~") := "Õ"
combos.item("~O") := "Õ"
combos.item("O""") := "Ö"
combos.item("""O") := "Ö"
combos.item("O''") := "Ö"
combos.item("''O") := "Ö"
combos.item("xx") := "×"
combos.item("O/") := "Ø"
combos.item("/O") := "Ø"
combos.item("`U") := "Ù"
combos.item("U`") := "Ù"
combos.item("U'") := "Ú"
combos.item("'U") := "Ú"
combos.item("U^") := "Û"
combos.item("^U") := "Û"
combos.item("U''") := "Ü"
combos.item("''U") := "Ü"
combos.item("""U") := "Ü"
combos.item("U""") := "Ü"
combos.item("Y'") := "Ý"
combos.item("'Y") := "Ý"
combos.item("TH") := "Þ"
combos.item("HT") := "Þ"
combos.item("ss") := "ß"
combos.item("a`") := "à"
combos.item("`a") := "à"
combos.item("'a") := "á"
combos.item("a'") := "á"
combos.item("^a") := "â"
combos.item("a^") := "â"
combos.item("a~") := "ã"
combos.item("~a") := "ã"
combos.item("''a") := "ä"
combos.item("a''") := "ä"
combos.item("a""") := "ä"
combos.item("""a") := "ä"
combos.item("a*") := "å"
combos.item("*a") := "å"
combos.item("ae") := "æ"
combos.item("c,") := "ç"
combos.item(",c") := "ç"
combos.item("'e") := "é"
combos.item("e'") := "é"
combos.item("^e") := "ê"
combos.item("e^") := "ê"
combos.item("''e") := "ë"
combos.item("e''") := "ë"
combos.item("e""") := "ë"
combos.item("""e") := "ë"
combos.item("i`") := "ì"
combos.item("`i") := "ì"
combos.item("'i") := "í"
combos.item("i'") := "í"
combos.item("^i") := "î"
combos.item("i^") := "î"
combos.item("''i") := "ï"
combos.item("i''") := "ï"
combos.item("i""") := "ï"
combos.item("""i") := "ï"
combos.item("d-") := "ð"
combos.item("-d") := "ð"
combos.item("n~") := "ñ"
combos.item("~n") := "ñ"
combos.item("o`") := "ò"
combos.item("`o") := "ò"
combos.item("'o") := "ó"
combos.item("o'") := "ó"
combos.item("^o") := "ô"
combos.item("o^") := "ô"
combos.item("o~") := "õ"
combos.item("~o") := "õ"
combos.item("''o") := "ö"
combos.item("o''") := "ö"
combos.item("o""") := "ö"
combos.item("""o") := "ö"
combos.item("-:") := "÷"
combos.item(":-") := "÷"
combos.item("o/") := "ø"
combos.item("/o") := "ø"
combos.item("u`") := "ù"
combos.item("`u") := "ù"
combos.item("'u") := "ú"
combos.item("u'") := "ú"
combos.item("^u") := "û"
combos.item("u^") := "û"
combos.item("''u") := "ü"
combos.item("u''") := "ü"
combos.item("u""") := "ü"
combos.item("""u") := "ü"
combos.item("'y") := "ý"
combos.item("y'") := "ý"
combos.item("th") := "þ"
combos.item("ht") := "þ"
combos.item("y''") := "ÿ"
combos.item("''y") := "ÿ"
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
combos.item("'Z") := "Ź"
combos.item("Z'") := "Ź"
combos.item("'z") := "ź"
combos.item("z'") := "ź"
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
combos.item("N`") := "Ǹ"
combos.item("`N") := "Ǹ"
combos.item("`n") := "ǹ"
combos.item("n`") := "ǹ"
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
combos.item("""H") := "Ḧ"
combos.item("H""") := "Ḧ"
combos.item("''h") := "ḧ"
combos.item("h''") := "ḧ"
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
combos.item("~V") := "Ṽ"
combos.item("V~") := "Ṽ"
combos.item("v~") := "ṽ"
combos.item("~v") := "ṽ"
combos.item("`W") := "Ẁ"
combos.item("W`") := "Ẁ"
combos.item("`w") := "ẁ"
combos.item("w`") := "ẁ"
combos.item("'W") := "Ẃ"
combos.item("W'") := "Ẃ"
combos.item("w'") := "ẃ"
combos.item("'w") := "ẃ"
combos.item("W''") := "Ẅ"
combos.item("''W") := "Ẅ"
combos.item("W""") := "Ẅ"
combos.item("""W") := "Ẅ"
combos.item("w''") := "ẅ"
combos.item("''w") := "ẅ"
combos.item("w""") := "ẅ"
combos.item("""w") := "ẅ"
combos.item("''X") := "Ẍ"
combos.item("X''") := "Ẍ"
combos.item("X""") := "Ẍ"
combos.item("""X") := "Ẍ"
combos.item("''x") := "ẍ"
combos.item("x''") := "ẍ"
combos.item("x""") := "ẍ"
combos.item("""x") := "ẍ"
combos.item("^Z") := "Ẑ"
combos.item("Z^") := "Ẑ"
combos.item("^z") := "ẑ"
combos.item("z^") := "ẑ"
combos.item("t''") := "ẗ"
combos.item("''t") := "ẗ"
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
combos.item("`Y") := "Ỳ"
combos.item("Y`") := "Ỳ"
combos.item("`y") := "ỳ"
combos.item("y`") := "ỳ"
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

;===========================================================HTML codes
combos.item("") := ""
combos.item("") := ""
combos.item("") := ""
combos.item("") := ""
combos.item("") := ""
combos.item("") := ""
combos.item("") := ""
combos.item("") := ""
combos.item("") := ""
combos.item("") := ""
combos.item("") := ""
combos.item("") := ""
combos.item("") := ""
combos.item("") := ""
combos.item("") := ""
combos.item("") := ""
combos.item("") := ""
combos.item("") := ""
combos.item("") := ""
combos.item("") := ""
combos.item("") := ""
combos.item("") := ""
combos.item("") := ""
combos.item("") := ""
combos.item("") := ""
combos.item("") := ""
combos.item("") := ""
combos.item("") := ""
combos.item("") := ""
combos.item("") := ""
combos.item("") := ""
combos.item("") := ""
combos.item("") := ""
combos.item("") := ""
combos.item("") := ""
combos.item("") := ""
combos.item("") := ""
combos.item("") := ""
combos.item("") := ""
combos.item("") := ""
combos.item("") := ""
combos.item("") := ""
combos.item("") := ""
combos.item("") := ""
combos.item("<-") := "←"
combos.item("->") := "→"
combos.item("<3") := "♥"
combos.item("CCCP") := "☭"

;========================================================Compose key handler
AppsKey::
    ;Cunning hook: AppsKey Up sends {CtrlBreak} that stops Input that AppsKey has started. 
    Input, combo, V,{CtrlBreak}

    ;AppsKey continues to perform and tries to find passed combination in list of combos.    
    cmbStr := combos.item(combo)
    len := StrLen(combo)
    if (cmbStr){
        Loop, %len% {
            SendInput {BS}
        }
        SendInput %cmbStr%
    }
    return

AppsKey Up::
    Send {CtrlBreak}
    return



;=================================Basic typography
::[---]::
    SendInput —
    return
^!-::
    ;KeyWait Control
    ;KeyWait Alt
    SendInput —
    return

!-::
    KeyWait Alt
    SendInput –
    return
::[--]::
    KeyWait Alt
    SendInput –
    return

^!+[::
    SendInput „
    return
^!+]::
    SendInput ‟
    return
^![::
    SendInput “
    return
^!]::
    SendInput ”
    return
![::
    SendInput «
    return
!]::
    SendInput »
    return

::...::…
::[...]::…
::[..]::‥

!Space::
    KeyWait Alt
    SendInput  
    return

::?!::‽
::!?::‽

::***::⁂

::[deg]::°

::[par]::§
::[paragraph]::§

;================================Maths
::[inf]::∞
::[infinity]::∞
::[((]::⦅
::[))]::⦆
:*:[forall]::∀
:*:[for all]::∀
:*:[there exists]::∃
:*:[thereexists]::∃
:*:[theredoesntexists]::∄
:*:[there doesn't exists]::∄
:*:[complement]:∁
:*:[diff]::∂
:*:[dif]::∂
:*:[differential]::∂
:*:[empty]::∅
:*:[element of]::∈
:*:[elementof]::∈
:*:[notanelementof]::∉
:*:[not an element of]::∉
:*:[not element of]::∉
:*:[small element of]::∊
:*:[smallelementof]::∊
:*:[containsasmember]::∋
:*:[contains as member]::∋
:*:[does not contain as member]::∌
:*:[doesnotcontainasmember]::∌
:*:[subset of]::⊂
:*:[superset of]::⊃
:*:[subsetof]::⊂
:*:[supersetof]::⊃

:*:[right angle]::∟
:*:[90deg]::∟
:*:[90 angle]::∟
:*:[angle]::∠

:*:[sqrt]::√
:*:[square root]::√
:*:[cube root]::∛
:*:[cuberoot]::∛
:*:[fourthroot]::∜
:*:[fourth root]::∜
:*:[hypercube root]::∜
:*:[hypercuberoot]::∜

:*:[and]::∧
:*:[disjunction]::∧
:*:[or]::∨
:*:[conjunction]::∨
:*:[intersection]::∩
:*:[union]::∪
:*:[integral]::∫
:*:[double integral]::∬
:*:[doubleintegral]::∭
:*:[triple integral]::∬
:*:[tripleintegral]::∭


::[+-]::±
::[-+]::∓
::[-~]::≂
::[~-]::≃
::[~~]::≈

!~::
    SendInput ∽
    return

::[<=]::≤
::[<==]::≦
::[>=]::≥
::[>==]::≧
::[<<]::≪
::[>>]::≫
::[<~]::≲
::[>~]::≳
::[<>]::≶
::[><]::≷
::[==]::≡
::[!=]::≠

!*::
+!8::
    SendInput ×
    return
^!*::
^+!8::
    SendInput ∙
    return

!/::
    SendInput ÷
    return
::[/]::÷

+^!=::
    SendInput ≡
    return
^!=::
    SendInput ꞊
    return
!=::
    SendInput ≠
    return



;============================Shapes
::[star]::★
::[star1]::★
::[star2]::☆
::[star3]::⋆

!.::
    SendInput ∙
    return
+!.::
    SendInput •
    return
+!^.::
    SendInput ●
    return
::[dot]::∙
::[dot1]::∙
::[dot2]::•
::[dot3]::●
::[dot4]::○
::[dot5]::◌
::[dot6]::◎

::[small circle]::∙
::[circle]::•
::[big circle]::●

::[square1]::▪
::[small square]::▪
::[square2]::■
::[square]::■
::[square3]::∎
::[big square]::∎

::[x0]::☓
::[x1]::✕
::[x2]::✖
::[x3]::✘
::[x4]::✗
::[x5]::╳
::[cross0]::☓
::[cross1]::✕
::[cross2]::✖
::[cross3]::✘
::[cross4]::✗

::[diamond]::⋄
::[diamond2]::◇
::[diamond3]::◆

::[vertical]::|
::[vertical1]::|
::[vertical2]::│
::[vertical3]::┃
::[vertical4]::┆
::[vertical5]::┊
::[vertical6]::╎
::[vertical7]::┋
::[|1]::|
::[|2]::│
::[|3]::┃
::[|4]::┆
::[|5]::┊
::[|6]::╎
::[|7]::┋

;=============================Symbols
::[check]::☑
::[check2]::☒

::[ok]::✓
::[ok1]::✓
::[ok2]::✔

::[phone]::✆
::[phone1]::✆
::[phone2]::☎
::[phone3]::☏

::[mail]::✉
::[email]::✉

::[home]::⌂
::[house]::⌂

::[scissors]::✂
::[scissors1]::✂
::[scissors2]::✁
::[scissors3]::✃
::[scissors4]::✄

::[option]::⌘

::[cloud]::☁

::[wave]::⌇
!|::
    SendInput ⌇
    return

::[pencil]::✍
::[pencil1]::✍
::[pencil2]::✎
::[pencil3]::✏
::[pencil4]::✐

::[nib1]::✑
::[nib2]::✒

::[hot]::♨
::[piece]::☮
::[victory]::✌
::[radioactive]::☢
::[death]::☠
::[smile]::☺
::[black smile]::☻
::[blacksmile]::☻
::[medicine]::☤
::[plane]::✈
::[comet]::☄

::[hand left]::☜
::[handleft]::☜
::[handtop]::☝
::[hand top]::☝
::[handright]::☞
::[hand right]::☞
::[black hand right]::☛
::[black hand left]::☚
::[handdown]::☟
::[hand down]::☟


;==========================Law marks
::(c)::©
::(r)::® 
::[tm]::™
::(tm)::™
::[sm]::℠
::(sm)::℠

;=============================Currency
:C:[cent]::¢
:C:[CENT]::￠
:C:[c-]::¢
:C:[C-]::￠
::[ils]::₪
::[i=]::₪
::[eur]::€
::[e=]::€
::[eurocurrency]::₠
::[F=]::₣
::[Fr=]::₣
::[gbp]::£
::[gb=]::£
::[jpy]::¥
::[y=]::¥
::[rub]::⃏
::[roub]::⃏
::[ru]::⃏
::[rur]::⃏
::[R-]::⃏
::[mnt]::₮
::[t=]::₮
::[currency]::¤

;=============================Numbers
!^1::
    SendInput ¹
    return
!^2::
    SendInput ²
    return
!^3::
    SendInput ³
    return
::1/2::½
::1/3::⅓
::1/4::¼
::1/5::⅕
::1/6::⅙
::1/7::⅐
::1/8::⅛
::1/9::⅑
::1/10::⅒
::2/3::⅔
::2/5::⅖
::3/4::¾
::3/5::⅗
::3/8::⅜
::4/5::⅘
::5/6::⅚
::5/8::⅝
::7/8::⅞

;=============================Circles
::(1)::⑴
::(2)::⑵
::(3)::⑶
::(4)::⑷
::(5)::⑸
::(6)::⑹
::(7)::⑺
::(8)::⑻
::(9)::⑼
::(10)::⑽
::(11)::⑾
::(12)::⑿
::(13)::⒀
::(14)::⒁
::(15)::⒂
::(16)::⒃
::(17)::⒄
::(18)::⒅
::(19)::⒆
::(20)::⒇

::[0]::⓪
::[1]::①
::[2]::②
::[3]::③
::[4]::④
::[5]::⑤
::[6]::⑥
::[7]::⑦
::[8]::⑧
::[9]::⑨
::[10]::⑩
::[11]::⑪
::[12]::⑫
::[13]::⑬
::[14]::⑭
::[15]::⑮
::[16]::⑯
::[17]::⑰
::[18]::⑱
::[19]::⑲
::[20]::⑳

::[1.]::⒈
::[2.]::⒉
::[3.]::⒊
::[4.]::⒋
::[5.]::⒌
::[6.]::⒍
::[7.]::⒎
::[8.]::⒏
::[9.]::⒐
::[10.]::⒑
::[11.]::⒒
::[12.]::⒓
::[13.]::⒔
::[14.]::⒕
::[15.]::⒖
::[16.]::⒗
::[17.]::⒘
::[18.]::⒙
::[19.]::⒚
::[20.]::⒛

;===========================Arrows
+^!Up::
    SendInput ⇧
    return
+^!Down::
    SendInput ⇩
    return
+^!Left::
    SendInput ⇦
    return
::[<-]::
    SendInput ←
    return
+^!Right::
    SendInput ⇨
    return
::[->]::
    SendInput →
    return
+!Up::
    SendInput ▴
    return
+!Down::
    SendInput ▾
    return
+!Left::
    SendInput ◂
    return
+!Right::
    SendInput ▸
    return
^!Up::
    SendInput ▲
    return
^!Down::
    SendInput ▼
    return
^!Left::
    SendInput ◀
    return
^!Right::
    SendInput ▶
    return
!Up::
    SendInput ↑
    return
!Down::
    SendInput ↓
    return
!Left::
    SendInput ←
    return
!Right::
    SendInput →
    return