New-AzureRmResourceGroup -Name NSG1 -Location eastus
New-AzureRmResourceGroup -Name NSG2 -Location eastus

$rsg="NSG1","NSG2"

foreach($r in $rsg){
#$nsg="n1","n2"
#foreach($n in $nsg){
  
  Get-AzureRmNetworkSecurityGroup  -ResourceGroupName $r | add-AzureRmNetworkSecurityRuleConfig -Name rule6565 -Protocol * -SourcePortRange * -DestinationPortRange 1433 -SourceAddressPrefix * -DestinationAddressPrefix * -Access Allow -Priority 199 -Direction Inbound | Set-AzureRmNetworkSecurityGroup

#}
}

$rule1=New-AzureRmNetworkSecurityRuleConfig -Name Rule1 -Protocol * -SourcePortRange * -DestinationPortRange 80 -SourceAddressPrefix * -DestinationAddressPrefix * -Access Allow -Direction Inbound -Priority 100
New-AzureRmNetworkSecurityGroup -Name n2 -ResourceGroupName NSG1 -Location eastus -SecurityRules $rule1

$rule2=New-AzureRmNetworkSecurityRuleConfig -Name Rule1 -Protocol * -SourcePortRange * -DestinationPortRange 80 -SourceAddressPrefix * -DestinationAddressPrefix * -Access Allow -Direction Inbound -Priority 100
New-AzureRmNetworkSecurityGroup -Name n1 -ResourceGroupName NSG2 -Location eastus -SecurityRules $rule2


