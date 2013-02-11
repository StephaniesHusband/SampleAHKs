;--------------------------------------------------------------------------------
; Encode/Decode Al Bhed (final fantasy)
; example
; Text=Hello Word!
; Text:=Enc_Albhed(Text)
; MsgBox % "Albhed: " Text
; Text:=Dec_Albhed(Text)
; MsgBox % "English: " Text
;--------------------------------------------------------------------------------
; Reference http://www.autohotkey.com/forum/topic30667.html
;--------------------------------------------------------------------------------

Enc_Albhed(String)
{
   StringCaseSenseSetting:=A_StringCaseSense
   StringCaseSense Off
   Albhed=ypltavkrezgmshubxncdijfoqw
   Loop, Parse, String
   {
      Ascii:=Asc(A_LoopField)
      If A_LoopField in A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z
      {
         Replace:=SubStr(Albhed, Ascii-96,1)
         If (Ascii > 64) AND (Ascii < 91) ; upper case character
         {
            Replace:=SubStr(Albhed, Ascii-64,1)
            StringUpper,Replace,Replace
         }
         TranslatedString:=TranslatedString . Replace
      }
      Else
      {
            TranslatedString:=TranslatedString . A_LoopField
      }
   }
   StringCaseSense %StringCaseSenseSetting%
   Return TranslatedString
}

Dec_Albhed(String)
{
   StringCaseSenseSetting:=A_StringCaseSense
   StringCaseSense Off
   Albhed=ypltavkrezgmshubxncdijfoqw
   Loop, Parse, String
   {
      Ascii:=Asc(A_LoopField)
      If A_LoopField in A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z
      {
         Replace:=Chr(InStr(Albhed, A_LoopField)+96)
         If (Ascii > 64) AND (Ascii < 91) ; upper case character
         {
            Replace:=Chr(InStr(Albhed, A_LoopField)+64)
            StringUpper,Replace,Replace
         }
         TranslatedString:=TranslatedString . Replace
      }
      Else
      {
         TranslatedString:=TranslatedString . A_LoopField
      }
   }
   StringCaseSense %StringCaseSenseSetting%
   Return TranslatedString
}
