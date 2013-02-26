;≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡ Groups of alternatives of symbols.

groups := ComObjCreate("Scripting.Dictionary") ;basic dictionary of symbol-groups by keys of letters 

;================================== Cross keyboard keys
groups.item("``") := "``'"
groups.item("1") := "1¹"
groups.item("2") := "2²"
groups.item("3") := "3³"
groups.item("4") := "4⁴"
groups.item("5") := "5⁵"
groups.item("6") := "6⁶"
groups.item("7") := "7⁷"
groups.item("8") := "8⁸∞"
groups.item("9") := "9⁹"
groups.item("nil") := "0⁰"
groups.item("0") := "0⁰"
groups.item("-") := "-–—"
groups.item("=") := "=≠≡"
groups.item("~") := "~˜∽≈"
groups.item("!") := "`!¡"
groups.item("@") := ""
groups.item("#") := ""
groups.item("$") := "€¥₤⃏₮¢£"
groups.item("^") := "^ˆ"
groups.item("&") := "&∧∨"
groups.item("*") := "*∙×"
groups.item("(") := "([{"
groups.item(")") := ")]}"
groups.item("_") := "_"
groups.item("+") := "+±"
groups.item("№") := ""
groups.item("%") := "%‰‱"
groups.item(":") := ":;"
groups.item(".") := ""
groups.item("'") := """'“”„‘’‚«»"
groups.item("<") := "<>"
groups.item("|") := "|\/"

;================================== En keyboard
groups.item("a") := "aàáâãäåāăąæª"
groups.item("b") := "b"
groups.item("c") := "c©"
groups.item("d") := "d"
groups.item("e") := "e"
groups.item("f") := "f"
groups.item("g") := "g" 
groups.item("h") := "h" 
groups.item("i") := "i" 
groups.item("j") := "j" 
groups.item("k") := "k" 
groups.item("l") := "l" 
groups.item("m") := "m"
groups.item("n") := "ñňńǹņ"
groups.item("o") := "oø°"
groups.item("p") := "p"
groups.item("q") := "q" 
groups.item("r") := "r" 
groups.item("s") := "s" 
groups.item("t") := "t" 
groups.item("u") := "u" 
groups.item("v") := "v" 
groups.item("w") := "w" 
groups.item("x") := "x" 
groups.item("y") := "y" 
groups.item("z") := "z" 

groups.item("A") := "A" 
groups.item("B") := "B" 
groups.item("C") := "C" 
groups.item("D") := "D" 
groups.item("E") := "E" 
groups.item("F") := "F" 
groups.item("G") := "G" 
groups.item("H") := "H" 
groups.item("I") := "I" 
groups.item("J") := "J" 
groups.item("K") := "K" 
groups.item("L") := "L" 
groups.item("M") := "M" 
groups.item("N") := "N" 
groups.item("O") := "O" 
groups.item("P") := "P" 
groups.item("Q") := "Q" 
groups.item("R") := "R" 
groups.item("S") := "S" 
groups.item("T") := "T" 
groups.item("U") := "U" 
groups.item("V") := "V" 
groups.item("W") := "W" 
groups.item("X") := "X" 
groups.item("Y") := "Y" 
groups.item("Z") := "Z" 

;================================== Cyr keyboard
groups.item("а") := "а" 
groups.item("б") := "б"
groups.item("в") := "в" 
groups.item("г") := "г" 
groups.item("д") := "д" 
groups.item("е") := "е" 
groups.item("ё") := "ё" 
groups.item("ж") := "ж"
groups.item("з") := "з" 
groups.item("и") := "и" 
groups.item("й") := "й" 
groups.item("к") := "к" 
groups.item("л") := "л" 
groups.item("м") := "м" 
groups.item("н") := "н" 
groups.item("о") := "о" 
groups.item("п") := "п" 
groups.item("р") := "р" 
groups.item("с") := "с" 
groups.item("т") := "т" 
groups.item("у") := "у" 
groups.item("ф") := "фfe" 
groups.item("х") := "х" 
groups.item("ц") := "ц" 
groups.item("ч") := "ч" 
groups.item("ш") := "ш" 
groups.item("щ") := "щ" 
groups.item("ъ") := "ъ" 
groups.item("ы") := "ы" 
groups.item("ь") := "ь" 
groups.item("э") := "э" 
groups.item("ю") := "ю" 
groups.item("я") := "я" 

groups.item("А") := "А" 
groups.item("Б") := "Б" 
groups.item("В") := "В" 
groups.item("Г") := "Г" 
groups.item("Д") := "Д" 
groups.item("Е") := "Е" 
groups.item("Ё") := "Ё" 
groups.item("Ж") := "Ж" 
groups.item("З") := "З" 
groups.item("И") := "И" 
groups.item("Й") := "Й" 
groups.item("К") := "К" 
groups.item("Л") := "Л" 
groups.item("М") := "М" 
groups.item("Н") := "Н" 
groups.item("О") := "О" 
groups.item("П") := "П" 
groups.item("Р") := "Р" 
groups.item("С") := "С" 
groups.item("Т") := "Т" 
groups.item("У") := "У" 
groups.item("Ф") := "Ф" 
groups.item("Х") := "Х" 
groups.item("Ц") := "Ц" 
groups.item("Ч") := "Ч" 
groups.item("Ш") := "Ш" 
groups.item("Щ") := "Щ" 
groups.item("Ъ") := "Ъ" 
groups.item("Ы") := "Ы" 
groups.item("Ь") := "Ь" 
groups.item("Э") := "Э" 
groups.item("Ю") := "Ю" 
groups.item("Я") := "Я" 


;================================== Other associations
;------------------------Diacritics
groups.item("¨") := "¨¸´"




;------------------------Phonetics

;------------------------Arrows


;------------------------Shapes



;------------------------Symbols





;------------------------Punctuation





;------------------------Math





;------------------------Numbers





;------------------------




;=================================Handlers
;---------------------------return description of character
getCharDesc(symbol){
}
;---------------------return full group
getGroup(groupKey){
	global groups
	return groups.item(groupKey)
}

;Returns Nth element of Mth group
getGroupMember(groupKey, number){
	global groups
	groupStr := groups.item(groupKey)
	groupLen := strLen(groupStr)
	char := subStr(groupStr, Mod(number+1, groupLen), 1)
	return char
}