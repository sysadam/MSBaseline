function Block-IMAP {
    try {
        Get-CASMailbox -ResultSize Unlimited -Filter {ImapEnabled -eq $True} | Set-CASMailbox -ImapEnabled $False -verbose
        Get-CASMailboxPlan -Filter {ImapEnabled -eq $True}| Set-CASMailboxPlan -ImapEnabled $False -verbose
        Write-Host -ForegroundColor Yellow "Disabled access to IMAP for all users"
    }
    catch {
        Write-Host -ForegroundColor Yellow "Make sure you are connected to Exchange Online"
        $_
    }
}