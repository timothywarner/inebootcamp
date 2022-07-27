# Install modules
Install-Module -Name Az -Scope CurrentUser
Install-Module -Name AzureAD # AzureADPreview

# Create a new Azure AD user (PowerShell)
# Ref: timw.info/kgs

$PasswordProfile = New-Object -TypeName Microsoft.Open.AzureAD.Model.PasswordProfile

$PasswordProfile.Password = "<Password>"

New-AzureADUser -AccountEnabled $True -DisplayName "Abby Brown" -PasswordProfile $PasswordProfile -MailNickName "AbbyB" -UserPrincipalName "AbbyB@contoso.com"

# Azure CLI
az ad user create --display-name myuser --password password --user-principal-name myuser@contoso.com

# Create a service principal with required parameter
az ad sp create-for-rbac --scopes /subscriptions/mySubscriptionID

# Create a service principal for a resource group using a preferred name and role
az ad sp create-for-rbac --name myServicePrincipalName \
                         --role reader \
                         --scopes /subscriptions/mySubscriptionID/resourceGroups/myResourceGroupName

