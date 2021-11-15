The below are download commands. Made by RJ, Credit to @TECHTONIC for creating last 3 to update to powershell 5.1. The man's a genius

#Download Sysinternals (do NOT run as admin)
(New-Object System.Net.WebClient).DownloadFile("https://download.sysinternals.com/files/SysinternalsSuite.zip", "SysinternalsSuite.zip")
./SysinternalsSuite.zip /norestart /passive 

#Download AV 
(New-Object System.Net.WebClient).DownloadFile("https://download.microsoft.com/download/A/3/8/A38FFBF2-1122-48B4-AF60-E44F6DC28BD8/enus/amd64/mseinstall.exe", "MSEinstall.exe")
./MSEinstall.exe /norestart /passive 

#Download LockHunter
(New-Object System.Net.WebClient).DownloadFile("https://www.filecroco.com/download-file/download-lockhunter/8286/574/", "lockhunter.exe")
./lockhunter.exe /norestart /passive 

#Download Google Chrome
(New-Object System.Net.WebClient).DownloadFile("", "chromeinstall.exe")

#Download Registry Policy Viewer
(New-Object System.Net.WebClient).DownloadFile("https://sdmsoftware.com/?smd_process_download=1&download_id=14958", "regviewer.exe")

#Download CMDWatcher
(New-Object System.Net.WebClient).DownloadFile("https://www.kahusecurity.com/tools/CMDWatcher_v0.3.7z", "cmdwatcher.7z")

#Download 7z

