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
