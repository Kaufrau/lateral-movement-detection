auditpol /set /category:* /success:enable /failure:enable
wevtutil sl Security /ms:102400
wevtutil sl "microsoft-windows-sysmon/Operational" /ms:102400
secedit /export /areas SECURITYPOLICY /cfg C:\Tools\secpol_backup.inf
auditpol /backup /file:docs/auditpol_backup.csv