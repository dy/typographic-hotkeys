;≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡ Everything related to HTML

;================================ Tag combos - tags which had to be extended automatically when wraps


;TODO: make correct tags work
getOpenTag(tag){
	return "<" . tag . ">"
}

;================================ Wrapper
;TODO: wrap thing like * sdfdsf * sdfds * sdgfdsf to list;
;TODO: make html-snippets like ul, and so on, zen-coding-driven

wrapWithTag(str, tag){
	str := getOpenTag(tag) . "`n" . str . "`n</" . tag . ">"
	return str
}