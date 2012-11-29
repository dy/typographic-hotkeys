﻿;≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡ Typograf is a script that corrects typography of selected text

;TODO:
; define language
; grammatic modules
; combos change

;missed . at the end of sentences
;recognizing of lists

;ending spaces cut – is it goo or bad?


punct := "\.\,\;\:\_\?\!\¿\؟\‽\…" ;punctuation after word
space := "     \t" ;all kind of spaces: en, em, punct, simple, nobr
newline := "\n"
dash := "–—" ;not hyphen!
hyphen := "-"
lquo := "\""\'«‘“‚„〞‹"
rquo := "»’”\""\'〝›"
quo := rquo . lquo
lbrace := "\(\{\["
rbrace := "\)\]\}"
brace := lbrace . rbrace
pre := "(||||||)"
en := "a-zA-Z"
ru := "а-яА-Я"
num := "0-9" ;TODO:add fractions
math := "\+\-\*\/\\"
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
clean.item("([\w" . quo . num . "]+)[\s\t]+([" . punct . "]+)") := "$1$2"  ;delete spaces before punctuation
clean.item("-{2,6}") := "—" ;clear simple double-dashes
clean.item("([" . word . esos . "]+)[" . space . "]+([" . punct . "]+)") := "$1$2" ;clean spaces before punct
clean.item("([" . lquo . lbrace . "])[" . space . "]+([" . word . "]+)") := "$1$2" ;clean spaces between leftquote ∨ leftbrace ∧ word 

cleanRepeatedWords(str){
delim := "    `n`r"
newline := "`n`r"
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
typography.item("\(c\)") := "©"
typography.item("\(с\)") := "©"
typography.item("\(r\)") := "®"
typography.item("\(p\)") := "℗"
typography.item("\(tm\)") := "™"
typography.item("\(sm\)") := "℠"
typography.item("\+\-") := "±"
typography.item("\-\+") := "∓"

typography.item("(\w+)\s?гр(ад(уса|усов|ec)?)?") := "$1°" ;degrees

typography.item("([" . word . esos . "])([" . dash . "])([" . word . bsos . "])") := "$1 $2 $3" ;wrap dashes with thin spaces
typography.item("\""([^" . en . quo . "]*)\""([" . ru . space . ",-:]*)\""([^" . en . quo . "]*)\""" ) := "«$1„$2”$3»"  ;TODO: look for at least one ru before/after/inside
typography.item("""([^" . en . quo . "]+)""" ) := "«$1»"  ;TODO: look for at least one ru before/after/inside




;=================================================================================== ORPHOGRAPHY
;TODO: handle correctly prepositions
;handle 
orphography := ComObjCreate("Scripting.Dictionary")
orphography.item("(\w+) а ") := "$1, а "
orphography.item("(\w+) но  ") := "$1, но "

orphography.item("[" . space . "]из[" . space . "]?за[" . space . "]") := " из-за "
orphography.item("[" . space . "]из[" . space . "]?под[" . space . "]") := " из-под "
orphography.item("[" . space . "]по[" . space . "]?над[" . space . "]") := " по-над "
orphography.item("[" . space . "]по[" . space . "]?за[" . space . "]") := " по-за "

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

lparticle := "кое|кой"
rparticle := "ка|либо|нибудь|то|тка|с|де"

partnoun := "какой-либо|кое-кто|кое-что|кто-либо|такой-то|тот-то|чей-либо|чей-нибудь|чей-то|какой-то|кое-какой|кое-кто|кое-чей|кое-что|кой-какой|кой-кто|кто-либо|кто-нибудь|кто-то|куда-нибудь|что-либо|что-нибудь|что-то|какой-нибудь"

orphography.item("[" . space . "]какой[" . space . "]?либо[" . space . "]") := " какой-либо "
orphography.item("[" . space . "]кое[" . space . "]?кто[" . space . "]") := " кое-кто "
orphography.item("[" . space . "]кое[" . space . "]?что[" . space . "]") := " кое-что "
orphography.item("[" . space . "]такой[" . space . "]?то[" . space . "]") := " такой-то "
orphography.item("[" . space . "]тот[" . space . "]?то[" . space . "]") := " тот-то "
orphography.item("[" . space . "]чей[" . space . "]?либо[" . space . "]") := " чей-либо "
orphography.item("[" . space . "]чей[" . space . "]?нибудь[" . space . "]") := " чей-нибудь "
orphography.item("[" . space . "]чей[" . space . "]?то[" . space . "]") := " чей-то "
orphography.item("[" . space . "]какой[" . space . "]?то[" . space . "]") := " кокой-то "
orphography.item("[" . space . "]кое[" . space . "]?какой[" . space . "]") := " кое-какой "
orphography.item("[" . space . "]кое[" . space . "]?кто[" . space . "]") := " кое-кто "
orphography.item("[" . space . "]кое[" . space . "]?чей[" . space . "]") := " кое-чей "
orphography.item("[" . space . "]кое[" . space . "]?чей[" . space . "]") := " кое-куда "
orphography.item("[" . space . "]кое[" . space . "]?что[" . space . "]") := " кое-что "
orphography.item("[" . space . "]кой[" . space . "]?какой[" . space . "]") := " кой-какой "
orphography.item("[" . space . "]кой[" . space . "]?какой[" . space . "]") := " кой-куда "
orphography.item("[" . space . "]кой[" . space . "]?кто[" . space . "]") := " кой-кто "
orphography.item("[" . space . "]кто[" . space . "]?либо[" . space . "]") := " кто-либо "
orphography.item("[" . space . "]кто[" . space . "]?нибудь[" . space . "]") := " кто-нибудь "
orphography.item("[" . space . "]кто[" . space . "]?то[" . space . "]") := " кто-то "
orphography.item("[" . space . "]куда[" . space . "]?нибудь[" . space . "]") := " куда-нибудь "
orphography.item("[" . space . "]что[" . space . "]?либо[" . space . "]") := " что-либо "
orphography.item("[" . space . "]что[" . space . "]?нибудь[" . space . "]") := " что-нибудь "
orphography.item("[" . space . "]что[" . space . "]?то[" . space . "]") := " что-то "
orphography.item("[" . space . "]какой[" . space . "]?нибудь[" . space . "]") := " какой-нибудь "
orphography.item("[" . space . "]давай[" . space . "]?ка[" . space . "]") := " давай-ка "
orphography.item("[" . space . "]как[" . space . "]?нибудь[" . space . "]") := " как-нибудь "
orphography.item("[" . space . "]как[" . space . "]?либо[" . space . "]") := " как-либо "
orphography.item("[" . space . "]как[" . space . "]?то[" . space . "]") := " как-то "
orphography.item("[" . space . "]ну[" . space . "]?тка[" . space . "]") := " ну-тка "
orphography.item("[" . space . "]да[" . space . "]?с[" . space . "]") := " да-с "

;===================================================================================== PUNCTUATION
punctuation := ComObjCreate("Scripting.Dictionary")

punctuation.item("") := "" ;first replacement didnt work. It's a bug of autohotkey
punctuation.item("([\w,]+)\s-{1,4}\s?") := "$1 — "
punctuation.item("\.[" . space . "]([" . ru . "]+)") := ". $T{1}" ;make sentences from Capital

;dot at the end of sentence
;TODO: ignorable parts like pre, code etc


;=======================================TODO: NOBRS
nobrs := ComObjCreate("Scripting.Dictionary")
nobrs.item("") := ""
nobrs.item("") := ""


;==================================TODO: hyphens


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

	text := applyRules(text, clean)
	text := cleanRepeatedWords(text)
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