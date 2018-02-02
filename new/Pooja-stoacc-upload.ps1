
$storageAccountName= "stoacc1234"
$StorageAccountKey="e6lgOjsktY5f9y3TWJ9plfKTXjsyyZrppymor6vxJGYFL6/H0hSrN7XqlUwtIO6KVYFdwGBK9WCBzuCIU95ZgA=="
$ctx = New-AzureStorageContext -StorageAccountName $StorageAccountName  -StorageAccountKey $StorageAccountKey
$ContainerName = "container01"

$localFileDirectory = "C:\Users\poojako\Desktop\new\"
$files = (Get-ChildItem -Path $localFileDirectory -Recurse).Name

$x= (Get-AzureStorageBlob -Container $ContainerName -Context $ctx).Name

    

ForEach($file in $files) 
 {    
       if($file -notin $x )
          
           {  $localFile = $localFileDirectory+$file
              $BlobName= "webimages"
              Set-AzureStorageBlobContent -Container $ContainerName  -file $localFile -force -Context $ctx
           "File Uploading........"
           }
        else
         {  Write-Host "File already Exist"
        }
    
}   