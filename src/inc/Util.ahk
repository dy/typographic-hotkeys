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

;--------------------------- String methods
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

escapeHtml(text){
    ;msgbox, %text%
    Transform, text, HTML, %text% 
    return text
}

;----------------------------Clipboard helpers
clipBackup := ""
backupClipboard(){  
    global clipBackup  
    clipBackup := clipboard ;clipboardAll?
    ;msgbox, backup: %clipboard%
}
restoreClipboard(){ 
    global clipBackup
    Sleep, 1500 ;Do it always!
    clipboard := clipBackup
    ClipWait 2, 1
    clipBackup = 
}
;---------retrieves selected text
getSelectedText(cut:=false){
    clipboard := "" ; Start off empty to allow ClipWait to detect when the text has arrived.

    ;Send ^{insert}
    if (cut) {
        Send ^{VK58}
    } else {
        Send ^{VK43}
    }
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
    ;SendEvent +{insert}
	Send ^{VK56}
    return text
}

;Autohotkey comes with shit that makes different thread for different function. You can't use insert and then restore in somewhere outside
insertAndRestore(text){
    ;msgbox, insert: %text%
    clipboard := ""
    ;ClipWait, 1, 1
    clipboard = %text%
    ;clipboard = %clipboard% ;convert format to plain text
    ;Sleep, 200 ;To clean text inside []
    
    ;msgbox, Insert: %clipboard% ;this "magic" allows to make proper clipboard going.

    ClipWait, 1, 1
    ;SendEvent +{insert}
    Send ^{VK56}

    Sleep, 200 ;Do it always!
    clipboard = %clipBackup%
    ClipWait, 2, 1
    clipBackup = ""
}

;-----------------------Bin testsBin testsBin tests
