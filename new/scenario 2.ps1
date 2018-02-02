Get-AzureRmResourceGroup
$resourcegroupname="DBResrGp"
$servername="db1server123"
$storagetype="StorageAccessKey"
$storagename="dbstocc"
$user="pooja"
$password="Rojanagesh@1" 
$pass= ConvertTo-SecureString -AsPlainText $password -Force
$key1=(Get-AzureRmStorageAccountKey  -ResourceGroupName $resourcegroupname -Name $storagename).Value[0]
# to get the databasenames 
#$dbnames= Get-AzureRmSqlDatabase -ResourceGroupName $resourcegroupname -ServerName $servername
$dbnames = "mydb"

foreach($dbname in $dbnames)
{
    if($dbname -ne "master")
    {

        $now = (Get-date).ToUniversalTime().AddHours(5.5).ToString("ddMMyyyyHHmm") 
        $uri=("https://" +$storagename +".blob.core.windows.net/conatiner1/" +$dbname + "_" + $now + ".bacpac")
        

        $exportRequest= New-AzureRmSqlDatabaseexport -ResourceGroupName $resourcegroupname -ServerName $servername -DatabaseName $dbname -StorageKeyType StorageAccessKey -StorageKey $key1 -StorageUri $uri -AdministratorLogin $user -AdministratorLoginPassword $pass

        $exportStatus = Get-AzureRmSqlDatabaseImportExportStatus -OperationStatusLink $exportRequest.OperationStatusLink
        
        while($exportStatus.Status -eq "InProgress")
        {
             $exportStatus = Get-AzureRmSqlDatabaseImportExportStatus -OperationStatusLink $exportRequest.OperationStatusLink
             write-host "." -ForegroundColor Red -NoNewline
             Start-Sleep -Seconds 1
        }
        write-host $exportStatus
    }

}
    
        New-AzureRmSqlDatabaseExport -ResourceGroupName $resourcegroupname -ServerName $servername -DatabaseName db2 -StorageKeyType StorageAccessKey -StorageKey $key1 -StorageUri $uri
        Get-AzureRmSqlDatabaseImportExportStatus