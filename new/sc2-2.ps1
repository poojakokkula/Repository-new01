Set-AzureRmCurrentStorageAccount -ResourceGroupName DBResrGp -Name dbstocc
$blob=Get-AzureStorageBlob -Container conatiner1
$blob




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

Get-AzureRmSqlDatabaseImportExportStatus -OperationStatusLink https://management.azure.com/subscriptions/e6f492cb-66f6-4f8b-98e7-1db09dce3b91/resourceGroups/DBResrGp/providers/Microsoft.Sql/servers/db1server123/databases/DB4/importExportOperationResults/7ce08972-45b2-4aaa-b4ad-d6ba3a4b7628?api-version=2014-04-01-Preview



