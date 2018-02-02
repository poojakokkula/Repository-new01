Login-AzureRmAccount

$rgname= "myresr" 
$imageName = "myimage"
$urlOfUploadedImageVhd="https://mystoacc12.blob.core.windows.net/myvhd/vm120171121105134.vhd"

$imageConfig = New-AzureRmImageConfig -Location eastus
$imageConfig = Set-AzureRmImageOsDisk -Image $imageConfig -OsType Windows -OsState Generalized -BlobUri $urlOfUploadedImageVhd
$image = New-AzureRmImage -ImageName $imageName -ResourceGroupName $rgName -Image $imageConfig

#after this use CreateVMUNmanagedIMG