;≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡ Typograf is a script that corrects typography of selected text

rules := ComObjCreate("Scripting.Dictionary")


;===========================================Solaris compose keys
pun := "([\s.,;:\(\)-–—])" ;punctuation after word
pre := "(||||||)"
rules.item("\s{2,}") := " "
rules.item("\t+") := " "
rules.item("(\w+) а ") := "$1, а "
rules.item("(\w+) но  ") := "$1, но "

rules.item(" из\s?за ") := " из-за "
rules.item(" из\s?под ") := " из-под "
rules.item(" по\s?над ") := " по-над "
rules.item(" по\s?за ") := " по-за "

rules.item(" ей\s?богу".pun) := " ей-богу$1"
rules.item(" ей\s?же\s?ей".pun) := " ей-же-ей$1"
rules.item(" о\s?го\s?го".pun) := " о-го-го$1"
rules.item(" ха\s?ха\s?ха".pun) := " ха-ха-ха$1"
rules.item(" ха\s?ха".pun) := " ха-ха$1"
rules.item(" ой\s?ой".pun) := " ой-ой$1"
rules.item(" ой\s?ой\s?ой".pun) := " ой-ой-ой$1"
rules.item(" цып\s?цып".pun) := "цып-цып$1"
rules.item(" цып\s?цып\s?цып".pun) := "цып-цып-цып$1"
rules.item(" цып\s?цып\s?цып\s?цып".pun) := "цып-цып-цып-цып$1"
rules.item(" цып\s?цып\s?цып\s?цып\s?цып".pun) := "цып-цып-цып-цып-цып$1"
rules.item(" динь\s?динь".pun) := "динь-динь$1"
rules.item(" дин\s?дон".pun) := "дин-дон$1"
rules.item(" динь\s?динь\s?динь".pun) := "динь-динь-динь$1"

rules.item(" кое".pun) := ""
rules.item(" кой".pun) := ""
rules.item(" ка".pun) := ""
rules.item(" либо".pun) := ""
rules.item(" нибудь".pun) := ""
rules.item(" то".pun) := ""
rules.item(" тка".pun) := ""
rules.item(" с".pun) := ""
rules.item(" де".pun) := ""
;TODO: кое-, кой-, -ка, -либо, -нибудь, -то, -тка, -с, -де



rules.item("+-") := "±"
rules.item("") := ""
rules.item("") := ""
rules.item("") := ""
rules.item("") := ""
rules.item("") := ""
rules.item("") := ""


;================================== Correct typographics of text
typograf(text){
	global rules
	keys := rules.keys()
	length := keys.maxIndex()
	Loop, %length%{
		key := keys[a_index]
		repl := rules.item(keys[a_index])
		RegExReplace(text, key, repl)
	}
	return text
}