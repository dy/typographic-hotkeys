; if language - cyrillic, make «» instead of "" on key 2

;2 MAIN TODOS:
;1. Autoreplacements of spaces between prepositions
;2. Alternating groups, reading prepositions from
;2.1 Make descriptions tooltip
;2.2 Make groups on selected element
;2.3 Make symbol combinations through alt
;2.4 Make description on selected element
;2.5 Make timeouts
;2.6 Slow down repeat-speed on holding Alt + →

;Move ... to Alt+... combination: coffeescript splattings use ...

;3. Load settings from file

;TODO: make timeouts on combo input

;TODO: ensure switching Alt off when loaded up after sleep

;TODO: docs

;TODO: bug→ sometimes Alt or Shift is holding and doesn’t hold up. Resolve this shit.

;TODO: photoshop ctrl+shift+alt+z doesnt work sometimes


;≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡ INIT
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn UseUnsetGlobal ; Recommended for catching common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
;#Hotstring * ? ;Make hotstrings not to wait the end key and trigger inside strings

locals := ["ru", "en"]
local := "en" ;current language

#Include %a_scriptdir%/inc/KbdLayout.ahk
#Include %a_scriptdir%/inc/Util.ahk
#Include %a_scriptdir%/inc/Typograf.ahk


;============================================================Make load on startup, if launched first time
sname := A_Startup . "\" . SubStr(A_ScriptName, 1, -4) . ".lnk"
;IfNotExist, %sname%
    ;MsgBox, %sname%
    FileCreateShortcut, %A_ScriptFullPath%, %sname%


;================================= Program hotkeys
hkList := ComObjCreate("Scripting.Dictionary")
hkList.item("!+^sc016") := "UpperCase" ;ctrl+shift+alt+u
hkList.item("!+^sc026") := "LowerCase" ;ctrl+shift+alt+l
hkList.item("^sc00e") := "FixedWindowsCtrlBacksp" ;←

makeHotkeys()
makeGroupHandlers()

;bind program hotkeys
makeHotkeys(){
    global hkList

    keys := hkList.keys()
    For key in keys
    {
        sub := hkList.item(key)
        Hotkey, %key%, %sub%
    }
}


;Can’t trigger self-registered hotkeys by send, so need to have separate handler for this
triggerHotkey(k, mshift, mctrl, malt) {
    m := ""
    if (mctrl) {
        if (mshift) {
            if (malt) {
                m := "!+^"
            } else {
                m := "+^"
            }
        } else {
            if (malt) {
                m := "!^"
            } else {
                m := "^"
            }
        }
    } else {
        if (mshift) {
            if (malt) {
                m := "!+"
            } else {
                m := "+"
            }
        } else {
            if (malt) {
                m := "!"
            } else {
                m := ""
            }
        }
    }

    hk = %m%%k%
    if (!checkHotkey(hk)) {
        ;msgbox, sendHotkey-%hk%
        Send %m%{%k%}
    }
    return
}

;Checks already existing hotkey. If exists, triggers it
checkHotkey(hk) {
    global hkList
    ;msgbox, checkhk-%hk%-
    sub := hkList.item(hk)
    ;msgbox %sub%
    if (sub){
        gosub %sub%
        return true
    }
    return false
}


;============================================================Main handler of combos

;Main char info getter
getCharDesc(char){
	str := "Description of char " . char

	return str
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


;==================================================== Alt-Groups handlers
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
            groups.item(firstLetter) := group
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
    global miscLayout

    ;msgbox, dogroups

    kl := getDefaultKeyboardLayout()
    layout :=
    if (kl == 409){
        layout := enLayout
    } else if (kl == 419){
        layout := ruLayout
    } else {
        msgbox, TypographicHotkeys: Layout %kl% isn’t supported. Please, contribute https://github.com/dfcreative/windows_typographic_hotkeys
    }

    ;bind layout keys
    keys := layout.keys()
    For key in keys
    {
        makeGroupHandler(key)
    }

    ;bind layout independent keys
    keys := miscLayout.keys()
    For key in keys
    {
        makeGroupHandler(key)
    }
}


HandleGroupPress:
    ;Detect if initial time launched
    global keyListenTimeout
    if (strokeCount == "") {
        ;MsgBox, Init first time
        global strokeCount := 0
        global strokeChar :=
        global strokeKey :=
    } else {
        ;TODO: ignore adjacent keys (if typed other than )

        global strokeCount := strokeCount + 1

        ;First press
        if (strokeCount == 1) {
            ;Catch key & char pressed
            ;global strokeKey := SubStr(a_thishotkey, -3)

            Delimiter := "&!"
			OmitChar := " "

            StringSplit, out, a_thishotkey, %Delimiter%, %OmitChar%
            global strokeKey := out2
            ;msgbox, %strokeKey%

            ;ignore if modifiers are set
            if (GetKeyState("Ctrl")) {
                triggerHotkey(strokeKey, GetKeyState("Shift"), true, true)
                strokeCount := 0
                gosub StopListening
                return
            }

            global strokeChar := translateKey(strokeKey, GetKeyState("LShift"), getCurrentKeyboardLayout())
            ;msgbox, %strokeChar%

            ;Show initial char ignoring backspace
            charPut := getGroupMember(strokeChar, strokeCount)
            ;msgbox, %charPut%
            SendInput {Raw}%charPut%
            SendInput +{Left}

            ;Show proper tooltip hint
            showTooltip(getCharDesc(charPut))

            intendStopListening()
        }

        ;Second and more press - replace symbol
        else {
            charPut := getGroupMember(strokeChar, strokeCount)
            SendInput {Raw}%charPut%
            SendInput +{Left}
            showTooltip(getCharDesc(charPut))

            intendStopListening()

        }
    }
    return

HandleGroupUp:
    altPressed := false
    KeyWait LAlt
    ;MsgBox, %strokeCount%
    gosub StopListening
    return

;to reset listening combos
intendStopListening(n:=3000){
    SetTimer, StopListening, -%n%
}
StopListening:
    if (!strokeCount) {
        return
    }
    SendInput {Right}
    strokeCount := 0
    strokeChar :=
    strokeKey :=
    hideTooltip(300)
    SetTimer, StopListening, Off
    return

;==================Tooltips
CoordMode, ToolTip, Screen
CoordMode, Caret, Screen

showToolTip(text) {
	MouseGetPos, tx, ty
	if (A_caretX) {
		tx := a_caretx
	}
	if (A_caretY) {
		ty := a_caretY
	}
	;ToolTip, %text% %a_caretx%, X %tx%, Y %ty%
	;SetTimer, RemoveToolTip, 5000
	return
}

hideToolTip(n:=0){
	SetTimer, RemoveToolTip, %n%
}

RemoveToolTip:
SetTimer, RemoveToolTip, Off
ToolTip
return


;===================================================== Text tools
UpperCase:
   backupClipboard()
   insert( toUpper( getSelectedText() ) )
   restoreClipboard()
   return

LowerCase:
    backupClipboard()
    insert( toLower( getSelectedText() ) )
    restoreClipboard()
    return


FixedWindowsCtrlBacksp:
    Send +^{Left}{Delete}
    return

