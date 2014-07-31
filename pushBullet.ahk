#Include C:\bin
#Include Base64Encode.ahk
#Include WinHttpRequest.ahk

api_key  := "v19SIYMQyw4pSSem6Kr3zsbUy2HyEdZwBLujBsjVPh57A"
url      := "https://api.pushbullet.com/v2/devices"
data     := ""
Headers  := "Authorization: Basic " Base64Encode(api_key ":")
WinHttpRequest( url, data, Headers)

MsgBox,  % Clipboard := data

