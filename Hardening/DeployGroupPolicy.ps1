#The below is custom group policy objects created by RJ Pisciotta. These are great to deploy during an emergency or just for genera hardening

Import-Module ActiveDirectory
Import-Module GroupPolicy 

$domainName = Read-Host -Prompt 'Please enter your domain. Ex: example.com or ad.example.com'

#Seperate each . in the domain into its own word. ex: ad.example.com word1=ad word2=example, word3=example
$domainArray = $domainName.Split(".")


#Count number of dots (delimiter for string seperation) and store result in variable
$charCount = ($domainName.ToCharArray() | Where-Object {$_ -eq '.'} | Measure-Object).Count

#Find number of words in domains then store result into target 
If ($charCount -eq 1) {
$word1 = $domainArray[0]
$word2 = $domainArray[1]

#set the value of target for the GPLink
$target = "dc=$word1,dc=$word2"
}
ElseIf ($charCount -eq "2") {
$word1 = $domainArray[0]
$word2 = $domainArray[1]
$word3 = $domainArray[2]
#set the value of target for the GPLink
$target = "dc=$word1,dc=$word2,dc=$word3"
}
ElseIf ($charCount -eq "3") {
$word1 = $domainArray[0]
$word2 = $domainArray[1]
$word3 = $domainArray[2]
$word4 = $domainArray[3]
#set the value of target for the GPLink
$target = "dc=$word1,dc=$word2,dc=$word3,dc=$word4"
}

#The below is the name of the domain, rj, com
$beforeDot = 
$afterDot =

#Disable CMD for regular users 
New-GPO -name "DisableCMD" -domain $domainName
Set-GPRegistryValue -name "DisableCMD" -key "HKCU\Software\Policies\Microsoft\Windows\System" -ValueName "DisableCMD" -type Dword -value 00000002
New-GPLink -name "DisableCMD" -Target $target -LinkEnabled Yes 

#Disable access to registry and editing reg keys 
New-GPO -name "DisableRegAccess" -domain $domainName
Set-GPRegistryValue -name "DisableRegAccess" -key "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" -ValueName "DisableRegistryTools" -type Dword -value 00000002
New-GPLink -name "DisableRegAccess" -Target $target -LinkEnabled Yes 

#Disable LLMNR
New-GPO -name "DisableLLMNR" -domain "domainName"
Set-GPRegistryValue -name "DisableLLMNR" -key "HKLM\Software\Policies\Microsoft\Windows NT\DNSClient" -ValueName "EnableMulticast" -type Dword -value 0000000
New-GPLink -name "DisableLLMNR" -Target $target -LinkEnabled Yes

#Disable RDP (CHECK IF RDP IS SCORED?!?!?!)
#New-GPO -name "DisableRDP" -domain "domainName"
#Set-GPRegistryValue -name "DisableRDP" -key "HKLM\Software\Policies\Microsoft\Windows NT\Terminal Services" -ValueName "fDenyTSConnections" -type Dword -value 00000001
#New-GPLink -name "DisableLLMNR" -Target "dc=beforeDot,dc=afterDot" -LinkEnabled Yes

#Disable forced system restarts after updates
New-GPO -name "DisableRestarts" -domain "domainName"
Set-GPRegistryValue -name "DisableRestarts" -key "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" -ValueName "NoAutoRebootWithLoggedOnUsers" -type Dword -value 00000001
New-GPLink -name "DisableRestarts" -Target "$target -LinkEnabled Yes

#Prohibit tasks being started\stopped
New-GPO -name "DisableTaskCreation" -domain "domainName"
Set-GPRegistryValue -name "DisableTaskCreation" -key "HKLM\Software\Policies\Microsoft\Windows\Task Scheduler5.0" -ValueName "Execution" -type Dword -value 00000004
New-GPLink -name "DisableTaskCreation" -Target $target -LinkEnabled Yes

#PowerShell Execution Policy to local scripts and signed trusted scripts to execute (Currently not working)
New-GPO -name "PowershellExecution" -domain "domainName"
Set-GPRegistryValue -name "PowershellExecution" -key "HKCU\Software\Policies\Microsoft\Windows\PowerShell" -ValueName "EnableScripts" -type Dword -value 00000001
New-GPLink -name "PowershellExecution" -Target $target -LinkEnabled Yes


#Disable SMB1

#Account Lockout Policy

#Prevent Windows from storing a LAN manager hash 

#Enable NTLM Authentication Audit Logging

#Delete dumped password hashes via group policy

#Harden RDP force network level authentication 

#BLOCK MIMIKATZ by enabling LSA Protection 

#LSA Protection 

#Disable LLMNR

#Prevent task scheduling by blocking AT jobs from any user

#Disable the guest account 

#Configure Deny log on locally and Allow log on locally 

#Rename the Local Administrator account

#Secure Domain Administrator accounts (prevent domain administrators from logging on to lower privileged workstations)

#Stop programs from running in certain folders Temp folder(C:\Windows\temp) and %APPDATA%

#Account policies (Password policies and Account lockout policies)

#Local Policies - User rights assingnment:: 1. Forced shutdown from remote system (REMOVE ALL), 2. Allow logon Locally -> Administrators

#Security Options

#Disable RPC
