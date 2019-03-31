$domain = Read-Host -Prompt 'Domain to query'

$print1 = Get-WinEvent -FilterHashtable @{logname='Microsoft-Windows-DNS-Client/Operational'; id=3006} | Where-Object {$_.Message -like "*$domain*"} | Format-Table -property TimeCreated, ProcessID, Message
$print1

$process = Read-Host -Prompt 'Process to query'

Get-WinEvent -FilterXML "<QueryList><Query><Select Path='Microsoft-Windows-Sysmon/Operational'>*[System[EventID=1]] and *[EventData[Data[@Name='ProcessID']='$process']]</Select></Query></QueryList>" | Format-List TimeCreated, Message