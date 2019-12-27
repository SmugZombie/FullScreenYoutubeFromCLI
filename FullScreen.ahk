# FullScreenYoutubeFromCLI - Github.com/SmugZombie
#SingleInstance, Force
#NoTrayIcon
SetTitleMatchMode, RegEx

Action = %1%
Title = %2%
Title := Title . "$"
Target = %3%
INI := A_ScriptDir . "\FullScreenYouTube.ini"
IniRead, WindowID, %INI%, CurrentWindow, WindowID,
Version = 1.0

; If action is strictly stop, do so and quit
if (Action == "stop") {
	PostMessage, 0x112, 0xF060,,, %WindowID%
	Title =
	IniWrite, %Title%, %INI%, CurrentWindow, WindowID
	ExitApp
}

if (WindowID != "") {
	; Close any current open instances
	PostMessage, 0x112, 0xF060,,, %WindowID%
}

; Run the passed target
Run, %Target%
; Wait until its active
WinWaitActive, %Title%
; Set it to always on top
Winset, Alwaysontop, , A
; Write the window title to ini file for later use
IniWrite, %Title%, %INI%, CurrentWindow, WindowID
; Make full screen (Chrome)
Send, {F11}
; Exit this script
ExitApp
