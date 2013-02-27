; TODO:
; some bugs when combo outside of [], for example []lorem, and besides, when just ] appeared. So, when you see [], try to grab combo inside, not a listening of something.
; some bugs with compose in SciTe
; if language - cyrillic, make «» instead of "" on key 2
; sometimes it gives → when laptop awakes
; sometimes catches bug, like with fakeData["en"]["lastName"] changes to something with umlaut ¨ and 3-4 symbols of length
; make destructors & inspect on memory leaks
; TODO: debug photoshop
;fuck birman, do useful french symbol
; TODO: debug faker in eclipse

;TODO: faker date & lorem normalize

;TODO: make auto nbsp after в городе…
;TODO: make ru quotes easy autoinput
;TODO: replace combos with dynamic hotstrings

;TODO: make assigning hotstrings in runtime based on selected text
;TODO: make old-russian converter

;2 MAIN TODOS:
;1. Autoreplacements of spaces between prepositions 
;2. Alternating groups, reading prepositions from 
;2.0 Make full logical groups
;2.1 Make descriptions tooltip
;2.2 Make groups on selected element
;2.3 Make symbol combinations through alt
;2.4 Make description on selected element
;2.5 Make timeouts

;3. Load settings from file
;3.1 Load resources form files

;TODO: make timeouts on combo input


;≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡ INIT
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn UseUnsetGlobal ; Recommended for catching common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
;#Hotstring * ? ;Make hotstrings not to wait the end key and trigger inside strings

locals := ["ru","en"]
local := "en" ;current language 

#Include %a_scriptdir%/inc/KbdLayout.ahk
#Include %a_scriptdir%/inc/Util.ahk
#Include %a_scriptdir%/inc/Combinations.ahk
#Include %a_scriptdir%/inc/Faker.ahk
#Include %a_scriptdir%/inc/Typograf.ahk


;============================================================Make load on startup, if launched first time
sname := A_Startup . "\" . SubStr(A_ScriptName, 1, -4) . ".lnk"
;IfNotExist, %sname%
    ;MsgBox, %sname%
    FileCreateShortcut, %A_ScriptFullPath%, %sname%

;============================================================Main handler of combos

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
;Bad function style, but it's simplier to output here
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

;==================================================== Groups handlers
strokeCount := ;Times one key pressed
strokeChar := ;StrokeChar is a key, translated to kbd layout
strokeKey := ;Strokekey is a current key of hotkey (without specs) pressed.
groups := ComObjCreate("Scripting.Dictionary") ;basic dictionary of symbol-groups by keys of letters 

;Make groups grom file
initGroups(file) {
    global groups
    Loop, read, %file%
    {
        ;msgbox, %A_LoopReadLine%
        group := Trim(A_LoopReadLine)
        if (group){
            firstLetter := subStr(group, 1, 1)
            if (firstLetter != ";") {
                groups.item(firstLetter) := group
            }
        }
    }
}

initGroups(a_scriptdir . "`\groups.txt")

;Returns Nth element of Mth group
getGroupMember(groupKey, number){
    global groups
    groupStr := groups.item(groupKey)
    groupLen := strLen(groupStr)
    char := subStr(groupStr, Mod(number+1, groupLen), 1)
    return char
}

;Creates hotkey binding for key
makeGroupHandler(key){
    Hotkey, LAlt & %key%, HandleGroupPress
    Hotkey, LAlt & %key% Up, HandleGroupUp
    return
}

;Runner to make hotkeys for layout
makeGroupHandlers() {
    global enLayout
    global ruLayout

    kl := getDefaultKeyboardLayout()
    layout :=

    if (kl == KeyboardLayout_EN){
        layout := enLayout
    } else if (kl == KeyboardLayout_RU){
        layout := ruLayout
    } else {
        msgbox, TypographicHotkeys: Layout %kl% isn’t supported. Please, contribute https://github.com/dfcreative/windows_typographic_hotkeys
    }

    ;for each key in layout
    keys := layout.keys()
    For key in keys
    {
        makeGroupHandler(key)
    }
}

makeGroupHandlers()

HandleGroupPress:
    ;Detect if initial time launched
    if (strokeCount == "") {
        ;MsgBox, Init first time
        global strokeCount := 0
        global strokeChar :=
        global strokeKey :=
    } else {
        ;TODO: ignore if modifiers are set
        if (GetKeyState("LCtrl")) {
            ;MsgBox, %a_thislabel%
            SendInput {LCtrl & %strokeChar%}
            return
        }

        ;TODO: ignore adjacent keys (if typed other than )

        global strokeCount := strokeCount + 1

        ;First press
        if (strokeCount == 1) {
            ;Catch key & char pressed
            global strokeKey := SubStr(a_thishotkey, -3)            
            global strokeChar := translateKey(strokeKey, GetKeyState("LShift"), getCurrentKeyboardLayout())
            ;msgbox, %strokeChar%

            ;Show initial char ignoring backspace
            charPut := getGroupMember(strokeChar, strokeCount)
            SendInput {Raw}%charPut%
        } 

        ;Second and more press - replace symbol
        else {
            charPut := getGroupMember(strokeChar, strokeCount)
            SendInput {Backspace}{Raw}%charPut%
        }
    }
    return

HandleGroupUp:
    altPressed := false
    KeyWait LAlt
    ;MsgBox, %strokeCount%
    strokeCount := 0
    strokeChar := 
    strokeKey := 
    return

;===================================================== Typograph of selected text
;+^t::
^+!sc014::
    backupClipboard()
	
    insertAndRestore( typograf( getSelectedText() ) )
	
    return

;======================================== LC, UC selection
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


;=========================== Duplicate selection shortcut: problem with selecting text
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


    

    ;seek for where is caret now
    ;CaretPos := getCaretPosition()
    ;CaretX := CaretPos["x"]
    ;CaretY := CaretPos["y"]



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
;:*:o'::o’ ;o'clock
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