function Set-ModernAuthenticationBaseline {
    <#
    .SYNOPSIS
    Modern authentication in Exchange Online enables authentication features like multi-factor authentication (MFA), smart cards, certificate-based authentication (CBA), and third-party SAML identity providers.
    https://docs.microsoft.com/en-us/exchange/clients-and-mobile-in-exchange-online/enable-or-disable-modern-authentication-in-exchange-online
    Connect to Exchange Online via PowerShell using MFA:
    https://docs.microsoft.com/en-us/powershell/exchange/exchange-online/connect-to-exchange-online-powershell/mfa-connect-to-exchange-online-powershell?view=exchange-ps1
    .NOTES
        Author:   Adam Gell
        GitHub:   https://github.com/AdamNSTA/Microsoft-Baselines/   
    .EXAMPLE
        Set-ModernAuthenticationBaseline
        
    #>
    try {
        Write-Host -ForegroundColor Yello "Modern Authentication for Exchange Online is stronly recommended."
        $OrgConfig = Get-OrganizationConfig 
            if ($OrgConfig.OAuth2ClientProfileEnabled) {
            Write-Host "Modern Authentication for Exchange Online is already enabled"
        } else {
            Write-Host "Modern Authentication for Exchange online is not enabled"
            Set-OrganizationConfig -OAuth2ClientProfileEnabled $true
            Write-Host -ForegroundColor Yello "Modern Authentication is now enabled"
        }
    }
    catch {
        Write-Host -ForegroundColor Yellow "Make sure you are connected to Exchange Online"
        $_
    }
}
Export-ModuleMember -Function Set-ModernAuthenticationBaseline