#SingleInstance force

#Include C:\bin
#Include Utility.ahk
#Include UserAndPwd.ahk

Gui, Add, Text, x12 y10 w50 h20 , MP#
Gui, Add, Edit, x62 y7 w230 h20 vMeetingNum, %Clipboard%
Gui, Add, Text, x12 y40 w50 h20 , Phone #:
Gui, Add, Combobox, x62 y37 w230 h220 vPhoneNum gParsePhoneNum Choose1, 901-263-6338|Satish #901-752-2761|Seth #901-752-2721|Dan #901-626-4455|Chris #901-752-2801|Emil #608-213-7217|Rickman #901-752-2747|Varma #901-752-2758|MrWest #901-752-2727
Gui, Add, Button, x12 y70 w280 h40 gGoMP Default, Call MP and enter MP# above
Gui, Add, Button, x12 y110 w280 h40 gCallMP, Call MeetingPlace only
Gui, Add, Button, x12 y150 w280 h40 gEnterMP, Enter MP# above
Gui, Add, Button, x12 y190 w280 h40 gCallPhone, Call Phone Number above
Gui, Add, Button, x12 y230 w280 h40 gGoScreen, Open MP Screenshare for MP# above

Gui, Show, x127 y87 h283 w308, MeetingPlace Manager

Return

;---------------
; Function: goMP
;---------------
goMP:
   Gui, Submit
   StringReplace, MeetingNum, MeetingNum,%A_Space%,,All
   Run, call_part1.ahk %MeetingNum%
Return

;-----------------
; Function: callMP
;-----------------
callMP:
   Gui, Submit
   MakeCall(9012636338)
Return

;------------------
; Function: enterMP
;------------------
enterMP:
   Gui, Submit
   WinActivate, Google+ Hangouts

   IfWinActive, Google+ Hangouts
   {
      ; input the meeting id
      Sleep, 1000
      SetKeyDelay, 500
      StringReplace, MeetingNum, MeetingNum,%A_Space%,,All
      Send, %MeetingNum%{#}{#}
   }
Return

;--------------------
; Function: callPhone
;--------------------
callPhone:
   Gui, Submit
   MakeCall(%PhoneNum%)
Return

;-------------------
; Function: goScreen
;-------------------
goScreen:
   Gui, Submit
   StringReplace, MeetingNum, MeetingNum,%A_Space%,,All
   p := GetPassword()
   url := "http://meeting.web.fedex.com/mpweb/scripts/mpx.dll?id=" . MeetingNum . "&p=" . p
   Run, %url%
Return

ParsePhoneNum:
   Gui, Submit, NoHide
   StringGetPos, pos, PhoneNum, #
   num := SubStr(PhoneNum, pos+2)

   GuiControl, Text, PhoneNum, %num%

Return

GuiClose:
ExitApp
