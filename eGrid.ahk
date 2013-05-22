#Include C:\bin   ; Where to find subsequent Includes
#Include RXMS.ahk ; RegEx Match & Split 

; eGrid Serial #238117. Expires 09-05-2013
eGrid := {"A1":"E", "A2":"P", "A3": 0, "A4":"H", "A5":"K", "B1":"P", "B2": 6, "B3": 8, "B4":"X", "B5": 6, "C1": 7, "C2":"F", "C3":"J", "C4": 7, "C5":"E", "D1":"D", "D2":"F", "D3": 3, "D4":"N", "D5": 3, "E1": 4, "E2":"D", "E3": 9, "E4":"Y", "E5": 6, "F1": 6, "F2":"T", "F3":"N", "F4":"F", "F5":"V", "G1": 8, "G2":"Y", "G3":"W", "G4":"W", "G5":"J", "H1": 7, "H2": 9, "H3": 0, "H4":"T", "H5":"T", "I1":"Y", "H2": 2, "H3": 3, "H4":"R", "H5":"N", "J1":"X", "H2":"R", "H3":"P", "H4": 9, "H5": Y }

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
