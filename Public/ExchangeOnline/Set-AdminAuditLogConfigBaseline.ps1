function Set-AdminAuditLogConfigBaseline {
    <#
    .SYNOPSIS
    This will turn on the audit log inside the complaince center. 

    https://docs.microsoft.com/en-us/microsoft-365/compliance/search-the-audit-log-in-security-and-compliance?view=o365-worldwide

    Connect to Exchange Online via PowerShell using MFA:
    https://docs.microsoft.com/en-us/powershell/exchange/exchange-online/connect-to-exchange-online-powershell/mfa-connect-to-exchange-online-powershell?view=exchange-ps1

    .NOTES
        Author:   Adam Gell
        GitHub:   https://github.com/AdamNSTA/Microsoft-Baselines/   

    .EXAMPLE
        Set-AdminAuditLogConfigBaseline
        
    #>
    try {
        Set-AdminAuditLogConfig -UnifiedAuditLogIngestionEnabled $true
        Get-Mailbox -ResultSize Unlimited | Set-Mailbox -AuditEnabled $true
        Write-Host -ForegroundColor Yellow "Unified Audit Log Search is now enabled with mailbox auditing enabled" 
    }
    catch {
        Write-Host -ForegroundColor Yellow "Make sure you are connected to Exchange Online"
        $_
    }
    
}