#SingleInstance force
#Include C:\bin
#Include Utility.ahk

success := MakeCall(9012636338)

; Put the meeting number on the clipboard
Clipboard=%1%

If (success=true)
{
   ; Touch a file to tell call_part2 whether to fire or not.
   ; * This MUST get MANUALLY deleted if the call is not picked up in call_part2 !!!
   Touch("_callinprogress_", TEMP)
}
