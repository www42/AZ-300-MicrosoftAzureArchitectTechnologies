Get-AzSubscription

$password = 'Pa55w.rd1234'
$securePassword = ConvertTo-SecureString -Force -AsPlainText -String $password
$aadApp30007 = New-AzADApplication -DisplayName 'aadApp30007' -HomePage 'http://aadApp30007' -IdentifierUris 'http://aadApp30007' -Password $securePassword

New-AzADServicePrincipal -ApplicationId $aadApp30007.ApplicationId.Guid

# In the output of the New-AzureRmADServicePrincipal command, note the value of the ApplicationId property.
# You will need this in the next exercise of this lab.
$ApplicationId = '5dc0a9bc-0c44-4428-bbb3-fcfc34926659'

$SubscriptionId = Get-AzSubscription | % Id
$TenantId = Get-AzSubscription | % TenantId

Register-AzResourceProvider -ProviderNamespace Microsoft.EventGrid
Get-AzResourceProvider