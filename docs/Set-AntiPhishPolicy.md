---
external help file: tmp_py4py1d3.ndt-help.xml
Module Name: tmp_py4py1d3.ndt
online version:
schema: 2.0.0
---

# Set-AntiPhishPolicy

## SYNOPSIS

## SYNTAX

```
Set-AntiPhishPolicy [-EnableMailboxIntelligenceProtection <Object>] [-PhishThresholdLevel <Object>] [-Confirm]
 [-EnableTargetedDomainsProtection <Object>] [[-Identity] <Object>] [-Enabled <Object>]
 [-EnableViaTag <Object>] [-MailboxIntelligenceProtectionAction <Object>] [-TargetedDomainsToProtect <Object>]
 [-TargetedUsersToProtect <Object>] [-EnableSpoofIntelligence <Object>]
 [-EnableSimilarUsersSafetyTips <Object>] [-ExcludedDomains <Object>] [-PolicyTag <Object>]
 [-TargetedDomainActionRecipients <Object>] [-EnableMailboxIntelligence <Object>]
 [-ImpersonationProtectionState <Object>] [-TargetedDomainProtectionAction <Object>]
 [-AdminDisplayName <Object>] [-AuthenticationFailAction <Object>] [-TargetedUserProtectionAction <Object>]
 [-MailboxIntelligenceProtectionActionRecipients <Object>] [-MakeDefault]
 [-EnableSimilarDomainsSafetyTips <Object>] [-EnableTargetedUserProtection <Object>]
 [-EnableUnauthenticatedSender <Object>] [-WhatIf] [-EnableOrganizationDomainsProtection <Object>]
 [-EnableUnusualCharactersSafetyTips <Object>] [-TargetedUserActionRecipients <Object>]
 [-ExcludedSenders <Object>] [-AsJob]
```

## DESCRIPTION
{{ Fill in the Description }}

## EXAMPLES

### Example 1
```powershell
PS C:\> {{ Add example code here }}
```

{{ Add example description here }}

## PARAMETERS

### -AdminDisplayName
{{ Fill AdminDisplayName Description }}

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -AuthenticationFailAction
{{ Fill AuthenticationFailAction Description }}

```yaml
Type: Object
Parameter Sets: (All)
Aliases:
Accepted values: MoveToJmf, Quarantine

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -EnableMailboxIntelligence
{{ Fill EnableMailboxIntelligence Description }}

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -EnableMailboxIntelligenceProtection
{{ Fill EnableMailboxIntelligenceProtection Description }}

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -EnableOrganizationDomainsProtection
{{ Fill EnableOrganizationDomainsProtection Description }}

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -EnableSimilarDomainsSafetyTips
{{ Fill EnableSimilarDomainsSafetyTips Description }}

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -EnableSimilarUsersSafetyTips
{{ Fill EnableSimilarUsersSafetyTips Description }}

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -EnableSpoofIntelligence
{{ Fill EnableSpoofIntelligence Description }}

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -EnableTargetedDomainsProtection
{{ Fill EnableTargetedDomainsProtection Description }}

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -EnableTargetedUserProtection
{{ Fill EnableTargetedUserProtection Description }}

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -EnableUnauthenticatedSender
{{ Fill EnableUnauthenticatedSender Description }}

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -EnableUnusualCharactersSafetyTips
{{ Fill EnableUnusualCharactersSafetyTips Description }}

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -EnableViaTag
{{ Fill EnableViaTag Description }}

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Enabled
{{ Fill Enabled Description }}

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ExcludedDomains
{{ Fill ExcludedDomains Description }}

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ExcludedSenders
{{ Fill ExcludedSenders Description }}

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Identity
{{ Fill Identity Description }}

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ImpersonationProtectionState
{{ Fill ImpersonationProtectionState Description }}

```yaml
Type: Object
Parameter Sets: (All)
Aliases:
Accepted values: Default, Automatic, Manual, Off

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -MailboxIntelligenceProtectionAction
{{ Fill MailboxIntelligenceProtectionAction Description }}

```yaml
Type: Object
Parameter Sets: (All)
Aliases:
Accepted values: NoAction, MoveToJmf, Redirect, Quarantine, Delete, BccMessage

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -MailboxIntelligenceProtectionActionRecipients
{{ Fill MailboxIntelligenceProtectionActionRecipients Description }}

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -MakeDefault
{{ Fill MakeDefault Description }}

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -PhishThresholdLevel
{{ Fill PhishThresholdLevel Description }}

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -PolicyTag
{{ Fill PolicyTag Description }}

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TargetedDomainActionRecipients
{{ Fill TargetedDomainActionRecipients Description }}

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TargetedDomainProtectionAction
{{ Fill TargetedDomainProtectionAction Description }}

```yaml
Type: Object
Parameter Sets: (All)
Aliases:
Accepted values: NoAction, MoveToJmf, Redirect, Quarantine, Delete, BccMessage

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TargetedDomainsToProtect
{{ Fill TargetedDomainsToProtect Description }}

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TargetedUserActionRecipients
{{ Fill TargetedUserActionRecipients Description }}

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TargetedUserProtectionAction
{{ Fill TargetedUserProtectionAction Description }}

```yaml
Type: Object
Parameter Sets: (All)
Aliases:
Accepted values: NoAction, MoveToJmf, Redirect, Quarantine, Delete, BccMessage

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TargetedUsersToProtect
{{ Fill TargetedUsersToProtect Description }}

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -WhatIf
Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -AsJob
{{ Fill AsJob Description }}

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

## INPUTS

### Microsoft.Exchange.Configuration.Tasks.AntiPhishPolicyIdParameter

## OUTPUTS

### System.Object
## NOTES

## RELATED LINKS
