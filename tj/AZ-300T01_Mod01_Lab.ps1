Get-AzSubscription

$Location = 'westeurope'
$VMScaleSetName = 'stutt21'

# The VM Scale Set Name must have a length of at most 9
if ($VMScaleSetName.Length -gt 9) {
    $VMScaleSetName = $VMScaleSetName.Substring($null,"9")
}

Test-AzDnsAvailability -DomainNameLabel $VMScaleSetName -Location $Location

Get-AzVmss -VMScaleSetName $VMScaleSetName

$RgName = 'az3000101-LabRG'
Get-AzVmssVM -VMScaleSetName $VMScaleSetName -ResourceGroupName $RgName

# In der Übung macht die App den Stress, es geht aber auch so:
ssh student@40.115.54.183 -p 50000
sudo apt-get install stress
sudo stress --cpu 200 -v --timeout 300s