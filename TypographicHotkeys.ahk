#Hotstring * ? ;Make hotstrings not to wait the end key and trigger inside strings

;======================================The common combos array.
;---------------------Solaris compose keys
combos := {} 
combos.Insert("c/","¢")
combos.Insert("/c","¢")
combos.Insert("!!","¡")
combos.Insert("l-","£")
combos.Insert("-l","£")
combos.Insert("ox","¤")
combos.Insert("xo","¤")
combos.Insert("y-","¥")
combos.Insert("-y","¥")
combos.Insert("Y-","¥")
combos.Insert("-Y","¥")
combos.Insert("||","¦")
combos.Insert("so","§")
combos.Insert("os","§")
combos.Insert("OS","§")
combos.Insert("SO","§")
combos.Insert("''","¨")
combos.Insert("""""","¨")
combos.Insert("""","¨")
combos.Insert("co","©")
combos.Insert("oc","©")
combos.Insert("OC","©")
combos.Insert("CO","©")
combos.Insert("a-","ª")
combos.Insert("-a","ª")
combos.Insert("<<","«")
combos.Insert("-|","¬")
combos.Insert("|-","¬")
combos.Insert("--","-")
combos.Insert("or","®")
combos.Insert("ro","®")
combos.Insert("OR","®")
combos.Insert("RO","®")
combos.Insert("^-","¯")
combos.Insert("-^","¯")
combos.Insert("^0","°")
combos.Insert("0^","°")
combos.Insert("+-","±")
combos.Insert("-+","∓")
combos.Insert("^1","¹")
combos.Insert("1^","¹")
combos.Insert("^2","²")
combos.Insert("2^","²")
combos.Insert("^3","³")
combos.Insert("3^","³")
combos.Insert("\\","´")
combos.Insert("/u","µ")
combos.Insert("u/","µ")
combos.Insert("P!","¶")
combos.Insert("!P","¶")
combos.Insert("^.","·")
combos.Insert(".^","·")
combos.Insert(",,","¸")
combos.Insert("_o","º")
combos.Insert(">>","»")
combos.Insert("14","¼")
combos.Insert("12","½")
combos.Insert("34","¾")
combos.Insert("??","¿")
combos.Insert("A`","À")
combos.Insert("`A","À")
combos.Insert("A'","Á")
combos.Insert("'A","Á")
combos.Insert("A^","Â")
combos.Insert("^A","Â")
combos.Insert("A~","Ã")
combos.Insert("~A","Ã")
combos.Insert("A""","Ä")
combos.Insert("""A","Ä")
combos.Insert("A''","Ä")
combos.Insert("''A","Ä")
combos.Insert("A*","Å")
combos.Insert("*A","Å")
combos.Insert("AE","Æ")
combos.Insert("C,","Ç")
combos.Insert(",C","Ç")
combos.Insert("E`","È")
combos.Insert("`E","È")
combos.Insert("E'","É")
combos.Insert("'E","É")
combos.Insert("E^","Ê")
combos.Insert("^E","Ê")
combos.Insert("E""","Ë")
combos.Insert("""E","Ë")
combos.Insert("E''","Ë")
combos.Insert("''E","Ë")
combos.Insert("I`","Ì")
combos.Insert("`I","Ì")
combos.Insert("I'","Í")
combos.Insert("'I","Í")
combos.Insert("I^","Î")
combos.Insert("^I","Î")
combos.Insert("I""","Ï")
combos.Insert("""I","Ï")
combos.Insert("''I","Ï")
combos.Insert("I''","Ï")
combos.Insert("D-","Ð")
combos.Insert("-D","Ð")
combos.Insert("N~","Ñ")
combos.Insert("~N","Ñ")
combos.Insert("O`","Ò")
combos.Insert("`O","Ò")
combos.Insert("O'","Ó")
combos.Insert("'O","Ó")
combos.Insert("O^","Ô")
combos.Insert("^O","Ô")
combos.Insert("O~","Õ")
combos.Insert("~O","Õ")
combos.Insert("O""","Ö")
combos.Insert("""O","Ö")
combos.Insert("O''","Ö")
combos.Insert("''O","Ö")
combos.Insert("xx","×")
combos.Insert("O/","Ø")
combos.Insert("/O","Ø")
combos.Insert("`U","Ù")
combos.Insert("U`","Ù")
combos.Insert("U'","Ú")
combos.Insert("'U","Ú")
combos.Insert("U^","Û")
combos.Insert("^U","Û")
combos.Insert("U''","Ü")
combos.Insert("''U","Ü")
combos.Insert("""U","Ü")
combos.Insert("U""","Ü")
combos.Insert("Y'","Ý")
combos.Insert("'Y","Ý")
combos.Insert("TH","Þ")
combos.Insert("HT","Þ")
combos.Insert("ss","ß")
combos.Insert("a`","à")
combos.Insert("`a","à")
combos.Insert("'a","á")
combos.Insert("a'","á")
combos.Insert("^a","â")
combos.Insert("a^","â")
combos.Insert("a~","ã")
combos.Insert("~a","ã")
combos.Insert("''a","ä")
combos.Insert("a''","ä")
combos.Insert("a""","ä")
combos.Insert("""a","ä")
combos.Insert("a*","å")
combos.Insert("*a","å")
combos.Insert("ae","æ")
combos.Insert("c,","ç")
combos.Insert(",c","ç")
combos.Insert("'e","é")
combos.Insert("e'","é")
combos.Insert("^e","ê")
combos.Insert("e^","ê")
combos.Insert("''e","ë")
combos.Insert("e''","ë")
combos.Insert("e""","ë")
combos.Insert("""e","ë")
combos.Insert("i`","ì")
combos.Insert("`i","ì")
combos.Insert("'i","í")
combos.Insert("i'","í")
combos.Insert("^i","î")
combos.Insert("i^","î")
combos.Insert("''i","ï")
combos.Insert("i''","ï")
combos.Insert("i""","ï")
combos.Insert("""i","ï")
combos.Insert("d-","ð")
combos.Insert("-d","ð")
combos.Insert("n~","ñ")
combos.Insert("~n","ñ")
combos.Insert("o`","ò")
combos.Insert("`o","ò")
combos.Insert("'o","ó")
combos.Insert("o'","ó")
combos.Insert("^o","ô")
combos.Insert("o^","ô")
combos.Insert("o~","õ")
combos.Insert("~o","õ")
combos.Insert("''o","ö")
combos.Insert("o''","ö")
combos.Insert("o""","ö")
combos.Insert("""o","ö")
combos.Insert("-:","÷")
combos.Insert(":-","÷")
combos.Insert("o/","ø")
combos.Insert("/o","ø")
combos.Insert("u`","ù")
combos.Insert("`u","ù")
combos.Insert("'u","ú")
combos.Insert("u'","ú")
combos.Insert("^u","û")
combos.Insert("u^","û")
combos.Insert("''u","ü")
combos.Insert("u''","ü")
combos.Insert("u""","ü")
combos.Insert("""u","ü")
combos.Insert("'y","ý")
combos.Insert("y'","ý")
combos.Insert("th","þ")
combos.Insert("ht","þ")
combos.Insert("y''","ÿ")
combos.Insert("''y","ÿ")
combos.Insert("""y","ÿ")
combos.Insert("y""","ÿ")

;---------------------------------Linux compose keys (premixed to solaris)
combos.Insert("c|","¢")
combos.Insert("|c","¢")
combos.Insert("C|","¢")
combos.Insert("|C","¢")
combos.Insert("C/","¢")
combos.Insert("/C","¢")
combos.Insert("L-","£")
combos.Insert("-L","£")
combos.Insert("Y=","¥")
combos.Insert("=Y","¥")
combos.Insert("!^","¦")
combos.Insert("oC","©")
combos.Insert("Oc","©")
combos.Insert("^_a","ª")
combos.Insert("-,","¬")
combos.Insert(",-","¬")
combos.Insert("oR","®")
combos.Insert("Or","®")
combos.Insert("oo","°")
combos.Insert("deg","°")
combos.Insert("mu","µ")
combos.Insert("p!","¶")
combos.Insert("!p","¶")
combos.Insert("PP","¶")
combos.Insert("par","¶")
combos.Insert("..","·")
combos.Insert(",","¸")
combos.Insert(" ,","¸")
combos.Insert("º","^_o")
combos.Insert("oA","Å")
combos.Insert("Ao","Å")
combos.Insert("DH","Ð")
combos.Insert("HD","Ð")
combos.Insert("oa","å")
combos.Insert("ao","å")
combos.Insert("_A","Ā")
combos.Insert("A_","Ā")
combos.Insert("a_","ā")
combos.Insert("_a","ā")
combos.Insert("UA","Ă")
combos.Insert("bA","Ă")
combos.Insert("Ua","ă")
combos.Insert("ba","ă")
combos.Insert("A;","Ą")
combos.Insert(";A","Ą")
combos.Insert("a;","ą")
combos.Insert(";a","ą")
combos.Insert("C'","Ć")
combos.Insert("'C","Ć")
combos.Insert("c'","ć")
combos.Insert("'c","ć")
combos.Insert("C^","Ĉ")
combos.Insert("^C","Ĉ")
combos.Insert("c^","ĉ")
combos.Insert("^c","ĉ")
combos.Insert("cC","Č")
combos.Insert("Cv","Č")
combos.Insert("vC","Č")
combos.Insert("cc","č")
combos.Insert("cv","č")
combos.Insert("vc","č")
combos.Insert("cD","Ď")
combos.Insert("Dv","Ď")
combos.Insert("vD","Ď")
combos.Insert("cd","ď")
combos.Insert("/D","Đ")
combos.Insert("-d","đ")
combos.Insert("/d","đ")
combos.Insert("E_","Ē")
combos.Insert("_E","Ē")
combos.Insert("e_","ē")
combos.Insert("_e","ē")
combos.Insert("UE","Ĕ")
combos.Insert("bE","Ĕ")
combos.Insert("Ue","ĕ")
combos.Insert("be","ĕ")
combos.Insert(";E","Ę")
combos.Insert("E;","Ę")
combos.Insert(";e","ę")
combos.Insert("e;","ę")
combos.Insert("cE","Ě")
combos.Insert("vE","Ě")
combos.Insert("Ev","Ě")
combos.Insert("ce","ě")
combos.Insert("ve","ě")
combos.Insert("ev","ě")
combos.Insert("G^","Ĝ")
combos.Insert("^G","Ĝ")
combos.Insert("g^","ĝ")
combos.Insert("^g","ĝ")
combos.Insert("","Ğ")
combos.Insert("","Ğ")
combos.Insert("","ğ")
combos.Insert("","ğ")
combos.Insert("","Ģ")
combos.Insert("","Ģ")
combos.Insert("","ģ")
combos.Insert("","ģ")
combos.Insert("","Ĥ")
combos.Insert("","Ĥ")
combos.Insert("","ĥ")
combos.Insert("","ĥ")
combos.Insert("","Ħ")
combos.Insert("","Ħ")
combos.Insert("","ħ")
combos.Insert("","ħ")
combos.Insert("","Ĩ")
combos.Insert("","Ĩ")
combos.Insert("","ĩ")
combos.Insert("","ĩ")
combos.Insert("","Ī")
combos.Insert("","Ī")
combos.Insert("","ī")
combos.Insert("","ī")
combos.Insert("","Ĭ")
combos.Insert("","Ĭ")
combos.Insert("","ĭ")
combos.Insert("","ĭ")
combos.Insert("","Į")
combos.Insert("","Į")
combos.Insert("","į")
combos.Insert("","į")
combos.Insert("","ı")
combos.Insert("","ı")
combos.Insert("","Ĵ")
combos.Insert("","Ĵ")
combos.Insert("","ĵ")
combos.Insert("","ĵ")
combos.Insert("","Ķ")
combos.Insert("","Ķ")
combos.Insert("","ķ")
combos.Insert("","ķ")
combos.Insert("","ĸ")
combos.Insert("","Ĺ")
combos.Insert("","Ĺ")
combos.Insert("","ĺ")
combos.Insert("","ĺ")
combos.Insert("","Ļ")
combos.Insert("","Ļ")
combos.Insert("","ļ")
combos.Insert("","ļ")
combos.Insert("","Ľ")
combos.Insert("","ľ")
combos.Insert("","Ł")
combos.Insert("","Ł")
combos.Insert("","ł")
combos.Insert("","ł")
combos.Insert("","Ń")
combos.Insert("","Ń")
combos.Insert("","ń")
combos.Insert("","ń")
combos.Insert("","Ņ")
combos.Insert("","Ņ")
combos.Insert("","ņ")
combos.Insert("","ņ")
combos.Insert("","Ň")
combos.Insert("","Ň")
combos.Insert("","Ň")
combos.Insert("","ň")
combos.Insert("","ň")
combos.Insert("","ň")
combos.Insert("","Ŋ")
combos.Insert("","Ŋ")
combos.Insert("","ŋ")
combos.Insert("","ŋ")
combos.Insert("","Ō")
combos.Insert("","Ō")
combos.Insert("","ō")
combos.Insert("","ō")
combos.Insert("","Ŏ")
combos.Insert("","Ŏ")
combos.Insert("","ŏ")
combos.Insert("","ŏ")
combos.Insert("","Ő")
combos.Insert("","Ő")
combos.Insert("","ő")
combos.Insert("","ő")
combos.Insert("","Œ")
combos.Insert("","œ")
combos.Insert("","Ŕ")
combos.Insert("","Ŕ")
combos.Insert("","ŕ")
combos.Insert("","ŕ")
combos.Insert("","Ŗ")
combos.Insert("","Ŗ")
combos.Insert("","ŗ")
combos.Insert("","ŗ")
combos.Insert("","Ř")
combos.Insert("","Ř")
combos.Insert("","Ř")
combos.Insert("","ř")
combos.Insert("","ř")
combos.Insert("","ř")
combos.Insert("","Ś")
combos.Insert("","Ś")
combos.Insert("","ś")
combos.Insert("","ś")
combos.Insert("","Ŝ")
combos.Insert("","Ŝ")
combos.Insert("","ŝ")
combos.Insert("","ŝ")
combos.Insert("","Ş")
combos.Insert("","Ş")
combos.Insert("","ş")
combos.Insert("","ş")
combos.Insert("","Š")
combos.Insert("","Š")
combos.Insert("","š")
combos.Insert("","š")
combos.Insert("","Ţ")
combos.Insert("","Ţ")
combos.Insert("","ţ")
combos.Insert("","ţ")
combos.Insert("","Ť")
combos.Insert("","Ť")
combos.Insert("","Ť")
combos.Insert("","ť")
combos.Insert("","ť")
combos.Insert("","ť")
combos.Insert("","Ŧ")
combos.Insert("","Ŧ")
combos.Insert("","Ŧ")
combos.Insert("","Ŧ")
combos.Insert("","ŧ")
combos.Insert("","ŧ")
combos.Insert("","ŧ")
combos.Insert("","ŧ")
combos.Insert("","Ũ")
combos.Insert("","Ũ")
combos.Insert("","ũ")
combos.Insert("","ũ")
combos.Insert("","Ū")
combos.Insert("","Ū")
combos.Insert("","ū")
combos.Insert("","ū")
combos.Insert("","Ŭ")
combos.Insert("","Ŭ")
combos.Insert("","ŭ")
combos.Insert("","ŭ")
combos.Insert("","Ů")
combos.Insert("","Ů")
combos.Insert("","ů")
combos.Insert("","ů")
combos.Insert("","Ű")
combos.Insert("","Ű")
combos.Insert("","ű")
combos.Insert("","ű")
combos.Insert("","Ų")
combos.Insert("","Ų")
combos.Insert("","ų")
combos.Insert("","ų")
combos.Insert("","Ŵ")
combos.Insert("","Ŵ")
combos.Insert("","ŵ")
combos.Insert("","ŵ")
combos.Insert("","Ŷ")
combos.Insert("","Ŷ")
combos.Insert("","ŷ")
combos.Insert("","ŷ")
combos.Insert("","Ÿ")
combos.Insert("","Ÿ")
combos.Insert("","Ÿ")
combos.Insert("","Ÿ")
combos.Insert("","Ź")
combos.Insert("","Ź")
combos.Insert("","ź")
combos.Insert("","ź")
combos.Insert("","Ž")
combos.Insert("","Ž")
combos.Insert("","ž")
combos.Insert("","ž")
combos.Insert("fs","ſ")
combos.Insert("fS","ſ")
combos.Insert("","ƀ")
combos.Insert("","ƀ")
combos.Insert("","Ɨ")
combos.Insert("","Ɨ")
combos.Insert("","Ƶ")
combos.Insert("","Ƶ")
combos.Insert("","ƶ")
combos.Insert("","ƶ")
combos.Insert("","Ǎ")
combos.Insert("","Ǎ")
combos.Insert("","Ǎ")
combos.Insert("","ǎ")
combos.Insert("","ǎ")
combos.Insert("","ǎ")
combos.Insert("","Ǐ")
combos.Insert("","Ǐ")
combos.Insert("","Ǐ")
combos.Insert("","ǐ")
combos.Insert("","ǐ")
combos.Insert("","ǐ")
combos.Insert("","Ǒ")
combos.Insert("","Ǒ")
combos.Insert("","Ǒ")
combos.Insert("","ǒ")
combos.Insert("","ǒ")
combos.Insert("","ǒ")
combos.Insert("","Ǔ")
combos.Insert("","Ǔ")
combos.Insert("","Ǔ")
combos.Insert("","ǔ")
combos.Insert("","ǔ")
combos.Insert("","ǔ")
combos.Insert("","Ǥ")
combos.Insert("","Ǥ")
combos.Insert("","ǥ")
combos.Insert("","ǥ")
combos.Insert("","Ǧ")
combos.Insert("","Ǧ")
combos.Insert("","Ǧ")
combos.Insert("","ǧ")
combos.Insert("","ǧ")
combos.Insert("","ǧ")
combos.Insert("","Ǩ")
combos.Insert("","Ǩ")
combos.Insert("","Ǩ")
combos.Insert("","ǩ")
combos.Insert("","ǩ")
combos.Insert("","ǩ")
combos.Insert("","")
combos.Insert("","")
combos.Insert("","")
combos.Insert("","")
combos.Insert("<-","←")
combos.Insert("->","→")
combos.Insert("<3","♥")
combos.Insert("CCCP","☭")

AppsKey::
    ;Cunning hook: AppsKey Up sends {CtrlBreak} that stops Input that AppsKey has started. 
    Input, combo, C,{CtrlBreak}

    ;AppsKey continues to perform and tries to find passed combination in list of combos.    
    if (combos[combo]){
        comboStr := combos[combo]
        SendInput %comboStr%
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
::[i-]::₪
::[eur]::€
::[e-]::€
::[eurocurrency]::₠
::[F-]::₣
::[Fr-]::₣
::[gbp]::£
::[gb-]::£
::[jpy]::¥
::[y-]::¥
::[rub]::⃏
::[roub]::⃏
::[ru]::⃏
::[rur]::⃏
::[R-]::⃏
::[mnt]::₮
::[t-]::₮
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