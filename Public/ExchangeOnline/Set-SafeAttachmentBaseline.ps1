function Set-SafeAttachmentBaseline {
    try {
        Write-Host -foregroundcolor yellow "Creating the Safe Attachments Baseline Policy..."

        ## Create the SafeAttachments policy
        ## Action options = Block | Replace | Allow | DynamicDelivery (Block is the recommended action)
        ## https://docs.microsoft.com/en-us/powershell/module/exchange/advanced-threat-protection/new-safeattachmentpolicy?view=exchange-ps
        ## Note: Optionally you can edit the below to enable Redirect, and specify a RedirectAddress--in that case set ActionOnError to $true

        $SafeAttachmentPolicyParam = @{
            'Name'             = "Safe Attachments Baseline Policy";
            'AdminDisplayName' = "Safe Attachments Baseline Policy";
            'Action'           = "Block";
            'Redirect'         = $false;
            ##'RedirectAddress' = $RedirectAddress;
            'ActionOnError'    = $false;
            'Enable'           = $true
        }

        New-SafeAttachmentPolicy @SafeAttachmentPolicyParam

        ## Create the SafeAttachments Rule 
        ## https://docs.microsoft.com/en-us/powershell/module/exchange/advanced-threat-protection/new-safeattachmentrule?view=exchange-ps

        $SafeAttachRuleParam = @{
            'Name'                 = "Safe Attachments Baseline";
            'SafeAttachmentPolicy' = "Safe Attachments Baseline Policy";
            'RecipientDomainIs'    = $RecipientDomains;
            'Enabled'              = $true;
            'Priority'             = 0
        }

        New-SafeAttachmentRule @SafeAttachRuleParam

        Write-Host -foregroundcolor yellow "The Safe Attachment Baseline Policy is deployed."

    }
    catch {
        Write-Host -ForegroundColor Yellow "Make sure you are connected to Exchange Online"
        $_
    }

}