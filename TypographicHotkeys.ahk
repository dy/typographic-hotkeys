; TODO:
; some bugs when combo outside of [], for example []lorem, and besides, when just ] appeared. So, when you see [], try to grab combo inside, not a listening of something.
; some bugs with compose in SciTe
; if language - cyrillic, make «» instead of "" on key 2
; correct birman diacritics: ?! doesnt give ‽
; sometimes it gives → when laptop awakes
; make listview: it's not bad, actually, for character & description
; sometimes catches bug, like with fakeData["en"]["lastName"] changes to something with umlaut ¨ and 3-4 symbols of length
; make destructors & inspect on memory leaks
; simple ["…"] went bad
; TODO: debug photoshop
;fuck birman, do useful french symbol
; TODO: debug faker in eclipse

;TODO: faker date & lorem normalize

;TODO: make auto nbsp after в городе…
;TODO: make ru quotes easy autoinput
;TODO: replace combos with dynamic hotstrings

;TODO: make assigning hotstrings in runtime based on selected text

;≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡ INIT

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn UseUnsetGlobal ; Recommended for catching common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
;#Hotstring * ? ;Make hotstrings not to wait the end key and trigger inside strings

locals := ["ru","en"]
local := "en" ;current language 

;#Include ./inc/Gdip.ahk
#Include %a_scriptdir%/inc/KbdLayout.ahk
#Include %a_scriptdir%/inc/Util.ahk
#Include %a_scriptdir%/inc/Combinations.ahk
#Include %a_scriptdir%/inc/Faker.ahk
#Include %a_scriptdir%/inc/Typograf.ahk
#Include %a_scriptdir%/inc/Evaluate.ahk
#Include %a_scriptdir%/inc/Hotstrings.ahk
;#Include %a_scriptdir%/inc/HotstringsHelper.ahk ;improper
;#Include inc/TF.ahk
;#Include ./inc/Groups.ahk
;#Include ./inc/Menu.ahk
;#Include ./inc/HTML.ahk
;#Include ./inc/Selection.ahk


;==============================WS tests
;__WS_iScriptControlObj__ := ""
;__WS_iScriptErrorObj__ := ""

;#Include %a_scriptdir%/inc/ws4ahk.ahk

;msscriptpath := a_scriptdir . "\msscript.ocx"

;msgbox, %msscriptpath%

;WS_Initialize( "JScript", msscriptpath )
;WS_Exec("alert('Hello, I'm JS)")
;WS_Uninitialize()

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
;Make Birmat not destructive for basic combos like ^0
escapeBirmanDiacritics(combo){
    ;`, q=˘, 6 = ˆ, /=´, n=˜, v = ˇ, r = ˚, z = ¸, ; = ¨
    first := substr(combo, 1, 1)
    diacr := ""
    if (strlen(combo) == 2) {
        if (first == "?" && combo != "?!") {
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
    }
    if (diacr) {
        combo := diacr . substr(combo, 2, strlen(combo))
    }
    return combo
}
;===================================================== Typograph of selected text
;+^t::
^+!sc014::
    backupClipboard()
	
    insertAndRestore( typograf( getSelectedText() ) )
	
    //restoreClipboard()
    return

;========================================================= Evaluate selected
;+^e::
^+!sc012::
    backupClipboard()
    ;insertAndRestore( evaluate( getSelectedText()) )

    return

;========================================LC, UC selection
;+^!u::
+^!sc016::
    backupClipboard()

    insert( toUpper( getSelectedText() ) )

    restoreClipboard()
    return

;+^!l::
+^!sc026::
    backupClipboard()

    insert( toLower( getSelectedText() ) )

    restoreClipboard()
    return

;======================================== CSS color flatten (?)


;===================================================== Duplicate selection shortcut: problem with selecting text
;repeatDuplicateFlag := false ;is duplicate repeated
;+^d::
;^+sc020::
;    backupClipboard()
;
;    text := getSelectedText()
;    len := strlen(text) - 1
;
;    Send {End}
;    insert(text)
;
;    Send {Left %len%}+{Right %len%}
;
;    restoreClipboard()
;    return

;=========================== Fix windows ctrl + backsp
^sc00e::
    Send +^{Left}{Delete} 
    return

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
    } else { ;if no combos found - try to send Alt+… command, but extended to unicode
        utf := RegExMatch(combo, "[0-9]{2,8}")
        if (utf) { 
            clear(StrLen(combo))
            getCharFromUTF(combo) 
        }
    }
    return

RAlt Up::
    SendEvent {CtrlBreak}
    return

;PgUp::
;    rate := DllCall("GetCaretBlinkTime")
;    msgBox, %rate%
;    return


;=========================================================Symbol sequences handler
;~[::
~sc01a Up::
    ;TODO: make something to ignore not [] as input. For special format line {{}}
    ;TODO: make something to handle not input, but expression between []
    Input, combo, V C, []{sc01a}{sc01b} ;""{sc028}{sc01}
    ;msgbox, stop %errorlevel% %combo%
    if (ErrorLevel == "EndKey:]" || ErrorLevel == "EndKey:sc01B") { ;finish sequence
        status := getFake(combo) || getCombo(combos, combo) || getCombo(htmlCodes, combo) || getCombo(extensions, combo)
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
    } else { ;finished by escape

    }
    return


;========================================================Web-dev key behaviour
;AppsKey Up::
;    SendEvent {CtrlBreak}
;    return

;AppsKey::
;    SendEvent {CtrlBreak} ;That's a fucking strange bugfix intended to get rid of "initial pumping" of AppKey. If to switch it ;off, first launch will not be handled correctly (keypressing will be ignored)
;    
;    menuType := "" ;type of menuType to perform 
;
;   backupClipboard()
;
;    ;Something goes wrong here
;    SendInput ^c
;
;    ;TODO: check not is copied something, but is selected something. Because of in Sublime nothing selected, but entire row copied
;    ;if (clipboard) {
;    ;    ;selection isn't empty.
;    ;    menuType := "selection"
;    ;    Input, combo, V,{CtrlBreak}
;    ;    MsgBox, stopd
;    ;} else {  
;        ;MsgBox, isabout
;        ;selection is empty. Type symbols  
;        Input, combo, V ,{CtrlBreak}
;        ;MsgBox, justafter
;        menuType := "selection"
;        selection := clipboard
    ;}
    

    ;seek for where is caret now
    ;CaretPos := getCaretPosition()
    ;CaretX := CaretPos["x"]
    ;CaretY := CaretPos["y"]

    ;testBinary()

    ;Menu, TestMenu, add, Item1, MenuHandler
    ;Menu, TestMenu, Show, %CaretX%, %CaretY%

;    combo := combo . ""
;
;    if (combo || combo == 0) { 
;        ;Something typed while appkey was pressed
;        ;selectBefore(strlen(combo)) ;select inputted combo;;
;
;        if (menuType == "selection") {
;            ;If wrap intention - wrap with html tag
;            ;resStr := wrapWithTag(clipboard, combo)
;            ;clipboard = %resStr%
;            ;Send ^v
;        } else if (strlen(combo) == 1) {
;            ;
;        } else {

;        }

        ;Loop, 10
        ;{sdfds
        ;    LV_Add("", A_Index, "a", "b", "c")
        ;}

;    } else { 
        ;Appskey just pressed and released
;        if (menuType == "selection") {
            ;Nothing was typed – call menu of selected symbol    
;            ref := getCharRef(selection)
;            if (ref) {
;                group := ref.group, desc := ref.description, groupSet := getGroupSet(group)
;                MsgBox, %group%|%desc%|%groupSet%;

                ;TODO: make listView
;                showMenu(group)
;            }
;        }
;    }

;    restoreClipboard()

;    return




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
^+!sc18::
    Send °
    return
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
+!0::
    Send º
    return
!0::
    Send °
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


^+!sc02d::
    Send ✕
    return
+!sc02d::
    Send ✖
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


^+!Up::
    Send ▲
    return
+!Up::
    Send ▴
    return
!Up::
    Send ↑
    return
^+!Down::
    Send ▼
    return
+!Down::
    Send ▾
    return
!Down::
    Send ↓
    return
^+!Left::
    Send ◀
    return
+!Left::
    Send ◂
    return
!Left::
    Send ←
    return
^+!Right::
    Send ▶
    return
+!Right::
    Send ▸
    return
!Right::
    Send →
    return


;===================Specials
;^+!?::
;^+!/::
^+!sc035::
    Send ؟
    return
;+!?::
;+!/::
+!sc035::
    Send ¿
    return
;!?::
;!/::
!sc035::
    Send ‽
    return


;---------------string replacements
:?*:...::…
:*:(c)::©
:*:(r)::® 
:*:(tm)::™
:*:(sm)::℠
:*:←→::↔

;--------------en apostrophes
:?*:n't::n’t
;:*:et's::et’s   ;let’s
:?:'m::’m
:?:'re::’re
:?:'s::’s
:?:s'::s’
:?:'st::’st
:?:'ve::’ve
:?:'d::’d
:?:'ll::’ll
:?:'em::’em 
:?:'im::’im 
:*:o'::o’ ;o'clock
:?:in'::in’ ;crackin' 
;-----------------fr apostrophes
:*:l'::l’ ;l'heure
:*:d'::d’ ;d'or

;--------------nobrs
:*:fu`t::
(
function () {
var self = this, o = self.options;

return self;
}
)

;------------a few useful JS replacements
:*R:){::) {
:*R:if(::if (
:?*R:ion(::ion (