;These functions and labels are related to the active window


; Timed function to detect change of focus (and remove ListBox when changing active window) 
Winchanged: 
   ;make sure we are in decimal format in case ConvertWordToAscii was interrupted
   IfEqual, A_FormatInteger, H
      SetFormat,Integer,D
   
   WinGet, Temp_Id, ID, A
   IfEqual, A_id, %Temp_Id%
   {
      IfNotEqual, DetectMouseClickMove, On 
      {
         IfNotEqual, OldCaretY,
         {
            if ( OldCaretY != HCaretY() )
            {
               CloseListBox()
            }
         }
      }
      
   } else {
            A_id := GetIncludedActiveWindow()
         }
   
   Temp_Id = 
   Return
   
;------------------------------------------------------------------------

GetIncludedActiveWindow()
{
   ;make sure we are in decimal format in case ConvertWordToAscii was interrupted
   IfEqual, A_FormatInteger, H
      SetFormat,Integer,D
   global Helper_id
   global A_id
   global LastActiveIdBeforeHelper
   global ListBox_ID
   global MouseWin_ID
   Process, Priority,,Normal
   ;Wait for Included Active Window
   
   Loop
   {
      WinGet, ActiveId, ID, A
      IfEqual, ActiveId, 
      {
         IfNotEqual, MouseWin_ID,
            IfEqual, MouseWin_ID, %ListBox_ID% 
            {
               WinActivate, ahk_id %A_ID%
               Return, A_ID
            }
         
               
         Suspend, On
         CloseListBox()
         MaybeSaveHelperWindowPos()
         ;Wait for an active window, then check again
         ;Wait for any window to be active
         WinWaitActive, , , , ZZZYouWillNeverFindThisStringInAWindowTitleZZZ
         Continue
      }
      IfEqual, ActiveId, %Helper_id%
         Break
      IfEqual, ActiveId, %ListBox_ID%
         Break
      WinGet, ActiveProcess, ProcessName, ahk_id %ActiveId%
      WinGetTitle, ActiveTitle, ahk_id %ActiveId%
      If CheckForActive(ActiveProcess,ActiveTitle)
         Break
      Suspend, On
      CloseListBox()
      MaybeSaveHelperWindowPos()
      WinWaitNotActive, ahk_id %ActiveId%
      ActiveId =       
   }

   IfEqual, ActiveID, %ListBox_ID%
      Return, ActiveID


   ;if we are in the Helper Window, we don't want to re-enable script functions
   IfNotEqual, ActiveId, %Helper_id%
   {
      ; Check to see if we need to reopen the helper window
      MaybeOpenOrCloseHelperWindow(ActiveProcess,ActiveTitle,ActiveId)
      Suspend, Off
      ;Set the process priority back to High
      Process, Priority,,High
      LastActiveIdBeforeHelper = %ActiveId%
      
   } else {
            IfNotEqual, A_id, %Helper_id%
               LastActiveIdBeforeHelper = %A_id%               
         }
   
   global LastInput_Id
   ;Show the ListBox if the old window is the same as the new one
   IfEqual, ActiveId, %LastInput_Id%
   {
      WinWaitActive, ahk_id %LastInput_id%,,0
      ;Check Caret Position again
      MouseButtonClick=LButton
      Gosub, CheckForCaretMove
      ShowListBox()      
   } else {
            CloseListBox()
         }
   Return, ActiveId
}

CheckForActive(ActiveProcess,ActiveTitle)
{
   ;Check to see if the Window passes include/exclude tests
   global ExcludeProgramExecutables
   global ExcludeProgramTitles
   global IncludeProgramExecutables
   global IncludeProgramTitles
   
   Loop, Parse, ExcludeProgramExecutables, |
   {
      IfEqual, ActiveProcess, %A_LoopField%
         Return,
   }
   
   Loop, Parse, ExcludeProgramTitles, |
   {
      IfInString, ActiveTitle, %A_LoopField%
         Return,
   }

   IfEqual, IncludeProgramExecutables,
   {
      IfEqual, IncludeProgramTitles,
         Return, 1
   }

   Loop, Parse, IncludeProgramExecutables, |
   {
      IfEqual, ActiveProcess, %A_LoopField%
         Return, 1
   }

   Loop, Parse, IncludeProgramTitles, |
   {
      IfInString, ActiveTitle, %A_LoopField%
         Return, 1
   }

   Return, 
}

;------------------------------------------------------------------------
      
ReturnWinActive()
{
   global A_id
   WinGet, Temp_id, ID, A
   Return, ( A_id = Temp_id )
}
