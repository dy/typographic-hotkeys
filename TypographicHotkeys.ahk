;To call pair-symbols, like quotes, brackets and so on
opened := "" ;object of opened pairs
pair(a, b)
{
    global opened
    if (opened == a) {
    	opened := ""
    	return b
    } else {
    	opened := a
    	return a
    }
}

#Hotstring * ?



;=================================Basic typography
::[---]::
    Send —
    return
^!-::
	;KeyWait Control
	;KeyWait Alt
    Send —
    return

!-::
	KeyWait Alt
    Send –
    return
::[--]::
    KeyWait Alt
    Send –
    return

^!+[::
    Send „
    return
^!+]::
    Send ‟
    return
^![::
    Send “
    return
^!]::
    Send ”
    return
![::
    Send «
    return
!]::
    Send »
    return

::...::…
::[...]::…
::[..]::‥

!Space::
    KeyWait Alt
    Send  
    return

::?!::‽
::!?::‽

::***::⁂

::[deg]::°

::[par]::§
::[paragraph]::§

;================================Maths
::[inf]::∞
::[infinity]::∞
::[((]::⦅
::[))]::⦆
:*:[forall]::∀
:*:[for all]::∀
:*:[there exists]::∃
:*:[thereexists]::∃
:*:[theredoesntexists]::∄
:*:[there doesn't exists]::∄
:*:[complement]:∁
:*:[diff]::∂
:*:[dif]::∂
:*:[differential]::∂
:*:[empty]::∅
:*:[element of]::∈
:*:[elementof]::∈
:*:[notanelementof]::∉
:*:[not an element of]::∉
:*:[not element of]::∉
:*:[small element of]::∊
:*:[smallelementof]::∊
:*:[containsasmember]::∋
:*:[contains as member]::∋
:*:[does not contain as member]::∌
:*:[doesnotcontainasmember]::∌
:*:[subset of]::⊂
:*:[superset of]::⊃
:*:[subsetof]::⊂
:*:[supersetof]::⊃

:*:[right angle]::∟
:*:[90deg]::∟
:*:[90 angle]::∟
:*:[angle]::∠

:*:[sqrt]::√
:*:[square root]::√
:*:[cube root]::∛
:*:[cuberoot]::∛
:*:[fourthroot]::∜
:*:[fourth root]::∜
:*:[hypercube root]::∜
:*:[hypercuberoot]::∜

:*:[and]::∧
:*:[disjunction]::∧
:*:[or]::∨
:*:[conjunction]::∨
:*:[intersection]::∩
:*:[union]::∪
:*:[integral]::∫
:*:[double integral]::∬
:*:[doubleintegral]::∭
:*:[triple integral]::∬
:*:[tripleintegral]::∭


::[+-]::±
::[-+]::∓
::[-~]::≂
::[~-]::≃
::[~~]::≈

!~::
    Send ∽
    return

::[<=]::≤
::[<==]::≦
::[>=]::≥
::[>==]::≧
::[<<]::≪
::[>>]::≫
::[<~]::≲
::[>~]::≳
::[<>]::≶
::[><]::≷
::[==]::≡
::[!=]::≠

!*::
+!8::
    SendRaw ×
    return
^!*::
^+!8::
    SendRaw ∙
    return

!/::÷
::[/]::÷

+^!=::
    Send ≡
    return
^!=::
    Send ꞊
    return
!=::
    Send ≠
    return



;============================Shapes
::[star]::★
::[star1]::★
::[star2]::☆
::[star3]::⋆

!.::∙
+!.::•
+!^.::●
::[dot]::∙
::[dot1]::∙
::[dot2]::•
::[dot3]::●
::[dot4]::○
::[dot5]::◌
::[dot6]::◎

::[small circle]::∙
::[circle]::•
::[big circle]::●

::[square1]::▪
::[small square]::▪
::[square2]::■
::[square]::■
::[square3]::∎
::[big square]::∎

::[x0]::☓
::[x1]::✕
::[x2]::✖
::[x3]::✘
::[x4]::✗
::[x5]::╳
::[cross0]::☓
::[cross1]::✕
::[cross2]::✖
::[cross3]::✘
::[cross4]::✗

::[diamond]::⋄
::[diamond2]::◇
::[diamond3]::◆

::[vertical]::|
::[vertical1]::|
::[vertical2]::│
::[vertical3]::┃
::[vertical4]::┆
::[vertical5]::┊
::[vertical6]::╎
::[vertical7]::┋
::[|1]::|
::[|2]::│
::[|3]::┃
::[|4]::┆
::[|5]::┊
::[|6]::╎
::[|7]::┋

;=============================Symbols
::[check]::☑
::[check2]::☒

::[ok]::✓
::[ok1]::✓
::[ok2]::✔

::[phone]::✆
::[phone1]::✆
::[phone2]::☎
::[phone3]::☏

::[mail]::✉
::[email]::✉

::[home]::⌂
::[house]::⌂

::[scissors]::✂
::[scissors1]::✂
::[scissors2]::✁
::[scissors3]::✃
::[scissors4]::✄

::[option]::⌘

::[cloud]::☁

::[wave]::⌇
!|::
    Send ⌇
    return

::[pencil]::✍
::[pencil1]::✍
::[pencil2]::✎
::[pencil3]::✏
::[pencil4]::✐

::[nib1]::✑
::[nib2]::✒

::[hot]::♨
::[piece]::☮
::[victory]::✌
::[radioactive]::☢
::[death]::☠
::[smile]::☺
::[black smile]::☻
::[blacksmile]::☻
::[medicine]::☤
::[plane]::✈
::[comet]::☄

::[hand left]::☜
::[handleft]::☜
::[handtop]::☝
::[hand top]::☝
::[handright]::☞
::[hand right]::☞
::[black hand right]::☛
::[black hand left]::☚
::[handdown]::☟
::[hand down]::☟


;==========================Law marks
::(c)::©
::(r)::® 
::[tm]::™
::(tm)::™
::[sm]::℠
::(sm)::℠

;=============================Currency
:C:[cent]::¢
:C:[CENT]::￠
:C:[c-]::¢
:C:[C-]::￠
::[ils]::₪
::[i-]::₪
::[eur]::€
::[e-]::€
::[eurocurrency]::₠
::[F-]::₣
::[Fr-]::₣
::[gbp]::£
::[gb-]::£
::[jpy]::¥
::[y-]::¥
::[rub]::⃏
::[roub]::⃏
::[ru]::⃏
::[rur]::⃏
::[R-]::⃏
::[mnt]::₮
::[t-]::₮
::[currency]::¤

;=============================Numbers
!^1::¹
!^2::²
!^3::³
::1/2::½
::1/3::⅓
::1/4::¼
::1/5::⅕
::1/6::⅙
::1/7::⅐
::1/8::⅛
::1/9::⅑
::1/10::⅒
::2/3::⅔
::2/5::⅖
::3/4::¾
::3/5::⅗
::3/8::⅜
::4/5::⅘
::5/6::⅚
::5/8::⅝
::7/8::⅞

;=============================Circles
::(1)::⑴
::(2)::⑵
::(3)::⑶
::(4)::⑷
::(5)::⑸
::(6)::⑹
::(7)::⑺
::(8)::⑻
::(9)::⑼
::(10)::⑽
::(11)::⑾
::(12)::⑿
::(13)::⒀
::(14)::⒁
::(15)::⒂
::(16)::⒃
::(17)::⒄
::(18)::⒅
::(19)::⒆
::(20)::⒇

::[0]::⓪
::[1]::①
::[2]::②
::[3]::③
::[4]::④
::[5]::⑤
::[6]::⑥
::[7]::⑦
::[8]::⑧
::[9]::⑨
::[10]::⑩
::[11]::⑪
::[12]::⑫
::[13]::⑬
::[14]::⑭
::[15]::⑮
::[16]::⑯
::[17]::⑰
::[18]::⑱
::[19]::⑲
::[20]::⑳

::[1.]::⒈
::[2.]::⒉
::[3.]::⒊
::[4.]::⒋
::[5.]::⒌
::[6.]::⒍
::[7.]::⒎
::[8.]::⒏
::[9.]::⒐
::[10.]::⒑
::[11.]::⒒
::[12.]::⒓
::[13.]::⒔
::[14.]::⒕
::[15.]::⒖
::[16.]::⒗
::[17.]::⒘
::[18.]::⒙
::[19.]::⒚
::[20.]::⒛

;===========================Arrows
+^!Up::
    Send ⇧
    return
+^!Down::
    Send ⇩
    return
+^!Left::
    Send ⇦
    return
::[<-]::
    Send ←
    return
+^!Right::
    Send ⇨
    return
::[->]::
    Send →
    return
+!Up::
    Send ▴
    return
+!Down::
    Send ▾
    return
+!Left::
    Send ◂
    return
+!Right::
    Send ▸
    return
^!Up::
    Send ▲
    return
^!Down::
    Send ▼
    return
^!Left::
    Send ◀
    return
^!Right::
    Send ▶
    return
!Up::
    Send ↑
    return
!Down::
    Send ↓
    return
!Left::
    Send ←
    return
!Right::
    Send →
    return


;================================Linux/Solaris compose key sequences
;::
;    KeyWait =
;    KeyWait C
;    Send €
;    return