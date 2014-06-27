;#SingleInstance, force

SetTitleMatchMode, 2

; Check for our file that indicates call_part1.ahk was initiated
IfNotExist, %TEMP%\_callinprogress_
   ExitApp

; Our hangouts window
WinActivate, Google+ Hangouts

IfWinActive, Google+ Hangouts
{
   ; tell user what meeting we just processed
   TrayTip, Meeting, %Clipboard%, 3

   ; Delete our indicator file
   FileDelete, %TEMP%\_callinprogress_

   ; input the meeting id
   Sleep, 1000
   SetKeyDelay, 500
   Send, %Clipboard%{#}{#}

   ; tell user that we 
   Sleep, 3000
}
