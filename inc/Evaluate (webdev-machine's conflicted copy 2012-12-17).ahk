;This dilly depends on Faker, Util and Combos. It may evaluate any selection
; Examples: &nbsp; [ndash 10] [date] [some_combo]
; Eval possibilities:
; &html_thing
; &unicode_thing
; [some expression with {{}}] multiply
evaluate(text){
	if (RegExMatch(request, "[[^""]*""([^""]+)""[^""]*]()"))
}