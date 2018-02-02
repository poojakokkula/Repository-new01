$resourcegroupname="DBResrGp"
$storageacc="dbstocc"
$servername="db1server123"
$db=Get-AzureRmSqlDatabase -ResourceGroupName $resourcegroupname -ServerName $servername
foreach($d in $db)
{
    write-host "yes"
    Get-AzureRmStorageAccountKey -ResourceGroupName $resourcegroupname -Name $d
}