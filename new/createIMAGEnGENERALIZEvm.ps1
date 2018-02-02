$vmName = "dest_vm"
$rgName = "stoacc2Resr"
$location = "EastUS"
$imageName = "myImage"
Stop-AzureRmVM -ResourceGroupName $rgName -Name $vmName -Force -Verbose
#set status as generalized
Set-AzureRmVm -ResourceGroupName $rgName -Name $vmName -Generalized -Verbose
#get the vm
$vm = Get-AzureRmVM -Name $vmName -ResourceGroupName $rgName -Verbose
#create image config
$image = New-AzureRmImageConfig -Location $location -SourceVirtualMachineId $vm.ID -Verbose
#create an image
New-AzureRmImage -Image $image -ImageName $imageName -ResourceGroupName $rgName -Verbose
