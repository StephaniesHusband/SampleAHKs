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
<<<<<<< HEAD
      Sleep, 1000
      ;ControlSend,,^a,ahk_class QWidget
      SendInput, ^a
      Sleep, 1000
      ;ControlSend,,^c,ahk_class QWidget
      SendInput, ^c
=======
      ControlSend,,^a,ahk_class QWidget
      Sleep, 1000
      ControlSend,,^c,ahk_class QWidget
>>>>>>> e32fc380df7895739d248eae9bcaa1e9d0567d3b
      Sleep, 1000

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
