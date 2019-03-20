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