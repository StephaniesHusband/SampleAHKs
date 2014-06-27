#SingleInstance force
#Include C:\bin
#Include Utility.ahk

MakeCall(9012636338)

; Put the meeting number on the clipboard
Clipboard=%1%

; Touch a file to tell call_part2 whether to fire or not.
Touch("_callinprogress_", TEMP)
