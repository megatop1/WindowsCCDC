#Change into sysmon directory

#Install sysmon and accept the EULA
sysmon.exe -i -n -accepteula

#Set the config for sysmon
sysmon -c config.xml
