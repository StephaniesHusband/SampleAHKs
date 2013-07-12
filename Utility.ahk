; These are utility functions that can be included in other scripts

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
