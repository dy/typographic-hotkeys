;≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡ Typograf is a script that corrects typography of selected text

;TODO:
; define language
; grammatic modules
; combos change


punct := "\s\.,;:\(\)-–—_\?\!\…" ;punctuation after word
quo := "\""\'«»‘’‚“”„"
pre := "(||||||)"
en := "a-zA-Z"
ru := "а-яА-Я"
num := "0-9" ;TODO:add fractions
math := "\+\-\*\/\\"
currency := "$€¥Ħ₤£⃏"
all := en.ru.num.punct.math.currency
word := "\w"

;======================================================================== CLEAN MISTAKES
clean := ComObjCreate("Scripting.Dictionary")
clean.item("") := ""
clean.item("\s{2,}") := " "
clean.item("\t+") := " "
clean.item("([\w" . quo . num . "]+)[\s\t]+([" . punct . "]+)") := "$1$2"  ;delete spaces before punctuation

;===================================================================================== TYPOGRAPHIC SYMBOLS
typography := ComObjCreate("Scripting.Dictionary")
typography.item("") := ""
typography.item("\+\-") := "±"
typography.item("\-\+") := "∓"
typography.item("(\w+)\s?гр(ад(уса|усов|ec)?)?") := "$1°"
;typography.item("([".num."]+)[""]([".ru."]+)[""]") := "$1«$2„$3“$4»"
typography.item("""(.*)""" ) := "«$1»"


;=================================================================================== ORPHOGRAPHY
orphography := ComObjCreate("Scripting.Dictionary")
orphography.item("(\w+) а ") := "$1, а "
orphography.item("(\w+) но  ") := "$1, но "

orphography.item(" из\s?за ") := " из-за "
orphography.item(" из\s?под ") := " из-под "
orphography.item(" по\s?над ") := " по-над "
orphography.item(" по\s?за ") := " по-за "

orphography.item(" ей\s?богу") := " ей-богу"
orphography.item(" ей\s?же\s?ей") := " ей-же-ей"
orphography.item(" о\s?го\s?го") := " о-го-го"
orphography.item(" ха\s?ха\s?ха") := " ха-ха-ха"
orphography.item(" ха\s?ха") := " ха-ха"
orphography.item(" ой\s?ой") := " ой-ой"
orphography.item(" ой\s?ой\s?ой") := " ой-ой-ой"
orphography.item(" цып\s?цып") := "цып-цып"
orphography.item(" цып\s?цып\s?цып") := "цып-цып-цып"
orphography.item(" цып\s?цып\s?цып\s?цып") := "цып-цып-цып-цып"
orphography.item(" цып\s?цып\s?цып\s?цып\s?цып") := "цып-цып-цып-цып-цып"
orphography.item(" динь\s?динь") := "динь-динь"
orphography.item(" дин\s?дон") := "дин-дон"
orphography.item(" динь\s?динь\s?динь") := "динь-динь-динь"

orphography.item(" кое".punct) := ""
orphography.item(" кой".punct) := ""
orphography.item(" ка".punct) := ""
orphography.item(" либо".punct) := ""
orphography.item(" нибудь".punct) := ""
orphography.item(" то".punct) := ""
orphography.item(" тка".punct) := ""
orphography.item(" с".punct) := ""
orphography.item(" де".punct) := ""
;TODO: кое-, кой-, -ка, -либо, -нибудь, -то, -тка, -с, -де

;===================================================================================== PUNCTUATION
punctuation := ComObjCreate("Scripting.Dictionary")

punctuation.item("") := "" ;first replacement didnt work. It's a bug of autohotkey
punctuation.item("([\w,]+)\s-{1,4}\s?") := "$1 — "

;TODO: nobr's





;==================================================================================== Main typographer
typograf(text){
	global typography
	global orphography
	global clean
	;global syntax
	global punctuation

	text := applyRules(text, clean)
	text := applyRules(text, typography)
	text := applyRules(text, punctuation)
	text := applyRules(text, orphography)

	return text
}

applyRules(text, rules){
	keys := rules.keys() ;Keys() ignores first element
	length := keys.maxIndex()
	;msgbox, in %text%
	Loop, %length%{
		key := keys[a_index]
		repl := rules.item(keys[a_index])
		;msgbox, "%key%" → "%repl%"
		text := RegExReplace(text, key, repl)
	}	
	;msgbox, out %text%
	return text
}