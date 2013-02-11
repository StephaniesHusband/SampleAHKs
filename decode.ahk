#Include encodeDecode.ahk

e = %1%
v := Dec_Albhed(e)
FileAppend, %v%, *
