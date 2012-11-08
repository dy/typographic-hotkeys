::btw::by the way

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

::---::
    Send —
    return
^!-::
    Send —
    return
!-::
    Send –
    return

^!'::
    Send „‟
    Send {Left 1}
    return
^!+'::
    Send “”
    Send {Left 1}
    return
!'::
    Send «»
    Send {Left 1}
    return

::...::…
!Space:: 
::?!::‽
::!?::‽

::+-::±
::-+::∓
!~::≈
^+!*::
^+!8::
    SendRaw ×
    return
^!*::
^!8::
    SendRaw ∙
    return
!/::÷

+^!=::
    Send ≡
    return
^!=::
    Send ꞊
    return
!=::
    Send ≠
    return


!.::∙
+!.::•
+!^.::●
::***::⁂

:*:(c)::©
:*:(с)::©
:*:(r)::® 
:*:[tm]::™
:*:(tm)::™
:*:[sm]::℠
:*:(sm)::℠

:*:[deg]::°
:*:(deg)::°
!e::€
!E::€
:*:[eu]::€
!y::¥
!Y::¥
!c::¢
:*:[cent]::¢
:*:[rub]::⃏
:*:[roub]::⃏
:*:[ru]::⃏
:*:[rur]::⃏

!p::§
!P::§
:*:[par]::§


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


+^!Up::
    Send ⇧
    return
+^!Down::
    Send ⇩
    return
+^!Left::
    Send ⇦
    return
+^!Right::
    Send ⇨
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