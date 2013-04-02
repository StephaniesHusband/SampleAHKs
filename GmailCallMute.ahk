#SingleInstance force

; match title "contains" string
SetTitleMatchMode, 2

; block user mouse movement since we're dorking with the mouse pointer
BlockInput, SendAndMouse

#Include, c:\bin\Utility.ahk

#s::
   CustomColor = 000000
   MuteColor=0x0000ff
   MicLocX = 156
   MicLocY = 122
   WinSizeX = 180
   WinSizeY = 375

   ; if chat window up, activate it, else error out
   IfWinExist, chat - stephanieshusband@gmail.com - Mozilla Firefox
      WinActivate ; use the window found above
   else
      Gosub, NOWINDOW

   ; set the size of the window so we know exactly where the mute button is to click
   WinMove,,,,,%WinSizeX%,%WinSizeY%

   ; click the mute button
   MouseClick, left, %MicLocX%, %MicLocY%

   ; take a little nap
   Sleep 500

   ; what color is under the cursor now?
   PixelGetColor, color, %MicLocX%, %MicLocY%

   ; if color is red, then we're not muted
   If (color=MuteColor)
   {
      Gosub MUTED
   }
   else ; we're unmuted
   {
      Gosub UNMUTED
   }
Return

#!d::

   id := GetClipboard()

   IfWinExist, chat - stephanieshusband@gmail.com - Mozilla Firefox
      WinActivate ; use the window found above
   else
      Gosub, NOWINDOW
   Sleep, 2000

   Loop, Parse, id
   {
      Send, %A_LoopField%
      Sleep, 500
   }
   Send, #
Return

;----------------------------------------------
NOWINDOW:
   MsgBox,, Error, Call window does not exist!, 3
ExitApp

;----------------------------------------------
MUTED:
   Gosub CREATEWIN

   ; add the text
   Gui, Add, Text, vMyText cRed XXXXX YYYYY +Center

   ; set the text of the control
   GuiControl,,MyText,x

   WinGetPos,xpos,ypos,width,height,chat - stephanieshusband@gmail.com - Mozilla Firefox

   xpos:=xpos-10
   ypos:=ypos+130

   ; show the window
   Gui,Show,x%xpos% y%ypos% w%width% h%height% NoActivate
Return

;----------------------------------------------
UNMUTED:
   Gosub CREATEWIN

   ; add the text
   Gui, Add, Text, vMyText cLime XXXXX YYYYY +Center

   ; set the text of the control
   ;GuiControl,,MyText, UNMUTED
   GuiControl,,MyText,a

   WinGetPos,xpos,ypos,width,height,chat - stephanieshusband@gmail.com - Mozilla Firefox

   xpos:=xpos-5
   ypos:=ypos+120

   Gui,Show,x%xpos% y%ypos% w%width% h%height% NoActivate
Return

;----------------------------------------------
CREATEWIN:
   ; find the text
   GuiControlGet,MyText

   ; if found, destroy the window
   If ErrorLevel = 0
   {
      Gui, Destroy
   }

   ; create new window
   Gui +LastFound +AlwaysOnTop -Caption +ToolWindow
   Gui, Color, %CustomColor%
   Gui, Font, s150, WebDings
   WinMove,,,,,248,80

   ; make window transparent
   WinSet, TransColor, %CustomColor% 75
Return

;----------------------------------------------
KILLWIN:
   Gui, Destroy
Return

GuiClose:
ExitApp
