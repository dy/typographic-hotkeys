
;!n::
;!~::
!sc031::
+!sc029::
    listenDiacritics("˜")
    return

;!`::
!sc029::
    listenDiacritics("``")
    return

;+!
+!sc028::
    Send Æ
    return

;!'::
!sc028::
    Send æ
    return

;!e::
;!'::
!sc012::
;!sc028:: ;superceded by ae
    listenDiacritics("´")
    return

;!i::
;!^::
!sc017::
+!sc007::
    listenDiacritics("ˆ")
    return

;!u::
;!"::
!sc016::
;+!sc028::
    listenDiacritics("¨")
    return

;+!a::
+!sc01e::
    Send Å
    return
;+!c::
+!sc02e::
    Send Ç
    return
!sc02e::
    Send ç
    return
;+!o::
^+!sc18::
    Send °
    return
+!sc18::
    Send Ø
    return
!sc18::
    Send ø
    return



;===========================================================Hotkeys
;^+!w::
^+!sc011::
    Send „
    return
;^+![::
^+!sc01A:: 
    Send „
    return
;+![::
+!sc01A::
    Send ”
    return
;![::
!sc01A::
    Send “
    return

;^+!]::
^+!sc01b::
    Send ‚
    return
;+!]::
+!sc01b::
    Send ’
    return
;!]::
!sc01b::
    Send ‘
    return

;+!t::
+!sc014::
    Send ‡
    return
;!t::
!sc014::
    Send †
    return

+!7::
    Send ‡
    return

;!;::
!sc027::
    Send …
    return

;+!r::
+!sc013::
    Send ‰
    return

+!3::
    Send ‹
    return
+!4::
    Send ›
    return

!2::
    Send ™
    return

^+!-::
    Send  — 
    return
+!-::
    Send —
    return
;!-::
!-::
    Send –
    return

!1::
    Send ¡
    return
!4::
    Send ¢
    return
!3::
    Send £
    return
;!y::
!sc015::
    Send ¥
    return
!6::
    Send §
    return
;+!u::
+!sc016::
    Send ¨
    return
;!g::
!sc022::
    Send ©
    return
!9::
    Send ª
    return
;+!\::
+!\::
    Send »
    return
;!\::
!\::
    Send «
    return
;!l::
!sc026::
    Send ¬
    return
;!r::
!sc013::
    Send ®
    return
+!8::
    Send °
    return
;+!=::
+!=::
    Send ±
    return
;+!e::
+!sc012::
    Send ´
    return
;!m::
!sc032::
    Send µ
    return
!7::
    Send ¶
    return
+!9::
    Send ·
    return
;+!z::
+!sc02c::
    Send ¸
    return
+!0::
    Send º
    return
!0::
    Send °
    return
;!s::
!sc01f::
    Send ß
    return
;!a::
!sc01e::
    Send å
    return

^+!Space:: ;emspace
    KeyWait Alt
    Send  
    return
+!Space:: ;&nobr;
    KeyWait Alt
    Send  
    return
!Space::
    KeyWait Alt
    Send  
    return


^+!sc02d::
    Send ✕
    return
+!sc02d::
    Send ✖
    return
;!x::
;+!8::
!sc02d::
    Send ×
    return
+!*::
    Send ∙
    return

+^!=::
    Send ≡
    return

!=::
    Send ≠
    return

;TODO:
;+!^.::
+!^sc034::
    Send ●
    return
;+!.::
+!sc034::
    Send •
    return
;!.::
!sc034::
    Send ›
    return
;!.::
!sc033::
    Send ‹
    return



^+!1::
    Send ¹
    return
^+!2::
    Send ²
    return
^+!3::
    Send ³
    return
^+!4::
    Send ⁴
    return
^+!5::
    Send ⁵
    return
^+!6::
    Send ⁶
    return
^+!7::
    Send ⁷
    return
^+!8::
    Send ⁸
    return
^+!9::
    Send ⁹
    return
^+!0::
    Send ⁰
    return


^+!Up::
    Send ▲
    return
+!Up::
    Send ▴
    return
!Up::
    Send ↑
    return
^+!Down::
    Send ▼
    return
+!Down::
    Send ▾
    return
!Down::
    Send ↓
    return
^+!Left::
    Send ◀
    return
+!Left::
    Send ◂
    return
!Left::
    Send ←
    return
^+!Right::
    Send ▶
    return
+!Right::
    Send ▸
    return
!Right::
    Send →
    return


;===================Specials
;^+!?::
;^+!/::
^+!sc035::
    Send ؟
    return
;+!?::
;+!/::
+!sc035::
    Send ¿
    return
;!?::
;!/::
!sc035::
    Send ‽
    return


;---------------string replacements
:?*:...::…
:*:(c)::©
:*:(r)::® 
:*:(tm)::™
:*:(sm)::℠
:*:←→::↔

;--------------en apostrophes
:?*:n't::n’t
;:*:et's::et’s   ;let’s
:?:'m::’m
:?:'re::’re
:?:'s::’s
:?:s'::s’
:?:'st::’st
:?:'ve::’ve
:?:'d::’d
:?:'ll::’ll
:?:'em::’em 
:?:'im::’im 
:*:o'::o’ ;o'clock
:?:in'::in’ ;crackin' 
;-----------------fr apostrophes
:*:l'::l’ ;l'heure
:*:d'::d’ ;d'or

;--------------nobrs
:*:fu`t::
(
function () {
var self = this, o = self.options;

return self;
}
)

;------------a few useful JS replacements
:*R:){::) {
:*R:if(::if (
:?*R:ion(::ion (