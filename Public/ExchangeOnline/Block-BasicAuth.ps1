## Prerequisites:
## The tenant will require any Exchange Online plan
## Connect to Exchange Online via PowerShell using MFA:
## https://docs.microsoft.com/en-us/powershell/exchange/exchange-online/connect-to-exchange-online-powershell/mfa-connect-to-exchange-online-powershell?view=exchange-ps
## WARNING: Script provided as-is. Author is not responsible for its use and application. Use at your own risk.

## Check whether modern authentication is enabled for Exchange Online, and if not, enable it:
Set-ModernAuthenticationBaseline

## Create an authentication policy to block basic authentication
function Block-BasicAuth {
    try {
        $PolicyName = "Block Basic Auth"
        $CheckPolicy = Get-AuthenticationPolicy | Where-Object { $_.Name -contains $PolicyName }
        if (!$CheckPolicy) {
            New-AuthenticationPolicy -Name $PolicyName
            Write-Host
            Write-Host -ForegroundColor Yellow "Block Basic Auth policy has been created"
            ## Set default authentication policy
            Set-OrganizationConfig -DefaultAuthenticationPolicy $PolicyName
            Write-Host -ForegroundColor Yellow "Set Block Basic Authentication as Default"

            #Assign the 'Block Basic Authentication' policy explicitly to all users
            Get-User -ResultSize unlimited | Set-User -AuthenticationPolicy "Block Basic Auth"
            Write-Host -ForegroundColor Yellow "Assigned the 'Block Basic Authentication' policy explicitly to all users"
        }
        else {
            Write-Host
            Write-Host -ForegroundColor Yellow "Block Basic Auth policy already exists"
        }

        Write-Host -Foregroundcolor Red "You can create additional authentication policies for allowing exceptions for basic authentication. See code"
    }
    catch {
        Write-Host -ForegroundColor Yellow "Make sure you are connected to Exchange Online"
        $_
    }
}


## OPTIONAL:
## Create additional authentication policies for allowing exceptions for basic authentication (e.g. for service accounts)

## EXAMPLE:
## New-AuthenticationPolicy "Allow Basic Auth Exception"

## Then use Set-AuthenticationPolicy to allow basic auth for one or more of these protocols:
## AllowBasicAuthActiveSync
## AllowBasicAuthAutodiscover
## AllowBasicAuthImap
## AllowBasicAuthMapi
## AllowBasicAuthOfflineAddressBook
## AllowBasicAuthOutlookService
## AllowBasicAuthPop
## AllowBasicAuthReportingWebServices
## AllowBasicAuthRest
## AllowBasicAuthRpc
## AllowBasicAuthSmtp
## AllowBasicAuthWebServices
## AllowBasicAuthPowershell

## Example below enables basic auth for IMAP:
## Set-AuthenticationPolicy "Allow Basic Auth Exceptions"  -AllowBasicAuthImap

## To assign the exception policy to an account use:
## $ExceptionUser = username@domain.com
## Set-User -Identity $ExceptionUser -AuthenticationPolicy "Allow Basic Auth Exceptions"

## End of script