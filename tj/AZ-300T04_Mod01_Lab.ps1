Get-AzSubscription

$password = 'Pa55w.rd1234'
$securePassword = ConvertTo-SecureString -Force -AsPlainText -String $password
$aadApp30007 = New-AzADApplication -DisplayName 'aadApp30007' -HomePage 'http://aadApp30007' -IdentifierUris 'http://aadApp30007' -Password $securePassword

New-AzADServicePrincipal -ApplicationId $aadApp30007.ApplicationId.Guid

# In the output of the New-AzureRmADServicePrincipal command, note the value of the ApplicationId property.
# You will need this in the next exercise of this lab.
$ApplicationId = '6fe11541-1c42-4106-834f-676a7d816185'

$SubscriptionId = Get-AzSubscription | % Id
$SubscriptionId = '8e98030c-b252-4fbf-98ae-07bde0229d90'

$TenantId = Get-AzSubscription | % TenantId
$TenantId = 'd9365f9d-75c4-4fa4-8b80-566635202213'

Register-AzResourceProvider -ProviderNamespace Microsoft.EventGrid
Get-AzResourceProvider
