$ResourceGroup = 
$VMs = Find-AzureRmResource -ResourceGroupNameContains $ResourceGroup |  Where-Object {$_.Tags.Name-eq "Autoshutdown" -and $_.Tags.Value -eq "Yes"}
Foreach ($VM in $VMs)
{
$VMStatus = Get-AzureRmVM -ResourceGroupName $ResourceGroup -Name $vm.Name -Status | select -ExpandProperty Statuses | ?{ $_.Code -match "PowerState" } | select -ExpandProperty displaystatus

   if($VMStatus -eq "VM Running")
       {
          Write-Output "status of" $vm.Name "is" """$VMStatus"""
          Stop-AzureRmVM -ResourceGroupName $ResourceGroup -Name $vm.Name -Force
       }
       else
       {
          Write-Output "status of" $vm.Name "is" """$VMStatus"""
       }
}

Get-Azurermvm -Status| Format-Table -Property powerstate

(Get-Date).ToString('hh:mm:ss')

$t=Get-Date -Format T
$t

if($t -eq )




$today = Get-Date
$todayStr = $today.ToString("ddMMMyyyy-HHMMss") 
$todayStr
