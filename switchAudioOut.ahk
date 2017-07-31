OUT = %1%

If (OUT = "/?") {
   MsgBox, Available Parameters: USB, PC, OTHER
   Return
}

Run, mmsys.cpl 
WinWait, Sound

If (OUT = "USB") {
   ControlSend, SysListView321,{Down 3} ; USB headphones
}
Else If (OUT = "PC") {
   ControlSend, SysListView321,{Down 4} ; Laptop/PC
}
Else {
   ControlSend, SysListView321, {Down 5} ; Speakers (Normal)
}

Send, !s

ControlClick, OK 
