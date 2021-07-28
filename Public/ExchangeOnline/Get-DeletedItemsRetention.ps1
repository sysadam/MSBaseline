function Get-DeletedItemsRetention {
    try {
        Get-Mailbox -ResultSize Unlimited | Select-Object Name, RetainDeletedItemsFor
    }
    catch {
        Write-Host -ForegroundColor Yellow "Make sure you are connected to Exchange Online"
        $_
    }
}