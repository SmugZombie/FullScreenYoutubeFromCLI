# FullScreenYoutubeFromCLI
Allows launching a full screen browser window (youtube preferred) from powershell / cmd

To Run:
Powershell: .\FullScreen.exe {action} {windowtitletomatch} {cmdtorun}

Example: .\FullScreen.exe "play" "- YouTube" "chrome.exe --app=https://www.youtube.com/embed/1d9Kyh4gcqM?autoplay=1"

This will launch a full screen version, autoplaying, of the youtube link above. Running the tool again will close the previous video and start a new instance. Or, change the action to "stop" and it will kill the current instance.
