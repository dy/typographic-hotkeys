#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Recommended for catching common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


;TODO:
; some bugs with RightAlt when alttabbing windows
; some bugs when combo outside of [], for example []lorem, and besides, when just ] appeared. So, when you see [], try to grab combo inside, not a listening of something.

#Include ./inc/Combinations.ahk
#Include ./inc/Util.ahk
#Include ./inc/Faker.ahk
#Include ./inc/Selection.ahk


#Hotstring * ? ;Make hotstrings not to wait the end key and trigger inside strings

;==================================Make load on startup, if launched first time
sname := A_Startup . "\" . SubStr(A_ScriptName, 1, -4) . ".lnk"
;IfNotExist, %sname%
    ;MsgBox, %sname%
    FileCreateShortcut, %A_ScriptFullPath%, %sname%

;============================================================Main handler
lastResult := "" ;stores last found symbol
;----------------------Searches for combination in list
getCombo(list, cmb){
    global lastResult := ""
    str := list.item(cmb)
    if (str){
        lastResult := str
        return true
    }
    return false
}
;----------------------Outputs combo as ASCII/UTF code (windows alt-code)
;------------Bad function style, but it's simplier to output here
getCharFromUTF(combo){
    code := combo + 0
    if (code > 255){ ;do utf
        comboHex := toHex(code)
        comboHex := toFixed(comboHex, 4)
        Send {U+%code%}
    } else { ;do ascii
        code := toFixed(code, 4)
        Send {ASC %code%}
    }
}
;-------------------------Mac diacritics listener. Waits for letter to input and tries to find it in lists
listenDiacritics(diacr){
    global lastResult
    global combos
    global extensions
    Send {raw}%diacr%
    Input targetChr, * L1 V C, {CtrlBreak}
    if (ErrorLevel == "NewInput"){
        return
    }
    targetChr := diacr . targetChr
    getCombo(combos, targetChr) || getCombo(extensions, targetChr)
    if (lastResult){
        clear(StrLen(targetChr))
        Send %lastResult%    
    }
    return
}
;----------------------------Birman deadkeys escaper
escapeBirmanDiacritics(combo){
    ;`, q=˘, 6 = ˆ, /=´, n=˜, v = ˇ, r = ˚, z = ¸, ; = ¨
    first := substr(combo, 1, 1)
    diacr := ""
    if (first == "?") {
        diacr := "´"
    } else if (first == "N" || first == "Т"){
        diacr := "˜"
    } else if (first == "V" || first == "М"){
        diacr := "ˇ"
    } else if (first == "C" || first == "С"){
        diacr := "˜"
    } else if (first == "Z" || first == "Я"){
        diacr := "¸"
    } else if (first == ":" || first == "Ж"){
        diacr := "¨"
    } else if (first == "R" || first == "К"){
        diacr := "˚"
    } else if (first == "Q" || first == "Й"){
        diacr := "˘"
    } else if (first == "^"){
        diacr := "ˆ"
    } else if (first == "~" || first == "Ё"){
        diacr := "`"
    }
    if (diacr) {
        combo := diacr . substr(combo, 2, strlen(combo))
    }
    return combo
}

;========================================================Compose key handler
RAlt::
    ;Cunning hook: RAlt Up sends {CtrlBreak} that stops Input that RAlt has started. 
    Input, combo, V C,{CtrlBreak}
    ;RAlt continues to perform and tries to find passed combination.

    ;Convert first letter to birman's kbd deadkey
    combo := escapeBirmanDiacritics(combo)

    getCombo(combos, combo) || getCombo(htmlCodes, combo) || getCombo(extensions, combo) || getCombo(birmans, combo)
    if (lastResult){
        clear(StrLen(combo))
        Send %lastResult%
    } 
    else {
        utf := RegExMatch(combo, "[0-9]{2,8}")
        if (utf) { ;if no combos found - try to send Alt+… command, but extended to unicode
            clear(StrLen(combo))
            getCharFromUTF(combo) 
        }
    }
    return

RAlt Up::
    SendEvent {CtrlBreak}
    return

;=========================================================Symbol sequences handler
;~[ Up::
~sc01a Up::
    ;TODO: make something to ignore not [] as input.
    Input, combo, V C, {sc01a}{sc01b}[]
    if (ErrorLevel == "EndKey:]" || ErrorLevel == "EndKey:sc01B") { ;finish sequence
        getLorem(combo) || getCombo(combos, combo) || getCombo(htmlCodes, combo) || getCombo(extensions, combo)
        if (lastResult) {
            clear(StrLen(combo)+2)
            Send %lastResult%
        } else {
            utf := RegExMatch(combo, "[0-9]{4,}")
            if (utf) { ;if no combos found - try to send Alt+… command, but extended to unicode
                clear(StrLen(combo)+2)
                getCharFromUTF(combo)
            }
        }
    }
    return


;========================================================Selection Modifier key listener (color conversion, typograf, and so on)
AppsKey:: 
    Input, combo, ,{CtrlBreak}
    comboCorrect := checkSelectionCombo(combo)
    if (comboCorrect){

        backupClipboard()

        Send ^c
        source := clipboard
        treatRes := treatSelection[combo](clipboard)

        clipboard = %treatRes%
        Send ^v

        restoreClipboard()
    } 
    else {
    }
    return

AppsKey Up::
    SendEvent {CtrlBreak}
    return


;========================================================Mac dead keys diacritics handlers/listeners
;!n::
;!~::
!sc031::
+!sc029::
    listenDiacritics("˜")
    return

;!`::
!sc029::
    listenDiacritics("``")
    return

;+!
+!sc028::
    Send Æ
    return

;!'::
!sc028::
    Send æ
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
    listenDiacritics("ˆ")
    return

;!u::
;!"::
!sc016::
;+!sc028::
    listenDiacritics("¨")
    return

;+!a::
+!sc01e::
    Send Å
    return
;+!c::
+!sc02e::
    Send Ç
    return
!sc02e::
    Send ç
    return
;+!o::
+!sc18::
    Send Ø
    return
!sc18::
    Send ø
    return



;===========================================================Hotkeys
;^+!w::
^+!sc011::
    Send „
    return
;^+![::
^+!sc01A:: 
    Send „
    return
;+![::
+!sc01A::
    Send ”
    return
;![::
!sc01A::
    Send “
    return

;^+!]::
^+!sc01b::
    Send ‚
    return
;+!]::
+!sc01b::
    Send ’
    return
;!]::
!sc01b::
    Send ‘
    return

;+!t::
+!sc014::
    Send ‡
    return
;!t::
!sc014::
    Send †
    return

+!7::
    Send ‡
    return

;!;::
!sc027::
    Send …
    return

;+!r::
+!sc013::
    Send ‰
    return

+!3::
    Send ‹
    return
+!4::
    Send ›
    return

!2::
    Send ™
    return

^+!-::
    Send  — 
    return
+!-::
    Send —
    return
;!-::
!-::
    Send –
    return

!1::
    Send ¡
    return
!4::
    Send ¢
    return
!3::
    Send £
    return
;!y::
!sc015::
    Send ¥
    return
!6::
    Send §
    return
;+!u::
+!sc016::
    Send ¨
    return
;!g::
!sc022::
    Send ©
    return
!9::
    Send ª
    return
;+!\::
+!\::
    Send »
    return
;!\::
!\::
    Send «
    return
;!l::
!sc026::
    Send ¬
    return
;!r::
!sc013::
    Send ®
    return
+!8::
    Send °
    return
;+!=::
+!=::
    Send ±
    return
;+!e::
+!sc012::
    Send ´
    return
;!m::
!sc032::
    Send µ
    return
!7::
    Send ¶
    return
+!9::
    Send ·
    return
;+!z::
+!sc02c::
    Send ¸
    return
!0::
    Send º
    return
;+!?::
+!?::
    Send ¿
    return
;!s::
!sc01f::
    Send ß
    return
;!a::
!sc01e::
    Send å
    return

^+!Space:: ;emspace
    KeyWait Alt
    Send  
    return
+!Space:: ;&nobr;
    KeyWait Alt
    Send  
    return
!Space::
    KeyWait Alt
    Send  
    return



;!x::
;+!8::
!sc02d::
    Send ×
    return
+!*::
    Send ∙
    return

+^!=::
    Send ≡
    return

!=::
    Send ≠
    return

;TODO:
;+!^.::
+!^sc034::
    Send ●
    return
;+!.::
+!sc034::
    Send •
    return
;!.::
!sc034::
    Send ∙
    return

::...::…
::(c)::©
::(r)::® 
::(tm)::™
::(sm)::℠

^+!1::
    Send ¹
    return
^+!2::
    Send ²
    return
^+!3::
    Send ³
    return
^+!4::
    Send ⁴
    return
^+!5::
    Send ⁵
    return
^+!6::
    Send ⁶
    return
^+!7::
    Send ⁷
    return
^+!8::
    Send ⁸
    return
^+!9::
    Send ⁹
    return
^+!0::
    Send ⁰
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