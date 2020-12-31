## Prerequisites:
## The tenant will require any Exchange Online plan
## Connect to Exchange Online via PowerShell using MFA:
## https://docs.microsoft.com/en-us/powershell/exchange/exchange-online/connect-to-exchange-online-powershell/mfa-connect-to-exchange-online-powershell?view=exchange-ps
## WARNING: Script provided as-is. Author is not responsible for its use and application. Use at your own risk.

function Unblock-BasicAuth {
    try {
        Get-OrganizationConfig | Select-Object DefaultAuthenticationPolicy
        #I am not 100% sure setting it to Null will work, but I know it clears the flag.
        #need to test
        Set-OrganizationConfig -DefaultAuthenticationPolicy $null
    }
    catch {
        Write-Host -ForegroundColor Yellow "Make sure you are connected to Exchange Online"
        $_
    }
}


