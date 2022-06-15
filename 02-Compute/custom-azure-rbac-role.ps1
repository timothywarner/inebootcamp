# Ref: https://docs.microsoft.com/en-us/azure/role-based-access-control/tutorial-custom-role-powershell

Get-AzProviderOperation 'Microsoft.ContainerRegistry/*' | Format-Table -Property Operation, Description -AutoSize

Get-AzRoleDefinition -Name 'AcrPull' | ConvertTo-Json | Out-File 'D:\acr.json'

code D:\acr.json

Get-AzSubscription -SubscriptionName 'microsoft azure sponsorship' | Select-Object -Property id

New-AzRoleDefinition -InputFile 'D:\acr.json'

Get-AzRoleDefinition | Where-Object -FilterScript { $_.IsCustom -eq $true } | Format-Table -Property Name, IsCustom

Get-AzRoleDefinition 'ACR Developer' | Remove-AzRoleDefinition -Force

Get-AzRoleDefinition | Where-Object { $_.IsCustom -eq $true } | Remove-AzRoleDefinition -Force

Remove-AzRoleDefinition -Id '22222222-2222-2222-2222-222222222222'