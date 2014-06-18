;#SingleInstance, force

SetTitleMatchMode, 2

IfNotExist, %TEMP%\_callinprogress_
   ExitApp

WinActivate, Google+ Hangouts

IfWinActive, Google+ Hangouts
{
   FileDelete, %TEMP%\_callinprogress_

   Sleep, 1000
   SetKeyDelay, 500
   Send, %Clipboard%{#}{#}

   TrayTip, Meeting, %Clipboard%, 3
   Sleep, 3000
}
