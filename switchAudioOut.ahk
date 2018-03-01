OUT = %1%

If (OUT = "/?") {
   MsgBox, Available Parameters: USB, PC, OTHER
   Return
}

Run, mmsys.cpl 
WinWait, Sound

; These numbers of Down's assume you have Disabled Devices hidden in the Playback Devices dlg

If (OUT = "USB") {
   ControlSend, SysListView321,{Down 3} ; USB headphones
}
Else If (OUT = "PC") {
   ControlSend, SysListView321,{Down 4} ; Laptop/PC Speakers
}
Else {
   ControlSend, SysListView321,{Down 5} ; External Speakers
}

Send, !s

ControlClick, OK 
