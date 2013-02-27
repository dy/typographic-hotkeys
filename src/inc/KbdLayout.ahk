; All related to work with keyboard layouts, that windows can’t

KLF_ACTIVATE := 1

KeyboardLayout_EN := 0x4090409
KeyboardLayout_RU := 0x4190419


;Loads specified keyboardLayout
;use values form getKeyboardLayout
LoadKeyboardLayout(keyboardLayout)
{
	global KLF_ACTIVATE

	DllCall("user32.dll\LoadKeyboardLayout", "Str", keyboardLayout, "uint", KLF_ACTIVATE)
}



;get current keyboard layout
getCurrentKeyboardLayout()
{
	;SetFormat, Integer, H
    WinGet, WinID,, A
    ThreadID:=DllCall("GetWindowThreadProcessId", "UInt", WinID, "UInt", 0)
    InputLocaleID:=DllCall("GetKeyboardLayout", "UInt", ThreadID, "UInt")
    return InputLocaleID
}


;get default keyboard layout
getDefaultKeyboardLayout()
{

	;VarSetCapacity(keyboardLayout, 16)

	DllCall("user32.dll\GetKeyboardLayoutName", "uint", keyboardLayout)
	return keyboardLayout
}


;MapVirtualKey dowsn’t work - so, then we’ll do own lunapark with blackjack & hookers
enLayout := ComObjCreate("Scripting.Dictionary")
enLayout.item("VK20") := " " ;space
enLayout.item("VK25") := " " ;left
enLayout.item("VK26") := " " ;up
enLayout.item("VK27") := " " ;right
enLayout.item("VK28") := " " ;down
enLayout.item("VKC0") := "``~" ;vkoem3
enLayout.item("VK31") := "1!"
enLayout.item("VK32") := "2@"
enLayout.item("VK33") := "3#"
enLayout.item("VK34") := "4$"
enLayout.item("VK35") := "5%"
enLayout.item("VK36") := "6^"
enLayout.item("VK37") := "7&"
enLayout.item("VK38") := "8*"
enLayout.item("VK39") := "9("
enLayout.item("VK30") := "0)"
enLayout.item("VKBD") := "-_" ;vkoemminus
enLayout.item("VKBB") := "=+" ;vkoemplus
enLayout.item("VKDB") := "[{" ;vkoem4
enLayout.item("VKDD") := "]}" ;vkoem6
enLayout.item("VKDC") := "\|" ;vkoem5
enLayout.item("VKBA") := ";:" ;vkoem1
enLayout.item("VKDE") := "'""" ;vkoem7
enLayout.item("VKBC") := ",<" ;vkoemcomma
enLayout.item("VKBE") := ".>" ;vkoemperiod
enLayout.item("VKBF") := "/?" ;vkoem2
enLayout.item("VK41") := "aA"
enLayout.item("VK42") := "bB"
enLayout.item("VK43") := "cC"
enLayout.item("VK44") := "dD"
enLayout.item("VK45") := "eE"
enLayout.item("VK46") := "fF"
enLayout.item("VK47") := "gG"
enLayout.item("VK48") := "hH"
enLayout.item("VK49") := "iI"
enLayout.item("VK4A") := "jJ"
enLayout.item("VK4B") := "kK"
enLayout.item("VK4C") := "lL"
enLayout.item("VK4D") := "mM"
enLayout.item("VK4E") := "nN"
enLayout.item("VK4F") := "oO"
enLayout.item("VK50") := "pP"
enLayout.item("VK51") := "qQ"
enLayout.item("VK52") := "rR"
enLayout.item("VK53") := "sS"
enLayout.item("VK54") := "tT"
enLayout.item("VK55") := "uU"
enLayout.item("VK56") := "vV"
enLayout.item("VK57") := "wW"
enLayout.item("VK58") := "xX"
enLayout.item("VK59") := "yY"
enLayout.item("VK5A") := "zZ"

ruLayout := ComObjCreate("Scripting.Dictionary")
ruLayout.item("VK20") := " " ;space
ruLayout.item("VK25") := " " ;left
ruLayout.item("VK26") := " " ;up
ruLayout.item("VK27") := " " ;right
ruLayout.item("VK28") := " " ;down
ruLayout.item("VKC0") := "ёЁ" ;vkoem3
ruLayout.item("VK31") := "1!"
ruLayout.item("VK32") := "2"""
ruLayout.item("VK33") := "3№"
ruLayout.item("VK34") := "4;"
ruLayout.item("VK35") := "5%"
ruLayout.item("VK36") := "6:"
ruLayout.item("VK37") := "7?"
ruLayout.item("VK38") := "8*"
ruLayout.item("VK39") := "9("
ruLayout.item("VK30") := "0)"
ruLayout.item("VKBD") := "-_" ;vkoemminus
ruLayout.item("VKBB") := "=+" ;vkoemplus
ruLayout.item("VKDB") := "хХ" ;vkoem4
ruLayout.item("VKDD") := "ъЪ" ;vkoem6
ruLayout.item("VKDC") := "\/" ;vkoem5
ruLayout.item("VKBA") := "жЖ" ;vkoem1
ruLayout.item("VKDE") := "эЭ" ;vkoem7
ruLayout.item("VKBC") := "бБ" ;vkoemcomma
ruLayout.item("VKBE") := "юЮ" ;vkoemperiod
ruLayout.item("VKBF") := ".," ;vkoem2
ruLayout.item("VK41") := "фФ"
ruLayout.item("VK42") := "иИ"
ruLayout.item("VK43") := "сС"
ruLayout.item("VK44") := "вВ"
ruLayout.item("VK45") := "уУ"
ruLayout.item("VK46") := "аА"
ruLayout.item("VK47") := "пП"
ruLayout.item("VK48") := "рР"
ruLayout.item("VK49") := "шШ"
ruLayout.item("VK4A") := "оО"
ruLayout.item("VK4B") := "лЛ"
ruLayout.item("VK4C") := "дД"
ruLayout.item("VK4D") := "ьЬ"
ruLayout.item("VK4E") := "тТ"
ruLayout.item("VK4F") := "щЩ"
ruLayout.item("VK50") := "зЗ"
ruLayout.item("VK51") := "йЙ"
ruLayout.item("VK52") := "кК"
ruLayout.item("VK53") := "ыЫ"
ruLayout.item("VK54") := "еЕ"
ruLayout.item("VK55") := "гГ"
ruLayout.item("VK56") := "мМ"
ruLayout.item("VK57") := "цЦ"
ruLayout.item("VK58") := "чЧ"
ruLayout.item("VK59") := "нН"
ruLayout.item("VK5A") := "яЯ"

;Translate key pressed (read scancode/vk, but actually symbol), based on shift hold and target layout
;Technically, it should be performed through MapVirtualKey, but it doesn’t work as presumed

translateKey(vk, shift, kl) {
	;mapvirtualkey doesnt  work. Just commented code to sort this out (I don’t do frequent commits)
    ;sc := DllCall("MapVirtualKey","uint",vk,"uint",0)
    ;cc1 := DllCall("MapVirtualKey","uint",vk,"uint",2, "uint", 0x04190419)
    ;DllCall("ToAscii", "uint", vk, "uint", sc, "uchar", 0, "ushort", &cc2, "uint", 0, "uint", kl)

    global KeyboardLayout_EN
    global KeyboardLayout_RU
    global enLayout
    global ruLayout
    keyStr :=

    ;TODO: solve different layouts problem
    if (kl == KeyboardLayout_EN) {
    	keyStr := enLayout.item(vk)
    } else if (kl == KeyboardLayout_RU) {
    	keyStr := ruLayout.item(vk)
    } else {
    	msgBox, TypographicHotkeys: Special keys for layout %kl% isn’t supported. Please, contribute https://github.com/dfcreative/windows_typographic_hotkeys
    }
    ;keyStr := ruLayout.item("VK41")
    ;msgbox, -%vk%-%keyStr%

    if (shift) {
		return SubStr(keyStr, 0, 1)
	} else {
		return SubStr(keyStr, 1, 1)
	}
}