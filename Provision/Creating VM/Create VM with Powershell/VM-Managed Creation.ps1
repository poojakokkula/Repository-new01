Login-AzureRmAccount
#Creating a Resource Group
New-AzureRmResourceGroup -ResourceGroupName myResourceGroupVM -Location EastUS

#Creating vnet and subnet
$subnetConfig = New-AzureRmVirtualNetworkSubnetConfig -Name mysubnet -AddressPrefix 192.168.1.0/24
$vnet = New-AzureRmVirtualNetwork -ResourceGroupName myResourcegroupVM -Location eastus -Name myvnet -AddressPrefix 192.168.0.0/16 -Subnet $subnetConfig

#creating public ip
$pip = New-AzureRmPublicIpAddress -ResourceGroupName myResourceGroupVM -Location eastus -AllocationMethod static -Name myPublicIPAddress

#creating n/w interface
$nic = New-AzureRmNetworkInterface -ResourceGroupName myResourceGroupVM -Location eastus -Name myNic ` -SubnetId $vnet.subnets[0].Id -PublicIpAddressId $pip.Id -NetworkSecurityGroupId $nsg.Id

#create n/w security gp
$nsgRule = New-AzureRmNetworkSecurityRuleConfig -Name myNSGRule -Protocol Tcp -Direction Inbound -Priority 1000 -SourceAddressPrefix * -SourcePortRange * -DestinationAddressPrefix * -DestinationPortRange 3389 -Access Allow
$nsg = New-AzureRmNetworkSecurityGroup -ResourceGroupName myResourceGroupVM -Location eastus -Name myNetworkSecurityGroup -SecurityRules $nsgRule
Set-AzureRmVirtualNetworkSubnetConfig -Name mysubnet11 -VirtualNetwork $vnet -NetworkSecurityGroup $nsg -AddressPrefix 192.168.1.0/24
Set-AzureRmVirtualNetwork -VirtualNetwork $vnet

#To get Username and password
$cred = Get-Credential

$vm = New-AzureRmVMConfig -VMName myVM -VMSize Standard_D1
$vm = Set-AzureRmVMOperatingSystem -VM $vm -Windows -ComputerName myVM -Credential $cred -ProvisionVMAgent -EnableAutoUpdate
$vmConfig = New-AzureRmVMConfig -VMName myVM -VMSize Standard_DS2 | Set-AzureRmVMOperatingSystem -Windows -ComputerName myVM -Credential $cred | Set-AzureRmVMSourceImage -PublisherName MicrosoftWindowsServer -Offer WindowsServer -Skus 2016-Datacenter -Version latest |  Add-AzureRmVMNetworkInterface -Id $nic
New-AzureRmVM -ResourceGroupName myResourceGroupVM -Location eastus -VM $vmConfig -Verbose

#creating vm config and vm
$vmConfig = New-AzureRmVMConfig -VMName myVM -VMSize Standard_DS2 | ` Set-AzureRmVMOperatingSystem -Windows -ComputerName myVM -Credential $cred | Set-AzureRmVMSourceImage -PublisherName  MicrosoftWindowsServer -Offer WindowsServer -Skus 2016-DataCenter -Version latest | Add-AzureRmVMNetworkInterface -Id $nic.Id
New-AzureRmVM -ResourceGroupName myResourceGroupVM -Location EastUS -VM $vmConfig
Get-AzureRmPublicIpAddress -ResourceGroupName myResourceGroupVM | Select IpAddress


#creating availability set
New-AzureRmResourceGroup -Name ResrAvailSet -Location eastus
New-AzureRmAvailabilitySet -Location eastus -Name myAvailSet1 -ResourceGroupName ResrAvailSet -Sku aligned -PlatformFaultDomainCount 2 -PlatformUpdateDomainCount 2
