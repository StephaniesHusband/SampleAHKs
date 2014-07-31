Base64Encode(string)
{
    ; js code from http://www.hcidata.info/base64.htm
    static js_code := "
    (LTrim
        var base64s =  ""ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"";

        function aToB64(rawData){
            var encOut = ''
            var b64 = '';
            var i = 0;
            for (var i = 0 ; i <= rawData.length - 3 ; i += 3) {
                var snipit =
                       (rawData.charCodeAt(i  ) & 0xff) << 16
                     | (rawData.charCodeAt(i+1) & 0xff) <<  8
                     | (rawData.charCodeAt(i+2) & 0xff);
                b64 +=
                    base64s.charAt(snipit >> 18 & 0x3F) +
                    base64s.charAt(snipit >> 12 & 0x3f) +
                    base64s.charAt(snipit >>  6 & 0x3f) +
                    base64s.charAt(snipit       & 0x3f);
            }
            switch (rawData.length - i) {
             case (2):
                var snipit =
                       (rawData.charCodeAt(i  ) & 0xff) << 16
                     | (rawData.charCodeAt(i+1) & 0xff) <<  8;
                b64 +=
                    base64s.charAt(snipit >> 18 & 0x3F) +
                    base64s.charAt(snipit >> 12 & 0x3f) +
                    base64s.charAt(snipit >>  6 & 0x3f) +
                    '=';
                break;
             case (1):
                var snipit =
                       (rawData.charCodeAt(i  ) & 0xff) << 16;
                b64 +=
                    base64s.charAt(snipit >> 18 & 0x3F) +
                    base64s.charAt(snipit >> 12 & 0x3f) +
                    '==';
                break;
             case (0):  // all done
                }
            return b64;
        }
    )"

    static oSC := ComObjCreate("ScriptControl")
    oSC.Language := "JScript"
    oSC.ExecuteStatement(js_code)
    Return oSC.Eval("aToB64(""" string """)")
}
