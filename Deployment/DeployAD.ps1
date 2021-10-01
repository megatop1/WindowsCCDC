Install-WindowsFeature -name AD-Domain-Services
Import-module ADDSDeployment
Install-ADDSForest -DomainName "ad.ursamentors.com"
$DSRMPassword = password1!
Install-ADDSForest -DomainName "cartel.com"
Restart-Computer
