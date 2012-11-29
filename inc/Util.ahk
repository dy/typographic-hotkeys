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
;---------retrieves selected text
getSelectedText(){
    Send ^{insert}
    Sleep, 50 ;to assure copying has finished
    val := clipboard
    return val
}
;-------inserts text
insert(text){
    clipboard = %text%
    Send +{insert}
    return text
}

;-----------------------Bin testsBin testsBin tests
