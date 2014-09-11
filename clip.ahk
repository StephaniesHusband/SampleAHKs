ConInit()
ConW(Clipboard)
ConUnInit()

Return

ConInit(){
	ATTACH_PARENT_PROCESS = 0x0ffffffff ;
	DllCall("AttachConsole", "UInt", ATTACH_PARENT_PROCESS)
   conout := FileOpen("CONOUT$", "w")
}
ConUnInit(){
   conout.Close()
	DllCall("FreeConsole")
}
ConW(txt){
	conout.WriteLine(Clipboard)
}
