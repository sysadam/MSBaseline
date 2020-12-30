function Set-DefaultBaseline365ATP {
    <#
        .SYNOPSIS
            This script configures a new tenant with Office 365 Advanced Threat Protection Plan 1.
            In the future you can simply use the protection templates which will be available in the Security & Compliance center.
            Until then, use this to get a good baseline configuration in place.

            Connect to Exchange Online via PowerShell using MFA:
            https://docs.microsoft.com/en-us/powershell/exchange/exchange-online/connect-to-exchange-online-powershell/mfa-connect-to-exchange-online-powershell?view=exchange-ps1

        .NOTES
            Author:   Adam Gell
            GitHub:   https://github.com/AdamNSTA/Microsoft-Baselines/   
        
        .EXAMPLE
            Set-DefaultBaseline365ATP -ProtectAllUsers $True
            Set-DefaultBaseline365ATP -ProtectAllUsers $False
    #>
    [CmdletBinding()]
    Param 
    (
        [bool][Parameter(Mandatory = $false)]$ProtectAllUsers, #set this to true if you want to query Azure Ad for all users and add them to the impersonation policy. 
        $TargetedUserProtectionAction = 'Quarantine', #Move the message to quarantine. Quarantined high confidence phishing messages are only available to admins. As of April 2020, quarantined phishing messages are available to the intended recipients.
        $EnableOrganizationDomainsProtection = $true,
        $EnableTargetedDomainsProtection = $true,
        $TargetedDomainProtectionAction = 'MoveToJmf',
        $EnableSimilarUsersSafetyTips = $true,
        $EnableSimilarDomainsSafetyTips = $true,
        $EnableUnusualCharactersSafetyTips = $true,
        $EnableMailboxIntelligence = $true,
        $EnableMailboxIntelligenceProtection = $true,
        $MailboxIntelligenceProtectionAction = 'MoveToJmf', #Deliver the message to the recipient's mailbox, and move the message to the Junk Email folder.
        #$EnableAntispoofEnforcement = $true,
        $EnableUnauthenticatedSender = $true,
        $AuthenticationFailAction = 'MoveToJmf', #Deliver the message to the recipient's mailbox, and move the message to the Junk Email folder.
        $PhishThresholdLevel = 2,
        $Enabled = $true
    )
    try {
        $AcceptedDomains = Get-AcceptedDomain
        $RecipientDomains = $AcceptedDomains.DomainName

        $PhishPolicyParam = @{
            'EnableOrganizationDomainsProtection' = $EnableOrganizationDomainsProtection;
            'EnableTargetedDomainsProtection'     = $EnableTargetedDomainsProtection
            'TargetedDomainsToProtect'            = $RecipientDomains;
            'TargetedDomainProtectionAction'      = $TargetedDomainProtectionAction
            'EnableSimilarUsersSafetyTips'        = $EnableSimilarUsersSafetyTips;
            'EnableSimilarDomainsSafetyTips'      = $EnableSimilarDomainsSafetyTips;
            'EnableUnusualCharactersSafetyTips'   = $EnableUnusualCharactersSafetyTips;
            'EnableMailboxIntelligence'           = $EnableMailboxIntelligence;
            'EnableMailboxIntelligenceProtection' = $EnableMailboxIntelligenceProtection;
            'MailboxIntelligenceProtectionAction' = $MailboxIntelligenceProtectionAction;
            #'EnableAntispoofEnforcement' = $EnableAntispoofEnforcement; #this param is in the doc but it doesn't work https://github.com/MicrosoftDocs/office-docs-powershell/issues/4261
            'EnableUnauthenticatedSender'         = $EnableUnauthenticatedSender;
            'AuthenticationFailAction'            = $AuthenticationFailAction;
            'PhishThresholdLevel'                 = $PhishThresholdLevel;
            'Enabled'                             = $Enabled
            
        }

        if ([bool]$ProtectAllUsers -eq $True) {
            $Answer = Read-Host "This will add all users to the impersonation policy. If you have more than 60 users this will fail. Type Y or N and press Enter to continue"
            if ($Answer -eq 'y' -or $Answer -eq 'yes') {
                #query all users
                $upn = get-msoluser | Select-Object DisplayName, UserPrincipalName
                #fill object with correct syntax 
                $TargetedUsersToProtect = foreach ($n in $upn) { $n.DisplayName, $n.UserPrincipalName -join ";" };
                Write-Host -ForegroundColor green "Added $(($TargetedUsersToProtect).Count) to users to protect section in the policy"
            
                Set-AntiPhishPolicy -Identity "Office365 AntiPhish Default" -EnableTargetedUserProtection $True -TargetedUsersToProtect $TargetedUsersToProtect -TargetedUserProtectionAction $TargetedUserProtectionAction @PhishPolicyParam
            }
            else {
                break;
            }
        }
        else {
            Set-AntiPhishPolicy -Identity "Office365 AntiPhish Default" @PhishPolicyParam
        }

    }
    catch {
        Write-Host -ForegroundColor Yellow "Make your have are connected to Exchange Online"
        $_
    }
}

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
        Write-Host -ForegroundColor Yello "Unified Audit Log Search is now enabled with mailbox auditing enabled" 
    }
    catch {
        Write-Host -ForegroundColor Yellow "Make your have are connected to Exchange Online"
        $_
    }
    
}


#Testing
#Connect-ExchangeOnline
#Connect-MsolServic