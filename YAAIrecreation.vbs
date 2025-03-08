Set WshShell = WScript.CreateObject("WScript.Shell")
Set objShell = CreateObject("Shell.Application")

' Function to run the main script when Pg Up is pressed
Sub WaitForPgUp()
    Do
        WScript.Sleep 100 ' Prevents excessive CPU usage
        If WshShell.AppActivate("Cmd") Then
            ' Listen for Pg Up key (key code 33)
            If GetAsyncKeyState(33) <> 0 Then
                WshShell.Run """C:\path\to\YAAIrecreation.vbs""" ' Change this to the actual path
                Exit Do
            End If
        End If
    Loop
End Sub

' Function to check key state
Function GetAsyncKeyState(vKey)
    Set obj = CreateObject("WScript.Shell")
    On Error Resume Next
    GetAsyncKeyState = obj.SendKeys("^{ESC}") ' Dummy action to ensure script responsiveness
    On Error GoTo 0
End Function

' Run the function on startup
WaitForPgUp()
