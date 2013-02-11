#SingleInstance force
SetTitleMatchMode, 2

#Include C:\bin
#Include Utility.ahk
#Include userAndPwd.ahk

;---------------------------------------------------------------------------------------------------
; FOR REFERENCE:
;---------------------------------------------------------------------------------------------------
; Hotkey Modifiers
;    # - Windows key 
;    ! - Alt 
;    ^ - Control 
;    + - Shift
;
; SetTitleMatchMode values
;    1 - Title must start with the specified string (default)
;    2 - Title can contain string anywhere inside it to be a match
;    3 - Title must exactly match string to be a match
;---------------------------------------------------------------------------------------------------

; Reload this script
#!r::reload

; Reverse the scroll wheel in Microsoft Word so that scrolling down, zooms in and vice-versa
#IfWinActive, - Microsoft Word
^WheelDown::^WheelUp
^WheelUp::^WheelDown
#IfWinActive

;---------------------------------------------------------------------------------------------------
; Change the volume with your mouse wheel.
;---------------------------------------------------------------------------------------------------
~RButton & WheelUp:: send, {Volume_Up 1}
~RButton & WheelDown:: send, {Volume_Down 1} 

;---------------------------------------------------------------------------------------------------
; Open the given # as a meeting place id
;---------------------------------------------------------------------------------------------------
#m::
id := GetClipboard()
p := GetPassword()
url := "http://meeting.web.fedex.com/mpweb/scripts/mpx.dll?id=" . id . "&p=" . p
Run %url%
Return

;---------------------------------------------------------------------------------------------------
; Lookup the given # as a help request ticket
;---------------------------------------------------------------------------------------------------
;#t::
;id := GetClipboard()
;url := "https://request.fedex.com/Ticket/Display.html?id=" . id
;Run %url%
;Return

;---------------------------------------------------------------------------------------------------
; Yeehah the given keyword
;---------------------------------------------------------------------------------------------------
;#y::
;keyword := GetClipboard()
;url := "http://yeehah.prod.fedex.com/yeehah/Goto?keyword=" . keyword
;Run %url%
;Return

;---------------------------------------------------------------------------------------------------
; Open the given clipboard # as an employee # and get their badge picture!!
;---------------------------------------------------------------------------------------------------
;#p::
;id := GetClipboard()
;url := "https://identity.web.fedex.com/idm/badgeimage/imageServlet?l=i&t=c&u=" . id
;Run %url%
;Return

;---------------------------------------------------------------------------------------------------
; Open the given clipboard # as an ITG or SCCB depending on the length
;---------------------------------------------------------------------------------------------------
;#w::
;id := GetClipboard()
;If (StrLen(id) = 4)
;{
;   url := "http://sccb.web.fedex.com/V2/request_details.php?Submit=Go&ticket=" . id
;}
;Else
;{
;   url := "http://itg.prod.fedex.com/SymWeb/wrViewerDtl.jsp?wrNbr=" . id
;}
;Run %url%
;Return

;---------------------------------------------------------------------------------------------------
; Remap function keys
;---------------------------------------------------------------------------------------------------
#F1::
UserIdAndPassword()
Return
#F2::
PasswordOnly()
Return
#F3::
UnixPasswordOnly()
Return
; SenseAware test credentials
#IfWinActive, SenseAware
#F4::
MouseClick, left, 772, 487
SelectAll()
Send, ssvarma.sr@gmail.com{TAB}Test1234{ENTER}
Return
#F5::
MouseClick, left, 772, 487
SelectAll()
Send, srinivasareddy.k@mphasis.com{TAB}test1234{ENTER}
Return
#F6::
MouseClick, left, 772, 487
SelectAll()
Send, slerwin@fedex.com{TAB}Test1234{ENTER}
Return
#F7::
MouseClick, left, 772, 487
SelectAll()
Send, 781936@fedex.com{TAB}Test1234{ENTER}
Return
#F8::
MouseClick, left, 772, 487
SelectAll()
Send, testscott1@mailinator.com{TAB}Test1234{ENTER}
Return
#F9::
Send, Test1234
Return
#F10::
up := RegExReplace(Trim(Clipboard), "[\\/\s–-]+", "-")
StringSplit, credArray, up, -
u := Trim(credArray1)
p := Trim(credArray2)
MouseClick, left, 772, 487
SelectAll()
Send, %u%{TAB}%p%{ENTER}
Return

; Kept hitting the F1 key in Flash Builder (vi mode) and opening help, so make
; it enteer Escape (which is what I wanted) instead!
SetTitleMatchMode, 1
#IfWinActive, Flash
F1::
   Send, {ESCAPE}
   Return
#IfWinActive
SetTitleMatchMode, 2

; Find the current id in Flash Builder code. Note only works when Firebug is not
; docked!
#IfWinActive, Firebug
^F::
   wrd := GetClipboard()
   SetTitleMatchMode, 2
   WinWait, Flash Builder
   IfWinNotActive, Flash Builder, , WinActivate, Flash Builder
   WinWaitActive, Flash Builder,
   Send, ^+f
   WinWait, Search
   Send, {TAB 3}
   Send, *.as, *.mxml
   Send, {SHIFTDOWN}{TAB 3}{SHIFTUP}
   Send, \b%clipboard%\b{ENTER}
   Return
#IfWinActive

; Find current string in properties files
#IfWinActive, Flash Builder
^+p::
   Send, ^+f
   WinWait, Search
   Send, {TAB 3}
   Send, *.properties
   Send, {SHIFTDOWN}{TAB 3}{SHIFTUP}
   Return
#IfWinActive

;---------------------------------------------------------------------------------------------------
; Make up for deficiency in the SourgeForge system. Double click on an artifact
; number and it will automatically select it for you!
;---------------------------------------------------------------------------------------------------
#IfWinActive, Artifact Picker
~LButton::
   If (A_PriorHotKey = A_ThisHotKey and A_TimeSincePriorHotkey < 150)
   {
      Sleep 200   ; wait for right-click menu, fine tune for your PC
      Send, {TAB 3}{ENTER}
   }
Return
#IfWinActive

#IfWinActive, ALPS
~LButton::
   If (A_PriorHotKey = A_ThisHotKey and A_TimeSincePriorHotkey < 200)
   {
      Sleep 200   ; wait for right-click menu, fine tune for your PC
      Send, {TAB}{ENTER}
   }
Return
#IfWinActive

;---------------------------------------------------------------------------------------------------
; Ctrl-V in command prompt, pastes clipboard
;---------------------------------------------------------------------------------------------------
#IfWinActive, Cmd
^V::
   SendInput {Raw}%clipboard%
Return
#IfWinActive

#IfWinActive, Gmail
^r::
   Send, r
Return
^+r::
   Send, r
Return
#IfWinActive

;----------------------------------------------
; Google Calendar hotkeys for Outlook Calendar
;----------------------------------------------
#IfWinActive, Calendar - Microsoft Outlook
t::Send, !g!o
d::Send, ^!1
x::Send, ^!2
w::Send, ^!3
m::Send, ^!4
#IfWinActive

;---------------------------------------------------------------------------------------------------
; Fix typos or auto-expand some common data elements
;---------------------------------------------------------------------------------------------------
::bcs::because
:oc:eml::StephaniesHusband@gmail.com
:oc:26::263952

;#IfWinActive, SecureCRT
;^c::Send ^{INSERT}
;^v::Send +{INSERT}
;#IfWinActive

SetTitleMatchMode, 2
#IfWinActive Microsoft Excel
{
   ; Make tab go to the field to the right
   Tab:: Send {Enter}{Up}{Right}

   ;Tab after shift-tab had been demonstrating strange behavior; hence the following:
   +Tab:: Send {Left}
}

;Muted=true
;#s::
;VA_SetMasterMute(%Muted%, "capture")
;Muted := !%Muted%
;Return
