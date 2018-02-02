<#$username="pooja.kokkula@valuemomentum.onmicrosoft.com"
$password= ConvertTo-Securestring "Rojanagesh" -AsPlaintext -force
$cred = New-Object System.Management.Automation.PSCredential($username,$password)


Login-AzureRmAccount -Credential $cred
$PSVersionTable#>


Login-AzureRmAccount
New-AzureRmResourceGroup -Name resr -Location southeastasia
New-AzureRmAutomationAccount -ResourceGroupName resr -Name AutoAcc1 -Location southeastasia
Import-AzureRmAutomationRunbook -Path "Downloads\runbookImport1.ps1" -Name runbook1 -Type PowerShell -ResourceGroupName resr -AutomationAccountName AutoAcc1
Select-AzureSubscription -SubscriptionName "Visual Studio Professional"
Remove-AzureAutomationRunbook -Name runbook1 -AutomationAccountName AutoAcc1