;#Include C:\bin   ; Where to find subsequent Includes
#Include RXMS.ahk ; RegEx Match & Split 
#Include myEGrid.ahk ; This is YOUR egrid file in the form of an associative array called "eGrid"

;-----------------------------------------------------------------------------------------------------------------------------
; Function
;-----------------------------------------------------------------------------------------------------------------------------
EnterEGrid(debug=False)
{
   Global

   If (debug)
   {
      code := "Enter a response to the grid challenge [A5] [B3] [J5] using a card with serial number 238117."
   }
   Else
   {
      Clipboard =
      WinActivate, Check Point Mobile
      MouseClick, left, 195, 238
      Sleep, 1000
      SendInput, ^a
      Sleep, 500
      SendInput, ^c
      ClipWait, 2

      code := Clipboard
   }

   RXMS(code, "\[([A-Z][0-9])\]", "p mVrs")

   a := eGrid[Vrs1]
   b := eGrid[Vrs2]
   c := eGrid[Vrs3]

   If (debug)
   {
      MsgBox, a=%a%, b=%b%, c=%c%
   }
   Else
      SendInput, {TAB}%a%%b%%c%{ENTER}

   WinWaitClose
}

;EnterEGrid()
