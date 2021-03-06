#SingleInstance force

;SetTitleMatchMode, 3 ; exact match

Menu, Tray, Icon, ubernagkill.Ico
GroupAdd, waitOnThese, Skype for Business
GroupAdd, waitOnThese, McAfee Customer Submission
GroupAdd, waitOnThese, meetup.fedex.com says
GroupAdd, waitOnThese, Clear Browser Cache ; Internet Explorer prompt
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
;GroupAdd, waitOnThese, loadzilla login - 
GroupAdd, waitOnThese, Information
GroupAdd, waitOnThese, Login, Sym4a.Prod.fedex.com
;GroupAdd, waitOnThese, Check Point Mobile
GroupAdd, waitOnThese, SSL Certificate Verification
GroupAdd, waitOnThese, Remove Activity
GroupAdd, waitOnthese, Web Server Authentication
GroupAdd, waitOnThese, Proxy Authentication
GroupAdd, waitOnThese, WD SmartWare Drive Unlock 
GroupAdd, waitOnThese, HP Application Lifecycle Management
GroupAdd, waitOnThese, Authentication Required

#Include c:\Bin
#Include Utility.ahk
#Include UserAndPwd.ahk

doCPECLogin = true
doQC = true

; Separator
Menu, tray, Add,
;Menu, tray, Add, Reset eGrid Timer, ResetCheckPointTimer
Menu, tray, Add, Reset QC Login Timer, ResetQCLoginTimer
Menu, tray, Add, Turn OFF QC Login Timer, TurnOffQCLoginTimer
;Menu, tray, Add, eGrid It!, RunEnterEGrid

Loop
{
   WinWaitActive, ahk_group waitOnThese

   If WinActive("Add my task")
   {
      Run, c:\bin\newTask.ahk
      
      Sleep, 3000

      Continue
   }
   If WinActive("Authentication Required") 
   {
      SelectAll()
      UserIdAndPassword()
      Continue
   }
   ;---------------------------------------------------------------------------------------
   ; Needs {ENTER} only
   ;---------------------------------------------------------------------------------------
   If WinActive("Remove Activity") or WinActive("Web Server Authentication") or WinActive("Proxy Authentication") or WinActive("meetup.fedex.com says")
   {
      Send, {ENTER}
      WinWaitClose
      Continue
   }
   ;---------------------------------------------------------------------------------------
   ; Needs {SPACE} only
   ;---------------------------------------------------------------------------------------
   If WinActive("Error with license") or WinActive("viPlugin") or WinActive("VPN Client Banner") or WinActive("Java Security Warning") or WinActive("Information") or WinActive("Problem Occurred") or WinActive("SSL Certificate Verification") or WinActive("McAfee Customer Submission")
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
   if WinActive("Clear Browser Cache") or WinActive("Microsoft Office Outlook Security Notice") or WinActive("Microsoft Outlook Security Notice")
   {
      Send, y
      WinWaitClose
      Continue
   }
   ;---------------------------------------------------------------------------------------
   ; Needs UserIdAndPassword only (no pauses)
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
   IfWinActive, loadzilla login -
   {
      Send, {TAB 3}se
      UserIdAndPassword()
      WinWaitClose
      Continue
   }
;  IfWinActive, Check Point Mobile
;  {
;     If doCPECLogin = true
;     {
;        doCPECLogin = false

;        ; wait 5 minutes before resetting flag
;        SetTimer, ResetCheckPointTimer, 30000

;        PasswordOnly()

;        Clipboard=

;        WinWaitClose
;     }
;     Else
;     {
;        ;EnterEGrid()

;        ClipWait, 15

;        if (RegExMatch(Clipboard, "\d{6}")) {
;           WinActivate, Check Point Mobile
;           SendInput, Clipboard{ENTER}
;           WinWaitClose
;        }
;     }
;     Continue
;  }
   IfWinActive, WD SmartWare Drive Unlock
   {
      Send, fedex{ENTER}
      Continue
   }
}

;-----------------------------------------------------
; Reset the Check Point dialog flag after a minute
;-----------------------------------------------------
;ResetCheckPointTimer:
;   SetTimer, ResetCheckPointTimer, Off
;   doCPECLogin = true
;Return

ResetQCLoginTimer:
   doQC = true
Return

TurnOffQCLoginTimer:
   doQC = false
Return

;RunEnterEGrid:
;   EnterEGrid()
;Return
