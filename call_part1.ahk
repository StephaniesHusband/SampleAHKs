#SingleInstance force
#Include C:\bin
#Include Utility.ahk

SetTitleMatchMode 2

; Find the Gmail tab in Firefox
FindInAnyFirefoxTab("Gmail")

; Wait for the tab to be activated
Sleep, 1000

; Get the size of Firefox window
WinGetPos,,,,height

; Subtract the height of the hangout dialer DIV to get to the input field for entering the number
InputLocY := height - 419

SendInput, g
SendInput, p
Sleep, 1000

; Click into the phone number input box in Gmail dialer DIV
MouseClick, left, 247, InputLocY, 2

SendInput, 9012636338{ENTER}

; Put the meeting number on the clipboard
Clipboard=%1%

; Touch a file to tell call_part2 whether to fire or not.
Touch("_callinprogress_", TEMP)
