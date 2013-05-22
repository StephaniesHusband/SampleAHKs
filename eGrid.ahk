#Include C:\bin   ; Where to find subsequent Includes
#Include RXMS.ahk ; RegEx Match & Split 
#Include myEGrid.ahk ; This is YOUR egrid file in the form of an associative array called "eGrid"

; Example eGrid associative array where V = the actual Value at that grid point e.g., A1=V

;-----------------------------------------------------------------------------------------------------------------------------
; Function
;-----------------------------------------------------------------------------------------------------------------------------
EnterEgrid()
{
   WinActivate, Check Point Mobile
   MouseClick, left, 195, 238
   Clipboard =
   ControlSend,,^a,ahk_class QWidget
   ControlSend,,^c,ahk_class QWidget
   ClipWait,2

   code := Clipboard

   ; Example message
   ;code = Enter a response to the grid challenge [A5] [C5] [G2] using a card with serial number 238117.

   RXMS(code, "\[([A-Z][0-9])\]", "p mVars")

   a := eGrid[Vars1]
   b := eGrid[Vars2]
   c := eGrid[Vars3]

   SendInput, {TAB}%a%%b%%c%{ENTER}

   Return
}
