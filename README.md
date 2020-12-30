# MSBaseline
Creates recommended baselines for Microsoft 365. The module is very barebones for now.

# Get Started

Install the module from the PowerShell Gallery by running:

    Install-Module MSBaseline

If you already installed it, update to the latest version by running:

    Update-Module MSBaseline

PowerShell Gallery package link: https://www.powershellgallery.com/packages/MSBaseline/

# Usage 

### Set-DefaultBaseline365ATP

Configures a basic default AntiMalware/Antiphish policy

If your tenant has less than 60 users, you can set the flag to include all users in the impersonation protection.
### Set-AdminAuditLogConfigBaseline

Need to find if a user viewed a specific document or purged an item from their mailbox? If so, you can use the Microsoft 365 compliance center to search the unified audit log to view user and administrator activity in your organization.

This is good to turn on before you need it. It is not enabled by default. 

Follow the rest of the guide to configure permissions, https://docs.microsoft.com/en-us/microsoft-365/compliance/search-the-audit-log-in-security-and-compliance?view=o365-worldwide

### Set-ModernAuthenticationBaseline 

Modern authentication in Exchange Online enables authentication features like multi-factor authentication (MFA), smart cards, certificate-based authentication (CBA), and third-party SAML identity providers. 

---
# Reference 

I am creating functions to add to this module refering Alex's work. https://github.com/vanvfields/Microsoft-365