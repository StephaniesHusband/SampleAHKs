#SingleInstance force

;SetTitleMatchMode, 3 ; exact match

Menu, Tray, Icon, ubernagkill.Ico
GroupAdd, waitOnThese, (901) 263-6338 - chat - stephanieshusband@gmail.com
GroupAdd, waitOnThese, Problem Occurred
GroupAdd, waitOnThese, Trial Version
GroupAdd, waitOnThese, Error with license
GroupAdd, waitOnThese, viPlugin
GroupAdd, waitOnThese, Demo version
GroupAdd, waitOnThese, Welcome to viPlugin for Eclipse
GroupAdd, waitOnThese, Welcome to ScriptEclipse
GroupAdd, waitOnThese, VPN Client Banner
GroupAdd, waitOnThese, Microsoft Office Outlook Security Notice
GroupAdd, waitOnThese, Microsoft Outlook Security Notice
GroupAdd, waitOnThese, Java Security Warning
GroupAdd, waitOnThese, Enterprise Password
GroupAdd, waitOnThese, Login to Primavera Timesheets
GroupAdd, waitOnThese, SSO Login - 
GroupAdd, waitOnThese, loadzilla login - 
GroupAdd, waitOnThese, Information
GroupAdd, waitOnThese, Login, Sym4a.Prod.fedex.com
GroupAdd, waitOnThese, Check Point Mobile
GroupAdd, waitOnThese, SSL Certificate Verification
GroupAdd, waitOnThese, Remove Activity
GroupAdd, waitOnthese, Web Server Authentication
GroupAdd, waitOnThese, Proxy Authentication
GroupAdd, waitOnThese, WD SmartWare Drive Unlock 
GroupAdd, waitOnThese, Authentication Required
GroupAdd, waitOnThese, HP Application Lifecycle Management

#Include c:\Bin
#Include Utility.ahk
#Include UserAndPwd.ahk
#Include eGrid.ahk

doCPECLogin = true
doGmailMute = true
doQC = true

; Separator
Menu, tray, Add,
Menu, tray, Add, Reset eGrid Timer, ResetCheckPointTimer
Menu, tray, Add, Reset QC Login Timer, ResetQCLoginTimer
Menu, tray, Add, eGrid It!, RunEnterEGrid

Loop
{
   WinWaitActive, ahk_group waitOnThese

   ;---------------------------------------------------------------------------------------
   ; Needs {ENTER} only
   ;---------------------------------------------------------------------------------------
   If WinActive("Remove Activity") or WinActive("Web Server Authentication") or WinActive("Proxy Authentication")
   {
      Send, {ENTER}
      WinWaitClose
      Continue
   }
   ;---------------------------------------------------------------------------------------
   ; Needs {SPACE} only
   ;---------------------------------------------------------------------------------------
   If WinActive("Error with license") or WinActive("viPlugin") or WinActive("VPN Client Banner") or WinActive("Java Security Warning") or WinActive("Information") or WinActive("Problem Occurred") or WinActive("SSL Certificate Verification")
   {
      Send, {SPACE}
      WinWaitClose
      Continue
   }
   If WinActive("Welcome to ScriptEclipse")
   {
      Send, {ESC}
      WinWaitClose
      Continue
   }
   ;---------------------------------------------------------------------------------------
   ; Needs {ESC} only
   ;---------------------------------------------------------------------------------------
   if WinActive("Demo version") or WinActive("Welcome to viPlugin for Eclipse")
   {
      Send, {ESC}
      WinWaitClose
      Continue
   }
   ;---------------------------------------------------------------------------------------
   ; Needs "y" only
   ;---------------------------------------------------------------------------------------
   if WinActive("Microsoft Office Outlook Security Notice") or WinActive("Microsoft Outlook Security Notice")
   {
      Send, y
      WinWaitClose
      Continue
   }
   ;---------------------------------------------------------------------------------------
   ; Needs UserIdAndPassword only (no pauses)
   ;---------------------------------------------------------------------------------------
   if WinActive("SSO Login")
   {
      MouseClick, left, 650, 300
      If ClipWaitForText("Please do not bookmark this page", 8000) ; 8 seconds
      {
         ;SelectAll()
         ;Send, {SHIFT DOWN}{TAB 4}{SHIFT UP}
         Send, {TAB}
         UserIdAndPassword()
         WinWaitClose
      }
      Continue
   }
   if WinActive("Authentication Required")
   {
      SelectAll()
      UserIdAndPassword()
      WinWaitClose
      Continue
   }
   ;---------------------------------------------------------------------------------------
   ; Needs PasswordOnly only
   ;---------------------------------------------------------------------------------------
   IfWinActive, Login, Sym4a.Prod.fedex.com
   {
      PasswordOnly()
      Continue
   }
   IfWinActive, Login
   {
      PasswordOnly()
      WinWaitClose
      Continue
   }
   IfWinActive, Trial Version
   {
      ControlClick,Button1,
      Continue
   }
   IfWinActive, Login to Primavera Timesheets
   {
      Sleep, 1000
      SendInput, +{TAB}
      SelectAll()
      UserIdOnly()
      WinWaitActive
      SelectAll()
      PasswordOnly()
      Continue
   }
   IfWinActive, loadzilla login -
   {
      Send, {TAB 3}se
      UserIdAndPassword()
      WinWaitClose
      Continue
   }
   IfWinActive, Check Point Mobile
   {
      If doCPECLogin = true
      {
         doCPECLogin = false

         ; wait 5 minutes before resetting flag
         SetTimer, ResetCheckPointTimer, 30000

         PasswordOnly()

         WinWaitClose
      }
      Else
      {
         EnterEGrid()
      }
      Continue
   }
   IfWinActive, WD SmartWare Drive Unlock
   {
      Send, fedex{ENTER}
      Continue
   }
   IfWinActive, (901) 263-6338 - chat - stephanieshusband@gmail.com
   {
      If doGmailMute = true 
      {
         IfWinNotExist, GmailCallMute.ahk
         {
            Run, GmailCallMute.ahk
            Sleep, 1000
            Send, #s
            Sleep, 800
         }

         ; turn flag back on after 5 minutes
         SetTimer, ResetGmailMute, 30000
         doGmailMute = false
      }
      Continue
   }
   IfWinActive, HP Application Lifecycle Management
   {
      If doQC = true 
      {
         doQC = false

         Clipboard=

         Loop
         {
            Sleep, 500
            SelectAll()
         } Until (GetClipboard() == "263952")

         Send, {TAB}
         SelectAll()
         PasswordOnly()
      }

      Continue
   }
}

;-----------------------------------------------------
; Reset the Check Point dialog flag after a minute
;-----------------------------------------------------
ResetCheckPointTimer:
   doCPECLogin = true
Return

ResetGmailMute:
   doGmailMute = true
Return

ResetQCLoginTimer:
   doQC = true
Return

RunEnterEGrid:
   EnterEGrid()
Return
