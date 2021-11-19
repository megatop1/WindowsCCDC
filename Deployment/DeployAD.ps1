# Tested on 11/19/21
Install-WindowsFeature -name AD-Domain-Services -IncludeManagementTools
Import-module ADDSDeployment
Install-ADDSForest -DomainName "cartel.com"
$DSRMPassword = password1!
Install-ADDSForest -DomainName "cartel.com" -DomainNetBIOSName AD -Install DNS
Restart-Computer
