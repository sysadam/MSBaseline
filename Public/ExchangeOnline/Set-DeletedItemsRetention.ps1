function Set-DeletedItemsRetention {
    try {
        Get-Mailbox -ResultSize Unlimited | Set-Mailbox -RetainDeletedItemsFor 30 -verbose
        Get-Mailbox -ResultSize Unlimited | Select-Object Name, RetainDeletedItemsFor
    }
    catch {
        Write-Host -ForegroundColor Yellow "Make sure you are connected to Exchange Online"
        $_
    }
}