# Azure Policy Guest Configuration

<#
Prerequisites:
- Install the guest configuration DSC resource module from PowerShell Gallery: Install-Module -Name GuestConfiguration
- VM must have system-assigned managed identity
- VM must have guest config extension
- Use initiative "Deploy prerequisites to enable guest configuration policies on virtual machines"

Procedure:
1. Create a configuration
2. Create a config pkg artifact
3. Publish the artifact to Blob Storage
4. Assign the artifact using Azure Policy
#>

# Create a package that will audit and apply the configuration (Set)
New-GuestConfigurationPackage `
  -Name 'MyConfig' `
  -Configuration './Config/MyConfig.mof' `
  -Type AuditAndSet `
  -Force

# Publish the artifact
$Context = New-AzStorageContext -ConnectionString "DefaultEndpointsProtocol=https;AccountName=ContosoGeneral;AccountKey=< Storage Key for ContosoGeneral ends with == >;"

Set-AzStorageBlobContent -Container "guestconfiguration" -File ./MyConfig.zip -Blob "guestconfiguration" -Context $Context
