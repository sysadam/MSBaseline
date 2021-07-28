function Set-Safelinks {
    try {
        ## Create the Safe Links policy for users
        ## https://docs.microsoft.com/en-us/powershell/module/exchange/advanced-threat-protection/new-safelinkspolicy?view=exchange-ps
        $AcceptedDomains = Get-AcceptedDomain
        $RecipientDomains = $AcceptedDomains.DomainName

        $SafeLinksPolicyParam=@{
            'IsEnabled' = $true;
            'Name' = "Safe Links Baseline Policy";
            'AdminDisplayName' = "Safe Links Baseline Policy";
            'EnableSafeLinksForTeams' = $true;
            'ScanUrls' = $true;
            'DeliverMessageAfterScan' = $true;
            'EnableForInternalSenders' = $true;
            'DoNotTrackUserClicks' = $true;
            'DoNotAllowClickThrough' =  $true
         }
         
        New-SafeLinksPolicy @SafeLinksPolicyParam 
        Write-Host -ForegroundColor Yellow "Created the Safe Links Baseline Policy"

        ## Create the Safe Links Rule
        ## https://docs.microsoft.com/en-us/powershell/module/exchange/advanced-threat-protection/new-safelinksrule?view=exchange-ps

        $SafeLinksRuleParam = @{
            'Name' = "Safe Links Baseline Policy";
            'SafeLinksPolicy' = "Safe Links Baseline Policy";
            'RecipientDomainIs' = $RecipientDomains;
            'Enabled' = $true;
            'Priority' = 0
        }

        New-SafeLinksRule @SafeLinksRuleParam

        Write-Host -foregroundcolor Yellow "The Safe Links Baseline Policy is deployed."

    }
    catch {
        Write-Host -ForegroundColor Yellow "Make sure you are connected to Exchange Online"
        $_
    }

}