;-------------------Dec code to Hex with no 0x
toHex(code)
{    
    SetFormat, IntegerFast, H
    a := code + 0
    a := SubStr(a, 3, StrLen(a))
    SetFormat, Integer, D
    ;MsgBox, %a%
    return a
}
;-----------------------wide up @code string to @length positions
toFixed(code, length){
    res := ""
    handleCount := length
    Loop, Parse, code
    {
        handleCount--
        res := res . A_LoopField       
    }
    Loop, %handleCount%
    {
        res := "0" . res
    }
    return res
}
;----------------------Clear n last symbols
clear(n){
    Loop, %n% {
        SendInput {BS}
    }
}
;----------------------Select n last symbols
selectBefore(n){
    Loop, %n% {
        SendInput +{Left}
    }
}
;----------------------------Clipboard helpers
clipBackup := ""
backupClipboard(){  
    global clipBackup  
    clipBackup := clipboard
}
restoreClipboard(){    
    Sleep, 80
    global clipBackup  
    clipboard = %clipBackup%
}
;-----------------------Bin tests
testBinary(){

;2 bytes is always reserved for technical needs
;Digits are strings too
;v1 := 123 ; length is 6
;v1 := 0xa ; length is 6
;v1 := 1234 ; length is 14
;v1 := 0x01 ; length is 14
;v1 := 0xff ; length is 14
;v1 := 0x12345 ; length is 14
;v1 := "zxfvklm" ; length is 14
;v1 := 0x123456 ; length is 126
;v1 := "zxfvklm0" ; length is 126

;v1 := 0
;NumPut(0, v1, 0, "UInt" )
;cap1 := varsetcapacity(v1 )

;cap2 := varsetcapacity(v2, 8 )
;v1adr := &v1
;v2 := 0
;v2 := NumGet(v1, 0, "UInt")

;MsgBox, v1 = %v1% : %cap1%  v1adr = %v1adr%  v2 = %v2% : %cap2%

;b1 := v1 ^ v2

;MsgBox, %b1%


}







;---------------------------Get caret coords
getCaretPosition(){
    ;First - make system getCaretPos
    caretCoords := {}


    ;If it fails - make caret blinking search
    caretCoords := getCaretPositionFromScreenshots()


    ;Else - show on the mouse

    return caretCoords
}





;It compares screens of corrent window before and after typing, results first different pixel
;At first - try to find coords by basic method (typeaid)
;If no difference - gets last click coords
;If no clicks - get mouse coords
;
;Possibilities:
;[maybe] Spiral search
;[no] Look for caret image
;[maybe] Look for caret blink difference
;[maybe] If can't find caret with default method — begin capturing shots while typing

getCaretPositionFromScreenshots(){
    caretCoords := {}
    pToken := GDIP_StartUp() 

    ;caret blink rate
    ;Norm := DllCall("GetCaretBlinkTime")

    ;Send {Space}
    ;Sleep 100
    ;Send {BS}
    screenBefore := GDIP_BitmapFromScreen() ;TODO: pass window coords
    Sleep 20
    Send ■
    Sleep 20
    screenAfter := GDIP_BitmapFromScreen() ;TODO: pass window coords
    Sleep 20
    Send {BS}

    ;gdip_saveBitmapToFile(screenBefore, "screenBefore.bmp",100)
    ;gdip_saveBitmapToFile(screenAfter, "screenAfter.bmp",100)

    w := gdip_getImageWidth(screenBefore)
    h := gdip_getImageHeight(screenBefore)
    px := Gdip_GetPixel(screenBefore, 100, 100)

    ;MsgBox, W:%w% H:%h% Pixel:%px%

    ;TODO: maybe enumerator cycle?

    diffFound := 0
    foundX := 0
    foundY := 0

    ;----------Lockbits approach based on GDI
    ;TODO: improve performance by special dllcall(read man)
    ;status := gdip_LockBits(screenBefore, 0, 0, w, h, stride, scan0, bitmapData)

    status := -1

    Ptr := "UPtr"
    LockMode := 3 
    PixelFormat := 0x26200a

    ;w := 2
    ;h := 2
    
    CreateRect(Rect, 0, 0, w, h)
    VarSetCapacity(BitmapData, 16+2*4, 0)
    E := DllCall("Gdiplus\GdipBitmapLockBits", Ptr, screenBefore, Ptr, &Rect, "uint", LockMode, "int", PixelFormat, Ptr, &BitmapData)
    Stride := NumGet(BitmapData, 8, "Int")
    Scan0 := NumGet(BitmapData, 16, Ptr)

    status := E

    if (status == 0){ ;look status codes here http://msdn.microsoft.com/en-us/library/windows/desktop/ms534175(v=vs.85).aspx
        MsgBox, Stride: %stride%

        VarSetCapacity(chunk, stride)

        chunk := scan0

        MsgBox, Chunk: %chunk%

        ;Loop, %w% {
        ;    x := a_index
        ;    Loop, %h%{
        ;        y := a_index
        ;        ;px := NumGet(scan0, x * stride/4 + y , "UInt")
        ;        ;MsgBox, x%x% y%y% px%px%
        ;    }
        ;}

        ;MsgBox, "done"

    } else {
        MsgBox, Can’t lock bits, status %status%
    }

    ;Stupid loop method
    ;Loop, %w% {
    ;    x := a_index
    ;    Loop, %h%{
    ;        y := a_index
    ;        p1 := Gdip_GetPixel(screenBefore, x, y)
    ;        p2 := Gdip_GetPixel(screenAfter, x, y)
    ;        if (p1-p2 != 0) {
    ;            diffFound := 1
    ;            foundX := x
    ;            foundY := y
    ;            break
    ;        }
    ;    }
    ;    if (diffFound) {
    ;        break
    ;    }
    ;}
;
;    if (!diffFound) {
;        MsgBox, Caret not found
;    } else {
;        caretCoords["x"] := foundX
;        caretCoords["y"] := foundY
;    }

    Gdip_DisposeImage(screenBefore)
    Gdip_DisposeImage(screenAfter)
    Gdip_Shutdown(pToken) 

    return caretCoords
}



A_Caret(param, coordMode = "Relative")
{
    target_window := DllCall("GetForegroundWindow")
    If !target_window
        Return ""
    VarSetCapacity(guiThreadInfo, 48)
    NumPut(48, guiThreadInfo, 0)
    DllCall("GetGUIThreadInfo", uint, 0, str, guiThreadInfo)
    hwndCaret := NumGet(GuiThreadInfo, 28)
    If !hwndCaret
        Return ""
    top := NumGet(guiThreadInfo, 36)
    bottom := NumGet(guiThreadInfo, 44)
    If param = h
        Return bottom - top
    left := NumGet(guiThreadInfo, 32)
    right := NumGet(guiThreadInfo, 40)
    If param = w
        Return right - left

    VarSetCapacity(sPoint, 8, 0)
    NumPut(left, sPoint, 0, "Int")
    NumPut(top, sPoint, 4, "Int")

    DllCall("ClientToScreen", "UInt", hwndCaret, "UInt", &sPoint) 
    
    left := NumGet(sPoint, 0, "Int")
    top := NumGet(sPoint, 4, "Int")
    
    If coordMode = Relative
    {
        VarSetCapacity(rect, 16)
        DllCall("GetWindowRect", UInt, target_window, UInt, &rect)
        left -= NumGet(Rect, 0, True)
        top  -= NumGet(Rect, 4, True)
    }
    If param = x
        Return left
    Else
        Return top
}


