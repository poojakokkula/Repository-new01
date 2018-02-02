Login-AzureRmAccount
Get-AzureRmResourceGroup
$resourcegroupname="DBRG"
$servername="serverserver12"
$storagetype="StorageAccessKey"
$storagename="dbstoacc"
$user="pooja"
$password="Rojanagesh@1" 
$pass= ConvertTo-SecureString -AsPlainText $password -Force
$key1=(Get-AzureRmStorageAccountKey  -ResourceGroupName $resourcegroupname -Name $storagename).Value[0]
# to get the databasenames 
$dbnames= Get-AzureRmSqlDatabase -ResourceGroupName $resourcegroupname -ServerName $servername

foreach($dbname in $dbnames)
{
    if($dbname.DatabaseName -ne "master")
    {
        $t=(Get-Date).ToUniversalTime().AddHours(5.5).ToString("ddMMyyyyhhmmss")
        $uri=("https://" +$storagename +".blob.core.windows.net/cont1/" +$dbname.DatabaseName+ + $t +" .bacpac")
        

        $exportRequest= New-AzureRmSqlDatabaseexport -ResourceGroupName $resourcegroupname -ServerName $servername -DatabaseName $dbname.DatabaseName -StorageKeyType StorageAccessKey -StorageKey $key1 -StorageUri $uri -administratorlogin $user -AdministratorLoginPassword $pass 

        $exportStatus = Get-AzureRmSqlDatabaseImportExportStatus -OperationStatusLink $exportRequest.OperationStatusLink
        
        if($exportStatus.Status -eq "InProgress")
        {
             $exportStatus=Get-AzureRmSqlDatabaseImportExportStatus -OperationStatusLink $exportRequest.OperationStatusLink
             write-host "." -ForegroundColor Red -NoNewline
             Start-Sleep -Seconds 4
             write-host $exportStatus.Status
        }
    }

}
        