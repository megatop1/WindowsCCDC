Install-WindowsFeature -name AD-Domain-Services -IncludeManagementTools
Import-module ADDSDeployment
Install-ADDSForest -DomainName "cartel.com"
$DSRMPassword = password1!
Install-ADDSForest -DomainName "cartel.com"
Restart-Computer
