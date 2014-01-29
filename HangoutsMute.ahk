#SingleInstance force

; match title "contains" string
SetTitleMatchMode, 2

SetWorkingDir, c:\bin

; Block user mouse movement since we're dorking with the mouse pointer
BlockInput, SendAndMouse

; Add context menu items
Menu, tray, Add,
Menu, tray, Add, Toggle Mute, _ToggleMute
Menu, tray, Add, Hide, _Hide

; Global vars
CustomColor = 000000 
MuteColor=0x3744db ; reddish
MicLocX = 976
MicLocY = 786
WinTitle = Google+ Hangouts - Mozilla Firefox

;-----------------------------------------------------------------------------------------------------------------------------
; Hotkey: Windows Key + s to toggle mute
;-----------------------------------------------------------------------------------------------------------------------------
#s::
   ; if chat window up, activate it, else error out
   IfWinExist, %WinTitle%
   {
      WinActivate ; use the window found above
   }
   else
   {
      Return
      Gui, Hide
   }

   ; Send Mute Toggle keystroke
   Send, ^d

   ; take a little nap
   Sleep 600

   ToggleMute()

   ; take a little nap
   Sleep 500

   WinMinimize, %WinTitle%
Return

IsMuted()
{
   Global

   Local color

   ; what color is under the cursor now?
   PixelGetColor, color, %MicLocX%, %MicLocY%

   ; if color is red, then we're not muted
   If (color=MuteColor)
   {
      Return True
   }
   else ; we're unmuted
   {
      Return False
   }
}

;-----------------------------------------------------------------------------------------------------------------------------
; Function: CreateIcon
;-----------------------------------------------------------------------------------------------------------------------------
CreateIcon()
{
   Global

   ; Find the text
   GuiControlGet, MyText

   ; If found, destroy the window
   If ErrorLevel = 0
   {
      Gui, Destroy
   }

   ; create new window
   Gui +LastFound +AlwaysOnTop -Caption +ToolWindow
   Gui, Color, %CustomColor%
   Gui, Font, s150, WebDings
   WinMove,,,,,248,80

   ; Make window transparent
   WinSet, TransColor, %CustomColor% 75
}

;-----------------------------------------------------------------------------------------------------------------------------
; Function: ToggleMute
;-----------------------------------------------------------------------------------------------------------------------------
ToggleMute()
{
   Local b = IsMuted()

   Mute(b)
}

;-----------------------------------------------------------------------------------------------------------------------------
; Function: Mute
;-----------------------------------------------------------------------------------------------------------------------------
Mute(m)
{
   Global

   CreateIcon()

   If (m = True)
   {
      Gui, Add, Text, vMyText cRed XXXXX YYYYY +Center
      Menu, Tray, Icon, HangoutsCallMuted.Ico
      GuiControl,,MyText,x ; cross out symbol
   }
   Else
   {
      Gui, Add, Text, vMyText cLime XXXXX YYYYY +Center
      Menu, Tray, Icon, HangoutsCallUnMuted.Ico
      GuiControl,,MyText,a ; check symbol
   }

   Local xpos, ypos, width, height

   WinGetPos,xpos,ypos,width,height, %WinTitle%

   xpos:=0
   ypos:=0

   Gui,Show,x%xpos% y%ypos% w%width% h%height% NoActivate
}

;-----------------------------------------------------------------------------------------------------------------------------
; Function: Hide
;-----------------------------------------------------------------------------------------------------------------------------
Hide()
{
   Gui, Hide
}

;-----------------------------------------------------------------------------------------------------------------------------
; These are needed only for the context menu. It needs labels, not functions.
;-----------------------------------------------------------------------------------------------------------------------------
_ToggleMute:
   ToggleMute()
Return

_Hide:
   Hide()
Return
