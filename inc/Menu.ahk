;These functions and labels are related to the shown list of words
;ListView is a menu, actually: it's named so because of conformance with basic destionation
initializeMenu()
{
   global menuGui
   
   Gui, %menuGui%: -Caption +AlwaysOnTop +ToolWindow +Delimiter
   
   menuFontSize := 18
   menuFont := Arial
      
   Gui, %menuGui%:Font, s%menuFontSize%, %menuFont%

   Gui, Add, ListView, h200 w180, Symbol|Description

   Return
}

;------------------------------------------------------------------------
hideMenu()
{
   global menuGui
   Gui, %menuGui%: Hide
}


;------------------------------------------------------------------------
showMenu(data)
{
   local menuX
   local menuY
   setMenuData(data)
   Gui, %menuGui%: Show
}

;--------------------------------------Set data for the menu
setMenuData(group){
   len := strlen(group)
   Loop, %len%
   {
      ;LV_Add(, group[a_index])
   } 
}

;------------------------------------------------------------------------

CheckIfCaretNotDetectable()
{
   ;Grab the number of non-dummy monitors
   SysGet, NumMonitors, 80
   
   IfLess, NumMonitors, 1
      NumMonitors = 1
   
   ;if the X caret position is equal to the leftmost border of the monitor +1, we can't detect the caret position.
   Loop, %NumMonitors%
   {
      SysGet, Mon, Monitor, %A_Index%
      if ( A_CaretX = ( MonLeft + 1 ) )
         Return, A_CaretX
      
   }
   
   Return
}