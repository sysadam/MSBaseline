function Set-AntiPhishBaseline {
    <#      
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
            $Answer = Read-Host "This will add all users to the impersonation policy. If you have more than 350 users this will fail. Type Y or N and press Enter to continue"
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
        Write-Host -ForegroundColor Yellow "Make sure you are connected to Exchange Online"
        $_
    }
}