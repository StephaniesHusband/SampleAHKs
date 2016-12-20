OUT = %1%

If (OUT = "/?") {
   MsgBox, Available Parameters: USB, PC, OTHER
   Return
}

Run, mmsys.cpl 
WinWait, Sound

If (OUT = "USB") {
   ControlSend, SysListView321,{Down 1} ; USB headphones
}
Else If (OUT = "PC") {
   ControlSend, SysListView321,{Down 2} ; Laptop/PC
}
Else {
   ControlSend, SysListView321, {Down 3} ; Speakers (Normal)
}

ControlClick, &Set Default
ControlClick, OK 
