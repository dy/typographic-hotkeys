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

;--------------------------- String case methods
toUpper(text){
    ;msgBox, %text%
    StringUpper text, text
    ;msgBox, %text%
    return text

    ;TODO: inly digits → sup
}
toLower(text){
    StringLower text, text
    return text
}

;----------------------------Clipboard helpers
clipBackup := ""
backupClipboard(){  
    global clipBackup  
    clipBackup := clipboard ;clipboardAll?
    ;msgbox, backup: %clipBackup%
}
restoreClipboard(){ 
    global clipBackup
    Sleep, 1500 ;Do it always!
    clipboard := clipBackup
    ClipWait 2, 1
    clipBackup = 
}
;---------retrieves selected text
getSelectedText(){
    clipboard =  ; Start off empty to allow ClipWait to detect when the text has arrived.

    ;TODO:
    ;list := "{ctrl down},{c down},{c up},{ctrl up}"
    ;Loop Parse, list, `,
    ;{
    ;    Sendinput, %A_LoopField%
    ;    Sleep, 40
    ;}

    Send ^{insert}
	Send ^c
    ClipWait 2, 1 ; Wait for the clipboard to contain text.
    ;Sleep, 180 ;to assure copying has finished
    val := clipboard
	;msgbox, %val%
    return val
}
;-------inserts text
insert(text){
	;msgbox, insert: %text%
    clipboard =
    ClipWait .1
    clipboard = %text%
    ;clipboard = %clipboard% ;convert format to plain text
    ClipWait .1, 1
    if ErrorLevel
    {
        MsgBox, The attempt to copy text onto the clipboard failed.
        return
    }
    ;Sleep, 1000
    ;list := "{ctrl down},{c down},{c up},{ctrl up}"
    ;Loop Parse, list, `,
    ;{
    ;    Sendinput, %A_LoopField%
    ;    Sleep, 40
    ;}
    ;SendEvent +{insert}
	Send ^v
    return text
}

;Autohotkey comes up with shit that is different thread for different function. You can't use insert and then restore in somewhere outside
insertAndRestore(text){
    ;msgbox, insert: %text%
    clipboard := ""
    ClipWait .1
    clipboard = %text%
    ;clipboard = %clipboard% ;convert format to plain text
    Sleep, 300 ;To clean text inside []
    
    msgbox, Insert: %clipboard% ;this "magic" allows to make proper clipboard going.

    ClipWait .1, 1
    ;SendEvent +{insert}
    Send ^v
    return text

    Sleep, 1500 ;Do it always!
    global clipBackup
    clipboard := clipBackup
    ClipWait 2, 1
    clipBackup = 
}

;-----------------------Bin testsBin testsBin tests
