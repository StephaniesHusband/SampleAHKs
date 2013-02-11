; These are utility functions that can be included in other scripts

GetClipboard()
{
   Clipboard=
   SendInput, ^c
   ClipWait
   id := RegExReplace(Clipboard, "^\s+|\s+$")
   Return id
}

SelectAll()
{
   SendInput, ^a ;{HOME}{SHIFTDOWN}{END}{SHIFTUP}
   Return
}
