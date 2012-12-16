;≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡Typograf is a script that corrects typography of selected text

;TODO:
; define language

; Refactoring prospectives:
; make nongreedy cases

; Tests: habr texts, gmail en texts, my wordpress texts, Netbeans texts, Photoshop texts, lj texts

;missed . at the end of sentences
;recognizing of lists

;ending spaces cut – is it goo or bad?
;auto nbsp where needed in realtime typesetting


;TODO
;не съедать пустые строки и br
;неразрывный пробел между числом и последующим словом имеет смысл ставить всегда, а не только с единицами измерений (например, 10 солдат).
;пробелы после точек (например, в инициалах)
;настройка возможности вставки спецсимволов не только кодами и html-сущностями, но и «напрямую»
;Добавьте, пожалуйста, кнопку для автоматической замены буквы е на ё везде, где рекомендуется
;soft hyphens
;Почему при типографии английского текста не ставятся плавающие переносы?
;Нежелательно чтобы в конце абзаца оставалось одно слово на новой строке.
;Типографа сокращения, типа ЕВРО итп
;not to take in handle <? ?>, …



punct := "\.\,\;\:\_\?\!\¿\؟\‽\&\\" ;punctuation after word
space := "      \t" ;all kind of spaces: en, em, punct, simple, nobr
newline := "\n\r\`v\`f"
dash := "–—−" ;not hyphen!
hyphen := "-"
lquo := "«‘‚„〞‹" ;TODO: “ in RU == right, in en == left
rquo := "»’”〝›"
quo := rquo . lquo . "\""\'"
lbrace := "\(\{\["
rbrace := "\)\]\}"
brace := lbrace . rbrace
pre := "(||||||)"
en := "a-zA-Z"
ru := "а-яА-ЯёЁйЙ"
num := "0-9" ;TODO:add fractions
romNum := "IVXLCDMХ"
math := "\+\-\*\/\%±≠≡"
currency := "$€¥Ħ₤£⃏"
word := ru . en . "_"
esos := rquo . rbrace ;ending symbol of sentence
bsos := "¿" . hyphen . dash . lbrace . lquo ;beginning symbol of sentence
pow := "¹²³⁴⁵⁶⁷⁸⁹⁰⁺¯⁼"

;--------------prepositions
preposition := "а-ля|без|без ведома|безо|благодаря|близ|близко от|в|в виде|в зависимости от|в интересах|в качестве|в лице|в отличие от|в отношении|в пользу|в преддверии|в продолжение|в результате|в роли|в связи с|в силу|в случае|в соответствии с|в течение|в целях|вблизи|ввиду|вглубь|вдоль|вдоль по|взамен|включая|вместо|вне|внизу|внутри|внутрь|во|во имя|возле|вокруг|вопреки|впереди|впредь до|вразрез|вроде|вслед|вслед за|вследствие|для|для-ради|до|за|за вычетом|за исключением|за счёт|заместо|из|из-за|из-под|изнутри|изо|исходя из|к|ко|кроме|кругом|лицом к лицу с|меж|между|мимо|на|на благо|на виду у|на глазах у|на предмет|наверху|навстречу|над|надо|назад|накануне|наперекор|наперерез|наподобие|напротив|наряду с|насупротив|насчёт|начиная с|не без|не в|не за|не считая|невзирая на|недалеко от|независимо от|несмотря на|ниже|о|об|обо|обок|около|окромя|округ|опосля|от|от имени|от лица|относительно|ото|перед|передо|по|по линии|по мере|по направлению к|по отношению к|по поводу|по причине|по случаю|по сравнению с|по-за|по-над|по-под|поблизости от|поверх|под|под видом|под эгидой|подле|подо|подобно|позади|помимо|поперёк|порядка|посередине|посередь|после|посреди|посредине|посредством|пред|предо|прежде|при|при помощи|применительно к|про|против|путём|ради|рядом с|с|с ведома|с помощью|с точки зрения|с целью|сверх|свыше|сзади|сквозь|скрозь|следом за|смотря по|снизу|со|согласно|спустя|среди|средь|сродни|судя по|супротив|через|чрез"

pronoun := "иже|какой-либо|когда|кое-кто|кое-что|кой|кто|кто-либо|многий|мя|насколько|немногий|нешто|никой|ничегошеньки|сё|такой-то|то же|тот-то|чё|чево|чей-либо|чей-нибудь|чей-то|шо|эта|себе|себя|собой|собою|каков|какой|кем|кой|ком|кому|который|кто|нахуя|сколько|чей|чему|что|вы|Вы|мы|он|она|оне|они|оно|ты|я|иной|какой|какой-то|кое-какой|кое-кто|кое-чей|кое-что|кой-какой|кой-кто|кто-либо|кто-нибудь|кто-то|куда-нибудь|некоторый|некто|нечто|что-либо|что-нибудь|что-то|весь|всякий|каждый|любой|сам|самый|этакий|другой|иной|какой|кой|который|кто|что|некем|некого|некому|нечего|нечем|нечему|никакой|никто|ничего|ничей|ничем|ничему|ничто|ваш|её|его|их|ихний|моё|мой|моя|наш|свой|твой|чей|сам|сей|сие|сии|сия|столько|та|таков|такой|то|тот|ту|эдакий|эта|этакий|эти|это|этот|как|каков|какой|который|каков|какой|сам|данный|каждый|некоторый|самый|Христов|весь|всякий|некий|другой|какой|какой-нибудь|никакой|сякой|такой|попугаячий"



;======================================================================== CLEAN MISTAKES
clean := ComObjCreate("Scripting.Dictionary")
clean.item("") := ""

;-----------simple initial transformations of combos
clean.item("\.\.\.") := "…"
clean.item("&quot;") := """"
clean.item("i)\([cс]\)") := "©"
clean.item("i)\(r\)") := "®"
clean.item("i)\(p\)") := "℗"
clean.item("i)\(tm\)") := "™"
clean.item("i)\(sm\)") := "℠"


clean.item("[" . space . "]{2,}") := " "
clean.item("\t+") := " "
clean.item("U)([" . word . "]+)[" . space . "]?([" . punct . "…]+)(?=[" . word . lquo . num . "])") := "$1$2 "  ;add spaces after punctuation
clean.item("-{2,6}") := "—" ;clear simple double-dashes
clean.item("([" . word . esos . "]+)[" . space . "]+([" . punct . "]+)") := "$1$2" ;clean spaces before punct
clean.item("([" . lquo . lbrace . "])[" . space . "]+") := "$1" ;clean spaces between leftquote ∨ leftbrace ∧ word
clean.item("[" . space . "]+([" . rquo . rbrace . "])") := "$1" ;clean space before brace & quo
clean.item("([" . word . "]+)([" . lquo . lbrace . "])") := "$1 $2" ;clean space after word before brace & quo
;TODO: case before has important side-effects: a(x), Firm(r)
clean.item("([" . rquo . rbrace . "])(?=[^" . space . newline . punct . "])") := "$1 " ;clean space after word before brace & quo

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

typography.item("(\w+)\s?гр(ад(уса|усов|ec)?)?") := "$1°" ;degrees

typography.item("([" . word . esos . "])([" . dash . "])([" . word . bsos . "])") := "$1 $2 $3" ;wrap dashes with thin spaces

;Simple quotes
typography.item("([" . space . newline . """]|^)""(?=[" . ru . "…])" ) := "$1«"
typography.item("([" . space . newline . """]|^)""(?=[" . en . "…])" ) := "$1“"
typography.item("“([" . en . space . "]+[…\+#])""(?=[" . space . newline . punct . """]|$)" ) := "“$1”" ;helper for closing enquotes
typography.item("«([" . ru . space . "]+[…\+#])""(?=[" . space . newline . punct . """]|$)" ) := "«$1»" ;helper for closing ruquotes
typography.item("([" . ru . punct . "])""(?=[" . space . newline . punct . """]|$)" ) := "$1»"
typography.item("""(?=[" . hyphen . dash . "])" ) := "»" ;special rare case of quote replace
typography.item("([" . en . punct . "])""(?=[" . space . newline . punct . """]|$)" ) := "$1”"

;Simple quotes side effect cleaner
typography.item("»""") := "»»"
typography.item("”""") := "””"
typography.item("""«") := "««"
typography.item("""“") := "““"

;---------------inside-quotes-rule
makeNestedQuotes(text){
	global newline
	ruNestedQuotesRegex := "(«[^«" . newline . "]*)(«([^«»]*)»)(?=[^«»" . newline . "]*»)"
	enNestedQuotesRegex := "(“[^“" . newline . "]*)(“([^“”]*)”)(?=[^“”" . newline . "]*”)"

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

typography.item("([" . punct . "])[" . space . "]*([" . rquo . "])") := "$2$1" ;rockerate punctuation in the end of rquote

;TODO: dot inside quotes

enShortener := "t|d|s|re"
typography.item("(\b[" . word . "]+)'(?=" . enShortener . "[\b])") := "$1’$2" ;don't apostrophe change to correct

typography.item("§([" . num . romNum . "]+)") := "§ $1"
typography.item("№([" . num . word . punct . "]+)") := "№ $1"

typography.item("i)\bP\.?[" . space . "]?S\.?[" . space . "]?") := "P. S. "
typography.item("i)\bP\.?[" . space . "]?P\.?[" . space . "]?S\.?[" . space . ":]?") := "P. P. S. "
typography.item("i)\bP\.?[" . space . "]?P\.?[" . space . "]?P\.?[" . space . "]?S\.?[" . space . ":]?") := "P. P. P. S. "



;=================================================================================== ORPHOGRAPHY
;TODO: handle correctly prepositions
;handle 
orphography := ComObjCreate("Scripting.Dictionary")
orphography.item("(\w+)[" . space . "]а[" . space . "]") := "$1, а "
orphography.item("(\w+)[" . space . "]но[" . space . "]") := "$1, но "

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

orphography.item("i)(" . ulparticle . ")[" . space . dash . hyphen . "]*(" . urparticle . ")[" . space . "](?!же|что)") := "$1-$2 "

orphography.item("[" . space . newline . "]такой[" . space . "]?то[" . space . "]") := " такой-то "
orphography.item("[" . space . newline . "]тот[" . space . "]?то[" . space . "]") := " тот-то "
orphography.item("[" . space . newline . "]давай[" . space . "]?ка[" . space . "]") := " давай-ка "
orphography.item("[" . space . newline . "]ну[" . space . "]?тка[" . space . "]") := " ну-тка "
orphography.item("[" . space . newline . "]да[" . space . "]?с[" . space . "]") := " да-с "

arparticle := "ка|тка|де|кась" ;aux right particle ;TODO: make cyr с handling

orphography.item("([" . word . "]+)[" . space . "]+(" . arparticle . ")([" . space . punct . quo . brace . "]+)(?=[^А-ЯЁ])") := "$1-$2$3"

alparticle := "кое|кой"

orphography.item("i)([" . space . newline . "]|^)(" . alparticle . ")[" . space . "]{1,4}(" . ulparticle . "+)") := "$1$2-$3"

orphography.item("([" . space . newline . "\.]|^)([" . num . "]+[йе" . hyphen . dash . "]?)[" . space . "]?(г\.?)(?=[" . space . punct . newline . "]|$)") := "$1$2 г." ;TODO: city nbsp correct
orphography.item("(\b[" . num . "]+[йе" . space . hyphen . "]*[" . hyphen . dash . "][" . space . "]?[" . num . "]+[йе" . hyphen . "]*)([" . space . "]?г\.?[" . space . "]?г?\.?)(?=[" . space . punct . newline . "]|$)") := "$1 гг."

orphography.item("i)(\b[" . romNum . "]+)[" . hyphen . dash . space . "]+([" . romNum . "]+)([" . space . "]?в\.?[" . space . "]?в?\.?)(?=[" . space . newline . punct . "]|$)") := "$U1–$U2 вв."

orphography.item("i)([" . ru . num . romNum . "]+)[" . space . "]?(н\.?[" . space . "]?э\.?)(?=[" . space . punct . newline . "]|$)") := "$1 н. э." 
orphography.item("i)([" . romNum . "])([" . space . "]?в\.?)(?=[" . space . punct . newline . "]|$)") := "$1 в." ;Centuries

ruMonths := "янв|фев|мар|апр|ма|июн|июл|авг|сен|окт|ноя|дек"
enMonths := "jan|feb|mar|apr|may|jun|jul|aug|sep|oct|nov|dec"
orphography.item("i)([" . num . "]{1,2})[" . space . "]?[" . hyphen . "][" . space . "]?([" . num . "]{1,2})[" . space . "]?((" . rumonths . ")[" . ru . "]*)") := "$1–$2 $3"
orphography.item("i)([" . num . "]{1,2})[" . space . "]?[" . hyphen . "][" . space . "]?([" . num . "]{1,2})[" . space . "]?(of)?[" . space . "]?((" . enmonths . ")[" . en . "]*)") := "$1–$2 $3 $4"

orphography.item("i)([" . num . "]{2}:[" . num . "]{2})[" . space . "]?[" . hyphen . "][" . space . "]?([" . num . "]{2}:[" . num . "]{2})") := "$1 – $2"

orphography.item("i)([" . space . newline . "]и)[" . space . "]?(т\.?[" . space . "]?д\.?)(?=[" . space . punct . newline . "]|$)") := "$1 т. д."
orphography.item("i)([" . space . newline . "]и)[" . space . "]?(т\.?[" . space . "]?п\.?)(?=[" . space . punct . newline . "]|$)") := "$1 т. п."
orphography.item("i)([" . space . newline . "]в)[" . space . "]?(т\.?[" . space . "]?ч\.?)[" . space . punct . "]?([" . word . "]+)") := "$1 т. ч. $3"
orphography.item("i)(([" . space . newline . lquo . lbrace . "]|^)см)(\.|[" . space . "])[" . space . "]?([" . word . num . "]+)") := "$1. $4"
orphography.item("i)([" . space . newline . "])им(\.|[" . space . "])[" . space . "?]([" . word . "]+)") := "$1им. $T3"

refWord := "рис|Рис|гл|Гл|илл|Илл|стр|Стр|разд|Разд"
orphography.item("i)([" . space . newline . lbrace . lquo . "]|^)(" . refWord . ")\.?[" . space . "]?([" . num . romNum . "]+[\.-]?[" . word . num . romNum . "]*)") := "$1$2. 3"
orphography.item("([" . space . newline . lbrace . lquo . "]|^)(см|См)\.?[" . space . "]?(" . refWord . ")\.?[" . space . "]?([" . num . romNum . "]+[\.-]?[" . word . num . romNum . "]*)") := "$1$2. $3. $4" ;TODO: make см. гл., см. разд., …

orphography.item("([" . space . "])и([" . space . "]др\.?)(?=[" . space . newline . punct . "]|$)") := "$1и др."

addrWord := "г|ул|пр|адр"
orphography.item("i)([" . space . newline . "]|^)(" . addrWord . ")(\.[" . space . "]?|[" . space . "])(?=[" . word . "])") := "$1$2. "
addrNum := "кв|корп|пар|п|код|тел|индекс|инд|д|адр"
orphography.item("i)([" . space . newline . "]|^)(" . addrNum . ")(\.[" . space . "]?|[" . space . "])(?=[" . num . "])") := "$1$2. "

orphography.item("i)([" . space . newline . lquo . lbrace . "]|^)(н)[" . space . "]?(да+)(?=[" . space . punct . rquo . rbrace . "]|$)") := "$1$2-$3"


;===================================================================================== PUNCTUATION
punctuation := ComObjCreate("Scripting.Dictionary")

punctuation.item("") := "" ;first replacement didnt work. It's a bug of autohotkey
punctuation.item("([" . word . "]+[" . rquo . "]?[" . punct . "])[" . space . "]?[" . hyphen . "]{1,4}[" . space . "]?") := "$1 — " ;TODO: check is it neccessary to insert space between , and –, eg. "I'll not do it",– he said.
;punctuation.item("([" . word . punct . "]+)\.[" . space . "]([" . ru . "]+)") := "$1. $T2" ;make sentences from Capital: conflict with т.к.

punctuation.item("([^\,])([" . space . "]+)(а|но)[" . space . punct . "]") := "$1, $3 "

punctuation.item("([" . word . "]+)\.\.") := "$1." ;remove doubles: so bad because of i'm lazy to make any cycles
punctuation.item("\,\,+") := ","
punctuation.item("\;+") := ";"
punctuation.item("([^\?])\?\?([^\?])") := "$1?$2"
punctuation.item("([^\!])\!\!([^\!])") := "$1!$2" 

punctuation.item("[" . space . rquo . "][" . hyphen . "][" . space . "](?=[" . word . quo . num . "])") := " — " ;dash inside sentence
punctuation.item("[" . space . "][" . hyphen . "](?=[" . newline . "])") := " —" ;dash on end of line
punctuation.item("([" . newline . "])[" . hyphen . "](?=[" . space . newline . "][" . word . "])") := "$1—" ;start dialogue sentence of section with dash

punctuation.item("i)([" . space . newline . "]|^)([А-Я])\.[" . space . "]?([А-Я])\.[" . space . "]?([" . ru . "]+)(?=[" . space . punct . rquo . rbrace . newline . "])") := "$1$2. $3. $4" ;make RU name initials

;punctiuation.item("…([space+][" . . "])")

;dot at the end of sentence
;TODO: ignorable parts like pre, code etc



;=======================================TODO: NOBRS & nbsps
nobrs := ComObjCreate("Scripting.Dictionary")
nobrs.item("") := ""
nobrs.item("i)(([" . word . "]+[" . hyphen . "])+[" . word . "]+)") := "<nobr>$1</nobr>" ;common words-through-hyphen
nobrs.item("(\+?[" . num . hyphen . space . dash . brace . "\.x]+[" . num . "])") := "<nobr>$1</nobr>" ;common phone number



;TODO бы ль б же ж ли
nbsps := ComObjCreate("Scripting.Dictionary")
nbsps.item("") := ""

nbspParticles = "б|ль|бы|же|ль|ж|ли"
nbsps.item("([" . word . "]+)[ ](" . nbspParticles . ")(?=[" . space . punct . "])") := "$1 $2"
nbsps.item("( [" . word . "]{1,3})( )(?=[" . word . "]{3,})") := "$1 " ;all words of <3 length do nbspaced


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
mathRules.item("([" . space . newline . "]|^)([12]?[" . num . "]{3})[" . space . "]?[" . hyphen . "][" . space . "]?([" . num . "]{2,4})(?=[^" . num . romNum . "]{2})") := "$1$2−$3" ;year format guaranteed
;mathRules.item("([" . num . "]+)([" . space . "]?[" . hyphen . "][" . space . "]?)(?=[" . num . "]+)") := "$1 – " ;simple dashed digits - non


pointedCurrencyWord := "руб|долл"
amountWord := "тыс|млн|млрд"
numPatt := "\b[" . num . "]+[\.,]?[" . num . "]*"

mathRules.item("i)(" . numPatt . ")[" . space . "]?(" . amountWord . ")\.?[" . space . "]?(" . pointedCurrencyWord . ")\.?") := "$1 $L2. $L3."
mathRules.item("i)(" . numPatt . ")[" . space . "]?(" . pointedCurrencyWord . ")\.?") := "$1 $L2."

mathRules.item("i)(" . numPatt . ")[" . space . "]?(" . amountWord . ")\.?[" . space . "]?у\.?[" . space . "]?е\.?") := "$1 $L2. у.е."
mathRules.item("i)(" . numPatt . ")[" . space . "]?у\.?[" . space . "]?е\.?") := "$1 у.е."

mathRules.item("i)(" . numPatt . ")[" . space . "]?(" . amountWord . ")\.?[" . space . "]?евро?") := "$1 $L2. евро"
mathRules.item("i)(" . numPatt . ")[" . space . "]?евро?") := "$1 евро"

mathRules.item("i)(" . numPatt . ")[" . space . "]?([" . currency . "])") := "$1 $2"
mathRules.item("i)([" . currency . "])[" . space . "]?(" . numPatt . ")") := "$1$2" ;TODO: this is difference from typograf.ru needed to be noted

afterUnit := "dpi|ppi|px|em|cm|pt|pc|m|km|mph|ml|deg"

mathRules.item("i)(" . numPatt . ")[" . space . "]?(" . afterUnit . ")") := "$1 $2"

phoneDiv := "[" . space . "]?[" . hyphen . "]?[" . space . "]?"

mathRules.item("([" . space . newline . punct . "]|^)(\+[" . num . "])[" . space . "]?[\(]?([" . num . "]{1,5})[\)]?[" . space . "]?([" . num . "])([" . num . "])([" . num . "])([" . num . "])([" . num . "])([" . num . "])([" . num . "])(?=[^" . num . "]{2,})") := "$1$2 ($3) $4$5$6-$7$8-$9${10}" ;SPb phones +7 (999) 1112233 → +7 (999) 111-22-33
mathRules.item("([" . space . newline . punct . "]|^)(\+[" . num . "])[" . space . "]?([\(][" . num . "]{1,5}[\)])[" . space . "]?([" . num . "]{4,10}[" . space . "]?[" . num . "]*[" . space . "]?[" . num . "]*)(?=[^" . num . "]{2,}|$)") := "$1$2 $3 $4" ;Simple phones

;---------units work
uUnit := {ru:"", en:""}
lUnit := {ru:"", en:""}
UnitLPrefix := {ru:"", en:""}
UnitUPrefix := {ru:"", en:""}

UnitLPrefix["ru"] := "и|з|а|ф|п|н|мк|м|с|да|д|г|к"
UnitUPrefix["ru"] := "М|Г|Т|П|Э|З|И"
UnitLPrefix["en"] := "y|z|a|f|p|n|u|µ|m|c|da|d|h|k"
UnitUPrefix["en"] := "M|G|T|P|E|Z|Y"

unitPrefix := UnitLPrefix["ru"] . "|" . UnitLPrefix["en"] . "|" . UnitUPrefix["ru"] . "|" . UnitUPrefix["en"]

uUnit["ru"] := "А|К|Гц|Н|Дж|Вт|Па|Кл|В|Ом|Ф|Вб|Тл|Гн|Бк|Гр|Зв|Нп" ;there is only unique units. There is no Amper, B, H, T, См and other symmetric for both cases units.
uUnit["en"] := "A|K|Hz|N|J|W|Pa|C|V|Ω|F|Wb|S|Bq|Gy|Sv|Np"
lUnit["ru"] := "м|кг|с|моль|кд|рад|ср|лм|лк|кат|мин|ч|сут|л|т|миля|уз|га|бар"
lUnit["en"] := "m|kg|s|mol|cd|rad|sr|lm|lx|kat|min|d|l|kn|ha|bar"

enunit := uUnit["en"] . "|" . lUnit["en"]
ruunit := uUnit["ru"] . "|" . lUnit["ru"]

unit := ruunit . "|" . enunit


specUnits := "° ′ ″ µ Ω эВ а.е.м. а.е. Белл ангстрем "

mathRules.item("i)(" . numPatt . ")[" . space . "]?([" . pow . "]+)?[" . space . "]?(" . unitPrefix ")?((" . uunit["ru"] . "|" . uunit["en"] . ")([" . pow . num . "]+)?)(?=[" . space . newline . punct . "]|$)") := "$1$2 $3$T5$6" ;prefixed upper units

mathRules.item("i)(" . numPatt . ")[" . space . "]?([" . pow . "]+)?[" . space . "]?(" . unitPrefix ")?((" . lunit["ru"] . "|" . lunit["en"] . ")([" . pow . num . "]+)?)(?=[" . space . newline . punct . "]|$)") := "$1$2 $3$L5$6" ;prefixed lower units

mathRules.item("i)(" . numPatt . ")[" . space . "]?([" . pow . "]+)?[" . space . "]?(" . unitPrefix ")?((Ohm)([" . pow . num . "]+)?)(?=[" . space . newline . punct . "]|$)") := "$1$2 $3Ω$6" ;make ohms
mathRules.item("i)(" . numPatt . ")[" . space . "]?([" . pow . "]+)?[" . space . "]?(" . unitPrefix ")?((Cels|celsium|deg c|c deg)[" . space . "]?([" . pow . "]+)?)(?=[" . space . newline . punct . "]|$)") := "$1$2 $3°C$6" ;make celsium
mathRules.item("i)(" . numPatt . ")[" . space . "]?([" . pow . "]+)?[" . space . "]?(u|micro)((" . enunit . ")([" . pow . num . "]+)?)(?=[" . space . newline . punct . "]|$)") := "$1$2 µ$5$6" ;make micro


;--------convert num after unit to pow
suspectPow := num . "-\+\(\)="

mathRules.item("i)((" . numPatt . ")[" . space . "]?(" . unitPrefix ")?(" . unit . "))([" . suspectPow . "])([" . suspectPow . "])(?=[" . space . newline . punct . "]|$)") := "$1^$5^$6^$7" 
mathRules.item("i)((" . numPatt . ")[" . space . "]?(" . unitPrefix ")?(" . unit . "))([" . suspectPow . "])([" . suspectPow . "])(?=[" . space . newline . punct . "]|$)") := "$1^$5^$6"
mathRules.item("i)((" . numPatt . ")[" . space . "]?(" . unitPrefix ")?(" . unit . "))([" . suspectPow . "])(?=[" . space . newline . punct . "]|$)") := "$1^$5"

mathRules.item("((" . numPatt . ")\^[" . suspectPow . "])([" . suspectPow . "])([" . suspectPow . "])([" . suspectPow . "])") := "$1^$3^$4^$5" 
mathRules.item("((" . numPatt . ")\^[" . suspectPow . "])([" . suspectPow . "])([" . suspectPow . "])") := "$1^$3^$4" ;prepare pows after value
mathRules.item("((" . numPatt . ")\^[" . suspectPow . "])([" . suspectPow . "])") := "$1^$3" ;prepare pows after value itself

mathRules.item("\^0") := "⁰"
mathRules.item("\^1") := "¹"
mathRules.item("\^2") := "²"
mathRules.item("\^3") := "³"
mathRules.item("\^4") := "⁴"
mathRules.item("\^5") := "⁵"
mathRules.item("\^6") := "⁶"
mathRules.item("\^7") := "⁷"
mathRules.item("\^8") := "⁸"
mathRules.item("\^9") := "⁹"
mathRules.item("\^\-") := "¯"
mathRules.item("\^\+") := "⁺"
mathRules.item("\^=") := "⁼"
mathRules.item("\^\(") := "⁽"
mathRules.item("\^\)") := "⁾"
mathRules.item("\^_n") := "ⁿ"
mathRules.item("\^n") := "ⁿ"

mathRules.item("((" . numPatt . ")[" . pow . "]*[" . space . "](" . unitPrefix ")?(" . unit . ")[" . pow . "]*)[\.]([" . punct . rbrace . "])") := "$1$5" ;correct punctuation after si units

;--------TODO: correct digit delimiters
;mathRules.item("([" . num . "]{1,3})[" . space . "]([" . num . "]{3})[" . space . "]?([" . num . "]{3})?[" . space . "]?([" . num . "]{3})?[" . space . "]?([" . num . "]{3})?[" . space . "]?([" . num . "]{3})?[" . space . "]?([" . num . "]{3})?[" . space . "]?([" . num . "]{3})?[" . space . "]?([" . num . "]{3})?[" . space . "]?([" . num . "]{3})?[" . space . "]?([" . num . "]{3})?") := "" ;already delimited

;mathRules.item("([" . newline . "]|^)([" . num . "]{1,3})[" . space . "]([" . num . "]{3})[" . space . "]?([" . num . "]{3})?[" . space . "]?([" . num . "]{3})?[" . space . "]?([" . num . "]{3})?[" . space . "]?([" . num . "]{3})?[" . space . "]?([" . num . "]{3})?[" . space . "]?([" . num . "]{3})?[" . space . "]?([" . num . "]{3})?[" . space . "]?([" . num . "]{3})?[" . space . "]?([" . num . "]{3})?"") := "$1 $2 $3 "


mathRules.item("([" . punct . "])[" . space . "]*([" . rbrace . "])([" . space . newline . "]|$)") := "$2$1" ;punctuation at the end of brace cleaner

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
	global nobrs
	global nbsps

	textFormat := checkFormat(text)

	text := applyRules(text, clean)
	text := cleanRepeatedWords(text)
	text := applyRules(text, typography)
	text := makeNestedQuotes(text)
	text := applyRules(text, punctuation)
	text := applyRules(text, orphography)
	text := applyRules(text, mathRules)
	text := applyRules(text, nbsps)

	;msgbox, %text%

	if (textFormat == "html"){
		;text := applyRules(text, nobrs)
	}

	return text
}


; pass through set of rules
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


checkFormat(text){
	;TODO: define CSS, HTML, JS, ERLANG, plain RU, plain EN …
	htmlRE := "(<[a-zA-Z\s]+>){3,}"
	cssRE := "((\{[a-zA-Z\s]+:[.]+)\}){3,}"

	if (RegExMatch(text, htmlRE)){
		return "HTML"
	} else if (RegExMatch(text, cssRE)) {
		return "CSS"
	} else {
		return "plain"
	}
}

checkLanguage(text){
	ruRE := "([а-яА-ЯёЁ]+[\s,\.]){2,}"

	if (RegExMatch(text, ruRE)){
		return "RU"
	} else {
		return "EN"
	}
}