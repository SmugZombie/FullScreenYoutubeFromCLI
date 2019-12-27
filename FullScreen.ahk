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
	;WinClose, %WindowID%
	PostMessage, 0x112, 0xF060,,, %WindowID%
	Title =
	IniWrite, %Title%, %INI%, CurrentWindow, WindowID
	;Send, {F11}
	;Send, !{f4} ; Simulates the keypress alt+f4
	ExitApp
}

if (WindowID != "") {
	; Close any current open instances
	PostMessage, 0x112, 0xF060,,, %WindowID%
}

Run, %Target%

WinWaitActive, %Title%
Winset, Alwaysontop, , A
WinGet, WindowID, ID, %Title%
IniWrite, %Title%, %INI%, CurrentWindow, WindowID
Send, {F11}
Sleep 10
;Send, {F11}
;Send, !{f4} ; Simulates the keypress alt+f4
;ExitApp

;PostMessage, 0x112, 0xF060,,, %Title%
;WinClose, %WindowID%
ExitApp
