#Include encodeDecode.ahk

UserIdOnly()
{
   Send, 263952{TAB}
}

PasswordOnly()
{
   EnvGet, e, nY22d0WD
   f := Dec_Albhed(e)
   Send, %f%{ENTER}
}

GetPassword()
{
   EnvGet, e, nY22d0WD
   f := Dec_Albhed(e)
   return %f%
}

UserIdAndPassword()
{
   UserIdOnly()
   PasswordOnly()
}

UnixPasswordOnly()
{
   EnvGet, e, iheobft
   f := Dec_Albhed(e)
   Send, %f%{ENTER}
}

UnixUserIdAndPassword()
{
   Send, se263952{TAB}
   UnixPasswordOnly()
}
