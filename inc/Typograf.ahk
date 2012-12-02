;≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡ Typograf is a script that corrects typography of selected text

;TODO:
; define language
; grammatic modules
; compose combos
; dot inside quotess
; make soft positive assertions (?= ) insteadof ()
; make nongreedy cases
; н-да

;missed . at the end of sentences
;recognizing of lists

;ending spaces cut – is it goo or bad?


punct := "\.\,\;\:\_\?\!\¿\؟\‽\…\&\\" ;punctuation after word
space := "     \t" ;all kind of spaces: en, em, punct, simple, nobr
newline := "\n\r\`v\`f"
dash := "–—−" ;not hyphen!
hyphen := "-"
lquo := "«‘“‚„〞‹"
rquo := "»’”〝›"
quo := rquo . lquo . "\""\'"
lbrace := "\(\{\["
rbrace := "\)\]\}"
brace := lbrace . rbrace
pre := "(||||||)"
en := "a-zA-Z"
ru := "а-яА-Я"
num := "0-9" ;TODO:add fractions
romNum := "IVML"
math := "\+\-\*\/\%±≠≡"
currency := "$€¥Ħ₤£⃏"
word := "\w" . ru . en
esos := rquo . rbrace ;ending symbol of sentence
bsos := "¿" . hyphen . dash . lbrace . lquo ;beginning symbol of sentence

;--------------prepositions
preposition := "а-ля|без|без ведома|безо|благодаря|близ|близко от|в|в виде|в зависимости от|в интересах|в качестве|в лице|в отличие от|в отношении|в пользу|в преддверии|в продолжение|в результате|в роли|в связи с|в силу|в случае|в соответствии с|в течение|в целях|вблизи|ввиду|вглубь|вдоль|вдоль по|взамен|включая|вместо|вне|внизу|внутри|внутрь|во|во имя|возле|вокруг|вопреки|впереди|впредь до|вразрез|вроде|вслед|вслед за|вследствие|для|для-ради|до|за|за вычетом|за исключением|за счёт|заместо|из|из-за|из-под|изнутри|изо|исходя из|к|ко|кроме|кругом|лицом к лицу с|меж|между|мимо|на|на благо|на виду у|на глазах у|на предмет|наверху|навстречу|над|надо|назад|накануне|наперекор|наперерез|наподобие|напротив|наряду с|насупротив|насчёт|начиная с|не без|не в|не за|не считая|невзирая на|недалеко от|независимо от|несмотря на|ниже|о|об|обо|обок|около|окромя|округ|опосля|от|от имени|от лица|относительно|ото|перед|передо|по|по линии|по мере|по направлению к|по отношению к|по поводу|по причине|по случаю|по сравнению с|по-за|по-над|по-под|поблизости от|поверх|под|под видом|под эгидой|подле|подо|подобно|позади|помимо|поперёк|порядка|посередине|посередь|после|посреди|посредине|посредством|пред|предо|прежде|при|при помощи|применительно к|про|против|путём|ради|рядом с|с|с ведома|с помощью|с точки зрения|с целью|сверх|свыше|сзади|сквозь|скрозь|следом за|смотря по|снизу|со|согласно|спустя|среди|средь|сродни|судя по|супротив|через|чрез"

pronoun := "иже|какой-либо|когда|кое-кто|кое-что|кой|кто|кто-либо|многий|мя|насколько|немногий|нешто|никой|ничегошеньки|сё|такой-то|то же|тот-то|чё|чево|чей-либо|чей-нибудь|чей-то|шо|эта|себе|себя|собой|собою|каков|какой|кем|кой|ком|кому|который|кто|нахуя|сколько|чей|чему|что|вы|Вы|мы|он|она|оне|они|оно|ты|я|иной|какой|какой-то|кое-какой|кое-кто|кое-чей|кое-что|кой-какой|кой-кто|кто-либо|кто-нибудь|кто-то|куда-нибудь|некоторый|некто|нечто|что-либо|что-нибудь|что-то|весь|всякий|каждый|любой|сам|самый|этакий|другой|иной|какой|кой|который|кто|что|некем|некого|некому|нечего|нечем|нечему|никакой|никто|ничего|ничей|ничем|ничему|ничто|ваш|её|его|их|ихний|моё|мой|моя|наш|свой|твой|чей|сам|сей|сие|сии|сия|столько|та|таков|такой|то|тот|ту|эдакий|эта|этакий|эти|это|этот|как|каков|какой|который|каков|какой|сам|данный|каждый|некоторый|самый|Христов|весь|всякий|некий|другой|какой|какой-нибудь|никакой|сякой|такой|попугаячий"



;======================================================================== CLEAN MISTAKES
clean := ComObjCreate("Scripting.Dictionary")
clean.item("") := ""
clean.item("[" . space . "]{2,}") := " "
clean.item("\t+") := " "
clean.item("([" . word . quo . num . "]+)[\s\t]+([" . punct . "]+)") := "$1$2"  ;delete spaces before punctuation
clean.item("([" . word . "]+)([" . punct . "]+)(?=[" . word . quo . num . "]+)") := "$1$2 "  ;add spaces after punctuation
clean.item("-{2,6}") := "—" ;clear simple double-dashes
clean.item("([" . word . esos . "]+)[" . space . "]+([" . punct . "]+)") := "$1$2" ;clean spaces before punct
clean.item("([" . lquo . lbrace . "])[" . space . "]+") := "$1" ;clean spaces between leftquote ∨ leftbrace ∧ word
clean.item("[" . space . "]+([" . rquo . rbrace . "])") := "$1" ;clean space before brace & quo

cleanRepeatedWords(str){
delim := "    `n`r"
newline := "`n`r`v`f"
punct := ".,;:_?!¿؟‽…""'«‘“‚„〞‹»’”""'〝›–—({[)}]" ;punctuation after word

result := ""
prevWord := ""
currWord := ""
charAmt := 0

lastPos := 1
pos := 1
loopDelimiter := ""
delLen := 0
prevWordLen := 0

	Loop, Parse, str, %delim%
	{	
		if (!A_Loopfield) {
			continue ;strange behaviour when no words between
		}

		prevword := LTrim(prevword, newline)
		StringLower, prevword, prevword
		prevWordLen := strlen(prevWord)

		;TODO there's no A_LoopDelimiter, so find it…
		pos := InStr(str, A_Loopfield, false, lastPos + prevWordLen)
		delLen := pos - lastpos - prevWordLen
		loopDelimiter := SubStr(str, lastpos + prevWordLen, delLen)
		;msgbox, %pos%:"%A_Loopfield%" %lastPos%:"%loopDelimiter%" (len %delLen%)
		lastPos := pos

		currWord := RTrim(A_loopfield, punct)

		;msgbox curr:"%currword%" prev:"%prevword%"

		if (currword == prevword) { ;add punctuation and other if it was in a_loopfield
			charAmt := StrLen(A_loopfield) - StrLen(currWord)
			StringRight, currWord, A_loopfield, %charAmt%
			result .= currWord 
		} else {
			result .= loopDelimiter . A_loopfield
		}
		prevWord := A_loopfield
	}

return result
}

;===================================================================================== TYPOGRAPHIC SYMBOLS
typography := ComObjCreate("Scripting.Dictionary")
typography.item("") := ""
typography.item("i)\([cс]\)") := "©"
typography.item("i)\(r\)") := "®"
typography.item("i)\(p\)") := "℗"
typography.item("i)\(tm\)") := "™"
typography.item("i)\(sm\)") := "℠"

typography.item("(\w+)\s?гр(ад(уса|усов|ec)?)?") := "$1°" ;degrees

typography.item("([" . word . esos . "])([" . dash . "])([" . word . bsos . "])") := "$1 $2 $3" ;wrap dashes with thin spaces

;Simple quotes
typography.item("([" . space . newline . """]|^)""(?=[" . ru . "])" ) := "$1«"
typography.item("([" . space . newline . """]|^)""(?=[" . en . "])" ) := "$1“"
typography.item("([" . ru . "])""(?=[" . space . newline . punct . """])" ) := "$1»"
typography.item("([" . en . "])""(?=[" . space . newline . punct . """])" ) := "$1”"

;Simple quotes side effect cleaner
typography.item("»""") := "»»"
typography.item("”""") := "””"
typography.item("""«") := "««"
typography.item("""“") := "““"

;---------------inside-quotes-rule
makeNestedQuotes(text){
	global newline
	ruNestedQuotesRegex := "(«[^«" . newline . "]*)(«([^«»]*)»)(?=[^»" . newline . "]*»)"
	enNestedQuotesRegex := "(“[^“" . newline . "]*)(“([^“”]*)”)(?=[^”" . newline . "]*”)"
	while(RegExMatch(text, ruNestedQuotesRegex))
	{
		text := RegExReplace(text, ruNestedQuotesRegex, "$1„$3“")
	}
	while(RegExMatch(text, enNestedQuotesRegex))
	{
		text := RegExReplace(text, enNestedQuotesRegex, "$1‘$3’")
	}
	return text
}

;TODO: dot inside quotes

enShortener := "t|d|s|re"
typography.item("(\b[" . word . "]+)'(?=" . enShortener . "[\b])") := "$1’$2" ;don't apostrophe change to correct

typography.item("§([" . num . romNum . "]+)") := "§ $1"
typography.item("№([" . num . word . punct . "]+)") := "№ $1"

;=================================================================================== ORPHOGRAPHY
;TODO: handle correctly prepositions
;handle 
orphography := ComObjCreate("Scripting.Dictionary")
orphography.item("(\w+) а ") := "$1, а "
orphography.item("(\w+) но  ") := "$1, но "

orphography.item("i)([" . space . newline . "]?)(из)[" . space . "]?за([" . space . punct . "])") := "$1$2-за$3"
orphography.item("i)([" . space . newline . "]?)(из)[" . space . "]?под([" . space . punct . "])") := "$1$2-под$3"
orphography.item("i)([" . space . newline . "]?)(по)[" . space . "]?над([" . space . punct . "])") := "$1$2-над$3"
orphography.item("i)([" . space . newline . "]?)(по)[" . space . "]?за([" . space . punct . "])") := "$1$2-за$3"
orphography.item("i)([" . space . newline . "]?)(по)[" . space . "]?за([" . space . punct . "])") := "$1$2-за$3"
orphography.item("i)([" . space . newline . "]?)(вс)[её][" . space . "]?таки([" . space . punct . "])") := "$1$2ё-таки$3"

orphography.item("[" . space . "]ей[" . space . "]?богу[" . space . "]") := " ей-богу "
orphography.item("[" . space . "]ей[" . space . "]?же[" . space . "]?ей[" . space . "]") := " ей-же-ей "
orphography.item("[" . space . "]о[" . space . "]?го[" . space . "]?го[" . space . "]") := " о-го-го "
orphography.item("[" . space . "]ха[" . space . "]?ха[" . space . "]?ха[" . space . "]") := " ха-ха-ха "
orphography.item("[" . space . "]ха[" . space . "]?ха[" . space . "]") := " ха-ха "
orphography.item("[" . space . "]ой[" . space . "]?ой[" . space . "]") := " ой-ой "
orphography.item("[" . space . "]ой[" . space . "]?ой[" . space . "]?ой[" . space . "]") := " ой-ой-ой "
orphography.item("[" . space . "]цып[" . space . "]?цып[" . space . "]") := "цып-цып "
orphography.item("[" . space . "]цып[" . space . "]?цып[" . space . "]?цып[" . space . "]") := "цып-цып-цып "
orphography.item("[" . space . "]цып[" . space . "]?цып[" . space . "]?цып[" . space . "]?цып[" . space . "]") := "цып-цып-цып-цып "
orphography.item("[" . space . "]цып[" . space . "]?цып[" . space . "]?цып[" . space . "]?цып[" . space . "]?цып[" . space . "]") := "цып-цып-цып-цып-цып "
orphography.item("[" . space . "]динь[" . space . "]?динь[" . space . "]") := " динь-динь "
orphography.item("[" . space . "]дин[" . space . "]?дон[" . space . "]") := " дин-дон "
orphography.item("[" . space . "]динь[" . space . "]?динь[" . space . "]?динь[" . space . "]") := " динь-динь-динь "

partnoun := "какой-либо|кое-кто|кое-что|кто-либо|такой-то|тот-то|чей-либо|чей-нибудь|чей-то|какой-то|кое-какой|кое-кто|кое-чей|кое-что|кой-какой|кой-кто|кто-либо|кто-нибудь|кто-то|куда-нибудь|что-либо|что-нибудь|что-то|какой-нибудь"

urparticle := "либо|нибудь|то" ;universal right particle
ulparticle := "кто|что|где|когда|зачем|почему|как|кем|чем|кому|чему|ком|чем|кого|чего|кем|чем|чей|какой|куда"

orphography.item("i)(" . ulparticle . ")[" . space . dash . hyphen . "]*(" . urparticle . ")[" . space . "]") := "$1-$2 "

orphography.item("[" . space . newline . "]такой[" . space . "]?то[" . space . "]") := " такой-то "
orphography.item("[" . space . newline . "]тот[" . space . "]?то[" . space . "]") := " тот-то "
orphography.item("[" . space . newline . "]кое[" . space . "]?какой[" . space . "]") := " кое-какой "
orphography.item("[" . space . newline . "]кое[" . space . "]?кто[" . space . "]") := " кое-кто "
orphography.item("[" . space . newline . "]кое[" . space . "]?чей[" . space . "]") := " кое-чей "
orphography.item("[" . space . newline . "]кое[" . space . "]?чей[" . space . "]") := " кое-куда "
orphography.item("[" . space . newline . "]кое[" . space . "]?что[" . space . "]") := " кое-что "
orphography.item("[" . space . newline . "]кой[" . space . "]?какой[" . space . "]") := " кой-какой "
orphography.item("[" . space . newline . "]кой[" . space . "]?какой[" . space . "]") := " кой-куда "
orphography.item("[" . space . newline . "]кой[" . space . "]?кто[" . space . "]") := " кой-кто "
orphography.item("[" . space . newline . "]давай[" . space . "]?ка[" . space . "]") := " давай-ка "
orphography.item("[" . space . newline . "]ну[" . space . "]?тка[" . space . "]") := " ну-тка "
orphography.item("[" . space . newline . "]да[" . space . "]?с[" . space . "]") := " да-с "

arparticle := "ка|тка|де|кась" ;aux right particle ;TODO: make cyr с handling

orphography.item("([" . word . "]+)[" . space . "]+(" . arparticle . ")([" . space . punct . quo . brace . "]+)") := "$1-$2$3"

alparticle := "кое|кой"

orphography.item("i)([" . space . newline . "]+)(" . alparticle . ")[" . space . "]{1,4}(" . ulparticle . "+)") := "$1$2-$3"

orphography.item("(\b[" . num . "]+[" . space . dash . ru . hyphen . "]+[" . num . "]+[" . space . ru . hyphen . "]?)г.") := "$1гг."



;===================================================================================== PUNCTUATION
punctuation := ComObjCreate("Scripting.Dictionary")

punctuation.item("") := "" ;first replacement didnt work. It's a bug of autohotkey
punctuation.item("([" . word . punct . "]+)[" . space . "][" . hyphen . "]{1,4}[" . space . "]?") := "$1 — "
punctuation.item("([" . word . punct . "]+)\.[" . space . "]([" . ru . "]+)") := "$1. $T{2}" ;make sentences from Capital

punctuation.item("([^\,])([" . space . "]+)(а|но)[" . space . punct . "]") := "$1, $3 "

punctuation.item("\.\.\.") := "…"
punctuation.item("([" . word . "]+)\.\.") := "$1." ;remove doubles: so bad because of i'm lazy to make any cycles
punctuation.item("\,\,+") := ","
punctuation.item("\;+") := ";"
punctuation.item("([^\?])\?\?([^\?])") := "$1?$2"
punctuation.item("([^\!])\!\!([^\!])") := "$1!$2" 

punctuation.item("[" . hyphen . "][" . space . "]([" . word . "])") := "— $1" ;start dialogue sentence with dash

;dot at the end of sentence
;TODO: ignorable parts like pre, code etc


;=======================================TODO: NOBRS
nobrs := ComObjCreate("Scripting.Dictionary")
nobrs.item("") := ""
nobrs.item("") := ""


;==================================TODO: hyphens



;===================================== Math & units & currencies
mathRules := ComObjCreate("Scripting.Dictionary")

mathRules.item("") := ""
mathRules.item("\b1\/4\b") := "¼"
mathRules.item("\b1\/2\b") := "½"
mathRules.item("\b1\/3\b") := "⅓"
mathRules.item("\b1\/5\b") := "⅕"
mathRules.item("\b1\/6\b") := "⅙"
mathRules.item("\b1\/7\b") := "⅐"
mathRules.item("\b2\/3\b") := "⅔"
mathRules.item("\b3\/4\b") := "¾"
mathRules.item("\b2\/5\b") := "⅖"
mathRules.item("\b3\/5\b") := "⅗"
mathRules.item("\+\-") := "±"
mathRules.item("\-\+") := "∓"
mathRules.item("([" . space . newline . "]|^)([" . num . "]+)[" . space . "]?([" . punct . "])[" . space . "]?([" . num . "]+)") := "$1$2$3$4" ;Digits make closer
mathRules.item("([" . num . math . "])[" . space . "]%") := "$1%" ;Percent closer
mathRules.item("([" . num . "]+)[" . space . "]?[xх][" . space . "]?([" . num . "]+)") := "$1×$2"
mathRules.item("([" . num . "]+)[" . space . "]?[" . hyphen . "][" . space . "]?([" . num . "]+)") := "$1−$2"
;mathRules.item("") := ""
;mathRules.item("") := ""


pointedCurrencyWord := "руб|долл"
amountWord := "тыс|млн|млрд"
numPatt := "\b[" . num . "]+[\.,]?[" . num . "]*"

mathRules.item("i)(" . numPatt . ")[" . space . "]?(" . amountWord . ")\.?[" . space . "]?(" . pointedCurrencyWord . ")\.?") := "$1 $L2. $L3."
mathRules.item("i)(" . numPatt . ")[" . space . "]?(" . pointedCurrencyWord . ")\.?") := "$1 $L2."

mathRules.item("i)(" . numPatt . ")[" . space . "]?(" . amountWord . ")\.?[" . space . "]?у\.?[" . space . "]?е\.?") := "$1 $L2. у.е."
mathRules.item("i)(" . numPatt . ")[" . space . "]?у\.?[" . space . "]?е\.?") := "$1 у.е."

mathRules.item("i)(" . numPatt . ")[" . space . "]?(" . amountWord . ")\.?[" . space . "]?евро?") := "$1 $L2. евро"
mathRules.item("i)(" . numPatt . ")[" . space . "]?евро?") := "$1 евро"

mathRules.item("i)(" . numPatt . ")[" . space . "]?([" . currency . "])") := "$1 $2"
mathRules.item("i)([" . currency . "])[" . space . "]?(" . numPatt . ")") := "$1$2" ;TODO: this is difference from typograf.ru




;============================================ ACCENTS
accents := ComObjCreate("Scripting.Dictionary")
accents.item("") := ""
accents.item("") := ""


;==================================================================================== Main typographer
typograf(text){
	global typography
	global orphography
	global clean
	;global syntax
	global punctuation
	global mathRules

	text := applyRules(text, clean)
	text := cleanRepeatedWords(text)
	text := applyRules(text, typography)
	text := makeNestedQuotes(text)
	text := applyRules(text, punctuation)
	text := applyRules(text, orphography)
	text := applyRules(text, mathRules)

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