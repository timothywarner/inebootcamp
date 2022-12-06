# upload blob to Azure storage account
param(
  [string]$containerName,
  [string]$blobName,
  [string]$filePath
)

# get storage account key
$storageKey = (Get-AzureRmStorageAccountKey -ResourceGroupName "myResourceGroup" -Name "myStorageAccount").Value[0]

# create storage context
$storageContext = New-AzureStorageContext -StorageAccountName "myStorageAccount" -StorageAccountKey $storageKey

# upload file to blob
Set-AzureStorageBlobContent -Container $containerName -Blob $blobName -File $filePath -Context $storageContext

# download blob from Azure storage account
# Usage: blob-storage-powershell.ps1 -containerName <containerName> -blobName <blobName> -filePath <filePath>


# upload blob to Azure storage account
param(
  [string]$containerName,
  [string]$blobName,
  [string]$filePath
)

# upload file to blob
azcopy copy $filePath "https://myStorageAccount.blob.core.windows.net/$containerName/$blobName" --recursive

# upload blob to storage account with azcopy


