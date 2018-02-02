Login-AzureRmAccount
New-AzureRmSqlDatabase -DatabaseName DB4 -ResourceGroupName DBResrGp -ServerName db1server123


New-AzureRmSqlDatabaseExport -DatabaseName DB4 -ServerName db1server123  -ResourceGroupName DBResrGp -StorageUri https://dbstocc.blob.core.windows.net/conatiner1/DB4.bacpac -StorageKeyType StorageAccessKey -StorageKey tPS7mOJ2nh4CTN1SVmluJVMKaIovixRmjcdPhe1nL4MKkVAl2G/BBFIUp1NeUOD8AoYG/GmfwV43pF8DqXGnhQ== 


$result=Get-AzureRmSqlDatabase -ServerName db1server123 -ResourceGroupName DBResrGp -DatabaseName DB1 | Format-Table -Property status
$result

$v=Get-AzureRmSqlDatabase -ServerName db1server123 -ResourceGroupName DBResrGp
foreach($i in $v){
if($result -eq "online"){
Write-Host "y"
}
else{
Write-Host "n"
}
}

#Get-Help Get-AzureRmBackupContainer -full
#Get-AzureRmStorageAccount -ResourceGroupName DBResrGp -Name dbstocc 

#Get-AzureRMStorageAccount | Select StorageAccountName, Location


Set-AzureRmCurrentStorageAccount -ResourceGroupName DBResrGp -Name dbstocc
Get-AzureStorageBlob -Container conatiner1 

Get-AzureStorageBlobContent -Container conatiner1



