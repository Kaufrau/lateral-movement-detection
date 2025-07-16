OS hardening steps
# Generate a quick script block event
Invoke-Expression 'Write-Host "Hello"'

# Check latest ScriptBlock log
Get-WinEvent -LogName "Microsoft-Windows-PowerShell/Operational" |
  Where-Object { $_.Id -eq 4104 } |
  Select-Object -First 1 -Property TimeCreated,Message