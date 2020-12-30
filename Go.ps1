#Import module 
Import-Module MSBaseline
#Run functions 
Set-DefaultBaseline365ATP -ProtectAllUsers $False
Set-AdminAuditLogConfigBaseline
Set-ModernAuthenticationBaseline 