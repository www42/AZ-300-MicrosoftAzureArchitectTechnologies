Get-AzSubscription

cd /
$Location = 'westeurope'

New-AzResourceGroup -Name az3000901-LabRG -Location $Location

# upload the Azure Resource Manager template \allfiles\AZ-300T03\Module_04\azuredeploy09.json into the home directory
# upload the parameter file \allfiles\AZ-300T03\Module_04\azuredeploy09.parameters.json
# upload the Azure Resource Manager template \allfiles\AZ-300T03\Module_04\customRoleDefinition09.json into the home directory
cd $HOME
dir azuredeploy09.*

New-AzResourceGroupDeployment -ResourceGroupName az3000901-LabRG -TemplateFile azuredeploy09.json -TemplateParameterFile azuredeploy09.parameters.json

$subscription_id = (Get-AzSubscription).Id
$subscription_id

(Get-Content -Path $HOME/customRoleDefinition09.json) -Replace 'SUBSCRIPTION_ID', "$subscription_id" | Set-Content -Path $HOME/customRoleDefinition09.json
cat $HOME/customRoleDefinition09.json

New-AzRoleDefinition -InputFile $HOME/customRoleDefinition09.json

Get-AzRoleDefinition -Name 'Virtual Machine Operator (Custom)'
Get-AzRoleDefinition -Name 'Virtual Machine Operator (Custom)' | % Actions


# Exercise 2: Assign and test a custom RBAC role
$domainName = ((Get-AzureAdTenantDetail).VerifiedDomains)[0].Name
$passwordProfile = New-Object -TypeName Microsoft.Open.AzureAD.Model.PasswordProfile
$passwordProfile.Password = 'Pa55w.rd1234'
$passwordProfile.ForceChangePasswordNextLogin = $false
New-AzureADUser -AccountEnabled $true -DisplayName 'lab user0901' -PasswordProfile $passwordProfile -MailNickName 'labuser0901' -UserPrincipalName "labuser0901@$domainName"
(Get-AzureADUser -Filter "MailNickName eq 'labuser0901'").UserPrincipalName

Get-AzRoleDefinition -Name Owner | % Actions
Get-AzRoleDefinition -Name "Data Box Reader" | % Actions
Get-AzRoleDefinition -Name "Data Box Reader" | % NotActions
Get-AzRoleDefinition | ft Name, Description