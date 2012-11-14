#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Recommended for catching common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


#Include ./inc/Combinations.ahk
#Include ./inc/Util.ahk
#Include ./inc/Lorem.ahk


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


;========================================================Compose key handler
RAlt::
    ;Cunning hook: RAlt Up sends {CtrlBreak} that stops Input that RAlt has started. 
    Input, combo, V C,{CtrlBreak}
    ;RAlt continues to perform and tries to find passed combination.  
    getCombo(combos, combo) || getCombo(htmlCodes, combo) || getCombo(extensions, combo)
    if (lastResult){
        clear(StrLen(combo))
        Send %lastResult%
    } 
    else {
        utf := RegExMatch(combo, "[0-9]+")
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



;!*::
;+!8::
;    Send ×
;    return
^!*::
^+!8::
    Send ∙
    return

+^!=::
    Send ≡
    return

!=::
    Send ≠
    return

!.::
    Send ∙
    return
+!.::
    Send •
    return
+!^.::
    Send ●
    return

::...::…
::(c)::©
::(r)::® 
::(tm)::™
::(sm)::℠

!^1::
    Send ¹
    return
!^2::
    Send ²
    return
!^3::
    Send ³
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