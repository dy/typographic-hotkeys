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

	VarSetCapacity(keyboardLayout, 16)

	DllCall("user32.dll\GetKeyboardLayoutName", "str", keyboardLayout)
	return keyboardLayout
}


;MapVirtualKey dowsn’t work - so, then we’ll do own lunapark with blackjack & hookers
enLayoutVK := ComObjCreate("Scripting.Dictionary")
enLayoutVK.item("VKC0") := "``~" ;vkoem3
enLayoutVK.item("VK31") := "1!"
enLayoutVK.item("VK32") := "2@"
enLayoutVK.item("VK33") := "3#"
enLayoutVK.item("VK34") := "4$"
enLayoutVK.item("VK35") := "5`%"
enLayoutVK.item("VK36") := "6^"
enLayoutVK.item("VK37") := "7&"
enLayoutVK.item("VK38") := "8*"
enLayoutVK.item("VK39") := "9("
enLayoutVK.item("VK30") := "0)"
enLayoutVK.item("VKDB") := "[{" ;vkoem4
enLayoutVK.item("VKDD") := "]}" ;vkoem6
enLayoutVK.item("VKDC") := "\|" ;vkoem5
enLayoutVK.item("VKBA") := "`;:" ;vkoem1
enLayoutVK.item("VKDE") := "'""" ;vkoem7
enLayoutVK.item("VKBC") := "`,<" ;vkoemcomma
enLayoutVK.item("VKBE") := ".>" ;vkoemperiod
enLayoutVK.item("VKBF") := "/?" ;vkoem2
enLayoutVK.item("VK41") := "aA"
enLayoutVK.item("VK42") := "bB"
enLayoutVK.item("VK43") := "cC"
enLayoutVK.item("VK44") := "dD"
enLayoutVK.item("VK45") := "eE"
enLayoutVK.item("VK46") := "fF"
enLayoutVK.item("VK47") := "gG"
enLayoutVK.item("VK48") := "hH"
enLayoutVK.item("VK49") := "iI"
enLayoutVK.item("VK4A") := "jJ"
enLayoutVK.item("VK4B") := "kK"
enLayoutVK.item("VK4C") := "lL"
enLayoutVK.item("VK4D") := "mM"
enLayoutVK.item("VK4E") := "nN"
enLayoutVK.item("VK4F") := "oO"
enLayoutVK.item("VK50") := "pP"
enLayoutVK.item("VK51") := "qQ"
enLayoutVK.item("VK52") := "rR"
enLayoutVK.item("VK53") := "sS"
enLayoutVK.item("VK54") := "tT"
enLayoutVK.item("VK55") := "uU"
enLayoutVK.item("VK56") := "vV"
enLayoutVK.item("VK57") := "wW"
enLayoutVK.item("VK58") := "xX"
enLayoutVK.item("VK59") := "yY"
enLayoutVK.item("VK5A") := "zZ"

ruLayoutVK := ComObjCreate("Scripting.Dictionary")
ruLayoutVK.item("VKC0") := "ёЁ" ;vkoem3
ruLayoutVK.item("VK31") := "1!"
ruLayoutVK.item("VK32") := "2"""
ruLayoutVK.item("VK33") := "3№"
ruLayoutVK.item("VK34") := "4`;"
ruLayoutVK.item("VK35") := "5`%"
ruLayoutVK.item("VK36") := "6:"
ruLayoutVK.item("VK37") := "7?"
ruLayoutVK.item("VK38") := "8*"
ruLayoutVK.item("VK39") := "9("
ruLayoutVK.item("VK30") := "0)"
ruLayoutVK.item("VKDB") := "хХ" ;vkoem4
ruLayoutVK.item("VKDD") := "ъЪ" ;vkoem6
ruLayoutVK.item("VKDC") := "\/" ;vkoem5
ruLayoutVK.item("VKBA") := "жЖ" ;vkoem1
ruLayoutVK.item("VKDE") := "эЭ" ;vkoem7
ruLayoutVK.item("VKBC") := "бБ" ;vkoemcomma
ruLayoutVK.item("VKBE") := "юЮ" ;vkoemperiod
ruLayoutVK.item("VKBF") := ".`," ;vkoem2
ruLayoutVK.item("VK41") := "фФ"
ruLayoutVK.item("VK42") := "иИ"
ruLayoutVK.item("VK43") := "сС"
ruLayoutVK.item("VK44") := "вВ"
ruLayoutVK.item("VK45") := "уУ"
ruLayoutVK.item("VK46") := "аА"
ruLayoutVK.item("VK47") := "пП"
ruLayoutVK.item("VK48") := "рР"
ruLayoutVK.item("VK49") := "шШ"
ruLayoutVK.item("VK4A") := "оО"
ruLayoutVK.item("VK4B") := "лЛ"
ruLayoutVK.item("VK4C") := "дД"
ruLayoutVK.item("VK4D") := "ьЬ"
ruLayoutVK.item("VK4E") := "тТ"
ruLayoutVK.item("VK4F") := "щЩ"
ruLayoutVK.item("VK50") := "зЗ"
ruLayoutVK.item("VK51") := "йЙ"
ruLayoutVK.item("VK52") := "кК"
ruLayoutVK.item("VK53") := "ыЫ"
ruLayoutVK.item("VK54") := "еЕ"
ruLayoutVK.item("VK55") := "гГ"
ruLayoutVK.item("VK56") := "мМ"
ruLayoutVK.item("VK57") := "цЦ"
ruLayoutVK.item("VK58") := "чЧ"
ruLayoutVK.item("VK59") := "нН"
ruLayoutVK.item("VK5A") := "яЯ"

enLayoutSC := ComObjCreate("Scripting.Dictionary")
enLayoutSC.item("sc029") := "``~" ;vkoem3
enLayoutSC.item("VK31") := "1!"
enLayoutSC.item("VK32") := "2@"
enLayoutSC.item("VK33") := "3#"
enLayoutSC.item("VK34") := "4$"
enLayoutSC.item("VK35") := "5`%"
enLayoutSC.item("VK36") := "6^"
enLayoutSC.item("VK37") := "7&"
enLayoutSC.item("VK38") := "8*"
enLayoutSC.item("VK39") := "9("
enLayoutSC.item("VK30") := "0)"
enLayoutSC.item("sc01a") := "[{" ;vkoem4
enLayoutSC.item("sc01b") := "]}" ;vkoem6
enLayoutSC.item("sc02b") := "\|" ;vkoem5
enLayoutSC.item("sc027") := "`;:" ;vkoem1
enLayoutSC.item("sc028") := "'""" ;vkoem7
enLayoutSC.item("sc033") := "`,<" ;vkoemcomma
enLayoutSC.item("sc034") := ".>" ;vkoemperiod
enLayoutSC.item("VKBF") := "/?" ;vkoem2
enLayoutSC.item("sc01e") := "aA"
enLayoutSC.item("sc030") := "bB"
enLayoutSC.item("sc02e") := "cC"
enLayoutSC.item("sc020") := "dD"
enLayoutSC.item("sc012") := "eE"
enLayoutSC.item("sc021") := "fF"
enLayoutSC.item("sc022") := "gG"
enLayoutSC.item("sc023") := "hH"
enLayoutSC.item("sc017") := "iI"
enLayoutSC.item("sc024") := "jJ"
enLayoutSC.item("sc025") := "kK"
enLayoutSC.item("sc026") := "lL"
enLayoutSC.item("sc031") := "nN"
enLayoutSC.item("sc032") := "mM"
enLayoutSC.item("sc018") := "oO"
enLayoutSC.item("sc019") := "pP"
enLayoutSC.item("sc010") := "qQ"
enLayoutSC.item("sc013") := "rR"
enLayoutSC.item("sc01f") := "sS"
enLayoutSC.item("sc014") := "tT"
enLayoutSC.item("sc016") := "uU"
enLayoutSC.item("sc02f") := "vV"
enLayoutSC.item("sc011") := "wW"
enLayoutSC.item("sc02d") := "xX"
enLayoutSC.item("sc015") := "yY"
enLayoutSC.item("sc02c") := "zZ"

ruLayoutSC := ComObjCreate("Scripting.Dictionary")
ruLayoutSC.item("sc029") := "ёЁ" ;vkoem3
ruLayoutSC.item("VK31") := "1!"
ruLayoutSC.item("VK32") := "2"""
ruLayoutSC.item("VK33") := "3№"
ruLayoutSC.item("VK34") := "4`;"
ruLayoutSC.item("VK35") := "5`%"
ruLayoutSC.item("VK36") := "6:"
ruLayoutSC.item("VK37") := "7?"
ruLayoutSC.item("VK38") := "8*"
ruLayoutSC.item("VK39") := "9("
ruLayoutSC.item("VK30") := "0)"
ruLayoutSC.item("sc01a") := "хХ" ;vkoem4
ruLayoutSC.item("sc01b") := "ъЪ" ;vkoem6
ruLayoutSC.item("sc02b") := "\/" ;vkoem5
ruLayoutSC.item("sc027") := "жЖ" ;vkoem1
ruLayoutSC.item("sc028") := "эЭ" ;vkoem7
ruLayoutSC.item("sc033") := "бБ" ;vkoemcomma
ruLayoutSC.item("sc034") := "юЮ" ;vkoemperiod
ruLayoutSC.item("VKBF") := ".`," ;vkoem2
ruLayoutSC.item("sc01e") := "фФ"
ruLayoutSC.item("sc030") := "иИ"
ruLayoutSC.item("sc02e") := "сС"
ruLayoutSC.item("sc020") := "вВ"
ruLayoutSC.item("sc012") := "уУ"
ruLayoutSC.item("sc021") := "аА"
ruLayoutSC.item("sc022") := "пП"
ruLayoutSC.item("sc023") := "рР"
ruLayoutSC.item("sc017") := "шШ"
ruLayoutSC.item("sc024") := "оО"
ruLayoutSC.item("sc025") := "лЛ"
ruLayoutSC.item("sc026") := "дД"
ruLayoutSC.item("sc032") := "ьЬ"
ruLayoutSC.item("sc031") := "тТ"
ruLayoutSC.item("sc018") := "щЩ"
ruLayoutSC.item("sc019") := "зЗ"
ruLayoutSC.item("sc010") := "йЙ"
ruLayoutSC.item("sc013") := "кК"
ruLayoutSC.item("sc01f") := "ыЫ"
ruLayoutSC.item("sc014") := "еЕ"
ruLayoutSC.item("sc016") := "гГ"
ruLayoutSC.item("sc02f") := "мМ"
ruLayoutSC.item("sc011") := "цЦ"
ruLayoutSC.item("sc02d") := "чЧ"
ruLayoutSC.item("sc015") := "нН"
ruLayoutSC.item("sc02c") := "яЯ"

;MapVirtualKey dowsn’t work - so, then we’ll do own lunapark with blackjack & hookers
enLayoutKey := ComObjCreate("Scripting.Dictionary")
enLayoutKey.item("``") := "``~" ;vkoem3
enLayoutKey.item("1") := "1!"
enLayoutKey.item("2") := "2@"
enLayoutKey.item("3") := "3#"
enLayoutKey.item("4") := "4$"
enLayoutKey.item("5") := "5`%"
enLayoutKey.item("6") := "6^"
enLayoutKey.item("7") := "7&"
enLayoutKey.item("8") := "8*"
enLayoutKey.item("9") := "9("
enLayoutKey.item("0") := "0)"
enLayoutKey.item("[") := "[{" ;vkoem4
enLayoutKey.item("]") := "]}" ;vkoem6
enLayoutKey.item("\") := "\|" ;vkoem5
enLayoutKey.item("`;") := "`;:" ;vkoem1
enLayoutKey.item("'") := "'""" ;vkoem7
enLayoutKey.item("`,") := "`,<" ;vkoemcomma
enLayoutKey.item(".") := ".>" ;vkoemperiod
enLayoutKey.item("/") := "/?" ;vkoem2
enLayoutKey.item("a") := "aA"
enLayoutKey.item("b") := "bB"
enLayoutKey.item("c") := "cC"
enLayoutKey.item("d") := "dD"
enLayoutKey.item("e") := "eE"
enLayoutKey.item("f") := "fF"
enLayoutKey.item("g") := "gG"
enLayoutKey.item("h") := "hH"
enLayoutKey.item("i") := "iI"
enLayoutKey.item("j") := "jJ"
enLayoutKey.item("k") := "kK"
;enLayoutKey.item("l") := "lL"
enLayoutKey.item("l") := "lL"
enLayoutKey.item("m") := "mM"
enLayoutKey.item("n") := "nN"
enLayoutKey.item("o") := "oO"
enLayoutKey.item("p") := "pP"
enLayoutKey.item("q") := "qQ"
enLayoutKey.item("r") := "rR"
enLayoutKey.item("s") := "sS"
enLayoutKey.item("t") := "tT"
enLayoutKey.item("u") := "uU"
enLayoutKey.item("v") := "vV"
enLayoutKey.item("w") := "wW"
enLayoutKey.item("x") := "xX"
enLayoutKey.item("y") := "yY"
enLayoutKey.item("z") := "zZ"

ruLayoutKey := ComObjCreate("Scripting.Dictionary")
ruLayoutKey.item("ё") := "ёЁ" ;vkoem3
ruLayoutKey.item("1") := "1!"
ruLayoutKey.item("2") := "2"""
ruLayoutKey.item("3") := "3№"
ruLayoutKey.item("4") := "4`;"
ruLayoutKey.item("5") := "5`%"
ruLayoutKey.item("6") := "6:"
ruLayoutKey.item("7") := "7?"
ruLayoutKey.item("8") := "8*"
ruLayoutKey.item("9") := "9("
ruLayoutKey.item("0") := "0)"
ruLayoutKey.item("х") := "хХ" ;vkoem4
ruLayoutKey.item("ъ") := "ъЪ" ;vkoem6
ruLayoutKey.item("\") := "\/" ;vkoem5
ruLayoutKey.item("ж") := "жЖ" ;vkoem1
ruLayoutKey.item("э") := "эЭ" ;vkoem7
ruLayoutKey.item("б") := "бБ" ;vkoemcomma
ruLayoutKey.item("ю") := "юЮ" ;vkoemperiod
ruLayoutKey.item(".") := ".`," ;vkoem2
ruLayoutKey.item("ф") := "фФ"
ruLayoutKey.item("и") := "иИ"
ruLayoutKey.item("с") := "сС"
ruLayoutKey.item("в") := "вВ"
ruLayoutKey.item("у") := "уУ"
ruLayoutKey.item("а") := "аА"
ruLayoutKey.item("п") := "пП"
ruLayoutKey.item("р") := "рР"
ruLayoutKey.item("ш") := "шШ"
ruLayoutKey.item("о") := "оО"
ruLayoutKey.item("л") := "лЛ"
ruLayoutKey.item("д") := "дД"
ruLayoutKey.item("ь") := "ьЬ"
ruLayoutKey.item("т") := "тТ"
ruLayoutKey.item("щ") := "щЩ"
ruLayoutKey.item("з") := "зЗ"
ruLayoutKey.item("й") := "йЙ"
ruLayoutKey.item("к") := "кК"
ruLayoutKey.item("ы") := "ыЫ"
ruLayoutKey.item("е") := "еЕ"
ruLayoutKey.item("г") := "гГ"
ruLayoutKey.item("м") := "мМ"
ruLayoutKey.item("ц") := "цЦ"
ruLayoutKey.item("ч") := "чЧ"
ruLayoutKey.item("н") := "нН"
ruLayoutKey.item("я") := "яЯ"



miscLayout := ComObjCreate("Scripting.Dictionary")
;miscLayout.item("VK25") := "←" ;left
;miscLayout.item("VK26") := "↑" ;up
;miscLayout.item("VK27") := "→" ;right
;miscLayout.item("VK28") := "↓" ;down
;miscLayout.item("VK20") := " " ;space
miscLayout.item("LEFT") := "←◀" ;left
miscLayout.item("UP") := "↑▲" ;up
miscLayout.item("RIGHT") := "→▶" ;right
miscLayout.item("DOWN") := "↓▼" ;down
miscLayout.item("SPACE") := " " ;space
miscLayout.item("VKBD") := "-_" ;vkoemminus
miscLayout.item("VKBB") := "=+" ;vkoemplus


;Define global layout types
enLayout := enLayoutSC
ruLayout := ruLayoutSC



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
    global miscLayout
    keyStr :=

    ;TODO: solve different layouts problem
    if (kl == KeyboardLayout_EN) {
    	keyStr := enLayout.item(vk)
    } else if (kl == KeyboardLayout_RU) {
    	keyStr := ruLayout.item(vk)
    } else {
    	msgBox, TypographicHotkeys: Special keys for layout %kl% isn’t supported. Please, contribute https://github.com/dfcreative/windows_typographic_hotkeys
    }

    if (!keyStr) {
        keyStr := miscLayout.item(vk)
    }

    ;msgbox, -%vk%-%keyStr%

    if (shift) {
		return SubStr(keyStr, 0, 1)
	} else {
		return SubStr(keyStr, 1, 1)
	}
}