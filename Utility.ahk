#SingleInstance, force

;------------------------------------------------------------------
; These are utility functions that can be included in other scripts
;------------------------------------------------------------------

MakeCall(num)
{
   SetTitleMatchMode 2

   ; Find the Gmail tab in Firefox
   FindInAnyFirefoxTab("Gmail")

   WinActivate, Gmail

   ; Wait for the tab to be activated
   Sleep, 500

   ; click in the window to get focus
   MouseClick, left, InputLocX, InputLocY, 2

   ; Get the size of Firefox window
   WinGetPos,,,,height

   ; Subtract the height of the hangout dialer DIV to get to the input field for entering the number
   InputLocY := height - 419
   InputLocX := 380

   ; try at most 5x's to get the hangouts dialer window up
   Loop, 5
   {
      WinActivate, Gmail

      SendInput, g
      SendInput, p

      PixelGetColor, color, InputLocX, InputLocY

      ;OutputDebug, At x%InputLocX% and y%InputLocY% the color is %color%

      If (color=0xFFFFFF)
      {
         ; Click into the phone number input box in Gmail dialer DIV
         MouseClick, left, InputLocX, InputLocY, 2

         SendInput, %num%{ENTER}

         Break
      }
   }
}

Touch(f, d)
{
   Run, touch %f%, %d%, Hide
}

GetClipboard()
{
   Clipboard=
   SendInput, ^c
   ClipWait, 1
   cb := Trim(Clipboard)
   Return cb 
}

SelectAll()
{
   SendInput, ^a
   Return
}

ClipWaitForText(waitForMe, waitMax)
{
   waitInterval = 500 ; milliseconds
   waitTimer = %waitInc%

   While waitTimer < waitMax
   {
      SelectAll()
      cb := GetClipboard()

      ;MsgBox, %cb% %waitForMe%

      IfInString, cb, %waitForMe%
      {
         Return True
      }
      Else
      {
         Sleep, %waitInterval%
         waitTimer += waitInterval
      }
   }

   Return False
}

FindInFlashBuilder(what)
{
   If (what = "id" || what = "string")
   {
      wrd := GetClipboard()
      SetTitleMatchMode, 2
      WinWait, Flash Builder
      IfWinNotActive, Flash Builder, , WinActivate, Flash Builder
      WinWaitActive, Flash Builder,
      Send, ^+f
      WinWait, Search
      Send, {TAB 3}
      Send, *.as, *.mxml
      Send, {SHIFTDOWN}{TAB 3}{SHIFTUP}

      If (what = "id")
      {
         Send, id="\b%clipboard%\b"
      }
      Else If (what = "string")
      {
         Send, \b%clipboard%\b
      }
      Send, {ENTER}
   }
   Else If (what = "resourceKey")
   {
      Send, ^+f
      WinWaitActive, Search
      Send, {TAB 3}
      Send, *.properties
      Send, {SHIFTDOWN}{TAB 3}{SHIFTUP}
   }
}

;--------------------------------------------------------------------------------
; This function assumes that the Active window is a firefox window.
;
; A large delay like 400 seems to work best when heavy processing
; is going on.
; 
; Returns true if tab is found, false if not found
;
; Limitations:
;
; Two tabs that have the same name will halt the tab search for that firefox
; window.  When looping over firefox tabs, it remembers the first tab name
; and uses that to determine when its finished looping.
;
; The delay value can be tweaky.  A loop with a small sleep might be better but
; given issues I had with FindInAnyFirefoxTab, I'll wait a bit.
;--------------------------------------------------------------------------------
FindTabInActiveFirefox(TabName, SleepForTabSwitch=400)
{
	SetTitleMatchMode, 2
	WinGetActiveTitle, StartingTitle
	Loop
	{
	   IfWinActive, %TabName%
      {
         OutputDebug, FindTab: FOUND tab %TabName%
	      return true
      }
	   else
      {
	      SendInput,  {Control Down}{Tab}{Control Up}
      }

	   Sleep SleepForTabSwitch
      
      WinGetActiveTitle, CurrentTabTitle
      OutputDebug, FindTab: Current Tab is %CurrentTabTitle%

	   If (CurrentTabTitle == StartingTitle)
      {
         OutputDebug, FindTab: Found the tab! %CurrentTabTitle% %StartingTitle%
	      break
      }
	}   
   
   return false
}

;-------------------------------------------------------------------------------- 
; Iterate over all firefox windows.  Within each window iterate over
; each tab.
; 
; With lots of tabs and windows open this process can take a few
; seconds.  In order to optimize you can save (cache) the last found window id
; and it will jump to that one first to find it much quicker.  So the 
; first find might be slow.  All other finds will be fast.
; 
; Returns true if tab is found, false if not found
;
; Limitations:
;
; Two tabs that have the same name will halt the tab search for that firefox
; window.  When looping over firefox tabs, it remembers the first tab name
; and uses that to determine when its finished looping.
;-------------------------------------------------------------------------------- 
FindInAnyFirefoxTab(TabToFind, ByRef ReturnFoundId=0)
{
   SetTitleMatchMode 2

   ; First see if it is the currently active tab on any firefox windows
   IfWinExist %TabToFind%
   {
   	WinActivate
      OutputDebug, Found %TabToFind% without looping. w00t!
      return true ;found without looping
   }

   ; Try the last known window id to be good
   If ReturnFoundId > 0
   {
      OutputDebug, ReturnFoundId=%ReturnFoundId%

      IfWinExist ahk_id %ReturnFoundId%
      {
         ;OutputDebug, using cache value %ReturnFoundId%
         WinActivate
         WinWaitActive
         if (FindTabInActiveFirefox(TabToFind, 50))
         {
            return true ;found with cached value
         }
      }
   }

   OutputDebug, Loop through all firefox windows
   ; Loop through all firefox windows and all tabs
   WinGet, id, list, Firefox, , Program Manager
   Loop, %id%
   {
      StringTrimRight, this_id, id%a_index%, 0
      WinActivate, ahk_id %this_id%
      WinGetTitle, this_title, ahk_id %this_id%
      WinWaitActive, ahk_id %this_id%,,2
      if ErrorLevel
      {
         OutputDebug, WinWaitActive FAILED.
      }
      ; The previous WinWaitActive seems to fail sometimes.  
      ; The following fix does a couple of retrys and seems to mostly work, but slows things down
      ; when hit a bit.  
      TryCount = 0
      Loop
      {
      	WinGetActiveTitle, StartingTitle
         if (StartingTitle <> this_title)
         {
            OutputDebug, ERROR! Trying to get %this_title%, GOT %StartingTitle%
            WinActivate, ahk_id %this_id%
            WinWaitActive, ahk_id %this_id%,,2
            ; I've never seen it take more than one try, but limit to 3
            TryCount++
            if (TryCount >= 3)
            {
               ;failed
               return false
            }
         }
         else
         {
            ; title matches - lets stop looping and continue on
            break
         }
      }
      ; OutputDebug, This is a test ahk_id %this_id% id%a_index%, Start Title is %StartingTitle%
      if (FindTabInActiveFirefox(TabToFind))
      {
         ReturnFoundId = %this_id%
         return true
      }
   }
   
   ; OutputDebug, Done
   return false
}
