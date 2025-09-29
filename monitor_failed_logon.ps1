# monitor_failed_logons.ps1
# Look for recent failed logon events (Event ID 4625) and save a short report to Desktop

$maxEvents = 100
$outFile = Join-Path $env:USERPROFILE "Desktop\FailedLogons_$(Get-Date -Format yyyy-MM-dd_HH-mm).txt"

"Failed Logon Report - $(Get-Date)" | Out-File -FilePath $outFile -Encoding utf8
"Scanning last $maxEvents Security events for Event ID 4625..." | Out-File -FilePath $outFile -Append -Encoding utf8

try {
    $events = Get-WinEvent -FilterHashtable @{LogName='Security'; Id=4625} -MaxEvents $maxEvents -ErrorAction Stop
    if ($events.Count -eq 0) {
        "No recent failed logon events found." | Out-File -FilePath $outFile -Append -Encoding utf8
    } else {
        foreach ($e in $events) {
            $t = $e.TimeCreated.ToString("yyyy-MM-dd HH:mm:ss")
            $msg = $e.Properties | ForEach-Object { $_.Value } -join " | "
            "$t  - $msg" | Out-File -FilePath $outFile -Append -Encoding utf8
        }
    }
    "Report saved to: $outFile" | Out-File -FilePath $outFile -Append -Encoding utf8
    Write-Host "Report written to $outFile"
}
catch {
    "ERROR: Failed to read event logs. Try running PowerShell as Administrator." | Out-File -FilePath $outFile -Append -Encoding utf8
    Write-Host "ERROR: $_"
}
