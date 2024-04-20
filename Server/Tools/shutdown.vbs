' Define window titles
WindowTitle1 = "mangosd.exe"    ' mangosd / Server Window
WindowTitle2 = "SPP - "         ' SPP Launcher

' Get the directory of the currently running script
scriptDirectory = Left(WScript.ScriptFullName, InStrRev(WScript.ScriptFullName, "\") - 1)

' Define log file path in the script directory
logFilePath = scriptDirectory & "\ShutdownLogFile.log"

' Function to write log messages to a file
Sub WriteToLog(message)
    Dim objFSO, objLogFile
    Set objFSO = CreateObject("Scripting.FileSystemObject")
    If objFSO.FileExists(logFilePath) Then
        Set objLogFile = objFSO.OpenTextFile(logFilePath, 8, True)
    Else
        Set objLogFile = objFSO.CreateTextFile(logFilePath)
    End If
    objLogFile.WriteLine Now() & " - " & message
    objLogFile.Close
End Sub

' Function to activate window by title - This isn't used but good to have for testing
Function ActivateWindow(windowTitle)
    Set objShell = CreateObject("WScript.Shell")
    objShell.AppActivate windowTitle
    WriteToLog "Activating window: " & windowTitle
    WScript.Sleep 500 ' Wait for the window to activate
End Function

' Function to check if a cmd.exe window exists by title and send keys if found
Sub ActivateCmdWindow(windowTitle)
    Set objShell = CreateObject("WScript.Shell")
    Set colTasks = objShell.Exec("tasklist /v /fi ""imagename eq cmd.exe"" /fo list").StdOut
    cmdWindowFound = False ' Flag to track if the cmd window is found

    Do While Not colTasks.AtEndOfStream
        line = colTasks.ReadLine()
        If InStr(1, line, "Window Title:", vbTextCompare) > 0 Then
            cmdWindowTitle = Trim(Mid(line, Len("Window Title:") + 1))
            If InStr(1, cmdWindowTitle, windowTitle, vbTextCompare) > 0 Then
                objShell.AppActivate cmdWindowTitle
                objShell.SendKeys "0{ENTER}"
                cmdWindowFound = True ' Update flag if the window is found
                Exit Do
            End If
        End If
    Loop
	
    If Not cmdWindowFound Then
        Set colProcesses = GetObject("winmgmts:\\.\root\CIMV2").ExecQuery("SELECT * FROM Win32_Process WHERE Name='cmd.exe'")
        For Each objProcess In colProcesses
            objShell.AppActivate objProcess.ProcessID
            objShell.SendKeys "0{ENTER}"
            cmdWindowFound = True ' Update flag if the window is found
            Exit For
        Next
    End If

    ' Logging based on whether the cmd window is found or not
    If cmdWindowFound Then
        WriteToLog "Cmd window containing '" & windowTitle & "' found. (Windows Console Host)"
    Else
        WriteToLog "Cmd window containing '" & windowTitle & "' not found."
    End If
End Sub

' Function to check if a window exists by title
Function DoesWindowExist(windowTitle)
    Set objWMIService = GetObject("winmgmts:\\.\root\CIMV2")
    Set colProcesses = objWMIService.ExecQuery("SELECT * FROM Win32_Process WHERE CommandLine LIKE '%" & windowTitle & "%'")
    Set objShell = CreateObject("WScript.Shell")

    ' Check if a process with the specified window title exists
    If colProcesses.Count > 0 Then
        DoesWindowExist = True
		WriteToLog "Window found: " & windowTitle
        Exit Function
    End If

    ' Attempt to activate the window using AppActivate
    if objshell.appactivate(windowTitle) then
        doeswindowexist = true ' window exists if it can be activated
		WriteToLog "Window found: " & windowTitle
    else
        doeswindowexist = false ' window does not exist if appactivate fails
		WriteToLog "Window not found: " & windowTitle
    end if
End Function

' Function to send keys to the active window
Sub SendKeysIfWindowExists(windowTitle, keys)
    If DoesWindowExist(windowTitle) Then
        Set objShell = CreateObject("WScript.Shell")
        objShell.AppActivate windowTitle
        objShell.SendKeys keys
        WriteToLog "Sent keys: " & keys
    Else
        WriteToLog "Window '" & windowTitle & "' not found."
    End If
End Sub

Function SendKeysToActiveWindow(keys)
    Set objShell = CreateObject("WScript.Shell")
    objShell.SendKeys keys
	WriteToLog "Sent keys: " & keys
End Function

' Check if the 'mangosd.exe' window exists
If DoesWindowExist(WindowTitle1) Then
    ' Ensure the first window (executable) is active
    ActivateWindow(WindowTitle1)
	'SendKeysToActiveWindow "1{ENTER}"
	WScript.Sleep 1000
    SendKeysIfWindowExists WindowTitle1, ".ser shut 0{ENTER}"
End If
