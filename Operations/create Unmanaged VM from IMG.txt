$location = "eastus"
$rgname = "myResourceGroup123"
New-AzureRmResourceGroup -Name myResourceGroup123 -Location $location

# Create a subnet configuration
$subnetConfig = New-AzureRmVirtualNetworkSubnetConfig -Name mySubnet -AddressPrefix 192.168.1.0/24

# Create a virtual network
$vnet = New-AzureRmVirtualNetwork -ResourceGroupName myResourceGroup -Location $location `
    -Name MYvNET -AddressPrefix 192.168.0.0/16 -Subnet $subnetConfig

# Create a public IP address and specify a DNS name
$pip = New-AzureRmPublicIpAddress -ResourceGroupName myResourceGroup -Location $location `
    -AllocationMethod Static -IdleTimeoutInMinutes 4 -Name "mypublicdns$(Get-Random)"

# Create an inbound network security group rule for port 3389
$nsgRuleRDP = New-AzureRmNetworkSecurityRuleConfig -Name myNetworkSecurityGroupRuleRDP  -Protocol Tcp `
    -Direction Inbound -Priority 1000 -SourceAddressPrefix * -SourcePortRange * -DestinationAddressPrefix * `
    -DestinationPortRange 3389 -Access Allow

# Create an inbound network security group rule for port 80
$nsgRuleWeb = New-AzureRmNetworkSecurityRuleConfig -Name myNetworkSecurityGroupRuleWWW  -Protocol Tcp `
    -Direction Inbound -Priority 1001 -SourceAddressPrefix * -SourcePortRange * -DestinationAddressPrefix * `
    -DestinationPortRange 80 -Access Allow

# Create a network security group
$nsg = New-AzureRmNetworkSecurityGroup -ResourceGroupName myResourceGroup -Location $location `
    -Name myNetworkSecurityGroup -SecurityRules $nsgRuleRDP,$nsgRuleWeb

# Create a virtual network card and associate with public IP address and NSG
$nic = New-AzureRmNetworkInterface -Name myNic -ResourceGroupName myResourceGroup -Location $location `
    -SubnetId $vnet.Subnets[0].Id -PublicIpAddressId $pip.Id -NetworkSecurityGroupId $nsg.Id

# Define a credential object
$cred = Get-Credential

#VM config
$vmsize = "Standard_DS2"
$vmName="myVM" 
$vm = New-AzureRmVMConfig -VMName $vmName -VMSize $vmSize
$pubName = ”MicrosoftWindowsServer”
$offerName = ”WindowsServer”
$skuName = ”2016-Datacenter”
$vm = Set-AzureRmVMOperatingSystem -VM $vm -Windows -ComputerName $vmName -Credential $cred
$vm = Set-AzureRmVMSourceImage -VM $vm -PublisherName $pubName -Offer $offerName -Skus $skuName -Version "latest" 
$vm = Add-AzureRmVMNetworkInterface -VM $vm -Id $NIC.Id 

# Create a new storage account
New-AzureRmStorageAccount -ResourceGroupName "MyResourceGroup" -AccountName "stoaccimg21522356234" -Location $location -SkuName "Standard_LRS"

# Disk setup
$diskName = ”jason-disk”
$storageaccount = "stoaccimg21522356234"
$STA = Get-AzureRmStorageAccount -ResourceGroupName $rgName -Name $storageAccount
$OSDiskUri = $STA.PrimaryEndpoints.Blob.ToString() + "vhds/" + $diskName? + ".vhd"
$vm = Set-AzureRmVMOSDisk -VM $vm -Name $diskName -VhdUri $OSDiskUri -CreateOption fromImage 

# Create the virtual machine
New-AzureRmVM -ResourceGroupName myResourceGroup -Location $location -VM $vm