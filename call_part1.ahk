#SingleInstance force
#Include C:\bin
#Include Utility.ahk

; I am temporarily changing the behavior of call_part1.ahk because it is the
; function/macro that's called from the shortcut.
#Include MeetingPlaceMgr.ahk

; Get out before implementing old behavior
ExitApp

success := MakeCall(9012636338)

; Put the meeting number on the clipboard
Clipboard=%1%

If (success=true)
{
   ; Touch a file to tell call_part2 whether to fire or not.
   ; * This MUST get MANUALLY deleted if the call is not picked up in call_part2 !!!
   ;Touch("_callinprogress_", TEMP)
}
