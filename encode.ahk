#Include encodeDecode.ahk

e = %1%
v := Enc_Albhed(e)
FileAppend, %v%, *
