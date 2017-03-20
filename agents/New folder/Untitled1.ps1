cd 'C:\Program Files\Winlogbeat'
#PowerShell.exe -ExecutionPolicy UnRestricted -File .\install-service-winlogbeat.ps1
scripts\import_dashboards.exe -es http://222.255.166.70:9200
#.\metricbeat.exe
 #.\metricbeat.exe -c metricbeat.yml -e -v -d "*"
Invoke-WebRequest -Method Put -InFile winlogbeat.template.json -Uri http://222.255.166.70:9200/_template/winlogbeat?pretty
