Set objShell = CreateObject("WScript.Shell")
objShell.Run "cmd /c echo Connecting to Windows 11 Secure Server... & timeout /nobreak 1"
For i = 0 to 100
    objShell.Run "cmd /c echo " & i & " | Bypassing Windows Defender... Access Granted & timeout /nobreak 0.01"
Next
objShell.Run "cmd /c echo System Breach Detected... Disconnecting... & timeout /nobreak 1"

permission = MsgBox("Do you allow this program to create files on your computer?", vbYesNo + vbQuestion, "Windows Security")

If permission = vbYes Then
    Set objFSO = CreateObject("Scripting.FileSystemObject")
    If Not objFSO.FolderExists("C:\\Log") Then
        objFSO.CreateFolder("C:\\Log")
    End If
    Set objFile = objFSO.OpenTextFile("C:\\Log\\keys.txt", 8, True)
    MsgBox "Keylogger Started! Press OK to stop.", vbInformation, "Windows Security"
    Do While True
        For Each Key In Array("A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "Space")
            If objShell.AppActivate("Keylogger") Then Exit Do
            If objShell.SendKeys("{%}" & Key) Then
                objFile.Write(Key)
            End If
        Next
        WScript.Sleep 50
    Loop
    objFile.Close
    MsgBox "Keylogger Stopped!", vbInformation, "Windows Security"
Else
    MsgBox "Permission Denied!", vbCritical, "Windows Security"
End If
