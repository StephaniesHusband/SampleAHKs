#SingleInstance force

; match title "contains" string
SetTitleMatchMode, 2

#Include c:\bin

; block user mouse movement since we're dorking with the mouse pointer
BlockInput, SendAndMouse

Menu, Tray, Icon, gmailCallUnMuted.ico

#s::
   CustomColor = 000000 
   MuteColor=0x2d37b0 ; reddish
   MicLocX = 447
   MicLocY = 109
   WinTitle = Google+ Hangouts
   ;WinSizeX = 180
   ;WinSizeY = 375

   ; if chat window up, activate it, else error out
   IfWinExist, %WinTitle%
      WinActivate ; use the window found above
   else
      Return
      Gui, Hide

   ; set the size of the window so we know exactly where the mute button is to click
   ;WinMove,,,,,%WinSizeX%,%WinSizeY%

   ; click the mute button
   MouseMove, %MicLocX%+2, %MicLocY%
   MouseClick, left, %MicLocX%, %MicLocY%

   ; take a little nap
   Sleep 600

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

   ; take a little nap
   Sleep 500

   WinMinimize, %WinTitle%
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

   WinGetPos,xpos,ypos,width,height, %WinTitle%

   xpos:=0
   ypos:=0

   ; show the window
   Gui,Show,x%xpos% y%ypos% w%width% h%height% NoActivate

   Menu, Tray, Icon, gmailCallMuted.Ico
Return

;----------------------------------------------
UNMUTED:
   Gosub CREATEWIN

   ; add the text
   Gui, Add, Text, vMyText cLime XXXXX YYYYY +Center

   ; set the text of the control
   ;GuiControl,,MyText, UNMUTED
   GuiControl,,MyText,a

   WinGetPos,xpos,ypos,width,height,%WinTitle%

   xpos:=0
   ypos:=0

   Gui,Show,x%xpos% y%ypos% w%width% h%height% NoActivate

   Menu, Tray, Icon, gmailCallUnMuted.ico
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
