function Block-POP {
    try {
        Get-CASMailbox -ResultSize Unlimited -Filter {PopEnabled -eq $True} | Set-CASMailbox -PopEnabled $False -verbose
        Get-CASMailboxPlan -Filter {PopEnabled -eq $True}| Set-CASMailboxPlan -PopEnabled $False -verbose
        Write-Host -ForegroundColor Yellow "Disabled access to POP for all users"
    }
    catch {
        Write-Host -ForegroundColor Yellow "Make sure you are connected to Exchange Online"
        $_
    }
}