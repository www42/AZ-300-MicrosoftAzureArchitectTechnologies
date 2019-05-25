Get-AzSubscription


# Exercise 1:  Implement prerequisites for migration of Azure VMs by using Azure Site Recovery
# --------------------------------------------------------------------------------------------

$Location = "westeurope"
$RGName = "az3000601-LabRG"
New-AzResourceGroup -Name $RGName -Location $Location

Get-AZResourceGroup | ft ResourceGroupName,Location

# upload the Azure Resource Manager template \allfiles\AZ-300T02\Module_01\azuredeploy06.json into the home directory
# upload the parameter file \allfiles\AZ-300T02\Module_01\azuredeploy06.parameters.json into the home directory

dir ~/azuredeploy06.*

New-AzResourceGroupDeployment -ResourceGroupName $RGName `
                              -TemplateFile ~/azuredeploy06.json `
                              -TemplateParameterFile ~/azuredeploy06.parameters.json
