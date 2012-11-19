;≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡ Groups of alternatives of symbols.

groups := ComObjCreate("Scripting.Dictionary") ;basic dictionary of symbol-groups by keys of letters 
charReferences := ComObjCreate("Scripting.Dictionary") ;reference on every character

;================================== Cross keyboard keys

groups.item("``") := "``'"
charReferences.item("``") := "``"


groups.item("1") := "1¹"
charReferences.item("1") := "1"
charReferences.item("¹") := "1"

groups.item("2") := "2²"
charReferences.item("2") := "2"
charReferences.item("²") := "2"

groups.item("3") := "3³"
charReferences.item("3") := "3"

groups.item("4") := "4⁴"
charReferences.item("4") := ""

groups.item("5") := "5⁵"
charReferences.item("5") := ""

groups.item("6") := "6⁶"
charReferences.item("6") := ""

groups.item("7") := "7⁷"
charReferences.item("7") := ""

groups.item("8") := "8⁸"
charReferences.item("8") := "8"

groups.item("9") := "9⁹"
charReferences.item("9") := "9"

groups.item("nil") := "0⁰"
groups.item("0") := "0⁰"
charReferences.item("0") := "nil"
charReferences.item("⁰") := "nil, Sup 0"

groups.item("-") := "-–—"
charReferences.item("-") := "-, Hyphen"
charReferences.item("–") := "-, En dash"
charReferences.item("—") := "-, Em dash"
charReferences.item("-") := "-, Soft hyphen"
charReferences.item("-") := "-, Minus"

groups.item("=") := "=≠≡"
charReferences.item("=") := "="
charReferences.item("≠") := "=, Not equal"
charReferences.item("≡") := "=, Equivalent"
charReferences.item("=") := "=, Short equal"
charReferences.item("=") := "="

groups.item("~") := "~˜∽≈"
charReferences.item("~") := "~"
charReferences.item("˜") := "~, Diacr"
charReferences.item("≈") := "~, Approx"
charReferences.item("~") := "~, Reversed tilde"

groups.item("!") := "!¡"
charReferences.item("!") := "!"
charReferences.item("¡") := "!"

charReferences.item("?") := "!"

groups.item("@") := ""
charReferences.item("@") := ""

groups.item("#") := ""
charReferences.item("#") := ""

groups.item("$") := "€¥₤⃏₮¢£"
charReferences.item("$") := "$, Dollar"
charReferences.item("€") := "$, Euro"
charReferences.item("¥") := "$, Yen"
charReferences.item("₮") := "$, "
charReferences.item("⃏") := "$, Roub"
charReferences.item("₤") := "$, Pound"
charReferences.item("£") := "$, Lira"
charReferences.item("₣") := "$, Frank"

groups.item("^") := "^ˆ"
charReferences.item("^") := "^"

groups.item("&") := "&∧∨"
charReferences.item("&") := "&"
charReferences.item("∧") := "&, And"
charReferences.item("∨") := "&, Or"

groups.item("*") := "*∙×"
charReferences.item("*") := "*, Asterisk"
charReferences.item("⁂") := "*, Asterism"
charReferences.item("") := "*, 2 Asterisks"
charReferences.item("×") := "*, Times operator"
charReferences.item("∙") := "*, Dot operator"

groups.item("(") := ""
charReferences.item("(") := ""
charReferences.item("[") := ""
charReferences.item("{") := ""

groups.item(")") := ""
charReferences.item(")") := ""
charReferences.item("]") := ""
charReferences.item("}") := ""

groups.item("_") := "_"
charReferences.item("_") := "_"

groups.item("+") := ""
charReferences.item("+") := ""

groups.item("№") := ""
charReferences.item("№") := ""

groups.item("%") := "%‰‱"
charReferences.item("%") := "%, percent"
charReferences.item("‰") := "%, permil"
charReferences.item("‱") := "%, permiil"

groups.item(":") := ":;"
charReferences.item(":") := ":"
charReferences.item(";") := ":"

groups.item(".") := ""
charReferences.item(".") := "."
charReferences.item(",") := ","

groups.item("'") := """'“”„‘’‚«»"
charReferences.item("""") := "'"
charReferences.item("'") := "'"

groups.item("<") := "<>"
charReferences.item("<") := "<"
charReferences.item(">") := "<"

groups.item("|") := "|\/"
charReferences.item("/") := "|"
charReferences.item("\") := "|"
charReferences.item("|") := "|"


;================================== En keyboard

groups.item("a") := "aªàáâãäåāăąæ@"
charReferences.item("a") := "a"
charReferences.item("ª") := "a"
charReferences.item("à") := "a"
charReferences.item("á") := "a"
charReferences.item("â") := "a"
charReferences.item("ã") := "a"
charReferences.item("ä") := "a"
charReferences.item("å") := "a"
charReferences.item("ā") := "a"
charReferences.item("ă") := "a"
charReferences.item("ą") := "a"
charReferences.item("æ") := "a"
charReferences.item("@") := "a"

groups.item("b") := "b"
charReferences.item("b") := "b"

groups.item("c") := "c" 
charReferences.item("c") := "c"

groups.item("d") := "d" 
charReferences.item("d") := "d"

groups.item("e") := "e" 
charReferences.item("e") := "e"

groups.item("f") := "f" 
charReferences.item("f") := "f"

groups.item("g") := "g" charReferences.item("g") := "g"
groups.item("h") := "h" charReferences.item("h") := "h"
groups.item("i") := "i" charReferences.item("i") := "i"
groups.item("j") := "j" charReferences.item("j") := "j"
groups.item("k") := "k" charReferences.item("k") := "k"
groups.item("l") := "l" charReferences.item("l") := "l"
groups.item("m") := "m" charReferences.item("m") := "m"

groups.item("n") := "ñňńǹņ" 
charReferences.item("n") := "n"

groups.item("o") := "oø°" 
charReferences.item("°") := "o, degree"

groups.item("p") := "p" charReferences.item("p") := "p"
groups.item("q") := "q" charReferences.item("q") := "q"
groups.item("r") := "r" charReferences.item("r") := "r"
groups.item("s") := "s" charReferences.item("s") := "s"
groups.item("t") := "t" charReferences.item("t") := "t"
groups.item("u") := "u" charReferences.item("u") := "u"
groups.item("v") := "v" charReferences.item("v") := "v"
groups.item("w") := "w" charReferences.item("w") := "w"
groups.item("x") := "x" charReferences.item("x") := "x"
groups.item("y") := "y" charReferences.item("y") := "y"
groups.item("z") := "z" charReferences.item("z") := "z"

groups.item("A") := "A" charReferences.item("A") := "A"
groups.item("B") := "B" charReferences.item("B") := "B"
groups.item("C") := "C" charReferences.item("C") := "C"
groups.item("D") := "D" charReferences.item("D") := "D"
groups.item("E") := "E" charReferences.item("E") := "E"
groups.item("F") := "F" charReferences.item("F") := "F"
groups.item("G") := "G" charReferences.item("G") := "G"
groups.item("H") := "H" charReferences.item("H") := "H"
groups.item("I") := "I" charReferences.item("I") := "I"
groups.item("J") := "J" charReferences.item("J") := "J"
groups.item("K") := "K" charReferences.item("K") := "K"
groups.item("L") := "L" charReferences.item("L") := "L"
groups.item("M") := "M" charReferences.item("M") := "M"
groups.item("N") := "N" charReferences.item("N") := "N"
groups.item("O") := "O" charReferences.item("O") := "O"
groups.item("P") := "P" charReferences.item("P") := "P"
groups.item("Q") := "Q" charReferences.item("Q") := "Q"
groups.item("R") := "R" charReferences.item("R") := "R"
groups.item("S") := "S" charReferences.item("S") := "S"
groups.item("T") := "T" charReferences.item("T") := "T"
groups.item("U") := "U" charReferences.item("U") := "U"
groups.item("V") := "V" charReferences.item("V") := "V"
groups.item("W") := "W" charReferences.item("W") := "W"
groups.item("X") := "X" charReferences.item("X") := "X"
groups.item("Y") := "Y" charReferences.item("Y") := "Y"
groups.item("Z") := "Z" charReferences.item("Z") := "Z"

;================================== Cyr keyboard
groups.item("") := ""
groups.item("а") := "а" charReferences.item("а") := "а"
groups.item("б") := "б" charReferences.item("б") := "б"
groups.item("в") := "в" charReferences.item("в") := "в"
groups.item("г") := "г" charReferences.item("г") := "г"
groups.item("д") := "д" charReferences.item("д") := "д"
groups.item("е") := "е" charReferences.item("е") := "е"
groups.item("ё") := "ё" charReferences.item("ё") := "ё"
groups.item("ж") := "ж" charReferences.item("ж") := "ж"
groups.item("з") := "з" charReferences.item("з") := "з"
groups.item("и") := "и" charReferences.item("и") := "и"
groups.item("й") := "й" charReferences.item("й") := "й"
groups.item("к") := "к" charReferences.item("к") := "к"
groups.item("л") := "л" charReferences.item("л") := "л"
groups.item("м") := "м" charReferences.item("м") := "м"
groups.item("н") := "н" charReferences.item("н") := "н"
groups.item("о") := "о" charReferences.item("о") := "о"
groups.item("п") := "п" charReferences.item("п") := "п"
groups.item("р") := "р" charReferences.item("р") := "р"
groups.item("с") := "с" charReferences.item("с") := "с"
groups.item("т") := "т" charReferences.item("т") := "т"
groups.item("у") := "у" charReferences.item("у") := "у"
groups.item("ф") := "ф" charReferences.item("ф") := "ф"
groups.item("х") := "х" charReferences.item("х") := "х"
groups.item("ц") := "ц" charReferences.item("ц") := "ц"
groups.item("ч") := "ч" charReferences.item("ч") := "ч"
groups.item("ш") := "ш" charReferences.item("ш") := "ш"
groups.item("щ") := "щ" charReferences.item("щ") := "щ"
groups.item("ъ") := "ъ" charReferences.item("ъ") := "ъ"
groups.item("ы") := "ы" charReferences.item("ы") := "ы"
groups.item("ь") := "ь" charReferences.item("ь") := "ь"
groups.item("э") := "э" charReferences.item("э") := "э"
groups.item("ю") := "ю" charReferences.item("ю") := "ю"
groups.item("я") := "я" charReferences.item("я") := "я"

groups.item("А") := "А" charReferences.item("А") := "А"
groups.item("Б") := "Б" charReferences.item("Б") := "Б"
groups.item("В") := "В" charReferences.item("В") := "В"
groups.item("Г") := "Г" charReferences.item("Г") := "Г"
groups.item("Д") := "Д" charReferences.item("Д") := "Д"
groups.item("Е") := "Е" charReferences.item("Е") := "Е"
groups.item("Ё") := "Ё" charReferences.item("Ё") := "Ё"
groups.item("Ж") := "Ж" charReferences.item("Ж") := "Ж"
groups.item("З") := "З" charReferences.item("З") := "З"
groups.item("И") := "И" charReferences.item("И") := "И"
groups.item("Й") := "Й" charReferences.item("Й") := "Й"
groups.item("К") := "К" charReferences.item("К") := "К"
groups.item("Л") := "Л" charReferences.item("Л") := "Л"
groups.item("М") := "М" charReferences.item("М") := "М"
groups.item("Н") := "Н" charReferences.item("Н") := "Н"
groups.item("О") := "О" charReferences.item("О") := "О"
groups.item("П") := "П" charReferences.item("П") := "П"
groups.item("Р") := "Р" charReferences.item("Р") := "Р"
groups.item("С") := "С" charReferences.item("С") := "С"
groups.item("Т") := "Т" charReferences.item("Т") := "Т"
groups.item("У") := "У" charReferences.item("У") := "У"
groups.item("Ф") := "Ф" charReferences.item("Ф") := "Ф"
groups.item("Х") := "Х" charReferences.item("Х") := "Х"
groups.item("Ц") := "Ц" charReferences.item("Ц") := "Ц"
groups.item("Ч") := "Ч" charReferences.item("Ч") := "Ч"
groups.item("Ш") := "Ш" charReferences.item("Ш") := "Ш"
groups.item("Щ") := "Щ" charReferences.item("Щ") := "Щ"
groups.item("Ъ") := "Ъ" charReferences.item("Ъ") := "Ъ"
groups.item("Ы") := "Ы" charReferences.item("Ы") := "Ы"
groups.item("Ь") := "Ь" charReferences.item("Ь") := "Ь"
groups.item("Э") := "Э" charReferences.item("Э") := "Э"
groups.item("Ю") := "Ю" charReferences.item("Ю") := "Ю"
groups.item("Я") := "Я" charReferences.item("Я") := "Я"


;================================== Other associations
;------------------------Arrows


;------------------------Shapes



;------------------------Symbols





;------------------------Punctuation





;------------------------Math





;------------------------Numbers





;------------------------




;=================================Handlers
;-----------------------get reference of character
getCharRef(symbol){
	global charReferences
	ref := charReferences.item(symbol . "")
    if (ref){
    	reference := {}
    	Loop, parse, ref, `, 
    		if (a_index == 1){
    			reference["group"] := A_LoopField . ""
    		} else {
    			reference["description"] := A_LoopField
    		}
        return reference
    }
    return 0
}
;---------------------------return description of character
getCharDesc(symbol){
	ref := getCharRef(symbol)
	if (ref){ ;ref found
		group := ref.group
		desc := ref.description
		if (group) {
			return desc
		}
	}
	return false
}
;-------------------return group of character
getCharGroup(symbol){
	ref := getCharRef(symbol)
	if (ref){ ;ref found
		group := ref.group
		desc := ref.description
		if (group) {
			return group
		}
	}
	return false
}
;---------------------return full group
getGroupSet(groupKey){
	global groups
	return groups.item(groupKey)
}