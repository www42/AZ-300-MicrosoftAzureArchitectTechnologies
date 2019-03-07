$storageAccount = (Get-AzStorageAccount -ResourceGroupName az3000201-LabRG)[0]
$keyContext = $storageAccount.Context

$sasToken = New-AzStorageBlobSASToken -Container 'labcontainer' `
                                      -Blob 'splashscreen.contrast-white_scale-400.png' `
                                      -Policy labcontainer-read -Context $keyContext

$sasContext = New-AzStorageContext $storageAccount.StorageAccountName -SasToken $sasToken

Get-AzStorageBlob -Container 'labcontainer' `
                  -Blob 'splashscreen.contrast-white_scale-400.png' `
                  -Context $sasContext

# Invalidate the SAS token by modifying its access policy                
Get-AzStorageBlob -Container 'labcontainer' `
                  -Blob 'splashscreen.contrast-white_scale-400.png' `
                  -Context $sasContext
