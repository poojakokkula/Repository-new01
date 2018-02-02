login-azurermaccount
New-AzureRmResourceGroup -Name Vnetcon -Location centralus
New-AzureRmVirtualNetwork -ResourceGroupName Vnetcon -Name TestVNet
-AddressPrefix 192.168.0.0/16 -Location centralus

New-AzureRmResourceGroup -Name TestResourceGroup -Location centralus
    $frontendSubnet = New-AzureRmVirtualNetworkSubnetConfig -Name frontendSubnet -AddressPrefix "10.0.1.0/24"
    $virtualNetwork = New-AzureRmVirtualNetwork -Name MyVirtualNetwork -ResourceGroupName TestResourceGroup -Location centralus -AddressPrefix "10.0.0.0/16" -Subnet $frontendSubnet
    Add-AzureRmVirtualNetworkSubnetConfig -Name backendSubnet -VirtualNetwork $virtualNetwork -AddressPrefix "10.0.2.0/24"
    $virtualNetwork | Set-AzureRmVirtualNetwork

New-AzureRmResourceGroup -Name TestResourceGroup -Location centralus
    $frontendSubnet = New-AzureRmVirtualNetworkSubnetConfig -Name frontendSubnet -AddressPrefix "10.0.1.0/24"
    $virtualNetwork = New-AzureRmVirtualNetwork -Name MyVirtualNetwork -ResourceGroupName TestResourceGroup -Location centralus -AddressPrefix "10.0.0.0/16" -Subnet $frontendSubnet
    Add-AzureRmVirtualNetworkSubnetConfig -Name backendSubnet -VirtualNetwork $virtualNetwork -AddressPrefix "10.0.2.0/24"
    $virtualNetwork | Set-AzureRmVirtualNetwork


    Get-AzureRmVirtualNetwork -Name MyVnet2 -ResourceGroupName Vnet | Add-AzureRmVirtualNetworkSubnetConfig -Name subn2 -AddressPrefix "10.0.0.48/28" | Set-AzureRmVirtualNetwork






    Remove-AzureRmVirtualNetwork -Name MyVirtualNetwork -ResourceGroupName TestResourceGroup | Set-AzureRmVirtualNetwork


Do{

Get-AzureRmVirtualNetwork -Name MyVnet1 -ResourceGroupName Vnet | Remove-AzureRmVirtualNetworkSubnetConfig -Name subnet1 |Set-AzureRmVirtualNetwork
} while(MyVnet -eq Null)


New-AzureRmResourceGroup -Name resr -Location centralus
New-AzureRmVirtualNetwork -ResourceGroupName resr -Name Virtual -AddressPrefix 192.168.0.0/16 -Location westus


$Vnet = New-AzureRmVirtualNetwork -ResourceGroupName resr -Name Virnet -AddressPrefix 172.16.0.0/16 -Location westus | Set-AzureRmVirtualNetwork
Add-AzureRmVirtualNetworkSubnetConfig -Name sub1 -VirtualNetwork $Vnet -AddressPrefix 172.16.0.0/24 | Set-AzureRmVirtualNetwork
New-AzureRmStorageAccount -ResourceGroupName Resr -AccountType mystoragename -Type "Standard_LRS" -Location "South Central US"


New-AzureRmResourceGroup -Name resc -Location "South Central US"
Get-AzureRmResourceGroup -ResourceGroupName resc
Get-AzureRmResourceGroup

New-AzureRmStorageAccount -ResourceGroupName resc -Name virtual1234 -SkuName Standard_LRS -Location "Centralus"
Get-AzureRmResource -ResourceName virtual1234 -ResourceGroupName resc

Set-AzureRmResource -Tag @{ dept="IT" ; environment="Test"} -ResourceName virtual1234 -ResourceGroupName resc -ResourceType Microsoft.Storage/storageAccounts

$tags = (Get-AzureRmResource -ResourceName virtual1234 -ResourceGroupName resc).Tags
$tags += @{status="Approved"}
Set-AzureRmResource -Tags $tags -ResourceName virtual1234 -ResourceGroupName resc -ResourceType Microsoft.Storage/storageAccounts

Find-AzureRmResource -ResourceNameContains virtual1234
Find-AzureRmResource -ResourceGroupNameContains resc
Find-AzureRmResource -TagName Dept -TagValue IT
Find-AzureRmResource -ResourceType Microsoft.Storage/storageAccounts