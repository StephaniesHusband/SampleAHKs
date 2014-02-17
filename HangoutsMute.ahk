#SingleInstance force

; match title "contains" string
SetTitleMatchMode, 2

SetWorkingDir, c:\bin

; Block user mouse movement since we're dorking with the mouse pointer
BlockInput, SendAndMouse

; Add context menu items
Menu, tray, Add,
Menu, tray, Add, Toggle Mute, _ToggleMute
Menu, tray, Add, Hide, _HideMuteIndicator

; Global vars
CustomColor = 000000 
MuteColor=0x3744db ; reddish
MicLocX = 976  ; 976 without HangoutHelper, XX with HangoutHelper
MicLocY = 786  ; 786 without HangoutHelper, YY with HangoutHelper
WinTitle = Google+ Hangouts - Mozilla Firefox

DisplayMuteIndicator()

;END Main

;-----------------------------------------------------------------------------------------------------------------------------
; Hotkey: Windows Key + s to toggle mute
;-----------------------------------------------------------------------------------------------------------------------------
#s::
   ToggleMute()

   ;WinMinimize, %WinTitle%
Return

;-----------------------------------------------------------------------------------------------------------------------------
; Function: CreateMuteIndicator
;-----------------------------------------------------------------------------------------------------------------------------
CreateMuteIndicator()
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
; Function: SetTaskBarIcon
;-----------------------------------------------------------------------------------------------------------------------------
SetTaskBarIcon(m)
{
   IfWinNotExist, %WinTitle%
   {
      Menu, tray, Icon, HangoutsHidden.ico
   }
   Else
   {
      If (m)
         Menu, tray, Icon, HangoutsCallMuted.ico
      Else
         Menu, tray, Icon, HangoutsCallUnMuted.ico
   }
}

;-----------------------------------------------------------------------------------------------------------------------------
; Function: IsMuted
;-----------------------------------------------------------------------------------------------------------------------------
IsMuted()
{
   Global
   Local color

   ; what color is under the cursor now?
   PixelGetColor, color, %MicLocX%, %MicLocY%

   ; if color is red, then we're not muted
   Return (color=MuteColor)
}

;-----------------------------------------------------------------------------------------------------------------------------
; Function: DisplayMuteIndicator
;-----------------------------------------------------------------------------------------------------------------------------
DisplayMuteIndicator()
{
   Global

   IfWinExist, %WinTitle%
   {
      CreateMuteIndicator()

      local m = IsMuted()

      If (m)
      {
         Gui, Add, Text, vMyText cRed XXXXX YYYYY +Center
         GuiControl,,MyText,x ; cross out symbol
      }
      Else
      {
         Gui, Add, Text, vMyText cLime XXXXX YYYYY +Center
         GuiControl,,MyText,a ; check symbol
      }

      ; is this absolutely necessary? can't we set position on create?
      Local xpos, ypos, width, height

      WinGetPos,xpos,ypos,width,height, %WinTitle%

      xpos:=0
      ypos:=0

      Gui,Show,x%xpos% y%ypos% w%width% h%height% NoActivate

      SetTaskBarIcon(%m%)
   }
   else
   {
      HideMuteIndicator()
   }
}

;-----------------------------------------------------------------------------------------------------------------------------
; Function: Hide
;-----------------------------------------------------------------------------------------------------------------------------
HideMuteIndicator()
{
   Gui, Hide

   SetTaskBarIcon(false)
}

;-----------------------------------------------------------------------------------------------------------------------------
; Function: ToggleMute
;-----------------------------------------------------------------------------------------------------------------------------
ToggleMute()
{
   Global

   ; if chat window up, activate it, else error out
   IfWinExist, %WinTitle%
   {
      WinActivate ; use the window found above

      WinGetPos,,,width,height, %WinTitle%

      ; These coordinates should work whether the "Add-On Bar" is visible or not.
      MicLocX := width - 49
      MicLocY := height - 60

      ; Send Toggle Mute keystroke (Ctrl-D)
      Send, ^d

      ; take a little nap
      Sleep, 1000
   }

   DisplayMuteIndicator()
}

;-----------------------------------------------------------------------------------------------------------------------------
; These are needed only for the context menu. It needs labels, not functions.
;-----------------------------------------------------------------------------------------------------------------------------
_ToggleMute:
   ToggleMute()
Return

_HideMuteIndicator:
   HideMuteIndicator()
Return
