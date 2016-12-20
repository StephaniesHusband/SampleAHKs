#SingleInstance Force

; # Win (Windows logo key) 
; ! Alt 
; ^ Control 
; + Shift

SetTitleMatchMode, RegEx

#Include c:\bin

Menu, Tray, Icon, outlookvimctrls.ico


#IfWinActive, ^((?!Calendar).)*Outlook
#!s::Suspend   ; Assign the toggle-suspend function to a hotkey.
:*:j::{DOWN}   ; move down
:*:k::{UP}     ; move up
:*:gi::^+i     ; goto Inbox
:*:v::^+v      ; move current message to label...
:*:f::^f       ; forward current message
:*:gl::^y      ; Goto to label...
:*:/::{F3}     ; Goto the search box for current view
:*:s::^+g      ; "Star"...open the flag for follow dialog
:*:c::^n       ; New Message/Compose
:*:r::^r       ; Reply
:*:a::^+r      ; Reply All
m::            ; Toggle read/unread
if toggle := !toggle
   Send, ^u
else
   Send, ^q
return
+t::           ; permanently delete
   SendInput, +{DELETE}
   Sleep, 200
   SendInput, !y
return
t::            ; delete current message (move to trash)
Send, {DELETE}
return

#IfWinActive

#IfWinActive, Calendar - slerwin@fedex.com - Microsoft Outlook
:*:t::
   Send, ^g
   WinWaitActive, Go To Date
   Send, today{ENTER}
return
:*:d::^!1
:*:w::^!3
:*:x::!5
:*:m::^!4
#IfWinActive

;---------------------------------------------------------------------------------------------------
; Ctrl-Shift-f on Outlook appointment sends to gCal
;---------------------------------------------------------------------------------------------------
#IfWinActive, ahk_class rctrl_renwnd32
   ^+f::
      SendInput, ^f
      WinWaitActive, FW:
      Sleep, 250
      SendInput, skotterwin@gmail.com
      MouseClick, left, 133, 220 ; in the subject
      SendInput, {DELETE 4} ; delete FW:
      SendInput, {TAB 2}
      SendInput, +^{DOWN 5}
      SendInput, {DELETE}
      SendInput, ^{ENTER}
      Return
#IfWinActive
