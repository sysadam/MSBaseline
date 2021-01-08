function Set-EOBaseline {
    Block-BasicAuth 
    Block-IMAP 
    Block-POP 
    Set-AdminAuditLogConfigBaseline 
    Set-AntiPhishBaseline -ProtectAllUsers $True
    Set-DeletedItemsRetention 
    Set-ModernAuthenticationBaseline 
    Set-SafeAttachmentBaseline
    Set-Safelinks
}